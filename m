Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYd7a-0002VE-0x
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 14:35:14 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2012 05:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,250,1352102400"; d="scan'208";a="219485864"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2012 05:21:17 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 15:21:01 +0200
Message-Id: <2c942373313c6b5cb9a143e93a1cf7cf1d3afb74.1352898505.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352898505.git.laurentiu.palcu@intel.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1352898505.git.laurentiu.palcu@intel.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
Subject: [PATCH v3 03/12] xf86-input-mouse: upgrade to 1.8.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 13:35:14 -0000

Licence chacksum changed because Red Hat added a copyright line.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...ut-mouse_1.7.2.bb => xf86-input-mouse_1.8.1.bb} |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.7.2.bb => xf86-input-mouse_1.8.1.bb} (64%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.2.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.8.1.bb
similarity index 64%
rename from meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.2.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.8.1.bb
index 9ff4563..3b1dce4 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.7.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.8.1.bb
@@ -8,9 +8,10 @@ functions as a pointer input device, and may be used as the X server's \
 core pointer. Multiple mice are supported by multiple instances of this \
 driver."
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=237eb1d1a602d29ef2af62d8fba60f19"
+LIC_FILES_CHKSUM = "file://COPYING;md5=90ea9f90d72b6d9327dede5ffdb2a510"
 
 PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "871c828b88e9c973f1457724b35576fb"
-SRC_URI[sha256sum] = "332b7357c18e6b9daba51c8ed48ce118e9b51fb5990b6a2a68637be62da7413b"
+SRC_URI[md5sum] = "f314c56e4ac6c8fc0cc2710892d5776e"
+SRC_URI[sha256sum] = "f5b97aac9aab8fa8b933e960631441ae23b18681c8bf3d5007c00da838f9c9c8"
+
-- 
1.7.9.5



