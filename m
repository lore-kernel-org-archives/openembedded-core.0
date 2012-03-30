Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SDYAR-0008Lw-6g
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 11:30:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Mar 2012 02:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="83455007"
Received: from unknown (HELO helios.localnet) ([10.252.123.235])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Mar 2012 02:21:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Fri, 30 Mar 2012 10:21:40 +0100
Message-ID: <2370474.pLR3NF41dS@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <CAGiJk9deLrVFhtGF6pAvvWUgyo5kbAE77t9bnWciKtdtC4oD8g@mail.gmail.com>
References: <20120329225332.0e8cc2f4@eb-e6520>
	<CADkTA4MvYRmsLQogaQMHwUeP5y7ws5NvmXiBMgvsreiGNQrsJw@mail.gmail.com>
	<CAGiJk9deLrVFhtGF6pAvvWUgyo5kbAE77t9bnWciKtdtC4oD8g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Fetch time optimization (svn : gcc/eglibc - git : linux-yocto)
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
X-List-Received-Date: Fri, 30 Mar 2012 09:30:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 30 March 2012 08:44:56 Samuel Stirtzel wrote:
> this might be a bit off-topic, but another idea would be to add a
> separate threading mechanism for fetching.
> 
> Current threading can help to use the CPU and memory load to it's optimum,
> but sometimes you have to wait for a download to finish..
> Instead there could be a separate set of threads that only download
> the sources and make optimal use of the bandwidth too.
> 
> This would also allow to fetch files when the normal threads are busy
> with configuring/building/packaging recipes.

What you're really suggesting here is a modified BitBake scheduler that 
understands that fetch tasks that require network bandwidth are different from 
other tasks such as compile ones which stress the CPU. It sounds like it might 
be worth investigating at least. FYI, BitBake's schedulers are pluggable and 
not particularly complicated (see bitbake/lib/bb/runqueue.py).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


