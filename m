Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6571A77CFB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:23:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 05:23:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,384,1496127600"; d="scan'208";a="113492341"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 20 Jul 2017 05:23:23 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id BFB615808F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 05:23:22 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 15:22:35 +0300
Message-Id: <1500553355-17577-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] bluez5: upgrade to 5.46
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
X-List-Received-Date: Thu, 20 Jul 2017 12:23:22 -0000

5.45 -> 5.46

This includes the new testing utility "advtest"

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.45.bb => bluez5_5.46.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.45.bb => bluez5_5.46.bb} (90%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.45.bb b/meta/recipes-connectivity/bluez5/bluez5_5.46.bb
similarity index 90%
rename from meta/recipes-connectivity/bluez5/bluez5_5.45.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.46.bb
index d5f516c..e1f8587 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.45.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.46.bb
@@ -2,8 +2,8 @@ require bluez5.inc
 
 REQUIRED_DISTRO_FEATURES = "bluez5"
 
-SRC_URI[md5sum] = "20d936917afc7e1ffa091f5213081c55"
-SRC_URI[sha256sum] = "4cacb00703a6bc149cb09502257d321597d43952374a16f3558766ffa85364e9"
+SRC_URI[md5sum] = "913f35d6fa4ca5772c53adb936bf1947"
+SRC_URI[sha256sum] = "ddab3d3837c1afb8ae228a94ba17709a4650bd4db24211b6771ab735c8908e28"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
@@ -54,6 +54,7 @@ NOINST_TOOLS_BT ?= " \
     tools/mcaptest \
     tools/cltest \
     tools/oobtest \
+    tools/advtest \
     tools/seq2bseq \
     tools/nokfw \
     tools/create-image \
-- 
2.4.0


