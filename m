Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QXzOa-0002vd-3b; Sat, 18 Jun 2011 19:33:20 +0200
Received: from localhost ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QXzLA-0004Ca-IU; Sat, 18 Jun 2011 13:29:48 -0400
Date: Sat, 18 Jun 2011 13:29:48 -0400
Message-Id: <E1QXzLA-0004Ca-IU@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-06-6 to 2011-06-13
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Jun 2011 17:33:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-06-6 to 2011-06-13.  Projects included in this report:

openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://git.angstrom-distribution.org/meta-angstrom
meta-yocto: git://git.yoctoproject.org/poky
meta-texasinstruments: =
git://git.angstrom-distribution.org/meta-texasinstruments
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-micro: git://git.openembedded.org/meta-micro
meta-slugos: git://github.com/kraj/meta-slugos
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-intel: git://git.yoctoproject.org/meta-intel
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bruce Ashfield (2):
=20=20linux-yocto: update target/meta SRCREVs
=20=20linux-yocto: make e1000e structure common [commit: bec3f1e8c]

Dongxiao Xu (1):
=20=20udev: Fix udevd launch issue after system second boot

Koen Kooi (6):
=20=20util-linux: package agetty seperately
=20=20avahi: fix dbus system-service packaging and move more things to .inc
=20=20librsvg 2.32.1: fix loader packaging when using gtk >2.20
=20=20consolekit: update to 0.4.5
=20=20sysvinit: split inittab into it's own recipe
=20=20metacity 2.30.3: fix build on GNOME-less hosts and fix packaging

Mark Hatle (4):
=20=20create-pull-request: Add URL documentation
=20=20distro_tracking_fields.inc: add pseudo
=20=20pseudo: Update pseudo to 1.1.1 version
=20=20pseudo: Fix problem related to realpath

Mei Lei (1):
=20=20distro_tracking_fields.inc: Fix a incorrect date format

Nitin A Kamble (1):
=20=20gcc: rebase the patch to avoid patch rejection

Paul Eggleton (1):
=20=20iproute2: update to 2.6.38

Phil Blundell (2):
=20=20sqlite: remove dependency on tcl-native
=20=20kexec-tools: don't depend on virtual/kernel

Richard  Purdie (1):
=20=20image_types.bbclass: Since we apply the override, look for the =
standard name

Richard Purdie (17):
=20=20sstate.bbclass: When removing files, take an exclusive lock, even for =
shared
=20=20package.bbclass: PACKAGELOCK is a shared lock file so inform sstate =
as such
=20=20scripts/bitbake: Only build tar-replacement-native when the build =
system tar
=20=20conf/sanity.conf: Set the minimum bitbake version correctly, we've =
needed re
=20=20native/nativesdk: Clean up the depends ordering after bitbake =
override handl
=20=20Revert "gcc: rebase the patch to avoid patch rejection"
=20=20pointercal: Inhibit toolchain dependencies as its just config files
=20=20formfactor: Inhibit toolchain dependencies as its just config files
=20=20keymaps: Inhibit toolchain dependencies as its just configuration =
files
=20=20usbinit: Inherit allarch as its a generic script
=20=20base-files: Inherit toolchain dependencies as a compiler isn't used
=20=20poky-feed-opkg: Disable default toolchain dependencies as these are =
just con
=20=20initscripts: makedevs is no longer used anywhere so drop dependency. =
Also in
=20=20sysvinit-inittab: Inhibit compiler/libc dependencies as this is just =
a confi
=20=20initrdscripts: Inhibit compiler/libc dependencies as this is just a =
configur
=20=20task-sdk-host: Add nativesdk to the task name so its clearer what the =
conten
=20=20nativesdk.bbclass: Correct ordering of manipulations

Saul Wold (8):
=20=20json-glib: Update to 0.12.4
=20=20distro tracking: update Qing -> Saul
=20=20distro tracking: fixup some bad entries
=20=20distro tracking: Manual Updates
=20=20bitbake.conf: Create staticdev pacakge for static libraries
=20=20task-core-tools: add mesa-demos to testapps list
=20=20core-image-sato-sdk: ensure testapps is part of sdk image
=20=20core-image-lsb-sdk: ensure testapps is part of sdk image

