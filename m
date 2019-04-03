Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B61827D422;
	Wed,  3 Apr 2019 23:07:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2019 16:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; d="scan'208";a="334775587"
Received: from mnandy-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.173.211])
	by fmsmga005.fm.intel.com with ESMTP; 03 Apr 2019 16:07:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: yocto@yoctoproject.org,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 04 Apr 2019 12:07:02 +1300
Message-ID: <2189093.Hm6Vq2XZhg@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <CAMKF1srb2EgL7tYZDFoq2EqABp-+_eib2u2OZMwT6B3TVgNk=Q@mail.gmail.com>
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<20190403144110.GG4664@bill-the-cat>
	<CAMKF1srb2EgL7tYZDFoq2EqABp-+_eib2u2OZMwT6B3TVgNk=Q@mail.gmail.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Adrian Bunk <bunk@stusta.de>
Subject: Re: [yocto] [oe] Git commit process question.
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
X-List-Received-Date: Wed, 03 Apr 2019 23:07:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 4 April 2019 5:46:04 AM NZDT Khem Raj wrote:
> On Wed, Apr 3, 2019 at 7:41 AM Tom Rini <trini@konsulko.com> wrote:
> >
> > On Wed, Apr 03, 2019 at 11:30:39AM +0100, Burton, Ross wrote:
> > > On Tue, 2 Apr 2019 at 20:46, Tom Rini <trini@konsulko.com> wrote:
> > > > > The kernel does not have "upgrade foo to the latest upstream
> > > > > version" commits.
> > > > >
> > > > > With the Automatic Upgrade Helper this is a semi-automatic task, and
> > > > > most of the time there is no specific motivation other than
> > > > > upgrading
> > > > > to the latest upstream version.
> > > >
> > > > But since that's just filling in a template the body can also be a
> > > > template perhaps with useful AUH data (run at ... by ... ?) ?
> > >
> > > Apart from making the commit message longer what does this achieve?
> > > The commit already has a timestamp and author.
> >
> > It's an etiquette thing.  Subject+Sign-off+Empty body is bad form.  AUH
> > updates are a form of "trivial update" that every project has.  "Update
> > $X from version $Y to $Z" is what a human would normally put.  It's
> > weird looking at git log of nothing but subject+signed-off-by.  I'm not
> > going to object further on this point, but I don't get it.
> 
> if the content of subject is being repeated in body then I would
> prefer an empty body
> redundant information in commits should be avoided since it can create
> impression that body does not have
> useful information and skip reading it. We should strive to make commits
> concise and useful.

There is often (I won't say always, but often) something useful you can put in 
the commit message. If it's a recipe upgrade, you could put a pointer to the 
upstream changelog in it, for example. As the person doing the upgrade if your 
prior review of that changelog or other upstream release documentation 
indicated any backwards-compatibility issues or CVEs fixed then those really 
ought to be mentioned as well; if you're feeling especially generous you might 
mention highlights of any new functionality. (I have a proposal that might 
help us automate part of that which I've not yet fully fleshed out, hopefully 
one day soon I will get around to it.)

The issue of empty commit messages is something I've complained about in the 
past, and not just about recipe upgrades. If I - as someone who is relatively 
familiar with OE - have to actually read beyond the shortlog / commit message 
to understand the basics of why a change has been made, then it's likely that 
the commit message wasn't good enough. Unlike other issues, once a commit goes 
in the message is set in stone within the git history, so if you are working 
on a change, *please* take a minute or two to document it adequately in the 
commit message so that others looking back can understand it.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



