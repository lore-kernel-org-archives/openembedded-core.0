Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T2LvA-0004Zj-Nx
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 14:45:00 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Aug 2012 05:33:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,784,1336374000"; d="scan'208";a="181939772"
Received: from unknown (HELO helios.localnet) ([10.252.121.90])
	by orsmga001.jf.intel.com with ESMTP; 17 Aug 2012 05:33:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 Aug 2012 13:32:59 +0100
Message-ID: <3890692.qcbBpDRmfO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <20120817123017.GI3625@jama.jama.net>
References: <cover.1345203203.git.ross.burton@intel.com>
	<4141908.n3IAyUAFPz@helios> <20120817123017.GI3625@jama.jama.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Remove older GTK+ versions
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
X-List-Received-Date: Fri, 17 Aug 2012 12:45:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 17 August 2012 14:30:17 Martin Jansa wrote:
> On Fri, Aug 17, 2012 at 01:27:20PM +0100, Paul Eggleton wrote:
> > On Friday 17 August 2012 12:35:07 Ross Burton wrote:
> > > If someone still wants to use them, meta-oe is a better place for them
> > > to
> > > live.
> > 
> > As a general note, personally I'd rather that no more alternative versions
> > of anything be added to meta-oe.
> 
> Yes especially with DEFAULT_PREFERRENCE not working between layers.. so
> everyone with meta-oe and without P_V set, would get this old version..

The best plan it would seem to me would be to have a separate meta-archive or 
meta-attic or similar named layer for these older recipes, and set its layer 
priority to the same as OE-Core.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


