Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1TG7yx-0001UT-2V; Mon, 24 Sep 2012 14:41:51 +0200
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1TG7fP-0006Pb-SZ; Mon, 24 Sep 2012 08:21:42 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 24 Sep 2012 12:28:53 GMT
Message-Id: <1348489733385.9663d32b@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2012-09-16 until 2012-09-23
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
X-List-Received-Date: Mon, 24 Sep 2012 12:41:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2012-09-16 until 2012-09-23.  Projects included in this =
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
meta-webos: git://github.com/openwebos/meta-webos.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-systemd: git://git.yoctoproject.org/meta-systemd
meta-guacamayo: git://github.com/Guacamayo/meta-guacamayo.git

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Bogdan Marinescu (2):
=20=20hob: Fix settings dialog issues
=20=20hob/settings: Remove stray "distro" combobox from simple settings

Christopher Larson (1):
=20=20compat, event: use OrderedDict from py2.7 for the event handlers

Constantin Musca (1):
=20=20hob: rename 'View log' to 'Open log'

Cristiana Voicu (2):
=20=20hob/packageselectionpage: "Cancel" button returns to "Image =
configuration" s
=20=20hob: add a top bar when building process is stopped

Paul Eggleton (1):
=20=20hob: report event handler failures

Richard Purdie (4):
=20=20fetch2/cvs: Fix localdata variable reference
=20=20fetch2/cvs: Clean up various data store references
=20=20fetch2/cvs: Fix parameter spacing
=20=20build/siggen: Add support for stamp 'clean' masks

Ross Burton (1):
=20=20hob: Don't set busy cursor on the root window, just our window

Trevor Woerner (1):
=20=20cooker: Clarify package/recipe wording

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andrei Gherzan (2):
=20=20util-linux: Fix bloken swapoff symlink
=20=20Replace "echo -e" with "printf" to have the same behavior in dash or =
bash

Bruce Ashfield (1):
=20=20linux-yocto/3.4: use profiling and latencytop features in yocto bsps

Constantin Musca (2):
=20=20grub: disable lzma, device-mapper, zfs and nvpair
=20=20intltool: include intltool.m4 and add missing rdepends

Cristian Iorga (2):
=20=20qemux86: Support for KVM, paravirt and virtio added
=20=20qemux86-64: Support for KVM, paravirt and virtio added

Darren Hart (1):
=20=20mkefidisk.sh: Add script to do an EFI install on the host

Khem Raj (4):
=20=20eglibc: Fix fcntl.h for powerpc
=20=20eglibc: Do not use fsqrt in libm when building for fsl ppc with fpu
=20=20gdb: Upgrade 7.4 -> 7.5
=20=20gcc: Use 4.7.2 release tarball

Laurentiu Palcu (7):
=20=20gtk+: enable gtk+-native
=20=20adt-installer: fix package installation issue
=20=20SDK: fix installation into symlinked directories
=20=20adt-installer: ensure directory exists before copying/removing
=20=20SDK: remove references to Poky distro from tarball installer
=20=20SDK: relocate symlinks too
=20=20SDK: allow toolchain installation from another directory

Marcin Juszkiewicz (2):
=20=20xcursor-transparent-theme: switch SRC_URI as matchbox-project is dead
=20=20byacc: update config.{sub, guess} before running configure

Martin Jansa (6):
=20=20recipes: bump PR to rebuild after libffi5 -> libffi6
=20=20recipes: few more PR bumps to rebuild after libffi5 -> libffi6
=20=20libtelepathy: PR bump to rebuild after libffi5 -> libffi6
=20=20opkg: replace local patches with git patches submitted upstream
=20=20opkg: add patch to fix SIGSEGV when printing status file
=20=20opkg-nogpg: drop SRCREV

Radu Moisan (1):
=20=20insane.bbclass: add library dir sanity check

Richard Purdie (3):
=20=20bitbake.conf/gcc: Add clean masks for stamp files
=20=20insane.bbclass: Improve ability to detect enabled tests
=20=20bitbake.conf/gcc-common.inc: Fix STAMPCLEAN expression

