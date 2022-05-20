Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADCCC433FE
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 15:39:55 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web11.412.1653061185490987928
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 08:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SVVJGQl+;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id q203so9157821iod.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 08:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K94XhCUXuIOF5WY+IXyXEgCiYStE8/ZLsnKH4en1Pn4=;
        b=SVVJGQl+9KPUAQbY0kTJL1EbdJXZU1oGnhXv0tX3Ye4/e+GKg9CViLMixJxq3CzdBP
         KqMOGE0r5MojUw4Fxiit9gcPivbmj4/RiKyaSSyQjScIVlrJaT5N1IkRqxchkRIsw59d
         M37NSpF6aNV7VdibxDNEA68j1uEbyr3Ywgg6vHQ/QsEe/fyKhz1RibdKhAFWBoMIPDLD
         sZc3FaI4AS/wiJwm4L50d2CCPKIDaZctaBEPK9DHT+cO29rRkUUp37ZBcAVNS/pKHkDv
         4xcxhulrC4Fonq4sqWPo6wzIzhZA/JzQFMKt7Puluwi4315fYqgO9hJpa4XFpjNUAqjl
         xmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K94XhCUXuIOF5WY+IXyXEgCiYStE8/ZLsnKH4en1Pn4=;
        b=DSnmZIHzo6ACVvB1Qs7hhWEKt2qnxk5VM2fCQNQ7MD/Zk7DIcVGWcBt30pFdUa9NyW
         Q9l+Ej/AJHocBjtOXw23psbTTj3rZDcnHi3gi9Q5O1KrsbVuukj0QQVR4nIAvO4NVhjO
         qtz4aqV+6T6kOOnYPWMHYLeLnRuDsUvdwreNxOWDq81pJKeNv2d5FWkd1vCLbr2XnJG0
         wyw14poarWzm0O1b5AH2u4UaX/QjudRRHuGHmi8FV5+S1x2BkXOjoEevYkLd8udsBc0j
         ssXG2+I2H2IyIJJNEjlkDz1GaEUtlKblWygB5MQ+97VNl7VSwC5a4iUU38OJa1QPV7Kf
         2CLg==
X-Gm-Message-State: AOAM530k9bu7PdwPqVqZiqZ2oWi+hwRpLadq2KSk0FKsPGbBjz9s0iXU
	PDdtnvV8umA457TIKkQZg/rQbYqzgFz5mP+6VT2jphh6y0w=
X-Google-Smtp-Source: 
 ABdhPJwQ3roLi7hDfLH4+I+//IGBns0Res4ylifZTpLf3hyHwVTTm9YOs5wuB5s3F6OeVlOcc6qgZJFvCMLMHsRRa2M=
X-Received: by 2002:ac8:5bc7:0:b0:2f9:14ee:885e with SMTP id
 b7-20020ac85bc7000000b002f914ee885emr5659939qtb.532.1653061174102; Fri, 20
 May 2022 08:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220516224921.37639-1-raj.khem@gmail.com>
 <CAOSpxdaCj5mEPSRzauErNiQ_VP0RmVgiLVscuO4hnM4zG=8FXg@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdaCj5mEPSRzauErNiQ_VP0RmVgiLVscuO4hnM4zG=8FXg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 May 2022 08:39:08 -0700
Message-ID: 
 <CAMKF1sqR9QOniH9vpneH=Raadp6CDEirxAs5zSUNGG6J7+WGGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl-locales: Switch SRC_URI to new location
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 15:39:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165944

On Fri, May 20, 2022 at 7:50 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Mon, May 16, 2022 at 12:49 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Original repository has been less maintained and thusly adelie linux
> > community has picked up the package and started to maintain it also
> > applied long standing bug fixes.
> >
> > Now we use new fork by Ad=C3=A9lie Linux, which includes more supported
> > locales.
>
> Is this suitable/safe for kirkstone?

yes it is.

