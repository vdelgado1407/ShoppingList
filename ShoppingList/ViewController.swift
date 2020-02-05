//
//  ViewController.swift
//  ShoppingList
//
//  Created by Victor Delgado on 2/3/20.
//  Copyright © 2020 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var items:[item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let item1 = item(name: "Milk")
        let item2 = item(name: "Eggs")
        let item3 = item(name: "Chocolate")
        
        items = [item1,item2,item3]
    }

    @IBAction func whenButtonPressed(_ sender: Any) {
        if let newItemName = itemTextField.text {
            let Item = item(name: newItemName)
            items.append(Item)
            tableView.reloadData()
            itemTextField.text = ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let currentItem = items[indexPath.row]
        cell.textLabel?.text = currentItem.name
        return cell
    }
}

