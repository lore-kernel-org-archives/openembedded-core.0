Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 953BF71AB5;
	Mon, 19 Jun 2017 09:27:31 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id x70so73455462wme.0;
	Mon, 19 Jun 2017 02:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LprvQWYJfW9AtrL0JGTiqBZK6Ls31tQZDdyQ4WvM8XI=;
	b=KkKYn7hvfi8DDidaj4UKGzvlf37o1BEqIhZxx0f3SrkflIz5ZTIXWFgokKV6GZgufk
	RDK6vUYfSMzHrCs8Ur/UX79ToagTumYQl41p9qOuC0FvNJZ33UyTKG4HXaYpdvTLQNjP
	YwGnGjVYoBjvIcm48ptelATVhmq7G1qMhb4GoBDoO4kPRyxf35chTEivMESg4CzqVwy6
	IVJ+DlpYOw7yChi69sNiJvrWi5I1qodC2qv16yFaRpDSOViAFUZBAo6TXCMddqLwPH/6
	vATwB3uuDoebEQ5mjG32sfqyxv06Esnu3kp2p3y+UtpGDcV2/IgVD+suxPN4Kbovx3z4
	2d4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LprvQWYJfW9AtrL0JGTiqBZK6Ls31tQZDdyQ4WvM8XI=;
	b=QMqW973W9Zomb3hDE/W9+dc59SgKQwunze8VpYVYeOvzLX/fKy7oVO5+qit5+wYYFN
	ojZYzliq3FXW86GhRaSzf6LDTd9UvXFf8T3ytp4xa3kMvQ/5F5KJB0pJO8IiCLFAr9jH
	kvOXwYYdTpdOYb7b89uVdvOKOTX6BRjCIZntsIn5zStIL1zJHnhrFgh+I/v1QJQZgdtd
	4rGjupgsZDJOSc0CtIlHtV/ACKF0xKhR8aW2ecjQdI7I0w09QgOaLk0Y5GEIKQJLKcsa
	T3foCB9uZt5rC81/ZpjiRJ9ADCMxSUZFHHXK/E47yiyJHnNEmkHBEh2niNUPsI6Hw2AX
	aHoA==
X-Gm-Message-State: AKS2vOygwlYshNot7GT1qUFsCwQE9cvGnuRm9CkPi04TZpBR1Z+NvNmZ
	pPFVVXdkkmdE5/nY3kaWptUnQYc4tw==
X-Received: by 10.80.160.231 with SMTP id 94mr16155493edo.173.1497864451779;
	Mon, 19 Jun 2017 02:27:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.172.100 with HTTP; Mon, 19 Jun 2017 02:27:31 -0700 (PDT)
In-Reply-To: <CA+chaQd-cdvNsrq=0MQDcZex3s2VHqG0vUxHnES5mmgio9a6wA@mail.gmail.com>
References: <CA+chaQd-cdvNsrq=0MQDcZex3s2VHqG0vUxHnES5mmgio9a6wA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 19 Jun 2017 11:27:31 +0200
Message-ID: <CAAQYJAuDz-Nwvv8w-G0Zj1PMWn4ggW18z=uPoiYbvM-ET0Jnig@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-06-18
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
X-List-Received-Date: Mon, 19 Jun 2017 09:27:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 18, 2017 at 10:19 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Firefox and chromium-* fixed few more to go, but not bad for big gcc
> upgrade.
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Number of issues - stats ==
> {| class='wikitable'
> !|Date     !!colspan='3'|Failed tasks    !!|Signatures
> !!colspan='14'|QA !!Comment
> |-
> || ||qemuarm ||qemux86 ||qemux86_64 ||all
> ||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps ||version-going-backwards ||host-user-contaminated ||installed-vs-shipped ||unknown-configure-option ||symlink-to-sysroot ||invalid-pkgconfig ||pkgname ||ldflags ||compile-host-path ||
> |-
>
> ||2017-06-18 ||6 ||6 ||6 ||3 ||0 ||0 ||2 ||0 ||0 ||18 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||
> |}
>
> == Failed tasks 2017-06-18 ==
>
> INFO: jenkins-job.sh-1.8.23 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170618_101835.log
>
> === common (4) ===
>     *
> meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.10.0.bb:do_install
>     *
> meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.25.bb:do_compile
>     *
> meta-smartphone/meta-shr/recipes-shr/3rdparty/omhacks_git.bb:do_compile
>     *
> virtual:klibc:meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb:do_compile


