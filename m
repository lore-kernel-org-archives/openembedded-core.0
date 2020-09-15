Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.14970.1600180733377549145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ep4t1yHB;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id m6so3649202wrn.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 07:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Y4td0hs0KYLi5EwcJiveoEPyJrZxrALKwzxjUaBKf8g=;
        b=ep4t1yHB1aGqjT/U+TaXBBDdFTnIA+hWXNclFbDAOwE/WC3urXn1/LO6lI901vSFdZ
         NYT6tVYx6rV8+wSTTi2DLxzvzrg2n7mT3S+cJs8hf2zUoI9DzIXPWmN8kqcKMIaumrWV
         +iqwuVhkgf2x39EGZm5lpQo4ddyYCvGWK+0XPqq3wAaqYOBR/3GKI782w7Qo/OTGwMEL
         Rp9FhH7BtUisMmk9fJLjWzZ4mY9/umah6gIdS2S0Y9SJZbvk8xfVcQ9RsYxoUO07riM4
         hk3tOU3+iZgbILC+hiy6O87BJzhunfaNfPX33+gRI66CWYC60Avv9ZtdORNa5WlQvtwb
         cO1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Y4td0hs0KYLi5EwcJiveoEPyJrZxrALKwzxjUaBKf8g=;
        b=ioiuZ7b3EUD5ICAHo5pZU1NsjWsEtOuimFTDKR3WCpCchzRVFreEBw5aVAWWGzkP4d
         BHWQBq7l14M6O8qSvzoEIvv/K9Btq75QAif61XtbJstwv8kkNzQwvWbMQ/ZZ86IJH8Uq
         5OeNR4jE6hWjneIPgJwDS/uzI1JrFa+YFWvYRnLmChQBfTTEAYy+6iNKJ0XKwkCv2Gyt
         +j7C8Ne1yvedBZYimdcGqkSRHC4jJ0HTMoKNFyNlwUGr59RpjccXUuOIM8i7G6gMGUCn
         kOA1U3hOzdQQo5mNRnoyuToDcChWA1F4i5oD4lPk12j5wM1CFpxr0z5TWHqn+Vb6eptE
         yOcA==
X-Gm-Message-State: AOAM5331Zrex/lSmSvjoT0wyJgWlD4BZbi2zbtg8ot+hoUnuDVZWYD6a
	yznlSv3swVUcPLeHuJIyBos=
X-Google-Smtp-Source: ABdhPJzPycmB6XLzChsEC4X+8hjUZMg21n4PCKzMLjdjdkJOSS4zcFBLObPZM4F5HPHnLJVgqJrJ+g==
X-Received: by 2002:a5d:67d2:: with SMTP id n18mr21607018wrw.223.1600180731397;
        Tue, 15 Sep 2020 07:38:51 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 2sm18976954wmf.25.2020.09.15.07.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 07:38:50 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Sep 2020 16:38:49 +0200
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH 0/5] ARMv8 Tune reorg
Message-ID: <20200915143849.v2s2davmicoeull3@jama>
References: <20200914151359.11240-1-jon.mason@arm.com>
 <CA+chaQfAL+mvyG7smtku8za+6fvubybjjpOfu+g6dGfrJSoWJA@mail.gmail.com>
 <CAPoiz9wQ684w=CDhKpQdcLG5K-4fmJ=dF_-Oi39PqsHbxeX9Rw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPoiz9wQ684w=CDhKpQdcLG5K-4fmJ=dF_-Oi39PqsHbxeX9Rw@mail.gmail.com>
X-Groupsio-MsgNum: 142591
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y2ctvtukov63e6ct"
Content-Disposition: inline

