Return-Path: <cliff.brake@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD24771D6;
	Wed,  3 Feb 2016 22:02:47 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id o6so13756999qkc.2;
	Wed, 03 Feb 2016 14:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=pnUYEJGMgvrRrKK2cDuP9cBlaNmifccsdejWqesHRNc=;
	b=rtowgf1msI+pFyh5zDziZ67C26CPM6e3oJI5CmGBrKkImpOoYNV9hQ4skYiHOCsl0G
	OuD/Bj+BjGXkS8gZwpCFDzYHrex0DgeiKh9EF1b5mIf0JzLiqVxjcXjuN2bL1+8DUFyj
	D+siw90l3s171K7GYeviQUY2Giiu8Ye9qZGLVKeZ74b6uhyGHWkZhNmghy8KTiKe9bzH
	mvVZfcjchuK6V0O+9fxU6Qb3eVhMPp/zr7HielpxW8B8YDn6xrymuuU08iaj1HqdhnKD
	tqZ4iGWh+rq8qJhuxAWxwX4fNOmTmvVn/6Q2aQFJI0XbbJm+R0/u+hQ6V+5KTxuHkl57
	SxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:mime-version:message-id:from:to:subject
	:content-type:content-transfer-encoding;
	bh=pnUYEJGMgvrRrKK2cDuP9cBlaNmifccsdejWqesHRNc=;
	b=jU0vN9PfSBpM/Lxpqt6VOUks3a6gQu4JYsOtyDL2w3mbW1J2svFBdyOCPHo1JW4ejf
	UYLUD60s2xKzoQIP7URGhIUQbGPhzjKqkseIEDezufkSGtHr4Jt86TLBoGGSlwH20A+Q
	5he0QRfERQa2p5QuqXbOnQHqBbZW6KMqoYnY3thzqfGYt7n43jHBhwE+rIz7YJp23GnJ
	xEEBT4gbTpO5btJse2/2kWk1WIS7f3cLL9EDtJp6u25W7pXZMEAgHDWc8ld2Vvh0Fj9M
	9+QXBYxq8anXWiLMIpN4BoQ5gEQ1W0aflceyH0JtJ4UGqRL2jqQy0BYmoOdqKXKo0iMs
	/QnQ==
X-Gm-Message-State: AG10YORZymsiB0AavL3q02ijM+0IeCllShaBmDvFcEwyTCbJKnHdAsXlAy7wx4yqNWL4JA==
X-Received: by 10.55.78.70 with SMTP id c67mr4791697qkb.37.1454536967714;
	Wed, 03 Feb 2016 14:02:47 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	a196sm195734qha.49.2016.02.03.14.02.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Feb 2016 14:02:45 -0800 (PST)
