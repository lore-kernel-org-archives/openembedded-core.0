Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.9824.1620227940735045359
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jZ6XsRoF;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id s6so2476719edu.10
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GSYplMmPy+dTxPxgh7hyROcH5gKs7bX+O0vmEJSeonw=;
        b=jZ6XsRoFiYVeoj0Xj01Du1D0G9M0fFTK3DiawwsQYjpuE6UqM7UpqiH30GEsPVlZ4M
         tDzVttgCELXrL9UzhevfYVipJCyztfLCip6/0pATamXAHC0vq7KNaAbwOirqv0VPgaxO
         cFSsuTFRzBY3uGfYBqEFVexYbj+zHrPz0yVfaK1Ui9hXZkQqWd6bTx0KhU1OwgJHB+B+
         /YP8YxXRtZkYdlwL3AYU+CdCoP+/BG78RFzbpGfWnmFWU88oOaMIO92vf3qpNLuB/02g
         lYHK9fMKkEx6NcocmccGIRiJwUqB+Wyl9+FHXYM0GqxZ3unMg6cdSHkBFGEVnJ3uL7aF
         G9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GSYplMmPy+dTxPxgh7hyROcH5gKs7bX+O0vmEJSeonw=;
        b=p9Bp2RiNp219h1D6vB0xYpei9UxE5sQJTHsgxH1eV9OxRi/pEUgvgAf8G/Td54gDIE
         GEDde/vqqsu0Qs6Q7hIC6qWg+Dpfqq/4Dwwrt9SH8kwK2Uo3g1ApeZK8bU8R3mYhotMS
         gvWkfjhQ5WB3fVeS4XXlguVQ0EWPg1nUCn640iPby+ZnEZG9BU8P0sL83j9TjaDqUHz9
         yI7tdv+KY81PWpw7MeXoTrEvM0IkJtNzbOGdVyaG84puH0bZd7DVtwbwY0Nb0PoKxtu7
         kxHgtO8OEIwMKZlOWeymEu3S5SBA/zlg21SzyGf+sMRDVCksJhK32sPGpIGc8wE1gN5N
         dL/A==
X-Gm-Message-State: AOAM533FwypUhvObitHk94cJpIVgbT7XWfdfL8DCgn8lF1rfld3PISOD
	37soexWMVlwmCWSp1tModVA8sfGJ7Irpew==
X-Google-Smtp-Source: ABdhPJxf4tusC7vvOJJq2Mampi4SE/HfRzzvNKAmjwQc+TLmfyn8ISSwaWmTPLcAUfUdN6xgmDcmhw==
X-Received: by 2002:aa7:d950:: with SMTP id l16mr32907179eds.374.1620227939270;
        Wed, 05 May 2021 08:18:59 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:18:58 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/61] gdk-pixbuf: update 2.40.0 -> 2.42.6
Date: Wed,  5 May 2021 17:17:53 +0200
Message-Id: <20210505151850.660512-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note: jpg/png loaders are now builtin and no longer
provided as separate packages.

Drop backport missing-test-data.patch.

Drop no longer needed 0004-Do-not-run-tests-when-building.patch

Rebase 0004-Do-not-run-tests-when-building.patch

