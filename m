Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 052C778876
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 04:32:03 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id t5so7622954pfi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 20:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=v35w854K3NhsIp8Ly+ZhhmnyOOiN37zvbzt1Q3JapV0=;
	b=H9/A7YOZGmJ3Z227Mp2VeEG4bZ+Vofq9ZHblB/YMemoHyOGTmQSEmlLPy8z9aY1Sv4
	MTiPzP2tcvPkUT5dadWL9DBWmDaoIwTeCdLFpxtw4Y2An20+EMrb3FC03LaPANaDGCk/
	Rlbmtm0Ld6TpB2JezaMeyrNXgPaQ1o09r3Phl08U1u0zfgW9gtEiW1dMV3rtSbNnLFlq
	Ae8NQzq98KyFdi/VsniL3KEqJdxL6CsSORH8drrbCqgObVsYlrckLchChbTBGdNsRtEb
	BUPVEyGezed2lMyRPP+TDkgsIRILPYNTavoWy2RuhpyRUfRRusonsKjKTonSiIe3DQZp
	MFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=v35w854K3NhsIp8Ly+ZhhmnyOOiN37zvbzt1Q3JapV0=;
	b=sabmw+Q7pFef5ly80KYRlwT8D6ep+LpFdvhexxJLQoFegaP3gBR3Cbs18Uc4VnLMYN
	RL+P4OrPrMYlSlVJ3Quc5udPHui6Zmwh/YfJTTEXJ/ds+DODWjjjoB0ZjuxVTrz5wuLA
	P4YItiKEHvBETlYnkJz8Konkx8yo6osJUFqgG8of/MujjDLWCqkzWAIx006yBtVvvsj6
	b2zVhb3v4nx3HGA5BTqAB8N3t+LvEGH8Xb8x4unnaqqWaB030TQkB+yPZmHUMPKiIj6V
	LAx6Ae30zWlv1VH5FgvJztY5fiM6299DqYBTYrZY5NRkKjnjJgms6ZVPJozUgPh7P+Ww
	yb3w==
X-Gm-Message-State: AKwxytdA2qDAymy9+N1F3fouJk/nrf5CnfdrY5Y8o5rleEOvz0KvOFrz
	h2ik2AT824I4untp6v7IOHLSSQ==
X-Google-Smtp-Source: AH8x227ay8KQzv7wT5C4q0c45CL99lmZtIw9oHjEO340lmlGnxbTgMS2HIq7vDC6gDGasD3LnJsnMw==
X-Received: by 2002:a17:902:7844:: with SMTP id
	e4-v6mr4029225pln.83.1517286725049; 
	Mon, 29 Jan 2018 20:32:05 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	u67sm1134233pfd.169.2018.01.29.20.32.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 20:32:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 20:31:49 -0800
Message-Id: <e3d636a6817fc50a874bf7a37245f529dcbb6a85.1517286478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <cover.1517286478.git.raj.khem@gmail.com>
References: <cover.1517286478.git.raj.khem@gmail.com>
Subject: [PATCH 1/8] gcc-7.3: Drop upstreamed musl cpuinfo patch
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
X-List-Received-Date: Tue, 30 Jan 2018 04:32:04 -0000

This patch is already in gcc-7-branch
https://github.com/gcc-mirror/gcc/commit/6e6c7fc1e15525a10f48d4f5ac2edd853e2f5cb7

Thanks nsz for noticing it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-7.3.inc              |  1 -
 ...e-alias-for-__cpu_indicator_init-instead-.patch | 85 ----------------------
 2 files changed, 86 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
index efa62eaf6a..724f9c32a0 100644
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
@@ -70,7 +70,6 @@ SRC_URI = "\
            file://0043-gcc-final.c-fdebug-prefix-map-support-to-remap-sourc.patch \
            file://0044-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch \
            file://0045-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
-           file://0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            file://0047-sync-gcc-stddef.h-with-musl.patch \
            file://0048-gcc-Enable-static-PIE.patch \
            file://fix-segmentation-fault-precompiled-hdr.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc-7.3/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
