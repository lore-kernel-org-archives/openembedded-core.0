Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TThLZ-0001KE-6E
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Nov 2012 00:05:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Oct 2012 15:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,688,1344236400"; d="scan'208";a="213710694"
Received: from unknown (HELO helios.localnet) ([10.252.122.137])
	by orsmga001.jf.intel.com with ESMTP; 31 Oct 2012 15:51:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "T.Michael Turney" <tmiket@recipes4linux.com>
Date: Wed, 31 Oct 2012 22:51:36 +0000
Message-ID: <7771107.Eq8j6DjU1y@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <2138001.Tz6ct7Q5r8@helios>
References: <20121030115615.77684awm7w5p1fqc@webmail.recipes4linux.com>
	<20121031125742.78794k4e3lgpz30g@webmail.recipes4linux.com>
	<2138001.Tz6ct7Q5r8@helios>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gtk+ native recipe question
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
X-List-Received-Date: Wed, 31 Oct 2012 23:05:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 31 October 2012 22:31:44 Paul Eggleton wrote:
> On Wednesday 31 October 2012 12:57:42 T.Michael Turney wrote:
> > These package recipes were modified for reason:
> > gtk+  : issue mentioned in this post, pulling in host glib
> 
> Looks like this one has already been fixed.
> 
> > orc   : bad code in examples, honestly no idea how it built on Fedora
> 
> Not sure about this one; it's not one that I build regularly myself, perhaps
> someone else can shed some light but one suspects you'd need to be more
> specific about the actual error.
> 
> > pango : add libxrender-native to DEPENDS_virtclass-native
> 
> libxrender(-native) does seem to be missing in DEPENDS(_virtclass-native)
> and the configure script does refer to it. I suspect we haven't hit it
> often due to the order of dependencies being built that themselves do have
> libxrender in DEPENDS, but we still need to fix it in the pango recipe.
> 
> > perl  : change glibpth to reference Ubuntu 64-bit library paths
> 
> We've fixed a lot of perl issues since early 2011. Searching through, I
> think that this was fixed in March 2011.
> 
> > soci  : added configure.in.patch to correctly set SQLITE3_DIRS, as
> > with orc, no idea how this built on Fedora
> 
> soci? I can't seem to find a recipe here for that - is that a recipe you
> have created?
> 
> > > So, the version in master and the danny branch (most recent stable, just
> > > branched the other day) already includes this. Are you using a different
> > > branch/release?
> > 
> > We took snapshot at beginning of 2011, last commit in git tree prior
> > to our mods is:
> > 
> > af8541c1ba14f5b075f5fdf93fc7f0689656432c
> > Author: Alex Ferguson <thoughtmonster@gmail.com>  2011-01-31 08:43:44
> > 
> > I realize this somewhat limits interest in this issue, hence my original
> > query to just better understand the build system and an idea of what I
> > should be looking at in terms of bitbake/openembedded dependencies.
> 
> I would strongly recommend using one of the stable branches / tags rather
> than just taking an arbitrary snapshot, in conjunction with an appropriate
> stable release of bitbake. Do otherwise and it becomes more difficult for
> us to support. FWIW, the denzil branch is the oldest branch which we
> actively support now, although folks in the community are welcome to
> continue support for older stable branches if they wish.

What I had neglected to do was to check where the revision you pointed to, 
af8541c1ba14f5b075f5fdf93fc7f0689656432c, was actually from. This is an OE-
Classic revision, so knowing that I can understand you having taken a snapshot 
at a particular date as this was a recommended approach in the old OE-Classic 
days.

If you've not seen this already you may find it informative:

http://www.openembedded.org/wiki/OpenEmbedded-Core

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


