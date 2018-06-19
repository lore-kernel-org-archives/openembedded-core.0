Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 725F2745AB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 04:17:53 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id g20-v6so10215450plq.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 21:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=6RRi1E5LDSWiv8xwid8LWoCSZ9A1tXAiQJLHOK7NhRg=;
	b=pN5x0jfpEctaMnl3CNmGkdn20EP6G5uXhkOrhP9KEVcUpMtntnBL1G3SAoKg+/kbGx
	/H2oBitgwmqm4CcHWisvheMETRNoHFRaQmqy7wq0c3d/PUA5G+AhLnAZ0du+oEwC5Sbv
	xK5p/YmF9f6QDYW8W5nGIVaZzi5n98nWYgQr5q3lBP1UW8ilsWYVqdyPhMZOD3q/51F2
	jsMJfjoCpKmf0f4nWZL/Y19jmMoNY5O7I3XKHBlei/SJ/ofztXGrgcV6+8pfdsfHpxKO
	7ZHCbxaOE4uy0uNg2UeiZ3VASevN/vErMFkcTktubOGC9VjwNvG7dKsD1Ez7+/Qmmhyc
	CH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=6RRi1E5LDSWiv8xwid8LWoCSZ9A1tXAiQJLHOK7NhRg=;
	b=mNdzkQlXci+kikshsN0Seqk0B6H4jGj6ND+nw/ItNZaI5TmJkzV8fkcToq5HS88dKj
	lFD0CmNGTZ49Hr0rrhMO9H/eu0NJj2j7ZpQf4xE8tEJ4kMF7GRjW7Vvojw6we4bdOOrZ
	oT46Abc5m1dfI9/R3INi0yj5XVqtrH6Q2w+/3ZN+NSCionMShP+jrWNdezCpBf0NsYvG
	N86nd/FJwYkA2vI9nLBxUVLqWthk/o41PNFgS6l3Dd+mYZADX5PBx/lLMToYHE8jb+Wh
	UTi1ASD+p3QiImwi4ibk6WOpEivZQzBjX3WSysYOmu8h45yw0rA5SITLpU2nqxESnPz6
	iANg==
X-Gm-Message-State: APt69E2o9A2AQpA4DIdsIy/PNC2VQbizs81NDFicHmdQuLcbkA6FjoPD
	/FUW/Sr0f5/0VmDekEwZYkemkg==
