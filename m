Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id F12076D8F6;
	Mon,  3 Feb 2014 20:46:07 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id uq10so4944342igb.5
	for <multiple recipients>; Mon, 03 Feb 2014 12:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=5sDUz9nXrIGdqfR2H81W7OTK+uagii38wq4VMC2WEbM=;
	b=HqLFhQHZCuMyoEGL+LpoblWerfdQunnQyOCnwJBaQw19ppRtbe/L4TjrHOAGOcXDL5
	PwYCUN+qrNpz98zNYLWmcqWpyXmHua3fn2vQhqrTSzqlok6bdm/H+070YdnfNU9cYmz5
	xUZM8o2yLNHs1B4KuL9DTbD7o+95iz4hIE2TVZGSjJrdrPlcegU79jtfnXdwNU2kUS30
	3bhz4ILLmoQAGHA44foauXn7ppbr6E6G02uHDI8hUrmSnhVIeULv6IbQn+MYjk0xyOs/
	XtACz2aXeiiVuiThbHspHFiUn2mLmvitb2ArFVgDoPY9pV0EdC1uxOSC08WD9n5TvrDA
	pfPw==
X-Received: by 10.42.27.136 with SMTP id j8mr2053033icc.69.1391460368499;
	Mon, 03 Feb 2014 12:46:08 -0800 (PST)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200])
	by mx.google.com with ESMTPSA id qb3sm34169163igb.7.2014.02.03.12.46.05
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Feb 2014 12:46:07 -0800 (PST)
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 03 Feb 2014 12:46:07 -0800 (PST)
Message-Id: <1391460364859.dd77c649@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-01-26 until 2014-02-02
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
X-List-Received-Date: Mon, 03 Feb 2014 20:46:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-01-26 until 2014-02-02.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-arago: git://arago-project.org/git/meta-arago.git
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
git://gitorious.org/schnitzeltony-oe-meta/meta-gumstix-community.git
meta-handheld: git://git.openembedded.org/meta-handheld
meta-igep: http://github.com/ebutera/meta-igep.git
meta-intel: git://git.yoctoproject.org/meta-intel
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-java: git://github.com/woglinde/meta-java
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-micro: git://git.openembedded.org/meta-micro
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
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

Alexandru DAMIAN (8):
=20=20toaster: update Simple UI references to avoid conflict
=20=20toaster: update Task classification fields
=20=20toaster: add vim modelines for .py files
=20=20toaster: add jquery cookie plugin
=20=20toaster: Toaster GUI Build and Dashboard pages fixes
=20=20toaster: settings remove duplicate entry
=20=20toaster: fix builds page CSS and functionality
=20=20toaster: fix package data gathering

Andreea Proca (1):
=20=20toaster: Add initial tests

Barros Pena, Belen (1):
=20=20toaster: Set .error styles for tables

Bill Traynor (6):
=20=20usermanual: Updated CC License to version 3.0
=20=20usermanual: Renamed manual dir to user-manual to be consistent.
=20=20user-manual: Import YP Docs templates for usermanual improvements
=20=20gitignore: Update for recent docs changes
=20=20documentation: Add README based off the YP docs one
=20=20user-manual-intro.xml: Re-write of BitBake introduction.

David Reyna (2):
=20=20toaster: Implementation of base build details page
=20=20toaster: Implementation of recipe detail views

Irina Patru (6):
=20=20hob: change error_msg for CommandFailed event
=20=20bitbake: hob: check if parser has attribute 'shutdown'
=20=20hob: unsetting busy cursor after hitting Stop button
=20=20hob: don't display interruptions as fails
=20=20hob: Don't always save proxy values in conf file
=20=20hob: No need for enable_proxy and same_proxy in conf file

Ravi Chintakunta (4):
=20=20toaster: Base html fix to set the page title
=20=20toaster: Base table fixes for header text, sort icon and filter icon
=20=20toaster: Added custom filter tags for use in templates.
=20=20toaster: All Tasks Feature with sorting and filtering

