Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7ABFF7541F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 05:58:20 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id a7-v6so2873747plp.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 22:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QU5l5EebRe3rIxMlOlicnFiHRxSiI4VKmvnTjgeXAeU=;
	b=nKfc48b3BqKDJNcPkTPwy4BGZdptBFb0++/xxaVOHshia/F3SqIx2gMzvvlgMNYeZr
	+FnwDgJCsUlvx0sq0Miux50rXZKSqdb96hf5CyO/RWQqircr/u9T/VbBAIRxvZ24atU7
	WkEcFZk6Iqkx8x7R7ZCZ8XY4Y0a1p6OUSwbasUhZ8kdDgRZOy3m0bSglG9JzZhwDRv33
	miuT1MiiHOajll43xcrgDX+JtW4OBHccgu6FoEEwQi1dL5etIbdh4PYniux7eojsxZRW
	/xWxdGnAK35/lMixM3ed99n9X2l/7opbo2GAIJ4hJ5p0lpKMz+BPUbiqTTpTgijpdMU0
	7e3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=QU5l5EebRe3rIxMlOlicnFiHRxSiI4VKmvnTjgeXAeU=;
	b=DtTXexo5zB+Ur+ZOV80gwAnveqpl4rpRVp07uU1GywG9GXKoYwkf28taTiQe4tnXbd
	YozWpsIvLHKrrugA6g+7ePZGy23FYbCPiCqVBLOdgn+o046YaIaW2fTv1LQRmIA99jib
	HJwty+uy8ntTAi6V75qEzvYkdTm32gE8KSVWO/b3A2cxvIeWGCKkjbIhz+Z4VxYLC9+Z
	HlY73hGJ2iQ0rbwiMJnsH7qXgPH+n3r1YfdqVqaTasfDVjUWYvk0hN98hY060dKPoVcU
	AjypJHa42Tp64BWwglwBMKyTy0aHJZgcBHcxiRSqGfczo9js8veUs5Zuahn2cljgOd0E
	lq6A==
X-Gm-Message-State: APt69E2UeSsQGCkJG+iI+SrZM4/o5lY9fcycst6bQL3cGbKmBXndR9aG
	u9MM0U6j/lrNLPecdeEHEWaA8mCr
X-Google-Smtp-Source: ADUXVKKtIXHjed89MrjbX7UYHiXoW7wjTZOJ2Tgf7QMdJdp4jQ5PTfiHUB4RqMIrlDV3+J2UA4jgKg==
X-Received: by 2002:a17:902:bb81:: with SMTP id
	m1-v6mr574520pls.117.1528351100992; 
	Wed, 06 Jun 2018 22:58:20 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:da1:5310:5059:8f85])
	by smtp.gmail.com with ESMTPSA id
	u18-v6sm13820256pfm.152.2018.06.06.22.58.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 22:58:20 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
	<635c8757bf852c8a4248009f241c19146431cacd.1528320772.git.raj.khem@gmail.com>
	<CAJ86T=U5WPudMu_VBL_Y00DQrOjRb91=x+6+21V0ZQKhCQ7ThA@mail.gmail.com>
	<CAMKF1so4AMMhXS4VRNV2CPjvPRbzkPWEW3f=iTNio2jNC1Fgxw@mail.gmail.com>
	<CAJ86T=VCqqt_7OXT__NLtH_uayoSX_rFS=vXEyOZY3BQz3+FKQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5c57a121-c4cd-e548-cd26-182076deb917@gmail.com>
Date: Wed, 6 Jun 2018 22:58:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VCqqt_7OXT__NLtH_uayoSX_rFS=vXEyOZY3BQz3+FKQ@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] tune/arm: Set -mtune instead of -mcpu
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
X-List-Received-Date: Thu, 07 Jun 2018 05:58:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/6/18 4:42 PM, Andre McCurdy wrote:
> On Wed, Jun 6, 2018 at 3:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Jun 6, 2018 at 3:15 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Wed, Jun 6, 2018 at 2:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> -march option is already used to select the base architecture
>>>> therefore using -mcpu which infact will reset march+mtune can
>>>> cause conflicts,
>>>
>>> I think we need to at least understand how and why these conflicts
>>> have started to occur with gcc 8. The tuning files themselves don't
>>> contain any conflicts so the conflict must be coming from somewhere
>>> else. Do we know where?
>>
>> I explained it in previous emails as well, mcpu is a combination of march+mtune
>> how it reduces to these values depends on mcpu value. e.g. setting
>> mcpu=cortex-a7
>> would mean setting march=armv7ve and mtune to cortex-a7 internally
>> along with using code generator to use instructions available for that
>> cpu, thats why it errors out since it does not know which march to
>> use.
>> when we override one of these values on cmdline which we do then this can cause
>> the errors, these errors were happening before too see valgrind patch
>> its that gcc8 is catching more cases.
> 
> The -mcpu, -march and -mtune options are not new and gcc 6 and 7 catch
> the same conflicts. It doesn't make sense that gcc8 is just catching
> more issues.

