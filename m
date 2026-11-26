Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1694.1795712427056286353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 09:00:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fYazb2CG;
 spf=pass (domain: konsulko.com, ip: 209.85.216.46, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b413d04c93so4193681a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 09:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795712426; x=1796317226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KwXJMzrf5rRkoV+FyVx0ksHHEtWEr6baXL5ZchVtiQ0=;
        b=fYazb2CGLrVt6yIeCkYAydhoAvsqDCaEk8bje/cC73y0ekB0MuI8LWibTze0b9DaxB
         pnFHYC9ImezHkBiEE3E55OE1ogV45WbhKA5+MRZCZ1vNQ8kcjTVMQZtc/4+/iJUItqFv
         s7BftBDUpu/gJA9brGMo83Xf5+KUHEiGcKZME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712426; x=1796317226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KwXJMzrf5rRkoV+FyVx0ksHHEtWEr6baXL5ZchVtiQ0=;
        b=CY5iRYgAfit8r4LcRJ60WSfmYxc4DqJ1KZ3vBfcaupj1AeQkfEZXVQEu/tx3sFGhpS
         9tBEC7mtyXLnXb4kQm1EbOuxGGhA/1L6SVifkZK3lHZau/mWgnxiUk+1QPA0e7aoLnmw
         XvdzoMWYkA0M0b7yguvRJSXpS5juGudRLPc3LGzs2wrZqUAHn9BXHQEv9nOecf2mKqmB
         NhiZqOvE4A5WM1qW0SjG2mlGvQFhLJgPSIrRI4OsaoXQcDwnBzbeBmGNUHNyQoVU4Lio
         7t0DEK5w8XK0UzRGXeKXc5oL2OeJaK511Y6QlJerP5h/GI9KKasxmsybF30qh7Bv4Gmh
         DBFg==
X-Gm-Message-State: APuU4Z/+vwp3GleZoKZG5gaRfWQUm4y1iaKSgiSHe7YflXScKdvs6goL
	2M1grSHp2/FPe+5vIoc+JO2d4SK0mzh+3YI96V0eX+OMpWTmCuyXZwHSSEMFE/6yv7vbldsKTRh
	lzCtt
X-Gm-Gg: AZFdTZcwlJVdRSMlRj6jGr8tohZlrBxdAdR0neDccLvOZcoXsa2DNvaNKUc9V56zNWy
	rhUc5iHXveb0/c71DpF0EY33fHxtBmhWV1U6weQySlCI46cmbf4U8xgTksI6vQJWFMKjfiuCp0Y
	gUwgHMaedW+EI4S6zlk1bIeBtnbo686B1dN4Lu3QzVofExb5c5EyXjs/mT1zax2P8PNBhdE5FzE
	UneGXA5jpUpOsGchBbmyECbd8qOAY5Ed4aYtoN5+3+/3JqyWWhK2tAxWwTDm56OilI7PCucvZ6D
	NwKITL0lcOYmwLf3gjDhF/Hx8YVVTtiKNtdqZYnxfN5jZX8WrHCRSipBQC14vHc3WqxHJSADJQg
	wYk1lof49poqomN+vHZvWX9locrRI26y5O3QnJc5BRhQ6fTVgW7PZUiIf30uAti3c3xQ2KKbKZV
	2rmDfSXWKuALe1TphT8byeYgsTR13ceCpfo10828winpzQWosQt+y/J9OlV25ShmjoTvWXABCB+
	LdeJbcbkkGvaVcZ+BVLHBlErzk6BjB6dMmUMvlSFCAtxIAJ+iBrScPRlyh/Hd1W0vlejV67U5h+
	pGHHBcr4nPK0uCy6wh4/gue9mcsqM/PR0F6lcete/j8pszGFWjLXnbrtwo9OmIMPNvHR755nMdO
	hj+5j4oL76fR0Dnv3t215N92hCG2wWdLxt2iJXG+jSESg4Kim3Ema3Y5Q/0w5eTKrsCo=
X-Received: by 2002:a17:90b:1802:b0:3b4:e19:e127 with SMTP id 98e67ed59e1d1-3b41cb5009emr20695414a91.63.1795712426242;
        Thu, 26 Nov 2026 09:00:26 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from localhost (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm36344349a91.5.2026.11.26.09.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:00:25 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Hernandez <alejandro@enedino.org>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/2] picolibc-helloworld: fix qemuarm hang with a virt memory layout
Date: Thu, 26 Nov 2026 09:00:11 -0800
Message-ID: <20261126170011.30593-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126170011.30593-1-tim.orling@konsulko.com>
References: <20261126170011.30593-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 17:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251328
Content-Type: text/plain; charset="utf-8"

On qemuarm the hello-world image hung without output. Upstream's
hello-world/arm.ld targets Cortex-M boards with RAM at 0x20000000, but
on the QEMU "virt" board used by qemuarm that address is PCIe MMIO, not
RAM. The startup code faults when it copies initialized data there, and
picolibc's default exception handler loops forever, so the image hangs
before main(). arm.ld has had this layout since it was added upstream in
2021, so qemuarm never booted.

Add a 32-bit linker script with the virt memory map (RAM at 0x40000000)
and use it for qemuarm.

Tested by building picolibc-helloworld for qemuarm, qemuarm64,
qemuriscv32 and qemuriscv64 and running each ELF under QEMU with
semihosting; all print "hello, world" and exit 0.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../picolibc-helloworld/qemuarm-virt.ld        | 18 ++++++++++++++++++
 .../picolibc/picolibc-helloworld_git.bb        | 13 ++++++++-----
 2 files changed, 26 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/picolibc/picolibc-helloworld/qemuarm-virt.ld

diff --git a/meta/recipes-core/picolibc/picolibc-helloworld/qemuarm-virt.ld b/meta/recipes-core/picolibc/picolibc-helloworld/qemuarm-virt.ld
new file mode 100644
index 0000000000..e255c18469
--- /dev/null
+++ b/meta/recipes-core/picolibc/picolibc-helloworld/qemuarm-virt.ld
@@ -0,0 +1,18 @@
+/*
+ * Memory layout for running picolibc hello-world on the 32-bit qemuarm
+ * MACHINE (QEMU "virt" board, Cortex-A15). Upstream's hello-world/arm.ld
+ * targets Cortex-M boards (flash at 0x0, RAM at 0x20000000); on "virt"
+ * 0x20000000 is PCIe MMIO, so writing .data there aborts. RAM on "virt"
+ * starts at 0x40000000.
+ *
+ * AI-generated with Claude Code.
+ *
+ * SPDX-License-Identifier: MIT
+ */
+__flash =      0x40000000;
+__flash_size = 0x00400000;
+__ram =        0x40400000;
+__ram_size   = 0x00200000;
+__stack_size = 8k;
+
+INCLUDE picolibc.ld
diff --git a/meta/recipes-core/picolibc/picolibc-helloworld_git.bb b/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
index 573a571c24..7fe1e319d2 100644
--- a/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
+++ b/meta/recipes-core/picolibc/picolibc-helloworld_git.bb
@@ -15,16 +15,19 @@ QB_OPT_APPEND:append = " -semihosting-config enable=on"
 
 # picolibc comes with a set of linker scripts, set the file
 # according to the architecture being built.
-PICOLIBC_LINKERSCRIPT:qemuarm64 = "aarch64.ld"
-PICOLIBC_LINKERSCRIPT:qemuarm = "arm.ld"
-PICOLIBC_LINKERSCRIPT:qemuriscv32 = "riscv.ld"
-PICOLIBC_LINKERSCRIPT:qemuriscv64 = "riscv.ld"
+PICOLIBC_LINKERSCRIPT:qemuarm64 = "${S}/hello-world/aarch64.ld"
+PICOLIBC_LINKERSCRIPT:qemuriscv32 = "${S}/hello-world/riscv.ld"
+PICOLIBC_LINKERSCRIPT:qemuriscv64 = "${S}/hello-world/riscv.ld"
+# Upstream's arm.ld is laid out for Cortex-M boards, not the QEMU "virt"
+# board used by qemuarm, so use our own memory layout instead.
+SRC_URI:append:qemuarm = " file://qemuarm-virt.ld"
+PICOLIBC_LINKERSCRIPT:qemuarm = "${UNPACKDIR}/qemuarm-virt.ld"
 
 # Simple compile function that manually exemplifies usage; as noted,
 # use a custom linker script, the GCC specs provided by picolibc
 # and semihost to be able to test via QEMU's monitor
 do_compile(){
-    ${CC} ${CFLAGS} ${LDFLAGS} --verbose -T${S}/hello-world/${PICOLIBC_LINKERSCRIPT} -specs=picolibc.specs --oslib=semihost -o ${BAREMETAL_BINNAME}.elf ${S}/hello-world/hello-world.c
+    ${CC} ${CFLAGS} ${LDFLAGS} --verbose -T${PICOLIBC_LINKERSCRIPT} -specs=picolibc.specs --oslib=semihost -o ${BAREMETAL_BINNAME}.elf ${S}/hello-world/hello-world.c
     ${OBJCOPY} -O binary ${BAREMETAL_BINNAME}.elf ${BAREMETAL_BINNAME}.bin
 }
 
-- 
2.56.1

