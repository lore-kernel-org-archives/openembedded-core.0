Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S7ppJ-0002LD-Il
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 16:09:21 +0100
Received: by eaae1 with SMTP id e1so900456eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 08:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SKF53x0AHJz4luw/b2bu0TZ5m7Shhd5R6QXUEKLS/pI=;
	b=F34Mn+wdeu5WEEHniL6RFj3RFe3nhJ28SOOvMVDFk/U0PHLG4FZ9AriOqJYaWUW4Kx
	JzGBOW031oOFZIK2cPPEBBFoJbKJmr4izt86sdor0ew08iI4uh8Y+g47BvBKye9eaSvl
	HuHbdM/DHhKeyCxwsNdS83c1Vy5QWXDmY+RqkUmOArwd8GKGHwoK7TVL1IacxXjO+iro
	twHw+l3T83qEBSFK26YbdMnKSj+YJeG5jOTsBuA/WpRtm+injRHjLU49OM1137/5au98
	Snaho48ceTsOQmxGlFgr7fDMhj8Op68K8nLEmrxDvV20xajHFCqgIUHYrxO+a27+Cxus
	AvBg==
Received: by 10.213.27.24 with SMTP id g24mr239622ebc.113.1331737236246;
	Wed, 14 Mar 2012 08:00:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x8sm2348001eea.10.2012.03.14.08.00.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 08:00:35 -0700 (PDT)
Date: Wed, 14 Mar 2012 16:00:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120314150033.GJ3919@jama.jama.net>
References: <cover.1331684953.git.scott.a.garman@intel.com>
	<78b7df910bf1d5d25f5cc637a15c8e867d7bd712.1331684953.git.scott.a.garman@intel.com>
	<4F60B1F4.4040705@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F60B1F4.4040705@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 1/1] ncurses: fix packaging of moved libraries
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
X-List-Received-Date: Wed, 14 Mar 2012 15:09:21 -0000
X-Groupsio-MsgNum: 18825
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F4+N/OgRSdC8YnqX"
Content-Disposition: inline

--F4+N/OgRSdC8YnqX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2012 at 07:57:56AM -0700, Darren Hart wrote:
>=20
>=20
> On 03/13/2012 05:31 PM, Scott Garman wrote:
> > The recent move of some of the ncurses libraries to base_libdir
> > does not work with our automatic library packaging, so this
> > explicity creates packages for libncurses, libncursesw, and
> > libtinfo.
> >=20
> > Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> > ---
> >  meta/recipes-core/ncurses/ncurses.inc |   18 ++++++++++++++++--
> >  1 files changed, 16 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/=
ncurses/ncurses.inc
> > index e450868..155c0bd 100644
> > --- a/meta/recipes-core/ncurses/ncurses.inc
> > +++ b/meta/recipes-core/ncurses/ncurses.inc
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://ncurses/base/version.c;beg=
inline=3D1;endline=3D27;md5=3Dcbc
> >  SECTION =3D "libs"
> >  DEPENDS =3D "ncurses-native"
> >  DEPENDS_virtclass-native =3D ""
> > -INC_PR =3D "r5"
> > +INC_PR =3D "r6"
> > =20
> >  inherit autotools binconfig multilib_header
> > =20
> > @@ -220,6 +220,9 @@ pkg_prerm_ncurses-tools () {
> >  BBCLASSEXTEND =3D "native nativesdk"
> > =20
> >  PACKAGES +=3D " \
> > +  ${PN}-libncurses \
> > +  ${PN}-libncursesw \
>=20
> This one needs to be dependent on ENABLE_WIDEC

isn't just
ALLOW_EMPTY_${PN}-libncursesw =3D "1"
enough?

>=20
> > +  ${PN}-libtinfo \
> >    ${PN}-tools \
> >    ${PN}-terminfo \
> >    ${PN}-terminfo-base \
> > @@ -231,7 +234,18 @@ FILES_${PN} =3D "\
> >    ${bindir}/ncurses5-config \
> >    ${bindir}/ncursesw5-config \
> >    ${datadir}/tabset \
> > -  ${base_libdir}/* \
> > +"
> > +
> > +FILES_${PN}-libncurses =3D "\
> > +  ${base_libdir}/libncurses.so.* \
> > +"
> > +
> > +FILES_${PN}-libncursesw =3D "\
> > +  ${base_libdir}/libncursesw.so.* \
> > +"
>=20
> This file doesn't exist if !ENABLE_WIDEC (which is the case with
> poky-tiny for example).
>=20
> > +
> > +FILES_${PN}-libtinfo =3D "\
> > +  ${base_libdir}/libtinfo.so.* \
> >  "
> > =20
> >  # This keeps only tput/tset in ncurses
>=20
> --=20
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--F4+N/OgRSdC8YnqX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9gspEACgkQN1Ujt2V2gBz++ACfbG4Ku3lOgrvIeIbYrGziisfU
BPAAoJMm4ghSuHoDnQKlQq61Add5JnyK
=bQ9x
-----END PGP SIGNATURE-----

--F4+N/OgRSdC8YnqX--
