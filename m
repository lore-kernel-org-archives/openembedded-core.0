Return-Path: <Liwei.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F10C8786E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 09:50:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0H9ogak000112
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 01:50:43 -0800 (PST)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 17 Jan 2018 01:50:41 -0800
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 04:50:35 -0500
Message-ID: <20180117095035.53665-2-liwei.song@windriver.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20180117095035.53665-1-liwei.song@windriver.com>
References: <20180117095035.53665-1-liwei.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] linux-firmware: package ibt-17-16-1 firmware
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
X-List-Received-Date: Wed, 17 Jan 2018 09:50:42 -0000
Content-Type: text/plain

Package ibt-17-16-1 firmware for Bluetooth device 9460/9560

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index b7da1aae988d..431110a509a8 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -253,6 +253,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-iwlwifi-misc \
              ${PN}-ibt-license ${PN}-ibt ${PN}-ibt-misc \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
+             ${PN}-ibt-17-16-1 \
              ${PN}-i915-license ${PN}-i915 \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2-mips \
@@ -674,6 +675,7 @@ LICENSE_${PN}-ibt-hw-37-7 = "Firmware-ibt_firmware"
 LICENSE_${PN}-ibt-hw-37-8 = "Firmware-ibt_firmware"
 LICENSE_${PN}-ibt-11-5    = "Firmware-ibt_firmware"
 LICENSE_${PN}-ibt-12-16   = "Firmware-ibt_firmware"
+LICENSE_${PN}-ibt-17-16-1 = "Firmware-ibt_firmware"
 LICENSE_${PN}-ibt-misc    = "Firmware-ibt_firmware"
 
 FILES_${PN}-ibt-license = "${nonarch_base_libdir}/firmware/LICENCE.ibt_firmware"
@@ -681,12 +683,14 @@ FILES_${PN}-ibt-hw-37-7 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.7*.bs
 FILES_${PN}-ibt-hw-37-8 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.8*.bseq"
 FILES_${PN}-ibt-11-5    = "${nonarch_base_libdir}/firmware/intel/ibt-11-5.sfi /lib/firmware/intel/ibt-11-5.ddc"
 FILES_${PN}-ibt-12-16   = "${nonarch_base_libdir}/firmware/intel/ibt-12-16.sfi /lib/firmware/intel/ibt-12-16.ddc"
+FILES_${PN}-ibt-17-16-1 = "${nonarch_base_libdir}/firmware/intel/ibt-17-16-1.sfi /lib/firmware/intel/ibt-17-16-1.ddc"
 FILES_${PN}-ibt-misc    = "${nonarch_base_libdir}/firmware/ibt-*"
 
 RDEPENDS_${PN}-ibt-hw-37-7 = "${PN}-ibt-license"
 RDEPENDS_${PN}-ibt-hw-37.8 = "${PN}-ibt-license"
 RDEPENDS_${PN}-ibt-11-5    = "${PN}-ibt-license"
 RDEPENDS_${PN}-ibt-12-16   = "${PN}-ibt-license"
+RDEPENDS_${PN}-ibt-17-16-1 = "${PN}-ibt-license"
 RDEPENDS_${PN}-ibt-misc    = "${PN}-ibt-license"
 
 ALLOW_EMPTY_${PN}-ibt= "1"
-- 
2.13.3


