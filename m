Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1933865CED;
	Tue, 11 Nov 2014 12:43:45 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id x19so11299229ier.33
	for <multiple recipients>; Tue, 11 Nov 2014 04:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=3AVQuPUXNyyyQsUR14GksPWCZjzm3x1Y6wm9+uZ6bBc=;
	b=cHEDTvscZZbJGv6C5ONfTsefyzxyjleNEL7UvmQTJkdez3OBvrOWO8ISjwgremxWh8
	Z3b7C1LFamLJNB9fXn0JAJJ7Rnp5hFBcFrZssBkdV5ETvVFp7SbYHZJEaOSl5jnFaFP3
	bCx8/gduNZoCrPO9WbWZfYnGfyNacF+Qs2hIf4wx+Ioaa2wt8mxFOt/ZbPVdQU+fr/bs
	KUgL/zJ/kATMbVmJD+4noGm+kfp2kbbrD1OXFpYT4IYwd7JYiE6m/HH8zbTIrpuziIn0
	Z2z1LjNWZBJf07AKD8vjFsAEsTxiCYY8BHgfsb368tAeKpUXjQBhbXMMAjQNQzEtqaXp
	vibw==
X-Received: by 10.42.212.83 with SMTP id gr19mr211810icb.95.1415709825412;
	Tue, 11 Nov 2014 04:43:45 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-105.doycomm.com.
	[66.219.191.105])
	by mx.google.com with ESMTPSA id t1sm8299278ioe.17.2014.11.11.04.43.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Nov 2014 04:43:44 -0800 (PST)
Date: Tue, 11 Nov 2014 04:43:44 -0800 (PST)
X-Google-Original-Date: Tue, 11 Nov 2014 12:43:42 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1415709822982.e765e65a@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-11-02 until 2014-11-09
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
X-List-Received-Date: Tue, 11 Nov 2014 12:43:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-11-02 until 2014-11-09.  Projects included in this =
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

Alexandru DAMIAN (2):
=20=20toasterui: improvements in data reading
=20=20toastergui: fix invalid build url usage

An=C3=ADbal Lim=C3=B3n (1):
=20=20bs4: Add beautifulsoup 4.3.2 to assist the fetcher

Fredrik Svensson (1):
=20=20fetch2/git: Allow other namespaces than refs/heads to be searched.

Gary Thomas (1):
=20=20bitbake: Make printed 'runqueue' be consistently capitalized

Richard Purdie (5):
=20=20prserv/serv: Ensure sync happens in the correct thread
=20=20prserv: Use WAL mode
=20=20siggen: Ensure we output if the ordering of runtaskdeps changes
=20=20siggen: Add computed hash code to verify hash computation to dumpsig
=20=20siggen: Fix shared work checksum mismatch/rebuild issues

Stefan M=C3=BCller-Klieser (1):
=20=20data_smart.py: fix variable splitting at _remove mechanism

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (1):
=20=20image-buildinfo.bbclass: new class, writes build information to image

Alexandru DAMIAN (1):
=20=20toaster.bbclass: read elapsed time from the stats file

Andreas M=C3=BCller (1):
=20=20gdb-cross: build with python support

An=C3=ADbal Lim=C3=B3n (2):
=20=20perl: Fix bug when installs SDK in custom directory
=20=20package_manager: DpkgPM fix populate_sdk

Armin Kuster (4):
=20=20tzcode: update to 2014i
=20=20tzdata: update to 2014i
=20=20pinentry: update 0.9
=20=20lz4: update to version r123

Bogdan Purcareata (1):
=20=20shadow: enable support for subordinate IDs

Chen Qi (2):
=20=20bind: fix to use correct environment file in service file
=20=20nfs-utils: change owner/group of directories in do_install

Chong Lu (11):
=20=20xinetd: add systemd unit file
=20=20kmod: fix debuginfo is missing in shared library
=20=20curl: Security Advisory - curl - CVE-2014-3613
=20=20docbook-xsl-stylesheets: add perl to RDEPENDS
=20=20curl: Security Advisory - curl - CVE-2014-3620
=20=20gst-plugin-bluetooth: remove systemd service file
=20=20insane.bbclass: add condition for build-deps
=20=20libpcre: Upgrade to 8.36
=20=20byacc: Upgrade to 20140715
=20=20strace: Upgrade to 4.9
=20=20tcl: Upgrade to 8.6.2

Cristian Iorga (2):
=20=20connman: upgrade to 1.26
=20=20qemu: upgrade to 2.1.2

Denys Dmytriyenko (3):
=20=20libinput: add 0.6.0 version
=20=20wayland: update version to 1.6.0
=20=20weston: update to version 1.6.0, add libinput PACKAGECONFIG

Fathi Boudra (1):
=20=20ltp: update to 20140828 release

Gary Thomas (2):
=20=20python-pygtk: Restore pkg-config file
=20=20python-pygtk: Clean up incorrect "fix"

