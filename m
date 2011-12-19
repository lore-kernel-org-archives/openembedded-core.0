Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RciW5-0004aU-SS
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 20:04:54 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2011 10:57:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="88178298"
Received: from unknown (HELO helios.localnet) ([10.252.122.37])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2011 10:57:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 19 Dec 2011 18:57 +0000
Message-ID: <3289178.cJ7bor4PPM@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.4 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <756581D3-FAA6-48FC-9ECE-0B7CC1262A5D@dominion.thruhere.net>
References: <cover.1324316137.git.paul.eggleton@linux.intel.com>
	<4077851.vBmcQh9dAf@helios>
	<756581D3-FAA6-48FC-9ECE-0B7CC1262A5D@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 19 Dec 2011 19:04:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 19 December 2011 19:48:48 Koen Kooi wrote:
> I will say again: I absolutely HATE that virtual-runtime nonsense. If you
> need to change a task, change the task, don't introduce things that make it
> non deterministic. Guess what happens when you change a virtual-runtime
> *after* you have built the task already.

This is the problem I'm trying to avoid. Perhaps it wasn't clear, but what I 
meant was change things so we do not bring in psplash via a task anymore - 
instead use the value of VIRTUAL-RUNTIME_splash within core-image.bbclass, 
controlled via an IMAGE_FEATURE.

> > Would update-alternatives be needed at all in
> > that case?
> 
> It would if you want to change it after booting :)

What's the use case for changing the splash image after booting?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


