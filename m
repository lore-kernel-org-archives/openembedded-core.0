Return-Path: <prvs=066539cd8=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 393527E862
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 00:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1560905895; x=1592441895;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=4o8xYPuQ3OyfYrqJWBzqLSLmdguQdrKykocSnyynpts=;
	b=A7AUfZPnPWxwgV4HHoxvjUiYl3iU3SpvH/hvbKV2ExEokoGbsTGpKDse
	MrplluTPeDIKqEpwLd0MDImINNeR7gdB2F99wuBKu1jgzbz/vG+G8TgAn
	tygWQ48EAVK0IC/gzYCNLSTsb2dR4vwzgNm++ffLNoPdBzdP+1L+/y7+u
	H3R0cFV4/Kze4OcTJJUjTivEwXxO4KZHji1kvQojU18iEf4IOJFb5FmNG
	SrWmha8ZCtlLSa/HJzSrqqLy/VsayIhMEslhbXTUVQpjWVtia8TMLzfhj
	bOZVCtj3NGacxD215jfqt2XRL/0QqoZoqWSlyyXotgSVJQCs3vYfVC19H g==;
X-IronPort-AV: E=Sophos;i="5.63,390,1557158400"; d="scan'208";a="112154349"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jun 2019 08:58:14 +0800
IronPort-SDR: iPVJKhT5cUpxnIwx2dHHZlJeLImjFJnrxdmYcSJoGNUNZljNP0teTuMfSDeODZiS/FdNzn5GWP
	/hNFp0ChiqUgmue8P8oojIxJsabBXiLRxmAgHpPPX0Purn0BQoE7LlbkDdHZfxI0dtpepHDMwY
	qsPqMLGV+8QOACABSbYzisVKUd7Q2NFvWQ2h/mBbjM4YsiqXUo1EMX99qnebOHrcr008QWgK/r
	xWAt5LmlGTv7DqrlTwBSAg1mKZJYXWwaCAkZc6Fu8gL5oURhvDduCJ2qyBBzgMISAt9uS1CGV4
	pMKISuoU4IIQjNUHOUAISmm7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP; 18 Jun 2019 17:57:42 -0700
IronPort-SDR: GYG8ODmQD1wUc/320qL8F4LvJVXhI3cHj+5JHiT2bdEds02kT5elg46E2xioB9Jf5wOiFQt6r9
	mhnN/w+e5sgFvG7glJGjj0kXyJ5+ZcPF1g2w+jHW3HuMrZ44zHGd4yaIqwOWbG0Ijpeq8ClFAH
	7RoFEyTNC6Nn7u56MB4J81iRnsq6R0hNUb3KN+6O7GVRG3BAneN7E74mh1vn8xI4ZaSkkUhNeH
	kzHvrj8jm62GrTRnPYMOOuoPsQvoFJHoiRLpzZpAQfaRfFinXGoqNIlif6+LL2dbKdTp9Z5rIt
	NZ0=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 18 Jun 2019 17:58:14 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 17:55:41 -0700
Message-Id: <20190619005541.17834-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190619005541.17834-1-alistair.francis@wdc.com>
References: <20190619005541.17834-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH v2 4/4] qemuriscv64: Add the QEMU RISC-V 64-bit machine
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
X-List-Received-Date: Wed, 19 Jun 2019 00:58:13 -0000
Content-Transfer-Encoding: 8bit

The include is split ready to add the 32-bit RISC-V machine as soon as
glibc supports 32-bit RISC-V.

