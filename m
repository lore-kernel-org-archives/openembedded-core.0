Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5807736C;
	Tue, 23 Feb 2016 20:41:41 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id b67so146642140qgb.1;
	Tue, 23 Feb 2016 12:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=xP9F5D4u6kUpi79G3LA+6HgFJizmLJSRwjhFQyoL+kI=;
	b=s3gMUhq2oHwt4sjWrfEAcuL1W7CAPAxEBTI8NOHpxAwwSiJecW4ohEmWDO1iG3VpVF
	xVlHG+xE/YTofcMWkDI+OZSPCuYXvksvQipsZ6QWWuM9rrGqIZCJOWwjRJJFJffndY2S
	Xs/qbJsqAZDSRVo4A2u/PEpmrkDL9Jrjq29AIApaz7qgsWdLhmF76ghPQlQUMeIuxmnU
	kJ9Jo61n33/qllZiyVBk9vtz6AHJiQr+JU1LlCooDig8nVKvX4nSrVe/NbhBFODpxVVM
	5nzKq3IpR5jNZ7zLHP5maPWuw8vCzlLl38Z04D1KIL4lNYer52tvAUP1Lu5knBIjKfS0
	kyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:mime-version:message-id:from:to:subject
	:content-type:content-transfer-encoding;
	bh=xP9F5D4u6kUpi79G3LA+6HgFJizmLJSRwjhFQyoL+kI=;
	b=mP7yIXXDJBNjqKLjNly/7dTJGV114MOmsnxk9NRKyvnOdFN0D0LVJxZlhjOU3lHBgd
	XMwhEu2MGbTWl5O355o7fB//1DMs1kRcL9r3iZ977i2vdp4969vxD4wdLqyIn4uA3z6G
	XN2jQOKBwecXXhvAaAHHgYhD1BcBpEchYKoJvvR2hbapXPQ8wwMAWnn9myXqdNUA+t4U
	uhBbdGVQeWUsR18tvJrTdjqPHhtsglpDnfRcTP7X4fNh7QrcjP4kbyIOnTIvdiMa+59r
	OCtd68bxPcffvz6TB20sTEE6bAS/MT/uNY0TEMCO9C8y4lwwYWEE3a+pXEcU9rt3PLhz
	Cy5w==
X-Gm-Message-State: AG10YOTB2C7jZwoYxL383ERyDBX6HyJ0eTckkS7oqnZOB+mBzGXGjjeTz8zxSr2u5zLQtg==
X-Received: by 10.140.236.68 with SMTP id h65mr46973725qhc.13.1456260102384;
	Tue, 23 Feb 2016 12:41:42 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	b111sm9120904qge.47.2016.02.23.12.41.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Feb 2016 12:41:40 -0800 (PST)
Date: Tue, 23 Feb 2016 12:41:40 -0800 (PST)
X-Google-Original-Date: Tue, 23 Feb 2016 20:41:38 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1456260098878.07ae6602@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2016-02-14 until 2016-02-21
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
X-List-Received-Date: Tue, 23 Feb 2016 20:41:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2016-02-14 until 2016-02-21.  Projects included in this =
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

Christopher Larson (2):
=20=20Move bb.{debug,note,..} into their own logging domain
=20=20bb.ui.knotty: prefix task messages with recipe/task

Markus Lehtonen (6):
=20=20bb/cache: drop some unused arguments
=20=20SignatureGenerator: add method for saving the file checksum cache
=20=20bb/runqueue: save task file dependency cache onto disk
=20=20FileChecksumCache: add get_checksums() method
=20=20MultiProcessCache: make cache filename configurable
=20=20SignatureGeneratorBasic: make checksum cache file configurable

Michael Wood (5):
=20=20toaster: orm migrations Sort out migrations mess
=20=20toaster: SoftwareRecipesTable apply default order_by
=20=20toaster: toastergui unit tests convert to use fixtures
=20=20toaster: PackagesTable show only installed packages
=20=20toaster: toastergui Fix invalid char test and implementation

Mirela Rabulea (1):
=20=20Allow Hob to run images on a custom simulator, other than qemu

