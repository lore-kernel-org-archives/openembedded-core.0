Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SmTWz-00043a-Ok; Wed, 04 Jul 2012 19:38:25 +0200
Received: by wgbdr1 with SMTP id dr1so6882439wgb.24
	for <multiple recipients>; Wed, 04 Jul 2012 10:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=g8w6doAIMfK6sEd44P8Paf5YC0abD5VcWtLmlUX1Mbs=;
	b=s0XaWuyrDKfi4Lk5SiBShOaIyApuDeFory9mX47UGU7EI/TkzJNWv1jY5p5zVM84EP
	MR5M8z5Rfgh9FEuMThc5Jnb/D+G81g5kDu+3cK//rqVfcuMolG+V2R6rVHsqza6RDct4
	NrI4zaHHVp2mcYoSG8LRN5HOhVpmBfit9vtU9++9Zr9PMBnHW6CqFdAdpUaLeUAMYyuX
	WTiCLrPXEW/qnYUmatPJHuvhF5l/pqVX4csfN/J3euTKFVi2UtjADysnKcvNdCDOiUrl
	28zvhrhiPa+5Nqy1q2uTBhHLvu9+k5JJ4bxjqrvwQSrjNRs1Q2ikhVAlFS7IeqBLnyOr
	VMyg==
Received: by 10.180.105.234 with SMTP id gp10mr18903763wib.11.1341422842534;
	Wed, 04 Jul 2012 10:27:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id db7sm37844075wib.6.2012.07.04.10.27.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Jul 2012 10:27:21 -0700 (PDT)
Date: Wed, 4 Jul 2012 19:27:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Message-ID: <20120704172715.GH15100@jama.jama.net>
References: <20120625153328.B76A81033A@opal>
	<20120628192018.GB5532@localhost.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120628192018.GB5532@localhost.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Paul Gortmaker : linux-firmware: update to main repo on kernel.org
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
X-List-Received-Date: Wed, 04 Jul 2012 17:38:26 -0000
X-Groupsio-MsgNum: 24678
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0NB0lE7sNnW8+0qW"
Content-Disposition: inline

--0NB0lE7sNnW8+0qW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2012 at 09:20:18PM +0200, Martin Jansa wrote:
> On Mon, Jun 25, 2012 at 03:33:28PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: b9d42ec94dfcbe92ce2a857045a0e3678c05c26c
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3Db9d42ec94dfcbe92ce2a857045a0e3678c05c26c
> >=20
> > Author: Paul Gortmaker <paul.gortmaker@windriver.com>
> > Date:   Fri Jun 22 10:15:07 2012 -0400
> >=20
> > linux-firmware: update to main repo on kernel.org
> >=20
> > This is now the authoratative repository, taking updates.
> > The latest has a couple updated license files, vs. the previous
> > srcrev that was used.
> >=20
> > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> >=20
> > ---
> >=20
> >  .../linux-firmware/linux-firmware_git.bb           |   10 +++++-----
> >  1 files changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b=
/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > index 3675978..8aacce4 100644
> > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > @@ -7,23 +7,23 @@ SECTION =3D "kernel"
> > =20
> >  LICENSE =3D "Proprietary"
> > =20
> > -LIC_FILES_CHKSUM =3D "file://LICENSE.radeon_rlc;md5=3D4c243f7854d2884b=
483abda991adef43 \
> > +LIC_FILES_CHKSUM =3D "file://LICENSE.radeon;md5=3De56b405656593a0c97e4=
78513051ea0e \
> >                      file://LICENSE.dib0700;md5=3Df7411825c8a555a1a3e5e=
ab9ca773431 \
> >                      file://LICENCE.xc5000;md5=3D1e170c13175323c32c7f4d=
0998d53f66 \
> >                      file://LICENCE.ralink-firmware.txt;md5=3Dab2c26927=
7c45476fb449673911a2dfd \
> >                      file://LICENCE.qla2xxx;md5=3D4005328a134054f0fa077=
bdc37aa64f2 \
> > -                    file://LICENCE.iwlwifi_firmware;md5=3D311cc823df5b=
1be4f00fbf0f17d96a6b \
> > +                    file://LICENCE.iwlwifi_firmware;md5=3D11545778abf7=
8c43d7644d4f171ea1c7 \
> >                      file://LICENCE.i2400m;md5=3D14b901969e23c41881327c=
0d9e4b7d36 \
> >                      file://LICENCE.atheros_firmware;md5=3D30a14c7823be=
edac9fa39c64fdd01a13 \
> >                      file://LICENCE.agere;md5=3Daf0133de6b4a9b2522defd5=
f188afd31 \
> >                      file://LICENCE.rtlwifi_firmware.txt;md5=3D00d06cfd=
3eddd5a2698948ead2ad54a5 \
> >                     "
> > =20
> > -SRCREV =3D "15888a2eab052ac3d3f49334e4f6f05f347a516e"
> > +SRCREV =3D "e98750f0d68d0037ce5a186f7f863a9c13bf773a"
> >  PV =3D "0.0+git${SRCPV}"
> > -PR =3D "r1"
> > +PR =3D "r2"
> > =20
> > -SRC_URI =3D "git://git.infradead.org/users/dwmw2/linux-firmware.git;pr=
otocol=3Dgit"
> > +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/li=
nux-firmware.git;protocol=3Dgit"
>=20
> changing git URL (or even just branch) in recipe with SRCPV in PV resets =
LOCALCOUNT to zero..
> so breaks upgrade path.
>=20
> Bump PE or PV to fix that!

Ping,

> NOTE: package linux-firmware-0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13b=
f773a-r2: task do_package: Started
> ERROR: Package version for package linux-firmware-sd8686 went backwards w=
hich would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f=
6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> ERROR: Package version for package linux-firmware-rtl8192cu went backward=
s which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334=
e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-=
r2)
> ERROR: Package version for package linux-firmware-rtl8192ce went backward=
s which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334=
e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-=
r2)
> ERROR: Package version for package linux-firmware-rtl8192su went backward=
s which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334=
e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-=
r2)
> ERROR: Package version for package linux-firmware-wl12xx went backwards w=
hich would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f=
6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> ERROR: Package version for package linux-firmware-dbg went backwards whic=
h would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f0=
5f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> ERROR: Package version for package linux-firmware-staticdev went backward=
s which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334=
e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-=
r2)
> ERROR: Package version for package linux-firmware-dev went backwards whic=
h would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f0=
5f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> ERROR: Package version for package linux-firmware-doc went backwards whic=
h would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f0=
5f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> ERROR: Package version for package linux-firmware-locale went backwards w=
hich would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f=
6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> ERROR: Package version for package linux-firmware went backwards which wo=
uld break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f34=
7a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> NOTE: package linux-firmware-0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13b=
f773a-r2: task do_package: Succeeded
>=20
> Cheers,
>=20
> > =20
> >  S =3D "${WORKDIR}/git"
> > =20
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

--0NB0lE7sNnW8+0qW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/0fPMACgkQN1Ujt2V2gByOlwCghjjtYv/EfrqnZnkapk6/rt82
O5cAn1ALWZQqrHsDTHSEOU7/n1R0p4+F
=rloO
-----END PGP SIGNATURE-----

--0NB0lE7sNnW8+0qW--
