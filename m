Return-Path: <prvs=920c251a5=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id EC3927C1E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 09:58:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,515,1539640800"; d="scan'208";a="14692704"
To: <openembedded-core@lists.openembedded.org>
References: <2eb8bebf-cee5-3390-2fae-7b051df359f9@skidata.com>
	<6161b390-971a-fe7c-a5f5-449a8f7e94b3@windriver.com>
	<83b8b17a-40c4-4876-8880-b89f95dc6f43@windriver.com>
	<4b6021ac-ccee-8f88-a45a-7b0a1bfc4aa9@skidata.com>
	<e8623db4-2e8e-8ba6-b780-369deb0ee3e1@windriver.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <7dbee5de-6f2f-a3a5-3946-553c161a047e@skidata.com>
Date: Thu, 24 Jan 2019 10:58:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <e8623db4-2e8e-8ba6-b780-369deb0ee3e1@windriver.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
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
X-List-Received-Date: Thu, 24 Jan 2019 09:58:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 24/01/2019 09:15, Robert Yang wrote:
> 
> 
> On 1/24/19 3:56 PM, Richard Leitner wrote:
>>
>> On 24/01/2019 08:52, Robert Yang wrote:
>>>
>>>
>>> On 1/24/19 3:31 PM, Robert Yang wrote:
>>>> Hi Richard.L,
>>>>
>>>> On 1/24/19 3:09 PM, Richard Leitner wrote:
>>>>> Hi,
>>>>> I'm currently facing issues on how to include a fitImage with 
>>>>> devicetrees and a INITRAMFS_IMAGE in my rootfs image.
>>>
>>>
>>> I think that set both INITRAMFS_IMAGE and INITRAMFS_IMAGE_BUNDLE 
>>> should work,
>>> you have set INITRAMFS_IMAGE, so also set:
>>>
>>> INITRAMFS_IMAGE_BUNDLE = "1"
>>
>> That was also my first thought, but unfortunately this doesn't work. 
>> There's still one fitImage and one fitImage-initramfs-mine in the 
>> deploy dir and the one included in the rootfs image has the same 
>> checksum and size as the fitImage without the initramfs.
> 
> Try:
> 
> $ bitbake virtual/kernel -e >kernel.py
> 
> And check INITRAMFS_IMAGE_NAME in kernel.py, make sure it contains 
> initramfs-mine, and try:
> 
> $ bitbake virtual/kernel <your image> -ccleansstate
> $ bitbake <your image>
> 

Both fitImage's get built and deployed in tmp/deploy/images/.

But in tmp/work/../<image>/1.0-r0/rootfs/boot/ there's only the fitImage 
without the initramfs.

Apart from the tmp/deploy dir I "find" the fitImage-initramfs also in:

tmp/work/../linux/.../deploy-linux/
and
tmp/work/../linux/.../deploy-linux/linux-standard-build/arch/arm/boot/

Any more ideas?

regards;Richard.L

