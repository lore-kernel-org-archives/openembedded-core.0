Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 48F086EFA1;
	Wed, 19 Feb 2014 15:55:59 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id tp5so359813ieb.13
	for <multiple recipients>; Wed, 19 Feb 2014 07:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=cUDOXkyuEMnQnDK/ZEOrhI5N6OpR7WUXDo2RzZH/2fE=;
	b=UvDf3G20C+rRWd/T9H+v+2OInedj1DGnSCUMWWnMojMGM7Kfrej4ui8hU8tDIKBMD3
	llb7/YN2U5FxpKYcuTcMpieZ2q2u7QsBrFJw8Hlg+3c2n2NY7qc318MrJygCdT1mhudI
	LDi7wHA/KDTL0wzq6yciGMN0a8ngqgaHJfRulDW3Dft3y8JRPUx6xO3mnFyuA+63O4Gl
	cefudDRqOB0vetlgkjN9sejPCABwL2L8EPfYoGBHZjiifHXkzfA1R+Un1ohinqiCeser
	CTFSEEFmq5nQWPncS+lwE6Jw8s5yIEvV5NgNY8kYGk8XDk4JuJ80d67W2YtXXkDqueEk
	KwRw==
X-Received: by 10.50.79.134 with SMTP id j6mr1945223igx.13.1392825360251;
	Wed, 19 Feb 2014 07:56:00 -0800 (PST)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200])
	by mx.google.com with ESMTPSA id f9sm2326359igz.3.2014.02.19.07.55.58
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Feb 2014 07:55:59 -0800 (PST)
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Wed, 19 Feb 2014 07:55:59 -0800 (PST)
Message-Id: <1392825358301.5f52a762@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-02-09 until 2014-02-16
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
X-List-Received-Date: Wed, 19 Feb 2014 15:55:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-02-09 until 2014-02-16.  Projects included in this =
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

Richard Purdie (3):
=20=20runqueue: Fix setscene hard dependency problems
=20=20runqueue: Ensure we do run 'masked' setscene tasks if specified as =
targets
=20=20runqueue: Fix silly variable overlap

Scott Rifenbark (14):
=20=20user-manual-ref-variables.xml: Added BB* variables to glossary.
=20=20user-manual-ref-variables.xml: Added FAKEROOT* variables to glossary.
=20=20user-manual-ref-variables.xml: Added PREFERRED_PROVIDERS to glossary.
=20=20user-manual-ref-variables.xml: Edits to PREFERRED_PROVIDER.
=20=20user-manual-ref-variables.xml: Added 6 new variables to glossary:
=20=20user-manual-ref-variables.xml: Edits to FILESPATH.
=20=20user-manual-ref-variables.xml: Added 11 new variables to glossary.
=20=20user-manual-ref-variables.xml: Review edits to several variables in =
glossary
=20=20user-manual-metadata.xml: Added "Checksums (Signatures)" section.
=20=20user-manual-intro.xml: General edits to Introduction chapter.
=20=20user-manual-metadata.xml: Edits through syntax section
=20=20user-manual-metadata.xml: Edits to "Defining Pure Python Functions"
=20=20user-manual-metadata.xml: Edits to "Conditional Syntax (Overrides)"
=20=20user-manual-metadata.xml: Edits to the "Sharing Functionality" =
section.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandre Belloni (1):
=20=20kernel: use oldnoconfig before yes '' | make oldconfig

Andreea Proca (1):
=20=20report-error.bbclass: new class to save build information when errors =
occur

Bruce Ashfield (7):
=20=20kernel: stop using -exec rm for deleting files
=20=20linux-yocto/3.10: integrate LTSI
=20=20linux-yocto/3.10: add powermanagement config to 32 bit common-pc
=20=20linux-yocto/3.10: update to v3.10.28
=20=20linux-yocto/3.10: arbitrary write with CONFIG_X86_X32 (CVE-2014-0038)
=20=20linux-yocto/3.10: add minnow-io feature to LTSI
=20=20linux-yocto/3.10: enable CONFIG_FHANDLE for standard and preempt-rt =
kernels

Chen Qi (3):
=20=20sysstat: upgrade to 10.2.1
=20=20busybox-syslog: add more comments to systemd configuration file
=20=20initscripts: fix syntax error in postinsts

Chong Lu (2):
=20=20flex: upgrade to 2.5.38
=20=20flex: enable ptest support

