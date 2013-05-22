Return-Path: <martin.jansa@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 14EE260657;
	Wed, 22 May 2013 09:17:44 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kq12so1594766pab.12
	for <multiple recipients>; Wed, 22 May 2013 02:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6tT6UaMpa3xE9FtZtGFRFS1rYd3B21DbbtG70noPLY0=;
	b=AS2Wb6aRwc10iSj0dJkIX1n434ouFY/Y7TJWwX/sBkh33j8kPl7GVBC0Z98dZxw1eJ
	XCNHQITMdR2yrErBfDDArNTUn6UoBDjQyHvN2NgEX65kW7j/Pa+MBzFHj02nZ88FYetZ
	Q23LdnaEKcaqLAF05MRyFMvHJjPYFOO4Wf5l4WduvqTEKajXbK5n7Rkg3AwQLN0YZaI7
	eh1Ab56oiaNH6wNr4rydHyVmSx3oAvbtI/tK7VIvEwyjmeJKZ+T8wtDvxxhlRd/hfGys
	ikKpQRsdBpiPyQWfNpfxOZ5O5Ve9Z3ohLzWfAZB4sYNktLL4ew+ItEsXZj3tGwJQ1zaL
	jfQg==
X-Received: by 10.66.188.137 with SMTP id ga9mr7494078pac.9.1369214265232;
	Wed, 22 May 2013 02:17:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	qh4sm7317527pac.8.2013.05.22.02.17.42 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 22 May 2013 02:17:44 -0700 (PDT)
Date: Wed, 22 May 2013 11:17:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20130522091738.GH32431@jama>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<1368650024.18324.102.camel@ted>
	<CANyK_8c4t0Oy1p8sktO-rxMfc1CR+-gbkXYH1RzDSTRy6qQORQ@mail.gmail.com>
	<CANyK_8cbVGMQkD7_KEd5KYTBxP+ZT5jY6VVVpdSAv_uY7JPY1w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANyK_8cbVGMQkD7_KEd5KYTBxP+ZT5jY6VVVpdSAv_uY7JPY1w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Wed, 22 May 2013 09:17:44 -0000
X-Groupsio-MsgNum: 39578
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h3LYUU6HlUDSAOzy"
Content-Disposition: inline

--h3LYUU6HlUDSAOzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2013 at 09:47:39AM +0100, Paul Barker wrote:
> On 16 May 2013 00:02, Paul Barker <paul@paulbarker.me.uk> wrote:
> > On 15 May 2013 21:33, Richard Purdie <richard.purdie@linuxfoundation.or=
g> wrote:
> >
> >>
> >> (e.g. when I include
> >> meta-raspberrypi, it changes the psplash logo, regardless of whether I=
'm
> >> building for the pi).
> >>
> >> In many ways the bbappend is too easy and encourages anti-social
> >> behaviour. I would recommend bouncing meta-rpi as being non yocto
> >> project compatible due to the psplash issue if it were to apply which =
it
> >> has not.
> >>
> >
> > I noticed the psplash logo when building a qemu image with
> > meta-raspberrypi included, will look into fixing it so it only goes
> > into MACHINE=3D"raspberrypi" builds. Copying in yocto@ and Andrei as
> > this is raspberrypi related.
> >
>=20
> I've just sent a patch to the yocto@ list to fix this but it's brought
> up two things:
>=20
> 1) In openembedded-core/meta/classes/image.bbclass SPLASH is set with
> '?=3D'. I'm overriding this with '=3D' in
> meta-raspberrypi/conf/machine/raspberrypi.conf which means it can't be
> overridden further in local.conf. Is this worth changing to '??=3D' in
> image.bbclass, '?=3D' in the machine conf so that it can be overridden
> with '=3D' in local.conf? Is my understanding of the overrides correct
> here?

You can still use:
SPLASH_forcevariable =3D "foo"
SPLASH_your-distro =3D "foo"
SPLASH_your-machine =3D "foo"
or any other OVERRIDE in local.conf.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h3LYUU6HlUDSAOzy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGcjTIACgkQN1Ujt2V2gBwMKwCfUFrcv2cKtSsEZ0zD0AEav2OB
mHcAoK/38y9HPleuxl+6DIEiUZ1/bEE3
=4IDx
-----END PGP SIGNATURE-----

--h3LYUU6HlUDSAOzy--
