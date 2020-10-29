Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web10.4874.1604009642888033337
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 15:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CuMGqbqM;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: quaresma.jose@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id c11so4698204iln.9
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 15:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YThyMKIla7qdeYcE1Dlp6TNMJNH94yXDac/Uo9AABss=;
        b=CuMGqbqMhpMUC4u8UOogtDfkPlAagILLRseHtRa3FmAhBkN26lAOx5toOCcO9J2HT7
         EnbTUaZsrHdADeKgtvNYJdLoLODdd7NAR1hW+wQZUqRV2AquNnDqysia+Pts5O8vu2Af
         lfB6NlKOcU3JQ/ncxxaZxWkUe6ZiVP6TyM9agesT39lA/fFMmYXKSBbojfiquvu4sRG1
         2SuQpRBmgYI9eqj07E6fZ0SNm1XLf4zdV115ii0KAszcWGeCAczeLLSr+jcsg5TK8s1l
         0CjxyxFcK7d8Ah+of8Amx45CSR8zBRMxaMwdk0gdzVAL/3zUppfFtEsUtCk+Gkj3Quxe
         t9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YThyMKIla7qdeYcE1Dlp6TNMJNH94yXDac/Uo9AABss=;
        b=N9XzqcMGg4anbFv4Bz8Ve5mRxPtTACW/Xl8mrO/f5XnRpV5VaNpGAv9y6HVtXrbBsp
         k6sK+HlsT/598KwK/u9IqbPeHqb2qnMGzZILJHA5AYwBycfAjTa4nNqREZT7ZpkU0KTq
         KzcJINsNvE3V5dFLeWX/O4KT0cxxKyDoEr5r8kldbAr27ngKU3NjR5WwovOnMRjShlwj
         INs7puyOE6CmC6I+zABSFwlXW1N+bDdOwnno6GemlwU3Xgr3Xj6R3idVkF5ybvMyh3JS
         VkswSXUxO1JDPJ81BFjY+CsNKT7ZfoYf/BU3L1SSaVRSL1lH5gNaYu2zORxjKemQjWlD
         Io4g==
X-Gm-Message-State: AOAM531FoNieN4qLIsMGFafg28akrDh3TTt7LFkfa/zFLxHtO93luP8o
	PMEtH2vl/Wo7wo6Gc5DXEZTNdnddH17UiDUwEtAMT9luDIUZMA==
X-Google-Smtp-Source: ABdhPJwHnphgqOd5nhjw/kLw66SCQJysOEKHK3M5DP77HiIDxfsKddioTPfoRgO8k56J3TDC/sumovFKSjxodxcNwZ8=
X-Received: by 2002:a92:b04:: with SMTP id b4mr4653396ilf.65.1604009642026;
 Thu, 29 Oct 2020 15:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201029142806.1830504-1-quaresma.jose@gmail.com> <16427CDA53DAE3E8.561@lists.openembedded.org>
In-Reply-To: <16427CDA53DAE3E8.561@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 29 Oct 2020 22:14:02 +0000
Message-ID: <CANPvuRm72w_O0=5J-mKNM+R+-8Oc3GdkwL=h0SgjJUaMs4uK4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 02/22] gstreamer1.0: upgrade to version 1.18.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
quinta, 29/10/2020 =C3=A0(s) 14:28:
>
>     * 0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
>       Submited
>       https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/669
>
>     * 0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch
>       Removed since these are included in 1.18.0
>
>     * 0003-meson-Add-valgrind-feature.patch
>       Removed because upstream don't depend anymore on valgrind
>       https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_request=
s/595
>
>     * 0002-Remove-unused-valgrind-detection.patch
>       Upstream-Status: Backport [a2cbf75523cdf8a4df1baa7007d86ef45597224=
5]
>       https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/a2cbf7=
5523cdf8a4df1baa7007d86ef455972245
>
>     API and plugin documentation are no longer built with gtk_doc.
>     The gtk_doc documentation has been removed in favour of a new unifie=
d
>     documentation module built with hotdoc.
>     Distributors should use the documentation release tarball instead of=
 trying
