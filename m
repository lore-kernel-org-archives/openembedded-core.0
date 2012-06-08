Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SczzE-00082F-1R
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 16:16:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Jun 2012 07:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="153534080"
Received: from unknown (HELO [10.255.12.119]) ([10.255.12.119])
	by azsmga001.ch.intel.com with ESMTP; 08 Jun 2012 07:05:52 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <32D32342-6B45-4644-9909-FEB737528DCF@gmail.com>
References: <32D32342-6B45-4644-9909-FEB737528DCF@gmail.com>
Date: Fri, 08 Jun 2012 09:05:25 -0500
Message-ID: <1339164325.26324.0.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Subject: Re: ERROR: ExpansionError during parsing /tool/yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.2.bb: Failure expanding variable SRCPV
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
X-List-Received-Date: Fri, 08 Jun 2012 14:16:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-06-08 at 15:59 +0200, Elvis Dowson wrote:
> Hi,
> 
> On Jun 8, 2012, at 12:58 PM, Richard Purdie wrote:
> 
> > On Thu, 2012-06-07 at 15:59 -0400, Bruce Ashfield wrote:
> >> Richard/Saul,
> >> 
> >> Here's a 9 patch series that is a collection of work that's been
> >> brewing for about three weeks.
> >> 
> >> Highlights include:
> >> 
> >>  - removal of the 2.6.37 recipe, it's time is now gone
> >>  - addition of the 3.4 kernel recipe
> >>      - configuration fixups and audits within that 3.4 kernel
> >>      - kernel *only* support for mips64 mti emulation
> >>  - -stable updates for supported kernels 3.2.18, 3.0.32
> >>  - machine fixes/configurations for the 3.2 and 3.0 kernels
> >>  - kern tool updates, streamlining and fixes
> 
> I just updated my poky installation, and tried to build the meta-toolchain, and I got a bunch of errors. This is related to the recent updates to the linux-yocto_3.2.bb kernel.
> 

I just posted a patch to fix this - it was a SRCREV typo.

Building fine here now with that simple fix...

Tom

> elvis@eos:/tool/yocto/poky/build$ bitbake meta-toolchain
> Pseudo is not present but is required, building this first before the main build
> WARNING: Unable to get checksum for python-numpy SRC_URI entry config.h: file could not be found                                               | ETA:  00:00:43
> WARNING: Unable to get checksum for python-numpy SRC_URI entry numpyconfig.h: file could not be found
> ERROR: ExpansionError during parsing /tool/yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.2.bb: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fetcher failure for URL: 'git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;branch=standard/default/base,meta;name=machine,meta'. The command git ls-remote git://git.yoctoproject.org/linux-yocto-3.2 ee78519365bdb25287703bbc31c06b193263c654l gave empty output unexpectedly
> ERROR: No recipes available for:
>   /tool/yocto/poky/meta-yocto/recipes-core/uclibc/uclibc_git.bbappend
>   /tool/yocto/poky/meta-yocto/recipes-kernel/linux/linux-yocto_3.2.bbappend
>   /tool/yocto/meta-xilinx/recipes-core/util-linux/util-linux_2.21.1.bbappend
>   /tool/yocto/poky/meta-yocto/recipes-core/psplash/psplash_git.bbappend
>   /tool/yocto/poky/meta-yocto/recipes-core/netbase/netbase_4.47.bbappend
>   /tool/yocto/meta-openembedded/meta-oe/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bbappend
>   /tool/yocto/meta-openembedded/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
>   /tool/yocto/poky/meta-yocto/recipes-core/tasks/task-core-tools-profile.bbappend
>   /tool/yocto/meta-xilinx/recipes-core/initscripts/initscripts_1.0.bbappend
>   /tool/yocto/meta-openembedded/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
> ERROR: Command execution failed: Exited with 1
> 
> Summary: There were 2 WARNING messages shown.
> Summary: There were 3 ERROR messages shown, returning a non-zero exit code.
> 
> 
> best regards,
> 
> Elvis Dowson
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




