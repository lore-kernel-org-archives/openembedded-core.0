Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QtKSp-0002em-Ki
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 16:17:55 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2011 07:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,380,1309762800"; d="scan'208";a="39022066"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by azsmga001.ch.intel.com with ESMTP; 16 Aug 2011 07:13:19 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 22:13:16 +0800
Message-Id: <c49c26edb0010e9e568ab5ddcfc0d350ec1845ab.1313503778.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1313503778.git.dexuan.cui@intel.com>
References: <cover.1313503778.git.dexuan.cui@intel.com>
Subject: [PATCH 06/10] freetype: upgrade from 2.4.4 to 2.4.6
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
X-List-Received-Date: Tue, 16 Aug 2011 14:17:55 -0000

freetype-2.4.6/docs/LICENSE.TXT changed a little to describe more clearly
the compatibility about FreeTypeLicense and GPLv2+, but the actual license
remains unchanged: it's still  LICENSE = "FreeTypeLicense | GPLv2+".

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../no-hardcode.patch                              |    0
 .../{freetype_2.4.4.bb => freetype_2.4.6.bb}       |    8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype-2.4.4 => freetype-2.4.6}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.4.bb => freetype_2.4.6.bb} (82%)

diff --git a/meta/recipes-graphics/freetype/freetype-2.4.4/no-hardcode.patch b/meta/recipes-graphics/freetype/freetype-2.4.6/no-hardcode.patch
similarity index 100%
rename from meta/recipes-graphics/freetype/freetype-2.4.4/no-hardcode.patch
rename to meta/recipes-graphics/freetype/freetype-2.4.6/no-hardcode.patch
diff --git a/meta/recipes-graphics/freetype/freetype_2.4.4.bb b/meta/recipes-graphics/freetype/freetype_2.4.6.bb
similarity index 82%
rename from meta/recipes-graphics/freetype/freetype_2.4.4.bb
rename to meta/recipes-graphics/freetype/freetype_2.4.6.bb
index 661650c..8150dd4 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.4.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.6.bb
@@ -7,9 +7,9 @@ HOMEPAGE = "http://www.freetype.org/"
 BUGTRACKER = "https://savannah.nongnu.org/bugs/?group=freetype"
 
 LICENSE = "FreeTypeLicense | GPLv2+"
-LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=8bc1a580aeb518100d00a2dd29e68edf \
+LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=28d5381b1bef2649c59f20c20bae4f39 \
                     file://docs/FTL.TXT;md5=d479e83797f699fe873b38dadd0fcd4c \
-                    file://docs/GPL.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
+                    file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
 SECTION = "libs"
 
@@ -18,8 +18,8 @@ PR = "r0"
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://no-hardcode.patch"
 
-SRC_URI[md5sum] = "b3e2b6e2f1c3e0dffa1fd2a0f848b671"
-SRC_URI[sha256sum] = "4b8281c7dc4d375c6b65d3c6f4808e488a313fab47d7be82aad2c871c8480fef"
+SRC_URI[md5sum] = "5e6510613f612809d2d7862592b92ab7"
+SRC_URI[sha256sum] = "24a4a57f3a6859887e91f90f93f754cfc7bf9ab9246a3a696435a0c6a7a1e92a"
 
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.6



