Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0FB7F7CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 16:56:41 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s3so4281377ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 08:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1PjzOWPQ9f+xds8yzVspQfyoO4NgV44bNoofvLlPzZU=;
	b=YAhXxPdhLaloiZtIrLbhkSBYvApzLABtI0IBOFKAdJ5KwbgCa0Rh/qlpKgamXsntBC
	G/tGRF9rifWHNTfr9+lhmbdrjA6utWp2jvWcDqtpJC+woHcYtilNisSt/QsZPZ5WjgFB
	+Hsxq5uiavV+cJj/FfqwZGMeflCcxO+Jfvx+G36zjynQi/pzYsvdZ94RHM1fbnSx/rlj
	0Yw2IU5MJ8te0xavh8zM3hXV6L75tcrpA7rdddychAW7V+3piL3cdd4pLoAbAJgPpwB2
	8/uS6divbmtK8iF5+HB9uIOiko+mWWShUyegrlkOc5Fz4HFNl62/VnV0hldg4GW/qobl
	OhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1PjzOWPQ9f+xds8yzVspQfyoO4NgV44bNoofvLlPzZU=;
	b=eY1HfiJWo0uL9bATMP0k5krnWcnBNiec5r1RBEWfrl507iOQMy7MsGsG+HUq2mbjLA
	feGnU8mXZga/0BD31A1fPLN4uwtTL9Y9qko4gyVFgkrsQwpg2eyr9sxy4NWe81+ZWDoo
	DlxvvORL5hlQYLiDeG4XR9TjFZMHwe8Tu/aI/hymdchxgcwXwK+ssADKD2cWKvcvoHKp
	LUrUJyTkswuIMTu2cJgrkLYIVAvWCBoDOe4MRWZHorsv8hinIjxos9wHgOnE4XWiD3Rx
	iXr8t9n6p0SIFq2M/p6XX2CWMxcUKZz+C3Sc6U8jHp2eln3xD3qkztbHSFSQaEzdXY9b
	eJxg==
X-Gm-Message-State: APjAAAXJVG9hGLhn3017Qazzq1WDrvOaJPF21CywSVK5ZI6cRn2TqHs9
	SEckJT9/kJsCWSN5Rrw31KSSjYZ6L8c=
X-Google-Smtp-Source: APXvYqy48ZZSrctzEZDw9htu2EPuSEOPgteDxgF5w7nWE30LrHiazf4Jtw7QCWE4y5/1Xt58qShfgg==
X-Received: by 2002:a5e:8e02:: with SMTP id a2mr8727341ion.269.1574355402074; 
	Thu, 21 Nov 2019 08:56:42 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id f2sm1086546iog.30.2019.11.21.08.56.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 08:56:41 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 10:56:32 -0600
Message-Id: <20191121165632.1219807-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] libjitterentropy: Upgrade 2.1.2 -> 2.2.0
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
X-List-Received-Date: Thu, 21 Nov 2019 16:56:41 -0000
Content-Transfer-Encoding: 8bit

Upstream has a patch that replaces "install -s" with an INSTALL_STRIP
make variable, which can be used to replace the custom patch being
carried.

License checksum change was due to a date in the license text being
updated. The actual contents are unchanged.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...akefile-cleanup-install-for-rebuilds.patch | 56 +++++++++++++++++++
 .../0001-fix-do_install-failure-on-oe.patch   | 33 -----------
 ...opy_2.1.2.bb => libjitterentropy_2.2.0.bb} | 12 ++--
 3 files changed, 62 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-support/libjitterentropy/files/0001-Makefile-cleanup-install-for-rebuilds.patch
 delete mode 100644 meta/recipes-support/libjitterentropy/files/0001-fix-do_install-failure-on-oe.patch
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_2.1.2.bb => libjitterentropy_2.2.0.bb} (73%)

