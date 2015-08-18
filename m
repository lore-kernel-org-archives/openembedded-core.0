Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4BB7460043;
	Tue, 18 Aug 2015 19:04:02 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so116766687wic.1;
	Tue, 18 Aug 2015 12:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/NbH1/TYmx92TAO+meQ54VmEthFawACH5Js3KSD1/Jg=;
	b=P2x6rk6NXHI7tGKbeWTXsLbK6eHf69l69l1voDnzyTyOgeHWuMlPJJ7AYd5t66tKZk
	oTTKpJW5JXYB0X0IPI0DJCZT5AAEulIdM9MSVnSO3Rj+0HJ8Ly8eT8eWBiRLl+o4s9RT
	L7Um+7bLyuYxPiHe4VhksonNcnHBcq127gnES4m5VDj0t7h0IIxh1/ZFBvhYqk7LNtPX
	FBY5N3Xz7WMynpjFTnbjgZJ2ItzB6o+CeUcjf2DKR+/NqE7S8g7GS9kWOZqFiMFQA6zo
	/sc9TmaLaXavaa6AlVAqAMVfUVOU+rLCwM1eb0g+wCaSBs87cUwaAXa5s1Lt4Y81kEHE
	D1bg==
X-Received: by 10.180.186.7 with SMTP id fg7mr46345697wic.40.1439924642840;
	Tue, 18 Aug 2015 12:04:02 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fb3sm22538542wib.21.2015.08.18.12.04.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 12:04:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2015 21:04:06 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150818190406.GB10246@jama>
References: <20150810194122.4ED1750388@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150810194122.4ED1750388@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Nicolas Dechesne : mesa: upgrade 10.5.8 -> 10.6.3
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
X-List-Received-Date: Tue, 18 Aug 2015 19:04:03 -0000
X-Groupsio-MsgNum: 69584
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline

--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2015 at 07:41:22PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 8c7803683bee780f0bc8913cc32653ff173329b7
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D8c7803683bee780f0bc8913cc32653ff173329b7
>=20
> Author: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Date:   Tue Aug  4 08:37:49 2015 +0100
>=20
> mesa: upgrade 10.5.8 -> 10.6.3
>=20
> * Removed openvg references in PACKAGECONFIG, FILES and PACKAGES since Op=
enVG
>   support was removed in mesa 10.6
> * Tested with X11 :
>  * xf86-video-freedreno on IFC6410 and DragonBoard 410c
>  * softpipe on DragonBoard 410c
>  * using meta-qualcomm BSP

Some configurations which were working with 10.5.8 are no longer
available in 10.6.3, e.g.:

| checking for PTHREAD_PRIO_INHERIT... no
| checking for LIBDRM... yes
| checking for LIBUDEV... yes
| checking for GLPROTO... yes
| checking for DRI2PROTO... yes
| checking for XF86VIDMODE... yes
| checking for DRIGL... yes
| checking for EXPAT... yes
| checking for mincore... yes
| checking for elf_memory in -lelf... no
| checking for WAYLAND_SCANNER... no
| checking for wayland-scanner... /home/jenkins/oe/world/shr-core/tmp-glibc=
/sysroots/x86_64-linux/usr/bin/wayland-scanner
| checking for XCB_DRI2... yes
| checking for WAYLAND... yes
| configure: error: EGL platform 'fbdev' does not exist
| Configure failed. The contents of all config.log files follows to aid deb=
ugging
| WARNING: exit code 1 from a shell command.
| ERROR: oe_runconf failed

I haven't tried to find out what's the replacement for this yet, but
it's the reason why mesa is now failing in my bitbake world builds
(fbdev is added in ./meta-luneui/recipes-graphics/mesa/mesa_%.bbappend)

> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-graphics/mesa/{mesa-gl_10.5.8.bb =3D> mesa-gl_10.6.3.bb} | 0
>  meta/recipes-graphics/mesa/mesa.inc                                 | 6 =
------
>  meta/recipes-graphics/mesa/{mesa_10.5.8.bb =3D> mesa_10.6.3.bb}       | =
4 ++--
>  3 files changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.5.8.bb b/meta/recipes-=
graphics/mesa/mesa-gl_10.6.3.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_10.5.8.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 09e80e8..af7a2c4 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -49,8 +49,6 @@ EGL_PLATFORMS .=3D"${@bb.utils.contains('PACKAGECONFIG'=
, 'x11', ',x11', '', d)}"
>  EGL_PLATFORMS .=3D"${@bb.utils.contains('PACKAGECONFIG', 'wayland', ',wa=
yland', '', d)}"
>  PACKAGECONFIG[egl] =3D "--enable-egl --with-egl-platforms=3D${EGL_PLATFO=
RMS}, --disable-egl"
> =20
> -PACKAGECONFIG[openvg] =3D "--enable-openvg, --disable-openvg"
> -
>  GALLIUMDRIVERS =3D "swrast"
>  GALLIUMDRIVERS_LLVM33 =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600',=
 'radeonsi,r600', '', d)}"
