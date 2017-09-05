Return-Path: <Liwei.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A601B71B9D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 09:27:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v859RZaQ000911
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Sep 2017 02:27:35 -0700 (PDT)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 5 Sep 2017 02:27:34 -0700
From: Liwei Song <liwei.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Sep 2017 05:27:32 -0400
Message-ID: <1504603652-262027-1-git-send-email-liwei.song@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: liwei.song@windriver.com
Subject: [PATCH] linux-firmware: package qat-firmware
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
X-List-Received-Date: Tue, 05 Sep 2017 09:27:34 -0000
Content-Type: text/plain

Add packages for QAT firmware

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 .../linux-firmware/linux-firmware_git.bb           | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 3b363778f8bf..fc67f2811c08 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -253,6 +253,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-ibt-license ${PN}-ibt ${PN}-ibt-misc \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
              ${PN}-i915-license ${PN}-i915 \
+             ${PN}-qat-license ${PN}-qat_895xcc ${PN}-qat_895xcc_mmp ${PN}-qat_c3xxx ${PN}-qat_c3xxx_mmp ${PN}-qat_c62x ${PN}-qat_c62x_mmp ${PN}-qat_mmp \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2-mips \
              ${PN}-netronome-license ${PN}-netronome \
@@ -679,6 +680,32 @@ LICENSE_${PN}-adsp-sst-license    = "Firmware-adsp_sst"
 FILES_${PN}-adsp-sst              = "${nonarch_base_libdir}/firmware/intel/dsp_fw*"
 RDEPENDS_${PN}-adsp-sst           = "${PN}-adsp-sst-license"
 
+# For qat
+LICENSE_${PN}-qat_895xcc	= "Firmware-qat"
+LICENSE_${PN}-qat_895xcc_mmp	= "Firmware-qat"
+LICENSE_${PN}-qat_c3xxx		= "Firmware-qat"
+LICENSE_${PN}-qat_c3xxx_mmp	= "Firmware-qat"
+LICENSE_${PN}-qat_c62x		= "Firmware-qat"
+LICENSE_${PN}-qat_c62x_mmp	= "Firmware-qat"
+LICENSE_${PN}-qat_mmp		= "Firmware-qat"
+
+FILES_${PN}-qat-license		= "${nonarch_base_libdir}/firmware/LICENCE.qat_firmware"
+FILES_${PN}-qat_895xcc		= "${nonarch_base_libdir}/firmware/qat_895xcc.bin"
+FILES_${PN}-qat_895xcc_mmp	= "${nonarch_base_libdir}/firmware/qat_895xcc_mmp.bin"
+FILES_${PN}-qat_c3xxx		= "${nonarch_base_libdir}/firmware/qat_c3xxx.bin"
+FILES_${PN}-qat_c3xxx_mmp	= "${nonarch_base_libdir}/firmware/qat_c3xxx_mmp.bin"
+FILES_${PN}-qat_c62x		= "${nonarch_base_libdir}/firmware/qat_c62x.bin"
+FILES_${PN}-qat_c62x_mmp	= "${nonarch_base_libdir}/firmware/qat_c62x_mmp.bin"
+FILES_${PN}-qat_mmp		= "${nonarch_base_libdir}/firmware/qat_mmp.bin"
+
+RDEPENDS_${PN}-qat_895xcc = "${PN}-qat-license"
+RDEPENDS_${PN}-qat_895xcc_mmp = "${PN}-qat-license"
+RDEPENDS_${PN}-qat_c3xxx = "${PN}-qat-license"
+RDEPENDS_${PN}-qat_c3xxx_mmp = "${PN}-qat-license"
+RDEPENDS_${PN}-qat_c62x = "${PN}-qat-license"
+RDEPENDS_${PN}-qat_c62x_mmp = "${PN}-qat-license"
+RDEPENDS_${PN}-qat_mmp = "${PN}-qat-license"
+
 # For other firmwares
 # Maybe split out to separate packages when needed.
 LICENSE_${PN} = "\
-- 
2.7.4


