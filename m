Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1UA6W3-00024Q-89
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Feb 2013 23:27:25 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2013 14:08:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,736,1355126400"; d="scan'208";a="267466841"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.69])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2013 14:09:44 -0800
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2013 14:20:52 -0800
Message-Id: <0b87a2c84550fae81c5a179dd96ad099469a49f3.1361830589.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1361830589.git.jessica.zhang@intel.com>
References: <cover.1361830589.git.jessica.zhang@intel.com>
In-Reply-To: <cover.1361830589.git.jessica.zhang@intel.com>
References: <cover.1361830589.git.jessica.zhang@intel.com>
Subject: [PATCH 1/1] Add kernel arch variable in SDK environment variable list for supporting build external kernel module using SDK
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
X-List-Received-Date: Mon, 25 Feb 2013 22:27:27 -0000
X-List-Received-Date: Mon, 25 Feb 2013 22:27:27 -0000

Signed-off-by: Jessica Zhang <jessica.zhang@intel.com>
---
 meta/classes/toolchain-scripts.bbclass |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index d336397..050e799 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -1,4 +1,4 @@
-inherit siteinfo
+inherit siteinfo kernel-arch
 
 # We want to be able to change the value of MULTIMACH_TARGET_SYS, because it
 # doesn't always match our expectations... but we default to the stock value
@@ -46,6 +46,7 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 	echo 'export PYTHONHOME=${SDKPATHNATIVE}${prefix_nativesdk}' >> $script
+	echo 'export ARCH=${ARCH}' >> $script
 }
 
 # This function creates an environment-setup-script in the TMPDIR which enables
@@ -90,6 +91,7 @@ toolchain_create_tree_env_script () {
 	echo 'export OECORE_ACLOCAL_OPTS="-I ${STAGING_DIR_NATIVE}/usr/share/aclocal"' >> $script
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
+	echo 'export ARCH=${ARCH}' >> $script
 }
 
 # This function creates an environment-setup-script for use by the ADT installer
@@ -134,6 +136,7 @@ toolchain_create_sdk_env_script_for_installer () {
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 	echo 'export PYTHONHOME=${SDKPATHNATIVE}${prefix_nativesdk}' >> $script
+	echo 'export ARCH=${ARCH}' >> $script
 }
 
 #we get the cached site config in the runtime
-- 
1.7.9.5



