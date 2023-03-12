Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96166C6FD19
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 14:51:03 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.67844.1678632662964584416
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DaozUYtX;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id j11so39032919edq.4
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 07:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678632661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SeX4rnhhPh2Y7i0vEwzB8hdrZSsqXlMnNRs3OCGjRs=;
        b=DaozUYtX74puCzVB2ULWWBh+qmWa+I+e5gbrT4amPRM4RLHy8wMCHCFyjW2Ili0XDW
         /4clcXMGEG2KjyALaAAHi8Upc6s2CwMTeO7WAH4aXNWnm3Is9Rvnggi4YOV2pZal+oC+
         qKhH0KMBQJsMZi88d3+Wp90l8QCxlsyWCG/H5rGLK/MMqZaQHX+xF9qglQJ30Te4YMG2
         eXCc2I0PHbIwl1kA57poviVurSn61YgJ8lgaEzrMlz76cXoRc+jYM2lNt60ATy4D8mHF
         jTEoTptbININj8Rc+67rUv0VtRlYSYyie9HSEZ6q6ZxpH2McEwB8dLHYKtoNsBSvUqFG
         9AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678632661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SeX4rnhhPh2Y7i0vEwzB8hdrZSsqXlMnNRs3OCGjRs=;
        b=ld9ZTMjkVuH2vmNRVum3rE3sZpUwyBqulVX5hHDTQObDb4txP3NGkGqr752cDtQXkB
         Wdx5cN3MjoDdc0sg6GywO+0u71tygdQGhik1cZcITlV9n0XUlmaqDx5I+v21K2BLDfvn
         DNzJv6w7Rlen6D8L0Lkt1kPoFItfMB6SoBU8l1rkVoIZMKXhtlAwAhL2TTvbFjQnNoiK
         mfLdpLW1E+AqajCf2sHGIp6EAcLEnETUTZOhMoAlxbWs6dWsSk7E12TOH6cAXGOnZK8k
         pXxQLMPJAFUcVFxa+Wv2z9tCPmjq26PGcdVO17uXJkqy33RZXZZDvznf5ProQmsqVFpt
         Yq2Q==
X-Gm-Message-State: AO0yUKUJZ0LyXwklHU7Dubtz1+TrSoGf73Ai+G5fBaql3uxsaZznZvMc
	oagi+rh0Qq0mkDHBcFewSbfymM1XZhE=
X-Google-Smtp-Source: AK7set8NqfbDF+riwZXIx36ZXClnp7reZ3ccBTooW3r74xF4vAIuBz7tkS06sAp3yLxFNud+ErpDjA==
X-Received: by 2002:a05:6402:2052:b0:4bf:d8d9:4b0e with SMTP id bc18-20020a056402205200b004bfd8d94b0emr28427702edb.22.1678632661279;
        Sun, 12 Mar 2023 07:51:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l22-20020a50d6d6000000b004fa19f5ba99sm2012255edj.79.2023.03.12.07.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 07:51:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/7] mesa: update 22.3.5 -> 23.0.0
Date: Sun, 12 Mar 2023 15:50:53 +0100
Message-Id: <20230312145053.1427377-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230312145053.1427377-1-alex@linutronix.de>
References: <20230312145053.1427377-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 14:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178398

Drop patches:
0001-gbm-backend-fix-gbm-compile-without-dri.patch
0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
(backports)

