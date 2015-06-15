Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id C1AAC759DC;
	Mon, 15 Jun 2015 15:28:30 +0000 (UTC)
Received: by iebgx4 with SMTP id gx4so64772274ieb.0;
	Mon, 15 Jun 2015 08:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=xxql/D/oS6lPVEy8QeZCLW+tWgy2hggyPaTMvWhr85A=;
	b=aI+7UHyWawuUoT46b37RDGX/q4pkFqnSlmYktYQElw37OVktIjBNpdnMtSCtFOfeno
	tJkOL8DfMW5KQdh+/9+zAxvzNSTSzYStqYVQtkXlySgdM+7C8esTUv6Jph4J0NF5tJZk
	nibs1AYhNkzgBe2uDt8KUfPxJb0a3T2lJo9r0kZvoELZyHNx45I4Z6lOQyGviBuZsrEl
	cHXU49V8X4euWDSb86WBT3HHF+OfjHW41tuaZuFlo0B1VADi+tEfBnqls2KZk6Va3MAF
	4ZWW8FVR+6vj5TH/cph5ZdvCFWitTDAVK9Ejy/AvQCLz6gZnLxDacTEAUndsRU3hpEir
	FKJQ==
X-Received: by 10.42.238.14 with SMTP id kq14mr30953193icb.23.1434382111412;
	Mon, 15 Jun 2015 08:28:31 -0700 (PDT)
Received: from [127.0.0.1] ([166.170.24.239])
	by mx.google.com with ESMTPSA id pg7sm7788645igb.6.2015.06.15.08.28.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jun 2015 08:28:27 -0700 (PDT)
Date: Mon, 15 Jun 2015 08:28:27 -0700 (PDT)
X-Google-Original-Date: Mon, 15 Jun 2015 15:28:13 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1434382093856.0cb8e10c@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-06-07 until 2015-06-14
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
X-List-Received-Date: Mon, 15 Jun 2015 15:28:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-06-07 until 2015-06-14.  Projects included in this =
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
git://gitorious.org/schnitzeltony-oe-meta/meta-gumstix-community.git
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

Alexandru DAMIAN (14):
=20=20toaster: move project data typeahead to the REST API
=20=20convert all project-based view to JSON APIs
=20=20toaster: toastertables REST refactoring
=20=20toastergui: use defaults on xhr_datatypeahead parameters
=20=20toastergui: remove xhr_projectedit and xhr_projectinfo URLs
=20=20toaster: toaster table add raw data
=20=20toaster: ToasterTables add computational fields
=20=20toaster: toastertables raise errors
=20=20toaster: add class template view for single-object pages
=20=20toaster: eliminate duplicate querysets
=20=20toastergui: remove xhr_datatypeahead and xhr_XXXbuild
=20=20toastergui: remove xhr_datatypeahaed layerdeps call
=20=20toaster: fixes after refactoring
=20=20toastergui: prevent contamination of libtoaster context

Ed Bartosh (2):
=20=20toaster: Code cleanup: bashisms
=20=20toaster: Make toaster script to work in dash

Michael Wood (2):
=20=20toaster: Add ajax loading spinner
=20=20toaster: Add global ajaxError handler

Richard Purdie (2):
=20=20cooker/event: Add an event which lists all stamps reachable after =
parsing
=20=20bitbake: Bump version to 1.27.1

Vlad Fulgeanu (1):
=20=20toaster: tables: Remove obsolete field_name for select column

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (5):
=20=20python3: fix pyconfig.h installation on target
=20=20python3: Fix distutils import error
=20=20python3-io: Fixes compilation of python3 ssl module
=20=20python3-distribute: Upgrade to python3-setuptools 15.2
=20=20python3-pip: Adds recipe for python3-pip

Andre McCurdy (4):
=20=20python-numpy: use x86 over-ride instead of i586
=20=20gstreamer1.0-plugins-base.inc: use x86 over-ride instead of i586
=20=20lame: use x86 over-ride instead of i586
=20=20x264: use x86 over-ride instead of i586

An=C3=ADbal Lim=C3=B3n (4):
=20=20recipeutils: Improve get_recipe_pv_without_srcpv function
=20=20distrodata: Remove unnecessary include of package_regex.inc
=20=20distrodata: checkpkg make usage of =
oe.recipeutils.get_recipe_upstream_versio
=20=20distrodata: Use Python CSV instead of did by hand

Bruce Ashfield (1):
=20=20xorg: fix VESA int10 error

Cristian Iorga (1):
=20=20insane: errors out on binaries installed by allarch-inherit recipes