diff --git a/meta/recipes-support/libjitterentropy/files/0001-Makefile-cleanup-install-for-rebuilds.patch b/meta/recipes-support/libjitterentropy/files/0001-Makefile-cleanup-install-for-rebuilds.patch
new file mode 100644
index 00000000000..a19b2522935
--- /dev/null
+++ b/meta/recipes-support/libjitterentropy/files/0001-Makefile-cleanup-install-for-rebuilds.patch
@@ -0,0 +1,56 @@
+From 060b9b4147f6e5ff386a8b017796118d783e59fa Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Tue, 22 Oct 2019 12:44:30 -0500
+Subject: [PATCH] Makefile: cleanup install for rebuilds
+
+Support the ability to rebuild and redeploy without a clean. This
+required some force linking and man archive creation.
+
+Provide the ability to override the stripping of the shared lib for
+cases where a embedded target build may want to control stripping
+or provide cross arch tools.
+
+Upstream-Status: Accepted [060b9b4147f6e5ff386a8b017796118d783e59fa]
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+Signed-off-by: Stephan Mueller <smueller@chronox.de>
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ Makefile | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 4ff069b..2e78607 100644
+--- a/Makefile
++++ b/Makefile
+@@ -14,6 +14,8 @@ LIBDIR := lib
+ # include target directory
+ INCDIR := include
+ 
++INSTALL_STRIP ?= install -s
++
+ NAME := jitterentropy
+ LIBMAJOR=$(shell cat jitterentropy-base.c | grep define | grep MAJVERSION | awk '{print $$3}')
+ LIBMINOR=$(shell cat jitterentropy-base.c | grep define | grep MINVERSION | awk '{print $$3}')
+@@ -58,15 +60,15 @@ cppcheck:
+ install:
+ 	install -d -m 0755 $(DESTDIR)$(PREFIX)/share/man/man3
+ 	install -m 644 doc/$(NAME).3 $(DESTDIR)$(PREFIX)/share/man/man3/
+-	gzip -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
++	gzip -f -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
+ 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
+-	install -m 0755 -s lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
++	$(INSTALL_STRIP) -m 0755 lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
+ 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)
+ 	install -m 0644 jitterentropy.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
+ 	install -m 0644 jitterentropy-base-user.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
+ 	$(RM) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
+-	ln -s lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
+-	ln -s lib$(NAME).so.$(LIBMAJOR) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so
++	ln -sf lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
++	ln -sf lib$(NAME).so.$(LIBMAJOR) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so
+ 
+ clean:
+ 	@- $(RM) $(NAME)
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/libjitterentropy/files/0001-fix-do_install-failure-on-oe.patch b/meta/recipes-support/libjitterentropy/files/0001-fix-do_install-failure-on-oe.patch
deleted file mode 100644
index 30ff4feb6b7..00000000000
--- a/meta/recipes-support/libjitterentropy/files/0001-fix-do_install-failure-on-oe.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 00cefca0eefecec657969b50cd4e1ed5b057a857 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 25 Oct 2018 16:30:06 +0800
-Subject: [PATCH] fix do_install failure on oe
-
-- Do not strip at do_install
-
-- Create includedir
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 5e31276..76fcbfa 100644
---- a/Makefile
-+++ b/Makefile
-@@ -51,7 +51,8 @@ install:
- 	install -m 644 doc/$(NAME).3 $(DESTDIR)$(PREFIX)/share/man/man3/
- 	gzip -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
- 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
--	install -m 0755 -s lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
-+	install -m 0755 lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
-+	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)/
- 	install -m 0644 jitterentropy.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
- 	install -m 0644 jitterentropy-base-user.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
- 	$(RM) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
--- 
-2.7.4
-
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_2.1.2.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_2.2.0.bb
similarity index 73%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_2.1.2.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_2.2.0.bb
index 3b5b4e4aa04..db8d80e0edd 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_2.1.2.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_2.2.0.bb
@@ -5,14 +5,13 @@ stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "http://www.chronox.de/jent.html"
 LICENSE = "GPLv2+ | BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e52365752b36cfcd7f9601d80de7d8c6 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=a95aadbdfae7ed812bb2b7b86eb5981c \
                     file://COPYING.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
-                   "
+                    "
 SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git \
-           file://0001-fix-do_install-failure-on-oe.patch \
-          "
-SRCREV = "f5a80c6f3fcc6deebd0eabf75324f48aed1afbce"
+           file://0001-Makefile-cleanup-install-for-rebuilds.patch"
+SRCREV = "933a44f33ed3d6612f7cfaa7ad1207c8da4886ba"
 S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
@@ -23,6 +22,7 @@ do_install () {
     oe_runmake install INCDIR="/include" \
                        DESTDIR="${D}" \
                        PREFIX="${exec_prefix}" \
-                       LIBDIR="${baselib}"
+                       LIBDIR="${baselib}" \
+                       INSTALL_STRIP="install"
 }
 
-- 
2.23.0


