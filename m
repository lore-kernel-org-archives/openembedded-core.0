Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 48A9F77E50
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 01:53:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v811rlQp024792
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 Aug 2017 18:53:47 -0700 (PDT)
Received: from server.local (128.224.21.170) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 31 Aug 2017 18:53:46 -0700
To: Kevin Hao <kexin.hao@windriver.com>
References: <cover.1504207711.git.bruce.ashfield@windriver.com>
	<c9224d0a2d7a48fa1c60c7c35041cc4c673ddaaa.1504207711.git.bruce.ashfield@windriver.com>
	<20170901012708.GB19450@pek-khao-d1>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <09ae468f-70d0-34a7-aa0f-83f1a7365187@windriver.com>
Date: Thu, 31 Aug 2017 21:53:45 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170901012708.GB19450@pek-khao-d1>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] linux-yocto/4.10: fix aufs build
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
X-List-Received-Date: Fri, 01 Sep 2017 01:53:47 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2017-08-31 9:27 PM, Kevin Hao wrote:
> On Thu, Aug 31, 2017 at 03:30:58PM -0400, Bruce Ashfield wrote:
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
>> index 4107891f6e8a..10b56cda77e7 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
>> @@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
>>   KBRANCH_qemux86-64 ?= "standard/base"
>>   KBRANCH_qemumips64 ?= "standard/mti-malta64"
>>   
>> -SRCREV_machine_qemuarm ?= "4c652d50c67050422da4621cc6421ecb86b31c31"
>> -SRCREV_machine_qemuarm64 ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
>> -SRCREV_machine_qemumips ?= "0a632fa7f9615ad1b2488a300846a7e925e6591a"
>> -SRCREV_machine_qemuppc ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
>> -SRCREV_machine_qemux86 ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
>> -SRCREV_machine_qemux86-64 ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
>> -SRCREV_machine_qemumips64 ?= "75c22c1be83bf7894af78a36b3e3c5af08ce4d7b"
>> -SRCREV_machine ?= "65370fa249e282e4ce69cf927c01898b4c16f261"
>> -SRCREV_meta ?= "6ac2680ca4316fe111cddec37def7757843bbe86"
>> +SRCREV_machine_qemuarm ?= "97253eca8592c9cba7c7665277e1118b048b9639"
>> +SRCREV_machine_qemuarm64 ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
>> +SRCREV_machine_qemumips ?= "52e935b59800868731e7620caf49cc257f1b9946"
>> +SRCREV_machine_qemuppc ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
>> +SRCREV_machine_qemux86 ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
>> +SRCREV_machine_qemux86-64 ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
>> +SRCREV_machine_qemumips64 ?= "7b6d7feb4b0143d6f9146784f6072ffd171dd7ba"
>> +SRCREV_machine ?= "f4ba3db6e599ed41d1c676f9086ad8b97fd55046"
> 
> Hi Bruce,
> 
> I didn't get these commits in linux-yocto-4.10 git tee? Did you forget to push
> or I missed something?
> 

I see them in the tree. So I'm not sure what it happening!

Bruce

> Thanks,
> Kevin
> 
>> +SRCREV_meta ?= "416a2862c3bac3ecb641bf14e14c1d2c9c23ed96"
>>   
>>   SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
>>              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
>> -- 
>> 2.5.0
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


