Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SHX6R-0008Mt-U6; Tue, 10 Apr 2012 11:11:07 +0200
Received: by eekc1 with SMTP id c1so1017600eek.6
	for <multiple recipients>; Tue, 10 Apr 2012 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qp2G3AX/FYf8jJ8q2iGUyDf7A2yOOFp7bYbwNOArP0k=;
	b=y9idVJlpSBvgQCpWwb2iwif0rivnRAdOA5AHwZgK1CFI9HbGHwhVuFl/PtapTDIszq
	rz0CoaILQvGKWL0rpiaUGAavgXSX+50l9faYKMlK9S/oAhotsmSgBhhgvY0yXlOc+/mK
	7+6F/HIUcxequnDvtSbd43IvFAlWjYQTm+iiMQ//odv5vXeLnJtL9LSBWmsFLRVlP5eG
	RQgt/tewlvJtrcT8E3jCYHFGkc8IKQpZAUG+3/alPBi/8S9JROH4P+ygUul0VanNhLkd
	RK8YCIcSuM+fpsEbDm3O0avIth6mYZxaPE8hqjrX6fuFgQ+khbu/BVb9EOR+JS1Hf+oG
	qd6w==
Received: by 10.14.37.140 with SMTP id y12mr1276377eea.120.1334048510378;
	Tue, 10 Apr 2012 02:01:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m55sm80556752eei.1.2012.04.10.02.01.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 02:01:49 -0700 (PDT)
Date: Tue, 10 Apr 2012 11:01:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120410090148.GD3583@jama.jama.net>
References: <20120406001738.706A810217@opal>
	<20120410083815.GC3583@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120410083815.GC3583@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Andrei Gherzan : gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in include/ gdbm
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
X-List-Received-Date: Tue, 10 Apr 2012 09:11:08 -0000
X-Groupsio-MsgNum: 20484
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uxuisgdDHaNETlh8"
Content-Disposition: inline

--uxuisgdDHaNETlh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2012 at 10:38:15AM +0200, Martin Jansa wrote:
> On Fri, Apr 06, 2012 at 12:17:38AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: e4d2ee00419f675ba8b7fb5d75256762253d8b32
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3De4d2ee00419f675ba8b7fb5d75256762253d8b32
> >=20
> > Author: Andrei Gherzan <andrei@gherzan.ro>
> > Date:   Fri Mar 23 17:56:29 2012 +0200
> >=20
> > gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in in=
clude/gdbm
> >=20
> > ndbm.h is needed by python for dbm module. This is why -enable-libgdbm-=
compat was added
> > to configure.
> > The second change is because python is looking for the gdbm headers in =
include/gdbm.
> > The easiest way to solve this issue is to add symlinks in include/gdbm.
> >=20
> > [YOCTO #1937]
> >=20
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>=20
> This breaks every package in feed which depends on old package name
> libgdbm4 (>=3D 1.10)
>=20
> Because now there are 2 .so files in ${PN} and no LEAD_SONAME defined.
>=20
> Are you going to=20
>=20
> 1) send PR bumps to all packages which depends on libgdbm4
>    (e.g. apr-util python pulseaudio perl gst-plugins-good and probably mo=
re)
> 2) define LEAD_SONAME and bump PR in gdbm recipe
> 3) move -compat libs to ${PN}-compat or some other package name, so that
>    old libgdbm4 still exists (and maybe + 1) because some people could
>    build those with gdbm as dependency now)

And there is also broken upgrade path on target
SHR root@qemux86-64 ~ $ opkg info libgdbm4
Package: libgdbm4
Version: 1.10-r1
Depends: libc6 (>=3D 2.15)
Provides:
Status: install ok installed
Architecture: x86_64
Installed-Time: 1332937981

SHR root@qemux86-64 ~ $ opkg info gdbm
Package: gdbm
Version: 1.10-r2
Depends: libc6 (>=3D 2.15)
Provides:
Status: unknown ok not-installed
Section: libs
Architecture: x86_64
Maintainer: OE-Core Developers
<openembedded-core@lists.openembedded.org>
MD5Sum: 7dc17a86738b55b5df2e5ee67cccc2ac
Size: 20062
Filename: gdbm_1.10-r2_x86_64.ipk
Source: ftp://ftp.gnu.org/gnu/gdbm/gdbm-1.10.tar.gz
Description: gdbm version 1.10-r2  GNU dbm is a set of database routines
that use
 extensible hashing.

And gdbm conflicts with libgdbm4, so if you decide to go with just 1)
then add also RCONFLICTS/RREPLACES to ${PN} to fix upgrade path.. but I
think that 3) is much better option..

Cheers,

>=20
>=20
> >=20
> > ---
> >=20
> >  meta/recipes-support/gdbm/gdbm_1.10.bb |   13 ++++++++++++-
> >  1 files changed, 12 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/meta/recipes-support/gdbm/gdbm_1.10.bb b/meta/recipes-supp=
ort/gdbm/gdbm_1.10.bb
> > index 9b2fde4..26b8009 100644
> > --- a/meta/recipes-support/gdbm/gdbm_1.10.bb
> > +++ b/meta/recipes-support/gdbm/gdbm_1.10.bb
> > @@ -4,7 +4,7 @@ SECTION =3D "libs"
> >  LICENSE =3D "GPLv3"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D241da1b9fe42e642cbb2c24d5e0=
c4d24"
> > =20
> > -PR =3D "r1"=20
> > +PR =3D "r2"
> > =20
> >  SRC_URI =3D "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz"
> > =20
> > @@ -13,4 +13,15 @@ SRC_URI[sha256sum] =3D "23f8134c5b94bbfb06d756a6b78f=
074fba6e6028cf2fe01341d40b26db
> > =20
> >  inherit autotools gettext lib_package
> > =20
> > +# Needed for dbm python module
> > +EXTRA_OECONF =3D "-enable-libgdbm-compat"
> > +
> >  BBCLASSEXTEND =3D "native nativesdk"
> > +
> > +do_install_append () {
> > +    # Create a symlink to ndbm.h and gdbm.h in include/gdbm to let oth=
er packages to find
> > +    # these headers
> > +    install -d ${D}${includedir}/gdbm
> > +    ln -sf ../ndbm.h ${D}/${includedir}/gdbm/ndbm.h
> > +    ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h
> > +}
> >=20
> >=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uxuisgdDHaNETlh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+D9vwACgkQN1Ujt2V2gBwlFwCgglr8xzB+Sm7ev3IUe1RRt9sU
VJEAn005CnlK4lxxWt+73RqU0w6IM73g
=gb8l
-----END PGP SIGNATURE-----

--uxuisgdDHaNETlh8--