Cristian Iorga (4):
=20=20telepathy-mission-control: typo in connectivity switch
=20=20harfbuzz: upgrade to 0.9.26
=20=20runqemu: enforce right CPU type for qemux86/x86-64
=20=20flac: upgrade to 1.3.0

Darren Hart (1):
=20=20linux-yocto: Use PACKAGE_ARCH in build dir

David Nystr=C3=B6m (1):
=20=20license.bbclass: Dont create a manifest when using =
BUILD_IMAGES_FROM_FEEDS

Dmitry Eremin-Solenikov (2):
=20=20image_types bbclass: use compression framework for jffs2 sum images
=20=20image_types: sum.jffs2 is replaced by jffs2.sum

Hongxu Jia (19):
=20=20lib/oe/manifest.py: add rpm image manifest creation
=20=20lib/oe/package_manager.py: support RpmPM
=20=20lib/oe/rootfs.py: support RpmRootfs
=20=20lib/oe/rootfs.py: Tweak the rootfs removing operation
=20=20rootfs.py: fix uninstall uneeded pkgs failed
=20=20rootfs.py: strip kernel-abiversion useless readline
=20=20lib/oe/image.py: fix get rootfs_extra_space failed
=20=20image.bbclass/license.bbclass: ajustment list_installed_packages =
invoking
=20=20license.bbclass: fix license_create_manifest failed
=20=20lib/oe/sdk.py: support RpmRootfs
=20=20image.bbclass/populate_sdk_base.bbclass: shift position of sdk =
complementary
=20=20Cleanup rootfs_rpm,package_rpm bbclass files
=20=20lib/oe/rootfs.py: fix invoking rpm _handle_intercept_failure failed
=20=20lib/oe/package_manager.py: fix invoking rpm save_rpmpostinist failed
=20=20lib/oe/rootfs.py: fix invoking _run_intercepts failed
=20=20populate_sdk_rpm.bbclass: remove old shell code
=20=20package_manger.py/rootfs.py: rename save_rpmpostinist with =
save_rpmpostinst
=20=20lib/oe/package_manager.py: moving global SCRIPTLET_FORMAT and =
DB_CONFIG_CONT
=20=20socat: upgrade to 1.7.2.3

Khem Raj (3):
=20=20systemd: Fix misc journald memory bugs
=20=20systemd: Enable building microhttpd via PACKAGECONFIG
=20=20systemd: Refresh patches for uclibc

Koen Kooi (2):
=20=20package.bbclass: fix strip and split logic
=20=20curl: fix https certificate problems

Laurentiu Palcu (43):
=20=20lib/oe/utils.py: add pre/post process helper function
=20=20lib/oe/image.py: add new image creation library
=20=20lib/oe/manifest.py: add library for image manifest creation
=20=20lib/oe/package_manager.py: add new package management library
=20=20lib/oe/rootfs.py: add new library for rootfs creation
=20=20Activate the new python rootfs/image creation routines
=20=20oe/manifest.py: Add manifest creation for opkg
=20=20package_(deb|ipk).bbclass: remove the stamp when creating package =
from cache
=20=20lib/oe/manifest.py: create global variables for package types
=20=20lib/oe/package_manager.py: add deploy dir locking mechanism
=20=20lib/oe/package_manager.py: use the bitbake APT_ARGS variable
=20=20lib/oe/package_manager.py: add support for opkg backend
=20=20lib/oe/rootfs.py: add support for opkg backend
=20=20Cleanup image,rootfs_ipk,package_ipk bbclass files
=20=20image.bbclass, lib/oe/rootfs.py: remove intercept_scripts directory
=20=20lib/oe/manifest.py: create manifests for SDK too
=20=20lib/oe/rootfs.py: use Manifest.INSTALL_ORDER
=20=20lib/oe/package_manager.py: fixes for dpkg backend
=20=20lib/oe/sdk.py: add SDK class
=20=20populate_sdk_base.bbclass: activate the new python routines
=20=20image.bbclass: change POPULATE_SDK_POST_TARGET_COMMAND
=20=20populate_sdk_(deb|ipk).bbclass: remove old shell code
=20=20lib/oe/package_manager.py: RpmPM fixes
=20=20lib/oe/rootfs.py: warn the user if intercept hooks fail
=20=20scripts/postinst-intercepts: do not redirect errors to /dev/null
=20=20lib/oe/package_manager.py: DpkgPM, use lock on deploy dir
=20=20lib/oe/image.py: fix image size calculation routine
=20=20lib/oe/package_manager.py: OpkgPM/DpkgPM fixes
=20=20lib/oe/rootfs.py: OpkgRootfs, fix issue in _get_delayed_postinsts()
=20=20lib/oe/package_manager.py: do not use stamps
=20=20lib/oe/package_manager.py: OpkgPM, bad recommendation handling change
=20=20rootfs.py, package_manager.py, sdk.py: Fix building from feeds =
feature for o
=20=20lib/oe/package_manager.py: check that package list is not empty
=20=20lib/oe/package_manager.py: RpmPM: fix issue with multilib builds
=20=20image.py, package_manager.py, rootfs.py: dump command output on error
=20=20gmp: add configure.ac patch to append user provided compilation flags
=20=20(image|rootfs_ipk).bbclass, rootfs.py: ipk multilib fixes
=20=20lib/oe/rootfs.py: fix RPM multilib issue
=20=20buildhistory.bbclass: create wrapper functions around =
buildhistory_get_sdk_i
=20=20package_manager.py, rootfs.py, sdk.py: add Indexer class
=20=20package-index.bb: use the new python indexing routines
=20=20package_*.bbclass: remove references to the old bash indexing routines
=20=20package_manager.py: move multilib prefix list computation function to =
RpmInd

