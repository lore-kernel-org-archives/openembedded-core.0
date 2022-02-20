Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DA8C433EF
	for <webhook@archiver.kernel.org>; Sun, 20 Feb 2022 00:21:02 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.16604.1645316460837041524
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 16:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MyMpNMj3;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id p20so1115805ljo.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 16:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fDhd7TnYq3MAkAj4eAublY1++26gdE0NItXJhGOPEuk=;
        b=MyMpNMj35LFTGtzP846aOgJ+7zRI2Rx3swpsB06hdCIGmLpByn8M+GHpV2eYfS75YA
         N9tcA07Z1qSVDNXRXfh6dbS+yoFoLLpco6004THuFneBMc2jryzzrVEl79G4GIdnqSDE
         hYBopgF2ag9RdkpWj+paFZ/H6azf1wE4yPKFk/lqCu9z517let4vV6iGbWGJadeFT0uB
         3eLHkvzmlX7MrNCi+4aPh9grPL+cha5mUXBGISzd1uQNKE8+kBm7gec9vIE51+2PHN2Z
         TRH9hJxsbE6++2X/oeV5YlqQnWm9zcOSfFnlFmyVaOUJcpUTSXNwlNB2nJo4rBcRK1Gx
         yEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fDhd7TnYq3MAkAj4eAublY1++26gdE0NItXJhGOPEuk=;
        b=W5/oRnQ0B/3jKUgJUe4SNyvHZc+mNbVuRNdCKpCxIM7lj/DpSt3kxO2jO3UMmV45T8
         VXSx26tPdShl6OqWpN7wwhArRoo7Dkb+ianAw+ob312tbs8yMwL3RdS6On2hkXkaroZr
         4DSqojjujOCyI+KCb/HW6GYo8ZEFnLUWLG+mmjfg37Yfi8yeiK7WNGb9kbiNMG1NhFA6
         96pAcpAwSNMHUz8hO2hY2nrOQaPRH3oLaJ2UCLSK+PuZkJyEddmMFG56kryNcP8AtsLL
         PET7BHsukNuJwhSi5lnXdAGegXdvaJW8SXOufPH5gd8WX84vHxmhR0ICvIyUAEq0ZucZ
         JtdQ==
X-Gm-Message-State: AOAM531KWYttqHl6uZ/NMk7TKYQnnfo2TsCByGvTI51WYbHRcNokLZ35
	WdENdDCJiD0iStGLuT1HIVdbhNE1C4kz40D4i0Q=
X-Google-Smtp-Source: 
 ABdhPJxJk6QNH8CedeJNydDO+AfTfkreFwoly5qh1zHnQRrN+RuOIcR8A7ZYXrKcQCQQSjDfBCl6a93SWRdi4VW/6EM=
X-Received: by 2002:a2e:a795:0:b0:244:2a13:925 with SMTP id
 c21-20020a2ea795000000b002442a130925mr10195803ljf.255.1645316458816; Sat, 19
 Feb 2022 16:20:58 -0800 (PST)
MIME-Version: 1.0
References: <20220217230023.727460-1-quaresma.jose@gmail.com>
 <20220217230023.727460-2-quaresma.jose@gmail.com>
 <CANNYZj-5kY6xNhOpiM-CuMvkK=UeFKQWcBti0x-f8jUAPNPB3A@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-5kY6xNhOpiM-CuMvkK=UeFKQWcBti0x-f8jUAPNPB3A@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Sun, 20 Feb 2022 00:20:48 +0000
Message-ID: 
 <CANPvuRnJHDLKOmBYPwfZ9VR=qz71S5vLSpYpLic1Qu+3+7e3jg@mail.gmail.com>
Subject: Re: [OE-core] [RFC 2/2] gstreamer1.0: add support for running native
 test
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000012290f05d8681769"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Feb 2022 00:21:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161979

--00000000000012290f05d8681769
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia sexta,
18/02/2022 =C3=A0(s) 06:58:

> I like the idea, but gstreamer build-time testing seems like a bit of
> a work in progress. Is there some other meson-based component where
> this can be showcased and enabled in a more simple way?
>

