Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web09.22.1616095913168611959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 12:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oI1PCYKc;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id n198so3541889iod.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Mar 2021 12:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZhRQJGa44m1K3ceyKlfYXM/ZXBahK0JYB+gATcK6c2A=;
        b=oI1PCYKcFsyjtCHfDwbeikmbBjKgIcamxJkCD5meolHj9AhTaKgwnOypecjGBPcBYX
         nNhTMmoEFvPpVCiqLXaCpVdzWjHizvQh9WI4JAE468xrQzfeQ+428g0Sqbxx4ygTFV7y
         nxzbzwF7whXQwqd+dVdB+21Ilfup9I7XjIT8zqXL6efmzYCvR3q7oUNH6kz86lW8sL4H
         PgSUIMrOUjnzkVVAqkTN87E1b2VQSObm0ZqdmTPAnxbWsH7fesCqo4N6OQ/ZW548/ktk
         94trRpBYfznysRIAe8qDg35buEwRtYiBiCkVIWp2Lwi0ONLxf8uhO5PxcQjM/oRvkGvf
         L6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZhRQJGa44m1K3ceyKlfYXM/ZXBahK0JYB+gATcK6c2A=;
        b=RXa5oqEuKAKJCqEnnxaxynmjB1IsvoY1WH6zCD9UM2tqDvW0SC+3TpAoQj03XDV2oS
         BVXIpjCxRzoo7WDF0xkdvaVECROjJDWTANmwFvwGgAQh3enFy4zRR5RyXw4qsfjPiGT0
         ltGqsng8u4WM5cjZ8aTCN/hsJ1klIdOpwOxTaFTBrvjoZR/JRAvPVdM62Bybu8uPwFxY
         l89RYuldETl2mdQEB91ETFDJvN2PvcKkEsKjnXNOc5pH944WzDxW2fmBQwxDaNT0Z1nL
         a8BO0OJuFPxbPrgur1HJ9AJZHn51OuDlROB8GxmlytIFqdSRIxzLLnAkkh7wLQWXZalq
         nU8Q==
X-Gm-Message-State: AOAM533RNmxFYTaDER69RAfYnTbdt0usSdl9uNjrEBgBZH3nS5krgjiE
	tJL2BOY2aTTt4a2favpQStHbRLuvydjAJA==
X-Google-Smtp-Source: ABdhPJxv6feTA13sko2+YdCAP16BckpgWVgHx+9C5Jlf53KpfYpF0keiLz9hBO8RZyIYvwVaRZcu+w==
X-Received: by 2002:a5d:80d5:: with SMTP id h21mr121340ior.11.1616095912227;
        Thu, 18 Mar 2021 12:31:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:64ff:3f25:21dc:876e? ([2601:646:9200:a0f0:64ff:3f25:21dc:876e])
        by smtp.gmail.com with ESMTPSA id j3sm1458169ila.58.2021.03.18.12.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 12:31:51 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
To: Steve Sakoman <steve@sakoman.com>,
 "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
Cc: Anatol Belski <anbelski@linux.microsoft.com>,
 Denys Dmytriyenko <denis@denix.org>,
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
 <CAOSpxdZzQh0cR2_3TMm8vpU_6odAym9ve1zYZSZo6EtqaP03YA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9f101bc7-7f7b-1841-8223-a068978b0b42@gmail.com>
Date: Thu, 18 Mar 2021 12:31:49 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAOSpxdZzQh0cR2_3TMm8vpU_6odAym9ve1zYZSZo6EtqaP03YA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/18/21 12:29 PM, Steve Sakoman wrote:
> On Thu, Mar 18, 2021 at 8:31 AM Jamaluddin, Khairul Rohaizzat
> <khairul.rohaizzat.jamaluddin@intel.com> wrote:
>>
>> Hi,
>>
>> Please do correct me if I'm wrong, is the final verdict for glibc on dunfell is to whitelist all the CVEs that were applied before the commit used in SRCREV?
>> I'm not really sure what needs to be done here..
> 
> My guess is:
> 
> 1. Bump SRCREV to current head of the 2.31.1 branch
> 2. Remove patches from the recipe that are already included in the new head
> 3. See what breaks and fix it ;-)
> 4. Identify any new CVE's that are fixed as a result of moving to the
> new head and add them to the whitelist.
> 
> It's unfortunate that we need to deal with keeping the whitelist
> accurate, but since upstream doesn't do version bumps there is no way
> for the cve checker to know that these fixes are included.

right thanks for the detailed list. this seems correct steps to me.
> 
> Steve
> 
>>
>>
>> Thank you & Kind regards,
>> Khairul
>>
>> -----Original Message-----
>> From: Anatol Belski <anbelski@linux.microsoft.com>
>> Sent: Wednesday, March 17, 2021 4:24 AM
>> To: Steve Sakoman <steve@sakoman.com>
>> Cc: Denys Dmytriyenko <denis@denix.org>; Jamaluddin, Khairul Rohaizzat <khairul.rohaizzat.jamaluddin@intel.com>; Khem Raj <raj.khem@gmail.com>; Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
>> Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
>>
>> Hi,
>>
>> On 3/16/2021 4:45 PM, Steve Sakoman wrote:
>>> On Tue, Mar 16, 2021 at 2:56 AM Anatol Belski
>>> <anbelski@linux.microsoft.com> wrote:
>>>> Hi,
>>>>
>>>> On 3/15/2021 10:36 PM, Denys Dmytriyenko wrote:
>>>>> https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable.2FL
>>>>> TS_Patch_Acceptance_Policies
>>>>>
>>>>> Stable/LTS Patch Acceptance Policies
>>>>>
>>>>> Potentially Acceptable:
>>>>> * Bug fix only version upgrades for upstreams with a good stable
>>>>> process
>>>>>
>>>>> Unacceptable:
>>>>> * General version upgrades
>>>>>
>>>>>
>>>>> So, unless there's a bugfix-only minor release of glibc, e.g.
>>>>> 2.31.1, upgrading to 2.32 or 2.33 in stable branches is highly
>>>>> unlikely, as both
>>>>> 2.32 and 2.33 have long lists of major changes:
>>>>>
>>>>> https://sourceware.org/pipermail/libc-announce/2020/000029.html
>>>>> https://sourceware.org/pipermail/libc-announce/2021/000030.html
>>>> thanks for linking the LTS doc.
>>>>
>>>> My suggestion was to pull the latest upstream from 2.31 actually, not
>>>> upgrading the glibc version. As per
>>>>
>>>> http://git.yoctoproject.org/clean/cgit.cgi/poky/tree/meta/recipes-cor
>>>> e/glibc/glibc-version.inc?h=dunfell
>>>>
>>>> we consume from the branch release/2.31/master. It already contains
>>>> the backported patch fixing this CVE.
>>>>
>>>> There doesn't seem to be a release process in terms of versions, but
>>>> it regularly receives backports. In fact,
>>>>
>>>> there are already some bug and CVE fixes between the current SRCREV
>>>> used and HEAD.
>>> I'd be happy to take such a patch for dunfell.
>>>
>>> I'll add it to my to do list to look into this, but if someone has the
>>> time/inclination to tackle this it might get done sooner :-)
>>>
>>> Since there is no versioning from upstream it will be important in
>>> this patch to make sure that we whitelist all of the CVE's that are
>>> fixed with the bump in SRCREV.
>>>
>> I'd be able to do a run on this closer to the end of this week, if no one beats me to it (perhaps Khairul, the initial patch contributor ;)).
>>
>> Regards
>>
>> Anatol
>>
