Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
 by mx.groups.io with SMTP id smtpd.web10.40354.1602508513369329506
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 06:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nUSpvS/B;
 spf=pass (domain: gmail.com, ip: 209.85.221.196, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f196.google.com with SMTP id n189so813192vkb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 06:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AFdhA0DC0TdkNIA1/Rw+DhXQbEmk4dtUeWgYfGwTK9g=;
        b=nUSpvS/BgFY6SeGZA7DwijbKhNCxNC6Gw0ZiLsHaiigURPWtzAq9SBJ8O9BXL440d+
         DtHMnHFce+sYoRYiAjG3U1yvkUBdWPBmbKJrwI8jfxweXsBECl3c6VvJvbChWvCv7oPs
         6nIUfbZdleHZ3B8T/ZK/ScOtYRCybnk+ksF77Noim9ElffbWqDqTvqNfOybcuUArK6a9
         BlEA5fssNdgTudZw0rK425ccG3Anc0VN0DRwEYBO7AZRXaHpXtYDr/ZLdFopr+szMzk9
         pwNSogdadGFd3vINSIARKzimAEV8h9XHRdFbYOTbJSUcTwd/GZUhNKRXgra1nOyjyks/
         mH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AFdhA0DC0TdkNIA1/Rw+DhXQbEmk4dtUeWgYfGwTK9g=;
        b=G/zV6SDf6fE+wLTvDwkyGhP9RsiC1uySKzWFNlbVlCSG/vmBk6tK74SkarM61bT39O
         NmSxtKsfvhq3YwVeTyBw3zKCdq56DhVcr+THjMRotJlv+nzv+eRpKgT7shS3NVAQ8w2B
         vFY4CBSmngP6YgKWcbksbYGVgLvIhISJP9Q0SF7CYvuSQWoDWuUInIknlnfwRb3s26nd
         UGXWfkQMbkqFMawT3CLu/57MOzBvI1gjGJ0rqg9nBTLAcvTHeTc+Adpbnw7e6NsNSNjx
         XVZb5AFAIDwppcU/LC6QKLazqVqQtNyt2/VTvP9kGobY65PELYN6IdQKnBOvcuyUYIgr
         3AKQ==
X-Gm-Message-State: AOAM532sMXn6yaG0wCIRGxemFhQId5Lw4Gzw5Gc6096lfSUI6M7CYAkC
	ryfmjSXyBm4aAzv9neXhBHyS2W2pFVG/wbV9dZ6HwzN4LKM=
X-Google-Smtp-Source: ABdhPJzZLrkHYLsi/b++nx1mje7L+LJVDeoBpl5euX/OxW19en/RzFVV05wAeXjkGJCGTWYim9zPh7bA8m1WxnddlJw=
X-Received: by 2002:a1f:a3cc:: with SMTP id m195mr14055678vke.16.1602508512207;
 Mon, 12 Oct 2020 06:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
In-Reply-To: <20201012123620.2095778-1-quaresma.jose@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 12 Oct 2020 15:15:00 +0200
Message-ID: <CANNYZj-b9CNsgqHvfa8jU=ZHHCLJmQC-qSx++EYsWsba50PNgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/13] gstreamer1.0: upgrade to version 1.18.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009ea6e405b179169c"

--0000000000009ea6e405b179169c
Content-Type: text/plain; charset="UTF-8"

Thanks for the work, much appreciated! Note that YP is currently in a
feature freeze cycle leading to the next release, so these patches will be
on hold for a few weeks. See the weekly status emails for specific dates.

Alex

On Mon, 12 Oct 2020 at 14:36, Jose Quaresma <quaresma.jose@gmail.com> wrote:

