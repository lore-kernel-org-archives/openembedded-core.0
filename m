Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 06B9560DD7;
	Mon, 31 Mar 2014 20:49:49 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id uq10so3799694igb.5
	for <multiple recipients>; Mon, 31 Mar 2014 13:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=9WpiFx2Pw0SJJZF7wOQFfb+WG68PImpYykZRSGh7vLk=;
	b=KNJtHConcIa02KoUjAo9fWZg3SLx4aUBngMyqXb6MEoMu48x8AIq5ZgLUKgud0pSUK
	GVGfyfF/JSaTFVW6rWjIoiVNIdMxL9kYUgr5ZW4xT+KaRuERdQ/bRHEvviNi6AHA89QD
	3YO4NUZnaW6HLPH0fIAJMX98SO3tshIFSmZvl9mb9SC2F2kWcZ4mdPMxycujhuxia0bs
	GjxE20l0Zmgmr9hiM6BjDFBDyvMfsYYfCv676abHX7aN5mhteRzQrGSNRihs9qIyik3U
	qZ6DUiMf3VOcxVcUChebpi3h3zqC23+m956r7/Bta/XRdIG3ncg1hl5c7+nGRGipJiOP
	hglg==
X-Received: by 10.43.178.197 with SMTP id ox5mr20960811icc.22.1396298989721;
	Mon, 31 Mar 2014 13:49:49 -0700 (PDT)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200])
	by mx.google.com with ESMTPSA id b6sm27476929igm.2.2014.03.31.13.49.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 13:49:48 -0700 (PDT)
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 31 Mar 2014 13:49:48 -0700 (PDT)
Message-Id: <1396298987067.41bfedc4@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-03-23 until 2014-03-30
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
X-List-Received-Date: Mon, 31 Mar 2014 20:49:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-03-23 until 2014-03-30.  Projects included in this =
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

Alexandru DAMIAN (6):
=20=20toaster: Revert "added file types to the Outputs column in the build =
page"
=20=20toaster: select recipe based on PN name
=20=20toasterui: save missed sstate tasks
=20=20toaster: clean exit on bb server shutdown
=20=20toaster: replace package dependency tag w/ view queries
=20=20bitbake: toaster: do not trap SIGCHLD

Amit Kumar Chaudhary (1):
=20=20toaster: combine ready functions

Belen Barros Pena (10):
=20=20toaster: Change objectname 'packages' to 'packages built'
=20=20toaster: Fix alignment issue in searchform
=20=20toaster: Add help text to filters
=20=20toaster: Update local configuration counter
=20=20toaster: Change "0 found" to "No found"
=20=20toaster: Change placeholder attribute in variables table
=20=20toaster: Remove commented-out code from views.py
=20=20toaster: Fix help text typos
=20=20toaster: Small fixes in tasks UI
=20=20toaster: Fix typo in heading code

Cristiana Voicu (1):
=20=20bitbake toaster: check the file_name with the content of the =
IMAGE_FSTYPES v

Dave Lerner (4):
=20=20toaster: fix package size 1st sort order
=20=20toaster: format packages with size =3D -1
=20=20toaster: show installed package name
=20=20toaster: fix dirinfo empty dir expansion

David Reyna (9):
=20=20toaster: warn new filter replaces existing filter
=20=20toaster: reset default filter for configvar page on new searches
=20=20toaster: add search by section to all recipe page
=20=20toaster: add Image detail and multiple targets to dashboard
=20=20toaster: blocks for custom/highlighted navigation and breadcrumb links
=20=20toaster: insure _get_query returns distinct records
=20=20toaster: add support for empty states in pages
=20=20toaster: added file types to the Outputs column in the build
=20=20toaster: filter tasks with cache attempts for all attempts

Irina Patru (1):
=20=20toaster: Remove circular dependecies from packages/recipes

Marius Avram (4):
=20=20hob: output filenames based on initial recipe name
=20=20toaster: apply filter only on selected attributes
=20=20cooker: delVar in removeConfigurationVar
=20=20hob: fix set_extra_setting function

Olof Johansson (5):
=20=20fetch2.URI: Coerce urlparse to use netloc for all schemes
=20=20tests.fetch: Remove debug assert
=20=20fetch2.URI: add support for query parameters
=20=20fetch2.URI: Support URIs with both query strings and params
=20=20fetch2.URI: Set username/password should not change the other