Date: Wed, 03 Feb 2016 14:02:45 -0800 (PST)
X-Google-Original-Date: Wed, 03 Feb 2016 22:02:43 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1454536963709.2efea6f3@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2016-01-24 until 2016-01-31
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
X-List-Received-Date: Wed, 03 Feb 2016 22:02:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2016-01-24 until 2016-01-31.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-atmel: https://github.com/linux4sam/meta-atmel.git
meta-beagleboard: git://github.com/beagleboard/meta-beagleboard.git
meta-browser: git://github.com/OSSystems/meta-browser.git
meta-bug: git://github.com/buglabs/meta-bug.git
meta-chicken: git://github.com/OSSystems/meta-chicken
meta-efikamx: git://github.com/kraj/meta-efikamx.git
meta-ettus: http://github.com/koenkooi/meta-ettus.git
meta-fsl-arm: git://git.yoctoproject.org/meta-fsl-arm
meta-fsl-arm-extra: git://github.com/Freescale/meta-fsl-arm-extra.git
meta-fsl-ppc: git://git.yoctoproject.org/meta-fsl-ppc
meta-guacamayo: git://github.com/Guacamayo/meta-guacamayo.git
meta-gumstix: git://github.com/gumstix/meta-gumstix.git
meta-gumstix-community: =
https://github.com/schnitzeltony/meta-gumstix-community.git
meta-handheld: git://git.openembedded.org/meta-handheld
meta-igep: http://github.com/ebutera/meta-igep.git
meta-intel: git://git.yoctoproject.org/meta-intel
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-java: git://github.com/woglinde/meta-java
meta-jetson-tk1: https://github.com/cubicool/meta-jetson-tk1.git
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-micro: git://git.openembedded.org/meta-micro
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-nodejs: https://github.com/imyller/meta-nodejs.git
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-opie: git://git.openembedded.org/meta-opie
meta-qt3: git://git.yoctoproject.org/meta-qt3
meta-qt5: git://github.com/meta-qt5/meta-qt5.git
meta-slugos: git://github.com/kraj/meta-slugos
meta-systemd: git://git.yoctoproject.org/meta-systemd
meta-raspberrypi: git://github.com/djwillis/meta-raspberrypi.git
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-ti: git://git.yoctoproject.org/meta-ti
meta-webos: git://github.com/openwebos/meta-webos.git
meta-xilinx: git://git.yoctoproject.org/meta-xilinx
meta-yocto: git://git.yoctoproject.org/meta-yocto
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Andre McCurdy (2):
=20=20build.py: minor shell_trap_code() formatting tweaks
=20=20data.py: avoid double newlines at the end of functions in emit_var()

Daniel Istrate (1):
=20=20toaster: Update UI test runner

Martin Samuelsson (1):
=20=20bitbake-user-manual-metadata: Updated 'dir' flag

Peter Kjellerstedt (3):
=20=20cooker: Allow BBMASK to contain multiple regular expressions
=20=20bitbake-user-manual-ref-variables: Update the help for BBMASK
=20=20fetch2: Simplify logic in verify_checksum()

Phil Blundell (1):
=20=20cooker, bitbake-worker: Fix spelling of "received"

Richard Purdie (4):
=20=20utils: Add ability to change the process name
=20=20bitbake: Set process names to be meaninful
=20=20knotty: Don't show errors for universe provider issues
=20=20cooker: Only start as many parse threads as we need

Ross Burton (1):
=20=20fetch2/wget: fallback to GET if HEAD is rejected in checkstatus()

Scott Rifenbark (1):
=20=20bitbake-user-manual: Updated the example BitBake directory

Sujith H (1):
=20=20bitbake: BBUIHelper: Remove function findServerDetails

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexander Kanavin (17):
=20=20gcr: check only even upstream versions
=20=20pixman: only check even upstream versions
=20=20rxvt-unicode: update to 9.22
=20=20vala: update to 0.30.0
=20=20waffle: update to 1.5.2
=20=20libsoup-2.4: update to 2.52.2
=20=20gtk-icon-utils-native: update to 3.18.6
=20=20gtk+: update to 2.24.29
=20=20gtk+3: update to 3.18.6
=20=20glib-2.0: update to 2.46.2
=20=20gdk-pixbuf: update to 2.32.3
=20=20freetype: update to 2.6.2
=20=20libsecret: update to 0.18.4
=20=20webkitgtk: update to 2.10.5
=20=20at-spi2-core: update to 2.18.3
=20=20cmake: update to 3.4.2
=20=20ffmpeg: add a recipe, and remove the libav recipe

