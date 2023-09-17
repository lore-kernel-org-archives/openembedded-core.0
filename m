Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AA1CD13CF
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:26 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.27414.1694943556182434943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MaYoHnyB;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-98377c5d53eso443250866b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943554; x=1695548354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bVagTOtSQ0cBS/yzpK1YOvTZfrw4yDnjoP/g+N7LIo=;
        b=MaYoHnyBUXBDs3Cqrf10M+WZR9gDegOLZ0jywIFUtve46OxGULtbi44jxxr0xSu+7G
         wLKUzfgmCznaLkhEm7NI3LV02klC4+dcPlCmpQPujXML+11Xm8S3MXl1PM8i+3KWpKp8
         Rad8KUAj3uvoypp+NCq6Wo9T3xs1GbJi7sEkYYvroeLu94HDpYr3BAKDD+l9tFPxyVmE
         i7W1PH/wV6EMug30x8m+5BdD426MgCdmohChCqLaLmBYSSbf3zcyRSaPtR3HchGG1Xbv
         j+9vjdHu19jNRyOEnnYyOEck6/WKkEUoRwGg5xrh1h41mIhD0yyfZ2Ty2C85X9E0zd97
         sf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943554; x=1695548354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bVagTOtSQ0cBS/yzpK1YOvTZfrw4yDnjoP/g+N7LIo=;
        b=p60ViSHERRmqmR0vQWp+nahyECQKstRUIh8WV46yhjyFl204B352dLcx+0ZTZVpF9H
         X6R4H/YrqB2KMqTcKLy5wogKEHCqWjA6IJYUFfy4SMR23C2Fi5pSbdJYeFIDMSUEFu2b
         17Fe1KHDw4Kp9EAqWKAoCTeeo5aS5cm8qmoFee4uvYymwq/z0rXNz0WeFW9CGlz3Rb66
         QMKtowMOXmdtPZLSg0WInt6hRliAZwEa1Ex4hUT/oGZIHr1YY2H0CCIIP3TIAmTDp83s
         hU2DU92HIaX/R2PhrZKnq3mLwGYUWJyRpAI5GdNxArJXBaPnz2WlLfS6z3MOHEBVi3ot
         jtOw==
X-Gm-Message-State: AOJu0YxQxr/cp3rtuZFx5SFdn0RZ1iA7nWKg5LcGbjvE9qQRtDHSGgyV
	0mbATawMrd52/dXICvz3QPxrir7wddo=
X-Google-Smtp-Source: AGHT+IH9uzYL2fLYhR65Jwcq9cL3O7zbISg9UhyHljDEUdqwv+rBT0Jv/mPAzdexL2f4LOZWvLMeYg==
X-Received: by 2002:a17:906:530e:b0:9a1:f21e:cdfc with SMTP id h14-20020a170906530e00b009a1f21ecdfcmr5511749ejo.41.1694943554523;
        Sun, 17 Sep 2023 02:39:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/29] glib-2.0: update 2.76.4 -> 2.78.0
Date: Sun, 17 Sep 2023 11:38:48 +0200
Message-Id: <20230917093901.428214-16-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187789

