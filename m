Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.3996.1594181434956313069
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 21:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yongxin.liu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0684AD15020344
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Jul 2020 21:10:23 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 7 Jul 2020
 21:10:02 -0700
From: "Yongxin Liu" <yongxin.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] linux-firmware: fix the wrong file path for ibt-misc
Date: Wed, 8 Jul 2020 12:05:32 +0800
Message-ID: <20200708040532.7283-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
index 392e03a10a..79acccddc7 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
@@ -813,7 +813,7 @@ FILES_${PN}-ibt-hw-37-8 = "${nonarch_base_libdir}/firmware/intel/ibt-hw-37.8*.bs
 FILES_${PN}-ibt-11-5    = "${nonarch_base_libdir}/firmware/intel/ibt-11-5.sfi ${nonarch_base_libdir}/firmware/intel/ibt-11-5.ddc"
 FILES_${PN}-ibt-12-16   = "${nonarch_base_libdir}/firmware/intel/ibt-12-16.sfi ${nonarch_base_libdir}/firmware/intel/ibt-12-16.ddc"
 FILES_${PN}-ibt-17 = "${nonarch_base_libdir}/firmware/intel/ibt-17-*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-17-*.ddc"
-FILES_${PN}-ibt-misc    = "${nonarch_base_libdir}/firmware/ibt-*"
+FILES_${PN}-ibt-misc    = "${nonarch_base_libdir}/firmware/intel/ibt-*"
 
 RDEPENDS_${PN}-ibt-hw-37-7 = "${PN}-ibt-license"
 RDEPENDS_${PN}-ibt-hw-37.8 = "${PN}-ibt-license"
-- 
2.14.4

