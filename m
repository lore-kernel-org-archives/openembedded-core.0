Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id C3CAE6007B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 12:21:25 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so4881322eek.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 05:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D7/ymCobgYCXOKJQMAg6SaCsT6wSHi4nDV2GJEmAPsM=;
	b=hgKMBNo8TDYCRG/Ppoc0bSbF9kb41zm4EuMKefJSCOIQiZ40PqsWKFdhZAtdPBB1gp
	Qoo+bdUQn3hBgHXwWGaG2TXNH9GmgXfg01Q96GnRS/jm7TCWO/edHfFcP0DBP8s/0OMT
	orOuMkc34+Choihft0xV/YDXQuezjWk4OEsxjGjp80vi6vx/Z1sPVpbxyebvK2uqyZKz
	ejirs2UPSVDpBDkan1E0+/1NvVz8OMvpVehUgx4dZxLaHcc9z9C5RXtf8OYPnMg4EeJB
	PMDJlKNLVQE6TCL/5725luhHSsvOmzzd8viYvH0p8VgdskNFEfm3X9Q1fkXnPX4ij0Bq
	xR5Q==
X-Received: by 10.14.107.2 with SMTP id n2mr178572eeg.122.1376482885618;
	Wed, 14 Aug 2013 05:21:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm74708160eem.1.2013.08.14.05.21.24 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 05:21:25 -0700 (PDT)
Date: Wed, 14 Aug 2013 14:22:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130814122216.GX17945@jama>
References: <cover.1376038140.git.paul.eggleton@linux.intel.com>
	<16c7ff9c4e9ff11888d8d6b594f5ede88a78feeb.1376038140.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <16c7ff9c4e9ff11888d8d6b594f5ede88a78feeb.1376038140.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] libav: add from meta-oe, update and tweak
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
X-List-Received-Date: Wed, 14 Aug 2013 12:21:26 -0000
X-Groupsio-MsgNum: 43323
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mu6rDKe19l+MneQx"
Content-Disposition: inline

--mu6rDKe19l+MneQx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2013 at 09:59:32AM +0100, Paul Eggleton wrote:
> Changes from the meta-oe recipe:
> * Update stable recipe to 0.8.8
> * Update git recipe to the tag for 9.8 (for now)
> * Switch over to a tarball for the release version recipe
> * Add LICENSE_FLAGS =3D "commercial"
> * Set SUMMARY instead of DESCRIPTION
> * Add yasm-native to DEPENDS since there is now a recipe for it
> * Remove libvpx from DEPENDS and add a PACKAGECONFIG option for it,
>   disabled by default since it wasn't actually being enabled
> * Add a PACKAGECONFIG option for x11 to enable/disable x11grab, and
>   add the proper DEPENDS if so (still defaults to enabled)
> * Add a number of other PACKAGECONFIG options, replacing some old
>   comments as well as offering the ability to disable x264.
> * Hide text relocation warning when building for i586 (PIC can't be
>   enabled for 32-bit x86).

only for i586? I've just seen them in armv4t build:
WARNING: QA Issue: ELF binary '/OE/shr-core/tmp-eglibc/work/arm920tt-oe-lin=
ux-gnueabi/libav/0.8.8-r0/packages-split/libswscale/usr/lib/libswscale.so.2=
=2E1.0' has relocations in .text
WARNING: QA Issue: ELF binary '/OE/shr-core/tmp-eglibc/work/arm920tt-oe-lin=
ux-gnueabi/libav/0.8.8-r0/packages-split/libpostproc/usr/lib/libpostproc.so=
=2E52.0.0' has relocations in .text
WARNING: QA Issue: ELF binary '/OE/shr-core/tmp-eglibc/work/arm920tt-oe-lin=
ux-gnueabi/libav/0.8.8-r0/packages-split/libavutil/usr/lib/libavutil.so.51.=
22.1' has relocations in .text
WARNING: QA Issue: ELF binary '/OE/shr-core/tmp-eglibc/work/arm920tt-oe-lin=
ux-gnueabi/libav/0.8.8-r0/packages-split/libavformat/usr/lib/libavformat.so=
=2E53.21.1' has relocations in .text
WARNING: QA Issue: ELF binary '/OE/shr-core/tmp-eglibc/work/arm920tt-oe-lin=
ux-gnueabi/libav/0.8.8-r0/packages-split/libavfilter/usr/lib/libavfilter.so=
=2E2.15.0' has relocations in .text
WARNING: QA Issue: ELF binary '/OE/shr-core/tmp-eglibc/work/arm920tt-oe-lin=
ux-gnueabi/libav/0.8.8-r0/packages-split/libavdevice/usr/lib/libavdevice.so=
=2E53.2.0' has relocations in .text
WARNING: QA Issue: ELF binary '/OE/shr-core/tmp-eglibc/work/arm920tt-oe-lin=
ux-gnueabi/libav/0.8.8-r0/packages-split/libavcodec/usr/lib/libavcodec.so.5=
3.35.0' has relocations in .text

