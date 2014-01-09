Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id B3E9A617AA;
	Thu,  9 Jan 2014 14:42:34 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e53so1374713eek.1
	for <multiple recipients>; Thu, 09 Jan 2014 06:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5+qtQNItFyzRrvNXzZ/vcEAmeqtVO6s9aZrthEvYQzQ=;
	b=i/tSbr+Gh/FEKPE03W1SUtCEV67iJFAY8+YGrH1IJwOSp1kvKvtCP7hW6bJ7sujmgI
	pENCppiMrXCddBZ2PEY6a+B6O9xHMM6VM5NpRNBzVR+MnL8v7lPGB91UIy0bpafscxWg
	bpbTNXNpLKDQSkxq6fV8o4dDCn6OVIBFC/OWm55MbNYaFUI15j+vbu1zAjTyUR8kxsDM
	oK4Ae+5VVPK+9VV1cUzztPbNFU70qGulJtOhQtGKOHb+IiK/EXCsw15hRhqAD1N2APqM
	gEtZ0W6iaLVl/5y4rSdurCLxma9ikLfWuHAJr+T6iafESM0J3IFORS1bBr8JbSKK+lU+
	YdHA==
X-Received: by 10.14.199.197 with SMTP id x45mr3815697een.8.1389278555434;
	Thu, 09 Jan 2014 06:42:35 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 1sm6107666eeg.4.2014.01.09.06.42.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 06:42:34 -0800 (PST)
Date: Thu, 9 Jan 2014 15:42:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140109144245.GF3709@jama>
References: <20140106112936.C3F0C50472@opal>
MIME-Version: 1.0
In-Reply-To: <20140106112936.C3F0C50472@opal>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : autogen-native: upgrade to 5.18.2
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
X-List-Received-Date: Thu, 09 Jan 2014 14:42:35 -0000
X-Groupsio-MsgNum: 48766
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4/KhLkEx1OUQso4T"
Content-Disposition: inline

--4/KhLkEx1OUQso4T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2014 at 11:29:36AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 6bcd2dafa379badab11bff9d7b607f7f5d72fc94
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D6bcd2dafa379badab11bff9d7b607f7f5d72fc94
>=20
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Fri Dec 27 01:05:14 2013 +0800
>=20
> autogen-native: upgrade to 5.18.2
>=20
> * Upgrade from 5.17.4 to 5.18.2
> * Rename files -> autogen
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Fails in world builds:

| gcc  -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I..  -I.. -I../autoopts -isystem/h=
ome/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/=
usr/include -pthread -I/home/jenkins/oe/shr-core-branches/shr-core/tmp-egli=
bc/sysroots/x86_64-linux/usr/include/guile/2.0 -I/home/jenkins/oe/shr-core-=
branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include  -isystem/ho=
me/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/u=
sr/include -O2 -pipe -c -o autogen-ag.o `test -f 'ag.c' || echo './'`ag.c
| In file included from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/x86_64-linux/usr/include/guile/2.0/libguile/array-handle.h:28:=
0,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/x86_64-linux/usr/include/guile/2.0/libguile.h:34,
|                  from autogen.h:60,
|                  from ag.c:7:
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:40:24: error: expected ')' befor=
e '__attribute__'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:40:24: error: expected ',' or ';=
' before ')' token
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:42:27: error: expected ')' befor=
e '__attribute__'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:42:27: error: expected ',' or ';=
' before ')' token
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:44:46: error: expected ')' befor=
e '__attribute__'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:44:46: error: expected ',' or ';=
' before ')' token
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:46:30: error: expected ')' befor=
e '__attribute__'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:46:30: error: expected ',' or ';=
' before ')' token
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:47:50: error: expected ')' befor=
e '__attribute__'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:47:50: error: expected ',' or ';=
' before ')' token
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:49:6: error: expected ')' before=
 '__attribute__'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:49:6: error: expected ',' or ';'=
 before ')' token
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:51:6: error: expected ')' before=
 '__attribute__'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:51:6: error: expected ',' or ';'=
 before ')' token
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:52:44: error: expected ')' befor=
e '__attribute__'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:52:44: error: expected ',' or ';=
' before ')' token
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:53:57: error: expected ')' befor=
e '__attribute__'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:53:57: error: expected ',' or ';=
' before ')' token
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:55:21: error: expected ')' befor=
e '__attribute__'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:55:21: error: expected ',' or ';=
' before ')' token
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:57:28: error: expected ')' befor=
e '__attribute__'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:57:28: error: expected ',' or ';=
' before ')' token
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:59:41: error: expected ')' befor=
e '__attribute__'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:59:41: error: expected ',' or ';=
' before ')' token
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:60:50: error: expected ')' befor=
e '__attribute__'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:60:50: error: expected ',' or ';=
' before ')' token
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:62:19: error: expected ')' befor=
e '__attribute__'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/error.h:62:19: error: expected ',' or ';=
' before ')' token
| In file included from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/x86_64-linux/usr/include/guile/2.0/libguile/root.h:28:0,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/x86_64-linux/usr/include/guile/2.0/libguile/async.h:27,
|                  from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/x86_64-linux/usr/include/guile/2.0/libguile.h:37,
|                  from autogen.h:60,
|                  from ag.c:7:
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/throw.h:82:1: warning: '__noreturn__' at=
tribute ignored [-Wattributes]
| In file included from /home/jenkins/oe/shr-core-branches/shr-core/tmp-egl=
ibc/sysroots/x86_64-linux/usr/include/guile/2.0/libguile.h:89:0,
|                  from autogen.h:60,
|                  from ag.c:7:
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/read.h:63:3: error: expected ')' before =
'__attribute__'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-li=
nux/usr/include/guile/2.0/libguile/read.h:63:3: error: expected ',' or ';' =
before ')' token
| make[3]: *** [autogen-ag.o] Error 1
| make[3]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/x86_64-linux/autogen-native/5.18.2-r0/autogen-5.18.2/agen5'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/x86_64-linux/autogen-native/5.18.2-r0/autogen-5.18.2/agen5'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/x86_64-linux/autogen-native/5.18.2-r0/autogen-5.18.2'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/autogen-native/5=
=2E18.2-r0/temp/log.do_compile.14771)
NOTE: recipe autogen-native-5.18.2-r0: task do_compile: Failed
NOTE: Running task 13583 of 27387 (ID: 21887, /home/jenkins/oe/shr-core-bra=
nches/shr-core/meta-openembedded/meta-oe/recipes-navigation/foxtrotgps/foxt=
rotgps_1.1.1.bb, do_package)
ERROR: Task 26007 (/home/jenkins/oe/shr-core-branches/shr-core/openembedded=
-core/meta/recipes-devtools/autogen/autogen-native_5.18.2.bb, do_compile) f=
ailed with exit code '1'

