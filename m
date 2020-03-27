Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com [193.143.230.17])
 by mx.groups.io with SMTP id smtpd.web12.17404.1585329497330055573
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: vaisala.com, ip: 193.143.230.17, mailfrom: nandor.han@vaisala.com)
IronPort-SDR: dHGGB5J5rYp0FEWKoZMth1YM+msHstujBI1ze/zDq/Zv/k90UO9fFZTDMqspHfNGNqil3w5chQ
 0Bas9JgwyC9Wt2CTHoTzgQqLakE7rOrl5iyIWFOQv/aTDn/u9vKclvwFW6kH5ZPPtwHRZhbZd3
 Iv5BHHYs7KissS9NBwSi+I4XADORzDDoF10mt3LzxQcnt0NE07qqT88/TavSm+mezkxJl8Ol6J
 Iv1oqJjOYzwHxEIILVHnQxkh663QgXtp3fsTGRowzHMBt5Z1Y9z/LU7eVW6L6GhCH6Z/LvwvxR
 /pI=
X-IronPort-AV: E=Sophos;i="5.72,313,1580767200"; 
   d="scan'208";a="274840899"
Subject: Re: [OE-core] [PATCH v3] classes: Add a new bbclass that abstracts the generation of FIT blobs
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200326214308.1042374-1-nandor.han@vaisala.com>
 <20200327082918.1213345-1-nandor.han@vaisala.com>
 <6a748f7bf39bba8b9bb2680360c15f57d9009dce.camel@linuxfoundation.org>
From: "Nandor Han" <nandor.han@vaisala.com>
Message-ID: <5fc4299b-4888-3e3f-501e-555520a75978@vaisala.com>
Date: Fri, 27 Mar 2020 19:18:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6a748f7bf39bba8b9bb2680360c15f57d9009dce.camel@linuxfoundation.org>
Return-Path: nandor.han@vaisala.com
X-OriginalArrivalTime: 27 Mar 2020 17:18:14.0650 (UTC) FILETIME=[B30CBDA0:01D6045B]
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2020-03-27 18:35, Richard Purdie wrote:
> On Fri, 2020-03-27 at 10:29 +0200, Nandor Han wrote:
>> FIT format is very versatile allowing various combination of booting
>> sequences. In the same time different U-Boot boot stages can use FIT
>> blobs to pack various binaries (e.g. SPL supports reading U-Boot from a
>> FIT blob). Because of the allowed level of customization, the generation
>> of a FIT blob using a fixed image tree source, becomes challenging and
>> increase the level of complexity where different configurations and
>> combinations are needed.
>>
>> This bbclass will know how to generate a FIT blob, leaving the mechanics
>> of the process (dependencies, task order...) to be handled by the users
>> of the bbclass. In the same time will allow to separate the knowledge of
>> the FIT format leaving the user code cleaner and more readable.
>>
>> Signed-off-by: Nandor Han <nandor.han@vaisala.com>
> 
> Have you considered adding automated tests for this?
> 

Thanks for feedback Rickard. I haven't considered adding any extra
tests (automate), but I think is a great idea. I'll try to have a look.

> Does adding this class remove or obsolete any of the existing
> code/support?
> 

Currently no, AFAIK. But this is only the first step and my plan is to 
go forward and update the `kernel-fitimage.bbclass` to use this class. 
This way we can very easily extend the FIT source dynamically and in the 
same time reduce the complexity of the `kernel-fitimage.bbclass`. More 
over I'm planning to create also a U-Boot related class that will be 
able to generate a FIT blobs that can contain U-Boot... and is used by SPL.

> Cheers,
> 
> Richard
> 

Nandor
