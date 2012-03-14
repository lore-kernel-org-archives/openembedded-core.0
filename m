Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S7q8d-0006lQ-KY
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 16:29:19 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Mar 2012 08:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="120958811"
Received: from unknown (HELO helios.localnet) ([10.252.123.190])
	by orsmga002.jf.intel.com with ESMTP; 14 Mar 2012 08:20:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 15:20:31 +0000
Message-ID: <1851363.cCnVyF8p5B@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <4F60B6CA.3040401@linux.intel.com>
References: <cover.1331684953.git.scott.a.garman@intel.com>
	<1531514.2kqRaLqA4b@helios> <4F60B6CA.3040401@linux.intel.com>
MIME-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>, Martin Jansa <martin.jansa@gmail.com>,
	Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 1/1] ncurses: fix packaging of moved libraries
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
X-List-Received-Date: Wed, 14 Mar 2012 15:29:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 14 March 2012 08:18:34 Darren Hart wrote:
> On 03/14/2012 08:07 AM, Paul Eggleton wrote:
> > On Wednesday 14 March 2012 16:00:33 Martin Jansa wrote:
> >> isn't just
> >> ALLOW_EMPTY_${PN}-libncursesw = "1"
> >> enough?
> > 
> > I suspect we don't care if the libncursesw package isn't created when wide
> > character support is disabled, if so, we don't even need that.
> 
> OK, so if a package is defined and none of the files exist, bitbake will
> simply not create the package - and no errors or warnings will be raised?

That's correct.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


