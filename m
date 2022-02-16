Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81445C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 23:41:03 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.1059.1645054861330998819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 15:41:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nR/6zuH5;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id o2so6827649lfd.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 15:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H1iffyezbCDXd/wxrimF19lX3iVIBNxXoWew9w/nvH8=;
        b=nR/6zuH59SF4iKk2Qx9BKIcDTSA6lwiw6SIHiQKVDjOfJBJ010QPnfv0Dw7Y6Hr2x2
         JTte8IVV9wsre8aWRNRC2sPfCx5GYfL/wfOn1akLk8S5XiPVRn1rHZp7FLZkKY19Tr21
         hhVv38tX4fDat3zkGtkvY2gT2TK0OLMQj9J+GKeubkQxGWDXs0mBIhQUNma7Pr1Q37VE
         uFKPOA/uSOGM00t/lYgbzluxSIH6is3GrKB/VDYd1lDHjimpg7EIEwGiyOJiZoNIH/+r
         cHQItX59aBXBh8r9w0ryJfGo/ZqPsb3do6fv4cZr6gofv2T2BKHjegMiDUddPKZchb/E
         zshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H1iffyezbCDXd/wxrimF19lX3iVIBNxXoWew9w/nvH8=;
        b=HUL3JMOuARlmATo17/o7TT/gUPtgg8SEsSkQpHe+Btl9LVTHxoRcCBMVWdn5zcS0Jz
         2a/t9iNblwKG6rvt/Pl4rNmjQdD+JmHkXczX7jpDAwYdgN23CGidtV92gdDjI6hK5agp
         5SbCTWl64unyLxPSoh1pBnBSrU6ZsH/DEtuOrjDe2+696Nn1UcHiXsh0u+C6ayrHrQpG
         q3lxAmnHGtswJu8vpnvWJNu/kqzwOFauiQJYXXSccJcgPSKfmRlXxHA996qLpOGndjpZ
         Iz0wJcSZa+nh8kag+P6SikD6iv0p96f1on1jmo8CRJG3RyHGHSUykFOz6fy0pTF9MGqy
         kw9Q==
X-Gm-Message-State: AOAM533VrgKmc5ZsZL6gnM7a4YDp1lxMvDlEMJICT9dwDnVUOR+ih+6M
	L4OX0H3P4idxn/eeRzixTivmc4cgfNs7d0Fl4yE=
X-Google-Smtp-Source: 
 ABdhPJyVqiWrzoISaWWiDoSNcR4krn8uPRWA7wVXgLb4S9jVOQdRJVTaS8Dtne8RN4EkMzCFU9Szu+7iatuNLd3Gqi4=
X-Received: by 2002:a05:6512:3709:b0:436:26a3:99d3 with SMTP id
 z9-20020a056512370900b0043626a399d3mr293421lfr.106.1645054859097; Wed, 16 Feb
 2022 15:40:59 -0800 (PST)
MIME-Version: 1.0
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
 <20220207010823.143664-7-quaresma.jose@gmail.com>
 <CANNYZj8SNr_MA86N9kL7jQw27QV8gDtwH_hSD_a9tfTVL8xd+Q@mail.gmail.com>
 <CANPvuRkJpThUEjiKfzvg4m+Dz_-ChDRu8Yy1LsSnTmK8FdgoDg@mail.gmail.com>
 <720ba17c-525a-3ad0-9c61-f2bc8db82468@denx.de>
 <CANNYZj91L_QUcx-x8YSdSBo6gOqgzY0Cogh7r0ZphW_k4tf-gQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj91L_QUcx-x8YSdSBo6gOqgzY0Cogh7r0ZphW_k4tf-gQ@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 16 Feb 2022 23:40:48 +0000
Message-ID: 
 <CANPvuRnZ8PLFsEp=-jQsFWUGoMz2FX=u58yC7pbKr7pof-g5FQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 07/17] gstreamer1.0: upgrade 1.18.5 -> 1.20.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Claudius Heine <ch@denx.de>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000833ddc05d82b2e99"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 23:41:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161788

--000000000000833ddc05d82b2e99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia quarta,
9/02/2022 =C3=A0(s) 10:34:

> Yes, it seems to be sporadic. Here's a sample fail:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3083
>
> https://autobuilder.yocto.io/pub/non-release/20220208-14/testresults/qemu=
x86-64-ptest/gstreamer1.0.log



I ask for help upstream but I will try to replicate this with GST_DEBUG
enabled.
Which is the best option to send a patch not for merge but only to run on
the autobuilder to generate some logs?

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/778


