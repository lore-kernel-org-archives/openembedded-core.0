Return-Path: <elliot.smith@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 92BD7774E4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 10:52:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jun 2016 03:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994482290"
Received: from nszostek-mobl.ger.corp.intel.com (HELO lp.ger.corp.intel.com)
	([10.252.10.4])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 03:52:49 -0700
From: Elliot Smith <elliot.smith@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 11:52:38 +0100
Message-Id: <1464951158-11523-1-git-send-email-elliot.smith@intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [krogoth] toasterconf.json: exclude releases Toaster can't build
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
X-List-Received-Date: Fri, 03 Jun 2016 10:52:50 -0000

Due to changes in master to support Python 3, Toaster is no
longer able to build from master.

Remove references to master and set default release to krogoth.

Signed-off-by: Elliot Smith <elliot.smith@intel.com>
---
 meta/conf/toasterconf.json | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
index c27880e..8c80eed 100644
--- a/meta/conf/toasterconf.json
+++ b/meta/conf/toasterconf.json
@@ -13,7 +13,7 @@
             "name": "Local OpenEmbedded",
             "sourcetype": "local",
             "apiurl": "../../",
-            "branches": ["HEAD", "master", "jethro", "krogoth"],
+            "branches": ["HEAD", "jethro", "krogoth"],
             "layers": [
                 {
                     "name": "openembedded-core",
@@ -27,24 +27,18 @@
             "name": "OpenEmbedded",
             "sourcetype": "layerindex",
             "apiurl": "http://layers.openembedded.org/layerindex/api/",
-            "branches": ["master", "jethro", "krogoth"]
+            "branches": ["jethro", "krogoth"]
         },
         {
             "name": "Imported layers",
             "sourcetype": "imported",
             "apiurl": "",
-            "branches": ["master", "jethro", "krogoth", "HEAD"]
+            "branches": ["jethro", "krogoth", "HEAD"]
 
         }
     ],
     "bitbake" : [
         {
-            "name": "master",
-            "giturl": "git://git.openembedded.org/bitbake",
-            "branch": "master",
-            "dirpath": ""
-        },
-        {
             "name": "jethro",
             "giturl": "git://git.openembedded.org/bitbake",
             "branch": "1.28",
@@ -64,19 +58,10 @@
         }
     ],
 
-    "defaultrelease": "master",
+    "defaultrelease": "krogoth",
 
     "releases": [
         {
-            "name": "master",
-            "description": "OpenEmbedded master",
-            "bitbake": "master",
-            "branch": "master",
-            "defaultlayers": [ "openembedded-core" ],
-            "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
-            "helptext": "Toaster will run your builds using the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/\">OpenEmbedded master</a> branch, where active development takes place. This is not a stable branch, so your builds might not work as expected."
-        },
-        {
             "name": "jethro",
             "description": "OpenEmbedded Jethro",
             "bitbake": "jethro",
-- 
1.9.3

---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