Robert Yang (3):
=20=20rpm 5.4.9: DEPENDS on bison-native
=20=20opkg 0.1.8: remove it since it doesn't work
=20=20opkg svn: respect to the arch priority

Ross Burton (1):
=20=20librsvg: make the libcroco dependency a PACKAGECONFIG option

Saul Wold (4):
=20=20xserver-xorg: Modify RREPLACES for RCONFLICTS
=20=20nfs-utils: add x32 patch to fix nfsctl issue
=20=20rootfs_rpm: Add Multilib prefix to installed_packages list
=20=20image_types: fix squashfs-lzma image creation

Scott Garman (1):
=20=20runqemu: show bitbake errors to user

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (1):
=20=20kexec-tools.klibc_2.0.2: fix checksums

Andreas M=C3=BCller (7):
=20=20gnome.bbclass: remove to use oe-core's version
=20=20gdm: do not rely on dev-tty7.device
=20=20gdm: do not hardcode /usr/sbin
=20=20gdm: remove obsolete files
=20=20networkmanager: unbreak build with latest kernel headers
=20=20xfce4-session: Don't loose xfwm4 when closing session with multiple =
windows=20
=20=20lxdm: initial add 1.22_git

Khem Raj (2):
=20=20sg3-utils: Correct typo in checksums
=20=20gnome-themes: inherit perlnative

Martin Jansa (5):
=20=20recipes: bump PR to rebuild after libffi5 -> libffi6
=20=20recipes: few more PR bumps to rebuild after libffi5 -> libffi6
=20=20gtk+: drop .bbappend with native BBCLASSEXTEND
=20=20lzma: replace oe.process.run with subprocess.call in do_unpack, drop =
NATIVE_
=20=20emacs: fix X11DEPENDS and build without x11 enabled at all

Zhenhua Luo (1):
=20=20libnfnetlink: use a correct LIC_FILES_CHKSUM

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (1):
=20=20emgd-driver-bin: Fix package naming issue

Ross Burton (1):
=20=20cdv-pvr-driver: fix unpack

Tom Zanussi (4):
=20=20meta-cedartrail: update linux-yocto-3.0 meta SRCREV
=20=20meta-chiefriver: update kernel SRCREVs
=20=20meta-jasperforest: update kernel SRCREVs
=20=20meta-jasperforest: switch kernel back to 3.4

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

Andreas M=C3=BCller (1):
=20=20linux-versions-overo.inc: 3.6-rc4 -> 3.6-rc6

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Chunrong Guo (2):
=20=20udev: do not automount block devices for fslmachines
=20=20change the priority of packages which provide ifconfig to ifconfig =
link ifco

Khem Raj (1):
=20=20linux-qoriq-sdk: Correct the check for BUILD_64BIT_KERNEL

Matthew McClintock (9):
=20=20fsl.conf: add multiarch to fsl distro
=20=20u-boot_git.bb: libgcc is required for multilib builds too
=20=20linux-qoriq-sdk.inc: make sure we enabled biarch for our kernel builds
=20=20gettext: remove bbappends since the patch it adds does not apply
=20=20u-boot_git.bb: only set variable if not set
=20=20linux-qoriq-sdk.inc: only check for multiarch in eX500 not eX500-64b
=20=20rename task- to packagegroup-
=20=20rcw_git.bb: update to latest and update LIC_FILES_CHECKSUM
=20=20Revert "change the priority of packages which provide ifconfig to =
ifconfig l

Ting Liu (1):
=20=20fsl-image-minimal: IMAGE_FSTYPES add jffs2

Zhenhua Luo (1):
=20=20lio-utils: add lio-utils-4.0

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

Andreas M=C3=BCller (2):
=20=20mesa: add appends to avoid providing conflicts
=20=20libgles-omap3: fix for latest oe-core mesa changes

