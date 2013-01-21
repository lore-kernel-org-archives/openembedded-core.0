Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1TxNv4-0000bj-3V; Mon, 21 Jan 2013 21:24:42 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1TxNVB-0000D6-Ve; Mon, 21 Jan 2013 14:57:57 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 21 Jan 2013 20:08:56 GMT
Message-Id: <1358798936930.e026c45a@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-01-13 until 2013-01-20
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
X-List-Received-Date: Mon, 21 Jan 2013 20:24:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-01-13 until 2013-01-20.  Projects included in this =
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

Bogdan Marinescu (1):
=20=20hig.py: refactor into individual components

Jessica Zhang (1):
=20=20hob: Fix GTK+ and PyGtk version check error message to be more clear

Jon Szymaniak (1):
=20=20hg.py: Fixed fetch failure that occurs when SRCREV is a tag.

Peter Seebach (2):
=20=20bitbake: data_smart.py and friends: Track file inclusions for bitbake =
-e
=20=20bitbake: data_smart.py and friends: Track variable history

Richard Purdie (2):
=20=20BBHandler/data: Standardise some setVar access formats
=20=20base.bbclass: Fix bitbake example class usage

Tyler Hall (1):
=20=20fetch2: Sort file checksums by value, not path

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru DAMIAN (2):
=20=20wayland: add Wayland protocol library
=20=20mesa-dri: enable the wayland-egl platform

Andrei Dinu (1):
=20=20Removed undisplayed picture from connman-gnome

Bogdan Marinescu (1):
=20=20oprofile: set correct kernel path

Bruce Ashfield (9):
=20=20kernel-yocto: remove unnecessary non-bare warning
=20=20linux-yocto: normalize repository naming and SRC_URI options
=20=20kernel-yocto: add KBUILD_OUTPUT to OE_TERMINAL_EXPORTS
=20=20linux-yocto/meta: update include statements to explicit .scc format
=20=20linux-yocto/routerstationpro: enable GPIO_SYSFS
=20=20linux-yocto/3.4: integrate LTSI-3.4
=20=20guilt: add git 1.8.x support
=20=20linux-yocto/3.4: update to 3.4.26 and 3.4.25-rt37
=20=20linux-yocto/3.4: update intel graphics features/configs

Chen Qi (2):
=20=20initscripts: remove finish.sh
=20=20runqemu scripts: add support for booting an ISO image

Christopher Larson (7):
=20=20ptest.bbclass: don't add to PACKAGES if disabled
=20=20license.bbclass: check LICENSE_pkg, not LICENSE_pn-pkg
=20=20license: correct re.search/fnmatch indentation
=20=20license.bbclass: cleanly handle invalid licenses in =
incompatible_license
=20=20linux-firmware: use LICENSEs which can actually be parsed
=20=20base.bbclass: use debug messages for INCOMPATIBLE_LICENSE
=20=20base.bbclass: improve the incompatible license logic a bit

Constantin Musca (2):
=20=20gcc: add missing dependency (zlib)
=20=20pango: use qemu_run_binary instead of pango-native

Cristian Iorga (7):
=20=20qemu: machine override ability added
=20=20db: upgrade to 5.3.21
=20=20iproute2: upgrade to v3.7.0
=20=20quota: upgrade to 4.01
=20=20connman-conf: configures connman in qemu machines
=20=20connman: upgrade to 1.10
=20=20iptables: upgrade to 1.4.17

Emilia Ciobanu (1):
=20=20distrodata: Updated checkpkg task

Enrico Scholz (1):
=20=20package.bbclass: replace AUTOINC directly in PKGV

Eric B=C3=A9nard (2):
=20=20gitignore: only ignore meta- directories
=20=20add meta-toolchain-qt

Felipe F. Tonello (1):
=20=20connman: fixed init script so connman can runs over nfs

Holger Hans Peter Freyther (1):
=20=20dropbear: Deal with truncated host keys by removing them

Hongxu Jia (2):
=20=20update-rc.d:fix support postrm at image creation time
=20=20libnss-mdns:fix support prerm at image creation time

Jason Wessel (1):
=20=20populate_sdk_base.bbclass: Work around bugs with gnu tar < 1.24

Kang Kai (1):
=20=20perl: fix installed but not shipped issue

Khem Raj (2):
=20=20kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
=20=20consolekit_0.4.5.bb: Package unpackaged systemd files

Koen Kooi (1):
=20=20libpam: register PAM session with logind

