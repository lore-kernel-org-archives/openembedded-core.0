Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2E96F911;
	Wed, 19 Mar 2014 15:15:07 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id lx4so9028795iec.38
	for <multiple recipients>; Wed, 19 Mar 2014 08:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=BGxtcL52Bgua9dkS1/0zoT+v9//M0QAiwhbQ54OcP7I=;
	b=kwfxFDWOPtD8KPTPaCwL0EbIoH2a8is8uYaIb4yrYJhczuOeA2Ees+MKbn/vpYA5iT
	T86bTMhJtKlTbGi19Lb2vC7Tkh1QW+jgH2TOLfl3Rd5k6v5H0UHbb8R0AOwcNlByDDCX
	nLbGOoMBXVzu5uu/839L+CM59VVpz6qIQEeNI6oHa6vQBYrB3pFStwMIl267n1xDRhSW
	64jkXRIjIRbUcP33NlLfRXdXw7X1m0RBio1B0mZLHUM2CvWGBRSpt9WGdCrByWuv/Nc0
	/y9bxYmWRQNGohLVmPXDyBhOpArO3fbwtMT62MR3HaYcMNh2LThOcvFMnJ9svlsnDw/s
	BpIA==
X-Received: by 10.50.176.162 with SMTP id cj2mr25940352igc.7.1395242108229;
	Wed, 19 Mar 2014 08:15:08 -0700 (PDT)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200])
	by mx.google.com with ESMTPSA id y9sm33637972igl.7.2014.03.19.08.14.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Mar 2014 08:14:33 -0700 (PDT)
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Wed, 19 Mar 2014 08:14:33 -0700 (PDT)
Message-Id: <1395242064621.35347e88@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-03-09 until 2014-03-16
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
X-List-Received-Date: Wed, 19 Mar 2014 15:15:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-03-09 until 2014-03-16.  Projects included in this =
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

Alexandru DAMIAN (16):
=20=20toastergui: fix task executed status display
=20=20toasterui: adding new task outcome empty
=20=20toaster: mark dependency packages
=20=20toaster: array-assignment fix from Chome
=20=20toasterui: task data structure in toasterui
=20=20toasterui: add asserts on expected values
=20=20toaster: update database schema
=20=20toasterui: fix status update on failed sstate tasks
=20=20toaster: fix issues in the build table
=20=20toasterui: fix task identification
=20=20toaster: update database schema
=20=20toaster: write files-in-image to the database
=20=20toaster: add commands to list and delete builds
=20=20toaster: erase checks for stop command
=20=20toaster: fix target file inode type information
=20=20toaster: improve recipe matching for native tasks

Amit Kumar Chaudhary (1):
=20=20toaster: add errors and warnings listing

Belen Barros Pena (22):
=20=20toaster: Remove inline styles in h1
=20=20toaster: Set correct string for missed sstate attempts
=20=20toaster: Set the right styles for definition lists
=20=20toaster: Add .muted class to disabled checkboxes
=20=20toaster: Hide the applied filter tooltip on click
=20=20toaster: Change help text for Section
=20=20toaster: Change popover headings in recipes table
=20=20toaster: Sort packages and dependencies in recipe.html
=20=20toaster: Fix breadcrumb date format in detail pages
=20=20toaster: Move long content toggle to main.js
=20=20toaster: Fix help text for task details outcome
=20=20toaster: Move <tbody> outside for statement
=20=20toaster: Make Order column part of the minimum table
=20=20toaster: Format package size in recipe.html
=20=20toaster: Replace hyphens with underscores in package name
=20=20toaster: Small tweaks to the no results page
=20=20toaster: Amend help text in package_built_detail.html
=20=20toaster: Fixing "Show all builds" link
=20=20toaster: Add no search results page
=20=20toaster: Give an extra space to the caret
=20=20toaster: Shorten dependency labels
=20=20toaster: Presentation fixes for task.html

Cristiana Voicu (2):
=20=20toaster: populate target image file table
=20=20toaster: add license manifest path to database

David Reyna (5):
=20=20toaster: extend Tasks to include Time, Disk IO, and CPU Usage
=20=20toaster: implement the configuration pagedreyna/configure-detail-view
=20=20toaster: add empty outcome support to task page
=20=20toaster: add 'bblayers.conf' files to local config filter
=20=20toaster: fix 'show all' labels for tasks and variables

Marius Avram (2):
=20=20bb/ui: store_dependency_information optimization
=20=20bitbake: cooker: some IMAGE_FEATURES not recognized

Ravi Chintakunta (3):
=20=20toaster: Bug fix in reload page with parameters
=20=20toaster: View detailed information about a task
=20=20toaster: Add counters to filters

