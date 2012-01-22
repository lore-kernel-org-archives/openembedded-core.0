Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp1fQ-0001bJ-UN
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 18:57:25 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jan 2012 09:49:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="114993738"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2012 09:49:40 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:06 +0800
Message-Id: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 01/18] util-macros: upgrade to 1.16.1
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
X-List-Received-Date: Sun, 22 Jan 2012 17:57:25 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 ...util-macros_1.16.0.bb => util-macros_1.16.1.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.16.0.bb => util-macros_1.16.1.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.16.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.16.1.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-util/util-macros_1.16.0.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.16.1.bb
index da9c31d..e0af8a9 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.16.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.16.1.bb
@@ -16,5 +16,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "3f77f0b6452c677d4b5ce9feaea7d15e"
-SRC_URI[sha256sum] = "1387cec5c2e655811e9a60afee7bda1652f8cd97be6c89418566bcf934ff6935"
+SRC_URI[md5sum] = "01a4d42cfa952488d7bd391099a92bb0"
+SRC_URI[sha256sum] = "06494a0afb53881041ae4171d8ddb8433fa0bde7bd4e0ecc2aeaf536a02da183"
-- 
1.7.6



