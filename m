Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8I-0004vP-IC
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Sep 2012 03:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497164"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:24 +0100
Message-Id: <74983e8da046f9b552a07aadca69f675204c5ff3.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/28] Rename task to packagegroup
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
X-List-Received-Date: Mon, 03 Sep 2012 10:43:57 -0000

"Package group" is a much more appropriate name for these than task,
since we use the word task to describe units of work executed by
BitBake.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/archiver.bbclass                      |    4 +-
 meta/classes/core-image.bbclass                    |   34 +--
 meta/classes/insane.bbclass                        |    2 +-
 meta/classes/package.bbclass                       |    2 +-
 meta/classes/packagegroup.bbclass                  |   30 +++
 meta/classes/populate_sdk_base.bbclass             |    4 +-
 meta/classes/task.bbclass                          |   32 +--
 meta/conf/bitbake.conf                             |    4 +-
 meta/recipes-bsp/qemu-config/qemu-config.bb        |    2 +-
 meta/recipes-core/images/build-appliance-image.bb  |    2 +-
 meta/recipes-core/images/core-image-minimal.bb     |    2 +-
 meta/recipes-core/meta/meta-toolchain-gmae.bb      |    2 +-
 .../nativesdk-packagegroup-sdk-host.bb}            |    0
 .../packagegroup-base.bb}                          |  230 ++++++++++----------
 .../packagegroup-core-boot.bb}                     |   10 +-
 .../packagegroup-core-console.bb}                  |    8 +-
 .../packagegroup-core-nfs.bb}                      |   10 +-
 .../packagegroup-core-sdk.bb}                      |   18 +-
 .../packagegroup-core-ssh-dropbear.bb}             |   12 +-
 .../packagegroup-core-ssh-openssh.bb}              |   12 +-
 .../packagegroup-core-standalone-sdk-target.bb}    |    0
 .../packagegroup-core-tools-debug.bb}              |    0
 .../packagegroup-core-tools-profile.bb}            |    0
 .../packagegroup-core-tools-testapps.bb}           |    0
 .../packagegroup-cross-canadian.bb}                |    2 +-
 .../packagegroup-self-hosted.bb}                   |   34 +--
 meta/recipes-extended/images/core-image-basic.bb   |    4 +-
 meta/recipes-extended/images/core-image-lsb-dev.bb |    4 +-
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    4 +-
 meta/recipes-extended/images/core-image-lsb.bb     |    4 +-
 .../libzypp/libzypp/config-release.patch           |    4 +-
 .../packagegroup-core-basic.bb}                    |   94 ++++----
 .../packagegroup-core-lsb.bb}                      |   94 ++++----
 .../packagegroup-core-sdk-gmae.bb}                 |    4 +-
 ...ackagegroup-core-standalone-gmae-sdk-target.bb} |    4 +-
 .../packagegroup-sdk-gmae.inc}                     |    0
 meta/recipes-graphics/images/core-image-clutter.bb |    6 +-
 .../images/core-image-gtk-directfb.bb              |    8 +-
 .../packagegroup-core-clutter.bb}                  |   24 +-
 .../packagegroup-core-gtk-directfb.bb}             |    2 +-
 meta/recipes-qt/images/qt4e-demo-image.bb          |    6 +-
 meta/recipes-qt/meta/meta-toolchain-qte.bb         |    4 +-
 .../nativesdk-packagegroup-qte-toolchain-host.bb}  |    2 +-
 .../packagegroup-core-qt.bb}                       |    8 +-
 .../packagegroup-qt4e.bb}                          |    2 +-
 .../packagegroup-qte-toolchain-target.bb}          |    2 +-
 .../packagegroup-core-x11-mini.bb}                 |    8 +-
 .../packagegroup-core-x11-sato.bb}                 |    8 +-
 .../packagegroup-core-x11.bb}                      |   24 +-
 scripts/contrib/documentation-audit.sh             |    2 +-
 50 files changed, 392 insertions(+), 386 deletions(-)
 create mode 100644 meta/classes/packagegroup.bbclass
 rename meta/recipes-core/{tasks/nativesdk-task-sdk-host.bb => packagegroups/nativesdk-packagegroup-sdk-host.bb} (100%)
 rename meta/recipes-core/{tasks/task-base.bb => packagegroups/packagegroup-base.bb} (45%)
 rename meta/recipes-core/{tasks/task-core-boot.bb => packagegroups/packagegroup-core-boot.bb} (88%)
 rename meta/recipes-core/{tasks/task-core-console.bb => packagegroups/packagegroup-core-console.bb} (73%)
 rename meta/recipes-core/{tasks/task-core-nfs.bb => packagegroups/packagegroup-core-nfs.bb} (65%)
 rename meta/recipes-core/{tasks/task-core-sdk.bb => packagegroups/packagegroup-core-sdk.bb} (85%)
 rename meta/recipes-core/{tasks/task-core-ssh-dropbear.bb => packagegroups/packagegroup-core-ssh-dropbear.bb} (49%)
 rename meta/recipes-core/{tasks/task-core-ssh-openssh.bb => packagegroups/packagegroup-core-ssh-openssh.bb} (50%)
 rename meta/recipes-core/{tasks/task-core-standalone-sdk-target.bb => packagegroups/packagegroup-core-standalone-sdk-target.bb} (100%)
 rename meta/recipes-core/{tasks/task-core-tools-debug.bb => packagegroups/packagegroup-core-tools-debug.bb} (100%)
 rename meta/recipes-core/{tasks/task-core-tools-profile.bb => packagegroups/packagegroup-core-tools-profile.bb} (100%)
 rename meta/recipes-core/{tasks/task-core-tools-testapps.bb => packagegroups/packagegroup-core-tools-testapps.bb} (100%)
 rename meta/recipes-core/{tasks/task-cross-canadian.bb => packagegroups/packagegroup-cross-canadian.bb} (90%)
 rename meta/recipes-core/{tasks/task-self-hosted.bb => packagegroups/packagegroup-self-hosted.bb} (80%)
 rename meta/recipes-extended/{tasks/task-core-basic.bb => packagegroups/packagegroup-core-basic.bb} (43%)
 rename meta/recipes-extended/{tasks/task-core-lsb.bb => packagegroups/packagegroup-core-lsb.bb} (57%)
 rename meta/recipes-gnome/{tasks/task-core-sdk-gmae.bb => packagegroups/packagegroup-core-sdk-gmae.bb} (87%)
 rename meta/recipes-gnome/{tasks/task-core-standalone-gmae-sdk-target.bb => packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb} (85%)
 rename meta/recipes-gnome/{tasks/task-sdk-gmae.inc => packagegroups/packagegroup-sdk-gmae.inc} (100%)
 rename meta/recipes-graphics/{tasks/task-core-clutter.bb => packagegroups/packagegroup-core-clutter.bb} (49%)
 rename meta/recipes-graphics/{tasks/task-core-gtk-directfb.bb => packagegroups/packagegroup-core-gtk-directfb.bb} (96%)
 rename meta/recipes-qt/{tasks/nativesdk-task-qte-toolchain-host.bb => packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb} (64%)
 rename meta/recipes-qt/{tasks/task-core-qt.bb => packagegroups/packagegroup-core-qt.bb} (72%)
 rename meta/recipes-qt/{tasks/task-qt4e.bb => packagegroups/packagegroup-qt4e.bb} (98%)
 rename meta/recipes-qt/{tasks/task-qte-toolchain-target.bb => packagegroups/packagegroup-qte-toolchain-target.bb} (95%)
 rename meta/recipes-sato/{tasks/task-core-x11-mini.bb => packagegroups/packagegroup-core-x11-mini.bb} (85%)
 rename meta/recipes-sato/{tasks/task-core-x11-sato.bb => packagegroups/packagegroup-core-x11-sato.bb} (83%)
 rename meta/recipes-sato/{tasks/task-core-x11.bb => packagegroups/packagegroup-core-x11.bb} (70%)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 3146d02..160a3aa 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -188,11 +188,11 @@ def get_applying_patches(d):
 
 def not_tarball(d):
     """
-    packages including key words 'work-shared', 'native', 'task-' will be passed
+    packages including key words 'work-shared', 'native', 'packagegroup-' will be passed
     """
     workdir = d.getVar('WORKDIR', True)
     s = d.getVar('S', True)
-    if 'work-shared' in s or 'task-' in workdir or 'native' in workdir:
+    if 'work-shared' in s or 'packagegroup-' in workdir or 'native' in workdir:
         return True
     else:
         return False
diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index a37cdfc..a85a9ea 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 
 # IMAGE_FEATURES control content of the core reference images
 # 
-# By default we install task-core-boot and task-base packages - this gives us
+# By default we install packagegroup-core-boot and packagegroup-base packages - this gives us
 # working (console only) rootfs.
 #
 # Available IMAGE_FEATURES:
@@ -27,21 +27,21 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 # - ssh-server-openssh  - SSH server (openssh)
 # - debug-tweaks        - makes an image suitable for development
 #
-PACKAGE_GROUP_apps-console-core = "task-core-apps-console"
-PACKAGE_GROUP_x11-mini = "task-core-x11-mini"
-PACKAGE_GROUP_x11-base = "task-core-x11-base"
-PACKAGE_GROUP_x11-sato = "task-core-x11-sato"
-PACKAGE_GROUP_apps-x11-core = "task-core-apps-x11-core"
-PACKAGE_GROUP_apps-x11-games = "task-core-apps-x11-games"
-PACKAGE_GROUP_tools-debug = "task-core-tools-debug"
-PACKAGE_GROUP_tools-profile = "task-core-tools-profile"
-PACKAGE_GROUP_tools-testapps = "task-core-tools-testapps"
-PACKAGE_GROUP_tools-sdk = "task-core-sdk task-core-standalone-sdk-target"
-PACKAGE_GROUP_nfs-server = "task-core-nfs-server"
-PACKAGE_GROUP_ssh-server-dropbear = "task-core-ssh-dropbear"
-PACKAGE_GROUP_ssh-server-openssh = "task-core-ssh-openssh"
+PACKAGE_GROUP_apps-console-core = "packagegroup-core-apps-console"
+PACKAGE_GROUP_x11-mini = "packagegroup-core-x11-mini"
+PACKAGE_GROUP_x11-base = "packagegroup-core-x11-base"
+PACKAGE_GROUP_x11-sato = "packagegroup-core-x11-sato"
+PACKAGE_GROUP_apps-x11-core = "packagegroup-core-apps-x11-core"
+PACKAGE_GROUP_apps-x11-games = "packagegroup-core-apps-x11-games"
+PACKAGE_GROUP_tools-debug = "packagegroup-core-tools-debug"
+PACKAGE_GROUP_tools-profile = "packagegroup-core-tools-profile"
+PACKAGE_GROUP_tools-testapps = "packagegroup-core-tools-testapps"
+PACKAGE_GROUP_tools-sdk = "packagegroup-core-sdk packagegroup-core-standalone-sdk-target"
+PACKAGE_GROUP_nfs-server = "packagegroup-core-nfs-server"
+PACKAGE_GROUP_ssh-server-dropbear = "packagegroup-core-ssh-dropbear"
+PACKAGE_GROUP_ssh-server-openssh = "packagegroup-core-ssh-openssh"
 PACKAGE_GROUP_package-management = "${ROOTFS_PKGMANAGE}"
