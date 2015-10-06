Return-Path: <cliff.brake@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1B1605D2;
	Tue,  6 Oct 2015 14:30:55 +0000 (UTC)
Received: by iofh134 with SMTP id h134so223981627iof.0;
	Tue, 06 Oct 2015 07:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=+RzrNNpzzlBqWVTsHLnH86QLN97UGpPVJBdt8ZsjVIY=;
	b=ujsk3PMJkZh39VAKQcxo5Eu3CHqT/LU7QRw9i/sQMsM50qCabjV7RguiNL1GjzoORa
	GvBf3xfaasAzW4/5Tmqvuj72/TCKN4zHdxnAD3kr0hvlEgAwtRrve1Tb0Z7sgg/eKsjD
	4iHAz3bZPxKSZazW314otrbF/MBCJVGmSZIPZZhJ8FAiD3RWDu4e/vle1BwUKdvVJWNC
	j1vY9TIU25rRbYARr8T7Isqo6tV9xVacKDi7ftvfWyMrkhi2qvtIQyqELtzcSrWIbqhB
	c6nuhkLiyNv8becVnouRpstbi8mLb+M6xO6STQE+SCbc0lokakqg3fSvjlVyxYWM1ulo
	RZZg==
X-Received: by 10.107.31.135 with SMTP id f129mr42662416iof.8.1444141855058;
	Tue, 06 Oct 2015 07:30:55 -0700 (PDT)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	n14sm12367479ioi.15.2015.10.06.07.30.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Oct 2015 07:30:53 -0700 (PDT)
Date: Tue, 06 Oct 2015 07:30:53 -0700 (PDT)
X-Google-Original-Date: Tue, 06 Oct 2015 14:30:51 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1444141851720.1bf3a71d@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-09-27 until 2015-10-04
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
X-List-Received-Date: Tue, 06 Oct 2015 14:30:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-09-27 until 2015-10-04.  Projects included in this =
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

David Reyna (1):
=20=20toaster: display most recent builds for projects

Ed Bartosh (11):
=20=20toaster: make a workaround for old style index
=20=20toaster: create custom layer and recipes for Image customisation
=20=20toaster: implement decorator for REST responses
=20=20toaster: Add new ReST API for Image Customisation feature
=20=20toaster: Add test cases for new Image customisation features
=20=20toaster: don't use --single-branch when cloning
=20=20toaster: use git reset --hard instead of rebase
=20=20toaster: fix bug in resetting git repository
=20=20toaster: fix reimporting module
=20=20toaster: make clone directory name unique
=20=20toaster: move clones into subdirectory

Markus Lehtonen (1):
=20=20utils: only add layer once in edit_bblayers_conf()

Michael Wood (17):
=20=20toaster: tables Move the title and name into the widget
=20=20toaster: widgets ToasterTable add logger to notify when cache hit
=20=20toaster: widgets ToasterTable Add more info to search field exception
=20=20toaster: add nocache option to the ToasterTable widget
=20=20toaster: ToasterTable remove unused class definition
=20=20toaster: Add CustomImageRecipe model
=20=20toaster: add toggle for enabling image customisation feeature
=20=20toaster: Fix indentation of jsunittests view
=20=20toaster: Add ToasterTables for Image customisation feature
=20=20toaster: Add Image customisation frontend feature
=20=20toaster: Special case the openembedded-core layer to avoid duplicates
=20=20toaster: Create a relationship between build information and toaster =
layers
=20=20toaster: Prioroitise the layer more generic vcs reference over the sha
=20=20toaster: tables show all recipes in the layerdetails even duplicates
=20=20toaster: buildinfohelper Create a copy of the built layer and recipe
=20=20Revert "bitbake: toaster: don't re-create Target objects"
=20=20toaster: orm remove the complicated querying on the ORM

Richard Purdie (6):
=20=20bitbake-worker: Guard against multiprocessing corruption of event data
=20=20cookerdata: Rename BBPKGS -> BBTARGETS
=20=20taskdata: Add a function to return the virtual/ mapping data
=20=20runqueue: Add handling of virtual/xxx provider mappings
=20=20siggen: Make it clear why nostamp tasks signatures don't match
=20=20bitbake/lib: Update version to 1.28.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alex Franco (4):
=20=20sanity.bbclass: show warning when chmod fails
=20=20Empty image:rootfs.py:handle empty PACKAGE_INSTALL
=20=20Empty image: core-image-empty recipe
=20=20lsb: add lsbinitscripts and util-linux rdepends

