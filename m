Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sz7wi-0005j9-BE
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 17:13:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Aug 2012 08:00:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,733,1336374000"; d="scan'208";a="178359538"
Received: from unknown (HELO helios.localnet) ([10.252.121.56])
	by azsmga001.ch.intel.com with ESMTP; 08 Aug 2012 08:00:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 08 Aug 2012 16:00:50 +0100
Message-ID: <1503062.H9kskseNSt@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-27-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <FC8D60B3-17DE-4CEE-8A86-4BF201870280@dominion.thruhere.net>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
	<1434346.ITqeKT5PyT@helios>
	<FC8D60B3-17DE-4CEE-8A86-4BF201870280@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Replacing Web in Sato with Midori
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
X-List-Received-Date: Wed, 08 Aug 2012 15:13:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 08 August 2012 16:47:05 Koen Kooi wrote:
> Op 8 aug. 2012, om 16:03 heeft Paul Eggleton <paul.eggleton@linux.intel.com> 
het volgende geschreven:
> > On Wednesday 08 August 2012 15:56:33 Koen Kooi wrote:
> >> There are a ton of recipes in oe-core that need extra layers to get
> >> properly tested (QT comes to mind),
> > 
> > What are you referring to? Qt should be perfectly testable within OE-Core.
> 
> What kind of big qt apps does oe-core have to test it? I had to enable
> meta-kde to find bugs in the qt recipes, so if the tests are in there, they
> aren't get run properly.

And? KDE is far more demanding upon Qt than most Qt-based applications. We had 
to make specific changes to our Qt recipes just to accommodate it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


