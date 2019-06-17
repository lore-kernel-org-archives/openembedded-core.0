Return-Path: <prvs=06424885f=alistair.francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id B889B7E843
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 22:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1560809043; x=1592345043;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=4o8xYPuQ3OyfYrqJWBzqLSLmdguQdrKykocSnyynpts=;
	b=boiwPE7EOba53SueQ+d96crVs1pf9JW70jg3KGxHCoaVjIIAQag1LNlr
	xxOr8JKdE2BaGBt2tIFxWsGLh76GzhH/058v+F0KJu4Zkf/yL5kD1YASB
	5up5Xd/tbl0BRnPI5r8xS3kbiF6W+BlHEP1cxTSBoo11UuCwjDC2LO7Mc
	sGFiTu1h4+T9sSaGUuHkI+5NXrd2+FZLdhmjODpSL5ify37ZujPQEACoZ
	eHgG+Y443f5hRqW4V96EIt60V9J1h88hZgLY/8mtJcRIpMgoGqurrLKr5
	qf4/yVeIBEe6CAhfVz8DbPCtfMTHgL7ZlLoGbpWVt7KdS/NvYQdOqYoD7 Q==;
X-IronPort-AV: E=Sophos;i="5.63,386,1557158400"; d="scan'208";a="217157213"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2019 06:04:03 +0800
IronPort-SDR: Y7U/Qsw7148cfXEGGAfZz6ySZXUMAN8mUSwH9LWSfBKvvLri3WiT4hqXYrJcf7wPDHIspmqfsp
	tOdoPywGGZHkoryzR4rFCikjypoVz8wieuq9hlPKrB8YsxAVjvVta5QSVBulljFscgdrIa0AoB
	xo8EeX5B2FSdEz+OAHiNaRKMWeO7SyU/qdogCrsN+38qvXhF6QtkKKWDtouwpR1N17AG8i6C38
	q1tliflU+kJ2zmJcLCUZgXEP9lB8eg+pVgtaT0w78iCjSIUNgmSpcjkyfCcAQECxhRy4rPJiSK
	9WTCt9DPRB9Ge1eOKOVaAgCW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP; 17 Jun 2019 15:03:35 -0700
IronPort-SDR: JcAq0GrGbe3WBYWNVrJlNr3ELZ0E1yBTBrEvMd9YRnJ20VL9p+ONq23l2HSaABA/wW4jLWEeTt
	kJ1Oq0AFiEMWUKkgunKMxA3XePhwyPmi0rBbNRifH+0oD0EPEbJLjl6bpKgUM6GPEaB8QWDiHe
	Qk8VumIYqDlH/OcsU49pI2qUKb/APoNN4jI2HKsTKe8r0De75mHLJIJ2COI55f49KR2KTAHj+E
	4hCG6A1txBtCm0Q1J1LP/m2R/6JDWoiQkHvdhr08BMHeZYWNZSen9ATWLV3WxHVXA/WDmbV1dz
	YyU=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Jun 2019 15:04:03 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2019 15:01:22 -0700
Message-Id: <20190617220122.13994-4-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190617220122.13994-1-alistair.francis@wdc.com>
References: <20190617220122.13994-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] qemuriscv64: Add the QEMU RISC-V 64-bit machine
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
X-List-Received-Date: Mon, 17 Jun 2019 22:04:01 -0000
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


