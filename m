Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QNOuS-0003ib-5G
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 14:34:28 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4KCVUW4004010
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 05:31:30 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 20 May 2011 05:31:29 -0700
Message-ID: <4DD65F20.2080003@windriver.com>
Date: Fri, 20 May 2011 07:31:28 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <E1QN7Sg-0003y1-3F@happy.bec-systems.com>	<BANLkTimEO3P8JmjcS9s50yqJWB=nBAkq+Q@mail.gmail.com>
	<BANLkTikfqBdcLfUb+rsfZFOacmpXoup8eA@mail.gmail.com>
In-Reply-To: <BANLkTikfqBdcLfUb+rsfZFOacmpXoup8eA@mail.gmail.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p4KCVUW4004010
Subject: Re: [oe] OE Changelog for 2011-4-8 to 2011-4-15
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
X-List-Received-Date: Fri, 20 May 2011 12:34:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I like this, the one suggest I have is at the TOP of the email, briefly n=
ote
which repositories are covered in this.

I didn't notice openembedded-core the first I looked at it, so I didn't t=
hink it
was there.

--Mark

On 5/20/11 12:55 AM, Anders Darander wrote:
> On Thu, May 19, 2011 at 20:43, Cliff Brake <cliff.brake@gmail.com> wrot=
e:
>> Are there any other repos or maillists that I should include in this
>> report?  I'm trying to increase visibility in what all the projects
>> are doing, so we can reduce duplication of work in various layers.
>=20
> Not suggesting another layer, but rather some layout/ordering changes.
>=20
> 1) Could the mail start by an ordered list of what repos/layers are
> covered? Something like:
> openembedded-core
> meta-openembedded
> meta-angstrom
> meta-texasinstruments
> openembedded
>=20
> 2) I think that quite a few (especially distro developers, no matter
> if it is public or in-house distros) would appreciate having the
> changelog in the order of the more "low-level" first. I.e. most people
> will be using oe-core and meta-oe, thus start with them. For the rest,
> I'm not sure, either sort by popularity or in a strictly alphabetical
> ordering. E.g.:
> Changelog for openembedded-core:
> Changelog for meta-openembedded:
> Changelog for meta-angstrom:
> Changelog for meta-texasinstruments:
> Changelog for openembedded:
>=20
> I think that this will increase the visibility of the lower level chang=
es.
>=20
> Regards,
> Anders
>=20
>> On Thu, May 19, 2011 at 1:56 PM,  <cliff.brake@gmail.com> wrote:
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>> Changelog for meta-angstrom:
>>>
>>> Khem Raj (1):
>>>  angstrom-bleeding.conf: Prefer gcc 4.6 from meta-openembedded
>>>
>>> Koen Kooi (2):
>>>  angstrom bleeding: prefer eglibc 2.13
>>>  angstrom: also pin libgcc-nativesdk
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>> Changelog for meta-openembedded:
>>>
>>> Khem Raj (1):
>>>  gcc-4.6: Add recipes
>>>
>>> Koen Kooi (1):
>>>  udev: update to 168
>>>
>>> Martin Jansa (11):
>>>  e-base: bump SRCREV and update fix-ecore-fb-initialization.patch pat=
ch for e
>>>  embryo, epdf: fix LICENSE, from oe.dev
>>>  udev: drop udev-compat for zaurus devices
>>>  libxfixes, util-macros: drop from meta-oe, now they are in oe-core
>>>  gst-plugins-base: drop 0.10.30 from meta-oe, there is 0.10.32 in oe-=
core
>>>  xinput-calibrator: add new version 0.7.5 and include .inc to recipe =
directly
>>>  python-argparse: add new recipe to provide argparse module for pytho=
n and py
>>>  gdbus-binding-tool: bump SRCREV
>>>  glib-2.0: add git version for 2.29.3+git, which has gdbus-codegen in=
cluded
>>>  connman: drop older 0.72
>>>  dnsmasq(-dbus): import from oe.dev, needed for connman now
>>>
>>> Otavio Salvador (16):
>>>  fuse: add version 2.8.5
>>>  ntfs-3g-ntfsprogs: add version 2011.4.12
>>>  freerdp: add recipe based on GIT from 2009-03-29
>>>  pixman.inc: use Xorg mirror
>>>  p910nd: add version 0.95
>>>  libiconv: drop hack since gettext was being inherited
>>>  libinih: add git recipe
>>>  qt4: drop 4.6 versions
>>>  postgresql: update to 8.4.7 since 8.4.4 was unfetchable
>>>  qt4: fix 4.7.2 checksum
>>>  qmake_base.bbclass: sync with oe-core class
>>>  setxkbmap: add version 1.2.0
>>>  p910nd: drop unused init script
>>>  qmake_base.bbclass: use using parallel staging dirs
>>>  glib-2.0: depends on python-argparse-native
>>>  libiconv: drop EXTRA_OECONF as it is handled by gettext class
>>>
>>> Simon Busch (1):
>>>  connman: add recipe for the latest released version 0.73
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>> Changelog for meta-texasinstruments:
>>>
>>> Paul Eggleton (2):
>>>  formfactor: add beagleboard formfactor file
>>>  netbase: automatically bring up usb0 on BeagleBoard xM
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>> Changelog for openembedded:
>>>
>>> Andreas M=C3=BCller (6):
>>>  u-boot: add 2011.03
>>>  overo: u-boot fix by moving to version 2011.03
>>>  elftosb: Add native helper to create boot stream files used by frees=
cale iMX
>>>  u-boot: Add support for freescale iMX28 SoCs
>>>  linux-imx-git: add support for freescale mx28evk
>>>  mx28evk: Add new machine definition
>>>
>>> Andrew Turley (1):
>>>  bug-app.inc: Allow to pass extra options to javac.
>>>
>>> Anil kumar M (2):
>>>  u-boot_git: Ethernet MACID display fix for CraneBoard
>>>  linux-omap-psp-2.6.32: Makefile change to revert AM3517EVM support a=
nd add C
>>>
>>> Denis 'GNUtoo' Carikli (3):
>>>  wordwarvi: add new recipe (arcade game)
>>>  wordwarvi: fix description
>>>  linux-nokia900-meego: remove oss and old alsa api
>>>
>>> Denis Carikli (9):
>>>  pointercal-xinput: add support for bug20
>>>  xserver-common-1.34: sync with oe-core
>>>  udev 165: depends on mtd-utils to fix compilation
>>>  udev-rules-buglabs: sync with buglabs repository
>>>  xf86-video-omapfb: use newer srcrev(fix segmentation fault for bug20=
)
>>>  linux-bug20-linaro: use newer srcrev
>>>  task-bug: fix do_rootfs conflict
>>>  preferred-shr-versions.inc: remove xserver-common prefered version
>>>  bug20.conf: switch to the 2.6.35 linaro kernel
>>>
>>> Denys Dmytriyenko (1):
>>>  libsndfile: add latest version 1.0.24, as older no longer available
>>>
>>> Eric BENARD (6):
>>>  busybox_git: update to today's master
>>>  qt4: introduce version 4.7.3
>>>  minimal: prefer qt 4.7.3
>>>  kaeilos-2009: prefer qt 4.7.3
>>>  shr: prefer qt 4.7.3
>>>  qt4: remove 4.7.2
>>>
>>> Eric B=C3=A9nard (5):
>>>  qt4-native: also build lrelease
>>>  qt4.inc: give the right name to variable qmake will use
>>>  qt4-4.7.3: add translations'support
>>>  qt4-native: unbreak qt4 compilation by providing the necessary nativ=
e tools
>>>  angstrom-2010: prefer qt 4.7.3
>>>
>>> Jason Kridner (1):
>>>  avrgal: add recipe for avrgal-1.0
>>>
>>> John E. Connolly (4):
>>>  task-bug-feed-extra: Add gdbserver
>>>  com.buglabs.bug.{module,jni}.motion.bb: Add recipes and add them to =
task-bug
>>>  alsa-state: New asound.state for bug20 reflecting .35 kernel
>>>  netbase: Cleanup bug20 interfaces file
>>>
>>> Khem Raj (1):
>>>  eglibc-2.12: Bump srcrev to latest on 2.12 branch
>>>
>>> Klaus Kurzmann (1):
>>>  fsogsmd: the lowlevel_nokia900 plugin is no more - don't try to pack=
age it
>>>
>>> Koen Kooi (5):
>>>  linux-omap-psp 2.6.32: support accept4 call
>>>  udev: add 168
>>>  systemd v26: remove accept patch, we really want accept4
>>>  angstrom: prefer udev 168
>>>  udev: add recipe to build from git (currently 168 + handfull of comm=
its)
>>>
>>> Leon Woestenberg (2):
>>>  warpcomm.conf: Add new machine TK71 Warpcomm (Marvell Kirkwood based=
).
>>>  linux-2.6.36: Add checksums for TK71 Warpcomm kernel patch.
>>>
>>> Marco Cavallini (1):
>>>  MAINTAINERS: removed xorg xinput-calibrator mantainers from my profi=
le
>>>
>>> Martin Jansa (29):
>>>  recipes: fix LICENSE fields
>>>  recipes: drop '+' from LICENSE fields
>>>  imlib2: sync LICENSE from meta-efl
>>>  gnome-desktop-2.32.1: disable desktop docs
>>>  foxtrotgps: upgrade to 1.0.1
>>>  linux(-kexecboot)_git: bump SRCREV for rc7
>>>  glib-2.0: add libffi to DEPENDS
>>>  Subject: [PATCH] glib-2.0: use PN instead of glib-2.0 in PACKAGES an=
d FILES
>>>  linux-2.6.37: update om-gta02 defconfig
>>>  linux-2.6.37: simplify om-gta02 defconfig with savedefconfig
>>>  linux-2.6.37: upgrade stablepatch to 2.6.37.6 and refresh openmoko/s=
hr patch
>>>  om-gta0*: use linux-2.6.37 and autoload snd-soc-wm8753 module
>>>  om-gta02: autoload also snd-soc-s3c24xx and bump task-base PR to use=
 new MAC
