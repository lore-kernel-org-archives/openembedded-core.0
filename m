Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 79E5B6D8F6;
	Mon,  3 Feb 2014 19:02:16 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b15so2006718eek.29
	for <multiple recipients>; Mon, 03 Feb 2014 11:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7udNUQ1IIwryqySTCN7mMGnCxGl2rTbSsUvbuCK98JU=;
	b=sakcXjEo1pGH/vX+CQjC4K48GY4YKl/NRV31vAJ83gbg4+kcZUJ5qBbukzHnHGrOT4
	6lSyyxmjmrmGADAz+bq7wq1SvmSFFfIUxSE+gERrxJChLsZ5kH7bHKQi0lGm7iS3K7dP
	tTUoyXbWV69JTw1OGX7m4AvtLGHUN6ylgK9bYYcZOJDaf3ed3e19ApdxtJ5gYlxZOJhF
	wZWf6Lc6YdDiZsdqkJyq+E4/xQuwnicYlDlCtueXBwhcEDK6Ee9e21QV97WNufDjh7g6
	S458oGqR24LEcVRGQaTxZ6unYR//xpBZWQ+28Y4xOWFEKquEB8yVvOvXZcQVjeVrxmei
	VEDA==
X-Received: by 10.14.88.5 with SMTP id z5mr4510436eee.101.1391454137070;
	Mon, 03 Feb 2014 11:02:17 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	d43sm78887335eep.18.2014.02.03.11.02.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Feb 2014 11:02:15 -0800 (PST)
Date: Mon, 3 Feb 2014 20:02:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20140203190227.GG3698@jama>
References: <20140202223258.8D272503AA@opal> <20140203143127.GD3698@jama>
	<CAMKF1sqMOgxUa2P4JQVJpTT1NeGNE7tSL-UqfjcMdPMVnQFKxA@mail.gmail.com>
	<20140203173845.GF3698@jama>
MIME-Version: 1.0
In-Reply-To: <20140203173845.GF3698@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Khem Raj : binutils: Upgrade to 2.24
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
X-List-Received-Date: Mon, 03 Feb 2014 19:02:18 -0000
X-Groupsio-MsgNum: 49802
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AzNpbZlgThVzWita"
Content-Disposition: inline

--AzNpbZlgThVzWita
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2014 at 06:38:45PM +0100, Martin Jansa wrote:
> On Mon, Feb 03, 2014 at 09:27:44AM -0800, Khem Raj wrote:
> > On Mon, Feb 3, 2014 at 6:31 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > > Hi Khem,
> > >
> > > can you please check following QA warning:
> > >
> > > NOTE: recipe binutils-2.24-r0: task do_package: Started
> > > WARNING: QA Issue: binutils: Files/directories were installed but not=
 shipped
> > >   /usr/bin/ld.bfd
> > >   /usr/bin/dwp
> > > NOTE: recipe binutils-2.24-r0: task do_package: Succeeded
> > >
> > > ld.bfd is there for very long time, but I think that dwp is new with
> > > 2.24
> > >
> >=20
> > It seems you see these warnings when you have ld-is-gold in your
> > distro features right ?
> > since I don't see them normally. I have a patch here, can you test it
> > out and report back ?
> > I do not have gold setup here and it will be quicker in your setup to v=
erify it
> >=20
> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/=
binutils-2.24&id=3D33dd773b4b701dff8184a346d532b11f1bd5d327
>=20
> Yes I have ld-is-gold and will test it, thanks


Works for me, only issues is incorrect indentation, but that's not your
fault.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AzNpbZlgThVzWita
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLv58MACgkQN1Ujt2V2gByklACghZquCY8MrQ3/ATqhsTFmwtlR
+BQAn2sSihfK2c81RzsGKV14ii/0G+85
=Izz/
-----END PGP SIGNATURE-----

--AzNpbZlgThVzWita--
