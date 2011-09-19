Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R5lLX-0007PI-Q8
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 23:25:48 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Sep 2011 14:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,407,1312182000"; d="scan'208";a="50590859"
Received: from unknown (HELO [10.255.14.150]) ([10.255.14.150])
	by azsmga001.ch.intel.com with ESMTP; 19 Sep 2011 14:20:28 -0700
Message-ID: <4E77B21C.4050806@linux.intel.com>
Date: Mon, 19 Sep 2011 14:20:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1316454869.git.sgw@linux.intel.com>	<c61c00e6f90ad71f8a111d502e228af7be0a7838.1316454869.git.sgw@linux.intel.com>	<4E77927A.4020402@windriver.com>
	<A0C53D3F-D82B-46D0-B173-D81B7BC791AB@dominion.thruhere.net>
In-Reply-To: <A0C53D3F-D82B-46D0-B173-D81B7BC791AB@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] avahi: Check for GPLv3 license and	disable x11
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
X-List-Received-Date: Mon, 19 Sep 2011 21:25:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2011 12:21 PM, Koen Kooi wrote:
>
> Op 19 sep. 2011, om 21:05 heeft Mark Hatle het volgende geschreven:
>
>> On 9/19/11 12:55 PM, Saul Wold wrote:
>>> [YOCTO #1492]
>>>
>>> Since the non-GPLv3 build does not want gnome, which this will pull in
>>> by the default DISTRO_FEATURE x11 being set and enabling gtk for avahi,
>>> we filter x11 out of DISTRO_FEATURES here when INCOMPATIBLE_LICENSE is
>>> set to GPLv3.
>>
>> If the avahi GTK UI app is needed when X11 is enabled, this should be a decent
>> enough way to work around the condition.
>>
>> However, I question if avahi should -ever- be producing the gtk component.
>>
>>  From the investigation I did, the gtk component is something that helps with
>> discovering mDNS servers (either prompting the user or simply displaying status,
>> I'm not sure).  Is this of use to anyone using oe-core?  Otherwise I'd be in
>> favor of simply removing the X11 option from the avahi package.
>>
>> (I talked with Saul about this already on IRC.. he's concerned that we'd be
>> turning of required [by someone] functionality... I'm really not sure it is
>> required by anyone...)
>
> In OE classic the UI stuff in in avahi-ui.bb
Clearly, a better way to go, I think my patch will work for the short 
term of 1.1 release, but for master moving forward I will integrate the 
avahi-ui.bb recipe. We just don't have the time for a major recipe re-write.

Sau!

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


