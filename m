Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
	[209.85.161.176])
	by mail.openembedded.org (Postfix) with ESMTP id 767597199D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 18:16:52 +0000 (UTC)
Received: by mail-yw0-f176.google.com with SMTP id v7so67610938ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 11:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KhPo+NaJ/cLV9NNIdvw5Kw44KJ3p27R9mByXkej6dcQ=;
	b=F0g9X4iLVkZWIxdnhvwK7eP2D4M5kIagz0b0hr9Nb6l6FtowhZp1+0vUXKsogHujbC
	APy+ZXGwmfkuv59OKaWBVP0xgxIoAsY4MvxaWqiFgGmrDwcSXZxrnuOWYe1KPiHXUU99
	3xDaFSuhrPd7YkVaU5dFjtIykquNdBKOzpFJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KhPo+NaJ/cLV9NNIdvw5Kw44KJ3p27R9mByXkej6dcQ=;
	b=VCxxbddE4R0qBJKgbn6aOyuY9Z79er+sKhwImrEYeNmq4xjEMeciVpjY7k1D4JT+JC
	PW6gdJL8810dZrru2ilVQ6NMLWaY9F/SwcTsCpbXbHyU7sdKnssv53fc0JjKBaD0FJaK
	TBkUmR0KlbjhomB85K2d2uieV6CH3iy5J8nxHPKRb5BT+upbFy074QnUJToVo+VgGhbU
	jLWZ/tgTiBja7FINVk0K7sUrDTPs+UCLiFl4J2c9hREgtCFYBdj1U8haUZlJ5Zd7lRFa
	KX4PXM3vwDpqpugsZlQG8AGvK63VYZ/ZneD00TdvlWy3T63WSitH3HVesh/ixbvspmYi
	bzSw==
X-Gm-Message-State: AKS2vOwW6wIsb1mYy+cr8ZFXTzg1TlFR6vSLde329N4PR4c2LbR7HOjN
	f5P0f+9ybQ6a1FEj
X-Received: by 10.129.99.87 with SMTP id x84mr28313271ywb.119.1498069013484;
	Wed, 21 Jun 2017 11:16:53 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	y195sm7048028ywg.65.2017.06.21.11.16.52
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 21 Jun 2017 11:16:52 -0700 (PDT)
Date: Wed, 21 Jun 2017 14:17:25 -0400
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20170621181725.GM27196@bill-the-cat>
References: <20170620221512.21860-1-otavio@ossystems.com.br>
	<20170620235544.GO28053@denix.org>
	<20170621120317.GG27196@bill-the-cat>
	<20170621155023.GQ28053@denix.org>
	<20170621165256.GL27196@bill-the-cat>
	<CAP9ODKqZoPwo128rHr1kJfnP9590YySU4GCb3gDOTxPeG4WGrA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqZoPwo128rHr1kJfnP9590YySU4GCb3gDOTxPeG4WGrA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Marek Vasut <marex@denx.de>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Brad Mouring <brad.mouring@ni.com>
Subject: Re: [PATCH] u-boot-fw-utils: Allow replacement of fw_env.config
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
X-List-Received-Date: Wed, 21 Jun 2017 18:16:52 -0000
X-Groupsio-MsgNum: 99204
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ICrdrp3pM9DyZLTK"
Content-Disposition: inline

--ICrdrp3pM9DyZLTK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2017 at 03:01:36PM -0300, Otavio Salvador wrote:
> On Wed, Jun 21, 2017 at 1:52 PM, Tom Rini <trini@konsulko.com> wrote:
> > On Wed, Jun 21, 2017 at 11:50:23AM -0400, Denys Dmytriyenko wrote:
> >> What I'm arguing against here is some partial solution - modifying the=
 global
> >> recipe in oe-core, but still require .bbappend to provide a file. It's=
 should
> >> either be "do everything in .bbappend, like we all do now" or "do ever=
ything
> >> in main oe-core recipe and let machine.conf define it".
> >
> > OK, we should do it globally with a ??=3D of the in-tree example only? =
 Or
> > just let u-boot-fw-utils fail to build?
>=20
> Maybe the best is to allow for boards to have its fw_env.config inside
> U-Boot so people can provide a 'good' base for users. Doing so, we can
> teach the recipe to install it?

No, I don't like that.  One could generate probably-correct config for
NAND/NOR.  But UBI and FAT (and EXT4) start to become a per-distro
thing.  This is even somewhat true of MMC where it's more likely that
you'll know what maps out to /dev/mmcblk0 vs /dev/mmcblk1, and upstream
U-Boot won't know what kernel people are going to boot and then have
give a device name.

--=20
Tom

--ICrdrp3pM9DyZLTK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZSrg1AAoJEIf59jXTHXZSYewP/jS4CiJqu4zP/KIiuJq2J3F+
3kCiLtD6CqXh03gb6C9VfYDOK4X3wBg7ccaR/FDxYmAmNqjaw+H9PClHXK79k3VL
K/I0wDyoSXrKdOBlMNdud1Q0X3rItvTLnoEM3/nlB9a9KyG+5vIawBI8ll7NESrB
cuD5pq895goL5UnCOjsb0ZaIqexe3U8/9BhPRlvFWoz9nZEW1WaA0RPRVaVGuhN9
GJIRNd2TvtXIwpKnR4MxKSg7LfBHbsVdxuT09QHZ4ra322tvHSbn71e1zMiBqhuu
7RJ50mTu0McZp+ei6bELaDoKDaLSZnoqx6nVju03rsBke0NbgVc1ZXfUL4EPkgUO
Kd9QBigRFB6/0EdSKu2PdU+BfSnbBKdOuduGokxlp9UQ0ilF5FxiKbwhzYO/NaIZ
E357vYHrT6sM6/8qGW5MnhnzYIK1Brxhae76Vq9VvznspZTAkI3FahkGuLELumE5
eJiPBJyvpovTV6XmnaSSPT05nJ02Ieedm16noMo489UBhX/rBu7Z/9JyZfwxtLIH
v3d9OzJwOZOLjw7ywfcQNI1AGcXB0pq8T7FlMy+dxK8QR6p2SqGzqtIuxn72iRrl
MVxso2Y3Z9lS6X6+HoX+g5/1guQyiq3pWj7djKzm1Qj8j80ERqYHyapN+mu7g7Cf
2hDcvVgZoYtu5qP/isD0
=NOrb
-----END PGP SIGNATURE-----

--ICrdrp3pM9DyZLTK--
