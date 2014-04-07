Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7829D6F92A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Apr 2014 22:05:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Apr 2014 15:05:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,813,1389772800"; d="scan'208";a="516168194"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.20])
	by fmsmga002.fm.intel.com with ESMTP; 07 Apr 2014 15:05:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Apr 2014 15:05:01 -0700
Message-Id: <1396908301-27124-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] openssl: Address CVE-2014-0160
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
X-List-Received-Date: Mon, 07 Apr 2014 22:05:41 -0000

This was the suggested fix for those unable to update to the new 1.0.1g version.
Since we are so close to our release, we should hold of on the update until 1.7

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.1e.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index 618ba68..874aa21 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -4,7 +4,7 @@ require openssl.inc
 # if they are available.
 DEPENDS += "cryptodev-linux"
 
-CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
+CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS -DOPENSSL_NO_HEARTBEATS"
 
 PR = "${INC_PR}.0"
 
-- 
1.8.3.1


