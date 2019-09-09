Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6F77F7E502
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 02:33:34 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id y22so8196661pfr.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Sep 2019 19:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oufakECOSinH3aLK+D9L6oaYWFeFJKJSaheduPrYEKs=;
	b=Sp6tk342jzna2dPu78jwUCKdgZLVxS3a5Rw17JqTvnzEKjKD5dYWnY3Qc9btZLvJ1r
	eFbbrrvwXWCE9dS6Obj6MwnibUcDHb38RLBcw4O+h5T6iJMqTYTUvanRciBIVlqnSIw4
	8mvQNXvpX0AGcjioarZ2KybwSohj3IBQx8Mf2+jSCrLI9/mC1ccTG8JvwmBjV/1Lne7S
	GwMOqDX56ZdGXvbID31Ah9Q1Ik2SCd/fDDocMqeGn3hBc3PdckCVEQ258AOqMnAkyvVC
	snfabekGh/z9zld+vviKlzNF1QUGHL1d4oUFw1JD5LHA8LhbaYcnkF2f9yrxRagoxXqZ
	qldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oufakECOSinH3aLK+D9L6oaYWFeFJKJSaheduPrYEKs=;
	b=elVa3HiK9dZlxB9KoWd+nk3katHYXpr7oVYJR6U4Jpu2Uis4HE6eik9w8vDyaw8D4j
	Q2a7j/NgaM+NaH6HA7Zptf9sF9fRPFHXIk1ojJCoa1h70CG0ucw8Xwr9p2RahHBxnRy2
	gX39PHNMQi3nM1WxmpWThnQ3q/x04l22IdKIoLl9/EoKESZwIXmRgZ/KvqG7Yu5WKmu1
	q1nizHzhl9HWUGbIJTwW1EwzzBfoCN1vNjbZfya8mJm0HdiOnB7DjN3Gt0VyxpTiytwY
	RIIKKNCAelAok3jDgreon9riJwJlM17WTdOlatM9Ciz6TyosWQNWU4b/OeRbjh4sXDFp
	d6aw==
X-Gm-Message-State: APjAAAXF/W1/EGo0DxR+w1z/AkUzu7LK4zz9Aklj4PBMBfnlaMHZ31sz
	Ib7xsY2PwhvNWFGuH+8ES9+j+vgIAdU=
X-Google-Smtp-Source: APXvYqxRI2yQOLSvfvswomVUr2PmObefmBkxttysCC1nu+90mz1YAQvbLyX65t3WdlxsaqjbxAOzEg==
X-Received: by 2002:a17:90a:340d:: with SMTP id
	o13mr22568376pjb.19.1567996414911; 
	Sun, 08 Sep 2019 19:33:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	d10sm14645284pfh.8.2019.09.08.19.33.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Sep 2019 19:33:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Sep 2019 19:33:26 -0700
Message-Id: <20190909023326.1742188-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] ptrace: Drop ptrace aid for musl/ppc
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
X-List-Received-Date: Mon, 09 Sep 2019 02:33:34 -0000
Content-Transfer-Encoding: 8bit

This has been fixed and is no longer needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sing-non-glibc-libc-implementation-o.patch | 31 -------------------
 meta/recipes-devtools/strace/strace_5.2.bb    |  1 -
 2 files changed, 32 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch b/meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch
deleted file mode 100644
index fb5f72529f..0000000000
--- a/meta/recipes-devtools/strace/strace/0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From af1fdce78bff4343f3c84ea118abdc3c739fc646 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Apr 2016 16:23:56 +0000
-Subject: [PATCH] Fix build when using non-glibc libc implementation on ppc
-
-glibc includes the kernel header into its own header for macros
-musl does not
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- ptrace.h | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
---- a/ptrace.h
-+++ b/ptrace.h
-@@ -30,7 +30,13 @@
- #  define ptrace_peeksiginfo_args XXX_ptrace_peeksiginfo_args
- # endif
- 
-+#if defined(POWERPC) && !defined(__GLIBC__)
-+#define pt_regs uapi_pt_regs
-+#endif
- # include <linux/ptrace.h>
-+#if defined(POWERPC) && !defined(__GLIBC__)
-+# undef pt_regs
-+#endif
- 
- # ifdef HAVE_STRUCT_IA64_FPREG
- #  undef ia64_fpreg
diff --git a/meta/recipes-devtools/strace/strace_5.2.bb b/meta/recipes-devtools/strace/strace_5.2.bb
index 8367bf1a4f..a16c3b8598 100644
--- a/meta/recipes-devtools/strace/strace_5.2.bb
+++ b/meta/recipes-devtools/strace/strace_5.2.bb
@@ -10,7 +10,6 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://update-gawk-paths.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
-           file://0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch \
            file://mips-SIGEMT.patch \
            file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
            file://0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch \
-- 
2.23.0


