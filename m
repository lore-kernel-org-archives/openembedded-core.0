Return-Path: <tomas@novotny.cz>
X-Greylist: delayed 333 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 Sep 2017 16:06:19 UTC
Received: from hosting.pavoucek.net (hosting.pavoucek.net [46.28.107.168])
	by mail.openembedded.org (Postfix) with ESMTP id 7A7677806D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 16:06:19 +0000 (UTC)
Received: from tomas.local.tbs-biometrics.cz (unknown [176.74.132.138])
	(Authenticated sender: tomas@novotny.cz)
	by hosting.pavoucek.net (Postfix) with ESMTPSA id 2CB2D100CCE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 18:00:47 +0200 (CEST)
From: Tomas Novotny <tomas@novotny.cz>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Sep 2017 18:00:41 +0200
Message-Id: <20170926160041.581-1-tomas@novotny.cz>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] linux-firmware: package Broadcom BCM43362 firmware
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
X-List-Received-Date: Tue, 26 Sep 2017 16:06:19 -0000

Signed-off-by: Tomas Novotny <tomas@novotny.cz>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 6798ace639..96182ded91 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -234,7 +234,9 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-ti-connectivity-license ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
-             ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm43340 ${PN}-bcm4339 ${PN}-bcm43430 ${PN}-bcm4354 \
+             ${PN}-broadcom-license \
+             ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm43340 \
+             ${PN}-bcm43362 ${PN}-bcm4339 ${PN}-bcm43430 ${PN}-bcm4354 \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k \
              ${PN}-gplv2-license ${PN}-carl9170 \
              ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-qca \
@@ -499,6 +501,7 @@ LICENSE_${PN}-bcm4329 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4330 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4334 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm43340 = "Firmware-broadcom_bcm43xx"
+LICENSE_${PN}-bcm43362 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4339 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm43430 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4354 = "Firmware-broadcom_bcm43xx"
@@ -519,6 +522,9 @@ FILES_${PN}-bcm4334 = " \
 FILES_${PN}-bcm43340 = " \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac43340-sdio.bin \
 "
+FILES_${PN}-bcm43362 = " \
+  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43362-sdio.bin \
+"
 FILES_${PN}-bcm4339 = " \
   ${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.bin \
 "
@@ -533,6 +539,7 @@ RDEPENDS_${PN}-bcm4329 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4330 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4334 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm43340 += "${PN}-broadcom-license"
+RDEPENDS_${PN}-bcm43362 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4339 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm43430 += "${PN}-broadcom-license"
 RDEPENDS_${PN}-bcm4354 += "${PN}-broadcom-license"
-- 
2.12.3


