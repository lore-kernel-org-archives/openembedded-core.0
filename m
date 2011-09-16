Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R4cd5-0002Yt-4z
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 19:55:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Sep 2011 10:49:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,394,1312182000"; d="scan'208";a="54546436"
Received: from unknown (HELO helios.localnet) ([10.252.120.40])
	by fmsmga002.fm.intel.com with ESMTP; 16 Sep 2011 10:49:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Fri, 16 Sep 2011 18:49:52 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1316177653.20858.23.camel@ted>
	<201109161816.28057.paul.eggleton@linux.intel.com>
	<CAP9ODKoVOSsDOKtiv-LExuKbeGciGp4hfC=V5j-zCY8wDNwr3A@mail.gmail.com>
In-Reply-To: <CAP9ODKoVOSsDOKtiv-LExuKbeGciGp4hfC=V5j-zCY8wDNwr3A@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201109161849.52647.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core release process
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
X-List-Received-Date: Fri, 16 Sep 2011 17:55:11 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 16 September 2011 18:18:43 you wrote:
> On Fri, Sep 16, 2011 at 14:16, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > On Friday 16 September 2011 18:08:04 Otavio Salvador wrote:
> >> More then once I wanted to pick a patch that was in poky and not yet
> >> merged into oe-core and it wasn't that easy to split it.
> > 
> > Can you give a specific example of this?
> > 
> > Since the split, there have never been any patches intentionally merged
> > into poky's OE-core parts that were not already in OE-core. (There were
> > a few isolated occasions where some accidentally slipped in, these were
> > rectified as soon as they were discovered.)
> 
> They all ended up in oe-core the problem is when they're not yet
> merged but I want to merge them into my tree for use, test or
> anything.

Ah, so what you mean is not that the patches were in poky, but that there 
sometimes were pull requests pointing to a branch that was on top of poky. The 
thing is, the patches are exactly the same.
 
> The combo-layer was one example. It was made available on poky contrib
> tree and I had to manually export the patches instead of pulling it
> into a branch for testing.

Git makes this almost trivially easy though, and in the combo-layer example it 
was only a few patches.

Personally, I always post my OE-core pull requests on top of an OE-core 
branch; doing that means *I* have to manually bring the patches across as files 
and use git-am to apply them onto a branch of OE-core though. I think those of 
us working on Poky know this is the accepted practice and try to do it all of 
the time, occasionally someone might forget or feel that for an RFC patch it's 
not worth the effort; but I think that's the exception rather than the rule.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


