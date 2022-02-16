Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF64C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 23:43:52 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.1127.1645055030721613684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 15:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d9swQJMn;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id b20so5730558ljf.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 15:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j1rvQrARN9OYRLKelZZuNcfH/KdqNYr88pPurS+Waa4=;
        b=d9swQJMnbjbxI/Mm8qmAUmaeshxHS51INq529dwOIoayuRjysSECb4fRBRNXgvyang
         JExKsbM/ix+UFc7Msuu1fxNrZ4y+tp4hv3w0Dvp7NvRcjIHrtyWs5cD8HHwLEFIzVv+W
         h7cVtQSMdOdj2mHvDvtSB98AD8TtnBFAt8d/BQ7bPi8WQiJsrYQcWfAja8Pgb0ON1ZsJ
         NIN42weMiogL5mtdCpRHUAKOTOema7LrIhfDE65EmaHTfFvBrW3D8wMjlgsbnlW5WIMM
         +OJrcNxNo0FIHdJpTHB1umcmACObDek3oHb2waTzsWSDmbCCfUjoQyqSi4n9Kz26ve0q
         9t7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j1rvQrARN9OYRLKelZZuNcfH/KdqNYr88pPurS+Waa4=;
        b=b27rzfYXQDhfxFt/+6VKpUOt7fgScfTWpZGgSk9gVC5EWAi2Nx7+Ec43/SQnGt5V8r
         wGBpD8exsYrbHS9kmiLfZ7g4/mH2fpUeZ2cBvf2x7J/d4Nfv2230Q0ggE+WdA8VHFFtm
         50Puj+bSeeoUVYI/ZU6lpGhd7LG/JgWV3GfYtqxQzStAj+GEDVU2WrYoBHIyStCYp66v
         uS8F+POmoc6Rqh72xeH2PFAV+/m0Q9sdgmj0N0HBrbD31q1wlw+eQ2PQPow+96kB8PmU
         5/lYuDDG0hCmf8xlBY31JeUe6sdfTjxM4ohYZEgqYS5ZpwktNHCIB6PFaDfnMxSkGxDb
         X++A==
X-Gm-Message-State: AOAM532bJ28ZV1BLAqLzSatB1gDQVE/zvcubBkr/wmYockNa5XnCWfBW
	UrB8t3GtZm6MQmcbm1lO7nN1MI19rxY5eKcZ0tU=
X-Google-Smtp-Source: 
 ABdhPJy2xUsANtZPhL5hGyu/ptDO8C2t2GPlkRcxsvMMwpNmOANUWokPdcypfonFpkbD6E8vhGGhFYXJrmVKzaE1yuc=
X-Received: by 2002:a2e:a795:0:b0:244:2a13:925 with SMTP id
 c21-20020a2ea795000000b002442a130925mr292099ljf.255.1645055028597; Wed, 16
 Feb 2022 15:43:48 -0800 (PST)
MIME-Version: 1.0
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
 <20220207010823.143664-7-quaresma.jose@gmail.com>
 <CANNYZj8SNr_MA86N9kL7jQw27QV8gDtwH_hSD_a9tfTVL8xd+Q@mail.gmail.com>
 <CANPvuRkJpThUEjiKfzvg4m+Dz_-ChDRu8Yy1LsSnTmK8FdgoDg@mail.gmail.com>
 <720ba17c-525a-3ad0-9c61-f2bc8db82468@denx.de>
In-Reply-To: <720ba17c-525a-3ad0-9c61-f2bc8db82468@denx.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 16 Feb 2022 23:43:37 +0000
Message-ID: 
 <CANPvuRmkwxBaPK+sX01k78q3m=AvYpXNwzzqsrKm7JGhyqhd=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/17] gstreamer1.0: upgrade 1.18.5 -> 1.20.0
To: Claudius Heine <ch@denx.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000009d97e105d82b387a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 23:43:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161789

--0000000000009d97e105d82b387a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Claudius Heine <ch@denx.de> escreveu no dia quarta, 9/02/2022 =C3=A0(s) 09:=
30:

> Hi Jose
>
> On 2022-02-09 10:15, Jose Quaresma wrote:
> > Hi Alexander,
> >
> > Can you please clarify in what target arch is this happening and I can
> > try to replicate it with qemu?
>
> I think we are hitting:
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/778
>
> This testcase seems to be flaky and IIUC upstream marked it as such in
> their test infrastructure.
>
> In my patchset, I added a patch to disable that testcase.
>

Hi Claudius,

Your patch Is a possible solution but I think we need to investigate the
root cause
of the test failure and send a fix for that if possible.