Hongxu Jia (7):
=20=20classes/image: remove obsolete MULTILIB_VENDORS
=20=20multilib.bbclass: fix incorrect TARGET_VENDOR in multilib image
=20=20opkg: fix remove pkg with --force-removal-of-dependent-packages failed
=20=20multilib.bbclass/package_manager.py: fix <multilib>-meta-toolchain =
build fai
=20=20man-pages/shadow: resolve man pages confliction
=20=20python-smartpm: report warn rather than error during install with =
--attempt
=20=20rootfs.py: tweak inner warn message catching

Jackie Huang (4):
=20=20license.bbclass: canonicalise the licenses named with 'X+'
=20=20packagegroup-self-hosted: add git-perltools
=20=20gcc: backport two patches to fix ICE in dwarf2out_var_location
=20=20perl: set the perl libraries search path

Jason Wessel (1):
=20=20ncurses, busybox, cml1.bbclass: Fix menuconfig display corruption

Johan Hovold (1):
=20=20udev: fix uevent-helper disable

Kai Kang (1):
=20=20python-2.7.3:remove BOM insertion code

Mark Hatle (1):
=20=20gcc: Fix intermittent failures during configure

Martin Jansa (1):
=20=20systemd: don't move libgudev around, it breaks libgudev-1.0.la

Ming Liu (1):
=20=20pciutils: Fix multilib header conflict - pci/config.h

Pascal Bach (1):
=20=20image_types.bbclass: Make ubi depend on ubifs

Paul Barker (2):
=20=20mc: Update patch status
=20=20package_manager: Fix BAD_RECOMMENDATIONS for opkg

Paul Eggleton (2):
=20=20wget: upgrade to 1.16
=20=20psplash: update to latest git version

Peter A. Bigot (1):
=20=20image_types.bbclass: whitespace and reorder

Ricardo Ribalda Delgado (2):
=20=20debianutils: Add recipe from meta-oe
=20=20apt: Add missing running depency debianutils

Richard Purdie (12):
=20=20nasm: 2.11.05 -> 2.11.06
=20=20libunistring: 0.9.3 -> 0.9.4
=20=20python-pycurl: 7.19.3.1 -> 7.19.5
=20=20mdadm: 3.3.1 -> 3.3.2
=20=20kexec-tools: 2.0.7 -> 2.0.8
=20=20subversion: 1.8.9 -> 1.8.10
=20=20base: Improve makefile clean handling, introduce CLEANBROKEN variable
=20=20perl: Enable rebuilds to account for configuration changes
=20=20base: Make PRINC warning an error
=20=20package/prserv: Merge two similar functions into one
=20=20gdb: 7.7.1 -> 7.8.1
=20=20oprofile: 0.9.9 -> 1.0.0

Richard Tollerton (1):
=20=20populate_sdk_base: improve POSIXLY_CORRECT compat

Ross Burton (3):
=20=20systemd: don't add files and dependencies from units Conflicts
=20=20buildtools-tarball: package all of Python
=20=20acl: add acl dependency to acl-ptest

Roy Li (2):
=20=20python3: do not replace ccache in the middle of a path
=20=20texinfo: integrate texinfo 4.8

Roy.Li (1):
=20=20iproute2: backport a patch to make adding vxlan link success

Saul Wold (21):
=20=20vala: Update to 0.24.0
=20=20findutils: Upgrade to 4.5.14
=20=20nss: Upgrade to 3.17
=20=20readline: Patch for readline multikey dispatch issue
=20=20libcap: Upgrade to 2.24
=20=20btrfs: Update to 3.17 version
=20=20npth: Upgrade to 1.0
=20=20liburcu: Ugrade to 0.8.5
=20=20libgcrypt: Ugrade to 1.6.2
=20=20libksba: Ugrade to 1.3.1
=20=20systemtap: Upgrade to 2.6 Git Version
=20=20libxkbcommon: Upgrade to 0.5.0
=20=20resolvconf: Upgrade to 1.76
=20=20at: Upgrade to 3.1.16
=20=20cups: Upgrade to 2.0.0
=20=20help2man: Upgrade to 1.46.4
=20=20hdparm: Upgrade to 9.45
=20=20less: Upgrade to 470
=20=20lsbinitscripts: Upgrade to 9.56.1
=20=20man-pages: Upgrade to 3.75
=20=20watchdog: Upgrade to 5.14

Shan Hai (1):
=20=20ldconfig-native: fix a endian-ness bug

Yuanjie Huang (1):
=20=20mtd-utils: Fix alignment trap triggered by NEON instructions

Yue Tao (2):
=20=20subversion: Security Advisory - subversion - CVE-2014-3522
=20=20subversion: Security Advisory - subversion - CVE-2014-3528

yadi.hu@windriver.com (1):
=20=20BusyBox: Fixing broadcast address is not fed and rightly initialized

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Anders Darander (1):
=20=20breakpad: correct the file suffix of the symbol file