Richard Purdie (5):
=20=20cooker: Improve cache handling
=20=20taskdata: Fix traceback issue with missing provider
=20=20knotty: Set exit failure code on runQueueTaskFailed events
=20=20data_smart: Drop default expand=3DFalse to getVar [API change]
=20=20data_smart: Drop default expand=3DFalse to getVarFlag [API change]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andre McCurdy (7):
=20=20musl: Upgrade to tip of tree
=20=20libgcrypt: update 1.6.4 -> 1.6.5
=20=20sqlite3: update 3.10.2 -> 3.11.0
=20=20curl: re-enable proxy support by default
=20=20libsoup-2.4: minor formatting improvements
=20=20libsoup-2.4: prevent PACKAGECONFIG dependant package renaming
=20=20libsoup-2.4: disable libsoup-gnome by default

Andreas M=C3=BCller (1):
=20=20libsdl2: update to 2.0.4

Armin Kuster (5):
=20=20glibc: CVE-2015-8777.patch
=20=20glibc: CVE-2015-8779
=20=20glibc: CVE-2015-9761
=20=20glibc: CVE-2015-8776
=20=20glibc: Security fix CVE-2015-7547

Benjamin Esquivel (1):
=20=20runtime/systemd: Fix for boot time string parse error

Bruce Ashfield (1):
=20=20linux-yocto/4.1: capabilities backports

Chen Qi (7):
=20=20coreutils: fix problem with acl for 6.9 version
=20=20image/populate_sdk: seprate variables to fix dependency
=20=20grep: upgrade to 2.23
=20=20diffstat: upgrade to 1.61
=20=20findutils: upgrade to 4.5.19
=20=20coreutils: upgrade to 8.25
=20=20cups: upgrade to 2.1.3

Christopher Larson (1):
=20=20rng-tools: fix the build with musl

Daniel Istrate (1):
=20=20oeqa/selftest/bbtests: Test bitbake --setscene-only option

Ed Bartosh (14):
=20=20runqemu: add support for wic images
=20=20runqemu: don't set KERNEL for wic images
=20=20runqemu: support path/to/<image>-<machine>.wic
=20=20oe-selftest: remove unused parameter
=20=20qemurunner: add parameter to method 'start'
=20=20oeqa/targetcontrol: make ssh control optional
=20=20oeqa/targetcontrol: support wic image type
=20=20wic-image-minimal: change IMAGE_FSTYPES
=20=20wic-image-minimal: update .wks to boot by qemu
=20=20oe-selftest: add new wic testcase
=20=20wic: fix processing of --use-uuid
=20=20wic-image-minimal: use uuid for root partition
=20=20oe-selftest: pylinted wic tests
=20=20oe-selftest: don't use specific tasks

Erkka K=C3=A4=C3=A4ri=C3=A4 (1):
=20=20uboot-inc: Backport patch to fix Beaglebone Black bootloader

Fabio Berton (1):
=20=20waf.bbclass: Remove --disable-static from EXTRA_OECONF

Hongxu Jia (2):
=20=20bitbake.conf: use target path as compile dir in debugging info
=20=20gcc-4.9/5.3: Ignore -fdebug-prefix-map in producer string

Ioan-Adrian Ratiu (1):
=20=20ruby: break out ri-docs and rdoc into separate packages

Jan Sarenik (1):
=20=20scripts/sstate-cache-management.sh: Change wording

Jun Zhang (1):
=20=20toolchain-scripts.bbclass: add three other path to PATH in env.sh

Khem Raj (11):
=20=20rpm: Fix build with musl
=20=20valgrind: Fix build with musl
=20=20binutils: Use tip of 2.26 branch
=20=20security_flags: Add SECURITY_CFLAGS to TARGET_CC_ARCH for binutils
=20=20libunwind: Fix build on ppc
=20=20binutils: Fix useless rpaths QA warning
=20=20socat: Fix build with musl
=20=20musl: Upgrade to 1.1.13+
=20=20glibc: Upgrade to 2.23
=20=20pseudo: Fix build when security flags are enabled
=20=20libnewt: Fix build with PIE flags

Maciej Borzecki (1):
=20=20dbus-glib: 0.104 -> 0.106