-PACKAGE_GROUP_qt4-pkgs = "task-core-qt-demos"
+PACKAGE_GROUP_qt4-pkgs = "packagegroup-core-qt-demos"
 
 
 # IMAGE_FEATURES_REPLACES_foo = 'bar1 bar2'
@@ -52,8 +52,8 @@ IMAGE_FEATURES_REPLACES_ssh-server-openssh = "ssh-server-dropbear"
 # An error exception would be raised if both image features foo and bar1(or bar2) are included
 
 CORE_IMAGE_BASE_INSTALL = '\
-    task-core-boot \
-    task-base-extended \
+    packagegroup-core-boot \
+    packagegroup-base-extended \
     \
     ${CORE_IMAGE_EXTRA_INSTALL} \
     '
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 6de14e0..e74eb3f 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -591,7 +591,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, d):
         return True
 
     sane = True
-    if not "-dbg" in pkg and not "task-" in pkg and not "-image" in pkg:
+    if not "-dbg" in pkg and not "packagegroup-" in pkg and not "-image" in pkg:
         # Copied from package_ipk.bbclass
         # boiler plate to update the data
         localdata = bb.data.createCopy(d)
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 78af693..c8aafc9 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1763,7 +1763,7 @@ python package_depchains() {
             for dep in pkglibdeps[pkg]:
                 add_dep(pkglibdeplist, dep)
         # FIXME this should not look at PN once all task recipes inherit from task.bbclass
-        dbgdefaultdeps = ((d.getVar('DEPCHAIN_DBGDEFAULTDEPS', True) == '1') or (d.getVar('PN', True) or '').startswith('task-'))
+        dbgdefaultdeps = ((d.getVar('DEPCHAIN_DBGDEFAULTDEPS', True) == '1') or (d.getVar('PN', True) or '').startswith('packagegroup-'))
 
     for suffix in pkgs:
         for pkg in pkgs[suffix]:
diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
new file mode 100644
index 0000000..6ec154a
--- /dev/null
+++ b/meta/classes/packagegroup.bbclass
@@ -0,0 +1,30 @@
+# Task packages are only used to pull in other packages
+# via their dependencies. They are empty.
+ALLOW_EMPTY = "1"
+
+# By default, only the task package itself is in PACKAGES.
+# -dbg and -dev flavours are handled by the anonfunc below.
+# This means that task recipes used to build multiple task
+# packages have to modify PACKAGES after inheriting task.bbclass.
+PACKAGES = "${PN}"
+
+# By default, task packages do not depend on a certain architecture.
+# Only if dependencies are modified by MACHINE_FEATURES, packages
+# need to be set to MACHINE_ARCH after inheriting task.bbclass
+PACKAGE_ARCH = "all"
+
+# This automatically adds -dbg and -dev flavours of all PACKAGES
+# to the list. Their dependencies (RRECOMMENDS) are handled as usual
+# by package_depchains in a following step.
+python () {
+    packages = d.getVar('PACKAGES', True).split()
+    genpackages = []
+    for pkg in packages:
+        for postfix in ['-dbg', '-dev']:
+            genpackages.append(pkg+postfix)
+    d.setVar('PACKAGES', ' '.join(packages+genpackages))
+}
+
+# We don't want to look at shared library dependencies for the
+# dbg packages
+DEPCHAIN_DBGDEFAULTDEPS = "1"
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index c9fb00d..1c151d7 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -7,9 +7,9 @@ SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 
 SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${MULTIMACH_TARGET_SYS}"
 
-TOOLCHAIN_HOST_TASK ?= "nativesdk-task-sdk-host task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host packagegroup-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?= ""
-TOOLCHAIN_TARGET_TASK ?= "task-core-standalone-sdk-target task-core-standalone-sdk-target-dbg"
+TOOLCHAIN_TARGET_TASK ?= "packagegroup-core-standalone-sdk-target packagegroup-core-standalone-sdk-target-dbg"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${DISTRO_VERSION}"
 
diff --git a/meta/classes/task.bbclass b/meta/classes/task.bbclass
index 6ec154a..28db500 100644
--- a/meta/classes/task.bbclass
+++ b/meta/classes/task.bbclass
@@ -1,30 +1,6 @@
-# Task packages are only used to pull in other packages
-# via their dependencies. They are empty.
-ALLOW_EMPTY = "1"
-
-# By default, only the task package itself is in PACKAGES.
-# -dbg and -dev flavours are handled by the anonfunc below.
-# This means that task recipes used to build multiple task
-# packages have to modify PACKAGES after inheriting task.bbclass.
-PACKAGES = "${PN}"
-
-# By default, task packages do not depend on a certain architecture.
-# Only if dependencies are modified by MACHINE_FEATURES, packages
-# need to be set to MACHINE_ARCH after inheriting task.bbclass
-PACKAGE_ARCH = "all"
-
-# This automatically adds -dbg and -dev flavours of all PACKAGES
-# to the list. Their dependencies (RRECOMMENDS) are handled as usual
-# by package_depchains in a following step.
-python () {
-    packages = d.getVar('PACKAGES', True).split()
-    genpackages = []
-    for pkg in packages:
-        for postfix in ['-dbg', '-dev']:
-            genpackages.append(pkg+postfix)
-    d.setVar('PACKAGES', ' '.join(packages+genpackages))
+python __anonymous() {
+    bb.warn("%s: task.bbclass is deprecated, please inherit packagegroup instead" % d.getVar("PN", True))
 }
 
-# We don't want to look at shared library dependencies for the
-# dbg packages
-DEPCHAIN_DBGDEFAULTDEPS = "1"
+inherit packagegroup
+
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1d56813..702fc50 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -691,7 +691,7 @@ SSTATE_DIR ?= "${TOPDIR}/sstate-cache"
 IMAGE_FSTYPES ?= "tar.gz"
 INITRAMFS_FSTYPES ?= "cpio.gz"
 PCMCIA_MANAGER ?= "pcmciautils"
-DEFAULT_TASK_PROVIDER ?= "task-base"
+DEFAULT_TASK_PROVIDER ?= "packagegroup-base"
 MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
 IMAGE_ROOTFS_SIZE ?= "65536"
 
@@ -705,7 +705,7 @@ CACHE := "${CACHE}"
 OES_BITBAKE_CONF = "1"
 
 ##################################################################
-# Machine properties and task-base stuff
+# Machine properties and packagegroup-base stuff
 ##################################################################
 
 DISTRO_FEATURES ?= ""
diff --git a/meta/recipes-bsp/qemu-config/qemu-config.bb b/meta/recipes-bsp/qemu-config/qemu-config.bb
index 8305f3a..5f7be28 100644
--- a/meta/recipes-bsp/qemu-config/qemu-config.bb
+++ b/meta/recipes-bsp/qemu-config/qemu-config.bb
@@ -37,7 +37,7 @@ pkg_postinst_${PN} () {
         sed -i $D${datadir}/applications/shutdown.desktop -e 's/^Exec=halt/Exec=reboot/'
 }
 
-RDEPENDS_${PN} = "distcc ${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)} task-core-nfs-server oprofileui-server rsync bash"
+RDEPENDS_${PN} = "distcc ${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)} packagegroup-core-nfs-server oprofileui-server rsync bash"
 
 inherit update-rc.d allarch
 
diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
index 87eee1a..a86daa5 100644
--- a/meta/recipes-core/images/build-appliance-image.bb
+++ b/meta/recipes-core/images/build-appliance-image.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "An image you can boot and run using either the VMware Player or VMware Workstation.  For more information, see the<a href='http://www.yoctoproject.org/documentation/build-appliance'>Build Appliance page</a>."
-IMAGE_INSTALL = "task-core-boot task-core-apps-console task-core-ssh-openssh task-self-hosted"
+IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-apps-console packagegroup-core-ssh-openssh packagegroup-self-hosted"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 089a728..0d2613e 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "A small image just capable of allowing a device to boot."
 
-IMAGE_INSTALL = "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL}"
+IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL}"
 
 IMAGE_LINGUAS = " "
 
diff --git a/meta/recipes-core/meta/meta-toolchain-gmae.bb b/meta/recipes-core/meta/meta-toolchain-gmae.bb
index 512810b..5d80574 100644
--- a/meta/recipes-core/meta/meta-toolchain-gmae.bb
+++ b/meta/recipes-core/meta/meta-toolchain-gmae.bb
@@ -1,4 +1,4 @@
-TOOLCHAIN_TARGET_GMAETASK ?= "task-core-standalone-gmae-sdk-target task-core-standalone-gmae-sdk-target-dbg"
+TOOLCHAIN_TARGET_GMAETASK ?= "packagegroup-core-standalone-gmae-sdk-target packagegroup-core-standalone-gmae-sdk-target-dbg"
 TOOLCHAIN_TARGET_TASK = "${TOOLCHAIN_TARGET_GMAETASK}"
 TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-gmae-${DISTRO_VERSION}"
 PROVIDES = "meta-toolchain-sdk"
diff --git a/meta/recipes-core/tasks/nativesdk-task-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
similarity index 100%
rename from meta/recipes-core/tasks/nativesdk-task-sdk-host.bb
rename to meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
similarity index 45%
rename from meta/recipes-core/tasks/task-base.bb
rename to meta/recipes-core/packagegroups/packagegroup-base.bb
index d5dd140..ea894b2 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -4,46 +4,46 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r75"
 
-inherit task
+inherit packagegroup
 
 PROVIDES = "${PACKAGES}"
 PACKAGES = ' \
-            task-base \
-            task-base-extended \
-            task-distro-base \
-            task-machine-base \
+            packagegroup-base \
+            packagegroup-base-extended \
+            packagegroup-distro-base \
+            packagegroup-machine-base \
             \
-            ${@base_contains("MACHINE_FEATURES", "acpi", "task-base-acpi", "",d)} \
-            ${@base_contains("MACHINE_FEATURES", "alsa", "task-base-alsa", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "apm", "task-base-apm", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "ext2", "task-base-ext2", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "vfat", "task-base-vfat", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "irda", "task-base-irda", "",d)} \
-            ${@base_contains("MACHINE_FEATURES", "keyboard", "task-base-keyboard", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "pci", "task-base-pci", "",d)} \
-            ${@base_contains("MACHINE_FEATURES", "pcmcia", "task-base-pcmcia", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "phone", "task-base-phone", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "screen", "task-base-screen", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "serial", "task-base-serial", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "touchscreen", "task-base-touchscreen", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "usbgadget", "task-base-usbgadget", "", d)} \
-            ${@base_contains("MACHINE_FEATURES", "usbhost", "task-base-usbhost", "", d)} \
+            ${@base_contains("MACHINE_FEATURES", "acpi", "packagegroup-base-acpi", "",d)} \
+            ${@base_contains("MACHINE_FEATURES", "alsa", "packagegroup-base-alsa", "", d)} \
+            ${@base_contains("MACHINE_FEATURES", "apm", "packagegroup-base-apm", "", d)} \
+            ${@base_contains("MACHINE_FEATURES", "ext2", "packagegroup-base-ext2", "", d)} \
+            ${@base_contains("MACHINE_FEATURES", "vfat", "packagegroup-base-vfat", "", d)} \
+            ${@base_contains("MACHINE_FEATURES", "irda", "packagegroup-base-irda", "",d)} \
+            ${@base_contains("MACHINE_FEATURES", "keyboard", "packagegroup-base-keyboard", "", d)} \
+            ${@base_contains("MACHINE_FEATURES", "pci", "packagegroup-base-pci", "",d)} \
+            ${@base_contains("MACHINE_FEATURES", "pcmcia", "packagegroup-base-pcmcia", "", d)} \
+            ${@base_contains("MACHINE_FEATURES", "phone", "packagegroup-base-phone", "", d)} \
+            ${@base_contains("MACHINE_FEATURES", "screen", "packagegroup-base-screen", "", d)} \
+            ${@base_contains("MACHINE_FEATURES", "serial", "packagegroup-base-serial", "", d)} \
+            ${@base_contains("MACHINE_FEATURES", "touchscreen", "packagegroup-base-touchscreen", "", d)} \
+            ${@base_contains("MACHINE_FEATURES", "usbgadget", "packagegroup-base-usbgadget", "", d)} \
+            ${@base_contains("MACHINE_FEATURES", "usbhost", "packagegroup-base-usbhost", "", d)} \
             \
-            ${@base_contains("MACHINE_FEATURES", "uboot", "task-base-uboot", "",d)} \
-            ${@base_contains("MACHINE_FEATURES", "redboot", "task-base-redboot", "",d)} \
-            ${@base_contains("MACHINE_FEATURES", "apex", "task-base-apex", "",d)} \
+            ${@base_contains("MACHINE_FEATURES", "uboot", "packagegroup-base-uboot", "",d)} \
+            ${@base_contains("MACHINE_FEATURES", "redboot", "packagegroup-base-redboot", "",d)} \
+            ${@base_contains("MACHINE_FEATURES", "apex", "packagegroup-base-apex", "",d)} \
 	    \
-            ${@base_contains("DISTRO_FEATURES", "bluetooth", "task-base-bluetooth", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "wifi", "task-base-wifi", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "3g", "task-base-3g", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "cramfs", "task-base-cramfs", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "ipsec", "task-base-ipsec", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "ipv6", "task-base-ipv6", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "nfs", "task-base-nfs", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "ppp", "task-base-ppp", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "smbfs", "task-base-smbfs", "", d)} \
-            ${@base_contains("DISTRO_FEATURES", "raid", "task-base-raid", "",d)} \
-            ${@base_contains("DISTRO_FEATURES", "zeroconf", "task-base-zeroconf", "", d)} \
+            ${@base_contains("DISTRO_FEATURES", "bluetooth", "packagegroup-base-bluetooth", "", d)} \
+            ${@base_contains("DISTRO_FEATURES", "wifi", "packagegroup-base-wifi", "", d)} \
+            ${@base_contains("DISTRO_FEATURES", "3g", "packagegroup-base-3g", "", d)} \
+            ${@base_contains("DISTRO_FEATURES", "cramfs", "packagegroup-base-cramfs", "", d)} \
+            ${@base_contains("DISTRO_FEATURES", "ipsec", "packagegroup-base-ipsec", "", d)} \
+            ${@base_contains("DISTRO_FEATURES", "ipv6", "packagegroup-base-ipv6", "", d)} \
+            ${@base_contains("DISTRO_FEATURES", "nfs", "packagegroup-base-nfs", "", d)} \
+            ${@base_contains("DISTRO_FEATURES", "ppp", "packagegroup-base-ppp", "", d)} \
+            ${@base_contains("DISTRO_FEATURES", "smbfs", "packagegroup-base-smbfs", "", d)} \
+            ${@base_contains("DISTRO_FEATURES", "raid", "packagegroup-base-raid", "",d)} \
+            ${@base_contains("DISTRO_FEATURES", "zeroconf", "packagegroup-base-zeroconf", "", d)} \
             \
             '
 
@@ -61,46 +61,46 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 
 #
-# task-base contain stuff needed for base system (machine related)
+# packagegroup-base contain stuff needed for base system (machine related)
 #
-RDEPENDS_task-base = "\
-    task-distro-base \
-    task-machine-base \
+RDEPENDS_packagegroup-base = "\
+    packagegroup-distro-base \
+    packagegroup-machine-base \
     \
     sysfsutils \
     module-init-tools \
-    ${@base_contains('MACHINE_FEATURES', 'apm', 'task-base-apm', '',d)} \
-    ${@base_contains('MACHINE_FEATURES', 'acpi', 'task-base-acpi', '',d)} \
-    ${@base_contains('MACHINE_FEATURES', 'keyboard', 'task-base-keyboard', '',d)} \
-    ${@base_contains('MACHINE_FEATURES', 'phone', 'task-base-phone', '',d)} \
+    ${@base_contains('MACHINE_FEATURES', 'apm', 'packagegroup-base-apm', '',d)} \
+    ${@base_contains('MACHINE_FEATURES', 'acpi', 'packagegroup-base-acpi', '',d)} \
+    ${@base_contains('MACHINE_FEATURES', 'keyboard', 'packagegroup-base-keyboard', '',d)} \
+    ${@base_contains('MACHINE_FEATURES', 'phone', 'packagegroup-base-phone', '',d)} \
     \
-    ${@base_contains('COMBINED_FEATURES', 'alsa', 'task-base-alsa', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'ext2', 'task-base-ext2', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'vfat', 'task-base-vfat', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'irda', 'task-base-irda', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'pci', 'task-base-pci', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'task-base-pcmcia', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'usbgadget', 'task-base-usbgadget', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'usbhost', 'task-base-usbhost', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'bluetooth', 'task-base-bluetooth', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'wifi', 'task-base-wifi', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', '3g', 'task-base-3g', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'uboot', 'task-base-uboot', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'redboot', 'task-base-redboot', '',d)} \
-    ${@base_contains('COMBINED_FEATURES', 'apex', 'task-base-apex', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'alsa', 'packagegroup-base-alsa', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'ext2', 'packagegroup-base-ext2', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'vfat', 'packagegroup-base-vfat', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'irda', 'packagegroup-base-irda', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'pci', 'packagegroup-base-pci', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'packagegroup-base-pcmcia', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'usbgadget', 'packagegroup-base-usbgadget', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'usbhost', 'packagegroup-base-usbhost', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'bluetooth', 'packagegroup-base-bluetooth', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'wifi', 'packagegroup-base-wifi', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', '3g', 'packagegroup-base-3g', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'uboot', 'packagegroup-base-uboot', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'redboot', 'packagegroup-base-redboot', '',d)} \
+    ${@base_contains('COMBINED_FEATURES', 'apex', 'packagegroup-base-apex', '',d)} \
     \
-    ${@base_contains('DISTRO_FEATURES', 'nfs', 'task-base-nfs', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'cramfs', 'task-base-cramfs', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'smbfs', 'task-base-smbfs', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'ipv6', 'task-base-ipv6', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'ipsec', 'task-base-ipsec', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'ppp', 'task-base-ppp', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'raid', 'task-base-raid', '',d)} \
-    ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'task-base-zeroconf', '',d)} \
+    ${@base_contains('DISTRO_FEATURES', 'nfs', 'packagegroup-base-nfs', '',d)} \
+    ${@base_contains('DISTRO_FEATURES', 'cramfs', 'packagegroup-base-cramfs', '',d)} \
+    ${@base_contains('DISTRO_FEATURES', 'smbfs', 'packagegroup-base-smbfs', '',d)} \
+    ${@base_contains('DISTRO_FEATURES', 'ipv6', 'packagegroup-base-ipv6', '',d)} \
+    ${@base_contains('DISTRO_FEATURES', 'ipsec', 'packagegroup-base-ipsec', '',d)} \
+    ${@base_contains('DISTRO_FEATURES', 'ppp', 'packagegroup-base-ppp', '',d)} \
+    ${@base_contains('DISTRO_FEATURES', 'raid', 'packagegroup-base-raid', '',d)} \
+    ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-base-zeroconf', '',d)} \
     "
 
 
