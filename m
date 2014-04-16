Return-Path: <changhyeok.bae@lge.com>
Received: from lgemrelse6q.lge.com (LGEMRELSE6Q.lge.com [156.147.1.121])
	by mail.openembedded.org (Postfix) with ESMTP id 1DEE365D23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Apr 2014 01:42:31 +0000 (UTC)
Received: from unknown (HELO changhyeok.bae) (10.177.232.191)
	by 156.147.1.121 with ESMTP; 16 Apr 2014 10:42:31 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: Changhyeok Bae <changhyeok.bae@lge.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Apr 2014 10:42:21 +0900
Message-Id: <1397612541-8373-1-git-send-email-changhyeok.bae@lge.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] libunwind: Add mirror site
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
X-List-Received-Date: Wed, 16 Apr 2014 01:42:36 -0000

The SRC_URI is not accessible.
So need to add mirror site referred by the original site.

Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
---
 meta-oe/recipes-support/libunwind/libunwind.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libunwind/libunwind.inc b/meta-oe/recipes-support/libunwind/libunwind.inc
index a5b7482..a70ec2e 100644
--- a/meta-oe/recipes-support/libunwind/libunwind.inc
+++ b/meta-oe/recipes-support/libunwind/libunwind.inc
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3fced11d6df719b47505837a51c16ae5"
 
 SRC_URI = "http://download.savannah.nongnu.org/releases/${BPN}/${BPN}-${PV}.tar.gz"
 
+MIRRORS += "http://download.savannah.nongnu.org/releases/ http://download-mirror.savannah.gnu.org/releases/ \n"
+
 inherit autotools
 
 PACKAGECONFIG ??= ""
-- 
1.7.9.5


