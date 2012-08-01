Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwYKK-00059v-R1
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:47:00 +0200
Received: by weyr6 with SMTP id r6so4652282wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=K2tetlbSOhtL9rIRgBPv8sWNpAzJ7P1CSB12iI4b7b0=;
	b=DCpVLrUx/LjJdXk6iatet2ZxAsB56Ij29QMOxE7nzLGgrIJDvNTvvXnijI/jTcLQ/q
	l/75cg8A+17Ch7rG2wpmX6UeiRlcGf4YMzqdvt+4XGPbWdWslumuktZXQt6yU/YGeztN
	drcHR9wi7W5qQPi7zYn1w0LgJcnmWSaeMP5SZSllPDfKg2fyb9QJau0CTG+LQafeOXFr
	X2PZLR4jBhIDsNb6sAL/RTBdh9azx4Se+U2Gv/qSPGm0mRNZE0Tt5BFXRDDZneYHD8gf
	m1wzy2dg0/oR4Tl1wKb+QFRUg7qcdrrljkPwI1eIGkmXF2Gkb+TEjYUddSdj7EiKCbAS
	e57g==
Received: by 10.216.64.20 with SMTP id b20mr7870008wed.150.1343824522577;
	Wed, 01 Aug 2012 05:35:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm27722445wib.5.2012.08.01.05.35.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:35:21 -0700 (PDT)
Date: Wed, 1 Aug 2012 14:35:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120801123518.GD16306@jama.jama.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<b6ea047dbcbc736d0ee59508a36e907c5271755f.1343823907.git.ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <b6ea047dbcbc736d0ee59508a36e907c5271755f.1343823907.git.ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 05/12] mesa: Update to 8.0.4 (latest stable version)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 12:47:01 -0000
X-Groupsio-MsgNum: 26632
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8nsIa27JVQLqB7/C"
Content-Disposition: inline

--8nsIa27JVQLqB7/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2012 at 01:31:11PM +0100, Ross Burton wrote:
> From: Damien Lespiau <damien.lespiau@intel.com>
>=20
> - The license file has changed, but the project still has the same
>   license
> - Patches have been rebased on top of the 8.0 branch. crossfix.patch
>   and crossfix-mklib.patch have been merged as they address the same
>   problem
>=20
> Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  ...a-dri_7.11.bbappend =3D> mesa-dri_8.0.4.bbappend} |    0
>  .../mesa/{mesa-7.11.inc =3D> mesa-8.0.4.inc}         |   13 +++--
>  meta/recipes-graphics/mesa/mesa-common.inc         |    4 +-
>  ...ative_7.11.bb =3D> mesa-dri-glsl-native_8.0.4.bb} |    4 +-
>  .../mesa/{mesa-dri_7.11.bb =3D> mesa-dri_8.0.4.bb}   |    0
>  meta/recipes-graphics/mesa/mesa-git.inc            |    9 ++--
>  .../mesa/{mesa-xlib_7.11.bb =3D> mesa-xlib_8.0.4.bb} |    0
>  .../mesa/mesa/0001-Compile-with-uclibc.patch       |   52 ++++++++++++++=
++++++
>  ...ossfix-mklib.patch =3D> 0002-cross-compile.patch} |   39 ++++++++++++=
---
>  ...sa_fix_for_x32.patch =3D> 0003-fix-for-x32.patch} |   30 +++++++----
>  meta/recipes-graphics/mesa/mesa/crossfix.patch     |   18 -------
>  meta/recipes-graphics/mesa/mesa/uclibc.patch       |   42 --------------=
--
>  12 files changed, 118 insertions(+), 93 deletions(-)
>  rename meta-yocto/recipes-graphics/mesa/{mesa-dri_7.11.bbappend =3D> mes=
a-dri_8.0.4.bbappend} (100%)

This ^ isn't for oe-core.

