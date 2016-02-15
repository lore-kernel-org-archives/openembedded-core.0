Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1F74E6011C;
	Mon, 15 Feb 2016 21:20:20 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id y89so119675377qge.2;
	Mon, 15 Feb 2016 13:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=tFDOOr4+KwM1f5U0Xv2HtAp0K/KEOOkhupdyTATDcYU=;
	b=tULHIEQv7UWxwvZOMHYs45UNvX+9rHRuu7OTBGpyPxBl9d37xIiR5Cm/s7FUg5owdY
	WM+lNyMaZ7FfcipGWt5p4Pd7K7dwKQK5yMg9ZcgR1mjhyOn0xv4jo4je2z0HLDgGThXB
	mfC1/SUyu8/29ptRhQ02AA75pLrDqXZJUnz0jMJ3452vK7Az6sTRErNZd2O1j2gAbXPX
	XdRDxWIxmIrc9LL9mFZcl2cQc3JpKp2F3fqrxfqLGN8QXpifJuT+wpY7kIALGJypaFrJ
	p9IoaxKmJEjDemvHZOrM3ylttEzwlekYVMHuW1skOBWF4cRhgk0KOjJecVFTK6/3B8op
	VxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:mime-version:message-id:from:to:subject
	:content-type:content-transfer-encoding;
	bh=tFDOOr4+KwM1f5U0Xv2HtAp0K/KEOOkhupdyTATDcYU=;
	b=e5QFqCrcrY6i1svcGHawgThYBZEG52a2g6e+pwkqDydAF8gkdJDWxnxzK+O/9su7pt
	cjlCiwVfbYOmWUV9t2/ar9btddOq1K6OBrTgkUwGzbnks+qlI2YxSY7SS940hLwZixBX
	Otm78fRMLk+9fb5AJ6Kfh6PA0GLJFOAhZ1eRbgcYPmePPTW4tKmBsa9tWqga29VAAwqY
	0qVKVM0oEQU2ns/XAgm+gpTDad2sykDMj+tF1FbjNymjs6AgmggJ+KFlWcl/kXS1AJyt
	1Gd6IeZ0zj0lxUqHljrcCiZqeL8xIl9OjNuC/FIjeQUFhyCVBF8r1TTfDzQe5mEAa2o+
	mtEg==
X-Gm-Message-State: AG10YOSnCCiGF423ZJNnZkxeNcgnEq5Vgai4YRnl9A4JEqLC3xNXkaXY/VQhxq2fuA2iIA==
X-Received: by 10.140.20.39 with SMTP id 36mr22740861qgi.15.1455571221341;
	Mon, 15 Feb 2016 13:20:21 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	z124sm954138qhz.46.2016.02.15.13.20.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 15 Feb 2016 13:20:19 -0800 (PST)
Date: Mon, 15 Feb 2016 13:20:19 -0800 (PST)
X-Google-Original-Date: Mon, 15 Feb 2016 21:20:17 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1455571217372.f4f01d67@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2016-02-07 until 2016-02-14
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
X-List-Received-Date: Mon, 15 Feb 2016 21:20:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2016-02-07 until 2016-02-14.  Projects included in this =
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

An=C3=ADbal Lim=C3=B3n (1):
=20=20bb/fetch2: Move export_proxies function from wget to utils.

Belen Barros Pena (2):
=20=20toaster: templates make build data breadcrumb consistent
=20=20toaster: build section Improve display of builds when > 1 targets

Ed Bartosh (1):
=20=20cooker: gracefully shutdown parsers

Elliot Smith (7):
=20=20toaster: add merge migration to resolve conflict
=20=20toaster: update customimagerecipe migration
=20=20toaster: move recent builds query to model
=20=20toaster: update custom image package table filters
=20=20toaster: include locale and packagegroup packages in custom image
=20=20toaster: make locale packages uneditable in custom image page
=20=20buildinfohelper: unset brbe variable when build finishes

