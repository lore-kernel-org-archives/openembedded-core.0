Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1BB716065F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 17:03:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2013 10:00:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,943,1367996400"; d="scan'208";a="392308286"
Received: from unknown (HELO [10.7.201.53]) ([10.7.201.53])
	by orsmga002.jf.intel.com with ESMTP; 23 Aug 2013 10:03:12 -0700
Message-ID: <1377277389.5259.51.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 23 Aug 2013 10:03:09 -0700
In-Reply-To: <5216C1B9.6040205@windriver.com>
References: <cover.1377175027.git.liezhi.yang@windriver.com>
	<8e9bbd9609efd20317fd4c2617ec293b49ee84bb.1377175027.git.liezhi.yang@windriver.com>
	<1377192216.5259.6.camel@dvhart-mobl4.amr.corp.intel.com>
	<5216C1B9.6040205@windriver.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] e2fsprogs: only update the icache for ext2_inode
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
X-List-Received-Date: Fri, 23 Aug 2013 17:03:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-08-23 at 09:58 +0800, Robert Yang wrote:
> On 08/23/2013 01:23 AM, Darren Hart wrote:
> > On Thu, 2013-08-22 at 09:13 -0400, Robert Yang wrote:
> >> We only read the cache when:
> >>
> >> bufsize == sizeof(struct ext2_inode)
> >>
> >> then we should only update the cache in the same condition, otherwise
> >> there would be errors, for example:
> >>
> >> cache[0]: cached ino 14 when bufsize = 128 by ext2fs_write_inode_full()
> >> cache[1]: cached ino 14 when bufsize = 156 by ext2fs_read_inode_full()
> >>
> >> Then update the cache:
> >> cache[0]: cached ino 15 when bufsize = 156 by ext2fs_read_inode_full()
> >>
> >> Then the ino 14 would hit the cache[1] when bufsize = 128 (but it was
> >> cached by bufsize = 156), so there would be errors.
> >
> >> [YOCTO #3848]
> >>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >
> >
> >> +Upstream-Status: [Inappropriate]
> >
> > Hrm... why is this one inappropriate?
> >
> 
> Hi Darren, the upstream has changed the icache lot, so this patch is
> inappropriate for the upstream, we can drop this patch when we update
> the package, I had put this in the patch head.

Sorry, I must have missed that.

Acked-by: Darren Hart <dvhart@linux.intel.com>

Thanks Robert!

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



