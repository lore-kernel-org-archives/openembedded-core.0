Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DD17960767;
	Wed,  2 Dec 2015 03:01:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 01 Dec 2015 19:01:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,371,1444719600"; d="scan'208";a="698419164"
Received: from hlim3-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.190])
	by orsmga003.jf.intel.com with ESMTP; 01 Dec 2015 19:01:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 02 Dec 2015 16:01:40 +1300
Message-ID: <9135219.GRnf9JIkFP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.6-301.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <20151201104720.GB2251@jama>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
	<41399562.aYmIK0zX5I@peggleto-mobl.ger.corp.intel.com>
	<20151201104720.GB2251@jama>
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
X-List-Received-Date: Wed, 02 Dec 2015 03:01:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 01 Dec 2015 11:47:20 Martin Jansa wrote:
> On Tue, Dec 01, 2015 at 07:49:50AM +1300, Paul Eggleton wrote:
> > Hi Trevor,
> > 
> > On Mon, 30 Nov 2015 10:19:35 Trevor Woerner wrote:
> > > On 11/26/15 16:00, Paul Eggleton wrote:
> > > > I'm also
> > > > trying to ensure that the patch validation is generic enough so it can
> > > > live in OE-Core, and thus we can easily update and refine it over time
> > > > in
> > > > line with the code itself as well as encourage submitters to use the
> > > > script on their own changes before sending.
> > > 
> > > This all sounds like an improvement and is therefore a step in the right
> > > direction :-)
> > > 
> > > A while back I had the idea of "porting" the kernel's "checkpatch.pl" to
> > > The Yocto Project (it was around the same time that I was trying to
> > > float the whole "Maintainers File" idea too, since I was also trying to
> > > re-purpose "get-maintainer.pl" as well). About one minute into that
> > > effort I realized the existing *.bb files were all over the place in
> > > terms of the order of statements and the order of the blocks of
> > > statements. At that time I found one recipe style guide from OE, and
> > > another one from The Yocto Project, each of which described a slightly
> > > different preference. So I asked on the mailing list and quickly
> > > discovered that both groups prefer a different style.
> > > 
> > > I'm not saying this job isn't worth doing, but I am pointing out there's
> > > the potential for feathers to be ruffled on both sides if someone tries
> > > to produce a definitive style guide for recipe files and then enforces
> > > it in an automated way. Since it is the OpenEmbedded Project's job to
> > > provide the recipes for The Yocto Project, I'm guessing this question
> > > needs to be decided by them? If that sounds reasonable, then maybe The
> > > Yocto Project needs to acquiesce to OE's decision?
> > 
> > I don't think there's that much of a division. I don't recall if it was
> > you
> > that raised it at the time but the issue of having two style guides did
> > get
> > rectified - I changed the one on the Yocto Project wiki to simply be a
> > link to the OE style guide in June last year. It certainly didn't come
> > about through a conscious decision to have a different style.
> > 
> > However there is a minor disagreement over indentation for shell functions
> > between OE-Core and other layers - this persists because of the
> > backporting
> > pain a blanket replacement would potentially lead to. As I recall this did
> > get discussed at the OE TSC level. I think that's one thing we could just
> > not evaluate (or make an option) until such time as we resolve the
> > difference - and I do mean to see it resolved at some point in the
> > future.
> 
> Using consistent indentation (4 spaces) at least for new metadata would
> be step in right direction.
> 
> With the amount of changes which are backported to older releases I
> still don't see this "backporting pain" argument. Doing it just before
> the release is of course useful, because e.g. now more changes will be
> backported to Jethro than to Fido or Dizzy. So having consistent
> indentation in Jethro and master would prevent 95% of "backporting
> pain". Maybe some Yocto 10.0 will finally get the meaning of
> "consistent" indentation.

I agree it's not ideal. I said above, I do want to see it resolved.

Leaving indentation aside for a moment do you have any comments on my 
proposal?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