Michael Wood (56):
=20=20toaster: localhostbecontroller CustomRecipe now base_recipe is Recipe
=20=20toaster: models fall back to a sensible string for no vcs reference
=20=20toaster: ToasterTables simplify filter function move common part to =
widget
=20=20toaster: tablejs Add an event handler to manually trigger a data =
reload
=20=20toaster: orm Add sum of dependencies size function to =
PackageDependencyManag
=20=20toaster: orm make CustomImageRecipe inherit from Recipe
=20=20toaster: orm: Add db migration for new CustomImageRecipe inheritance =
change
=20=20toaster: orm Add CustomImagePackage table
=20=20toaster: orm: Add db migration for new CustomImagePackage table
=20=20toaster: buildinfohelper Add the concept of CustomImagePackage
=20=20toaster: orm add CustomImageRecipe generate contents function
=20=20toaster: move CustomImageRecipe generation to API entry point
=20=20toaster: views Add view to download custom recipe
=20=20toaster: tables Add table for Packages and update SelectPackagesTable
=20=20toaster: Continue front end features to custom image recipe page.
=20=20toaster: newcustomimage Move modal dialog out of newcustomimage =
template
=20=20toaster: Add recipe details page
=20=20toaster: toastertable remove title from Show all in table
=20=20toaster: views xhr_customrecipe_packages clean up API
=20=20toaster: toastergui tests Update to reflect changes to =
CustomImageRecipe
=20=20toaster: toastergui tests Add unit test for download custom recipe
=20=20toaster: orm get_project_layer_versions to return layer_version =
objects
=20=20toaster: orm Add convenience method to get all pkgs in a =
CustomImageRecipe
=20=20toaster: libtoaster Add createCustomRecipe method
=20=20toaster: newcustomimage_modal use libtoaster method for new =
CustomRecipe
=20=20toaster: tables add recipe download link to CustomImagesTable
=20=20toaster: tables Change SelectPackagesTable to use ProjectPackage
=20=20toaster: API allow CustomImageRecipe to be updated after creation
=20=20toaster: xhr_customrecipe_id change to use CustomImagePackage
=20=20toaster: xhr_customrecipe_packages add GET info for package response
=20=20toaster: customrecipe Add further front end features using new API
=20=20toaster: toastergui tests Update package test to use =
CustomImagePackage
=20=20toaster: tables SelectPackagesTable rename recipe_id to custrecipeid
=20=20toaster: toastergui tests Add addtional data to the setUp for new =
tables
=20=20toaster: tables Check layer presence in project for customise_btn
=20=20toaster: localhostbectrl Update the dirpath of customrecipe's base =
layer
=20=20toaster: project builds Poll the server to get latest progress for =
build
=20=20toaster: orm generate_recipe_file_contents Handler for require recipe
=20=20toaster: CustomImageRecipe generate overwrite IMAGE_FEATURES
=20=20toaster: tables move template logic into the pkg_add_rm_btn
=20=20toaster: customrecipe Add dependency tracking to package selection
=20=20toaster: models Invalidate ToasterTables cache when a m2m field =
changes
=20=20toaster: views CustomRecipe API add size information to the package =
lists
=20=20toaster: API CustomImageRecipe check the recipe name supplied is valid
=20=20toaster: newcustomimage_modal add frontend name validation
=20=20toaster: buildinfohelper CustomImagePackage update dependency info
=20=20toaster: models add all_depends method for Package_DependencyManager
=20=20toaster: pkg_dependencies_popover just show direct dependencies
=20=20toaster: models add get_last_successful_built_target method
=20=20toaster: orm Add last_updated field to CustomImageRecipe
=20=20toaster: models Add update_package_list for CustomImageRecipe
=20=20toaster: customrecipe page Add last successful build link and =
conditionals
=20=20toaster: orm generate_recipe_content only exclude locale packages
=20=20toaster: xhr_customrecipe_packages Add dependencies to included =
packages
=20=20toaster: Enable Image Customisation feature
=20=20toaster: models Remove manual transaction control from lsupdates

Richard Purdie (8):
=20=20utils: Drop datastore function inspection during exception
=20=20BBHandler/ast: Merge handMethod and handleMethodFlags
=20=20data_smart: Avoid expanding anonymous python functions
=20=20data: Don't expand python functions for variable dependencies
=20=20cooker: Don't expand python functions in variable dumps
=20=20build/data: Don't expand python functions before execution [API =
change]
=20=20build: Improve python execution tracebacks
=20=20Bump version post release to 1.29.0

Schroeder, Henning (1):
=20=20cooker: extended dot styling

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (1):
=20=20python-setuptools: Add python-compile on RDEPENDS

Alexander Kanavin (7):
=20=20ffmpeg: update to 2.8.6
=20=20gstreamer1.0: fix upstream check for unstable versions from git
=20=20bash-completion: fix upstream version check
=20=20iso-codes: update to 3.65
=20=20libwnck3: update to 3.14.1
=20=20webkitgtk: update to 2.10.7
=20=20pixz: fix upstream version check

