Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RVra0-0006LH-E8; Wed, 30 Nov 2011 22:20:37 +0100
Received: from localhost.localdomain ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RVrTW-00053v-3t; Wed, 30 Nov 2011 16:13:54 -0500
Date: Wed, 30 Nov 2011 16:13:54 -0500
Message-Id: <E1RVrTW-00053v-3t@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-11-21 to 2011-11-28
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
X-List-Received-Date: Wed, 30 Nov 2011 21:20:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-11-21 to 2011-11-28.  Projects included in this report:

bitbake: git://git.openembedded.org/bitbake
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
meta-handheld: git://git.openembedded.org/meta-handheld
meta-opie: git://git.openembedded.org/meta-opie
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Matthew McClintock (3):
=20=20bitbake: print out symmetric difference when comparing sigs
=20=20siggen.py: sort task hash depedencies with basepath
=20=20Nothing uses USERNAME, remove it - can cause sstate-cache conflicts

Richard Purdie (12):
=20=20bitbake/runqueue.py: Fix incorrect task number reference in debug =
message
=20=20bitbake/runqueue.py: Sort the list of skipped tasks as it makes =
searching th
=20=20bitbake/runqueue.py: Add BB_SETSCENE_VERIFY_FUNCTION hook
=20=20runqueue.py: Ensure setscene tasks don't break dependency order
=20=20runqueue.py: Ensure we fully process the covered list
=20=20fetch2/local: Don't default to files in DL_DIR for file:// urls
=20=20runqueue.py: Fix debug message to reference the correct task
=20=20knotty: Add support for logging the console to logfile
=20=20fetch2: Improve uri_replace to handle paths with no trailing '/'
=20=20data/siggen: Add vardepvalue mechanism to allow the variable =
dependency code
=20=20bitbake/siggen.py: Don't backtrace if the taskhash data isn't present
=20=20Update users of getVar/setVar to use the data store functions directly

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Dexuan Cui (1):
=20=20gcc-package-target.inc: add the symbol link /lib/cpp

Kang Kai (1):
=20=20eglibc_2.13: update SRCREV

Matthew McClintock (3):
=20=20patch.bbclass: Add PATCHRESOLVE to excluded vars for generating =
sstate-cache
=20=20eglibc.inc: Remove EGLIBPARALLELISM from deps for EXTRA_OEMAKE
=20=20Nothing uses USERNAME, remove it - can cause sstate-cache conflicts

Mei Lei (1):
=20=20rpm: Flush old logs by change the DB_CONFIG

Nitin A Kamble (2):
=20=20at: update the upstream-status of patches
=20=20site/x86_64-linux: add cvs config variables

Richard Purdie (18):
=20=20package.bbclass: Ensure paths to rpmmarcos and rpmpopt are set
=20=20staging.bbclass: Add BB_SETSCENE_VERIFY_FUNCTION function
=20=20staging: Remove debug accidently left in
=20=20matchbox-stroke: Update to latest git revision to add missing Xrender =
depend
=20=20gconf: Ensure that GCONF_SCHEMA_INSTALL_SOURCE uses correct paths
=20=20gconf: Ensure the correct backend directory is used
=20=20gconf: Add note to header about patch filed upstream
=20=20apt: Fix locale header and hardcoded libname issues
=20=20libtool: Avoid relinking when cross compiling, its pointless
=20=20base.bbclass: Use bb.plain to print the build header
=20=20bitbake.conf: Set BB_CONSOLELOG so we log console messages by default
=20=20avahi-ui: Fix packaging and conflict with the avahi recipe
=20=20bitbake.conf: We only care about the absolute value of baselib
=20=20ofono: Fix missing python dependency and package tests separately
=20=20ghostscript: Really fix parallel make race
=20=20ghostscript-native: Ensure the sys/time/h fix is applied for native =
builds
=20=20ghostscript: Ensure we run reautoconf
=20=20getVar/setVar cleanups

Saul Wold (2):
=20=20distro_tracking: Refect Recipe Updates & Status
=20=20distro_tracking_fields: Update after Manual Check

Scott Garman (3):
=20=20distro_tracking: update manual checks for various recipes
=20=20dosfstools: add Upstream-Status to patches
=20=20base-passwd: add Upstream-Status to patches, remove unused patch

