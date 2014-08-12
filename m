Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id AE94365DB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 15:51:01 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t60so10202017wes.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 08:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NsrxS0MLDCe0d3Z5gH2BfIwwduTc0yzc7UpNxQufcqY=;
	b=OxBP4AWJzNWuGcOpCGUEe9VKXExzOe3nIbKak3TCKgj4lZFWwm8cb1VSZyaPNCfywT
	CvSifEax1ViDRc3v4gyV1cUn/TR+p8Gwn9/9v0wLnp7YXJyEBxlamHsYUDf99SHD8Ppf
	jfzbj/yDjIjlo7OVUCvG3v1Zzo1PNnBeDhyNuvTGjaG2oztP9mkJzy3q6Su48OFS0FYm
	4R6LSXaPgoCaBGEp8I3gkbbopi2B6WZRC8kOtk52BSj7glpYBZTONi6XS2uNXm+HXV3i
	y2KwDXmUgjG8gUn1Ts4Qwaud9PygNCBQBOcIbj7soAWTcVlxLk3a7n7QPeuuoNZLKDim
	NZNw==
X-Received: by 10.194.9.228 with SMTP id d4mr5853703wjb.99.1407858662886;
	Tue, 12 Aug 2014 08:51:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fr2sm57535135wib.7.2014.08.12.08.51.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 08:51:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 17:51:38 +0200
To: Matt Fleming <matt@console-pimps.org>
Message-ID: <20140812155138.GR14848@jama>
References: <1407857266-13529-1-git-send-email-matt@console-pimps.org>
MIME-Version: 1.0
In-Reply-To: <1407857266-13529-1-git-send-email-matt@console-pimps.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Darren Hart <dvhart@linux.intel.com>, Matt Fleming <matt.fleming@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] recipes-devtools: Add OVMF recipe
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
X-List-Received-Date: Tue, 12 Aug 2014 15:51:04 -0000
X-Groupsio-MsgNum: 56364
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Lp4LVNrCn8TtIq1M"
Content-Disposition: inline

