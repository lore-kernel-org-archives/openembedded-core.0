Return-Path: <elliot.smith@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3858077576
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 13:59:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jun 2016 06:59:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,412,1459839600"; d="scan'208";a="990403194"
Received: from nszostek-mobl.ger.corp.intel.com (HELO lp.ger.corp.intel.com)
	([10.252.10.4])
	by orsmga002.jf.intel.com with ESMTP; 03 Jun 2016 06:59:56 -0700
From: Elliot Smith <elliot.smith@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 14:59:26 +0100
Message-Id: <1464962366-15487-1-git-send-email-elliot.smith@intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] toasterconf.json: exclude releases Toaster can't build
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
X-List-Received-Date: Fri, 03 Jun 2016 13:59:57 -0000

Due to the switch to Python 3, Toaster master can only build
with master and not with earlier releases.

Make master the default release for projects and remove previous
releases from configuration.

Signed-off-by: Elliot Smith <elliot.smith@intel.com>
---
 meta/conf/toasterconf.json | 36 +++---------------------------------
 1 file changed, 3 insertions(+), 33 deletions(-)

diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
index c27880e..796125b 100644
--- a/meta/conf/toasterconf.json
+++ b/meta/conf/toasterconf.json
@@ -13,7 +13,7 @@
             "name": "Local OpenEmbedded",
             "sourcetype": "local",
             "apiurl": "../../",
-            "branches": ["HEAD", "master", "jethro", "krogoth"],
+            "branches": ["HEAD", "master"],
             "layers": [
                 {
                     "name": "openembedded-core",
@@ -27,13 +27,13 @@
             "name": "OpenEmbedded",
             "sourcetype": "layerindex",
             "apiurl": "http://layers.openembedded.org/layerindex/api/",
-            "branches": ["master", "jethro", "krogoth"]
+            "branches": ["master"]
         },
         {
             "name": "Imported layers",
             "sourcetype": "imported",
             "apiurl": "",
-            "branches": ["master", "jethro", "krogoth", "HEAD"]
+            "branches": ["master", "HEAD"]
 
         }
     ],
@@ -45,18 +45,6 @@
             "dirpath": ""
         },
         {
-            "name": "jethro",
-            "giturl": "git://git.openembedded.org/bitbake",
-            "branch": "1.28",
-            "dirpath": ""
-        },
-        {
-            "name": "krogoth",
-            "giturl": "git://git.openembedded.org/bitbake",
-            "branch": "1.30",
-            "dirpath": ""
-        },
-        {
             "name": "HEAD",
             "giturl": "git://git.openembedded.org/bitbake",
             "branch": "HEAD",
@@ -77,24 +65,6 @@
             "helptext": "Toaster will run your builds using the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/\">OpenEmbedded master</a> branch, where active development takes place. This is not a stable branch, so your builds might not work as expected."
         },
         {
-            "name": "jethro",
-            "description": "OpenEmbedded Jethro",
-            "bitbake": "jethro",
-            "branch": "jethro",
-            "defaultlayers": [ "openembedded-core" ],
-            "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
-            "helptext": "Toaster will run your builds with the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/?h=jethro\">OpenEmbedded \"Jethro\"</a> branch"
-        },
-        {
-            "name": "krogoth",
-            "description": "OpenEmbedded Krogoth",
-            "bitbake": "krogoth",
-            "branch": "krogoth",
-            "defaultlayers": [ "openembedded-core" ],
-            "layersourcepriority": { "Imported layers": 99, "Local OpenEmbedded" : 10, "OpenEmbedded" :  0 },
-            "helptext": "Toaster will run your builds with the tip of the <a href=\"http://cgit.openembedded.org/openembedded-core/log/?h=krogoth\">OpenEmbedded \"Krogoth\"</a> branch"
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


