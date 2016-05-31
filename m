Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 35B8977213
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 22:23:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 31 May 2016 15:23:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,397,1459839600"; d="scan'208";a="711867723"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.146.125])
	by FMSMGA003.fm.intel.com with ESMTP; 31 May 2016 15:23:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 01 Jun 2016 10:23:35 +1200
Message-ID: <1570473.5iIQe2jHu3@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.9-300.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <3214370.KVsKdKNYRI@peggleto-mobl.ger.corp.intel.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<CAHiDW_H7EpNa6cPQxinNdq5WHvjxOQ81bEOZTWVECTOprU+8zg@mail.gmail.com>
	<3214370.KVsKdKNYRI@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 31 May 2016 22:23:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 01 Jun 2016 10:20:23 Paul Eggleton wrote:
> On Tue, 31 May 2016 11:12:21 Jussi Kukkonen wrote:
> > On 11 May 2016 at 20:35, Khem Raj <raj.khem@gmail.com> wrote:
> > > +#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
> > > +BASEURI ?= "git://
> > > github.com/gcc-mirror/gcc;branch=gcc-6-branch;protocol=git"
> > 
> > I guess this is where git2_github.com.gcc-mirror.gcc.tar.gz download comes
> > from? It increased the size of my downloads-directory by >30% -- and I
> > must
> > have quite a bit of old junk in that directory already.
> > 
> > Is there no other solution to this than a 2.5G git copy (honest question,
> > I
> > don't know gcc)?
> 
> We went down this road before and it wasn't great for users. There is at
> least a tarball for 6.1, we'd presumably need some patches on top of that
> (~43 if we were to simply take what's in the gcc-6-branch between 6.1 and
> bd9a826, minus the "daily bumps").

Perhaps that was a little unclear - when I say "we went down this road before" 
I'm agreeing with Jussi - we pointed to a git branch in a previous release 
with the same resulting huge download for everyone, something I think we 
should avoid if at all possible.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

