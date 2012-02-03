Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RtMrl-0003VG-6q
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 18:24:05 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Feb 2012 09:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="62968028"
Received: from unknown (HELO envy.home) ([10.255.14.155])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Feb 2012 09:16:05 -0800
Message-ID: <4F2C1621.2050401@linux.intel.com>
Date: Fri, 03 Feb 2012 09:15:13 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1328208481.git.josh@linux.intel.com>
	<2e86c284dea7b710d380d262e1a76b79b530b422.1328208481.git.josh@linux.intel.com>
	<4092F86B-459F-45ED-B7B1-1198B2D6A992@dominion.thruhere.net>
	<4F2ADCF6.4030000@linux.intel.com>
In-Reply-To: <4F2ADCF6.4030000@linux.intel.com>
X-Enigmail-Version: 1.3.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Fri, 03 Feb 2012 17:24:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/02/2012 10:59 AM, Joshua Lock wrote:
> On 02/02/12 10:54, Koen Kooi wrote:
>> 
>> Op 2 feb. 2012, om 19:51 heeft Joshua Lock het volgende
>> geschreven:
>> 
>>> Several BSP's are appending netbase to add MACHINE specific 
>>> networking functionality. Rather than BSP creators having to
>>> mark netbase MACHINE specific just default to PACKAGE_ARCH =
>>> "${MACHINE_ARCH}" in netbase.
>>> 
>>> This shouldn't be a huge hit as netbase just copies files
>>> around.
>> 
>> In the past OE would mark things machine specific if something in
>> SRC_URI was fetched using overrides. So it this patches fixed
>> netbase the 'old' mechanism is broken :(
> 
> This patch doesn't fix netbase, I just thought it would be simpler to
>  make this change than ensure all BSP's use appropriate OVERRIDEs in
>  their netbase bbappends - several I've seen don't.
> 

Is there a consensus on whether or not this can go in? I need either
this or the BSP layer fix for a new BSP. It seems to me that netbase is
overridden enough for machine specific things (like the interface file)
that Joshua's approach is the better fix.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


