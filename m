Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC24C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 14:24:27 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.88486.1749565463751918650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 07:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j2tydrT4;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: zboszor@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3ddd2710d14so35360165ab.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 07:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749565462; x=1750170262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jIF3aw4ezwojWt8Oey5eIJFljwgNJOpMdwfeAveC/j8=;
        b=j2tydrT4TGz9ZMFF1emjKm0Ra+UHc83ikyGrFdGhywIqeXNlDWqnljQTdGlN6/BASf
         2pcc/qIUjm7bwcGbwiPIkG66mcBpeoCy8+c5DQU5lurybQ91hE42/QtjWDC5k5JGI6f4
         XqOJy0LlHLUtIbj2l64tCCwla/bZI7cZP1/STeG8OxxfDgAwoiOJZo4F0WRVyokrzgR2
         0HCZW0FF63ycaEZ9h1lIX7qD+BlYHgbUK3aD+tashh/RP9QQBel+Aki4dR8FNiiKx+c9
         pSX8Tp1M/HGlvHqj7yhHDFEYq4+33vsfTEh/oMiGg1FuAKwyCllNbInd15nQ3zfqlI80
         RtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749565462; x=1750170262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIF3aw4ezwojWt8Oey5eIJFljwgNJOpMdwfeAveC/j8=;
        b=J+JdiP0YIolQ36tgmnWKWts5ArkqKN71GnyZ/1X5iAtK4/318YIx4ydtr2grf+gcsC
         biEO5a41SfkWNt/Fv3UeeT9duY3SbGkEB76VeF5btC1eIYMo1dxLllRpaQx+6mXH5YfK
         o1+f4oVLHHhSsdzyREW54Fe4+Q+Tb+nsuP2BMqVGbm3A+qgKl8wq4YWqTvT+A7iu286P
         eKSbczcsbplvTApQSOqGty246cxFKKXkIoq3utAntLGXWHMgxR7dUgJZM55fMsZE3Skx
         mOAELoF38d7FoWjfw33aEOR39YnSEhxRoQLRYiEacZWQhonU1vk83jQqCZLWFHpqu3Fk
         icFw==
X-Gm-Message-State: AOJu0YxEugMlCqXKJ3DRZe5neJtUGRIo99x0WmBasmuBvXJe8BhJkUeQ
	AtCW4ZjE53/9z/mVwInU192XEXHlTSHgvOoaxi9Na1rkgNgZTkxnGhiXmLHkBQ==
X-Gm-Gg: ASbGncvsTGCMr4SbVIBeB3yNHNWn+AYOQCps4XmxOWD5MGf06bTREE4NuLuKWZN61cb
	xs4xA8jYam1adJVBQh+oXs0e9YF6CY3ICWEPQNs410BysiJHJf+QQ41OS/XL5WD9si8pRX2v9Ea
	SUmoaQYV05VoZRbcA64q5thfYP3kqoAV9Vxmye6s54zIPgxjJk7zRDyyh13ZugGt9gntK9WoOF8
	Rgj1U+/rE71lRavfF+a3SxuWITwb+y0G9GgQc64sg61GpEsIPxCJHQAHsTDVoFfUQVfyZw+wItO
	Cc+bhuzYzKfy0U6SttDBBDpIW0gm+1osyh3QWcsbd7yTDBi0PisnNI9yrrvA/D0qcH4eohhKeZY
	suqg3kjXRhkRx8KWm
X-Google-Smtp-Source: AGHT+IHX5HaMkN/6fVBjFX7iPqzlQswz0KAeysFl40a/xXZUkBrlukq+Jyyc6oxarvlBsu6O5L3BpQ==
X-Received: by 2002:a05:6e02:1a64:b0:3dc:8b57:b750 with SMTP id e9e14a558f8ab-3ddce47d5f7mr186899885ab.17.1749565459138;
        Tue, 10 Jun 2025 07:24:19 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-500df587eb4sm2360517173.79.2025.06.10.07.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:24:18 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] mesa: Fix bindgen includes
