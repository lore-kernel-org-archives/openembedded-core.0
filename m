Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9AFD06B1F7;
	Tue, 20 Nov 2018 19:56:43 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id p4so3270453wrt.7;
	Tue, 20 Nov 2018 11:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=G4N1dsmrcJG4d0Rrgfx1/QfCUimZclM8lfEpdJiaQ6g=;
	b=pz/cwzVMI6HKDsJVB33Ly9u/8RyinFBRwoGoI+bK6Qco+k1IyzCWy0snCe+pyvZsQn
	SlhN6z2TaE/v9w3KOoYcZH5AJvBBXLxCD8pLjamfG8ZaIlXOY76eYHpACmKbX8lszGVK
	+DIXEQVcRWjhznAghFV+fcuzmkvzEDMey04+b32iRM/wb9mXty6DZDgkf65DxgDUzNzX
	SydrJLzwIksVtNH+kKTVeqoI1tVdKN000gTTsN/1asf5V4xojyA0IyTrAR6WnL8rp6X7
	gUMfNAKghl51NmNNuYdnPmvSf1P6+fUBhT8zLHCo9KeXCtbv2/Po7QGepXwy3sOgFFbr
	HjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=G4N1dsmrcJG4d0Rrgfx1/QfCUimZclM8lfEpdJiaQ6g=;
	b=FnwwUKgiVroB+lYsJIaFDpTwdmSKKgToX8m2eFn4afXRuEZJz3HxTYXmsBQGlkM/KG
	rabZFv8P25ACJ57MDZXENNynHk1p0I4G83DNwWSjqlS0Qe9vgq5ZrdpNFut7CtHGP1eC
	/k39+f/cwQPR9r6u8zHUCKBjArlICpMI4CyzT1wiH673Hmoo/n//ex2AlVlOGfPfYhB3
	mLz+y8Hc2bGO+UnTeSrXUUNfAHk/TRFUoVd49SG0t5tkw1VxrFI/QmhNG88t3abg7ePv
	9HTzUCuv264m+fm/KLFpdVMj9b87nlb4qlPoIhxwrEyBgoB03cXp09vcS+mQ5jR7ueHQ
	LO7Q==
X-Gm-Message-State: AA+aEWaHqaqBj/qwHWmMYTDPXYQq6BRUnToI532NBlsMSuSVe5itKTGQ
	0fUK+y26AEQlkl42lWEgVUT8B6ks
X-Google-Smtp-Source: AFSGD/VpjkSC4/VdWf1VA4Ny2CnnZ0cy31Pfb3FMV+IZ+1+RoJEZOKCLEA2+wy+ApiRvCAIsbG9pNg==
X-Received: by 2002:adf:fc09:: with SMTP id i9mr3072131wrr.299.1542743804033; 
	Tue, 20 Nov 2018 11:56:44 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c4-v6sm32218224wrr.74.2018.11.20.11.56.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Nov 2018 11:56:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 Nov 2018 20:56:42 +0100
To: openembedded-core@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>
Message-ID: <20181120195642.GA1825@jama>
References: <154238601667.15427.9965417024860647033@git.openembedded.org>
	<20181116163337.4A962235D9B@git.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20181116163337.4A962235D9B@git.openembedded.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 10/35: tzcode: update to 2018f
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Nov 2018 19:56:43 -0000
X-Groupsio-MsgNum: 118411
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 16, 2018 at 04:33:46PM +0000, git@git.openembedded.org wrote:
> This is an automated email from the git hooks/post-receive script.
>=20
> rpurdie pushed a commit to branch sumo
> in repository openembedded-core.
>=20
> commit 9702041a732ca062a9899543d05e585c930407f3
> Author: Armin Kuster <akuster808@gmail.com>
> AuthorDate: Mon Oct 22 15:05:11 2018 +0100
>=20
>     tzcode: update to 2018f

This breaks postgresql build in sumo:

| postgresql/9.4.17-r0/recipe-sysroot-native/usr/bin/zic -d 'postgresql/9.4=
=2E17-r0/image/usr/share/postgresql/timezone' -p 'US/Eastern' postgresql/9.=
4.17-r0/build/../postgresql-9.4.17/src/timezone/data/tzdata.zi
| "postgresql/9.4.17-r0/build/../postgresql-9.4.17/src/timezone/data/tzdata=
=2Ezi", line 1595: Invalid rule name "+"
| "postgresql/9.4.17-r0/build/../postgresql-9.4.17/src/timezone/data/tzdata=
=2Ezi", line 1596: Invalid rule name "+"
| "postgresql/9.4.17-r0/build/../postgresql-9.4.17/src/timezone/data/tzdata=
=2Ezi", line 1597: Invalid rule name "+"
| "postgresql/9.4.17-r0/build/../postgresql-9.4.17/src/timezone/data/tzdata=
=2Ezi", line 1598: Invalid rule name "+"
| "postgresql/9.4.17-r0/build/../postgresql-9.4.17/src/timezone/data/tzdata=
=2Ezi", line 1599: Invalid rule name "+"
| Makefile:52: recipe for target 'install' failed
| make[2]: *** [install] Error 1
| make[2]: Leaving directory 'postgresql/9.4.17-r0/build/src/timezone'
| Makefile:35: recipe for target 'install-timezone-recurse' failed
| make[1]: *** [install-timezone-recurse] Error 2


