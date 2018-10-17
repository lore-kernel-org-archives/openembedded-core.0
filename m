Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 95C0C7990B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 00:40:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="46232907"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Oct 2018 08:40:05 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id AFB3D4B6ED6F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:40:02 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 17 Oct 2018 08:40:03 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Oct 2018 08:40:14 +0800
Message-ID: <20181017004016.7897-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: AFB3D4B6ED6F.A423C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] e2fsprogs:1.44.3->1.44.4
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
X-List-Received-Date: Wed, 17 Oct 2018 00:40:09 -0000
Content-Type: text/plain

Upgrade e2fsprogs from 1.44.3 to 1.44.4

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 .../e2fsprogs/{e2fsprogs_1.44.3.bb => e2fsprogs_1.44.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.44.3.bb => e2fsprogs_1.44.4.bb} (98%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.4.bb
similarity index 98%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.4.bb
index 823d18b..99b4d68 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.4.bb
@@ -12,7 +12,7 @@ SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permissio
                                 file://quiet-debugfs.patch \
 "
 
-SRCREV = "85e53f42f98d5334914de01e972e9ed44bccd0a5"
+SRCREV = "40e66e2e8be046f909dfff73b3909f15c9d0f400"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.7.4




