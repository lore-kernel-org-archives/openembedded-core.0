Return-Path: <changhyeok.bae@lge.com>
Received: from lgeamrelo01.lge.com (lgeamrelo01.lge.com [156.147.1.125])
	by mail.openembedded.org (Postfix) with ESMTP id E0B3965D13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 01:19:08 +0000 (UTC)
Received: from unknown (HELO changhyeok.bae) (10.177.232.191)
	by 156.147.1.125 with ESMTP; 25 Apr 2014 10:19:08 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: Changhyeok Bae <changhyeok.bae@lge.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Apr 2014 10:19:12 +0900
Message-Id: <1398388752-9773-1-git-send-email-changhyeok.bae@lge.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] dmidecode: change the SRC_URI
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
X-List-Received-Date: Fri, 25 Apr 2014 01:19:09 -0000

To use mirror siate, the SRC_URI
related with http://download.savannah.nongnu.org/ unify

Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
---
 meta/recipes-devtools/dmidecode/dmidecode_2.12.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
index 61779fe..764bd44 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.nongnu.org/dmidecode/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
-SRC_URI = "http://savannah.nongnu.org/download/dmidecode/${BP}.tar.bz2"
+SRC_URI = "http://download.savannah.nongnu.org/releases/dmidecode/${BP}.tar.bz2"
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm|powerpc).*-linux"
 
-- 
1.7.9.5


