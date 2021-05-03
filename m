Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.31013.1620031549666622562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 01:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jHbiZ6/i;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id i3so5401546edt.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 01:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UOlcTj7sz20OecqQbA7vChxRKfHN29ra6q7L5NMvS3g=;
        b=jHbiZ6/i8GAxBBdGooR9Hasl0xkCWoTxHsMp/Z0/l9tZwU8rbrpdRFJJ21heUPtJ/8
         n/JJflkFB2M3aNvITgH1ldf4hTSe1BCsixWPak6ZzAC7EIjMwj+6EFomagkmxmsSlYLB
         ERV5Bodn7HtdU735lOw6C6aUC0UmxWzN32n8DYkNJEUlcPRWqBVOJV7bUeSc75I1SeKF
         M6afOxD/3qwHO7dtZicBLIgz5oRORJOWRbBDLX1hrHjprnIymz7aLV6+kdQb8iKN0Yga
         IwKf9ZcxlhygIl8bYDArNORNlj3p+H2QTcEPVZQpEDKVZ4wLZszkEAMPFXRBe7HTnNNl
         aCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UOlcTj7sz20OecqQbA7vChxRKfHN29ra6q7L5NMvS3g=;
        b=KXdrJaP9kdovF5rIFjeJ/UNSY0MlRtzwqBj7BoxNNiAW7uOqZyx3Z8mX2EchmHwtjx
         emwoDdSRm2SbegzBhVGJ1RPi1ynwqbWrYR8haRImd7irEA4j7rytauR29XaoK0BZJnv8
         Sz6Sw62suyIHlGUS6AGh3GneQg59kYtFjPBGPnlgSbcMQ2xyPt3xH6Cf3CFdsc96kmOf
         LRn/hXI8UBqBKjmPBO2wmOUQ94vjCP1cWzVCYk2Gx15DNYFKuvrmhLVXrO5k91iatpjc
         RV7zZgRi/NLzrKypoinJzz3ylGXbEloU6cKIEqMx09NjXuPttCiM10kSbpVqo/smwIHe
         B8uQ==
X-Gm-Message-State: AOAM530zgaDbfKNYUfXQ+rp/UljUFmBa2cmpLgFO3ow88RHhpPW6L2vp
	ZmtO59NVCJEmx5nhMKajl9NSh4PzUEbsMzg1IDk=
X-Google-Smtp-Source: ABdhPJyfa/gW372e+aYB3bS+S/E3MSzFzHsm8GzR7Ku/K9mqVegDEtFScN1NNA+dzIQnKJkT7P08hvgql7ctna+3z2Y=
X-Received: by 2002:aa7:c7c5:: with SMTP id o5mr18598248eds.31.1620031548132;
 Mon, 03 May 2021 01:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210502175441.368688-1-quaresma.jose@gmail.com>
 <20210502175441.368688-2-quaresma.jose@gmail.com> <4409d6ac-7f54-364b-efde-eb7569c5e067@gmail.com>
In-Reply-To: <4409d6ac-7f54-364b-efde-eb7569c5e067@gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Mon, 3 May 2021 09:47:04 +0100
Message-ID: <CANPvuRm6aKEA7+75yQKiMgHzMfEW491wed2aqd5x2DGz-G2uMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] gstreamer1.0: rename pacthes
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

right, i will fix it.

Jose

Khem Raj <raj.khem@gmail.com> escreveu no dia domingo, 2/05/2021 =C3=A0(s)=
 21:40:
>
> there is typo in subject.
>
> On 5/2/21 10:54 AM, Jose Quaresma wrote:
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >   ...ests-seek-Don-t-use-too-strict-timeout-for-validati.patch} | 0
> >   ....patch =3D> 0004-meson-Add-option-for-installed-tests.patch} | 0
> >   meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb      | 4 ++=
--
> >   3 files changed, 2 insertions(+), 2 deletions(-)
> >   rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0001-tests-se=
ek-Don-t-use-too-strict-timeout-for-validati.patch =3D> 0003-tests-seek-Don=
-t-use-too-strict-timeout-for-validati.patch} (100%)
> >   rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0003-meson-Ad=
d-option-for-installed-tests.patch =3D> 0004-meson-Add-option-for-installed=
-tests.patch} (100%)
> >
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests=
-seek-Don-t-use-too-strict-timeout-for-validati.patch b/meta/recipes-multim=
edia/gstreamer/gstreamer1.0/0003-tests-seek-Don-t-use-too-strict-timeout-fo=
r-validati.patch
> > similarity index 100%
> > rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-=
seek-Don-t-use-too-strict-timeout-for-validati.patch
> > rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-tests-se=
ek-Don-t-use-too-strict-timeout-for-validati.patch
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson=
-Add-option-for-installed-tests.patch b/meta/recipes-multimedia/gstreamer/g=
streamer1.0/0004-meson-Add-option-for-installed-tests.patch
> > similarity index 100%
> > rename from meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-meson-=
Add-option-for-installed-tests.patch
> > rename to meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-meson-Ad=
d-option-for-installed-tests.patch
> > diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
> > index 8562070968..b275a3430b 100644
> > --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.4.bb
> > @@ -18,8 +18,8 @@ S =3D "${WORKDIR}/gstreamer-${PV}"
> >   SRC_URI =3D "https://gstreamer.freedesktop.org/src/gstreamer/gstream=
er-${PV}.tar.xz \
> >              file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-=
not-fal.patch \
> >              file://0002-Remove-unused-valgrind-detection.patch \
> > -           file://0003-meson-Add-option-for-installed-tests.patch \
> > -           file://0001-tests-seek-Don-t-use-too-strict-timeout-for-va=
lidati.patch \
> > +           file://0003-tests-seek-Don-t-use-too-strict-timeout-for-va=
lidati.patch \
> > +           file://0004-meson-Add-option-for-installed-tests.patch \
> >              "
> >   SRC_URI[sha256sum] =3D "9aeec99b38e310817012aa2d1d76573b787af47f8a72=
5a65b833880a094dfbc5"
> >
> >
> >
> >
> >=20
> >



--=20
Best regards,

Jos=C3=A9 Quaresma