-RRECOMMENDS_task-base = "\
+RRECOMMENDS_packagegroup-base = "\
     kernel-module-nls-utf8 \
     kernel-module-input \
     kernel-module-uinput \
@@ -109,8 +109,8 @@ RRECOMMENDS_task-base = "\
     kernel-module-rtc-sysfs \
     kernel-module-unix"
 
-RDEPENDS_task-base-extended = "\
-    task-base \
+RDEPENDS_packagegroup-base-extended = "\
+    packagegroup-base \
     ${ADD_WIFI} \
     ${ADD_BT} \
     ${ADD_3G} \
@@ -122,77 +122,77 @@ ADD_3G = ""
 
 python __anonymous () {
     # If Distro want wifi and machine feature wifi/pci/pcmcia/usbhost (one of them)
-    # then include task-base-wifi in task-base
+    # then include packagegroup-base-wifi in packagegroup-base
 
     distro_features = set(d.getVar("DISTRO_FEATURES", True).split())
     machine_features= set(d.getVar("MACHINE_FEATURES", True).split())
 
     if "bluetooth" in distro_features and not "bluetooth" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
-	d.setVar("ADD_BT", "task-base-bluetooth")
+	d.setVar("ADD_BT", "packagegroup-base-bluetooth")
 
     if "wifi" in distro_features and not "wifi" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
-	d.setVar("ADD_WIFI", "task-base-wifi")
+	d.setVar("ADD_WIFI", "packagegroup-base-wifi")
 
     if "3g" in distro_features and not "3g" in machine_features and ("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in machine_features):
-	d.setVar("ADD_3G", "task-base-3g")
+	d.setVar("ADD_3G", "packagegroup-base-3g")
 }
 
 #
 # packages added by distribution
 #
-DEPENDS_task-distro-base = "${DISTRO_EXTRA_DEPENDS}"
-RDEPENDS_task-distro-base = "${DISTRO_EXTRA_RDEPENDS}"
-RRECOMMENDS_task-distro-base = "${DISTRO_EXTRA_RRECOMMENDS}"
+DEPENDS_packagegroup-distro-base = "${DISTRO_EXTRA_DEPENDS}"
+RDEPENDS_packagegroup-distro-base = "${DISTRO_EXTRA_RDEPENDS}"
+RRECOMMENDS_packagegroup-distro-base = "${DISTRO_EXTRA_RRECOMMENDS}"
 
 #
 # packages added by machine config
 #
-RDEPENDS_task-machine-base = "${MACHINE_EXTRA_RDEPENDS}"
-RRECOMMENDS_task-machine-base = "${MACHINE_EXTRA_RRECOMMENDS}"
+RDEPENDS_packagegroup-machine-base = "${MACHINE_EXTRA_RDEPENDS}"
+RRECOMMENDS_packagegroup-machine-base = "${MACHINE_EXTRA_RRECOMMENDS}"
 
-RDEPENDS_task-base-keyboard = "\
+RDEPENDS_packagegroup-base-keyboard = "\
     keymaps"
 
-RDEPENDS_task-base-pci = "\
+RDEPENDS_packagegroup-base-pci = "\
     pciutils"
 
-RDEPENDS_task-base-acpi = "\
+RDEPENDS_packagegroup-base-acpi = "\
     acpid \
     libacpi "
 
-RDEPENDS_task-base-apm = "\
+RDEPENDS_packagegroup-base-apm = "\
     ${VIRTUAL-RUNTIME_apm} \
     apmd"
 
-RDEPENDS_task-base-ext2 = "\
+RDEPENDS_packagegroup-base-ext2 = "\
     hdparm \
     e2fsprogs \
     e2fsprogs-e2fsck \
     e2fsprogs-mke2fs"
 
-RRECOMMENDS_task-base-vfat = "\
+RRECOMMENDS_packagegroup-base-vfat = "\
     kernel-module-msdos \
     kernel-module-vfat \
     kernel-module-nls-iso8859-1 \
     kernel-module-nls-cp437"
 
-RDEPENDS_task-base-alsa = "\
+RDEPENDS_packagegroup-base-alsa = "\
     alsa-utils-alsactl \
     alsa-utils-alsamixer \
     ${VIRTUAL-RUNTIME_alsa-state}"
 
-RRECOMMENDS_task-base-alsa = "\
+RRECOMMENDS_packagegroup-base-alsa = "\
     kernel-module-snd-mixer-oss \
     kernel-module-snd-pcm-oss"
 
-RDEPENDS_task-base-pcmcia = "\
+RDEPENDS_packagegroup-base-pcmcia = "\
     pcmciautils \
     "
 #${@base_contains('DISTRO_FEATURES', 'wifi', 'prism-firmware', '',d)}
 #${@base_contains('DISTRO_FEATURES', 'wifi', 'spectrum-fw', '',d)}
 
 
-RRECOMMENDS_task-base-pcmcia = "\
+RRECOMMENDS_packagegroup-base-pcmcia = "\
     kernel-module-pcmcia \
     kernel-module-airo-cs \
     kernel-module-pcnet-cs \
@@ -205,12 +205,12 @@ RRECOMMENDS_task-base-pcmcia = "\
 
 # Provide bluez-utils-compat utils for the time being, the binaries in that package will vanish soon from upstream releases, so beware! 
 
-RDEPENDS_task-base-bluetooth = "\
+RDEPENDS_packagegroup-base-bluetooth = "\
     bluez4 \
     ${@base_contains('COMBINED_FEATURES', 'alsa', 'libasound-module-bluez', '',d)} \
     "
 
-RRECOMMENDS_task-base-bluetooth = "\
+RRECOMMENDS_packagegroup-base-bluetooth = "\
     kernel-module-bluetooth \
     kernel-module-l2cap \
     kernel-module-rfcomm \
@@ -226,10 +226,10 @@ RRECOMMENDS_task-base-bluetooth = "\
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-dtl1-cs', '',d)} \
     "
 
-RDEPENDS_task-base-irda = "\
+RDEPENDS_packagegroup-base-irda = "\
     irda-utils"
 
-RRECOMMENDS_task-base-irda = "\
+RRECOMMENDS_packagegroup-base-irda = "\
     kernel-module-pxaficp-ir \
     kernel-module-irda \
     kernel-module-ircomm \
@@ -242,17 +242,17 @@ RRECOMMENDS_task-base-irda = "\
     kernel-module-sir-dev \
     ${@base_contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-ir-usb', '',d)} "
 
-RRECOMMENDS_task-base-usbgadget = "\
+RRECOMMENDS_packagegroup-base-usbgadget = "\
     kernel-module-pxa27x_udc \
     kernel-module-gadgetfs \
     kernel-module-g-file-storage \
     kernel-module-g-serial \
     kernel-module-g-ether"
 
-RDEPENDS_task-base-usbhost = "\
+RDEPENDS_packagegroup-base-usbhost = "\
     usbutils "
 
-RRECOMMENDS_task-base-usbhost = "\
+RRECOMMENDS_packagegroup-base-usbhost = "\
     kernel-module-uhci-hcd \
     kernel-module-ohci-hcd \
     kernel-module-ehci-hcd \
@@ -266,34 +266,34 @@ RRECOMMENDS_task-base-usbhost = "\
     kernel-module-usbserial \
     kernel-module-usb-storage "
 
-RDEPENDS_task-base-ppp = "\
+RDEPENDS_packagegroup-base-ppp = "\
     ppp \
     ppp-dialin"
 
-RRECOMMENDS_task-base-ppp = "\
+RRECOMMENDS_packagegroup-base-ppp = "\
     kernel-module-ppp-async \
     kernel-module-ppp-deflate \
     kernel-module-ppp-generic \
     kernel-module-ppp-mppe \
     kernel-module-slhc"
 
-RDEPENDS_task-base-ipsec = "\
+RDEPENDS_packagegroup-base-ipsec = "\
     openswan"
 
-RRECOMMENDS_task-base-ipsec = "\
+RRECOMMENDS_packagegroup-base-ipsec = "\
     kernel-module-ipsec"
 
 #
-# task-base-wifi contain everything needed to get WiFi working
+# packagegroup-base-wifi contain everything needed to get WiFi working
 # WEP/WPA connection needs to be supported out-of-box
 #
-RDEPENDS_task-base-wifi = "\
+RDEPENDS_packagegroup-base-wifi = "\
     wireless-tools \
     ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'hostap-utils', '',d)} \
     ${@base_contains('COMBINED_FEATURES', 'pci', 'hostap-utils', '',d)} \
     wpa-supplicant"
 
