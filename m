Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QUbmr-0003w4-0o
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 11:44:25 +0200
Received: by bwz5 with SMTP id 5so1349175bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 02:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=y0rJm0fq4zQR3lvian6H2B+bwe5flR8niLmLvVQZAxk=;
	b=iQ15x/M+qcG1l4AqUQgWv3ErJU8FJxgqQZQBOrqe/P2M1z/pQCQH0Avf0mhbkrANHV
	QaIp4kn+7Y4/D8IGIE9sn+g/ajOCbgP2nV+YNVOm03GeXGGN7kmrf9mp2PU0bewnw9TE
	VpN2WH4xlA4+RICF9CqIxsDCQIM18BpDtraVs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=B+hjByzZ3BKhqK+XaM80P0VduwwZ6zIxmIMFbYDFprDc+RdzUluwtEsG5hf9XLbLAt
	iMDGGnkp3XPFvbHvLhFv2AVbZ6fbv2P6icWoZnnnRyHgypFH0VTwR9kKiWjvwjxVMoHn
	uvydSe+1tZTqpsX60U7FrOBbSeNyZy+ndtiU4=
Received: by 10.204.7.211 with SMTP id e19mr495765bke.139.1307612465094;
	Thu, 09 Jun 2011 02:41:05 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id l24sm1381036bkw.15.2011.06.09.02.41.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 02:41:03 -0700 (PDT)
Date: Thu, 9 Jun 2011 11:40:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110609094057.GK23137@jama.jama.net>
References: <20110609083834.GJ23137@jama.jama.net>
	<4CF34C23-9241-4FB5-9E00-C506FF597050@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <4CF34C23-9241-4FB5-9E00-C506FF597050@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: LOCALCOUNT increased twice when there are 2 layers with same git recipe
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
X-List-Received-Date: Thu, 09 Jun 2011 09:44:25 -0000
X-Groupsio-MsgNum: 3795
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n83H03bbH672hrlY"
Content-Disposition: inline

--n83H03bbH672hrlY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2011 at 10:58:58AM +0200, Koen Kooi wrote:
>=20
> Op 9 jun 2011, om 10:38 heeft Martin Jansa het volgende geschreven:
>=20
> > Hi,
> >=20
> > I was wondering why I see gobject-introspection built on every image
> > build and it's because LOCALCOUNT is changing all the time.
> >=20
> > OE om-gta02@shr ~/shr-core $ find openembedded-core/ -name gobject-intr=
ospection\*
> > openembedded-core/meta/recipes-gnome/gnome/gobject-introspection_git.bb
> > SRCREV =3D "efa7266bcf78478ce62e8dd778a4f0417bfd4d15"
> > PV =3D "0.10.8+git${SRCPV}"
> >=20
> > OE om-gta02@shr ~/shr-core $ find meta-openembedded/ -name gobject-intr=
ospection\*
> > meta-openembedded/meta-oe/recipes-gnome/gnome/gobject-introspection_0.9=
=2E10.bb
> > meta-openembedded/meta-oe/recipes-gnome/gnome/gobject-introspection_git=
=2Ebb
> > SRCREV =3D "8d64bc23d2b837421ecf9c7b0e4b8d5d95ca0d21"
> > PV =3D "1.29.0+gitr${SRCPV}"
> >=20
> > I had to add gobject-introspection_git.bb to meta-oe, because we're
> > using newer glib with gdbus-codegen included (instead separate
> > gdbus-binding-tool we were using before)
> > meta-openembedded/meta-oe/recipes-core/glib-2.0/glib-2.0_git.bb with
> > SRCREV =3D "d97cbc6731deab137770bc0fe9c69b06f689f5b4"
> > PV =3D "2.29.3+gitr${SRCPV}"
> > and default gobject-introspection version is not compatible with it.
> >=20
> > Problem is that with 2 _git recipes LOCALCOUNT is incremented twice
> > because there are 2 different SRCREVs found during parsing.
> >=20
> > I wanted to use gobject-introspection_git.bbappend, but it looks like
> > changing PV/SRCREV from .bbappend is not supported
>=20
> And with SRCREV_pn-${PN} =3D "34932849328" ?

Thanks! this works
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3De332=
258bcd9c39dd9b6a3937a1d6937e7e9ed8c5

I had similar problem >year ago after renaming linux-openmoko
git recipes to PN_PV scheme
http://thread.gmane.org/gmane.comp.handhelds.openembedded/32950
but there it wouldn't be enough if different machines needs different
version. Good that I don't need this usecase anymore :).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--n83H03bbH672hrlY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3wlSkACgkQN1Ujt2V2gBxqhACfWrqer0/JGiwesTAmg/xgkTc4
IiAAn0G+kE51sVTQ8yeILjycy59Wcd3o
=1BeY
-----END PGP SIGNATURE-----

--n83H03bbH672hrlY--
