Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SDcrB-0005Fw-Uh
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 16:31:14 +0200
Received: by wera1 with SMTP id a1so383480wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=z1krd7SdASGv0vsynNnf9nnrAkkP8tLmTX75BRMjflo=;
	b=GkJ5iowby0G90tGRWq1SCBpbuR/8t1+B6M23mN43RXH5fOBOqEeCwpEK0ifUF8H6+4
	asNSslo3a2VpnZuIG9FCZHoUV/OMj5fV6aWcs/lGDUiAa+U+zEKqQbgj/uxcBydJU7S0
	E4D41uOrXtRA1apjE4Rxria1nnqHcuf86eRzYARWYUtiXPZUbYDTYn9Bq3JeFRsGzYVe
	8vTOpREQv7ClMEaXxaO10VNkGnuqQ6LcRtcac2CK4SrnhlZdGnNmDvJctPf5RrYVf8mc
	mv06wk/r/aci+UsglF2Dqn7tIKs5oka/3b07328lkku/mPfeMewSj/cDImCsTfw637D1
	e9Jw==
Received: by 10.180.96.168 with SMTP id dt8mr6857789wib.18.1333117329096;
	Fri, 30 Mar 2012 07:22:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u9sm6726883wix.0.2012.03.30.07.22.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 07:22:08 -0700 (PDT)
Date: Fri, 30 Mar 2012 16:22:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120330142210.GU25815@jama.jama.net>
References: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
	<91da393da433b492fb7db038bd767c8428f24321.1332541342.git.Martin.Jansa@gmail.com>
	<1333116632.18082.72.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1333116632.18082.72.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv 05/10] pixman: add native support and perl-native to DEPENDS from meta-oe
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
X-List-Received-Date: Fri, 30 Mar 2012 14:31:14 -0000
X-Groupsio-MsgNum: 20038
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L2YZAWjVjAQ1Un1Q"
Content-Disposition: inline

--L2YZAWjVjAQ1Un1Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2012 at 03:10:32PM +0100, Richard Purdie wrote:
> On Fri, 2012-03-23 at 23:30 +0100, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb b/meta/rec=
ipes-graphics/xorg-lib/pixman_0.25.2.bb
> > index bf239d9..e4e3460 100644
> > --- a/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
> > +++ b/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
> > @@ -12,7 +12,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D14096c769a=
e0cbb5fcb94ec468be11b3 \
> >                      file://pixman/pixman-matrix.c;endline=3D25;md5=3Db=
a6e8769bfaaee2c41698755af04c4be \
> >                      file://pixman/pixman-arm-neon-asm.h;endline=3D24;m=
d5=3D9a9cc1e51abbf1da58f4d9528ec9d49b \
> >                     "
> > -DEPENDS +=3D "zlib libpng"
> > +DEPENDS +=3D "zlib libpng perl-native"
> > +BBCLASSEXTEND =3D "native"
>=20
> Er, why does this need perl-native? If it really does, the correct way
> to do this is with "inherit perlnative" and then PATH gets set
> correctly. I'd prefer not to add that dependency if its not needed
> though.

It was added 2 years ago
http://git.openembedded.org/openembedded/commit/?id=3Dc1993858d847ac17f4bd0=
0655adf5655fd9d2c6c

and it's still mandatory dep:
configure.ac:AC_PATH_PROG(PERL, perl, no)
configure.ac:if test "x$PERL" =3D xno; then
configure.ac:    AC_MSG_ERROR([Perl is required to build pixman.])

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L2YZAWjVjAQ1Un1Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk91wZIACgkQN1Ujt2V2gByKsgCdFNrUE6sZZ8/oshyYM7hfy1VP
B8YAoIt0i7Y7eNdd+kzDifzIdHxC7J9X
=Vrkf
-----END PGP SIGNATURE-----

--L2YZAWjVjAQ1Un1Q--
