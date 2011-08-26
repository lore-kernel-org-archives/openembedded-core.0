Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qx2Kc-0006Xw-PY
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 21:44:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2011 12:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,286,1312182000"; d="scan'208";a="45450506"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.251])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2011 12:39:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 12:39:35 -0700
Message-Id: <299402832cc461f2db58481ccbb1a3a8ac92a7d0.1314387279.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/21] [YOCTO #1396] Fix adt-installer for consistent naming for powerpc and add all arch template for installation
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
X-List-Received-Date: Fri, 26 Aug 2011 19:44:47 -0000

From: Jessica Zhang <jessica.zhang@intel.com>

Signed-off-by: Jessica Zhang <jessica.zhang@intel.com>
---
 .../installer/adt-installer/adt_installer.conf     |   17 +++++++++++++++--
 .../adt-installer/scripts/adt_installer_internal   |    2 +-
 .../installer/adt-installer/scripts/data_define    |    2 +-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
index 0c93237..e31f9af 100644
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
@@ -27,7 +27,7 @@ YOCTOADT_REPO="http://adtrepo.yoctoproject.org/$YOCTOADT_VERSION"
 
 # The following are for system wide setup
 # Target architectures that you want to setup host cross dev environment for
-# valid values are: powerpc, mips, arm, x86, x86_64 with space separation between entries
+# valid values are: arm, x86, x86_64, powerpc, mips with space separation between entries
 YOCTOADT_TARGETS="arm x86"
 # Whether install qemu or not, valid entries are: Y/N
 YOCTOADT_QEMU="Y"
@@ -40,7 +40,7 @@ YOCTOADT_NFS_UTIL="Y"
 
 #The followings are for setting up specific target architecture
 #YOCTOADT_ROOTFS_$arch is for specifying what root filesystem image files you want to download from the repository. The valid values to replace $arch are: arm, x86, x86_64, powerpc, mips.  The valid image files are: minimal, minimal-dev, sato, sato-dev, sato-sdk,lsb, lsb-dev, lsb-sdk.  If you want to download multiple images, the entries are space separated
-YOCTOADT_ROOTFS_arm="minimal sato-sdk"
+YOCTOADT_ROOTFS_arm="minimal"
 #Specify which root filesystem file to use to extract as target sysroot.  Please ensure the entry is in the list of downloaded root filesystem files that specified above in YOCTOADT_ROOTFS_$arch
 YOCTOADT_TARGET_SYSROOT_IMAGE_arm="minimal"
 #The location where the target sysroot will be setup
@@ -50,3 +50,16 @@ YOCTOADT_TARGET_SYSROOT_LOC_arm="$HOME/test-yocto/arm"
 #YOCTOADT_ROOTFS_x86="sato-sdk"
 #YOCTOADT_TARGET_SYSROOT_IMAGE_x86="sato-sdk"
 #YOCTOADT_TARGET_SYSROOT_LOC_x86="$HOME/test-yocto/x86"
+
+#Here's some template of other arches, which you need to change the value in ""
+#YOCTOADT_TARGET_SYSROOT_IMAGE_x86_64=""
+#YOCTOADT_TARGET_SYSROOT_LOC_x86_64=""
+#YOCTOADT_ROOTFS_x86_64=""
+
+#YOCTOADT_TARGET_SYSROOT_IMAGE_powerpc=""
+#YOCTOADT_TARGET_SYSROOT_LOC_powerpc=""
+#YOCTOADT_ROOTFS_powerpc=""
+
+#YOCTOADT_TARGET_SYSROOT_IMAGE_mips=""
+#YOCTOADT_TARGET_SYSROOT_LOC_mips=""
+#YOCTOADT_ROOTFS_mips=""
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 870931e..c7de0e2 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -105,7 +105,7 @@ $OPKG_INSTALL_NATIVE_CMD libtool-nativesdk &>> $YOCTOADT_INSTALL_LOG_FILE
 check_result
 
 for native_target_type in $YOCTOADT_TARGETS; do
-  native_target_type=`echo "$native_target_type" | sed -e 's/x86_64/x86-64/' -e 's/ppc/powerpc/'  -e 's/x86$/i586/'`
+  native_target_type=`echo "$native_target_type" | sed -e 's/x86_64/x86-64/' -e 's/x86$/i586/'`
   echo_info "Installing cross toolchain for $native_target_type ..."
   echo_info "Installing binutils for $native_target_type ..."
   $OPKG_INSTALL_NATIVE_CMD binutils-cross-canadian-$native_target_type &>> $YOCTOADT_INSTALL_LOG_FILE
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/data_define b/meta/recipes-devtools/installer/adt-installer/scripts/data_define
index 2781e77..1de21d7 100644
--- a/meta/recipes-devtools/installer/adt-installer/scripts/data_define
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/data_define
@@ -32,7 +32,7 @@ OPKG_LIBDIR="/var/lib"
 # List all supported root fs types and target types,
 # it will be used in user configuration validity checking
 YOCTOADT_SUPPORTED_ROOTFS="minimal minimal-dev sato sato-dev sato-sdk lsb lsb-dev lsb-sdk"
-YOCTOADT_SUPPORTED_TARGETS="x86 x86_64 arm ppc mips"
+YOCTOADT_SUPPORTED_TARGETS="x86 x86_64 arm powerpc mips"
 # Different host (32 bit or 64 bit) will have different opkg
 # configuration files
 YOCTOADT_OPKG_CONF_FILE_32="./opkg/conf/opkg-sdk-i686.conf"
-- 
1.7.6



