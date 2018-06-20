Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BF9387555A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 14:07:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2018 07:07:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,247,1526367600"; d="scan'208";a="209682363"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 20 Jun 2018 07:07:27 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id DAE9458012D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 07:07:26 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 17:07:22 +0300
Message-Id: <1529503642-7158-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1529503642-7158-1-git-send-email-maxin.john@intel.com>
References: <1529503642-7158-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 5/5] harfbuzz: upgrade 1.7.5 -> 1.8.1
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
X-List-Received-Date: Wed, 20 Jun 2018 14:07:28 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.1.bb}             | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.1.bb} (82%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
similarity index 82%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
index 0a9b029..f8b0056 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "1466ab51fc5aaa6af4065936939cec62"
-SRC_URI[sha256sum] = "84574e1b1f65ca694cb8fb6905309665c0368af18a312357f8ff886ee2f29563"
+SRC_URI[md5sum] = "97cb89c6e2a914c05c8b7e858703885f"
+SRC_URI[sha256sum] = "fbed6392ddb085e45e6090a9f389f72926d0e355f4b0a2ef51d35cf21686df45"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
@@ -27,6 +27,10 @@ EXTRA_OECONF = " \
     --with-glib \
     --without-graphite2 \
 "
+do_install_append() {
+    # Remove unnecessary cmake files
+    rm -rf ${D}${libdir}/cmake
+}
 
 PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
 
-- 
2.4.0


