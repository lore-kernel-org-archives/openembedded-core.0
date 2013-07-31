Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5C46077F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:10:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 06:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="354884460"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2013 06:10:10 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:09:52 +0300
Message-Id: <de6a83423f5ac7d902282d888934078c89fa0a01.1375275560.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1375275560.git.laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
Subject: [PATCH 08/13] xf86-input-evdev: upgrade to 2.8.1
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
X-List-Received-Date: Wed, 31 Jul 2013 13:10:19 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...ut-evdev_2.8.0.bb => xf86-input-evdev_2.8.1.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.8.0.bb => xf86-input-evdev_2.8.1.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.1.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.1.bb
index d19b82f..bc6c7fc 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.1.bb
@@ -16,5 +16,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
 
 DEPENDS += "mtdev"
 
-SRC_URI[md5sum] = "e9bef0779d364cb588aa93a0ee6736c8"
-SRC_URI[sha256sum] = "2f5b4403955f8e82603acff7f8f21a67e89a7c0230e1506c6924c4b9dd8f0e57"
+SRC_URI[md5sum] = "cc1f59e22edfbc69daecf01e43a8dba3"
+SRC_URI[sha256sum] = "09f887e1ce6cdb92154035db9044e0795a5c80f1ffb9efc599aed9a9dc1ff539"
-- 
1.7.9.5