--y2ctvtukov63e6ct
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2020 at 06:54:14PM -0400, Jon Mason wrote:
> On Mon, Sep 14, 2020 at 11:32 AM Martin Jansa <martin.jansa@gmail.com> w=
rote:
> >
> > > This reduces the number of files from 12 to 2 for ARMv8a, and that i=
s excluding the 13 I am adding in this series that would otherwise be uniqu=
e files.
> >
> > I don't have a strong opinion on this anymore, but is the number of th=
e include files the issue here?
>=20
> This is the reason why I'm doing it.  Arm needs to support all the
> cortex-a and cortex-m cores.  This would make the majority of the tune
> files for only Arm cores.  We could move them into
> meta/conf/machine/include/arm and not make the level down directory so
> messy, but I think this is cleaner.
>=20
> > I think the issue is the number of possible combinations and using the=
 same TUNE_PKGARCH for different tunes (unlike 32bit arm tune files which u=
se different). Bundling all these combinations in fewer include files doesn=
't IMHO improve it.
>=20
> The multitude of combinations and redundancy code entries makes it
> very error prone.  By putting them all in the same file, it makes it
> much easier to see the differences in entries and catch errors.

It does make it easier? In my experience it's more difficult to compare
very similar long sections in different parts of the same file, than
comparing very similar files with diff.
When working on
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune=
-test
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune=
2-test
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/tune=
3
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/optd=
efaulttune
long time ago, I found it really convenient to compare all cortex*.inc
files just by replacing the number with some placeholder and comparing
the resulting files (which were in most cases identical) - doing the
same inside single file just makes it more complicated, probably by
first splitting the various sections back to separate files again.

> Longer term, I'd like to see something that removes the redundancies
> completely, but it will take some work.

So now all BSPs need to adapt (by changing from the more specific .inc
file corresponding to the actual CPU in MACHINE they implement to
generic family .inc while setting one of the possible DEFAULTTUNE,
instead of leaving the default from .inc file), but all this only
for the dubious benefit of having fewer .inc files in oe-core, right?

> > With 32bit arm include files it was useful to be able to compare vario=
us include files to check that they follow the same "structure" (or to add =
new cortexa* one by copying existing and regex-replace).
> >
> > Also AVAILTUNES will now contain all possible tunes from given family =
(which makes it almost useless for aarch64 tunes). So instead of BSP includ=
ing .inc file corresponding with the core used in the MACHINE and getting s=
ome "sane" default DEFAULTTUNE (plus some other possible options listed in =
AVAILTUNES) we now force every BSP to set more specific DEFAULTTUNE and the=
n let user figure out what other DEFAULTTUNEs might be compatible with it, =
e.g. when someone is doing multi MACHINE builds and wants to share TUNE_PKG=
ARCH between them (to save build time, package feed size etc).
>=20
> You can still set a generic default for all the machines of a given
> family.  By including armv8a.inc, you still get 'DEFAULTTUNE ?=3D
> "armv8a-crc"'.  This will allow for a generic for an entire family.
> I'm not seeing the issue.

OK, with e.g. raspberrypi4-64.conf from
https://github.com/agherzan/meta-raspberrypi/blob/a4c8118676ba8002edab29fc=
81b4e4edd9fad1f1/conf/machine/raspberrypi4-64.conf
which just
require conf/machine/include/tune-cortexa72.inc

