Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.77.1615591281071247964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 15:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W2ADN8x3;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id d15so5671143wrv.5
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 15:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z5CrsiblsUPfJPN/JapmWNPdlMIzEKDbZ7ujJp0NbKA=;
        b=W2ADN8x3UK5mGteIjGd6jPx1V4HjOMv/0hv53J4YdoufJbUGbP4bnc55Y+sGKh79sL
         hsI7WFGYEQwHzprcq/vkSlzHuPDZrS8CbdG4ez/NJeQeWyagASJSrMNQVjWGRl9XTk+2
         zMEYRTynv3v/fpbyJAzepD78iTyMZWFMbaRocE4TKtwIXExDb+6sd7sneEZgQntu43NX
         2M8bsEzhvPOTgSNz5KOvMVMBAL1IwK7P0/Zu8RTzyDY7d2Wi07MyE8lT0g1Bbed7+G14
         ea7n6k7JBuf7KF3UAkQP3U3v/liEUvnINGXBwbe/hMKKGE2qMlJHeqSCNQZXULFgMDBi
         RzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z5CrsiblsUPfJPN/JapmWNPdlMIzEKDbZ7ujJp0NbKA=;
        b=hiaENJa0p54QAVJpatPnGKt9Ml6KZmV704Kl4m7aP0AvggmzsXQ7D4sCxRQxoM2UpG
         RKPsgikwomOUPOJECjQ/LoH2ok0Mq2fzmnBIUQ8XhCNNhEcM3Ow5kNigz0Z/xIYN51/b
         cxyzgmmKYBC7zHHuFTncimiPTF4IlwOA/VGmnBRHkyFqmOJWzlDSuJIn3GLa3XzNz78U
         NRfHJnsNnTt8bNpUx1JqVNvEONmNNLIbLks1ILSJa4AgabksLXUl0zV5wNvaIODdKF/H
         PjaaX1Gvt6gsGoNlcUW/iG5aLEMD/LUB4GNdskRUfXuwqct2H60btu32rFOCEg7kTJTB
         jbQw==
X-Gm-Message-State: AOAM533ov8dSZ6tPYmxvQL9afbH63ztS5BRfugl96hKoB8V0RxFAoeEj
	0Xha0XDYXUKGecU2oHrNYYQ=
X-Google-Smtp-Source: ABdhPJzINFyfbeMD3UWgqRiaRXZqV4d5BpxRtzjbkPIO7IpZlQKl1R5Efoa0eOM85NkqTCstEmUxxg==
X-Received: by 2002:adf:fd48:: with SMTP id h8mr16360095wrs.229.1615591279403;
        Fri, 12 Mar 2021 15:21:19 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y205sm4704945wmc.18.2021.03.12.15.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 15:21:17 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 13 Mar 2021 00:21:17 +0100
To: Denys Dmytriyenko <denis@denix.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC][PATCH] sstatesig.py: show an error instead of warning when sstate manifest isn't found
Message-ID: <20210312232117.m4b3cp2ahaambs7h@jama>
References: <166663E8BC670D0D.6890@lists.openembedded.org>
 <20210223135101.gcailiou4lhceoa7@jama>
 <27cd8d13140defc517650f2a1ef76c1d58d9928a.camel@linuxfoundation.org>
 <20210312224150.GB4892@denix.org>
MIME-Version: 1.0
In-Reply-To: <20210312224150.GB4892@denix.org>
X-Groupsio-MsgNum: 149376
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cqehetzlzqhggczc"
Content-Disposition: inline

--cqehetzlzqhggczc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 05:41:50PM -0500, Denys Dmytriyenko wrote:
> On Fri, Feb 26, 2021 at 03:53:38PM +0000, Richard Purdie wrote:
> > On Tue, 2021-02-23 at 14:51 +0100, Martin Jansa wrote:
> > > On Tue, Feb 23, 2021 at 02:35:53PM +0100, Martin Jansa via lists.open=
embedded.org wrote:
> > > > * not sure if there are some valid use-cases for missing manifest, =
but
> > > > =A0=A0recently I'm seeing increasing number of build failures where=
 something