Andre McCurdy (16):
=20=20strace: build fix for MIPS + musl libc
=20=20gdb: build fix for MIPS + musl libc
=20=20gdb: drop unnecessary CC_FOR_BUILD etc exports
=20=20nettle.inc: drop duplicate LIC_FILES_CHKSUM and SRC_URI hashes
=20=20curl: update 7.47.0 -> 7.47.1
=20=20libproxy: replace PACKAGECONFIG equivalent with the real thing
=20=20libproxy: add PACKAGECONFIG control for gnome3
=20=20curl: drop obsolete pkgconfig_fix.patch
=20=20gstreamer1.0-meta-base: make gstreamer1.0-plugins-base-alsa =
conditional
=20=20alsa-lib: avoid including <sys/poll.h> directly
=20=20db: update HOMEPAGE
=20=20curl: add PACKAGECONFIG options for less common / legacy protocols
=20=20gstreamer1.0-plugins-good_git: fix gst_structure_get() compiler =
warning
=20=20gstreamer1.0-plugins-bad_git: fix gst_structure_get() etc compiler =
warnings
=20=20freetype: minor formatting improvements
=20=20freetype: update 2.6.2 -> 2.6.3

An=C3=ADbal Lim=C3=B3n (24):
=20=20testimage: Modularize helper functions for get test lists.
=20=20classes/testsdk: Add new class testsdk.
=20=20classes/testimage: Add defeault inherit for testsdk.
=20=20populate_sdk_ext: Set TOOLCHAINEXT_OUTPUTNAME.
=20=20get_test_suites: Add sdkext type for load test suites.
=20=20classes/testsdk: Add testsdkext task only install.
=20=20classes/testsdk: Add call to export_proxies on testsdkext.
=20=20toolchain-shar-extract.sh: Add proxy variable to new env.
=20=20testimage/testsdk: Modularize TestContext.
=20=20testimage/testsdk: Move get test suites routine inside TestContext.
=20=20oetest.py/TestContext: Move loadTests and runTests inside it.
=20=20classes/testsdk: Add function run_test_context
=20=20oeqa/oetest: oeSDKTest when run a command redirect env output to null
=20=20classes/testsdk: Add compatibility SDK testsuite to eSDK
=20=20testsdkext: Add skeleton for support Extensible SDK tests.
=20=20classes/populate_sdk_ext: Add SDK_EXT_TARGET_MANIFEST and =
SDK_EXT_HOST_MANIF
=20=20oeqa/oetest: Fix compatibility SDK tests using eSDK.
=20=20oeqa/sdkext: Add devtool basic tests for eSDK.
=20=20oeqa/sdkext/devtool.py: Add location test to ensure that devtool is =
the eSDK
=20=20classes/testsdk: Add help information on how to run tests.
=20=20classes/testimage: Fix exportTests function.
=20=20classes/sanity: check_perl_modules provide output when fail
=20=20classes/testsdk: do_testsdkext avoid STAGING_DIR/BASE_WORKDIR in PATH
=20=20nativesdk-buildtools-perl-dummy.bb: Fix variable expansion in python =
code

Armin Kuster (5):
=20=20glibc-locale: fix QA warning
=20=20qemu: Security fix CVE-2016-1568
=20=20qemu: Security fix CVE-2016-2197
=20=20qemu: Security fix CVE-2016-2198
=20=20libbsd: Security fix and update 0.8.2

Arnold Csorvasi (1):
=20=20image_types_uboot: add cpio.gz.uboot to supported IMAGE_TYPES

Bruce Ashfield (3):
=20=20linux-yocto/4.4: update to v4.4.1
=20=20linux-yocto/4.1: update to v4.1.17
=20=20linux-yocto/4.1: galileo backports and support

Christopher Larson (1):
=20=20recipetool.newappend: add -e/--edit argument

Ed Bartosh (1):
=20=20oeqa: setup bitbake logger after tinfoil.shutdown

Jens Rehsack (2):
=20=20initscripts: populate-volatiles.sh: add mount-bind feature
=20=20initscripts: start urandom after populate-volatiles

Jussi Kukkonen (6):
=20=20systemd: Don't depend on gcrypt unnecessarily
=20=20wpa-supplicant: Only depend on libgcrypt when needed
=20=20libsoup-2.4: Remove unnecessary gnutls dependency
=20=20xserver-xorg: Add PACKAGECONFIG for crypto libraries
=20=20openssh: Fix regex that sets sftp-server path for tests
=20=20openssh: Properly skip ptrace test if tools are missing

Khem Raj (3):
=20=20musl: Upgrade to tip of tree
=20=20uclibc-ng: Bump up to 1.0.12 release
=20=20ltp: Upgrade to 20160126 and fix build on musl