Scott Garman (5):
=20=20distro-tracking: updates
=20=20openssh: upgrade to v5.8p2
=20=20grep: upgrade to v2.8
=20=20tar: upgrade to v1.26
=20=20distro-tracking: update openssh, tar, and grep

Tom Zanussi (1):
=20=20initramfs-live-install: comment out allarch inherit to resolve no =
provider

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Khem Raj (2):
=20=20Add bbappend files for gcc 4.6.0 from oe-core
=20=20gcc-4.6: Remove recipes

Koen Kooi (47):
=20=20gtk+ 2.20.x: drop from layer to align with oe-core
=20=20connman 0.74: enable ntp plugin
=20=20libgweather 2.28.0: import from OE rev =
4c32184588b40ed094959cbe506f564b8a007
=20=20libwnck 2.30.5: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20gnome-menus 2.30.5: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d83
=20=20xrdb 1.0.9: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20gnome-panel 2.30.0: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d83
=20=20bonobo: add gtk-doc files
=20=20iso-codes 1.4: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20libxklavier 5.0: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20gdm 2.30.0: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20libgomeui: fix license URI
=20=20devicekit-power 014: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d8
=20=20gnome-session 2.30.2: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d
=20=20systemd: update runtime dependencies for agetty
=20=20gdm 2.30.2: add more to RRECOMMENDS, no login window without it
=20=20icon-naming-utils: add BBCLASSEXTENDED version of 0.8.90
=20=20gnome-themes 2.32.1: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d8
=20=20gdm 2.30.0: add metacity to RRECOMMENDS, gdm tries to execute it to =
manage d
=20=20move various GNOME recipes to meta-gnome
=20=20gconf: update to 2.32.3 (latest stable in 2.32.x series)
=20=20gdm: update to 2.32.2 (latest stable in 2.32.x series)
=20=20upower: initial commit of 0.9.11
=20=20sg3-utils: add 1.31
=20=20libatasmart: add 0.17
=20=20udisks: initial add of 1.0.2
=20=20gdm 2.32.2: add systemd support
=20=20cpufrequtils: update to 008
=20=20gvfs: add 1.8.2
=20=20nautilus: add 2.32.2
=20=20avahi-ui: add 0.6.30
=20=20libnotify: add 0.6.0
=20=20gnome-disk-utility: add 2.32.0
=20=20gconf 2.32.3: add missing gobject-instrospection dependency
=20=20systemd-compat-units: make opkg unit block startup
=20=20libgnomekdb: add 2.32.0
=20=20gnome-settings-daemon: add 2.32.1
=20=20gnome-control-center: add 2.32.1
=20=20system-tools-backends: add 2.10.2
=20=20systemd-compat-units: fix service name in opkg unit
=20=20xserver-xorg: remove xorg-minimal-fonts from DEPENDS
=20=20libgphoto2 2.4.8: import from OE rev =
a54456425ea3ce4c7cdfa958cec3ba34539cfee
=20=20libghoto2: update to 2.4.11
=20=20gvfs 1.8.2: enable gphoto2 support, fix sftp packaging
=20=20samba 3.5.6: import from OE rev =
a54456425ea3ce4c7cdfa958cec3ba34539cfeec
=20=20gvfs 1.8.2: enable samba support
=20=20esound: put patch in metadata, ubuntu updates it silenty from time to =
time b

Martin Jansa (4):
=20=20check: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
=20=20e-base,e-wm: bump EFL_SRCREV and remove illume1 from e-wm
=20=20eve: update LICENSE fields and remove patch applied upstream
=20=20webkit-efl: import from OE rev =
d4f0211e2078d5033ae0dee74664de5520d8392d

Michael 'Mickey' Lauer (1):
=20=20vala[-native]: 0.12.0 -> 0.12.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (2):
=20=20angstrom-bleeding.conf: Use gcc 4.6.0 instead of 4.6
=20=20angstrom-2010-preferred-versions.inc: Dont pin autoconf and automake

