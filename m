Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0A7A271D18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:22:23 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Oct 2016 03:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,375,1473145200"; d="scan'208";a="182256717"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2016 03:22:25 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 13:22:05 +0300
Message-Id: <8ab2fc3194120ac8421a74d20007f3c90fd8594e.1477032779.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
References: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477032779.git.jussi.kukkonen@intel.com>
References: <cover.1477032779.git.jussi.kukkonen@intel.com>
Subject: [PATCH 07/15] libxv: Upgrade 1.0.10 -> 1.0.11
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
X-List-Received-Date: Fri, 21 Oct 2016 10:22:23 -0000

Tiny bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-lib/{libxv_1.0.10.bb => libxv_1.0.11.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxv_1.0.10.bb => libxv_1.0.11.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-lib/libxv_1.0.10.bb b/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-lib/libxv_1.0.10.bb
rename to meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb
index f02b8b6..a226c27 100644
--- a/meta/recipes-graphics/xorg-lib/libxv_1.0.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libxv_1.0.11.bb
@@ -14,5 +14,6 @@ DEPENDS += "libxext videoproto"
 
 XORG_PN = "libXv"
 
-SRC_URI[md5sum] = "e0af49d7d758b990e6fef629722d4aca"
-SRC_URI[sha256sum] = "55fe92f8686ce8612e2c1bfaf58c057715534419da700bda8d517b1d97914525"
+SRC_URI[md5sum] = "210b6ef30dda2256d54763136faa37b9"
+SRC_URI[sha256sum] = "d26c13eac99ac4504c532e8e76a1c8e4bd526471eb8a0a4ff2a88db60cb0b088"
+
-- 
2.1.4


