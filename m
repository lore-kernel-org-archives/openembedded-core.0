Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QAs3J-0007Wx-Jg
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 01:03:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Apr 2011 16:01:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,222,1301900400"; d="scan'208";a="629493925"
Received: from unknown (HELO [10.255.12.222]) ([10.255.12.222])
	by orsmga002.jf.intel.com with ESMTP; 15 Apr 2011 16:01:30 -0700
Message-ID: <4DA8CE4A.6090408@linux.intel.com>
Date: Fri, 15 Apr 2011 16:01:30 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Gary Thomas <gary@mlbassoc.com>
References: <cover.1302886579.git.paul.eggleton@linux.intel.com>	<72ccbf03bcbec48a34d830c356e591a9139e3794.1302886579.git.paul.eggleton@linux.intel.com>
	<4DA8C8C0.4060403@linux.intel.com> <4DA8CA18.3000801@mlbassoc.com>
In-Reply-To: <4DA8CA18.3000801@mlbassoc.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, poky@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 2/3] netbase: automatically bring up usb0	on	beagleboard
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
X-List-Received-Date: Fri, 15 Apr 2011 23:03:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/15/2011 03:43 PM, Gary Thomas wrote:
> On 04/15/2011 04:37 PM, Darren Hart wrote:
>>
>>
>> On 04/15/2011 10:00 AM, Paul Eggleton wrote:
>>> From: Paul Eggleton<paul.eggleton@linux.intel.com>
>>>
>>> Avoids manual configuration of the BeagleBoard xM's ethernet port (which
>>> shows up as usb0).
>>>
>>> Fixes [YOCTO #930]
>>>
>>> Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>
>>> ---
>>>   .../netbase/netbase-4.45/beagleboard/interfaces    |   27 ++++++++++++++++++++
>>>   1 files changed, 27 insertions(+), 0 deletions(-)
>>>   create mode 100644 meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces
>>>
>>> diff --git a/meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces b/meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces
>>> new file mode 100644
>>> index 0000000..b6935c1
>>> --- /dev/null
>>> +++ b/meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces
>>> @@ -0,0 +1,27 @@
>>> +# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
>>> +
>>> +# The loopback interface
>>> +auto lo
>>> +iface lo inet loopback
>>> +
>>> +# Wireless interfaces
>>> +iface wlan0 inet dhcp
>>> +	wireless_mode managed
>>> +	wireless_essid any
>>> +	wpa-driver wext
>>> +	wpa-conf /etc/wpa_supplicant.conf
>>> +
>>> +iface atml0 inet dhcp
>>> +
>>> +# Wired or wireless interfaces
>>> +auto eth0
>>> +iface eth0 inet dhcp
>>> +iface eth1 inet dhcp
>>
>> Since we're adding a this specifically for the beagleboard, I don't see
>> the value of adding eth0 or eth1. I'm not sure about wifi and bluetooth,
>> I believe there are modules out there.
> 
> eth1 yes, but doesn't the BeagleBoard xM have eth0?

No. The onboard device is usb0.

--
Darren

> 
>>
>> I suppose it doesn't hurt to have them there as examples.
>>
>>> +
>>> +# Ethernet/RNDIS gadget (g_ether) or LAN9514 on BeagleBoard xM
>>> +auto usb0
>>> +iface usb0 inet dhcp
>>> +
>>> +# Bluetooth networking
>>> +iface bnep0 inet dhcp
>>> +
>>
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


