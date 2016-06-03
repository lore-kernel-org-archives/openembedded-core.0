Return-Path: <elliot.smith@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EF2E977488
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 10:09:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jun 2016 03:09:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994464101"
Received: from nszostek-mobl.ger.corp.intel.com (HELO lp.ger.corp.intel.com)
	([10.252.10.4])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 03:09:30 -0700
From: Elliot Smith <elliot.smith@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 11:09:19 +0100
Message-Id: <1464948559-8237-1-git-send-email-elliot.smith@intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [jethro] toasterconf.json: exclude releases Toaster can't build
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
X-List-Received-Date: Fri, 03 Jun 2016 10:09:33 -0000

Due to changes in master to support Python 3, Toaster is no
longer able to build from master.

Remove references to master and set default release to jethro.

The dizzy release should also be removed, as Toaster jethro
is unable to build using this release.

Signed-off-by: Elliot Smith <elliot.smith@intel.com>
---
 meta/conf/toasterconf.json | 39 ++++++++++++---------------------------
 1 file changed, 12 insertions(+), 27 deletions(-)

diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
index c8e42ef..8a17ee6 100644
--- a/meta/conf/toasterconf.json
+++ b/meta/conf/toasterconf.json
@@ -1,7 +1,7 @@
 {
     "config": {
         "MACHINE"      : "qemux86",
-        "DISTRO"       : "poky",
+        "DISTRO"       : "nodistro",
         "IMAGE_FSTYPES": "ext3 jffs2 tar.bz2",
         "IMAGE_INSTALL_append": "",
         "PACKAGE_CLASSES": "package_rpm",
@@ -12,7 +12,7 @@
             "name": "Local OpenEmbedded",
             "sourcetype": "local",
             "apiurl": "../../",
-            "branches": ["HEAD", "master", "fido", "dizzy"],
+            "branches": ["HEAD", "jethro", "fido"],
             "layers": [
                 {
                     "name": "openembedded-core",
@@ -26,21 +26,21 @@
             "name": "OpenEmbedded",
             "sourcetype": "layerindex",
             "apiurl": "http://layers.openembedded.org/layerindex/api/",
-            "branches": ["master", "fido", "dizzy"]
+            "branches": ["jethro", "fido"]
         },
         {
             "name": "Imported layers",
             "sourcetype": "imported",
             "apiurl": "",
-            "branches": ["master", "fido", "dizzy", "HEAD"]
+            "branches": ["jethro", "fido", "HEAD"]
 
         }
     ],
     "bitbake" : [
         {
-            "name": "master",
+            "name": "jethro",
             "giturl": "git://git.openembedded.org/bitbake",
-            "branch": "master",
+            "branch": "1.28",
             "dirpath": ""
         },
         {
@@ -50,12 +50,6 @@
             "dirpath": ""
         },
         {
-            "name": "dizzy",
-            "giturl": "git://git.openembedded.org/bitbake",
-            "branch": "1.24",
-            "dirpath": ""
-        },
-        {
             "name": "HEAD",
             "giturl": "git://git.openembedded.org/bitbake",
             "branch": "HEAD",
@@ -63,17 +57,17 @@
         }
     ],
 
-    "defaultrelease": "master",
+    "defaultrelease": "jethro",
 
     "releases": [
         {
-            "name": "master",
-            "description": "OpenEmbedded master",
-            "bitbake": "master",
-            "branch": "master",
+            "name": "jethro",
+            "description": "OpenEmbedded Jethro",
+            "bitbake": "jethro",
+            "branch": "jethro",
             "defaultlayers": [ "openembedded-core" ],
             "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
-            "helptext": "Toaster will run your builds using the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/\">OpenEmbedded master</a> branch, where active development takes place. This is not a stable branch, so your builds might not work as expected."
+            "helptext": "Toaster will run your builds using the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/?h=jethro\">OpenEmbedded \"Jethro\"</a> branch"
         },
         {
             "name": "fido",
@@ -85,15 +79,6 @@
             "helptext": "Toaster will run your builds with the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/?h=fido\">OpenEmbedded \"Fido\"</a> branch"
         },
         {
-            "name": "dizzy",
-            "description": "OpenEmbedded Dizzy",
-            "bitbake": "dizzy",
-            "branch": "dizzy",
-            "defaultlayers": [ "openembedded-core" ],
-            "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
-            "helptext": "Toaster will run your builds with the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/?h=dizzy\">OpenEmbedded \"Dizzy\"</a> branch"
-        },
-        {
             "name": "local",
             "description": "Local OpenEmbedded",
             "bitbake": "HEAD",
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


