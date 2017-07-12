Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A3C7B78044
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 02:21:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6C2Legr016198
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 19:21:42 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Jul 2017 19:21:39 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Jul 2017 22:21:35 -0400
Message-ID: <7797e78fbef3ffa6b4552cf71a4ab8515716058a.1499825744.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1499825744.git.dengke.du@windriver.com>
References: <cover.1499825744.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] chrpath: reduce local pending patches
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
X-List-Received-Date: Wed, 12 Jul 2017 02:21:41 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../chrpath/chrpath/standarddoc.patch              | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/chrpath/chrpath/standarddoc.patch b/meta/recipes-devtools/chrpath/chrpath/standarddoc.patch
index f96f104..3d303fb 100644
--- a/meta/recipes-devtools/chrpath/chrpath/standarddoc.patch
+++ b/meta/recipes-devtools/chrpath/chrpath/standarddoc.patch
@@ -1,14 +1,24 @@
-Upstream-Status: Pending
+From 285b5fbf1d6b25ff55d305c17edf4d327bf19dd3 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 5 Jul 2011 23:42:29 +0100
+Subject: [PATCH] chrpath: Ensure the package respects the docdir variable
 
-autoconf/automake set docdir automatically, use their value ensuring 
+autoconf/automake set docdir automatically, use their value ensuring
 doc files are placed into $datadir/doc, not $prefix/doc.
 
 RP 5/7/2011
 
-Index: chrpath-0.13/Makefile.am
-===================================================================
---- chrpath-0.13.orig/Makefile.am	2011-07-05 23:40:14.769920254 +0100
-+++ chrpath-0.13/Makefile.am	2011-07-05 23:40:19.819920635 +0100
+Upstream-Status: Submitted [ http://lists.alioth.debian.org/pipermail/chrpath-devel/Week-of-Mon-20170710/000013.html ]
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ Makefile.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index b50ad21..5f7e861 100644
+--- a/Makefile.am
++++ b/Makefile.am
 @@ -1,7 +1,5 @@
  SUBDIRS = testsuite deb
  
@@ -17,3 +27,6 @@ Index: chrpath-0.13/Makefile.am
  doc_DATA = AUTHORS COPYING ChangeLog INSTALL NEWS README
  
  bin_PROGRAMS = chrpath
+-- 
+2.8.1
+
-- 
2.8.1


