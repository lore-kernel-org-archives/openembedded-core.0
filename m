Return-Path: <Liwei.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A951A74EBF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 09:24:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U9OPur027586
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 02:24:26 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 30 May 2018 02:24:25 -0700
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2018 05:24:18 -0400
Message-ID: <1527672258-218201-1-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] linux-firmware: package rtl8168 firmware
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
X-List-Received-Date: Wed, 30 May 2018 09:24:25 -0000
Content-Type: text/plain

Add package for rtl8168 firmware which is required by Realtek
Ethernet Controller.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 8d6f2f2dbded..7d34f421a132 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -232,6 +232,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-ti-connectivity-license ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
+             ${PN}-rtl8168 \
              ${PN}-broadcom-license \
              ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm43340 \
              ${PN}-bcm43362 ${PN}-bcm4339 ${PN}-bcm43430 ${PN}-bcm4354 \
@@ -440,6 +441,7 @@ LICENSE_${PN}-rtl8192su = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8723 = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8821 = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl-license = "Firmware-rtlwifi_firmware"
+LICENSE_${PN}-rtl8168 = "WHENCE"
 
 FILES_${PN}-rtl-license = " \
   ${nonarch_base_libdir}/firmware/LICENCE.rtlwifi_firmware.txt \
@@ -462,6 +464,9 @@ FILES_${PN}-rtl8723 = " \
 FILES_${PN}-rtl8821 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin \
 "
+FILES_${PN}-rtl8168 = " \
+  ${nonarch_base_libdir}/firmware/rtl_nic/rtl8168*.fw \
+"
 
 RDEPENDS_${PN}-rtl8188 += "${PN}-rtl-license"
 RDEPENDS_${PN}-rtl8192ce += "${PN}-rtl-license"
@@ -469,6 +474,7 @@ RDEPENDS_${PN}-rtl8192cu += "${PN}-rtl-license"
 RDEPENDS_${PN}-rtl8192su = "${PN}-rtl-license"
 RDEPENDS_${PN}-rtl8723 += "${PN}-rtl-license"
 RDEPENDS_${PN}-rtl8821 += "${PN}-rtl-license"
+RDEPENDS_${PN}-rtl8168 += "${PN}-whence-license"
 
 # For ti-connectivity
 LICENSE_${PN}-wl12xx = "Firmware-ti-connectivity"
-- 
2.7.4


