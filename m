Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B200F60593
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 17:01:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2013 10:01:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,819,1367996400"; d="scan'208";a="357827041"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.110])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2013 10:01:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2013 10:01:00 -0700
Message-Id: <1375722060-12906-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH v3] libpng: package new tools into a libpng-tools package
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
X-List-Received-Date: Mon, 05 Aug 2013 17:01:44 -0000

These tools are useful for fixing older or corrupted
PNG files.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.3.bb b/meta/recipes-multimedia/libpng/libpng_1.6.3.bb
index 11e735c..bf84b3c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.3.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.3.bb
@@ -19,4 +19,8 @@ inherit autotools binconfig pkgconfig
 # Work around missing symbols
 EXTRA_OECONF_append_arm = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
 
+PACKAGES =+ "${PN}-tools"
+
+FILES_${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.1.4


