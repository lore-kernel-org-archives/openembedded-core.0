Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RWRVh-0006nL-SM
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 12:42:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 03:35:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="81486443"
Received: from unknown (HELO helios.localnet) ([10.252.121.254])
	by azsmga001.ch.intel.com with ESMTP; 02 Dec 2011 03:35:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 02 Dec 2011 11:35:46 +0000
Message-ID: <4517756.DZJl4RxAdk@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <95561DFA-A2E5-43AD-B83D-A83F3D329077@dominion.thruhere.net>
References: <cover.1322782677.git.paul.eggleton@linux.intel.com>
	<8afb5fd67ea37c1ff2ff4513f797f409a0e8a556.1322782677.git.paul.eggleton@linux.intel.com>
	<95561DFA-A2E5-43AD-B83D-A83F3D329077@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 2/2] classes/buildhistory: merge in package history functionality
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
X-List-Received-Date: Fri, 02 Dec 2011 11:42:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 02 December 2011 11:15:31 Koen Kooi wrote:
> Does this do a commit per build as well?

Yes, since the commit occurs when bitbake completes (in response to the 
BuildCompleted event).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


