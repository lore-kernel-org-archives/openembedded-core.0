Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 87BFA78BF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 14:04:26 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id q11-v6so14119322oic.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 07:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=sibOql1g0g+zahMmuij33k66Hc4Es0bNPMk5QNG/Cvw=;
	b=XIJtxE8qixOhvssmxwvbfEiIo6CuZetaip9U32w6W7FKo2fTC8v4F16DH2vHG1G9mp
	ouPNR6mg73xVWo0JoO8H9qzKPUGfJ16nph85SCPCJ3y6CoFT95qxD9LK3jhnE4FAujM4
	MfR2AtOnQp1FthWaNFVv2SvE0xipu2cUYm0VIKOnBof1WWobRNQ5j1lygOG14WQBrY2V
	Wj+ZPF3rX9LIH58rHWB2XtZwi2j5hs8mky0hiq6gZxbwyVLzKkLNrmSjPd1p8wwQAbJg
	JJQ1AAMFVWt8DT5yMhOVm+XoLYIMvSfDf+TNshFBLsf5csmo4EyN5FZRQDmK9ZjDLWrw
	rHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=sibOql1g0g+zahMmuij33k66Hc4Es0bNPMk5QNG/Cvw=;
	b=P0LAXIxB4ieuFwVaMAfqjwtTMxfmNUc0UoRfR8kJVjHuEvPiU/7raY2X6gJS7dH4+X
	JQqOoRPYLDKN26/TJa3aFehMje/ponhHWLZWhf+f8XXDpuVZ9YS+pOoc/vISoHwTe6G+
	d50ziHhJb50XxFDAJ5rOY63K8QaIl9hRiOBnmaP/733p1c7XiW4bgYcAF4uH+KHVdD9+
	ZO1/HoG6ruTEL+JPo7T+Ace6r0iq1HH1zFkh4x2u1IU4GpUfv4OSNZWB709Q3Ut//kc8
	AwORd5vMK1Dji+4SOBclmnSmrLdliIXPWgIFR0Ym9onvUOU6CZpkqo0H5x3UioM64SHl
	k4Mw==
X-Gm-Message-State: AOUpUlG0O/WDNDbC35lR19zFU9cH4fm22fmB02npdEXSW+4kA5pCyiHy
	/bFKzQU9Wq29stWo7KyYeiUZzuQS
X-Google-Smtp-Source: ANB0VdZJHAPFMCDPbpQuo6zIllnMNgx+dXVe+4nYmQQYr7JrZGQIEabXc0xUtmmzrSDM0DO78MOSyA==
X-Received: by 2002:aca:4ac6:: with SMTP id
	x189-v6mr2738619oia.211.1534514667116; 
	Fri, 17 Aug 2018 07:04:27 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:a418:6f72:e730:e6e?
	([2601:202:4180:c33:a418:6f72:e730:e6e])
	by smtp.gmail.com with ESMTPSA id
	i204-v6sm6139893oia.41.2018.08.17.07.04.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 07:04:26 -0700 (PDT)
To: Anuj Mittal <anuj.mittal@intel.com>, Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <20180817051712.6609-1-akuster808@gmail.com>
	<c9bfa0c1-0a53-0228-8e6b-ba3ed5f696d8@intel.com>
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
Message-ID: <e1a1398e-2c20-0421-906b-32def8d1f37e@gmail.com>
Date: Fri, 17 Aug 2018 07:04:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c9bfa0c1-0a53-0228-8e6b-ba3ed5f696d8@intel.com>
Subject: Re: [PATCH] gnutls: Update to 3.6.3
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
X-List-Received-Date: Fri, 17 Aug 2018 14:04:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/17/2018 01:20 AM, Anuj Mittal wrote:
> On 08/17/2018 01:17 PM, Armin Kuster wrote:
>> release notes: https://lists.gnupg.org/pipermail/gnutls-devel/2018-July/008584.html
>>
>> add ssl3 and tls1.3 config options now supported.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/recipes-support/gnutls/gnutls.inc                       | 2 ++
>>  .../gnutls/{gnutls_3.6.2.bb => gnutls_3.6.3.bb}              | 5 +++--
>>  2 files changed, 5 insertions(+), 2 deletions(-)
>>  rename meta/recipes-support/gnutls/{gnutls_3.6.2.bb => gnutls_3.6.3.bb} (53%)
>>
>> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
>> index 04c0fd2af8..cf947d445e 100644
>> --- a/meta/recipes-support/gnutls/gnutls.inc
>> +++ b/meta/recipes-support/gnutls/gnutls.inc
>> @@ -30,6 +30,8 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
>>  PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
>>  PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
>>  PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
>> +PACKAGECONFIG[ssl3] = "--with-ssl3-support,--disable-ssl3-support,"
> This should be --enable-ssl3-support ...
>
>> +PACKAGECONFIG[tls13] = "--with-tls13-support,--disable-tls13-support,"
> and, --enable-tls13-support.
yep.

V2 shortly

thanks,
armin





