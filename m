Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id C405C73E11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:11:48 +0000 (UTC)
Received: by wijp15 with SMTP id p15so126489258wij.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 06:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=F/esuwzmvatL0ccgLA9YD6fm7tc77hC5aLlo4/+AAMc=;
	b=CjlgMtH4Z0OysHKJRTxQ5pdQ/tSJ6j/NO6Hm9dF3TNhtWX44vhRsoSqsVb1QVciQdJ
	aJeLUeHSAzVxjZ26EkmpTVhKEGcr71JP45ok4wiz8wv4ieWdU36VppaPUJUDo6c3YxVm
	76m+9J+MbZG1GvpfAo+cA8jkrmIvGYnk3cygyv8UovTZfP0FtjrOwJoDXAeojAe6o8TH
	KGyEEFlVbhYFWTOB5FYguu81veuvCEs7xvnJaokRtQnxoM1HbNWM27lAZQPEmKoHeGRr
	Romuscu3wf44DT12+M7l1zJO46N8ddE0Dba2i9ixyEeFhw5/WMPMY3/pRQDv/IRSx/jx
	/Xjg==
X-Received: by 10.194.248.201 with SMTP id yo9mr22738066wjc.31.1439989908675; 
	Wed, 19 Aug 2015 06:11:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r6sm25982113wiy.13.2015.08.19.06.11.47
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Aug 2015 06:11:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Aug 2015 15:12:01 +0200
To: wenzong.fan@windriver.com
Message-ID: <20150819131201.GA2441@jama>
References: <cover.1439967611.git.wenzong.fan@windriver.com>
	<557dc413728ff7c18f48e1ffaa9f54b7ccb8e3af.1439967611.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <557dc413728ff7c18f48e1ffaa9f54b7ccb8e3af.1439967611.git.wenzong.fan@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] swig: add package 3.0.2
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
X-List-Received-Date: Wed, 19 Aug 2015 13:11:50 -0000
X-Groupsio-MsgNum: 69616
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2015 at 03:29:28AM -0400, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>=20
> Pull package from meta-oe to oe-core:
> meta-oe commit: 8b7d90d8e4c3338f94c588fc7e4a88319bd9a9e8

There is patch for meta-oe to upgrade it to 3.0.6 (which isn't
compatible with some recipes, but fixes for that were sent as well
already).

