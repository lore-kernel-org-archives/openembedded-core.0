Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BD0416B7B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 15:42:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Aug 2013 08:42:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,886,1367996400"; d="scan'208";a="381443787"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.206])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2013 08:42:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Thu, 15 Aug 2013 16:42:27 +0100
Message-ID: <1545860.CzBMp6p8jj@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1376580529.git.sgw@linux.intel.com>
References: <cover.1376580529.git.sgw@linux.intel.com>
MIME-Version: 1.0
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/32] Ready for Final ACK & Pull
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
X-List-Received-Date: Thu, 15 Aug 2013 15:42:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 15 August 2013 08:32:26 Saul Wold wrote:
> I updated this by removing the connman patch as suggested by Ross. I
> chose to leave in the Read-Only rootfs, as I have talked with Qi and
> I will have him send a follow on patch to fix the internal patch header.
> 
> I have tested the read-only stuff locally.
> 
> Thanks
> 	Sau!
> The following changes since commit 57662d4f813d5795cac1529633db80a09efdb089:
> 
>   meta-skeleton: Add busybox config fragment example (2013-08-13 23:03:44
> +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> stage
> 
> Chen Qi (14):
>   opkg.inc: remove the obsolete POSTLOG variable
>   makedevs: support using user/group names in device table files
>   image.bbclass: create device table after package installation
>   device_table-minimal.txt: use user/group names instead of uid/gid
>   init-live.sh: make $ROOT_MOUNT/media writable when necessary
>   use a uniform way to determine whether rootfs is read-only
>   udev: remove implicit dependency on initscripts
>   populate-volatile.sh: use $ROOT_DIR/var/volatile/tmp as TMPDIR
>   populate-volatile.sh: don't spawn background process at rootfs time
>   runqemu-internal: fix to start X correctly in live images
>   initscripts: use a uniform way to handle directories in read-only
>     rootfs
>   populate-volatile.sh: use 'cp -a' to avoid potential problem
>   irda-utils: fix for read-only rootfs
>   openssh: fix for read-only rootfs
> 
> Cristiana Voicu (1):
>   systemtap: upgrade to 2.3
> 
> Martin Jansa (5):
>   at-spi2-core: add intltool-native dependency
>   gst-plugins-gl: add dependency on glew
>   xeyes: add dependency on libxrender
>   xrestop: add dependency on ncurses
>   qemu, default-providers: Add mesa as default virtual/egl
> 
> Muhammad Shakeel (3):
>   lighttpd: Replace spaces with tabs in shell function
>   rpcbind: Replace spaces with tabs in shell function
>   nfs-utils: Replace spaces with tabs in shell function
> 
> Otavio Salvador (1):
>   linux-dtb: Use kernel build system to generate the dtb files
> 
> Ross Burton (4):
>   cogl: GL/GLX feature cleanup
>   libmatchbox: upgrade to 1.11
>   matchbox-wm: fix icon handling on 64-bit hosts
>   wipe-sysroots: don't assume TMPDIR is under BUILDDIR
> 
> Saul Wold (2):
>   meta-skeleton: layer.conf Should also have .bbappend in example
>   texinfo: add perl RDEPENDS and fix up packaging
> 
> Stefan Herbrechtsmeier (1):
>   cmake.bbclass: Don't use packages from the native build machine
> 
> Wenzong Fan (1):
>   oe/path.py: call /bin/cp directly

I'm satisfied by your response to my feedback on the last series, so:

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

