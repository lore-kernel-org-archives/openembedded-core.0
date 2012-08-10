Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzojH-0000AT-PI
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 14:54:15 +0200
Received: by weyr6 with SMTP id r6so892069wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 05:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U900sfVovl1LXhytE7we8/REixN4VooOwOJsR1mywT4=;
	b=nn+qgmsx+ZI5mbXG5+N4QxHJwxhPg6jD8IhYMorEBH4c+bEbvCRLE3T61JBSPIvjtC
	zV0j3cN/k9H921QwRTIhaviRoPyqEuLiI2BjuMYnyQT0MF5K6+Q3YAljqGYm68P8ZwEr
	IJNMP968WrZumAO0IeEN2B6VFyhpbOLOSRsYOoJPbyt09TNspAYs6JJzNR61Kh2pmYiV
	qexrN7BwA0vO5s28ol36OWYelZm/FSyVFqKbbUX4w1vxhhalwWbylleKs66ozH876yl6
	XWrRnaaUBhYnka4atHuUInVCJczW4L3AhUQwDXmXHxN5MJ5XfRrG6s/39b0n37D+z+m/
	5dCQ==
Received: by 10.180.105.6 with SMTP id gi6mr5787998wib.4.1344602546179;
	Fri, 10 Aug 2012 05:42:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm11217861wix.6.2012.08.10.05.42.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 05:42:25 -0700 (PDT)
Date: Fri, 10 Aug 2012 14:42:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120810124226.GB6176@jama.jama.net>
References: <1344475516-27640-1-git-send-email-raj.khem@gmail.com>
	<9145620D-0D9C-4269-9ED4-B0E2E81086E3@dominion.thruhere.net>
	<1344602296.8427.21.camel@lenny>
MIME-Version: 1.0
In-Reply-To: <1344602296.8427.21.camel@lenny>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 01/12] gcc: Switch SRC_URI to use svn
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
X-List-Received-Date: Fri, 10 Aug 2012 12:54:15 -0000
X-Groupsio-MsgNum: 27265
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline

--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 10, 2012 at 08:38:16AM -0400, Colin Walters wrote:
> On Fri, 2012-08-10 at 10:03 +0200, Koen Kooi wrote:
> > Op 9 aug. 2012, om 03:25 heeft Khem Raj <raj.khem@gmail.com> het volgen=
de geschreven:
> >=20
> > > svn tar balls are 96M as compared to 1.3G git tars
> > > its unnessary to suck in that much of data.
> >=20
> > That's indeed a big difference and also expected, with svn you only get=
 revision N and N-1, with git you get everything. But even so, I can fetch =
that 1.3GB a *lot* faster than that 0.1GB svn. Maybe I'm on the wrong side =
of the ocean, but that gcc svn server is sloooooooooooooooooooooow.
>=20
> Couldn't OE do the initial git clone with --depth=3D1?

That doesn't work very well when SRCREV is set to revision older then
HEAD^1.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAlAbIACgkQN1Ujt2V2gBzvAgCgiqcjGvU1lQqCbf4+bUXSMrYI
MhwAoJ3p9Fp/ibQ/azplgFUFa7tFpa+W
=y1D7
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
