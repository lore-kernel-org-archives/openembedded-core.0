Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADAF773177
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 01:37:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u671b8f5012026
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 18:37:09 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Jul 2016 18:37:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jul 2016 18:37:01 -0700
Message-ID: <102523f6b96c68522c940a9c004ce5fc3f977f7b.1467855356.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1467855356.git.liezhi.yang@windriver.com>
References: <cover.1467855356.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] e2fsprogs: 1.43 -> 1.43.1
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
X-List-Received-Date: Thu, 07 Jul 2016 01:37:08 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs/{e2fsprogs_1.43.bb => e2fsprogs_1.43.1.bb}              | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.bb => e2fsprogs_1.43.1.bb} (98%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.1.bb
similarity index 98%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.1.bb
index e82124b..ba11690 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.1.bb
@@ -1,7 +1,5 @@
 require e2fsprogs.inc
 
-PR = "r1"
-
 SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
             file://quiet-debugfs.patch \
@@ -11,7 +9,7 @@ SRC_URI += "file://acinclude.m4 \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
 "
 
-SRCREV = "d6adf070b0e85f209c0d7f310188b134b5cb7180"
+SRCREV = "48203a389d2d9f45dd0768f0963cb2b3ffbc12df"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.9.0


