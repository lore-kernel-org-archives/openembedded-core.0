Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: feo30qZWJjGcLTpvUQgWtk0BR/ImEeXmgNeDeFVBNwQ04LkGniOFSMt5DMO2vLi4FDpAAaKhSh
 ROKjPETRhKag==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155235950"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155235950"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:18:56 -0800
IronPort-SDR: z2M7WNSwgGbF/MY7sFmzGKfjsyhr9FWpYEOY73PJaoRaacwVtCkCisdWcvDwCEoCweK0p7zccx
 LdhFtRRjpCMA==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027486"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:18:55 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 03/35] linux-firmware: package ath11k firmware
Date: Wed, 23 Dec 2020 23:18:13 +0800
Message-Id: <1382957d257aa5df060096a2b04e462998f3cd7c.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Package firmware for new generation of Atheros WiFi cards.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23c606e41e49a93289b7bd5c5c7d5eec962a3ffa)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux-firmware/linux-firmware_20201118.bb              | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
index 5de7157f3a..baac26c510 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20201118.bb
@@ -261,7 +261,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-bcm43xx-hdr \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k \
              ${PN}-gplv2-license ${PN}-carl9170 \
-             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-qca \
+             ${PN}-ar3k-license ${PN}-ar3k ${PN}-ath10k-license ${PN}-ath10k ${PN}-ath11k ${PN}-qca \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
              \
@@ -356,12 +356,17 @@ FILES_${PN}-ath10k = " \
   ${nonarch_base_libdir}/firmware/ath10k \
 "
 
+FILES_${PN}-ath11k = " \
+  ${nonarch_base_libdir}/firmware/ath11k \
+"
+
 FILES_${PN}-qca = " \
   ${nonarch_base_libdir}/firmware/qca \
 "
 
 RDEPENDS_${PN}-ar3k += "${PN}-ar3k-license"
 RDEPENDS_${PN}-ath10k += "${PN}-ath10k-license"
+RDEPENDS_${PN}-ath11k += "${PN}-ath10k-license"
 RDEPENDS_${PN}-qca += "${PN}-ath10k-license"
 
 # For ralink
-- 
2.29.2

