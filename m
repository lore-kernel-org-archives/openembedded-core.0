Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RQnTI-0003HC-Qu
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 22:56:44 +0100
Received: by faat2 with SMTP id t2so2192529faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 13:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=IfYRSproImcys/N4T6d+kiJj8Ugl/nuCzi1pyqLH4BQ=;
	b=UWIwK964MH0zUR//GQQTotRLL9bQXRutJ/Xs3cd4lnpsJzufGKf6PpOHl2jOCTXmB3
	jTJqGUip+0gZp6vMfr1cvlai4bSED+ZOXYtvjMOtKdVVMZ0dGFX8b7qhClb6X88W6ryM
	hZ0tyPfsslt6nUhis3NU2s7oDKXdXdjZQEr4Q=
Received: by 10.152.106.130 with SMTP id gu2mr21853540lab.37.1321480220821;
	Wed, 16 Nov 2011 13:50:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.12.36 with HTTP; Wed, 16 Nov 2011 13:49:49 -0800 (PST)
In-Reply-To: <839d81b7f8239d5c3fb01646653d3414ba03dd23.1321470758.git.nitin.a.kamble@intel.com>
References: <cover.1321470758.git.nitin.a.kamble@intel.com>
	<806c47069d2d344d0fe814b50b495f535de2e924.1321470758.git.nitin.a.kamble@intel.com>
	<839d81b7f8239d5c3fb01646653d3414ba03dd23.1321470758.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Nov 2011 13:49:49 -0800
Message-ID: <CAMKF1srTzN83+xUVu3NJyNacFAXB9Tu82adE9XZwQ6yE_RC2pA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] libtool: upgrade from 2.4 to 2.4.2
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
X-List-Received-Date: Wed, 16 Nov 2011 21:56:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

did u look at
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/gold=
-updates&id=3D345f86369d165c9a41a4036c8b90662dc992f0f6

On Wed, Nov 16, 2011 at 11:14 AM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> Rebased patches to the newer source code
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> =C2=A0.../libtool/{libtool-2.4.inc =3D> libtool-2.4.2.inc} | =C2=A0 =C2=
=A06 +-
> =C2=A0...libtool-cross_2.4.bb =3D> libtool-cross_2.4.2.bb} | =C2=A0 =C2=
=A02 +-
> =C2=A0...btool-native_2.4.bb =3D> libtool-native_2.4.2.bb} | =C2=A0 =C2=
=A02 +-
> =C2=A0...nativesdk_2.4.bb =3D> libtool-nativesdk_2.4.2.bb} | =C2=A0 =C2=
=A02 +-
> =C2=A0.../avoid_absolute_paths_for_general_utils.patch =C2=A0 | =C2=A0 =
=C2=A08 +-
> =C2=A0.../libtool/libtool/fix-final-rpath.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 10 +-
> =C2=A0.../libtool/libtool/fix-rpath.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 12 +-
> =C2=A0.../libtool/libtool/prefix-manpage-fix.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 10 +-
> =C2=A0meta/recipes-devtools/libtool/libtool/prefix.patch | =C2=A0 42 ++--
> =C2=A0.../libtool/libtool/rename-with-sysroot.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0194 ++++++++++----------
> =C2=A0.../libtool/libtool/resolve-sysroot.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 20 +--
> =C2=A0.../libtool/libtool/trailingslash.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 10 +-
> =C2=A0.../libtool/libtool/use-sysroot-in-libpath.patch =C2=A0 | =C2=A0 =
=C2=A08 +-
> =C2=A0.../libtool/{libtool_2.4.bb =3D> libtool_2.4.2.bb} =C2=A0 | =C2=A0 =
=C2=A02 +-
> =C2=A014 files changed, 159 insertions(+), 169 deletions(-)
> =C2=A0rename meta/recipes-devtools/libtool/{libtool-2.4.inc =3D> libtool-=
2.4.2.inc} (61%)
> =C2=A0rename meta/recipes-devtools/libtool/{libtool-cross_2.4.bb =3D> lib=
tool-cross_2.4.2.bb} (99%)
> =C2=A0rename meta/recipes-devtools/libtool/{libtool-native_2.4.bb =3D> li=
btool-native_2.4.2.bb} (98%)
> =C2=A0rename meta/recipes-devtools/libtool/{libtool-nativesdk_2.4.bb =3D>=
 libtool-nativesdk_2.4.2.bb} (98%)
