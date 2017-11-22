Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8FF786F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 22:49:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2017 14:49:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,438,1505804400"; 
   d="scan'208";a="5353991"
Received: from davidsol-mobl.amr.corp.intel.com (HELO [10.252.250.52])
	([10.252.250.52])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2017 14:49:33 -0800
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20171122170930.1861-1-alejandro.hernandez@linux.intel.com>
	<CAP9ODKoqySKd=NPbp-0d+EBZ9Evk=ZKG0Te7AykOQE+Bp4z2WA@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <a207bf86-a7f4-275c-ad1f-4af463827acb@linux.intel.com>
Date: Wed, 22 Nov 2017 16:49:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoqySKd=NPbp-0d+EBZ9Evk=ZKG0Te7AykOQE+Bp4z2WA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-live-boot-tiny: Create the initramfs-live-boot-tiny recipe
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
X-List-Received-Date: Wed, 22 Nov 2017 22:49:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Certainly, I can set that up as one of my ToDo features for this release.


On 11/22/2017 02:42 PM, Otavio Salvador wrote:
> On Wed, Nov 22, 2017 at 3:09 PM, Alejandro Hernandez
> <alejandro.hernandez@linux.intel.com> wrote:
>> The original initramfs-live-boot recipe RDEPENDS on udev, which is ok since
>> the init script relies some of its functionality on udevadm and such,
>> but on core-image-tiny-initramfs the init script simply drops to shell
>> after a basic setup, so udev is not needed.
>>
>> This patch splits up an initramfs-live-boot-tiny recipe which does not
>> use udev, but uses busybox-mdev instead, eudev installed about 600
>> extra Kilobytes to core-image-tiny-initramfs userspace, by avoiding to
>> install eudev we achieve an even smaller footprint (almost 40% smaller).
>>
>> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
> It'd be nice if you could migrate to initramfs-framework as it
> provides mdev module and has part of this already done.
>


