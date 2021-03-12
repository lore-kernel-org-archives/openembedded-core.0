Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.8068.1615555541249142116
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 05:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vNYdcZ1p;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id b18so4801375wrn.6
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 05:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GHr5iUmEd5yn2UEKxHBMq1GHuDibkP+ug09gB4rD7Fs=;
        b=vNYdcZ1p28YgjI8hcEexZ3SSlnXlgbgAb43LPm8TioAduva1gvpbskauMRcvarLipw
         0mtJtPx7yuQQCOnxInx7PJUaF3GHRKM4lQgVlu0wzm+G2/v/Lvgvhs4XbG7JhIPc+Dii
         grISc+NTairbDVnDwV/bNmksso5r9TlgvusWRMMjwJM21UVY3ZyS+eQ4E1Ku02r8p8dX
         pIW0DsbcETR3bZM/WK0ZAlb6yGcOq/hUr+A2wRx0/aUJJVJRWw1KudZUrjC6GlYCLnGq
         f5Ne6sGqoggk4WD4uCOsHAHDBFRwNoTjYj8PpSu9qzmnNrPPn+kUPvpjdm58DXmXCKzT
         qmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GHr5iUmEd5yn2UEKxHBMq1GHuDibkP+ug09gB4rD7Fs=;
        b=VMA2btf7arm6Jm8YQsVGq2A+wFo4bxG+NPnhgwhm1QDyjnjwYtaXw2bSo3JzftVSzM
         vxe5nJV5M6Hra1xAHdHKCiYLC+Vm1p8XOiVIQ5OZ7zfaAn9/pNzLIRhoWXvU0HkXxn3i
         UFrpNOYyT2dw57a+cGQyRmZ9hFHFtXjras1oFKr+j6SulNEAB5oHkkA/rrdRi+RynFq2
         FbvZcXsOy4nJBHh5BfRFzCQhx/HmWPs4rGCkZPqVeSgTzSET595R+35Y53VSrrEKQZ2L
         g5ZcrnM+K4lrKkHBgf3kC2wdYixgNuVcX4xcnuoF2NrUqoG4pKOkXpk6aMsxyCd+lkti
         +QFA==
X-Gm-Message-State: AOAM533TksDdo2bnkb6gAQXAN7ThjVXofo45mvFZjnTM7Wf9sfl8dDQ5
	7fIe7pQzHxvAgWMoXxEFxZw=
X-Google-Smtp-Source: ABdhPJwu8KLXAHDx5yMTiM8eeDI7E+JKOPubhk1ZWXK4gaMkEWaa+sgBLIZAoG9ho9ih/K3wTRhGhw==
X-Received: by 2002:adf:e582:: with SMTP id l2mr14124668wrm.207.1615555539550;
        Fri, 12 Mar 2021 05:25:39 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y18sm8051750wrw.39.2021.03.12.05.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 05:25:38 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 12 Mar 2021 14:25:37 +0100
To: Steve Sakoman <steve@sakoman.com>
Cc: Steve Sakoman <sakoman@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>,
	Anibal Limon <anibal.limon@linaro.org>,
	Richard Leitner <richard.leitner@skidata.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [gatesgarth][PATCH] xcb-proto: update to 1.14.1
Message-ID: <20210312132537.uiu3kayoezu5wgo5@jama>
References: <20210310125420.4001190-1-Martin.Jansa@gmail.com>
 <CAGDS+nkxMnKEaEx514-5u_v7LKJq_yhuLTc_uaGRs5X92WjobQ@mail.gmail.com>
 <20210311091428.2a3nissv6eebjpzq@jama>
 <20210311153601.ootfsyrek7lmebu5@jama>
 <CAOSpxdahY=mG1A2Bx_cfm5FT6iiCJLmH9igiHPnHGy+fCER1kQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOSpxdahY=mG1A2Bx_cfm5FT6iiCJLmH9igiHPnHGy+fCER1kQ@mail.gmail.com>
