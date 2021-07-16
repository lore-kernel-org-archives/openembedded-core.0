Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.1434.1626403354833085378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494602"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494602"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:44 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075445"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:43 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/28] linux-firmware: Package RSI 911x WiFi firmware
Date: Fri, 16 Jul 2021 10:42:07 +0800
Message-Id: <2e3dff861ba5be445fd5ff34dd870b266af4f5e1.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
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
 .../linux-firmware/linux-firmware_20210511.bb         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
index ed6e78175a..26091fba70 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210511.bb
@@ -229,6 +229,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-sd8887 ${PN}-sd8897 ${PN}-sd8997 ${PN}-usb8997 \
              ${PN}-ti-connectivity-license ${PN}-wlcommon ${PN}-wl12xx ${PN}-wl18xx \
              ${PN}-vt6656-license ${PN}-vt6656 \
+             ${PN}-rs9113 ${PN}-rs9116 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-rtl8168 \
              ${PN}-cypress-license \
@@ -529,6 +530,16 @@ RDEPENDS_${PN}-nvidia-gpu += "${PN}-nvidia-license"
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
2.31.1