> =C2=A0rename meta/recipes-devtools/libtool/{libtool_2.4.bb =3D> libtool_2=
.4.2.bb} (97%)
>
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.inc b/meta/recipes=
-devtools/libtool/libtool-2.4.2.inc
> similarity index 61%
> rename from meta/recipes-devtools/libtool/libtool-2.4.inc
> rename to meta/recipes-devtools/libtool/libtool-2.4.2.inc
> index e3d17b7..7f610af 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.4.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> @@ -7,7 +7,7 @@ FILES_libltdl =3D "${libdir}/libltdl.so.*"
> =C2=A0FILES_libltdl-dev =3D "${libdir}/libltdl.* ${includedir}/ltdl.h"
> =C2=A0FILES_libltdl-dbg =3D "${libdir}/.debug/"
>
> -SRC_URI[md5sum] =3D "b32b04148ecdd7344abc6fe8bd1bb021"
> -SRC_URI[sha256sum] =3D "13df57ab63a94e196c5d6e95d64e53262834fe780d5e82c2=
8f177f9f71ddf62e"
> +SRC_URI[md5sum] =3D "d2f3b7d4627e69e13514a40e72a24d50"
> +SRC_URI[sha256sum] =3D "b38de44862a987293cd3d8dfae1c409d514b6c4e794ebc93=
648febf9afc38918"
>
> -EXTRA_OECONF =3D "--with-sysroot"
> \ No newline at end of file
> +EXTRA_OECONF =3D "--with-sysroot"
> diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb b/meta/re=
cipes-devtools/libtool/libtool-cross_2.4.2.bb
> similarity index 99%
> rename from meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> rename to meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
> index 6d512b1..d669177 100644
> --- a/meta/recipes-devtools/libtool/libtool-cross_2.4.bb
> +++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.2.bb
> @@ -1,6 +1,6 @@
> =C2=A0require libtool-${PV}.inc
>
> -PR =3D "r4"
> +PR =3D "r0"
> =C2=A0PACKAGES =3D ""
> =C2=A0SRC_URI +=3D "file://prefix.patch"
>
> diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.bb b/meta/r=
ecipes-devtools/libtool/libtool-native_2.4.2.bb
> similarity index 98%
> rename from meta/recipes-devtools/libtool/libtool-native_2.4.bb
> rename to meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
> index 3d0998e..e40b9de 100644
> --- a/meta/recipes-devtools/libtool/libtool-native_2.4.bb
> +++ b/meta/recipes-devtools/libtool/libtool-native_2.4.2.bb
> @@ -2,7 +2,7 @@ require libtool-${PV}.inc
>
> =C2=A0DEPENDS =3D ""
>
> -PR =3D "r4"
> +PR =3D "r0"
> =C2=A0SRC_URI +=3D "file://prefix.patch"
>
> =C2=A0inherit native
> diff --git a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb b/met=
a/recipes-devtools/libtool/libtool-nativesdk_2.4.2.bb
> similarity index 98%
> rename from meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
> rename to meta/recipes-devtools/libtool/libtool-nativesdk_2.4.2.bb
> index a96d1d1..55506ed 100644
> --- a/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.bb
> +++ b/meta/recipes-devtools/libtool/libtool-nativesdk_2.4.2.bb
> @@ -1,6 +1,6 @@
> =C2=A0require libtool-${PV}.inc
>
> -PR =3D "r4"
> +PR =3D "r0"
> =C2=A0SRC_URI +=3D "file://prefix.patch"
>
> =C2=A0inherit nativesdk
> diff --git a/meta/recipes-devtools/libtool/libtool/avoid_absolute_paths_f=
or_general_utils.patch b/meta/recipes-devtools/libtool/libtool/avoid_absolu=
te_paths_for_general_utils.patch
> index 6cc88d8..3c751ed 100644
> --- a/meta/recipes-devtools/libtool/libtool/avoid_absolute_paths_for_gene=
ral_utils.patch
> +++ b/meta/recipes-devtools/libtool/libtool/avoid_absolute_paths_for_gene=
ral_utils.patch
> @@ -12,11 +12,11 @@ Nitin A Kamble <nitin.a.kamble@intel.com>
> =C2=A02011/02/18
>
>
> -Index: libtool-2.4/libltdl/config/general.m4sh
> +Index: libtool-2.4.2/libltdl/config/general.m4sh
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/libltdl/config/general.m4sh =C2=A0 =C2=A0 =C2=A0 20=
10-08-31 23:02:45.000000000 -0700
> -+++ libtool-2.4/libltdl/config/general.m4sh =C2=A0 =C2=A02011-02-18 09:5=
9:09.482038240 -0800
> -@@ -45,15 +45,15 @@
> +--- libtool-2.4.2.orig/libltdl/config/general.m4sh
> ++++ libtool-2.4.2/libltdl/config/general.m4sh
> +@@ -45,15 +45,15 @@ progpath=3D"$0"
> =C2=A0M4SH_VERBATIM([[
> =C2=A0: ${CP=3D"cp -f"}
> =C2=A0test "${ECHO+set}" =3D set || ECHO=3D${as_echo-'printf %s\n'}
> diff --git a/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch =
b/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
> index 4c36e4e..5c275ff 100644
> --- a/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
> +++ b/meta/recipes-devtools/libtool/libtool/fix-final-rpath.patch
> @@ -7,11 +7,11 @@ This works around the issue until it gets sorted out up=
stream.
> =C2=A0Fix suggested by Richard Purdie <richard.purdie@intel.com>
> =C2=A0Signed-off-by: Scott Garman <scott.a.garman@intel.com>
>
> -Index: libtool-2.4/libltdl/config/ltmain.m4sh
> +Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/libltdl/config/ltmain.m4sh =C2=A0 =C2=A0 =C2=A0 =C2=
=A02011-01-13 14:10:14.580025108 +0000
> -+++ libtool-2.4/libltdl/config/ltmain.m4sh =C2=A0 =C2=A0 2011-01-13 15:1=
0:18.540025113 +0000
> -@@ -7246,9 +7246,11 @@
> +--- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh
> ++++ libtool-2.4.2/libltdl/config/ltmain.m4sh
> +@@ -7268,9 +7268,11 @@ EOF
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test "$opt_mode" !=3D relink && rpath=
=3D"$compile_rpath$rpath"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for libdir in $rpath; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -n "$hardcode_libdir_fla=
g_spec"; then
> @@ -25,7 +25,7 @@ Index: libtool-2.4/libltdl/config/ltmain.m4sh
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -z "$hardc=
ode_libdirs"; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hardcode_li=
bdirs=3D"$libdir"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> -@@ -7981,6 +7983,10 @@
> +@@ -7999,6 +8001,10 @@ EOF
> =C2=A0 =C2=A0 =C2=A0 =C2=A0hardcode_libdirs=3D
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for libdir in $compile_rpath $finalize_rpath; =
do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -n "$hardcode_libdir_flag_spec"; then
> diff --git a/meta/recipes-devtools/libtool/libtool/fix-rpath.patch b/meta=
/recipes-devtools/libtool/libtool/fix-rpath.patch
> index 3cdeaec..d35bac0 100644
> --- a/meta/recipes-devtools/libtool/libtool/fix-rpath.patch
> +++ b/meta/recipes-devtools/libtool/libtool/fix-rpath.patch
> @@ -6,11 +6,11 @@ RP 23/9/2011
>
> =C2=A0Upstream-status: Pending
>
> -Index: libtool-2.4/libltdl/config/ltmain.m4sh
> +Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/libltdl/config/ltmain.m4sh =C2=A0 =C2=A0 =C2=A0 =C2=
=A02011-09-23 08:38:06.365043626 +0100
> -+++ libtool-2.4/libltdl/config/ltmain.m4sh =C2=A0 =C2=A0 2011-09-23 09:5=
7:05.235003068 +0100
> -@@ -7264,8 +7264,14 @@
> +--- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh
> ++++ libtool-2.4.2/libltdl/config/ltmain.m4sh
> +@@ -7286,8 +7286,14 @@ EOF
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> @@ -27,7 +27,7 @@ Index: libtool-2.4/libltdl/config/ltmain.m4sh
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif test -n "$runpath_var"; the=
n
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case "$perm_rpath " in
> -@@ -8001,8 +8007,14 @@
> +@@ -8019,8 +8025,14 @@ EOF
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> @@ -44,7 +44,7 @@ Index: libtool-2.4/libltdl/config/ltmain.m4sh
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0elif test -n "$runpath_var"; then
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case "$perm_rpath " in
> -@@ -8052,8 +8064,14 @@
> +@@ -8070,8 +8082,14 @@ EOF
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0esac
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> diff --git a/meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.pat=
ch b/meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.patch
> index f9de383..879778c 100644
> --- a/meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.patch
> +++ b/meta/recipes-devtools/libtool/libtool/prefix-manpage-fix.patch
> @@ -6,12 +6,12 @@ nstead use the build version of libtool to generate the=
 man pages.
> =C2=A0Date: 2010/07/09
> =C2=A0Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> -Index: libtool-2.2.10/Makefile.am
> +Index: libtool-2.4.2/Makefile.am
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.2.10.orig/Makefile.am
> -+++ libtool-2.2.10/Makefile.am
> -@@ -337,7 +337,7 @@ update_mans =3D \
> - =C2=A0 PATH=3D.$(PATH_SEPARATOR)$$PATH; export PATH; \
> +--- libtool-2.4.2.orig/Makefile.am
> ++++ libtool-2.4.2/Makefile.am
> +@@ -333,7 +333,7 @@ update_mans =3D \
> + =C2=A0 PATH=3D".$(PATH_SEPARATOR)$$PATH"; export PATH; \
> =C2=A0 =C2=A0$(HELP2MAN) --output=3D$@
> =C2=A0$(srcdir)/doc/libtool.1: $(srcdir)/$(auxdir)/ltmain.sh
> =C2=A0- =C2=A0 =C2=A0 =C2=A0$(update_mans) --help-option=3D--help-all lib=
tool
> diff --git a/meta/recipes-devtools/libtool/libtool/prefix.patch b/meta/re=
cipes-devtools/libtool/libtool/prefix.patch
> index e6eca1f..5e46e68 100644
> --- a/meta/recipes-devtools/libtool/libtool/prefix.patch
> +++ b/meta/recipes-devtools/libtool/libtool/prefix.patch
> @@ -18,10 +18,10 @@ the simplest fix is just to remove $SHELL.
> =C2=A0Updated: Date: 2011/11/09
> =C2=A0RP
>
> -Index: libtool-2.4/libltdl/m4/libtool.m4
> +Index: libtool-2.4.2/libltdl/m4/libtool.m4
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/libltdl/m4/libtool.m4
> -+++ libtool-2.4/libltdl/m4/libtool.m4
> +--- libtool-2.4.2.orig/libltdl/m4/libtool.m4
> ++++ libtool-2.4.2/libltdl/m4/libtool.m4
> =C2=A0@@ -94,7 +94,8 @@ _LT_SET_OPTIONS([$0], [$1])
> =C2=A0LIBTOOL_DEPS=3D"$ltmain"
>
> @@ -32,7 +32,7 @@ Index: libtool-2.4/libltdl/m4/libtool.m4
> =C2=A0AC_SUBST(LIBTOOL)dnl
>
> =C2=A0_LT_SETUP
> -@@ -204,7 +205,7 @@ aix3*)
> +@@ -206,7 +207,7 @@ aix3*)
> =C2=A0esac
>
> =C2=A0# Global variables:
> @@ -41,10 +41,10 @@ Index: libtool-2.4/libltdl/m4/libtool.m4
> =C2=A0can_build_shared=3Dyes
>
> =C2=A0# All known linkers require a `.a' archive for static linking (exce=
pt MSVC,
> -Index: libtool-2.4/Makefile.am
> +Index: libtool-2.4.2/Makefile.am
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/Makefile.am
> -+++ libtool-2.4/Makefile.am
> +--- libtool-2.4.2.orig/Makefile.am
> ++++ libtool-2.4.2/Makefile.am
> =C2=A0@@ -31,7 +31,7 @@ AM_LDFLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D
> =C2=A0DIST_SUBDIRS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D .
> =C2=A0EXTRA_DIST =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D
> @@ -54,8 +54,17 @@ Index: libtool-2.4/Makefile.am
>
> =C2=A0CLEANFILES =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D
> =C2=A0MOSTLYCLEANFILES =C2=A0 =C2=A0 =C2=A0=3D
> -@@ -65,7 +65,7 @@ rebuild =3D rebuild=3D:; $(timestamp); corre
> - ## ---------------- ##
> +@@ -72,7 +72,7 @@ EXTRA_DIST =C2=A0 =C2=A0 +=3D bootstrap $(srcdir)/li
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ChangeLog.2002 =
ChangeLog.2003 ChangeLog.2004 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ChangeLog.2005 =
ChangeLog.2006 ChangeLog.2007 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ChangeLog.2008 =
ChangeLog.2009 ChangeLog.2010
> +-CLEANFILES =C2=A0 =C2=A0 +=3D libtool libtoolize libtoolize.tmp \
> ++CLEANFILES =C2=A0 =C2=A0 +=3D $(host_alias)-libtool libtoolize libtooli=
ze.tmp \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(auxdir)/ltmai=
n.tmp $(m4dir)/ltversion.tmp
> +
> + ## These are the replacements that need to be made at bootstrap time,
> +@@ -231,7 +231,7 @@ configure_edit =3D sed \
> + =C2=A0 =C2=A0 =C2=A0 -e 's,@SED\@,$(SED),g'
>
> =C2=A0# The libtool distributor and the standalone libtool script.
> =C2=A0-bin_SCRIPTS =3D libtoolize libtool
> @@ -63,7 +72,7 @@ Index: libtool-2.4/Makefile.am
>
> =C2=A0libtoolize: $(srcdir)/libtoolize.in $(top_builddir)/config.status
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f libtoolize.tmp libtoolize
> -@@ -90,8 +90,8 @@ $(srcdir)/libtoolize.in: $(sh_files) lib
> +@@ -244,8 +244,8 @@ libtoolize: $(srcdir)/libtoolize.in $(to
> =C2=A0# We used to do this with a 'stamp-vcl' file, but non-gmake builds
> =C2=A0# would rerun configure on every invocation, so now we manually
> =C2=A0# check the version numbers from the build rule when necessary.
> @@ -74,7 +83,7 @@ Index: libtool-2.4/Makefile.am
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -f "$$target"; then \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set dummy `./$$target --version | sed 1=
q`; actualver=3D"$$5"; \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test "$$actualver" =3D "$$correctver" &=
& rebuild=3Dfalse; \
> -@@ -100,8 +100,8 @@ libtool: $(top_builddir)/config.status $
> +@@ -254,8 +254,8 @@ libtool: $(top_builddir)/config.status $
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case $$prereq in *ChangeLog);; *) rebui=
ld=3D:;; esac; \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0done; \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if $$rebuild; then \
> @@ -85,16 +94,7 @@ Index: libtool-2.4/Makefile.am
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>
> =C2=A0.PHONY: configure-subdirs
> -@@ -146,7 +146,7 @@ EXTRA_DIST =C2=A0 =C2=A0 +=3D bootstrap $(srcdir)/li
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ChangeLog.2002 =
ChangeLog.2003 ChangeLog.2004 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ChangeLog.2005 =
ChangeLog.2006 ChangeLog.2007 \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ChangeLog.2008 =
ChangeLog.2009
> --CLEANFILES =C2=A0 =C2=A0 +=3D libtool libtoolize libtoolize.tmp \
> -+CLEANFILES =C2=A0 =C2=A0 +=3D $(host_alias)-libtool libtoolize libtooli=
ze.tmp \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(auxdir)/ltmai=
n.tmp $(m4dir)/ltversion.tmp
> -
> - ## We build ltversion.m4 here, instead of from config.status,
> -@@ -526,12 +526,12 @@ TESTS_ENVIRONMENT =3D MAKE=3D"$(MAKE)" CC=3D"$
> +@@ -535,12 +535,12 @@ TESTS_ENVIRONMENT =3D MAKE=3D"$(MAKE)" CC=3D"$
>
> =C2=A0BUILDCHECK_ENVIRONMENT =3D _lt_pkgdatadir=3D"$(abs_top_srcdir)" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0LIBTOOLIZE=3D"$(abs_top_builddir)/libtoolize" =
\
> diff --git a/meta/recipes-devtools/libtool/libtool/rename-with-sysroot.pa=
tch b/meta/recipes-devtools/libtool/libtool/rename-with-sysroot.patch
> index 9c8696b..438c639 100644
> --- a/meta/recipes-devtools/libtool/libtool/rename-with-sysroot.patch
> +++ b/meta/recipes-devtools/libtool/libtool/rename-with-sysroot.patch
> @@ -10,21 +10,21 @@ http://lists.gnu.org/archive/html/libtool/2010-10/msg=
00048.html
>
> =C2=A0-Khem Raj <raj.khem@gmail.com>
>
> -Index: libtool-2.4/configure
> +Index: libtool-2.4.2/configure
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/configure
> -+++ libtool-2.4/configure
> -@@ -786,7 +786,7 @@ enable_static
> +--- libtool-2.4.2.orig/configure
> ++++ libtool-2.4.2/configure
> +@@ -795,7 +795,7 @@ enable_static
> =C2=A0with_pic
> =C2=A0enable_fast_install
> =C2=A0with_gnu_ld
> =C2=A0-with_sysroot
> =C2=A0+with_libtool_sysroot
> =C2=A0enable_libtool_lock
> - with_gnu_ld
> =C2=A0'
> + =C2=A0 =C2=A0 =C2=A0 ac_precious_vars=3D'build_alias
> =C2=A0@@ -1451,7 +1451,7 @@ Optional Packages:
> - =C2=A0 --with-pic =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try t=
o use only PIC/non-PIC objects [default=3Duse
> + =C2=A0 --with-pic[=3DPKGS] =C2=A0 =C2=A0 =C2=A0 try to use only PIC/non=
-PIC objects [default=3Duse
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0both]
> =C2=A0 =C2=A0--with-gnu-ld =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assume the =
C compiler uses GNU ld [default=3Dno]
> =C2=A0- =C2=A0--with-sysroot=3DDIR Search for dependent libraries within =
DIR
> @@ -32,7 +32,7 @@ Index: libtool-2.4/configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(or the compiler's sysroot if not specified).
>
> =C2=A0Some influential environment variables:
> -@@ -6798,29 +6798,29 @@ fi
> +@@ -6804,29 +6804,29 @@ fi
> =C2=A0{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> =C2=A0$as_echo_n "checking for sysroot... " >&6; }
>
> @@ -70,11 +70,11 @@ Index: libtool-2.4/configure
> =C2=A0 =C2=A0 as_fn_error $? "The sysroot must be an absolute path." "$LI=
NENO" 5
> =C2=A0 =C2=A0 ;;
> =C2=A0esac
> -Index: libtool-2.4/libltdl/configure
> +Index: libtool-2.4.2/libltdl/configure
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/libltdl/configure
> -+++ libtool-2.4/libltdl/configure
> -@@ -739,7 +739,7 @@ with_pic
> +--- libtool-2.4.2.orig/libltdl/configure
> ++++ libtool-2.4.2/libltdl/configure
> +@@ -747,7 +747,7 @@ with_pic
> =C2=A0enable_fast_install
> =C2=A0enable_dependency_tracking
> =C2=A0with_gnu_ld
> @@ -83,8 +83,8 @@ Index: libtool-2.4/libltdl/configure
> =C2=A0enable_libtool_lock
> =C2=A0enable_ltdl_install
> =C2=A0'
> -@@ -1388,7 +1388,7 @@ Optional Packages:
> - =C2=A0 --with-pic =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try t=
o use only PIC/non-PIC objects [default=3Duse
> +@@ -1395,7 +1395,7 @@ Optional Packages:
> + =C2=A0 --with-pic[=3DPKGS] =C2=A0 =C2=A0 =C2=A0 try to use only PIC/non=
-PIC objects [default=3Duse
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0both]
> =C2=A0 =C2=A0--with-gnu-ld =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assume the =
C compiler uses GNU ld [default=3Dno]
> =C2=A0- =C2=A0--with-sysroot=3DDIR Search for dependent libraries within =
DIR
> @@ -92,7 +92,7 @@ Index: libtool-2.4/libltdl/configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(or the compiler's sysroot if not specified).
>
> =C2=A0Some influential environment variables:
> -@@ -6004,29 +6004,29 @@ fi
> +@@ -6017,29 +6017,29 @@ fi
> =C2=A0{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> =C2=A0$as_echo_n "checking for sysroot... " >&6; }
>
> @@ -130,11 +130,11 @@ Index: libtool-2.4/libltdl/configure
> =C2=A0 =C2=A0 as_fn_error $? "The sysroot must be an absolute path." "$LI=
NENO" 5
> =C2=A0 =C2=A0 ;;
> =C2=A0esac
> -Index: libtool-2.4/libltdl/m4/libtool.m4
> +Index: libtool-2.4.2/libltdl/m4/libtool.m4
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/libltdl/m4/libtool.m4
> -+++ libtool-2.4/libltdl/m4/libtool.m4
> -@@ -1180,27 +1180,27 @@ _LT_DECL([], [ECHO], [1], [An echo progr
> +--- libtool-2.4.2.orig/libltdl/m4/libtool.m4
> ++++ libtool-2.4.2/libltdl/m4/libtool.m4
> +@@ -1224,27 +1224,27 @@ _LT_DECL([], [ECHO], [1], [An echo progr
> =C2=A0# ----------------
> =C2=A0AC_DEFUN([_LT_WITH_SYSROOT],
> =C2=A0[AC_MSG_CHECKING([for sysroot])
> @@ -168,11 +168,11 @@ Index: libtool-2.4/libltdl/m4/libtool.m4
> =C2=A0 =C2=A0 AC_MSG_ERROR([The sysroot must be an absolute path.])
> =C2=A0 =C2=A0 ;;
> =C2=A0esac
> -Index: libtool-2.4/tests/cdemo/configure
> +Index: libtool-2.4.2/tests/cdemo/configure
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/tests/cdemo/configure
> -+++ libtool-2.4/tests/cdemo/configure
> -@@ -726,7 +726,7 @@ enable_static
> +--- libtool-2.4.2.orig/tests/cdemo/configure
> ++++ libtool-2.4.2/tests/cdemo/configure
> +@@ -734,7 +734,7 @@ enable_static
> =C2=A0with_pic
> =C2=A0enable_fast_install
> =C2=A0with_gnu_ld
> @@ -181,8 +181,8 @@ Index: libtool-2.4/tests/cdemo/configure
> =C2=A0enable_libtool_lock
> =C2=A0'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_precious_vars=3D'build_alias
> -@@ -1373,7 +1373,7 @@ Optional Packages:
> - =C2=A0 --with-pic =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try t=
o use only PIC/non-PIC objects [default=3Duse
> +@@ -1380,7 +1380,7 @@ Optional Packages:
> + =C2=A0 --with-pic[=3DPKGS] =C2=A0 =C2=A0 =C2=A0 try to use only PIC/non=
-PIC objects [default=3Duse
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0both]
> =C2=A0 =C2=A0--with-gnu-ld =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assume the =
C compiler uses GNU ld [default=3Dno]
> =C2=A0- =C2=A0--with-sysroot=3DDIR Search for dependent libraries within =
DIR
> @@ -190,7 +190,7 @@ Index: libtool-2.4/tests/cdemo/configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(or the compiler's sysroot if not specified).
>
> =C2=A0Some influential environment variables:
> -@@ -5884,29 +5884,29 @@ fi
> +@@ -5897,29 +5897,29 @@ fi
> =C2=A0{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> =C2=A0$as_echo_n "checking for sysroot... " >&6; }
>
> @@ -228,11 +228,11 @@ Index: libtool-2.4/tests/cdemo/configure
> =C2=A0 =C2=A0 as_fn_error $? "The sysroot must be an absolute path." "$LI=
NENO" 5
> =C2=A0 =C2=A0 ;;
> =C2=A0esac
> -Index: libtool-2.4/tests/demo/configure
> +Index: libtool-2.4.2/tests/demo/configure
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/tests/demo/configure
> -+++ libtool-2.4/tests/demo/configure
> -@@ -730,7 +730,7 @@ enable_static
> +--- libtool-2.4.2.orig/tests/demo/configure
> ++++ libtool-2.4.2/tests/demo/configure
> +@@ -738,7 +738,7 @@ enable_static
> =C2=A0with_pic
> =C2=A0enable_fast_install
> =C2=A0with_gnu_ld
> @@ -241,8 +241,8 @@ Index: libtool-2.4/tests/demo/configure
> =C2=A0enable_libtool_lock
> =C2=A0'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_precious_vars=3D'build_alias
> -@@ -1377,7 +1377,7 @@ Optional Packages:
> - =C2=A0 --with-pic =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try t=
o use only PIC/non-PIC objects [default=3Duse
> +@@ -1384,7 +1384,7 @@ Optional Packages:
> + =C2=A0 --with-pic[=3DPKGS] =C2=A0 =C2=A0 =C2=A0 try to use only PIC/non=
-PIC objects [default=3Duse
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0both]
> =C2=A0 =C2=A0--with-gnu-ld =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assume the =
C compiler uses GNU ld [default=3Dno]
> =C2=A0- =C2=A0--with-sysroot=3DDIR Search for dependent libraries within =
DIR
> @@ -250,7 +250,7 @@ Index: libtool-2.4/tests/demo/configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(or the compiler's sysroot if not specified).
>
> =C2=A0Some influential environment variables:
> -@@ -5882,29 +5882,29 @@ fi
> +@@ -5895,29 +5895,29 @@ fi
> =C2=A0{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> =C2=A0$as_echo_n "checking for sysroot... " >&6; }
>
> @@ -288,11 +288,11 @@ Index: libtool-2.4/tests/demo/configure
> =C2=A0 =C2=A0 as_fn_error $? "The sysroot must be an absolute path." "$LI=
NENO" 5
> =C2=A0 =C2=A0 ;;
> =C2=A0esac
> -Index: libtool-2.4/tests/depdemo/configure
> +Index: libtool-2.4.2/tests/depdemo/configure
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/tests/depdemo/configure
> -+++ libtool-2.4/tests/depdemo/configure
> -@@ -728,7 +728,7 @@ enable_static
> +--- libtool-2.4.2.orig/tests/depdemo/configure
> ++++ libtool-2.4.2/tests/depdemo/configure
> +@@ -736,7 +736,7 @@ enable_static
> =C2=A0with_pic
> =C2=A0enable_fast_install
> =C2=A0with_gnu_ld
> @@ -301,8 +301,8 @@ Index: libtool-2.4/tests/depdemo/configure
> =C2=A0enable_libtool_lock
> =C2=A0'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_precious_vars=3D'build_alias
> -@@ -1375,7 +1375,7 @@ Optional Packages:
> - =C2=A0 --with-pic =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try t=
o use only PIC/non-PIC objects [default=3Duse
> +@@ -1382,7 +1382,7 @@ Optional Packages:
> + =C2=A0 --with-pic[=3DPKGS] =C2=A0 =C2=A0 =C2=A0 try to use only PIC/non=
-PIC objects [default=3Duse
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0both]
> =C2=A0 =C2=A0--with-gnu-ld =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assume the =
C compiler uses GNU ld [default=3Dno]
> =C2=A0- =C2=A0--with-sysroot=3DDIR Search for dependent libraries within =
DIR
> @@ -310,7 +310,7 @@ Index: libtool-2.4/tests/depdemo/configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(or the compiler's sysroot if not specified).
>
> =C2=A0Some influential environment variables:
> -@@ -5879,29 +5879,29 @@ fi
> +@@ -5892,29 +5892,29 @@ fi
> =C2=A0{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> =C2=A0$as_echo_n "checking for sysroot... " >&6; }
>
> @@ -348,11 +348,11 @@ Index: libtool-2.4/tests/depdemo/configure
> =C2=A0 =C2=A0 as_fn_error $? "The sysroot must be an absolute path." "$LI=
NENO" 5
> =C2=A0 =C2=A0 ;;
> =C2=A0esac
> -Index: libtool-2.4/tests/f77demo/configure
> +Index: libtool-2.4.2/tests/f77demo/configure
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/tests/f77demo/configure
> -+++ libtool-2.4/tests/f77demo/configure
> -@@ -730,7 +730,7 @@ enable_static
> +--- libtool-2.4.2.orig/tests/f77demo/configure
> ++++ libtool-2.4.2/tests/f77demo/configure
> +@@ -738,7 +738,7 @@ enable_static
> =C2=A0with_pic
> =C2=A0enable_fast_install
> =C2=A0with_gnu_ld
> @@ -361,8 +361,8 @@ Index: libtool-2.4/tests/f77demo/configure
> =C2=A0enable_libtool_lock
> =C2=A0'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_precious_vars=3D'build_alias
> -@@ -1382,7 +1382,7 @@ Optional Packages:
> - =C2=A0 --with-pic =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try t=
o use only PIC/non-PIC objects [default=3Duse
> +@@ -1387,7 +1387,7 @@ Optional Packages:
> + =C2=A0 --with-pic[=3DPKGS] =C2=A0 =C2=A0 =C2=A0 try to use only PIC/non=
-PIC objects [default=3Duse
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0both]
> =C2=A0 =C2=A0--with-gnu-ld =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assume the =
C compiler uses GNU ld [default=3Dno]
> =C2=A0- =C2=A0--with-sysroot=3DDIR Search for dependent libraries within =
DIR
> @@ -370,7 +370,7 @@ Index: libtool-2.4/tests/f77demo/configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(or the compiler's sysroot if not specified).
>
> =C2=A0Some influential environment variables:
> -@@ -6864,29 +6864,29 @@ fi
> +@@ -6877,29 +6877,29 @@ fi
> =C2=A0{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> =C2=A0$as_echo_n "checking for sysroot... " >&6; }
>
> @@ -408,11 +408,11 @@ Index: libtool-2.4/tests/f77demo/configure
> =C2=A0 =C2=A0 as_fn_error $? "The sysroot must be an absolute path." "$LI=
NENO" 5
> =C2=A0 =C2=A0 ;;
> =C2=A0esac
> -Index: libtool-2.4/tests/fcdemo/configure
> +Index: libtool-2.4.2/tests/fcdemo/configure
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/tests/fcdemo/configure
> -+++ libtool-2.4/tests/fcdemo/configure
> -@@ -731,7 +731,7 @@ enable_static
> +--- libtool-2.4.2.orig/tests/fcdemo/configure
> ++++ libtool-2.4.2/tests/fcdemo/configure
> +@@ -739,7 +739,7 @@ enable_static
> =C2=A0with_pic
> =C2=A0enable_fast_install
> =C2=A0with_gnu_ld
> @@ -421,8 +421,8 @@ Index: libtool-2.4/tests/fcdemo/configure
> =C2=A0enable_libtool_lock
> =C2=A0'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_precious_vars=3D'build_alias
> -@@ -1383,7 +1383,7 @@ Optional Packages:
> - =C2=A0 --with-pic =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try t=
o use only PIC/non-PIC objects [default=3Duse
> +@@ -1388,7 +1388,7 @@ Optional Packages:
> + =C2=A0 --with-pic[=3DPKGS] =C2=A0 =C2=A0 =C2=A0 try to use only PIC/non=
-PIC objects [default=3Duse
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0both]
> =C2=A0 =C2=A0--with-gnu-ld =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assume the =
C compiler uses GNU ld [default=3Dno]
> =C2=A0- =C2=A0--with-sysroot=3DDIR Search for dependent libraries within =
DIR
> @@ -430,7 +430,7 @@ Index: libtool-2.4/tests/fcdemo/configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(or the compiler's sysroot if not specified).
>
> =C2=A0Some influential environment variables:
> -@@ -6963,29 +6963,29 @@ fi
> +@@ -6976,29 +6976,29 @@ fi
> =C2=A0{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> =C2=A0$as_echo_n "checking for sysroot... " >&6; }
>
> @@ -468,11 +468,11 @@ Index: libtool-2.4/tests/fcdemo/configure
> =C2=A0 =C2=A0 as_fn_error $? "The sysroot must be an absolute path." "$LI=
NENO" 5
> =C2=A0 =C2=A0 ;;
> =C2=A0esac
> -Index: libtool-2.4/tests/mdemo/configure
> +Index: libtool-2.4.2/tests/mdemo/configure
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/tests/mdemo/configure
> -+++ libtool-2.4/tests/mdemo/configure
> -@@ -734,7 +734,7 @@ enable_static
> +--- libtool-2.4.2.orig/tests/mdemo/configure
> ++++ libtool-2.4.2/tests/mdemo/configure
> +@@ -742,7 +742,7 @@ enable_static
> =C2=A0with_pic
> =C2=A0enable_fast_install
> =C2=A0with_gnu_ld
> @@ -481,8 +481,8 @@ Index: libtool-2.4/tests/mdemo/configure
> =C2=A0enable_libtool_lock
> =C2=A0'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_precious_vars=3D'build_alias
> -@@ -1381,7 +1381,7 @@ Optional Packages:
> - =C2=A0 --with-pic =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try t=
o use only PIC/non-PIC objects [default=3Duse
> +@@ -1388,7 +1388,7 @@ Optional Packages:
> + =C2=A0 --with-pic[=3DPKGS] =C2=A0 =C2=A0 =C2=A0 try to use only PIC/non=
-PIC objects [default=3Duse
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0both]
> =C2=A0 =C2=A0--with-gnu-ld =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assume the =
C compiler uses GNU ld [default=3Dno]
> =C2=A0- =C2=A0--with-sysroot=3DDIR Search for dependent libraries within =
DIR
> @@ -490,7 +490,7 @@ Index: libtool-2.4/tests/mdemo/configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(or the compiler's sysroot if not specified).
>
> =C2=A0Some influential environment variables:
> -@@ -5911,29 +5911,29 @@ fi
> +@@ -5924,29 +5924,29 @@ fi
> =C2=A0{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> =C2=A0$as_echo_n "checking for sysroot... " >&6; }
>
> @@ -528,11 +528,11 @@ Index: libtool-2.4/tests/mdemo/configure
> =C2=A0 =C2=A0 as_fn_error $? "The sysroot must be an absolute path." "$LI=
NENO" 5
> =C2=A0 =C2=A0 ;;
> =C2=A0esac
> -Index: libtool-2.4/tests/mdemo2/configure
> +Index: libtool-2.4.2/tests/mdemo2/configure
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/tests/mdemo2/configure
> -+++ libtool-2.4/tests/mdemo2/configure
> -@@ -726,7 +726,7 @@ enable_static
> +--- libtool-2.4.2.orig/tests/mdemo2/configure
> ++++ libtool-2.4.2/tests/mdemo2/configure
> +@@ -734,7 +734,7 @@ enable_static
> =C2=A0with_pic
> =C2=A0enable_fast_install
> =C2=A0with_gnu_ld
> @@ -541,8 +541,8 @@ Index: libtool-2.4/tests/mdemo2/configure
> =C2=A0enable_libtool_lock
> =C2=A0'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_precious_vars=3D'build_alias
> -@@ -1373,7 +1373,7 @@ Optional Packages:
> - =C2=A0 --with-pic =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try t=
o use only PIC/non-PIC objects [default=3Duse
> +@@ -1380,7 +1380,7 @@ Optional Packages:
> + =C2=A0 --with-pic[=3DPKGS] =C2=A0 =C2=A0 =C2=A0 try to use only PIC/non=
-PIC objects [default=3Duse
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0both]
> =C2=A0 =C2=A0--with-gnu-ld =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assume the =
C compiler uses GNU ld [default=3Dno]
> =C2=A0- =C2=A0--with-sysroot=3DDIR Search for dependent libraries within =
DIR
> @@ -550,7 +550,7 @@ Index: libtool-2.4/tests/mdemo2/configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(or the compiler's sysroot if not specified).
>
> =C2=A0Some influential environment variables:
> -@@ -5884,29 +5884,29 @@ fi
> +@@ -5897,29 +5897,29 @@ fi
> =C2=A0{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> =C2=A0$as_echo_n "checking for sysroot... " >&6; }
>
> @@ -588,11 +588,11 @@ Index: libtool-2.4/tests/mdemo2/configure
> =C2=A0 =C2=A0 as_fn_error $? "The sysroot must be an absolute path." "$LI=
NENO" 5
> =C2=A0 =C2=A0 ;;
> =C2=A0esac
> -Index: libtool-2.4/tests/pdemo/configure
> +Index: libtool-2.4.2/tests/pdemo/configure
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/tests/pdemo/configure
> -+++ libtool-2.4/tests/pdemo/configure
> -@@ -729,7 +729,7 @@ enable_static
> +--- libtool-2.4.2.orig/tests/pdemo/configure
> ++++ libtool-2.4.2/tests/pdemo/configure
> +@@ -737,7 +737,7 @@ enable_static
> =C2=A0with_pic
> =C2=A0enable_fast_install
> =C2=A0with_gnu_ld
> @@ -601,8 +601,8 @@ Index: libtool-2.4/tests/pdemo/configure
> =C2=A0enable_libtool_lock
> =C2=A0'
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_precious_vars=3D'build_alias
> -@@ -1376,7 +1376,7 @@ Optional Packages:
> - =C2=A0 --with-pic =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try t=
o use only PIC/non-PIC objects [default=3Duse
> +@@ -1383,7 +1383,7 @@ Optional Packages:
> + =C2=A0 --with-pic[=3DPKGS] =C2=A0 =C2=A0 =C2=A0 try to use only PIC/non=
-PIC objects [default=3Duse
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0both]
> =C2=A0 =C2=A0--with-gnu-ld =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assume the =
C compiler uses GNU ld [default=3Dno]
> =C2=A0- =C2=A0--with-sysroot=3DDIR Search for dependent libraries within =
DIR
> @@ -610,7 +610,7 @@ Index: libtool-2.4/tests/pdemo/configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(or the compiler's sysroot if not specified).
>
> =C2=A0Some influential environment variables:
> -@@ -5887,29 +5887,29 @@ fi
> +@@ -5900,29 +5900,29 @@ fi
> =C2=A0{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> =C2=A0$as_echo_n "checking for sysroot... " >&6; }
>
> @@ -648,10 +648,10 @@ Index: libtool-2.4/tests/pdemo/configure
> =C2=A0 =C2=A0 as_fn_error $? "The sysroot must be an absolute path." "$LI=
NENO" 5
> =C2=A0 =C2=A0 ;;
> =C2=A0esac
> -Index: libtool-2.4/tests/sysroot.at
> +Index: libtool-2.4.2/tests/sysroot.at
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/tests/sysroot.at
> -+++ libtool-2.4/tests/sysroot.at
> +--- libtool-2.4.2.orig/tests/sysroot.at
> ++++ libtool-2.4.2/tests/sysroot.at
> =C2=A0@@ -64,7 +64,7 @@ while read file; do
> =C2=A0done])
>
> @@ -679,21 +679,21 @@ Index: libtool-2.4/tests/sysroot.at
> =C2=A0AC_SUBST([sysroot])
> =C2=A0AC_OUTPUT(Makefile)
> =C2=A0]])
> -Index: libtool-2.4/tests/tagdemo/configure
> +Index: libtool-2.4.2/tests/tagdemo/configure
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/tests/tagdemo/configure
> -+++ libtool-2.4/tests/tagdemo/configure
> -@@ -736,7 +736,7 @@ enable_static
> +--- libtool-2.4.2.orig/tests/tagdemo/configure
> ++++ libtool-2.4.2/tests/tagdemo/configure
> +@@ -744,7 +744,7 @@ enable_static
> =C2=A0with_pic
> =C2=A0enable_fast_install
> =C2=A0with_gnu_ld
> =C2=A0-with_sysroot
> =C2=A0+with_libtool_sysroot
> =C2=A0enable_libtool_lock
> - with_gnu_ld
> =C2=A0'
> -@@ -1392,7 +1392,7 @@ Optional Packages:
> - =C2=A0 --with-pic =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try t=
o use only PIC/non-PIC objects [default=3Duse
> + =C2=A0 =C2=A0 =C2=A0 ac_precious_vars=3D'build_alias
> +@@ -1395,7 +1395,7 @@ Optional Packages:
> + =C2=A0 --with-pic[=3DPKGS] =C2=A0 =C2=A0 =C2=A0 try to use only PIC/non=
-PIC objects [default=3Duse
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0both]
> =C2=A0 =C2=A0--with-gnu-ld =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assume the =
C compiler uses GNU ld [default=3Dno]
> =C2=A0- =C2=A0--with-sysroot=3DDIR Search for dependent libraries within =
DIR
> @@ -701,7 +701,7 @@ Index: libtool-2.4/tests/tagdemo/configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(or the compiler's sysroot if not specified).
>
> =C2=A0Some influential environment variables:
> -@@ -6907,29 +6907,29 @@ fi
> +@@ -6916,29 +6916,29 @@ fi
> =C2=A0{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for sysroot" >&5
> =C2=A0$as_echo_n "checking for sysroot... " >&6; }
>
> @@ -739,11 +739,11 @@ Index: libtool-2.4/tests/tagdemo/configure
> =C2=A0 =C2=A0 as_fn_error $? "The sysroot must be an absolute path." "$LI=
NENO" 5
> =C2=A0 =C2=A0 ;;
> =C2=A0esac
> -Index: libtool-2.4/tests/testsuite
> +Index: libtool-2.4.2/tests/testsuite
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/tests/testsuite
> -+++ libtool-2.4/tests/testsuite
> -@@ -25277,7 +25277,7 @@ $at_traceon; }
> +--- libtool-2.4.2.orig/tests/testsuite
> ++++ libtool-2.4.2/tests/testsuite
> +@@ -26676,7 +26676,7 @@ $at_traceon; }
>
>
> =C2=A0LDFLAGS=3D"$LDFLAGS --sysroot=3D$sysroot -no-undefined"
> @@ -752,7 +752,7 @@ Index: libtool-2.4/tests/testsuite
>
> =C2=A0#???
> =C2=A0if test "$shlibpath_var" =3D PATH; then
> -@@ -25475,7 +25475,7 @@ AM_INIT_AUTOMAKE([foreign])
> +@@ -26874,7 +26874,7 @@ AM_INIT_AUTOMAKE([foreign])
> =C2=A0AC_PROG_CC
> =C2=A0AC_CONFIG_SRCDIR([lib2.c])
> =C2=A0LT_INIT
> @@ -761,7 +761,7 @@ Index: libtool-2.4/tests/testsuite
> =C2=A0AC_SUBST([sysroot])
> =C2=A0AC_OUTPUT(Makefile)
> =C2=A0_ATEOF
> -@@ -25652,7 +25652,7 @@ AM_INIT_AUTOMAKE([foreign])
> +@@ -27051,7 +27051,7 @@ AM_INIT_AUTOMAKE([foreign])
> =C2=A0AC_PROG_CC
> =C2=A0AC_CONFIG_SRCDIR([prog.c])
> =C2=A0LT_INIT
> @@ -770,7 +770,7 @@ Index: libtool-2.4/tests/testsuite
> =C2=A0AC_SUBST([sysroot])
> =C2=A0AC_OUTPUT(Makefile)
> =C2=A0_ATEOF
> -@@ -25993,7 +25993,7 @@ $at_traceon; }
> +@@ -27392,7 +27392,7 @@ $at_traceon; }
>
>
> =C2=A0LDFLAGS=3D"$LDFLAGS --sysroot=3D$sysroot -no-undefined"
> @@ -779,7 +779,7 @@ Index: libtool-2.4/tests/testsuite
>
> =C2=A0#???
> =C2=A0if test "$shlibpath_var" =3D PATH; then
> -@@ -26191,7 +26191,7 @@ AM_INIT_AUTOMAKE([foreign])
> +@@ -27590,7 +27590,7 @@ AM_INIT_AUTOMAKE([foreign])
> =C2=A0AC_PROG_CC
> =C2=A0AC_CONFIG_SRCDIR([lib2.c])
> =C2=A0LT_INIT
> @@ -788,7 +788,7 @@ Index: libtool-2.4/tests/testsuite
> =C2=A0AC_SUBST([sysroot])
> =C2=A0AC_OUTPUT(Makefile)
> =C2=A0_ATEOF
> -@@ -26368,7 +26368,7 @@ AM_INIT_AUTOMAKE([foreign])
> +@@ -27767,7 +27767,7 @@ AM_INIT_AUTOMAKE([foreign])
> =C2=A0AC_PROG_CC
> =C2=A0AC_CONFIG_SRCDIR([prog.c])
> =C2=A0LT_INIT
> @@ -797,7 +797,7 @@ Index: libtool-2.4/tests/testsuite
> =C2=A0AC_SUBST([sysroot])
> =C2=A0AC_OUTPUT(Makefile)
> =C2=A0_ATEOF
> -@@ -26709,7 +26709,7 @@ $at_traceon; }
> +@@ -28108,7 +28108,7 @@ $at_traceon; }
>
>
> =C2=A0LDFLAGS=3D"$LDFLAGS --sysroot=3D$sysroot -no-undefined"
> @@ -806,7 +806,7 @@ Index: libtool-2.4/tests/testsuite
>
> =C2=A0#???
> =C2=A0if test "$shlibpath_var" =3D PATH; then
> -@@ -26907,7 +26907,7 @@ AM_INIT_AUTOMAKE([foreign])
> +@@ -28306,7 +28306,7 @@ AM_INIT_AUTOMAKE([foreign])
> =C2=A0AC_PROG_CC
> =C2=A0AC_CONFIG_SRCDIR([lib2.c])
> =C2=A0LT_INIT
> @@ -815,7 +815,7 @@ Index: libtool-2.4/tests/testsuite
> =C2=A0AC_SUBST([sysroot])
> =C2=A0AC_OUTPUT(Makefile)
> =C2=A0_ATEOF
> -@@ -27084,7 +27084,7 @@ AM_INIT_AUTOMAKE([foreign])
> +@@ -28483,7 +28483,7 @@ AM_INIT_AUTOMAKE([foreign])
> =C2=A0AC_PROG_CC
> =C2=A0AC_CONFIG_SRCDIR([prog.c])
> =C2=A0LT_INIT
> diff --git a/meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch =
b/meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
> index 0341987..537bce2 100644
> --- a/meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
> +++ b/meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
> @@ -5,21 +5,11 @@ resolved to sysroot.
>
> =C2=A0-Khem Raj <raj.khem@gmail.com>
>
> -Index: libtool-2.4/libltdl/config/ltmain.m4sh
> +Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/libltdl/config/ltmain.m4sh
> -+++ libtool-2.4/libltdl/config/ltmain.m4sh
> -@@ -8479,7 +8479,8 @@ EOF
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *.la)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func_basename "$deplib=
"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name=3D"$func_basename=
_result"
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval libdir=3D`${SED} =
-n -e 's/^libdir=3D\(.*\)$/\1/p' $deplib`
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0func_resolve_sysroot "=
$deplib"
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval libdir=3D`${SED} =
-n -e 's/^libdir=3D\(.*\)$/\1/p' $func_resolve_sysroot_result`
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test -z "$libdir" && \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func_fatal_erro=
r "\`$deplib' is not a valid libtool archive"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func_append newdepende=
ncy_libs " ${lt_sysroot:+=3D}$libdir/$name"
> -@@ -8505,7 +8506,9 @@ EOF
> +--- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh
> ++++ libtool-2.4.2/libltdl/config/ltmain.m4sh
> +@@ -8526,7 +8526,9 @@ EOF
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*.la)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0func_basename "$li=
b"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name=3D"$func_base=
name_result"
> @@ -30,7 +20,7 @@ Index: libtool-2.4/libltdl/config/ltmain.m4sh
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test -z "$libdir" =
&& \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0func_fatal_=
error "\`$lib' is not a valid libtool archive"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0func_append newdlf=
iles " ${lt_sysroot:+=3D}$libdir/$name"
> -@@ -8524,7 +8527,8 @@ EOF
> +@@ -8545,7 +8547,8 @@ EOF
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# the library:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0func_basename "$li=
b"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0name=3D"$func_base=
name_result"
> diff --git a/meta/recipes-devtools/libtool/libtool/trailingslash.patch b/=
meta/recipes-devtools/libtool/libtool/trailingslash.patch
> index d71a770..bb7a761 100644
> --- a/meta/recipes-devtools/libtool/libtool/trailingslash.patch
> +++ b/meta/recipes-devtools/libtool/libtool/trailingslash.patch
> @@ -11,12 +11,12 @@ Merged a patch received from Gary Thomas <gary@mlbass=
oc.com>
> =C2=A0Date: 2010/07/12
> =C2=A0Nitin A Kamble <nitin.a.kamble@intel.com>
>
> -Index: libtool-2.2.10/libltdl/config/ltmain.m4sh
> +Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.2.10.orig/libltdl/config/ltmain.m4sh
> -+++ libtool-2.2.10/libltdl/config/ltmain.m4sh
> -@@ -1634,8 +1634,15 @@ func_mode_install ()
> - =C2=A0 =C2=A0 =C2=A0 dir=3D"$dir$objdir"
> +--- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh
> ++++ libtool-2.4.2/libltdl/config/ltmain.m4sh
> +@@ -2167,8 +2167,15 @@ func_mode_install ()
> + =C2=A0 =C2=A0 =C2=A0 func_append dir "$objdir"
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if test -n "$relink_command"; then
> =C2=A0+ =C2=A0 =C2=A0 =C2=A0# Strip any trailing slash from the destinati=
on.
> diff --git a/meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath=
.patch b/meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath.patch
> index 5e2eec9..0cd66ad 100644
> --- a/meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath.patch
> +++ b/meta/recipes-devtools/libtool/libtool/use-sysroot-in-libpath.patch
> @@ -7,11 +7,11 @@ i.e. when lt_sysroot is not set, it will still behave t=
he same and add
>
> =C2=A0-Khem Raj <raj.khem@gmail.com>
>
> -Index: libtool-2.4/libltdl/config/ltmain.m4sh
> +Index: libtool-2.4.2/libltdl/config/ltmain.m4sh
> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- libtool-2.4.orig/libltdl/config/ltmain.m4sh
> -+++ libtool-2.4/libltdl/config/ltmain.m4sh
> -@@ -6122,7 +6122,7 @@ func_mode_link ()
> +--- libtool-2.4.2.orig/libltdl/config/ltmain.m4sh
> ++++ libtool-2.4.2/libltdl/config/ltmain.m4sh
> +@@ -6138,7 +6138,7 @@ func_mode_link ()
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We cannot seem to hardc=
ode it, guess we'll fake it.
> diff --git a/meta/recipes-devtools/libtool/libtool_2.4.bb b/meta/recipes-=
devtools/libtool/libtool_2.4.2.bb
> similarity index 97%
> rename from meta/recipes-devtools/libtool/libtool_2.4.bb
> rename to meta/recipes-devtools/libtool/libtool_2.4.2.bb
> index 3002215..0706cf2 100644
> --- a/meta/recipes-devtools/libtool/libtool_2.4.bb
> +++ b/meta/recipes-devtools/libtool/libtool_2.4.2.bb
> @@ -1,6 +1,6 @@
> =C2=A0require libtool-${PV}.inc
>
> -PR =3D "r4"
> +PR =3D "r0"
>
> =C2=A0#
> =C2=A0# We want the results of libtool-cross preserved - don't stage anyt=
hing ourselves.
> --
> 1.7.6.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


