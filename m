Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 266B47C11A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 07:47:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0O7lbmo026896
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Jan 2019 23:47:37 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 23 Jan 2019 23:47:30 -0800
To: Richard Leitner <richard.leitner@skidata.com>,
	<openembedded-core@lists.openembedded.org>
References: <2eb8bebf-cee5-3390-2fae-7b051df359f9@skidata.com>
	<6161b390-971a-fe7c-a5f5-449a8f7e94b3@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <83b8b17a-40c4-4876-8880-b89f95dc6f43@windriver.com>
Date: Thu, 24 Jan 2019 15:52:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <6161b390-971a-fe7c-a5f5-449a8f7e94b3@windriver.com>
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
X-List-Received-Date: Thu, 24 Jan 2019 07:47:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 1/24/19 3:31 PM, Robert Yang wrote:
> Hi Richard.L,
> 
> On 1/24/19 3:09 PM, Richard Leitner wrote:
>> Hi,
>> I'm currently facing issues on how to include a fitImage with devicetrees and 
>> a INITRAMFS_IMAGE in my rootfs image.


I think that set both INITRAMFS_IMAGE and INITRAMFS_IMAGE_BUNDLE should work,
you have set INITRAMFS_IMAGE, so also set:

INITRAMFS_IMAGE_BUNDLE = "1"

// Robert


>>
>> My config is something like:
>>
>> KERNEL_IMAGETYPE = "fitImage"
>> KERNEL_CLASSES  = "kernel-fitimage"
>> KERNEL_DEVICETREE = "a.dtb b.dtb c.dtb"
>> INITRAMFS_IMAGE = "initramfs-mine"
>>
>> To include the "normal" fitImage without the initramfs in the rootfs the 
>> following works:
>>
>> IMAGE_INSTALL_append += " kernel-image"
>>
>>
>> When digging around a little bit I found that the fitImage-initramfs-mine is
>> deployed to tmp/deploy/images but there's no package including that file.
> 
> fitImage-initramfs-mine is an image, so it is not in any package, it is
> handled by kernel.bbclass, you can check it for more info.
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

