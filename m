Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BCCC433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 16:22:05 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.959.1653063718158713687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 09:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lGSv3MEG;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id p26so11437274eds.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 09:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+/qIn1IKccyKg0XMjKq4F1gY/InYRJvADy+f6Ehx5Jc=;
        b=lGSv3MEGe+NNBUddhqYfQFnmh0R60Yz/VXCgpkYiTjgAMWc7rbngQoG6BFN0eYDVnn
         En9SqWB0VSvGcIziKK2pNnx1bMkdFFix+s6OdP3V0kyM0LgQwXQoJoAIWSWlvYIij5tE
         /D9eFfNdtAFW+FQgzwzW4/VxAHJ01zkXFqdRfytj6pfMv7txVUo6ORjVD7KHZgmklQSo
         aiA0XoB6aqEJxLOD7HYTen49Z4LVlIJlMODkBUIwO0kSoZlSZSyX3gopd81cAEQCwEZy
         Zalorwfh+G0PEYMHNibzrWOc5l7AcaD8h0wx4lOrpHc0A0F5aOSvhZ3DYzLdOIW8Z4pt
         PPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+/qIn1IKccyKg0XMjKq4F1gY/InYRJvADy+f6Ehx5Jc=;
        b=ONYc195PvTUXT98OguBPNxBtfr3PDHCLqlm6SPzGKms1dnmZyakqOIGwTTrV9LV0x4
         1FTyXkJkdQ1axGmqq9Dx9Wqb6qgFdL5ueY506E7mUAff45Fm7sANqsQBKk8jQ5zI5G/y
         VaXtWc+rKpxYSF8O5H5CYB/VO05K25//kDu9NEAXWVEmHC301lIVQI0SP4JdLQIv+Roo
         RVTAte21BJSaDa+5lRsE1n00DJoOCVWin7z9xyfCn1PlYpB9p4LhmnXVLrID5J7mwgz4
         QC1AJOwTZR9DYP7xi9fZb/Q9eC1DbyB6a/yPmFuzrtblopgcBiFOyL2kN8XzX9Mou7Xu
         xkmw==
X-Gm-Message-State: AOAM531nfUKAUquoYIbTknxwrCI7WY6n4YGynwZI52UR6EKkSpzCRA9A
	QfnfkqwY8Xo01+EG+u83pIosiUd+GReBLsqWDoG5pQ==
X-Google-Smtp-Source: 
 ABdhPJx9410AONGCp9VAtEc1sjH3wT7qzsYea9UAim6531Rd1T8ihk/EWIgZpCydacdTsvrnU7pLf7NYwRw9DNSdPR8=
X-Received: by 2002:a05:6402:5251:b0:42b:3574:f1ee with SMTP id
 t17-20020a056402525100b0042b3574f1eemr2523862edd.269.1653063716470; Fri, 20
 May 2022 09:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220516224921.37639-1-raj.khem@gmail.com>
 <CAOSpxdaCj5mEPSRzauErNiQ_VP0RmVgiLVscuO4hnM4zG=8FXg@mail.gmail.com>
 <CAMKF1sqR9QOniH9vpneH=Raadp6CDEirxAs5zSUNGG6J7+WGGQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqR9QOniH9vpneH=Raadp6CDEirxAs5zSUNGG6J7+WGGQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 20 May 2022 06:21:44 -1000
Message-ID: 
 <CAOSpxdbD7JDuPBChB12pJTNLgx4OOGVsngGoLfr0G8Li6e9GMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl-locales: Switch SRC_URI to new location
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 16:22:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165945

On Fri, May 20, 2022 at 5:39 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, May 20, 2022 at 7:50 AM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > On Mon, May 16, 2022 at 12:49 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Original repository has been less maintained and thusly adelie linux
> > > community has picked up the package and started to maintain it also
> > > applied long standing bug fixes.
> > >
> > > Now we use new fork by Ad=C3=A9lie Linux, which includes more support=
ed
> > > locales.
> >
> > Is this suitable/safe for kirkstone?
>
> yes it is.

Doh!  I should have checked before asking.  This recipe was added post
kirkstone!

Steve

> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-core/musl/musl-locales_git.bb | 21 +++++++++++++++-----=
-
> > >  1 file changed, 15 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipe=
s-core/musl/musl-locales_git.bb
> > > index 40b20e250d2..92532237e03 100644
> > > --- a/meta/recipes-core/musl/musl-locales_git.bb
> > > +++ b/meta/recipes-core/musl/musl-locales_git.bb
> > > @@ -2,15 +2,15 @@
> > >  # Released under the MIT license (see COPYING.MIT for the terms)
> > >  #
> > >  SUMMARY =3D "Locales support for musl"
> > > -HOMEPAGE =3D "https://gitlab.com/rilian-la-te/musl-locales"
> > > +HOMEPAGE =3D "https://git.adelielinux.org/adelie/musl-locales/-/wiki=
s/home"
> > >  LICENSE =3D "MIT & LGPL-3.0-or-later"
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dcf5713fba707073020b1db2ac=
aa73e78 \
> > >                      file://LICENSE.MIT;md5=3Da4f1c6864a83ddf4b754cda=
b7d593523"
> > >
> > > -SRC_URI =3D "git://gitlab.com/rilian-la-te/musl-locales;protocol=3Dh=
ttps;branch=3Dmaster"
> > > +SRC_URI =3D "git://git.adelielinux.org/adelie/musl-locales;protocol=
=3Dhttps;branch=3Dmain"
> > >
> > >  PV =3D "1.0+git${SRCPV}"
> > > -SRCREV =3D "1101fb2bcdd189cd9415b8bd1c775eb43527d25c"
> > > +SRCREV =3D "cac3dcdccd1d0c08d17f4919d862737d64b76f79"
> > >
> > >  S =3D "${WORKDIR}/git"
> > >
> > > @@ -28,46 +28,55 @@ python () {
> > >
> > >  # only locale binaries are under GPL-3.0-or-later others are MIT
> > >  LICENSE:${PN} =3D "LGPL-3.0-or-later"
> > > -LICENSE:locale-base-ch-de =3D "MIT"
> > > +LICENSE:locale-base-cs-cz =3D "MIT"
> > >  LICENSE:locale-base-de-ch =3D "MIT"
> > >  LICENSE:locale-base-de-de =3D "MIT"
> > >  LICENSE:locale-base-en-gb =3D "MIT"
> > >  LICENSE:locale-base-en-us =3D "MIT"
> > >  LICENSE:locale-base-es-es =3D "MIT"
> > > +LICENSE:locale-base-fi-fi =3D "MIT"
> > >  LICENSE:locale-base-fr-fr =3D "MIT"
> > >  LICENSE:locale-base-it-it =3D "MIT"
> > >  LICENSE:locale-base-nb-no =3D "MIT"
> > >  LICENSE:locale-base-nl-nl =3D "MIT"
> > >  LICENSE:locale-base-pt-br =3D "MIT"
> > > +LICENSE:locale-base-pt-pt =3D "MIT"
> > >  LICENSE:locale-base-ru-ru =3D "MIT"
> > > +LICENSE:locale-base-sr-rs =3D "MIT"
> > >  LICENSE:locale-base-sv-se =3D "MIT"
> > >
> > > -PACKAGES =3D+ "locale-base-ch-de \
> > > +PACKAGES =3D+ "locale-base-cs-cz \
> > >               locale-base-de-ch \
> > >               locale-base-de-de \
> > >               locale-base-en-gb \
> > >               locale-base-en-us \
> > >               locale-base-es-es \
> > > +             locale-base-fi-fi \
> > >               locale-base-fr-fr \
> > >               locale-base-it-it \
> > >               locale-base-nb-no \
> > >               locale-base-nl-nl \
> > >               locale-base-pt-br \
> > > +             locale-base-pt-pt \
> > >               locale-base-ru-ru \
> > > +             locale-base-sr-rs \
> > >               locale-base-sv-se \
> > >               "
> > > -FILES:locale-base-ch-de +=3D "${datadir}/i18n/locales/musl/ch_DE.UTF=
-8"
> > > +FILES:locale-base-cs-cz +=3D "${datadir}/i18n/locales/musl/cs_CZ.UTF=
-8"
> > >  FILES:locale-base-de-ch +=3D "${datadir}/i18n/locales/musl/de_CH.UTF=
-8"
> > >  FILES:locale-base-de-de +=3D "${datadir}/i18n/locales/musl/de_DE.UTF=
-8"
> > >  FILES:locale-base-en-gb +=3D "${datadir}/i18n/locales/musl/en_GB.UTF=
-8"
> > >  FILES:locale-base-en-us +=3D "${datadir}/i18n/locales/musl/en_US.UTF=
-8"
> > >  FILES:locale-base-es-es +=3D "${datadir}/i18n/locales/musl/es_ES.UTF=
-8"
> > > +FILES:locale-base-fi-fi +=3D "${datadir}/i18n/locales/musl/fi_FI.UTF=
-8"
> > >  FILES:locale-base-fr-fr +=3D "${datadir}/i18n/locales/musl/fr_FR.UTF=
-8"
> > >  FILES:locale-base-it-it +=3D "${datadir}/i18n/locales/musl/it_IT.UTF=
-8"
> > >  FILES:locale-base-nb-no +=3D "${datadir}/i18n/locales/musl/nb_NO.UTF=
-8"
> > >  FILES:locale-base-nl-nl +=3D "${datadir}/i18n/locales/musl/nl_NL.UTF=
-8"
> > >  FILES:locale-base-pt-br +=3D "${datadir}/i18n/locales/musl/pt_BR.UTF=
-8"
> > > +FILES:locale-base-pt-pt +=3D "${datadir}/i18n/locales/musl/pt_PT.UTF=
-8"
> > >  FILES:locale-base-ru-ru +=3D "${datadir}/i18n/locales/musl/ru_RU.UTF=
-8"
> > > +FILES:locale-base-sr-rs +=3D "${datadir}/i18n/locales/musl/sr_RS.UTF=
-8"
> > >  FILES:locale-base-sv-se +=3D "${datadir}/i18n/locales/musl/sv_SE.UTF=
-8"
> > >
> > >  UPSTREAM_CHECK_COMMITS =3D "1"
> > > --
> > > 2.36.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#165700): https://lists.openembedded.org/g/openemb=
edded-core/message/165700
> > > Mute This Topic: https://lists.openembedded.org/mt/91152448/3620601
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [steve@sakoman.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

