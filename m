Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Uap9z-0006xj-1j
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 17:23:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 10 May 2013 08:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,648,1363158000"; d="scan'208";a="331999098"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 08:04:33 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 18:04:18 +0300
Message-Id: <77b2d612e671fbdaad03add978e508d9c4e81006.1368198012.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
Subject: [PATCH 6/8] xf86-input-evdev: upgrade to 2.8.0
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
X-List-Received-Date: Fri, 10 May 2013 15:23:26 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 ...ut-evdev_2.7.3.bb => xf86-input-evdev_2.8.0.bb} |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.7.3.bb => xf86-input-evdev_2.8.0.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.7.3.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.0.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.7.3.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.0.bb
index 5c4a619..d19b82f 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.7.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.0.bb
@@ -14,9 +14,7 @@ xorg.conf for each input device that will use this driver. "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
 
-PR = "${INC_PR}.1"
-
 DEPENDS += "mtdev"
 
-SRC_URI[md5sum] = "f68920ce2921a88b4662acc972bf3a4a"
-SRC_URI[sha256sum] = "eb389413602c3d28c44bbfab0477c98582f0e2f5be5f41986e58e93a033fa504"
+SRC_URI[md5sum] = "e9bef0779d364cb588aa93a0ee6736c8"
+SRC_URI[sha256sum] = "2f5b4403955f8e82603acff7f8f21a67e89a7c0230e1506c6924c4b9dd8f0e57"
-- 
1.7.9.5



