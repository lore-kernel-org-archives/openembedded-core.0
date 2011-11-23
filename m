Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RT81C-0002NJ-QV
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 09:17:23 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Nov 2011 00:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="79100192"
Received: from unknown (HELO helios.localnet) ([10.252.121.173])
	by orsmga001.jf.intel.com with ESMTP; 23 Nov 2011 00:10:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2011 08:10:48 +0000
Message-ID: <1410925.ON6BTprex7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <4ECCA876.4080201@linux.intel.com>
References: <4ECC9A64.4080009@linux.intel.com>
	<C39A2CE4-DFD3-4C4D-B9F3-B37406404A1C@dominion.thruhere.net>
	<4ECCA876.4080201@linux.intel.com>
MIME-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: RFC: grub-efi native tools
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
X-List-Received-Date: Wed, 23 Nov 2011 08:17:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 23 November 2011 00:01:58 Darren Hart wrote:
> On 11/22/2011 11:36 PM, Koen Kooi wrote:
> > One way:
> > 
> > DEPENDS = "grub-efi-native"
> > DEPENDS_virtclass-native = ""
> 
> Ah, nice. I presume I can also zero out a function for the virtclass-native?
> 
> do_compile_append() {
> 	... non-native stuff ...
> }
> 
> do_compile_append_virtclass-native() {
> 
> }

Unfortunately no, the second will not wipe out the first since appends are 
cumulative. The non-native append would have to be qualified with an override 
(or its content wrapped in a conditional statement).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