Koen Kooi (7):
=20=20angstrom: prefer newer gtk+
=20=20angstrom: prefer gobject-introspection-native 0.9.10 since the =
default versi
=20=20systemd-image: add cpufrequtils and htop     systemd-gnome-image: add =
image=20
=20=20systemd-gnome-image: fix initial gdm screen, add nautilus
=20=20systemd-gnome-image: more goodies!
=20=20systemd-gnome-image: make it look pretty by installing clearlooks
=20=20systemd-gnome-image: add bash and connman ntpd plugin

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (4):
=20=20linux-yocto: update target/meta SRCREVs
=20=20linux-yocto: make e1000e structure common [commit: bec3f1e8c]
=20=20linux-yocto/meta-yocto: update target/meta SRCREVs
=20=20linux-yocto/meta-yocto: make e1000e structure common [commit: =
bec3f1e8c]

Chris Larson (19):
=20=20parse: pass a useful (if mangled) key to bb.data.expand for :=3D
=20=20siggen: don't choke with traceback when data is None
=20=20bb.namedtuple_with_abc: add useful util from activestate
=20=20bb.exceptions: add code to create pickleable traceback entries
=20=20bb.exceptions: add to_string convenience function
=20=20bb.exceptions: handle tb entries without context
=20=20bb.exceptions: don't show a repr of 'self'
=20=20cooker: show a useful message for ParsingFailure
=20=20cooker: pass traceback back from parsing thread
=20=20cooker: use logger.exception for config file parse errors
=20=20cooker: don't show a useless traceback for SyntaxError
=20=20cooker: don't show a traceback for ParseError
=20=20Shift exception formatting into the UI
=20=20cooker: handle ExpansionError the same way we do ParseError
=20=20bb.exceptions: don't choke on frames without arguments
=20=20cooker: don't choke if we have nothing to parse
=20=20cooker: simplify self.configuration.data vs data usage
=20=20cooker: use BBHandler.inherit for INHERIT
=20=20Shift traceback pre-formatting into LogHandler

Dexuan Cui (16):
=20=20native.bbclass: allow a native package to be populated into its own =
dir
=20=20perl-native: populate into its own dir
=20=20perlnative.bbclass: add the file
=20=20gnu-config-native: should depend on perl-native-runtime rather than =
perl-nat
=20=20libcap: should depend on perl-native-runtime rather than perl-native
=20=20openssl: should depend on perl-native-runtime rather than perl-native
=20=20git: should depend on perl-native-runtime rather than perl-native
=20=20coreutils: remove unnecessary dependency on perl
=20=20dpkg: should depend on perl-native-runtime rather than perl-native
=20=20webkit-gtk: should depend on perl-native-runtime rather than =
perl-native
=20=20perl: inherit perlnative
=20=20cpan.bbclass, cpan-base.bbclas: update them for the perlnative change
=20=20libxml-parser-perl: inherit perlnative
=20=20libconvert-asn1-perl: fix EXTRA_PERLFLAGS due to the perl-native =
change
=20=20libxml-simple-perl: fix EXTRA_PERLFLAGS due the the perlnative change
=20=20icon-naming-utils-native: inherit perlnative

Dongxiao Xu (1):
=20=20udev: Fix udevd launch issue after system second boot

Koen Kooi (6):
=20=20util-linux: package agetty seperately
=20=20avahi: fix dbus system-service packaging and move more things to .inc
=20=20librsvg 2.32.1: fix loader packaging when using gtk >2.20
=20=20consolekit: update to 0.4.5
=20=20sysvinit: split inittab into it's own recipe
=20=20metacity 2.30.3: fix build on GNOME-less hosts and fix packaging

Liping Ke (4):
=20=20cache.py: Refactory Current Cache implementation
=20=20Introduce extra cache class for image creator
=20=20Introduce new param caches_array into Cache impl.
=20=20cache: Implement multiple extra cache fields request support

Mark Hatle (4):
=20=20create-pull-request: Add URL documentation
=20=20distro_tracking_fields.inc: add pseudo
=20=20pseudo: Update pseudo to 1.1.1 version
=20=20pseudo: Fix problem related to realpath

