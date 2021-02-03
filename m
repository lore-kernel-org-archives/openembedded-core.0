Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.10419.1612364599446634262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 07:03:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=f3eBCPCw;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from [192.168.178.23] (unknown [83.135.221.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2633820B6C41;
	Wed,  3 Feb 2021 07:03:17 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2633820B6C41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1612364598;
	bh=cpOrf53IDupZIDk2DfbUPXI5OFuxOd1WMKU76cGJXNQ=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=f3eBCPCw+7ShuuiKLX9c6iXuffrcTM5oJt42aisxWM3Kb60To4TtBG/2YzTOME5uf
	 G5+5h4xb+NsXsUOkg923Ef4VqEpPrvArtSdlbjC1kOrhK07QFDwX3YjDsZJLorj/7a
	 QyIV8lfMDQAiSWuOz/UsEsTvTlY6QyyUqyPywc9w=
Subject: Re: [OE-core] [dunfell][PATCH] glib-2.0: Rename patch file for CVE-2020-35457
To: Steve Sakoman <steve@sakoman.com>, Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210203084257.26778-1-anbelski@linux.microsoft.com>
 <YBp0r/IvR1vFubjt@korppu>
 <CAOSpxdYJNWu+cPtAH_ceHuOsYVYEo8ozh0RJRRcv54-B139fOA@mail.gmail.com>
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Message-ID: <1a607f35-5b55-2e64-bceb-0e787ff3d4cc@linux.microsoft.com>
Date: Wed, 3 Feb 2021 16:03:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAOSpxdYJNWu+cPtAH_ceHuOsYVYEo8ozh0RJRRcv54-B139fOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

On 2/3/2021 3:38 PM, Steve Sakoman wrote:
> On Wed, Feb 3, 2021 at 12:02 AM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
>> Hi,
>>
>> On Wed, Feb 03, 2021 at 08:42:57AM +0000, Anatol Belski wrote:
>>> The naming convention needs to be help so the CVE is recognized as
>>> fixed by the tooling.
>> Yocto CVE checker does detect CVE patches also from patch comments so
>> this change is not needed for that. This is sufficient:
>>
>> poky$ git grep CVE-2020-35457
>> meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch:CVE: CVE-2020-35457
> Yes, we are detecting the CVE patch from the patch comment.
>
> However our CVE patch guidelines do request that the patch be named
> with the CVE as the name:
>
> https://wiki.yoctoproject.org/wiki/Security
>
> (in the "Patch name convention and commit message" section)
>
> I'm sorry I didn't catch this when I merged this earlier.  I always
> check the patch itself for the CVE tag, but I missed the name.  So I'm
> happy to take this patch just to clean up the metadata and make it
> easy to see that this is a CVE patch.

Thanks for pointing this out. On my side, I also always check this one

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

There's no explicit mention on the filename, but I guess i sure read the 
other page, too. Perhaps the effort would be better put adding a word on 
the wiki, that the filename is not really relevant. And otherwise, seems 
there's nothing to fix other than my habit on seeing the filename to be 
same as CVE :)

Thanks!

Anatol

> Steve
>
>> Is there some other tooling that you are referring to?
>>
>> Cheers,
>>
>> -Mikko
>> 
>>
