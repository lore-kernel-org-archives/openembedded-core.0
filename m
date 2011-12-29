Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RgOEr-0001u0-Ts
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 23:14:18 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Dec 2011 14:07:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="92712349"
Received: from unknown (HELO helios.localnet) ([10.252.122.61])
	by orsmga002.jf.intel.com with ESMTP; 29 Dec 2011 14:07:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Scott Garman <scott.a.garman@intel.com>
Date: Thu, 29 Dec 2011 22:06:59 +0000
Message-ID: <3173273.Kh9LKRsTpP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <4EFCD0B5.6080702@intel.com>
References: <cover.1324661415.git.scott.a.garman@intel.com>
	<2928272.ngRFCSvnHg@helios> <4EFCD0B5.6080702@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Upgrade chrpath and libevent
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
X-List-Received-Date: Thu, 29 Dec 2011 22:14:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 29 December 2011 15:42:29 Scott Garman wrote:
> On 12/29/2011 10:28 AM, Paul Eggleton wrote:
> > On Thursday 29 December 2011 10:05:52 Scott Garman wrote:
> >> On 12/28/2011 01:37 PM, Saul Wold wrote:
> >>> This will probably require a PR bump for nfs-utils then.
> >> 
> >> Are you sure? I thought this was handled automatically as long as the
> >> recipe in question includes the build dependency in DEPENDS, as
> >> nfs-utils does for libevent.
> > 
> > Yes, if you want nfs-utils to be rebuilt you'll need to bump its PR.
> > When we eventually move over to the PR server that won't be necessary.
> 
> Wow, this is really surprising to me. In all of the recipe upgrades I've
> ever previously done, I've *never* bumped the PR for all other recipes
> that list it in DEPENDS. Is this a new procedure we'll have to adopt for
> the core metadata team?

It's a judgement call. If there is an ABI being provided which has changed 
incompatibly then you definitely should bump PRs of those recipes that depend 
on it. Thinking about it, it probably wouldn't be too hard to detect when the 
ABI has been broken if we wanted to put some safeguards in place.

I don't think we've been vigilant about this in the past but because people 
try not to change ABIs we get away with it most of the time. Not sure if it 
warrants any change in procedure but extra care at least can't hurt.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


