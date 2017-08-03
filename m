Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3368872F2A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Aug 2017 14:03:33 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id t86so1605482pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Aug 2017 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8e8zyWBw9wrmhEI93peVbUOv0GqkEf33GhaFImZerr4=;
	b=YB6Hr+SwUJ4sFc1itexPRJ/B2C1ZpIIDE7Krh9n6R9ZX4kE01GhS6su3chEGzVR6W7
	PKIWnQhIQ/yxxLsoUWWJfOaFyOHqUS0P1WubjIjHJ8svyuB7f29cXE2J+3fS0r0XsjF8
	qOP7BNBByqfn/5k3MVx0ubnus7L5BySgxsDeLLbl5I9bfGSfo/r3e6MpZ+rIRTusVN3/
	pp5WGU3Bk6NBaUBpH6EbVABaISpqvK5j2x9Mda9hrAVcGiK5/z2VJtvNRddKlfjhLRMw
	rCBCOJQvcHH8vUcR4QlF4B8Ybl8GAfK1mV+ogwk/1m4NytjtDT0dKhRzddHx7sPdLZnT
	Rmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8e8zyWBw9wrmhEI93peVbUOv0GqkEf33GhaFImZerr4=;
	b=gc179B3qG3pPzDZxmymU/nQQrHoWabKD6F0fL0Ke2FnFzsFnoezY6WVwdKJAu1vQa9
	7tR7x8FllXyfx0e4QWx9P4/BtXplTLgzowPxmrrYJHLuFw4n8Qb1jl9KuCm6bGff/+N2
	A533Rzt2zdbmIv9Cz7Xyv4Qx7UCdidHR3E87nfIw1wV7z0+iWRROm3JsE9fepZNQbXZV
	OhLhhvzfJW59BCxI/UZBG4B4vn24JLAOiLWb+gOt284rq3Py0W7t5I3gF5pKKeWWv6Tb
	paUVO1m3BfTfrFPXCux/nn0i3a9AnPu1jdL5QGChzNOt5VD9w5k9fwW0V76w9+2kuu2d
	UeYw==
X-Gm-Message-State: AIVw113cu1kUU2fa8gAN9+tI/Oxbr9ZEVq1A1xdTMNpsNqTKSjVxoRby
	LruZrkTt0RZJNC5x
X-Received: by 10.84.228.215 with SMTP id y23mr2012102pli.358.1501769014944;
	Thu, 03 Aug 2017 07:03:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	p10sm15894175pfk.103.2017.08.03.07.03.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 07:03:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Aug 2017 07:03:20 -0700