> regards,
> Claudius
>
> >
> > It works on my side on qemux86-64.
> >
> > root@qemux86-64:~# /usr/libexec/installed-tests/gstreamer/gst_gstbin.sh
> > + CK_DEFAULT_TIMEOUT=3D20
> > + GST_PLUGIN_LOADING_WHITELIST=3Dgstreamer
> > + GST_REGISTRY=3D/home/root/.cache/gstreamer-1.0/gst_gstbin.registry
> > + GST_STATE_IGNORE_ELEMENTS=3D
> > + exec /usr/libexec/installed-tests/gstreamer/gst_gstbin
> > Running suite(s): GstBin
> > 100%: Checks: 26, Failures: 0, Errors: 0
> > Check suite gst_bin ran in 6.239s (tests failed: 0)
> >
> >
> > Alexander Kanavin <alex.kanavin@gmail.com
> > <mailto:alex.kanavin@gmail.com>> escreveu no dia ter=C3=A7a, 8/02/2022 =
=C3=A0(s)
> > 22:01:
> >
> >     Unfortunately this patchset (which is now in master) does not addre=
ss
> >     the ptest fail. Please resolve this as soon as possible.
> >
> >     + exec /usr/libexec/installed-tests/gstreamer/gst_gstbin
> >     Running suite(s): GstBin
> >     Executing: gstreamer/gst_gstbin.test
> >     Executing: gstreamer/gst_gstbin.test
> >     ....
> >     Executing: gstreamer/gst_gstbin.test
> >     Executing: gstreamer/gst_gstbin.test
> >     Test timed out after 300 seconds
> >     FAIL: gstreamer/gst_gstbin.test (Child process killed by signal 9)
> >
> >     Alex
> >
> >     On Mon, 7 Feb 2022 at 02:08, Jose Quaresma <quaresma.jose@gmail.com
> >     <mailto:quaresma.jose@gmail.com>> wrote:
> >      >
> >      > - License update:
> >      >   The code actually is LGPLv2.1 but the COPYING file is wrong.
> >      >
> >
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d157b23fb0ce1=
75b167611a4cb019599d9017042
> >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d157b23fb0ce1=
75b167611a4cb019599d9017042
> >
> >      >
> >      > - Drop backported patches
> >      >   0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patc=
h
> >      >   0002-Remove-unused-valgrind-detection.patch
> >      >   0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patc=
h
> >      >
> >      > - Update submitted patches
> >      >   0001-tests-respect-the-idententaion-used-in-meson.patch
> >      >   0002-tests-add-support-for-install-the-tests.patch
> >      >   0003-tests-use-a-dictionaries-for-environment.patch
> >      >   0004-tests-add-helper-script-to-run-the-installed_tests.patch
> >      >
> >      > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> >     <mailto:quaresma.jose@gmail.com>>
> >      > ---
> >      >  ...der.c-when-env-var-is-set-do-not-fal.patch |  69 -----------
> >      >  ...pect-the-idententaion-used-in-meson.patch} |  14 +--
> >      >  ...002-Remove-unused-valgrind-detection.patch | 112
> >     ------------------
> >      >  ...s-add-support-for-install-the-tests.patch} |  67 ++++++-----
> >      >  ...-use-too-strict-timeout-for-validati.patch |  32 -----
> >      >  ...-use-a-dictionaries-for-environment.patch} |  28 +++--
> >      >  ...er-script-to-run-the-installed_tests.patch |  74 +++++++++++=
+
> >      >  ...-the-environment-for-installed_tests.patch |  58 ---------
> >      >  ...er1.0_1.18.5.bb <http://er1.0_1.18.5.bb> =3D>
> >     gstreamer1.0_1.20.0.bb <http://gstreamer1.0_1.20.0.bb>} |  17 ++-
> >      >  9 files changed, 136 insertions(+), 335 deletions(-)
> >      >  delete mode 100644
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.=
c-when-env-var-is-set-do-not-fal.patch
> >      >  rename
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-tests-respect-the-i=
dententaion-used-in-meson.patch
> >     =3D> 0001-tests-respect-the-idententaion-used-in-meson.patch} (71%)
> >      >  delete mode 100644
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgri=
nd-detection.patch
> >      >  rename
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/{0005-tests-add-support-f=
or-install-the-tests.patch
> >     =3D> 0002-tests-add-support-for-install-the-tests.patch} (65%)
> >      >  delete mode 100644
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use=
-too-strict-timeout-for-validati.patch
> >      >  rename
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/{0006-tests-use-a-diction=
aries-for-environment.patch
> >     =3D> 0003-tests-use-a-dictionaries-for-environment.patch} (61%)
> >      >  create mode 100644
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-scr=
ipt-to-run-the-installed_tests.patch
> >      >  delete mode 100644
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-en=
vironment-for-installed_tests.patch
> >      >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.5.b=
b
> >     <http://gstreamer1.0_1.18.5.bb> =3D> gstreamer1.0_1.20.0.bb
> >     <http://gstreamer1.0_1.20.0.bb>} (76%)
> >      >
> >      > diff --git
> >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloade=
r.c-when-env-var-is-set-do-not-fal.patch
> >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloade=
r.c-when-env-var-is-set-do-not-fal.patch
> >      > deleted file mode 100644
> >      > index 23ebd5c600..0000000000
> >      > ---
> >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloade=
r.c-when-env-var-is-set-do-not-fal.patch
> >      > +++ /dev/null
> >      > @@ -1,69 +0,0 @@
> >      > -From fd8f49dba8c09d47425da80f5faab3bfa4a7c962 Mon Sep 17
> >     00:00:00 2001
> >      > -From: Jose Quaresma <quaresma.jose@gmail.com
> >     <mailto:quaresma.jose@gmail.com>>
> >      > -Date: Sat, 10 Oct 2020 19:09:03 +0000
> >      > -Subject: [PATCH 1/3] gstpluginloader: when env var is set do no=
t
> >     fall through
> >      > - to system plugin scanner
> >      > -
> >      > -If we set a custom GST_PLUGIN_SCANNER env var, then we probably
> >     want to use that and only that.
> >      > -
> >      > -Falling through to the one installed on the system is
> >     problamatic in cross-compilation
> >      > -environemnts, regardless of whether one pointed to by the env
> >     var succeeded or failed.
> >      > -
> >      > -taken from:
> >      >
> >     -
> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-multim=
edia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-=
do-not-fal.patch?id=3D0db7ba34ca41b107042306d13a6f0162885c123b
> >     <
> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-multim=
edia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-=
do-not-fal.patch?id=3D0db7ba34ca41b107042306d13a6f0162885c123b
> >
> >      > -
> >      > -Part-of:
> >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669
> >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669>>
> >      > -
> >      > -Upstream-Status: Backport
> >     [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9f958058697e6=
fbf5bde325228034572331d1a3a
> >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9f958058697e6=
fbf5bde325228034572331d1a3a
> >]
> >      > -
> >      > -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> >     <mailto:quaresma.jose@gmail.com>>
> >      > ----
> >      > - gst/gstpluginloader.c | 15 +++++++--------
> >      > - 1 file changed, 7 insertions(+), 8 deletions(-)
> >      > -
> >      > -diff --git a/gst/gstpluginloader.c b/gst/gstpluginloader.c
> >      > -index d1e404d98..c626bf263 100644
> >      > ---- a/gst/gstpluginloader.c
> >      > -+++ b/gst/gstpluginloader.c
> >      > -@@ -464,20 +464,19 @@ gst_plugin_loader_spawn (GstPluginLoader =
*
> >     loader)
> >      > -   if (loader->child_running)
> >      > -     return TRUE;
> >      > -
> >      > --  /* Find the gst-plugin-scanner: first try the env-var if it
> >     is set,
> >      > --   * otherwise use the installed version */
> >      > -+  /* Find the gst-plugin-scanner */
> >      > -   env =3D g_getenv ("GST_PLUGIN_SCANNER_1_0");
> >      > -   if (env =3D=3D NULL)
> >      > -     env =3D g_getenv ("GST_PLUGIN_SCANNER");
> >      > -
> >      > -   if (env !=3D NULL && *env !=3D '\0') {
> >      > -+    /* use the env-var if it is set */
> >      > -     GST_LOG ("Trying GST_PLUGIN_SCANNER env var: %s", env);
> >      > -     helper_bin =3D g_strdup (env);
> >      > -     res =3D gst_plugin_loader_try_helper (loader, helper_bin);
> >      > -     g_free (helper_bin);
> >      > --  }
> >      > --
> >      > --  if (!res) {
> >      > -+  } else {
> >      > -+    /* use the installed version */
> >      > -     GST_LOG ("Trying installed plugin scanner");
> >      > -
> >      > - #ifdef G_OS_WIN32
> >      > -@@ -497,10 +496,10 @@ gst_plugin_loader_spawn (GstPluginLoader =
*
> >     loader)
> >      > - #endif
> >      > -     res =3D gst_plugin_loader_try_helper (loader, helper_bin);
> >      > -     g_free (helper_bin);
> >      > -+  }
> >      > -
> >      > --    if (!res) {
> >      > --      GST_INFO ("No gst-plugin-scanner available, or not
> working");
> >      > --    }
> >      > -+  if (!res) {
> >      > -+    GST_INFO ("No gst-plugin-scanner available, or not
> working");
> >      > -   }
> >      > -
> >      > -   return loader->child_running;
> >      > ---
> >      > -2.29.2
> >      > -
> >      > diff --git
> >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-the-=
idententaion-used-in-meson.patch
> >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-=
idententaion-used-in-meson.patch
> >      > similarity index 71%
> >      > rename from
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-the-id=
ententaion-used-in-meson.patch
> >      > rename to
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-id=
ententaion-used-in-meson.patch
> >      > index 6f571a12d8..312c04fbfd 100644
> >      > ---
> >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-the-=
idententaion-used-in-meson.patch
> >      > +++
> >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-=
idententaion-used-in-meson.patch
> >      > @@ -1,4 +1,4 @@
> >      > -From 122e5ac3dd16a461b6ae595605490c8f5d1c3a9d Mon Sep 17
> >     00:00:00 2001
> >      > +From 1eb77a4ea5a3967c688d8f1192f99c605badc7e2 Mon Sep 17
> >     00:00:00 2001
> >      >  From: Jose Quaresma <quaresma.jose@gmail.com
> >     <mailto:quaresma.jose@gmail.com>>
> >      >  Date: Sun, 11 Apr 2021 19:48:13 +0100
> >      >  Subject: [PATCH 1/4] tests: respect the idententaion used in
> meson
> >      > @@ -7,13 +7,13 @@ Upstream-Status: Submitted
> >     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
> >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/->
> >      >
> >      >  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> >     <mailto:quaresma.jose@gmail.com>>
> >      >  ---
> >      > - tests/check/meson.build | 10 +++++-----
> >      > + subprojects/gstreamer/tests/check/meson.build | 10 +++++-----
> >      >   1 file changed, 5 insertions(+), 5 deletions(-)
> >      >
> >      > -diff --git a/tests/check/meson.build b/tests/check/meson.build
> >      > -index a617cf159..b2636714b 100644
> >      > ---- a/tests/check/meson.build
> >      > -+++ b/tests/check/meson.build
> >      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
> >     b/subprojects/gstreamer/tests/check/meson.build
> >      > +index 9c4228b6e4..506606684d 100644
> >      > +--- a/subprojects/gstreamer/tests/check/meson.build
> >      > ++++ b/subprojects/gstreamer/tests/check/meson.build
> >      >  @@ -146,11 +146,11 @@ foreach t : core_tests
> >      >
> >      >     if not skip_test
> >      > @@ -32,5 +32,5 @@ index a617cf159..b2636714b 100644
> >      >
> >      >       env =3D environment()
> >      >  --
> >      > -2.31.1
> >      > +2.33.1
> >      >
> >      > diff --git
> >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valg=
rind-detection.patch
> >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valg=
rind-detection.patch
> >      > deleted file mode 100644
> >      > index 5121044734..0000000000
> >      > ---
> >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valg=
rind-detection.patch
> >      > +++ /dev/null
> >      > @@ -1,112 +0,0 @@
> >      > -From e275ba2bd854ac15a4b65a8f07d9f042021950da Mon Sep 17
> >     00:00:00 2001
> >      > -From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC3=3DBCller?=3D <tim@cent=
ricular.com
> >     <mailto:tim@centricular.com>>
> >      > -Date: Fri, 14 Aug 2020 16:38:26 +0100
> >      > -Subject: [PATCH 2/3] Remove unused valgrind detection
> >      > -
> >      > -Having this just to log a debug message in case we're
> >      > -running inside valgrind doesn't seem very useful, and
> >      > -the code that used to use this no longer exists it seems.
> >      > -
> >      > -Part-of:
> >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595
> >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595>>
> >      > -
> >      > -Upstream-Status: Backport
> [a2cbf75523cdf8a4df1baa7007d86ef455972245]
> >      > -
> >      > -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> >     <mailto:quaresma.jose@gmail.com>>
> >      > ----
> >      > - gst/gst_private.h |  2 --
> >      > - gst/gstinfo.c     | 39 ---------------------------------------
> >      > - meson.build       |  1 -
> >      > - 3 files changed, 42 deletions(-)
> >      > -
> >      > -diff --git a/gst/gst_private.h b/gst/gst_private.h
> >      > -index eefd044..8252ede 100644
> >      > ---- a/gst/gst_private.h
> >      > -+++ b/gst/gst_private.h
> >      > -@@ -116,8 +116,6 @@ G_GNUC_INTERNAL  gboolean
> >     _priv_plugin_deps_env_vars_changed (GstPlugin * plugin
> >      > -
> >      > - G_GNUC_INTERNAL  gboolean _priv_plugin_deps_files_changed
> >     (GstPlugin * plugin);
> >      > -
> >      > --G_GNUC_INTERNAL  gboolean _priv_gst_in_valgrind (void);
> >      > --
> >      > - /* init functions called from gst_init(). */
> >      > - G_GNUC_INTERNAL  void  _priv_gst_quarks_initialize (void);
> >      > - G_GNUC_INTERNAL  void  _priv_gst_mini_object_initialize (void)=
;
> >      > -diff --git a/gst/gstinfo.c b/gst/gstinfo.c
> >      > -index eea1a21..d3035d6 100644
> >      > ---- a/gst/gstinfo.c
> >      > -+++ b/gst/gstinfo.c
> >      > -@@ -305,36 +305,6 @@ static gboolean pretty_tags =3D
> >     PRETTY_TAGS_DEFAULT;
> >      > - static gint G_GNUC_MAY_ALIAS __default_level =3D
> GST_LEVEL_DEFAULT;
> >      > - static gint G_GNUC_MAY_ALIAS __use_color =3D
> GST_DEBUG_COLOR_MODE_ON;
> >      > -
> >      > --/* FIXME: export this? */
> >      > --gboolean
> >      > --_priv_gst_in_valgrind (void)
> >      > --{
> >      > --  static enum
> >      > --  {
> >      > --    GST_VG_UNCHECKED,
> >      > --    GST_VG_NO_VALGRIND,
> >      > --    GST_VG_INSIDE
> >      > --  }
> >      > --  in_valgrind =3D GST_VG_UNCHECKED;
> >      > --
> >      > --  if (in_valgrind =3D=3D GST_VG_UNCHECKED) {
> >      > --#ifdef HAVE_VALGRIND_VALGRIND_H
> >      > --    if (RUNNING_ON_VALGRIND) {
> >      > --      GST_CAT_INFO (GST_CAT_GST_INIT, "we're running inside
> >     valgrind");
> >      > --      in_valgrind =3D GST_VG_INSIDE;
> >      > --    } else {
> >      > --      GST_CAT_LOG (GST_CAT_GST_INIT, "not doing extra valgrind
> >     stuff");
> >      > --      in_valgrind =3D GST_VG_NO_VALGRIND;
> >      > --    }
> >      > --#else
> >      > --    in_valgrind =3D GST_VG_NO_VALGRIND;
> >      > --#endif
> >      > --    g_assert (in_valgrind =3D=3D GST_VG_NO_VALGRIND ||
> >      > --        in_valgrind =3D=3D GST_VG_INSIDE);
> >      > --  }
> >      > --  return (in_valgrind =3D=3D GST_VG_INSIDE);
> >      > --}
> >      > --
> >      > - static gchar *
> >      > - _replace_pattern_in_gst_debug_file_name (gchar * name, const
> >     char *token,
> >      > -     guint val)
> >      > -@@ -463,9 +433,6 @@ _priv_gst_debug_init (void)
> >      > -   _priv_GST_CAT_PROTECTION =3D
> >      > -       _gst_debug_category_new ("GST_PROTECTION", 0,
> "protection");
> >      > -
> >      > --  /* print out the valgrind message if we're in valgrind */
> >      > --  _priv_gst_in_valgrind ();
> >      > --
> >      > -   env =3D g_getenv ("GST_DEBUG_OPTIONS");
> >      > -   if (env !=3D NULL) {
> >      > -     if (strstr (env, "full_tags") || strstr (env, "full-tags")=
)
> >      > -@@ -2505,12 +2472,6 @@ gst_debug_construct_win_color (guint
> >     colorinfo)
> >      > -   return 0;
> >      > - }
> >      > -
> >      > --gboolean
> >      > --_priv_gst_in_valgrind (void)
> >      > --{
> >      > --  return FALSE;
> >      > --}
> >      > --
> >      > - void
> >      > - _gst_debug_dump_mem (GstDebugCategory * cat, const gchar * fil=
e,
> >      > -     const gchar * func, gint line, GObject * obj, const gchar =
*
> >     msg,
> >      > -diff --git a/meson.build b/meson.build
> >      > -index 82a1728..42ae617 100644
> >      > ---- a/meson.build
> >      > -+++ b/meson.build
> >      > -@@ -200,7 +200,6 @@ check_headers =3D [
> >      > -   'sys/wait.h',
> >      > -   'ucontext.h',
> >      > -   'unistd.h',
> >      > --  'valgrind/valgrind.h',
> >      > -   'sys/resource.h',
> >      > -   'sys/uio.h',
> >      > - ]
> >      > ---
> >      > -2.29.2
> >      > -
> >      > diff --git
> >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-support-=
for-install-the-tests.patch
> >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-=
for-install-the-tests.patch
> >      > similarity index 65%
> >      > rename from
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-support-fo=
r-install-the-tests.patch
> >      > rename to
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-fo=
r-install-the-tests.patch
> >      > index b77fb5797f..d18c19c397 100644
> >      > ---
> >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-support-=
for-install-the-tests.patch
> >      > +++
> >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-=
for-install-the-tests.patch
> >      > @@ -1,4 +1,4 @@
> >      > -From c9e93c7a3e4d2773abef4f5e1464af24f36700b3 Mon Sep 17
> >     00:00:00 2001
> >      > +From 62f5bb7bfc2498219df7280e73480d8ed2378ce5 Mon Sep 17
> >     00:00:00 2001
> >      >  From: Jose Quaresma <quaresma.jose@gmail.com
> >     <mailto:quaresma.jose@gmail.com>>
> >      >  Date: Sun, 11 Apr 2021 19:48:13 +0100
> >      >  Subject: [PATCH 2/4] tests: add support for install the tests
> >      > @@ -11,54 +11,44 @@ Upstream-Status: Submitted
> >     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
> >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/->
> >      >
> >      >  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> >     <mailto:quaresma.jose@gmail.com>>
> >      >  ---
> >      > - meson.build             |  5 +++++
> >      > - meson_options.txt       |  1 +
> >      > - template.test.in <http://template.test.in>        |  3 +++
> >      > - tests/check/meson.build | 22 +++++++++++++++++++++-
> >      > - 4 files changed, 30 insertions(+), 1 deletion(-)
> >      > - create mode 100644 template.test.in <http://template.test.in>
> >      > + subprojects/gstreamer/meson.build             |  4 ++++
> >      > + subprojects/gstreamer/meson_options.txt       |  1 +
> >      > + subprojects/gstreamer/tests/check/meson.build | 22
> >     ++++++++++++++++++-
> >      > + .../gstreamer/tests/check/template.test.in
> >     <http://template.test.in>    |  3 +++
> >      > + 4 files changed, 29 insertions(+), 1 deletion(-)
> >      > + create mode 100644
> >     subprojects/gstreamer/tests/check/template.test.in
> >     <http://template.test.in>
> >      >
> >      > -diff --git a/meson.build b/meson.build
> >      > -index c4e8774f5..1abf4eb26 100644
> >      > ---- a/meson.build
> >      > -+++ b/meson.build
> >      > -@@ -562,6 +562,11 @@ if bashcomp_dep.found()
> >      > +diff --git a/subprojects/gstreamer/meson.build
> >     b/subprojects/gstreamer/meson.build
> >      > +index d20fe0040f..b595d8f990 100644
> >      > +--- a/subprojects/gstreamer/meson.build
> >      > ++++ b/subprojects/gstreamer/meson.build
> >      > +@@ -562,6 +562,10 @@ if bashcomp_dep.found()
> >      >     endif
> >      >   endif
> >      >
> >      > ++installed_tests_enabled =3D get_option('installed_tests')
> >      >  +installed_tests_metadir =3D join_paths(datadir,
> >     'installed-tests', meson.project_name())
> >      >  +installed_tests_execdir =3D join_paths(libexecdir,
> >     'installed-tests', meson.project_name())
> >      > -+installed_tests_enabled =3D get_option('installed-tests')
> >      > -+installed_tests_template =3D files('template.test.in
> >     <http://template.test.in>')
> >      >  +
> >      >   plugins_install_dir =3D join_paths(get_option('libdir'),
> >     'gstreamer-1.0')
> >      >
> >      >   pkgconfig =3D import('pkgconfig')
> >      > -diff --git a/meson_options.txt b/meson_options.txt
> >      > -index c8cee3762..b5da40eaa 100644
> >      > ---- a/meson_options.txt
> >      > -+++ b/meson_options.txt
> >      > +diff --git a/subprojects/gstreamer/meson_options.txt
> >     b/subprojects/gstreamer/meson_options.txt
> >      > +index 7363bdb7a1..a34ba37dad 100644
> >      > +--- a/subprojects/gstreamer/meson_options.txt
> >      > ++++ b/subprojects/gstreamer/meson_options.txt
> >      >  @@ -15,6 +15,7 @@ option('poisoning', type : 'boolean', value :
> >     false, description : 'Enable poiso
> >      >   option('memory-alignment', type: 'combo',
> >      >          choices : ['1', '2', '4', '8', '16', '32', '64', '128',
> >     '256', '512', '1024', '2048', '4096', '8192', 'malloc', 'pagesize']=
,
> >      >          value: 'malloc')
> >      > -+option('installed-tests', type : 'boolean', value : false,
> >     description : 'Enable installed tests')
> >      > ++option('installed_tests', type : 'boolean', value : false,
> >     description : 'Enable installed tests')
> >      >
> >      >   # Feature options
> >      >   option('check', type : 'feature', value : 'auto', description =
:
> >     'Build unit test libraries')
> >      > -diff --git a/template.test.in <http://template.test.in>
> >     b/template.test.in <http://template.test.in>
> >      > -new file mode 100644
> >      > -index 000000000..f701627f8
> >      > ---- /dev/null
> >      > -+++ b/template.test.in <http://template.test.in>
> >      > -@@ -0,0 +1,3 @@
> >      > -+[Test]
> >      > -+Type=3Dsession
> >      > -+Exec=3D@installed_tests_dir@/@program@
> >      > -diff --git a/tests/check/meson.build b/tests/check/meson.build
> >      > -index b2636714b..a697a7b06 100644
> >      > ---- a/tests/check/meson.build
> >      > -+++ b/tests/check/meson.build
> >      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
> >     b/subprojects/gstreamer/tests/check/meson.build
> >      > +index 506606684d..00a138a568 100644
> >      > +--- a/subprojects/gstreamer/tests/check/meson.build
> >      > ++++ b/subprojects/gstreamer/tests/check/meson.build
> >      >  @@ -124,10 +124,16 @@ test_defines =3D [
> >      >     '-UG_DISABLE_ASSERT',
> >      >     '-UG_DISABLE_CAST_CHECKS',
> >      > @@ -95,7 +85,7 @@ index b2636714b..a697a7b06 100644
> >      >  +      test_conf.set('installed_tests_dir', join_paths(prefix,
> >     installed_tests_execdir))
> >      >  +      test_conf.set('program', test_name)
> >      >  +      configure_file(
> >      > -+        input: installed_tests_template,
> >      > ++        input: 'template.test.in <http://template.test.in>',
> >      >  +        output: test_name + '.test',
> >      >  +        install_dir: installed_tests_metadir,
> >      >  +        configuration: test_conf
> >      > @@ -105,6 +95,15 @@ index b2636714b..a697a7b06 100644
> >      >       test(test_name, exe, env: env, timeout : 3 * 60)
> >      >     endif
> >      >   endforeach
> >      > +diff --git a/subprojects/gstreamer/tests/check/template.test.in
> >     <http://template.test.in>
> >     b/subprojects/gstreamer/tests/check/template.test.in
> >     <http://template.test.in>
> >      > +new file mode 100644
> >      > +index 0000000000..f701627f87
> >      > +--- /dev/null
> >      > ++++ b/subprojects/gstreamer/tests/check/template.test.in
> >     <http://template.test.in>
> >      > +@@ -0,0 +1,3 @@
> >      > ++[Test]
> >      > ++Type=3Dsession
> >      > ++Exec=3D@installed_tests_dir@/@program@
> >      >  --
> >      > -2.31.1
> >      > +2.33.1
> >      >
> >      > diff --git
> >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-u=
se-too-strict-timeout-for-validati.patch
> >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-u=
se-too-strict-timeout-for-validati.patch
> >      > deleted file mode 100644
> >      > index e0e64e2c7a..0000000000
> >      > ---
> >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-u=
se-too-strict-timeout-for-validati.patch
> >      > +++ /dev/null
> >      > @@ -1,32 +0,0 @@
> >      > -From 1db36347d05d88835519368442e9aa89c64091ad Mon Sep 17
> >     00:00:00 2001
> >      > -From: Seungha Yang <seungha@centricular.com
> >     <mailto:seungha@centricular.com>>
> >      > -Date: Tue, 15 Sep 2020 00:54:58 +0900
> >      > -Subject: [PATCH] tests: seek: Don't use too strict timeout for
> >     validation
> >      > -
> >      > -Expected segment-done message might not be seen within expected
> >      > -time if system is not powerful enough.
> >      > -
> >      > -Part-of:
> >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/625
> >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/625>>
> >      > -
> >      > -Upstream-Status: Backport
> >     [
> https://cgit.freedesktop.org/gstreamer/gstreamer/commit?id=3Df44312ae5d83=
1438fcf8041162079c65321c588c
> >     <
> https://cgit.freedesktop.org/gstreamer/gstreamer/commit?id=3Df44312ae5d83=
1438fcf8041162079c65321c588c
> >]
> >      > -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com
> >     <mailto:anuj.mittal@intel.com>>
> >      > ----
> >      > - tests/check/pipelines/seek.c | 2 +-
> >      > - 1 file changed, 1 insertion(+), 1 deletion(-)
> >      > -
> >      > -diff --git a/tests/check/pipelines/seek.c
> >     b/tests/check/pipelines/seek.c
> >      > -index 28bb8846d..5f7447bc5 100644
> >      > ---- a/tests/check/pipelines/seek.c
> >      > -+++ b/tests/check/pipelines/seek.c
> >      > -@@ -521,7 +521,7 @@ GST_START_TEST (test_loopback_2)
> >      > -
> >      > -   GST_INFO ("wait for segment done message");
> >      > -
> >      > --  msg =3D gst_bus_timed_pop_filtered (bus, (GstClockTime) 2 *
> >     GST_SECOND,
> >      > -+  msg =3D gst_bus_timed_pop_filtered (bus, GST_CLOCK_TIME_NONE=
,
> >      > -       GST_MESSAGE_SEGMENT_DONE | GST_MESSAGE_ERROR);
> >      > -   fail_unless (msg, "no message within the timed window");
> >      > -   fail_unless_equals_string (GST_MESSAGE_TYPE_NAME (msg),
> >     "segment-done");
> >      > ---
> >      > -2.29.2
> >      > -
> >      > diff --git
> >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-dictio=
naries-for-environment.patch
> >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictio=
naries-for-environment.patch
> >      > similarity index 61%
> >      > rename from
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-dictiona=
ries-for-environment.patch
> >      > rename to
> >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictiona=
ries-for-environment.patch
> >      > index 46813cec3d..10a6dcc619 100644
> >      > ---
> >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-dictio=
naries-for-environment.patch
> >      > +++
> >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictio=
naries-for-environment.patch
> >      > @@ -1,4 +1,4 @@
> >      > -From e82dedec1803922656e92285fc1bb75b2cdc0aad Mon Sep 17
> >     00:00:00 2001
> >      > +From fe830f0f75f3b4b41e3dbef8d4cf6ee4103c9e06 Mon Sep 17
> >     00:00:00 2001
> >      >  From: Jose Quaresma <quaresma.jose@gmail.com
> >     <mailto:quaresma.jose@gmail.com>>
> >      >  Date: Sat, 24 Apr 2021 10:34:47 +0100
> >      >  Subject: [PATCH 3/4] tests: use a dictionaries for environment
> >      > @@ -10,29 +10,31 @@ Upstream-Status: Submitted
> >     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
> >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/->
> >      >
> >      >  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> >     <mailto:quaresma.jose@gmail.com>>
> >      >  ---
> >      > - tests/check/meson.build | 19 +++++++++++--------
> >      > - 1 file changed, 11 insertions(+), 8 deletions(-)
> >      > + subprojects/gstreamer/tests/check/meson.build | 21
> >     ++++++++++++-------
> >      > + 1 file changed, 13 insertions(+), 8 deletions(-)
> >      >
> >      > -diff --git a/tests/check/meson.build b/tests/check/meson.build
> >      > -index a697a7b06..f64524904 100644
> >      > ---- a/tests/check/meson.build
> >      > -+++ b/tests/check/meson.build
> >      > -@@ -161,14 +161,17 @@ foreach t : core_tests
> >      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
> >     b/subprojects/gstreamer/tests/check/meson.build
> >      > +index 00a138a568..48ec2532f8 100644
> >      > +--- a/subprojects/gstreamer/tests/check/meson.build
> >      > ++++ b/subprojects/gstreamer/tests/check/meson.build
> >      > +@@ -161,14 +161,19 @@ foreach t : core_tests
> >      >         install: installed_tests_enabled,
> >      >       )
> >      >
> >      >  -    env =3D environment()
> >      > --    env.set('GST_PLUGIN_PATH_1_0', meson.build_root())
> >      > +-    env.set('GST_PLUGIN_PATH_1_0', meson.project_build_root())
> >      >  -    env.set('GST_PLUGIN_SYSTEM_PATH_1_0', '')
> >      >  -    env.set('GST_STATE_IGNORE_ELEMENTS', '')
> >      >  -    env.set('CK_DEFAULT_TIMEOUT', '20')
> >      >  -    env.set('GST_REGISTRY',
> >     '@0@/@1@.registry'.format(meson.current_build_dir(), test_name))
> >      >  -    env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir +
> >     '/gst-plugin-scanner')
> >      >  -    env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
> >      > -+    # environment() can't be passed to configure_file and it i=
s
> >     needed for installed_tests
> >      > -+    # use a dictionary as this is simplest solution to install
> >     the environment
> >      > ++    # meson environment object can't be passed to
> >     configure_file and
> >      > ++    # installed tests uses configure_file to install the
> >     environment.
> >      > ++    # use a dictionary as this is the simplest solution
> >      > ++    # to install the environment.
> >      >  +    env =3D {
> >      > -+      'GST_PLUGIN_PATH_1_0': meson.build_root(),
> >      > ++      'GST_PLUGIN_PATH_1_0': meson.project_build_root(),
> >      >  +      'GST_PLUGIN_SYSTEM_PATH_1_0': '',
> >      >  +      'GST_STATE_IGNORE_ELEMENTS': '',
> >      >  +      'CK_DEFAULT_TIMEOUT': '20',
> >      > @@ -44,5 +46,5 @@ index a697a7b06..f64524904 100644
> >      >       if installed_tests_enabled
> >      >         test_conf =3D configuration_data()
> >      >  --
> >      > -2.31.1
> >      > +2.33.1
> >      >
> >      > diff --git
> >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-s=
cript-to-run-the-installed_tests.patch
> >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-s=
cript-to-run-the-installed_tests.patch
> >      > new file mode 100644
> >      > index 0000000000..efa004f8ce
> >      > --- /dev/null
> >      > +++
> >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-s=
cript-to-run-the-installed_tests.patch
> >      > @@ -0,0 +1,74 @@
> >      > +From 4dcbabebca2ad6f1fdd59ee35a858082e87db7b6 Mon Sep 17
> >     00:00:00 2001
> >      > +From: Jose Quaresma <quaresma.jose@gmail.com
> >     <mailto:quaresma.jose@gmail.com>>
> >      > +Date: Sun, 2 May 2021 01:58:01 +0100
> >      > +Subject: [PATCH 4/4] tests: add helper script to run the
> >     installed_tests
> >      > +
> >      > +- this is a bash script that will run the installed_tests
> >      > +with some of the environment variables used in the meson
> >      > +testing framework.
> >      > +
> >      > +Upstream-Status: Submitted
> >     [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789
> >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789>]
> >      > +
> >      > +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> >     <mailto:quaresma.jose@gmail.com>>
> >      > +---
> >      > + subprojects/gstreamer/tests/check/meson.build   | 17
> >     +++++++++++++++++
> >      > + .../gstreamer/tests/check/template.sh.in
> >     <http://template.sh.in>        |  9 +++++++++
> >      > + .../gstreamer/tests/check/template.test.in
> >     <http://template.test.in>      |  2 +-
> >      > + 3 files changed, 27 insertions(+), 1 deletion(-)
> >      > + create mode 100755
> >     subprojects/gstreamer/tests/check/template.sh.in <
> http://template.sh.in>
> >      > +
> >      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
> >     b/subprojects/gstreamer/tests/check/meson.build
> >      > +index 48ec2532f8..7dc4990d4e 100644
> >      > +--- a/subprojects/gstreamer/tests/check/meson.build
> >      > ++++ b/subprojects/gstreamer/tests/check/meson.build
> >      > +@@ -185,6 +185,23 @@ foreach t : core_tests
> >      > +         install_dir: installed_tests_metadir,
> >      > +         configuration: test_conf
> >      > +       )
> >      > ++
> >      > ++      # All the tests will be deployed on the target machine a=
nd
> >      > ++      # we use the home folder ~ for the registry which will
> >     then expand at runtime.
> >      > ++      # Using the /tmp/gstreamer-1.0/@0@.registry can be
> >     problematic as it mostly
> >      > ++      # is mounted using tmpfs and if the machine crash from
> >     some reason we can lost the registry
> >      > ++      # that is useful for debug propose of the tests itself.
> >      > ++      env +=3D {'GST_REGISTRY':
> >     '~/.cache/gstreamer-1.0/@0@.registry'.format(test_name)}
> >      > ++
> >      > ++      # Set the full path for the test it self.
> >      > ++      env +=3D {'TEST': '@0@/@1@'.format(join_paths(prefix,
> >     installed_tests_execdir), test_name)}
> >      > ++
> >      > ++      configure_file(
> >      > ++        input : 'template.sh.in <http://template.sh.in>',
> >      > ++        output: test_name + '.sh',
> >      > ++        install_dir: installed_tests_execdir,
> >      > ++        configuration : env,
> >      > ++      )
> >      > +     endif
> >      > +
> >      > +     test(test_name, exe, env: env, timeout : 3 * 60)
> >      > +diff --git a/subprojects/gstreamer/tests/check/template.sh.in
> >     <http://template.sh.in>
> >     b/subprojects/gstreamer/tests/check/template.sh.in
> >     <http://template.sh.in>
> >      > +new file mode 100755
> >      > +index 0000000000..cf7d31b0ea
> >      > +--- /dev/null
> >      > ++++ b/subprojects/gstreamer/tests/check/template.sh.in
> >     <http://template.sh.in>
> >      > +@@ -0,0 +1,9 @@
> >      > ++#!/bin/sh
> >      > ++
> >      > ++set -ax
> >      > ++
> >      > ++CK_DEFAULT_TIMEOUT=3D"@CK_DEFAULT_TIMEOUT@"
> >      > ++GST_PLUGIN_LOADING_WHITELIST=3D"@GST_PLUGIN_LOADING_WHITELIST@=
"
> >      > ++GST_REGISTRY=3D@GST_REGISTRY@
> >      > ++GST_STATE_IGNORE_ELEMENTS=3D"@GST_STATE_IGNORE_ELEMENTS@"
> >      > ++exec @TEST@
> >      > +diff --git a/subprojects/gstreamer/tests/check/template.test.in
> >     <http://template.test.in>
> >     b/subprojects/gstreamer/tests/check/template.test.in
> >     <http://template.test.in>
> >      > +index f701627f87..b74ef6ad73 100644
> >      > +--- a/subprojects/gstreamer/tests/check/template.test.in
> >     <http://template.test.in>
> >      > ++++ b/subprojects/gstreamer/tests/check/template.test.in
> >     <http://template.test.in>
> >      > +@@ -1,3 +1,3 @@
> >      > + [Test]
> >      > + Type=3Dsession
> >      > +-Exec=3D@installed_tests_dir@/@program@
> >      > ++Exec=3D@installed_tests_dir@/@program@.sh
> >      > +--
> >      > +2.33.1
> >      > +
> >      > diff --git
> >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-=
environment-for-installed_tests.patch
> >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-=
environment-for-installed_tests.patch
> >      > deleted file mode 100644
> >      > index eabe7bcbe1..0000000000
> >      > ---
> >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-=
environment-for-installed_tests.patch
> >      > +++ /dev/null
> >      > @@ -1,58 +0,0 @@
> >      > -From 57d2965e979f886e03eecd7e351bf01812053971 Mon Sep 17
> >     00:00:00 2001
> >      > -From: Jose Quaresma <quaresma.jose@gmail.com
> >     <mailto:quaresma.jose@gmail.com>>
> >      > -Date: Sun, 2 May 2021 01:58:01 +0100
> >      > -Subject: [PATCH 4/4] tests: install the environment for
> >     installed_tests
> >      > -
> >      > -- adapt the test environment for installed_tests
> >      > -- install the test environment for installed_tests
> >      > -- run the tests using the installed environment
> >      > -
> >      > -Upstream-Status: Submitted
> >     [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789
> >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789>]
> >      > -
> >      > -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> >     <mailto:quaresma.jose@gmail.com>>
> >      > ----
> >      > - template.test.in <http://template.test.in>        |  2 +-
> >      > - tests/check/meson.build | 18 ++++++++++++++++++
> >      > - 2 files changed, 19 insertions(+), 1 deletion(-)
> >      > -
> >      > -diff --git a/template.test.in <http://template.test.in>
> >     b/template.test.in <http://template.test.in>
> >      > -index f701627f8..9a3fbdd09 100644
> >      > ---- a/template.test.in <http://template.test.in>
> >      > -+++ b/template.test.in <http://template.test.in>
> >      > -@@ -1,3 +1,3 @@
> >      > - [Test]
> >      > - Type=3Dsession
> >      > --Exec=3D@installed_tests_dir@/@program@
> >      > -+Exec=3Dsh -c 'set -aex && source
> >     @installed_tests_dir@/@program@.env && exec
> >     @installed_tests_dir@/@program@'
> >      > -diff --git a/tests/check/meson.build b/tests/check/meson.build
> >      > -index f64524904..a67e0f8dd 100644
> >      > ---- a/tests/check/meson.build
> >      > -+++ b/tests/check/meson.build
> >      > -@@ -183,6 +183,24 @@ foreach t : core_tests
> >      > -         install_dir: installed_tests_metadir,
> >      > -         configuration: test_conf
> >      > -       )
> >      > -+
> >      > -+      env +=3D {'GST_REGISTRY':
> >     '~/.cache/gstreamer-1.0/@0@.registry'.format(test_name)}
> >      > -+      configure_file(
> >      > -+        output: test_name + '.env',
> >      > -+        install_dir: installed_tests_execdir,
> >      > -+        configuration : env,
> >      > -+      )
> >      > -+      # helper to convert a meson environment dictionay object
> >     exported with configure_file
> >      > -+      # this also remove not needed variables for the installe=
d
> >     tests
> >      > -+      meson.add_postconf_script('sed', '-i',
> >      > -+        '-e', '/^#define/!d',
> >      > -+        '-e', 's/^#define //g',
> >      > -+        '-e', '/^GST_PLUGIN_PATH_1_0/d',
> >      > -+        '-e', '/^GST_PLUGIN_SYSTEM_PATH_1_0/d',
> >      > -+        '-e', '/^GST_PLUGIN_SCANNER_1_0/d',
> >      > -+        '-e', 's/ /=3D/',
> >      > -+        join_paths(meson.current_build_dir(), test_name +
> '.env')
> >      > -+      )
> >      > -     endif
> >      > -
> >      > -     test(test_name, exe, env: env, timeout : 3 * 60)
> >      > ---
> >      > -2.31.1
> >      > -
> >      > diff --git
> >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
> >     <http://gstreamer1.0_1.18.5.bb>
> >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
> >     <http://gstreamer1.0_1.20.0.bb>
> >      > similarity index 76%
> >      > rename from
> >     meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
> >     <http://gstreamer1.0_1.18.5.bb>
> >      > rename to
> >     meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
> >     <http://gstreamer1.0_1.20.0.bb>
> >      > index 0d82dd338c..243f99fee9 100644
> >      > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
> >     <http://gstreamer1.0_1.18.5.bb>
> >      > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
> >     <http://gstreamer1.0_1.20.0.bb>
> >      > @@ -10,22 +10,19 @@ DEPENDS =3D "glib-2.0 glib-2.0-native libxml=
2
> >     bison-native flex-native"
> >      >
> >      >  inherit meson pkgconfig gettext upstream-version-is-even
> >     gobject-introspection ptest-gnome
> >      >
> >      > -LIC_FILES_CHKSUM =3D
> >     "file://COPYING;md5=3D6762ed442b3822387a51c92d928ead0d \
> >      > +LIC_FILES_CHKSUM =3D
> >     "file://COPYING;md5=3D69333daa044cb77e486cc36129f7a770 \
> >      >
> >
>  file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De059138481205ee2c6fc1c=
079c016d0d"
> >      >
> >      >  S =3D "${WORKDIR}/gstreamer-${PV}"
> >      >
> >      >  SRC_URI =3D
> >     "
> https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz
> >     <
> https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$%7BPV%7D.tar.x=
z
> >
> >     \
> >      >             file://run-ptest \
> >      > -
> >
>  file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
> >      > -           file://0002-Remove-unused-valgrind-detection.patch \
> >      > -
> >
>  file://0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
> >      > -
> >       file://0004-tests-respect-the-idententaion-used-in-meson.patch \
> >      > -
> >       file://0005-tests-add-support-for-install-the-tests.patch \
> >      > -
> >       file://0006-tests-use-a-dictionaries-for-environment.patch \
> >      > -
> >
>  file://0007-tests-install-the-environment-for-installed_tests.patch \
> >      > +
> >
>  file://0001-tests-respect-the-idententaion-used-in-meson.patch;stripleve=
l=3D3
> \
> >      > +
> >
>  file://0002-tests-add-support-for-install-the-tests.patch;striplevel=3D3=
 \
> >      > +
> >
>  file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3D=
3 \
> >      > +
> >
>  file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;str=
iplevel=3D3
> \
> >      >             "
> >      > -SRC_URI[sha256sum] =3D
> >     "55862232a63459bbf56abebde3085ca9aec211b478e891dacea4d6df8cafe80a"
> >      > +SRC_URI[sha256sum] =3D
> >     "edf4bffff85591d4fff7b21bb9ed7f0feabc123ac4a4eff29e73cbce454f9db7"
> >      >
> >      >  PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1',
> >     'tests', '', d)} \
> >      >                     check \
> >      > @@ -36,7 +33,7 @@ PACKAGECONFIG[debug] =3D
> >     "-Dgst_debug=3Dtrue,-Dgst_debug=3Dfalse"
> >      >  PACKAGECONFIG[tracer-hooks] =3D
> >     "-Dtracer_hooks=3Dtrue,-Dtracer_hooks=3Dfalse"
> >      >  PACKAGECONFIG[coretracers] =3D
> >     "-Dcoretracers=3Denabled,-Dcoretracers=3Ddisabled"
> >      >  PACKAGECONFIG[check] =3D "-Dcheck=3Denabled,-Dcheck=3Ddisabled"
> >      > -PACKAGECONFIG[tests] =3D "-Dtests=3Denabled
> >     -Dinstalled-tests=3Dtrue,-Dtests=3Ddisabled -Dinstalled-tests=3Dfal=
se"
> >      > +PACKAGECONFIG[tests] =3D "-Dtests=3Denabled
> >     -Dinstalled_tests=3Dtrue,-Dtests=3Ddisabled -Dinstalled_tests=3Dfal=
se"
> >      >  PACKAGECONFIG[unwind] =3D
> >     "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,libunwind"
> >      >  PACKAGECONFIG[dw] =3D "-Dlibdw=3Denabled,-Dlibdw=3Ddisabled,elf=
utils"
> >      >  PACKAGECONFIG[bash-completion] =3D
> >
>  "-Dbash-completion=3Denabled,-Dbash-completion=3Ddisabled,bash-completio=
n"
> >      > --
> >      > 2.35.1
> >      >
> >      >
> >      > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >      > Links: You receive all messages sent to this group.
> >      > View/Reply Online (#161427):
> >     https://lists.openembedded.org/g/openembedded-core/message/161427
> >     <https://lists.openembedded.org/g/openembedded-core/message/161427>
> >      > Mute This Topic:
> >     https://lists.openembedded.org/mt/88962313/1686489
> >     <https://lists.openembedded.org/mt/88962313/1686489>
> >      > Group Owner: openembedded-core+owner@lists.openembedded.org
> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >      > Unsubscribe:
> >     https://lists.openembedded.org/g/openembedded-core/unsub
> >     <https://lists.openembedded.org/g/openembedded-core/unsub>
> >     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
> >      > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >      >
> >
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>
> --
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: ch@denx.de
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000009d97e105d82b387a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Claudius Heine &lt;<a href=3D"mailto:=
ch@denx.de">ch@denx.de</a>&gt; escreveu no dia quarta, 9/02/2022 =C3=A0(s) =
09:30:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Jose<b=
r>
<br>
On 2022-02-09 10:15, Jose Quaresma wrote:<br>
&gt; Hi Alexander,<br>
&gt; <br>
&gt; Can=C2=A0you please clarify in what target arch is this happening and =
I can <br>
&gt; try to replicate it with qemu?<br>
<br>
I think we are hitting:<br>
<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/778"=
 rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstrea=
mer/gstreamer/-/issues/778</a><br>
<br>
This testcase seems to be flaky and IIUC upstream marked it as such in <br>
their test infrastructure.<br>
<br>
In my patchset, I added a patch to disable that testcase.<br></blockquote><=
div><br></div><div>Hi Claudius,</div><div><br></div><div>Your patch Is a po=
ssible solution but I think we need to investigate=C2=A0the root cause</div=
><div>of the test failure and send a fix for that if possible.</div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
regards,<br>
Claudius<br>
<br>
&gt; <br>
&gt; It works on my side on=C2=A0qemux86-64.<br>
&gt; <br>
&gt; root@qemux86-64:~# /usr/libexec/installed-tests/gstreamer/gst_gstbin.s=
h<br>
&gt; + CK_DEFAULT_TIMEOUT=3D20<br>
&gt; + GST_PLUGIN_LOADING_WHITELIST=3Dgstreamer<br>
&gt; + GST_REGISTRY=3D/home/root/.cache/gstreamer-1.0/gst_gstbin.registry<b=
r>
&gt; + GST_STATE_IGNORE_ELEMENTS=3D<br>
&gt; + exec /usr/libexec/installed-tests/gstreamer/gst_gstbin<br>
&gt; Running suite(s): GstBin<br>
&gt; 100%: Checks: 26, Failures: 0, Errors: 0<br>
&gt; Check suite gst_bin ran in 6.239s (tests failed: 0)<br>
&gt; <br>
&gt; <br>
&gt; Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank"=
>alex.kanavin@gmail.com</a>&gt;&gt; escreveu no dia ter=C3=A7a, 8/02/2022 =
=C3=A0(s) <br>
&gt; 22:01:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Unfortunately this patchset (which is now in master=
) does not address<br>
&gt;=C2=A0 =C2=A0 =C2=A0the ptest fail. Please resolve this as soon as poss=
ible.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+ exec /usr/libexec/installed-tests/gstreamer/gst_g=
stbin<br>
&gt;=C2=A0 =C2=A0 =C2=A0Running suite(s): GstBin<br>
&gt;=C2=A0 =C2=A0 =C2=A0Executing: gstreamer/gst_gstbin.test<br>
&gt;=C2=A0 =C2=A0 =C2=A0Executing: gstreamer/gst_gstbin.test<br>
&gt;=C2=A0 =C2=A0 =C2=A0....<br>
&gt;=C2=A0 =C2=A0 =C2=A0Executing: gstreamer/gst_gstbin.test<br>
&gt;=C2=A0 =C2=A0 =C2=A0Executing: gstreamer/gst_gstbin.test<br>
&gt;=C2=A0 =C2=A0 =C2=A0Test timed out after 300 seconds<br>
&gt;=C2=A0 =C2=A0 =C2=A0FAIL: gstreamer/gst_gstbin.test (Child process kill=
ed by signal 9)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Alex<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, 7 Feb 2022 at 02:08, Jose Quaresma &lt;<a h=
ref=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmai=
l.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - License update:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0The code actually is LGPLv2.1 but=
 the COPYING file is wrong.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://gitlab.freedesktop.org/gstreamer=
/gstreamer/-/commit/d157b23fb0ce175b167611a4cb019599d9017042" rel=3D"norefe=
rrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/gstreamer/=
-/commit/d157b23fb0ce175b167611a4cb019599d9017042</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/gstre=
amer/gstreamer/-/commit/d157b23fb0ce175b167611a4cb019599d9017042" rel=3D"no=
referrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/gstrea=
mer/-/commit/d157b23fb0ce175b167611a4cb019599d9017042</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - Drop backported patches<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A00001-gst-gstpluginloader.c-when-e=
nv-var-is-set-do-not-fal.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A00002-Remove-unused-valgrind-detec=
tion.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A00003-tests-seek-Don-t-use-too-str=
ict-timeout-for-validati.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - Update submitted patches<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A00001-tests-respect-the-idententai=
on-used-in-meson.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A00002-tests-add-support-for-instal=
l-the-tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A00003-tests-use-a-dictionaries-for=
-environment.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A00004-tests-add-helper-script-to-r=
un-the-installed_tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"m=
ailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...der.c-when-env-var-is-set-do-not-fal=
.patch |=C2=A0 69 -----------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...pect-the-idententaion-used-in-meson.=
patch} |=C2=A0 14 +--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...002-Remove-unused-valgrind-detection=
.patch | 112<br>
&gt;=C2=A0 =C2=A0 =C2=A0------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...s-add-support-for-install-the-tests.=
patch} |=C2=A0 67 ++++++-----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...-use-too-strict-timeout-for-validati=
.patch |=C2=A0 32 -----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...-use-a-dictionaries-for-environment.=
patch} |=C2=A0 28 +++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...er-script-to-run-the-installed_tests=
.patch |=C2=A0 74 ++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...-the-environment-for-installed_tests=
.patch |=C2=A0 58 ---------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...<a href=3D"http://er1.0_1.18.5.bb" r=
el=3D"noreferrer" target=3D"_blank">er1.0_1.18.5.bb</a> &lt;<a href=3D"http=
://er1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">http://er1.0_1.18.=
5.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://gstreamer1.0_1.20.0.bb" rel=3D"no=
referrer" target=3D"_blank">gstreamer1.0_1.20.0.bb</a> &lt;<a href=3D"http:=
//gstreamer1.0_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">http://gstre=
amer1.0_1.20.0.bb</a>&gt;} |=C2=A0 17 ++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 9 files changed, 136 insertions(+), 335=
 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0001=
-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/{000=
4-tests-respect-the-idententaion-used-in-meson.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D&gt; 0001-tests-respect-the-idententaion-used-in=
-meson.patch} (71%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0002=
-Remove-unused-valgrind-detection.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/{000=
5-tests-add-support-for-install-the-tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D&gt; 0002-tests-add-support-for-install-the-test=
s.patch} (65%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0003=
-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 rename<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/{000=
6-tests-use-a-dictionaries-for-environment.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D&gt; 0003-tests-use-a-dictionaries-for-environme=
nt.patch} (61%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0004=
-tests-add-helper-script-to-run-the-installed_tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 delete mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0007=
-tests-install-the-environment-for-installed_tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 rename meta/recipes-multimedia/gstreame=
r/{<a href=3D"http://gstreamer1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_=
blank">gstreamer1.0_1.18.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.18.5.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.18.5.bb</a>&gt; =3D=
&gt; <a href=3D"http://gstreamer1.0_1.20.0.bb" rel=3D"noreferrer" target=3D=
"_blank">gstreamer1.0_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.20.0.bb</a>&gt;} (7=
6%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
01-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
01-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; deleted file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 23ebd5c600..0000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
01-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,69 +0,0 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From fd8f49dba8c09d47425da80f5faab3bfa4a7c96=
2 Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From: Jose Quaresma &lt;<a href=3D"mailto:qu=
aresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Date: Sat, 10 Oct 2020 19:09:03 +0000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Subject: [PATCH 1/3] gstpluginloader: when e=
nv var is set do not<br>
&gt;=C2=A0 =C2=A0 =C2=A0fall through<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - to system plugin scanner<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -If we set a custom GST_PLUGIN_SCANNER env va=
r, then we probably<br>
&gt;=C2=A0 =C2=A0 =C2=A0want to use that and only that.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Falling through to the one installed on the =
system is<br>
&gt;=C2=A0 =C2=A0 =C2=A0problamatic in cross-compilation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -environemnts, regardless of whether one poin=
ted to by the env<br>
&gt;=C2=A0 =C2=A0 =C2=A0var succeeded or failed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -taken from:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<a href=3D"http://cgit.openembedded.org/openembedd=
ed-core/commit/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstp=
luginloader.c-when-env-var-is-set-do-not-fal.patch?id=3D0db7ba34ca41b107042=
306d13a6f0162885c123b" rel=3D"noreferrer" target=3D"_blank">http://cgit.ope=
nembedded.org/openembedded-core/commit/meta/recipes-multimedia/gstreamer/gs=
treamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch?=
id=3D0db7ba34ca41b107042306d13a6f0162885c123b</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://cgit.openembedded.org/openemb=
edded-core/commit/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-g=
stpluginloader.c-when-env-var-is-set-do-not-fal.patch?id=3D0db7ba34ca41b107=
042306d13a6f0162885c123b" rel=3D"noreferrer" target=3D"_blank">http://cgit.=
openembedded.org/openembedded-core/commit/meta/recipes-multimedia/gstreamer=
/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.pat=
ch?id=3D0db7ba34ca41b107042306d13a6f0162885c123b</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Part-of:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/gstre=
amer/gstreamer/-/merge_requests/669" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/gstre=
amer/gstreamer/-/merge_requests/669" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669</a>&=
gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Upstream-Status: Backport<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://gitlab.freedesktop.org/gstreame=
r/gstreamer/-/commit/9f958058697e6fbf5bde325228034572331d1a3a" rel=3D"noref=
errer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/gstreamer=
/-/commit/9f958058697e6fbf5bde325228034572331d1a3a</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/gstre=
amer/gstreamer/-/commit/9f958058697e6fbf5bde325228034572331d1a3a" rel=3D"no=
referrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/gstrea=
mer/-/commit/9f958058697e6fbf5bde325228034572331d1a3a</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Signed-off-by: Jose Quaresma &lt;<a href=3D"=
mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - gst/gstpluginloader.c | 15 +++++++--------<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - 1 file changed, 7 insertions(+), 8 deletion=
s(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/gst/gstpluginloader.c b/gst/gst=
pluginloader.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index d1e404d98..c626bf263 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/gst/gstpluginloader.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/gst/gstpluginloader.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -464,20 +464,19 @@ gst_plugin_loader_spaw=
n (GstPluginLoader *<br>
&gt;=C2=A0 =C2=A0 =C2=A0loader)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0if (loader-&gt;child_running)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0return TRUE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 /* Find the gst-plugin-scanner: firs=
t try the env-var if it<br>
&gt;=C2=A0 =C2=A0 =C2=A0is set,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0* otherwise use the installed =
version */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 /* Find the gst-plugin-scanner */<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0env =3D g_getenv (&quot;GST_PLU=
GIN_SCANNER_1_0&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0if (env =3D=3D NULL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0env =3D g_getenv (&quot;=
GST_PLUGIN_SCANNER&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0if (env !=3D NULL &amp;&amp; *e=
nv !=3D &#39;\0&#39;) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 /* use the env-var if it is s=
et */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0GST_LOG (&quot;Trying GS=
T_PLUGIN_SCANNER env var: %s&quot;, env);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0helper_bin =3D g_strdup =
(env);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0res =3D gst_plugin_loade=
r_try_helper (loader, helper_bin);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0g_free (helper_bin);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 if (!res) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 /* use the installed version =
*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0GST_LOG (&quot;Trying in=
stalled plugin scanner&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - #ifdef G_OS_WIN32<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -497,10 +496,10 @@ gst_plugin_loader_spaw=
n (GstPluginLoader *<br>
&gt;=C2=A0 =C2=A0 =C2=A0loader)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0res =3D gst_plugin_loade=
r_try_helper (loader, helper_bin);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0g_free (helper_bin);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 if (!res) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 =C2=A0 GST_INFO (&quot;No gst=
-plugin-scanner available, or not working&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 if (!res) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 GST_INFO (&quot;No gst-plugin=
-scanner available, or not working&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0return loader-&gt;child_running=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -2.29.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
04-tests-respect-the-idententaion-used-in-meson.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
01-tests-respect-the-idententaion-used-in-meson.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; similarity index 71%<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0004=
-tests-respect-the-idententaion-used-in-meson.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0001=
-tests-respect-the-idententaion-used-in-meson.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 6f571a12d8..312c04fbfd 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
04-tests-respect-the-idententaion-used-in-meson.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
01-tests-respect-the-idententaion-used-in-meson.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,4 +1,4 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From 122e5ac3dd16a461b6ae595605490c8f5d1c3a9=
d Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +From 1eb77a4ea5a3967c688d8f1192f99c605badc7e=
2 Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 From: Jose Quaresma &lt;<a href=3D"mail=
to:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Date: Sun, 11 Apr 2021 19:48:13 +0100<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Subject: [PATCH 1/4] tests: respect the=
 idententaion used in meson<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -7,13 +7,13 @@ Upstream-Status: Submitted<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://gitlab.freedesktop.org/gstreame=
r/gstreamer/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesk=
top.org/gstreamer/gstreamer/-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/gstre=
amer/gstreamer/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freed=
esktop.org/gstreamer/gstreamer/-</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Signed-off-by: Jose Quaresma &lt;<a hre=
f=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.=
com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - tests/check/meson.build | 10 +++++-----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + subprojects/gstreamer/tests/check/meson.bui=
ld | 10 +++++-----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A01 file changed, 5 insertions(+), =
5 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/tests/check/meson.build b/tests=
/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index a617cf159..b2636714b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/tests/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/tests/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/tests/che=
ck/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/tests/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index 9c4228b6e4..506606684d 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- a/subprojects/gstreamer/tests/check/meso=
n.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/tests/check/meso=
n.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 @@ -146,11 +146,11 @@ foreach t : core_=
tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0if not skip_test<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -32,5 +32,5 @@ index a617cf159..b2636714b =
100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D environment=
()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -2.31.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +2.33.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
02-Remove-unused-valgrind-detection.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
02-Remove-unused-valgrind-detection.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; deleted file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 5121044734..0000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
02-Remove-unused-valgrind-detection.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,112 +0,0 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From e275ba2bd854ac15a4b65a8f07d9f042021950d=
a Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC3=3DB=
Cller?=3D &lt;<a href=3D"mailto:tim@centricular.com" target=3D"_blank">tim@=
centricular.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:tim@centricular.com" t=
arget=3D"_blank">tim@centricular.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Date: Fri, 14 Aug 2020 16:38:26 +0100<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Subject: [PATCH 2/3] Remove unused valgrind =
detection<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Having this just to log a debug message in c=
ase we&#39;re<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -running inside valgrind doesn&#39;t seem ver=
y useful, and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -the code that used to use this no longer exi=
sts it seems.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Part-of:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/gstre=
amer/gstreamer/-/merge_requests/595" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/gstre=
amer/gstreamer/-/merge_requests/595" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595</a>&=
gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Upstream-Status: Backport [a2cbf75523cdf8a4d=
f1baa7007d86ef455972245]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Signed-off-by: Jose Quaresma &lt;<a href=3D"=
mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - gst/gst_private.h |=C2=A0 2 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - gst/gstinfo.c=C2=A0 =C2=A0 =C2=A0| 39 -----=
----------------------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 1 -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - 3 files changed, 42 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/gst/gst_private.h b/gst/gst_pri=
vate.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index eefd044..8252ede 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/gst/gst_private.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/gst/gst_private.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -116,8 +116,6 @@ G_GNUC_INTERNAL=C2=A0 gb=
oolean<br>
&gt;=C2=A0 =C2=A0 =C2=A0_priv_plugin_deps_env_vars_changed (GstPlugin * plu=
gin<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - G_GNUC_INTERNAL=C2=A0 gboolean _priv_plugin=
_deps_files_changed<br>
&gt;=C2=A0 =C2=A0 =C2=A0(GstPlugin * plugin);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --G_GNUC_INTERNAL=C2=A0 gboolean _priv_gst_in=
_valgrind (void);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - /* init functions called from gst_init(). *=
/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - G_GNUC_INTERNAL=C2=A0 void=C2=A0 _priv_gst_=
quarks_initialize (void);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - G_GNUC_INTERNAL=C2=A0 void=C2=A0 _priv_gst_=
mini_object_initialize (void);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/gst/gstinfo.c b/gst/gstinfo.c<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index eea1a21..d3035d6 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/gst/gstinfo.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/gst/gstinfo.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -305,36 +305,6 @@ static gboolean pretty_=
tags =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0PRETTY_TAGS_DEFAULT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - static gint G_GNUC_MAY_ALIAS __default_leve=
l =3D GST_LEVEL_DEFAULT;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - static gint G_GNUC_MAY_ALIAS __use_color =
=3D GST_DEBUG_COLOR_MODE_ON;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --/* FIXME: export this? */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --gboolean<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --_priv_gst_in_valgrind (void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 static enum<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 GST_VG_UNCHECKED,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 GST_VG_NO_VALGRIND,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 GST_VG_INSIDE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 in_valgrind =3D GST_VG_UNCHECKED;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 if (in_valgrind =3D=3D GST_VG_UNCHEC=
KED) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --#ifdef HAVE_VALGRIND_VALGRIND_H<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 if (RUNNING_ON_VALGRIND) {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 =C2=A0 GST_CAT_INFO (GST_CAT_=
GST_INIT, &quot;we&#39;re running inside<br>
&gt;=C2=A0 =C2=A0 =C2=A0valgrind&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 =C2=A0 in_valgrind =3D GST_VG=
_INSIDE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 =C2=A0 GST_CAT_LOG (GST_CAT_G=
ST_INIT, &quot;not doing extra valgrind<br>
&gt;=C2=A0 =C2=A0 =C2=A0stuff&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 =C2=A0 in_valgrind =3D GST_VG=
_NO_VALGRIND;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --#else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 in_valgrind =3D GST_VG_NO_VAL=
GRIND;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 g_assert (in_valgrind =3D=3D =
GST_VG_NO_VALGRIND ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 in_valgrind =3D=
=3D GST_VG_INSIDE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 return (in_valgrind =3D=3D GST_VG_IN=
SIDE);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - static gchar *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - _replace_pattern_in_gst_debug_file_name (gc=
har * name, const<br>
&gt;=C2=A0 =C2=A0 =C2=A0char *token,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0guint val)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -463,9 +433,6 @@ _priv_gst_debug_init (vo=
id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0_priv_GST_CAT_PROTECTION =3D<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0_gst_debug_catego=
ry_new (&quot;GST_PROTECTION&quot;, 0, &quot;protection&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 /* print out the valgrind message if=
 we&#39;re in valgrind */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 _priv_gst_in_valgrind ();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0env =3D g_getenv (&quot;GST_DEB=
UG_OPTIONS&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0if (env !=3D NULL) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0if (strstr (env, &quot;f=
ull_tags&quot;) || strstr (env, &quot;full-tags&quot;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -2505,12 +2472,6 @@ gst_debug_construct_w=
in_color (guint<br>
&gt;=C2=A0 =C2=A0 =C2=A0colorinfo)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --gboolean<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --_priv_gst_in_valgrind (void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 return FALSE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - void<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - _gst_debug_dump_mem (GstDebugCategory * cat=
, const gchar * file,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0const gchar * func, gint=
 line, GObject * obj, const gchar *<br>
&gt;=C2=A0 =C2=A0 =C2=A0msg,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/meson.build b/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index 82a1728..42ae617 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -200,7 +200,6 @@ check_headers =3D [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0&#39;sys/wait.h&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0&#39;ucontext.h&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0&#39;unistd.h&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 &#39;valgrind/valgrind.h&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0&#39;sys/resource.h&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0&#39;sys/uio.h&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -2.29.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
05-tests-add-support-for-install-the-tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
02-tests-add-support-for-install-the-tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; similarity index 65%<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0005=
-tests-add-support-for-install-the-tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0002=
-tests-add-support-for-install-the-tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index b77fb5797f..d18c19c397 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
05-tests-add-support-for-install-the-tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
02-tests-add-support-for-install-the-tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,4 +1,4 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From c9e93c7a3e4d2773abef4f5e1464af24f36700b=
3 Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +From 62f5bb7bfc2498219df7280e73480d8ed2378ce=
5 Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 From: Jose Quaresma &lt;<a href=3D"mail=
to:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Date: Sun, 11 Apr 2021 19:48:13 +0100<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Subject: [PATCH 2/4] tests: add support=
 for install the tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -11,54 +11,44 @@ Upstream-Status: Submitte=
d<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://gitlab.freedesktop.org/gstreame=
r/gstreamer/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesk=
top.org/gstreamer/gstreamer/-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/gstre=
amer/gstreamer/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freed=
esktop.org/gstreamer/gstreamer/-</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Signed-off-by: Jose Quaresma &lt;<a hre=
f=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.=
com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 5 +++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - <a href=3D"http://template.test.in" rel=3D"=
noreferrer" target=3D"_blank">template.test.in</a> &lt;<a href=3D"http://te=
mplate.test.in" rel=3D"noreferrer" target=3D"_blank">http://template.test.i=
n</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - tests/check/meson.build | 22 ++++++++++++++=
+++++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - 4 files changed, 30 insertions(+), 1 deleti=
on(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - create mode 100644 <a href=3D"http://templa=
te.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a> &lt;<=
a href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">htt=
p://template.test.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + subprojects/gstreamer/meson.build=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + subprojects/gstreamer/meson_options.txt=C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + subprojects/gstreamer/tests/check/meson.bui=
ld | 22<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + .../gstreamer/tests/check/<a href=3D"http:/=
/template.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D"nore=
ferrer" target=3D"_blank">http://template.test.in</a>&gt;=C2=A0 =C2=A0 |=C2=
=A0 3 +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + 4 files changed, 29 insertions(+), 1 deleti=
on(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + create mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0subprojects/gstreamer/tests/check/<a href=3D"http:/=
/template.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D"nore=
ferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/meson.build b/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index c4e8774f5..1abf4eb26 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -562,6 +562,11 @@ if bashcomp_dep.found()=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/meson.bui=
ld<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index d20fe0040f..b595d8f990 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- a/subprojects/gstreamer/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +@@ -562,6 +562,10 @@ if bashcomp_dep.found()=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++installed_tests_enabled =3D get_option(&#39=
;installed_tests&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +installed_tests_metadir =3D join_paths=
(datadir,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;installed-tests&#39;, meson.project_name())<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +installed_tests_execdir =3D join_paths=
(libexecdir,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;installed-tests&#39;, meson.project_name())<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+installed_tests_enabled =3D get_option(&#39=
;installed-tests&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+installed_tests_template =3D files(&#39;<a =
href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">templ=
ate.test.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D"nore=
ferrer" target=3D"_blank">http://template.test.in</a>&gt;&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0plugins_install_dir =3D join_path=
s(get_option(&#39;libdir&#39;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;gstreamer-1.0&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0pkgconfig =3D import(&#39;pkgconf=
ig&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/meson_options.txt b/meson_optio=
ns.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index c8cee3762..b5da40eaa 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/meson_options.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/meson_options.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/meson_opt=
ions.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/meson_options.txt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index 7363bdb7a1..a34ba37dad 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- a/subprojects/gstreamer/meson_options.tx=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/meson_options.tx=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 @@ -15,6 +15,7 @@ option(&#39;poisoning=
&#39;, type : &#39;boolean&#39;, value :<br>
&gt;=C2=A0 =C2=A0 =C2=A0false, description : &#39;Enable poiso<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0option(&#39;memory-alignment&#39;=
, type: &#39;combo&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 choices : [=
&#39;1&#39;, &#39;2&#39;, &#39;4&#39;, &#39;8&#39;, &#39;16&#39;, &#39;32&#=
39;, &#39;64&#39;, &#39;128&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;256&#39;, &#39;512&#39;, &#39;1024&#39;, &#39;=
2048&#39;, &#39;4096&#39;, &#39;8192&#39;, &#39;malloc&#39;, &#39;pagesize&=
#39;],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value: &#39=
;malloc&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+option(&#39;installed-tests&#39;, type : &#=
39;boolean&#39;, value : false,<br>
&gt;=C2=A0 =C2=A0 =C2=A0description : &#39;Enable installed tests&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++option(&#39;installed_tests&#39;, type : &#=
39;boolean&#39;, value : false,<br>
&gt;=C2=A0 =C2=A0 =C2=A0description : &#39;Enable installed tests&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0# Feature options<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0option(&#39;check&#39;, type : &#=
39;feature&#39;, value : &#39;auto&#39;, description :<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;Build unit test libraries&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/<a href=3D"http://template.test=
.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a> &lt;<a href=
=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">http://te=
mplate.test.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/<a href=3D"http://template.test.in" rel=3D"norefe=
rrer" target=3D"_blank">template.test.in</a> &lt;<a href=3D"http://template=
.test.in" rel=3D"noreferrer" target=3D"_blank">http://template.test.in</a>&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index 000000000..f701627f8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/<a href=3D"http://template.test.in" re=
l=3D"noreferrer" target=3D"_blank">template.test.in</a> &lt;<a href=3D"http=
://template.test.in" rel=3D"noreferrer" target=3D"_blank">http://template.t=
est.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -0,0 +1,3 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+[Test]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+Type=3Dsession<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+Exec=3D@installed_tests_dir@/@program@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/tests/check/meson.build b/tests=
/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index b2636714b..a697a7b06 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/tests/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/tests/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/tests/che=
ck/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/tests/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index 506606684d..00a138a568 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- a/subprojects/gstreamer/tests/check/meso=
n.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/tests/check/meso=
n.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 @@ -124,10 +124,16 @@ test_defines =3D =
[<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&#39;-UG_DISABLE_ASSERT&#3=
9;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&#39;-UG_DISABLE_CAST_CHEC=
KS&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -95,7 +85,7 @@ index b2636714b..a697a7b06 =
100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 test_conf.set(&#3=
9;installed_tests_dir&#39;, join_paths(prefix,<br>
&gt;=C2=A0 =C2=A0 =C2=A0installed_tests_execdir))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 test_conf.set(&#3=
9;program&#39;, test_name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 configure_file(<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 input: installe=
d_tests_template,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 input: &#39;<a =
href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">templ=
ate.test.in</a> &lt;<a href=3D"http://template.test.in" rel=3D"noreferrer" =
target=3D"_blank">http://template.test.in</a>&gt;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 output: te=
st_name + &#39;.test&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install_di=
r: installed_tests_metadir,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 configurat=
ion: test_conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -105,6 +95,15 @@ index b2636714b..a697a7b0=
6 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0test(test_name, exe=
, env: env, timeout : 3 * 60)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0endforeach<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/tests/che=
ck/<a href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank"=
>template.test.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D"nore=
ferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/tests/check/<a href=3D"http=
://template.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.in<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D"nore=
ferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index 0000000000..f701627f87<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/tests/check/<a h=
ref=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">templa=
te.test.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D"nore=
ferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +@@ -0,0 +1,3 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++[Test]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++Type=3Dsession<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++Exec=3D@installed_tests_dir@/@program@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -2.31.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +2.33.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
03-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
03-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; deleted file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index e0e64e2c7a..0000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
03-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,32 +0,0 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From 1db36347d05d88835519368442e9aa89c64091a=
d Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From: Seungha Yang &lt;<a href=3D"mailto:seu=
ngha@centricular.com" target=3D"_blank">seungha@centricular.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:seungha@centricular.co=
m" target=3D"_blank">seungha@centricular.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Date: Tue, 15 Sep 2020 00:54:58 +0900<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Subject: [PATCH] tests: seek: Don&#39;t use =
too strict timeout for<br>
&gt;=C2=A0 =C2=A0 =C2=A0validation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Expected segment-done message might not be s=
een within expected<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -time if system is not powerful enough.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Part-of:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/gstre=
amer/gstreamer/-/merge_requests/625" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/625</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/gstre=
amer/gstreamer/-/merge_requests/625" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/625</a>&=
gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Upstream-Status: Backport<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://cgit.freedesktop.org/gstreamer/=
gstreamer/commit?id=3Df44312ae5d831438fcf8041162079c65321c588c" rel=3D"nore=
ferrer" target=3D"_blank">https://cgit.freedesktop.org/gstreamer/gstreamer/=
commit?id=3Df44312ae5d831438fcf8041162079c65321c588c</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://cgit.freedesktop.org/gstream=
er/gstreamer/commit?id=3Df44312ae5d831438fcf8041162079c65321c588c" rel=3D"n=
oreferrer" target=3D"_blank">https://cgit.freedesktop.org/gstreamer/gstream=
er/commit?id=3Df44312ae5d831438fcf8041162079c65321c588c</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Signed-off-by: Anuj Mittal &lt;<a href=3D"ma=
ilto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:anuj.mittal@intel.com"=
 target=3D"_blank">anuj.mittal@intel.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - tests/check/pipelines/seek.c | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - 1 file changed, 1 insertion(+), 1 deletion(=
-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/tests/check/pipelines/seek.c<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0b/tests/check/pipelines/seek.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index 28bb8846d..5f7447bc5 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/tests/check/pipelines/seek.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/tests/check/pipelines/seek.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -521,7 +521,7 @@ GST_START_TEST (test_loo=
pback_2)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0GST_INFO (&quot;wait for segmen=
t done message&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 msg =3D gst_bus_timed_pop_filtered (=
bus, (GstClockTime) 2 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0GST_SECOND,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 msg =3D gst_bus_timed_pop_filtered (=
bus, GST_CLOCK_TIME_NONE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0GST_MESSAGE_SEGME=
NT_DONE | GST_MESSAGE_ERROR);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0fail_unless (msg, &quot;no mess=
age within the timed window&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0fail_unless_equals_string (GST_=
MESSAGE_TYPE_NAME (msg),<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;segment-done&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -2.29.2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
06-tests-use-a-dictionaries-for-environment.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
03-tests-use-a-dictionaries-for-environment.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; similarity index 61%<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0006=
-tests-use-a-dictionaries-for-environment.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0/0003=
-tests-use-a-dictionaries-for-environment.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 46813cec3d..10a6dcc619 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
06-tests-use-a-dictionaries-for-environment.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
03-tests-use-a-dictionaries-for-environment.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,4 +1,4 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From e82dedec1803922656e92285fc1bb75b2cdc0aa=
d Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +From fe830f0f75f3b4b41e3dbef8d4cf6ee4103c9e0=
6 Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 From: Jose Quaresma &lt;<a href=3D"mail=
to:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Date: Sat, 24 Apr 2021 10:34:47 +0100<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Subject: [PATCH 3/4] tests: use a dicti=
onaries for environment<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -10,29 +10,31 @@ Upstream-Status: Submitte=
d<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://gitlab.freedesktop.org/gstreame=
r/gstreamer/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesk=
top.org/gstreamer/gstreamer/-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/gstre=
amer/gstreamer/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freed=
esktop.org/gstreamer/gstreamer/-</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Signed-off-by: Jose Quaresma &lt;<a hre=
f=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.=
com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - tests/check/meson.build | 19 +++++++++++---=
-----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - 1 file changed, 11 insertions(+), 8 deletio=
ns(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + subprojects/gstreamer/tests/check/meson.bui=
ld | 21<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++++++++++-------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + 1 file changed, 13 insertions(+), 8 deletio=
ns(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/tests/check/meson.build b/tests=
/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index a697a7b06..f64524904 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/tests/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/tests/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -161,14 +161,17 @@ foreach t : core_tests=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/tests/che=
ck/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/tests/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index 00a138a568..48ec2532f8 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- a/subprojects/gstreamer/tests/check/meso=
n.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/tests/check/meso=
n.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +@@ -161,14 +161,19 @@ foreach t : core_tests=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install: ins=
talled_tests_enabled,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 -=C2=A0 =C2=A0 env =3D environment()<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 env.set(&#39;GST_PLUGIN_PATH_=
1_0&#39;, meson.build_root())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +-=C2=A0 =C2=A0 env.set(&#39;GST_PLUGIN_PATH_=
1_0&#39;, meson.project_build_root())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;GST_PLUGIN_=
SYSTEM_PATH_1_0&#39;, &#39;&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;GST_STATE_I=
GNORE_ELEMENTS&#39;, &#39;&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;CK_DEFAULT_=
TIMEOUT&#39;, &#39;20&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;GST_REGISTR=
Y&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;@0@/@1@.registry&#39;.format(meson.current_bui=
ld_dir(), test_name))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;GST_PLUGIN_=
SCANNER_1_0&#39;, gst_scanner_dir +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;/gst-plugin-scanner&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;GST_PLUGIN_=
LOADING_WHITELIST&#39;, &#39;gstreamer&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 # environment() can&#39;t be =
passed to configure_file and it is<br>
&gt;=C2=A0 =C2=A0 =C2=A0needed for installed_tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 # use a dictionary as this is=
 simplest solution to install<br>
&gt;=C2=A0 =C2=A0 =C2=A0the environment<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 # meson environment object ca=
n&#39;t be passed to<br>
&gt;=C2=A0 =C2=A0 =C2=A0configure_file and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 # installed tests uses config=
ure_file to install the<br>
&gt;=C2=A0 =C2=A0 =C2=A0environment.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 # use a dictionary as this is=
 the simplest solution<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 # to install the environment.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 env =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 &#39;GST_PLUGIN_PATH_1=
_0&#39;: meson.build_root(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;GST_PLUGIN_PATH_1=
_0&#39;: meson.project_build_root(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 &#39;GST_PLUGIN_S=
YSTEM_PATH_1_0&#39;: &#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 &#39;GST_STATE_IG=
NORE_ELEMENTS&#39;: &#39;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 &#39;CK_DEFAULT_T=
IMEOUT&#39;: &#39;20&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -44,5 +46,5 @@ index a697a7b06..f64524904 =
100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if installed_tests_=
enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_conf =
=3D configuration_data()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -2.31.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +2.33.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
04-tests-add-helper-script-to-run-the-installed_tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
04-tests-add-helper-script-to-run-the-installed_tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 0000000000..efa004f8ce<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
04-tests-add-helper-script-to-run-the-installed_tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -0,0 +1,74 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +From 4dcbabebca2ad6f1fdd59ee35a858082e87db7b=
6 Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +From: Jose Quaresma &lt;<a href=3D"mailto:qu=
aresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +Date: Sun, 2 May 2021 01:58:01 +0100<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +Subject: [PATCH 4/4] tests: add helper scrip=
t to run the<br>
&gt;=C2=A0 =C2=A0 =C2=A0installed_tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +- this is a bash script that will run the in=
stalled_tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +with some of the environment variables used =
in the meson<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +testing framework.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +Upstream-Status: Submitted<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://gitlab.freedesktop.org/gstreame=
r/gstreamer/-/merge_requests/789" rel=3D"noreferrer" target=3D"_blank">http=
s://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/gstre=
amer/gstreamer/-/merge_requests/789" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789</a>&=
gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"=
mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + subprojects/gstreamer/tests/check/meson.bui=
ld=C2=A0 =C2=A0| 17<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + .../gstreamer/tests/check/<a href=3D"http:/=
/template.sh.in" rel=3D"noreferrer" target=3D"_blank">template.sh.in</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.sh.in" rel=3D"norefe=
rrer" target=3D"_blank">http://template.sh.in</a>&gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 9 +++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + .../gstreamer/tests/check/<a href=3D"http:/=
/template.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D"nore=
ferrer" target=3D"_blank">http://template.test.in</a>&gt;=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + 3 files changed, 27 insertions(+), 1 deleti=
on(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + create mode 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0subprojects/gstreamer/tests/check/<a href=3D"http:/=
/template.sh.in" rel=3D"noreferrer" target=3D"_blank">template.sh.in</a> &l=
t;<a href=3D"http://template.sh.in" rel=3D"noreferrer" target=3D"_blank">ht=
tp://template.sh.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/tests/che=
ck/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/tests/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index 48ec2532f8..7dc4990d4e 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- a/subprojects/gstreamer/tests/check/meso=
n.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/tests/check/meso=
n.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +@@ -185,6 +185,23 @@ foreach t : core_tests<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install_di=
r: installed_tests_metadir,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configurat=
ion: test_conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 # All the tests will b=
e deployed on the target machine and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 # we use the home fold=
er ~ for the registry which will<br>
&gt;=C2=A0 =C2=A0 =C2=A0then expand at runtime.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 # Using the /tmp/gstre=
amer-1.0/@0@.registry can be<br>
&gt;=C2=A0 =C2=A0 =C2=A0problematic as it mostly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 # is mounted using tmp=
fs and if the machine crash from<br>
&gt;=C2=A0 =C2=A0 =C2=A0some reason we can lost the registry<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 # that is useful for d=
ebug propose of the tests itself.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 env +=3D {&#39;GST_REG=
ISTRY&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;~/.cache/gstreamer-1.0/@0@.registry&#39;.forma=
t(test_name)}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 # Set the full path fo=
r the test it self.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 env +=3D {&#39;TEST&#3=
9;: &#39;@0@/@1@&#39;.format(join_paths(prefix,<br>
&gt;=C2=A0 =C2=A0 =C2=A0installed_tests_execdir), test_name)}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 configure_file(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 input : &#39;<a=
 href=3D"http://template.sh.in" rel=3D"noreferrer" target=3D"_blank">templa=
te.sh.in</a> &lt;<a href=3D"http://template.sh.in" rel=3D"noreferrer" targe=
t=3D"_blank">http://template.sh.in</a>&gt;&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 output: test_na=
me + &#39;.sh&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir: in=
stalled_tests_execdir,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 configuration :=
 env,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0test(test_name, exe, env=
: env, timeout : 3 * 60)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/tests/che=
ck/<a href=3D"http://template.sh.in" rel=3D"noreferrer" target=3D"_blank">t=
emplate.sh.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.sh.in" rel=3D"norefe=
rrer" target=3D"_blank">http://template.sh.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/tests/check/<a href=3D"http=
://template.sh.in" rel=3D"noreferrer" target=3D"_blank">template.sh.in</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.sh.in" rel=3D"norefe=
rrer" target=3D"_blank">http://template.sh.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +new file mode 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index 0000000000..cf7d31b0ea<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/tests/check/<a h=
ref=3D"http://template.sh.in" rel=3D"noreferrer" target=3D"_blank">template=
.sh.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.sh.in" rel=3D"norefe=
rrer" target=3D"_blank">http://template.sh.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +@@ -0,0 +1,9 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++#!/bin/sh<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++set -ax<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++CK_DEFAULT_TIMEOUT=3D&quot;@CK_DEFAULT_TIME=
OUT@&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++GST_PLUGIN_LOADING_WHITELIST=3D&quot;@GST_P=
LUGIN_LOADING_WHITELIST@&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++GST_REGISTRY=3D@GST_REGISTRY@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++GST_STATE_IGNORE_ELEMENTS=3D&quot;@GST_STAT=
E_IGNORE_ELEMENTS@&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++exec @TEST@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/tests/che=
ck/<a href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank"=
>template.test.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D"nore=
ferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/tests/check/<a href=3D"http=
://template.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.in<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D"nore=
ferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index f701627f87..b74ef6ad73 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- a/subprojects/gstreamer/tests/check/<a h=
ref=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">templa=
te.test.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D"nore=
ferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/tests/check/<a h=
ref=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">templa=
te.test.in</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D"nore=
ferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +@@ -1,3 +1,3 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + [Test]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; + Type=3Dsession<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +-Exec=3D@installed_tests_dir@/@program@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++Exec=3D@installed_tests_dir@/@program@.sh<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +2.33.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
07-tests-install-the-environment-for-installed_tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
07-tests-install-the-environment-for-installed_tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; deleted file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index eabe7bcbe1..0000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1.0/00=
07-tests-install-the-environment-for-installed_tests.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,58 +0,0 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From 57d2965e979f886e03eecd7e351bf0181205397=
1 Mon Sep 17<br>
&gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From: Jose Quaresma &lt;<a href=3D"mailto:qu=
aresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Date: Sun, 2 May 2021 01:58:01 +0100<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Subject: [PATCH 4/4] tests: install the envi=
ronment for<br>
&gt;=C2=A0 =C2=A0 =C2=A0installed_tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -- adapt the test environment for installed_t=
ests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -- install the test environment for installed=
_tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -- run the tests using the installed environm=
ent<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Upstream-Status: Submitted<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://gitlab.freedesktop.org/gstreame=
r/gstreamer/-/merge_requests/789" rel=3D"noreferrer" target=3D"_blank">http=
s://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/gstre=
amer/gstreamer/-/merge_requests/789" rel=3D"noreferrer" target=3D"_blank">h=
ttps://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789</a>&=
gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Signed-off-by: Jose Quaresma &lt;<a href=3D"=
mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - <a href=3D"http://template.test.in" rel=3D"=
noreferrer" target=3D"_blank">template.test.in</a> &lt;<a href=3D"http://te=
mplate.test.in" rel=3D"noreferrer" target=3D"_blank">http://template.test.i=
n</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - tests/check/meson.build | 18 ++++++++++++++=
++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - 2 files changed, 19 insertions(+), 1 deleti=
on(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/<a href=3D"http://template.test=
.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a> &lt;<a href=
=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">http://te=
mplate.test.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/<a href=3D"http://template.test.in" rel=3D"norefe=
rrer" target=3D"_blank">template.test.in</a> &lt;<a href=3D"http://template=
.test.in" rel=3D"noreferrer" target=3D"_blank">http://template.test.in</a>&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index f701627f8..9a3fbdd09 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/<a href=3D"http://template.test.in" re=
l=3D"noreferrer" target=3D"_blank">template.test.in</a> &lt;<a href=3D"http=
://template.test.in" rel=3D"noreferrer" target=3D"_blank">http://template.t=
est.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/<a href=3D"http://template.test.in" re=
l=3D"noreferrer" target=3D"_blank">template.test.in</a> &lt;<a href=3D"http=
://template.test.in" rel=3D"noreferrer" target=3D"_blank">http://template.t=
est.in</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -1,3 +1,3 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - [Test]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - Type=3Dsession<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --Exec=3D@installed_tests_dir@/@program@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+Exec=3Dsh -c &#39;set -aex &amp;&amp; sourc=
e<br>
&gt;=C2=A0 =C2=A0 =C2=A0@installed_tests_dir@/@program@.env &amp;&amp; exec=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0@installed_tests_dir@/@program@&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/tests/check/meson.build b/tests=
/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index f64524904..a67e0f8dd 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/tests/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/tests/check/meson.build<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -183,6 +183,24 @@ foreach t : core_tests<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install_di=
r: installed_tests_metadir,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configurat=
ion: test_conf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 env +=3D {&#39;GST_REG=
ISTRY&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;~/.cache/gstreamer-1.0/@0@.registry&#39;.forma=
t(test_name)}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 configure_file(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output: test_na=
me + &#39;.env&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir: in=
stalled_tests_execdir,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 configuration :=
 env,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 # helper to convert a =
meson environment dictionay object<br>
&gt;=C2=A0 =C2=A0 =C2=A0exported with configure_file<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 # this also remove not=
 needed variables for the installed<br>
&gt;=C2=A0 =C2=A0 =C2=A0tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 meson.add_postconf_scr=
ipt(&#39;sed&#39;, &#39;-i&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#39;, &=
#39;/^#define/!d&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#39;, &=
#39;s/^#define //g&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#39;, &=
#39;/^GST_PLUGIN_PATH_1_0/d&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#39;, &=
#39;/^GST_PLUGIN_SYSTEM_PATH_1_0/d&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#39;, &=
#39;/^GST_PLUGIN_SCANNER_1_0/d&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#39;, &=
#39;s/ /=3D/&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 join_paths(meso=
n.current_build_dir(), test_name + &#39;.env&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0test(test_name, exe, env=
: env, timeout : 3 * 60)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -2.31.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/<a href=3D"http=
://gstreamer1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.=
0_1.18.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.18.5.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.18.5.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/<a href=3D"http=
://gstreamer1.0_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.=
0_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.20.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; similarity index 76%<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename from<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/<a href=3D"http:/=
/gstreamer1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_=
1.18.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.18.5.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.18.5.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename to<br>
&gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/<a href=3D"http:/=
/gstreamer1.0_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_=
1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.20.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 0d82dd338c..243f99fee9 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/meta/recipes-multimedia/gstreamer/<a hr=
ef=3D"http://gstreamer1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">g=
streamer1.0_1.18.5.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.18.5.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.18.5.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-multimedia/gstreamer/<a hr=
ef=3D"http://gstreamer1.0_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">g=
streamer1.0_1.20.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.20.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -10,22 +10,19 @@ DEPENDS =3D &quot;glib-2.=
0 glib-2.0-native libxml2<br>
&gt;=C2=A0 =C2=A0 =C2=A0bison-native flex-native&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 inherit meson pkgconfig gettext upstrea=
m-version-is-even<br>
&gt;=C2=A0 =C2=A0 =C2=A0gobject-introspection ptest-gnome<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -LIC_FILES_CHKSUM =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;file://COPYING;md5=3D6762ed442b3822387a51c92d=
928ead0d \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +LIC_FILES_CHKSUM =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;file://COPYING;md5=3D69333daa044cb77e486cc361=
29f7a770 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De=
059138481205ee2c6fc1c079c016d0d&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 S =3D &quot;${WORKDIR}/gstreamer-${PV}&=
quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"https://gstreamer.freedesktop.org/=
src/gstreamer/gstreamer-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_bla=
nk">https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gstreamer.freedesktop.org/sr=
c/gstreamer/gstreamer-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank=
">https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$%7BPV%7D.tar.x=
z</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gst-gstpluginloader.c-when-env-v=
ar-is-set-do-not-fal.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fil=
e://0002-Remove-unused-valgrind-detection.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-tests-seek-Don-t-use-too-strict-=
timeout-for-validati.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-tests-respect-the-idententaion-u=
sed-in-meson.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-tests-add-support-for-install-th=
e-tests.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-tests-use-a-dictionaries-for-env=
ironment.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-tests-install-the-environment-fo=
r-installed_tests.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-respect-the-idententaion-u=
sed-in-meson.patch;striplevel=3D3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-tests-add-support-for-install-th=
e-tests.patch;striplevel=3D3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-tests-use-a-dictionaries-for-env=
ironment.patch;striplevel=3D3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-tests-add-helper-script-to-run-t=
he-installed_tests.patch;striplevel=3D3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;55862232a63459bbf56abebde3085ca9aec211b478e89=
1dacea4d6df8cafe80a&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;edf4bffff85591d4fff7b21bb9ed7f0feabc123ac4a4e=
ff29e73cbce454f9db7&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.utils.c=
ontains(&#39;PTEST_ENABLED&#39;, &#39;1&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;tests&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -36,7 +33,7 @@ PACKAGECONFIG[debug] =3D<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;-Dgst_debug=3Dtrue,-Dgst_debug=3Dfalse&quot;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 PACKAGECONFIG[tracer-hooks] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;-Dtracer_hooks=3Dtrue,-Dtracer_hooks=3Dfalse&=
quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 PACKAGECONFIG[coretracers] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;-Dcoretracers=3Denabled,-Dcoretracers=3Ddisab=
led&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 PACKAGECONFIG[check] =3D &quot;-Dcheck=
=3Denabled,-Dcheck=3Ddisabled&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -PACKAGECONFIG[tests] =3D &quot;-Dtests=3Dena=
bled<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Dinstalled-tests=3Dtrue,-Dtests=3Ddisabled -Dinsta=
lled-tests=3Dfalse&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +PACKAGECONFIG[tests] =3D &quot;-Dtests=3Dena=
bled<br>
&gt;=C2=A0 =C2=A0 =C2=A0-Dinstalled_tests=3Dtrue,-Dtests=3Ddisabled -Dinsta=
lled_tests=3Dfalse&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 PACKAGECONFIG[unwind] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,=
libunwind&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 PACKAGECONFIG[dw] =3D &quot;-Dlibdw=3De=
nabled,-Dlibdw=3Ddisabled,elfutils&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 PACKAGECONFIG[bash-completion] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;-Dbash-completion=3Denabled,-Dbash-completion=
=3Ddisabled,bash-completion&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 2.35.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Links: You receive all messages sent to this =
group.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; View/Reply Online (#161427):<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/message/161427" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/message/161427</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/message/161427" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-core/message/161427</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Mute This Topic:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/mt/889623=
13/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/mt/88962313/1686489</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/mt/88=
962313/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/88962313/1686489</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Group Owner: <a href=3D"mailto:openembedded-c=
ore%2Bowner@lists.openembedded.org" target=3D"_blank">openembedded-core+own=
er@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%252B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowner@l=
ists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Unsubscribe:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/g/ope=
nembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/g/openembedded-core/unsub</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a> &lt;mailto:<a href=3D"mailto:alex.ka=
navin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Best regards,<br>
&gt; <br>
&gt; Jos=C3=A9 Quaresma<br>
<br>
-- <br>
DENX Software Engineering GmbH,=C2=A0 =C2=A0 =C2=A0 Managing Director: Wolf=
gang Denk<br>
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany<br>
Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: <a href=3D"mailt=
o:ch@denx.de" target=3D"_blank">ch@denx.de</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000009d97e105d82b387a--

