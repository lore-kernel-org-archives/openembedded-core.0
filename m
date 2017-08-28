Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A01DF77A5A;
	Mon, 28 Aug 2017 17:38:29 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id t3so833590pgt.5;
	Mon, 28 Aug 2017 10:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rHQLVnaDbRTUpp2WhtjA8FN/8w5T5ZLjQWFeMXQaTno=;
	b=ZPlvmnRRp9ZhH441E6jSbjl+UP65kofZRAexFB+mQt8oZW8O05KRmvjI6zlegCDdIU
	/aBb7ZcLqQYQj906DE6Tz+F8QQCr6lxbRF0kQyLuayFT8SYiJkfkEQt0VT+RVhf9ruS0
	AhXKe1wYJ2bP3UQEad/qUVnu7QpeqOSdCo2gJX3825BplZu7ZJedM+7Y4nRNoHLwWypc
	zaF1fuTsigWa2T1Q1GWmnUU7TTIWkhpfEqnUDwp59Ay7meAFdhe7B7IPlSAHixRNfDxc
	/BoYFf3TVmSmkieesT2wqSLRe3yIgDPfCHI1LOCQrKx6QgNuubFCAQy/2bRWDch0AjTB
	aZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rHQLVnaDbRTUpp2WhtjA8FN/8w5T5ZLjQWFeMXQaTno=;
	b=QOZikh8eb64L7gw90FKErqHpkxDZUyXaTPQ9UE4CEsRkUH2eMnRxDhVg/V7Hga73UK
	iA+3QkxtIAUCbWDCMp0NyLFuMhqpqAbASt3rFn0gNjsItZuMpanlUqsT1Et3ziKmN+4X
	/qQZa4kT47miEVjIW3baLh8AdLATQugoRfHtf/nOCzTdLgtsMApgRru5WToaMD/L8Hqh
	AW8JP1apgrfAx2k1I6ZOJPgBIgrJOWp8soXKaTqrNtVbEKvRhy6n9JWlMCLhI+tQouQG
	rYq1Qk93VrSQ7BlEW5DeOEsQktvpVLBsY1AglBM6gz0RrhaXwRRWhav+ddYbcRtlouWc
	iALQ==
X-Gm-Message-State: AHYfb5geR3Dh6IV7badf19527JRuURc9XSe85MHoy++p4GqhT5sRv3ie
	oqA8PaqEi01E+r/3Nx/k7R8toHGfXA==
X-Received: by 10.101.90.196 with SMTP id d4mr1216073pgt.439.1503941910699;
	Mon, 28 Aug 2017 10:38:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 28 Aug 2017 10:38:00 -0700 (PDT)
In-Reply-To: <1503935582.27472.231.camel@linux.intel.com>
References: <1503933912.27472.227.camel@linux.intel.com>
	<CAMKF1srChtUATL3_GFx4hzUz81y7SxVM8UbXsahKJwYVJ0iLqw@mail.gmail.com>
	<1503935582.27472.231.camel@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Aug 2017 10:38:00 -0700
Message-ID: <CAMKF1srAL_B=GFXBGvMeZJQiycTsASzBstoSfs+0r194wd7LTA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OpenEmbedded List <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Usage of "elf" IMAGE_TYPES
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
X-List-Received-Date: Mon, 28 Aug 2017 17:38:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 28, 2017 at 8:53 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On Mon, 2017-08-28 at 08:31 -0700, Khem Raj wrote:
>> On Mon, Aug 28, 2017 at 8:25 AM, Saul Wold <sgw@linux.intel.com>
>> wrote:
>> >
>> >
>> > Folks,
>> >
>> > I know it's late in our 2.4 cycle, but we recently discovered that
>> > mkelfImage fails due to a recent upgrade to binutils. In doing some
>> > research, mkelfimage was removed back in Oct 2014 from the coreboot
>> > repo. It was replaced with cbfstool.
>> >
>> > Unless I hear otherwise, I recommend that we mark elf Images as
>> > deprecated for 2.4 and remove them in 2.5.
>> >
>> > I have not yet dived into exactly what binutil change triggered the
>> > failure.
>> >
>> > Further thoughts?
>>
>> you should describe what the errors are, maybe then we can make
>> further
>> inroads into problem. As far as removal is concerned, I support that
>>
> My Bad!  During testing we found the following bug: https://bugzilla.yo
> ctoproject.org/show_bug.cgi?id=11967
>
> The code that goes along with the Internal error is:
>        /* A sanity check against bad versions of binutils */
>         if (params->convert_magic != CONVERT_MAGIC) {
>                 die("Internal error convert_magic %16llx != %16llx\n",
>                         (unsigned long long)(params->convert_magic),
> CONVERT_MAGIC);
>         }
>
> params->convert_magic is set inside some assembly code:
>         .section ".trailer", "a"
>         /* Constants set at build time, these are at the very end of my
> image */
>         .balign 16
>         .global params
> params:
> convert_magic:
>         .quad   CONVERT_MAGIC
>
> It might be a simple fix, but I have not dived the rest of the way!
>

looks like there are some parameter mismatch. its quite likely that
some displaced
addresses are being fed. Its probably easy enough to debug it. Just
match the elf
header and the members of struct image_parameters which it is mapping into


static unsigned char payload[] = {
#include "convert.bin.c"
};

so check whats the content of convert.bin.c and may be answer is there

secondly I do not see it handling ET_DYN objects. If you are building
with PIE that could
be another issue



> Sau!
>
>
>> >
>> >
>> > Sau!
>> >
>> > _______________________________________________
>> > Openembedded-architecture mailing list
>> > Openembedded-architecture@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-archite
>> > cture

