Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RJd77-00066Y-Ee
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 05:28:13 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Oct 2011 20:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="68780473"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 27 Oct 2011 20:22:11 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 11:35:42 +0800
Message-Id: <0dbdd84e4f7fdad538888b5909b61b73ea85d481.1319772853.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
Subject: [PATCH 03/11] neon: upgrade to version 0.29.6
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
X-List-Received-Date: Fri, 28 Oct 2011 03:28:13 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../{neon-0.29.5 => neon-0.29.6}/pkgconfig.patch   |    0
 .../neon/{neon_0.29.5.bb => neon_0.29.6.bb}        |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/neon/{neon-0.29.5 => neon-0.29.6}/pkgconfig.patch (100%)
 rename meta/recipes-support/neon/{neon_0.29.5.bb => neon_0.29.6.bb} (82%)

diff --git a/meta/recipes-support/neon/neon-0.29.5/pkgconfig.patch b/meta/recipes-support/neon/neon-0.29.6/pkgconfig.patch
similarity index 100%
rename from meta/recipes-support/neon/neon-0.29.5/pkgconfig.patch
rename to meta/recipes-support/neon/neon-0.29.6/pkgconfig.patch
diff --git a/meta/recipes-support/neon/neon_0.29.5.bb b/meta/recipes-support/neon/neon_0.29.6.bb
similarity index 82%
rename from meta/recipes-support/neon/neon_0.29.5.bb
rename to meta/recipes-support/neon/neon_0.29.6.bb
index 34c7253..e739f31 100644
--- a/meta/recipes-support/neon/neon_0.29.5.bb
+++ b/meta/recipes-support/neon/neon_0.29.6.bb
@@ -7,15 +7,15 @@ LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a
 DEPENDS = "zlib libxml2 expat time gnutls libproxy"
 DEPENDS_virtclass-native = "zlib-native libxml2-native expat-native gnutls-native"
 
-PR = "r1"
+PR = "r0"
 
 BBCLASSEXTEND = "native"
 
 SRC_URI = "http://www.webdav.org/${BPN}/${BPN}-${PV}.tar.gz \
            file://pkgconfig.patch"
 
-SRC_URI[md5sum] = "ff369e69ef0f0143beb5626164e87ae2"
-SRC_URI[sha256sum] = "dea3c52b9f3f915651c6279c76758acf7c427727e8b9b0130f8b138f24012290"
+SRC_URI[md5sum] = "591e0c82e6979e7e615211b386b8f6bc"
+SRC_URI[sha256sum] = "9c640b728d6dc80ef1e48f83181166ab6bc95309cece5537e01ffdd01b96eb43"
 
 inherit autotools binconfig lib_package pkgconfig
 
-- 
1.7.1



