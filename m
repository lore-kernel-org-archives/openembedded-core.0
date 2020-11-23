Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.36702.1606144038537265324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 4O8ydA5i3sC10VLVPDtxRD0oypBl7aZE9FuQRcQp6L6x0kympn6OBnxxaDu0DAGc8uEfphn4kT
 c+XZMfjTKvhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="235920753"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="235920753"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:30 -0800
IronPort-SDR: X/nMOscwNji5ozqGGKlyvPtJu80ep09EtB3GeGwaZ63wUlR16DZ2kulszhJMCc7FF2iNWCeAFQ
 tMWVrZ7EpTMw==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475237"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:28 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 18/21] linux-firmware: rdepend on license for all nvidia packages
Date: Mon, 23 Nov 2020 23:06:48 +0800
Message-Id: <cbe3142a32363a45c9935b6ee748f217a699f6b8.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606111370.git.anuj.mittal@intel.com>
References: <cover.1606111370.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.oss.09@gmail.com>

Fixes commit 0671d04978 ("linux-firmware: package nvidia firmware")

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 59789dea33629a96f0fe5646eb684aa131e167bf)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
index 0abd28c9fa..49417e9932 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200817.bb
@@ -501,6 +501,7 @@ FILES_${PN}-nvidia-license = "${nonarch_base_libdir}/firmware/LICENCE.nvidia"
 
 RDEPENDS_${PN}-nvidia-gpu += "${PN}-nvidia-license"
 RDEPENDS_${PN}-nvidia-tegra += "${PN}-nvidia-license"
+RDEPENDS_${PN}-nvidia-tegra-k1 += "${PN}-nvidia-license"
 
 # For rtl
 LICENSE_${PN}-rtl8188 = "Firmware-rtlwifi_firmware"
-- 
2.28.0

