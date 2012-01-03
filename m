Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrX-0004iK-14
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:45 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752301"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:15 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:24 -0800
Message-Id: <4227a4fd63d784e6db0d158262a66125ce482904.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 098/113] util-macros: upgrade from 1.15.0 to the latest 1.16.0
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
X-List-Received-Date: Tue, 03 Jan 2012 06:29:36 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 ...util-macros_1.15.0.bb => util-macros_1.16.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.15.0.bb => util-macros_1.16.0.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb b/meta/recipes-graphics/xorg-util/util-macros_1.16.0.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.16.0.bb
index d2b04bf..da9c31d 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.15.0.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.16.0.bb
@@ -16,5 +16,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "c7f0c94126443f6744328a92d2b94cff"
-SRC_URI[sha256sum] = "db05c59c0e7843c398ed2847ba4b5bf54292499e5fcadbb7c38a445bf4347ab8"
+SRC_URI[md5sum] = "3f77f0b6452c677d4b5ce9feaea7d15e"
+SRC_URI[sha256sum] = "1387cec5c2e655811e9a60afee7bda1652f8cd97be6c89418566bcf934ff6935"
-- 
1.7.6.4



