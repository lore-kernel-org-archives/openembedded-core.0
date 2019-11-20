Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id 469F26D6C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:50:11 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id d95so10343716ybi.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 05:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2g0iBiA1JlRYYRCdtVj87GCXN9aTQH3wXNqfkC6/8Kg=;
	b=PNgS8V/p6RM6WBBrCkpXViUD/u8IU3f7jTf0pDf8rM8bHgmJWy0YTcWBolPKM0UdJI
	g42SMah+1C6R1XNBjIWh2FLZmfluc3HbCe8l1NKMBuRqJil/z6EaLi+gFiwhEppKq5Yz
	P2VYegkLkIsCYW2XlDqk3JFtD+aAFINjaWp6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2g0iBiA1JlRYYRCdtVj87GCXN9aTQH3wXNqfkC6/8Kg=;
	b=Tu7VzWxsUCO4cKqrJxFfuUF2yeCX3DHe/iIY4OZ2JkIMYKlgtTQEPG43U8GUpwKtRA
	EA81lfzG+toLeRZCJBtgqSzWqOq2EYF1FCQR0guidpaGmKLU5GQJ+gBkrIDW0NSUhl5j
	4PuVXU+hL3f8JiOp17ZHL1/8XsAj58yiS+qAlA8ryHllb3O1VPFe0HYryuDoexWxwOBF
	espdbtXoeKkRFz2aa6ltCvZFPtLQy5TpoZZa44fw0gOTGcviKzDVz82B6/p19h4JICJa
	CYrNXqZd6PCxzNbc6P3Lx8xc6/jK3Afy8wV0uTNaAgG3jQzZ5EzWnclyLCFZSkBnk/+X
	YQRQ==
X-Gm-Message-State: APjAAAUt6Z9laKpAPOxAlDfpi9Eff1eXGtwYJ/SSJfQZm8yK7tqCO21t
	Gip1mrdHzNwOZgJW1GjvaaJ9Eg==
X-Google-Smtp-Source: APXvYqwft5bxCW81TwBnOMaMEM3Bgo22QbJ0071dxGs/NJVrA9YZJSFZ4k3Vq03DuMWAnl2D6PNc+w==
X-Received: by 2002:a25:da52:: with SMTP id n79mr1951470ybf.194.1574257811844; 
	Wed, 20 Nov 2019 05:50:11 -0800 (PST)
Received: from bill-the-cat
	(2606-a000-1401-86dd-4822-cbc9-ba3d-ee00.inf6.spectrum.com.
	[2606:a000:1401:86dd:4822:cbc9:ba3d:ee00])
	by smtp.gmail.com with ESMTPSA id l1sm13098515ywh.9.2019.11.20.05.50.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Nov 2019 05:50:10 -0800 (PST)
Date: Wed, 20 Nov 2019 08:50:08 -0500
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191120135008.GA19317@bill-the-cat>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<20191120125602.GZ19317@bill-the-cat>
	<CANNYZj-EUQb2gjw923rv-fMDOaGn+fe59AnA7B9oSkgk6de_xQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-EUQb2gjw923rv-fMDOaGn+fe59AnA7B9oSkgk6de_xQ@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/13] python: update to 2.7.17
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
X-List-Received-Date: Wed, 20 Nov 2019 13:50:11 -0000
X-Groupsio-MsgNum: 131618
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TVJUn0GYqhF2Kn75"
Content-Disposition: inline

--TVJUn0GYqhF2Kn75
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 02:47:19PM +0100, Alexander Kanavin wrote:
> On Wed, 20 Nov 2019 at 13:56, Tom Rini <trini@konsulko.com> wrote:
>=20
> > I would _really_ like to see someone move master to using v2020.01-rc3
> > or so for U-Boot as that should not have any Python 2 dependencies left.
>=20
> rc3 means the final release is very soon, so we'll gladly update to that.

Well, the release is scheduled for January 6th.  I'd really like to see
more testing in no-python2 environment.  I believe the Fedora folks have
confirmed things are good now but it would be good to see OE do it too,
especially on master and not too close to branching out another release.

--=20
Tom

--TVJUn0GYqhF2Kn75
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3VRIkACgkQh/n2NdMd
dlKLZA//aPkq5QUzGZrSbJuJ41usqYuUxX5TtwtIlH/opaw6Aa79YYaLuyCNJrIC
OedRE1LcoKN2ZUQGG5DwfcHueZWhS6lIvleWJ/1K0WgpUulz/Wr6cX3C+y0iVvRi
5u5tbOVers+6Xgmeu5aiqh0GDMEbQi3IuBLpOgHGisAZt4nIXaycYS3ikAkYyAtP
3taj4XygazqSK1rNMYA00TZ1LqqoGbuS7LKYppTI1v8ru2WNELmL8UsSE56wDnl1
PlfnsIOwCJeyiPJZw5IxP7LEV5Uhb2WCfAeP9wB2VDoTeSqxbJYj9+ziEzhGFXlj
9qyHKKtMB4ul/U3VvPP1qFY+c1ormz5dEVB0F+sdXrdvieOyXfZ1lDhWXLdqPLLf
mYYThDvTn2jF8fqWLjJUQNeWQmeXAw+S5rfJHq+915z/Sg1JQv2MJUuuO76YD1Pf
Jv2hVkbK7sQAXLubLIQyIhwuRp+0GpN5FhKE+2ECNBrckoLC5UYqS81LRseQdf8h
1J2+/2oCO5DV9PM86XAnQ8LVzkJRJ+Au7i8aEP31x5xCh42dIcb8tM/P6cx7r3mi
lMyt8YgLqrqpbKVqWMtyPrcdssVC4AH6h1SXEKYYncT0nibSz1LvC/VQHDirJ6Q5
ICPuspphxoHaqLzaQMi0DwIIOxx5/9UJJhiSJnNFKZAp5o0zRLs=
=SeiT
-----END PGP SIGNATURE-----

--TVJUn0GYqhF2Kn75--
