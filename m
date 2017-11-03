Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40FFA71975
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 17:58:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA3HwAgO027981
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Nov 2017 10:58:10 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 3 Nov 2017 10:58:09 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20171018121423.1310-1-alexander.kanavin@linux.intel.com>
	<264c9619-62e7-ef43-9412-f00e9a1028ba@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <634edf6c-23d9-1dbf-6c51-caef2f30c06f@windriver.com>
Date: Fri, 3 Nov 2017 12:58:09 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <264c9619-62e7-ef43-9412-f00e9a1028ba@linux.intel.com>
Subject: Re: [PATCH] rpm: update to 4.14.0
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
X-List-Received-Date: Fri, 03 Nov 2017 17:58:10 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/3/17 5:14 AM, Alexander Kanavin wrote:
> On 10/18/2017 03:14 PM, Alexander Kanavin wrote:
>> Previously oe-core had a development snapshot of rpm, it's better to update
>> to something more stable.
> 
> Unfortunately, this also breaks grub and grub-efi:
> 
> x86_64-poky-linux-musl-objcopy: 
> /home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/grub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module(.debug_aranges): 
> relocation 1 has invalid symbol index 2053731167
> x86_64-poky-linux-musl-objcopy: 
> /home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/grub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module: 
> invalid relocation type 69
> x86_64-poky-linux-musl-objcopy: BFD (GNU Binutils) 2.29.0.20170912 
> assertion fail ../../bfd/elf64-x86-64.c:351
> x86_64-poky-linux-musl-objcopy: 
> /home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/grub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module(.debug_info): 
> relocation 0 has invalid symbol index 1634754402
> 

Look at debugedit.  This is the program used to adjust some of the debug references.

--Mark

> Khem, any idea where I could start looking to see what's wrong?
> 
> 
> Thanks,
> Alex
> 


