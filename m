Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645F7C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 05:47:28 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.883.1753768039601031664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 22:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AcakWk/s;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-31f325c1bc1so240585a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 22:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753768039; x=1754372839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CA80+FH8dxFuQonlucvjoJA9C61Zk5etYIr7I6Y2zzk=;
        b=AcakWk/swbeLo7+rkUOne8xvhEF6/REvW7QDUk6FmCn+VdmHHAiP9SAaQaLOg+bGgB
         DWCDsJumZ/LEPMGQBwD+g21P+pWF1CnVbaQ8VkwpBYZ8zcaWF573GB8O2ZNBNmqkWTgq
         8CMznw8v/4uWxFm7RsT+HQqL/R64bXOgLOAcL1fONCvdJeswNoVdMB5fv+xCui5cQLhx
         S5u2fMI6v0lHCaCdAaI0WSY+QoLMcYry/j3XxsvafHoHwiW70Mf3pWtGPQGWt9mFrKYz
         LzErYW0nPfJO96oIWG8AM8ES+6ecQqHG5I9QD+eNwXjagsnlaX5CFlvYMEIBE1HdqG76
         JQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753768039; x=1754372839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CA80+FH8dxFuQonlucvjoJA9C61Zk5etYIr7I6Y2zzk=;
        b=Dy6x/Xltife0daMqNhYWzmQcseM0JCG47JSy4Hta8I9tzUYVMQy/0Xt9KLnGS+0nSw
         eeTe8K/hN2+/ZVVblb6P/eXAsqUJ3yIH7vbmYI7Qr+hCLkALTcOnnxj8j9mNORT+c3Cq
         fwF6/hAju9zHSyZ0nALlKnrO/MsFe9g82T6URkWFmOMRTqGyxILagsAIQZ+9WoRZVqYO
         Qk4c06Uix8QWUXvEGAzCbMyKt3tiYbKEdG2PyPAGYNn55d5qDvfCNKRi0XdBiGja3Jh2
         owOU9MdKBFuNZGuN0gucjFHHBg53msAG+u8obIV9Gu/LSgp6bKp8QW+NHDtu7d2X/gN8
         no2A==
X-Gm-Message-State: AOJu0Yw9z01kEizdxs0mgA3g2GnCw+7JEmZMNDH9Eu0Gp1czHNL7vmtN
	GgLhxX1ZUA5tYjc6isfuZrpCN1V0J0OvUFtPY5KqRU74CI0xaYnyJS5xmWccEpvAPL8=
X-Gm-Gg: ASbGncsNYyHKZI30ZYrUC7x82EOVolnbDWNsV4tJ0Ze//66IUGlnlRNbo1p9OnJ/Jmm
	kYjvdw1Ymmdw9Hb8NRyYslsfQFYrZaPTAffD0JCHq+oeEOaiAbbZOcBpY0oXTyyjrOfwUoE2jce
	wIyje5LhDhv+jWLKh7G2Ra79ys0uuC12dqs2O9ZgOzMVHWgQUpHlollNHEfqo+tTX9oqFPwPnbp
	t0Jbfarc9i9/HPDorsnBYqsLrUlc70D9q95fRd8odX15R1VVHIGrss9bET/3E6SDf/c8Wx0nHy+
	Xzdp+6R1ddbDAlHtF6xMbYe4ll/SoUQETmmAFmd746Bf/qvh87j/QVFcs9r8MzppU/hyLjzEjat
	Pctbvw0qc8bhYig==
X-Google-Smtp-Source: AGHT+IFit0+u61cXyQ1mNhaU8KzZoOkdyMZSIfJqk9CCYN11ovSCbLWoHzmVjeSZuxw+YwGrL7gRrA==
X-Received: by 2002:a17:90b:3807:b0:312:1c83:58e7 with SMTP id 98e67ed59e1d1-31e77868e3dmr17036032a91.1.1753768038547;
        Mon, 28 Jul 2025 22:47:18 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f3097a5dcsm866182a91.4.2025.07.28.22.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 22:47:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc: Fix libsanitizers build with glibc 2.42
Date: Mon, 28 Jul 2025 22:47:15 -0700
Message-ID: <20250729054715.2147249-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 05:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221030

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-15.1.inc        |  1 +
 ...bsanitizer-Fix-build-with-glibc-2.42.patch | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-libsanitizer-Fix-build-with-glibc-2.42.patch

