Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F2DB07BFBC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 07:29:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2018 23:29:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,371,1539673200"; d="scan'208";a="119597360"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.21.206])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2018 23:29:35 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 15:29:25 +0800
Message-Id: <20181219072929.5870-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219072929.5870-1-anuj.mittal@intel.com>
References: <20181219072929.5870-1-anuj.mittal@intel.com>
Subject: [PATCH 5/9] harfbuzz: upgrade 2.1.3 -> 2.2.0
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
X-List-Received-Date: Wed, 19 Dec 2018 07:29:35 -0000

For changes, see:

https://cgit.freedesktop.org/harfbuzz/tree/NEWS?h=2.2.0

Remove do_configure_append after the patch to remove pkg.m4 was merged
upstream.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../harfbuzz/{harfbuzz_2.1.3.bb => harfbuzz_2.2.0.bb}  | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.1.3.bb => harfbuzz_2.2.0.bb} (77%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.1.3.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.2.0.bb
similarity index 77%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.1.3.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.2.0.bb
index 235f8d4a3b..3b1e6a8181 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.1.3.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.2.0.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "38b0a17fca5ae38ff54fc22939ded371"
-SRC_URI[sha256sum] = "613264460bb6814c3894e3953225c5357402915853a652d40b4230ce5faf0bee"
+SRC_URI[md5sum] = "d9b8b2bc4d0cdf7f0824f4f0631d264b"
+SRC_URI[sha256sum] = "b7ccfcbd56b970a709e8b9ea9fb46c922c606c2feef8f086fb6a8492e530f810"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
@@ -27,12 +27,6 @@ EXTRA_OECONF = " \
     --without-graphite2 \
 "
 
-do_configure_prepend() {
-    # This is ancient and can get used instead of the patched one we ship,
-    # so delete it. In 1.8.9 this should be removed upstream.
-    rm -f ${S}/m4/pkg.m4
-}
-
 PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
 
 LEAD_SONAME = "libharfbuzz.so"
-- 
2.17.1