Add a patch so that native glib executables do not error out
on systems with kernels less than 5.4.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...t-write-bindir-into-pkg-config-files.patch |  74 ++++++------
 ...-support-Fix-snap-test-ordering-race.patch | 107 ------------------
 ...pparent-size-only-for-files-and-syml.patch | 105 -----------------
 ...ot-enable-pidfd-features-on-native-g.patch |  32 ++++++
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  20 ++--
 ...{glib-2.0_2.76.4.bb => glib-2.0_2.78.0.bb} |   8 +-
 meta/recipes-core/glib-2.0/glib.inc           |   1 +
 7 files changed, 84 insertions(+), 263 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.76.4.bb => glib-2.0_2.78.0.bb} (87%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 9bdd99d8a21..0d44ddf299a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 4a41bf7b050168726cc4fad4c1c72fc7c18ab779 Mon Sep 17 00:00:00 2001
+From 9ec4eedeb3f67db0bff09f5d859318d05ff47964 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not write $bindir into pkg-config files
@@ -16,46 +16,46 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 36b5bad..137e75a 100644
+index a320c0f..86ce7c4 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
-@@ -862,14 +862,14 @@ pkg.generate(libgio,
-                'schemasdir=' + join_paths('${datadir}', schemas_subdir),
-                'bindir=' + join_paths('${prefix}', get_option('bindir')),
-                'giomoduledir=' + pkgconfig_giomodulesdir,
--               'gio=' + join_paths('${bindir}', 'gio'),
--               'gio_querymodules=@0@'.format(pkgconfig_multiarch_bindir / 'gio-querymodules'),
--               'glib_compile_schemas=@0@'.format(pkgconfig_multiarch_bindir / 'glib-compile-schemas'),
--               'glib_compile_resources=' + join_paths('${bindir}', 'glib-compile-resources'),
--               'gdbus=' + join_paths('${bindir}', 'gdbus'),
--               'gdbus_codegen=' + join_paths('${bindir}', 'gdbus-codegen'),
--               'gresource=' + join_paths('${bindir}', 'gresource'),
--               'gsettings=' + join_paths('${bindir}', 'gsettings')],
-+               'gio=gio',
-+               'gio_querymodules=gio-querymodules',
-+               'glib_compile_schemas=glib-compile-schemas',
-+               'glib_compile_resources=glib-compile-resources',
-+               'gdbus=gdbus',
-+               'gdbus_codegen=gdbus-codegen',
-+               'gresource=gresource',
-+               'gsettings=gsettings'],
+@@ -884,14 +884,14 @@ pkg.generate(libgio,
+     'dtdsdir=' + '${datadir}' / dtds_subdir,
+     'bindir=' + '${prefix}' / get_option('bindir'),
+     'giomoduledir=' + pkgconfig_giomodulesdir,
+-    'gio=' + '${bindir}' / 'gio',
+-    'gio_querymodules=' + pkgconfig_multiarch_bindir / 'gio-querymodules',
+-    'glib_compile_schemas=' + pkgconfig_multiarch_bindir / 'glib-compile-schemas',
+-    'glib_compile_resources=' + '${bindir}' / 'glib-compile-resources',
+-    'gdbus=' + '${bindir}' /'gdbus',
+-    'gdbus_codegen=' + '${bindir}' / 'gdbus-codegen',
+-    'gresource=' + '${bindir}' / 'gresource',
+-    'gsettings=' + '${bindir}' / 'gsettings',
++    'gio=gio',
++    'gio_querymodules=gio-querymodules',
++    'glib_compile_schemas=glib-compile-schemas',
++    'glib_compile_resources=glib-compile-resources',
++    'gdbus=gdbus',
++    'gdbus_codegen=gdbus-codegen',
++    'gresource=gresource',
++    'gsettings=gsettings',
+   ],
    version : glib_version,
    install_dir : glib_pkgconfigreldir,
-   filebase : 'gio-2.0',
 diff --git a/glib/meson.build b/glib/meson.build
