Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGqtk-00085O-1U
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 14:39:28 +0200
Received: by wibhn17 with SMTP id hn17so544746wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 05:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=elVVaJHBVvVNTyaP80O+g2E7pow3ceGme4s4SYRpAyI=;
	b=cw4BJU4Sway0kBdsFSTAxDmHuSz4ctr/cu2bC5IkIrRQ5DhHcsFl9wPXS+LIeFY9uo
	UwQQbIM2HERbEZqEcSsCa6X16vNXa6TCciZboNfnUsEN1yolQwyJGvHpa3QUKrHUlccn
	yjnsqEt2sHWogCMcGXWv1JrLj+9P6PcQqvcTJjm+l5MMdR4hfp5dDpYs3/pcwlGaVti9
	zej+zwxuD+oqKjAtuFBw2AV+8OgtSreL4hFbIS8zfBHDMTSMcPsPJLUwDgKpDz++PQCD
	Wr81rXlyStm8HKPxDPlMBYsAhnfW1u4cmfu4gBMfXFAloVn1PHUieKh6pDVq71IQKlyj
	MlsQ==
Received: by 10.180.76.69 with SMTP id i5mr1114185wiw.9.1348662035220;
	Wed, 26 Sep 2012 05:20:35 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm25367193wib.6.2012.09.26.05.20.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 05:20:33 -0700 (PDT)
Date: Wed, 26 Sep 2012 14:20:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120926122041.GI3313@jama.jama.net>
References: <1348661842.31293.108.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1348661842.31293.108.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: Update to 2.34.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 12:39:28 -0000
X-Groupsio-MsgNum: 29910
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a7XSrSxqzVsaECgU"
Content-Disposition: inline

--a7XSrSxqzVsaECgU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 01:17:21PM +0100, Phil Blundell wrote:
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>  .../60_wait-longer-for-threads-to-die.patch        |   11 -----
>  meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch   |   34 ++++++++------=
--
>  meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb      |   43 --------------=
------
>  meta/recipes-core/glib-2.0/glib-2.0_2.34.0.bb      |   43 ++++++++++++++=
++++++
>  4 files changed, 61 insertions(+), 70 deletions(-)
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.34.0.bb

Can you please resend with -M?

Thanks

