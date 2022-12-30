Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D91C4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 08:33:31 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.14456.1672389206679648410
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 00:33:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X91j89BP;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id bp15so30868031lfb.13
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 00:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyvtYoAieE7zO42bkdtDGf5kemy4+HEMYaK0AKsRxzA=;
        b=X91j89BPjA6lg3nPNKCfckj+W4lhZfinVgCtnR5wvCV3gb1j3FupVPHC2QPqbZs0qI
         ciGE86drkgon5sXz0NlMgMWWsSPh5STUlDh/f00qQ6ZacZD/Az4GGPy94MF3VxUmrqpC
         ZptyMzaarqVwC3p7guQsJ5t+tftUSP1geekamNDcTmPoGGMzpnokFBREV2MNm2qyrAxC
         ETStHl5TRrR3d3f0vkZINsckJs0UoMXKq2qXxMjdq8Xzgw9w96AF15DIsZWBI7PwnQDC
         hMDP4ZSNBDh3Gl8ZVfzepwedFZ1v2wIR1ZAxhe+ETdo5MSHiMpZw6tcZttQ2LDrVejgZ
         1bQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyvtYoAieE7zO42bkdtDGf5kemy4+HEMYaK0AKsRxzA=;
        b=qJLvNKnq8ev1s3GFDQdIDvaE3DcbRSHSkFc3UHjxATg2MkbAnzNZMpvpFG9dXns6/r
         2sUyHQbZh85O/uKcthOvfUCqjC468Lq9wTgN4Goi145kt64zFfUe5oYB731oe2t04xk6
         HzpTag7hWoAls7McVJ+cbPMmPSpsoMA+gVb4H0CfVXEpuVI2IRvBCt0rCUGs77fQIT7o
         IbyIylSgEZ4mOF2L2oaj11UeV+00u9zDAU1n2lu+qpLWepT43oP30qeo0hC3N68g21w2
         Q8jdasuQY3qYtvlECcGs80UHnsjHlRPdZ0g808FAUuvd/3kjNiePFS4Si0/Pb4e7a0zJ
         T6Hw==
X-Gm-Message-State: AFqh2kpC5Ng2BnaFDxCLAoeez/5Y7XQdsVb3fTOxEzIXX5/tw27s6dL4
	bbHN+KNxBzp0YD+/eooqBjcfXmA1LxbjeU3h6GI=
X-Google-Smtp-Source: AMrXdXsqAKJZkn711VeUlL+iNp3ZezOmVnS/U0yK1R9NmTr51C2yyTR8ZRol0gZmwpUCn9QyzWNJKHCfImjIrYzJ7g4=
X-Received: by 2002:ac2:4569:0:b0:4cb:22f5:902 with SMTP id
 k9-20020ac24569000000b004cb22f50902mr117575lfm.263.1672389204813; Fri, 30 Dec
 2022 00:33:24 -0800 (PST)
MIME-Version: 1.0
References: <20221229160110.255775-1-alex@linutronix.de> <20221229160110.255775-6-alex@linutronix.de>
 <H4UNNR.OSLU872EYWJ01@t-online.de>
In-Reply-To: <H4UNNR.OSLU872EYWJ01@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 30 Dec 2022 09:33:13 +0100
Message-ID: <CANNYZj8NDmvyAPaPf4LKHzuVnuYtHxqfO_TvgvT5CsUAWGdBDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 06/10] libportal: add from meta-openembedded/meta-gnome
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175136

I'll send an updated version that includes that.

Alex

On Thu, 29 Dec 2022 at 17:07, Markus Volk <f_l_k@t-online.de> wrote:
>
> I have recently sent a patch for libportal to includes libportal-gtk4. It=
 is under testing in meta-openembedded master-next.
>
> Without gtk4 support 'nautilus' will fail to compile and i guess others w=
ill follow.
>
>
> Am Do, 29. Dez 2022 um 17:01:06 +0100 schrieb Alexander Kanavin <alex.kan=
avin@gmail.com>:
>
> This used to be required by epiphany, then it became optional and was mov=
ed to meta-oe, now it is again required. The recipe was originally provided=
 by... actually me :-) Signed-off-by: Alexander Kanavin <alex@linutronix.de=
> --- meta/conf/distro/include/maintainers.inc | 1 + meta/recipes-gnome/lib=
portal/libportal_0.6.bb | 19 +++++++++++++++++++ 2 files changed, 20 insert=
ions(+) create mode 100644 meta/recipes-gnome/libportal/libportal_0.6.bb di=
ff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/incl=
ude/maintainers.inc index be96123ce6..0affa1bded 100644 --- a/meta/conf/dis=
tro/include/maintainers.inc +++ b/meta/conf/distro/include/maintainers.inc =
@@ -371,6 +371,7 @@ RECIPE_MAINTAINER:pn-libpcre =3D "Yi Zhao <yi.zhao@wind=
river.com>" RECIPE_MAINTAINER:pn-libpcre2 =3D "Unassigned <unassigned@yocto=
project.org>" RECIPE_MAINTAINER:pn-libpipeline =3D "Wang Mingyu <wangmy@fuj=
itsu.com>" RECIPE_MAINTAINER:pn-libpng =3D "Anuj Mittal <anuj.mittal@intel.=
com>" +RECIPE_MAINTAINER:pn-libportal =3D "Alexander Kanavin <alex.kanavin@=
gmail.com>" RECIPE_MAINTAINER:pn-libproxy =3D "Anuj Mittal <anuj.mittal@int=
el.com>" RECIPE_MAINTAINER:pn-libpthread-stubs =3D "Alexander Kanavin <alex=
.kanavin@gmail.com>" RECIPE_MAINTAINER:pn-libptytty =3D "Alexander Kanavin =
<alex.kanavin@gmail.com>" diff --git a/meta/recipes-gnome/libportal/libport=
al_0.6.bb b/meta/recipes-gnome/libportal/libportal_0.6.bb new file mode 100=
644 index 0000000000..9784f04818 --- /dev/null +++ b/meta/recipes-gnome/lib=
portal/libportal_0.6.bb @@ -0,0 +1,19 @@ +SUMMARY =3D "libportal provides G=
IO-style async APIs for most Flatpak portals." +DESCRIPTION =3D "It provide=
s simple asynchronous wrappers for most Flatpak portals \ +with a familiar =
GObject API along side the D-Bus API" +HOMEPAGE =3D "https://github.com/fla=
tpak/libportal" +BUGTRACKER =3D "https://github.com/flatpak/libportal/issue=
s" +LICENSE =3D "LGPL-3.0-only" +LIC_FILES_CHKSUM =3D "file://COPYING;md5=
=3D3000208d539ec061b899bce1d9ce9404" + +SRC_URI =3D "git://github.com/flatp=
ak/${BPN}.git;protocol=3Dhttps;branch=3Dmain" +SRCREV =3D "13df0b887a7eb7b0=
f9b14069561a41f62e813155" +S =3D "${WORKDIR}/git" + +inherit meson gtk-doc =
gobject-introspection features_check + +ANY_OF_DISTRO_FEATURES =3D "${GTK3D=
ISTROFEATURES}" + +DEPENDS +=3D "glib-2.0 glib-2.0-native gtk+3" + +EXTRA_O=
EMESON =3D "-Dbackends=3Dgtk3 -Dvapi=3Dfalse"
> --
> 2.30.2
>
>
>

