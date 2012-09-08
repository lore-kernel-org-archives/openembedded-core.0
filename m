Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TA8sJ-0006Cq-45
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 02:26:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Sep 2012 17:13:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,388,1344236400"; d="scan'208";a="219616015"
Received: from unknown (HELO helios.localnet) ([10.252.121.181])
	by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2012 17:13:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Sat, 08 Sep 2012 01:13:46 +0100
Message-ID: <2421210.2flnjmrcNM@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <504A8B60.50602@linux.intel.com>
References: <1347041849-1559-1-git-send-email-sgw@linux.intel.com>
	<3797326.nJL3Eer77d@helios> <504A8B60.50602@linux.intel.com>
MIME-Version: 1.0
Cc: Marc Ferland <marc.ferland@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: allow root login when debug-tweaks is enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Sep 2012 00:26:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 07 September 2012 17:03:44 Saul Wold wrote:
> On 09/07/2012 04:56 PM, Paul Eggleton wrote:
> > I'm a bit confused by this because I thought this issue had already been
> > solved. Unfortunately when I looked back I see the patch was never merged:
> > 
> > http://patches.openembedded.org/patch/29693/
> 
> It was merged, I just augmented that allow_empty_passwd() with another 1
> line sed to PermitRootLogin also.

Ah yes, now that I search for the correct string I see it was merged.

> > I agree with Phil, we really don't want to replicate dropbear's usage of
> > IMAGE_FEATURES outside of image handling code - in fact there is a bug in
> > the Yocto Project bugzilla (#2578) against me to remove this for
> > dropbear.
>
> Paul, I can have a crack at it if you want.

You are welcome to, but FYI it does involve modifications to dropbear itself as 
it does not have a runtime configuration option for this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


