Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 498A270EE2;
	Mon, 25 Aug 2014 22:23:05 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id at1so10529278iec.2
	for <multiple recipients>; Mon, 25 Aug 2014 15:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=Ye68Hvhln2Pi8IQDEm6LsvQ5jH01rBk4L/NNRIV9mjw=;
	b=JptA1lYXsghT9h65u77MoP0J3PFoc89qH98OYMC/m4rxu0kjklcr5Gpt5pZstHl1Og
	8njgWTB1S/gqcP890oF1I1unMqRO1pnUbOAA7ifLOfWGxOi9w/UCDrd6QxF8wFL81ZON
	nPDkUmDDhJW98pRtIxkzEU7LHv8sUY20FSssQhtVLj6je9Zy2jWpMMaX4bnoQk65lfLx
	lZKd4mQxjL4Ox0Il1hy3DbxEfvOoZyN5vWSvLmmKYhXS/vdludfpnVfhYj9tGbNrt278
	Js5e8DBFemtWBNawj0VQBXEICJWmwSq/pWxNODKRPy5haYHnMEWDR7s8y34pmDGs2y71
	G7kA==
X-Received: by 10.43.57.203 with SMTP id wh11mr8725818icb.54.1409005386175;
	Mon, 25 Aug 2014 15:23:06 -0700 (PDT)
Received: from [127.0.0.1] (cable2-pool191-cs-105.doycomm.com.
	[66.219.191.105])
	by mx.google.com with ESMTPSA id i6sm5126501igm.6.2014.08.25.15.23.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 15:23:05 -0700 (PDT)
Date: Mon, 25 Aug 2014 15:23:05 -0700 (PDT)
X-Google-Original-Date: Mon, 25 Aug 2014 22:23:03 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1409005383439.ffe035d4@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-08-17 until 2014-08-24
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
X-List-Received-Date: Mon, 25 Aug 2014 22:23:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-08-17 until 2014-08-24.  Projects included in this =
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

Andre McCurdy (1):
=20=20fetch2/local.py: fix first line indent of search path debug output

Bernhard Reutner-Fischer (1):
=20=20cooker: tweak CookerCollectFiles::find_bbfiles

Olof Johansson (1):
=20=20depexp: don't use undefined variable 'logging'

Richard Purdie (8):
=20=20process: Deal with infinite looping of the server
=20=20knotty: Improve exception handling
=20=20bitbake-worker: Improve sigterm handler
=20=20command: Trigger updateCache to shut down any active parser threads
=20=20utils: Add workaround for multiprocessing bug
=20=20process: Further improve robustness against server shutdown
=20=20siggen: Fix a subtle bug in hash calculation for shared work tasks
=20=20bitbake.conf: Drop unused MKTEMP* variables

