Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMbzw-0000d0-8T
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:20:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 May 2011 01:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,230,1304319600"; 
   d="scan'208";a="3834329"
Received: from unknown (HELO localhost) ([10.255.12.160])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2011 01:17:59 -0700
Message-Id: <804a1414d232d46df6755cb576e026ef360b25c6.1305702436.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305702436.git.sgw@linux.intel.com>
References: <cover.1305702436.git.sgw@linux.intel.com>
Old-Date: Tue, 17 May 2011 14:34:39 -0700
Date: Wed, 18 May 2011  1:17:59 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
Subject: [PATCH 12/15] Couple minor fixes for the OECORE rename
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
X-List-Received-Date: Wed, 18 May 2011 08:20:53 -0000

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
index c292759..a0af672 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -327,7 +327,7 @@ DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
 PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
 
-SDK_NAME = "${DISTRO}-${SDK_ARCH}-${TARGET_ARCH}"
+SDK_NAME = "oecore-${SDK_ARCH}-${TARGET_ARCH}"
 SDKPATH = "/usr/local/${SDK_NAME}"
 SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 
-- 
1.7.3.4



