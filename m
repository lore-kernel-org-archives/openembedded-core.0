Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SgMxo-0003JG-Q3
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 23:24:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jun 2012 14:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="166732221"
Received: from unknown (HELO helios.localnet) ([10.252.120.142])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2012 14:14:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 17 Jun 2012 22:14:09 +0100
Message-ID: <2995235.0tdnUIKyVU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <5351B318-5055-410D-91E9-7A0460FC451D@dominion.thruhere.net>
References: <cover.1339799869.git.dvhart@linux.intel.com>
	<4FDCFEFB.3090004@linux.intel.com>
	<5351B318-5055-410D-91E9-7A0460FC451D@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] busybox: Include setsid and cttyhack in defconfig
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
X-List-Received-Date: Sun, 17 Jun 2012 21:24:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 16 June 2012 21:41:53 Koen Kooi wrote:
> Op 16 jun. 2012, om 16:47 heeft Darren Hart het volgende geschreven:
> > Note that poky-tiny is not currently in its own layer, but is included
> > in the meta-intel layer. I will look into ways to accomplish this
> > without adding to the core busybox config and not having to break out
> > poky-tiny into its own layer.
> 
> What is it with you intel folks (bless their hearts) wanting to combine BSP
> and distro? baerion, guacamayo and poky-tiny all force you to include the
> distro stuff if you want any of their recipes. I don't want to have all the
> hostnames on my boards changed to 'baerion' when I build mediatomb!

All of these efforts are separate and put together by different people.

Firstly, I think when Darren said "meta-intel" he meant to say "meta-yocto" 
which is where the poky-tiny distro config can be found (and indeed that is 
where I would expect to find it).

Secondly, you already asked me about Baryon and I already agreed that it 
needed reorganising and promised to do it; but I haven't had time yet. I'd 
also point out in any case that it does not contain any BSP and the mere 
presence of the baryon distro config does not force you to use it as you 
suggest.

Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


