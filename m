Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B47FF6C0F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 03:03:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1F33sMR020784
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 19:03:54 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.435.0; Thu, 14 Feb 2019 19:03:53 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Feb 2019 11:22:19 +0800
Message-ID: <495b49e906b00b2a8b19a09f65d5998cbf711a2e.1550200881.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1550200881.git.liezhi.yang@windriver.com>
References: <cover.1550200881.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] e2fsprogs: 1.44.3 -> 1.44.5
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
X-List-Received-Date: Fri, 15 Feb 2019 03:03:53 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs/{e2fsprogs_1.44.3.bb => e2fsprogs_1.44.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.44.3.bb => e2fsprogs_1.44.5.bb} (99%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
similarity index 99%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
index cffb536..0695ee9 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
@@ -13,7 +13,7 @@ SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permissio
                                 file://quiet-debugfs.patch \
 "
 
-SRCREV = "85e53f42f98d5334914de01e972e9ed44bccd0a5"
+SRCREV = "9a03c07e00f09a772245281d84a284c67e905148"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.7.4


