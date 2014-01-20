Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 300526B678
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 14:55:41 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 15:55:36 +0100
Message-Id: <1390229736-12828-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] linux-firmware: package Marvell SD8797 firmware
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
X-List-Received-Date: Mon, 20 Jan 2014 14:55:42 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 123da65..3b5c7eb 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -61,7 +61,7 @@ do_install() {
 
 
 PACKAGES =+ "${PN}-ralink \
-             ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8787 \
+             ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8787 ${PN}-sd8797 \
              ${PN}-wl12xx ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
              ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 \
@@ -120,6 +120,12 @@ FILES_${PN}-sd8787 = " \
 "
 RDEPENDS_${PN}-sd8787 += "${PN}-marvell-license"
 
+LICENSE_${PN}-sd8797 = "Firmware-Marvell"
+FILES_${PN}-sd8797 = " \
+  /lib/firmware/mrvl/sd8797_uapsta.bin \
+"
+RDEPENDS_${PN}-sd8797 += "${PN}-marvell-license"
+
 FILES_${PN}-rtl-license = " \
   /lib/firmware/LICENCE.rtlwifi_firmware.txt \
 "
-- 
1.8.3.2


