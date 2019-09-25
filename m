Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id A14DD79B57
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 00:41:15 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id s1so2186715pgv.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 17:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=+Fa3HCQYhTTtLrQpz0aclUYXFWvYhjPwoJWWGV///fA=;
	b=S++vHeMtsH+hdm0Pg4GU2TPPo0JzQz9mywZSBevHDRA4CXYVUMN9CnBNP8kgHX847t
	UotYp+3nrZ1GusY6D9QzYjMbbZcAbq8JXSjRP9h1kFkH6rLvp8tOZrF6SRZFRpATKTth
	bY82rCaqVqgh5Xqp7teachEdEANT5hMqW21+dOBcgbMhAyZsILjHnWvQOKn1bTSzy9NZ
	+/NKYRhlZBZtfKG8FKYznwf7u8sKvLuypH84RNLP3qrj8WM9aPYn/sWaPofobMGW9CF3
	uC1T3hfXp9ZCxNUZDGyLHpH0bUtUR9UxdXO7Ru2y+amW19d2QHUhjJ+DEZuo9s/fMqmb
	MvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=+Fa3HCQYhTTtLrQpz0aclUYXFWvYhjPwoJWWGV///fA=;
	b=mLtzJQGaQX9QTfPKKv0Yg5SzBE0axFnaQNs7lFRnTICH8ISrcRIdBjWoNinXuZpZcB
	U3iIgqXpmq1PR/cA/mOKMEbhfyb/aycBxuGpUsW7bCZFCXYCVf43rbyITFnAYtG9y3Cx
	S4LgDykyHcC/Q0VJBt85OoVJDXxZsS4SvHXqIH5c7NGM/gZfqq56zAQIErkr22SpBKI9
	+RsyOrmcjSipCAn8PX9IeRvGc6gymcbYn9YEQu2mAY+4aWgLbPP/GnLh25OG6B4S/Wd9
	+b+JZ2xaTEnQr34SH3iw7s7OYC0ld7diF7M7IPvNhEMUOvY2nXMXuuyi5RyOUyZf6hK8
	B2rA==
X-Gm-Message-State: APjAAAXPaJxmRYf/i2uaNXQtHNCf3ikEXCs/95rOzZmBTX8Ji/XVicY3
	L1Gok5oOYJf72GlLVhW0k67aK3SCwJo=
X-Google-Smtp-Source: APXvYqyJZkjX8igh06Mx3yihfJbax3gnSVqMeD4/WqJsm3CqfSlksmLDupfZbley5pAqmlEE1ftq6w==
X-Received: by 2002:a63:6c81:: with SMTP id h123mr6011647pgc.132.1569372076496;
	Tue, 24 Sep 2019 17:41:16 -0700 (PDT)
Received: from [10.20.245.11] ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	l62sm5763524pfl.167.2019.09.24.17.41.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Sep 2019 17:41:15 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
	<e09f916e2b5ff8c7cef7cfd13b43a7f9d2463346.1569292053.git.akuster808@gmail.com>
	<CAJ86T=VijcAyk6cLv4hx2P74Ar2bbqVOHBgJpD65_aStBc9GfQ@mail.gmail.com>
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
Message-ID: <a417eb5c-9c8b-53de-dffe-668c0ed399a6@gmail.com>
Date: Tue, 24 Sep 2019 17:41:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VijcAyk6cLv4hx2P74Ar2bbqVOHBgJpD65_aStBc9GfQ@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [warrior][ 25/50] boost: Fix build and enable context and coroutines on aarch64
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
X-List-Received-Date: Wed, 25 Sep 2019 00:41:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/23/19 8:37 PM, Andre McCurdy wrote:
> On Mon, Sep 23, 2019 at 7:52 PM Armin Kuster <akuster808@gmail.com> wrote:
>> From: "Bedel, Alban" <alban.bedel@aerq.com>
>>
>> Like for ARM bjam need some hints about the ABI to properly build on
>> aarch64. While at it also enable context and coroutine as these are
>> supported on aarch64.
> What's the symptom when this is mis-detected ?
>
> I'm guessing big endian 32bit ARM (ie the _armeb over-ride) probably
> needs the same fix too... but it's not clear how to test or confirm
> that.

You need to ask the author of the patch. This is in master and a
backport request was sent
https://patchwork.openembedded.org/patch/163995/

with no community feedback. This seemed like a fix to an issue.

- armin
>> Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/recipes-support/boost/boost.inc | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
>> index 9be3717..c2e2cbb 100644
>> --- a/meta/recipes-support/boost/boost.inc
>> +++ b/meta/recipes-support/boost/boost.inc
>> @@ -33,6 +33,7 @@ BOOST_LIBS_append_x86 = " context coroutine"
>>  BOOST_LIBS_append_x86-64 = " context coroutine"
>>  BOOST_LIBS_append_powerpc = " context coroutine"
>>  BOOST_LIBS_append_arm = " context coroutine"
>> +BOOST_LIBS_append_aarch64 = " context coroutine"
>>  # need consistent settings for native builds (x86 override not applied for native)
>>  BOOST_LIBS_remove_class-native = " context coroutine"
>>  # does not compile
>> @@ -151,6 +152,7 @@ BJAM_OPTS_append_x86-x32 = " abi=x32 address-model=64"
>>
>>  # cross compiling for arm fails to detect abi, so provide some help
>>  BJAM_OPTS_append_arm = " abi=aapcs architecture=arm"
>> +BJAM_OPTS_append_aarch64 = " abi=aapcs address-model=64 architecture=arm"
>>
>>  do_configure() {
>>         cp -f ${S}/boost/config/platform/linux.hpp ${S}/boost/config/platform/linux-gnueabi.hpp
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


