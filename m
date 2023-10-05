Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6CEE9272D
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 19:27:42 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.25016.1696534052265792883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 12:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FPpdyfAz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4060b623e64so8819155e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 12:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696534050; x=1697138850; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U6XKJwFboJr7J+VfQJ5njqCcYbJe0WC1/G5PHfJxiPc=;
        b=FPpdyfAzxFnmNT/pUS+CrNJA2Z3LeZM1a/uNKXjytXKreaS4jRAirCYjumoESyDI47
         uUzqWh38zHHV0atV+WivVGDd4VFz38qs14l80yMjef2BhOpqbE49Q/MH16+MbHzskfkq
         IOhRtDTt9FtdnWPS9vAjHIqNBbakAjmlgWEpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696534050; x=1697138850;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U6XKJwFboJr7J+VfQJ5njqCcYbJe0WC1/G5PHfJxiPc=;
        b=h6qvHH5NM9MqIdNdtdTSSDqnvKaO0563VZ6AcG29tmhcfM9gw+FAesMT3W9KyTxca7
         mQ2O8MtGFKADqIiK2vHsaswBzuIBmyd3yHhILWq4YzfwJJAMLgfbvZQ7hThSbLZp5VUW
         hhgSYRLGixHABUVS9qy0DHf6iHkCQdGjtckEAlPjqigyQ/stjioz8mQqDxf9pPvmhsbT
         PrrhLZZo1XcGowpLcTT48n4HV6Kaxj3ZuLIuHKOVNKRlmrYgAld8weI7yaL+6WYIUCXJ
         va2CnJu5ppwWi1Rmt/qTJqZrYbaCLrP2N3Jk7S4Qn92Re4RdLYLflUqE6GJUJW/GJnZx
         nQbw==
X-Gm-Message-State: AOJu0YzDwHWhSgBGbCIVX2VRZW9iByMooY2LVoVodnlYON6m4KpVif4L
	vmjdfQTETHz2mu6iP8BpHBDlLw==
X-Google-Smtp-Source: AGHT+IHvEcOac93LIQTuTP9FpeJJDPoCvyMxBuxDjzfiO9agnnv2FVesZSUOmjB+aJb3y27e99Dviw==
X-Received: by 2002:a05:600c:205a:b0:405:784a:d53e with SMTP id p26-20020a05600c205a00b00405784ad53emr2629559wmg.20.1696534050565;
        Thu, 05 Oct 2023 12:27:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2964:cec5:fab8:2212? ([2001:8b0:aba:5f3c:2964:cec5:fab8:2212])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c230b00b004053a6b8c41sm2172357wmo.12.2023.10.05.12.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 12:27:30 -0700 (PDT)
Message-ID: <c8566a503c49903303cbae463b33e775a16ba0b3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-good: Provide Qt6 option
 for qmlgl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas Cord-Landwehr <cordlandwehr@kde.org>, Khem Raj
 <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 05 Oct 2023 20:27:27 +0100
In-Reply-To: <ad4a6362-22ff-f53c-3742-e66ccb8d7183@kde.org>
References: <20231004160911.3030063-1-cordlandwehr@kde.org>
	 <CAMKF1sqiRKyQ7sHf4-OLBkyY7XMWXbES_X7_XJPOS3fVrsRn9Q@mail.gmail.com>
	 <7fcb07f0-8e69-ab0e-38c6-94ff96c074f4@kde.org>
	 <286cafdd87626ede7916db899e1676484b79505c.camel@linuxfoundation.org>
	 <ad4a6362-22ff-f53c-3742-e66ccb8d7183@kde.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 19:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188733

On Thu, 2023-10-05 at 21:22 +0200, Andreas Cord-Landwehr wrote:
> On 04.10.23 20:42, Richard Purdie wrote:
> > On Wed, 2023-10-04 at 20:19 +0200, Andreas Cord-Landwehr wrote:
> > > On 04.10.23 20:10, Khem Raj wrote:
> > > > On Wed, Oct 4, 2023 at 9:09=E2=80=AFAM Andreas Cord-Landwehr
> > > > <cordlandwehr@kde.org> wrote:
> > > > >=20
> > > > > Gstreamer release 1.22.0 introduced option for Qt6 API.
> > > > >=20
> > > > > Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
> > > > > ---
> > > > >    .../gstreamer/gstreamer1.0-plugins-good_1.22.5.bb      | 10 ++=
++++++--
> > > > >    1 file changed, 8 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugi=
ns-good_1.22.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-=
good_1.22.5.bb
> > > > > index 93f0e76ee9..ca1e1d6046 100644
> > > > > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good=
_1.22.5.bb
> > > > > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good=
_1.22.5.bb
> > > > > @@ -35,7 +35,7 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender=
 libxfixes libxdamage"