Richard Purdie (15):
=20=20runqueue: Fix sceneQueueEvent to use the correct hashes
=20=20test/data: Add in test for append/prepend/remove override operations
=20=20data_smart: Fix caching issue for double remove references
=20=20bitbake: Force -S option to take a parameter
=20=20runqueue/siggen: Pass in commandline options to dump_sigs()
=20=20cooker/event: Overhaul sanity test mechanism
=20=20msg: Add stdout/stderr filters
=20=20knotty: Ensure the progress bar shows on stdout
=20=20knotty: Split error output onto stderr
=20=20knotty: Show a link to the logfile for failed setscene tasks
=20=20cooker: Only change self.data if it exists
=20=20bin/bitbake/cooker: Ensure initial featureset is optimal
=20=20prserv: Fix exit race issues
=20=20bin/bitbake: Only try and process an event_queue if it exists
=20=20server/xmlrpc: Simlify featureset handling

Scott Rifenbark (7):
=20=20Makefile: Added publish tag so the book can be published.
=20=20user-manual-metadata.xml: Sections to handle variable setting added.
=20=20user-manual-metadata.xml: Edits to "Basic Variable Setting"
=20=20user-manual-metadata.xml: Added varflag for vardepvalueexclude.
=20=20user-manual-intro.xml: updated bitbake -h output
=20=20user-manual-execution.xml: Updated "Checksum (Signatures) section.
=20=20user-manual-execution.xml: Added how BB processes curly braces.

Trevor Woerner (1):
=20=20.gitignore: update documentation directory name

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru DAMIAN (1):
=20=20toaster.bbclass: update buildstats event data

Baogen Shang (2):
=20=20libarchive: fix CVE-2013-0211
=20=20libtiff: fix CVE-2013-4244

Bruce Ashfield (9):
=20=20linux-yocto/3.10: intel-core*/common configuration updates
=20=20linux-yocto/3.4: update mohonpeak.cfg for SATA, SMBus, LPC, WDT, =
crypto & hi
=20=20linux-yocto/3.10: update EFI configuration
=20=20linux-yocto/3.10: update to v3.10.33
=20=20linux-yocto/3.10: add valleyisland io
=20=20linux-yocto/3.10: update to v3.10.34
=20=20linux-yocto/3.10: update intel common meta data
=20=20linux-yocto/3.10: fix drm build failure
=20=20linux-yocto/3.8: remove versioned recipes

Carlos Rafael Giani (1):
=20=20Enable yasm in gstreamer1.0-libav by default

Chase Maupin (1):
=20=20mmc-utils: Add user space mmc utilities for eMMC

Chen Qi (1):
=20=20image.bbclass: replace rootfs with /dev/root

Chong Lu (1):
=20=20acl: fix the order of expected output of getfacl

Corneliu Stoicescu (1):
=20=20selftest/bbtests.py: Fixed regex and added bitbake output to =
test_warnings_e

Cristian Iorga (2):
=20=20lsb: fix lsb_log_msg() implementation
=20=20build-appliance-image: update to head =
ae938eba92b2c89a9fd91161e57c5dbc594ad4

Drew Moseley (1):
=20=20zisofs-tools-native: Add missing dependency on zlib-native

Hongxu Jia (2):
=20=20libsoup-2.4: fix compiling failed while mips-gcc optimization enabled
=20=20lttng-ust: add python to lttng-ust's RDEPENDS

Hu Yadi (1):
=20=20libpcap: add PACKAGECONFIG for libnl1

Jonas Eriksson (1):
=20=20cpio rootfs build: Avoid modifying rootfs dir

Jonathan Liu (2):
=20=20connman: upgrade to 1.22
=20=20systemd-serialgetty: update to match systemd 211

Jo=C3=A3o Henrique Ferreira de Freitas (8):
=20=20wic: Add SD/MMC-Cards support to '--ondisk' param
=20=20wic: Add RootfsPlugin
=20=20wic: Hook up RootfsPlugin plugin
=20=20wic: Add rootfs_dir argument to do_prepare_partition() method
=20=20wic: Use partition label to be part of rootfs filename
=20=20wic: Add option --rootfs-dir to --source
=20=20wic: Report all ROOTFS_DIR artifacts
=20=20wic: Extend --rootfs-dir to connect rootfs-dirs

Jukka Rissanen (1):
=20=20meta-skeleton: Add name attribute to SRC_URI

Kai Kang (3):
=20=20cryptodev-linux: add recipe
=20=20openssl: replace dependency ocf-linux with cryptodev-linux
=20=20ocf-linux: remove recipe

Konrad Scherer (1):
=20=20syslinux.bbclass: Enable additional kernel parameters for syslinux

Laurentiu Palcu (5):
=20=20run-postinsts: fix issue with checking IMAGE_FEATURES
=20=20package_manager.py: leave the __db.00* files in place
=20=20rootfs.py: add new cleanup method
=20=20populate_sdk_base: add dependency of do_package_write_* tasks
=20=20image.py: check file exists before deleting

