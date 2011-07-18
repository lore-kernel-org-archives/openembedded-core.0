Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QiqHl-0005uN-TF
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 18:03:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jul 2011 08:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,223,1309762800"; d="scan'208";a="31645774"
Received: from unknown (HELO helios.localnet) ([10.255.17.206])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2011 08:59:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 16:59:03 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <RFC: Layer tooling brainstorming> <4E13A081.2020904@mvista.com>
	<201107111846.26118.paul.eggleton@linux.intel.com>
In-Reply-To: <201107111846.26118.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201107181659.03200.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] Add support for remote layering.
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
X-List-Received-Date: Mon, 18 Jul 2011 16:03:10 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 11 July 2011 18:46:26 Paul Eggleton wrote:
> I've thrown together a proof-of-concept "bitbake-fetchlayers"  in the
> "paule/remotelayers" contrib branch:
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-
> contrib/log/?h=paule/remotelayers

I spent some time looking at this again today, and the contrib branch has now 
been updated. Changes are as follows:

 * bitbake.conf and base.bbclass are no longer needed, so you really only need 
bitbake now. Some fixes to some of the fetchers other than git might still be 
necessary however.

 * Only BBPATH now needs to be set; LAYER_UNPACKDIR now defaults to 
${TOPDIR}/layers.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


