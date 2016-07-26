Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E6C49606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 15:49:02 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so2317607wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 08:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nEe1OQUHd25JVBsHR1SmPbYveefcAb7WU1LWx1f3UIY=;
	b=Nvl9S7i8+U+7I9kx4gY4OKsRtVbFpNqqH2AupEZLDGGBAntNVPpBoyLuZFemNjRusG
	WSGoGLJgogELdyKVv0wbsn27Ej5JU54k5AN9zAFuy6lDPUt8+D0Yyc6W8bc84v2X6R2l
	/dVZFT1pNqBvTV4pbaHU7omBb8E+wBAzh0vwM0WW+yPVoaYrD0Xf44nwe5Dz6DhNWoka
	aBIXoNiqHltkLhIdZQrWBkl3Y2kmuUsQM+GYzDqY4XSg5vTt8EYE4q7dXg4cGEHkdmG9
	HDHzZn49fOKSEHRfaPxzNkOImsyTgGfdcmzU/IBCy0+u+yNJfMxQUgYQ7TfgSJHm1S/T
	W4tg==
X-Gm-Message-State: AEkoouuSZhX/IX8Ch312I7MPqKnosJ1sTyyBThnlPNhbnoBk/qKkHrLEo/CfHbP4QMA8zw==
X-Received: by 10.28.52.142 with SMTP id b136mr25751240wma.35.1469548142390;
	Tue, 26 Jul 2016 08:49:02 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id a2sm33679215wma.2.2016.07.26.08.49.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jul 2016 08:49:01 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 16:48:59 +0100
Message-Id: <1469548140-4095-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 1/2] qemu: add patch to add mips 24KEc CPU definition
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
X-List-Received-Date: Tue, 26 Jul 2016 15:49:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch has been accepted upstream:
http://lists.nongnu.org/archive/html/qemu-devel/2016-07/msg05778.html

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-devtools/qemu/qemu.inc                |  1 +
 ...0001-target-mips-add-24KEc-CPU-definition.patch | 54 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-mips-add-24KEc-CPU-definition.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index b865223..d724aa4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -21,6 +21,7 @@ SRC_URI = "\
     file://wacom.patch \
     file://add-ptest-in-makefile.patch \
     file://run-ptest \
+    file://0001-target-mips-add-24KEc-CPU-definition.patch \
     "
 
 SRC_URI_append_class-native = "\
diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-mips-add-24KEc-CPU-definition.patch b/meta/recipes-devtools/qemu/qemu/0001-target-mips-add-24KEc-CPU-definition.patch
new file mode 100644
index 0000000..c4dbee7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-target-mips-add-24KEc-CPU-definition.patch
@@ -0,0 +1,54 @@
+From 926bc194f918d46bd93557b15da8153b6a94a1d5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
+Date: Mon, 25 Jul 2016 23:58:22 +0100
+Subject: [PATCH] target-mips: add 24KEc CPU definition
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Define a new CPU definition supporting 24KEc cores, similar to
+the existing 24Kc, but with added support for DSP instructions
+and MIPS16e (and without FPU).
+
+Signed-off-by: André Draszik <git@andred.net>
+---
+Upstream-Status: Submitted [http://lists.nongnu.org/archive/html/qemu-devel/2016-07/msg05778.html]
+ target-mips/translate_init.c | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
+index 39ed5c4..6ae23e4 100644
+--- a/target-mips/translate_init.c
++++ b/target-mips/translate_init.c
+@@ -256,6 +256,28 @@ static const mips_def_t mips_defs[] =
+         .mmu_type = MMU_TYPE_R4000,
+     },
+     {
++        .name = "24KEc",
++        .CP0_PRid = 0x00019600,
++        .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
++                       (MMU_TYPE_R4000 << CP0C0_MT),
++        .CP0_Config1 = MIPS_CONFIG1 | (15 << CP0C1_MMU) |
++                       (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C1_IA) |
++                       (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA) |
++                       (1 << CP0C1_CA),
++        .CP0_Config2 = MIPS_CONFIG2,
++        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_DSPP) | (0 << CP0C3_VInt),
++        .CP0_LLAddr_rw_bitmask = 0,
++        .CP0_LLAddr_shift = 4,
++        .SYNCI_Step = 32,
++        .CCRes = 2,
++        /* we have a DSP, but no FPU */
++        .CP0_Status_rw_bitmask = 0x1378FF1F,
++        .SEGBITS = 32,
++        .PABITS = 32,
++        .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP,
++        .mmu_type = MMU_TYPE_R4000,
++    },
++    {
+         .name = "24Kf",
+         .CP0_PRid = 0x00019300,
+         .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
+-- 
+2.8.1
+
-- 
2.8.1


