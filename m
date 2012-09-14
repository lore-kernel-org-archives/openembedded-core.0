Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TCRse-0008FT-FQ for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 11:08:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8E8tWYV009718;
	Fri, 14 Sep 2012 09:55:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06256-09; Fri, 14 Sep 2012 09:55:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8E8tNnZ009712
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 14 Sep 2012 09:55:24 +0100
Message-ID: <1347612926.9456.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 14 Sep 2012 09:55:26 +0100
In-Reply-To: <cover.1347605994.git.sgw@linux.intel.com>
References: <cover.1347605994.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED REQUEST 00/26] Update Fixes (cover only)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2012 09:08:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-14 at 00:04 -0700, Saul Wold wrote:
> Richard,
> 
> THis is a continuation of yesterday's Fix list. It includes
> some patches for some AB related issues such as the MPC8315 
> and Multilib (really license.bbclass failure).
> 
> I have also included the patch you suggested for the SRCPV 
> issue in sstate hash, it does change now, that commit message
> might need somemore info from you since I just tried it.
> 
> Hope you can pull most of these during your day!
>
> Andrei Dinu (1):
>   libffi upgrade to 3.0.11
> 
> Andrei Gherzan (2):
>   image_types.bbclass: Round up ROOTFS_SIZE after base_size check
>   taglib: Update to v1.8
> 
> Bruce Ashfield (3):
>   kernel-yocto: fix kernel configuration audit for custom yocto kernels
>   linux-yocto: virtio and KVM guest configuration
>   linux-yocto/3.4: make uprobes select perf events
> 
> Constantin Musca (1):
>   patch.bbclass: Use one TMPDIR per patching process
> 
> Jack Mitchell (1):
>   git: define NO_PYTHON=1 to stop git requiring python as a dependancy
> 
> Khem Raj (4):
>   kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC

There are a number of questions about this one, I've left it for now.

>   uclibc: Revert systemd regressing patch from upsteam uclibc and uprev
>     SRCREV
>   runqemu: Explicitly specify MACHINE when calling bitbake
>   binutils-2.22: Backport PR fixes from 2.22 branch
> 
> Matthew McClintock (1):
>   valgrind_3.7.0.bb: fix missing leading space on _append
> 
> Paul Eggleton (3):
>   gst-fluendo-mpegdemux: add LICENSE_FLAGS
>   scripts/combo-layer: use last_revision if specified in init
>   scripts/combo-layer: ensure we validate branch/revision on init
> 
> Peter Seebach (1):
>   pseudo_1.4.1.bb: update to pseudo 1.4.1, fixing 32-bit host problems
> 
> Richard Purdie (1):
>   opkg: Fix package dependency issue for preinsts
> 
> Ross Burton (4):
>   connman: remove trailing whitespace
>   librsvg: --disable-gnome-vfs doesn't exist anymore, remove
>   librsvg: remove spurious popt dependency
>   libx11: update patch to a backport from upstream git
> 
> Saul Wold (4):
>   oprofileui: Add Icons to oprofileui-viewer package
>   kernelshark: add missing ${D}
>   license: Ensure we find multilib packages also

This one looks like it might introduce other issues...

>   bitbake.conf: Assign SRCPV so that it will be tracked in siginfo

I tweaked this one as discussed.

Otherwise I merged things, thanks.

Cheers,

Richard




