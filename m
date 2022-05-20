Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C1EC433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 14:50:33 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.9735.1653058225755434905
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 07:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ePhl2kox;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.46,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f46.google.com with SMTP id c12so11075031eds.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 07:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t/pl7LAE+Pp4SYwM3ujRnuwGM+GsxAi9dVaEZ2EMebc=;
        b=ePhl2koxDxIyRzmz19q185HgEV3qMndtL/+CJweuuYrcRT+3Vubi3ZNjsibLrB4iyA
         ITOFEcmIRCUM0OS3JDuTz5B2T9FM8yjT9RiP9DFSsXnuTaRZSh0UIPX5DAcEes9dy7Yb
         niHznVurSy+qVWbzCxH8duZ0bYFicYNsa4xZBjZqOaRuTF7aZAJvn1P0QHpMeUodsDfp
         hjpCGob4wfOFxNiV0MZ3AGfWtSJFcuTDaDq+Ui6ymF2DlAhOUq4jRRlf1LHAwp+V8RbW
         iI7onWqerMXJZr/nzItLbtVj5SRgGVhGSp90TAWwF6JrHGI38thOOipWrKVCN6G6Fgx7
         OIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t/pl7LAE+Pp4SYwM3ujRnuwGM+GsxAi9dVaEZ2EMebc=;
        b=RYFlCEVIPLtxs2jS4FmyCDfzPYsj7Huyv6+z2I6BGxvzYmxe/10CQXW8tac+na+6C/
         iTodi6owRnCU9Xlz+Buv2+sByVK+fYixlLKgXyd64C768F9/kkMy7MHGKToSuhDjlpvG
         N+X0S9PVIacMKe7fDwFIv6car5nwMayJBrpVfF8BFhb6dSjvfy2biDfjdRSkZjkbnCbV
         /4Xp+JhwxBSJ4UpM7grv2m1MCPRJ19pIWM1FngZ8Jcvh9GSY3f0dI3+t8IQ+Da1czSK1
         XPHKvgdXxXRumLrjSD4YyABofhG0C6lzpVOMNpg3gbe3BQL4uvBlI41GHMzntu4mLt26
         10Bw==
X-Gm-Message-State: AOAM533DLUYzXJRJHDu36htKlAjEZ2Kb2gpkKZJDcfGOtG92sVzGvC8x
	a7KkqiqDu5FEhk4MTb1RyM2T3MIgKsWxvjJtkY+PQg==
X-Google-Smtp-Source: 
 ABdhPJxhVGkbkYiNhQ53BGElpABMIHYVFQy1IUexvTTjXlHMNB7UDuqsddjDHmnYWGIHqmuBB9flDS82ZzuVyR27a0Q=
X-Received: by 2002:aa7:ccc8:0:b0:42a:a827:ae74 with SMTP id
 y8-20020aa7ccc8000000b0042aa827ae74mr11183993edt.330.1653058223892; Fri, 20
 May 2022 07:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220516224921.37639-1-raj.khem@gmail.com>
In-Reply-To: <20220516224921.37639-1-raj.khem@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 20 May 2022 04:50:12 -1000
Message-ID: 
 <CAOSpxdaCj5mEPSRzauErNiQ_VP0RmVgiLVscuO4hnM4zG=8FXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl-locales: Switch SRC_URI to new location
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 14:50:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165941

On Mon, May 16, 2022 at 12:49 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Original repository has been less maintained and thusly adelie linux
> community has picked up the package and started to maintain it also
> applied long standing bug fixes.
>
> Now we use new fork by Ad=C3=A9lie Linux, which includes more supported
> locales.

Is this suitable/safe for kirkstone?

