Return-Path: <maciej.pijanowski@3mdeb.com>
Received: from cloudserver096301.home.net.pl (cloudserver096301.home.net.pl
	[79.96.179.35])
	by mail.openembedded.org (Postfix) with ESMTP id C140C72F91
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 10:23:02 +0000 (UTC)
Received: from 87-207-30-9.dynamic.chello.pl (87.207.30.9) (HELO
	localhost.localdomain)
	by serwer1539010.home.pl (79.96.179.35) with SMTP (IdeaSmtpServer 0.82)
	id 4dc5ea89b7233ffd; Sat, 19 Aug 2017 12:23:01 +0200
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Aug 2017 12:22:56 +0200
Message-Id: <1503138177-8419-1-git-send-email-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.7.4
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [PATCH 1/2] linux-firmware: package iwlfifi-3160-[10-17] firmware
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
X-List-Received-Date: Sat, 19 Aug 2017 10:23:03 -0000

Package iwlwifi-3160-[10-17] firmware from iwlwifi-misc to seperate packages,
so it is possible to install only required firmare package.

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 .../recipes-kernel/linux-firmware/linux-firmware_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 622715740142..2ef56da014b7 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -241,6 +241,8 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-iwlwifi-license ${PN}-iwlwifi \
              ${PN}-iwlwifi-135-6 \
              ${PN}-iwlwifi-3160-7 ${PN}-iwlwifi-3160-8 ${PN}-iwlwifi-3160-9 \
+             ${PN}-iwlwifi-3160-10 ${PN}-iwlwifi-3160-12 ${PN}-iwlwifi-3160-13 \
+             ${PN}-iwlwifi-3160-16 ${PN}-iwlwifi-3160-17 \
              ${PN}-iwlwifi-6000-4 ${PN}-iwlwifi-6000g2a-5 ${PN}-iwlwifi-6000g2a-6 \
              ${PN}-iwlwifi-6000g2b-5 ${PN}-iwlwifi-6000g2b-6 \
              ${PN}-iwlwifi-6050-4 ${PN}-iwlwifi-6050-5 \
@@ -541,6 +543,11 @@ LICENSE_${PN}-iwlwifi-135-6     = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-3160-7    = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-3160-8    = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-3160-9    = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-3160-10   = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-3160-12   = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-3160-13   = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-3160-16   = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-3160-17   = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6000-4    = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6000g2a-5 = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6000g2a-6 = "Firmware-iwlwifi_firmware"
@@ -562,6 +569,11 @@ FILES_${PN}-iwlwifi-135-6 = "${nonarch_base_libdir}/firmware/iwlwifi-135-6.ucode
 FILES_${PN}-iwlwifi-3160-7 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-7.ucode"
 FILES_${PN}-iwlwifi-3160-8 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-8.ucode"
 FILES_${PN}-iwlwifi-3160-9 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-9.ucode"
+FILES_${PN}-iwlwifi-3160-10 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-10.ucode"
+FILES_${PN}-iwlwifi-3160-12 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-12.ucode"
+FILES_${PN}-iwlwifi-3160-13 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-13.ucode"
+FILES_${PN}-iwlwifi-3160-16 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-16.ucode"
+FILES_${PN}-iwlwifi-3160-17 = "${nonarch_base_libdir}/firmware/iwlwifi-3160-17.ucode"
 FILES_${PN}-iwlwifi-6000-4 = "${nonarch_base_libdir}/firmware/iwlwifi-6000-4.ucode"
 FILES_${PN}-iwlwifi-6000g2a-5 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2a-5.ucode"
 FILES_${PN}-iwlwifi-6000g2a-6 = "${nonarch_base_libdir}/firmware/iwlwifi-6000g2a-6.ucode"
@@ -580,6 +592,11 @@ RDEPENDS_${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-3160-7    = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-3160-8    = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-3160-9    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-3160-10   = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-3160-12   = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-3160-13   = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-3160-16   = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-3160-17   = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000-4    = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000g2a-6 = "${PN}-iwlwifi-license"
-- 
2.7.4