Marek Vasut (2):
=20=20gcc: Backport nios2 r31 fix
=20=20dpkg: Update to 1.18.4

Markus Lehtonen (7):
=20=20nss: define RPATH variable for nss-native
=20=20cml1.bbclass: fix do_menuconfig
=20=20oe/gpg_sign: add verify() method
=20=20oe/gpg_sign: add 'armor' argument to detach_sign()
=20=20sign_rpm.bbclass: do not store key details in signer instance
=20=20oe/gpg_sign: add 'passphrase' argument to detach_sign method
=20=20sstate.bbclass: use oe.gpg_sign for gpg signing

Martin Jansa (1):
=20=20gcc-5.3: backport fix for PR-target-65358

Maxin B. John (3):
=20=20busybox: Add musl config for _git recipe
=20=20busybox: drop patches that are not valid anymore
=20=20avahi: update to version 0.6.32

Mike Crowe (1):
=20=20bitbake.conf: Remove unhelpful default value for EXTRA_OEMAKE

Ming Liu (1):
=20=20sstate: Add ca-certificates-native to postinst recipes list

Patrick Ohly (1):
=20=20buildhistory.bbclass: remove out-dated information on request

Paul Eggleton (16):
=20=20classes/buildhistory: fix for python function parsing change
=20=20devtool: minor fix for error message
=20=20devtool / recipetool: use common code for launching editor
=20=20devtool: reset: fix preserving patches/other files next to recipes
=20=20devtool: update-recipe: don't show workspace recipe warning if no =
update
=20=20devtool: categorise and order subcommands in help output
=20=20scripts/lib/argparse_oe: tweak title above options
=20=20devtool: (un)deploy-target: add help descriptions
=20=20devtool: sdk-update: tweak command-line handling of updateserver
=20=20devtool: deploy-target: write deployed files list to target
=20=20devtool: undeploy-target: support undeploying all recipes
=20=20devtool: deploy-target: preserve existing files
=20=20devtool: modify: tweak help description for behaviour change
=20=20recipetool: create: add additional extension mechanisms
=20=20recipetool: create: improve CMake package mapping
=20=20classes/populate_sdk_ext: add a better config extension mechanism

Philip Balister (1):
=20=20cmake: Update to 3.4.3.

Randy Witt (3):
=20=20populate_sdk_ext: Don't ignore SDK_TARGETS value
=20=20devtool: Don't recursively look for .devtoolbase in --basepath
=20=20populate_sdk_ext.bbclass: Add SDK_RECRDEP_TASKS variable

