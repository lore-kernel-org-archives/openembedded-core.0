Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D48CC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:48 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.16391.1644196126623905678
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D3ZExJ1x;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso2218829wme.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3mOSjMpKbHILeVv7PwO2UQQwG1jkwc97rqrpVW2/eEE=;
        b=D3ZExJ1xgNmuddvP/vn0j+kpj/sLRWPPHTbVZoU4BbxB8gnuZzcLXcJF1WlAdGcVi3
         W5Gpd764N6OpzHfTjEVADkjNdjhjxLO7Y2kVx4s+jWZ9xxEhpoh1MCMPfzs43RIi+1he
         2YuxbQ/VeTPECTEbfk6YN20qHDTm4ZJvMQv8tEROCRcaehJKit/CK1+BrhNCQs/M295F
         mll9sYi0GoaNa40T80HQHvQKoQ7d6fRBNN+HV7q1pZs8/8tf+/9N97PX5xv8QftPf7be
         g57+rovlTorZG/XzXrBjvYz1HTt63Ab7jevH52NGJly7Waea9wotPz5bvra2nl7k70oe
         LMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3mOSjMpKbHILeVv7PwO2UQQwG1jkwc97rqrpVW2/eEE=;
        b=Zyb+P+9G3r1JjJQ+N1A2McTQ9kCoVK9yEZC50RKH0Il1dWSIEzYLglztbrz+0R5N9T
         y9ZbQMH5DLAmfhBUF7cM/LLf06I5bB6ghGiIJFZFGB/l6ptkAJE5PsjT+Fn2cpW8BGGi
         04nfpF3RtJT/Sqx3AXIyUOGAWbpg5W98XC+Mgucx+4lthwD/BHlCgvAFE8PfSRCu2Fs7
         EheEuKH1VmY8lY4jf7bDgooQygT7VHhB+oRtriSX6Bnn2+QCkPtdGE6r8cJKVy/u+Pif
         lCmooWyaCqYXxih8An+iUxwDqqQK6upqKhGyGUeh/3X967ncOELH20Y7TXt6so8mz6Zy
         maOQ==
X-Gm-Message-State: AOAM532Vm2J8L2wgLCLBq+m/zuDZoVSL92IIGDNTHC7FURjZZ2nbfIzq
	Qqxm4dZGVTMaHb3Z/yi9dwJZYOZGqVs=
X-Google-Smtp-Source: 
 ABdhPJw11g750iQ64PveVvatFMCujnQ4elriYfOHEFJJYuJJA0gPUemM47ZgQQ8gnf3/bh9o/jLLPA==
X-Received: by 2002:a05:600c:34c6:: with SMTP id
 d6mr12453746wmq.103.1644196124830;
        Sun, 06 Feb 2022 17:08:44 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:44 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 07/17] gstreamer1.0: upgrade 1.18.5 -> 1.20.0
Date: Mon,  7 Feb 2022 01:08:13 +0000
Message-Id: <20220207010823.143664-7-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161427

- License update:
  The code actually is LGPLv2.1 but the COPYING file is wrong.
  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d157b23fb0ce175b167611a4cb019599d9017042

- Drop backported patches
  0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
  0002-Remove-unused-valgrind-detection.patch
  0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch

- Update submitted patches
  0001-tests-respect-the-idententaion-used-in-meson.patch
  0002-tests-add-support-for-install-the-tests.patch
  0003-tests-use-a-dictionaries-for-environment.patch
  0004-tests-add-helper-script-to-run-the-installed_tests.patch

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...der.c-when-env-var-is-set-do-not-fal.patch |  69 -----------
 ...pect-the-idententaion-used-in-meson.patch} |  14 +--
 ...002-Remove-unused-valgrind-detection.patch | 112 ------------------
 ...s-add-support-for-install-the-tests.patch} |  67 ++++++-----
 ...-use-too-strict-timeout-for-validati.patch |  32 -----
 ...-use-a-dictionaries-for-environment.patch} |  28 +++--
 ...er-script-to-run-the-installed_tests.patch |  74 ++++++++++++
 ...-the-environment-for-installed_tests.patch |  58 ---------
 ...er1.0_1.18.5.bb => gstreamer1.0_1.20.0.bb} |  17 ++-
 9 files changed, 136 insertions(+), 335 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-tests-respect-the-idententaion-used-in-meson.patch => 0001-tests-respect-the-idententaion-used-in-meson.patch} (71%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0005-tests-add-support-for-install-the-tests.patch => 0002-tests-add-support-for-install-the-tests.patch} (65%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0006-tests-use-a-dictionaries-for-environment.patch => 0003-tests-use-a-dictionaries-for-environment.patch} (61%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-environment-for-installed_tests.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.5.bb => gstreamer1.0_1.20.0.bb} (76%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
deleted file mode 100644
index 23ebd5c600..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From fd8f49dba8c09d47425da80f5faab3bfa4a7c962 Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <quaresma.jose@gmail.com>
-Date: Sat, 10 Oct 2020 19:09:03 +0000
-Subject: [PATCH 1/3] gstpluginloader: when env var is set do not fall through
- to system plugin scanner
-
-If we set a custom GST_PLUGIN_SCANNER env var, then we probably want to use that and only that.
-
-Falling through to the one installed on the system is problamatic in cross-compilation
-environemnts, regardless of whether one pointed to by the env var succeeded or failed.
-
-taken from:
-http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch?id=0db7ba34ca41b107042306d13a6f0162885c123b
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669>
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9f958058697e6fbf5bde325228034572331d1a3a]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- gst/gstpluginloader.c | 15 +++++++--------
- 1 file changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/gst/gstpluginloader.c b/gst/gstpluginloader.c
-index d1e404d98..c626bf263 100644
---- a/gst/gstpluginloader.c
-+++ b/gst/gstpluginloader.c
-@@ -464,20 +464,19 @@ gst_plugin_loader_spawn (GstPluginLoader * loader)
-   if (loader->child_running)
-     return TRUE;
- 
--  /* Find the gst-plugin-scanner: first try the env-var if it is set,
--   * otherwise use the installed version */
-+  /* Find the gst-plugin-scanner */
-   env = g_getenv ("GST_PLUGIN_SCANNER_1_0");
-   if (env == NULL)
-     env = g_getenv ("GST_PLUGIN_SCANNER");
- 
-   if (env != NULL && *env != '\0') {
-+    /* use the env-var if it is set */
-     GST_LOG ("Trying GST_PLUGIN_SCANNER env var: %s", env);
-     helper_bin = g_strdup (env);
-     res = gst_plugin_loader_try_helper (loader, helper_bin);
-     g_free (helper_bin);
--  }
--
--  if (!res) {
-+  } else {
-+    /* use the installed version */
-     GST_LOG ("Trying installed plugin scanner");
- 
- #ifdef G_OS_WIN32
-@@ -497,10 +496,10 @@ gst_plugin_loader_spawn (GstPluginLoader * loader)
- #endif
-     res = gst_plugin_loader_try_helper (loader, helper_bin);
-     g_free (helper_bin);
-+  }
- 
--    if (!res) {
--      GST_INFO ("No gst-plugin-scanner available, or not working");
--    }
-+  if (!res) {
-+    GST_INFO ("No gst-plugin-scanner available, or not working");
-   }
- 
-   return loader->child_running;
--- 
-2.29.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
similarity index 71%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-the-idententaion-used-in-meson.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
index 6f571a12d8..312c04fbfd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-the-idententaion-used-in-meson.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch
@@ -1,4 +1,4 @@
-From 122e5ac3dd16a461b6ae595605490c8f5d1c3a9d Mon Sep 17 00:00:00 2001
+From 1eb77a4ea5a3967c688d8f1192f99c605badc7e2 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH 1/4] tests: respect the idententaion used in meson
@@ -7,13 +7,13 @@ Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
- tests/check/meson.build | 10 +++++-----
+ subprojects/gstreamer/tests/check/meson.build | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
-diff --git a/tests/check/meson.build b/tests/check/meson.build
-index a617cf159..b2636714b 100644
---- a/tests/check/meson.build
-+++ b/tests/check/meson.build
+diff --git a/subprojects/gstreamer/tests/check/meson.build b/subprojects/gstreamer/tests/check/meson.build
+index 9c4228b6e4..506606684d 100644
+--- a/subprojects/gstreamer/tests/check/meson.build
++++ b/subprojects/gstreamer/tests/check/meson.build
 @@ -146,11 +146,11 @@ foreach t : core_tests
  
    if not skip_test