Maciej Borzecki (7):
=20=20systemd: move bash completion into separate package
=20=20systemd: realign packages list
=20=20classes/useradd: handle whitespace only USERADD/GROUPADD/GROUPMEMS
=20=20systemd: move some tools into systemd-extra-utils package
=20=20systemd: rename systemd-zsh to systemd-zsh-completion
=20=20systemd: extend PACKAGECONFIG flags
=20=20systemd: tighten timesyncd and journal-gateway user accounts

Marek Vasut (6):
=20=20binutils: Repair nios2 PLT and GP handling
=20=20guile: Fix nios2 support
=20=20nspr: Add nios2 support
=20=20oprofile: Add nios2 support
=20=20strace: Fix build for arc, metag, nios2, or1k, tile
=20=20liburcu: Add nios2 support

Mark O'Donovan (1):
=20=20udhcpc: specify full path for ip command calls

Markus Lehtonen (2):
=20=20oe/gpg_sign: fix incorrect variable name
=20=20sign_package_feed.bbclass: fix task dependencies

Maxin B. John (5):
=20=20quota: update to version 4.03
=20=20iproute2: update to version 4.4.0
=20=20iproute2: update to version 4.4.0
=20=20mdadm: update to version 3.4
=20=20mmc-utils: upgrade to latest git version

Mike Crowe (13):
=20=20perl: Explicitly set EXTRA_OEMAKE as required
=20=20apmd: Explicitly set EXTRA_OEMAKE as required
=20=20libacpi: Explicitly set EXTRA_OEMAKE as required
=20=20dmidecode: Explicitly set EXTRA_OEMAKE as required
=20=20gptfdisk: Explicitly set EXTRA_OEMAKE as required
=20=20ed: Explicitly set EXTRA_OEMAKE as required
=20=20iputils: Explicitly set EXTRA_OEMAKE as required
=20=20pigz: Explicitly set EXTRA_OEMAKE as required
=20=20stat: Explicitly set EXTRA_OEMAKE as required
=20=20sysklogd: Explicitly set EXTRA_OEMAKE as required
=20=20unzip: Explicitly set EXTRA_OEMAKE as required
=20=20ptest-runner: Explicitly set EXTRA_OEMAKE as required
=20=20hdparm: Explicitly set EXTRA_OEMAKE as required

Nathan Rossi (1):
=20=20insane.bbclass: Support MicroBlaze with musl

Nicolas Dechesne (1):
=20=20mesa: upgrade 10.6.3 -> 11.1.1

Pascal Bach (1):
=20=20lib/oe/terminal: set workdir for konsole terminal

Patrick Ohly (3):
=20=20meta/conf/layer.conf: adapt to more flexible initramfs-framework =
RDEPENDS
=20=20uninative.bbclass: capture stdout/err from patchelf-uninative
=20=20base.bbclass: fix support for gitsm://

Paul Eggleton (11):
=20=20classes/externalsrc: disable rm_work when active
=20=20classes/externalsrc: create symlinks for workdir and logs
=20=20devtool: commit for extra tasks that modify source when extracting
=20=20recipetool: create: support cmake find_library directive
=20=20recipetool: create: determine name/version from github/bitbucket URLs
=20=20devtool: modify: make -x the default behaviour
=20=20devtool: add: fix adding from a local source directory
=20=20recipetool: create: ensure URL parameters don't make it into the name
=20=20recipetool: create: convert http git URLs that don't end in .git but =
contain
=20=20recipetool: create: set S when we set SRC_URI from local git repo
=20=20oe-selftest: devtool: add another devtool add test

Peter Seebach (1):
=20=20pseudo: uprev to 1.7.5

Randy MacLeod (2):
=20=20Remove obsolete references to exmap
=20=20buildstats.bbclass: remove dead URL from comment

Richard Purdie (14):
=20=20bitbake.conf/base: Improve handling of SRCPV
=20=20base: Make do_cleansstate nostamp
=20=20package_deb: Ensure allarch deb packages aren't target specific
=20=20sstate: Ensure populate_lic sstate objects are cleaned
=20=20oeqa: Improve test failure messages
=20=20oeqa/prservice: Fix whitespace problem
=20=20cdrtools-native: Explicitly set EXTRA_OEMAKE as required
=20=20e2fsprogs: Fix multiple xattr handling
=20=20sanity: Bump minimum version to 1.29.0
=20=20scripts/runqemu-internal: Work around qemux86 PAT bugs in linux 4.4.1
=20=20autotools: Correct dependency search logic error
=20=20autotools: Fix interaction with bitbake -b
=20=20debian: Fix superfluous setting for RPROVIDES
=20=20buildhistory: Fix regex to handle versions without spaces