Andre McCurdy (22):
=20=20pango.inc: drop obsolete FULL_OPTIMIZATION over-ride
=20=20gstreamer1.0-plugins-base.inc: drop obsolete dependency on liboil
=20=20busybox: backport upstream truncate open mode fix
=20=20mtools: keep v3.9.9 recipe in sync with the v4.0.18 version
=20=20busybox: fix stop -vs- start typo in rcS script
=20=20libtirpc: remove stray .orig file from Use-netbsd-queue.h.patch
=20=20libsoup-2.4: add glib-2.0-native dependency
=20=20gstreamer1.0-plugins-good: fix compiler warnings with -Os in 1.7.1
=20=20gstreamer1.0-plugins-bad: fix compiler warnings with -Os in 1.7.1
=20=20pango.inc: drop obsolete dependency on qemu-native
=20=20qemu.bbclass: clarify QEMU_EXTRAOPTIONS
=20=20glib-2.0: refresh configure-libtool.patch
=20=20glib-2.0: drop add-march-i486-into-CFLAGS-automatically.patch
=20=20glib.inc: limit ARM_INSTRUCTION_SET over-rides to armv4/armv5
=20=20bitbake.conf: stop exporting PATCH_GET =3D "0"
=20=20gcc-cross.inc: drop pruning of PATCH_GET from the testgcc script
=20=20glibc-testing.inc: drop pruning of PATCH_GET from the testglibc script
=20=20autotools.bbclass: don't create subshell to delete configure scripts
=20=20openssl: update 1.0.2e -> 1.0.2f ( CVE-2016-0701 CVE-2015-3197 )
=20=20curl: update 7.46.0 -> 7.47.0 ( CVE-2016-0754 CVE-2016-0755 )
=20=20pango.inc: limit ptest specific do_compile_prepend to target builds
=20=20pango.inc: misc dependency fixes

Andreas M=C3=BCller (2):
=20=20xf86-input-libinput: initial add 0.16.0
=20=20distutils-common-base: do not set PACKAGES - use defaults from =
bitbake.conf

An=C3=ADbal Lim=C3=B3n (1):
=20=20ptest-runner: Add ptest-runner_2.0 recipe.

Armin Kuster (2):
=20=20tzcode: update to 2016a
=20=20tzdata: update to 2016a

Bruce Ashfield (2):
=20=20linux-yocto/4.1: update to 4.1.16
=20=20linux-yocto/4.4: CVEs and preempt-rt update

Catalin Enache (1):
=20=20dpkg: fix CVE-2015-0860

Chen Qi (1):
=20=20dbus: upgrade to 1.10.6

Derek Straka (1):
=20=20bind: update to 9.10.3-P3

Enrico Jorns (1):
=20=20systemd: fix systemctl enable script for template units

George McCollister (7):
=20=20bash-completion: move in recipe from meta-oe
=20=20bash-completion.bbclass: add class
=20=20dbus-glib: use bash-completion.bbclass
=20=20util-linux: use bash-completion.bbclass
=20=20git: use bash-completion.bbclass
=20=20kmod: use bash-completion.bbclass
=20=20glib: use bash-completion.bbclass

Hongxu Jia (3):
=20=20mkelfimage: fix target cflags leaks to host
=20=20glibc.inc: do not immediate expand SELECTED_OPTIMIZATION
=20=20systemtap_git.inc: do not immediate expand SELECTED_OPTIMIZATION

Joshua Lock (2):
=20=20connman-conf: convert to systemd oneshot
=20=20connman: tidy up connman-conf usage

Khem Raj (13):
=20=20argp-standalone: Fix build when S !=3D B
=20=20ltp: Add rdep on ldd
=20=20gdb: Fix build failures on musl
=20=20bsd-headers: Fix LICENCE and dev package RDEPENDS
=20=20btrfs-tools: Disable backtrace on musl
=20=20grub: Backport fix for largefile detection/use
=20=20elfutils: Fix build with uclibc/musl
=20=20pth: Delete
=20=20fts: Correct LIC_FILES_CHKSUM
=20=20libdrm: Refresh patch to match upstream submission
=20=20musl: Upgrade to tip of tree
=20=20gcc, qemuppc: Explicitly disable forcing SPE flags
=20=20binutils: Upgrade to 2.26

