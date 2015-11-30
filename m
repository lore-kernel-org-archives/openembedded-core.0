Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A3FD0606D1;
	Mon, 30 Nov 2015 18:49:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 30 Nov 2015 10:49:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,365,1444719600"; d="scan'208";a="850700986"
Received: from mbintiha-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.172.103])
	by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2015 10:49:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 01 Dec 2015 07:49:50 +1300
Message-ID: <41399562.aYmIK0zX5I@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.6-301.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <565C6907.3020501@gmail.com>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
	<565C6907.3020501@gmail.com>
MIME-Version: 1.0
Cc: openembedded-architecture@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: Patchwork & patch handling improvements
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
X-List-Received-Date: Mon, 30 Nov 2015 18:49:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Trevor,

On Mon, 30 Nov 2015 10:19:35 Trevor Woerner wrote:
> On 11/26/15 16:00, Paul Eggleton wrote:
> > I'm also
> > trying to ensure that the patch validation is generic enough so it can
> > live in OE-Core, and thus we can easily update and refine it over time in
> > line with the code itself as well as encourage submitters to use the
> > script on their own changes before sending.
> 
> This all sounds like an improvement and is therefore a step in the right
> direction :-)
> 
> A while back I had the idea of "porting" the kernel's "checkpatch.pl" to
> The Yocto Project (it was around the same time that I was trying to
> float the whole "Maintainers File" idea too, since I was also trying to
> re-purpose "get-maintainer.pl" as well). About one minute into that
> effort I realized the existing *.bb files were all over the place in
> terms of the order of statements and the order of the blocks of
> statements. At that time I found one recipe style guide from OE, and
> another one from The Yocto Project, each of which described a slightly
> different preference. So I asked on the mailing list and quickly
> discovered that both groups prefer a different style.
> 
> I'm not saying this job isn't worth doing, but I am pointing out there's
> the potential for feathers to be ruffled on both sides if someone tries
> to produce a definitive style guide for recipe files and then enforces
> it in an automated way. Since it is the OpenEmbedded Project's job to
> provide the recipes for The Yocto Project, I'm guessing this question
> needs to be decided by them? If that sounds reasonable, then maybe The
> Yocto Project needs to acquiesce to OE's decision?

I don't think there's that much of a division. I don't recall if it was you 
that raised it at the time but the issue of having two style guides did get 
rectified - I changed the one on the Yocto Project wiki to simply be a link to 
the OE style guide in June last year. It certainly didn't come about through a 
conscious decision to have a different style.

However there is a minor disagreement over indentation for shell functions 
between OE-Core and other layers - this persists because of the backporting 
pain a blanket replacement would potentially lead to. As I recall this did get 
discussed at the OE TSC level. I think that's one thing we could just not 
evaluate (or make an option) until such time as we resolve the difference - and 
I do mean to see it resolved at some point in the future.

> Instead of cross-posting, maybe this would be a good email for the new
> architecture list (CC'ed)?

Perhaps yes; I'm a bit concerned that list still doesn't have that many 
subscribers though (currently 28, two of which are the same person).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

