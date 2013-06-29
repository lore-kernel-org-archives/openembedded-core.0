Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 950DA6A413
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 15:30:21 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id n57so2100828wev.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 08:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/mUF7k2TNCKhKddEWyb3JqX6Poa9P39QAPRtn8c58tQ=;
	b=JWYtR4WXUZ42H6ED/FngYoE85AmwvsT08ViK03BdQxTOlNUnetT5FwESu1PLYqitMS
	GrJwEgIQJnREa4OGa9QZWyBmGzlK7ZOdRpMXRrb9TrlIUESW1g9iF7P8BAjXWY1n3vVG
	+lzwWZ7Q9WiLvTkp7gFaxUrjozIy5T6mdaRpIjfIO5kpumecsdXgCAfeTsyz1KVD99SF
	zB6PPnagtz3UGyPIupBfWQbUZPg+HB2zKpj/ZbK67r5QgbjiDjWohJAPn5mZ77Y3/O65
	YCA/eAGtivTEwf++SZphvz/nE0jClf0rxPe1Hgh6LPAD0QHYG3H72oaM9atwqCmLPISu
	9d8w==
X-Received: by 10.180.185.84 with SMTP id fa20mr6851183wic.49.1372519821604;
	Sat, 29 Jun 2013 08:30:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	o5sm17531648eef.5.2013.06.29.08.30.20 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 29 Jun 2013 08:30:21 -0700 (PDT)
Date: Sat, 29 Jun 2013 17:31:01 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130629153101.GV3261@jama>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
MIME-Version: 1.0
In-Reply-To: <408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Sat, 29 Jun 2013 15:30:21 -0000
X-Groupsio-MsgNum: 41199
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NQqDiQVflaif2hna"
Content-Disposition: inline

--NQqDiQVflaif2hna
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2013 at 07:11:35AM -0700, Khem Raj wrote:
>=20
> On Jun 28, 2013, at 10:38 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > On Fri, Jun 28, 2013 at 03:03:39PM -0700, Khem Raj wrote:
> >>=20
> >>  generate-manifest-3.3.py: Add script to generate python 3.3 manifests
> >>  python-3.3-manifest: Add python3 manifest file
> >=20
> >>  classes: Add distutils for python3
> >>  setuptools.bbclass: Use python-distribute instead of
> >>    python-setuptools
> >>  distutils3.bbclass: Port the distutils class fix to handle filenames
> >>    with spaces
> >>  setuptools3.bbclass: Remove useless multiline comment
> >>  distutils: Introduce PYTHON_ABI variable
> >>  distutils3: Do build_ext as separate step during compile
> >=20
>=20
> > I think these 2 groups could be squashed together for easier review, but
>=20
> do you mean create just two patches out of those ?

Yes

> > otherwise great work, thanks for doing it!
> >=20
> > I'll add them to jenkins a bit later when I get some better build that
> > what we have now.
>=20
> They were added in order that the build keeps working with every commit f=
or helping bisects on tree later

I meant that e.g.=20
  classes: Add distutils for python3
introduces setuptools3.bbclass and
  setuptools3.bbclass: Remove useless multiline comment
just 3 commits later fixes that, the same with the left-over commit I
mentined in other thread which was also resolved by some follow up
commit, with all new .bbclasses together I would read them just once.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NQqDiQVflaif2hna
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHO/bUACgkQN1Ujt2V2gBzf5QCcDt5tw+Lfs4KPE+m0zANSQEz/
ey8AoK71TYXnQPWQJ1YJTvbMg2yaan8O
=psui
-----END PGP SIGNATURE-----

--NQqDiQVflaif2hna--