Richard Purdie (21):
=20=20linux-yocto: Work around PAT issue on qemux86
=20=20insane: Add --disable-static to UNKNOWN_CONFIGURE_WHITELIST
=20=20gdb: Rationalise PACKAGECONFIG
=20=20e2fsprogs: Update to upstream version of a patch
=20=20gdb-cross-canadian: Add missing virtual/* DEPENDS
=20=20gstreamer1.0-meta-base: Mark as machine specific due to =
COMBINED_FEATURES
=20=20conf/distro/include: Add no-static-libs.inc
=20=20ed_0.5: Handle --disable-static option
=20=20libpng12: Handle no static libs
=20=20oeqa: Update to handle domain specific references in build logs
=20=20layer.conf: Add gstreamer1.0-meta-base to =
SIGGEN_EXCLUDERECIPES_ABISAFE
=20=20rng-tools: Fix underquoted m4 and libgcrypt floating dependency
=20=20oeqa/parselogs: Whitelist dmi firmware failure message in 4.4 kernels
=20=20debianutils: Fix SRC_URI to use debian snapshot
=20=20debianutils: Upgrade 4.5.1 -> 4.7
=20=20pcmciautils: Update SRC_URI
=20=20libsdl2: Fix build with static libraries disabled
=20=20no-static-libs.inc: Add libcap-native
=20=20libtool: Don't hardcode grep paths
=20=20epiphany: Add libxml2-native to DEPENDS
=20=20cml1/sstate: Fix missing getVar parameter

Richard Tollerton (1):
=20=20Revert "lsbinitscripts: fix the path for mountpoint"

Robert Yang (5):
=20=20insane.bbclass: print more info for build-deps and file-rdeps
=20=20image.bbclass: fix circular dependency when IMAGE_FSTYPES append =
hddimg
=20=20recipe_sanity.bbclass: skip DataSmart in recipe_sanity_eh()
=20=20terminal.bbclass: import oe.terminal for oe.terminal.prioritized()
=20=20staging.bbclass: remove trail slash from SYSROOT_DESTDIR

Ross Burton (12):
=20=20apmd: fix build with static libraries disabled
=20=20conf/no-static-libs: add explicit rule for libical
=20=20lib/oe/qa: ELFFile: check that a path is a file before opening it
=20=20lib/qa.py: raise ValueError if file isn't an ELF
=20=20dbus: update large file patch
=20=20glew: don't put our CFLAGS into the pkgconfig file
=20=20cmake: don't inherit autotools
=20=20insane: wrap autotools checks in inherits_class(autotools) checks
=20=20glew: rewrite to use upstream build system
=20=20glew: upgrade to 1.13.0.
=20=20freetype: use autotools instead of a manual do_configure
=20=20no-static-libs: remove eglinfo

Saul Wold (2):
=20=20rng-tools: Import recipe from meta-openembedded
=20=20qemu.inc: Add rng-tools to qemu images

Tanu Kaskinen (4):
=20=20alsa-tools: 1.0.29 -> 1.1.0
=20=20alsa-utils: 1.0.29 -> 1.1.0
=20=20alsa-plugins: 1.0.29 -> 1.1.0
=20=20pulseaudio: 6.0 -> 8.0

Ulrich =C3=96lmann (1):
=20=20nfs-utils: bugfix: adjust name of statd service unit

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andre McCurdy (1):
=20=20gst-plugins-base: add perl runtime dependency to gst-plugins-base-apps

Andreas M=C3=BCller (5):
=20=20xfce4-calculator-plugin: initial add 0.5.1
=20=20packagegroup-xfce-extended: add xfce4-calculator-plugin
=20=20hunspell: initial add 1.3.3
=20=20abiword: update to 3.0.1
=20=20abiword: make build deterministic for meta-office [1] in layers

Armin Kuster (1):
=20=20python-django: update package to 1.8.9

Fabio Berton (1):
=20=20python-daemonize: Update to version 2.4.2

George McCollister (3):
=20=20bash-completion: move to oe-core
=20=20dracut: use bash-completion.bbclass
=20=20networkmanager: use bash-completion.bbclass

Ioan-Adrian Ratiu (4):
=20=20start-stop-daemon: Upgrade 1.16.0.2 -> 1.17.25
=20=20openldap: enable native build
=20=20apache2: add openldap support to PACKAGECONFIG
=20=20xterm: make xft PACKAGECONFIG depend on freetype-native

Manuel Bachmann (2):
=20=20gupnp: Update to 0.20.14
=20=20rygel: Update to 0.28.2

Martin Jansa (3):
=20=20vboxguestdrivers: upgrade to 4.3.36
=20=20python-gdata: RDepend on python-xml instead of python-elementtree
=20=20avahi: rename the bbappend to apply for all versions

Mike Crowe (9):
=20=20pngcheck: Explicitly set EXTRA_OEMAKE as required
=20=20mg: Explicitly set EXTRA_OEMAKE as required
=20=20iptraf: Explicitly set EXTRA_OEMAKE as required
=20=20serialcheck: Explicitly set EXTRA_OEMAKE as required
=20=20yavta: Explicitly set EXTRA_OEMAKE as required
=20=20rarpd: Explicitly set EXTRA_OEMAKE as required
=20=20ckermit: Explicitly set EXTRA_OEMAKE as required
=20=20nbench-byte: Explicitly set EXTRA_OEMAKE as required
=20=20libebml: Explicitly set EXTRA_OEMAKE as required

Pascal Bach (2):
=20=20nginx: make nginx user and home directory configurable
=20=20nginx: update to 1.9.10

Paul Vaduva (1):
=20=20lua: Added ptest for lua

Philip Balister (1):
=20=20python-vcversioner: Fix bad DESCRIPTION and HOMEPAGE entries.

Ross Burton (2):
=20=20gtk-theme-torturer: add
=20=20gnome-mime-data: add (from oe-core)

Sven Ebenfeld (1):
=20=20mongodb: 2.6.0 -> 3.3.0 and remove from pnblacklist

Trevor Woerner (1):
=20=20nodejs: upgrade from 4.2.4 to 4.2.6

Tudor Florea (2):
=20=20rsyslog: avoid deprecated GnuTLS functions
=20=20rsyslog: add tls related tests

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (1):
=20=20upload-packages: ensure ${WORKDIR} exists to stop upsetting bitbake

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Anand Balagopalakrishnan (2):
=20=20ti-tisdk-makefile: update omapdrm fragment for DDK v1.14
=20=20branding-core.inc: re-enable "sgx" after DDK 1.14 is published

Denys Dmytriyenko (4):
=20=20dropbear: overlay 2015.71 from oe-core/master
=20=20dropbear: update list of TSU exempt versions
=20=20arago.conf: allow easily selecting systest kernel variant
=20=20conf: generate source package for systest kernel

Jacob Stiffler (5):
=20=20packagegroup-arago-tisdk-addons: Add ${PN}-extra package
=20=20tisdk-rootfs-image: Add addons-extra packagegroup
=20=20tisdk-server-rootfs-image: Remove test-addons packagegroup
=20=20tisdk-server-extra-rootfs-image: Create new server rootfs image
=20=20arago-core-tisdk-image: Add tisdk-server-extra rootfs to keystone =
TARGET_IMA

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Richard Purdie (1):
=20=20classes/u-boot: Update getVar syntax

Ting Liu (1):
=20=20openssl: Explicitly set EXTRA_OEMAKE as required

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

Alejandro Hernandez (1):
=20=20gma500_gfx: Avoid inserting gma500_gfx module for certain devices

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

Alex J Lennon (1):
=20=20README: Update testing on PPC (qemu) with Poky/Jethro

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (1):
=20=202016-02-16, Version 4.3.1 'Argon' (LTS)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Martin Jansa (10):
=20=20qmake5_base: delete *.la files
=20=20qt5: upgrade to latest revisions in 5.6 branch (5.6 RC)
=20=20qtbase: Fix WORKDIR references in pkg-config files
=20=20qtbase: Resolve QA warning about /bin/bash dependency
=20=20qtbase: Don't install libQt* files twice
=20=20examples: fix few thousands host-user-contaminated QA warnings
=20=20qtwebkit: Fix QA Warning
=20=20qtwebengine: Fix QA warning
=20=20qtwebengine: Hide textrel QA warning until there is proper fix for it
=20=20qttransltations: Add PACKAGE for qtwebengine and qtquickcontrols2

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

Anand Balagopalakrishnan (3):
=20=20omapdrm_pvr: SGX kernel mode driver v1.14 for all TI SoCs
=20=20omap5-sgx-ddk-um-linux: SGX user mode driver v1.14 for all TI SoCs
=20=20omap5-sgx-ddk-um-linux: bump SRCREV for gl2ext header change

Denys Dmytriyenko (5):
=20=20linux-ti-staging: update with latest fixes
=20=20omap5-evm: increase max_leb_cnt
=20=20linux-ti-staging: update to 4.1.18 and latest fixes
=20=20u-boot-ti-staging: update with latest merges, including HS support
=20=20conf/machine: add initial configs for HS platforms

Jacob Stiffler (2):
=20=20omap5-sgx-ddk-um-linux: Specify COMPATIBLE_MACHINE list
=20=20ti-ipc: Extract SRC info into unique variables

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Alejandro Hernandez (1):
=20=20gma500-gfx-check: Fixes infinite calling to modprobe gma500_gfx

Jesse Zhang (1):
=20=20local.conf.sample: use ?=3D to assign BB_ENV_EXTRAWHITE variables

Mark Hatle (1):
=20=20lib/oe/image.py: Add image generation for companion debug filesystem

Randy MacLeod (1):
=20=20Remove obsolete references to exmap

Richard Purdie (1):
=20=20poky: Disable static libs by default

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



