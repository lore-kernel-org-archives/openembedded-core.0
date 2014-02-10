Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E6A5D6E7A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 10:54:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2014 02:54:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,817,1384329600"; d="scan'208";a="478935376"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2014 02:54:26 -0800
Date: Mon, 10 Feb 2014 12:54:24 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140210105423.GD10078@lpalcu-linux>
References: <1391693941-25938-1-git-send-email-paul.eggleton@linux.intel.com>
	<20140210053712.GL5112@lpalcu-linux>
	<20140210075949.GA10078@lpalcu-linux>
	<1526681.3gOseygUtX@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1526681.3gOseygUtX@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Richard Purdie <rpurdie@rpsys.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python-smartpm: really ignore conflicts during install with --attempt
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
X-List-Received-Date: Mon, 10 Feb 2014 10:54:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2014 at 10:01:32AM +0000, Paul Eggleton wrote:
> On Monday 10 February 2014 09:59:49 Laurentiu Palcu wrote:
> > On Mon, Feb 10, 2014 at 07:37:12AM +0200, Laurentiu Palcu wrote:
> > > On Sun, Feb 09, 2014 at 11:25:11PM +0000, Richard Purdie wrote:
> > > > On Thu, 2014-02-06 at 13:39 +0000, Paul Eggleton wrote:
> > > > > The original patch added in OE-Core commit
> > > > > bdf07b1698d228dc7ff555199a269b1ff8ceca19 was supposed to ignore
> > > > > conflicts, but it was unable to do so because it wasn't raising errors
> > > > > in the right place. When the --attempt option is used (as is done in
> > > > > complementary package installation for RPM), raise errors immediately
> > > > > on conflicts, catch errors at the right point so that requested
> > > > > packages
> > > > > and their dependencies can be ignored, and print appropriate warnings
> > > > > when doing so.
> > > > > 
> > > > > Fixes [YOCTO #5313].
> > > > > 
> > > > > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > > > > ---
> > > > > 
> > > > >  .../python/python-smartpm/smart-attempt.patch      | 134
> > > > >  +++++++++++++++++++-- 1 file changed, 121 insertions(+), 13
> > > > >  deletions(-)
> > > > 
> > > > Could you take a look at:
> > > > 
> > > > http://autobuilder.yoctoproject.org/main/builders/nightly-multilib/build
> > > > s/22
> > > > 
> > > > please?
> > > > 
> > > > I've not 100% confirmed it was this change, it could be something else
> > > > (e.g. Laurentiu's rootfs changes) but something in master-next broke
> > > > multilib :/
> > > 
> > > I'll do a build locally with your master-next changes and see what
> > > happens. At first sight, it looks like an issue with the rootfs
> > > changes. However, 'smart channel --add' is not the command I was
> > > expecting to fail...
> > 
> > I pushed a fix on poky-contrib:lpalcu/rootfs_refactoring_ship_oecore
> > 
> > lib/oe/package_manager.py: RpmPM: fix issue with multilib builds
> 
> The lack of detail in the error message is a little bit concerning - we're not 
> getting the output from smart in the log, so other than the return value it's 
> hard to determine what might have gone wrong. Is this something that could be 
> fixed as well?
Sure, I'll prepare another patch that will print all the errors in the
log.

laurentiu
> 
> Cheers,
> Paul
> 
> -- 
> 
> Paul Eggleton
> Intel Open Source Technology Centre

