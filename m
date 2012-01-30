Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rrxfk-0001fO-1G
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 21:17:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jan 2012 12:09:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101255839"
Received: from unknown (HELO [10.255.14.89]) ([10.255.14.89])
	by azsmga001.ch.intel.com with ESMTP; 30 Jan 2012 12:09:57 -0800
Message-ID: <4F26F915.3040307@linux.intel.com>
Date: Mon, 30 Jan 2012 12:09:57 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1327942199-4604-1-git-send-email-koen@dominion.thruhere.net>
	<4F26D85A.8030908@linux.intel.com>
	<6432C232-C013-4AB3-AED2-0ED908B5C30C@dominion.thruhere.net>
In-Reply-To: <6432C232-C013-4AB3-AED2-0ED908B5C30C@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/2] alsa-state: fix RDEPENDS assignment
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
X-List-Received-Date: Mon, 30 Jan 2012 20:17:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2012 10:39 AM, Koen Kooi wrote:
> Op 30 jan. 2012, om 18:50 heeft Joshua Lock het volgende geschreven:
>
>> Yikes, I don't know why I keep making this mistake. Thanks for catching it Koen.
>
> I'm still finding recipes that I wrote that have that mistake :)
>
>> I thought we caught this in a QA error but I definitely didn't see it, best investigate.
>
> it's part of recipe-sanity, which you need to call manually.
>

Time to add that to my checklist!  I have a set of things I am trying to 
remember to do (they don't always get done, but I try) to validate recipes.

Sau!

> regards,
>
> Koen
>
>
>>
>> On 30/01/12 08:49, Koen Kooi wrote:
>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> Signed-off-by: Joshua Lock<josh@linux.intel.com>
>>
>> Joshua
>>
>>> ---
>>>   meta/recipes-bsp/alsa-state/alsa-state.bb |    5 ++---
>>>   1 files changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
>>> index bc17b25..83c9faa 100644
>>> --- a/meta/recipes-bsp/alsa-state/alsa-state.bb
>>> +++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
>>> @@ -10,7 +10,7 @@ sound state at system boot and save it at system shut down."
>>>   LICENSE = "MIT"
>>>   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>>>   PV = "0.2.0"
>>> -PR = "r0"
>>> +PR = "r2"
>>>
>>>   SRC_URI = "\
>>>     file://asound.conf \
>>> @@ -18,8 +18,6 @@ SRC_URI = "\
>>>     file://alsa-state \
>>>   "
>>>
>>> -RDEPENDS = "alsa-utils-alsactl"
>>> -
>>>   inherit update-rc.d
>>>
>>>   INITSCRIPT_NAME = "alsa-state"
>>> @@ -39,6 +37,7 @@ PACKAGES += "alsa-states"
>>>
>>>   RRECOMMENDS_alsa-state = "alsa-states"
>>>
>>> +RDEPENDS_${PN} = "alsa-utils-alsactl"
>>>   FILES_${PN} = "${sysconfdir}/init.d ${sysconfdir}/asound.conf"
>>>   CONFFILES_${PN} = "${sysconfdir}/asound.conf"
>>>
>>
>> --
>> Joshua Lock
>>         Yocto Project "Johannes factotum"
>>         Intel Open Source Technology Centre
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


