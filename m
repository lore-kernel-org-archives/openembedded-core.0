Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 45AA377F79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 04:59:14 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id u36so10503848pgn.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 21:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1V/oWnblBysSXU+25lOLCYVDcY4a942PnK4oSyYGLG4=;
	b=M4B5/ggSjARQ1DzkLT8QG0QfV4BeMWuWKEOZQRktqWEHj0oIKezMKKTYnFzLyeBpup
	zslTUhCrsHmtqyI0K6Xc4iyNy1WkpKRiH7miSZAaDuSUoUBazJzAK8v3GxV0Mi7pQBCb
	bGtEHjAZ1WiSaBF0Y+nAd5VL7l0w69U5Ibs3O4zZTuBAC1kDGS/XqIOfNCapU1VOfxtN
	bIxwntfWMVOsURGj5XJ8GVVsD34MZNOZLSBu5LCWDtEGoH4QEMD2vyx1QWOKHSsXgX/j
	GvqpLP8Wbb+D3vojYLMMcyYqIiMwN2t+8VwD9tJHZTe+aOX7JArABFmm+GHiBbm2eAT6
	7gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1V/oWnblBysSXU+25lOLCYVDcY4a942PnK4oSyYGLG4=;
	b=ODh1ludP+eD9QMIeEKT1jhRUt4FwlN3J92XdNSttU0RRMgPVcf4V+D7CGsr5q3eC2u
	FmjQbwn9Ps2yISt6NKiUlON5Z9NG4XzY4ukvwiYH4mHwbolhodSMFRAj62tKHSVCGepd
	CxxfaY+/SFNnipwFGsdcC6wYKzqIlqj7ShuTgfxkSeYBJJjaJAW0VHewXbRxT9m9W9vq
	ZZZj9i6dVI/8Jis7pEIwZZEXhuAiuwGsQRAgInHcqPeg/Zo+i7/B+yU/6H+zm2DOhjlq
	Tk1jYA25TQwfQHd3RlZL5EPx4znPZVHwyOWub6/+jx2tssE9joFuG0Y4So3avUkr4mu+
	5MSA==
X-Gm-Message-State: AKS2vOwNT6pgsRQtxVmKl7I5ITHEMMHR0p8O21uGW+1G403UIUEcBJIJ
	u0SZMxmESKt3uc52
X-Received: by 10.84.236.76 with SMTP id h12mr16187092pln.10.1498712356031;
	Wed, 28 Jun 2017 21:59:16 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm1831468pfl.41.2017.06.28.21.59.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 21:59:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2017 21:59:03 -0700
Message-Id: <9daff9b7a42e6804e9e31f0175b5167144852b83.1498712182.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498712182.git.raj.khem@gmail.com>
References: <cover.1498712182.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] strace: upgrade to 4.17
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
X-List-Received-Date: Thu, 29 Jun 2017 04:59:15 -0000

Fix build with upcoming glibc 2.26

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...8-replace-struct-ucontext-with-ucontext_t.patch | 31 ++++++++++++++++++++++
 .../strace/strace/Makefile-ptest.patch             | 19 ++++++++-----
 .../strace/{strace_4.16.bb => strace_4.17.bb}      |  5 ++--
 3 files changed, 47 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace/0008-replace-struct-ucontext-with-ucontext_t.patch
 rename meta/recipes-devtools/strace/{strace_4.16.bb => strace_4.17.bb} (87%)

