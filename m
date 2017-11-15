Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 08BDA784AD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 03:28:43 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id p44so20957954qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=TxTFNeWsf8txxTE58UeBVsfEPqFzrM63ZbtyGRkmdNk=;
	b=oLfB468lAsTdbYGfhzz47Hf8j9ZQP/0/gDzKdiob/n1Uqrf2d5UNNHky9fkk0gLShm
	STPaGd0bg6Dut96ZRITp52nQ72E8PR8WSWJypyC8eCknDrRQNdwZ9ln4MdZnE6mNRzWW
	acXX8phfexI+i27z3qc3qZg++vwBvM7M2Cf0OoQIM1WEVSufAdeSFFMgn2EYVgi041ye
	xmt1NHJiorH3TNonJW2ggoOgl1kPVv36nmDjGb5wY0mzqobk8yjOnK0KbicwWYDviryy
	j5xSkW9AtJVsMP9tZylcYJaT77naK0FhKqKo13KexvDE4gxCfPnn8Gx45mNfi53PK1hM
	fv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TxTFNeWsf8txxTE58UeBVsfEPqFzrM63ZbtyGRkmdNk=;
	b=GjFY9wkyE5VqFbOG3UuwBoktT8vIeSDFkMq81dCfox/Ztdn5v7k7TVKTiDKZ2YqI4D
	K89S4DYJgXI7VD9s4vBtP1q8wS5/BUKvwR5abTOhe1+TX9COOMygx/41Bz/zTHasYliU
	nkeMB0JFUrvG6aUIqCh7AF/+UE76FtbpX+L9cdjzuz0JMqmxZT+5fsvjx3CvR7pPv/6b
	P0ziWQvazK43vr9JhvDmeCKaTK/PsqDhOA0EzuFkttiO9JmK7KJ6WBUDnHFc9elO16di
	a3n/rIdnqepeojkd5sWYS0M+763kOyAVxlOliUGRaGtcyT1B8wmAT/I9Pg8pI7ys0GnK
	QZOg==
X-Gm-Message-State: AJaThX5i2IgKBfuE0H3KPYm5JFrIeJ+uCtgTAwfHxXMPv9LKrz6kVA6i
	iCHURPuujz3tDmh7paW5NjuExQ==
X-Google-Smtp-Source: AGs4zMZ5W3vUgCMdjroWtPsWhlY2R4GMnbSbJsMEdoS91MWqyjFXcam0T6MzPl9l2YNhpwmDdc+8/g==
X-Received: by 10.55.0.149 with SMTP id t21mr2527113qkg.249.1510716524360;
	Tue, 14 Nov 2017 19:28:44 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	p52sm3149924qtc.72.2017.11.14.19.28.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 19:28:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 19:28:35 -0800
Message-Id: <20171115032835.29342-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH V2 8/8] glibc: Upgrade to latest on 2.26 release
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
X-List-Received-Date: Wed, 15 Nov 2017 03:28:44 -0000

For detailed view of changes see
https://github.com/kraj/glibc/compare/glibc-2.26...77f921dac17c5fa99bd9e926d926c327982895f7

drop upstreamed 1 patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---

Changes in v2: Drop upstreamed patch

 ...ress-pedantic-warning-caused-by-statement.patch | 90 ----------------------
 meta/recipes-core/glibc/glibc_2.26.bb              |  3 +-
 2 files changed, 1 insertion(+), 92 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-assert-Suppress-pedantic-warning-caused-by-statement.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-assert-Suppress-pedantic-warning-caused-by-statement.patch b/meta/recipes-core/glibc/glibc/0026-assert-Suppress-pedantic-warning-caused-by-statement.patch
