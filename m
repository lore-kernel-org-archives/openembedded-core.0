Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id C77C960DD6;
	Tue, 24 Dec 2013 10:50:13 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so2797779eak.16
	for <multiple recipients>; Tue, 24 Dec 2013 02:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vxZyENsSmna63fPQt7uE4Tu3WLe2TC1eaEm7E+IhsKA=;
	b=YtPuQbs8s66wjWAL+MrabC9QWsqsCaSjp18uo9tZjlrKYGCqq5DvSWvamYDv1jCL0C
	dGboalrgqkuhI81wsdj8TMypIa8hnxJoBo3FffaH/3ZG+G8csCW9wCSn/cLuc6a4t51z
	insZPhDyG7agFhH7/byOhbRkaOs/dcv6lI8hSW7rkK9p+ZqxKsYy6IHTBDysfnltReDZ
	lLek64483zayEpk6uJq6EI1/ZK2AozowUAMBCtUxYbZPiW2lmGBBEycmzD2qm3xT3Hj7
	NW71sxkV+pcpUTV52oIpNcuEu3oXTkgexMs49qsEn7uqlYqIdyq5YcqGqfqdSAz0JtwE
	XSTw==
X-Received: by 10.14.211.69 with SMTP id v45mr1721342eeo.75.1387882214435;
	Tue, 24 Dec 2013 02:50:14 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 4sm53834053eed.14.2013.12.24.02.50.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Dec 2013 02:50:12 -0800 (PST)
Date: Tue, 24 Dec 2013 11:50:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131224105050.GX3706@jama>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
	<52B8DECA.6060704@balister.org>
MIME-Version: 1.0
In-Reply-To: <52B8DECA.6060704@balister.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Poky Project <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 24 Dec 2013 10:50:15 -0000
X-Groupsio-MsgNum: 48413
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VE1+SxTILTm8udN6"
Content-Disposition: inline

--VE1+SxTILTm8udN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2013 at 08:09:30PM -0500, Philip Balister wrote:
> On 12/23/2013 01:01 PM, Burton, Ross wrote:
> > Hi,
> >=20
> > We'd like to integrate Piglit (an OpenGL test suite) into Poky so that
> > we can run automated QA on the GL stack.  Piglit is currently residing
> > in meta-oe, but as Poky is a self-contained project we can't just add
> > meta-oe to it:  apart from the size of meta-oe, we can't ensure
> > stability if meta-oe makes incompatible changes that affect Poky.
> >=20
> > Piglit isn't a stand-alone package, there are the dependencies of
> > waffle, python-mako and python-numpy to consider too.  There are two
> > possibilities I can see:
> >=20
> > 1) Move piglit and deps to oe-core.  Piglit is for QA purposes only
> > and pushes the boundaries of "core platform".  In a sense this is a
> > repeat of the discussion we had with Midori...  does oe-core contain
> > everything needed to sufficiently exercise the core components it
> > ships or not?
>=20
> I expect Richard will push back on this, and I would support him here.
>=20
> >=20
> > 2) Add piglit and deps to meta-yocto.  Probably a new layer called
> > meta-yocto-qa (or similar) because the Yocto Compatible guidelines
> > forbid mixing distribution policy and recipes.  We'd need to sync
> > meta-yocto-qa with the pieces of meta-oe that we want somehow, but
> > that's our problem.
>=20
> So meta-yocto is right out. I'm a user of numpy, and I certainly do not
> want to include something called meta-yocto-qa just to pick up numpy.
>=20
> So this presents a quandry. Moving numpy to a special layer to support a
> specific recipe is just not the right thing to do. Conceivably, we could
> create a layer for the bits of meta-oe that are python related, but I am
> not sure that solves your entire problem.
>=20
> I certainly do not want to see one recipe appear in two layers. That is
> a recipe for trouble.
>=20
> Long term, we need to make the layer model work for the entire project
> and get over the reluctance to use other peoples layers.

Agreed, meta-python in meta-oe repository sounds a lot better than
having the same recipe in 2 layers.

> > Thoughts and opinions welcome over Christmas, otherwise I'll toss a coi=
n. :)
> >=20
> > Ross
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VE1+SxTILTm8udN6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlK5ZwoACgkQN1Ujt2V2gBw7oQCfb2mw1KskvG1TChraodIgFM5x
2nkAn0zDc31MAnwjs+MsKfuXfJomOBnb
=1xxW
-----END PGP SIGNATURE-----

--VE1+SxTILTm8udN6--
