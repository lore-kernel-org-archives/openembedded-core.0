Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 39EE47988E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 13:32:06 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id j192-v6so1971822wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 06:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1OfVTxsVFGYlnaHEU3gLViF3UtRJ3ADt1nsnSFWnIVs=;
	b=OPlfiLh41/GqmJjnoKg3cDwXol3IbcaVR/RRkyfIfAZ4nSMp/i9jI9bnfv3nM2keoB
	xBxlMJeICAY5ltBIvCQD3i/txngg3O0J3S/11TR9eTbecLgrvNPiZB0HA1+z4Lza2N7J
	qbQ28tUfBUxGDSfbEvj0n2+9hiio2spkyU81EoMFRztJb+3UupK/6oaCwyahyreCqIYG
	r2DDHorEpm61B/VWG8exfkTLH9xVFesNxJjzTfUJqvHE5Ah1F/rxSv1tou1trCsxUxn2
	FyaF7CiEHgNx/A7MTqGV9/81corAem4JCyfIrw8X01YGXY5+RwLg8vL8NM5OicLthTzE
	nt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1OfVTxsVFGYlnaHEU3gLViF3UtRJ3ADt1nsnSFWnIVs=;
	b=J+JsHFL+3SKJu4caILXYzU6+EJIKzbNfzaYUc+pc4YYsZuRy675ATR8m9IzdwPJEeU
	f2pg2uHb4+BSrt3EQumtOq8LOurgWjVk2XeQFsdSAbeZfg2dZ3ivERUdM4Q/X40IDUfs
	8bb+L71PNhZoMWxRK7Avl+BrMDh7TpPOTgwZK8nc3p6nujZfRnn+RBCajHLCDLM+Kek+
	lOxlyvYOIjkUiJJUd/84Xa/Y0ANFn89mVyy4NBdQVvA2oAJT7U0D60LTtPU29ZzWZJOt
	Zjh308JFmlqwLxz0FemFTHF1AbrX23F4VLzNsnsPGKwi/qKSwaN/u8mSFiDKtZ7/fmt2
	9dig==
X-Gm-Message-State: APzg51AZG/mriTASk3/L1W4jEUROjw+EV87oQp+mncoH5HiUe/QiFgdM
	uQyhLhslvoTTu+E2CJklVfM=
X-Google-Smtp-Source: ANB0VdaDPMSQiZaHJJhcvGrGwXdEnYdBWHkYidhPIw9LVsrL/o9W42yiAhumn4FxJgMa52SU6QjsoA==
X-Received: by 2002:a1c:aa8f:: with SMTP id
	t137-v6mr1290666wme.54.1536931926753; 
	Fri, 14 Sep 2018 06:32:06 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	j20-v6sm1219223wmh.9.2018.09.14.06.32.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 14 Sep 2018 06:32:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 14 Sep 2018 15:32:07 +0200
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Message-ID: <20180914133207.GC1369@jama>
References: <20180914130310.395-1-ovidiu.panait@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20180914130310.395-1-ovidiu.panait@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [morty][PATCH v2] qemux86: wic: Add MLPREFIX to syslinux
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
X-List-Received-Date: Fri, 14 Sep 2018 13:32:06 -0000
X-Groupsio-MsgNum: 116281
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Content-Disposition: inline

--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 14, 2018 at 04:03:10PM +0300, Ovidiu Panait wrote:
> Fix the following do_image_wic failure for lib32-core-image-minimal:
> | DEBUG: Executing python function set_image_size
> | DEBUG: Python function set_image_size finished
> | DEBUG: Executing shell function do_image_wic
> | Error: Please build syslinux first
>=20
> Test case:
> MACHINE ?=3D "qemux86-64"
>=20
> require conf/multilib.conf
> MULTILIBS =3D "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 =3D "x86"
>=20
> IMAGE_FSTYPES_append =3D " wic wic.bmap"
>=20
> $ bitbake lib32-core-image-minimal
>=20
> Currently, syslinux gets built instead of lib32-syslinux, so do_image_wic
> doesn't find the right files into tmp/sysroots/lib32-qemux86-64 sysroot.
>=20
> Pyro and later releases are not affected by this issue because they are
> based on Recipe Specific Sysroot, so syslinux binaries end up in the
> right place.

How does RSS help with this issue? It still builds the wrong version of
syslinux, doesn't it?

> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  meta/conf/machine/qemux86-64.conf | 2 +-
>  meta/conf/machine/qemux86.conf    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux8=
6-64.conf
> index 4f30033e51..e093078d9d 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -33,4 +33,4 @@ MACHINE_FEATURES +=3D "x86"
>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "v86d"
> =20
>  WKS_FILE ?=3D "directdisk.wks"
> -do_image_wic[depends] +=3D "syslinux:do_build syslinux-native:do_populat=
e_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_s=
ysroot"
> +do_image_wic[depends] +=3D "${MLPREFIX}syslinux:do_build syslinux-native=
:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do=
_populate_sysroot"
> diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.c=
onf
> index e232947aee..29897aaaaf 100644
> --- a/meta/conf/machine/qemux86.conf
> +++ b/meta/conf/machine/qemux86.conf
> @@ -32,4 +32,4 @@ MACHINE_FEATURES +=3D "x86"
>  MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "v86d"
> =20
>  WKS_FILE =3D "directdisk.wks"
> -do_image_wic[depends] +=3D "syslinux:do_build syslinux-native:do_populat=
e_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_s=
ysroot"
> +do_image_wic[depends] +=3D "${MLPREFIX}syslinux:do_build syslinux-native=
:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do=
_populate_sysroot"
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW5u4VgAKCRA3VSO3ZXaA
HBg7AJ47a6V8gQBstZoyw5/iyh/AhvdkFQCgo+dRuLn2nJA5G8DKCdr4PDU3fOA=
=OGqW
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--