@@ -32,5 +32,5 @@ index a617cf159..b2636714b 100644
  
      env = environment()
 -- 
-2.31.1
+2.33.1
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
deleted file mode 100644
index 5121044734..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From e275ba2bd854ac15a4b65a8f07d9f042021950da Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
-Date: Fri, 14 Aug 2020 16:38:26 +0100
-Subject: [PATCH 2/3] Remove unused valgrind detection
-
-Having this just to log a debug message in case we're
-running inside valgrind doesn't seem very useful, and
-the code that used to use this no longer exists it seems.
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595>
-
-Upstream-Status: Backport [a2cbf75523cdf8a4df1baa7007d86ef455972245]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- gst/gst_private.h |  2 --
- gst/gstinfo.c     | 39 ---------------------------------------
- meson.build       |  1 -
- 3 files changed, 42 deletions(-)
-
-diff --git a/gst/gst_private.h b/gst/gst_private.h
-index eefd044..8252ede 100644
---- a/gst/gst_private.h
-+++ b/gst/gst_private.h
-@@ -116,8 +116,6 @@ G_GNUC_INTERNAL  gboolean _priv_plugin_deps_env_vars_changed (GstPlugin * plugin
- 
- G_GNUC_INTERNAL  gboolean _priv_plugin_deps_files_changed (GstPlugin * plugin);
- 
--G_GNUC_INTERNAL  gboolean _priv_gst_in_valgrind (void);
--
- /* init functions called from gst_init(). */
- G_GNUC_INTERNAL  void  _priv_gst_quarks_initialize (void);
- G_GNUC_INTERNAL  void  _priv_gst_mini_object_initialize (void);
-diff --git a/gst/gstinfo.c b/gst/gstinfo.c
-index eea1a21..d3035d6 100644
---- a/gst/gstinfo.c
-+++ b/gst/gstinfo.c
-@@ -305,36 +305,6 @@ static gboolean pretty_tags = PRETTY_TAGS_DEFAULT;
- static gint G_GNUC_MAY_ALIAS __default_level = GST_LEVEL_DEFAULT;
- static gint G_GNUC_MAY_ALIAS __use_color = GST_DEBUG_COLOR_MODE_ON;
- 
--/* FIXME: export this? */
--gboolean
--_priv_gst_in_valgrind (void)
--{
--  static enum
--  {
--    GST_VG_UNCHECKED,
--    GST_VG_NO_VALGRIND,
--    GST_VG_INSIDE
--  }
--  in_valgrind = GST_VG_UNCHECKED;
--
--  if (in_valgrind == GST_VG_UNCHECKED) {
--#ifdef HAVE_VALGRIND_VALGRIND_H
--    if (RUNNING_ON_VALGRIND) {
--      GST_CAT_INFO (GST_CAT_GST_INIT, "we're running inside valgrind");
--      in_valgrind = GST_VG_INSIDE;
--    } else {
--      GST_CAT_LOG (GST_CAT_GST_INIT, "not doing extra valgrind stuff");
--      in_valgrind = GST_VG_NO_VALGRIND;
--    }
--#else
--    in_valgrind = GST_VG_NO_VALGRIND;
--#endif
--    g_assert (in_valgrind == GST_VG_NO_VALGRIND ||
--        in_valgrind == GST_VG_INSIDE);
--  }
--  return (in_valgrind == GST_VG_INSIDE);
--}
--
- static gchar *
- _replace_pattern_in_gst_debug_file_name (gchar * name, const char *token,
-     guint val)
-@@ -463,9 +433,6 @@ _priv_gst_debug_init (void)
-   _priv_GST_CAT_PROTECTION =
-       _gst_debug_category_new ("GST_PROTECTION", 0, "protection");
- 
--  /* print out the valgrind message if we're in valgrind */
--  _priv_gst_in_valgrind ();
--
-   env = g_getenv ("GST_DEBUG_OPTIONS");
-   if (env != NULL) {
-     if (strstr (env, "full_tags") || strstr (env, "full-tags"))
-@@ -2505,12 +2472,6 @@ gst_debug_construct_win_color (guint colorinfo)
-   return 0;
- }
- 
--gboolean
--_priv_gst_in_valgrind (void)
--{
--  return FALSE;
--}
--
- void
- _gst_debug_dump_mem (GstDebugCategory * cat, const gchar * file,
-     const gchar * func, gint line, GObject * obj, const gchar * msg,
-diff --git a/meson.build b/meson.build
-index 82a1728..42ae617 100644
---- a/meson.build
-+++ b/meson.build
-@@ -200,7 +200,6 @@ check_headers = [
-   'sys/wait.h',
-   'ucontext.h',
-   'unistd.h',
--  'valgrind/valgrind.h',
-   'sys/resource.h',
-   'sys/uio.h',
- ]
--- 
-2.29.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
similarity index 65%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-support-for-install-the-tests.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index b77fb5797f..d18c19c397 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From c9e93c7a3e4d2773abef4f5e1464af24f36700b3 Mon Sep 17 00:00:00 2001
+From 62f5bb7bfc2498219df7280e73480d8ed2378ce5 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH 2/4] tests: add support for install the tests
@@ -11,54 +11,44 @@ Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
- meson.build             |  5 +++++
- meson_options.txt       |  1 +
- template.test.in        |  3 +++
- tests/check/meson.build | 22 +++++++++++++++++++++-
- 4 files changed, 30 insertions(+), 1 deletion(-)
- create mode 100644 template.test.in
+ subprojects/gstreamer/meson.build             |  4 ++++
+ subprojects/gstreamer/meson_options.txt       |  1 +
+ subprojects/gstreamer/tests/check/meson.build | 22 ++++++++++++++++++-
+ .../gstreamer/tests/check/template.test.in    |  3 +++
+ 4 files changed, 29 insertions(+), 1 deletion(-)
+ create mode 100644 subprojects/gstreamer/tests/check/template.test.in
 
-diff --git a/meson.build b/meson.build
-index c4e8774f5..1abf4eb26 100644
---- a/meson.build
-+++ b/meson.build
-@@ -562,6 +562,11 @@ if bashcomp_dep.found()
+diff --git a/subprojects/gstreamer/meson.build b/subprojects/gstreamer/meson.build
+index d20fe0040f..b595d8f990 100644
+--- a/subprojects/gstreamer/meson.build
++++ b/subprojects/gstreamer/meson.build
+@@ -562,6 +562,10 @@ if bashcomp_dep.found()
    endif
  endif
  
++installed_tests_enabled = get_option('installed_tests')
 +installed_tests_metadir = join_paths(datadir, 'installed-tests', meson.project_name())
 +installed_tests_execdir = join_paths(libexecdir, 'installed-tests', meson.project_name())
-+installed_tests_enabled = get_option('installed-tests')
-+installed_tests_template = files('template.test.in')
 +
  plugins_install_dir = join_paths(get_option('libdir'), 'gstreamer-1.0')
  
  pkgconfig = import('pkgconfig')
-diff --git a/meson_options.txt b/meson_options.txt
-index c8cee3762..b5da40eaa 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
+diff --git a/subprojects/gstreamer/meson_options.txt b/subprojects/gstreamer/meson_options.txt
+index 7363bdb7a1..a34ba37dad 100644
+--- a/subprojects/gstreamer/meson_options.txt
++++ b/subprojects/gstreamer/meson_options.txt
 @@ -15,6 +15,7 @@ option('poisoning', type : 'boolean', value : false, description : 'Enable poiso
  option('memory-alignment', type: 'combo',
         choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256', '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
         value: 'malloc')
-+option('installed-tests', type : 'boolean', value : false, description : 'Enable installed tests')
++option('installed_tests', type : 'boolean', value : false, description : 'Enable installed tests')
  
  # Feature options
  option('check', type : 'feature', value : 'auto', description : 'Build unit test libraries')
-diff --git a/template.test.in b/template.test.in
-new file mode 100644
-index 000000000..f701627f8
---- /dev/null
-+++ b/template.test.in
-@@ -0,0 +1,3 @@
-+[Test]
-+Type=session
-+Exec=@installed_tests_dir@/@program@
-diff --git a/tests/check/meson.build b/tests/check/meson.build
-index b2636714b..a697a7b06 100644
---- a/tests/check/meson.build
-+++ b/tests/check/meson.build
+diff --git a/subprojects/gstreamer/tests/check/meson.build b/subprojects/gstreamer/tests/check/meson.build
+index 506606684d..00a138a568 100644
+--- a/subprojects/gstreamer/tests/check/meson.build
++++ b/subprojects/gstreamer/tests/check/meson.build
 @@ -124,10 +124,16 @@ test_defines = [
    '-UG_DISABLE_ASSERT',
    '-UG_DISABLE_CAST_CHECKS',
@@ -95,7 +85,7 @@ index b2636714b..a697a7b06 100644
 +      test_conf.set('installed_tests_dir', join_paths(prefix, installed_tests_execdir))
 +      test_conf.set('program', test_name)
 +      configure_file(
-+        input: installed_tests_template,
++        input: 'template.test.in',
 +        output: test_name + '.test',
 +        install_dir: installed_tests_metadir,
 +        configuration: test_conf
@@ -105,6 +95,15 @@ index b2636714b..a697a7b06 100644
      test(test_name, exe, env: env, timeout : 3 * 60)
    endif
  endforeach
+diff --git a/subprojects/gstreamer/tests/check/template.test.in b/subprojects/gstreamer/tests/check/template.test.in
+new file mode 100644
+index 0000000000..f701627f87
+--- /dev/null
++++ b/subprojects/gstreamer/tests/check/template.test.in
+@@ -0,0 +1,3 @@
++[Test]
++Type=session
++Exec=@installed_tests_dir@/@program@
 -- 
-2.31.1
+2.33.1
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
deleted file mode 100644
index e0e64e2c7a..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1db36347d05d88835519368442e9aa89c64091ad Mon Sep 17 00:00:00 2001
-From: Seungha Yang <seungha@centricular.com>
-Date: Tue, 15 Sep 2020 00:54:58 +0900
-Subject: [PATCH] tests: seek: Don't use too strict timeout for validation
-
-Expected segment-done message might not be seen within expected
-time if system is not powerful enough.
-
-Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/625>
-
-Upstream-Status: Backport [https://cgit.freedesktop.org/gstreamer/gstreamer/commit?id=f44312ae5d831438fcf8041162079c65321c588c]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- tests/check/pipelines/seek.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/check/pipelines/seek.c b/tests/check/pipelines/seek.c
-index 28bb8846d..5f7447bc5 100644
---- a/tests/check/pipelines/seek.c
-+++ b/tests/check/pipelines/seek.c
-@@ -521,7 +521,7 @@ GST_START_TEST (test_loopback_2)
- 
-   GST_INFO ("wait for segment done message");
- 
--  msg = gst_bus_timed_pop_filtered (bus, (GstClockTime) 2 * GST_SECOND,
-+  msg = gst_bus_timed_pop_filtered (bus, GST_CLOCK_TIME_NONE,
-       GST_MESSAGE_SEGMENT_DONE | GST_MESSAGE_ERROR);
-   fail_unless (msg, "no message within the timed window");
-   fail_unless_equals_string (GST_MESSAGE_TYPE_NAME (msg), "segment-done");
--- 
-2.29.2
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
similarity index 61%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-dictionaries-for-environment.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
index 46813cec3d..10a6dcc619 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-dictionaries-for-environment.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch
@@ -1,4 +1,4 @@
-From e82dedec1803922656e92285fc1bb75b2cdc0aad Mon Sep 17 00:00:00 2001
+From fe830f0f75f3b4b41e3dbef8d4cf6ee4103c9e06 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 24 Apr 2021 10:34:47 +0100
 Subject: [PATCH 3/4] tests: use a dictionaries for environment
@@ -10,29 +10,31 @@ Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 ---
- tests/check/meson.build | 19 +++++++++++--------
- 1 file changed, 11 insertions(+), 8 deletions(-)
+ subprojects/gstreamer/tests/check/meson.build | 21 ++++++++++++-------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
 
-diff --git a/tests/check/meson.build b/tests/check/meson.build
-index a697a7b06..f64524904 100644
---- a/tests/check/meson.build
-+++ b/tests/check/meson.build
-@@ -161,14 +161,17 @@ foreach t : core_tests
+diff --git a/subprojects/gstreamer/tests/check/meson.build b/subprojects/gstreamer/tests/check/meson.build
+index 00a138a568..48ec2532f8 100644
+--- a/subprojects/gstreamer/tests/check/meson.build
++++ b/subprojects/gstreamer/tests/check/meson.build
+@@ -161,14 +161,19 @@ foreach t : core_tests
        install: installed_tests_enabled,
      )
  
 -    env = environment()
--    env.set('GST_PLUGIN_PATH_1_0', meson.build_root())
+-    env.set('GST_PLUGIN_PATH_1_0', meson.project_build_root())
 -    env.set('GST_PLUGIN_SYSTEM_PATH_1_0', '')
 -    env.set('GST_STATE_IGNORE_ELEMENTS', '')
 -    env.set('CK_DEFAULT_TIMEOUT', '20')
 -    env.set('GST_REGISTRY', '@0@/@1@.registry'.format(meson.current_build_dir(), test_name))
 -    env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir + '/gst-plugin-scanner')
 -    env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
-+    # environment() can't be passed to configure_file and it is needed for installed_tests
-+    # use a dictionary as this is simplest solution to install the environment
++    # meson environment object can't be passed to configure_file and
++    # installed tests uses configure_file to install the environment.
++    # use a dictionary as this is the simplest solution
++    # to install the environment.
 +    env = {
-+      'GST_PLUGIN_PATH_1_0': meson.build_root(),
++      'GST_PLUGIN_PATH_1_0': meson.project_build_root(),
 +      'GST_PLUGIN_SYSTEM_PATH_1_0': '',
 +      'GST_STATE_IGNORE_ELEMENTS': '',
 +      'CK_DEFAULT_TIMEOUT': '20',
@@ -44,5 +46,5 @@ index a697a7b06..f64524904 100644
      if installed_tests_enabled
        test_conf = configuration_data()
 -- 
-2.31.1
+2.33.1
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
new file mode 100644
index 0000000000..efa004f8ce
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch
@@ -0,0 +1,74 @@
+From 4dcbabebca2ad6f1fdd59ee35a858082e87db7b6 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Sun, 2 May 2021 01:58:01 +0100
+Subject: [PATCH 4/4] tests: add helper script to run the installed_tests
+
+- this is a bash script that will run the installed_tests
+with some of the environment variables used in the meson
+testing framework.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789]
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ subprojects/gstreamer/tests/check/meson.build   | 17 +++++++++++++++++
+ .../gstreamer/tests/check/template.sh.in        |  9 +++++++++
+ .../gstreamer/tests/check/template.test.in      |  2 +-
+ 3 files changed, 27 insertions(+), 1 deletion(-)
+ create mode 100755 subprojects/gstreamer/tests/check/template.sh.in
+
+diff --git a/subprojects/gstreamer/tests/check/meson.build b/subprojects/gstreamer/tests/check/meson.build
+index 48ec2532f8..7dc4990d4e 100644
+--- a/subprojects/gstreamer/tests/check/meson.build
++++ b/subprojects/gstreamer/tests/check/meson.build
+@@ -185,6 +185,23 @@ foreach t : core_tests
+         install_dir: installed_tests_metadir,
+         configuration: test_conf
+       )
++
++      # All the tests will be deployed on the target machine and
++      # we use the home folder ~ for the registry which will then expand at runtime.
++      # Using the /tmp/gstreamer-1.0/@0@.registry can be problematic as it mostly
++      # is mounted using tmpfs and if the machine crash from some reason we can lost the registry
++      # that is useful for debug propose of the tests itself.
++      env += {'GST_REGISTRY': '~/.cache/gstreamer-1.0/@0@.registry'.format(test_name)}
++
++      # Set the full path for the test it self.
++      env += {'TEST': '@0@/@1@'.format(join_paths(prefix, installed_tests_execdir), test_name)}
++
++      configure_file(
++        input : 'template.sh.in',
++        output: test_name + '.sh',
++        install_dir: installed_tests_execdir,
++        configuration : env,
++      )
+     endif
+ 
+     test(test_name, exe, env: env, timeout : 3 * 60)
+diff --git a/subprojects/gstreamer/tests/check/template.sh.in b/subprojects/gstreamer/tests/check/template.sh.in
+new file mode 100755
+index 0000000000..cf7d31b0ea
+--- /dev/null
++++ b/subprojects/gstreamer/tests/check/template.sh.in
+@@ -0,0 +1,9 @@
++#!/bin/sh
++
++set -ax
++
++CK_DEFAULT_TIMEOUT="@CK_DEFAULT_TIMEOUT@"
++GST_PLUGIN_LOADING_WHITELIST="@GST_PLUGIN_LOADING_WHITELIST@"
++GST_REGISTRY=@GST_REGISTRY@
++GST_STATE_IGNORE_ELEMENTS="@GST_STATE_IGNORE_ELEMENTS@"
++exec @TEST@
+diff --git a/subprojects/gstreamer/tests/check/template.test.in b/subprojects/gstreamer/tests/check/template.test.in
+index f701627f87..b74ef6ad73 100644
+--- a/subprojects/gstreamer/tests/check/template.test.in
++++ b/subprojects/gstreamer/tests/check/template.test.in
+@@ -1,3 +1,3 @@
+ [Test]
+ Type=session
+-Exec=@installed_tests_dir@/@program@
++Exec=@installed_tests_dir@/@program@.sh
+-- 
+2.33.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-environment-for-installed_tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-environment-for-installed_tests.patch
deleted file mode 100644
index eabe7bcbe1..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-environment-for-installed_tests.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 57d2965e979f886e03eecd7e351bf01812053971 Mon Sep 17 00:00:00 2001
-From: Jose Quaresma <quaresma.jose@gmail.com>
-Date: Sun, 2 May 2021 01:58:01 +0100
-Subject: [PATCH 4/4] tests: install the environment for installed_tests
-
-- adapt the test environment for installed_tests
-- install the test environment for installed_tests
-- run the tests using the installed environment
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789]
-
-Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
----
- template.test.in        |  2 +-
- tests/check/meson.build | 18 ++++++++++++++++++
- 2 files changed, 19 insertions(+), 1 deletion(-)
-
-diff --git a/template.test.in b/template.test.in
-index f701627f8..9a3fbdd09 100644
---- a/template.test.in
-+++ b/template.test.in
-@@ -1,3 +1,3 @@
- [Test]
- Type=session
--Exec=@installed_tests_dir@/@program@
-+Exec=sh -c 'set -aex && source @installed_tests_dir@/@program@.env && exec @installed_tests_dir@/@program@'
-diff --git a/tests/check/meson.build b/tests/check/meson.build
-index f64524904..a67e0f8dd 100644
---- a/tests/check/meson.build
-+++ b/tests/check/meson.build
-@@ -183,6 +183,24 @@ foreach t : core_tests
-         install_dir: installed_tests_metadir,
-         configuration: test_conf
-       )
-+
-+      env += {'GST_REGISTRY': '~/.cache/gstreamer-1.0/@0@.registry'.format(test_name)}
-+      configure_file(
-+        output: test_name + '.env',
-+        install_dir: installed_tests_execdir,
-+        configuration : env,
-+      )
-+      # helper to convert a meson environment dictionay object exported with configure_file
-+      # this also remove not needed variables for the installed tests
-+      meson.add_postconf_script('sed', '-i',
-+        '-e', '/^#define/!d',
-+        '-e', 's/^#define //g',
-+        '-e', '/^GST_PLUGIN_PATH_1_0/d',
-+        '-e', '/^GST_PLUGIN_SYSTEM_PATH_1_0/d',
-+        '-e', '/^GST_PLUGIN_SCANNER_1_0/d',
-+        '-e', 's/ /=/',
-+        join_paths(meson.current_build_dir(), test_name + '.env')
-+      )
-     endif
- 
-     test(test_name, exe, env: env, timeout : 3 * 60)
--- 
-2.31.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
similarity index 76%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
index 0d82dd338c..243f99fee9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
@@ -10,22 +10,19 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 bison-native flex-native"
 
 inherit meson pkgconfig gettext upstream-version-is-even gobject-introspection ptest-gnome
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
+LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
 
 S = "${WORKDIR}/gstreamer-${PV}"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
            file://run-ptest \
-           file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
-           file://0002-Remove-unused-valgrind-detection.patch \
-           file://0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
-           file://0004-tests-respect-the-idententaion-used-in-meson.patch \
-           file://0005-tests-add-support-for-install-the-tests.patch \
-           file://0006-tests-use-a-dictionaries-for-environment.patch \
-           file://0007-tests-install-the-environment-for-installed_tests.patch \
+           file://0001-tests-respect-the-idententaion-used-in-meson.patch;striplevel=3 \
+           file://0002-tests-add-support-for-install-the-tests.patch;striplevel=3 \
+           file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3 \
+           file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            "
-SRC_URI[sha256sum] = "55862232a63459bbf56abebde3085ca9aec211b478e891dacea4d6df8cafe80a"
+SRC_URI[sha256sum] = "edf4bffff85591d4fff7b21bb9ed7f0feabc123ac4a4eff29e73cbce454f9db7"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
@@ -36,7 +33,7 @@ PACKAGECONFIG[debug] = "-Dgst_debug=true,-Dgst_debug=false"
 PACKAGECONFIG[tracer-hooks] = "-Dtracer_hooks=true,-Dtracer_hooks=false"
 PACKAGECONFIG[coretracers] = "-Dcoretracers=enabled,-Dcoretracers=disabled"
 PACKAGECONFIG[check] = "-Dcheck=enabled,-Dcheck=disabled"
-PACKAGECONFIG[tests] = "-Dtests=enabled -Dinstalled-tests=true,-Dtests=disabled -Dinstalled-tests=false"
+PACKAGECONFIG[tests] = "-Dtests=enabled -Dinstalled_tests=true,-Dtests=disabled -Dinstalled_tests=false"
 PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 PACKAGECONFIG[dw] = "-Dlibdw=enabled,-Dlibdw=disabled,elfutils"
 PACKAGECONFIG[bash-completion] = "-Dbash-completion=enabled,-Dbash-completion=disabled,bash-completion"
-- 
2.35.1