X-Groupsio-MsgNum: 149344
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wibazmbgptuyvxno"
Content-Disposition: inline

--wibazmbgptuyvxno
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 07:50:45AM -1000, Steve Sakoman wrote:
> On Thu, Mar 11, 2021 at 5:36 AM Martin Jansa <Martin.Jansa@gmail.com> wr=
ote:
> >
> > On Thu, Mar 11, 2021 at 10:14:28AM +0100, Martin Jansa wrote:
> > > On Wed, Mar 10, 2021 at 04:33:02AM -1000, Steve Sakoman wrote:
> > > > On Wed, Mar 10, 2021 at 2:54 AM Martin Jansa <Martin.Jansa@gmail.c=
om> wrote:
> > > > >
> > > > > From: Richard Leitner <richard.leitner@skidata.com>
> > > > >
> > > > > This fixes [1] the following build error for nativesdk on Fedora=
 33
> > > > > which is caused by the removal of fractions.gcd() in favor of ma=
th.gcd()
> > > > > in python 3.9 [2]:
> > > > >
> > > > > ImportError: cannot import name 'gcd' from 'fractions' (/usr/lib=
64/python3.9/fractions.py)
> > > > >
> > > > > Furthermore the SRC_URI is adapted as the old one doesn't provid=
e the
> > > > > 1.14.1 archive.
> > > > >
> > > > > [1] https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/=
426ae35bee1fa0fdb8b5120b1dcd20cee6e34512
> > > > > [2] https://bugs.python.org/issue39350
> > > > >
> > > > > It's needed in gatesgarth and possibly dunfell as well to suppor=
t
> > > > > distributions with python-3.9 as we build libxcb-native, which i=
s
> > > > > failing with xcb-proto-1.14.
> > > > >
> > > > > 1.14.1 is a bug fix release:
> > > > > https://lists.x.org/archives/xorg-announce/2020-October/003061.h=
tml
> > > >
> > > > Dunfell is still at version 1.13, so this wouldn't be a bug fix ve=
rsion bump.
> > >
> > > I see, well luckily 1.14 doesn't look too scary as well:
> > > https://lists.x.org/archives/xorg-announce/2020-February/003038.html
> > > https://git.openembedded.org/openembedded-core/commit/?h=3Dgatesgart=
h&id=3Dbf4ef2e3b376744b16c2f57725104207d23c28c6
> > >
> > > If this is the only issue for building dunfell with host distro with
> > > python-3.9 then I think it should be considered.
> > > Isn't autobuilder using some new host distro with python-3.9 already=
?
> > >
> > > FYI: I was seeing this with ubuntu 21.04, I'll trigger dunfell build=
 on
> > > it now.
> >
> > At least for LuneOS images this was the only build issue I've seen wit=
h 21.04.
>=20
> I'll add the version bump to my next set of patches for testing.

Steve: I'm sorry, please forget what I said about upgrade, 1.13 version in=
 dunfell already
has this fix for python-3.9 backported in:
https://git.openembedded.org/openembedded-core/commit/?h=3D0f688c1419b1e2d=
fddff3c985f89a3f1949fc9fb

so only 1.14 version in gatesgarth is affected.

If you already have those updates in queue, then they shouldn't harm,
but aren't so necessary thanks to this backport.

> > Together with an warning about glibc:
> > WARNING: Your host glibc version (2.33) is newer than that in uninativ=
e (2.32). Disabling uninative so that sstate is not corrupted.
> >
> > which I see you're going to address in new PR with uninative upgrade.
> >
> > Cheers,
> >
> >=20
> >

--wibazmbgptuyvxno
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYEtrzwAKCRA3VSO3ZXaA
HGwHAJ9Io5JCxMlLeymnlEAmGWIzHS7tswCeMb8BQFOYkr1tQceuYQYtAgvp6mg=
=t9Gh
-----END PGP SIGNATURE-----

--wibazmbgptuyvxno--
