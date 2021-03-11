Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by mx.groups.io with SMTP id smtpd.web10.7016.1615473437490415438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 06:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=ZzXcO3R4;
 spf=pass (domain: wdc.com, ip: 216.71.153.144, mailfrom: prvs=6977d653a=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1615473437; x=1647009437;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p3b+nQUqAs3BMJHLKLRuBsPW4XuJ3AMxxNluKqZg0/I=;
  b=ZzXcO3R4LpzQAU36jh6wYgApZmU6IZSaotpIqs6XP0+DG0Z36Bt4iDPU
   aC0Qb2nUkP4PxRd6hrXwAt8cRf8SeBkpB+KuoMsU2rRXQUNNmVVH+7CIm
   9f4fPCTDeLzRD60LdDWnRJcDZB8HkY1nJ39z497Mjz5tAfGWyOvrH4KCl
   4bJylPTYiESRyy/EsXSHv7kD/S2kQUi1OP4G4jw1P6ZeI8Rp+eMh+Qn8P
   HfaamOhUD8T3FcJLA4D/2ACnSfQ+L3yCHLW67Gwi3GSUDOSemioBbSfuT
   reS0sn7yHTBH4I3zZ4fTqFWa+SVgXI+7HOvnEHanfrFjyelS2LwKjNYSh
   w==;
IronPort-SDR: tdqENCccQIirCPdTVx4ORl+IjCHxTpZr6PHKgWhYu26Qz35cwfIyPfnEGFVuq039mT4scLROcr
 kjs/l6pQFcgPk1nbnzMf57POTVyVnVaS2QB9G3fRPoy1KCISD40sxnkp9u08585fgpIBEQ1WUx
 E7dWXjewpWgF8bkEkTf2cOreSs+BtYq9PRUwiMXjNgxLqDXVw5yqGS9jUFvswebOaSf2p6zhp4
 qzEaA2E+/80GAsExAlqIwBgKqTZ/AvgV+q2rYp5ngQf1sRUERJyz3l1b0CzI7EUSg+MMDkMYWu
 ddQ=
X-IronPort-AV: E=Sophos;i="5.81,240,1610380800"; 
   d="scan'208";a="161933171"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 11 Mar 2021 22:37:16 +0800
IronPort-SDR: XVmfTtgJG5ti8uWEvUaW/ngHalu7FolVmVulf5yo1XONlyqqFJiQHLnZkfy54vzKZIUME4MD7j
 2TIr+Ggzl9Kmtx3+ay+Lre+5qNNZvyZs5LNUoETiB9vVCYlJlfeWlFzkSC52EnrIY2EWjyWOE+
 SjLA7vV5t2Q9cz4Cai8tQHAI+Jz02rWYOYe01d2k7QBdxft0a60qqc2ux034daIi1IH+hzjmEm
 5Dyk76cUXctPA/M6iUPLrAMspydSyJobaosm6elAz9Z7pPnlbBo2FIJe1v8GHHxo1M2pWtxzoC
 d2xOC18x50vv+yI2lMONrZ4j
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 06:18:08 -0800
IronPort-SDR: ltrBx5TtvXbU7xA1oqEObL+LedVFS5EYCBOW6zD1EZFQunhlJN/ixS1E261TawrC06xfYC3iJG
 VXjGU06ZMpxlc8eo+0Z7vAZrLzY+/hVn8tJlBTC7ruEghGSJgq1wvQaS/hsLLuf2mNSYEQWpv1
 QwpDV0a4Kn+xlfb0Qb3wJo6aMejd/oQeW6FDHyiT5H3TQuLiP8/CIwtY6Ex9iCqVTj2JuYjB8Q
 kH/23A/j6Y0OXdXhZ9G+Iv2jU3Z9lHh92XlaMFbb++Z3TcD7R6AWiqjvlFCUJtVoRmD8pqw1AB
 okw=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO risc6-mainframe.int.fusionio.com) ([10.196.157.248])
  by uls-op-cesaip02.wdc.com with ESMTP; 11 Mar 2021 06:37:16 -0800
From: "Alistair Francis" <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH] u-boot: Add support for building for qemuriscv32
Date: Thu, 11 Mar 2021 06:37:14 -0800
Message-Id: <20210311143714.3294960-1-alistair.francis@wdc.com>
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
index 0000000000..55b649db50
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
+Upstream-Status: Inappropriate [configuration]
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
index 2eef1e900e..2b7aeb78f4 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2021.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2021.01.bb
@@ -1,4 +1,6 @@
 require u-boot-common.inc
 require u-boot.inc
 
+SRC_URI_append_qemuriscv32 = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch"
+
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.30.1