--Lp4LVNrCn8TtIq1M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2014 at 04:27:46PM +0100, Matt Fleming wrote:
> From: Matt Fleming <matt.fleming@intel.com>
>=20
> The EDK2 project provides a UEFI firmware image for Qemu.
>=20
> Import the OVMF recipe from the meta-luv layer.
>=20
> Partial solution for [YOCTO #5654]
>=20
> Cc: Max Eliaser <max.eliaser@intel.com>
> Cc: Darren Hart <dvhart@linux.intel.com>
> Cc: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> Signed-off-by: Matt Fleming <matt.fleming@intel.com>
> ---
>  ...s-Force-tools-variables-to-host-toolchain.patch | 48 ++++++++++++++++=
++
>  meta/recipes-devtools/ovmf/ovmf_git.bb             | 59 ++++++++++++++++=
++++++
>  2 files changed, 107 insertions(+)
>  create mode 100644 meta/recipes-devtools/ovmf/ovmf/0001-BaseTools-Force-=
tools-variables-to-host-toolchain.patch
>  create mode 100644 meta/recipes-devtools/ovmf/ovmf_git.bb
>=20
> diff --git a/meta/recipes-devtools/ovmf/ovmf/0001-BaseTools-Force-tools-v=
ariables-to-host-toolchain.patch b/meta/recipes-devtools/ovmf/ovmf/0001-Bas=
eTools-Force-tools-variables-to-host-toolchain.patch
> new file mode 100644
> index 0000000..c0cc633
> --- /dev/null
> +++ b/meta/recipes-devtools/ovmf/ovmf/0001-BaseTools-Force-tools-variable=
s-to-host-toolchain.patch
> @@ -0,0 +1,48 @@
> +From 6e24bde1979c2d7149b37d142fb882dfde0e9770 Mon Sep 17 00:00:00 2001
> +From: Matt Fleming <matt.fleming@intel.com>
> +Date: Fri, 27 Jun 2014 11:12:18 +0100
> +Subject: [PATCH] BaseTools: Force tools variables to host toolchain
> +
> +Signed-off-by: Matt Fleming <matt.fleming@intel.com>
> +---
> + BaseTools/Source/C/Makefiles/app.makefile | 7 +++++++
> + BaseTools/Source/C/VfrCompile/GNUmakefile | 5 +++++
> + 2 files changed, 12 insertions(+)
> +
> +diff --git a/BaseTools/Source/C/Makefiles/app.makefile b/BaseTools/Sourc=
e/C/Makefiles/app.makefile
> +index 19269a1..62aad0f 100644
> +--- a/BaseTools/Source/C/Makefiles/app.makefile
> ++++ b/BaseTools/Source/C/Makefiles/app.makefile
> +@@ -16,6 +16,13 @@ include $(MAKEROOT)/Makefiles/header.makefile
> +=20
> + APPLICATION =3D $(MAKEROOT)/bin/$(APPNAME)
> +=20
> ++CC =3D gcc
> ++CXX =3D g++
> ++AS =3D gcc
> ++AR =3D ar
> ++LD =3D ld
> ++LINKER =3D $(CC)
> ++
> + .PHONY:all
> + all: $(MAKEROOT)/bin $(APPLICATION)=20
> +=20
> +diff --git a/BaseTools/Source/C/VfrCompile/GNUmakefile b/BaseTools/Sourc=
e/C/VfrCompile/GNUmakefile
> +index 82005e1..5ac5f7e 100644
> +--- a/BaseTools/Source/C/VfrCompile/GNUmakefile
> ++++ b/BaseTools/Source/C/VfrCompile/GNUmakefile
> +@@ -26,6 +26,11 @@ OBJECTS =3D AParser.o DLexerBase.o ATokenBuffer.o Efi=
VfrParser.o VfrLexer.o VfrSyn
> +=20
> + VFR_CPPFLAGS =3D -DPCCTS_USE_NAMESPACE_STD $(CPPFLAGS)
> +=20
> ++CC =3D gcc
> ++CXX =3D g++
> ++AS =3D gcc
> ++AR =3D ar
> ++LD =3D ld
> + LINKER =3D $(CXX)
> +=20
> + EXTRA_CLEAN_OBJECTS =3D EfiVfrParser.cpp EfiVfrParser.h VfrParser.dlg V=
frTokens.h VfrLexer.cpp VfrLexer.h VfrSyntax.cpp tokens.h
> +--=20
> +1.9.0
> +
> diff --git a/meta/recipes-devtools/ovmf/ovmf_git.bb b/meta/recipes-devtoo=
ls/ovmf/ovmf_git.bb
> new file mode 100644
> index 0000000..7afd695
> --- /dev/null
> +++ b/meta/recipes-devtools/ovmf/ovmf_git.bb
> @@ -0,0 +1,59 @@
> +DESCRIPTION =3D "OVMF - UEFI firmware for Qemu and KVM"
> +HOMEPAGE =3D "http://sourceforge.net/apps/mediawiki/tianocore/index.php?=
title=3DOVMF"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://OvmfPkg/License.txt;md5=3Dffd52cf9a8e0e036b=
9a61a0de2dc87ed"
> +
> +SRC_URI =3D "git://github.com/tianocore/edk2.git;branch=3Dmaster \
> +	file://0001-BaseTools-Force-tools-variables-to-host-toolchain.patch"
> +
> +SRCREV=3D"dc4ad1532e59fd1a185d6b90d1c2a92cf8713f40"
> +
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS=3D"util-linux-native iasl-native"

I don't think we have iasl in oe-core.

Also the styleguide says you should use space around =3D (SRCREV, DEPENDS,
COMPATIBLE_HOST, BUILD_OPTIMIZATION, GCC_VER)

> +# OVMF has trouble building with the default optimization of -O2.
> +BUILD_OPTIMIZATION=3D"-pipe"
> +
> +# OVMF supports IA only, although it could conceivably support ARM somed=
ay.
> +COMPATIBLE_HOST=3D'(i.86|x86_64).*'
> +
> +do_patch_append() {
> +    bb.build.exec_func('do_fix_iasl', d)
> +    bb.build.exec_func('do_fix_toolchain', d)

Why don't you fix them in do_configure_prepend?

> +}
> +
> +do_fix_iasl() {
> +    sed -i -e 's#/usr/bin/iasl#${STAGING_BINDIR_NATIVE}/iasl#' ${S}/Base=
Tools/Conf/tools_def.template
> +}
> +
> +do_fix_toolchain(){
> +    sed -i -e 's#DEF(ELFGCC_BIN)/#${TARGET_PREFIX}#' ${S}/BaseTools/Conf=
/tools_def.template
> +    sed -i -e 's#DEF(GCC.*PREFIX)#${TARGET_PREFIX}#' ${S}/BaseTools/Conf=
/tools_def.template
> +    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nLFLAGS +=3D ${BUILD_LDFLAGS}#" =
${S}/BaseTools/Source/C/Makefiles/app.makefile
> +    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nCFLAGS +=3D ${BUILD_CFLAGS}#" $=
{S}/BaseTools/Source/C/Makefiles/app.makefile
> +    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nLFLAGS +=3D ${BUILD_LDFLAGS}#" =
${S}/BaseTools/Source/C/VfrCompile/GNUmakefile
> +    sed -i -e "s#^LINKER\(.*\)#LINKER\1\nCFLAGS +=3D ${BUILD_CFLAGS}#" $=
{S}/BaseTools/Source/C/VfrCompile/GNUmakefile
> +}
> +
> +GCC_VER=3D"$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}' | awk -F. '{pri=
nt $1$2}')"
> +
> +do_compile() {
> +    export LFLAGS=3D"${LDFLAGS}"
> +    OVMF_ARCH=3D"X64"
> +    if [ "${TARGET_ARCH}" !=3D "x86_64" ] ; then
> +        OVMF_ARCH=3D"IA32"
> +    fi
> +    ${S}/OvmfPkg/build.sh -a $OVMF_ARCH -b RELEASE -t GCC${GCC_VER}
> +}
> +
> +do_install() {
> +    OVMF_DIR_SUFFIX=3D"X64"
> +    if [ "${TARGET_ARCH}" !=3D "x86_64" ] ; then
> +        OVMF_DIR_SUFFIX=3D"Ia32" # Note the different capitalization
> +    fi
> +    install -d ${D}${datadir}/ovmf
> +    build_dir=3D"${S}/Build/Ovmf$OVMF_DIR_SUFFIX/RELEASE_GCC${GCC_VER}"
> +    install -m 0755 ${build_dir}/FV/OVMF.fd \
> +	${D}${datadir}/ovmf/bios.bin
> +}
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Lp4LVNrCn8TtIq1M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPqOAoACgkQN1Ujt2V2gByt4gCgqJoOc+Sw3FGTRBzDDzBvBVqJ
7KMAn2sT5IIn4OPo0VV+nqcvQQ+iB+wF
=mntt
-----END PGP SIGNATURE-----

--Lp4LVNrCn8TtIq1M--
