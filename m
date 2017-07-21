Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6B2780A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 02:30:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6L2UspU018888
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 19:30:54 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Jul 2017 19:30:53 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jul 2017 22:30:50 -0400
Message-ID: <1eebceab35c20909151f9c3669fb861921add2c8.1500604184.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500604184.git.dengke.du@windriver.com>
References: <cover.1500604184.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bison: reduce local pending patches
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
X-List-Received-Date: Fri, 21 Jul 2017 02:30:54 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../bison/bison/0001-src-local.mk-fix-parallel-issue.patch       | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/bison/bison/0001-src-local.mk-fix-parallel-issue.patch b/meta/recipes-devtools/bison/bison/0001-src-local.mk-fix-parallel-issue.patch
index 9543a56..1e86f55 100644
--- a/meta/recipes-devtools/bison/bison/0001-src-local.mk-fix-parallel-issue.patch
+++ b/meta/recipes-devtools/bison/bison/0001-src-local.mk-fix-parallel-issue.patch
@@ -1,4 +1,4 @@
-From 3a15f7c9ace6c0294edc313a1848cafcc31b2a92 Mon Sep 17 00:00:00 2001
+From 5b9204eee4b06b48d54ecc3ef3a0b56fc5cc84f8 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Fri, 24 Apr 2015 00:38:32 -0700
 Subject: [PATCH] src/local.mk: fix parallel issue
@@ -9,11 +9,12 @@ echo '#! /bin/sh' >src/yacc.tmp
 /bin/bash: src/yacc.tmp: No such file or directory
 Makefile:6670: recipe for target 'src/yacc' failed
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [ http://lists.gnu.org/archive/html/bison-patches/2017-07/msg00000.html ]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
- src/local.mk |    1 +
+ src/local.mk | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/local.mk b/src/local.mk
@@ -29,5 +30,5 @@ index 573ad00..28bfae4 100644
  	$(AM_V_at)echo "exec '$(bindir)/bison' -y "'"$$@"' >>$@.tmp
  	$(AM_V_at)chmod a+x $@.tmp
 -- 
-1.7.9.5
+2.8.1
 
-- 
2.8.1


