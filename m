Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Tyt7q-0000MT-6s
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Jan 2013 00:56:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2013 15:40:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,541,1355126400"; d="scan'208";a="252661910"
Received: from envy.jf.intel.com (HELO envy.home) ([10.7.199.79])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2013 15:40:26 -0800
Message-ID: <510317E8.4060604@linux.intel.com>
Date: Fri, 25 Jan 2013 15:40:24 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1359155139-947-1-git-send-email-sgw@linux.intel.com>
	<51031477.3010101@linux.intel.com>
	<5103163C.1040303@linux.intel.com>
In-Reply-To: <5103163C.1040303@linux.intel.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] poky-tiny: Update for DISTRO_FEATURES_INITMAN
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
X-List-Received-Date: Fri, 25 Jan 2013 23:56:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 01/25/2013 03:33 PM, Saul Wold wrote:
> On 01/25/2013 03:25 PM, Darren Hart wrote:
>> On 01/25/2013 03:05 PM, Saul Wold wrote:
>>> This patch accounts for the addition of DISTRO_FEATURES_INITMAN which
>>> sets the VIRTUAL_RUNTIME_init_manager, so that does not need to be set.
>>>
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>
>>
>> I thought I understood it... until I read the new comment. What is this
>> DISTRO_FEATURED_BACKFILL thing?
>>
> It ensure that items in the backfill show up in all DISTRO_FEATURES, 
> think of it as a required core part of DISTRO_FEATURES.
> 
> See Git Rev: 72ce5c4cde612515451226a1b10f5b348a4a6a4c for a better 
> explanation from Paul.
> 

OK, I see how it works, but I think that comment confuses more than it
enlightens. I don't need to know anything about BACKFILL to understand
the meaning of DISTRO_FEATURES_INITMAN. It clearly overrides the init
manager used for images of this distro. I suggest dropping the Backfill
comment.

As for the actual change, it looks good to me, and thanks for doing it.
Does this remove the unwanted bash dependency?

--
Darren

> Re-reading this we should include pulseaudio in 
> DISTRO_FEATURES_BACKFILL_CONSIDERED for poky-tiny as a separate patch
> 
> 
> Sau!
> 
>> --
>> Darren
>>
>>> ---
>>>   meta-yocto/conf/distro/poky-tiny.conf |    3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
>>> index 347280a..761844f 100644
>>> --- a/meta-yocto/conf/distro/poky-tiny.conf
>>> +++ b/meta-yocto/conf/distro/poky-tiny.conf
>>> @@ -84,6 +84,8 @@ DISTRO_FEATURES_NET = "ipv4"
>>>   DISTRO_FEATURES_USB = "usbhost"
>>>   #DISTRO_FEATURES_USBGADGET = "usbgadget"
>>>   #DISTRO_FEATURES_WIFI = "wifi"
>>> +# This is needed for DISTRO_FEATURES_BACKFILL
>>> +DISTRO_FEATURES_INITMAN = "tiny-init"
>>>
>>>   DISTRO_FEATURES = "${DISTRO_FEATURES_TINY} \
>>>                      ${DISTRO_FEATURES_NET} \
>>> @@ -96,7 +98,6 @@ DISTRO_FEATURES = "${DISTRO_FEATURES_TINY} \
>>>   # Use tmpdevfs and the busybox runtime services
>>>   VIRTUAL-RUNTIME_dev_manager = ""
>>>   VIRTUAL-RUNTIME_login_manager = ""
>>> -VIRTUAL-RUNTIME_init_manager = "tiny-init"
>>>   VIRTUAL-RUNTIME_keymaps = ""
>>>
>>>   # FIXME: Consider adding "modules" to MACHINE_FEATURES and using that in
>>>
>>

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


