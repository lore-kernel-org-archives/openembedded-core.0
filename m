Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 78A296067D;
	Tue, 26 Apr 2016 14:38:23 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w143so4946510wmw.3;
	Tue, 26 Apr 2016 07:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hAiKIlk/MGHy2x15vnn8lZeCwcnjm6UG/NfLBQwOOBQ=;
	b=GFbj5mi+IQUSkiUbj/Gv22W83QNeAfkEg6Vo8hCeXB1HC0Gx5n7OMD2PKotLhBEawm
	Jj2S7VP/JQCAlFz7o3sujqko2D2xbquVtRQR4hQXBDHhD16hheOD66Eq7XTgWf+mjcsu
	bmZYwtpcLANzJnxfbEOTjkZYdvrER9BlTYTUjW5pLKYoODMIbk+EABlU8TwHiK7J1djC
	jGMc3Mt44H5y8ol3RxdoV8FemelPhchmbofEUKqbcLPUv6sN2WtYAmqSGAqzssSllPhV
	+07GUy0LbKVpFmlStJcmsnHR3lF/14e/ZV80nlYm7tpjR9BpmzAIUrwjxYNvJ2U2TdaH
	mscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hAiKIlk/MGHy2x15vnn8lZeCwcnjm6UG/NfLBQwOOBQ=;
	b=l5jYUFQ6X5M+UrMD8/09PjSVayKpKxr1vSg1HWiVm200veBqCZ7R8MqETu8+5RisZh
	Iq4w2650UCK0dqgkzCbN6KuSxVbxMpcocm8Y1SsahoCqo8uvv6dAOHjBertV1qO57ngu
	QKCvM0ilRwO8GsV7bOORFvcA8dw+yGrnapLuUpZUDbEllI/hIR+uKswYECmm6W0dtSCy
	aAH9A4J1Ehu6ZFAsBZtCP23F+C6mkEjuGbW+GMAI3JFJIxKrHHcH6y5xZhbcPqSWDLZw
	IX20NhETcrd4+TydjtOr+/gj/1mTpdqULD8UeKHCSLBHQhfreBmTJP+KsHBr0WjJfMw0
	QUQg==
X-Gm-Message-State: AOPr4FWJe+Yk9OFSShVCGL3VXQqWHp5qN7EPF44DLUfc5IEhl4k8z3QZ7WcWZaLQHZn7ZQ==
X-Received: by 10.28.211.75 with SMTP id k72mr20287656wmg.77.1461681504053;
	Tue, 26 Apr 2016 07:38:24 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id u4sm3121719wjz.4.2016.04.26.07.38.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Apr 2016 07:38:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 26 Apr 2016 16:38:40 +0200
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20160426143840.GD2559@jama>
References: <20160228113500.28557.75937@opal.openembedded.org>
	<20160228113520.997E9501B9@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20160228113520.997E9501B9@opal.openembedded.org>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 82/103: libdrm: update to 2.4.67
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
X-List-Received-Date: Tue, 26 Apr 2016 14:38:26 -0000
X-Groupsio-MsgNum: 81268
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+B+y8wtTXqdUj1xM"
Content-Disposition: inline

--+B+y8wtTXqdUj1xM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 28, 2016 at 11:36:22AM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>=20
> commit be2f3e78742cfd94d1d1ad1f67bb651b12adf357
> Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> AuthorDate: Wed Feb 24 17:13:22 2016 +0200
>=20
>     libdrm: update to 2.4.67
>    =20
>     Drop 0001-tests-kms-steal-crtc-Include-sys-select.h.patch and detect.=
patch
>     (merged upstream).

Something is wrong with the cunit patch in upstream, now it has 2 autodetec=
ted
dependencies.
=20
WARN: libdrm: libdrm-tests rdepends on cunit, but it isn't a build dependen=
cy?
WARN: libdrm: libdrm-tests rdepends on libdrm-amdgpu, but it isn't a build =
dependency?

