Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1A6A3731E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 15:33:55 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id y9so113604110qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 07:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RU6iIiPKZ/PIllYjzSWPBjVK2ufFkqrZ3EWuby0cPEA=;
	b=d8MbJ406tR+wRWCeOgGhY7ylOB7gHfi8IwSx4X6wxDrZsGsg9XqyyALdwIb29+DMip
	06XNsc40BoE5+iFGldnUnBA9M1edj0DyJzv9v0L5k0bI/wV/5xIRwQGIEPp/YxfGGIyk
	rXykRtSkgXa0aPOySh7nsKxLHPav7KgMOiqNwKg42jR/6i2LAzivsRptUIFUyhPaL69g
	kNm/coeiCBKih9+sJo7xh1p22IMRwKAE63Jut8GpcIyd6IpzCWZCpd9KcRLdVGAjkyqa
	jWM29Uq4oU1t6qtoeL6kEfdkVpBeWd4sAqRTfJPuemT+RNWShgYRsW7pcS5a0L6QiSTl
	XvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RU6iIiPKZ/PIllYjzSWPBjVK2ufFkqrZ3EWuby0cPEA=;
	b=TZRuoqUkGUBNC6o+tnDVdTqWVKH6iaZEEDEltYnh1RGI59hXcbuhNtFQWJ6sNb8X7a
	V/6VJEkbQP8OkV08ILR7Q4bQVcM4VyVz8bjIxy0OZWTs5AT6IyfdRmSSIs6dhIk7n3Kq
	JdnJjLUNJUoi1MQl2jrHKlH7YTgKlbklxyC1fIGWDLHKi93E4U2hpwO6h6LXPMd9D5cQ
	E01p2Yi+J69zVcfbzLVsD7CUzBHvSFsVPChkOAv0nM/mpmG7gHs8LrzRnBRr8fRo9F4X
	+PmQIEaenmmtf8oqQXbz8/HrP2aSrvLwfr5gQnqY0nqMsXxADOdt2Y3f7on+9HBL59aG
	tK7w==
X-Gm-Message-State: AG10YOQnEFeCwdt64zgKOWQLXrVhhmmO91vaaLZtDZfIa2AfM9jPvEEaFU3GEw0TXWcu/nQroqstzNhOgg7KMA==
X-Received: by 10.140.108.181 with SMTP id j50mr20813083qgf.104.1455550436687; 
	Mon, 15 Feb 2016 07:33:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 15 Feb 2016 07:33:27 -0800 (PST)
In-Reply-To: <1455546649.16142.419.camel@linuxfoundation.org>
References: <1455483171-66851-1-git-send-email-raj.khem@gmail.com>
	<1455483171-66851-5-git-send-email-raj.khem@gmail.com>
	<1455546649.16142.419.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Feb 2016 07:33:27 -0800
Message-ID: <CAMKF1srE_muF7oTJ-CK_QsV7QTONCYdwgPdx3MhLxwWnfvw-RA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] binutils: Use tip of 2.26 branch
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
X-List-Received-Date: Mon, 15 Feb 2016 15:33:57 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 15, 2016 at 6:30 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sun, 2016-02-14 at 20:52 +0000, Khem Raj wrote:
>> Until 2.26.1 is released there are few fixes which are needed
>> especially
>> when using -fpie, here are changes that are part of this version bump
>>
>> H.J. Lu (7):
>>       Add a testcase for PR ld/18591
>>       Store estimated distances in compressed_size
>>       Remove duplicated marker for 2.26 in gas/NEWS
>>       Add -mrelax-relocations= to x86 assembler
>>       Mask off the least significant bit in GOT offset
>>       Enable -Bsymbolic and -Bsymbolic-functions to PIE
>>       Fix a typo in objcopy manual
>>
>> John David Anglin (1):
>>       Fix /usr/bin/ld: final link failed: File truncated error on
>> hppa
>
> I think this is resulting in:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/buil
> ds/625/steps/BuildImages_1/logs/stdio
>
> and
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm-lsb/
> builds/638/steps/BuildImages_1/logs/stdio
>
> where config.log in one case says:
>
> configure:4407: checking for C compiler default output file name
> configure:4429: arm-poky-linux-gnueabi-gcc  -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types --sysroot=/home/pokybuild/yoc
> to-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/sysroots/beaglebone  -O2 -pipe -g -feliminate-unused-debug-types -fstack-protector-strong -pie -fpie -D_FORTIFY_S
> OURCE=2  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong -Wl,-z,relro,-z,now conftest.c  >&5
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/5.3.0/ld:
> error: a.out uses VFP register arguments, /tmp/ccbzGaSi.o does not
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/5.3.0/ld: failed to merge target specific data of file /tmp/ccbzGaSi.o
> collect2: error: ld returned 1 exit status

yeah, it means we need to add in the variable which sets -mfloat-abi
into CC as well since we are using callconvention-hard here. I will
send a v2 soon.

>
> Cheers,
>
> Richard

