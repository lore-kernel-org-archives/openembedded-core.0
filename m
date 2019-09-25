Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id BFFC86B5C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 00:23:26 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id w10so1646456plq.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 17:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=S/4X2gYroo9s0qHdHjUtl4JMbkYi5oWfe+FYNp3MUN4=;
	b=dFd8vluEwRuNxwYTdxlbAUA2IhWLG87RFqWK4FOmu/GqCqCkD57RkOr2UloTgZyW2Q
	aoMOXYx8QopUf5sncFcurHbVHPYW4vnGg3Oj8HV8qjXJoaoXt5smwmI5NPpiYsemvI1c
	f0tiijf1t52PclEbG20SeHvgxj0bM1A/7bwHi1pQfhalkf9ed4lDf7/NRrP7A2seaV0H
	WfVsKU8XCWciGjbZ5KXal1YL+ZzEQuWdhDjLlLiakbQPD3FclR3p6/rmCJsuxVX1Pbdt
	f0JcQ5kJXS3xU/RazT+VIuciQzRMg315MBKRzGyJJmJbA1iJqFGWn8Aik9dUtuKSo8hC
	1TzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=S/4X2gYroo9s0qHdHjUtl4JMbkYi5oWfe+FYNp3MUN4=;
	b=rDce/H0YvTQfpLMeyVOqDVuDmtrYUST7qqVLiUeOtaFR2F2fYB35L8+VzyRUZkxGAO
	EcruRIPPp2n5ozlh7TZ3uQca7/pFT4hMWOeIPbjNppgkstiD02SyjOhs3+3EILZacxck
	21L+KAeytzoMIvp9UWPxuwypU9WxPUcVUbnhu0xCiX+eoOcipSpuQLZKNoFK6tjF8zLK
	z2gi8AAwZiRgKWv7pvUAaqHJpzrO7YeRV6i+STXidndaafylx+Ws2bspw4L3rm0JYVfl
	sDky1NIVloE362p7ntvDSNFnlRWK7D5zZkb77DHw4IUxgg1eFI3PuxZUZv4Kkh3GXv60
	9Yvw==
X-Gm-Message-State: APjAAAVNf9ryoriByN0Le6tK3XfBtTyapQiMjc06HNy9pV1ukKfcwXRs
	LrM5HO9uXYh29uhwqTVdSYXfWoAv5ho=
X-Google-Smtp-Source: APXvYqwI2JaxE7d/gKvcnJ4crraACDol7Wt4QY/DGPze2flkts+LWls5GJoIjP0FMiUS/osqMxx0JA==
X-Received: by 2002:a17:902:bb87:: with SMTP id
	m7mr5822055pls.179.1569371007445; 
	Tue, 24 Sep 2019 17:23:27 -0700 (PDT)
Received: from [10.20.245.11] ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	h186sm5370442pfb.63.2019.09.24.17.23.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Sep 2019 17:23:26 -0700 (PDT)
To: "Bedel, Alban" <alban.bedel@aerq.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20190731135317.20174-1-alban.bedel@aerq.com>
	<2306529da2e15035d6070ab9ba109dca6718e127.camel@aerq.com>
	<6ab39e20e78a32845410113de13dbe78b0aad5e5.camel@aerq.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	mQINBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABtCFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT6JAj0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxC5Ag0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAGJAiUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <ee76450e-80e2-7527-7296-df2e6cc83576@gmail.com>
Date: Tue, 24 Sep 2019 17:23:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6ab39e20e78a32845410113de13dbe78b0aad5e5.camel@aerq.com>
Subject: Re: [warrior][PATCH] kernel-uboot: compress arm64 kernels
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
X-List-Received-Date: Wed, 25 Sep 2019 00:23:26 -0000
X-Groupsio-MsgNum: 129452
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="QluoRuSKXaulY8rBhB89rhnP6XTHSYvnE"

--QluoRuSKXaulY8rBhB89rhnP6XTHSYvnE
Content-Type: multipart/mixed; boundary="FDqM7H7sp9tQVg9f2NnLbZ0ou9XvV48vP";
 protected-headers="v1"
