Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SFThZ-0004BH-6D; Wed, 04 Apr 2012 19:08:57 +0200
Received: by wgbdr12 with SMTP id dr12so436386wgb.24
	for <multiple recipients>; Wed, 04 Apr 2012 09:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=w7phz0UQodKq/rKvMY4KhymGLcs/374pqfvJDJSiefg=;
	b=P5LbaGVYuKpX9/eDo6oREzi/CPckxY4QN9iIEHGV9dNfWsCJMXQUtLF5gHEHOrmN6D
	QUztkBU/KJvoIqQFM/dKR30Q7QqsCCqz03G3TwysMM5H9hrVoOf5Gxwopv3wMuw/pIOw
	ji7eRHKlcCyaUWUW3ZnVIC+MiWhrkNDkMUyLbggekWpOczkdS934KBPH2L/wTtEXvfuR
	ihezPuz0dsyhkF0LC9Lw/m/w8+H1puZWXcWfYVXwJkU5vrUc3IRV0n/7PgSOpkSMPIJb
	X8nFTWdToc8sZlu5/gAU6245vQnDKcCJDCte/g2PUPojPm1rRKqWb9PbTZe+nyLWzkXJ
	GJnA==
Received: by 10.180.95.129 with SMTP id dk1mr8098079wib.3.1333558785145;
	Wed, 04 Apr 2012 09:59:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bx13sm6170827wib.10.2012.04.04.09.59.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Apr 2012 09:59:43 -0700 (PDT)
Date: Wed, 4 Apr 2012 18:59:43 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120404165943.GE4181@jama.jama.net>
References: <20120403131537.5CE3310218@opal>
MIME-Version: 1.0
In-Reply-To: <20120403131537.5CE3310218@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Andreas Oberritter : gdb: build with expat, add missing RRECOMMENDS_gdbserver
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
X-List-Received-Date: Wed, 04 Apr 2012 17:08:57 -0000
X-Groupsio-MsgNum: 20272
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VdOwlNaOFKGAtAAV"
Content-Disposition: inline

--VdOwlNaOFKGAtAAV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 03, 2012 at 01:15:37PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 38ee88e3b32b7444d7f1eb64f1b4f69a48fe0458
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D38ee88e3b32b7444d7f1eb64f1b4f69a48fe0458
>=20
> Author: Andreas Oberritter <obi@opendreambox.org>
> Date:   Tue Apr  3 00:23:55 2012 +0200
>=20
> gdb: build with expat, add missing RRECOMMENDS_gdbserver
>=20
> * Fixes communication between gdbserver and gdb-cross
>   by using the same expat settings for both recipes.
> * Adds missing build dependencies for expat/expat-native.
> * Adds missing glibc-thread-db runtime recommendation
>   to gdbserver, which was set only for gdb.
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Here it's trying to use host's expat when building target gdb and fails...

| checking for libexpat... no
| configure: error: expat is missing or unusable
| make[1]: *** [configure-gdb] Error 1
| make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv7a-vfp-neon-=
oe-linux-gnueabi/gdb/gdb-7.4-r7.0/build-arm-oe-linux-gnueabi'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
NOTE: package gdb-7.4-r7.0: task do_compile: Failed
ERROR: Task 3561 (/OE/shr-core/openembedded-core/meta/recipes-devtools/gdb/=
gdb_7.4.bb, do_compile) failed with exit code '1'

=66rom config.log:
configure:10704: checking for libexpat
configure:10723: arm-oe-linux-gnueabi-gcc  -march=3Darmv7-a -fno-tree-vecto=
rize     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcorte=
x-a8 --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/om-gta04 -o conftest -O2 =
-pipe -g -feliminate-unused-debug-types    -Wl,-O1 -Wl,--hash-style=3Dgnu -=
Wl,--as-needed conftest.c -ldl -lncurses -lz -lm    /usr/lib/libexpat.so >&5
/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv7a-vfp-neon-o=
e-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.4/ld: error: /usr/lib/libexpat=
=2Eso: incompatible target
conftest.c:98: error: undefined reference to 'XML_ParserCreate'
collect2: ld returned 1 exit status

Cheers,