0001-util-format-Check-for-NEON-before-using-it.patch
(upstream submission has stalled with unanswered concerns from upstream;
patch no longer applies; issue does not reproduce with 'raspberrypi0-wifi' MACHINE)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e-unsigned-instead-of-uint-to-fix-mu.patch | 44 -------------
 ...-backend-fix-gbm-compile-without-dri.patch | 65 -------------------
 ...ormat-Check-for-NEON-before-using-it.patch | 47 --------------
 .../{mesa-gl_22.3.5.bb => mesa-gl_23.0.0.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  5 +-
 .../mesa/{mesa_22.3.5.bb => mesa_23.0.0.bb}   |  0
 6 files changed, 1 insertion(+), 160 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without-dri.patch
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_22.3.5.bb => mesa-gl_23.0.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.3.5.bb => mesa_23.0.0.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
deleted file mode 100644
index 3ab22889bf..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 8a5de0b6cf1090d7f29f3974ec79c32776cf2745 Mon Sep 17 00:00:00 2001
-From: Jami Kettunen <jami.kettunen@protonmail.com>
-Date: Tue, 31 Aug 2021 00:15:58 +0300
-Subject: [PATCH] freedreno/pm4: Use unsigned instead of uint to fix musl build
-
-Upstream-Status: Backport
-
-Fixes the following error I noticed when building against aarch64 with
-musl libc:
-
-  In file included from ../src/freedreno/decode/crashdec.h:38,
-                   from ../src/freedreno/decode/crashdec.c:40:
-  ../src/freedreno/common/freedreno_pm4.h:104:15: error: unknown type name 'uint'
-    104 | static inline uint
-        |               ^~~~
-  ../src/freedreno/common/freedreno_pm4.h:105:25: error: unknown type name 'uint'; did you mean 'int'?
-    105 | pm4_calc_odd_parity_bit(uint val)
-        |                         ^~~~
-        |                         int
-
-Signed-off-by: Jami Kettunen <jami.kettunen@protonmail.com>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/19665>
----
- src/freedreno/common/freedreno_pm4.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/freedreno/common/freedreno_pm4.h b/src/freedreno/common/freedreno_pm4.h
-index 8f958953d693..091247e709a0 100644
---- a/src/freedreno/common/freedreno_pm4.h
-+++ b/src/freedreno/common/freedreno_pm4.h
-@@ -105,8 +105,8 @@ pm4_pkt7_hdr(uint8_t opcode, uint16_t cnt)
- #define cp_type3_opcode(pkt) (((pkt) >> 8) & 0xFF)
- #define type3_pkt_size(pkt)  ((((pkt) >> 16) & 0x3FFF) + 1)
- 
--static inline uint
--pm4_calc_odd_parity_bit(uint val)
-+static inline unsigned
-+pm4_calc_odd_parity_bit(unsigned val)
- {
-    return (0x9669 >> (0xf & ((val) ^ ((val) >> 4) ^ ((val) >> 8) ^
-                              ((val) >> 12) ^ ((val) >> 16) ^ ((val) >> 20) ^
--- 
-2.39.2
-
diff --git a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without-dri.patch b/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without-dri.patch
deleted file mode 100644
index 6541671b7a..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-gbm-backend-fix-gbm-compile-without-dri.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 25946100e21cf2095bea334e8d7096798561d0b7 Mon Sep 17 00:00:00 2001
-From: Vincent Davis Jr <vince@underview.tech>
-Date: Wed, 28 Dec 2022 16:28:01 -0600
-Subject: [PATCH] gbm/backend: fix gbm compile without dri
-
-Upstream-Status: Backport
-
-https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20447
-https://gitlab.freedesktop.org/mesa/mesa/-/commit/842ca284650f066e58706741a7d22d67b5088e60
-
-At mesa version 22.2.3 patch wasn't introduced until after.
-
-Commit introduces a fix that allows for gbm to be built with an empty
-backend. There are situation especially in a Yocto/OE cross compilation
-environment where you want to build with an empty backend. The particular
-situation is as such:
-
-The mesa-gl recipe is the preferred provider for virtual/libgbm, virtual/libgl,
-virtual/mesa, etc... But the x11 DISTRO_FEATURE in't included this leads to build
-errors such as:
-
-| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o: in function `find_backend':
-| backend.c:(.text.find_backend+0xa4): undefined reference to `gbm_dri_backend'
-| /../../../ld: src/gbm/libgbm.so.1.0.0.p/main_backend.c.o:(.data.rel.ro.builtin_backends+0x4):
-                undefined reference to `gbm_dri_backend'
-| collect2: error: ld returned 1 exit status
-
-Issue should be replicable by setting -Ddri3=disabled and -Dgbm=enabled
-
-Add fix to bypasses compilation issue by excluding gbm dri backend. If
-HAVE_DRI || HAVE_DRIX not specified.
-
-Acked-by: David Heidelberg <david.heidelberg@collabora.com>
-Signed-off-by: Vincent Davis Jr <vince@underview.tech>
----
- src/gbm/main/backend.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/gbm/main/backend.c b/src/gbm/main/backend.c
-index 974d0a76a4e..feee0703495 100644
---- a/src/gbm/main/backend.c
-+++ b/src/gbm/main/backend.c
-@@ -42,7 +42,9 @@
- #define ARRAY_SIZE(a) (sizeof(a)/sizeof((a)[0]))
- #define VER_MIN(a, b) ((a) < (b) ? (a) : (b))
- 
-+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
- extern const struct gbm_backend gbm_dri_backend;
-+#endif
- 
- struct gbm_backend_desc {
-    const char *name;
-@@ -51,7 +53,9 @@ struct gbm_backend_desc {
- };
- 
- static const struct gbm_backend_desc builtin_backends[] = {
-+#if defined(HAVE_DRI) || defined(HAVE_DRI2) || defined(HAVE_DRI3)
-    { "dri", &gbm_dri_backend },
-+#endif
- };
- 
- #define BACKEND_LIB_SUFFIX "_gbm"
--- 
-2.34.1
-
diff --git a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch b/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
deleted file mode 100644
index d22ff3c8a8..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-util-format-Check-for-NEON-before-using-it.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From f17e836ef9b1bbc6056790596420b699e48128c2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 2 Dec 2021 19:57:42 -0800
-Subject: [PATCH] util/format: Check for NEON before using it
-
-This fixes build on rpi0-w and any other machine which does not have
-neon unit and is not used as FPU unit
-
-Fixes errors e.g.
-
-In file included from ../mesa-21.3.0/src/util/format/u_format_unpack_neon.c:35:
-/mnt/b/yoe/master/build/tmp/work/arm1176jzfshf-vfp-yoe-linux-gnueabi/mesa/2_21.3.0-r0/recipe-sysroot-native/usr/lib/clang/13.0.1/include/arm_neon.h:32:2: error: "NEON support not enabled"
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14032]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/util/format/u_format.c             | 2 +-
- src/util/format/u_format_unpack_neon.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
-index c071250..0880984 100644
---- a/src/util/format/u_format.c
-+++ b/src/util/format/u_format.c
-@@ -1184,7 +1184,7 @@ static void
- util_format_unpack_table_init(void)
- {
-    for (enum pipe_format format = PIPE_FORMAT_NONE; format < PIPE_FORMAT_COUNT; format++) {
--#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
-+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
-       const struct util_format_unpack_description *unpack = util_format_unpack_description_neon(format);
-       if (unpack) {
-          util_format_unpack_table[format] = unpack;
-diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format/u_format_unpack_neon.c
-index a4a5cb1..1e4f794 100644
---- a/src/util/format/u_format_unpack_neon.c
-+++ b/src/util/format/u_format_unpack_neon.c
-@@ -23,7 +23,7 @@
- 
- #include <u_format.h>
- 
--#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
-+#if (defined(PIPE_ARCH_AARCH64) || (defined(__ARM_NEON) && defined(PIPE_ARCH_ARM))) && !defined(NO_FORMAT_ASM)
- 
- /* armhf builds default to vfp, not neon, and refuses to compile neon intrinsics
-  * unless you tell it "no really".
diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb b/meta/recipes-graphics/mesa/mesa-gl_23.0.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.3.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.0.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 370b54ca6b..09a35ef33e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,12 +17,9 @@ PE = "2"
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-           file://0001-util-format-Check-for-NEON-before-using-it.patch \
-           file://0001-gbm-backend-fix-gbm-compile-without-dri.patch \
-           file://0001-freedreno-pm4-Use-unsigned-instead-of-uint-to-fix-mu.patch \
            "
 
-SRC_URI[sha256sum] = "3eed2ecae2bc674494566faab9fcc9beb21cd804c7ba2b59a1694f3d7236e6a9"
+SRC_URI[sha256sum] = "01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae904fe918707d253e4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.3.5.bb b/meta/recipes-graphics/mesa/mesa_23.0.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.3.5.bb
rename to meta/recipes-graphics/mesa/mesa_23.0.0.bb
-- 
2.30.2


