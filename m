Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.1431.1615400916135976255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 10:28:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EPAvApt3;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id v15so24447708wrx.4
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 10:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=I5+W19qhgcTI5+PSPnxkn0c3PM1mVvw4LLrsIA/hL2A=;
        b=EPAvApt3suDNVRpI0zyz1hLZabj/4e1VV1+kmL1aMmVzBB3HI23YpJqmeLkcWT6HRX
         nrwZ9Q9jFGwlu9EbzL21GwDxfWM/jm8QRHY0NTvD7tgupsafDLFjSiXuVznTZ174a69Y
         6WqgPJ52mF1J2/l3ZCl/mJTZvYG3bn2qQ9JFaT7VOuWU6eIv08NiA3Dz8x/k1FYZegBS
         whCYqXgnQ0B3hsI5ZXaE2fx4NELRATNR1GKNTV1RfKklnkkicYF68fb/5EiLdTtDCW9j
         0V7kFAOfOrwRkt64RpJoH6KbcDbbTvRuXzsjMDLyPLcrGHcTXOym4WaJnlrmYTacB+qD
         hh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=I5+W19qhgcTI5+PSPnxkn0c3PM1mVvw4LLrsIA/hL2A=;
        b=CtUSmjJVcqqjD5qsRCI/LAz9s580Dj6NpxVMTQEgh64HYulsBSVuUitJLwayA9yESF
         2BX92GSQZCPacvFgntiNoP6Mb/rn46ZsbrvKr4iXqcdTKd3fg1hfuaKjivjDWMG6s+Gb
         k0675IXT5lLID3tvecHcZFzuBdtoZnoFJglddzLs1KSKu9XDnvpVTaH27U4eFvsf67Uv
         ul6bIOCRCWWNgYX4PtHoguR9HlGGrO7Mat+YbPHuFJlvvhz4OE0ZFty3Uz/jOTz0uZBu
         W6l6uoOAwMUZVrtKsIcnGi3wYoW3KIMQV11Yz5ymlCDjPEKtBJ0SXfFE369KE+bc/vNZ
         H5SA==
X-Gm-Message-State: AOAM531JCcuuAPEgQTNq4RE+fyDcA9gBo1ydk18Fb4txxDY6zHi/KKR4
	nNPamneWPnMdQjnBS0kbpww=
X-Google-Smtp-Source: ABdhPJz6qOOXXiQ3NXnxfXDkswcnUAePriI4Fx3BzUFPvsqIETHrzN9Q/Z1xmknIUHF6OqUriJtnQw==
X-Received: by 2002:a05:6000:118c:: with SMTP id g12mr4883158wrx.353.1615400914591;
        Wed, 10 Mar 2021 10:28:34 -0800 (PST)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id x25sm353168wmj.14.2021.03.10.10.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 10:28:33 -0800 (PST)
Message-ID: <539920c0108d13a48eb63650be96c97435c11dca.camel@gmail.com>
Subject: Re: [PATCH v9] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org, Kory Maincent
 <kory.maincent@bootlin.com>
Date: Wed, 10 Mar 2021 18:28:32 +0000
In-Reply-To: <681b7ba8baca230a2b95f5c1fc40e1b5108e9a70.camel@linuxfoundation.org>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210309135606.508593-1-luca.boccassi@gmail.com>
	 <681b7ba8baca230a2b95f5c1fc40e1b5108e9a70.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
X-Groupsio-MsgNum: 149242
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-rt/0QIyzFsiXDZKn2vro"

--=-rt/0QIyzFsiXDZKn2vro
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-03-09 at 23:43 +0000, Richard Purdie wrote:
> On Tue, 2021-03-09 at 13:56 +0000, luca.boccassi@gmail.com wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >=20
> > Recently util-linux gained an (optional) build dependency on libcryptse=
tup.
> > But libcryptsetup build-depends on util-linux for blkid (optional, can =
be disabled)
> > and uuid (mandatory).
> > Split out util-linux-uuid in a different recipe to break the cycle.
> >=20
> > https://github.com/karelzak/util-linux/pull/898
> >=20
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > ---
> > v1: util-linux 2.35 is not out yet, but I'd like to get the preparatory=
 work