Rework 0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
so that it can be applied to both native and target builds.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...bnailer-and-pixdata-cross-compile-fa.patch | 95 +++++++++++++++++++
 ...-around-thumbnailer-cross-compile-fa.patch | 94 ------------------
 .../0004-Do-not-run-tests-when-building.patch | 39 --------
 ...ailer-and-tests-also-in-cross-builds.patch |  9 +-
 .../gdk-pixbuf/CVE-2020-29385.patch           | 55 -----------
 .../gdk-pixbuf/missing-test-data.patch        | 30 ------
 ...-pixbuf_2.40.0.bb => gdk-pixbuf_2.42.6.bb} | 21 +---
 7 files changed, 105 insertions(+), 238 deletions(-)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.40.0.bb => gdk-pixbuf_2.42.6.bb} (85%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch
new file mode 100644
index 0000000000..2aa9164750
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch
@@ -0,0 +1,95 @@
+From dcaf3106e2cca27f728a8bd26127430500a1136e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 22 Feb 2019 13:22:06 +0100
+Subject: [PATCH] Work-around thumbnailer and pixdata cross-compile failure
+
+Use native gdk-pixbuf-print-mime-types and gdk-pixbuf-pixdata
+when generating the thumbnail metadata and resources.
+
+This works but the mime types will come from native
+loader.cache (which will only contain in-tree loaders), not from the
+target loader.cache.
+
+The upstream issue is https://bugzilla.gnome.org/show_bug.cgi?id=779057
+
+Upstream-Status: Inappropriate [workaround]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ tests/meson.build       | 11 +++++++++--
+ thumbnailer/meson.build | 23 ++++++++++++++++++++++-
+ 2 files changed, 31 insertions(+), 3 deletions(-)
+
+diff --git a/tests/meson.build b/tests/meson.build
+index 7c6cb11..07121f1 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -8,13 +8,20 @@ if enabled_loaders.contains('png') and host_system != 'windows'
+   # Resources; we cannot use gnome.compile_resources() here, because we need to
+   # override the environment in order to use the utilities we just built instead
+   # of the system ones
++
++  if not meson.is_cross_build()
++  pixdata_binary = gdk_pixbuf_pixdata.full_path()
++  else
++  pixdata_binary = 'gdk-pixbuf-pixdata'
++  endif
++
+   resources_c = custom_target('resources.c',
+     input: 'resources.gresource.xml',
+     output: 'resources.c',
+     command: [
+       gen_resources,
+       '--glib-compile-resources=@0@'.format(glib_compile_resources.full_path()),
+-      '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
++      '--pixdata=@0@'.format(pixdata_binary),
+       '--loaders=@0@'.format(loaders_cache.full_path()),
+       '--sourcedir=@0@'.format(meson.current_source_dir()),
+       '--source',
+@@ -33,7 +40,7 @@ if enabled_loaders.contains('png') and host_system != 'windows'
+     command: [
+       gen_resources,
+       '--glib-compile-resources=@0@'.format(glib_compile_resources.full_path()),
+-      '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
++      '--pixdata=@0@'.format(pixdata_binary),
+       '--loaders=@0@'.format(loaders_cache.full_path()),
+       '--sourcedir=@0@'.format(meson.current_source_dir()),
+       '--header',
+diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
+index 8c741e0..5a3b52a 100644
+--- a/thumbnailer/meson.build
++++ b/thumbnailer/meson.build
+@@ -14,7 +14,27 @@ gdk_pixbuf_print_mime_types = executable('gdk-pixbuf-print-mime-types',
+                                          install: true,
+                                          dependencies: gdk_pixbuf_deps + [ gdkpixbuf_dep ])
+ 
+-custom_target('thumbnailer',
++if meson.is_cross_build()
++    custom_target('thumbnailer',
++              input: 'gdk-pixbuf-thumbnailer.thumbnailer.in',
++              output: 'gdk-pixbuf-thumbnailer.thumbnailer',
++              command: [
++                gen_thumbnailer,
++                '--printer=gdk-pixbuf-print-mime-types',
++                '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
++                '--loaders=@0@'.format(loaders_cache.full_path()),
++                '--bindir=@0@'.format(gdk_pixbuf_bindir),
++                '@INPUT@',
++                '@OUTPUT@',
++              ],
++              depends: [
++                gdk_pixbuf_print_mime_types,
++                gdk_pixbuf_pixdata,
++              ],
++              install: true,
++              install_dir: join_paths(gdk_pixbuf_datadir, 'thumbnailers'))
++else
++    custom_target('thumbnailer',
+               input: 'gdk-pixbuf-thumbnailer.thumbnailer.in',
+               output: 'gdk-pixbuf-thumbnailer.thumbnailer',
+               command: [
+@@ -33,3 +53,4 @@ custom_target('thumbnailer',
+               ],
+               install: true,
+               install_dir: join_paths(gdk_pixbuf_datadir, 'thumbnailers'))
++endif
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
deleted file mode 100644
index a9c7600eb3..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 2d1b65bd1272ad63b7fbd4babd9a8e8c296d15b5 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 22 Feb 2019 13:22:06 +0100
-Subject: [PATCH] (target only) Work-around thumbnailer and pixdata
- cross-compile failure
-
-Use native gdk-pixbuf-print-mime-types and gdk-pixbuf-pixdata
-when generating the thumbnail metadata and resources.
-
-This works but the mime types will come from native
-loader.cache (which will only contain in-tree loaders), not from the
-target loader.cache.
-
-The upstream issue is https://bugzilla.gnome.org/show_bug.cgi?id=779057
-
-Upstream-Status: Inappropriate [workaround]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- build-aux/gen-thumbnailer.py |  2 --
- tests/meson.build            | 11 +++++++++--
- thumbnailer/meson.build      |  5 +----
- 3 files changed, 10 insertions(+), 8 deletions(-)
-
-diff --git a/build-aux/gen-thumbnailer.py b/build-aux/gen-thumbnailer.py
-index 05ac821..c5b99ab 100644
---- a/build-aux/gen-thumbnailer.py
-+++ b/build-aux/gen-thumbnailer.py
-@@ -20,8 +20,6 @@ argparser.add_argument('output', help='Output file')
- args = argparser.parse_args()
- 
- newenv = os.environ.copy()
--newenv['GDK_PIXBUF_PIXDATA'] = args.pixdata
--newenv['GDK_PIXBUF_MODULE_FILE'] = args.loaders
- # 'nt': NT-based Windows, see https://docs.python.org/3/library/os.html
- if os.name == 'nt':
-     gdk_pixbuf_dll_buildpath = os.path.dirname(args.pixdata)
-diff --git a/tests/meson.build b/tests/meson.build
-index 8ed7cc1..e011b77 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -1,12 +1,19 @@
- # Resources; we cannot use gnome.compile_resources() here, because we need to
- # override the environment in order to use the utilities we just built instead
- # of the system ones
-+
-+if not meson.is_cross_build()
-+pixdata_binary = gdk_pixbuf_pixdata.full_path()
-+else
-+pixdata_binary = 'gdk-pixbuf-pixdata'
-+endif
-+
- resources_c = custom_target('resources.c',
-   input: 'resources.gresource.xml',
-   output: 'resources.c',
-   command: [
-     gen_resources,
--    '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
-+    '--pixdata=@0@'.format(pixdata_binary),
-     '--loaders=@0@'.format(loaders_cache.full_path()),
-     '--sourcedir=@0@'.format(meson.current_source_dir()),
-     '--source',
-@@ -24,7 +31,7 @@ resources_h = custom_target('resources.h',
-   output: 'resources.h',
-   command: [
-     gen_resources,
--    '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
-+    '--pixdata=@0@'.format(pixdata_binary),
-     '--loaders=@0@'.format(loaders_cache.full_path()),
-     '--sourcedir=@0@'.format(meson.current_source_dir()),
-     '--header',
-diff --git a/thumbnailer/meson.build b/thumbnailer/meson.build
-index aaafec8..71bd61b 100644
---- a/thumbnailer/meson.build
-+++ b/thumbnailer/meson.build
-@@ -18,9 +18,7 @@ custom_target('thumbnailer',
-               output: 'gdk-pixbuf-thumbnailer.thumbnailer',
-               command: [
-                 gen_thumbnailer,
--                '--printer=@0@'.format(gdk_pixbuf_print_mime_types.full_path()),
--                '--pixdata=@0@'.format(gdk_pixbuf_pixdata.full_path()),
--                '--loaders=@0@'.format(loaders_cache.full_path()),
-+                '--printer=gdk-pixbuf-print-mime-types',
-                 '--bindir=@0@'.format(gdk_pixbuf_bindir),
-                 '@INPUT@',
-                 '@OUTPUT@',
-@@ -28,7 +26,6 @@ custom_target('thumbnailer',
-               depends: [
-                 gdk_pixbuf_print_mime_types,
-                 gdk_pixbuf_pixdata,
--                loaders_cache,
-               ],
-               install: true,
-               install_dir: join_paths(gdk_pixbuf_datadir, 'thumbnailers'))
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
deleted file mode 100644
index 96c546f271..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0004-Do-not-run-tests-when-building.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 3c4a6c147ae8a0962ba9194373d8a41d14eed44f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 22 Feb 2019 13:23:55 +0100
-Subject: [PATCH] Do not run tests when building
-
-Upstream-Status: Inappropriate [cross-compile specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/meson.build | 17 -----------------
- 1 file changed, 17 deletions(-)
-
-diff --git a/tests/meson.build b/tests/meson.build
-index 4fa3fbc..6ef7884 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -138,23 +138,6 @@ foreach t: installed_tests
-     install_dir: installed_test_bindir,
-   )
- 
--  # Two particularly slow tests
--  if test_suites.contains('slow')
--    timeout = 300
--  else
--    timeout = 30
--  endif
--
--  test(test_name, test_bin,
--    suite: test_suites,
--    args: [ '-k', '--tap' ],
--    env: [
--      'G_TEST_SRCDIR=@0@'.format(meson.current_source_dir()),
--      'G_TEST_BUILDDIR=@0@'.format(meson.current_build_dir()),
--      'GDK_PIXBUF_MODULE_FILE=@0@'.format(loaders_cache.full_path()),
--    ],
--    timeout: timeout,
--  )
- endforeach
- 
- executable('pixbuf-read',
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
index 0fe13a387a..cd9f88befc 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch
@@ -1,19 +1,20 @@
-From 1a532e090c558a830de9503f56e23414e880bb95 Mon Sep 17 00:00:00 2001
+From d02a8e202d2fe5caf3449683e0ccdf84a482a325 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 5 Jun 2019 14:17:55 +0200
 Subject: [PATCH] Build thumbnailer and tests also in cross builds.
 
 Upstream-Status: Inappropriate [relies on oe-core specific hacks]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  meson.build | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index d104cea..7acb88a 100644
+index 73034d1..d114016 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -397,10 +397,8 @@ endif
+@@ -378,10 +378,8 @@ subdir('gdk-pixbuf')
  # i18n
  subdir('po')
  
@@ -25,4 +26,4 @@ index d104cea..7acb88a 100644
 +subdir('thumbnailer')
  
  # Documentation
- subdir('docs')
+ build_docs = get_option('gtk_doc') or get_option('docs')
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
deleted file mode 100644
index 3fef2bc1eb..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81 Mon Sep 17 00:00:00 2001
-From: Robert Ancell <robert.ancell@canonical.com>
-Date: Mon, 30 Nov 2020 12:26:12 +1300
-Subject: [PATCH 02/13] gif: Fix LZW decoder accepting invalid LZW code.
-
-The code value after a reset wasn't being validated, which means we would
-accept invalid codes. This could cause an infinite loop in the decoder.
-
-Fixes CVE-2020-29385
-
-Fixes https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/issues/164
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/bdd3acbd48a575d418ba6bf1b32d7bda2fae1c81]
-CVE: CVE-2020-29385
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
-
----
- gdk-pixbuf/lzw.c                    |  13 +++++++------
- 1 files changed, 7 insertions(+), 6 deletions(-)
- create mode 100644 tests/test-images/fail/hang_114.gif
-
-diff --git a/gdk-pixbuf/lzw.c b/gdk-pixbuf/lzw.c
-index 9e052a6f7..105daf2b1 100644
---- a/gdk-pixbuf/lzw.c
-+++ b/gdk-pixbuf/lzw.c
-@@ -195,19 +195,20 @@ lzw_decoder_feed (LZWDecoder *self,
-                                 if (self->last_code != self->clear_code && self->code_table_size < MAX_CODES) {
-                                         if (self->code < self->code_table_size)
-                                                 add_code (self, self->code);
--                                        else if (self->code == self->code_table_size)
-+                                        else
-                                                 add_code (self, self->last_code);
--                                        else {
--                                                /* Invalid code received - just stop here */
--                                                self->last_code = self->eoi_code;
--                                                return output_length;
--                                        }
- 
-                                         /* When table is full increase code size */
-                                         if (self->code_table_size == (1 << self->code_size) && self->code_size < LZW_CODE_MAX)
-                                                 self->code_size++;
-                                 }
- 
-+                                /* Invalid code received - just stop here */
-+                                if (self->code >= self->code_table_size) {
-+                                        self->last_code = self->eoi_code;
-+                                        return output_length;
-+                                }
-+
-                                 /* Convert codeword into indexes */
-                                 n_written += write_indexes (self, output + n_written, output_length - n_written);
-                         }
--- 
-2.25.1
-
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch
deleted file mode 100644
index 6c758fd61c..0000000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/missing-test-data.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From d8d231c01ef2e59856da8a5c26ace955e5f29370 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 25 Nov 2019 17:05:46 +0000
-Subject: [PATCH] tests: install circular-table.gif
-
-This test data was added for the pixbuf-gif-circular-table test (added October
-2018 in 0b9d004) but because the file was never actually installed the installed
-test suite never passes.
----
- tests/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/meson.build b/tests/meson.build
-index 5116fc2b9..80ed3e8b2 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -97,6 +97,7 @@ test_data = [
-   'bug775693.pixdata',
-   'bug775229.pixdata',
-   'aero.gif',
-+  'circular-table.gif'
- ]
- 
- installed_test_bindir = join_paths(gdk_pixbuf_libexecdir, 'installed-tests', meson.project_name())
--- 
-2.20.1
-
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
similarity index 85%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
index 226e1c7b89..2734a11f96 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.6.bb
@@ -22,41 +22,30 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            file://0001-Work-around-thumbnailer-cross-compile-failure.patch \
            file://0001-Fix-a-couple-of-decisions-around-cross-compilation.patch \
-           file://0004-Do-not-run-tests-when-building.patch \
            file://0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch \
-           file://missing-test-data.patch \
-           file://CVE-2020-29385.patch \
+           file://0001-Work-around-thumbnailer-and-pixdata-cross-compile-fa.patch \
            "
 
-SRC_URI_append_class-target = " \
-           file://0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch \
-           "
-SRC_URI_append_class-nativesdk = " \
-           file://0003-target-only-Work-around-thumbnailer-cross-compile-fa.patch \
-           "
-
-SRC_URI[md5sum] = "05eb1ebc258ba905f1c8644ef49de064"
-SRC_URI[sha256sum] = "1582595099537ca8ff3b99c6804350b4c058bb8ad67411bbaae024ee7cead4e6"
+SRC_URI[sha256sum] = "c4a6b75b7ed8f58ca48da830b9fa00ed96d668d3ab4b1f723dcf902f78bde77f"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc lib_package
 
-GIR_MESON_OPTION = 'gir'
+GIR_MESON_OPTION = 'introspection'
+GIR_MESON_ENABLE_FLAG = "enabled"
+GIR_MESON_DISABLE_FLAG = "disabled"
 
 LIBV = "2.10.0"
 
 GDK_PIXBUF_LOADERS ?= "png jpeg"
 
 PACKAGECONFIG = "${GDK_PIXBUF_LOADERS} \
-                 ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
                  ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG_class-native = "${GDK_PIXBUF_LOADERS}"
 
 PACKAGECONFIG[png] = "-Dpng=true,-Dpng=false,libpng"
 PACKAGECONFIG[jpeg] = "-Djpeg=true,-Djpeg=false,jpeg"
 PACKAGECONFIG[tiff] = "-Dtiff=true,-Dtiff=false,tiff"
-PACKAGECONFIG[jpeg2000] = "-Djasper=true,-Djasper=false,jasper"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false"
-PACKAGECONFIG[x11] = "-Dx11=true,-Dx11=false,virtual/libx11"
 
 PACKAGES =+ "${PN}-xlib"
 
-- 
2.31.1

