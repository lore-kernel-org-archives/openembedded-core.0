Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7D14F781E2;
	Fri, 14 Jul 2017 16:50:18 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id f67so28177887wmh.1;
	Fri, 14 Jul 2017 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2MxDj0jUtE9EqI5SOvYqnv9uZIqi+Ht0iQ2ERtHS10U=;
	b=Y9f3Uf5sku9Mgkbf+05nzwCwFwkBZwOeBE90QojQuT5XJ2Uv2lxqzULJC9oHfxI4Di
	9nLzvCo1ttpc2/yC8hyJAgkVTIbFHrkVX/cQYMI7IO2rwnb06tx38phZaRdZo31P9Mt6
	k4sLCIqEJPVwGav6SccqDVO21ed7SyPs+YnRdWAfTuBswvqjICKYUUrgAFykEtJJFlls
	2SpnYxLDFrxBALQwiDT3dX41doW46UJXdFZ5dQyLS9DJg2ier0qXV8d0QmHGbAOJ+ckH
	lbSlsCgSitNIj+R4yXJTXbN6GpdjFfS612By39izkgsWmDAsjdwakJz1LgaIQrDvsQ8T
	7ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2MxDj0jUtE9EqI5SOvYqnv9uZIqi+Ht0iQ2ERtHS10U=;
	b=e1qzj+r5RRLJcQ1fuFM8fiG5MIKd6ZF30/WczmHoH5TUsjEF16l0UhvefBS0jUp5Ie
	eTzooisSClelYtSlE4p5N8DczacuoZheMrhVfMB4sxkJvDuDJSXq97Jj/l5tHgRB0RWh
	EgHTJ6acggYmd2q7n2KoiNzkj1NGxu1xPXcG18co5bV12SGCeVxCQzRJMpobD9Llm36H
	/HgdbMjD1ctt5We1pWskBP/xvy4jJoEadBwVsIxYpeLOC5xW5E88p8Hnn3BmKXf218fQ
	atVt0TcHtEzYb+qCnLk4P8UDV5KJwi1KtlgSk67xCplfLskCVHFYIAIDEW6Sn4NyycFN
	73nA==
X-Gm-Message-State: AIVw113tEvz65S7/i7kAFg5oaiwf7XXmZEPbGhUnbCFwvdaqoMahrYAk
	YQVrbn0cQqNxaFZWKJwYskFkTNhM/A==
X-Received: by 10.80.145.198 with SMTP id h6mr7399781eda.108.1500051019567;
	Fri, 14 Jul 2017 09:50:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Fri, 14 Jul 2017 09:49:49 -0700 (PDT)
In-Reply-To: <CA+chaQfEGO1Gra1BBCR9jeA+Lu5K6ekUY4etENcwoFQgftqzTA@mail.gmail.com>
References: <CA+chaQfEGO1Gra1BBCR9jeA+Lu5K6ekUY4etENcwoFQgftqzTA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jul 2017 09:49:49 -0700
Message-ID: <CAMKF1srxLHCA5YoRr20m+gYWooita6+3shpOLfbXHCVcAwb_dg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-07-13
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
X-List-Received-Date: Fri, 14 Jul 2017 16:50:20 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Martin

On Fri, Jul 14, 2017 at 9:43 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>

The results looks good. I wanted to suggest to start building with
hardening flags on if possible. I have ensured that there are no
regressions with hardening flags. It would be good to keep that up

