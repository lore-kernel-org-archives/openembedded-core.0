Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5A631753FE;
	Fri, 11 May 2018 01:16:44 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id w129-v6so1901913pfd.3;
	Thu, 10 May 2018 18:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XhF5HNnOL/Ec+nDsL+/6CHas1HT099bmP/KYNwACSys=;
	b=IjyqNDoILn109ZM9WyHfWW0vQNZyrlg+RWPsGbOkgS2fcgVnHuoyY8DdUeTNnzjith
	6y2FuIyMN3e3HAvFLeWmxTeRUwAqUXaLYKbq9sdAChUiEnEiCWb8Qqp2pmuvzhRZOVCU
	96QykabZGskOzWDjyEMPy+JiLJANvKuP8RlC8VZw6RzrYNwMmB/NfiPDge1RAM9AVQwv
	7QAWoK6tzsDo4zfCvW7k1HHqQ+Z4zxLLre3rEIzeNgEECyt6u2uUlJ/l+2uxXeMJXMhJ
	J8H+Vb7ExIQNhMXx2qWKFGTO4CvyEUvj6ychxP9TBLt0u5xA5IcOkxNjzMnxR0KyBJYV
	6CCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XhF5HNnOL/Ec+nDsL+/6CHas1HT099bmP/KYNwACSys=;
	b=P1TypSbQzRGPycE9fdsprt1WM5sAKM82h3dFcukN7S8VWbBaNcTY5bhKUpNMZYnHQH
	IeEJW5mm+kCX1ErQ5HwiGbe9ufPCcaTan1gsvLDv/lM8tf7AVHYARh42dYhgw9/oVNPz
	jD0e+8S5Y1zwrc6KXr/MHWqVm1WO7X01cQDUQlnkM7F/3zzMQjUUyDyLLrqzQ8Hd21Aj
	wYks6JPANU/c6qEf5g5x1smtRdEU4Nqem1CuLkJFVeaY4wpXk5sKCteP383Y8nZgalOS
	S3sJQuTodZN7Fk8ZqxvL4XCp3TfMW5jsCnI2LKMggmnCKUC2sN4uELOyu15NB3GvCpMU
	fdVQ==
X-Gm-Message-State: ALKqPwcTb/iEOmMjIUwrPAtQo1vuzaNstKkgKSidcHg8r+y/Zr1boScm
	wJEdl3qjxBcRYUIKpSKpdBZtiO0yW3LPzmf58Gs=
X-Google-Smtp-Source: AB8JxZqZN7OAzloY8JoqL1D9rJm/zwbOHu4gDQAxWFxLCl8J4Pue0daT7PwlUIz69LHBxRw0n5bNgSLeZZhsoVPJY7A=
X-Received: by 2002:a63:41c1:: with SMTP id
	o184-v6mr2791590pga.393.1526001406043; 
	Thu, 10 May 2018 18:16:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.139.145 with HTTP; Thu, 10 May 2018 18:16:15 -0700 (PDT)
In-Reply-To: <CAJ86T=WQd-1MWa7H1Zt28i2NPV5f6VOKvaE0LTP+PkKQtdFNKA@mail.gmail.com>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<8d962430-ac63-5e97-fd32-2c0464c62acb@gmail.com>
	<20180510191145.GA1954@jama>
	<CAJ86T=Xz+2neJPBw41_sFxd977xp=zznsgzFdbeHJ-aysJNk+g@mail.gmail.com>
	<20180510214325.GC1954@jama> <20180510220735.GD1954@jama>
	<CAJ86T=UpZ0+HTqre2Z4eAPM9LY_eH1EUO=e1v0sz7FPe4+8aRw@mail.gmail.com>
	<CA+chaQcTPwJy+dL6GvBKJTcZuiVUiztVqEDXmSwZ==b53m_mcQ@mail.gmail.com>
	<CAJ86T=XkBkKhK6mwqxnFA1CkaV5swjGKsdNv_7E9fgFa=qhdCw@mail.gmail.com>
	<20180510225017.GE1954@jama>
	<CAJ86T=UfXtgtaWQyJbrhW40MJFW9YAArB3CshMxy5e5f9Cg_=Q@mail.gmail.com>
	<CAMKF1soAQYfL+gwsEmt6bZv_42pO_F5Gsb0CxUrdWueaja50hg@mail.gmail.com>
	<CAJ86T=UOog5f1TFbRZxnpvvUcAddRMUsv2nnOQwWWWvdTGb7VA@mail.gmail.com>
	<CAMKF1sqmg-7kRbPfH_HEiyBv5vmqj4Sy=bCKqbxdQ5qG+_+5rA@mail.gmail.com>
	<CAJ86T=WQd-1MWa7H1Zt28i2NPV5f6VOKvaE0LTP+PkKQtdFNKA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 May 2018 18:16:15 -0700
Message-ID: <CAMKF1sr1ic2iJLaZsPXGUAhkfb-RJoo6tA1cvCW6Bq3jjCsZrA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
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
X-List-Received-Date: Fri, 11 May 2018 01:16:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 10, 2018 at 6:11 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, May 10, 2018 at 6:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, May 10, 2018 at 6:00 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Thu, May 10, 2018 at 5:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Thu, May 10, 2018 at 4:11 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>>> On Thu, May 10, 2018 at 3:50 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>>>> On Thu, May 10, 2018 at 03:40:53PM -0700, Andre McCurdy wrote:
>>>>>>> On Thu, May 10, 2018 at 3:38 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>>>>> > see
>>>>>>> > http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150654.html
>>>>>>>
>>>>>>> Removing -fno-omit-frame-pointer isn't the same as adding
>>>>>>> -fomit-frame-pointer. Frame pointers may get enabled depending on the
>>>>>>> optimisation level etc (ie not only by -fno-omit-frame-pointer).
>>>>>>
>>>>>> Should I send v2 adding -fomit-frame-pointer instead of removing
>>>>>> -fno-omit-frame-pointer?
>>>>>>
>>>>>> The v1 fixes the issue for me with default config + DEBUG_BUILD.
>>>>>
>>>>> The v1 patch isn't wrong, it's just incomplete (the problem could come
>>>>> back if someone changes optimisation level or switches gcc to clang,
>>>>> etc).
>>>>>
>>>>> My choice would be a v2 patch which adds -fomit-frame-pointer to
>>>>> CFLAGS unconditionally for all ARM builds when Thumb is enabled. That
>>>>> should fix the problem for all optimisation levels etc and avoids
>>>>> building the main strace binary differently depending on whether or
>>>>> not ptest is enabled.
>>>>
>>>> explicitly adding this option is a poor choice especially for debug
>>>> builds where we should
>>>> let the -On level decide and not explicitly ask for either
>>>> enable/disable frame-pointers
>>>> that will also make it compiler proof.
>>>
>>> Of course, we should let the compiler decide whenever it's possible to do so.
>>>
>>> Unfortunately there are cases like this one where frame pointers clash
>>> with inline assembler and we need to over-rule the compiler's choice.
>>
>> Here we are adding -fno-omit-frame-pointer via global opt flags that
>> is the issue
>> where we have fallouts from default O options I agree we should teach
>> this to build
>> system and help the compiler
>
> Since there's NO situation where enabling frame pointers is going to
> work for this code + ARM + Thumb, I don't see the advantage of leaving
> anything up to chance. Just explicitly disabling frame pointers is the
> safest and cleanest option.

In that case what we are saying is that strace has wrong assumptions
I would think its best to change strace build system to demand this
option override instead of injecting it externally.

