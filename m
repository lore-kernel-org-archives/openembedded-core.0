Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TCvJ6-0003sm-Ir; Sat, 15 Sep 2012 18:33:24 +0200
Received: by wibhn17 with SMTP id hn17so769524wib.6
	for <multiple recipients>; Sat, 15 Sep 2012 09:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LwCEbuLCfdu94v0Eo/XSvcuttXUzbPL66iMXtr6HGvo=;
	b=PdrJQpMvQqn1wL0rGxAzD7y+kUEkk1LfWxEJtinEORjxH0gizaMcvi2sbURJ7wDSdl
	sM+uUoWCFkY2LVDCn9hpvXl8ER530Kh2W9QCTICMrnE0WMRBjsZqeMo8MUBRttbfquop
	b668so5CQCNnA/ikjFjPzuFTU7ZMg3RjNBhfN+hUPFIhrWArD8Ktu85t+EE7Abul1uJO
	D9/lNzIHqSKEsDirR8fvznA2m6oWmVfpRiVvEC6eYZnFP01MwdQgqaWnHEgrTmUV76UC
	h+rcjIyqqS/uClgjDs3lpKh+cTsVfJFjIXypvySRIWHNJiraECHaAzHMIQGBXZDUFcVJ
	l6mQ==
Received: by 10.216.139.196 with SMTP id c46mr3405929wej.220.1347726048033;
	Sat, 15 Sep 2012 09:20:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm5982502wib.10.2012.09.15.09.20.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Sep 2012 09:20:46 -0700 (PDT)
Date: Sat, 15 Sep 2012 18:20:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: andrei.adrianx.dinu@intel.com
Message-ID: <20120915162051.GA11051@jama.jama.net>
References: <20120914085706.2CBFC103C3@opal>
MIME-Version: 1.0
In-Reply-To: <20120914085706.2CBFC103C3@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Andrei Dinu : libffi upgrade to 3.0.11
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
X-List-Received-Date: Sat, 15 Sep 2012 16:33:24 -0000
X-Groupsio-MsgNum: 29352
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 14, 2012 at 08:57:06AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 3e40136e8bd13b17b6d88b6acfb5ed162bb8d96a
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D3e40136e8bd13b17b6d88b6acfb5ed162bb8d96a
>=20
> Author: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> Date:   Thu Sep 13 11:26:45 2012 +0300
>=20
> libffi upgrade to 3.0.11

This changes .so name from libffi5 to libffi6, breaking every recipe
depending on libffi when someone is using debian.bbclass.

This list of 374 packages is probably not complete, just what I have
built before.

http://build.shr-project.org/tests/jama/libffi5.pkgs

Cheers,

