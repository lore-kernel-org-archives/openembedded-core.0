Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4F30F6FF7B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 17:04:49 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id y9so115577442qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 09:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=dStH5fdAd4R2RfMIN9KzXv9SF9byi5xR9jo+CrffpmE=;
	b=H0aSWZ9Gi2ea4S4nR/v9tMUzufQcvx4GebhOzeOpwO6+UZxwoSRYd2WA02e9E9FZ1u
	XZiCUvNjuziwrewk29nOyBRpF5P5BncNIXwU7Tus6eacLnwI8EB16oHJ9rdzwUP1mBdt
	ycFrIJAKfCjxtQV0PdaJRudsF92NtI3FRXdF1Nbueax3Eu2mOSZEELZ1/WKqX+OjxNZ4
	/BQbjZ30KuJES5iA36vo2+S3bBpoSdn3YRRTdH1nyK8MGt50g16BivuBhJ3A+7ViIPy5
	QTLehMaDKtTQfvEkq9F/TExxmyaPbvZE0+84vv7k3m7NUtpwBvjgrxntQEtMAzNLV5uu
	0tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dStH5fdAd4R2RfMIN9KzXv9SF9byi5xR9jo+CrffpmE=;
	b=DSl0FOR8fLSuYFDzZXMLCRf7CiX/o9nvwxw4u0mC7nI6inrZmj33GPw9cNE3GSNkZ4
	WXLPHbgLGsx+Zl8dFTks6ae077LocIjd/F3stgP6TgmNuMe2alJI+gE9zxTlHXBhA2TY
	DRzr5RslpBX1APQmSKS5wHcwzW2mknPjjttLmW/7M7hLiik+fhw72FcmcmGFZzyUel5G
	ovBkSqc0dLgzD8JdRncWA+N493I6kAQCN0r5utxsCho8Ie6xS2NvOWCicMUPsJ60KmbL
	Yu5pl9R11o5eB57o9BDhEUsh7inWkBsWJMl7DKa6tPN4bpkav6j8ibK8Z5/59Ix3QbTK
	KOsA==
X-Gm-Message-State: AG10YOQ4xPQkAZ6Tg/x69flk8RnibUKKCPotWUUj0fXcRKWRvF1/24vH227KCbz3xRUee6ar9zY6L9fBfcvG7Q==
X-Received: by 10.140.100.141 with SMTP id s13mr21360267qge.25.1455555890087; 
	Mon, 15 Feb 2016 09:04:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 15 Feb 2016 09:04:20 -0800 (PST)
In-Reply-To: <CAMKF1srE_muF7oTJ-CK_QsV7QTONCYdwgPdx3MhLxwWnfvw-RA@mail.gmail.com>
References: <1455483171-66851-1-git-send-email-raj.khem@gmail.com>
	<1455483171-66851-5-git-send-email-raj.khem@gmail.com>
	<1455546649.16142.419.camel@linuxfoundation.org>
	<CAMKF1srE_muF7oTJ-CK_QsV7QTONCYdwgPdx3MhLxwWnfvw-RA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Feb 2016 09:04:20 -0800
Message-ID: <CAMKF1sqzrwYm7n+uQWqFQBb3=gPTtqTN_9rjmkgUMXhP_9a_kg@mail.gmail.com>
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
X-List-Received-Date: Mon, 15 Feb 2016 17:04:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 15, 2016 at 7:33 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Feb 15, 2016 at 6:30 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Sun, 2016-02-14 at 20:52 +0000, Khem Raj wrote:
>>> Until 2.26.1 is released there are few fixes which are needed
>>> especially
>>> when using -fpie, here are changes that are part of this version bump
>>>
>>> H.J. Lu (7):
>>>       Add a testcase for PR ld/18591
>>>       Store estimated distances in compressed_size
>>>       Remove duplicated marker for 2.26 in gas/NEWS
>>>       Add -mrelax-relocations= to x86 assembler
>>>       Mask off the least significant bit in GOT offset
>>>       Enable -Bsymbolic and -Bsymbolic-functions to PIE
>>>       Fix a typo in objcopy manual
>>>
>>> John David Anglin (1):
>>>       Fix /usr/bin/ld: final link failed: File truncated error on
>>> hppa
>>
>> I think this is resulting in:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/buil
>> ds/625/steps/BuildImages_1/logs/stdio
>>
>> and
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm-lsb/
>> builds/638/steps/BuildImages_1/logs/stdio
>>
>> where config.log in one case says:
>>
>> configure:4407: checking for C compiler default output file name
>> configure:4429: arm-poky-linux-gnueabi-gcc  -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types --sysroot=/home/pokybuild/yoc
>> to-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/sysroots/beaglebone  -O2 -pipe -g -feliminate-unused-debug-types -fstack-protector-strong -pie -fpie -D_FORTIFY_S
>> OURCE=2  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -fstack-protector-strong -Wl,-z,relro,-z,now conftest.c  >&5
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/5.3.0/ld:
>> error: a.out uses VFP register arguments, /tmp/ccbzGaSi.o does not
>> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/sysroots/x86_64-linux/usr/libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/5.3.0/ld: failed to merge target specific data of file /tmp/ccbzGaSi.o
>> collect2: error: ld returned 1 exit status
>
> yeah, it means we need to add in the variable which sets -mfloat-abi
> into CC as well since we are using callconvention-hard here. I will
> send a v2 soon.

I posted a V2 to fix this issue. However this patch is not the cause.
Its the security flags patch which is causing it. So v2 is posted for
that patch
see
http://lists.openembedded.org/pipermail/openembedded-core/2016-February/117564.html

