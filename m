Return-Path: <prvs=066539cd8=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id F2F5B7E862
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 00:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1560905894; x=1592441894;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=Omiy42mmMNisV7BXkpwnTEnq01mO8sj/G/juA4XyUYk=;
	b=K5ffP9Cq1o79tQPbommTw1mi2/9npRIpEss6NpPC0FJIvE6yuEwppZjz
	4r2teQmmmXs6Gfbcnilt2Ry+yZ1nX8g50L6hqiXyxRpvNdgLq0BBNLFhO
	96hE93VhIsa50R3y0jwqpsMUAk8IEwuAa/AmYXPfTSnZQ5Yz1W/sePEhT
	9AXxUg3hUS25oe6F1opYWR0tOBPcHEmgPGZXSbuGkiF7nnRGTveR0Zu6f
	tBO6tNcOoQIo9NZlH2ZB4nx2zI5o/MTEzX8TbBeeOwAFitNeGyVvlzk5g
	qohJWCMdtUynjRNZwfoO8UQIrQWBPVOEe5kLvKXhzSjxno2S1NMkskPTB w==;
X-IronPort-AV: E=Sophos;i="5.63,390,1557158400"; d="scan'208";a="112154344"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jun 2019 08:58:14 +0800
IronPort-SDR: 1a82bDxyCreJM8kkKuN9QkkHj9sT+KTiova0cut6o5eMC937xIRk/5jzU49d38heW6h1EoGKYy
	tpQ/NVxsMIKHlmHW2vHHLYTNvcIeF/f0eBH70VBfuYLNfS0o4DZTfBfIHQYXCpW+vsY0XfvgFZ
	ZQ5nTTOv8yYJrDEZnlBu9tMe1qk4GQ7fqsD+zJb6yGr7UBRMG4/EftNEBjQ4lBek5nfkVFaAQl
	7PIVD1PKADg9TPssWcFrIfdoDSu2w0VrkThLq7d5MphlwA3jHG+9AMcLKfGE73zIjy7R/rKCdO
	/d4WJYGkYpH2hyTAqXmx2xGM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP; 18 Jun 2019 17:57:42 -0700
IronPort-SDR: LYirUbF7STv1Q4j/bRuOrh7Bt+UWsXZePpyek+LpMfSA7hHzKKBLnR3LeGXUanDtn9aqyPJJ7/
	6qJL0gcwnLdFI0IN8nhjV1OjudrNk4SzNPjEENjYB6giT0ah6P/w1eUxglKbrAqjnE410nrXWy
	LJBf7QWmzXhNoJlkVV1Z17kZYqMEZ+CDibyMDtbvMoIsoobqMRWb3h/0G/jWcL8W3bDBKiAUEF
	HTgNR9iQlxOTNjfnzzl79kDXlo4GG+Ru6cRyQXcIDZrz43IpvIyftI6VYAKne56HOQ8pSckk6O
	6ak=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 18 Jun 2019 17:58:13 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 17:55:39 -0700
Message-Id: <20190619005541.17834-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190619005541.17834-1-alistair.francis@wdc.com>
References: <20190619005541.17834-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/4] opensbi: Initial commit of OpenSBI
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

This is used as a bootloader for RISC-V QEMU machines.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...Makefile-Don-t-specify-mabi-or-march.patch |  38 ++++++
 ...-lib-Create-a-sbi_ipi_data-structure.patch | 128 ++++++++++++++++++
 meta/recipes-bsp/opensbi/opensbi-payloads.inc |  37 +++++
 meta/recipes-bsp/opensbi/opensbi_0.3.bb       |  49 +++++++
 4 files changed, 252 insertions(+)
 create mode 100644 meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
 create mode 100644 meta/recipes-bsp/opensbi/files/0002-lib-Create-a-sbi_ipi_data-structure.patch
 create mode 100644 meta/recipes-bsp/opensbi/opensbi-payloads.inc
 create mode 100644 meta/recipes-bsp/opensbi/opensbi_0.3.bb