Marius Avram (1):
=20=20buildstats: use TaskBase time for elapsed time

Martin Jansa (4):
=20=20sstate-cache-management: rm_by_stamps - include signatures of =
.sigdata. file
=20=20sstate-cache-management: rm_by_stamps - remove .siginfo and .done =
files
=20=20sstate-cache-management: skip populate_lic archives when removing =
duplicates
=20=20sstate-cache-management: rm_by_stamps - discover all suffixes like =
remove_du

Matthieu Crapet (1):
=20=20libcap 2.22: fix, disable gperf detection

Ming Liu (1):
=20=20gnupg: CVE-2013-4351

Paul Eggleton (2):
=20=20classes/staging: ensure do_populate_sysroot re-execs on changes to =
sysroot p
=20=20classes/binconfig: fix indentation in python function

Prabhu Sundararaj (1):
=20=20weston : refactor to identify EGL, cairoglesv2 support

Radu Patriu (1):
=20=20autoconf: new autotest/testsuite option to enable automake test =
result forma

Richard Purdie (18):
=20=20staging: Save out provider information into the sysroot
=20=20glib-2.0-native: Fix DEPENDS
=20=20binutils: Add fixes for binutils issue 16428
=20=20package_manager: Ensure we don't process directories twice
=20=20package_manager: Fix apt-ftparchive index creation problems
=20=20apt/package_mamager: Ensure WORKDIR is used for lists directory
=20=20base.bbclass: Run oe_import before other INHERITs
=20=20scripts: Update after addtion of parameter to bitbake -S
=20=20sanity.bbclass: Update against bitbake sanity event changes
=20=20base.bbclass: Merge two ConfigParsed event handlers
=20=20git: Fix perl paths in scripts and population of the perltools package
=20=20packagegroup-toolset-native: Update after ocf-linux -> =
cryptodev-linux chang
=20=20populate_sdk_*: Drop now unneeded recrdeptask flags
=20=20package_*.bbclass: Simplify addtask
=20=20make-3.81: Fix build failures with newer makeinfo
=20=20core-image-sato-sdk: Drop qt4 on mips64
=20=20packagegroup-core-lsb: Limit mips64 issues to qt4 packages only
=20=20xkeyboard-config: Add missing dependency on libxslt-native for =
xsltproc

Robert Yang (16):
=20=20util-linux: build setpriv requires libcap-ng
=20=20archiver.bbclass: make it can filter the license
=20=20archiver.bbclass: emit patch series files for original src
=20=20tcl: fix path in Config.sh for sstate
=20=20perl-native: fix path in Config.sh for sstate
=20=20bind: fix no bind-utils package
=20=20bind: remove nslookup from FILES
=20=20local.conf.sample.extended: update it for the archiver
=20=20util-linux-native: fix qsort_r for CentOS 5.10
=20=20meta/conf/bitbake.conf: add STAMPCLEAN to BB_HASHBASE_WHITELIST
=20=20base-files: do_install.sigdata: remove the depends on DATE
=20=20gnu-efi: fix the LIBDIR
=20=20gummiboot: add COMPATIBLE_HOST
=20=20gummiboot: use objcopy from the env
=20=20gummiboot: fix the installed but not shipped warning
=20=20packagegroup-toolset-native: remove it

Ross Burton (2):
=20=20gtk-engines: don't inherit gtk-icon-cache
=20=20gtk-engines: move engine schemas to a dedicated package

Tom Zanussi (1):
=20=20wic: Fix bitbake_env_command for 'None' case

Valentin Cobelea (2):
=20=20tune-ppce6500: Fixes a typo in tune config file for e6500.
=20=20bitbake.conf: Adds bitbake qemu option for ppc e6500 & ppc e6500-64b.

Valentin Popa (1):
=20=20piglit: ship files with correct permissions

Yong Zhang (1):
=20=20gnupg: CVE-2013-4576

Yue Tao (4):
=20=20Security Advisory - openssl - CVE-2013-4353
=20=20Security Advisory - openssl - CVE-2013-6450
=20=20Security Advisory - openssl - CVE-2013-6449
=20=20e2fsprogs: Add e2fsprogs-mke2fs and e2fsprogs-e2fsck as recommend =
packages

yanjun.zhu (2):
=20=20nss-3.15.1: fix CVE-2013-1741
=20=20nss-3.15.1: fix CVE-2013-5605

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Adam YH Lee (1):
=20=20exo: Add intltool-native as native dependency

Chunrong Guo (1):
=20=20sethdlc : add recipe

Diego Rondini (3):
=20=20python-zopeinterface: upgrade to version 4.1.1
=20=20python-twisted: upgrade to version 13.2.0
=20=20python-autobahn: upgrade to version 0.8.6

