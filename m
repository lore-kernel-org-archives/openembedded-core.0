Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rpphw-00080h-Rf
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 00:23:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Jan 2012 15:15:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="100191511"
Received: from unknown (HELO [10.255.14.34]) ([10.255.14.34])
	by orsmga001.jf.intel.com with ESMTP; 24 Jan 2012 15:15:33 -0800
Message-ID: <4F1F3B95.4070105@linux.intel.com>
Date: Tue, 24 Jan 2012 15:15:33 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1326481387.git.josh@linux.intel.com>
	<09C174D7-2741-4099-BBA1-861E3608EB98@dominion.thruhere.net>
In-Reply-To: <09C174D7-2741-4099-BBA1-861E3608EB98@dominion.thruhere.net>
Subject: Re: [PATCH 0/4] Add alsa-state from OE Classic v3
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
X-List-Received-Date: Tue, 24 Jan 2012 23:23:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 24/01/12 07:02, Koen Kooi wrote:
>
> Op 13 jan. 2012, om 20:10 heeft Joshua Lock het volgende geschreven:
>
>> The small series which follows introduces the alsa-state recipe from oe-classic.
>> The reason for doing so is to remove the requirement for recipes like the
>> beagleboard-audio recipe in meta-yocto, which ensures the beagleboards sound
>> device has the volume turned up.
>>
>> Long term I'd like to implement something more generic for handling device
>> quirks, but alsa-state is a simple fix for an immediate need that should
>> standardise how alsa configuration is handled in layers.
>
> FWIW, alsa-lib itself includes initscripts to do this. I dropped asound.state in /var/lib/alsa and it just worked since alsactl also installs systemd units to handle this. So alsa-state can just hold the config files and drop the initscripts by the looks of it.

Thanks for raising this, I hadn't seen that alsa-utils provides some 
extras with alsactl.

Taking a quick look I see that they ship systemd units for state save 
and restore and a udev rule for restoring the state.

I can't see any initscript, so I think switching to what's provided by 
alsa-utils would mean losing state saving for non-systemd folk but 
systemd users can probably just set VIRTUAL-RUNTIME_alsa-state = 
"alsa-utils-alsactl".

I am an alsa newb so if I'm missing something please point me at it.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


