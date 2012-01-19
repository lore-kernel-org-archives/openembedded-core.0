Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RntMV-0006IY-AU
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 15:53:11 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Jan 2012 06:45:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100416047"
Received: from unknown (HELO helios.localnet) ([10.252.122.198])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2012 06:45:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 19 Jan 2012 14:45:29 +0000
Message-ID: <12179414.hR7YIgmyms@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <7BD299FF-ED9A-4C3C-9581-4EF9B8D89B25@dominion.thruhere.net>
References: <1326978483.2511.68.camel@ted>
	<7BD299FF-ED9A-4C3C-9581-4EF9B8D89B25@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Buildhistory in action
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
X-List-Received-Date: Thu, 19 Jan 2012 14:53:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 19 January 2012 15:37:38 Koen Kooi wrote:
> If you want to see a longer history, have a look at
> https://github.com/Angstrom-distribution/buildhistory/commits/master, I've
> been using it heavily today when working on udev 177 which changed its
> default filesystem layout. One thing to keep in mind:
> 
> $ du -hs /data/ssd/OE/buildhistory/
> 548M	/data/ssd/OE/buildhistory/

Hmm, I wouldn't have expected it to be quite that large, but I guess it 
depends what you're doing with it, and I'd imagine given the number of builds 
you run you probably stress it more than most (which is good :). In the end 
500M is just a drop in the bucket compared to the rest of TMPDIR...

> I keep it on an SSD to avoid needing to wait a few minutes after every
> bitbake invocation.

Good advice :) It's also worth noting it will noticeably increase the 
do_rootfs time (especially for RPM) and probably do_package as well.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


