Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.3603.1616143513485407507
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 01:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Otw2++hf;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a7so8356798ejs.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 01:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0RItUBQWwL3/Atq4qfBkxscmD16qJVNTTP2Yv7foLqQ=;
        b=Otw2++hfnS0yjjGRsZHh+4OwMcQASUNoTsrkw0pF2iIDGs5A5D0zBxj7SN+P3d1PED
         m6LYzR4yndqmtb8GV39yGlgR94CTQ+vKwiRIxeJenuW2c7+Fy7Ra0BRaqOAv+MFa/TMs
         uYKTjGmXML8VpmflkqnN8TgOEARx51R1dQHe18obvKn4S2OATJJzYd9DP/5JfiUnEDmX
         5B3pQeu/9ufETHk0pp8sXkI1JqmfbFfA18wZbcX1uifNGMidPVviHxzFhZj/6grxUnJC
         1bj3lGnfNJc81XB4mDny0trgP2FewaE+GhclJUJomm2Z5HtfbOCry0U1i3PYTwQnWvuA
         C76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0RItUBQWwL3/Atq4qfBkxscmD16qJVNTTP2Yv7foLqQ=;
        b=L9+pu0uA9GkT2YV4qDbpjIywMVbV3dmun65FHUo5mc/dMETqIQNoAyCxhf2RFKLQlN
         vPCInkabivcVzripFrpESvLEBUDOeepADleJGXE2Ggjvbk9mJwkGSFiDkrPJrL3u4y0R
         dDuxALEEteCaqBiQcUl93B0BF/V6SXeSXpMuj91H7+r4pmdbSnajkBB1bI3G2KiPbSxJ
         A9S33N1vOU87M5o4Co5UIbhhzvN6O4qLFPjm0YnyAV5sOicP5qk1PIxGY8q2jiXCTOXy
         YF9n3p6majJs44BKCT/lulwBuoKtH+FzHtTjUUIXgoGOuhGDAyRX7uMD96vyCEgc0GVQ
         9USg==
X-Gm-Message-State: AOAM532ebt/gdHgtBjYTeCzPXzDQmSoqNshiGjjtuxzA9daR/TAaHdS1
	2zF5b2UVw6yJsm8CDYCpf6DKl9SYidCyhw==
X-Google-Smtp-Source: ABdhPJxznL82z5SEKJooq/es9Lo6NtBXauQGhC/yHmsAvwIqWIVI+nWszEiAcJ5whal4yggOrIo2yg==
X-Received: by 2002:a17:907:d8a:: with SMTP id go10mr3160365ejc.46.1616143511962;
        Fri, 19 Mar 2021 01:45:11 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id nd36sm3262248ejc.21.2021.03.19.01.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:45:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/16] mesa: update 20.3.4 -> 21.0.0
Date: Fri, 19 Mar 2021 09:43:52 +0100
Message-Id: <20210319084401.576728-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319084401.576728-1-alex.kanavin@gmail.com>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

0001-anv-fix-a-build-race-between-generating-a-header-and.patch
merged upstream.

osmesa is now a simple boolean option.

Swrast has been removed from dri drivers, so as we need at least one
driver to enable dri in native/nativesdk, replace it with nouveau
(which does not take long to build).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...race-between-generating-a-header-and.patch | 31 -------------------
 ...k-for-all-linux-host_os-combinations.patch | 12 +++----
 ...02-meson.build-make-TLS-ELF-optional.patch | 14 ++++-----
 .../{mesa-gl_20.3.4.bb => mesa-gl_21.0.0.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           | 10 +++---
 .../mesa/{mesa_20.3.4.bb => mesa_21.0.0.bb}   |  0
 6 files changed, 17 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-race-between-generating-a-header-and.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_20.3.4.bb => mesa-gl_21.0.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_20.3.4.bb => mesa_21.0.0.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-race-between-generating-a-header-and.patch b/meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-race-between-generating-a-header-and.patch
deleted file mode 100644
index a61e7b2160..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-anv-fix-a-build-race-between-generating-a-header-and.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From f148d4f1b5b13288b254ead07f1d008d997e2342 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 2 Nov 2020 23:23:53 +0100
-Subject: [PATCH] anv: fix a build race between generating a header and using
- it
-
-anv_batch_chain.c includes genX_bits.h but doesn't ensure it gets
-generated first. This causes build failures, as observed here:
-https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1501/steps/8/logs/step2d
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/7412]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/intel/vulkan/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/intel/vulkan/meson.build b/src/intel/vulkan/meson.build
-index 36e1689314e..b713d8eade3 100644
---- a/src/intel/vulkan/meson.build
-+++ b/src/intel/vulkan/meson.build
-@@ -131,6 +131,7 @@ libanv_files = files(
- anv_deps = [
-   dep_libdrm,
-   dep_valgrind,
-+  idep_genxml,
-   idep_nir_headers,
-   idep_vulkan_util_headers,
- ]
--- 
-2.29.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
index 085254323c..b6f86743e1 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
@@ -1,4 +1,4 @@
-From 0d9ed002eff176b902da266d89829a9b0cb10946 Mon Sep 17 00:00:00 2001
+From 38e984073e4c23b6278d1a2ff21e894fda7b93c5 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:04:49 -0800
 Subject: [PATCH] meson.build: check for all linux host_os combinations
@@ -20,10 +20,10 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 898d025..09e3759 100644
+index 932eb13..efc6171 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -124,7 +124,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
+@@ -153,7 +153,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
  # Only build shared_glapi if at least one OpenGL API is enabled
  with_shared_glapi = with_shared_glapi and with_any_opengl
  
@@ -32,12 +32,12 @@ index 898d025..09e3759 100644
  
  dri_drivers = get_option('dri-drivers')
  if dri_drivers.contains('auto')
-@@ -884,7 +884,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }',
+@@ -970,7 +970,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }',
  endif
  
  # TODO: this is very incomplete
