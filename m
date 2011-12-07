Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RYFwA-0000VZ-SP
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 12:45:23 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Dec 2011 03:38:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="83825751"
Received: from unknown (HELO helios.localnet) ([10.252.122.2])
	by orsmga001.jf.intel.com with ESMTP; 07 Dec 2011 03:38:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 07 Dec 2011 11:38:30 +0000
Message-ID: <31509378.yr872GkOIF@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <225B79C8-8CC0-429B-B4B8-95360FD4B07E@dominion.thruhere.net>
References: <cover.1322782677.git.paul.eggleton@linux.intel.com>
	<8cc5f124fb791a762bf6aace3a9bf8c1d1c39dd1.1322782677.git.paul.eggleton@linux.intel.com>
	<225B79C8-8CC0-429B-B4B8-95360FD4B07E@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/2] classes/buildhistory: add new output history collection class
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
X-List-Received-Date: Wed, 07 Dec 2011 11:45:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 07 December 2011 09:50:51 Koen Kooi wrote:
> One of the big problems with the old testlab code was that using multiple
> buildslaves created a huge mess for the git repo. What do you think about
> doing this the following before the 'git add'?
> 
> git pull -q -s recursive -X theirs ${BUILDHISTORY_PULL_REPO}
> 
> I'm not sure what the right incantation is to ensure git updates the current
> branch, but the point is mainly about using the 'theirs' strategy.

I think you can just have the branch name as part of BUILDHISTORY_PULL_REPO 
(i.e. "reponame branchname"). I had considered using separate branches for 
each machine to avoid this problem but if you're already using branches for 
different versions this will get messy.

(As an aside I guess we ought to include the hostname in the commit message as 
well.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