This is based on the work in the meta-riscv layer, thanks to Khem for
starting this.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../conf/machine/include/riscv/arch-riscv.inc | 10 +++++
 meta/conf/machine/include/riscv/qemuriscv.inc | 45 +++++++++++++++++++
 .../conf/machine/include/riscv/tune-riscv.inc | 19 ++++++++
 meta/conf/machine/qemuriscv64.conf            | 11 +++++
 4 files changed, 85 insertions(+)
 create mode 100644 meta/conf/machine/include/riscv/arch-riscv.inc
 create mode 100644 meta/conf/machine/include/riscv/qemuriscv.inc
 create mode 100644 meta/conf/machine/include/riscv/tune-riscv.inc
 create mode 100644 meta/conf/machine/qemuriscv64.conf

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
new file mode 100644
index 0000000000..19f8f3e211
--- /dev/null
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -0,0 +1,10 @@
+# RISCV Architecture definition
+
+DEFAULTTUNE ?= "riscv64"
+
+TUNE_ARCH = "${TUNE_ARCH_tune-${DEFAULTTUNE}}"
+TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
+TUNE_CCARGS .= ""
+
+# QEMU usermode fails with invalid instruction error (For riscv32)
+MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
new file mode 100644
index 0000000000..aa1eba77da
--- /dev/null
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -0,0 +1,45 @@
+PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/riscv/tune-riscv.inc
+
+MACHINE_FEATURES = "screen keyboard ext2 ext3 serial"
+
+KERNEL_IMAGETYPE = "Image"
+
+SERIAL_CONSOLES ?= "115200;ttyS0 115200;hvc0"
+
+IMAGE_FSTYPES_append = " ext4"
+
+MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
+
+EXTRA_IMAGEDEPENDS += "opensbi"
+RISCV_SBI_PLAT ?= "qemu/virt"
+RISCV_SBI_PAYLOAD ?= "${KERNEL_IMAGETYPE}-${MACHINE}.bin"
+
+# qemuboot options
+QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
+QB_MEM = "-m 512"
+QB_MACHINE = "-machine virt"
+QB_DEFAULT_KERNEL = "fw_jump.elf"
+QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
+QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
+QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
+QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
+QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+# Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
+QB_OPT_APPEND = " -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-device,rng=rng0"
+
+BAD_RECOMMENDATIONS += "\
+    libcxx-dev \
+    libcxx-staticdev \
+    compiler-rt-dev \
+    compiler-rt-staticdev \
+"
+
+ASSUME_PROVIDED += "\
+    libcxx-dev \
+    libcxx-staticdev \
+    compiler-rt-dev \
+    compiler-rt-staticdev \
+"
diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
new file mode 100644
index 0000000000..1e3a1081e0
--- /dev/null
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -0,0 +1,19 @@
+require conf/machine/include/riscv/arch-riscv.inc
+
+TUNEVALID[riscv64] = "Enable 64-bit RISC-V optimizations"
+TUNEVALID[riscv32] = "Enable 32-bit RISC-V optimizations"
+
+TUNEVALID[littleendian] = "Little endian mode"
+
+AVAILTUNES += "riscv64 riscv32"
+
+TUNE_FEATURES_tune-riscv64 = "riscv64 littleendian"
+TUNE_ARCH_tune-riscv64 = "riscv64"
+TUNE_PKGARCH_tune-riscv64 = "riscv64"
+PACKAGE_EXTRA_ARCHS_tune-riscv64 = "riscv64"
+
+TUNE_FEATURES_tune-riscv32 = "riscv32 littleendian"
+TUNE_ARCH_tune-riscv32 = "riscv32"
+TUNE_PKGARCH_tune-riscv32 = "riscv32"
+PACKAGE_EXTRA_ARCHS_tune-riscv32 = "riscv32"
+
diff --git a/meta/conf/machine/qemuriscv64.conf b/meta/conf/machine/qemuriscv64.conf
new file mode 100644
index 0000000000..f1be7b8a71
--- /dev/null
+++ b/meta/conf/machine/qemuriscv64.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: generic riscv64 machine
+#@DESCRIPTION: Machine configuration for running a generic riscv64
+
+require conf/machine/include/riscv/qemuriscv.inc
+
+QB_OPT_APPEND = "-show-cursor -monitor null -device loader,file=${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE},addr=0x80200000"
+
+EXTRA_IMAGEDEPENDS += "u-boot"
+UBOOT_MACHINE = "qemu-riscv64_defconfig"
+UBOOT_ELF = "u-boot"
-- 
2.22.0


