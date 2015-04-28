Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC94273D93
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 03:43:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3S3hXJn024925
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 20:43:33 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Apr 2015 20:43:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Apr 2015 20:43:26 -0700
Message-ID: <b940b92cdda60992521dae025a9ab75d03842eea.1430192424.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1430192424.git.liezhi.yang@windriver.com>
References: <cover.1430192424.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/11] kmod: remove 0001-Makefile.am-fix-parallel-build-problem.patch
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
X-List-Received-Date: Tue, 28 Apr 2015 03:43:33 -0000
Content-Type: text/plain

Confirmed with the author Qi, it isn't needed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...01-Makefile.am-fix-parallel-build-problem.patch |   29 --------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/0001-Makefile.am-fix-parallel-build-problem.patch

diff --git a/meta/recipes-kernel/kmod/kmod/0001-Makefile.am-fix-parallel-build-problem.patch b/meta/recipes-kernel/kmod/kmod/0001-Makefile.am-fix-parallel-build-problem.patch
deleted file mode 100644
index 49b0209..0000000
--- a/meta/recipes-kernel/kmod/kmod/0001-Makefile.am-fix-parallel-build-problem.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Pending
-
-Subject: Makefile.am: fix parallel build problem
-
-Fix parallel build problem to avoid errors like below.
-
-    install: cannot stat 'testsuite/module-playground/mod-fake-cciss.ko': No such file or directory
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 9457655..d5b02eb 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -237,7 +237,7 @@ rootfs: build-module-playground
- 
- .PHONY: rootfs build-playground
- 
--$(ROOTFS): $(ROOTFS_PRISTINE)
-+$(ROOTFS): $(ROOTFS_PRISTINE) build-module-playground
- 	$(CREATE_ROOTFS)
- 
- TESTSUITE_OVERRIDE_LIBS = \
--- 
-1.9.1
-
-- 
1.7.9.5


