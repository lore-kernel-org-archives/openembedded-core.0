Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2346676EBF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 04:18:08 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id w126-v6so13660070oie.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 21:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ZaxNESafzZjNsqwoDcnHnKiCqPwzSU/gLYhUuT7Uc8g=;
	b=Y9I6qx0mLGC6xYZx7HSJUrAcp4EwBcBoj2GV8n03P8oVb2DIRVDpQDGoQZvCCaY0Rr
	BAAIu4FhWe2HrHdz5rsPpz6WVl9FODuCw/bjEuAhAF2LBNUlQNTEDpqy7uFOVMnJrdl3
	s74XhSwL2tOmr8tG/l6zcf6Hx9kw7J7s4J0TAW+sJSMEiw+ccYxWabEi0NlFJbxjDJcL
	HJeEvXrmriSOeODF3q4Zpomd/PQUQ8kjmHyos9+8w30Fyky4XOa9VKE7QyXXZSmCRA0o
	h+M0fZn4tAC1nY1qSw8c1KcpWEgHq9NRQObRKfrpjd/ko9bh6eNQuXpREmwmg2WE1tOC
	Lrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=ZaxNESafzZjNsqwoDcnHnKiCqPwzSU/gLYhUuT7Uc8g=;
	b=mCR71sIwFBhWPw3i+g9L5f5jrQ8fOygKyzjAHMjqrzWSXeamYuzQInElH+AT9Hqvry
	yj0CFSaABKdNAMAJxKoI1CXPM0XAGvZNfGVk2c8yRbhHY1YydOOnLC4Wnq8SZGDbRNED
	5+DVobNzp/PUlXV4gdsKOpvuX6TyGY9D8PGCB7C0Oovf+ZM7UHNKszuVE6YdL8CD5uW3
	OB5NMoTEirjiQ0tepF5CydP1+JAcvQnzEi/zTY8mLD3Xkqz0wdGeB770jykAMlrRXFCY
	xDW/bE8VhfJCvZ4YtUMnDTjSsQ4TCDCqZ3887jel1DeswX7YdOKrpFpJQDkZ/JlgBh/e
	Kp7Q==
X-Gm-Message-State: AOUpUlGgKtfDe4sythnLiMJiyf2GHzzwABuD4Y90IOcXtKOeXpIiFGbc
	97xB0ln4l9iyRZSOoPVrOc8nf4cx
X-Google-Smtp-Source: AA+uWPx5rhQ4WPgGI9pGCMjvq07Ry6cIDX+WjoKARqBlxSpftKwI4s5ENFwDMdN01gWNc4MD1Up9fA==
X-Received: by 2002:aca:40d6:: with SMTP id
	n205-v6mr5226218oia.35.1533874689912; 
	Thu, 09 Aug 2018 21:18:09 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:5de4:c93b:e6fb:e38d?
	([2601:202:4180:c33:5de4:c93b:e6fb:e38d])
	by smtp.gmail.com with ESMTPSA id
	m7-v6sm9126281oia.32.2018.08.09.21.18.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Aug 2018 21:18:09 -0700 (PDT)
To: =?UTF-8?Q?Daniel_D=c3=adaz?= <daniel.diaz@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAEUSe799Ubpgn9mVfxcKHKfoyV1VnDNk+ByF8V5eKE6ueHcU0Q@mail.gmail.com>
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
Message-ID: <6507087c-1a17-f3e2-0946-a7a9e1c22d65@gmail.com>
Date: Thu, 9 Aug 2018 21:18:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAEUSe799Ubpgn9mVfxcKHKfoyV1VnDNk+ByF8V5eKE6ueHcU0Q@mail.gmail.com>
Subject: Re: [rocko][PATCH] glibc: Avoid multilibbing on wordsize.h
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
X-List-Received-Date: Fri, 10 Aug 2018 04:18:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 08/09/2018 10:10 AM, Daniel Díaz wrote:
> Hello!
>
>
> On 26 July 2018 at 09:38, Daniel Díaz <daniel.diaz@linaro.org> wrote:
>> Once another header #includes <bits/wordsize.h>, there is a
>> potential recursion going on because the
>> multilib_header_wrapper.h #includes <bits/wordsize.h> again!
>>
>> This should not happen because an __arm__ (32-bits) or an
>> __aarch64__ (64-bits) environment guarantees that we will
>> be getting the correct definition, but when building against
>> a different target (like BPF), recursion is what happens.
>>
>> This can be seen, for instance, when building eBPF programs
>> from the kernel with `clang -target bpf', such as the ones
>> located in linux/tools/testing/selftests/bpf/.
>>
>> (From OE-Core rev: a74c77d6168101e88c3a3bce7130f4f52cfab95d)
>>
>> Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
>> Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  meta/recipes-core/glibc/glibc-package.inc | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
>> index b6d8074..c360dd9 100644
>> --- a/meta/recipes-core/glibc/glibc-package.inc
>> +++ b/meta/recipes-core/glibc/glibc-package.inc
>> @@ -136,8 +136,7 @@ do_install_append_armeb () {
>>  }
>>
>>  do_install_armmultilib () {
>> -
>> -       oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h bits/wordsize.h
>> +       oe_multilib_header bits/endian.h bits/fcntl.h bits/fenv.h bits/fp-fast.h bits/hwcap.h bits/ipc.h bits/link.h
>>         oe_multilib_header bits/local_lim.h bits/mman.h bits/msq.h bits/pthreadtypes.h bits/pthreadtypes-arch.h  bits/sem.h  bits/semaphore.h bits/setjmp.h
>>         oe_multilib_header bits/shm.h bits/sigstack.h bits/stat.h bits/statfs.h bits/typesizes.h
>>
>> --
>> 2.7.4
>
> Please disregard this patch. An alternative will be posted shortly.
ok, thanks for the heads up. its in my mut branch. I will dropped shortly.

- armin
>
> Greetings!
>
> Daniel Díaz
> daniel.diaz@linaro.org