>=20
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threa=
ds-to-die.patch b/meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-th=
reads-to-die.patch
> index 4ff7b80..67dfeca 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-d=
ie.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-d=
ie.patch
> @@ -7,17 +7,6 @@ Upstream-Status: Inappropriate [patches for test code]
>  diff -ruN glib-2.30.0-orig/tests/threadpool-test.c glib-2.30.0/tests/thr=
eadpool-test.c
>  --- glib-2.30.0-orig/tests/threadpool-test.c	2009-04-01 07:04:21.0000000=
00 +0800
>  +++ glib-2.30.0/tests/threadpool-test.c	2010-11-16 12:28:09.002172678 +0=
800
> -@@ -5,8 +5,8 @@
> -=20
> - #include <glib.h>
> -=20
> --#define DEBUG_MSG(x)
> --/* #define DEBUG_MSG(args) g_printerr args ; g_printerr ("\n");  */
> -+/* #define DEBUG_MSG(x) */
> -+#define DEBUG_MSG(args) g_printerr args ; g_printerr ("\n");
> -=20
> - #define WAIT                5    /* seconds */
> - #define MAX_THREADS         10
>  @@ -130,10 +130,10 @@
>              test_count_threads () =3D=3D 0)
>            break;
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch b/meta/reci=
pes-core/glib-2.0/glib-2.0/nodbus.patch
> index 1e65643..f5b8384 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch
> @@ -5,21 +5,23 @@ Upstream-Status: Inappropriate [configuration]
> =20
>  RP 2012/2/25
> =20
> -Index: glib-2.30.2/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- glib-2.30.2.orig/configure.ac	2012-02-25 14:50:07.444242397 +0000
> -+++ glib-2.30.2/configure.ac	2012-02-25 14:51:28.096240485 +0000
> -@@ -3769,10 +3769,9 @@
> - # Check for libdbus1 - Optional - is only used in the GDBus test cases
> +--- glib-2.34.0/configure.ac~	2012-09-25 12:06:14.383311239 +0100
> ++++ glib-2.34.0/configure.ac	2012-09-25 12:07:28.584958144 +0100
> +@@ -3500,10 +3500,13 @@
>   #
>   # 1.2.14 required for dbus_message_set_serial
> --PKG_CHECK_MODULES(DBUS1,
> --                  dbus-1 >=3D 1.2.14,
> --                  [AC_DEFINE(HAVE_DBUS1, 1, [Define if dbus-1 is availa=
ble]) have_dbus1=3Dyes],
> --                  have_dbus1=3Dno)
> -+DBUS1_CFLAGS=3D
> -+DBUS1_LIBS=3D
> -+$have_dbus1=3Dno     =20
> - AC_SUBST(DBUS1_CFLAGS)
> - AC_SUBST(DBUS1_LIBS)
> - AM_CONDITIONAL(HAVE_DBUS1, [test "x$have_dbus1" =3D "xyes"])
> + AS_IF([ test x$enable_modular_tests =3D xyes], [
> +-   PKG_CHECK_MODULES(DBUS1,
> +-                     dbus-1 >=3D 1.2.14,
> +-                     [AC_DEFINE(HAVE_DBUS1, 1, [Define if dbus-1 is ava=
ilable]) have_dbus1=3Dyes],
> +-                     have_dbus1=3Dno)
> ++#   PKG_CHECK_MODULES(DBUS1,
> ++#                     dbus-1 >=3D 1.2.14,
> ++#                     [AC_DEFINE(HAVE_DBUS1, 1, [Define if dbus-1 is av=
ailable]) have_dbus1=3Dyes],
> ++#                     have_dbus1=3Dno)
> ++   DBUS1_CFLAGS=3D
> ++   DBUS1_LIBS=3D
> ++   have_dbus1=3Dno
> +    AC_SUBST(DBUS1_CFLAGS)
> +    AC_SUBST(DBUS1_LIBS)
> + ])
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.32.4.bb
> deleted file mode 100644
> index 10c0b61..0000000
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -require glib.inc
> -
> -PR =3D "r6"
> -PE =3D "1"
> -
> -DEPENDS +=3D "libffi python-argparse-native zlib"
> -DEPENDS_virtclass-native +=3D "libffi-native python-argparse-native"
> -DEPENDS_virtclass-nativesdk +=3D "nativesdk-libffi python-argparse-nativ=
e nativesdk-zlib ${BPN}-native"
> -
> -SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).spl=
it('.')[1]}"
> -
> -SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
> -           file://configure-libtool.patch \
> -           file://60_wait-longer-for-threads-to-die.patch \
> -           file://glib-2.0_fix_for_x32.patch \
> -           file://nodbus.patch \
> -           file://nolibelf.patch \
> -          "
> -SRC_URI[md5sum] =3D "bf84fefd9c1a5b5a7a38736f4ddd674a"
> -SRC_URI[sha256sum] =3D "a5d742a4fda22fb6975a8c0cfcd2499dd1c809b8afd4ef70=
9bda4d11b167fae2"
> -
> -SRC_URI_append_virtclass-native =3D " file://glib-gettextize-dir.patch"
> -BBCLASSEXTEND =3D "native nativesdk"
> -
> -do_configure_prepend() {
> -	sed -i -e "s:TEST_PROGS +=3D gdbus-serialization::g"  ${S}/gio/tests/Ma=
kefile.am
> -	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/code=
gen/gdbus-codegen.in
> -}
> -
> -do_install_append() {
> -  # remove some unpackaged files
> -  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyc
> -  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyo
> -  # and empty dirs
> -  rmdir ${D}${libdir}/gio/modules/
> -  rmdir ${D}${libdir}/gio/
> -
> -  # Some distros have both /bin/perl and /usr/bin/perl, but we set perl =
location
> -  # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
> -  if [ -f ${D}${bindir}/glib-mkenums ]; then
> -    sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/gli=
b-mkenums
> -  fi
> -}
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.0.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.34.0.bb
> new file mode 100644
> index 0000000..f4e3682
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.0.bb
> @@ -0,0 +1,43 @@
> +require glib.inc
> +
> +PR =3D "r0"
> +PE =3D "1"
> +
> +DEPENDS +=3D "libffi python-argparse-native zlib"
> +DEPENDS_virtclass-native +=3D "libffi-native python-argparse-native"
> +DEPENDS_virtclass-nativesdk +=3D "nativesdk-libffi python-argparse-nativ=
e nativesdk-zlib ${BPN}-native"
> +
> +SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).spl=
it('.')[1]}"
> +
> +SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
> +           file://configure-libtool.patch \
> +           file://60_wait-longer-for-threads-to-die.patch \
> +           file://glib-2.0_fix_for_x32.patch \
> +           file://nolibelf.patch \
> +           file://nodbus.patch \
> +          "
> +SRC_URI[md5sum] =3D "bf84fefd9c1a5b5a7a38736f4ddd674a"
> +SRC_URI[sha256sum] =3D "a5d742a4fda22fb6975a8c0cfcd2499dd1c809b8afd4ef70=
9bda4d11b167fae2"
> +
> +SRC_URI_append_virtclass-native =3D " file://glib-gettextize-dir.patch"
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> +do_configure_prepend() {
> +	sed -i -e "s:TEST_PROGS +=3D gdbus-serialization::g"  ${S}/gio/tests/Ma=
kefile.am
> +	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/code=
gen/gdbus-codegen.in
> +}
> +
> +do_install_append() {
> +  # remove some unpackaged files
> +  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyc
> +  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyo
> +  # and empty dirs
> +  rmdir ${D}${libdir}/gio/modules/
> +  rmdir ${D}${libdir}/gio/
> +
> +  # Some distros have both /bin/perl and /usr/bin/perl, but we set perl =
location
> +  # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
> +  if [ -f ${D}${bindir}/glib-mkenums ]; then
> +    sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/gli=
b-mkenums
> +  fi
> +}
> --=20
> 1.7.10.4
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a7XSrSxqzVsaECgU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBi8xkACgkQN1Ujt2V2gBwR2gCfeE+QJ5bZbQy77DOu/LWc7yLl
eFQAnjWah9bh+hzVWSnmmrrLt5tFmKeZ
=hyOa
-----END PGP SIGNATURE-----

--a7XSrSxqzVsaECgU--
