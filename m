Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8EAC6785C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:00:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 10 Nov 2017 04:00:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,374,1505804400"; 
   d="scan'208";a="535791"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Nov 2017 04:00:15 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id B34265802D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 04:00:14 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Nov 2017 14:00:23 +0200
Message-Id: <1510315228-24186-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
References: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/7] harfbuzz: upgrade to 1.6.3
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
X-List-Received-Date: Fri, 10 Nov 2017 12:00:14 -0000

1.4.8 -> 1.6.3

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../harfbuzz/{harfbuzz_1.4.8.bb => harfbuzz_1.6.3.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.4.8.bb => harfbuzz_1.6.3.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.8.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.6.3.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.4.8.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.6.3.bb
index 4f5e5a3..3cd5924 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.4.8.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.6.3.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "d1aa446e1e65717311c15d9ac0cf31ee"
-SRC_URI[sha256sum] = "ccec4930ff0bb2d0c40aee203075447954b64a8c2695202413cc5e428c907131"
+SRC_URI[md5sum] = "032281c42a5df6d16b69ca6ec3b09bd4"
+SRC_URI[sha256sum] = "e31eb367beb61a9399d2c78b51c225ab2b1cbd46f364f2d80d97bb422b44101a"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-- 
2.4.0


