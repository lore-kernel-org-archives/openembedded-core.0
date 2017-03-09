Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6AF75730F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 20:09:51 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z63so12661014wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 12:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tHf8dAfvDegvHYnSinKEZ+SBky8dZ5mm3qsj30xg5m0=;
	b=hxqp/2e1j9vJlSRjJy4yXz6fT6ayB5xwV8H0An5bm/jCkWSO9CoGE+5QnaFC9o4IV4
	xBDVZOJ1biFhhYJMLJxgUDfg4zLZbmVVqyG4vQgAeSO/BBG2O+8Zs0b/lHKQA/jJAnkh
	rKIFMrStp1i7FErpgt68EZOQl7v8A40DLYUd4KBr1hwefaoc7ieJTmGfAYCb/6rrkwla
	PmzCIak4hKFCZcDZoVAaloV6LjhTjuvNbHvQxphiotnakOlj5qCA8Qg5LKyBlD9YAnvw
	mv32qVAL2eqEsJV/b39Z+lnc/h68LCohZFcfIZtxwMlImoRTP6dw80P6uk2HrB81R1as
	QUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tHf8dAfvDegvHYnSinKEZ+SBky8dZ5mm3qsj30xg5m0=;
	b=K6tviwUw52J6RDWBckURfCuY/ebcOPHbPf3NZmNA6YhtuftaeZ2YDZ9U+963UCaR3C
	s/9ltp6ne5ujobeaRVwW1fSI5QN+ivwbG56QbuKBcp58YW2hizKOzS72uKxM3aba53b8
	f9TB08/cxfvCwdpG/LOJkxYnnfBt3dJmtQdIArLHN79oZrrGAPcw9tDjQAawMxRzvQeB
	LT34BTbbndgHKM0mJpS1NVpt5FR2hlCnBJsH30INOXkjhtimTfg/4VbmB3u+QlbEd1Dm
	y/+dDSfCIYeOBKSYrIkdnecE+WstQ9Nldccma3XCgAnf78EGsab0Dyp16d4iRMTmH4lk
	rdeQ==
X-Gm-Message-State: AMke39ljSQzJC6j/Iej2vp9f6MfeIAXg9kxmiJ4je6Co9QMn0IsUAwBMnpEU43PIN+h4pTQSlyZaBZTUsa3Tvg==
X-Received: by 10.28.186.70 with SMTP id k67mr11552035wmf.65.1489090191971;
	Thu, 09 Mar 2017 12:09:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Thu, 9 Mar 2017 12:09:51 -0800 (PST)
In-Reply-To: <CA+chaQdhW4w9Uf5sgQPY8DaBMr4nT9qt4gUXkF5L-PZCc+wVFQ@mail.gmail.com>
References: <1488836862-18218-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sr2GWjjXYBJvx+eb3Fks-PxHvFgbYf6umXM9PV+rmv5Bw@mail.gmail.com>
	<CAJ86T=VgZMNyXwd6O9UR4wmF-8afc5HMKY2=c8QxeSajsxMa7A@mail.gmail.com>
	<CAMKF1sp+Q6VX4zUWkH_JrV1THWV5oYo+LmEivz7uUiOC0Q48pQ@mail.gmail.com>
	<CA+chaQdhW4w9Uf5sgQPY8DaBMr4nT9qt4gUXkF5L-PZCc+wVFQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 9 Mar 2017 12:09:51 -0800
Message-ID: <CAJ86T=WueHo4NqqsWMFay4wiwyrQfwNqpVRR88M44hVj0_8vmw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] conf/machine/include: enable hardfloat by default for ARMv6 and above
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
X-List-Received-Date: Thu, 09 Mar 2017 20:09:51 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 9, 2017 at 12:18 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Shouldn't we change default ARM_INSTRUCTION_SET while we're at it as well?

Yes, that's the longer term goal. It needs to be done a little
carefully though - ie in a way which doesn't ever enable Thumb by
default for cores which only support Thumb1.

