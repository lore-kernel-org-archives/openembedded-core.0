Return-Path: <Liwei.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5497867C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 09:50:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0H9odT3023811
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 01:50:39 -0800
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 17 Jan 2018 01:50:39 -0800
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 04:50:34 -0500
Message-ID: <20180117095035.53665-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [PATCH 1/2] linux-firmware: package iwlwifi-9000 series fimware
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
X-List-Received-Date: Wed, 17 Jan 2018 09:50:39 -0000
Content-Type: text/plain

Add package for 9000 seires Intel wireless firmware.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index b194a59ecb50..b7da1aae988d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -249,6 +249,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-iwlwifi-7260 \
              ${PN}-iwlwifi-7265 \
              ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-8265 \
+             ${PN}-iwlwifi-9000 \
              ${PN}-iwlwifi-misc \
              ${PN}-ibt-license ${PN}-ibt ${PN}-ibt-misc \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
@@ -596,6 +597,7 @@ LICENSE_${PN}-iwlwifi-7265      = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-7265d     = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-8000c     = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-8265      = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-9000      = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-misc      = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-license   = "Firmware-iwlwifi_firmware"
 
@@ -622,6 +624,7 @@ FILES_${PN}-iwlwifi-7265   = "${nonarch_base_libdir}/firmware/iwlwifi-7265-*.uco
 FILES_${PN}-iwlwifi-7265d   = "${nonarch_base_libdir}/firmware/iwlwifi-7265D-*.ucode"
 FILES_${PN}-iwlwifi-8000c   = "${nonarch_base_libdir}/firmware/iwlwifi-8000C-*.ucode"
 FILES_${PN}-iwlwifi-8265   = "${nonarch_base_libdir}/firmware/iwlwifi-8265-*.ucode"
+FILES_${PN}-iwlwifi-9000   = "${nonarch_base_libdir}/firmware/iwlwifi-9000-*.ucode"
 FILES_${PN}-iwlwifi-misc   = "${nonarch_base_libdir}/firmware/iwlwifi-*.ucode"
 
 RDEPENDS_${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
@@ -645,6 +648,7 @@ RDEPENDS_${PN}-iwlwifi-7265      = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-7265d     = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-8000c     = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-8265      = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-9000      = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-misc      = "${PN}-iwlwifi-license"
 
 # -iwlwifi-misc is a "catch all" package that includes all the iwlwifi
-- 
2.13.3


