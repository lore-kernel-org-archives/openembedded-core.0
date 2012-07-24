Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1Stabu-0005OU-DJ; Tue, 24 Jul 2012 10:36:54 +0200
Received: by bkcik5 with SMTP id ik5so4739276bkc.6
	for <multiple recipients>; Tue, 24 Jul 2012 01:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yW86OtGSPj8fdgzEFdxEqUBD6sYHLhAsxnwu7iePPpM=;
	b=bzjqups9SlRvXU/yEmxCy4rXaTbPXMR7XNmADAPjU+gcytDLlJBPLjxslFuyLyr7Pr
	4HzTs6nsameQvWSaSN2dUJnA+Vqqgc0/5zhzOPhRti0vgo/8+1PDUM269fUlKRzhNGMX
	Zuafiho/viFWkjqQR8CNqp1uvFPzCr4ElP2azZli/Cn6vPlD0iMOr0cckyBcSOpteuaI
	9Gn4tvLj+gNsnVN+0WA2Nz/PYCVL5CqtUqbq52Zb3dh/3pPcUeKq7ifkCwYqyC8DrQg/
	TqlEbDkIipvwmTySiTWaaaU12USi0KJ+o3b2gPy0JH3Rbr3J9An2VI+YK+k0TX7bB4kh
	Hm1A==
Received: by 10.204.154.215 with SMTP id p23mr9578693bkw.53.1343118326579;
	Tue, 24 Jul 2012 01:25:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm9733167bks.6.2012.07.24.01.25.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 01:25:25 -0700 (PDT)
Date: Tue, 24 Jul 2012 10:25:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120724082527.GH3271@jama.jama.net>
References: <20120722104358.0339C10217@opal>
	<20120723111829.GA20311@jama.jama.net>
	<1343043175.21788.91.camel@ted>
	<20120723113712.GE3271@jama.jama.net>
	<1343048532.21788.95.camel@ted>
	<20120723130612.GF3271@jama.jama.net>
	<20120724075740.GG3271@jama.jama.net>
	<1343117846.21788.116.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1343117846.21788.116.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Morgan Little : python: Update for python-native changes
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
X-List-Received-Date: Tue, 24 Jul 2012 08:36:54 -0000
X-Groupsio-MsgNum: 26052
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUk9VBj82R8Xhb8H"
Content-Disposition: inline

--SUk9VBj82R8Xhb8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 24, 2012 at 09:17:26AM +0100, Richard Purdie wrote:
> On Tue, 2012-07-24 at 09:57 +0200, Martin Jansa wrote:
> > On Mon, Jul 23, 2012 at 03:06:12PM +0200, Martin Jansa wrote:
> > > On Mon, Jul 23, 2012 at 02:02:12PM +0100, Richard Purdie wrote:
> > > > On Mon, 2012-07-23 at 13:37 +0200, Martin Jansa wrote:
> > > > > On Mon, Jul 23, 2012 at 12:32:55PM +0100, Richard Purdie wrote:
> > > > package-index doesn't inherit pythonnative. The python found from e=
nv
> > > > would therefore be the host system python but its using files from =
the
> > > > sysroot. Mixing the two is a bad idea.
> > > >=20
> > > > The question is how is it mixing these up, the host system python
> > > > shouldn't be looking there for modules.
> > > >=20
> > > > So I'm not sure why they're getting mixed up but its likely the pro=
blem.
> > > > Does anything jump out at you on the machine in question with the a=
bove
> > > > in mind?
> > >=20
> > > Not really and it happens only in some builds (all today - haven't se=
en
> > > this error before) and sofar it failed in 4/10 image/feed builds and
> > > worked in remaining 6.
> > >=20
> > > Even for the same combination of MACHINE and target it once worked an=
d once
> > > failed without any metadata changes or host distro changes between.
> >=20
> > env doesn't show anything interesting related to python
> >=20
> > changing shebang to
> > path/tmp-eglibc/sysroots/x86_64-linux/usr/bin/python-native/python
> >=20
> > made all currently failing builds to succeed again, but the issue is
> > still there..
>=20
> Is this on the same build machine? There must be something in common
> with the failed builds. Do they always fail if you

Yes, same machine same builddir..

One failing image succeeded later, the remaining 3 are: 1 image
(bitbake shr-image) and 2 bitbake package-index tasks (which are called aft=
er
bitbake task-shr-feed is finished).

I'm doing 8 image builds + 4 feed builds in 2 separate builddirs there.
All about 3 times already since yesterday.

So I don't see anything special on those 3 failing :/.

> hardcode /usr/bin/python in there? If so, can we figure out why the host

With hardcoded /usr/bin/python it was failing, then I've tried to
hardcode that python-native which worked.

> python is looking at files in the sysroot? LD_LIBRARY_PATH isn't set or
> something odd like that?

LD_LIBRARY_PATH is set to empty in setup-env script.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SUk9VBj82R8Xhb8H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAOW/cACgkQN1Ujt2V2gByiywCeMPr+frDQCJAqBCddxN7MDo6G
EwIAoJVTSNsnCQ2wmL5HHNYqXTD/Vwj5
=T/fb
-----END PGP SIGNATURE-----

--SUk9VBj82R8Xhb8H--
