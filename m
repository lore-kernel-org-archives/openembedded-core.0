Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1QW8wv-0002EE-LC
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:21:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Jun 2011 08:17:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,359,1304319600"; d="scan'208";a="11929083"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by azsmga001.ch.intel.com with ESMTP; 13 Jun 2011 08:17:43 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <149A39A6-0D00-4D57-9B29-F230FA9CF6C5@dominion.thruhere.net>
References: <1307975748.10825.2.camel@elmorro>
	<05D8A861-D865-4303-BB8B-69F5F22B651D@dominion.thruhere.net>
	<1307976845.10825.5.camel@elmorro>
	<149A39A6-0D00-4D57-9B29-F230FA9CF6C5@dominion.thruhere.net>
Date: Mon, 13 Jun 2011 10:17:44 -0500
Message-ID: <1307978264.10825.7.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: Re: [PATCH] systemtap: remove non-core COMPATIBLE_MACHINES
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
X-List-Received-Date: Mon, 13 Jun 2011 15:21:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-13 at 08:12 -0700, Koen Kooi wrote:
> Op 13 jun 2011, om 16:54 heeft Tom Zanussi het volgende geschreven:
> 
> > On Mon, 2011-06-13 at 07:47 -0700, Koen Kooi wrote:
> >> Op 13 jun 2011, om 16:35 heeft Tom Zanussi het volgende geschreven:
> >>> -COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuppc|emenlow|crownbay|atom-pc|n450)"
> >>> +COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuppc|atom-pc)"
> >> 
> >> After having looked at the recipe (basically 'inherit autotools', PACKAGE_ARCH = BASE_PACKAGE_ARCH) and reading the systemtap wiki I can't figure out why COMPATIBLE_MACHINE is actually needed. The closest I get is "needs specific kernel config", but that argument quickly falls down when looking at other recipes that need that (e.g. udev) and considering out layer strategy (bbappending it for all your machines).
> >> 
> >> So, what am I missing here?
> >> 
> > 
> > My testing showed systemtap doesn't actually work on arm, and has no
> > support for mips - the machines listed are the only ones I've been able
> > to verify that work.
> 
> So that sounds like COMPATIBLE_HOST instead of machine, no?
> 

Yeah, you're right - that does make more sense in this case.  I'll
update things with your suggestions and respin, thanks...

Tom

> regards,
> 
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




