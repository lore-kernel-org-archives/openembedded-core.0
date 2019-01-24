Return-Path: <prvs=920c251a5=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 40E047C0F5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 07:56:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,515,1539640800"; 
   d="scan'208";a="1939326"
To: <openembedded-core@lists.openembedded.org>
References: <2eb8bebf-cee5-3390-2fae-7b051df359f9@skidata.com>
	<6161b390-971a-fe7c-a5f5-449a8f7e94b3@windriver.com>
	<83b8b17a-40c4-4876-8880-b89f95dc6f43@windriver.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <4b6021ac-ccee-8f88-a45a-7b0a1bfc4aa9@skidata.com>
Date: Thu, 24 Jan 2019 08:56:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <83b8b17a-40c4-4876-8880-b89f95dc6f43@windriver.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: How to include fitImage-initramfs in rootfs image
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
X-List-Received-Date: Thu, 24 Jan 2019 07:56:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit


On 24/01/2019 08:52, Robert Yang wrote:
> 
> 
> On 1/24/19 3:31 PM, Robert Yang wrote:
>> Hi Richard.L,
>>
>> On 1/24/19 3:09 PM, Richard Leitner wrote:
>>> Hi,
>>> I'm currently facing issues on how to include a fitImage with 
>>> devicetrees and a INITRAMFS_IMAGE in my rootfs image.
> 
> 
> I think that set both INITRAMFS_IMAGE and INITRAMFS_IMAGE_BUNDLE should 
> work,
> you have set INITRAMFS_IMAGE, so also set:
> 
> INITRAMFS_IMAGE_BUNDLE = "1"

That was also my first thought, but unfortunately this doesn't work. 
There's still one fitImage and one fitImage-initramfs-mine in the deploy 
dir and the one included in the rootfs image has the same checksum and 
size as the fitImage without the initramfs.

> 
> // Robert
> 
> 
>>>
>>> My config is something like:
>>>
>>> KERNEL_IMAGETYPE = "fitImage"
>>> KERNEL_CLASSES  = "kernel-fitimage"
>>> KERNEL_DEVICETREE = "a.dtb b.dtb c.dtb"
>>> INITRAMFS_IMAGE = "initramfs-mine"
>>>
>>> To include the "normal" fitImage without the initramfs in the rootfs 
>>> the following works:
>>>
>>> IMAGE_INSTALL_append += " kernel-image"
>>>
>>>
>>> When digging around a little bit I found that the 
>>> fitImage-initramfs-mine is
>>> deployed to tmp/deploy/images but there's no package including that 
>>> file.
>>
>> fitImage-initramfs-mine is an image, so it is not in any package, it is
>> handled by kernel.bbclass, you can check it for more info.
>>
>> // Robert
>>
>>>
>>> Therefore I'm unable to include it via IMAGE_INSTALL.
>>>
>>> Am I missing something?
>>> Is anybody of you aware of a solution?
>>> Does kernel-fitimage and kernel.bbclass offer this at all?
>>>
>>> Any help would be greatly appreciated! Thanks!
>>>
>>> regards;Richard.L

