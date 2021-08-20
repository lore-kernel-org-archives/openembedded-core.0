Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.5515.1629503725132045764
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 16:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eQwpR57W;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so14978700pjr.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 16:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hgxnaU0TnqzneeX1k42y8lIpNoUreuyDsDX5qVSlkhc=;
        b=eQwpR57Wi55LOqabe4Gfy++KzdZ+MKUrvXemm6IQ1aInO39kes/ETfWhXFh9OMg1kq
         /FcJCwAW/6gKr4nuMM0darooypIcNwFwthxdvQF8W5pZjMnuBc2j3c1hy8g0l6Kkp/aD
         q032KJlpgVK/N2FPzWLXxFxVGCSDvA3T0+aFGUgxf/6b1pIo2U6oOMxsgtzk11GQmj4n
         KXibBvbHOgycuWx2MrsjuhnQvuMtJkZatC3ljr4NtTV3CJK+RqvCBei4lJYu7JzjKFNQ
         E1YDM+Bk5XlW3f9XZZsICyUNZCA4NUr1DfyFgP9oE6QXdg0WuqMoWFLOz0Jom9A5hdRH
         sDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hgxnaU0TnqzneeX1k42y8lIpNoUreuyDsDX5qVSlkhc=;
        b=RQvGF8qM+SX2+I8g+h9KVBvnlRs6Wc8gElCnwqVZpjX0wH5DgjyzjxapiteI/JMN9W
         z1bxcRbMyTdZ2ER1MxMKg3gzUytCyibANRxsy2IAIfcoeGLh8iAVRpUjNGy6p/gZxziG
         6Ho6XmFNMemuHarSv85BQ4B8cu/KFNQNByo+D/SY5kQ66DM8YsRRwTUc0ZcQSiudErCC
         /KRXC4OsbzY/ypg75up2eMKqMmsMeYyeHNHNP0vGFnLAh77l6FOU+Xv6BjUsNwYI8Jp2
         oYYu/ZBQBPPpgoYEFkY+1vo1EXkF08pcC8Mk7JKBQde1D5OQAN+Ri9Aykw1UrMG3HgFW
         cISQ==
X-Gm-Message-State: AOAM532ga9UAcDf/SJR59ma7GsMHEynHa0fOzfZWfgKzzFErFovAe6Tc
	w3qyS/a+xPyYnLliBmkTRZfzIeQxzGo=
X-Google-Smtp-Source: ABdhPJxeI1CVojnOASRQddlMFShULzlv2MeHi4Yg9pUll0uqNNNj4osPgd2xseUWKZWbyiT7TndhEw==
X-Received: by 2002:a17:90b:789:: with SMTP id l9mr7048667pjz.223.1629503724591;
        Fri, 20 Aug 2021 16:55:24 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:43c0:2d24:85b:da13])
        by smtp.gmail.com with ESMTPSA id i11sm9634705pgo.25.2021.08.20.16.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 16:55:24 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 5/7] qemu: Security fix CVE-2021-20221
Date: Fri, 20 Aug 2021 16:55:17 -0700
Message-Id: <20210820235519.593218-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820235519.593218-1-akuster808@gmail.com>
References: <20210820235519.593218-1-akuster808@gmail.com>
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

