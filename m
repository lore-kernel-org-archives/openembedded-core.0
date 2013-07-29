Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 115ED6B42D;
	Mon, 29 Jul 2013 17:53:26 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1V3rYL-000522-H4; Mon, 29 Jul 2013 13:48:22 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 29 Jul 2013 17:53:09 GMT
Message-Id: <1375120389921.a5c31217@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-07-21 until 2013-07-28
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
X-List-Received-Date: Mon, 29 Jul 2013 17:53:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-07-21 until 2013-07-28.  Projects included in this =
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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru DAMIAN (1):
=20=20weston: add pango dependency

Andreas M=C3=BCller (1):
=20=20package.bbclass: avoid packing debug sources from other packages

Andrei Dinu (1):
=20=20openssh: Added Upstream Status to openssh-CVE-2011-4327

Andr=C3=A9 Draszik (1):
=20=20directfb: don't patch pkg-config files

Beth Flanagan (1):
=20=20adt_installer_internal: fix spelling error

Bruce Ashfield (1):
=20=20linux-yocto/3.8: revert .gitignore: do not ignore meta directory

Chen Qi (5):
=20=20useradd.bbclass: add a new base class and code refactor
=20=20extrausers.bbclass: add a new bbclass
=20=20run-postinsts: fix comment
=20=20run-postinsts: add more logging to the log file to make things clearer
=20=20rpm: remove the obsolete rpm-postinsts.bb

Cristian Iorga (2):
=20=20connman: upgrade to v1.16
=20=20pulseaudio: upgrade to v4.0

Daniel Nilsson (1):
=20=20glew: Update GLEW version number in autotools patch

Emilia Ciobanu (3):
=20=20kmod:add GIT revision to PV variable
=20=20lttng-modules: Append _git to recipe name and add GIT revision to PV  =
   var
=20=20docbook-sgml-dtd-4.5-native.bb: Add real PV inside the recipe

Fathi Boudra (1):
=20=20dmidecode: add aarch64 and arm to compatible host

Gabriel Barbu (1):
=20=20strace: Add ptest

Hongxu Jia (4):
=20=20readline: fix importing readline in python with probably escape =
sequence out
=20=20nss:fix postinst failed at rootfs time
=20=20lsbinitscripts: remove x permission on functions
=20=20sysvinit: pidof add -m option for lsbinitscripts

Ionut Radu (7):
=20=20useradd.bbclass: fix traceback when inheriting useradd but not =
setting USERA
=20=20libxfont: Update from 1.4.5 to 1.4.6
=20=20libxrandr: Update from 1.4.0 to 1.4.1
=20=20libxxf86dga: Updated from 1.1.3 to 1.1.4
=20=20libuser: Updated from 0.58 to 0.59
=20=20videoproto: Update from 2.3.1 to 2.3.2
=20=20apt:  Add Upstream Status to patches

Jackie Huang (1):
=20=20dbus: add -o option into start-stop-daemon arguments

Jesse Zhang (1):
=20=20tremor: add a patch to build with arm thumb

Jim Somerville (1):
=20=20rt-tests: add Upstream-Status for cyclictest patch

Jonathan Liu (6):
=20=20systemd: remove unneeded modprobe.rules
=20=20mesa: upgrade to 9.1.5
=20=20wget: backport fixes for documentation build errors
=20=20mesa: use LLVM 3.3 by default
=20=20boot-directdisk: use awk instead of echo -ne for dash compatibility
=20=20gcc-4.8: fix compiling GCC when /usr/lib/libstdc++.so is present

Koen Kooi (1):
=20=20util-linux: fix PACKAGECONFIG options

Laurentiu Palcu (2):
=20=20elfutils: fix backends' Makefile.am
=20=20xinput-calibrator: move it from meta-oe to oe-core

