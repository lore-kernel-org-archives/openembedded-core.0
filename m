Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tljz7-0002hW-Q2
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 18:32:42 +0100
Received: by mail-pb0-f46.google.com with SMTP id wy7so2118688pbc.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 09:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=gFluDMzE2IaaDNxdPFlP0D2dzk/7ApBCTiMEUb0M32o=;
	b=FCpEDVCCLeG4mP0tiNDtg+xyw6MLxokVwCVYyR+RVztk/pdcyL5XccbVuSh6k5ZmIC
	sBvS0QXcdoQ0tCvrDFcdnJDYH+owrYuijWbjJT72N+wm7kuRoFCE+ztFloj1xbJSptnr
	265+e+KklY4axveE0MomanrYOKGc/+Af534Wt9kHpw6QHqtsu6WuiL0bi53yq0baS9iL
	WaxG7mb1MFu7D+OQd2tvtAJHqJTkSRCz819UrNui1EhiGmwmzR9GA77DoyVGPObodMfy
	ckybEFS1FEKCx67dMk3bGbGvh2ARy/RoVpzc1CGFwHp0rymlUin1IYIdZATljCFaNl6X
	HEXw==
X-Received: by 10.68.223.131 with SMTP id qu3mr31309900pbc.89.1356023876310;
	Thu, 20 Dec 2012 09:17:56 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id vk5sm5348348pbc.34.2012.12.20.09.17.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 09:17:55 -0800 (PST)
Date: Thu, 20 Dec 2012 18:17:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
Message-ID: <20121220171753.GP14543@jama.palm1.palmone.com>
References: <cover.1356021837.git.alexandru.damian@intel.com>
	<5f9c3b67176f90714a2fd394e64f7d8da3cb0258.1356021837.git.alexandru.damian@intel.com>
MIME-Version: 1.0
In-Reply-To: <5f9c3b67176f90714a2fd394e64f7d8da3cb0258.1356021837.git.alexandru.damian@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] Prepare mesa-dri for weston compatibility
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
X-List-Received-Date: Thu, 20 Dec 2012 17:32:42 -0000
X-Groupsio-MsgNum: 32972
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GIP5y49pbaVPin6k"
Content-Disposition: inline

--GIP5y49pbaVPin6k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 20, 2012 at 06:48:38PM +0200, Alex DAMIAN wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>=20
> This patch enables mesa-git to build wayland-compatible
> packages for usage with weston.
>=20
> It adds wayland platform support, packs the wayland-egl
> files, and sets the -git version as preffered provider.
>=20
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>  meta/recipes-graphics/mesa/mesa-common.inc |    5 ++++-
>  meta/recipes-graphics/mesa/mesa-dri.inc    |    1 +
>  meta/recipes-graphics/mesa/mesa-dri_git.bb |    3 ++-
>  3 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-gr=
aphics/mesa/mesa-common.inc
> index 70957eb..db1bec4 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -18,7 +18,7 @@ PE =3D "2"
>  DEPENDS =3D "libxml2-native makedepend-native flex-native bison-native"
> =20
>  PROVIDES =3D "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/eg=
l"
> -
> +PROVIDES +=3D "wayland-egl libgbm libglapi"
>  # for mesa-dri and mesa-xlib
>  FILESEXTRAPATHS_append :=3D "${THISDIR}/mesa:"
> =20
> @@ -49,6 +49,7 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>               libgles1-mesa libgles1-mesa-dev \
>               libgles2-mesa libgles2-mesa-dev \
>               libgles3-mesa libgles3-mesa-dev \
> +             wayland-egl wayland-egl-dev \
>              "
> =20
>  do_install_append () {
> @@ -90,8 +91,10 @@ FILES_libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
>  FILES_libgl-mesa =3D "${libdir}/libGL.so.*"
>  FILES_libglapi =3D "${libdir}/libglapi.so.*"
>  FILES_libosmesa =3D "${libdir}/libOSMesa.so.*"
> +FILES_wayland-egl =3D "${libdir}/libwayland-egl.so.*"
> =20
>  FILES_${PN}-dev =3D "${libdir}/pkgconfig/dri.pc"
> +FILES_wayland-egl-dev =3D "${libdir}/pkgconfig/wayland-egl.pc ${libdir}/=
libwayland-egl.*"
>  FILES_libdricore-dev =3D "${libdir}/libdricore*.*"
>  FILES_libegl-mesa-dev =3D "${libdir}/libEGL.* ${includedir}/EGL ${includ=
edir}/KHR ${libdir}/pkgconfig/egl.pc"
>  FILES_libgbm-dev =3D "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${in=
cludedir}/gbm.h"
> diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graph=
ics/mesa/mesa-dri.inc
> index 07544ab..1f6ec78 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri.inc
> +++ b/meta/recipes-graphics/mesa/mesa-dri.inc
> @@ -13,6 +13,7 @@ PACKAGECONFIG[gles] =3D "--enable-gles1 --enable-gles2,=
 --disable-gles1 --disable-
> =20
>  EGL_PLATFORMS  =3D "drm"
>  EGL_PLATFORMS .=3D"${@base_contains('DISTRO_FEATURES', 'x11', ',x11', ''=
, d)}"
> +EGL_PLATFORMS .=3D"${@base_contains('DISTRO_FEATURES', 'wayland', ',wayl=
and', '', d)}"
>  PACKAGECONFIG[egl] =3D "--enable-egl --with-egl-platforms=3D${EGL_PLATFO=
RMS}, --disable-egl"
> =20
>  python populate_packages_prepend() {
> diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-gr=
aphics/mesa/mesa-dri_git.bb
> index 69a433e..7fd0d39 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
> @@ -3,6 +3,7 @@ require mesa-git.inc
>  require mesa-dri.inc
> =20
>  # this needs to be lower than -1 because all mesa-dri have -1 and git ve=
rsion has highest PV, but shouldn't be default
> -DEFAULT_PREFERENCE =3D "-2"
> +# adamian - switch to git version
> +DEFAULT_PREFERENCE =3D "1"

Isn't default preference 0 good enough? as meta-dri_git also has highest
PV?

> =20
>  PR =3D "${INC_PR}.0"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GIP5y49pbaVPin6k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDTSEEACgkQN1Ujt2V2gBwTDACfYcN7iPibialJCbCVeOrMCG0q
dZQAn0Ig/X3ZpC0lTW8tALA8xMK/jb1u
=Mn/W
-----END PGP SIGNATURE-----

--GIP5y49pbaVPin6k--
