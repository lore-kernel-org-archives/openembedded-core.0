Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UK3LS-00064c-6h
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 10:05:44 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 25 Mar 2013 01:48:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,904,1355126400"; d="scan'208";a="218529603"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 25 Mar 2013 01:48:33 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2013 10:48:32 +0200
Message-Id: <1364201312-5389-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] xf86-input-evdev: add mtdev dependency
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
X-List-Received-Date: Mon, 25 Mar 2013 09:06:14 -0000

This is needed in order to have multitouch protocol enabled.

[YOCTO #4087]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-driver/xf86-input-evdev_2.7.3.bb          |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.7.3.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.7.3.bb
index d979622..5c4a619 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.7.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.7.3.bb
@@ -14,7 +14,9 @@ xorg.conf for each input device that will use this driver. "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+DEPENDS += "mtdev"
 
 SRC_URI[md5sum] = "f68920ce2921a88b4662acc972bf3a4a"
 SRC_URI[sha256sum] = "eb389413602c3d28c44bbfab0477c98582f0e2f5be5f41986e58e93a033fa504"
-- 
1.7.9.5



