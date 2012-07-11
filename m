Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sp1OE-0004ex-MW
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 20:12:01 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jul 2012 11:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="176120580"
Received: from unknown (HELO helios.localnet) ([10.252.120.253])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2012 11:00:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2012 19:00:40 +0100
Message-ID: <1625033.FUQGRG6suy@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <CAEsOVNfeZBjERBFsXSWqihHccROAR3N4kRGgW8XhpJd4iKzRdw@mail.gmail.com>
References: <4FFD0425.7040004@intel.com> <1342004414.7934.11.camel@ted>
	<CAEsOVNfeZBjERBFsXSWqihHccROAR3N4kRGgW8XhpJd4iKzRdw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Upcoming Yocto 1.2.1 "denzil" release this week.
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
X-List-Received-Date: Wed, 11 Jul 2012 18:12:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 11 July 2012 17:55:18 McClintock Matthew-B29882 wrote:
> On Wed, Jul 11, 2012 at 6:00 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2012-07-11 at 09:57 +0100, Jack Mitchell wrote:
> >> Are Khems eglibc patches going to make it in for this - 2.16 is playing
> >> havoc with my builds at the moment and surely will with everyone else
> >> when the major distros catch up.
> > 
> > Its too late to get those pieces into 1.2.1, they're not even in master
> > yet, let alone in a stable release branch.
> > 
> > I'm proposing we get 1.2.1 out, get the 2.16 pieces tested in master,
> > then port them to the denzil branch quickly post release so they'd make
> > any 1.2.2 release and are available on the git branch for people using
> > the stable branch.
> 
> Can you fill me in? Why would a point release include such a dramatic
> upgrade?

I think what we would be looking at would be just adding the fixes to allow the 
native packages to build against eglibc 2.16 so it can work on host distros 
that use it, not bringing eglibc 2.16 itself in for the target.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


