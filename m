Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 53E8E6A9EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 13:39:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2013 06:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,845,1363158000"; d="scan'208";a="327680095"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2013 06:39:44 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 16:39:33 +0300
Message-Id: <2616eebc2bf7b990b5e250d6b3e862dc480aa640.1370956136.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1370956136.git.laurentiu.palcu@intel.com>
References: <cover.1370956136.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1370956136.git.laurentiu.palcu@intel.com>
References: <cover.1370956136.git.laurentiu.palcu@intel.com>
Subject: [PATCH 6/7] libdrm: upgrade to 2.4.45
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
X-List-Received-Date: Tue, 11 Jun 2013 13:39:44 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../drm/{libdrm_2.4.44.bb => libdrm_2.4.45.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.44.bb => libdrm_2.4.45.bb} (46%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.44.bb b/meta/recipes-graphics/drm/libdrm_2.4.45.bb
similarity index 46%
rename from meta/recipes-graphics/drm/libdrm_2.4.44.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.45.bb
index b016958..52e6f65 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.44.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.45.bb
@@ -3,6 +3,6 @@ require libdrm.inc
 SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
            "
-SRC_URI[md5sum] = "b760b1f2ae4ec6452383164ec697cd5d"
-SRC_URI[sha256sum] = "42b45ad15bb1bc52630a4b37b7afcfaea27e01b3c0b4791ef25d0f7b2456f6a2"
+SRC_URI[md5sum] = "92ce56e7533a9b2fcb5c8f32d305328b"
+SRC_URI[sha256sum] = "3ef0a70c16080fb90c50e807b660b7353d82509c03647f6ecc00bbfa1caee208"
 
-- 
1.7.9.5


