Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 40AFE6012C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 19:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4HJhhnd010933; Tue, 17 May 2016 20:43:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eetBmm8QF7cv; Tue, 17 May 2016 20:43:43 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4HJhf78010930
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 17 May 2016 20:43:42 +0100
Message-ID: <1463514221.4578.23.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 20:43:41 +0100
In-Reply-To: <cover.1463330208.git.akuster@mvista.com>
References: <cover.1463330208.git.akuster@mvista.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 00/98] Pull request: Krogoth-next
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
X-List-Received-Date: Tue, 17 May 2016 19:43:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2016-05-15 at 09:47 -0700, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> Please consider these changes for the next krogoth release.
> 
> Built & testimage on all qemu targets

Thanks, I had a few questions about some of these below.

> Note[1]: qemu update pending AB build and review
> Note[2]: need to reconcile [master][krogoth] patches

What does this mean?

> Note[3]: built world on meta-openembedded krogoth-next series, no
> unexpected issues

> The following changes since commit
> 75ca53211488a3e268037a44ee2a7ac5c7181bd2:
> 
>   bitbake: toaster: fix progress bar in MySQL environment (2016-05-13
> 17:45:58 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib akuster/krogoth-next
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/kr
> ogoth-next
> 
> Alexander D. Kanevskiy (1):
>   image.bbclass: don't execute compression commands multiple times
> 
> Alexander Kanavin (1):
>   arch-powerpc64.inc: disable the use of qemu usermode on ppc64
> 
> Anders Darander (1):
>   lib/oe/rootfs: Fix DEBUGFS generation for opkg & openssl-cnf
> 
> Andre McCurdy (1):
>   image.bbclass: don't emit redundant IMAGE_CMD_xxx functions
> 
> André Draszik (2):
>   gdb: fix QA warning (uClibc)
>   feature-arm-neon.inc: restore vfpv3-d16 support
> 
> Armin Kuster (6):
>   librsvg: Security fixes via update to 2.40.15
>   openssl: Security fix via update to 1.0.2h
>   gcc: Security fix CVE-2016-4488
>   gcc: Security fix CVE-2016-4489
>   gcc: Security fix CVE-2016-2226
>   gcc: Security fix CVE-2016-4490
> 
> Awais Belal (1):
>   mesa-demos: remove demos using obsolete screen surface
> 
> Bruce Ashfield (15):
>   linux-yocto/uvesafb: print error message when task timeout occurs
>   linux-yocto/4.4: sched/cgroup: Fix/cleanup cgroup teardown/init
>   kern-tools: handle directories with, or without, trailing /
>   kernel-yocto: allow branch auditing to be suspended
>   linux-yocto/4.1: update to v4.1.22
>   linux-yocto/4.1: make ltsi content available
>   linux-yocto/4.4: BXT mmc fixes + PUNIT, tubropower, and telemetry
>     backport
>   linux-yocto/4.4: skylake configuration
>   linux-yocto/4.4: broxton enablement and refactoring
>   linux-yocto/4.4: bump to v4.4.8
>   linux-yocto-rt/4.1: update to rt23
>   linux-yocto/4.4: bump to v4.4.8
>   linux-yocto/4.4: update to v4.4.9
>   linux-yocto/4.4: beaglebone: Enable drm for omap
>   linux-yocto/4.4: bump to v4.4.10
> 
> Christopher Clark (1):
>   linux-firmware: break out bnx2 mips firmware and WHENCE license
> 
> Christopher Larson (2):
>   image_types.bbclass: add WIC_CREATE_EXTRA_ARGS
>   gcc: obey ldflags in the link of libgcc
> 
> Dengke Du (2):
>   bash: fixed ptest run-builtins failed
>   lttng-tools: filter random filename of ptest output
> 
> Denys Dmytriyenko (1):
>   arch-armv7ve: inherit armv7a tunes file
> 
> Diego Rondini (1):
>   base-files: add some safety checks in profile
> 
> Felipe F. Tonello (1):
>   packagegroup-core-tools-profile: Enable valgrind on ARMv7a and
> above
> 
> Ian Reinhart Geiser (1):
>   classes/image_vm: allow different filesystems to be used for VM
>     images.
> 
> Ioan-Adrian Ratiu (2):
>   wic: isoimage-isohybrid: add grubefi configfile support
>   wic: isoimage-isohybrid: fix splash file paths
> 
> Ismo Puustinen (1):
>   libpcre: Fix CVE-2016-3191
> 
> Joshua Lock (2):
>   security_flags: turn potential string format security issues into
> an
>     error

Not appropriate for a stable branch?

>   packagegroup-core-lsb: fix whitespace in meta-qt* warnings
> 
> Jussi Kukkonen (1):
>   gcc-sanitizers: Depend on target gcc
> 
> Leonardo Sandoval (2):
>   scripts/lib/bsp/kernel.py: force patching when branch is machine
>     branch is re-use
>   populate_sdk_ext.bbclass : Show logfile in case the SDK EXT
>     installation failed
> 
> Maxin B. John (3):
>   popt: fix dependencies and QA Issue
>   bash: fix dependencies and QA Issue
>   libxml2: fix dependencies and QA Issues
> 
> Paul Eggleton (4):
>   recipetool: create: fix picking up false npm package directories
>   recipetool: create: fix falling back to declared license for npm
>     packages
>   classes/insane: do not force LIC_FILES_CHKSUM unless SRC_URI is set

This was related to a feature change in master, not sure we want to
pull this into krogoth?

>   Drop unneeded LIC_FILES_CHKSUM values

and this is related to the above, as are some of Roberts patches?

> 
> Peter Kjellerstedt (1):
>   metadata_scm.bbclass: Do not assume ${COREBASE} is a Git repo
> 
> Randy Witt (2):
>   populate_sdk_ext: Change lockedsigs task mismatch to a warning
>   devtool: Fix build-sdk when pn doesn't match filename
> 
> Richard Purdie (6):
>   meta-selftest/images: Add LIC_FILES_CHKSUM to images using
>     image.bbclass
>   test-empty-image: Fix LIC_FILES_CHKSUM typo
>  oeqa/lic-checksum: Update after recent LIC_FILES_CHKSUM changes

Not needed if we don't change LIC_FILES_CHKSUM handling in the release
branch.

>   image: Fix IMAGE_FEATURES determinism issue
>   update-alternatives: Fix determinism issue
>   lib/classextend: Fix determinism issue

> Robert P. J. Day (1):
>   attr: Remove redundant "+=" after "_append"

Cosmetic, not really stable material?

> Robert Yang (7):
>   directfb/pango/webkit: base_contains -> bb.utils.contains

Not sure the stable branch needs this.

>   grub_git: set COMPATIBLE_HOST_armv7a to null
>   insane.bbclass: remove workdir from package_qa_check_license()
>   packagegroup.bbclass: set LICENSE and LIC_FILES_CHKSUM
>   packagegroup-foo.bb: remove LICENSE = "MIT"
>   meta-world-pkgdata: add LIC_FILES_CHKSUM

More LIC_FILES_CHKSUM stuff which I don't think we should backport.

>   libxsettings-client: fix COPYING file
> 
> Ross Burton (23):
>   package: ensure do_split_packages doesn't return duplicates
>   autotools: warn when running intltoolize if intltool isn't a
>     dependemcy

Do we want to fix this in all recipes in the release branch? This one
probably is reasonable but could be a pain.

>   busybox: don't build ar
>   meta: add comments to explain autotools-brokensep use
>   mx-1.0: inherit gtk-doc
>   mx: move to autotools instead of autotools-brokensep
>   bluez5: enable out-of-tree builds
>   oeqa/sstatetests: add http_proxy to no-op hash test
>   oeqa/sstatetests: remove temporary DL_DIRs in noop_samesigs
>   autotools: add default for CACHED_CONFIGUREVARS
>   python-pygobject: remove redundant gnome-common dependency
>   gnome-desktop3: remove redundant gnome-common dependency
>   webkitgtk: remove gnome-common dependency
>   qemu: remove explicit but redundant native build dependencies
>   mesa-gl: add missing MESA_CRYPTO to PACKAGECONFIG
>   oeqa/selftest/buildoptions: remove buildhistory signature test
>   eudev: add PACKAGECONFIG for hwdb
>   dbus-test: install executables not libtool wrapper scripts
>   mesa: add PACKAGECONFIG for gbm
>   bitbake.conf: change APACHE_MIRROR to point at archive.apache.org
>   image_types: fix image/compression dependency collection
>   bitbake.conf: add default for IMAGE_FSTYPES_DEBUGFS
>   bitbake: fetch2: export DBUS_SESSION_BUS_ADDRESS to support
>     authentication agents
> 
> Ruslan Bilovol (2):
>   kernel-uimage: change target image to vmlinux
>   libunwind: backport aarch64_be support
> 
> Stephano Cetola (2):
>   toolchain-scripts: replace source built-in call
>   sysvinit-inittab: restrict labels to 4 chars
> 
> Tristan Van Berkom (1):
>   cross-localedef-native_2.22.bb: Use autotools configure
> 
> Yuqing Zhu (1):
>   alsa-lib: Fix incorrect appl pointer when mmap_commit() returns
> error.

Cheers,

Richard