>=20
> ---
>=20
>  meta/recipes-devtools/gdb/gdb-common.inc           |    8 +++++---
>  .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    1 -
>  meta/recipes-devtools/gdb/gdb-cross.inc            |    2 +-
>  meta/recipes-devtools/gdb/gdb-cross_7.4.bb         |    1 -
>  4 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devt=
ools/gdb/gdb-common.inc
> index 0833a03..a8fca6f 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "gdb - GNU debugger"
>  HOMEPAGE =3D "http://www.gnu.org/software/gdb/"
>  LICENSE=3D"GPLv3+"
>  SECTION =3D "devel"
> -DEPENDS =3D "ncurses readline ${LTTNGUST}"
> +DEPENDS =3D "expat ncurses readline ${LTTNGUST}"
> =20
>  LTTNGUST =3D "lttng-ust"
>  LTTNGUST_libc-uclibc =3D ""
> @@ -11,7 +11,7 @@ LTTNGUST_mipsel =3D ""
>  LTTNGUST_mips64 =3D ""
>  LTTNGUST_mips64el =3D ""
> =20
> -INC_PR =3D "r6"
> +INC_PR =3D "r7"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552 \
>  		file://COPYING.LIB;md5=3D9f604d8a4f8e74f4f5140845a21b6674 \
> @@ -36,7 +36,7 @@ B =3D "${WORKDIR}/build-${TARGET_SYS}"
> =20
>  EXTRA_OEMAKE =3D "'SUBDIRS=3Dintl mmalloc libiberty opcodes bfd sim gdb =
etc utils'"
> =20
> -EXPAT =3D "--without-expat"
> +EXPAT =3D "--with-expat"
> =20
>  EXTRA_OECONF =3D "--disable-gdbtk --disable-tui --disable-x \
>                  --with-curses --disable-multilib --with-system-readline =
--disable-sim \
> @@ -63,4 +63,6 @@ do_install_append() {
> =20
>  RRECOMMENDS_gdb_append_linux =3D " glibc-thread-db "
>  RRECOMMENDS_gdb_append_linux-gnueabi =3D " glibc-thread-db "
> +RRECOMMENDS_gdbserver_append_linux =3D " glibc-thread-db "
> +RRECOMMENDS_gdbserver_append_linux-gnueabi =3D " glibc-thread-db "
> =20
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb b/meta/r=
ecipes-devtools/gdb/gdb-cross-canadian_7.4.bb
> index 8e68c75..b2f39ce 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
> @@ -4,6 +4,5 @@ require gdb-cross-canadian.inc
>  PR =3D "${INC_PR}.5"
> =20
>  GDBPROPREFIX =3D "--program-prefix=3D'${TARGET_PREFIX}'"
> -EXPAT =3D "--with-expat"
> =20
>  S =3D "${WORKDIR}/${BPN}-${PV}"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devto=
ols/gdb/gdb-cross.inc
> index 20db86b..588a208 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross.inc
> @@ -1,6 +1,6 @@
>  require gdb-common.inc
> =20
> -DEPENDS =3D "ncurses-native"
> +DEPENDS =3D "expat-native ncurses-native"
> =20
>  #EXTRA_OEMAKE +=3D "LDFLAGS=3D'${BUILD_LDFLAGS}'"
> =20
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_7.4.bb b/meta/recipes-de=
vtools/gdb/gdb-cross_7.4.bb
> index eaf8f36..a14d0ba 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross_7.4.bb
> +++ b/meta/recipes-devtools/gdb/gdb-cross_7.4.bb
> @@ -1,7 +1,6 @@
>  require gdb-cross.inc
> =20
>  SRC_URI +=3D "file://sim-install-6.6.patch"
> -EXPAT =3D "--with-expat"
> =20
>  PR =3D "${INC_PR}.0"
> =20
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VdOwlNaOFKGAtAAV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk98ff8ACgkQN1Ujt2V2gBwcdgCeOiV8JRiyk330OYnXFrgEilFv
1TIAniyai5uv5VJeHrwAV9XVZ7/aippy
=2EM2
-----END PGP SIGNATURE-----

--VdOwlNaOFKGAtAAV--
