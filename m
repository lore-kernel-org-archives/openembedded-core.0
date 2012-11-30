Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TeM1B-0000om-8v
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 09:32:22 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Nov 2012 00:17:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,191,1355126400"; d="scan'208";a="224653477"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 30 Nov 2012 00:17:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 00:17:58 -0800
Message-Id: <cover.1354263334.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0
MIME-Version: 1.0
Subject: [Consolidated Pull 00/33] Fixes and Updates
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
X-List-Received-Date: Fri, 30 Nov 2012 08:32:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

This is a combo request with your master-next and MUT,
it builds with AutoBuild and I have done some simple 
testing.

I have droped some patches that do not have Upstream-Status
info.

Thanks
	Sau!



The following changes since commit 99f003356be43bb361634359a5d3c520f72f0a08:

  local.conf.sample: Enable disk space monitoring by default (2012-11-28 15:25:14 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Amy Fong (1):
  rsync doesn't create hardlinks for certain files

Andreas Müller (1):
  gtk+: do not prelight GtkButton in touchscreen mode

Bruce Ashfield (1):
  linux-yocto/3.4: move PREEMPT_NONE to beagleboard standard kernel
    only

Chen Qi (3):
  autotools.bbclass: use relative path for acpaths whenever possible
  qt4-native: make qt4-native work with long building path
  ghostscript: make ghostscript work with long building path

Enrico Scholz (1):
  sstate.bbclass: fixed file-conflict check

Eric Bénard (1):
  subversion: update to 1.7.7

Gary Thomas (1):
  gstreamer: Fix plugin builds

Hongxu Jia (2):
  slang: explicity disable invoking onig module
  populate_sdk_base:tarball installer:add sudo prompt

Jackie Huang (1):
  eglibc: Move compile with optimization handling to common code

Laurentiu Palcu (1):
  populate_sdk_base: tarball installer: SDK overwrite warning

Marcin Juszkiewicz (1):
  libffi: add AArch64 support

Marko Lindqvist (6):
  cairo: update to upstream version 1.12.8
  libpng: update to upstream version 1.2.50
  ccache: update to upstream version 3.1.8
  pango: update to upstream version 1.30.1
  glib-2.0: update to upstream version 2.34.3
  readline: apply upstream patches

Martin Jansa (2):
  rootfs_ipk, package_ipk: drop --force-overwrite
  libcgroup: fix INSANE_SKIP

Ming Liu (2):
  rootfs_rpm.bbclass: normalize arch output of list_installed_packages
  rootfs_rpm.bbclass: fix a regression introduced by
    list_installed_packages change

Otavio Salvador (2):
  initramfs-framework: init: Stop mount warnings during boot
  initramfs-framework: udev: Handle alternative binary paths

Ross Burton (2):
  guile: fix bashism in script
  guile: touch compiled modules on sstate install

Roy.Li (1):
  site/common-linux: move ac_cv_o_nonblock_inherited to
    site/common-linux

Saul Wold (4):
  cmake: Update to 2.8.10.1
  sysvinit: Update ALTERNATIVES List for utmpdump
  util-linux: Update to 2.22.1
  build-appliance-image: Allow SRCREV to be overriden

 meta/classes/autotools.bbclass                     |   14 +-
 meta/classes/package_ipk.bbclass                   |    2 +-
 meta/classes/populate_sdk_base.bbclass             |   80 +-
 meta/classes/rootfs_ipk.bbclass                    |    4 +-
 meta/classes/rootfs_rpm.bbclass                    |    2 +-
 meta/classes/sstate.bbclass                        |    2 +-
 meta/recipes-core/eglibc/eglibc.inc                |   11 +
 meta/recipes-core/eglibc/eglibc_2.16.bb            |   11 -
 .../{glib-2.0_2.34.1.bb => glib-2.0_2.34.3.bb}     |    4 +-
 meta/recipes-core/images/build-appliance-image.bb  |    2 +-
 .../initrdscripts/initramfs-framework/init         |    7 +-
 .../initrdscripts/initramfs-framework/udev         |   25 +-
 .../initrdscripts/initramfs-framework_1.0.bb       |    2 +-
 meta/recipes-core/libcgroup/libcgroup_0.37.1.bb    |    4 +-
 meta/recipes-core/readline/readline.inc            |    2 +-
 meta/recipes-core/readline/readline_5.2.bb         |   51 +-
 meta/recipes-core/readline/readline_6.2.bb         |   21 +-
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    4 +-
 meta/recipes-core/util-linux/util-linux.inc        |   21 +-
 .../util-linux/add-aarch64-support.patch           |   18 -
 .../util-linux/util-linux/configure-sbindir.patch  |   15 +-
 .../util-linux/util-linux/fix-configure.patch      |   20 +
 .../util-linux/uclibc-__progname-conflict.patch    |   14 +-
 .../util-linux-ng-replace-siginterrupt.patch       |   15 +-
 .../{util-linux_2.21.2.bb => util-linux_2.22.1.bb} |   10 +-
 meta/recipes-devtools/ccache/ccache.inc            |    2 +-
 .../ccache/{ccache_3.1.7.bb => ccache_3.1.8.bb}    |    4 +-
 .../cmake/cmake-native_2.8.10.1.bb                 |    4 +
 meta/recipes-devtools/cmake/cmake-native_2.8.8.bb  |    8 -
 meta/recipes-devtools/cmake/cmake.inc              |    3 +
 .../cmake/cmake/dont-run-cross-binaries.patch      |   19 +-
 .../cmake/cmake/support-oe-qt4-tools-names.patch   |   46 +-
 .../cmake/{cmake_2.8.8.bb => cmake_2.8.10.1.bb}    |    3 -
 meta/recipes-devtools/guile/guile_2.0.6.bb         |   17 +-
 meta/recipes-devtools/rsync/rsync_3.0.9.bb         |    6 +
 ...ersion-1.7.6_mod_dontdothat_svnserve_only.patch |  109 -
 .../fix-install-depends.patch                      |    0
 .../libtool2.patch                                 |    0
 .../{subversion_1.7.6.bb => subversion_1.7.7.bb}   |    5 +-
 ...tscript-work-with-long-building-directory.patch |   19 +
 .../ghostscript/ghostscript_9.05.bb                |   10 +-
 meta/recipes-extended/slang/slang_2.2.4.bb         |    4 +-
 ...utton-do-not-prelight-in-touchscreen-mode.patch |   48 +
 meta/recipes-gnome/gtk+/gtk+_2.24.13.bb            |    3 +-
 .../libffi/aarch64-adding-build-support.patch      |   63 +
 .../libffi/libffi/add-aarch64-support.patch        | 2672 ++++++++++++++++++++
 meta/recipes-gnome/libffi/libffi_3.0.11.bb         |    7 +-
 .../cairo/{cairo_1.12.2.bb => cairo_1.12.8.bb}     |    6 +-
 .../multilib-fix-clean.patch                       |    0
 .../{pango-1.30.0 => pango-1.30.1}/no-tests.patch  |    0
 .../pango/{pango_1.30.0.bb => pango_1.30.1.bb}     |    6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |    2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |    4 +-
 .../libpng/{libpng_1.2.49.bb => libpng_1.2.50.bb}  |   12 +-
 ...e-qt4-native-work-with-long-building-path.patch |   82 +
 meta/recipes-qt/qt4/qt4-native.inc                 |    3 +-
 meta/site/common-linux                             |    3 +
 meta/site/powerpc32-linux                          |    1 -
 60 files changed, 3233 insertions(+), 303 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.34.1.bb => glib-2.0_2.34.3.bb} (89%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/add-aarch64-support.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/fix-configure.patch
 rename meta/recipes-core/util-linux/{util-linux_2.21.2.bb => util-linux_2.22.1.bb} (85%)
 rename meta/recipes-devtools/ccache/{ccache_3.1.7.bb => ccache_3.1.8.bb} (47%)
 create mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.10.1.bb
 delete mode 100644 meta/recipes-devtools/cmake/cmake-native_2.8.8.bb
 rename meta/recipes-devtools/cmake/{cmake_2.8.8.bb => cmake_2.8.10.1.bb} (88%)
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.6/subversion-1.7.6_mod_dontdothat_svnserve_only.patch
 rename meta/recipes-devtools/subversion/{subversion-1.7.6 => subversion-1.7.7}/fix-install-depends.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.7.6 => subversion-1.7.7}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.7.6.bb => subversion_1.7.7.bb} (83%)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-make-ghostscript-work-with-long-building-directory.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.13/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch
 create mode 100644 meta/recipes-gnome/libffi/libffi/aarch64-adding-build-support.patch
 create mode 100644 meta/recipes-gnome/libffi/libffi/add-aarch64-support.patch
 rename meta/recipes-graphics/cairo/{cairo_1.12.2.bb => cairo_1.12.8.bb} (92%)
 rename meta/recipes-graphics/pango/{pango-1.30.0 => pango-1.30.1}/multilib-fix-clean.patch (100%)
 rename meta/recipes-graphics/pango/{pango-1.30.0 => pango-1.30.1}/no-tests.patch (100%)
 rename meta/recipes-graphics/pango/{pango_1.30.0.bb => pango_1.30.1.bb} (57%)
 rename meta/recipes-multimedia/libpng/{libpng_1.2.49.bb => libpng_1.2.50.bb} (52%)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.3/0001-make-qt4-native-work-with-long-building-path.patch

-- 
1.8.0



