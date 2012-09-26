Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TGs8h-0001Wp-Sa
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 15:59:00 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Sep 2012 06:46:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,490,1344236400"; d="scan'208";a="198050487"
Received: from unknown (HELO helios.localnet) ([10.252.122.36])
	by orsmga001.jf.intel.com with ESMTP; 26 Sep 2012 06:45:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 26 Sep 2012 14:45:58 +0100
Message-ID: <1873147.GujWgbYhhC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <20120926133013.GM3313@jama.jama.net>
References: <1348659245-14209-1-git-send-email-paul.eggleton@linux.intel.com>
	<1985929.Ib8AKayW0V@helios> <20120926133013.GM3313@jama.jama.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gstreamer: make pulseaudio support dependent on DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 13:59:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 26 September 2012 15:30:13 Martin Jansa wrote:
> On Wed, Sep 26, 2012 at 02:24:07PM +0100, Paul Eggleton wrote:
> > On Wednesday 26 September 2012 14:32:57 Martin Jansa wrote:
> > > On Wed, Sep 26, 2012 at 01:31:10PM +0100, Paul Eggleton wrote:
> > > > On Wednesday 26 September 2012 13:38:19 Martin Jansa wrote:
> > > > > On Wed, Sep 26, 2012 at 12:34:05PM +0100, Paul Eggleton wrote:
> > > > > > This should be no change to the previous situation unless you
> > > > > > explicitly have pulseaudio in DISTRO_FEATURES_BACKFILL_CONSIDERED
> > > > > > (currently).
> > > > > 
> > > > > Why not use PACKAGECONFIG for this?
> > > > 
> > > > Only because I didn't see the need complicate it just to be able to
> > > > configure it on a per-recipe basis - you almost certainly want
> > > > pulseaudio
> > > > either on or off everywhere. If you want it for stylistic reasons,
> > > > sure,
> > > > I guess... it is a bit ugly though.
> > > 
> > > Well it looked to me like ideal use-case for PACKAGECONFIG.
> > 
> > It does encapsulate the DEPENDS and EXTRA_OECONF into one piece, yes, but
> > then when you make the PACKAGECONFIG option set from DISTRO_FEATURES
> > anyway it gets ugly, and here I'm not convinced it adds anything useful.
> 
> Yes, but that's the case for almost every other PACKAGECONFIG use in
> oe-core too AFAIK and I was asked to convert similar commit to use
> PACKAGECONFIG before so I was expecting that the ultimate goal is to
> replace all such DISTRO_FEATURE tests with PACKAGECONFIG where possible,
> not to add more of them.

Perhaps. Well, I just noticed I need to correct the commit message anyway 
(it's a change to gst-plugins-good, not gstreamer) so given that I'll send a 
v2 using PACKAGECONFIG.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