>  PACKAGECONFIG[r600] =3D ""
> @@ -84,7 +82,6 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>               libgles2-mesa libgles2-mesa-dev \
>               libgles3-mesa libgles3-mesa-dev \
>               libwayland-egl libwayland-egl-dev \
> -             libopenvg libopenvg-dev \
>               libxvmcsoftpipe libxvmcsoftpipe-dev \
>               libxatracker libxatracker-dev \
>               mesa-megadriver \
> @@ -167,7 +164,6 @@ FILES_libgl-mesa =3D "${libdir}/libGL.so.*"
>  FILES_libglapi =3D "${libdir}/libglapi.so.*"
>  FILES_libosmesa =3D "${libdir}/libOSMesa.so.*"
>  FILES_libwayland-egl =3D "${libdir}/libwayland-egl.so.*"
> -FILES_libopenvg =3D "${libdir}/libOpenVG.so.*"
>  FILES_libxvmcsoftpipe =3D "${libdir}/libXvMCsoftpipe.so.*"
>  FILES_libxatracker =3D "${libdir}/libxatracker.so.*"
> =20
> @@ -181,8 +177,6 @@ FILES_libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${=
includedir}/GLES2 ${libdir}/p
>  FILES_libgles3-mesa-dev =3D "${includedir}/GLES3"
>  FILES_libosmesa-dev =3D "${libdir}/libOSMesa.* ${includedir}/osmesa.h ${=
libdir}/pkgconfig/osmesa.pc"
>  FILES_libwayland-egl-dev =3D "${libdir}/pkgconfig/wayland-egl.pc ${libdi=
r}/libwayland-egl.*"
> -FILES_libopenvg-dev =3D "${libdir}/libOpenVG.so ${libdir}/libOpenVG.la* \
> -                       ${includedir}/VG ${libdir}/pkgconfig/vg.pc"
>  FILES_libxvmcsoftpipe-dev =3D "${libdir}/libXvMCsoftpipe.so ${libdir}/li=
bXvMCsoftpipe.la"
>  FILES_libxatracker-dev =3D "${libdir}/libxatracker.so ${libdir}/libxatra=
cker.la \
>                            ${includedir}/xa_tracker.h ${includedir}/xa_co=
mposite.h ${includedir}/xa_context.h \
> diff --git a/meta/recipes-graphics/mesa/mesa_10.5.8.bb b/meta/recipes-gra=
phics/mesa/mesa_10.6.3.bb
> similarity index 78%
> rename from meta/recipes-graphics/mesa/mesa_10.5.8.bb
> rename to meta/recipes-graphics/mesa/mesa_10.6.3.bb
> index 072cde9..8c55064 100644
> --- a/meta/recipes-graphics/mesa/mesa_10.5.8.bb
> +++ b/meta/recipes-graphics/mesa/mesa_10.6.3.bb
> @@ -2,8 +2,8 @@ require ${BPN}.inc
> =20
>  SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz"
> =20
> -SRC_URI[md5sum] =3D "5332a3576c5e3a0c3947ee6668dd4157"
> -SRC_URI[sha256sum] =3D "2866b855c5299a4aed066338c77ff6467c389b2c30ada764=
7be8758663da2b54"
> +SRC_URI[md5sum] =3D "553e525d2f20ed48fca8f1ec3176fd83"
> +SRC_URI[sha256sum] =3D "58592e07c350cd2e8969b73fa83048c657a39fe2f13f3b88=
f5e5818fe2e4676d"
> =20
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXTgaUACgkQN1Ujt2V2gBxvtQCeLrUj8ikgBbusTQi1AzbVfhcy
jEsAn2z2DzsUtmyjyCOshiAlceyoBB8F
=Zbg+
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
