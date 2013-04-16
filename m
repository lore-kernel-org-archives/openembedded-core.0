Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1USFWS-0002Pl-5w
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 01:42:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Apr 2013 16:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,488,1363158000"; d="scan'208";a="323353016"
Received: from unknown (HELO helios.localnet) ([10.255.13.187])
	by fmsmga002.fm.intel.com with ESMTP; 16 Apr 2013 16:25:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Apr 2013 00:25:14 +0100
Message-ID: <3552064.n2jxC3Or99@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <20130416214108.GD29302@jama.dyndns-home.com>
References: <cover.1365797632.git.paul.eggleton@linux.intel.com>
	<1366146366.8670.102.camel@ted>
	<20130416214108.GD29302@jama.dyndns-home.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] classes/sanity: fix handling of bblayers.conf updating
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
X-List-Received-Date: Tue, 16 Apr 2013 23:42:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 16 April 2013 23:41:08 Martin Jansa wrote:
> On Tue, Apr 16, 2013 at 10:06:06PM +0100, Richard Purdie wrote:
> > On Tue, 2013-04-16 at 19:09 +0200, Martin Jansa wrote:
> > > OK, so it's different than hangs I'm seeing here, because I'm still
> > > seeing them with latest oe-core> 
> > Yes, that was almost certainly a different issue.
> > 
> > > $ . ./oe-init-bitbake-build-env && bitbake my-image
> > > Altered environment for machine@distro development (this is from
> > > oe-init-bitbake-build-env) # and nothing else is shown after that
> > 
> > So just to ensure I understand this, it never prints any messages at
> > all?
> 
> yes nothing at all from bitbake, only that echo from setup script
> (oe-init-bitbake-build-env)

Are you sure it's not getting stuck doing a fetch as a result of a non-fully-
specified SRCREV?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


