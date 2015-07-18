Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id DAB19760EE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:56 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so31932697pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=NOIuv4uTuC/73k/oqKGB22nSgUOn1bCg/PNRnt70D8w=;
	b=R4gl812/+FYDNZ92E4JSaV4kXn1krENnPxArE6i8wqp47BH+U8nsLkDeqnDMxP4/L9
	BFT4sv23l/KmamUt49CnoApubsLZYHsbmENk/NQFX8khy+2r/oXW85wX0kLgS4CM7VsI
	D8VZ60U/9qPqwYws7jUuQHmsQPgBgM7K+8j8AYC4IPDZFeOEH0PkvWITKrzoz2qWfNxC
	HOSg4fBm2dMK0XSGFbe39wEEwsHMIhH3M8fK9WW9TOsQy5rH73azji6iJ6vpHt32m0Jm
	PeHjM82Vu3huw6AEbR3LpYfcebB++GkoRwdUvNvv/j9gTZYVjDjvkdm/xkNnRtqaVEgq
	m2rA==
X-Received: by 10.66.145.33 with SMTP id sr1mr39825095pab.41.1437232616967;
	Sat, 18 Jul 2015 08:16:56 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	d7sm14606444pbu.41.2015.07.18.08.16.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:53 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 487F3FC12FD; Sat, 18 Jul 2015 08:16:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:28 -0700
Message-Id: <5c1ee0c279cd5ea401c83c0f4067c0c1ec075aa6.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 21/25] linux-firmware: Package Marvell pci8897 and usb8897 firmware
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:58 -0000

From: Ng Wei Tee <wei.tee.ng@intel.com>

Signed-off-by: Ng Shui Lei <shui.lei.ng@intel.com>
Signed-off-by: Ng Wei Tee <wei.tee.ng@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux-firmware/linux-firmware_git.bb              | 19 ++++++++++++++++---
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
1.9.1


