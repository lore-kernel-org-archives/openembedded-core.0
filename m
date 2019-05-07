Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 07FC17D723
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 13:50:46 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t22so8336345pgi.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=hgVgbJJLACynUQa57bALbK6FqEp8xBEJ1sBjINv37ck=;
	b=IO7VVP0Ev0xZ9bwK228MYoVOjjr2TC2WLmTA4bQooaqRTOqPB6DRogg7EcAyZuFhr2
	rOxy/PNYgZ/hTGv4p1o9wNZVR8C5O4AD2lxzi0ytaDTC8oaIisIc/1JDIM195ltWZs4V
	UP1x8BvJa4ZKjK3tRqXLC89Ye037uUe1fY45HRzatNkaX7tIQWp6ceEagVrlE5vT0yvr
	x/kD5XJQ7dfZvBZ6Pu/87zLYNU75f8b1Yt5XE471Ta5thznDumPLMQCuzUC7OIT8+zFE
	CGXqZqBkrVRWmGU0nJNM34LQb9yMlNkuPPNB4eGXRutS6nLs5SmBMT8+X36+bflibSez
	XZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=hgVgbJJLACynUQa57bALbK6FqEp8xBEJ1sBjINv37ck=;
	b=hdkfdYP90Hrk/mNqJIHsoCCDWB5bdWxLw35IeZrq+1MS4C+jTTs248CIKgZSkMIPd8
	6BdYgncjuhA+5O28Wpao8ov9NvMbFXkAOoy2bChXDlPBwB710+ANYzXNHhOrOxrpEsac
	xcQ3u0rPvkrdONWI2DlIYYxt/gZZcrVoAbVutNiiNp/dXU0pzrs4bt/wwx0UcEyYOCHt
	S56N8s4EhGrZfmEoVGC45/15laqWcNpQTy6gD7lB4j05eapgZQ2EGt37JALnVtDDVow+
	LCVNhB2vdZwb+g/ua2n9gyHytyj6NLhVFDq7aSTQ0fIAjPTl5wZsmyRvZzzZZ27gApMX
	oZAg==
X-Gm-Message-State: APjAAAUZQ2M7Y8S+38egyUvq5xw2XA7t4C1iENVRwvZ0u6DzzlZPW2B8
	HJLtTl4UR5a3oq95beq9Wob9WZyI
X-Google-Smtp-Source: APXvYqy1SPcCA45ABaaNqirHsNSaBHvFHkO4Cg01kMncCvXiODwhwW2AqikETjWj1CwVveY7niMKAQ==
X-Received: by 2002:a62:2506:: with SMTP id l6mr24714672pfl.250.1557237047942; 
	Tue, 07 May 2019 06:50:47 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8476:cc3a:1f1b:599b?
	([2601:202:4180:c33:8476:cc3a:1f1b:599b])
	by smtp.gmail.com with ESMTPSA id
	k14sm37350602pfj.171.2019.05.07.06.50.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 06:50:47 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190506021955.26534-1-akuster808@gmail.com>
	<20190506021955.26534-2-akuster808@gmail.com>
	<f5b3478bfb63651712821e2acd6bfbe664c6e1ad.camel@linuxfoundation.org>
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
Message-ID: <ca38c34c-c626-be83-f155-45f1f9a607dd@gmail.com>
Date: Tue, 7 May 2019 06:50:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f5b3478bfb63651712821e2acd6bfbe664c6e1ad.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/2] nss: add ptest support
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
X-List-Received-Date: Tue, 07 May 2019 13:50:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/7/19 2:40 AM, Richard Purdie wrote:
> On Sun, 2019-05-05 at 19:19 -0700, Armin Kuster wrote:
>> This belongs in the long test group
>>
>> Here is a baseline:
>>
>> Tests summary:
>> --------------
>> Passed:             9132
>> Failed:             61
>> Failed with core:   0
>> ASan failures:      0
>> Unknown status:     0
>>
>> DURATION: 15134
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>
> ERROR: Nothing RPROVIDES 'tcsh' (but /home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/nss/nss_3.43.bb RDEPENDS on or otherwise requires it)
> ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> ERROR: Nothing RPROVIDES 'tcsh' (but /home/pokybuild/yocto-worker/a-quick/build/meta/recipes-support/nss/nss_3.43.bb RDEPENDS on or otherwise requires it)
> ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
shoot. Had mete-oe included. Will see if I can remove the offending test
or whether is can be converted.
> That is also quite a long runtime (4 hours) which is longer than
> everything else we have combined :/

yep.

- armin
>
> Cheers,
>
> Richard
>


