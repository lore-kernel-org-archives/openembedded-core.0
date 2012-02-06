Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RuTV9-000876-BH
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 19:41:19 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2012 10:33:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="104618045"
Received: from unknown (HELO [10.7.199.63]) ([10.7.199.63])
	by orsmga001.jf.intel.com with ESMTP; 06 Feb 2012 10:33:17 -0800
Message-ID: <4F301CEC.3080109@linux.intel.com>
Date: Mon, 06 Feb 2012 10:33:16 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1328208481.git.josh@linux.intel.com>
	<2e86c284dea7b710d380d262e1a76b79b530b422.1328208481.git.josh@linux.intel.com>
	<4092F86B-459F-45ED-B7B1-1198B2D6A992@dominion.thruhere.net>
	<4F2ADCF6.4030000@linux.intel.com>
	<4F2C1621.2050401@linux.intel.com>
	<9E253355-84DD-410B-98FA-D7D9A0AD22EA@dominion.thruhere.net>
In-Reply-To: <9E253355-84DD-410B-98FA-D7D9A0AD22EA@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] netbase: make netbase recipe MACHINE specific for all targets
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
X-List-Received-Date: Mon, 06 Feb 2012 18:41:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/02/12 08:07, Koen Kooi wrote:
>
> Op 3 feb. 2012, om 18:15 heeft Darren Hart het volgende geschreven:
>
>>
>>
>> On 02/02/2012 10:59 AM, Joshua Lock wrote:
>>> On 02/02/12 10:54, Koen Kooi wrote:
>>>>
>>>> Op 2 feb. 2012, om 19:51 heeft Joshua Lock het volgende
>>>> geschreven:
>>>>
>>>>> Several BSP's are appending netbase to add MACHINE specific
>>>>> networking functionality. Rather than BSP creators having to
>>>>> mark netbase MACHINE specific just default to PACKAGE_ARCH =
>>>>> "${MACHINE_ARCH}" in netbase.
>>>>>
>>>>> This shouldn't be a huge hit as netbase just copies files
>>>>> around.
>>>>
>>>> In the past OE would mark things machine specific if something in
>>>> SRC_URI was fetched using overrides. So it this patches fixed
>>>> netbase the 'old' mechanism is broken :(
>>>
>>> This patch doesn't fix netbase, I just thought it would be simpler to
>>> make this change than ensure all BSP's use appropriate OVERRIDEs in
>>> their netbase bbappends - several I've seen don't.
>>>
>>
>> Is there a consensus on whether or not this can go in? I need either
>> this or the BSP layer fix for a new BSP. It seems to me that netbase is
>> overridden enough for machine specific things (like the interface file)
>> that Joshua's approach is the better fix.
>
> It all depends on how much crap in BSPs you want to fix up in OE-core. Where are you going to draw the line?

I understand you don't like this change but I don't really understand why?

My intention with the patch is to make it easier for folks to produce 
BSP's which don't introduce bugs into other builds for the same 
architecture.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


