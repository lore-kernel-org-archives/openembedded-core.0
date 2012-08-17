Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T2M1G-0004gK-QN
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 14:51:18 +0200
Received: by weyr6 with SMTP id r6so2520440wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jDEZwXjtIdnHvapFGHcLe5zq1XxnCehdHodYWlXx5RY=;
	b=MsPiMC5WEwg62TGeXbmsz1lQ4istF+d5PR0Xuj+BQ4s/82QvOqYBMTvOmxNLtkuYtM
	gxyciHV0pO7mppPkCiQnGdRgUPBOdNGII/9VpgRFFY4jaTdUEcaYSWpXcgq2x4clvQQa
	e+r8ZvXGqzLZTfc29qXtbVLg7if2DP4X8+vOV34SuSfxDPFSsFWT0jAG9A3OZ34BZL8B
	n3pRGy0EK8oo11jeiftStzMJTTi1RUgmNX3PHpcVie62P+SqgijcA8hmXhdYklkDe6JG
	zi9QSP2VTxoUBwKMCOgZ1B+vE/CL4uo3JAnbHc7LU6hR0fCdwWS39Ll3Wu9Fjsr9bcx3
	9iFw==
Received: by 10.216.134.216 with SMTP id s66mr2353686wei.26.1345207160298;
	Fri, 17 Aug 2012 05:39:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z11sm14292978wiv.10.2012.08.17.05.39.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 05:39:19 -0700 (PDT)
Date: Fri, 17 Aug 2012 14:39:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120817123916.GJ3625@jama.jama.net>
References: <cover.1345203203.git.ross.burton@intel.com>
	<4141908.n3IAyUAFPz@helios> <20120817123017.GI3625@jama.jama.net>
	<3890692.qcbBpDRmfO@helios>
MIME-Version: 1.0
In-Reply-To: <3890692.qcbBpDRmfO@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Remove older GTK+ versions
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
X-List-Received-Date: Fri, 17 Aug 2012 12:51:18 -0000
X-Groupsio-MsgNum: 27711
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jIYo0VRlfdMI9fLa"
Content-Disposition: inline

--jIYo0VRlfdMI9fLa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2012 at 01:32:59PM +0100, Paul Eggleton wrote:
> On Friday 17 August 2012 14:30:17 Martin Jansa wrote:
> > On Fri, Aug 17, 2012 at 01:27:20PM +0100, Paul Eggleton wrote:
> > > On Friday 17 August 2012 12:35:07 Ross Burton wrote:
> > > > If someone still wants to use them, meta-oe is a better place for t=
hem
> > > > to
> > > > live.
> > >=20
> > > As a general note, personally I'd rather that no more alternative ver=
sions
> > > of anything be added to meta-oe.
> >=20
> > Yes especially with DEFAULT_PREFERRENCE not working between layers.. so
> > everyone with meta-oe and without P_V set, would get this old version..
>=20
> The best plan it would seem to me would be to have a separate meta-archiv=
e or=20
> meta-attic or similar named layer for these older recipes, and set its la=
yer=20
> priority to the same as OE-Core.

Should I file a but to fix DEFAULT_PREFERENCE between layers?=20

Because there is also use case when newer development version is added=20
to e.g. meta-oe with negative D_P and only users who decide to test/use
that version should get it, if they define P_V for this new version.

Currently it would became default version for all meta-oe users without
P_V specified, which isn't very intuitive.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jIYo0VRlfdMI9fLa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAuO3QACgkQN1Ujt2V2gBzSIQCeKVI6rZ3YJ5vHHdKFoNjdhGRf
RGQAoI7S6RmYOOh4W3mA47MiKoJdQor0
=EBbj
-----END PGP SIGNATURE-----

--jIYo0VRlfdMI9fLa--
