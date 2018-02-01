Return-Path: <Liwei.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC6A7786B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 06:40:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w116eqi7013481
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 22:40:52 -0800 (PST)
Received: from pek-lpggp3.wrs.com (128.224.153.76) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 31 Jan 2018 22:40:51 -0800
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Feb 2018 01:40:49 -0500
Message-ID: <20180201064049.114023-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [PATCH] linux-firmware: package all ibt-17-x-x.sfi/ddc firmware
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
X-List-Received-Date: Thu, 01 Feb 2018 06:40:52 -0000
Content-Type: text/plain

All ibt-17-x-x.sfi/ddc firmware are use to support Intel Bluetooth 9560
they are needed in different version of Bluetooth driver since
4.14 kernel version.

commit b77bb7afe513 ("linux-firmware: package ibt-17-16-1 firmware")
only package one of the ibt-17 series firmware.

As the Bluetooth driver's update, to avoid packaging the ibt-17 firmware
one by one, install them in one package ibt-17.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index e3ff8288c895..cc97c91fd339 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -256,7 +256,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-iwlwifi-misc \
              ${PN}-ibt-license ${PN}-ibt ${PN}-ibt-misc \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
-             ${PN}-ibt-17-16-1 \
+             ${PN}-ibt-17 \
              ${PN}-i915-license ${PN}-i915 \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2-mips \
@@ -681,7 +681,7 @@ LICENSE_${PN}-ibt-hw-37-7 = "Firmware-ibt_firmware"
 LICENSE_${PN}-ibt-hw-37-8 = "Firmware-ibt_firmware"
 LICENSE_${PN}-ibt-11-5    = "Firmware-ibt_firmware"
 LICENSE_${PN}-ibt-12-16   = "Firmware-ibt_firmware"
-LICENSE_${PN}-ibt-17-16-1 = "Firmware-ibt_firmware"
+LICENSE_${PN}-ibt-17 = "Firmware-ibt_firmware"
 LICENSE_${PN}-ibt-misc    = "Firmware-ibt_firmware"
 
 FILES_${PN}-ibt-license = "${nonarch_base_libdir}/firmware/LICENCE.ibt_firmware"
@@ -689,14 +689,14 @@ FILES_${PN}-ibt-hw-37-7 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.7*.bs
 FILES_${PN}-ibt-hw-37-8 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.8*.bseq"
 FILES_${PN}-ibt-11-5    = "${nonarch_base_libdir}/firmware/intel/ibt-11-5.sfi /lib/firmware/intel/ibt-11-5.ddc"
 FILES_${PN}-ibt-12-16   = "${nonarch_base_libdir}/firmware/intel/ibt-12-16.sfi /lib/firmware/intel/ibt-12-16.ddc"
-FILES_${PN}-ibt-17-16-1 = "${nonarch_base_libdir}/firmware/intel/ibt-17-16-1.sfi /lib/firmware/intel/ibt-17-16-1.ddc"
+FILES_${PN}-ibt-17 = "${nonarch_base_libdir}/firmware/intel/ibt-17-*.sfi /lib/firmware/intel/ibt-17-*.ddc"
 FILES_${PN}-ibt-misc    = "${nonarch_base_libdir}/firmware/ibt-*"
 
 RDEPENDS_${PN}-ibt-hw-37-7 = "${PN}-ibt-license"
 RDEPENDS_${PN}-ibt-hw-37.8 = "${PN}-ibt-license"
 RDEPENDS_${PN}-ibt-11-5    = "${PN}-ibt-license"
 RDEPENDS_${PN}-ibt-12-16   = "${PN}-ibt-license"
-RDEPENDS_${PN}-ibt-17-16-1 = "${PN}-ibt-license"
+RDEPENDS_${PN}-ibt-17 = "${PN}-ibt-license"
 RDEPENDS_${PN}-ibt-misc    = "${PN}-ibt-license"
 
 ALLOW_EMPTY_${PN}-ibt= "1"
-- 
2.13.3


