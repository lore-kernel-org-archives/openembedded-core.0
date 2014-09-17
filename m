Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F34236ACBA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 21:59:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8HLxcQZ003075
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 14:59:38 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 17 Sep 2014 14:59:38 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Sep 2014 14:59:38 -0700
Message-ID: <1410991178-18198-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [v2][PATCH 1/1] sysprof: disable build for aarch64
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
X-List-Received-Date: Wed, 17 Sep 2014 21:59:41 -0000
Content-Type: text/plain

Add COMPATIBLE_HOST to the recipe and prohibit
building for aarch64 and aarch64_be.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-kernel/sysprof/sysprof_git.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index ef1e270..cfc814f 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -18,3 +18,8 @@ SRC_URI_append_mips64 = " file://rmb-mips.patch"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
+
+# We do not yet work for aarch64.
+#
+COMPATIBLE_HOST = "^(?!aarch64).*"
+
-- 
1.7.9.5


