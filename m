Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 31A7471044
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 10:54:31 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id bs8so8893070wib.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 03:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bQS5oz9HSoQII8A4yaZOsbwyaMJWHtS4FoTOI6ka49k=;
	b=hga7oHmUmFlt+HuUV0B/NUq7i9W0yE97Du8+roI41TE297xw0OsoPA9JFUmlt2JqNU
	2Wk9TBOSQK/ngLrA3krQYmJB8bjMLlBi7YhXZMZq9XLILjZV6fr9m0e8fEpyFnmkHtk9
	tP9cmWaKmx+CrqAOvM9R5x00+owJUcbiFFwZJEgIOFgLmhfE5bSY37MSXu8XAj4cfMQk
	7vvaNws/jCHYlEg9Nm/G/LgbZD/q9DbqmUrymvDCxBBjmTmL3FQwmbDS6NMeUvFd0MNT
	IX9Qi+/NME0ps2cjmbPj1N2Nk/EXCgxcXA7F3aSoD/aNwg1atnNodQhPSgT/6WmVYZe3
	klhg==
X-Received: by 10.180.104.163 with SMTP id gf3mr3062065wib.24.1409309671797;
	Fri, 29 Aug 2014 03:54:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wr10sm17721449wjc.10.2014.08.29.03.54.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Aug 2014 03:54:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 29 Aug 2014 12:54:41 +0200
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <20140829105441.GN16066@jama>
References: <1409307382-1835-1-git-send-email-dv@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <1409307382-1835-1-git-send-email-dv@pseudoterminal.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] libsdl: add packageconfigs for x11, directfb, opengl
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
X-List-Received-Date: Fri, 29 Aug 2014 10:54:34 -0000
X-Groupsio-MsgNum: 57146
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R4+lwT0Y15rLnKR0"
Content-Disposition: inline

--R4+lwT0Y15rLnKR0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2014 at 12:16:22PM +0200, Carlos Rafael Giani wrote:
> Also adds special treatment of nativesdk versions to avoid build errors
>=20
> Adapted from openembedded-core-contrib, commit
> cb921237643be39aa8f44ea4c35d3cfd30f782c0
>=20
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 25 +++++++++++++++------=
----
>  1 file changed, 15 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes=
-graphics/libsdl/libsdl_1.2.15.bb
> index e544b60..8a30abc 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -12,11 +12,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D27818cd7fd8=
3877a8e3ef82b82798ef4"
> =20
>  PROVIDES =3D "virtual/libsdl"
> =20
> -DEPENDS =3D "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'direct=
fb', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/li=
bgl libglu', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx1=
1 libxext libxrandr libxrender', '', d)} \
> -           tslib"
> -DEPENDS_class-nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x1=
1', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nati=
vesdk-libxext', '', d)}"
> +DEPENDS =3D "tslib"
> +# necessary because there is no nativesdk-tslib
> +DEPENDS_class-nativesdk =3D ""
> =20
>  PR =3D "r3"
> =20
> @@ -42,16 +40,23 @@ EXTRA_OECONF =3D "--disable-static --enable-cdrom --e=
nable-threads --enable-timers
>                  --disable-video-fbcon --disable-video-ps2gs --disable-vi=
deo-ps3 \
>                  --disable-xbios --disable-gem --disable-video-dummy \
>                  --enable-input-events --enable-input-tslib --enable-pthr=
eads \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '--e=
nable-video-directfb', '--disable-video-directfb', d)} \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--ena=
ble-video-opengl', '--disable-video-opengl', d)} \
> -                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--enable=
-video-x11', '--disable-video-x11', d)} \
>                  --disable-video-svga \
>                  --disable-video-picogui --disable-video-qtopia --enable-=
sdl-dlopen \
>                  --disable-rpath \
>                  --disable-pulseaudio"
> =20
> -PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'al=
sa', '', d)}"
> -PACKAGECONFIG[alsa] =3D "--enable-alsa --disable-alsatest,--disable-alsa=
,alsa-lib,"
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'al=
sa', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '=
directfb', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'op=
engl', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',=
 '', d)}"
> +# virtual/libgl-nativesdk is not available
> +PACKAGECONFIG_virtclass-nativesdk =3D "${@base_contains('DISTRO_FEATURES=
', 'alsa', 'alsa', '', d)} \

You can use just _class-nativesdk now, it wasn't available when I did my ol=
d change.

And you should also use bb.utils.contains here.

> +                                     ${@base_contains('DISTRO_FEATURES',=
 'directfb', 'directfb', '', d)} \
> +                                     ${@base_contains('DISTRO_FEATURES',=
 'x11', 'x11', '', d)}"
> +PACKAGECONFIG[alsa] =3D "--enable-alsa --disable-alsatest,--disable-alsa=
,alsa-lib"
> +PACKAGECONFIG[directfb] =3D "--enable-video-directfb,--disable-video-dir=
ectfb,directfb"
> +PACKAGECONFIG[opengl] =3D "--enable-video-opengl,--disable-video-opengl,=
virtual/libgl libglu"
> +PACKAGECONFIG[x11] =3D "--enable-video-x11,--disable-video-x11,virtual/l=
ibx11 libxext libxrandr libxrender"
> =20
>  PARALLEL_MAKE =3D ""
> =20
> --=20
> 1.8.3.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R4+lwT0Y15rLnKR0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQAW/EACgkQN1Ujt2V2gBzHygCfcwhDM7UChjnTQpUUrshXjz6Q
JugAnjpOiHC2XS0JJC6AHDJr0lTsL10B
=OAfj
-----END PGP SIGNATURE-----

--R4+lwT0Y15rLnKR0--
