Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.7410.1594202570234593461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 03:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: jun.miao@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 068A2kBw004476
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 8 Jul 2020 03:02:46 -0700 (PDT)
Received: from pek-lpggp7.wrs.com (128.224.153.21) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Wed, 8 Jul 2020
 03:02:30 -0700
From: "jmiao1" <jun.miao@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH] linux-firmware: Correct the path of ibt firmware
Date: Wed, 8 Jul 2020 18:02:29 +0800
Message-ID: <20200708100229.797065-1-jun.miao@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The right ibt(intel bluetooth) firmware is under the folder of "intel".

Signed-off-by: Jun Miao <jun.miao@windriver.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
index 726055738f..ab8cafa9b3 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
@@ -817,7 +817,7 @@ FILES_${PN}-ibt-hw-37-8 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.8*.bs
 FILES_${PN}-ibt-11-5    = "${nonarch_base_libdir}/firmware/intel/ibt-11-5.sfi ${nonarch_base_libdir}/firmware/intel/ibt-11-5.ddc"
 FILES_${PN}-ibt-12-16   = "${nonarch_base_libdir}/firmware/intel/ibt-12-16.sfi ${nonarch_base_libdir}/firmware/intel/ibt-12-16.ddc"
 FILES_${PN}-ibt-17 = "${nonarch_base_libdir}/firmware/intel/ibt-17-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-17-*.ddc"
-FILES_${PN}-ibt-misc    = "${nonarch_base_libdir}/firmware/ibt-*"
+FILES_${PN}-ibt-misc    = "${nonarch_base_libdir}/firmware/intel/ibt-*"
 
 RDEPENDS_${PN}-ibt-hw-37-7 = "${PN}-ibt-license"
 RDEPENDS_${PN}-ibt-hw-37.8 = "${PN}-ibt-license"
-- 
2.25.1