>
> Alex
>
> On Wed, 9 Feb 2022 at 10:30, Claudius Heine <ch@denx.de> wrote:
> >
> > Hi Jose
> >
> > On 2022-02-09 10:15, Jose Quaresma wrote:
> > > Hi Alexander,
> > >
> > > Can you please clarify in what target arch is this happening and I ca=
n
> > > try to replicate it with qemu?
> >
> > I think we are hitting:
> > https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/778
> >
> > This testcase seems to be flaky and IIUC upstream marked it as such in
> > their test infrastructure.
> >
> > In my patchset, I added a patch to disable that testcase.
> >
> > regards,
> > Claudius
> >
> > >
> > > It works on my side on qemux86-64.
> > >
> > > root@qemux86-64:~#
> /usr/libexec/installed-tests/gstreamer/gst_gstbin.sh
> > > + CK_DEFAULT_TIMEOUT=3D20
> > > + GST_PLUGIN_LOADING_WHITELIST=3Dgstreamer
> > > + GST_REGISTRY=3D/home/root/.cache/gstreamer-1.0/gst_gstbin.registry
> > > + GST_STATE_IGNORE_ELEMENTS=3D
> > > + exec /usr/libexec/installed-tests/gstreamer/gst_gstbin
> > > Running suite(s): GstBin
> > > 100%: Checks: 26, Failures: 0, Errors: 0
> > > Check suite gst_bin ran in 6.239s (tests failed: 0)
> > >
> > >
> > > Alexander Kanavin <alex.kanavin@gmail.com
> > > <mailto:alex.kanavin@gmail.com>> escreveu no dia ter=C3=A7a, 8/02/202=
2 =C3=A0(s)
> > > 22:01:
> > >
> > >     Unfortunately this patchset (which is now in master) does not
> address
> > >     the ptest fail. Please resolve this as soon as possible.
> > >
> > >     + exec /usr/libexec/installed-tests/gstreamer/gst_gstbin
> > >     Running suite(s): GstBin
> > >     Executing: gstreamer/gst_gstbin.test
> > >     Executing: gstreamer/gst_gstbin.test
> > >     ....
> > >     Executing: gstreamer/gst_gstbin.test
> > >     Executing: gstreamer/gst_gstbin.test
> > >     Test timed out after 300 seconds
> > >     FAIL: gstreamer/gst_gstbin.test (Child process killed by signal 9=
)
> > >
> > >     Alex
> > >
> > >     On Mon, 7 Feb 2022 at 02:08, Jose Quaresma <
> quaresma.jose@gmail.com
> > >     <mailto:quaresma.jose@gmail.com>> wrote:
> > >      >
> > >      > - License update:
> > >      >   The code actually is LGPLv2.1 but the COPYING file is wrong.
> > >      >
> > >
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d157b23fb0ce1=
75b167611a4cb019599d9017042
> > >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d157b23fb0ce1=
75b167611a4cb019599d9017042
> >
> > >      >
> > >      > - Drop backported patches
> > >      >
>  0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
> > >      >   0002-Remove-unused-valgrind-detection.patch
> > >      >
>  0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
> > >      >
> > >      > - Update submitted patches
> > >      >   0001-tests-respect-the-idententaion-used-in-meson.patch
> > >      >   0002-tests-add-support-for-install-the-tests.patch
> > >      >   0003-tests-use-a-dictionaries-for-environment.patch
> > >      >   0004-tests-add-helper-script-to-run-the-installed_tests.patc=
h
> > >      >
> > >      > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> > >     <mailto:quaresma.jose@gmail.com>>
> > >      > ---
> > >      >  ...der.c-when-env-var-is-set-do-not-fal.patch |  69 ---------=
--
> > >      >  ...pect-the-idententaion-used-in-meson.patch} |  14 +--
> > >      >  ...002-Remove-unused-valgrind-detection.patch | 112
> > >     ------------------
> > >      >  ...s-add-support-for-install-the-tests.patch} |  67 ++++++---=
--
> > >      >  ...-use-too-strict-timeout-for-validati.patch |  32 -----
> > >      >  ...-use-a-dictionaries-for-environment.patch} |  28 +++--
> > >      >  ...er-script-to-run-the-installed_tests.patch |  74
> ++++++++++++
> > >      >  ...-the-environment-for-installed_tests.patch |  58 ---------
> > >      >  ...er1.0_1.18.5.bb <http://er1.0_1.18.5.bb> =3D>
> > >     gstreamer1.0_1.20.0.bb <http://gstreamer1.0_1.20.0.bb>} |  17 ++-
> > >      >  9 files changed, 136 insertions(+), 335 deletions(-)
> > >      >  delete mode 100644
> > >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.=
c-when-env-var-is-set-do-not-fal.patch
> > >      >  rename
> > >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-tests-respect-the-i=
dententaion-used-in-meson.patch
> > >     =3D> 0001-tests-respect-the-idententaion-used-in-meson.patch} (71=
%)
> > >      >  delete mode 100644
> > >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valgri=
nd-detection.patch
> > >      >  rename
> > >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/{0005-tests-add-support-f=
or-install-the-tests.patch
> > >     =3D> 0002-tests-add-support-for-install-the-tests.patch} (65%)
> > >      >  delete mode 100644
> > >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use=
-too-strict-timeout-for-validati.patch
> > >      >  rename
> > >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/{0006-tests-use-a-diction=
aries-for-environment.patch
> > >     =3D> 0003-tests-use-a-dictionaries-for-environment.patch} (61%)
> > >      >  create mode 100644
> > >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-scr=
ipt-to-run-the-installed_tests.patch
> > >      >  delete mode 100644
> > >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-en=
vironment-for-installed_tests.patch
> > >      >  rename meta/recipes-multimedia/gstreamer/{
> gstreamer1.0_1.18.5.bb
> > >     <http://gstreamer1.0_1.18.5.bb> =3D> gstreamer1.0_1.20.0.bb
> > >     <http://gstreamer1.0_1.20.0.bb>} (76%)
> > >      >
> > >      > diff --git
> > >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloade=
r.c-when-env-var-is-set-do-not-fal.patch
> > >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloade=
r.c-when-env-var-is-set-do-not-fal.patch
> > >      > deleted file mode 100644
> > >      > index 23ebd5c600..0000000000
> > >      > ---
> > >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst-gstpluginloade=
r.c-when-env-var-is-set-do-not-fal.patch
> > >      > +++ /dev/null
> > >      > @@ -1,69 +0,0 @@
> > >      > -From fd8f49dba8c09d47425da80f5faab3bfa4a7c962 Mon Sep 17
> > >     00:00:00 2001
> > >      > -From: Jose Quaresma <quaresma.jose@gmail.com
> > >     <mailto:quaresma.jose@gmail.com>>
> > >      > -Date: Sat, 10 Oct 2020 19:09:03 +0000
> > >      > -Subject: [PATCH 1/3] gstpluginloader: when env var is set do
> not
> > >     fall through
> > >      > - to system plugin scanner
> > >      > -
> > >      > -If we set a custom GST_PLUGIN_SCANNER env var, then we probab=
ly
> > >     want to use that and only that.
> > >      > -
> > >      > -Falling through to the one installed on the system is
> > >     problamatic in cross-compilation
> > >      > -environemnts, regardless of whether one pointed to by the env
> > >     var succeeded or failed.
> > >      > -
> > >      > -taken from:
> > >      >
> > >     -
> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-multim=
edia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-=
do-not-fal.patch?id=3D0db7ba34ca41b107042306d13a6f0162885c123b
> > >     <
> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-multim=
edia/gstreamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-=
do-not-fal.patch?id=3D0db7ba34ca41b107042306d13a6f0162885c123b
> >
> > >      > -
> > >      > -Part-of:
> > >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669
> > >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669>>
> > >      > -
> > >      > -Upstream-Status: Backport
> > >     [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9f958058697e6=
fbf5bde325228034572331d1a3a
> > >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9f958058697e6=
fbf5bde325228034572331d1a3a
> >]
> > >      > -
> > >      > -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> > >     <mailto:quaresma.jose@gmail.com>>
> > >      > ----
> > >      > - gst/gstpluginloader.c | 15 +++++++--------
> > >      > - 1 file changed, 7 insertions(+), 8 deletions(-)
> > >      > -
> > >      > -diff --git a/gst/gstpluginloader.c b/gst/gstpluginloader.c
> > >      > -index d1e404d98..c626bf263 100644
> > >      > ---- a/gst/gstpluginloader.c
> > >      > -+++ b/gst/gstpluginloader.c
> > >      > -@@ -464,20 +464,19 @@ gst_plugin_loader_spawn (GstPluginLoade=
r
> *
> > >     loader)
> > >      > -   if (loader->child_running)
> > >      > -     return TRUE;
> > >      > -
> > >      > --  /* Find the gst-plugin-scanner: first try the env-var if i=
t
> > >     is set,
> > >      > --   * otherwise use the installed version */
> > >      > -+  /* Find the gst-plugin-scanner */
> > >      > -   env =3D g_getenv ("GST_PLUGIN_SCANNER_1_0");
> > >      > -   if (env =3D=3D NULL)
> > >      > -     env =3D g_getenv ("GST_PLUGIN_SCANNER");
> > >      > -
> > >      > -   if (env !=3D NULL && *env !=3D '\0') {
> > >      > -+    /* use the env-var if it is set */
> > >      > -     GST_LOG ("Trying GST_PLUGIN_SCANNER env var: %s", env);
> > >      > -     helper_bin =3D g_strdup (env);
> > >      > -     res =3D gst_plugin_loader_try_helper (loader, helper_bin=
);
> > >      > -     g_free (helper_bin);
> > >      > --  }
> > >      > --
> > >      > --  if (!res) {
> > >      > -+  } else {
> > >      > -+    /* use the installed version */
> > >      > -     GST_LOG ("Trying installed plugin scanner");
> > >      > -
> > >      > - #ifdef G_OS_WIN32
> > >      > -@@ -497,10 +496,10 @@ gst_plugin_loader_spawn (GstPluginLoade=
r
> *
> > >     loader)
> > >      > - #endif
> > >      > -     res =3D gst_plugin_loader_try_helper (loader, helper_bin=
);
> > >      > -     g_free (helper_bin);
> > >      > -+  }
> > >      > -
> > >      > --    if (!res) {
> > >      > --      GST_INFO ("No gst-plugin-scanner available, or not
> working");
> > >      > --    }
> > >      > -+  if (!res) {
> > >      > -+    GST_INFO ("No gst-plugin-scanner available, or not
> working");
> > >      > -   }
> > >      > -
> > >      > -   return loader->child_running;
> > >      > ---
> > >      > -2.29.2
> > >      > -
> > >      > diff --git
> > >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-the-=
idententaion-used-in-meson.patch
> > >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-=
idententaion-used-in-meson.patch
> > >      > similarity index 71%
> > >      > rename from
> > >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-the-id=
ententaion-used-in-meson.patch
> > >      > rename to
> > >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-id=
ententaion-used-in-meson.patch
> > >      > index 6f571a12d8..312c04fbfd 100644
> > >      > ---
> > >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-respect-the-=
idententaion-used-in-meson.patch
> > >      > +++
> > >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-respect-the-=
idententaion-used-in-meson.patch
> > >      > @@ -1,4 +1,4 @@
> > >      > -From 122e5ac3dd16a461b6ae595605490c8f5d1c3a9d Mon Sep 17
> > >     00:00:00 2001
> > >      > +From 1eb77a4ea5a3967c688d8f1192f99c605badc7e2 Mon Sep 17
> > >     00:00:00 2001
> > >      >  From: Jose Quaresma <quaresma.jose@gmail.com
> > >     <mailto:quaresma.jose@gmail.com>>
> > >      >  Date: Sun, 11 Apr 2021 19:48:13 +0100
> > >      >  Subject: [PATCH 1/4] tests: respect the idententaion used in
> meson
> > >      > @@ -7,13 +7,13 @@ Upstream-Status: Submitted
> > >     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/->
> > >      >
> > >      >  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> > >     <mailto:quaresma.jose@gmail.com>>
> > >      >  ---
> > >      > - tests/check/meson.build | 10 +++++-----
> > >      > + subprojects/gstreamer/tests/check/meson.build | 10 +++++----=
-
> > >      >   1 file changed, 5 insertions(+), 5 deletions(-)
> > >      >
> > >      > -diff --git a/tests/check/meson.build b/tests/check/meson.buil=
d
> > >      > -index a617cf159..b2636714b 100644
> > >      > ---- a/tests/check/meson.build
> > >      > -+++ b/tests/check/meson.build
> > >      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
> > >     b/subprojects/gstreamer/tests/check/meson.build
> > >      > +index 9c4228b6e4..506606684d 100644
> > >      > +--- a/subprojects/gstreamer/tests/check/meson.build
> > >      > ++++ b/subprojects/gstreamer/tests/check/meson.build
> > >      >  @@ -146,11 +146,11 @@ foreach t : core_tests
> > >      >
> > >      >     if not skip_test
> > >      > @@ -32,5 +32,5 @@ index a617cf159..b2636714b 100644
> > >      >
> > >      >       env =3D environment()
> > >      >  --
> > >      > -2.31.1
> > >      > +2.33.1
> > >      >
> > >      > diff --git
> > >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valg=
rind-detection.patch
> > >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valg=
rind-detection.patch
> > >      > deleted file mode 100644
> > >      > index 5121044734..0000000000
> > >      > ---
> > >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-Remove-unused-valg=
rind-detection.patch
> > >      > +++ /dev/null
> > >      > @@ -1,112 +0,0 @@
> > >      > -From e275ba2bd854ac15a4b65a8f07d9f042021950da Mon Sep 17
> > >     00:00:00 2001
> > >      > -From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC3=3DBCller?=3D <
> tim@centricular.com
> > >     <mailto:tim@centricular.com>>
> > >      > -Date: Fri, 14 Aug 2020 16:38:26 +0100
> > >      > -Subject: [PATCH 2/3] Remove unused valgrind detection
> > >      > -
> > >      > -Having this just to log a debug message in case we're
> > >      > -running inside valgrind doesn't seem very useful, and
> > >      > -the code that used to use this no longer exists it seems.
> > >      > -
> > >      > -Part-of:
> > >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595
> > >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595>>
> > >      > -
> > >      > -Upstream-Status: Backport
> [a2cbf75523cdf8a4df1baa7007d86ef455972245]
> > >      > -
> > >      > -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> > >     <mailto:quaresma.jose@gmail.com>>
> > >      > ----
> > >      > - gst/gst_private.h |  2 --
> > >      > - gst/gstinfo.c     | 39 -------------------------------------=
--
> > >      > - meson.build       |  1 -
> > >      > - 3 files changed, 42 deletions(-)
> > >      > -
> > >      > -diff --git a/gst/gst_private.h b/gst/gst_private.h
> > >      > -index eefd044..8252ede 100644
> > >      > ---- a/gst/gst_private.h
> > >      > -+++ b/gst/gst_private.h
> > >      > -@@ -116,8 +116,6 @@ G_GNUC_INTERNAL  gboolean
> > >     _priv_plugin_deps_env_vars_changed (GstPlugin * plugin
> > >      > -
> > >      > - G_GNUC_INTERNAL  gboolean _priv_plugin_deps_files_changed
> > >     (GstPlugin * plugin);
> > >      > -
> > >      > --G_GNUC_INTERNAL  gboolean _priv_gst_in_valgrind (void);
> > >      > --
> > >      > - /* init functions called from gst_init(). */
> > >      > - G_GNUC_INTERNAL  void  _priv_gst_quarks_initialize (void);
> > >      > - G_GNUC_INTERNAL  void  _priv_gst_mini_object_initialize
> (void);
> > >      > -diff --git a/gst/gstinfo.c b/gst/gstinfo.c
> > >      > -index eea1a21..d3035d6 100644
> > >      > ---- a/gst/gstinfo.c
> > >      > -+++ b/gst/gstinfo.c
> > >      > -@@ -305,36 +305,6 @@ static gboolean pretty_tags =3D
> > >     PRETTY_TAGS_DEFAULT;
> > >      > - static gint G_GNUC_MAY_ALIAS __default_level =3D
> GST_LEVEL_DEFAULT;
> > >      > - static gint G_GNUC_MAY_ALIAS __use_color =3D
> GST_DEBUG_COLOR_MODE_ON;
> > >      > -
> > >      > --/* FIXME: export this? */
> > >      > --gboolean
> > >      > --_priv_gst_in_valgrind (void)
> > >      > --{
> > >      > --  static enum
> > >      > --  {
> > >      > --    GST_VG_UNCHECKED,
> > >      > --    GST_VG_NO_VALGRIND,
> > >      > --    GST_VG_INSIDE
> > >      > --  }
> > >      > --  in_valgrind =3D GST_VG_UNCHECKED;
> > >      > --
> > >      > --  if (in_valgrind =3D=3D GST_VG_UNCHECKED) {
> > >      > --#ifdef HAVE_VALGRIND_VALGRIND_H
> > >      > --    if (RUNNING_ON_VALGRIND) {
> > >      > --      GST_CAT_INFO (GST_CAT_GST_INIT, "we're running inside
> > >     valgrind");
> > >      > --      in_valgrind =3D GST_VG_INSIDE;
> > >      > --    } else {
> > >      > --      GST_CAT_LOG (GST_CAT_GST_INIT, "not doing extra valgri=
nd
> > >     stuff");
> > >      > --      in_valgrind =3D GST_VG_NO_VALGRIND;
> > >      > --    }
> > >      > --#else
> > >      > --    in_valgrind =3D GST_VG_NO_VALGRIND;
> > >      > --#endif
> > >      > --    g_assert (in_valgrind =3D=3D GST_VG_NO_VALGRIND ||
> > >      > --        in_valgrind =3D=3D GST_VG_INSIDE);
> > >      > --  }
> > >      > --  return (in_valgrind =3D=3D GST_VG_INSIDE);
> > >      > --}
> > >      > --
> > >      > - static gchar *
> > >      > - _replace_pattern_in_gst_debug_file_name (gchar * name, const
> > >     char *token,
> > >      > -     guint val)
> > >      > -@@ -463,9 +433,6 @@ _priv_gst_debug_init (void)
> > >      > -   _priv_GST_CAT_PROTECTION =3D
> > >      > -       _gst_debug_category_new ("GST_PROTECTION", 0,
> "protection");
> > >      > -
> > >      > --  /* print out the valgrind message if we're in valgrind */
> > >      > --  _priv_gst_in_valgrind ();
> > >      > --
> > >      > -   env =3D g_getenv ("GST_DEBUG_OPTIONS");
> > >      > -   if (env !=3D NULL) {
> > >      > -     if (strstr (env, "full_tags") || strstr (env,
> "full-tags"))
> > >      > -@@ -2505,12 +2472,6 @@ gst_debug_construct_win_color (guint
> > >     colorinfo)
> > >      > -   return 0;
> > >      > - }
> > >      > -
> > >      > --gboolean
> > >      > --_priv_gst_in_valgrind (void)
> > >      > --{
> > >      > --  return FALSE;
> > >      > --}
> > >      > --
> > >      > - void
> > >      > - _gst_debug_dump_mem (GstDebugCategory * cat, const gchar *
> file,
> > >      > -     const gchar * func, gint line, GObject * obj, const gcha=
r
> *
> > >     msg,
> > >      > -diff --git a/meson.build b/meson.build
> > >      > -index 82a1728..42ae617 100644
> > >      > ---- a/meson.build
> > >      > -+++ b/meson.build
> > >      > -@@ -200,7 +200,6 @@ check_headers =3D [
> > >      > -   'sys/wait.h',
> > >      > -   'ucontext.h',
> > >      > -   'unistd.h',
> > >      > --  'valgrind/valgrind.h',
> > >      > -   'sys/resource.h',
> > >      > -   'sys/uio.h',
> > >      > - ]
> > >      > ---
> > >      > -2.29.2
> > >      > -
> > >      > diff --git
> > >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-support-=
for-install-the-tests.patch
> > >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-=
for-install-the-tests.patch
> > >      > similarity index 65%
> > >      > rename from
> > >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-support-fo=
r-install-the-tests.patch
> > >      > rename to
> > >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-fo=
r-install-the-tests.patch
> > >      > index b77fb5797f..d18c19c397 100644
> > >      > ---
> > >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-tests-add-support-=
for-install-the-tests.patch
> > >      > +++
> > >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-=
for-install-the-tests.patch
> > >      > @@ -1,4 +1,4 @@
> > >      > -From c9e93c7a3e4d2773abef4f5e1464af24f36700b3 Mon Sep 17
> > >     00:00:00 2001
> > >      > +From 62f5bb7bfc2498219df7280e73480d8ed2378ce5 Mon Sep 17
> > >     00:00:00 2001
> > >      >  From: Jose Quaresma <quaresma.jose@gmail.com
> > >     <mailto:quaresma.jose@gmail.com>>
> > >      >  Date: Sun, 11 Apr 2021 19:48:13 +0100
> > >      >  Subject: [PATCH 2/4] tests: add support for install the tests
> > >      > @@ -11,54 +11,44 @@ Upstream-Status: Submitted
> > >     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/->
> > >      >
> > >      >  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> > >     <mailto:quaresma.jose@gmail.com>>
> > >      >  ---
> > >      > - meson.build             |  5 +++++
> > >      > - meson_options.txt       |  1 +
> > >      > - template.test.in <http://template.test.in>        |  3 +++
> > >      > - tests/check/meson.build | 22 +++++++++++++++++++++-
> > >      > - 4 files changed, 30 insertions(+), 1 deletion(-)
> > >      > - create mode 100644 template.test.in <http://template.test.in=
>
> > >      > + subprojects/gstreamer/meson.build             |  4 ++++
> > >      > + subprojects/gstreamer/meson_options.txt       |  1 +
> > >      > + subprojects/gstreamer/tests/check/meson.build | 22
> > >     ++++++++++++++++++-
> > >      > + .../gstreamer/tests/check/template.test.in
> > >     <http://template.test.in>    |  3 +++
> > >      > + 4 files changed, 29 insertions(+), 1 deletion(-)
> > >      > + create mode 100644
> > >     subprojects/gstreamer/tests/check/template.test.in
> > >     <http://template.test.in>
> > >      >
> > >      > -diff --git a/meson.build b/meson.build
> > >      > -index c4e8774f5..1abf4eb26 100644
> > >      > ---- a/meson.build
> > >      > -+++ b/meson.build
> > >      > -@@ -562,6 +562,11 @@ if bashcomp_dep.found()
> > >      > +diff --git a/subprojects/gstreamer/meson.build
> > >     b/subprojects/gstreamer/meson.build
> > >      > +index d20fe0040f..b595d8f990 100644
> > >      > +--- a/subprojects/gstreamer/meson.build
> > >      > ++++ b/subprojects/gstreamer/meson.build
> > >      > +@@ -562,6 +562,10 @@ if bashcomp_dep.found()
> > >      >     endif
> > >      >   endif
> > >      >
> > >      > ++installed_tests_enabled =3D get_option('installed_tests')
> > >      >  +installed_tests_metadir =3D join_paths(datadir,
> > >     'installed-tests', meson.project_name())
> > >      >  +installed_tests_execdir =3D join_paths(libexecdir,
> > >     'installed-tests', meson.project_name())
> > >      > -+installed_tests_enabled =3D get_option('installed-tests')
> > >      > -+installed_tests_template =3D files('template.test.in
> > >     <http://template.test.in>')
> > >      >  +
> > >      >   plugins_install_dir =3D join_paths(get_option('libdir'),
> > >     'gstreamer-1.0')
> > >      >
> > >      >   pkgconfig =3D import('pkgconfig')
> > >      > -diff --git a/meson_options.txt b/meson_options.txt
> > >      > -index c8cee3762..b5da40eaa 100644
> > >      > ---- a/meson_options.txt
> > >      > -+++ b/meson_options.txt
> > >      > +diff --git a/subprojects/gstreamer/meson_options.txt
> > >     b/subprojects/gstreamer/meson_options.txt
> > >      > +index 7363bdb7a1..a34ba37dad 100644
> > >      > +--- a/subprojects/gstreamer/meson_options.txt
> > >      > ++++ b/subprojects/gstreamer/meson_options.txt
> > >      >  @@ -15,6 +15,7 @@ option('poisoning', type : 'boolean', value=
 :
> > >     false, description : 'Enable poiso
> > >      >   option('memory-alignment', type: 'combo',
> > >      >          choices : ['1', '2', '4', '8', '16', '32', '64', '128=
',
> > >     '256', '512', '1024', '2048', '4096', '8192', 'malloc',
> 'pagesize'],
> > >      >          value: 'malloc')
> > >      > -+option('installed-tests', type : 'boolean', value : false,
> > >     description : 'Enable installed tests')
> > >      > ++option('installed_tests', type : 'boolean', value : false,
> > >     description : 'Enable installed tests')
> > >      >
> > >      >   # Feature options
> > >      >   option('check', type : 'feature', value : 'auto', descriptio=
n
> :
> > >     'Build unit test libraries')
> > >      > -diff --git a/template.test.in <http://template.test.in>
> > >     b/template.test.in <http://template.test.in>
> > >      > -new file mode 100644
> > >      > -index 000000000..f701627f8
> > >      > ---- /dev/null
> > >      > -+++ b/template.test.in <http://template.test.in>
> > >      > -@@ -0,0 +1,3 @@
> > >      > -+[Test]
> > >      > -+Type=3Dsession
> > >      > -+Exec=3D@installed_tests_dir@/@program@
> > >      > -diff --git a/tests/check/meson.build b/tests/check/meson.buil=
d
> > >      > -index b2636714b..a697a7b06 100644
> > >      > ---- a/tests/check/meson.build
> > >      > -+++ b/tests/check/meson.build
> > >      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
> > >     b/subprojects/gstreamer/tests/check/meson.build
> > >      > +index 506606684d..00a138a568 100644
> > >      > +--- a/subprojects/gstreamer/tests/check/meson.build
> > >      > ++++ b/subprojects/gstreamer/tests/check/meson.build
> > >      >  @@ -124,10 +124,16 @@ test_defines =3D [
> > >      >     '-UG_DISABLE_ASSERT',
> > >      >     '-UG_DISABLE_CAST_CHECKS',
> > >      > @@ -95,7 +85,7 @@ index b2636714b..a697a7b06 100644
> > >      >  +      test_conf.set('installed_tests_dir', join_paths(prefix=
,
> > >     installed_tests_execdir))
> > >      >  +      test_conf.set('program', test_name)
> > >      >  +      configure_file(
> > >      > -+        input: installed_tests_template,
> > >      > ++        input: 'template.test.in <http://template.test.in>',
> > >      >  +        output: test_name + '.test',
> > >      >  +        install_dir: installed_tests_metadir,
> > >      >  +        configuration: test_conf
> > >      > @@ -105,6 +95,15 @@ index b2636714b..a697a7b06 100644
> > >      >       test(test_name, exe, env: env, timeout : 3 * 60)
> > >      >     endif
> > >      >   endforeach
> > >      > +diff --git a/subprojects/gstreamer/tests/check/
> template.test.in
> > >     <http://template.test.in>
> > >     b/subprojects/gstreamer/tests/check/template.test.in
> > >     <http://template.test.in>
> > >      > +new file mode 100644
> > >      > +index 0000000000..f701627f87
> > >      > +--- /dev/null
> > >      > ++++ b/subprojects/gstreamer/tests/check/template.test.in
> > >     <http://template.test.in>
> > >      > +@@ -0,0 +1,3 @@
> > >      > ++[Test]
> > >      > ++Type=3Dsession
> > >      > ++Exec=3D@installed_tests_dir@/@program@
> > >      >  --
> > >      > -2.31.1
> > >      > +2.33.1
> > >      >
> > >      > diff --git
> > >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-u=
se-too-strict-timeout-for-validati.patch
> > >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-u=
se-too-strict-timeout-for-validati.patch
> > >      > deleted file mode 100644
> > >      > index e0e64e2c7a..0000000000
> > >      > ---
> > >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-u=
se-too-strict-timeout-for-validati.patch
> > >      > +++ /dev/null
> > >      > @@ -1,32 +0,0 @@
> > >      > -From 1db36347d05d88835519368442e9aa89c64091ad Mon Sep 17
> > >     00:00:00 2001
> > >      > -From: Seungha Yang <seungha@centricular.com
> > >     <mailto:seungha@centricular.com>>
> > >      > -Date: Tue, 15 Sep 2020 00:54:58 +0900
> > >      > -Subject: [PATCH] tests: seek: Don't use too strict timeout fo=
r
> > >     validation
> > >      > -
> > >      > -Expected segment-done message might not be seen within expect=
ed
> > >      > -time if system is not powerful enough.
> > >      > -
> > >      > -Part-of:
> > >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/625
> > >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/625>>
> > >      > -
> > >      > -Upstream-Status: Backport
> > >     [
> https://cgit.freedesktop.org/gstreamer/gstreamer/commit?id=3Df44312ae5d83=
1438fcf8041162079c65321c588c
> > >     <
> https://cgit.freedesktop.org/gstreamer/gstreamer/commit?id=3Df44312ae5d83=
1438fcf8041162079c65321c588c
> >]
> > >      > -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com
> > >     <mailto:anuj.mittal@intel.com>>
> > >      > ----
> > >      > - tests/check/pipelines/seek.c | 2 +-
> > >      > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > >      > -
> > >      > -diff --git a/tests/check/pipelines/seek.c
> > >     b/tests/check/pipelines/seek.c
> > >      > -index 28bb8846d..5f7447bc5 100644
> > >      > ---- a/tests/check/pipelines/seek.c
> > >      > -+++ b/tests/check/pipelines/seek.c
> > >      > -@@ -521,7 +521,7 @@ GST_START_TEST (test_loopback_2)
> > >      > -
> > >      > -   GST_INFO ("wait for segment done message");
> > >      > -
> > >      > --  msg =3D gst_bus_timed_pop_filtered (bus, (GstClockTime) 2 =
*
> > >     GST_SECOND,
> > >      > -+  msg =3D gst_bus_timed_pop_filtered (bus, GST_CLOCK_TIME_NO=
NE,
> > >      > -       GST_MESSAGE_SEGMENT_DONE | GST_MESSAGE_ERROR);
> > >      > -   fail_unless (msg, "no message within the timed window");
> > >      > -   fail_unless_equals_string (GST_MESSAGE_TYPE_NAME (msg),
> > >     "segment-done");
> > >      > ---
> > >      > -2.29.2
> > >      > -
> > >      > diff --git
> > >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-dictio=
naries-for-environment.patch
> > >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictio=
naries-for-environment.patch
> > >      > similarity index 61%
> > >      > rename from
> > >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-dictiona=
ries-for-environment.patch
> > >      > rename to
> > >
>  meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictiona=
ries-for-environment.patch
> > >      > index 46813cec3d..10a6dcc619 100644
> > >      > ---
> > >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0006-tests-use-a-dictio=
naries-for-environment.patch
> > >      > +++
> > >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-use-a-dictio=
naries-for-environment.patch
> > >      > @@ -1,4 +1,4 @@
> > >      > -From e82dedec1803922656e92285fc1bb75b2cdc0aad Mon Sep 17
> > >     00:00:00 2001
> > >      > +From fe830f0f75f3b4b41e3dbef8d4cf6ee4103c9e06 Mon Sep 17
> > >     00:00:00 2001
> > >      >  From: Jose Quaresma <quaresma.jose@gmail.com
> > >     <mailto:quaresma.jose@gmail.com>>
> > >      >  Date: Sat, 24 Apr 2021 10:34:47 +0100
> > >      >  Subject: [PATCH 3/4] tests: use a dictionaries for environmen=
t
> > >      > @@ -10,29 +10,31 @@ Upstream-Status: Submitted
> > >     [https://gitlab.freedesktop.org/gstreamer/gstreamer/-
> > >     <https://gitlab.freedesktop.org/gstreamer/gstreamer/->
> > >      >
> > >      >  Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> > >     <mailto:quaresma.jose@gmail.com>>
> > >      >  ---
> > >      > - tests/check/meson.build | 19 +++++++++++--------
> > >      > - 1 file changed, 11 insertions(+), 8 deletions(-)
> > >      > + subprojects/gstreamer/tests/check/meson.build | 21
> > >     ++++++++++++-------
> > >      > + 1 file changed, 13 insertions(+), 8 deletions(-)
> > >      >
> > >      > -diff --git a/tests/check/meson.build b/tests/check/meson.buil=
d
> > >      > -index a697a7b06..f64524904 100644
> > >      > ---- a/tests/check/meson.build
> > >      > -+++ b/tests/check/meson.build
> > >      > -@@ -161,14 +161,17 @@ foreach t : core_tests
> > >      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
> > >     b/subprojects/gstreamer/tests/check/meson.build
> > >      > +index 00a138a568..48ec2532f8 100644
> > >      > +--- a/subprojects/gstreamer/tests/check/meson.build
> > >      > ++++ b/subprojects/gstreamer/tests/check/meson.build
> > >      > +@@ -161,14 +161,19 @@ foreach t : core_tests
> > >      >         install: installed_tests_enabled,
> > >      >       )
> > >      >
> > >      >  -    env =3D environment()
> > >      > --    env.set('GST_PLUGIN_PATH_1_0', meson.build_root())
> > >      > +-    env.set('GST_PLUGIN_PATH_1_0', meson.project_build_root(=
))
> > >      >  -    env.set('GST_PLUGIN_SYSTEM_PATH_1_0', '')
> > >      >  -    env.set('GST_STATE_IGNORE_ELEMENTS', '')
> > >      >  -    env.set('CK_DEFAULT_TIMEOUT', '20')
> > >      >  -    env.set('GST_REGISTRY',
> > >     '@0@/@1@.registry'.format(meson.current_build_dir(), test_name))
> > >      >  -    env.set('GST_PLUGIN_SCANNER_1_0', gst_scanner_dir +
> > >     '/gst-plugin-scanner')
> > >      >  -    env.set('GST_PLUGIN_LOADING_WHITELIST', 'gstreamer')
> > >      > -+    # environment() can't be passed to configure_file and it
> is
> > >     needed for installed_tests
> > >      > -+    # use a dictionary as this is simplest solution to insta=
ll
> > >     the environment
> > >      > ++    # meson environment object can't be passed to
> > >     configure_file and
> > >      > ++    # installed tests uses configure_file to install the
> > >     environment.
> > >      > ++    # use a dictionary as this is the simplest solution
> > >      > ++    # to install the environment.
> > >      >  +    env =3D {
> > >      > -+      'GST_PLUGIN_PATH_1_0': meson.build_root(),
> > >      > ++      'GST_PLUGIN_PATH_1_0': meson.project_build_root(),
> > >      >  +      'GST_PLUGIN_SYSTEM_PATH_1_0': '',
> > >      >  +      'GST_STATE_IGNORE_ELEMENTS': '',
> > >      >  +      'CK_DEFAULT_TIMEOUT': '20',
> > >      > @@ -44,5 +46,5 @@ index a697a7b06..f64524904 100644
> > >      >       if installed_tests_enabled
> > >      >         test_conf =3D configuration_data()
> > >      >  --
> > >      > -2.31.1
> > >      > +2.33.1
> > >      >
> > >      > diff --git
> > >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-s=
cript-to-run-the-installed_tests.patch
> > >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-s=
cript-to-run-the-installed_tests.patch
> > >      > new file mode 100644
> > >      > index 0000000000..efa004f8ce
> > >      > --- /dev/null
> > >      > +++
> > >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-tests-add-helper-s=
cript-to-run-the-installed_tests.patch
> > >      > @@ -0,0 +1,74 @@
> > >      > +From 4dcbabebca2ad6f1fdd59ee35a858082e87db7b6 Mon Sep 17
> > >     00:00:00 2001
> > >      > +From: Jose Quaresma <quaresma.jose@gmail.com
> > >     <mailto:quaresma.jose@gmail.com>>
> > >      > +Date: Sun, 2 May 2021 01:58:01 +0100
> > >      > +Subject: [PATCH 4/4] tests: add helper script to run the
> > >     installed_tests
> > >      > +
> > >      > +- this is a bash script that will run the installed_tests
> > >      > +with some of the environment variables used in the meson
> > >      > +testing framework.
> > >      > +
> > >      > +Upstream-Status: Submitted
> > >     [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789
> > >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789>]
> > >      > +
> > >      > +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> > >     <mailto:quaresma.jose@gmail.com>>
> > >      > +---
> > >      > + subprojects/gstreamer/tests/check/meson.build   | 17
> > >     +++++++++++++++++
> > >      > + .../gstreamer/tests/check/template.sh.in
> > >     <http://template.sh.in>        |  9 +++++++++
> > >      > + .../gstreamer/tests/check/template.test.in
> > >     <http://template.test.in>      |  2 +-
> > >      > + 3 files changed, 27 insertions(+), 1 deletion(-)
> > >      > + create mode 100755
> > >     subprojects/gstreamer/tests/check/template.sh.in <
> http://template.sh.in>
> > >      > +
> > >      > +diff --git a/subprojects/gstreamer/tests/check/meson.build
> > >     b/subprojects/gstreamer/tests/check/meson.build
> > >      > +index 48ec2532f8..7dc4990d4e 100644
> > >      > +--- a/subprojects/gstreamer/tests/check/meson.build
> > >      > ++++ b/subprojects/gstreamer/tests/check/meson.build
> > >      > +@@ -185,6 +185,23 @@ foreach t : core_tests
> > >      > +         install_dir: installed_tests_metadir,
> > >      > +         configuration: test_conf
> > >      > +       )
> > >      > ++
> > >      > ++      # All the tests will be deployed on the target machine
> and
> > >      > ++      # we use the home folder ~ for the registry which will
> > >     then expand at runtime.
> > >      > ++      # Using the /tmp/gstreamer-1.0/@0@.registry can be
> > >     problematic as it mostly
> > >      > ++      # is mounted using tmpfs and if the machine crash from
> > >     some reason we can lost the registry
> > >      > ++      # that is useful for debug propose of the tests itself=
.
> > >      > ++      env +=3D {'GST_REGISTRY':
> > >     '~/.cache/gstreamer-1.0/@0@.registry'.format(test_name)}
> > >      > ++
> > >      > ++      # Set the full path for the test it self.
> > >      > ++      env +=3D {'TEST': '@0@/@1@'.format(join_paths(prefix,
> > >     installed_tests_execdir), test_name)}
> > >      > ++
> > >      > ++      configure_file(
> > >      > ++        input : 'template.sh.in <http://template.sh.in>',
> > >      > ++        output: test_name + '.sh',
> > >      > ++        install_dir: installed_tests_execdir,
> > >      > ++        configuration : env,
> > >      > ++      )
> > >      > +     endif
> > >      > +
> > >      > +     test(test_name, exe, env: env, timeout : 3 * 60)
> > >      > +diff --git a/subprojects/gstreamer/tests/check/template.sh.in
> > >     <http://template.sh.in>
> > >     b/subprojects/gstreamer/tests/check/template.sh.in
> > >     <http://template.sh.in>
> > >      > +new file mode 100755
> > >      > +index 0000000000..cf7d31b0ea
> > >      > +--- /dev/null
> > >      > ++++ b/subprojects/gstreamer/tests/check/template.sh.in
> > >     <http://template.sh.in>
> > >      > +@@ -0,0 +1,9 @@
> > >      > ++#!/bin/sh
> > >      > ++
> > >      > ++set -ax
> > >      > ++
> > >      > ++CK_DEFAULT_TIMEOUT=3D"@CK_DEFAULT_TIMEOUT@"
> > >      > ++GST_PLUGIN_LOADING_WHITELIST=3D"@GST_PLUGIN_LOADING_WHITELIS=
T@"
> > >      > ++GST_REGISTRY=3D@GST_REGISTRY@
> > >      > ++GST_STATE_IGNORE_ELEMENTS=3D"@GST_STATE_IGNORE_ELEMENTS@"
> > >      > ++exec @TEST@
> > >      > +diff --git a/subprojects/gstreamer/tests/check/
> template.test.in
> > >     <http://template.test.in>
> > >     b/subprojects/gstreamer/tests/check/template.test.in
> > >     <http://template.test.in>
> > >      > +index f701627f87..b74ef6ad73 100644
> > >      > +--- a/subprojects/gstreamer/tests/check/template.test.in
> > >     <http://template.test.in>
> > >      > ++++ b/subprojects/gstreamer/tests/check/template.test.in
> > >     <http://template.test.in>
> > >      > +@@ -1,3 +1,3 @@
> > >      > + [Test]
> > >      > + Type=3Dsession
> > >      > +-Exec=3D@installed_tests_dir@/@program@
> > >      > ++Exec=3D@installed_tests_dir@/@program@.sh
> > >      > +--
> > >      > +2.33.1
> > >      > +
> > >      > diff --git
> > >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-=
environment-for-installed_tests.patch
> > >
>  b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-=
environment-for-installed_tests.patch
> > >      > deleted file mode 100644
> > >      > index eabe7bcbe1..0000000000
> > >      > ---
> > >
>  a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-tests-install-the-=
environment-for-installed_tests.patch
> > >      > +++ /dev/null
> > >      > @@ -1,58 +0,0 @@
> > >      > -From 57d2965e979f886e03eecd7e351bf01812053971 Mon Sep 17
> > >     00:00:00 2001
> > >      > -From: Jose Quaresma <quaresma.jose@gmail.com
> > >     <mailto:quaresma.jose@gmail.com>>
> > >      > -Date: Sun, 2 May 2021 01:58:01 +0100
> > >      > -Subject: [PATCH 4/4] tests: install the environment for
> > >     installed_tests
> > >      > -
> > >      > -- adapt the test environment for installed_tests
> > >      > -- install the test environment for installed_tests
> > >      > -- run the tests using the installed environment
> > >      > -
> > >      > -Upstream-Status: Submitted
> > >     [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789
> > >     <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789>]
> > >      > -
> > >      > -Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com
> > >     <mailto:quaresma.jose@gmail.com>>
> > >      > ----
> > >      > - template.test.in <http://template.test.in>        |  2 +-
> > >      > - tests/check/meson.build | 18 ++++++++++++++++++
> > >      > - 2 files changed, 19 insertions(+), 1 deletion(-)
> > >      > -
> > >      > -diff --git a/template.test.in <http://template.test.in>
> > >     b/template.test.in <http://template.test.in>
> > >      > -index f701627f8..9a3fbdd09 100644
> > >      > ---- a/template.test.in <http://template.test.in>
> > >      > -+++ b/template.test.in <http://template.test.in>
> > >      > -@@ -1,3 +1,3 @@
> > >      > - [Test]
> > >      > - Type=3Dsession
> > >      > --Exec=3D@installed_tests_dir@/@program@
> > >      > -+Exec=3Dsh -c 'set -aex && source
> > >     @installed_tests_dir@/@program@.env && exec
> > >     @installed_tests_dir@/@program@'
> > >      > -diff --git a/tests/check/meson.build b/tests/check/meson.buil=
d
> > >      > -index f64524904..a67e0f8dd 100644
> > >      > ---- a/tests/check/meson.build
> > >      > -+++ b/tests/check/meson.build
> > >      > -@@ -183,6 +183,24 @@ foreach t : core_tests
> > >      > -         install_dir: installed_tests_metadir,
> > >      > -         configuration: test_conf
> > >      > -       )
> > >      > -+
> > >      > -+      env +=3D {'GST_REGISTRY':
> > >     '~/.cache/gstreamer-1.0/@0@.registry'.format(test_name)}
> > >      > -+      configure_file(
> > >      > -+        output: test_name + '.env',
> > >      > -+        install_dir: installed_tests_execdir,
> > >      > -+        configuration : env,
> > >      > -+      )
> > >      > -+      # helper to convert a meson environment dictionay obje=
ct
> > >     exported with configure_file
> > >      > -+      # this also remove not needed variables for the
> installed
> > >     tests
> > >      > -+      meson.add_postconf_script('sed', '-i',
> > >      > -+        '-e', '/^#define/!d',
> > >      > -+        '-e', 's/^#define //g',
> > >      > -+        '-e', '/^GST_PLUGIN_PATH_1_0/d',
> > >      > -+        '-e', '/^GST_PLUGIN_SYSTEM_PATH_1_0/d',
> > >      > -+        '-e', '/^GST_PLUGIN_SCANNER_1_0/d',
> > >      > -+        '-e', 's/ /=3D/',
> > >      > -+        join_paths(meson.current_build_dir(), test_name +
> '.env')
> > >      > -+      )
> > >      > -     endif
> > >      > -
> > >      > -     test(test_name, exe, env: env, timeout : 3 * 60)
> > >      > ---
> > >      > -2.31.1
> > >      > -
> > >      > diff --git
> > >     a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
> > >     <http://gstreamer1.0_1.18.5.bb>
> > >     b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
> > >     <http://gstreamer1.0_1.20.0.bb>
> > >      > similarity index 76%
> > >      > rename from
> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
> > >     <http://gstreamer1.0_1.18.5.bb>
> > >      > rename to
> > >     meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
> > >     <http://gstreamer1.0_1.20.0.bb>
> > >      > index 0d82dd338c..243f99fee9 100644
> > >      > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
> > >     <http://gstreamer1.0_1.18.5.bb>
> > >      > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
> > >     <http://gstreamer1.0_1.20.0.bb>
> > >      > @@ -10,22 +10,19 @@ DEPENDS =3D "glib-2.0 glib-2.0-native libx=
ml2
> > >     bison-native flex-native"
> > >      >
> > >      >  inherit meson pkgconfig gettext upstream-version-is-even
> > >     gobject-introspection ptest-gnome
> > >      >
> > >      > -LIC_FILES_CHKSUM =3D
> > >     "file://COPYING;md5=3D6762ed442b3822387a51c92d928ead0d \
> > >      > +LIC_FILES_CHKSUM =3D
> > >     "file://COPYING;md5=3D69333daa044cb77e486cc36129f7a770 \
> > >      >
> > >
>  file://gst/gst.h;beginline=3D1;endline=3D21;md5=3De059138481205ee2c6fc1c=
079c016d0d"
> > >      >
> > >      >  S =3D "${WORKDIR}/gstreamer-${PV}"
> > >      >
> > >      >  SRC_URI =3D
> > >     "
> https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz
> > >     <
> https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$%7BPV%7D.tar.x=
z
> >
> > >     \
> > >      >             file://run-ptest \
> > >      > -
> > >
>  file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
> > >      > -           file://0002-Remove-unused-valgrind-detection.patch=
 \
> > >      > -
> > >
>  file://0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
> > >      > -
> > >       file://0004-tests-respect-the-idententaion-used-in-meson.patch =
\
> > >      > -
> > >       file://0005-tests-add-support-for-install-the-tests.patch \
> > >      > -
> > >       file://0006-tests-use-a-dictionaries-for-environment.patch \
> > >      > -
> > >
>  file://0007-tests-install-the-environment-for-installed_tests.patch \
> > >      > +
> > >
>  file://0001-tests-respect-the-idententaion-used-in-meson.patch;stripleve=
l=3D3
> \
> > >      > +
> > >
>  file://0002-tests-add-support-for-install-the-tests.patch;striplevel=3D3=
 \
> > >      > +
> > >
>  file://0003-tests-use-a-dictionaries-for-environment.patch;striplevel=3D=
3 \
> > >      > +
> > >
>  file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;str=
iplevel=3D3
> \
> > >      >             "
> > >      > -SRC_URI[sha256sum] =3D
> > >     "55862232a63459bbf56abebde3085ca9aec211b478e891dacea4d6df8cafe80a=
"
> > >      > +SRC_URI[sha256sum] =3D
> > >     "edf4bffff85591d4fff7b21bb9ed7f0feabc123ac4a4eff29e73cbce454f9db7=
"
> > >      >
> > >      >  PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1=
',
> > >     'tests', '', d)} \
> > >      >                     check \
> > >      > @@ -36,7 +33,7 @@ PACKAGECONFIG[debug] =3D
> > >     "-Dgst_debug=3Dtrue,-Dgst_debug=3Dfalse"
> > >      >  PACKAGECONFIG[tracer-hooks] =3D
> > >     "-Dtracer_hooks=3Dtrue,-Dtracer_hooks=3Dfalse"
> > >      >  PACKAGECONFIG[coretracers] =3D
> > >     "-Dcoretracers=3Denabled,-Dcoretracers=3Ddisabled"
> > >      >  PACKAGECONFIG[check] =3D "-Dcheck=3Denabled,-Dcheck=3Ddisable=
d"
> > >      > -PACKAGECONFIG[tests] =3D "-Dtests=3Denabled
> > >     -Dinstalled-tests=3Dtrue,-Dtests=3Ddisabled -Dinstalled-tests=3Df=
alse"
> > >      > +PACKAGECONFIG[tests] =3D "-Dtests=3Denabled
> > >     -Dinstalled_tests=3Dtrue,-Dtests=3Ddisabled -Dinstalled_tests=3Df=
alse"
> > >      >  PACKAGECONFIG[unwind] =3D
> > >     "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,libunwind"
> > >      >  PACKAGECONFIG[dw] =3D "-Dlibdw=3Denabled,-Dlibdw=3Ddisabled,e=
lfutils"
> > >      >  PACKAGECONFIG[bash-completion] =3D
> > >
>  "-Dbash-completion=3Denabled,-Dbash-completion=3Ddisabled,bash-completio=
n"
> > >      > --
> > >      > 2.35.1
> > >      >
> > >      >
> > >      > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >      > Links: You receive all messages sent to this group.
> > >      > View/Reply Online (#161427):
> > >     https://lists.openembedded.org/g/openembedded-core/message/161427
> > >     <https://lists.openembedded.org/g/openembedded-core/message/16142=
7
> >
> > >      > Mute This Topic:
> > >     https://lists.openembedded.org/mt/88962313/1686489
> > >     <https://lists.openembedded.org/mt/88962313/1686489>
> > >      > Group Owner: openembedded-core+owner@lists.openembedded.org
> > >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> > >      > Unsubscribe:
> > >     https://lists.openembedded.org/g/openembedded-core/unsub
> > >     <https://lists.openembedded.org/g/openembedded-core/unsub>
> > >     [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>]
> > >      > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >      >
> > >
> > >
> > >
> > > --
> > > Best regards,
> > >
> > > Jos=C3=A9 Quaresma
> >
> > --
> > DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> > HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> > Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: ch@denx.de
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000833ddc05d82b2e99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu no dia q=
uarta, 9/02/2022 =C3=A0(s) 10:34:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Yes, it seems to be sporadic. Here&#39;s a sample fail:<b=
r>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/81/build=
s/3083" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/81/builds/3083</a><br>
<a href=3D"https://autobuilder.yocto.io/pub/non-release/20220208-14/testres=
ults/qemux86-64-ptest/gstreamer1.0.log" rel=3D"noreferrer" target=3D"_blank=
">https://autobuilder.yocto.io/pub/non-release/20220208-14/testresults/qemu=
x86-64-ptest/gstreamer1.0.log</a></blockquote><div><br></div><div><br></div=
><div>I ask for help upstream but I will try to replicate this with GST_DEB=
UG enabled.</div><div>Which is the best option to send a patch not for merg=
e but only to run on the autobuilder to generate some logs?<br></div><div><=
br></div><div><a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer=
/-/issues/778">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/=
778</a><br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><br>
<br>
Alex<br>
<br>
On Wed, 9 Feb 2022 at 10:30, Claudius Heine &lt;<a href=3D"mailto:ch@denx.d=
e" target=3D"_blank">ch@denx.de</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Jose<br>
&gt;<br>
&gt; On 2022-02-09 10:15, Jose Quaresma wrote:<br>
&gt; &gt; Hi Alexander,<br>
&gt; &gt;<br>
&gt; &gt; Can you please clarify in what target arch is this happening and =
I can<br>
&gt; &gt; try to replicate it with qemu?<br>
&gt;<br>
&gt; I think we are hitting:<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues=
/778" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/g=
streamer/gstreamer/-/issues/778</a><br>
&gt;<br>
&gt; This testcase seems to be flaky and IIUC upstream marked it as such in=
<br>
&gt; their test infrastructure.<br>
&gt;<br>
&gt; In my patchset, I added a patch to disable that testcase.<br>
&gt;<br>
&gt; regards,<br>
&gt; Claudius<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; It works on my side on qemux86-64.<br>
&gt; &gt;<br>
&gt; &gt; root@qemux86-64:~# /usr/libexec/installed-tests/gstreamer/gst_gst=
bin.sh<br>
&gt; &gt; + CK_DEFAULT_TIMEOUT=3D20<br>
&gt; &gt; + GST_PLUGIN_LOADING_WHITELIST=3Dgstreamer<br>
&gt; &gt; + GST_REGISTRY=3D/home/root/.cache/gstreamer-1.0/gst_gstbin.regis=
try<br>
&gt; &gt; + GST_STATE_IGNORE_ELEMENTS=3D<br>
&gt; &gt; + exec /usr/libexec/installed-tests/gstreamer/gst_gstbin<br>
&gt; &gt; Running suite(s): GstBin<br>
&gt; &gt; 100%: Checks: 26, Failures: 0, Errors: 0<br>
&gt; &gt; Check suite gst_bin ran in 6.239s (tests failed: 0)<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" t=
arget=3D"_blank">alex.kanavin@gmail.com</a><br>
&gt; &gt; &lt;mailto:<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_b=
lank">alex.kanavin@gmail.com</a>&gt;&gt; escreveu no dia ter=C3=A7a, 8/02/2=
022 =C3=A0(s)<br>
&gt; &gt; 22:01:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Unfortunately this patchset (which is now in m=
aster) does not address<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0the ptest fail. Please resolve this as soon as=
 possible.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0+ exec /usr/libexec/installed-tests/gstreamer/=
gst_gstbin<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Running suite(s): GstBin<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Executing: gstreamer/gst_gstbin.test<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Executing: gstreamer/gst_gstbin.test<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0....<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Executing: gstreamer/gst_gstbin.test<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Executing: gstreamer/gst_gstbin.test<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Test timed out after 300 seconds<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0FAIL: gstreamer/gst_gstbin.test (Child process=
 killed by signal 9)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Alex<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0On Mon, 7 Feb 2022 at 02:08, Jose Quaresma &lt=
;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose=
@gmail.com</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - License update:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0The code actually is LGPLv2.=
1 but the COPYING file is wrong.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://gitlab.freedesktop.org/gstr=
eamer/gstreamer/-/commit/d157b23fb0ce175b167611a4cb019599d9017042" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/gstre=
amer/-/commit/d157b23fb0ce175b167611a4cb019599d9017042</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/d157b23fb0ce175b167611a4cb019599d9017042" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/d157b23fb0ce175b167611a4cb019599d9017042</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - Drop backported patches<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A00001-gst-gstpluginloader.c-w=
hen-env-var-is-set-do-not-fal.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A00002-Remove-unused-valgrind-=
detection.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A00003-tests-seek-Don-t-use-to=
o-strict-timeout-for-validati.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - Update submitted patches<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A00001-tests-respect-the-ident=
entaion-used-in-meson.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A00002-tests-add-support-for-i=
nstall-the-tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A00003-tests-use-a-dictionarie=
s-for-environment.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A00004-tests-add-helper-script=
-to-run-the-installed_tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Jose Quaresma &lt;<a href=
=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.c=
om</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...der.c-when-env-var-is-set-do-no=
t-fal.patch |=C2=A0 69 -----------<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...pect-the-idententaion-used-in-m=
eson.patch} |=C2=A0 14 +--<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...002-Remove-unused-valgrind-dete=
ction.patch | 112<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0------------------<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...s-add-support-for-install-the-t=
ests.patch} |=C2=A0 67 ++++++-----<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...-use-too-strict-timeout-for-val=
idati.patch |=C2=A0 32 -----<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...-use-a-dictionaries-for-environ=
ment.patch} |=C2=A0 28 +++--<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...er-script-to-run-the-installed_=
tests.patch |=C2=A0 74 ++++++++++++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...-the-environment-for-installed_=
tests.patch |=C2=A0 58 ---------<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ...<a href=3D"http://er1.0_1.18.5.=
bb" rel=3D"noreferrer" target=3D"_blank">er1.0_1.18.5.bb</a> &lt;<a href=3D=
"http://er1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">http://er1.0_=
1.18.5.bb</a>&gt; =3D&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://gstreamer1.0_1.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.0.bb</a> &lt;<a href=3D=
"http://gstreamer1.0_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">http:/=
/gstreamer1.0_1.20.0.bb</a>&gt;} |=C2=A0 17 ++-<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 9 files changed, 136 insertions(+)=
, 335 deletions(-)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 delete mode 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0=
/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 rename<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0=
/{0004-tests-respect-the-idententaion-used-in-meson.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0=3D&gt; 0001-tests-respect-the-idententaion-us=
ed-in-meson.patch} (71%)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 delete mode 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0=
/0002-Remove-unused-valgrind-detection.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 rename<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0=
/{0005-tests-add-support-for-install-the-tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0=3D&gt; 0002-tests-add-support-for-install-the=
-tests.patch} (65%)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 delete mode 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0=
/0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 rename<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0=
/{0006-tests-use-a-dictionaries-for-environment.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0=3D&gt; 0003-tests-use-a-dictionaries-for-envi=
ronment.patch} (61%)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 create mode 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0=
/0004-tests-add-helper-script-to-run-the-installed_tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 delete mode 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0=
/0007-tests-install-the-environment-for-installed_tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 rename meta/recipes-multimedia/gst=
reamer/{<a href=3D"http://gstreamer1.0_1.18.5.bb" rel=3D"noreferrer" target=
=3D"_blank">gstreamer1.0_1.18.5.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.18.5.bb" =
rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.18.5.bb</a>&gt; =
=3D&gt; <a href=3D"http://gstreamer1.0_1.20.0.bb" rel=3D"noreferrer" target=
=3D"_blank">gstreamer1.0_1.20.0.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.20.0.bb" =
rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.20.0.bb</a>&gt;}=
 (76%)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; deleted file mode 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 23ebd5c600..0000000000<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ /dev/null<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,69 +0,0 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From fd8f49dba8c09d47425da80f5faab3bfa4=
a7c962 Mon Sep 17<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From: Jose Quaresma &lt;<a href=3D"mail=
to:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a><b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Date: Sat, 10 Oct 2020 19:09:03 +0000<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Subject: [PATCH 1/3] gstpluginloader: w=
hen env var is set do not<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0fall through<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - to system plugin scanner<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -If we set a custom GST_PLUGIN_SCANNER e=
nv var, then we probably<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0want to use that and only that.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Falling through to the one installed on=
 the system is<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0problamatic in cross-compilation<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -environemnts, regardless of whether one=
 pointed to by the env<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0var succeeded or failed.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -taken from:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-<a href=3D"http://cgit.openembedded.org/opene=
mbedded-core/commit/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gst=
-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch?id=3D0db7ba34ca41b1=
07042306d13a6f0162885c123b" rel=3D"noreferrer" target=3D"_blank">http://cgi=
t.openembedded.org/openembedded-core/commit/meta/recipes-multimedia/gstream=
er/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.p=
atch?id=3D0db7ba34ca41b107042306d13a6f0162885c123b</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://cgit.openembedded.org/op=
enembedded-core/commit/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-=
gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch?id=3D0db7ba34ca4=
1b107042306d13a6f0162885c123b" rel=3D"noreferrer" target=3D"_blank">http://=
cgit.openembedded.org/openembedded-core/commit/meta/recipes-multimedia/gstr=
eamer/gstreamer1.0/0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fa=
l.patch?id=3D0db7ba34ca41b107042306d13a6f0162885c123b</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Part-of:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/merge_requests/669" rel=3D"noreferrer" target=3D"_bla=
nk">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669=
</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/merge_requests/669" rel=3D"noreferrer" target=3D"_bla=
nk">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/669=
</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Upstream-Status: Backport<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://gitlab.freedesktop.org/gst=
reamer/gstreamer/-/commit/9f958058697e6fbf5bde325228034572331d1a3a" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/9f958058697e6fbf5bde325228034572331d1a3a</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/9f958058697e6fbf5bde325228034572331d1a3a" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/9f958058697e6fbf5bde325228034572331d1a3a</a>&gt;]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Signed-off-by: Jose Quaresma &lt;<a hre=
f=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.=
com</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ----<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - gst/gstpluginloader.c | 15 +++++++----=
----<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - 1 file changed, 7 insertions(+), 8 del=
etions(-)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/gst/gstpluginloader.c b/gs=
t/gstpluginloader.c<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index d1e404d98..c626bf263 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/gst/gstpluginloader.c<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/gst/gstpluginloader.c<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -464,20 +464,19 @@ gst_plugin_loader=
_spawn (GstPluginLoader *<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0loader)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0if (loader-&gt;child_runni=
ng)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0return TRUE;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 /* Find the gst-plugin-scanner:=
 first try the env-var if it<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0is set,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0* otherwise use the insta=
lled version */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 /* Find the gst-plugin-scanner =
*/<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0env =3D g_getenv (&quot;GS=
T_PLUGIN_SCANNER_1_0&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0if (env =3D=3D NULL)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0env =3D g_getenv (&=
quot;GST_PLUGIN_SCANNER&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0if (env !=3D NULL &amp;&am=
p; *env !=3D &#39;\0&#39;) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 /* use the env-var if it=
 is set */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0GST_LOG (&quot;Tryi=
ng GST_PLUGIN_SCANNER env var: %s&quot;, env);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0helper_bin =3D g_st=
rdup (env);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0res =3D gst_plugin_=
loader_try_helper (loader, helper_bin);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0g_free (helper_bin)=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 if (!res) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 } else {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 /* use the installed ver=
sion */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0GST_LOG (&quot;Tryi=
ng installed plugin scanner&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - #ifdef G_OS_WIN32<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -497,10 +496,10 @@ gst_plugin_loader=
_spawn (GstPluginLoader *<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0loader)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - #endif<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0res =3D gst_plugin_=
loader_try_helper (loader, helper_bin);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0g_free (helper_bin)=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 if (!res) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 =C2=A0 GST_INFO (&quot;N=
o gst-plugin-scanner available, or not working&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 if (!res) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 GST_INFO (&quot;No gst-p=
lugin-scanner available, or not working&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0return loader-&gt;child_ru=
nning;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -2.29.2<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0004-tests-respect-the-idententaion-used-in-meson.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0001-tests-respect-the-idententaion-used-in-meson.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; similarity index 71%<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename from<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0=
/0004-tests-respect-the-idententaion-used-in-meson.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0=
/0001-tests-respect-the-idententaion-used-in-meson.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 6f571a12d8..312c04fbfd 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0004-tests-respect-the-idententaion-used-in-meson.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0001-tests-respect-the-idententaion-used-in-meson.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From 122e5ac3dd16a461b6ae595605490c8f5d=
1c3a9d Mon Sep 17<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +From 1eb77a4ea5a3967c688d8f1192f99c605b=
adc7e2 Mon Sep 17<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 From: Jose Quaresma &lt;<a href=3D=
"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com<=
/a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Date: Sun, 11 Apr 2021 19:48:13 +0=
100<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Subject: [PATCH 1/4] tests: respec=
t the idententaion used in meson<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -7,13 +7,13 @@ Upstream-Status: Submi=
tted<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://gitlab.freedesktop.org/gst=
reamer/gstreamer/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.fre=
edesktop.org/gstreamer/gstreamer/-</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
freedesktop.org/gstreamer/gstreamer/-</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Signed-off-by: Jose Quaresma &lt;<=
a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@g=
mail.com</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - tests/check/meson.build | 10 +++++----=
-<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + subprojects/gstreamer/tests/check/meso=
n.build | 10 +++++-----<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A01 file changed, 5 insertions=
(+), 5 deletions(-)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/tests/check/meson.build b/=
tests/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index a617cf159..b2636714b 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/tests/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/tests/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/test=
s/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/tests/check/meson.buil=
d<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index 9c4228b6e4..506606684d 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- a/subprojects/gstreamer/tests/check=
/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/tests/check=
/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 @@ -146,11 +146,11 @@ foreach t : =
core_tests<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0if not skip_test<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -32,5 +32,5 @@ index a617cf159..b2636=
714b 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0env =3D enviro=
nment()<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 --<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -2.31.1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +2.33.1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0002-Remove-unused-valgrind-detection.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0002-Remove-unused-valgrind-detection.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; deleted file mode 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 5121044734..0000000000<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0002-Remove-unused-valgrind-detection.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ /dev/null<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,112 +0,0 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From e275ba2bd854ac15a4b65a8f07d9f04202=
1950da Mon Sep 17<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From: =3D?UTF-8?q?Tim-Philipp=3D20M=3DC=
3=3DBCller?=3D &lt;<a href=3D"mailto:tim@centricular.com" target=3D"_blank"=
>tim@centricular.com</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:tim@centricular.c=
om" target=3D"_blank">tim@centricular.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Date: Fri, 14 Aug 2020 16:38:26 +0100<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Subject: [PATCH 2/3] Remove unused valg=
rind detection<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Having this just to log a debug message=
 in case we&#39;re<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -running inside valgrind doesn&#39;t see=
m very useful, and<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -the code that used to use this no longe=
r exists it seems.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Part-of:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/merge_requests/595" rel=3D"noreferrer" target=3D"_bla=
nk">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595=
</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/merge_requests/595" rel=3D"noreferrer" target=3D"_bla=
nk">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/595=
</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Upstream-Status: Backport [a2cbf75523cd=
f8a4df1baa7007d86ef455972245]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Signed-off-by: Jose Quaresma &lt;<a hre=
f=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.=
com</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ----<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - gst/gst_private.h |=C2=A0 2 --<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - gst/gstinfo.c=C2=A0 =C2=A0 =C2=A0| 39 =
---------------------------------------<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 1 -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - 3 files changed, 42 deletions(-)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/gst/gst_private.h b/gst/gs=
t_private.h<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index eefd044..8252ede 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/gst/gst_private.h<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/gst/gst_private.h<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -116,8 +116,6 @@ G_GNUC_INTERNAL=C2=
=A0 gboolean<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0_priv_plugin_deps_env_vars_changed (GstPlugin =
* plugin<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - G_GNUC_INTERNAL=C2=A0 gboolean _priv_p=
lugin_deps_files_changed<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0(GstPlugin * plugin);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --G_GNUC_INTERNAL=C2=A0 gboolean _priv_g=
st_in_valgrind (void);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - /* init functions called from gst_init=
(). */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - G_GNUC_INTERNAL=C2=A0 void=C2=A0 _priv=
_gst_quarks_initialize (void);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - G_GNUC_INTERNAL=C2=A0 void=C2=A0 _priv=
_gst_mini_object_initialize (void);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/gst/gstinfo.c b/gst/gstinf=
o.c<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index eea1a21..d3035d6 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/gst/gstinfo.c<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/gst/gstinfo.c<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -305,36 +305,6 @@ static gboolean pr=
etty_tags =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0PRETTY_TAGS_DEFAULT;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - static gint G_GNUC_MAY_ALIAS __default=
_level =3D GST_LEVEL_DEFAULT;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - static gint G_GNUC_MAY_ALIAS __use_col=
or =3D GST_DEBUG_COLOR_MODE_ON;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --/* FIXME: export this? */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --gboolean<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --_priv_gst_in_valgrind (void)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --{<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 static enum<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 GST_VG_UNCHECKED,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 GST_VG_NO_VALGRIND,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 GST_VG_INSIDE<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 in_valgrind =3D GST_VG_UNCHECKE=
D;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 if (in_valgrind =3D=3D GST_VG_U=
NCHECKED) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --#ifdef HAVE_VALGRIND_VALGRIND_H<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 if (RUNNING_ON_VALGRIND)=
 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 =C2=A0 GST_CAT_INFO (GST=
_CAT_GST_INIT, &quot;we&#39;re running inside<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0valgrind&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 =C2=A0 in_valgrind =3D G=
ST_VG_INSIDE;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 } else {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 =C2=A0 GST_CAT_LOG (GST_=
CAT_GST_INIT, &quot;not doing extra valgrind<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0stuff&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 =C2=A0 in_valgrind =3D G=
ST_VG_NO_VALGRIND;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --#else<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 in_valgrind =3D GST_VG_N=
O_VALGRIND;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --#endif<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 g_assert (in_valgrind =
=3D=3D GST_VG_NO_VALGRIND ||<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 in_valgrin=
d =3D=3D GST_VG_INSIDE);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 return (in_valgrind =3D=3D GST_=
VG_INSIDE);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - static gchar *<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - _replace_pattern_in_gst_debug_file_nam=
e (gchar * name, const<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0char *token,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0guint val)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -463,9 +433,6 @@ _priv_gst_debug_ini=
t (void)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0_priv_GST_CAT_PROTECTION =
=3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0_gst_debug_c=
ategory_new (&quot;GST_PROTECTION&quot;, 0, &quot;protection&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 /* print out the valgrind messa=
ge if we&#39;re in valgrind */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 _priv_gst_in_valgrind ();<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0env =3D g_getenv (&quot;GS=
T_DEBUG_OPTIONS&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0if (env !=3D NULL) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0if (strstr (env, &q=
uot;full_tags&quot;) || strstr (env, &quot;full-tags&quot;))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -2505,12 +2472,6 @@ gst_debug_constr=
uct_win_color (guint<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0colorinfo)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - }<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --gboolean<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --_priv_gst_in_valgrind (void)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --{<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 return FALSE;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - void<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - _gst_debug_dump_mem (GstDebugCategory =
* cat, const gchar * file,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0const gchar * func,=
 gint line, GObject * obj, const gchar *<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0msg,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/meson.build b/meson.build<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index 82a1728..42ae617 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -200,7 +200,6 @@ check_headers =3D [=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0&#39;sys/wait.h&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0&#39;ucontext.h&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0&#39;unistd.h&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 &#39;valgrind/valgrind.h&#39;,<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0&#39;sys/resource.h&#39;,<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0&#39;sys/uio.h&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - ]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -2.29.2<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0005-tests-add-support-for-install-the-tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0002-tests-add-support-for-install-the-tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; similarity index 65%<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename from<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0=
/0005-tests-add-support-for-install-the-tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0=
/0002-tests-add-support-for-install-the-tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index b77fb5797f..d18c19c397 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0005-tests-add-support-for-install-the-tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0002-tests-add-support-for-install-the-tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From c9e93c7a3e4d2773abef4f5e1464af24f3=
6700b3 Mon Sep 17<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +From 62f5bb7bfc2498219df7280e73480d8ed2=
378ce5 Mon Sep 17<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 From: Jose Quaresma &lt;<a href=3D=
"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com<=
/a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Date: Sun, 11 Apr 2021 19:48:13 +0=
100<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Subject: [PATCH 2/4] tests: add su=
pport for install the tests<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -11,54 +11,44 @@ Upstream-Status: Sub=
mitted<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://gitlab.freedesktop.org/gst=
reamer/gstreamer/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.fre=
edesktop.org/gstreamer/gstreamer/-</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
freedesktop.org/gstreamer/gstreamer/-</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Signed-off-by: Jose Quaresma &lt;<=
a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@g=
mail.com</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - meson_options.txt=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - <a href=3D"http://template.test.in" re=
l=3D"noreferrer" target=3D"_blank">template.test.in</a> &lt;<a href=3D"http=
://template.test.in" rel=3D"noreferrer" target=3D"_blank">http://template.t=
est.in</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - tests/check/meson.build | 22 +++++++++=
++++++++++++-<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - 4 files changed, 30 insertions(+), 1 d=
eletion(-)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - create mode 100644 <a href=3D"http://t=
emplate.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a> =
&lt;<a href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank=
">http://template.test.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + subprojects/gstreamer/meson.build=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + subprojects/gstreamer/meson_options.tx=
t=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + subprojects/gstreamer/tests/check/meso=
n.build | 22<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++-<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + .../gstreamer/tests/check/<a href=3D"h=
ttp://template.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.=
in</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D=
"noreferrer" target=3D"_blank">http://template.test.in</a>&gt;=C2=A0 =C2=A0=
 |=C2=A0 3 +++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + 4 files changed, 29 insertions(+), 1 d=
eletion(-)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + create mode 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0subprojects/gstreamer/tests/check/<a href=3D"h=
ttp://template.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.=
in</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D=
"noreferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/meson.build b/meson.build<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index c4e8774f5..1abf4eb26 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -562,6 +562,11 @@ if bashcomp_dep.fo=
und()<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/meso=
n.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index d20fe0040f..b595d8f990 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- a/subprojects/gstreamer/meson.build=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/meson.build=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +@@ -562,6 +562,10 @@ if bashcomp_dep.fo=
und()<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0endif<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0endif<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++installed_tests_enabled =3D get_option=
(&#39;installed_tests&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +installed_tests_metadir =3D join_=
paths(datadir,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&#39;installed-tests&#39;, meson.project_name(=
))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +installed_tests_execdir =3D join_=
paths(libexecdir,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&#39;installed-tests&#39;, meson.project_name(=
))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+installed_tests_enabled =3D get_option=
(&#39;installed-tests&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+installed_tests_template =3D files(&#3=
9;<a href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">=
template.test.in</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D=
"noreferrer" target=3D"_blank">http://template.test.in</a>&gt;&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0plugins_install_dir =3D join=
_paths(get_option(&#39;libdir&#39;),<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&#39;gstreamer-1.0&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0pkgconfig =3D import(&#39;pk=
gconfig&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/meson_options.txt b/meson_=
options.txt<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index c8cee3762..b5da40eaa 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/meson_options.txt<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/meson_options.txt<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/meso=
n_options.txt<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/meson_options.txt<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index 7363bdb7a1..a34ba37dad 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- a/subprojects/gstreamer/meson_optio=
ns.txt<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/meson_optio=
ns.txt<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 @@ -15,6 +15,7 @@ option(&#39;pois=
oning&#39;, type : &#39;boolean&#39;, value :<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0false, description : &#39;Enable poiso<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0option(&#39;memory-alignment=
&#39;, type: &#39;combo&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 choice=
s : [&#39;1&#39;, &#39;2&#39;, &#39;4&#39;, &#39;8&#39;, &#39;16&#39;, &#39=
;32&#39;, &#39;64&#39;, &#39;128&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&#39;256&#39;, &#39;512&#39;, &#39;1024&#39;, =
&#39;2048&#39;, &#39;4096&#39;, &#39;8192&#39;, &#39;malloc&#39;, &#39;page=
size&#39;],<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value:=
 &#39;malloc&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+option(&#39;installed-tests&#39;, type=
 : &#39;boolean&#39;, value : false,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0description : &#39;Enable installed tests&#39;=
)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++option(&#39;installed_tests&#39;, type=
 : &#39;boolean&#39;, value : false,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0description : &#39;Enable installed tests&#39;=
)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0# Feature options<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0option(&#39;check&#39;, type=
 : &#39;feature&#39;, value : &#39;auto&#39;, description :<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&#39;Build unit test libraries&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/<a href=3D"http://template=
.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a> &lt;<a =
href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">http:=
//template.test.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/<a href=3D"http://template.test.in" rel=3D"n=
oreferrer" target=3D"_blank">template.test.in</a> &lt;<a href=3D"http://tem=
plate.test.in" rel=3D"noreferrer" target=3D"_blank">http://template.test.in=
</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -new file mode 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index 000000000..f701627f8<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- /dev/null<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/<a href=3D"http://template.test.i=
n" rel=3D"noreferrer" target=3D"_blank">template.test.in</a> &lt;<a href=3D=
"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">http://templ=
ate.test.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -0,0 +1,3 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+[Test]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+Type=3Dsession<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+Exec=3D@installed_tests_dir@/@program@=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/tests/check/meson.build b/=
tests/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index b2636714b..a697a7b06 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/tests/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/tests/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/test=
s/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/tests/check/meson.buil=
d<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index 506606684d..00a138a568 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- a/subprojects/gstreamer/tests/check=
/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/tests/check=
/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 @@ -124,10 +124,16 @@ test_defines=
 =3D [<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&#39;-UG_DISABLE_ASSE=
RT&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&#39;-UG_DISABLE_CAST=
_CHECKS&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -95,7 +85,7 @@ index b2636714b..a697a=
7b06 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 test_conf.se=
t(&#39;installed_tests_dir&#39;, join_paths(prefix,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0installed_tests_execdir))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 test_conf.se=
t(&#39;program&#39;, test_name)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 configure_fi=
le(<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 input: ins=
talled_tests_template,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 input: &#3=
9;<a href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">=
template.test.in</a> &lt;<a href=3D"http://template.test.in" rel=3D"norefer=
rer" target=3D"_blank">http://template.test.in</a>&gt;&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 outpu=
t: test_name + &#39;.test&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 insta=
ll_dir: installed_tests_metadir,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 confi=
guration: test_conf<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -105,6 +95,15 @@ index b2636714b..a69=
7a7b06 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0test(test_name=
, exe, env: env, timeout : 3 * 60)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0endif<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0endforeach<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/test=
s/check/<a href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_b=
lank">template.test.in</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D=
"noreferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/tests/check/<a href=3D=
"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">template.tes=
t.in</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D=
"noreferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +new file mode 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index 0000000000..f701627f87<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- /dev/null<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/tests/check=
/<a href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">t=
emplate.test.in</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D=
"noreferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +@@ -0,0 +1,3 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++[Test]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++Type=3Dsession<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++Exec=3D@installed_tests_dir@/@program@=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 --<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -2.31.1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +2.33.1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; deleted file mode 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index e0e64e2c7a..0000000000<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0003-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ /dev/null<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,32 +0,0 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From 1db36347d05d88835519368442e9aa89c6=
4091ad Mon Sep 17<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From: Seungha Yang &lt;<a href=3D"mailt=
o:seungha@centricular.com" target=3D"_blank">seungha@centricular.com</a><br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:seungha@centricul=
ar.com" target=3D"_blank">seungha@centricular.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Date: Tue, 15 Sep 2020 00:54:58 +0900<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Subject: [PATCH] tests: seek: Don&#39;t=
 use too strict timeout for<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0validation<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Expected segment-done message might not=
 be seen within expected<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -time if system is not powerful enough.<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Part-of:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/merge_requests/625" rel=3D"noreferrer" target=3D"_bla=
nk">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/625=
</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/merge_requests/625" rel=3D"noreferrer" target=3D"_bla=
nk">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/625=
</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Upstream-Status: Backport<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://cgit.freedesktop.org/gstre=
amer/gstreamer/commit?id=3Df44312ae5d831438fcf8041162079c65321c588c" rel=3D=
"noreferrer" target=3D"_blank">https://cgit.freedesktop.org/gstreamer/gstre=
amer/commit?id=3Df44312ae5d831438fcf8041162079c65321c588c</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://cgit.freedesktop.org/gs=
treamer/gstreamer/commit?id=3Df44312ae5d831438fcf8041162079c65321c588c" rel=
=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org/gstreamer/gs=
treamer/commit?id=3Df44312ae5d831438fcf8041162079c65321c588c</a>&gt;]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Signed-off-by: Anuj Mittal &lt;<a href=
=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</=
a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:anuj.mittal@intel=
.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ----<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - tests/check/pipelines/seek.c | 2 +-<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - 1 file changed, 1 insertion(+), 1 dele=
tion(-)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/tests/check/pipelines/seek=
.c<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/tests/check/pipelines/seek.c<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index 28bb8846d..5f7447bc5 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/tests/check/pipelines/seek.c<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/tests/check/pipelines/seek.c<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -521,7 +521,7 @@ GST_START_TEST (tes=
t_loopback_2)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0GST_INFO (&quot;wait for s=
egment done message&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 msg =3D gst_bus_timed_pop_filte=
red (bus, (GstClockTime) 2 *<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0GST_SECOND,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 msg =3D gst_bus_timed_pop_filte=
red (bus, GST_CLOCK_TIME_NONE,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0GST_MESSAGE_=
SEGMENT_DONE | GST_MESSAGE_ERROR);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0fail_unless (msg, &quot;no=
 message within the timed window&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0fail_unless_equals_string =
(GST_MESSAGE_TYPE_NAME (msg),<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;segment-done&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -2.29.2<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0006-tests-use-a-dictionaries-for-environment.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0003-tests-use-a-dictionaries-for-environment.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; similarity index 61%<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename from<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0=
/0006-tests-use-a-dictionaries-for-environment.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/gstreamer1.0=
/0003-tests-use-a-dictionaries-for-environment.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 46813cec3d..10a6dcc619 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0006-tests-use-a-dictionaries-for-environment.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0003-tests-use-a-dictionaries-for-environment.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From e82dedec1803922656e92285fc1bb75b2c=
dc0aad Mon Sep 17<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +From fe830f0f75f3b4b41e3dbef8d4cf6ee410=
3c9e06 Mon Sep 17<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 From: Jose Quaresma &lt;<a href=3D=
"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com<=
/a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Date: Sat, 24 Apr 2021 10:34:47 +0=
100<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Subject: [PATCH 3/4] tests: use a =
dictionaries for environment<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -10,29 +10,31 @@ Upstream-Status: Sub=
mitted<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://gitlab.freedesktop.org/gst=
reamer/gstreamer/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.fre=
edesktop.org/gstreamer/gstreamer/-</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
freedesktop.org/gstreamer/gstreamer/-</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 Signed-off-by: Jose Quaresma &lt;<=
a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@g=
mail.com</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - tests/check/meson.build | 19 +++++++++=
++--------<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - 1 file changed, 11 insertions(+), 8 de=
letions(-)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + subprojects/gstreamer/tests/check/meso=
n.build | 21<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0++++++++++++-------<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + 1 file changed, 13 insertions(+), 8 de=
letions(-)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/tests/check/meson.build b/=
tests/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index a697a7b06..f64524904 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/tests/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/tests/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -161,14 +161,17 @@ foreach t : core_=
tests<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/test=
s/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/tests/check/meson.buil=
d<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index 00a138a568..48ec2532f8 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- a/subprojects/gstreamer/tests/check=
/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/tests/check=
/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +@@ -161,14 +161,19 @@ foreach t : core_=
tests<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install=
: installed_tests_enabled,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 -=C2=A0 =C2=A0 env =3D environment=
()<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --=C2=A0 =C2=A0 env.set(&#39;GST_PLUGIN_=
PATH_1_0&#39;, meson.build_root())<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +-=C2=A0 =C2=A0 env.set(&#39;GST_PLUGIN_=
PATH_1_0&#39;, meson.project_build_root())<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;GST_PL=
UGIN_SYSTEM_PATH_1_0&#39;, &#39;&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;GST_ST=
ATE_IGNORE_ELEMENTS&#39;, &#39;&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;CK_DEF=
AULT_TIMEOUT&#39;, &#39;20&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;GST_RE=
GISTRY&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&#39;@0@/@1@.registry&#39;.format(meson.curren=
t_build_dir(), test_name))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;GST_PL=
UGIN_SCANNER_1_0&#39;, gst_scanner_dir +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&#39;/gst-plugin-scanner&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 -=C2=A0 =C2=A0 env.set(&#39;GST_PL=
UGIN_LOADING_WHITELIST&#39;, &#39;gstreamer&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 # environment() can&#39;=
t be passed to configure_file and it is<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0needed for installed_tests<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 # use a dictionary as th=
is is simplest solution to install<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0the environment<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 # meson environment obje=
ct can&#39;t be passed to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0configure_file and<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 # installed tests uses c=
onfigure_file to install the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0environment.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 # use a dictionary as th=
is is the simplest solution<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 # to install the environ=
ment.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 env =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 &#39;GST_PLUGIN_P=
ATH_1_0&#39;: meson.build_root(),<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 &#39;GST_PLUGIN_P=
ATH_1_0&#39;: meson.project_build_root(),<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 &#39;GST_PLU=
GIN_SYSTEM_PATH_1_0&#39;: &#39;&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 &#39;GST_STA=
TE_IGNORE_ELEMENTS&#39;: &#39;&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 &#39;CK_DEFA=
ULT_TIMEOUT&#39;: &#39;20&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -44,5 +46,5 @@ index a697a7b06..f6452=
4904 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if installed_t=
ests_enabled<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_co=
nf =3D configuration_data()<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 --<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -2.31.1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +2.33.1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; new file mode 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 0000000000..efa004f8ce<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- /dev/null<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0004-tests-add-helper-script-to-run-the-installed_tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -0,0 +1,74 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +From 4dcbabebca2ad6f1fdd59ee35a858082e8=
7db7b6 Mon Sep 17<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +From: Jose Quaresma &lt;<a href=3D"mail=
to:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a><b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +Date: Sun, 2 May 2021 01:58:01 +0100<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +Subject: [PATCH 4/4] tests: add helper =
script to run the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0installed_tests<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +- this is a bash script that will run t=
he installed_tests<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +with some of the environment variables =
used in the meson<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +testing framework.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +Upstream-Status: Submitted<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://gitlab.freedesktop.org/gst=
reamer/gstreamer/-/merge_requests/789" rel=3D"noreferrer" target=3D"_blank"=
>https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789</a=
><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/merge_requests/789" rel=3D"noreferrer" target=3D"_bla=
nk">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789=
</a>&gt;]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +Signed-off-by: Jose Quaresma &lt;<a hre=
f=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.=
com</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + subprojects/gstreamer/tests/check/meso=
n.build=C2=A0 =C2=A0| 17<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + .../gstreamer/tests/check/<a href=3D"h=
ttp://template.sh.in" rel=3D"noreferrer" target=3D"_blank">template.sh.in</=
a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.sh.in" rel=3D"n=
oreferrer" target=3D"_blank">http://template.sh.in</a>&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 9 +++++++++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + .../gstreamer/tests/check/<a href=3D"h=
ttp://template.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.=
in</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D=
"noreferrer" target=3D"_blank">http://template.test.in</a>&gt;=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + 3 files changed, 27 insertions(+), 1 d=
eletion(-)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + create mode 100755<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0subprojects/gstreamer/tests/check/<a href=3D"h=
ttp://template.sh.in" rel=3D"noreferrer" target=3D"_blank">template.sh.in</=
a> &lt;<a href=3D"http://template.sh.in" rel=3D"noreferrer" target=3D"_blan=
k">http://template.sh.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/test=
s/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/tests/check/meson.buil=
d<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index 48ec2532f8..7dc4990d4e 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- a/subprojects/gstreamer/tests/check=
/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/tests/check=
/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +@@ -185,6 +185,23 @@ foreach t : core_t=
ests<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insta=
ll_dir: installed_tests_metadir,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0confi=
guration: test_conf<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 # All the tests w=
ill be deployed on the target machine and<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 # we use the home=
 folder ~ for the registry which will<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0then expand at runtime.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 # Using the /tmp/=
gstreamer-1.0/@0@.registry can be<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0problematic as it mostly<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 # is mounted usin=
g tmpfs and if the machine crash from<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0some reason we can lost the registry<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 # that is useful =
for debug propose of the tests itself.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 env +=3D {&#39;GS=
T_REGISTRY&#39;:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&#39;~/.cache/gstreamer-1.0/@0@.registry&#39;.=
format(test_name)}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 # Set the full pa=
th for the test it self.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 env +=3D {&#39;TE=
ST&#39;: &#39;@0@/@1@&#39;.format(join_paths(prefix,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0installed_tests_execdir), test_name)}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 configure_file(<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 input : &#=
39;<a href=3D"http://template.sh.in" rel=3D"noreferrer" target=3D"_blank">t=
emplate.sh.in</a> &lt;<a href=3D"http://template.sh.in" rel=3D"noreferrer" =
target=3D"_blank">http://template.sh.in</a>&gt;&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 output: te=
st_name + &#39;.sh&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 install_di=
r: installed_tests_execdir,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 configurat=
ion : env,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++=C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0endif<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0test(test_name, exe=
, env: env, timeout : 3 * 60)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/test=
s/check/<a href=3D"http://template.sh.in" rel=3D"noreferrer" target=3D"_bla=
nk">template.sh.in</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.sh.in" rel=3D"n=
oreferrer" target=3D"_blank">http://template.sh.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/tests/check/<a href=3D=
"http://template.sh.in" rel=3D"noreferrer" target=3D"_blank">template.sh.in=
</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.sh.in" rel=3D"n=
oreferrer" target=3D"_blank">http://template.sh.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +new file mode 100755<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index 0000000000..cf7d31b0ea<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- /dev/null<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/tests/check=
/<a href=3D"http://template.sh.in" rel=3D"noreferrer" target=3D"_blank">tem=
plate.sh.in</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.sh.in" rel=3D"n=
oreferrer" target=3D"_blank">http://template.sh.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +@@ -0,0 +1,9 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++#!/bin/sh<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++set -ax<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++CK_DEFAULT_TIMEOUT=3D&quot;@CK_DEFAULT=
_TIMEOUT@&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++GST_PLUGIN_LOADING_WHITELIST=3D&quot;@=
GST_PLUGIN_LOADING_WHITELIST@&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++GST_REGISTRY=3D@GST_REGISTRY@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++GST_STATE_IGNORE_ELEMENTS=3D&quot;@GST=
_STATE_IGNORE_ELEMENTS@&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++exec @TEST@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +diff --git a/subprojects/gstreamer/test=
s/check/<a href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_b=
lank">template.test.in</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D=
"noreferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/subprojects/gstreamer/tests/check/<a href=3D=
"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">template.tes=
t.in</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D=
"noreferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +index f701627f87..b74ef6ad73 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--- a/subprojects/gstreamer/tests/check=
/<a href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">t=
emplate.test.in</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D=
"noreferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++++ b/subprojects/gstreamer/tests/check=
/<a href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">t=
emplate.test.in</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://template.test.in" rel=3D=
"noreferrer" target=3D"_blank">http://template.test.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +@@ -1,3 +1,3 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + [Test]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; + Type=3Dsession<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +-Exec=3D@installed_tests_dir@/@program@=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ++Exec=3D@installed_tests_dir@/@program@=
.sh<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +--<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +2.33.1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0007-tests-install-the-environment-for-installed_tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0007-tests-install-the-environment-for-installed_tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; deleted file mode 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index eabe7bcbe1..0000000000<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/gstreamer1=
.0/0007-tests-install-the-environment-for-installed_tests.patch<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ /dev/null<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -1,58 +0,0 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From 57d2965e979f886e03eecd7e351bf01812=
053971 Mon Sep 17<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A000:00:00 2001<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -From: Jose Quaresma &lt;<a href=3D"mail=
to:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a><b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Date: Sun, 2 May 2021 01:58:01 +0100<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Subject: [PATCH 4/4] tests: install the=
 environment for<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0installed_tests<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -- adapt the test environment for instal=
led_tests<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -- install the test environment for inst=
alled_tests<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -- run the tests using the installed env=
ironment<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Upstream-Status: Submitted<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"https://gitlab.freedesktop.org/gst=
reamer/gstreamer/-/merge_requests/789" rel=3D"noreferrer" target=3D"_blank"=
>https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789</a=
><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/merge_requests/789" rel=3D"noreferrer" target=3D"_bla=
nk">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/789=
</a>&gt;]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -Signed-off-by: Jose Quaresma &lt;<a hre=
f=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.=
com</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:quaresma.jose@gma=
il.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ----<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - <a href=3D"http://template.test.in" re=
l=3D"noreferrer" target=3D"_blank">template.test.in</a> &lt;<a href=3D"http=
://template.test.in" rel=3D"noreferrer" target=3D"_blank">http://template.t=
est.in</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - tests/check/meson.build | 18 +++++++++=
+++++++++<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - 2 files changed, 19 insertions(+), 1 d=
eletion(-)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/<a href=3D"http://template=
.test.in" rel=3D"noreferrer" target=3D"_blank">template.test.in</a> &lt;<a =
href=3D"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">http:=
//template.test.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/<a href=3D"http://template.test.in" rel=3D"n=
oreferrer" target=3D"_blank">template.test.in</a> &lt;<a href=3D"http://tem=
plate.test.in" rel=3D"noreferrer" target=3D"_blank">http://template.test.in=
</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index f701627f8..9a3fbdd09 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/<a href=3D"http://template.test.i=
n" rel=3D"noreferrer" target=3D"_blank">template.test.in</a> &lt;<a href=3D=
"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">http://templ=
ate.test.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/<a href=3D"http://template.test.i=
n" rel=3D"noreferrer" target=3D"_blank">template.test.in</a> &lt;<a href=3D=
"http://template.test.in" rel=3D"noreferrer" target=3D"_blank">http://templ=
ate.test.in</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -1,3 +1,3 @@<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - [Test]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - Type=3Dsession<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --Exec=3D@installed_tests_dir@/@program@=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+Exec=3Dsh -c &#39;set -aex &amp;&amp; =
source<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0@installed_tests_dir@/@program@.env &amp;&amp;=
 exec<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0@installed_tests_dir@/@program@&#39;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -diff --git a/tests/check/meson.build b/=
tests/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -index f64524904..a67e0f8dd 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---- a/tests/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+++ b/tests/check/meson.build<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -@@ -183,6 +183,24 @@ foreach t : core_t=
ests<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0insta=
ll_dir: installed_tests_metadir,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0confi=
guration: test_conf<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 env +=3D {&#39;GS=
T_REGISTRY&#39;:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&#39;~/.cache/gstreamer-1.0/@0@.registry&#39;.=
format(test_name)}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 configure_file(<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output: te=
st_name + &#39;.env&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install_di=
r: installed_tests_execdir,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 configurat=
ion : env,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 # helper to conve=
rt a meson environment dictionay object<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0exported with configure_file<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 # this also remov=
e not needed variables for the installed<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0tests<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 meson.add_postcon=
f_script(&#39;sed&#39;, &#39;-i&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#3=
9;, &#39;/^#define/!d&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#3=
9;, &#39;s/^#define //g&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#3=
9;, &#39;/^GST_PLUGIN_PATH_1_0/d&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#3=
9;, &#39;/^GST_PLUGIN_SYSTEM_PATH_1_0/d&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#3=
9;, &#39;/^GST_PLUGIN_SCANNER_1_0/d&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-e&#3=
9;, &#39;s/ /=3D/&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 join_paths=
(meson.current_build_dir(), test_name + &#39;.env&#39;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -+=C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0endif<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0test(test_name, exe=
, env: env, timeout : 3 * 60)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -2.31.1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0a/meta/recipes-multimedia/gstreamer/<a href=3D=
"http://gstreamer1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstrea=
mer1.0_1.18.5.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.18.5.bb" =
rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.18.5.bb</a>&gt;<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-multimedia/gstreamer/<a href=3D=
"http://gstreamer1.0_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstrea=
mer1.0_1.20.0.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.20.0.bb" =
rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.20.0.bb</a>&gt;<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; similarity index 76%<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename from<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/<a href=3D"h=
ttp://gstreamer1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreame=
r1.0_1.18.5.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.18.5.bb" =
rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.18.5.bb</a>&gt;<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; rename to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0meta/recipes-multimedia/gstreamer/<a href=3D"h=
ttp://gstreamer1.0_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreame=
r1.0_1.20.0.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.20.0.bb" =
rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.20.0.bb</a>&gt;<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 0d82dd338c..243f99fee9 100644<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- a/meta/recipes-multimedia/gstreamer/=
<a href=3D"http://gstreamer1.0_1.18.5.bb" rel=3D"noreferrer" target=3D"_bla=
nk">gstreamer1.0_1.18.5.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.18.5.bb" =
rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.18.5.bb</a>&gt;<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/meta/recipes-multimedia/gstreamer/=
<a href=3D"http://gstreamer1.0_1.20.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">gstreamer1.0_1.20.0.bb</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://gstreamer1.0_1.20.0.bb" =
rel=3D"noreferrer" target=3D"_blank">http://gstreamer1.0_1.20.0.bb</a>&gt;<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -10,22 +10,19 @@ DEPENDS =3D &quot;gl=
ib-2.0 glib-2.0-native libxml2<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0bison-native flex-native&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 inherit meson pkgconfig gettext up=
stream-version-is-even<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0gobject-introspection ptest-gnome<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -LIC_FILES_CHKSUM =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;file://COPYING;md5=3D6762ed442b3822387a5=
1c92d928ead0d \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;file://COPYING;md5=3D69333daa044cb77e486=
cc36129f7a770 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0file://gst/gst.h;beginline=3D1;endline=3D21;md=
5=3De059138481205ee2c6fc1c079c016d0d&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 S =3D &quot;${WORKDIR}/gstreamer-$=
{PV}&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 SRC_URI =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"https://gstreamer.freedesktop=
.org/src/gstreamer/gstreamer-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D=
"_blank">https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.ta=
r.xz</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://gstreamer.freedesktop.o=
rg/src/gstreamer/gstreamer-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_=
blank">https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-$%7BPV%7D.=
tar.xz</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0file://run-ptest \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-gst-gstpluginloader.c-when-=
env-var-is-set-do-not-fal.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://0002-Remove-unused-valgrind-detection.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-tests-seek-Don-t-use-too-st=
rict-timeout-for-validati.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-tests-respect-the-idententa=
ion-used-in-meson.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-tests-add-support-for-insta=
ll-the-tests.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-tests-use-a-dictionaries-fo=
r-environment.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-tests-install-the-environme=
nt-for-installed_tests.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-tests-respect-the-idententa=
ion-used-in-meson.patch;striplevel=3D3 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-tests-add-support-for-insta=
ll-the-tests.patch;striplevel=3D3 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-tests-use-a-dictionaries-fo=
r-environment.patch;striplevel=3D3 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-tests-add-helper-script-to-=
run-the-installed_tests.patch;striplevel=3D3 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -SRC_URI[sha256sum] =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;55862232a63459bbf56abebde3085ca9aec211b4=
78e891dacea4d6df8cafe80a&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +SRC_URI[sha256sum] =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;edf4bffff85591d4fff7b21bb9ed7f0feabc123a=
c4a4eff29e73cbce454f9db7&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.ut=
ils.contains(&#39;PTEST_ENABLED&#39;, &#39;1&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&#39;tests&#39;, &#39;&#39;, d)} \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -36,7 +33,7 @@ PACKAGECONFIG[debug] =
=3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;-Dgst_debug=3Dtrue,-Dgst_debug=3Dfalse&q=
uot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 PACKAGECONFIG[tracer-hooks] =3D<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;-Dtracer_hooks=3Dtrue,-Dtracer_hooks=3Df=
alse&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 PACKAGECONFIG[coretracers] =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;-Dcoretracers=3Denabled,-Dcoretracers=3D=
disabled&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 PACKAGECONFIG[check] =3D &quot;-Dc=
heck=3Denabled,-Dcheck=3Ddisabled&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -PACKAGECONFIG[tests] =3D &quot;-Dtests=
=3Denabled<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-Dinstalled-tests=3Dtrue,-Dtests=3Ddisabled -D=
installed-tests=3Dfalse&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; +PACKAGECONFIG[tests] =3D &quot;-Dtests=
=3Denabled<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0-Dinstalled_tests=3Dtrue,-Dtests=3Ddisabled -D=
installed_tests=3Dfalse&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 PACKAGECONFIG[unwind] =3D<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;-Dlibunwind=3Denabled,-Dlibunwind=3Ddisa=
bled,libunwind&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 PACKAGECONFIG[dw] =3D &quot;-Dlibd=
w=3Denabled,-Dlibdw=3Ddisabled,elfutils&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 PACKAGECONFIG[bash-completion] =3D=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&quot;-Dbash-completion=3Denabled,-Dbash-compl=
etion=3Ddisabled,bash-completion&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; 2.35.1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Links: You receive all messages sent to =
this group.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; View/Reply Online (#161427):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161427" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/161427</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/=
g/openembedded-core/message/161427" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-core/message/161427</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Mute This Topic:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/mt/8=
8962313/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/88962313/1686489</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/=
mt/88962313/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/88962313/1686489</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Group Owner: <a href=3D"mailto:openembed=
ded-core%2Bowner@lists.openembedded.org" target=3D"_blank">openembedded-cor=
e+owner@lists.openembedded.org</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core=
%252Bowner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bow=
ner@lists.openembedded.org</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Unsubscribe:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a><br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/=
g/openembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-core/unsub</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:alex.kanavin@gmail.com" tar=
get=3D"_blank">alex.kanavin@gmail.com</a> &lt;mailto:<a href=3D"mailto:alex=
.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;]<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Best regards,<br>
&gt; &gt;<br>
&gt; &gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt; --<br>
&gt; DENX Software Engineering GmbH,=C2=A0 =C2=A0 =C2=A0 Managing Director:=
 Wolfgang Denk<br>
&gt; HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany<=
br>
&gt; Phone: (+49)-8142-66989-54 Fax: (+49)-8142-66989-80 Email: <a href=3D"=
mailto:ch@denx.de" target=3D"_blank">ch@denx.de</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000833ddc05d82b2e99--

