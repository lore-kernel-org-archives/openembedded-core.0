Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 173B47057D;
	Wed, 16 Jul 2014 15:33:25 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so1110484wgh.15
	for <multiple recipients>; Wed, 16 Jul 2014 08:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RUZDufPgWTYPdwuJIY4/hCkSUspX8/BMAFBKlQu0eho=;
	b=WyHRmKhXhRwMCcyRw2CAD+MflGRCdS+uerhvyd2AAZ4/4VytKfryLavQY5hdy+Idow
	zTOtFf+e+gG4pOuaKIg0SCkC95sUfLJ6EjIWzH1CzRUwq/f224GDTV1hO2qMq5nQs83v
	P0khLi/xbozXOX2jrHb7YuRi5EZHAG7hFj6ra4i2g5dZzOyqzNkTJd/Q89yQ9woIayV9
	+sdewRPUZpCS4ZEsBQauJGhlvvLkikgRDjCSTxyKV8JUReKPopjW3qra4i7vgiY9xH1z
	YFQgAO0YndpJC0JLvlUVt3CiobpULceeM63o9WZ+bBEI0fyZtpNInTFjUgNzXlf0xQMN
	Zy/g==
X-Received: by 10.194.58.180 with SMTP id s20mr20510194wjq.119.1405524805997; 
	Wed, 16 Jul 2014 08:33:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o12sm57727725wiw.5.2014.07.16.08.33.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 08:33:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Jul 2014 17:33:36 +0200
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20140716153336.GE2433@jama>
References: <20140708102041.70F60503C6@opal.openembedded.org>
	<20140716135259.GA2433@jama> <53C6873A.6070003@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53C6873A.6070003@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Mark Hatle : db: Add version 6.0.30
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
X-List-Received-Date: Wed, 16 Jul 2014 15:33:31 -0000
X-Groupsio-MsgNum: 55062
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SnG0pWpA7SYxRffL"
Content-Disposition: inline

--SnG0pWpA7SYxRffL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2014 at 09:07:54AM -0500, Mark Hatle wrote:
> On 7/16/14, 8:52 AM, Martin Jansa wrote:
> > On Tue, Jul 08, 2014 at 10:20:41AM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: 04bb223110da2f92725c341bc3ec0cf26325f675
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3D04bb223110da2f92725c341bc3ec0cf26325f675
> >>
> >> Author: Mark Hatle <mark.hatle@windriver.com>
> >> Date:   Wed Jul  2 19:57:43 2014 -0500
> >>
> >> db: Add version 6.0.30
> >>
> >> The latest version of RPM5 requires Berkley DB 6.0.20 or newer.
> >>
> >> The license is now AGPL-3.0 in BDB 6.0.  This may not be acceptable to=
 some, so
> >> the previous version is retained as an alternative.
> >
> > This is failing on some hosts with:
>=20
> That's odd..  what host OS's and toolchain versions is it failing on?
>=20
> The iostream.h file SHOULD exist in all systems that have C++ development=
 installed.

Gentoo, gcc-4.9 and iostream.h exists in usual locations (at least now), re=
building db
manually helped