I'll send a one-liner fix for gcc7 later today.
Cheers
Andrea
>
> === common-x86 (2) ===
>     * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
>     *
> openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb:do_compile_ptest_base
>
> === qemuarm (2) ===
>     *
> meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb:do_compile
>     *
> meta-openembedded/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb:do_configure
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (18) ===
> {| class=wikitable
> |-
> || qemuarm || 6 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170617_234735.log/
> || http://errors.yoctoproject.org/Errors/Build/39738/
> |-
> || qemux86 || 6 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170617_233459.log/
> || http://errors.yoctoproject.org/Errors/Build/39739/
> |-
> || qemux86_64 || 6 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170618_042946.log/
> || http://errors.yoctoproject.org/Errors/Build/39741/
> |}
>
> === PNBLACKLISTs (15) ===
>
> === QA issues (20) ===
> {| class=wikitable
> !| Count ||Issue
>
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
> ||0 ||libdir
> |-
> ||0 ||pkgname
> |-
> ||0 ||symlink-to-sysroot
> |-
> ||0 ||unknown-configure-option
> |-
> ||18 ||version-going-backwards
> |-
> ||2 ||textrel
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (3) ===
>
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170618_014055.log/
>     * ERROR: 3 issues were found in these recipes: open-vm-tools
>
>     * ERROR: 1 errors found in signatures.qemux86.do_configure.sigdata.log
>     * ERROR: 1 errors found in
> signatures.qemux86.do_populate_sysroot.sigdata.log
>     * ERROR: 1 errors found in
> signatures.qemux86.do_package_write_ipk.sigdata.log
>
>     * ERROR: open-vm-tools different signature for task do_configure.sigdata
> between qemux86copy and qemux86
>     * ERROR: 1 errors found in
> /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1497786055/signatures.qemux86.do_configure.sigdata.log
>     * ERROR: open-vm-tools different signature for task
> do_populate_sysroot.sigdata between qemux86copy and qemux86
>     * ERROR: 1 errors found in
> /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1497786055/signatures.qemux86.do_populate_sysroot.sigdata.log
>     * ERROR: open-vm-tools different signature for task
> do_package_write_ipk.sigdata between qemux86copy and qemux86
>     * ERROR: 1 errors found in
> /home/jenkins/oe/world/shr-core/tmp-glibc/sstate-diff/1497786055/signatures.qemux86.do_package_write_ipk.sigdata.log
>     * ERROR: 3 issues were found in these recipes: open-vm-tools
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?= "BROKEN: fails
> to build with gcc-6"
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
> meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:PNBLACKLIST[libdbus-c++] ?=
> "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130644/ - the recipe will be
> removed on 2017-09-01 unless the issue is fixed"
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
> count: 0 issue: libdir
>
>
> count: 2 issue: textrel
> chromium-54.0.2810.2: ELF binary
> '/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
> has relocations in .text [textrel]
> chromium-wayland-53.0.2785.143: ELF binary
> '/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
> has relocations in .text [textrel]
>
>
> count: 0 issue: build-deps
>
>
> count: 0 issue: file-rdeps
>
>
> count: 18 issue: version-going-backwards
> firefox-45.9.0esr: Package version for package firefox-dbg went backwards
> which would break package feeds from (0:45.9.0esr-r0.3 to 0:45.9.0esr-r0.0)
> [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox-dbg went backwards
> which would break package feeds from (0:45.9.0esr-r0.4 to 0:45.9.0esr-r0.0)
> [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox-dbg went backwards
> which would break package feeds from (0:45.9.0esr-r0.5 to 0:45.9.0esr-r0.0)
> [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox-dev went backwards
> which would break package feeds from (0:45.9.0esr-r0.3 to 0:45.9.0esr-r0.0)
> [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox-dev went backwards
> which would break package feeds from (0:45.9.0esr-r0.4 to 0:45.9.0esr-r0.0)
> [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox-dev went backwards
> which would break package feeds from (0:45.9.0esr-r0.5 to 0:45.9.0esr-r0.0)
> [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox-doc went backwards
> which would break package feeds from (0:45.9.0esr-r0.3 to 0:45.9.0esr-r0.0)
> [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox-doc went backwards
> which would break package feeds from (0:45.9.0esr-r0.4 to 0:45.9.0esr-r0.0)
> [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox-doc went backwards
> which would break package feeds from (0:45.9.0esr-r0.5 to 0:45.9.0esr-r0.0)
> [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox-locale went backwards
> which would break package feeds from (0:45.9.0esr-r0.3 to 0:45.9.0esr-r0.0)
> [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox-locale went backwards
> which would break package feeds from (0:45.9.0esr-r0.4 to 0:45.9.0esr-r0.0)
> [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox-locale went backwards
> which would break package feeds from (0:45.9.0esr-r0.5 to 0:45.9.0esr-r0.0)
> [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox-staticdev went
> backwards which would break package feeds from (0:45.9.0esr-r0.3 to
> 0:45.9.0esr-r0.0) [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox-staticdev went
> backwards which would break package feeds from (0:45.9.0esr-r0.4 to
> 0:45.9.0esr-r0.0) [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox-staticdev went
> backwards which would break package feeds from (0:45.9.0esr-r0.5 to
> 0:45.9.0esr-r0.0) [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox went backwards which
> would break package feeds from (0:45.9.0esr-r0.3 to 0:45.9.0esr-r0.0)
> [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox went backwards which
> would break package feeds from (0:45.9.0esr-r0.4 to 0:45.9.0esr-r0.0)
> [version-going-backwards]
> firefox-45.9.0esr: Package version for package firefox went backwards which
> would break package feeds from (0:45.9.0esr-r0.5 to 0:45.9.0esr-r0.0)
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
> 5639faa cooker: ensure graceful exit after exception during BuildCompleted
> handler
> not included in master yet:
> b65315d world-image: add extra target
>
> == Tested changes (not included in master yet) - openembedded-core ==
> latest upstream commit:
> 1d9a88f ovmf: fix secureboot PACKAGECONFIG + OpenSSL update
> not included in master yet:
> 848893d v86d,qemuboot-x86.inc: use
> KERNEL_MODULE_AUTOLOAD+KERNEL_MODULE_PROBECONF for uvesafb instead of
> fbsetup init script
> 645cace sstate-sysroot-cruft.sh: Extend the whitelist
> ec4fab2 report-error: Allow to upload reports automatically
> 1284cd0 buildhistory.bbclass: metadata-revs show repo parent
> b84b7e7 metadata-revs: provide more information
> 2babc63 qemux86: Add identical qemux86copy variant for tests
>
> == Tested changes (not included in master yet) - meta-openembedded ==
>
> latest upstream commit:
> d3dd8bc fuse: fix fetcher error.
> not included in master yet:
> a98cf68 dnsmasq: disable the service by default
> 3191acb freeradius: add new recipe
> bd90ccc keepalived: add new recipe
> 171dca1 vblade: update to version 22
> 07eccbf geoipupdate: 2.2.2 -> 2.3.1
> abf6ee3 ifenslave: 2.7 -> 2.9
> a743af5 drbd-utils: remove /var/lock to avoid conflict
> 7e5f536 wireguard: bump version to latest snapshot 0.0.20170517
> 9ecb0d6 opensaf: Add -latomic to LDFLAGS
> 12a4da1 open-isns: fix QA issue
> 431bad1 dante: fix unknown-configure-option QA issue
> 0b1195e snort: enable static daq
> c8257b2 net-snmp: supported cross compile for the perl embedded and perl
> modules
> 4962077 traceroute: Move manual pages from mandir to man8 under it
> e90e1d0 nopoll: Disable doc generation
> a319386 cifs-utils 6.6 -> 6.7
> 00b9dd8 openvpn: Upgrade 2.3.9 -> 2.4.2
> e68ed29 proftpd: Update to 1.3.6 release
> 0486de7 samba: Fix build with musl
> b4ae520 wireshark: Upgrade to 2.2.7
> 8ca9eb3 ippool: add new recipe
> d928074 libdevmapper: sync with lvm2 2.02.171
> 3e6defe samba: upgrade to 4.6.5
> 24b2acd open-vm-tools: add recipe from meat-foss-openswitch
> 9fd06cf open-vm-tools: add missing pkgconfig dependency
> c6f14e2 open-vm-tools: add missing glib-2.0-native dependency
> c69c95b open-vm-tools: clarify and expand licensing
> 971fcf2 open-vm-tools: base_contains --> bb.utils.contains
> 970a4c6 open-vm-tools: update version to 10.1.5
> 640a861 open-vm-tools: don't use mspack
> 29971b1 open-vm-tools: don't use dnet-config
> 96bc53f open-vm-tools: add #include to fix build break
> bd816a1 open-vm-tools: add missing X11 dependencies
> e7f3c42 open-vm-tools: remove kernel module logic
> 629ec5d open-vm-tools: line up configure options
> 74e6748 open-vm-tools: support FUSE
> ebee20a open-vm-tools: style changes
> 9f8b117 mercurial: CVE-2017-9462
> c59d688 fwts: Bump SRCREV to latest past 17.03.00 release
> 56d8261 networkmanager: add support for systemd-resolved
> dcf1881 iscsi-initiator-utils: do not regenerate prom_lex.c
> 404fbbc rrdtool: allow configuration to disable nls
> 477ab14 passwdqc: add new recipe and replace pam-passwdqc
> 224e1ca libfile-slurp-perl: add new recipe
> 50e9759 bdwgc: add a recipe from oe-core
> 31932a4 kconfig-frontends: Add recipe
> c8a7884 kconfig-frontends: Update to 4.11.0.1
> cb0d915 python-astroid: update to version 1.5.3
> e4495f7 python-chardet: update to version 3.0.4
> 67944a7 python-cmd2: update to version 0.7.2
> 601e007 python-lxml: update to version 3.8.0
> a7449d3 python-wrapt: update to version 1.10.10
> 2aa4b58 python-pbr: update to version 3.0.1
> f059286 python-jsonpatch: update to version 1.16
> fbad7ad python-monotonic: update to version 1.3
> b173adc python-sqlalchemy: update to version 1.1.10
> 04d4814 python-gevent: update to version 1.2.2
> 78883d4 python-serpent: update to version 1.22
> ee16911 python-selectors34: update to version 1.2
> 36acb7b python-py: update to version 1.4.34
> 9581c56 python-isort: update to version 4.2.15
> 2104d4a python-unidiff: update to version 0.5.4
> 5d13388 python-gsocketpool: update to version 0.1.6
> 9b7b0cb python-zopeinterface: update to version 4.4.2
> f812ba8 python-urllib3: update to version 1.21.1
> 627d746 python-cryptography-vectors: update to version 1.9
> 472fd42 python-cryptography: update to version 1.9
> 4becac1 python3-multidict: update to version 2.1.6
> 322f7b5 python-pybind11: update to version 2.1.1
> 48cc6c9 python-flask: update to version 0.12.2
> 0aa9ccb python-flask-pymongo: update to version 0.5.1
> 6bf4333 python-lazy-object-proxy: update to version 1.3.1
> 6f61cab python-mprpc: update to version 0.1.14
> c7c3608 python-parse: update to version 1.8.2
> a5cf9e0 python-prompt-toolkit: update to version 1.0.14
> 1ab3535 python-pytest: update to version 3.1.2
> 60d1607 python-paho-mqtt: update to version 1.2.3
> 60f9b9f nginx: update to version 1.13.1
> b2ed4db libvncserver: upgrade to 0.9.11
> f43c9ff xfsprogs: Remove .la files in ${libdir}
> aa3fbfc freeradius: Upgrade to 3.0.14
> 1f407d5 ssiapi: Fix build with gcc7 and musl
> 3d6c8ed vlan: Fix build with security flags turned on
> 8c580ea relayd: Upgrade to latest
> 43a3bfc openocd: Fix build with gcc7
> dc42876 tiobench: Fix build with hardening flags
> b973bcb relayd: Fix build with hardening flags and glibc
> 242ee41 ruli: Fix build with hardening flags
> d639a00 python-setuptools-scm: update to version 1.15.6
> cda8b4f recipes: remove blacklisted recipes
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 6605c48 python-pyqt5: Add recipe.
> not included in master yet:
> 1c80edb Upgrade to Qt 5.9.0
> 8be83b0 qtbase: respect "ld-is-gold" DISTRO_FEATURES
>
> == Tested changes (not included in master yet) - meta-browser ==
>
> latest upstream commit:
> 880a7bd Revert "firefox: Use system-wide cairo instead of built-in one"
> not included in master yet:
> 05e7482 gnome-settings-daemon: remove the bbappend for removed recipe
> a7b0b40 firefox-l10n.inc: mangle download filename instead of DL_DIR
> 39c0a62 chromium(-wayland): Fix build with gcc7
> 3ebbb82 firefox: fix build with gcc7
>
> == Tested changes (not included in master yet) - meta-webos-ports ==
> latest upstream commit:
> 47091c6 ofono: Use Mer's 1.19 and include fix
> not included in master yet:
> d23aeb0 mesa: remove --with-llvm-prefix in meta-luneui instead of
> meta-luneos
> 47ebb4f README: update to depend on master branches
> 29413ad qtbase: enable fontconfig
> a457d20 qtwayland, qtwebengine: use webOS-ports/master-next branch
> compatible with 5.7
> e1f0c7e luna-next: Make compatible with Qt 5.7
> f557d2e qtwayland, qtwebengine: temporary drop bbappend
> 013635d luna-sysservice: Fix build with qt 5.7
> 426a038 luna-next, luna-webappmanager: temporary drop from image
> 0fe78d3 packagegroup-luneos-development: drop qt5-opengles2-test
> 4d68be8 libconnman-qt: replace with libconnman-qt5 from meta-qt5
> 261c358 libqofono: use the recipe from meta-qt5
> bddfec2 qtlocation: drop invalid and unused OE_LUNEOS_ENABLED option
> 3aba05c phonesim: fix build with Qt 5.8
> 7f330a0 qtbase: enable xkbcommon-evdev for qtwayland
> 8e72c39 qt5-qpa-hwcomposer-plugi: Fix build with Qt 5.8
> 178db00 packagegroup-luneos-extended: drop qtscenegraph-adaptation
>
> == Tested changes (not included in master yet) - meta-smartphone ==
>
> latest upstream commit:
> be8374b libsensmon: blacklist due to newer vala incompatibility
> not included in master yet:
> a41a338 meta-shr, meta-fso: remove blacklisted recipes
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

