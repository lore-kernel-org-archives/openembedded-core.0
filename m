Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2A06B368
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 22:44:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Aug 2013 15:44:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,930,1367996400"; d="scan'208";a="366486159"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.105])
	by orsmga001.jf.intel.com with ESMTP; 21 Aug 2013 15:44:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 15:44:16 -0700
Message-Id: <1377125056-26393-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] gnupg: Update to 2.0.21
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
X-List-Received-Date: Wed, 21 Aug 2013 22:44:17 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/gnupg/{gnupg_2.0.20.bb => gnupg_2.0.21.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.0.20.bb => gnupg_2.0.21.bb} (85%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.0.20.bb b/meta/recipes-support/gnupg/gnupg_2.0.21.bb
similarity index 85%
rename from meta/recipes-support/gnupg/gnupg_2.0.20.bb
rename to meta/recipes-support/gnupg/gnupg_2.0.21.bb
index 87acd00..aed0591 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.20.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.21.bb
@@ -12,8 +12,8 @@ inherit autotools gettext
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "9d18ee71bb0b10d40d1c8a393bdd7a89"
-SRC_URI[sha256sum] = "6e949b7f062cab8a3cf0910f91ecf04cabaad458c0aeeec66298651b8b04b79a"
+SRC_URI[md5sum] = "48c05f5dfe97cf21ae0ced811aaad750"
+SRC_URI[sha256sum] = "00df8902c7cef4d2440d36ca2a45985853eb36c34a4163bc995c3578030eeef5"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
1.8.3.1


