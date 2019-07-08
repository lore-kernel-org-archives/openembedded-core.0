Return-Path: <prvs=085e8ccea=alistair.francis@wdc.com>
X-Greylist: delayed 602 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 08 Jul 2019 16:47:58 UTC
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id CAD727D6A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 16:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1562604502; x=1594140502;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=ioKw09vZg9zYSOxrFuQVEebTflxmepFvjdA3YaTxGqM=;
	b=OIN85O4baBWr0A3vtph4qlPifzOfVyrKAbaN+SSnOZvo7xa3k3fybzoz
	v7Dedc0iITgBFjdxLpXSRyBiBWsE4PrXFSCkae/ysuLLDcgXKLjKuGTZH
	PrBo1r+3l6tLpGuEgWzSTBb0fX0xe3cp40oRc6DA+WqSiDtY/B+0PfBRW
	RK+eXoHjivLVYsdK9vBRljndCZQvK1ig8XYjxP9qEkcnXH1o0v4wr0sOY
	SFp6Bk0KaJSsdgyI46BqEmORGUbiJxNxXFB9XiGMTm2pf7Og1ZRHwddrC
	wImMksbiI62SNeOD2cJb5+gUQ+ZG2JY25bqFFuQHIer5PY1FKJpGIQuAC A==;
IronPort-SDR: G8pYUDxlRr27R9NVf56fx5nStfOWPnz0zUbjMchkx/SsnjVuOwj3vl/C4W1LM1MkXoDPUO9xuc
	aaQAPPgRqwXr/73fAihiMV8ygYYMvCG/iWAhsL+ooBsY4RJXptjSsxr2k6tFPBoiCE7HMpRPMa
	O4dennZQNCV7ClDt12MVK2v3NNGdhuR4yZEE8CN7DIKch2hjmksnlpFxeKqgRV0muSVReN9Qvb
	ipR0HMbGNEQ6C77gm3ZDs8Ri1OYxXuRcGdtZNY0hI25tnXBTycfZUZpgZ9tAynZvSNaU10erOb
	qIE=
X-IronPort-AV: E=Sophos;i="5.63,466,1557158400"; d="scan'208";a="212352018"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2019 00:37:59 +0800
IronPort-SDR: 6qxJCrYW8O6+xBlqVEe2m70PZAdNVjH8uUroioEy/rM4M9E0tgvPeF7zUrQBiqNXm47IUA+9/F
	slSz2SYdBXYciPYqxm9h6Oc4WAIgkPex+WoJYgggqKRuAFCU8V9Bn41O4rb2f/GQEYurhvyuIW
	fwFiNOq2igxDfhu64WMgTQRi612MISMIsLSLHlEDvGedWgwnLLwe9stYZgDaqrK8WVA8K6TRhA
	c1IK3sgR388Ft32f2RJCiX05+w/R2cMctCZphwCr0Fa7ZPVdQMXyOX+/hd8uIwSJIioaYV1vhc
	UyLwl3hfBT8s4qudUGhnb5q6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP; 08 Jul 2019 09:36:46 -0700
IronPort-SDR: /1OvSIhucTUWZgJEvE/GRIk7kV3oaoCjgvFJIVy7++W3hMM5flWp4Y0pRd2RMKBR5HSGFEo2zM
	dyylrQISijZd5e/p0mUsALqd9J2KrwcM6MTh1iJKoGOi/7WwVpaVCxXgyx76H0adh2tOoNNu33
	xb1W6Y7Vd+Gwzlgjy1QyAEosv8Yz+ETp4dko0vR77ViTstM9ACskDRFiTmpEZGZycVD+9eo9qu
	qJq69XzTgwCDfAMxo6DbI+cW/PbcZEMEV4SvfTMElKf0MGwmtptlNKJZJnFXWpmi0vBI56WGX5
	ZIQ=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2019 09:37:58 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2019 09:35:08 -0700
Message-Id: <20190708163508.30805-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] opensbi: Update from 0.3 to 0.4
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
X-List-Received-Date: Mon, 08 Jul 2019 16:47:59 -0000
Content-Transfer-Encoding: 8bit

