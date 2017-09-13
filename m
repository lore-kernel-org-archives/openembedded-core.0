Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 51D3D78555
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 00:07:57 +0000 (UTC)
Received: from seahawk.toradex.int
	(75-146-58-181-Washington.hfc.comcastbusiness.net [75.146.58.181])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 504DC5C1356;
	Wed, 13 Sep 2017 02:04:11 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Sep 2017 17:07:51 -0700
Message-Id: <1505261272-25017-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 2.7.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1505261052; bh=qnWaIJ3QsQ2iBQL+uSQ3miDZCqcRBLiyDnUBzzpMNZs=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=aWzTWQK7l2mZWrCGkMjnBS/GauhSyJWLWwvng5FnM83YbXrPxX0pshqeUjv8kNX89embEwbniObOXuwWZU0LrAT6d1cNyNneq+WDY4auRaTngh9PlKnDR98jQkkryYoIMkqdBmsbCglKSs/QyjATx9nzjNp2l2A9If6EkRN2jkE=
Cc: Stefan Agner <stefan.agner@toradex.com>, dominik.sliwa@toradex.com
Subject: [PATCH 1/2] linux-firmware: package Marvell PCIe WiFi firmwares
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
X-List-Received-Date: Wed, 13 Sep 2017 00:07:58 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Add packages for Marvell Avastar 88W8897 and 88W8997 PCIe WiFi
chips.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 396bd4e..20d140c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -229,7 +229,8 @@ do_install() {
 PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-mt7601u-license ${PN}-mt7601u \
              ${PN}-radeon-license ${PN}-radeon \
-             ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 ${PN}-sd8887 ${PN}-sd8897 \
+             ${PN}-marvell-license ${PN}-pcie8897 ${PN}-pcie8997 \
+             ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 ${PN}-sd8887 ${PN}-sd8897 \
              ${PN}-ti-connectivity-license ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
@@ -356,6 +357,8 @@ FILES_${PN}-radeon = " \
 RDEPENDS_${PN}-radeon += "${PN}-radeon-license"
 
 # For marvell
+LICENSE_${PN}-pcie8897 = "Firmware-Marvell"
+LICENSE_${PN}-pcie8997 = "Firmware-Marvell"
 LICENSE_${PN}-sd8686 = "Firmware-Marvell"
 LICENSE_${PN}-sd8688 = "Firmware-Marvell"
 LICENSE_${PN}-sd8787 = "Firmware-Marvell"
@@ -366,6 +369,14 @@ LICENSE_${PN}-sd8897 = "Firmware-Marvell"
 LICENSE_${PN}-marvell-license = "Firmware-Marvell"
 
 FILES_${PN}-marvell-license = "${nonarch_base_libdir}/firmware/LICENCE.Marvell"
+FILES_${PN}-pcie8897 = " \
+  ${nonarch_base_libdir}/firmware/mrvl/pcie8897_uapsta.bin \
+"
+FILES_${PN}-pcie8997 = " \
+  ${nonarch_base_libdir}/firmware/mrvl/pcie8997_wlan_v4.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/pcieuart8997_combo_v4.bin \
+  ${nonarch_base_libdir}/firmware/mrvl/pcieusb8997_combo_v4.bin \
+"
 FILES_${PN}-sd8686 = " \
   ${nonarch_base_libdir}/firmware/libertas/sd8686_v9* \
   ${nonarch_base_libdir}/firmware/sd8686* \
-- 
2.7.4


