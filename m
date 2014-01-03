Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8A901610D8;
	Fri,  3 Jan 2014 13:37:23 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c13so6681961eek.16
	for <multiple recipients>; Fri, 03 Jan 2014 05:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oEoJ9d8JoeHDiTTjedyvl0oA/mbFKNadtBVwkE0j5hA=;
	b=FGOC+z7JrBOK9VZr9ttTJ/0VI5/t3CmhdaclzTi+4m543F6kbFWe5ejNsyinhGiV3+
	WFy/MV1uzkFRVFuVeRYLO558JaShKT0qw7VDcU51jv4LnKGDzd1YBCJ5uv4qlo/f3WdL
	WUuHyzPaimVJCXO2g2i14Kb8hLtgNOn+uViBCcaVa7AWttRmpdvppVMQfRSJG6Byo5me
	HC7afZsjdfknQi6cxGid/BuQvHd3/1jkMShrW+LDJ+Rli8AsGaLljY4F4kSCw983N/87
	kcLT51ogX0fkrTjozmozhWqTGoTUMzOWe43QparrmzqmG8de2dLGhdtSPIv7LRC9aPB/
	Dh0g==
X-Received: by 10.14.184.66 with SMTP id r42mr2330938eem.86.1388756244304;
	Fri, 03 Jan 2014 05:37:24 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z42sm145032718eeo.17.2014.01.03.05.37.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jan 2014 05:37:23 -0800 (PST)
Date: Fri, 3 Jan 2014 14:37:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140103133727.GE3707@jama>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
	<l9pfvj$rqa$1@ger.gmane.org> <20140103112512.GA30264@gmail.com>
	<8077054.ZVN9KvzOmn@helios>
MIME-Version: 1.0
In-Reply-To: <8077054.ZVN9KvzOmn@helios>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Piglit in Poky
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
X-List-Received-Date: Fri, 03 Jan 2014 13:37:24 -0000
X-Groupsio-MsgNum: 48581
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k3qmt+ucFURmlhDS"
Content-Disposition: inline

--k3qmt+ucFURmlhDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 03, 2014 at 01:26:05PM +0000, Paul Eggleton wrote:
> On Friday 03 January 2014 13:25:13 Andrei Gherzan wrote:
> > On Sun, Dec 29, 2013 at 04:44:52PM +0100, Koen Kooi wrote:
> > > -----BEGIN PGP SIGNED MESSAGE-----
> > > Hash: SHA1
> > >=20
> > > Philip Balister schreef op 28-12-13 23:33:
> > > > On 12/28/2013 10:28 AM, Koen Kooi wrote:
> > > >> Paul Eggleton schreef op 28-12-13 12:48:
> > > >>> Hi Koen,
> > > >>>=20
> > > >>> On Tuesday 24 December 2013 15:22:32 Koen Kooi wrote:
> > > >>>> Burton, Ross schreef op 23-12-13 19:01:
> > > >>>>> We'd like to integrate Piglit (an OpenGL test suite) into Poky
> > > >>>>> so that we can run automated QA on the GL stack.  Piglit is
> > > >>>>> currently residing in meta-oe, but as Poky is a self-contained
> > > >>>>> project we can't just add meta-oe to it:  apart from the size of
> > > >>>>> meta-oe, we can't ensure stability if meta-oe makes incompatible
> > > >>>>> changes that affect Poky.
> > > >>>>>=20
> > > >>>>> Piglit isn't a stand-alone package, there are the dependencies
> > > >>>>> of waffle, python-mako and python-numpy to consider too.  There
> > > >>>>> are two possibilities I can see:
> > > >>>>>=20
> > > >>>>> 1) Move piglit and deps to oe-core.  Piglit is for QA purposes
> > > >>>>> only and pushes the boundaries of "core platform".  In a sense
> > > >>>>> this is a repeat of the discussion we had with Midori...  does
> > > >>>>> oe-core contain everything needed to sufficiently exercise the
> > > >>>>> core components it ships or not?
> > > >>>>>=20
> > > >>>>> 2) Add piglit and deps to meta-yocto.  Probably a new layer
> > > >>>>> called meta-yocto-qa (or similar) because the Yocto Compatible
> > > >>>>> guidelines forbid mixing distribution policy and recipes.
> > > >>>>=20
> > > >>>> Speaking of layers, can you *please* rename meta-yocto to
> > > >>>> meta-poky? It's what it's actually is and would remove a lot of
> > > >>>> confusion when trying to explain that yocto is not a distro, even
> > > >>>> if the distro layer is called 'meta-yocto'.
> > > >>>=20
> > > >>> This is a tangent, but a couple of points:
> > > >>>=20
> > > >>> 1) This rename would not come for free. We'd need to update peopl=
e's
> > > >>> existing bblayers.conf files on the fly, as we did when
> > > >>> meta-yocto-bsp was split out of meta-yocto, and thus bump
> > > >>> LCONF_VERSION; however, doing this only in poky has resulted in
> > > >>> annoying problems when users remove poky from their configurations
> > > >>> (since LCONF_VERSION is out-of-step between Poky and OE-Core, lea=
ding
> > > >>> to confusing errors in this situation). Thus I think we'd want to
> > > >>> solve this once and for all by bumping the value in OE-Core as we=
ll
> > > >>> as Poky.
> > > >>>=20
> > > >>> 2) If you propose this rename, perhaps you will also consider
> > > >>> renaming meta-oe, since that name within a similarly named
> > > >>> meta-openembedded repository leads to a similar level of
> > > >>> confusion...?
> > > >>=20
> > > >> I have no problems with renaming that layer since I get confused by
> > > >> this a few times a week myself :)
> > > >=20
> > > > What would we we rename it to?
> > >=20
> > > I'm very tempted to suggest 'meta-yocto'
> >=20
> > I definitely find meta-yocto a better option here. It would save me from
> > some confusion when talking about yocto to other people.
>=20
> I'm not following; meta-yocto is already called meta-yocto ... ? Maybe yo=
u=20
> didn't realise Koen was joking...

My understanding was that Koen was talking about renaming
meta-openembedded repository to meta-yocto, which would be kind of nice,
but too late for that now, it would be very confusing with the other
meta-yocto repository.

> > Related to meta-oe, even if that would be a smaller problem, I think
> > meta-openembedded is a better name for that layer too.
>=20
> That doesn't solve the problem I was talking about, namely that there's l=
ittle=20
> distinction between meta-openembedded the repository (that contains a num=
ber=20
> of layers) and meta-oe which is one of those layers. These are two differ=
ent=20
> things and the similar naming makes it hard to always know which one peop=
le=20
> are talking about.

What's even worse is that github mirror names the repositories
meta-oe/oe-core so even the small distinction "meta-openembedded" =3D
repo, "meta-oe" =3D layer doesn't work there.

https://github.com/openembedded

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k3qmt+ucFURmlhDS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLGvRcACgkQN1Ujt2V2gByDpACfc/ynRAt7O+qh6mT9x3bzaLGY
VtUAniFuKPsi64L7zp0uUYhRvl2Ejkor
=K2Vs
-----END PGP SIGNATURE-----

--k3qmt+ucFURmlhDS--
