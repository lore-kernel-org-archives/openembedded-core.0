Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 18A8560043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 06:03:54 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so12656402pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 23:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=4SSF1o1IkdCgCeSyi096UVQZ6vJ97+AMOTl5FAcIUfg=;
	b=OJy6njsxzuzePtZOwqWJi/ILaOBWrQik8SZ7+zwBD6Ux7qrRbf3jICOd2wRmdCtI3V
	eBFN287a6k4sM6j3EPFCMbxis07nRbBq5GqEBri7K1UYc54aYUDTac4P27z657eP/UBC
	+ambmWzCDbOYDdlCX008Ulm+P3cRYNRzzc0ezK8gq9YRHMH4uARlid+MqgjIjPIlTVDJ
	5YpNCCi4J/38hM5QSAmg1gZTOvudfS5HO29MuI+nK3A4NK91/1UAxNGL1KlgcQ5zlKi9
	4US0J/eCJ5dRDFUxb4kzUE/cqtn8RolzioVhe0LVXBbA4qkQ4qNSlMDQBBshCd/q0s8P
	3QCA==
X-Received: by 10.68.239.69 with SMTP id vq5mr12376746pbc.111.1440741835128;
	Thu, 27 Aug 2015 23:03:55 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e943:4351:71e0:b332?
	([2601:646:8601:4580:e943:4351:71e0:b332])
	by smtp.gmail.com with ESMTPSA id
	ll8sm4413300pab.39.2015.08.27.23.03.54
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Aug 2015 23:03:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
Date: Thu, 27 Aug 2015 23:03:48 -0700
Message-Id: <7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<cover.1440680489.git.jussi.kukkonen@intel.com>
	<694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/6] gmp: Bring back version 4.2.1 (LGPL 2.1+)
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
X-List-Received-Date: Fri, 28 Aug 2015 06:03:57 -0000
X-Groupsio-MsgNum: 70203
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DD17BC1B-78F3-4EB8-B428-4CB8E942016D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DD17BC1B-78F3-4EB8-B428-4CB8E942016D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 27, 2015, at 6:05 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> =
wrote:
>=20
> gmp 4.2.1 was removed in f181c6ce8b apparently accidentally: It
> was not noticed that 4.2.1 is LGPL 2.1 (and not GPL) so provides
> a useful alternative to the newer "GPLv2 | LGPLv3" version.
>=20
> * Reintroduce 4.2.1. The source includes files that are GPL but the
>  library package is LGPL 2.1+
> * Also reintroduce the two patches removed in f181c6ce8b.
> * Refactor gmp.inc: gmp 6.0.0 build should not be affected in any way.
> * Update 6.0.0 license from "GPLv2 | LGPLv3" to "GPLv2+ | LGPLv3+".
>=20
> [YOCTO #8197]

there are issues with gmp on arm especially thumb mode. What kind of =
testing have you done on this ?

>=20
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
> .../gmp/gmp-4.2.1/disable-stdc.patch               | 39 =
+++++++++++++++
> .../gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch  | 56 =
++++++++++++++++++++++
> .../gmp/{gmp =3D> gmp-6.0.0}/amd64.patch             |  0
> .../append_user_provided_flags.patch               |  0
> .../gmp/{gmp =3D> gmp-6.0.0}/configure.patch         |  0
> .../gmp/{gmp =3D> gmp-6.0.0}/gmp-6.0.0-ppc64.patch   |  0
> .../gmp/{gmp =3D> gmp-6.0.0}/use-includedir.patch    |  0
> meta/recipes-support/gmp/gmp.inc                   | 19 +-------
> meta/recipes-support/gmp/gmp_4.2.1.bb              | 15 ++++++
> meta/recipes-support/gmp/gmp_6.0.0.bb              | 33 ++++++++++---
> 10 files changed, 137 insertions(+), 25 deletions(-)
> create mode 100644 =
meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch
> create mode 100644 =
meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
> rename meta/recipes-support/gmp/{gmp =3D> gmp-6.0.0}/amd64.patch =
(100%)
> rename meta/recipes-support/gmp/{gmp =3D> =
gmp-6.0.0}/append_user_provided_flags.patch (100%)
> rename meta/recipes-support/gmp/{gmp =3D> gmp-6.0.0}/configure.patch =
(100%)
> rename meta/recipes-support/gmp/{gmp =3D> =
gmp-6.0.0}/gmp-6.0.0-ppc64.patch (100%)
> rename meta/recipes-support/gmp/{gmp =3D> =
gmp-6.0.0}/use-includedir.patch (100%)
> create mode 100644 meta/recipes-support/gmp/gmp_4.2.1.bb
>=20
> diff --git a/meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch =
b/meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch
> new file mode 100644
> index 0000000..5decb1c
> --- /dev/null
> +++ b/meta/recipes-support/gmp/gmp-4.2.1/disable-stdc.patch
> @@ -0,0 +1,39 @@
> +This patch was removed in f181c6ce8b3 when gmp 4.2.1 was mistakenly
> +dropped.
> +
> +Upstream is not interested in patches for ancient versions.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +
> +# "extern inline" in traditional gcc means that the function should =
be
> +# inlined wherever it's seen, while in C99, "extern inline" means =
that i
> +# the function should only be inlined where the inline definition is
> +# seen while in other places it's not inlined:
> +# http://gcc.gnu.org/ml/gcc/2006-11/msg00006.html
> +#
> +# gmp checks "--std=3Dgnu99" to use C99 convention however it =
internally
> +# defines some "extern inline" functions in gmp.h, which is included
> +# by mainly .c files and finally lead a flood of redefinition =
function
> +# errors when linking objects together.
> +#
> +# So disable C99/ANSI detection to stick to tranditional gcc behavior
> +#
> +# by Kevin Tian <kevin.tian@intel.com>, 2010-08-13
> +#
> +# (this patch is licensed under GPLv2+)
> +
> +diff --git a/configure.in b/configure.in
> +index 450cc92..aab0b59 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -1869,9 +1869,7 @@ AC_SUBST(DEFN_LONG_LONG_LIMB)
> +
> + # The C compiler and preprocessor, put into ANSI mode if possible.
> + AC_PROG_CC
> +-AC_PROG_CC_STDC
> + AC_PROG_CPP
> +-GMP_H_ANSI
> +
> +
> + # The C compiler on the build system, and associated tests.
> diff --git =
a/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch =
b/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
> new file mode 100644
> index 0000000..63aed05
> --- /dev/null
> +++ =
b/meta/recipes-support/gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch
> @@ -0,0 +1,56 @@
> +automake 1.12 has depricated automatic de-ANSI-fication support
> +
> +this patch avoids these kinds of errors:
> +
> +| configure.in:2240: error: automatic de-ANSI-fication support has =
been removed
> +| Makefile.am:28: error: automatic de-ANSI-fication support has been =
removed
> +
> +Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> +2012/05/02
> +
> +
> +This patch was removed in f181c6ce8b3 when gmp 4.2.1 was mistakenly
> +dropped.
> +
> +Upstream is not interested in patches for ancient versions.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> +
> +
> +Index: gmp-4.2.1/configure.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gmp-4.2.1.orig/configure.in
> ++++ gmp-4.2.1/configure.in
> +@@ -67,7 +67,7 @@ dnl
> + dnl  Note that there's a copy of these options in the top-level =
Makefile.am,
> + dnl  so update there too if changing anything.
> + dnl
> +-AM_INIT_AUTOMAKE([1.8 gnu no-dependencies $(top_builddir)/ansi2knr])
> ++AM_INIT_AUTOMAKE([1.8 gnu no-dependencies])
> + AM_CONFIG_HEADER(config.h:config.in)
> + AM_MAINTAINER_MODE
> +
> +@@ -2022,9 +2022,6 @@ fi
> + echo "      MPN_PATH=3D\"$path\""
> +
> +
> +-# Automake ansi2knr support.
> +-AM_C_PROTOTYPES
> +-
> + GMP_PROG_AR
> + GMP_PROG_NM
> +
> +Index: gmp-4.2.1/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gmp-4.2.1.orig/Makefile.am
> ++++ gmp-4.2.1/Makefile.am
> +@@ -27,7 +27,7 @@
> + # Makefiles in subdirectories, but here we must omit it so automake =
gives
> + # the actual ansi2knr build rule, not "cd $(top_builddir) && make =
ansi2knr".
> + #
> +-AUTOMAKE_OPTIONS =3D 1.8 gnu no-dependencies ansi2knr
> ++AUTOMAKE_OPTIONS =3D 1.8 gnu no-dependencies
> +
> +
> + # Libtool -version-info for libgmp.la and libmp.la.  See =
"Versioning" in the
> diff --git a/meta/recipes-support/gmp/gmp/amd64.patch =
b/meta/recipes-support/gmp/gmp-6.0.0/amd64.patch
> similarity index 100%
> rename from meta/recipes-support/gmp/gmp/amd64.patch
> rename to meta/recipes-support/gmp/gmp-6.0.0/amd64.patch
> diff --git =
a/meta/recipes-support/gmp/gmp/append_user_provided_flags.patch =
b/meta/recipes-support/gmp/gmp-6.0.0/append_user_provided_flags.patch
> similarity index 100%
> rename from =
meta/recipes-support/gmp/gmp/append_user_provided_flags.patch
> rename to =
meta/recipes-support/gmp/gmp-6.0.0/append_user_provided_flags.patch
> diff --git a/meta/recipes-support/gmp/gmp/configure.patch =
b/meta/recipes-support/gmp/gmp-6.0.0/configure.patch
> similarity index 100%
> rename from meta/recipes-support/gmp/gmp/configure.patch
> rename to meta/recipes-support/gmp/gmp-6.0.0/configure.patch
> diff --git a/meta/recipes-support/gmp/gmp/gmp-6.0.0-ppc64.patch =
b/meta/recipes-support/gmp/gmp-6.0.0/gmp-6.0.0-ppc64.patch
> similarity index 100%
> rename from meta/recipes-support/gmp/gmp/gmp-6.0.0-ppc64.patch
> rename to meta/recipes-support/gmp/gmp-6.0.0/gmp-6.0.0-ppc64.patch
> diff --git a/meta/recipes-support/gmp/gmp/use-includedir.patch =
b/meta/recipes-support/gmp/gmp-6.0.0/use-includedir.patch
> similarity index 100%
> rename from meta/recipes-support/gmp/gmp/use-includedir.patch
> rename to meta/recipes-support/gmp/gmp-6.0.0/use-includedir.patch
> diff --git a/meta/recipes-support/gmp/gmp.inc =
b/meta/recipes-support/gmp/gmp.inc
> index 65cde21..6752a39 100644
> --- a/meta/recipes-support/gmp/gmp.inc
> +++ b/meta/recipes-support/gmp/gmp.inc
> @@ -2,32 +2,15 @@ SECTION =3D "devel"
> SUMMARY =3D "GNU multiprecision arithmetic library"
> DESCRIPTION =3D "GMP is a free library for arbitrary precision =
arithmetic, operating on signed integers, rational numbers, and floating =
point numbers"
> HOMEPAGE =3D "http://gmplib.org/"
> -LICENSE =3D "GPLv3 LGPLv3"
>=20
> REVISION ?=3D ""
> -
> -SRC_URI =3D =
"https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
> -	   file://configure.patch \
> -	   file://amd64.patch "
> +SRC_URI =3D =
"https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2"
>=20
> inherit autotools texinfo
>=20
> ARM_INSTRUCTION_SET =3D "arm"
>=20
> -acpaths =3D ""
> -
> BBCLASSEXTEND =3D "native nativesdk"
>=20
> PACKAGECONFIG ??=3D ""
> PACKAGECONFIG[readline] =3D =
"--with-readline=3Dyes,--with-readline=3Dno,readline"
> -
> -EXTRA_OECONF +=3D " --enable-cxx=3Ddetect"
> -
> -PACKAGES =3D+ "libgmpxx"
> -FILES_libgmpxx =3D "${libdir}/libgmpxx${SOLIBS}"
> -
> -do_install_append_class-target() {
> -	sed -i "s|--sysroot=3D${STAGING_DIR_HOST}||g" =
${D}${includedir}/gmp.h
> -}
> -
> -SSTATE_SCAN_FILES +=3D "gmp.h"
> diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb =
b/meta/recipes-support/gmp/gmp_4.2.1.bb
> new file mode 100644
> index 0000000..928c01a
> --- /dev/null
> +++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
> @@ -0,0 +1,15 @@
> +require gmp.inc
> +
> +LICENSE =3D "LGPLv2.1+ & GPLv2+"
> +LICENSE_${PN} =3D "LGPLv2.1+"
> +
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D892f569a555ba9c07a568a7c0c4fa63a \
> +                    =
file://COPYING.LIB;md5=3Dfbc093901857fcd118f065f900982c24 \
> +                    =
file://gmp-h.in;beginline=3D6;endline=3D21;md5=3De056f74a12c3277d730dbcfb8=
5d2ca34"
> +
> +SRC_URI +=3D "file://disable-stdc.patch \
> +            file://gmp_fix_for_automake-1.12.patch \
> +            "
> +
> +SRC_URI[md5sum] =3D "091c56e0e1cca6b09b17b69d47ef18e3"
> +SRC_URI[sha256sum] =3D =
"d07ffcb37eecec35c5ec72516d10b35fdf6e6fef1fcf1dcd37e30b8cbf8bf941"
> diff --git a/meta/recipes-support/gmp/gmp_6.0.0.bb =
b/meta/recipes-support/gmp/gmp_6.0.0.bb
> index 6218491..19b63e5 100644
> --- a/meta/recipes-support/gmp/gmp_6.0.0.bb
> +++ b/meta/recipes-support/gmp/gmp_6.0.0.bb
> @@ -1,14 +1,33 @@
> require gmp.inc
> -LICENSE=3D"GPLv2 | LGPLv3"
> +
> +LICENSE=3D"GPLv2+ | LGPLv3+"
> +
> REVISION=3D"a"
> +
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504 \
> -		    =
file://COPYING.LESSERv3;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> -		    =
file://COPYINGv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> -"
> -SRC_URI_append =3D " file://use-includedir.patch \
> -                   file://append_user_provided_flags.patch \
> -                   file://gmp-6.0.0-ppc64.patch \
> +                   =
file://COPYING.LESSERv3;md5=3D6a6a8e020838b23406c81b19c1d46df6 \
> +                   =
file://COPYINGv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> "
>=20
> +SRC_URI +=3D "file://configure.patch \
> +            file://amd64.patch \
> +            file://use-includedir.patch \
> +            file://append_user_provided_flags.patch \
> +            file://gmp-6.0.0-ppc64.patch \
> +            "
> SRC_URI[md5sum] =3D "b7ff2d88cae7f8085bd5006096eed470"
> SRC_URI[sha256sum] =3D =
"7f8e9a804b9c6d07164cf754207be838ece1219425d64e28cfa3e70d5c759aaf"
> +
> +acpaths =3D ""
> +
> +EXTRA_OECONF +=3D " --enable-cxx=3Ddetect"
> +
> +PACKAGES =3D+ "libgmpxx"
> +FILES_libgmpxx =3D "${libdir}/libgmpxx${SOLIBS}"
> +
> +do_install_append_class-target() {
> +        sed -i "s|--sysroot=3D${STAGING_DIR_HOST}||g" =
${D}${includedir}/gmp.h
> +}
> +
> +SSTATE_SCAN_FILES +=3D "gmp.h"
> +
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_DD17BC1B-78F3-4EB8-B428-4CB8E942016D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXf+ckACgkQuwUzVZGdMxQ5eACfSKwsjluVAHNdrCTIcJEQV6BR
kyYAniDIGnUjMu8Tk1n3CoGthHCdpb/p
=vfs6
-----END PGP SIGNATURE-----

--Apple-Mail=_DD17BC1B-78F3-4EB8-B428-4CB8E942016D--
