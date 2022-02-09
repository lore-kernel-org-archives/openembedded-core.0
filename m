Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93980C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 09:15:47 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.24229.1644398146305493084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 01:15:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VYBAru4E;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id i34so2969889lfv.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 01:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Utu75BjwXk0eshJopvKQMsnof55doNN57MLBa/14iyo=;
        b=VYBAru4EhdHSmYVsLQXfOlZJ8F6kMSsKi6AVh7wlsrTfWrVkV3S7FPYkNr44rykd+q
         160cmfSa9v8VXP1zqzi2ya0gxRuFRNjdrvUHC0RmPOBQrt8M0vgqEUtzVIbpPNl33s1f
         0SxzYkzp/66ZF7+mFRZLIVhvxECGfo2ApS4KiVeXVt7rkXfHQtvf5stWvtwWfxMHK7Er
         bGZzGG8uM2pp5Bd9Z0qYbw13Z32n36dAQb95xihhoSP1bIITWQc9NRZoxnky7YhZ4y9x
         zr9NLRwTuFt1gIN7YOfQxdKE8agKy2P67VBsuUIUgtLkGDKC0gTk80rihm0IRIe+Z1CP
         QqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Utu75BjwXk0eshJopvKQMsnof55doNN57MLBa/14iyo=;
        b=mft+PW2xdUuHFvUyxZQoSbY5jUMOYw6Bt3cOWNyHd8dAa2XvDNV4E5VnmMrfu0MsG9
         9uhp5g9tCXEzjcBJV6ohRZu8exysZVS8VKZQg51bOk/ZYQsRbljKAWLKDyP0U2ZKj5Fp
         Qu5shytYx2IeoIGvtVePUXhjZhBzcw05E/LYapN0dErLc1uHX+vYSZpWo6kqLxuJYpYV
         JiHcOBYQr35ZUUv07xXMwRX3NXwP0aD+XylQUCpwLek/PU9sh96w15Hipa5OTyMWnhhs
         ofc1VJhQ8elRFGfKT+GJzf0s2ik2/lgNlT8T2gfxyZqEbfrcWHT/LqEAB4tbNPiKfCCv
         Mmbg==
X-Gm-Message-State: AOAM532DZyXRSNg0NAVO6Qel0NcAk8M9ANM1C4ADmw+qLB47mpGrZT+J
	qHyk8PHn5YrtYwbL29kusGLzbvKUTXWtlXW+0Kk=
X-Google-Smtp-Source: 
 ABdhPJxgVE4azq31h1o4fMX6jYNy9j4xJFPbG43lNSml94QwQftqp8ujilYLVAr5aOxQtufk/HQNlmXFbTIK18w8/t0=
X-Received: by 2002:a05:6512:159e:: with SMTP id
 bp30mr961676lfb.324.1644398144035;
 Wed, 09 Feb 2022 01:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
 <20220207010823.143664-7-quaresma.jose@gmail.com>
 <CANNYZj8SNr_MA86N9kL7jQw27QV8gDtwH_hSD_a9tfTVL8xd+Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8SNr_MA86N9kL7jQw27QV8gDtwH_hSD_a9tfTVL8xd+Q@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 9 Feb 2022 09:15:32 +0000
Message-ID: 
 <CANPvuRkJpThUEjiKfzvg4m+Dz_-ChDRu8Yy1LsSnTmK8FdgoDg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/17] gstreamer1.0: upgrade 1.18.5 -> 1.20.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Claudius Heine <ch@denx.de>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000003e9da505d792474e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 09:15:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161544

--0000000000003e9da505d792474e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Can you please clarify in what target arch is this happening and I can try
to replicate it with qemu?

It works on my side on qemux86-64.

root@qemux86-64:~# /usr/libexec/installed-tests/gstreamer/gst_gstbin.sh
+ CK_DEFAULT_TIMEOUT=3D20
+ GST_PLUGIN_LOADING_WHITELIST=3Dgstreamer
+ GST_REGISTRY=3D/home/root/.cache/gstreamer-1.0/gst_gstbin.registry
+ GST_STATE_IGNORE_ELEMENTS=3D
+ exec /usr/libexec/installed-tests/gstreamer/gst_gstbin
Running suite(s): GstBin
100%: Checks: 26, Failures: 0, Errors: 0
Check suite gst_bin ran in 6.239s (tests failed: 0)


Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia ter=C3=A7a, 8/02=
/2022
=C3=A0(s) 22:01:

> Unfortunately this patchset (which is now in master) does not address
> the ptest fail. Please resolve this as soon as possible.
>
> + exec /usr/libexec/installed-tests/gstreamer/gst_gstbin
> Running suite(s): GstBin
> Executing: gstreamer/gst_gstbin.test
> Executing: gstreamer/gst_gstbin.test
> ....
> Executing: gstreamer/gst_gstbin.test
> Executing: gstreamer/gst_gstbin.test
> Test timed out after 300 seconds
> FAIL: gstreamer/gst_gstbin.test (Child process killed by signal 9)
>
> Alex
>
> On Mon, 7 Feb 2022 at 02:08, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > - License update:
> >   The code actually is LGPLv2.1 but the COPYING file is wrong.
> >
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d157b23fb0ce1=
75b167611a4cb019599d9017042
> >
> > - Drop backported patches
> >   0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
> >   0002-Remove-unused-valgrind-detection.patch
> >   0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
> >
> > - Update submitted patches
> >   0001-tests-respect-the-idententaion-used-in-meson.patch
> >   0002-tests-add-support-for-install-the-tests.patch
> >   0003-tests-use-a-dictionaries-for-environment.patch
> >   0004-tests-add-helper-script-to-run-the-installed_tests.patch
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  ...der.c-when-env-var-is-set-do-not-fal.patch |  69 -----------
> >  ...pect-the-idententaion-used-in-meson.patch} |  14 +--
> >  ...002-Remove-unused-valgrind-detection.patch | 112 ------------------
> >  ...s-add-support-for-install-the-tests.patch} |  67 ++++++-----
> >  ...-use-too-strict-timeout-for-validati.patch |  32 -----
> >  ...-use-a-dictionaries-for-environment.patch} |  28 +++--
> >  ...er-script-to-run-the-installed_tests.patch |  74 ++++++++++++
> >  ...-the-environment-for-installed_tests.patch |  58 ---------
> >  ...er1.0_1.18.5.bb =3D> gstreamer1.0_1.20.0.bb} |  17 ++-
> >  9 files changed, 136 insertions(+), 335 deletions(-)
> >  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c=
-when-env-var-is-set-do-not-fal.patch
> >  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-tests-respect-the-id=
ententaion-used-in-meson.patch
> =3D> 0001-tests-respect-the-idententaion-used-in-meson.patch} (71%)
> >  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgrin=
d-detection.patch
> >  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0/{0005-tests-add-support-fo=
r-install-the-tests.patch
> =3D> 0002-tests-add-support-for-install-the-tests.patch} (65%)
> >  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use-=
too-strict-timeout-for-validati.patch
> >  rename
> meta/recipes-multimedia/gstreamer/gstreamer1.0/{0006-tests-use-a-dictiona=
ries-for-environment.patch
> =3D> 0003-tests-use-a-dictionaries-for-environment.patch} (61%)
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-scri=
pt-to-run-the-installed_tests.patch
> >  delete mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-env=
ironment-for-installed_tests.patch
> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.5.bb =3D>
> gstreamer1.0_1.20.0.bb} (76%)
> >
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader=
.c-when-env-var-is-set-do-not-fal.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader=
.c-when-env-var-is-set-do-not-fal.patch
> > deleted file mode 100644
> > index 23ebd5c600..0000000000
> > ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader=
.c-when-env-var-is-set-do-not-fal.patch
> > +++ /dev/null
> > @@ -1,69 +0,0 @@
> > -From fd8f49dba8c09d47425da80f5faab3bfa4a7c962 Mon Sep 17 00:00:00 2001
> > -From: Jose Quaresma <quaresma.jose@gmail.com>
> > -Date: Sat, 10 Oct 2020 19:09:03 +0000
> > -Subject: [PATCH 1/3] gstpluginloader: when env var is set do not fall
> through
> > - to system plugin scanner
> > -
> > -If we set a custom GST_PLUGIN_SCANNER env var, then we probably want t=
o
> use that and only that.
> > -
> > -Falling through to the one installed on the system is problamatic in
> cross-compilation
> > -environemnts, regardless of whether one pointed to by the env var
> succeeded or failed.
> > -
> > -taken from:
> > -
> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-multim=
edia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-=
do-not-fal.patch?id=3D0db7ba34ca41b107042306d13a6f0162885c123b
> > -
> > -Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669>
> > -
> > -Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9f958058697e6=
fbf5bde325228034572331d1a3a
> ]
> > -
> > -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ----
> > - gst/gstpluginloader.c | 15 +++++++--------
> > - 1 file changed, 7 insertions(+), 8 deletions(-)
> > -
> > -diff --git a/gst/gstpluginloader.c b/gst/gstpluginloader.c
> > -index d1e404d98..c626bf263 100644
> > ---- a/gst/gstpluginloader.c
> > -+++ b/gst/gstpluginloader.c
> > -@@ -464,20 +464,19 @@ gst_plugin_loader_spawn (GstPluginLoader * loade=
r)
> > -   if (loader->child_running)
> > -     return TRUE;
> > -
> > --  /* Find the gst-plugin-scanner: first try the env-var if it is set,
> > --   * otherwise use the installed version */
> > -+  /* Find the gst-plugin-scanner */
> > -   env =3D g_getenv ("GST_PLUGIN_SCANNER_1_0");
> > -   if (env =3D=3D NULL)
> > -     env =3D g_getenv ("GST_PLUGIN_SCANNER");
> > -
> > -   if (env !=3D NULL && *env !=3D '\0') {
> > -+    /* use the env-var if it is set */
> > -     GST_LOG ("Trying GST_PLUGIN_SCANNER env var: %s", env);
> > -     helper_bin =3D g_strdup (env);
> > -     res =3D gst_plugin_loader_try_helper (loader, helper_bin);
> > -     g_free (helper_bin);
> > --  }
> > --
> > --  if (!res) {
> > -+  } else {
> > -+    /* use the installed version */
> > -     GST_LOG ("Trying installed plugin scanner");
> > -
> > - #ifdef G_OS_WIN32
> > -@@ -497,10 +496,10 @@ gst_plugin_loader_spawn (GstPluginLoader * loade=
r)
> > - #endif
> > -     res =3D gst_plugin_loader_try_helper (loader, helper_bin);
> > -     g_free (helper_bin);
> > -+  }
> > -
> > --    if (!res) {
> > --      GST_INFO ("No gst-plugin-scanner available, or not working");
> > --    }
> > -+  if (!res) {
> > -+    GST_INFO ("No gst-plugin-scanner available, or not working");
> > -   }
> > -
> > -   return loader->child_running;
> > ---
> > -2.29.2
> > -
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-the-i=
dententaion-used-in-meson.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-i=
dententaion-used-in-meson.patch
> > similarity index 71%
> > rename from
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-the-ide=
ntentaion-used-in-meson.patch
> > rename to
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-ide=
ntentaion-used-in-meson.patch
> > index 6f571a12d8..312c04fbfd 100644
> > ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-the-i=
dententaion-used-in-meson.patch
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-i=
dententaion-used-in-meson.patch
> > @@ -1,4 +1,4 @@
> > -From 122e5ac3dd16a461b6ae595605490c8f5d1c3a9d Mon Sep 17 00:00:00 2001
> > +From 1eb77a4ea5a3967c688d8f1192f99c605badc7e2 Mon Sep 17 00:00:00 2001
> >  From: Jose Quaresma <quaresma.jose@gmail.com>
> >  Date: Sun, 11 Apr 2021 19:48:13 +0100
> >  Subject: [PATCH 1/4] tests: respect the idententaion used in meson
> > @@ -7,13 +7,13 @@ Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-
> >
> >  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> >  ---
> > - tests/check/meson.build | 10 +++++-----
> > + subprojects/gstreamer/tests/check/meson.build | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > -diff --git a/tests/check/meson.build b/tests/check/meson.build
> > -index a617cf159..b2636714b 100644
> > ---- a/tests/check/meson.build
> > -+++ b/tests/check/meson.build
> > +diff --git a/subprojects/gstreamer/tests/check/meson.build
> b/subprojects/gstreamer/tests/check/meson.build
> > +index 9c4228b6e4..506606684d 100644
> > +--- a/subprojects/gstreamer/tests/check/meson.build
> > ++++ b/subprojects/gstreamer/tests/check/meson.build
> >  @@ -146,11 +146,11 @@ foreach t : core_tests
> >
> >     if not skip_test
> > @@ -32,5 +32,5 @@ index a617cf159..b2636714b 100644
> >
> >       env =3D environment()
> >  --
> > -2.31.1
> > +2.33.1
> >
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgr=
ind-detection.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgr=
ind-detection.patch
> > deleted file mode 100644
> > index 5121044734..0000000000
> > ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgr=
ind-detection.patch
> > +++ /dev/null
> > @@ -1,112 +0,0 @@
> > -From e275ba2bd854ac15a4b65a8f07d9f042021950da Mon Sep 17 00:00:00 2001
> > -From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC3=3DBCller?=3D <tim@centricular=
.com>
> > -Date: Fri, 14 Aug 2020 16:38:26 +0100
> > -Subject: [PATCH 2/3] Remove unused valgrind detection
> > -
> > -Having this just to log a debug message in case we're
> > -running inside valgrind doesn't seem very useful, and
> > -the code that used to use this no longer exists it seems.
> > -
> > -Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595>
> > -
> > -Upstream-Status: Backport [a2cbf75523cdf8a4df1baa7007d86ef455972245]
> > -
> > -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ----
> > - gst/gst_private.h |  2 --
> > - gst/gstinfo.c     | 39 ---------------------------------------
> > - meson.build       |  1 -
> > - 3 files changed, 42 deletions(-)
> > -
> > -diff --git a/gst/gst_private.h b/gst/gst_private.h
> > -index eefd044..8252ede 100644
> > ---- a/gst/gst_private.h
> > -+++ b/gst/gst_private.h
> > -@@ -116,8 +116,6 @@ G_GNUC_INTERNAL  gboolean
> _priv_plugin_deps_env_vars_changed (GstPlugin * plugin
> > -
> > - G_GNUC_INTERNAL  gboolean _priv_plugin_deps_files_changed (GstPlugin =
*
> plugin);
> > -
> > --G_GNUC_INTERNAL  gboolean _priv_gst_in_valgrind (void);
> > --
> > - /* init functions called from gst_init(). */
> > - G_GNUC_INTERNAL  void  _priv_gst_quarks_initialize (void);
> > - G_GNUC_INTERNAL  void  _priv_gst_mini_object_initialize (void);
> > -diff --git a/gst/gstinfo.c b/gst/gstinfo.c
> > -index eea1a21..d3035d6 100644
> > ---- a/gst/gstinfo.c
> > -+++ b/gst/gstinfo.c
> > -@@ -305,36 +305,6 @@ static gboolean pretty_tags =3D PRETTY_TAGS_DEFAU=
LT;
> > - static gint G_GNUC_MAY_ALIAS __default_level =3D GST_LEVEL_DEFAULT;
> > - static gint G_GNUC_MAY_ALIAS __use_color =3D GST_DEBUG_COLOR_MODE_ON;
> > -
> > --/* FIXME: export this? */
> > --gboolean
> > --_priv_gst_in_valgrind (void)
> > --{
> > --  static enum
> > --  {
> > --    GST_VG_UNCHECKED,
> > --    GST_VG_NO_VALGRIND,
> > --    GST_VG_INSIDE
> > --  }
> > --  in_valgrind =3D GST_VG_UNCHECKED;
> > --
> > --  if (in_valgrind =3D=3D GST_VG_UNCHECKED) {
> > --#ifdef HAVE_VALGRIND_VALGRIND_H
> > --    if (RUNNING_ON_VALGRIND) {
> > --      GST_CAT_INFO (GST_CAT_GST_INIT, "we're running inside valgrind"=
);
> > --      in_valgrind =3D GST_VG_INSIDE;
> > --    } else {
> > --      GST_CAT_LOG (GST_CAT_GST_INIT, "not doing extra valgrind stuff"=
);
> > --      in_valgrind =3D GST_VG_NO_VALGRIND;
> > --    }
> > --#else
> > --    in_valgrind =3D GST_VG_NO_VALGRIND;
> > --#endif
> > --    g_assert (in_valgrind =3D=3D GST_VG_NO_VALGRIND ||
> > --        in_valgrind =3D=3D GST_VG_INSIDE);
> > --  }
> > --  return (in_valgrind =3D=3D GST_VG_INSIDE);
> > --}
> > --
> > - static gchar *
> > - _replace_pattern_in_gst_debug_file_name (gchar * name, const char
> *token,
> > -     guint val)
> > -@@ -463,9 +433,6 @@ _priv_gst_debug_init (void)
> > -   _priv_GST_CAT_PROTECTION =3D
> > -       _gst_debug_category_new ("GST_PROTECTION", 0, "protection");
> > -
> > --  /* print out the valgrind message if we're in valgrind */
> > --  _priv_gst_in_valgrind ();
> > --
> > -   env =3D g_getenv ("GST_DEBUG_OPTIONS");
> > -   if (env !=3D NULL) {
> > -     if (strstr (env, "full_tags") || strstr (env, "full-tags"))
> > -@@ -2505,12 +2472,6 @@ gst_debug_construct_win_color (guint colorinfo)
> > -   return 0;
> > - }
> > -
> > --gboolean
> > --_priv_gst_in_valgrind (void)
> > --{
> > --  return FALSE;
> > --}
> > --
> > - void
> > - _gst_debug_dump_mem (GstDebugCategory * cat, const gchar * file,
> > -     const gchar * func, gint line, GObject * obj, const gchar * msg,
> > -diff --git a/meson.build b/meson.build
> > -index 82a1728..42ae617 100644
> > ---- a/meson.build
> > -+++ b/meson.build
> > -@@ -200,7 +200,6 @@ check_headers =3D [
> > -   'sys/wait.h',
> > -   'ucontext.h',
> > -   'unistd.h',
> > --  'valgrind/valgrind.h',
> > -   'sys/resource.h',
> > -   'sys/uio.h',
> > - ]
> > ---
> > -2.29.2
> > -
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-support-f=
or-install-the-tests.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-f=
or-install-the-tests.patch
> > similarity index 65%
> > rename from
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-support-for=
-install-the-tests.patch
> > rename to
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for=
-install-the-tests.patch
> > index b77fb5797f..d18c19c397 100644
> > ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-support-f=
or-install-the-tests.patch
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-f=
or-install-the-tests.patch
> > @@ -1,4 +1,4 @@
> > -From c9e93c7a3e4d2773abef4f5e1464af24f36700b3 Mon Sep 17 00:00:00 2001
> > +From 62f5bb7bfc2498219df7280e73480d8ed2378ce5 Mon Sep 17 00:00:00 2001
> >  From: Jose Quaresma <quaresma.jose@gmail.com>
> >  Date: Sun, 11 Apr 2021 19:48:13 +0100
> >  Subject: [PATCH 2/4] tests: add support for install the tests
> > @@ -11,54 +11,44 @@ Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-
> >
> >  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> >  ---
> > - meson.build             |  5 +++++
> > - meson_options.txt       |  1 +
> > - template.test.in        |  3 +++
> > - tests/check/meson.build | 22 +++++++++++++++++++++-
> > - 4 files changed, 30 insertions(+), 1 deletion(-)
> > - create mode 100644 template.test.in
> > + subprojects/gstreamer/meson.build             |  4 ++++
> > + subprojects/gstreamer/meson_options.txt       |  1 +
> > + subprojects/gstreamer/tests/check/meson.build | 22 ++++++++++++++++++=
-
> > + .../gstreamer/tests/check/template.test.in    |  3 +++
> > + 4 files changed, 29 insertions(+), 1 deletion(-)
> > + create mode 100644 subprojects/gstreamer/tests/check/template.test.in
> >
> > -diff --git a/meson.build b/meson.build
> > -index c4e8774f5..1abf4eb26 100644
> > ---- a/meson.build
> > -+++ b/meson.build
> > -@@ -562,6 +562,11 @@ if bashcomp_dep.found()
> > +diff --git a/subprojects/gstreamer/meson.build
> b/subprojects/gstreamer/meson.build
> > +index d20fe0040f..b595d8f990 100644
> > +--- a/subprojects/gstreamer/meson.build
> > ++++ b/subprojects/gstreamer/meson.build
> > +@@ -562,6 +562,10 @@ if bashcomp_dep.found()
> >     endif
> >   endif
> >
> > ++installed_tests_enabled =3D get_option('installed_tests')
> >  +installed_tests_metadir =3D join_paths(datadir, 'installed-tests',
> meson.project_name())
> >  +installed_tests_execdir =3D join_paths(libexecdir, 'installed-tests',
> meson.project_name())
> > -+installed_tests_enabled =3D get_option('installed-tests')
> > -+installed_tests_template =3D files('template.test.in')
> >  +
> >   plugins_install_dir =3D join_paths(get_option('libdir'), 'gstreamer-1=
.0')
> >
> >   pkgconfig =3D import('pkgconfig')
> > -diff --git a/meson_options.txt b/meson_options.txt
> > -index c8cee3762..b5da40eaa 100644
> > ---- a/meson_options.txt
> > -+++ b/meson_options.txt
> > +diff --git a/subprojects/gstreamer/meson_options.txt
> b/subprojects/gstreamer/meson_options.txt
> > +index 7363bdb7a1..a34ba37dad 100644
> > +--- a/subprojects/gstreamer/meson_options.txt
> > ++++ b/subprojects/gstreamer/meson_options.txt
> >  @@ -15,6 +15,7 @@ option('poisoning', type : 'boolean', value : false,
> description : 'Enable poiso
> >   option('memory-alignment', type: 'combo',
> >          choices : ['1', '2', '4', '8', '16', '32', '64', '128', '256',
> '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize'],
> >          value: 'malloc')
> > -+option('installed-tests', type : 'boolean', value : false, descriptio=
n
> : 'Enable installed tests')
> > ++option('installed_tests', type : 'boolean', value : false, descriptio=
n
> : 'Enable installed tests')
> >
> >   # Feature options
> >   option('check', type : 'feature', value : 'auto', description : 'Buil=
d
> unit test libraries')
> > -diff --git a/template.test.in b/template.test.in
> > -new file mode 100644
> > -index 000000000..f701627f8
> > ---- /dev/null
> > -+++ b/template.test.in
> > -@@ -0,0 +1,3 @@
> > -+[Test]
> > -+Type=3Dsession
> > -+Exec=3D@installed_tests_dir@/@program@
> > -diff --git a/tests/check/meson.build b/tests/check/meson.build
> > -index b2636714b..a697a7b06 100644
> > ---- a/tests/check/meson.build
> > -+++ b/tests/check/meson.build
> > +diff --git a/subprojects/gstreamer/tests/check/meson.build
> b/subprojects/gstreamer/tests/check/meson.build
> > +index 506606684d..00a138a568 100644
> > +--- a/subprojects/gstreamer/tests/check/meson.build
> > ++++ b/subprojects/gstreamer/tests/check/meson.build
> >  @@ -124,10 +124,16 @@ test_defines =3D [
> >     '-UG_DISABLE_ASSERT',
> >     '-UG_DISABLE_CAST_CHECKS',
> > @@ -95,7 +85,7 @@ index b2636714b..a697a7b06 100644
> >  +      test_conf.set('installed_tests_dir', join_paths(prefix,
> installed_tests_execdir))
> >  +      test_conf.set('program', test_name)
> >  +      configure_file(
> > -+        input: installed_tests_template,
> > ++        input: 'template.test.in',
> >  +        output: test_name + '.test',
> >  +        install_dir: installed_tests_metadir,
> >  +        configuration: test_conf
> > @@ -105,6 +95,15 @@ index b2636714b..a697a7b06 100644
> >       test(test_name, exe, env: env, timeout : 3 * 60)
> >     endif
> >   endforeach
> > +diff --git a/subprojects/gstreamer/tests/check/template.test.in
> b/subprojects/gstreamer/tests/check/template.test.in
> > +new file mode 100644
> > +index 0000000000..f701627f87
> > +--- /dev/null
> > ++++ b/subprojects/gstreamer/tests/check/template.test.in
> > +@@ -0,0 +1,3 @@
> > ++[Test]
> > ++Type=3Dsession
> > ++Exec=3D@installed_tests_dir@/@program@
> >  --
> > -2.31.1
> > +2.33.1
> >
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-us=
e-too-strict-timeout-for-validati.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-us=
e-too-strict-timeout-for-validati.patch
> > deleted file mode 100644
> > index e0e64e2c7a..0000000000
> > ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-us=
e-too-strict-timeout-for-validati.patch
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -From 1db36347d05d88835519368442e9aa89c64091ad Mon Sep 17 00:00:00 2001
> > -From: Seungha Yang <seungha@centricular.com>
> > -Date: Tue, 15 Sep 2020 00:54:58 +0900
> > -Subject: [PATCH] tests: seek: Don't use too strict timeout for
> validation
> > -
> > -Expected segment-done message might not be seen within expected
> > -time if system is not powerful enough.
> > -
> > -Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/625>
> > -
> > -Upstream-Status: Backport [
> https://cgit.freedesktop.org/gstreamer/gstreamer/commit?id=3Df44312ae5d83=
1438fcf8041162079c65321c588c
> ]
> > -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > ----
> > - tests/check/pipelines/seek.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/tests/check/pipelines/seek.c b/tests/check/pipelines/seek=
.c
> > -index 28bb8846d..5f7447bc5 100644
> > ---- a/tests/check/pipelines/seek.c
> > -+++ b/tests/check/pipelines/seek.c
> > -@@ -521,7 +521,7 @@ GST_START_TEST (test_loopback_2)
> > -
> > -   GST_INFO ("wait for segment done message");
> > -
> > --  msg =3D gst_bus_timed_pop_filtered (bus, (GstClockTime) 2 * GST_SEC=
OND,
> > -+  msg =3D gst_bus_timed_pop_filtered (bus, GST_CLOCK_TIME_NONE,
> > -       GST_MESSAGE_SEGMENT_DONE | GST_MESSAGE_ERROR);
> > -   fail_unless (msg, "no message within the timed window");
> > -   fail_unless_equals_string (GST_MESSAGE_TYPE_NAME (msg),
> "segment-done");
> > ---
> > -2.29.2
> > -
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-diction=
aries-for-environment.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-diction=
aries-for-environment.patch
> > similarity index 61%
> > rename from
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-dictionar=
ies-for-environment.patch
> > rename to
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictionar=
ies-for-environment.patch
> > index 46813cec3d..10a6dcc619 100644
> > ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-diction=
aries-for-environment.patch
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-diction=
aries-for-environment.patch
> > @@ -1,4 +1,4 @@
> > -From e82dedec1803922656e92285fc1bb75b2cdc0aad Mon Sep 17 00:00:00 2001
> > +From fe830f0f75f3b4b41e3dbef8d4cf6ee4103c9e06 Mon Sep 17 00:00:00 2001
> >  From: Jose Quaresma <quaresma.jose@gmail.com>
> >  Date: Sat, 24 Apr 2021 10:34:47 +0100
> >  Subject: [PATCH 3/4] tests: use a dictionaries for environment
> > @@ -10,29 +10,31 @@ Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-
> >
> >  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> >  ---
> > - tests/check/meson.build | 19 +++++++++++--------
> > - 1 file changed, 11 insertions(+), 8 deletions(-)
> > + subprojects/gstreamer/tests/check/meson.build | 21 ++++++++++++------=
-
> > + 1 file changed, 13 insertions(+), 8 deletions(-)
> >
> > -diff --git a/tests/check/meson.build b/tests/check/meson.build
> > -index a697a7b06..f64524904 100644
> > ---- a/tests/check/meson.build
> > -+++ b/tests/check/meson.build
> > -@@ -161,14 +161,17 @@ foreach t : core_tests
> > +diff --git a/subprojects/gstreamer/tests/check/meson.build
> b/subprojects/gstreamer/tests/check/meson.build
> > +index 00a138a568..48ec2532f8 100644
> > +--- a/subprojects/gstreamer/tests/check/meson.build
> > ++++ b/subprojects/gstreamer/tests/check/meson.build
> > +@@ -161,14 +161,19 @@ foreach t : core_tests
> >         install: installed_tests_enabled,
> >       )
> >
> >  -    env =3D environment()
> > --    env.set('GST_PLUGIN_PATH_1_0', meson.build_root())
> > +-    env.set('GST_PLUGIN_PATH_1_0', meson.project_build_root())
> >  -    env.set('GST_PLUGIN_SYSTEM_PATH_1_0', '')
> >  -    env.set('GST_STATE_IGNORE_ELEMENTS', '')
> >  -    env.set('CK_DEFAULT_TIMEOUT', '20')
> >  -    env.set('GST_REGISTRY', '@0@/@1@.registry'.format(meson.current_b=
uild_dir(),
> test_name))
> >  -    env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir +
> '/gst-plugin-scanner')
> >  -    env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
> > -+    # environment() can't be passed to configure_file and it is neede=
d
> for installed_tests
> > -+    # use a dictionary as this is simplest solution to install the
> environment
> > ++    # meson environment object can't be passed to configure_file and
> > ++    # installed tests uses configure_file to install the environment.
> > ++    # use a dictionary as this is the simplest solution
> > ++    # to install the environment.
> >  +    env =3D {
> > -+      'GST_PLUGIN_PATH_1_0': meson.build_root(),
> > ++      'GST_PLUGIN_PATH_1_0': meson.project_build_root(),
> >  +      'GST_PLUGIN_SYSTEM_PATH_1_0': '',
> >  +      'GST_STATE_IGNORE_ELEMENTS': '',
> >  +      'CK_DEFAULT_TIMEOUT': '20',
> > @@ -44,5 +46,5 @@ index a697a7b06..f64524904 100644
> >       if installed_tests_enabled
> >         test_conf =3D configuration_data()
> >  --
> > -2.31.1
> > +2.33.1
> >
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-sc=
ript-to-run-the-installed_tests.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-sc=
ript-to-run-the-installed_tests.patch
> > new file mode 100644
> > index 0000000000..efa004f8ce
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-sc=
ript-to-run-the-installed_tests.patch
> > @@ -0,0 +1,74 @@
> > +From 4dcbabebca2ad6f1fdd59ee35a858082e87db7b6 Mon Sep 17 00:00:00 2001
> > +From: Jose Quaresma <quaresma.jose@gmail.com>
> > +Date: Sun, 2 May 2021 01:58:01 +0100
> > +Subject: [PATCH 4/4] tests: add helper script to run the installed_tes=
ts
> > +
> > +- this is a bash script that will run the installed_tests
> > +with some of the environment variables used in the meson
> > +testing framework.
> > +
> > +Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789]
> > +
> > +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > +---
> > + subprojects/gstreamer/tests/check/meson.build   | 17 ++++++++++++++++=
+
> > + .../gstreamer/tests/check/template.sh.in        |  9 +++++++++
> > + .../gstreamer/tests/check/template.test.in      |  2 +-
> > + 3 files changed, 27 insertions(+), 1 deletion(-)
> > + create mode 100755 subprojects/gstreamer/tests/check/template.sh.in
> > +
> > +diff --git a/subprojects/gstreamer/tests/check/meson.build
> b/subprojects/gstreamer/tests/check/meson.build
> > +index 48ec2532f8..7dc4990d4e 100644
> > +--- a/subprojects/gstreamer/tests/check/meson.build
> > ++++ b/subprojects/gstreamer/tests/check/meson.build
> > +@@ -185,6 +185,23 @@ foreach t : core_tests
> > +         install_dir: installed_tests_metadir,
> > +         configuration: test_conf
> > +       )
> > ++
> > ++      # All the tests will be deployed on the target machine and
> > ++      # we use the home folder ~ for the registry which will then
> expand at runtime.
> > ++      # Using the /tmp/gstreamer-1.0/@0@.registry can be problematic
> as it mostly
> > ++      # is mounted using tmpfs and if the machine crash from some
> reason we can lost the registry
> > ++      # that is useful for debug propose of the tests itself.
> > ++      env +=3D {'GST_REGISTRY': '~/.cache/gstreamer-1.0/@0@
> .registry'.format(test_name)}
> > ++
> > ++      # Set the full path for the test it self.
> > ++      env +=3D {'TEST': '@0@/@1@'.format(join_paths(prefix,
> installed_tests_execdir), test_name)}
> > ++
> > ++      configure_file(
> > ++        input : 'template.sh.in',
> > ++        output: test_name + '.sh',
> > ++        install_dir: installed_tests_execdir,
> > ++        configuration : env,
> > ++      )
> > +     endif
> > +
> > +     test(test_name, exe, env: env, timeout : 3 * 60)
> > +diff --git a/subprojects/gstreamer/tests/check/template.sh.in
> b/subprojects/gstreamer/tests/check/template.sh.in
> > +new file mode 100755
> > +index 0000000000..cf7d31b0ea
> > +--- /dev/null
> > ++++ b/subprojects/gstreamer/tests/check/template.sh.in
> > +@@ -0,0 +1,9 @@
> > ++#!/bin/sh
> > ++
> > ++set -ax
> > ++
> > ++CK_DEFAULT_TIMEOUT=3D"@CK_DEFAULT_TIMEOUT@"
> > ++GST_PLUGIN_LOADING_WHITELIST=3D"@GST_PLUGIN_LOADING_WHITELIST@"
> > ++GST_REGISTRY=3D@GST_REGISTRY@
> > ++GST_STATE_IGNORE_ELEMENTS=3D"@GST_STATE_IGNORE_ELEMENTS@"
> > ++exec @TEST@
> > +diff --git a/subprojects/gstreamer/tests/check/template.test.in
> b/subprojects/gstreamer/tests/check/template.test.in
> > +index f701627f87..b74ef6ad73 100644
> > +--- a/subprojects/gstreamer/tests/check/template.test.in
> > ++++ b/subprojects/gstreamer/tests/check/template.test.in
> > +@@ -1,3 +1,3 @@
> > + [Test]
> > + Type=3Dsession
> > +-Exec=3D@installed_tests_dir@/@program@
> > ++Exec=3D@installed_tests_dir@/@program@.sh
> > +--
> > +2.33.1
> > +
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-e=
nvironment-for-installed_tests.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-e=
nvironment-for-installed_tests.patch
> > deleted file mode 100644
> > index eabe7bcbe1..0000000000
> > ---
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-e=
nvironment-for-installed_tests.patch
> > +++ /dev/null
> > @@ -1,58 +0,0 @@
> > -From 57d2965e979f886e03eecd7e351bf01812053971 Mon Sep 17 00:00:00 2001
> > -From: Jose Quaresma <quaresma.jose@gmail.com>
> > -Date: Sun, 2 May 2021 01:58:01 +0100
> > -Subject: [PATCH 4/4] tests: install the environment for installed_test=
s
> > -
> > -- adapt the test environment for installed_tests
> > -- install the test environment for installed_tests
> > -- run the tests using the installed environment
> > -
> > -Upstream-Status: Submitted [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789]
> > -
> > -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ----
> > - template.test.in        |  2 +-
> > - tests/check/meson.build | 18 ++++++++++++++++++
> > - 2 files changed, 19 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/template.test.in b/template.test.in
> > -index f701627f8..9a3fbdd09 100644
> > ---- a/template.test.in
> > -+++ b/template.test.in
> > -@@ -1,3 +1,3 @@
> > - [Test]
> > - Type=3Dsession
> > --Exec=3D@installed_tests_dir@/@program@
> > -+Exec=3Dsh -c 'set -aex && source @installed_tests_dir@/@program@.env =
&&
> exec @installed_tests_dir@/@program@'
> > -diff --git a/tests/check/meson.build b/tests/check/meson.build
> > -index f64524904..a67e0f8dd 100644
> > ---- a/tests/check/meson.build
> > -+++ b/tests/check/meson.build
> > -@@ -183,6 +183,24 @@ foreach t : core_tests
> > -         install_dir: installed_tests_metadir,
> > -         configuration: test_conf
> > -       )
> > -+
> > -+      env +=3D {'GST_REGISTRY': '~/.cache/gstreamer-1.0/@0@
> .registry'.format(test_name)}
> > -+      configure_file(
> > -+        output: test_name + '.env',
> > -+        install_dir: installed_tests_execdir,
> > -+        configuration : env,
> > -+      )
> > -+      # helper to convert a meson environment dictionay object
> exported with configure_file
> > -+      # this also remove not needed variables for the installed tests
> > -+      meson.add_postconf_script('sed', '-i',
> > -+        '-e', '/^#define/!d',
> > -+        '-e', 's/^#define //g',
> > -+        '-e', '/^GST_PLUGIN_PATH_1_0/d',
> > -+        '-e', '/^GST_PLUGIN_SYSTEM_PATH_1_0/d',
> > -+        '-e', '/^GST_PLUGIN_SCANNER_1_0/d',
> > -+        '-e', 's/ /=3D/',
> > -+        join_paths(meson.current_build_dir(), test_name + '.env')
> > -+      )
> > -     endif
> > -
> > -     test(test_name, exe, env: env, timeout : 3 * 60)
> > ---
> > -2.31.1
> > -
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
> > similarity index 76%
> > rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
> > rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
> > index 0d82dd338c..243f99fee9 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
> > @@ -10,22 +10,19 @@ DEPENDS =3D "glib-2.0 glib-2.0-native libxml2
> bison-native flex-native"
> >
> >  inherit meson pkgconfig gettext upstream-version-is-even
> gobject-introspection ptest-gnome
> >
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6762ed442b3822387a51c92d928=
ead0d
> \
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa044cb77e486cc36129f=
7a770
> \
> >
> file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De059138481205ee2c6fc1c0=
79c016d0d"
> >
> >  S =3D "${WORKDIR}/gstreamer-${PV}"
> >
> >  SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
> >             file://run-ptest \
> > -
>  file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
> > -           file://0002-Remove-unused-valgrind-detection.patch \
> > -
>  file://0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
> > -
>  file://0004-tests-respect-the-idententaion-used-in-meson.patch \
> > -           file://0005-tests-add-support-for-install-the-tests.patch \
> > -           file://0006-tests-use-a-dictionaries-for-environment.patch =
\
> > -
>  file://0007-tests-install-the-environment-for-installed_tests.patch \
> > +
>  file://0001-tests-respect-the-idententaion-used-in-meson.patch;stripleve=
l=3D3
> \
> > +
>  file://0002-tests-add-support-for-install-the-tests.patch;striplevel=3D3=
 \
> > +
>  file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3D=
3 \
> > +
>  file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;str=
iplevel=3D3
> \
> >             "
> > -SRC_URI[sha256sum] =3D
> "55862232a63459bbf56abebde3085ca9aec211b478e891dacea4d6df8cafe80a"
> > +SRC_URI[sha256sum] =3D
> "edf4bffff85591d4fff7b21bb9ed7f0feabc123ac4a4eff29e73cbce454f9db7"
> >
> >  PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests=
',
> '', d)} \
> >                     check \
> > @@ -36,7 +33,7 @@ PACKAGECONFIG[debug] =3D
> "-Dgst_debug=3Dtrue,-Dgst_debug=3Dfalse"
> >  PACKAGECONFIG[tracer-hooks] =3D "-Dtracer_hooks=3Dtrue,-Dtracer_hooks=
=3Dfalse"
> >  PACKAGECONFIG[coretracers] =3D
> "-Dcoretracers=3Denabled,-Dcoretracers=3Ddisabled"
> >  PACKAGECONFIG[check] =3D "-Dcheck=3Denabled,-Dcheck=3Ddisabled"
> > -PACKAGECONFIG[tests] =3D "-Dtests=3Denabled
> -Dinstalled-tests=3Dtrue,-Dtests=3Ddisabled -Dinstalled-tests=3Dfalse"
> > +PACKAGECONFIG[tests] =3D "-Dtests=3Denabled
> -Dinstalled_tests=3Dtrue,-Dtests=3Ddisabled -Dinstalled_tests=3Dfalse"
> >  PACKAGECONFIG[unwind] =3D
> "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,libunwind"
> >  PACKAGECONFIG[dw] =3D "-Dlibdw=3Denabled,-Dlibdw=3Ddisabled,elfutils"
> >  PACKAGECONFIG[bash-completion] =3D
> "-Dbash-completion=3Denabled,-Dbash-completion=3Ddisabled,bash-completion=
"
> > --
> > 2.35.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#161427):
> https://lists.openembedded.org/g/openembedded-core/message/161427
> > Mute This Topic: https://lists.openembedded.org/mt/88962313/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000003e9da505d792474e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alexander,</div><div><br></div><div><div>Can=C2=A0=
you please clarify in what target arch is this happening and I can try to r=
eplicate it with qemu?</div><div></div></div><div><br></div><div>It works o=
n my side on=C2=A0qemux86-64.</div><div><br></div><div><span style=3D"font-=
family:monospace"><span style=3D"color:rgb(0,0,0)">root@qemux86-64:~# /usr/=
libexec/installed-tests/gstreamer/gst_gstbin.sh
</span><br>+ CK_DEFAULT_TIMEOUT=3D20
<br>+ GST_PLUGIN_LOADING_WHITELIST=3Dgstreamer
<br>+ GST_REGISTRY=3D/home/root/.cache/gstreamer-1.0/gst_gstbin.registry
<br>+ GST_STATE_IGNORE_ELEMENTS=3D
<br>+ exec /usr/libexec/installed-tests/gstreamer/gst_gstbin
<br>Running suite(s): GstBin
<br>100%: Checks: 26, Failures: 0, Errors: 0
<br>Check suite gst_bin ran in 6.239s (tests failed: 0)<br>
<br></span></div><div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@=
gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 8/02/=
2022 =C3=A0(s) 22:01:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Unfortunately this patchset (which is now in master) does not address=
<br>
the ptest fail. Please resolve this as soon as possible.<br>
<br>
+ exec /usr/libexec/installed-tests/gstreamer/gst_gstbin<br>
Running suite(s): GstBin<br>
Executing: gstreamer/gst_gstbin.test<br>
Executing: gstreamer/gst_gstbin.test<br>
....<br>
Executing: gstreamer/gst_gstbin.test<br>
Executing: gstreamer/gst_gstbin.test<br>
Test timed out after 300 seconds<br>
FAIL: gstreamer/gst_gstbin.test (Child process killed by signal 9)<br>
<br>
Alex<br>
<br>
On Mon, 7 Feb 2022 at 02:08, Jose Quaresma &lt;<a href=3D"mailto:quaresma.j=
ose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; - License update:<br>
&gt;=C2=A0 =C2=A0The code actually is LGPLv2.1 but the COPYING file is wron=
g.<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstrea=
mer/-/commit/d157b23fb0ce175b167611a4cb019599d9017042" rel=3D"noreferrer" t=
arget=3D"_blank">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commi=
t/d157b23fb0ce175b167611a4cb019599d9017042</a><br>
&gt;<br>
&gt; - Drop backported patches<br>
&gt;=C2=A0 =C2=A00001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.=
patch<br>
&gt;=C2=A0 =C2=A00002-Remove-unused-valgrind-detection.patch<br>
&gt;=C2=A0 =C2=A00003-tests-seek-Don-t-use-too-strict-timeout-for-validati.=
patch<br>
&gt;<br>
&gt; - Update submitted patches<br>
&gt;=C2=A0 =C2=A00001-tests-respect-the-idententaion-used-in-meson.patch<br=
>
&gt;=C2=A0 =C2=A00002-tests-add-support-for-install-the-tests.patch<br>
&gt;=C2=A0 =C2=A00003-tests-use-a-dictionaries-for-environment.patch<br>
&gt;=C2=A0 =C2=A00004-tests-add-helper-script-to-run-the-installed_tests.pa=
tch<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...der.c-when-env-var-is-set-do-not-fal.patch |=C2=A0 69 -------=
----<br>
&gt;=C2=A0 ...pect-the-idententaion-used-in-meson.patch} |=C2=A0 14 +--<br>
&gt;=C2=A0 ...002-Remove-unused-valgrind-detection.patch | 112 ------------=
------<br>
&gt;=C2=A0 ...s-add-support-for-install-the-tests.patch} |=C2=A0 67 ++++++-=
----<br>
&gt;=C2=A0 ...-use-too-strict-timeout-for-validati.patch |=C2=A0 32 -----<b=
r>
&gt;=C2=A0 ...-use-a-dictionaries-for-environment.patch} |=C2=A0 28 +++--<b=
r>
&gt;=C2=A0 ...er-script-to-run-the-installed_tests.patch |=C2=A0 74 +++++++=
+++++<br>
&gt;=C2=A0 ...-the-environment-for-installed_tests.patch |=C2=A0 58 -------=
--<br>
&gt;=C2=A0 ...<a href=3D"http://er1.0_1.18.5.bb" rel=3D"noreferrer" target=
=3D"_blank">er1.0_1.18.5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0_1.20=
.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.0.bb</a>} |=
=C2=A0 17 ++-<br>
&gt;=C2=A0 9 files changed, 136 insertions(+), 335 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-test=
s-respect-the-idententaion-used-in-meson.patch =3D&gt; 0001-tests-respect-t=
he-idententaion-used-in-meson.patch} (71%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0/0002-Remove-unused-valgrind-detection.patch<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0005-test=
s-add-support-for-install-the-tests.patch =3D&gt; 0002-tests-add-support-fo=
r-install-the-tests.patch} (65%)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0/0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0006-test=
s-use-a-dictionaries-for-environment.patch =3D&gt; 0003-tests-use-a-diction=
aries-for-environment.patch} (61%)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0/0004-tests-add-helper-script-to-run-the-installed_tests.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0/0007-tests-install-the-environment-for-installed_tests.patch<br>
&gt;=C2=A0 rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstr=
eamer1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.18.=
5.bb</a> =3D&gt; <a href=3D"http://gstreamer1.0_1.20.0.bb" rel=3D"noreferre=
r" target=3D"_blank">gstreamer1.0_1.20.0.bb</a>} (76%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-g=
stpluginloader.c-when-env-var-is-set-do-not-fal.patch b/meta/recipes-multim=
edia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-=
do-not-fal.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 23ebd5c600..0000000000<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstplugi=
nloader.c-when-env-var-is-set-do-not-fal.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,69 +0,0 @@<br>
&gt; -From fd8f49dba8c09d47425da80f5faab3bfa4a7c962 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; -Date: Sat, 10 Oct 2020 19:09:03 +0000<br>
&gt; -Subject: [PATCH 1/3] gstpluginloader: when env var is set do not fall=
 through<br>