> >     underway as I'm not sure if this is the best approach or if there a=
re
> >     alternatives. Suggestions and comments very welcome. Thanks!
> > v2: changed packages names to reflect old ones (eg: libuuid1 -> util-li=
nux-libuuid)
> >     and leave uuid build enable in main recipe to allow for uuidgen bui=
ld to happen,
> >     as it does not have its own autoconf switch. Delete the library man=
ualy from
> >     the main recipe after build instead, and add dependency.
> >     Might help to break loop python3 -> util-linux -> libselinux -> pyt=
hon3, as it's
> >     only libuuid that is needed, see https://lists.yoctoproject.org/g/y=
octo/message/47570
> > v3: rebased and refactored to have a common util-linux.inc file
> > v4: added RDEPENDS on util-linux-libuuid on various packages to fix QA =
warnings
> > v5: remove RDEPENDS and instead have util-linux RDEPEND on util-linux-u=
uid.
> >     Removed PACKAGES_remove and instead filter out libuuid via the pack=
age generation
> >     regex.
> >     Rebased on util-linux 2.36.2.
> > v6: install libuuid.a in libuuid-dev
> >     change rdepends on uuid to use binary package rather than source
> >     add rdepends on uuid-dev to libuuid-dev
> >     remove rprovides of libuuid-dev from uuid-dev
> > v7: do not use '_append' for RDEPENDS, as it is not supported by BBCLAS=
SEXTEND, use
> >     simply '+=3D'
> > v8: added missing libuuid-staticdev package
> >     remove libx32/libuuid* too
> > v9: set RECIPE_MAINTAINER_pn-util-linux-uuid, same value as RECIPE_MAIN=
TAINER_pn-util-linux
>=20
> Sorry, there are still issues:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/3207
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1608
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/3159
>=20
> :(
>=20
> I really want to get this into the release but we're past feature freeze =
and
> running out of opportunity as each broken test run is delaying other patc=
hes.

No problem at all, it's absolutely fine to postpone, I am in no
immediate rush as I have local backports in use. As long as we get
things sorted at some point it's all good for me, so please don't delay
other patches because of this.

> I'm a little unclear if debian renaming was allowed before the split and =
if
> so, why it is disabled in the split version. I suspect there is a missing
> MLPREFIX somewhere causing the multilib issue too.

I do not remember why the DEBIAN_NOAUTONAME was added at this point.
I'll try to send a new version tomorrow.

--=20
Kind regards,
Luca Boccassi

--=-rt/0QIyzFsiXDZKn2vro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEE6g0RLAGYhL9yp9G8SylmgFB4UWIFAmBJD9AACgkQSylmgFB4
UWKusQf+OrdK9JKnXD5sKecUbh193CN/QYwWaqVyn8A0LE4HslRRgDeu3x/GtlgG
cDnBxKBKCoy7v0WXVOuGDIEE3F77x0syoGBF1PRyPPLbX7nMaR1g8NtNpMRmQKFS
9siUCxaBIOgk4+9XdSbHS2esiRpQN/mxQCwzCxlbeoTUxaCi/AOHmlEGK+/Wshqu
Juh8GwchT3AJyWWnY+vZXNHCf/tj+NxAZ1JT1jrer0sffpBwlpht3KYc9wHT2kGP
cBmA7akKQVRQXa/3P02UKE0bGvhY2kH1LCINN2LNZj0OAurE2NO71nqO9UYFTs2C
b3HE7/Y1jR4eJHz8xqqLJ0OwWQtiyg==
=bIEE
-----END PGP SIGNATURE-----

--=-rt/0QIyzFsiXDZKn2vro--
