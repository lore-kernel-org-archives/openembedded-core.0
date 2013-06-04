Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id E4C136A5A8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 11:14:47 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Jun 2013 12:14:43 +0100
Message-Id: <1370344483-6314-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.3
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH] connman: update to 1.15
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
X-List-Received-Date: Tue, 04 Jun 2013 11:14:48 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---

Compile and runtime tested armv7a

 .../recipes-connectivity/connman/{connman_1.14.bb => connman_1.15.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.14.bb => connman_1.15.bb} (73%)

diff --git a/meta/recipes-connectivity/connman/connman_1.14.bb b/meta/recipes-connectivity/connman/connman_1.15.bb
similarity index 73%
rename from meta/recipes-connectivity/connman/connman_1.14.bb
rename to meta/recipes-connectivity/connman/connman_1.15.bb
index f9a5ecc..0ec29c9 100644
--- a/meta/recipes-connectivity/connman/connman_1.14.bb
+++ b/meta/recipes-connectivity/connman/connman_1.15.bb
@@ -7,8 +7,8 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://inet-fix-ip-cleanup-functions.patch \
             "
 
-SRC_URI[md5sum] = "6c9ecaf9c044f8c66a7b465f6716b569"
-SRC_URI[sha256sum] = "d0c37452a4e8eec27e433ff901a6c447963b9d8a8ceddd4a7311cc322e2dbf8c"
+SRC_URI[md5sum] = "e785c0c4564bfffb5215272f1be6f17c"
+SRC_URI[sha256sum] = "8229cc5e3e75197453ba2a644c03860a7cf9f4f27fcbf111bb589530d4efb58f"
 
 PR = "${INC_PR}.0"
 
-- 
1.8.3


