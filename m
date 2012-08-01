Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwYTd-0005OT-Ce
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:56:37 +0200
Received: by wgbdr1 with SMTP id dr1so6114552wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8ZB/qqPjt/YkLKcOOPxn6hXPbYFG73JKXxsUYmFA/tY=;
	b=OQ36OUFF4w7zzyVAjnlJ2jj6FI2baWI7CeusdH8A4Dr4HOzcnzggS/2Vnpwbf8P30D
	MUwfvhZcx2Q5Ja5uPTyOB455rd2yDK6W1t62oGYTDIhsi3HJs6IK39bE76zBXDSsYMH9
	8m2bHNc24KxTT4x1Jzq6PttSSAbNRMSH+z6m65pK7ruiLtignhuPNaVyzv0QB1WfkYmJ
	bVcWq9VEpzxg1eaEKrP62N9tdt+NtxaRHd7R/6o2I/G5ea2mfd3OXEiecT1i2L+xkz9P
	gxLPtD4JQKhY4/l20H4MWelVpkAXy9iNJq5uWE07kXPoQYC11+emahrcUZuvwPqpIu9k
	xRLA==
Received: by 10.180.89.235 with SMTP id br11mr16295853wib.3.1343825099257;
	Wed, 01 Aug 2012 05:44:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z11sm8499134wiv.10.2012.08.01.05.44.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:44:58 -0700 (PDT)
Date: Wed, 1 Aug 2012 14:44:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120801124455.GE16306@jama.jama.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<6d27974b9045ca97ce135095a9d48715ac5bdc6c.1343823907.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <6d27974b9045ca97ce135095a9d48715ac5bdc6c.1343823907.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 07/12] mesa: enable GLESv2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 12:56:37 -0000
X-Groupsio-MsgNum: 26635
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LSp5EJdfMPwZcMS1"
Content-Disposition: inline

--LSp5EJdfMPwZcMS1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2012 at 01:31:13PM +0100, Ross Burton wrote:
> Patch originally by Damien Lespiau <damien.lespiau@intel.com>.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/mesa/mesa-common.inc |    7 +++++--
>  meta/recipes-graphics/mesa/mesa-dri.inc    |    1 +
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-gr=
aphics/mesa/mesa-common.inc
> index 01eb5b3..d9758b9 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -12,7 +12,7 @@ SECTION =3D "x11"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D03ccdc4c379c4289aec=
fb8892c546f67"
> =20
> -INC_PR =3D "r0"
> +INC_PR =3D "r1"
>  PE =3D "2"
> =20
> =20
> @@ -21,7 +21,7 @@ LIB_DEPS =3D "virtual/libx11 libxext libxxf86vm libxdam=
age libxfixes libxml2-nativ
> =20
>  DEPENDS =3D "makedepend-native python-native flex-native bison-native ${=
PROTO_DEPS} ${LIB_DEPS}"
> =20
> -PROVIDES =3D "virtual/libgl"
> +PROVIDES =3D "virtual/libgl virtual/libgles2"

Shouldn't be this provided only for opengles2 in DISTRO_FEATURES?
 =20
>  # for mesa-dri and mesa-xlib
>  FILESEXTRAPATHS_append :=3D "${THISDIR}/mesa:"
> @@ -46,10 +46,12 @@ PACKAGES =3D+ "libegl libegl-dev libegl-dbg \
>               libgl libgl-dev \
>               libglapi libglapi-dev libglapi-dbg\
>               libgbm libgbm-dev libgbm-dbg \
> +             libgles2 libgles2-dev \
>              "
> =20
>  FILES_libegl =3D "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
>  FILES_libgbm =3D "${libdir}/libgbm.so.*"
> +FILES_libgles2 =3D "${libdir}/libGLESv2.so.*"
>  FILES_libgl =3D "${libdir}/libGL.so.*"
>  FILES_libglapi =3D "${libdir}/libglapi.so.*"
>  FILES_libglu =3D "${libdir}/libGLU.so.*"
> @@ -59,6 +61,7 @@ FILES_libegl-dev =3D "${libdir}/libEGL.* ${includedir}/=
EGL"
>  FILES_libgbm-dev =3D "${libdir}/libgbm* ${libdir}/pkgconfig/gbm.pc ${inc=
ludedir}/gbm.h"
>  FILES_libgl-dev =3D "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgcon=
fig/gl.pc"
>  FILES_libglapi-dev =3D "${libdir}/libglapi.*"
> +FILES_libgles2-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libd=
ir}/pkgconfig/glesv2.pc"
>  FILES_libglu-dev =3D "${libdir}/libGLU.* ${includedir}/GL/glu*.h ${libdi=
r}/pkgconfig/glu.pc"
>  FILES_libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
> =20
> diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graph=
ics/mesa/mesa-dri.inc
> index f8f1fff..1d325eb 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri.inc
> +++ b/meta/recipes-graphics/mesa/mesa-dri.inc
> @@ -10,6 +10,7 @@ DRIDRIVERS_append_x86-64 =3D ",i915,i965"
> =20
>  EXTRA_OECONF +=3D "--disable-gallium --without-gallium-drivers"
>  EXTRA_OECONF +=3D "--enable-dri --with-dri-drivers=3D${DRIDRIVERS}"
> +EXTRA_OECONF +=3D "${@base_contains('DISTRO_FEATURES', 'opengles2', '--e=
nable-gles2', '', d)}"

and maybe explicitly disable when isn't if posible or use PACKAGECONFIG?

>  EXTRA_OECONF +=3D "--disable-egl --enable-gbm"
> =20
>  python populate_packages_prepend() {
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LSp5EJdfMPwZcMS1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAZJMcACgkQN1Ujt2V2gBy00wCgkqQo+6d47c3Fxh3TwrRDBRks
WaIAn29MbHg9QEo+wWmZeLf3LUSM023n
=Brs0
-----END PGP SIGNATURE-----

--LSp5EJdfMPwZcMS1--
