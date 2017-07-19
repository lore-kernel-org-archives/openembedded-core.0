Return-Path: <swee.aun.khor@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AD0B678265
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 03:40:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 20:40:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,382,1496127600"; d="scan'208";a="113344706"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga002.jf.intel.com with ESMTP; 19 Jul 2017 20:40:08 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 13:29:41 -0700
Message-Id: <82e8a77a71e50e2cc00318226a42ced7d6a0909c.1500495522.git.swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1500495522.git.swee.aun.khor@intel.com>
References: <cover.1500495522.git.swee.aun.khor@intel.com>
Subject: [PATCH 1/2] openssl: Support musl-x32 build
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
X-List-Received-Date: Thu, 20 Jul 2017 03:40:07 -0000

From: sweeaun <swee.aun.khor@intel.com>

Support musl-x32 build which to build openssl with 32 bits.

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index ce295e8..a56bd6e 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -66,7 +66,8 @@ do_configure () {
 	case $os in
 	linux-gnueabi |\
 	linux-gnuspe |\
-	linux-musl*)
+	linux-musleabi |\
+	linux-muslspe)
 		os=linux
 		;;
 		*)
@@ -98,7 +99,7 @@ do_configure () {
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