Date: Tue, 10 Jun 2025 16:24:13 +0200
Message-ID: <20250610142413.681911-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 14:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218354

Add a patch to fix bindgen errors due to not finding headers
in the system, like:

|...
| ../mesa-25.1.2/src/gallium/frontends/rusticl/rusticl_llvm_bindings.hpp:1:10: fatal error: 'clang/Basic/Version.h' file not found
| Unable to generate bindings: clang diagnosed error: ../mesa-25.1.2/src/gallium/frontends/rusticl/rusticl_llvm_bindings.hpp:1:10: fatal error: 'clang/Basic/Version.h' file not found
|...
| .../work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/include/./GL/glx.h:30:10: fatal error: 'X11/Xlib.h' file not found
| Unable to generate bindings: clang diagnosed error: /data2/dtd-yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/include/./GL/glx.h:30:10: fatal error: 'X11/Xlib.h' file not found

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...w-build-option-for-extra-bindgen-inc.patch | 57 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  3 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-rusticl-Add-a-new-build-option-for-extra-bindgen-inc.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-rusticl-Add-a-new-build-option-for-extra-bindgen-inc.patch b/meta/recipes-graphics/mesa/files/0001-rusticl-Add-a-new-build-option-for-extra-bindgen-inc.patch
new file mode 100644
index 0000000000..913357c5dc
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-rusticl-Add-a-new-build-option-for-extra-bindgen-inc.patch
@@ -0,0 +1,57 @@
+From 705309ce727575faac44f6399463616beeafbfa0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Tue, 10 Jun 2025 15:50:08 +0200
+Subject: [PATCH] rusticl: Add a new build option for extra bindgen include
+ dirs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Bindgen may need extra -I options when headers are not in
+the usual places, like when cross-compiling.
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35435]
+---
+ meson.options                             | 7 +++++++
+ src/gallium/frontends/rusticl/meson.build | 5 +++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/meson.options b/meson.options
+index 40fe433435a..65d1c236261 100644
+--- a/meson.options
++++ b/meson.options
+@@ -787,6 +787,13 @@ option(
+   ],
+ )
+ 
++option(
++  'bindgen-includes',
++  type : 'array',
++  value : [],
++  description : 'Pass extra -I options to bindgen (if needed for cross builds).'
++)
++
+ option(
+   'mesa-clc',
+   type : 'combo',
+diff --git a/src/gallium/frontends/rusticl/meson.build b/src/gallium/frontends/rusticl/meson.build
+index 426b0a9b993..20e0d7682ea 100644
+--- a/src/gallium/frontends/rusticl/meson.build
++++ b/src/gallium/frontends/rusticl/meson.build
+@@ -106,6 +106,11 @@ rusticl_bindgen_c_args = [
+   '-fno-builtin-malloc',
+ ]
+ 
++_bindgen_includes = get_option('bindgen-includes')
++foreach _bindgen_include : _bindgen_includes
++  rusticl_bindgen_c_args += '-I' + _bindgen_include
++endforeach
++
+ cl_c_args = [
+   '-DCL_USE_DEPRECATED_OPENCL_1_0_APIS',
+   '-DCL_USE_DEPRECATED_OPENCL_1_1_APIS',
+-- 
+2.49.0
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b222e72fdd..3179023efb 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,6 +18,7 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
            file://0001-dont-build-clover-frontend.patch \
+           file://0001-rusticl-Add-a-new-build-option-for-extra-bindgen-inc.patch \
 "
 
 SRC_URI[sha256sum] = "ffcb6cadb5fd356d56008e6308641dfe4b2929f30139f6585436ca6e3cddba7f"
@@ -151,7 +152,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
 # "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
 # Be sure to enable them both for the target and for the native build.
-PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native"
+PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dbindgen-includes=${STAGING_INCDIR}, -Dgallium-rusticl=false, bindgen-cli-native"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
-- 
2.49.0


