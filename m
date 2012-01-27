Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rqqyn-00063e-FR
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 19:56:57 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jan 2012 10:49:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100450233"
Received: from unknown (HELO [10.255.14.110]) ([10.255.14.110])
	by azsmga001.ch.intel.com with ESMTP; 27 Jan 2012 10:49:06 -0800
Message-ID: <4F22F1A2.7040602@linux.intel.com>
Date: Fri, 27 Jan 2012 10:49:06 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1326481387.git.josh@linux.intel.com>
	<09C174D7-2741-4099-BBA1-861E3608EB98@dominion.thruhere.net>
	<4F1F3B95.4070105@linux.intel.com>
	<CAP9ODKqEgTQ1aRLUU=Db9vc3PfR1L=hWsBnTcKKMuWUazrPSjg@mail.gmail.com>
	<E10B6388-7C66-4790-9666-A7C97D9EF238@dominion.thruhere.net>
In-Reply-To: <E10B6388-7C66-4790-9666-A7C97D9EF238@dominion.thruhere.net>
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
X-List-Received-Date: Fri, 27 Jan 2012 18:56:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 27/01/12 00:00, Koen Kooi wrote:
>
> Op 27 jan. 2012, om 00:09 heeft Otavio Salvador het volgende geschreven:
>
>> On Tue, Jan 24, 2012 at 21:15, Joshua Lock<josh@linux.intel.com>  wrote:
>> I can't see any initscript, so I think switching to what's provided by alsa-utils would mean losing state saving for non-systemd folk but systemd users can probably just set VIRTUAL-RUNTIME_alsa-state = "alsa-utils-alsactl".
>>
>> You still needs the state. So I think we'd need to have a specific -systemd version of it when the configs and the units.

Quite right, we should separate the state files. I wasn't thinking 
straight there.

>
> I was thinking of splitting the existing recipe into alsa-state-conf for the conf files and keep the init stuff in ${PN}. As a follow on patch we can have alsa-utils-alsactl RRECOMMEND alsa-state-conf.
>
> thoughts?

Sounds good to me. I'd like to see what Martin thinks, as he rose the 
initial concern re: the VIRTUAL_RUNTIME. Hopefully SHR would also like 
the state files separate and more centrally maintained.

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


