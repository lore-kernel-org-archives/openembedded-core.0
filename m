Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UXeHa-0000Ew-UK
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 23:09:55 +0200
Received: from [192.168.0.2] (host86-131-182-26.range86-131.btcentralplus.com
	[86.131.182.26]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 82E58952B;
	Wed,  1 May 2013 21:51:56 +0100 (BST)
Message-ID: <5181806C.4070708@r-finger.com>
Date: Wed, 01 May 2013 21:51:56 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1366991439-14728-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1367052737-8519-1-git-send-email-tf+lists.yocto@r-finger.com>
	<51817A25.6050009@linux.intel.com>
In-Reply-To: <51817A25.6050009@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ia32-base.inc: remove inapropriate grub dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 May 2013 21:10:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/05/13 21:25, Darren Hart wrote:
> 
> 
> On 04/27/2013 01:52 AM, tf+lists.yocto@r-finger.com wrote:
>> From: Tomas Frydrych <tomas@sleepfive.com>
>>
>> There is no good reason for ia32 machines to have hard dependency on grub,
>> as there are other bootloaders available for ia32 platforms.
>>
>> Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
>> ---
>>  meta/conf/machine/include/ia32-base.inc |    1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
>> index 921c740..cb542a5 100644
>> --- a/meta/conf/machine/include/ia32-base.inc
>> +++ b/meta/conf/machine/include/ia32-base.inc
>> @@ -9,7 +9,6 @@ MACHINE_FEATURES += "screen keyboard pci usbhost ext2 ext3 x86 \
>>                       acpi serial usbgadget alsa"
>>  
>>  MACHINE_EXTRA_RRECOMMENDS += "kernel-modules eee-acpi-scripts"
>> -MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "grub"
> 
> Agreed - but do the images still build as currently written after you
> remove it here?

I have not tested the efi path, though I think the grub-efi.bbclass
takes care of the grub dependency. In the non-efi case the grub
dependency is taken care of by initramfs-live-install.bb.

Tomas


-- 
http://sleepfive.com