Alexander Kanavin (7):
=20=20recipeutils.py: don't hardcode the upstream version as 1.0 when =
SRC_URI is e
=20=20distrodata: handle recipes with empty or absent SRC_URI in checkpkg()
=20=20gstreamer1.0-plugins-bad: change glimagesink rank to marginal
=20=20image.bbclass: when building a readonly rootfs, tweak ssh settings =
regardles
=20=20openssh: fix sshd key generation when systemd is in use and rootfs is =
readon
=20=20image.bbclass: tweak the key location for dropbear when rootfs is =
readonly
=20=20dropbear: fix key generation when systemd is in use and rootfs is =
readonly

An=C3=ADbal Lim=C3=B3n (2):
=20=20runqemu-internal: qemuarm enable usage of virtio devices
=20=20linux-yocto_{3.14,3.19,4.1}: qemuarm enable virtio drivers

Beth Flanagan (1):
=20=20distro-alias.inc: Updated for jethro 2.0 release

Bruce Ashfield (6):
=20=20linux-yocto/4.1: common-pc-drivers: add CONFIG_PATA_SCH
=20=20linux-yocto/4.1: rt update to 4.1.x-rt8
=20=20linux-yocto-rt/4.1: integrate axxia BSP
=20=20linux-yocto/4.1: update to 4.1.8 -stable
=20=20linux-yocto/4.1: braswell bug fixes
=20=20kern-tools: fix multi-layer patch application

Carlos Alberto Lopez Perez (2):
=20=20webkitgtk: Use ON/OFF for cmake switches.
=20=20webkitgtk: Add some PACKAGECONFIG options.

Chen Qi (3):
=20=20cups: fix pam configuration file's permission
=20=20iproute2: fix the configure process
=20=20util-linux: add runuser PAM config files to fix runuser error

Cristian Iorga (1):
=20=20Revert "oeqa/runtime: Added one runtime testcase in connman."

Daniel Istrate (1):
=20=20oeqa/selftest/wic: Added testcase decorator to all testcases + fixed =
minor t

Ed Bartosh (1):
=20=20recipes-extended: remove duplicate recipe and .wks

Ian Ray (1):
=20=20ptest: run-ptest not required to run do_install_ptest

Jackie Huang (1):
=20=20cwautomacros: cleanup buildpath in autogen.sh

Jonathan Liu (2):
=20=20opkg: create opkg.lock in /run instead of /var/run
=20=20systemd: add PACKAGECONFIG for qrencode

Jussi Kukkonen (4):
=20=20connman: Depend on xuser-account unconditionally
=20=20connman: Don't use a blanket "allow" D-Bus policy
=20=20bluez5: Use upstream D-Bus policy
=20=20xuser-account: Take over xuser specific D-Bus policy

Kai Kang (1):
=20=20ltp: replace 'inline' with 'static inline' for gcc 5.x

Kevin Hao (1):
=20=20kernel.bbclass: fix the bug of checking the existing sections in =
do_strip()

Khem Raj (4):
=20=20busybox: Use UTMPX instead of legacy UTMP
=20=20busybox: Use CC instead of bare LD to be the Linker
=20=20waffle: Fix build with musl
=20=20hostap-utils: Use C99 stddefs in defining local typedefs

Leonardo Sandoval (2):
=20=20oeqa/utils/decorators: Append the testname without the full path
=20=20distrodata: Take account proxies on distrodata tasks

Lucian Musat (7):
=20=20oeqa/decorators: Add timestamp to decorator logs.
=20=20oeqa/parselogs: Updated log parser whitelist.
=20=20oeqa/testimage: Remove absolute path to oeqa from json
=20=20oeqa/decorators: Fixed a problem with decorator logs link.
=20=20oeqa/testimage: Add ability to run single test from suite.
=20=20oeqa/runexported: Fix a problem with ssh_target_log existing in =
folder.
=20=20oeqa/runexported: Replaced optionparser with argparse.

Marek Vasut (1):
=20=20openssl: Add mapping for nios2

