Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-04.prod.phx3.secureserver.net
	(p3plsmtpa09-04.prod.phx3.secureserver.net [173.201.193.233])
	by mail.openembedded.org (Postfix) with ESMTP id A6D746BE90
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:35:50 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa09-04.prod.phx3.secureserver.net with 
	id Jibq1m00H1mTNtu01ibrBr; Thu, 29 Aug 2013 11:35:51 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 13:35:47 -0500
Message-Id: <1377801347-10581-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <1377553769-21608-2-git-send-email-pab@pabigot.com>
References: <1377553769-21608-2-git-send-email-pab@pabigot.com>
Subject: [Patch v2] linux-firmware: package Marvell SD8787 firmware
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
X-List-Received-Date: Thu, 29 Aug 2013 18:35:51 -0000

Also split out Marvell license as separate package.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 42f6ce0..1a6f7c9 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -55,7 +55,9 @@ do_install() {
 }
 
 
-PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-wl12xx ${PN}-vt6656 \
+PACKAGES =+ "${PN}-ralink \
+             ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8787 \
+             ${PN}-wl12xx ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
              ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k ${PN}-ath6k ${PN}-ath9k \
@@ -96,12 +98,20 @@ FILES_${PN}-ralink = " \
   /lib/firmware/LICENCE.ralink-firmware.txt \
 "
 
+FILES_${PN}-marvell-license = "/lib/firmware/LICENCE.Marvell"
+
 LICENSE_${PN}-sd8686 = "Firmware-Marvell"
 FILES_${PN}-sd8686 = " \
   /lib/firmware/libertas/sd8686_v9* \
   /lib/firmware/sd8686* \
-  /lib/firmware/LICENCE.Marvell \
 "
+RDEPENDS_${PN}-sd8686 += "${PN}-marvell-license"
+
+LICENSE_${PN}-sd8787 = "Firmware-Marvell"
+FILES_${PN}-sd8787 = " \
+  /lib/firmware/mrvl/sd8787_uapsta.bin \
+"
+RDEPENDS_${PN}-sd8787 += "${PN}-marvell-license"
 
 FILES_${PN}-rtl-license = " \
   /lib/firmware/LICENCE.rtlwifi_firmware.txt \
-- 
1.8.4


