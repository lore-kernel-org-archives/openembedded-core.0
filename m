Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 44287738D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 14:19:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 07:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,409,1422950400"; d="scan'208";a="680778134"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2015 07:19:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 14:18:48 +0000
Message-Id: <1956ed9ee04073809806033413a450b234adc85a.1426515313.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/16] devtool: name command line parsers appropriately
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Mar 2015 14:19:12 -0000

No functional changes, just use a unique name for each parser.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 44 ++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index cabf3fe..435878c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1,6 +1,6 @@
 # Development tool - standard commands plugin
 #
-# Copyright (C) 2014 Intel Corporation
+# Copyright (C) 2014-2015 Intel Corporation
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -602,33 +602,33 @@ def register_commands(subparsers, context):
     parser_add.add_argument('--version', '-V', help='Version to use within recipe (PV)')
     parser_add.set_defaults(func=add)
 
-    parser_add = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
+    parser_modify = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
                                        description='Enables modifying the source for an existing recipe',
                                        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
-    parser_add.add_argument('recipename', help='Name for recipe to edit')
-    parser_add.add_argument('srctree', help='Path to external source tree')
-    parser_add.add_argument('--wildcard', '-w', action="store_true", help='Use wildcard for unversioned bbappend')
-    parser_add.add_argument('--extract', '-x', action="store_true", help='Extract source as well')
-    parser_add.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
-    parser_add.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (only when using -x)')
-    parser_add.set_defaults(func=modify)
-
-    parser_add = subparsers.add_parser('extract', help='Extract the source for an existing recipe',
+    parser_modify.add_argument('recipename', help='Name for recipe to edit')
+    parser_modify.add_argument('srctree', help='Path to external source tree')
+    parser_modify.add_argument('--wildcard', '-w', action="store_true", help='Use wildcard for unversioned bbappend')
+    parser_modify.add_argument('--extract', '-x', action="store_true", help='Extract source as well')
+    parser_modify.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
+    parser_modify.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (only when using -x)')
+    parser_modify.set_defaults(func=modify)
+
+    parser_extract = subparsers.add_parser('extract', help='Extract the source for an existing recipe',
                                        description='Extracts the source for an existing recipe',
                                        formatter_class=argparse.ArgumentDefaultsHelpFormatter)
-    parser_add.add_argument('recipename', help='Name for recipe to extract the source for')
-    parser_add.add_argument('srctree', help='Path to where to extract the source tree')
-    parser_add.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout')
-    parser_add.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
-    parser_add.set_defaults(func=extract)
+    parser_extract.add_argument('recipename', help='Name for recipe to extract the source for')
+    parser_extract.add_argument('srctree', help='Path to where to extract the source tree')
+    parser_extract.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout')
+    parser_extract.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
+    parser_extract.set_defaults(func=extract)
 
-    parser_add = subparsers.add_parser('update-recipe', help='Apply changes from external source tree to recipe',
+    parser_update_recipe = subparsers.add_parser('update-recipe', help='Apply changes from external source tree to recipe',
                                        description='Applies changes from external source tree to a recipe (updating/adding/removing patches as necessary, or by updating SRCREV)')
-    parser_add.add_argument('recipename', help='Name of recipe to update')
-    parser_add.add_argument('--mode', '-m', choices=['patch', 'srcrev', 'auto'], default='auto', help='Update mode (where %(metavar)s is %(choices)s; default is %(default)s)', metavar='MODE')
-    parser_add.add_argument('--initial-rev', help='Starting revision for patches')
-    parser_add.add_argument('--no-remove', '-n', action="store_true", help='Don\'t remove patches, only add or update')
-    parser_add.set_defaults(func=update_recipe)
+    parser_update_recipe.add_argument('recipename', help='Name of recipe to update')
+    parser_update_recipe.add_argument('--mode', '-m', choices=['patch', 'srcrev', 'auto'], default='auto', help='Update mode (where %(metavar)s is %(choices)s; default is %(default)s)', metavar='MODE')
+    parser_update_recipe.add_argument('--initial-rev', help='Starting revision for patches')
+    parser_update_recipe.add_argument('--no-remove', '-n', action="store_true", help='Don\'t remove patches, only add or update')
+    parser_update_recipe.set_defaults(func=update_recipe)
 
     parser_status = subparsers.add_parser('status', help='Show workspace status',
                                           description='Lists recipes currently in your workspace and the paths to their respective external source trees',
-- 
1.9.3


