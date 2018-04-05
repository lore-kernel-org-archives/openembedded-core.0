Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 56088746B4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 01:21:43 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id 91-v6so16794682pld.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 18:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=51bomPMBpfcxq4Hsdc6zC0AboSz+RO7PR3kONwL1cKM=;
	b=j5EL9A9E6zT+7J4zfxyTv6RIMZNCRF34G2lTjJ7yWVZSQ0Y9H0FYsqBSWn/BpeVr07
	B7mV9+xKjUyCdLtxFCYxguVSGJulhS/NW2gQ+ybmAbrpnvdb8AOUQV/2roh7mcGu72pH
	srVhQgiJitKKwPevA8+ragYQGeL1oF+Hbeu5ybKua7u6l1Rz2A5LFiGueqoBgol4hoZN
	kRNpmAmGiWkNe2rBP6Ut0TXBBYjJfsuODaIepFdQHUdonN3H5z8FB4tfX5g7HjEICaYu
	OiyiYS1144dopw4ZfZA3Wes+LFKAvnn/eOiQpLA175lgn1GgO8bAJ00WyyCDnnBlYTUw
	IkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=51bomPMBpfcxq4Hsdc6zC0AboSz+RO7PR3kONwL1cKM=;
	b=RO/GipglX8wjhx2CWifX3cbc0mOkAnsxptUvd8Zz4hXZEKIWxm7lC8Wdqego+o3DKC
	pmegmBm1qdUMkwjnxHD9P5bq9VKe4FGYIDt+DCClr6TtmIUelH4UdZ5bvrpSjtYcOPvi
	H/cTe/Tkmb5cGrbx99fqDSA8uzbs9Yd/OAhJHIXRLeZTTnNczstiNKHrcFMfyONLmcs6
	UG5BCBz1CE4PKARmcBJnianvPv30VVIBSc1KnGdtN2Bgp4tFz/urDDqhsJMpww3pwl7N
	aQp1xQnjSLZ7vQ5GrFU1bdI6E07Wao3u3HOa1TJnXvQ9M27Gsf5KWA4SDTkUnHuS/jq5
	3thw==
X-Gm-Message-State: AElRT7H+XgldvoMQpuaZfHGtst31jFaCcgs1O1ZMlxIwX9bDTqrnVUom
	qsXg32Oo+/sH6tRgfssWDPQ=
X-Google-Smtp-Source: AIpwx4+Itla8b7Olffr9LCJyyXxe/XJV55ipwuuskKLCnpp1i87VGm3J5u8STWWeJbco2Ta9FT9mAg==
X-Received: by 2002:a17:902:7291:: with SMTP id
	d17-v6mr20352955pll.16.1522891304205; 
	Wed, 04 Apr 2018 18:21:44 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:9956:e5c2:70f8:aaf8?
	([2601:202:4000:1184:9956:e5c2:70f8:aaf8])
	by smtp.gmail.com with ESMTPSA id
	i86sm13752019pfi.26.2018.04.04.18.21.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 18:21:43 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <1519779977-9136-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=V=+cLpzMFoWS42NMDAuOrUMzsLCmUHfUhTrP8aEvcR2Q@mail.gmail.com>
	<CAJ86T=W_-BptfjFibUTj+Kd7jCaSmq_X4=uwa=+Xz0ZbrXWvaQ@mail.gmail.com>
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
Message-ID: <766f8165-b010-fd9f-d904-9b5c28b5d0c3@gmail.com>
Date: Wed, 4 Apr 2018 18:21:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=W_-BptfjFibUTj+Kd7jCaSmq_X4=uwa=+Xz0ZbrXWvaQ@mail.gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [morty][PATCH] buildhistory: fix latest_srcrev in the common case
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
X-List-Received-Date: Thu, 05 Apr 2018 01:21:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 04/04/2018 05:54 PM, Andre McCurdy wrote:
> On Wed, Mar 14, 2018 at 4:52 PM, Andre McCurdy <armccurdy@gmail.com> wr=
ote:
>> On Tue, Feb 27, 2018 at 5:06 PM, Andre McCurdy <armccurdy@gmail.com> w=
rote:
>>> From: Christopher Larson <chris_larson@mentor.com>
>>>
>>> buildhistory was writing srcrevs.values() as SRCREV when only one
>>> srcrev/branch exists. This returns a view of the dictionary values in=
 python
>>> 3, and used to return a list in python 2, neither of which is an appr=
opriate
>>> value for SRCREV. It was resulting in latest_srcrev files like this:
>>>
>>>     # SRCREV =3D "346584bf6e38232be8773c24fd7dedcbd7b3d9ed"
>>>     SRCREV =3D "dict_values(['346584bf6e38232be8773c24fd7dedcbd7b3d9e=
d'])"
>>>
>>> Which in turn would result in invalid output in buildhistory-collect-=
srcrevs.
>>> Fix by calling `next(iter())` on the `.values()`
>> Ping.
> Ping again.
>
> This should be a very low risk backport fix for morty but if there are
> any concerns then please let me know.

its in
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dstable=
/morty-next&id=3D92e7030eaf4618160cac4ef37b95fc3b7b83f9bd

morty has been on hold for the new host glib 2.27 and sdk issues. Those
issues have been finally addressed and we finally got a clean build. The
backlog hold should be lifted and things should be flowing again shortly.=


- armin
>
>>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>> (cherry picked from commit ef826a395612400924bbe49859d256b237ff59e1)
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>  meta/classes/buildhistory.bbclass | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhi=
story.bbclass
>>> index 3a5bc2c..d82e9bb 100644
>>> --- a/meta/classes/buildhistory.bbclass
>>> +++ b/meta/classes/buildhistory.bbclass
>>> @@ -833,7 +833,7 @@ python write_srcrev() {
>>>                          f.write('# SRCREV_%s =3D "%s"\n' % (name, or=
ig_srcrev))
>>>                      f.write('SRCREV_%s =3D "%s"\n' % (name, srcrev))=

>>>              else:
>>> -                f.write('SRCREV =3D "%s"\n' % srcrevs.values())
>>> +                f.write('SRCREV =3D "%s"\n' % next(iter(srcrevs.valu=
es())))
>>>              if len(tag_srcrevs) > 0:
>>>                  for name, srcrev in tag_srcrevs.items():
>>>                      f.write('# tag_%s =3D "%s"\n' % (name, srcrev))
>>> --
>>> 1.9.1
>>>