Markus Lehtonen (6):
=20=20devtool: extract: use the correct datastore for builddir
=20=20meta/lib: new module for handling GPG signing
=20=20buildhistory: fix the check for existence of a git repo
=20=20autotools.bbclass: use oe_runmake instead of ${MAKE}
=20=20Make sure that the directory for CONFIGURESTAMPFILE exists
=20=20externalsrc: use shared CONFIGURESTAMPFILE if B=3DS

Mathieu Desnoyers (1):
=20=20gcc: fix hidden weak symbols by removing buggy gcc patch

Maxin B. John (2):
=20=20connman: fix crash with iptables 1.6
=20=20libical: update to 2.0.0

Olof Johansson (1):
=20=20bitbake-whatchanged: avoid double do_ task name prefix

Paul Eggleton (6):
=20=20devtool: move edit-recipe to a separate module
=20=20devtool: build-image: allow specifying packages to add to image
=20=20devtool: add: warn if modified recipe found in attic directory
=20=20devtool: properly handle bb.build.FuncFailed when extracting source
=20=20devtool: add configure-help subcommand
=20=20gen-lockedsig-cache: fix bad destination path joining

Peter Kjellerstedt (3):
=20=20documentation.conf: Update the help for BBMASK
=20=20local.conf.sample.extended: Update the info about BBMASK
=20=20lib/oe/patch: Make GitApplyTree._applypatch() support read-only =
.git/hooks

Phil Blundell (1):
=20=20native.bbclass: Set CXXFLAGS from BUILD_CXXFLAGS not BUILD_CFLAGS

Richard Purdie (14):
=20=20Revert "xz: Allow to work with ASSUME_PROVIDED xz-native"
=20=20libuser: Drop unneeded xz-native dependency
=20=20libtirpc: Drop unneeded xz-native dependency
=20=20gcc-cross-canadian: Add missing DEPENDS on =
virtual/${HOST_PREFIX}gcc-crosssd
=20=20kernel: Clean DEPLOYDIR before do_deploy runs
=20=20image: Don't create tasks with '.' in the name
=20=20gtk-icon-utils-native: Drop problematic dependency
=20=20sstate: Improve handling of useradd dependencies
=20=20sstate: Add back packagedata on packagedata dependencies
=20=20base: Move COMPATIBLE_MACHINE out the scope of SOURCE_MIRROR_FETCH
=20=20binutils: Use target provided zlib
=20=20pcmciautils: Fix makefile race
=20=20libarchive-native: Disable libxml2 support
=20=20sstate: Revert using -m option to tar in sstate

Richard Tollerton (1):
=20=20libc-package.bbclass: add LOCALE_UTF8_IS_DEFAULT

Robert Yang (3):
=20=20image.bbclass: check INITRAMFS_MAXSIZE
=20=20gdb-common.inc: add PACKAGECONFIG for readline
=20=20autotools_stage.bbclass: remove it

Ross Burton (8):
=20=20rootfs-postcommands: fix allow-empty-password on read-only rootfs
=20=20e2fsprogs: disable blkid
=20=20scripts/wipe-sysroot: also delete uninative sysroot
=20=20uninative: fix path to patchelf-uninative
=20=20uninative: handle UNINATIVE_URL being file:///
=20=20meta: fix capitalisation in Upstream-Status
=20=20insane: remove unused variable assignment
=20=20oeqa/runtime/rpm: be more verbose if test_rpm_query_nonroot fails

Roy Li (3):
=20=20systemd: make TEST_DIR configurable
=20=20netbase: add ipv6 host to /etc/hosts
=20=20kexec: package kdump init script/configuration file correctly

Stefan Agner (1):
=20=20lib/oe/package_manager: remove package feed lists

Yuqing Zhu (2):
=20=20gstreamer1.0-plugins-bad: Fix memory leak of navigation thread
=20=20gstreamer1.0-plugins-base: Add video crop supporting when convert =
frame

