Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 895E965F0F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 15:17:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 May 2014 08:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,988,1389772800"; d="scan'208";a="506136163"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 05 May 2014 08:17:23 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 May 2014 18:20:48 +0300
Message-Id: <39874be410c4c4876ffdbfb25fd5f5cbbc905ccf.1399303211.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1399303211.git.cristian.iorga@intel.com>
References: <cover.1399303211.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1399303211.git.cristian.iorga@intel.com>
References: <cover.1399303211.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] linux-firmware: upgrade to commit dec41bce44e0dff6a2c3358a958fadf22bf58858
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
X-List-Received-Date: Mon, 05 May 2014 15:17:31 -0000

- Updated copyright years for radeon firmware;
- Changed copyright terms (privilege of use) for qla2xxx firmware;
- Changed Broadcom firmware name for SDIO;
- Added TI wl18xx firmware package.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../linux-firmware/linux-firmware_git.bb           | 27 ++++++++++++++--------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index c148336..a107f80 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -7,11 +7,11 @@ SECTION = "kernel"
 
 LICENSE = "Proprietary"
 
-LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=9c2faab1bfca55e1510d6bde67206f9c \
+LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=07b0c31777bd686d8e1609c6940b5e74\
                     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
-                    file://LICENCE.qla2xxx;md5=4005328a134054f0fa077bdc37aa64f2 \
+                    file://LICENCE.qla2xxx;md5=f5ce8529ec5c17cb7f911d2721d90e91 \
                     file://LICENCE.iwlwifi_firmware;md5=8b938534f77ffd453690eb34ed84ae8b \
                     file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=9c2faab1bfca55e1510d6bde67206f9c \
                     file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
                    "
 
-SRCREV = "600caefd83a406540b2a789be6415e44c9b87add"
+SRCREV = "dec41bce44e0dff6a2c3358a958fadf22bf58858"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
@@ -63,7 +63,7 @@ do_install() {
 PACKAGES =+ "${PN}-ralink \
              ${PN}-radeon \
              ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8787 ${PN}-sd8797 \
-             ${PN}-wl12xx ${PN}-vt6656 \
+             ${PN}-wl12xx ${PN}-wl18xx ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
              ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k ${PN}-ath6k ${PN}-ath9k \
@@ -162,6 +162,13 @@ FILES_${PN}-wl12xx = " \
   /lib/firmware/ti-connectivity \
 "
 
+LICENSE_${PN}-wl18xx = "Firmware-ti-connectivity"
+FILES_${PN}-wl18xx = " \
+  /lib/firmware/wl18* \
+  /lib/firmware/TI* \
+  /lib/firmware/ti-connectivity \
+"
+
 LICENSE_${PN}-vt6656 = "Firmware-via_vt6656"
 FILES_${PN}-vt6656 = " \
   /lib/firmware/vntwusb.fw \
@@ -179,27 +186,27 @@ FILES_${PN}-broadcom-license = " \
 
 LICENSE_${PN}-bcm4329 = "Firmware-bcm4329"
 FILES_${PN}-bcm4329 = " \
-  /lib/firmware/brcm/brcmfmac4329.bin \
+  /lib/firmware/brcm/brcmfmac4329-sdio.bin \
 "
 RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
 ALTERNATIVE_linux-firmware-bcm4329 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4329.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm4329[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4329-sdio.bin"
 
 LICENSE_${PN}-bcm4330 = "Firmware-bcm4330"
 FILES_${PN}-bcm4330 = " \
-  /lib/firmware/brcm/brcmfmac4330.bin \
+  /lib/firmware/brcm/brcmfmac4330-sdio.bin \
 "
 RDEPENDS_${PN}-bcm4330 += "${PN}-broadcom-license"
 ALTERNATIVE_linux-firmware-bcm4330 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4330.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm4330[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4330-sdio.bin"
 
 LICENSE_${PN}-bcm4334 = "Firmware-bcm4334"
 FILES_${PN}-bcm4334 = " \
-  /lib/firmware/brcm/brcmfmac4334.bin \
+  /lib/firmware/brcm/brcmfmac4334-sdio.bin \
 "
 RDEPENDS_${PN}-bcm4334 += "${PN}-broadcom-license"
 ALTERNATIVE_linux-firmware-bcm4334 = "brcmfmac-sdio.bin"
-ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4334.bin"
+ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4334-sdio.bin"
 
 RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000g2a-6 = "${PN}-iwlwifi-license"
-- 
1.9.1


