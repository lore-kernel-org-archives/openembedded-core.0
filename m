Return-Path: <sgw@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9AFC162136
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 14:52:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP; 23 Mar 2016 07:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,382,1455004800"; d="scan'208";a="930227033"
Received: from cmdeoliv-mobl4.amr.corp.intel.com (HELO
	swold-mobl.jf.intel.com) ([10.254.120.177])
	by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2016 07:52:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 23 Mar 2016 07:52:14 -0700
Message-Id: <1458744735-32559-4-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1458744735-32559-1-git-send-email-sgw@linux.intel.com>
References: <1458744735-32559-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 3/4 v2] linux-firmware: Clean-up and sync license data
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
X-List-Received-Date: Wed, 23 Mar 2016 14:52:23 -0000

This re-orders the licenses to be alpha by Firmware-* license name, not by LICEN*E name.
This adds licneses that had not been in the list before.

     Firmware-adsp_sst
     Firmware-amdgpu
     Firmware-atmel
     Firmware-cavium
     Firmware-e100
     Firmware-hfi1_firmware
     Firmware-i915
     Firmware-kaweth
     Firmware-moxa
     Firmware-nvidia
     Firmware-qla1280
     Firmware-ti-keystone

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../linux-firmware/linux-firmware_git.bb           | 99 +++++++++++++++++-----
 1 file changed, 77 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 8ec64e7..2d7126f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -3,135 +3,171 @@ SECTION = "kernel"
 
 LICENSE = "\
     Firmware-Abilis \
+    & Firmware-adsp_sst \
     & Firmware-agere \
+    & Firmware-amdgpu \
     & Firmware-amd-ucode \
     & Firmware-atheros_firmware \
+    & Firmware-atmel \
     & Firmware-broadcom_bcm43xx \
     & Firmware-ca0132 \
+    & Firmware-cavium \
     & Firmware-chelsio_firmware \
     & Firmware-cw1200 \
     & Firmware-dib0700 \
+    & Firmware-e100 \
     & Firmware-ene_firmware \
     & Firmware-fw_sst_0f28 \
     & Firmware-go7007 \
+    & Firmware-hfi1_firmware \
     & Firmware-i2400m \
+    & Firmware-i915 \
     & Firmware-ibt_firmware \
     & Firmware-it913x \
     & Firmware-iwlwifi_firmware \
     & Firmware-IntcSST2 \
+    & Firmware-kaweth \
     & Firmware-Marvell \
+    & Firmware-moxa \
     & Firmware-mwl8335 \
     & Firmware-myri10ge_firmware \
+    & Firmware-nvidia \
     & Firmware-OLPC \
+    & Firmware-ath9k-htc \
     & Firmware-phanfw \
     & Firmware-qat \
+    & Firmware-qla1280 \
     & Firmware-qla2xxx \
+    & Firmware-qualcommAthos_ar3k \
+    & Firmware-qualcommAthos_ath10k \
     & Firmware-r8a779x_usb3 \
     & Firmware-radeon \
     & Firmware-ralink_a_mediatek_company_firmware \
     & Firmware-ralink-firmware \
     & Firmware-rtlwifi_firmware \
+    & Firmware-siano \
     & Firmware-tda7706-firmware \
     & Firmware-ti-connectivity \
+    & Firmware-ti-keystone \
     & Firmware-ueagle-atm4-firmware \
     & Firmware-via_vt6656 \
     & Firmware-wl1251 \
     & Firmware-xc4000 \
     & Firmware-xc5000 \
     & Firmware-xc5000c \
-    & Firmware-siano \
-    & Firmware-qualcommAthos_ar3k \
-    & Firmware-qualcommAthos_ath10k \
-    & Firmware-ath9k-htc \
 "
 
 LIC_FILES_CHKSUM = "\
     file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
+    file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
+    file://LICENSE.amdgpu;md5=a8592c24c2672062e03c7392fc7fe3bc \
+    file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3 \
     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
+    file://LICENSE.atmel;md5=aa74ac0c60595dee4d4e239107ea77a3 \
     file://LICENCE.broadcom_bcm43xx;md5=3160c14df7228891b868060e1951dfbc \
     file://LICENCE.ca0132;md5=209b33e66ee5be0461f13d31da392198 \
+    file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
     file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
     file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
+    file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
+    file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8 \
     file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c296720b7d3921 \
     file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293 \
     file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb \
+    file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444 \
     file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
+    file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570 \
     file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b \
+    file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
     file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
     file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
-    file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
+    file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
     file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
+    file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
     file://LICENCE.mwl8335;md5=9a6271ee0e644404b2ff3c61fd070983 \
     file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
+    file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07 \
     file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd \
+    file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 \
     file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa \
     file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
+    file://LICENCE.qla1280;md5=d6895732e622d950609093223a2c4f5d \
     file://LICENCE.qla2xxx;md5=f5ce8529ec5c17cb7f911d2721d90e91 \
+    file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 \
+    file://LICENSE.QualcommAtheros_ath10k;md5=b5fe244fb2b532311de1472a3bc06da5 \
     file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498 \
