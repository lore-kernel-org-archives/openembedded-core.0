Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S9zcL-00009j-8D
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 15:00:53 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Mar 2012 06:51:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="119545502"
Received: from unknown (HELO helios.localnet) ([10.252.123.195])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2012 06:51:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 13:51:57 +0000
Message-ID: <16657624.ejDoFzWrx1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <1332250734-14660-1-git-send-email-koen@dominion.thruhere.net>
References: <1332250734-14660-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 20 Mar 2012 14:00:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 20 March 2012 14:38:52 Koen Kooi wrote:
> Allow empty commits, this also give a nice speedup since 'git status
> --porcelain' doesn't need to get run.

I guess my thinking before (without any verification) was that git commit would 
need to be running the equivalent of 'git status --porcelain' anyway and the 
second time it would be cached so there wouldn't be much impact. If the 
buildhistory repo is quite large or the machine is busy then it's entirely 
possible that wouldn't work out however.

Since all image builds will force a commit anyway (as at least build-id must 
change), and for the majority of people most builds will be image builds, I 
think this is going to be a net improvement.

Therefore I'll say:

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre


