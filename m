Return-Path: <Yi.Zhao@windriver.com>
X-Greylist: delayed 356 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 06 Feb 2020 11:24:33 UTC
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6B891608BE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 11:24:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 016BID18017192
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Feb 2020 03:18:28 -0800
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 6 Feb 2020 03:18:14 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Feb 2020 19:18:12 +0800
Message-ID: <20200206111812.28970-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [PATCH] procps: upgrade 3.3.15 -> 3.3.16
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
X-List-Received-Date: Thu, 06 Feb 2020 11:24:33 -0000
Content-Type: text/plain

Drop 0001-Fix-out-of-tree-builds.patch since it has been merged
upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../procps/0001-Fix-out-of-tree-builds.patch  | 24 -------------------
 .../{procps_3.3.15.bb => procps_3.3.16.bb}    |  5 ++--
 2 files changed, 2 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-extended/procps/procps/0001-Fix-out-of-tree-builds.patch
 rename meta/recipes-extended/procps/{procps_3.3.15.bb => procps_3.3.16.bb} (93%)

diff --git a/meta/recipes-extended/procps/procps/0001-Fix-out-of-tree-builds.patch b/meta/recipes-extended/procps/procps/0001-Fix-out-of-tree-builds.patch
deleted file mode 100644
index e548194362..0000000000
--- a/meta/recipes-extended/procps/procps/0001-Fix-out-of-tree-builds.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 0825db94fc91fa2150c0e649e92cc8dcc44f4b38 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 4 Apr 2018 14:09:45 +0300
-Subject: [PATCH] Fix out of tree builds
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- include/nls.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/nls.h b/include/nls.h
-index 1166b7b..f5abe05 100644
---- a/include/nls.h
-+++ b/include/nls.h
-@@ -6,7 +6,7 @@
- #define PROCPS_NG_NLS_H
- 
- /* programs issuing textdomain() need PACKAGE string */
--#include "../config.h"
-+#include "config.h"
- 
- /* programs issuing bindtextdomain() also need LOCALEDIR string */
- #ifndef LOCALEDIR
diff --git a/meta/recipes-extended/procps/procps_3.3.15.bb b/meta/recipes-extended/procps/procps_3.3.16.bb
similarity index 93%
rename from meta/recipes-extended/procps/procps_3.3.15.bb
rename to meta/recipes-extended/procps/procps_3.3.16.bb
index 17abd96dca..60f90976bb 100644
--- a/meta/recipes-extended/procps/procps_3.3.15.bb
+++ b/meta/recipes-extended/procps/procps_3.3.16.bb
@@ -14,11 +14,10 @@ inherit autotools gettext pkgconfig update-alternatives
 
 SRC_URI = "http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${PV}.tar.xz \
            file://sysctl.conf \
-           file://0001-Fix-out-of-tree-builds.patch \
            "
 
-SRC_URI[md5sum] = "2b0717a7cb474b3d6dfdeedfbad2eccc"
-SRC_URI[sha256sum] = "10bd744ffcb3de2d591d2f6acf1a54a7ba070fdcc432a855931a5057149f0465"
+SRC_URI[md5sum] = "e8dc8455e573bdc40b8381d572bbb89b"
+SRC_URI[sha256sum] = "925eacd65dedcf9c98eb94e8978bbfb63f5de37294cc1047d81462ed477a20af"
 
 S = "${WORKDIR}/procps-ng-${PV}"
 
-- 
2.17.1


