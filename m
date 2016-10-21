Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 83CFA71CB2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:22:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Oct 2016 03:22:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,375,1473145200"; d="scan'208";a="182256736"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2016 03:22:27 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 13:22:07 +0300
Message-Id: <c2ad2093023a5e56a1c05b19d2b06228a6b4c768.1477032779.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
References: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477032779.git.jussi.kukkonen@intel.com>
References: <cover.1477032779.git.jussi.kukkonen@intel.com>
Subject: [PATCH 09/15] libxrender: Upgrade 0.9.9 -> 0.9.10
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
X-List-Received-Date: Fri, 21 Oct 2016 10:22:25 -0000

Tiny bug fix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-lib/{libxrender_0.9.9.bb => libxrender_0.9.10.bb}           | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxrender_0.9.9.bb => libxrender_0.9.10.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrender_0.9.9.bb b/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/libxrender_0.9.9.bb
rename to meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb
index 44cb2e0..92b3102 100644
--- a/meta/recipes-graphics/xorg-lib/libxrender_0.9.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb
@@ -19,5 +19,6 @@ XORG_PN = "libXrender"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "5db92962b124ca3a8147daae4adbd622"
-SRC_URI[sha256sum] = "fc2fe57980a14092426dffcd1f2d9de0987b9d40adea663bd70d6342c0e9be1a"
+SRC_URI[md5sum] = "802179a76bded0b658f4e9ec5e1830a4"
+SRC_URI[sha256sum] = "c06d5979f86e64cabbde57c223938db0b939dff49fdb5a793a1d3d0396650949"
+
-- 
2.1.4


