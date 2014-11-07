Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 820B265DEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2014 16:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989805"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:39 -0800
Message-Id: <2cf5514ae7132ae978dc1a318ed872f3257a6807.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 14/19] help2man: Upgrade to 1.46.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Nov 2014 00:19:56 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../help2man/{help2man-native_1.46.1.bb => help2man-native_1.46.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/help2man/{help2man-native_1.46.1.bb => help2man-native_1.46.4.bb} (79%)

diff --git a/meta/recipes-devtools/help2man/help2man-native_1.46.1.bb b/meta/recipes-devtools/help2man/help2man-native_1.46.4.bb
similarity index 79%
rename from meta/recipes-devtools/help2man/help2man-native_1.46.1.bb
rename to meta/recipes-devtools/help2man/help2man-native_1.46.4.bb
index a51c81f..5b90da9 100644
--- a/meta/recipes-devtools/help2man/help2man-native_1.46.1.bb
+++ b/meta/recipes-devtools/help2man/help2man-native_1.46.4.bb
@@ -6,8 +6,8 @@ DEPENDS = "autoconf-native automake-native"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "63b8f14a81ce28ba119d588d00c63f43"
-SRC_URI[sha256sum] = "3dfd02a026149aad06887c1cb6062471779c100e00aecb79b8f9d01cf1581c47"
+SRC_URI[md5sum] = "a1b7fe49eddae8a2537ed74ee9ef11cb"
+SRC_URI[sha256sum] = "1ae7f15f53b0cc55b070ae49df2ee5caa942c71529054e157599427bba3c5633"
 
 inherit autotools native
 
-- 
1.8.3.1


