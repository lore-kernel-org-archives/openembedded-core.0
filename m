Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7C13060069
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 23:32:12 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id w8so581866plq.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 16:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=GgdWbiV2qu5VnO38QIFguys2vfjE+ozXIATN3hCF3hQ=;
	b=sFwGsxE+tpiEloSXICYuzqBfXX3TOTlNvLkNYHB7GiD05S5qQq1ub/bIOuT8OUvQu2
	Xp0WnyONkzZnu6067fW3DLfFkjsadWQobGYrMed7TQ274BDd74q0M266bTMvjmW7fPX/
	Ol9CQ+jeGcSRyhimI5h+4k/rhMIgNCSm6b4Rh0EBikB+qkOi7IAmuQB1QQTVNKgA2rtg
	sGBFH/UQtHDzxI7T87IbU8iEDWWt7lRuY75MuHCZqsJTMcwPU8OfGi4lgKCJyPkJYMNQ
	5cZrExw4o0ks6LeloWh5t7xh+SqMqYwfSJaJ4SH1dS3Vdln80gyc5XvZVhK1HjwDxtMJ
	DNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=GgdWbiV2qu5VnO38QIFguys2vfjE+ozXIATN3hCF3hQ=;
	b=AQBVfQynsCvSjVBcdD4IFdTfojsrhM4oKlLYp1Fmkk2bptbTRgqnrMmfnRIe2ZgUH0
	6MN8wh55DfaA6r7mEYIDAswoEAcXDpz4fHjjfqC8BHoh+BC49DbxPh0a1qXTlKAByjXB
	WzeN3gKme0hzKnUkTKjm1v+tFBIq2pps1EjFDhQ8F8XyV0XNZtWYDBj5dkkUa4CIoPkI
	FW3Oi1/Fj4BEJzrs+F2pEmwWujKnA626WPoCT9bzHDUqj6TxqjF0BXVOjJ1gg5czBpe2
	AMYR2In15DlVWgy/bT3vq+iPktNfK8K4wiSOTcuhvGNcv8cWiR0vbkBTjZIpSMFQfTwV
	l6RA==
X-Gm-Message-State: APjAAAWA3sLCFueByhHP86ziHeY4zyID1fj+YI0NXTLaXdvbq2xvHFCp
	+6O0phgJGP5LRD5THI6caVQ=
X-Google-Smtp-Source: APXvYqxlBO1XE8mjMhO5OrdWAYWzqTJMG74i2Qgu7rWVWbItpbRXPZq5vl/vNHRxKvTvZ3JZ0pMNsw==
X-Received: by 2002:a17:902:8e86:: with SMTP id
	bg6mr6620198plb.212.1570059133529; 
	Wed, 02 Oct 2019 16:32:13 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:2c5e:3326:62f0:95f9?
	([2601:202:4180:a5c0:2c5e:3326:62f0:95f9])
	by smtp.gmail.com with ESMTPSA id c6sm440659pgk.65.2019.10.02.16.32.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Oct 2019 16:32:12 -0700 (PDT)
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <4192571.iDR9UPTnyj@localhost.localdomain>
	<93d8fa4a-c6ee-a529-5dec-f2b9857c0228@gmail.com>
	<4021250.qhsO4ulJn3@localhost.localdomain>
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
Message-ID: <c00c3fe6-824f-5d97-a228-54a30f8bc5c3@gmail.com>
Date: Wed, 2 Oct 2019 16:32:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4021250.qhsO4ulJn3@localhost.localdomain>
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: 3.0 release notes / migration guide
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
X-List-Received-Date: Wed, 02 Oct 2019 23:32:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 10/2/19 3:57 PM, Paul Eggleton wrote:
> On Thursday, 3 October 2019 11:44:53 AM NZDT akuster808 wrote:
>> On 10/2/19 3:20 PM, Paul Eggleton wrote:
>>> So it's that time again - we need to start building up the raw material for 
>>> the release notes and migration guide for the upcoming 3.0 release, and I'd 
>>> like to request some help with some parts of it - read on for details.
>>>
>>> For the migration guide we have a wiki page serving as a staging area:
>>>
>>>   https://wiki.yoctoproject.org/wiki/FutureMigrationGuide
>> Thanks for putting this together.
> No problem!
>
>>> Things that should go in the migration guide: *anything* in the release that 
>>> would require someone who is upgrading to take some form of action (i.e. 
>>> change their configuration / recipes / etc.) Help with this from people who 
>>> implemented the changes or have already thought about / dealt with their 
>>> impact would be much appreciated.
>>>
>>> There is a process where I look through all the commits since the last release 
>>> and pull out the ones that need to be mentioned in some form - other than the 
>>> migration guide items, the following needs to be gathered for the release 
>>> notes:
>>>
>>> 1) Features - new functionality. We need to capture what the feature is and 
>>> hopefully express the impact to the user succinctly.
>> We remove LSB support.
> Thanks - I've just added that to the migration guide and will note it in the release notes.
>
>>> 2) Recipe upgrades - straightforward
>>>
>>> 3) CVE fixes - fairly straightforward, I just look for commits that explicitly 
>>> mention "CVE". If I can easily do so I'll also note where a recipe upgrade 
>>> fixes a CVE, but that isn't often readily available information.
>> So how can the community help in this case? Better commit messages?
> That would be great - but it does require the person doing the upgrade to look
> upstream, and of course every upstream is different. Unfortunately with some
> upstreams finding fixed CVE information is quite difficult indeed.
>
>> Well, aren't open defects not fixed by the time we release time but we
>> intend on fixing after release a form of known issues ?
> Yes, that's true - I will say we haven't been particularly systematic about the
> known issues in past releases so perhaps we should drive the list from
> bugzilla. I would want the list to be kept as short as possible though and each
> item should succinctly describe the issue. 

Maybe something the Yocto Bug triage team could possible assist in.   I
will bring it up tomorrow morning.

- armin

> Cheers
> Paul
>


