Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 615D3601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 20:42:52 +0000 (UTC)
Received: by yhom41 with SMTP id m41so16210839yho.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 13:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UmAxLg+NDQ15fr8SHuHsIKL84Fd14OXQitGjvaX49cc=;
	b=PeLFvhuiqWGdGobjgfDtrQpGDsr4CJZdaRHKGnbuF0p6iNqNbcDk1rzBcyZdGx/tR9
	rjk3r1etxO6P+ODjr/eNE/T6Cc2ZlmCoIE7/Je/h0foB6hpqkelpjalptsibeWJ20GKI
	OY4/1B7dDjKiUQOJZ6GaJpQnupg8e0BEDX4Pmok+YRDr/cu85iI6h7tfobVMYgN/9nCy
	RIsSChvjEauYRIgvgfKVPOmIn00WLKojCIInn3tm0w228bTiP1bbENzii1nXQL8d6mpK
	UYzbJNty9AUtcV3vSLEy/BSUR7/BRAfaLqjCoVL8VFqDfN/Ui1bk9TaKTNxf3Xi67uNh
	9jJA==
MIME-Version: 1.0
X-Received: by 10.236.22.40 with SMTP id s28mr32148962yhs.194.1432154573354;
	Wed, 20 May 2015 13:42:53 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 20 May 2015 13:42:53 -0700 (PDT)
In-Reply-To: <555BA1FE.5000402@windriver.com>
References: <1431268136-6968-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>
	<1431295383.30971.25.camel@linuxfoundation.org>
	<1431414393.30971.109.camel@linuxfoundation.org>
	<1431686433.18723.22.camel@linuxfoundation.org>
	<555BA1FE.5000402@windriver.com>
Date: Wed, 20 May 2015 16:42:53 -0400
Message-ID: <CADkTA4MZpLUXRuu5EjqvrE-Eoo7tnh20VhtAEf9uA5S_=GzJ7A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: fix build issue with gcc5
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
X-List-Received-Date: Wed, 20 May 2015 20:42:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 19, 2015 at 4:50 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 2015-05-15 06:40 AM, Richard Purdie wrote:
>>
>> On Tue, 2015-05-12 at 08:06 +0100, Richard Purdie wrote:
>>>
>>> With the gcc patch I've posted applied:
>>>
>>>
>>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=5fd0b7c163f4f3312bea9bd3246a6bd67a8da594&limit=100
>>>
>>> so down to 57 errors. There are a few themes:
>>>
>>> * linux-yocto 3.14 gcc5 issues
>>> * meta-fsl-ppc and metafsl-arm gcc5 issues, particularly kernel
>>> * poky-lsb issues with the security flags and gcc5
>>> * x32 failed with a race of some kind in glibc, suspect transient
>>> * gcc-target has a packaging issue which fails builds (have patch)
>>>
>>> The good news is that the various ppc issues are fixed including the rpm
>>> one from this series.
>>
>>
>> Latest run:
>>
>>
>> http://errors.yoctoproject.org/Errors/Search/?items=10&query=a2fbb1b6b6e564b3f9d40550c0b408978f420039&limit=100
>>
>> with 37 errors.
>>
>> * linux-yocto 3.14 gcc5 issues
>
>
> I had a look at the failures in more detail today, and I can have a
> go at fixing the qemu* build failures tomorrow.

I have qemuarm building with gcc5 now (4 backports and one patch of my
own), moving onto qemumips.

I'm still not planning to look at the h/w reference BSPs, so I'm looking for
feedback on creating bugs and assigning them to maintainers.

Bruce

>
> I have one patch from Armin, and will pick up some of the patches
> that Khem referenced in his earlier email.
>
> .. but for the reference BSPs, I simply don't have the cycles. Can
> we just open bugzilla for the individual boards and get their
> respective maintainers to have a look ?
>
> If this is high priority, then getting it tracked in bugzilla
> seems reasonable to me.
>
> Bruce
>
>
>> * meta-fsl-ppc and meta-fsl-arm gcc5 issues, particularly kernel
>> * poky-lsb issues with the security flags and gcc5 (elfutils,
>>    coreutils, iptables, openssl on edgerouter)
>> * qemuarm doesn't boot
>> * u-boot with beaglebone
>>
>> linux-yocto 3.14 is the next thing we need to clean up to have the most
>> impact, qemuarm not booting is the most worrying.
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