-RRECOMMENDS_task-base-wifi = "\
+RRECOMMENDS_packagegroup-base-wifi = "\
     ${@base_contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-zd1211rw', '',d)} \
     kernel-module-ieee80211-crypt \
     kernel-module-ieee80211-crypt-ccmp \
@@ -307,53 +307,53 @@ RRECOMMENDS_task-base-wifi = "\
     kernel-module-aes-generic \
     kernel-module-aes"
 
-RDEPENDS_task-base-3g = "\
+RDEPENDS_packagegroup-base-3g = "\
     ofono"
 
-RRECOMMENDS_task-base-3g = "\
+RRECOMMENDS_packagegroup-base-3g = "\
     kernel-module-cdc-acm \
     kernel-module-cdc-wdm"
 
-RRECOMMENDS_task-base-smbfs = "\
+RRECOMMENDS_packagegroup-base-smbfs = "\
     kernel-module-cifs \
     kernel-module-smbfs"
 
-RRECOMMENDS_task-base-cramfs = "\
+RRECOMMENDS_packagegroup-base-cramfs = "\
     kernel-module-cramfs"
 
 #
-# task-base-nfs provides ONLY client support - server is in nfs-utils package
+# packagegroup-base-nfs provides ONLY client support - server is in nfs-utils package
 #
-RDEPENDS_task-base-nfs = "\
+RDEPENDS_packagegroup-base-nfs = "\
     portmap"
 
-RRECOMMENDS_task-base-nfs = "\
+RRECOMMENDS_packagegroup-base-nfs = "\
     kernel-module-nfs "
 
-RDEPENDS_task-base-zeroconf = "\
+RDEPENDS_packagegroup-base-zeroconf = "\
     avahi-daemon"
 
-RDEPENDS_task-base-raid = "\
+RDEPENDS_packagegroup-base-raid = "\
 	"
 
-RDEPENDS_task-base-screen = "\
+RDEPENDS_packagegroup-base-screen = "\
 	"
 
 #
 # GPE/OPIE/OpenMoko provide own touchscreen calibration utils
 #
-RDEPENDS_task-base-touchscreen = "\
+RDEPENDS_packagegroup-base-touchscreen = "\
     "
 
-RDEPENDS_task-base-ipv6 = "\
+RDEPENDS_packagegroup-base-ipv6 = "\
     "
 
-RRECOMMENDS_task-base-ipv6 = "\
+RRECOMMENDS_packagegroup-base-ipv6 = "\
     kernel-module-ipv6 "
 
-RDEPENDS_task-base-serial = "\
+RDEPENDS_packagegroup-base-serial = "\
     setserial \
     lrzsz "
 
-RDEPENDS_task-base-phone = "\
+RDEPENDS_packagegroup-base-phone = "\
     ofono"
diff --git a/meta/recipes-core/tasks/task-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
similarity index 88%
rename from meta/recipes-core/tasks/task-core-boot.bb
rename to meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 2947509..7e80fff 100644
--- a/meta/recipes-core/tasks/task-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -25,12 +25,12 @@ VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
 PACKAGES = "\
-    task-core-boot \
-    task-core-boot-dbg \
-    task-core-boot-dev \
+    packagegroup-core-boot \
+    packagegroup-core-boot-dbg \
+    packagegroup-core-boot-dev \
 "
 
-RDEPENDS_task-core-boot = "\
+RDEPENDS_packagegroup-core-boot = "\
     base-files \
     base-passwd \
     busybox \
@@ -45,5 +45,5 @@ RDEPENDS_task-core-boot = "\
     ${VIRTUAL-RUNTIME_update-alternatives} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
 
-RRECOMMENDS_task-core-boot = "\
+RRECOMMENDS_packagegroup-core-boot = "\
     ${MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS}"
diff --git a/meta/recipes-core/tasks/task-core-console.bb b/meta/recipes-core/packagegroups/packagegroup-core-console.bb
similarity index 73%
rename from meta/recipes-core/tasks/task-core-console.bb
rename to meta/recipes-core/packagegroups/packagegroup-core-console.bb
index cb22732..fd8eb25 100644
--- a/meta/recipes-core/tasks/task-core-console.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-console.bb
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 PR = "r35"
 
 PACKAGES = "\
-    task-core-apps-console \
-    task-core-apps-console-dbg \
-    task-core-apps-console-dev \
+    packagegroup-core-apps-console \
+    packagegroup-core-apps-console-dbg \
+    packagegroup-core-apps-console-dev \
     "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -20,7 +20,7 @@ ALLOW_EMPTY = "1"
 
 SPLASH ?= "psplash"
 
-RDEPENDS_task-core-apps-console = "\
+RDEPENDS_packagegroup-core-apps-console = "\
     avahi-daemon \
     dbus \
     portmap \
diff --git a/meta/recipes-core/tasks/task-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
similarity index 65%
rename from meta/recipes-core/tasks/task-core-nfs.bb
rename to meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index 5c7f455..e63753b 100644
--- a/meta/recipes-core/tasks/task-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -9,14 +9,14 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 PR = "r1"
 
 PACKAGES = "\
-    task-core-nfs-server \
-    task-core-nfs-server-dbg \
-    task-core-nfs-server-dev \
+    packagegroup-core-nfs-server \
+    packagegroup-core-nfs-server-dbg \
+    packagegroup-core-nfs-server-dev \
     "
 
 ALLOW_EMPTY = "1"
 
-RDEPENDS_task-core-nfs-server = "\
+RDEPENDS_packagegroup-core-nfs-server = "\
     nfs-utils \
     nfs-utils-client \
     "
@@ -24,5 +24,5 @@ RDEPENDS_task-core-nfs-server = "\
 # rpcinfo can be useful but only with glibc images
 GLIBC_DEPENDENCIES = "glibc-utils"
 
-RRECOMMENDS_task-core-nfs-server_append_libc-glibc = " ${GLIBC_DEPENDENCIES}"
+RRECOMMENDS_packagegroup-core-nfs-server_append_libc-glibc = " ${GLIBC_DEPENDENCIES}"
 
diff --git a/meta/recipes-core/tasks/task-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
similarity index 85%
rename from meta/recipes-core/tasks/task-core-sdk.bb
rename to meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index fe95236..663f705 100644
--- a/meta/recipes-core/tasks/task-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -6,18 +6,18 @@ DESCRIPTION = "Software Development Tasks for OpenedHand Poky"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-DEPENDS = "task-core-console"
+DEPENDS = "packagegroup-core-console"
 PR = "r8"
 
 ALLOW_EMPTY = "1"
 #PACKAGEFUNCS =+ 'generate_sdk_pkgs'
 
 PACKAGES = "\
-    task-core-sdk \
-    task-core-sdk-dbg \
-    task-core-sdk-dev"
+    packagegroup-core-sdk \
+    packagegroup-core-sdk-dbg \
+    packagegroup-core-sdk-dev"
 
-RDEPENDS_task-core-sdk = "\
+RDEPENDS_packagegroup-core-sdk = "\
     autoconf \
     automake \
     binutils \
@@ -48,15 +48,15 @@ RDEPENDS_task-core-sdk = "\
     file \
     tcl"
 
-RRECOMMENDS_task-core-sdk = "\
+RRECOMMENDS_packagegroup-core-sdk = "\
     libgomp \
     libgomp-dev"
 
 #python generate_sdk_pkgs () {
-#    poky_pkgs = read_pkgdata('task-core', d)['PACKAGES']
+#    poky_pkgs = read_pkgdata('packagegroup-core', d)['PACKAGES']
 #    pkgs = d.getVar('PACKAGES', True).split()
 #    for pkg in poky_pkgs.split():
-#        newpkg = pkg.replace('task-core', 'task-core-sdk')
+#        newpkg = pkg.replace('packagegroup-core', 'packagegroup-core-sdk')
 #
 #        # for each of the task packages, add a corresponding sdk task
 #        pkgs.append(newpkg)
@@ -91,4 +91,4 @@ RRECOMMENDS_task-core-sdk = "\
 #    d.setVar('PACKAGES', ' '.join(pkgs))
 #}
 #
-#PACKAGES_DYNAMIC = "task-core-sdk-*"
+#PACKAGES_DYNAMIC = "packagegroup-core-sdk-*"
diff --git a/meta/recipes-core/tasks/task-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
similarity index 49%
rename from meta/recipes-core/tasks/task-core-ssh-dropbear.bb
rename to meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
index 1e7402e..9dcc342 100644
--- a/meta/recipes-core/tasks/task-core-ssh-dropbear.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 PR = "r0"
 
 PACKAGES = "\
-    task-core-ssh-dropbear \
-    task-core-ssh-dropbear-dbg \
-    task-core-ssh-dropbear-dev \
+    packagegroup-core-ssh-dropbear \
+    packagegroup-core-ssh-dropbear-dbg \
+    packagegroup-core-ssh-dropbear-dev \
     "
 
 ALLOW_EMPTY = "1"
 
-RDEPENDS_task-core-ssh-dropbear = "dropbear"
-RDEPENDS_task-core-ssh-dropbear-dbg = "dropbear-dbg"
-RDEPENDS_task-core-ssh-dropbear-dev = "dropbear-dev"
+RDEPENDS_packagegroup-core-ssh-dropbear = "dropbear"
+RDEPENDS_packagegroup-core-ssh-dropbear-dbg = "dropbear-dbg"
+RDEPENDS_packagegroup-core-ssh-dropbear-dev = "dropbear-dev"
diff --git a/meta/recipes-core/tasks/task-core-ssh-openssh.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
similarity index 50%
rename from meta/recipes-core/tasks/task-core-ssh-openssh.bb
rename to meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
index 794399a..7e85b29 100644
--- a/meta/recipes-core/tasks/task-core-ssh-openssh.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-openssh.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 PR = "r0"
 
 PACKAGES = "\
-    task-core-ssh-openssh \
-    task-core-ssh-openssh-dbg \
-    task-core-ssh-openssh-dev \
+    packagegroup-core-ssh-openssh \
+    packagegroup-core-ssh-openssh-dbg \
+    packagegroup-core-ssh-openssh-dev \
     "
 
 ALLOW_EMPTY = "1"
 
-RDEPENDS_task-core-ssh-openssh = "openssh"
-RDEPENDS_task-core-ssh-openssh-dbg = "openssh-dbg"
-RDEPENDS_task-core-ssh-openssh-dev = "openssh-dev"
+RDEPENDS_packagegroup-core-ssh-openssh = "openssh"
+RDEPENDS_packagegroup-core-ssh-openssh-dbg = "openssh-dbg"
+RDEPENDS_packagegroup-core-ssh-openssh-dev = "openssh-dev"
diff --git a/meta/recipes-core/tasks/task-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
similarity index 100%
rename from meta/recipes-core/tasks/task-core-standalone-sdk-target.bb
rename to meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
diff --git a/meta/recipes-core/tasks/task-core-tools-debug.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
similarity index 100%
rename from meta/recipes-core/tasks/task-core-tools-debug.bb
rename to meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb
diff --git a/meta/recipes-core/tasks/task-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
similarity index 100%
rename from meta/recipes-core/tasks/task-core-tools-profile.bb
rename to meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
diff --git a/meta/recipes-core/tasks/task-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
similarity index 100%
rename from meta/recipes-core/tasks/task-core-tools-testapps.bb
rename to meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
diff --git a/meta/recipes-core/tasks/task-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
similarity index 90%
rename from meta/recipes-core/tasks/task-cross-canadian.bb
rename to meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index 1840301..6ab4a95 100644
--- a/meta/recipes-core/tasks/task-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Host SDK package for cross canadian toolchain" 
-PN = "task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+PN = "packagegroup-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 PR = "r0"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
similarity index 80%
rename from meta/recipes-core/tasks/task-self-hosted.bb
rename to meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 4d6ab07..118ff7d 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -9,25 +9,25 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PACKAGES = "\
-    task-self-hosted \
-    task-self-hosted-debug \
-    task-self-hosted-sdk \
-    task-self-hosted-extended \
-    task-self-hosted-graphics \
-    task-self-hosted-host-tools \
+    packagegroup-self-hosted \
+    packagegroup-self-hosted-debug \
+    packagegroup-self-hosted-sdk \
+    packagegroup-self-hosted-extended \
+    packagegroup-self-hosted-graphics \
+    packagegroup-self-hosted-host-tools \
     "
 
 ALLOW_EMPTY = "1"
 
-RDEPENDS_task-self-hosted = "\
-    task-self-hosted-debug \
-    task-self-hosted-sdk \
-    task-self-hosted-extended \
-    task-self-hosted-graphics \
-    task-self-hosted-host-tools \
+RDEPENDS_packagegroup-self-hosted = "\
+    packagegroup-self-hosted-debug \
+    packagegroup-self-hosted-sdk \
+    packagegroup-self-hosted-extended \
+    packagegroup-self-hosted-graphics \
+    packagegroup-self-hosted-host-tools \
     "
 
-RDEPENDS_task-self-hosted-host-tools = "\
+RDEPENDS_packagegroup-self-hosted-host-tools = "\
     connman \
     connman-plugin-ethernet \
     dhcp-client \
@@ -52,7 +52,7 @@ RDEPENDS_task-self-hosted-host-tools = "\
     "
 
 # eglibc-utils: for rpcgen
-RDEPENDS_task-self-hosted-sdk = "\
+RDEPENDS_packagegroup-self-hosted-sdk = "\
     autoconf \
     automake \
     binutils \
@@ -85,7 +85,7 @@ RDEPENDS_task-self-hosted-sdk = "\
     sed \
     "
 
-RDEPENDS_task-self-hosted-debug = " \
+RDEPENDS_packagegroup-self-hosted-debug = " \
     gdb \
     gdbserver \
     rsync \
@@ -93,7 +93,7 @@ RDEPENDS_task-self-hosted-debug = " \
     tcf-agent"
 
 
-RDEPENDS_task-self-hosted-extended = "\
+RDEPENDS_packagegroup-self-hosted-extended = "\
     bzip2 \
     chkconfig \
     chrpath \
@@ -186,7 +186,7 @@ RDEPENDS_task-self-hosted-extended = "\
     "
 
 
-RDEPENDS_task-self-hosted-graphics = "\
+RDEPENDS_packagegroup-self-hosted-graphics = "\
     builder \
     libgl \
     libgl-dev \
diff --git a/meta/recipes-extended/images/core-image-basic.bb b/meta/recipes-extended/images/core-image-basic.bb
index f801346..9aa880e 100644
--- a/meta/recipes-extended/images/core-image-basic.bb
+++ b/meta/recipes-extended/images/core-image-basic.bb
@@ -4,8 +4,8 @@ reasonably used for customization."
 IMAGE_FEATURES += "apps-console-core ssh-server-openssh"
 
 IMAGE_INSTALL = "\
-    task-core-boot \
-    task-core-basic \
+    packagegroup-core-boot \
+    packagegroup-core-basic \
     "
 
 #    ${CORE_IMAGE_BASE_INSTALL} 
diff --git a/meta/recipes-extended/images/core-image-lsb-dev.bb b/meta/recipes-extended/images/core-image-lsb-dev.bb
index 3bb7800..557259b 100644
--- a/meta/recipes-extended/images/core-image-lsb-dev.bb
+++ b/meta/recipes-extended/images/core-image-lsb-dev.bb
@@ -6,8 +6,8 @@ IMAGE_FEATURES += "apps-console-core dev-pkgs ssh-server-openssh"
 
 IMAGE_INSTALL = "\
     ${CORE_IMAGE_BASE_INSTALL} \
-    task-core-basic \
-    task-core-lsb \
+    packagegroup-core-basic \
+    packagegroup-core-lsb \
     "
 
 inherit core-image
diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/recipes-extended/images/core-image-lsb-sdk.bb
index 7601410..d07f90d 100644
--- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
+++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
@@ -8,8 +8,8 @@ IMAGE_FEATURES += "apps-console-core tools-sdk dev-pkgs ssh-server-openssh \
 
 IMAGE_INSTALL = "\
     ${CORE_IMAGE_BASE_INSTALL} \
-    task-core-basic \
-    task-core-lsb \
+    packagegroup-core-basic \
+    packagegroup-core-lsb \
     kernel-dev \
     "
 
diff --git a/meta/recipes-extended/images/core-image-lsb.bb b/meta/recipes-extended/images/core-image-lsb.bb
index b370d49..8435596 100644
--- a/meta/recipes-extended/images/core-image-lsb.bb
+++ b/meta/recipes-extended/images/core-image-lsb.bb
@@ -6,8 +6,8 @@ IMAGE_FEATURES += "apps-console-core ssh-server-openssh"
 
 IMAGE_INSTALL = "\
     ${CORE_IMAGE_BASE_INSTALL} \
-    task-core-basic \
-    task-core-lsb \
+    packagegroup-core-basic \
+    packagegroup-core-lsb \
     "
 
 inherit core-image
diff --git a/meta/recipes-extended/libzypp/libzypp/config-release.patch b/meta/recipes-extended/libzypp/libzypp/config-release.patch
index b4e7ab0..26c7307 100644
--- a/meta/recipes-extended/libzypp/libzypp/config-release.patch
+++ b/meta/recipes-extended/libzypp/libzypp/config-release.patch
@@ -5,7 +5,7 @@ Configure distro version package
 We need to configure a package that the system can use to determine the
 system distribution version.
 
-Hack: for now set to task-core-rpm.
+Hack: for now set to packagegroup-core-rpm.
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 
@@ -17,7 +17,7 @@ diff -ur git.orig/zypp/ZConfig.cc git/zypp/ZConfig.cc
  
    std::string ZConfig::distroverpkg() const
 -  { return "redhat-release"; }
-+  { return "task-core-rpm"; }
++  { return "packagegroup-core-rpm"; }
  
    ///////////////////////////////////////////////////////////////////
  
diff --git a/meta/recipes-extended/tasks/task-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
similarity index 43%
rename from meta/recipes-extended/tasks/task-core-basic.bb
rename to meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
index a810d37..a7e3eb7 100644
--- a/meta/recipes-extended/tasks/task-core-basic.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
@@ -9,59 +9,59 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PACKAGES = "\
-    task-core-basic \
-    task-core-base-utils \
-    task-core-base-utils-dbg \
-    task-core-base-utils-dev \
-    task-core-basic-libs \
-    task-core-basic-libs-dbg \
-    task-core-basic-libs-dev \
-    task-core-basic-utils \
-    task-core-basic-utils-dbg \
-    task-core-basic-utils-dev \
-    task-core-basic-extended \
-    task-core-basic-extended-dbg \
-    task-core-basic-extended-dev \
-    task-core-dev-utils \
-    task-core-dev-utils-dbg \
-    task-core-dev-utils-dev \
-    task-core-multiuser \
-    task-core-multiuser-dbg \
-    task-core-multiuser-dev \
-    task-core-initscripts \
-    task-core-initscripts-dbg \
-    task-core-initscripts-dev \
-    task-core-rpm \
-    task-core-rpm-dbg \
-    task-core-rpm-dev \
-    task-core-sys-services \
-    task-core-sys-services-dbg \
-    task-core-sys-services-dev \
+    packagegroup-core-basic \
+    packagegroup-core-base-utils \
+    packagegroup-core-base-utils-dbg \
+    packagegroup-core-base-utils-dev \
+    packagegroup-core-basic-libs \
+    packagegroup-core-basic-libs-dbg \
+    packagegroup-core-basic-libs-dev \
+    packagegroup-core-basic-utils \
+    packagegroup-core-basic-utils-dbg \
+    packagegroup-core-basic-utils-dev \
+    packagegroup-core-basic-extended \
+    packagegroup-core-basic-extended-dbg \
+    packagegroup-core-basic-extended-dev \
+    packagegroup-core-dev-utils \
+    packagegroup-core-dev-utils-dbg \
+    packagegroup-core-dev-utils-dev \
+    packagegroup-core-multiuser \
+    packagegroup-core-multiuser-dbg \
+    packagegroup-core-multiuser-dev \
+    packagegroup-core-initscripts \
+    packagegroup-core-initscripts-dbg \
+    packagegroup-core-initscripts-dev \
+    packagegroup-core-rpm \
+    packagegroup-core-rpm-dbg \
+    packagegroup-core-rpm-dev \
+    packagegroup-core-sys-services \
+    packagegroup-core-sys-services-dbg \
+    packagegroup-core-sys-services-dev \
     "
 
 ALLOW_EMPTY = "1"
 
-RDEPENDS_task-core-basic = "\
-    task-core-base-utils \
-    task-core-basic-libs \
-    task-core-basic-utils \
-    task-core-basic-extended \
-    task-core-dev-utils \
-    task-core-multiuser \
-    task-core-initscripts \
-    task-core-rpm \
-    task-core-sys-services \
+RDEPENDS_packagegroup-core-basic = "\
+    packagegroup-core-base-utils \
+    packagegroup-core-basic-libs \
+    packagegroup-core-basic-utils \
+    packagegroup-core-basic-extended \
+    packagegroup-core-dev-utils \
+    packagegroup-core-multiuser \
+    packagegroup-core-initscripts \
+    packagegroup-core-rpm \
+    packagegroup-core-sys-services \
     "
 
-RDEPENDS_task-core-base-utils = "\
+RDEPENDS_packagegroup-core-base-utils = "\
     busybox \
     "
 
-RDEPENDS_task-core-basic-libs = "\
+RDEPENDS_packagegroup-core-basic-libs = "\
     glib-2.0 \
     "
 
-RDEPENDS_task-core-basic-utils = "\
+RDEPENDS_packagegroup-core-basic-utils = "\
     bash \
     acl \
     attr \
@@ -92,7 +92,7 @@ RDEPENDS_task-core-basic-utils = "\
     zlib \
     "
 
-RDEPENDS_task-core-basic-extended = "\
+RDEPENDS_packagegroup-core-basic-extended = "\
     iproute2 \
     iputils \
     iptables \
@@ -100,7 +100,7 @@ RDEPENDS_task-core-basic-extended = "\
     openssl \
     "
 
-RDEPENDS_task-core-dev-utils = "\
+RDEPENDS_packagegroup-core-dev-utils = "\
     byacc \
     diffutils \
     m4 \
@@ -108,7 +108,7 @@ RDEPENDS_task-core-dev-utils = "\
     patch \
     "
 
-RDEPENDS_task-core-initscripts = "\
+RDEPENDS_packagegroup-core-initscripts = "\
     initscripts \
     sysvinit \
     ethtool \
@@ -116,7 +116,7 @@ RDEPENDS_task-core-initscripts = "\
     sysklogd \
     "
 
-RDEPENDS_task-core-multiuser = "\
+RDEPENDS_packagegroup-core-multiuser = "\
     cracklib \
     gzip \
     libuser \
@@ -125,13 +125,13 @@ RDEPENDS_task-core-multiuser = "\
     sudo \
     "
 
-RDEPENDS_task-core-rpm = "\
+RDEPENDS_packagegroup-core-rpm = "\
     beecrypt \
     rpm \
     zypper \
     "
 
-RDEPENDS_task-core-sys-services = "\
+RDEPENDS_packagegroup-core-sys-services = "\
     at \
     bzip2 \
     cronie \
diff --git a/meta/recipes-extended/tasks/task-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
similarity index 57%
rename from meta/recipes-extended/tasks/task-core-lsb.bb
rename to meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index be9eac2..984ed36 100644
--- a/meta/recipes-extended/tasks/task-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -9,50 +9,50 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PACKAGES = "\
-    task-core-lsb \
-    task-core-sys-extended \
-    task-core-sys-extended-dbg \
-    task-core-sys-extended-dev \
-    task-core-db \
-    task-core-db-dbg \
-    task-core-db-dev \
-    task-core-misc \
-    task-core-misc-dbg \
-    task-core-misc-dev \
-    task-core-perl \
-    task-core-perl-dbg \
-    task-core-perl-dev \
-    task-core-python \
-    task-core-python-dbg \
-    task-core-python-dev \
-    task-core-tcl \
-    task-core-tcl-dbg \
-    task-core-tcl-dev \
-    task-core-lsb-perl-add \
-    task-core-lsb-python-add \
-    task-core-lsb-graphic-add \
-    task-core-lsb-runtime-add \
-    task-core-lsb-command-add \
+    packagegroup-core-lsb \
+    packagegroup-core-sys-extended \
+    packagegroup-core-sys-extended-dbg \
+    packagegroup-core-sys-extended-dev \
+    packagegroup-core-db \
+    packagegroup-core-db-dbg \
+    packagegroup-core-db-dev \
+    packagegroup-core-misc \
+    packagegroup-core-misc-dbg \
+    packagegroup-core-misc-dev \
+    packagegroup-core-perl \
+    packagegroup-core-perl-dbg \
+    packagegroup-core-perl-dev \
+    packagegroup-core-python \
+    packagegroup-core-python-dbg \
+    packagegroup-core-python-dev \
+    packagegroup-core-tcl \
+    packagegroup-core-tcl-dbg \
+    packagegroup-core-tcl-dev \
+    packagegroup-core-lsb-perl-add \
+    packagegroup-core-lsb-python-add \
+    packagegroup-core-lsb-graphic-add \
+    packagegroup-core-lsb-runtime-add \
+    packagegroup-core-lsb-command-add \
     "
 
 
 ALLOW_EMPTY = "1"
 
-RDEPENDS_task-core-lsb = "\
-    task-core-sys-extended \
-    task-core-db \
-    task-core-misc \
-    task-core-perl \
-    task-core-python \
-    task-core-tcl \
-    task-core-lsb-perl-add \
-    task-core-lsb-python-add \
-    task-core-lsb-graphic-add \
-    task-core-lsb-runtime-add \
-    task-core-lsb-command-add \
+RDEPENDS_packagegroup-core-lsb = "\
+    packagegroup-core-sys-extended \
+    packagegroup-core-db \
+    packagegroup-core-misc \
+    packagegroup-core-perl \
+    packagegroup-core-python \
+    packagegroup-core-tcl \
+    packagegroup-core-lsb-perl-add \
+    packagegroup-core-lsb-python-add \
+    packagegroup-core-lsb-graphic-add \
+    packagegroup-core-lsb-runtime-add \
+    packagegroup-core-lsb-command-add \
     "
 
-RDEPENDS_task-core-sys-extended = "\
+RDEPENDS_packagegroup-core-sys-extended = "\
     binutils \
     binutils-symlinks \
     chkconfig \
@@ -83,19 +83,19 @@ RDEPENDS_task-core-sys-extended = "\
     lsbinitscripts \
     "
 
-RDEPENDS_task-core-db = "\
+RDEPENDS_packagegroup-core-db = "\
     db \
     sqlite3 \
     "
 
-RDEPENDS_task-core-perl = "\
+RDEPENDS_packagegroup-core-perl = "\
     gdbm \
     perl \
     zlib \
     "
 
 
-RDEPENDS_task-core-python = "\
+RDEPENDS_packagegroup-core-python = "\
     expat \
     gdbm \
     gmp \
@@ -106,11 +106,11 @@ RDEPENDS_task-core-python = "\
     zip \
     "
 
-RDEPENDS_task-core-tcl = "\
+RDEPENDS_packagegroup-core-tcl = "\
     tcl \
     "
 
-RDEPENDS_task-core-misc = "\
+RDEPENDS_packagegroup-core-misc = "\
     elfutils \
     gettext \
     gettext-runtime \
@@ -128,7 +128,7 @@ RDEPENDS_task-core-misc = "\
     zlib \
     "
 
-RDEPENDS_task-core-lsb-command-add = "\
+RDEPENDS_packagegroup-core-lsb-command-add = "\
     localedef \
     fontconfig-utils \
     mailx \
@@ -140,18 +140,18 @@ RDEPENDS_task-core-lsb-command-add = "\
     ghostscript \
 "
 
-RDEPENDS_task-core-lsb-perl-add = "\
+RDEPENDS_packagegroup-core-lsb-perl-add = "\
     perl-modules \
     perl-misc \
     perl-pod \
 "
 
-RDEPENDS_task-core-lsb-python-add = "\
+RDEPENDS_packagegroup-core-lsb-python-add = "\
     python-modules \
     python-misc \
 "
 
-RDEPENDS_task-core-lsb-graphic-add = "\
+RDEPENDS_packagegroup-core-lsb-graphic-add = "\
     libqtcore4 \
     libqtgui4 \
     libqtsql4 \
@@ -178,7 +178,7 @@ RDEPENDS_task-core-lsb-graphic-add = "\
     ${@base_contains("DISTRO_FEATURES", "opengl", "libqtopengl4", "", d)} \
 "
 
-RDEPENDS_task-core-lsb-runtime-add = "\
+RDEPENDS_packagegroup-core-lsb-runtime-add = "\
     ldd \
     pam-plugin-wheel \
     e2fsprogs-mke2fs \
diff --git a/meta/recipes-gnome/tasks/task-core-sdk-gmae.bb b/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
similarity index 87%
rename from meta/recipes-gnome/tasks/task-core-sdk-gmae.bb
rename to meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
index 29a4f56..a00ca36 100644
--- a/meta/recipes-gnome/tasks/task-core-sdk-gmae.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
@@ -10,12 +10,12 @@ PR = "r12"
 
 ALLOW_EMPTY = "1"
 
-require task-sdk-gmae.inc
+require packagegroup-sdk-gmae.inc
 
 PACKAGES = "${PN}"
 
 RDEPENDS_${PN} = "\
-    task-core-sdk \
+    packagegroup-core-sdk \
     libglade-dev \
     ${SDK-GMAE} \
     ${SDK-EXTRAS}"
diff --git a/meta/recipes-gnome/tasks/task-core-standalone-gmae-sdk-target.bb b/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
similarity index 85%
rename from meta/recipes-gnome/tasks/task-core-standalone-gmae-sdk-target.bb
rename to meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
index 45b502f..3b2abdd 100644
--- a/meta/recipes-gnome/tasks/task-core-standalone-gmae-sdk-target.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
@@ -10,12 +10,12 @@ PR = "r14"
 
 ALLOW_EMPTY = "1"
 
-require task-sdk-gmae.inc
+require packagegroup-sdk-gmae.inc
 
 PACKAGES = "${PN} ${PN}-dbg"
 
 RDEPENDS_${PN} = "\
-    task-core-standalone-sdk-target \
+    packagegroup-core-standalone-sdk-target \
     libglade-dev \
     ${SDK-GMAE} \
     ${SDK-EXTRAS}"
diff --git a/meta/recipes-gnome/tasks/task-sdk-gmae.inc b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
similarity index 100%
rename from meta/recipes-gnome/tasks/task-sdk-gmae.inc
rename to meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
diff --git a/meta/recipes-graphics/images/core-image-clutter.bb b/meta/recipes-graphics/images/core-image-clutter.bb
index aa6e2a2..4c5adee 100644
--- a/meta/recipes-graphics/images/core-image-clutter.bb
+++ b/meta/recipes-graphics/images/core-image-clutter.bb
@@ -7,8 +7,8 @@ LICENSE = "MIT"
 
 IMAGE_INSTALL = "\
     ${CORE_IMAGE_BASE_INSTALL} \
-    task-core-clutter-core \
-    task-core-clutter-tests \
-    task-core-clutter-apps"
+    packagegroup-core-clutter-core \
+    packagegroup-core-clutter-tests \
+    packagegroup-core-clutter-apps"
 
 inherit core-image
diff --git a/meta/recipes-graphics/images/core-image-gtk-directfb.bb b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
index dcf5165..868b309 100644
--- a/meta/recipes-graphics/images/core-image-gtk-directfb.bb
+++ b/meta/recipes-graphics/images/core-image-gtk-directfb.bb
@@ -6,18 +6,18 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 
-DEPENDS += "task-core-gtk-directfb"
+DEPENDS += "packagegroup-core-gtk-directfb"
 
 RDEPENDS_${PN} += " \
-	task-core-gtk-directfb-base \
+	packagegroup-core-gtk-directfb-base \
 	"
 
 inherit core-image
 
 IMAGE_INSTALL += "\
 	${CORE_IMAGE_BASE_INSTALL} \
-	task-core-basic \
-	task-core-gtk-directfb-base \
+	packagegroup-core-basic \
+	packagegroup-core-gtk-directfb-base \
 "
 
 python __anonymous () {
diff --git a/meta/recipes-graphics/tasks/task-core-clutter.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
similarity index 49%
rename from meta/recipes-graphics/tasks/task-core-clutter.bb
rename to meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index 4044131..039f5c6 100644
--- a/meta/recipes-graphics/tasks/task-core-clutter.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -10,28 +10,28 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 PR = "r4"
 
 PACKAGES = "\
-    task-core-clutter-core \
-    task-core-clutter-core-dbg \
-    task-core-clutter-core-dev \
-    task-core-clutter-apps \
-    task-core-clutter-apps-dbg \
-    task-core-clutter-apps-dev \
-    task-core-clutter-tests \
-    task-core-clutter-tests-dbg \
-    task-core-clutter-tests-dev \
+    packagegroup-core-clutter-core \
+    packagegroup-core-clutter-core-dbg \
+    packagegroup-core-clutter-core-dev \
+    packagegroup-core-clutter-apps \
+    packagegroup-core-clutter-apps-dbg \
+    packagegroup-core-clutter-apps-dev \
+    packagegroup-core-clutter-tests \
+    packagegroup-core-clutter-tests-dbg \
+    packagegroup-core-clutter-tests-dev \
     "
 
 ALLOW_EMPTY = "1"
 
-RDEPENDS_task-core-clutter-core = "\
+RDEPENDS_packagegroup-core-clutter-core = "\
     clutter-1.8 \
     clutter-gst-1.8 \
     clutter-gtk-1.8 \
     "
 
-#RDEPENDS_task-core-clutter-tests = "\
+#RDEPENDS_packagegroup-core-clutter-tests = "\
 #    clutter-gst-1.8-examples \
 #    clutter-gtk-1.8-examples"
 
-#RDEPENDS_task-core-clutter-apps = "\
+#RDEPENDS_packagegroup-core-clutter-apps = "\
 #    clutter-box2d "
diff --git a/meta/recipes-graphics/tasks/task-core-gtk-directfb.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
similarity index 96%
rename from meta/recipes-graphics/tasks/task-core-gtk-directfb.bb
rename to meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
index 239e0c1..8609013 100644
--- a/meta/recipes-graphics/tasks/task-core-gtk-directfb.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-gtk-directfb.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-inherit task
+inherit packagegroup
 
 TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
 
diff --git a/meta/recipes-qt/images/qt4e-demo-image.bb b/meta/recipes-qt/images/qt4e-demo-image.bb
index 8f9478d..205c912 100644
--- a/meta/recipes-qt/images/qt4e-demo-image.bb
+++ b/meta/recipes-qt/images/qt4e-demo-image.bb
@@ -5,15 +5,15 @@ PR="r2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-DEPENDS += "task-qt4e"
+DEPENDS += "packagegroup-qt4e"
 
 RDEPENDS_${PN} += " \
-	task-qt4e-base \
+	packagegroup-qt4e-base \
 	"
 
 IMAGE_INSTALL += "\
 	${CORE_IMAGE_BASE_INSTALL} \
-	task-qt4e-base \
+	packagegroup-qt4e-base \
 "
 
 inherit core-image
diff --git a/meta/recipes-qt/meta/meta-toolchain-qte.bb b/meta/recipes-qt/meta/meta-toolchain-qte.bb
index 116db91..20dd354 100644
--- a/meta/recipes-qt/meta/meta-toolchain-qte.bb
+++ b/meta/recipes-qt/meta/meta-toolchain-qte.bb
@@ -1,7 +1,7 @@
 # Qt Embedded toolchain
 PR = "r5"
-TOOLCHAIN_HOST_TASK = "nativesdk-task-qte-toolchain-host task-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-TOOLCHAIN_TARGET_TASK = "task-qte-toolchain-target"
+TOOLCHAIN_HOST_TASK = "nativesdk-packagegroup-qte-toolchain-host packagegroup-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+TOOLCHAIN_TARGET_TASK = "packagegroup-qte-toolchain-target"
 TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-qte-${DISTRO_VERSION}"
 
 require recipes-core/meta/meta-toolchain.bb
diff --git a/meta/recipes-qt/tasks/nativesdk-task-qte-toolchain-host.bb b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb
similarity index 64%
rename from meta/recipes-qt/tasks/nativesdk-task-qte-toolchain-host.bb
rename to meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb
index 5098d11..1c53a9c 100644
--- a/meta/recipes-qt/tasks/nativesdk-task-qte-toolchain-host.bb
+++ b/meta/recipes-qt/packagegroups/nativesdk-packagegroup-qte-toolchain-host.bb
@@ -1,4 +1,4 @@
-require recipes-core/tasks/nativesdk-task-sdk-host.bb
+require recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
 
 DESCRIPTION = "Host packages for Qt Embedded SDK"
 LICENSE = "MIT"
diff --git a/meta/recipes-qt/tasks/task-core-qt.bb b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
similarity index 72%
rename from meta/recipes-qt/tasks/task-core-qt.bb
rename to meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
index 69512a4..4fe07c6 100644
--- a/meta/recipes-qt/tasks/task-core-qt.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-core-qt.bb
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 PR = "r3"
 
 PACKAGES = "\
-    task-core-qt-demos \
-    task-core-qt-demos-dbg \
-    task-core-qt-demos-dev \
+    packagegroup-core-qt-demos \
+    packagegroup-core-qt-demos-dbg \
+    packagegroup-core-qt-demos-dev \
     "
 
 ALLOW_EMPTY = "1"
@@ -19,4 +19,4 @@ ALLOW_EMPTY = "1"
 QTDEMOS ?= "quicky ${COMMERCIAL_QT} fotowall"
 #QTDEMOS_disabled = "fotowall"
 
-RDEPENDS_task-core-qt-demos = "${QTDEMOS}"
+RDEPENDS_packagegroup-core-qt-demos = "${QTDEMOS}"
diff --git a/meta/recipes-qt/tasks/task-qt4e.bb b/meta/recipes-qt/packagegroups/packagegroup-qt4e.bb
similarity index 98%
rename from meta/recipes-qt/tasks/task-qt4e.bb
rename to meta/recipes-qt/packagegroups/packagegroup-qt4e.bb
index c95c898..4b6d6a7 100644
--- a/meta/recipes-qt/tasks/task-qt4e.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-qt4e.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-inherit task
+inherit packagegroup
 
 TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
 
diff --git a/meta/recipes-qt/tasks/task-qte-toolchain-target.bb b/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
similarity index 95%
rename from meta/recipes-qt/tasks/task-qte-toolchain-target.bb
rename to meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
index 7ee575f..abd6a1f 100644
--- a/meta/recipes-qt/tasks/task-qte-toolchain-target.bb
+++ b/meta/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 RDEPENDS_${PN} += " \
-        task-core-standalone-sdk-target \
+        packagegroup-core-standalone-sdk-target \
         qt4-embedded-mkspecs \
         libqt-embeddedmultimedia4-dev \
         libqt-embeddedphonon4-dev \
diff --git a/meta/recipes-sato/tasks/task-core-x11-mini.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-mini.bb
similarity index 85%
rename from meta/recipes-sato/tasks/task-core-x11-mini.bb
rename to meta/recipes-sato/packagegroups/packagegroup-core-x11-mini.bb
index 0aed286..4f3bb47 100644
--- a/meta/recipes-sato/tasks/task-core-x11-mini.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-mini.bb
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 PR = "r1"
 
 PACKAGES = "\
-    task-core-x11-mini \
-    task-core-x11-mini-dbg \
-    task-core-x11-mini-dev \
+    packagegroup-core-x11-mini \
+    packagegroup-core-x11-mini-dbg \
+    packagegroup-core-x11-mini-dev \
     "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -29,7 +29,7 @@ VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
 VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
 
 
-RDEPENDS_task-core-x11-mini = "\
+RDEPENDS_packagegroup-core-x11-mini = "\
     dbus \
     pointercal \
     matchbox-terminal \
diff --git a/meta/recipes-sato/tasks/task-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
similarity index 83%
rename from meta/recipes-sato/tasks/task-core-x11-sato.bb
rename to meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index cf294b3..380584e 100644
--- a/meta/recipes-sato/tasks/task-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 PR = "r32"
 
 PACKAGES = "\
-    task-core-x11-sato \
-    task-core-x11-sato-dbg \
-    task-core-x11-sato-dev \
+    packagegroup-core-x11-sato \
+    packagegroup-core-x11-sato-dbg \
+    packagegroup-core-x11-sato-dev \
     "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -24,7 +24,7 @@ NETWORK_MANAGER_libc-uclibc = ""
 WEB ?= ""
 #WEB = "web-webkit"
 
-RDEPENDS_task-core-x11-sato = "\
+RDEPENDS_packagegroup-core-x11-sato = "\
     matchbox-desktop \
     matchbox-session-sato \
     matchbox-keyboard \
diff --git a/meta/recipes-sato/tasks/task-core-x11.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11.bb
similarity index 70%
rename from meta/recipes-sato/tasks/task-core-x11.bb
rename to meta/recipes-sato/packagegroups/packagegroup-core-x11.bb
index 764ea02..4c16c46 100644
--- a/meta/recipes-sato/tasks/task-core-x11.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11.bb
@@ -9,15 +9,15 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
 PR = "r36"
 
 PACKAGES = "\
-    task-core-apps-x11-core \
-    task-core-apps-x11-core-dbg \
-    task-core-apps-x11-core-dev \
-    task-core-apps-x11-games \
-    task-core-apps-x11-games-dbg \
-    task-core-apps-x11-games-dev \
-    task-core-x11-base \
-    task-core-x11-base-dbg \
-    task-core-x11-base-dev \
+    packagegroup-core-apps-x11-core \
+    packagegroup-core-apps-x11-core-dbg \
+    packagegroup-core-apps-x11-core-dev \
+    packagegroup-core-apps-x11-games \
+    packagegroup-core-apps-x11-games-dbg \
+    packagegroup-core-apps-x11-games-dev \
+    packagegroup-core-x11-base \
+    packagegroup-core-x11-base-dbg \
+    packagegroup-core-x11-base-dev \
     "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -37,7 +37,7 @@ VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
 VIRTUAL-RUNTIME_graphical_init_manager ?= "xserver-nodm-init"
 
 
-RDEPENDS_task-core-x11-base = "\
+RDEPENDS_packagegroup-core-x11-base = "\
     dbus \
     pointercal \
     matchbox-wm \
@@ -57,12 +57,12 @@ RDEPENDS_task-core-x11-base = "\
     xrandr"
 
 
-RDEPENDS_task-core-apps-x11-core = "\
+RDEPENDS_packagegroup-core-apps-x11-core = "\
     leafpad \
     ${FILEMANAGER} \
     matchbox-terminal \
     sato-screenshot"
 
 
-RDEPENDS_task-core-apps-x11-games = "\
+RDEPENDS_packagegroup-core-apps-x11-games = "\
     oh-puzzles"
diff --git a/scripts/contrib/documentation-audit.sh b/scripts/contrib/documentation-audit.sh
index 5b66f03..a2c4586 100755
--- a/scripts/contrib/documentation-audit.sh
+++ b/scripts/contrib/documentation-audit.sh
@@ -42,7 +42,7 @@ for pkg in `bitbake -s | awk '{ print \$1 }'`; do
 		# Skip native/nativesdk/cross-canadian recipes
 		continue
 	fi
-	if [[ "$pkg" =~ ^meta- || "$pkg" =~ ^task- || "$pkg" =~ -image ]]; then
+	if [[ "$pkg" =~ ^meta- || "$pkg" =~ ^packagegroup- || "$pkg" =~ -image ]]; then
 		# Skip meta, task and image recipes
 		continue
 	fi
-- 
1.7.9.5