>=20
> Changes :
>=20
> - Added ax_append_flags.m4 and ax_check_compile_flag.m4 to the m4 directo=
ry.
>   The files were missing and aclocal.m4 was generated without those two m=
acros.
>=20
> - Added a new license md5 checksum to the recipe because the old LICENSE =
file
>   differs from the new one here :
>=20
>         OLD : libffi - Copyright (c) 1996-2011
>=20
>         NEW : libffi - Copyright (c) 1996-2012
>=20
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  .../libffi/0001-libffi-update-for-3.0.11.patch     |  171 ++++++++++++++=
++++++
>  .../libffi/{libffi_3.0.10.bb =3D> libffi_3.0.11.bb}  |    9 +-
>  2 files changed, 176 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-gnome/libffi/0001-libffi-update-for-3.0.11.patc=
h b/meta/recipes-gnome/libffi/0001-libffi-update-for-3.0.11.patch
> new file mode 100644
> index 0000000..9592048
> --- /dev/null
> +++ b/meta/recipes-gnome/libffi/0001-libffi-update-for-3.0.11.patch
> @@ -0,0 +1,171 @@
> +From 936ab07cec90243a6a336c5aa6205f4edbeb00d5 Mon Sep 17 00:00:00 2001
> +From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> +Date: Wed, 12 Sep 2012 17:42:29 +0300
> +Subject: [PATCH] libffi update for 3.0.11
> +
> +Upstream status : Pending
> +
> +Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> +---
> + m4/ax_append_flag.m4        |   69 ++++++++++++++++++++++++++++++++++++=
+++++
> + m4/ax_check_compile_flag.m4 |   72 ++++++++++++++++++++++++++++++++++++=
+++++++
> + 2 files changed, 141 insertions(+)
> + create mode 100644 m4/ax_append_flag.m4
> + create mode 100644 m4/ax_check_compile_flag.m4
> +
> +diff --git a/m4/ax_append_flag.m4 b/m4/ax_append_flag.m4
> +new file mode 100644
> +index 0000000..1d38b76
> +--- /dev/null
> ++++ b/m4/ax_append_flag.m4
> +@@ -0,0 +1,69 @@
> ++# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> ++#      http://www.gnu.org/software/autoconf-archive/ax_append_flag.html
> ++# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> ++#
> ++# SYNOPSIS
> ++#
> ++#   AX_APPEND_FLAG(FLAG, [FLAGS-VARIABLE])
> ++#
> ++# DESCRIPTION
> ++#
> ++#   FLAG is appended to the FLAGS-VARIABLE shell variable, with a space
> ++#   added in between.
> ++#
> ++#   If FLAGS-VARIABLE is not specified, the current language's flags (e=
=2Eg.
> ++#   CFLAGS) is used.  FLAGS-VARIABLE is not changed if it already conta=
ins
> ++#   FLAG.  If FLAGS-VARIABLE is unset in the shell, it is set to exactly
> ++#   FLAG.
> ++#
> ++#   NOTE: Implementation based on AX_CFLAGS_GCC_OPTION.
> ++#
> ++# LICENSE
> ++#
> ++#   Copyright (c) 2008 Guido U. Draheim <guidod@gmx.de>
> ++#   Copyright (c) 2011 Maarten Bosmans <mkbosmans@gmail.com>
> ++#
> ++#   This program is free software: you can redistribute it and/or modif=
y it
> ++#   under the terms of the GNU General Public License as published by t=
he
> ++#   Free Software Foundation, either version 3 of the License, or (at y=
our
> ++#   option) any later version.
> ++#
> ++#   This program is distributed in the hope that it will be useful, but
> ++#   WITHOUT ANY WARRANTY; without even the implied warranty of
> ++#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Ge=
neral
> ++#   Public License for more details.
> ++#
> ++#   You should have received a copy of the GNU General Public License a=
long
> ++#   with this program. If not, see <http://www.gnu.org/licenses/>.
> ++#
> ++#   As a special exception, the respective Autoconf Macro's copyright o=
wner
> ++#   gives unlimited permission to copy, distribute and modify the confi=
gure
> ++#   scripts that are the output of Autoconf when processing the Macro. =
You
> ++#   need not follow the terms of the GNU General Public License when us=
ing
> ++#   or distributing such scripts, even though portions of the text of t=
he
> ++#   Macro appear in them. The GNU General Public License (GPL) does gov=
ern
> ++#   all other use of the material that constitutes the Autoconf Macro.
> ++#
> ++#   This special exception to the GPL applies to versions of the Autoco=
nf
> ++#   Macro released by the Autoconf Archive. When you make and distribut=
e a
> ++#   modified version of the Autoconf Macro, you may extend this special
> ++#   exception to the GPL to apply to your modified version as well.
> ++
> ++#serial 2
> ++
> ++AC_DEFUN([AX_APPEND_FLAG],
> ++[AC_PREREQ(2.59)dnl for _AC_LANG_PREFIX
> ++AS_VAR_PUSHDEF([FLAGS], [m4_default($2,_AC_LANG_PREFIX[FLAGS])])dnl
> ++AS_VAR_SET_IF(FLAGS,
> ++  [case " AS_VAR_GET(FLAGS) " in
> ++    *" $1 "*)
> ++      AC_RUN_LOG([: FLAGS already contains $1])
> ++      ;;
> ++    *)
> ++      AC_RUN_LOG([: FLAGS=3D"$FLAGS $1"])
> ++      AS_VAR_SET(FLAGS, ["AS_VAR_GET(FLAGS) $1"])
> ++      ;;
> ++   esac],
> ++  [AS_VAR_SET(FLAGS,["$1"])])
> ++AS_VAR_POPDEF([FLAGS])dnl
> ++])dnl AX_APPEND_FLAG
> +diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
> +new file mode 100644
> +index 0000000..c3a8d69
> +--- /dev/null
> ++++ b/m4/ax_check_compile_flag.m4
> +@@ -0,0 +1,72 @@
> ++# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> ++#   http://www.gnu.org/software/autoconf-archive/ax_check_compile_flag.=
html
> ++# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> ++#
> ++# SYNOPSIS
> ++#
> ++#   AX_CHECK_COMPILE_FLAG(FLAG, [ACTION-SUCCESS], [ACTION-FAILURE], [EX=
TRA-FLAGS])
> ++#
> ++# DESCRIPTION
> ++#
> ++#   Check whether the given FLAG works with the current language's comp=
iler
> ++#   or gives an error.  (Warnings, however, are ignored)
> ++#
> ++#   ACTION-SUCCESS/ACTION-FAILURE are shell commands to execute on
> ++#   success/failure.
> ++#
> ++#   If EXTRA-FLAGS is defined, it is added to the current language's de=
fault
> ++#   flags (e.g. CFLAGS) when the check is done.  The check is thus made=
 with
> ++#   the flags: "CFLAGS EXTRA-FLAGS FLAG".  This can for example be used=
 to