>
> Steve
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/musl/musl-locales_git.bb | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipes-=
core/musl/musl-locales_git.bb
> > index 40b20e250d2..92532237e03 100644
> > --- a/meta/recipes-core/musl/musl-locales_git.bb
> > +++ b/meta/recipes-core/musl/musl-locales_git.bb
> > @@ -2,15 +2,15 @@
> >  # Released under the MIT license (see COPYING.MIT for the terms)
> >  #
> >  SUMMARY =3D "Locales support for musl"
> > -HOMEPAGE =3D "https://gitlab.com/rilian-la-te/musl-locales"
> > +HOMEPAGE =3D "https://git.adelielinux.org/adelie/musl-locales/-/wikis/=
home"
> >  LICENSE =3D "MIT & LGPL-3.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcf5713fba707073020b1db2acaa=
73e78 \
> >                      file://LICENSE.MIT;md5=3Da4f1c6864a83ddf4b754cdab7=
d593523"
> >
> > -SRC_URI =3D "git://gitlab.com/rilian-la-te/musl-locales;protocol=3Dhtt=
ps;branch=3Dmaster"
> > +SRC_URI =3D "git://git.adelielinux.org/adelie/musl-locales;protocol=3D=
https;branch=3Dmain"
> >
> >  PV =3D "1.0+git${SRCPV}"
> > -SRCREV =3D "1101fb2bcdd189cd9415b8bd1c775eb43527d25c"
> > +SRCREV =3D "cac3dcdccd1d0c08d17f4919d862737d64b76f79"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > @@ -28,46 +28,55 @@ python () {
> >
> >  # only locale binaries are under GPL-3.0-or-later others are MIT
> >  LICENSE:${PN} =3D "LGPL-3.0-or-later"
> > -LICENSE:locale-base-ch-de =3D "MIT"
> > +LICENSE:locale-base-cs-cz =3D "MIT"
> >  LICENSE:locale-base-de-ch =3D "MIT"
> >  LICENSE:locale-base-de-de =3D "MIT"
> >  LICENSE:locale-base-en-gb =3D "MIT"
> >  LICENSE:locale-base-en-us =3D "MIT"
> >  LICENSE:locale-base-es-es =3D "MIT"
> > +LICENSE:locale-base-fi-fi =3D "MIT"
> >  LICENSE:locale-base-fr-fr =3D "MIT"
> >  LICENSE:locale-base-it-it =3D "MIT"
> >  LICENSE:locale-base-nb-no =3D "MIT"
> >  LICENSE:locale-base-nl-nl =3D "MIT"
> >  LICENSE:locale-base-pt-br =3D "MIT"
> > +LICENSE:locale-base-pt-pt =3D "MIT"
> >  LICENSE:locale-base-ru-ru =3D "MIT"
> > +LICENSE:locale-base-sr-rs =3D "MIT"
> >  LICENSE:locale-base-sv-se =3D "MIT"
> >
> > -PACKAGES =3D+ "locale-base-ch-de \
> > +PACKAGES =3D+ "locale-base-cs-cz \
> >               locale-base-de-ch \
> >               locale-base-de-de \
> >               locale-base-en-gb \
> >               locale-base-en-us \
> >               locale-base-es-es \
> > +             locale-base-fi-fi \
> >               locale-base-fr-fr \
> >               locale-base-it-it \
> >               locale-base-nb-no \
> >               locale-base-nl-nl \
> >               locale-base-pt-br \
> > +             locale-base-pt-pt \
> >               locale-base-ru-ru \
> > +             locale-base-sr-rs \
> >               locale-base-sv-se \
> >               "
> > -FILES:locale-base-ch-de +=3D "${datadir}/i18n/locales/musl/ch_DE.UTF-8=
"
> > +FILES:locale-base-cs-cz +=3D "${datadir}/i18n/locales/musl/cs_CZ.UTF-8=
"
> >  FILES:locale-base-de-ch +=3D "${datadir}/i18n/locales/musl/de_CH.UTF-8=
"
> >  FILES:locale-base-de-de +=3D "${datadir}/i18n/locales/musl/de_DE.UTF-8=
"
> >  FILES:locale-base-en-gb +=3D "${datadir}/i18n/locales/musl/en_GB.UTF-8=
"
> >  FILES:locale-base-en-us +=3D "${datadir}/i18n/locales/musl/en_US.UTF-8=
"
> >  FILES:locale-base-es-es +=3D "${datadir}/i18n/locales/musl/es_ES.UTF-8=
"
> > +FILES:locale-base-fi-fi +=3D "${datadir}/i18n/locales/musl/fi_FI.UTF-8=
"
> >  FILES:locale-base-fr-fr +=3D "${datadir}/i18n/locales/musl/fr_FR.UTF-8=
"
> >  FILES:locale-base-it-it +=3D "${datadir}/i18n/locales/musl/it_IT.UTF-8=
"
> >  FILES:locale-base-nb-no +=3D "${datadir}/i18n/locales/musl/nb_NO.UTF-8=
"
> >  FILES:locale-base-nl-nl +=3D "${datadir}/i18n/locales/musl/nl_NL.UTF-8=
"
> >  FILES:locale-base-pt-br +=3D "${datadir}/i18n/locales/musl/pt_BR.UTF-8=
"
> > +FILES:locale-base-pt-pt +=3D "${datadir}/i18n/locales/musl/pt_PT.UTF-8=
"
> >  FILES:locale-base-ru-ru +=3D "${datadir}/i18n/locales/musl/ru_RU.UTF-8=
"
> > +FILES:locale-base-sr-rs +=3D "${datadir}/i18n/locales/musl/sr_RS.UTF-8=
"
> >  FILES:locale-base-sv-se +=3D "${datadir}/i18n/locales/musl/sv_SE.UTF-8=
"
> >
> >  UPSTREAM_CHECK_COMMITS =3D "1"
> > --
> > 2.36.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#165700): https://lists.openembedded.org/g/openembed=
ded-core/message/165700
> > Mute This Topic: https://lists.openembedded.org/mt/91152448/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

