Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4D5196DE07
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2014 18:05:28 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b15so2109331eek.15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2014 10:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AAVSoWty1Ef0EUIgEhgH2oUQTwJb1n3ctUcFGmNwOAo=;
	b=HU4ILYxBxNjvBARZNVFK0xW7gHH3PeyJ0AZCCO5Yf+6h9Z6ODbzrQh6Q9Wk1EvEXFO
	DICeY6gQT6RKSZ07/AhP1CVeD2XaPqjJLdG1kXq95tUCbHV/wdt5LO6uaylkvyJMHhu3
	Q5gO5STb519gACqnU1Ln5uIoe+N7KScmC1eleljuVTMimeYUtXhw0IK0yBgRbANhoD3k
	BGxBLEZlH2GDfyPx0tGbpjX2Qhmq24HkauhwKW52uscd3GvuOSZtH9ZcaR62aMkbdcIJ
	djnzP+Cv908RmGFZqwGyJs3/wsuS1VogKMuDH0fVTX8DlL/YoxeRYLZXekp1NFxM1O7P
	qClg==
X-Received: by 10.14.87.129 with SMTP id y1mr164899eee.38.1391882728402;
	Sat, 08 Feb 2014 10:05:28 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id x6sm31729218eew.20.2014.02.08.10.05.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Feb 2014 10:05:26 -0800 (PST)
Date: Sat, 8 Feb 2014 19:05:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140208180543.GN3698@jama>
References: <1391598835-1631-1-git-send-email-lpapp@kde.org>
	<52F25D84.6060501@linux.intel.com>
	<CAOMwXhMUuS2-dV1xe0YWFxOeD08ByUHHm8DPaqeT=4jAFzHXVA@mail.gmail.com>
	<1391860744.32614.52.camel@ted>
	<CAOMwXhM8FgqC+z-fo9VNDyn=imUhomLmm+hQUSX4k9r7AsXJyA@mail.gmail.com>
	<1391862015.32614.59.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1391862015.32614.59.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/recipes-core/base-passwd/base-passwd/noshadow.patch: Split it into two parts
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
X-List-Received-Date: Sat, 08 Feb 2014 18:05:28 -0000
X-Groupsio-MsgNum: 49964
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qa0ccP92Gc0Ko3P8"
Content-Disposition: inline

--Qa0ccP92Gc0Ko3P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 08, 2014 at 12:20:15PM +0000, Richard Purdie wrote:
> On Sat, 2014-02-08 at 12:07 +0000, Laszlo Papp wrote:
> > Why is it a nightmare? For instance, maintainers in other projects
> > leave a "Pushed, thanks" note.
> >=20
> > See how much discussion this generates already, instead of two words.
> > While you are at the change to merge it, you are already in place to
> > leave the comment. However, contributors need to go and find the
> > corresponding url, etc. Please note that contributors may want to know
> > whether their voluntary work got merged without even a checkout, for
> > instance double checking from mobile, etc.
> >=20
> > ... or is the real problem the lack of maintainer man power?
>=20
> Its both a man power problem and the process isn't as simple as
> described.=20
>=20
> The changes get batched together into large units, those get tested on
> the autobuilder. If they work out ok, the changes go in, if they fail,
> we pull out patches until we get a successful batch, then merge.
>=20
> Upon failures, we do aim to mention those on list. Having to go back
> through emails to find the ones which merge and "ack" them is a pain
> though since we are "not already in place" as you put it.
>=20
> There are only two people in general who do this on OE-Core, myself and
> Saul. We do have a ton of other pressures on our time, we do the best we
> can. If someone wants to ack patches that merge I'm happy for them to do
> so, it would be just as much work for them as it would for me/Saul.
>=20
> I am aware there are patch management tools out there which can show
> status of patches. We've looked hard at them and in general they impose
> more overhead and process onto people who don't want it.

FWIW: for meta-oe I still use patchwork
(http://patchwork.openembedded.org/) the main advantage for me as
maintainer is that I can split incoming patches into different bundles
(categories) and leave some bundles for sublayers with own dedicated
maintainer for him to handle them.

The hook for automatic "Accepted" flag quite often doesn't close right
patch or doesn't close anything at all and contributers very rarely
update their own patches as well (e.g. when they send v2 they almost
never mark v1 as superseded) so the overall benefit from patchwork is
quite low, but still better than nothing for me.

=46rom contributor POV I don't see need for "ack/Pushed" e-mail, I rebase a=
ll
my local changes quite often, so when some are merged I'll notice that
they are gone from my local branch. When some patch is stuck there for
very long time, it's again easy to spot this and send reminder on that
patch email. Another advantage of rebasing my submitted patches is that
I'll see if my patch was modified prior to merge or when older revision
of the patch was merged and rebase leaves me with some significant delta
between v1 and v2 which I can easily submit as incremental patch.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Qa0ccP92Gc0Ko3P8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlL2cfcACgkQN1Ujt2V2gBxhBACfbYvMghfUKQCYr78TwPYug1NE
qhIAnA8ezwfG98qYBLdF6bFeCavgN3wX
=jpyc
-----END PGP SIGNATURE-----

--Qa0ccP92Gc0Ko3P8--
