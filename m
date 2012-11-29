Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Te2hZ-0006Sc-7V
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 12:54:45 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2012 03:40:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,184,1355126400"; d="scan'208";a="249122465"
Received: from unknown (HELO helios.localnet) ([10.252.122.249])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2012 03:40:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chris Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2012 11:40:26 +0000
Message-ID: <5097983.bapmtWeVbY@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-18-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <CABcZAN=Z1y8ZsX9p8_eLhsDcyS+P6kYsoRjSgoE98-L9TaV6JA@mail.gmail.com>
References: <alpine.DEB.2.02.1211280631130.31857@oneiric>
	<CABcZAN=m3EwpqUi8D_hmBzqHwsmVg6W+EUXm6Q3_geFgtsJyTA@mail.gmail.com>
	<CABcZAN=Z1y8ZsX9p8_eLhsDcyS+P6kYsoRjSgoE98-L9TaV6JA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: some simple questions/observations about package groups
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
X-List-Received-Date: Thu, 29 Nov 2012 11:54:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 November 2012 15:27:58 Chris Larson wrote:
> Also, to comment on something tangentially related from a different thread,
> technically the PACKAGE_GROUP_ variables were the first to use the term as
> far as I'm aware. *tasks* were then renamed to use that name as well, which
> is where a bunch of the confusion probably got introduced.

I did mention that:

> PACKAGE_GROUP_* actually came first as a way to 
> define items for IMAGE_FEATURES that map to one or more packages, and I'm
> not  sure the name choice was a particularly good one - I wonder if it
> would be worth considering renaming it to something like
> IMAGE_FEATURE_PACKAGES in order to avoid confusion, although obviously
> every rename like this has a cost associated.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


