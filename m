Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5336678538
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:58:13 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:58:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402284"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:58:13 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:50 +0200
Message-Id: <20171114145754.9643-23-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 23/27] harfbuzz: update to 1.7.0
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
X-List-Received-Date: Tue, 14 Nov 2017 14:58:13 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../harfbuzz/{harfbuzz_1.4.8.bb => harfbuzz_1.7.0.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.4.8.bb => harfbuzz_1.7.0.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.8.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.0.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.4.8.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.7.0.bb
index 4f5e5a37824..c45ec84b132 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.8.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.0.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "d1aa446e1e65717311c15d9ac0cf31ee"
-SRC_URI[sha256sum] = "ccec4930ff0bb2d0c40aee203075447954b64a8c2695202413cc5e428c907131"
+SRC_URI[md5sum] = "7e70e68ade0ed79719932b38c2130f0a"
+SRC_URI[sha256sum] = "042742d6ec67bc6719b69cf38a3fba24fbd120e207e3fdc18530dc730fb6a029"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.15.0


