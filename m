Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7D6F578898
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Feb 2018 18:38:13 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id b20so3884599ywe.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Feb 2018 10:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=n5KekgZjAdGHh8NR6riEDpWgeG+qZwYWoJoUq/7aqTE=;
	b=BDQ8G1nCi+kcPU1wXUfQLmtJeJZR7EiHUUfpvOX9GHbD3o3ooXFOZapi3THWqAQfGK
	0F0VO6Jv4gg/Y1yZqc53TY+e7XAQLFR06ITNaq+9yTb0LbmvEoFRY0wtZlK6fIh6/OrR
	K752V3na/6KS7FHCfGcPZe12ohqh/mEOl5AFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=n5KekgZjAdGHh8NR6riEDpWgeG+qZwYWoJoUq/7aqTE=;
	b=K5pdYe9fTb6VJ8AigHbhfs7MzT750fKPvi4aIWedzh9S8Zjlksl3bHuPUF0oWEoWtp
	GPPyDhgniab72V6xcElR6pbSwE4qia+/spGmRRmAhjqm6IEDkaofsCcGT6j8HRRrmvEl
	Pa3qgABpM6RiL2N7FoM+iA+h/SlwiPOWlkUhO9oO7VCo9bwc6FiB2ERZxjw408vlqOx5
	fgNaaUqKCDBfISC8LZkF70lJw7XHbU0A0aqvlznKYZwcGctFO/wg4RJMeadEjl0+jMpN
	fO+cb/Mg6E97Yra4j+gT+o/bIAkrLYcTIB/can93v/H847EnoC/MXH9IZR/kVgWyzVa7
	Xkww==
X-Gm-Message-State: APf1xPCfsybjS+Smyr8m5kLcS522KMjWBVUN34/SZ6g7W/okVXWs+6B/
	cUJdYajV5SMOorx466stbgUlhg==
X-Google-Smtp-Source: AH8x225CpPqV2Kvba5sMiReQp16DCuUeN0+spEn3Vt+zyR94bgClhNhBcWaOWm3uKHDsQHJ8Bf+nyw==
X-Received: by 10.129.242.1 with SMTP id i1mr3785619ywm.265.1519497494484;
	Sat, 24 Feb 2018 10:38:14 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-80F8-6172-C866-F8F3-5207.dyn6.twc.com.
	[2606:a000:1401:80f8:6172:c866:f8f3:5207])
	by smtp.gmail.com with ESMTPSA id k2sm1969367ywi.52.2018.02.24.10.38.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Feb 2018 10:38:13 -0800 (PST)
Date: Sat, 24 Feb 2018 13:38:11 -0500
From: Tom Rini <trini@konsulko.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20180224183811.GL4311@bill-the-cat>
References: <966e95a6-4401-5c12-b69c-9bd37bb236fd@gmail.com>
MIME-Version: 1.0
In-Reply-To: <966e95a6-4401-5c12-b69c-9bd37bb236fd@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] meta-openembedded/meta-oe re-org
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
X-List-Received-Date: Sat, 24 Feb 2018 18:38:13 -0000
X-Groupsio-MsgNum: 108379
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="93PtfIrfSh2q5s6/"
Content-Disposition: inline

--93PtfIrfSh2q5s6/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 24, 2018 at 09:56:42AM -0800, akuster808 wrote:

> Hello,
>=20
> I am planning on moving some recipes to new locations that are more
> in-line with their function.
>=20
> Also, I plan on adding *-shells, *-dbs, *-security and *.crypto and
> moving the appropriate recipes there.
>=20
> This might help facilitate folks signing up to maintain a grouping like
> recipes-crypto if that is their thing.
>=20
>=20
> I will be sending out patches later today for review.
>=20
> I have staged the changes @
> http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=3Dakuster/m=
eta-oe-reorg

Should some stuff perhaps be moved out to other layers?  More
specifically, should at least tomoyo-tools get moved to meta-security
with the rest of the tomoyo stuff?  I have less strong opinions on
leveldb (but maybe recipes-dbs instead) and passwdqc.

--=20
Tom

--93PtfIrfSh2q5s6/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJakbETAAoJEIf59jXTHXZSYEcP/3w1FDmbTQnqgMgQ2iohUv2J
IGdqAlCnNbyH7JeYbcccRxUlHswj8xAVzuJzhP092pM7/iA9vvG4I7l6Bj4qVohY
JzRbXo1kOV5v1+Ig/JpkUVjUJEWczhcc56ojhvqmVex3WGTdox44CDdYq/2M9YQz
xVQ9ygWtJ5Xw/KXL15/3fXbttfw+tc2igxljJW+DrXggjJ/qZwzFF+RVavfnmxOX
wHvKy+yyhIAlC7sfJRPgD/Co/kyNnIA7bVvtwhPRKSC8dDSIVhZz/x74pNT0xp9X
+bxwVNPCsj0XQXeuI0wdy7iE5J84IP4zjOL42kpVTvmXgElkABqL7BoBRjZJU6Zi
vqREklMcW7rXyXSLPLmWuVsKzhkvBlceA2mwXXn8KezE2QHP+ZprgFdIYO71/Knz
sGSX4S4AldAkcdNwcPR4AOKMVaVETlM2RyD5hdYyHuFX5aX+UE34MW3v+bb40iN/
3d3CwQ2xH0Ef7mjBKs9YVQvg+PrTBCSqBRA3Ek8iETehUcF5G8sKxAZGcQIg6CTR
XNt0sYcMKArUsa2PZJ2lVfcgZvJ+DaYkTWXREas4S/+6pkB8+MhgoxtGAnk9Jz17
dReOeGO2XC74equoKXt2iQeZXY17SPwTOSVzNAFsu7b3ipOtlVGSeAZXdxUxwh0p
GFtNWVjPlW2QoU9xri9e
=fzCn
-----END PGP SIGNATURE-----

--93PtfIrfSh2q5s6/--
