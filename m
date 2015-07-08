Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 99556737F4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 04:16:28 +0000 (UTC)
Received: by pacws9 with SMTP id ws9so125756603pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jul 2015 21:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=CaMKJAnb7mlKlWBc257g6Hi/22o+8CF9sZQNqf+5tHU=;
	b=d1nz07YM+l7oi/vItwPw+Ew70m58o06F1Kv2NrqteNy5dGXsD5XtX0DauXwiyMmiTF
	qxLULtLuOipR/k1ZqE/1fKkPsNoIAZRi1sgFUQHAek1+QREUASwCb+y/ad3aTFdUnQnj
	M5dxLaek4BeUkF73SnN0NCR9Fhui0PRxBNtETLg87iOg9Ll8vPRz0PxYbsjcLXdDqRSl
	jQtB7wIJ/K9xfRI6v2nmdhSi/xPCapIDrjYspWPXrWxdhe9crPopAa5RepFwIkBOlBp/
	dkYbqqbXffua7A76eJs2I1mzFkK0YHEFIeLGrpC3AxUG9M1NjwKCnkss7MC9wjEPrRiw
	/hAA==
X-Received: by 10.66.138.40 with SMTP id qn8mr3199782pab.19.1436328988687;
	Tue, 07 Jul 2015 21:16:28 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:b07c:ebf8:a86:b739?
	([2601:646:8601:4580:b07c:ebf8:a86:b739])
	by smtp.gmail.com with ESMTPSA id r9sm14748pds.82.2015.07.07.21.16.27
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 Jul 2015 21:16:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1435918885-12200-1-git-send-email-ross.burton@intel.com>
Date: Tue, 7 Jul 2015 21:16:13 -0700
Message-Id: <BD7BC129-0185-4023-9545-FB3CAC8A5482@gmail.com>
References: <1435918885-12200-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2102)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libdrm: remove git recipe, merge inc
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
X-List-Received-Date: Wed, 08 Jul 2015 04:16:35 -0000
X-Groupsio-MsgNum: 67641
Content-Type: multipart/signed;
	boundary="Apple-Mail=_8E772BF9-FC14-4AD8-86BA-1F4AF713541A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_8E772BF9-FC14-4AD8-86BA-1F4AF713541A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 3, 2015, at 3:21 AM, Ross Burton <ross.burton@intel.com> wrote:
>=20
> The git recipe hasn't been touched since 2012 and is out of date, so =
simplify
> the recipe by removing the git form and merging the remaining bb and =
inc file.

There might be recipes in other layers which might be using .inc file, =
drm is sometimes
specific to some SOCs. layer index shows that atleast meta-ti assumes =
.inc to be available
and there might be more unlisted or closed layers which do so.


