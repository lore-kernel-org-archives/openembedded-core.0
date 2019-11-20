Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 39DEE7F730
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 15:08:27 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id z67so47924ywb.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 07:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JzMrI8szCRQH8h0sXrylXCxau8T+MGcwOoRybcqJ5wo=;
	b=TXu2BHlNAUgfHiUQYIM6SKJz51BgfYg5y+wxWxBmE5Fg7wIZEa8ODyVivGs01ZT00U
	Wvi2G7mnnKQTomKxBqgwD2kQL6Xws9r/RpGjGK7Au3KPzATayYylpwzUGs2r+L9qfRO1
	1Al/jK2BU3vBMui25bcN2g8EQYj3oJgnrtVY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JzMrI8szCRQH8h0sXrylXCxau8T+MGcwOoRybcqJ5wo=;
	b=qF3ptuPjTrGVTtAiZVbRyt+zzcL9kBbAp+BYJveN56FrYRn+VvMho2sbCuIrl6kl1X
	1fC8SrBBRE+so6gwQPf1p99W6ZtmPoyKqJCetEYIQzCH2JxP3nutvx2rMZvgz75kg1CC
	7pDGacwTwv7U9LWdGOcUMFhs525TDakiLW0VxA7GGnpOTR2zUnOBfFogyHMY4OQOZKch
	Fj662R4O6r8NB0M/MnYF5WbZvZxvKvF+hawLIF9pFk+5pSJ+l9S+BHds2e4cz0PzAJXh
	9QzqE07eqHmQNKLbGaPIZ6YiqY5fS7taENtJcj1wSlE/WstWpc+GEATXLIzN0tg+jXiM
	N33A==
X-Gm-Message-State: APjAAAXK6w8Im9d6+cPxAcoz8thbQ6ivVOVX9usViDHDSY04s1ETJulW
	OaNTf3WWiW8LbRoLPIeEfpQPcny6fle6CA==
X-Google-Smtp-Source: APXvYqzzgAyI7zTPHUxBeN6g1fqoww0cMah+rpPEUF7gHyiC9WLJm9v6chh0DfHGrmz2hfyMZQnCIg==
X-Received: by 2002:a81:4e4b:: with SMTP id c72mr1989565ywb.471.1574262507919; 
	Wed, 20 Nov 2019 07:08:27 -0800 (PST)
Received: from bill-the-cat
	(2606-a000-1401-86dd-4822-cbc9-ba3d-ee00.inf6.spectrum.com.
	[2606:a000:1401:86dd:4822:cbc9:ba3d:ee00])
	by smtp.gmail.com with ESMTPSA id
	203sm13183152ywe.57.2019.11.20.07.08.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Nov 2019 07:08:27 -0800 (PST)
Date: Wed, 20 Nov 2019 10:08:25 -0500
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191120150825.GD19317@bill-the-cat>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<20191120125602.GZ19317@bill-the-cat>
	<CANNYZj-EUQb2gjw923rv-fMDOaGn+fe59AnA7B9oSkgk6de_xQ@mail.gmail.com>
	<20191120135008.GA19317@bill-the-cat>
	<CANNYZj8nfXL1DOqvRSwdKxizfFiNRNuA0hFgHDa-LS47UTo+KQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj8nfXL1DOqvRSwdKxizfFiNRNuA0hFgHDa-LS47UTo+KQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 Nov 2019 15:08:27 -0000
X-Groupsio-MsgNum: 131622
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Ls2hnPWQmJqLjNH"
Content-Disposition: inline

--4Ls2hnPWQmJqLjNH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 04:06:44PM +0100, Alexander Kanavin wrote:
> On Wed, 20 Nov 2019 at 14:50, Tom Rini <trini@konsulko.com> wrote:
>=20
> > Well, the release is scheduled for January 6th.  I'd really like to see
> > more testing in no-python2 environment.  I believe the Fedora folks have
> > confirmed things are good now but it would be good to see OE do it too,
> > especially on master and not too close to branching out another release.
> >
>=20
> I made a few patches to do that, and can confirm that various flavours of
> u-boot recipe build without issues.
>=20
> If someone else wants to test a py2-less poky with their builds, here it =
is:
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dakanavin/drop-=
python2

Thanks!

--=20
Tom

--4Ls2hnPWQmJqLjNH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3VVuUACgkQh/n2NdMd
dlLGGg//WkqWVDX9br5LHXkEIHdLE8wtz4yjqri2VNAq/w8tHuSO+LMwDXAeZqqu
u7ed1eRfgE6O8QKFfrIy7LLZfp4knpEINAU7O5uo/af1eBNgL0OUxaQi4mYymuly
jRME4t1m05+4KticXsRYGOID3OApMMuiRQs4S6jk1FvrmAqsYSMh+3ZKSmIFFd9d
JRrNMpII48PxfiYCKmLPiKurabihne2Q2uK8rzBYHU17+TUtw8bKurcQMzEulGCj
pfnQxeo+vlVbPW+YFDTXvVczJtZUEyDevGSBd0e88Gf+tMAGiiL8kNH2Tjd+XUG1
r0PXEByWIKiuU6lpGu4/952ZWxBkqUiGTE6CnWsNTvEv2MkFfVt98HA9hsjzjVUJ
WkXXIo0JHvZ3dIYk/Yq7ncPCrxSCMvdI4NKhBDYqfxV/lFHzFn9isYhHdEyvRoyx
k09jIKTNKHp9wmBdjv3XpqMkVC9NmLEWiSQ5JQava3ijHthOraR8cJZc8WPWbd78
780z+96Sq2AVaV/sssYiy9ALsv0xSf5grkgoK4LmwDc63OofsnMTMrg9begCxpag
QV+Kta038DOW8NeQfxcM36LQF4JyVU3JjaeUzciVEQe0PpaVS+pf+FgK+deZqQht
jWS0NpRRnR0tRMLjB+5MU4klsi/0A8WnjHm0766eL8pgDG1iKB0=
=AlDX
-----END PGP SIGNATURE-----

--4Ls2hnPWQmJqLjNH--
