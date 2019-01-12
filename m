Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id C38B27BE41
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 10:19:11 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id q2-v6so15032948lji.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 02:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:references:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=/60JpVMD7UNFkbes7a/33K39Tw0f7GxbmBIhqpjgdgA=;
	b=jSi6gY1es9CwYb/u2pAgwhOyXgV4aZpipoMxdMhweiFMFlqzpsNO6VrjP00I8lHPPz
	i9Mc0jFg6m/gUzBp/Mh80ECDJcm0Iw9BxXlK+9+AD1BQsfb1epIMGK0ZIYdFA1THpnwW
	mhyrTYhNVixunUwUdmQI1MzJsEBS4/3BkxB2gfQJwPYiUfPJfcNjT4VtlnrpRWEwdhAB
	YlzOyQt0qOht+7nTC3ysPtJSxsVWqx718lVhkQMewl1MdfM6dUWLPd6wxaUYw6i94DHa
	hyfZzfjPp0Rcnmc5UbPz9zecpu/egrSAz4P/cmzsXrgWOq+TuGbuiYygnJisZGY55xtO
	Oy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=/60JpVMD7UNFkbes7a/33K39Tw0f7GxbmBIhqpjgdgA=;
	b=SqftoZdES7tggPD7C2PRekoBzSwFlW19lmjk5U7mdkKNhY1sVScPszTMp8RLUPbPMu
	uuIqzrbSYiSUqtFGQG77muEr+kWg6XuugUnWyAodx0E/hhKYroFEoYfN7+ERxt3RqOxK
	+PULz5F96zL/hll4L2HVTenMJHa+7VyURVOFlHloIyNF9KT5DIGmVRV7W5YU6bCNsJ/h
	qAI8B2rPXXLtwJlEnZLGbA+Q9pNQUFuXNjJDiX6WSTHtdzBZx6n78AnJpJRFwMYhhZ8t
	hKdp/o86T8eNv5+IGGneiFOC7zV071vtCnpnO5lcaz2NTC5dTA9XJFVBmt2PwAfAM26d
	k4ew==
X-Gm-Message-State: AJcUukex1DQG+VBYXcj8VlBrE5Ha/Qtfqnlf9sPNAqNjOhnKLW1RgJBj
	SPM3Um7KB2XqFa1f1CBg7srH5MGz
X-Google-Smtp-Source: ALg8bN6ClynlsMoB7Fz/T+Vomx34oTC4uxDUJCsbm4IlddadQGe1rcQFt5O279pp/sGmggpAExzyYg==
X-Received: by 2002:a2e:6f11:: with SMTP id
	k17-v6mr10161448ljc.94.1547288351892; 
	Sat, 12 Jan 2019 02:19:11 -0800 (PST)
Received: from tuxracer.as41781.net (nat18.vpn1-no7-iev.as41781.net.
	[193.34.155.18]) by smtp.gmail.com with ESMTPSA id
	11-v6sm15985692ljv.1.2019.01.12.02.19.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 02:19:11 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
References: <1545085793-30072-1-git-send-email-serhe.popovych@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=serhe.popovych@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <3bdd78a0-5bb8-6e63-151b-116867981686@gmail.com>
Date: Sat, 12 Jan 2019 12:19:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <1545085793-30072-1-git-send-email-serhe.popovych@gmail.com>
Subject: Re: [PATCH 0/2] multilib: Fix and improve support in musl and glibc
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
X-List-Received-Date: Sat, 12 Jan 2019 10:19:12 -0000
X-Groupsio-MsgNum: 119994
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="2UWTT6kOEIxSjnMIjHnmJKzLzoRXMTKka"

--2UWTT6kOEIxSjnMIjHnmJKzLzoRXMTKka
Content-Type: multipart/mixed; boundary="JtyK5tZimzq0CnjtEkpRPDfDNQyQKBUab";
 protected-headers="v1"
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <3bdd78a0-5bb8-6e63-151b-116867981686@gmail.com>
Subject: Re: [OE-Core][PATCH 0/2] multilib: Fix and improve support in musl
 and glibc
References: <1545085793-30072-1-git-send-email-serhe.popovych@gmail.com>
In-Reply-To: <1545085793-30072-1-git-send-email-serhe.popovych@gmail.com>

--JtyK5tZimzq0CnjtEkpRPDfDNQyQKBUab
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Serhey Popovych wrote:

Does anyone have time to look at this? Reviews wanted!

Thanks,
Serhey

> Both changes target ldd helper handling in packages:
>=20
>   1) For musl this fixes do_install error where ldd provided in both
>      main target and multilib packages.
>=20
>   2) For glibc make behaviour inline with musl by providing ldd
>      via RRECOMMENDS and avoid filename clash as fixed in 1) for musl.
>=20
> Build tested on IBM POWER8 running RHEL7 machine for ppc64p5 as main
> target and ppcp5 as multilib with package lib32-glib-2.0 from Yocto
> manual.
>=20
> Boot tested as KVM-HV guest on IBM POWER8 machine.
>=20
> Serhey Popovych (2):
>   musl: Fix ldd symlink install in case of multilib
>   glibc: Rename ldd in multilib package
>=20
>  meta/recipes-core/glibc/glibc-package.inc | 7 ++++++-
>  meta/recipes-core/musl/musl_git.bb        | 5 +++--
>  2 files changed, 9 insertions(+), 3 deletions(-)
>=20



--JtyK5tZimzq0CnjtEkpRPDfDNQyQKBUab--

--2UWTT6kOEIxSjnMIjHnmJKzLzoRXMTKka
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJcOb8dAAoJEBTawMmQ61bBfFAH/2VGsi4jBwhUc1FLYmqw1TrW
4RhAkw553ixBXt6SvYm3YMI8CQt7OKr47pv4n6Q+3MIC53svzrolxxsU9QO5FaLg
qmPpOX5MCTghjeOBknoIkPwrFOHDIr3Xxm/ZSkD2ZWW1kMJX0RuH76Njbq4Aov4n
oatqYryMU8CMb62cWfbuf7+M/Rlf/fFJmkFw2cz3z63PT58u2JDoVWsNh01++tj4
qszWvXdQ0cwYasDjVXmsUbad5kDBsW854ShlLidq07jbmyABEwi4qHrtWKwdGZqQ
MyovdzNnbC3JxG/Sll+4WifmHM/V2MOl7nsMmGrASjgx2jUgUYUbMelZt1gLVUQ=
=tEA5
-----END PGP SIGNATURE-----

--2UWTT6kOEIxSjnMIjHnmJKzLzoRXMTKka--
