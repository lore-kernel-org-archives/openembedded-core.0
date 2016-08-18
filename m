Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 98E286AC00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 05:55:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10033166"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Aug 2016 13:55:31 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8132742BC504
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 13:55:32 +0800 (CST)
Received: from localhost.localdomain (10.167.226.25) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 18 Aug 2016 13:55:32 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2016 13:54:18 +0800
Message-ID: <1471499658-9442-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.25]
X-yoursite-MailScanner-ID: 8132742BC504.ABA20
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libdrm: 2.4.68 -> 2.4.70
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
X-List-Received-Date: Thu, 18 Aug 2016 05:55:33 -0000
Content-Type: text/plain

Upgrade libdrm from 2.4.68 to 2.4.70.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch  | 2 +-
 meta/recipes-graphics/drm/{libdrm_2.4.68.bb => libdrm_2.4.70.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.68.bb => libdrm_2.4.70.bb} (92%)

diff --git a/meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch b/meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch
index 286e548..4708bf1 100644
--- a/meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch
+++ b/meta/recipes-graphics/drm/libdrm/fix_O_CLOEXEC_undeclared.patch
@@ -19,6 +19,6 @@ diff -Naur libdrm-2.4.66-orig/tests/drmdevice.c libdrm-2.4.66/tests/drmdevice.c
   */
  
 +#include <config.h>
+ #include <errno.h>
  #include <stdio.h>
  #include <stdlib.h>
- #include <sys/stat.h>
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.68.bb b/meta/recipes-graphics/drm/libdrm_2.4.70.bb
similarity index 92%
rename from meta/recipes-graphics/drm/libdrm_2.4.68.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.70.bb
index 758f801..632c30e 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.68.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.70.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://fix_O_CLOEXEC_undeclared.patch \
           "
 
-SRC_URI[md5sum] = "bcc96848d969cecf28223f668eeff354"
-SRC_URI[sha256sum] = "5b4bd9a5922929bc716411cb74061fbf31b06ba36feb89bc1358a91a8d0ca9df"
+SRC_URI[md5sum] = "920957cfe25a80efb02be9bd90bf3c1e"
+SRC_URI[sha256sum] = "b17d4b39ed97ca0e4cffa0db06ff609e617bac94646ec38e8e0579d530540e7b"
 
 inherit autotools pkgconfig
 
-- 
2.7.4




