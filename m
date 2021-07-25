Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.18141.1627223144854175741
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jul 2021 07:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 16PEPfWd019052
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 25 Jul 2021 07:25:41 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 16PEPeOe001847
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 25 Jul 2021 07:25:40 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 25 Jul 2021 07:25:40 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 25 Jul 2021 07:25:39 -0700
From: "kai" <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] u-boot_2021.07: set UBOOT_MACHINE for qemumips and qemumips64
Date: Sun, 25 Jul 2021 22:25:36 +0800
Message-ID: <20210725142536.40156-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to build u-boot 2021.07 for qemumips and qemumips64:

| *** Can't find default configuration "arch/../configs/qemu_mips64_defconfig"!

According to

https://source.denx.de/u-boot/u-boot/-/commit/5308a71

set UBOOT_MACHINE with malta defconfigs for qemumips and qemumips64.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/conf/machine/qemumips.conf   | 2 +-
 meta/conf/machine/qemumips64.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index 1373e4cba0..9b602fcd1f 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -9,7 +9,7 @@ require conf/machine/include/qemuboot-mips.inc
 KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
-UBOOT_MACHINE ?= "qemu_mips_defconfig"
+UBOOT_MACHINE ?= "malta_defconfig"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
index 1e77486491..b37d78989b 100644
--- a/meta/conf/machine/qemumips64.conf
+++ b/meta/conf/machine/qemumips64.conf
@@ -11,7 +11,7 @@ QB_CPU = "-cpu MIPS64R2-generic"
 KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 
-UBOOT_MACHINE ?= "qemu_mips64_defconfig"
+UBOOT_MACHINE ?= "malta64_defconfig"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
-- 
2.17.1

