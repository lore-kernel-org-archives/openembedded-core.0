Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6B78572F7D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489587353; x=1521123353;
	h=date:from:to:cc:subject:message-id:reply-to:references:
	mime-version:in-reply-to;
	bh=U2rGSGYHNSNFESrOwmBfgvu6eepX5boXulxisgYp4Uo=;
	b=BcAEOKojiUaOQsDl1QWMDzkIHjozr1k7YT9PdA6eS8/eexZgViXq1IYS
	Z/vvB7UyMJZwr/CrYqSMSfT5pvkZ5w==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 07:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,168,1486454400"; d="scan'208";a="60699905"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2017 07:15:51 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 7EDFE2C8001;
	Wed, 15 Mar 2017 07:15:46 -0700 (PDT)
Date: Wed, 15 Mar 2017 16:01:43 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170315140143.GA17397@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <7d4a770f-25c6-5747-5a5c-370c822f2efb@mlbassoc.com>
	<20170308134349.GA16099@linux.intel.com>
	<a0d78645-9670-f3a1-cd9d-d66370e89ef9@phytec.de>
	<20170314171147.GA28498@linux.intel.com>
	<1489513785.6396.83.camel@intel.com>
	<20170314180644.GA22000@linux.intel.com>
	<1489562674.6396.89.camel@intel.com>
	<20170315125810.GA28986@linux.intel.com>
	<1489585158.6396.102.camel@intel.com>
	<1489585294.6396.104.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1489585294.6396.104.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
Subject: Re: Create more than one image with WIC
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
X-List-Received-Date: Wed, 15 Mar 2017 14:15:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 15, 2017 at 02:41:34PM +0100, Patrick Ohly wrote:
> On Wed, 2017-03-15 at 14:39 +0100, Patrick Ohly wrote:
> > On Wed, 2017-03-15 at 14:58 +0200, Ed Bartosh wrote:
> > > Regarding do_rm_work. It should not touch rootfs directories, I believe.
> > 

> It does, and it should by default because a rootfs can be quite large.
> If it's not going to be reused in another recipe, then it is worthwhile
> to remove it.
This is true unless we're going to use wic as a stand-alone tool, which some
people still do.

> I should add that RM_WORK_EXCLUDE_ITEMS += "rootfs" can be used in image
> recipes which know that their rootfs is going to be needed elsewhere -
> it's just not the default.

Isn't rootfs going to be rebuilt if one rootfs recipe depends on another one?

--
Regards,
Ed

