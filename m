Return-Path: <cristiana.voicu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9106B4BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 13:45:20 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Aug 2013 06:45:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,839,1367996400"; d="scan'208";a="279405783"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.72])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Aug 2013 06:45:19 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 16:46:10 +0300
Message-Id: <1b36c3d0af95af49578dc63b7b6854f5fcbd3b11.1375969277.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <640f6c9fa2af863b50ed3a89207e718e99078473.1375969277.git.cristiana.voicu@intel.com>
References: <640f6c9fa2af863b50ed3a89207e718e99078473.1375969277.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1375969277.git.cristiana.voicu@intel.com>
References: <cover.1375969277.git.cristiana.voicu@intel.com>
Subject: [PATCH 2/5] mkfontscale: upgrade to 1.1.1
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
X-List-Received-Date: Thu, 08 Aug 2013 13:45:22 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../{mkfontscale_1.1.0.bb => mkfontscale_1.1.1.bb} |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.1.0.bb => mkfontscale_1.1.1.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.0.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.1.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-app/mkfontscale_1.1.0.bb
rename to meta/recipes-graphics/xorg-app/mkfontscale_1.1.1.bb
index d98057b..3d248d1 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.1.bb
@@ -10,11 +10,9 @@ is used by the mkfontdir program."
 
 DEPENDS += " zlib libfontenc freetype virtual/libx11"
 
-PR = "${INC_PR}.0"
-
 BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e0d129d05305176d1a790e0ac1acb7f"
 
-SRC_URI[md5sum] = "414fcb053418fb1418e3a39f4a37e0f7"
-SRC_URI[sha256sum] = "ce55f862679b8ec127d7f7315ac04a8d64a0d90a0309a70dc56c1ba3f9806994"
+SRC_URI[md5sum] = "03de3f15db678e277f5ef9c013aca1ad"
+SRC_URI[sha256sum] = "244017992477ced2397a44fd0ddcfb0f1d9899128613f5c4db81471163b0b731"
-- 
1.7.9.5