Laurentiu Palcu (8):
=20=20update-rc.d: check also that symlinks are valid
=20=20update-rc.d: fix failure on target
=20=20modutils-initscripts: improve modutils.sh
=20=20orinoco-conf: remove dependencies of update-modules
=20=20hostap-conf: remove dependencies of update-modules
=20=20module.bbclass: do not use update-modules anymore
=20=20kernel.bbclass: remove references to update-modules
=20=20bitbake.conf: remove update-modules from DISTRO_FEATURES

Marcin Juszkiewicz (2):
=20=20oprofile: add AArch64 support
=20=20libffi: add AArch64 support

Mark Hatle (2):
=20=20populate_sdk_rpm: Re-add a few system provides to the SDK
=20=20update-alternatives: Add a build-time dependency

Marko Lindqvist (38):
=20=20libxdamage: update to upstream version 1.1.4
=20=20coreutils: fix license segment md5sum boundary
=20=20help2man: update to upstream version 1.40.13
=20=20dbus-glib: replace obsolete automake macros with working ones
=20=20tslib: replace obsolete automake macros with working ones
=20=20makedepend: replace obsolete automake macros with working ones
=20=20alsa-lib: replace obsolete automake macros with working ones
=20=20python: replace obsolete automake macros with working ones
=20=20libogg: replace obsolete automake macros with working ones
=20=20libmad: replace obsolete automake macros with working ones
=20=20libvorbis: replace obsolete automake macros with working ones
=20=20opensp: replace obsolete automake macros with working ones
=20=20gconf: replace obsolete automake macros with working ones
=20=20startup-notification: replace obsolete automake macros with working =
ones
=20=20gtk+: replace obsolete automake macros with working ones
=20=20gmp: replace obsolete automake macros with working ones
=20=20bluez4: replace obsolete automake macros with working ones
=20=20polkit: replace obsolete automake macros with working ones
=20=20pango: replace obsolete automake macros with working ones
=20=20libxsettings-client: replace obsolete automake macros with working =
ones
=20=20rgb: replace obsolete automake macros with working ones
=20=20sysfsutils: replace obsolete automake macros with working ones
=20=20vte: replace obsolete automake macros with working ones
=20=20libtirpc: replace obsolete automake macros with working ones
=20=20curl: fix build with automake-1.13
=20=20bluez-hcidump: replace obsolete automake macros with working ones
=20=20alsa-utils: replace obsolete automake macros with working ones
=20=20tremor: replace obsolete automake macros with working ones
=20=20ofono: replace obsolete automake macros with working ones
=20=20libidn: add checksums to version 0.6.14 recipe
=20=20gzip: fix license segment md5sum boundary
=20=20iptables: fix license segment md5sum boundary
=20=20shadow: fix license segment md5sum boundary
=20=20ethtool: fix license segment md5sum boundary
=20=20gperf: fix license segment md5sum boundary
=20=20libidn: fix license segment md5sum boundary
=20=20dbus: fix license segment md5sum boundary
=20=20apmd: fix license segment md5sum boundary

Martin Donnelly (1):
=20=20base-files: add fstab for systemd based systems

Martin Ertsaas (3):
=20=20sstate: Do not add the --no-run-if-empty arguement to xargs when on =
Darwin,=20
=20=20quilt: Remove non-gnu.patch, and added configure flags for darwin.
=20=20quilt: Don't use BUILD_ROOT on darwin.

Martin Jansa (1):
=20=20kernel.bbclass: don't depend on DATETIME

Nitin A Kamble (2):
=20=20xf86-video-modesetting: new recipe for gma500
=20=20ia32-base.inc: Add more macros for xf86 drivers

Paul Eggleton (3):
=20=20classes/rootfs_*: error out if postinstalls exist with read-only =
rootfs
=20=20dropbear: allow configuring blank password option at runtime
=20=20classes/image: improve debug-tweaks ssh server configuration

Radu Moisan (5):
=20=20default-distrovars: Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
=20=20default-providers: Automatically set PREFERRED_PROVIDER_udev
=20=20systemd: add systemd recipes
=20=20default-providers: Add systemd option to PREFERRED_PROVIDER_udev
=20=20update-rc.d: disable update-rc.d.bbclass when systemd enabled

Richard Purdie (4):
=20=20package.bbclass: Fix shlibs cross package-arch contamination
=20=20liburi-perl: Add BBCLASSEXTEND for native version
=20=20libtool-cross: Add missing libltdl components to install
=20=20cpan_build: Fix bashism

Riku Voipio (2):
=20=20nspr: add aarch64 support
=20=20attr: convert to generic syscall numbers

