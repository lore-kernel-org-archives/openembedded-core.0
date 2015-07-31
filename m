Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 36B227653B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:45:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6VBjnLA004000
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 Jul 2015 04:45:49 -0700 (PDT)
Received: from [128.224.162.235] (128.224.162.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Fri, 31 Jul 2015 04:45:29 -0700
Message-ID: <55BB5FDB.4080707@windriver.com>
Date: Fri, 31 Jul 2015 19:45:31 +0800
From: He Zhe <zhe.he@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1437461993.git.zhe.he@windriver.com>	
	<c3b8e75db6f2ebc1bd9e53a4f01da0d642e4edcb.1437461993.git.zhe.he@windriver.com>	
	<CABcZAN=D=2FUBHmSRiwYE7PbqHsjYJUQB5PkfvnQYO-=YFJecw@mail.gmail.com>	
	<55AEFFFA.8080308@windriver.com>
	<1438341880.22462.25.camel@linuxfoundation.org>
In-Reply-To: <1438341880.22462.25.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.235]
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] kernel: Define KERNEL_IMAGETYPE as a list
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
X-List-Received-Date: Fri, 31 Jul 2015 11:45:56 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit



On 07/31/2015 07:24 PM, Richard Purdie wrote:
> On Wed, 2015-07-22 at 10:29 +0800, He Zhe wrote:
>> On 07/21/2015 10:53 PM, Christopher Larson wrote:
>>> On Tue, Jul 21, 2015 at 12:23 AM, <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>wrote:
>>>
>>>     From: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
>>>
>>>     To support building packaging and installing multi types of kernel
>>>     images, such as zImage uImage, at one time define KERNEL_IMAGETYPE
>>>     as a list.
>>>     Modify wherever reference KERNEL_IMAGETYPE accordingly.
>>>
>>>     Fixes [YOCTO #6945].
>>>
>>>     Signed-off-by: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
>>>
>>>
>>> Question, why not add KERNEL_IMAGETYPES, and make KERNEL_IMAGETYPE equal to your new KERNEL_IMAGETYPE_0?
>> Adding a new KERNEL_IMAGETYPES will also work. But it should be better
>> not to change the name of KERNEL_IMAGETYPE, so that those who have
>> used it don't have to change their code.
>>
>> Thank you for reviewing.
> I have to agree with Chris here, keeping KERNEL_IMAGETYPE as used today
> and equivalent to KERNEL_IMAGETYPE_0 and adding KERNEL_IMAGETYPES does
> seem like a cleaner way to implement this.

But it might mean we are going to check both KERNEL_IMAGETYPE and KERNEL_IMAGETYPES
to generate final image type list. Is that OK?

Thanks,
Zhe

> Cheers,
>
> Richard
>
>
>
>
>