> == Number of issues - stats ==
> {| class='wikitable'
> !|Date     !!colspan='3'|Failed tasks    !!|Signatures
> !!colspan='14'|QA !!Comment
> |-
> || ||qemuarm ||qemux86 ||qemux86_64 ||all
> ||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps ||version-going-backwards ||host-user-contaminated ||installed-vs-shipped ||unknown-configure-option ||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags ||compile-host-path ||
> |-
>
> ||2017-07-13 ||1 ||1 ||1 ||0 ||0 ||1 ||4 ||0 ||0 ||21 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||
> |}
>
> == Failed tasks 2017-07-13 ==
>
> INFO: jenkins-job.sh-1.8.24 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170714_064216.log
>
> === common (1) ===
>     *
> openembedded-core/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_231.bb:do_compile
>
> === common-x86 (0) ===
>
> === qemuarm (0) ===
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (3) ===
> {| class=wikitable
>
> |-
> || qemuarm || 1 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170711_225251.log/
> || http://errors.yoctoproject.org/Errors/Build/41116/
> |-
> || qemux86 || 1 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170711_225251.log/
> || http://errors.yoctoproject.org/Errors/Build/41118/
> |-
> || qemux86_64 || 1 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170713_081929.log/
> || http://errors.yoctoproject.org/Errors/Build/41231/
> |}
>
> === PNBLACKLISTs (14) ===
>
> === QA issues (26) ===
> {| class=wikitable
> !| Count ||Issue
> |-
> ||0 ||already-stripped
> |-
> ||0 ||build-deps
> |-
> ||0 ||compile-host-path
> |-
> ||0 ||file-rdeps
> |-
> ||0 ||host-user-contaminated
> |-
> ||0 ||installed-vs-shipped
> |-
> ||0 ||invalid-pkgconfig
> |-
> ||0 ||ldflags
> |-
> ||0 ||pkgname
> |-
> ||0 ||symlink-to-sysroot
> |-
> ||0 ||unknown-configure-option
> |-
> ||1 ||libdir
> |-
> ||21 ||version-going-backwards
> |-
> ||4 ||textrel
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170712_200847.log/
>
> No issues detected
>
>
> PNBLACKLISTs:
>
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to
> link against sctp_connectx symbol", '', d)}"
> meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb:PNBLACKLIST[bluez-hcidump]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:PNBLACKLIST[gst-plugin-bluetooth]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy] ?=
> "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130607/ - the recipe will be
> removed on 2017-09-01 unless the issue is fixed"
> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:PNBLACKLIST[xf86-video-geode]
> ?= "BROKEN, fails to build - the recipe will be removed on 2017-09-01 unless
> the issue is fixed"
> meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb:PNBLACKLIST[foxtrotgps]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb:PNBLACKLIST[libsyncml]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-qt5:
> meta-smartphone:
> meta-shr/recipes-shr/3rdparty/libsensmon_git.bb:PNBLACKLIST[libsensmon] ?=
> "BROKEN: not compatible with newer vala,
> http://errors.yoctoproject.org/Errors/Details/143058/"
> meta-shr/recipes-shr/3rdparty/omhacks_git.bb:PNBLACKLIST[omhacks] ?= "Not
> compatible with gcc7 - the recipe will be removed on 2017-09-01 unless the
> issue is fixed"
> meta-webos-ports:
> meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:PNBLACKLIST[luna-webappmanager]
> ?= "BROKEN: needs to be adapted to new qt-5.7"
> meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next] ?=
> "BROKEN: needs to be adapted to new qtwayland-5.7"
> PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation
> which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
> directory in /home/builder/poky :/"
> PNBLACKLIST[linux-yocto-tiny-kexecboot] = "does weird sh!t breaking other
> kernels and modules - broken for years"
> PNBLACKLIST[linux-yocto-tiny] = "does weird sh!t breaking other kernels and
> modules - broken for years"
>
>
> QA issues by type:
> count: 0 issue: already-stripped
>
>
> count: 1 issue: libdir
> qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location:
> /usr/plugins/designer/.debug/libqwt_designer_plugin.so [libdir]
>
>
> count: 4 issue: textrel
> chromium-54.0.2810.2: ELF binary
> '/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
> has relocations in .text [textrel]
> chromium-wayland-53.0.2785.143: ELF binary
> '/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
> has relocations in .text [textrel]
> corosync-2.4.2: ELF binary
> '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync'
> has relocations in .text [textrel]
> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
> '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148'
> has relocations in .text [textrel]
>
>
> count: 0 issue: build-deps
>
>
> count: 0 issue: file-rdeps
>
>
> count: 21 issue: version-going-backwards
> rsyslog-8.22.0: Package version for package rsyslog-dbg went backwards which
> would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
> [version-going-backwards]
> rsyslog-8.22.0: Package version for package rsyslog-dbg went backwards which
> would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
> [version-going-backwards]
> rsyslog-8.22.0: Package version for package rsyslog-dev went backwards which
> would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
> [version-going-backwards]
> rsyslog-8.22.0: Package version for package rsyslog-dev went backwards which
> would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
> [version-going-backwards]
> rsyslog-8.22.0: Package version for package rsyslog-doc went backwards which
> would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
> [version-going-backwards]
> rsyslog-8.22.0: Package version for package rsyslog-doc went backwards which
> would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
> [version-going-backwards]
> rsyslog-8.22.0: Package version for package rsyslog-locale went backwards
> which would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
> [version-going-backwards]
> rsyslog-8.22.0: Package version for package rsyslog-locale went backwards
> which would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
> [version-going-backwards]
> rsyslog-8.22.0: Package version for package rsyslog-ptest went backwards
> which would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
> [version-going-backwards]
> rsyslog-8.22.0: Package version for package rsyslog-ptest went backwards
> which would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
> [version-going-backwards]
> rsyslog-8.22.0: Package version for package rsyslog-staticdev went backwards
> which would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
> [version-going-backwards]
> rsyslog-8.22.0: Package version for package rsyslog-staticdev went backwards
> which would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
> [version-going-backwards]
> rsyslog-8.22.0: Package version for package rsyslog went backwards which
> would break package feeds from (0:8.22.0-r0.30 to 0:8.22.0-r0.0)
> [version-going-backwards]
> rsyslog-8.22.0: Package version for package rsyslog went backwards which
> would break package feeds from (0:8.22.0-r0.37 to 0:8.22.0-r0.0)
> [version-going-backwards]
> valgrind-3.12.0: Package version for package valgrind-dbg went backwards
> which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)
> [version-going-backwards]
> valgrind-3.12.0: Package version for package valgrind-dev went backwards
> which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)
> [version-going-backwards]
> valgrind-3.12.0: Package version for package valgrind-doc went backwards
> which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)
> [version-going-backwards]
> valgrind-3.12.0: Package version for package valgrind-locale went backwards
> which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)
> [version-going-backwards]
> valgrind-3.12.0: Package version for package valgrind-ptest went backwards
> which would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)
> [version-going-backwards]
> valgrind-3.12.0: Package version for package valgrind-staticdev went
> backwards which would break package feeds from (0:3.12.0-r0.34 to
> 0:3.12.0-r0.0) [version-going-backwards]
> valgrind-3.12.0: Package version for package valgrind went backwards which
> would break package feeds from (0:3.12.0-r0.34 to 0:3.12.0-r0.0)
> [version-going-backwards]
>
>
> count: 0 issue: host-user-contaminated
>
>
> count: 0 issue: installed-vs-shipped
>
>
> count: 0 issue: unknown-configure-option
>
>
> count: 0 issue: symlink-to-sysroot
>
>
> count: 0 issue: invalid-pkgconfig
>
>
> count: 0 issue: pkgname
>
>
> count: 0 issue: ldflags
>
>
> count: 0 issue: compile-host-path
>
>
>
> == Tested changes (not included in master yet) - bitbake ==
>
> latest upstream commit:
> 4a14b44 knotty: Drop task prefix of PLAIN log messages
> not included in master yet:
> dda3a10 world-image: add extra target
>
> == Tested changes (not included in master yet) - openembedded-core ==
> latest upstream commit:
> b1c4661 libiconv: remove
> 0001-Fix-link-error-when-compiling-with-gcc-O0.patch
> not included in master yet:
> dd1b5e7 report-error: Allow to upload reports automatically
> 7fdb805 buildhistory.bbclass: metadata-revs show repo parent
> 9b6fe73 metadata-revs: provide more information
> 2cd822c qemux86: Add identical qemux86copy variant for tests
> db1b8cf valgrind: fix link failure with gold
>
> == Tested changes (not included in master yet) - meta-openembedded ==
>
> latest upstream commit:
> 66b88f7 hwloc: Inherit pkgconfig
> not included in master yet:
> 9340320 dnsmasq: disable the service by default
> d1fca80 rdate: Fix build with hardening
> 96fd8e1 strongswan: Include stdint.h for uintptr_t
> 961797e netkit-rpc: Fix build with hardening flags
> b1fb0ad netkit-telnet: Fix build with hardening
> ed9432c ncftp: Upgrade to 3.2.6
> 2531f3e ippool: Fix build errors found with hardening flags
> 5963598 gflags: update SRC_URI with git fetcher
> 1a3966a unionfs-fuse: 0.26 -> 2.0
> 39502f2 autofs: Add build dependency on libnsl2
> b73b2f4 gst-plugins-gl_0.10.3.bb: Fix build on rpi/userland
> 5ed1dba librcf: fix mips/mips64 build
> b02be7a freerdp: Fix build on mips
> 6869684 gegl: Upgrade to 0.3.18
> 6cbe8e8 babl: Upgrade to 0.1.28
> a57a2ed gimp: Upgrade to 2.8.22
> 8ddbec6 fluentbit: Fix parallel build race
> 73ccbee dietsplash: Fix build on mips
> 17afe08 libsrtp: Fix build on mips
> e6ffb3c assimp: Upgrade to 3.3.1 release
> 14c5780 synergy: Update to 1.8.8 release
> bf198f6 kodi: Update to 17.3
> 220ffd8 libtorrent: Implement 64bit atomics for mips32
> d1c5c69 rtorrent: Add and enable ipv6 packageconfig based on DISTRO_FEATURES
> b7dac59 uim: Add support for aarch64
> d855e3d openhpi: Fix build on 64bit platforms e.g. aarch64
> 553ca7d meson: Port pkgconfig-native patch to 0.40.1
> 160c92f tinymembench: Disable on mips64
> b952200 ltrace: Add mips64 support
> 78c68a2 libtorrent: Link in 64bit atomics for ppc
> 339f975 librcf: Define byteorder for powerpc machines
> d6871e9 gperftools: Fix build on ppc
> 116273f crossguid: Add recipe
> 5b24757 kodi: User external crossguid
> 7798745 ser2net: upgrade to version 3.4
> fba5745 multipath-tools: 0.6.4 -> 0.7.1
> 576007b python-pytest: update to version 3.1.3
> ab2195a python-pytest: remove fetch during do_compile phase
> 8253d8c libtinyxml2: upgrade to 5.0.1
> e5d13e0 gnome-common: Add recipe (from oe-core)
> 2c09550 webrtc-audio-processing: initial recipe
> 3e83a12 libdbus-c++: Fix build with gcc7 and unblacklist
> a9b421b security_flags.inc: Delete
> 21ac7ab ltrace: Fix build on musl
> 9f59778 pptp-linux: Upgrade to 1.9.0
> 011d175 kodi: Fix build on powerpc
> 96ddef1 meta-python: Add Protobuf and gRPC Python recipes
> 6978c6c meta-python: Add pybluez recipe
> 5fc3a7b meta-python: Add python-daemon recipe and its dependencies
> b234cb7 udisks2: update 2.1.7 -> 2.1.8
> 6351d5d gvfs: update 1.28.3 -> 1.32.1
> 072a282 garcon: update 0.4.0 -> 0.6.1
> 4ae21b2 gparted: update 0.27.0 -> 0.28.1
> 85f9438 abiword: update 3.0.1 -> 3.0.2
> f180ebe faac: update 1.28 -> 1.29
> d4373e3 libdbus-c++: Add -pthread to linker flags
> 216bf8b klibc: Fix build with musl
> ac04fc6 ubi-utils-klibc: Pass TUNE_CCARGS into CFLAGS
> 225e21d kodi: Fix build on arm
> 5cce369 fluentbit: fix SYSTEMD_SERVICE name
> 626a865 Intel: remove license file
> 7fdf736 proj: update to 4.9.3
> ef59094 klibc: Fix linking by using bfd linker when default linker is gold
> 9b2852b libsombok3: add recipe
> 20b186c libmime-charset-perl: add recipe
> 3ccb597 libterm-readkey-perl: add recipe
> 91736f5 liblocale-gettext-perl: add recipe
> 9dfe3e1 libtext-charwidth-perl: add recipe
> f5158f7 libtext-wrapi18n-perl: add recipe
> 247aec7 libunicode-linebreak-perl: add recipe
> 131de8c po4a: add full functionalities
> 1815d4e ebtables: replace ebtables-save perl script with bash rewrite
> 8fc200c recipes: remove blacklisted recipes
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 2940d84 Revert "qttools: DEPENDS on icu"
> not included in master yet:
> 800d4c1 libconnman-qt5: update to 1.1.10
> 428be3c qtwebengine: add PACKAGECONFIG for webrtc
> 05455e6 qt5: add qt5-ptest.inc
> ec8c62e qtxmlpatterns: add ptest
> 1eac990 qtdeclarative: add ptest
> 2c1d6b1 qtquick1: add ptest
> aa0605d qtquickcontrols2: fix compilation of examples/texteditor
> 00d72cd qwt-qt5: Fix rpath issues
> c2768bd qtwebengine: fix build with gcc7
> 932515a qt5-ptest.inc: append do_populate_sysroot only for target
> bf7cdd9 qtbase-native: Fix qdbuscpp2xml segfault
>
> == Tested changes (not included in master yet) - meta-browser ==
>
> latest upstream commit:
> d822031 Merge pull request #49 from kraj/kraj/master
> not included in master yet:
> 6f790a0 gnome-settings-daemon: remove the bbappend for removed recipe
>
> == Tested changes (not included in master yet) - meta-webos-ports ==
>
> latest upstream commit:
> 9545fb6 packagegroup-luneos-extended: drop qtscenegraph-adaptation
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-smartphone ==
> latest upstream commit:
> 80b8107 android-system-image-tenderloin: Fix checksums
> not included in master yet:
> e523b07 meta-shr, meta-fso: remove blacklisted recipes
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

