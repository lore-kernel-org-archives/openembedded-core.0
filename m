Return-Path: <swee.aun.khor@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 71324606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Aug 2017 06:06:24 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Aug 2017 23:06:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,314,1498546800"; d="scan'208";a="132896514"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga005.jf.intel.com with ESMTP; 02 Aug 2017 23:06:25 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Aug 2017 15:56:07 -0700
Message-Id: <1501714567-187128-1-git-send-email-swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] openssl: Support musl-x32 build
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
X-List-Received-Date: Thu, 03 Aug 2017 06:06:24 -0000

From: sweeaun <swee.aun.khor@intel.com>

Support musl-x32 build which to build openssl with 32 bits.

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index ce295e8..0d6442e 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -66,7 +66,9 @@ do_configure () {
 	case $os in
 	linux-gnueabi |\
 	linux-gnuspe |\
-	linux-musl*)
+	linux-musleabi |\
+	linux-muslspe |\
+	linux-musl )
 		os=linux
 		;;
 		*)
@@ -98,7 +100,7 @@ do_configure () {
 	linux-i686)
 		target=debian-i386-i686/cmov
 		;;
-	linux-gnux32-x86_64)
+	linux-gnux32-x86_64 | linux-muslx32-x86_64 )
 		target=linux-x32
 		;;
 	linux-gnu64-x86_64)
-- 
2.7.4


