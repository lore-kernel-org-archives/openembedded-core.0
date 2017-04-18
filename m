Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id BBEB471C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 13:29:22 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id z129so12117430wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 06:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ShWZjLbISk8MusFwcftiUbYWRCeVZKqV05puIchxXEQ=;
	b=K9PXdTErS+TTqOmy+/4mRt9hQVrbhGSYffmn2NQXILAM2y23RE4HyGRAaYTr7h5kBQ
	ZDS8zbY2Y5HsTE0IHBM7hojlkAnTZr09aRkpx9SGGLFHCZHbsSYkomP6yenu101/8NgI
	YaUw6uVvq+DYb8Z7TnxtMUwJdxmI4fPjErbHI3hf3EO/FT5UGZIWCGipQbkuxpboeLBj
	nriarU795Gs5qDInyZovj7XzyQwaiN3ZBaeFrr4iAIKDoIZMiIAdLcSRLseINizWoj72
	VR3yX/XwfSm6TWSRynesAIM8vEb1B92Uicii2NUJtr/qtXo70BRAPD9Y8keuCfeY45yn
	V5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ShWZjLbISk8MusFwcftiUbYWRCeVZKqV05puIchxXEQ=;
	b=eTiPhw7FB8UXDd0obYs51pm7euOw9CtrOY6nV3KzYv08+344p+Jg6AWiWmUDRC4fV0
	0X6wyptms1FmNL+YGdQQlm+kvtlXWzKC40SZke9li0cUlLiVqUWd1Gbj1X/aJ+PvE8gL
	rSKLM9bJjT0zFkDQusrvI00i8qr3wK7D4P5+bpDiirALB9EiiXzrnhWmdqfsmY2hg6vc
	cTwruOtEIxD8lKi4TBV3jmZr/HJWzIyEVk3Ox957BrU/9FvWny683kWDjbFRUnJaxmQa
	ABhoX0YUG56xPUtOGuIKTZTLHb1KIKDqjYJXALhGew1q7+7tCts13w4jqO5LWhGuZxbD
	GNAw==
X-Gm-Message-State: AN3rC/5raPkfhQ0rte5irore2jJ78OXUBpIIodUfnZgcnnfd2sQDmSmr
	syJ7b45eopgZDA==
X-Received: by 10.28.27.80 with SMTP id b77mr4238290wmb.16.1492522163391;
	Tue, 18 Apr 2017 06:29:23 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 32sm1892478wrq.34.2017.04.18.06.29.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 18 Apr 2017 06:29:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 18 Apr 2017 15:29:26 +0200
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20170418132926.GB3126@jama>
References: <1492510123-21370-1-git-send-email-jussi.kukkonen@intel.com>
MIME-Version: 1.0
In-Reply-To: <1492510123-21370-1-git-send-email-jussi.kukkonen@intel.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "openssl: Fix symlink creation"
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
X-List-Received-Date: Tue, 18 Apr 2017 13:29:25 -0000
X-Groupsio-MsgNum: 96379
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PmA2V3Z32TCmWXqI"
Content-Disposition: inline

--PmA2V3Z32TCmWXqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2017 at 01:08:43PM +0300, Jussi Kukkonen wrote:
> This reverts commit 991620f3962a9917fa99abb5582f4b72ebd42a3d.
>=20
> The commit breaks openssl-native (you can no longer generate keys
> because it can't find the configuration file). Also the idea that we
> would install configuration files normally but then add the symlinks
> pointing to them in a postinstall feels wrong.
>=20
> Fixes [YOCTO #11296]. The bug contains an alternative fix but I'm
> sending a revert as I cannot fully understand the motive of the
> original patch. See also discussion in
> http://lists.openembedded.org/pipermail/openembedded-core/2017-April/1351=
76.html
>=20
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
>  meta/recipes-connectivity/openssl/openssl.inc | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes=
-connectivity/openssl/openssl.inc
> index c721d8c..8f2a797 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -201,6 +201,7 @@ do_install () {
>  	   ${D}${sysconfdir}/ssl/
>  	ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl/certs
>  	ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl/private
> +	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl/openssl.cnf
>  }
> =20
>  do_install_ptest () {
> @@ -248,16 +249,4 @@ do_install_append_class-native() {
>  	    OPENSSL_ENGINES=3D${libdir}/ssl/engines
>  }
> =20
> -pkg_postinst_openssl-conf () {
> -#!/bin/sh
> -if [ -e $D${libdir}/ssl/openssl.cnf ]; then
> -	rm -f $D${libdir}/ssl/openssl.cnf
> -fi
> -
> -# If openssl-conf is installed before openssl, we must ensure that the s=
ymlink
> -# destination exists
> -mkdir -p $D${libdir}/ssl/
> -ln -s ${sysconfdir}/ssl/openssl.cnf $D${libdir}/ssl/openssl.cnf
> -}
> -
>  BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PmA2V3Z32TCmWXqI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWPYUtQAKCRA3VSO3ZXaA
HORHAJ9jhBJgGfG4Ac9stJCwW+0G3ScssACgkH7X0MgvOdGfTVgte9RoeXDbu54=
=+A++
-----END PGP SIGNATURE-----

--PmA2V3Z32TCmWXqI--
