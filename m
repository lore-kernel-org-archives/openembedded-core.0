Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QN8FD-0006QT-R6; Thu, 19 May 2011 20:46:48 +0200
Received: by pzk36 with SMTP id 36so1369510pzk.6
	for <multiple recipients>; Thu, 19 May 2011 11:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=3KzQVUpKa9MD1B0uQfBG/N3MJlraF6kT0XEI/wLshk8=;
	b=ODX+VtxtRsu1XLKpd51Xcd8tKODv4hfnX769Sq4FcaSiLcf8hdK8Fivd45FzRYBK5m
	5m1Plp2CZJ5x4YeXpYaLsJySNcvKD0gLGFHB6rlWhFkRKvKhvHNSZ3Qgtr4M8cUYTF/w
	gmQKapRXHx4Wr8RkxFZK1YkFv5Q/iRrE0Q3fI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=goX/aMkLhw5r8mMH1Goby1bmwqLsPld+iUBDxgoPpCXPYwHiu0crQsTJviPS6CsBPO
	aNainyylOi72Pi3u2aJtYT2h6fOXFT2ail2qod19RNmbn5bEXPZ9jIEtda9VFVA1Yt5W
	PI+ihrhFNHVIq4yveycJevtYVjafYonHDuBGA=
MIME-Version: 1.0
Received: by 10.68.69.43 with SMTP id b11mr5092721pbu.18.1305830629711; Thu,
	19 May 2011 11:43:49 -0700 (PDT)
Received: by 10.68.42.5 with HTTP; Thu, 19 May 2011 11:43:49 -0700 (PDT)
In-Reply-To: <E1QN7Sg-0003y1-3F@happy.bec-systems.com>
References: <E1QN7Sg-0003y1-3F@happy.bec-systems.com>
Date: Thu, 19 May 2011 14:43:49 -0400
Message-ID: <BANLkTimEO3P8JmjcS9s50yqJWB=nBAkq+Q@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 19 May 2011 18:46:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Are there any other repos or maillists that I should include in this
report?  I'm trying to increase visibility in what all the projects
are doing, so we can reduce duplication of work in various layers.

Thanks,
Cliff

On Thu, May 19, 2011 at 1:56 PM,  <cliff.brake@gmail.com> wrote:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-angstrom:
>
> Khem Raj (1):
> =C2=A0angstrom-bleeding.conf: Prefer gcc 4.6 from meta-openembedded
>
> Koen Kooi (2):
> =C2=A0angstrom bleeding: prefer eglibc 2.13
> =C2=A0angstrom: also pin libgcc-nativesdk
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-openembedded:
>
> Khem Raj (1):
> =C2=A0gcc-4.6: Add recipes
>
> Koen Kooi (1):
> =C2=A0udev: update to 168
>
> Martin Jansa (11):
> =C2=A0e-base: bump SRCREV and update fix-ecore-fb-initialization.patch pa=
tch for e
> =C2=A0embryo, epdf: fix LICENSE, from oe.dev
> =C2=A0udev: drop udev-compat for zaurus devices
> =C2=A0libxfixes, util-macros: drop from meta-oe, now they are in oe-core
> =C2=A0gst-plugins-base: drop 0.10.30 from meta-oe, there is 0.10.32 in oe=
-core
> =C2=A0xinput-calibrator: add new version 0.7.5 and include .inc to recipe=
 directly
