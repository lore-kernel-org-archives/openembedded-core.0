Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC5D73608;
	Thu, 19 Feb 2015 17:58:08 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so49843149wib.4;
	Thu, 19 Feb 2015 09:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=X0S5BEcXmNmdQIgUYVSlkiKeraSRX+uoGAb0q23m02k=;
	b=l7fRJSOHOtz8f+JhPOcj+yzP6Ps665jxpVjij1kr73QE2uIgg+NKFeHcxf+GchI5ft
	0LfJG8gyP5+xBnW2Uh7V0os98+RUbXpys5T1VhdRRRo0gGSmiS3kmVVSxD+k89SeLiT/
	GSlDst7xYJsVFbusm4axJcW7W59Lbl0zhInLHi+FXgoh9YjRDw0d2NliwPcmokYKUt7v
	ShFPMm6qDsNc9UEiVa0JUvV9m/Tg9bClIZ+bW+I46pQJcGbwNMB5B6ION75nqrMuOH0k
	9osjiMQEIbz1USUlaKNqbyz3cvqEhCv3hmzhtrmbmmUGWf9EVmPyNgHb5Rm4/iC9DWM+
	qtZQ==
X-Received: by 10.181.13.174 with SMTP id ez14mr8824659wid.72.1424368689073;
	Thu, 19 Feb 2015 09:58:09 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dx11sm35503631wjb.23.2015.02.19.09.58.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Feb 2015 09:58:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Feb 2015 18:58:12 +0100
To: openembedded-core@lists.openembedded.org, pengyu.ma@windriver.com
Message-ID: <20150219175812.GG2311@jama>
References: <20150208080049.7D8C0503A2@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150208080049.7D8C0503A2@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Pengyu Ma : mesa: Upgrade to 10.4.3
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
X-List-Received-Date: Thu, 19 Feb 2015 17:58:10 -0000
X-Groupsio-MsgNum: 62567
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bFsKbPszpzYNtEU6"
Content-Disposition: inline

--bFsKbPszpzYNtEU6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 08, 2015 at 08:00:49AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: ba079975fa984f53fde5b4e8131d0f3877323e6c
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dba079975fa984f53fde5b4e8131d0f3877323e6c
>=20
> Author: Pengyu Ma <pengyu.ma@windriver.com>
> Date:   Tue Feb  3 10:11:08 2015 +0800
>=20
> mesa: Upgrade to 10.4.3
>=20
> flags for EGL and GBM Gallium had been removed in 10.4,
> so remove these flags, files or packages.

This seems to break openvg as well

| checking for mincore... yes
| configure: error: Cannot enable OpenVG, because egl_gallium has been remo=
ved and
|                   OpenVG hasn't been integrated into standard libEGL yet
| Configure failed. The contents of all config.log files follows to aid deb=
ugging
| ERROR: oe_runconf failed

> Signed-off-by: Pengyu Ma <pengyu.ma@windriver.com>
> Tested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>=20
> ---
>=20
>  meta/recipes-graphics/mesa/{mesa-gl_10.3.4.bb =3D> mesa-gl_10.4.3.bb} | 0
>  meta/recipes-graphics/mesa/mesa.inc                                 | 5 =
-----
>  meta/recipes-graphics/mesa/{mesa_10.3.4.bb =3D> mesa_10.4.3.bb}       | =
4 ++--
>  meta/recipes-graphics/mesa/mesa_git.bb                              | 4 =
++--
>  4 files changed, 4 insertions(+), 9 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.3.4.bb b/meta/recipes-=
graphics/mesa/mesa-gl_10.4.3.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_10.3.4.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_10.4.3.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index cb1837a..c9748e2 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -59,8 +59,6 @@ GALLIUMDRIVERS_append_x86 =3D "${@bb.utils.contains('PA=
CKAGECONFIG', 'gallium-llvm
>  GALLIUMDRIVERS_append_x86-64 =3D "${@bb.utils.contains('PACKAGECONFIG', =
'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
>  # keep --with-gallium-drivers separate, because when only one of gallium=
 versions is enabled, other 2 were adding --without-gallium-drivers