Hongxu Jia (1):
=20=20netcf: fix gnulib not found in sysroots while using a shared sstate =
cache

Joe Slater (1):
=20=20traceroute: fix alternate name

Lauren Post (1):
=20=20can-utils: Create git version

Matthieu CRAPET (2):
=20=20fim: add "hf" PACKAGECONFIG option
=20=20terminus-font: add new recipe for version 4.38

Prabhu Sundararaj (1):
=20=20gnome-desktop3: Updated to 3.4.2

Robert Yang (2):
=20=20quagga: work with new readline
=20=20traceroute: filter-out patches dir

Stanacar, StefanX (1):
=20=20efivar: add recipe

Zhenhua Luo (1):
=20=20lvm2: replace CPPFunction with rl_completion_func_t to fix build error

chase maupin (1):
=20=20pm-qa: Add power management test utils

stephen.arnold42 (2):
=20=20recipes-xfce/libxfce4ui: depends and autotools fixes
=20=20recipes-graphics/lxdm: autotools and config updates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (3):
=20=20libjpeg-turbo: switch svn to http to go through proxy
=20=20qt4-embedded-gles: skip package when sgx is not set in =
MACHINE_FEATURES
=20=20packagegroup-arago-tisdk-addons: add u-boot-fw-utils package on the =
target

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

Ann Thornton (1):
=20=20qtbase: Fix QT_CONFIG_FLAGS to work for non-X11.

Carlos Rafael Giani (1):
=20=20gstreamer1.0-plugins-imx: Update to version 0.9.5

Daiane Angolini (2):
=20=20linux: Use SUMMARY to describe the linux provider
=20=20linux: Add a long DESCRIPTION for some kernel recipes

Jacob Kroon (1):
=20=20linux-imx-rt: Add initial recipe

Otavio Salvador (1):
=20=20packagegroup-fsl-mfgtool: Add mmc-utils

Prabhu Sundararaj (1):
=20=20cairo: add OpenGL ES2 support for i.MX6

Trevor Woerner (1):
=20=20imx53qsb: add myself as maintainer

stefan (1):
=20=20linux-imx-mfgtool: Add 'require linux-imx_${PV}.bb'

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Daiane Angolini (1):
=20=20linux: Use SUMMARY to describe the linux provider

Eric Nelson (1):
=20=20linux-boundary: remove version number from 3.10.17 kernel

John Weber (2):
=20=20linux-wandboard (3.10.17): Update SRCREV to 4a8ad4
=20=20wandboard: Change kernel to 3.10.17

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

Darren Hart (2):
=20=20fri2: Update linux-yocto 3.10 SRCREV (3.10.33-LTSI)
=20=20linux-yocto-dev: Specify SRC_REVs for intel-core* machines

Nitin A Kamble (2):
=20=20Remove chiefriver, sys940x & n450 BSPs
=20=20common linux-yocto-3.10: specify kernel SRCREVs

Tom Zanussi (1):
=20=20Actually remove all retired BSP files

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Florin Sarbu (4):
=20=20pulseaudio: Update .bbappend to poky master version
=20=20Remove use of deprecated PRINC.     The PR server should be used to =
automati
=20=20node-state-manager: Current version of systemd has the API     =
previously ex
=20=20node-startup-controller: Current version of systemd has the API     =
previous

Yasir-Khan (1):
=20=20node-state-manager: Add dependency on systemd

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (5):
=20=20fs-perms-shr: replace /var/run directory with symlink to /run
=20=20linux-gta04: upgrade to 3.13.0
=20=20linux-gta04: upgrade to 3.13.6 and enable MEMCG
=20=20packagegroup-shr: Make it MACHINE_ARCH because eve is not for all

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (1):
=20=20linux-mainline: add 3.14 mainline recipe

Sam Nelson (1):
=20=20keystone-evm: Update NAND size to 512 MB

Samuli Piippo (1):
=20=20libgles-omap3: create ESx.0 folders only if they exist

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Alexandr Smoktal (1):
=20=20webos-image: nodejs-module-webos-sysbus=3D31

Andrii Zora (1):
=20=20webos-image: libpbnjson=3D31

Pu Chen (1):
=20=20webos-image: tzdata=3Dv2014a

Simon Busch (1):
=20=20webos-image: webos-connman-adapter=3Dr3 (add connman-client)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (3):
=20=20linux-xlnx: Update SRC_URI to use https instead of git
=20=20u-boot-xlnx: Update SRC_URI to use https instead of git
=20=20machine-xilinx-default.inc: Specify virtual/bootloader

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Robert Yang (2):
=20=20local.conf.sample.extended: update it for the archiver
=20=20distro_alias.inc: remove packagegroup-toolset-native

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



