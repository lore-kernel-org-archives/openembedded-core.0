Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TmRyl-0004ij-LO; Sat, 22 Dec 2012 17:31:19 +0100
Received: by mail-ea0-f174.google.com with SMTP id e13so2305974eaa.5
	for <multiple recipients>; Sat, 22 Dec 2012 08:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=DVpND7As/iQdvFh4GK2OT3m9yukpTk4mxj+VsC90W8c=;
	b=f810JsvFnfIbFhIFInbh2pBuEKSG347e+MoLKmah1lO1mNoqL5BSX3joaRYGdYJ4hw
	B0Ull75OqI1HjoRY8Qk83yyjcGWXHrGRaQZSv5eBawv8d8ZY/UgwkHT1TE09s5tjb7s+
	aOp7LdX2khqOnX2nr9WgP5IH0hYvbaA2SbSP/4rtTxmVG1+xx7IMAhayBfhoPB8FDFfH
	j1qTYrsXjnYo/pr00cJCKpml4alCbJIjXkrf+HMbWPYLsApnjK0TB9mxOQPaq9A2Uj07
	jBXZhG+KZ4PTfVTvciYVCLCDZ3GLHrk0Lpr/cEI5LlxmA17M0whDMdmbKihlwYS9NBO1
	DnwQ==
X-Received: by 10.14.219.72 with SMTP id l48mr41315937eep.37.1356192988403;
	Sat, 22 Dec 2012 08:16:28 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z8sm29045578eeo.11.2012.12.22.08.16.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Dec 2012 08:16:27 -0800 (PST)
Date: Sat, 22 Dec 2012 17:16:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Marko Lindqvist <cazfi74-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Message-ID: <20121222161624.GB8988@jama.palm1.palmone.com>
References: <20121219175401.20C2610394@opal>
	<20121222160515.GA8988@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20121222160515.GA8988@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Marko Lindqvist : libpng: update to upstream version 1.5.13
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
X-List-Received-Date: Sat, 22 Dec 2012 16:31:26 -0000
X-Groupsio-MsgNum: 33021
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Content-Disposition: inline

--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hmm public.gmane.org is accepted for patches and SOB lines?

To be more clear about the issue with this upgrade:

See this change in buildhistory:
https://github.com/shr-distribution/buildhistory/commit/440d53dc7b448e05f9d=
01fc80587e50b3406768f

It's together with a lot of other changes, so github will probably show
it badly, but you probably have better commit in buildhistory from own
tests.

Old package had PN/libpng3 and PN12/libpng12-0, while new recipe build
only one version and moves it incorrectly to PN15:

--- a/packages/cortexa8-vfp-neon-oe-linux-gnueabi/libpng/libpng/latest
+++ b/packages/cortexa8-vfp-neon-oe-linux-gnueabi/libpng/libpng/latest
@@ -1,8 +1,7 @@
-PV =3D 1.2.50
+PV =3D 1.5.13
 PR =3D r0
-PKG =3D libpng3
-RDEPENDS =3D eglibc (>=3D 2.16) zlib (>=3D 1.2.7)
+RDEPENDS =3D=20
 RRECOMMENDS =3D
