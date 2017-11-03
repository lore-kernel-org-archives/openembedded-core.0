Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C0D5878367
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 07:28:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA37S7hE024148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Nov 2017 00:28:08 -0700 (PDT)
Received: from pek-ddu-u1642.wrs.com (128.224.162.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 3 Nov 2017 00:28:07 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Nov 2017 15:26:42 +0800
Message-ID: <463129117ac222f7daf8f2e7511b957c362df2bc.1509693899.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509693899.git.dengke.du@windriver.com>
References: <cover.1509693899.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] expat: upgrade to 2.2.5
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
X-List-Received-Date: Fri, 03 Nov 2017 07:28:06 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-core/expat/expat/libtool-tag.patch | 34 +++++++++++++++++--------
 meta/recipes-core/expat/expat_2.2.3.bb          |  4 ---
 meta/recipes-core/expat/expat_2.2.5.bb          |  4 +++
 3 files changed, 27 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat_2.2.3.bb
 create mode 100644 meta/recipes-core/expat/expat_2.2.5.bb

diff --git a/meta/recipes-core/expat/expat/libtool-tag.patch b/meta/recipes-core/expat/expat/libtool-tag.patch
index 3ef4197..0a0aed2 100644
--- a/meta/recipes-core/expat/expat/libtool-tag.patch
+++ b/meta/recipes-core/expat/expat/libtool-tag.patch
@@ -1,18 +1,30 @@
+From 10342e6b600858b091bc7771e454d9e06af06410 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Nov 2017 18:20:57 +0800
+Subject: [PATCH] Add CC tag to build
+
 Add CC tag to build
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: expat-2.2.2/Makefile.in
-===================================================================
---- expat-2.2.2.orig/Makefile.in
-+++ expat-2.2.2/Makefile.in
-@@ -109,7 +109,7 @@ mkdir-init:
- 
- CC = @CC@
- CXX = @CXX@
+diff --git a/Makefile.in b/Makefile.in
+index 9560a95..d444bd6 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -319,7 +319,7 @@ LIBCURRENT = @LIBCURRENT@
+ LIBOBJS = @LIBOBJS@
+ LIBREVISION = @LIBREVISION@
+ LIBS = @LIBS@
 -LIBTOOL = @LIBTOOL@
 +LIBTOOL = @LIBTOOL@ --tag CC
- 
- INCLUDES = -I$(srcdir)/lib -I.
- LDFLAGS = @LDFLAGS@
+ LIPO = @LIPO@
+ LN_S = @LN_S@
+ LTLIBOBJS = @LTLIBOBJS@
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/expat/expat_2.2.3.bb b/meta/recipes-core/expat/expat_2.2.3.bb
deleted file mode 100644
index abf8450..0000000
--- a/meta/recipes-core/expat/expat_2.2.3.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require expat.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
-SRC_URI[md5sum] = "f053af63ef5f39bd9b78d01fbc203334"
-SRC_URI[sha256sum] = "b31890fb02f85c002a67491923f89bda5028a880fd6c374f707193ad81aace5f"
diff --git a/meta/recipes-core/expat/expat_2.2.5.bb b/meta/recipes-core/expat/expat_2.2.5.bb
new file mode 100644
index 0000000..337287b
--- /dev/null
+++ b/meta/recipes-core/expat/expat_2.2.5.bb
@@ -0,0 +1,4 @@
+require expat.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
+SRC_URI[md5sum] = "789e297f547980fc9ecc036f9a070d49"
+SRC_URI[sha256sum] = "d9dc32efba7e74f788fcc4f212a43216fc37cf5f23f4c2339664d473353aedf6"
-- 
2.7.4


