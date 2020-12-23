Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:18:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 6WRtQrpo2cBPvSl49HEWjONTeX8oSPcq6XyRp9Lv25CY5mq3n0MYMojI0oXz6FEf2AuAsVe2lT
 5DvnIUSwJMEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155235968"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155235968"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:18:59 -0800
IronPort-SDR: xxbLLity6aWc9kECZR4ZCZdMwxe2sFYwMTKxspmlqmaQadhPieM8G91i/cEIIq0koyWu8akOpW
 WDxUCQ3FnS9A==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027498"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:18:57 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 05/35] linux-firmware: package firmware for Lontium lt9611uxc bridge
Date: Wed, 23 Dec 2020 23:18:15 +0800
Message-Id: <e4092d18f9d549d1ddddad0027b2301fe1b137d8.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Package firmware for Lontium lt9611uxc DSI to HDMI bridge, found e.g. on
Qualcomm RB5 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d16922943ffa6003d611c367b934d199c549c4c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux-firmware/linux-firmware_20201218.bb          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
index bc9daa2d4e..700a79b118 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
@@ -31,6 +31,7 @@ LICENSE = "\
     & Firmware-iwlwifi_firmware \
     & Firmware-IntcSST2 \
     & Firmware-kaweth \
+    & Firmware-Lontium \
     & Firmware-Marvell \
     & Firmware-moxa \
     & Firmware-myri10ge_firmware \
@@ -94,6 +95,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
                     file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
                     file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
+                    file://LICENSE.Lontium;md5=4ec8dc582ff7295f39e2ca6a7b0be2b6 \
                     file://LICENCE.Marvell;md5=28b6ed8bd04ba105af6e4dcd6e997772 \
                     file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
                     file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
@@ -161,6 +163,7 @@ NO_GENERIC_LICENSE[Firmware-IntcSST2] = "LICENCE.IntcSST2"
 NO_GENERIC_LICENSE[Firmware-it913x] = "LICENCE.it913x"
 NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
 NO_GENERIC_LICENSE[Firmware-kaweth] = "LICENCE.kaweth"
+NO_GENERIC_LICENSE[Firmware-Lontium] = "LICENSE.Lontium"
 NO_GENERIC_LICENSE[Firmware-Marvell] = "LICENCE.Marvell"
 NO_GENERIC_LICENSE[Firmware-mediatek] = "LICENCE.mediatek"
 NO_GENERIC_LICENSE[Firmware-moxa] = "LICENCE.moxa"
@@ -298,6 +301,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 ${PN}-qcom-adreno-a630 \
              ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
+             ${PN}-lt9611uxc ${PN}-lontium-license \
              ${PN}-whence-license \
              ${PN}-license \
              "
@@ -402,6 +406,12 @@ FILES_${PN}-radeon = " \
 
 RDEPENDS_${PN}-radeon += "${PN}-radeon-license"
 
+# For lontium
+LICENSE_${PN}-lt9611uxc = "Firmware-Lontium"
+
+FILES_${PN}-lontium-license = "${nonarch_base_libdir}/firmware/LICENSE.Lontium"
+FILES_${PN}-lt9611uxc = "${nonarch_base_libdir}/firmware/lt9611uxc_fw.bin"
+
 # For marvell
 LICENSE_${PN}-pcie8897 = "Firmware-Marvell"
 LICENSE_${PN}-pcie8997 = "Firmware-Marvell"
-- 
2.29.2