Robert P. J. Day (1):
=20=20image_types.bbclass: Add and update comments regarding image types.

Ross Burton (6):
=20=20x11-common: set XDG_RUNTIME_DIR if it isn't already set
=20=20weston: add reference Wayland compositor
=20=20initramfs-live-boot: handle multiple udev locations
=20=20dbus: respect systemd distro feature
=20=20packagegroup-core-boot: install systemd-compat-units on systemd images
=20=20packagegroup-core-boot: only install initscripts if we're using =
sysvinit

Saul Wold (2):
=20=20xz: LICENSE field is wrong
=20=20rpm2cpio: Update to match rpm4 specs for decompression

Tom Zanussi (4):
=20=20lttng: remove 'legacy' lttng
=20=20lttng2-ust: rename to lttng-ust
=20=20recipes-kernel/lttng-2.0: rename to recipes-kernel/lttng
=20=20lttng-ust: bump PE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrei Gherzan (5):
=20=20bluez4: Package systemd service
=20=20ofono: Package systemd service
=20=20portmap: Add systemd service
=20=20obexd: Update to v0.48 and remove openobex dependency
=20=20libpostproc: Remove -disable-yasm as this is a nonexistent flag

Enrico Scholz (2):
=20=20systemd.bbclass: move disable operation into prerm() script
=20=20gitpkgv.bbclass: cache GITPKGV result

Jack Mitchell (1):
=20=20hiawatha: update to 8.7

Khem Raj (1):
=20=20netcat_0.7.1.bb: Fix build with new versions of autotools

Koen Kooi (4):
=20=20tvheadend: add git version
=20=20oscam: add svn version
=20=20dvb-apps: import 1.1.1+hg from OE classic
=20=20libav: update to 0.8.4

Marcin Juszkiewicz (2):
=20=20libav: move --enable-postproc to 0.8.4 recipe
=20=20libav: add support for AArch64

Martin Jansa (4):
=20=20meta-systemd: connman: rename bbappend to match 1.10 from oe-core
=20=20meta-systemd: connman, openssh: move bbappends to oe-core dir
=20=20compat-wireless: upgrade and fixup
=20=20gtk+3: drop recipe, now in oe-core

Morgan Little (1):
=20=20traceroute: Remove bashisms

Philip Balister (3):
=20=20uhd-firmware : Update to version 3.5.0.
=20=20uhd : Update to version 3.5.0.
=20=20gnuradio : Update to version 3.6.3.

yanjun.zhu (1):
=20=20autofs: do not check for modprobe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (1):
=20=20curl: explicitly depend on openssl for https support

Franklin S. Cooper Jr (16):
=20=20m4-native: Remove remote-gets.patch from meta-arago
=20=20gettext: Remove remote-gets.patch from meta-arago
=20=20psplash_git: Remove patch
=20=20arago.conf: Set PREFERRED_PROVIDER for udev
=20=20busybox: Enable telnetd
=20=20arago-source-ipk: Remove libgles-omap3
=20=20shadow-securetty: Allow remote telnet login as root
=20=20matrix-gui-apps: Add audio capture demo
=20=20quick-playground: Port quick-playground from Arago
=20=20arago-source-ipk.conf: Rename qml-playground quick-playground
=20=20task-arago-tisdk-qte: Add Qt quick-playground application.
=20=20task-arago-tisdk-matrix: Add quick-playground Matrix application
=20=20screenshot: Add screenshot application
=20=20task-arago-tisdk-amsdk: Add screenshot
=20=20qt-tstat: Update Thermostat sources
=20=20qt4-embedded-gles: Correct linux.conf

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

Fabio Estevam (5):
=20=20linux-fslc_3.7: udev needs CONFIG_DEVTMPFS_MOUNT
=20=20linux-imx-2.6.35.3: udev needs CONFIG_DEVTMPFS_MOUNT
=20=20linux-imx-2.6.35.3: imx23evk: udev needs CONFIG_DEVTMPFS_MOUNT
=20=20linux-imx_2.6.35.3: Update to top of head
=20=20linux-fslc_3.7.bb: Add CONFIG_LEGACY_PTYS to avoid warning

Leonardo Sandoval (1):
=20=20linux-imx_3.0.35: Enables eGalax touchscreen on i.MX6Q Sabre machines

