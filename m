Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A8EC636D3
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:16:43 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.133.1676236598355155462
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=V3YCjO9C;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.53, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f53.google.com with SMTP id bt8so4717841edb.12
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eNuAc9u+BCeqzflweBnMDeAQqwO4++GvCPkqU/pFC5U=;
        b=V3YCjO9CnUDTHxvLZwzb0gNCQcoO70NEpe90UvcJboGwfzTKB5NtyUysbmwMVnq+qf
         jsW3sM/SjIv92jzgoG3zXi0UkzsPUu2MvC7XUWbM036ZOHx2weSYq2GEPr6AdjJZnTqi
         +poTFEkW2B01mLqyYTsSEinKzcI/0t9yUoHlZ5z4VjGBlv7iMR3AuKB5L8/bNAFez0Dh
         2DYBpehFx34YU6oa3nhB0/xdp3mA5NcVKW5rqgVPFi/ONr6CcsYodSpHXBncrQojdpjH
         BI9J1qESVq36aB6oJQpRqKBFp4SW+/bEJjc/saZ4LZWd8aNJe25GyNDJhdQRZqv8VVBl
         mdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eNuAc9u+BCeqzflweBnMDeAQqwO4++GvCPkqU/pFC5U=;
        b=qi23QcSRBbaY/mP+eTagMu9vHHzV5Q7fDsvKEhoXDHvmQFW17OHrvOgJkoYkvnktjU
         /vd2svlperLGR1jaHdOAqq+vT3BK2xp0mBArcGFHGXTsiskLlm8SMMaC/1qjtecnep+Z
         0eSTqrGOuHhatMYQkwExVvSglXt2Via8gsyo356liASs9DGmiOTiD8pOYPtYr1FsH77I
         hs886ge9EeqZH/FONl1VufwLQHTJuofdChgfoOe1a4uxTv76uANtU51Plq3I+BaUka5z
         Rd0xXA4u1DibYnm5IBM75Isph8tV6XZKWo2O9z2Aiqew+ifazxpWdwWPuv8lSMnQ5f2A
         oKWg==
X-Gm-Message-State: AO0yUKXU7uOR5685UNl21mU22D5XvRJf6408YOd9g9jOFIMr8FXu6I+A
	uHlHBEB+H5KFCfZwikgt4DuCpwBVKTjMXIVCFMpPDDHwZMjuckjv
X-Google-Smtp-Source: AK7set8qdI7y9xAFeaD0MtxZT3i+5zEFKYhZufQUE7Uy1i9543Fko35q0FxOO7wjJzt+GjGczOyBwZ2TMqu4JZEWEOI=
X-Received: by 2002:a50:9f6a:0:b0:4ac:20b:96b0 with SMTP id
 b97-20020a509f6a000000b004ac020b96b0mr2687302edf.3.1676236596352; Sun, 12 Feb
 2023 13:16:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1676236110.git.steve@sakoman.com> <d54e9eaff911fe834e3290a40924c7b3ca066216.1676236110.git.steve@sakoman.com>
In-Reply-To: <d54e9eaff911fe834e3290a40924c7b3ca066216.1676236110.git.steve@sakoman.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 12 Feb 2023 11:16:25 -1000
Message-ID: <CAOSpxdbpQN4GP-LcEFJkchUAGm7fjnHZgNNrShEZLNjaT1=brw@mail.gmail.com>
Subject: Fwd: [OE-core][kirkstone 11/27] gdk-pixbuf: do not use tools from
 gdk-pixbuf-native when building tests
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177071

From: Alexander Kanavin <alex.kanavin@gmail.com>

The patch that allows to do so has not been accepted upstream, and
wasn't correctly
working as it was running a native executable
(gdk-pixbuf-query-loaders) with target .so plugins.

On the other hand, out of 20+ (currently 23) tests only three require
running binaries at build time to produce special test-specific input data:

cve-2015-4491
pixbuf-pixdata
pixbuf-resource

