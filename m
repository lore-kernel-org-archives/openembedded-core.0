Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6DE79492
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 02:26:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8L2QOsA031881
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 19:26:34 -0700
Received: from [128.224.162.153] (128.224.162.153) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 20 Sep 2018 19:26:13 -0700
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180909104450.11900-1-hongzhi.song@windriver.com>
	<bdb5a4f9-4982-8472-e063-e005a846c748@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <19f3527f-5dda-6f8e-cea5-beed6a76cf1f@windriver.com>
Date: Fri, 21 Sep 2018 10:26:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <bdb5a4f9-4982-8472-e063-e005a846c748@windriver.com>
X-Originating-IP: [128.224.162.153]
Subject: Re: [PATCH] linux-yocto-rt: Add paravirt_kvm support for qemux86-64
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
X-List-Received-Date: Fri, 21 Sep 2018 02:26:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Bruce,

I just want to confirm that you doesn't forget this patch.

This is not an emergency.


Thanks,

Hongzhi


On 09/11/2018 11:15 AM, Bruce Ashfield wrote:
> On 2018-09-09 6:44 AM, Hongzhi.Song wrote:
>> This feature includes paravirtualized KVM guest support, including
>> KVMCLOCK for enhancing clock accuracy of guest OS.
>>
>
> This is fine with me. I'll pull it into my queue. I expect my next pull
> request to be on Wednesday.
>
> Bruce
>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb | 2 +-
>>   meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb 
>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
>> index d9953c32be..ab088f4d18 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
>> @@ -38,4 +38,4 @@ KERNEL_EXTRA_FEATURES ?= 
>> "features/netfilter/netfilter.scc features/taskstats/ta
>>   KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>   KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>> -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb 
>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
>> index 5b102069f1..de3b538b5d 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
>> @@ -40,4 +40,4 @@ KERNEL_EXTRA_FEATURES ?= 
>> "features/netfilter/netfilter.scc features/taskstats/ta
>>   KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>>   KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>>   KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>> -KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>> +KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>>
>
>


