Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83E3C76D96
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 03:09:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7S39p2j022224
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 20:09:52 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 27 Aug 2015 20:09:50 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Aug 2015 23:09:47 -0400
Message-ID: <1440731387-19733-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.4.2
MIME-Version: 1.0
Subject: [PATCH] gcc-source: exlude from world
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
X-List-Received-Date: Fri, 28 Aug 2015 03:09:54 -0000
Content-Type: text/plain

Exclude all versions of gcc-source from world builds so that:
   bitbake -c <stage> world
will work. gcc-source deletes most bitbake build stages
since it is a source-only package.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-source_4.8.bb | 2 ++
 meta/recipes-devtools/gcc/gcc-source_4.9.bb | 2 ++
 meta/recipes-devtools/gcc/gcc-source_5.2.bb | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-source_4.8.bb b/meta/recipes-devtools/gcc/gcc-source_4.8.bb
index 234b82e..b890fa3 100644
--- a/meta/recipes-devtools/gcc/gcc-source_4.8.bb
+++ b/meta/recipes-devtools/gcc/gcc-source_4.8.bb
@@ -1,2 +1,4 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require recipes-devtools/gcc/gcc-source.inc
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-devtools/gcc/gcc-source_4.9.bb b/meta/recipes-devtools/gcc/gcc-source_4.9.bb
index 234b82e..b890fa3 100644
--- a/meta/recipes-devtools/gcc/gcc-source_4.9.bb
+++ b/meta/recipes-devtools/gcc/gcc-source_4.9.bb
@@ -1,2 +1,4 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require recipes-devtools/gcc/gcc-source.inc
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-devtools/gcc/gcc-source_5.2.bb b/meta/recipes-devtools/gcc/gcc-source_5.2.bb
index 234b82e..b890fa3 100644
--- a/meta/recipes-devtools/gcc/gcc-source_5.2.bb
+++ b/meta/recipes-devtools/gcc/gcc-source_5.2.bb
@@ -1,2 +1,4 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require recipes-devtools/gcc/gcc-source.inc
+
+EXCLUDE_FROM_WORLD = "1"
-- 
2.4.2


