Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36405C678D4
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 14:57:16 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.88822.1673621829021845039
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 06:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VVdiDOSp;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id az7so21318167wrb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 06:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjGqVysgP5cmUJNaj72hoK/m3NL202/PuZpnqKQNLD4=;
        b=VVdiDOSpMR4/cq35CfLIUywQLlv1zuDTHSO3cihkE1LleJIGThVVxcPZ7A3S24zw8N
         DwgGyUkemmkpa2R/YQcoacDVcq5UcXKDOZztXHsLzNxdQGWObWsAQZOBhn3tWs7FBBgC
         D0X56jmMY3OV592M2wUylh2acslsy2Wo0FzAdrFkzbCE+uOUZezNsQVM7tuSMnDVkoSK
         +AjcDSO2z2qmJEBQcXZN4QoI5HX0LOR2XU4BFRBQKgkx9QzAvd86onrr4YC8etev+3ZR
         AoX65uQoC9RvaDQhAdQaoxL4ei8FTLlDY29fkIwWpo96sjZYChy9gqJU3zHDlffpoiXo
         qvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjGqVysgP5cmUJNaj72hoK/m3NL202/PuZpnqKQNLD4=;
        b=vgc9WqHBx2/NoHm35jCOcb0tDV95UJfMSbpl1xB9LFHlUkna3HrTf+/k3sJTzgEBwz
         vV1fGSW9oLFTUVix0lo1DWUOM44J2eaCpZwmN/ktwS12uSH/gdQYPtQr4Pk3khO/cwus
         nrNtRDtTZuDqnrZORtFGSFZHRyrZGXO6bP3rysaLwTd1gn6wr9OCX20K0zGE4qQQm07V
         pv86TSYLwgGbjd+si4lPzErQ/M6ZHpbpDx8jU1++lrzY+yKgrzKxTZ90hwntGFTURpjt
         QOpD1UB0g54hXP/6/jChhI3GqB/DlrptA2xL0vROnphAS2mxZCqKaLqFnrRmJwdYf80T
         tOfA==
X-Gm-Message-State: AFqh2kpDchag2Vrpv4TweoJlLlSsGpnekQx5ESaIdLxwWDMIFav9qXjB
	Ugiu4MM3Q9v3GMMi4YfOXcz36inVPFM=
X-Google-Smtp-Source: AMrXdXutdcv4AheSGyMnMYiHDhe49C1Gl+l4JPTrG7qKCHh2tM2VdfrS0t90jIVO+mvWNF+WjNeRdA==
X-Received: by 2002:a5d:5257:0:b0:2a8:e91d:ad31 with SMTP id k23-20020a5d5257000000b002a8e91dad31mr23907990wrc.62.1673621827414;
        Fri, 13 Jan 2023 06:57:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d20-20020adfa354000000b002bc50ba3d06sm15808417wrb.9.2023.01.13.06.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:57:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/7] mesa: update 22.2.3 -> 22.3.3
Date: Fri, 13 Jan 2023 15:56:56 +0100
Message-Id: <20230113145700.2773771-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230113145700.2773771-1-alex@linutronix.de>
References: <20230113145700.2773771-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 14:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175830

gallium-xvmc option removed upstream

Remove 0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
as upstream code no longer uses these definitions.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...fine-__NR_futex-if-it-does-not-exist.patch | 34 -------------------
 ...k-for-all-linux-host_os-combinations.patch | 14 ++++----
 .../{mesa-gl_22.2.3.bb => mesa-gl_22.3.3.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  4 +--
 .../mesa/{mesa_22.2.3.bb => mesa_22.3.3.bb}   |  0
 5 files changed, 8 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_22.2.3.bb => mesa-gl_22.3.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.2.3.bb => mesa_22.3.3.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch b/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
deleted file mode 100644
index e7d92197be..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 859bfc342d1db9b61c43f30d9aa27cea35ca7599 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Oct 2020 11:03:47 -0700
-Subject: [PATCH] futex.h: Define __NR_futex if it does not exist
-
-__NR_futex is not defines by newer architectures e.g. arc, riscv32 as
-they only have 64bit variant of time_t. Glibc defines SYS_futex interface based on
-__NR_futex, since this is used in applications, such applications start
-to fail to build for these newer architectures. This patch defines a
-fallback to alias __NR_futex to __NR_futex_tim64 so SYS_futex keeps
-working
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/util/futex.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/util/futex.h b/src/util/futex.h
-index 2a2a00c..92fc123 100644
---- a/src/util/futex.h
-+++ b/src/util/futex.h
-@@ -38,6 +38,10 @@
- #define SYS_futex SYS_futex_time64
- #endif
- 
-+#if !defined(SYS_futex) && defined(SYS_futex_time64)
-+# define SYS_futex SYS_futex_time64
-+#endif
-+
- static inline long sys_futex(void *addr1, int op, int val1, const struct timespec *timeout, void *addr2, int val3)
- {
-    return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
index ec263ce479..36c33f889b 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -1,4 +1,4 @@
-From d092a9000da62dfccca5b58fca56b94eb9989c48 Mon Sep 17 00:00:00 2001
+From 3b4d6b89f644b43e507c08181fef06db4326f9da Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:04:49 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
@@ -20,19 +20,19 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 250b528..b5c98f8 100644
+index 172c64a..9b5294c 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -173,7 +173,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
  # Only build shared_glapi if at least one OpenGL API is enabled
  with_shared_glapi = with_shared_glapi and with_any_opengl
  
--system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos'].contains(host_machine.system())
-+system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].contains(host_machine.system()) or host_machine.system().startswith('linux')
+-system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system())
++system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android'].contains(host_machine.system()) or host_machine.system().startswith('linux')
  
- dri_drivers = get_option('dri-drivers')
- if dri_drivers.length() != 0
-@@ -1091,7 +1091,7 @@ if cc.has_function('reallocarray')
+ with_freedreno_kgsl = get_option('freedreno-kgsl')
+ if with_freedreno_kgsl
+@@ -1076,7 +1076,7 @@ if cc.has_function('reallocarray')
  endif
  
  # TODO: this is very incomplete
diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb b/meta/recipes-graphics/mesa/mesa-gl_22.3.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.2.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.3.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 77aa97069a..5fdb67ca2a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,7 +17,6 @@ PE = "2"
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-           file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
            ${NATIVE_PATCHES} \
            "
@@ -25,7 +24,7 @@ NATIVE_PATCHES ?= ""
 # required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD enabled
 NATIVE_PATCHES:class-native = "file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
 
-SRC_URI[sha256sum] = "ee7d026f7b1991dbae0861d359b671145c3a86f2a731353b885d2ea2d5c098d6"
+SRC_URI[sha256sum] = "bed799788bf2bd9ef079d97cd8e09348bf53cb086818578e40773b2b17812922"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
@@ -97,7 +96,6 @@ PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
 X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
 # "x11" requires "opengl"
 PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
-PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=enabled,-Dgallium-xvmc=disabled,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
 PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
diff --git a/meta/recipes-graphics/mesa/mesa_22.2.3.bb b/meta/recipes-graphics/mesa/mesa_22.3.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.2.3.bb
rename to meta/recipes-graphics/mesa/mesa_22.3.3.bb
-- 
2.30.2


