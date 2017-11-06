Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 16DCF700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 11:10:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Nov 2017 03:10:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,352,1505804400"; d="scan'208";a="1240245577"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2017 03:10:14 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id D148E5801D2;
	Mon,  6 Nov 2017 03:10:13 -0800 (PST)
Date: Mon, 6 Nov 2017 12:08:29 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20171106100829.nqhna6hugyqe636k@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<20171010210149.GE12015@bill-the-cat>
	<20171020131505.GG12015@bill-the-cat>
	<20171103125150.GA32663@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20171103125150.GA32663@bill-the-cat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] wic: When using --use-uuid make sure that we update the fstab with PARTUUID
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
X-List-Received-Date: Mon, 06 Nov 2017 11:10:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 03, 2017 at 08:51:50AM -0400, Tom Rini wrote:
> On Fri, Oct 20, 2017 at 09:15:05AM -0400, Tom Rini wrote:
> > On Tue, Oct 10, 2017 at 05:01:49PM -0400, Tom Rini wrote:
> > > On Thu, Sep 21, 2017 at 01:46:16PM -0400, Tom Rini wrote:
> > > > When we have been told to use the UUID we should also update the fstab
> > > > to make use of PARTUUID instead of hard-coding the device in question.
> > > > This will make the resulting image much more portable.
> > > > 
> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > > ---
> > > >  scripts/lib/wic/plugins/imager/direct.py | 9 ++++++---
> > > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > > 
> > > Where we did we end up with this?  Ed pointed out that you can tell wic
> > > to use a specific UUID, so reproducible images are not a problem.  And
> > > making images that are readily portable is why other distros use
> > > UUID/LABEL and not device names as much as possible.  I personally enjoy
> > > being able to put an image on uSD for minnow and have it work :)
> > > Thanks!
> > 
> > ping?
> 
> I was just reminded about the real problems this solves (swap isn't
> /dev/sda3, boot is being excessively slow), so, ping?
> 

I'm generally ok with the patchset. The only thing I'm thinking of is if busybox mount
supports PARTUUID syntax in fstab. Can you check this, please?

I'd like to see Otavio's confirmation that --uuid option solves
his reproducible builds concern.

Can you rebase your patchset on top of current master?
It would be also nice to get this functionality covered by tests.

--
Regards,
Ed

