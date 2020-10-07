Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.2719.1602108914393420803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 15:15:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rBjYkBaH;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id w21so2282687pfc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 15:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/uM0v/WREHmDQl9xxTVV2z00ZvenknKf1OFPDnoSSdY=;
        b=rBjYkBaHpXMbDrdIOEqnDN4Xkq0z/+4xLShjihkP8TY11Co65NvV7M56+DOtsQxT8h
         cGzqv/Cda/jFIN0TpBpkOpJu0nZYgT6yhCAwXYUl9ZJn6N6q/n8//20reqDgtB3vYJSO
         bCQsmxfsCrJIn4X3y6o7rAbWvVwXAPk2lULOg6+bt/Yv0ShgCjNn6/STYihl1XqQ7fPw
         2ktHfMJgE/Tm/2POe0QlCxrcOcjz39fbNa2xsBLTuEhmCzJ9F/VhwcBoXIzTYPkL50QO
         wDhpw6E3Iz/yD8kc4oQ/r8wIHre2EzKg633yTbdHkVqc/MTJn+DoK1mg7Sv+vomUgV9Y
         7dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/uM0v/WREHmDQl9xxTVV2z00ZvenknKf1OFPDnoSSdY=;
        b=AWNIVtbCojHQdaFWxRbP7uYNufoJNytFrBRxNCBkeDF8tlCOan2xsU2QFdN9LGi50P
         mOD2Wa0CKsu5QcR+24F0wGCBynqnV2cVugHzMynUic509Tec4mEOBmAF2ditX14Dv9XD
         lcqg04mIVLUuVqtFd+QhnfYH0ZvAISEKvpUMNAVjlO1QAD2qtd1AG3G6IId0IBBgtwz2
         9ckMChbR9fjq2qtlgYo7yobqXzr2HqpSYMlsnjlemYb6IspQ/NOA9OHK//LxeIk8s5gc
         /PLvKiAPvRMFCn6/hpVJ7W3R1VIZYMo/yY44XSKSLpH7f+kgbccj4+IfYUsy373eu777
         l05A==
X-Gm-Message-State: AOAM531K0iUIshGdqY2wfyA0Zobq7/dub01i2DiYDFfojEoTdfcU2WEO
	Tpdn1QwrFqu4+5CmINLgtA0=
X-Google-Smtp-Source: ABdhPJwbt738yeAAqzCllsna4TG8MWSHwFfYyHQ8N8O7VeAucxZ/qPb+gf4lkq9P2BP2mudAeDuwiQ==
X-Received: by 2002:a63:f60f:: with SMTP id m15mr4581205pgh.298.1602108913820;
        Wed, 07 Oct 2020 15:15:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:f80d:4abb:99ae:980? ([2601:646:9200:4e0:f80d:4abb:99ae:980])
        by smtp.gmail.com with ESMTPSA id e27sm4253642pfj.62.2020.10.07.15.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 15:15:13 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type
To: Paul Barker <pbarker@konsulko.com>, kamensky@cisco.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20201007203838.19096-1-kamensky@cisco.com>
 <20201007203838.19096-2-kamensky@cisco.com>
 <CAM9ZRVst-JLA3aOa+U2Sd1Cqj8ARsAyVhCu0Yhhk5we+FKsmdQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b4f13cc3-8698-9186-3d99-2f7017ab9756@gmail.com>
Date: Wed, 7 Oct 2020 15:15:12 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVst-JLA3aOa+U2Sd1Cqj8ARsAyVhCu0Yhhk5we+FKsmdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 10/7/20 1:46 PM, Paul Barker wrote:
> On Wed, 7 Oct 2020 at 21:39, Victor Kamensky via
> lists.openembedded.org <kamensky=cisco.com@lists.openembedded.org>
> wrote:
>>
>> In Yocto Project PR 13992 it was reported that qemumips
>> in autobuilder runs almost twice slower then qemumips64 and
>> some times hit time out.
>>
>> Upon investigations of qemu-system with perf, gdb, and
>> SystemTap and comparing qemumips and qemumips64 machines
>> behavior it was noticed that qemu soft mmu code behaves
>> quite different and in case if qemumips tlbwr instruction
>> called 16 times more oftern. It happens that in qemumips64
>> case qemu runs with cpu type that contains 64 TLB, but in case
>> of qemumips qemu runs with cpu type that contains only
>> 16 TLBs.
>>
>> The idea of proposed qemu patch is to introduce fictitious
>> 34Kf-64tlb cpu type that defined exactly as 34Kf but has
>> 64 TLBs, instead of original 16 TLBs.
>>
>> Testing of core-image-full-cmdline:do_testimage with
>> 34Kf-64tlb shows 40% or so test execution real time
>> improvement.
>>
>> Note for future porters of the patch: easiest way to update
>> the patch and be in sync with 34Kf definition is to copy
>> 34Kf machine definition and apply the following changes to
>> it (just change 15 to 63 of CP0C1_MMU bits value)
>>
>> [kamensky@coreos-lnx2 qemu]$ diff ~/34Kf.c ~/34Kf-64tlb.c
>> 2c2
>> <         .name = "34Kf",
>>>          .name = "34Kf-64tlb",
>> 6c6
>> <         .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 << CP0C1_MMU) |
>>>          .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_MMU) |
>>
>> Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
> 
> Forgive my ignorance as to the range of MIPS processors available but
> does any real MIPS CPU have 64 TLBs? If such a CPU model exists
> shouldn't we be using this instead of inventing a new model?
> 
> I'm a bit worried that targeting a unique, fictitious CPU model will
> lead to us wasting time debugging obscure failures that other projects
> have never seen and that would never occur on real hardware.
> 

there are many assumptions in various qemu machine emulations, this wont 
be the only one, so I am less worried about that.