Mariano Lopez (3):
=20=20qemurunner: Sanitize output from qemu and qemu pid
=20=20oetest: Change logic of a failed test
=20=20testimage: Added IO commands to dumps

Markus Lehtonen (13):
=20=20rpm: search for gpg if gpg2 is not found
=20=20recipeutils: implement get_recipe_local_files()
=20=20oe.patch.GitApplyTree: add paths argument to extractPatches
=20=20oe-selftest: devtool: add setup() method
=20=20oe-selftest: devtool: add method for checking srctree repo
=20=20oe-selftest: devtool: add method for checking repo status
=20=20devtool: update-recipe: add new patches in correct order
=20=20devtool: update_recipe: refactor patch generation
=20=20devtool: file mover function that creates target dir
=20=20devtool: better support for local source files
=20=20devtool: modify: make bitbake use local files from srctree
=20=20devtool: update-recipe: enable var history tracking
=20=20devtool: modify: use correct local files directory name

Martin Jansa (1):
=20=20fontcache: allow to pass extra parameters and environment to fc-cache

Maxin B. John (2):
=20=20runqemu-export-rootfs: update location of unfsd binary
=20=20openssl: fix ptest failures

Otavio Salvador (1):
=20=20glibc/mmc-utils: Rename 'BRANCH' variable to 'SRCBRANCH' for clearness

Pascal Bach (1):
=20=20runqemu: don't complain about conflicting machines if they are equal

Patrick Ohly (2):
=20=20systemd: apply persistent storage udev rules also for /dev/hd*
=20=20image types: add hdddirect

Peter Seebach (1):
=20=20cross-canadian.bbclass: big-endian ARM is also gnueabi.

Randy Witt (1):
=20=20runqemu-internal: Make sure two serial ports always exist

Richard Purdie (30):
=20=20qemurunner: Handle qemu start failure correctly
=20=20gdk-pixbuf: Only apply native cleaning in normal task, not setscene
=20=20oeqa/sdk/gcc: Fix makefile test
=20=20multilib: Add TARGET_VENDOR to saved variables list
=20=20classes/meta: Add DISTRO_FEATURES check for gtk+/gtk3+
=20=20populate_sdk_base: Simplify postprocess commands
=20=20toolchain-shar-extract: Correct environment-setup script names for =
multilib
=20=20lib/oe/package_manager: Handle empty package list in opkg case
=20=20gcc-multilib-config: Ensure SDK_ARCH doesn't change target sigs
=20=20multilib.conf: Ensure MACHINE doesn't change target sigs
=20=20oeqa/selftest/sstatetests: Add check for same sigs for SDKMACHINE
=20=20meta-selftest: Add qemux86copy machine
=20=20oeqa/selftest/sstatetests: Add test that MACHINE doesn't change =
target sigs
=20=20lib/oe/sstate: Add tasks_resolved handler for virtual/xxx mappings
=20=20multilib_global: Add handling of SIGGEN variables for multilib
=20=20layer.conf: Improve siggen exclusion to handle virtual/libc
=20=20layer.conf: Add SIGGEN exclusion for oprofile kernel dependency
=20=20deploy: Mark deploy tasks as MACHINE specific
=20=20bitbake.conf: Exclude sstate-outputdirs flag from checksums
=20=20gstreamer-omx: Improve variable expansion of ${S}
=20=20distutils3: Avoid MACHINE specific checksums
=20=20adt-installer: No need to mark as nostamp
=20=20meta-ide-support: No need to mark as nostamp anymore
=20=20lttng-tools: Drop KERNELDIR reference
=20=20oeqa/selftest/wic: Use SetupLocal instead of Setup
=20=20qemu: Drop BROKEN usage
=20=20build-appliance-image: Update to jethro head revision
=20=20build-appliance-image: Update to jethro head revision
=20=20build-appliance-image: Update to jethro head revision
=20=20build-appliance-image: Update to jethro head revision

Robert Yang (4):
=20=20toolchain-shar-relocate.sh: make it faster
=20=20python-async: inherit setuptools
=20=20meta: fix build with gettext 0.16.1
=20=20smart:cache.py: getPackages() matches name + arch

Ross Burton (4):
=20=20packagegroup-core-standalone-sdk-target: ensure libatomic is in SDK
=20=20sstate: run recipe-provided hooks outside of ${B}
=20=20byacc: add missing patch header
=20=20systemd: remove glib-2.0 build dependency

