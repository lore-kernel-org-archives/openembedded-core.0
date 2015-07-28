Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E79797634C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 02:12:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S2CauU025340
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:12:36 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 27 Jul 2015 19:12:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:12:31 -0700
Message-ID: <3313bc9f2c6cabb3c1840087e88e8c5208bd9f5c.1438049511.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438049511.git.liezhi.yang@windriver.com>
References: <cover.1438049511.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] man-pages: 4.00 -> 4.01
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
X-List-Received-Date: Tue, 28 Jul 2015 02:12:36 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{man-pages_4.00.bb => man-pages_4.01.bb}       |   13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_4.00.bb => man-pages_4.01.bb} (81%)

diff --git a/meta/recipes-extended/man-pages/man-pages_4.00.bb b/meta/recipes-extended/man-pages/man-pages_4.01.bb
similarity index 81%
rename from meta/recipes-extended/man-pages/man-pages_4.00.bb
rename to meta/recipes-extended/man-pages/man-pages_4.01.bb
index 121dd6c..f6a5c49 100644
--- a/meta/recipes-extended/man-pages/man-pages_4.00.bb
+++ b/meta/recipes-extended/man-pages/man-pages_4.01.bb
@@ -7,18 +7,13 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "c9bd70494ae18b19eb6be9c3845536ec"
-SRC_URI[sha256sum] = "6eea4583b8688c7d305b48d5908fa22700f57792617e4b1f3cd3766ddb520553"
+SRC_URI[md5sum] = "575f4e8920166b1433c329bb621819d1"
+SRC_URI[sha256sum] = "ba89f3453982fae6c699a877368d51ee27883b4de709e753eee3783b447a8381"
 
 RDEPENDS_${PN} = "man"
 
-do_configure () {
-	:
-}
-
-do_compile() {
-	:
-}
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
 
 do_install() {
         oe_runmake install DESTDIR=${D}
-- 
1.7.9.5


