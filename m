Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id A82946063B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 08:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=6597; q=dns/txt; s=axis-central1;
	t=1582186056; x=1613722056;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=cxynRBMz5RKv8hSIrasIlA1+LZ/+AkwJkL38Z4Llj5k=;
	b=C6y5AzbqjBSBa7FfvtausUpzGqdnxvfSaVnvRg8i3NiQ8BfQp21fkFKL
	7zuMRPaszlOIU+mHJFWeAWm/QFBI+aXQip8ttqVHG+ZUmM7iYSDMFZapQ
	zx5ZePm2O6HJclJTSHyHfA3VoxjlKIGqYDhCH82MB81GWQzHXhoOBPG3+
	0CjyWfKfQQk6avW5tlwWk3L1lSkkB/Ql6kpzzq9fuD/ljaVRagQx4L02h
	UgsfDBuiUpPuHYpFDoamov9vObD9jzmLrjca473X82xXKHjA3yf2RjjE9
	JbwEMKkOLo7Mazhqg/mqmkeDBKWRHPUvpFESYrZ07K8YxQ9VEqQegqSaw A==;
IronPort-SDR: 7xuQw1Psfbs1q85+DIqaTjK53XTemBCOAgxfHjb5V9NOPiRib2YM0GMKIgCxDmDUbDg6+pVhQb
	uE30sXtBhQnGmCakuHKyCmfkM8aC02wWh7MU/CkVN7fPGiFW06ELsFnn1LUzW/1mxJ1KGgDjnA
	esP+/NUY0bM6/tqgOgELcIaAiaJNlvk8xLGnL6JkKusuGhWuROa/ZecYqCeczEc6tS0MX6sxkE
	GmU7uiZciS0MSJN2Nj5axPBKWgdddHy5UUW2+3uv49j+ShgQxllXDA6bsXg9o8incLLiZsa9PA
	4Ek=
X-IronPort-AV: E=Sophos;i="5.70,463,1574118000"; 
   d="scan'208";a="5627177"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3] binutils: Upgrade to 2.34 release
Thread-Index: AQHV53X1e9kZKW3x5EyrDaUUz/yKSqgjpRpA
Date: Thu, 20 Feb 2020 08:07:34 +0000
Message-ID: <ef62cf8da954430991546afa3e3b3840@XBOX03.axis.com>
References: <20200219224239.3662791-1-raj.khem@gmail.com>
In-Reply-To: <20200219224239.3662791-1-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: Re: [PATCH v3] binutils: Upgrade to 2.34 release
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
X-List-Received-Date: Thu, 20 Feb 2020 08:07:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 19 februari 2020 23:43
> To: openembedded-core@lists.openembedded.org
> Cc: Christopher Clark <christopher.clark6@baesystems.com>
> Subject: [OE-core] [PATCH v3] binutils: Upgrade to 2.34 release
>=20
> Details of changelog [1]
>=20
> Removing bfd/ld patch to ebale pe targets instead use

Change "ebale" to "enable".

> specific emulations via --enable-targets for x86_64
>=20
> Re-arrange/forward-port patches and upgrade libctf configure to libtool
> 2.4 patch
>=20
> rpaths are no longer emitted into elfedit/readelf therefore no need of
> chrpath anymore
>=20
> Instead of pre-generating configure scripts and house them in libtool
> patch, generate them during configure. This also ensures that we do not
> patch configure directly but rather the sources which generate it
>=20
> Package newly added libctf library
>=20
> [1] https://lists.gnu.org/archive/html/info-gnu/2020-02/msg00000.html
>=20
> Signed-off-by: Khem Raj <mailto:raj.khem@gmail.com>
> Cc: Christopher Clark <mailto:christopher.clark6@baesystems.com>
> ---
> v2: Fix libtool patch and drop EFI patch for configure option
> v3: Make libtool patch not generate configure, fix packaging

[cut]

> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
> index a4b9aa586d..b070d85e15 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -13,17 +13,12 @@ LICENSE =3D "GPLv3"
>=20
>  DEPENDS =3D "flex-native bison-native zlib-native gnu-config-native auto=
conf-native"
>=20
> -#
> -# we need chrpath > 0.14 and some distros like centos 7 still have older=
 chrpath
