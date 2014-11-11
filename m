Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 586CA7179F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 08:46:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Nov 2014 00:46:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,359,1413270000"; d="scan'208";a="630016423"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2014 00:46:36 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Nov 2014 10:46:25 +0200
Message-Id: <221b2718321eeb9224fd5bdf2d9ae44303fbbe0a.1415695544.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1415695544.git.cristian.iorga@intel.com>
References: <cover.1415695544.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1415695544.git.cristian.iorga@intel.com>
References: <cover.1415695544.git.cristian.iorga@intel.com>
Subject: [PATCH 4/4] linux-firmware: upgrade to git rev 0e5f637
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
X-List-Received-Date: Tue, 11 Nov 2014 08:46:45 -0000

- Intel iwlwifi firmware copyright years changed.
- Cleanup and updates for Intel wireless firmware.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../linux-firmware/linux-firmware_git.bb           | 48 +++++++++++++++++-----
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index a2f16d1..16ebf6a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=07b0c31777bd686d8e1609c6940b5e74\
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
                     file://LICENCE.qla2xxx;md5=f5ce8529ec5c17cb7f911d2721d90e91 \
-                    file://LICENCE.iwlwifi_firmware;md5=8b938534f77ffd453690eb34ed84ae8b \
+                    file://LICENCE.iwlwifi_firmware;md5=5106226b2863d00d8ed553221ddf8cd2 \
                     file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=07b0c31777bd686d8e1609c6940b5e74\
                     file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
                    "
 
-SRCREV = "dec41bce44e0dff6a2c3358a958fadf22bf58858"
+SRCREV = "0e5f63771d0df6d7859f7c4100a74d737c62ac88"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
@@ -44,7 +44,7 @@ do_install() {
 	install -d  ${D}/lib/firmware/
 	cp -r * ${D}/lib/firmware/
 
-	# Avoid Makefile to be deplyed
+	# Avoid Makefile to be deployed
 	rm ${D}/lib/firmware/Makefile
 
 	# Remove unbuild firmware which needs cmake and bash
@@ -69,9 +69,13 @@ PACKAGES =+ "${PN}-ralink \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
              ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k ${PN}-ath6k ${PN}-ath9k \
-             ${PN}-iwlwifi-license ${PN}-iwlwifi-6000g2a-5 ${PN}-iwlwifi-6000g2b-6 ${PN}-iwlwifi-7260-7 \
-             ${PN}-iwlwifi-6000g2a-6 ${PN}-iwlwifi-135-6"
-
+             ${PN}-iwlwifi-license ${PN}-iwlwifi-135-6 \
+             ${PN}-iwlwifi-3160-7 ${PN}-iwlwifi-3160-8 ${PN}-iwlwifi-3160-9 \
+             ${PN}-iwlwifi-6000-4 ${PN}-iwlwifi-6000g2a-5 ${PN}-iwlwifi-6000g2a-6 ${PN}-iwlwifi-6000g2b-5 ${PN}-iwlwifi-6000g2b-6 \
+             ${PN}-iwlwifi-6050-4 ${PN}-iwlwifi-6050-5 \
+             ${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-iwlwifi-7260-9 \
+             ${PN}-iwlwifi-7265-8 ${PN}-iwlwifi-7265-9 \
+             "
 
 FILES_${PN}-atheros-license = "/lib/firmware/LICENCE.atheros_firmware"
 
@@ -210,18 +214,40 @@ RDEPENDS_${PN}-bcm4334 += "${PN}-broadcom-license"
 ALTERNATIVE_linux-firmware-bcm4334 = "brcmfmac-sdio.bin"
 ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4334-sdio.bin"
 
+RDEPENDS_${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-3160-7    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-3160-8    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-3160-9    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-6000-4    = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000g2a-6 = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000g2b-6 = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-135-6 = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-7260-7 = "${PN}-iwlwifi-license"
-
-FILES_${PN}-iwlwifi-license =   "/lib/firmware/LICENCE.iwlwifi_firmware"
+RDEPENDS_${PN}-iwlwifi-6050-4    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-6050-5    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-7260-7    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-7260-8    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-7260-9    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-7265-8    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-7265-9    = "${PN}-iwlwifi-license"
+
+FILES_${PN}-iwlwifi-license = "/lib/firmware/LICENCE.iwlwifi_firmware"
+FILES_${PN}-iwlwifi-135-6 = "/lib/firmware/iwlwifi-135-6.ucode"
+FILES_${PN}-iwlwifi-3160-7 = "/lib/firmware/iwlwifi-3160-7.ucode"
+FILES_${PN}-iwlwifi-3160-8 = "/lib/firmware/iwlwifi-3160-8.ucode"
+FILES_${PN}-iwlwifi-3160-9 = "/lib/firmware/iwlwifi-3160-9.ucode"
+FILES_${PN}-iwlwifi-6000-4 = "/lib/firmware/iwlwifi-6000-4.ucode"
 FILES_${PN}-iwlwifi-6000g2a-5 = "/lib/firmware/iwlwifi-6000g2a-5.ucode"
 FILES_${PN}-iwlwifi-6000g2a-6 = "/lib/firmware/iwlwifi-6000g2a-6.ucode"
+FILES_${PN}-iwlwifi-6000g2b-5 = "/lib/firmware/iwlwifi-6000g2b-5.ucode"
 FILES_${PN}-iwlwifi-6000g2b-6 = "/lib/firmware/iwlwifi-6000g2b-6.ucode"
-FILES_${PN}-iwlwifi-135-6 =     "/lib/firmware/iwlwifi-135-6.ucode"
+FILES_${PN}-iwlwifi-6050-4 = "/lib/firmware/iwlwifi-6050-4.ucode"
+FILES_${PN}-iwlwifi-6050-5 = "/lib/firmware/iwlwifi-6050-5.ucode"
 FILES_${PN}-iwlwifi-7260-7 = "/lib/firmware/iwlwifi-7260-7.ucode"
+FILES_${PN}-iwlwifi-7260-8 = "/lib/firmware/iwlwifi-7260-8.ucode"
+FILES_${PN}-iwlwifi-7260-9 = "/lib/firmware/iwlwifi-7260-9.ucode"
+FILES_${PN}-iwlwifi-7265-8 = "/lib/firmware/iwlwifi-7265-8.ucode"
+FILES_${PN}-iwlwifi-7265-9 = "/lib/firmware/iwlwifi-7265-9.ucode"
 
 FILES_${PN} += "/lib/firmware/*"
 
-- 
2.1.0