Chen Qi (4):
=20=20ntp: make daemon run under ntp:ntp
=20=20mariadb: change socket location in my.cnf
=20=20mariadb: use ${PN} for SYSTEMD_AUTO_ENABLE
=20=20krb5: add initscripts-functions to RDEPENDS

Chong Lu (3):
=20=20ntp: add sntp.service for sntp package
=20=20polarssl: set LIB_INSTALL_DIR to baselib
=20=20squid: change ksh reference in krb ldap helper to sh

Jackie Huang (2):
=20=20vpnc: use nativeperl to run perl scripts
=20=20samba: make build deterministic by adding PACKAGECONFIG for valgrind

Kang Kai (8):
=20=20postgresql: add fix for CVE-2014-0064 Security Advisory
=20=20postgresql: add fix for CVE-2014-0060 Security Advisory
=20=20postgresql: add fix for CVE-2014-0061 Security Advisory
=20=20postgresql: add fix for CVE-2014-0062 Security Advisory
=20=20postgresql: add fix for CVE-2014-0063 Security Advisory
=20=20postgresql: add fix for CVE-2014-0067 Security Advisory
=20=20postgresql: add fix for CVE-2014-0065 and CVE-2014-0066 Security =
Advisory
=20=20libyaml: add fix for CVE-2014-2525 Security Advisory

Roy Li (1):
=20=20net-snmp: fix for Security Advisory - CVE-2014-3565

Yue Tao (1):
=20=20fftw: s/PN/BPN/

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (3):
=20=20angstrom.inc: drop virtual/libgl override, the default now works
=20=20openssh: fix login problems
=20=20openssh bbappend: remove duplicate patch

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (2):
=20=20packagegroup*: fix recipes for machine-specific requirement
=20=20gstreamer-mm-accel: improve packaging and avoid conflicts with =
non-accel ver

Jacob Stiffler (1):
=20=20packagegroup-arago-tisdk-multimedia: Correct 'MACHINE_FEATURE' typo.

Karthik Ramanan (4):
=20=20wayland: Introduce 1.3.0 for DRM based backend
=20=20wayland: GLSDK specific adaptions
=20=20weston: version 1.3.0 for DRM backend
=20=20weston: v1.3.0 for DRM based backend (additional patches)

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

Andreas M=C3=BCller (1):
=20=20efl: rename bbappend to match future versions

Chunrong Guo (5):
=20=20linux-ls1: Update to 3ced9e8 revision
=20=20rcw : Update to 38ec2c9 revision
=20=20u-boot-ls1: Update to 50d6848 revision
=20=20ls1021atwr: update UBOOT_CONFIG and device tree
=20=20ls1021aqds: update UBOOT_CONFIG and device tree

Javier Viguera (1):
=20=20gpu-viv-g2d: fix file ownership in packages

Lauren Post (5):
=20=20linux-imx: Upgrade to 3.10.17-1.0.2 patch release
=20=20u-boot-imx: Upgrade to 3.10.17-1.0.2 patch release
=20=20gpu-viv-bin-mx6q: Upgrade to 3.10.17-1.0.2 patch release
=20=20gpu-viv-g2d: Upgrade to 3.10.17-1.0.2 patch release
=20=20xf86-video-imxfb-vivante: Upgrade to 3.10.17-1.0.2 patch release

Otavio Salvador (3):
=20=20efl: Avoid applying the patch for non-i.MX6 machines
=20=20README: Update for Dizzy release
=20=20README: Update branches to master for development

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Eric Nelson (1):
=20=20linux-boundary: Upgrade to 3.10.17_1.0.2 patch release (commit =
f7a1e187)

Fabio Estevam (1):
=20=20m28evk: Remove double inclusion of KERNEL_IMAGETYPE

Otavio Salvador (2):
=20=20README: Update for Dizzy release
=20=20README: Update branches to master for development

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (1):
=20=20omap3-sgx-modules: remove bbappend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (1):
=20=20common: Update linux-yocto_3.17 SRCREVs to v3.17.1

Ross Burton (1):
=20=20common:Add missing build-dependencies for intel-gpu-tools

Tom Zanussi (1):
=20=20common: Remove DPDK recipes

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

Martin Jansa (3):
=20=20meta-acer: Update README

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (1):
=20=20dra7xx: add "mmip" to MACHINE_FEATURES

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (6):
=20=20zynq7-base.dtsi: Remove unused properties
=20=20linux-xlnx_3.14: Add patch for USB PHY reset during probe
=20=20boards/*.dtsi: Fix up USB PHY reset nodes
=20=20external-xilinx-toolchain: Fix up PREFERRED_PROVIDER for glibc
=20=20external-xilinx-toolchain: Fix up RDEPENDS for ldd and tzcode
=20=20zc706-zynq7: Fix up URLs in the comments

Philip Balister (1):
=20=20u-boot-xlnx : Add uEnv.txt for zc702 so it boots from SD card.

Yasir-Khan (1):
=20=20layer.conf: correct BBFILES append

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Paul Eggleton (1):
=20=20poky-tiny.conf: remove inherit of blacklist

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