Mei Lei (1):
=20=20distro_tracking_fields.inc: Fix a incorrect date format

Nitin A Kamble (1):
=20=20gcc: rebase the patch to avoid patch rejection

Paul Eggleton (3):
=20=20iproute2: update to 2.6.38
=20=20track skipped packages
=20=20bitbake-layers: handle skipped recipes

Phil Blundell (2):
=20=20sqlite: remove dependency on tcl-native
=20=20kexec-tools: don't depend on virtual/kernel

Richard Purdie (29):
=20=20bitbake: Sync up with upstream cosmetic changes for bin/bitbake
=20=20bitbake: Cleanup bitbake server init process to be clearer to follow
=20=20bitbake none/xmlrpc servers: Only send pickled events to the xmlrpc =
server
=20=20bitbake: Add process server from upstream bitbake
=20=20bitbake/server/process: Update to new server API
=20=20bitbake/server/process: Implement getEvent()
=20=20bitbake/server/xmlrpc: Fix typo
=20=20bitbake/bin/bitbake: Return an error if exceptions occur
=20=20bitbake/lib/bb/__init__.py: Sync with upstream bitbake
=20=20bitbake/cooker.py: Fix debug message arguments
=20=20bitbake-layers: Fixup after recent server changes
=20=20bitbake/cooker.py: Misc sync with upstream
=20=20runqueue.py: Wrap parsing with exception trapping
=20=20bitbake/build.py: Drop exec_shell environment as its now unneeded
=20=20bitbake/data/runqueue: Sync up with upstream to clean up environment =
variabl
=20=20Drop psyco support
=20=20sstate.bbclass: When removing files, take an exclusive lock, even for =
shared
=20=20package.bbclass: PACKAGELOCK is a shared lock file so inform sstate =
as such
=20=20scripts/bitbake: Only build tar-replacement-native when the build =
system tar
=20=20bitbake/data_smart: Change overrides behaviour to remove expanded =
variables=20
=20=20bitbake/parse/ast: We always need to finalize the default data since =
otherwi
=20=20bitbake/event/ast: Add RecipePreFinalise event
=20=20Update version to 1.13.1
=20=20image_types.bbclass: Since we apply the override, look for the =
standard name
=20=20conf/sanity.conf: Set the minimum bitbake version correctly, we've =
needed re
=20=20native/nativesdk: Clean up the depends ordering after bitbake =
override handl
=20=20Revert "gcc: rebase the patch to avoid patch rejection"
=20=20bitbake/cooker: Fix -b option by ensuring the empty cache structure =
is prese
=20=20bitbake/fetch2: When replacing URLs in mirror handling mask out empty =
entrie

Saul Wold (9):
=20=20json-glib: Update to 0.12.4
=20=20distro tracking: update Qing -> Saul
=20=20distro tracking: fixup some bad entries
=20=20distro tracking: Manual Updates
=20=20bitbake.conf: Create staticdev pacakge for static libraries
=20=20local.conf.sample: remove default EXTRA_IMAGE_FEATURES
=20=20task-core-tools: add mesa-demos to testapps list
=20=20core-image-sato-sdk: ensure testapps is part of sdk image
=20=20core-image-lsb-sdk: ensure testapps is part of sdk image

Scott Garman (6):
=20=20distro-tracking: updates
=20=20openssh: upgrade to v5.8p2
=20=20grep: upgrade to v2.8
=20=20tar: upgrade to v1.26
=20=20distro-tracking: update openssh, tar, and grep
=20=20cache.py: fix bitbake -s command

Tom Zanussi (1):
=20=20initramfs-live-install: comment out allarch inherit to resolve no =
provider

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Darren Hart (1):
=20=20beagleboard: cleanup board-omap3beagle.c and allow for building =
without wl12

Koen Kooi (4):
=20=20x-load: add support for beagleboard C5
=20=20beagleboard: add comment about rev C5 NAND size
=20=20x-load: inherit deploy to fix spurious rebuilds in image targets
=20=20u-boot: inherit deploy to fix spurious rebuilds in image targets

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (2):
=20=20preferred-shr-versions: set SRCREV_pn-gobject-introspection*
=20=20meta-nokia: drop udev bbappend now when devtmpfs is preferred

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

