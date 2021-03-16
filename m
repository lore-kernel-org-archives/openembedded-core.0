Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.603.1615926216393525295
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 13:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=UgxdVxsI;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from [192.168.178.23] (unknown [83.135.176.121])
	by linux.microsoft.com (Postfix) with ESMTPSA id 63858209C349;
	Tue, 16 Mar 2021 13:23:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 63858209C349
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1615926215;
	bh=f2A92er9e/Eq5661/3ixilgy6Wxbs4yLM0fX8yTt9nw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=UgxdVxsI1NM+iOHBchBEUeF0xVdd+LDuJw9BwgohF+L5c7Ze2cUouAjcx5SXnKqsH
	 WOjuVuFGu1ln/eCsP1GRxuxGktxzhrROwireRPtydZY7VNdxDGBPfQwekWPeeQWJ+i
	 sagX1g4jcGcVOcRp8cmy2s0eY7yCMJ0QrZd4J4/M=
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
To: Steve Sakoman <steve@sakoman.com>
Cc: Denys Dmytriyenko <denis@denix.org>,
 "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>,
 Khem Raj <raj.khem@gmail.com>,
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
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Message-ID: <c115a501-d7ce-3c30-7964-6e0afc373305@linux.microsoft.com>
Date: Tue, 16 Mar 2021 21:23:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAOSpxdbSVPDC9hDcyYhjvSwdbRnaPJ_VbaLscMLNhiwrVN6u-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

On 3/16/2021 4:45 PM, Steve Sakoman wrote:
> On Tue, Mar 16, 2021 at 2:56 AM Anatol Belski
> <anbelski@linux.microsoft.com> wrote:
>> Hi,
>>
>> On 3/15/2021 10:36 PM, Denys Dmytriyenko wrote:
>>> https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable.2FLTS_Patch_Acceptance_Policies
>>>
>>> Stable/LTS Patch Acceptance Policies
>>>
>>> Potentially Acceptable:
>>> * Bug fix only version upgrades for upstreams with a good stable process
>>>
>>> Unacceptable:
>>> * General version upgrades
>>>
>>>
>>> So, unless there's a bugfix-only minor release of glibc, e.g. 2.31.1,
>>> upgrading to 2.32 or 2.33 in stable branches is highly unlikely, as both
>>> 2.32 and 2.33 have long lists of major changes:
>>>
>>> https://sourceware.org/pipermail/libc-announce/2020/000029.html
>>> https://sourceware.org/pipermail/libc-announce/2021/000030.html
>> thanks for linking the LTS doc.
>>
>> My suggestion was to pull the latest upstream from 2.31 actually, not
>> upgrading the glibc version. As per
>>
>> http://git.yoctoproject.org/clean/cgit.cgi/poky/tree/meta/recipes-core/glibc/glibc-version.inc?h=dunfell
>>
>> we consume from the branch release/2.31/master. It already contains the
>> backported patch fixing this CVE.
>>
>> There doesn't seem to be a release process in terms of versions, but it
>> regularly receives backports. In fact,
>>
>> there are already some bug and CVE fixes between the current SRCREV used
>> and HEAD.
> I'd be happy to take such a patch for dunfell.
>
> I'll add it to my to do list to look into this, but if someone has the
> time/inclination to tackle this it might get done sooner :-)
>
> Since there is no versioning from upstream it will be important in
> this patch to make sure that we whitelist all of the CVE's that are
> fixed with the bump in SRCREV.
>
I'd be able to do a run on this closer to the end of this week, if no 
one beats me to it (perhaps Khairul, the initial patch contributor ;)).

Regards

Anatol

