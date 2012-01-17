Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RnDkq-0000RF-1z
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 19:27:32 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 10:19:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96826188"
Received: from unknown (HELO [10.255.13.216]) ([10.255.13.216])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 10:19:53 -0800
Message-ID: <4F15BBC9.2030707@linux.intel.com>
Date: Tue, 17 Jan 2012 10:19:53 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1326395831-5121-1-git-send-email-koen@dominion.thruhere.net>	<1326737165.2933.7.camel@ted>	<CAGDS+n=HwjOz-QKMDyGy6qKf74WESsUFR-mCUT1HV+qaOzcCfg@mail.gmail.com>
	<1326739512.3367.32.camel@pb-ThinkPad-R50e>
	<4F15A22B.6060004@balister.org>
In-Reply-To: <4F15A22B.6060004@balister.org>
Subject: Re: [Patch v3] gconf: enable gtk+ 2.0 support to build gconf-sanity-check-2
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
X-List-Received-Date: Tue, 17 Jan 2012 18:27:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 17/01/12 08:30, Philip Balister wrote:
> On 01/16/2012 01:45 PM, Phil Blundell wrote:
>> On Mon, 2012-01-16 at 10:19 -0800, Steve Sakoman wrote:
>>> My tested-by was indeed performed with the meta-oe layer enabled.
>>>
>>> In the future I will make clear what layers were used in my testing.
>>>
>>> I fear that this kind of thing is going to bite us repeatedly :-(
>>
>> It's never been entirely clear to me why meta-oe needs to override quite
>> so many bits of oe-core as it does.  I think you're probably right that,
>> as long as it continues to do so, and people enable meta-oe during
>> testing, this sort of issue probably is going to continue to occur.
>
> It sounds like we need to collect a list of bits of oe-core that meta-oe
> overrides and work out a plan to resolve these differences.

Agreed! There have been a couple of efforts for specific recipes, most 
recently udev work from Otavio.

I'd definitely like to see the differences resolved, or at least 
reduced, and will be happy to help work through some of the issues.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


