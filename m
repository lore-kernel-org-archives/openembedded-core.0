Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Se2ig-0004Gf-Mr
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 13:23:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2012 04:13:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="151282505"
Received: from unknown (HELO helios.localnet) ([10.252.120.119])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2012 04:13:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2012 12:13:01 +0100
Message-ID: <21967910.Cvp1B8MzgQ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-24-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <1339410469.31110.73.camel@phil-desktop>
References: <cover.1339405061.git.lianhao.lu@intel.com>
	<2537506.sJK0eATnrm@helios>
	<1339410469.31110.73.camel@phil-desktop>
MIME-Version: 1.0
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH 1/3] openssh: Allow empty passwords login.
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
X-List-Received-Date: Mon, 11 Jun 2012 11:23:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 11 June 2012 11:27:48 Phil Blundell wrote:
> On Mon, 2012-06-11 at 11:24 +0100, Paul Eggleton wrote:
> > I don't think we want this to be image-specific. FWIW, we do already have
> > a
> > mechanism to handle this for the dropbear recipe - debug-tweaks in
> > IMAGE_FEATURES. I don't particularly like it however since IMAGE_FEATURES
> > should not be influencing non-image recipes. This has bothered me for a
> > while and I think we ought to change to some other mechanism (perhaps
> > make it a separate variable) and then make the OpenSSH recipe use that.
> 
> In the particular case of OpenSSH, it's just a configuration file
> setting, rather than a compile-time #ifdef, so doing it with
> IMAGE_FEATURES and a rootfs postprocess step sounds like a perfectly
> wholesome approach.
> 
> I agree that the current mechanism used by dropbear (applying patches
> based on IMAGE_FEATURES) is full of suck and should be changed, perhaps
> to something more akin to what openssh does.

Sounds good. I've created Yocto bug #2578 to look at fixing this in the manner 
you described.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