> =C2=A0python-argparse: add new recipe to provide argparse module for pyth=
on and py
> =C2=A0gdbus-binding-tool: bump SRCREV
> =C2=A0glib-2.0: add git version for 2.29.3+git, which has gdbus-codegen i=
ncluded
> =C2=A0connman: drop older 0.72
> =C2=A0dnsmasq(-dbus): import from oe.dev, needed for connman now
>
> Otavio Salvador (16):
> =C2=A0fuse: add version 2.8.5
> =C2=A0ntfs-3g-ntfsprogs: add version 2011.4.12
> =C2=A0freerdp: add recipe based on GIT from 2009-03-29
> =C2=A0pixman.inc: use Xorg mirror
> =C2=A0p910nd: add version 0.95
> =C2=A0libiconv: drop hack since gettext was being inherited
> =C2=A0libinih: add git recipe
> =C2=A0qt4: drop 4.6 versions
> =C2=A0postgresql: update to 8.4.7 since 8.4.4 was unfetchable
> =C2=A0qt4: fix 4.7.2 checksum
> =C2=A0qmake_base.bbclass: sync with oe-core class
> =C2=A0setxkbmap: add version 1.2.0
> =C2=A0p910nd: drop unused init script
> =C2=A0qmake_base.bbclass: use using parallel staging dirs
> =C2=A0glib-2.0: depends on python-argparse-native
> =C2=A0libiconv: drop EXTRA_OECONF as it is handled by gettext class
>
> Simon Busch (1):
> =C2=A0connman: add recipe for the latest released version 0.73
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for meta-texasinstruments:
>
> Paul Eggleton (2):
> =C2=A0formfactor: add beagleboard formfactor file
> =C2=A0netbase: automatically bring up usb0 on BeagleBoard xM
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for openembedded:
>
> Andreas M=C3=BCller (6):
> =C2=A0u-boot: add 2011.03
> =C2=A0overo: u-boot fix by moving to version 2011.03
> =C2=A0elftosb: Add native helper to create boot stream files used by free=
scale iMX
> =C2=A0u-boot: Add support for freescale iMX28 SoCs
> =C2=A0linux-imx-git: add support for freescale mx28evk
> =C2=A0mx28evk: Add new machine definition
>
> Andrew Turley (1):
> =C2=A0bug-app.inc: Allow to pass extra options to javac.
>
> Anil kumar M (2):
> =C2=A0u-boot_git: Ethernet MACID display fix for CraneBoard
> =C2=A0linux-omap-psp-2.6.32: Makefile change to revert AM3517EVM support =
and add C
>
> Denis 'GNUtoo' Carikli (3):
> =C2=A0wordwarvi: add new recipe (arcade game)
> =C2=A0wordwarvi: fix description
> =C2=A0linux-nokia900-meego: remove oss and old alsa api
>
> Denis Carikli (9):
> =C2=A0pointercal-xinput: add support for bug20
> =C2=A0xserver-common-1.34: sync with oe-core
> =C2=A0udev 165: depends on mtd-utils to fix compilation
> =C2=A0udev-rules-buglabs: sync with buglabs repository
> =C2=A0xf86-video-omapfb: use newer srcrev(fix segmentation fault for bug2=
0)
> =C2=A0linux-bug20-linaro: use newer srcrev
> =C2=A0task-bug: fix do_rootfs conflict
> =C2=A0preferred-shr-versions.inc: remove xserver-common prefered version
> =C2=A0bug20.conf: switch to the 2.6.35 linaro kernel
>
> Denys Dmytriyenko (1):
> =C2=A0libsndfile: add latest version 1.0.24, as older no longer available
>
> Eric BENARD (6):
> =C2=A0busybox_git: update to today's master
> =C2=A0qt4: introduce version 4.7.3
> =C2=A0minimal: prefer qt 4.7.3
> =C2=A0kaeilos-2009: prefer qt 4.7.3
> =C2=A0shr: prefer qt 4.7.3
> =C2=A0qt4: remove 4.7.2
>
> Eric B=C3=A9nard (5):
> =C2=A0qt4-native: also build lrelease
> =C2=A0qt4.inc: give the right name to variable qmake will use
> =C2=A0qt4-4.7.3: add translations'support
> =C2=A0qt4-native: unbreak qt4 compilation by providing the necessary nati=
ve tools
> =C2=A0angstrom-2010: prefer qt 4.7.3
>
> Jason Kridner (1):
> =C2=A0avrgal: add recipe for avrgal-1.0
>
> John E. Connolly (4):
> =C2=A0task-bug-feed-extra: Add gdbserver
> =C2=A0com.buglabs.bug.{module,jni}.motion.bb: Add recipes and add them to=
 task-bug