-index c365901..c3d6601 100644
+index c26a35e..1d8ca6b 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
-@@ -397,9 +397,9 @@ pkg.generate(libglib,
-   subdirs : ['glib-2.0'],
-   extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
-   variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
--               'glib_genmarshal=' + join_paths('${bindir}', 'glib-genmarshal'),
--               'gobject_query=' + join_paths('${bindir}', 'gobject-query'),
--               'glib_mkenums=' + join_paths('${bindir}', 'glib-mkenums')],
-+               'glib_genmarshal=glib-genmarshal',
-+               'gobject_query=gobject-query',
-+               'glib_mkenums=glib-mkenums'],
-   version : glib_version,
-   install_dir : glib_pkgconfigreldir,
-   filebase : 'glib-2.0',
+@@ -447,9 +447,9 @@ pkg.generate(libglib,
+   variables : [
+     'bindir=' + '${prefix}' / get_option('bindir'),
+     'datadir=' + '${prefix}' / get_option('datadir'),
+-    'glib_genmarshal=' + '${bindir}' / 'glib-genmarshal',
+-    'gobject_query=' + '${bindir}' / 'gobject-query',
+-    'glib_mkenums=' + '${bindir}' / 'glib-mkenums',
++    'glib_genmarshal=glib-genmarshal',
++    'gobject_query=gobject-query',
++    'glib_mkenums=glib-mkenums',
+     'glib_valgrind_suppressions=' + '${datadir}' /
+       valgrind_suppression_file_install_subdir /
+       fs.name(valgrind_suppression_file),
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch
deleted file mode 100644
index 9e2bc1338b1..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-From f47503cc5ae10de6dee319ba6cff257eddabf33e Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Tue, 30 May 2023 11:52:38 +0100
-Subject: [PATCH] gio/tests/portal-support: Fix snap test ordering race
-
-When the gnome test runner executes the tests, the test appear to execute in disk
-order. This means it sometimes works and sometimes we see breakage in portal-support-snap
-and portal-support-snap-classic.
-
-The issue is that some tests create config files but some don't. If they run
-in the wrong order, tests see config files they shouldn't and break.
-
-Fix this by deleting the files after each test run, properly cleaning up after
-themselves. The cleanup code is based upon gtestutils.c:rm_rf().
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/c63cf19d9a8a6ae315a7f9a3fe4ea60c8cf5dece]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- gio/tests/portal-support-snap-classic.c |  3 +++
- gio/tests/portal-support-snap.c         |  3 +++
- gio/tests/portal-support-utils.c        | 27 +++++++++++++++++++++++++
- gio/tests/portal-support-utils.h        |  2 ++
- 4 files changed, 35 insertions(+)
-
-diff --git a/gio/tests/portal-support-snap-classic.c b/gio/tests/portal-support-snap-classic.c
-index 8c0ed90c2..5b67865e7 100644
---- a/gio/tests/portal-support-snap-classic.c
-+++ b/gio/tests/portal-support-snap-classic.c
-@@ -66,6 +66,9 @@ tests_teardown (SetupData *setup_data,
-   else
-     g_unsetenv ("SNAP");
- 
-+  cleanup_snapfiles (setup_data->snap_path);
-+  cleanup_snapfiles (setup_data->bin_path);
-+
-   g_clear_pointer (&setup_data->old_path, g_free);
-   g_clear_pointer (&setup_data->old_snap, g_free);
- }
-diff --git a/gio/tests/portal-support-snap.c b/gio/tests/portal-support-snap.c
-index 7dd14d82f..cd904678f 100644
---- a/gio/tests/portal-support-snap.c
-+++ b/gio/tests/portal-support-snap.c
-@@ -67,6 +67,9 @@ tests_teardown (SetupData *setup_data,
-   else
-     g_unsetenv ("SNAP");
- 
-+  cleanup_snapfiles (setup_data->snap_path);
-+  cleanup_snapfiles (setup_data->bin_path);
-+
-   g_clear_pointer (&setup_data->old_path, g_free);
-   g_clear_pointer (&setup_data->old_snap, g_free);
- }
-diff --git a/gio/tests/portal-support-utils.c b/gio/tests/portal-support-utils.c
-index ae7073a3a..b7ee22630 100644
---- a/gio/tests/portal-support-utils.c
-+++ b/gio/tests/portal-support-utils.c
-@@ -26,6 +26,33 @@
- #include <glib.h>
- #include <glib/gstdio.h>
- 
-+
-+void
-+cleanup_snapfiles (const gchar *path)
-+{
-+  GDir *dir = NULL;
-+  const gchar *entry;
-+
-+  dir = g_dir_open (path, 0, NULL);
-+  if (dir == NULL)
-+    {
-+      /* Assume it’s a file. Ignore failure. */
-+      (void) g_remove (path);
-+      return;
-+    }
-+
-+  while ((entry = g_dir_read_name (dir)) != NULL)
-+    {
-+      gchar *sub_path = g_build_filename (path, entry, NULL);
-+      cleanup_snapfiles (sub_path);
-+      g_free (sub_path);
-+    }
-+
-+  g_dir_close (dir);
-+
-+  g_rmdir (path);
-+}
-+
- void
- create_fake_snapctl (const char *path,
-                      const char *supported_op)
-diff --git a/gio/tests/portal-support-utils.h b/gio/tests/portal-support-utils.h
-index 40c035b43..defbdcd4e 100644
---- a/gio/tests/portal-support-utils.h
-+++ b/gio/tests/portal-support-utils.h
-@@ -23,6 +23,8 @@
- 
- #include <glib.h>
- 
-+void cleanup_snapfiles (const gchar *path);
-+
- void create_fake_snap_yaml (const char *snap_path,
-                             gboolean is_classic);
- 
--- 
-2.39.2
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch
deleted file mode 100644
index a881b25ef3e..00000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From d1a2117dc18dbcf87685891de7e2898108b66fc9 Mon Sep 17 00:00:00 2001
-From: Joan Bruguera <joanbrugueram@gmail.com>
-Date: Thu, 23 Mar 2023 02:24:30 +0000
-Subject: [PATCH] glocalfile: Sum apparent size only for files and symlinks
-
-Since GNU Coreutils 9.2 (commit 110bcd28386b1f47a4cd876098acb708fdcbbb25),
-`du --apparent-size` (including `du --bytes`) no longer counts all kinds of
-files (directories, FIFOs, etc.), but only those for which `st_size` in
-`struct stat` is defined by POSIX, namely regular files and symlinks
-(and also rarely supported memory objects).
-
-This aligns the behaviour of GLib's `G_FILE_MEASURE_APPARENT_SIZE` flag
-with the new GNU Coreutils `du` and correct POSIX use.
-
-Note that this may be a breaking change for some uses.
-
-Link: https://lists.gnu.org/archive/html/bug-coreutils/2023-03/msg00007.html
-Fixes: https://gitlab.gnome.org/GNOME/glib/-/issues/2965
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- gio/gioenums.h   |  3 +++
- gio/glocalfile.c | 37 +++++++++++++++++++++++++++++++++++++
- 2 files changed, 40 insertions(+)
-
-diff --git a/gio/gioenums.h b/gio/gioenums.h
-index 7fd74a43e..c820cd36d 100644
---- a/gio/gioenums.h
-+++ b/gio/gioenums.h
-@@ -224,6 +224,9 @@ typedef enum {
-  *   sizes.  Normally, the block-size is used, if available, as this is a
-  *   more accurate representation of disk space used.
-  *   Compare with `du --apparent-size`.
-+ *   Since GLib 2.78. and similarly to `du` since GNU Coreutils 9.2, this will
-+ *   ignore the sizes of file types other than regular files and links, as the
-+ *   sizes of other file types are not specified in a standard way.
-  * @G_FILE_MEASURE_NO_XDEV: Do not cross mount point boundaries.
-  *   Compare with `du -x`.
-  *
-diff --git a/gio/glocalfile.c b/gio/glocalfile.c
-index 67d4b99fb..dbb56902d 100644
---- a/gio/glocalfile.c
-+++ b/gio/glocalfile.c
-@@ -86,6 +86,9 @@
- #define FILE_READ_ONLY_VOLUME           0x00080000
- #endif
- 
-+#ifndef S_ISREG
-+#define S_ISREG(m) (((m) & _S_IFMT) == _S_IFREG)
-+#endif
- #ifndef S_ISDIR
- #define S_ISDIR(m) (((m) & _S_IFMT) == _S_IFDIR)
- #endif
-@@ -2777,6 +2780,39 @@ g_local_file_measure_size_of_contents (gint           fd,
-                                        MeasureState  *state,
-                                        GError       **error);
- 
-+/*
-+ * _g_stat_is_size_usable:
-+ * @buf: a #GLocalFileStat.
-+ *
-+ * Checks if the file type is such that the `st_size` field of `struct stat` is
-+ * well-defined by POSIX.
-+ * (see https://pubs.opengroup.org/onlinepubs/009696799/basedefs/sys/stat.h.html)
-+ *
-+ * This behaviour is aligned with `du` from GNU Coreutils 9.2+
-+ * (see https://lists.gnu.org/archive/html/bug-coreutils/2023-03/msg00007.html)
-+ * and makes apparent size sums well-defined; formerly, they depended on the
-+ * implementation, and could differ across filesystems.
-+ *
-+ * Returns: %TRUE if the size field is well-defined, %FALSE otherwise.
-+ **/
-+inline static gboolean
-+_g_stat_is_size_usable (const GLocalFileStat *buf)
-+{
-+#ifndef HAVE_STATX
-+  /* Memory objects are defined by POSIX, but are not supported by statx nor Windows */
-+#ifdef S_TYPEISSHM
-+  if (S_TYPEISSHM (buf))
-+    return TRUE;
-+#endif
-+#ifdef S_TYPEISTMO
-+  if (S_TYPEISTMO (buf))
-+    return TRUE;
-+#endif
-+#endif
-+
-+  return S_ISREG (_g_stat_mode (buf)) || S_ISLNK (_g_stat_mode (buf));
-+}
-+
- static gboolean
- g_local_file_measure_size_of_file (gint           parent_fd,
-                                    GSList        *name,
-@@ -2836,6 +2872,7 @@ g_local_file_measure_size_of_file (gint           parent_fd,
-     state->disk_usage += _g_stat_blocks (&buf) * G_GUINT64_CONSTANT (512);
-   else
- #endif
-+  if (_g_stat_is_size_usable (&buf))
-     state->disk_usage += _g_stat_size (&buf);
- 
-   if (S_ISDIR (_g_stat_mode (&buf)))
--- 
-2.39.2
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
new file mode 100644
index 00000000000..788f420d118
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -0,0 +1,32 @@
+From 9aa9574861fad39d0679025e35fe1e188345f685 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sat, 16 Sep 2023 22:28:27 +0200
+Subject: [PATCH] meson.build: do not enable pidfd features on native glib
+ builds
+
+We still use host distros like alma 8 with kernels older than 5.4,
+where these features are not implemented.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1c36993..bbf97fc 100644
+--- a/meson.build
++++ b/meson.build
+@@ -981,7 +981,8 @@ if cc.links('''#include <sys/syscall.h>
+                  waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
+                  return 0;
+                }''', name : 'pidfd_open(2) system call')
+-  glib_conf.set('HAVE_PIDFD', 1)
++  #requires kernel 5.4+
++  #glib_conf.set('HAVE_PIDFD', 1)
+ endif
+ 
+ # Check for __uint128_t (gcc) by checking for 128-bit division
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 3dba599fc0b..841fedef8af 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 38e401969a2ff8269919cbeacec733a67f041735 Mon Sep 17 00:00:00 2001
+From b90d13900dd2777c2ab90c5b0be1a872c10a17da Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -13,25 +13,28 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Port patch to 2.48
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
 ---
- gio/giomodule.c | 5 -----
- 1 file changed, 5 deletions(-)
+ gio/giomodule.c | 7 -------
+ 1 file changed, 7 deletions(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index 11ce7d8..cc27ecd 100644
+index 17fabe6..8021208 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -1271,9 +1271,6 @@ get_gio_module_dir (void)
+@@ -1271,11 +1271,6 @@ get_gio_module_dir (void)
        g_free (install_dir);
  #else
        module_dir = g_strdup (GIO_MODULE_DIR);
 -#ifdef __APPLE__
 -#include "TargetConditionals.h"
--#if TARGET_OS_OSX
+-/* Only auto-relocate on macOS, not watchOS etc; older macOS SDKs only define TARGET_OS_MAC */
+-#if (defined (TARGET_OS_OSX) && TARGET_OS_OSX) || \
+-     (!defined (TARGET_OS_OSX) && defined (TARGET_OS_MAC) && TARGET_OS_MAC)
  #include <dlfcn.h>
        {
          g_autofree gchar *path = NULL;
-@@ -1292,8 +1289,6 @@ get_gio_module_dir (void)
+@@ -1294,8 +1289,6 @@ get_gio_module_dir (void)
                }
            }
        }
@@ -40,6 +43,3 @@ index 11ce7d8..cc27ecd 100644
  #endif
      }
  
--- 
-2.30.2
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb
similarity index 87%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb
index 64a3c6d80cf..500e4e873e9 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb
@@ -14,12 +14,12 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
-           file://0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch \
-           file://0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch \
            "
-SRC_URI:append:class-native = " file://relocate-modules.patch"
+SRC_URI:append:class-native = " file://relocate-modules.patch \ 
+                                file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
+                              "
 
-SRC_URI[sha256sum] = "5a5a191c96836e166a7771f7ea6ca2b0069c603c7da3cba1cd38d1694a395dda"
+SRC_URI[sha256sum] = "44eaab8b720877ce303c5540b657b126f12dc94972d9880b52959f43fb537b30"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 878dd107de4..c314594d493 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -54,6 +54,7 @@ FILES:${PN} = "${libdir}/lib*${SOLIBS} \
                ${libdir}/gio \
                ${libexecdir}/*gio-querymodules \
                ${libexecdir}/*gio-launch-desktop \
+               ${datadir}/glib-2.0/dtds \
                ${datadir}/glib-2.0/schemas"
 
 FILES:${PN}-utils += "${bindir}/glib-genmarshal \
-- 
2.30.2


