Return-Path: <ionutx.radu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 53F8B6AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 14:48:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jul 2013 07:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,743,1367996400"; d="scan'208";a="375930791"
Received: from work.rb.intel.com ([10.237.105.51])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2013 07:48:42 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 17:51:04 +0300
Message-Id: <1d373ccc969af0239db6c5cda2aba9d6d429612d.1374763279.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <0e420cbfa5d9ab32d32657fbbbac8d3ce13e778f.1374763279.git.ionutx.radu@intel.com>
References: <0e420cbfa5d9ab32d32657fbbbac8d3ce13e778f.1374763279.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1374763279.git.ionutx.radu@intel.com>
References: <cover.1374763279.git.ionutx.radu@intel.com>
Subject: [v2 3/6] libxxf86dga: Updated from 1.1.3 to 1.1.4
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
X-List-Received-Date: Thu, 25 Jul 2013 14:48:42 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../xorg-lib/{libxxf86dga_1.1.3.bb => libxxf86dga_1.1.4.bb}     |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxxf86dga_1.1.3.bb => libxxf86dga_1.1.4.bb} (70%)

diff --git a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.3.bb b/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.4.bb
similarity index 70%
rename from meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.3.bb
rename to meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.4.bb
index dcb6701..695a396 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.4.bb
@@ -12,11 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=abb99ac125f84f424a4278153988e32f"
 DEPENDS += "libxext xf86dgaproto"
 
 PE = "1"
-PR = "r2"
 
-SRC_URI += "file://libxxf86dga-1.1.3_fix_for_x32.patch"
-
-SRC_URI[md5sum] = "b7f38465c46e7145782d37dbb9da8c09"
-SRC_URI[sha256sum] = "551fa374dbef0f977de1f35d005fa9ffe92b7a87e82dbe62d6a4640f5b0b4994"
+SRC_URI[md5sum] = "d7dd9b9df336b7dd4028b6b56542ff2c"
+SRC_URI[sha256sum] = "8eecd4b6c1df9a3704c04733c2f4fa93ef469b55028af5510b25818e2456c77e"
 
 XORG_PN = "libXxf86dga"
-- 
1.7.10.4