>    =20
>     Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  ...tests-kms-steal-crtc-Include-sys-select.h.patch | 96 ----------------=
------
>  meta/recipes-graphics/drm/libdrm/detect.patch      | 59 -------------
>  .../drm/{libdrm_2.4.66.bb =3D> libdrm_2.4.67.bb}     |  6 +-
>  3 files changed, 2 insertions(+), 159 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-I=
nclude-sys-select.h.patch b/meta/recipes-graphics/drm/libdrm/0001-tests-kms=
-steal-crtc-Include-sys-select.h.patch
> deleted file mode 100644
> index e4ecbac..0000000
> --- a/meta/recipes-graphics/drm/libdrm/0001-tests-kms-steal-crtc-Include-=
sys-select.h.patch
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -From fb53d7a1be116a172b56625f290fcf88b6d158ca Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 20 Jan 2016 05:23:00 +0000
> -Subject: [PATCH] tests: Include sys/select.h
> -
> -Used in compliance with POSIX 2001/2008
> -
> -Fixes errors e.g.
> -error: implicit declaration of function 'select'
> -
> -and helps with missing definitions of FD_* defines
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Reviewed-by: Thierry Reding <thierry.reding@gmail.com>
> ----
> -Upstream-Status: Submitted
> -
> - configure.ac                     | 2 +-
> - tests/kms/kms-steal-crtc.c       | 3 +++
> - tests/kms/kms-universal-planes.c | 3 +++
> - tests/modetest/modetest.c        | 3 +++
> - tests/vbltest/vbltest.c          | 3 +++
> - 5 files changed, 13 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 057a846..258e2f6 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -53,7 +53,7 @@ AC_USE_SYSTEM_EXTENSIONS
> - AC_SYS_LARGEFILE
> - AC_FUNC_ALLOCA
> -=20
> --AC_CHECK_HEADERS([sys/mkdev.h sys/sysctl.h])
> -+AC_CHECK_HEADERS([sys/mkdev.h sys/sysctl.h sys/select.h])
> -=20
> - # Initialize libtool
> - LT_PREREQ([2.2])
> -diff --git a/tests/kms/kms-steal-crtc.c b/tests/kms/kms-steal-crtc.c
> -index 2f7f327..497772e 100644
> ---- a/tests/kms/kms-steal-crtc.c
> -+++ b/tests/kms/kms-steal-crtc.c
> -@@ -31,6 +31,9 @@
> - #include <stdio.h>
> - #include <string.h>
> - #include <unistd.h>
> -+#ifdef HAVE_SYS_SELECT_H
> -+#include <sys/select.h>
> -+#endif
> -=20
> - #include <drm_fourcc.h>
> -=20
> -diff --git a/tests/kms/kms-universal-planes.c b/tests/kms/kms-universal-=
planes.c
> -index 9151231..d8e5fc4 100644
> ---- a/tests/kms/kms-universal-planes.c
> -+++ b/tests/kms/kms-universal-planes.c
> -@@ -32,6 +32,9 @@
> - #include <stdio.h>
> - #include <string.h>
> - #include <unistd.h>
> -+#ifdef HAVE_SYS_SELECT_H
> -+#include <sys/select.h>
> -+#endif
> -=20
> - #include <drm_fourcc.h>
> - #include "xf86drm.h"
> -diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
> -index 22e3e81..d5a4062 100644
> ---- a/tests/modetest/modetest.c
> -+++ b/tests/modetest/modetest.c
> -@@ -55,6 +55,9 @@
> - #include <errno.h>
> - #include <sys/poll.h>
> - #include <sys/time.h>
> -+#ifdef HAVE_SYS_SELECT_H
> -+#include <sys/select.h>
> -+#endif
> -=20
> - #include "xf86drm.h"
> - #include "xf86drmMode.h"
> -diff --git a/tests/vbltest/vbltest.c b/tests/vbltest/vbltest.c
> -index 1833321..086407e 100644
> ---- a/tests/vbltest/vbltest.c
> -+++ b/tests/vbltest/vbltest.c
> -@@ -37,6 +37,9 @@
> - #include <errno.h>
> - #include <sys/poll.h>
> - #include <sys/time.h>
> -+#ifdef HAVE_SYS_SELECT_H
> -+#include <sys/select.h>
> -+#endif
> -=20
> - #include "xf86drm.h"
> - #include "xf86drmMode.h"
> ---=20
> -2.7.0
> -
> diff --git a/meta/recipes-graphics/drm/libdrm/detect.patch b/meta/recipes=
-graphics/drm/libdrm/detect.patch
> deleted file mode 100644
> index 6397a59..0000000
> --- a/meta/recipes-graphics/drm/libdrm/detect.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -commit 798022b61c58d945f9027c823a188dcedecd3d06
> -Author: Marcin =C5=9Alusarz <marcin.slusarz@gmail.com>
> -Date:   Sun Jan 24 13:17:34 2016 +0100
> -
> -    configure.ac: don't detect disabled options dependencies
> -   =20
> -    Currently with --disable-amdgpu --disable-valgrind --disable-cairo-t=
ests
> -    cunit, valgrind and cairo are still detected.
> -   =20
> -    Signed-off-by: Marcin =C5=9Alusarz <marcin.slusarz@gmail.com>
> -    Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> -
> -diff --git a/configure.ac b/configure.ac
> -index 057a846..a09be61 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -363,12 +363,14 @@ fi
> --# Detect cunit library
> --PKG_CHECK_MODULES([CUNIT], [cunit >=3D 2.1], [have_cunit=3Dyes], [have_=
cunit=3Dno])
> --# If pkg-config does not find cunit, check it using AC_CHECK_LIB.  We
> --# do this because Debian (Ubuntu) lacks pkg-config file for cunit.
> --# fixed in 2.1-2.dfsg-3: http://anonscm.debian.org/cgit/collab-maint/cu=
nit.git/commit/?h=3Ddebian
> --if test "x${have_cunit}" =3D "xno"; then
> --	AC_CHECK_LIB([cunit], [CU_initialize_registry], [have_cunit=3Dyes], [h=
ave_cunit=3Dno])
> --	if test "x${have_cunit}" =3D "xyes"; then
> --		CUNIT_LIBS=3D"-lcunit"
> --		CUNIT_CFLAGS=3D""
> --		AC_SUBST([CUNIT_LIBS])
> --		AC_SUBST([CUNIT_CFLAGS])
> -+if test "x$AMDGPU" !=3D xno; then
> -+	# Detect cunit library
> -+	PKG_CHECK_MODULES([CUNIT], [cunit >=3D 2.1], [have_cunit=3Dyes], [have=
_cunit=3Dno])
> -+	# If pkg-config does not find cunit, check it using AC_CHECK_LIB.  We
> -+	# do this because Debian (Ubuntu) lacks pkg-config file for cunit.
> -+	# fixed in 2.1-2.dfsg-3: http://anonscm.debian.org/cgit/collab-maint/c=
unit.git/commit/?h=3Ddebian
> -+	if test "x${have_cunit}" =3D "xno"; then
> -+		AC_CHECK_LIB([cunit], [CU_initialize_registry], [have_cunit=3Dyes], [=
have_cunit=3Dno])
> -+		if test "x${have_cunit}" =3D "xyes"; then
> -+			CUNIT_LIBS=3D"-lcunit"
> -+			CUNIT_CFLAGS=3D""
> -+			AC_SUBST([CUNIT_LIBS])
> -+			AC_SUBST([CUNIT_CFLAGS])
> -+		fi
> -@@ -375,0 +378,2 @@ if test "x${have_cunit}" =3D "xno"; then
> -+else
> -+	have_cunit=3Dno
> -@@ -404 +408,3 @@ AC_ARG_ENABLE([cairo-tests],
> --PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=3Dyes], [HAVE_CAIRO=3Dno])
> -+if test "x$CAIRO" !=3D xno; then
> -+	PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=3Dyes], [HAVE_CAIRO=3Dno])
> -+fi
> -@@ -449 +455,3 @@ AC_ARG_ENABLE(valgrind,
> --PKG_CHECK_MODULES(VALGRIND, [valgrind], [have_valgrind=3Dyes], [have_va=
lgrind=3Dno])
> -+if test "x$VALGRIND" !=3D xno; then
> -+	PKG_CHECK_MODULES(VALGRIND, [valgrind], [have_valgrind=3Dyes], [have_v=
algrind=3Dno])
> -+fi
> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.66.bb b/meta/recipes-gr=
aphics/drm/libdrm_2.4.67.bb
> similarity index 87%
> rename from meta/recipes-graphics/drm/libdrm_2.4.66.bb
> rename to meta/recipes-graphics/drm/libdrm_2.4.67.bb
> index 79cd94a..ddd697f 100644
> --- a/meta/recipes-graphics/drm/libdrm_2.4.66.bb
> +++ b/meta/recipes-graphics/drm/libdrm_2.4.67.bb
> @@ -12,13 +12,11 @@ DEPENDS =3D "libpthread-stubs udev libpciaccess"
> =20
>  SRC_URI =3D "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
>             file://installtests.patch \
> -           file://0001-tests-kms-steal-crtc-Include-sys-select.h.patch \
> -           file://detect.patch \
>             file://fix_O_CLOEXEC_undeclared.patch \
>            "
> =20
> -SRC_URI[md5sum] =3D "c6809c48538d6e5999588832045ff014"
> -SRC_URI[sha256sum] =3D "79cb8e988749794edfb2d777b298d5292eff353bbbb71ed8=
13589e61d2bc2d76"
> +SRC_URI[md5sum] =3D "b844c6af34e613ebf52f80b3cd8d7055"
> +SRC_URI[sha256sum] =3D "ee5b71e1113be37544d0752681c12f040c01f782e2933df7=
d7bc21fd0d10cebe"
> =20
>  inherit autotools pkgconfig
> =20
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+B+y8wtTXqdUj1xM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcffW8ACgkQN1Ujt2V2gBxD5wCghFjZziPYWdqUaADy0yjHDfR/
OI8An2lM1N9bx9miVp6LKIK38Mblkbta
=G/I+
-----END PGP SIGNATURE-----

--+B+y8wtTXqdUj1xM--
