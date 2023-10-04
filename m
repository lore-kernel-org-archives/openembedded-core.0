Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEDBE7C4EC
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 18:42:38 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.1592.1696444949133413343
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 11:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hUezdCmj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-406618d0991so997615e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 11:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696444947; x=1697049747; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jaIVvTi1HZTMNrqPopr/BIpLkwdyaiJXM0q58z8NUKg=;
        b=hUezdCmjww0FPzNwGcV+4uY0Sqh0n6kaOHAF215Mmj3K75R3gSAw9+UTLcCoUylUrP
         2P/I4M1nh3wD/oH+I1LpMrzw2MXi6bEpKZl7ekNiTTGj9cE+98wyF7yY5g7a8dVGf3hU
         +61CkeTeoVAwbkRLJg75svZIV/XsWzWkTC1Po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696444947; x=1697049747;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jaIVvTi1HZTMNrqPopr/BIpLkwdyaiJXM0q58z8NUKg=;
        b=TCQ9WRdcusoQ9qlnva3svNIj33WVmKwHFuPKFEhecU82XqmjUJKjJwnnmHzqjgae9q
         kcwpQdDrOvhKLY+sY7oQ27/qrYL3Zal1ijPNRamo8WIdtG7Blie3DZJRhy80fDA7f6XD
         +lMNpynfWxADl2sIfajMTwWxhtp+NkJZL2sQmlnfv19vM48vPdwtVrBLtJVlLTO7h2rR
         co24Z5NMJTdL4BWl7Grhmzl2PbhD0wOk6Ul+i7/rCLogEmKaKDx7cc8iWx0nE9wXBA1V
         WAbaTdSSCQdGfKS0tuKzmx0w3FpFKder5lDt6u8OUo9VZtd170l403rlWF+TvtRnObLH
         wfZw==
X-Gm-Message-State: AOJu0Yw+TOEl0DT7ZcNDRBnfVpSmDJ6V0YHTMQbWqK/8lpScObTyb3eA
	WI4aIWbUvRRYO/Sgwh9U8oUWbQ==
X-Google-Smtp-Source: AGHT+IFt3F2HYuRECUyAz7jnuinrhwy4+FYY6JjSy9WU98g431YD8wiCn+y4GQ2SJ8z8IoVxw1MuuQ==
X-Received: by 2002:a05:600c:2197:b0:405:514d:eb0e with SMTP id e23-20020a05600c219700b00405514deb0emr3141776wme.19.1696444947377;
        Wed, 04 Oct 2023 11:42:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc7c:410f:894f:7a55? ([2001:8b0:aba:5f3c:cc7c:410f:894f:7a55])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c228a00b004065d72ab19sm2174172wmf.0.2023.10.04.11.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 11:42:26 -0700 (PDT)
Message-ID: <286cafdd87626ede7916db899e1676484b79505c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-good: Provide Qt6 option
 for qmlgl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas Cord-Landwehr <cordlandwehr@kde.org>, Khem Raj
 <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 04 Oct 2023 19:42:25 +0100
In-Reply-To: <7fcb07f0-8e69-ab0e-38c6-94ff96c074f4@kde.org>
References: <20231004160911.3030063-1-cordlandwehr@kde.org>
	 <CAMKF1sqiRKyQ7sHf4-OLBkyY7XMWXbES_X7_XJPOS3fVrsRn9Q@mail.gmail.com>
	 <7fcb07f0-8e69-ab0e-38c6-94ff96c074f4@kde.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 18:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188696

