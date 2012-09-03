Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1T8YvQ-0008Es-Dm; Mon, 03 Sep 2012 17:50:56 +0200
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1T8Ycy-0007Wy-Rd; Mon, 03 Sep 2012 11:31:55 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 03 Sep 2012 15:38:25 GMT
Message-Id: <1346686705966.9de871bf@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-08-26 until 2012-09-02
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 15:50:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-08-26 until 2012-09-02.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-micro: git://git.openembedded.org/meta-micro
meta-slugos: git://github.com/kraj/meta-slugos
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-intel: git://git.yoctoproject.org/meta-intel
meta-handheld: git://git.openembedded.org/meta-handheld
meta-opie: git://git.openembedded.org/meta-opie
openembedded: git://git.openembedded.org/openembedded
meta-bug: git://github.com/buglabs/meta-bug.git
meta-efikamx: git://github.com/kraj/meta-efikamx.git
meta-gumstix: git://gitorious.org/schnitzeltony-oe-meta/meta-gumstix.git
meta-ettus: http://github.com/koenkooi/meta-ettus.git
meta-fsl-ppc: git://git.yoctoproject.org/meta-fsl-ppc
meta-igep: http://github.com/ebutera/meta-igep.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-xilinx: git://git.yoctoproject.org/meta-xilinx
meta-chicken: git://github.com/OSSystems/meta-chicken
meta-java: git://github.com/woglinde/meta-java
meta-qt3: git://git.yoctoproject.org/meta-qt3
meta-telephony: git://gitorious.org/sysmocom-openembedded/meta-telephony.git
meta-ti: git://git.yoctoproject.org/meta-ti
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-browser: git://github.com/OSSystems/meta-browser.git
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-raspberrypi: git://github.com/djwillis/meta-raspberrypi.git
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-yocto: git://git.yoctoproject.org/meta-yocto

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Richard Purdie (1):
=20=20taskdata: Don't add dependencies on tasks that don't exist

Trevor Woerner (1):
=20=20bin/bitbake: Clarify wording in help output for -s

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Christopher Larson (1):
=20=20Update lttng-2.0 versions

Constantin Musca (2):
=20=20ethtool: package update 3.4.1 -> 3.5
=20=20dpkg: upgrade to 1.16.8

Florin Sarbu (1):
=20=20intltool: Add Upstream-Status and Signed-off-by to =
remove-xml-check.patch

Kang Kai (1):
=20=20ltp: add dependency libaio

Khem Raj (5):
=20=20uclibc-git: Move to tip of master and sync mount.h
=20=20eglibc: Bring in the fix for glibc bug #14459, #14195
=20=20elfutils: Fix build on uclibc
=20=20pulseaudio: Always enable NLS
=20=20ofono: Fix build on uclibc

Marc Ferland (1):
=20=20sysstat: Explicitly disable sensors support.

Paul Eggleton (1):
=20=20gettext: bump PR to avoid RPATH QA failure

Peter Seebach (1):
=20=20runqemu-export-rootfs and friends: don't put pseudo db in target fs

Richard Purdie (11):
=20=20e2fsprogs: Fully remove/disable blkid
=20=20e2fsprogs: Drop fsck binary
=20=20udev: Drop hid2hci, its provided by bluez4 now
=20=20staging.bbclass: Might as well drop the applications, fonts and =
pixmap direc
=20=20sstate.bbclass: Detect overwriting files in sstate controlled =
directories
=20=20sstate: Ensure master.list exists if it doesn't already
=20=20nativesdk: Convert to use classextend.py
=20=20nativesdk: Switch to using nativesdk as a prefix, not a suffix
=20=20perl: Fix various nativesdk build issues
=20=20sstate.bbclass: Remove hardcoded task mappings
=20=20image.bbclass: Convert runtime_mapping_rename to event handler

