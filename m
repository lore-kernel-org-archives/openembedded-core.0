Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2506560125
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Oct 2018 18:24:57 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id b9-v6so2700805pls.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Oct 2018 11:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=yiDBCUsgMynJ+a8pXTAm8sTPNsbuEUMuU5puVZCd6NI=;
	b=Paj5NoHaZcTkwRzQzOYlTlvqVj9FNb0m4cdLGkKC/PgFK6lvN2MJXGYe9FYXyBaIDt
	0871FnMJzIgnUU7lp6oj6RdPgHCAYgwZeAL9vXpOB9NhNaL5MnCyRxlCT2/RFva50wAD
	xPVfNaub24OUN3c/rTMnsOHsnstTihO4wrWUNpnm6FX+J+Pic9E2+wDySOt8d9spLO+v
	e3t67i6XjND5Bnv6b7MSvWI8w3ggeXlIofLdwEU6L2pc78Ny3d9ZTbgb+geiJfu6TbgE
	5fEwtdQSpQ1aYHvQ1ZQyEq4JToi09lAUrITFzAZ4P2cde/V4+o8O/zOb++dtzkObC+BL
	ExdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=yiDBCUsgMynJ+a8pXTAm8sTPNsbuEUMuU5puVZCd6NI=;
	b=a85w28E3VYC3CS4UNHd9084en1rj91rfwrfoJORPYbC0C9zuVAmFV9kWAh3BFFPKni
	oHCIY/ZPEuqnLx1C98IUE2YXJk64iowRQYBI/Il7moePcqqc/1Cid5ScqaIe2FrezxKC
	FiuNY8UN3LFS0sjO/NxARZvHlPeOoDrEWH5JjGXCc70//SLxsxShb4R0nAE5ky9490VW
	o7SneTpoBhEgedS6UViE1Ew9ZdojaqrTN39pVv5I63+RiS8RJGIXugWd2/6FKMTy2S82
	Oi0XlnCtx4zz6T+1ioL4eDSSF6U/vKkFg29oFiyDdPcULK7BFwft9hcTnlqs/Yf+nsG3
	zhUA==
X-Gm-Message-State: AGRZ1gJBI1NG+ytyz0OZ7YEJUYf39ta6PSCopXssKXmkN7BfEVL1qR1O
	LqSf6yU+FXTpnEQ7/mnV46WU6a5J
X-Google-Smtp-Source: AJdET5fyTNUNkbRZmF2u6h9JG39GeQCf0W6EpuxRWozJtTol61m/TiGx/dULamhvm+QXU5AtxjTSDg==
X-Received: by 2002:a17:902:404:: with SMTP id
	4-v6mr11540074ple.331.1540751097817; 
	Sun, 28 Oct 2018 11:24:57 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:dd9d:5398:e0dd:9d0f?
	([2601:202:4180:c33:dd9d:5398:e0dd:9d0f])
	by smtp.gmail.com with ESMTPSA id
	m67-v6sm21589040pfm.13.2018.10.28.11.24.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Oct 2018 11:24:57 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1540452055-22743-1-git-send-email-akuster808@gmail.com>
	<b2dd231dcb644b0c97082d64abc7dfd703ef6d95.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
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
	oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
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
Message-ID: <a6650d3c-d356-22c7-5efe-8ebcf980e9fb@gmail.com>
Date: Sun, 28 Oct 2018 18:24:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <b2dd231dcb644b0c97082d64abc7dfd703ef6d95.camel@linuxfoundation.org>
Subject: Re: [PATCH] os-release: add more variables to list
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
X-List-Received-Date: Sun, 28 Oct 2018 18:24:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 10/25/18 10:25 AM, Richard Purdie wrote:
> On Thu, 2018-10-25 at 08:20 +0100, Armin Kuster wrote:
>> If someone extends the OS_RELEASE_FIELDS in a bbappend, it will cause
>> the hash to change which is
>> caught by the yocto-check-layer
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/recipes-core/os-release/os-release.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/os-release/os-release.bb
>> b/meta/recipes-core/os-release/os-release.bb
>> index 7f3d9cb..88bf8f8 100644
>> --- a/meta/recipes-core/os-release/os-release.bb
>> +++ b/meta/recipes-core/os-release/os-release.bb
>> @@ -12,7 +12,7 @@ do_configure[noexec] =3D "1"
>> =20
>>  # Other valid fields: BUILD_ID ID_LIKE ANSI_COLOR CPE_NAME
>>  #                     HOME_URL SUPPORT_URL BUG_REPORT_URL
>> -OS_RELEASE_FIELDS =3D "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME=
"
>> +OS_RELEASE_FIELDS =3D "ID ID_LIKE NAME VERSION VERSION_ID PRETTY_NAME=
 BUILD_ID HOME_URL BUG_REPORT_URL SUPPORT_URL CPE_NAME"
> I'm not sure I agree with this. It would usually be a policy decision,
> e.g. a ditro config which would change this and you'd not be doing this=

> with a bbappend?

Yeah,=C2=A0 its the feedback I was looking for. Isn't OE=C2=A0 core "NoDi=
stro" and
I will be wanting to have the CPE_NAME available with out having to
define DISTRO. I am jet lagged so I am not seeing how to fix this for
meta-secruity.

- Armin



>
> Cheers,
>
> Richard
>


