Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id EC461782A8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 10:14:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 03 Nov 2017 03:14:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,338,1505804400"; d="scan'208";a="1033067014"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 03 Nov 2017 03:14:08 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
References: <20171018121423.1310-1-alexander.kanavin@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <264c9619-62e7-ef43-9412-f00e9a1028ba@linux.intel.com>
Date: Fri, 3 Nov 2017 12:14:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171018121423.1310-1-alexander.kanavin@linux.intel.com>
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
X-List-Received-Date: Fri, 03 Nov 2017 10:14:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/18/2017 03:14 PM, Alexander Kanavin wrote:
> Previously oe-core had a development snapshot of rpm, it's better to update
> to something more stable.

Unfortunately, this also breaks grub and grub-efi:

x86_64-poky-linux-musl-objcopy: 
/home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/grub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module(.debug_aranges): 
relocation 1 has invalid symbol index 2053731167
x86_64-poky-linux-musl-objcopy: 
/home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/grub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module: 
invalid relocation type 69
x86_64-poky-linux-musl-objcopy: BFD (GNU Binutils) 2.29.0.20170912 
assertion fail ../../bfd/elf64-x86-64.c:351
x86_64-poky-linux-musl-objcopy: 
/home/ak/development/poky/build-64/tmp/work/core2-64-poky-linux-musl/grub-efi/2.02-r0/package/usr/lib/grub/x86_64-efi/lvm.module(.debug_info): 
relocation 0 has invalid symbol index 1634754402


Khem, any idea where I could start looking to see what's wrong?


Thanks,
Alex

