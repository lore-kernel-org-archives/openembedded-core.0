Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 07E1E6011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 13:37:00 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f8so3743130wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 06:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0jQdRNMcpuAFF4SYb1BVPfOTAfhijpV4mPzgoIvmXME=;
	b=VSoZo9dd4x6sRxdkxEK8MHpORhl4rV60pfeZPEL3oKXDH54W3Z8RdHpsKCxAgVLmpk
	dIKXt6WtODh8RteB1unWKVhDwRi/IdjZmxe4nlifgfaakyuxr+eEE8NEsLnMhlu2fOkn
	5KjZOKfSmOOcFc6AbjBlkk0JPSaTqw6dmWXqH/earHreJ/gsyIaPzf18lv486gLtQ2xH
	RkLbgduPc20WlOC//ecmaCkKiNPJyOPpcUuvYlxwE+jpwW/obikc9RnBxOgTe6NCu/j/
	iYjT+0bBfBy4GVEg8j1ZzZhlP2L5W2xxARzG1Vq6KkxUavN1CKhqjcXBcrpToPGpYZyO
	IRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0jQdRNMcpuAFF4SYb1BVPfOTAfhijpV4mPzgoIvmXME=;
	b=X6t28WaRvZGblnKEA5v2AJbBKmAv8kHVBdlNJSncPrrzHFD90xI2ltuaINjBCIGUs5
	9P7dz/cxpX5XylTb8uLavXGyUI4LiWIrtvse38HWQ1KdjFTrocv4tmJuFPT+nr8zhfJ2
	WDZAOa+IsVpAwiUumIFSb40wBDkpo2Ln7+0Sx7JnqNL6E9nYmSt6fF1uYIj+odSJORXJ
	WTqRUSMHKD2nUB8+KPBPlux96TtfTqHbri53GhMcxuNBamD/sbyJwnQp6ermn6GSZ1wf
	KepkUmuJj3q43dmJ1MWWToH60fRSF2oDA2ZEHe1nRBWkce1KruTwLc9ej0Cs7eGvADTQ
	BKoA==
X-Gm-Message-State: ALQs6tCjeEbuiWBCGox6CabSkHAf0/QdFpy7uWbw1lbat+du8QjUeirz
	Bs1nYJbx/mVMNbJKqiOkFRwS2g==
X-Google-Smtp-Source: AB8JxZr47Yvcfr9iS4WlPQeURWEp3r8rORGMvYs8hbxwBIlzMXpEC8tWSro5Ic9GUI+dRkm/w8S2Wg==
X-Received: by 10.28.173.4 with SMTP id w4mr7906025wme.54.1525095421349;
	Mon, 30 Apr 2018 06:37:01 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x65sm8664280wme.31.2018.04.30.06.37.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Apr 2018 06:37:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Apr 2018 15:37:01 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180430133701.GA2138@jama>
References: <cover.1525029885.git.raj.khem@gmail.com>
	<e7446e8b086e4a6a93533902f580406ca0ebadd8.1525029885.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e7446e8b086e4a6a93533902f580406ca0ebadd8.1525029885.git.raj.khem@gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 08/24] alsa-tools: Update to 1.1.6
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
X-List-Received-Date: Mon, 30 Apr 2018 13:37:01 -0000
X-Groupsio-MsgNum: 110840
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 29, 2018 at 12:35:55PM -0700, Khem Raj wrote:
> License-Update: FSF address updated in hdsploader/COPYING and ld10k1/COPY=
ING.LIB
>=20
> Fix built with clang along the way
>=20
> Package python dependent tools into a separate package
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> xxx

