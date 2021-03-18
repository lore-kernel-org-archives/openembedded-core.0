Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web12.1177.1616094961415688521
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 12:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q6vrHxaq;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id b10so3484625iot.4
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 12:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NPVHnRMb2B07rmrlO5n7pQJqUveZzNMMfpUgNTaY1Fc=;
        b=q6vrHxaqtB+yydSKE7rb4x8wK9ZC8r341sGhI81EgsBgtPdYil/d17DmbDpGUapyMz
         FHENSS6rkPOiigePibzdOVkNp8u+ppT/MI9RcvNcZEOoSS9tV0Y398rJGqOnvRS5fj/C
         lI0bl85P+Zg4xMGIqRnShbdctYCSoltp4H4VB0e3lE24l0LA/tM62DR8VtWW2abV/vZM
         NhoTSHc7mN84mrYfpFPMO0VI3IdmCZkX3ufdzWIdYLJQOBSxWjSgbqb7FkNhWcPtmAzn
         vij8ehura68/G2DWQHBtR0SEGyBC6kRJyL14lh7vC3ZZqL1YA6rNliD3EWNmeu5IeTOh
         bmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NPVHnRMb2B07rmrlO5n7pQJqUveZzNMMfpUgNTaY1Fc=;
        b=HzZJ1F6CHAY2YmakQOubtxPrcOwIz5nlS3h9R5yiXxwQw1wxINXoRqmG8Cf3qIoNRj
         hLeXjOBZWFvddUMU+eCK6kMNviqalEdJ1xlIvyWMZJwnUdtS9lqLh5wA3ejE4YPxnW8W
         2hM7mYpjKZQM2HvsWIfnS5YDMGeaI/gsfkFAGa6Sm/xO3ZofTqiT1B3LJHXLSc6VFd8i
         HLGA/hkjFhRQqoHfwH3c1UAmUoTpqccsVqO+6eXlWXaLKD4rIkqUExh0EAy8bPhu+A8v
         BqXNAZrzySiEHU3mCDibIp3bPAbhwG3CZnemMXh0FVofE0mVujbG1VVGkhc9VldwmGfr
         W05g==
X-Gm-Message-State: AOAM533X4im4kpGMuO7XNVfNAZYGfnd38ZHiAk7gn7h8bg5sRl7hENm3
	CB/F5xF9NKXa4njg1dZTdWOtJkR0pPTwFA==
X-Google-Smtp-Source: ABdhPJxpD+wQan5PKFdB3DaETClj+PFr44Cmr2e/iswCQXu1mu2egCxTKqsVcqsz51olk8C9yx6AAw==
X-Received: by 2002:a5e:d908:: with SMTP id n8mr60509iop.121.1616094960390;
        Thu, 18 Mar 2021 12:16:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:64ff:3f25:21dc:876e? ([2601:646:9200:a0f0:64ff:3f25:21dc:876e])
        by smtp.gmail.com with ESMTPSA id k12sm1376854ios.2.2021.03.18.12.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 12:16:00 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
To: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>,
 Anatol Belski <anbelski@linux.microsoft.com>,
 Steve Sakoman <steve@sakoman.com>
Cc: Denys Dmytriyenko <denis@denix.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210311152128.41215-1-khairul.rohaizzat.jamaluddin@intel.com>
 <CAMKF1spX6z9vvv7QNbWhkapX-Z1=FWZVh0W2+OM2qSbxPqQgkQ@mail.gmail.com>
 <DM5PR11MB1322590C6E8F9272ECC912CFDE6F9@DM5PR11MB1322.namprd11.prod.outlook.com>
 <MWHPR11MB1326447A6A6AA12D09952A56DE6F9@MWHPR11MB1326.namprd11.prod.outlook.com>
 <f2d269853c88992f528419d5d20139a42728cada.camel@linux.microsoft.com>
 <20210315213606.GP4892@denix.org>
 <dd23f3e8-0db6-3f8b-466a-e9c9207c6604@linux.microsoft.com>
 <CAOSpxdbSVPDC9hDcyYhjvSwdbRnaPJ_VbaLscMLNhiwrVN6u-A@mail.gmail.com>
 <c115a501-d7ce-3c30-7964-6e0afc373305@linux.microsoft.com>
 <MWHPR11MB1326409A4E80D7DB446A0B6CDE699@MWHPR11MB1326.namprd11.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <f2c3bf4a-d0c5-c89d-b2c1-7d1dd45ba1a1@gmail.com>
