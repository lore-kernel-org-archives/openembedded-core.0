Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D684779F3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 05:48:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Feb 2019 21:49:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,367,1544515200"; d="scan'208";a="144143789"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.114])
	by fmsmga004.fm.intel.com with ESMTP; 13 Feb 2019 21:49:00 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Feb 2019 13:48:55 +0800
Message-Id: <20190214054857.18876-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190214054857.18876-1-anuj.mittal@intel.com>
References: <20190214054857.18876-1-anuj.mittal@intel.com>
Subject: [PATCH 2/4] harfbuzz: upgrade 2.2.0 -> 2.3.1
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
X-List-Received-Date: Thu, 14 Feb 2019 05:49:00 -0000

For changes, see:

https://github.com/harfbuzz/harfbuzz/releases

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../harfbuzz/{harfbuzz_2.2.0.bb => harfbuzz_2.3.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.2.0.bb => harfbuzz_2.3.1.bb} (89%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.2.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.3.1.bb
similarity index 89%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.2.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.3.1.bb
index b62082f53d..4b292d8ea9 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.2.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.3.1.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "d9b8b2bc4d0cdf7f0824f4f0631d264b"
-SRC_URI[sha256sum] = "b7ccfcbd56b970a709e8b9ea9fb46c922c606c2feef8f086fb6a8492e530f810"
+SRC_URI[md5sum] = "531de9df7c8a5405dd9c6a873fcee8c2"
+SRC_URI[sha256sum] = "f205699d5b91374008d6f8e36c59e419ae2d9a7bb8c5d9f34041b9a5abcae468"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.17.1