Ed Bartosh (21):
=20=20wic: set legacy_boot flag for gpt partitions
=20=20wic: check if part_type is set only for msdos partition table
=20=20wic: Add gpt to the list of supported partition table formats
=20=20wic: Use gptmbr.bin MBR for gpt partitions
=20=20wic: Make _ptable_format public
=20=20wic: create directdisk-gpt.wks
=20=20wic: Test creation of directdisk image with GPT table
=20=20wic: removed exec_cmd_quiet and exec_native_cmd_quiet
=20=20wic: move checks to exec_native_cmd
=20=20wic: replaced __run_parted with exec_native_cmd
=20=20wic: pylinted partitionedfs.py
=20=20wic: Add --use-uuid partition option
=20=20wic: Generate random uuid for partition
=20=20wic: Fix format string
=20=20wic: Refactored getting root device name
=20=20wic: Add parameter 'uuid' to Image.add_partition method
=20=20wic: Set type GUID and UUID for partition
=20=20wic: Use partition UUID in directdisk-gpt
=20=20wic: oe-selftest: Configure testing of gpt/UUID image
=20=20wic: Add help for --part-type and --use-uuid options
=20=20wic: Move validation of --ptable option to wks parser

Junling Zheng (3):
=20=20busybox: sync the patches for git version
=20=20busybox: fix double free error for ifconfig
=20=20busybox: fix the wrong help text for chown

Juro Bystricky (6):
=20=20image: Support for VDI
=20=20qemu: Add support for UUID
=20=20documentation.conf: Document do_vmimg
=20=20sanity.bbclass: Prevent 'vdi' and 'live' to be built together
=20=20boot-direct.bbclass: Add support for VDI images
=20=20build-appliance-image: do_vmdkimg replaced by do_vmimg

Jussi Kukkonen (6):
=20=20xf86-input-evdev: Upgrade 2.9.1 -> 2.9.2
=20=20xf86-input-keyboard: Upgrade 1.8.0 -> 1.8.1
=20=20xf86-input-synaptics: Upgrade 1.8.1 -> 1.8.2
=20=20xf86-video-omap: Upgrade to 0.4.3
=20=20xf86-video-vmware: Upgrade 13.0.2 -> 13.1.0
=20=20xkeyboard-config: Upgrade 2.14 -> 2.15

Kai Kang (3):
=20=20qt4: upgrade to 4.8.7
=20=20alsa-tools: add dependency glib-2.0
=20=20Add license file XFree86-1.0

Khem Raj (2):
=20=20libpam: Fix wrong crypt library detection
=20=20lsof: Remove LSOF_OS

Lei Maohui (1):
=20=20cracklib:Fix an error in the patch

Leonardo Sandoval (1):
=20=20libgpg-error: Upgrade 1.18 -> 1.19

Lucian Musat (3):
=20=20oeqa/utils: Added timeout decorator for testcases.
=20=20oeqa/parselogs: The logs are now copied and parsed locally.
=20=20oeqa/parselogs: Added some more errors to the whitelist.

Moritz Blume (1):
=20=20cmake: Whitespace fix

Paul Eggleton (2):
=20=20lib/oe/rootfs: tidy up log warning reporting
=20=20python-smartpm: change "already installed" warnings into info messages

Paul Gortmaker (1):
=20=20bind: ensure searching for json headers searches sysroot

Richard Purdie (3):
=20=20sstate: Add eventhandler which cleans up stale recipe data
=20=20sanity.conf: Bump minimum bitbake version to 1.27.1 for sstate change
=20=20sysvinit: Only enable recipe in builds where its applicable

Robert Yang (19):
=20=20sgmlspl-native: 1.03ii -> 1.1
=20=20rpm: remove extra dev and dbg packages
=20=20libpfm4: 4.3.0 -> 4.6.0
=20=20clutter-gst-3.0: 3.0.4 -> 3.0.6
=20=20augeas: 1.2.0 -> 1.4.0
=20=20dropbear: 2014.66 -> 2015.67
=20=20gpgme: 1.4.3 -> 1.5.4
=20=20gstreamer1.0-libav: fix build for i586 with gcc
=20=20qmmp: 0.7.7 -> 0.8.5
=20=20libevdev: 1.3 -> 1.4.2
=20=20yasm: 1.2.0 -> 1.3.0
=20=20x264: r2265 -> r2491
=20=20update-rc.d.bbclass: add MLPREFIX when set RRECOMMENDS
=20=20multilib.bbclass: use package_qa_handle_error
=20=20mtools: add PACKAGECONFIG for libbsd
=20=20sysstat: DEPENDS on base-passwd
=20=20blktrace: 1.0.5 -> 1.1.0
=20=20gcc-source.inc: fix STAMPCLEAN to avoid race issue
=20=20libpostproc: pass correct libdir