+    file://LICENSE.radeon;md5=6c7f97c6c62bdd9596d0238bb205118c \
     file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 \
     file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
+    file://LICENCE.siano;md5=602c79ae3f98f1e73d880fd9f940a418 \
     file://LICENCE.tda7706-firmware.txt;md5=835997cf5e3c131d0dddd695c7d9103e \
-    file://LICENCE.ti-connectivity;md5=186e7a43cf6c274283ad81272ca218ea \
+    file://LICENCE.ti-connectivity;md5=c5e02be633f1499c109d1652514d85ec \
+    file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c \
     file://LICENCE.ueagle-atm4-firmware;md5=4ed7ea6b507ccc583b9d594417714118 \
     file://LICENCE.via_vt6656;md5=e4159694cba42d4377a912e78a6e850f \
     file://LICENCE.wl1251;md5=ad3f81922bb9e197014bb187289d3b5b \
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3 \
-    file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
-    file://LICENSE.radeon;md5=6c7f97c6c62bdd9596d0238bb205118c \
-    file://LICENCE.siano;md5=602c79ae3f98f1e73d880fd9f940a418 \
-    file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 \
-    file://LICENSE.QualcommAtheros_ath10k;md5=b5fe244fb2b532311de1472a3bc06da5 \
-    file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
 NO_GENERIC_LICENSE[Firmware-Abilis] = "LICENCE.Abilis"
+NO_GENERIC_LICENSE[Firmware-adsp_sst] = "LICENCE.adsp_sst"
 NO_GENERIC_LICENSE[Firmware-agere] = "LICENCE.agere"
+NO_GENERIC_LICENSE[Firmware-amdgpu] = "LICENSE.amdgpu"
+NO_GENERIC_LICENSE[Firmware-amd-ucode] = "LICENSE.amd-ucode"
 NO_GENERIC_LICENSE[Firmware-atheros_firmware] = "LICENCE.atheros_firmware"
+NO_GENERIC_LICENSE[Firmware-atmel] = "LICENSE.atmel"
 NO_GENERIC_LICENSE[Firmware-broadcom_bcm43xx] = "LICENCE.broadcom_bcm43xx"
 NO_GENERIC_LICENSE[Firmware-ca0132] = "LICENCE.ca0132"
+NO_GENERIC_LICENSE[Firmware-cavium] = "LICENCE.cavium"
 NO_GENERIC_LICENSE[Firmware-chelsio_firmware] = "LICENCE.chelsio_firmware"
 NO_GENERIC_LICENSE[Firmware-cw1200] = "LICENCE.cw1200"
+NO_GENERIC_LICENSE[Firmware-dib0700] = "LICENSE.dib0700"
+NO_GENERIC_LICENSE[Firmware-e100] = "LICENCE.e100"
 NO_GENERIC_LICENSE[Firmware-ene_firmware] = "LICENCE.ene_firmware"
 NO_GENERIC_LICENSE[Firmware-fw_sst_0f28] = "LICENCE.fw_sst_0f28"
 NO_GENERIC_LICENSE[Firmware-go7007] = "LICENCE.go7007"
+NO_GENERIC_LICENSE[Firmware-hfi1_firmware] = "LICENCE.hfi1_firmware"
 NO_GENERIC_LICENSE[Firmware-i2400m] = "LICENCE.i2400m"
+NO_GENERIC_LICENSE[Firmware-i915] = "LICENCE.915"
 NO_GENERIC_LICENSE[Firmware-ibt_firmware] = "LICENCE.ibt_firmware"
+NO_GENERIC_LICENSE[Firmware-IntcSST2] = "LICENCE.IntcSST2"
 NO_GENERIC_LICENSE[Firmware-it913x] = "LICENCE.it913x"
 NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
-NO_GENERIC_LICENSE[Firmware-IntcSST2] = "LICENCE.IntcSST2"
+NO_GENERIC_LICENSE[Firmware-kaweth] = "LICENCE.kaweth"
 NO_GENERIC_LICENSE[Firmware-Marvell] = "LICENCE.Marvell"
+NO_GENERIC_LICENSE[Firmware-moxa] = "LICENCE.moxa"
 NO_GENERIC_LICENSE[Firmware-mwl8335] = "LICENCE.mwl8335"
 NO_GENERIC_LICENSE[Firmware-myri10ge_firmware] = "LICENCE.myri10ge_firmware"
+NO_GENERIC_LICENSE[Firmware-nvidia] = "LICENCE.nvidia"
 NO_GENERIC_LICENSE[Firmware-OLPC] = "LICENCE.OLPC"
+NO_GENERIC_LICENSE[Firmware-ath9k-htc] = "LICENCE.open-ath9k-htc-firmware"
 NO_GENERIC_LICENSE[Firmware-phanfw] = "LICENCE.phanfw"
 NO_GENERIC_LICENSE[Firmware-qat] = "LICENCE.qat_firmware"
+NO_GENERIC_LICENSE[Firmware-qla1280] = "LICENCE.qla1280"
 NO_GENERIC_LICENSE[Firmware-qla2xxx] = "LICENCE.qla2xxx"
