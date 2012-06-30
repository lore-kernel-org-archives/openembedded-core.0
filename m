Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SkpOT-0003aY-Oa
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 06:34:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Jun 2012 21:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="159947149"
Received: from unknown (HELO envy.home) ([10.255.13.25])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2012 21:23:49 -0700
Message-ID: <4FEE7EFA.7010103@linux.intel.com>
Date: Fri, 29 Jun 2012 21:22:18 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1341000751.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1341000751.git.dvhart@linux.intel.com>
X-Enigmail-Version: 1.4.2
Cc: openembedded-core@lists.openembedded.org, Poky <poky@yoctoproject.org>
Subject: Re: [PATCH 0/3 V3] Enable building modules on target
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
X-List-Received-Date: Sat, 30 Jun 2012 04:34:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

scratch this series.... apologies, sent the wrong one.

On 06/29/2012 09:20 PM, Darren Hart wrote:
> Note: As this is a major change that impacts every BSP, I suggest this
>       spend some time in MUT before being included into master.
> 
> This series simplifies the include mechanisms for the linux-yocto recipes
> and adds support for a kernel-headers package which enables the building
> of modules on the target.
> 
> Sending to both oe-core and poky as this series touches files in both
> and I didn't want to confuse the intent or the dependency by splitting
> them up.
> 
> V2:
> o Add files to kernel-dev rather than create a new kernel-headers package
> o Move the location to /usr/src/kernel from /usr/src/kernel-headers
> o Eliminate the kernel-misc package as kernel-dev covers it now
> o Fix a bug with linux-yocto-custom exposed during testing
> 
> V3:
> o Fix tasl-core-sdk typo
> o Rebase on origin/master where 2 patches had already been applied
> o Correct the bitbake.conf STAGING_KERNEL_DIR path which I missed in V2
> 
> Testing Performed:
> Built core-image-sato-sdk for qemux86 and copied over the hello-mod
> module sources. Built the scripts dir in /usr/src/kernel, then built the
> hello-mod module on the target, insmod, rmmod, dmesg -n 2.  The output was
> correct.
> 
> The following changes since commit a5b2c1e4ce3ad4f2b9ea306c6d10f528c5ef8b66:
> 
>   bitbake: Hob: change 'run image' and 'deploy' Gui and work flow for building detail page (2012-06-29 14:46:47 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib dvhart/modules-v3
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/modules-v3
> 
> Darren Hart (3):
>   kernel: Add kernel headers to kernel-dev package
>   task-core-sdk: Add kernel-dev to task-core-sdk RDEPENDS
>   linux-yocto-custom: Remove linux-tools
> 
>  .../recipes-kernel/linux/linux-yocto-custom.bb          |    2 --
>  meta/classes/kernel.bbclass                             |   15 +++++++--------
>  meta/conf/bitbake.conf                                  |    2 +-
>  meta/recipes-core/tasks/task-core-sdk.bb                |    5 +++--
>  4 files changed, 11 insertions(+), 13 deletions(-)
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