Phil Blundell (5):
=20=20micro-uclibc.conf: use TCLIBC, not LIBC
=20=20micro.conf: update DISTRO_FEATURES etc
=20=20base-files: add fstab
=20=20busybox: disable legacy bits, enable zcip

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

Khem Raj (3):
=20=20preferred-slugos-versions.inc: Correctly use SRCREV
=20=20slugos-image.inc: Add opkg based on package-management being in =
IMAGE_FEATUR
=20=20distro/slugos: Remove ONLINE_PACKAGE_MANAGEMENT

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Tom Zanussi (1):
=20=20meta-intel: update kernel SRCREVs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Anand Balagopalakrishnan (1):
=20=20libgles-omap3: Specify the Window System to be updated in powervr.ini

Andrea Adami (9):
=20=20linux: update 2.6.39 defconfig for poodle
=20=20udev: remove unneeded customizations for Zaurus, use defaults
=20=20kexecboot: bump to f38f07d6bf7d3feea33bb7c1bbe4378eb0cb5bfd
=20=20linux-kexecboot: move from 2.6.39 to 2.6.39.1
=20=20linux: update defconfig for poodle used in the _git version
=20=20kexecboot: move git recipes to =
14e6d1a3641a749e4408fda1eadffe4f396b0279
=20=20linux-kexecboot: bump INC_PR to get latest kexecboot binary
=20=20klibc: add history in the patch headers
=20=20klibc: don't force ARM_INSTRUCTION_SET =3D "arm"

Denis 'GNUtoo' Carikli (10):
=20=20linux-nexusone: new recipe
=20=20Add new nexusone machine configuration
=20=20shr-image: select devtmpfs for the nexusone
=20=20xserver-xorg-conf: add nexusone xorg.conf and bump PR
=20=20xserver-common: add nexusone DPI
=20=20netbase: add support for nexusone
=20=20frameworkd: bump revision to get nexusone configurations.
=20=20crimsonfields: update to 0.5.3

Denys Dmytriyenko (1):
=20=20qt-4.6.3: update qt's powervr graphics driver plugin to work with SGX =
DDK v1

Eyal Reizer (3):
=20=20ti-wifi-utils: install calibrator ini files to rootfs
=20=20crda: fix regulatory domain agent for building with libnl2
=20=20wpa-gui-e: build the latest version from git sources

James Limbouris (1):
=20=20initscripts: Modify 'populate-volatile.sh' to atomically update =
'volatile.ca

Jeff Lance (1):
=20=20matrix_gui: Update SRCREV to revision 257

Klaus Kurzmann (2):
=20=20linux-openmoko_2.6.37.bb: allow setting DAI mode even while pcm is =
active
=20=20linux_2.6.37.bb: use non blocking DAI patch on om-gta02

Koen Kooi (1):
=20=20x-load: sync with meta-texasinstruments for beagle C5 support

Ludovic Desroches (1):
=20=20tiobench: Add version 0.3.3 (initial recipe)

Martin Jansa (1):
=20=20linux-2.6.37: update shr.patch and move =
gta02-dont-block-dai-switch.patch to

Paul Eggleton (2):
=20=20opie-ttf-support: add LICENSE field
=20=20h2200-bootloader: add LICENSE field

Siddharth Heroor (3):
=20=20ti816x machine: Fix JFFS Image command
=20=20ti816x machine: Update for latest kernel version
=20=20sysvinit: bump PR for ti816x serial console change

Stanislav Brabec (2):
=20=20expat.inc: Increment INC_PR to outbid pre-INC_PR binaries from feeds.
=20=20gst-plugins-good: Increment PR to rebuild with new pulseaudio.

Tom Rini (1):
=20=20udev: Make the dev cache work with /dev/shm

sledz (1):
=20=20linux-2.6.24: add another 4N-GALAXY.DE PID to ftdi_sio driver




