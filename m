Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AE9C3DA42
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.15292.1720960779725241310
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TpGtlg97;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fb3cf78fbdso20275545ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960779; x=1721565579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQyz4nXWXhBeAy+M3WoA50oQnlwgDr+wtyJl1kpwCkI=;
        b=TpGtlg97cfIeJPEFuKUbSfvGg/N3ze+PIUWfBYLkkrCpfdcWnDKH7aJSKKvWKIBxN/
         GmVg/Ms8IKO130xtydBOv48ZnYqWjc5F7Y84oWscXWwWlTKVDEPnnHDo7LId07l8zxYb
         mrYOgBsrWPGArrMI805i+hC/H1QbpMpUl5yrkVh2bore+28pTgjhMhdzQOnn21Wl32p4
         X+/7dduZDb1a5PKAMuJnKbw9/etP2xyyLizI3bZcfuFZWGpVzQ1vX8vKYYJN8a3LaMg0
         sSjWyjBX8o5ZkPzSBAuCyKaddZGKJq2kPnmAtATcpQCL0u9l0FpNvgCLI2fk5Ckh4CwV
         VtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960779; x=1721565579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQyz4nXWXhBeAy+M3WoA50oQnlwgDr+wtyJl1kpwCkI=;
        b=aCfG6R065msUI9b4qer7DHNVE2va1E6HY6kCXMC9U3O+ZmX6VWl+cHYc7ljDOccLC6
         9P8hEj9Mbsl5W+VAiXesOeX20yps7pTXqo0J09zeQjfJzxPRTsNVdxmXv7+64di9iljQ
         YhxqmMqSAN0eleU3QwbOQSdvuq9g3yLDKprKpX+eXYCWoptVk1s0OhoYy8Ugc+sFxaCK
         70WqXJmcoNtY/PUlOzHSdEf7pYw2FZ9rP7cZPWslRn0pGcTmI0MMYwZ7HAGhThQlYtnk
         A3XNuIQ2BGMMvtwAf90sAP+CrMYahLhpD5DrAsGSp1HBQzc0w0OS0qM8WAGjBPCXXAW6
         koQA==
X-Gm-Message-State: AOJu0Yw9YoIaw5XVA7sYPbxQTD/Wedm1Ug+7RTvY8BxbcE/vAXarktBJ
	rJ++NugyQI4yAFDVFLEfkEbF2jTDkIOMXI4pnVtV2yRjzJpAiOzY8vKddJAieLAzIZ0szpAkeHh
	5/BU=
X-Google-Smtp-Source: AGHT+IFnnl/v2qKEZwxnEN/pcSMq1iFmTK4S51Kx9xq3KtkDit93Ab1UUX+G3OkJR+CnD3VzcqbuwQ==
X-Received: by 2002:a17:902:d54e:b0:1fb:72b4:8775 with SMTP id d9443c01a7336-1fbb6d24f87mr142920825ad.40.1720960778866;
        Sun, 14 Jul 2024 05:39:38 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/27] mesa: remove obsolete 0001-meson.build-check-for-all-linux-host_os-combinations.patch
Date: Sun, 14 Jul 2024 05:38:47 -0700
Message-Id: <5dabb17313ed5e4e143708f0c7703cac663e9647.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201877

From: Alexander Kanavin <alex@linutronix.de>

The patch was submitted upstream
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28895
but further investigation revealed that the problem had been solved properly
in meson.class:
https://git.yoctoproject.org/poky/commit/?id=6bf674374d568b2419a4c6eef00d893028878881

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 020345d63f0ffd3ed2b046bbb5e09b5359b24dd6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...k-for-all-linux-host_os-combinations.patch | 42 -------------------
 meta/recipes-graphics/mesa/mesa.inc           |  1 -
 2 files changed, 43 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
deleted file mode 100644
index 7be7d81eeb..0000000000
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
index 77e9c80fcb..a8f3397e04 100644
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
2.34.1


