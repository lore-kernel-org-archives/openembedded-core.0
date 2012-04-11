Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SHxEI-0001z9-VS
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 15:04:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Apr 2012 05:55:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="87801385"
Received: from unknown (HELO helios.localnet) ([10.252.120.50])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Apr 2012 05:55:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 13:55:37 +0100
Message-ID: <6585414.f7e2xNFMXD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <CAAQYJAuc4542jJeisn=iaTo-GtPUpXvRKgrw20WhWVBCpoM4nA@mail.gmail.com>
References: <1333402513-26781-1-git-send-email-andrea.adami@gmail.com>
	<341D01DC-1752-407E-85E7-5DEB343AA7AB@dominion.thruhere.net>
	<CAAQYJAuc4542jJeisn=iaTo-GtPUpXvRKgrw20WhWVBCpoM4nA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] udev: generalize the check in touchscreen rule
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
X-List-Received-Date: Wed, 11 Apr 2012 13:04:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 11 April 2012 13:57:29 Andrea Adami wrote:
> Finally, bluelightning reported that on ipaq h1940 the rule did not
> match and added a .bbappend in meta-handheld.

FYI this is because pressure support was removed from the driver. I don't know 
if there's ever hope of it coming back.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


