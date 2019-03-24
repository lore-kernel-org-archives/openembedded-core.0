Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 724327D066
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 18:01:14 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id w1so7597130wrp.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 11:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=u5m3m9Wi0oTMl6znpxcFhDVPVsZ64H+EaOGpbJu10Us=;
	b=oXc45BbEKS7XwpJYFbX6mhGz3k+zo5nLamd1QpzprqDc0HxCdQ0nwSzEVbzFsVqu6l
	/ODoVSHWzuyIKQ4A2PSDtpvwGkmn4I8DO0im6w4QWxy0Rl9idXZHt8fs5L2OiEV6fh4p
	4o5yhSZ/aNVHwICSHNYx/leegBKM2GHMN2NH1TiIac6BL43ps25zvQGalQXCaAXJX6/9
	DAGbG6hVcHD1XjO5TKPN0SY1dYAuHyGOEcKHBr6NXrp4q0DTJm62woZ7h6bE/8MRqQ72
	N+BbPTzSvzWgi3XA3WBKKJP53lmqQ8A8CpgwkREDqlkJJSWErwVCpfHLezTcb03TOlsO
	Vhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=u5m3m9Wi0oTMl6znpxcFhDVPVsZ64H+EaOGpbJu10Us=;
	b=BLXL3Q/7TWMTFsG6i6bcXyIUim5+yFj0pQHUDIYgYpGGn3bPbPER2jzUyPlQ14PnEw
	KooMqqsO3UnFvsOVz3SEQBmZUBzly83Z8OqBR18dq9v5ESeigV+Z/pYE39c9KU8EVcRX
	AWEq0+JkG3fnutMi25UReIo2Lp1n+ddGy7TvZn1LtskdsSfG2a3rL96fXAXnS9ou4rtH
	Y9rpIQOLBcfwg4ilWhWKXKb76Vvgb31MEh/xMmvdjjsbze/oY1MKThC+a7vGLrxUjWVn
	TbCRy/he/pmzzrmFBkq40ISZCvO7JCuKfbEMnDHRxzTFl0+cTT5/9++fF6LoeurmQjkH
	L10w==
X-Gm-Message-State: APjAAAXNklD7adIwAXybnoURs8ZxbEoZq+KKxaadHQWYAfSSD3H9SrSq
	M+GA+LNQfqgAvAL/HAeEhHQ=
X-Google-Smtp-Source: APXvYqzMGwj5DJHYpDlqNQnmfRGLB9FBT0bMQ75bJe6/s3Fpf2YV6tMi2cB5qGyl/N2vKhctqbYeZQ==
X-Received: by 2002:a5d:698b:: with SMTP id g11mr10252093wru.65.1553450475149; 
	Sun, 24 Mar 2019 11:01:15 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	l8sm12495613wrv.45.2019.03.24.11.01.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 24 Mar 2019 11:01:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 24 Mar 2019 19:01:13 +0100
To: Mikko.Rapeli@bmw.de
Message-ID: <20190324180113.GA1947@jama>
References: <1552927535-19740-1-git-send-email-akuster808@gmail.com>
	<CALbNGRT1_qD8LYEP7X7JexnEOW7AsC84ceatZ3BLgECoo7vixQ@mail.gmail.com>
	<20190319075206.GK20077@hiutale>
MIME-Version: 1.0
In-Reply-To: <20190319075206.GK20077@hiutale>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH] Revert "boost: update to 1.69.0"
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
X-List-Received-Date: Sun, 24 Mar 2019 18:01:14 -0000
X-Groupsio-MsgNum: 122554
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2019 at 07:52:06AM +0000, Mikko.Rapeli@bmw.de wrote:
> On Mon, Mar 18, 2019 at 06:03:05PM +0100, Andreas M=FCller wrote:
> > On Mon, Mar 18, 2019 at 5:45 PM Armin Kuster <akuster808@gmail.com> wro=
te:
> > >
> > > This reverts commit a384248938ea9db096866bf4ec8678d35ca62a12.
> > >
> > > This package update slipped in doing the maint process. Removing it.
> <snip>
> > Just my opinion - don't consider this as NAK.
> >=20
> > * I already fixed the recipes that failed for me. For at least one the
> > change is no more compatible to 1.68.0.
> > * This makes PV going backwards
> >=20
> > Thanks for addressing - what do others think?
>=20
> I'm not using thud yet, but updating boost in stable branch would break
> too many things and I would have to revert that change in our trees. Some=
 boost
> updates are in the end quite trivial and just require recompiling
> everything but still, I would prefer that boost is not updated in stable
> branches unless there is a huge security/stability issue with the old ver=
sion.

Agreed.

I care less for PV going backwards nowadays, it's probably less annoying th=
an
bumping PE first in master and then backporting PE bump to thud.

People with build issues related to boost upgrade probably never
built whole image to push it as an upgrade to end devices.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXJfF6AAKCRA3VSO3ZXaA
HKOyAJ0eeX3AUI+N8kSEoRDwy1ksPwa2nwCguujaw/Wjej3Sg2mMCSDTMZHWQYo=
=4dtq
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