Shane Wang (3):
=20=20distro_tracking: update manual checks for recipes
=20=20distro_tracking: update manual checks for recipes
=20=20distro_tracking: update manual checks for recipes

Xiaofeng Yan (3):
=20=20directfb: change check sum
=20=20tslib: Set open mode for ts_calibate.c
=20=20gtk+: Have gtk+ pick up ${NM} from the environment

Zhai Edwin (1):
=20=20matchbox-wm: Fix variable type in _NET_WORKAREA setting

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Khem Raj (1):
=20=20gcc-4.6: Delete linaro patch that has been committed upstream

Koen Kooi (6):
=20=20fbida: add 2.08
=20=20e-wm: add missing dependency on dbus-x11
=20=20gvfs 1.8.2: fix sftp RRECOMMENDS
=20=20mplayer: fix build with -Wl,-as-needed
=20=20testlab bbclass: output version info on all layers
=20=20digitemp: fix QA issues:

Martin Jansa (1):
=20=20abiword: fix no-undefined param

Otavio Salvador (1):
=20=20digitemp: fix build for non x86 architectures

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Philip Balister (1):
=20=20angstrom-2010-preferred-versions.inc : Stop pinning python-cairo.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Dexuan Cui (1):
=20=20gcc-package-target.inc: add the symbol link /lib/cpp

Kang Kai (1):
=20=20eglibc_2.13: update SRCREV

Matthew McClintock (6):
=20=20bitbake: print out symmetric difference when comparing sigs
=20=20siggen.py: sort task hash depedencies with basepath
=20=20patch.bbclass: Add PATCHRESOLVE to excluded vars for generating =
sstate-cache
=20=20eglibc.inc: Remove EGLIBPARALLELISM from deps for EXTRA_OEMAKE
=20=20Nothing uses USERNAME, remove it - can cause sstate-cache conflicts
=20=20Nothing uses USERNAME, remove it - can cause sstate-cache conflicts

Mei Lei (1):
=20=20rpm: Flush old logs by change the DB_CONFIG

Nitin A Kamble (2):
=20=20at: update the upstream-status of patches
=20=20site/x86_64-linux: add cvs config variables

Richard Purdie (28):
=20=20bitbake/runqueue.py: Add BB_SETSCENE_VERIFY_FUNCTION hook
=20=20package.bbclass: Ensure paths to rpmmarcos and rpmpopt are set
=20=20staging.bbclass: Add BB_SETSCENE_VERIFY_FUNCTION function
=20=20staging: Remove debug accidently left in
=20=20matchbox-stroke: Update to latest git revision to add missing Xrender =
depend
=20=20gconf: Ensure that GCONF_SCHEMA_INSTALL_SOURCE uses correct paths
=20=20runqueue.py: Ensure setscene tasks don't break dependency order
=20=20gconf: Ensure the correct backend directory is used
=20=20gconf: Add note to header about patch filed upstream
=20=20runqueue.py: Ensure we fully process the covered list
=20=20apt: Fix locale header and hardcoded libname issues
=20=20libtool: Avoid relinking when cross compiling, its pointless
=20=20fetch2/local: Don't default to files in DL_DIR for file:// urls
=20=20runqueue.py: Fix debug message to reference the correct task
=20=20knotty: Add support for logging the console to logfile
=20=20fetch2: Improve uri_replace to handle paths with no trailing '/'
=20=20data/siggen: Add vardepvalue mechanism to allow the variable =
dependency code
=20=20base.bbclass: Use bb.plain to print the build header
=20=20bitbake.conf: Set BB_CONSOLELOG so we log console messages by default
=20=20avahi-ui: Fix packaging and conflict with the avahi recipe
=20=20bitbake.conf: We only care about the absolute value of baselib
=20=20bitbake/siggen.py: Don't backtrace if the taskhash data isn't present
=20=20ofono: Fix missing python dependency and package tests separately
=20=20ghostscript: Really fix parallel make race
=20=20ghostscript-native: Ensure the sys/time/h fix is applied for native =
builds
=20=20ghostscript: Ensure we run reautoconf
=20=20getVar/setVar cleanups
=20=20bitbake: Update users of getVar/setVar to use the data store =
functions direc