It does make sense. the option parsing for these specific options on arm 
have been revamped after gcc7, see

https://github.com/kraj/gcc/compare/a99ae290af49793cd3db7a74f3dbc59e64d356a1...68b54adbd7b10c66d968d74b96fba552bd46ebb7

> 
> The valgrind case is not a good example. The conflict there comes
> because we leak CFLAGS intended for the target into Makefiles which
> valgrind uses to build test apps which are intended to only run under
> valgrind (ie NOT directly on the target). The real fix there would be
> to prevent the target specific flags being passed to build for those
> few valgrind test apps.
> 

it is manifesting similar conflicts

>> example is gcc-runtime/libstdc++ which deducts arch flags based on
>> configure options
>> and we do not pass narrow mcpu option to it since we build SDKs which
>> do not target
>> just one particular sub-family of cpu but rather a sub arch
>> do not pass --with-cpu then it enforces some lowest common
>> denominator. When we say -mcpu then we
>> are actually asking the code to be generated for that particular CPU.
> 
> If we are trying to build something which is reusable across multiple
> machines with the same architecture then it's a bug to be passing
> machine specific CFLAGS. Making the machine specific CFLAGS more
> generic is not the right solution.

being reusable is a side-effect and a good one. Real problem is we are 
not matching to what we say in package arches, Probably you are 
confusing tunes to be meant for static code generation for a given CPU. 
I am interested to hear more ideas to what would be right solution if 
this is not it.

> 
> Anyway, I suspect the real issue here is that when we build gcc to run
> on the target we currently configure using "--with-arch=armv7-a" for
> both armv7a and armv7ve. It was done that way deliberately to try to
> avoid rebuilds when switching between armv7a and armv7ve machines,
> although thinking about that now I'm not sure it makes so much sense.
> Does your original problem go away if you simply change:
> 
>    EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
> 
> to
> 
>    EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve"
> 
> in gcc-target.inc ?

No, this is not the problem I am talking about gcc-runtime which is 
configured during cross build but built for target later on.

talking about this case, changing --with-arch will make on device gcc 
complain about mismatches with default runtime since it is meant to use 
same runtime that will be built above.  Using armv7-a here is a 
conscious choice.