So let's simply omit these from the build: this can be done with a far
less invasive patch which has a chance of being accepted upstream.

gdk-pixbuf-print-mime-types is no longer installed
(the replaced patch was doing that).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0d926508e75095eb446699b612729d0243eacc91)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-Add-use_prebuilt_tools-option.patch  | 173 ------------------
 ...w-a-subset-of-tests-in-cross-compile.patch |  66 +++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.10.bb          |  17 +-
 3 files changed, 68 insertions(+), 188 deletions(-)
 delete mode 100644
meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
 create mode 100644
meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
deleted file mode 100644
index 02cc9a2a70..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-From f81b60ebcbbfd9548c8aa1e388662c429068d1e3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sat, 8 May 2021 21:58:54 +0200
-Subject: [PATCH] Add use_prebuilt_tools option
-
-This allows using the gdk-pixbuf tools from the host to
-build and install tests in a cross-compile scenarion.
-
-Upstream-Status: Submitted
[https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/119]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- gdk-pixbuf/meson.build  | 11 +++++++++--
- meson.build             |  6 +++---
- meson_options.txt       |  4 ++++
- tests/meson.build       | 16 ++++++++--------
- thumbnailer/meson.build | 24 ++++++++++++++++++------
- 5 files changed, 42 insertions(+), 19 deletions(-)
-
-diff --git a/gdk-pixbuf/meson.build b/gdk-pixbuf/meson.build
-index 54ff9dd..2e321cf 100644
---- a/gdk-pixbuf/meson.build
-+++ b/gdk-pixbuf/meson.build
-@@ -342,13 +342,20 @@ foreach bin: gdkpixbuf_bin
-                    include_directories: [ root_inc, gdk_pixbuf_inc ],
-                    c_args: common_cflags + gdk_pixbuf_cflags,
-                    install: true)
--  meson.override_find_program(bin_name, bin)
-+  if not get_option('use_prebuilt_tools')
-+      meson.override_find_program(bin_name, bin)
-+  endif
-
-   # Used in tests
-   set_variable(bin_name.underscorify(), bin)
- endforeach
-
--if not meson.is_cross_build()
-+if get_option('use_prebuilt_tools')
-+    gdk_pixbuf_query_loaders =
find_program('gdk-pixbuf-query-loaders', required: true)
-+    gdk_pixbuf_pixdata = find_program('gdk-pixbuf-pixdata', required: true)
-+endif
-+
-+if not meson.is_cross_build() or get_option('use_prebuilt_tools')
-   # The 'loaders.cache' used for testing, so we don't accidentally
-   # load the installed cache; we always build it by default
-   loaders_cache = custom_target('loaders.cache',
-diff --git a/meson.build b/meson.build
-index 813bd43..a93e6f7 100644
---- a/meson.build
-+++ b/meson.build
-@@ -369,18 +369,18 @@ subdir('gdk-pixbuf')
- # i18n
- subdir('po')
-
--if not meson.is_cross_build()
-+if not meson.is_cross_build() or get_option('use_prebuilt_tools')
-   if get_option('tests')
-     subdir('tests')
-   endif
--  subdir('thumbnailer')
- endif
-+subdir('thumbnailer')
-
- # Documentation
- build_docs = get_option('gtk_doc') or get_option('docs')
- subdir('docs')
-
--if not meson.is_cross_build()
-+if not meson.is_cross_build() or get_option('use_prebuilt_tools')
-   meson.add_install_script('build-aux/post-install.py',
-     gdk_pixbuf_bindir,
-     gdk_pixbuf_libdir,
-diff --git a/meson_options.txt b/meson_options.txt
-index d198d99..1c899e9 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -53,4 +53,8 @@ option('gio_sniffing',
-        description: 'Perform file type detection using GIO (Unused
on MacOS and Windows)',
-        type: 'boolean',
-        value: true)
-+option('use_prebuilt_tools',
-+       description: 'Use prebuilt gdk-pixbuf tools from the host for
cross-compilation',
-+       type: 'boolean',
-+       value: false)
-
-diff --git a/tests/meson.build b/tests/meson.build
-index 28c2525..d97c02d 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -5,6 +5,12 @@
- # $PATH. Ideally we should use gnome.compile_resources() and let
Meson deal with
- # this problem: See https://github.com/mesonbuild/meson/issues/8266.
- if enabled_loaders.contains('png') and host_system != 'windows'
-+
-+  resources_deps = [loaders_cache,]
-+  if not get_option('use_prebuilt_tools')
-+    resources_deps += [gdk_pixbuf_pixdata,]
-+  endif
-+
-   # Resources; we cannot use gnome.compile_resources() here, because
we need to
-   # override the environment in order to use the utilities we just
built instead
-   # of the system ones
-@@ -21,10 +27,7 @@ if enabled_loaders.contains('png') and host_system
!= 'windows'
-       '@INPUT@',
-       '@OUTPUT@',
-     ],
--    depends: [
--      gdk_pixbuf_pixdata,
--      loaders_cache,
--    ],
-+    depends: resources_deps,
-   )
-
-   resources_h = custom_target('resources.h',
-@@ -40,10 +43,7 @@ if enabled_loaders.contains('png') and host_system
!= 'windows'
-       '@INPUT@',
-       '@OUTPUT@',
-     ],
--    depends: [
--      gdk_pixbuf_pixdata,
--      loaders_cache,
--    ],
-+    depends: resources_deps,
-   )
-   no_resources = false
- else
-diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
-index b6a206d..9336c21 100644
---- a/thumbnailer/meson.build
-+++ b/thumbnailer/meson.build
-@@ -6,13 +6,29 @@ bin = executable('gdk-pixbuf-thumbnailer',
-            ],
-            dependencies: gdk_pixbuf_deps + [ gdkpixbuf_dep ],
-            install: true)
--meson.override_find_program('gdk-pixbuf-thumbnailer', bin)
-+if not get_option('use_prebuilt_tools')
-+    meson.override_find_program('gdk-pixbuf-thumbnailer', bin)
-+endif
-
- gdk_pixbuf_print_mime_types = executable('gdk-pixbuf-print-mime-types',
-                                          'gdk-pixbuf-print-mime-types.c',
-+                                         install: true,
-                                          c_args: common_cflags,
-                                          dependencies:
gdk_pixbuf_deps + [ gdkpixbuf_dep ])
-
-+if get_option('use_prebuilt_tools')
-+    gdk_pixbuf_print_mime_types =
find_program('gdk-pixbuf-print-mime-types', required: true)
-+endif
-+
-+thumbnailer_deps = [loaders_cache,]
-+
-+if not get_option('use_prebuilt_tools')
-+    thumbnailer_deps += [
-+        gdk_pixbuf_print_mime_types,
-+        gdk_pixbuf_pixdata,
-+    ]
-+endif
-+
- custom_target('thumbnailer',
-               input: 'gdk-pixbuf-thumbnailer.thumbnailer.in',
-               output: 'gdk-pixbuf-thumbnailer.thumbnailer',
-@@ -25,10 +41,6 @@ custom_target('thumbnailer',
-                 '@INPUT@',
-                 '@OUTPUT@',
-               ],
--              depends: [
--                gdk_pixbuf_print_mime_types,
--                gdk_pixbuf_pixdata,
--                loaders_cache,
--              ],
-+              depends: thumbnailer_deps,
-               install: true,
-               install_dir: join_paths(gdk_pixbuf_datadir, 'thumbnailers'))
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
new file mode 100644
index 0000000000..7250fa3f62
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
@@ -0,0 +1,66 @@
+From 9d3b374e75692da3d1d05344a1693c85a3098f47 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 26 Jan 2023 20:29:46 +0100
+Subject: [PATCH] meson.build: allow (a subset of) tests in cross compile
+ settings
+
+There is no need to completely disable tests: most of them
+do not require running target executables at build time,
+and so can be built and installed.
+
+This requires inserting a couple of specific guards around
+items that do require running target executables.
+
+Upstream-Status: Submitted
[https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/150]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ meson.build       |  6 +++---
+ tests/meson.build | 10 ++++++----
+ 2 files changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 8a16c8f..7c8b20f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -369,10 +369,10 @@ subdir('gdk-pixbuf')
+ # i18n
+ subdir('po')
+
++if get_option('tests')
++  subdir('tests')
++endif
+ if not meson.is_cross_build()
+-  if get_option('tests')
+-    subdir('tests')
+-  endif
+   subdir('thumbnailer')
+ endif
+
+diff --git a/tests/meson.build b/tests/meson.build
+index 28c2525..c45e765 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -4,7 +4,7 @@
+ # gdk-pixbuf-pixdata from build directory because it needs all DLL
locations in
+ # $PATH. Ideally we should use gnome.compile_resources() and let
Meson deal with
+ # this problem: See https://github.com/mesonbuild/meson/issues/8266.
+-if enabled_loaders.contains('png') and host_system != 'windows'
++if enabled_loaders.contains('png') and host_system != 'windows' and
not meson.is_cross_build()
+   # Resources; we cannot use gnome.compile_resources() here, because
we need to
+   # override the environment in order to use the utilities we just
built instead
+   # of the system ones
+@@ -166,9 +166,11 @@ endif
+ test_deps = gdk_pixbuf_deps + [ gdkpixbuf_dep, ]
+ test_args = [ '-k' ]
+ test_env = environment()
+-test_env.set('G_TEST_SRCDIR', meson.current_source_dir())
+-test_env.set('G_TEST_BUILDDIR', meson.current_build_dir())
+-test_env.set('GDK_PIXBUF_MODULE_FILE', loaders_cache.full_path())
++if not meson.is_cross_build()
++  test_env.set('G_TEST_SRCDIR', meson.current_source_dir())
++  test_env.set('G_TEST_BUILDDIR', meson.current_build_dir())
++  test_env.set('GDK_PIXBUF_MODULE_FILE', loaders_cache.full_path())
++endif
+
+ foreach test_name, test_data: installed_tests
+   test_sources = [ test_name + '.c', 'test-common.c' ]
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
index aa44515fbb..cca89a9059 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
@@ -12,15 +12,14 @@ LIC_FILES_CHKSUM =
"file://COPYING;md5=4fbd65380cdd255951079008b364516c \

 SECTION = "libs"

