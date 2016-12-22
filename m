Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 81F2D7742E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 01:47:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14155653"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Dec 2016 09:47:44 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C3DE347E2FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 09:47:41 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 22 Dec 2016 09:47:42 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2016 09:47:24 +0800
Message-ID: <1482371244-2166-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: C3DE347E2FF2.A7BC5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] quilt: 0.64 -> 0.65
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
X-List-Received-Date: Thu, 22 Dec 2016 01:47:50 -0000
Content-Type: text/plain

1)Upgrade quilt from 0.64 to 0.65.
2)Upgrade quilt-native from 0.64 to 0.65.
3)Delete install.patch, since it is integrated upstream.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../quilt/{quilt-native_0.64.bb => quilt-native_0.65.bb}    |  0
 meta/recipes-devtools/quilt/quilt.inc                       |  5 ++---
 meta/recipes-devtools/quilt/quilt/install.patch             | 13 -------------
 .../recipes-devtools/quilt/{quilt_0.64.bb => quilt_0.65.bb} |  0
 4 files changed, 2 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/quilt/{quilt-native_0.64.bb => quilt-native_0.65.bb} (100%)
 delete mode 100644 meta/recipes-devtools/quilt/quilt/install.patch
 rename meta/recipes-devtools/quilt/{quilt_0.64.bb => quilt_0.65.bb} (100%)

diff --git a/meta/recipes-devtools/quilt/quilt-native_0.64.bb b/meta/recipes-devtools/quilt/quilt-native_0.65.bb
similarity index 100%
rename from meta/recipes-devtools/quilt/quilt-native_0.64.bb
rename to meta/recipes-devtools/quilt/quilt-native_0.65.bb
diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index 512b798..026109a 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -5,14 +5,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
-        file://install.patch \
         file://run-ptest \
         file://Makefile \
 	file://test.sh \
 "
 
-SRC_URI[md5sum] = "fc0310db5868a0873d602d4332a76d43"
-SRC_URI[sha256sum] = "c4bfd3282214a288e8d3e921ae4d52e73e24c4fead72b5446752adee99a7affd"
+SRC_URI[md5sum] = "c67ba0228f5b7b8bbe469474661f92d6"
+SRC_URI[sha256sum] = "f6cbc788e5cbbb381a3c6eab5b9efce67c776a8662a7795c7432fd27aa096819"
 
 inherit autotools-brokensep ptest
 
diff --git a/meta/recipes-devtools/quilt/quilt/install.patch b/meta/recipes-devtools/quilt/quilt/install.patch
deleted file mode 100644
index e2a7af6..0000000
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
2.7.4




