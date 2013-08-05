Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF286B0AC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 05:12:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Aug 2013 22:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,816,1367996400"; d="scan'208";a="381275253"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.110])
	by fmsmga002.fm.intel.com with ESMTP; 04 Aug 2013 22:12:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Aug 2013 22:12:01 -0700
Message-Id: <1375679521-16328-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH v2] libpng: remove two un-necessary binaries
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
X-List-Received-Date: Mon, 05 Aug 2013 05:12:01 -0000

Used fixed path the first time and -native had issues, fixed with bindir
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.3.bb b/meta/recipes-multimedia/libpng/libpng_1.6.3.bb
index 11e735c..3506483 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.3.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.3.bb
@@ -19,4 +19,8 @@ inherit autotools binconfig pkgconfig
 # Work around missing symbols
 EXTRA_OECONF_append_arm = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
 
+do_install_append() {
+	rm ${D}${bindir}/png-fix-itxt ${D}${bindir}/pngfix
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.1.4