> > | In file included from
> > /OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/db/6.0.30-=
r0/db-6.0.30/lang/cxx/cxx_channel.cpp:13:0:
> > | ./db_cxx.h:59:22: fatal error: iostream.h: No such file or directory
> > |  #include <iostream.h>
> > |                       ^
> >
> >> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>
> >> ---
> >>
> >>   .../db/db/arm-thumb-mutex_db5.patch                |  10 ++
> >>   meta/recipes-support/db/db_6.0.30.bb               | 114 +++++++++++=
++++++++++
> >>   2 files changed, 124 insertions(+)
> >>
> >> diff --git a/meta/recipes-support/db/db/arm-thumb-mutex_db5.patch b/me=
ta/recipes-support/db/db/arm-thumb-mutex_db5.patch
> >> index 40b13de..34e8db8 100644
> >> --- a/meta/recipes-support/db/db/arm-thumb-mutex_db5.patch
> >> +++ b/meta/recipes-support/db/db/arm-thumb-mutex_db5.patch
> >> @@ -1,5 +1,15 @@
> >> +Original patch submitted by jbowler@nslu2-linux.org on 2005-11-17:
> >> +
> >> +db: fix thumb uclibc operation in 4.3.29
> >> +  - uclibc thumb builds were using libpthread to implement mutexes, t=
he
> >> +  - uclibc version seems to be a stub (at least on thumb).  This comm=
it
> >> +  - fixes the ARM/gcc-assembly mutex implementation so that it has th=
umb
> >> +  - support and the resultant db4 works (tested on LE Thumb uclibc)
> >> +
> >>   Upstream-Status: Inappropriate [embedded specific]
> >>
> >> +Author: jbowler@nslu2-linux.org
> >> +
> >>   --- db-5.1.19/src/dbinc/mutex_int.h.orig	2011-01-05 19:21:42.1818053=
66 -0600
> >>   +++ db-5.1.19/src/dbinc/mutex_int.h	2011-01-05 19:24:53.141853117 -0=
600
> >>   @@ -474,6 +474,25 @@
> >> diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-suppo=
rt/db/db_6.0.30.bb
> >> new file mode 100644
> >> index 0000000..9fc4a30
> >> --- /dev/null
> >> +++ b/meta/recipes-support/db/db_6.0.30.bb
> >> @@ -0,0 +1,114 @@
> >> +# Version 6 of the Berkeley DB from Oracle (formerly Sleepycat)
> >> +#
> >> +# At present this package only installs the DB code
> >> +# itself (shared libraries, .a in the dev package),
> >> +# documentation and headers.
> >> +#
> >> +# The headers have the same names as those as v3
> >> +# of the DB, only one version can be used *for dev*
> >> +# at once - DB3 and DB6 can both be installed on the
> >> +# same system at the same time if really necessary.
> >> +SECTION =3D "libs"
> >> +SUMMARY =3D "Berkeley Database v6"
> >> +HOMEPAGE =3D "http://www.oracle.com/technology/products/berkeley-db/d=
b/index.html"
> >> +LICENSE =3D "AGPL-3.0"
> >> +VIRTUAL_NAME ?=3D "virtual/db"
> >> +RCONFLICTS_${PN} =3D "db3"
> >> +
> >> +SRC_URI =3D "http://download.oracle.com/berkeley-db/db-${PV}.tar.gz"
> >> +SRC_URI +=3D "file://arm-thumb-mutex_db5.patch;patchdir=3D.. \
> >> +            file://fix-parallel-build.patch \
> >> +           "
> >> +
> >> +SRC_URI[md5sum] =3D "ad28eb86ad3203b5422844db179c585b"
> >> +SRC_URI[sha256sum] =3D "608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4=
d33d54516f3f6a20fd2"
> >> +
> >> +LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3D1ec8b0b17cc31513fe35ab1=
0716f8490"
> >> +
> >> +inherit autotools
> >> +
> >> +# Put virtual/db in any appropriate provider of a
> >> +# relational database, use it as a dependency in
> >> +# place of a specific db and use:
> >> +#
> >> +# PREFERRED_PROVIDER_virtual/db
> >> +#
> >> +# to select the correct db in the build (distro) .conf
> >> +PROVIDES +=3D "${VIRTUAL_NAME}"
> >> +
> >> +# bitbake isn't quite clever enough to deal with sleepycat,
> >> +# the distribution sits in the expected directory, but all
> >> +# the builds must occur from a sub-directory.  The following
> >> +# persuades bitbake to go to the right place
> >> +S =3D "${WORKDIR}/db-${PV}/dist"
> >> +B =3D "${WORKDIR}/db-${PV}/build_unix"
> >> +
> >> +# The executables go in a separate package - typically there
> >> +# is no need to install these unless doing real database
> >> +# management on the system.
> >> +inherit lib_package
> >> +
> >> +PACKAGES =3D+ "${PN}-cxx"
> >> +FILES_${PN}-cxx =3D "${libdir}/*cxx*so"
> >> +
> >> +
> >> +# The dev package has the .so link (as in db3) and the .a's -
> >> +# it is therefore incompatible (cannot be installed at the
> >> +# same time) as the db3 package
> >> +# sort out the .so since they do version prior to the .so
> >> +SOLIBS =3D "-6*.so"
> >> +FILES_SOLIBSDEV =3D "${libdir}/libdb.so ${libdir}/libdb_cxx.so"
> >> +
> >> +#configuration - set in local.conf to override
> >> +# All the --disable-* options replace --enable-smallbuild, which brea=
ks a bunch of stuff (eg. postfix)
> >> +DB6_CONFIG ?=3D "--enable-o_direct --disable-cryptography --disable-q=
ueue --disable-replication --disable-verify --disable-compat185 --disable-s=
ql"
> >> +
> >> +EXTRA_OECONF =3D "${DB6_CONFIG} --enable-shared --enable-cxx --with-s=
ysroot"
> >> +
> >> +# Override the MUTEX setting here, the POSIX library is
> >> +# the default - "POSIX/pthreads/library".
> >> +# Don't ignore the nice SWP instruction on the ARM:
> >> +# These enable the ARM assembler mutex code
> >> +ARM_MUTEX =3D "--with-mutex=3DARM/gcc-assembly"
> >> +MUTEX =3D ""
> >> +MUTEX_arm =3D "${ARM_MUTEX}"
> >> +MUTEX_armeb =3D "${ARM_MUTEX}"
> >> +EXTRA_OECONF +=3D "${MUTEX}"
> >> +
> >> +# Cancel the site stuff - it's set for db3 and destroys the
> >> +# configure.
> >> +CONFIG_SITE =3D ""
> >> +do_configure() {
> >> +	gnu-configize --force ${S}
> >> +	export STRIP=3D"true"
> >> +	oe_runconf
> >> +}
> >> +
> >> +do_compile_prepend() {
> >> +	sed -i -e 's|hardcode_into_libs=3Dyes|hardcode_into_libs=3Dno|' \
> >> +		${B}/libtool
> >> +}
> >> +
> >> +do_install_append() {
> >> +	mkdir -p ${D}/${includedir}/db60
> >> +	mv ${D}/${includedir}/db.h ${D}/${includedir}/db60/.
> >> +	mv ${D}/${includedir}/db_cxx.h ${D}/${includedir}/db60/.
> >> +	ln -s db60/db.h ${D}/${includedir}/db.h
> >> +	ln -s db60/db_cxx.h ${D}/${includedir}/db_cxx.h
> >> +
> >> +	# The docs end up in /usr/docs - not right.
> >> +	if test -d "${D}/${prefix}/docs"
> >> +	then
> >> +		mkdir -p "${D}/${datadir}"
> >> +		test ! -d "${D}/${docdir}" || rm -rf "${D}/${docdir}"
> >> +		mv "${D}/${prefix}/docs" "${D}/${docdir}"
> >> +	fi
> >> +
> >> +	chown -R root:root ${D}
> >> +}
> >> +
> >> +INSANE_SKIP_${PN} =3D "dev-so"
> >> +INSANE_SKIP_${PN}-cxx =3D "dev-so"
> >> +
> >> +BBCLASSEXTEND =3D "native nativesdk"
> >> +
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SnG0pWpA7SYxRffL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPGm1AACgkQN1Ujt2V2gBxBHwCcCGch4RfPkiR2yT2pDQ5Z2sLW
xhYAnj2eh1Nhkk/jEHT30yF2a5bN+ScP
=uJpG
-----END PGP SIGNATURE-----

--SnG0pWpA7SYxRffL--
