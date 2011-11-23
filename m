Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RTCv9-0001W4-FL
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 14:31:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 Nov 2011 05:24:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,559,1315206000"; d="scan'208";a="78372314"
Received: from unknown (HELO helios.localnet) ([10.252.121.207])
	by azsmga001.ch.intel.com with ESMTP; 23 Nov 2011 05:24:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 23 Nov 2011 13:24:50 +0000
Message-ID: <2845140.Nh9cgQnlu0@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <503E71C5-C1CA-4A51-82EF-C52CBC2E43C5@dominion.thruhere.net>
References: <cover.1321972798.git.paul.eggleton@linux.intel.com>
	<503E71C5-C1CA-4A51-82EF-C52CBC2E43C5@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/1] packagehistory improvement
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
X-List-Received-Date: Wed, 23 Nov 2011 13:31:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 22 November 2011 18:25:25 Koen Kooi wrote:
> Does it still suffer from the bug where it will break if you change machine
> and something goes backward in PV (e.g. gcc 4.6 is used on arm, but 4.5 on
> ppc)?

So unless I'm mistaken the fix that you yourself applied to OE in 2009 (and 
which was included in Poky, and hence OE-core) already works around this 
specific situation, since the package history is always stored under a 
BASEPKG_TARGET_SYS directory (or MULTIMACH_TARGET_SYS now with my patch since 
the former is no longer available). Am I missing something?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


