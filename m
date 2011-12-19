Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rcikj-000521-Tc
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 20:20:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2011 11:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="88185574"
Received: from unknown (HELO helios.localnet) ([10.252.122.37])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2011 11:12:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 19 Dec 2011 19:12:10 +0000
Message-ID: <1482711.caT8mReHxH@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.4 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <C0A5EF9A-CDED-41D7-B7D0-2FCB16771898@dominion.thruhere.net>
References: <cover.1324316137.git.paul.eggleton@linux.intel.com>
	<3289178.cJ7bor4PPM@helios>
	<C0A5EF9A-CDED-41D7-B7D0-2FCB16771898@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] psplash fixes
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
X-List-Received-Date: Mon, 19 Dec 2011 19:20:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 19 December 2011 20:02:02 Koen Kooi wrote:
> In OE-classic we had IMAGE_SPLASH. Btw, I'm not using core-image.bbclase.

Well we could always use IMAGE_SPLASH and bring it in via image.bbclass. It 
seems to me like something you should be able to enable or exchange easily for 
any image.
 
> >>> Would update-alternatives be needed at all in
> >>> that case?
> >> 
> >> It would if you want to change it after booting :)
> > 
> > What's the use case for changing the splash image after booting?
> 
> If you splash contains text its nice to be able to exchange it as easily as
> the rest of the system.

So is this for i18n? Or do you have something in the text that's likely to 
need changing? Might it be better to provide an alternative channel for 
displaying text in psplash for that?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