Without your patches:
DEFAULTTUNE=3D"cortexa72"
TUNE_PKGARCH=3D"cortexa72"
TUNE_CCARGS=3D" -mcpu=3Dcortex-a72+crc+crypto"
AVAILTUNES=3D" armv4 armv4t armv4b armv4tb armv5 armv5t armv5-vfp
armv5t-vfp armv5hf-vfp armv5thf-vfp armv5b armv5tb armv5b-vfp
armv5tb-vfp armv5hfb-vfp armv5thfb-vfp armv5e armv5te armv5e-vfp
armv5te-vfp armv5ehf-vfp armv5tehf-vfp armv5eb armv5teb armv5eb-vfp
armv5teb-vfp armv5ehfb-vfp armv5tehfb-vfp armv6-novfp armv6t-novfp armv6
armv6t armv6hf armv6thf armv6b-novfp armv6tb-novfp armv6b armv6tb
armv6hfb armv6thfb armv7a armv7at armv7a-vfpv3d16 armv7at-vfpv3d16
armv7a-vfpv3 armv7at-vfpv3 armv7a-vfpv4d16 armv7at-vfpv4d16 armv7a-neon
armv7at-neon armv7a-neon-vfpv4 armv7at-neon-vfpv4 armv7ahf armv7athf
armv7ahf-vfpv3d16 armv7athf-vfpv3d16 armv7ahf-vfpv3 armv7athf-vfpv3
armv7ahf-vfpv4d16 armv7athf-vfpv4d16 armv7ahf-neon armv7athf-neon
armv7ahf-neon-vfpv4 armv7athf-neon-vfpv4 armv7ab armv7atb
armv7ab-vfpv3d16 armv7atb-vfpv3d16 armv7ab-vfpv3 armv7atb-vfpv3
armv7ab-vfpv4d16 armv7atb-vfpv4d16 armv7ab-neon armv7atb-neon
armv7ab-neon-vfpv4 armv7atb-neon-vfpv4 armv7ahfb armv7athfb
armv7ahfb-vfpv3d16 armv7athfb-vfpv3d16 armv7ahfb-vfpv3 armv7athfb-vfpv3
armv7ahfb-vfpv4d16 armv7athfb-vfpv4d16 armv7ahfb-neon armv7athfb-neon
armv7ahfb-neon-vfpv4 armv7athfb-neon-vfpv4 armv7ve armv7vet
armv7ve-vfpv3d16 armv7vet-vfpv3d16 armv7ve-vfpv3 armv7vet-vfpv3
armv7ve-vfpv4d16 armv7vet-vfpv4d16 armv7ve-neon armv7vet-neon
armv7ve-neon-vfpv4 armv7vet-neon-vfpv4 armv7vehf armv7vethf
armv7vehf-vfpv3d16 armv7vethf-vfpv3d16 armv7vehf-vfpv3 armv7vethf-vfpv3
armv7vehf-vfpv4d16 armv7vethf-vfpv4d16 armv7vehf-neon armv7vethf-neon
armv7vehf-neon-vfpv4 armv7vethf-neon-vfpv4 armv7veb armv7vetb
armv7veb-vfpv3d16 armv7vetb-vfpv3d16 armv7veb-vfpv3 armv7vetb-vfpv3
armv7veb-vfpv4d16 armv7vetb-vfpv4d16 armv7veb-neon armv7vetb-neon
armv7veb-neon-vfpv4 armv7vetb-neon-vfpv4 armv7vehfb armv7vethfb
armv7vehfb-vfpv3d16 armv7vethfb-vfpv3d16 armv7vehfb-vfpv3
armv7vethfb-vfpv3 armv7vehfb-vfpv4d16 armv7vethfb-vfpv4d16
armv7vehfb-neon armv7vethfb-neon armv7vehfb-neon-vfpv4
armv7vethfb-neon-vfpv4 aarch64 aarch64_be armv8a armv8a-crc
armv8a-crc-crypto armv8a-crypto cortexa72"

With your patches:
ERROR: ParseError at /OE/build/oe-core/meta-raspberrypi/conf/machine/raspb=
errypi4-64.conf:13: Could not include required file conf/machine/include/tu=
ne-cortexa72.inc