-DEPENDS = "glib-2.0 gdk-pixbuf-native shared-mime-info"
-DEPENDS:remove:class-native = "gdk-pixbuf-native"
+DEPENDS = "glib-2.0 shared-mime-info"

 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"

 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://fatal-loader.patch \
-           file://0001-Add-use_prebuilt_tools-option.patch \
+           file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
\
            "

 SRC_URI[sha256sum] =
"ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b"
@@ -46,14 +45,6 @@ PACKAGECONFIG[tests] =
"-Dinstalled_tests=true,-Dinstalled_tests=false"

 EXTRA_OEMESON = "-Dman=false"

-EXTRA_OEMESON:append:class-target = " \
-    -Duse_prebuilt_tools=true \
-"
-
-EXTRA_OEMESON:append:class-nativesdk = " \
-    -Duse_prebuilt_tools=true \
-"
-
 PACKAGES =+ "${PN}-xlib"

 # For GIO image type sniffing
@@ -115,10 +106,6 @@ do_install:append:class-native() {
                XDG_DATA_DIRS=${STAGING_DATADIR} \

GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache

-       create_wrapper ${D}/${bindir}/gdk-pixbuf-print-mime-types \
-               XDG_DATA_DIRS=${STAGING_DATADIR} \
-
GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
-
        create_wrapper ${D}/${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
                XDG_DATA_DIRS=${STAGING_DATADIR} \

GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
\
--
2.34.1