bmouring@ni.com (1):
=20=20avahi: Add patch to fix Win10 mDNS issues

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Adrian (1):
=20=20networkmanager-openvpn: Update to 1.0.8

Andreas M=C3=BCller (3):
=20=20gvfs: update to 1.24.2 to make access to windows shares work again
=20=20xfce4-power-manager: remove udisks rdependency
=20=20thunar: remove udisks from RRECOMMENDS

Belal, Awais (1):
=20=20mplayer2: fix building with gcc 5.x

Dai Caiyun (6):
=20=20opensaf: 4.6.0 -> 4.7.0
=20=20networkmanager: 1.0.6 -> 1.0.10
=20=20python-pip: 7.1.0 -> 7.1.2
=20=20dracut: 043 -> 044
=20=20syslog-ng: 3.5.4.1 -> 3.6.4
=20=20cryptsetup: 1.6.7 -> 1.7.0

Derek Straka (4):
=20=20python-jsonpatch: add recipe for 1.12
=20=20python-jsonpointer: add recipe for 1.10
=20=20jq: upgrade to 1.5
=20=20python-tornado: upgrade to 4.3

Li xin (1):
=20=20python-six: Error fix for recipes depend on python-six

Mark Asselstine (1):
=20=20ctdb: Fix rootfs creation errors

Martin Jansa (3):
=20=20terminus-font: update perl-native-runtime dependency
=20=20phoronix-test-suite: exclude bash, php, python dependency with =
SIGGEN_EXCLUD
=20=20telepathy-glib: update python-native-runtime dependency

Maxin B. John (1):
=20=20libjpeg-turbo: remove recipe

Moritz Fischer (1):
=20=20gpsd: Add patch to fix broken ACTIVATE hook.

Nate Karstens (1):
=20=20dhcpcd: add recipe for dhcpcd

Robert Yang (1):
=20=20dfu-util: use BP in SRC_URI

Trevor Woerner (1):
=20=20nodejs: update from 4.2.3 to 4.2.4

Yi Zhao (4):
=20=20debootstrap: fix host-user-contaminated
=20=20espeak: fix host-user-contaminated
=20=20orrery: fix host-user-contaminated
=20=20logwatch: fix host-user-contaminated

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Anand Balagopalakrishnan (2):
=20=20libgbm: synchronize libgbm with upstream Mesa
=20=20omapdrmtest: disable viddectest on kmscube

Denys Dmytriyenko (5):
=20=20stress-ng: add 0.05.09
=20=20memtester: overlay 4.1.3 from meta-oe
=20=20memtester: upgrade 4.1.3 -> 4.3.0
=20=20k2-initramfs: update with NETCP PA FW images
=20=20k2-initramfs: update with proper initramfs

Gou, Hongmei (4):
=20=20packagegroup-arago-tisdk-addons-sdk-target: add elfutils-dev and =
elfutils-st
=20=20weston-init: update init scripts related to restarting Weston
=20=20opencv: update to version 3.1
=20=20tisdk-uenv: remove fdtfile hardcoding for am57xx-evm

