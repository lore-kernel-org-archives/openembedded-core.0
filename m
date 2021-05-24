Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.20562.1621847652165479804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UdpdRF05;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id s6so31020357edu.10
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ke0saKlhiHN906WOrw7jab7gPKnItP/A5zF++yvexNE=;
        b=UdpdRF05t0nY2bSWV1XSieUP+wZeqNbqtvqkZtnhV0tR8YVui6TSzMkLQI6cd6i0Z7
         VvqI0Icfzk0D7TaiUVRs9E0dvcwbAQ9VBV2/ZqHaF/aWuJ9jL4eW4BmLWwr0qndyER+W
         WhkEf9n8vDqSp9DN9uBQPGgjcQhNtcGUoD1TuP6JrHpaIQKtJ7Xfw2VEiSt6v7EsQGdF
         cQIqitO8Unh7/pzNxjzHIV2j1D5LUwpoQ+hPrr3yaWCVHRu0aoYZCduE++LG3+M1pG0m
         m5EDOkC2ZsgVHjHXJ+zrncdLlrecljGkoWcd0jJRF5x2Mz+QoSaDHb8Eht4WmYHNl1NY
         ep8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ke0saKlhiHN906WOrw7jab7gPKnItP/A5zF++yvexNE=;
        b=L8GltbPM95bwhoKwFDXuWRCmupgj04qsYqY4Dfsb8LavhwsT2PpjusWIQPOJNC3Osq
         dwtowJqfPv4oBWqEPriTZk45BArcwy6n5Wika30O0zJ2PmGjIj1I48mSvPcDnpez3dPU
         WrpY8vjiZ4hgnCQe4UcMtaF6IIIVn57y2sN3tjX4WnGSA5tDGZZdXBhwssXpFOj0tatL
         qGcykMGcudovA1QL/ZrdXhQW2TR3GgHBYreW1A/DvKJZxtanaPPwrRorrZ03XSAmjko/
         IIvW1VG4bsjO+1e+qGKR28iNXhNDk622WTBXi4C4t2YDJj8HX83yjft+2O9iYlHDVVAZ
         S61w==
X-Gm-Message-State: AOAM532rvef8S7uxOZKozJ8pFcFzl4I7GXw6hh2dB19USt09y2IMwWgA
	zchxctGQPfzxIVQT6aVnN6w5EX2enUg=
X-Google-Smtp-Source: ABdhPJx1MeLr+fKrFHn8xoToNKeY46qxVYvYpCkWP1n9jkBLYzl3eQ4u8VWtLEDFBakvFV7hrq1f6w==
X-Received: by 2002:a05:6402:5241:: with SMTP id t1mr15511466edd.161.1621847650816;
        Mon, 24 May 2021 02:14:10 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:10 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/21] mesa: update 21.0.3 -> 21.1.1
Date: Mon, 24 May 2021 11:13:37 +0200
Message-Id: <20210524091347.419253-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: typo fix

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...002-meson.build-make-TLS-ELF-optional.patch | 18 +++++++++---------
 .../{mesa-gl_21.0.3.bb => mesa-gl_21.1.1.bb}   |  0
 meta/recipes-graphics/mesa/mesa.inc            |  4 ++--
 .../mesa/{mesa_21.0.3.bb => mesa_21.1.1.bb}    |  1 +
 4 files changed, 12 insertions(+), 11 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.0.3.bb => mesa-gl_21.1.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.0.3.bb => mesa_21.1.1.bb} (99%)

diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
index df2346d336..eac6d4df89 100644
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
@@ -1,4 +1,4 @@
-From 624f430dd0a91344146a2b8d49a69f23560c2fa2 Mon Sep 17 00:00:00 2001
+From d434b9e5d29d614b57c09e164e1d084094bf2150 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:08:31 -0800
 Subject: [PATCH] meson.build: make TLS ELF optional
@@ -30,23 +30,23 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index efc6171..8450968 100644
+index 42f448e..02f6e33 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -448,7 +448,7 @@ endif
- 
- # Android uses emutls for versions <= P/28. For USE_ELF_TLS we need ELF TLS.
+@@ -449,7 +449,7 @@ endif
  use_elf_tls = false
--if not ['windows', 'freebsd', 'openbsd', 'haiku'].contains(host_machine.system()) and (not with_platform_android or get_option('platform-sdk-version') >= 29)
-+if not ['windows', 'freebsd', 'openbsd', 'haiku'].contains(host_machine.system()) and (not with_platform_android or get_option('platform-sdk-version') >= 29) and get_option('elf-tls')
+ if (not ['freebsd', 'openbsd', 'haiku'].contains(host_machine.system()) and
+     (not with_platform_android or get_option('platform-sdk-version') >= 29) and
+-    (not with_platform_windows or not with_shared_glapi))
++    (not with_platform_windows or not with_shared_glapi) and get_option('elf-tls'))
    pre_args += '-DUSE_ELF_TLS'
    use_elf_tls = true
  endif
 diff --git a/meson_options.txt b/meson_options.txt
-index fc73f6e..d7482c0 100644
+index a7030ab..635ec20 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -420,6 +420,12 @@ option(
+@@ -421,6 +421,12 @@ option(
    value : true,
    description : 'Enable direct rendering in GLX and EGL for DRI',
  )
diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.3.bb b/meta/recipes-graphics/mesa/mesa-gl_21.1.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.0.3.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.1.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 4cec1034e4..32cc997c9e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.rst;md5=9aa1bc48c9826ad9fdb16661f6930496"
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=17a4ea65de7a9ab42437f3131e616a7f"
 
 PE = "2"
 
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "565c6f4bd2d5747b919454fc1d439963024fc78ca56fd05158c3b2cde2f6912b"
+SRC_URI[sha256sum] = "eec25ea379054e8911bc5de816aeb50f581b5b708414725003d2f00386b38dd2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.0.3.bb b/meta/recipes-graphics/mesa/mesa_21.1.1.bb
similarity index 99%
rename from meta/recipes-graphics/mesa/mesa_21.0.3.bb
rename to meta/recipes-graphics/mesa/mesa_21.1.1.bb
index 8c584d8e9f..1993d6cbd0 100644
--- a/meta/recipes-graphics/mesa/mesa_21.0.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_21.1.1.bb
@@ -2,3 +2,4 @@ require ${BPN}.inc
 
 DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
+
-- 
2.31.1

