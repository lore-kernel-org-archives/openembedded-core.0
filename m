Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 825D970101
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 09:11:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jul 2017 02:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,302,1496127600"; d="scan'208";a="1147258168"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2017 02:11:37 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 58EE858056B;
	Mon,  3 Jul 2017 02:11:36 -0700 (PDT)
Date: Mon, 3 Jul 2017 11:59:47 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170703085947.GA5571@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170629083942.GA14649@linux.intel.com>
	<20170630083717.GA788@linux.intel.com>
	<1498813333.5259.4.camel@intel.com>
	<20170630122330.GA17125@linux.intel.com>
	<1498828593.5259.7.camel@intel.com>
	<20170630154456.GB28177@linux.intel.com>
	<CAP9ODKq3mB=0GBAZt21A3Ljw77TiNwBdCGZrSQt8L9rcr_i-Yw@mail.gmail.com>
	<1498847670.5259.9.camel@intel.com>
	<20170703073115.GA5380@linux.intel.com>
	<1499068412.5259.71.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1499068412.5259.71.camel@intel.com>
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
X-List-Received-Date: Mon, 03 Jul 2017 09:11:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 03, 2017 at 09:53:32AM +0200, Patrick Ohly wrote:
> On Mon, 2017-07-03 at 10:31 +0300, Ed Bartosh wrote:
> > On Fri, Jun 30, 2017 at 08:34:30PM +0200, Patrick Ohly wrote:
> > > then I don't see a need for any additional flags. Just
> > > don't use the features which result in a rootfs modification.
> > 
> > I also didn't see it till last message from Otavio. Now I do - they
> > don't want to change .wks files. They're using standard wks from
> > scripts/lib/wic/canned-wks or from standard layers and they don't want
> > to duplicate them when they don't want rootfs modifications.
> > 
> > It could be a valid reason to have --no-fstab-update option I think.
> > However, I'm still not 100% convinced I'm ok with this if nobody else
> > objects.
> 
> Okay, now I see what the purpose is.
> 
> I prefer a --no-fstab-update over a general --no-rootfs-update because
> for each case where wic would normally modify the rootfs, some other
> mechanism must be in place which makes that modification redundant (like
> using PARTUUID). Having separate parameters forces the developers to
> think about it. Just my 2 cents...
>

Tha makes sense to me.

From other point of view if the goal is to have rootfs unmodified
--no-rootfs-update would make it easier to achive. Moreover it will
guarantee that rootfs is unmodified even if wic introduces new
functionality that modifies rootfs.

--
Regards,
Ed