Richard Purdie (34):
=20=20user-manual: Separate out chapters into individual files
=20=20user-manual-intro: Expand introduction and fix spelling mistakes
=20=20user-manual-intro: Update/improve whitespace
=20=20user-manual-intro: Add obtaining bitbake and summary sections
=20=20user-manual-intro: Various minor cleanups/improvements
=20=20user-manual-metadata: Add section ids for most sections
=20=20user-manual-metadata: Reorder sections to more logical order
=20=20user-manual-metadata: Update whitespace (no content changes)
=20=20user-manual-metadata: Replace screen tags with literallayout tags
=20=20user-manual-metadata: Use filename tags instead of literal and =
varname tags
=20=20user-manual-metadata: Editing pass over the manual chapter
=20=20user-manual-metadata: Add lists of common events
=20=20user-manual-metadata: Add section about data store operations
=20=20user-manual-metadata: Rework section about shell/python functions
=20=20user-manual-metadata: Add section about running tasks and the =
environment
=20=20user-manual-metadata: Add section about INHERIT
=20=20user-manual-metadata: Add section about layers
=20=20user-manual-metadata: Expand parsing process docuemtnation
=20=20user-manual-metadata: Clean up task flag section
=20=20user-manual-metadata: Clean up task documentation
=20=20user-manual-fetching: Change the file whitespace
=20=20user-manual-fetching: Change screen -> literallayout
=20=20user-manual-fetching: Change varname/emphasis tags to filename
=20=20user-manual-fetching: Editing pass over the manual chapter
=20=20user-manual-bitbakecommand: Update help text output with that from =
bitbake m
=20=20user-manual-bitbakecommand: Reform whitespace
=20=20user-manual-bitbakecommand: Replace screen tags with literallayout
=20=20user-manual-bitbakecommand: Standardise on section tags, not example
=20=20user-manual-bitbakecommand: Various edits/cleanups
=20=20cooker: Add option of specifying indvidual tasks for targets
=20=20runqueue: Simplify pointless len() usage
=20=20Revert "usermanual: Updated CC License to version 3.0"
=20=20user-manual: Fix issue with previous revert
=20=20runqueue: Fix race against tasks sharing stamp files

Robert Yang (1):
=20=20siggen.py: fix the SignatureGenerator()

Scott Rifenbark (10):
=20=20user-manual-intro.xml: Added "Concepts" section.
=20=20user-manual.xml: Cleanup on the title page.
=20=20user-manual-hello.xml: Added new chapter for "Hello World Example"
=20=20user-manual-ref-variavbles.xml: Added new glossary chapter.
=20=20user-manual-metadata.xml: Renamed section tag
=20=20user-manual-customization.xsl: Updated param list to pass
=20=20template/titlepage.templates.xml: Suppress Title Text.
=20=20user-manual-ref-variables.xml: Editing pass.
=20=20user-manual-ref-variables.xml: Fixed references to "Build Directory".
=20=20user-manual-ref-variables.xml: Added 10 new variables to the glossary.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru DAMIAN (1):
=20=20toaster.bbclass: save original package name

Andreas Oberritter (1):
=20=20cogl: kms: include necessary header for size_t

Baogen Shang (2):
=20=20e2fsprogs:fix build native package error
=20=20curl:Fix multilib header conflict - curl/curlbuild.h

Barros Pena, Belen (1):
=20=20documentation.conf: update task descriptions

Chen Qi (15):
=20=20systemd: fix ptest to make it able to run on target
=20=20dropbear: add systemd unit files
=20=20openssh: fixes for systemd
=20=20distcc: add systemd support
=20=20at: add systemd support
=20=20run-postinsts: remove the init script after a clean start-up
=20=20dpkg: use systemd service for first boot configuration
=20=20udev: fix typo
=20=20Revert "Add missing RDEPENDS of initscripts-functions"
=20=20update-rc.d: automatically rdepend on initscripts-funtions
=20=20sysvinit: add initscripts-functions to RDEPENDS
=20=20busybox: upgrade to stable 1.22.1
=20=20meta-skeleton: rename busybox's bbappend file
=20=20coreutils: move 'stat' to base_bindir_progs
=20=20procps: make the 'watch' command register to /bin/watch

Chong Lu (4):
=20=20apr: enable ptest support
=20=20apr-util: enable ptest support
=20=20gawk: enable ptest support
=20=20parted: enable ptest support

Christopher Larson (1):
=20=20tiff: flesh out PACKAGECONFIG

Corneliu Stoicescu (1):
=20=20oe-selftest: New tests for sstate relocation

Cristian Iorga (6):
=20=20neard: upgrade to 0.14
=20=20libpcap: upgrade to 1.5.3
=20=20minicom: upgrade to 2.7
=20=20connman: upgrade to 1.21
=20=20rpcbind: fixes crash during start
=20=20minicom: fix for multilib and x32 build crash

