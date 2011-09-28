Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1R90hT-0005N1-AK
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 22:25:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Sep 2011 13:20:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="56889888"
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.178])
	by orsmga001.jf.intel.com with ESMTP; 28 Sep 2011 13:20:23 -0700
From: Jessica Zhang <jessica.zhang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 13:38:06 -0700
Message-Id: <dfbb24b81f85b55710410ed93f26aa1e0fc38ecb.1317242070.git.jessica.zhang@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1317242070.git.jessica.zhang@intel.com>
References: <cover.1317242070.git.jessica.zhang@intel.com>
In-Reply-To: <cover.1317242070.git.jessica.zhang@intel.com>
References: <cover.1317242070.git.jessica.zhang@intel.com>
Subject: [PATCH 1/1] Fixed a typo for setting up OECORE_ACLOCAL_OPTS for adt-installer case
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
X-List-Received-Date: Wed, 28 Sep 2011 20:25:51 -0000

Signed-off-by: Jessica Zhang <jessica.zhang@intel.com>
---
 meta/classes/toolchain-scripts.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 4a28e5f..875efed 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -96,7 +96,7 @@ toolchain_create_sdk_env_script_for_installer () {
 	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export OECORE_TARGET_SYSROOT="##SDKTARGETSYSROOT##"' >> $script
-        echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/acloal"' >> $script
+        echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
 	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
 }
-- 
1.7.0.4



