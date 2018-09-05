Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2ACAB793EF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 20:53:04 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id s17-v6so3855760plp.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 13:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=vs0qPWg+Od0m0z8w1rscRlk2PL/pd6wTxsRSNtwFNCc=;
	b=rPm6egKboKScI+sJ9WrcrqCuzQL/aT/JKnmkEPWG1h0zIgk9p/O8XziNGk3xgs8GXv
	imiuMMd4qlkYREFYhllkMCShoOgD8r0RXL7y+hcXLvHRDZhUz6W9CvO1p0tv09Lh6plX
	ZhyG4Eq8TCc7pwNJ5W+tlhnWdqQ3oNPzJMLuIJNXOWirgJJUDkbxcqXUkcySLJ6alwn/
	5i0S0IljqroklLwbAOf6DHCET0q6DFnx+cCEgcaRLFJtimCTcm/wikKFzu/2seRr36Yg
	wU5X8VIBoD118wFR7h87QPj3OiVPnY57mrf95ZxcGkkEgneWqmQSoxbl3eTxUXXxBTyC
	jlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=vs0qPWg+Od0m0z8w1rscRlk2PL/pd6wTxsRSNtwFNCc=;
	b=aMwSPgp1MKcx66w5DIrnAt03jw6Ja7iVLhNGLjrVW8jef5rf8sWpn5A/sO/muTAxVd
	6A5JNKx25mzeDyO5rL6vJs4BtZ2XHKGTNzMsKMSqsnOyJdYjdIyD1LwkX4fTL1fte/vz
	SJ41ui4WwlT0hWKcPVqpA5k5Kxdu1X/aqFn/ETelSFC6o4sz9Pq4/XVHrfXB+9jhOsjy
	Cb/pxwF6lqUiv796RJqjoUmrregN3/JeccqZBemcBr6MYEs2UXgzc1h5sSSfxmDQrU6i
	RUh1eiXVwnouMcUx0d7Vj/Q5N6T56IgbO9ygn/tRTmDirIHO3Y5Fu8GqGECWfsw0q9Hg
	DLxw==
X-Gm-Message-State: APzg51B3CvZIsvrw6obSlDmk0JXCQl/FCkMzI1U/rMBJsiLLuoZkf6eC
	7+dtoGpeNOoVgGYy9IsI4gnHS4DZ
X-Google-Smtp-Source: ANB0VdY67XmGNTZQec5aq+5+5RDVh9WBHxpAvMlyL6wh6X7+zqH6EvWKCohmKX8DY4DkPTfpTkvOwg==
X-Received: by 2002:a17:902:82c9:: with SMTP id
	u9-v6mr40652412plz.138.1536180784819; 
	Wed, 05 Sep 2018 13:53:04 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:3dff:4b7f:4b07:1058])
	by smtp.gmail.com with ESMTPSA id
	d9-v6sm4114537pfb.86.2018.09.05.13.53.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 13:53:03 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
	<20180905165227.29435-4-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <6fdfea5f-acd2-0644-89bf-4de5525ecda2@gmail.com>
Date: Wed, 5 Sep 2018 13:52:59 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180905165227.29435-4-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 4/8] binutils: Fix variable conflict
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
X-List-Received-Date: Wed, 05 Sep 2018 20:53:04 -0000
X-Groupsio-MsgNum: 115886
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="CgxgGq0wRg1v16oHAEZiFY1fb77mYEBfn"

--CgxgGq0wRg1v16oHAEZiFY1fb77mYEBfn
Content-Type: multipart/mixed; boundary="E8Y6urHlDPIUdQQtBu32PW2qjjI70OBFB";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Message-ID: <6fdfea5f-acd2-0644-89bf-4de5525ecda2@gmail.com>
Subject: Re: [OE-core] [PATCH 4/8] binutils: Fix variable conflict
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
 <20180905165227.29435-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20180905165227.29435-4-richard.purdie@linuxfoundation.org>

--E8Y6urHlDPIUdQQtBu32PW2qjjI70OBFB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/5/18 9:52 AM, Richard Purdie wrote:
> A recent binutils patch added the LDGOLD variable but its already used
> for controlling EXTRA_OECONF options for gold. Separate the two variabl=
es
> to different names to avoid build warnings and confusion.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/binutils/binutils.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes=
-devtools/binutils/binutils.inc
> index b56fcd4cd01..81ecbb50cc1 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -38,8 +38,8 @@ FILES_${PN}-dev =3D " \
>  # Rather than duplicating multiple entries for these, make one
>  # list and reuse it.
> =20
> -LDGOLD ?=3D "ld.gold dwp"
> -LDGOLD_riscv64 =3D ""
> +LDGOLD_ALTS ?=3D "ld.gold dwp"
> +LDGOLD_ALTS_riscv64 =3D ""
> =20
>  USE_ALTERNATIVES_FOR =3D " \
>  	addr2line \
> @@ -50,7 +50,7 @@ USE_ALTERNATIVES_FOR =3D " \
>  	gprof \
>  	ld \
>  	ld.bfd \
> -	${LDGOLD} \
> +	${LDGOLD_ALTS} \

aw my bad. Thanks for taking care of it.

>  	nm \
>  	objcopy \
>  	objdump \
>=20


--E8Y6urHlDPIUdQQtBu32PW2qjjI70OBFB--

--CgxgGq0wRg1v16oHAEZiFY1fb77mYEBfn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW5BCKwAKCRC7BTNVkZ0z
FBGoAKCNMYOvAS0WG+z7QKgZACtIlH6VSwCdGve8Y9NUqp08NqosjU13jeCKrSc=
=cHsg
-----END PGP SIGNATURE-----

--CgxgGq0wRg1v16oHAEZiFY1fb77mYEBfn--