On Wed, 2023-10-04 at 20:19 +0200, Andreas Cord-Landwehr wrote:
> On 04.10.23 20:10, Khem Raj wrote:
> > On Wed, Oct 4, 2023 at 9:09=E2=80=AFAM Andreas Cord-Landwehr
> > <cordlandwehr@kde.org> wrote:
> > >=20
> > > Gstreamer release 1.22.0 introduced option for Qt6 API.
> > >=20
> > > Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
> > > ---
> > >   .../gstreamer/gstreamer1.0-plugins-good_1.22.5.bb      | 10 +++++++=
+--
> > >   1 file changed, 8 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-g=
ood_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good=
_1.22.5.bb
> > > index 93f0e76ee9..ca1e1d6046 100644
> > > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2=
2.5.bb
> > > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2=
2.5.bb
> > > @@ -35,7 +35,7 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender lib=
xfixes libxdamage"
> > >   X11ENABLEOPTS =3D "-Dximagesrc=3Denabled -Dximagesrc-xshm=3Denabled=
 -Dximagesrc-xfixes=3Denabled -Dximagesrc-xdamage=3Denabled"
> > >   X11DISABLEOPTS =3D "-Dximagesrc=3Ddisabled -Dximagesrc-xshm=3Ddisab=
led -Dximagesrc-xfixes=3Ddisabled -Dximagesrc-xdamage=3Ddisabled"
> > >=20
> > > -QT5WAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "wayl=
and", "qtwayland", "", d)}"
> > > +QTWAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "wayla=
nd", "qtwayland", "", d)}"
> > >=20
> > >   PACKAGECONFIG[asm]        =3D "-Dasm=3Denabled,-Dasm=3Ddisabled,nas=
m-native"
> > >   PACKAGECONFIG[bz2]        =3D "-Dbz2=3Denabled,-Dbz2=3Ddisabled,bzi=
p2"
> > > @@ -52,7 +52,8 @@ PACKAGECONFIG[libpng]     =3D "-Dpng=3Denabled,-Dpn=
g=3Ddisabled,libpng"
> > >   PACKAGECONFIG[libv4l2]    =3D "-Dv4l2-libv4l2=3Denabled,-Dv4l2-libv=
4l2=3Ddisabled,v4l-utils"
> > >   PACKAGECONFIG[mpg123]     =3D "-Dmpg123=3Denabled,-Dmpg123=3Ddisabl=
ed,mpg123"
> > >   PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddisabled=
,pulseaudio"
> > > -PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtba=
se qtdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
> > > +PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtba=
se qtdeclarative qtbase-native ${QTWAYLANDDEPENDS}"
> > > +PACKAGECONFIG[qt6]        =3D "-Dqt6=3Denabled,-Dqt6=3Ddisabled,qtba=
se qtdeclarative qtbase-native qttools-native ${QTWAYLANDDEPENDS}"
> > >   PACKAGECONFIG[soup2]      =3D "-Dsoup=3Denabled,,libsoup-2.4,,,soup=
3"
> > >   PACKAGECONFIG[soup3]      =3D "-Dsoup=3Denabled,,libsoup,,,soup2"
> > >   PACKAGECONFIG[speex]      =3D "-Dspeex=3Denabled,-Dspeex=3Ddisabled=
,speex"
> > > @@ -79,3 +80,8 @@ EXTRA_OEMESON +=3D " \
> > >   "
> > >=20
> > >   FILES:${PN}-equalizer +=3D "${datadir}/gstreamer-1.0/presets/*.prs"
> > > +
> > > +do_configure:prepend() {
> > > +    # provide path to qtwaylandscanner
> > > +    export PATH=3D${PATH}:${STAGING_DIR_NATIVE}/${libexecdir}
> >=20
> > perhaps we should fix naitve qt6 to install qtwaylandscanner in native
> > bindir. Then we do not need this.
>=20
> Hi, I brought this up recently in a different discussion
>=20
> https://bugreports.qt.io/browse/QTBUG-116998
>=20
> My understanding is that the move was deliberate and the expectation is=
=20
> that everybody uses the CMake macros with internal path logic; however,=
=20
> that fails when not using CMake like here with Meson.

There isn't anything stopping OE from symlinking it in it's recipe?

Cheers,

Richard

