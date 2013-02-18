Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1U7TgT-00051N-MJ; Mon, 18 Feb 2013 17:35:18 +0100
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1U7TF1-0004F4-JL; Mon, 18 Feb 2013 11:06:58 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 18 Feb 2013 16:18:53 GMT
Message-Id: <1361204333006.2c601d2b@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-02-10 until 2013-02-17
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
X-List-Received-Date: Mon, 18 Feb 2013 16:35:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-02-10 until 2013-02-17.  Projects included in this =
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

Christopher Larson (1):
=20=20Remove whitelisted vars from non-task deps

Cristiana Voicu (4):
=20=20bitbake & hob: reparse config files, when sanity check updates =
bblayers.conf
=20=20hob: no sanity checks re-run
=20=20hob: remove parsing warnings when machine is changed
=20=20hob: remove save/load template functionality

Olof Johansson (1):
=20=20ConfHandler: Use re.X to make long regexp more readable

Richard Purdie (10):
=20=20bitbake/utils: Improve environment handling to allow UIs access to =
original=20
=20=20ConfHandler: Improve regexp to fix mis-parsing of +=3D and no =
whitespace
=20=20codeparser: Track appendVar and prependVar calls as we do for getVar
=20=20codeparser: Track bb.utils.contains usage
=20=20wget: Only use -O option when not spidering
=20=20tests/codeparser: Hack around circular inclusion problem
=20=20fetch2: Ensure expansions happen in URL parameters in uri_replace
=20=20fetch2: Improve lock/done stamp file paths for local files
=20=20utils: Use rm -rf in remove()
=20=20fetch2: Ensure directory for stampfile exists before trying to create =
it

Robert Yang (3):
=20=20monitordisk.py: disable the inode checking for some fs
=20=20bitbake-layers: make show-cross-depends avoid long path
=20=20knotty.py: fix unknown event bb.event.DiskFull

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Anders Roxell (1):
=20=20distro_check: Remove creation of empty Meego filelist.

Andrei Gherzan (3):
=20=20udev: Modify init script to use the correct path of udevadm
=20=20udev: PR bump
=20=20udev: Cleanup .inc file

Bj=C3=B6rn Stenberg (2):
=20=20glib-2.0: Fix ptest to build with uclibc.
=20=20libiconv: Remove RPATH from binaries

Chen Qi (1):
=20=20busybox: add config fragments

Colin Walters (1):
=20=20make-3.82: Add patch from git to fix parallel make race

Constantin Musca (6):
=20=20multilib.bbclass: save multilib variables before executing the =
gcc-cross-can
=20=20gcc-cross-canadian: enable multilib support
=20=20cairo: upgrade to 1.12.12
=20=20pixman: upgrade to 0.29.2
=20=20mesa: upgrade to 9.0.2
=20=20qemu: upgrade to 1.3.1

Cristian Iorga (1):
=20=20alsa-lib: upgrade to 1.0.26

Cristiana Voicu (1):
=20=20sanity.bbclass: when bblayers.conf is updated, it invokes a reparse

Darren Hart (6):
=20=20oe-buildenv-internal: Remove GIT variables from BB_ENV_EXTRAWHITE
=20=20oe-buildenv-internal: Add upper and lower case proxy vars to =
BB_ENV_EXTRAWHI
=20=20base.bbclass: Remove generate_git_config()
=20=20oe-git-proxy: Add a new comprehensive git proxy script
=20=20oe-git-proxy: Use socat instead of BSD nc
=20=20oe-git-proxy*: Remove previous git proxy solutions

Emilia Ciobanu (1):
=20=20Solved package namespace errors in PRS

Enrico Scholz (5):
=20=20update-alternatives.bblcass: use oe.path.realpath()
=20=20package.bbclass: use oe.path.realpath()
=20=20lib: implemented oe.path.realpath()
=20=20package.bbclass: support dangling path components
=20=20lib/oe/path.py: support missing directory components in realpath()

Franklin S. Cooper Jr (1):
=20=20scripts/bitbake: Remove all instances of paths to a layer's scripts =
director

Holger Hans Peter Freyther (1):
=20=20conf: Remove unused ROOT_FLASH_SIZE variable from the config

Jason Wessel (5):
=20=20ncurses.inc: Fix display corruption and add fallback for sstate =
compiled pat
=20=20relocate_sdk.py: Fix corruption of sdk binaries
=20=20populate_sdk_base.bbclass: Improve debugging capabilities for SDK =
installer
=20=20relocate_sdk.py: allow relocate_sdk.py to work with python 2.4.x
=20=20libtool-native_2.4.2.bb: Always use /bin/sed for SED

