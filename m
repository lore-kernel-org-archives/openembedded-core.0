Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id EDF7C77CF3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 07:38:56 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id l28so11714332wre.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 00:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uc/1MDPUHopUr/jbXgXCRoVJu/hHIUz73yoImSe/9bo=;
	b=sEOqgBxWBa8vBqSk2la4PYdSXuK6z/mGPS5Fq1Cv9Bnz1sMjMuJ6DpPv9GN6ZPX6TB
	u42qmz8JqC11s5sbwz5R2b4sIFUShB7zDMpJYul0dw/vwCBnlykm8mEUGko/7M2+QYt3
	lJwtUiakapUlXlT0pg1uPG7s6VSR2saI4jKjne6Zy9mKsfsf8t7vyjJ0OkZi8/AgVaq6
	GcGKMiciDkw9v667+D9pZuDgyQJae9x0ZuyBXfGRDPmrOND+BTtlK1b3Nu6tQhfS7K36
	SngC6cRxI1vf+/AdfQ2vfkgV35N7iYyxrMDk2VW1NYV/n1BNz+cbFVeNQn4y7uMtyX6d
	7XcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uc/1MDPUHopUr/jbXgXCRoVJu/hHIUz73yoImSe/9bo=;
	b=cF+6n2O95W0v7T7UGFzUT3NuppRinA1KEcxVuJmgF/QtTLT5RJDYA7oyhyrxBX7P5g
	EU7iyTSzfl/AUnkOSmjuPGyBxyFumdhiCXoNxQo0OXZ+KSa4HIAJPQZ/ygFMmTWHqpt6
	ci8YTpKFxj+QOVpkudTXZD+IOs7+rajx1pvM3tL0TCGwsEifnR7uXIQfp7Cb5TUHK2Wf
	oBQrFWZ7nRHRso+MUg0PtZD0wnQbxcYx7IdLO5RZsxKvcNMAumIJm5ZT3p4zc9qYbX9S
	02NzSvyc4ubyv4/q15tZlGiZkD2GvC+Ka2Feb/e5dyXVz5vWMm7eAdl1/Ag0ky/UsLwt
	gzZg==
X-Gm-Message-State: AN3rC/5njtHfG8TI7Ky94HOCCXlfrCCOF1aZojdLicrv6bCB9u1tq8iq92V1OV0soVZDww==
X-Received: by 10.223.139.22 with SMTP id n22mr1503277wra.38.1491982737494;
	Wed, 12 Apr 2017 00:38:57 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g11sm9632665wrd.11.2017.04.12.00.38.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 12 Apr 2017 00:38:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 12 Apr 2017 08:38:47 +0200
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20170412063847.GA3855@jama>
References: <20170411013850.GA25337@linux-uys3>
	<CA+chaQcT7jApSyB4SqwPhsn+Pn_XTbryPT0FQZ_ST0OKDTH5xA@mail.gmail.com>
	<CAHUNapQdr_o_F7DbjNkmOYLXiMnntZJEKgw0+HVncMs6kC-Pmg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHUNapQdr_o_F7DbjNkmOYLXiMnntZJEKgw0+HVncMs6kC-Pmg@mail.gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: Drew Moseley <drew_moseley@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: having llvm available for gallium
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
X-List-Received-Date: Wed, 12 Apr 2017 07:38:58 -0000
X-Groupsio-MsgNum: 96190
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2017 at 03:22:52AM -0400, Trevor Woerner wrote:
> On Tue, Apr 11, 2017 at 2:52 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Check this:
> >
> > http://lists.openembedded.org/pipermail/openembedded-core/2017-April/13=
5050.html
>=20
> Excellent! That works for me :-)
>=20
> Is this a fix, or a work-around? Is this something that's going to be
> applied, or is a better fix needed?

Depends on what exactly works for you :).

In my builds I have khem's change reverted for oe-core mesa to find llvm
=66rom meta-oe.

I don't use meta-clang to check where does it install the llvm-config
scripts if it's different location than what we have in meta-oe or not,
but I assume khem was testing his mesa change with meta-clang's llvm.

If it's different than it would be nice to unify that first as discussed
in:
http://lists.openembedded.org/pipermail/openembedded-core/2017-April/135468=
=2Ehtml
and then use the same path from mesa configuration.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWO3LdgAKCRA3VSO3ZXaA
HHD1AJ0RBbyF6Nq3+9FR1WpPaEg/b8FZBwCfbEjni6zBaNjiKrGxnos9ZOmCAtU=
=xDjo
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
