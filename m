Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AB9A17862D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 12:11:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Sep 2017 05:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,387,1500966000"; d="scan'208";a="1171825106"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 13 Sep 2017 05:11:41 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id A1B275803DB;
	Wed, 13 Sep 2017 05:11:40 -0700 (PDT)
Date: Wed, 13 Sep 2017 15:10:48 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20170913121048.j6kprrtztds6zm4h@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170908173303.29634-1-enrico.scholz@sigma-chemnitz.de>
	<20170908173303.29634-4-enrico.scholz@sigma-chemnitz.de>
	<20170911134150.6jpsypaj4dgjv67t@linux.intel.com>
	<lyzia1fi13.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20170912085301.rfsiwojqn2nr6md5@linux.intel.com>
	<lymv60fdzx.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20170912114837.ytzatxdw2cqcwsyz@linux.intel.com>
	<lya820f6u6.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20170912125720.lj6rwuclmbrd6fx2@linux.intel.com>
	<lyk214dp9f.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <lyk214dp9f.fsf@ensc-virt.intern.sigma-chemnitz.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] wic: apply --extra-space + --overhead to squashfs
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
X-List-Received-Date: Wed, 13 Sep 2017 12:11:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 12, 2017 at 03:23:40PM +0200, Enrico Scholz wrote:
> Ed Bartosh <ed.bartosh@linux.intel.com> writes:
> 
> > I agree. --size is less suitable for your needs than extra space and
> > overhead factor. I still don't like the idea of using them to reserve
> > non-formatted space.
> 
> Btw, exactly this is done for extX already.
> 

Are you sure?
I don't see where we produce unformatted space on extX partitions.
Can you point me out?

--
Regards,
Ed

