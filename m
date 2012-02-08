Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RuvtM-0000z2-Ui for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 02:00:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q180q99k013014
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Feb 2012 00:52:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02673-08 for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2012 00:52:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q180prhq013008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Feb 2012 00:51:59 GMT
Message-ID: <1328662317.29471.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 08 Feb 2012 00:51:57 +0000
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/35] Catching up with Pulls
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
X-List-Received-Date: Wed, 08 Feb 2012 01:00:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-07 at 14:45 -0800, Saul Wold wrote:
> Richard et al:
> 
> Updates from various folks, this include kernel, uclibc.
> 
> One Major change to note is Khem's task-core-tools breakup and
> the renaming of POKY_ -> CORE_IMAGE_.  This will require layers
> to pay attention and fix.
> 
> Sau!
> 
> 
> The following changes since commit 18d9fcfc4bc4b01f73e89f3b988c9d3d543c7705:
> 
>   libzypp: add missing runtime dependences on gzip and gnupg (2012-02-03 17:23:28 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Andreas Oberritter (1):
>   tune-mips32.inc: Add mips32-nf and mips32el-nf
> 
> Bruce Ashfield (5):
>   linux-yocto: locate and use out of tree features specified on the
>     SRC_URI
>   linux-yocto: meta updates for sys940x and cleanup
>   linux-yocto: rt compiliation fix
>   kern-tools: remove explicit 'yocto' references from auto-bsp handling
>   linux-yocto: fri2: use emgd-1.10
> 
> Chase Maupin (1):
>   u-boot inc: update inc file for newer u-boot versions
> 
> Darren Hart (1):
>   bootimg: Use the same OS files for each boot method
> 
> Khem Raj (13):
>   xorg-apps: Bump PR to accomodate meta-oe recipe deletion
>   task-core-tools: Divide it into 3 recipes
>   Enable options needed for ltp to compile
>   runqemu-internal: qemuarm can handle 256M
>   gconf,consolekit: Avoid polkit when compiling with uclibc
>   python: Fix build failure of python-elementtree on x86_64
>   libdrm: Fix build failure unearthed by uclibc
>   libx11: Backport _XGetRequest API
>   pseudo: Wrap renameat and opendir
>   uclibc: Upgrade recipes from 0.9.32 -> 0.9.33
>   classes,recipes: Replace POKY_* with CORE_IMAGE_*
>   gcc-cross-testing: Fix evaluation of user and target name
>   mirrors.bbclass: Add yp.org and oe.org to fallback mirrors
> 
> Mike Crowe (3):
>   libusb1: Cope with ${libdir} and ${base_libdir} being the same
>   libusb-compat: Cope with ${libdir} and ${base_libdir} being the same
>   libcap: Cope with ${libdir} and ${base_libdir} being the same
> 
> Otavio Salvador (2):
>   udev: stop providing cache support by default
>   dhcp: move dhcp leases files handling to postinst/postrm
> 
> Peter Tworek (3):
>   busybox: Add flock utility to default configuration.
>   webkit-gtk: Fix error.html resource path.
>   webkit-gtk: Make webgl support configurable via DISTRO_FEATURES.
> 
> Saul Wold (3):
>   gnupg-1.4.7: Update Patch Info
>   openssl-0.9.8: Remove in favor or 1.0.0
>   mtools-3.9.9: Use correct URI for the mirror
> 
> Wade Farnsworth (3):
>   systemtap: bump SRCREV to grab version 1.7
>   systemtap: extend the recipe to build the native package
>   systemtap: build and install uprobes.ko

Merged to master, thanks.

Richard



