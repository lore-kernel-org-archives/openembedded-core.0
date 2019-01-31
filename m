Return-Path: <trini@konsulko.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id CDF907C3B0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 19:58:57 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id q8so2681678qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 11:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=54QevJWSZaZpabHp1Ef09cfR1FMyEGDRUL3qRTvPrC4=;
	b=YjAA4OQAzwb9A8SHW6OCAze3zhmPXHYo+/mbHcBKquIB2dcM1JxDFpOnALAZKdZx4h
	+Dd/349BmrxvtrkaFFLJKrbdLB1xjXt7IwS/XkRWfLIf+ntP3B9wwBI9sTL5/069azF7
	WOdgy2yimXd8mzBxgqbK8XILrgo5dtW+SdgGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=54QevJWSZaZpabHp1Ef09cfR1FMyEGDRUL3qRTvPrC4=;
	b=MAMQo9eHpkgjfgTfCOFFzMr0ZOCwlru8EvCe743JAV6p2CtC75pXz0ZmJKMVS+ej3l
	KmIOaPnJqDKzomzcM3iPwHEhQipzThlJMiJHlMakYPciLIDuVmZVgVev8iybCQIYLqce
	SylurcKeVUUwA8vOgNzJIgafvKffDVp/M0j7uBmRRPrHwp7Ld40bueoTN2s8V4funnF3
	h/0dMxvn8DIOs7nv0J5jEevAWQnspKcRJ8GYIqps4Tm+dzCrm1PlRkt/z2tHwbBey03C
	DXFnJzKwp9+c7Pi6zvdcK1ZCi5AaSk3sPGC15eMLG6aQv2N4LGrn4ThG6RRGUGJlRCq1
	03Mw==
X-Gm-Message-State: AJcUukdDOK4dt5u3tZuhAN+orNtODsv4OpgGjgvHZCuVm28RkEOIwY1B
	kbQRrt5gaB11aoNlVBTmvZJUjsO5l6w=
X-Google-Smtp-Source: ALg8bN6lzQD9yHlFx7pB3pd9vAT7j1xEy+GvdOLV2vc7Y6YVY1UGk3L6vqkX5oKVd/Ru94cglmapXQ==
X-Received: by 2002:a37:2e42:: with SMTP id u63mr32923537qkh.249.1548964738515;
	Thu, 31 Jan 2019 11:58:58 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-82A1-BACA-3AFF-FE98-1ABB.dyn6.twc.com.
	[2606:a000:1401:82a1:baca:3aff:fe98:1abb])
	by smtp.gmail.com with ESMTPSA id
	z207sm4679637qka.57.2019.01.31.11.58.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 11:58:56 -0800 (PST)
Date: Thu, 31 Jan 2019 14:58:54 -0500
From: Tom Rini <trini@konsulko.com>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190131195854.GG30838@bill-the-cat>
References: <20190130093406.10391-1-bunk@stusta.de>
	<CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
	<20190130203129.GB15086@localhost>
	<CAMKF1sq6Syjj5D3YT463z+d4NiVRaFNmTvM6gww5npLGvWR9nA@mail.gmail.com>
	<71ec0253d1285a927601d9a33c860d5b856a83f1.camel@linuxfoundation.org>
	<20190130224703.GO30838@bill-the-cat>
	<20190131190453.GD28875@localhost>
MIME-Version: 1.0
In-Reply-To: <20190131190453.GD28875@localhost>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: add devmem
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
X-List-Received-Date: Thu, 31 Jan 2019 19:58:58 -0000
X-Groupsio-MsgNum: 120747
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dmVtbNsdrXqYZXhl"
Content-Disposition: inline

--dmVtbNsdrXqYZXhl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2019 at 09:04:53PM +0200, Adrian Bunk wrote:
> On Wed, Jan 30, 2019 at 05:47:03PM -0500, Tom Rini wrote:
> >=20
> > I would also ask if we should be enabling more stuff in busybox, period.
>=20
> I don't think the current status quo would be a good starting point for t=
hat.
>=20
> Before submitting I saw CONFIG_PATCH=3Dy, which is a lot more of a
> "Why would I ever need this on an embedded device?".
>=20
> Not saying that you are wrong, but the starting point should be a review
> of the current config.

Yes, somewhere between an audit of busybox and making it easier /
clearer on how to remove busybox on a "regular" image (core-image-*,
etc) are on my TODO list.  You might also get surprised btw where things
like patch get, erm, differently-used in systems in automated ways.

> > Customizing busybox for what you're trying to _do_ with a custom setup
> > is one of those top 5 TODO items with making a cut down image and
> > customizing the kernel config.  Outside of -tiny and initramfs/similar
> > cases, there's not a great reason to use
> > almost-but-not-quite-complete-busybox-applet compared with the regular
> > app.
>=20
> I frequently end up in projects where I do have great reason for that:
>=20
> For root filesystems of the 32-64 MB size it is not necessary to use a=20
> different libc or use -Os, but using the busybox applets when they are=20
> sufficient saves > 10% filesystem size compared to the full versions.
>=20
> E.g. 0.45 MB for a standalone tar is much when the little functionality=
=20
> you actually need is also provided by the busybox applet.
>=20
> Plus there is also the convenience point that most of the tools you need=
=20
> are already installed just by adding busybox with the default config.

Right.  This is the -tiny and similar cases.  Busybox is great for a lot
of things.  But there's also common cases where it's not.

But the reasons I object here are, aside from what others have brought
up about devmem vs devmem2 vs putting stuff in DTS files, etc, is that I
really don't want to see more implicit deps to busybox added in.
busybox is in virtually every single OE fs image, so I am going to argue
that every new utility we add there needs a real good justification.

--=20
Tom

--dmVtbNsdrXqYZXhl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcU1N9AAoJEIf59jXTHXZSw+MP/R4IUgefQESNkrkeIq3c6X0v
nDwoXDkAStdpl4lyAVJ8vckRi4hvkGctQexS8Q7oCIgAzSV0DmLAVgm3NvP3OXxn
H8MdJWcCp+Scesaiql99t7GLvqIMcuCTUdZ4pyyfXMALp99DtKcv9hwk6h2g39xj
DoAxQUWcwyUBYuhGcs0bQ39F1TduHTcZlx0ThgHAjMQlgJYZWPohKJl9YmiiBpo5
rA/iUXjzSQywv5fok2KkIsfxxXZcpCnqmWS6pUKtFYjBQfuLrR/enfnB8+m4KiJj
Ch7t5o05psYTUnQroA0gV2Ecwl1rF/y83HRdmya0t0Qw7kCjmEi/wxMOq3iowx6B
yJ+JrlwghwPMF0pvonbJvKQGWjMlLJqdIq0zckholB2t1vAkKO+/nElci3aEZ12B
6sifHATDbZB+6rWv57lMLCbySpqzdklqd4f9JkKPDGHnN9oUTPEwXauBB+A+n8qG
st2z2P1qfEHJnYinIEjspxRbgOlmOZXaIAOoFPAkbskDV56Wan3Ndm2I67rDATT0
LJHxLc8te56MlOHZhi9qwAT5v/EZOQRdSn65QUucBcd9YX3uKD2R53tRT0oetwEZ
EjAI7HohamiD5W2ThdDBoXjWwmezRjuAH5HoUFKBGfl/net1tE80UeD9l2Yy6JbD
JvBOJbQ1mxKIC9VYmbwd
=6cz4
-----END PGP SIGNATURE-----

--dmVtbNsdrXqYZXhl--
