Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QBp15-0002Mi-A6
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 16:01:27 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Apr 2011 06:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,232,1301900400"; d="scan'208";a="911096977"
Received: from unknown (HELO helios.localnet) ([10.255.12.202])
	by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2011 06:59:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Organization: Intel Corporation (UK)
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Apr 2011 14:59:00 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.35-28-generic-pae; KDE/4.6.1; i686; ; )
References: <1303107421.5518.45.camel@rex>
In-Reply-To: <1303107421.5518.45.camel@rex>
MIME-Version: 1.0
Message-Id: <201104181459.00492.paul.eggleton@linux.intel.com>
Subject: Re: RFC: Layer tooling brainstorming
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
X-List-Received-Date: Mon, 18 Apr 2011 14:01:27 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Some of the ideas I've been thinking of for layer tools, other than what's 
been mentioned already:

* Show easily which recipes are being used and which are overridden. We have 
bitbake-layers, but this clearly needs some extension. I think long term we 
would want to be able to analyse overrides accross a set of layers to figure 
out where common stuff in non-core layers needs pushing up to oe-core.

* Allow layer maintainers to easily pull a version of a recipe into their own 
layer if it's about to be removed from oe-core - with some complicated recipes 
that could be painful/annoying to pick out all the necessary files by hand.

* Recipe maintenance tools that take advantage of bitbake's parsing logic to 
aid blanket updates (e.g. variable renames). This should help mitigate the 
increased difficulty of having recipes spread out over multiple repositories 
when doing these kinds of updates.

* Some kind of central registration of layers. I'm guessing a wiki page would 
do for starters but something with a database behind it would enable us to 
show "live" metadata such as when the layer was last updated, info read from 
layer.conf etc.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre (UK)