To enable this feature, the user only to sets a variable:
MESON_QEMU_WRAPPER_TEST_ENABLED =3D "1"

Or in local configuration:
MESON_QEMU_WRAPPER_TEST_ENABLED:pn-systemd-boot =3D "1"

Unfortunately the qemu user mode can't run successfully all the tests in
most
of the meson components in OE-Core. I have added the results for the
following recipes:

systemd-boot
    Ok:                 821
    Expected Fail:      0
    Fail:               95
    Unexpected Pass:    0
    Skipped:            33
    Timeout:            0

glib-2.0
    Ok:                 197
    Expected Fail:      0
    Fail:               76
    Unexpected Pass:    0
    Skipped:            0
    Timeout:            2

gstreamer1.0
    Ok:                 95
    Expected Fail:      0
    Fail:               10
    Unexpected Pass:    0
    Skipped:            1
    Timeout:            0

Jose


> Alex
>
> On Fri, 18 Feb 2022 at 00:00, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > This is an exmple of using the native meson test
> >
> > gstreamer1.0-meson-qemuwrapper-test.inc
> > ^ this is receipe part
> >
> > meson-qemuwrapper-helper.sh
> > ^ this is an helper script to skip unsupported tests
> >
> >
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstpluginloader-show-=
the-reason-when-spawning-of-gst.patch
> > ^ this patch helps debugind unsupported tests
> >
> > With EXTRA_OEMESON_TEST =3D "gst_gstbin" it will only run
> > the gst_gstbin test and the output
> > is the following
> >
> > + meson_do_test
> > + export GST_DEBUG=3D6
> > + meson test -C
> /build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/build
> --print-errorlogs gst_gstbin
> >
> > ninja: Entering directory
> `/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/build'
> >
> > ninja: no work to do.
> >
> > 1/1 gst_gstbin TIMEOUT        180.12s   killed by signal 15 SIGTERM
> >
> > >>>
> GST_PLUGIN_SCANNER_1_0=3D/build/tmp/work/core2-64-poky-linux/gstreamer1.0=
/1.20.0-r0/build/libs/gst/helpers/gst-plugin-scanner
> GST_PLUGIN_LOADING_WHITELIST=3Dgstreamer GST_STATE_IGNORE_ELEMENTS=3D''
> MESON_EXE_WRAPPER=3D/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20=
.0-r0/meson-qemuwrapper
> GST_PLUGIN_PATH_1_0=3D/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.=
20.0-r0/build
> MALLOC_PERTURB_=3D192
> GST_REGISTRY=3D/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0=
/build/tests/check/gst_gstbin.registry
> CK_DEFAULT_TIMEOUT=3D20 GST_PLUGIN_SYSTEM_PATH_1_0=3D''
> /build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/meson-qemuwrap=
per
> /build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/build/tests/ch=
eck/gst_gstbin
> > =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95
> > Listing only the last 100 lines from a long log.
> > 0:00:07.719379569 440069   0x4000025400 DEBUG             GST_STATES
> gstbin.c:2990:gst_bin_change_state_func:<bin0> iterator done
> > 0:00:07.719393717 440069   0x4000061180 LOG              GST_MESSAGE
> gstmessage.c:304:gst_message_new_custom: source fakesink0: creating new
> message 0x400c002100 latency
> > 0:00:07.719413507 440069   0x4000025400 LOG               GST_STATES
> gstelement.c:3282:gst_element_change_state_func:<bin0> default handler
> tries setting state from PLAYING to PAUSED (0023)
> > 0:00:07.719438100 440069   0x4000061180 DEBUG                GST_BUS
> gstbus.c:338:gst_bus_post:<bus0> [msg 0x400c002100] posting on bus latenc=
y
> message: 0x400c002100, time 99:99:99.999999999, seq-num 31, element
> 'fakesink0', (NULL)
> > 0:00:07.719441024 440069   0x4000025400 DEBUG             GST_STATES
> gstbin.c:3006:gst_bin_change_state_func:<bin0> we have ASYNC elements
> SUCCESS -> ASYNC
> > 0:00:07.719467032 440069   0x4000025400 DEBUG                    bin
> gstbin.c:2383:gst_bin_sort_iterator_free:<bin0>
> > .
> > .
> > .
> >
> =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95
> > Summary of Failures:
> >
> > 1/1 gst_gstbin TIMEOUT        180.12s   killed by signal 15 SIGTERM
> >
> > Ok:                 0
> > Expected Fail:      0
> > Fail:               0
> > Unexpected Pass:    0
> > Skipped:            0
> > Timeout:            1
> >
> > Full log written to
> /build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/build/meson-lo=
gs/testlog.txt
> >
> > + bb_sh_exit_handler
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  .../gstreamer1.0-meson-qemuwrapper-test.inc   | 15 ++++++
> >  ...show-the-reason-when-spawning-of-gst.patch | 53 +++++++++++++++++++
> >  .../gstreamer1.0/meson-qemuwrapper-helper.sh  | 15 ++++++
> >  .../gstreamer/gstreamer1.0_1.20.0.bb          |  6 +++
> >  4 files changed, 89 insertions(+)
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-meson-qemuwrapper-test.inc
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstpluginloader-show-=
the-reason-when-spawning-of-gst.patch
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0/meson-qemuwrapper-helper.s=
h
> >
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meson-qemuwrapper-test.i=
nc
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meson-qemuwrapper-test.i=
nc
> > new file mode 100644
> > index 0000000000..c9f4885f82
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meson-qemuwrapper-test.i=
nc
> > @@ -0,0 +1,15 @@
> > +SRC_URI +=3D
> "file://0001-gstpluginloader-show-the-reason-when-spawning-of-gst.patch;s=
triplevel=3D3"
> > +SRC_URI +=3D "file://meson-qemuwrapper-helper.sh"
> > +
> > +#MESON_QEMU_WRAPPER_HELPER =3D "${WORKDIR}/meson-qemuwrapper-helper.sh=
"
> > +
> > +PACKAGECONFIG[tests] =3D "-Dtests=3Denabled,-Dtests=3Ddisabled"
> > +
> > +# run single test
> > +EXTRA_OEMESON_TEST =3D "gst_gstbin"
> > +
> > +meson_do_test:prepend() {
> > +    # run the test with the debug mode enabled
> > +    # logs will be placed at build/meson-logs/testlog.txt
> > +    export GST_DEBUG=3D6
> > +}
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstpluginloader-sho=
w-the-reason-when-spawning-of-gst.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstpluginloader-sho=
w-the-reason-when-spawning-of-gst.patch
> > new file mode 100644
> > index 0000000000..22c8750f5b
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstpluginloader-sho=
w-the-reason-when-spawning-of-gst.patch
> > @@ -0,0 +1,53 @@
> > +From 8e1de3f84c2e654515b6d6b16783a4a08dfd118d Mon Sep 17 00:00:00 2001
> > +From: Jose Quaresma <quaresma.jose@gmail.com>
> > +Date: Wed, 8 Dec 2021 22:13:15 +0000
> > +Subject: [PATCH] gstpluginloader: show the reason when spawning of
> > + gst-plugin-scanner fail
> > +
> > +This fix helps in cross compiling when the meson tests runs using a
> qemu wraper
> > +
> > +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1701>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/8e1de3f84c2e6=
54515b6d6b16783a4a08dfd118d
> ]
> > +
> > +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > +---
> > + subprojects/gstreamer/gst/gstpluginloader.c | 14 ++++++++++----
> > + 1 file changed, 10 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/subprojects/gstreamer/gst/gstpluginloader.c
> b/subprojects/gstreamer/gst/gstpluginloader.c
> > +index 10a446fa5e..fb8b45cffa 100644
> > +--- a/subprojects/gstreamer/gst/gstpluginloader.c
> > ++++ b/subprojects/gstreamer/gst/gstpluginloader.c
> > +@@ -413,6 +413,7 @@ gst_plugin_loader_try_helper (GstPluginLoader *
> loader, gchar * location)
> > + {
> > +   char *argv[6] =3D { NULL, };
> > +   int c =3D 0;
> > ++  GError *error =3D NULL;
> > +
> > + #if defined (__APPLE__) && defined (USR_BIN_ARCH_SWITCH)
> > +   if (gst_plugin_loader_use_usr_bin_arch ()) {
> > +@@ -432,11 +433,16 @@ gst_plugin_loader_try_helper (GstPluginLoader *
> loader, gchar * location)
> > +     GST_LOG ("Trying to spawn gst-plugin-scanner helper at %s",
> location);
> > +   }
> > +
> > +-  if (!g_spawn_async_with_pipes (NULL, argv, NULL,
> > +-          G_SPAWN_DO_NOT_REAP_CHILD /* | G_SPAWN_STDERR_TO_DEV_NULL *=
/
> ,
> > +-          NULL, NULL, &loader->child_pid, &loader->fd_w.fd,
> &loader->fd_r.fd,
> > +-          NULL, NULL))
> > ++  g_spawn_async_with_pipes (NULL, argv, NULL,
> > ++      G_SPAWN_DO_NOT_REAP_CHILD /* | G_SPAWN_STDERR_TO_DEV_NULL */ ,
> > ++      NULL, NULL, &loader->child_pid, &loader->fd_w.fd,
> &loader->fd_r.fd,
> > ++      NULL, &error);
> > ++
> > ++  if (error) {
> > ++    GST_ERROR ("Spawning gst-plugin-scanner helper failed: %s",
> error->message);
> > ++    g_clear_error (&error);
> > +     return FALSE;
> > ++  }
> > +
> > +   gst_poll_add_fd (loader->fdset, &loader->fd_w);
> > +   gst_poll_add_fd (loader->fdset, &loader->fd_r);
> > +--
> > +2.35.1
> > +
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0/meson-qemuwrapper-helper=
.sh
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/meson-qemuwrapper-helper=
.sh
> > new file mode 100644
> > index 0000000000..7f03f79292
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0/meson-qemuwrapper-helper=
.sh
> > @@ -0,0 +1,15 @@
> > +#!/bin/sh
> > +#set -x
> > +
> > +test=3D"$(basename "$1")"
> > +
> > +# some tests currently fails so there we skipped the already knowns
> > +skipped=3D"$skipped elements_dataurisrc"
> > +skipped=3D"$skipped libs_gstnettimeprovider"
> > +skipped=3D"$skipped gst_gstelement"
> > +skipped=3D"$skipped gst_gstregistry"
> > +for s in $skipped; do
> > +    if [ "$s" =3D "$test" ]; then
> > +        exit 77
> > +    fi
> > +done
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
> > index 243f99fee9..38595b8789 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.0.bb
> > @@ -70,3 +70,9 @@ FILES:${PN}-dbg +=3D "${datadir}/gdb
> ${datadir}/gstreamer-1.0/gdb"
> >  CVE_PRODUCT =3D "gstreamer"
> >
> >  PTEST_BUILD_HOST_FILES =3D ""
> > +
> > +MESON_QEMU_WRAPPER_TEST_ENABLED =3D "1"
> > +
> > +GST_MESON_TEST =3D "${@"gstreamer1.0-meson-qemuwrapper-test.inc" if
> d.getVar('MESON_QEMU_WRAPPER_TEST_ENABLED') =3D=3D '1' else ""}"
> > +
> > +require ${GST_MESON_TEST}
> > --
> > 2.35.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#161869):
> https://lists.openembedded.org/g/openembedded-core/message/161869
> > Mute This Topic: https://lists.openembedded.org/mt/89221717/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000012290f05d8681769
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu no dia s=
exta, 18/02/2022 =C3=A0(s) 06:58:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">I like the idea, but gstreamer build-time testing seems l=
ike a bit of<br>
a work in progress. Is there some other meson-based component where<br>
this can be showcased and enabled in a more simple way?<br></blockquote><di=
v><br></div><div>To enable this feature, the user only to sets a variable:<=
/div><div><div>MESON_QEMU_WRAPPER_TEST_ENABLED =3D &quot;1&quot;<br></div><=
br class=3D"gmail-Apple-interchange-newline"></div><div>Or in local configu=
ration:</div><div>MESON_QEMU_WRAPPER_TEST_ENABLED:pn-systemd-boot =3D &quot=
;1&quot;<br></div><div><br></div><div>Unfortunately the qemu user mode can&=
#39;t run successfully all the tests in most</div><div>of the meson compone=
nts=C2=A0in OE-Core. I have added the results for the following recipes:</d=
iv><div><br></div><div>systemd-boot=C2=A0<br></div><div>=C2=A0 =C2=A0 Ok: =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 821<br>=C2=A0 =C2=
=A0 Expected Fail: =C2=A0 =C2=A0 =C2=A00<br>=C2=A0 =C2=A0 Fail: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 95<br>=C2=A0 =C2=A0 Unexpected Pass:=
 =C2=A0 =C2=A00<br>=C2=A0 =C2=A0 Skipped: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A033<br>=C2=A0 =C2=A0 Timeout: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00<br></div><div><br></div><div>glib-2.0<br></div><div>=C2=A0 =C2=A0 O=
k: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 197<br>=C2=A0 =
=C2=A0 Expected Fail: =C2=A0 =C2=A0 =C2=A00<br>=C2=A0 =C2=A0 Fail: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 76<br>=C2=A0 =C2=A0 Unexpected Pa=
ss: =C2=A0 =C2=A00<br>=C2=A0 =C2=A0 Skipped: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00<br>=C2=A0 =C2=A0 Timeout: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A02<br></div><div><br></div><div>gstreamer1.0<br></div><div>=C2=A0 =C2=
=A0 Ok: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 95<br>=C2=
=A0 =C2=A0 Expected Fail: =C2=A0 =C2=A0 =C2=A00<br>=C2=A0 =C2=A0 Fail: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10<br>=C2=A0 =C2=A0 Unexpecte=
d Pass: =C2=A0 =C2=A00<br>=C2=A0 =C2=A0 Skipped: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A01<br>=C2=A0 =C2=A0 Timeout: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00<br></div><div><br></div><div>Jose</div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
Alex<br>
<br>
On Fri, 18 Feb 2022 at 00:00, Jose Quaresma &lt;<a href=3D"mailto:quaresma.=
jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; This is an exmple of using the native meson test<br>
&gt;<br>
&gt; gstreamer1.0-meson-qemuwrapper-test.inc<br>
&gt; ^ this is receipe part<br>
&gt;<br>
&gt; meson-qemuwrapper-helper.sh<br>
&gt; ^ this is an helper script to skip unsupported tests<br>
&gt;<br>
&gt; meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstpluginloader-sh=
ow-the-reason-when-spawning-of-gst.patch<br>
&gt; ^ this patch helps debugind unsupported tests<br>
&gt;<br>
&gt; With EXTRA_OEMESON_TEST =3D &quot;gst_gstbin&quot; it will only run<br=
>
&gt; the gst_gstbin test and the output<br>
&gt; is the following<br>
&gt;<br>
&gt; + meson_do_test<br>
&gt; + export GST_DEBUG=3D6<br>
&gt; + meson test -C /build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.=
0-r0/build --print-errorlogs gst_gstbin<br>
&gt;<br>
&gt; ninja: Entering directory `/build/tmp/work/core2-64-poky-linux/gstream=
er1.0/1.20.0-r0/build&#39;<br>
&gt;<br>
&gt; ninja: no work to do.<br>
&gt;<br>
&gt; 1/1 gst_gstbin TIMEOUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 180.12s=C2=A0 =C2=A0=
killed by signal 15 SIGTERM<br>
&gt;<br>
&gt; &gt;&gt;&gt; GST_PLUGIN_SCANNER_1_0=3D/build/tmp/work/core2-64-poky-li=
nux/gstreamer1.0/1.20.0-r0/build/libs/gst/helpers/gst-plugin-scanner GST_PL=
UGIN_LOADING_WHITELIST=3Dgstreamer GST_STATE_IGNORE_ELEMENTS=3D&#39;&#39; M=
ESON_EXE_WRAPPER=3D/build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-=
r0/meson-qemuwrapper GST_PLUGIN_PATH_1_0=3D/build/tmp/work/core2-64-poky-li=
nux/gstreamer1.0/1.20.0-r0/build MALLOC_PERTURB_=3D192 GST_REGISTRY=3D/buil=
d/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/build/tests/check/gst=
_gstbin.registry CK_DEFAULT_TIMEOUT=3D20 GST_PLUGIN_SYSTEM_PATH_1_0=3D&#39;=
&#39; /build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/meson-qemu=
wrapper /build/tmp/work/core2-64-poky-linux/gstreamer1.0/1.20.0-r0/build/te=
sts/check/gst_gstbin<br>
&gt; =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80=C2=A0 =E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95<br>
&gt; Listing only the last 100 lines from a long log.<br>
&gt; 0:00:07.719379569 440069=C2=A0 =C2=A00x4000025400 DEBUG=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GST_STATES gstbin.c:2990:gst_bin_change_s=
tate_func:&lt;bin0&gt; iterator done<br>
&gt; 0:00:07.719393717 440069=C2=A0 =C2=A00x4000061180 LOG=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GST_MESSAGE gstmessage.c:304:gst_message_ne=
w_custom: source fakesink0: creating new message 0x400c002100 latency<br>
&gt; 0:00:07.719413507 440069=C2=A0 =C2=A00x4000025400 LOG=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GST_STATES gstelement.c:3282:gst_elem=
ent_change_state_func:&lt;bin0&gt; default handler tries setting state from=
 PLAYING to PAUSED (0023)<br>
