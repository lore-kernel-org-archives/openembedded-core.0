Return-Path: <prvs=2919fc5d3=alistair.francis@wdc.com>
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id 598FA601D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 23:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1580425900; x=1611961900;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=rMnZzmzszq2Ymjagzzq0xdOSUCr7kQefJYJG3zjdwRw=;
	b=nnCYYfhJwOsxV6/UWKGUhh20rCEAQlyiDR99hzB5WtMWQPqiCTHMsVj0
	RO4bOPDVdhTWCklIJQcfLPYMwMaY6tVFfNDAI0oUuILF6erUisNHJL55h
	2RywFZyUMTHUIBEDff1SrRw64Hxjnl1h5Dg5ujYeOQ1U7xKPz5X97jMS9
	+Txmk/Cm1sZzfYDWRky1Jh2aKuduLg/ttBYRPqEy75YtW3KKXvpjxs376
	j04PJjo1fqtOit6xSfoC8tvHpmaKprPWx3Fytu0qV0c6iDVK5m7VGURlI
	zHTj0mFO6kWTAcc98TglbjzCpoX7n422xZHaGzyyj/ngbYOGmf4DM5JnC w==;
IronPort-SDR: cY5ITScf/MHxrB/QhZ2B2Ww+FLKF2RlSYeZ+SA8W/5TZ1BRP9PXTzqmOhDWbLOrB/R1Cvz2JCp
	cWUww+VUVcxl1J1hTKp4tQANneCNUIK5Rnwoez+rAOPuj2OKaypClHSZGecuKNGsFt11bIQw0K
	2PqhF32RRVOYlThsAZ37v17RRPBADvDm6yqlRMA03k3uOGJUg4WxbbEqd9Ubp1Rsthc4JaghBW
	1UgjS5SEvu0VjmU8UOgUG6h14OUwia4pi9U6AQbLuMuc70GtlcDe044qn6UZBafatgQJYdwMyp
	isQ=
X-IronPort-AV: E=Sophos;i="5.70,383,1574092800"; d="scan'208";a="230500780"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 31 Jan 2020 07:11:39 +0800
IronPort-SDR: RWjKQsGbbi3Gr9YEpAaPUU833gxvO9Xbx4+YswZ0DoZHvFw7wRDCG7/LT8vP2COnfx2M7tuYgM
	S5v/FQHFWGkLmU/2JEfVawXRcH2CWeGUjiplXvIBJOTKeVd9us+Bk2Skgpme5dHOTF0GFZRDcs
	hWx15IulEmymy2Xgbq56AsLaS4T0vzkoMDFQQQ0E1Lrj6qFWnHzyx8Ky2DLECcGunVUu4YtQZr
	Hgg06xYGo5okvJOpzgLDkmegLjzWcwtcGfv4c9z9Z+T09rq79KMpAhzpJ1UezVexIJxrH1fQk4
	+fL5+gT6EiUgQOc/9rVSxanc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	30 Jan 2020 15:04:10 -0800
IronPort-SDR: vgDOvR3o2WHDCmxvpaNYao5hFZY5UBnYBd9Cf3XRQuJf1sRidr/06qdnd3HCuUA72/AeFpBJVx
	8KMdrviLsC9QDJuS07XT+mz+TJHg3ywK4i7bI58e3tJDt2+U3Ktx72NG8FR/Mzwn/YnxTbQVYD
	PXdtlw1P6sBbVoNICeKkyo5VyHzLv0Pd85L+jRaWcElsRs3fMebv0DhzlgQQTAOfOR40G2OCUA
	b1SQnVSxvVPgR7ClFhp+jYaAjGyPky2Vu2Oplg5g6tfVCGrRYQAQB2jEtHbr26Du6sCXXy9dvS
	2U8=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.158.235])
	by uls-op-cesaip02.wdc.com with ESMTP; 30 Jan 2020 15:10:59 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jan 2020 15:04:23 -0800
Message-Id: <20200130230423.18086-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] opensbi: Remove dependency on FDT
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:17 -0000
Content-Transfer-Encoding: 8bit