Robert Yang (7):
=20=20archiver.bbclass: indent fixes
=20=20archiver.bbclass: fix the coding style
=20=20archiver.bbclass: fix the fakeroot and other issues
=20=20archiver.bbclass: remove the "upper()" function
=20=20copyleft_compliance.bbclass: remove the duplicated code
=20=20archiver.bbclass: fix the remove error
=20=20sstate-cache-management.sh: fix it for downloaded file

Ross Burton (9):
=20=20gail: remove
=20=20glib-2.0: don't disable all debugging functionality
=20=20tzdata: this package isn't architecture specific
=20=20tzdata: install /etc/localtime alongside /etc/timezone
=20=20xserver-xorg: ship the exa module in a separate package
=20=20task-core-x11: default to xserver-xorg instead of kdrive
=20=20x11-common: just support Xorg now that kdrive has been removed
=20=20x11-common: don't prune .svn directories on install, we're in git now
=20=20xserver-kdrive: remove.

Roy.Li (1):
=20=20bitbake: compile tar-replacement firstly

Sander van Grieken (1):
=20=20avahi: systemd postinst and postrm removed in favor of using =
systemd.bbclass

Saul Wold (4):
=20=20task-self-hosted: remove e2fsprogs-fsck from task list
=20=20kernelshark: remove duplicate trace-cmd plugins
=20=20connman: Don't start connmand when booting using nfsroot
=20=20eglibc: remove duplicate rquota files

Tom Zanussi (3):
=20=20ia32-base.inc: new include file
=20=20perf: add bison and flex to DEPENDS
=20=20crosstap: new script

Tomas Frydrych (1):
=20=20package.bbclass: fix stripping for kernel modules

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (5):
=20=20xfwm4: cleanup update-alternatives deprecated code
=20=20libxfce4ui: fix xfwm4 crash (no window borders) on first start
=20=20pixman: fix qemu workaround
=20=20gtk-xfce-engine: fix memory leak
=20=20gtk-xfce-engine: fix staticdev warning

Denis 'GNUtoo' Carikli (1):
=20=20meta-systemd: systemd-systemctl-native: Also add support for =
WantedBy=3D*.serv

Joe MacDonald (1):
=20=20meta-networking: add layer

Khem Raj (2):
=20=20systemd: Refresh the uclibc specific patches
=20=20gcc: Delete gcc intermediate recipes

Koen Kooi (1):
=20=20usbmuxd 1.08: add recipe to talk to iDevices

Marc Reilly (2):
=20=20qwt: fix link error when linking with ld-gold.
=20=20qwt: convert tabs to spaces.

Martin Jansa (3):
=20=20dhcp: rename .bbappend to match oe-core version
=20=20gpsd: add gpsd-machine-conf to RRECOMMENDS
=20=20gpsd-machine-conf: add empty recipe for BSP layers to bbappend it

Ross Burton (1):
=20=20meta-gnome: replace virtual/gail dependency with gtk+

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Denis 'GNUtoo' Carikli (5):
=20=20meta-samsung: systemd: fix Xorg/chvt hangup when switching console.
=20=20meta-samsung: Add the possibility to unbind crespo's console.
=20=20meta-samsung: systemd-machine-units: fix crespo booting with Xorg
=20=20meta-samsung: remove CONFIG_DEVTMPFS_MOUNT (not needed) from crespo =
kernel
=20=20meta-samsung: start fixing the disablefbcon systemd unit for crespo.

Martin Jansa (10):
=20=20aurora-daemon: add missing libfakekey dependency
=20=20README: update meta-oe/oe-core URL to github
=20=20meta-android: update README
=20=20Merge remote-tracking branch 'contrib/shr'
=20=20meta-samsung: systemd: DON'T use MACHINE variable in TUNE_PKGARCH =
recipes!
=20=20meta-samsung: systemd-machine-units: fix do_install
=20=20meta-openmoko: replace gpsd bbappend with gpsd-machine-conf recipe
=20=20meta-openmoko: gpsd-machine-conf: change to bbappend
=20=20meta-shr: no need for BAD_RECOMMENDATIONS now