deleted file mode 100644
index b2bb96b818..0000000000
--- a/meta/recipes-core/glibc/glibc/0026-assert-Suppress-pedantic-warning-caused-by-statement.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 037283cbc74739b72f36dfec827d120faa243406 Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer at redhat dot com>
-Date: Thu, 6 Jul 2017 11:50:55 +0200
-Subject: [PATCH 26/26] assert: Suppress pedantic warning caused by statement
- expression [BZ# 21242]
-
-On 07/05/2017 10:15 PM, Zack Weinberg wrote:
-> On Wed, Jul 5, 2017 at 11:51 AM, Florian Weimer <fweimer@redhat.com> wrote:
->> On 07/05/2017 05:46 PM, Zack Weinberg wrote:
->>> A problem occurs to me: expressions involving VLAs _are_ evaluated
->>> inside sizeof.
->>
->> The type of the sizeof argument would still be int (due to the
->> comparison against 0), so this doesn't actually occur.
->
-> I rechecked what C99 says about sizeof and VLAs, and you're right -
-> the operand of sizeof is only evaluated when sizeof is _directly_
-> applied to a VLA.  So this is indeed safe, but I think this wrinkle
-> should be mentioned in the comment.  Perhaps
->
-> /* The first occurrence of EXPR is not evaluated due to the sizeof,
->    but will trigger any pedantic warnings masked by the __extension__
->    for the second occurrence.  The explicit comparison against zero
->    ensures that sizeof is not directly applied to a function pointer or
->    bit-field (which would be ill-formed) or VLA (which would be evaluated).  */
->
-> zw
-
-What about the attached patch?
-
-Siddhesh, is this okay during the freeze?  I'd like to backport it to
-2.25 as well.
-
-Thanks,
-Florian
-
-assert: Suppress pedantic warning caused by statement expression
-
-2017-07-06  Florian Weimer  <fweimer@redhat.com>
-
-	[BZ #21242]
-	* assert/assert.h [__GNUC__ && !__STRICT_ANSI__] (assert):
-	Suppress pedantic warning resulting from statement expression.
-	(__ASSERT_FUNCTION): Add missing __extendsion__.
----
-
-Upstream-Status: Submitted
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- assert/assert.h | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/assert/assert.h b/assert/assert.h
-index 22f019537c..6801cfeb10 100644
---- a/assert/assert.h
-+++ b/assert/assert.h
-@@ -91,13 +91,19 @@ __END_DECLS
-      ? __ASSERT_VOID_CAST (0)						\
-      : __assert_fail (#expr, __FILE__, __LINE__, __ASSERT_FUNCTION))
- # else
-+/* The first occurrence of EXPR is not evaluated due to the sizeof,
-+   but will trigger any pedantic warnings masked by the __extension__
-+   for the second occurrence.  The explicit comparison against zero is
-+   required to support function pointers and bit fields in this
-+   context, and to suppress the evaluation of variable length
-+   arrays.  */
- #  define assert(expr)							\
--    ({									\
-+  ((void) sizeof ((expr) == 0), __extension__ ({			\
-       if (expr)								\
-         ; /* empty */							\
-       else								\
-         __assert_fail (#expr, __FILE__, __LINE__, __ASSERT_FUNCTION);	\
--    })
-+    }))
- # endif
- 
- # ifdef	__USE_GNU
-@@ -113,7 +119,7 @@ __END_DECLS
-    C9x has a similar variable called __func__, but prefer the GCC one since
-    it demangles C++ function names.  */
- # if defined __cplusplus ? __GNUC_PREREQ (2, 6) : __GNUC_PREREQ (2, 4)
--#   define __ASSERT_FUNCTION	__PRETTY_FUNCTION__
-+#   define __ASSERT_FUNCTION	__extension__ __PRETTY_FUNCTION__
- # else
- #  if defined __STDC_VERSION__ && __STDC_VERSION__ >= 199901L
- #   define __ASSERT_FUNCTION	__func__
--- 
-2.13.3
-
diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
index 135ec4fb16..5213a6a942 100644
--- a/meta/recipes-core/glibc/glibc_2.26.bb
+++ b/meta/recipes-core/glibc/glibc_2.26.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native"
 
-SRCREV ?= "1c9a5c270d8b66f30dcfaf1cb2d6cf39d3e18369"
+SRCREV ?= "77f921dac17c5fa99bd9e926d926c327982895f7"
 
 SRCBRANCH ?= "release/${PV}/master"
 
@@ -40,7 +40,6 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
            file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
-           file://0026-assert-Suppress-pedantic-warning-caused-by-statement.patch \
            file://0027-glibc-reset-dl-load-write-lock-after-forking.patch \
            file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
 "
-- 
2.15.0