Jacob Stiffler (8):
=20=20ti-llvm3.6: Upgrade ti-llvm from version 3.3 to 3.6
=20=20ocl: Upgrade to version 1.1.7.2
=20=20packagegroup-arago-tisdk-addons*: Add OpenCL and related packages for =
keysto
=20=20ti-tisdk-makefile: Add OpenCL and related targets for keystone
=20=20packagegroup-arago-tisdk-matrix: Add OpenCL matrix demos for keystone
=20=20tisdk-server-rootfs-image: Add unnecessary dev packages to =
BAD_RECOMMENDATIO
=20=20arm-benchmarks: Bump SRCREV
=20=20img-pvr-sdk: ti43x: Update branch and SRCREV for HDMI underrun fix

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Otavio Salvador (1):
=20=20imx-base.inc: Move IMAGE_FSTYPES override to a SoC variable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Max Krummenacher (1):
=20=20colibri-vf.conf: set mqxboot version with wildcard

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Jianxun Zhang (4):
=20=20libva: Update to 1.6.2
=20=20libva-intel-driver: Update to 1.6.2
=20=20gstreamer-vaapi: Update install-tests.patch
=20=20gstreamer-vaapi: Update 0.6.1-> 0.7.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-jetson-tk1:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Alex J Lennon (3):
=20=20mono: add support for 4.2.2.30
=20=20README: update release notes link/testing of 4.2.2.30 on =
jethro/qemux86
=20=20layer.conf: default to mono 4.2.2.30

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (6):
=20=202016-01-12, Version 5.4.1 (Stable)
=20=202016-01-20, Version 4.2.5 "Argon" (LTS) Release
=20=202016-01-20, Version 5.5.0 (Stable)
=20=202016-01-21, Version 4.2.6 "Argon" (LTS) Release
=20=20Merge pull request #20 from siemens/sharedlibs
=20=20Updated copyright year

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (4):
=20=20netcp-pa-fw: add initial version 1.0.0
=20=20linux-ti-staging: update to 4.1.16 with latest merges
=20=20linux-ti-staging: add runtime dependency on NETCP PA firmware
=20=20netcp-sa-fw: add initial version 1.0.0

Jacob Stiffler (30):
=20=20ti-cgt6x: Upgrade to version 8.1.0
=20=20ti-cg-xml: Add version 2.41.00
=20=20ti-pdk.bbclass: Add class for creating RTOS PDK components
=20=20common-csl-ip: Upgrade to version 3.3.0.1B
=20=20rm-lld: Seperate source info into .inc file
=20=20rm-lld: Bump version to 02.02.00.00
=20=20rm-lld-rtos: Add RTOS package of the RM LLD
=20=20qmss-lld: Upgrade to version 2.1.0.12
=20=20qmss-lld-rtos: Add RTOS package for QMSS LLD
=20=20cppi-lld: Upgrade version to 2.1.0.11
=20=20cppi-lld-rtos: Add RTOS package for CPPI LLD
=20=20openmp-rtos: Add the OpenMP RTOS package
=20=20gdbc6x: Extend support to keystone SOCs
=20=20edma3-lld: Upgrade version to 2.12.01.22
=20=20edma3-lld-rtos: Extend supported SOCs
=20=20multiprocmgr: Clean up recipes
=20=20multiprocmgr-rtos: Add RTOS package for multiprocmgr
=20=20aif2-lld: Upgrade to version 1.2.0.1
=20=20dfe-lld: Upgrade to version 1.0.0.7
=20=20hyplnk-lld: Bump SRCREV
=20=20iqn2-lld: Upgrade to version 1.0.0.10
=20=20mmap-lld: Upgrade to version 2.0.0.6
=20=20nwal-lld: Upgrade to version 02.01.00.09
=20=20pa-lld: Upgrade to version 03.00.01.07
=20=20pktlib: Upgrade to version 2.1.0.6
=20=20sa-lld: Upgrade to version 03.00.00.12
=20=20srio-lld: Upgrade to version 02.00.00.14
=20=20traceframework: Upgrade to version 01.01.01.08
=20=20hplib-mod: Add to KERNEL_MODULE_AUTOLOAD
=20=20uio-module-drv: Add to KERNEL_MODULE_AUTOLOAD

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Alejandro Hernandez (1):
=20=20linux-yocto: Adds new genericx86 and genericx86-64 SRCREVs for kernel =
4.4

Peter Kjellerstedt (1):
=20=20local.conf.sample.extended: Update the info about BBMASK

Richard Purdie (1):
=20=20poky: Add poky-world-exclude.inc and add qwt-as

Ross Burton (1):
=20=20conf/distro/poky.conf: use example.com for connectivity check

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



