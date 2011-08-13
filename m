Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QsMQM-0007pr-C2; Sun, 14 Aug 2011 00:11:23 +0200
Received: from localhost ([127.0.0.1] helo=happy.bec-systems.com)
	by happy.bec-systems.com with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1QsMLu-00057P-94; Sat, 13 Aug 2011 18:06:46 -0400
Date: Sat, 13 Aug 2011 18:06:46 -0400
Message-Id: <E1QsMLu-00057P-94@happy.bec-systems.com>
X-Mailer: Nodemailer (0.1.13; +http://www.nodemailer.org)
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
MIME-Version: 1.0
Subject: OE Changelog for 2011-08-1 to 2011-08-8
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
X-List-Received-Date: Sat, 13 Aug 2011 22:11:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Changelog for 2011-08-1 to 2011-08-8.  Projects included in this report:

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
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Joshua Lock (14):
=20=20bb/ui/hob: save changes to bblayers.conf when using Add Layer menu =
item
=20=20bb/ui/crumbs/runningbuild: optionally create list entries sequentially
=20=20bb/ui/hob: show build messages are displayed in the order they're =
received
=20=20ui/crumbs/runningbuild: add optional readonly mode, default off
=20=20bb/ui/hob: disable editing in the build messages tree view
=20=20bb/ui/crumbs/runningbuild: emit signal when command fails with exit =
signal
=20=20bb/ui/hob: fix detection of whether GPLv3 is disabled
=20=20bb/ui/crumbs/tasklistmodel: fix regex used for loading image recipes
=20=20bb/ui/hob: prevent label on progress bar from changing rapidly when =
loading
=20=20bb/ui/crumbs/hobeventhandler: use generic loading message once cache =
loaded
=20=20bb/ui/hob: only connect to the changed signal of image_combo once
=20=20bb/ui/hob: be clear that the image contents are an estimate
=20=20bb/ui/hob: reset event handler once build complete
=20=20bb/cooker: mark parsed conf files as potential cache invalidators

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Beth Flanagan (1):
=20=20buildstats.bbclass: Adding disk io measurement

Bruce Ashfield (4):
=20=20linux-yocto: pass KMACHINE to updateme, not MACHINE
=20=20linux-yocto: allow configuration of arbitrary branches
=20=20linux-yocto: update atom-pc preempt-rt definition
=20=20linux-yocto: merge v3.0.1

Dexuan Cui (1):
=20=20oe-init-build-env, scripts/oe-buildenv-internal: add error detecting =
for $BD

Dmitry Eremin-Solenikov (1):
=20=20eglibc: fix build for armv4 machines

Dongxiao Xu (5):
=20=20eglibc-locale: Specially handle FILES_eglibc-gconv for multilib
=20=20libxml-simple-perl: Use BBCLASSEXTEND insteand of *-native recipe
=20=20openjade-native: Change RDEPENDS of sgml-common-native
=20=20multilib: Use BPN instead of PN for style like lib${PN}
=20=20task-core-boot.bb: Add PACKAGE definition to facilitate multilib

Kang Kai (1):
=20=20libnewt: update to 0.52.13

Khem Raj (4):
=20=20scripts/runqemu: grep for line beginning with TMPDIR
=20=20autoconf: Remove patch=3D1 from SRC_URI
=20=20autoconf: Remove code checking for hardcoded /usr/local
=20=20coreutils: Fix build on uclibc

Koen Kooi (4):
=20=20gtk-icon-cache bbclass: only add runtime dependencies on =
hicolor-icon-theme=20
=20=20gtk-icon-cache: add hicolor-icon-theme to DEPENDS
=20=20gst-plugins: partially sync packaging with OE .dev
=20=20gtk-icon-cache bbclass: don't assing to global RDEPENDS

Kumar Gala (15):
=20=20automake: Fix issue with tar configure failing with large UID/GIDs
=20=20gcc: Fix setting of GLIBC_DYNAMIC_LINKER
=20=20libnss-mdns: dont use hard coded /lib path
=20=20tcl: Fix packaging of platform independent files
=20=20binutils: Add support for powerpc e5500 core
=20=20eglibc_2.13: Add support for handling sqrt & sqrtf on powerpc
=20=20libmusicbrainz: utilize base_libdir when configured
=20=20libproxy: utilize libdir when configured
=20=20prelink: Add lib64 dirs to prelink.conf
=20=20tune/arch-powerpc64: include arch-powerpc.inc to keep things in sync
=20=20gcc-4.6: Add support for the e5500 PowerPC core
=20=20image-mklibs.bbclass: Add powerpc64 arch support
=20=20image-mklibs.bbclass: Utilize ${base_libdir} instead of static /lib
=20=20bitbake.conf/powerpc64: Set baselib to 'lib64' for ppc64
=20=20gcc: use ${base_lib} to match gcc default configuration

Lianhao Lu (9):
=20=20eglibc-package.inc: Fixed error in referencing PKGSUFFIX
=20=20environment files: Added and unified version related variables.
=20=20SRC_URI: Using BPN instaed of PN.
=20=20tcp-wrappers: Using ${PN} in PACKAGES.
=20=20qt4x11.bbclass: Using BPN instead of PN.
=20=20Misc: Corrected the dependency on non-native for -native package.
=20=20ghostscript: Fixed the incorrect DEPENDS.
=20=20eglibc-locale: Added ${MLPREFIX} for task dependency.
=20=20multilib.conf: Supported multilib extend in more recipes.

Mark Hatle (5):
=20=20rootfs_rpm: Cleanup and minor bug fixes
=20=20bitbake.conf: Add SDK_PACKAGE_ARCHS
=20=20populate_sdk_*: Sync SDK and regular rootfs functions
=20=20package_ipk: SDK generation workaround
=20=20libzypp: Increase the size of the arch compat table

Martin Jansa (3):
=20=20polkit: depend on intltool-native instead of intltool
=20=20libfm: depend on intltool-native instead of intltool
=20=20eglibc: remove PACKAGES from eglibc.inc

Mei Lei (4):
=20=20aspell: upgrade from 0.60.6 to 0.60.6.1
=20=20python-native: Fix a compiler finding issue
=20=20apr-util: disable pqsql support to avoid configure error
=20=20lsb: Fix hard code libdir issue for multilib

Nitin A Kamble (5):
=20=20toolchain-scripts & other classes: add TARGET_LD_ARCH & =
TARGET_AS_ARCH vars
=20=20kernel,module-base.bbclass: Improve KERNEL_LD & KERNEL_AR variables
=20=20siteinfo.bbclass: add entries for new x86_64 ABI x32 target
=20=20insane.bbclass: add entries for linux-gnux32
=20=20x86 tune inc files: add x32 abi tune parameters

Noor, Ahsan (3):
=20=20bison: Add dependency on flex-native
=20=20kernel,cml1.bbclass: Move menuconfig to cml1
=20=20kernel.bbcalss: Added do_savedefconfig task.

Richard Purdie (12):
=20=20eglibc: Add missing ${PN} and ${PKGSUFFIX} usages
=20=20tune/ppc: Fix various TUNE_PKGARCH issues
=20=20local.conf.sample: Fix TUNENAME reference (should be DEFAULTTUNE)
=20=20libzypp: Correctly handle - in package architecture names
=20=20bitbake.conf/qemux86-64: Automate TRANSLATED_TARGET_ARCH
=20=20autotools.bbclass: Fix m4 file race
=20=20package_rpm: Ensure alternatives links are reflected in rpm package =
dependen
=20=20font-util: The recipe produces binaries so don't mark as 'all' =
architecture
=20=20eglibc: Fix patch merge breakage
=20=20local.conf.sample: Comment out BBMASK by default
=20=20machine/include/arm/feature-arm-thumb: Allow thumb to be disabled
=20=20lttng-control: Update to 0.89

Saul Wold (8):
=20=20glibc: Remove unused version
=20=20libxt: Add depends for util-linux and libxcb
=20=20dpkg: Update to use perlnative
=20=20linux-yocto_3.0: Fix SRC_URI to use yoctoproject.org
=20=20gdb: Update to 7.3
=20=20liburcu: Update to 0.6.4
=20=20lttng-ust: Update to 0.15
=20=20kernel-yocto: add CCACHE_DIR dependency to do_kernel_configme

Tom Rini (10):
=20=20connman_test.sh: Rework for busybox 'ps'
=20=20sudo: Drop sudo_cv_uid_t_len from site files
=20=20tcl: Add tcl_cv_api_serial to siteinfo
=20=20Various site files: Drop monotone/mono
=20=20Various siteinfo files: Consolidate ac_cv_func_getaddrinfo
=20=20Various siteinfo files: Drop enca section
=20=20Various siteinfo files: Consolidate va_copy/__va_copy/va_val_copy
=20=20site/common-linux: Add ac_cv_file__dev_zero=3Dyes
=20=20siteinfo: Add posix_getpwuid_r posix_getgrgid_r posix_getpwnam_r to =
uclibc
=20=20Various siteinfo: Drop rp-pppoe variables

Yu Ke (1):
=20=20SRC_URI, S: use BPN instead of PN for multilib case

Zhai Edwin (8):
=20=20lighttpd: Upgrade to 1.4.29
=20=20libsoup-2.4: Upgrade to 2.34.2
=20=20libassuan: Upgrade to 2.0.2
=20=20gpgme: Upgrade to 1.3.1
=20=20parted: Upgrade to 3.0
=20=20apr: Upgrade to 1.4.5
=20=20apr-util: Upgrade to 1.3.12
=20=20xserver-nodm-init: Fix X start failure on some platform

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas Mueller (20):
=20=20meta-xfce: Add README with maintenance informations
=20=20meta-xfce: Add layer information
=20=20xfce.bbclass: A class for xfce-global settings
=20=20xfce4-dev-tools: Add initial recipe with version 4.8.0
=20=20libxfce4util: Add initial recipe with version 4.8.1
=20=20garcon: Add initial recipe with version 0.1.8
=20=20exo: Add initial recipe with version 0.6.2
=20=20xfconf: Add initial recipe with version 4.8.0
=20=20libxfce4ui: Add initial recipe with version 4.8.0
=20=20xfce-utils: Add initial recipe with version 4.8.2
=20=20xfce4-panel: Add initial recipe with version 4.8.5
=20=20xfce4-session: Add initial recipe with version 4.8.1
=20=20xfce4-appfinder: Add initial recipe with version 4.8.0
=20=20xfwm4: Add initial recipe with version 4.8.1
=20=20xfce4-settings: Add initial recipe with version 4.8.2
=20=20thunar: Add initial recipe with version 1.2.2
=20=20xfdesktop: Add initial recipe with version 4.8.2
=20=20gtk-xfce-engine: Add initial recipe with version 2.8.1
=20=20xfce-terminal: Add initial recipe with version 0.4.8
=20=20task-xfce-base: Add initial recipe adding all recipes required for =
xfce desk

Andreas M=C3=BCller (1):
=20=20iceauth: Import 1.0.4 from oe.dev

Bruce Ashfield (1):
=20=20kernel: copy defconfig to {B} vs {S}

Khem Raj (4):
=20=20systemd: Refresh format-replace-m-uclibc.patch
=20=20gcc-4.6: Bring in linaro patches upto 07.2011 release
=20=20systemd: Link with librt explicitly on uclibc
=20=20systemd: inherit perlnative

Koen Kooi (5):
=20=20udev: update to 173
=20=20uhd-firmare: update to 3.2.1
=20=20orc: add 0.4.14
=20=20uhd: update to 3.2.1
=20=20systemd: update to v33-3

Martin Jansa (1):
=20=20webkit-efl: inherit perlnative and s/ARM/arm/g in ARM_INSTRUCTION_SET

Nitin A Kamble (1):
=20=20kernel,module-base.bbclass: Improve KERNEL_LD & KERNEL_AR variables

Noor, Ahsan (2):
=20=20kernel,cml1.bbclass: Move menuconfig to cml1
=20=20kernel.bbcalss: Added do_savedefconfig task.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (1):
=20=20console-base-image: replace with systemd-image

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Beth Flanagan (1):
=20=20buildstats.bbclass: Adding disk io measurement

Bruce Ashfield (4):
=20=20linux-yocto: pass KMACHINE to updateme, not MACHINE
=20=20linux-yocto: allow configuration of arbitrary branches
=20=20linux-yocto: update atom-pc preempt-rt definition
=20=20linux-yocto: merge v3.0.1

Dexuan Cui (1):
=20=20oe-init-build-env, scripts/oe-buildenv-internal: add error detecting =
for $BD

Dmitry Eremin-Solenikov (1):
=20=20eglibc: fix build for armv4 machines

Dongxiao Xu (5):
=20=20eglibc-locale: Specially handle FILES_eglibc-gconv for multilib
=20=20libxml-simple-perl: Use BBCLASSEXTEND insteand of *-native recipe
=20=20openjade-native: Change RDEPENDS of sgml-common-native
=20=20multilib: Use BPN instead of PN for style like lib${PN}
=20=20task-core-boot.bb: Add PACKAGE definition to facilitate multilib

Joshua Lock (22):
=20=20ui/crumbs/hobeventhandler: remove unused code
=20=20hob: unset busy cursor on exit
=20=20ui/crumbs/hobeventhandler: emit a signal when there's a fatal-error
=20=20ui/hob: show error and exit if we receive the fatal-error signal
=20=20ui/crumbs/hobeventhandler: emit a signal when a command fails
=20=20ui/crumbs/configurator: tweak addLayerConf return values
=20=20ui/crumbs/layereditor: if layer adding fails show an explanatory =
dialog
=20=20hob: remove temporary directory on program shutdown
=20=20bb/ui/hob: save changes to bblayers.conf when using Add Layer menu =
item
=20=20bb/ui/crumbs/runningbuild: optionally create list entries sequentially
=20=20bb/ui/hob: show build messages are displayed in the order they're =
received
=20=20ui/crumbs/runningbuild: add optional readonly mode, default off
=20=20bb/ui/hob: disable editing in the build messages tree view
=20=20bb/ui/crumbs/runningbuild: emit signal when command fails with exit =
signal
=20=20bb/ui/hob: fix detection of whether GPLv3 is disabled
=20=20bb/ui/crumbs/tasklistmodel: fix regex used for loading image recipes
=20=20bb/ui/hob: prevent label on progress bar from changing rapidly when =
loading
=20=20bb/ui/crumbs/hobeventhandler: use generic loading message once cache =
loaded
=20=20bb/ui/hob: only connect to the changed signal of image_combo once
=20=20bb/ui/hob: be clear that the image contents are an estimate
=20=20bb/ui/hob: reset event handler once build complete
=20=20bb/cooker: mark parsed conf files as potential cache invalidators

Kang Kai (1):
=20=20libnewt: update to 0.52.13

Khem Raj (4):
=20=20scripts/runqemu: grep for line beginning with TMPDIR
=20=20autoconf: Remove patch=3D1 from SRC_URI
=20=20autoconf: Remove code checking for hardcoded /usr/local
=20=20coreutils: Fix build on uclibc

Koen Kooi (4):
=20=20gtk-icon-cache bbclass: only add runtime dependencies on =
hicolor-icon-theme=20
=20=20gtk-icon-cache: add hicolor-icon-theme to DEPENDS
=20=20gst-plugins: partially sync packaging with OE .dev
=20=20gtk-icon-cache bbclass: don't assing to global RDEPENDS

Kumar Gala (15):
=20=20automake: Fix issue with tar configure failing with large UID/GIDs
=20=20gcc: Fix setting of GLIBC_DYNAMIC_LINKER
=20=20libnss-mdns: dont use hard coded /lib path
=20=20tcl: Fix packaging of platform independent files
=20=20binutils: Add support for powerpc e5500 core
=20=20eglibc_2.13: Add support for handling sqrt & sqrtf on powerpc
=20=20libmusicbrainz: utilize base_libdir when configured
=20=20libproxy: utilize libdir when configured
=20=20prelink: Add lib64 dirs to prelink.conf
=20=20tune/arch-powerpc64: include arch-powerpc.inc to keep things in sync
=20=20gcc-4.6: Add support for the e5500 PowerPC core
=20=20image-mklibs.bbclass: Add powerpc64 arch support
=20=20image-mklibs.bbclass: Utilize ${base_libdir} instead of static /lib
=20=20bitbake.conf/powerpc64: Set baselib to 'lib64' for ppc64
=20=20gcc: use ${base_lib} to match gcc default configuration

Lianhao Lu (9):
=20=20eglibc-package.inc: Fixed error in referencing PKGSUFFIX
=20=20environment files: Added and unified version related variables.
=20=20SRC_URI: Using BPN instaed of PN.
=20=20tcp-wrappers: Using ${PN} in PACKAGES.
=20=20qt4x11.bbclass: Using BPN instead of PN.
=20=20Misc: Corrected the dependency on non-native for -native package.
=20=20ghostscript: Fixed the incorrect DEPENDS.
=20=20eglibc-locale: Added ${MLPREFIX} for task dependency.
=20=20multilib.conf: Supported multilib extend in more recipes.

Mark Hatle (5):
=20=20rootfs_rpm: Cleanup and minor bug fixes
=20=20bitbake.conf: Add SDK_PACKAGE_ARCHS
=20=20populate_sdk_*: Sync SDK and regular rootfs functions
=20=20package_ipk: SDK generation workaround
=20=20libzypp: Increase the size of the arch compat table

Martin Jansa (3):
=20=20polkit: depend on intltool-native instead of intltool
=20=20libfm: depend on intltool-native instead of intltool
=20=20eglibc: remove PACKAGES from eglibc.inc

Mei Lei (4):
=20=20aspell: upgrade from 0.60.6 to 0.60.6.1
=20=20python-native: Fix a compiler finding issue
=20=20apr-util: disable pqsql support to avoid configure error
=20=20lsb: Fix hard code libdir issue for multilib

Nitin A Kamble (2):
=20=20toolchain-scripts & other classes: add TARGET_LD_ARCH & =
TARGET_AS_ARCH vars
=20=20kernel,module-base.bbclass: Improve KERNEL_LD & KERNEL_AR variables

Noor, Ahsan (3):
=20=20bison: Add dependency on flex-native
=20=20kernel,cml1.bbclass: Move menuconfig to cml1
=20=20kernel.bbcalss: Added do_savedefconfig task.

Richard Purdie (12):
=20=20eglibc: Add missing ${PN} and ${PKGSUFFIX} usages
=20=20tune/ppc: Fix various TUNE_PKGARCH issues
=20=20local.conf.sample: Fix TUNENAME reference (should be DEFAULTTUNE)
=20=20libzypp: Correctly handle - in package architecture names
=20=20bitbake.conf/qemux86-64: Automate TRANSLATED_TARGET_ARCH
=20=20autotools.bbclass: Fix m4 file race
=20=20package_rpm: Ensure alternatives links are reflected in rpm package =
dependen
=20=20font-util: The recipe produces binaries so don't mark as 'all' =
architecture
=20=20eglibc: Fix patch merge breakage
=20=20local.conf.sample: Comment out BBMASK by default
=20=20machine/include/arm/feature-arm-thumb: Allow thumb to be disabled
=20=20lttng-control: Update to 0.89

Saul Wold (9):
=20=20atom-pc.conf: Add live image type
=20=20glibc: Remove unused version
=20=20libxt: Add depends for util-linux and libxcb
=20=20dpkg: Update to use perlnative
=20=20linux-yocto_3.0: Fix SRC_URI to use yoctoproject.org
=20=20gdb: Update to 7.3
=20=20liburcu: Update to 0.6.4
=20=20lttng-ust: Update to 0.15
=20=20kernel-yocto: add CCACHE_DIR dependency to do_kernel_configme

Scott Rifenbark (64):
=20=20documentation/dev-manual/dev-manual-cases.xml: partial kernel case
=20=20documentation/dev-manual/dev-manual-cases.xml: partial edits to =
procedures
=20=20documentation/dev-manual/dev-manual-cases.xml: partial - more edits =
to the B
=20=20documentation/dev-manual/dev-manual-cases.xml: partial - finished =
edits to B
=20=20documentation/dev-manual/dev-manual-intro.xml: wording change.
=20=20documentation/dev-manual/dev-manual-start.xml: Edits to clarify YP =
files
=20=20documentation/dev-manual/dev-manual-newbie.xml: re-writes of repo and =
licens
=20=20documentation/dev-manual/dev-manual-newbie.xml: edits to Git section.
=20=20documentation/dev-manual/dev-manual-newbie.xml: new section on terms =
added
=20=20documentation/dev-manual/dev-manual-newbie.xml: edits to workflow
=20=20documentation/dev-manual/dev-manual-newbie.xml: edits to tracking =
bugs secti
=20=20documentation/dev-manual/dev-manual-newbie.xml: edits to how to =
submit chang
=20=20documentation/dev-manual/dev-manual-model.xml: removed blank lines.
=20=20documentation/dev-manual/dev-manual-cases.xml: partial - edits to =
clean term
=20=20documentation/dev-manual/dev-manual-cases.xml: re-write of BSP example
=20=20documentation/dev-manual/dev-manual-bsp-appendix.xml: New appendix =
for BSP
=20=20documentation/dev-manual/dev-manual.xml: Added the new appendix for =
BSP.
=20=20documentation/dev-manual/dev-manual-cases.xml: partial - kernel =
section adde
=20=20documentation/dev-manual/dev-manual-bsp-appendix.xml: spacing fixed
=20=20documentation/dev-manual/dev-manual-start.xml: Added examples for YP =
file se
=20=20documentation/dev-manual/dev-manual-start.xml: Added note for =
terminology.
=20=20documentation/dev-manual/dev-manual-bsp-appendix.xml: Modified the =
setup sec
=20=20documentation/dev-manual/dev-manual-start.xml: Added BSP file set up
=20=20documentation/dev-manual/dev-manual-start.xml: Added bsp naming scheme
=20=20documentation/dev-manual/dev-manual-bsp-appendix.xml: re-wrote the =
Base BSP
=20=20documentation/dev-manual/dev-manual-bsp-appendix.xml: Added section =
hierarch
=20=20documentation/dev-manual/dev-manual-cases.xml: generalized the BSP =
case
=20=20documentation/dev-manual/dev-manual-bsp-appendix.xml: removed =
redundancies
=20=20documentation/dev-manual/dev-manual-start.xml: Added a note to =
reference Git
=20=20documentation/dev-manual/dev-manual-model.xml: Moved BSP dev summary =
here
=20=20documentation/dev-manual/dev-manual-model.xml: Added structure
=20=20documentation/dev-manual/dev-manual-cases.xml: removed BSP overview.
=20=20documentation/dev-manual/dev-manual-model.xml: Fixed a broken xref.
=20=20documentation/dev-manual/dev-manual-kernel-appendix.xml: Added =
appendix
=20=20documentation/dev-manual/dev-manual-kernel-appendix.xml: added tags
=20=20documentation/dev-manual/dev-manual.xml: updated files to the book
=20=20documentation/dev-manual/dev-manual-kernel-appendix.xml: removed =
redundant i
=20=20documentation/dev-manual/dev-manual-cases.xml: Deleted this file.
=20=20documentation/dev-manual: Added reference to example appendices
=20=20documentation/dev-manual/dev-manual-model.xml: added BSP flow =
illustration.
=20=20documentation/dev-manual/figures/bsp-dev-flow.png: New illustration
=20=20documentation/dev-manual/figures/bsp-dev-flow.png: Updated the figure.
=20=20documentation/dev-manual/dev-manual-model.xml: Minor edits.
=20=20documentation/dev-manual/dev-manual-model.xml: Added spot link to =
kernel sec
=20=20documentation/Makefile: Added the figure bsp-dev-flow.png to tarlist.
=20=20documentation/dev-manual/dev-manual.xml: Added note to title page.
=20=20documentation/dev-manual/dev-manual.xml: Repositioned note.
=20=20documentation/adt-manual/adt-manual.xml: Added note to title page.
=20=20documentation/bsp-guide/bsp-guide.xml: Added note to title page.
=20=20documentation/kernel-manual/kernel-manual.xml: Added note to title =
page.
=20=20documentation/poky-ref-manual/poky-ref-manual.xml: Added note to =
title page.
=20=20documentation/yocto-project-qs/yocto-project-qs.xml: Added note to =
title pag
=20=20documentation/dev-manual/dev-manual-model.xml: Increased vertical =
image size
=20=20documentation/dev-manual: replaced "&dash;" with "-".
=20=20documentation/dev-manual/figures/bsp-dev-flow.png: Updated figure
=20=20documentation/dev-manual/dev-manual-start.xml: added anchor for =
reference.
=20=20documentation/dev-manual/dev-manual-model.xml: first pass of kernel =
steps ad
=20=20documentation/dev-manual/dev-manual-kernel-appendix.xml: minor edits
=20=20documentation/dev-manual/dev-manual-start.xml: Wording change for =
running im
=20=20documentation/dev-manual/figures: Added three figures for sources
=20=20documentation/dev-manual/dev-manual-newbie.xml: updated intro =
paragraph and=20
=20=20documentation/Makefile: Added figures to tarfile list.
=20=20documentation/dev-manual/dev-manual-newbie.xml: edits suggested by =
Dave Stew
=20=20documentation/dev-manual/figures/bsp-dev-flow.png: Updated picture

Tom Rini (10):
=20=20connman_test.sh: Rework for busybox 'ps'
=20=20sudo: Drop sudo_cv_uid_t_len from site files
=20=20tcl: Add tcl_cv_api_serial to siteinfo
=20=20Various site files: Drop monotone/mono
=20=20Various siteinfo files: Consolidate ac_cv_func_getaddrinfo
=20=20Various siteinfo files: Drop enca section
=20=20Various siteinfo files: Consolidate va_copy/__va_copy/va_val_copy
=20=20site/common-linux: Add ac_cv_file__dev_zero=3Dyes
=20=20siteinfo: Add posix_getpwuid_r posix_getgrgid_r posix_getpwnam_r to =
uclibc
=20=20Various siteinfo: Drop rp-pppoe variables

Yu Ke (1):
=20=20SRC_URI, S: use BPN instead of PN for multilib case

Zhai Edwin (8):
=20=20lighttpd: Upgrade to 1.4.29
=20=20libsoup-2.4: Upgrade to 2.34.2
=20=20libassuan: Upgrade to 2.0.2
=20=20gpgme: Upgrade to 1.3.1
=20=20parted: Upgrade to 3.0
=20=20apr: Upgrade to 1.4.5
=20=20apr-util: Upgrade to 1.3.12
=20=20xserver-nodm-init: Fix X start failure on some platform

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-texasinstruments:

Koen Kooi (6):
=20=20omap3-sgx-modules: add patch from Steve Sakoman to fix build against =
kernel=20
=20=20x-load git: bump SRCREV
=20=20linux-3.1rc: update to latest SRCREV
=20=20matrix: move into a seperate dir
=20=20linux-3.0: update to 3.0.1
=20=20omap3: bump MACHINE_KERNEL_PR for 3.0 -> 3.0.1 upgrade

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Andrea Adami (4):
=20=20encdec-updater: switch to remote SRC_URI
=20=20nandlogical: switch to remote SRC_URI
=20=20kexecboot-cfg: remove Angstrom specific logo
=20=20spitz & akita: fix the injection of 'iwmmxt' in PACKAGE_EXTRA_ARCHS

Dmitry Eremin-Solenikov (1):
=20=20meta-zaurus/linux-2.6.39: fix pcmcia on collie

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

Phil Blundell (2):
=20=20busybox: adjust config for smaller size
=20=20micro-base-image: remove mdev, we will use devtmpfs nowadays

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Paul Eggleton (2):
=20=20meta-sugarbay: update machine configuration for recent tune file =
changes
=20=20meta-jasperforest: update machine configuration for recent tune file =
changes

Tom Zanussi (13):
=20=20meta-crownbay: fix BBFILES in crownbay layer.conf
=20=20meta-fri2: new layer for Fish River Island II (E6XX/EG20T) systems
=20=20meta-fri2: add 3g and wifi features
=20=20meta-crownbay: remove tune-related assignments from machine conf
=20=20meta-crownbay: add live fstype
=20=20meta-crownbay: remove obsolete dir
=20=20meta-sugarbay: add live fstype
=20=20meta-jasperforest: add live fstype
=20=20meta-emenlow: remove tune-related assignments from machine conf
=20=20meta-emenlow: add live fstype
=20=20meta-fishriver: remove tune-related assignments from machine conf
=20=20meta-fishriver: add live fstype
=20=20meta-fishriver: switch to linux-yocto 3.0 kernel

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:

Josua Mayer (1):
=20=20mplayer_git: Add patch to fix linker error on x86 machines

Paul Menzel (1):
=20=20iceauth: Improve `DESCRIPTION` and remove white space

Philip Balister (1):
=20=20task-sdk-gnuradio-native : Remove distcc.