>=20
> ---
>=20
>  ...n-native_5.17.4.bb =3D> autogen-native_5.18.2.bb} |  6 +--
>  .../autogen/{files =3D> autogen}/guile.patch         | 48 +++++++++++++-=
--------
>  .../increase-timeout-limit.patch                   |  0
>  3 files changed, 31 insertions(+), 23 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/autogen/autogen-native_5.17.4.bb b/met=
a/recipes-devtools/autogen/autogen-native_5.18.2.bb
> similarity index 88%
> rename from meta/recipes-devtools/autogen/autogen-native_5.17.4.bb
> rename to meta/recipes-devtools/autogen/autogen-native_5.18.2.bb
> index 28d82b0..c7950c3 100644
> --- a/meta/recipes-devtools/autogen/autogen-native_5.17.4.bb
> +++ b/meta/recipes-devtools/autogen/autogen-native_5.18.2.bb
> @@ -6,14 +6,14 @@ DESCRIPTION =3D "AutoGen is a tool designed to simplify=
 the creation and\
>  HOMEPAGE =3D "http://www.gnu.org/software/autogen/"
>  SECTION =3D "devel"
>  LICENSE =3D "GPLv3"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"=20
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> =20
>  SRC_URI =3D "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
>             file://guile.patch \
>             file://increase-timeout-limit.patch"
> =20
> -SRC_URI[md5sum] =3D "09f074cba57610bf4ef1147e01c8ae90"
> -SRC_URI[sha256sum] =3D "cd2585f4794d0e9d7f2cb0b9af4f2bd429946e718473edf1=
cf8c49f081ca71ed"
> +SRC_URI[md5sum] =3D "117c4bc5613c57e1b97d760a5d1910a4"
> +SRC_URI[sha256sum] =3D "cc2702dec21ba5b01144865163f6d1a54268d2b72aafc552=
0ad0e0cb57104068"
> =20
>  DEPENDS =3D "guile-native libtool-native libxml2-native"
> =20
> diff --git a/meta/recipes-devtools/autogen/files/guile.patch b/meta/recip=
es-devtools/autogen/autogen/guile.patch
> similarity index 89%
> rename from meta/recipes-devtools/autogen/files/guile.patch
> rename to meta/recipes-devtools/autogen/autogen/guile.patch
> index 8a77dba..332e5aa 100644
> --- a/meta/recipes-devtools/autogen/files/guile.patch
> +++ b/meta/recipes-devtools/autogen/autogen/guile.patch
> @@ -1,14 +1,24 @@
> -Disable the autoconf macros that use dpkg (!) and guile-config to determ=
ine what=20
> -version and where guile is installed, and just use pkg-config directly (=
guile-config is a deprecated wrapper around pkg-config).=20
> -=20
> - Signed-off-by: Ross Burton <ross.burton@intel.com>=20
> - Upstream-Status: Pending (should be submitted)
> +remove dpkg and guile-config
> +
> +Disable the autoconf macros that use dpkg (!) and guile-config to
> +determine what version and where guile is installed, and just use
> +pkg-config directly (guile-config is a deprecated wrapper around
> +pkg-config).
> +
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +Uprade to  5.18.2
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +Upstream-Status: Pending [should be submitted]
> +---
> + config/ag_macros.m4 | 151 +++------------------------------------------=
-------
> + 1 file changed, 8 insertions(+), 143 deletions(-)
> =20
>  diff --git a/config/ag_macros.m4 b/config/ag_macros.m4
> -index 9914a65..b6db97a 100644
> +index c05073e..a8e96da 100644
>  --- a/config/ag_macros.m4
>  +++ b/config/ag_macros.m4
> -@@ -175,123 +175,12 @@ return 0;],
> +@@ -180,118 +180,13 @@ return 0;],
>  =20
>  =20
>   AC_DEFUN([AG_WITHLIB_GUILE],[
> @@ -26,7 +36,12 @@ index 9914a65..b6db97a 100644
>  -    ag_cv_with_libguile_cflags=3Dno
>  -    ag_cv_with_libguile_libs=3Dno
>  -  else
> --
> ++  PKG_PROG_PKG_CONFIG
> ++  PKG_CHECK_MODULES(LIBGUILE, [guile-2.0])
> ++  case "${LIBGUILE_LIBS}" in *-L* )
> ++    LIBGUILE_PATH=3D`echo ,${LIBGUILE_LIBS} |           sed 's/.*[, ]-L=
[   ]*//;s/[  ].*//'`
> ++  ;; * ) LIBGUILE_PATH=3D'' ;; esac
> +=20
>  -  AC_ARG_WITH([libguile-cflags],
>  -    AS_HELP_STRING([--with-libguile-cflags], [libguile compile flags]),
>  -    [ag_cv_with_libguile_cflags=3D${with_libguile_cflags}],
> @@ -109,14 +124,10 @@ index 9914a65..b6db97a 100644
>  -  AC_MSG_RESULT([${ag_cv_with_libguile}])
>  -    AC_SUBST([LIBGUILE_CFLAGS])
>  -    AC_SUBST([LIBGUILE_LIBS])
> --    AC_SUBST([LIBGUILE_PATH])
>  -  if test "X${ag_cv_with_libguile}" !=3D Xno
>  -  then[
>  -      LIBGUILE_CFLAGS=3D"${ag_cv_with_libguile_cflags}"
> --      LIBGUILE_LIBS=3D"${ag_cv_with_libguile_libs}"
> --      case "${LIBGUILE_LIBS}" in *-L* )
> --        LIBGUILE_PATH=3D`echo ,${LIBGUILE_LIBS} |           sed 's/.*[,=
 ]-L[ 	]*//;s/[ 	].*//'`
> --      ;; * ) LIBGUILE_PATH=3D'' ;; esac]
> +-      LIBGUILE_LIBS=3D"${ag_cv_with_libguile_libs}"]
>  -          CPPFLAGS=3D"@S|@{ag_save_CPPFLAGS}"
>  -      LIBS=3D"@S|@{ag_save_LIBS}"
>  -  else
> @@ -124,20 +135,14 @@ index 9914a65..b6db97a 100644
>  -    LIBS=3D"${ag_save_LIBS}"
>  -      LIBGUILE_CFLAGS=3D''
>  -      LIBGUILE_LIBS=3D''
> --      LIBGUILE_PATH=3D''
>  -      AC_MSG_ERROR([Cannot find libguile.  libguile is required.  Perha=
ps you need to install guile-devel?])
>  -  fi
> -+  PKG_PROG_PKG_CONFIG
> -+  PKG_CHECK_MODULES(LIBGUILE, [guile-2.0])
> -+  case "${LIBGUILE_LIBS}" in *-L* )
> -+    LIBGUILE_PATH=3D`echo ,${LIBGUILE_LIBS} |           sed 's/.*[, ]-L=
[   ]*//;s/[  ].*//'`
> -+  ;; * ) LIBGUILE_PATH=3D'' ;; esac
>     AC_SUBST([AG_GUILE])
>  -
>   ]) # end of AC_DEFUN of AG_WITHLIB_GUILE
>  =20
>  =20
> -@@ -311,40 +200,10 @@ AC_DEFUN([AG_WITHCONF_GUILE_VER],[
> +@@ -311,40 +206,10 @@ AC_DEFUN([AG_WITHCONF_GUILE_VER],[
>  =20
>  =20
>   AC_DEFUN([AG_TEST_GUILE_VERSION],[
> @@ -181,3 +186,6 @@ index 9914a65..b6db97a 100644
>     AC_MSG_RESULT([${ag_cv_test_guile_version}])
>     if test "X${ag_cv_test_guile_version}" !=3D Xno
>     then
> +--=20
> +1.8.3.1
> +
> diff --git a/meta/recipes-devtools/autogen/files/increase-timeout-limit.p=
atch b/meta/recipes-devtools/autogen/autogen/increase-timeout-limit.patch
> similarity index 100%
> rename from meta/recipes-devtools/autogen/files/increase-timeout-limit.pa=
tch
> rename to meta/recipes-devtools/autogen/autogen/increase-timeout-limit.pa=
tch
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4/KhLkEx1OUQso4T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLOtWUACgkQN1Ujt2V2gBzvRQCgkPePdfnUE7ImsrIJkkYOmlLW
lhAAniBnPKZIFwYcm5xO3Upg7muZKEwb
=H6Mn
-----END PGP SIGNATURE-----

--4/KhLkEx1OUQso4T--