Darren Hart (12):
=20=20x86: Replace ia32 with x86 when referring to the generic architecture
=20=20i586: Only add the current tune to PACKAGE_EXTRA_ARCHS
=20=20tune-core2: Replace -mtune=3Dgeneric with -mtune=3Dcore2
=20=20tune-core2: Only add the current ARCH to PACKAGE_EXTRA_ARCHS
=20=20tune: Make 32b or 64b explicit in tune name for core2
=20=20tune-corei7: Add support for cpu-type corei7
=20=20tune: Remove tune-x86_64.inc
=20=20tune: README: Whitespace cleanup
=20=20tune: README: Document best practice
=20=20tune: README: Typographical corrections
=20=20qemux86_64: Use the core2-64 tune
=20=20eglibc-ld.inc: Update the inc file to match the new x86 tune

David Nystr=C3=B6m (1):
=20=20packagegroup-core-standalone-sdk-target: Add qemuwrapper-cross to =
target sys

Fahad Arslan (1):
=20=20speex: configure in float or fixed mode based on TARGET_FPU

Fathi Boudra (6):
=20=20ltp: update SRC_REV to LTP 20140115 release
=20=20ltp: fix style using oe-stylize (no changes in the content of the =
recipe its
=20=20ltp: drop do_unpack_append/do_extract_tarball
=20=20ltp: update ffsb-6.0-rc2 license file path
=20=20ltp: fix comment to refer to oe-core instead of poky
=20=20ltp: fix ffsb ftbfs on cross-compiled environment

Holger Hans Peter Freyther (1):
=20=20gcc: Include patch scheduled for GCC 4.8.3 to fix epilogue on ARM

Jacob Kroon (1):
=20=20cml1.bbclass: Fix return code handling in do_menuconfig()

Jason Wessel (7):
=20=20unfs3: Add a NFSv3 user mode server for use with runqemu
=20=20unfs3, unfs-server: Replace all instances of unfs-server with unfs3
=20=20unfs-server: Remove unfs-server recipe and patches
=20=20runqemu-export-rootfs: update for unfs3
=20=20runqemu, runqemu-internal: Allow slirp for NFS and KVM use
=20=20unfs3: Fix dependencies and allow target builds
=20=20unfs3: Fix compile regression from unfs3 port

Jonas Eriksson (1):
=20=20qemu: Allow building without X11 support

Jonathan Liu (1):
=20=20syslinux: fix booting memtest86+ using pxelinux regression

Koen Kooi (3):
=20=20linux-firmware: split out ATI/AMD Radeon firmware
=20=20scons bbclass: enable parallel make
=20=20lz4: actually install things

Kristof Robot (1):
=20=20Add Cortex A7 support for NEONv2 & FPv4

Laszlo Papp (1):
=20=20lib/oe/patch.py: Prefer "git am" over "git apply" when applying git =
patches

Leonid Borisenko (2):
=20=20package.bbclass: add getter of additional metadata
=20=20package_{ipk, deb, rpm}.bbclass: support additional user-defined =
metadata

Martin Jansa (10):
=20=20cmake: Fix freetype detection
=20=20opkg-utils: Add RPROVIDES/RREPLACES/RCONFLICTS to fix upgrade-path
=20=20feature-arm-thumb: Fix missing t2 suffix for armv7a MACHINEs
=20=20package.bbclass: Don't search for providers of PRIVATE_LIBS
=20=20package.bbclass: Show which files require given dependency in debug =
output
=20=20sstate-cache-management.sh: Fix remove_duplicated() to work after =
SSTATE_SWS
=20=20sstate-cache-management.sh: Fix rm_by_stamps() to work after =
SSTATE_SWSPEC c
=20=20sstate-cache-management.sh: Show total number of files when showing =
how many
=20=20sstate-cache-management.sh: Fix available architectures
=20=20sstate-cache-management.sh: don't remove all packagedata sstate =
archives

Mikhail Durnev (2):
=20=20wpa-supplicant: Add dependency on openssl
=20=20unzip: Pass LDFLAGS to the linker

Ming Liu (2):
=20=20multilib.bbclass: fix Multilib QA Issue
=20=20quilt: add ac_cv_path_BASH to CACHED_CONFIGUREVARS also for native

Nathan Rossi (1):
=20=20kernel.bbclass: Fix empty modules directory QA issue

Otavio Salvador (1):
=20=20buildhistory.bbclass: Improve robustness in image file listing

Phil Blundell (1):
=20=20alsa-utils: Add PACKAGECONFIG for udev

Richard Purdie (6):
=20=20utils: Add a cpu_count wrapper function
=20=20local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and =
PARALLEL
=20=20pkgconfig: Drop glibconfig from SRC_URI to unbreak builds after =
previous com
=20=20cogl: Place the patch in the correct directory
=20=20libtool: Set CONFIG_SHELL for nativesdk
=20=20scripts/cp-noerror: Avoid a race

Robert Yang (3):
=20=20sanity.bbclass: check required perl modules
=20=20mdadm: fix build on qemumips64
=20=20sanity.bbclass: check that TMPDIR is not located on nfs

Ross Burton (5):
=20=20run-postinsts: Add systemd service file
=20=20systemd-compat-units: remove run-postints service
=20=20image.bbclass: fix paths to run-postinsts
=20=20python-numpy: don't search host directories for libraries
=20=20pkgconfig: remove out-dated configure options and dependencies

Roy Li (1):
=20=20initscripts: define failure/success/warning/pass functions

Saul Wold (4):
=20=20lsbinitscripts: Update to 9.52
=20=20libcgroup: Update to 0.41
=20=20runqemu: Use the newer unfs3 for serving user space nfs
=20=20combo-layer: Make directories only if they don't exisit yet

Sipke Vriend (1):
=20=20lib/oeqa: sshcontrol: Allow alternate port for SSHControl

Stefan Stanacar (6):
=20=20oeqa/runtime: rpm: fix finding the test rpm file
=20=20scripts/runqemu-internal: use -cpu core2duo for qemux86-64
=20=20oeqa/runtime: drop restartTarget method
=20=20oeqa/runtime: smart: fix adding channels
=20=20oeqa/utils: sshcontrol: rewrite the SSHControl class
=20=20oeqa/runtime: syslog: update --help test

Tobias Blom (1):
=20=20apmd.service: Fix typo (not mandatory EnvironmentFile prefix)

Tyler Hall (1):
=20=20db: Fix libtool linking against local libstdc++.so

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas Oberritter (1):
=20=20dietsplash: bump SRCREV

Javier Viguera (1):
=20=20networkmanager: fix incorrect configure option

Koen Kooi (4):
=20=20xf86-video-ati: recommend linux-firmware
=20=20libhugetlbfs: ensure package strip logic stays the same after oe-core =
packag
=20=20libusbg: add 0.1.0
=20=20gperftools: update to 2.1

Martin Jansa (1):
=20=20connman: Rename .bbappend to match new version from oe-core

Ming Liu (1):
=20=20samba: add PACKAGECONFIG for libunwind

Nick D'Ademo (1):
=20=20opencv: Bump SRCREV, PV is now 2.4.8+git

chase maupin (1):
=20=20php: update SRC_URI for new download location

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20connman: Use wildcard in bbappend

Koen Kooi (1):
=20=20angstrom-version: enhance lsb_release arg parsing

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Chase Maupin (1):
=20=20ts-calibrate-init: export TSLIB_TSDEVICE

Denys Dmytriyenko (12):
=20=20openssl: drop NO_ONESHOT patch to unbreak SHA1 and MD5
=20=20dual-camera-demo: fix the license
=20=20php: amend URL with the new location of the source tarball
=20=20qt5: remove upstreamed nativesdk recipes, update bbappends 5.1.1 -> =
5.2.0
=20=20uim: few cosmetic fixes
=20=20ipc-test-fw: add FW images version 3.21.00.02 for IPC tests
=20=20packagegroup-arago-test: add ipc-test-fw package
=20=20packagegroup-arago-test: move ipc-test-fw into omap-a15 specific list
=20=20base-files: pre-create /run symlink to point to /var/run
=20=20udev-extraconf: overlay mount.sh as is from oe-core/dylan
=20=20udev-extraconf: update mount.sh to use /run/media instead of /media
=20=20packagegroup-*-connectivity: add back bt-firmware required for =
WiLink8 on am

Eyal Reizer (1):
=20=20bluetooth-firmware: update for wilink8 sp3.3

Franklin S. Cooper Jr (12):
=20=20dual-camera-demo: Dual Camera Demo App
=20=20ti-tisdk-makefile: Add dual camera demo to Makefile
=20=20arago-source-ipk.conf: Generate sourceipk for the dual-camera-demo
=20=20packagegroup-arago-tisdk-*: Add dual camera demo to AM437x SDK
=20=20ti-tisdk-setup: Update to support new u-boot, kernel and device
=20=20stress: Pull stress into meta-arago-extras
=20=20packagegroup-arago-test: Add useful testing tools
=20=20packagegroup-arago-tisdk-connectivity: Add UIM for Bluetooth
=20=20busybox: Enable nice and bridge control utility
=20=20packagegroup-arago-tisdk-addons: Add ptpd utility
=20=20ts-calibrate: Always export TSLIB_CALIBFILE env variable
=20=20Update sd card partition mount location

Roger Monk (1):
=20=20ti-connectivity/uim: Add Usermode Init Mgr for TI Wilink Shared =
Transport

Yaniv Machani (3):
=20=20Wl18xx : recipes update - tag changed to ol_r8.a8.10
=20=20hostap-daemon-wl18xx: fix conf file
=20=20wl18xx wlconf: add missing default bin

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Khem Raj (1):
=20=20nss: Remove in favor of OE-Core

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

Daiane Angolini (3):
=20=20imx51evk: Add myself as maintainer
=20=20mx53ard: Add myself as maintainer
=20=20imx6qsabreauto: Add myself as maintainer

Otavio Salvador (7):
=20=20imx23evk: Add myself as maintainer
=20=20imx28evk: Add myself as maintainer
=20=20imx6dlsabresd: Add myself as maintainer
=20=20imx6qsabresd: Add myself as maintainer
=20=20imx6slevk: Add myself as maintainer
=20=20imx6solosabresd: Add myself as maintainer
=20=20scripts/get-maintainer: Allow query of maintainer

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Carlos Rafael Giani (3):
=20=20u-boot-cubox-i: add u-boot fork for cubox-i machines
=20=20linux-cubox-i: add customized kernel
=20=20cubox-i: add machine config

Eric Nelson (6):
=20=20linux-boundary: Add support for 3.10.17-beta
=20=20u-boot-script-boundary: update to latest revision on Github
=20=20u-boot-script-boundary: Allow board-specific boot scripts
=20=20imx6qsabrelite: Add myself as maintainer
=20=20nitrogen6x: Add myself as maintainer
=20=20nitrogen6x-lite: Add myself as maintainer

Otavio Salvador (4):
=20=20net-persistent-mac: Use the license text from common-licenses
=20=20linux-denx: Update SRC_URI for new fetcher behavior.
=20=20cgtqmx6: Set u-boot-imx version to 2009.08
=20=20linux-imx (3.0.35): Update Congatec cgtqmx6 to 3.0.35-4.1.0

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

Darren Hart (26):
=20=20Add linux-yocto-dev bbappend
=20=20Add Intel core2 and corei7 BSPs and tune files
=20=20meta-intel.inc: Use X86 instead of IA32
=20=20chiefriver: Use corei7 tuning
=20=20crownbay: Use core2-32 tuning
=20=20fri2: Use core2-32 tuning
=20=20sys940x: Use core2-32 tuning
=20=20n450: Use core2-32 tuning
=20=20crystalforest: Use corei7 tuning
=20=20emenlow: Use core2-32 tuning
=20=20haswell-wc: Use corei7 tuning
=20=20jasperforest: Use corei7 tuning
=20=20nuc: Use corei7 tuning
=20=20romley: Use corei7 tuning
=20=20sugarbay: Use the corei7 tune
=20=20chiefriver: Set PACKAGE_ARCH to MACHINE_ARCH explicitly
=20=20crownbay: Set PACKAGE_ARCH to MACHINE_ARCH explicitly
=20=20crystalforest: Set PACKAGE_ARCH to MACHINE_ARCH explicitly
=20=20emenlow: Set PACKAGE_ARCH to MACHINE_ARCH explicitly
=20=20fri2: Set PACKAGE_ARCH to MACHINE_ARCH explicitly
=20=20jasperforest: Set PACKAGE_ARCH to MACHINE_ARCH explicitly
=20=20n450: Set PACKAGE_ARCH to MACHINE_ARCH explicitly
=20=20nuc: Set PACKAGE_ARCH to MACHINE_ARCH explicitly
=20=20romley: Set PACKAGE_ARCH to MACHINE_ARCH explicitly
=20=20sugarbay: Set PACKAGE_ARCH to MACHINE_ARCH explicitly
=20=20sys940x: Set PACKAGE_ARCH to MACHINE_ARCH explicitly

Koen Kooi (1):
=20=20emgd-driver-bin: preserves the package stripping logic

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (11):
=20=20bluez4: Remove fix for udev_get_sys_path - already merged
=20=20ecryptfs-utils: Move patch in directory
=20=20fuse: Move patches in directory
=20=20keyutils: Set SUMMARY and remove tabs
=20=20fuse: Set SUMMARY and remove tabs
=20=20ecryptfs-utils: Set and tweak SUMMARY and DESCRIPTION
=20=20gemini-image: Remove not needed comments
=20=20gst-plugins-good: Remove bbappend
=20=20pulseaudio: Cleanup old fixes
=20=20sdcard_image: Remplace tabs by spaces
=20=20tiff: Remove bbappend

Florin Sarbu (4):
=20=20dlt-daemon: Remove git tag from SRC_URI     and just rely on the =
specific SH
=20=20layer-management: Remove git tag from SRC_URI     and just rely on =
the speci
=20=20audiomanager: Remove git tag from SRC_URI     and just rely on the =
specific=20
=20=20node-startup-controller: Remove git tag from SRC_URI     and just =
rely on th

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Andreas Oberritter (2):
=20=20cmake-native: disable test for Qt5Core
=20=20qtwebkit: drop obsolete patch 0001-jsc-Add-licuuc-licui18n-LIBS.patch

Martin Jansa (1):
=20=20qtmultimedia.inc: Fix duplicating '{'

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (4):
=20=20defaulttunes.inc: update SUPPORTED_EXTRA_ARCHS to match with fixed =
oe-core
=20=20kernel_android: depend only on initramfs-android-image:do_rootfs

Simon Busch (9):
=20=20meta-samsung: linux-samsung-tuna: cleanup configuration and disable =
things w
=20=20meta-android: kernel_android: implement kernel update
=20=20meta-samsung: linux-samsung-tuna: specify boot partition for kernel =
update
=20=20meta-asus: linux-asus-grouper: specify boot partition for kernel =
update
=20=20meta-android: kernel_android.bbclass: use global machine variable for =
boot p
=20=20meta-asus: conf: grouper: specify ANDROID_BOARD_BOOTIMAGE_PARTITION
=20=20meta-samsung: conf: tuna: specify ANDROID_BOARD_BOOTIMAGE_PARTITION
=20=20meta-samsung: linux-samsung-tuna: bump SRCREV and update defconfig
=20=20meta-samsung/meta-asus: update android-system-image for maguro and =
grouper m

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Andreas M=C3=BCller (2):
=20=20gadget-init: update oe-core's LICENSE checksum
=20=20beaglebone-capes: update oe-core's LICENSE checksum

Denys Dmytriyenko (2):
=20=20linux-ti-staging: update to stable 3.12.9, other bugfixes
=20=20sdcard_image: remove deprecated class

Sam Nelson (2):
=20=20cmem: adding new recipe for cmem
=20=20boot-monitor: keystone-evm: update to latest version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Anatolii Sakhnik (1):
=20=20webos-image: luna-service2=3D172

Maksym Sditanov (1):
=20=20webos-image: db8=3D121

Martin Jansa (4):
=20=20valgrind: Backport 3.9.0 from oe-core
=20=20webos_arch_indep: Issue error when inherited after webos_machine*_dep
=20=20webos.inc: Fix parsing issues caused by WEBOS_DISTRO_BUILD_CODENAME
=20=20icecc: Backport few more fixes from upstream

Nikolay Orliuk (1):
=20=20webos-image: luna-init=3D6

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Chen Qi (1):
=20=20meta-yocto: rename busybox's bbappend file to match the current =
version

Darren Hart (6):
=20=20genericx86: Use the core2 tune file
=20=20genericx86-64: Use the core2-64 tune
=20=20genericx86: Use new x86 tune files
=20=20genericx86: Use require instead of include
=20=20yocto-bsp: Update substrate to use the new x86 tune files
=20=20yocto-bsp: Add core2 and corei7 tune choice to x86_64

Krzysztof Sywula (1):
=20=20Revert "poky-tiny: Assume pkgconfig is provided"

Richard Purdie (1):
=20=20local.conf.sample: Add automatic defaults for BB_NUMBER_THREADS and =
PARALLEL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