Saul Wold (1):
=20=20linux-yocto-custom: Update for newer kernel

Wenzong Fan (4):
=20=20curl: cleanup buildpaths from curl-config
=20=20apr: cleanup buildpaths from target stuffs
=20=20apr-utils: cleanup buildpaths for target stuffs
=20=20gnome-doc-utils: xslt - don't install Makefiles

Yuanjie Huang (1):
=20=20gcc-multilib-config: Expand ccargs variable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Max Krummenacher (1):
=20=20angstrom-feed-configs.bb: don't replace opkg-collateral

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (1):
=20=20branding-core: re-enable AUTOREV after the release

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

Otavio Salvador (6):
=20=20mxs-base.inc: Consolidate IMAGE_FSTYPES definition
=20=20imx-base.inc, mxs-base.inc: Stop generating tar.bz2 image tarball by =
default
=20=20imx-base.inc, mxs-base.inc: Change default image to sdcard.gz
=20=20imx-base.inc, mxs-base.inc: Use ext4 filesystem for images as default
=20=20Move mxs-base.inc contents to imx-base.inc
=20=20imx-base.inc: Drop explicit 'ext4' filesystem from IMAGE_FSTYPES

Schrempf Frieder (1):
=20=20image_types_fsl.bbclass: make mkfs.vfat use FAT32 in all cases

Yuqing Zhu (2):
=20=20gstreamer1.0-plugins-bad: Install head file of gstaggregator and =
gstvideoagg
=20=20gst1.0-fsl-plugin: Upgrade to version 4.0.7

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Otavio Salvador (2):
=20=20Revert "linux-firmware: add bbappend to modify firmware file names"
=20=20Stop using mxs-base.inc

Stefan Agner (2):
=20=20u-boot-toradex: update to Toradex V2.5 Beta 1 release
=20=20linux-toradex: update kernel to Linux 4.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (3):
=20=20linux-mainline: update to 3.14.53
=20=20linux-mainline: add world-saving google tcp patches
=20=20u-boot-overo: fix build with gcc 5.2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Saul Wold (4):
=20=20linux-yocto: Update to 4.1.8 and include braswell patches
=20=20linux-yocto-rt: Add preempt-rt kernel 4.1.8 version
=20=20intel-quark-common: Add no-asm config to openssl
=20=20linux-yocto/4.1: drm/i915 backports

WU CHIA CHUAN (1):
=20=20meta-intel: meta-romley BSP retirement from YP 2.0

Wu Chia Chuan (3):
=20=20meta-crystalforest: relocate meta-crystalforest layer into meta-isg =
layer
=20=20meta-crystalforest: update the PREFERRED_VERSION of linux-yocto-3.14 =
to 4.1
=20=20meta-mohonpeak: update the PREFERRED_VERSION of linux-yocto-3.14 to =
4.1

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

Alex J Lennon (2):
=20=20gtk-sharp3: add support for gtk-sharp 2.99.3 beta bindings for gtk 3.x
=20=20gtk-sharp3: add support for gtk-sharp 2.99.4 beta bindings for gtk 3.x

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

Richard Purdie (1):
=20=20qt3: Add REQUIRED_DISTRO_FEATURES as layer is x11 specific

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

Martin Jansa (5):
=20=20meta-shr(-distro): packagegroup-shr-feed: drop midori and its bbappend
=20=20linux-lg-mako: bump SRCREV to fix build with gcc-5
=20=20systemd-compat-units: provide initscripts

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Kevin Hao (1):
=20=20meta-yocto-bsp: bump to linux-yocto 4.1 for the non-x86 BSPs

Leonardo Sandoval (5):
=20=20scripts/yocto-bsp: Exit successfully when asking for help
=20=20scrips/lib/bsp/engine: List properties to stdout when output =
parameter is om
=20=20yocto-bsp: Update templates to 4.1 kernel
=20=20scripts/lib/bsp/engine: Indent the karch properties when stored into =
a file
=20=20lib/oeqa/selftest/yoctobsp: Basic tests for yocto-bsp script

Michael Wood (1):
=20=20toaster: Special case the openembedded-core layer to avoid duplicates

Richard Purdie (1):
=20=20poky.conf: Bump version for 2.0 jethro release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