> https://bugzilla.yoctoproject.org/show_bug.cgi?id=9213
>
> On Tue, Mar 7, 2017 at 12:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>> On Mon, Mar 6, 2017 at 2:51 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>>>
>>> On Mon, Mar 6, 2017 at 2:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> > On Mon, Mar 6, 2017 at 1:47 PM, Andre McCurdy <armccurdy@gmail.com>
>>> > wrote:
>>> >> Defaulting to softfp probably isn't the best choice anymore,
>>> >> especially as there are now ARM BSP layers which leave DEFAULTTUNE
>>> >> entirely up to the distro:
>>> >>
>>> >>
>>> >> https://lists.yoctoproject.org/pipermail/yocto/2017-February/034637.html
>>> >>
>>> >
>>> > I like this patch and want to clarify that it changes the default ISA
>>> > to thumb2
>>> > which we should use anyway due to size reasons and other distros use it
>>> > as
>>> > default too.
>>>
>>> No, it doesn't.
>>
>>
>> That's right I wanted to say to make that default while you are at it
>>
>>> The choice between ARM and Thumb(2) is made by the
>>> ARM_INSTRUCTION_SET variable. Adding 't' to DEFAULTTUNE simply means
>>> that the ARM_INSTRUCTION_SET variable will not be ignored (it's really
>>> a long standing bug that we ever defined DEFAULTTUNE options for ARMv6
>>> and above which ignore ARM_INSTRUCTION_SET, but that's a separate
>>> topic).
>>>
>>> > I am not sure of we should change it for armv6 though. since some armv6
>>> > has t1 and some has t2 so lets leave that as it is.
>>>
>>> I'm not aware of any ARMv6 cores which don't support Thumb2. Do you
>>> have a reference?
>>>
>>> (But again, to be clear, this commit doesn't change the default in
>>> terms of instruction set - all builds will still use ARM).
>>>
>>> >> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> >> ---
>>> >>  meta/conf/machine/include/arm/arch-armv6.inc   | 2 +-
>>> >>  meta/conf/machine/include/arm/arch-armv7a.inc  | 2 +-
>>> >>  meta/conf/machine/include/arm/arch-armv7ve.inc | 2 +-
>>> >>  meta/conf/machine/include/tune-arm1136jf-s.inc | 2 +-
>>> >>  meta/conf/machine/include/tune-cortexa15.inc   | 2 +-
>>> >>  meta/conf/machine/include/tune-cortexa17.inc   | 2 +-
>>> >>  meta/conf/machine/include/tune-cortexa5.inc    | 2 +-
>>> >>  meta/conf/machine/include/tune-cortexa7.inc    | 2 +-
>>> >>  meta/conf/machine/include/tune-cortexa8.inc    | 2 +-
>>> >>  meta/conf/machine/include/tune-cortexa9.inc    | 2 +-
>>> >>  10 files changed, 10 insertions(+), 10 deletions(-)
>>> >>
>>> >> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc
>>> >> b/meta/conf/machine/include/arm/arch-armv6.inc
>>> >> index 91f0f07..5e1f973 100644
>>> >> --- a/meta/conf/machine/include/arm/arch-armv6.inc
>>> >> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
>>> >> @@ -1,4 +1,4 @@
>>> >> -DEFAULTTUNE ?= "armv6"
>>> >> +DEFAULTTUNE ?= "armv6thf"
>>> >>
>>> >>  TUNEVALID[armv6] = "Enable instructions for ARMv6"
>>> >>  TUNECONFLICTS[armv6] = "armv4 armv5"
>>> >> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc
>>> >> b/meta/conf/machine/include/arm/arch-armv7a.inc
>>> >> index 5446048..bad1c27 100644
>>> >> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
>>> >> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
>>> >> @@ -1,4 +1,4 @@
>>> >> -DEFAULTTUNE ?= "armv7a"
>>> >> +DEFAULTTUNE ?= "armv7athf"
>>> >>
>>> >>  TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
>>> >>  TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
>>> >> diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc
>>> >> b/meta/conf/machine/include/arm/arch-armv7ve.inc
>>> >> index 42d8d04..4d9260f 100644
>>> >> --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
>>> >> +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
>>> >> @@ -1,4 +1,4 @@
>>> >> -DEFAULTTUNE ?= "armv7ve"
>>> >> +DEFAULTTUNE ?= "armv7vethf"
>>> >>
>>> >>  TUNEVALID[armv7ve] = "Enable instructions for ARMv7ve"
>>> >>  TUNECONFLICTS[armv7ve] = "armv4 armv5 armv6 armv7 armv7a"
>>> >> diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc
>>> >> b/meta/conf/machine/include/tune-arm1136jf-s.inc
>>> >> index 53994ef..2cadbee 100644
>>> >> --- a/meta/conf/machine/include/tune-arm1136jf-s.inc
>>> >> +++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
>>> >> @@ -1,4 +1,4 @@
>>> >> -DEFAULTTUNE ?= "armv6"
>>> >> +DEFAULTTUNE ?= "armv6thf"
>>> >>
>>> >>  require conf/machine/include/arm/arch-armv6.inc
>>> >>
>>> >> diff --git a/meta/conf/machine/include/tune-cortexa15.inc
>>> >> b/meta/conf/machine/include/tune-cortexa15.inc
>>> >> index 03de602..25e99f9 100644
>>> >> --- a/meta/conf/machine/include/tune-cortexa15.inc
>>> >> +++ b/meta/conf/machine/include/tune-cortexa15.inc
>>> >> @@ -1,4 +1,4 @@
>>> >> -DEFAULTTUNE ?= "armv7ve-neon"
>>> >> +DEFAULTTUNE ?= "armv7vethf-neon"
>>> >>
>>> >>  require conf/machine/include/arm/arch-armv7ve.inc
>>> >>
>>> >> diff --git a/meta/conf/machine/include/tune-cortexa17.inc
>>> >> b/meta/conf/machine/include/tune-cortexa17.inc
>>> >> index f659a62..40392f9 100644
>>> >> --- a/meta/conf/machine/include/tune-cortexa17.inc
>>> >> +++ b/meta/conf/machine/include/tune-cortexa17.inc
>>> >> @@ -1,4 +1,4 @@
>>> >> -DEFAULTTUNE ?= "armv7ve-neon"
>>> >> +DEFAULTTUNE ?= "armv7vethf-neon"
>>> >>
>>> >>  require conf/machine/include/arm/arch-armv7ve.inc
>>> >>
>>> >> diff --git a/meta/conf/machine/include/tune-cortexa5.inc
>>> >> b/meta/conf/machine/include/tune-cortexa5.inc
>>> >> index 93f9ca4..1f0cda6 100644
>>> >> --- a/meta/conf/machine/include/tune-cortexa5.inc
>>> >> +++ b/meta/conf/machine/include/tune-cortexa5.inc
>>> >> @@ -1,4 +1,4 @@
>>> >> -DEFAULTTUNE ?= "armv7a-neon"
>>> >> +DEFAULTTUNE ?= "armv7athf-neon"
>>> >>
>>> >>  require conf/machine/include/arm/arch-armv7a.inc
>>> >>
>>> >> diff --git a/meta/conf/machine/include/tune-cortexa7.inc
>>> >> b/meta/conf/machine/include/tune-cortexa7.inc
>>> >> index 52e06b8..52415d9 100644
>>> >> --- a/meta/conf/machine/include/tune-cortexa7.inc
>>> >> +++ b/meta/conf/machine/include/tune-cortexa7.inc
>>> >> @@ -1,4 +1,4 @@
>>> >> -DEFAULTTUNE ?= "armv7ve-neon"
>>> >> +DEFAULTTUNE ?= "armv7vethf-neon"
>>> >>
>>> >>  require conf/machine/include/arm/arch-armv7ve.inc
>>> >>
>>> >> diff --git a/meta/conf/machine/include/tune-cortexa8.inc
>>> >> b/meta/conf/machine/include/tune-cortexa8.inc
>>> >> index a831bd5..8ee8de9 100644
>>> >> --- a/meta/conf/machine/include/tune-cortexa8.inc
>>> >> +++ b/meta/conf/machine/include/tune-cortexa8.inc
>>> >> @@ -1,4 +1,4 @@
>>> >> -DEFAULTTUNE ?= "armv7a-neon"
>>> >> +DEFAULTTUNE ?= "armv7athf-neon"
>>> >>
>>> >>  require conf/machine/include/arm/arch-armv7a.inc
>>> >>
>>> >> diff --git a/meta/conf/machine/include/tune-cortexa9.inc
>>> >> b/meta/conf/machine/include/tune-cortexa9.inc
>>> >> index 8b84e60..0cf323c 100644
>>> >> --- a/meta/conf/machine/include/tune-cortexa9.inc
>>> >> +++ b/meta/conf/machine/include/tune-cortexa9.inc
>>> >> @@ -1,4 +1,4 @@
>>> >> -DEFAULTTUNE ?= "armv7a-neon"
>>> >> +DEFAULTTUNE ?= "armv7athf-neon"
>>> >>
>>> >>  require conf/machine/include/arm/arch-armv7a.inc
>>> >>
>>> >> --
>>> >> 1.9.1
>>> >>
>>> >> --
>>> >> _______________________________________________
>>> >> Openembedded-core mailing list
>>> >> Openembedded-core@lists.openembedded.org
>>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

