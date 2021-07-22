Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.5627.1626947348613332551
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 02:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 16M9n7Li010072
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 02:49:08 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 16M9n7SX006259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 02:49:07 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 22 Jul 2021 02:49:07 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Thu, 22 Jul 2021 02:49:06 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] u-boot_2021.07: incompatible with qemumips and qemumips64
Date: Thu, 22 Jul 2021 17:49:03 +0800
Message-ID: <20210722094903.27281-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

u-boot 2021.07 is not compatible with qemumips and qemumips64:

| *** Can't find default configuration "arch/../configs/qemu_mips64_defconfig"!

The supports have been removed by upstream:

https://source.denx.de/u-boot/u-boot/-/commit/5308a71

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-bsp/u-boot/u-boot_2021.07.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot_2021.07.bb b/meta/recipes-bsp/u-boot/u-boot_2021.07.bb
index bbbc99bf8d..64c20537e6 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2021.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2021.07.bb
@@ -4,3 +4,6 @@ require u-boot.inc
 SRC_URI_append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch"
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
+
+COMPATIBLE_MACHINE_qemumips = '(!.*mips).*'
+COMPATIBLE_MACHINE_qemumips64 = '(!.*mips64).*'
-- 
2.17.1

