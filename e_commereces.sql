CREATE DATABASE e_commerce;
USE e_commerce;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    signup_date DATE
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO customers VALUES
(1,'Amit','Delhi','2024-01-05'),
(2,'Riya','Mumbai','2024-01-10'),
(3,'Karan','Delhi','2024-01-15'),
(4,'Sneha','Bangalore','2024-02-01'),
(5,'Rahul','Chennai','2024-02-10'),
(6,'Priya','Mumbai','2024-02-18'),
(7,'Ankit','Delhi','2024-03-01'),
(8,'Meena','Bangalore','2024-03-05'),
(9,'Vikas','Pune','2024-03-10'),
(10,'Neha','Chennai','2024-03-15'),
(11,'Arjun','Delhi','2024-04-01'),
(12,'Simran','Mumbai','2024-04-05'),
(13,'Rohit','Pune','2024-04-10'),
(14,'Tina','Bangalore','2024-04-15'),
(15,'Mohit','Chennai','2024-05-01'),
(16,'Pooja','Delhi','2024-05-05'),
(17,'Sahil','Mumbai','2024-05-10'),
(18,'Kavya','Pune','2024-05-15'),
(19,'Nikhil','Chennai','2024-06-01'),
(20,'Isha','Delhi','2024-06-05');
INSERT INTO products VALUES
(1,'Laptop','Electronics',60000),
(2,'Mobile','Electronics',30000),
(3,'Headphones','Electronics',2000),
(4,'Shoes','Fashion',4000),
(5,'T-shirt','Fashion',1000),
(6,'Jeans','Fashion',2500),
(7,'Watch','Accessories',5000),
(8,'Bag','Accessories',3500),
(9,'Chair','Furniture',7000),
(10,'Table','Furniture',12000),
(11,'Keyboard','Electronics',1500),
(12,'Mouse','Electronics',800),
(13,'Jacket','Fashion',4500),
(14,'Sofa','Furniture',25000),
(15,'Lamp','Furniture',2000);
INSERT INTO orders VALUES
(1,1,1,1,'2024-06-01','Completed'),
(2,2,2,2,'2024-06-02','Completed'),
(3,3,3,3,'2024-06-03','Cancelled'),
(4,4,4,2,'2024-06-04','Completed'),
(5,5,5,4,'2024-06-05','Completed'),
(6,6,6,1,'2024-06-06','Completed'),
(7,7,7,2,'2024-06-07','Cancelled'),
(8,8,8,3,'2024-06-08','Completed'),
(9,9,9,1,'2024-06-09','Completed'),
(10,10,10,1,'2024-06-10','Completed'),
(11,11,11,5,'2024-06-11','Completed'),
(12,12,12,4,'2024-06-12','Completed'),
(13,13,13,2,'2024-06-13','Completed'),
(14,14,14,1,'2024-06-14','Cancelled'),
(15,15,15,3,'2024-06-15','Completed'),
(16,16,1,1,'2024-06-16','Completed'),
(17,17,2,1,'2024-06-17','Completed'),
(18,18,3,2,'2024-06-18','Completed'),
(19,19,4,2,'2024-06-19','Completed'),
(20,20,5,3,'2024-06-20','Completed'),

-- repeat pattern different dates & combinations

(21,1,2,1,'2024-07-01','Completed'),
(22,2,3,2,'2024-07-02','Completed'),
(23,3,4,1,'2024-07-03','Completed'),
(24,4,5,5,'2024-07-04','Completed'),
(25,5,6,2,'2024-07-05','Cancelled'),
(26,6,7,3,'2024-07-06','Completed'),
(27,7,8,2,'2024-07-07','Completed'),
(28,8,9,1,'2024-07-08','Completed'),
(29,9,10,1,'2024-07-09','Completed'),
(30,10,11,4,'2024-07-10','Completed'),

(31,11,12,3,'2024-07-11','Completed'),
(32,12,13,2,'2024-07-12','Completed'),
(33,13,14,1,'2024-07-13','Completed'),
(34,14,15,3,'2024-07-14','Completed'),
(35,15,1,1,'2024-07-15','Completed'),
(36,16,2,2,'2024-07-16','Cancelled'),
(37,17,3,2,'2024-07-17','Completed'),
(38,18,4,1,'2024-07-18','Completed'),
(39,19,5,4,'2024-07-19','Completed'),
(40,20,6,2,'2024-07-20','Completed');

-- 1️⃣ Total Revenue
SELECT SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN customers c
ON c.customer_id = o.customer_id
JOIN products p
ON p.product_id = o.product_id;
-- 2️⃣ City Wise Revenue
SELECT c.city,
       SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN customers c
ON c.customer_id = o.customer_id
JOIN products p
ON p.product_id = o.product_id
GROUP BY c.city
ORDER BY total_revenue DESC;

-- 3️⃣ Category Wise Revenue
SELECT p.category,
       SUM(p.price * o.quantity) AS total_revenue
FROM orders o
JOIN customers c
ON c.customer_id = o.customer_id
JOIN products p
ON p.product_id = o.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;
SELECT 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.quantity,
    o.order_date,
    o.status,
    p.product_name,
    p.category,
    p.price
FROM customers c
INNER JOIN orders o
    ON o.customer_id = c.customer_id
INNER JOIN products p
    ON p.product_id = o.product_id;