Denys Dmytriyenko (2):
=20=20layer.conf: lower layer priority from 10 to 6
=20=20ti-hw-bringup-image: remove duplicate timestamp-service, as it's in =
systemd-

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom-preferred-versions: Prefer 8.0.4 for mesa and 4.8.1 for QT

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (31):
=20=20raspberrypi.conf: Remove GUI_MACHINE_CLASS variable
=20=20raspberrypi.conf: Remove TARGET_ARCH variable
=20=20README: Move RPI_GPU_FIRMWARE instructions to README
=20=20linux-raspberrypi: Remove PR from PV
=20=20raspberrypi.conf: Remove PREFERRED_* and include rpi-default*.inc
=20=20rpi-default-*.inc: Create inc files included in machine configure file
=20=20raspberrypi.conf: Drop INHERIT sdcard_image-rpi as we will use =
IMAGE_CLASSES
=20=20sdcard_image-rpi.bbclass: Inherit image_types as this class will be =
in IMAGE
=20=20rpi-default-settings.inc: Add sdcard_image-rpi to IMAGE_CLASSES
=20=20bcm2835: Add COMPATIBLE_MACHINE
=20=20recipes.txt: Add info about devtools and multimedia recipes groups
=20=20rpi-first-run-wizard: Clean extra spaces
=20=20firmware.inc: Remove extra newlines
=20=20bcm2835-bootfiles.bb: Fix file permissions
=20=20raspberrypi.conf: Fix file permissions
=20=20linux.inc: Fix file permission
=20=20linux-raspberrypi_3.2.27.bb: Fix file permission
=20=20recipes.txt: Fix file permission
=20=20vchiq: Fix file permission
=20=20linux-raspberrypi: Use cmdline.txt to supply kernel command line
=20=20sdcard_image-rpi: Ship cmdline.txt file
=20=20sdcard_image-rpi: Fix xzcat command while writing rootfs partition
=20=20Move fsl-default*.inc from distro to machine
=20=20RPi-config: Create recipe for config.txt file
=20=20bcm2835-bootfiles: Add rdepends to RPi-config
=20=20sdcard_image-rpi: Ship config.txt from RPi-config recipe
=20=20README: Add information about license codecs
=20=20README: Add nice RPi ASCI logo
=20=20psplash: Add bbappend to use a RPi logo
=20=20rpi-basic-image: Add splash image feature
=20=20RPi-config: Rename recipe to rpi-config

Sander van Grieken (3):
=20=20firmware.inc: Update firmware SRCREV to current@2012-09-13
=20=20vc-graphics.inc: Fix QA issue; Install libGLESv1_CM.so symlink in =
source as=20
=20=20linux-raspberrypi: Update SRCREV to current@2012-09-13

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

Samuel Stirtzel (1):
=20=20Images: replace require with include to un-break parsing

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Richard Purdie (1):
=20=20poky.conf: Silence unsafe reference warnings

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Anupam (4):
=20=20db8 recipe fixes:
=20=20Fix a typo in the db8 recipe (provider)
=20=20Fix recipe dependencies for searchmgr
=20=20Add luna-applauncher and luna-systemui to webos

Herb Kuta (8):
=20=20Correct TARGET_VENDOR, DISTRO_NAME, DISTRO_VERSION settings
=20=20Rename qt4-palm to qt4-webos
=20=20Fold qt4-palm.inc into qt4-webos.bb
=20=20Rename webkit to webkit-webos
=20=20Add a PR =3D "r0" setting to recipes without one
=20=20rdx-utils-stub: Add recipe and PREFERRED_VERSION 2.0.0-1
=20=20cpushareholder-stub: Add recipe and PREFERRED_VERSION 2.0.0-1
=20=20Add cpushareholder-stub and rdx-utils-stub to webos-image

Iyad Qumei (3):
=20=20Include db8 in webos-image.
=20=20Add webkit dev package to webos image.
=20=20Add Qt4 dev package to webos image.

