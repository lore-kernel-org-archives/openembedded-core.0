Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REbeB-0005CZ-Of
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 08:53:35 +0200
Received: by eyd9 with SMTP id 9so860176eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 23:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MVH80MVzVAxVQVlzFmcy56Q+WToCcocrr8cl5acMEyY=;
	b=DI7dEmqboaNepg5Aes8YFq5N7dgF9kq6BwKKEykWJBRUb87FU/Zwzc7QKCgKT7kHK/
	orxnrPBHxmIw6INGE6budrPbjCl7nFOLzyGYopOXcZrO8Rfn0pMdYr6k92KVW7/JgH9m
	+P8enoSimWxZbqrt6vrRkfeSMxrZYqeBRZJYQ=
Received: by 10.223.61.211 with SMTP id u19mr1991792fah.29.1318574727100;
	Thu, 13 Oct 2011 23:45:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x4sm905174fad.1.2011.10.13.23.45.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 23:45:25 -0700 (PDT)
Date: Fri, 14 Oct 2011 08:45:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111014064518.GB3542@jama.jama.net>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
	<6c75399b6bd39f4eafaf4b4964cab9e3273dd7a2.1318505196.git.Martin.Jansa@gmail.com>
	<CAMKF1sozmZ-meS18DmRejQppG9pSpvxkTosodibbcf38z6OK2w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sozmZ-meS18DmRejQppG9pSpvxkTosodibbcf38z6OK2w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-core 07/20] mesa-common: MesaDemos is now separate recipes, bump PE, introduce INC_PR
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
X-List-Received-Date: Fri, 14 Oct 2011 06:53:35 -0000
X-Groupsio-MsgNum: 10992
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline

--98e8jtXdkpgskNou
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 04:45:06PM -0700, Khem Raj wrote:
> On Thu, Oct 13, 2011 at 4:30 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > =A0meta/recipes-graphics/mesa/mesa-common.inc =A0 | =A0 =A05 +++--
> > =A0meta/recipes-graphics/mesa/mesa-dri_7.11.bb =A0| =A0 =A02 +-
> > =A0meta/recipes-graphics/mesa/mesa-dri_git.bb =A0 | =A0 =A02 +-
> > =A0meta/recipes-graphics/mesa/mesa-xlib_7.11.bb | =A0 =A03 +--
> > =A04 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-=
graphics/mesa/mesa-common.inc
> > index fb9a216..ee359ba 100644
> > --- a/meta/recipes-graphics/mesa/mesa-common.inc
> > +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> > @@ -12,9 +12,10 @@ SECTION =3D "x11"
> > =A0LICENSE =3D "MIT"
> > =A0LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D7a3373c039b6b92=
5c427755a4f779c1d"
> >
> > -SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.ta=
r.bz2;name=3Dmesalib \
> > - =A0 =A0 =A0 =A0 =A0 ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaDemo=
s-${PV}.tar.bz2;name=3Dmesademos "
> > +INC_PR =3D "r12"
> > +PE =3D "2"
>=20
> Do u really need PE ?

Yes because I wanted upgrade path for meta-oe users.. (same with PE
bumping patches for xserver-xorg and xorg-drivers..)

>=20
> >
> > +SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.ta=
r.bz2"
> > =A0S =3D "${WORKDIR}/Mesa-${PV}"
> >
> > =A0PROVIDES =3D "virtual/libgl"
> > diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes=
-graphics/mesa/mesa-dri_7.11.bb
> > index 5f15091..5f14346 100644
> > --- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
> > +++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
> > @@ -7,7 +7,7 @@ LIB_DEPS =3D "libdrm virtual/libx11 libxext libxxf86vm =
libxdamage libxfixes expat
> > =A0DEPENDS =3D "${PROTO_DEPS} =A0${LIB_DEPS} makedepend-native python-n=
ative"
> > =A0DEPENDS +=3D "mesa-dri-glsl-native"
> >
> > -PR =3D "r5"
> > +PR =3D "${INC_PR}.0"
> >
> > =A0SRC_URI =3D "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.=
tar.bz2 \
> > =A0 =A0 =A0 =A0 =A0 =A0file://crossfix.patch \
> > diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-=
graphics/mesa/mesa-dri_git.bb
> > index 9e32d0a..c50ba15 100644
> > --- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
> > +++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
> > @@ -13,7 +13,7 @@ DEPENDS =3D "${PROTO_DEPS} =A0${LIB_DEPS}"
> >
> > =A0SRCREV =3D "1bf94d419805538ac23a4d0b04d31ac5e4487aca"
> > =A0PV =3D "7.7+git${SRCPV}"
> > -PR =3D "r2"
> > +PR =3D "${INC_PR}.0"
> >
> > =A0# most of our targets do not have DRI so will use mesa-xlib
> > =A0DEFAULT_PREFERENCE =3D "-1"
> > diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipe=
s-graphics/mesa/mesa-xlib_7.11.bb
> > index 8b83378..1e0d821 100644
> > --- a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
> > +++ b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
> > @@ -12,8 +12,7 @@ LIB_DEPS =3D "virtual/libx11 libxext libxxf86vm libxd=
amage libxfixes libxml2-nativ
> >
> > =A0DEPENDS =3D "${PROTO_DEPS} =A0${LIB_DEPS} makedepend-native"
> >
> > -PE =3D "1"
> > -PR =3D "r1"
> > +PR =3D "${INC_PR}.0"
> >
> > =A0EXTRA_OECONF +=3D "--with-driver=3Dxlib --without-gallium-drivers"
> >
> > --
> > 1.7.7
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6X2n4ACgkQN1Ujt2V2gBzC8ACdFlpD01PNwqr89yR0QtpCu3TO
IToAn3Sxc9zY1hRBGHt+nIphyvi28lED
=lpjH
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