After changing the require to conf/machine/include/arm/arch-armv8a.inc:
DEFAULTTUNE=3D"armv8a-crc"
TUNE_PKGARCH=3D"armv8a"
TUNE_CCARGS=3D" -march=3Darmv8-a+crc"
AVAILTUNES=3D" cortexa32 cortexa32-crypto cortexa34 cortexa34-crypto
cortexa35 cortexa35-crypto cortexa53 cortexa53-crypto cortexa57
cortexa57-crypto cortexa72 cortexa73 thunderx thunderx_be
cortexa57-cortexa53 cortexa72-cortexa53 cortexa72-cortexa53-crypto
cortexa73-cortexa35 cortexa73-cortexa35-crypto cortexa73-cortexa53
cortexa73-cortexa53-crypto armv4 armv4t armv4b armv4tb armv5 armv5t
armv5-vfp armv5t-vfp armv5hf-vfp armv5thf-vfp armv5b armv5tb armv5b-vfp
armv5tb-vfp armv5hfb-vfp armv5thfb-vfp armv5e armv5te armv5e-vfp
armv5te-vfp armv5ehf-vfp armv5tehf-vfp armv5eb armv5teb armv5eb-vfp
armv5teb-vfp armv5ehfb-vfp armv5tehfb-vfp armv6-novfp armv6t-novfp armv6
armv6t armv6hf armv6thf armv6b-novfp armv6tb-novfp armv6b armv6tb
armv6hfb armv6thfb armv7a armv7at armv7a-vfpv3d16 armv7at-vfpv3d16
armv7a-vfpv3 armv7at-vfpv3 armv7a-vfpv4d16 armv7at-vfpv4d16 armv7a-neon
armv7at-neon armv7a-neon-vfpv4 armv7at-neon-vfpv4 armv7ahf armv7athf
armv7ahf-vfpv3d16 armv7athf-vfpv3d16 armv7ahf-vfpv3 armv7athf-vfpv3
armv7ahf-vfpv4d16 armv7athf-vfpv4d16 armv7ahf-neon armv7athf-neon
armv7ahf-neon-vfpv4 armv7athf-neon-vfpv4 armv7ab armv7atb
armv7ab-vfpv3d16 armv7atb-vfpv3d16 armv7ab-vfpv3 armv7atb-vfpv3
armv7ab-vfpv4d16 armv7atb-vfpv4d16 armv7ab-neon armv7atb-neon
armv7ab-neon-vfpv4 armv7atb-neon-vfpv4 armv7ahfb armv7athfb
armv7ahfb-vfpv3d16 armv7athfb-vfpv3d16 armv7ahfb-vfpv3 armv7athfb-vfpv3
armv7ahfb-vfpv4d16 armv7athfb-vfpv4d16 armv7ahfb-neon armv7athfb-neon
armv7ahfb-neon-vfpv4 armv7athfb-neon-vfpv4 armv7ve armv7vet
armv7ve-vfpv3d16 armv7vet-vfpv3d16 armv7ve-vfpv3 armv7vet-vfpv3
armv7ve-vfpv4d16 armv7vet-vfpv4d16 armv7ve-neon armv7vet-neon
armv7ve-neon-vfpv4 armv7vet-neon-vfpv4 armv7vehf armv7vethf
armv7vehf-vfpv3d16 armv7vethf-vfpv3d16 armv7vehf-vfpv3 armv7vethf-vfpv3
armv7vehf-vfpv4d16 armv7vethf-vfpv4d16 armv7vehf-neon armv7vethf-neon
armv7vehf-neon-vfpv4 armv7vethf-neon-vfpv4 armv7veb armv7vetb
armv7veb-vfpv3d16 armv7vetb-vfpv3d16 armv7veb-vfpv3 armv7vetb-vfpv3
armv7veb-vfpv4d16 armv7vetb-vfpv4d16 armv7veb-neon armv7vetb-neon
armv7veb-neon-vfpv4 armv7vetb-neon-vfpv4 armv7vehfb armv7vethfb
armv7vehfb-vfpv3d16 armv7vethfb-vfpv3d16 armv7vehfb-vfpv3
armv7vethfb-vfpv3 armv7vehfb-vfpv4d16 armv7vethfb-vfpv4d16
armv7vehfb-neon armv7vethfb-neon armv7vehfb-neon-vfpv4
armv7vethfb-neon-vfpv4 aarch64 aarch64_be armv8a armv8a-crc
armv8a-crc-crypto armv8a-crypto"

Should really raspberrypi4-64 users see e.g. cortexa73-cortexa35-crypto
in AVAILTUNES even when it doesn't make sense for their HW?

