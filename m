Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id C0977611E1
	for <openembedded-core@openembedded.org>;
	Sat, 29 Feb 2020 15:38:52 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y8so2435120pll.13
	for <openembedded-core@openembedded.org>;
	Sat, 29 Feb 2020 07:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=7Gx+7+pKIBoTzEPMv+gu50bLGOLF+W/i3Xt+yBWk3lA=;
	b=A2ZPewnLv/gRT05+IZKMTCrJWdCkcIu5g8FeEZDmDs7YfttZ6JFmsAU2AtC9+vv6XV
	C3LWcaJDJaIkmTpRdFPxiAxZPBs9xiiS6b41MD7lQ6wdwEU9Ac9wYBQ0uiEOLn1I3CiV
	s17mZ3Ofjb4BGD3A5Y2jeS6it+WysPyoM7cgq1MZFfMk9afQSpCAZkyOgZTmQXubR0cu
	VXuU48Y3BvkJ8Zn2uwmO3J6peYY6FCZPDWM5tTA2v1hug2Wul/vFsqJjjk+5id5ireCn
	DZp0ACCIIEyoE+rFJXwGuRR4tRcygdqCOZ/1+Yu8KXLPAcQeYGV7OpSokqVzFQA/PFua
	ayDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=7Gx+7+pKIBoTzEPMv+gu50bLGOLF+W/i3Xt+yBWk3lA=;
	b=CL3tpv4R5FYDk2PxcesZisiTfk0KXKURuFZY0hNbVZH5gBjz+joJv+PJ0eQllwuJ+j
	ov6Bwz9ar+jdmK6kjNkro9AmovwRt7Dz1rE9zv9m6qVhZxuK05bZz6b49eKPuUZjygJ4
	IaWVvDICGHY/bGTY8nqrxLm744nrKAd4+vU7UgoGG02dUTnpQk7rMxyAFtELuDtLLN+1
	PkxkiiXd4smJ1PEWR05SUXW9oThOn3vyL+HwUVs2vLUi06wvaJ3nd+MiWF8fBLK0kwkJ
	G4emvkViEHLKsuPL1QDlJMjbWAWUXL3TKtCmM2GLEL5uWD72o7Ta7pTiSlmidOQs9uc1
	MbOQ==
X-Gm-Message-State: APjAAAU4RQsuy1Ls9Vy0I4b+JPqIQ3EGLld4zTomgPZPaeH2hRhHA6Ga
	QLSxFv2gryzFlOnGjph9EvgIHnHI
X-Google-Smtp-Source: APXvYqziN8h4ni5wSTdSkuZwGQx7lrW5E7mx4nO0FnkQNjPl6Z36WHqsxTidp+5GcxZfkqqRWzrzSg==
X-Received: by 2002:a17:90a:678e:: with SMTP id
	o14mr8861767pjj.24.1582990733273; 
	Sat, 29 Feb 2020 07:38:53 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:89f7:b095:1320:2ce3?
	([2601:202:4180:a5c0:89f7:b095:1320:2ce3])
	by smtp.gmail.com with ESMTPSA id
	t2sm1266196pfb.140.2020.02.29.07.38.52
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 29 Feb 2020 07:38:52 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@openembedded.org>
References: <e7b54a7b237a70346379df8483837a6b97ccc73f.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
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
Message-ID: <c88b00fa-a513-c0a0-eb30-62cef90f66bb@gmail.com>
Date: Sat, 29 Feb 2020 07:38:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e7b54a7b237a70346379df8483837a6b97ccc73f.camel@linuxfoundation.org>
Subject: Re: M3 build status
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
X-List-Received-Date: Sat, 29 Feb 2020 15:38:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/29/20 5:13 AM, Richard Purdie wrote:
> Just to quickly update everyone, a number of patches we probably wanted
> in 3.1 have had issues but have had the issues resolved and the patches
> have now merged. Thanks to all who dived in and helped with those!
So no Bind update?

>
> The patches/issues I'm aware of that are left:
>
> * ltp upgrade (musl issue)
> * util-linux upgrade (breaks wic test, probably simple fix)
I can look at the two above but can't start until Sunday so if someone
else grabs them today, have at it.
> * coreutils ptest addition (blocked on libmodule-build-per 
>   reproducibility issue)
> * psplash systemd race (smurray may have a fix)
> * autobuilder new branch handling for initial run test comparisons
>   (open high bug with RP)
> * tinfoil race (open high bug, struggling for owner)
> * LockedSigs intermittent test failure (RP has open high bug, no clue 
>   how to reproduce or why, total mystery)
> * Intermittent selftest failure with SystemExit (High open bug, Kai 
>   owns)
>
> As ever, help with any of these welcome. We'll build M3 when a majority
> of the above are ready.

So where are patches going doing this time that will be in after the
release?

- armin
> Cheers,
>
> Richard
>
>
>
>
>


