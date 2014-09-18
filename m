Return-Path: <>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DFEDB70A8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 21:34:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 18 Sep 2014 14:34:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="388293971"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.153])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Sep 2014 14:29:10 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Sep 2014 16:34:23 -0500
Message-Id: <1411076063-6383-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] ltp: Added zip-native as a DEPENDS
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
X-List-Received-Date: Thu, 18 Sep 2014 21:34:51 -0000

From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>

The Makefile checks for zip during installation

[YOCTO #6699]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-extended/ltp/ltp_20140422.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20140422.bb b/meta/recipes-extended/ltp/ltp_20140422.bb
index c658bc0..f2c0fd8 100644
--- a/meta/recipes-extended/ltp/ltp_20140422.bb
+++ b/meta/recipes-extended/ltp/ltp_20140422.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "\
     file://utils/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
 "
 
-DEPENDS = "attr libaio libcap acl openssl"
+DEPENDS = "attr libaio libcap acl openssl zip-native"
 SRCREV = "f4c3bfe1eab51eb72caeb0f3336d2790c9a8bd1b"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
-- 
1.9.1


