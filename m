Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id E111E65C87
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 13:20:48 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x13so4210712wgg.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zO98dJKtAX06GsbLF1P8uey/Ehv/eph4iFlsu3/OwMI=;
	b=BSatwStbBu1qsZfFOzKSDkzF8HM+khc7B209/z4B/iyr2Ej4GypjEcidb+5AePcEq7
	sMbBsOcWcWRmzJrZJKu8MxvyUiNFTkNQsGcYULCaXDw6mjZq/3Iekj8aFY3bHEmiZCyP
	PX1UvvOXSVtRTImid0kpu3OCuPJI+FS123ktTaIuaAbNFWhs9yFHrVnb+O+7Hse+OtiR
	N/47jKPB4996HnA/uUEZPcIwJb3CQihTdBCxEWJzamAD0Ek92xhGMLEuUfUr6oFYs7Zi
	29+TuS+2ytzC1t/PrxE+GT98AfCBifyFrM86ZSVP5t4hYjDCUNvmGj4B2d1lGrKNqIrD
	2Rng==
X-Received: by 10.180.74.76 with SMTP id r12mr27473249wiv.6.1414675249076;
	Thu, 30 Oct 2014 06:20:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t7sm5906916wjy.24.2014.10.30.06.20.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Oct 2014 06:20:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Oct 2014 14:20:53 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20141030132053.GF15148@jama>
References: <1406209379-1662-1-git-send-email-Martin.Jansa@gmail.com>
	<1406209379-1662-2-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0La2AZo=nxBJGnkQrC+=jB9hoO+tsYyuCMbfAT0vwwd-qg@mail.gmail.com>
	<20140724152218.GM2492@jama> <1406553510.13346.17.camel@ted>
	<20140806114831.GG14848@jama>
MIME-Version: 1.0
In-Reply-To: <20140806114831.GG14848@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] recipes: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Thu, 30 Oct 2014 13:20:51 -0000
X-Groupsio-MsgNum: 59031
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pyE8wggRBhVBcj8z"
Content-Disposition: inline

--pyE8wggRBhVBcj8z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 01:48:31PM +0200, Martin Jansa wrote:
> On Mon, Jul 28, 2014 at 02:18:30PM +0100, Richard Purdie wrote:
> > On Thu, 2014-07-24 at 17:22 +0200, Martin Jansa wrote:
> > > On Thu, Jul 24, 2014 at 02:52:45PM +0100, Burton, Ross wrote:
> > > > On 24 July 2014 14:42, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > > > +REQUIRED_DISTRO_FEATURES =3D "x11"
> > > >=20
> > > > Now I'm wondering why this is the solution.
> > > >=20
> > > > If you attempt to build e.g. gnome-desktop explicitly without the x=
11
> > > > distro feature you understandably get an error message, because
> > > > gnome-desktop depends on libx11 which sanity checks the distro
> > > > features.  This seems correct.
> > > >=20
> > > > Presumably you're problem is that you're running world builds and
> > > > they're producing errors on gnome-desktop because they can't satisf=
y a
> > > > dependency on libx11.  It seems that bubbling up the
> > > > REQUIRED_DISTRO_FEATURES tests isn't the right thing to do here - w=
hy
> > > > can't SkipPackage be handled specially, so if you do bitbake -k wor=
ld
> > > > and libx11 emits SkipPackage, anything that has unsatisfiable
> > > > dependencies because of this is also skipped?
> > >=20
> > > We discussed this many months ago and IIRC the conclusion was that us=
er
> > > should explicitly say that he wants to skip the recipes which depend =
on
> > > something skipped (so that he is aware of what he is missing).
> > >=20
> > > At that time there wasn't REQUIRED_DISTRO_FEATURES support, so I've
> > > created huge list of PNBLACKLISTs to blacklist everything not availab=
le
> > > in our setup - so I can do world builds without ERRORs at the beginni=
ng.
> > >=20
> > > REQUIRED_DISTRO_FEATURES seems to me like reasonable compromise, that=
's
> > > why I've sent this patchset to replace small part of my huge blacklis=
t.
> > >=20
> > > This is the list:
> > > https://github.com/openwebos/meta-webos/blob/master/conf/distro/inclu=
de/webos-recipe-blacklist-world.inc
> > >=20
> > > If someone has time to improve SkipPackage and we really want to skip
> > > all depending packages, I would be glad to test such patch (because it
> > > allows to easily drop all those blacklists for "depends-on-broken"
> > > components)
> >=20
> > The question here is whether we want a system which calculates what it
> > thinks is right or that we declare it.
> >=20
> > The risk is that if SkipPackage (now known as SkipRecipe) were to
> > automatically "spread", you could in theory break the toolchain, have
> > nothing buildable and "bitbake world" would return success.
> >=20
> > Effectively the -k option to bitbake already does the SkipPackage
> > "spread" idea since bitbake just removes dependencies until it works. If
> > does that in a fairly verbose way but it does so deliberately so you can
> > see what is going on.
> >=20
> > The alternative is to declare what a given recipe supports and then we
> > can know whether it should be skipped or not under a given circumstance.
> >=20
> > Personally, I'm leaning towards a more declarative approach where we
> > specify what should and shouldn't be expected to work. I'm open to
> > discussion on it though...
>=20
> I agree with more declarative approach.
>=20
> I don't mind maintaining PNBLACKLIST e.g. for components depending on
> something we decided to blacklist ourselves in distro config.
>=20
> But for components like this, where we really know that they won't work
> without X11 in DISTRO_FEATURES, I think bitbake should skip them
> automatically (thanks to REQUIRED_DISTRO_FEATURES). It already
> automatically skips all recipes in xorg-lib directory, why it shouldn't
> skip other recipes living somewhere else?

Can we make some decision now?

> > Cheers,
> >=20
> > Richard
> >=20
> >=20
> >=20
> >=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pyE8wggRBhVBcj8z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRSOzUACgkQN1Ujt2V2gByL9gCdGR0cj6IBzN72WVvIxLwYpBg7
fIAAn3jOEicTAQ+02nW90sBkmbOG4fqE
=TYE1
-----END PGP SIGNATURE-----

--pyE8wggRBhVBcj8z--
