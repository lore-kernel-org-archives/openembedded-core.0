Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web08.1050.1603478624225001823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FyuGGbLG;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id c16so2992885wmd.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=89TaqWHKpvtcUBvarlLOJ+OoLSobE/wzZ2IUzXkjNNw=;
        b=FyuGGbLGr+GQJPDnfVaMibN/jIfwbh8hL42WLE1kbgcqxZiMWMXz5wSeiaUsKSPRFX
         IhOOOaVYGiTIlv9Kj+phZOMdaBxxRAfXd3O4IgYRMqYqf+PHL2ZLGI+yf62/MzG/65VF
         pRVwMWToRTWx66zDxLczMDZnIY9zs3kTdO9OinvQ5Kye1yIpvBg/TUNtsyngHDU2ZEEf
         9aoJr0YBXSr8wA/GvZzwkPFWv8ABE26mo1y6iF230bcX0N5Ay83lWsOEaC9o1WbtexCC
         exnscWYMmvLVh7OpRTDghceOY1QTlnjtgqmBBEAghVEUTY7FVT1aEQWmyEsZBH06K3wr
         PpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=89TaqWHKpvtcUBvarlLOJ+OoLSobE/wzZ2IUzXkjNNw=;
        b=K9EXxVt77RUw4dUvEpGyOzLlrBCsFfWSRtB7WjtcEkbDFgKqfHZrQxBfUru/qlk2Pm
         LdXcExI2cTRlLGJcMikfX3AWTQNsuXJP+95jcN+rS2iIWKR3CTNrDroaW6sDrJgUPwVK
         9EPo01/lKeEDUeR3774iK6igucD5ZBQuSAbs3J0tTMOHUKYRiElOmyRONZGtYrG8dn9V
         BAawFqjbg3fWIaBkD6j050GpSfc/5b5JT4GTgTQNc7O42+XZ59uYoY9z24S423ZbJwOL
         IvYWI+iyKxcadrzVaR+Ha+fO/jcxNCcWpEvjVLnjp/3S9ithuy8dBF2I8cpultPXaEq0
         DTnQ==
X-Gm-Message-State: AOAM532cztFQNumJ/a9PvgDZ/eE7Jg1PijZJSFDOp9yxMDoaRsEFLQ4h
	8oH3RAvoZodbwp8ckFA7OT5rtYO+WsHVYw==
X-Google-Smtp-Source: ABdhPJxEHeqBn9O4qjMHlvBwSQ7iYlMmXys3vnSaAUYya/gwlfAuLN8KceGh0yGC0YEO0uk56k8o9g==
X-Received: by 2002:a1c:41d6:: with SMTP id o205mr3581024wma.152.1603478621845;
        Fri, 23 Oct 2020 11:43:41 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:43:41 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 01/21] gstreamer1.0: upgrade to version 1.18.0