diff --git a/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch b/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
new file mode 100644
index 0000000000..9c2d0eb479
--- /dev/null
+++ b/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
@@ -0,0 +1,38 @@
+From f5871e1f3650d6c8a032928cb5d8ca00c275c377 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Fri, 15 Feb 2019 14:57:41 -0800
+Subject: [PATCH] Makefile: Don't specify mabi or march
+
+To avoid
+    can't link double-float modules with soft-float modules
+errors when building 32-bit openSBI don't specify mabi or march.
+
+Upstream-Status: Inappropriate [Fixes a 32-bit Yocto flow bug]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ Makefile | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ae68f55..10851fc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -145,7 +145,6 @@ GENFLAGS	+=	$(firmware-genflags-y)
+ CFLAGS		=	-g -Wall -Werror -nostdlib -fno-strict-aliasing -O2
+ CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
+ CFLAGS		+=	-mno-save-restore -mstrict-align
+-CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
+ CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
+ CFLAGS		+=	$(GENFLAGS)
+ CFLAGS		+=	$(platform-cflags-y)
+@@ -158,7 +157,6 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
+ ASFLAGS		=	-g -Wall -nostdlib -D__ASSEMBLY__
+ ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
+ ASFLAGS		+=	-mno-save-restore -mstrict-align
+-ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
+ ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
+ ASFLAGS		+=	$(GENFLAGS)
+ ASFLAGS		+=	$(platform-asflags-y)
+-- 
+2.20.1
+
diff --git a/meta/recipes-bsp/opensbi/files/0002-lib-Create-a-sbi_ipi_data-structure.patch b/meta/recipes-bsp/opensbi/files/0002-lib-Create-a-sbi_ipi_data-structure.patch
new file mode 100644
index 0000000000..3c846bde62
--- /dev/null
+++ b/meta/recipes-bsp/opensbi/files/0002-lib-Create-a-sbi_ipi_data-structure.patch
@@ -0,0 +1,128 @@
+From 508a27204cbbca0a9430236e56681e5e0d343fb9 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Fri, 8 Mar 2019 11:22:22 -0800
+Subject: [PATCH] lib: Create a sbi_ipi_data structure
+
+Create a sbi_ipi_data structure that holds unpacked IPI information. At
+the same time remove ipi_type from the sbi_scratch struct and use a
+fixed offset to access it.
+
+This structure fits in behind the sbi_scratch structure.
+
+This fixes https://github.com/riscv/opensbi/issues/81
+
+Upstream-Status: Backport [https://github.com/riscv/opensbi/commit/508a27204cbbca0a9430236e56681e5e0d343fb9]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ firmware/fw_base.S        |  1 -
+ include/sbi/sbi_scratch.h | 23 ++++++++++++++++-------
+ lib/sbi_ipi.c             |  8 +++++---
+ 3 files changed, 21 insertions(+), 11 deletions(-)
+
+diff --git a/firmware/fw_base.S b/firmware/fw_base.S
+index cf2c6a0..69cfc90 100644
+--- a/firmware/fw_base.S
++++ b/firmware/fw_base.S
+@@ -183,7 +183,6 @@ _start_warm:
+ 	REG_S	a4, SBI_SCRATCH_PLATFORM_ADDR_OFFSET(tp)
+ 	la	a4, _hartid_to_scratch
+ 	REG_S	a4, SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET(tp)
+-	REG_S	zero, SBI_SCRATCH_IPI_TYPE_OFFSET(tp)
+ 	REG_S	zero, SBI_SCRATCH_TMP0_OFFSET(tp)
+ 
+ 	/* Setup stack */
+diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
+index 8389ef3..70ab384 100644
+--- a/include/sbi/sbi_scratch.h
++++ b/include/sbi/sbi_scratch.h
+@@ -28,17 +28,24 @@
+ #define SBI_SCRATCH_PLATFORM_ADDR_OFFSET	(6 * __SIZEOF_POINTER__)
+ /** Offset of hartid_to_scratch member in sbi_scratch */
+ #define SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET	(7 * __SIZEOF_POINTER__)
+-/** Offset of ipi_type member in sbi_scratch */
+-#define SBI_SCRATCH_IPI_TYPE_OFFSET		(8 * __SIZEOF_POINTER__)
+ /** Offset of tmp0 member in sbi_scratch */
+-#define SBI_SCRATCH_TMP0_OFFSET			(9 * __SIZEOF_POINTER__)
+-/** Maximum size of sbi_scratch */
+-#define SBI_SCRATCH_SIZE			256
++#define SBI_SCRATCH_TMP0_OFFSET			(8 * __SIZEOF_POINTER__)
++
++/** sbi_ipi_data is located behind sbi_scratch. This struct is not packed. */
++/** Offset of ipi_type in sbi_ipi_data */
++#define SBI_IPI_DATA_IPI_TYPE_OFFSET		(15 * __SIZEOF_POINTER__)
++
++/** Maximum size of sbi_scratch and sbi_ipi_data */
++#define SBI_SCRATCH_SIZE			(32 * __SIZEOF_POINTER__)
+ 
+ #ifndef __ASSEMBLY__
+ 
+ #include <sbi/sbi_types.h>
+ 
++struct sbi_ipi_data {
++	unsigned long ipi_type;
++};
++
+ /** Representation of per-HART scratch space */
+ struct sbi_scratch {
+ 	/** Start (or base) address of firmware linked to OpenSBI library */
+@@ -57,8 +64,6 @@ struct sbi_scratch {
+ 	unsigned long platform_addr;
+ 	/** Address of HART ID to sbi_scratch conversion function */
+ 	unsigned long hartid_to_scratch;
+-	/** IPI type (or flags) */
+-	unsigned long ipi_type;
+ 	/** Temporary storage */
+ 	unsigned long tmp0;
+ } __packed;
+@@ -71,6 +76,10 @@ struct sbi_scratch {
+ #define sbi_scratch_thishart_arg1_ptr()	\
+ ((void *)(sbi_scratch_thishart_ptr()->next_arg1))
+ 
++/** Get pointer to sbi_ipi_data from sbi_scratch */
++#define sbi_ipi_data_ptr(scratch)      \
++((struct sbi_ipi_data *)(void*)scratch + SBI_IPI_DATA_IPI_TYPE_OFFSET)
++
+ #endif
+ 
+ #endif
+diff --git a/lib/sbi_ipi.c b/lib/sbi_ipi.c
+index 0e371d7..e0f2a19 100644
+--- a/lib/sbi_ipi.c
++++ b/lib/sbi_ipi.c
+@@ -31,7 +31,7 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 hartid, u32 event)
+ 	 * trigger the interrupt
+ 	 */
+ 	remote_scratch = sbi_hart_id_to_scratch(scratch, hartid);
+-	atomic_raw_set_bit(event, &remote_scratch->ipi_type);
++	atomic_raw_set_bit(event, &sbi_ipi_data_ptr(remote_scratch)->ipi_type);
+ 	mb();
+ 	sbi_platform_ipi_send(plat, hartid);
+ 	if (event != SBI_IPI_EVENT_SOFT)
+@@ -80,7 +80,7 @@ void sbi_ipi_process(struct sbi_scratch *scratch)
+ 	sbi_platform_ipi_clear(plat, hartid);
+ 
+ 	do {
+-		ipi_type = scratch->ipi_type;
++		ipi_type = sbi_ipi_data_ptr(scratch)->ipi_type;
+ 		rmb();
+ 		ipi_event = __ffs(ipi_type);
+ 		switch (ipi_event) {
+@@ -97,12 +97,14 @@ void sbi_ipi_process(struct sbi_scratch *scratch)
+ 			sbi_hart_hang();
+ 			break;
+ 		};
+-		ipi_type = atomic_raw_clear_bit(ipi_event, &scratch->ipi_type);
++		ipi_type = atomic_raw_clear_bit(ipi_event, &sbi_ipi_data_ptr(scratch)->ipi_type);
+ 	} while(ipi_type > 0);
+ }
+ 
+ int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
+ {
++	sbi_ipi_data_ptr(scratch)->ipi_type = 0x00;
++
+ 	/* Enable software interrupts */
+ 	csr_set(CSR_MIE, MIP_MSIP);
+ 
+-- 
+2.22.0
+
diff --git a/meta/recipes-bsp/opensbi/opensbi-payloads.inc b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
new file mode 100644
index 0000000000..7df168325a
--- /dev/null
+++ b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
@@ -0,0 +1,37 @@
+def riscv_get_extra_oemake_image(d):
+    sbi_payload = d.getVar('RISCV_SBI_PAYLOAD')
+    deploy_dir = d.getVar('DEPLOY_DIR_IMAGE')
+
+    if sbi_payload is None:
+        return ""
+
+    if d.getVar('RISCV_SBI_PAYLOAD'):
+        return "FW_PAYLOAD_PATH=" + deploy_dir + "/" + sbi_payload
+
+    return ""
+
+def riscv_get_extra_oemake_fdt(d):
+    sbi_fdt_payload = d.getVar('RISCV_SBI_FDT')
+    deploy_dir = d.getVar('DEPLOY_DIR_IMAGE')
+
+    if sbi_fdt_payload is None:
+        return ""
+
+    if d.getVar('RISCV_SBI_PAYLOAD'):
+        # This is internal to openSBI, not a full path
+        return "FW_PAYLOAD_FDT=" + sbi_fdt_payload
+
+    return ""
+
+def riscv_get_do_compile_depends(d):
+    sbi_payload = d.getVar('RISCV_SBI_PAYLOAD')
+
+    if sbi_payload is None:
+        return ""
+
+    if 'linux' in sbi_payload or 'Image' in sbi_payload:
+        return "virtual/kernel:do_deploy"
+    if 'u-boot' in sbi_payload:
+        return "virtual/bootloader:do_deploy"
+
+    return ""
diff --git a/meta/recipes-bsp/opensbi/opensbi_0.3.bb b/meta/recipes-bsp/opensbi/opensbi_0.3.bb
new file mode 100644
index 0000000000..2b4fb97df2
--- /dev/null
+++ b/meta/recipes-bsp/opensbi/opensbi_0.3.bb
@@ -0,0 +1,49 @@
+SUMMARY = "RISC-V Open Source Supervisor Binary Interface (OpenSBI)"
+DESCRIPTION = "OpenSBI aims to provide an open-source and extensible implementation of the RISC-V SBI specification for a platform specific firmware (M-mode) and a general purpose OS, hypervisor or bootloader (S-mode or HS-mode). OpenSBI implementation can be easily extended by RISC-V platform or System-on-Chip vendors to fit a particular hadware configuration."
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=c36118b4f615f9da37635f2a7ac8ccaf"
+DEPENDS += "dtc-native"
+
+require opensbi-payloads.inc
+
+inherit autotools-brokensep
+
+SRCREV = "ca20ac0cd4c099006d4eea4d9ac7bd7b58e2ae0f"
+SRC_URI = "git://github.com/riscv/opensbi.git \
+           file://0001-Makefile-Don-t-specify-mabi-or-march.patch \
+           file://0002-lib-Create-a-sbi_ipi_data-structure.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+SRC_URI[md5sum] = "621f38d8205ef5fb185e4055025e73df"
+SRC_URI[sha256sum] = "07f18b73abf3b85aabe5bead19a923716c100d30eb58033459f39c3a224be300"
+
+EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D}"
+# If RISCV_SBI_PAYLOAD is set then include it as a payload
+EXTRA_OEMAKE_append = " ${@riscv_get_extra_oemake_image(d)} ${@riscv_get_extra_oemake_fdt(d)}"
+
+# Required if specifying a custom payload
+do_compile[depends] += "${@riscv_get_do_compile_depends(d)}"
+
+do_install_append() {
+	# In the future these might be required as a dependency for other packages.
+	# At the moment just delete them to avoid warnings
+	rm -r ${D}/include
+	rm -r ${D}/platform/${RISCV_SBI_PLAT}/lib
+	rm -r ${D}/platform/${RISCV_SBI_PLAT}/firmware/payloads
+}
+
+do_deploy () {
+	install -d ${DEPLOY_DIR_IMAGE}
+	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_payload.* ${DEPLOY_DIR_IMAGE}/
+	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_jump.* ${DEPLOY_DIR_IMAGE}/
+}
+
+addtask deploy after do_install
+
+FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
+FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
+
+COMPATIBLE_HOST = "(riscv64|riscv32).*"
+INHIBIT_PACKAGE_STRIP = "1"
-- 
2.22.0