&gt; - to system plugin scanner<br>
&gt; -<br>
&gt; -If we set a custom GST_PLUGIN_SCANNER env var, then we probably want =
to use that and only that.<br>
&gt; -<br>
&gt; -Falling through to the one installed on the system is problamatic in =
cross-compilation<br>
&gt; -environemnts, regardless of whether one pointed to by the env var suc=
ceeded or failed.<br>
&gt; -<br>
&gt; -taken from:<br>
&gt; -<a href=3D"http://cgit.openembedded.org/openembedded-core/commit/meta=
/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-=
env-var-is-set-do-not-fal.patch?id=3D0db7ba34ca41b107042306d13a6f0162885c12=
3b" rel=3D"noreferrer" target=3D"_blank">http://cgit.openembedded.org/opene=
mbedded-core/commit/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst=
-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch?id=3D0db7ba34ca41b1=
07042306d13a6f0162885c123b</a><br>
&gt; -<br>
&gt; -Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/669" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669</a>&gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/9f958058697e6fbf5bde325228034572331d1a3a" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/9f958058697e6fbf5bde325228034572331d1a3a</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmai=
l.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - gst/gstpluginloader.c | 15 +++++++--------<br>
&gt; - 1 file changed, 7 insertions(+), 8 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/gst/gstpluginloader.c b/gst/gstpluginloader.c<br>
&gt; -index d1e404d98..c626bf263 100644<br>
&gt; ---- a/gst/gstpluginloader.c<br>
&gt; -+++ b/gst/gstpluginloader.c<br>
&gt; -@@ -464,20 +464,19 @@ gst_plugin_loader_spawn (GstPluginLoader * load=
er)<br>
&gt; -=C2=A0 =C2=A0if (loader-&gt;child_running)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return TRUE;<br>
&gt; -<br>
&gt; --=C2=A0 /* Find the gst-plugin-scanner: first try the env-var if it i=
s set,<br>
&gt; --=C2=A0 =C2=A0* otherwise use the installed version */<br>
&gt; -+=C2=A0 /* Find the gst-plugin-scanner */<br>
&gt; -=C2=A0 =C2=A0env =3D g_getenv (&quot;GST_PLUGIN_SCANNER_1_0&quot;);<b=
r>
&gt; -=C2=A0 =C2=A0if (env =3D=3D NULL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0env =3D g_getenv (&quot;GST_PLUGIN_SCANNER&quot;)=
;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0if (env !=3D NULL &amp;&amp; *env !=3D &#39;\0&#39;) {<b=
r>
&gt; -+=C2=A0 =C2=A0 /* use the env-var if it is set */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0GST_LOG (&quot;Trying GST_PLUGIN_SCANNER env var:=
 %s&quot;, env);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0helper_bin =3D g_strdup (env);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0res =3D gst_plugin_loader_try_helper (loader, hel=
per_bin);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0g_free (helper_bin);<br>
&gt; --=C2=A0 }<br>
&gt; --<br>
&gt; --=C2=A0 if (!res) {<br>
&gt; -+=C2=A0 } else {<br>
&gt; -+=C2=A0 =C2=A0 /* use the installed version */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0GST_LOG (&quot;Trying installed plugin scanner&qu=
ot;);<br>
&gt; -<br>
&gt; - #ifdef G_OS_WIN32<br>
&gt; -@@ -497,10 +496,10 @@ gst_plugin_loader_spawn (GstPluginLoader * load=
er)<br>
&gt; - #endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0res =3D gst_plugin_loader_try_helper (loader, hel=
per_bin);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0g_free (helper_bin);<br>
&gt; -+=C2=A0 }<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 if (!res) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 GST_INFO (&quot;No gst-plugin-scanner available=
, or not working&quot;);<br>
&gt; --=C2=A0 =C2=A0 }<br>
&gt; -+=C2=A0 if (!res) {<br>
&gt; -+=C2=A0 =C2=A0 GST_INFO (&quot;No gst-plugin-scanner available, or no=
t working&quot;);<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0return loader-&gt;child_running;<br>
&gt; ---<br>
&gt; -2.29.2<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests=
-respect-the-idententaion-used-in-meson.patch b/meta/recipes-multimedia/gst=
reamer/gstreamer1.0/0001-tests-respect-the-idententaion-used-in-meson.patch=
<br>
&gt; similarity index 71%<br>
&gt; rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-=
respect-the-idententaion-used-in-meson.patch<br>
&gt; rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-re=
spect-the-idententaion-used-in-meson.patch<br>
&gt; index 6f571a12d8..312c04fbfd 100644<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respec=
t-the-idententaion-used-in-meson.patch<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respec=
t-the-idententaion-used-in-meson.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 122e5ac3dd16a461b6ae595605490c8f5d1c3a9d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 1eb77a4ea5a3967c688d8f1192f99c605badc7e2 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Sun, 11 Apr 2021 19:48:13 +0100<br>
&gt;=C2=A0 Subject: [PATCH 1/4] tests: respect the idententaion used in mes=
on<br>
&gt; @@ -7,13 +7,13 @@ Upstream-Status: Submitted [<a href=3D"https://gitla=
b.freedesktop.org/gstreamer/gstreamer/-" rel=3D"noreferrer" target=3D"_blan=
k">https://gitlab.freedesktop.org/gstreamer/gstreamer/-</a><br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose=
@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - tests/check/meson.build | 10 +++++-----<br>
&gt; + subprojects/gstreamer/tests/check/meson.build | 10 +++++-----<br>
&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; -diff --git a/tests/check/meson.build b/tests/check/meson.build<br>
&gt; -index a617cf159..b2636714b 100644<br>
&gt; ---- a/tests/check/meson.build<br>
&gt; -+++ b/tests/check/meson.build<br>
&gt; +diff --git a/subprojects/gstreamer/tests/check/meson.build b/subproje=
cts/gstreamer/tests/check/meson.build<br>
&gt; +index 9c4228b6e4..506606684d 100644<br>
&gt; +--- a/subprojects/gstreamer/tests/check/meson.build<br>
&gt; ++++ b/subprojects/gstreamer/tests/check/meson.build<br>
&gt;=C2=A0 @@ -146,11 +146,11 @@ foreach t : core_tests<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0if not skip_test<br>
&gt; @@ -32,5 +32,5 @@ index a617cf159..b2636714b 100644<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D environment()<br>
&gt;=C2=A0 --<br>
&gt; -2.31.1<br>
&gt; +2.33.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remov=
e-unused-valgrind-detection.patch b/meta/recipes-multimedia/gstreamer/gstre=
amer1.0/0002-Remove-unused-valgrind-detection.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 5121044734..0000000000<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unuse=
d-valgrind-detection.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,112 +0,0 @@<br>
&gt; -From e275ba2bd854ac15a4b65a8f07d9f042021950da Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"=
mailto:tim@centricular.com" target=3D"_blank">tim@centricular.com</a>&gt;<b=
r>
&gt; -Date: Fri, 14 Aug 2020 16:38:26 +0100<br>
&gt; -Subject: [PATCH 2/3] Remove unused valgrind detection<br>
&gt; -<br>
&gt; -Having this just to log a debug message in case we&#39;re<br>
&gt; -running inside valgrind doesn&#39;t seem very useful, and<br>
&gt; -the code that used to use this no longer exists it seems.<br>
&gt; -<br>
&gt; -Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/595" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595</a>&gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [a2cbf75523cdf8a4df1baa7007d86ef455972245]<=
br>
&gt; -<br>
&gt; -Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmai=
l.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - gst/gst_private.h |=C2=A0 2 --<br>
&gt; - gst/gstinfo.c=C2=A0 =C2=A0 =C2=A0| 39 ------------------------------=
---------<br>
&gt; - meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
&gt; - 3 files changed, 42 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/gst/gst_private.h b/gst/gst_private.h<br>
&gt; -index eefd044..8252ede 100644<br>
&gt; ---- a/gst/gst_private.h<br>
&gt; -+++ b/gst/gst_private.h<br>
&gt; -@@ -116,8 +116,6 @@ G_GNUC_INTERNAL=C2=A0 gboolean _priv_plugin_deps_=
env_vars_changed (GstPlugin * plugin<br>
&gt; -<br>
&gt; - G_GNUC_INTERNAL=C2=A0 gboolean _priv_plugin_deps_files_changed (GstP=
lugin * plugin);<br>
&gt; -<br>
&gt; --G_GNUC_INTERNAL=C2=A0 gboolean _priv_gst_in_valgrind (void);<br>
&gt; --<br>
&gt; - /* init functions called from gst_init(). */<br>
&gt; - G_GNUC_INTERNAL=C2=A0 void=C2=A0 _priv_gst_quarks_initialize (void);=
<br>
&gt; - G_GNUC_INTERNAL=C2=A0 void=C2=A0 _priv_gst_mini_object_initialize (v=
oid);<br>
&gt; -diff --git a/gst/gstinfo.c b/gst/gstinfo.c<br>
&gt; -index eea1a21..d3035d6 100644<br>
&gt; ---- a/gst/gstinfo.c<br>
&gt; -+++ b/gst/gstinfo.c<br>
&gt; -@@ -305,36 +305,6 @@ static gboolean pretty_tags =3D PRETTY_TAGS_DEFA=
ULT;<br>
&gt; - static gint G_GNUC_MAY_ALIAS __default_level =3D GST_LEVEL_DEFAULT;<=
br>
&gt; - static gint G_GNUC_MAY_ALIAS __use_color =3D GST_DEBUG_COLOR_MODE_ON=
;<br>
&gt; -<br>
&gt; --/* FIXME: export this? */<br>
&gt; --gboolean<br>
&gt; --_priv_gst_in_valgrind (void)<br>
&gt; --{<br>
&gt; --=C2=A0 static enum<br>
&gt; --=C2=A0 {<br>
&gt; --=C2=A0 =C2=A0 GST_VG_UNCHECKED,<br>
&gt; --=C2=A0 =C2=A0 GST_VG_NO_VALGRIND,<br>
&gt; --=C2=A0 =C2=A0 GST_VG_INSIDE<br>
&gt; --=C2=A0 }<br>
&gt; --=C2=A0 in_valgrind =3D GST_VG_UNCHECKED;<br>
&gt; --<br>
&gt; --=C2=A0 if (in_valgrind =3D=3D GST_VG_UNCHECKED) {<br>
&gt; --#ifdef HAVE_VALGRIND_VALGRIND_H<br>
&gt; --=C2=A0 =C2=A0 if (RUNNING_ON_VALGRIND) {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 GST_CAT_INFO (GST_CAT_GST_INIT, &quot;we&#39;re=
 running inside valgrind&quot;);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 in_valgrind =3D GST_VG_INSIDE;<br>
&gt; --=C2=A0 =C2=A0 } else {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 GST_CAT_LOG (GST_CAT_GST_INIT, &quot;not doing =
extra valgrind stuff&quot;);<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 in_valgrind =3D GST_VG_NO_VALGRIND;<br>
&gt; --=C2=A0 =C2=A0 }<br>
&gt; --#else<br>
&gt; --=C2=A0 =C2=A0 in_valgrind =3D GST_VG_NO_VALGRIND;<br>
&gt; --#endif<br>
&gt; --=C2=A0 =C2=A0 g_assert (in_valgrind =3D=3D GST_VG_NO_VALGRIND ||<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 in_valgrind =3D=3D GST_VG_INSIDE);<br>
&gt; --=C2=A0 }<br>
&gt; --=C2=A0 return (in_valgrind =3D=3D GST_VG_INSIDE);<br>
&gt; --}<br>
&gt; --<br>
&gt; - static gchar *<br>
&gt; - _replace_pattern_in_gst_debug_file_name (gchar * name, const char *t=
oken,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0guint val)<br>
&gt; -@@ -463,9 +433,6 @@ _priv_gst_debug_init (void)<br>
&gt; -=C2=A0 =C2=A0_priv_GST_CAT_PROTECTION =3D<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0_gst_debug_category_new (&quot;GST_PROTECT=
ION&quot;, 0, &quot;protection&quot;);<br>
&gt; -<br>
&gt; --=C2=A0 /* print out the valgrind message if we&#39;re in valgrind */=
<br>
&gt; --=C2=A0 _priv_gst_in_valgrind ();<br>
&gt; --<br>
&gt; -=C2=A0 =C2=A0env =3D g_getenv (&quot;GST_DEBUG_OPTIONS&quot;);<br>
&gt; -=C2=A0 =C2=A0if (env !=3D NULL) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (strstr (env, &quot;full_tags&quot;) || strstr=
 (env, &quot;full-tags&quot;))<br>
&gt; -@@ -2505,12 +2472,6 @@ gst_debug_construct_win_color (guint colorinfo=
)<br>
&gt; -=C2=A0 =C2=A0return 0;<br>
&gt; - }<br>
&gt; -<br>
&gt; --gboolean<br>
&gt; --_priv_gst_in_valgrind (void)<br>
&gt; --{<br>
&gt; --=C2=A0 return FALSE;<br>
&gt; --}<br>
&gt; --<br>
&gt; - void<br>
&gt; - _gst_debug_dump_mem (GstDebugCategory * cat, const gchar * file,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0const gchar * func, gint line, GObject * obj, con=
st gchar * msg,<br>
&gt; -diff --git a/meson.build b/meson.build<br>
&gt; -index 82a1728..42ae617 100644<br>
&gt; ---- a/meson.build<br>
&gt; -+++ b/meson.build<br>
&gt; -@@ -200,7 +200,6 @@ check_headers =3D [<br>
&gt; -=C2=A0 =C2=A0&#39;sys/wait.h&#39;,<br>
&gt; -=C2=A0 =C2=A0&#39;ucontext.h&#39;,<br>
&gt; -=C2=A0 =C2=A0&#39;unistd.h&#39;,<br>
&gt; --=C2=A0 &#39;valgrind/valgrind.h&#39;,<br>
&gt; -=C2=A0 =C2=A0&#39;sys/resource.h&#39;,<br>
&gt; -=C2=A0 =C2=A0&#39;sys/uio.h&#39;,<br>
&gt; - ]<br>
&gt; ---<br>
&gt; -2.29.2<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests=
-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreame=
r/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch<br>
&gt; similarity index 65%<br>
&gt; rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-=
add-support-for-install-the-tests.patch<br>
&gt; rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-ad=
d-support-for-install-the-tests.patch<br>
&gt; index b77fb5797f..d18c19c397 100644<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-su=
pport-for-install-the-tests.patch<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-su=
pport-for-install-the-tests.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From c9e93c7a3e4d2773abef4f5e1464af24f36700b3 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 62f5bb7bfc2498219df7280e73480d8ed2378ce5 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Sun, 11 Apr 2021 19:48:13 +0100<br>
&gt;=C2=A0 Subject: [PATCH 2/4] tests: add support for install the tests<br=
>
&gt; @@ -11,54 +11,44 @@ Upstream-Status: Submitted [<a href=3D"https://git=
lab.freedesktop.org/gstreamer/gstreamer/-" rel=3D"noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/gstreamer/gstreamer/-</a><br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose=
@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5=
 +++++<br>
&gt; - meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; - <a href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_bl=
ank">template.test.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +++<br>
&gt; - tests/check/meson.build | 22 +++++++++++++++++++++-<br>
&gt; - 4 files changed, 30 insertions(+), 1 deletion(-)<br>
&gt; - create mode 100644 <a href=3D"http://template.test.in" rel=3D"norefe=
rrer" target=3D"_blank">template.test.in</a><br>
&gt; + subprojects/gstreamer/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 ++++<br>
&gt; + subprojects/gstreamer/meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 1 +<br>
&gt; + subprojects/gstreamer/tests/check/meson.build | 22 +++++++++++++++++=
+-<br>
&gt; + .../gstreamer/tests/check/<a href=3D"http://template.test.in" rel=3D=
"noreferrer" target=3D"_blank">template.test.in</a>=C2=A0 =C2=A0 |=C2=A0 3 =
+++<br>
&gt; + 4 files changed, 29 insertions(+), 1 deletion(-)<br>
&gt; + create mode 100644 subprojects/gstreamer/tests/check/<a href=3D"http=
://template.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.in<=
/a><br>
&gt;<br>
&gt; -diff --git a/meson.build b/meson.build<br>
&gt; -index c4e8774f5..1abf4eb26 100644<br>
&gt; ---- a/meson.build<br>
&gt; -+++ b/meson.build<br>
&gt; -@@ -562,6 +562,11 @@ if bashcomp_dep.found()<br>
&gt; +diff --git a/subprojects/gstreamer/meson.build b/subprojects/gstreame=
r/meson.build<br>
&gt; +index d20fe0040f..b595d8f990 100644<br>
&gt; +--- a/subprojects/gstreamer/meson.build<br>
&gt; ++++ b/subprojects/gstreamer/meson.build<br>
&gt; +@@ -562,6 +562,10 @@ if bashcomp_dep.found()<br>
&gt;=C2=A0 =C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;<br>
&gt; ++installed_tests_enabled =3D get_option(&#39;installed_tests&#39;)<br=
>
&gt;=C2=A0 +installed_tests_metadir =3D join_paths(datadir, &#39;installed-=
tests&#39;, meson.project_name())<br>
&gt;=C2=A0 +installed_tests_execdir =3D join_paths(libexecdir, &#39;install=
ed-tests&#39;, meson.project_name())<br>
&gt; -+installed_tests_enabled =3D get_option(&#39;installed-tests&#39;)<br=
>
&gt; -+installed_tests_template =3D files(&#39;<a href=3D"http://template.t=
est.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a>&#39;)<br>
&gt;=C2=A0 +<br>
&gt;=C2=A0 =C2=A0plugins_install_dir =3D join_paths(get_option(&#39;libdir&=
#39;), &#39;gstreamer-1.0&#39;)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0pkgconfig =3D import(&#39;pkgconfig&#39;)<br>
&gt; -diff --git a/meson_options.txt b/meson_options.txt<br>
&gt; -index c8cee3762..b5da40eaa 100644<br>
&gt; ---- a/meson_options.txt<br>
&gt; -+++ b/meson_options.txt<br>
&gt; +diff --git a/subprojects/gstreamer/meson_options.txt b/subprojects/gs=
treamer/meson_options.txt<br>
&gt; +index 7363bdb7a1..a34ba37dad 100644<br>
&gt; +--- a/subprojects/gstreamer/meson_options.txt<br>
&gt; ++++ b/subprojects/gstreamer/meson_options.txt<br>
&gt;=C2=A0 @@ -15,6 +15,7 @@ option(&#39;poisoning&#39;, type : &#39;boolea=
n&#39;, value : false, description : &#39;Enable poiso<br>
&gt;=C2=A0 =C2=A0option(&#39;memory-alignment&#39;, type: &#39;combo&#39;,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 choices : [&#39;1&#39;, &#39;2&#39;,=
 &#39;4&#39;, &#39;8&#39;, &#39;16&#39;, &#39;32&#39;, &#39;64&#39;, &#39;1=
28&#39;, &#39;256&#39;, &#39;512&#39;, &#39;1024&#39;, &#39;2048&#39;, &#39=
;4096&#39;, &#39;8192&#39;, &#39;malloc&#39;, &#39;pagesize&#39;],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value: &#39;malloc&#39;)<br>
&gt; -+option(&#39;installed-tests&#39;, type : &#39;boolean&#39;, value : =
false, description : &#39;Enable installed tests&#39;)<br>
&gt; ++option(&#39;installed_tests&#39;, type : &#39;boolean&#39;, value : =
false, description : &#39;Enable installed tests&#39;)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# Feature options<br>
&gt;=C2=A0 =C2=A0option(&#39;check&#39;, type : &#39;feature&#39;, value : =
&#39;auto&#39;, description : &#39;Build unit test libraries&#39;)<br>
&gt; -diff --git a/<a href=3D"http://template.test.in" rel=3D"noreferrer" t=
arget=3D"_blank">template.test.in</a> b/<a href=3D"http://template.test.in"=
 rel=3D"noreferrer" target=3D"_blank">template.test.in</a><br>
&gt; -new file mode 100644<br>
&gt; -index 000000000..f701627f8<br>
&gt; ---- /dev/null<br>
&gt; -+++ b/<a href=3D"http://template.test.in" rel=3D"noreferrer" target=
=3D"_blank">template.test.in</a><br>
&gt; -@@ -0,0 +1,3 @@<br>
&gt; -+[Test]<br>
&gt; -+Type=3Dsession<br>
&gt; -+Exec=3D@installed_tests_dir@/@program@<br>
&gt; -diff --git a/tests/check/meson.build b/tests/check/meson.build<br>
&gt; -index b2636714b..a697a7b06 100644<br>
&gt; ---- a/tests/check/meson.build<br>
&gt; -+++ b/tests/check/meson.build<br>
&gt; +diff --git a/subprojects/gstreamer/tests/check/meson.build b/subproje=
cts/gstreamer/tests/check/meson.build<br>
&gt; +index 506606684d..00a138a568 100644<br>
&gt; +--- a/subprojects/gstreamer/tests/check/meson.build<br>
&gt; ++++ b/subprojects/gstreamer/tests/check/meson.build<br>
&gt;=C2=A0 @@ -124,10 +124,16 @@ test_defines =3D [<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;-UG_DISABLE_ASSERT&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;-UG_DISABLE_CAST_CHECKS&#39;,<br>
&gt; @@ -95,7 +85,7 @@ index b2636714b..a697a7b06 100644<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 test_conf.set(&#39;installed_tests_dir&#39=
;, join_paths(prefix, installed_tests_execdir))<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 test_conf.set(&#39;program&#39;, test_name=
)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 configure_file(<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 input: installed_tests_template,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 input: &#39;<a href=3D"http://template.t=
est.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a>&#39;,<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 output: test_name + &#39;.test&#39;=
,<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir: installed_tests_metadi=
r,<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 configuration: test_conf<br>
&gt; @@ -105,6 +95,15 @@ index b2636714b..a697a7b06 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0test(test_name, exe, env: env, timeout : 3 *=
 60)<br>
&gt;=C2=A0 =C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0endforeach<br>
&gt; +diff --git a/subprojects/gstreamer/tests/check/<a href=3D"http://temp=
late.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a> b/s=
ubprojects/gstreamer/tests/check/<a href=3D"http://template.test.in" rel=3D=
"noreferrer" target=3D"_blank">template.test.in</a><br>
&gt; +new file mode 100644<br>
&gt; +index 0000000000..f701627f87<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/subprojects/gstreamer/tests/check/<a href=3D"http://template.te=
st.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a><br>
&gt; +@@ -0,0 +1,3 @@<br>
&gt; ++[Test]<br>
&gt; ++Type=3Dsession<br>
&gt; ++Exec=3D@installed_tests_dir@/@program@<br>
&gt;=C2=A0 --<br>
&gt; -2.31.1<br>
&gt; +2.33.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests=
-seek-Don-t-use-too-strict-timeout-for-validati.patch b/meta/recipes-multim=
edia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use-too-strict-timeout-fo=
r-validati.patch<br>
&gt; deleted file mode 100644<br>
&gt; index e0e64e2c7a..0000000000<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-D=
on-t-use-too-strict-timeout-for-validati.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,32 +0,0 @@<br>
&gt; -From 1db36347d05d88835519368442e9aa89c64091ad Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Seungha Yang &lt;<a href=3D"mailto:seungha@centricular.com" tar=
get=3D"_blank">seungha@centricular.com</a>&gt;<br>
&gt; -Date: Tue, 15 Sep 2020 00:54:58 +0900<br>
&gt; -Subject: [PATCH] tests: seek: Don&#39;t use too strict timeout for va=
lidation<br>
&gt; -<br>
&gt; -Expected segment-done message might not be seen within expected<br>
&gt; -time if system is not powerful enough.<br>
&gt; -<br>
&gt; -Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/625" rel=3D"noreferrer" target=3D"_blank">https://gi=
tlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/625</a>&gt;<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://cgit.freedesktop.org/gs=
treamer/gstreamer/commit?id=3Df44312ae5d831438fcf8041162079c65321c588c" rel=
=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org/gstreamer/gs=
treamer/commit?id=3Df44312ae5d831438fcf8041162079c65321c588c</a>]<br>
&gt; -Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.co=
m" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; ----<br>
&gt; - tests/check/pipelines/seek.c | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/tests/check/pipelines/seek.c b/tests/check/pipelines/see=
k.c<br>
&gt; -index 28bb8846d..5f7447bc5 100644<br>
&gt; ---- a/tests/check/pipelines/seek.c<br>
&gt; -+++ b/tests/check/pipelines/seek.c<br>
&gt; -@@ -521,7 +521,7 @@ GST_START_TEST (test_loopback_2)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0GST_INFO (&quot;wait for segment done message&quot;);<br=
>
&gt; -<br>
&gt; --=C2=A0 msg =3D gst_bus_timed_pop_filtered (bus, (GstClockTime) 2 * G=
ST_SECOND,<br>
&gt; -+=C2=A0 msg =3D gst_bus_timed_pop_filtered (bus, GST_CLOCK_TIME_NONE,=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0GST_MESSAGE_SEGMENT_DONE | GST_MESSAGE_ERR=
OR);<br>
&gt; -=C2=A0 =C2=A0fail_unless (msg, &quot;no message within the timed wind=
ow&quot;);<br>
&gt; -=C2=A0 =C2=A0fail_unless_equals_string (GST_MESSAGE_TYPE_NAME (msg), =
&quot;segment-done&quot;);<br>
&gt; ---<br>
&gt; -2.29.2<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests=
-use-a-dictionaries-for-environment.patch b/meta/recipes-multimedia/gstream=
er/gstreamer1.0/0003-tests-use-a-dictionaries-for-environment.patch<br>
&gt; similarity index 61%<br>
&gt; rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-=
use-a-dictionaries-for-environment.patch<br>
&gt; rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-us=
e-a-dictionaries-for-environment.patch<br>
&gt; index 46813cec3d..10a6dcc619 100644<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-=
dictionaries-for-environment.patch<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-=
dictionaries-for-environment.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From e82dedec1803922656e92285fc1bb75b2cdc0aad Mon Sep 17 00:00:00 200=
1<br>
&gt; +From fe830f0f75f3b4b41e3dbef8d4cf6ee4103c9e06 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Sat, 24 Apr 2021 10:34:47 +0100<br>
&gt;=C2=A0 Subject: [PATCH 3/4] tests: use a dictionaries for environment<b=
r>
&gt; @@ -10,29 +10,31 @@ Upstream-Status: Submitted [<a href=3D"https://git=
lab.freedesktop.org/gstreamer/gstreamer/-" rel=3D"noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/gstreamer/gstreamer/-</a><br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose=
@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - tests/check/meson.build | 19 +++++++++++--------<br>
&gt; - 1 file changed, 11 insertions(+), 8 deletions(-)<br>
&gt; + subprojects/gstreamer/tests/check/meson.build | 21 ++++++++++++-----=
--<br>
&gt; + 1 file changed, 13 insertions(+), 8 deletions(-)<br>
&gt;<br>
&gt; -diff --git a/tests/check/meson.build b/tests/check/meson.build<br>
&gt; -index a697a7b06..f64524904 100644<br>
&gt; ---- a/tests/check/meson.build<br>
&gt; -+++ b/tests/check/meson.build<br>
&gt; -@@ -161,14 +161,17 @@ foreach t : core_tests<br>
&gt; +diff --git a/subprojects/gstreamer/tests/check/meson.build b/subproje=
cts/gstreamer/tests/check/meson.build<br>
&gt; +index 00a138a568..48ec2532f8 100644<br>
&gt; +--- a/subprojects/gstreamer/tests/check/meson.build<br>
&gt; ++++ b/subprojects/gstreamer/tests/check/meson.build<br>
&gt; +@@ -161,14 +161,19 @@ foreach t : core_tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install: installed_tests_enabled,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 env =3D environment()<br>
&gt; --=C2=A0 =C2=A0 env.set(&#39;GST_PLUGIN_PATH_1_0&#39;, meson.build_roo=
t())<br>
&gt; +-=C2=A0 =C2=A0 env.set(&#39;GST_PLUGIN_PATH_1_0&#39;, meson.project_b=
uild_root())<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;GST_PLUGIN_SYSTEM_PATH_1_0&#39;, &#3=
9;&#39;)<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;GST_STATE_IGNORE_ELEMENTS&#39;, &#39=
;&#39;)<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;CK_DEFAULT_TIMEOUT&#39;, &#39;20&#39=
;)<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;GST_REGISTRY&#39;, &#39;@0@/@1@.regi=
stry&#39;.format(meson.current_build_dir(), test_name))<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;GST_PLUGIN_SCANNER_1_0&#39;, gst_sca=
nner_dir + &#39;/gst-plugin-scanner&#39;)<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;GST_PLUGIN_LOADING_WHITELIST&#39;, &=
#39;gstreamer&#39;)<br>
&gt; -+=C2=A0 =C2=A0 # environment() can&#39;t be passed to configure_file =
and it is needed for installed_tests<br>
&gt; -+=C2=A0 =C2=A0 # use a dictionary as this is simplest solution to ins=
tall the environment<br>
&gt; ++=C2=A0 =C2=A0 # meson environment object can&#39;t be passed to conf=
igure_file and<br>
&gt; ++=C2=A0 =C2=A0 # installed tests uses configure_file to install the e=
nvironment.<br>
&gt; ++=C2=A0 =C2=A0 # use a dictionary as this is the simplest solution<br=
>
&gt; ++=C2=A0 =C2=A0 # to install the environment.<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 env =3D {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 &#39;GST_PLUGIN_PATH_1_0&#39;: meson.build_root=
(),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;GST_PLUGIN_PATH_1_0&#39;: meson.project_bu=
ild_root(),<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 &#39;GST_PLUGIN_SYSTEM_PATH_1_0&#39;: &#39=
;&#39;,<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 &#39;GST_STATE_IGNORE_ELEMENTS&#39;: &#39;=
&#39;,<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 &#39;CK_DEFAULT_TIMEOUT&#39;: &#39;20&#39;=
,<br>
&gt; @@ -44,5 +46,5 @@ index a697a7b06..f64524904 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if installed_tests_enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_conf =3D configuration_data()<br=
>
&gt;=C2=A0 --<br>
&gt; -2.31.1<br>
&gt; +2.33.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests=
-add-helper-script-to-run-the-installed_tests.patch b/meta/recipes-multimed=
ia/gstreamer/gstreamer1.0/0004-tests-add-helper-script-to-run-the-installed=
_tests.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..efa004f8ce<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-he=
lper-script-to-run-the-installed_tests.patch<br>
&gt; @@ -0,0 +1,74 @@<br>
&gt; +From 4dcbabebca2ad6f1fdd59ee35a858082e87db7b6 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; +Date: Sun, 2 May 2021 01:58:01 +0100<br>
&gt; +Subject: [PATCH 4/4] tests: add helper script to run the installed_te=
sts<br>
&gt; +<br>
&gt; +- this is a bash script that will run the installed_tests<br>
&gt; +with some of the environment variables used in the meson<br>
&gt; +testing framework.<br>
&gt; +<br>
&gt; +Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org=
/gstreamer/gstreamer/-/merge_requests/789" rel=3D"noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/78=
9</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmai=
l.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + subprojects/gstreamer/tests/check/meson.build=C2=A0 =C2=A0| 17 +++++=
++++++++++++<br>
&gt; + .../gstreamer/tests/check/<a href=3D"http://template.sh.in" rel=3D"n=
oreferrer" target=3D"_blank">template.sh.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 9 +++++++++<br>
&gt; + .../gstreamer/tests/check/<a href=3D"http://template.test.in" rel=3D=
"noreferrer" target=3D"_blank">template.test.in</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
&gt; + 3 files changed, 27 insertions(+), 1 deletion(-)<br>
&gt; + create mode 100755 subprojects/gstreamer/tests/check/<a href=3D"http=
://template.sh.in" rel=3D"noreferrer" target=3D"_blank">template.sh.in</a><=
br>
&gt; +<br>
&gt; +diff --git a/subprojects/gstreamer/tests/check/meson.build b/subproje=
cts/gstreamer/tests/check/meson.build<br>
&gt; +index 48ec2532f8..7dc4990d4e 100644<br>
&gt; +--- a/subprojects/gstreamer/tests/check/meson.build<br>
&gt; ++++ b/subprojects/gstreamer/tests/check/meson.build<br>
&gt; +@@ -185,6 +185,23 @@ foreach t : core_tests<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install_dir: installed_tests_metadi=
r,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configuration: test_conf<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 # All the tests will be deployed on the target =
machine and<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 # we use the home folder ~ for the registry whi=
ch will then expand at runtime.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 # Using the /tmp/gstreamer-1.0/@0@.registry can=
 be problematic as it mostly<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 # is mounted using tmpfs and if the machine cra=
sh from some reason we can lost the registry<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 # that is useful for debug propose of the tests=
 itself.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 env +=3D {&#39;GST_REGISTRY&#39;: &#39;~/.cache=
/gstreamer-1.0/@0@.registry&#39;.format(test_name)}<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 # Set the full path for the test it self.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 env +=3D {&#39;TEST&#39;: &#39;@0@/@1@&#39;.for=
mat(join_paths(prefix, installed_tests_execdir), test_name)}<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 configure_file(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 input : &#39;<a href=3D"http://template.=
sh.in" rel=3D"noreferrer" target=3D"_blank">template.sh.in</a>&#39;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 output: test_name + &#39;.sh&#39;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir: installed_tests_execdir,<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 configuration : env,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0endif<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0test(test_name, exe, env: env, timeout : 3 * 60)<=
br>
&gt; +diff --git a/subprojects/gstreamer/tests/check/<a href=3D"http://temp=
late.sh.in" rel=3D"noreferrer" target=3D"_blank">template.sh.in</a> b/subpr=
ojects/gstreamer/tests/check/<a href=3D"http://template.sh.in" rel=3D"noref=
errer" target=3D"_blank">template.sh.in</a><br>
&gt; +new file mode 100755<br>
&gt; +index 0000000000..cf7d31b0ea<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/subprojects/gstreamer/tests/check/<a href=3D"http://template.sh=
.in" rel=3D"noreferrer" target=3D"_blank">template.sh.in</a><br>
&gt; +@@ -0,0 +1,9 @@<br>
&gt; ++#!/bin/sh<br>
&gt; ++<br>
&gt; ++set -ax<br>
&gt; ++<br>
&gt; ++CK_DEFAULT_TIMEOUT=3D&quot;@CK_DEFAULT_TIMEOUT@&quot;<br>
&gt; ++GST_PLUGIN_LOADING_WHITELIST=3D&quot;@GST_PLUGIN_LOADING_WHITELIST@&=
quot;<br>
&gt; ++GST_REGISTRY=3D@GST_REGISTRY@<br>
&gt; ++GST_STATE_IGNORE_ELEMENTS=3D&quot;@GST_STATE_IGNORE_ELEMENTS@&quot;<=
br>
&gt; ++exec @TEST@<br>
&gt; +diff --git a/subprojects/gstreamer/tests/check/<a href=3D"http://temp=
late.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a> b/s=
ubprojects/gstreamer/tests/check/<a href=3D"http://template.test.in" rel=3D=
"noreferrer" target=3D"_blank">template.test.in</a><br>
&gt; +index f701627f87..b74ef6ad73 100644<br>
&gt; +--- a/subprojects/gstreamer/tests/check/<a href=3D"http://template.te=
st.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a><br>
&gt; ++++ b/subprojects/gstreamer/tests/check/<a href=3D"http://template.te=
st.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a><br>
&gt; +@@ -1,3 +1,3 @@<br>
&gt; + [Test]<br>
&gt; + Type=3Dsession<br>
&gt; +-Exec=3D@installed_tests_dir@/@program@<br>
&gt; ++Exec=3D@installed_tests_dir@/@program@.sh<br>
&gt; +--<br>
&gt; +2.33.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests=
-install-the-environment-for-installed_tests.patch b/meta/recipes-multimedi=
a/gstreamer/gstreamer1.0/0007-tests-install-the-environment-for-installed_t=
ests.patch<br>
&gt; deleted file mode 100644<br>
&gt; index eabe7bcbe1..0000000000<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-instal=
l-the-environment-for-installed_tests.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,58 +0,0 @@<br>
&gt; -From 57d2965e979f886e03eecd7e351bf01812053971 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; -Date: Sun, 2 May 2021 01:58:01 +0100<br>
&gt; -Subject: [PATCH 4/4] tests: install the environment for installed_tes=
ts<br>
&gt; -<br>
&gt; -- adapt the test environment for installed_tests<br>
&gt; -- install the test environment for installed_tests<br>
&gt; -- run the tests using the installed environment<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org=
/gstreamer/gstreamer/-/merge_requests/789" rel=3D"noreferrer" target=3D"_bl=
ank">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/78=
9</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmai=
l.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - <a href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_bl=
ank">template.test.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; - tests/check/meson.build | 18 ++++++++++++++++++<br>
&gt; - 2 files changed, 19 insertions(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/<a href=3D"http://template.test.in" rel=3D"noreferrer" t=
arget=3D"_blank">template.test.in</a> b/<a href=3D"http://template.test.in"=
 rel=3D"noreferrer" target=3D"_blank">template.test.in</a><br>
&gt; -index f701627f8..9a3fbdd09 100644<br>
&gt; ---- a/<a href=3D"http://template.test.in" rel=3D"noreferrer" target=
=3D"_blank">template.test.in</a><br>
&gt; -+++ b/<a href=3D"http://template.test.in" rel=3D"noreferrer" target=
=3D"_blank">template.test.in</a><br>
&gt; -@@ -1,3 +1,3 @@<br>
&gt; - [Test]<br>
&gt; - Type=3Dsession<br>
&gt; --Exec=3D@installed_tests_dir@/@program@<br>
&gt; -+Exec=3Dsh -c &#39;set -aex &amp;&amp; source @installed_tests_dir@/@=
program@.env &amp;&amp; exec @installed_tests_dir@/@program@&#39;<br>
&gt; -diff --git a/tests/check/meson.build b/tests/check/meson.build<br>
&gt; -index f64524904..a67e0f8dd 100644<br>
&gt; ---- a/tests/check/meson.build<br>
&gt; -+++ b/tests/check/meson.build<br>
&gt; -@@ -183,6 +183,24 @@ foreach t : core_tests<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install_dir: installed_tests_metadi=
r,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configuration: test_conf<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 env +=3D {&#39;GST_REGISTRY&#39;: &#39;~/.cache=
/gstreamer-1.0/@0@.registry&#39;.format(test_name)}<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 configure_file(<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output: test_name + &#39;.env&#39;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir: installed_tests_execdir,<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 configuration : env,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 )<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 # helper to convert a meson environment diction=
ay object exported with configure_file<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 # this also remove not needed variables for the=
 installed tests<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 meson.add_postconf_script(&#39;sed&#39;, &#39;-=
i&#39;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#39;, &#39;/^#define/!d&#39;,<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#39;, &#39;s/^#define //g&#39;,<=
br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#39;, &#39;/^GST_PLUGIN_PATH_1_0=
/d&#39;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#39;, &#39;/^GST_PLUGIN_SYSTEM_P=
ATH_1_0/d&#39;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#39;, &#39;/^GST_PLUGIN_SCANNER_=
1_0/d&#39;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#39;, &#39;s/ /=3D/&#39;,<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 join_paths(meson.current_build_dir(), te=
st_name + &#39;.env&#39;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0endif<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0test(test_name, exe, env: env, timeout : 3 * 60)<=
br>
&gt; ---<br>
&gt; -2.31.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstre=
amer1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.18.5=
.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_=
1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.0.bb</a><=
br>
&gt; similarity index 76%<br>
&gt; rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstrea=
mer1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.18.5.=
bb</a><br>
&gt; rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreame=
r1.0_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.0.bb=
</a><br>
&gt; index 0d82dd338c..243f99fee9 100644<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.18.5.bb</a>=
<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.0.bb</a>=
<br>
&gt; @@ -10,22 +10,19 @@ DEPENDS =3D &quot;glib-2.0 glib-2.0-native libxml2=
 bison-native flex-native&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit meson pkgconfig gettext upstream-version-is-even gobject=
-introspection ptest-gnome<br>
&gt;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6762ed442b3822387a51c=
92d928ead0d \<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D69333daa044cb77e486cc=
36129f7a770 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De059138481205ee2c6=
fc1c079c016d0d&quot;<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/gstreamer-${PV}&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/s=
rc/gstreamer/gstreamer-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blan=
k">https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz</=
a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gst-gstpluginloa=
der.c-when-env-var-is-set-do-not-fal.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Remove-unused-va=
lgrind-detection.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-tests-seek-Don-t=
-use-too-strict-timeout-for-validati.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-tests-respect-th=
e-idententaion-used-in-meson.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-tests-add-suppor=
t-for-install-the-tests.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-tests-use-a-dict=
ionaries-for-environment.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-tests-install-th=
e-environment-for-installed_tests.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-respect-th=
e-idententaion-used-in-meson.patch;striplevel=3D3 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-tests-add-suppor=
t-for-install-the-tests.patch;striplevel=3D3 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-tests-use-a-dict=
ionaries-for-environment.patch;striplevel=3D3 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-tests-add-helper=
-script-to-run-the-installed_tests.patch;striplevel=3D3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;55862232a63459bbf56abebde3085ca9aec211b4=
78e891dacea4d6df8cafe80a&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;edf4bffff85591d4fff7b21bb9ed7f0feabc123a=
c4a4eff29e73cbce454f9db7&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;PTEST_ENABLE=
D&#39;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0check \<br>
&gt; @@ -36,7 +33,7 @@ PACKAGECONFIG[debug] =3D &quot;-Dgst_debug=3Dtrue,-D=
gst_debug=3Dfalse&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[tracer-hooks] =3D &quot;-Dtracer_hooks=3Dtrue,-Dtr=
acer_hooks=3Dfalse&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[coretracers] =3D &quot;-Dcoretracers=3Denabled,-Dc=
oretracers=3Ddisabled&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[check] =3D &quot;-Dcheck=3Denabled,-Dcheck=3Ddisab=
led&quot;<br>
&gt; -PACKAGECONFIG[tests] =3D &quot;-Dtests=3Denabled -Dinstalled-tests=3D=
true,-Dtests=3Ddisabled -Dinstalled-tests=3Dfalse&quot;<br>
&gt; +PACKAGECONFIG[tests] =3D &quot;-Dtests=3Denabled -Dinstalled_tests=3D=
true,-Dtests=3Ddisabled -Dinstalled_tests=3Dfalse&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[unwind] =3D &quot;-Dlibunwind=3Denabled,-Dlibunwin=
d=3Ddisabled,libunwind&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[dw] =3D &quot;-Dlibdw=3Denabled,-Dlibdw=3Ddisabled=
,elfutils&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[bash-completion] =3D &quot;-Dbash-completion=3Dena=
bled,-Dbash-completion=3Ddisabled,bash-completion&quot;<br>
&gt; --<br>
&gt; 2.35.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#161427): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/161427" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/161427</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88962313=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/88962313/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000003e9da505d792474e--

