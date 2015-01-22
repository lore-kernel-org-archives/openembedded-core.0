Return-Path: <fabien.proriol@jdsu.com>
Received: from ks.kazoe.org (ks.kazoe.org [91.121.82.209])
	by mail.openembedded.org (Postfix) with ESMTP id 4A24D71637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 14:07:40 +0000 (UTC)
From: Fabien Proriol <fabien.proriol@jdsu.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jan 2015 15:07:48 +0100
Message-Id: <1421935668-11906-1-git-send-email-fabien.proriol@jdsu.com>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] boost: Avoid to use local host configuration
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
X-List-Received-Date: Thu, 22 Jan 2015 14:07:48 -0000

Signed-off-by: Fabien Proriol <fabien.proriol@jdsu.com>
---
 meta/recipes-support/boost/boost.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index d34ca7c..069b1c8 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -90,7 +90,8 @@ EQD = '\"'
 #boost.bb:   "...  '-sGCC=... '${SQD}'-DBOOST_PLATFORM_CONFIG=${EQD}config${EQD}'${SQD} ..."
 BJAM_CONF = "${SQD}'-DBOOST_PLATFORM_CONFIG=${EQD}boost/config/platform/${TARGET_OS}.hpp${EQD}'${SQD}"
 
-BJAM_TOOLS   = "-sTOOLS=gcc \
+BJAM_TOOLS   = "--ignore-site-config \
+		'-sTOOLS=gcc' \
 		'-sGCC=${CC} '${BJAM_CONF} \
 		'-sGXX=${CXX} '${BJAM_CONF} \
 		'-sGCC_INCLUDE_DIRECTORY=${STAGING_INCDIR}' \
-- 
2.0.4