Ross Burton (9):
=20=20uclibc: fetch from master branch not 1.0
=20=20piglit: add missing dependency on python-xml
=20=20python: merge python-elementtree into python-xml
=20=20tune-corei7.inc: tell qemu to emulate a matching processor
=20=20libproxy: remove GPLv3 logic and spurious exports
=20=20bitbake.conf: remove unused ALLOWED_FLAGS
=20=20oeqa/selftest/sstatetests.py: check that PARALLEL_MAKE doesn't change =
signat
=20=20piglit: upgrade SRCREV
=20=20libdrm: don't detect components that have been disabled

Urs F=C3=A4ssler (1):
=20=20initrdscripts: fix mmc device as install target

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (1):
=20=20angstrom: move to gcc 5.2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Anand Balagopalakrishnan (1):
=20=20weston: restrict udev enumeration to /dev/dri/card0

Denys Dmytriyenko (7):
=20=20layer.conf: add opencl to ABI safe list
=20=20images: fix BAD_RECOMMENDATIONS
=20=20arago-base-tisdk-image: add coreutils-dev to BAD_RECOMMENDATIONS
=20=20k2-initramfs: update with new NETCP PA firmware images
=20=20arago.conf: bump distro version
=20=20busybox: enable more options for ps
=20=20packagegroup-arago-test: add procps

Jacob Stiffler (5):
=20=20ti-tisdk-makefile: Strip modules while installing
=20=20packagegroup-arago-tisdk-addons-sdk-target: Add back ipsecmgr dev =
packages
=20=20arago.conf: Swap including arago-source-ipk.inc before branding.inc
=20=20packagegroup-arago-tisdk-addons: Add protobuf for am3/4/5
=20=20packagegroup-arago-tisdk-addons: Add nodejs-npm for am3/4/5

e-ruei1@ti.com (1):
=20=20weston: add multi-display and visual_id=3D0 fixes

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

Rahul Kumar Gupta (1):
=20=20meta-isg: openssl-qat: Add support for v0.4.9-009

Reinette Chatre (1):
=20=20intel-gpu-tools: modify packaging to support different usages

Ross Burton (1):
=20=20lms7: pass expand to getVar

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
=20=20README: Update testing on PPC (qemu) with Poky/Jethro
=20=20mono: update git recipe for new mono/*-api paths

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (5):
=20=202016-02-09, Version 0.10.42 (Maintenance)
=20=202016-02-09, Version 0.12.10 (LTS)
=20=202016-02-09, Version 4.3.0 'Argon' (LTS)
=20=202016-02-09, Version 5.6.0 (Stable)
=20=20Fixed README formatting

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

Adam YH Lee (1):
=20=20libgles-omap3: fix RPM compatibility by faking hardcoded deps

Denys Dmytriyenko (12):
=20=20k2hk-evm: increase max_leb_cnt
=20=20ti-ipc-rtos: also install IPU M4 images
=20=20pru-icss: actually bump SRCREV for previous change
=20=20ompa5-evm.conf: bump max_leb_cnt
=20=20common-csl-ip: only rtos part is machine-specific, not main package
=20=20layer.conf: add cppi-lld, qmss-lld and multiprocmgr to ABI safe list
=20=20u-boot-ti-staging: update with latest fixes
=20=20linux-ti-staging: update with latest fixes
=20=20u-boot-ti-staging: update with few more fixes
=20=20linux-ti-staging: update with platform, connectivity and A/D merges
=20=20ti-sci-fw: update to 0.1.1.1 version
=20=20netcp-pa-fw: update to 3.0.1.8 version

Jacob Stiffler (1):
=20=20ipc-transport: Extract source info to common inc file

Jason Reeder (1):
=20=20pru-icss: update RPMsg folder names for am437x

Sam Nelson (1):
=20=20ti-ipc: Update to new version 3.42.0.0_eng

Thomas Perrot (1):
=20=20conf: change GUI_MACHINE_CLASS to MACHINE_GUI_CLASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Alejandro Hernandez (2):
=20=20linux-yocto: Update SRCREV for genericx86* for 4.1
=20=20linux-yocto: Update SRCREV for genericx86* for 4.4

Bruce Ashfield (1):
=20=20poky: update qemu* to prefer 4.4 kernel

Maciej Borzecki (2):
=20=20scripts/lib/bsp/engine: fix path separator
=20=20scripts/lib/bsp/engine: trailing whitespace cleanup

Maxin B. John (1):
=20=20maintainers.inc: include libjpeg-turbo and mmc-utils

Ross Burton (1):
=20=20maintainers: remove gtk-theme-torturer and gnome-mime-data

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