Richard Purdie (21):
=20=20fetch2/wget: Fix downloadfilename functionality
=20=20user-manual-metadata.xml: Add details about environment variables =
used by Bi
=20=20user-manual-metadata.xml: Add details about general variables used by =
BitBak
=20=20user-manual-metadata.xml: Add bare bones of a scheduler section
=20=20knotty: Deal with exceptions not resetting terminal configuration
=20=20bitbake-worker: Gracefully handle SIGTERM
=20=20runqueue.py: Handle worker disappearing gracefully
=20=20runqueue.py: Gracefully handle a missing worker process
=20=20cooker/command: Add setFeatures command
=20=20server/process: Use the setFeatures command on the server instead of =
a mange
=20=20server/process: Deal more gracefully with SIGTERM
=20=20cooker: Handle SIGTERM more gracefully
=20=20providers/runqueue/taskdata: Optimise logger.debug calls
=20=20knotty: Add missing continue statement for runQueueExitWait event
=20=20knotty: Remove latency when exiting
=20=20server/process: Use a pipe for quit events instead of Event()
=20=20server/process: Drop unnecessary exit delay
=20=20server/process: Optimise latency when finishing idle functions
=20=20runqueue: Use SIGCHLD instead of polling waitpid
=20=20bitbake-worker: Ensure children have default sigterm handler
=20=20runqueue: Improve sigchld handler

Ross Burton (1):
=20=20bitbake: fix typo in variable name

Scott Rifenbark (34):
=20=20user-manual-metadata.xml: Edits to "Sharing Functionality"
=20=20user-manual-ref-variables.xml: Edits to BBCLASSEXTEND.
=20=20user-manual-ref-variables.xml: Edits to SRC_URI.
=20=20user-manual-metadata.xml: Rewrite of the "Functions" section.
=20=20user-manual-metadata.xml: Rewrite of the "Tasks" section.
=20=20user-manual-metadata.xml: Edits to "Variable Flags" section
=20=20user-manual-metadata.xml: General cleanup to "Parsing and Execution"
=20=20user-manual-metadata.xml: Re-write of "Events" section.
=20=20user-manual-ref-variables.xml: Added BBVERSIONS variable.
=20=20user-manual-metadata.xml: Re-write of "Variants - Class Extension =
Mechanism"
=20=20user-manual-metadata.xml: Re-write the "Dependencies" section.
=20=20user-manual-metadata.xml: Rewrite "Accessing Datastore Variables =
Using Pytho
=20=20user-manual-metadata.xml: WIP - Some edits in the checksum area.
=20=20user-manual-ref-variables.xml: Added a note qualifying the variables.
=20=20user-manual-intro.xml: Added an introduction to the manual.
=20=20user-manual: Added new chapter to cover BB execution.
=20=20user-manual-fetching.xml: Re-write of "File Download Support" chapter.
=20=20user-manual-bitbakecommand.xml: Added anchor tag for the chapter.
=20=20user-manual-intro.xml: Added sections
=20=20user-manual-execution.xml: Draft of "Execution" chapter
=20=20user-manual-intro.xml: Review edits to Introduction chapter.
=20=20user-manual-execution.xml: Review edits applied.
=20=20user-manual-fetching.xml: Removed a link.
=20=20user-manual-metadata.xml: Title change, sections lifted.
=20=20user-manual-fetching.xml: Re-write of the Fetching chapter.
=20=20user-manual: Added "Hello World" Appendix.
=20=20user-manual: Review edits from Richard (second draft)
=20=20user-manual-execution.xml: Review edits for "Execution" chapter.
=20=20user-manual-metadata.xml: Grammar fix.
=20=20user-manual-metadata.xml: Added BB_ORIGENV example.
=20=20user-manual-ref-variables.xml: Edits to BB_GENERATE_MIRROR_TARBALLS =
variable
=20=20user-manual: removed SVK references - all types.
=20=20user-manual: Review edits applied from Paul Eggleton.
=20=20user-manual: Review edits applied throughout from Paul Eggleton.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Chen Qi (1):
=20=20e2fsprogs: fix cross compilation problem

Chong Lu (2):
=20=20ltp: Don't link against libfl
=20=20diffutils: enable ptest support

Gary Thomas (3):
=20=20oe-init-build-env: Improve script sourcing detection.
=20=20scripts/oe-setup-builddir: Keep track of TEMPLATECONF setting
=20=20.templateconf: New file for customized template defaults

Jo=C3=A3o Henrique Ferreira de Freitas (1):
=20=20wic: Use mke2fs to create the ext2/3/4 image

