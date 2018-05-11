Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5A33A75424;
	Fri, 11 May 2018 01:07:06 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id l2-v6so1698980pgc.7;
	Thu, 10 May 2018 18:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Kpi+VzVbIS5elwCJ7JZREvkKovz/45egtL/9/V7jdZU=;
	b=coYnPZ8iiU9bONZvsXMoGx01rNO/723fI17td4K0pMwDyPNNqSBRLw2D/R1+m6Qyhr
	GkQuj7BjjORPwNB/kb+3hZuYuFdebBi/uBmWt8efWuxVLGb0RwE9sh0sa9Oe7ctC4Zgp
	ev/UwtEM8ps5d15eTE+RnUTuLpp51KU0C1YFy9swYX8LRNdzWQHYCW7GyCqPtAbEkCAW
	bV3r/xCATdjf4+r2o+il/P9hD0uCDkOmWQGKvcucQ1jw3WFeF808DuuiEULwo7C/VIHf
	hDtQCFQ7K5vgjqdMhkRcvSIC8NN0lT3SHAQfPPLLfFlVpsK7dWx/eyJV8g90oMacCLco
	prZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Kpi+VzVbIS5elwCJ7JZREvkKovz/45egtL/9/V7jdZU=;
	b=oBos5iv4ujSVewgTBQBy9Je3Va+DIXSh14H6kDwA/TzqH7j8SVRnvNjZl0h7tugS6T
	5ijNtmd01x8h895P1EIObka7jzx5atwLgVrhXkFbdOxoIP8ZazEGeici/dm5Vkh2Sp3Y
	9e6cGv4NL9MUxcNo1uuQi9P0IaZP4pcVCaiuthJZKvyZFx60bqo8SO1iVMtBc51RX6DR
	9KQtclSsTkX4jPUuGp537aOFtnvEsJXCwmUOd0LT/wCoZfiACprEKU/McKLsSZ4ZaJDl
	LqtiMDgayZTRSJD+tNWVa0rlgcDrNFNmn1Efc6M1rH8zSn71sfIyf9jMCsMdwvH5rYi0
	BYIg==
X-Gm-Message-State: ALKqPwdh10l/40IlBlvvf/fxkZDWXF56F1i2eZiF4hIiQgaSengwpPh2
	7IhGwGm8jgNcoJxcBH/TnA6dutSoFFsW/KrD1Zk=
X-Google-Smtp-Source: AB8JxZo0jE2hlLLqsRxQVH9MTZw/Qk7vJi6MJvc9OlIXtLIQzl91ccMr4J8ASyF650SFTlZWfxdNXXf8l4ps5oUl5iw=
X-Received: by 2002:a62:74b:: with SMTP id
	b72-v6mr3373517pfd.133.1526000828028; 
	Thu, 10 May 2018 18:07:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.139.145 with HTTP; Thu, 10 May 2018 18:06:37 -0700 (PDT)
In-Reply-To: <CAJ86T=UOog5f1TFbRZxnpvvUcAddRMUsv2nnOQwWWWvdTGb7VA@mail.gmail.com>
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
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 May 2018 18:06:37 -0700
Message-ID: <CAMKF1sqmg-7kRbPfH_HEiyBv5vmqj4Sy=bCKqbxdQ5qG+_+5rA@mail.gmail.com>
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
X-List-Received-Date: Fri, 11 May 2018 01:07:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 10, 2018 at 6:00 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, May 10, 2018 at 5:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, May 10, 2018 at 4:11 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Thu, May 10, 2018 at 3:50 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>> On Thu, May 10, 2018 at 03:40:53PM -0700, Andre McCurdy wrote:
>>>>> On Thu, May 10, 2018 at 3:38 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>>> > see
>>>>> > http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150654.html
>>>>>
>>>>> Removing -fno-omit-frame-pointer isn't the same as adding
>>>>> -fomit-frame-pointer. Frame pointers may get enabled depending on the
>>>>> optimisation level etc (ie not only by -fno-omit-frame-pointer).
>>>>
>>>> Should I send v2 adding -fomit-frame-pointer instead of removing
>>>> -fno-omit-frame-pointer?
>>>>
>>>> The v1 fixes the issue for me with default config + DEBUG_BUILD.
>>>
>>> The v1 patch isn't wrong, it's just incomplete (the problem could come
>>> back if someone changes optimisation level or switches gcc to clang,
>>> etc).
>>>
>>> My choice would be a v2 patch which adds -fomit-frame-pointer to
>>> CFLAGS unconditionally for all ARM builds when Thumb is enabled. That
>>> should fix the problem for all optimisation levels etc and avoids
>>> building the main strace binary differently depending on whether or
>>> not ptest is enabled.
>>
>> explicitly adding this option is a poor choice especially for debug
>> builds where we should
>> let the -On level decide and not explicitly ask for either
>> enable/disable frame-pointers
>> that will also make it compiler proof.
>
> Of course, we should let the compiler decide whenever it's possible to do so.
>
> Unfortunately there are cases like this one where frame pointers clash
> with inline assembler and we need to over-rule the compiler's choice.

Here we are adding -fno-omit-frame-pointer via global opt flags that
is the issue
where we have fallouts from default O options I agree we should teach
this to build
system and help the compiler