--if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd'].contains(host_machine.system())
-+if ['cygwin', 'gnu', 'gnu/kfreebsd'].contains(host_machine.system()) or host_machine.system().startswith('linux')
+-if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].contains(host_machine.system())
++if ['linux', 'cygwin', 'gnu', 'freebsd', 'gnu/kfreebsd', 'haiku'].contains(host_machine.system()) or host_machine.system().startswith('linux')
    pre_args += '-D_GNU_SOURCE'
  elif host_machine.system() == 'sunos'
    pre_args += '-D__EXTENSIONS__'
diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
index 89c0d150fa..df2346d336 100644
--- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-optional.patch
@@ -1,4 +1,4 @@
-From ce57ce220d9c377beabf4914f33c43118f672ffe Mon Sep 17 00:00:00 2001
+From 624f430dd0a91344146a2b8d49a69f23560c2fa2 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair@alistair23.me>
 Date: Thu, 14 Nov 2019 13:08:31 -0800
 Subject: [PATCH] meson.build: make TLS ELF optional
@@ -30,23 +30,23 @@ Signed-off-by: Alistair Francis <alistair@alistair23.me>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index c5136ea..185270d 100644
+index efc6171..8450968 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -424,7 +424,7 @@ endif
+@@ -448,7 +448,7 @@ endif
  
  # Android uses emutls for versions <= P/28. For USE_ELF_TLS we need ELF TLS.
  use_elf_tls = false
--if not ['windows', 'freebsd', 'openbsd'].contains(host_machine.system()) and (not with_platform_android or get_option('platform-sdk-version') >= 29)
-+if not ['windows', 'freebsd', 'openbsd'].contains(host_machine.system()) and (not with_platform_android or get_option('platform-sdk-version') >= 29) and get_option('elf-tls')
+-if not ['windows', 'freebsd', 'openbsd', 'haiku'].contains(host_machine.system()) and (not with_platform_android or get_option('platform-sdk-version') >= 29)
++if not ['windows', 'freebsd', 'openbsd', 'haiku'].contains(host_machine.system()) and (not with_platform_android or get_option('platform-sdk-version') >= 29) and get_option('elf-tls')
    pre_args += '-DUSE_ELF_TLS'
    use_elf_tls = true
  endif
 diff --git a/meson_options.txt b/meson_options.txt
-index 2d39d13..72006eb 100644
+index fc73f6e..d7482c0 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -368,6 +368,12 @@ option(
+@@ -420,6 +420,12 @@ option(
    value : true,
    description : 'Enable direct rendering in GLX and EGL for DRI',
  )
diff --git a/meta/recipes-graphics/mesa/mesa-gl_20.3.4.bb b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_20.3.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9f8ec112cf..e9b72ce063 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,10 +19,9 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-meson.build-make-TLS-ELF-optional.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
-           file://0001-anv-fix-a-build-race-between-generating-a-header-and.patch \
            "
 
-SRC_URI[sha256sum] = "dc21a987ec1ff45b278fe4b1419b1719f1968debbb80221480e44180849b4084"
+SRC_URI[sha256sum] = "e6204e98e6a8d77cf9dc5d34f99dd8e3ef7144f3601c808ca0dd26ba522e0d84"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
@@ -103,8 +102,8 @@ PACKAGECONFIG[elf-tls] = "-Delf-tls=true, -Delf-tls=false"
 PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=enabled,-Dgallium-xvmc=disabled,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
-DRIDRIVERS_class-native = "swrast"
-DRIDRIVERS_class-nativesdk = "swrast"
+DRIDRIVERS_class-native = "nouveau"
+DRIDRIVERS_class-nativesdk = "nouveau"
 DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
@@ -168,8 +167,7 @@ GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '
 PACKAGECONFIG[panfrost] = ""
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
 
-OSMESA = "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium', 'classic', d)}"
-PACKAGECONFIG[osmesa] = "-Dosmesa=${OSMESA},-Dosmesa=none"
+PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
 
 PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 
diff --git a/meta/recipes-graphics/mesa/mesa_20.3.4.bb b/meta/recipes-graphics/mesa/mesa_21.0.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_20.3.4.bb
rename to meta/recipes-graphics/mesa/mesa_21.0.0.bb
-- 
2.29.2