diff --git a/meta/recipes-devtools/gcc/gcc-15.1.inc b/meta/recipes-devtools/gcc/gcc-15.1.inc
index 7d86cda601d..3a5ba023ad6 100644
--- a/meta/recipes-devtools/gcc/gcc-15.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.1.inc
@@ -73,6 +73,7 @@ SRC_URI = "${BASEURI} \
            file://0026-arm-fully-validate-mem_noofs_operand-PR120351.patch \
            file://0026-fix-incorrect-preprocessor-line-numbers.patch \
            file://0027-aarch64-Fix-fma-steering-when-rename-fails-PR120119.patch \
+           file://0028-libsanitizer-Fix-build-with-glibc-2.42.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0028-libsanitizer-Fix-build-with-glibc-2.42.patch b/meta/recipes-devtools/gcc/gcc/0028-libsanitizer-Fix-build-with-glibc-2.42.patch
new file mode 100644
index 00000000000..58b186ee372
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0028-libsanitizer-Fix-build-with-glibc-2.42.patch
@@ -0,0 +1,77 @@
+From d32ece49d32b00448d967e7dbc6900fb25cbc775 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 2 May 2025 17:41:43 +0200
+Subject: [PATCH] libsanitizer: Fix build with glibc 2.42
+
+The termio structure will be removed from glibc 2.42.  It has
+been deprecated since the late 80s/early 90s.
+
+Cherry-picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763
+("[sanitizer_common] Remove interceptors for deprecated struct termio
+(#137403)").
+
+Co-Authored-By: Tom Stellard <tstellar@redhat.com>
+
+libsanitizer/
+
+	* sanitizer_common/sanitizer_common_interceptors_ioctl.inc: Cherry
+	picked from LLVM commit 59978b21ad9c65276ee8e14f26759691b8a65763.
+	* sanitizer_common/sanitizer_platform_limits_posix.cpp: Likewise.
+	* sanitizer_common/sanitizer_platform_limits_posix.h: Likewise.
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=d32ece49d32b00448d967e7dbc6900fb25cbc775]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../sanitizer_common_interceptors_ioctl.inc               | 8 --------
+ .../sanitizer_common/sanitizer_platform_limits_posix.cpp  | 3 ---
+ .../sanitizer_common/sanitizer_platform_limits_posix.h    | 1 -
+ 3 files changed, 12 deletions(-)
+
+diff --git a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+index 49ec4097c90..dda11daa77f 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
++++ b/libsanitizer/sanitizer_common/sanitizer_common_interceptors_ioctl.inc
+@@ -338,17 +338,9 @@ static void ioctl_table_fill() {
+   _(SOUND_PCM_WRITE_CHANNELS, WRITE, sizeof(int));
+   _(SOUND_PCM_WRITE_FILTER, WRITE, sizeof(int));
+   _(TCFLSH, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCGETA, WRITE, struct_termio_sz);
+-#endif
+   _(TCGETS, WRITE, struct_termios_sz);
+   _(TCSBRK, NONE, 0);
+   _(TCSBRKP, NONE, 0);
+-#if SANITIZER_GLIBC
+-  _(TCSETA, READ, struct_termio_sz);
+-  _(TCSETAF, READ, struct_termio_sz);
+-  _(TCSETAW, READ, struct_termio_sz);
+-#endif
+   _(TCSETS, READ, struct_termios_sz);
+   _(TCSETSF, READ, struct_termios_sz);
+   _(TCSETSW, READ, struct_termios_sz);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+index c87d5ef42c9..7bbc6f2edac 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
+@@ -485,9 +485,6 @@ unsigned struct_ElfW_Phdr_sz = sizeof(Elf_Phdr);
+   unsigned struct_input_id_sz = sizeof(struct input_id);
+   unsigned struct_mtpos_sz = sizeof(struct mtpos);
+   unsigned struct_rtentry_sz = sizeof(struct rtentry);
+-#if SANITIZER_GLIBC || SANITIZER_ANDROID
+-  unsigned struct_termio_sz = sizeof(struct termio);
+-#endif
+   unsigned struct_vt_consize_sz = sizeof(struct vt_consize);
+   unsigned struct_vt_sizes_sz = sizeof(struct vt_sizes);
+   unsigned struct_vt_stat_sz = sizeof(struct vt_stat);
+diff --git a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+index c07f7cd0b0d..a80df656826 100644
+--- a/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -1029,7 +1029,6 @@ extern unsigned struct_hd_geometry_sz;
+ extern unsigned struct_input_absinfo_sz;
+ extern unsigned struct_input_id_sz;
+ extern unsigned struct_mtpos_sz;
+-extern unsigned struct_termio_sz;
+ extern unsigned struct_vt_consize_sz;
+ extern unsigned struct_vt_sizes_sz;
+ extern unsigned struct_vt_stat_sz;

