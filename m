Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 56FB678AD2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 04:02:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6342BhD010414
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2018 21:02:11 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Mon, 2 Jul 2018 21:02:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Jul 2018 12:11:57 +0800
Message-ID: <5164693a0a16fb1e758eb72e01bd7d70689a8f3d.1530591075.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530591075.git.liezhi.yang@windriver.com>
References: <cover.1530591075.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] ccache: 3.3.5 -> 3.4.2
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
X-List-Received-Date: Tue, 03 Jul 2018 04:02:10 -0000
Content-Type: text/plain

* The license file is changed to LICENSE.adoc, it is still GPLv3+.
* Removed Revert-Create-man-page-in-the-make-install-from-git-.patch, it was
  used for fixing a build failure of no asciidoc, but now there is no such a
  failure, so remove it.
* Refreshed 0002-dev.mk.in-fix-file-name-too-long.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/ccache/ccache_3.3.5.bb       | 12 --------
 meta/recipes-devtools/ccache/ccache_3.4.2.bb       | 11 ++++++++
 .../0002-dev.mk.in-fix-file-name-too-long.patch    | 15 +++++-----
 ...te-man-page-in-the-make-install-from-git-.patch | 33 ----------------------
 4 files changed, 19 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.3.5.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.4.2.bb
 delete mode 100644 meta/recipes-devtools/ccache/files/Revert-Create-man-page-in-the-make-install-from-git-.patch

diff --git a/meta/recipes-devtools/ccache/ccache_3.3.5.bb b/meta/recipes-devtools/ccache/ccache_3.3.5.bb
deleted file mode 100644
index 929f0f1..0000000
--- a/meta/recipes-devtools/ccache/ccache_3.3.5.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ccache.inc
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=dae379a85bb6e9d594773e0aa64876f6"
-
-SRC_URI[md5sum] = "eee58db7cce892febddb989308dc568f"
-SRC_URI[sha256sum] = "190576a6e938760ec8113523e6fd380141117303e90766cc4802e770422b30c6"
-
-SRC_URI += " \
-            file://0002-dev.mk.in-fix-file-name-too-long.patch \
-            file://Revert-Create-man-page-in-the-make-install-from-git-.patch \
-"
diff --git a/meta/recipes-devtools/ccache/ccache_3.4.2.bb b/meta/recipes-devtools/ccache/ccache_3.4.2.bb
new file mode 100644
index 0000000..7230934
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache_3.4.2.bb
@@ -0,0 +1,11 @@
+require ccache.inc
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=2722abeaf1750dbf175b9491112374e1"
+
+SRC_URI[md5sum] = "9e048f88f3897125864f9a5e1abfb72d"
+SRC_URI[sha256sum] = "18a8b14367d63d3d37fb6c33cba60e1b7fcd7a63d608df97c9771ae0d234fee2"
+
+SRC_URI += " \
+            file://0002-dev.mk.in-fix-file-name-too-long.patch \
+"
diff --git a/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch b/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch
index 3f01c69..68c2371 100644
--- a/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch
+++ b/meta/recipes-devtools/ccache/files/0002-dev.mk.in-fix-file-name-too-long.patch
@@ -1,4 +1,4 @@
-From 71bd0082c6edcf73f054a8a4fa34bd8dd4de7cd7 Mon Sep 17 00:00:00 2001
+From 7dab2995ed8eeccd7b0acd79668bc28f3a2427d5 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Wed, 16 Sep 2015 19:45:40 -0700
 Subject: [PATCH] dev.mk.in: fix file name too long
@@ -10,14 +10,15 @@ to fix the problem.
 Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
- dev.mk.in |    2 +-
+ dev.mk.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: ccache-3.3.4/dev.mk.in
-===================================================================
---- ccache-3.3.4.orig/dev.mk.in
-+++ ccache-3.3.4/dev.mk.in
+diff --git a/dev.mk.in b/dev.mk.in
+index 91b0a57..583ade0 100644
+--- a/dev.mk.in
++++ b/dev.mk.in
 @@ -1,7 +1,7 @@
  # GNU make syntax reigns in this file.
  
@@ -25,5 +26,5 @@ Index: ccache-3.3.4/dev.mk.in
 -all_cppflags += -MD -MP -MF .deps/$(subst .._,,$(subst /,_,$<)).d
 +all_cppflags += -MD -MP -MF .deps/$(subst .._,,$(subst /,_,$(subst $(srcdir)/,,$<))).d
  
+ A2X = a2x
  ASCIIDOC = asciidoc
- CPPCHECK = cppcheck
diff --git a/meta/recipes-devtools/ccache/files/Revert-Create-man-page-in-the-make-install-from-git-.patch b/meta/recipes-devtools/ccache/files/Revert-Create-man-page-in-the-make-install-from-git-.patch
deleted file mode 100644
index f0208b9..0000000
--- a/meta/recipes-devtools/ccache/files/Revert-Create-man-page-in-the-make-install-from-git-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 94fabcdda5c7e54ccdbc1f0aeccb26ce30e61226 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 18 Jul 2016 19:53:00 -0700
-Subject: [PATCH] Revert "Create man page in the make-install-from-git-repo
- case"
-
-This reverts commit b86784902d28defd5e475c8922de594787df4541.
-
-We dont' have asciidoc, so revert it.
-
-Upstream-Status: Inappropriate [OE-Core specific]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index d474f2a..c6cdc04 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -76,7 +76,7 @@ ccache$(EXEEXT): $(ccache_objs) $(extra_libs)
- 	$(CC) $(all_cflags) -o $@ $(ccache_objs) $(LDFLAGS) $(extra_libs) $(LIBS)
- 
- .PHONY: install
--install: all $(srcdir)/ccache.1
-+install: all
- 	$(installcmd) -d $(DESTDIR)$(bindir)
- 	$(installcmd) -m 755 ccache$(EXEEXT) $(DESTDIR)$(bindir)
- 	$(installcmd) -d $(DESTDIR)$(mandir)/man1
--- 
-2.9.0
-
-- 
2.7.4