Message-Id: <20170803140320.21404-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170803140320.21404-1-raj.khem@gmail.com>
References: <20170803140320.21404-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] glibc: Upgrade to 2.26 final release
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
X-List-Received-Date: Thu, 03 Aug 2017 14:03:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc        |  2 +-
 ...e_2.25.90.bb => cross-localedef-native_2.26.bb} |  5 +-
 ...bc-initial_2.25.90.bb => glibc-initial_2.26.bb} |  0
 ...libc-locale_2.25.90.bb => glibc-locale_2.26.bb} |  0
 ...libc-mtrace_2.25.90.bb => glibc-mtrace_2.26.bb} |  0
 ...bc-scripts_2.25.90.bb => glibc-scripts_2.26.bb} |  0
 ...ress-pedantic-warning-caused-by-statement.patch | 90 ++++++++++++++++++++++
 .../glibc/{glibc_2.25.90.bb => glibc_2.26.bb}      |  6 +-
 8 files changed, 96 insertions(+), 7 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.25.90.bb => cross-localedef-native_2.26.bb} (94%)
 rename meta/recipes-core/glibc/{glibc-initial_2.25.90.bb => glibc-initial_2.26.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.25.90.bb => glibc-locale_2.26.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.25.90.bb => glibc-mtrace_2.26.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.25.90.bb => glibc-scripts_2.26.bb} (100%)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-assert-Suppress-pedantic-warning-caused-by-statement.patch
 rename meta/recipes-core/glibc/{glibc_2.25.90.bb => glibc_2.26.bb} (96%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 8ffb8ad046..2754136405 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ GCCVERSION ?= "7.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.28%"
 GDBVERSION ?= "8.0%"
-GLIBCVERSION ?= "2.25%"
+GLIBCVERSION ?= "2.26%"
 LINUXLIBCVERSION ?= "4.10%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb b/meta/recipes-core/glibc/cross-localedef-native_2.26.bb
similarity index 94%
rename from meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.26.bb
index 5dd0c70400..fc5d70dbb9 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.26.bb
@@ -17,12 +17,11 @@ inherit autotools
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${PN}:${FILE_DIRNAME}/glibc:"
 
-#SRCBRANCH ?= "release/${PV}/master"
-SRCBRANCH ?= "master"
+SRCBRANCH ?= "release/${PV}/master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRCREV_glibc ?= "43a9f537fc121a867981ca31ea9d79f33ce0fd24"
+SRCREV_glibc ?= "1c9a5c270d8b66f30dcfaf1cb2d6cf39d3e18369"
 SRCREV_localedef ?= "dfb4afe551c6c6e94f9cc85417bd1f582168c843"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
diff --git a/meta/recipes-core/glibc/glibc-initial_2.25.90.bb b/meta/recipes-core/glibc/glibc-initial_2.26.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-initial_2.25.90.bb
rename to meta/recipes-core/glibc/glibc-initial_2.26.bb
diff --git a/meta/recipes-core/glibc/glibc-locale_2.25.90.bb b/meta/recipes-core/glibc/glibc-locale_2.26.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.25.90.bb
rename to meta/recipes-core/glibc/glibc-locale_2.26.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.25.90.bb b/meta/recipes-core/glibc/glibc-mtrace_2.26.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.25.90.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.26.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.25.90.bb b/meta/recipes-core/glibc/glibc-scripts_2.26.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.25.90.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.26.bb
diff --git a/meta/recipes-core/glibc/glibc/0026-assert-Suppress-pedantic-warning-caused-by-statement.patch b/meta/recipes-core/glibc/glibc/0026-assert-Suppress-pedantic-warning-caused-by-statement.patch
new file mode 100644
index 0000000000..b2bb96b818
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-assert-Suppress-pedantic-warning-caused-by-statement.patch
@@ -0,0 +1,90 @@
+From 037283cbc74739b72f36dfec827d120faa243406 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer at redhat dot com>
+Date: Thu, 6 Jul 2017 11:50:55 +0200
+Subject: [PATCH 26/26] assert: Suppress pedantic warning caused by statement
+ expression [BZ# 21242]
+
+On 07/05/2017 10:15 PM, Zack Weinberg wrote:
+> On Wed, Jul 5, 2017 at 11:51 AM, Florian Weimer <fweimer@redhat.com> wrote:
+>> On 07/05/2017 05:46 PM, Zack Weinberg wrote:
+>>> A problem occurs to me: expressions involving VLAs _are_ evaluated
+>>> inside sizeof.
+>>
+>> The type of the sizeof argument would still be int (due to the
+>> comparison against 0), so this doesn't actually occur.
+>
+> I rechecked what C99 says about sizeof and VLAs, and you're right -
+> the operand of sizeof is only evaluated when sizeof is _directly_
+> applied to a VLA.  So this is indeed safe, but I think this wrinkle
+> should be mentioned in the comment.  Perhaps
+>
+> /* The first occurrence of EXPR is not evaluated due to the sizeof,
+>    but will trigger any pedantic warnings masked by the __extension__
+>    for the second occurrence.  The explicit comparison against zero
+>    ensures that sizeof is not directly applied to a function pointer or
+>    bit-field (which would be ill-formed) or VLA (which would be evaluated).  */
+>
+> zw
+
+What about the attached patch?
+
+Siddhesh, is this okay during the freeze?  I'd like to backport it to
+2.25 as well.
+
+Thanks,
+Florian
+
+assert: Suppress pedantic warning caused by statement expression
+
+2017-07-06  Florian Weimer  <fweimer@redhat.com>
+
+	[BZ #21242]
+	* assert/assert.h [__GNUC__ && !__STRICT_ANSI__] (assert):
+	Suppress pedantic warning resulting from statement expression.
+	(__ASSERT_FUNCTION): Add missing __extendsion__.
+---
+
+Upstream-Status: Submitted
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ assert/assert.h | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/assert/assert.h b/assert/assert.h
+index 22f019537c..6801cfeb10 100644
+--- a/assert/assert.h
++++ b/assert/assert.h
+@@ -91,13 +91,19 @@ __END_DECLS
+      ? __ASSERT_VOID_CAST (0)						\
+      : __assert_fail (#expr, __FILE__, __LINE__, __ASSERT_FUNCTION))
+ # else
++/* The first occurrence of EXPR is not evaluated due to the sizeof,
++   but will trigger any pedantic warnings masked by the __extension__
++   for the second occurrence.  The explicit comparison against zero is
++   required to support function pointers and bit fields in this
++   context, and to suppress the evaluation of variable length
++   arrays.  */
+ #  define assert(expr)							\
+-    ({									\
++  ((void) sizeof ((expr) == 0), __extension__ ({			\
+       if (expr)								\
+         ; /* empty */							\
+       else								\
+         __assert_fail (#expr, __FILE__, __LINE__, __ASSERT_FUNCTION);	\
+-    })
++    }))
+ # endif
+ 
+ # ifdef	__USE_GNU
+@@ -113,7 +119,7 @@ __END_DECLS
+    C9x has a similar variable called __func__, but prefer the GCC one since
+    it demangles C++ function names.  */
+ # if defined __cplusplus ? __GNUC_PREREQ (2, 6) : __GNUC_PREREQ (2, 4)
+-#   define __ASSERT_FUNCTION	__PRETTY_FUNCTION__
++#   define __ASSERT_FUNCTION	__extension__ __PRETTY_FUNCTION__
+ # else
+ #  if defined __STDC_VERSION__ && __STDC_VERSION__ >= 199901L
+ #   define __ASSERT_FUNCTION	__func__
+-- 
+2.13.3
+
diff --git a/meta/recipes-core/glibc/glibc_2.25.90.bb b/meta/recipes-core/glibc/glibc_2.26.bb
similarity index 96%
rename from meta/recipes-core/glibc/glibc_2.25.90.bb
rename to meta/recipes-core/glibc/glibc_2.26.bb
index caf1ff4138..d453d8f9bf 100644
--- a/meta/recipes-core/glibc/glibc_2.25.90.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native"
 
-SRCREV ?= "43a9f537fc121a867981ca31ea9d79f33ce0fd24"
+SRCREV ?= "1c9a5c270d8b66f30dcfaf1cb2d6cf39d3e18369"
 
-#SRCBRANCH ?= "release/${PV}/master"
-SRCBRANCH ?= "master"
+SRCBRANCH ?= "release/${PV}/master"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
@@ -41,6 +40,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
            file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
+           file://0026-assert-Suppress-pedantic-warning-caused-by-statement.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.13.3