Are you going to backport:

commit 805e74d00cff3a7566335150f7e3b41972265cc1
Author: Armin Kuster <akuster808@gmail.com>
Date:   Mon Oct 22 16:47:55 2018 +0100

    postgresql: Fix build issue with timezone 2018f update
   =20
    Sync our copy of the timezone library with IANA release tzcode2018f.

to meta-oe/sumo?

Thanks

>    =20
>      Changes to code
>    =20
>         zic now always generates TZif files where time type 0 is used for
>         timestamps before the first transition.  This simplifies the
>         reading of TZif files and should not affect behavior of existing
>         TZif readers because the same set of time types is used; only
>         their internal indexes may have changed.  This affects only the
>         legacy zones EST5EDT, CST6CDT, MST7MDT, PST8PDT, CET, MET, and
>         EET, which previously used nonzero types for these timestamps.
>    =20
>         Because of the type 0 change, zic no longer outputs a dummy
>         transition at time -2**59 (before the Big Bang), as clients should
>         no longer need this to handle historical timestamps correctly.
>         This reverts a change introduced in 2013d and shrinks most TZif
>         files by a few bytes.
>    =20
>         zic now supports negative time-of-day in Rule and Leap lines, e.g=
=2E,
>         "Rule X min max - Apr lastSun -6:00 1:00 -" means the transition
>         occurs at 18:00 on the Saturday before the last Sunday in April.
>         This behavior was documented in 2018a but the code did not
>         entirely match the documentation.
>    =20
>         localtime.c no longer requires at least one time type in TZif
>         files that lack transitions or have a POSIX-style TZ string.  This
>         future-proofs the code against possible future extensions to the
>         format that would allow TZif files with POSIX-style TZ strings and
>         without transitions or time types.
>    =20
>         A read-access subscript error in localtime.c has been fixed.
>         It could occur only in TZif files with timecnt =3D=3D 0, somethin=
g that
>         does not happen in practice now but could happen in future versio=
ns.
>    =20
>         localtime.c no longer ignores TZif POSIX-style TZ strings that
>         specify only standard time.  Instead, these TZ strings now
>         override the default time type for timestamps after the last
>         transition (or for all time stamps if there are no transitions),
>         just as DST strings specifying DST have always done.
>    =20
>         leapseconds.awk now outputs "#updated" and "#expires" comments,
>         and supports leap seconds at the ends of months other than June
>         and December.  (Inspired by suggestions from Chris Woodbury.)
>     (From OE-Core rev: 4670dcdb6e2504469c30ebed828d4702d8c0003c)
>    =20
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../tzcode/{tzcode-native_2018e.bb =3D> tzcode-native_2018f.bb}     | 8 =
++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2018e.bb b/meta/r=
ecipes-extended/tzcode/tzcode-native_2018f.bb
> similarity index 70%
> rename from meta/recipes-extended/tzcode/tzcode-native_2018e.bb
> rename to meta/recipes-extended/tzcode/tzcode-native_2018f.bb
> index 9a4e465..816e34d 100644
> --- a/meta/recipes-extended/tzcode/tzcode-native_2018e.bb
> +++ b/meta/recipes-extended/tzcode/tzcode-native_2018f.bb
> @@ -11,10 +11,10 @@ SRC_URI =3D" http://www.iana.org/time-zones/repositor=
y/releases/tzcode${PV}.tar.gz
> =20
>  UPSTREAM_CHECK_URI =3D "http://www.iana.org/time-zones"
> =20
> -SRC_URI[tzdata.md5sum] =3D "97d654f4d7253173b3eeb76a836dd65e"
> -SRC_URI[tzdata.sha256sum] =3D "6b288e5926841a4cb490909fe822d85c36ae75538=
ad69baf20da9628b63b692e"
> -SRC_URI[tzcode.md5sum] =3D "c4d7df0fff7ba5588b32c5f27e2caf97"
> -SRC_URI[tzcode.sha256sum] =3D "ca340cf20e80b699d6e5c49b4ba47361b3aa681f0=
6f38a0c88a8e8308c00ebce"
> +SRC_URI[tzdata.md5sum] =3D "e5e84f00f9d18bd6ebc8b1affec91b15"
> +SRC_URI[tzdata.sha256sum] =3D "0af6a85fc4ea95832f76524f35696a61abb3992fd=
3f8db33e5a1f95653e043f2"
> +SRC_URI[tzcode.md5sum] =3D "011d394b70e6ee3823fd77010b99737f"
> +SRC_URI[tzcode.sha256sum] =3D "4ec74f8a84372570135ea4be16a042442fafe100f=
5598cb1017bfd30af6aaa70"
> =20
>  S =3D "${WORKDIR}"
> =20
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW/Rm+gAKCRA3VSO3ZXaA
HD30AJ9btL6BiW7O5tQ/fnMnPpxSR1Zy9QCgjyN6Ddr/6RIwqCRh5039LorL3A0=
=o7Wg
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
