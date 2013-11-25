Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4D2F16DC02
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2013 13:51:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Nov 2013 05:51:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,768,1378882800"; d="scan'208";a="439337233"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2013 05:51:17 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2013 15:51:02 +0200
Message-Id: <a38df2f6d0fff00698bf9ff71b30902bf1c7cc54.1385386370.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1385386370.git.laurentiu.palcu@intel.com>
References: <cover.1385386370.git.laurentiu.palcu@intel.com>
Subject: [PATCH 7/9] xproto: upgrade to 7.0.25
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
X-List-Received-Date: Mon, 25 Nov 2013 13:51:23 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{xproto_7.0.24.bb => xproto_7.0.25.bb}         |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.24.bb => xproto_7.0.25.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-proto/xproto_7.0.24.bb b/meta/recipes-graphics/xorg-proto/xproto_7.0.25.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-proto/xproto_7.0.24.bb
rename to meta/recipes-graphics/xorg-proto/xproto_7.0.25.bb
index 2c6cbc0..cf24125 100644
--- a/meta/recipes-graphics/xorg-proto/xproto_7.0.24.bb
+++ b/meta/recipes-graphics/xorg-proto/xproto_7.0.25.bb
@@ -15,6 +15,6 @@ SRC_URI += "file://xproto_fix_for_x32.patch"
 EXTRA_OECONF_append = " --enable-specs=no"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "9c0203c3bee4bac432ec504dc45712ed"
-SRC_URI[sha256sum] = "3698a1c7e3b734bc1139a7eb694ed8c66188658d6b4dea3d567066fe4e88b2fc"
+SRC_URI[md5sum] = "28311ef4edbbbf89f617a7f8a2e5648f"
+SRC_URI[sha256sum] = "92247485dc4ffc3611384ba84136591923da857212a7dc29f4ad7797e13909fe"
 
-- 
1.7.9.5


