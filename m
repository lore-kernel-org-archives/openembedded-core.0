Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id E6B8D731D1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:05:31 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u108so4913894wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 09:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=UsjLHhDi94VQadDtcTUdKy9EMFEX24ivLK88qUsaK8g=;
	b=kuaNcuIok3lsRFmuMVgTQn1dMlpbbEMyEXZ7uIOBuqdVDeLritAzUjM/+vWGcmwuwH
	fNQMW517dKzsPZMVJUiatgydrbIHOwo2oPA2vcApFqcUubK5fcacWNLxEqldK2rertXO
	3SptlIEsCGJhE6/b0fjTYf7aGxe9iqQ2dxv/imd9tKqCvQtpfI7X8T2EkA3yxm+9IsMX
	YATjqSqjJEg7wn9tK5AigQ+MKMFEpnYUufD610FW+6lktvxM/iLMZeUxGBnXPgfuedmS
	SHYFsmzShmSeAHMhGFaKIQD9y2abTCovuEfrOZqEPCj7TplZORfX8gdIXIxMDYM0SUra
	sd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=UsjLHhDi94VQadDtcTUdKy9EMFEX24ivLK88qUsaK8g=;
	b=hCDWtsAzrVHxrhX+y/UaO9L/5yetmHsR/4iI9YVh0DbJbxxe2jhaSkGmxohGvXRVRA
	b6GfsTIsbsD5U6hhlDvs7/9bMcg14PNdqXbrBmhiN0s/M+0zvXW7jyXJ6kNbwJ0kSfRq
	NJa7haiWAPJbgJl8c+nJv6DG5wvS+rRsPkYwJuLc16Es3MmWM/t0MjC/Br3gWWKWy9ie
	s34MO8xwnpXzxRdANzqirr+tYdl9Jqq96mX6dmmv6Q+HQ17TjQ4OQANkdjJQDeCCZIU6
	pBu1t2ie6ke2fgUbxuH/+Dt3Wn0rDpKqA1TKjZQZoPYfPe6sgkVuBgzkx6V7q/udVtrN
	hYJg==
X-Gm-Message-State: AMke39kFWDqvq9Ar0SPJCgOEdKi36NS/7mFpSdotAfOCNW8CQ8J9UQTCzTg/tLSe0JDMqA==
X-Received: by 10.223.136.82 with SMTP id e18mr6401761wre.28.1488992732701;
	Wed, 08 Mar 2017 09:05:32 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 63sm5495064wmp.9.2017.03.08.09.05.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 08 Mar 2017 09:05:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Mar 2017 18:05:33 +0100
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20170308170533.GE3279@jama>
References: <1488992224-2962-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1488992224-2962-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: disable cryptodev by default
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
X-List-Received-Date: Wed, 08 Mar 2017 17:05:32 -0000
X-Groupsio-MsgNum: 94403
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h56sxpGKRmy85csR"
Content-Disposition: inline

--h56sxpGKRmy85csR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2017 at 04:57:04PM +0000, Ross Burton wrote:
> Cryptodev is a way for userspace to access the kernel crypto drivers (and=
 so,
> hardware crypto).
>=20
> Not all hardware supports cryptodev so this is something that should be e=
nabled
> in a BSP layer instead of in oe-core.

How is BSP layer supposed to enable this without being considered toxic
to all other layers which might support MACHINEs with the same
TUNE_PKGARCH?

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-connectivity/openssl/openssl.inc       | 2 ++
>  meta/recipes-connectivity/openssl/openssl_1.0.2k.bb | 5 -----
>  2 files changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes=
-connectivity/openssl/openssl.inc
> index 9afa5bd..03dee0e 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -15,7 +15,9 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
>            "
>  S =3D "${WORKDIR}/openssl-${PV}"
> =20
> +PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[perl] =3D ",,,"
> +PACKAGECONFIG[cryptodev] =3D "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,-=
UHAVE_CRYPTODEV,cryptodev-linux"
> =20
>  AR_append =3D " r"
>  TERMIO_libc-musl =3D "-DTERMIOS"
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb b/meta/r=
ecipes-connectivity/openssl/openssl_1.0.2k.bb
> index 1973f81..4436ba3 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb
> @@ -1,10 +1,5 @@
>  require openssl.inc
> =20
> -# For target side versions of openssl enable support for OCF Linux driver
> -# if they are available.
> -DEPENDS +=3D "cryptodev-linux"
> -
> -CFLAG +=3D "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
>  CFLAG_append_class-native =3D " -fPIC"
> =20
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D27ffa5d74bb5a337056c14b2ef93f=
bf6"
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h56sxpGKRmy85csR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWMA53AAKCRA3VSO3ZXaA
HL//AKC1SppsIdeDj+hdNKO7Gk2iAks7WQCgsMHrhf2KbrDiBl65RcBsnwgsngU=
=Bot+
-----END PGP SIGNATURE-----

--h56sxpGKRmy85csR--
