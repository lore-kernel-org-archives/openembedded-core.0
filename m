Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UAN9v-0004Fz-Cl
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 17:13:54 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Feb 2013 07:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,742,1355126400"; d="scan'208";a="206474613"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Feb 2013 07:57:17 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2013 17:57:42 +0200
Message-Id: <1361894262-16750-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] iproute2: upgraded to 3.8.0
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
X-List-Received-Date: Tue, 26 Feb 2013 16:13:55 -0000

- cross-compiling patch adapted to new source code

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../recipes-connectivity/iproute2/iproute2/configure-cross.patch |    6 +++---
 .../iproute2/{iproute2_3.7.0.bb => iproute2_3.8.0.bb}            |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.7.0.bb => iproute2_3.8.0.bb} (64%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
index 10606f3..866609c 100644
--- a/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
+++ b/meta/recipes-connectivity/iproute2/iproute2/configure-cross.patch
@@ -18,9 +18,9 @@ Index: iproute2-3.7.0/configure
  #
  INCLUDE=${1:-"$PWD/include"}
 +SYSROOT=$1
- : ${PKG_CONFIG:=pkg-config}
- : ${CC=gcc}
- echo "PKG_CONFIG:=${PKG_CONFIG}" >>Config
+ 
+ # Make a temp directory in build tree.
+ TMPDIR=$(mktemp -d config.XXXXXX)
 @@ -158,7 +159,7 @@ check_ipt_lib_dir()
  		return
  	fi
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.7.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
similarity index 64%
rename from meta/recipes-connectivity/iproute2/iproute2_3.7.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
index 1863acb..70dcd2d 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.7.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.8.0.bb
@@ -5,8 +5,8 @@ PR = "r0"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
            file://configure-cross.patch"
 
-SRC_URI[md5sum] = "b07241b267036de9a79ca5b69acf8593"
-SRC_URI[sha256sum] = "6b0e76d7adb8b9b65f70571f75d72db7c2548eff7813cace9e267065c3c0cb34"
+SRC_URI[md5sum] = "951622fd770428116dc165acba375414"
+SRC_URI[sha256sum] = "579145749f1aaf60e7c7a5de24b7f00fa2200a961094733c792b4ff139181e4f"
 
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
-- 
1.7.10.4