deleted file mode 100644
index f6b2829364..0000000000
--- a/meta/recipes-devtools/gcc/gcc-7.3/0046-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From c7bce03a625fe2215a13f520850604178103ddd7 Mon Sep 17 00:00:00 2001
-From: Szabolcs Nagy <nsz@port70.net>
-Date: Sat, 24 Oct 2015 20:09:53 +0000
-Subject: [PATCH 46/47] libgcc_s: Use alias for __cpu_indicator_init instead of
- symver
-
-Adapter from
-
-https://gcc.gnu.org/ml/gcc-patches/2015-05/msg00899.html
-
-This fix was debated but hasnt been applied gcc upstream since
-they expect musl to support '@' in symbol versioning which is
-a sun/gnu versioning extention. This patch however avoids the
-need for the '@' symbols at all
-
-libgcc/Changelog:
-
-2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
-
-	* config/i386/cpuinfo.c (__cpu_indicator_init_local): Add.
-	(__cpu_indicator_init@GCC_4.8.0, __cpu_model@GCC_4.8.0): Remove.
-
-	* config/i386/t-linux (HOST_LIBGCC2_CFLAGS): Remove -DUSE_ELF_SYMVER.
-
-gcc/Changelog:
-
-2015-05-11  Szabolcs Nagy  <szabolcs.nagy@arm.com>
-
-	* config/i386/i386.c (ix86_expand_builtin): Make __builtin_cpu_init
-	call __cpu_indicator_init_local instead of __cpu_indicator_init.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- gcc/config/i386/i386.c       | 4 ++--
- libgcc/config/i386/cpuinfo.c | 6 +++---
- libgcc/config/i386/t-linux   | 2 +-
- 3 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/gcc/config/i386/i386.c b/gcc/config/i386/i386.c
-index dec3aee0048..0452dcfcb8d 100644
---- a/gcc/config/i386/i386.c
-+++ b/gcc/config/i386/i386.c
-@@ -36918,10 +36918,10 @@ ix86_expand_builtin (tree exp, rtx target, rtx subtarget,
-     {
-     case IX86_BUILTIN_CPU_INIT:
-       {
--	/* Make it call __cpu_indicator_init in libgcc. */
-+	/* Make it call __cpu_indicator_init_local in libgcc.a. */
- 	tree call_expr, fndecl, type;
-         type = build_function_type_list (integer_type_node, NULL_TREE); 
--	fndecl = build_fn_decl ("__cpu_indicator_init", type);
-+	fndecl = build_fn_decl ("__cpu_indicator_init_local", type);
- 	call_expr = build_call_expr (fndecl, 0); 
- 	return expand_expr (call_expr, target, mode, EXPAND_NORMAL);
-       }
-diff --git a/libgcc/config/i386/cpuinfo.c b/libgcc/config/i386/cpuinfo.c
-index a1dc011525f..dac5e889abf 100644
---- a/libgcc/config/i386/cpuinfo.c
-+++ b/libgcc/config/i386/cpuinfo.c
-@@ -391,7 +391,7 @@ __cpu_indicator_init (void)
-   return 0;
- }
- 
--#if defined SHARED && defined USE_ELF_SYMVER
--__asm__ (".symver __cpu_indicator_init, __cpu_indicator_init@GCC_4.8.0");
--__asm__ (".symver __cpu_model, __cpu_model@GCC_4.8.0");
-+#ifndef SHARED
-+int __cpu_indicator_init_local (void)
-+  __attribute__ ((weak, alias ("__cpu_indicator_init")));
- #endif
-diff --git a/libgcc/config/i386/t-linux b/libgcc/config/i386/t-linux
-index 11bb46e0ee4..4f47f7bfa59 100644
---- a/libgcc/config/i386/t-linux
-+++ b/libgcc/config/i386/t-linux
-@@ -3,4 +3,4 @@
- # t-slibgcc-elf-ver and t-linux
- SHLIB_MAPFILES = libgcc-std.ver $(srcdir)/config/i386/libgcc-glibc.ver
- 
--HOST_LIBGCC2_CFLAGS += -mlong-double-80 -DUSE_ELF_SYMVER
-+HOST_LIBGCC2_CFLAGS += -mlong-double-80
--- 
-2.12.2
-
-- 
2.16.1