Khem Raj (3):
=20=20nfs-utils: Create the default statdpath
=20=20util-linux: Remove -systemd package
=20=20systemd.bbclass: Dont use libdir and base_libdir for units

Laurentiu Palcu (18):
=20=20Add separate directory for postinstall intercepts
=20=20image.bbclass: add fall-back functionality when running intercepts
=20=20rootfs_(ipk|deb|rpm).bbclass: check package installation status after =
ROOTFS
=20=20gtk-icon-cache.bbclass: use postinst_intercept script
=20=20fontcache.bbclass: use the postinst_intercept script
=20=20Add pixbufcache class
=20=20gdk-pixbuf: use the new pixbufcache class
=20=20librsvg: use the new pixbufcache class
=20=20gnome-keyring: compile schemas on host
=20=20gtk-immodules-cache: add weak asignment for GTKIMMODULES_PACKAGES
=20=20gtk+: use gtk-immodules-cache class
=20=20xf86-video-intel: upgrade to 2.21.0
=20=20xf86-input-vmmouse: upgrade to 13.0.0
=20=20libdrm: upgrade to 2.4.42
=20=20xkeyboard-config: upgrade to 2.8
=20=20xf86-input-synaptics: upgrade to 1.6.3
=20=20xf86-video-vmware: upgrade to 13.0.0
=20=20xev: upgrade to 1.2.1

Marko Lindqvist (10):
=20=20libevent: fix build with automake-1.13
=20=20texinfo: remove help2man dependency
=20=20libidn: remove help2man dependency
=20=20systemtap: replace obsolete automake macros with working ones
=20=20diffutils: replace obsolete automake macros with working ones
=20=20gamin: replace obsolete automake macros with working ones
=20=20webkit-gtk: update to upstream version 1.8.3
=20=20gtk+: update to upstream version 2.24.15
=20=20harfbuzz: update to upstream version 0.9.12
=20=20libpng: update to upstream version 1.5.14

MiLo (1):
=20=20Python: Add missing dependency "textutils" to "io" package

Michael Halstead (1):
=20=20scripts/qemuimage-testlib: Use wide option to ps calls

Otavio Salvador (3):
=20=20tzdata: We shouldn't override the localtime if it is valid
=20=20tzdata: Simplify code removing not used cases
=20=20perl: Add auto/XS/Typemap in perl-doc package

Paul Eggleton (4):
=20=20python-smartpm: show friendly error if YAML output requested without =
PyYAML
=20=20buildhistory_analysis: handle more R* variables
=20=20buildhistory: record more R* variables
=20=20qt4: use system SQLite

Peter Seebach (2):
=20=20pseudo_git.bb: Bump to pseudo 1.4.4.
=20=20pseudo_1.4.5.bb: Finish fixing linkat()

Radu Moisan (3):
=20=20avahi: Enabling with systemd
=20=20connman: Enabling with systemd
=20=20wpa-supplicant: Enabling with systemd

Richard Purdie (7):
=20=20site/x32-linux: Specify double alignment
=20=20multilib: Fix an OVERRIDES expansion order issue
=20=20kconfig-frontends: Depend on pkgconfig-native
=20=20mulitilib_header: Avoid sstate checksum issues for -native recipes
=20=20local.conf.sample: Enhance the SSTATE_MIRRORS example
=20=20tzcode-native: Fix SRC_URI checksum typo
=20=20classes: Drop none package specific packaging variable accesses

Roman I Khimov (1):
=20=20dropbear: use pidfile for daemon start/stop/restart

Ross Burton (12):
=20=20runqemu: add option to make the VNC server publically available
=20=20systemd.bbclass: helper class for recipes with systemd units
=20=20update-rc.d: don't do anything if systemd.bbclass is inherited
=20=20fontconfig: remove unexplainable and broken build tweaking
=20=20fontconfig: drop explicit -native recipe
=20=20fontconfig: rename the patches directory
=20=20systemd.bbclass: use PACKAGESPLITFUNCS instead of =
populate_packages_prepend
=20=20web: remove gtkhtml2 version
=20=20gtkhtml2: remove, nothing depends on it
=20=20insane: remove unused variable
=20=20systemd: add udev-extraconf and USB/PCI IDs to RRECOMMENDS
=20=20package_ipk: check CONFFILES exist before adding them to metadata

Saul Wold (3):
=20=20remake: do not create po files
=20=20tzcode/tzdata: Update to 2012j
=20=20gnupg: fix CVE-2012-6085

Stefan Eichenberger (1):
=20=20Write DPKG_ARCH to /etc/apt/apt.conf

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (1):
=20=20klibc.bbclass: force thumb-interworking for eabi builds on armv4

