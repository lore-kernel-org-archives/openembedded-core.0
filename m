Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RaZsO-0007pe-Pq
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 22:27:07 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Dec 2011 13:20:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86906848"
Received: from unknown (HELO helios.localnet) ([10.252.122.62])
	by orsmga002.jf.intel.com with ESMTP; 13 Dec 2011 13:20:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joshua Lock <josh@linux.intel.com>
Date: Tue, 13 Dec 2011 21:20:04 +0000
Message-ID: <5518182.4uSUpxrDi7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <4EE7B848.3070405@linux.intel.com>
References: <cover.1323807692.git.josh@linux.intel.com>
	<CAMKF1soA84UGCpx12gsTU_aL0uGSYau_=qoLDXkj9fRrhtGLmQ@mail.gmail.com>
	<4EE7B848.3070405@linux.intel.com>
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
X-List-Received-Date: Tue, 13 Dec 2011 21:27:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 13 December 2011 12:40:40 Joshua Lock wrote:
> On 13/12/11 12:34, Khem Raj wrote:
> > On Tue, Dec 13, 2011 at 12:24 PM, Joshua Lock <josh@linux.intel.com> 
wrote:
> >> -SRCREV = "39db46123ed6bbbc3e6ad359a64d4d344ca9e11b"
> >> -PV = "1.8.0+git${SRCPV}"
> >> +# the 1.8.2 tag
> >> +SRCREV = "9041ea42655dfc1422ce88eab931382dd400d13a"
> >> +PV = "1.8.2+git${SRCPV}"
> > 
> > you could also use the tag name instead of SHA for SRCREV I think
> 
> Indeed we can, however we've seen problems which I can't recall the
> details of in the past when doing so. Therefore I decided to avoid it
> this time.

It does work, it just forces a fetch on every parse which is not really 
desirable. It's really no hardship to use the SHA1 especially if it's 
accompanied by a comment with the corresponding tag.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