+NO_GENERIC_LICENSE[Firmware-qualcommAthos_ar3k] = "LICENSE.QualcommAtheros_ar3k"
+NO_GENERIC_LICENSE[Firmware-qualcommAthos_ath10k] = "LICENSE.QualcommAtheros_ath10k"
 NO_GENERIC_LICENSE[Firmware-r8a779x_usb3] = "LICENCE.r8a779x_usb3"
+NO_GENERIC_LICENSE[Firmware-radeon] = "LICENSE.radeon"
 NO_GENERIC_LICENSE[Firmware-ralink_a_mediatek_company_firmware] = "LICENCE.ralink_a_mediatek_company_firmware"
 NO_GENERIC_LICENSE[Firmware-ralink-firmware] = "LICENCE.ralink-firmware.txt"
 NO_GENERIC_LICENSE[Firmware-rtlwifi_firmware] = "LICENCE.rtlwifi_firmware.txt"
+NO_GENERIC_LICENSE[Firmware-siano] = "LICENCE.siano"
 NO_GENERIC_LICENSE[Firmware-tda7706-firmware] = "LICENCE.tda7706-firmware.txt"
 NO_GENERIC_LICENSE[Firmware-ti-connectivity] = "LICENCE.ti-connectivity"
+NO_GENERIC_LICENSE[Firmware-ti-keystone] = "LICENCE.ti-keystone"
 NO_GENERIC_LICENSE[Firmware-ueagle-atm4-firmware] = "LICENCE.ueagle-atm4-firmware"
 NO_GENERIC_LICENSE[Firmware-via_vt6656] = "LICENCE.via_vt6656"
 NO_GENERIC_LICENSE[Firmware-wl1251] = "LICENCE.wl1251"
 NO_GENERIC_LICENSE[Firmware-xc4000] = "LICENCE.xc4000"
 NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
-NO_GENERIC_LICENSE[Firmware-amd-ucode] = "LICENSE.amd-ucode"
-NO_GENERIC_LICENSE[Firmware-dib0700] = "LICENSE.dib0700"
-NO_GENERIC_LICENSE[Firmware-radeon] = "LICENSE.radeon"
-NO_GENERIC_LICENSE[Firmware-siano] = "LICENCE.siano"
-NO_GENERIC_LICENSE[Firmware-qualcommAthos_ar3k] = "LICENSE.QualcommAtheros_ar3k"
-NO_GENERIC_LICENSE[Firmware-qualcommAthos_ath10k] = "LICENSE.QualcommAtheros_ath10k"
-NO_GENERIC_LICENSE[Firmware-ath9k-htc] = "LICENCE.open-ath9k-htc-firmware"
 
 SRCREV = "5f8ca0c1db6106a2d6d7e85eee778917ff03c3de"
 PE = "1"
@@ -433,38 +469,57 @@ RPROVIDES_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-
 RREPLACES_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-iwlwifi-7260-9"
 RCONFLICTS_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-iwlwifi-7260-9"
 
+
+
 # For other firmwares
 # Maybe split out to separate packages when needed.
 LICENSE_${PN} = "\
     Firmware-Abilis \
+    & Firmware-adsp_sst \
     & Firmware-agere \
+    & Firmware-amdgpu \
     & Firmware-amd-ucode \
+    & Firmware-atmel \
     & Firmware-ca0132 \
+    & Firmware-cavium \
     & Firmware-chelsio_firmware \
     & Firmware-cw1200 \
     & Firmware-dib0700 \
+    & Firmware-e100 \
     & Firmware-ene_firmware \
     & Firmware-fw_sst_0f28 \
     & Firmware-go7007 \
+    & Firmware-hfi1_firmware \
     & Firmware-i2400m \
+    & Firmware-i915 \
     & Firmware-ibt_firmware \
     & Firmware-it913x \
+    & Firmware-IntcSST2 \
+    & Firmware-kaweth \
+    & Firmware-moxa \
     & Firmware-mwl8335 \
     & Firmware-myri10ge_firmware \
+    & Firmware-nvidia \
     & Firmware-OLPC \
+    & Firmware-ath9k-htc \
     & Firmware-phanfw \
     & Firmware-qat \
+    & Firmware-qla1280 \
     & Firmware-qla2xxx \
     & Firmware-r8a779x_usb3 \
+    & Firmware-radeon \
     & Firmware-ralink_a_mediatek_company_firmware \
+    & Firmware-siano \
     & Firmware-tda7706-firmware \
+    & Firmware-ti-connectivity \
+    & Firmware-ti-keystone \
     & Firmware-ueagle-atm4-firmware \
     & Firmware-wl1251 \
     & Firmware-xc4000 \
     & Firmware-xc5000 \
     & Firmware-xc5000c \
-    & Firmware-ath9k-htc \
 "
+
 FILES_${PN}-license += "/lib/firmware/LICEN*"
 FILES_${PN} += "/lib/firmware/*"
 RDEPENDS_${PN} += "${PN}-license"
-- 
2.5.0


