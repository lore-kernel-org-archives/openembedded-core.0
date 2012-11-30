Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TeW9B-0004ce-Ez
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 20:21:13 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Nov 2012 11:06:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,192,1355126400"; d="scan'208";a="255674322"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2012 11:06:53 -0800
Message-ID: <50B903CD.6070701@linux.intel.com>
Date: Fri, 30 Nov 2012 11:06:53 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1353509074-16375-1-git-send-email-koen@dominion.thruhere.net>
	<4294A763-939F-4201-BF2A-DE11519DD740@dominion.thruhere.net>
In-Reply-To: <4294A763-939F-4201-BF2A-DE11519DD740@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image classes: use PN for depends, not IMAGE_BASE_NAME
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
X-List-Received-Date: Fri, 30 Nov 2012 19:21:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/2012 08:39 AM, Koen Kooi wrote:
> ping
>
Koen,

It's been in master for a few days now, we kind of fell behind on email 
ACKs.

Sau!

> Op 21 nov. 2012, om 15:44 heeft Koen Kooi <koen@dominion.thruhere.net> het volgende geschreven:
>
>> Some images override IMAGE_BASE_NAME in the recipe causing targets using image-{live,vmdk} to fail.
>>
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/classes/image-live.bbclass |    2 +-
>> meta/classes/image-vmdk.bbclass |    2 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
>> index 2f3261e..bfb59f8 100644
>> --- a/meta/classes/image-live.bbclass
>> +++ b/meta/classes/image-live.bbclass
>> @@ -10,6 +10,6 @@ LABELS_append = " ${SYSLINUX_LABELS} "
>> ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
>>
>> do_bootimg[depends] += "${INITRD_IMAGE}:do_rootfs"
>> -do_bootimg[depends] += "${IMAGE_BASENAME}:do_rootfs"
>> +do_bootimg[depends] += "${PN}:do_rootfs"
>>
>> inherit bootimg
>> diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
>> index 736d1d7..6f7df3f 100644
>> --- a/meta/classes/image-vmdk.bbclass
>> +++ b/meta/classes/image-vmdk.bbclass
>> @@ -8,7 +8,7 @@ SYSLINUX_LABELS = "boot"
>> LABELS_append = " ${SYSLINUX_LABELS} "
>>
>> # need to define the dependency and the ROOTFS for directdisk
>> -do_bootdirectdisk[depends] += "${IMAGE_BASENAME}:do_rootfs"
>> +do_bootdirectdisk[depends] += "${PN}:do_rootfs"
>> ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
>>
>> # creating VMDK relies on having a live hddimg so ensure we
>> --
>> 1.7.7.6
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


