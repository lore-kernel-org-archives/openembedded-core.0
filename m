Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EBB596DC02
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 13:51:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Nov 2013 05:51:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,768,1378882800"; d="scan'208";a="439337210"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2013 05:51:15 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2013 15:51:00 +0200
Message-Id: <2d72b0e272258e6531ab69a951dbd2ce31fc20cc.1385386370.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
Subject: [PATCH 5/9] libdrm: upgrade to 2.4.49
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
X-List-Received-Date: Mon, 25 Nov 2013 13:51:17 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../drm/{libdrm_2.4.47.bb => libdrm_2.4.49.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.47.bb => libdrm_2.4.49.bb} (46%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.47.bb b/meta/recipes-graphics/drm/libdrm_2.4.49.bb
similarity index 46%
rename from meta/recipes-graphics/drm/libdrm_2.4.47.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.49.bb
index c21d905..6047d7c 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.47.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.49.bb
@@ -3,6 +3,6 @@ require libdrm.inc
 SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
            "
-SRC_URI[md5sum] = "e043d6d59328887b9e434f4d27aacc09"
-SRC_URI[sha256sum] = "a98809a55ede4dac17416cac41f1f017114a97a7b6c2574f96a225ab1bd06074"
+SRC_URI[md5sum] = "454fe27645152cbd8be8ccda21acaa24"
+SRC_URI[sha256sum] = "25d7d3fd30d8c350d3b87b3048f1c0cf0be295a40197a49acc374d4f4ae97a7d"
 
-- 
1.7.9.5


