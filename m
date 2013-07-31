Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id C6B226A5AF;
	Wed, 31 Jul 2013 12:50:58 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 31 Jul 2013 05:50:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="339533936"
Received: from unknown (HELO helios.localnet) ([10.252.122.226])
	by azsmga001.ch.intel.com with ESMTP; 31 Jul 2013 05:50:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Wed, 31 Jul 2013 13:50:56 +0100
Message-ID: <8337615.XrjW46moIm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <51F8E0C2.3070102@dresearch-fe.de>
References: <51ECCF5C.2020505@dresearch-fe.de> <6366141.Q5aULPr4OG@helios>
	<51F8E0C2.3070102@dresearch-fe.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] SRC_URI and latest HEAD revision with git (in oe-classic)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jul 2013 12:50:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 31 July 2013 12:02:42 Steffen Sledz wrote:
> On 22.07.2013 11:51, Paul Eggleton wrote:
> > On Monday 22 July 2013 11:46:23 Steffen Sledz wrote:
> >> On 22.07.2013 11:01, Nicolas Dechesne wrote:
> >>> On Mon, Jul 22, 2013 at 8:21 AM, Steffen Sledz <sledz@dresearch-fe.de
> >>> 
> >>> <mailto:sledz@dresearch-fe.de>> wrote:
> >>>> After being OE abstinent for some months i'd like to ask what is the
> >>>> current suggested method for recipes building from the HEAD revision of
> >>>> a git repository (we need this for continuous integration).
> >>>> 
> >>>> I read some RFC's in the ml about PKGV/PKGR stuff, but i miss a final
> >>>> decision, documentation and a good example.>
> >>> 
> >>> you can use ${AUTOREV} for this purpose. You can look at poky-bleeding
> >>> distro config for such an example.
> >>> 
> >>> e.g.
> >>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/conf/dist
> >>> r
> >>> o/include/poky-floating-revisions.inc
> >> 
> >> Hmmmm? This doesn't seem the work.
> >> 
> >> Here's what i tried in my recipe:
> >> 
> >> ------------> snip <------------
> >> PR = "r3"
> >> 
> >> SRCREV="${AUTOREV}"
> >> PV = "gitr${SRCPV}"
> >> ------------> snip <------------
> >> 
> >> But i get package versions like
> >> 
> >>   gitr0+53b64e717404d282d0c58b7fa4a4e74ab2ca81ba-r3
> >> 
> >> where SRCPB is always 0. :(
> >> 
> >> A bit more description and/or a complete example would be very helpful.
> > 
> > If you want these to increment now AIUI you need to be using the PR
> > server:
> > 
> > https://wiki.yoctoproject.org/wiki/PR_Service
> 
> And here comes my next really big problem. :(
> 
> We're sitting on an big, old but active project based on oe-classic and
> bitbake 1.12.0. Irksomely we're forced to switch from SVN to GIT for this
> project. So we need the AUTOREV/PRSERV stuff for this old environment too.
> 
> Has anyone tried to backport the feature to an older bitbake/oe-classic
> environment? Or can someone give some hints what's to do?

I'm not sure, but my gut feeling is you'd be better off trying to bring the 
project up to be based on OE-Core rather than trying to bring such 
functionality back to OE-Classic, particularly since for full functionality it 
requires signature-based tasks that are only supported with current versions 
of bitbake and require support from the metadata. You'd be trading some 
hopefully short-term pain for long-term gain if the project is going to 
continue for a reasonable amount of time.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

