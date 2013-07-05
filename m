Return-Path: <ionutx.radu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3F56AE2A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:08:14 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jul 2013 00:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1000,1363158000"; d="scan'208";a="327059386"
Received: from work.rb.intel.com ([10.237.105.51])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2013 00:08:14 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 10:10:18 +0300
Message-Id: <afc92666ddeb5ba774f8d2c97bdb7f80bb107c53.1372952884.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
In-Reply-To: <cover.1372952884.git.ionutx.radu@intel.com>
References: <cover.1372952884.git.ionutx.radu@intel.com>
Subject: [PATCH 01/10] libassuan: Updated from 2.1.0 to 2.1.1
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
X-List-Received-Date: Fri, 05 Jul 2013 07:08:14 -0000

Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
---
 .../libassuan/{libassuan_2.1.0.bb => libassuan_2.1.1.bb}           |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libassuan/{libassuan_2.1.0.bb => libassuan_2.1.1.bb} (83%)

diff --git a/meta/recipes-support/libassuan/libassuan_2.1.0.bb b/meta/recipes-support/libassuan/libassuan_2.1.1.bb
similarity index 83%
rename from meta/recipes-support/libassuan/libassuan_2.1.0.bb
rename to meta/recipes-support/libassuan/libassuan_2.1.1.bb
index 0483560..91784ea 100644
--- a/meta/recipes-support/libassuan/libassuan_2.1.0.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.1.1.bb
@@ -13,7 +13,7 @@ DEPENDS = "libgpg-error"
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${PV}.tar.bz2 \
 	   file://libassuan-add-pkgconfig-support.patch"
 
-SRC_URI[md5sum] = "b3231eec8e567f4f9294474a387378f5"
-SRC_URI[sha256sum] = "a4c5bd3a0c2726e8bcc2ea8a3b15f7aae3bd92d4f85968f315fd3a75d101c267"
+SRC_URI[md5sum] = "757243cc4a71b30ed8d8dbe784035d36"
+SRC_URI[sha256sum] = "23e2d67779b88e90d29fe1df6b157109f1c2a647d0f1b2a0f4295bb3c0b2039d"
 
 inherit autotools binconfig pkgconfig
-- 
1.7.10.4


