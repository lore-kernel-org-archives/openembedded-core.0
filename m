Return-Path: <prvs=066539cd8=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id A938C7E7BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 23:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1560988259; x=1592524259;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=wTEH+p+47Bl+0Rm5P/2qN/fwd4wmgyLFKkR2u8qJCc8=;
	b=PkMNo+DhDXetyua5jukJl46AkMRarFz0E2HVyaiEJ6qezJ3sz8278zMX
	xdyflrkblPKD03CMX5160hhYxTpgry7d/V6ymetB1/gY/6r+TulkWqnTA
	HjjOfHoxnxR7Kik/TLDgP2+CmLp4AKqeh8Rkn779LC4+IQ/F9/jmyfj9v
	LYyHJruwvbeDtkKtNw6qrsG9ZGiB9agpjQabgMbDk9/5Y9sC+8sfxydeZ
	c7AguTECIXPjoIojJEDgSOi5JZz8W2wCRSt3jFftGdnG+EYRv6J6WxtPu
	Jze6RjjgoB/S2S0oyQoxPaCmOwmNpHZA52vx9u0FpPAGJaNiNWhoTVxvV g==;
X-IronPort-AV: E=Sophos;i="5.63,394,1557158400"; d="scan'208";a="112241474"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2019 07:50:58 +0800
IronPort-SDR: HBD40YoPHQLJDe4f/tZ7PMqPlBamgNCMRRNX8FM78LAvFtQ/ww/UZTBYh1VJmrMn43sZuO8Td2
	x+VR9roHw8zB17a4UM1EFny9OTQEa2ajDGmCBxxDzD5f+m22liG2ROiuxSISgRc54wHmQQ+AX/
	cQuuXKeGngc7i/xE7hhqRq+/uMigMmgCRhWth+FXtPFq1EmlOXrrviqaWcTjqqqKyZKfwmJMpx
	/5PFZGoYKMwrNf0h7SF3uOVOwlQ0tomj5PIgCPd20pZjFKIy2EgQhIJHsjfvHpVWtaFi7rUTe1
	b+6FxLJki5s9OUWiKKvVa0yd
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP; 19 Jun 2019 16:50:24 -0700
IronPort-SDR: u0bBMbUQYpdX3Kf+HE52L+zmx/JXPAlUVuDs6Py03nWKRqL4g76pOCA3zRNsMGwEfF6XUvWgJM
	a3MhCGeP1EIBOGkEvlsHDHoBLPUiqtvR6RK2CN3WMINb9s/NYgKmOXBpZbGNJPblOLtmnAmL4A
	6Q+decgmUJu3VLbZazIv5Lmqa88UVZjRWY8WdgHCi4oMLhPwVNpiXVVGb/2usu6rOjHzfLYSkd
	OIB/ScvZttwqQZsbh3PRXsrLBJ5UlXl8RQaQoaYQfnLDKpdKTL9JJMZ1umbDtcsSzxx1wEuafO
	3PM=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 19 Jun 2019 16:50:59 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 16:48:32 -0700
Message-Id: <20190619234833.18178-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH 1/2] qemuriscv: Build uImage for RISC-V machines
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2019 23:50:57 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index aa1eba77da..84d09fa78e 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -6,6 +6,8 @@ require conf/machine/include/riscv/tune-riscv.inc
 MACHINE_FEATURES = "screen keyboard ext2 ext3 serial"
 
 KERNEL_IMAGETYPE = "Image"
+KERNEL_IMAGETYPES += "uImage"
+KEEPUIMAGE = "no"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;hvc0"
 
@@ -17,6 +19,9 @@ EXTRA_IMAGEDEPENDS += "opensbi"
 RISCV_SBI_PLAT ?= "qemu/virt"
 RISCV_SBI_PAYLOAD ?= "${KERNEL_IMAGETYPE}-${MACHINE}.bin"
 
+UBOOT_ENTRYPOINT_riscv32 = "0x80400000"
+UBOOT_ENTRYPOINT_riscv64 = "0x80200000"
+
 # qemuboot options
 QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
 QB_MEM = "-m 512"
-- 
2.22.0