>>>  xserver-xorg: upgrade to 1.10.1.901 and make it default for SHR
>>>  om-gta0*: drop xf86-input-tslib
>>>  pointercal-xinput: sync koen's changes from meta-oe
>>>  xinput-calibrator: add 0.7.5 from meta-oe
>>>  xinput-calibrator: drop older versions
>>>  xlsclients: upgrade from 1.1.1 to 1.1.2
>>>  xf86-video-intel: upgrade from 2.14.902 to 2.15.0
>>>  libxext: upgrade from 1.2.0 to 1.3.0 and remove applied patch
>>>  dri2proto: upgrade from 2.3 to 2.4
>>>  glproto: upgrade from 1.4.12 to 1.4.13
>>>  libdrm: import 2.4.25 from meta-oe
>>>  libdrm: drop older versions
>>>  glproto, dri2proto: revert to old API until we have newer mesa
>>>  htcdream: drop xf86-input-tslib from XSERVER, it's not used in xorg-=
xserver-
>>>  task-shr-feed: drop xf86-input-tslib
>>>  cornucopia,libgisi: bump SRCREV
>>>
>>> Patrik Dahlstr=C3=B6m (1):
>>>  nodejs: Make configure script not use host libutil
>>>
>>> Paul Menzel (5):
>>>  foxtrotgps: add `libglade` to `DEPENDS`
>>>  watchdog_5.2.6: remove recipe since task fetch fails
>>>  glib-2.0_git: convert tabulator to spaces
>>>  glib-2.0_git: do not compile test program `gdbus-serialization`
>>>  pkgconfig: move 0.23 related things to include file `pkgconfig-0.23.=
inc`
>>>
>>> Peter Gsellmann (2):
>>>  ntp-4.2.6 configuration files
>>>  vsftpd-2.0.5 configuration files
>>>
>>> Petr =C5=A0tetiar (1):
>>>  linux-2.6.38: update to the latest stable patchset 2.6.38.5
>>>
>>> Philip Balister (1):
>>>  gnuradio : Update rev to latest master and add patch to really disab=
le volk.
>>>
>>> Robert Schuster (1):
>>>  cacao-native_hg: Fix cacao-shutdownguard.patch
>>>
>>> Simon Busch (7):
>>>  qt4-native: introduce the native version of qt4 and remove old qt4-t=
ools-nat
>>>  apiextractor-native: add initial recipe to build the native version
>>>  generatorrunner-native: add initial recipe to build the native versi=
on
>>>  shiboken-native: add initial version of recipe
>>>  libshiboken: add initial version of recipe
>>>  python-pyside-embedded: add initial version of this recipe
>>>  python-pyside-embedded: extend support for the QWS system
>>>
>>> Stefan Schmidt (7):
>>>  llvm2.7_2.7: Add patch for build errors on newer gcc / glibc combina=
tions
>>>  com.buglabs.app.bugdash2: Bump to newer version
>>>  bug-osgi.inc: Allow javac command to be specified by recipe.
>>>  linux-omap-hah_2.6.31: Bump for various fixes
>>>  matchbox-theme-bug/session: Remove battery applet
>>>  task-bug: Add connman-plugin-ethernet back into task-bug.
>>>  llvm2.7_2.7.bb: Update patch to use c++ include style.
>>>
>>> Tom Rini (3):
>>>  openssh.inc: Don't use ${libdir}exec
>>>  lmbench: Rework for binaries in /usr/bin
>>>  libedit: Ship all files, update LICENSE
>>>
>>> Ulf Samuelsson (2):
>>>  Clean up patch comments
>>>  Clean up whitespace
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>> Changelog for openembedded-core:
>>>
>>> Adrian Alonso (7):
>>>  insane: add micrblaze target info
>>>  kernel-arch: add microblaze to valid archs
>>>  siteinfo: add microblaze target info
>>>  linux-libc-headers: add microblaze ARCH definition
>>>  image-mklibs: add microblaze arch support
>>>  package_rpm: use target vendor information
>>>  readline: Upgrade 6.1 -> 6.2
>>>
>>> Bruce Ashfield (3):
>>>  linux-yocto: remove non-core (qemu) machine compatibility
>>>  linux-yocto: error if meta data not present
>>>  kern-tools: error if features are not found
>>>
>>> Dexuan Cui (2):
>>>  rsync (GPLv2):  fix security vulnerability CVE-2007-4091
>>>  recpies: add Upstream-Status for multiple recipes' patches
>>>
>>> Dongxiao Xu (1):
>>>  recipes: add Upstream-Status for multiple recipes
>>>
>>> Ilya Yanok (2):
>>>  toolchain-qte: include cross-compiler and fix env script
>>>  qt4-tools-nativesdk: -arch is required for nativesdk build
>>>
>>> Jingdong Lu (1):
>>>  bash: enable update-alternative to use bash as default shell
>>>
>>> Kang Kai (4):
>>>  libxml-sax-perl: added to create LSB olver test report
>>>  task-core-lsb: add packages into lsb image
>>>  lsbsetup: recreate locale fr_FR
>>>  foomatic-filters: add a link to pass LSB printing test
>>>
>>> Khem Raj (9):
>>>  recipes: Replace gconf-dbus with gconf
>>>  libgalago_0.5.2.bb: Fix compile for uclibc
>>>  liburcu_0.5.4.bb: Let it build on uclibc targets
>>>  lttng-ust_0.12.bb: Fix compilation on uclibc
>>>  oe/patch.py: Remove series file during Clean()
>>>  metadata_scm.bbclass: Use COREBASE to grok for SCM operations
>>>  meta/conf/layer.conf: Remove packages/*bb from BBFILES
>>>  conf/bitbake.conf: Add MACHINEOVERRIDES variable
>>>  util-linux: inherit pkgconfig
>>>
>>> Koen Kooi (1):
>>>  git: RDEPENDS are transitive, so remove tk so it builds with just OE=
-core
>>>
>>> Leon Woestenberg (1):
>>>  siteinfo.bbclass: Add powerpc-linux-gnuspe.
>>>
>>> Martin Jansa (4):
>>>  tcmode-default: lock also versions for eglibc
>>>  procps: use u-a for pmap, otherwise conflicts with pmap from busybox
>>>  lib/oe/process.py: import from OE
>>>  glib-2.0: use PN instead of glib-2.0 in PACKAGES and FILES
>>>
>>> Michael Lippautz (1):
>>>  python-native: Add ctypes patch to native build (as in cross-compila=
tion)
>>>
>>> Nitin A Kamble (16):
>>>  tcmode-default: Fix defaults for libgcc recipes
>>>  libunique: Fix for compilation with gcc 4.6.0
>>>  matchbox-wm-2: fix typo in Makefile
>>>  web: fix typo in Makefile
>>>  zaurusd: fix a typo in Makefile
>>>  dtc: fix compilation with gcc 4.6.0
>>>  mdadm: compilation fix for gcc 4.6.0
>>>  pax: fix for compiling with gcc 4.6.0
>>>  systemtap: fix for compilation with gcc 4.6.0
>>>  kexec-tools: fix compiler errors with gcc 4.6.0
>>>  libzypp: fix compilatoin with gcc 4.6.0
>>>  recipes: Fix the Upstream-Status format
>>>  gcc: fix target gcc runtime issue
>>>  gcc 4.5.1 4.6.0: remove unused patches
>>>  recipes: Update upstream-status of patches
>>>  tcmode-default: fix a typo
>>>
>>> Otavio Salvador (11):
>>>  scripts/oe-setup-builddir: fix typo
>>>  syslinux: improve packaging
>>>  meta/conf/local.conf.sample: fix mklibs comment line split and typo
>>>  busybox: add support to mdev
>>>  libxkbfile: disable xcb
>>>  insane.bbclass: skip license checksum if LICENSE is "CLOSED"
>>>  fuse: drop since it is not used by other recipes
>>>  conf/bitbake.conf: use --no-check-certificate to avoid errors when w=
getting
>>>  cmake.bbclass: fix qmake and rpath issues
>>>  qmake_base.bbclass: add generate_qt_config_file task
>>>  cmake: add support for oe qt4 tools names
>>>
>>> Paul Eggleton (3):
>>>  qt4: update from 4.7.2 to 4.7.3
>>>  distro_tracking_fields.inc: update for qt 4.7.3 upgrade
>>>  qt4: split out SQL driver config flags to QT_SQL_DRIVER_FLAGS
>>>
>>> Qing He (1):
>>>  update patch upstream status
>>>
>>> Richard Purdie (14):
>>>  bitbake.conf: Drop unused *GUI* and MACHINE_DISPLAY variables
>>>  linux-yocto: Allow bbappend files to add to COMPATIBLE_MACHINE to fi=
x errors
>>>  Revert "linux-yocto: Allow bbappend files to add to COMPATIBLE_MACHI=
NE to fi
>>>  Drop poky-floating-revisions.inc, poky-bleeding.conf and poky-lsb.co=
nf
>>>  bitbake.conf: Include the new default-providers.inc and default-vers=
ions.inc
>>>  distro: Add defaultsetup.conf, a set of default configuration provid=
ing sane
>>>  machine/qemu: Add qemu-config as an essential machine speicfic depen=
dency an
>>>  conf/distro/include/default-distrovars.inc: Create set of default 'd=
istro' v
>>>  preferred-xorg-versions.inc: Drop this, it makes no sense given we o=
nly have
>>>  distro/tclibc-uclibc: Append uclibc to key path names to allow paral=
lel ucli
>>>  matchbox-theme-sato/pseudo: Add DEFAULT_PREFERENCE =3D -1 for SCM re=
cipes
>>>  conf/distro/include: Remove old prebuilt OE toolchain support (repla=
ced by s
>>>  conf/distro: Drop poky.conf, nothing in here should be needed for bu=
ilds to
>>>  scripts/oe-setup-builddir: Add missing .sample extensions and defaul=
t to met
>>>
>>> Saul Wold (3):
>>>  web-sato: Update for svn -> git transtion
>>>  gtkhtml2: Update to 1161
>>>  distcc: Update SRC_URI
>>>
>>> Scott Garman (1):
>>>  gnome-doc-utils: Add additional missing -nonet options to xsltproc
>>>
>>> Xiaofeng Yan (4):
>>>  libxmu: Add native function
>>>  wq!lsb: Add init-functions to lsb-image
>>>  init-functions: Conforming applications may install one or more init=
ializati
>>>  lsbsetup: Add link for sendmail
>>>
>>> Yu Ke (6):
>>>  xf86-video-intel: upgrade from 2.14.0 to 2.15.0
>>>  sqlite: upgrade from 3.7.5 to 3.7.6.2
>>>  xserver-xf86-dri-lite: upgrade from 1.9.3 to 1.10.1
>>>  xserver-xf86-dri-lite_git: upgrade to 1.10.2 RC1 snapshot
>>>  xserver-xf86-lite: upgrade to from 1.7 RC2 to 1.10.1
>>>  recipes: Add Upstream-Status for multiple recipes
>>>
>>> Zhai Edwin (4):
>>>  qemu-script: Fix qemu seg fault if install Nvidia proprietary driver.
>>>  clutter-cairo: remove remaining files from this obsolete recipe
>>>  qemu: Upgrade qemu git to the latest 0.14 branch
>>>  recipes: Add Upstream-Status to multiple recipes
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
>>>
>>
>>
>>
>> --
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> http://bec-systems.com
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>=20
>=20
>=20



