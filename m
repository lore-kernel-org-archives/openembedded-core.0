Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [])
 by mx.groups.io with SMTP id smtpd.web12.827.1622676237720483849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 16:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=kdhSb5CF;
 spf=fail (domain: wdc.com, ip: <nil>, mailfrom: prvs=780e1cc66=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1622676239; x=1654212239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rifFZ5p+HVwHGpXYzKtImqU6PRU3f8kabCWJ1nr5bAw=;
  b=kdhSb5CFPHkagBMRwPsI39uGAyvo561CrGe1xeK3p5f4zbd2+cC3JjDt
   eoNnpQh0Rt0DDXLRqNrufHCdsHQWFcudx9UQk7P23IJFqQYhw6PEo9JVQ
   yxSvTEPrSuvAXp04BlnYEBClfVrYPexw/Tq8MR9ERjdlG1Eq0UywRW1Bt
   58qy+LU1ieru3NqwVNcgb+9Po2dpzE9JQXddeqO7FTOR9vkvsI/KHkoQ2
   VlHwEQliCw5mrZX812qoRJgM/xFyGH4Acg7iMV5JX+Y+I/qCCBLllEzVJ
   WJyXXKTEMnjSXVgRW5qztN/xVV2JcAbM/IoficzzYQdNBtwsloqlNHMtH
   g==;
IronPort-SDR: M04KrYNXzWkYrQVcvp/v1EVzNq+ETeZuCk3gUk0DGfhvuFiGfXdBssvcwgbVQb8RHKb7eXNfwZ
 ddIigSy2Op2Ee8ik4O2nhFDcZS4Ye0Mn2cpkYv3BPB4+SgwXApLXfUbSyvMNN7nE5HKkJf4CYa
 tGnCcJt2PwL/qQwZhvyt/oD8oI17rRNVv8XacEO9P2WkU94e3VKegUB5E1M5ekp5NQeqph+Ktz
 40CdZw8utz/SHgFJOjpkWJVjDLeSlywsl1BIpRyxIW50U5m/ecANDE+5heUOKmqaxMGkMS5SYb
 /zQ=
X-IronPort-AV: E=Sophos;i="5.83,244,1616428800"; 
   d="scan'208";a="169775324"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 03 Jun 2021 07:23:58 +0800
IronPort-SDR: CD+DCaP7X6HKiD1zr/+9uiSbHTzYRL6avkOXZpwmX8B0BMAez/+iKom+zRb0VCdkAiHdcEkt4i
 ZnMtHyTilxaHUdUGlCR+UcUzWFXJC4evzWTQ2oQlM1jC3hsHDrUtDYHIdY6FXiaQlIilzjmMsx
 vobcG/A/xwcttF10582fH6A6MXIYxw2SfC2BwOS7BWTXbzhs8grtoeYVzJ9f2xUftkXa/gZeek
 dbr7k4/nGmU5wZ5j5B/FsLiIdEuMQ13WYAQn3UoVgyIzLj+CTvZuIHDjTqpT3kcvz6nD45qQFU
 I9kBLGr8FSSzuZHEiI0RD5Qk
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2021 16:03:13 -0700
IronPort-SDR: rta9aWwJjIW5Fg/jUOknEUMnIjHLPg766AD2YNOkbDTFlkGVxvBepphxdOkLI5aP/LI+XlEJyR
 HHUEFp5qvyDsXVxZiAncNQfpHpJO5+NjDHvEREg3NBNLvz35Z+B2ao1VEslzkDfuqXCCVpoMdM
 KPqx0LKU4MYoAaDtlZevPcKpxqQ7wsiQ7v4J/8+HI9FJx2tMkPBQkLV0oKlfx68WapLNSDzraa
 oXUWX+Ys2NzHVGznXQs+msc4CBOgPPUS+oc8JMn2dsyBcNoR+Jny8Z0mjIRKCQ2URKXw8mU3BK
 eVg=
WDCIronportException: Internal
Received: from unknown (HELO localhost.localdomain) ([10.225.165.72])
  by uls-op-cesaip01.wdc.com with ESMTP; 02 Jun 2021 16:23:57 -0700
From: "Alistair Francis" <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 3/3] recipes-bsp/opensbi: Add support for specifying a device tree
Date: Thu,  3 Jun 2021 09:21:04 +1000
Message-Id: <20210602232104.3490139-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602232104.3490139-1-alistair.francis@wdc.com>
References: <20210602232104.3490139-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-bsp/opensbi/opensbi-payloads.inc | 15 ++++++++++++++-
 meta/recipes-bsp/opensbi/opensbi_0.9.bb       |  1 +
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/opensbi/opensbi-payloads.inc b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
index 2e32943245..cc31ab3b1d 100644
--- a/meta/recipes-bsp/opensbi/opensbi-payloads.inc
+++ b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
@@ -7,12 +7,25 @@ def riscv_get_extra_oemake_image(d):
 
     return "FW_PAYLOAD_PATH=" + deploy_dir + "/" + sbi_payload
 
+def riscv_get_extra_oemake_fdt(d):
+    sbi_fdt = d.getVar('RISCV_SBI_FDT')
+    deploy_dir = d.getVar('DEPLOY_DIR_IMAGE')
+
+    if sbi_fdt is None:
+        return ""
+
+    return "FW_FDT_PATH=" + deploy_dir + "/" + sbi_fdt
+
 def riscv_get_do_compile_depends(d):
     sbi_payload = d.getVar('RISCV_SBI_PAYLOAD')
+    sbi_fdt = d.getVar('RISCV_SBI_FDT')
 
-    if sbi_payload is None:
+    if sbi_payload is None and sbi_fdt is None:
         return ""
 
+    if sbi_fdt is not None and 'u-boot.bin' in sbi_payload:
+        return "virtual/kernel:do_deploy virtual/bootloader:do_deploy"
+
     if 'linux' in sbi_payload or 'Image' in sbi_payload:
         return "virtual/kernel:do_deploy"
     if 'u-boot.bin' in sbi_payload:
diff --git a/meta/recipes-bsp/opensbi/opensbi_0.9.bb b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
index 52965abda5..5fee52136d 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.9.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.9.bb
@@ -18,6 +18,7 @@ S = "${WORKDIR}/git"
 EXTRA_OEMAKE += "PLATFORM=${RISCV_SBI_PLAT} I=${D} FW_PIC=n"
 # If RISCV_SBI_PAYLOAD is set then include it as a payload
 EXTRA_OEMAKE_append = " ${@riscv_get_extra_oemake_image(d)}"
+EXTRA_OEMAKE_append = " ${@riscv_get_extra_oemake_fdt(d)}"
 
 # Required if specifying a custom payload
 do_compile[depends] += "${@riscv_get_do_compile_depends(d)}"
-- 
2.31.1

