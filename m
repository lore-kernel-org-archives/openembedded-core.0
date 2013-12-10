Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8721661227
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 19:16:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Dec 2013 11:16:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,866,1378882800"; d="scan'208";a="450036639"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.207])
	by orsmga002.jf.intel.com with ESMTP; 10 Dec 2013 11:16:11 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2013 11:16:08 -0800
Message-Id: <402d75247500f01e27908b0a7e573e5d402f25ef.1386650569.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1386650569.git.sgw@linux.intel.com>
References: <cover.1386650569.git.sgw@linux.intel.com>
In-Reply-To: <cover.1386650569.git.sgw@linux.intel.com>
References: <cover.1386650569.git.sgw@linux.intel.com>
Subject: [PATCH 3/3] cracklib: upgrade to 2.9.1
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
X-List-Received-Date: Tue, 10 Dec 2013 19:16:12 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../cracklib/{cracklib_2.9.0.bb => cracklib_2.9.1.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/cracklib/{cracklib_2.9.0.bb => cracklib_2.9.1.bb} (84%)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.0.bb b/meta/recipes-extended/cracklib/cracklib_2.9.1.bb
similarity index 84%
rename from meta/recipes-extended/cracklib/cracklib_2.9.0.bb
rename to meta/recipes-extended/cracklib/cracklib_2.9.1.bb
index bbf88bb..5e6156f 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.0.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
            file://0001-packlib.c-support-dictionary-byte-order-dependent.patch \
            file://0002-craklib-fix-testnum-and-teststr-failed.patch"
 
-SRC_URI[md5sum] = "e0f94ac2138fd33c7e77b19c1e9a9390"
-SRC_URI[sha256sum] = "17fecdfa78c0b9b47afa1533ea99b5351c3cef770bbd9c8c34391827efecbdc0"
+SRC_URI[md5sum] = "90536219c520add2ceb3c26f0d7da404"
+SRC_URI[sha256sum] = "408905c2539a97dc8cbbb6d7cd2046cb5647a345b4bda399220d9471be16d156"
 
 inherit autotools gettext
 
-- 
1.8.3.1