The OpenSBI licence was updated to include contributors in the
copyright notice.

The payload logic has been updated to fix some bugs and handle the new
optional dependency on the Linux kernel for device trees

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 ...-lib-Create-a-sbi_ipi_data-structure.patch | 128 ------------------
 meta/recipes-bsp/opensbi/opensbi-payloads.inc |  22 +--
 .../{opensbi_0.3.bb => opensbi_0.4.bb}        |   8 +-
 3 files changed, 17 insertions(+), 141 deletions(-)
 delete mode 100644 meta/recipes-bsp/opensbi/files/0002-lib-Create-a-sbi_ipi_data-structure.patch
 rename meta/recipes-bsp/opensbi/{opensbi_0.3.bb => opensbi_0.4.bb} (86%)

diff --git a/meta/recipes-bsp/opensbi/files/0002-lib-Create-a-sbi_ipi_data-structure.patch b/meta/recipes-bsp/opensbi/files/0002-lib-Create-a-sbi_ipi_data-structure.patch
deleted file mode 100644
index 3c846bde62..0000000000
--- a/meta/recipes-bsp/opensbi/files/0002-lib-Create-a-sbi_ipi_data-structure.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 508a27204cbbca0a9430236e56681e5e0d343fb9 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Fri, 8 Mar 2019 11:22:22 -0800
-Subject: [PATCH] lib: Create a sbi_ipi_data structure
-
-Create a sbi_ipi_data structure that holds unpacked IPI information. At
-the same time remove ipi_type from the sbi_scratch struct and use a
-fixed offset to access it.
-
-This structure fits in behind the sbi_scratch structure.
-
-This fixes https://github.com/riscv/opensbi/issues/81
-
-Upstream-Status: Backport [https://github.com/riscv/opensbi/commit/508a27204cbbca0a9430236e56681e5e0d343fb9]
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
----
- firmware/fw_base.S        |  1 -
- include/sbi/sbi_scratch.h | 23 ++++++++++++++++-------
- lib/sbi_ipi.c             |  8 +++++---
- 3 files changed, 21 insertions(+), 11 deletions(-)
-
-diff --git a/firmware/fw_base.S b/firmware/fw_base.S
-index cf2c6a0..69cfc90 100644
---- a/firmware/fw_base.S
-+++ b/firmware/fw_base.S
-@@ -183,7 +183,6 @@ _start_warm:
- 	REG_S	a4, SBI_SCRATCH_PLATFORM_ADDR_OFFSET(tp)
- 	la	a4, _hartid_to_scratch
- 	REG_S	a4, SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET(tp)
--	REG_S	zero, SBI_SCRATCH_IPI_TYPE_OFFSET(tp)
- 	REG_S	zero, SBI_SCRATCH_TMP0_OFFSET(tp)
- 
- 	/* Setup stack */
-diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
-index 8389ef3..70ab384 100644
---- a/include/sbi/sbi_scratch.h
-+++ b/include/sbi/sbi_scratch.h
-@@ -28,17 +28,24 @@
- #define SBI_SCRATCH_PLATFORM_ADDR_OFFSET	(6 * __SIZEOF_POINTER__)
- /** Offset of hartid_to_scratch member in sbi_scratch */
- #define SBI_SCRATCH_HARTID_TO_SCRATCH_OFFSET	(7 * __SIZEOF_POINTER__)
--/** Offset of ipi_type member in sbi_scratch */
--#define SBI_SCRATCH_IPI_TYPE_OFFSET		(8 * __SIZEOF_POINTER__)
- /** Offset of tmp0 member in sbi_scratch */
--#define SBI_SCRATCH_TMP0_OFFSET			(9 * __SIZEOF_POINTER__)
--/** Maximum size of sbi_scratch */
--#define SBI_SCRATCH_SIZE			256
-+#define SBI_SCRATCH_TMP0_OFFSET			(8 * __SIZEOF_POINTER__)
-+
-+/** sbi_ipi_data is located behind sbi_scratch. This struct is not packed. */
-+/** Offset of ipi_type in sbi_ipi_data */
-+#define SBI_IPI_DATA_IPI_TYPE_OFFSET		(15 * __SIZEOF_POINTER__)
-+
-+/** Maximum size of sbi_scratch and sbi_ipi_data */
-+#define SBI_SCRATCH_SIZE			(32 * __SIZEOF_POINTER__)
- 
- #ifndef __ASSEMBLY__
- 
- #include <sbi/sbi_types.h>
- 
-+struct sbi_ipi_data {
-+	unsigned long ipi_type;
-+};
-+
- /** Representation of per-HART scratch space */
- struct sbi_scratch {
- 	/** Start (or base) address of firmware linked to OpenSBI library */
-@@ -57,8 +64,6 @@ struct sbi_scratch {
- 	unsigned long platform_addr;
- 	/** Address of HART ID to sbi_scratch conversion function */
- 	unsigned long hartid_to_scratch;
--	/** IPI type (or flags) */
--	unsigned long ipi_type;
- 	/** Temporary storage */
- 	unsigned long tmp0;
- } __packed;
-@@ -71,6 +76,10 @@ struct sbi_scratch {
- #define sbi_scratch_thishart_arg1_ptr()	\
- ((void *)(sbi_scratch_thishart_ptr()->next_arg1))
- 
-+/** Get pointer to sbi_ipi_data from sbi_scratch */
-+#define sbi_ipi_data_ptr(scratch)      \
-+((struct sbi_ipi_data *)(void*)scratch + SBI_IPI_DATA_IPI_TYPE_OFFSET)
-+
- #endif
- 
- #endif
-diff --git a/lib/sbi_ipi.c b/lib/sbi_ipi.c
-index 0e371d7..e0f2a19 100644
---- a/lib/sbi_ipi.c
-+++ b/lib/sbi_ipi.c
-@@ -31,7 +31,7 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 hartid, u32 event)
- 	 * trigger the interrupt
- 	 */
- 	remote_scratch = sbi_hart_id_to_scratch(scratch, hartid);
--	atomic_raw_set_bit(event, &remote_scratch->ipi_type);
-+	atomic_raw_set_bit(event, &sbi_ipi_data_ptr(remote_scratch)->ipi_type);
- 	mb();
- 	sbi_platform_ipi_send(plat, hartid);
- 	if (event != SBI_IPI_EVENT_SOFT)
-@@ -80,7 +80,7 @@ void sbi_ipi_process(struct sbi_scratch *scratch)
- 	sbi_platform_ipi_clear(plat, hartid);
- 
- 	do {
--		ipi_type = scratch->ipi_type;
-+		ipi_type = sbi_ipi_data_ptr(scratch)->ipi_type;
- 		rmb();
- 		ipi_event = __ffs(ipi_type);
- 		switch (ipi_event) {
-@@ -97,12 +97,14 @@ void sbi_ipi_process(struct sbi_scratch *scratch)
- 			sbi_hart_hang();
- 			break;
- 		};
--		ipi_type = atomic_raw_clear_bit(ipi_event, &scratch->ipi_type);
-+		ipi_type = atomic_raw_clear_bit(ipi_event, &sbi_ipi_data_ptr(scratch)->ipi_type);
- 	} while(ipi_type > 0);
- }
- 
- int sbi_ipi_init(struct sbi_scratch *scratch, bool cold_boot)
- {
-+	sbi_ipi_data_ptr(scratch)->ipi_type = 0x00;
-+
- 	/* Enable software interrupts */
- 	csr_set(CSR_MIE, MIP_MSIP);
- 
--- 
-2.22.0
-
diff --git a/meta/recipes-bsp/opensbi/opensbi-payloads.inc b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
index 7828599ce4..b9714a7acb 100644
--- a/meta/recipes-bsp/opensbi/opensbi-payloads.inc
+++ b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
@@ -5,10 +5,7 @@ def riscv_get_extra_oemake_image(d):
     if sbi_payload is None:
         return ""
 
-    if d.getVar('RISCV_SBI_PAYLOAD'):
-        return "FW_PAYLOAD_PATH=" + deploy_dir + "/" + sbi_payload
-
-    return ""
+    return "FW_PAYLOAD_PATH=" + deploy_dir + "/" + sbi_payload
 
 def riscv_get_extra_oemake_fdt(d):
     sbi_fdt_payload = d.getVar('RISCV_SBI_FDT')
@@ -17,14 +14,11 @@ def riscv_get_extra_oemake_fdt(d):
     if sbi_fdt_payload is None:
         return ""
 
-    if d.getVar('RISCV_SBI_PAYLOAD'):
-        # This is internal to openSBI, not a full path
-        return "FW_PAYLOAD_FDT=" + sbi_fdt_payload
-
-    return ""
+    return "FW_PAYLOAD_FDT_PATH=" + deploy_dir + "/" + sbi_fdt_payload
 
 def riscv_get_do_compile_depends(d):
     sbi_payload = d.getVar('RISCV_SBI_PAYLOAD')
+    sbi_fdt_payload = d.getVar('RISCV_SBI_FDT')
 
     if sbi_payload is None:
         return ""
@@ -32,6 +26,14 @@ def riscv_get_do_compile_depends(d):
     if 'linux' in sbi_payload or 'Image' in sbi_payload:
         return "virtual/kernel:do_deploy"
     if 'u-boot.bin' in sbi_payload:
-        return "virtual/bootloader:do_deploy"
+        # If we want U-Boot and a FDT then we need to depend on U-Boot and
+        # the kernel
+        if sbi_fdt_payload is not None:
+            return "virtual/bootloader:do_deploy virtual/kernel:do_deploy"
+        else:
+            return "virtual/bootloader:do_deploy"
+    # If we want a custom FDT then we need to depend on the kernel
+    if sbi_fdt_payload is not None:
+        return "virtual/kernel:do_deploy"
 
     return ""
diff --git a/meta/recipes-bsp/opensbi/opensbi_0.3.bb b/meta/recipes-bsp/opensbi/opensbi_0.4.bb
similarity index 86%
rename from meta/recipes-bsp/opensbi/opensbi_0.3.bb
rename to meta/recipes-bsp/opensbi/opensbi_0.4.bb
index 2b4fb97df2..139718c72b 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.3.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.4.bb
@@ -1,17 +1,16 @@
 SUMMARY = "RISC-V Open Source Supervisor Binary Interface (OpenSBI)"
 DESCRIPTION = "OpenSBI aims to provide an open-source and extensible implementation of the RISC-V SBI specification for a platform specific firmware (M-mode) and a general purpose OS, hypervisor or bootloader (S-mode or HS-mode). OpenSBI implementation can be easily extended by RISC-V platform or System-on-Chip vendors to fit a particular hadware configuration."
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=c36118b4f615f9da37635f2a7ac8ccaf"
+LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=42dd9555eb177f35150cf9aa240b61e5"
 DEPENDS += "dtc-native"
 
 require opensbi-payloads.inc
 
 inherit autotools-brokensep
 
-SRCREV = "ca20ac0cd4c099006d4eea4d9ac7bd7b58e2ae0f"
+SRCREV = "ce228ee0919deb9957192d723eecc8aaae2697c6"
 SRC_URI = "git://github.com/riscv/opensbi.git \
            file://0001-Makefile-Don-t-specify-mabi-or-march.patch \
-           file://0002-lib-Create-a-sbi_ipi_data-structure.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -38,12 +37,15 @@ do_deploy () {
 	install -d ${DEPLOY_DIR_IMAGE}
 	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_payload.* ${DEPLOY_DIR_IMAGE}/
 	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_jump.* ${DEPLOY_DIR_IMAGE}/
+	install -m 755 ${D}/platform/${RISCV_SBI_PLAT}/firmware/fw_dynamic.* ${DEPLOY_DIR_IMAGE}/
 }
 
 addtask deploy after do_install
 
 FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
 FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
+FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_dynamic.*"
+
 
 COMPATIBLE_HOST = "(riscv64|riscv32).*"
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.22.0