But I know it's not new issue, the same problem was in meta-oe version.

> * Drop PR
>=20
> Notes for the git recipe:
> * This hasn't been able to be built recently in meta-oe since there was
>   a circular dependency between libav and libpostproc. libpostproc is
>   part of libav 0.8.x but was split out in 9+ and is not needed at all
>   anymore by libav itself, so this dependency was removed.
> * Additionally the recipe was filtering out the option to enable
>   libpostproc but this option wasn't being added by the inc file and
>   thus the filter wasn't doing anything, so I dropped this as well.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  .../0001-configure-enable-pic-for-AArch64.patch    |  23 ++++
>  meta/recipes-multimedia/libav/libav.inc            | 129 +++++++++++++++=
++++++
>  meta/recipes-multimedia/libav/libav_0.8.8.bb       |  18 +++
>  meta/recipes-multimedia/libav/libav_git.bb         |  16 +++
>  4 files changed, 186 insertions(+)
>  create mode 100644 meta/recipes-multimedia/libav/libav-0.8.8/0001-config=
ure-enable-pic-for-AArch64.patch
>  create mode 100644 meta/recipes-multimedia/libav/libav.inc
>  create mode 100644 meta/recipes-multimedia/libav/libav_0.8.8.bb
>  create mode 100644 meta/recipes-multimedia/libav/libav_git.bb
>=20
> diff --git a/meta/recipes-multimedia/libav/libav-0.8.8/0001-configure-ena=
ble-pic-for-AArch64.patch b/meta/recipes-multimedia/libav/libav-0.8.8/0001-=
configure-enable-pic-for-AArch64.patch
> new file mode 100644
> index 0000000..d9b22b9
> --- /dev/null
> +++ b/meta/recipes-multimedia/libav/libav-0.8.8/0001-configure-enable-pic=
-for-AArch64.patch
> @@ -0,0 +1,23 @@
> +From 58db99e98f615d79ea90cac8f4bcf11c94e3e7c7 Mon Sep 17 00:00:00 2001
> +From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> +Date: Thu, 10 Jan 2013 12:42:19 +0100
> +Subject: [PATCH] configure: enable pic for AArch64
> +
> +Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> +
> +Upstream-Status: Backport
> +---
> + configure |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- git.orig/configure
> ++++ git/configure
> +@@ -2393,7 +2393,7 @@ check_host_cflags -std=3Dc99
> + check_host_cflags -Wall
> +=20
> + case "$arch" in
> +-    alpha|ia64|mips|parisc|ppc|sparc)
> ++    alpha|ia64|mips|parisc|ppc|sparc|aarch64)
> +         spic=3D$shared
> +     ;;
> +     x86)
> diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multi=
media/libav/libav.inc
> new file mode 100644
> index 0000000..eae190d
> --- /dev/null
> +++ b/meta/recipes-multimedia/libav/libav.inc
> @@ -0,0 +1,129 @@
> +SUMMARY =3D "A complete, cross-platform solution to record, convert and =
stream audio and video."
> +HOMEPAGE =3D "http://libav.org/"
> +SECTION =3D "libs"
> +LICENSE =3D "GPLv2+"
> +LICENSE_FLAGS =3D "commercial"
> +
> +# Provides ffmpeg compat, see http://libav.org/about.html
> +PROVIDES =3D "ffmpeg"
> +
> +ARM_INSTRUCTION_SET =3D "arm"
> +
> +DEPENDS =3D "virtual/libsdl zlib libogg libvorbis libtheora yasm-native"
> +
> +INC_PR =3D "r8"
> +
> +inherit autotools pkgconfig
> +
> +B =3D "${S}/build.${HOST_SYS}.${TARGET_SYS}"
> +
> +FULL_OPTIMIZATION_armv7a =3D "-fexpensive-optimizations -fomit-frame-poi=
nter -O4 -ffast-math"
> +BUILD_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
> +
> +EXTRA_FFCONF_armv7a =3D "--cpu=3Dcortex-a8"
> +EXTRA_FFCONF ?=3D ""
> +
> +PACKAGECONFIG ??=3D "bzip2 x264 x11"
> +PACKAGECONFIG[jack] =3D "--enable-indev=3Djack,--disable-indev=3Djack,ja=
ck"
> +PACKAGECONFIG[bzip2] =3D "--enable-bzlib,--disable-bzlib,bzip2"
> +PACKAGECONFIG[schroedinger] =3D "--enable-libschroedinger,--disable-libs=
chroedinger,schroedinger"
> +PACKAGECONFIG[gsm] =3D "--enable-libgsm,--disable-libgsm,libgsm"
> +PACKAGECONFIG[x264] =3D "--enable-libx264,--disable-libx264,x264"
> +PACKAGECONFIG[vpx] =3D "--enable-libvpx,--disable-libvpx,libvpx"
> +PACKAGECONFIG[mp3lame] =3D "--enable-libmp3lame,--disable-libmp3lame,lam=
e"
> +PACKAGECONFIG[faac] =3D "--enable-libfaac,--disable-libfaac,faac"
> +PACKAGECONFIG[x11] =3D "--enable-x11grab,--disable-x11grab,virtual/libx1=
1 libxfixes libxext xproto"
> +
> +EXTRA_OECONF =3D " \
> +    --enable-shared \
> +    --enable-pthreads \
> +    --enable-gpl \
> +    --enable-avfilter \
> +    \
> +    --cross-prefix=3D${TARGET_PREFIX} \
> +    --prefix=3D${prefix} \
> +    \
> +    --enable-avserver \
> +    --enable-avplay \
> +    --enable-libtheora  \
> +    --enable-libvorbis \
> +    --arch=3D${TARGET_ARCH} \
> +    --target-os=3D"linux" \
> +    --enable-cross-compile \
> +    --extra-cflags=3D"${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTION=
S}" \
> +    --extra-ldflags=3D"${TARGET_LDFLAGS}" \
> +    --sysroot=3D"${STAGING_DIR_TARGET}" \
> +    --enable-hardcoded-tables \
> +    ${EXTRA_FFCONF} \
> +"
> +
> +do_configure() {
> +    # We don't have TARGET_PREFIX-pkgconfig
> +    sed -i '/pkg_config_default=3D"${cross_prefix}${pkg_config_default}"=
/d' ${S}/configure
> +    mkdir -p ${B}
> +    cd ${B}
> +    ${S}/configure ${EXTRA_OECONF}
> +    sed -i -e s:Os:O4:g ${B}/config.h
> +}
> +
> +do_install_append() {
> +    install -m 0644 ${S}/libavfilter/*.h ${D}${includedir}/libavfilter/
> +}
> +
> +FFMPEG_LIBS =3D "libavcodec libavdevice libavformat \
> +               libavutil libpostproc libswscale libavfilter"
> +
> +PACKAGES +=3D "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
> +
> +RSUGGESTS_${PN} =3D "mplayer"
> +FILES_${PN} =3D "${bindir}"
> +FILES_${PN}-dev =3D "${includedir}/${PN}"
> +
> +FILES_${PN}-vhook =3D "${libdir}/vhook"
> +FILES_${PN}-vhook-dbg +=3D "${libdir}/vhook/.debug"
> +
> +FILES_ffmpeg-x264-presets =3D "${datadir}/*.avpreset"
> +
> +LEAD_SONAME =3D "libavcodec.so"
> +
> +FILES_${PN}-dev =3D "${includedir}"
> +
> +python populate_packages_prepend() {
> +    av_libdir =3D d.expand('${libdir}')
> +    av_pkgconfig =3D d.expand('${libdir}/pkgconfig')
> +
> +    # Runtime package
> +    do_split_packages(d, av_libdir, '^lib(.*)\.so\..*',
> +                      output_pattern=3D'lib%s',
> +                      description=3D'libav %s library',
> +                      extra_depends=3D'',
> +                      prepend=3DTrue,
> +                      allow_links=3DTrue)
> +
> +    # Development packages (-dev, -staticdev)
> +    do_split_packages(d, av_libdir, '^lib(.*)\.so$',
> +                      output_pattern=3D'lib%s-dev',
> +                      description=3D'libav %s development package',
> +                      extra_depends=3D'${PN}-dev',
> +                      prepend=3DTrue,
> +                      allow_links=3DTrue)
> +    do_split_packages(d, av_pkgconfig, '^lib(.*)\.pc$',
> +                      output_pattern=3D'lib%s-dev',
> +                      description=3D'libav %s development package',
> +                      extra_depends=3D'${PN}-dev',
> +                      prepend=3DTrue)
> +    do_split_packages(d, av_libdir, '^lib(.*)\.a$',
> +                      output_pattern=3D'lib%s-staticdev',
> +                      description=3D'libav %s development package - stat=
ic library',
> +                      extra_depends=3D'${PN}-dev',
> +                      prepend=3DTrue,
> +                      allow_links=3DTrue)
> +
> +    if d.getVar('TARGET_ARCH', True) =3D=3D 'i586':
> +        # libav can't be build with -fPIC for 32-bit x86
> +        pkgs =3D d.getVar('PACKAGES', True).split()
> +        for pkg in pkgs:
> +            d.appendVar('INSANE_SKIP_%s' % pkg, ' textrel')
> +}
> +
> +PACKAGES_DYNAMIC +=3D "^lib(av(codec|device|filter|format|util)|postproc=
).*"
> diff --git a/meta/recipes-multimedia/libav/libav_0.8.8.bb b/meta/recipes-=
multimedia/libav/libav_0.8.8.bb
> new file mode 100644
> index 0000000..9cb4cf2
> --- /dev/null
> +++ b/meta/recipes-multimedia/libav/libav_0.8.8.bb
> @@ -0,0 +1,18 @@
> +require libav.inc
> +
> +SRC_URI =3D "http://libav.org/releases/libav-0.8.8.tar.xz \
> +           file://0001-configure-enable-pic-for-AArch64.patch"
> +
> +SRC_URI[md5sum] =3D "34b8f1279a04466386ed67731197efe3"
> +SRC_URI[sha256sum] =3D "e95cf618eb6239177a62c46f15e840c37e02e8308baf9491=
2fc5910ff4aacbf2"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80f=
daf4a4263 \
> +                    file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d4=
7fae504 \
> +                    file://COPYING.LGPLv2.1;md5=3De344c8fa836c3a41c4cbd7=
9d7bd3a379 \
> +                    file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d98368=
0233ad02"
> +
> +EXTRA_OECONF +=3D " \
> +    --enable-postproc \
> +"
> +
> +
> diff --git a/meta/recipes-multimedia/libav/libav_git.bb b/meta/recipes-mu=
ltimedia/libav/libav_git.bb
> new file mode 100644
> index 0000000..951baa9
> --- /dev/null
> +++ b/meta/recipes-multimedia/libav/libav_git.bb
> @@ -0,0 +1,16 @@
> +require libav.inc
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80f=
daf4a4263 \
> +                    file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d4=
7fae504 \
> +                    file://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c812e4c18=
d1b79df004 \
> +                    file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d98368=
0233ad02"
> +
> +PV =3D "9.8+git${SRCPV}"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRCREV =3D "9aaca159bd220582c698f13d081a455f398c9975"
> +SRC_URI =3D "git://git.libav.org/libav.git"
> +
> +S =3D "${WORKDIR}/git"
> +
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mu6rDKe19l+MneQx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlILdngACgkQN1Ujt2V2gBzI+QCfWE/4EPFNnJ7et8+EjUsM4DCI
MNMAoIVLtUDQqqtyR0kojqpxwRrvoBjo
=N7Bc
-----END PGP SIGNATURE-----

--mu6rDKe19l+MneQx--
