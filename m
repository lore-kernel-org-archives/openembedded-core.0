Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id A46F27F44B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 23:09:06 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a18so165576plm.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 15:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=1+exBUH/USnAwLvTluX4aNEv1H8xmTMtD2NRqGcPDHs=;
	b=reY9y75VKvzMGsCDHbWTT2Y8PH+l0Ee66rRI8lFmptJhgCrBjl/pAUruZrctYNBVWT
	DBnS/zz6Xjpe0o2sddB3clnFcy0kmlX/Qwgtk1bgeclkFEvoqk41FFd/PsIOAwGkVEP4
	cgoYySDLQ6FiP3SaqqRQyLIrvO/ChQZhuIHywdk7Za7aZbN2l6EWIRlae+x6KozCHNIG
	r24e0vrtGa2elUZmJ25PYQOztLchTJ4Si3QuAGqjC58N8lcslqnJ5nCRtNLVO0bybF7u
	uQVtxNpH9sgu3d597F6lK5kiTpE1NBpCDsDzrMxntKN9wVHNX3bR7ymXuSmUX1oO5dlO
	/5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=1+exBUH/USnAwLvTluX4aNEv1H8xmTMtD2NRqGcPDHs=;
	b=jguaxDn/NryCH4Kskg30eDYKORUZCHwCTsQ2icptGj4wALe6sPTFaE6Qcr1V5P0Syz
	hKo0hdvSiMGWzjl1VPCWIfJ1ENUA0Swd+9F66+fT14sbhKQ7YG6H7HKraAgV7dmRODNy
	4xYl/S0CoZQHn2oXXxMg799SuHW+B+YlEkpuzbGbxdUD0/DDPHWWQJaHp2QziBw8ncY0
	Ni/9Y7pKgj9bORq7st+3i7dFeCUV2/KF6/xOd8WzXOw1YEvSvVwnHPO9s1hczTyvqa7i
	8UYDW1tGJFKvCrdpPgZgRH+SlKlBAPAN7VjwCX+4hra3jMaY3YemHO/MGrFPHq8mv0G3
	jvrw==
X-Gm-Message-State: APjAAAW4Hr1A3R6NohotBT00EYm46xSyJQQeARa2TZr7NbUaYB9H/j7I
	ddaoo6BZhd8y1VXPDWpplOEXU5lg
X-Google-Smtp-Source: APXvYqxNn+H2+FGbUR45i/ipAbkjb3idir4tsqFCUdXiSnXNmx1M4gyOlscbXRBpKVyuKLxwicSUkg==
X-Received: by 2002:a17:902:8e86:: with SMTP id
	bg6mr353257plb.138.1573600147056; 
	Tue, 12 Nov 2019 15:09:07 -0800 (PST)
Received: from [10.20.245.11] ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id q1sm49041pgr.92.2019.11.12.15.09.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Nov 2019 15:09:06 -0800 (PST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Seebs <seebs@seebs.net>
References: <20191107200444.22913-1-richard.purdie@linuxfoundation.org>
	<20191107143430.39e16813@seebsdell>
	<17ac19c3d8e4b4b110312fe6005e83684b671034.camel@linuxfoundation.org>
	<0161f8e59caa4609aa6d1e6904042359@XBOX03.axis.com>
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
Message-ID: <dbb30bff-c145-3c30-7160-05a413db7ca0@gmail.com>
Date: Tue, 12 Nov 2019 15:09:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0161f8e59caa4609aa6d1e6904042359@XBOX03.axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: Add statx support to fix fedora30 issues
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
X-List-Received-Date: Tue, 12 Nov 2019 23:09:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/12/19 1:46 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-
>> bounces@lists.openembedded.org> On Behalf Of Richard Purdie
>> Sent: den 7 november 2019 21:53
>> To: Seebs <seebs@seebs.net>
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] pseudo: Add statx support to fix fedora30
>> issues
>>
>> On Thu, 2019-11-07 at 14:34 -0600, Seebs wrote:
>>> On Thu,  7 Nov 2019 20:04:44 +0000
>>> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>>
>>>> Modern distros (e.g. fedora30) are starting to use the new statx()
>>>> syscall through the newly exposed glibc wrapper function in
>>>> software
>>>> like coreutils (e.g. the ls command). Add support to intercept this
>>>> to pseudo.
>>> I think this should be okay. If there's no real statx() wrapper, the
>>> real_statx() call probably fails, but also things probably won't have
>>> thought it existed/worked.
>> That was my thinking...
>>
>>> Worth double-checking that things still run with this in place on a
>>> system that doesn't have a statx wrapper, when configuring and
>>> building things like coreutils that will check for it.
>> coreutils looks to be using a standard configure check for the statx
>> function.
>>
>> Even in OE, we'd not want to configure/compile with pseudo loaded and
>> active so I think we should be ok...
>>
>> Cheers,
>>
>> Richard
> As a Fedora 30 user, I expect this needs to be backported to Zeus, 
> Warrior, etc as well or I guess I will start seeing problems when 
> building them?

this is already staged in both test branches.

- armin
>
> //Peter
>


