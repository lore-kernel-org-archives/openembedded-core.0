Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T2ODY-0008TW-5z
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 17:12:08 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Aug 2012 08:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="135428318"
Received: from unknown (HELO helios.localnet) ([10.252.121.90])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Aug 2012 08:00:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: ml@communistcode.co.uk, openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 16:00:04 +0100
Message-ID: <1364366.gWn3960rnI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <502E5B0E.8040809@communistcode.co.uk>
References: <502E5B0E.8040809@communistcode.co.uk>
MIME-Version: 1.0
Subject: Re: qemu opengl issues
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
X-List-Received-Date: Fri, 17 Aug 2012 15:12:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 17 August 2012 15:54:06 Jack Mitchell wrote:
> So I am trying to build qemuarm with latest master and I ran into this
> issue:
> 
>     NOTE: Resolving any missing task queue dependencies
>     NOTE: Preparing runqueue
>     NOTE: Executing SetScene Tasks
>     NOTE: Executing RunQueue Tasks
>     ERROR: Function failed: do_configure (see
>    
> /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-
> native-0.15.1-r11/temp/log.do_configure.2967 for further information)
>     ERROR: Logfile of failure stored in:
>    
> /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-
> native-0.15.1-r11/temp/log.do_configure.2967
>     Log data follows:
>     | DEBUG: Executing python function sysroot_cleansstate
>     | DEBUG: Python function sysroot_cleansstate finished
>     | DEBUG: Executing shell function do_configure
>     | libSDL and header no found to build opengl acceleration for
> 
>     qemu-native.
> 
>     |     Ubuntu package names are: libsdl1.2-dev.
>     |     Fedora package names are: SDL-devel.
>     | 
>     | ERROR: Function failed: do_configure (see
> 
>    
> /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-
> native-0.15.1-r11/temp/log.do_configure.2967 for further information)
>     ERROR: Task 67
>    
> (virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devt
> ools/qemu/qemu_0.15.1.bb, do_configure) failed with exit code '1'
>     NOTE: Tasks Summary: Attempted 1099 tasks of which 1074 didn't need
>     to be rerun and 1 failed.
> 
> 
> Summary: 1 task failed:
> virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devtoo
> ls/qemu/qemu_0.15.1.bb, do_configure
> Summary: There was 1 WARNING message shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> 
> Ok, I thought, lets install the sdl libraries. Which has now given me
> this error:
> 
>     Build Configuration:
>     BB_VERSION        = "1.15.3"
>     TARGET_ARCH       = "arm"
>     TARGET_OS         = "linux-gnueabi"
>     MACHINE           = "qemuarm"
>     DISTRO            = "poky"
>     DISTRO_VERSION    = "1.2+snapshot-20120817"
>     TUNE_FEATURES     = "armv5 dsp thumb arm926ejs"
>     TARGET_FPU        = "soft"
>     meta
>     meta-yocto        = "master:bddd8300325267253941e7ce656ce2cf86a8a4a4"
> 
>     NOTE: Resolving any missing task queue dependencies
>     NOTE: Preparing runqueue
>     NOTE: Executing SetScene Tasks
>     NOTE: Executing RunQueue Tasks
>     ERROR: Function failed: do_configure (see
>    
> /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-
> native-0.15.1-r11/temp/log.do_configure.6313 for further information)
>     ERROR: Logfile of failure stored in:
>    
> /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-
> native-0.15.1-r11/temp/log.do_configure.6313
>     Log data follows:
>     | DEBUG: Executing python function sysroot_cleansstate
>     | DEBUG: Python function sysroot_cleansstate finished
>     | DEBUG: Executing shell function do_configure
>     | ERROR
>     | ERROR: User requested feature gl_accel
>     | ERROR: configure was not able to find it
>     | ERROR
>     | ERROR: Function failed: do_configure (see
> 
>    
> /mnt/storage/yoctoBuilds/poky-vanilla.git/build/tmp/work/x86_64-linux/qemu-
> native-0.15.1-r11/temp/log.do_configure.6313 for further information)
>     ERROR: Task 67
>    
> (virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devt
> ools/qemu/qemu_0.15.1.bb, do_configure) failed with exit code '1'
>     NOTE: Tasks Summary: Attempted 1152 tasks of which 1108 didn't need
>     to be rerun and 1 failed.
> 
>     Summary: 1 task failed:
>    
> virtual:native:/mnt/storage/yoctoBuilds/poky-vanilla.git/meta/recipes-devto
> ols/qemu/qemu_0.15.1.bb, do_configure
>     Summary: There was 1 WARNING message shown.
>     Summary: There was 1 ERROR message shown, returning a non-zero exit
>     code.
> 
> 
> I am building on a headless machine with no X if that makes any
> difference in the matter...

Right, this is a known limitation - see Yocto Project bug 2407. By pure 
coincidence I was thinking about fixing it today as I am testing some other 
related changes; for now the only options are install the required recipes or 
hack out the gl-requiring parts of the qemu recipe.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