>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-graphics/drm/libdrm.inc       | 41 =
------------------------------
> meta/recipes-graphics/drm/libdrm_2.4.59.bb | 41 =
+++++++++++++++++++++++++++---
> meta/recipes-graphics/drm/libdrm_git.bb    | 12 ---------
> 3 files changed, 38 insertions(+), 56 deletions(-)
> delete mode 100644 meta/recipes-graphics/drm/libdrm.inc
> delete mode 100644 meta/recipes-graphics/drm/libdrm_git.bb
>=20
> diff --git a/meta/recipes-graphics/drm/libdrm.inc =
b/meta/recipes-graphics/drm/libdrm.inc
> deleted file mode 100644
> index d3e1e92..0000000
> --- a/meta/recipes-graphics/drm/libdrm.inc
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -SUMMARY =3D "Userspace interface to the kernel DRM services"
> -DESCRIPTION =3D "The runtime library for accessing the kernel DRM =
services.  DRM \
> -stands for \"Direct Rendering Manager\", which is the kernel portion =
of the \
> -\"Direct Rendering Infrastructure\" (DRI).  DRI is required for many =
hardware \
> -accelerated OpenGL drivers."
> -HOMEPAGE =3D "http://dri.freedesktop.org"
> -SECTION =3D "x11/base"
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D =
"file://xf86drm.c;beginline=3D9;endline=3D32;md5=3Dc8a3b961af7667c53081676=
1e949dc71"
> -SRC_URI =3D "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
> -PROVIDES =3D "drm"
> -DEPENDS =3D "libpthread-stubs udev"
> -
> -# be aware that libdrm_2.4.44.bb ignores this
> -INC_PR =3D "r4"
> -
> -#libpciaccess is required starting from libdrm 2.4.26
> -DEPENDS +=3D " libpciaccess"
> -
> -inherit autotools pkgconfig
> -
> -EXTRA_OECONF +=3D "--disable-cairo-tests \
> -                 --enable-omap-experimental-api \
> -                 --enable-install-test-programs \
> -                 --disable-manpages \
> -                "
> -ALLOW_EMPTY_${PN}-drivers =3D "1"
> -PACKAGES =3D+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau =
${PN}-omap \
> -             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno"
> -
> -RRECOMMENDS_${PN}-drivers =3D "${PN}-radeon ${PN}-nouveau ${PN}-omap =
${PN}-intel \
> -                             ${PN}-exynos ${PN}-freedreno"
> -
> -FILES_${PN}-tests =3D "${bindir}/dr* ${bindir}/mode* ${bindir}/*test"
> -FILES_${PN}-radeon =3D "${libdir}/libdrm_radeon.so.*"
> -FILES_${PN}-nouveau =3D "${libdir}/libdrm_nouveau.so.*"
> -FILES_${PN}-omap =3D "${libdir}/libdrm_omap.so.*"
> -FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
> -FILES_${PN}-exynos =3D "${libdir}/libdrm_exynos.so.*"
> -FILES_${PN}-kms =3D "${libdir}/libkms*.so.*"
> -FILES_${PN}-freedreno =3D "${libdir}/libdrm_freedreno.so.*"
> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.59.bb =
b/meta/recipes-graphics/drm/libdrm_2.4.59.bb
> index 14bf44a..97f75ff 100644
> --- a/meta/recipes-graphics/drm/libdrm_2.4.59.bb
> +++ b/meta/recipes-graphics/drm/libdrm_2.4.59.bb
> @@ -1,6 +1,41 @@
> -require libdrm.inc
> -
> -SRC_URI +=3D "file://installtests.patch "
> +SUMMARY =3D "Userspace interface to the kernel DRM services"
> +DESCRIPTION =3D "The runtime library for accessing the kernel DRM =
services.  DRM \
> +stands for \"Direct Rendering Manager\", which is the kernel portion =
of the \
> +\"Direct Rendering Infrastructure\" (DRI).  DRI is required for many =
hardware \
> +accelerated OpenGL drivers."
> +HOMEPAGE =3D "http://dri.freedesktop.org"
> +SECTION =3D "x11/base"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D =
"file://xf86drm.c;beginline=3D9;endline=3D32;md5=3Dc8a3b961af7667c53081676=
1e949dc71"
> +PROVIDES =3D "drm"
> +DEPENDS =3D "libpthread-stubs udev libpciaccess"
>=20
> +SRC_URI =3D "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
> +           file://installtests.patch "
> SRC_URI[md5sum] =3D "d32a1d37c2546ee11fc5924abeedb23e"
> SRC_URI[sha256sum] =3D =
"68d26e1fd85582f4243d66864f9b43ca4ee93662825de32b5506fc8e181ea41b"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF +=3D "--disable-cairo-tests \
> +                 --enable-omap-experimental-api \
> +                 --enable-install-test-programs \
> +                 --disable-manpages \
> +                "
> +
> +ALLOW_EMPTY_${PN}-drivers =3D "1"
> +PACKAGES =3D+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau =
${PN}-omap \
> +             ${PN}-intel ${PN}-exynos ${PN}-kms ${PN}-freedreno"
> +
> +RRECOMMENDS_${PN}-drivers =3D "${PN}-radeon ${PN}-nouveau ${PN}-omap =
${PN}-intel \
> +                             ${PN}-exynos ${PN}-freedreno"
> +
> +FILES_${PN}-tests =3D "${bindir}/dr* ${bindir}/mode* ${bindir}/*test"
> +FILES_${PN}-radeon =3D "${libdir}/libdrm_radeon.so.*"
> +FILES_${PN}-nouveau =3D "${libdir}/libdrm_nouveau.so.*"
> +FILES_${PN}-omap =3D "${libdir}/libdrm_omap.so.*"
> +FILES_${PN}-intel =3D "${libdir}/libdrm_intel.so.*"
> +FILES_${PN}-exynos =3D "${libdir}/libdrm_exynos.so.*"
> +FILES_${PN}-kms =3D "${libdir}/libkms*.so.*"
> +FILES_${PN}-freedreno =3D "${libdir}/libdrm_freedreno.so.*"
> +
> diff --git a/meta/recipes-graphics/drm/libdrm_git.bb =
b/meta/recipes-graphics/drm/libdrm_git.bb
> deleted file mode 100644
> index d7245ee..0000000
> --- a/meta/recipes-graphics/drm/libdrm_git.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require libdrm.inc
> -
> -SRC_URI =3D "git://anongit.freedesktop.org/git/mesa/drm"
> -
> -S =3D "${WORKDIR}/git"
> -
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -SRCREV =3D "e01d68f9f3acfc35fe164283904b5d058c2ab378"
> -PV =3D "2.4.40+git${SRCPV}"
> -PR =3D "${INC_PR}.0"
> -
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_8E772BF9-FC14-4AD8-86BA-1F4AF713541A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlWcpBoACgkQuwUzVZGdMxRFTwCfevf6klfH7TJLmw7dV3YRezoF
j3sAniIgao0Jzus0VF+Mla6BQ+Sj3kGO
=ucWV
-----END PGP SIGNATURE-----

--Apple-Mail=_8E772BF9-FC14-4AD8-86BA-1F4AF713541A--
