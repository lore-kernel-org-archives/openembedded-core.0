Received: from mail-bw0-f51.google.com ([209.85.214.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QUcaU-0000Jl-0v
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 12:35:42 +0200
Received: by bwz10 with SMTP id 10so1446619bwz.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 03:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=opSUzy9BRoAOqNWRbJM8Vs95r1WXlyWvRx77D466InY=;
	b=Ms8I6W6G+HdY4owvvnfykeXkAjwvID+CcmiPwr450uqL/E/xNa5ZYLqA9HqeHIycE5
	DFZpBb/CpaFs7DVei4XrrCKg2Q2g7X9Ti30uCemHy6rXJhbccTFY6Na6EuT+xJ5E3JIt
	oDnSIim3Z3OkhZ7Bxro5huF4Mybpvf2T13VOQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=mg3tS7EzoOGvgacG/HDta5AnWNA5Ycj3ULgTS9YeaCn/pE5KOIASVT1Zifv67fI2cF
	2huPl5LYej2POgTwAwjIdb/4Pghr1rfAZHgYp7BDCKKXs2Ks80O/z9Qq1CG2ADdN8KzH
	SXuB1sVkzjtd8/57FfFMJP+KblgN8MQeZyiiM=
Received: by 10.204.19.80 with SMTP id z16mr540128bka.198.1307615541964;
	Thu, 09 Jun 2011 03:32:21 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id k16sm1422803bks.13.2011.06.09.03.32.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 03:32:20 -0700 (PDT)
Date: Thu, 9 Jun 2011 12:32:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110609103214.GL23137@jama.jama.net>
References: <20110609083834.GJ23137@jama.jama.net>
	<1307611500.15712.133.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1307611500.15712.133.camel@rex>
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
X-List-Received-Date: Thu, 09 Jun 2011 10:35:42 -0000
X-Groupsio-MsgNum: 3796
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z9sQuz+HmDh2hVO4"
Content-Disposition: inline

--z9sQuz+HmDh2hVO4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 09, 2011 at 10:24:59AM +0100, Richard Purdie wrote:
> On Thu, 2011-06-09 at 10:38 +0200, Martin Jansa wrote:
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
> > changing PV/SRCREV from .bbappend is not supported (bitbake-layers also
> > reported that it cannot find right gobject-introspection version to my
> > bbappend. And I also cannot blacklist gobject-introspection_git.bb from
> > oe-core, because Angstrom blacklister uses only PN. So in the end I've
> > removed that recipe from my oe-core-contrib/shr branch which is used for
> > SHR builds..
> >=20
> > Is there better way to resolve this? With more layers enabled this could
> > happen more often imho.. Maybe we could add unexpanded -PV to LOCALCOUNT
> > persistent db key with sideeffect of reseting LOCALCOUNT on every PV
> > change (upgrade to newer version).
>=20
> I like this idea at least in principle. If you're changing PV, you don't
> mind if the counter resets so I don't see that as a problem...

But it would need fallback to key without -PV in case PN-PV is not found
to prevent LOCALCOUNT breakage like branch addition to key did, also
it's a bit harder to test older bitbake after such change (as fallback
will work only one-way).

http://git.openembedded.org/cgit.cgi/bitbake/commit/?id=3D8c0afc13ad5eefea6=
2b0b136f5b66792ba4e44cb

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z9sQuz+HmDh2hVO4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3woS4ACgkQN1Ujt2V2gBzFTQCcCDrLOm+CuxZX4vZZjfmWYDR2
UakAoKlA5wQUrNnOLD7QBM1QZp3kCXpd
=s0Aj
-----END PGP SIGNATURE-----

--z9sQuz+HmDh2hVO4--
