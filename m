Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3277672130
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 10:27:22 +0000 (UTC)
Received: by wggy19 with SMTP id y19so32398726wgg.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2015 02:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6Nrjk3Nhsf/Fw8B7ApJ8YqqTt/hlw5SU2/jB8C8G5H0=;
	b=MyshAhxzWLlCm3B5VyAXgOiC4pomvEnNrSl00oRq0XwABJNeYpUm52ZgGrlTFmgmHu
	KRxEEWvX0n07hj2B8o3dg7MWQ6wmeSsaLkakRqTuD+rDnMC/h1mKZSM5OXGQ9AzVMaSB
	zyAKCRpBSMRarxGKzb4HYKFtcXkq0m+1jynRQlY798mmGAraaCDfRwtx9dTgRTfk6wqx
	Gkj9dmDYibBuMRzyXQ4dH5LIeUfY37WmylxO9TvQFw6i18Ae04UgMFoNhN//Wn32gq+w
	kQ6C1B6c9AbuVGF0DUDIymaJ97clcTHeIVKFY1psmlbw8WsBWIKeiOoVrCKIhKcjYysX
	SESA==
X-Received: by 10.180.79.232 with SMTP id m8mr35075418wix.81.1425292044019;
	Mon, 02 Mar 2015 02:27:24 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id ul1sm299055wjc.0.2015.03.02.02.27.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 02:27:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Mar 2015 11:27:46 +0100
To: Florian Boor <florian.boor@kernelconcepts.de>
Message-ID: <20150302102746.GZ2309@jama>
References: <1425291313-9669-1-git-send-email-florian.boor@kernelconcepts.de>
MIME-Version: 1.0
In-Reply-To: <1425291313-9669-1-git-send-email-florian.boor@kernelconcepts.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Florian Boor <florian@kernelconcepts.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] fltk: Replace use of freetype-config with pkg-config Drop blacklist entry
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
X-List-Received-Date: Mon, 02 Mar 2015 10:27:23 -0000
X-Groupsio-MsgNum: 62863
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WxezjuMNsgvRf6mf"
Content-Disposition: inline

--WxezjuMNsgvRf6mf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2015 at 11:15:13AM +0100, Florian Boor wrote:
> From: Florian Boor <florian@kernelconcepts.de>
>=20
> Tested building for MIPS 32bit QEMU

Wrong ML, please resend to oe-devel.

>=20
> Signed-off-by: Florian Boor <florian@kernelconcepts.de>
> ---
>  .../fltk/fltk-1.1.10/fltk-no-freetype-config.patch   |   18 ++++++++++++=
++++++
>  meta-oe/recipes-support/fltk/fltk_1.1.10.bb          |    7 +++----
>  2 files changed, 21 insertions(+), 4 deletions(-)
>  create mode 100644 meta-oe/recipes-support/fltk/fltk-1.1.10/fltk-no-free=
type-config.patch
>=20
> diff --git a/meta-oe/recipes-support/fltk/fltk-1.1.10/fltk-no-freetype-co=
nfig.patch b/meta-oe/recipes-support/fltk/fltk-1.1.10/fltk-no-freetype-conf=
ig.patch
> new file mode 100644
> index 0000000..5dbb054
> --- /dev/null
> +++ b/meta-oe/recipes-support/fltk/fltk-1.1.10/fltk-no-freetype-config.pa=
tch
> @@ -0,0 +1,18 @@
> +--- a/configure.in.orig	2015-03-01 16:00:35.956432907 +0100
> ++++ b/configure.in	2015-03-01 16:04:23.269580093 +0100
> +@@ -865,11 +865,11 @@
> +         AC_ARG_ENABLE(xft, [  --enable-xft            turn on Xft suppo=
rt [default=3Dno]])
> +=20
> + 	if test x$enable_xft =3D xyes; then
> +-            AC_PATH_PROG(FTCONFIG,freetype-config)
> ++            AC_PATH_PROG(PKGCONFIG,pkg-config)
> +=20
> +-	    if test "x$FTCONFIG" !=3D x; then
> +-	        CPPFLAGS=3D"`$FTCONFIG --cflags` $CPPFLAGS"
> +-	        CXXFLAGS=3D"`$FTCONFIG --cflags` $CXXFLAGS"
> ++	    if test "x$PKGCONFIG" !=3D x; then
> ++	        CPPFLAGS=3D"`$PKGCONFIG --cflags xft` $CPPFLAGS"
> ++	        CXXFLAGS=3D"`$PKGCONFIG --cflags xft` $CXXFLAGS"
> +=20
> + 		AC_CHECK_HEADER(X11/Xft/Xft.h,
> + 		    AC_CHECK_LIB(Xft, XftDrawCreate,
> diff --git a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb b/meta-oe/recipe=
s-support/fltk/fltk_1.1.10.bb
> index 4fd3645..3229ed0 100644
> --- a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
> +++ b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
> @@ -6,19 +6,18 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1c0b73db6688=
4b6a925e727400315130"
> =20
>  DEPENDS =3D "alsa-lib zlib jpeg libpng libxext libxft"
> =20
> -PR =3D "r1"
> -
> -PNBLACKLIST[fltk] ?=3D "broken: still uses /usr/bin/freetype-config"
> +PR =3D "r2"
> =20
>  SRC_URI =3D "ftp://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/flt=
k/${PV}/fltk-${PV}-source.tar.bz2 \
>             file://disable_test.patch \
>             file://dso-fix.patch \
>             file://libpng15.patch \
> +           file://fltk-no-freetype-config.patch \
>  "
> =20
>  S =3D "${WORKDIR}/fltk-${PV}"
> =20
> -inherit lib_package autotools-brokensep binconfig
> +inherit lib_package autotools-brokensep binconfig pkgconfig
> =20
>  TARGET_CC_ARCH +=3D "${LDFLAGS} -DXFT_MAJOR=3D2"
> =20
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WxezjuMNsgvRf6mf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT0OyIACgkQN1Ujt2V2gByp1wCfSnxknsuqKJE7ieSH2O7PXDcK
nywAoLY5qZq9VROoVZr5sce2LTD+amO3
=/TNi
-----END PGP SIGNATURE-----

--WxezjuMNsgvRf6mf--
