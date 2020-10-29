Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web08.5289.1604012071174564257
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 15:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SYtW/LDD;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id u62so5494695iod.8
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 15:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tN7/W2A39+q2x37gqAX+LFpQ7KrK/u/iO46/E7+XFVQ=;
        b=SYtW/LDDws6GEubsaS8gR4d8wjM0zIw8BdmxBeF8bi8RlXtad9IMo+FoJLhHuiO2C4
         tsARwWPwa+UCWERLuApbuxNPzcj+fs1/6LUgbjl3X3Zim1v4eVUN6LGr0vOkLDTT7IkA
         /DL9ltSk54yeuB4AyNyUuKpxmnNm55FDcPQOWMqmpCtOuEC6SnYogaiMYuNiPcz2nc3J
         bJxsp6TzlHGs5rN5rFa2EET1ZCz5IZ3tzzxM0a1BSjpn3hJyJa5J7r8G5yQp1Sbmc0N0
         uQ6JY+Y49Rf6hnc9aoN5F5yh7DNh4LAAvlChtSqAW9IPZKPf+MRBdw01x//HD6qnijmQ
         gDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tN7/W2A39+q2x37gqAX+LFpQ7KrK/u/iO46/E7+XFVQ=;
        b=ToutJR8YHfki4eu9yBv+h9h5KgZLxbmVFm5Vl1itHmM1ZdjJNDZ8ZNMTmzoMBfZnkn
         vg7aNLU/szZLTTz5hnbLJomP/AhIfFvawpPV21lff+gdMttJ45/+XI2dWHhFOkZyccIf
         vqW1mdeAutoB0z48z9KzIscGzijQcH71UmKDKiZn5WHkO52lhBKsFbPwhCMlF3Q91pBP
         JfBOcX0UeuIlOli7zBYfUCN6Lp8/6LTNwUYP3+060mYildI1VIbxR57Okeksv7+C1et+
         o9XSI64MoRj3MSanQ5/ZScgJygOm+e+rZJ6MOg9CvUaibIjtlF+jvG3fVPQdE76x7kYq
         P+/A==
X-Gm-Message-State: AOAM531geA98Nh+QE03EuHiWfYjvHYNObKKJdsdiNqaIfLJ6ZKnn4Dfd
	oljNoGgIVVa9iXzPrZ8jc6JgT8tAargySNwEGSg=
X-Google-Smtp-Source: ABdhPJzJxxAb2e92dCiawi00BLKUQHAMtRqzFblvs6+2wEMhhLXIP81BsGQUzYHz5xK6v7aIpUBSru8mD4+zKYXu6VA=
X-Received: by 2002:a05:6638:a11:: with SMTP id 17mr5786926jan.59.1604012070490;
 Thu, 29 Oct 2020 15:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
 <20201029142806.1830504-6-quaresma.jose@gmail.com> <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
 <1642964F5C513D13.27950@lists.openembedded.org>
In-Reply-To: <1642964F5C513D13.27950@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 29 Oct 2020 22:54:30 +0000
Message-ID: <CANPvuRniBbvN95cbzZ=Wk8RYABjq75YtPSFPF=ypH4qW8wKLpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 05/22] gstreamer1.0-plugins-good: upgrade to version 1.18.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't understand that!

The logs from
https://errors.yoctoproject.org/Errors/Details/510826/
Have meson asm enabled [-Dasm=3Denabled] and this option pulls nasm as
dependency in [PATCH v5 07/22]

[PATCH v5 07/22] gstreamer1.0-plugins-good: add new meson option as
PACKAGECONFIG

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1=
.18.0.bb
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.bb
index ad3eabd0be..860b31106f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.b=
b
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.0.b=
b
@@ -20,6 +20,7 @@ RPROVIDES_${PN}-soup +=3D "${PN}-souphttpsrc"
 PACKAGECONFIG ??=3D " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
+    ${@bb.utils.contains('TUNE_FEATURES', 'm64', 'asm', '', d)} \
     bz2 cairo flac gdk-pixbuf gudev jpeg lame libpng mpg123 soup
speex taglib v4l2 \
 "

@@ -27,6 +28,7 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender
libxfixes libxdamage"
 X11ENABLEOPTS =3D "-Dximagesrc=3Denabled -Dximagesrc-xshm=3Denabled
-Dximagesrc-xfixes=3Denabled -Dximagesrc-xdamage=3Denabled"
 X11DISABLEOPTS =3D "-Dximagesrc=3Ddisabled -Dximagesrc-xshm=3Ddisabled
-Dximagesrc-xfixes=3Ddisabled -Dximagesrc-xdamage=3Ddisabled"

+PACKAGECONFIG[asm]        =3D "-Dasm=3Denabled,-Dasm=3Ddisabled,nasm"
 PACKAGECONFIG[bz2]        =3D "-Dbz2=3Denabled,-Dbz2=3Ddisabled,bzip2"
 PACKAGECONFIG[cairo]      =3D "-Dcairo=3Denabled,-Dcairo=3Ddisabled,cairo=
"

Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
quinta, 29/10/2020 =C3=A0(s) 22:14:
>
> I need to check what's append with this
>
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> quinta, 29/10/2020 =C3=A0(s) 16:06:
> >
> > On Thu, 2020-10-29 at 14:27 +0000, Jose Quaresma wrote:
> > >     * 0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patc=
h
> > >       Removed since these are included in 1.18.0
> > >
> > > License-Update: remove file://common/coverage/coverage-report.pl
> > > Upstream dont have it any more.
> > >
> > > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > > ---
> > >  ...defines-GLsync-to-fix-compile-on-som.patch | 70 ---------------
> > > ----
> > >  ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |  8 +--
> > >  ...bb =3D> gstreamer1.0-plugins-good_1.18.0.bb} | 14 ++--
> > >  3 files changed, 10 insertions(+), 82 deletions(-)
> > >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-
> > > plugins-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-
> > > som.patch
> > >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-
> > > good_1.16.2.bb =3D> gstreamer1.0-plugins-good_1.18.0.bb} (84%)
> >
> > Thanks for the updated series, I put it in for testing and this time
> > we're seeing:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/1305
> >
> > nasm seems to be needed by plugins-good but is missing?
> >
> > Cheers,
> >
> > Richard
> >
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>
>=20
>


--=20
best regards,
Jos=C3=A9 Quaresma
