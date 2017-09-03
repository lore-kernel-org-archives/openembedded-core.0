Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 288BE782EF;
	Sun,  3 Sep 2017 06:59:31 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id 63so10908535pgc.2;
	Sat, 02 Sep 2017 23:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pbJGqhQG2sSqzhQsi3n4bELvYQdObfWJ/PQ9HWfYcU0=;
	b=uTTllLeF6Mth91zkWTu9tCGgqee151MK1prr1e31ADKORKE+9x49BGAFRiguxn8dFR
	p72gKab+aQk2Qi5NRBsYKYZiS5aLiYG/x5lAcUBWOWKujyaj9t5XLXKHcUrd9UBabxdz
	7eg+POaLeu6UfgOWKYnzYvyRho/6bPXPDbeC6IUbu4iVLveY/iZNEvTIOkvcPQB9FZ8c
	y8lfeWtyPzwHZ3oyaRAYYdnYg31HIv/cg5gkUoPzwvviWKoNUOCmA7uwCUNLMU09iObu
	rojSYNAY0mBpD0IGKmnTLXjw9vhOXMCGdRjDwndFvU037pC7OD4or2J63Hx0BEeYa1XO
	ncRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pbJGqhQG2sSqzhQsi3n4bELvYQdObfWJ/PQ9HWfYcU0=;
	b=bWDb9oq979lR/SgONodxehVx25v/KSFyyW4MsHsjx/rDsqmq2EAV++nIvy+1Pa2ih1
	hKnAJ9/z9jMKw11tMBa32euttbOhnAjMvSyo3Cl+/GWwoIBLlWfxc+r4tMLBXzHqZIPc
	/AV6qQMA2IA9hQX6UMsxs/k+ZqAmKnfEk+D+qpVESzEFlpzVBVXZ0AizYv4v3XZYkzf1
	QG9LSdcO2g7BbbSaSguSYe6/r/r8/MsEIGWTvG6lnTYy9yQXCM/o6XtexpthZtfWKMUN
	JQLONLwxTkNFEUvkjl9TOFuBp/qH8Uw7djaqjFdhknbqJlFLbmxvuB5h0cfeUkTUeOSA
	sb4A==
X-Gm-Message-State: AHPjjUiNfDRrz+gENMcTgCm6+2Z7Tpeu4klaVNlFpU8tykwPEJYvZi6m
	YnjydZNPu/lJ+TutqV7thaNlGov2jA==
X-Google-Smtp-Source: ADKCNb7txWL6Ir5+TLdKFPtAnOs16xkdinA0+nChZfG5ihh/OlYtAANXoMU7LhgHeRYRqsS0wtlCDP1MrE7Udxyip6E=
X-Received: by 10.99.119.202 with SMTP id s193mr2747111pgc.287.1504421973036; 
	Sat, 02 Sep 2017 23:59:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Sat, 2 Sep 2017 23:59:02 -0700 (PDT)
In-Reply-To: <CA+chaQeg6Z3ms+eMc3vtTp6avh+LWFrzQYMMkETuRw_fTL4q7Q@mail.gmail.com>
References: <CA+chaQeg6Z3ms+eMc3vtTp6avh+LWFrzQYMMkETuRw_fTL4q7Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Sep 2017 23:59:02 -0700
Message-ID: <CAMKF1sr9+YsgJ_4nvN2Q4JgYxZygawOBN6oLXA3wGe8yamGJZQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-09-01
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
X-List-Received-Date: Sun, 03 Sep 2017 06:59:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 2, 2017 at 11:49 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
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
> ||2017-09-01 ||4 ||6 ||3 ||0 ||0 ||0 ||5 ||0 ||0 ||44058 ||2 ||0 ||0 ||0 ||0 ||0 ||0 ||0 ||
> |}
>
> == Failed tasks 2017-09-01 ==
>
> INFO: jenkins-job.sh-1.8.28 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170902_201615.log
>
> === common (3) ===
>     * meta-browser/recipes-mozilla/firefox/firefox_45.9.0esr.bb:do_compile
>     *
> meta-openembedded/meta-networking/recipes-support/ntop/ntop_5.0.1.bb:do_patch

hopefully this is fixed with cherry-pick

>     *
> meta-openembedded/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb:do_compile

a patch is sent for upgrading this recipe which should fix it.

>
> === common-x86 (0) ===
>
> === qemuarm (1) ===
>     *
> meta-openembedded/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb:do_compile
>
> === qemux86 (3) ===
>     *
> meta-openembedded/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb:do_configure

a fix is sent

>     *
> meta-openembedded/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb:do_configure

fix is sent

>     *
> meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb:do_compile

a v2 which should fix it has been sent.

