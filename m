Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0073E71B1D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:00:42 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id q85so9588416pfq.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=p0k3vntQR24Bwv6s5fHxRN4/XRkVBCiBzWpjxxZndmU=;
	b=MPBPqNvbxvjS+7knCKLvshS7L3StJFt1JvPCFUx4wsOTnLC+1eRd7mYM3UBEnwwSaG
	3YOoxGTrV0QhHeXG0Dkc71FDg22hHnNACmatLaGhhN+AilDRW0oPQoPyYdQhpvPO4FPL
	kObB5iu+B2TyM3hrqkfe1Eq+rnzflw5MSrsFyReo515s/chYTEQxbTl/+qPQjfEzWXvm
	uWTMa0XYOWo4MQJpx/IBlp1tjKGZgy0SMyZsVXXxvjSL7EIXJ+w41R4yuQYwjGOo3vZF
	NBRa5kTETVH0HYvU77SJUUHMSPvtaBKnF1RLppJieYKKXtetw9YUoI2yK2gWyuZ2L6F4
	pGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=p0k3vntQR24Bwv6s5fHxRN4/XRkVBCiBzWpjxxZndmU=;
	b=Zkw4x5V2cIFrgdoVaF0qZa7tljCEmDf7I4cjfEsy9FO6lD9wJh8MbxsiRfoBmWSGs2
	d2OXkzA1/WAjFpsTbs01oosQdhzSu/sJuib4krffzpSI3yYh6zvgf5rZIlqSG9AmV/hg
	giqDb2cuX+SLT+RV7yoSlsUlqgqORdMjPMpnDCbsWQ+M/RIYO/MGlrLWpc9Ndfsr7ud0
	8Cc+Y0fGeW7P5nXWhLWH/HL2TRQZH4GJVO0hxZ+ucG+6KKaK+yrUrSKonUBDivc7Tss7
	5JuhIeyJogKw28zfguss3kj286IaqVU/a8gujnFPwriMWBxRCUeStOCW6d92iUydrETr
	DAMw==
X-Gm-Message-State: AIVw110i42x6B3p1VCOfxGXkbm/DCGXynbUGYHYdHTdXLmPmaUVjtzl8
	QwZdbiAiiO+l9aOa
X-Received: by 10.98.18.69 with SMTP id a66mr3231411pfj.33.1500008443247;
	Thu, 13 Jul 2017 22:00:43 -0700 (PDT)
Received: from ip-172-31-1-64.ap-northeast-2.compute.internal
	(ec2-13-124-121-69.ap-northeast-2.compute.amazonaws.com.
	[13.124.121.69]) by smtp.gmail.com with ESMTPSA id
	s9sm15533802pfe.67.2017.07.13.22.00.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Jul 2017 22:00:42 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jul 2017 05:00:35 +0000
Message-Id: <1500008435-6588-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: namhyung@gmail.com
Subject: [PATCH] uftrace: Add recipe
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
X-List-Received-Date: Fri, 14 Jul 2017 05:00:43 -0000

- Add recipe for uftrace v0.7.
- Support x86_64, arm (v6 or later), and aarch64.
- Disable for armv4 and armv5 in arm architecture which is only
  supported armv6 or later.
- Attached 2 patches is merged to upstream.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../0001-Makefile-Add-LDFLAGS-in-export.patch      | 31 +++++++++++++++++++
 ...tils-Add-limits-header-to-fix-build-error.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/uftrace/uftrace_0.7.bb       | 35 ++++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch
 create mode 100644 meta/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch
 create mode 100644 meta/recipes-devtools/uftrace/uftrace_0.7.bb

diff --git a/meta/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch b/meta/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch
new file mode 100644
index 0000000..f665051
--- /dev/null
+++ b/meta/recipes-devtools/uftrace/uftrace/0001-Makefile-Add-LDFLAGS-in-export.patch
@@ -0,0 +1,31 @@
+From ec794945475d5792f2ae85afe461e64266613640 Mon Sep 17 00:00:00 2001
+From: Changhyeok Bae <changhyeok.bae@gmail.com>
+Date: Thu, 13 Jul 2017 16:44:52 +0900
+Subject: [PATCH 1/2] Makefile: Add LDFLAGS in export
+
+To use build with musl, need to argp library.
+So need to add LDFLAGS from outside.
+
+Upstream-Status: Accepted
+
+Signed-off-by: <Changhyeok Bae changhyeok.bae@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 67be2da..0ca649a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -48,7 +48,7 @@ endif
+ RM = rm -f
+ INSTALL = install
+ 
+-export ARCH CC AR LD RM srcdir objdir
++export ARCH CC AR LD RM srcdir objdir LDFLAGS
+ 
+ COMMON_CFLAGS := -O2 -g -D_GNU_SOURCE $(CFLAGS) $(CPPFLAGS)
+ COMMON_CFLAGS +=  -iquote $(srcdir) -iquote $(objdir) -iquote $(srcdir)/arch/$(ARCH)
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch b/meta/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch
new file mode 100644
index 0000000..2690011
--- /dev/null
+++ b/meta/recipes-devtools/uftrace/uftrace/0002-utils-Add-limits-header-to-fix-build-error.patch
@@ -0,0 +1,31 @@
+From 3bda554766150705160fe2191d8761c7881e2433 Mon Sep 17 00:00:00 2001
+From: Changhyeok Bae <changhyeok.bae@gmail.com>
+Date: Thu, 13 Jul 2017 16:46:20 +0900
+Subject: [PATCH 2/2] utils: Add limits header to fix build error
+
+[Error]
+error: 'PATH_MAX' undeclared (first use in this function); did you mean
+'INT8_MAX'?
+
+Upstream-Status: Accepted
+
+Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
+---
+ utils/utils.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils/utils.c b/utils/utils.c
+index 03522c9..30f9e81 100644
+--- a/utils/utils.c
++++ b/utils/utils.c
+@@ -6,6 +6,7 @@
+ #include <errno.h>
+ #include <sys/uio.h>
+ #include <sys/stat.h>
++#include <limits.h>
+ 
+ #include "utils/utils.h"
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/uftrace/uftrace_0.7.bb b/meta/recipes-devtools/uftrace/uftrace_0.7.bb
new file mode 100644
index 0000000..821d0bb
--- /dev/null
+++ b/meta/recipes-devtools/uftrace/uftrace_0.7.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Trace and analyze execution of a program written in C/C++"
+HOMEPAGE = "https://github.com/namhyung/uftrace"
+BUGTRACKER = "https://github.com/namhyung/uftrace/issues"
+SECTION = "devel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "elfutils"
+DEPENDS_append_libc-musl = " argp-standalone"
+
+inherit autotools
+
+SRCREV = "712ad01fdde57893936d7e254451eec67ab41ca6"
+SRC_URI = "\
+    git://github.com/namhyung/${BPN} \
+    file://0001-Makefile-Add-LDFLAGS-in-export.patch \
+    file://0002-utils-Add-limits-header-to-fix-build-error.patch \
+"
+S = "${WORKDIR}/git"
+
+LDFLAGS_append_libc-musl = " -largp"
+EXTRA_OECONF = "ARCH=${TARGET_ARCH}"
+
+do_configure() {
+    ${S}/configure ${EXTRA_OECONF}
+}
+
+FILES_SOLIBSDEV = ""
+FILES_${PN} += "${libdir}/*.so"
+
+COMPATIBLE_HOST = "(x86_64|aarch64|arm)"
+
+# uftrace supports armv6 and above
+COMPATIBLE_HOST_armv4 = 'null'
+COMPATIBLE_HOST_armv5 = 'null'
-- 
2.7.4


