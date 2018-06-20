Return-Path: <zhe.he@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8EBB47552A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 10:25:15 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w5KAPF2Z002770
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 03:25:15 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Wed, 20 Jun 2018 03:25:15 -0700
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 03:25:14 -0700
Message-Id: <20180620102514.27800-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] lttng-modules: upgrade 2.10.5 -> 2.10.6
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
X-List-Received-Date: Wed, 20 Jun 2018 10:25:15 -0000

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../lttng/{lttng-modules_2.10.5.bb => lttng-modules_2.10.6.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.5.bb => lttng-modules_2.10.6.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.10.5.bb b/meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-modules_2.10.5.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
index 370b78aae14..6146966894d 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.10.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.10.6.bb
@@ -16,8 +16,8 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
 "
 
-SRC_URI[md5sum] = "4aaabaafd15d9455c83972e26ccfbca7"
-SRC_URI[sha256sum] = "b8dbbbee45a673c381f51b99c555e36655c3c2c7a5477aab927591cc7f003a1f"
+SRC_URI[md5sum] = "8110099f4615fc89a74ffe9189b56cfc"
+SRC_URI[sha256sum] = "04a080c81743eb29d181bac29ceb0c15819a2f4210793f2cc9958d885435029f"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.11.0