Steve

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl-locales_git.bb | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipes-co=
re/musl/musl-locales_git.bb
> index 40b20e250d2..92532237e03 100644
> --- a/meta/recipes-core/musl/musl-locales_git.bb
> +++ b/meta/recipes-core/musl/musl-locales_git.bb
> @@ -2,15 +2,15 @@
>  # Released under the MIT license (see COPYING.MIT for the terms)
>  #
>  SUMMARY =3D "Locales support for musl"
> -HOMEPAGE =3D "https://gitlab.com/rilian-la-te/musl-locales"
> +HOMEPAGE =3D "https://git.adelielinux.org/adelie/musl-locales/-/wikis/ho=
me"
>  LICENSE =3D "MIT & LGPL-3.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcf5713fba707073020b1db2acaa73=
e78 \
>                      file://LICENSE.MIT;md5=3Da4f1c6864a83ddf4b754cdab7d5=
93523"
>
> -SRC_URI =3D "git://gitlab.com/rilian-la-te/musl-locales;protocol=3Dhttps=
;branch=3Dmaster"
> +SRC_URI =3D "git://git.adelielinux.org/adelie/musl-locales;protocol=3Dht=
tps;branch=3Dmain"
>
>  PV =3D "1.0+git${SRCPV}"
> -SRCREV =3D "1101fb2bcdd189cd9415b8bd1c775eb43527d25c"
> +SRCREV =3D "cac3dcdccd1d0c08d17f4919d862737d64b76f79"
>
>  S =3D "${WORKDIR}/git"
>
> @@ -28,46 +28,55 @@ python () {
>
>  # only locale binaries are under GPL-3.0-or-later others are MIT
>  LICENSE:${PN} =3D "LGPL-3.0-or-later"
> -LICENSE:locale-base-ch-de =3D "MIT"
> +LICENSE:locale-base-cs-cz =3D "MIT"
>  LICENSE:locale-base-de-ch =3D "MIT"
>  LICENSE:locale-base-de-de =3D "MIT"
>  LICENSE:locale-base-en-gb =3D "MIT"
>  LICENSE:locale-base-en-us =3D "MIT"
>  LICENSE:locale-base-es-es =3D "MIT"
> +LICENSE:locale-base-fi-fi =3D "MIT"
>  LICENSE:locale-base-fr-fr =3D "MIT"
>  LICENSE:locale-base-it-it =3D "MIT"
>  LICENSE:locale-base-nb-no =3D "MIT"
>  LICENSE:locale-base-nl-nl =3D "MIT"
>  LICENSE:locale-base-pt-br =3D "MIT"
> +LICENSE:locale-base-pt-pt =3D "MIT"
>  LICENSE:locale-base-ru-ru =3D "MIT"
> +LICENSE:locale-base-sr-rs =3D "MIT"
>  LICENSE:locale-base-sv-se =3D "MIT"
>
> -PACKAGES =3D+ "locale-base-ch-de \
> +PACKAGES =3D+ "locale-base-cs-cz \
>               locale-base-de-ch \
>               locale-base-de-de \
>               locale-base-en-gb \
>               locale-base-en-us \
>               locale-base-es-es \
> +             locale-base-fi-fi \
>               locale-base-fr-fr \
>               locale-base-it-it \
>               locale-base-nb-no \
>               locale-base-nl-nl \
>               locale-base-pt-br \
> +             locale-base-pt-pt \
>               locale-base-ru-ru \
> +             locale-base-sr-rs \
>               locale-base-sv-se \
>               "
> -FILES:locale-base-ch-de +=3D "${datadir}/i18n/locales/musl/ch_DE.UTF-8"
> +FILES:locale-base-cs-cz +=3D "${datadir}/i18n/locales/musl/cs_CZ.UTF-8"
>  FILES:locale-base-de-ch +=3D "${datadir}/i18n/locales/musl/de_CH.UTF-8"
>  FILES:locale-base-de-de +=3D "${datadir}/i18n/locales/musl/de_DE.UTF-8"
>  FILES:locale-base-en-gb +=3D "${datadir}/i18n/locales/musl/en_GB.UTF-8"
>  FILES:locale-base-en-us +=3D "${datadir}/i18n/locales/musl/en_US.UTF-8"
>  FILES:locale-base-es-es +=3D "${datadir}/i18n/locales/musl/es_ES.UTF-8"
> +FILES:locale-base-fi-fi +=3D "${datadir}/i18n/locales/musl/fi_FI.UTF-8"
>  FILES:locale-base-fr-fr +=3D "${datadir}/i18n/locales/musl/fr_FR.UTF-8"
>  FILES:locale-base-it-it +=3D "${datadir}/i18n/locales/musl/it_IT.UTF-8"
>  FILES:locale-base-nb-no +=3D "${datadir}/i18n/locales/musl/nb_NO.UTF-8"
>  FILES:locale-base-nl-nl +=3D "${datadir}/i18n/locales/musl/nl_NL.UTF-8"
>  FILES:locale-base-pt-br +=3D "${datadir}/i18n/locales/musl/pt_BR.UTF-8"
> +FILES:locale-base-pt-pt +=3D "${datadir}/i18n/locales/musl/pt_PT.UTF-8"
>  FILES:locale-base-ru-ru +=3D "${datadir}/i18n/locales/musl/ru_RU.UTF-8"
> +FILES:locale-base-sr-rs +=3D "${datadir}/i18n/locales/musl/sr_RS.UTF-8"
>  FILES:locale-base-sv-se +=3D "${datadir}/i18n/locales/musl/sv_SE.UTF-8"
>
>  UPSTREAM_CHECK_COMMITS =3D "1"
> --
> 2.36.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165700): https://lists.openembedded.org/g/openembedde=
d-core/message/165700
> Mute This Topic: https://lists.openembedded.org/mt/91152448/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

