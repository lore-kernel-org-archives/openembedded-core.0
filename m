Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0739C609C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:57:43 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id pv20so1265274lab.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 07:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zqvdto1GtEayA3LSF16DG6yvkz2kd4QnBaaNO39qB5A=;
	b=y8rQvkraZDIUE1lTncid30+8yNdwZyRUTHDy/c6zv85Wtw0KzFzS7z8qJ7JX41ivTw
	KMl+H3Q0co/mALfQeHpv9NCMLeEEUL4dARRlSXZb+HXPJ8QIXUJYTIEAuBS7v6Wnxjfd
	OkLbaOVNzeOe9gdsBBkpEQE9MQQ4lfuwZl6Ow+S+PEoxzka5qlApjmMDMnkzAHZB1U6p
	kDWlBpo03MHQ6bhoe1TvSzMScljrYnEPhzOcUrO/EoqGdYDAWBno3WHeUpi7qFHGoIDO
	jg6O/n+C/5fGQzhTWR2azekMoh2dcxFZOp8QXr3VKactSUKj0JdMBGtAxGouUXMDAjOl
	8onA==
X-Received: by 10.152.4.39 with SMTP id h7mr5827292lah.49.1408028264259;
	Thu, 14 Aug 2014 07:57:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	qz5sm8224942lbb.39.2014.08.14.07.57.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 07:57:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Aug 2014 16:58:20 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140814145820.GK14848@jama>
References: <1408026352.22187.112.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1408026352.22187.112.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Add alsa PACKAGECONFIG and cleanup native/nativesdk DEPENDS
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
X-List-Received-Date: Thu, 14 Aug 2014 14:57:46 -0000
X-Groupsio-MsgNum: 56518
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bHoIUPdzgh/2fjbD"
Content-Disposition: inline

--bHoIUPdzgh/2fjbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 03:25:52PM +0100, Richard Purdie wrote:
> Converting this dependency to become a PACKAGECONFIG makes sense. Since
> there is a "," in the configuration option, its not quite as straightforw=
ard
> as normal.
>=20
> Also clean up the native and nativesdk DEPENDS and set the PACKAGECONFIG
> entries to match the old behaviour by default.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 0c89e0b..e6f9e38 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -1,10 +1,10 @@
>  SUMMARY =3D "Fast open source processor emulator"
>  HOMEPAGE =3D "http://qemu.org"
>  LICENSE =3D "GPLv2 & LGPLv2.1"
> -DEPENDS =3D "glib-2.0 zlib alsa-lib pixman \
> +DEPENDS =3D "glib-2.0 zlib pixman \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx1=
1', '', d)}"
> -DEPENDS_class-native =3D "zlib-native alsa-lib-native glib-2.0-native pi=
xman-native dtc-native"
> -DEPENDS_class-nativesdk =3D "nativesdk-zlib nativesdk-libsdl nativesdk-g=
lib-2.0 nativesdk-pixman nativesdk-dtc"
> +DEPENDS_class-native =3D "zlib-native glib-2.0-native pixman-native"
> +DEPENDS_class-nativesdk =3D "nativesdk-zlib nativesdk-glib-2.0 nativesdk=
-pixman"
>  RDEPENDS_${PN}_class-nativesdk =3D "nativesdk-libsdl"
>  RDEPENDS_${PN}_class-target +=3D "bash python"
> =20
> @@ -26,7 +26,7 @@ SRC_URI_append_class-native =3D "\
>      file://fix-libcap-header-issue-on-some-distro.patch \
>      "
> =20
> -EXTRA_OECONF +=3D "--target-list=3D${@get_qemu_target_list(d)} --disable=
-werror --audio-drv-list=3Doss,alsa --disable-bluez --with-system-pixman --=
extra-cflags=3D'${CFLAGS}'"
> +EXTRA_OECONF +=3D "--target-list=3D${@get_qemu_target_list(d)} --disable=
-werror  --disable-bluez --with-system-pixman --extra-cflags=3D'${CFLAGS}'"
> =20
>  EXTRA_OECONF_class-nativesdk =3D "--target-list=3D${@get_qemu_target_lis=
t(d)} --disable-werror \
>  				"
> @@ -79,7 +79,9 @@ do_install_append() {
>  }
>  # END of qemu-mips workaround
> =20
> -PACKAGECONFIG ??=3D "fdt sdl"
> +PACKAGECONFIG ??=3D "fdt sdl alsa"
> +PACKAGECONFIG_class-native ??=3D "fdt alsa"
> +PACKAGECONFIG_class-nativesdk ??=3D "fdt sdl"
>  PACKAGECONFIG[virtfs] =3D "--enable-virtfs --enable-attr,--disable-virtf=
s,libcap attr,"
>  PACKAGECONFIG[aio] =3D "--enable-linux-aio,--disable-linux-aio,libaio,"
>  PACKAGECONFIG[xfs] =3D "--enable-xfsctl,--disable-xfsctl,xfsprogs,"
> @@ -100,6 +102,9 @@ PACKAGECONFIG[sdl] =3D "--enable-sdl,--disable-sdl,li=
bsdl,"
>  PACKAGECONFIG[ssh2] =3D "--enable-libssh2,--disable-libssh2,libssh2,"
>  PACKAGECONFIG[libusb] =3D "--enable-libusb,--disable-libusb,libusb1"
>  PACKAGECONFIG[fdt] =3D "--enable-fdt,--disable-fdt,dtc"
> +PACKAGECONFIG[alsa] =3D ",,alsa-lib"
> +
> +EXTRA_OECONF +=3D "${@bb.utils.contains('PACKAGECONFIG', 'alsa', '--audi=
o-drv-list=3Doss,alsa', '', d)}"

Is there some option to disable it, when alsa PACKAGECONFIG isn't
selected? Or is it disabled by default?

>  # Qemu target will not build in world build for ARM or Mips
>  BROKEN_qemuarm =3D "1"
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bHoIUPdzgh/2fjbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPszowACgkQN1Ujt2V2gBy5xQCeOMEO4co2EBtCOfUtyNCZ9lOM
2P0AoJq8pBVHVI+PAvIdhRPpZLSMb5vP
=CZYu
-----END PGP SIGNATURE-----

--bHoIUPdzgh/2fjbD--