U-Boot no longer requires OpenSBI to include a FDT for the HiFive
Unleashed, so remove the support from OpenSBI.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-bsp/opensbi/opensbi-payloads.inc | 20 +------------------
 meta/recipes-bsp/opensbi/opensbi_0.5.bb       |  4 +---
 2 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-bsp/opensbi/opensbi-payloads.inc b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
index b9714a7acb..2e32943245 100644
--- a/meta/recipes-bsp/opensbi/opensbi-payloads.inc
+++ b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
@@ -7,18 +7,8 @@ def riscv_get_extra_oemake_image(d):
 
     return "FW_PAYLOAD_PATH=" + deploy_dir + "/" + sbi_payload
 
-def riscv_get_extra_oemake_fdt(d):
-    sbi_fdt_payload = d.getVar('RISCV_SBI_FDT')
-    deploy_dir = d.getVar('DEPLOY_DIR_IMAGE')
-
-    if sbi_fdt_payload is None:
-        return ""
-
-    return "FW_PAYLOAD_FDT_PATH=" + deploy_dir + "/" + sbi_fdt_payload
-
 def riscv_get_do_compile_depends(d):
     sbi_payload = d.getVar('RISCV_SBI_PAYLOAD')
-    sbi_fdt_payload = d.getVar('RISCV_SBI_FDT')
 
     if sbi_payload is None:
         return ""
@@ -26,14 +16,6 @@ def riscv_get_do_compile_depends(d):
     if 'linux' in sbi_payload or 'Image' in sbi_payload:
         return "virtual/kernel:do_deploy"
     if 'u-boot.bin' in sbi_payload:
-        # If we want U-Boot and a FDT then we need to depend on U-Boot and
-        # the kernel
-        if sbi_fdt_payload is not None:
-            return "virtual/bootloader:do_deploy virtual/kernel:do_deploy"
-        else:
-            return "virtual/bootloader:do_deploy"
-    # If we want a custom FDT then we need to depend on the kernel
-    if sbi_fdt_payload is not None:
-        return "virtual/kernel:do_deploy"
+        return "virtual/bootloader:do_deploy"
 
     return ""
diff --git a/meta/recipes-bsp/opensbi/opensbi_0.5.bb b/meta/recipes-bsp/opensbi/opensbi_0.5.bb
index 6a9026254c..71d64fa324 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.5.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.5.bb
@@ -2,7 +2,6 @@ SUMMARY = "RISC-V Open Source Supervisor Binary Interface (OpenSBI)"
 DESCRIPTION = "OpenSBI aims to provide an open-source and extensible implementation of the RISC-V SBI specification for a platform specific firmware (M-mode) and a general purpose OS, hypervisor or bootloader (S-mode or HS-mode). OpenSBI implementation can be easily extended by RISC-V platform or System-on-Chip vendors to fit a particular hadware configuration."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.BSD;md5=42dd9555eb177f35150cf9aa240b61e5"
-DEPENDS += "dtc-native"
 
 require opensbi-payloads.inc
 
@@ -21,7 +20,7 @@ SRC_URI[sha256sum] = "07f18b73abf3b85aabe5bead19a923716c100d30eb58033459f39c3a22
 
 EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D}"
 # If RISCV_SBI_PAYLOAD is set then include it as a payload
-EXTRA_OEMAKE_append = " ${@riscv_get_extra_oemake_image(d)} ${@riscv_get_extra_oemake_fdt(d)}"
+EXTRA_OEMAKE_append = " ${@riscv_get_extra_oemake_image(d)}"
 
 # Required if specifying a custom payload
 do_compile[depends] += "${@riscv_get_do_compile_depends(d)}"
@@ -47,7 +46,6 @@ FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
 FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
 FILES_${PN} += "/platform/${RISCV_SBI_PLAT}/firmware/fw_dynamic.*"
 
-
 COMPATIBLE_HOST = "(riscv64|riscv32).*"
 INHIBIT_PACKAGE_STRIP = "1"
 
-- 
2.25.0


