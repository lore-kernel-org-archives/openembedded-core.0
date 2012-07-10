Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SofHL-0006BA-Qw
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 20:35:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Jul 2012 11:24:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="163901181"
Received: from unknown (HELO [10.255.13.35]) ([10.255.13.35])
	by orsmga001.jf.intel.com with ESMTP; 10 Jul 2012 11:24:07 -0700
Message-ID: <1341944639.6761.287.camel@trz-ThinkPad-T420>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 10 Jul 2012 13:23:59 -0500
In-Reply-To: <4FFC63CA.9070007@linux.intel.com>
References: <cover.1341933187.git.bruce.ashfield@windriver.com>
	<4FFC63CA.9070007@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] linux-yocto: perf, unionfs, yaffs2 fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2012 18:35:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-10 at 10:18 -0700, Saul Wold wrote:
> On 07/10/2012 10:11 AM, Bruce Ashfield wrote:
> > Saul,
> >
> > Here are the SRCREV updates to activate Tom's mips perf fix (3.2
> > and 3.4).
> >
> > For 3.4, we also have a yaffs2 and unionfs fix.
> >
> Bruce, Tom:
> 
> Can you generate a single patch set that contains both the kernel update 
> and any perf recipe changes.  That will avoid any further confusion.
> 

Saul,

I don't think it makes sense to repost the patches, but if you use the
latest kernel SRCREVs and the latest perf-scripting/perf-tui patchset,
you should have the latest wrt this patchset:

	[PATCH 0/2] linux-yocto: perf, unionfs, yaffs2 fixes

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/025455.html

	[PATCH 0/3] perf-scripting/perf-tui features, v3

http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/025321.html

Thanks,

Tom

> Thanks
> 	Sau!
> 
> > Cheers,
> >
> > Bruce
> >
> > The following changes since commit 029e3cea52f86438a1d6868020b8888b5c93d623:
> >
> >    bitbake: fetch2/wget: Use FETCHCMD_wget to provide the commandline and options (2012-07-10 14:25:38 +0100)
> >
> > are available in the git repository at:
> >    git://git.pokylinux.org/poky-contrib zedd/kernel
> >    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> >
> > Bruce Ashfield (2):
> >    linux-yocto/3.2: perf: fix mips build
> >    linux-yocto/3.4: perf, unionfs and yaffs2 fixes
> >
> >   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    4 ++--
> >   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    4 ++--
> >   meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    2 +-
> >   meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   12 ++++++------
> >   meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   12 ++++++------
> >   5 files changed, 17 insertions(+), 17 deletions(-)
> >
> 




