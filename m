Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E936C7C4DB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 03:32:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Aug 2019 20:32:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,348,1559545200"; d="scan'208";a="197836862"
Received: from anmitta2-mobl1.png.intel.com ([172.30.199.133])
	by fmsmga004.fm.intel.com with ESMTP; 04 Aug 2019 20:32:23 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2019 11:32:18 +0800
Message-Id: <20190805033218.6750-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805033218.6750-1-anuj.mittal@intel.com>
References: <20190805033218.6750-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] harfbuzz: upgrade 2.4.0 -> 2.5.3
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
X-List-Received-Date: Mon, 05 Aug 2019 03:32:23 -0000
Content-Transfer-Encoding: 8bit

License-Update: Copyright years added, and point to correct source file.

For changes in this version, see:
https://github.com/harfbuzz/harfbuzz/blob/2.5.3/NEWS

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../harfbuzz/{harfbuzz_2.4.0.bb => harfbuzz_2.5.3.bb} | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.4.0.bb => harfbuzz_2.5.3.bb} (75%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.4.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.5.3.bb
similarity index 75%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.4.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.5.3.bb
index 4691d16df8..a90ff52255 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.4.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.5.3.bb
@@ -4,15 +4,14 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/HarfBuzz"
 BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=HarfBuzz"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
-                    file://src/hb-ucdn/COPYING;md5=994ba0f1295f15b4bda4999a5bbeddef \
-"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e11f5c3149cdec4bb309babb020b32b9 \
+                    file://src/hb-ucd.cc;md5=343f1797944de49ab2b5f5cf3126d3f2"
 
 DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
-SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "49f111f9b52ae3d9b31c1a3631a320bd"
-SRC_URI[sha256sum] = "b470eff9dd5b596edf078596b46a1f83c179449f051a469430afc15869db336f"
+SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.xz"
+SRC_URI[md5sum] = "29a310e74a90b4e4f6d62f3e74a571e5"
+SRC_URI[sha256sum] = "fed00dc797b7ba3ca943225f0a854baaed4c1640fff8a31d455cd3b5caec855c"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.21.0