From: akuster808 <akuster808@gmail.com>
To: "Bedel, Alban" <alban.bedel@aerq.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Message-ID: <ee76450e-80e2-7527-7296-df2e6cc83576@gmail.com>
Subject: Re: [OE-core] [warrior][PATCH] kernel-uboot: compress arm64 kernels
References: <20190731135317.20174-1-alban.bedel@aerq.com>
 <2306529da2e15035d6070ab9ba109dca6718e127.camel@aerq.com>
 <6ab39e20e78a32845410113de13dbe78b0aad5e5.camel@aerq.com>
In-Reply-To: <6ab39e20e78a32845410113de13dbe78b0aad5e5.camel@aerq.com>

--FDqM7H7sp9tQVg9f2NnLbZ0ou9XvV48vP
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 9/24/19 12:23 AM, Bedel, Alban wrote:
> On Tue, 2019-09-03 at 09:41 +0000, Bedel, Alban wrote:
>> On Wed, 2019-07-31 at 13:53 +0000, Bedel, Alban wrote:
>>> AArch64 images are not self-decompressing, thus usually much
>>> larger.
>>> Boot times can be reduced by compressing them in FIT and uImages.
>>>
>>> This commit is a backport of commit a725d188b5 (kernel-uboot:
>>> compress
>>> arm64 kernels) and commit 60bc7e180e (kernel-uboot: remove useless
>>> special casing of arm64 Image) from master. Both commit were melted
>>> into one to avoid some useless churn.
>> Was this patch overlooked, or is there a reason it is not considered
>> in
>> the next round of update for warrior? Without this patch kernel
>> images
>> are too large to fit in the flash of the system I'm using.
>> Furthermore
>> it is not trivial to fix this in my own layer.
> Please, I really like to get an answer here. I'm fine if there is a
> reason why this patch is not considered for warrior, but just getting
> ignored is very frustrating.

This appears to be a performance enhancement which does not fall into
the criteria for back porting to a stable branch.

- armin
>
> Alban
>



--FDqM7H7sp9tQVg9f2NnLbZ0ou9XvV48vP--

--QluoRuSKXaulY8rBhB89rhnP6XTHSYvnE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJdirN9AAoJEO6LtJn0Vuf5wYMP/AtzoC1Sx13cKqIyom7O+Tnn
eevcOopIO1oTylIep/4vuuukqt3h489kjYFFaO6A5U0z9NIJnT884vhmCUSOW1RI
slU3CRK/yx/AIdjbKvVcw+Z0qCXafHdF6EwX4+V0O/WvIH0xYmxb99oBSmIOnWAc
VkC0SYqqGqa6uN36voq4Bn5BfctwgKZ28jun8U3duTpuwYorRK0CrfwRrPyKMsvl
Pe/HibG5B82y5Qo88yMlxMpnNPHLGV1DEpbrKTMhs7E+C8rglaIXupYnz9Cwj7Du
VuhaKFEdYh2lA4yRz9JSz0bpbRhiOEogwz4/NEzwpJdjHLHrFPPJO/uDr+ayn/Zd
3QLueoDQDkMz9a+WTBkYlKIlA+mk3j0iEgoDhbsKiU63M5B9Xj3qi6H2jbhw0WaH
Nt3iygFChC+KaJedFWuJG/lpGoWgWq9jkA7eoKZmyMAkCznxxcUTyMwCjCszo7pF
iCxiXnzxW2z5cOJMnm+R8Ds8YMb1lDn2YOiulbu8QSCaGGFWEHeJgJTb5I9fKShw
3+/aFT6EjN7aS84udvz8ydkgXoTm7hEJkh8wmk0WJpLYpcAenKASOyzPyCqBUV22
lpr3W53/UyBQbKKv6QaDIDB3i7hUAWUQblT0aDYKSfOIROOJZV4NxX6NkKXRfFMX
BenIqZUegFJKwlo84oRY
=dlcW
-----END PGP SIGNATURE-----

--QluoRuSKXaulY8rBhB89rhnP6XTHSYvnE--
