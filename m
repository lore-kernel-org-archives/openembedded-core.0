Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T2MAQ-0005EU-7H
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:00:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Aug 2012 05:48:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,784,1336374000"; d="scan'208";a="181944426"
Received: from unknown (HELO helios.localnet) ([10.252.121.90])
	by orsmga001.jf.intel.com with ESMTP; 17 Aug 2012 05:48:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 Aug 2012 13:48:45 +0100
Message-ID: <5851541.vDHObiJJ2D@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <20120817123916.GJ3625@jama.jama.net>
References: <cover.1345203203.git.ross.burton@intel.com>
	<3890692.qcbBpDRmfO@helios> <20120817123916.GJ3625@jama.jama.net>
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
X-List-Received-Date: Fri, 17 Aug 2012 13:00:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 17 August 2012 14:39:16 Martin Jansa wrote:
> Should I file a but to fix DEFAULT_PREFERENCE between layers?

We've discussed this problem before - the trouble is we would have to change 
the way the version preference calculation works, and I'm not sure we will be 
able to do that without breaking assumptions that people currently rely upon 
in the process. By all means file a bug, but I think coming up with a practical 
solution is going to be tricky.
 
> Because there is also use case when newer development version is added
> to e.g. meta-oe with negative D_P and only users who decide to test/use
> that version should get it, if they define P_V for this new version.

This is also undesirable for meta-oe IMHO - as a general principle, meta-oe 
shouldn't be trying to both add additional recipes *and* provide newer/older 
versions of recipes that are in OE-Core. Please, let's get the new versions 
into OE-Core or if they're too risky/broken for some use cases for that, then 
they belong in people's distro layers. (Practically I don't think there are 
that many instances of new versions of OE-Core recipes that people want to use 
that would be actually rejected by OE-Core).
 
Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


