Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id CB3977F990
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 15:55:46 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id d13so2915857pfq.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 07:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=2WG+/aAo3RM10c9jTcLYi6WeJSLwj0PTCtW33pN+3OA=;
	b=nloEOiz+TAxu0kQWZtMOsjGWI8CQPG06jHKuqiFIywuDPMhjd+xlFYgIq03O6V/DvZ
	5oCB81Vt/pAQAiNropOO768O0419+nKP4ju+xERYQcME74t9MMZZCzJun4/x6//xPEDi
	I3GBxNm2eW/5tutb05oaK0fbdVx/j5aXZc+Pj5UnCqPM/PCpM/0iJaE+U9Zs8fnwQArD
	LezwnD4tyxWl56QiqYPLN14BV7wM4j3yq1s2N1uo4LwsxPKj3RgdEW92M7ruA8wjiDlM
	uZD9I0gL1yiWk8+nb+oUh/qX/JgiyLQoswfQ44SkNTRS9h1noMrl+zou4jlMLwbSFeBl
	mh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=2WG+/aAo3RM10c9jTcLYi6WeJSLwj0PTCtW33pN+3OA=;
	b=uH2f7TXEzrY1xZpLmyJZVkFigkiXjYBIBii4cakUjlctpWFA7Rw3TJyLSwLcLUWoXN
	8fQsLMkiX42MIHHhmodBfZJsPt1a3haycfx3UHigrhkRSVXifA3EWftBF3R+ZatyhSbM
	8D9HYqyH+ZVnaK2zqHIa1jHBd+ZepROaxYUD8iLTRKqx+ZhkchtgVORdYS1YZJmNpOsv
	4bLAdo0kCyR0dHrIrLGUivw1TQC0O4wWCr5R1vg5pvPjEp9VjOnZEaAoGyGfDYpWZlyH
	jOxVwmPqQ425PcRUiHi+8slodHfdZeW4O6DCBc6Px5YZ0QqL3rM3bv8Ir76SW1vGb3YM
	grbg==
X-Gm-Message-State: APjAAAVvI6oOuWe/JHrt5LGjr69/aaCJiXIWmaP0MjWcYvoAfEFPqVCh
	5YIEFXN/MjH/D+e/mmxAdLWMhBN9
X-Google-Smtp-Source: APXvYqyMZsrSwvzF942hKOr+Sq1YGPPJ59hRxW7PfOdHVDQnRD1tfbKdt12Zzr1gATeevonSLcM5ig==
X-Received: by 2002:a62:1693:: with SMTP id 141mr4997699pfw.146.1573142147600; 
	Thu, 07 Nov 2019 07:55:47 -0800 (PST)
Received: from [10.52.14.175] ([162.249.178.138])
	by smtp.gmail.com with ESMTPSA id
	a29sm4691056pfr.49.2019.11.07.07.55.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2019 07:55:46 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Mikko Rapeli <mikko.rapeli@bmw.de>,
	openembedded-core@lists.openembedded.org
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
	<ec8a8c61-25a0-7e87-efee-b76e6c954d07@gmail.com>
	<717e1439a3c155fc1f506d7a2933b968ee38f9a8.camel@linuxfoundation.org>
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
Message-ID: <be45a323-4379-8a13-71c6-21f98e3a0af4@gmail.com>
Date: Thu, 7 Nov 2019 07:55:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <717e1439a3c155fc1f506d7a2933b968ee38f9a8.camel@linuxfoundation.org>
Subject: Re: [PATCH RFC CFH][sumo 00/47] CVE check backport
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
X-List-Received-Date: Thu, 07 Nov 2019 15:55:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/7/19 7:03 AM, Richard Purdie wrote:
> On Wed, 2019-11-06 at 13:46 -0800, akuster808 wrote:
>> On 11/6/19 7:37 AM, Mikko Rapeli wrote:
>> QA resources have been a donation from Intel and Windriver above
>> their membership fees.  I don't fee right asking them to run QA.
>>> patches aiming at yocto 2.5 sumo. If not, would be really nice if
>>> someone could collect patches into sumo-next or sumo-contrib branch
>>> where us
>>> users could be in charge of all Quality Assurance.
>> I have collected other patches for sumo and built them locally but I
>> have no way to inform Richard they pass an AB  builds or automated
>> testing for them to get  into mainline sumo.
> Given the discussions around LTS and the fact we'd need to do
> *something* with the autobuilder to help support it, I've been
> experimenting.
>
> I created a sumo-next branch with a uninative update and Mikko's
> patches and then managed to get it to build (and pass) on the
> autobuilder.
>
> I did directly merge a bitbake fix to the 1.38 branch to avoid test
> failures too.
>
> The autobuilder successfully builds a-full for sumo-next. Compared to a
> normal build the differences are:
>
> * unsupported workers are removed from the pool for sumo so it only 
>   builds on a subset of the infrastructure
> * no buildperf tests
> * there are no supported fedora workers left so no oe-selftest-fedora
> * no ptest image execution (we never did this with sumo)
> * no test result output (wasn't present in sumo and never backported)
>
> I'm prepared to merge sumo-next on the basis of these results and use
> it as a model for how we could continue to get critical patches into
> older releases. 
Are you taking the other patches also submitted for sumo ?

- armin
> More work would be needed to see if any older releases
> could work.
>
> At this point the TSC needs to discuss LTS and what our branch policy
> may be going forward but this does add useful data to that discussion
> and may help influence those discussions.
>
> [For reference I did have to seek advice from upstream buildbot on how
> to avoid a bug and its taken quite some experimenting to find the magic
> to make this work. I did have to update the autobuilder-helper sumo
> branch to be in sync too].
>
> Cheers,
>
> Richard
>