>     to package hotdoc and building the documentation from scratch.
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  ...der.c-when-env-var-is-set-do-not-fal.patch |  16 +--
>  ...002-Remove-unused-valgrind-detection.patch | 112 ++++++++++++++++++
>  ...even-when-cross-compiling-if-introsp.patch |  36 ------
>  ...eson-Add-option-for-installed-tests.patch} |  20 ++--
>  .../0003-meson-Add-valgrind-feature.patch     |  74 ------------
>  .../gstreamer/gstreamer1.0/0004-capfix.patch  |  48 ++++++++

I forgot to remove the ../gstreamer/gstreamer1.0/0004-capfix.patch
This is not need any more and its dropped on the last commit

>  ...er1.0_1.16.2.bb =3D> gstreamer1.0_1.18.0.bb} |  24 ++--
>  7 files changed, 188 insertions(+), 142 deletions(-)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-=
Remove-unused-valgrind-detection.patch
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-=
meson-build-gir-even-when-cross-compiling-if-introsp.patch
>  rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-meson-Add-o=
ption-for-installed-tests.patch =3D> 0003-meson-Add-option-for-installed-te=
sts.patch} (97%)
>  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-=
meson-Add-valgrind-feature.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-=
capfix.patch
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.2.bb =3D> g=
streamer1.0_1.18.0.bb} (78%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gst=
pluginloader.c-when-env-var-is-set-do-not-fal.patch b/meta/recipes-multimed=
ia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do=
-not-fal.patch
> index 67a872cddb..17f8a0beb7 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginl=
oader.c-when-env-var-is-set-do-not-fal.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginl=
oader.c-when-env-var-is-set-do-not-fal.patch
> @@ -1,7 +1,7 @@
> -From a1d7c582392c8bc87fa9411af77b20e011944357 Mon Sep 17 00:00:00 2001
> +From f700975f514758a4a7582c2c972fa54ecfca3302 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Thu, 25 Jan 2018 17:55:02 +0200
> -Subject: [PATCH] gst/gstpluginloader.c: when env var is set do not fall
> +Subject: [PATCH 1/4] gst/gstpluginloader.c: when env var is set do not =
fall
>   through to system plugin scanner
>
>  If we set a custom GST_PLUGIN_SCANNER env var, then we probably want to=
 use that and only that.
> @@ -9,17 +9,19 @@ If we set a custom GST_PLUGIN_SCANNER env var, then we=
 probably want to use that
>  Falling through to the one installed on the system is problamatic in cr=
oss-compilation
>  environemnts, regardless of whether one pointed to by the env var succe=
eded or failed.
>
> -Upstream-Status: Pending
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +written by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gs=
treamer/-/merge_requests/669]
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
>       helper_bin =3D g_strdup (env);
>       res =3D gst_plugin_loader_try_helper (loader, helper_bin);
>       g_free (helper_bin);
> @@ -31,5 +33,5 @@ index 430829d..3a75731 100644
>
>   #ifdef G_OS_WIN32
>  --
> -2.15.1
> +2.28.0
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-=
unused-valgrind-detection.patch b/meta/recipes-multimedia/gstreamer/gstream=
er1.0/0002-Remove-unused-valgrind-detection.patch
> new file mode 100644
> index 0000000000..c8bd58d471
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-=
valgrind-detection.patch
> @@ -0,0 +1,112 @@
> +From 355dd938bfb2cd36d6c3c4ed59ba1dcafdc78d95 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC3=3DBCller?=3D <tim@centricular.=
com>
> +Date: Fri, 14 Aug 2020 16:38:26 +0100
> +Subject: [PATCH 2/4] Remove unused valgrind detection
> +
> +Having this just to log a debug message in case we're
> +running inside valgrind doesn't seem very useful, and
> +the code that used to use this no longer exists it seems.
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_re=
quests/595>
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
> +@@ -116,8 +116,6 @@ G_GNUC_INTERNAL  gboolean _priv_plugin_deps_env_var=
s_changed (GstPlugin * plugin
> +
> + G_GNUC_INTERNAL  gboolean _priv_plugin_deps_files_changed (GstPlugin *=
 plugin);
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
> +@@ -304,36 +304,6 @@ static gboolean pretty_tags =3D PRETTY_TAGS_DEFAUL=
T;
> + static volatile gint G_GNUC_MAY_ALIAS __default_level =3D GST_LEVEL_DE=
FAULT;
> + static volatile gint G_GNUC_MAY_ALIAS __use_color =3D GST_DEBUG_COLOR_=
MODE_ON;
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
> +-  in_valgrind =3D GST_VG_UNCHECKED;
> +-
> +-  if (in_valgrind =3D=3D GST_VG_UNCHECKED) {
> +-#ifdef HAVE_VALGRIND_VALGRIND_H
> +-    if (RUNNING_ON_VALGRIND) {
> +-      GST_CAT_INFO (GST_CAT_GST_INIT, "we're running inside valgrind")=
;
> +-      in_valgrind =3D GST_VG_INSIDE;
> +-    } else {
> +-      GST_CAT_LOG (GST_CAT_GST_INIT, "not doing extra valgrind stuff")=
;
> +-      in_valgrind =3D GST_VG_NO_VALGRIND;
> +-    }
> +-#else
> +-    in_valgrind =3D GST_VG_NO_VALGRIND;
> +-#endif
> +-    g_assert (in_valgrind =3D=3D GST_VG_NO_VALGRIND ||
> +-        in_valgrind =3D=3D GST_VG_INSIDE);
> +-  }
> +-  return (in_valgrind =3D=3D GST_VG_INSIDE);
> +-}
> +-
> + static gchar *
> + _replace_pattern_in_gst_debug_file_name (gchar * name, const char *tok=
en,
> +     guint val)
> +@@ -462,9 +432,6 @@ _priv_gst_debug_init (void)
> +   _priv_GST_CAT_PROTECTION =3D
> +       _gst_debug_category_new ("GST_PROTECTION", 0, "protection");
> +
> +-  /* print out the valgrind message if we're in valgrind */
> +-  _priv_gst_in_valgrind ();
> +-
> +   env =3D g_getenv ("GST_DEBUG_OPTIONS");
> +   if (env !=3D NULL) {
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
> +@@ -200,7 +200,6 @@ check_headers =3D [
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
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-b=
uild-gir-even-when-cross-compiling-if-introsp.patch b/meta/recipes-multimed=
ia/gstreamer/gstreamer1.0/0002-meson-build-gir-even-when-cross-compiling-if=
-introsp.patch
> deleted file mode 100644
> index 1ed7198a5c..0000000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-meson-build-gi=
r-even-when-cross-compiling-if-introsp.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 35db4a2433fbdf8612cf98b5aab5b14aeb5372f8 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC3=3DBCller?=3D <tim@centricular.=
com>
> -Date: Thu, 17 Oct 2019 12:13:35 +0100
> -Subject: [PATCH] meson: build gir even when cross-compiling if introspe=
ction
> - was enabled explicitly
> -
> -This can be made to work in certain circumstances when
> -cross-compiling, so default to not building g-i stuff
> -when cross-compiling, but allow it if introspection was
> -enabled explicitly via -Dintrospection=3Denabled.
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
> -@@ -466,7 +466,7 @@ rt_lib =3D cc.find_library('rt', required : false)
> - gir =3D find_program('g-ir-scanner', required : get_option('introspect=
ion'))
> - gnome =3D import('gnome')
> -
> --build_gir =3D gir.found() and not meson.is_cross_build()
> -+build_gir =3D gir.found() and (not meson.is_cross_build() or get_optio=
n('introspection').enabled())
> -
> - gir_init_section =3D [ '--add-init-section=3Dextern void gst_init(gint=
*,gchar**);' + \
> -     'g_setenv("GST_REGISTRY_DISABLE", "yes", TRUE);' + \
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-A=
dd-option-for-installed-tests.patch b/meta/recipes-multimedia/gstreamer/gst=
reamer1.0/0003-meson-Add-option-for-installed-tests.patch
> similarity index 97%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Ad=
d-option-for-installed-tests.patch
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-=
option-for-installed-tests.patch
> index 0e6c44ea32..1c0e1f8171 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Add-opti=
on-for-installed-tests.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-opti=
on-for-installed-tests.patch
> @@ -1,7 +1,7 @@
> -From b843400284751968862751dfe93853f151551c64 Mon Sep 17 00:00:00 2001
> +From 24867db22a5cc35e7643bc218e959ce56c306aca Mon Sep 17 00:00:00 2001
>  From: Carlos Rafael Giani <crg7475@mailbox.org>
>  Date: Fri, 25 Oct 2019 00:06:26 +0200
> -Subject: [PATCH] meson: Add option for installed tests
> +Subject: [PATCH 3/4] meson: Add option for installed tests
>
>  This adds an option for producing installed versions of the unit tests.
>  These versions don't need meson to run (only a small shell script). Thi=
s
> @@ -77,10 +77,10 @@ index 0000000..5da86fb
>  +write_template(args.output, build_template(args.test_execdir, args.tes=
tname))
>  +os.chmod(args.output, 0o755)
>  diff --git a/meson_options.txt b/meson_options.txt
> -index 8afde39..8884dcc 100644
> +index 72c3997..346c423 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
> -@@ -16,6 +16,8 @@ option('poisoning', type : 'boolean', value : false, =
description : 'Enable poiso
> +@@ -15,6 +15,8 @@ option('poisoning', type : 'boolean', value : false, =
description : 'Enable poiso
>   option('memory-alignment', type: 'combo',
>          choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256', =
'512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
>          value: 'malloc')
> @@ -90,10 +90,10 @@ index 8afde39..8884dcc 100644
>   # Feature options
>   option('check', type : 'feature', value : 'auto', description : 'Build=
 unit test libraries')
>  diff --git a/tests/check/meson.build b/tests/check/meson.build
> -index 04da83f..2db7f76 100644
> +index 372ea41..bb0dcfa 100644
>  --- a/tests/check/meson.build
>  +++ b/tests/check/meson.build
> -@@ -118,11 +118,17 @@ if add_languages('cpp', required : false)
> +@@ -120,11 +120,17 @@ if add_languages('cpp', native: false, required: =
false)
>     ]
>   endif
>
> @@ -109,10 +109,10 @@ index 04da83f..2db7f76 100644
>     '-DGST_CHECK_TEST_ENVIRONMENT_BEACON=3D"GST_STATE_IGNORE_ELEMENTS"',
>  -  '-DTESTFILE=3D"' + meson.current_source_dir() + '/meson.build"',
>  +  '-DTESTFILE=3D"@0@"'.format(test_files_path + '/testfile'),
> -   '-DGST_USE_UNSTABLE_API',
>     '-DGST_DISABLE_DEPRECATED',
>   ]
> -@@ -137,6 +143,14 @@ endif
> +
> +@@ -138,6 +144,14 @@ endif
>   glib_deps =3D [gio_dep, gobject_dep, gmodule_dep, glib_dep]
>   gst_deps =3D [gst_dep, gst_base_dep, gst_check_dep, gst_net_dep, gst_c=
ontroller_dep]
>
> @@ -127,7 +127,7 @@ index 04da83f..2db7f76 100644
>   foreach t : core_tests
>     fname =3D t[0]
>     test_name =3D fname.split('.')[0].underscorify()
> -@@ -150,8 +164,38 @@ foreach t : core_tests
> +@@ -151,8 +165,38 @@ foreach t : core_tests
>           include_directories : [configinc],
>           link_with : link_with_libs,
>           dependencies : test_deps + glib_deps + gst_deps,
> @@ -253,5 +253,5 @@ index 0000000..89954e0
>  +......................................................................=
..........
>  +......................................................................=
..........
>  --
> -2.17.1
> +2.28.0
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-A=
dd-valgrind-feature.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/=
0003-meson-Add-valgrind-feature.patch
> deleted file mode 100644
> index f553340f4d..0000000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-Add-valg=
rind-feature.patch
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
> -@@ -199,7 +199,6 @@ check_headers =3D [
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
> -+valgrind_option =3D get_option('valgrind')
> -+if valgrind_option.disabled()
> -+  message('Valgrind support not requested; disabled.')
> -+else
> -+  valgrind_header =3D 'valgrind/valgrind.h'
> -+  has_valgrind_header =3D cc.has_header(valgrind_header)
> -+  if has_valgrind_header
> -+    message('Valgrind support requested, and header ' + valgrind_heade=
r + \
> -+        ' found. Enabled Valgrind support.')
> -+    define =3D 'HAVE_' + valgrind_header.underscorify().to_upper()
> -+    cdata.set(define, 1)
> -+  else
> -+    if valgrind_option.enabled()
> -+      error('Valgrind support requested and set as required, but heade=
r ' + \
> -+        valgrind_header + ' not found.')
> -+    else
> -+      message('Valgrind support requested, but header ' + valgrind_hea=
der + \
> -+        ' not found. Disabling Valgrind support.')
> -+    endif
> -+  endif
> -+endif
> -+
> - if cc.has_member('struct tm', 'tm_gmtoff', prefix : '#include <time.h>=
')
> -   cdata.set('HAVE_TM_GMTOFF', 1)
> - endif
> -diff --git a/meson_options.txt b/meson_options.txt
> -index e7ff7ba..8afde39 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -19,6 +19,7 @@ option('memory-alignment', type: 'combo',
> -
> - # Feature options
> - option('check', type : 'feature', value : 'auto', description : 'Build=
 unit test libraries')
> -+option('valgrind', type : 'feature', value : 'auto', description : 'En=
able Valgrind support')
> - option('libunwind', type : 'feature', value : 'auto', description : 'U=
se libunwind to generate backtraces')
> - option('libdw', type : 'feature', value : 'auto', description : 'Use l=
ibdw to generate better backtraces from libunwind')
> - option('dbghelp', type : 'feature', value : 'auto', description : 'Use=
 dbghelp to generate backtraces')
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.=
patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.patch
> new file mode 100644
> index 0000000000..32e9610cff
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-capfix.patch
> @@ -0,0 +1,48 @@
> +From 9607e9858d681f5ad2e1677f5dbbb1fb61bd8846 Mon Sep 17 00:00:00 2001
> +From: Jose Quaresma <quaresma.jose@gmail.com>
> +Date: Sun, 18 Oct 2020 10:40:59 +0100
> +Subject: [PATCH 4/4] Currently gstreamer configuration depends on wheth=
er
> + setcap is found on the host system. Turn this into a configure option =
to make
> + builds deterinistic.
> +
> +RP 2020/2/19
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Upstream-Status: Pending
> +---
> + libs/gst/helpers/meson.build | 7 ++++++-
> + meson_options.txt            | 1 +
> + 2 files changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/libs/gst/helpers/meson.build b/libs/gst/helpers/meson.buil=
d
> +index 9e5a4ae..c2e540f 100644
> +--- a/libs/gst/helpers/meson.build
> ++++ b/libs/gst/helpers/meson.build
> +@@ -66,7 +66,12 @@ if have_ptp
> +       description : 'getifaddrs() and AF_LINK is available')
> +   endif
> +
> +-  setcap_prog =3D find_program('setcap', '/usr/sbin/setcap', '/sbin/se=
tcap', required : false)
> ++  setcap_feature =3D get_option('setcap')
> ++  if setcap_feature.disabled()
> ++    setcap_prog =3D find_program('dontexist', required : false)
> ++  else
> ++    setcap_prog =3D find_program('setcap', '/usr/sbin/setcap', '/sbin/=
setcap', required : false)
> ++  endif
> +   cap_dep =3D dependency('libcap', required: false)
> +
> +   # user/group to change to in gst-ptp-helper
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 346c423..03338ad 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -25,6 +25,7 @@ option('libdw', type : 'feature', value : 'auto', des=
cription : 'Use libdw to ge
> + option('dbghelp', type : 'feature', value : 'auto', description : 'Use=
 dbghelp to generate backtraces')
> + option('bash-completion', type : 'feature', value : 'auto', descriptio=
n : 'Install bash completion files')
> + option('coretracers', type : 'feature', value : 'auto', description : =
'Build coretracers plugin')
> ++option('setcap', type : 'feature', value : 'auto', description : 'Use =
setcap')
> +
> + # Common feature options
> + option('examples', type : 'feature', value : 'auto', yield : true)
> +--
> +2.28.0
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb b/=
meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
> similarity index 78%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
> index 9d92fe1439..d382655bcb 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.0.bb
> @@ -8,22 +8,20 @@ LICENSE =3D "LGPLv2+"
>
>  DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 bison-native flex-native"
>
> -inherit meson pkgconfig gettext upstream-version-is-even gobject-intros=
pection gtk-doc
> +inherit meson pkgconfig gettext upstream-version-is-even gobject-intros=
pection
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928e=
ad0d \
>                      file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De=
059138481205ee2c6fc1c079c016d0d"
>
>  S =3D "${WORKDIR}/gstreamer-${PV}"
>
> -SRC_URI =3D " \
> -    https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar=
.xz \
> -    file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.pa=
tch \
> -    file://0002-meson-build-gir-even-when-cross-compiling-if-introsp.pa=
tch \
> -    file://0003-meson-Add-valgrind-feature.patch \
> -    file://0004-meson-Add-option-for-installed-tests.patch \
> -"
> -SRC_URI[md5sum] =3D "0e661ed5bdf1d8996e430228d022628e"
> -SRC_URI[sha256sum] =3D "e3f044246783fd685439647373fa13ba14f7ab0b346eadd=
06437092f8419e94e"
> +SRC_URI =3D "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-=
${PV}.tar.xz \
> +           file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not=
-fal.patch \
> +           file://0002-Remove-unused-valgrind-detection.patch \
> +           file://0003-meson-Add-option-for-installed-tests.patch \
> +           "
> +SRC_URI[md5sum] =3D "25d683630ff8b82b2c878aa3edd3c491"
> +SRC_URI[sha256sum] =3D "0ff09245b06c0aeb5d9a156edcab088a7e8213a0bf9c84a=
1ff0318f9c00c7805"
>
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests'=
, '', d)} \
>                     check \
> @@ -34,7 +32,6 @@ PACKAGECONFIG[debug] =3D "-Dgst_debug=3Dtrue,-Dgst_deb=
ug=3Dfalse"
>  PACKAGECONFIG[tracer-hooks] =3D "-Dtracer_hooks=3Dtrue,-Dtracer_hooks=
=3Dfalse"
>  PACKAGECONFIG[check] =3D "-Dcheck=3Denabled,-Dcheck=3Ddisabled"
>  PACKAGECONFIG[tests] =3D "-Dtests=3Denabled -Dinstalled-tests=3Dtrue,-D=
tests=3Ddisabled -Dinstalled-tests=3Dfalse"
> -PACKAGECONFIG[valgrind] =3D "-Dvalgrind=3Denabled,-Dvalgrind=3Ddisabled=
,valgrind,"
>  PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled=
,libunwind"
>  PACKAGECONFIG[dw] =3D "-Dlibdw=3Denabled,-Dlibdw=3Ddisabled,elfutils"
>  PACKAGECONFIG[bash-completion] =3D "-Dbash-completion=3Denabled,-Dbash-=
completion=3Ddisabled,bash-completion"
> @@ -51,15 +48,12 @@ def gettext_oemeson(d):
>      return '-Dnls=3Denabled'
>
>  EXTRA_OEMESON +=3D " \
> +    -Ddoc=3Ddisabled \
>      -Dexamples=3Ddisabled \
>      -Ddbghelp=3Ddisabled \
>      ${@gettext_oemeson(d)} \
>  "
>
> -GTKDOC_MESON_OPTION =3D "gtk_doc"
> -GTKDOC_MESON_ENABLE_FLAG =3D "enabled"
> -GTKDOC_MESON_DISABLE_FLAG =3D "disabled"
> -
>  GIR_MESON_ENABLE_FLAG =3D "enabled"
>  GIR_MESON_DISABLE_FLAG =3D "disabled"
>
> --
> 2.29.1
>
>
>=20
>


--=20
best regards,
Jos=C3=A9 Quaresma
