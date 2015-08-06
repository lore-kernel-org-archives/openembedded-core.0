Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1E56D765C5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 08:40:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 06 Aug 2015 01:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,622,1432623600"; d="scan'208";a="536995316"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Aug 2015 01:40:39 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 11:41:59 +0300
Message-Id: <f763fa6fa39302f1120ac039457bd42736a3ca31.1438849692.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2c93029d78af982ced18f114b4ed6e09ef350b00.1438849692.git.jussi.kukkonen@intel.com>
References: <2c93029d78af982ced18f114b4ed6e09ef350b00.1438849692.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1438849692.git.jussi.kukkonen@intel.com>
References: <cover.1438849692.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/6] fontconfig: Upgrade 2.11.93 -> 2.11.94
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
X-List-Received-Date: Thu, 06 Aug 2015 08:40:39 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../fontconfig/{fontconfig_2.11.93.bb => fontconfig_2.11.94.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.11.93.bb => fontconfig_2.11.94.bb} (92%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb
similarity index 92%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb
index e024adb..9bbff20 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb
@@ -23,8 +23,8 @@ DEPENDS = "expat freetype zlib"
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
            "
-SRC_URI[md5sum] = "622f94f0f74e40775ea72d7d5f17a36d"
-SRC_URI[sha256sum] = "296b5e83189589e537992d65ff01e0cd74eba9a91eb16a6890ce942e3695c526"
+SRC_URI[md5sum] = "479be870c7f83f15f87bac085b61d641"
+SRC_URI[sha256sum] = "73f6d323c7bcfbde25d78397675191d55b8f4139132c6a9444410f3a2d8a9a95"
 
 PACKAGES =+ "fontconfig-utils"
 FILES_${PN} =+ "${datadir}/xml/*"
-- 
2.1.4