>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (13) ===
> {| class=wikitable
>
> |-
> || qemuarm || 4 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemuarm.20170901_034938.log/
> || http://errors.yoctoproject.org/Errors/Build/46155/
> |-
> || qemux86 || 6 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86.20170831_032945.log/
> || http://errors.yoctoproject.org/Errors/Build/46063/
> |-
> || qemux86_64 || 3 ||
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.world.qemux86-64.20170901_071730.log/
> || http://errors.yoctoproject.org/Errors/Build/46163/
> |}
>
> === PNBLACKLISTs (4) ===
>
> === QA issues (44065) ===
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
> ||2 ||host-user-contaminated
> |-
> ||44058 ||version-going-backwards
> |-
> ||5 ||textrel
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log:
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.signatures.20170901_030102.log/
>
> No issues detected
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> meta-openembedded:
> meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLACKLIST[smbnetfs]
> ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/132827/ - the recipe will be
> removed on 2017-09-01 unless the issue is fixed"
> meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:PNBLACKLIST[gnome-keyring]
> ?= "This version conflicts with gcr from oe-core - the recipe will be
> removed on 2017-09-01 unless the issue is fixed"
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:PNBLACKLIST[lksctp-tools]
> ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to
> link against sctp_connectx symbol", '', d)}"
> meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb:PNBLACKLIST[system-setup-keyboard]
> ?= "Depends on blacklisted system-config-keyboard-native - the recipe will
> be removed on 2017-09-01 unless the issue is fixed"
> meta-qt5:
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
>
>
> QA issues by type:
>
> count: 0 issue: already-stripped
>
> count: 0 issue: libdir
>
> count: 5 issue: textrel
>
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
> '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264-bin/usr/bin/x264'
> has relocations in .text [textrel]
> x264-r2731+gitAUTOINC+2b741f81e5: ELF binary
> '/tmp/work/i586-oe-linux/x264/r2731+gitAUTOINC+2b741f81e5-r0/packages-split/x264/usr/lib/libx264.so.148'
> has relocations in .text [textrel]
>
>
> count: 0 issue: build-deps
>
> count: 0 issue: file-rdeps
>
> count: 44058 issue: version-going-backwards
>
> a2jmidid-8: Package version for package a2jmidid-dbg went backwards which
> would break package feeds from (0:8-r0.3 to 0:8-r0.0)
> [version-going-backwards]
>
> ...skip 44056 lines...
>
> zsh-5.3.1: Package version for package zsh went backwards which would break
> package feeds from (0:5.3.1-r0.3 to 0:5.3.1-r0.0) [version-going-backwards]
>
>
> count: 2 issue: host-user-contaminated
> glibc-locale-2.26: glibc-locale:
> /glibc-binary-localedata-gl-es.iso-8859-1/usr/lib/locale/gl_ES.ISO-8859-1/LC_CTYPE
> is owned by uid 3004, which is the same as the user running bitbake. This
> may be due to host contamination [host-user-contaminated]
> libqofono-0.87+gitrAUTOINC+54435de3be: libqofono:
> /libqofono-tests/usr/lib/libqofono-qt5/tests/tst_qofonocellbroadcast is
> owned by uid 3004, which is the same as the user running bitbake. This may
> be due to host contamination [host-user-contaminated]
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
> 2a78c2d siggen: Add reset to SignatureGenerator
> not included in master yet:
> 72ae1b2 world-image: add extra target
> 87ac37a fetch2: Allow Fetch.download() to warn instead of error
>
> == Tested changes (not included in master yet) - openembedded-core ==
>
> latest upstream commit:
> 811edd9 selftest/prservice: Adapt to BB_SERVER_TIMEOUT
> not included in master yet:
> c14576a report-error: Allow to upload reports automatically
> 910bca2 buildhistory.bbclass: metadata-revs show repo parent
> 686d9d9 metadata-revs: provide more information
> 9e73365 qemux86: Add identical qemux86copy variant for tests
> 59e8b83 reproducible_build.bbclass: initial support for binary
> reproducibility
> 95652fb cpio: provide cpio-replacement-native
> 3b23ef6 image_types.bbclass: improve cpio image reproducibility
> bf38798 rootfs-postcommands.bbclass: support binary reproducibility
> 7eeda32 insane.bbclass: write QA issues to log file only when they are in
> ERROR_QA or WARN_QA
> 061d137 sstate.bbclass: Do not cause build failures due to setscene errors
>
> == Tested changes (not included in master yet) - meta-openembedded ==
>
> latest upstream commit:
> e5681e1 layer.conf: remove FREESMARTPHONE_GIT variable
> not included in master yet:
> 10bace9 dnsmasq: disable the service by default
> 4f93985 rdate: Fix build with hardening
> e5c886b strongswan: Include stdint.h for uintptr_t
> 4677c6a netkit-rpc: Fix build with hardening flags
> c8efb3c netkit-telnet: Fix build with hardening
> 76662d3 ncftp: Upgrade to 3.2.6
> 53c064f autofs: Add build dependency on libnsl2
> 8e943f5 openhpi: Fix build on 64bit platforms e.g. aarch64
> da43327 security_flags.inc: Delete
> 2194ffc pptp-linux: Upgrade to 1.9.0
> 3426784 ebtables: replace ebtables-save perl script with bash rewrite
> a9a8724 pimd: Upgrade to 2.3.2
> f131a95 igmpproxy: Include missing sys/tupes.h and define _GNU_SOURCE
> e7c14f4 rdate: Define logwtmp if libc != glibc
> ec9e308 netkit-ftp: Include sys/types.h for u_long definition
> 066a9c7 postfix: Disable nis support on musl
> 8da3ce9 zeroconf: Fix build with musl
> 9c2d01f ippool: Fix build errors found with hardening flags
> fff054d openflow: Fix build with musl
> 25d61ba xl2tpd: Update to 1.3.9
> 51b1378 c-ares: update 1.12.0 -> 1.13.0
> f636b27 radvd: 2.14 -> 2.17
> 82bf544 libesmtp: Fix config.h define for snprintf detection
> 4cb7315 drbd: Add recipe
> 6aa8077 net-snmp: fix engineBoots value on SIGHUP
> b270230 openl2tp: add LGPL-2.1 license
> fb9b74b openl2tp: add init script and systemd support
> 4d7fd49 ntop: add new recipe
> 650c226 libtdb: update 1.3.12 -> 1.3.14
> bc2ecf9 ndisc6: Upgrade to 1.0.3
> 60b2801 memcached: Update to 1.5.0
> ab22cc4 tcpdump: remove unnecessary patch
> 424e6e6 squid: Add missing dependencies on openssl expat and libxml2
> 07e09c6 postfix: Upgrade to 3.2.2
> 8ef3e24 freeradius: Upgrade to 3.0.15
> 37e3ccd tcpdump: update to 4.9.1 to fix CVE-2017-11108
> ebff0aa wireshark: 2.2.7 -> 2.2.8
> d95f6b1 krb5: fix CVE-2017-11368
> 4b71e13 quagga: update to 1.2.1
> 346ae75 openvpn: 2.4.2 -> 2.4.3
> d1cf702 ipsec-tools: fix CVE-2016-10396
> 1b793a9 netcf: upgrade to latest 0.2.8
> 87377c8 tftp-hpa: add systemd unit files
> b04d96c openconnect: fix parallel compilation failure
> 20c367e openconnect: upgrade to 7.08
> 6b1cd36 ndisc6: specify target location of perl
> 053e2cd wireguard-tools: Add bash to rdeps
> e4a15f9 openl2tp: Add bash to rdeps
> 42116f6 squid: Disable format-truncation warning only with gcc
> 2cb8fcb squid: Fix QA errors about wrong perl interpreter
> 08f0852 wireguard: Upgrade to 20170810 snapshot
> ba3a771 ippool: Fix build errors found by clang
> ed9cb27 iscsitarget: Fix kernel with new 4.12+ kernel
> 2e70823 postfix: Fix build with security flags and clang
> f45593d openhpi: Fix build with clang+c++11
> 3ec9d31 openhpi: Fix ptest compile failures due to narrowing warnings with
> clang
> 0fa6136 tcpreplay: upgrade to 4.2.6
> 2ec0aa6 tftp-hpa: Fix PIE build with clang
> 968836a samba: 4.6.5 -> 4.6.7
> 43e4a8c wolfssl: upgrade to 3.12.0
> 6af98c4 netperf: upgrade to 2.7.0+ with git version
> cc5e1a4 json-spirit: link to libatomic
> df870b0 librcf: link to libatomic
> 48c49f5 ntop: Fix build with musl
> a67034e corosync: Fix build with musl
> 0852b86 netkit-rwho: Fix build with musl
> 0d251e8 netkit-tftp: Fix build with musl
> 6010fc1 serial-forward: Fix build with hardening+musl
> 9337155 gsoap: Fix build with musl
> 7cc1044 libpwquality: fix do_qa_configure issue
> 2d08073 drbd-utils: only rmmod if DRBD is a module
> b7b7c81 libgphoto2: Copy Makefile.in.in from gettext-native
> 51f6429 lxdm: Copy Makefile.in.in from gettext-native
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 2684299 qtwebengine: add patch for long paths
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-browser ==
> latest upstream commit:
> 972cab7 gnome-settings-daemon: remove the bbappend for removed recipe
> not included in master yet:
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

