Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2F80F7851E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 03:38:23 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id c197so336369ywb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6FDN7eNpsQYv9xfM44PUul2/KISCDuvZjOrza2TSFBE=;
	b=izXlvHUzPNF4AFwRmqOXuGT9FowuoHjpiqWq37T3IqwmLji04QQGJF0EU/i85ZN4HV
	hVkU3I8WGXfFgVqtC4S9KZdEC+fAAkHDA+NGrgMW4AJp5/cPnIDbPP0s5+lNvpFCXrQc
	EcCPrb0+v2Tp6sOccbWZ2lxFXFGnveU+KauCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6FDN7eNpsQYv9xfM44PUul2/KISCDuvZjOrza2TSFBE=;
	b=Hqp7bwOelSgUDY5edGcbAYkfHZz98MTiTGHlMWeB+kxsfaffEUVL8psY0MxNXsosLX
	hFYX0TcLR402dEbPRqErYSyEhu1RINGQkYH7aj9bog4jwd3J1hBynDX9RhAag8wAchfq
	OM0UJlftDBZM1Y1MESpw+Y/M4rDoA479+uwLN98zf9ksfqjCtjA61X1dduGlEhaLuvWP
	9fxgxupmCnP0vmbbR8IoCXc8QwyEC+dRk6hzSrS67pdjoNda9zIhiTV3Bvy3/0tQyGJe
	iwTyD0c7t66rv8iDkfR8ExVwcFPBiHLpqZHGvF1HIm2Aiq2RMwT5WPe1fQfC4xdhEPWs
	uh/Q==
X-Gm-Message-State: AJaThX6t58s8EMtKOa6VEOPobmelQkcEKkagvwnuyLAHPgEtenUThYmt
	5NsGz6rIUEmOOEFsORUkl57SlQ==
X-Google-Smtp-Source: AGs4zMZMQ8TmBXLN1tc+3AQEnj37tcdYI+QJR1sxT7hR3L0hSckEOW1m4XhQ6rqoENvAQ9mTypDKBQ==
X-Received: by 10.37.186.9 with SMTP id t9mr1205593ybg.307.1510717104946;
	Tue, 14 Nov 2017 19:38:24 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	m63sm1394353ywm.1.2017.11.14.19.38.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 19:38:24 -0800 (PST)
Date: Tue, 14 Nov 2017 22:38:22 -0500
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20171115033822.GF9986@bill-the-cat>
References: <20171114183223.7804-1-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <20171114183223.7804-1-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.11 release
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
X-List-Received-Date: Wed, 15 Nov 2017 03:38:24 -0000
X-Groupsio-MsgNum: 105034
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KJY2Ze80yH5MUxol"
Content-Disposition: inline

--KJY2Ze80yH5MUxol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2017 at 04:32:23PM -0200, Otavio Salvador wrote:

> This upgrades the U-Boot from 2017.09 to 2017.11 release.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--KJY2Ze80yH5MUxol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaC7auAAoJEIf59jXTHXZSx1sP+wQhOUgjG4uV3cfLd1sShFC3
8Yz64zLEIl6YehMAHn5OGHSRVAV5fngdGUNclETmPmXGcfIipTCJ4w6GZNj8a1kT
9HyCRrJrhu0dHiffolZbof729WwUGDEVlEVlJDVSuCSTxMzdONDGYNeiLiG6ek6T
KP+P5HJ3sEfW4toV0u0HvZ87UF2vpkaDKuZauREpz9a29ZBnHwAtHj7Zr46XHqBv
RkyP4UY3H1jl3+885YEgYkaDx99ZShpag8wIUMrRrUHWqcZQ8vho2qxrzbqqkhrU
9SCueHMobhsbvNzFS8Dj8pfCwexVGs85SX8thU5jp5Mbc+/4OLbxV8aFRFAEjf0l
vYHnBPRBZJ855Yfgt2mVzIelYeH8hY+Qa2qnJuOUM+kbV5QvkTnxXvLe7yzYTQnn
v8dEnDNugqaOH1ugHxgNikCM0cykdTn/Ecpj6xN0UOQR1xaAmT6YBvFnykgmfU1W
wLHP5SpLZYY9nvfD9DrENSuDPt0TQsbLHm4SpIVmSoyuTvFv44PQ390soW3Gbp6g
T31ur5+a9YKwNduukQa5yAWQgvRdGcNfbkIHoMYaHiBaDqmie2b/43MNGrDB14KC
yVxJvJdyDQUgPKsXyByEhFVnUjuvg6+8puMk/h0RePejYOUvG/pSVuNWa3WVmfX5
pmWdvY1zpTN5H8dLeMHl
=+JCh
-----END PGP SIGNATURE-----

--KJY2Ze80yH5MUxol--
