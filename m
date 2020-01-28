Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9302E7FE5F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 11:02:16 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a6so886144wrx.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 03:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=VShF9EXSFX2cmHb/0cKf2n7zBGiuQzd/6BozQrkLVJQ=;
	b=Y/2uQBSPGPsf4QbolOrvbpIl3SJ0/6PebfodLA/qYbvB6hMjNxOdT3sgTr6uwiys0E
	owkcqMUBt7moZUpPZGPqkEtRHe13Lqx9aiVvcApfB3f9XPFV9wMQLmqJwj78XH0Fxxuv
	VvQJ8Ld4nKDs+8KtcigaL/I7zp8rn2BR70DRbskX8g1qKOHvkU4+Y9/c/U0eaqSQNSnY
	mJ/Gxp+ZLtZhTH/IeqPsE/o87wdQFZzrUBVilZ8VpyK//5y/DxR0jwu+oibuyCytQCSw
	w9Jci0B19NSV+y2rRkkHxa/yw/VGFvhiv02yMX293ZWHkyjsFZVJESSKknRtS1BODJl0
	xeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=VShF9EXSFX2cmHb/0cKf2n7zBGiuQzd/6BozQrkLVJQ=;
	b=oGov4qn0udiFD/x3p0YMDVCVHTwCn+hJCiZmPwxzPnPwLNOPRXIkLdxouaxHtRQ5a0
	ZTD8DzMa+249tvZcmVgnTIQiCaksjcGAkZgEMvD9Z4ADarJxSDcpLZRxo0+TMJgoOYka
	q2/wVU1wPZlQV1lkOJB0m5RbyXm0IyXR82ZjtxMqXkI6YrcZBdaSYzbPHy8u8Rh2NHQ8
	oQB5rX0OcVibAbBjcYFb4tYYssOxNij31BnhAfdDMj80GzwbrymqfIVFqauxdXMEG+rV
	YTAdu7/cGmtgRhXXy8SAV1W8DOCzMMSe6lYD8QKe0wQNury685yTeeTQNuBuLuQFrS95
	TceA==
X-Gm-Message-State: APjAAAU/9Zce7f3+BXYLDL1zyqr5j9ro+9LxX9SgVaDoyWjl+/G8gnV4
	KMdp6WlPo0pk+ONuV0qAHogICfeK
X-Google-Smtp-Source: APXvYqxovCZZySiRGV9sDX16rxQszlfNFcHQY1wsBDlem2olWGIp4kzdxoUExkrLTGIWTx28Azxrbg==
X-Received: by 2002:adf:e6cb:: with SMTP id y11mr28704883wrm.345.1580209334973;
	Tue, 28 Jan 2020 03:02:14 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	o187sm2795685wme.36.2020.01.28.03.02.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 03:02:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 28 Jan 2020 12:02:13 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200128110213.3ji3swjy2km22d7e@jama>
References: <cover.1580066507.git.raj.khem@gmail.com>
	<d6dd73600145030ed93604364c66b129c8d843af.1580066507.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d6dd73600145030ed93604364c66b129c8d843af.1580066507.git.raj.khem@gmail.com>
User-Agent: NeoMutt/20180716
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/13] glibc: Update to final 2.31 release
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
X-List-Received-Date: Tue, 28 Jan 2020 11:02:16 -0000
X-Groupsio-MsgNum: 134270
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h7ormysbd4os33li"
Content-Disposition: inline

--h7ormysbd4os33li
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 26, 2020 at 11:27:43AM -0800, Khem Raj wrote:
> Drop ppc 8xx clear cache optimization, which we have been carrying
> through eglibc days, it has been redone in glibc now
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../glibc/cross-localedef-native_2.31.bb      |   9 +-
>  meta/recipes-core/glibc/glibc-version.inc     |   2 +-

=2E..

> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index dca1916e80..c2cfb7e2f1 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "master"
>  PV =3D "2.30.9000"

Should this be 2.31 if the SRCREV is the final version?

> -SRCREV_glibc ?=3D "def9c08c94da60bfb746644d56cffbe7a9de3477"
> +SRCREV_glibc ?=3D "352bb99754ae7c83ff1b974f9c52244e974c9410"
>  SRCREV_localedef ?=3D "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
> =20
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git"
=2E..

--h7ormysbd4os33li
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXjAUtAAKCRA3VSO3ZXaA
HDkDAJ9fFl3lRQJNnjHD+KSlo2SuKMCqoACfUPo3jEC8aiemrQes+otzgINknv4=
=gsLW
-----END PGP SIGNATURE-----

--h7ormysbd4os33li--
