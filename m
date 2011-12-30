Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RgXrN-0006zj-0W
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 09:30:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Dec 2011 00:22:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101588789"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2011 00:22:20 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 16:11:20 +0800
Message-Id: <baf263c8f7b7f6acf7c0f004f7a103d21a138fa9.1325232608.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1325232608.git.edwin.zhai@intel.com>
References: <cover.1325232608.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1325232608.git.edwin.zhai@intel.com>
References: <cover.1325232608.git.edwin.zhai@intel.com>
Subject: [PATCH 2/3] apr-util: Upgrade to 1.4.1
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
X-List-Received-Date: Fri, 30 Dec 2011 08:30:41 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../apr/apr-util/configure_fixes.patch             |   10 ++++++----
 .../apr/{apr-util_1.3.12.bb => apr-util_1.4.1.bb}  |    6 +++---
 2 files changed, 9 insertions(+), 7 deletions(-)
 rename meta/recipes-support/apr/{apr-util_1.3.12.bb => apr-util_1.4.1.bb} (91%)

diff --git a/meta/recipes-support/apr/apr-util/configure_fixes.patch b/meta/recipes-support/apr/apr-util/configure_fixes.patch
index 1925236..91e244c 100644
--- a/meta/recipes-support/apr/apr-util/configure_fixes.patch
+++ b/meta/recipes-support/apr/apr-util/configure_fixes.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Inappropriate [configuration]
 
-Index: apr-util-1.3.4/configure.in
+Index: apr-util-1.4.1/configure.in
 ===================================================================
---- apr-util-1.3.4.orig/configure.in
-+++ apr-util-1.3.4/configure.in
-@@ -8,14 +8,14 @@ AC_INIT(export_vars.sh.in)
+--- apr-util-1.4.1.orig/configure.in	2009-12-18 03:15:19.000000000 +0800
++++ apr-util-1.4.1/configure.in	2011-12-30 13:32:07.000000000 +0800
+@@ -8,15 +8,15 @@
  AC_CONFIG_HEADER(include/private/apu_config.h)
  AC_CONFIG_AUX_DIR(build)
  
@@ -13,6 +13,7 @@ Index: apr-util-1.3.4/configure.in
 -sinclude(build/apu-hints.m4)
 -sinclude(build/apr_common.m4)
 -sinclude(build/find_apr.m4)
+-sinclude(build/crypto.m4)
 -sinclude(build/dbm.m4)
 -sinclude(build/dbd.m4)
 -sinclude(build/dso.m4)
@@ -21,6 +22,7 @@ Index: apr-util-1.3.4/configure.in
 +#sinclude(build/apu-hints.m4)
 +#sinclude(build/apr_common.m4)
 +#sinclude(build/find_apr.m4)
++#sinclude(build/crypto.m4)
 +#sinclude(build/dbm.m4)
 +#sinclude(build/dbd.m4)
 +#sinclude(build/dso.m4)
diff --git a/meta/recipes-support/apr/apr-util_1.3.12.bb b/meta/recipes-support/apr/apr-util_1.4.1.bb
similarity index 91%
rename from meta/recipes-support/apr/apr-util_1.3.12.bb
rename to meta/recipes-support/apr/apr-util_1.4.1.bb
index 676b1b4..d0e19b0 100644
--- a/meta/recipes-support/apr/apr-util_1.3.12.bb
+++ b/meta/recipes-support/apr/apr-util_1.4.1.bb
@@ -9,14 +9,14 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=519e0a18e03f7c023070568c14b077bb \
                     file://include/apu_version.h;endline=17;md5=806685a84e71f10c80144c48eb35df42"
 
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
            file://configure_fixes.patch"
 
-SRC_URI[md5sum] = "d1977289889592ef998e3f777f68efe4"
-SRC_URI[sha256sum] = "815b6fc82950f61050a5e711a7f3c20fd9b6ffcc7a4cacfe9f291fb241210cd8"
+SRC_URI[md5sum] = "666a5d56098a9debf998510e304c8095"
+SRC_URI[sha256sum] = "d636d9ef95c6e50e47fc338d532aa375edd11e5d7a3c30dee48beb38ddf4ab4c"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ 
 		--without-odbc \
-- 
1.7.1



