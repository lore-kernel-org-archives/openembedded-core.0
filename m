Return-Path: <swee.aun.khor@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 42F98774DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 07:07:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 00:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,315,1496127600"; d="scan'208";a="1148285531"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga001.jf.intel.com with ESMTP; 06 Jul 2017 00:07:17 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 16:56:36 -0700
Message-Id: <497112f6f6f805ab4dbc8ca48fbb53163f311f60.1499127835.git.swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1499127835.git.swee.aun.khor@intel.com>
References: <cover.1499127835.git.swee.aun.khor@intel.com>
Subject: [PATCH 5/7] openssl: Support musl-x32 build
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
X-List-Received-Date: Thu, 06 Jul 2017 07:07:18 -0000

From: sweeaun <swee.aun.khor@intel.com>

Support musl-x32 build which to build openssl with 32 bits.

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 3980ec2..bcbbe06 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -65,8 +65,7 @@ do_configure () {
 	os=${HOST_OS}
 	case $os in
 	linux-gnueabi |\
-	linux-gnuspe |\
-	linux-musl*)
+	linux-gnuspe)
 		os=linux
 		;;
 		*)
@@ -101,6 +100,9 @@ do_configure () {
 	linux-gnux32-x86_64)
 		target=linux-x32
 		;;
+        linux-muslx32-x86_64)
+                target=linux-x32
+                ;;
 	linux-gnu64-x86_64)
 		target=linux-x86_64
 		;;
-- 
2.7.4


