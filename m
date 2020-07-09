Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.874.1594273838714072022
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 22:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: jun.miao@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0695oZh3021368
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 8 Jul 2020 22:50:35 -0700 (PDT)
Received: from pek-jmiao1-u16.wrs.com (128.224.162.214) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 8 Jul 2020 22:50:17 -0700
From: "jmiao1" <jun.miao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>
Subject: [oe-core][PATCH] linux-firmware: fix iwlwifi-misc to include all iwlwifi firmware
Date: Thu, 9 Jul 2020 13:50:15 +0800
Message-ID: <1594273815-13127-1-git-send-email-jun.miao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Jun Miao <jun.miao@windriver.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
index 79acccddc7..321d808884 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
@@ -265,7 +265,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
              \
-             ${PN}-iwlwifi-license ${PN}-iwlwifi \
+             ${PN}-iwlwifi-license ${PN}-iwlwifi ${PN}-iwlwifi-misc \
              ${PN}-iwlwifi-135-6 \
              ${PN}-iwlwifi-3160-7 ${PN}-iwlwifi-3160-8 ${PN}-iwlwifi-3160-9 \
              ${PN}-iwlwifi-3160-10 ${PN}-iwlwifi-3160-12 ${PN}-iwlwifi-3160-13 \
@@ -277,7 +277,6 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-iwlwifi-7265 \
              ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-8265 \
              ${PN}-iwlwifi-9000 \
-             ${PN}-iwlwifi-misc \
              ${PN}-ibt-license ${PN}-ibt ${PN}-ibt-misc \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
              ${PN}-ibt-17 \
-- 
2.23.0

