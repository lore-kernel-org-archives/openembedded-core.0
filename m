Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C9ECC6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 22:46:27 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.131.1678747581626938973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 15:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ozm3EINd;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id q15so10573837oiw.11
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 15:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678747581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcKTY4sbW+0PcL3s7AvEicQZPoyJUu3j4FuKt2aGq8M=;
        b=Ozm3EINdnRN47YjurOG1+A8A7ghF/UGfYcoPfUelxipM0b/0jk7md/y/2zVUqijLkN
         aTFuwAmoid7EqG8TfkyLz4DuJHucSoxUxx0IItjNYJHtqYnXiYM7ml6AespVEdLoG3iZ
         JctYlbcTWJL1SlH785mt+y02uudOTXEJGx8ZYaGmGv4IYE/o/4IF5eRrQYItrHBV/mac
         ujgvWDDjo0UTl5Yt7v08KGXfi8ZhijB2NUIAQDjRsaGwtT4zjvO6XjIoGJ2PecPcPt9P
         Baf0WhyiZaPiDDhLvEujm+gcfYrcihDKZDPDpbNZjHk1/LSwFk3KJFXVzp7Vy2gdVxWb
         PmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678747581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcKTY4sbW+0PcL3s7AvEicQZPoyJUu3j4FuKt2aGq8M=;
        b=P30ghzMndHTfkFaMVjNIgprqYjwJd389+MHG2HqJmOU2Jy+hgiX8deflK6WASHWYEe
         ufsMygOEQSguHK/JSHETZwGZgTkA8/Ir/PqZZvN23cdjQLFz2fr8y3hZkwnX5INa5Xy1
         61VmedA50xLF7577YB2apx9WxiRddDJxRh7X4YKecFf6dgRX/p94BVkMo71F5HUO52jb
         zra7SDQZGAqtgImV8V585yDBydHKBqmpVXdtRPFga/gAzDUb+OwcZtDcDZdBAS6YaX8c
         Wv2/Hgdr+MA+niGnNCtSAYpiEPrJsRtyrbxvgxL8KvA2BwsD0XN6gsb+ovpP42v6lWRk
         lJkg==
X-Gm-Message-State: AO0yUKVn8GZ9GkKamilNDUbgCE1AZwzhA+aULKpsPYukvxWYShWmIval
	ZxhLxSgx47lb8KqGUqeXGWkrBqAUEJHB5nC2YmcRZ57GwDA=
X-Google-Smtp-Source: AK7set8BlJUZOnpJi0g7MAPpK2GczCxy830VJe+FsBGkQfB015OU/IPVjOeUqTmIZfcMcmX15GzvBYLA30FTdq1ofos=
X-Received: by 2002:a54:4506:0:b0:384:ef1:3467 with SMTP id
 l6-20020a544506000000b003840ef13467mr12385843oil.4.1678747580827; Mon, 13 Mar
 2023 15:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230312145053.1427377-1-alex@linutronix.de> <20230312145053.1427377-2-alex@linutronix.de>
In-Reply-To: <20230312145053.1427377-2-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Mar 2023 15:45:54 -0700
Message-ID: <CAMKF1socC8aUuiZ1T9N88B7MXw_v-koQLAvO_pKE_VZfMC7Bdg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/7] bitbake.conf: do not set native opengl
 distro feature from target
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 22:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178470

I am seeing waylandpp failing to build and YP layer compatibility tests fai=
ling.

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2557/step=
s/11/logs/stdio

On Sun, Mar 12, 2023 at 7:51=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This makes native opengl (and thus accelerated graphics in qemu) opt-in;
> the reason is that latest mesa tightly couples hardware drivers with its =
libraries,
> so we have to build both in mesa-native. Doing so significantly lengthens
> the builds, and so cannot be imposed by default.
>
> Add a check and a hint to runqemu so that there is a helpful error when
> there is no native/nativesdk opengl/virgl support.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/bitbake.conf                       |  4 ++--
>  meta/lib/oeqa/selftest/cases/runtime_test.py |  4 ++--
>  scripts/runqemu                              | 11 ++++++++++-
>  3 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index afd9e2f552..d1dc428583 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -912,8 +912,8 @@ DISTRO_FEATURES_NATIVESDK ?=3D "x11"
>
>  # Normally target distro features will not be applied to native builds:
>  # Native distro features on this list will use the target feature value
> -DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod opengl =
wayland"
> -DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod open=
gl wayland"
> +DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod wayland=
"
> +DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod wayl=
and"
>
>  DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit gobject-introspection-=
data ldconfig"
>  MACHINE_FEATURES_BACKFILL =3D "rtc qemu-usermode"
> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa=
/selftest/cases/runtime_test.py
> index 81b8d056cc..661c09c109 100644
> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> @@ -232,7 +232,7 @@ class TestImage(OESelftestTestCase):
>          if 'sdl' not in qemu_packageconfig:
>              features +=3D 'PACKAGECONFIG:append:pn-qemu-system-native =
=3D " sdl"\n'
>          if 'opengl' not in qemu_distrofeatures:
> -            features +=3D 'DISTRO_FEATURES:append =3D " opengl"\n'
> +            features +=3D 'DISTRO_FEATURES_NATIVE:append =3D " opengl"\n=
'
>          features +=3D 'TEST_SUITES =3D "ping ssh virgl"\n'
>          features +=3D 'IMAGE_FEATURES:append =3D " ssh-server-dropbear"\=
n'
>          features +=3D 'IMAGE_INSTALL:append =3D " kmscube"\n'
> @@ -264,7 +264,7 @@ class TestImage(OESelftestTestCase):
>          qemu_distrofeatures =3D get_bb_var('DISTRO_FEATURES', 'qemu-syst=
em-native')
>          features =3D 'IMAGE_CLASSES +=3D "testimage"\n'
>          if 'opengl' not in qemu_distrofeatures:
> -            features +=3D 'DISTRO_FEATURES:append =3D " opengl"\n'
> +            features +=3D 'DISTRO_FEATURES_NATIVE:append =3D " opengl"\n=
'
>          features +=3D 'TEST_SUITES =3D "ping ssh virgl"\n'
>          features +=3D 'IMAGE_FEATURES:append =3D " ssh-server-dropbear"\=
n'
>          features +=3D 'IMAGE_INSTALL:append =3D " kmscube"\n'
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 8e915f3d4c..9f82aa12f1 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -447,7 +447,16 @@ class BaseConfig(object):
>              self.set("MACHINE", arg)
>
>      def set_dri_path(self):
> -        self.qemu_environ['LIBGL_DRIVERS_PATH'] =3D os.path.join(self.bi=
ndir_native, '../lib/dri')
> +        drivers_path =3D os.path.join(self.bindir_native, '../lib/dri')
> +        if not os.path.exists(drivers_path) or not os.listdir(drivers_pa=
th):
> +            raise RunQemuError("""
> +qemu has been built without opengl support and accelerated graphics supp=
ort is not available.
> +To enable it, add:
> +DISTRO_FEATURES_NATIVE:append =3D " opengl"
> +DISTRO_FEATURES_NATIVESDK:append =3D " opengl"
> +to your build configuration.
> +""")
> +        self.qemu_environ['LIBGL_DRIVERS_PATH'] =3D drivers_path
>
>      def check_args(self):
>          for debug in ("-d", "--debug"):
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178393): https://lists.openembedded.org/g/openembedde=
d-core/message/178393
> Mute This Topic: https://lists.openembedded.org/mt/97560251/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

