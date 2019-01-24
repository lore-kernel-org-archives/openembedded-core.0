Return-Path: <prvs=920c251a5=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id CF7FE7C168
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 07:29:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,515,1539640800"; d="scan'208";a="14688926"
To: <openembedded-core@lists.openembedded.org>
References: <2eb8bebf-cee5-3390-2fae-7b051df359f9@skidata.com>
	<6161b390-971a-fe7c-a5f5-449a8f7e94b3@windriver.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <1e8ad2e7-e200-0a74-6740-8337258aa574@skidata.com>
Date: Thu, 24 Jan 2019 08:29:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <6161b390-971a-fe7c-a5f5-449a8f7e94b3@windriver.com>
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
X-List-Received-Date: Thu, 24 Jan 2019 07:29:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 24/01/2019 08:31, Robert Yang wrote:
> Hi Richard.L,
> 
> On 1/24/19 3:09 PM, Richard Leitner wrote:
>> Hi,
>> I'm currently facing issues on how to include a fitImage with 
>> devicetrees and a INITRAMFS_IMAGE in my rootfs image.
>>
>> My config is something like:
>>
>> KERNEL_IMAGETYPE = "fitImage"
>> KERNEL_CLASSES  = "kernel-fitimage"
>> KERNEL_DEVICETREE = "a.dtb b.dtb c.dtb"
>> INITRAMFS_IMAGE = "initramfs-mine"
>>
>> To include the "normal" fitImage without the initramfs in the rootfs 
>> the following works:
>>
>> IMAGE_INSTALL_append += " kernel-image"
>>
>>
>> When digging around a little bit I found that the 
>> fitImage-initramfs-mine is
>> deployed to tmp/deploy/images but there's no package including that file.
> 
> fitImage-initramfs-mine is an image, so it is not in any package, it is
> handled by kernel.bbclass, you can check it for more info.

Ok. I saw how it's generated in the kernel-fitimage.bbclass and 
kernel.bbclass... But is there any "clean" way of adding it to my rootfs 
image like the fitImage?

> 
> // Robert
> 
>>
>> Therefore I'm unable to include it via IMAGE_INSTALL.
>>
>> Am I missing something?
>> Is anybody of you aware of a solution?
>> Does kernel-fitimage and kernel.bbclass offer this at all?
>>
>> Any help would be greatly appreciated! Thanks!
>>
>> regards;Richard.L

