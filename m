Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BAE846B3B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:10:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 06:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="354884440"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2013 06:10:08 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:09:51 +0300
Message-Id: <9e6c9cd0b772079f10ddfcb585133d213327c4fb.1375275560.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
Subject: [PATCH 07/13] xrandr: upgrade to 1.4.1
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
 .../xorg-app/{xrandr_1.4.0.bb => xrandr_1.4.1.bb}  |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.4.0.bb => xrandr_1.4.1.bb} (70%)

diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.4.0.bb b/meta/recipes-graphics/xorg-app/xrandr_1.4.1.bb
similarity index 70%
rename from meta/recipes-graphics/xorg-app/xrandr_1.4.0.bb
rename to meta/recipes-graphics/xorg-app/xrandr_1.4.1.bb
index 687c9b8..35e53c8 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.4.0.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.4.1.bb
@@ -10,7 +10,6 @@ LICENSE= "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fe1608bdb33cf8c62a4438f7d34679b3"
 DEPENDS += "libxrandr libxrender"
 PE = "1"
-PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "4d68317238bb14a33c0e419233d57d87"
-SRC_URI[sha256sum] = "a76b004abe6fd7606eba9ad161ac6391fe5c665708cc5fb7c7ea7d36459d9693"
+SRC_URI[md5sum] = "52c3de0297bf45be6a189dc2e0515638"
+SRC_URI[sha256sum] = "67b554ab975652778bef587f86dab7fec8cb95dfd21c11d98a203dac5c241e50"
-- 
1.7.9.5