Date: Thu, 18 Mar 2021 12:15:58 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1326409A4E80D7DB446A0B6CDE699@MWHPR11MB1326.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

yes please submit a minor SRCREV bump and see how it goes.

On 3/18/21 11:31 AM, Jamaluddin, Khairul Rohaizzat wrote:
> Hi,
> 
> Please do correct me if I'm wrong, is the final verdict for glibc on dunfell is to whitelist all the CVEs that were applied before the commit used in SRCREV?
> I'm not really sure what needs to be done here..
> 
> 
> Thank you & Kind regards,
> Khairul
> 
> -----Original Message-----
> From: Anatol Belski <anbelski@linux.microsoft.com>
> Sent: Wednesday, March 17, 2021 4:24 AM
> To: Steve Sakoman <steve@sakoman.com>
> Cc: Denys Dmytriyenko <denis@denix.org>; Jamaluddin, Khairul Rohaizzat <khairul.rohaizzat.jamaluddin@intel.com>; Khem Raj <raj.khem@gmail.com>; Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
> 
> Hi,
> 
> On 3/16/2021 4:45 PM, Steve Sakoman wrote:
>> On Tue, Mar 16, 2021 at 2:56 AM Anatol Belski
>> <anbelski@linux.microsoft.com> wrote:
>>> Hi,
>>>
>>> On 3/15/2021 10:36 PM, Denys Dmytriyenko wrote:
>>>> https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable.2FL
>>>> TS_Patch_Acceptance_Policies
>>>>
>>>> Stable/LTS Patch Acceptance Policies
>>>>
>>>> Potentially Acceptable:
>>>> * Bug fix only version upgrades for upstreams with a good stable
>>>> process
>>>>
>>>> Unacceptable:
>>>> * General version upgrades
>>>>
>>>>
>>>> So, unless there's a bugfix-only minor release of glibc, e.g.
>>>> 2.31.1, upgrading to 2.32 or 2.33 in stable branches is highly
>>>> unlikely, as both
>>>> 2.32 and 2.33 have long lists of major changes:
>>>>
>>>> https://sourceware.org/pipermail/libc-announce/2020/000029.html
>>>> https://sourceware.org/pipermail/libc-announce/2021/000030.html
>>> thanks for linking the LTS doc.
>>>
>>> My suggestion was to pull the latest upstream from 2.31 actually, not
>>> upgrading the glibc version. As per
>>>
>>> http://git.yoctoproject.org/clean/cgit.cgi/poky/tree/meta/recipes-cor
>>> e/glibc/glibc-version.inc?h=dunfell
>>>
>>> we consume from the branch release/2.31/master. It already contains
>>> the backported patch fixing this CVE.
>>>
>>> There doesn't seem to be a release process in terms of versions, but
>>> it regularly receives backports. In fact,
>>>
>>> there are already some bug and CVE fixes between the current SRCREV
>>> used and HEAD.
>> I'd be happy to take such a patch for dunfell.
>>
>> I'll add it to my to do list to look into this, but if someone has the
>> time/inclination to tackle this it might get done sooner :-)
>>
>> Since there is no versioning from upstream it will be important in
>> this patch to make sure that we whitelist all of the CVE's that are
>> fixed with the bump in SRCREV.
>>
> I'd be able to do a run on this closer to the end of this week, if no one beats me to it (perhaps Khairul, the initial patch contributor ;)).
> 
> Regards
> 
> Anatol
> 
