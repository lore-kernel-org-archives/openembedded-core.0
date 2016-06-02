Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C2A187740D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:13:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2016 03:14:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114724092"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 03:14:00 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 412646A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 04:01:28 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:12:58 +0300
Message-Id: <453e3bcc22a0f73d252a1c2175c35b1a78ebaf74.1464861910.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 12/16] engine: python3: replace iteritems() -> items()
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
X-List-Received-Date: Thu, 02 Jun 2016 10:14:00 -0000

Used items() as iteritems() doesn't exist in python 3.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/bsp/engine.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/bsp/engine.py b/scripts/lib/bsp/engine.py
index 2b87d33..3ed90fa 100644
--- a/scripts/lib/bsp/engine.py
+++ b/scripts/lib/bsp/engine.py
@@ -1385,7 +1385,7 @@ def gen_supplied_property_vals(properties, program_lines):
     Generate user-specified entries for input values instead of
     generating input prompts.
     """
-    for name, val in properties.iteritems():
+    for name, val in properties.items():
         program_line = name + " = \"" + val + "\""
         program_lines.append(program_line)
 
@@ -1621,7 +1621,7 @@ def print_dict(items, indent = 0):
     """
     Print the values in a possibly nested dictionary.
     """
-    for key, val in items.iteritems():
+    for key, val in items.items():
         print("    "*indent + "\"%s\" :" % key)
         if type(val) == dict:
             print("{")
@@ -1654,7 +1654,7 @@ def get_properties(input_lines):
         props = line.props
         item = {}
         name = props["name"]
-        for key, val in props.items():
+        for key, val props.items():
             if not key == "name":
                 item[key] = val
         properties[name] = item
-- 
2.1.4