Andreas M=C3=BCller (3):
=20=20ttf-fonts: inherit oe-core's fontcache.bbclass instead of update-fonts
=20=20update-fonts.bbclass: remove - we now use oe-core's fontcache.bbclass
=20=20font-update-common: remove

Andrei Gherzan (4):
=20=20x264: Add patch to remove default flags -mcpu=3Dcortex-a8 and =
-mfpu=3Dneon
=20=20libtorrent: Integrated version 0.13.3
=20=20rtorrent: Integrated version 0.9.3
=20=20minidlna: Integrated version 1.0.25

Aws Ismail (3):
=20=20traceroute: resolve multilib issues
=20=20netcat-openbsd: resolve multilib issues.
=20=20accel-ppp: resolve QA warnings and satisfy multilib

Joe Slater (1):
=20=20arptables: defeat multi-job for install

Kevin Baker (1):
=20=20redis: add new recipe for redis-2.6.9

Marcin Juszkiewicz (2):
=20=20oniguruma: add 5.9.3 version
=20=20cyrus-sasl2: add 2.1.26

Mario Domenech Goulart (1):
=20=20mg: add recipe for version 20110905

Martin Jansa (1):
=20=20ca-certificates: upgrade to 20130119

Otavio Salvador (1):
=20=20samba: Split libnss-winbind package

Paul Eggleton (8):
=20=20python-pyyaml: update to version 3.10 and tweak
=20=20libyaml: update to 0.1.4 and tweak
=20=20python-greenlet: add new recipe for version 0.3.4
=20=20python-gevent: add new recipe for version 0.13.8
=20=20python-psutil: add new recipe for version 0.6.1
=20=20python-pyopenssl: tweak recipe
=20=20python-lxml: update to 3.0.2 and tweak
=20=20python-feedparser: add new recipe for version 5.1.3

Ross Burton (2):
=20=20waffle: new package, a GL deferred resolution library.
=20=20gtkhtml2: add, from oe-core

Thomas Fitzsimmons (2):
=20=20lmsensors-config: Initial commit
=20=20lmsensors: Add lmsensors-config RRECOMMENDS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Andreas M=C3=BCller (2):
=20=20angstrom-clearlooks-theme-enable: fix postinst
=20=20angstrom-gnome-icon-theme-enable: fix postinst

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (7):
=20=20meta-toolchain-arago: also avoid mangling toolchain binaries in =
libexec
=20=20tclibc-external-arago-toolchain.inc: fix nativesdk preferences
=20=20toolchain-external-linaro: there are direct deps on eglibc, provide =
own TCLI
=20=20images: rename arago-headless-tisdk-image into =
tisdk-server-rootfs-image
=20=20arago.conf: mask netbase bbappend from meta-linaro, as it breaks =
machine nam
=20=20recipes: fix warnings about proto=3D deprecation
=20=20tisdk-image: adjust to changes in rootfs_ipk class in danny

Franklin S. Cooper Jr (15):
=20=20scripts: temp workaround for oe-core/scripts/bitbake bug
=20=20linux-libc-headers: Add linux-libc-headers version 2.6.37.2
=20=20ti-tisdk-makefile: Switch from ARMPKGARCH to PLATFORM_ARCH
=20=20arm-benchmarks_1.3: Tweak to allow am180x-evm to be built
=20=20sourceipk.bbclass: Provide the ability to change the source directory
=20=20ti-crypto-examples: Add ARM9 support
=20=20ti-crypto-examples: Tweak SRCIPK_SRC_DIR variable
=20=20tisdk-image.bbclass: Create SECONDARY_BOOTLOADER_NAME variable
=20=20arago-amsdk-image: Set SECONDARY_BOOTLOADER_NAME to empty string for =
omapl13
=20=20tisdk-amsdk-sdk-host: Add flash utility to SDK
=20=20board-port-labs: Inherit allarch class.
=20=20meta-toolchain-arago: Add cleanup_toolchain_packages
=20=20meta-toolchain-arago-tisdk: Set TOOLCHAIN_CLEANUP_PACKAGES
=20=20tisdk-image: Remove toolchain cleanup functionality
=20=20tisdk-image: Add support for new toolchain sdk structure

Sajesh Kumar Saran (1):
=20=20multiprocmgr: add initial version

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

Eric BENARD (1):
=20=20xf86-dri-vivante: fix licence chekcsum

Leonardo Sandoval (1):
=20=20gst-fsl-plugin: Include the Real-Time Extension lib into mfw_v4lsrc

Otavio Salvador (2):
=20=20u-boot-imx: Add imx6qsabresd support
=20=20u-boot-imx (mx6): Update to 1.1.0 BSP version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