Otavio Salvador (7):
=20=20mxsldr: Update to newer snapshot
=20=20nativesdk-packagegroup-sdk-host: Fix inclusion of elftosb and mxsldr
=20=20u-boot-fslc: Update to 2013.01-rc3
=20=20imx-base.inc: Set interfaces provided by i.MX6 GPU libraries
=20=20mxsldr: Fix SRC_URI which pointed to U-Boot instead of mxsldr
=20=20u-boot: Update to 2013.01 release
=20=20u-boot-mxsboot: Update to 2013.01

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Tomas Frydrych (20):
=20=20task-guacamayo: added pulseaudio-misc to pa packages set
=20=20raspberrypi: updated bsp layer to upstream
=20=20guacamayo-image.bbclass: customize RPi config.txt before doing rootfs
=20=20guacamayo-image-mex: specify memory layout and cpu clocking for RPi
=20=20gnome-settings-overrides: stop tracker from indexing removable media
=20=20guacamayo-session-egl: process xdg/autostart even on RPi
=20=20README.raspberrypi: update info on Mex status.
=20=20guacamayo-session-common: always cleanup stale dbus info before dbus =
setup
=20=20clutter-1.12: work around a brokenness in keysym translation in evdev =
backen
=20=20evtest: simple tool for testing evdev input events
=20=20task-guacamayo-devtools: added evtest tool
=20=20package gst-omx
=20=20gst-omx: fix version and RPi config
=20=20gst-plugins-bad.bbappend: re-enable the default yocto plugins + =
videoparsers
=20=20userland.bbappend: fix up RPi userland package to install into /usr
=20=20gst-omx: changed the RPi runtime dependency to libopenmaxil
=20=20raspberrypi.conf: change libgles2/egl provider to userland
=20=20task-guacamayo-core: for RPi include gst-omx
=20=20task-guacamayo-core: only pull in gst-omx on RPi if DISTRO_FEATURES =
says so
=20=20guacamayo-sesion-egl (RPi): allow the user group to execute shutdown

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (3):
=20=20linux-omap-3.6: remove
=20=20linux-versions-overo.inc: location of sakoman linux git has changed
=20=20linux-mainline-3.8: prepare latest kernel

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (7):
=20=20gstreamer-vaapi_git: fix a build issue
=20=20crownbay: specify graphics driver as a kernel feature
=20=20emenlow: specify graphics driver as a kernel feature
=20=20fri2: specify graphics driver as a kernel feature
=20=20sys940x: create a v3.4 kernel recipe
=20=20emenlow-noemgd: create a new BSP
=20=20BSP layer READMEs: fix the YP Compliance link

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (2):
=20=20consolekit: Remove bbappend as gnome-common is not GPLv3
=20=20busybox: Remove a bunch of configs

Florin Sarbu (3):
=20=20linux-yocto: Reworked bbappend to work with master poky changes.
=20=20busybox: Update .bbappend to version 1.10
=20=20node-startup-controller: Update package to git version 1.0.2

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
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Andreas M=C3=BCller (1):
=20=20mesa-dri: update to 9.0.1 to match oe-core

Denys Dmytriyenko (1):
=20=20netbase: fix file search path for 'interfaces' file

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Martin Jansa (3):
=20=20luna-sysmgr-common: Add dependency on serviceinstaller
=20=20luna-sysmgr, webappmanager: Add qmake-webos-native dependency
=20=20keyboard-efigs: Add missing dependencies

Simon Busch (1):
=20=20webappmanager: Add dependency on serviceinstaller

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bogdan Marinescu (1):
=20=20maintainers.inc: updated package owners

Bruce Ashfield (1):
=20=20linux-yocto/meta-yocto: update hardware reference BSPs to 3.4.26 and =
LTSI

Constantin Musca (1):
=20=20gtk-directfb: rename to directfb

Cristiana Voicu (1):
=20=20Added DISTRO var to poky-bleeding conf file

Emilia Ciobanu (1):
=20=20Modified meta-yocto/conf/distro/include/package_regex.inc

Richard Purdie (1):
=20=20poky-bleeding: Ensure poky overrides are applied

Tom Zanussi (9):
=20=20yocto-bsp: add basic git connectivity check
=20=20lttng: update references to legacy lttng recipes
=20=20scripts/lib/bsp/engine.py: add yocto_layer_create()
=20=20yocto-layer: new script
=20=20yocto-layer: add help/usage
=20=20yocto-layer: add 'layer' template data
=20=20scripts/lib/bsp/engine.py: refactor bsp-creation code
=20=20yocto-layer: add optional layer priority param
=20=20scripts/lib/bsp/engine.py: add handling for JSON strings

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




