Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE4C6B118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 15:01:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2013 08:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,694,1367996400"; d="scan'208";a="367373588"
Received: from unknown (HELO helios.localnet) ([10.252.122.61])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2013 08:01:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 16:01:52 +0100
Message-ID: <8433221.2Gzg6I6cQz@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <cover.1374157000.git.sgw@linux.intel.com>
References: <cover.1374157000.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/36] Updated and Ready
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
X-List-Received-Date: Thu, 18 Jul 2013 15:01:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 18 July 2013 07:24:45 Saul Wold wrote:
> Richard,
> 
> Please pull after final ACKs by Paul and Ross.
> 
> Additinally there is a poky-tiny.conf patch on poky list from Cristiana that
> can be pulled also.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit cf1790d992f067be8d5f9894458f55f6f1bdc61f:
> 
>   lib/oeqa: fix dependecy check (2013-07-15 10:29:27 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> stage
> 
> Bruce Ashfield (3):
>   linux-yocto/3.8: update META srcrev
>   linux-yocto/3.4: mips: fix gcc 4.8 compilation
>   linux-yocto/3.8: restore qemumips64 SRCREV
> 
> Chen Qi (2):
>   tar: remove an erroneous patch
>   local.conf.sample.extended: add example for EXTRA_USERS_PARAMS
> 
> Cristian Iorga (2):
>   bluez4: conflicts with bluez5
>   bluez5: new package for v5.7
> 
> Felipe F. Tonello (3):
>   pulseaudio: Added cli-protocol-unix to pulseaudio-misc
>   valgrind: added perl dependency
>   pulseaudio: Removed avahi forced dependency
> 
> Hongxu Jia (2):
>   udev-extraconf: allow users in disk group to write vfat filesystem
>   xuser-account: add xuser to disk group
> 
> Joe Slater (1):
>   curl: add upstream status to patch
> 
> Jonathan Liu (1):
>   gdb: add PACKAGECONFIG for Python support
> 
> Kai Kang (1):
>   tcl: fix typo of upstream status in patch file
> 
> Khem Raj (4):
>   gcc-4.8: Fix on-device SDK C++ runtime issue
>   uclibc: Build ldd/ldcondif/iconv for main uclibc recipe
>   eglibc-2.18: Remove unused patches
>   eglibc-2.18: Update to latest snapshot
> 
> Mark Hatle (4):
>   sanity.bbclass: Update gcc sanity check
>   terminal.bbclass: Fix BB_RUNFMT processing
>   busybox: fix ip reference in simple.script
>   dbus-ptest: Disable python module check
> 
> Paul Eggleton (4):
>   qt-mobility: tighten up config generation and use PACKAGECONFIG
>   classes/insane: fix regression in libdir QA regex
>   classes/insane: allow libdir QA check to be skipped using INSANE_SKIP
>   scripts/contrib/*: fix arithmetic bashism
> 
> Roy.Li (1):
>   dpkg: backport a patch to support mipsn32el and mips64el
> 
> Saul Wold (2):
>   Upstream-Status: Correct capitalization
>   buildtools-tarball: testimage needs the mmap python-module
> 
> Simon Busch (1):
>   wpa-supplicant: backport patch to fix dbus interface for autoscan
>     functionality
> 
> Stefan Stanacar (1):
>   populate_sdk_base.bbclass: use new perm option for find
> 
> Yi Zhao (3):
>   iproute2: Fix alternative link for ip command
>   run-postinsts: Fix typo
>   rpm-postinsts.bb: Fix typo
> 
> Zhenhua Luo (1):
>   oprofile: add Upstream-Status for several patches

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre

