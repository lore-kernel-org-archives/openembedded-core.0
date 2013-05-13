Received: from mail-pd0-f179.google.com ([209.85.192.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UbuFA-0008SC-4b
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 17:01:03 +0200
Received: by mail-pd0-f179.google.com with SMTP id q10so4459806pdj.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 07:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=I/WN32pQJ9izqvBOJ+E4WF2TWzAvHW/iF6goTMNCLFE=;
	b=WbUCxzaPs8JeYTxhh1XWIDZdEVGSb6tB0sFDXIX2IbTiJPzyQgIPuWau48nj5KKfTT
	P6FhLA7l8Qdl+rw0AG6iw/uwyvGMNWX2HUamUroLcLYOOAupY7mWG51P80f+9TYIP8oa
	ReX2HIB6+w5mU09VXoiQJhiGPlKu+MaLO6FKk7i/5E2mjKRSrzR9eo+5R6Q9Y1TPBTRS
	1DgrsWBV3sCyLMYChhDxtrAObxugehR1asbXSaXPNzXQObbEd5lQFSdKuB9Mij9J8G57
	ASqdjIoUYJdp6O4StpgY0OMT+nQAmG+8RCoPn4N3oGL1o1H5PngNwos3VUw++IdxLO3x
	MtjQ==
X-Received: by 10.68.232.2 with SMTP id tk2mr29256310pbc.99.1368456161058;
	Mon, 13 May 2013 07:42:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	yp2sm15270563pab.10.2013.05.13.07.42.38 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 13 May 2013 07:42:39 -0700 (PDT)
Date: Mon, 13 May 2013 16:42:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20130513144237.GC3187@jama>
References: <1368449357-3191-1-git-send-email-jukka.rissanen@linux.intel.com>
	<20130513133924.GB3187@jama> <5190F0EA.1090807@linux.intel.com>
	<1368453851.6920.11.camel@phil-desktop.brightsign>
MIME-Version: 1.0
In-Reply-To: <1368453851.6920.11.camel@phil-desktop.brightsign>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Mon, 13 May 2013 15:01:10 -0000
X-Groupsio-MsgNum: 39136
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Content-Disposition: inline

--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2013 at 03:04:11PM +0100, Phil Blundell wrote:
> On Mon, 2013-05-13 at 16:55 +0300, Jukka Rissanen wrote:
> > On 13.05.2013 16:39, Martin Jansa wrote:
> > >> Jukka Rissanen (5):
> > >>    connman: Add VPN support
> > >>    connman: Add OpenVPN support
> > >>    connman: Add vpnc support
> > >>    connman: Add L2TP support
> > >>    connman: Add PPTP support
> > >
> > > I think that 2-5 are missing
> > >
> > > PACKAGES =3D+ "${PN}-vpn-foo"
> > >
> >=20
> > The individual vpn plugin packages were created and added to distro=20
> > without a problem even if they were not in PACKAGES.
> > But I can certainly send another version that adds these.
>=20
> If it's using do_split_packages() then you don't need to (and shouldn't)
> add those things to PACKAGES directly.
>=20
> You might consider patching connman.inc to add the INSANE_SKIP stuff
> automatically since all the plugins will presumably need that treatment.

Ah, I've overlooked do_split_packages in 1/5 and was surprised to see
only SUMMARY/FILES additions in 2-5.

I'm sorry for noise.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGQ+90ACgkQN1Ujt2V2gBy3AgCgn5J8Fkz3bs3qbJKGAG0z7xrS
EJsAoIIpPImxcu8GCHXhOOn20ya11vq4
=Y247
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--
