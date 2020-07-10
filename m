Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.6512.1594370621020311629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 01:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: yongxin.liu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 06A8hdlk016084
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 01:43:39 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 10 Jul 2020
 01:43:38 -0700
From: "Yongxin Liu" <yongxin.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] linux-firmware: move ibt-misc to the end of ibt packages
Date: Fri, 10 Jul 2020 16:39:22 +0800
Message-ID: <20200710083922.34262-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Content-Type: text/plain

After commit 3ca1d3fa1d ("linux-firmware: fix the wrong file
path for ibt-misc"), if we don't change the location of ibt-misc
in PACKAGES, ibt-misc will include all ibt files and make other
individual ibt package empty.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
index 79acccddc7..2b5963c0c8 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
@@ -278,9 +278,10 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-8265 \
              ${PN}-iwlwifi-9000 \
              ${PN}-iwlwifi-misc \
-             ${PN}-ibt-license ${PN}-ibt ${PN}-ibt-misc \
+             ${PN}-ibt-license ${PN}-ibt \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
              ${PN}-ibt-17 \
+             ${PN}-ibt-misc \
              ${PN}-i915-license ${PN}-i915 \
              ${PN}-ice-license ${PN}-ice \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
-- 
2.14.4

