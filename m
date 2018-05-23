Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A180D74638
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 03:48:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4N3lj31021646
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 May 2018 20:48:00 -0700
Received: from [128.224.21.88] (128.224.21.88) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 May 2018 20:47:35 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Alistair Francis
	<alistair23@gmail.com>
References: <20180502204907.137185-1-alistair.francis@wdc.com>
	<CAKmqyKM1cAX-6ZjgEb2r+4_K-PDdUgcq-Zodr7=cfdkQpzvNsg@mail.gmail.com>
	<CAJTo0LaCHutWfBe+zW2dF3JcO4ODzcHa72U96Ta6fPj1SnGpyQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <d75bf35e-6d01-44f3-dda1-90a02fd5230b@windriver.com>
Date: Tue, 22 May 2018 23:47:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaCHutWfBe+zW2dF3JcO4ODzcHa72U96Ta6fPj1SnGpyQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from MACHINE_FEATURES
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
X-List-Received-Date: Wed, 23 May 2018 03:48:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/22/2018 08:14 PM, Burton, Ross wrote:
> Bruce, can you review this please?

Ack'd. Give me a day or so, since I'm traveling, but will reply ASAP.

Bruce

> 
> Ross
> 
> On 23 May 2018 at 00:45, Alistair Francis <alistair23@gmail.com> wrote:
>> On Wed, May 2, 2018 at 1:49 PM, Alistair Francis
>> <alistair.francis@wdc.com> wrote:
>>> If the user has set numa in their MACHINE_FEATURES we should enable
>>> NUMA support in the kernel config.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>
>> Ping!
>>
>> Alistair
>>
>>> ---
>>>   meta/recipes-kernel/linux/files/numa.cfg  | 4 ++++
>>>   meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
>>>   2 files changed, 7 insertions(+)
>>>   create mode 100644 meta/recipes-kernel/linux/files/numa.cfg
>>>
>>> diff --git a/meta/recipes-kernel/linux/files/numa.cfg b/meta/recipes-kernel/linux/files/numa.cfg
>>> new file mode 100644
>>> index 0000000000..bb0f9ab20c
>>> --- /dev/null
>>> +++ b/meta/recipes-kernel/linux/files/numa.cfg
>>> @@ -0,0 +1,4 @@
>>> +CONFIG_NUMA=y
>>> +CONFIG_ACPI_NUMA=y
>>> +CONFIG_NUMA_BALANCING=y
>>> +CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
>>> index 3bb872a32a..e8fb38b8f4 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>>> @@ -28,6 +28,9 @@ KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>>>
>>>   KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
>>>
>>> +SRC_URI += "${@bb.utils.contains('MACHINE_FEATURES', 'numa', ' file://numa.cfg', '', d)}"
>>> +KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
>>> +
>>>   # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>>>   # by the kernel. This is typically the branch that should be built,
>>>   # and it can be specific to the machine or shared
>>> --
>>> 2.17.0
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


