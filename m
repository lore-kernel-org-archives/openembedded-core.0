Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2566A601D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 20:59:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 22 Feb 2017 12:59:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,196,1484035200"; d="scan'208";a="1101163540"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 22 Feb 2017 12:59:43 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id EBD0E6A4080;
	Wed, 22 Feb 2017 12:59:41 -0800 (PST)
Date: Wed, 22 Feb 2017 22:53:35 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170222205335.GA13229@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1487690169.git.ed.bartosh@linux.intel.com>
	<CAJTo0LZT_D4gXYRY__zWuDCY9zOKaHL1tmgqppP5=8qJzijn+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZT_D4gXYRY__zWuDCY9zOKaHL1tmgqppP5=8qJzijn+Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] wic: fix for #11017
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
X-List-Received-Date: Wed, 22 Feb 2017 20:59:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 22, 2017 at 04:38:55PM +0000, Burton, Ross wrote:
> Hi Ed,
> 
> Something in your latest patchset is breaking selftest:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-wic/builds/626/steps/CreateWicImages/logs/stdio
> 
> The broken commit is somewhere in ross/mut-wic.  Can you verify that I
> didn't leave something out, or otherwise chase this?
> 
I couldn't reproduce this so far. Will investigate further.

Can you merge this patchset please?
http://lists.openembedded.org/pipermail/openembedded-core/2017-February/132854.html

The failure is most probably caused by patchset from this thread.

Regards,
Ed

> On 21 February 2017 at 15:23, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> 
> > Hi,
> >
> > This patchset improves handling of wic native tool dependencies and
> > fixes minor bugs in the wic code.
> >
> > The following changes since commit 9a0ddad5e178d16f302af2d05c3236
> > 8572849fd3:
> >
> >   wic: pluginbase: use global dictionary (2017-02-20 11:58:28 +0200)
> >
> > are available in the git repository at:
> >
> >   git://git.yoctoproject.org/poky-contrib ed/wic/wip
> >   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip
> >
> > Ed Bartosh (6):
> >   wic: use 2 sysroots to find native executable
> >   wic: use image recipe sysroot as default
> >   wic: exec_native_cmd: improve debug message
> >   wic: exec_native_cmd: fix undefined variable error
> >   wic: add WKS_FILE_DEPENDS variable
> >   wic: raise WicError instead of calling logger.error
> >
> >  meta-selftest/recipes-test/images/wic-image-minimal.bb |  2 +-
> >  meta/classes/image_types_wic.bbclass                   |  2 ++
> >  scripts/lib/wic/plugins/source/bootimg-pcbios.py       |  4 ++--
> >  scripts/lib/wic/utils/misc.py                          | 13 +++++++++----
> >  scripts/wic                                            |  2 +-
> >  5 files changed, 15 insertions(+), 8 deletions(-)
> >
> > --
> > Regards,
> > Ed
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

-- 
--
Regards,
Ed