> It's required for libcap-ng to build python bindings.
>=20
> With adding it to oe-core, the copies from following layers could
> be removed:
>=20
> * meta-oe, meta-selinux, meta-intel-iot-middleware ...
>=20
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta/recipes-devtools/swig/swig.inc                | 63 ++++++++++++++++=
++++
>  ...lf-exe-for-swig-swiglib-on-non-Win32-plat.patch | 69 ++++++++++++++++=
++++++
>  ...nfigure-use-pkg-config-for-pcre-detection.patch | 64 ++++++++++++++++=
++++
>  meta/recipes-devtools/swig/swig_3.0.2.bb           |  8 +++
>  4 files changed, 204 insertions(+)
>  create mode 100644 meta/recipes-devtools/swig/swig.inc
>  create mode 100644 meta/recipes-devtools/swig/swig/0001-Use-proc-self-ex=
e-for-swig-swiglib-on-non-Win32-plat.patch
>  create mode 100644 meta/recipes-devtools/swig/swig/0001-configure-use-pk=
g-config-for-pcre-detection.patch
>  create mode 100644 meta/recipes-devtools/swig/swig_3.0.2.bb
>=20
> diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/=
swig/swig.inc
> new file mode 100644
> index 0000000..9821fa5
> --- /dev/null
> +++ b/meta/recipes-devtools/swig/swig.inc
> @@ -0,0 +1,63 @@
> +DESCRIPTION =3D "SWIG - Simplified Wrapper and Interface Generator"
> +HOMEPAGE =3D "http://swig.sourceforge.net/"
> +LICENSE =3D "BSD & GPLv3"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De7807a6282784a7dde4c846626b08=
fc6 \
> +                    file://LICENSE-GPL;md5=3Dd32239bcb673463ab874e80d47f=
ae504 \
> +                    file://LICENSE-UNIVERSITIES;md5=3D8ce9dcc8f7c994de4a=
408b205c72ba08"
> +
> +SECTION =3D "devel"
> +
> +DEPENDS =3D "libpcre python"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
> +
> +inherit autotools pythonnative
> +
> +EXTRA_OECONF =3D " \
> +    --with-python=3D${PYTHON} \
> +    --without-allegrocl \
> +    --without-android \
> +    --without-boost \
> +    --without-chicken \
> +    --without-clisp \
> +    --without-csharp \
> +    --without-d \
> +    --without-gcj \
> +    --without-go \
> +    --without-guile \
> +    --without-java \
> +    --without-lua \
> +    --without-mzscheme \
> +    --without-ocaml \
> +    --without-octave \
> +    --without-perl5 \
> +    --without-pike \
> +    --without-php \
> +    --without-python3 \
> +    --without-r \
> +    --without-ruby \
> +    --without-tcl \
> +"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +do_configure() {
> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${=
S}/Tools/config
> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}=
/Tools/config
> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${=
S}
> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
> +    oe_runconf
> +}
> +
> +do_install_append_class-nativesdk() {
> +    cd ${D}${bindir}
> +    ln -s swig swig2.0
> +}
> +
> +def swiglib_relpath(d):
> +    swiglib =3D d.getVar('datadir', True) + "/" + d.getVar('BPN', True) =
+ "/" + d.getVar('PV', True)
> +    return os.path.relpath(swiglib, d.getVar('bindir', True))
> +
> +do_install_append_class-native() {
> +    create_wrapper ${D}${bindir}/swig SWIG_LIB=3D'`dirname $''realpath`'=
/${@swiglib_relpath(d)}
> +}
> diff --git a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-s=
wig-swiglib-on-non-Win32-plat.patch b/meta/recipes-devtools/swig/swig/0001-=
Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
> new file mode 100644
> index 0000000..81df3e2
> --- /dev/null
> +++ b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swi=
glib-on-non-Win32-plat.patch
> @@ -0,0 +1,69 @@
> +From a4a0440a644c6c5e5da096efe3cf05ba309a284f Mon Sep 17 00:00:00 2001
> +From: "NODA, Kai" <nodakai@gmail.com>
> +Date: Sun, 22 Apr 2012 17:01:02 +0900
> +Subject: [PATCH] Use /proc/self/exe for "swig -swiglib" on non-Win32
> + platforms.
> +
> +If it wasn't found, then fall back to a fixed string just as before.
> +
> +Upstream-Status: Submitted
> +http://sourceforge.net/mailarchive/message.php?msg_id=3D29179733
> +
> +---
> + Source/Modules/main.cxx |   24 ++++++++++++++++++++++--
> + 1 file changed, 22 insertions(+), 2 deletions(-)
> +
> +diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
> +index d2f5d3b..cbb0a12 100644
> +--- a/Source/Modules/main.cxx
> ++++ b/Source/Modules/main.cxx
> +@@ -26,6 +26,11 @@ char cvsroot_main_cxx[] =3D "$Id$";
> + #include "cparse.h"
> + #include <ctype.h>
> + #include <limits.h>		// for INT_MAX
> ++#ifndef _WIN32
> ++#include <cstddef>
> ++#include <unistd.h>		// for readlink
> ++#include <sys/stat.h>		// for stat
> ++#endif
> +=20
> + // Global variables
> +=20
> +@@ -902,9 +907,9 @@ int SWIG_main(int argc, char *argv[], Language *l) {
> +=20
> +   // Check for SWIG_LIB environment variable
> +   if ((c =3D getenv("SWIG_LIB")) =3D=3D (char *) 0) {
> ++    char *p;
> + #if defined(_WIN32)
> +     char buf[MAX_PATH];
> +-    char *p;
> +     if (!(GetModuleFileName(0, buf, MAX_PATH) =3D=3D 0 || (p =3D strrch=
r(buf, '\\')) =3D=3D 0)) {
> +       *(p + 1) =3D '\0';
> +       SwigLib =3D NewStringf("%sLib", buf); // Native windows installat=
ion path
> +@@ -914,7 +919,22 @@ int SWIG_main(int argc, char *argv[], Language *l) {
> +     if (Len(SWIG_LIB_WIN_UNIX) > 0)
> +       SwigLibWinUnix =3D NewString(SWIG_LIB_WIN_UNIX); // Unix installa=
tion path using a drive letter (for msys/mingw)
> + #else
> +-    SwigLib =3D NewString(SWIG_LIB);
> ++    char buf[PATH_MAX];
> ++    if (0 < ::readlink("/proc/self/exe", buf, sizeof(buf)) &&
> ++        (p =3D ::strstr(buf, "/bin/swig"))) {
> ++        int major, minor, patch;
> ++        const int ret =3D ::sscanf(VERSION, "%d.%d.%d", &major, &minor,=
 &patch);
> ++        if (3 =3D=3D ret) {
> ++            const ::ptrdiff_t dir_part_len =3D p - buf;
> ++            ::snprintf(p, PATH_MAX - dir_part_len, "/share/swig/%d.%d.%=
d", major, minor, patch);
> ++            struct ::stat stat_res;
> ++            if (0 =3D=3D ::stat(buf, &stat_res) && S_ISDIR(stat_res.st_=
mode)) {
> ++                SwigLib =3D NewString(buf);
> ++            }
> ++        }
> ++    }
> ++    if (NULL =3D=3D SwigLib)
> ++        SwigLib =3D NewString(SWIG_LIB);
> + #endif
> +   } else {
> +     SwigLib =3D NewString(c);
> +--=20
> +1.7.9.5
> +
> diff --git a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-confi=
g-for-pcre-detection.patch b/meta/recipes-devtools/swig/swig/0001-configure=
-use-pkg-config-for-pcre-detection.patch
> new file mode 100644
> index 0000000..1b1128a
> --- /dev/null
> +++ b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-p=
cre-detection.patch
> @@ -0,0 +1,64 @@
> +From 5c4d6d8538994d5fe9b3b46bfafaf0a605e3bda6 Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen.kooi@linaro.org>
> +Date: Tue, 17 Jun 2014 08:18:17 +0200
> +Subject: [PATCH] configure: use pkg-config for pcre detection
> +
> +Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> +Upstream-Status: pending
> +---
> + configure.ac | 38 +++++++-------------------------------
> + 1 file changed, 7 insertions(+), 31 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 0c984b7..6edcec1 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -70,38 +70,14 @@ AC_MSG_RESULT([$with_pcre])
> +=20
> + dnl To make configuring easier, check for a locally built PCRE using th=
e Tools/pcre-build.sh script
> + if test x"${with_pcre}" =3D xyes ; then
> +-  AC_MSG_CHECKING([whether to use local PCRE])
> +-  local_pcre_config=3Dno
> +-  if test -z $PCRE_CONFIG; then
> +-    if test -f `pwd`/pcre/pcre-swig-install/bin/pcre-config; then
> +-      PCRE_CONFIG=3D`pwd`/pcre/pcre-swig-install/bin/pcre-config
> +-      local_pcre_config=3D$PCRE_CONFIG
> +-    fi
> +-  fi
> +-  AC_MSG_RESULT([$local_pcre_config])
> +-fi
> +-AS_IF([test "x$with_pcre" !=3D xno],
> +-  [AX_PATH_GENERIC([pcre],
> +-    [], dnl Minimal version of PCRE we need -- accept any
> +-    [], dnl custom sed script for version parsing is not needed
> +-    [AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE library])
> +-     LIBS=3D"$LIBS $PCRE_LIBS"
> +-     CPPFLAGS=3D"$CPPFLAGS $PCRE_CFLAGS"
> +-    ],
> +-    [AC_MSG_FAILURE([
> +-        Cannot find pcre-config script from PCRE (Perl Compatible Regul=
ar Expressions)
> +-        library package. This dependency is needed for configure to com=
plete,
> +-        Either:
> +-        - Install the PCRE developer package on your system (preferred =
approach).
> +-        - Download the PCRE source tarball, build and install on your s=
ystem
> +-          as you would for any package built from source distribution.
> +-        - Use the Tools/pcre-build.sh script to build PCRE just for SWI=
G to statically
> +-          link against. Run 'Tools/pcre-build.sh --help' for instructio=
ns.
> +-          (quite easy and does not require privileges to install PCRE o=
n your system)
> +-        - Use configure --without-pcre to disable regular expressions s=
upport in SWIG
> +-          (not recommended).])
> +-    ])
> ++  PKG_CHECK_MODULES([PCRE], [libpcre], [
> ++    AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE library])
> ++    LIBS=3D"$LIBS $PCRE_LIBS"
> ++    CPPFLAGS=3D"$CPPFLAGS $PCRE_CFLAGS"
> ++  ], [
> ++    AC_MSG_WARN([$PCRE_PKG_ERRORS])
> +   ])
> ++fi
> +=20
> +=20
> + dnl CCache
> +--=20
> +1.9.3
> +
> diff --git a/meta/recipes-devtools/swig/swig_3.0.2.bb b/meta/recipes-devt=
ools/swig/swig_3.0.2.bb
> new file mode 100644
> index 0000000..ac41914
> --- /dev/null
> +++ b/meta/recipes-devtools/swig/swig_3.0.2.bb
> @@ -0,0 +1,8 @@
> +require ${BPN}.inc
> +
> +SRC_URI +=3D "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win3=
2-plat.patch \
> +            file://0001-configure-use-pkg-config-for-pcre-detection.patc=
h \
> +           "
> +
> +SRC_URI[md5sum] =3D "62f9b0d010cef36a13a010dc530d0d41"
> +SRC_URI[sha256sum] =3D "a2669657cabcedc371f63c0457407a183e0b6b2ef4e7e303=
c1ec9a3964cc7813"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXUgJkACgkQN1Ujt2V2gBz1nwCfd9mrFdBUnuH/7z4vgj98ilGV
NvAAnA+6H1QDwG7Eis+5llQdv3Hx0p/M
=9ITE
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
