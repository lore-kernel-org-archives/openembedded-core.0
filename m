Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 5AE347F33D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:51:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 00:51:57 -0800
X-IronPort-AV: E=Sophos;i="5.68,319,1569308400"; d="scan'208";a="196061704"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.67.150])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 00:51:56 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 16:51:44 +0800
Message-Id: <20191118085149.19903-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191118085149.19903-1-anuj.mittal@intel.com>
References: <20191118085149.19903-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] harfbuzz: upgrade 2.6.1 -> 2.6.4
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
X-List-Received-Date: Mon, 18 Nov 2019 08:51:56 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../harfbuzz/{harfbuzz_2.6.1.bb => harfbuzz_2.6.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.6.1.bb => harfbuzz_2.6.4.bb} (92%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb
similarity index 92%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb
index 80ab545e08..ee08c12bee 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e11f5c3149cdec4bb309babb020b32b9 \
                     file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.xz"
-SRC_URI[md5sum] = "89b758a2eb14d56a94406cf914b62388"
-SRC_URI[sha256sum] = "c651fb3faaa338aeb280726837c2384064cdc17ef40539228d88a1260960844f"
+SRC_URI[md5sum] = "2b3a4dfdb3e5e50055f941978944da9f"
+SRC_URI[sha256sum] = "9413b8d96132d699687ef914ebb8c50440efc87b3f775d25856d7ec347c03c12"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.21.0


