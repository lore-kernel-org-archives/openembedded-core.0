Return-Path: <elliot.smith@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1F06011F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 10:47:28 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 04 Feb 2016 02:47:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,395,1449561600"; d="scan'208";a="42282837"
Received: from alterhar-mobl.ger.corp.intel.com (HELO lp.ger.corp.intel.com)
	([10.252.6.178])
	by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2016 02:47:28 -0800
From: Elliot Smith <elliot.smith@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 10:47:24 +0000
Message-Id: <1454582844-11208-1-git-send-email-elliot.smith@intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] toaster: update the openembedded-core toaster configuration file
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
X-List-Received-Date: Thu, 04 Feb 2016 10:47:29 -0000

From: Belen Barros Pena <belen.barros.pena@intel.com>

It looks like the master branch will no longer build with the Fido
release, so remove all references to fido and make sure that the file
sets up local, master and jethro releases.

Signed-off-by: Belen Barros Pena <belen.barros.pena@intel.com>
---
 meta/conf/toasterconf.json | 35 ++++++++++-------------------------
 1 file changed, 10 insertions(+), 25 deletions(-)

diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
index 1987793..2f451f3 100644
--- a/meta/conf/toasterconf.json
+++ b/meta/conf/toasterconf.json
@@ -11,7 +11,7 @@
             "name": "Local OpenEmbedded",
             "sourcetype": "local",
             "apiurl": "../../",
-            "branches": ["HEAD", "master", "fido", "dizzy"],
+            "branches": ["HEAD", "master", "jethro"],
             "layers": [
                 {
                     "name": "openembedded-core",
@@ -25,13 +25,13 @@
             "name": "OpenEmbedded",
             "sourcetype": "layerindex",
             "apiurl": "http://layers.openembedded.org/layerindex/api/",
-            "branches": ["master", "fido", "dizzy"]
+            "branches": ["master", "jethro"]
         },
         {
             "name": "Imported layers",
             "sourcetype": "imported",
             "apiurl": "",
-            "branches": ["master", "fido", "dizzy", "HEAD"]
+            "branches": ["master", "jethro", "HEAD"]
 
         }
     ],
@@ -43,15 +43,9 @@
             "dirpath": ""
         },
         {
-            "name": "fido",
+            "name": "jethro",
             "giturl": "git://git.openembedded.org/bitbake",
-            "branch": "1.26",
-            "dirpath": ""
-        },
-        {
-            "name": "dizzy",
-            "giturl": "git://git.openembedded.org/bitbake",
-            "branch": "1.24",
+            "branch": "1.28",
             "dirpath": ""
         },
         {
@@ -75,22 +69,13 @@
             "helptext": "Toaster will run your builds using the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/\">OpenEmbedded master</a> branch, where active development takes place. This is not a stable branch, so your builds might not work as expected."
         },
         {
-            "name": "fido",
-            "description": "OpenEmbedded Fido",
-            "bitbake": "fido",
-            "branch": "fido",
-            "defaultlayers": [ "openembedded-core" ],
-            "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
-            "helptext": "Toaster will run your builds with the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/?h=fido\">OpenEmbedded \"Fido\"</a> branch"
-        },
-        {
-            "name": "dizzy",
-            "description": "OpenEmbedded Dizzy",
-            "bitbake": "dizzy",
-            "branch": "dizzy",
+            "name": "jethro",
+            "description": "OpenEmbedded Jethro",
+            "bitbake": "jethro",
+            "branch": "jethro",
             "defaultlayers": [ "openembedded-core" ],
             "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
-            "helptext": "Toaster will run your builds with the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/?h=dizzy\">OpenEmbedded \"Dizzy\"</a> branch"
+            "helptext": "Toaster will run your builds with the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/?h=jethro\">OpenEmbedded \"Jethro\"</a> branch"
         },
         {
             "name": "local",
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