-PKGSIZE =3D 105584
+PKGSIZE =3D 0
 FILES =3D /usr/bin/* /usr/sbin/* /usr/lib/libpng/* /usr/lib/lib*.so.*
/etc /com /var /bin/* /sbin/* /lib/*.so.* /lib/udev/rules.d
/usr/lib/udev/rules.d /usr/share/libpng /usr/lib/libpng/*
/usr/share/pixmaps /usr/share/applications /usr/share/idl /usr/share/omf
/usr/share/sounds /usr/lib/bonobo/servers
-FILELIST =3D /usr/lib/libpng.so.3 /usr/lib/libpng.so.3.50.0
+FILELIST =3D=20

--- a/packages/cortexa8-vfp-neon-oe-linux-gnueabi/libpng/libpng12/latest
+++ /dev/null
@@ -1,8 +0,0 @@
-PV =3D 1.2.50
-PR =3D r0
-PKG =3D libpng12-0
-RDEPENDS =3D eglibc (>=3D 2.16) zlib (>=3D 1.2.7)
-RRECOMMENDS =3D=20
-PKGSIZE =3D 94738
-FILES =3D /usr/lib/libpng12.so.*
-FILELIST =3D /usr/lib/libpng12.so.0 /usr/lib/libpng12.so.0.50.0

--- /dev/null
+++ b/packages/cortexa8-vfp-neon-oe-linux-gnueabi/libpng/libpng15/latest
@@ -0,0 +1,8 @@
+PV =3D 1.5.13
+PR =3D r0
+PKG =3D libpng15-15
+RDEPENDS =3D eglibc (>=3D 2.16) zlib (>=3D 1.2.7)
+RRECOMMENDS =3D=20
+PKGSIZE =3D 103515
+FILES =3D /usr/lib/libpng15.so.*
+FILELIST =3D /usr/lib/libpng15.so.15 /usr/lib/libpng15.so.15.13.0

Regards,

On Sat, Dec 22, 2012 at 05:05:15PM +0100, Martin Jansa wrote:
> On Wed, Dec 19, 2012 at 05:54:00PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 317cbe5f5d4bf9366657a0d5383108c1b3340a8a
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D317cbe5f5d4bf9366657a0d5383108c1b3340a8a
> >=20
> > Author: Marko Lindqvist <cazfi74-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.or=
g>
> > Date:   Thu Dec 13 19:48:14 2012 +0200
> >=20
> > libpng: update to upstream version 1.5.13
> >=20
> > Updating from 1.2.x means also change in actual library name
> > from libpng12 to libpng15, and slight changes in API.
>=20
> Why isn't this handled by debian.bbclass like in other libs?
>=20
> PN-dev and PN-dbg are broken, because they depend on nonexistent libpng
> and main libpng package is named libpng15-15
>=20
> Package: libpng15-15
> Version: 1.5.13-r0
> Depends: libz1 (>=3D 1.2.7), libc6 (>=3D 2.16)
>=20
> Package: libpng-dev
> Version: 1.5.13-r0
> Depends: libpng (=3D 1.5.13-r0), libpng15-15
>=20
> Package: libpng-dbg
> Version: 1.5.13-r0
> Recommends: libpng (=3D 1.5.13-r0), libc6-dbg, libz-dbg
>=20
> Cheers,
>=20
> >=20
> > License md5sums differ only because of license text formatting
> > changes and because they contain version numbers and release dates.
> >=20
> > Signed-off-by: Marko Lindqvist <cazfi74-Re5JQEeQqe8AvxtiuMwx3w@public.g=
mane.org>
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >=20
> > ---
> >=20
> >  meta/recipes-multimedia/libpng/libpng_1.2.50.bb |   23 ---------------=
-------
> >  meta/recipes-multimedia/libpng/libpng_1.5.13.bb |   24 +++++++++++++++=
++++++++
> >  2 files changed, 24 insertions(+), 23 deletions(-)
> >=20
> > diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb b/meta/rec=
ipes-multimedia/libpng/libpng_1.2.50.bb
> > deleted file mode 100644
> > index 7015538..0000000
> > --- a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -SUMMARY =3D "PNG Library"
> > -DESCRIPTION =3D "PNG Library"
> > -HOMEPAGE =3D "http://www.libpng.org/"
> > -SECTION =3D "libs"
> > -LICENSE =3D "Libpng"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc3d807a85c09ebdff087f18b496=
9ff96 \
> > -                    file://png.h;beginline=3D310;endline=3D424;md5=3Db=
87b5e9252a3e14808a27b92912d268d"
> > -DEPENDS =3D "zlib"
> > -PR =3D "r0"
> > -
> > -SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpn=
g-${PV}.tar.xz"
> > -
> > -SRC_URI[md5sum] =3D "a3e00fccbfe356174ab515b5c00641c7"
> > -SRC_URI[sha256sum] =3D "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db=
9fbaff07bfd9d8e8e7"
> > -
> > -inherit autotools binconfig pkgconfig
> > -
> > -PACKAGES =3D+ "${PN}12"
> > -
> > -FILES_${PN}12 =3D "${libdir}/libpng12${SOLIBS}"
> > -RPROVIDES_${PN}-dev +=3D "${PN}12-dev"
> > -
> > -BBCLASSEXTEND =3D "native nativesdk"
> > diff --git a/meta/recipes-multimedia/libpng/libpng_1.5.13.bb b/meta/rec=
ipes-multimedia/libpng/libpng_1.5.13.bb
> > new file mode 100644
> > index 0000000..28220ad
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/libpng/libpng_1.5.13.bb
> > @@ -0,0 +1,24 @@
> > +SUMMARY =3D "PNG Library"
> > +DESCRIPTION =3D "PNG Library"
> > +HOMEPAGE =3D "http://www.libpng.org/"
> > +SECTION =3D "libs"
> > +LICENSE =3D "Libpng"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D00b5b35853278d508806c2e5860=
e82cb \
> > +                    file://png.h;beginline=3D207;endline=3D321;md5=3D5=
0e583fb60bb36f37ab5023b2a3715d1"
> > +DEPENDS =3D "zlib"
> > +PR =3D "r0"
> > +LIBV =3D "15"
> > +
> > +SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/=
libpng-${PV}.tar.xz"
> > +
> > +SRC_URI[md5sum] =3D "0b607a685da977f1bfc96e1c47055183"
> > +SRC_URI[sha256sum] =3D "b843f9cb01d10ae22acd9aaf58aceaa4a6aeb9cf78943b=
41588004b271257aee"
> > +
> > +inherit autotools binconfig pkgconfig
> > +
> > +PACKAGES =3D+ "${PN}${LIBV}"
> > +
> > +FILES_${PN}${LIBV} =3D "${libdir}/libpng${LIBV}${SOLIBS}"
> > +RPROVIDES_${PN}-dev +=3D "${PN}${LIBV}-dev"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
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

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDV3NgACgkQN1Ujt2V2gByfKwCeO7z8IrXOmFewSVdlnIFUugyh
cLoAoJ3XGmbeV1Sp1QXbBRlLnEwWgl23
=O0EG
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--
