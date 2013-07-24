Return-Path: <ionutx.radu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 27AA16B31A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:40:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Jul 2013 05:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,735,1367996400"; d="scan'208";a="350750328"
Received: from work.rb.intel.com ([10.237.105.51])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2013 05:40:28 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 15:42:51 +0300
Message-Id: <631156aa390290eb5ab012b7ce8772e4396670b0.1374669164.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <0e420cbfa5d9ab32d32657fbbbac8d3ce13e778f.1374669164.git.ionutx.radu@intel.com>
References: <0e420cbfa5d9ab32d32657fbbbac8d3ce13e778f.1374669164.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1374669164.git.ionutx.radu@intel.com>
References: <cover.1374669164.git.ionutx.radu@intel.com>
Subject: [PATCH 2/4] libxrandr: Update from 1.4.0 to 1.4.1
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
X-List-Received-Date: Wed, 24 Jul 2013 12:40:52 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../xorg-lib/{libxrandr_1.4.0.bb => libxrandr_1.4.1.bb}           |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.4.0.bb => libxrandr_1.4.1.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.4.0.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.4.1.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libxrandr_1.4.0.bb
rename to meta/recipes-graphics/xorg-lib/libxrandr_1.4.1.bb
index 323c098..360199d 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.4.1.bb
@@ -13,12 +13,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aa33e583cc3e96238a8467b485e62992"
 
 DEPENDS += "virtual/libx11 randrproto libxrender libxext"
 
-PR = "r0"
 PE = "1"
 
 XORG_PN = "libXrandr"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "0c843636124cc1494e3d87df16957672"
-SRC_URI[sha256sum] = "033ad0ac2f012afb05268660f6d78705c85f84689f92fa7b47ce12959b15f5c3"
+SRC_URI[md5sum] = "8dbac4e972348dcbd3a0673ce2e37919"
+SRC_URI[sha256sum] = "d914a0490fd0a2ea6c3194505b5b28c56e2a277d8f4648b0275ee0ee370fb905"
-- 
1.7.10.4


