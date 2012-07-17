Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SrDwQ-0003sC-IN
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 22:00:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Jul 2012 12:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="167575434"
Received: from btwarden-mobl1.amr.corp.intel.com (HELO envy.home)
	([10.7.199.60])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2012 12:48:36 -0700
Message-ID: <5005C134.4080805@linux.intel.com>
Date: Tue, 17 Jul 2012 12:47:00 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1342549867.git.dvhart@linux.intel.com>
	<da4bea17ffc6284a462e33b142ec17bd6f15f2ac.1342549867.git.dvhart@linux.intel.com>
	<5005BFA6.5050809@linux.intel.com>
In-Reply-To: <5005BFA6.5050809@linux.intel.com>
X-Enigmail-Version: 1.4.2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] EFI: Make installer EFI aware
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 20:00:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/17/2012 12:40 PM, Saul Wold wrote:
> On 07/17/2012 12:29 PM, Darren Hart wrote:

>> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
>> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
>> @@ -3,7 +3,7 @@ DESCRIPTION = "Small image capable of booting a device. The kernel includes \
>>   the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
>>   first “init” program more efficiently."
>>
>> -IMAGE_INSTALL = "initramfs-live-boot initramfs-live-install busybox udev base-passwd"
>> +IMAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi busybox udev base-passwd"
>>
>>   # Do not pollute the initrd image with rootfs features
>>   IMAGE_FEATURES = ""
> 
> Does this now need a PR bump also?

I didn't think so as this recipe is rebuilt for every image anyway.
There is no PR in this recipe.

>> diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
>> new file mode 100644
>> index 0000000..6696d94
>> --- /dev/null
>> +++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
>> @@ -0,0 +1,22 @@
>> +DESCRIPTION = "A live image init script for grub-efi"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> +SRC_URI = "file://init-install-efi.sh"
>> +
>> +PR = "r7"
>> +
> Why PR = r7 for a new recipe, there should be no PR as it defaults to r0?

Good catch, just my forcing rebuilds during development, or perhaps a
left-over copy from the initramfs-live-install_1.0.bb I based it on.
Updated as r0 in the branch.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




