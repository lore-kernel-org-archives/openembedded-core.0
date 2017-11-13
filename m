Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 03CD2785E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 00:54:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAE0sFhc027282
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 16:54:15 -0800 (PST)
Received: from pek-lpg-core1.windriver.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 16:54:14 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 01:58:50 +0800
Message-ID: <04750a34ae9bdb9014bd270b86121e167c941201.1510595883.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510595883.git.liezhi.yang@windriver.com>
References: <cover.1510595883.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] strace: 4.18 -> 4.19
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
X-List-Received-Date: Tue, 14 Nov 2017 00:54:14 -0000
Content-Type: text/plain

Rebase Makefile-ptest.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-devtools/strace/strace/Makefile-ptest.patch | 17 +++++++----------
 .../strace/{strace_4.18.bb => strace_4.19.bb}           |  4 ++--
 2 files changed, 9 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/strace/{strace_4.18.bb => strace_4.19.bb} (93%)

diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 97bcc90..a12f4c3 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -14,23 +14,23 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
  2 files changed, 19 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 61d6425..6387c24 100644
+index 5f0aec4..8eaacc6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -41,7 +41,7 @@ AC_COPYRIGHT([Copyright (C) 1999-]copyright_year[ The strace developers.])
+@@ -42,7 +42,7 @@ AC_COPYRIGHT([Copyright (c) 1999-]copyright_year[ The strace developers.])
  AC_CONFIG_SRCDIR([strace.c])
  AC_CONFIG_AUX_DIR([.])
  AC_CONFIG_HEADERS([config.h])
--AM_INIT_AUTOMAKE([foreign nostdinc dist-xz silent-rules parallel-tests])
-+AM_INIT_AUTOMAKE([foreign nostdinc dist-xz silent-rules serial-tests])
- AM_EXTRA_RECURSIVE_TARGETS([check-valgrind])
+-AM_INIT_AUTOMAKE([foreign nostdinc dist-xz silent-rules parallel-tests 1.13])
++AM_INIT_AUTOMAKE([foreign nostdinc dist-xz silent-rules serial-tests 1.13])
  AM_MAINTAINER_MODE
  AC_CANONICAL_HOST
+ 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 5aa7f89..a55a355 100644
+index b4ba22a..5836438 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -379,3 +379,21 @@ clean-local-check:
+@@ -408,3 +408,21 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../scno.am
@@ -52,6 +52,3 @@ index 5aa7f89..a55a355 100644
 +		sed -i -e 's/$${srcdir=.}/./g' $(DESTDIR)/$(TESTDIR)/$$file; \
 +	done
 +	for i in net scm_rights-fd rt_sigaction; do sed -i -e 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/$$i.test; done
--- 
-2.13.2
-
diff --git a/meta/recipes-devtools/strace/strace_4.18.bb b/meta/recipes-devtools/strace/strace_4.19.bb
similarity index 93%
rename from meta/recipes-devtools/strace/strace_4.18.bb
rename to meta/recipes-devtools/strace/strace_4.19.bb
index 5b2891a..deccf3d 100644
--- a/meta/recipes-devtools/strace/strace_4.18.bb
+++ b/meta/recipes-devtools/strace/strace_4.19.bb
@@ -16,8 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
            "
 
-SRC_URI[md5sum] = "3579b3266bb096cebaefbe2cdb1a3a78"
-SRC_URI[sha256sum] = "89ad887c1e6226bdbca8da31d589cadea4be0744b142eb47b768086c937fca08"
+SRC_URI[md5sum] = "846a9a26e74e797f42d77a0348104072"
+SRC_URI[sha256sum] = "7c93ebc6c29280f47c24a0eb86873a99ccb2cac6512c60a60ba4ef99ab807281"
 
 inherit autotools ptest bluetooth
 
-- 
2.7.4


