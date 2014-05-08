Return-Path: <martin.jansa@gmail.com>
Received: from mail-pa0-f41.google.com (unknown [209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id E0D0765F06
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 10:53:13 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id lj1so2766842pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 03:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3B2UlwZ0FIPt+4jgQ+15mlCr4tFtW09+H4IEz9tjMuo=;
	b=Y6FjxExVBLHtRQ2LzWtYINw0hDAB2axv1AnDMhg3WUF2L9jm/iCB721TQS3WTkubnE
	VUww7AFtBfEmr6GOEBTSj3ziyFEU2XTKx7B1Y7Ltq8jJ1A3ahnka0QalA3d552g5vqgb
	xUsBXRsTf64fREMeKmstVtr1lUE8QaaANMmTYdSzvfgPKXkEZcE9FN9y9CL/LH8JqxJN
	sk/OQylCz+EKTs+zAbgCJ0FwT+qvvqY/oSC0HFIq3HUqbLaMlxFwnl8hJlDu6sZmIRqZ
	XDBYKXTTilLu/yURgGiWjEvdccwlE5Q4bCmrL2Z7b4qMJn3NUpTN2qBJEnQQ5h9vKkqc
	uRiw==
X-Received: by 10.67.5.233 with SMTP id cp9mr6038625pad.147.1399546394523;
	Thu, 08 May 2014 03:53:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	au16sm3058576pac.27.2014.05.08.03.53.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 May 2014 03:53:12 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 May 2014 12:53:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Petter =?iso-8859-1?Q?Mab=E4cker?= <petter@technux.se>
Message-ID: <20140508105334.GP30955@jama>
References: <cover.1399497346.git.petter@technux.se>
	<f81a9671ffe21ca44d9a06d78a61550e94ba170c.1399497346.git.petter@technux.se>
MIME-Version: 1.0
In-Reply-To: <f81a9671ffe21ca44d9a06d78a61550e94ba170c.1399497346.git.petter@technux.se>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/13] python: remove usage of FILESPATH
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
X-List-Received-Date: Thu, 08 May 2014 10:53:14 -0000
X-Groupsio-MsgNum: 52970
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H14uD12u8nekTETJ"
Content-Disposition: inline

--H14uD12u8nekTETJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 11:19:56PM +0200, Petter Mab=E4cker wrote:
> Fixes [YOCTO #4497]
>=20
> Usage of FILESPATH is discouraged, since it can make recipes harder to
> bbappend. Instead FILESEXTRAPATHS should be used to extend the
> path. Don't migrate paths that already exist in base FILESPATH to
> FILESEXTRAPATHS (e.g. BPN, BP and files).
>=20
> Signed-off-by: Petter Mab=E4cker <petter@technux.se>
> ---
>  .../recipes-devtools/python/python-native_2.7.3.bb |    2 +-
>  .../python/python-pygobject_2.28.3.bb              |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/r=
ecipes-devtools/python/python-native_2.7.3.bb
> index 0c66d27..4949546 100644
> --- a/meta/recipes-devtools/python/python-native_2.7.3.bb
> +++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
> @@ -21,7 +21,7 @@ SRC_URI +=3D "\
>             "
>  S =3D "${WORKDIR}/Python-${PV}"
> =20
> -FILESPATH =3D "${FILE_DIRNAME}/python-native/:${FILE_DIRNAME}/python/"
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> =20
>  inherit native
> =20
> diff --git a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb b/me=
ta/recipes-devtools/python/python-pygobject_2.28.3.bb
> index 9dbe47c..691666c 100644
> --- a/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
> +++ b/meta/recipes-devtools/python/python-pygobject_2.28.3.bb
> @@ -16,7 +16,7 @@ SRC_URI[md5sum] =3D "aa64900b274c4661a5c32e52922977f9"
>  SRC_URI[sha256sum] =3D "7da88c169a56efccc516cebd9237da3fe518a343095a6646=
07b368fe21df95b6"
>  S =3D "${WORKDIR}/pygobject-${PV}"
> =20
> -FILESPATH =3D "${FILE_DIRNAME}/python-pygobject:${FILE_DIRNAME}/files"
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"

Is this one correct?

There is
BBCLASSEXTEND =3D "native"

and prepending python-pygobject-native doesn't seem to be needed.

>  EXTRA_OECONF +=3D "--disable-introspection"
> =20
>  PARALLEL_MAKEINST =3D ""
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H14uD12u8nekTETJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNrYi4ACgkQN1Ujt2V2gBxUewCfQ4BKfIUDQMd3ovnzbWxX5O5V
TMMAn0fPxOAzeuxuZUGdfnU421zZKMk/
=wuX8
-----END PGP SIGNATURE-----

--H14uD12u8nekTETJ--