Date: Fri, 23 Oct 2020 19:41:12 +0100
Message-Id: <20201023184132.3208737-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    * 0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
      Submited
      https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669

    * 0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch
      Removed since these are included in 1.18.0

    * 0003-meson-Add-valgrind-feature.patch
      Removed because upstream don't depend anymore on valgrind
      https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595

    * 0002-Remove-unused-valgrind-detection.patch
      Upstream-Status: Backport [a2cbf75523cdf8a4df1baa7007d86ef455972245]
      https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/a2cbf75523cdf8a4df1baa7007d86ef455972245

    API and plugin documentation are no longer built with gtk_doc.
    The gtk_doc documentation has been removed in favour of a new unified
    documentation module built with hotdoc.
    Distributors should use the documentation release tarball instead of trying
    to package hotdoc and building the documentation from scratch.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...der.c-when-env-var-is-set-do-not-fal.patch |  16 +--
 ...002-Remove-unused-valgrind-detection.patch | 112 ++++++++++++++++++
 ...even-when-cross-compiling-if-introsp.patch |  36 ------
 ...eson-Add-option-for-installed-tests.patch} |  20 ++--
 .../0003-meson-Add-valgrind-feature.patch     |  74 ------------
 .../gstreamer/gstreamer1.0/0004-capfix.patch  |  48 ++++++++
 .../gstreamer/gstreamer1.0/capfix.patch       |  37 ------
 ...er1.0_1.16.2.bb => gstreamer1.0_1.18.0.bb} |  25 ++--
 8 files changed, 188 insertions(+), 180 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-meson-Add-option-for-installed-tests.patch => 0003-meson-Add-option-for-installed-tests.patch} (97%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valgrind-feature.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.2.bb => gstreamer1.0_1.18.0.bb} (77%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
index 67a872cddb..17f8a0beb7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
@@ -1,7 +1,7 @@
-From a1d7c582392c8bc87fa9411af77b20e011944357 Mon Sep 17 00:00:00 2001
+From f700975f514758a4a7582c2c972fa54ecfca3302 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 25 Jan 2018 17:55:02 +0200
-Subject: [PATCH] gst/gstpluginloader.c: when env var is set do not fall
+Subject: [PATCH 1/4] gst/gstpluginloader.c: when env var is set do not fall
  through to system plugin scanner
 
 If we set a custom GST_PLUGIN_SCANNER env var, then we probably want to use that and only that.
@@ -9,17 +9,19 @@ If we set a custom GST_PLUGIN_SCANNER env var, then we probably want to use that
 Falling through to the one installed on the system is problamatic in cross-compilation
 environemnts, regardless of whether one pointed to by the env var succeeded or failed.
 
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+written by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669]
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
  gst/gstpluginloader.c | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/gst/gstpluginloader.c b/gst/gstpluginloader.c
-index 430829d..3a75731 100644
+index d1e404d..2e00c3c 100644
 --- a/gst/gstpluginloader.c
 +++ b/gst/gstpluginloader.c
-@@ -471,9 +471,7 @@ gst_plugin_loader_spawn (GstPluginLoader * loader)
+@@ -475,9 +475,7 @@ gst_plugin_loader_spawn (GstPluginLoader * loader)
      helper_bin = g_strdup (env);
      res = gst_plugin_loader_try_helper (loader, helper_bin);
      g_free (helper_bin);
@@ -31,5 +33,5 @@ index 430829d..3a75731 100644
  
  #ifdef G_OS_WIN32
 -- 
