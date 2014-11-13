Return-Path: <changhyeok.bae@lge.com>
X-Greylist: delayed 899 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 13 Nov 2014 01:37:14 UTC
Received: from lgeamrelo04.lge.com (lgeamrelo04.lge.com [156.147.1.127])
	by mail.openembedded.org (Postfix) with ESMTP id DC2AF65C91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 01:37:13 +0000 (UTC)
Received: from unknown (HELO changhyeok.bae) (10.177.232.153)
	by 156.147.1.127 with ESMTP; 13 Nov 2014 10:22:14 +0900
X-Original-SENDERIP: 10.177.232.153
X-Original-MAILFROM: changhyeok.bae@lge.com
From: Changhyeok Bae <changhyeok.bae@lge.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Nov 2014 10:22:19 +0900
Message-Id: <1415841739-27897-1-git-send-email-changhyeok.bae@lge.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] ethtool: Upgrade to 3.16
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
X-List-Received-Date: Thu, 13 Nov 2014 01:37:15 -0000

---
 .../ethtool/{ethtool_3.15.bb => ethtool_3.16.bb}   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_3.15.bb => ethtool_3.16.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool_3.15.bb b/meta/recipes-extended/ethtool/ethtool_3.16.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_3.15.bb
rename to meta/recipes-extended/ethtool/ethtool_3.16.bb
index 8cd10df..92a0704 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.15.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.16.bb
@@ -12,8 +12,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://ethtool-uint.patch \
            "
 
-SRC_URI[md5sum] = "7e94dd958bcd639aad2e5a752e108b24"
-SRC_URI[sha256sum] = "562e3cc675cf5b1ac655cd060f032943a2502d4d59e5f278f02aae92562ba261"
+SRC_URI[md5sum] = "3806bae34c153e2b9e2859e85c54788d"
+SRC_URI[sha256sum] = "a6f1433824af7b390ed4e66dfc7cee047d6d1f56dbb8ceef9fe905d63aef5275"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
1.7.9.5


