Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 15A8471E45
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 15:06:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13873522"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Dec 2016 23:06:07 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 601D241B5F44
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:06:04 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 13 Dec 2016 23:06:04 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2016 15:05:39 -0800
Message-ID: <1481670339-995-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: 601D241B5F44.A4876
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] ghostscript 9.19 -> 9.20
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
X-List-Received-Date: Tue, 13 Dec 2016 15:06:14 -0000
Content-Type: text/plain

1)Upgrade ghostscript from 9.19 to 9.20.
2)Modify ghostscript-9.15-parallel-make.patch, since the data has been changed.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../ghostscript-9.15-parallel-make.patch           | 35 +++++++++++-----------
 .../{ghostscript_9.19.bb => ghostscript_9.20.bb}   |  8 ++---
 2 files changed, 21 insertions(+), 22 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_9.19.bb => ghostscript_9.20.bb} (92%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
index 797b894..8fa2c40 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
@@ -1,40 +1,39 @@
-From be1e1b33191afdcfe3c2ecc4ff3e361a5859e9c6 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Fri, 30 Jan 2015 00:40:22 -0800
-Subject: [PATCH] contrib.mak: fix for parallel build
+From 14937d9247330065359ca0fb648c28dfa5c3b224 Mon Sep 17 00:00:00 2001
+From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+Date: Tue, 13 Dec 2016 18:16:41 +0900
+Subject: [PATCH] ghostscript-9.15-parallel-make
 
-Fixed:
-rm: cannot remove `/usr/share/ghostscript/9.15/lib': Is a directory
+From 767bdf8a412b0cce2b734998e9b7e55abeaf932c Mon Sep 17 00:00:00 2001
+From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
+Date: Tue, 13 Dec 2016 17:55:54 +0900
+Subject: [PATCH] Robert Yang <liezhi.yang@windriver.com> Date: Fri, 30 Jan
+2015 00:40:22 -0800  Subject: [PATCH] contrib.mak: fix for parallel build
 
-Create lib before install to fix the race issue.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
 ---
- contrib/contrib.mak |    2 ++
+ contrib/contrib.mak | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/contrib/contrib.mak b/contrib/contrib.mak
-index 08a80d1..de2e20d 100644
+index 55415b3..0b6b5ae 100644
 --- a/contrib/contrib.mak
 +++ b/contrib/contrib.mak
-@@ -947,6 +947,7 @@ $(DEVOBJ)dviprlib.$(OBJ) : $(JAPSRC)dviprlib.c $(JAPSRC)dviprlib.h
+@@ -1099,6 +1099,7 @@ $(DEVOBJ)dviprlib.$(OBJ) : $(JAPSRC)dviprlib.c $(JAPSRC)dviprlib.h \
  	$(DEVCC) $(O_)$@ $(C_) $(JAPSRC)dviprlib.c
  
- extra-dmprt-install:
+ extra-dmprt-install: install-libdata
 +	mkdir -p $(DESTDIR)$(gsdatadir)$(D)lib
  	$(INSTALL_DATA) $(JAPSRC)dmp_init.ps $(DESTDIR)$(gsdatadir)$(D)lib || exit 1
  	$(INSTALL_DATA) $(JAPSRC)dmp_site.ps $(DESTDIR)$(gsdatadir)$(D)lib || exit 1
  	$(INSTALL_DATA) $(JAPSRC)escp_24.src $(DESTDIR)$(gsdatadir)$(D)lib || exit 1
-@@ -1088,6 +1089,7 @@ $(DEVOBJ)gdevalps.$(OBJ) : $(JAPSRC)gdevalps.c $(PDEVH)
+@@ -1267,6 +1268,7 @@ $(DEVOBJ)gdevalps.$(OBJ) : $(JAPSRC)gdevalps.c $(PDEVH) \
  ### ----------------- Additional .upp files ---------------- ###
  
- extra-upp-install:
+ extra-upp-install: install-libdata
 +	mkdir -p $(DESTDIR)$(gsdatadir)$(D)lib
  	for f in $(CONTRIBSRC)uniprint$(D)*.upp; do \
  	    $(INSTALL_DATA) $$f $(DESTDIR)$(gsdatadir)$(D)lib || exit 1; \
  	done
 -- 
-1.7.9.5
+2.7.4
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.19.bb b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
similarity index 92%
rename from meta/recipes-extended/ghostscript/ghostscript_9.19.bb
rename to meta/recipes-extended/ghostscript/ghostscript_9.20.bb
index 8524591..0800b4e 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.19.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.20.bb
@@ -11,14 +11,14 @@ HOMEPAGE = "http://www.ghostscript.com"
 SECTION = "console/utils"
 
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b17cea54743435ab2a581c237bea294a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=70dc2bac4d0ce4448da873cd86b123fc"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups libpng"
 DEPENDS_class-native = "libpng-native"
 
 UPSTREAM_CHECK_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
 
-SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs919/${BPN}-${PV}.tar.gz \
+SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs920/${BPN}-${PV}.tar.gz \
                 file://ghostscript-9.15-parallel-make.patch \
                 file://ghostscript-9.16-Werror-return-type.patch \
                 file://png_mak.patch \
@@ -37,8 +37,8 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
                         file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
                         "
 
-SRC_URI[md5sum] = "c9682ce6b852f9197c69905a43928907"
-SRC_URI[sha256sum] = "cf3c0dce67db1557a87366969945f9c5235887989c0b585e037af366dc035989"
+SRC_URI[md5sum] = "93c5987cd3ab341108be1ebbaadc24fe"
+SRC_URI[sha256sum] = "949b64b46ecf8906db54a94ecf83ab97534ebf946f770d3c3f283cb469cb6e14"
 
 EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
                 --with-fontpath=${datadir}/fonts \
-- 
2.7.4




