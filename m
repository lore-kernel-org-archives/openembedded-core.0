Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D19557828A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 15:47:32 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2017 08:47:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,287,1496127600"; d="scan'208";a="121366400"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 30 Jun 2017 08:47:10 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 7DDE75800C1;
	Fri, 30 Jun 2017 08:47:09 -0700 (PDT)
Date: Fri, 30 Jun 2017 18:44:56 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170630154456.GB28177@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
	<CAP9ODKopDxEYw9vereQjoHve=n2Of2v-3EHbxaiumZN3T0hH8Q@mail.gmail.com>
	<823180ba-066d-747d-8112-a110633a03a8@ossystems.com.br>
	<20170628073121.GA11425@linux.intel.com>
	<CAP9ODKoxxaJv=QZXp5m=Qt14t36n1TPXS19D+Xs3eyrPDG79bg@mail.gmail.com>
	<20170629083942.GA14649@linux.intel.com>
	<20170630083717.GA788@linux.intel.com>
	<1498813333.5259.4.camel@intel.com>
	<20170630122330.GA17125@linux.intel.com>
	<1498828593.5259.7.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1498828593.5259.7.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/5] #11662 - wic should mount /boot
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
X-List-Received-Date: Fri, 30 Jun 2017 15:47:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 30, 2017 at 03:16:33PM +0200, Patrick Ohly wrote:
> On Fri, 2017-06-30 at 15:23 +0300, Ed Bartosh wrote:
> > On Fri, Jun 30, 2017 at 11:02:13AM +0200, Patrick Ohly wrote:
> > > On Fri, 2017-06-30 at 11:37 +0300, Ed Bartosh wrote:
> > > > > I'm not sure I understand this. If you don't want fstab to be
> > > > changed
> > > > > you should not specify mount points in .wks
> > > > > There is only one reason to have mount points in .wks: to make wic
> > > > to
> > > > > change /etc/fstab, which you apparently don't want. So, don't
> > > > specify
> > > > > mount points and you'll have what you want.
> > > > > 
> > > > > Having additional option for this looks redundand to me.
> > > > 
> > > > After thinking a bit more about it I'd propose to have global wic
> > > > option
> > > > to avoid rootfs content changes. Not just fstab updates, but any
> > > > changes. For now this option (--no-rootfs-update ?) should prevent
> > > > creating
> > > > images if either mount points are specified or --exclude-path is used
> > > > in .wks
> > > 
> > > Why does --exclude-path conflict with --no-rootfs-update? Is that a
> > > conceptual problem or an implementation problem?
> > >
> > 
> > I thought that removing directories from original rootfs is a
> > modification.
> 
> But it's not actually removed from the original roofs directory, right?
> For me, "not modified" refers to that and the files in it.

We're talking about different things here, I guess. For me if target
rootfs content in the image is different from rootfs produced by bitbake
it means it's modified.

BTW, if this patchset is accepted wic will not be changing fstab in original rootfs anymore:
http://lists.openembedded.org/pipermail/openembedded-core/2017-June/138803.html
However, it would not mean that rootfs is not changed.

--
Regards,
Ed

