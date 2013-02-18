Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U7Slm-0003Ng-2r
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 16:36:43 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Feb 2013 07:20:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,688,1355126400"; d="scan'208";a="203607681"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Feb 2013 07:20:24 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 17:20:16 +0200
Message-Id: <1361200817-22531-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1361200817-22531-1-git-send-email-laurentiu.palcu@intel.com>
References: <1361200817-22531-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] xrandr: upgrade to 1.4.0
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
X-List-Received-Date: Mon, 18 Feb 2013 15:36:58 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb |   16 ----------------
 meta/recipes-graphics/xorg-app/xrandr_1.4.0.bb |   16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb
 create mode 100644 meta/recipes-graphics/xorg-app/xrandr_1.4.0.bb

diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb b/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb
deleted file mode 100644
index da83e8f..0000000
--- a/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require xorg-app-common.inc
-
-SUMMARY = "XRandR: X Resize, Rotate and Reflect extension command"
-
-DESCRIPTION = "Xrandr is used to set the size, orientation and/or \
-reflection of the outputs for a screen. It can also set the screen \
-size."
-
-LICENSE= "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fe1608bdb33cf8c62a4438f7d34679b3"
-DEPENDS += "libxrandr libxrender"
-PE = "1"
-PR = "${INC_PR}.1"
-
-SRC_URI[md5sum] = "9735173a84dca9b05e06fd4686196b07"
-SRC_URI[sha256sum] = "1059ff7a9ad0df8e00a765ffa4e08a505304c02663112da370ac7082030b980e"
diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.4.0.bb b/meta/recipes-graphics/xorg-app/xrandr_1.4.0.bb
new file mode 100644
index 0000000..687c9b8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.4.0.bb
@@ -0,0 +1,16 @@
+require xorg-app-common.inc
+
+SUMMARY = "XRandR: X Resize, Rotate and Reflect extension command"
+
+DESCRIPTION = "Xrandr is used to set the size, orientation and/or \
+reflection of the outputs for a screen. It can also set the screen \
+size."
+
+LICENSE= "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fe1608bdb33cf8c62a4438f7d34679b3"
+DEPENDS += "libxrandr libxrender"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "4d68317238bb14a33c0e419233d57d87"
+SRC_URI[sha256sum] = "a76b004abe6fd7606eba9ad161ac6391fe5c665708cc5fb7c7ea7d36459d9693"
-- 
1.7.9.5



