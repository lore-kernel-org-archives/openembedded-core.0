Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.34639.1620052602095814023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 07:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: W6Tmql1sYA+w39qe9nezlmywJOh067SIEMERCnoe5KXmas12vkIZuXA49QTlT5pHr2YW0OazY7
 dE2uZePAxinQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="197849561"
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; 
   d="scan'208";a="197849561"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2021 07:36:50 -0700
IronPort-SDR: gsQRVhS12G1yxdfRRtN90NUCGv6HxpJ3rmP79j05IOq3vYsqvrFVE1SJvB0NItyJ08PvL72tXY
 0XXhg37v1sPQ==
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; 
   d="scan'208";a="405697162"
Received: from semohdyu-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.72.206])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2021 07:36:49 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 6/6] linux-firmware: Package RSI 911x WiFi firmware
Date: Mon,  3 May 2021 22:36:34 +0800
Message-Id: <a6c9d8d2ba11b385d36ae6d7315ace398c693971.1620052258.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620052258.git.anuj.mittal@intel.com>
References: <cover.1620052258.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marek Vasut <marex@denx.de>

The RSI 911x WiFi firmware is already part of the linux-firmware
repository, package it to make it easily available.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc44b71f6ea68ca0f483d635df7dc7b9905b1593)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux-firmware/linux-firmware_20210208.bb         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
index 69672c85f6..1a9374d0b4 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
@@ -225,6 +225,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
              ${PN}-ti-connectivity-license ${PN}-wlcommon ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
+             ${PN}-rs9113 ${PN}-rs9116 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-rtl8168 \
              ${PN}-cypress-license \
@@ -525,6 +526,16 @@ RDEPENDS_${PN}-nvidia-gpu += "${PN}-nvidia-license"
 RDEPENDS_${PN}-nvidia-tegra += "${PN}-nvidia-license"
 RDEPENDS_${PN}-nvidia-tegra-k1 += "${PN}-nvidia-license"
 
+# For RSI RS911x WiFi
+LICENSE_${PN}-rs9113 = "WHENCE"
+LICENSE_${PN}-rs9116 = "WHENCE"
+
+FILES_${PN}-rs9113 = " ${nonarch_base_libdir}/firmware/rsi/rs9113*.rps "
+FILES_${PN}-rs9116 = " ${nonarch_base_libdir}/firmware/rsi/rs9116*.rps "
+
+RDEPENDS_${PN}-rs9113 += "${PN}-whence-license"
+RDEPENDS_${PN}-rs9116 += "${PN}-whence-license"
+
 # For rtl
 LICENSE_${PN}-rtl8188 = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi_firmware"
-- 
2.30.2

