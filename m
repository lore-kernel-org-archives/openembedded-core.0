Return-Path: <wei.tee.ng@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E0799759FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 07:46:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Jun 2015 00:46:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,643,1427785200"; d="scan'208";a="730491553"
Received: from weiteeng-ilbpg1.png.intel.com ([10.88.227.45])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2015 00:46:34 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jun 2015 15:46:21 +0800
Message-Id: <1434699981-8983-4-git-send-email-wei.tee.ng@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1434699981-8983-1-git-send-email-wei.tee.ng@intel.com>
References: <1434699981-8983-1-git-send-email-wei.tee.ng@intel.com>
Cc: wei.tee.ng@intel.com
Subject: [PATCH 3/3][dizzy] linux-firmware: Package Marvell pci8897 and usb8897 firmware
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
X-List-Received-Date: Fri, 19 Jun 2015 07:46:34 -0000

From: Ng Wei Tee <wei.tee.ng@intel.com>

Signed-off-by: Ng Shui Lei <shui.lei.ng@intel.com>
Signed-off-by: Ng Wei Tee <wei.tee.ng@intel.com>
---
 .../linux-firmware/linux-firmware_git.bb           |   19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index a107f80..bd0b9a3 100644
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
+SRCREV = "ec89525b2ab65f1d5ae4f67e27f0d525ddedd2ef"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
@@ -62,7 +62,7 @@ do_install() {
 
 PACKAGES =+ "${PN}-ralink \
              ${PN}-radeon \
-             ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8787 ${PN}-sd8797 \
+             ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8787 ${PN}-sd8797 ${PN}-pcie8897 ${PN}-usb8897 \
              ${PN}-wl12xx ${PN}-wl18xx ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
              ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 \
@@ -133,6 +133,19 @@ FILES_${PN}-sd8797 = " \
 "
 RDEPENDS_${PN}-sd8797 += "${PN}-marvell-license"
 
+LICENSE_${PN}-pcie8897 = "Firmware-Marvell"
+FILES_${PN}-pcie8897 = " \
+  /lib/firmware/mrvl/pcie8897_uapsta.bin \
+"
+RDEPENDS_${PN}-pcie8897 += "${PN}-marvell-license"
+
+LICENSE_${PN}-usb8897 = "Firmware-Marvell"
+FILES_${PN}-usb8897 = " \
+  /lib/firmware/mrvl/usb8897_uapsta.bin \
+"
+RDEPENDS_${PN}-usb8897 += "${PN}-marvell-license"
+
+
 FILES_${PN}-rtl-license = " \
   /lib/firmware/LICENCE.rtlwifi_firmware.txt \
 "
-- 
1.7.9.5


