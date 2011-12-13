Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RabBT-0003zq-Ss
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 23:50:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Dec 2011 14:43:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85381743"
Received: from unknown (HELO helios.localnet) ([10.252.122.62])
	by azsmga001.ch.intel.com with ESMTP; 13 Dec 2011 14:43:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Dec 2011 22:43:52 +0000
Message-ID: <8174007.kBAyhH3BGm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <20111213223928.GA15239@sakrah.homelinux.org>
References: <cover.1323807692.git.josh@linux.intel.com>
	<5518182.4uSUpxrDi7@helios>
	<20111213223928.GA15239@sakrah.homelinux.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] clutter_git: update to 1.8.2 tag
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
X-List-Received-Date: Tue, 13 Dec 2011 22:50:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 13 December 2011 14:39:28 Khem Raj wrote:
> is this some limitation of fetchers ?

Not really, it's just we need the actual SHA1 to construct ${PV} at parse 
time, and if the specified SRCREV is not a SHA1 the git fetcher has no way of 
knowing if it refers to a tag or a branch (which may also have changed since 
the last parse) until it can contact the repository, so it has to do that 
immediately.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


