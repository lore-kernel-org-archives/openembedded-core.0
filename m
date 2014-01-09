Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 96E666D145
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 00:32:40 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so1013801eei.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 16:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=k3Eg6Fmk5xrmtxx3X+k7UCaARWIOc0vZ7ylgpXwYI4Q=;
	b=oOZTg+0ywCHaCIJX4ePVosOsAiJawYhqYLCYscgZPYDMwlIn2FKD2TsECPAlKme8m5
	xanToSS0W0NiHR2qEpRsBEU0b5gyhD6zjoYjxfb19RXrhVZ5qcLNUAvbMlK81jeP1oE1
	0NuBawE9FrmwOkM0ImUwdKUFmazvLebo+L6KRP5SaEOBF14ohzqeTUZvs6S7bPMxHFGi
	AGoTf6KFAwSc33LYmE+0G822RPdmg8qI7qPfqIjsMdx4UCfJXeT+V92NJl2SdiVqBDpH
	yG/YO7Liy9dSrZ+V+z0mfF6m49b+IjQzXyCgpu8FBN/ImprvqztqCUYtduJiGsgKe//n
	Fo0g==
X-Received: by 10.14.3.1 with SMTP id 1mr107291eeg.94.1389227560954;
	Wed, 08 Jan 2014 16:32:40 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v7sm723240eel.2.2014.01.08.16.32.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jan 2014 16:32:40 -0800 (PST)
Date: Thu, 9 Jan 2014 01:32:51 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140109003251.GD3709@jama>
References: <52CC470A.9030302@linaro.org> <1759035.6JVm74GdRW@helios>
	<52CD9CAB.5020501@linaro.org> <3583228.liS9SqzWlO@helios>
MIME-Version: 1.0
In-Reply-To: <3583228.liS9SqzWlO@helios>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Qt in OE-core
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
X-List-Received-Date: Thu, 09 Jan 2014 00:32:42 -0000
X-Groupsio-MsgNum: 48741
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1YtYzP3stTOlsn9I"
Content-Disposition: inline

--1YtYzP3stTOlsn9I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2014 at 11:21:08PM +0000, Paul Eggleton wrote:
> > In my opinion...
> >=20
> > Personally I would be in favour of removing GTK+ and the GNOME UI from
> > the core and putting them in their own layer for all the same reasons I
> > think Qt should be in its own layer:
> > - a "basic" image doesn't need them
> > - we can have different layers to track separate major releases (as with
> > qt3, qt4, and qt5)
>=20
> The trouble is, if you have no toolkit at all, how do you test that X sti=
ll=20
> works properly? The selection we have provides a single unit allowing us =
to=20
> test the entire stack reasonably well without having to add anything else=
=2E I=20
> think that's a valuable thing to have.

By testing oe-core + layer with X.

Everybody else is using oe-core + couple of other layers, why do we need
to make oe-core testable with X _in single_ layer?

I'm not saying that oe-core should be tested with 30 layers like my
world build, but why cannot AB have special build which builds

oe-core + meta-xorg + meta-gnome

and runs some runtime QA tests on that and then some other build with

oe-core + meta-python

for piglit tests?

Is it limitation of AB scripts for builds that they cannot fetch other
layers so they need everything glued together with combo-layer?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1YtYzP3stTOlsn9I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLN7jMACgkQN1Ujt2V2gBzDcACfW9O0mJqjbXgw0qcCoOeoEd0I
lMkAn1N2dFO0iodIEDAIhbE+EakqKmpM
=Ai2b
-----END PGP SIGNATURE-----

--1YtYzP3stTOlsn9I--