Ross Burton (6):
=20=20scripts/jhbuild: remove
=20=20cups: clean up autotools use
=20=20neon: build the test suite to verify neon links
=20=20cmake: extend CMAKE_MODULE_PATH instead of setting
=20=20piglit: upgrade to more recent srvrev
=20=20pulseaudio: fix version when building inside a dirty git checkout

Roy Li (1):
=20=20autogen: redirect the log file to build dir

Tanu Kaskinen (2):
=20=20alsa-plugins: enable alsa-plugins-pulseaudio-conf conditionally
=20=20libatomic-ops: 7.2 -> 7.4.2

Yue Tao (1):
=20=20libsndfile: Security Advisory - libsndfile - CVE-2014-9496

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andre McCurdy (7):
=20=20elbow: use x86 over-ride instead of i586
=20=20webkit-efl.inc: use x86 over-ride instead of i586
=20=20klibc.inc: use x86 over-ride instead of i486/i586/i686/pentium
=20=20gst-plugins-base: use x86 over-ride instead of i586
=20=20luajit: use x86 over-ride instead of i586
=20=20emacs.inc: use x86 over-ride instead of i586
=20=20mariadb.inc: use x86 over-ride instead of i586

Armin Kuster (1):
=20=20bundler: update to 1.9.4

Josep Puigdemont (1):
=20=20libhugetlbfs: project moved to github

Khem Raj (1):
=20=20cpufrequtils: Create proper symlinks to versioned library

Naresh Bhat (1):
=20=20xorriso: Add xorriso v1.4.0

Nicolas Aguirre (1):
=20=20mm-common: bump version to 0.9.7

Robert Yang (1):
=20=20imagemagick: update patchset from 3 to 4

Roy Li (2):
=20=20webmin: upgrade to 1.750
=20=20mariadb: Security Advisory -CVE-2015-2305

Yi Zhao (3):
=20=20luajit: fix build failure for multilib
=20=20nodejs: fix build failure for multilib
=20=20llvm: fix libdir for multilib

mcrapet (1):
=20=20cgdb: update to 0.6.8

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (1):
=20=20contrib: ci-upload-helper.sh: import CI uploader script from =
setup-scripts

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (1):
=20=20gcc-linaro, external-linaro-toolchain: adjust C++ header file =
locations

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

Andreas M=C3=BCller (2):
=20=20linux-imx_3.14.28: fix initial MMC device detection
=20=20linux-imx-3.14.28: FEC: fix garbage send for huge data blocks

Carlos Rafael Giani (1):
=20=20gstreamer1.0-plugins-imx: Update to version 0.10.2

Neena Busireddy (4):
=20=20imx-gpu-viv: Upgrade to 5.0.11.p4.5
=20=20imx-gpu-viv: Upgrade sfp to 5.0.11.p4.5
=20=20xf86-video-imxfb-vivante: Upgrade to 5.0.11.p4.5
=20=20SCR-3.14.28-1.0.1-patch: Add SCR for 3.14.28-1.0.1_patch release

Otavio Salvador (5):
=20=20libfslcodec: Remove binary examples for i.MX5
=20=20imx-base.inc: Set amd-gpu-mx51 provider depending on backend
=20=20Remove GStreamer 0.10 support
=20=20gst1.0-fsl-plugin: Stop using gst-fsl-plugin.inc file
=20=20directfb: Correct bashism

Stefan Christ (2):
=20=20fsl-eula-unpack: fix outdated EULA checksum
=20=20fsl-eula-unpack: fix deploying EULA

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

Chang Rebecca Swee Fun (1):
=20=20linux-yocto_3.19: Update SRCREV to include driver update

Ross Burton (1):
=20=20xf86-video-ast: upgrade to 1.0.1

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
=20=20mono: Update to support release 4.0.2.4
=20=20mozroot-certdata: Imports mozroot certificates for Mono

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (1):
=20=202015-06-13 io.js v2.3.0 Release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

Khem Raj (1):
=20=20linux-ixp4xx_2.6.37.bb: Adjust to OE-Core change w.r.t. ${S}

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

Martin Jansa (2):
=20=20initramfs-android-image: disable DEPMOD

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (2):
=20=20linux-ti-staging: update with latest A/D and connectivity fixes
=20=20linux-ti-staging: A/D fix for vpe firmware load race

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Ross Burton (1):
=20=20poky.conf: use correct GPLv3 license name

Saul Wold (1):
=20=20poky-tiny: Update kernel to 3.19

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