>  rename meta/recipes-graphics/mesa/{mesa-7.11.inc =3D> mesa-8.0.4.inc} (6=
7%)
>  rename meta/recipes-graphics/mesa/{mesa-dri-glsl-native_7.11.bb =3D> mes=
a-dri-glsl-native_8.0.4.bb} (84%)
>  rename meta/recipes-graphics/mesa/{mesa-dri_7.11.bb =3D> mesa-dri_8.0.4.=
bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa-xlib_7.11.bb =3D> mesa-xlib_8.0.=
4.bb} (100%)
>  create mode 100644 meta/recipes-graphics/mesa/mesa/0001-Compile-with-ucl=
ibc.patch
>  rename meta/recipes-graphics/mesa/mesa/{crossfix-mklib.patch =3D> 0002-c=
ross-compile.patch} (68%)
>  rename meta/recipes-graphics/mesa/mesa/{mesa_fix_for_x32.patch =3D> 0003=
-fix-for-x32.patch} (59%)
>  delete mode 100644 meta/recipes-graphics/mesa/mesa/crossfix.patch
>  delete mode 100644 meta/recipes-graphics/mesa/mesa/uclibc.patch
>=20
> diff --git a/meta-yocto/recipes-graphics/mesa/mesa-dri_7.11.bbappend b/me=
ta-yocto/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
> similarity index 100%
> rename from meta-yocto/recipes-graphics/mesa/mesa-dri_7.11.bbappend
> rename to meta-yocto/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
> diff --git a/meta/recipes-graphics/mesa/mesa-7.11.inc b/meta/recipes-grap=
hics/mesa/mesa-8.0.4.inc
> similarity index 67%
> rename from meta/recipes-graphics/mesa/mesa-7.11.inc
> rename to meta/recipes-graphics/mesa/mesa-8.0.4.inc
> index 7c4a690..d9d17bb 100644
> --- a/meta/recipes-graphics/mesa/mesa-7.11.inc
> +++ b/meta/recipes-graphics/mesa/mesa-8.0.4.inc
> @@ -1,16 +1,15 @@
>  DEPENDS +=3D "mesa-dri-glsl-native"
> =20
> -
>  SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.=
bz2 \=20
> -           file://uclibc.patch \
> -           file://crossfix.patch \
> -           file://crossfix-mklib.patch \
> -           file://mesa_fix_for_x32.patch \
> +           file://0001-Compile-with-uclibc.patch \
> +           file://0002-cross-compile.patch \
> +           file://0003-fix-for-x32.patch \
>             "
> +
>  S =3D "${WORKDIR}/Mesa-${PV}"
> =20
> -SRC_URI[md5sum] =3D "ff03aca82d0560009a076a87c888cf13"
> -SRC_URI[sha256sum] =3D "f8bf37a00882840a3e3d327576bc26a79ae7f4e18fe1f7d5=
f17a5b1c80dd7acf"
> +SRC_URI[md5sum] =3D "d546f988adfdf986cff45b1efa2d8a46"
> +SRC_URI[sha256sum] =3D "02ed19f4f5f6535dda03a9932a81438aa78ea723ebba1f39=
a3d49a70a4e1d07e"
> =20
>  do_configure_prepend() {
>    #check for python not python2, because python-native does not stage py=
thon2 binary/link
> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-gr=
aphics/mesa/mesa-common.inc
> index 0987478..01eb5b3 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -10,9 +10,9 @@ HOMEPAGE =3D "http://mesa3d.org"
>  BUGTRACKER =3D "https://bugs.freedesktop.org"
>  SECTION =3D "x11"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D7a3373c039b6b925c42=
7755a4f779c1d"
> +LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D03ccdc4c379c4289aec=
fb8892c546f67"
> =20
> -INC_PR =3D "r18"
> +INC_PR =3D "r0"
>  PE =3D "2"
> =20
> =20
> diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb b/me=
ta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
> similarity index 84%
> rename from meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
> rename to meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
> index 9194595..a81fb6d 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
> +++ b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_8.0.4.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D "file://glsl_parser.cpp;beginline=3D=
3;endline=3D33;md5=3Dd078f1cddc
>  DEPENDS =3D "makedepend-native"
> =20
>  SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.=
bz2"
> -SRC_URI[md5sum] =3D "ff03aca82d0560009a076a87c888cf13"
> -SRC_URI[sha256sum] =3D "f8bf37a00882840a3e3d327576bc26a79ae7f4e18fe1f7d5=
f17a5b1c80dd7acf"
> +SRC_URI[md5sum] =3D "d546f988adfdf986cff45b1efa2d8a46"
> +SRC_URI[sha256sum] =3D "02ed19f4f5f6535dda03a9932a81438aa78ea723ebba1f39=
a3d49a70a4e1d07e"
> =20
>  S =3D "${WORKDIR}/Mesa-${PV}/src/glsl/"
> =20
> diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-g=
raphics/mesa/mesa-dri_8.0.4.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-dri_7.11.bb
> rename to meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
> diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graph=
ics/mesa/mesa-git.inc
> index 1b4c0a6..32b1d96 100644
> --- a/meta/recipes-graphics/mesa/mesa-git.inc
> +++ b/meta/recipes-graphics/mesa/mesa-git.inc
> @@ -1,14 +1,15 @@
>  DEPENDS +=3D "mesa-dri-glsl-native"
> =20
> -SRCREV =3D "983fa4ad523535debf2e94cf6ac1fd4c5630c0d2"
> -PV =3D "7.11+gitr${SRCPV}"
> +SRCREV =3D "c1f4867c89adb1a6b19d66ec8ad146115909f0a7"
> +PV =3D "8.0.4+git${SRCPV}"
> =20
>  LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D03ccdc4c379c4289aec=
fb8892c546f67"
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/mesa-git:"
> =20
>  SRC_URI =3D "git://anongit.freedesktop.org/git/mesa/mesa;protocol=3Dgit \
> -           file://uclibc.patch \
> -           file://crossfix.patch \
> +           file://0001-Compile-with-uclibc.patch \
> +           file://0002-cross-compile.patch \
> +           file://0003-fix-for-x32.patch \
>             "
>  S =3D "${WORKDIR}/git"
> =20
> diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipes-=
graphics/mesa/mesa-xlib_8.0.4.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
> rename to meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
> diff --git a/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.pat=
ch b/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
> new file mode 100644
> index 0000000..d39270a
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
> @@ -0,0 +1,52 @@
> +Compile with uclibc
> +
> +Upstream-Status: Pending
> +---
> + configure.ac            |    3 +++
> + src/glsl/strtod.c       |    2 +-
> + src/mesa/main/imports.c |    2 +-
> + 3 files changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index fbaa376..454dad2 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -543,6 +543,9 @@ AC_SUBST([DLOPEN_LIBS])
> + dnl See if posix_memalign is available
> + AC_CHECK_FUNC([posix_memalign], [DEFINES=3D"$DEFINES -DHAVE_POSIX_MEMAL=
IGN"])
> +=20
> ++dnl See if newlocale is available
> ++AC_CHECK_FUNCS_ONCE(newlocale)
> ++
> + dnl SELinux awareness.
> + AC_ARG_ENABLE([selinux],
> +     [AS_HELP_STRING([--enable-selinux],
> +diff --git a/src/glsl/strtod.c b/src/glsl/strtod.c
> +index a876e13..9fce7e9 100644
> +--- a/src/glsl/strtod.c
> ++++ b/src/glsl/strtod.c
> +@@ -45,7 +45,7 @@ double
> + glsl_strtod(const char *s, char **end)
> + {
> + #if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD_=
_) && \
> +-   !defined(__HAIKU__)
> ++   !defined(__HAIKU__) && defined (HAVE_NEWLOCALE)
> +    static locale_t loc =3D NULL;
> +    if (!loc) {
> +       loc =3D newlocale(LC_CTYPE_MASK, "C", NULL);
> +diff --git a/src/mesa/main/imports.c b/src/mesa/main/imports.c
> +index d3727ef..363bf32 100644
> +--- a/src/mesa/main/imports.c
> ++++ b/src/mesa/main/imports.c
> +@@ -767,7 +767,7 @@ float
> + _mesa_strtof( const char *s, char **end )
> + {
> + #if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD_=
_) && \
> +-   !defined(ANDROID) && !defined(__HAIKU__)
> ++   !defined(ANDROID) && !defined(__HAIKU__) && defined (HAVE_NEWLOCALE)
> +    static locale_t loc =3D NULL;
> +    if (!loc) {
> +       loc =3D newlocale(LC_CTYPE_MASK, "C", NULL);
> +--=20
> +1.7.10.4
> +
> diff --git a/meta/recipes-graphics/mesa/mesa/crossfix-mklib.patch b/meta/=
recipes-graphics/mesa/mesa/0002-cross-compile.patch
> similarity index 68%
> rename from meta/recipes-graphics/mesa/mesa/crossfix-mklib.patch
> rename to meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch
> index dc08228..dc8e994 100644
> --- a/meta/recipes-graphics/mesa/mesa/crossfix-mklib.patch
> +++ b/meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch
> @@ -1,4 +1,7 @@
> -This patch is ported from WindRiver linux and to fix cross compile failu=
re.
> +cross compile
> +
> +This patch is ported from WindRiver linux and to fix cross compile
> +failure.
> =20
>  And original commits are:
>  commit 8d5ccc8113e1b51b0529a00c18a4aba956247e1b
> @@ -7,10 +10,15 @@ commit 5c4212084b871a0c0fb7d174280ec9a634637deb
>  Upstream-Status: Pending
> =20
>  Signed-off-by: Kang Kai <kai.kang@windriver.com>
> +---
> + bin/mklib |   24 ++++++++++++------------
> + 1 file changed, 12 insertions(+), 12 deletions(-)
> =20
> ---- Mesa-7.10.2/bin/mklib.orig	2011-09-28 16:15:34.170000074 +0800
> -+++ Mesa-7.10.2/bin/mklib	2011-09-28 16:15:42.370000073 +0800
> -@@ -49,8 +49,8 @@
> +diff --git a/bin/mklib b/bin/mklib
> +index 9bac29e..b33aa90 100755
> +--- a/bin/mklib
> ++++ b/bin/mklib
> +@@ -49,8 +49,8 @@ expand_archives() {
>                       /*) ;;
>                       *)  FILE=3D"$ORIG_DIR/$FILE" ;;
>                   esac
> @@ -21,7 +29,7 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
>                   for MEMBER in $MEMBERS ; do
>                       NEWFILES=3D"$NEWFILES $DIR/$MEMBER"
>                   done
> -@@ -77,7 +77,7 @@
> +@@ -77,7 +77,7 @@ expand_archives() {
>   make_ar_static_lib() {
>       OPTS=3D$1
>       shift;
> @@ -30,7 +38,7 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
>       shift;
>       LIBNAME=3D$1
>       shift;
> -@@ -87,11 +87,11 @@
> +@@ -87,11 +87,11 @@ make_ar_static_lib() {
>       rm -f ${LIBNAME}
>  =20
>       # make static lib
> @@ -45,7 +53,7 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
>       fi
>  =20
>       echo ${LIBNAME}
> -@@ -313,9 +313,9 @@
> +@@ -313,9 +313,9 @@ case $ARCH in
>   	if [ "x$LINK" =3D "x" ] ; then
>   	    # -linker was not specified so set default link command now
>               if [ $CPLUSPLUS =3D 1 ] ; then
> @@ -57,7 +65,19 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
>               fi
>   	fi
>  =20
> -@@ -531,9 +531,9 @@
> +@@ -535,9 +535,9 @@ case $ARCH in
> + 	if [ "x$LINK" =3D "x" ] ; then
> + 	    # -linker was not specified so set default link command now
> +             if [ $CPLUSPLUS =3D 1 ] ; then
> +-                LINK=3Dg++
> ++                LINK=3D$CXX
> +             else
> +-                LINK=3Dgcc
> ++                LINK=3D$CC
> +             fi
> + 	fi
> +=20
> +@@ -903,9 +903,9 @@ case $ARCH in
>   	if [ "x$LINK" =3D "x" ] ; then
>   	    # -linker was not specified so set default link command now
>               if [ $CPLUSPLUS =3D 1 ] ; then
> @@ -69,3 +89,6 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
>               fi
>   	fi
>  =20
> +--=20
> +1.7.10.4
> +
> diff --git a/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch b/met=
a/recipes-graphics/mesa/mesa/0003-fix-for-x32.patch
> similarity index 59%
> rename from meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
> rename to meta/recipes-graphics/mesa/mesa/0003-fix-for-x32.patch
> index f072c34..2d6a150 100644
> --- a/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
> +++ b/meta/recipes-graphics/mesa/mesa/0003-fix-for-x32.patch
> @@ -1,16 +1,19 @@
>  Upstream-Status: Pending
> =20
> -Using uname like this when cross compiling is a really bad idea. We=20
> -provide the correct linker flags, lets just assume we can get this=20
> +Using uname like this when cross compiling is a really bad idea. We
> +provide the correct linker flags, lets just assume we can get this
>  right ourselves.
> =20
>  RP 2012/04/26
> +---
> + bin/mklib |   16 ----------------
> + 1 file changed, 16 deletions(-)
> =20
> -Index: Mesa-7.11/bin/mklib
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Mesa-7.11.orig/bin/mklib	2012-04-26 19:43:20.729150109 +0000
> -+++ Mesa-7.11/bin/mklib	2012-04-26 20:30:22.421086163 +0000
> -@@ -330,13 +330,7 @@
> +diff --git a/bin/mklib b/bin/mklib
> +index b33aa90..16cb017 100755
> +--- a/bin/mklib
> ++++ b/bin/mklib
> +@@ -330,15 +330,7 @@ case $ARCH in
>   	    ;;
>   	    esac
>  =20
> @@ -18,13 +21,15 @@ Index: Mesa-7.11/bin/mklib
>  -	    # environment.  If so, pass -m32 flag to linker.
>   	    set ${OBJECTS}
>  -	    ABI32=3D`file $1 | grep 32-bit`
> --	    if [ "${ABI32}" -a `uname -m` =3D "x86_64" ] ; then
> +-	    ARM=3D`file $1 | grep ARM`
> +-	    # Do not add "-m32" option for arm.
> +-            if [ -z "$ARM" -a "${ABI32}" -a `uname -m` =3D "x86_64" ] ;=
 then
>  -		OPTS=3D"-m32 ${OPTS}"
>  -	    fi
>  =20
>               if [ "${ALTOPTS}" ] ; then
>                   OPTS=3D${ALTOPTS}
> -@@ -387,13 +381,7 @@
> +@@ -389,15 +381,7 @@ case $ARCH in
>   		# exptmp is removed below
>   	    fi
>  =20
> @@ -32,9 +37,14 @@ Index: Mesa-7.11/bin/mklib
>  -	    # environment.  If so, pass -m32 flag to linker.
>   	    set ${OBJECTS}
>  -	    ABI32=3D`file $1 | grep 32-bit`
> --	    if [ "${ABI32}" -a `uname -m` =3D "x86_64" ] ; then
> +-            ARM=3D`file $1 | grep ARM`
> +-	    # Do not add "-m32" option for arm.
> +-            if [ -z "$ARM" -a "${ABI32}" -a `uname -m` =3D "x86_64" ] ;=
 then
>  -		OPTS=3D"-m32 ${OPTS}"
>  -	    fi
>               if [ "${ALTOPTS}" ] ; then
>                   OPTS=3D${ALTOPTS}
>               fi
> +--=20
> +1.7.10.4
> +
> diff --git a/meta/recipes-graphics/mesa/mesa/crossfix.patch b/meta/recipe=
s-graphics/mesa/mesa/crossfix.patch
> deleted file mode 100644
> index d300e2f..0000000
> --- a/meta/recipes-graphics/mesa/mesa/crossfix.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: Mesa-7.5/bin/mklib
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Mesa-7.5.orig/bin/mklib	2009-08-12 13:01:34.000000000 +0100
> -+++ Mesa-7.5/bin/mklib	2009-08-12 13:04:19.000000000 +0100
> -@@ -234,9 +234,9 @@
> - 	if [ "x$LINK" =3D "x" ] ; then
> - 	    # -linker was not specified so set default link command now
> -             if [ $CPLUSPLUS =3D 1 ] ; then
> --                LINK=3Dg++
> -+                LINK=3D$CXX
> -             else
> --                LINK=3Dgcc
> -+                LINK=3D$CC
> -             fi
> - 	fi
> -=20
> diff --git a/meta/recipes-graphics/mesa/mesa/uclibc.patch b/meta/recipes-=
graphics/mesa/mesa/uclibc.patch
> deleted file mode 100644
> index 49d0234..0000000
> --- a/meta/recipes-graphics/mesa/mesa/uclibc.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -Upstream-Status: Pending
> -
> -Index: Mesa-7.10.2/src/mesa/main/imports.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Mesa-7.10.2.orig/src/mesa/main/imports.c	2011-03-01 12:57:29.0000000=
00 -0800
> -+++ Mesa-7.10.2/src/mesa/main/imports.c	2011-07-20 19:08:49.441785510 -0=
700
> -@@ -757,7 +757,7 @@
> - float
> - _mesa_strtof( const char *s, char **end )
> - {
> --#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD_=
_)
> -+#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD_=
_) && defined (HAVE_NEWLOCALE)
> -    static locale_t loc =3D NULL;
> -    if (!loc) {
> -       loc =3D newlocale(LC_CTYPE_MASK, "C", NULL);
> -Index: Mesa-7.10.2/src/glsl/strtod.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Mesa-7.10.2.orig/src/glsl/strtod.c	2011-01-03 16:45:51.000000000 -08=
00
> -+++ Mesa-7.10.2/src/glsl/strtod.c	2011-07-20 19:10:21.441785488 -0700
> -@@ -44,7 +44,7 @@
> - double
> - glsl_strtod(const char *s, char **end)
> - {
> --#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD_=
_)
> -+#if defined(_GNU_SOURCE) && !defined(__CYGWIN__) && !defined(__FreeBSD_=
_) && defined (HAVE_NEWLOCALE)
> -    static locale_t loc =3D NULL;
> -    if (!loc) {
> -       loc =3D newlocale(LC_CTYPE_MASK, "C", NULL);
> -Index: Mesa-7.10.2/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- Mesa-7.10.2.orig/configure.ac	2011-07-20 19:09:02.000000000 -0700
> -+++ Mesa-7.10.2/configure.ac	2011-07-20 19:09:57.121785492 -0700
> -@@ -450,6 +450,9 @@
> - dnl See if posix_memalign is available
> - AC_CHECK_FUNC([posix_memalign], [DEFINES=3D"$DEFINES -DHAVE_POSIX_MEMAL=
IGN"])
> -=20
> -+dnl See if newlocale is available
> -+AC_CHECK_FUNCS_ONCE(newlocale)
> -+
> - dnl SELinux awareness.
> - AC_ARG_ENABLE([selinux],
> -     [AS_HELP_STRING([--enable-selinux],
> --=20
> 1.7.10
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8nsIa27JVQLqB7/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAZIoYACgkQN1Ujt2V2gByBaQCcCT9AmF7uCvER+9uc7KdoSYuO
DQ4An1NIgsrcM8vs09KXOS6VjCzQYSfd
=xoFG
-----END PGP SIGNATURE-----

--8nsIa27JVQLqB7/C--
