Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SAj65-000209-80
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 15:34:37 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Mar 2012 07:25:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121984097"
Received: from unknown (HELO helios.localnet) ([10.252.123.227])
	by azsmga001.ch.intel.com with ESMTP; 22 Mar 2012 07:25:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Mar 2012 14:25:38 +0000
Message-ID: <6449205.EIHV3lzBd1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <0E615ACC-662B-408B-BDAE-032723A55D15@dominion.thruhere.net>
References: <1332250734-14660-1-git-send-email-koen@dominion.thruhere.net>
	<16657624.ejDoFzWrx1@helios>
	<0E615ACC-662B-408B-BDAE-032723A55D15@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC v2][PATCH 1/3] buildhistory: record all builds
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
X-List-Received-Date: Thu, 22 Mar 2012 14:34:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 22 March 2012 11:35:30 Koen Kooi wrote:
> After a few more days of usage I'm going to create a follow-up patch that
> will do:
> 
> 1) reinstate the global git status --porcelain and make a single, empty
> commit if nothing changed instead of N empty commits. 2) either parse the
> output of git status or re-run it to see which top level entries need to
> get committed and only run 'git add ; git commit' on those.
>
> That will keep tracking all builds, but will be less noisy. But it will be
> slightly slower when the OS doesn't cache the git status, but I decided
> that I can personally live with that.
> 
> So what do you think about that? 

Well, avoiding >1 empty commits sounds good. I'm happy to go with your 
assessment as you're more likely to be observing actual performance than me 
(I'm not really monitoring the performance of buildhistory on our autobuilder, 
only the output).

FYI I didn't comment on the splitting into separate commits patch earlier 
because it doesn't really bother me either way. I do think people will find it 
easier to use the buildhistory-diff tool rather than looking at the git log 
directly (or the web-based equivalent when I finish that.); but I'm happy to 
continue supporting those that prefer to read the log.

> If you like the idea, would you like it as follow up or as a respin of the
> series?

Since it hasn't been merged I'll go for a respin, if you don't mind.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


