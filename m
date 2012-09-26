Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TGqyK-0008Ds-TR
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 14:44:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Sep 2012 05:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,490,1344236400"; d="scan'208";a="197352450"
Received: from unknown (HELO helios.localnet) ([10.252.122.36])
	by azsmga001.ch.intel.com with ESMTP; 26 Sep 2012 05:31:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 26 Sep 2012 13:31:10 +0100
Message-ID: <2280743.CHvCEmHVFs@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.1 (Linux/3.2.0-31-generic-pae; KDE/4.9.1; i686; ; )
In-Reply-To: <20120926113818.GG3313@jama.jama.net>
References: <1348659245-14209-1-git-send-email-paul.eggleton@linux.intel.com>
	<20120926113818.GG3313@jama.jama.net>
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
X-List-Received-Date: Wed, 26 Sep 2012 12:44:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 26 September 2012 13:38:19 Martin Jansa wrote:
> On Wed, Sep 26, 2012 at 12:34:05PM +0100, Paul Eggleton wrote:
> > This should be no change to the previous situation unless you
> > explicitly have pulseaudio in DISTRO_FEATURES_BACKFILL_CONSIDERED
> > (currently).
> 
> Why not use PACKAGECONFIG for this?

Only because I didn't see the need complicate it just to be able to configure 
it on a per-recipe basis - you almost certainly want pulseaudio either on or 
off everywhere. If you want it for stylistic reasons, sure, I guess... it is a 
bit ugly though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


