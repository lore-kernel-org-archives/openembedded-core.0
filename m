Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.175.1630174372271216958
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=duZLRH4E;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.174, mailfrom: steve@sakoman.com)
Received: by mail-il1-f174.google.com with SMTP id b4so10866426ilr.11
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8lKLh70xsnoJe0H5aQsYwuIl8rfwtIoBNFfiQkaVSrk=;
        b=duZLRH4EwByPFsTDDE0cJlRQAS0AdVAqCjXkazTe0AirSC0AxcV1AiFP8ADnedRW8H
         YQEg2RHtu45vu0uikwx2OhPzNbSifkcJogfaNRFMqGn07i2NMpRnzApfsbRiljlQpTEH
         i+0SC6y8pHEqODlaRb7ei0/mEaaiQpb1K0+LJv8SFVyxGxzgr7bheBTm2Yu7qahZXz/J
         wyMEx8zEMLah/hZ6rX97mqXiL6FSX5HvF8FLf7OcWTT6B3wOcsHuW4hcpP+FEMSFDOpm
         tOG4S+5LpOdwq0bJo3WO4u8PPD9UmRxv+0FuFHsgElC0l6bb4jucvnwcefyRJGZJ5C+N
         3Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8lKLh70xsnoJe0H5aQsYwuIl8rfwtIoBNFfiQkaVSrk=;
        b=VA4rEGbbZ1x6UeeQnkPXEPO65lYChqLu5+ra3gPwz7yHXxgI8x3xiULE+Bi9IOQfvJ
         WKsntmDA26H3r8vJ+Udqo/hD/B0wfvMFG/DElwQL/usUp7tBT+PuDC5A9PazsRKmWG2a
         uOgTrYHl3XY3Ow7WTxDGaxn17+hc1eX7eQXAehJIDO2qj8TAyL4yTZq6BKv/vfQaawb2
         X7GT/zwFd8fU3eVTSdCbQRy/DRzvpcI/Xqlw9kkAahpdYPD4lL6PurY8fU8Q7pSuTpN+
         dvCYtbmdWy5X2M9UQ6IVYlXXKcDhf24wTWwpVNhWIKTMTwwUued92gPP5bTwgrkgYF8n
         7BwA==
X-Gm-Message-State: AOAM531jxkX+p1R/z9BhYWa5dBsKfVcueIdvIUXqQR15lFWxlDMjeXJm
	JFrKDPB1igMax5f2VTyntegjhOxPgaGS57wi
X-Google-Smtp-Source: ABdhPJw70QpOfelMnC1e6VeW1BaW6Yj3BK5YSV7OspgK+Iv/u0Vah+J20HQ+8dkm+MniRoL5VT/9fA==
X-Received: by 2002:a92:cc0d:: with SMTP id s13mr10097234ilp.95.1630174370557;
        Sat, 28 Aug 2021 11:12:50 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.12.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:12:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/36] qemu: Security fix CVE-2021-20221
Date: Sat, 28 Aug 2021 08:11:00 -1000
Message-Id: <4adf675e3d4ccdcee055a3c4b539f4ddc15b033d.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: Qemu.org
MR: 111643
Type: Security Fix
Disposition: Backport from https://gitlab.com/qemu-project/qemu/-/commit/edfe2eb4360cde4ed5d95bda7777edcb3510f76a
ChangeID: b3ca1aa4b772a5f27f327250c5b0b988375c86a9
Description:

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-20221.patch            | 67 +++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index bd1a83955f..ea654e0008 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -60,6 +60,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-25624_2.patch \
            file://CVE-2020-25625.patch \
            file://CVE-2020-29443.patch \
+           file://CVE-2021-20221.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch
new file mode 100644
index 0000000000..46c9ab4184
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20221.patch
@@ -0,0 +1,67 @@
+From edfe2eb4360cde4ed5d95bda7777edcb3510f76a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
+Date: Sun, 31 Jan 2021 11:34:01 +0100
+Subject: [PATCH] hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR register
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Per the ARM Generic Interrupt Controller Architecture specification
+(document "ARM IHI 0048B.b (ID072613)"), the SGIINTID field is 4 bit,
+not 10:
+
+  - 4.3 Distributor register descriptions
+  - 4.3.15 Software Generated Interrupt Register, GICD_SG
+
+    - Table 4-21 GICD_SGIR bit assignments
+
+    The Interrupt ID of the SGI to forward to the specified CPU
+    interfaces. The value of this field is the Interrupt ID, in
+    the range 0-15, for example a value of 0b0011 specifies
+    Interrupt ID 3.
+
+Correct the irq mask to fix an undefined behavior (which eventually
+lead to a heap-buffer-overflow, see [Buglink]):
+
+   $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch64 -M virt,accel=qtest -qtest stdio
+   [I 1612088147.116987] OPENED
+  [R +0.278293] writel 0x8000f00 0xff4affb0
+  ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of bounds for type 'uint8_t [16][8]'
+  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/arm_gic.c:1498:13
+
+This fixes a security issue when running with KVM on Arm with
+kernel-irqchip=off. (The default is kernel-irqchip=on, which is
+unaffected, and which is also the correct choice for performance.)
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2021-20221
+Fixes: 9ee6e8bb853 ("ARMv7 support.")
+Buglink: https://bugs.launchpad.net/qemu/+bug/1913916
+Buglink: https://bugs.launchpad.net/qemu/+bug/1913917
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Message-id: 20210131103401.217160-1-f4bug@amsat.org
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+
+Upstream-Status: Backport
+CVE: CVE-2021-20221
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/intc/arm_gic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: qemu-4.2.0/hw/intc/arm_gic.c
+===================================================================
+--- qemu-4.2.0.orig/hw/intc/arm_gic.c
++++ qemu-4.2.0/hw/intc/arm_gic.c
+@@ -1455,7 +1455,7 @@ static void gic_dist_writel(void *opaque
+         int target_cpu;
+ 
+         cpu = gic_get_current_cpu(s);
+-        irq = value & 0x3ff;
++        irq = value & 0xf;
+         switch ((value >> 24) & 3) {
+         case 0:
+             mask = (value >> 16) & ALL_CPU_MASK;
-- 
2.25.1

