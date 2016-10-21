Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4693371D18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:22:24 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Oct 2016 03:22:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,375,1473145200"; d="scan'208";a="182256722"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2016 03:22:26 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 13:22:06 +0300
Message-Id: <960a29f79b3bf12cca47175f9168aef902fe7709.1477032779.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
References: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477032779.git.jussi.kukkonen@intel.com>
References: <cover.1477032779.git.jussi.kukkonen@intel.com>
Subject: [PATCH 08/15] libxtst: Upgrade 1.2.2 -> 1.2.3
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
X-List-Received-Date: Fri, 21 Oct 2016 10:22:24 -0000

Tiny bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-graphics/xorg-lib/{libxtst_1.2.2.bb => libxtst_1.2.3.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.2.bb => libxtst_1.2.3.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
rename to meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
index 1b0bcf3..5717fa5 100644
--- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
@@ -16,5 +16,6 @@ PE = "1"
 
 XORG_PN = "libXtst"
 
-SRC_URI[md5sum] = "25c6b366ac3dc7a12c5d79816ce96a59"
-SRC_URI[sha256sum] = "ef0a7ffd577e5f1a25b1663b375679529663a1880151beaa73e9186c8309f6d9"
+SRC_URI[md5sum] = "ef8c2c1d16a00bd95b9fdcef63b8a2ca"
+SRC_URI[sha256sum] = "4655498a1b8e844e3d6f21f3b2c4e2b571effb5fd83199d428a6ba7ea4bf5204"
+
-- 
2.1.4


