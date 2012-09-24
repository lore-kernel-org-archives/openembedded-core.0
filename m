Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGF26-00084c-Ml
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 22:13:34 +0200
Received: by wgbdq11 with SMTP id dq11so4333921wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 13:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Cv8mvPnNYYOriBvJoTf6A93RWrK7Rfr2Zrsp4+6XXnY=;
	b=jyjtHO4T9GgLgIkY1IZyCr+PbuYScVTSlyiF8yo7H+SZIuDDIRgDvEJCRpi1GU4p8p
	1KNGb/Xr35YyfoMcqenbw8X4zbkuf1dnfnROtj6cHRPWokUaYzFUggQB6Kaj6PWKaanu
	oTC1KzYYKMBrOx6C6DUsQQKD8nirzZhHCkOyrPxqo21sk36jGDvTiX5yz/7oanUZITDX
	h++LoAhjMiR3HjCbOrvV6L0sX+CMYwMQI8CCO0zoW6oW272XSVUKjgKvZGSOJmuQ089j
	Ooeznfsec99ZKkEY5aUj6vYBqI/v5kOAc9Xy77n8Xe3CzciDpJaMCiv4UFQo94vtIRCg
	Ulxg==
Received: by 10.180.81.193 with SMTP id c1mr16510960wiy.12.1348516846602;
	Mon, 24 Sep 2012 13:00:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cw4sm13162085wib.4.2012.09.24.13.00.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 13:00:45 -0700 (PDT)
Date: Mon, 24 Sep 2012 22:00:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Matthew McClintock <msm@freescale.com>
Message-ID: <20120924200050.GF3295@jama.jama.net>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1348516546-26005-1-git-send-email-msm@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] libx11.inc: disable warnings that don't work on certain compilers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 20:13:35 -0000
X-Groupsio-MsgNum: 29799
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="idY8LE8SD6/8DnRI"
Content-Disposition: inline

--idY8LE8SD6/8DnRI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 02:55:45PM -0500, Matthew McClintock wrote:
> Fixes these sorts of issues present on older gcc (CentOS 5.x in this case)
>=20
> | cc1: error: unrecognized command line option "-Werror=3Dimplicit"
> | cc1: error: unrecognized command line option "-Werror=3Dnonnull"
> | cc1: error: unrecognized command line option "-Werror=3Dinit-self"
> | cc1: error: unrecognized command line option "-Werror=3Dmain"
> | cc1: error: unrecognized command line option "-Werror=3Dmissing-braces"
> | cc1: error: unrecognized command line option "-Werror=3Dsequence-point"
> | cc1: error: unrecognized command line option "-Werror=3Dreturn-type"
> | cc1: error: unrecognized command line option "-Werror=3Dtrigraphs"
> | cc1: error: unrecognized command line option "-Werror=3Darray-bounds"
> | cc1: error: unrecognized command line option "-Werror=3Dwrite-strings"
> | cc1: error: unrecognized command line option "-Werror=3Daddress"
> | cc1: error: unrecognized command line option "-Werror=3Dint-to-pointer-=
cast"
> | cc1: error: unrecognized command line option "-Werror=3Dpointer-to-int-=
cast"

Shouldn't it be applied only for -native? version?

Cheers,

>=20
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/recipes-graphics/xorg-lib/libx11.inc |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-gra=
phics/xorg-lib/libx11.inc
> index 3ecd9e5..0e99442 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
> @@ -11,7 +11,7 @@ inherit siteinfo
>  FILESPATH =3D "${FILE_DIRNAME}/libx11"
> =20
>  PE =3D "1"
> -INC_PR =3D "r8"
> +INC_PR =3D "r9"
> =20
>  PROVIDES =3D "virtual/libx11"
> =20
> @@ -23,6 +23,7 @@ DEPENDS +=3D "xproto xextproto xtrans libxcb kbproto in=
putproto"
>  DEPENDS +=3D "xproto-native"
> =20
>  EXTRA_OECONF +=3D "--with-keysymdefdir=3D${STAGING_INCDIR}/X11/"
> +EXTRA_OEMAKE =3D '-e CWARNFLAGS=3D""'
> =20
>  # Let people with incredibly archaic requirements enable Xcms and BigFon=
t, but
>  # disable them by default.
> --=20
> 1.7.9.7
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--idY8LE8SD6/8DnRI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBgu/IACgkQN1Ujt2V2gByT5ACggtpiRu79rIbzFWAchJbCiigD
vyQAn2Ab26zS/YV7SiocbJUgXBU2sMve
=oZfT
-----END PGP SIGNATURE-----

--idY8LE8SD6/8DnRI--
