Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SKOs4-0005ul-Gb
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 09:00:08 +0200
Received: by wera1 with SMTP id a1so4550645wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 23:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FRovH8RLY7Ri0C3vh8OU4IJsON9ZzNLt6Wv8RKsdHRE=;
	b=0IBBu2ox4ltduMRG/3okpAMUv37Oin/JT73bLyfJi/lFdYZoG2DJhpIaGMMGT4sFgN
	gtsJu+KuFt5fliFe7m4vAfjkIWR5sGGGph9hV9auP58dQnzaKxNTsqEHaUV3B/aqdA/B
	G5X/mtU6BjXecIehES/6VHKZ8uSRa9fuJljxBdoeD4pnnYtGeh63xHQ18hAiBbok9OuU
	pHpCBjSWW1rLuh0EQp8l0VQ1JAwx9InxvJ6dzPEKAiKsbL+uy2w83kt3nLl1wSa0jp7J
	al7ymadIvQaQBrZbjqafC5c0boodkey8QL1IurcjZax7GFHwRMu7wZQBotAlPU12cxQn
	4c6w==
Received: by 10.216.139.67 with SMTP id b45mr821814wej.0.1334731841707;
	Tue, 17 Apr 2012 23:50:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n20sm52115826wiw.5.2012.04.17.23.50.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 23:50:40 -0700 (PDT)
Date: Wed, 18 Apr 2012 08:50:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120418065041.GC3635@jama.jama.net>
References: <cover.1334699033.git.sgw@linux.intel.com>
	<cad24a8ebe31104e0521b419a32b06b4cec3f93f.1334699033.git.sgw@linux.intel.com>
	<C5C354B5-E296-435A-AF64-2E23D3BBCF15@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <C5C354B5-E296-435A-AF64-2E23D3BBCF15@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/3] lsb: Add DISTRO Info to the lsb-release
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
X-List-Received-Date: Wed, 18 Apr 2012 07:00:08 -0000
X-Groupsio-MsgNum: 20929
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline

--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 18, 2012 at 08:45:23AM +0200, Koen Kooi wrote:
>=20
> Op 17 apr. 2012, om 23:46 heeft Saul Wold het volgende geschreven:
>=20
> > This is needed for distro checking code in the self-hosted-image
> >=20
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> > meta/recipes-extended/lsb/lsb_1.4.bb |    5 +++++
> > 1 files changed, 5 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb b/meta/recipes-extend=
ed/lsb/lsb_1.4.bb
> > index f2f25ba..e414d93 100644
> > --- a/meta/recipes-extended/lsb/lsb_1.4.bb
> > +++ b/meta/recipes-extended/lsb/lsb_1.4.bb
> > @@ -4,6 +4,8 @@ HOMEPAGE =3D "http://prdownloads.sourceforge.net/lsb"
> > LICENSE =3D "GPLv2+"
> > PR =3D "r2"
> >=20
> > +DEPENDS=3D"util-linux"
> > +
> > LIC_FILES_CHKSUM =3D "file://README;md5=3D12da544b1a3a5a1795a21160b4947=
1cf"
> >=20
> > SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/${PV}/lsb-re=
lease-${PV}.tar.gz \
> > @@ -31,6 +33,9 @@ do_install(){
> > 		echo -n "core-4.1-${TARGET_ARCH}" >>  ${D}/etc/lsb-release
> > 	fi
> > 	echo "\"" >> ${D}/etc/lsb-release
> > +	echo "DISTRIB_ID=3D${DISTRO}" >> ${D}/etc/lsb-release
> > +	echo "DISTRIB_RELEASE=3D${DISTRO_VERSION}" >> ${D}/etc/lsb-release
> > +	echo "DISTRIB_DESCRIPTION=3D\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> =
${D}/etc/lsb-release
>=20
> MIssing PR bump

And spaces around =3D in added DEPENDS

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+OZEEACgkQN1Ujt2V2gBy2tgCgi99YEYib3nuisHj3ggEFshjK
B1AAoJGd6ICvdWHLXlZpdhOIKh+p/Ymj
=vL3q
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
