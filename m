Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E72AB77251
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:17:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBL6HFj3002115
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 22:17:15 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Dec 2016 22:17:14 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Dec 2016 22:17:10 -0800
Message-ID: <15dd93091fc525640891648942b0a19e63459635.1482300982.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1482300982.git.liezhi.yang@windriver.com>
References: <cover.1482300982.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] quilt: 0.64 -> 0.65
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
X-List-Received-Date: Wed, 21 Dec 2016 06:17:14 -0000
Content-Type: text/plain

* Removed install.patch since it is already in the patch.
* Fix indent for file://test.sh

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../quilt/{quilt-native_0.64.bb => quilt-native_0.65.bb}    |  0
 meta/recipes-devtools/quilt/quilt.inc                       |  7 +++----
 meta/recipes-devtools/quilt/quilt/install.patch             | 13 -------------
 .../recipes-devtools/quilt/{quilt_0.64.bb => quilt_0.65.bb} |  0
 4 files changed, 3 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/quilt/{quilt-native_0.64.bb => quilt-native_0.65.bb} (100%)
 delete mode 100644 meta/recipes-devtools/quilt/quilt/install.patch
 rename meta/recipes-devtools/quilt/{quilt_0.64.bb => quilt_0.65.bb} (100%)

diff --git a/meta/recipes-devtools/quilt/quilt-native_0.64.bb b/meta/recipes-devtools/quilt/quilt-native_0.65.bb
similarity index 100%
rename from meta/recipes-devtools/quilt/quilt-native_0.64.bb
rename to meta/recipes-devtools/quilt/quilt-native_0.65.bb
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 512b798d735..9cf7bac5eed 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -5,14 +5,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
-        file://install.patch \
         file://run-ptest \
         file://Makefile \
-	file://test.sh \
+        file://test.sh \
 "
 
-SRC_URI[md5sum] = "fc0310db5868a0873d602d4332a76d43"
-SRC_URI[sha256sum] = "c4bfd3282214a288e8d3e921ae4d52e73e24c4fead72b5446752adee99a7affd"
+SRC_URI[md5sum] = "c67ba0228f5b7b8bbe469474661f92d6"
+SRC_URI[sha256sum] = "f6cbc788e5cbbb381a3c6eab5b9efce67c776a8662a7795c7432fd27aa096819"
 
 inherit autotools-brokensep ptest
 
diff --git a/meta/recipes-devtools/quilt/quilt/install.patch b/meta/recipes-devtools/quilt/quilt/install.patch
deleted file mode 100644
index e2a7af6550e..00000000000
--- a/meta/recipes-devtools/quilt/quilt/install.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Pending
-
---- quilt-0.47/Makefile.in	2008-12-31 19:09:13.000000000 +0000
-+++ quilt-0.47/Makefile.in.orig	2008-08-21 13:21:32.000000000 +0100
-@@ -13,7 +13,7 @@
- mandir :=	@mandir@
- localedir :=	$(datadir)/locale
- emacsdir :=	$(datadir)/emacs/site-lisp
--etcdir :=	$(subst /usr/etc,/etc,$(prefix)/etc)
-+etcdir :=	@sysconfdir@
- 
- INSTALL :=	@INSTALL@
- POD2MAN :=	@POD2MAN@
diff --git a/meta/recipes-devtools/quilt/quilt_0.64.bb b/meta/recipes-devtools/quilt/quilt_0.65.bb
similarity index 100%
rename from meta/recipes-devtools/quilt/quilt_0.64.bb
rename to meta/recipes-devtools/quilt/quilt_0.65.bb
-- 
2.11.0.rc2.dirty