>     * 0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
>       Submited
>
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669
>
>     * 0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch
>       Removed since these are included in 1.18.0
>
>     * 0003-meson-Add-valgrind-feature.patch
>       Removed because upstream don't depend anymore on valgrind
>
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595
>
>     * capfix.patch
>       Removed as the new PACKAGECONFIG capabilities can be used instead to
> achieve the same goals.
>       Fix reproducibility issue around libcap.
>
>     * 0002-Remove-unused-valgrind-detection.patch
>       Upstream-Status: Backport [a2cbf75523cdf8a4df1baa7007d86ef455972245]
>
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/a2cbf75523cdf8a4df1baa7007d86ef455972245
>
>     API and plugin documentation are no longer built with gtk_doc.
>     The gtk_doc documentation has been removed in favour of a new unified
>     documentation module built with hotdoc.
>     Distributors should use the documentation release tarball instead of
> trying
>     to package hotdoc and building the documentation from scratch.
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  ...der.c-when-env-var-is-set-do-not-fal.patch |  17 +--
>  ...002-Remove-unused-valgrind-detection.patch | 112 ++++++++++++++++++
>  ...even-when-cross-compiling-if-introsp.patch |  36 ------
>  ...eson-Add-option-for-installed-tests.patch} |  22 ++--
>  .../0003-meson-Add-valgrind-feature.patch     |  74 ------------
>  .../gstreamer/gstreamer1.0/capfix.patch       |  37 ------
>  ...er1.0_1.16.2.bb => gstreamer1.0_1.18.0.bb} |  32 ++---
>  7 files changed, 147 insertions(+), 183 deletions(-)
>  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
>  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch
>  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-meson-Add-option-for-installed-tests.patch
> => 0003-meson-Add-option-for-installed-tests.patch} (96%)
>  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valgrind-feature.patch
>  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.2.bb =>
> gstreamer1.0_1.18.0.bb} (72%)
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
> index 67a872cddb..5818c628e3 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
> @@ -1,7 +1,7 @@
> -From a1d7c582392c8bc87fa9411af77b20e011944357 Mon Sep 17 00:00:00 2001
> +From a66255ba270dcabd0084b1447239bd51989d446e Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 25 Jan 2018 17:55:02 +0200
> -Subject: [PATCH] gst/gstpluginloader.c: when env var is set do not fall
> +Subject: [PATCH 1/3] gst/gstpluginloader.c: when env var is set do not
> fall
>   through to system plugin scanner
>
>  If we set a custom GST_PLUGIN_SCANNER env var, then we probably want to
> use that and only that.
> @@ -9,17 +9,20 @@ If we set a custom GST_PLUGIN_SCANNER env var, then we
> probably want to use that
>  Falling through to the one installed on the system is problamatic in
> cross-compilation
>  environemnts, regardless of whether one pointed to by the env var
> succeeded or failed.
>
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669]
> +
> +%% original patch:
> 0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
> +
> +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>  ---
>   gst/gstpluginloader.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
>  diff --git a/gst/gstpluginloader.c b/gst/gstpluginloader.c
> -index 430829d..3a75731 100644
> +index d1e404d..2e00c3c 100644
>  --- a/gst/gstpluginloader.c
>  +++ b/gst/gstpluginloader.c
> -@@ -471,9 +471,7 @@ gst_plugin_loader_spawn (GstPluginLoader * loader)
> +@@ -475,9 +475,7 @@ gst_plugin_loader_spawn (GstPluginLoader * loader)
>       helper_bin = g_strdup (env);
>       res = gst_plugin_loader_try_helper (loader, helper_bin);
>       g_free (helper_bin);
> @@ -31,5 +34,5 @@ index 430829d..3a75731 100644
>
>   #ifdef G_OS_WIN32
>  --
> -2.15.1
> +2.28.0
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
> new file mode 100644
> index 0000000000..31fad265cf
> --- /dev/null
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrind-detection.patch
> @@ -0,0 +1,112 @@
> +From f9dba782d6ec17df2c14283a4acfcdf8a4246a66 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
> +Date: Fri, 14 Aug 2020 16:38:26 +0100
> +Subject: [PATCH 2/3] Remove unused valgrind detection
> +
> +Having this just to log a debug message in case we're
> +running inside valgrind doesn't seem very useful, and
> +the code that used to use this no longer exists it seems.
> +
> +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595>
> +
> +Upstream-Status: Backport [a2cbf75523cdf8a4df1baa7007d86ef455972245]
> +
> +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> +---
> + gst/gst_private.h |  2 --
> + gst/gstinfo.c     | 39 ---------------------------------------
> + meson.build       |  1 -
> + 3 files changed, 42 deletions(-)
> +
> +diff --git a/gst/gst_private.h b/gst/gst_private.h
> +index 1b0f02b..a8897e1 100644
> +--- a/gst/gst_private.h
> ++++ b/gst/gst_private.h
> +@@ -116,8 +116,6 @@ G_GNUC_INTERNAL  gboolean
> _priv_plugin_deps_env_vars_changed (GstPlugin * plugin
> +
> + G_GNUC_INTERNAL  gboolean _priv_plugin_deps_files_changed (GstPlugin *
> plugin);
> +
> +-G_GNUC_INTERNAL  gboolean _priv_gst_in_valgrind (void);
> +-
> + /* init functions called from gst_init(). */
> + G_GNUC_INTERNAL  void  _priv_gst_quarks_initialize (void);
> + G_GNUC_INTERNAL  void  _priv_gst_mini_object_initialize (void);
> +diff --git a/gst/gstinfo.c b/gst/gstinfo.c
> +index 37987d3..15f522e 100644
> +--- a/gst/gstinfo.c
> ++++ b/gst/gstinfo.c
> +@@ -304,36 +304,6 @@ static gboolean pretty_tags = PRETTY_TAGS_DEFAULT;
> + static volatile gint G_GNUC_MAY_ALIAS __default_level =
> GST_LEVEL_DEFAULT;
> + static volatile gint G_GNUC_MAY_ALIAS __use_color =
> GST_DEBUG_COLOR_MODE_ON;
> +
> +-/* FIXME: export this? */
> +-gboolean
> +-_priv_gst_in_valgrind (void)
> +-{
> +-  static enum
> +-  {
> +-    GST_VG_UNCHECKED,
> +-    GST_VG_NO_VALGRIND,
> +-    GST_VG_INSIDE
> +-  }
> +-  in_valgrind = GST_VG_UNCHECKED;
> +-
> +-  if (in_valgrind == GST_VG_UNCHECKED) {
> +-#ifdef HAVE_VALGRIND_VALGRIND_H
> +-    if (RUNNING_ON_VALGRIND) {
> +-      GST_CAT_INFO (GST_CAT_GST_INIT, "we're running inside valgrind");
> +-      in_valgrind = GST_VG_INSIDE;
> +-    } else {
> +-      GST_CAT_LOG (GST_CAT_GST_INIT, "not doing extra valgrind stuff");
> +-      in_valgrind = GST_VG_NO_VALGRIND;
> +-    }
> +-#else
> +-    in_valgrind = GST_VG_NO_VALGRIND;
> +-#endif
> +-    g_assert (in_valgrind == GST_VG_NO_VALGRIND ||
> +-        in_valgrind == GST_VG_INSIDE);
> +-  }
> +-  return (in_valgrind == GST_VG_INSIDE);
> +-}
> +-
> + static gchar *
> + _replace_pattern_in_gst_debug_file_name (gchar * name, const char *token,
> +     guint val)
> +@@ -462,9 +432,6 @@ _priv_gst_debug_init (void)
> +   _priv_GST_CAT_PROTECTION =
> +       _gst_debug_category_new ("GST_PROTECTION", 0, "protection");
> +
> +-  /* print out the valgrind message if we're in valgrind */
> +-  _priv_gst_in_valgrind ();
> +-
> +   env = g_getenv ("GST_DEBUG_OPTIONS");
> +   if (env != NULL) {
> +     if (strstr (env, "full_tags") || strstr (env, "full-tags"))
> +@@ -2502,12 +2469,6 @@ gst_debug_construct_win_color (guint colorinfo)
> +   return 0;
> + }
> +
> +-gboolean
> +-_priv_gst_in_valgrind (void)
> +-{
> +-  return FALSE;
> +-}
> +-
> + void
> + _gst_debug_dump_mem (GstDebugCategory * cat, const gchar * file,
> +     const gchar * func, gint line, GObject * obj, const gchar * msg,
> +diff --git a/meson.build b/meson.build
> +index f95b4f7..143c043 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -200,7 +200,6 @@ check_headers = [
> +   'sys/wait.h',
> +   'ucontext.h',
> +   'unistd.h',
> +-  'valgrind/valgrind.h',
> +   'sys/resource.h',
> +   'sys/uio.h',
> + ]
> +--
> +2.28.0
> +
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch
> deleted file mode 100644
> index 1ed7198a5c..0000000000
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 35db4a2433fbdf8612cf98b5aab5b14aeb5372f8 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
> -Date: Thu, 17 Oct 2019 12:13:35 +0100
> -Subject: [PATCH] meson: build gir even when cross-compiling if
> introspection
> - was enabled explicitly
> -
> -This can be made to work in certain circumstances when
> -cross-compiling, so default to not building g-i stuff
> -when cross-compiling, but allow it if introspection was
> -enabled explicitly via -Dintrospection=enabled.
> -
> -Fixes #454 and #381.
> -
> -Upstream-Status: Backport [35db4a2433fbdf8612cf98b5aab5b14aeb5372f8]
> -
> -Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ----
> - meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 90d98d8eb..a47e7f34e 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -466,7 +466,7 @@ rt_lib = cc.find_library('rt', required : false)
> - gir = find_program('g-ir-scanner', required :
> get_option('introspection'))
> - gnome = import('gnome')
> -
> --build_gir = gir.found() and not meson.is_cross_build()
> -+build_gir = gir.found() and (not meson.is_cross_build() or
> get_option('introspection').enabled())
> -
> - gir_init_section = [ '--add-init-section=extern void
> gst_init(gint*,gchar**);' + \
> -     'g_setenv("GST_REGISTRY_DISABLE", "yes", TRUE);' + \
> ---
> -2.17.1
> -
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch
> similarity index 96%
> rename from
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch
> rename to
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch
> index 0e6c44ea32..eb8c041e43 100644
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option-for-installed-tests.patch
> +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option-for-installed-tests.patch
> @@ -1,7 +1,7 @@
> -From b843400284751968862751dfe93853f151551c64 Mon Sep 17 00:00:00 2001
> +From 705e2b7324bdd163751becdb83435fca862ab6b9 Mon Sep 17 00:00:00 2001
>  From: Carlos Rafael Giani <crg7475@mailbox.org>
>  Date: Fri, 25 Oct 2019 00:06:26 +0200
> -Subject: [PATCH] meson: Add option for installed tests
> +Subject: [PATCH 3/3] meson: Add option for installed tests
>
>  This adds an option for producing installed versions of the unit tests.
>  These versions don't need meson to run (only a small shell script). This
> @@ -9,6 +9,8 @@ makes it easier to run cross compiled tests on a target
> machine.
>
>  Upstream-Status: Pending
>
> +%% original patch: 0004-meson-Add-option-for-installed-tests.patch
> +
>  Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
>  ---
>   build-aux/gen-installed-test-desc.py     | 18 ++++++
> @@ -77,10 +79,10 @@ index 0000000..5da86fb
>  +write_template(args.output, build_template(args.test_execdir,
> args.testname))
>  +os.chmod(args.output, 0o755)
>  diff --git a/meson_options.txt b/meson_options.txt
> -index 8afde39..8884dcc 100644
> +index 72c3997..346c423 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
> -@@ -16,6 +16,8 @@ option('poisoning', type : 'boolean', value : false,
> description : 'Enable poiso
> +@@ -15,6 +15,8 @@ option('poisoning', type : 'boolean', value : false,
> description : 'Enable poiso
>   option('memory-alignment', type: 'combo',
>          choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256',
> '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
>          value: 'malloc')
> @@ -90,10 +92,10 @@ index 8afde39..8884dcc 100644
>   # Feature options
>   option('check', type : 'feature', value : 'auto', description : 'Build
> unit test libraries')
>  diff --git a/tests/check/meson.build b/tests/check/meson.build
> -index 04da83f..2db7f76 100644
> +index 372ea41..bb0dcfa 100644
>  --- a/tests/check/meson.build
>  +++ b/tests/check/meson.build
> -@@ -118,11 +118,17 @@ if add_languages('cpp', required : false)
> +@@ -120,11 +120,17 @@ if add_languages('cpp', native: false, required:
> false)
>     ]
>   endif
>
> @@ -109,10 +111,10 @@ index 04da83f..2db7f76 100644
>     '-DGST_CHECK_TEST_ENVIRONMENT_BEACON="GST_STATE_IGNORE_ELEMENTS"',
>  -  '-DTESTFILE="' + meson.current_source_dir() + '/meson.build"',
>  +  '-DTESTFILE="@0@"'.format(test_files_path + '/testfile'),
> -   '-DGST_USE_UNSTABLE_API',
>     '-DGST_DISABLE_DEPRECATED',
>   ]
> -@@ -137,6 +143,14 @@ endif
> +
> +@@ -138,6 +144,14 @@ endif
>   glib_deps = [gio_dep, gobject_dep, gmodule_dep, glib_dep]
>   gst_deps = [gst_dep, gst_base_dep, gst_check_dep, gst_net_dep,
> gst_controller_dep]
>
> @@ -127,7 +129,7 @@ index 04da83f..2db7f76 100644
>   foreach t : core_tests
>     fname = t[0]
>     test_name = fname.split('.')[0].underscorify()
> -@@ -150,8 +164,38 @@ foreach t : core_tests
> +@@ -151,8 +165,38 @@ foreach t : core_tests
>           include_directories : [configinc],
>           link_with : link_with_libs,
>           dependencies : test_deps + glib_deps + gst_deps,
> @@ -253,5 +255,5 @@ index 0000000..89954e0
>
>  +................................................................................
>
>  +................................................................................
>  --
> -2.17.1
> +2.28.0
>
> diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valgrind-feature.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valgrind-feature.patch
> deleted file mode 100644
> index f553340f4d..0000000000
> ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valgrind-feature.patch
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -From f6c7973c03d9ba7dab60c496e768c5e6c4ee824c Mon Sep 17 00:00:00 2001
> -From: Carlos Rafael Giani <crg7475@mailbox.org>
> -Date: Sun, 20 Oct 2019 10:36:44 +0200
> -Subject: [PATCH] meson: Add valgrind feature
> -
> -This allows for enabling/disabling Valgrind support. Since Valgrind is
> -an external dependency, such a feature is needed by build environemnts
> -such as Yocto to make sure builds are deterministic. These changes also
> -add more Valgrind specific configure log output.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
> ----
> - meson.build       | 23 ++++++++++++++++++++++-
> - meson_options.txt |  1 +
> - 2 files changed, 23 insertions(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index b55ecc5..4751761 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -199,7 +199,6 @@ check_headers = [
> -   'sys/wait.h',
> -   'ucontext.h',
> -   'unistd.h',
> --  'valgrind/valgrind.h',
> -   'sys/resource.h',
> - ]
> -
> -@@ -214,6 +213,28 @@ foreach h : check_headers
> -   endif
> - endforeach
> -
> -+valgrind_option = get_option('valgrind')
> -+if valgrind_option.disabled()
> -+  message('Valgrind support not requested; disabled.')
> -+else
> -+  valgrind_header = 'valgrind/valgrind.h'
> -+  has_valgrind_header = cc.has_header(valgrind_header)
> -+  if has_valgrind_header
> -+    message('Valgrind support requested, and header ' + valgrind_header
> + \
> -+        ' found. Enabled Valgrind support.')
> -+    define = 'HAVE_' + valgrind_header.underscorify().to_upper()
> -+    cdata.set(define, 1)
> -+  else
> -+    if valgrind_option.enabled()
> -+      error('Valgrind support requested and set as required, but header
> ' + \
> -+        valgrind_header + ' not found.')
> -+    else
> -+      message('Valgrind support requested, but header ' +
> valgrind_header + \
> -+        ' not found. Disabling Valgrind support.')
> -+    endif
> -+  endif
> -+endif
> -+
> - if cc.has_member('struct tm', 'tm_gmtoff', prefix : '#include <time.h>')
> -   cdata.set('HAVE_TM_GMTOFF', 1)
> - endif
> -diff --git a/meson_options.txt b/meson_options.txt
> -index e7ff7ba..8afde39 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -19,6 +19,7 @@ option('memory-alignment', type: 'combo',
> -
> - # Feature options
> - option('check', type : 'feature', value : 'auto', description : 'Build
> unit test libraries')
> -+option('valgrind', type : 'feature', value : 'auto', description :
> 'Enable Valgrind support')
> - option('libunwind', type : 'feature', value : 'auto', description : 'Use
> libunwind to generate backtraces')
> - option('libdw', type : 'feature', value : 'auto', description : 'Use
> libdw to generate better backtraces from libunwind')
> - option('dbghelp', type : 'feature', value : 'auto', description : 'Use
> dbghelp to generate backtraces')
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> deleted file mode 100644
> index 7ca3d5ad4a..0000000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Currently gstreamer configuration depends on whether setcap is found on
> the host
> -system. Turn this into a configure option to make builds deterinistic.
> -
> -RP 2020/2/19
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Upstream-Status: Pending
> -
> -Index: gstreamer-1.16.1/libs/gst/helpers/meson.build
> -===================================================================
> ---- gstreamer-1.16.1.orig/libs/gst/helpers/meson.build
> -+++ gstreamer-1.16.1/libs/gst/helpers/meson.build
> -@@ -73,7 +73,12 @@ if have_ptp
> -     endif
> -   endif
> -
> --  setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap',
> required : false)
> -+  setcap_feature = get_option('setcap')
> -+  if setcap_feature.disabled()
> -+    setcap = find_program('dontexist', required : false)
> -+  else
> -+    setcap = find_program('setcap', '/usr/sbin/setcap', '/sbin/setcap',
> required : false)
> -+  endif
> -
> -   # user/group to change to in gst-ptp-helper
> -   ptp_helper_setuid_user = get_option('ptp-helper-setuid-user')
> -Index: gstreamer-1.16.1/meson_options.txt
> -===================================================================
> ---- gstreamer-1.16.1.orig/meson_options.txt
> -+++ gstreamer-1.16.1/meson_options.txt
> -@@ -26,6 +26,7 @@ option('libunwind', type : 'feature', va
> - option('libdw', type : 'feature', value : 'auto', description : 'Use
> libdw to generate better backtraces from libunwind')
> - option('dbghelp', type : 'feature', value : 'auto', description : 'Use
> dbghelp to generate backtraces')
> - option('bash-completion', type : 'feature', value : 'auto', description
> : 'Install bash completion files')
> -+option('setcap', type : 'feature', value : 'auto', description : 'Use
> setcap')
> -
> - # Common feature options
> - option('examples', type : 'feature', value : 'auto', yield : true)
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
> similarity index 72%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
> index 50a872e292..dc3b6aa39f 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
> @@ -6,41 +6,38 @@ BUGTRACKER = "
> https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
>  SECTION = "multimedia"
>  LICENSE = "LGPLv2+"
>
> -DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native
> flex-native"
> +DEPENDS = "glib-2.0 glib-2.0-native libxml2 bison-native flex-native"
>
> -inherit meson pkgconfig gettext upstream-version-is-even
> gobject-introspection gtk-doc
> +inherit meson pkgconfig gettext upstream-version-is-even
> gobject-introspection
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
>
>  file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
>
>  S = "${WORKDIR}/gstreamer-${PV}"
>
> -SRC_URI = " \
> -
> https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
> -
> file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
> -
> file://0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
> -    file://0003-meson-Add-valgrind-feature.patch \
> -    file://0004-meson-Add-option-for-installed-tests.patch \
> -    file://capfix.patch \
> -"
> -SRC_URI[md5sum] = "0e661ed5bdf1d8996e430228d022628e"
> -SRC_URI[sha256sum] =
> "e3f044246783fd685439647373fa13ba14f7ab0b346eadd06437092f8419e94e"
> +SRC_URI = "
> https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
> +
>  file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
> +           file://0002-Remove-unused-valgrind-detection.patch \
> +           file://0003-meson-Add-option-for-installed-tests.patch \
> +           "
> +SRC_URI[md5sum] = "25d683630ff8b82b2c878aa3edd3c491"
> +SRC_URI[sha256sum] =
> "0ff09245b06c0aeb5d9a156edcab088a7e8213a0bf9c84a1ff0318f9c00c7805"
>
>  PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',
> '', d)} \
>                     check \
>                     debug \
> -                   tools"
> +                   tools \
> +                   capabilities"
>
>  PACKAGECONFIG[debug] = "-Dgst_debug=true,-Dgst_debug=false"
>  PACKAGECONFIG[tracer-hooks] = "-Dtracer_hooks=true,-Dtracer_hooks=false"
>  PACKAGECONFIG[check] = "-Dcheck=enabled,-Dcheck=disabled"
>  PACKAGECONFIG[tests] = "-Dtests=enabled
> -Dinstalled-tests=true,-Dtests=disabled -Dinstalled-tests=false"
> -PACKAGECONFIG[valgrind] =
> "-Dvalgrind=enabled,-Dvalgrind=disabled,valgrind,"
>  PACKAGECONFIG[unwind] =
> "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
>  PACKAGECONFIG[dw] = "-Dlibdw=enabled,-Dlibdw=disabled,elfutils"
>  PACKAGECONFIG[bash-completion] =
> "-Dbash-completion=enabled,-Dbash-completion=disabled,bash-completion"
>  PACKAGECONFIG[tools] = "-Dtools=enabled,-Dtools=disabled"
> -PACKAGECONFIG[setcap] = "-Dsetcap=enabled,-Dsetcap=disabled,libcap
> libcap-native"
> +PACKAGECONFIG[capabilities] =
> "-Dptp-helper-permissions=capabilities,-Dptp-helper-permissions=none,libcap
> libcap-native"
>
>  # TODO: put this in a gettext.bbclass patch
>  def gettext_oemeson(d):
> @@ -52,15 +49,12 @@ def gettext_oemeson(d):
>      return '-Dnls=enabled'
>
>  EXTRA_OEMESON += " \
> +    -Ddoc=disabled \
>      -Dexamples=disabled \
>      -Ddbghelp=disabled \
>      ${@gettext_oemeson(d)} \
>  "
>
> -GTKDOC_MESON_OPTION = "gtk_doc"
> -GTKDOC_MESON_ENABLE_FLAG = "enabled"
> -GTKDOC_MESON_DISABLE_FLAG = "disabled"
> -
>  GIR_MESON_ENABLE_FLAG = "enabled"
>  GIR_MESON_DISABLE_FLAG = "disabled"
>
> --
> 2.28.0
>
>
> 
>
>

--0000000000009ea6e405b179169c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the work, much appreciated! Note that YP i=
s currently in a feature freeze cycle leading to the next release, so these=
 patches will be on hold for a few weeks. See the weekly status emails for =
specific dates.<br></div><div><br></div><div>Alex<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 12 Oct 2=
020 at 14:36, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">=
quaresma.jose@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">=C2=A0 =C2=A0 * 0001-gst-gstpluginloader.c-when-env-=
var-is-set-do-not-fal.patch<br>
=C2=A0 =C2=A0 =C2=A0 Submited<br>
=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://gitlab.freedesktop.org/gstreamer/g=
streamer/-/merge_requests/669" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669</a><br>
<br>
=C2=A0 =C2=A0 * 0002-meson-build-gir-even-when-cross-compiling-if-introsp.=
patch<br>
=C2=A0 =C2=A0 =C2=A0 Removed since these are included in 1.18.0<br>
<br>
=C2=A0 =C2=A0 * 0003-meson-Add-valgrind-feature.patch<br>
=C2=A0 =C2=A0 =C2=A0 Removed because upstream don&#39;t depend anymore on =
valgrind<br>
=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://gitlab.freedesktop.org/gstreamer/g=
streamer/-/merge_requests/595" rel=3D"noreferrer" target=3D"_blank">https:/=
/gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595</a><br>
<br>
=C2=A0 =C2=A0 * capfix.patch<br>
=C2=A0 =C2=A0 =C2=A0 Removed as the new PACKAGECONFIG capabilities can be =
used instead to achieve the same goals.<br>
=C2=A0 =C2=A0 =C2=A0 Fix reproducibility issue around libcap.<br>
<br>
=C2=A0 =C2=A0 * 0002-Remove-unused-valgrind-detection.patch<br>
=C2=A0 =C2=A0 =C2=A0 Upstream-Status: Backport [a2cbf75523cdf8a4df1baa7007=
d86ef455972245]<br>
=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://gitlab.freedesktop.org/gstreamer/g=
streamer/-/commit/a2cbf75523cdf8a4df1baa7007d86ef455972245" rel=3D"noreferr=
er" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/=
commit/a2cbf75523cdf8a4df1baa7007d86ef455972245</a><br>
<br>
=C2=A0 =C2=A0 API and plugin documentation are no longer built with gtk_do=
c.<br>
=C2=A0 =C2=A0 The gtk_doc documentation has been removed in favour of a ne=
w unified<br>
=C2=A0 =C2=A0 documentation module built with hotdoc.<br>
=C2=A0 =C2=A0 Distributors should use the documentation release tarball in=
stead of trying<br>
=C2=A0 =C2=A0 to package hotdoc and building the documentation from scratc=
h.<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com=
" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
=C2=A0...der.c-when-env-var-is-set-do-not-fal.patch |=C2=A0 17 +--<br>
=C2=A0...002-Remove-unused-valgrind-detection.patch | 112 ++++++++++++++++=
++<br>
=C2=A0...even-when-cross-compiling-if-introsp.patch |=C2=A0 36 ------<br>
=C2=A0...eson-Add-option-for-installed-tests.patch} |=C2=A0 22 ++--<br>
=C2=A0.../0003-meson-Add-valgrind-feature.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 74 ------------<br>
=C2=A0.../gstreamer/gstreamer1.0/capfix.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 37 ------<br>
=C2=A0...<a href=3D"http://er1.0_1.16.2.bb" rel=3D"noreferrer" target=3D"_=
blank">er1.0_1.16.2.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0_1.18.0.bb=
" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.18.0.bb</a>} |=C2=A0 =
32 ++---<br>
=C2=A07 files changed, 147 insertions(+), 183 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
02-Remove-unused-valgrind-detection.patch<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
02-meson-build-gir-even-when-cross-compiling-if-introsp.patch<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-meson-Ad=
d-option-for-installed-tests.patch =3D&gt; 0003-meson-Add-option-for-instal=
led-tests.patch} (96%)<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
03-meson-Add-valgrind-feature.patch<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/ca=
pfix.patch<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreame=
r1.0_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.16.2.bb=
</a> =3D&gt; <a href=3D"http://gstreamer1.0_1.18.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">gstreamer1.0_1.18.0.bb</a>} (72%)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpl=
uginloader.c-when-env-var-is-set-do-not-fal.patch b/meta/recipes-multimedia=
/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-n=
ot-fal.patch<br>
index 67a872cddb..5818c628e3 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloa=
der.c-when-env-var-is-set-do-not-fal.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloa=
der.c-when-env-var-is-set-do-not-fal.patch<br>
@@ -1,7 +1,7 @@<br>
-From a1d7c582392c8bc87fa9411af77b20e011944357 Mon Sep 17 00:00:00 2001<br=
>
+From a66255ba270dcabd0084b1447239bd51989d446e Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
=C2=A0Date: Thu, 25 Jan 2018 17:55:02 +0200<br>
-Subject: [PATCH] gst/gstpluginloader.c: when env var is set do not fall<b=
r>
+Subject: [PATCH 1/3] gst/gstpluginloader.c: when env var is set do not fa=
ll<br>
=C2=A0 through to system plugin scanner<br>
<br>
=C2=A0If we set a custom GST_PLUGIN_SCANNER env var, then we probably want=
 to use that and only that.<br>
@@ -9,17 +9,20 @@ If we set a custom GST_PLUGIN_SCANNER env var, then we p=
robably want to use that<br>
=C2=A0Falling through to the one installed on the system is problamatic in=
 cross-compilation<br>
=C2=A0environemnts, regardless of whether one pointed to by the env var su=
cceeded or failed.<br>
<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/gst=
reamer/gstreamer/-/merge_requests/669" rel=3D"noreferrer" target=3D"_blank"=
>https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669</a=
>]<br>
+<br>
+%% original patch: 0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-=
fal.patch<br>
+<br>
+Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 gst/gstpluginloader.c | 4 +---<br>
=C2=A0 1 file changed, 1 insertion(+), 3 deletions(-)<br>
<br>
=C2=A0diff --git a/gst/gstpluginloader.c b/gst/gstpluginloader.c<br>
-index 430829d..3a75731 100644<br>
+index d1e404d..2e00c3c 100644<br>
=C2=A0--- a/gst/gstpluginloader.c<br>
=C2=A0+++ b/gst/gstpluginloader.c<br>
-@@ -471,9 +471,7 @@ gst_plugin_loader_spawn (GstPluginLoader * loader)<br=
>
+@@ -475,9 +475,7 @@ gst_plugin_loader_spawn (GstPluginLoader * loader)<br=
>
=C2=A0 =C2=A0 =C2=A0 helper_bin =3D g_strdup (env);<br>
=C2=A0 =C2=A0 =C2=A0 res =3D gst_plugin_loader_try_helper (loader, helper_=
bin);<br>
=C2=A0 =C2=A0 =C2=A0 g_free (helper_bin);<br>
@@ -31,5 +34,5 @@ index 430829d..3a75731 100644<br>
<br>
=C2=A0 #ifdef G_OS_WIN32<br>
=C2=A0-- <br>
-2.15.1<br>
+2.28.0<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-un=
used-valgrind-detection.patch b/meta/recipes-multimedia/gstreamer/gstreamer=
1.0/0002-Remove-unused-valgrind-detection.patch<br>
new file mode 100644<br>
index 0000000000..31fad265cf<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-va=
lgrind-detection.patch<br>
@@ -0,0 +1,112 @@<br>
+From f9dba782d6ec17df2c14283a4acfcdf8a4246a66 Mon Sep 17 00:00:00 2001<br=
>
+From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"mail=
to:tim@centricular.com" target=3D"_blank">tim@centricular.com</a>&gt;<br>
+Date: Fri, 14 Aug 2020 16:38:26 +0100<br>
+Subject: [PATCH 2/3] Remove unused valgrind detection<br>
+<br>
+Having this just to log a debug message in case we&#39;re<br>
+running inside valgrind doesn&#39;t seem very useful, and<br>
+the code that used to use this no longer exists it seems.<br>
+<br>
+Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreame=
r/-/merge_requests/595" rel=3D"noreferrer" target=3D"_blank">https://gitlab=
.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595</a>&gt;<br>
+<br>
+Upstream-Status: Backport [a2cbf75523cdf8a4df1baa7007d86ef455972245]<br>
+<br>
+Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
+---<br>
+ gst/gst_private.h |=C2=A0 2 --<br>
+ gst/gstinfo.c=C2=A0 =C2=A0 =C2=A0| 39 ----------------------------------=
-----<br>
+ meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
+ 3 files changed, 42 deletions(-)<br>
+<br>
+diff --git a/gst/gst_private.h b/gst/gst_private.h<br>
+index 1b0f02b..a8897e1 100644<br>
+--- a/gst/gst_private.h<br>
++++ b/gst/gst_private.h<br>
+@@ -116,8 +116,6 @@ G_GNUC_INTERNAL=C2=A0 gboolean _priv_plugin_deps_env_=
vars_changed (GstPlugin * plugin<br>
+ <br>
+ G_GNUC_INTERNAL=C2=A0 gboolean _priv_plugin_deps_files_changed (GstPlugi=
n * plugin);<br>
+ <br>
+-G_GNUC_INTERNAL=C2=A0 gboolean _priv_gst_in_valgrind (void);<br>
+-<br>
+ /* init functions called from gst_init(). */<br>
+ G_GNUC_INTERNAL=C2=A0 void=C2=A0 _priv_gst_quarks_initialize (void);<br>
+ G_GNUC_INTERNAL=C2=A0 void=C2=A0 _priv_gst_mini_object_initialize (void)=
;<br>
+diff --git a/gst/gstinfo.c b/gst/gstinfo.c<br>
+index 37987d3..15f522e 100644<br>
+--- a/gst/gstinfo.c<br>
++++ b/gst/gstinfo.c<br>
+@@ -304,36 +304,6 @@ static gboolean pretty_tags =3D PRETTY_TAGS_DEFAULT;=
<br>
+ static volatile gint G_GNUC_MAY_ALIAS __default_level =3D GST_LEVEL_DEFA=
ULT;<br>
+ static volatile gint G_GNUC_MAY_ALIAS __use_color =3D GST_DEBUG_COLOR_MO=
DE_ON;<br>
+ <br>
+-/* FIXME: export this? */<br>
+-gboolean<br>
+-_priv_gst_in_valgrind (void)<br>
+-{<br>
+-=C2=A0 static enum<br>
+-=C2=A0 {<br>
+-=C2=A0 =C2=A0 GST_VG_UNCHECKED,<br>
+-=C2=A0 =C2=A0 GST_VG_NO_VALGRIND,<br>
+-=C2=A0 =C2=A0 GST_VG_INSIDE<br>
+-=C2=A0 }<br>
+-=C2=A0 in_valgrind =3D GST_VG_UNCHECKED;<br>
+-<br>
+-=C2=A0 if (in_valgrind =3D=3D GST_VG_UNCHECKED) {<br>
+-#ifdef HAVE_VALGRIND_VALGRIND_H<br>
+-=C2=A0 =C2=A0 if (RUNNING_ON_VALGRIND) {<br>
+-=C2=A0 =C2=A0 =C2=A0 GST_CAT_INFO (GST_CAT_GST_INIT, &quot;we&#39;re run=
ning inside valgrind&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 in_valgrind =3D GST_VG_INSIDE;<br>
+-=C2=A0 =C2=A0 } else {<br>
+-=C2=A0 =C2=A0 =C2=A0 GST_CAT_LOG (GST_CAT_GST_INIT, &quot;not doing extr=
a valgrind stuff&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 in_valgrind =3D GST_VG_NO_VALGRIND;<br>
+-=C2=A0 =C2=A0 }<br>
+-#else<br>
+-=C2=A0 =C2=A0 in_valgrind =3D GST_VG_NO_VALGRIND;<br>
+-#endif<br>
+-=C2=A0 =C2=A0 g_assert (in_valgrind =3D=3D GST_VG_NO_VALGRIND ||<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 in_valgrind =3D=3D GST_VG_INSIDE);<br>
+-=C2=A0 }<br>
+-=C2=A0 return (in_valgrind =3D=3D GST_VG_INSIDE);<br>
+-}<br>
+-<br>
+ static gchar *<br>
+ _replace_pattern_in_gst_debug_file_name (gchar * name, const char *token=
,<br>
+=C2=A0 =C2=A0 =C2=A0guint val)<br>
+@@ -462,9 +432,6 @@ _priv_gst_debug_init (void)<br>
+=C2=A0 =C2=A0_priv_GST_CAT_PROTECTION =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0_gst_debug_category_new (&quot;GST_PROTECTION&=
quot;, 0, &quot;protection&quot;);<br>
+ <br>
+-=C2=A0 /* print out the valgrind message if we&#39;re in valgrind */<br>
+-=C2=A0 _priv_gst_in_valgrind ();<br>
+-<br>
+=C2=A0 =C2=A0env =3D g_getenv (&quot;GST_DEBUG_OPTIONS&quot;);<br>
+=C2=A0 =C2=A0if (env !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0if (strstr (env, &quot;full_tags&quot;) || strstr (en=
v, &quot;full-tags&quot;))<br>
+@@ -2502,12 +2469,6 @@ gst_debug_construct_win_color (guint colorinfo)<br=
>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+ <br>
+-gboolean<br>
+-_priv_gst_in_valgrind (void)<br>
+-{<br>
+-=C2=A0 return FALSE;<br>
+-}<br>
+-<br>
+ void<br>
+ _gst_debug_dump_mem (GstDebugCategory * cat, const gchar * file,<br>
+=C2=A0 =C2=A0 =C2=A0const gchar * func, gint line, GObject * obj, const g=
char * msg,<br>
+diff --git a/meson.build b/meson.build<br>
+index f95b4f7..143c043 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -200,7 +200,6 @@ check_headers =3D [<br>
+=C2=A0 =C2=A0&#39;sys/wait.h&#39;,<br>
+=C2=A0 =C2=A0&#39;ucontext.h&#39;,<br>
+=C2=A0 =C2=A0&#39;unistd.h&#39;,<br>
+-=C2=A0 &#39;valgrind/valgrind.h&#39;,<br>
+=C2=A0 =C2=A0&#39;sys/resource.h&#39;,<br>
+=C2=A0 =C2=A0&#39;sys/uio.h&#39;,<br>
+ ]<br>
+-- <br>
+2.28.0<br>
+<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-bui=
ld-gir-even-when-cross-compiling-if-introsp.patch b/meta/recipes-multimedia=
/gstreamer/gstreamer1.0/0002-meson-build-gir-even-when-cross-compiling-if-i=
ntrosp.patch<br>
deleted file mode 100644<br>
index 1ed7198a5c..0000000000<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gir-=
even-when-cross-compiling-if-introsp.patch<br>
+++ /dev/null<br>
@@ -1,36 +0,0 @@<br>
-From 35db4a2433fbdf8612cf98b5aab5b14aeb5372f8 Mon Sep 17 00:00:00 2001<br=
>
-From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"mail=
to:tim@centricular.com" target=3D"_blank">tim@centricular.com</a>&gt;<br>
-Date: Thu, 17 Oct 2019 12:13:35 +0100<br>
-Subject: [PATCH] meson: build gir even when cross-compiling if introspect=
ion<br>
- was enabled explicitly<br>
-<br>
-This can be made to work in certain circumstances when<br>
-cross-compiling, so default to not building g-i stuff<br>
-when cross-compiling, but allow it if introspection was<br>
-enabled explicitly via -Dintrospection=3Denabled.<br>
-<br>
-Fixes #454 and #381.<br>
-<br>
-Upstream-Status: Backport [35db4a2433fbdf8612cf98b5aab5b14aeb5372f8]<br>
-<br>
-Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@mailbox.=
org" target=3D"_blank">crg7475@mailbox.org</a>&gt;<br>
----<br>
- meson.build | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/meson.build b/meson.build<br>
-index 90d98d8eb..a47e7f34e 100644<br>
---- a/meson.build<br>
-+++ b/meson.build<br>
-@@ -466,7 +466,7 @@ rt_lib =3D cc.find_library(&#39;rt&#39;, required : f=
alse)<br>
- gir =3D find_program(&#39;g-ir-scanner&#39;, required : get_option(&#39;=
introspection&#39;))<br>
- gnome =3D import(&#39;gnome&#39;)<br>
- <br>
--build_gir =3D gir.found() and not meson.is_cross_build()<br>
-+build_gir =3D gir.found() and (not meson.is_cross_build() or get_option(=
&#39;introspection&#39;).enabled())<br>
- <br>
- gir_init_section =3D [ &#39;--add-init-section=3Dextern void gst_init(gi=
nt*,gchar**);&#39; + \<br>
-=C2=A0 =C2=A0 =C2=A0&#39;g_setenv(&quot;GST_REGISTRY_DISABLE&quot;, &quot=
;yes&quot;, TRUE);&#39; + \<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add=
-option-for-installed-tests.patch b/meta/recipes-multimedia/gstreamer/gstre=
amer1.0/0003-meson-Add-option-for-installed-tests.patch<br>
similarity index 96%<br>
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-=
option-for-installed-tests.patch<br>
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-op=
tion-for-installed-tests.patch<br>
index 0e6c44ea32..eb8c041e43 100644<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-option=
-for-installed-tests.patch<br>
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-option=
-for-installed-tests.patch<br>
@@ -1,7 +1,7 @@<br>
-From b843400284751968862751dfe93853f151551c64 Mon Sep 17 00:00:00 2001<br=
>
+From 705e2b7324bdd163751becdb83435fca862ab6b9 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@mailbox.org"=
 target=3D"_blank">crg7475@mailbox.org</a>&gt;<br>
=C2=A0Date: Fri, 25 Oct 2019 00:06:26 +0200<br>
-Subject: [PATCH] meson: Add option for installed tests<br>
+Subject: [PATCH 3/3] meson: Add option for installed tests<br>
<br>
=C2=A0This adds an option for producing installed versions of the unit tes=
ts.<br>
=C2=A0These versions don&#39;t need meson to run (only a small shell scrip=
t). This<br>
@@ -9,6 +9,8 @@ makes it easier to run cross compiled tests on a target ma=
chine.<br>
<br>
=C2=A0Upstream-Status: Pending<br>
<br>
+%% original patch: 0004-meson-Add-option-for-installed-tests.patch<br>
+<br>
=C2=A0Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@mai=
lbox.org" target=3D"_blank">crg7475@mailbox.org</a>&gt;<br>
=C2=A0---<br>
=C2=A0 build-aux/gen-installed-test-desc.py=C2=A0 =C2=A0 =C2=A0| 18 ++++++=
<br>
@@ -77,10 +79,10 @@ index 0000000..5da86fb<br>
=C2=A0+write_template(args.output, build_template(args.test_execdir, args.=
testname))<br>
=C2=A0+os.chmod(args.output, 0o755)<br>
=C2=A0diff --git a/meson_options.txt b/meson_options.txt<br>
-index 8afde39..8884dcc 100644<br>
+index 72c3997..346c423 100644<br>
=C2=A0--- a/meson_options.txt<br>
=C2=A0+++ b/meson_options.txt<br>
-@@ -16,6 +16,8 @@ option(&#39;poisoning&#39;, type : &#39;boolean&#39;, v=
alue : false, description : &#39;Enable poiso<br>
+@@ -15,6 +15,8 @@ option(&#39;poisoning&#39;, type : &#39;boolean&#39;, v=
alue : false, description : &#39;Enable poiso<br>
=C2=A0 option(&#39;memory-alignment&#39;, type: &#39;combo&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0choices : [&#39;1&#39;, &#39;2&#39;, &#3=
9;4&#39;, &#39;8&#39;, &#39;16&#39;, &#39;32&#39;, &#39;64&#39;, &#39;128&#=
39;, &#39;256&#39;, &#39;512&#39;, &#39;1024&#39;, &#39;2048&#39;, &#39;409=
6&#39;, &#39;8192&#39;, &#39;malloc&#39;, &#39;pagesize&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value: &#39;malloc&#39;)<br>
@@ -90,10 +92,10 @@ index 8afde39..8884dcc 100644<br>
=C2=A0 # Feature options<br>
=C2=A0 option(&#39;check&#39;, type : &#39;feature&#39;, value : &#39;auto=
&#39;, description : &#39;Build unit test libraries&#39;)<br>
=C2=A0diff --git a/tests/check/meson.build b/tests/check/meson.build<br>
-index 04da83f..2db7f76 100644<br>
+index 372ea41..bb0dcfa 100644<br>
=C2=A0--- a/tests/check/meson.build<br>
=C2=A0+++ b/tests/check/meson.build<br>
-@@ -118,11 +118,17 @@ if add_languages(&#39;cpp&#39;, required : false)<b=
r>
+@@ -120,11 +120,17 @@ if add_languages(&#39;cpp&#39;, native: false, requ=
ired: false)<br>
=C2=A0 =C2=A0 ]<br>
=C2=A0 endif<br>
<br>
@@ -109,10 +111,10 @@ index 04da83f..2db7f76 100644<br>
=C2=A0 =C2=A0 &#39;-DGST_CHECK_TEST_ENVIRONMENT_BEACON=3D&quot;GST_STATE_I=
GNORE_ELEMENTS&quot;&#39;,<br>
=C2=A0-=C2=A0 &#39;-DTESTFILE=3D&quot;&#39; + meson.current_source_dir() +=
 &#39;/meson.build&quot;&#39;,<br>
=C2=A0+=C2=A0 &#39;-DTESTFILE=3D&quot;@0@&quot;&#39;.format(test_files_pat=
h + &#39;/testfile&#39;),<br>
-=C2=A0 =C2=A0&#39;-DGST_USE_UNSTABLE_API&#39;,<br>
=C2=A0 =C2=A0 &#39;-DGST_DISABLE_DEPRECATED&#39;,<br>
=C2=A0 ]<br>
-@@ -137,6 +143,14 @@ endif<br>
+ <br>
+@@ -138,6 +144,14 @@ endif<br>
=C2=A0 glib_deps =3D [gio_dep, gobject_dep, gmodule_dep, glib_dep]<br>
=C2=A0 gst_deps =3D [gst_dep, gst_base_dep, gst_check_dep, gst_net_dep, gs=
t_controller_dep]<br>
<br>
@@ -127,7 +129,7 @@ index 04da83f..2db7f76 100644<br>
=C2=A0 foreach t : core_tests<br>
=C2=A0 =C2=A0 fname =3D t[0]<br>
=C2=A0 =C2=A0 test_name =3D fname.split(&#39;.&#39;)[0].underscorify()<br>
-@@ -150,8 +164,38 @@ foreach t : core_tests<br>
+@@ -151,8 +165,38 @@ foreach t : core_tests<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 include_directories : [configinc],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_with : link_with_libs,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependencies : test_deps + glib_deps + =
gst_deps,<br>
@@ -253,5 +255,5 @@ index 0000000..89954e0<br>
=C2=A0+...................................................................=
.............<br>
=C2=A0+...................................................................=
.............<br>
=C2=A0-- <br>
-2.17.1<br>
+2.28.0<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add=
-valgrind-feature.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
03-meson-Add-valgrind-feature.patch<br>
deleted file mode 100644<br>
index f553340f4d..0000000000<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valgri=
nd-feature.patch<br>
+++ /dev/null<br>
@@ -1,74 +0,0 @@<br>
-From f6c7973c03d9ba7dab60c496e768c5e6c4ee824c Mon Sep 17 00:00:00 2001<br=
>
-From: Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@mailbox.org" targ=
et=3D"_blank">crg7475@mailbox.org</a>&gt;<br>
-Date: Sun, 20 Oct 2019 10:36:44 +0200<br>
-Subject: [PATCH] meson: Add valgrind feature<br>
-<br>
-This allows for enabling/disabling Valgrind support. Since Valgrind is<br=
>
-an external dependency, such a feature is needed by build environemnts<br=
>
-such as Yocto to make sure builds are deterministic. These changes also<b=
r>
-add more Valgrind specific configure log output.<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@mailbox.=
org" target=3D"_blank">crg7475@mailbox.org</a>&gt;<br>
----<br>
- meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 23 ++++++++++++++++++++++-<br>
- meson_options.txt |=C2=A0 1 +<br>
- 2 files changed, 23 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/meson.build b/meson.build<br>
-index b55ecc5..4751761 100644<br>
---- a/meson.build<br>
-+++ b/meson.build<br>
-@@ -199,7 +199,6 @@ check_headers =3D [<br>
-=C2=A0 =C2=A0&#39;sys/wait.h&#39;,<br>
-=C2=A0 =C2=A0&#39;ucontext.h&#39;,<br>
-=C2=A0 =C2=A0&#39;unistd.h&#39;,<br>
--=C2=A0 &#39;valgrind/valgrind.h&#39;,<br>
-=C2=A0 =C2=A0&#39;sys/resource.h&#39;,<br>
- ]<br>
- <br>
-@@ -214,6 +213,28 @@ foreach h : check_headers<br>
-=C2=A0 =C2=A0endif<br>
- endforeach<br>
- <br>
-+valgrind_option =3D get_option(&#39;valgrind&#39;)<br>
-+if valgrind_option.disabled()<br>
-+=C2=A0 message(&#39;Valgrind support not requested; disabled.&#39;)<br>
-+else<br>
-+=C2=A0 valgrind_header =3D &#39;valgrind/valgrind.h&#39;<br>
-+=C2=A0 has_valgrind_header =3D cc.has_header(valgrind_header)<br>
-+=C2=A0 if has_valgrind_header<br>
-+=C2=A0 =C2=A0 message(&#39;Valgrind support requested, and header &#39; =
+ valgrind_header + \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39; found. Enabled Valgrind support.&#39;)=
<br>
-+=C2=A0 =C2=A0 define =3D &#39;HAVE_&#39; + valgrind_header.underscorify(=
).to_upper()<br>
-+=C2=A0 =C2=A0 cdata.set(define, 1)<br>
-+=C2=A0 else<br>
-+=C2=A0 =C2=A0 if valgrind_option.enabled()<br>
-+=C2=A0 =C2=A0 =C2=A0 error(&#39;Valgrind support requested and set as re=
quired, but header &#39; + \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 valgrind_header + &#39; not found.&#39;)<br>
-+=C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 message(&#39;Valgrind support requested, but header=
 &#39; + valgrind_header + \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39; not found. Disabling Valgrind support.=
&#39;)<br>
-+=C2=A0 =C2=A0 endif<br>
-+=C2=A0 endif<br>
-+endif<br>
-+<br>
- if cc.has_member(&#39;struct tm&#39;, &#39;tm_gmtoff&#39;, prefix : &#39=
;#include &lt;time.h&gt;&#39;)<br>
-=C2=A0 =C2=A0cdata.set(&#39;HAVE_TM_GMTOFF&#39;, 1)<br>
- endif<br>
-diff --git a/meson_options.txt b/meson_options.txt<br>
-index e7ff7ba..8afde39 100644<br>
---- a/meson_options.txt<br>
-+++ b/meson_options.txt<br>
-@@ -19,6 +19,7 @@ option(&#39;memory-alignment&#39;, type: &#39;combo&#39=
;,<br>
- <br>
- # Feature options<br>
- option(&#39;check&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;=
, description : &#39;Build unit test libraries&#39;)<br>
-+option(&#39;valgrind&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;, description : &#39;Enable Valgrind support&#39;)<br>
- option(&#39;libunwind&#39;, type : &#39;feature&#39;, value : &#39;auto&=
#39;, description : &#39;Use libunwind to generate backtraces&#39;)<br>
- option(&#39;libdw&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;=
, description : &#39;Use libdw to generate better backtraces from libunwind=
&#39;)<br>
- option(&#39;dbghelp&#39;, type : &#39;feature&#39;, value : &#39;auto&#3=
9;, description : &#39;Use dbghelp to generate backtraces&#39;)<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch b=
/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch<br>
deleted file mode 100644<br>
index 7ca3d5ad4a..0000000000<br>
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch<br>
+++ /dev/null<br>
@@ -1,37 +0,0 @@<br>
-Currently gstreamer configuration depends on whether setcap is found on t=
he host<br>
-system. Turn this into a configure option to make builds deterinistic.<br=
>
-<br>
-RP 2020/2/19<br>
-Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
<br>
-Upstream-Status: Pending<br>
-<br>
-Index: gstreamer-1.16.1/libs/gst/helpers/meson.build<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gstreamer-1.16.1.orig/libs/gst/helpers/meson.build<br>
-+++ gstreamer-1.16.1/libs/gst/helpers/meson.build<br>
-@@ -73,7 +73,12 @@ if have_ptp<br>
-=C2=A0 =C2=A0 =C2=A0endif<br>
-=C2=A0 =C2=A0endif<br>
- <br>
--=C2=A0 setcap =3D find_program(&#39;setcap&#39;, &#39;/usr/sbin/setcap&#=
39;, &#39;/sbin/setcap&#39;, required : false)<br>
-+=C2=A0 setcap_feature =3D get_option(&#39;setcap&#39;)<br>
-+=C2=A0 if setcap_feature.disabled()<br>
-+=C2=A0 =C2=A0 setcap =3D find_program(&#39;dontexist&#39;, required : fa=
lse)<br>
-+=C2=A0 else<br>
-+=C2=A0 =C2=A0 setcap =3D find_program(&#39;setcap&#39;, &#39;/usr/sbin/s=
etcap&#39;, &#39;/sbin/setcap&#39;, required : false)<br>
-+=C2=A0 endif<br>
- <br>
-=C2=A0 =C2=A0# user/group to change to in gst-ptp-helper<br>
-=C2=A0 =C2=A0ptp_helper_setuid_user =3D get_option(&#39;ptp-helper-setuid=
-user&#39;)<br>
-Index: gstreamer-1.16.1/meson_options.txt<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- gstreamer-1.16.1.orig/meson_options.txt<br>
-+++ gstreamer-1.16.1/meson_options.txt<br>
-@@ -26,6 +26,7 @@ option(&#39;libunwind&#39;, type : &#39;feature&#39;, v=
a<br>
- option(&#39;libdw&#39;, type : &#39;feature&#39;, value : &#39;auto&#39;=
, description : &#39;Use libdw to generate better backtraces from libunwind=
&#39;)<br>
- option(&#39;dbghelp&#39;, type : &#39;feature&#39;, value : &#39;auto&#3=
9;, description : &#39;Use dbghelp to generate backtraces&#39;)<br>
- option(&#39;bash-completion&#39;, type : &#39;feature&#39;, value : &#39=
;auto&#39;, description : &#39;Install bash completion files&#39;)<br>
-+option(&#39;setcap&#39;, type : &#39;feature&#39;, value : &#39;auto&#39=
;, description : &#39;Use setcap&#39;)<br>
- <br>
- # Common feature options<br>
- option(&#39;examples&#39;, type : &#39;feature&#39;, value : &#39;auto&#=
39;, yield : true)<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer=
1.0_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.16.2.bb<=
/a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.18=
.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.18.0.bb</a><br>
similarity index 72%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.16.2.bb</=
a><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
_1.18.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.18.0.bb</a>=
<br>
index 50a872e292..dc3b6aa39f 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.1=
6.2.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.16.2.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.1=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.18.0.bb</a><br>
@@ -6,41 +6,38 @@ BUGTRACKER =3D &quot;<a href=3D"https://bugzilla.gnome.o=
rg/enter_bug.cgi?product=3DGstreamer" rel=3D"noreferrer" target=3D"_blank">=
https://bugzilla.gnome.org/enter_bug.cgi?product=3DGstreamer</a>&quot;<br>
=C2=A0SECTION =3D &quot;multimedia&quot;<br>
=C2=A0LICENSE =3D &quot;LGPLv2+&quot;<br>
<br>
-DEPENDS =3D &quot;glib-2.0 glib-2.0-native libcap libxml2 bison-native fl=
ex-native&quot;<br>
+DEPENDS =3D &quot;glib-2.0 glib-2.0-native libxml2 bison-native flex-nati=
ve&quot;<br>
<br>
-inherit meson pkgconfig gettext upstream-version-is-even gobject-introspe=
ction gtk-doc<br>
+inherit meson pkgconfig gettext upstream-version-is-even gobject-introspe=
ction<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6762ed442b3822387a51=
c92d928ead0d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De059138481205ee2c6fc1=
c079c016d0d&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/gstreamer-${PV}&quot;<br>
<br>
-SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 <a href=3D"https://gstreamer.freedesktop.org/src/gstreamer/=
gstreamer-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://gs=
treamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz</a> \<br>
-=C2=A0 =C2=A0 file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-no=
t-fal.patch \<br>
-=C2=A0 =C2=A0 file://0002-meson-build-gir-even-when-cross-compiling-if-in=
trosp.patch \<br>
-=C2=A0 =C2=A0 file://0003-meson-Add-valgrind-feature.patch \<br>
-=C2=A0 =C2=A0 file://0004-meson-Add-option-for-installed-tests.patch \<br=
>
-=C2=A0 =C2=A0 file://capfix.patch \<br>
-&quot;<br>
-SRC_URI[md5sum] =3D &quot;0e661ed5bdf1d8996e430228d022628e&quot;<br>
-SRC_URI[sha256sum] =3D &quot;e3f044246783fd685439647373fa13ba14f7ab0b346e=
add06437092f8419e94e&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/src/gstrea=
mer/gstreamer-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:=
//gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gst-gstpluginloader.=
c-when-env-var-is-set-do-not-fal.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Remove-unused-valgri=
nd-detection.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-meson-Add-option-for=
-installed-tests.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+SRC_URI[md5sum] =3D &quot;25d683630ff8b82b2c878aa3edd3c491&quot;<br>
+SRC_URI[sha256sum] =3D &quot;0ff09245b06c0aeb5d9a156edcab088a7e8213a0bf9c=
84a1ff0318f9c00c7805&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;PTEST_ENABLED&#3=
9;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chec=
k \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debu=
g \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tool=
s&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tool=
s \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0capa=
bilities&quot;<br>
<br>
=C2=A0PACKAGECONFIG[debug] =3D &quot;-Dgst_debug=3Dtrue,-Dgst_debug=3Dfals=
e&quot;<br>
=C2=A0PACKAGECONFIG[tracer-hooks] =3D &quot;-Dtracer_hooks=3Dtrue,-Dtracer=
_hooks=3Dfalse&quot;<br>
=C2=A0PACKAGECONFIG[check] =3D &quot;-Dcheck=3Denabled,-Dcheck=3Ddisabled&=
quot;<br>
=C2=A0PACKAGECONFIG[tests] =3D &quot;-Dtests=3Denabled -Dinstalled-tests=
=3Dtrue,-Dtests=3Ddisabled -Dinstalled-tests=3Dfalse&quot;<br>
-PACKAGECONFIG[valgrind] =3D &quot;-Dvalgrind=3Denabled,-Dvalgrind=3Ddisab=
led,valgrind,&quot;<br>
=C2=A0PACKAGECONFIG[unwind] =3D &quot;-Dlibunwind=3Denabled,-Dlibunwind=3D=
disabled,libunwind&quot;<br>
=C2=A0PACKAGECONFIG[dw] =3D &quot;-Dlibdw=3Denabled,-Dlibdw=3Ddisabled,elf=
utils&quot;<br>
=C2=A0PACKAGECONFIG[bash-completion] =3D &quot;-Dbash-completion=3Denabled=
,-Dbash-completion=3Ddisabled,bash-completion&quot;<br>
=C2=A0PACKAGECONFIG[tools] =3D &quot;-Dtools=3Denabled,-Dtools=3Ddisabled&=
quot;<br>
-PACKAGECONFIG[setcap] =3D &quot;-Dsetcap=3Denabled,-Dsetcap=3Ddisabled,li=
bcap libcap-native&quot;<br>
+PACKAGECONFIG[capabilities] =3D &quot;-Dptp-helper-permissions=3Dcapabili=
ties,-Dptp-helper-permissions=3Dnone,libcap libcap-native&quot;<br>
<br>
=C2=A0# TODO: put this in a gettext.bbclass patch<br>
=C2=A0def gettext_oemeson(d):<br>
@@ -52,15 +49,12 @@ def gettext_oemeson(d):<br>
=C2=A0 =C2=A0 =C2=A0return &#39;-Dnls=3Denabled&#39;<br>
<br>
=C2=A0EXTRA_OEMESON +=3D &quot; \<br>
+=C2=A0 =C2=A0 -Ddoc=3Ddisabled \<br>
=C2=A0 =C2=A0 =C2=A0-Dexamples=3Ddisabled \<br>
=C2=A0 =C2=A0 =C2=A0-Ddbghelp=3Ddisabled \<br>
=C2=A0 =C2=A0 =C2=A0${@gettext_oemeson(d)} \<br>
=C2=A0&quot;<br>
<br>
-GTKDOC_MESON_OPTION =3D &quot;gtk_doc&quot;<br>
-GTKDOC_MESON_ENABLE_FLAG =3D &quot;enabled&quot;<br>
-GTKDOC_MESON_DISABLE_FLAG =3D &quot;disabled&quot;<br>
-<br>
=C2=A0GIR_MESON_ENABLE_FLAG =3D &quot;enabled&quot;<br>
=C2=A0GIR_MESON_DISABLE_FLAG =3D &quot;disabled&quot;<br>
<br>
-- <br>
2.28.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000009ea6e405b179169c--
