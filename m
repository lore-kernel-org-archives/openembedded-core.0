Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 6380F71DD9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 00:42:24 +0000 (UTC)
Received: from seahawk.toradex.int
	(75-146-58-181-Washington.hfc.comcastbusiness.net [75.146.58.181])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 3A1E35C0BA7;
	Thu, 16 Feb 2017 01:26:07 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 16:35:19 -0800
Message-Id: <1487205319-1954-1-git-send-email-stefan@agner.ch>
X-Mailer: git-send-email 2.7.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1487204767; bh=Li3eay6vyMq76OOs5ihNLj2Ztq4QM8pJIw7xz1qKHPs=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=u9EQTUwfYWyxQ0TQz0QMhHrHWdfw5rlStfyE+oNyNWaBGDsrkVzocmbILYmfleD7NVxzpznh+ah42/Css13n4VCAFzRZQsaAn0ZyGssMnG/9lV4+11GBIfkJ7he+jivvdhAHhjIBaisJoKjd8Tq08iRYLHlf9jRoyg2+gaamwX0=
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] linux-firmware: Add Marvell sd88xx WiFi firmwares
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
X-List-Received-Date: Thu, 16 Feb 2017 00:42:24 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Add packages for Marvells sd88xx SDIO WiFi firmwares.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../recipes-kernel/linux-firmware/linux-firmware_git.bb | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 0aba740..5547e16 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -221,7 +221,7 @@ do_install() {
 
 PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-radeon-license ${PN}-radeon \
-             ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 \
+             ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 ${PN}-sd8887 ${PN}-sd8897 \
              ${PN}-ti-connectivity-license ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
@@ -322,6 +322,9 @@ LICENSE_${PN}-sd8686 = "Firmware-Marvell"
 LICENSE_${PN}-sd8688 = "Firmware-Marvell"
 LICENSE_${PN}-sd8787 = "Firmware-Marvell"
 LICENSE_${PN}-sd8797 = "Firmware-Marvell"
+LICENSE_${PN}-sd8801 = "Firmware-Marvell"
+LICENSE_${PN}-sd8887 = "Firmware-Marvell"
+LICENSE_${PN}-sd8897 = "Firmware-Marvell"
 LICENSE_${PN}-marvell-license = "Firmware-Marvell"
 
 FILES_${PN}-marvell-license = "/lib/firmware/LICENCE.Marvell"
@@ -339,11 +342,23 @@ FILES_${PN}-sd8787 = " \
 FILES_${PN}-sd8797 = " \
   /lib/firmware/mrvl/sd8797_uapsta.bin \
 "
+FILES_${PN}-sd8801 = " \
+  /lib/firmware/mrvl/sd8801_uapsta.bin \
+"
+FILES_${PN}-sd8887 = " \
+  /lib/firmware/mrvl/sd8887_uapsta.bin \
+"
+FILES_${PN}-sd8897 = " \
+  /lib/firmware/mrvl/sd8897_uapsta.bin \
+"
 
 RDEPENDS_${PN}-sd8686 += "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8688 += "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8787 += "${PN}-marvell-license"
 RDEPENDS_${PN}-sd8797 += "${PN}-marvell-license"
+RDEPENDS_${PN}-sd8801 += "${PN}-marvell-license"
+RDEPENDS_${PN}-sd8887 += "${PN}-marvell-license"
+RDEPENDS_${PN}-sd8897 += "${PN}-marvell-license"
 
 # For rtl
 LICENSE_${PN}-rtl8188 = "Firmware-rtlwifi_firmware"
-- 
2.7.4