> -#
> -DEPENDS_append_class-target =3D " chrpath-replacement-native"
> -EXTRANATIVEPATH_append_class-target =3D " chrpath-native"
> -
>  inherit autotools gettext multilib_header texinfo
>=20
>  FILES_${PN} =3D " \
>  	${bindir}/${TARGET_PREFIX}* \
> -	${libdir}/lib*-*.so \
> +	${libdir}/lib*.so.* \
> +	${libdir}/lib*-${PV}*.so \
>  	${prefix}/${TARGET_SYS}/bin/* \
>          ${bindir}/embedspu"
>=20
> @@ -33,6 +28,8 @@ FILES_${PN}-dev =3D " \
>  	${includedir} \
>  	${libdir}/*.la \
>  	${libdir}/libbfd.so \
> +	${libdir}/libctf.so \
> +	${libdir}/libctf-nobfd.so \
>  	${libdir}/libopcodes.so"
>=20
>  # Rather than duplicating multiple entries for these, make one
> @@ -80,6 +77,8 @@ EXTRA_OECONF =3D "--program-prefix=3D${TARGET_PREFIX} \
>                  ${LDGOLD} \
>                  mailto:${@bb.utils.contains('DISTRO_FEATURES', 'multiarc=
h', '--enable-64-bit-bfd', '', d)}"
>=20
> +EXTRA_OECONF_append_x86-64 =3D " --enable-targets=3Dx86_64-pe,x86_64-pep=
 "
> +
>  LDGOLD_class-native =3D ""
>  LDGOLD_class-crosssdk =3D ""
>  LDGOLD ?=3D "mailto:${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold'=
, '--enable-gold=3Ddefault --enable-threads', '--enable-gold --enable-ld=3D=
default --enable-threads', d)}"
> @@ -112,7 +111,14 @@ export CC_FOR_BUILD =3D "LD_LIBRARY_PATH=3D ${BUILD_=
CC}"
>  MULTIARCH :=3D "mailto:${@bb.utils.contains("DISTRO_FEATURES", "multiarc=
h", "yes", "no", d)}"
>  do_configure[vardeps] +=3D "MULTIARCH"
>  do_configure () {
> -	(cd ${S}; gnu-configize) || die "Failed to run gnu-configize"
> +	(for d in . bfd binutils gas gold gprof ld libctf opcodes; do
> +            cd ${S}/$d
> +            autoconf
> +            rm -rf autom4te.cache
> +        done
> +        cd ${S}
> +        gnu-configize)
> +

Correct the indentation to use tabs.

There are also some patches below that still modify configure, which=20
shouldn't be needed with the introduction of autoconf above.

>  	oe_runconf
>  #
>  # must prime config.cache to ensure the build of libiberty
> @@ -123,10 +129,6 @@ do_configure () {
>  	done
>  }
>=20
> -do_compile_append_class-target() {
> -	chrpath -d ${B}/binutils/elfedit
> -	chrpath -d ${B}/binutils/readelf
> -}
>  do_install () {
>  	autotools_do_install
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosss=
dk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutil=
s/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
> index 3a9461bf4a..a36c259711 100644
> --- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Gene=
rate-relocatable-SDKs.patch
> +++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Gene=
rate-relocatable-SDKs.patch
> @@ -1,7 +1,7 @@
> -From c9aed4cb3c02715b2ba1fc70949043849f202f46 Mon Sep 17 00:00:00 2001
> +From 9caa0964b6f50411d1b4520a31461cd0a87810fd Mon Sep 17 00:00:00 2001
>  From: Khem Raj <mailto:raj.khem@gmail.com>
> -Date: Sun, 8 Dec 2019 00:31:35 -0800
> -Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
> +Date: Mon, 2 Mar 2015 01:58:54 +0000
> +Subject: [PATCH 01/15] binutils-crosssdk: Generate relocatable SDKs
>=20
>  This patch will modify the ELF linker scripts so that the crosssdk
>  linker will generate binaries with a 4096 bytes PT_INTERP section. When =
the binaries

[cut]

> @@ -57,3 +57,6 @@ index f9f0f7d402..9e469dca86 100644
>   fi
>   if test -z "$PLT"; then
>     IPLT=3D".iplt         ${RELOCATING-0} : { *(.iplt) }"
> +--
> +2.25.1
> +

May I suggest that you continue to use --no-signature and --no-numbered as=
=20
options to git format-patch to avoid unnecessary changes to the patches?

 [cut]

> diff --git a/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4=
.patch b/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
> new file mode 100644
> index 0000000000..82906026a9
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0007-Use-libtool-2.4.patch
> @@ -0,0 +1,7118 @@
> +From c0ec70962bffb56b563475f539e8175ea97d7eb1 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 14 Feb 2016 17:04:07 +0000
> +Subject: [PATCH 07/15] Use libtool 2.4
> +
> +get libtool sysroot support
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + bfd/configure.ac |    2 +-
> + libtool.m4       | 1080 +++++++++++------
> + ltmain.sh        | 2925 +++++++++++++++++++++++++++++++---------------
> + ltoptions.m4     |    2 +-
> + ltversion.m4     |   12 +-
> + lt~obsolete.m4   |    2 +-

Wouldn't it be better to run automake --add-missing --copy instead=20
(or autoreconf)? That way you would get rid of all the patches to=20
Makefile.in as well.

> + 6 files changed, 2717 insertions(+), 1306 deletions(-)
> +

[cut]

//Peter