Marius Avram (1):
=20=20puzzles: upgrade to r10116

Mark Hatle (2):
=20=20useradd-staticids: Fix groupadd when --user-group is selected
=20=20useradd-staticids: Adjust USERADD_ERROR_DYNAMIC condition and error =
message

Maxin B. John (1):
=20=20rt-tests: version bump to 0.87

Nitin A Kamble (1):
=20=20systemtap_git: update to newer version to fix a build issue

Otavio Salvador (1):
=20=20kernel.bbclass, base.bbclass: Fix support for old kernel configuration

Paul Eggleton (3):
=20=20conf/bitbake.conf: default HOMEPAGE to blank instead of unknown
=20=20python-smartpm: really ignore conflicts during install with --attempt
=20=20classes/buildhistory: avoid buildhistory triggering rebuilds (again)

Richard Purdie (6):
=20=20sstate: Exclude SSTATE_EXTRAPATH from checksums
=20=20systemd-serialgetty: Update to match version in recent systemd
=20=20meta/recipes: Remove virtclass references
=20=20package: Remove the before do_build constraint of the do_package task
=20=20Revert "nss: avoid to use the hardcode kernel version"
=20=20hwatdetect: Fix build failures from undeclared INC_PR

Ross Burton (1):
=20=20initscripts: mask initscripts from systemd

Roy Li (1):
=20=20nss: avoid to use the hardcode kernel version

Stefan Stanacar (3):
=20=20oeqa/utils: targetbuild: take proxy into account
=20=20testimage: fail if no package manifest is found
=20=20oeqa/runtime: smart: don't run in auto mode when rpm is not the pm

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Matthieu Crapet (1):
=20=20libnetfilter-log: add newrecipe for version 1.0.1

Roy Li (3):
=20=20inetutils: disable rpath
=20=20quagga: fix a typOS
=20=20proftpd: move the runing created file under /var/run

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

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

Andreas Henriksson (1):
=20=20u-boot-imx: fix typo in 2009.08 recipe

Eric Nelson (1):
=20=20image_types_fsl: explicitly state the origin of boot scripts

John Weber (1):
=20=20libdrm: change .bbappend to use %

Otavio Salvador (6):
=20=20imx31pdf, imx35pdf: Remove duplicate inclusion of soc-family.inc
=20=20imx-test: Fix package strip logic
=20=20gpu-viv-bin-mx6q: Fix package strip logic
=20=20gpu-viv-g2d: Fix package strip logic
=20=20libfslcodec: Fix package strip logic
=20=20libfslparser: Fix package strip logic

Rogerio Nunes (1):
=20=20gstreamer1.0-imx: rename to gstreamer1.0-plugins-imx

S=C3=A9bastien Taylor (1):
=20=20qtbase: change .bbappend to use %

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Andreas Henriksson (1):
=20=20linux-imx: fix missing initial space for cgtqmx6 patch