X-Google-Smtp-Source: ADUXVKIaMmd18SaBfGTbNOOLn9ourKyRoKfJSCA4RDDZgEKfbSAKmFJ9jOj7bWWHOgaBpVDaD23/XQ==
X-Received: by 2002:a17:902:bb07:: with SMTP id
	l7-v6mr11848264pls.73.1529381874305; 
	Mon, 18 Jun 2018 21:17:54 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:59dc:e6d2:872c:4e7f?
	([2601:202:4000:1184:59dc:e6d2:872c:4e7f])
	by smtp.gmail.com with ESMTPSA id
	z4-v6sm27480403pfm.28.2018.06.18.21.17.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jun 2018 21:17:53 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <1529093808-10025-1-git-send-email-armccurdy@gmail.com>
	<22e45738-aa92-24c7-a3fc-03a0918a1c3a@windriver.com>
	<CAMKF1srvZ830wY4_PEV06L4Tea6OkHkSi+fcZMuG0sungLCdyQ@mail.gmail.com>
	<CAJ86T=VjYfk1T0MmN-6oyVSZmjYXZ3VNnaGAdLt49d12ZDEWwA@mail.gmail.com>
	<CAMKF1srWE9vVhv7MjcVh32mK+_FPt4OgYU7j9nWhW5fdd_hQ8Q@mail.gmail.com>
	<547a3ea5-f66a-54fb-163e-0fe31998d59a@windriver.com>
	<CAJ86T=VbRuByAyGFaf+tRFtyrKMo5K9uZKSsm5mPc9yvMdS+2g@mail.gmail.com>
	<CAMKF1soHE7ADdihFtuf3j0-8kTHeVH4nUOzwdg44dN79E1YJpQ@mail.gmail.com>
	<CAJ86T=WDp3BJEXC9WxtQhi6YZr7xpHwG_=XS3jXFb8YdZTuqxQ@mail.gmail.com>
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
Message-ID: <08301c88-6d98-2433-b352-804db250e4de@gmail.com>
Date: Mon, 18 Jun 2018 21:17:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WDp3BJEXC9WxtQhi6YZr7xpHwG_=XS3jXFb8YdZTuqxQ@mail.gmail.com>
Cc: =?UTF-8?Q?Andr=c3=a9_Draszik?= <andre.draszik@jci.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] common-licenses: Add BSD-1-Clause
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
X-List-Received-Date: Tue, 19 Jun 2018 04:17:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 06/18/2018 11:00 AM, Andre McCurdy wrote:
> On Mon, Jun 18, 2018 at 10:54 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Jun 18, 2018 at 10:52 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Mon, Jun 18, 2018 at 9:20 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>>> On 6/15/18 7:23 PM, Khem Raj wrote:
>>>>> On Fri, Jun 15, 2018 at 3:48 PM Andre McCurdy <armccurdy@gmail.com
>>>>> <mailto:armccurdy@gmail.com>> wrote:
>>>>>     On Fri, Jun 15, 2018 at 3:36 PM, Khem Raj <raj.khem@gmail.com
>>>>>     <mailto:raj.khem@gmail.com>> wrote:
>>>>>     > On Fri, Jun 15, 2018 at 3:14 PM Mark Hatle <mark.hatle@windriver.com
>>>>>     <mailto:mark.hatle@windriver.com>> wrote:
>>>>>     >>
>>>>>     >> On 6/15/18 3:16 PM, Andre McCurdy wrote:
>>>>>     >> > From: André Draszik <andre.draszik@jci.com <mailto:andre.draszik@jci.com>>
>>>>>     >> >
>>>>>     >> > Some projects are starting to use it.
>>>>>     >> >   https://spdx.org/licenses//BSD-1-Clause.html
>>>>>     >> >
>>>>>     >> > Signed-off-by: André Draszik <andre.draszik@jci.com
>>>>>     <mailto:andre.draszik@jci.com>>
>>>>>     >> > Signed-off-by: Ross Burton <ross.burton@intel.com
>>>>>     <mailto:ross.burton@intel.com>>
>>>>>     >> > (cherry picked from commit 77f692ecb39d880b2cb420850a31534860eb2cc5)
>>>>>     >> > Signed-off-by: Andre McCurdy <armccurdy@gmail.com
>>>>>     <mailto:armccurdy@gmail.com>>
>>>>>     >> > ---
>>>>>     >> >  meta/files/common-licenses/BSD-1-Clause | 9 +++++++++
>>>>>     >> >  1 file changed, 9 insertions(+)
>>>>>     >> >  create mode 100644 meta/files/common-licenses/BSD-1-Clause
>>>>>     >> >
>>>>>     >> > diff --git a/meta/files/common-licenses/BSD-1-Clause
>>>>>     b/meta/files/common-licenses/BSD-1-Clause
>>>>>     >> > new file mode 100644
>>>>>     >> > index 0000000..ded8897
>>>>>     >> > --- /dev/null
>>>>>     >> > +++ b/meta/files/common-licenses/BSD-1-Clause
>>>>>     >> > @@ -0,0 +1,9 @@
>>>>>     >> > +
>>>>>     >> > +Copyright (c) <YEAR>, <OWNER>
>>>>>     >> > +All rights reserved.
>>>>>     >> > +
>>>>>     >> > +Redistribution and use in source and binary forms, with or without
>>>>>     modification, are permitted provided that the following conditions are met:
>>>>>     >> > +
>>>>>     >> > +Redistributions of source code must retain the above copyright notice,
>>>>>     this list of conditions and the following disclaimer.
>>>>>     >> > +THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc. "AS IS"
>>>>>     AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
>>>>>     >>
>>>>>     >> Hate to nitpick, but isn't BSDi defunct?  I don't think it makes sense to
>>>>>     list
>>>>>     >> BSDI, since as far as I know they never had a '1-Clause' license.
>>>>>     >>
>>>>>     >> Maybe a <Organization Here> would be more appropriate.
>>>>>     >>
>>>>>     >
>>>>>     > I think we should sync the files we carry with SPDX e.g.
>>>>>     > https://github.com/spdx/license-list-data/tree/master/text
>>>>>
>>>>>     It doesn't look like that will fix the inconsistencies... those
>>>>>     versions are inconsistent too:
>>>>>
>>>>> We should report that to spdx folks since they
>>>>> Work on licenses and might be interested in addressing this
>>>> Agreed.  I think we need to get the SPDX to fix their examples, and then use
>>>> them once they are fixed.
>>>>
>>>> As for our version of the code, I'd suggest the "<COPYRIGHT HOLDER>" (as in the
>>>> BSD-4-clause example) in all cases.
>>> Agreed. So while Mark and Khem fix up master, is it OK for Armin to
>>> backport the current version to rocko? Or should master and sumo be
>>> updated first?
>> It should get into master for sure before it hits release branches.
> The current version of the BSD-1 license text has been in master since
> January. It's already been released in sumo.

got it.

in stable/rocko-nmut

- armin