-2.15.1
+2.28.0
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
new file mode 100644
index 0000000000..c8bd58d471
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
@@ -0,0 +1,112 @@
+From 355dd938bfb2cd36d6c3c4ed59ba1dcafdc78d95 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
+Date: Fri, 14 Aug 2020 16:38:26 +0100
+Subject: [PATCH 2/4] Remove unused valgrind detection
+
+Having this just to log a debug message in case we're
+running inside valgrind doesn't seem very useful, and
+the code that used to use this no longer exists it seems.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595>
+
+Upstream-Status: Backport [a2cbf75523cdf8a4df1baa7007d86ef455972245]
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ gst/gst_private.h |  2 --
+ gst/gstinfo.c     | 39 ---------------------------------------
+ meson.build       |  1 -
+ 3 files changed, 42 deletions(-)
+
+diff --git a/gst/gst_private.h b/gst/gst_private.h
+index 1b0f02b..a8897e1 100644
+--- a/gst/gst_private.h
++++ b/gst/gst_private.h
+@@ -116,8 +116,6 @@ G_GNUC_INTERNAL  gboolean _priv_plugin_deps_env_vars_changed (GstPlugin * plugin
+ 
+ G_GNUC_INTERNAL  gboolean _priv_plugin_deps_files_changed (GstPlugin * plugin);
+ 
+-G_GNUC_INTERNAL  gboolean _priv_gst_in_valgrind (void);
+-
+ /* init functions called from gst_init(). */
+ G_GNUC_INTERNAL  void  _priv_gst_quarks_initialize (void);
+ G_GNUC_INTERNAL  void  _priv_gst_mini_object_initialize (void);
+diff --git a/gst/gstinfo.c b/gst/gstinfo.c
+index 37987d3..15f522e 100644
+--- a/gst/gstinfo.c
++++ b/gst/gstinfo.c
+@@ -304,36 +304,6 @@ static gboolean pretty_tags = PRETTY_TAGS_DEFAULT;
+ static volatile gint G_GNUC_MAY_ALIAS __default_level = GST_LEVEL_DEFAULT;
+ static volatile gint G_GNUC_MAY_ALIAS __use_color = GST_DEBUG_COLOR_MODE_ON;
+ 
+-/* FIXME: export this? */
+-gboolean
+-_priv_gst_in_valgrind (void)
+-{
+-  static enum
+-  {
+-    GST_VG_UNCHECKED,
+-    GST_VG_NO_VALGRIND,
+-    GST_VG_INSIDE
+-  }
+-  in_valgrind = GST_VG_UNCHECKED;
+-
+-  if (in_valgrind == GST_VG_UNCHECKED) {
+-#ifdef HAVE_VALGRIND_VALGRIND_H
+-    if (RUNNING_ON_VALGRIND) {
+-      GST_CAT_INFO (GST_CAT_GST_INIT, "we're running inside valgrind");
+-      in_valgrind = GST_VG_INSIDE;
+-    } else {
+-      GST_CAT_LOG (GST_CAT_GST_INIT, "not doing extra valgrind stuff");
+-      in_valgrind = GST_VG_NO_VALGRIND;
+-    }
+-#else
+-    in_valgrind = GST_VG_NO_VALGRIND;
+-#endif
+-    g_assert (in_valgrind == GST_VG_NO_VALGRIND ||
+-        in_valgrind == GST_VG_INSIDE);
+-  }
+-  return (in_valgrind == GST_VG_INSIDE);
+-}
+-
+ static gchar *
+ _replace_pattern_in_gst_debug_file_name (gchar * name, const char *token,
+     guint val)
+@@ -462,9 +432,6 @@ _priv_gst_debug_init (void)
+   _priv_GST_CAT_PROTECTION =
+       _gst_debug_category_new ("GST_PROTECTION", 0, "protection");
+ 
+-  /* print out the valgrind message if we're in valgrind */
+-  _priv_gst_in_valgrind ();
+-
+   env = g_getenv ("GST_DEBUG_OPTIONS");
+   if (env != NULL) {
+     if (strstr (env, "full_tags") || strstr (env, "full-tags"))
+@@ -2502,12 +2469,6 @@ gst_debug_construct_win_color (guint colorinfo)
+   return 0;
+ }
+ 
+-gboolean
+-_priv_gst_in_valgrind (void)
+-{
+-  return FALSE;
+-}
+-
+ void
+ _gst_debug_dump_mem (GstDebugCategory * cat, const gchar * file,
+     const gchar * func, gint line, GObject * obj, const gchar * msg,
+diff --git a/meson.build b/meson.build
+index f95b4f7..143c043 100644
+--- a/meson.build
++++ b/meson.build
+@@ -200,7 +200,6 @@ check_headers = [
+   'sys/wait.h',
+   'ucontext.h',
+   'unistd.h',
+-  'valgrind/valgrind.h',
+   'sys/resource.h',
+   'sys/uio.h',
+ ]
+-- 
+2.28.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch
deleted file mode 100644
index 1ed7198a5c..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 35db4a2433fbdf8612cf98b5aab5b14aeb5372f8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
-Date: Thu, 17 Oct 2019 12:13:35 +0100
-Subject: [PATCH] meson: build gir even when cross-compiling if introspection
- was enabled explicitly
-
-This can be made to work in certain circumstances when
-cross-compiling, so default to not building g-i stuff
-when cross-compiling, but allow it if introspection was
-enabled explicitly via -Dintrospection=enabled.
-
-Fixes #454 and #381.
-
-Upstream-Status: Backport [35db4a2433fbdf8612cf98b5aab5b14aeb5372f8]
-
-Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 90d98d8eb..a47e7f34e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -466,7 +466,7 @@ rt_lib = cc.find_library('rt', required : false)
- gir = find_program('g-ir-scanner', required : get_option('introspection'))
- gnome = import('gnome')
- 
--build_gir = gir.found() and not meson.is_cross_build()
-+build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
- 
- gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
-     'g_setenv("GST_REGISTRY_DISABLE", "yes", TRUE);' + \
--- 
-2.17.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch
index 0e6c44ea32..1c0e1f8171 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch
@@ -1,7 +1,7 @@
-From b843400284751968862751dfe93853f151551c64 Mon Sep 17 00:00:00 2001
+From 24867db22a5cc35e7643bc218e959ce56c306aca Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Fri, 25 Oct 2019 00:06:26 +0200
-Subject: [PATCH] meson: Add option for installed tests
+Subject: [PATCH 3/4] meson: Add option for installed tests
 
 This adds an option for producing installed versions of the unit tests.
 These versions don't need meson to run (only a small shell script). This
@@ -77,10 +77,10 @@ index 0000000..5da86fb
 +write_template(args.output, build_template(args.test_execdir, args.testname))
 +os.chmod(args.output, 0o755)
 diff --git a/meson_options.txt b/meson_options.txt
-index 8afde39..8884dcc 100644
+index 72c3997..346c423 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -16,6 +16,8 @@ option('poisoning', type : 'boolean', value : false, description : 'Enable poiso
+@@ -15,6 +15,8 @@ option('poisoning', type : 'boolean', value : false, description : 'Enable poiso
  option('memory-alignment', type: 'combo',
         choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256', '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
         value: 'malloc')
@@ -90,10 +90,10 @@ index 8afde39..8884dcc 100644
  # Feature options
  option('check', type : 'feature', value : 'auto', description : 'Build unit test libraries')
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index 04da83f..2db7f76 100644
+index 372ea41..bb0dcfa 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
-@@ -118,11 +118,17 @@ if add_languages('cpp', required : false)
+@@ -120,11 +120,17 @@ if add_languages('cpp', native: false, required: false)
    ]
  endif
  
@@ -109,10 +109,10 @@ index 04da83f..2db7f76 100644
    '-DGST_CHECK_TEST_ENVIRONMENT_BEACON="GST_STATE_IGNORE_ELEMENTS"',
 -  '-DTESTFILE="' + meson.current_source_dir() + '/meson.build"',
 +  '-DTESTFILE="@0@"'.format(test_files_path + '/testfile'),
-   '-DGST_USE_UNSTABLE_API',
    '-DGST_DISABLE_DEPRECATED',
  ]
-@@ -137,6 +143,14 @@ endif
+ 
+@@ -138,6 +144,14 @@ endif
  glib_deps = [gio_dep, gobject_dep, gmodule_dep, glib_dep]
  gst_deps = [gst_dep, gst_base_dep, gst_check_dep, gst_net_dep, gst_controller_dep]
  
@@ -127,7 +127,7 @@ index 04da83f..2db7f76 100644
  foreach t : core_tests
    fname = t[0]
    test_name = fname.split('.')[0].underscorify()
-@@ -150,8 +164,38 @@ foreach t : core_tests
+@@ -151,8 +165,38 @@ foreach t : core_tests
          include_directories : [configinc],
          link_with : link_with_libs,
          dependencies : test_deps + glib_deps + gst_deps,
@@ -253,5 +253,5 @@ index 0000000..89954e0
 +................................................................................
 +................................................................................
 -- 
-2.17.1
+2.28.0
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valgrind-feature.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valgrind-feature.patch
deleted file mode 100644
index f553340f4d..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valgrind-feature.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From f6c7973c03d9ba7dab60c496e768c5e6c4ee824c Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <crg7475@mailbox.org>
-Date: Sun, 20 Oct 2019 10:36:44 +0200
-Subject: [PATCH] meson: Add valgrind feature
-
-This allows for enabling/disabling Valgrind support. Since Valgrind is
-an external dependency, such a feature is needed by build environemnts
-such as Yocto to make sure builds are deterministic. These changes also
-add more Valgrind specific configure log output.
-
-Upstream-Status: Pending
-
-Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
----
- meson.build       | 23 ++++++++++++++++++++++-
- meson_options.txt |  1 +
- 2 files changed, 23 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index b55ecc5..4751761 100644
---- a/meson.build
-+++ b/meson.build
-@@ -199,7 +199,6 @@ check_headers = [
-   'sys/wait.h',
-   'ucontext.h',
-   'unistd.h',
--  'valgrind/valgrind.h',
-   'sys/resource.h',
- ]
- 
-@@ -214,6 +213,28 @@ foreach h : check_headers
-   endif
- endforeach
- 
-+valgrind_option = get_option('valgrind')
-+if valgrind_option.disabled()
-+  message('Valgrind support not requested; disabled.')
-+else
-+  valgrind_header = 'valgrind/valgrind.h'
-+  has_valgrind_header = cc.has_header(valgrind_header)
-+  if has_valgrind_header
-+    message('Valgrind support requested, and header ' + valgrind_header + \
-+        ' found. Enabled Valgrind support.')
-+    define = 'HAVE_' + valgrind_header.underscorify().to_upper()
-+    cdata.set(define, 1)
-+  else
-+    if valgrind_option.enabled()
-+      error('Valgrind support requested and set as required, but header ' + \
-+        valgrind_header + ' not found.')
-+    else
-+      message('Valgrind support requested, but header ' + valgrind_header + \
-+        ' not found. Disabling Valgrind support.')
-+    endif
-+  endif
-+endif
-+
- if cc.has_member('struct tm', 'tm_gmtoff', prefix : '#include <time.h>')
-   cdata.set('HAVE_TM_GMTOFF', 1)
- endif
-diff --git a/meson_options.txt b/meson_options.txt
-index e7ff7ba..8afde39 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -19,6 +19,7 @@ option('memory-alignment', type: 'combo',
- 
- # Feature options
- option('check', type : 'feature', value : 'auto', description : 'Build unit test libraries')
-+option('valgrind', type : 'feature', value : 'auto', description : 'Enable Valgrind support')
- option('libunwind', type : 'feature', value : 'auto', description : 'Use libunwind to generate backtraces')
- option('libdw', type : 'feature', value : 'auto', description : 'Use libdw to generate better backtraces from libunwind')
- option('dbghelp', type : 'feature', value : 'auto', description : 'Use dbghelp to generate backtraces')
--- 
-2.17.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.patch
new file mode 100644
index 0000000000..32e9610cff
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.patch
@@ -0,0 +1,48 @@
+From 9607e9858d681f5ad2e1677f5dbbb1fb61bd8846 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Sun, 18 Oct 2020 10:40:59 +0100
+Subject: [PATCH 4/4] Currently gstreamer configuration depends on whether
+ setcap is found on the host system. Turn this into a configure option to make
+ builds deterinistic.
+
+RP 2020/2/19
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+---
+ libs/gst/helpers/meson.build | 7 ++++++-
+ meson_options.txt            | 1 +
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/libs/gst/helpers/meson.build b/libs/gst/helpers/meson.build
+index 9e5a4ae..c2e540f 100644
+--- a/libs/gst/helpers/meson.build
++++ b/libs/gst/helpers/meson.build
+@@ -66,7 +66,12 @@ if have_ptp
+       description : 'getifaddrs() and AF_LINK is available')
+   endif
+ 
+-  setcap_prog = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
++  setcap_feature = get_option('setcap')
++  if setcap_feature.disabled()
++    setcap_prog = find_program('dontexist', required : false)
++  else
++    setcap_prog = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
++  endif
+   cap_dep = dependency('libcap', required: false)
+ 
+   # user/group to change to in gst-ptp-helper
+diff --git a/meson_options.txt b/meson_options.txt
+index 346c423..03338ad 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -25,6 +25,7 @@ option('libdw', type : 'feature', value : 'auto', description : 'Use libdw to ge
+ option('dbghelp', type : 'feature', value : 'auto', description : 'Use dbghelp to generate backtraces')
+ option('bash-completion', type : 'feature', value : 'auto', description : 'Install bash completion files')
+ option('coretracers', type : 'feature', value : 'auto', description : 'Build coretracers plugin')
++option('setcap', type : 'feature', value : 'auto', description : 'Use setcap')
+ 
+ # Common feature options
+ option('examples', type : 'feature', value : 'auto', yield : true)
+-- 
+2.28.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
deleted file mode 100644
index 7ca3d5ad4a..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Currently gstreamer configuration depends on whether setcap is found on the host
-system. Turn this into a configure option to make builds deterinistic.
-
-RP 2020/2/19
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
-
-Index: gstreamer-1.16.1/libs/gst/helpers/meson.build
-===================================================================
---- gstreamer-1.16.1.orig/libs/gst/helpers/meson.build
-+++ gstreamer-1.16.1/libs/gst/helpers/meson.build
-@@ -73,7 +73,12 @@ if have_ptp
-     endif
-   endif
- 
--  setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
-+  setcap_feature = get_option('setcap')
-+  if setcap_feature.disabled()
-+    setcap = find_program('dontexist', required : false)
-+  else
-+    setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap', required : false)
-+  endif
- 
-   # user/group to change to in gst-ptp-helper
-   ptp_helper_setuid_user = get_option('ptp-helper-setuid-user')
-Index: gstreamer-1.16.1/meson_options.txt
-===================================================================
---- gstreamer-1.16.1.orig/meson_options.txt
-+++ gstreamer-1.16.1/meson_options.txt
-@@ -26,6 +26,7 @@ option('libunwind', type : 'feature', va
- option('libdw', type : 'feature', value : 'auto', description : 'Use libdw to generate better backtraces from libunwind')
- option('dbghelp', type : 'feature', value : 'auto', description : 'Use dbghelp to generate backtraces')
- option('bash-completion', type : 'feature', value : 'auto', description : 'Install bash completion files')
-+option('setcap', type : 'feature', value : 'auto', description : 'Use setcap')
- 
- # Common feature options
- option('examples', type : 'feature', value : 'auto', yield : true)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
similarity index 77%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
index 50a872e292..8f7dfc6079 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
@@ -8,23 +8,20 @@ LICENSE = "LGPLv2+"
 
 DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-native"
 
-inherit meson pkgconfig gettext upstream-version-is-even gobject-introspection gtk-doc
+inherit meson pkgconfig gettext upstream-version-is-even gobject-introspection
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
 
 S = "${WORKDIR}/gstreamer-${PV}"
 
-SRC_URI = " \
-    https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
-    file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
-    file://0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
-    file://0003-meson-Add-valgrind-feature.patch \
-    file://0004-meson-Add-option-for-installed-tests.patch \
-    file://capfix.patch \
-"
-SRC_URI[md5sum] = "0e661ed5bdf1d8996e430228d022628e"
-SRC_URI[sha256sum] = "e3f044246783fd685439647373fa13ba14f7ab0b346eadd06437092f8419e94e"
+SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
+           file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
+           file://0002-Remove-unused-valgrind-detection.patch \
+           file://0003-meson-Add-option-for-installed-tests.patch \
+           "
+SRC_URI[md5sum] = "25d683630ff8b82b2c878aa3edd3c491"
+SRC_URI[sha256sum] = "0ff09245b06c0aeb5d9a156edcab088a7e8213a0bf9c84a1ff0318f9c00c7805"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
@@ -35,7 +32,6 @@ PACKAGECONFIG[debug] = "-Dgst_debug=true,-Dgst_debug=false"
 PACKAGECONFIG[tracer-hooks] = "-Dtracer_hooks=true,-Dtracer_hooks=false"
 PACKAGECONFIG[check] = "-Dcheck=enabled,-Dcheck=disabled"
 PACKAGECONFIG[tests] = "-Dtests=enabled -Dinstalled-tests=true,-Dtests=disabled -Dinstalled-tests=false"
-PACKAGECONFIG[valgrind] = "-Dvalgrind=enabled,-Dvalgrind=disabled,valgrind,"
 PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 PACKAGECONFIG[dw] = "-Dlibdw=enabled,-Dlibdw=disabled,elfutils"
 PACKAGECONFIG[bash-completion] = "-Dbash-completion=enabled,-Dbash-completion=disabled,bash-completion"
@@ -52,15 +48,12 @@ def gettext_oemeson(d):
     return '-Dnls=enabled'
 
 EXTRA_OEMESON += " \
+    -Ddoc=disabled \
     -Dexamples=disabled \
     -Ddbghelp=disabled \
     ${@gettext_oemeson(d)} \
 "
 
-GTKDOC_MESON_OPTION = "gtk_doc"
-GTKDOC_MESON_ENABLE_FLAG = "enabled"
-GTKDOC_MESON_DISABLE_FLAG = "disabled"
-
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-- 
2.29.0

