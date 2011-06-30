Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QcQPw-0004Jn-R4
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 01:13:05 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jun 2011 16:09:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,455,1304319600"; d="scan'208";a="24955545"
Received: from swold-mobl.jf.intel.com (HELO [10.24.82.35]) ([10.24.82.35])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2011 16:09:05 -0700
Message-ID: <4E0D0211.5040102@linux.intel.com>
Date: Thu, 30 Jun 2011 16:09:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307895912.git.koen@dominion.thruhere.net>	<1703bd12b68b86a3d73fe39e9fd9369ac0b027ca.1307895912.git.koen@dominion.thruhere.net>
	<29375D62-544F-457B-8393-79BF9DDA54BA@dominion.thruhere.net>
In-Reply-To: <29375D62-544F-457B-8393-79BF9DDA54BA@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/2] qemu.inc: append to IMAGE_FSTYPES instead of weakly assigning them
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
X-List-Received-Date: Thu, 30 Jun 2011 23:13:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/30/2011 03:33 PM, Koen Kooi wrote:
> ping
>
I believe that this has been discussed elsewhere.

Sau!

> Op 12 jun 2011, om 18:26 heeft Koen Kooi het volgende geschreven:
>
>> The ext3 format is pretty much mandatory for qemu usage, so always create it.
>>
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> ---
>> meta/conf/machine/include/qemu.inc |    2 +-
>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
>> index 9ef242f..e908f69 100644
>> --- a/meta/conf/machine/include/qemu.inc
>> +++ b/meta/conf/machine/include/qemu.inc
>> @@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-kdrive"
>>
>> MACHINE_FEATURES = "kernel26 apm alsa pcmcia bluetooth irda usbgadget screen"
>>
>> -IMAGE_FSTYPES ?= "tar.bz2 ext3"
>> +IMAGE_FSTYPES += "tar.bz2 ext3"
>>
>> ROOT_FLASH_SIZE = "280"
>>
>> --
>> 1.6.6.1
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