> ++#   force the compiler to issue an error when a bad flag is given.
> ++#
> ++#   NOTE: Implementation based on AX_CFLAGS_GCC_OPTION. Please keep this
> ++#   macro in sync with AX_CHECK_{PREPROC,LINK}_FLAG.
> ++#
> ++# LICENSE
> ++#
> ++#   Copyright (c) 2008 Guido U. Draheim <guidod@gmx.de>
> ++#   Copyright (c) 2011 Maarten Bosmans <mkbosmans@gmail.com>
> ++#
> ++#   This program is free software: you can redistribute it and/or modif=
y it
> ++#   under the terms of the GNU General Public License as published by t=
he
> ++#   Free Software Foundation, either version 3 of the License, or (at y=
our
> ++#   option) any later version.
> ++#
> ++#   This program is distributed in the hope that it will be useful, but
> ++#   WITHOUT ANY WARRANTY; without even the implied warranty of
> ++#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Ge=
neral
> ++#   Public License for more details.
> ++#
> ++#   You should have received a copy of the GNU General Public License a=
long
> ++#   with this program. If not, see <http://www.gnu.org/licenses/>.
> ++#
> ++#   As a special exception, the respective Autoconf Macro's copyright o=
wner
> ++#   gives unlimited permission to copy, distribute and modify the confi=
gure
> ++#   scripts that are the output of Autoconf when processing the Macro. =
You
> ++#   need not follow the terms of the GNU General Public License when us=
ing
> ++#   or distributing such scripts, even though portions of the text of t=
he
> ++#   Macro appear in them. The GNU General Public License (GPL) does gov=
ern
> ++#   all other use of the material that constitutes the Autoconf Macro.
> ++#
> ++#   This special exception to the GPL applies to versions of the Autoco=
nf
> ++#   Macro released by the Autoconf Archive. When you make and distribut=
e a
> ++#   modified version of the Autoconf Macro, you may extend this special
> ++#   exception to the GPL to apply to your modified version as well.
> ++
> ++#serial 2
> ++
> ++AC_DEFUN([AX_CHECK_COMPILE_FLAG],
> ++[AC_PREREQ(2.59)dnl for _AC_LANG_PREFIX
> ++AS_VAR_PUSHDEF([CACHEVAR],[ax_cv_check_[]_AC_LANG_ABBREV[]flags_$4_$1])=
dnl
> ++AC_CACHE_CHECK([whether _AC_LANG compiler accepts $1], CACHEVAR, [
> ++  ax_check_save_flags=3D$[]_AC_LANG_PREFIX[]FLAGS
> ++  _AC_LANG_PREFIX[]FLAGS=3D"$[]_AC_LANG_PREFIX[]FLAGS $4 $1"
> ++  AC_COMPILE_IFELSE([AC_LANG_PROGRAM()],
> ++    [AS_VAR_SET(CACHEVAR,[yes])],
> ++    [AS_VAR_SET(CACHEVAR,[no])])
> ++  _AC_LANG_PREFIX[]FLAGS=3D$ax_check_save_flags])
> ++AS_IF([test x"AS_VAR_GET(CACHEVAR)" =3D xyes],
> ++  [m4_default([$2], :)],
> ++  [m4_default([$3], :)])
> ++AS_VAR_POPDEF([CACHEVAR])dnl
> ++])dnl AX_CHECK_COMPILE_FLAGS
> +--=20
> +1.7.9.5
> +
> diff --git a/meta/recipes-gnome/libffi/libffi_3.0.10.bb b/meta/recipes-gn=
ome/libffi/libffi_3.0.11.bb
> similarity index 72%
> rename from meta/recipes-gnome/libffi/libffi_3.0.10.bb
> rename to meta/recipes-gnome/libffi/libffi_3.0.11.bb
> index c06b80c..e674fd3 100644
> --- a/meta/recipes-gnome/libffi/libffi_3.0.10.bb
> +++ b/meta/recipes-gnome/libffi/libffi_3.0.11.bb
> @@ -7,14 +7,15 @@ library really only provides the lowest, machine depend=
ent layer of a fully feat
>  A layer must exist above `libffi' that handles type conversions for valu=
es passed between the two languages."
> =20
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0caa055e49a3fb6c57780595e995e=
2ab"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De54c573c49435ccbbd3f6dc9e49a0=
65e"
> =20
>  PR =3D "r0"
> =20
> -SRC_URI =3D "ftp://sourceware.org/pub/libffi/${BPN}-${PV}.tar.gz"
> +SRC_URI =3D "ftp://sourceware.org/pub/libffi/${BPN}-${PV}.tar.gz \
> +           file://0001-libffi-update-for-3.0.11.patch"
> =20
> -SRC_URI[md5sum] =3D "79390673f5d07a8fb342bc09b5055b6f"
> -SRC_URI[sha256sum] =3D "f01eb9027e9eb56aeaeef636649877756d475d714ef8b47f=
627f65bc5f3b492f"
> +SRC_URI[md5sum] =3D "f69b9693227d976835b4857b1ba7d0e3"
> +SRC_URI[sha256sum] =3D "70bfb01356360089aa97d3e71e3edf05d195599fd822e922=
e50d46a0055a6283"
> =20
>  EXTRA_OECONF +=3D "--disable-builddir"
> =20
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBUquMACgkQN1Ujt2V2gBzrjACguPXS/ftmRi5hOnndpe2xO+Se
w6QAoJEmgE4+euA9/X9bPIwohuDCkvLn
=TPil
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
