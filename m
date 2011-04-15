Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QArlz-00073q-21
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 00:45:55 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 873EC16603B2; Fri, 15 Apr 2011 16:43:37 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id A4CCA1660389;
	Fri, 15 Apr 2011 16:43:36 -0600 (MDT)
Message-ID: <4DA8CA18.3000801@mlbassoc.com>
Date: Fri, 15 Apr 2011 16:43:36 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1302886579.git.paul.eggleton@linux.intel.com>	<72ccbf03bcbec48a34d830c356e591a9139e3794.1302886579.git.paul.eggleton@linux.intel.com>
	<4DA8C8C0.4060403@linux.intel.com>
In-Reply-To: <4DA8C8C0.4060403@linux.intel.com>
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
X-List-Received-Date: Fri, 15 Apr 2011 22:45:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/15/2011 04:37 PM, Darren Hart wrote:
>
>
> On 04/15/2011 10:00 AM, Paul Eggleton wrote:
>> From: Paul Eggleton<paul.eggleton@linux.intel.com>
>>
>> Avoids manual configuration of the BeagleBoard xM's ethernet port (which
>> shows up as usb0).
>>
>> Fixes [YOCTO #930]
>>
>> Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>
>> ---
>>   .../netbase/netbase-4.45/beagleboard/interfaces    |   27 ++++++++++++++++++++
>>   1 files changed, 27 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces
>>
>> diff --git a/meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces b/meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces
>> new file mode 100644
>> index 0000000..b6935c1
>> --- /dev/null
>> +++ b/meta/recipes-core/netbase/netbase-4.45/beagleboard/interfaces
>> @@ -0,0 +1,27 @@
>> +# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
>> +
>> +# The loopback interface
>> +auto lo
>> +iface lo inet loopback
>> +
>> +# Wireless interfaces
>> +iface wlan0 inet dhcp
>> +	wireless_mode managed
>> +	wireless_essid any
>> +	wpa-driver wext
>> +	wpa-conf /etc/wpa_supplicant.conf
>> +
>> +iface atml0 inet dhcp
>> +
>> +# Wired or wireless interfaces
>> +auto eth0
>> +iface eth0 inet dhcp
>> +iface eth1 inet dhcp
>
> Since we're adding a this specifically for the beagleboard, I don't see
> the value of adding eth0 or eth1. I'm not sure about wifi and bluetooth,
> I believe there are modules out there.

eth1 yes, but doesn't the BeagleBoard xM have eth0?

>
> I suppose it doesn't hurt to have them there as examples.
>
>> +
>> +# Ethernet/RNDIS gadget (g_ether) or LAN9514 on BeagleBoard xM
>> +auto usb0
>> +iface usb0 inet dhcp
>> +
>> +# Bluetooth networking
>> +iface bnep0 inet dhcp
>> +
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