Keith Derrick (17):
=20=20Install corrected .pc files and clean up db8 recipe
=20=20Recipe changes to allow activitymanager to build
=20=20Change recipe to build LS2 correctly for all targets
=20=20webos-image submission: libpbnjson=3D1.3.0-7-r1
=20=20Use pkg-config to locate db8
=20=20Add fbprogress to the build
=20=20Add recipes and preferred versions of logging suite
=20=20Reinstate workaround for new LS2 header location
=20=20Remove superfluous mv from recipe
=20=20Integrate logging suite
=20=20Add webos-shutdownscripts to webos-image
=20=20Create luna-service2 links correctly
=20=20Create links correctly for libpalmsocket headers
=20=20Replace RDEPENDS with RDEPENDS_${PN} in all recipes
=20=20Add webos-initscripts to build and image
=20=20webkit-supplemental: Update QTDIR for change in qt4-webos PR value
=20=20Create install directory for AdapterBase.a library

Kimmo Leppala (1):
=20=20Fix issue where qt4 oe-core build is referencing host sql header =
files.

Mikko Levonmaa (1):
=20=20Fix configuration and compilation for qemuarm target.

Roger Stringer (5):
=20=20Use latest 0.35 tag of Qt4 and update its recipe file.
=20=20Increment versions of luna-prefs and luna-sysmgr-ipc-messages
=20=20Increment db8 version to #57
=20=20Increment db8 version to 58
=20=20Change tag of Qt to 1.00

Sravan Sandela (1):
=20=20Add Isis Browser components to webos-image

Steve Lemke (9):
=20=20Create new webos-image-test; remove ltp from webos-image
=20=20Add js frameworks and mojoservicelauncher to image
=20=20Increase qemux86 resolution
=20=20Fetch mojoloader from its own repository
=20=20Add filecache to webos-image
=20=20Document why we're overriding v86d fbsetup script
=20=20Add configurator recipe and update conf metadata
=20=20Add apps, services, and fbprogress to webos-image
=20=20Fix installation of underscore js framework

Suresh Arumugam (2):
=20=20Add recipe and PREFERRED_VERSION for mojomail services.
=20=20Install service,activity and upstart files for Apps and Services.

Timo Aarnipuro (1):
=20=20iproute2: Add dependency to iptables

sapna.todwal (1):
=20=20Add recipe and PREFERRED_VERSION for nyx-modules

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Franklin S Cooper Jr (1):
=20=20task-arago-tisdk-addons: Port task-arago-tisdk-addons-sdk-host from =
arago

Franklin S. Cooper Jr (4):
=20=20thttpd: Adding thttpd
=20=20thttpd: Port arago changes
=20=20pinmux-utility: Add pinmux utility
=20=20flash-utility: Add flash utility tool

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (2):
=20=20shadow-securetty: Replace tabs with spaces
=20=20Replace tasks by packagegroups

Florin Sarbu (10):
=20=20base-passwd: Update bbappend to 3.5.26 version
=20=20eglibc: Allign PACKAGES var with OE-Core
=20=20xserver-xorg: Redefine faulty RREPLACE for module-exa rpm
=20=20pulseaudio: Replace old library with newer one created by updated =
version of
=20=20AudioManager: Update version to 2.1 and update git recipe with =
current maste
=20=20layer-management: Updated to version 0.9.7 and also updated the git =
recipe t
=20=20README.md: Small doc update
=20=20vexpressa9.conf: Added opengl to DISTRO_FEATURES (we use mesa)
=20=20poky-ivi-systemd.conf: Add LAYER_CONF_VERSION =3D "6" to avoid sanity =
checks e
=20=20DLT-daemon: Update to version 2.7.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

Florin Sarbu (1):
=20=20systemd.bbclass: Modify systemd.bbclass tabs into 4 spaces each

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Tomas Frydrych (11):
=20=20raspberrypi.conf: remove SDIMAGE_SIZE
=20=20Update to meta-raspberrypi master
=20=20raspberrypi.conf: update to current firmware
=20=20atom-pc: add all kernel snd modules explicitely to RRECOMMENDS
=20=20atom-pc.conf: add all rt2x modules explicitely to RRECOMMENDS
=20=20atom-nvidia.conf: add bunch of snd and wifi modules to RRECOMMENDS
=20=20README.atom: Added note about hight CPU load during initial indexing
=20=20Fix component version for impending 0.4 release
=20=20Bump version to 0.4.0 for the impending release
=20=20Updated NEWS for 0.4 release
=20=20Bump version to 0.5.0, move components back to AUTOREV




