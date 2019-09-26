SELECT p.first_name, p.last_name, COUNT(distinct o.id) as total_orders, SUM(oi.quantity) as total_items_bought, SUM(oi.quantity * (i.price - oi.discount)) as total_money_spent
FROM ((person p LEFT JOIN `order` o on p.id = o.person_id) 
      LEFT JOIN order_item oi on o.id = oi.order_id)
      LEFT JOIN item i on oi.item_id = i.id
GROUP BY first_name, last_name DESC