Edward Ekelund (1):
=20=20Add support for zsh, dash (and possibly other shells)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

Adam YH Lee (1):
=20=20Updated local.conf to use 8 processes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

Andreas M=C3=BCller (2):
=20=20overo.conf: remove omap3-sgx-modules
=20=20u-boot-variables: correct screensaver setting / add journalctl to =
console

Samuel Stirtzel (1):
=20=20Card tools: ignore empty card reader slots

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (1):
=20=20mesa-dri: Update bbappend to version 9.0.2

Kishore Bodke (2):
=20=20cedartrail: remove BSP
=20=20meta-intel: remove cedartrail maintainer from the MAINTAINERS list

Richard Purdie (1):
=20=20emgd-driver-bin: Fix RDEPENDS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Florin Sarbu (6):
=20=20bluez: Add ${PN}-systemd to PACKAGES
=20=20oofono: Add ${PN}-systemd to PACKAGES
=20=20portmap: Add ${PN}-systemd to PACKAGES
=20=20audiomanager: Add ${PN}-systemd to PACKAGES
=20=20ecryptfs-utils: Add ${PN}-systemd to PACKAGES
=20=20audiomanager_git: Add ${PN}-systemd to PACKAGES

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

Samuel Stirtzel (23):
=20=20Fix recipes with recommendations from the OE styleguide
=20=20plasma-contour-config: whitespace fix
=20=20.gitignore: Add more types of temporary data to ignore
=20=20rasqal: Update to 0.9.29
=20=20redland: user ${BPN}-${PV} in the SRC_URI
=20=20soprano: update to 2.9.0
=20=20soprano-native: update to 2.9.0
=20=20attica: update to 0.4.1
=20=20kde-workspace: remove leftover patch
=20=20plasma-active: rename to plasma-mobile as this is the repository name
=20=20plasma-mobile: update to plasma active release 3.0
=20=20kdelibs4-native: update to 4.10
=20=20kdelibs4: update to 4.10
=20=20okular: update to 4.10
=20=20kcalc: update to 4.10
=20=20nepomuk-core: update to 4.10
=20=20strigi: added packaging enabled dbus
=20=20libkactivities4: update to 4.10
=20=20kde-workspace: update to 4.10
=20=20kde_cmake: update class to search for cmake files in the libdir
=20=20angstrom-images: move the basename export below the include of the =
basis ima
=20=20libkactivities: remove leftover patch
=20=20kde-runtime: update to 4.10

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

Denys Dmytriyenko (1):
=20=20am335x-evm, omap3*: drop remaining TARGET_ARCH, wrecking sstate

Franklin S. Cooper Jr (7):
=20=20machine config: Correct SERIAL_CONSOLE variable for am3517-evm and =
am37x-evm
=20=20linux-omapl138-psp_2.6.37: Add MACHINE_KERNEL_PR and fix white space =
issues.
=20=20linux-omapl138-psp: Add latest linux-omapl138 patches
=20=20ti-pru-sw-edma-driver: Port PRU SW edma driver from Arago
=20=20u-boot_2010.12-psp03.21.00.04.sdk: Add latest u-boot recipe for =
am180x-evm
=20=20ti-ocf-crypto-module: Port ti-ocf-crypto-module from Arago
=20=20u-boot_2012.04.01: Add latest u-boot recipe for am37x-evm

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Eric Blade (1):
=20=20webos_qmake: Add qmake-webos-native dependency

Keith Derrick (3):
=20=20webosvbox: Use port from VM in ssh command
=20=20webos-image: luna-service2=3D148
=20=20Add shared folders and video VBox guest additions

Martin Jansa (3):
=20=20zip: Explicitly disable bzip2 support
=20=20opkg: Fix opkglibdir for target opkg
=20=20build-changes: Import build-changes scripts from Juha Kurki

Sapna Todwal (1):
=20=20webos-image: nyx-modules=3D80

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Darren Hart (1):
=20=20meta-yocto: Document new oe-git-proxy in site.conf.sample

Emilia Ciobanu (1):
=20=20Solved package namespace errors in PRS

Khem Raj (1):
=20=20poky.conf: Add Ubuntu 12.04.2 to sanity tested distros

Richard Purdie (1):
=20=20local.conf.sample: Enhance the SSTATE_MIRRORS example

Ross Burton (3):
=20=20distro: remove matchbox-stroke
=20=20distro: remove clutter-box2d
=20=20distro: remove orinoco-conf

emilia.maria.silvia.ciobanu@intel.com (1):
=20=20Cleanup of upstream_tracking.inc file

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




