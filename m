Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5573FC25B79
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:26:57 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.11209.1715858814234064250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AnBnZz2B;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a59b178b75bso242125366b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858812; x=1716463612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=viX360TOiuxY+EA+qKBqei5Gvfx+NWkk1FRaOKjGAq0=;
        b=AnBnZz2B/H6VnGAa1AqUvcnNcHSU7KKTbBMRyorJTUMMiRLhQZFe1T+MzseZkGWNEe
         5CLzzLM66VQnXnmnR6eb3bLMSdjxvviH3OfPg0y6EKhUTpUb3E2x9RHcjBScVHwcZe93
         s1rRS2mYh5Nk7HSj8wor/iX2k/w17wFq1KADH2ihVD45v04+70I2NQWIa9jlcKCaCJYU
         Jhzn/0aPkf/vwU38q4y4aFdW8TSYfIb9GOHafutD8kF+r+CuIq/qltx1fWDrMCv+gXPd
         3tHCwFg5Q0kKF1RwWG1FjgMzoMerhBtYUEuohDrmRhi36Cs1nnwP50Em/KyL5FR0hxn+
         O+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858812; x=1716463612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viX360TOiuxY+EA+qKBqei5Gvfx+NWkk1FRaOKjGAq0=;
        b=tqOS3iryb0sWp1Qceaa15JNxfVwsMTiFK4U/VVj6tjcr4hXDCFU56QQxgsKxJ2F+u8
         QfpU5/l7Kdcpybi516eiT6NXBGrn7gOQJ2gYnq2k08JFTx/xR4P7nqMpIRmAV6Da+JJJ
         TfhgQJMSch9cHIZ3X5bXZKd+t/8fjhQ50RfW/DPlKsoGaN8DDth2fG4uyM4Ykxkqz5KD
         ASYP3NTgA8k2zviGw8H8BRCgUW3HPErFCAyDQakPW8nxtaGjhGs37P5mm2xaZnuTsKSh
         9KLlsUmKaUJJniqpHH4onaNvVCm6LYPD1VvLg2DRhVnYD4CS5UGVl5lHIz9/KKOqb3TP
         F59Q==
X-Gm-Message-State: AOJu0Yxim23ii9VJ76B8DS5TDMKW9cxc/PYKBzyZ7aRwnhk7OPStS1Yf
	b321s7faT7FCbDd79SRxnSGkZNCvBu/bq5TkeMsWJ71DRS2rex4IzfIVkQ==
X-Google-Smtp-Source: AGHT+IGL2+bBgAxAblbE8kSbBw9MfpDksGTPVTrcr87hf892sT66F6fSsdC9QDY4sK5ot76iFA7l2A==
X-Received: by 2002:a17:906:17d9:b0:a59:efd3:9d with SMTP id a640c23a62f3a-a5a2d673060mr1386464666b.58.1715858812307;
        Thu, 16 May 2024 04:26:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b18110sm973898366b.225.2024.05.16.04.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:26:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/13] mesa: remove obsolete 0001-meson.build-check-for-all-linux-host_os-combinations.patch
Date: Thu, 16 May 2024 13:26:28 +0200
Message-Id: <20240516112640.2145789-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199468

From: Alexander Kanavin <alex@linutronix.de>

The patch was submitted upstream
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28895
but further investigation revealed that the problem had been solved properly
in meson.class:
https://git.yoctoproject.org/poky/commit/?id=6bf674374d568b2419a4c6eef00d893028878881

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...k-for-all-linux-host_os-combinations.patch | 42 -------------------
 meta/recipes-graphics/mesa/mesa.inc           |  1 -
 2 files changed, 43 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
deleted file mode 100644
index 7be7d81eeb7..00000000000
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From e8ec6b1cc5e401ba719095722d8b317d755ae613 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair@alistair23.me>
-Date: Thu, 14 Nov 2019 13:04:49 -0800
-Subject: [PATCH] meson.build: check for all linux host_os combinations
-
-Make sure that we are also looking for our host_os combinations like
-linux-musl etc. when assuming support for DRM/KMS.
-
-Also delete a duplicate line.
-
-Upstream-Status: Pending
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-Signed-off-by: Alistair Francis <alistair@alistair23.me>
----
- meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 133fd9a..817861e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -128,7 +128,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
- # Only build shared_glapi if at least one OpenGL API is enabled
- with_shared_glapi = with_shared_glapi and with_any_opengl
- 
--system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android', 'managarm'].contains(host_machine.system())
-+system_has_kms_drm = ['openbsd', 'netbsd', 'freebsd', 'gnu/kfreebsd', 'dragonfly', 'linux', 'sunos', 'android', 'managarm'].contains(host_machine.system()) or host_machine.system().startswith('linux')
- 
- gallium_drivers = get_option('gallium-drivers')
- if gallium_drivers.contains('auto')
-@@ -997,7 +997,7 @@ if cc.has_function('fmemopen')
- endif
- 
- # TODO: this is very incomplete
--if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'android', 'managarm'].contains(host_machine.system())
-+if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku', 'android', 'managarm'].contains(host_machine.system()) or host_machine.system().startswith('linux')
-   pre_args += '-D_GNU_SOURCE'
- elif host_machine.system() == 'sunos'
-   pre_args += '-D__EXTENSIONS__'
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 77e9c80fcb6..a8f3397e04a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM = "file://docs/license.rst;md5=63779ec98d78d823a9dc533a0735ef10
 PE = "2"
 
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
-           file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-drisw-fix-build-without-dri3.patch \
            file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
-- 
2.39.2


