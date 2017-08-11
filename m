Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4962178261
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 04:35:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7B4ZVIi001715
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 21:35:32 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 10 Aug 2017 21:35:31 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Aug 2017 00:35:28 -0400
Message-ID: <ee5958f5bf1f8de6a95fcec8142f5671c3f7c57f.1502425947.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1502425947.git.dengke.du@windriver.com>
References: <cover.1502425947.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] expat: Upgrade to 2.2.3
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
X-List-Received-Date: Fri, 11 Aug 2017 04:35:31 -0000
Content-Type: text/plain

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-core/expat/expat.inc               |  1 +
 meta/recipes-core/expat/expat/libtool-tag.patch | 18 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.1.bb          |  5 -----
 meta/recipes-core/expat/expat_2.2.3.bb          |  4 ++++
 4 files changed, 23 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/libtool-tag.patch
 delete mode 100644 meta/recipes-core/expat/expat_2.2.1.bb
 create mode 100644 meta/recipes-core/expat/expat_2.2.3.bb

diff --git a/meta/recipes-core/expat/expat.inc b/meta/recipes-core/expat/expat.inc
index 9fa0ca2..067687e 100644
--- a/meta/recipes-core/expat/expat.inc
+++ b/meta/recipes-core/expat/expat.inc
@@ -6,6 +6,7 @@ LICENSE = "MIT"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://autotools.patch \
+           file://libtool-tag.patch \
 	  "
 inherit autotools lib_package
 
diff --git a/meta/recipes-core/expat/expat/libtool-tag.patch b/meta/recipes-core/expat/expat/libtool-tag.patch
new file mode 100644
index 0000000..3ef4197
--- /dev/null
+++ b/meta/recipes-core/expat/expat/libtool-tag.patch
@@ -0,0 +1,18 @@
+Add CC tag to build
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: expat-2.2.2/Makefile.in
+===================================================================
+--- expat-2.2.2.orig/Makefile.in
++++ expat-2.2.2/Makefile.in
+@@ -109,7 +109,7 @@ mkdir-init:
+ 
+ CC = @CC@
+ CXX = @CXX@
+-LIBTOOL = @LIBTOOL@
++LIBTOOL = @LIBTOOL@ --tag CC
+ 
+ INCLUDES = -I$(srcdir)/lib -I.
+ LDFLAGS = @LDFLAGS@
diff --git a/meta/recipes-core/expat/expat_2.2.1.bb b/meta/recipes-core/expat/expat_2.2.1.bb
deleted file mode 100644
index 47827c5..0000000
--- a/meta/recipes-core/expat/expat_2.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require expat.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
-
-SRC_URI[md5sum] = "d9c3baeab58774cefc2f04faf29f2cf8"
-SRC_URI[sha256sum] = "1868cadae4c82a018e361e2b2091de103cd820aaacb0d6cfa49bd2cd83978885"
diff --git a/meta/recipes-core/expat/expat_2.2.3.bb b/meta/recipes-core/expat/expat_2.2.3.bb
new file mode 100644
index 0000000..abf8450
--- /dev/null
+++ b/meta/recipes-core/expat/expat_2.2.3.bb
@@ -0,0 +1,4 @@
+require expat.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
+SRC_URI[md5sum] = "f053af63ef5f39bd9b78d01fbc203334"
+SRC_URI[sha256sum] = "b31890fb02f85c002a67491923f89bda5028a880fd6c374f707193ad81aace5f"
-- 
2.8.1