John Weber (3):
=20=20wandboard-dual: Add myself as maintainer
=20=20wandboard-solo: Add myself as maintainer
=20=20wandboard-quad: Add myself as maintainer

Otavio Salvador (1):
=20=20linux-boundary, u-boot-script-boundary: Set compatible machine

Patrick Keil (1):
=20=20linux-wandboard-3.0.35: Add kernel configs for Systemd

Pavel Kopylov (2):
=20=20linux-imx (3.0.35): Enable devtmpfs for cgtqmx6
=20=20linux-imx (3.0.35): Enable USB for cgtqmx6

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Zhenhua Luo (1):
=20=20fmc: add t2080qds support

Zongchun Yu (14):
=20=20t2080qds: add machine configure files
=20=20fm-ucode: add support for t2080qds and t2080qds-64b
=20=20u-boot:add srio image support
=20=20u-boot: update license according the source code
=20=20asf: update the SHA for SDK T2080QDS
=20=20cst: update SHA for SDK T2080QDS
=20=20hv-cfg: update SHA for SDK T2080QDS
=20=20hypervisor: update SHA for SDK T2080QDS
=20=20fmlib: update SHA for SDK T2080QDS
=20=20flib: update SHA for SDK T2080QDS
=20=20linux: update SHA for SDK T2080QDS
=20=20rcw: update SHA for SDK T2080QDS
=20=20usdpaa: update the SHA for SDK T2080QDS
=20=20u-boot: update SHA for SDK T2080QDS

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
=20=20jasperforest: Correct typo in machine config tune file
=20=20linux-yocto: Add intel-common linux-yocto-3.10 recipe

Koen Kooi (1):
=20=20emgd-driver-bin: Limit build to x86

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Holger Behrens (4):
=20=20xserver-xorg: follow upstream to 1.15.0
=20=20ecryptfs-utils: upgrade to 104
=20=20fuse: upgrade to 2.9.3
=20=20keyutils: upgrade to version 1.5.8

Noor, Ahsan (1):
=20=20ecryptfs-utils: Resolve undefined macro

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

Denys Dmytriyenko (1):
=20=20meta-toolchain-qt5: add Qt5 SDK standalone meta recipe

Otavio Salvador (4):
=20=20packagegroup-qt5-toolchain-target: Add packagegroup
=20=20populate_sdk_qt5.bbclass: Allow generation of toolchain
=20=20nativesdk-qtbase: Fix install error in case install task is rerun
=20=20nativesdk-qtbase.inc: Remove unused contents

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (1):
=20=20Merge "tune-arm1176jzfs-s.inc: Add hard float profile, arm1176jzfshf, =
in AVA

S=C3=A9bastien Mennetrier (1):
=20=20Add initramfs support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (3):
=20=20busybox: rename .bbappend to match new version from oe-core
=20=20xserver-xorg: Rename .bbappend to match new version from oe-core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (6):
=20=20u-boot-ti-staging: update with QSPI partition size changes
=20=20linux-ti-staging: update with PM, connectivity and Display/Audio fixes
=20=20linux-ti-staging: apply network performance and LCD fixes locally for =
now
=20=20am33x-cm3: update with I2C clock rate calculation fixes
=20=20linux-ti-staging: update with v2 of LCD resume fixes
=20=20linux-ti-staging: update with QSPI partition fixes and properly list =
LCD pat

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Alekseyev Oleksandr (1):
=20=20webos-image: libpbnjson=3D28,v2.4.0

Alexandr Smoktal (2):
=20=20webos-image: luna-service2=3D173,v3.6.0
=20=20webos-image: luna-service2=3D174

Gayathri Srinivasan (1):
=20=20webos-image: pmlogdaemon=3D117

Keith Derrick (1):
=20=20nyx-modules: Add runtime dependency on gzip

Mykola Kryvonos (1):
=20=20webos-image: libpbnjson=3D27,v2.3.0

Nikolay Orliuk (1):
=20=20webos-image: luna-sysservice=3D35

Oleksii Uratkin (2):
=20=20webos-image: db8=3D123, v 3.2.0
=20=20webos-image: db8=3D124

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (1):
=20=20gdb: Upgrade recipes to newer 7.6.2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Olof Johansson (1):
=20=20poky.conf: Add Debian-7.4 to SANITY_TESTED_DISTROS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



