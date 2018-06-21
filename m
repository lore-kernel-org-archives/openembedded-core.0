Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id F07F1787B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 08:34:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jun 2018 01:34:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,251,1526367600"; d="scan'208";a="239033171"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 21 Jun 2018 01:34:19 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id B834D580144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 01:34:18 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jun 2018 11:34:20 +0300
Message-Id: <1529570060-22244-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] harfbuzz: upgrade 1.7.5 -> 1.8.1
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
X-List-Received-Date: Thu, 21 Jun 2018 08:34:19 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.1.bb}                | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.1.bb} (84%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
similarity index 84%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
index 0a9b029..a42bf8c 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "1466ab51fc5aaa6af4065936939cec62"
-SRC_URI[sha256sum] = "84574e1b1f65ca694cb8fb6905309665c0368af18a312357f8ff886ee2f29563"
+SRC_URI[md5sum] = "97cb89c6e2a914c05c8b7e858703885f"
+SRC_URI[sha256sum] = "fbed6392ddb085e45e6090a9f389f72926d0e355f4b0a2ef51d35cf21686df45"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
@@ -35,5 +35,6 @@ FILES_${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
                        ${libdir}/libharfbuzz-icu.so \
                        ${libdir}/pkgconfig/harfbuzz-icu.pc \
 "
+FILES_${PN}-dev += "${libdir}/cmake/harfbuzz/harfbuzz-config.cmake"
 
 BBCLASSEXTEND = "native"
-- 
2.4.0