> > On Mon, Sep 14, 2020 at 5:14 PM Jon Mason <jdmason@kudzu.us> wrote:
> >>
> >> There is a large number of Arm Tune files located in
> >> meta/conf/machine/include/, and to support the current and upcoming A=
rm
> >> cores, more are needed.  Adding more files is simply going to make it
> >> harder to find the relevant ones for an OE/YP developer/user.  Also,
> >> there are problems with stale and erroneous configs (see my previous
> >> series), which will only be exacerbated by having more files.
> >>
> >> I am proposing a reorganization of the existing tune files by includi=
ng
> >> them in the generic family include file.  For example, the
> >> tune-cortexa55.inc would be moved into arch-armv8-2a.inc, and
> >> tune-cortexa57.inc would be moved into arch-armv8a.inc.  This reduces
> >> the number of files from 12 to 2 for ARMv8a, and that is excluding th=
e
> >> 13 I am adding in this series that would otherwise be unique files.
> >>
> >> To use, simply add
> >> ...
> >> DEFAULTTUNE ?=3D "neoversen1"
> >> require conf/machine/include/arm/arch-armv8-2a.inc
> >> ...
> >>
> >> Which is arguably what should be done anyway (instead of taking the
> >> default of the tune include file).
> >> See the qemuarm64 patch in the series for a working example.
> >>
> >> Of course, by removing the existing tune files, current users are goi=
ng
> >> to break.  A simple script can be written to use sed (or similar) to
> >> replace the relevant parts for those users that would be affected (at
> >> least for those that are in the layer index and update regularly).
> >>
> >> Thanks,
> >> Jon
> >>
> >> ---
> >>
> >> Originally sent as a RFC in
> >> https://lists.openembedded.org/g/openembedded-core/message/142324
> >>
> >> Given the generally positive feedback, sending as a patch series.
> >> Keeping the "hard fail" of the file removal (per Richards comment in
> >> https://lists.openembedded.org/g/openembedded-core/message/142356).
> >> Only difference of note is the removal of the "arm64: set BASE_LIB to
> >> lib64", as there needs to be more investigation (see
> >> https://lists.openembedded.org/g/openembedded-core/message/142414).
> >>
> >>
> >> Jon Mason (5):
> >>   arch-armv8-2a.inc: Add Cortex-A55 tunings
> >>   arch-armv8a.inc: Add existing tunings
> >>   qemuarm64: change tuning
> >>   arch-armv8a.inc: Add tunes for supported ARMv8a cores
> >>   arch-armv8-2a.inc: Add tunes for supported ARMv8.2a cores
> >>
> >>  .../machine/include/arm/arch-armv8-2a.inc     | 175 ++++++++++++++-
> >>  meta/conf/machine/include/arm/arch-armv8a.inc | 206 ++++++++++++++++=
+-
> >>  meta/conf/machine/include/tune-cortexa32.inc  |  18 --
> >>  meta/conf/machine/include/tune-cortexa35.inc  |  17 --
> >>  meta/conf/machine/include/tune-cortexa53.inc  |  18 --
> >>  meta/conf/machine/include/tune-cortexa55.inc  |  13 --
> >>  .../include/tune-cortexa57-cortexa53.inc      |  15 --
> >>  meta/conf/machine/include/tune-cortexa57.inc  |  17 --
> >>  .../include/tune-cortexa72-cortexa53.inc      |  20 --
> >>  meta/conf/machine/include/tune-cortexa72.inc  |  13 --
> >>  .../include/tune-cortexa73-cortexa53.inc      |  20 --
> >>  meta/conf/machine/include/tune-thunderx.inc   |  19 --
> >>  meta/conf/machine/qemuarm64.conf              |   3 +-
> >>  13 files changed, 371 insertions(+), 183 deletions(-)
> >>  delete mode 100644 meta/conf/machine/include/tune-cortexa32.inc
> >>  delete mode 100644 meta/conf/machine/include/tune-cortexa35.inc
> >>  delete mode 100644 meta/conf/machine/include/tune-cortexa53.inc
> >>  delete mode 100644 meta/conf/machine/include/tune-cortexa55.inc
> >>  delete mode 100644 meta/conf/machine/include/tune-cortexa57-cortexa5=
3.inc
> >>  delete mode 100644 meta/conf/machine/include/tune-cortexa57.inc
> >>  delete mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa5=
3.inc
> >>  delete mode 100644 meta/conf/machine/include/tune-cortexa72.inc
> >>  delete mode 100644 meta/conf/machine/include/tune-cortexa73-cortexa5=
3.inc
> >>  delete mode 100644 meta/conf/machine/include/tune-thunderx.inc
> >>
> >> --
> >> 2.20.1
> >>
> >>=20

--y2ctvtukov63e6ct
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCX2DR+QAKCRA3VSO3ZXaA
HOLpAJ4kfuv90NOO5rrGvMSBu8r92+MT3gCgiBqTEjX5QdbCJMffqqbXtWdziOQ=
=wCGW
-----END PGP SIGNATURE-----

--y2ctvtukov63e6ct--