^^^ Insert some pr0n here.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...served-user-defined-literal-warnings.patch | 28 +++++++++++++
>  .../alsa/alsa-tools/autotools.patch           | 42 ++++++++++++-------
>  ...lsa-tools_1.1.5.bb =3D> alsa-tools_1.1.6.bb} | 25 ++++++++---
>  3 files changed, 75 insertions(+), 20 deletions(-)
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clan=
g-Wreserved-user-defined-literal-warnings.patch
>  rename meta/recipes-multimedia/alsa/{alsa-tools_1.1.5.bb =3D> alsa-tools=
_1.1.6.bb} (62%)
>=20
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wrese=
rved-user-defined-literal-warnings.patch b/meta/recipes-multimedia/alsa/als=
a-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch
> new file mode 100644
> index 0000000000..2290915eab
> --- /dev/null
> +++ b/meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-us=
er-defined-literal-warnings.patch
> @@ -0,0 +1,28 @@
> +From 2e48e4045e1e951433da0ca4b1e49798eedde14f Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 24 Apr 2018 12:21:18 -0700
> +Subject: [PATCH] Fix clang -Wreserved-user-defined-literal warnings
> +
> +| us428control.cc:66:18: error: invalid suffix on literal; C++11 require=
s a space between literal and identifier [-Wreserved-user-defined-literal]
> +|         printf("usage: "PROGNAME" [-v verbosity_level 0..2] [-c card] =
[-D device] [-u usb-device] [-m mode]\n");
> +|                         ^
> +
> +Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10360805/]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + us428control/us428control.cc | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/us428control/us428control.cc b/us428control/us428control.cc
> +index e839bf4..8cb3c42 100644
> +--- a/us428control/us428control.cc
> ++++ b/us428control/us428control.cc
> +@@ -63,7 +63,7 @@ static void usage(void)
> + {
> + 	printf("Tascam US-428 Control\n");
> + 	printf("version %s\n", VERSION);
> +-	printf("usage: "PROGNAME" [-v verbosity_level 0..2] [-c card] [-D devi=
ce] [-u usb-device] [-m mode]\n");
> ++	printf("usage: " PROGNAME " [-v verbosity_level 0..2] [-c card] [-D de=
vice] [-u usb-device] [-m mode]\n");
> + 	printf("mode is one of (us224, us428, mixxx)\n");
> + }
> + /*
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch b/me=
ta/recipes-multimedia/alsa/alsa-tools/autotools.patch
> index 2e74963c89..c85834a593 100644
> --- a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
> +++ b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
> @@ -1,3 +1,8 @@
> +From b9a65bf3ba5628cfe8cfd2d10ce2dcf11a606775 Mon Sep 17 00:00:00 2001
> +From: Dongxiao Xu <dongxiao.xu@intel.com>
> +Date: Thu, 14 Jul 2011 15:40:36 +0800
> +Subject: [PATCH] alsa-tools: Fix recipe build error.
> +
>  Add parameters to autoreconf to support cross compile.
>  Remove some sub-components which needs further recipe support.
> =20
> @@ -5,22 +10,17 @@ Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> =20
>  Upstream-Status: Inappropriate [configuration]
> =20
> -diff -ruN alsa-tools-1.0.24.1-orig//ld10k1/gitcompile alsa-tools-1.0.24.=
1/ld10k1/gitcompile
> ---- alsa-tools-1.0.24.1-orig//ld10k1/gitcompile	2011-07-06 11:27:40.2276=
65002 +0800
> -+++ alsa-tools-1.0.24.1/ld10k1/gitcompile	2011-07-14 13:26:18.017665004 =
+0800
> -@@ -1,6 +1,6 @@
> - #!/bin/bash
> -=20
> --autoreconf -fi || exit 1
> -+autoreconf $ACLOCAL_FLAGS -fi || exit 1
> - export CFLAGS=3D'-O2 -Wall -pipe -g'
> - echo "CFLAGS=3D$CFLAGS"
> - echo "./configure $@"
> -diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tools-1.0.24.1/Makefile
> ---- alsa-tools-1.0.24.1-orig//Makefile	2011-07-06 11:27:40.207665000 +08=
00
> -+++ alsa-tools-1.0.24.1/Makefile	2011-07-14 15:08:08.877665009 +0800
> +---
> + Makefile          | 4 ++--
> + ld10k1/gitcompile | 2 +-
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index c32bf25..1119372 100644
> +--- a/Makefile
> ++++ b/Makefile
>  @@ -1,8 +1,8 @@
> - VERSION =3D 1.1.5
> + VERSION =3D 1.1.6
>   TOP =3D .
>  -SUBDIRS =3D as10k1 envy24control hdsploader hdspconf hdspmixer \
>  +SUBDIRS =3D as10k1 envy24control \
> @@ -30,3 +30,15 @@ diff -ruN alsa-tools-1.0.24.1-orig//Makefile alsa-tool=
s-1.0.24.1/Makefile
>   	  hwmixvolume hdajackretask hda-verb hdajacksensetest
>  =20
>   all:
> +diff --git a/ld10k1/gitcompile b/ld10k1/gitcompile
> +index 99429ac..20005d9 100755
> +--- a/ld10k1/gitcompile
> ++++ b/ld10k1/gitcompile
> +@@ -1,6 +1,6 @@
> + #!/bin/bash
> +=20
> +-autoreconf -fi || exit 1
> ++autoreconf $ACLOCAL_FLAGS -fi || exit 1
> + export CFLAGS=3D'-O2 -Wall -pipe -g'
> + echo "CFLAGS=3D$CFLAGS"
> + echo "./configure $@"
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.5.bb b/meta/reci=
pes-multimedia/alsa/alsa-tools_1.1.6.bb
> similarity index 62%
> rename from meta/recipes-multimedia/alsa/alsa-tools_1.1.5.bb
> rename to meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
> index 1be43aa6e7..e065eec6b8 100644
> --- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.5.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
> @@ -5,17 +5,19 @@ SECTION =3D "console/utils"
>  LICENSE =3D "GPLv2 & LGPLv2+"
>  DEPENDS =3D "alsa-lib ncurses glib-2.0"
> =20
> -LIC_FILES_CHKSUM =3D "file://hdsploader/COPYING;md5=3D94d55d512a9ba36caa=
9b7df079bae19f \
> -                    file://ld10k1/COPYING.LIB;md5=3D7fbc338309ac38fefcd6=
4b04bb903e34"
> +LIC_FILES_CHKSUM =3D "file://hdsploader/COPYING;md5=3D59530bdf33659b29e7=
3d4adb9f9f6552 \
> +                    file://ld10k1/COPYING.LIB;md5=3Da916467b91076e631dd8=
edb7424769c7 \
> +                    "
> =20
>  SRC_URI =3D "ftp://ftp.alsa-project.org/pub/tools/${BP}.tar.bz2 \
>             file://autotools.patch \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'file://ma=
kefile_no_gtk.patch', d)} \
>             file://gitcompile_hdajacksensetest \
> +           file://0002-Fix-clang-Wreserved-user-defined-literal-warnings=
=2Epatch \
>             "
> =20
> -SRC_URI[md5sum] =3D "3afb92eb1b4f2edc8691498e57c3ec78"
> -SRC_URI[sha256sum] =3D "bc3c6567de835223ee7d69487b8c22fb395a2e8c613341b0=
c96e6a5f6a2bd534"
> +SRC_URI[md5sum] =3D "5ca8c9437ae779997cd62fb2815fef19"
> +SRC_URI[sha256sum] =3D "d69c4dc2fb641a974d9903e9eb78c94cb0c7ac6c45bae664=
f0c9d6c0a1593227"
> =20
>  inherit autotools-brokensep pkgconfig
> =20
> @@ -37,4 +39,17 @@ do_compile_prepend () {
>      cp ${WORKDIR}/gitcompile_hdajacksensetest ${S}/hdajacksensetest/gitc=
ompile
>  }
> =20
> -FILES_${PN} +=3D "${datadir}/ld10k1"
> +do_install_append() {
> +    sed -i -e "s|/usr/bin/python2|/usr/bin/env python2|g" ${D}${bindir}/=
hwmixvolume
> +}
> +
> +PACKAGES =3D+ "${PN}-hwmixvolume"
> +
> +FILES_${PN}-hwmixvolume =3D "${bindir}/hwmixvolume"
> +
> +FILES_${PN} +=3D "${datadir}/ld10k1 \
> +                ${datadir}/icons/hicolor \
> +               "
> +
> +RDEPENDS_${PN}-hwmixvolume +=3D "python"
> +
> --=20
> 2.17.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWucb/AAKCRA3VSO3ZXaA
HI56AKCiHOLoVMXaKMRM07e9/Csi7OpsQwCgu3CDF4bu1lBBueNXSbHleN5R9jE=
=Pdfa
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
