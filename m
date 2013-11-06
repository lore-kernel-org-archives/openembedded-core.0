Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C6B496D437
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 22:02:19 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 06 Nov 2013 14:02:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="317929570"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.249])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Nov 2013 14:02:20 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2013 14:02:18 -0800
Message-Id: <1383775339-4220-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1383775339-4220-1-git-send-email-sgw@linux.intel.com>
References: <1383775339-4220-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/3] nspr: Update to 4.10.1
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
X-List-Received-Date: Wed, 06 Nov 2013 22:02:20 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/nspr/{nspr_4.10.bb => nspr_4.10.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nspr/{nspr_4.10.bb => nspr_4.10.1.bb} (96%)

diff --git a/meta/recipes-support/nspr/nspr_4.10.bb b/meta/recipes-support/nspr/nspr_4.10.1.bb
similarity index 96%
rename from meta/recipes-support/nspr/nspr_4.10.bb
rename to meta/recipes-support/nspr/nspr_4.10.1.bb
index 4247fd0..017bb8a 100644
--- a/meta/recipes-support/nspr/nspr_4.10.bb
+++ b/meta/recipes-support/nspr/nspr_4.10.1.bb
@@ -13,8 +13,8 @@ SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-$
 
 SRC_URI += "file://nspr.pc.in"
 
-SRC_URI[md5sum] = "f5466def95726b3c900d8a0227bdd034"
-SRC_URI[sha256sum] = "0cfbe561676b92e5af3ddc7ac77452014e3da8885da66baec811e7354138cc16"
+SRC_URI[md5sum] = "2e354084ca2bc5fbbb820762597f3890"
+SRC_URI[sha256sum] = "0c2f8dc265f1e9b2600fd519430a1f960799888857bbb1538343a1b16ba41b20"
 
 S = "${WORKDIR}/nspr-${PV}/nspr"
 
-- 
1.8.3.1


