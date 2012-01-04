Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RiFEH-0004NZ-GW
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 02:01:21 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2012 16:54:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108460476"
Received: from unknown (HELO [10.255.13.92]) ([10.255.13.92])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jan 2012 16:53:59 -0800
Message-ID: <4F03A327.7090608@linux.intel.com>
Date: Tue, 03 Jan 2012 16:53:59 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1325557342.git.josh@linux.intel.com>
	<4F03A094.3050803@linux.intel.com>
In-Reply-To: <4F03A094.3050803@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/2] Add alsa-state from OE Classic
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
X-List-Received-Date: Wed, 04 Jan 2012 01:01:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/12 16:43, Saul Wold wrote:
> On 01/02/2012 06:26 PM, Joshua Lock wrote:
>> Please review the following changes for suitability for inclusion. If
>> you have
>> any objections or suggestions for improvement, please respond to the
>> patches. If
>> you agree with the changes, please provide your Acked-by.
>>
>> The small series following introduces the alsa-state recipe from
>> oe-classic.
>> The reason for doing so is to remove the requirement for recipes like the
>> beagleboard-audio recipe in meta-yocto, which ensures the beagleboards
>> sound
>> device has the volume turned up.
>>
>> Long term I'd like to implement something more generic for handling
>> device quirks,
>> but alsa-state is a simple fix for an immediate need that should
>> standardise how
>> alsa configuration is handled in layers.
>>
> Will this address the similar issue that the n450-audio recipe does in
> the meta-intel layer? The n450 seems to use amixer and not alsactl.

That's the intent. The beagleboard-audio recipe in meta-yocto also uses 
amixer not alsactl but alsactl and the alsa-state recipe offers more 
functionality IMHO (and fewer dependencies iirc).

>
> And if so, can you provide a patch for meta-intel?

Can do, I've already got one for meta-yocto prepared but was waiting for 
some C's before submitting.

Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