> =C2=A0alsa-state: New asound.state for bug20 reflecting .35 kernel
> =C2=A0netbase: Cleanup bug20 interfaces file
>
> Khem Raj (1):
> =C2=A0eglibc-2.12: Bump srcrev to latest on 2.12 branch
>
> Klaus Kurzmann (1):
> =C2=A0fsogsmd: the lowlevel_nokia900 plugin is no more - don't try to pac=
kage it
>
> Koen Kooi (5):
> =C2=A0linux-omap-psp 2.6.32: support accept4 call
> =C2=A0udev: add 168
> =C2=A0systemd v26: remove accept patch, we really want accept4
> =C2=A0angstrom: prefer udev 168
> =C2=A0udev: add recipe to build from git (currently 168 + handfull of com=
mits)
>
> Leon Woestenberg (2):
> =C2=A0warpcomm.conf: Add new machine TK71 Warpcomm (Marvell Kirkwood base=
d).
> =C2=A0linux-2.6.36: Add checksums for TK71 Warpcomm kernel patch.
>
> Marco Cavallini (1):
> =C2=A0MAINTAINERS: removed xorg xinput-calibrator mantainers from my prof=
ile
>
> Martin Jansa (29):
> =C2=A0recipes: fix LICENSE fields
> =C2=A0recipes: drop '+' from LICENSE fields
> =C2=A0imlib2: sync LICENSE from meta-efl
> =C2=A0gnome-desktop-2.32.1: disable desktop docs
> =C2=A0foxtrotgps: upgrade to 1.0.1
> =C2=A0linux(-kexecboot)_git: bump SRCREV for rc7
> =C2=A0glib-2.0: add libffi to DEPENDS
> =C2=A0Subject: [PATCH] glib-2.0: use PN instead of glib-2.0 in PACKAGES a=
nd FILES
> =C2=A0linux-2.6.37: update om-gta02 defconfig
> =C2=A0linux-2.6.37: simplify om-gta02 defconfig with savedefconfig
> =C2=A0linux-2.6.37: upgrade stablepatch to 2.6.37.6 and refresh openmoko/=
shr patch
> =C2=A0om-gta0*: use linux-2.6.37 and autoload snd-soc-wm8753 module
> =C2=A0om-gta02: autoload also snd-soc-s3c24xx and bump task-base PR to us=
e new MAC
> =C2=A0xserver-xorg: upgrade to 1.10.1.901 and make it default for SHR
> =C2=A0om-gta0*: drop xf86-input-tslib
> =C2=A0pointercal-xinput: sync koen's changes from meta-oe
> =C2=A0xinput-calibrator: add 0.7.5 from meta-oe
> =C2=A0xinput-calibrator: drop older versions
> =C2=A0xlsclients: upgrade from 1.1.1 to 1.1.2
> =C2=A0xf86-video-intel: upgrade from 2.14.902 to 2.15.0
> =C2=A0libxext: upgrade from 1.2.0 to 1.3.0 and remove applied patch
> =C2=A0dri2proto: upgrade from 2.3 to 2.4
> =C2=A0glproto: upgrade from 1.4.12 to 1.4.13
> =C2=A0libdrm: import 2.4.25 from meta-oe
> =C2=A0libdrm: drop older versions
> =C2=A0glproto, dri2proto: revert to old API until we have newer mesa
> =C2=A0htcdream: drop xf86-input-tslib from XSERVER, it's not used in xorg=
-xserver-
> =C2=A0task-shr-feed: drop xf86-input-tslib
> =C2=A0cornucopia,libgisi: bump SRCREV
>
> Patrik Dahlstr=C3=B6m (1):
> =C2=A0nodejs: Make configure script not use host libutil
>
> Paul Menzel (5):
> =C2=A0foxtrotgps: add `libglade` to `DEPENDS`
> =C2=A0watchdog_5.2.6: remove recipe since task fetch fails
> =C2=A0glib-2.0_git: convert tabulator to spaces
> =C2=A0glib-2.0_git: do not compile test program `gdbus-serialization`
> =C2=A0pkgconfig: move 0.23 related things to include file `pkgconfig-0.23=
.inc`
>
> Peter Gsellmann (2):
> =C2=A0ntp-4.2.6 configuration files
> =C2=A0vsftpd-2.0.5 configuration files
>
> Petr =C5=A0tetiar (1):
> =C2=A0linux-2.6.38: update to the latest stable patchset 2.6.38.5
>
> Philip Balister (1):
> =C2=A0gnuradio : Update rev to latest master and add patch to really disa=
ble volk.
>
> Robert Schuster (1):
> =C2=A0cacao-native_hg: Fix cacao-shutdownguard.patch
>
> Simon Busch (7):
> =C2=A0qt4-native: introduce the native version of qt4 and remove old qt4-=
tools-nat
> =C2=A0apiextractor-native: add initial recipe to build the native version
> =C2=A0generatorrunner-native: add initial recipe to build the native vers=
ion
> =C2=A0shiboken-native: add initial version of recipe
> =C2=A0libshiboken: add initial version of recipe
> =C2=A0python-pyside-embedded: add initial version of this recipe
> =C2=A0python-pyside-embedded: extend support for the QWS system
>
> Stefan Schmidt (7):
> =C2=A0llvm2.7_2.7: Add patch for build errors on newer gcc / glibc combin=
ations
> =C2=A0com.buglabs.app.bugdash2: Bump to newer version
> =C2=A0bug-osgi.inc: Allow javac command to be specified by recipe.
> =C2=A0linux-omap-hah_2.6.31: Bump for various fixes
> =C2=A0matchbox-theme-bug/session: Remove battery applet
> =C2=A0task-bug: Add connman-plugin-ethernet back into task-bug.
> =C2=A0llvm2.7_2.7.bb: Update patch to use c++ include style.
>
> Tom Rini (3):
> =C2=A0openssh.inc: Don't use ${libdir}exec
> =C2=A0lmbench: Rework for binaries in /usr/bin
> =C2=A0libedit: Ship all files, update LICENSE
>
> Ulf Samuelsson (2):
> =C2=A0Clean up patch comments
> =C2=A0Clean up whitespace
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> Changelog for openembedded-core:
>
> Adrian Alonso (7):
> =C2=A0insane: add micrblaze target info
> =C2=A0kernel-arch: add microblaze to valid archs
> =C2=A0siteinfo: add microblaze target info
> =C2=A0linux-libc-headers: add microblaze ARCH definition
> =C2=A0image-mklibs: add microblaze arch support
> =C2=A0package_rpm: use target vendor information
> =C2=A0readline: Upgrade 6.1 -> 6.2
>
> Bruce Ashfield (3):
> =C2=A0linux-yocto: remove non-core (qemu) machine compatibility
> =C2=A0linux-yocto: error if meta data not present
> =C2=A0kern-tools: error if features are not found
>
> Dexuan Cui (2):
> =C2=A0rsync (GPLv2): =C2=A0fix security vulnerability CVE-2007-4091
> =C2=A0recpies: add Upstream-Status for multiple recipes' patches
>
> Dongxiao Xu (1):
> =C2=A0recipes: add Upstream-Status for multiple recipes
>
> Ilya Yanok (2):
> =C2=A0toolchain-qte: include cross-compiler and fix env script
> =C2=A0qt4-tools-nativesdk: -arch is required for nativesdk build
>
> Jingdong Lu (1):
> =C2=A0bash: enable update-alternative to use bash as default shell
>
> Kang Kai (4):
> =C2=A0libxml-sax-perl: added to create LSB olver test report
> =C2=A0task-core-lsb: add packages into lsb image
> =C2=A0lsbsetup: recreate locale fr_FR
> =C2=A0foomatic-filters: add a link to pass LSB printing test
>
> Khem Raj (9):
> =C2=A0recipes: Replace gconf-dbus with gconf
> =C2=A0libgalago_0.5.2.bb: Fix compile for uclibc
> =C2=A0liburcu_0.5.4.bb: Let it build on uclibc targets
> =C2=A0lttng-ust_0.12.bb: Fix compilation on uclibc
> =C2=A0oe/patch.py: Remove series file during Clean()
> =C2=A0metadata_scm.bbclass: Use COREBASE to grok for SCM operations
> =C2=A0meta/conf/layer.conf: Remove packages/*bb from BBFILES
> =C2=A0conf/bitbake.conf: Add MACHINEOVERRIDES variable
> =C2=A0util-linux: inherit pkgconfig
>
> Koen Kooi (1):
> =C2=A0git: RDEPENDS are transitive, so remove tk so it builds with just O=
E-core
>
> Leon Woestenberg (1):
> =C2=A0siteinfo.bbclass: Add powerpc-linux-gnuspe.
>
> Martin Jansa (4):
> =C2=A0tcmode-default: lock also versions for eglibc
> =C2=A0procps: use u-a for pmap, otherwise conflicts with pmap from busybo=
x
> =C2=A0lib/oe/process.py: import from OE
> =C2=A0glib-2.0: use PN instead of glib-2.0 in PACKAGES and FILES
>
> Michael Lippautz (1):
> =C2=A0python-native: Add ctypes patch to native build (as in cross-compil=
ation)
>
> Nitin A Kamble (16):
> =C2=A0tcmode-default: Fix defaults for libgcc recipes
> =C2=A0libunique: Fix for compilation with gcc 4.6.0
> =C2=A0matchbox-wm-2: fix typo in Makefile
> =C2=A0web: fix typo in Makefile
> =C2=A0zaurusd: fix a typo in Makefile
> =C2=A0dtc: fix compilation with gcc 4.6.0
> =C2=A0mdadm: compilation fix for gcc 4.6.0
> =C2=A0pax: fix for compiling with gcc 4.6.0
> =C2=A0systemtap: fix for compilation with gcc 4.6.0
> =C2=A0kexec-tools: fix compiler errors with gcc 4.6.0
> =C2=A0libzypp: fix compilatoin with gcc 4.6.0
> =C2=A0recipes: Fix the Upstream-Status format
> =C2=A0gcc: fix target gcc runtime issue
> =C2=A0gcc 4.5.1 4.6.0: remove unused patches
> =C2=A0recipes: Update upstream-status of patches
> =C2=A0tcmode-default: fix a typo
>
> Otavio Salvador (11):
> =C2=A0scripts/oe-setup-builddir: fix typo
> =C2=A0syslinux: improve packaging
> =C2=A0meta/conf/local.conf.sample: fix mklibs comment line split and typo
> =C2=A0busybox: add support to mdev
> =C2=A0libxkbfile: disable xcb
> =C2=A0insane.bbclass: skip license checksum if LICENSE is "CLOSED"
> =C2=A0fuse: drop since it is not used by other recipes
> =C2=A0conf/bitbake.conf: use --no-check-certificate to avoid errors when =
wgetting
> =C2=A0cmake.bbclass: fix qmake and rpath issues
> =C2=A0qmake_base.bbclass: add generate_qt_config_file task
> =C2=A0cmake: add support for oe qt4 tools names
>
> Paul Eggleton (3):
> =C2=A0qt4: update from 4.7.2 to 4.7.3
> =C2=A0distro_tracking_fields.inc: update for qt 4.7.3 upgrade
> =C2=A0qt4: split out SQL driver config flags to QT_SQL_DRIVER_FLAGS
>
> Qing He (1):
> =C2=A0update patch upstream status
>
> Richard Purdie (14):
> =C2=A0bitbake.conf: Drop unused *GUI* and MACHINE_DISPLAY variables
> =C2=A0linux-yocto: Allow bbappend files to add to COMPATIBLE_MACHINE to f=
ix errors
> =C2=A0Revert "linux-yocto: Allow bbappend files to add to COMPATIBLE_MACH=
INE to fi
> =C2=A0Drop poky-floating-revisions.inc, poky-bleeding.conf and poky-lsb.c=
onf
> =C2=A0bitbake.conf: Include the new default-providers.inc and default-ver=
sions.inc
> =C2=A0distro: Add defaultsetup.conf, a set of default configuration provi=
ding sane
> =C2=A0machine/qemu: Add qemu-config as an essential machine speicfic depe=
ndency an
> =C2=A0conf/distro/include/default-distrovars.inc: Create set of default '=
distro' v
> =C2=A0preferred-xorg-versions.inc: Drop this, it makes no sense given we =
only have
> =C2=A0distro/tclibc-uclibc: Append uclibc to key path names to allow para=
llel ucli
> =C2=A0matchbox-theme-sato/pseudo: Add DEFAULT_PREFERENCE =3D -1 for SCM r=
ecipes
> =C2=A0conf/distro/include: Remove old prebuilt OE toolchain support (repl=
aced by s
> =C2=A0conf/distro: Drop poky.conf, nothing in here should be needed for b=
uilds to
> =C2=A0scripts/oe-setup-builddir: Add missing .sample extensions and defau=
lt to met
>
> Saul Wold (3):
> =C2=A0web-sato: Update for svn -> git transtion
> =C2=A0gtkhtml2: Update to 1161
> =C2=A0distcc: Update SRC_URI
>
> Scott Garman (1):
> =C2=A0gnome-doc-utils: Add additional missing -nonet options to xsltproc
>
> Xiaofeng Yan (4):
> =C2=A0libxmu: Add native function
> =C2=A0wq!lsb: Add init-functions to lsb-image
> =C2=A0init-functions: Conforming applications may install one or more ini=
tializati
> =C2=A0lsbsetup: Add link for sendmail
>
> Yu Ke (6):
> =C2=A0xf86-video-intel: upgrade from 2.14.0 to 2.15.0
> =C2=A0sqlite: upgrade from 3.7.5 to 3.7.6.2
> =C2=A0xserver-xf86-dri-lite: upgrade from 1.9.3 to 1.10.1
> =C2=A0xserver-xf86-dri-lite_git: upgrade to 1.10.2 RC1 snapshot
> =C2=A0xserver-xf86-lite: upgrade to from 1.7 RC2 to 1.10.1
> =C2=A0recipes: Add Upstream-Status for multiple recipes
>
> Zhai Edwin (4):
> =C2=A0qemu-script: Fix qemu seg fault if install Nvidia proprietary drive=
r.
> =C2=A0clutter-cairo: remove remaining files from this obsolete recipe
> =C2=A0qemu: Upgrade qemu git to the latest 0.14 branch
> =C2=A0recipes: Add Upstream-Status to multiple recipes
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


