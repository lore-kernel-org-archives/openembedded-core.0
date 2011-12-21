Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RdNzv-0004Pr-9B
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 16:22:27 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Dec 2011 07:15:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="88135521"
Received: from unknown (HELO helios.localnet) ([10.252.122.36])
	by azsmga001.ch.intel.com with ESMTP; 21 Dec 2011 07:15:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Philip Balister <philip@balister.org>
Date: Wed, 21 Dec 2011 15:15:19 +0000
Message-ID: <2148975.ysQ11QrYeT@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.4 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <4EF0AA68.7070501@balister.org>
References: <cover.1324316137.git.paul.eggleton@linux.intel.com>
	<3289178.cJ7bor4PPM@helios> <4EF0AA68.7070501@balister.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] psplash fixes
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
X-List-Received-Date: Wed, 21 Dec 2011 15:22:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 20 December 2011 10:31:52 Philip Balister wrote:
> I can see people taking an existing image, adding a few packages to
> customize it for their application, and changing the splash image to a
> product specific one.

I'm not entirely convinced this workflow makes sense when you're interested in 
getting reproducible product images. This is basically the "take some existing 
distro and hack it up until it fits" approach which taken past a certain point 
leads to an unmaintainable mess, or at the very least regressions.

People really ought to be able to produce their final images from the metadata 
with no additional post-build changes (or at least none that are manual). If 
that's too difficult, that's the problem I think is most worthwhile to attack, 
even if it requires more work on our part.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