Robert P. J. Day (2):
=20=20documentation: Standardized on spelling of BitBake
=20=20documentation/poky-ref-manual: Minor wording fixes

Robert Yang (1):
=20=20bitbake: Update and fix bitbake-runtask

Saul Wold (2):
=20=20distro_tracking: Refect Recipe Updates & Status
=20=20distro_tracking_fields: Update after Manual Check

Scott Garman (3):
=20=20distro_tracking: update manual checks for various recipes
=20=20dosfstools: add Upstream-Status to patches
=20=20base-passwd: add Upstream-Status to patches, remove unused patch

Scott Rifenbark (13):
=20=20documentation/poky-ref-manual/introduction.xml: Fixed broken link
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: Updated packages =
sectio
=20=20documentation: Changed all manual links to point to "latest"
=20=20documentation/dev-manual: Edits from Tom Zanussi.
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: fixed broken link
=20=20documentation: Added footnote element to the stylesheets
=20=20documentation/adt-manual/adt-prepare.xml: Updated link to toolchain =
and info
=20=20documenation/adt-manual/adt-prepare.xml: Fixed toolchain tarball name
=20=20documentation/adt-manual/adt-prepare.xml: Updated link to machines
=20=20documentation: BB_NUMBER_THREADS and PARALLEL_MAKE suggestions
=20=20documentation/poky-ref-manual/ref-variables.xml: EXTRA_IMAGEDEPENDS =
added.
=20=20documentation/dev-manual/dev-manual-newbie.xml: Updates to Bugzilla =
use
=20=20documentation/adt-manual/adt-prepare.xml: Fixed bad URL for edison =
tarball

Shane Wang (3):
=20=20distro_tracking: update manual checks for recipes
=20=20distro_tracking: update manual checks for recipes
=20=20distro_tracking: update manual checks for recipes

Xiaofeng Yan (3):
=20=20directfb: change check sum
=20=20tslib: Set open mode for ts_calibate.c
=20=20gtk+: Have gtk+ pick up ${NM} from the environment

Zhai Edwin (1):
=20=20matchbox-wm: Fix variable type in _NET_WORKAREA setting

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Koen Kooi (2):
=20=20linux 3.0: update to 3.0.10
=20=20linux 3.0: update to 3.0.11

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Denis 'GNUtoo' Carikli (2):
=20=20meta-smartphone: meta-shr: ffalarms: bump SRCREV
=20=20meta-aurora: aurora-image: fix microsd booting on openmoko devices

Martin Jansa (4):
=20=20cornucopia: bump SRCREV a bit more
=20=20libsamsung-ipc: bump SRCREV a bit
=20=20cornucopia: bump SRCREV a bit more
=20=20task-shr-feed: add picocom, tar

Simon Busch (5):
=20=20meta-fso: vala: we need our own version of vala until 0.14.1 is out
=20=20meta-fso: cornucopia: bump SRCREV for vala 0.14 support
=20=20meta-fso: libfso-glib: bump SRCREV
=20=20meta-fso: vala: update to new version 0.14.0.6
=20=20meta-aurora: aurora-daemon: don't depend on libfso-qt anymore and =
bump PR

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (2):
=20=20linux(kexecboot): initial commit of kernel 3.1 updated to patchset 1
=20=20linux(kexecboot): update from 3.1.1 to 3.1.2

Koen Kooi (1):
=20=20linux 2.6.39: remove all traces of it

Martin Jansa (6):
=20=20zaurus.inc: use xserver-xorg-lite
=20=20linux-kexecboot: use kernel_conf_variable like linux.inc does and =
respect CM
=20=20linux-kexecboot: don't disable DEBUG, PRINTK, BUG if we have debug in =
CMDLIN
=20=20linux-git: move CMDLINE_DEBUG to linux-git.inc to be used also for =
linux-kex
=20=20linux-git: upgrade to 3.2.0-rc3
=20=20linux(-kexecboot).inc: don't use IMAGE_FEATURES to decide =
CMDLINE_DEBUG

Paul Eggleton (1):
=20=20linux: move h1940 up to 3.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