Martin Jansa (25):
=20=20gst-plugins-good: add PACKAGECONFIG for jack
=20=20gst-plugins-ugly: add PACKAGECONFIG for x264, cdio, dvdread
=20=20pulseaudio: add PACKAGECONFIG for jack
=20=20subversion: add PACKAGECONFIG for sasl
=20=20cups: add PACKAGECONFIG for avahi
=20=20mesa: add Upstream-Status
=20=20test-dependencies: add simple script to detect missing or autoenabled =
depend
=20=20gst-plugins-bad: add few more PACKAGECONFIGs
=20=20xkeyboard-config: add missing dependency on util-macros
=20=20ccache: add zlib dependency
=20=20cups: add PACKAGECONFIG for acl
=20=20directfb: add PACKAGECONFIG for jpeg2000
=20=20distcc: add PACKAGECONFIG for popt
=20=20grub: add PACKAGECONFIG for grub-mount
=20=20mailx: remove support for autodetection of krb5
=20=20minicom: add configure option and PACKAGECONFIG for lockdev
=20=20ltp: add acl, openssl dependency
=20=20patch: add PACKAGECONFIG for attr
=20=20python-imaging: add PACKAGECONFIG for lcms
=20=20socat: add PACKAGECONFIG for tcp-wrappers
=20=20sudo: add PACKAGECONFIG for zlib
=20=20gstreamer1.0-plugins-good: add PACKAGECONFIG for v4l
=20=20gst-plugins-good: add PACKAGECONFIG for jpeg, wavpack, gdkpixbuf, =
v4l, bzip2
=20=20gettext: disable nls when INHIBIT_DEFAULT_DEPS is set
=20=20mesa: add PACKAGEs and PACKAGECONFIG for xvmc

Ming Liu (1):
=20=20libpam: add a new 'nullok_secure' option support to pam_unix

Muhammad Shakeel (2):
=20=20systemd: Remove systemd_unitdir if systemd is not in distro features
=20=20bash: Add ptest

Olof Johansson (1):
=20=20cpan.bbclass: Fail unless Makefile.PL generates Makefile

Paul Eggleton (4):
=20=20python-smartpm: fix sometimes reporting no provider instead of =
conflict
=20=20python-smartpm: add ignore-recommends package flag
=20=20classes/image: ensure BAD_RECOMMENDATIONS supports pre-renamed =
package names
=20=20classes/rootfs_rpm: implement BAD_RECOMMENDATIONS for RPM

Petter Mab=C3=A4cker (1):
=20=20remake: fix insufficient gettext dependency

Ross Burton (3):
=20=20initrdscripts: mount / as read-only when live-booting
=20=20sanity.bbclass: mention version when erroring on LCONF_VERSION =
mismatch
=20=20Revert "initrdscripts: mount / as read-only when live-booting"

Roy.Li (1):
=20=20qemu: block to build it on mips64 arch

Saul Wold (6):
=20=20pigz: Fix typo in ALTERNATIVES line
=20=20consolekit: Update to 0.4.6
=20=20mklibs-native: Update to 0.1.38
=20=20cups: Update to 1.6.3
=20=20ptest: fix Upstream-status
=20=20external-sourcery: add missing providers

Simon Busch (1):
=20=20wpa-supplicant: enable required configuration options for connman

Tudor Florea (2):
=20=20python: Add ptest
=20=20kmod: Add ptest

Yi Zhao (2):
=20=20LSB_Test.sh: add -f option for curl
=20=20scripts/create-lsb-image: remove

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Jonathan Liu (1):
=20=20qt-creator: upgrade to 2.8.0

Khem Raj (1):
=20=20proxy-libintl: Put .a in -dev package and allow empty main package

Paul Eggleton (3):
=20=20protobuf: add recipe from meta-virtualization and tweak
=20=20libio-pty-perl: add from OE-Classic and update
=20=20mosh: add new recipe for version 1.2.4

Riku Voipio (1):
=20=20apache2: move pidfile to run

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (1):
=20=20gnutls: update bbappend to the latest version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (4):
=20=20linux-mainline 3.8: add support for am335x bandgap sensor
=20=20contrib: bone-flash-tool: port emmc image script fixes over to mmc =
script
=20=20linux-mainline 3.8: add support for PCA9685 PWM chips
=20=20linux-mainline 3.8: add cape priorities

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

Abhijit Potnis (1):
=20=20gpu-viv-bin-mx6q: Adding support to install Wayland GPU libs

Lauren Post (1):
=20=20linux-imx.inc: Add recursive copy to ensure uapi is included

