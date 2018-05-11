Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 83EF0753F1;
	Fri, 11 May 2018 01:11:50 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id 203-v6so2327722vka.12;
	Thu, 10 May 2018 18:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P2elj8HVuH6dd3aFclJH2f+mzZWCWP8duUg3MnsIqF8=;
	b=LdaYjaY77mH6J9wtAz+NFHPdHi39L1/8dwqErreM+KKhtZRhVGXvZhcyZbh23zMjPM
	/MeZEoArTai1TTxbSCFNKmtQnJ3OSYXI3gUiA+t+atNq7+leDIrkmd/BmLis1uwAu6Lw
	PsDS65hsV+qDS2YaqyVLh8opTCjN1OM/QDiZKcrPYhPclBSJtBiOnKIVn/+//jqfjm+V
	iaEhIwK0Rp6x/0dRfEN1x4V03TAjveTTvrE5p48YCQqoDxnruKA0mu0S9RUYuw0XO800
	weiIgj/tvD9xn7WPocKMA9K5s07R8+YGr/UkdDABqRwLpXOQvohUnHB0DNWVwS2/Yp+X
	64gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P2elj8HVuH6dd3aFclJH2f+mzZWCWP8duUg3MnsIqF8=;
	b=evYt9rFPqxKoCrDIYNZn/7hMW6Ip0akbqLr4PXFmqVL0O8knu1bz6cD3KJJHc2qbs0
	dtzqNOw2dQMsZkJUjOySw/NwA61EIsuOehS2nZ6+gzl36z4kTmYiCO1PU5wlJiSH2rHP
	CAR7CJ9WVIXRfLQivqNVkoM4QsevkAvVvpljKFGsiNgIko8PCP2NMSq0PpSpnUodQ48z
	9qMZWlVMbTu9V17/XfSWKVlfdF3O8yVzeFyYVQDMpAq4K1W1el1MJIf7btbvZx1qu7K6
	MVir+5CT+1dSmcCIHlHKKzIQp98fHDwa40RbdmwnUc1E6wKzAg4Lab0R9oUWkhH4W2vR
	T1kw==
X-Gm-Message-State: ALKqPwem/1flCuh9maWo13R809WhzLY4NFyom1WKZBc6u0/LHT/7rZJE
	SWokNkEgTizooX0QGwLU0b+sHcNayPzSTfsQuME=
X-Google-Smtp-Source: AB8JxZrwJW15BvH0ueEdbyPOsrWtKy4xzaAXzY0K2TkcZwHAuevRtSyWoysZ6qrkgHH9+FirdC1zcMAEsfEAAOTnpNk=
X-Received: by 2002:a1f:4445:: with SMTP id
	r66-v6mr2567379vka.154.1526001111950; 
	Thu, 10 May 2018 18:11:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Thu, 10 May 2018 18:11:51 -0700 (PDT)
In-Reply-To: <CAMKF1sqmg-7kRbPfH_HEiyBv5vmqj4Sy=bCKqbxdQ5qG+_+5rA@mail.gmail.com>
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
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 10 May 2018 18:11:51 -0700
Message-ID: <CAJ86T=WQd-1MWa7H1Zt28i2NPV5f6VOKvaE0LTP+PkKQtdFNKA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 11 May 2018 01:11:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 10, 2018 at 6:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, May 10, 2018 at 6:00 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Thu, May 10, 2018 at 5:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Thu, May 10, 2018 at 4:11 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>> On Thu, May 10, 2018 at 3:50 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>>> On Thu, May 10, 2018 at 03:40:53PM -0700, Andre McCurdy wrote:
>>>>>> On Thu, May 10, 2018 at 3:38 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>>>> > see
>>>>>> > http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150654.html
>>>>>>
>>>>>> Removing -fno-omit-frame-pointer isn't the same as adding
>>>>>> -fomit-frame-pointer. Frame pointers may get enabled depending on the
>>>>>> optimisation level etc (ie not only by -fno-omit-frame-pointer).
>>>>>
>>>>> Should I send v2 adding -fomit-frame-pointer instead of removing
>>>>> -fno-omit-frame-pointer?
>>>>>
>>>>> The v1 fixes the issue for me with default config + DEBUG_BUILD.
>>>>
>>>> The v1 patch isn't wrong, it's just incomplete (the problem could come
>>>> back if someone changes optimisation level or switches gcc to clang,
>>>> etc).
>>>>
>>>> My choice would be a v2 patch which adds -fomit-frame-pointer to
>>>> CFLAGS unconditionally for all ARM builds when Thumb is enabled. That
>>>> should fix the problem for all optimisation levels etc and avoids
>>>> building the main strace binary differently depending on whether or
>>>> not ptest is enabled.
>>>
>>> explicitly adding this option is a poor choice especially for debug
>>> builds where we should
>>> let the -On level decide and not explicitly ask for either
>>> enable/disable frame-pointers
>>> that will also make it compiler proof.
>>
>> Of course, we should let the compiler decide whenever it's possible to do so.
>>
>> Unfortunately there are cases like this one where frame pointers clash
>> with inline assembler and we need to over-rule the compiler's choice.
>
> Here we are adding -fno-omit-frame-pointer via global opt flags that
> is the issue
> where we have fallouts from default O options I agree we should teach
> this to build
> system and help the compiler

Since there's NO situation where enabling frame pointers is going to
work for this code + ARM + Thumb, I don't see the advantage of leaving
anything up to chance. Just explicitly disabling frame pointers is the
safest and cleanest option.