>  PACKAGECONFIG[gallium]      =3D "--with-gallium-drivers=3D${GALLIUMDRIVE=
RS}, --without-gallium-drivers"
> -PACKAGECONFIG[gallium-egl]  =3D "--enable-gallium-egl, --disable-gallium=
-egl"
> -PACKAGECONFIG[gallium-gbm]  =3D "--enable-gallium-gbm, --disable-gallium=
-gbm"
>  MESA_LLVM_RELEASE ?=3D "3.3"
>  PACKAGECONFIG[gallium-llvm] =3D "--enable-gallium-llvm --with-llvm-share=
d-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
>                                 ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_=
ENABLED} else ''}"
> @@ -85,7 +83,6 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>               libgles2-mesa libgles2-mesa-dev \
>               libgles3-mesa libgles3-mesa-dev \
>               libwayland-egl libwayland-egl-dev \
> -             libegl-gallium libgbm-gallium \
>               libopenvg libopenvg-dev \
>               libxvmcsoftpipe libxvmcsoftpipe-dev \
>               libxatracker libxatracker-dev \
> @@ -169,8 +166,6 @@ FILES_libgl-mesa =3D "${libdir}/libGL.so.*"
>  FILES_libglapi =3D "${libdir}/libglapi.so.*"
>  FILES_libosmesa =3D "${libdir}/libOSMesa.so.*"
>  FILES_libwayland-egl =3D "${libdir}/libwayland-egl.so.*"
> -FILES_libegl-gallium =3D "${libdir}/egl/egl_gallium.so*"
> -FILES_libgbm-gallium =3D "${libdir}/gbm/gbm_gallium_drm.so*"
>  FILES_libopenvg =3D "${libdir}/libOpenVG.so.*"
>  FILES_libxvmcsoftpipe =3D "${libdir}/libXvMCsoftpipe.so.*"
>  FILES_libxatracker =3D "${libdir}/libxatracker.so.*"
> diff --git a/meta/recipes-graphics/mesa/mesa_10.3.4.bb b/meta/recipes-gra=
phics/mesa/mesa_10.4.3.bb
> similarity index 78%
> rename from meta/recipes-graphics/mesa/mesa_10.3.4.bb
> rename to meta/recipes-graphics/mesa/mesa_10.4.3.bb
> index 50092c9..9669bcb 100644
> --- a/meta/recipes-graphics/mesa/mesa_10.3.4.bb
> +++ b/meta/recipes-graphics/mesa/mesa_10.4.3.bb
> @@ -2,8 +2,8 @@ require ${BPN}.inc
> =20
>  SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.=
bz2"
> =20
> -SRC_URI[md5sum] =3D "fa0558a3d02c2bb8c208c030ccdc992e"
> -SRC_URI[sha256sum] =3D "e6373913142338d10515daf619d659433bfd298998819893=
0c13b0945a15e98a"
> +SRC_URI[md5sum] =3D "be86c4ee226f8ca28b7d4c728c350b01"
> +SRC_URI[sha256sum] =3D "ef6ecc9c2f36c9f78d1662382a69ae961f38f03af3a0c326=
8e53f351aa1978ad"
> =20
>  S =3D "${WORKDIR}/Mesa-${PV}"
> =20
> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphi=
cs/mesa/mesa_git.bb
> index b046ae2..e554ff4 100644
> --- a/meta/recipes-graphics/mesa/mesa_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> @@ -4,8 +4,8 @@ DEFAULT_PREFERENCE =3D "-1"
> =20
>  LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D6a23445982a7a972ac1=
98e93cc1cb3de"
> =20
> -SRCREV =3D "c7b9a2e38a3e471562b50dab8be65db8ac6819f8"
> -PV =3D "10.3.4+git${SRCPV}"
> +SRCREV =3D "f70e4d4afd16e66506ce3b055edb3b71b1464890"
> +PV =3D "10.4.3+git${SRCPV}"
> =20
>  SRC_URI =3D "git://anongit.freedesktop.org/git/mesa/mesa;branch=3D10.4"
> =20
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bFsKbPszpzYNtEU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTmJDQACgkQN1Ujt2V2gBz8fwCeIofC572m1/NYflDPmU3Ge448
EDgAn3o4bOMq2KrbMp8oj7AouigUiI5g
=SZM7
-----END PGP SIGNATURE-----

--bFsKbPszpzYNtEU6--
