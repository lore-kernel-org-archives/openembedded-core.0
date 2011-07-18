Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QivIq-0006kR-1C
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 23:24:36 +0200
Received: by ewy5 with SMTP id 5so1797566ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 14:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+1BHjLjmuNV24ERtq/CUUVI+ME6xlzP78l8Opw8JDYY=;
	b=MD95JwMa/SV0N5SMQAjKIDVqlGBqVrMXU9hJ/UdHi1v0Wi/QYTEgG/wwtqflKu+RvP
	YeoqvQyEatSnsUea1VhfCKccwN7B0pneJrsLrZWDE3n3Wojah1zc/x49CnN9pXueePuv
	2bAYZwdh4iR691Qv16+SsDOLdwEI3qNJwHe68=
Received: by 10.204.32.207 with SMTP id e15mr1869254bkd.60.1311024031518;
	Mon, 18 Jul 2011 14:20:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s16sm2809192fah.0.2011.07.18.14.20.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 14:20:30 -0700 (PDT)
Date: Mon, 18 Jul 2011 23:20:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: celston@katalix.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110718212021.GG3412@jama.jama.net>
References: <1309780493.20200.17.camel@desktop.home>
	<4E11DFA1.70608@slimlogic.co.uk>
	<1309795942.20200.123.camel@desktop.home>
	<4E11EDD1.1000308@slimlogic.co.uk>
	<1309798177.20200.128.camel@desktop.home>
MIME-Version: 1.0
In-Reply-To: <1309798177.20200.128.camel@desktop.home>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PROPOSAL] Package feature switches, redux.
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
X-List-Received-Date: Mon, 18 Jul 2011 21:24:36 -0000
X-Groupsio-MsgNum: 6062
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JIpyCmsTxyPLrmrM"
Content-Disposition: inline

--JIpyCmsTxyPLrmrM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 04, 2011 at 05:49:37PM +0100, Chris Elston wrote:
> On Mon, 2011-07-04 at 17:44 +0100, Graeme Gregory wrote:
> > On 07/04/2011 05:12 PM, Chris Elston wrote:
> > >> Hi, with my Angstrom cap on I like this syntax and I think it will be
> > >> really useful.
> > >>
> > >> A second level concern I have is about conflicting features, its not
> > >> something we will come across probably in DISTRO land as we are sens=
ible
> > >> enough not to select them. But users could select them in local.conf.
> > >>
> > >> Graeme
> > > As a new developer, I've discovered that there are plenty of things t=
hat
> > > you can set in local.conf which break things :D
> > >
> > > Could you please give an example of conflicting features that could
> > > cause problems, I'm not experienced enough with OE to have encountered
> > > that problem yet.
> > >
> > >
> > Cant think of a solid one off the top of my head, but I mean the cases =
where
> >=20
> > --enable-feature means that --disable-another-feature is done.
> >=20
> > This is why I listed it as a secondary issue.
> >=20
> > Graeme
>=20
> I understand. We could capture that information with an optional extra
> field in the config info something like:
>=20
> PACKAGE_CONFIG[foo] =3D "--enable-foo, --disable-foo, libfoo, <options
> which conflict with foo>"

Maybe I'm influenced a lot by gentoo, but most options are set with
--enable-foo/--disable-foo or --with-foo/--without-foo so shortcuts for
such cases would be nice instead of repeating "foo" 3 times on same line.

Also again from gentoo world.. can I say in recipe bar.bb

DEPENDS =3D "abc[foo]"
or
DEPENDS =3D "abc[-foo]"

because if some recipe depends on gstreamer with vorbis enabled it
should be easy to say it in DEPENDS then some magic python fce and if
someone tries to build it in distribution with vorbis disabled then it
should fail with message like "No provider for gstreamer[vorbis]"

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JIpyCmsTxyPLrmrM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4ko5UACgkQN1Ujt2V2gByn4QCbBzBlJPIqZY8xvOyp0ylZRPve
N24An1kb4cHyOMVRGXUmXU0QacrWOy9L
=Ugf4
-----END PGP SIGNATURE-----

--JIpyCmsTxyPLrmrM--