&gt; 0:00:07.719438100 440069=C2=A0 =C2=A00x4000061180 DEBUG=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GST_BUS gstbus.c:338:gst_bus_post=
:&lt;bus0&gt; [msg 0x400c002100] posting on bus latency message: 0x400c0021=
00, time 99:99:99.999999999, seq-num 31, element &#39;fakesink0&#39;, (NULL=
)<br>
&gt; 0:00:07.719441024 440069=C2=A0 =C2=A00x4000025400 DEBUG=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GST_STATES gstbin.c:3006:gst_bin_change_s=
tate_func:&lt;bin0&gt; we have ASYNC elements SUCCESS -&gt; ASYNC<br>
&gt; 0:00:07.719467032 440069=C2=A0 =C2=A00x4000025400 DEBUG=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bin gstbin.c:2383:g=
st_bin_sort_iterator_free:&lt;bin0&gt;<br>
&gt; .<br>
&gt; .<br>
&gt; .<br>
&gt; =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95<br>
&gt; Summary of Failures:<br>
&gt;<br>
&gt; 1/1 gst_gstbin TIMEOUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 180.12s=C2=A0 =C2=A0=
killed by signal 15 SIGTERM<br>
&gt;<br>
&gt; Ok:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt; Expected Fail:=C2=A0 =C2=A0 =C2=A0 0<br>
&gt; Fail:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt; Unexpected Pass:=C2=A0 =C2=A0 0<br>
&gt; Skipped:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
&gt; Timeout:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
&gt;<br>
&gt; Full log written to /build/tmp/work/core2-64-poky-linux/gstreamer1.0/1=
.20.0-r0/build/meson-logs/testlog.txt<br>
&gt;<br>
&gt; + bb_sh_exit_handler<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../gstreamer1.0-meson-qemuwrapper-test.inc=C2=A0 =C2=A0| 15 +++=
+++<br>
&gt;=C2=A0 ...show-the-reason-when-spawning-of-gst.patch | 53 +++++++++++++=
++++++<br>
&gt;=C2=A0 .../gstreamer1.0/meson-qemuwrapper-helper.sh=C2=A0 | 15 ++++++<b=
r>
&gt;=C2=A0 .../gstreamer/<a href=3D"http://gstreamer1.0_1.20.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">gstreamer1.0_1.20.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 6 +++<br>
&gt;=C2=A0 4 files changed, 89 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-meson-qemuwrapper-test.inc<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0/0001-gstpluginloader-show-the-reason-when-spawning-of-gst.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0/meson-qemuwrapper-helper.sh<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meson-qemu=
wrapper-test.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meson-qem=
uwrapper-test.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..c9f4885f82<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meson-qemuwrapper=
-test.inc<br>
&gt; @@ -0,0 +1,15 @@<br>
&gt; +SRC_URI +=3D &quot;file://0001-gstpluginloader-show-the-reason-when-s=
pawning-of-gst.patch;striplevel=3D3&quot;<br>
&gt; +SRC_URI +=3D &quot;file://meson-qemuwrapper-helper.sh&quot;<br>
&gt; +<br>
&gt; +#MESON_QEMU_WRAPPER_HELPER =3D &quot;${WORKDIR}/meson-qemuwrapper-hel=
per.sh&quot;<br>
&gt; +<br>
&gt; +PACKAGECONFIG[tests] =3D &quot;-Dtests=3Denabled,-Dtests=3Ddisabled&q=
uot;<br>
&gt; +<br>
&gt; +# run single test<br>
&gt; +EXTRA_OEMESON_TEST =3D &quot;gst_gstbin&quot;<br>
&gt; +<br>
&gt; +meson_do_test:prepend() {<br>
&gt; +=C2=A0 =C2=A0 # run the test with the debug mode enabled<br>
&gt; +=C2=A0 =C2=A0 # logs will be placed at build/meson-logs/testlog.txt<b=
r>
&gt; +=C2=A0 =C2=A0 export GST_DEBUG=3D6<br>
&gt; +}<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstpl=
uginloader-show-the-reason-when-spawning-of-gst.patch b/meta/recipes-multim=
edia/gstreamer/gstreamer1.0/0001-gstpluginloader-show-the-reason-when-spawn=
ing-of-gst.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..22c8750f5b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstpluginloa=
der-show-the-reason-when-spawning-of-gst.patch<br>
&gt; @@ -0,0 +1,53 @@<br>
&gt; +From 8e1de3f84c2e654515b6d6b16783a4a08dfd118d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" ta=
rget=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; +Date: Wed, 8 Dec 2021 22:13:15 +0000<br>
&gt; +Subject: [PATCH] gstpluginloader: show the reason when spawning of<br=
>
&gt; + gst-plugin-scanner fail<br>
&gt; +<br>
&gt; +This fix helps in cross compiling when the meson tests runs using a q=
emu wraper<br>
&gt; +<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/1701" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1701</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/8e1de3f84c2e654515b6d6b16783a4a08dfd118d" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/8e1de3f84c2e654515b6d6b16783a4a08dfd118d</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmai=
l.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + subprojects/gstreamer/gst/gstpluginloader.c | 14 ++++++++++----<br>
&gt; + 1 file changed, 10 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/subprojects/gstreamer/gst/gstpluginloader.c b/subproject=
s/gstreamer/gst/gstpluginloader.c<br>
&gt; +index 10a446fa5e..fb8b45cffa 100644<br>
&gt; +--- a/subprojects/gstreamer/gst/gstpluginloader.c<br>
&gt; ++++ b/subprojects/gstreamer/gst/gstpluginloader.c<br>
&gt; +@@ -413,6 +413,7 @@ gst_plugin_loader_try_helper (GstPluginLoader * l=
oader, gchar * location)<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0char *argv[6] =3D { NULL, };<br>
&gt; +=C2=A0 =C2=A0int c =3D 0;<br>
&gt; ++=C2=A0 GError *error =3D NULL;<br>
&gt; +<br>
&gt; + #if defined (__APPLE__) &amp;&amp; defined (USR_BIN_ARCH_SWITCH)<br>
&gt; +=C2=A0 =C2=A0if (gst_plugin_loader_use_usr_bin_arch ()) {<br>
&gt; +@@ -432,11 +433,16 @@ gst_plugin_loader_try_helper (GstPluginLoader *=
 loader, gchar * location)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0GST_LOG (&quot;Trying to spawn gst-plugin-scanner=
 helper at %s&quot;, location);<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 if (!g_spawn_async_with_pipes (NULL, argv, NULL,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G_SPAWN_DO_NOT_REAP_CHILD /* | G_=
SPAWN_STDERR_TO_DEV_NULL */ ,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL, &amp;loader-&gt;child=
_pid, &amp;loader-&gt;fd_w.fd, &amp;loader-&gt;fd_r.fd,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, NULL))<br>
&gt; ++=C2=A0 g_spawn_async_with_pipes (NULL, argv, NULL,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 G_SPAWN_DO_NOT_REAP_CHILD /* | G_SPAWN_STDERR_T=
O_DEV_NULL */ ,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 NULL, NULL, &amp;loader-&gt;child_pid, &amp;loa=
der-&gt;fd_w.fd, &amp;loader-&gt;fd_r.fd,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 NULL, &amp;error);<br>
&gt; ++<br>
&gt; ++=C2=A0 if (error) {<br>
&gt; ++=C2=A0 =C2=A0 GST_ERROR (&quot;Spawning gst-plugin-scanner helper fa=
iled: %s&quot;, error-&gt;message);<br>
&gt; ++=C2=A0 =C2=A0 g_clear_error (&amp;error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return FALSE;<br>
&gt; ++=C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0gst_poll_add_fd (loader-&gt;fdset, &amp;loader-&gt;fd_w)=
;<br>
&gt; +=C2=A0 =C2=A0gst_poll_add_fd (loader-&gt;fdset, &amp;loader-&gt;fd_r)=
;<br>
&gt; +--<br>
&gt; +2.35.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/meson-qemu=
wrapper-helper.sh b/meta/recipes-multimedia/gstreamer/gstreamer1.0/meson-qe=
muwrapper-helper.sh<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..7f03f79292<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/meson-qemuwrapper=
-helper.sh<br>
&gt; @@ -0,0 +1,15 @@<br>
&gt; +#!/bin/sh<br>
&gt; +#set -x<br>
&gt; +<br>
&gt; +test=3D&quot;$(basename &quot;$1&quot;)&quot;<br>
&gt; +<br>
&gt; +# some tests currently fails so there we skipped the already knowns<b=
r>
&gt; +skipped=3D&quot;$skipped elements_dataurisrc&quot;<br>
&gt; +skipped=3D&quot;$skipped libs_gstnettimeprovider&quot;<br>
&gt; +skipped=3D&quot;$skipped gst_gstelement&quot;<br>
&gt; +skipped=3D&quot;$skipped gst_gstregistry&quot;<br>
&gt; +for s in $skipped; do<br>
&gt; +=C2=A0 =C2=A0 if [ &quot;$s&quot; =3D &quot;$test&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 77<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +done<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstre=
amer1.0_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.0=
.bb</a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_=
1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.0.bb</a><=
br>
&gt; index 243f99fee9..38595b8789 100644<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.0.bb</a>=
<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
_1.20.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.0.bb</a>=
<br>
&gt; @@ -70,3 +70,9 @@ FILES:${PN}-dbg +=3D &quot;${datadir}/gdb ${datadir}=
/gstreamer-1.0/gdb&quot;<br>
&gt;=C2=A0 CVE_PRODUCT =3D &quot;gstreamer&quot;<br>
&gt;<br>
&gt;=C2=A0 PTEST_BUILD_HOST_FILES =3D &quot;&quot;<br>
&gt; +<br>
&gt; +MESON_QEMU_WRAPPER_TEST_ENABLED =3D &quot;1&quot;<br>
&gt; +<br>
&gt; +GST_MESON_TEST =3D &quot;${@&quot;gstreamer1.0-meson-qemuwrapper-test=
.inc&quot; if d.getVar(&#39;MESON_QEMU_WRAPPER_TEST_ENABLED&#39;) =3D=3D &#=
39;1&#39; else &quot;&quot;}&quot;<br>
&gt; +<br>
&gt; +require ${GST_MESON_TEST}<br>
&gt; --<br>
&gt; 2.35.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#161869): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/161869" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/161869</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89221717=
/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/89221717/1686489</a><br>
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

--00000000000012290f05d8681769--

