Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RNODu-0003av-7f
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 13:22:46 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Nov 2011 04:16:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="71892141"
Received: from unknown (HELO helios.localnet) ([10.252.121.109])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2011 04:16:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 07 Nov 2011 12:16:29 +0000
Message-ID: <9572836.16zuAUMiQO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <4F626E19-A84B-4FB7-B6E0-24EC9FC6691A@dominion.thruhere.net>
References: <cover.1320429268.git.paul.eggleton@linux.intel.com>
	<10653267.IaxPiWSyZu@helios>
	<4F626E19-A84B-4FB7-B6E0-24EC9FC6691A@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] combo-layer enhancements
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
X-List-Received-Date: Mon, 07 Nov 2011 12:22:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 07 November 2011 11:16:26 Koen Kooi wrote:
> With all the fixes in your branch does this allow creating a combo layer
> from scratch with all the history present?

If you expect that it will do that automatically with no conflict resolution 
necessary, then the answer is no I'm afraid. My focus at least for one of 
these patches was to get repo creation starting from the current revision 
working with no hassle. Testing an import of the entire history just now 
though did point out a trivial issue with empty commits which I have now fixed, 
however, "git format-patch" (which is the basis for combo-layer) simply cannot 
handle merges where a conflict was resolved, and AFAICT there is no way around 
this. Typically we don't do merges in the OE-core or bitbake repositories so 
this is not too serious an issue; however, there is at least one merge in the 
OE-core history where there are changes that conflict (an example would be 
76e51a83e1af6c95a8ba780d8d543ddda52e1597 and 
3937aefbefda15a65436238a6c6f1485419c914b). When it gets to these you will have 
to resolve the conflict by hand.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