Khem Raj (2):
=20=20eglibc: Fix build for FSL ppc/fpu
=20=20eglibc: Update SRC_URI to point to final download location

Lauren Post (1):
=20=20mtd-utils: Update version to include fixes after 1.5.0

Laurentiu Palcu (3):
=20=20xf86-video-intel: add recipe for 2.99.910, remove the git one
=20=20buildhistory.bbclass: Fix dependency files creation
=20=20populate_sdk_*.bbclass: remove old rootfs_list_installed_depends()

Martin Jansa (1):
=20=20libsdl: bump PR

Matthieu Crapet (1):
=20=20oe-setup-builddir: small rework

Ming Liu (1):
=20=20kernel-yocto: replace '=3D' with '+=3D'

Paul Eggleton (1):
=20=20classes/sstate: don't overwrite buildhistory vardepsexclude

Ricardo Ribalda Delgado (2):
=20=20package_deb: Map TARGET_ARCH x86_64 to DPKG_ARCH amd64
=20=20populate_sdk_deb: Fix meta-toolchain-sdk with amd64 ARCH

Ross Burton (1):
=20=20gnomebase: remove trailing whitespace

Saul Wold (4):
=20=20util-linux: Update to 2.24.1
=20=20dhcp: Update to 4.3.0
=20=20bind: Update to 9.9.5
=20=20btrfs: patch to allow for relative paths

Stefan Stanacar (9):
=20=20oeqa/utils/qemurunner: use the right kill call so we don't send =
SIGTERM to b
=20=20oeqa/targetcontrol: allow a custom port for SimpleRemoteTarget
=20=20oeqa/targetcontrol: fix loading a controller using a class name
=20=20oeqa/utils/qemurunner: search for login string in the entire boot log
=20=20recipes-bsp: add gnu-efi recipe
=20=20recipes-bsp: Add gummiboot recipe
=20=20bootimg/grub-efi.bbclass: allow using a different class for EFI images
=20=20classes: Add gummiboot class
=20=20lsbtest: fix comparison bashism

S=C3=A9bastien Mennetrier (1):
=20=20Create gstreamer-1.0 package groups

Tom Zanussi (1):
=20=20wic: Use pseudo for ext mkfs command

Tudor Florea (1):
=20=20ptest: Don't enable ptest for nativesdk and cross-canadian packages

Wenzong Fan (1):
=20=20dmidecode: add powerpc to compatible host

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Fathi Boudra (1):
=20=20fwts: update to 14.02.00 release

Hongxu Jia (1):
=20=20netcf: fix offline rebuilding failed

Jackie Huang (1):
=20=20strongswan: update verion to 5.1.1

Javier Viguera (1):
=20=20crda: fix udev rule

Jonathan Liu (1):
=20=20fbgrab: fix installed but not shipped warnings

Lauren Post (5):
=20=20linuxptp: Create 1.4 version
=20=20vlan: Create 1.9 version
=20=20obexftp: Create 0.23 version
=20=20openobex: Remove --enable-dump to disable dumping
=20=20gtkperf: Create 0.40 version

Liang Li (1):
=20=20radvd: eliminate confusing warnings when stop service

Martin Jansa (3):
=20=20xf86-video-geode: Move to nonworking
=20=20dhcp: Rename .bbappend to match any version from oe-core
=20=20util-linux: Rename .bbappend to match any version from oe-core and =
remove uu

Matthieu CRAPET (3):
=20=20xdelta3: add new recipe for version 3.0.8
=20=20fbida 2.09: cleanups and use PACKAGECONFIG
=20=20fim: add new recipe for version 0.4-rc1

Nick Lewis (1):
=20=20libxml++: Upgrade to 2.37.1 and add ptest support

Paul Barker (1):
=20=20ipsec-tools: Don't link against libfl

Robert Yang (1):
=20=20dovecot: fix the DEPENDS on lzma

Roy Li (1):
=20=20bridge-utils: fix the no brctl error when enable multilib

Tim Orling (2):
=20=20libdvdcss: update to 1.2.13
=20=20live555: update to 2013.04.30

Xufeng Zhang (2):
=20=20ntp: Running ntpd daemon as ntp:ntp
=20=20ntp: Moving relevant files from /usr/bin to /usr/sbin

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (5):
=20=20openssh: Tweak sshd_config to tackle for PAM taking care of =
authentication
=20=20libpam: Disable nullok_secure
=20=20angstrom-next: Use gold for linker eglibc based images for arm/x86
=20=20Symlink /var/run to /run
=20=20recipes-tweaks: Use wildcard for openssl bbappend

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

Javier Viguera (1):
=20=20mfgtool-initramfs-image.bbclass: rename PACKAGE_GROUP to =
FEATURE_PACKAGES