> > > > =A0=A0from native recipe is missing (seen it with pseudo, autoconf,=
 nodejs
> > > > =A0=A0recently) and the only indication that something is wrong (be=
fore showing
> > > > =A0=A0sometimes misleading error like:
> > > > =A0=A0recipe-sysroot-native/usr/bin/node: No such file or directory
> > > > =A0=A0is this warning:
> > > > =A0=A0NOTE: Running task 7844 of 12431 (/meta-oe/meta-oe/recipes-de=
vtools/nodejs/nodejs_12.20.2.bb:do_prepare_recipe_sysroot)
> > > > =A0=A0NOTE: recipe nodejs-12.20.2-r0: task do_prepare_recipe_sysroo=
t: Started
> > > > =A0=A0WARNING: nodejs-12.20.2-r0 do_prepare_recipe_sysroot: Manifes=
t /BUILD/sstate-control/manifest-x86_64_ubuntu-18.04-nodejs-native.populate=
_sysroot not found in x86_64 x86_64_ubuntu-18.04 (variant '')?
> > > > =A0=A0NOTE: Running task 7845 of 12431 (/meta-oe/meta-oe/recipes-de=
vtools/nodejs/nodejs_12.20.2.bb:do_unpack)
> > > > =A0=A0NOTE: recipe nodejs-12.20.2-r0: task do_unpack: Started
> > > > =A0=A0WARNING: nodejs-12.20.2-r0 do_prepare_recipe_sysroot: Manifes=
t /BUILD/sstate-control/manifest-x86_64_ubuntu-18.04-nodejs-native.populate=
_sysroot not found in x86_64 x86_64_ubuntu-18.04 (variant '')?
> > > > =A0=A0NOTE: recipe nodejs-12.20.2-r0: task do_prepare_recipe_sysroo=
t: Succeeded
> > > >=20
> > > > =A0=A0if I rebuild that native dependency, then it gets fixed and I=
 don't
> > > > =A0=A0see these failures in clean builds (as without sstate and wit=
h empty
> > > > =A0=A0TMPDIR), only in incremental builds
> > > >=20
> > > > * but if there isn't valid reason for missing manifest file, then I=
 think
> > > > =A0=A0it would be better to error early (or even bb.fatal())
> > >=20
> > > Looks like this warning was first introduced in 2014:
> > > https://git.openembedded.org/openembedded-core/commit/?id=3D79ea036de=
331bde65a88fb777647dc099ef05acf
> > > then extended and updated for RSS in:
> > > https://git.openembedded.org/openembedded-core/commit/?id=3D809746f56=
df4b91af014bf6a3f28997d6698ac78
> > > then added for package management in:
> > > https://git.openembedded.org/openembedded-core/commit/?id=3D85e72e129=
362db896b0d368077033e4a2e373cf9
> > > and then unified last 2 to common function in:
> > > https://git.openembedded.org/openembedded-core/commit/?id=3D68150bac7=
444f089f19c789e9f6602d59f605d7a
> >=20
> > I merged this. There were cases where the warning showed in cases where
> > there wasn't a problem but I think we've fixed all those now.
>=20
> Richard, Martin,
>=20
> Can you please point me to the right way of fixing this? I've been seeing=
=20
> this warning before and since it is now an error and backported to Dunfel=
l,=20
> it breaks builds one in a while.

Do you see this error triggered on initramfs manifest used by your
kernel? See this thread for possible work arounds:
https://lists.openembedded.org/g/openembedded-core/topic/81249042#149271

but maybe you have some different corner case which will need different
fix.

--cqehetzlzqhggczc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYEv3awAKCRA3VSO3ZXaA
HORVAKCfkShAwPGI+Q1KDAkxRphuvS/V4gCeO2ponWSJMc6y/oVTZk8StKLHrIk=
=i5zU
-----END PGP SIGNATURE-----

--cqehetzlzqhggczc--
