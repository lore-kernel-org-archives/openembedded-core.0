Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 97BC0748E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 13:12:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2018 06:12:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,410,1520924400"; d="scan'208";a="42029390"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 17 May 2018 06:12:18 -0700
To: Marek Vasut <marek.vasut@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <20180517021314.0C556440002@auh.yoctoproject.org>
	<b3a862cb-5561-22a8-f620-3796469559e3@gmail.com>
	<CAJTo0LZZyB+uHpECahdUZXA0v2ujGu0eo2TTHhnutY5EJiQegQ@mail.gmail.com>
	<3fab3122-1ddd-d70a-2d3f-00a1e436be4b@linux.intel.com>
	<8c49ac0d-e52e-505b-d6c2-688ca7b3fb6e@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0df38331-afdf-b47c-410e-6640c74e8b14@linux.intel.com>
Date: Thu, 17 May 2018 16:04:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <8c49ac0d-e52e-505b-d6c2-688ca7b3fb6e@gmail.com>
Cc: auh@auh.yoctoproject.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] u-boot-mkimage: upgrading to 2018.05 FAILED
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
X-List-Received-Date: Thu, 17 May 2018 13:12:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/17/2018 01:33 PM, Marek Vasut wrote:
>>> Looks like AUH runs as a x86 machine, which is why it doesn't catch
>>> u-boot.
>>
>> Also we have already discussed this 2 month ago. Marek, as the u-boot
>> maintainer, can you look into enabling u-boot on qemu please?
> 
> Wouldn't it make more sense to fix the AUH so it handles U-Boot and
> similar packages correctly even without the qemu dependency ?

Determining the latest upstream version, performing the recipe upgrade, 
and testing that the upgraded version builds are all done by calling 
bitbake. Which of course requires that MACHINE is set to something 
specific, in this case qemux86. As u-boot is disabled there, it gets 
skipped. I could special-case u-boot, but I do think it's better to 
enable it on qemu, which would also allow better AB testing across 
architectures and during runtime (booting images) for instance.

Alex



