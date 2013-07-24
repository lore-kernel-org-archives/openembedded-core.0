Return-Path: <ionutx.radu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8724D6AE6E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:40:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Jul 2013 05:40:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,735,1367996400"; d="scan'208";a="350750298"
Received: from work.rb.intel.com ([10.237.105.51])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2013 05:40:24 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 15:42:50 +0300
Message-Id: <0e420cbfa5d9ab32d32657fbbbac8d3ce13e778f.1374669164.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1374669164.git.ionutx.radu@intel.com>
References: <cover.1374669164.git.ionutx.radu@intel.com>
Subject: [PATCH 1/4] libxfont: Update from 1.4.5 to 1.4.6
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
X-List-Received-Date: Wed, 24 Jul 2013 12:40:24 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../xorg-lib/{libxfont_1.4.5.bb => libxfont_1.4.6.bb}             |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.4.5.bb => libxfont_1.4.6.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.4.5.bb b/meta/recipes-graphics/xorg-lib/libxfont_1.4.6.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-lib/libxfont_1.4.5.bb
rename to meta/recipes-graphics/xorg-lib/libxfont_1.4.6.bb
index 78ab5ea..a9711c3 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont_1.4.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont_1.4.6.bb
@@ -12,12 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a46c8040f2f737bcd0c435feb2ab1c2c"
 DEPENDS += "freetype xtrans fontsproto libfontenc zlib"
 PROVIDES = "xfont"
 
-PR = "r1"
 PE = "1"
 
 XORG_PN = "libXfont"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "6851da5dae0a6cf5f7c9b9e2b05dd3b4"
-SRC_URI[sha256sum] = "bbf96fb80b6b95cdb1dc968085082a6e668193a54cd9d6e2af669909c0cb7170"
+SRC_URI[md5sum] = "351a9b7348d165029bda52c9fdcb5c7a"
+SRC_URI[sha256sum] = "d0cbfe4554dc17ceea413cdad5601d35ed8d05d5b880e60931a8775fd1157e9f"
-- 
1.7.10.4


