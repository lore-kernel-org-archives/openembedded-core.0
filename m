Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AFA74774AD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 19:38:45 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2016 12:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,407,1459839600"; d="scan'208";a="115060173"
Received: from ahmadjaz-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.169.128])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 12:38:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Fri, 03 Jun 2016 07:38:40 +1200
Message-ID: <1570741.InmcqNLx36@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.9-300.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <0d8a5a78-304b-5018-556d-d586149d0fde@windriver.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<16461829.3PMlXGZ7eP@peggleto-mobl.ger.corp.intel.com>
	<0d8a5a78-304b-5018-556d-d586149d0fde@windriver.com>
MIME-Version: 1.0
Cc: Chris Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/42] gcc: Add gcc6 recipes
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
X-List-Received-Date: Thu, 02 Jun 2016 19:38:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 02 Jun 2016 15:30:14 Bruce Ashfield wrote:
> On 2016-06-02 3:24 PM, Paul Eggleton wrote:
> > On Thu, 02 Jun 2016 15:19:37 Bruce Ashfield wrote:
> >> On 2016-06-02 3:15 PM, Paul Eggleton wrote:
> >>> On Thu, 02 Jun 2016 18:05:35 Martin Jansa wrote:
> >>>> On Wed, Jun 01, 2016 at 10:23:35AM +1200, Paul Eggleton wrote:
> >>>>> On Wed, 01 Jun 2016 10:20:23 Paul Eggleton wrote:
> >>>>>> On Tue, 31 May 2016 11:12:21 Jussi Kukkonen wrote:
> >>>>>>> On 11 May 2016 at 20:35, Khem Raj <raj.khem@gmail.com> wrote:
> >>>>>>>> +#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
> >>>>>>>> +BASEURI ?= "git://
> >>>>>>>> github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
> >>>>>>> 
> >>>>>>> I guess this is where git2_github.com.gcc-mirror.gcc.tar.gz download
> >>>>>>> comes from? It increased the size of my downloads-directory by >30%
> >>>>>>> --
> >>>>>>> and I must have quite a bit of old junk in that directory already.
> >>>>>>> 
> >>>>>>> Is there no other solution to this than a 2.5G git copy (honest
> >>>>>>> question, I don't know gcc)?
> >>>>>> 
> >>>>>> We went down this road before and it wasn't great for users. There is
> >>>>>> at
> >>>>>> least a tarball for 6.1, we'd presumably need some patches on top of
> >>>>>> that (~43 if we were to simply take what's in the gcc-6-branch
> >>>>>> between
> >>>>>> 6.1 and bd9a826, minus the "daily bumps").
> >>>>> 
> >>>>> Perhaps that was a little unclear - when I say "we went down this road
> >>>>> before" I'm agreeing with Jussi - we pointed to a git branch in a
> >>>>> previous release with the same resulting huge download for everyone,
> >>>>> something I think we should avoid if at all possible.
> >>>> 
> >>>> Maybe it's biggest but at least there is only one copy of it:
> >>>> 
> >>>> top 10 in my downloads (archives and then git clones).
> >>>> 
> >>>> 823M
> >>>> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.14.git.tar.gz
> >>>> 831M
> >>>> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.10.git.tar.gz
> >>>> 893M
> >>>> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.17.git.tar.gz
> >>>> 934M
> >>>> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-3.19.git.tar.gz
> >>>> 969M
> >>>> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-4.1.git.tar.gz
> >>>> 1.2G
> >>>> /OE/downloads/git2_git.yoctoproject.org.linux-yocto-dev.git.tar.gz
> >>>> 
> >>>> 2.4G    /OE/downloads/git2_github.com.gcc-mirror.gcc.tar.gz
> >>>> 
> >>>> 854M   
> >>>> /OE/downloads/git2/github.com.qtproject.qtwebengine-chromium.git
> >>>> 
> >>>> 877M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.10.git
> >>>> 900M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.14.git
> >>>> 921M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.17.git
> >>>> 964M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-3.19.git
> >>>> 999M    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-4.1.git
> >>>> 1.3G    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-dev.git
> >>>> 2.3G    /OE/downloads/git2/git.yoctoproject.org.linux-yocto-4.4.git
> >>> 
> >>> No argument from me there - it does seem a little wasteful given that
> >>> there must be a huge overlap between those repos.
> >> 
> >> In other build systems, I've simply been able to reference a common
> >> repository for the majority of the blobs. That isn't an option with
> >> oe/bitbake (as far as I know).
> > 
> > It's possible we could add functionality along those lines to at least
> > save download time; disk usage would probably be unaffected though.
> 
> Nope. Disk usage goes down as well. With alternate objects, each
> repo is only the size of what is unique to the repo.

I guess it depends on how you do it. Reducing both would be ideal, of course.
 
> >> We could also do shallow clones, but I'm also unsure of how well that
> >> is supported.
> > 
> > I know Chris looked into adding this, I don't recall how far he got.
> > 
> >> With the amount of series that are completely rebased and dynamic in
> >> content, the trees do need to be separate per version. It becomes
> >> completely un-bisectable and maintainable any other way.
> > 
> > Bisectability is function of how the branch is managed, not the repository
> > - surely? Perhaps I'm missing something.
> 
> Terminology perhaps? branch, repository .. whatever. They are all
> the same.
> 
> Granularity of kernel commits. Over time with features like lttng,
> aufs, preempt-rt, backports, etc, etc, It becomes impossible to
> integrate new features and kernel updates without conflicts.
> 
> You end up with a tree riddled with merge commits, reverts and other
> garbage that obscure the real changes.
> 
> I've lived that life, and its a not fun.

I don't think anyone would want to move to that model, I agree it's ugly. It 
seems to me that one repo doesn't mandate that though - all it would require 
would be unique branch names, so you'd end up multiplying the number of 
standard/xxx branches by the number of versions. We should definitely try 
going down the alternate objects / shallow clones routes first before 
potentially breaking people's workflow however.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

