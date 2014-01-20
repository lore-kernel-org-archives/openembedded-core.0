Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id DBE60600AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 17:36:32 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id r15so2433237ead.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 09:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cB+MzUgYb7FnmxxbnmI/T6Ie/lBpKeMPSMM2RJkFx1o=;
	b=Kw2xx+l3S96g+2klpQJyoh3Bs2ns3JVBU8gSUEk1Ocp7Y01DAy5P63c1zLYk0fswHR
	WtJGaROlv/3HfM6Yo49BzGX5NSLQqqOb7bwDPuj+JrjEFOudfIoMgmOM4rB78lU8cvLg
	w0T6BoRx8myFKBm+ZLqKUxmHKhLoCHh7Lg4J6GYfJ5tGj86sD54Ki82W6hys5E4TzwXD
	fyxtX5i6lhnkx2OLXJYo7Ds6yt1DIQPgi32XaR0FXuhMdKig7w3j+EDppPbwvaoDXz4w
	PsuUoWr8vG0/29LV/8EBVzYhxWHYUjs6f2lAZINa2+s56jKqLMSd2obGbTkMMDqIldZL
	1MlA==
X-Received: by 10.14.4.67 with SMTP id 43mr5863156eei.70.1390239393383;
	Mon, 20 Jan 2014 09:36:33 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id l4sm5373832een.13.2014.01.20.09.36.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jan 2014 09:36:31 -0800 (PST)
Date: Mon, 20 Jan 2014 18:36:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140120173632.GJ5565@jama>
References: <1390236004-18570-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LZ2HFJ1QAyRYW9XXOrkttW5UOenkuFK29Z_R9si4sJCRA@mail.gmail.com>
	<20140120165727.GI5565@jama>
	<1888336.GIvbbx0Ozl@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1888336.GIvbbx0Ozl@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] kdbus: add git version
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
X-List-Received-Date: Mon, 20 Jan 2014 17:36:33 -0000
X-Groupsio-MsgNum: 49232
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEfPc/DjvCj+JzNg"
Content-Disposition: inline

--PEfPc/DjvCj+JzNg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2014 at 05:09:05PM +0000, Paul Eggleton wrote:
> On Monday 20 January 2014 17:57:27 Martin Jansa wrote:
> > On Mon, Jan 20, 2014 at 04:49:29PM +0000, Burton, Ross wrote:
> > > On 20 January 2014 16:40, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
> > > > This builds the kernel portion of the kdbus implementation. Userspa=
ce
> > > > support needs systemd git and/or a special glib-2.0 branch.>=20
> > > As awesome as kdbus could be it's very much fresh code, can this live
> > > outside of oe-core for now?
> >=20
> > FWIW: it will be welcome with new systemd version in
> > meta-openembedded/meta-systemd
> >=20
> > Only disadvantage of it will be that current DEFAULT_PREFERENCE behavior
> > doesn't allow to demote this "experimental" version. So people using
> > meta-systemd will always get this one unless they set PREFERRED_VERSION
> > to version in oe-core.
> >=20
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2964
>=20
> Surely then the better answer would be to use a different layer, rather t=
han=20
> mixing all three of "legacy" RPROVIDES/RREPLACES/RCONFLICTS, additional=
=20
> systemd support not yet integrated into OE-Core (WIP) and the bleeding ed=
ge=20
> components we're now discussing?

In ideal world there should be some variable which says that the recipe
isn't preferred by default (unless explicitly asked for by P_V),
unfortunately DEFAULT_PREFERENCE is already taken.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PEfPc/DjvCj+JzNg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLdXqAACgkQN1Ujt2V2gByfMwCdG/aZYsa6ZuKcWKufyiB9dt98
8pIAnRvd3zo5/ci2P8XvJ9dGQ0xfNYbk
=G6LW
-----END PGP SIGNATURE-----

--PEfPc/DjvCj+JzNg--