diff --git a/meta/recipes-devtools/strace/strace/0008-replace-struct-ucontext-with-ucontext_t.patch b/meta/recipes-devtools/strace/strace/0008-replace-struct-ucontext-with-ucontext_t.patch
new file mode 100644
index 0000000000..1985d8104d
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0008-replace-struct-ucontext-with-ucontext_t.patch
@@ -0,0 +1,31 @@
+From 07f71a12cb88919c6113284fc43bf4967e5e2bc1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 28 Jun 2017 11:36:57 -0700
+Subject: [PATCH 8/8] replace struct ucontext with ucontext_t
+
+glibc >= 2.26 has dropped the tag struct ucontext
+from ucontext_t type
+
+Upstream-Status: Submitted
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ linux/arm/arch_sigreturn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/linux/arm/arch_sigreturn.c b/linux/arm/arch_sigreturn.c
+index b60dad8..a2b7100 100644
+--- a/linux/arm/arch_sigreturn.c
++++ b/linux/arm/arch_sigreturn.c
+@@ -9,7 +9,7 @@ arch_sigreturn(struct tcb *tcp)
+ #ifdef AARCH64
+ 		tcp->currpers == 0 ?
+ 			(*aarch64_sp_ptr + SIZEOF_STRUCT_SIGINFO +
+-			 offsetof(struct ucontext, uc_sigmask)) :
++			 offsetof(ucontext_t, uc_sigmask)) :
+ #endif
+ 			(*arm_sp_ptr +
+ 			 OFFSETOF_STRUCT_UCONTEXT_UC_SIGMASK);
+-- 
+2.13.2
+
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 876c2d8629..07ea0b37f2 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,19 +1,23 @@
-strace: Add ptest
+From 0574ae9926308dcbca78bd8cd0f0f143f19cbcb5 Mon Sep 17 00:00:00 2001
+From: Gabriel Barbu <gabriel.barbu@enea.com>
+Date: Thu, 25 Jul 2013 15:28:33 +0200
+Subject: [PATCH 4/8] strace: Add ptest
 
 Upstream-Status: Inappropriate
 
 Signed-off-by: Gabriel Barbu <gabriel.barbu@enea.com>
 Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+
 ---
  configure.ac      |  2 +-
  tests/Makefile.am | 18 ++++++++++++++++++
  2 files changed, 19 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index b2b03c6..464a9dc 100644
+index 61d6425..6387c24 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -39,7 +39,7 @@ AC_COPYRIGHT([Copyright (C) 1999-2017 The strace developers.])
+@@ -41,7 +41,7 @@ AC_COPYRIGHT([Copyright (C) 1999-]copyright_year[ The strace developers.])
  AC_CONFIG_SRCDIR([strace.c])
  AC_CONFIG_AUX_DIR([.])
  AC_CONFIG_HEADERS([config.h])
@@ -23,11 +27,11 @@ index b2b03c6..464a9dc 100644
  AM_MAINTAINER_MODE
  AC_CANONICAL_HOST
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 311d3bb..72f9022 100644
+index 5aa7f89..a55a355 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -960,3 +960,21 @@ $(objects): scno.h
- CLEANFILES = ksysent.h $(TESTS:=.tmp)
+@@ -379,3 +379,21 @@ clean-local-check:
+ CLEANFILES = ksysent.h
  
  include ../scno.am
 +
@@ -48,3 +52,6 @@ index 311d3bb..72f9022 100644
 +		sed -i -e 's/$${srcdir=.}/./g' $(DESTDIR)/$(TESTDIR)/$$file; \
 +	done
 +	for i in net net-fd scm_rights-fd sigaction; do sed -i -e 's/$$srcdir/./g' $(DESTDIR)/$(TESTDIR)/$$i.test; done
+-- 
+2.13.2
+
diff --git a/meta/recipes-devtools/strace/strace_4.16.bb b/meta/recipes-devtools/strace/strace_4.17.bb
similarity index 87%
rename from meta/recipes-devtools/strace/strace_4.16.bb
rename to meta/recipes-devtools/strace/strace_4.17.bb
index b6cd2ac9b9..72fa994489 100644
--- a/meta/recipes-devtools/strace/strace_4.16.bb
+++ b/meta/recipes-devtools/strace/strace_4.17.bb
@@ -13,10 +13,11 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch \
            file://mips-SIGEMT.patch \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
+           file://0008-replace-struct-ucontext-with-ucontext_t.patch \
            "
 
-SRC_URI[md5sum] = "2873366cac98770efcbed6e748d5ef23"
-SRC_URI[sha256sum] = "98487cb5178ec1259986cc9f6e2a844f50e5d1208c112cc22431a1e4d9adf0ef"
+SRC_URI[md5sum] = "8d7eb10eba68bad83a269197e634b626"
+SRC_URI[sha256sum] = "81f35b085fbb3cfa806eb521a8522ac3406deaccfe121ce35064bad268237419"
 
 inherit autotools ptest bluetooth
 
-- 
2.13.2


