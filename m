Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 40AEC6FBEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 13:53:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4SDr6Po011992
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 May 2014 06:53:06 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 28 May 2014 06:53:05 -0700
Message-ID: <5385EA34.8080202@windriver.com>
Date: Wed, 28 May 2014 09:52:52 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1401124899.git.bruce.ashfield@windriver.com>		
	<81e37d5db466c157a8ca0069c60102eb12616532.1401124899.git.bruce.ashfield@windriver.com>	
	<1401266199.2607.15.camel@ted> <5385DC75.6020902@windriver.com>
	<1401284851.2607.49.camel@ted>
In-Reply-To: <1401284851.2607.49.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] linux-yocto/3.10: bump kver to v3.10.40
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
X-List-Received-Date: Wed, 28 May 2014 13:53:07 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-05-28 09:47 AM, Richard Purdie wrote:
> On Wed, 2014-05-28 at 08:54 -0400, Bruce Ashfield wrote:
>> On 14-05-28 04:36 AM, Richard Purdie wrote:
>>> On Mon, 2014-05-26 at 13:40 -0400, Bruce Ashfield wrote:
>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>>>> index 7081cd18aa57..b1b80341d6d2 100644
>>>> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>>>> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
>>>> @@ -5,12 +5,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
>>>>    LINUX_KERNEL_TYPE = "tiny"
>>>>    KCONFIG_MODE = "--allnoconfig"
>>>>
>>>> -LINUX_VERSION ?= "3.10.38"
>>>> +LINUX_VERSION ?= "3.10.40"
>>>>
>>>>    KMETA = "meta"
>>>>
>>>> -SRCREV_machine ?= "02f7e63e56c061617957388c23bd5cf9b05c5388"
>>>> -SRCREV_meta ?= "617c6158c3d5b931f0d6131e0b0a7b374c792599"
>>>> +SRCREV_machine ?= "f53a6114b3a6e8c03ca4752de829887015f4c942"
>>>> +SRCREV_meta ?= "13ae75f4a26fcd65abe526ef5f1dcde0583f453d"
>>>
>>> We're seeing failures since "13ae75f4a26fcd65abe526ef5f1dcde0583f453d"
>>> doesn't appear to exist in the 3.10 tree meta branch. "bitbake -b
>>> linux-yocto-tiny_3.10 -c fetch" reproduces.
>>>
>>> Did you miss pushing something?
>>
>> I don't manually push anything anymore, just my release scripts. I'll
>> check to see if the infrastructure has let me down by re-running them
>> now.
>>
>> .. and I did see the meta branch SRCREV push, and re-launched my
>> builders. But all should be fine now.
>>
>> Sorry :(
>
> No problem, these things happen. We just need to figure out what
> happened and make sure it doesn't happen again. The commit is there now

In this case, my scripts weren't checking for a return code on the
push. Our gateway was *really* slow out of Ottawa over the past week
and it looks like I hit a timeout.

Bruce

> so I'm guessing that should fix the build failures.
>
> Cheers,
>
> Richard
>
>


