Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D4ED96DC3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 15:22:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jan 2014 07:22:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,653,1384329600"; d="scan'208";a="465875312"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.149])
	by orsmga002.jf.intel.com with ESMTP; 13 Jan 2014 07:22:15 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2014 15:22:08 +0000
Message-Id: <8b6a24203f64a78bd6c2f37a34e67f3ea4172570.1389626446.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389626446.git.paul.eggleton@linux.intel.com>
References: <cover.1389626446.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1389626446.git.paul.eggleton@linux.intel.com>
References: <cover.1389626446.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] cdrtools-native: upgrade to 3.01a20
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
X-List-Received-Date: Mon, 13 Jan 2014 15:22:41 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../{cdrtools-native_3.01a17.bb => cdrtools-native_3.01a20.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cdrtools/{cdrtools-native_3.01a17.bb => cdrtools-native_3.01a20.bb} (81%)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a20.bb
similarity index 81%
rename from meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
rename to meta/recipes-devtools/cdrtools/cdrtools-native_3.01a20.bb
index 71b86aa..01f9e6e 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a20.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
 
 SRC_URI = "ftp://ftp.berlios.de/pub/cdrecord/alpha/cdrtools-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "4cef9db0cf15a770c52d65b00bbee2db"
-SRC_URI[sha256sum] = "3d613965b213ad83e4be0ba2535e784901839ea4d11a20a2beb6765f0eb76dfa"
+SRC_URI[md5sum] = "f8c6f0fdcba7df0606095498d10315a7"
+SRC_URI[sha256sum] = "e399ea964b8048793721b71461271e46d81f242bd2feefb8dbd259c30e75a5a9"
 
 S = "${WORKDIR}/cdrtools-3.01"
 
-- 
1.8.1.2


