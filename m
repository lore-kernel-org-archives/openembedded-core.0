Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4293B6AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 09:38:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3N9cEm5014799
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Apr 2015 02:38:14 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 23 Apr 2015 02:38:13 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <paul.eggleton@linux.intel.com>
Date: Thu, 23 Apr 2015 17:38:17 +0800
Message-ID: <cd657d2be035654c8783adb5ce274bacfda1a455.1429781137.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1429781137.git.jackie.huang@windriver.com>
References: <cover.1429781137.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] linux-firmware: add NO_GENERIC_LIC for all licenses
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
X-List-Received-Date: Thu, 23 Apr 2015 09:38:14 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

An alternative approach with NO_GENERIC_LIC has been added
in license.bbclass to allow copying non-generic license,
add it for all firmware licenses.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../linux-firmware/linux-firmware_git.bb           | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 52c6825..2b2eab1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -79,6 +79,45 @@ LIC_FILES_CHKSUM = "\
     file://LICENSE.radeon;md5=07b0c31777bd686d8e1609c6940b5e74 \
 "
 
+# These are not common licenses, set NO_GENERIC_LIC for them
+# so that the license files will be copied from fetched source
+NO_GENERIC_LIC[Firmware-Abilis] = "LICENCE.Abilis"
+NO_GENERIC_LIC[Firmware-agere] = "LICENCE.agere"
+NO_GENERIC_LIC[Firmware-atheros_firmware] = "LICENCE.atheros_firmware"
+NO_GENERIC_LIC[Firmware-broadcom_bcm43xx] = "LICENCE.broadcom_bcm43xx"
+NO_GENERIC_LIC[Firmware-ca0132] = "LICENCE.ca0132"
+NO_GENERIC_LIC[Firmware-chelsio_firmware] = "LICENCE.chelsio_firmware"
+NO_GENERIC_LIC[Firmware-cw1200] = "LICENCE.cw1200"
+NO_GENERIC_LIC[Firmware-ene_firmware] = "LICENCE.ene_firmware"
+NO_GENERIC_LIC[Firmware-fw_sst_0f28] = "LICENCE.fw_sst_0f28"
+NO_GENERIC_LIC[Firmware-go7007] = "LICENCE.go7007"
+NO_GENERIC_LIC[Firmware-i2400m] = "LICENCE.i2400m"
+NO_GENERIC_LIC[Firmware-ibt_firmware] = "LICENCE.ibt_firmware"
+NO_GENERIC_LIC[Firmware-it913x] = "LICENCE.it913x"
+NO_GENERIC_LIC[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
+NO_GENERIC_LIC[Firmware-Marvell] = "LICENCE.Marvell"
+NO_GENERIC_LIC[Firmware-mwl8335] = "LICENCE.mwl8335"
+NO_GENERIC_LIC[Firmware-myri10ge_firmware] = "LICENCE.myri10ge_firmware"
+NO_GENERIC_LIC[Firmware-OLPC] = "LICENCE.OLPC"
+NO_GENERIC_LIC[Firmware-phanfw] = "LICENCE.phanfw"
+NO_GENERIC_LIC[Firmware-qat_dh895xcc_firmware] = "LICENCE.qat_dh895xcc_firmware"
+NO_GENERIC_LIC[Firmware-qla2xxx] = "LICENCE.qla2xxx"
+NO_GENERIC_LIC[Firmware-r8a779x_usb3] = "LICENCE.r8a779x_usb3"
+NO_GENERIC_LIC[Firmware-ralink_a_mediatek_company_firmware] = "LICENCE.ralink_a_mediatek_company_firmware"
+NO_GENERIC_LIC[Firmware-ralink-firmware] = "LICENCE.ralink-firmware.txt"
+NO_GENERIC_LIC[Firmware-rtlwifi_firmware] = "LICENCE.rtlwifi_firmware.txt"
+NO_GENERIC_LIC[Firmware-tda7706-firmware] = "LICENCE.tda7706-firmware.txt"
+NO_GENERIC_LIC[Firmware-ti-connectivity] = "LICENCE.ti-connectivity"
+NO_GENERIC_LIC[Firmware-ueagle-atm4-firmware] = "LICENCE.ueagle-atm4-firmware"
+NO_GENERIC_LIC[Firmware-via_vt6656] = "LICENCE.via_vt6656"
+NO_GENERIC_LIC[Firmware-wl1251] = "LICENCE.wl1251"
+NO_GENERIC_LIC[Firmware-xc4000] = "LICENCE.xc4000"
+NO_GENERIC_LIC[Firmware-xc5000] = "LICENCE.xc5000"
+NO_GENERIC_LIC[Firmware-xc5000c] = "LICENCE.xc5000c"
+NO_GENERIC_LIC[Firmware-amd-ucode] = "LICENSE.amd-ucode"
+NO_GENERIC_LIC[Firmware-dib0700] = "LICENSE.dib0700"
+NO_GENERIC_LIC[Firmware-radeon] = "LICENSE.radeon"
+
 SRCREV = "0e5f63771d0df6d7859f7c4100a74d737c62ac88"
 PE = "1"
 PV = "0.0+git${SRCPV}"
-- 
1.9.1


