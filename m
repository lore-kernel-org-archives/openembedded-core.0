Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id D4EBE71A23;
	Tue,  6 Dec 2016 13:49:02 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id he10so29802901wjc.2;
	Tue, 06 Dec 2016 05:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=QJ93444xGWXw3kaOLw4fB3K5YgF9Vcc3LR2o/vPC8x0=;
	b=hhs0Rr0MxHqHEco7XRQWzHwFlbK+i5I4aCjMJXnFK1dMMgK++z915/olWSBkIytMeV
	franC49h3PYTAkefYMUPBWJgVaBfOCb89jX4zZNKWt/bjA7Xz9lLnrkId5Gr3aMO/1/0
	DyJLuy5D4R4wU/80j7/4aoFTSxw6j4UeO1Wvoi1T6EJiy7lPkbHSLd0qObgbHMR00o3K
	Qx5+Ke0JRwtcHB7vkXTOhl+9VZo3BqjX/xbQJovefbe3DthG0orDi7Cbob9GQGs50xVg
	hunfITtKqxc7EqtJAWSOH/N1iRiNL718NmuqAYK/lf6Ms98kJQx07S7sRcWUHq6XTjrI
	CZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QJ93444xGWXw3kaOLw4fB3K5YgF9Vcc3LR2o/vPC8x0=;
	b=Mm2gpS8ZUJuWnlHyUGYXwN4lu5juXwXWvYCnQADCuc9n6hO2MCNXZqGvpAevSuURiD
	Uc/UYcKQ0GShSzTlZifvj9OENNpGVc9m/usXolSs/wSu53315+ovDDuq0cUynJUbTDc1
	rdo282Cf9mA31zIoQfxd/HwACPhRZNNOSf2M2/7HzF5FvdGfojFwcViZG0lyjgmHFRkN
	MlK4X7SsqV5858kSOUN0fZbmBpjNB0n3g8+hJMsyA6AgYC2s8V/ujCc3NWQYNDLYLxp1
	oDIrh0urWw7EpI2hjH2XEt65oifc0iNNMOdNnCcxsYOdu11MRyIi8fbZjBFrPy2A3w+H
	lTlQ==
X-Gm-Message-State: AKaTC01IFySvdrRiUH9ALVgVkZr1UZmMmRp9bVTo8OuPk84/706qydDHV6cw1tyiye7BfA==
X-Received: by 10.194.136.166 with SMTP id qb6mr52852373wjb.42.1481032143220; 
	Tue, 06 Dec 2016 05:49:03 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x188sm4152080wmx.4.2016.12.06.05.49.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Dec 2016 05:49:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 Dec 2016 14:49:04 +0100
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20161206134904.GA3255@jama>
References: <20161130154845.8882.9798@opal.openembedded.org>
	<20161130154913.0EEAE50166@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20161130154913.0EEAE50166@opal.openembedded.org>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 67/76: gnutls: update to 3.5.6
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
X-List-Received-Date: Tue, 06 Dec 2016 13:49:03 -0000
X-Groupsio-MsgNum: 90282
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Content-Disposition: inline

--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2016 at 03:49:52PM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>=20
> commit 27f306a752d15ec62d2821d0146be4ffa10b7013
> Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> AuthorDate: Mon Nov 28 15:34:20 2016 +0200
>=20
>     gnutls: update to 3.5.6
>    =20
>     Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>

Anyone else also seeing this?

configure:9271: result: no
configure:9337: checking for NETTLE
configure:9345: $PKG_CONFIG --exists --print-errors "nettle >=3D 3.1"
configure:9348: $? =3D 0
configure:9363: $PKG_CONFIG --exists --print-errors "nettle >=3D 3.1"
configure:9366: $? =3D 0
configure:9412: result: yes
configure:9418: checking for HOGWEED
configure:9426: $PKG_CONFIG --exists --print-errors "hogweed >=3D 3.1"
Package hogweed was not found in the pkg-config search path.
Perhaps you should add the directory containing `hogweed.pc'
to the PKG_CONFIG_PATH environment variable
No package 'hogweed' found
configure:9429: $? =3D 1
configure:9444: $PKG_CONFIG --exists --print-errors "hogweed >=3D 3.1"
Package hogweed was not found in the pkg-config search path.
Perhaps you should add the directory containing `hogweed.pc'
to the PKG_CONFIG_PATH environment variable
No package 'hogweed' found
configure:9447: $? =3D 1
No package 'hogweed' found
configure:9475: result: no
configure:9478: error:
  ***
  *** Libhogweed (nettle's companion library) was not found. Note that
you must compile nettle with gmp support.


> ---
>  meta/recipes-support/gnutls/{gnutls_3.5.5.bb =3D> gnutls_3.5.6.bb} | 4 +=
+--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/gnutls/gnutls_3.5.5.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.5.6.bb
> similarity index 60%
> rename from meta/recipes-support/gnutls/gnutls_3.5.5.bb
> rename to meta/recipes-support/gnutls/gnutls_3.5.6.bb
> index d255959..2e70734 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.5.5.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.5.6.bb
> @@ -4,6 +4,6 @@ SRC_URI +=3D "file://correct_rpl_gettimeofday_signature.p=
atch \
>              file://0001-configure.ac-fix-sed-command.patch \
>              file://use-pkg-config-to-locate-zlib.patch \
>             "
> -SRC_URI[md5sum] =3D "fb84c4d7922c1545da8dda4dcb9487d4"
> -SRC_URI[sha256sum] =3D "86994fe7804ee16d2811e366b9bf2f75304f8e470ae0e371=
6d60ffeedac0e529"
> +SRC_URI[md5sum] =3D "7a38b23757aae009c3eb5bb12fb0afda"
> +SRC_URI[sha256sum] =3D "6338b715bf31c758606ffa489c7f87ee1beab947114fbd2f=
fefd73170a8c6b9a"
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

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWEbB0AAKCRA3VSO3ZXaA
HEdiAJ96s845xs4kMHTuNR+X3idp+CdyLACeLqQNayRa/n+Yictk9CsbxJlSzH4=
=0X8p
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
