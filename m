Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9594.1629636699464102846
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MI07tkC5;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id k8so21787988wrn.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sWbvwk+ZKanFCG7zfB1+EtfFEtf6UtM4hhYWj25idCA=;
        b=MI07tkC5lFiXb8468PsQPGcNP5YXeGZbuukVFwIY7WOOAAgkOzkSnNf9I3l3XBf1/o
         xz/xYhtr8tP2NOyBl6nJof5ZQB+MNGKhgvUrXj6uSuGDvKloADX2qESufL4J5R6mhdS2
         +H+lx3MXx8loo+dBlq73fZXpT6KbubV+jsEzAdjbHv8Di+exglo9C8kGV24Gv2+chp6V
         rl8HlHpAshUNJ2DASnT2TxSQv95/9CtcHoRS0LqA8vOIAtN16y+LTXbaYp2Gp6+dczzy
         FKGl/A5+KQFL6eO0/QmygcVzq1KtE0vFwvGfuQuMYC3X3Sm/4DXOnjLijKvj06+bk6mY
         YvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sWbvwk+ZKanFCG7zfB1+EtfFEtf6UtM4hhYWj25idCA=;
        b=baiUw9Mwts7oU82gHmt8efOCRmDy1KDzesw1MjQlp5gc327OD7ktRXcq7IrUXvfkb+
         AghgVsWknKDNQde0UxsRd104yj0IJMIoUXVdPOA2nLuHJERrxd61FAQjAhrvoJloHobk
         aMTq2bgeC1KlFqgl36xetgKSAucC//t8ExB8u3oAEc9512yiK14XoOJds5i8yld9idsC
         7vQaG/edQf4YAN80F37Gb/Qi8cD+X2lrXN41TO4zRH6lpaYIyq0nIi6M0gjVq24kOQX6
         cJF2aXGmyZ7Ml4fQPq86hjOcnqcpQbpCItbPI2mvv7/swTu5mtfTflMsKyP60AjTuH9k
         2gAA==
X-Gm-Message-State: AOAM5336m9ljnLXHDJGcmcdpgNO0zYodsNwnv6sYJQstAMhubwayY4cS
	5hwPqvjfyOBr6DFKTw4yyfNMFZ0AujIbbw==
X-Google-Smtp-Source: ABdhPJw9lzTbqZcE9UKGJomIvn2VXO5Dk/RaHLmYwqQt8G0HNIkLjyRskXMAvMRaUsHsRCInIcuy3g==
X-Received: by 2002:a5d:4010:: with SMTP id n16mr8377278wrp.378.1629636698145;
        Sun, 22 Aug 2021 05:51:38 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:37 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 40/55] mesa: upgrade 21.1.5 -> 21.2.1
Date: Sun, 22 Aug 2021 14:50:48 +0200
Message-Id: <20210822125103.310416-40-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0002-meson.build-make-TLS-ELF-optional.patch     | 12 ++++++------
 .../mesa/{mesa-gl_21.1.7.bb => mesa-gl_21.2.1.bb}    |  0
 meta/recipes-graphics/mesa/mesa.inc                  |  2 +-
 .../mesa/{mesa_21.1.7.bb => mesa_21.2.1.bb}          |  1 +
 4 files changed, 8 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.1.7.bb => mesa-gl_21.2.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.1.7.bb => mesa_21.2.1.bb} (99%)

diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
index eac6d4df89..35ab8d5a72 100644
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
@@ -1,4 +1,4 @@
-From d434b9e5d29d614b57c09e164e1d084094bf2150 Mon Sep 17 00:00:00 2001
+From 8f2f48b41aa17eec3c4d63685e3296f28e60b980 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:08:31 -0800
 Subject: [PATCH] meson.build: make TLS ELF optional
@@ -30,10 +30,10 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 42f448e..02f6e33 100644
+index 23618c1..c8cc5e3 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -449,7 +449,7 @@ endif
+@@ -476,7 +476,7 @@ endif
  use_elf_tls = false
  if (not ['freebsd', 'openbsd', 'haiku'].contains(host_machine.system()) and
      (not with_platform_android or get_option('platform-sdk-version') >= 29) and
@@ -41,12 +41,12 @@ index 42f448e..02f6e33 100644
 +    (not with_platform_windows or not with_shared_glapi) and get_option('elf-tls'))
    pre_args += '-DUSE_ELF_TLS'
    use_elf_tls = true
- endif
+ 
 diff --git a/meson_options.txt b/meson_options.txt
-index a7030ab..635ec20 100644
+index 29c402c..f70d9b2 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -421,6 +421,12 @@ option(
+@@ -455,6 +455,12 @@ option(
    value : true,
    description : 'Enable direct rendering in GLX and EGL for DRI',
  )
diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.1.7.bb b/meta/recipes-graphics/mesa/mesa-gl_21.2.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.1.7.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.2.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 145d08487c..2fb823dfb8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "e9e67c10654f2e4bf15b944bb048007a614292aa4792b1b7512eb700b7b3a7bb"
+SRC_URI[sha256sum] = "2c65e6710b419b67456a48beefd0be827b32db416772e0e363d5f7d54dc01787"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.1.7.bb b/meta/recipes-graphics/mesa/mesa_21.2.1.bb
similarity index 99%
rename from meta/recipes-graphics/mesa/mesa_21.1.7.bb
rename to meta/recipes-graphics/mesa/mesa_21.2.1.bb
index 951fe8333b..4cb7e80eb5 100644
--- a/meta/recipes-graphics/mesa/mesa_21.1.7.bb
+++ b/meta/recipes-graphics/mesa/mesa_21.2.1.bb
@@ -2,3 +2,4 @@ require ${BPN}.inc
 DRIDRIVERS ??= ""
 DRIDRIVERS:append:x86:class-target = ",r100,r200,nouveau,i965"
 DRIDRIVERS:append:x86-64:class-target = ",r100,r200,nouveau,i965"
+
-- 
2.31.1