Otavio Salvador (9):
=20=20linux-fslc (3.12): Update to 3.12.13 stable release
=20=20image_types_fsl: Use explicit task dependency to boost build
=20=20amd-gpu-x11-bin: Add pkgconfig files for EGL and OpenGL ES 2
=20=20qtbase: Disable eglfs build for i.MX6 SoCs using X11
=20=20clutter-1.0: Rename bbappend to generic version
=20=20cogl-1.0: Rename bbappend to generic version
=20=20linux-fslc: Update to 3.14-rc6
=20=20linux-imx: Use 3.10.17 as default
=20=20linux-imx (3.0.35): Drop recipe from base BSP

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Otavio Salvador (2):
=20=20linux-congatec: Avoid depending on meta-fsl-arm's linux-imx
=20=20linux-imx (2.6.35.3): Removal as it is unused

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

Darren Hart (14):
=20=20intel-core*: Add Xserver drivers
=20=20intel-core*: Add default serial console
=20=20intel-core*: Add common MACHINE_* values
=20=20intel-common: Add a README
=20=20Use intel-common-pkgarch for non-emgd BSPs
=20=20Remove linux-yocto 3.4 bbappends
=20=20Remove linux-yocto 3.8 bbappends
=20=20Remove linux-yocto rt and tiny 3.4 recipes
=20=20fri2: Update linux-yocto-tiny recipe
=20=20Update linux-yocto-rt 3.8 to 3.10
=20=20linux-yocto-rt: Add intel-common linux-yocto-rt 3.10 bbappend
=20=20linux-yocto: Remove redundant recipes
=20=20crownbay: linux-yocto_3.10 SRCREV update (3.10.32, LTSI Update)
=20=20intel-common: Add nuc to the README

Laurentiu Palcu (2):
=20=20intel-gpu-tools: upgrade to 1.5
=20=20libva-intel-driver: upgrade to 1.2.2

Nitin A Kamble (3):
=20=20libva_1.0.16: Fix a QA issue in do_configure
=20=20lms7: update the source download URL
=20=20nuc BSP: include AMT 8+ support

Stefan Stanacar (1):
=20=20common/recipes-bsp: remove gnu-efi and gummiboot recipes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Alex J Lennon (1):
=20=20mono-native: Fix build failure on x64 host systems

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

Jonathan Liu (1):
=20=20licenses: rename NOKIA-TPLA-2.4 to DIGIA-TPLA-2.4

Khem Raj (1):
=20=20licenses: Fix WARNING: qt3d: No generic license file exists for: =
PREVIEW.COM

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Gayathri Srinivasan (1):
=20=20meta-webos: pmloglib=3D52,v3.1.0

Herb Kuta (1):
=20=20webos.inc: Use WEBOS_DISTRO_BRANCHPOINT_MICRO_VERSION in image =
filenames

Martin Jansa (2):
=20=20cmake: Upgrade to v2.8.10.2 from oe-core
=20=20psmisc: Add ${S} to sed call to support separate build directory

Nikolay Orliuk (1):
=20=20meta-webos: libpbnjson=3D30,v2.5.0 luna-service2=3D176,v3.7.0

Sergiy Kryvonos (1):
=20=20webos-image: luna-init=3D8-r11

Susan Montooth (1):
=20=20Revert "webos-image: nodejs=3Dv0.10.25"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (15):
=20=20boards/common/zynq-7-base.dtsi: Fixup interrupt mapping
=20=20zedboard-zynq7: Cleaned up device trees and configuration
=20=20zc702-zynq7: Cleaned up device trees and configuration
=20=20zc706-zynq7: Cleaned up device trees and configuration
=20=20docs/BOOT.sdcard: Update documentation for sd booting
=20=20linux-yocto: Drop linux-yocto 3.8 support
=20=20boards/common: Re-organize defconfig paths
=20=20linux-yocto: Add 3.10 support for MicroBlaze and Zynq
=20=20linux-yocto-dev: Add support for MicroBlaze and Zynq
=20=20machine/include/tune-*: Fix up KMACHINE definitions
=20=20machine-xilinx-default.inc: Fix up preferred versions for linux-yocto
=20=20boards/common/zynq-7-mainline-gem.dtsi: Added include
=20=20zc702-zynq7: Added zc702-zynq7-yocto.dts for linux-yocto
=20=20zc706-zynq7: Added zc706-zynq7-yocto.dts for linux-yocto
=20=20zedboard-zynq7: Added zedboard-zynq7-yocto.dts for linux-yocto

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Gary Thomas (1):
=20=20.templateconf: New file for customized template defaults

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



