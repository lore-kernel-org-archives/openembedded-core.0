Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2CAAB6B3B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:10:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 06:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="354884410"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2013 06:10:05 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:09:49 +0300
Message-Id: <4aa1a3d8aec009fa79a9fd719d21ef82819e7e5a.1375275560.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
Subject: [PATCH 05/13] libdrm: upgrade to 2.4.46
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
X-List-Received-Date: Wed, 31 Jul 2013 13:10:17 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../drm/{libdrm_2.4.45.bb => libdrm_2.4.46.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.45.bb => libdrm_2.4.46.bb} (46%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.45.bb b/meta/recipes-graphics/drm/libdrm_2.4.46.bb
similarity index 46%
rename from meta/recipes-graphics/drm/libdrm_2.4.45.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.46.bb
index 52e6f65..c9900b1 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.45.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.46.bb
@@ -3,6 +3,6 @@ require libdrm.inc
 SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
            "
-SRC_URI[md5sum] = "92ce56e7533a9b2fcb5c8f32d305328b"
-SRC_URI[sha256sum] = "3ef0a70c16080fb90c50e807b660b7353d82509c03647f6ecc00bbfa1caee208"
+SRC_URI[md5sum] = "9cba217fd3daa10b1d052ec60d3aa7d5"
+SRC_URI[sha256sum] = "33cf320dad4e8060768714792e12643ddf6756a719d262ba7d60b39c2b2650f1"
 
-- 
1.7.9.5