> 
>>>
>>> This patch is potentially going to hide bugs in cases where components
>>> try to provide their own CPU specific flags rather than fully
>>> respecting the flags set by OE. Generally we want to make those cases
>>> fail so that we can debug and fix them.
>>>
>>
>> No it wont. they can still do that. Last option wins so nothing changes there.
> 
> The thing that changes is that after your patch, gcc will no longer
> report a conflict!
> 
>> and in many cases it should be able to override specific flags for
>> specific packages
>> OE is a fall back for general default case.
>>
>> A good change this does is that code is targeted for bigger base arch
>> e.g. armv7-a
>> and not for cortex-a8 but its tuned to run better on cortex-a8 when we
>> use -mtune
>> it will still run on other armv7-a based CPUs, so right now when we
>> say our package
>> arch is arm7ve but then use -mcpu=cortex-a7 we are actually doing wrong thing
>> this should have meant package arch to be cortex-a7 as well. Now this
>> will be more
>> inline as well.
>>
>>
>>>> therefore setting just mtune here will ensure
>>>> that the code is optimized for the given tune as is the intention
>>>> of mcpu, however with one advantage, it will be targetting broader
>>>> march value so can be useful for pre-compiled objects where they
>>>> can be run on wider subset
>>>>
>>>> This also fixed occasional conflicts like
>>>>
>>>> cc1: error: switch -mcpu=cortex-a7 conflicts with -march=armv7-a switch [-Werror]
>>>>
>>>> which is possible combination in some case for packages in OE
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>   meta/conf/machine/include/tune-arm1136jf-s.inc   | 2 +-
>>>>   meta/conf/machine/include/tune-arm920t.inc       | 2 +-
>>>>   meta/conf/machine/include/tune-arm926ejs.inc     | 2 +-
>>>>   meta/conf/machine/include/tune-arm9tdmi.inc      | 2 +-
>>>>   meta/conf/machine/include/tune-cortexa15.inc     | 2 +-
>>>>   meta/conf/machine/include/tune-cortexa17.inc     | 2 +-
>>>>   meta/conf/machine/include/tune-cortexa5.inc      | 2 +-
>>>>   meta/conf/machine/include/tune-cortexa7.inc      | 2 +-
>>>>   meta/conf/machine/include/tune-cortexa8.inc      | 2 +-
>>>>   meta/conf/machine/include/tune-cortexa9.inc      | 2 +-
>>>>   meta/conf/machine/include/tune-ep9312.inc        | 2 +-
>>>>   meta/conf/machine/include/tune-iwmmxt.inc        | 2 +-
>>>>   meta/conf/machine/include/tune-strongarm1100.inc | 2 +-
>>>>   meta/conf/machine/include/tune-thunderx.inc      | 2 +-
>>>>   meta/conf/machine/include/tune-xscale.inc        | 2 +-
>>>>   15 files changed, 15 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/tune-arm1136jf-s.inc
>>>> index c5de63e1cc..02114284e0 100644
>>>> --- a/meta/conf/machine/include/tune-arm1136jf-s.inc
>>>> +++ b/meta/conf/machine/include/tune-arm1136jf-s.inc
>>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv6hf"
>>>>   require conf/machine/include/arm/arch-armv6.inc
>>>>
>>>>   TUNEVALID[arm1136jfs] = "Enable arm1136jfs specific processor optimizations"
>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', ' -mcpu=arm1136jf-s', '', d)}"
>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm1136jfs', ' -mtune=arm1136jf-s', '', d)}"
>>>>
>>>>   AVAILTUNES += "arm1136jfs"
>>>>   ARMPKGARCH_tune-arm1136jfs = "arm1136jfs"
>>>> diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/tune-arm920t.inc
>>>> index c6e74b6772..5e6d4cbd91 100644
>>>> --- a/meta/conf/machine/include/tune-arm920t.inc
>>>> +++ b/meta/conf/machine/include/tune-arm920t.inc
>>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4t"
>>>>   require conf/machine/include/arm/arch-armv4.inc
>>>>
>>>>   TUNEVALID[arm920t] = "Enable arm920t specific processor optimizations"
>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', ' -mcpu=arm920t', '', d)}"
>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm920t', ' -mtune=arm920t', '', d)}"
>>>>
>>>>   AVAILTUNES += "arm920t"
>>>>   ARMPKGARCH_tune-arm920t = "arm920t"
>>>> diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/tune-arm926ejs.inc
>>>> index 81bcda339b..dddccaaae9 100644
>>>> --- a/meta/conf/machine/include/tune-arm926ejs.inc
>>>> +++ b/meta/conf/machine/include/tune-arm926ejs.inc
>>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5te"
>>>>   require conf/machine/include/arm/arch-armv5-dsp.inc
>>>>
>>>>   TUNEVALID[arm926ejs] = "Enable arm926ejs specific processor optimizations"
>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', ' -mcpu=arm926ej-s', '', d)}"
>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm926ejs', ' -mtune=arm926ej-s', '', d)}"
>>>>
>>>>   AVAILTUNES += "arm926ejs"
>>>>   ARMPKGARCH_tune-arm926ejs = "arm926ejs"
>>>> diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/tune-arm9tdmi.inc
>>>> index e9c2b8fcf5..ebac472c5b 100644
>>>> --- a/meta/conf/machine/include/tune-arm9tdmi.inc
>>>> +++ b/meta/conf/machine/include/tune-arm9tdmi.inc
>>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4t"
>>>>   require conf/machine/include/arm/arch-armv4.inc
>>>>
>>>>   TUNEVALID[arm9tdmi] = "Enable arm9tdmi specific processor optimizations"
>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', ' -mcpu=arm9tdmi', '', d)}"
>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'arm9tdmi', ' -mtune=arm9tdmi', '', d)}"
>>>>
>>>>   AVAILTUNES += "arm9tdmi"
>>>>   ARMPKGARCH_tune-arm9tdmi = "arm9tdmi"
>>>> diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/tune-cortexa15.inc
>>>> index 25e99f93d7..0636306e2f 100644
>>>> --- a/meta/conf/machine/include/tune-cortexa15.inc
>>>> +++ b/meta/conf/machine/include/tune-cortexa15.inc
>>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7vethf-neon"
>>>>   require conf/machine/include/arm/arch-armv7ve.inc
>>>>
>>>>   TUNEVALID[cortexa15] = "Enable Cortex-A15 specific processor optimizations"
>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mcpu=cortex-a15', '', d)}"
>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa15', ' -mtune=cortex-a15', '', d)}"
>>>>
>>>>   # Little Endian base configs
>>>>   AVAILTUNES += "cortexa15 cortexa15t cortexa15-neon cortexa15t-neon cortexa15-neon-vfpv4 cortexa15t-neon-vfpv4"
>>>> diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/tune-cortexa17.inc
>>>> index 40392f9bcc..f9774b8b8e 100644
>>>> --- a/meta/conf/machine/include/tune-cortexa17.inc
>>>> +++ b/meta/conf/machine/include/tune-cortexa17.inc
>>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7vethf-neon"
>>>>   require conf/machine/include/arm/arch-armv7ve.inc
>>>>
>>>>   TUNEVALID[cortexa17] = "Enable Cortex-A17 specific processor optimizations"
>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mcpu=cortex-a17', '', d)}"
>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa17', ' -mtune=cortex-a17', '', d)}"
>>>>
>>>>   # Little Endian base configs
>>>>   AVAILTUNES += "cortexa17 cortexa17t cortexa17-neon cortexa17t-neon cortexa17-neon-vfpv4 cortexa17t-neon-vfpv4"
>>>> diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/tune-cortexa5.inc
>>>> index 1f0cda6640..1ececf9621 100644
>>>> --- a/meta/conf/machine/include/tune-cortexa5.inc
>>>> +++ b/meta/conf/machine/include/tune-cortexa5.inc
>>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7athf-neon"
>>>>   require conf/machine/include/arm/arch-armv7a.inc
>>>>
>>>>   TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mcpu=cortex-a5', '', d)}"
>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa5', ' -mtune=cortex-a5', '', d)}"
>>>>
>>>>   # Little Endian base configs
>>>>   AVAILTUNES += "cortexa5 cortexa5t cortexa5-neon cortexa5t-neon"
>>>> diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/tune-cortexa7.inc
>>>> index 52415d9c8b..08dd039338 100644
>>>> --- a/meta/conf/machine/include/tune-cortexa7.inc
>>>> +++ b/meta/conf/machine/include/tune-cortexa7.inc
>>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7vethf-neon"
>>>>   require conf/machine/include/arm/arch-armv7ve.inc
>>>>
>>>>   TUNEVALID[cortexa7] = "Enable Cortex-A7 specific processor optimizations"
>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mcpu=cortex-a7', '', d)}"
>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa7', ' -mtune=cortex-a7', '', d)}"
>>>>
>>>>   # Little Endian base configs
>>>>   AVAILTUNES += "cortexa7 cortexa7t cortexa7-neon cortexa7t-neon cortexa7-neon-vfpv4 cortexa7t-neon-vfpv4"
>>>> diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
>>>> index 8ee8de97f1..cdcb1c7d59 100644
>>>> --- a/meta/conf/machine/include/tune-cortexa8.inc
>>>> +++ b/meta/conf/machine/include/tune-cortexa8.inc
>>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7athf-neon"
>>>>   require conf/machine/include/arm/arch-armv7a.inc
>>>>
>>>>   TUNEVALID[cortexa8] = "Enable Cortex-A8 specific processor optimizations"
>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mcpu=cortex-a8', '', d)}"
>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa8', ' -mtune=cortex-a8', '', d)}"
>>>>
>>>>   # Little Endian base configs
>>>>   AVAILTUNES += "cortexa8 cortexa8t cortexa8-neon cortexa8t-neon"
>>>> diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/tune-cortexa9.inc
>>>> index 0cf323c960..620178d18a 100644
>>>> --- a/meta/conf/machine/include/tune-cortexa9.inc
>>>> +++ b/meta/conf/machine/include/tune-cortexa9.inc
>>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7athf-neon"
>>>>   require conf/machine/include/arm/arch-armv7a.inc
>>>>
>>>>   TUNEVALID[cortexa9] = "Enable Cortex-A9 specific processor optimizations"
>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mcpu=cortex-a9', '', d)}"
>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', ' -mtune=cortex-a9', '', d)}"
>>>>
>>>>   # Little Endian base configs
>>>>   AVAILTUNES += "cortexa9 cortexa9t cortexa9-neon cortexa9t-neon"
>>>> diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/tune-ep9312.inc
>>>> index 84ca528d6d..897b904cd1 100644
>>>> --- a/meta/conf/machine/include/tune-ep9312.inc
>>>> +++ b/meta/conf/machine/include/tune-ep9312.inc
>>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "ep9312"
>>>>   require conf/machine/include/arm/arch-armv4.inc
>>>>
>>>>   TUNEVALID[ep9312] = "Enable Intel PXA27x specific processor optimizations"
>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -march=ep9312 -mcpu=ep9312', '', d)}"
>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ep9312', ' -march=ep9312 -mtune=ep9312', '', d)}"
>>>>
>>>>   AVAILTUNES += "ep9312"
>>>>   ARMPKGARCH_tune-ep9312 = "ep9312"
>>>> diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/tune-iwmmxt.inc
>>>> index f27423cb2e..15cce8d3c5 100644
>>>> --- a/meta/conf/machine/include/tune-iwmmxt.inc
>>>> +++ b/meta/conf/machine/include/tune-iwmmxt.inc
>>>> @@ -6,7 +6,7 @@ DEFAULTTUNE ?= "iwmmxt"
>>>>   require conf/machine/include/arm/arch-armv5-dsp.inc
>>>>
>>>>   TUNEVALID[iwmmxt] = "Enable Intel PXA27x specific processor optimizations"
>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -march=iwmmxt -mcpu=iwmmxt', '', d)}"
>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'iwmmxt', ' -march=iwmmxt -mtune=iwmmxt', '', d)}"
>>>>
>>>>   AVAILTUNES += "iwmmxt"
>>>>   ARMPKGARCH_tune-iwmmxt = "iwmmxt"
>>>> diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/tune-strongarm1100.inc
>>>> index 80cfb8ab8a..7b2fa8e3ab 100644
>>>> --- a/meta/conf/machine/include/tune-strongarm1100.inc
>>>> +++ b/meta/conf/machine/include/tune-strongarm1100.inc
>>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv4"
>>>>   require conf/machine/include/arm/arch-armv4.inc
>>>>
>>>>   TUNEVALID[strongarm] = "Enable Strongarm 1100 series processor optimizations"
>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', ' -mcpu=strongarm1100', '', d)}"
>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'strongarm', ' -mtune=strongarm1100', '', d)}"
>>>>
>>>>   AVAILTUNES += "strongarm"
>>>>   ARMPKGARCH_tune-strongarm = "strongarm"
>>>> diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machine/include/tune-thunderx.inc
>>>> index 3d43b0f7e5..e77d1cdd2d 100644
>>>> --- a/meta/conf/machine/include/tune-thunderx.inc
>>>> +++ b/meta/conf/machine/include/tune-thunderx.inc
>>>> @@ -5,7 +5,7 @@ AVAILTUNES += "thunderx thunderx_be"
>>>>
>>>>   TUNEVALID[thunderx] = "Enable instructions for Cavium ThunderX"
>>>>
>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mcpu=thunderx ', '',d)}"
>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thunderx', ' -mtune=thunderx ', '',d)}"
>>>>
>>>>   ARMPKGARCH_tune-thunderx ?= "thunderx"
>>>>   ARMPKGARCH_tune-thunderx_be ?= "thunderx_be"
>>>> diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/tune-xscale.inc
>>>> index 0d07333955..2a0610fddf 100644
>>>> --- a/meta/conf/machine/include/tune-xscale.inc
>>>> +++ b/meta/conf/machine/include/tune-xscale.inc
>>>> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5te"
>>>>   require conf/machine/include/arm/arch-armv5-dsp.inc
>>>>
>>>>   TUNEVALID[xscale] = "Enable PXA255/PXA26x Xscale specific processor optimizations"
>>>> -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'xscale', ' -mcpu=xscale', '', d)}"
>>>> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'xscale', ' -mtune=xscale', '', d)}"
>>>>
>>>>   AVAILTUNES += "xscale"
>>>>   ARMPKGARCH_tune-xscale = "xscale"
>>>> --
>>>> 2.17.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