Otavio Salvador (6):
=20=20firmware-imx: Fix rootfs generation for 'dev-pkgs' image feature
=20=20mesa: Follow OE-Core update to 9.1.5
=20=20u-boot-fslc: Update to cba5372 revision
=20=20gpu-viv-bin-mx6q.inc: Make mesa dependency conditional for x11
=20=20mesa: Don't fail if libGL is not build
=20=20gpu-viv-bin-mx6q.inc: Add libEGL.so in libegl-mx6

Samuli Piippo (1):
=20=20gpu-viv-bin-mx6q: move EGL and KHR headers to libegl-mx6-dev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

John Weber (1):
=20=20linux-wandboard: update recipe to use SRCREV

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Ting Liu (1):
=20=20qemu_fslgit: backport 2 patches to fix build with texinfo-5

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

Enric Balletbo i Serra (4):
=20=20conf/machine: Add new machine support for IGEP COM AQUILA AM335x
=20=20u-boot: update to 2013.07 version.
=20=20dtc: Update DTC to latest git and apply DT overlay patch
=20=20linux-igep: Add version 3.8.13-0 for IGEP COM AQUILA

Enrico Butera (1):
=20=20Merge pull request #17 from eballetbo/add-igep0033-support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (1):
=20=20sugarbay: update the kernel commit IDs of kernel branches

Ross Burton (1):
=20=20mesa: update bbappend to 9.1.5

Tom Zanussi (1):
=20=20mesa: update BSPs to current oe-core mesa version

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

Christian Gagneraud (1):
=20=20qtbase.inc: Fix qtbase-tools runtime depencency on perl

Martin Jansa (13):
=20=20qtbase: explicitly enable or disable all deps
=20=20qtjsbackend: refresh patches, move to subdirectory
=20=20qtwayland: add native recipe
=20=20qmake5_base: add override for HostLibraries
=20=20qt5: add recipes for 5.1.0
=20=20qt5: bump SRCREVs in git recipes to 5.1.0+
=20=20qtwayland: add second recipe with latest SRCREV, compatible with qt5 =
5.1.0
=20=20qt3d, qtjsondb: bump SRCREV and set MODULE_VERSION
=20=20qt5: drop INC_PR and update PR only in 5.0.2 recipes
=20=20qtimageformats: add dependency on tiff
=20=20qtwebkit: add dependency on gstreamer and libxslt
=20=20qtmultimedia: add gst-plugins-base dependency and openal PACKAGECONFIG
=20=20qtwayland: demote 5.1.0+git version a bit

Simon Busch (4):
=20=20classes: qmake5: move QT_DIR_NAME to qmake5_paths
=20=20qtbase: fix cmake files to use our host binaries
=20=20classes: add new cmake_qt5 class
=20=20qtbase: fix cmake patches to point to correct host binary directory

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (3):
=20=20rm_old_work: drop WORKDIR modification

Simon Busch (4):
=20=20meta-android: libhybris: bump SRCREV
=20=20meta-android: libhybris: enable jelly bean based linker
=20=20meta-asus/meta-samsung: set libhybris as PREFERRED_PROVIDER for =
libgles1 too
=20=20meta-android: libhybris: bump SRCREV and add dependency on =
virtual/android-h

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Daniel Gunn (1):
=20=20webos-image: librolegen=3D18,v2.1.0

Ed Chejlava (1):
=20=20app-services: Install script for upstart 1.8

Herb Kuta (1):
=20=20webos-preferred-providers: Add VIRTUAL-RUNTIME_browser_fonts

Hongjeon Ha (1):
=20=20webos-image: pmlogctl=3D13

Mark Bessey (1):
=20=20webos-image: mojoservicelauncher=3D74

Seungkyun Kim (1):
=20=20webos-image-devel: Add valgrind=3Dv3.8.1+svnr13429

Simon Busch (1):
=20=20connman: backport patch to fix autoscan behaviour

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Sipke Vriend (6):
=20=20recipes-kernel:linux-yocto Add some kernel configurations to Zynq.    =
 linux
=20=20linux-yocto: Rearranged fragments for zynq-standard into groupings.
=20=20recipes-kernel:linux-yocto: Add efi-ext.scc to zynq-standard.
=20=20recipes-kernel:linux-yocto: Rearranged fragments for zynq-tiny into =
groups.
=20=20recipes-kernel:linux-yocto-tiny: Remove a number of 'advanced' config =
    fr
=20=20recipes-kernel:linux-yocto: Remove kernel features from zynq-standard =
    ke

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



