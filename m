Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1QMRmj-0005RX-VG
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 23:26:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 May 2011 14:22:34 -0700
X-ExtLoop1: 1
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.78])
	by orsmga002.jf.intel.com with ESMTP; 17 May 2011 14:22:34 -0700
Message-Id: <adce30a9a79ec4539e05c86dcfe14aee6362eef8.1305668298.git.jessica.zhang@intel.com>
In-Reply-To: <cover.1305668298.git.jessica.zhang@intel.com>
References: <cover.1305668298.git.jessica.zhang@intel.com>
Old-Date: Tue, 17 May 2011 14:34:39 -0700
Date: Tue, 17 May 2011 14:41:35 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Jessica Zhang <jessica.zhang@intel.com>
Subject: [PATCH 1/1] Couple minor fixes for the OECORE rename
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
X-List-Received-Date: Tue, 17 May 2011 21:26:34 -0000

From: Jessica Zhang <jessica.zhang@intel.com>

Signed-off-by: Jessica Zhang <jessica.zhang@intel.com>
---
 meta/classes/toolchain-scripts.bbclass |    6 +++---
 meta/conf/bitbake.conf                 |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index aa34b98..09ecd7c 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -27,7 +27,7 @@ toolchain_create_sdk_env_script () {
 	echo 'export LDFLAGS="--sysroot=${SDKTARGETSYSROOT}"' >> $script
 	echo 'export CPPFLAGS="--sysroot=${SDKTARGETSYSROOT}"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
-	echo 'export POKY_TARGET_SYSROOT="${SDKTARGETSYSROOT}"' >> $script
+	echo 'export OECORE_TARGET_SYSROOT="${SDKTARGETSYSROOT}"' >> $script
 	echo 'export POKY_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 }
 
@@ -58,7 +58,7 @@ toolchain_create_tree_env_script () {
 	echo 'export CFLAGS="${TARGET_CC_ARCH}"' >> $script
 	echo 'export CXXFLAGS="${TARGET_CC_ARCH}"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
-	echo 'export POKY_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
+	echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
 }
 
 # This function creates an environment-setup-script for use by the ADT installer
@@ -88,7 +88,7 @@ toolchain_create_sdk_env_script_for_installer () {
 	echo 'export LDFLAGS="--sysroot=##SDKTARGETSYSROOT##"' >> $script
 	echo 'export CPPFLAGS="--sysroot=##SDKTARGETSYSROOT##"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
-	echo 'export POKY_TARGET_SYSROOT="##SDKTARGETSYSROOT##"' >> $script
+	echo 'export OECORE_TARGET_SYSROOT="##SDKTARGETSYSROOT##"' >> $script
 	echo 'export POKY_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export POKY_SDK_VERSION="${SDK_VERSION}"' >> $script
 }
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8b6236e..484fc5e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -327,7 +327,7 @@ DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
 PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
 
-SDK_NAME = "${DISTRO}-${SDK_ARCH}-${TARGET_ARCH}"
+SDK_NAME = "oecore-${SDK_ARCH}-${TARGET_ARCH}"
 SDKPATH = "/usr/local/${SDK_NAME}"
 SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 
-- 
1.7.0.4



