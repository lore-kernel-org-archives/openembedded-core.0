Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9DD073310
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 09:07:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1C97hpU022699
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 01:07:44 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Feb 2015 01:07:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Feb 2015 01:07:39 -0800
Message-ID: <5c4c1fdf400e11bbe69786fbbace7556309ca5eb.1423732000.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423732000.git.liezhi.yang@windriver.com>
References: <cover.1423732000.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] btrfs-tools: remove nodocs.patch
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
X-List-Received-Date: Thu, 12 Feb 2015 09:07:43 -0000
Content-Type: text/plain

It isn't used anymore, the docs is disabled by DISABLE_DOCUMENTATION=1.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../btrfs-tools/btrfs-tools/nodocs.patch           |   22 --------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/nodocs.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/nodocs.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/nodocs.patch
deleted file mode 100644
index 6df4e10..0000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/nodocs.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Doc generation requires xmlto and ascidoc which we don't have right now.
-Disable doc generation until such times as we have the right dependencies.
-
-RP 2014/7/16
-
-Upstream-Status: Inappropriate
-
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile	2014-07-16 13:21:43.289386655 +0000
-+++ git/Makefile	2014-07-16 13:42:46.453421079 +0000
-@@ -57,8 +57,8 @@
- btrfs_fragment_libs = -lgd -lpng -ljpeg -lfreetype
- 
- SUBDIRS =
--BUILDDIRS = $(patsubst %,build-%,$(SUBDIRS)) build-Documentation
--INSTALLDIRS = $(patsubst %,install-%,$(SUBDIRS)) install-Documentation
-+BUILDDIRS = $(patsubst %,build-%,$(SUBDIRS))
-+INSTALLDIRS = $(patsubst %,install-%,$(SUBDIRS))
- CLEANDIRS = $(patsubst %,clean-%,$(SUBDIRS))
- 
- .PHONY: $(SUBDIRS)
-- 
1.7.9.5


