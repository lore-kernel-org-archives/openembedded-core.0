Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SV9Ej-0007Rc-6z
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 00:31:57 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 May 2012 15:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="167821152"
Received: from unknown (HELO helios.localnet) ([10.252.120.128])
	by fmsmga002.fm.intel.com with ESMTP; 17 May 2012 15:21:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 17 May 2012 23:21:51 +0100
Message-ID: <2622747.VEgA05EEDD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <CAP9ODKoV-pZTPrn5HrLR5b4soceeN+81e3HWYQ_OxdbVfDiQvg@mail.gmail.com>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<30398737.cYKCjogiDH@helios>
	<CAP9ODKoV-pZTPrn5HrLR5b4soceeN+81e3HWYQ_OxdbVfDiQvg@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kmod: Use base_libdir for installing libkmod"
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
X-List-Received-Date: Thu, 17 May 2012 22:31:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 17 May 2012 19:11:20 Otavio Salvador wrote:
> On Thu, May 17, 2012 at 7:01 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Thursday 17 May 2012 18:51:05 Otavio Salvador wrote:
> >> It is important to state that if OE-Core breaks Meta-OE this is
> >> crticial. It is not Yocto that people use and many active contributors
> >> use Meta-OE so it is important and critical to that people. Seems more
> >> health to the project to give the deserved value to Meta-OE instead of
> >> badmouth it...
> > 
> > The sooner people can start using it without fear of it doing unexpected
> > things, the sooner people will be able to have more confidence in it and
> > stop making negative comments about it. As it stands the way a lot of
> > people treat meta-oe is a source of recipes to be copied elsewhere
> > because they feel they cannot use the layer as a whole. I think that's a
> > big shame.
> 
> Agreed; the nice thing about Free Software is that we can do something
> about it; do negative comments help nothing.
> 
> Most people on Yocto do not contribute actively to Meta-OE. As
> example, you did 12 commits in total to it...

No, we don't, but that's probably because we have our hands full maintaining 
BitBake and OE-Core (with the help of others in the community, of course). Not 
to mention that when we do enable it on top of OE-Core / Poky without wanting 
to use systemd, it makes a whole raft of changes that usually cause breakage 
of some kind because that configuration is rarely tested. This just makes using 
and contributing to meta-oe harder.

We really do recognise that there has to be a source of recipes outside OE-
Core, and meta-oe is the current place for a lot of those. However there is 
just so much work to be done on BitBake and OE-Core that venturing into meta-
oe as well is something a lot of us don't have time for in our daily work, 
especially with its current state. I do use meta-oe when I'm building stuff at 
home but there I more or less have my hands full maintaining meta-handheld, 
meta-opie and a bunch of other things.

I hope during the current development cycle that I will have time to 
contribute to meta-oe further. I can't make any promises though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