Robert P. J. Day (5):
=20=20runqueue.py: Correct several misspellings of "notifing".
=20=20daemonize.py: Non-functional comment/aesthetic fixes.
=20=20runqueue.py: Fix typoes/grammar in comments.
=20=20lib/bb/*.py: Typo fixes/grammar/comment fixes, nothing functional.
=20=20bitbake.conf: Delete long-dead {FETCH, RESUME, UPDATE}COMMAND =
variables

Robert Yang (1):
=20=20newbb.vim: remove PR

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Armin Kuster (1):
=20=20gmp: ppc64 build issue

Bob Cochran (1):
=20=20fix up eglibc-utils description to match what is actually included

Bruce Ashfield (7):
=20=20linux-yocto: intel-common: Enable Industrial IO
=20=20linux-yocto/3.14: add ARM kprobes support
=20=20linux-yocto/3.14: update to v3.14.13
=20=20linux-yocto/3.14: KASLR and VDSO backports
=20=20linux-yocto/3.14: fix common clock framework support in PCI glue layer
=20=20linux-yocto/3.14: cgroups and hugetlb updates
=20=20linux-yocto/3.14: feature merges and configuration updates

Chen Qi (1):
=20=20sudo: remove volatile configuration file

Chong Lu (5):
=20=20librsvg: disable Bsymbolic if it is not supported on some hosts
=20=20perl: fix the output format of all tests
=20=20strace: fix ptest execution failure
=20=20mesa: fix Multilib QA Issue
=20=20expect: fix shared object file cannot be opened

Corneliu Stoicescu (4):
=20=20meta/classes/testimage.bbclass: add testsdk task and enable =
functionality fo
=20=20oeqa/oetest.py: enable sdk testing
=20=20oeqa/utils/targetbuild.py: add support for sdk tests
=20=20oeqa/sdk/: add sdk tests for sudoku, iptables and cvs

Cristian Iorga (1):
=20=20qemu: fix Darwin cross-compilation

Fahad Usman (1):
=20=20dhcp: do not use ifconfig/route in dhclient-script

Hongxu Jia (4):
=20=20bind: refer ubuntu/redhat to add bind user/group
=20=20busybox : fix do_compile failed on qemumips when DEBUG_BUILD (ICE)
=20=20puzzles: fix do_compile failed when DEBUG_BUILD
=20=20guile: workaround ice ssa corruption while DEBUG_BUILD

Jackie Huang (1):
=20=20openssl: add DEPENDS on openssl-native for rehash

Jian Liu (1):
=20=20archiver: delete the tail slash in directory name

Jonathan Liu (1):
=20=20qemu: Explicitly disable libiscsi, its not in DEPENDS

Koen Kooi (1):
=20=20nss-myhostname: fix postinst/prerm scripts

Laszlo Papp (1):
=20=20ptest-runner: return 1 instead of zero if any test fails

Maciej Borzecki (2):
=20=20wic: do not steal sectors from the first partition
=20=20wic: do not realign aligned partitions

Martin Jansa (1):
=20=20buildhistory: rename build-id to build-id.txt and add more info

Nitin A Kamble (1):
=20=20grub_2.00: strip the sparc64 files from building

Paul Barker (7):
=20=20e2fsprogs: Backport fixes for building with musl
=20=20procps: Fix musl build failure
=20=20psmisc: Fix musl build failure
=20=20ethtool: Fix musl build failure
=20=20mc: Fix musl build failure
=20=20gpgme: Add pkg-config file
=20=20opkg: Add runtime dep on gnupg if 'gpg' is in PACAKGECONFIG

Paul Eggleton (2):
=20=20classes/sstate: ensure do_package_qa_setscene doesn't pull in =
do_package_set
=20=20classes/autotools: avoid error if recipe is first in task dependency =
tree

Peter Seebach (2):
=20=20qemumips.conf: Default to (and support) mips32r2
=20=20libc-common.bbclass: rename ALL the packages

Richard Purdie (15):
=20=20site/common-darwin: Really fix common-darwin typo
=20=20oeqa/utils/httpserver: Reset SIGTERM handler
=20=20bitbake.conf: Set PACKAGE_ARCH with ??=3D
=20=20lib/oe/utils: Add utils function for multiprocess execution
=20=20package.bbclass: Fixup for using common function
=20=20packagegroup-core-tools-debug: Drop MACHINE_ARCH as PACKAGE_ARCH
=20=20bitbake.conf/debian.bbclass: Move AUTO_LIBNAME_PKGS definition to =
class file
=20=20fixup
=20=20packagegroup: Make allarch inherit conditional
=20=20allarch: Add warning about packagegroup
=20=20packagegroup: Move inherit packagegroup to after PACKAGE_ARCH
=20=20sstatesig: Only squash dependencies for allarch packagegroups
=20=20debian: Set RPROVIDES to include the original packagename when =
renaming
=20=20package: Don't remap names in packagegroup recipes
=20=20package: Disable runtime mapping of RPROVIDES/RCONFLICTS/RREPLACES

Richard Tollerton (8):
=20=20udev-cache: Update cache tarball atomically
=20=20udev-cache: Compress the cache
=20=20udev-cache: choose a more descriptive cache filename
=20=20busybox: enable `tar -m`
=20=20udev-cache: strip timestamps on extract
=20=20udev-cache: omit sockets and filesystems mounted under /dev
=20=20udev-cache: Don't ignore error messages from cache extract
=20=20udev-cache: parametrize sysconf file paths

Riku Voipio (1):
=20=20udev: fix /var/volatile/tmp permissions

Robert Yang (19):
=20=20bitbake.conf: add bash-native to ASSUME_PROVIDED
=20=20libtool: add bash to RDEPENDS_libtool
=20=20pax-utils: add bash to RDEPENDS_pax-utils
=20=20kconfig-frontends: add bash to RDEPENDS_kconfig-frontends
=20=20xmlto: add bash to RDEPENDS_xmlto
=20=20apt: add bash to RDEPENDS_apt
=20=20pm-utils: add bash to RDEPENDS_pm-utils
=20=20apr: add bash to RDEPENDS_apr-dev
=20=20dtc: add bash to RDEPENDS_dtc-misc
=20=20gst-plugins-base: add perl to RDEPENDS_gst-plugins-base-apps
=20=20rpm: add perl to RDEPENDS_rpm-build
=20=20aspell: add perl to RDEPENDS_aspell-utils
=20=20syslinux: add perl to RDEPENDS_syslinux-misc
=20=20lttng-ust: add python-core to RDEPENDS_lttng-ust-bin
=20=20xz: set CONFIG_SHELL to /bin/sh
=20=20gzip: set CONFIG_SHELL to /bin/sh
=20=20grep: set CONFIG_SHELL to /bin/sh
=20=20sanity.bbclass/kernel.bbclass: minor fixes
=20=20sanity.bbclass: check the format of MIRRORS

Saul Wold (7):
=20=20cups: Upgrade to 1.7.5
=20=20libbsd: Upgrade to 0.7.0
=20=20boost: Upgrade to 1.56.0
=20=20glew: Upgrade to 1.11.0
=20=20libidn: Upgrade to 1.29
=20=20gnupg: Upgrade to 2.0.26
=20=20sqlite3: Upgrade to 2.8.6.0

Yang Shi (1):
=20=20kernel: Prevent from installing so files into source dir

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrei Gherzan (2):
=20=20libcec: Update to v2.1.4
=20=20rtmpdump: Integrate v2.4

Ben Shelton (2):
=20=20cgdb: add recipe
=20=20mg: fix build when host system does not have libncurses-dev

Bob Cochran (1):
=20=20postgresql: Fix typo in PACKAGECONFIG[python] variable

Chen Qi (1):
=20=20hostapd: add systemd support

Denys Dmytriyenko (1):
=20=20ltp-ddt: update to the latest rev, bump the version

Hongxu Jia (1):
=20=20mariadb: refer ubuntu/redhat to add mysql group

Jackie Huang (8):
=20=20iw: uprev to version 3.15
=20=20strongswan: uprev to version 5.2.0
=20=20lmbench: Fix "make html" graph failure
=20=20lmbench: fix lmbench memory check failure
=20=20lmbench: fix doc install failure
=20=20webmin: uprev from 1.620 to 1.700
=20=20lmbench: use BPN instead of PN
=20=20lmbench: remove debianutils from RDEPENDS and add perl

Kang Kai (7):
=20=20libdigest-sha1-perl: add recipe
=20=20libdigest-hmac-perl: add recipe
=20=20libauthen-sasl-perl: add recipe
=20=20libnet-ssleay-perl: add recipe
=20=20libio-socket-ssl-perl: add recipe
=20=20libmime-types-perl: add recipe
=20=20samba: upgrade to 3.6.24

Maciej Borzecki (1):
=20=20collectd: make pinba support a selectable feature

Martin Jansa (1):
=20=20e-wm: upgrade to 0.18.8

Roy Li (3):
=20=20tcpdump: uprev it to 4.6.1
=20=20traceroute: uprev it to 2.0.20
=20=20autofs: uprev it to 5.1.0

Roy.Li (2):
=20=20wireshark: add libsmi portaudio to PACKAGECONFIG
=20=20numactl: fix the ptest

Sujith H (1):
=20=20python-pyparted: Add recipe

Tom King (1):
=20=20gypsy: fix QA issue by removing EXTRA_OECONF

Xufeng Zhang (1):
=20=20ntp: Disable debugging by default

YangHaibo (1):
=20=20fcgi: move recipe and patches to correct folder

Zhang Xiao (1):
=20=20ntp: fix CVE-2013-5211

root root (1):
=20=20oscam: fixed QA issue where binary was being stripped

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Chen Qi (2):
=20=20systemd: change dependency relationships
=20=20systemd: add volatile-binds to RDEPENDS

Koen Kooi (3):
=20=20systemd: update to v216
=20=20systemd: update to latest git for post-release fixes
=20=20contrib: angstrom feed sorter: fix corei7 arch

Peter Kjellerstedt (1):
=20=20systemd: Inherit gettext

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (1):
=20=20packagegroup-*-connectivity: disable compat-wireless due to conflict =
with ke

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Martin Jansa (4):
=20=20firefox-{l10n,addon}: Drop runtime dependency on TUNE_PKGARCH firefox =
and ke
=20=20firefox: properly fix build without freetype-config
=20=20firefox: fix build on qemux86-64
=20=20chromium-35*: use BFD when building for x86-64

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

Jun Zhu (1):
=20=20pulseaudio: Fix mutext issue when do pause in gstreamer

Mario Domenech Goulart (1):
=20=20imx-bootlets: indentation fixes and whitespace cleanup

Neena Busireddy (6):
=20=20gpu-viv-bin-mx6q: Include sololite changes to remove 3D libraries.
=20=20imx-base: Add MACHINE_ARCH filter for sololite.
=20=20mesa: Update mesa and mesa-demos to support Sololite.
=20=20cairo: Update recipe to support sololite.
=20=20glmark2: Create bbappend to include Sololite changes.
=20=20weston: Add sololite changes

Otavio Salvador (1):
=20=20linux-fslc: Update to f0539f6 revision

Tony Felice (2):
=20=20libmcc: Update to version 1.05
=20=20kernel-module-mcc: Update to version 1.06

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Simon Kuhnle (1):
=20=20linux-boundary (3.10.17): add CONFIG_USB_G_MULTI

dv@pseudoterminal.org (1):
=20=20u-boot-cubox-i: update to a06fada55a SRCREV

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Ting Liu (3):
=20=20fmlib: use SOC_FAMILY as override in do_install
=20=20conf/layer.conf: remove BB_ENV_EXTRAWHITE setting
=20=20add layer-specific bbappends when that layer is included

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

Ross Burton (1):
=20=20gstreamer-vaapi: fix builds against GStreamer 1.4

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Florin Sarbu (4):
=20=20ivi-image-demo.bb: Add the Genivi P1's and P2's to demo image.
=20=20layer.conf: Add PREFERRED_VERSION_weston to version 1.5 in demo layer.
=20=20qtwayland: Force branch 5.3 to be built
=20=20qtbase: Enable icu qtbase for qtwebkit.

George Postolache (1):
=20=20persistence-administrator: add recipe, dependencies and added to =
ivi-image-d

Holger Behrens (17):
=20=20persistence-administrator: inherit pkgconfig
=20=20persistence-common-object: inherit pkgconfig
=20=20persistence-common-object, persistence-administrator: move to meta-ivi
=20=20wireless-tools: remove from packagegroup-specific-component-p2
=20=20persistence-client-library: update to 0.9.0+04e2e006dd
=20=20persistence-administrator: add to packagegroup-abstract-component-p2
=20=20persistence-common-object: depend on glib-2.0
=20=20wayland-ivi-extension: upgrade to 1.2.0_rc6+19788f8881
=20=20local.conf.sample: align with meta-yocto version
=20=20wayland-ivi-extension: upgrade to 1.2.0_rc6+8049908e73
=20=20gstreamer: upgrade to 1.4.0
=20=20wayland-ivi-extension: upgrade to 1.2.0_rc7
=20=20persistence-client-library: upgrade to 0.9.0+58015bd30c
=20=20persistence-common-object: fix QA Issue installed but not shipped
=20=20bluez5: stay on 5.15 to support Service API
=20=20persistence-client-library: upgrade to 0.9.0+490eb4c0ae
=20=20meta-ivi: prepare 7.0.0 release

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

Andrei Gherzan (5):
=20=20firmware: Update to remote's HEAD
=20=20rpi-gpio: Update to v0.5.6
=20=20linux-raspberrypi: Update 3.12 branch to 3.12.26
=20=20linux-raspberrypi: Replace v3.14.2 by v3.16.1
=20=20omxplayer: Update to remote's HEAD

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (2):
=20=20am33x-cm3: pass float ABI flag to fix gcc-4.9.1 issue with stubs
=20=20u-boot-ti-staging: update with DRA7 and AM335 ENV/FAT/SD changes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Anatolii Sakhnik (1):
=20=20webos-image: libpbnjson=3D39,v2.9.1

Andrii Motsok (2):
=20=20webos-image: nodejs=3Dr7
=20=20webos-image: libmms=3D0webos1

Eric Blade (1):
=20=20prepare-submission.sh: Add addressed issues in message (v1.0.3)

Iurii Artemenko (1):
=20=20webos-image: lighttpd=3Dv1.4.32-0webos2

Kyrylo Kropivyanskiy (1):
=20=20webos-image: hdparm=3Dwebos2

Martin Jansa (5):
=20=20recipes: Remove RREPLACES and RCONFLICTS for old component names
=20=20prepare-submission.sh: Add --no-merges option to git log (v1.0.2)
=20=20webos_kernel_dep.bbclass: Add virtual/kernel dependency
=20=20recipes: Add missing pkgconfig inherit
=20=20e2fsprogs: Add missing colon in FILESEXTRAPATHS

Nikolay Orliuk (2):
=20=20webos-image: luna-sysservice=3D39 luna-service2=3D196
=20=20webos-image: pmloglib=3D54,v3.2.0

Oleg Yablokov (2):
=20=20webos-image: db8=3D144
=20=20webos-image: db8=3D145

Sangwoo Kang (1):
=20=20webos-image: librolegen=3D21

Susan Montooth (1):
=20=20webos-image: pmlogdaemon=3D123

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Armin Kuster (1):
=20=20nettle: add nettle to tracking

Richard Purdie (1):
=20=20poky-floating-revisions: SRCREV never worksin PREFERRED_VERSION, =
remove bad=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



