Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by mx.groups.io with SMTP id smtpd.web10.1337.1615585108408489333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 13:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=YJZW3MZ1;
 spf=pass (domain: wdc.com, ip: 216.71.154.45, mailfrom: prvs=6980a3afb=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1615585109; x=1647121109;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4KBBkgAaYdO9SNz2lzI1m0851AGzvL4GSYrlkzvSMbs=;
  b=YJZW3MZ1vbqQpcSvGCjcbpkDv2TyD/pFBhwQ2qdc89G2/IVPv19JFoPY
   sInePsX+ZcNFNfdl5b5IoywjjmQQgrgUnL4Dbbqs36aaV83ZIBtkjQmpV
   QZWtndvdmfs1G+Yts+zSF8Wjd21+ex6nu48SDSx1X8I03ro+kbRh9MuBW
   Ohny54aooYYD5J4G96EIo9Obfe+9FgXZoRAgdKQIXW36FzauUI9yXaQNP
   qbSfJSI7ImG18W9pyoP68OJ2jtgiR8eZ77+NxoT046IoHqQHD6JEz7IPk
   IHgdrcyAxQSpa0ePvSHlMwSxQSDFLx9HbQNUD15C17ALymO0KcHY0Wrdf
   w==;
IronPort-SDR: a+glOGZ56BWnySDWg9Zm2051WjO1Mt7lwBg/U8ME5VD9JfylSil/4CzuP/15tjuBpos6XcwHIG
 IzTgAfSmN82SpGHzS2sZSEN3KORr2Aq9RyZH93DNMCxx+SQV/UW0RuvLNwIJW0WeHrBRSiafWZ
 AyX5IGVg+c1k0uegMMQXQTGf8Fd5hn12cy8AFwu/BhKfUIsjE0OrAPTWU/pmXaXikngZ+I7c9F
 QZ9errCx8iE6epSk7n2Gj/d4C/dnNhpw9PurOll3GQpVX8MHCgWwDXvzS+wU4vRErA4CpS05Iz
 Exg=
X-IronPort-AV: E=Sophos;i="5.81,244,1610380800"; 
   d="scan'208";a="163188487"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 13 Mar 2021 05:38:28 +0800
IronPort-SDR: GUFOxQ67nzTW1EgYLs1n2GEOE70HsFrQO+UWaWfz2hBmr/ZOklFuNkbV39yjMvzM+NuitStlmd
 NdLh2Qlo2de+xpHHjm41OoWHFuWT6ZT/z8RChPmMWE4SJtUyI6UmO31nDfdYEifY7Du70V+YLk
 rdTNeZ1OVsPw/EthenbVQQjTDTHHrC7Kn7tK5aJ9YHzN9+yyxySp3WcaEXLZvoLAC1afACoXig
 pG09vL5ID6d8oe/UKgvhDQGY/vGDhrQo4OFdbXjBH9RBzPWsEA7Byeb/hsju7cE60W6Kc5ZVYb
 knRx6EWZTK0nar5zI9qpGZer
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 13:19:14 -0800
IronPort-SDR: Hi9yKscEWKJqYVpgCHvts7SwlWZF5H2JReFzMZkgyk919wFCm3G83Zmm5ZeC+NCvNO7W0KCsFv
 jbVfC7C8S9YMPlvPPdMSU9iWRYFyj0/CStRVKw8QPNabCw8whtMlFZgboTgIYIxDKuf1WTL8wW
 fqFsbEXfx4GmXuedT8zPdj4L6JhcX81X9POt8KQ1Uj/c0vE1IQ9bvfGfiqlcaVvRG8yeLQgUnJ
 d+9R70F63P8Xqs0zSlyx39OQHH8UMZt7EVBlhS3OWHSGb9beB0K0i5oc8kL11E+wNou1wvve09
 qt0=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO risc6-mainframe.int.fusionio.com) ([10.196.157.248])
  by uls-op-cesaip02.wdc.com with ESMTP; 12 Mar 2021 13:38:27 -0800
From: "Alistair Francis" <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2] u-boot: Add support for building for qemuriscv32
Date: Fri, 12 Mar 2021 13:38:25 -0800
Message-Id: <20210312213825.180303-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/qemuriscv32.conf            |  7 ++--
 ...iscv32-Use-double-float-ABI-for-rv32.patch | 42 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2021.01.bb     |  2 +
 3 files changed, 47 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch

diff --git a/meta/conf/machine/qemuriscv32.conf b/meta/conf/machine/qemuriscv32.conf
index 1413775ad6..d3858dc051 100644
--- a/meta/conf/machine/qemuriscv32.conf
+++ b/meta/conf/machine/qemuriscv32.conf
@@ -11,7 +11,6 @@ PREFERRED_VERSION_openocd = "riscv"
 
 XVISOR_PLAT = "riscv/virt32"
 
-# u-boot doesn't compile, error: "can't link hard-float modules with soft-float modules"
-# EXTRA_IMAGEDEPENDS += "u-boot"
-# UBOOT_MACHINE = "qemu-riscv32_smode_defconfig"
-# UBOOT_ELF = "u-boot"
+EXTRA_IMAGEDEPENDS += "u-boot"
+UBOOT_MACHINE = "qemu-riscv32_smode_defconfig"
+UBOOT_ELF = "u-boot"
diff --git a/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch b/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
new file mode 100644
index 0000000000..0ed3de4914
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
@@ -0,0 +1,42 @@
+From 66dfe0fa886f6289add06d1af8642ce2b5302852 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Feb 2021 16:40:12 -0800
+Subject: [PATCH] riscv32: Use double-float ABI for rv32
+
+So it can use libgcc built with OE toolchain
+Fixes
+error: "can't link hard-float modules with soft-float modules"
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate [embedded specific]
+---
+ arch/riscv/Makefile | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
+index 0b80eb8d86..7324946f48 100644
+--- a/arch/riscv/Makefile
++++ b/arch/riscv/Makefile
+@@ -9,7 +9,9 @@ ifeq ($(CONFIG_ARCH_RV64I),y)
+ endif
+ ifeq ($(CONFIG_ARCH_RV32I),y)
+ 	ARCH_BASE = rv32im
+-	ABI = ilp32
++	ABI = ilp32d
++	ARCH_D = d
++	ARCH_F = f
+ endif
+ ifeq ($(CONFIG_RISCV_ISA_A),y)
+ 	ARCH_A = a
+@@ -24,7 +26,7 @@ ifeq ($(CONFIG_CMODEL_MEDANY),y)
+ 	CMODEL = medany
+ endif
+ 
+-ARCH_FLAGS = -march=$(ARCH_BASE)$(ARCH_A)$(ARCH_C) -mabi=$(ABI) \
++ARCH_FLAGS = -march=$(ARCH_BASE)$(ARCH_A)$(ARCH_F)$(ARCH_D)$(ARCH_C) -mabi=$(ABI) \
+ 	     -mcmodel=$(CMODEL)
+ 
+ PLATFORM_CPPFLAGS	+= $(ARCH_FLAGS)
+-- 
+2.30.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2021.01.bb b/meta/recipes-bsp/u-boot/u-boot_2021.01.bb
index 2eef1e900e..bbbc99bf8d 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2021.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2021.01.bb
@@ -1,4 +1,6 @@
 require u-boot-common.inc
 require u-boot.inc
 
+SRC_URI_append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch"
+
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.30.1

