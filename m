Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RchyO-0003Bc-EA
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 19:30:04 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 19 Dec 2011 10:23:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="48675383"
Received: from unknown (HELO helios.localnet) ([10.252.122.37])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Dec 2011 10:22:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: koen@dominion.thruhere.net
Date: Mon, 19 Dec 2011 18:22:18 +0000
Message-ID: <1817157.LPoMfdErnK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.4 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <D88949C2-F8C7-4CAF-B74C-32AE43119D20@dominion.thruhere.net>
References: <cover.1324316137.git.paul.eggleton@linux.intel.com>
	<D88949C2-F8C7-4CAF-B74C-32AE43119D20@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 19 Dec 2011 18:30:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 19 December 2011 18:50:35 Koen Kooi wrote:
> Op 19 dec. 2011, om 18:43 heeft Paul Eggleton het volgende geschreven:
> > Set the default psplash image to the OpenEmbedded logo, and provide a
> > script to allow people to use their own custom image.
> 
> What I did in OE-classic and meta-angstrom is to use update-alternatives to
> provide different psplash images. This way you can choose a different
> splash for each image instead of having a distro wide one. Is something
> like that suitable for oe-core as well?

Sounds like a useful capability, however, does this mean that when you want to 
override it in the image you end up with both psplash versions installed?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


