Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web12.2603.1602108673117427038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 15:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GZLoT3h3;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id e10so2299538pfj.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 15:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GopH4ZUeO1ZFM3+FiUGPEOdtNGmVw+j2jEYkQ6QcXvY=;
        b=GZLoT3h3Pmva6rMer9ntSLwGRV3vgNJM6tWfCqab4AlVPX6RapGrF8JYJtW+RiR7qy
         Q6w52RNYifDon0TK6NxB3wZFR2KIibT2X8a3d10KJsZO4D9iNSsIFV4/2veOZJDEbImz
         5Iz5K6ylykoEqXUCHEUzWdJVJ7q5TyOSJHM6SSCpUbGZn15sK8XQgKA5usbAliqbebDA
         9Jr1BSXpFe6Lz+5uYj64gDay+hNphdSNnEHV0FeRLHPdjB0qfsBqH+sAv2k7ZxOZiDWk
         GrYW8SbSbqVLD93lodDzwsVm99yInNhV8yfMoU/M11m+WyzJtWtOpEw9v5+0PeNnL02c
         Vdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=GopH4ZUeO1ZFM3+FiUGPEOdtNGmVw+j2jEYkQ6QcXvY=;
        b=cNuhBxTtHD/Djjmzq2T8vnzIEZiZ1Ti02VAxVy6bN2K0BTiqpvvMBQHELWp+RPeSQp
         o4issIS2BYZ/bTrz1pwECSeRTKsxeLhNsx7s1ea1Vx3KUsS39JwJFw5vICnJkMr4aq0s
         B/tWrmWWPKIpIAXkkuoUnevX4/qLu81JlVjX+Q7JOkDRog4jwTXpCgk3y71R/icHKrR8
         8d0+ZHVoxlzjZp+PtGZHxl6pctQw5a5cz+A95ZGwsa15pHmq8yDKPbUvOsaPzQl1Bqzk
         Q1ixd5VDe8VDGekT0jN5ENHDEkUPWuwCHPh2pSEfWjAc3vnmswq+C1NKrSAMALE2AlCC
         /Jpw==
X-Gm-Message-State: AOAM530FpbQOPdbAww4Mf3blg5rNrHBbGykJ5Dln37tHKginwArHrWuU
	MvTXYui17qqT4s5CvYnovUw=
X-Google-Smtp-Source: ABdhPJxalTJCtmcWqkI8dHcknM5qlBAgfmdS7+rtM9lstCNVKwXjL8AGz2nCHM2qbnO0mCAL2CdbWA==
X-Received: by 2002:a63:2406:: with SMTP id k6mr4770325pgk.366.1602108672574;
        Wed, 07 Oct 2020 15:11:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:f80d:4abb:99ae:980? ([2601:646:9200:4e0:f80d:4abb:99ae:980])
        by smtp.gmail.com with ESMTPSA id j25sm4237155pfn.212.2020.10.07.15.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 15:11:12 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type
To: "Victor Kamensky (kamensky)" <kamensky@cisco.com>,
 Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20201007203838.19096-1-kamensky@cisco.com>
 <20201007203838.19096-2-kamensky@cisco.com>
 <CAM9ZRVst-JLA3aOa+U2Sd1Cqj8ARsAyVhCu0Yhhk5we+FKsmdQ@mail.gmail.com>
 <BYAPR11MB3047DE4238846255A324C998CD0A0@BYAPR11MB3047.namprd11.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <30012c4c-117f-3f93-6e0b-a5cea274b949@gmail.com>
Date: Wed, 7 Oct 2020 15:11:11 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <BYAPR11MB3047DE4238846255A324C998CD0A0@BYAPR11MB3047.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 10/7/20 2:52 PM, Victor Kamensky (kamensky) wrote:
> Hi Paul,
> 
> Please forgive my horrible email agent that I have at work.
> Please look for 'kamensky>' for responses inline.
> 
> ________________________________________
> From: Paul Barker <pbarker@konsulko.com>
> Sent: Wednesday, October 7, 2020 1:46 PM
> To: Victor Kamensky (kamensky)
> Cc: openembedded-core; Richard Purdie; Khem Raj
> Subject: Re: [OE-core] [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type
> 
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
> does any real MIPS CPU have 64 TLBs?
> 
> kamensky> I am not up to date wrt 32 bit only MIPS CPUs out there.
> kamensky> I've experience with MIPS64 real CPUs that could
> kamensky> operate both in 64 bit and 32 bit mode. In fact in our
> kamensky> case even in time when we used 32bit user-land kernel
> kamensky> itself was running 64 bit kernel (as OE MIPS multi-lib test
> kamensky> case). In 32bit case h/w memory map quite unfriendly
> kamensky> to linux kernel, kernel can see directly only 512Mb of
> kamensky> unmapped phy memory KSEG0/KSEG1, and bigger amount would
> kamensky> require CONFIG_HIGHMEM that drag additional mappings
> kamensky> for kernel access of the memory.
> 
> kamensky> MIPS32 spec itself does allow 64 TLBs, for sure.
> 
> If such a CPU model exists
> shouldn't we be using this instead of inventing a new model?
> 
> kamensky> Note about other available MIPS 32bit existing CPU
> kamensky> model with bigger number of TLBs below.
> 
> I'm a bit worried that targeting a unique, fictitious CPU model will
> lead to us wasting time debugging obscure failures that other projects
> have never seen and that would never occur on real hardware.
> 
> kamensky> I do share your concern up to some extent. But I think
> kamensky> the risk is minimal.
> 
> kamensky> Please note in qemumips64 machine case we already
> kamensky> use fictitious CPU type as "MIPS64R2-generic". AFAIK
> kamensky> there is no such real CPU out there, it is generic thing
> kamensky> inside of qemu. For sure, there is
> kamensky> no such real combination as "MIPS64R2-generic" cpu type
> kamensky> and machine "malta". So up to some extent a lot things
> kamensky> under qemu are fictitious.
> 
> kamensky> I've looked at other MIPS only CPUs that qemu supports.
> kamensky> There is definition of "mips32r6-generic". Another fictitious
> kamensky> CPU type but defined in qemu already. That one configured
> kamensky> with 32 TLBs, but when I've tried it with qemumips it flat out
> kamensky> did not boot. Which brings us to other practical issue: proper
> kamensky> match between qemu cpu type and our qemumips kernel
> kamensky> configuration, question about qemu CPU emulation correctness
> kamensky> and whether it is bug free, etc, etc ..

mips32r6 is ABI incompatible with prior mips32 implementations, we do 
have include/tune-mips32r6.inc with r6 tunes, so in order to use 
mips32r6 based CPU emulation we have to use proper defaultttune 
something like mipsisa32r6

having said that, we might run into other issues with the new machine 
type and moreover I am not sure how common it is. where as mips1 and 
mips32 are quite common when it comes to 32bit, therefore this patch is 
perhaps better.

> 
> kamensky> By modifying 34Kf cpu type that worked for us before, and doing
> kamensky> minimal low risk changes in one limited small aspect of the
> kamensky> system, that brings us performance gains, IMO is worth doing.
> 
> Thanks,
> Victor
> 
> --
> Paul Barker
> Konsulko Group
> 
