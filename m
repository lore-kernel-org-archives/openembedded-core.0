Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 5F30C6AF5A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Aug 2013 22:14:40 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Aug 2013 15:14:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,814,1367996400"; d="scan'208";a="277586459"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.110])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Aug 2013 15:14:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Aug 2013 15:14:40 -0700
Message-Id: <1375654480-9120-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] libpng: remove two un-necessary binaries
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
X-List-Received-Date: Sun, 04 Aug 2013 22:14:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.3.bb b/meta/recipes-multimedia/libpng/libpng_1.6.3.bb
index 11e735c..5d23a18 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.3.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.3.bb
@@ -19,4 +19,8 @@ inherit autotools binconfig pkgconfig
 # Work around missing symbols
 EXTRA_OECONF_append_arm = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
 
+do_install_append() {
+	rm ${D}/usr/bin/png-fix-itxt ${D}/usr/bin/pngfix
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.1.4


