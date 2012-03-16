Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8Laj-0003EY-0D
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 02:04:25 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:55:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121482130"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:55:36 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:53 +0800
Message-Id: <2a2db3ba34276f451eb429c976a68897fb25565e.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 56/60] font-util: upgrade to 1.3.0
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
X-List-Received-Date: Fri, 16 Mar 2012 01:04:25 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{font-util_1.2.0.bb => font-util_1.3.0.bb}     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-font/{font-util_1.2.0.bb => font-util_1.3.0.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.2.0.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-font/font-util_1.2.0.bb
rename to meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
index 2c5ba41..180c7dd 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.2.0.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
@@ -14,7 +14,7 @@ DEPENDS_virtclass-native = "util-macros-native"
 RDEPENDS_${PN} = "mkfontdir mkfontscale encodings"
 RDEPENDS_${PN}_virtclass-native = "mkfontdir-native mkfontscale-native"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.0"
 
 do_configure_prepend() {
         sed -i "s#MAPFILES_PATH=\`pkg-config#MAPFILES_PATH=\`PKG_CONFIG_PATH=\"${STAGING_LIBDIR_NATIVE}/pkg-config\" pkg-config#g" fontutil.m4.in
@@ -22,5 +22,5 @@ do_configure_prepend() {
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "1bdd8ed070e02b2165d7b0f0ed93280b"
-SRC_URI[sha256sum] = "dbbac617ae6cdf6f459e602361211d217f4bad5ad8bfb6adcede6196693f9712"
+SRC_URI[md5sum] = "ddfc8a89d597651408369d940d03d06b"
+SRC_URI[sha256sum] = "dfa9e55625a4e0250f32fabab1fd5c8ffcd2d1ff2720d6fcf0f74bc8a5929195"
-- 
1.7.6