> > > > >    X11ENABLEOPTS =3D "-Dximagesrc=3Denabled -Dximagesrc-xshm=3Den=
abled -Dximagesrc-xfixes=3Denabled -Dximagesrc-xdamage=3Denabled"
> > > > >    X11DISABLEOPTS =3D "-Dximagesrc=3Ddisabled -Dximagesrc-xshm=3D=
disabled -Dximagesrc-xfixes=3Ddisabled -Dximagesrc-xdamage=3Ddisabled"
> > > > >=20
> > > > > -QT5WAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "=
wayland", "qtwayland", "", d)}"
> > > > > +QTWAYLANDDEPENDS =3D "${@bb.utils.contains("DISTRO_FEATURES", "w=
ayland", "qtwayland", "", d)}"
> > > > >=20
> > > > >    PACKAGECONFIG[asm]        =3D "-Dasm=3Denabled,-Dasm=3Ddisable=
d,nasm-native"
> > > > >    PACKAGECONFIG[bz2]        =3D "-Dbz2=3Denabled,-Dbz2=3Ddisable=
d,bzip2"
> > > > > @@ -52,7 +52,8 @@ PACKAGECONFIG[libpng]     =3D "-Dpng=3Denabled,=
-Dpng=3Ddisabled,libpng"
> > > > >    PACKAGECONFIG[libv4l2]    =3D "-Dv4l2-libv4l2=3Denabled,-Dv4l2=
-libv4l2=3Ddisabled,v4l-utils"
> > > > >    PACKAGECONFIG[mpg123]     =3D "-Dmpg123=3Denabled,-Dmpg123=3Dd=
isabled,mpg123"
> > > > >    PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddis=
abled,pulseaudio"
> > > > > -PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,=
qtbase qtdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
> > > > > +PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,=
qtbase qtdeclarative qtbase-native ${QTWAYLANDDEPENDS}"
> > > > > +PACKAGECONFIG[qt6]        =3D "-Dqt6=3Denabled,-Dqt6=3Ddisabled,=
qtbase qtdeclarative qtbase-native qttools-native ${QTWAYLANDDEPENDS}"
> > > > >    PACKAGECONFIG[soup2]      =3D "-Dsoup=3Denabled,,libsoup-2.4,,=
,soup3"
> > > > >    PACKAGECONFIG[soup3]      =3D "-Dsoup=3Denabled,,libsoup,,,sou=
p2"
> > > > >    PACKAGECONFIG[speex]      =3D "-Dspeex=3Denabled,-Dspeex=3Ddis=
abled,speex"
> > > > > @@ -79,3 +80,8 @@ EXTRA_OEMESON +=3D " \
> > > > >    "
> > > > >=20
> > > > >    FILES:${PN}-equalizer +=3D "${datadir}/gstreamer-1.0/presets/*=
.prs"
> > > > > +
> > > > > +do_configure:prepend() {
> > > > > +    # provide path to qtwaylandscanner
> > > > > +    export PATH=3D${PATH}:${STAGING_DIR_NATIVE}/${libexecdir}
> > > >=20
> > > > perhaps we should fix naitve qt6 to install qtwaylandscanner in nat=
ive
> > > > bindir. Then we do not need this.
> > >=20
> > > Hi, I brought this up recently in a different discussion
> > >=20
> > > https://bugreports.qt.io/browse/QTBUG-116998
> > >=20
> > > My understanding is that the move was deliberate and the expectation =
is
> > > that everybody uses the CMake macros with internal path logic; howeve=
r,
> > > that fails when not using CMake like here with Meson.
> >=20
> > There isn't anything stopping OE from symlinking it in it's recipe?
> >=20
> > Cheers,
> >=20
> > Richard
>=20
> Hi Richard,
>=20
> thanks for you answer! Since qtwayland is part of meta-qt6, do I get=20
> your comment correct that you suggest creating a symlink
> /usr/bin/qtwaylandscanner -> /usr/libexec/qtwaylandscanner
> for the gstreamer1.0-plugins-good recipe or do you have patching of=20
> qtwayland in mind?

I was suggesting you ask meta-qt6 about the idea of the symlink in
their recipe. I didn't know if meta-qt6 was being handled by qt.io or
not though. I may have misunderstood and it is the meta-qt6 people
saying gstreamer are doing it "wrong" in which case this is indeed more
tricky :(.

Cheers,

Richard