Simon Busch (11):
=20=20meta-samsung: libsamsung-ipc: make git branch to build from =
exchangable
=20=20meta-samsung: samsung-tuna-firmware: copy relevant firmware binaries =
on boot
=20=20meta-samsung: rename linux-bcm4329-firmware to samsung-crespo-firmware
=20=20meta-samsung: tuna: add dependency on samsung-tuna-firmware
=20=20meta-samsung: samsung-modem-mgr: add initscript and bump PR
=20=20meta-samsung: libgles-omap4: add some more things we provide
=20=20meta-samsung: tuna: add default providers for =
virtual/{egl,libgl,libgles1,li
=20=20meta-samsung: libgles-omap4: make libdrm a build time dependency =
rather than
=20=20meta-samsung: samsung-tuna-firmware: copy NVRAM data file for =
wireless too
=20=20meta-samsung: linux-samsung-tuna: bump kernel SRCREV
=20=20meta-samsung: linux-samsung-tuna: change firmware path in defconfig =
for wifi

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

Phil Blundell (1):
=20=20busybox, eglibc: update versions for .bbappend     util-linux: delete =
.bbapp

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

Khem Raj (1):
=20=20linux-ixp4xx: Use linux.inc from meta-oe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Rahul Saxena (2):
=20=20meta-cedartrail: Update SRCREV for the linux-yocto kernel pvr branch
=20=20meta-cedartrail: Update PVR graphics driver to version 1.0.2

Ross Burton (1):
=20=20meta-emenlow: unset preferred providers for virtual/libgles[12]

Tom Zanussi (5):
=20=20meta-intel.inc: new file
=20=20ia32-base.inc: remove
=20=20meta-intel.inc: have appropriate BSPs use it
=20=20meta-intel: add va-impl-intel MACHINE_FEATURE
=20=20meta-intel: use va-impl-intel MACHINE_FEATURE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

Khem Raj (1):
=20=20linux: Update SRC_URI to github

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

Andreas M=C3=BCller (11):
=20=20udev-udisks-rules-overo: add udev rule to hide boot partition to =
udisks
=20=20overo.inc: add udev-udisks-rules-overo to MACHINE_EXTRA_RRECOMMENDS
=20=20linux-omap-3.5: Add opp table support
=20=20linux-omap-3.5: Follow Gumstix suggestion to have max 800MHz [1]
=20=20linux-omap-3.5: fix 800MHz corrupted by last commit
=20=20u-boot: move to 2012.07
=20=20linux-omap-3.6: Initial add
=20=20linux-omap-3.5: reenable 1GHz / use ondemand governor / enable =
smartreflex
=20=20linux-omap-3.6: reenable 1GHz / enable smartreflex
=20=20linux-3.6: fix ADS7846 backtrace
=20=20linux-omap-3.6: disable smartreflex / gouvernor performance

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Matthew McClintock (1):
=20=20linux-qoriq-sdk.inc: add patch so perf builds

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-telephony:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (9):
=20=20angstrom: Add weak definition for MACHINE_KERNEL_PR
=20=20angstrom-version.bb: Convert tabs -> whitespaces in python snippet
=20=20conf: Rename distro to angstrom-next
=20=20angstrom-next.conf: Use uclibc git version and bump linux libc =
headers to 3.
=20=20angstrom-next: Use eglibc 2.16
=20=20angstrom-next.conf: Drop DISTRO_REVISION and DISTRO_PR
=20=20angstrom-next: Drop 'core' from DISTRO_VERSION
=20=20angstrom-next: Populate blacklist using PNBLACKLIST
=20=20conf/distro, external-toolchain-angstrom: Remove references and use =
of gcc-c

Koen Kooi (1):
=20=20Merge pull request #2 from kraj/master

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (16):
=20=20bcm2835-bootfiles: Add stamp in deploy directory
=20=20firmware.inc: Update to SRCREV =
c42f21261f1eeae0df7ad02f34773e279e7af8c5
=20=20linux-raspberrypi: Update to v3.2.27
=20=20raspberrypi.conf: Weakly assign IMAGE_FSTYPES to let users overwrite
=20=20sdcard_image-rpi: Use xzcat if SDIMG_ROOTFS_TYPE is a .xz file
=20=20README: Add instructions for compressed deployed files
=20=20RPI.GPIO: Integrate v0.2.0
=20=20raspberrypi.conf: Set PREFERRED_PROVIDER for egl, libgles2 and gl
=20=20vc-graphics.bb: Change bb file mode to 644
=20=20bcm2835-bootfiles.bb: Add COMPATIBLE_MACHINE
=20=20README: Instruct users to add meta-oe layer to bblayers.conf
=20=20poky-raspberrypi.conf: Remove libav from BBMASK
=20=20vc-graphics.inc: New provides, compatible machine and init for vchiq
=20=20omxplayer: Integrate git revision =
231c08b42005e3de565013bc1cee18bd5a349c1f
=20=20raspberrypi.conf: Set udev PREFERRED_VERSION to 164
=20=20poky-raspberrypi.conf: Weakly assign BBMASK

Sander van Grieken (1):
=20=20sdcard_image-rpi.bbclass: Add support for 240M/16M GPU memory split

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

Samuel Stirtzel (27):
=20=20Set ${bindir_crossscripts} correctly
=20=20bangarang: Update to 2.1.3
=20=20akonadi: Fix copy and paste error
=20=20kde-artwork-active: proto->protocol
=20=20kde-workspace: Fix packaging
=20=20kdelibs4: Fix packaging
=20=20kate: Fix packaging
=20=20kcalc: Fix packaging
=20=20kde-baseapps: Fix packaging
=20=20nepomuk-core: Fix packaging
=20=20rekonq: Fix packaging
=20=20kde-workspace: Fix copy and paste error
=20=20konsole: Fix packaging
=20=20kde-runtime: Fix packaging
=20=20plasma-active: Fix packaging
=20=20kde-workspace: Remove package archs for non MACHINE_ARCH packages
=20=20kdelibs4: Move kde4config to ${PN} instead of ${PN}-dev
=20=20libkactivities4: Add Qt SQLite driver
=20=20angstrom-kde-desktop-image: virtual/plasma-startscript -> =
plasma-startscript
=20=20kde-workspace: Export new CMake file
=20=20kde-workspace: Remove useless WITHOUT_PYTHON and add python to =
RDEPENDS
=20=20contour: Remove virtual/plasma-active-startscript this will be =
handled by th
=20=20plasma-contour-config: virtual/plasma-startscript -> =
plasma-startscript
=20=20share-like-connect: Fix packaging
=20=20soprano: Update to 2.8.5
=20=20soprano-native: Update to 2.8.5
=20=20Akonadi; Use MySQL instead of SQLite

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Robert Yang (1):
=20=20local.conf.sample.extended: update the sample for archiver.bbclass

Ross Burton (4):
=20=20bsp: set default XSERVER for PowerPC and MIPS machines to Xorg
=20=20routerstationpro: switch to Xorg instead of kdrive
=20=20mpc8315e: switch to Xorg instead of kdrive
=20=20distro-tracking: remove xserver-kdrive

Tom Zanussi (6):
=20=20yocto-bsp: remove obsolete references
=20=20yocto-bsp: use KBRANCH_DEFAULT in 'newbranch' cases
=20=20yocto-bsp: include meta-intel.inc if emgd selected
=20=20yocto-bsp: update the help regarding the meta-intel layer
=20=20yocto-bsp: add a LICENSE_FLAGS_WHITELIST blurb for emgd to README
=20=20yocto-bsp: add new strip_base() function




