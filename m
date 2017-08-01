Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E3D247829F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 16:34:51 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c65so2944529pfl.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=B1U+qf73iQwzBEvec+Y3uJh8ZDzGONIQryVpt3WdJDI=;
	b=IeQ/Prv5jBvzaRqX/PJyQFT+8a4jkSHBrLP38noWWcHlaqKv2UfeTihzFRDT2rSqib
	N27OTFL4mP7Fo6SAcR3wPJXYI4G3QUhalxukm/rHNADF6roJQr5EAo8ARHGOqD33RQTe
	QitDrsKykrz4iAKn02jbrd49zp+x02eWLQNOFE49HsXpqJ4HBtSp9i54USQAm0SQcZ49
	4d1brw5MRO6QIrmYqGXpS6C8+vZCi8q0yuGZCTrf9tpwm/VMQfWRIZR78fVmOs+BT+Up
	2Mu9UwfDA7HTncj5crJZCIElz3jXkF4YUtGydS9YKNWZiubNTpHjxkhC6CnU0ASWZM7m
	+YSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=B1U+qf73iQwzBEvec+Y3uJh8ZDzGONIQryVpt3WdJDI=;
	b=j+dKHAsMA3+eLBZrDHr7BHUnpE+Me66t7CMfBK5u4BjNZkrAGb3zEy8TpjwjcN9A7e
	iJ3A3kzUlX4BaX22UdhV9InnPQtNFhcX4pk6wGC85/eDWZPJDLf2Lz2F91y9LmYv/1P0
	lZi0QyP+2sfV1ILLi50vmg6sj0mibN47CLVnUgHRs7eOMwPQrFG7HMykHHeKbKASWVFd
	wrzSmFuH4v9mvvTdpfmtUVCBOviA0/gko3sPQ/TOeTRTdnWVhiZPVkvnYJ/eJUu/VGq/
	nDvRsRg/42gmTmABgWjstDL/GDyRIyXq9t946bhC2VmRFJ5vgKXCBkBwOcT/TtI1qvFl
	rIow==
X-Gm-Message-State: AIVw111puOKOiD/d22G4dTI3qfWrz3LgsR/KrN6e0uLAsdbJmVvVGx5A
	YjK/XXnGCe7pWss6
X-Received: by 10.84.210.203 with SMTP id a69mr21517093pli.397.1501605292763; 
	Tue, 01 Aug 2017 09:34:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	s11sm56559492pgr.53.2017.08.01.09.34.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 09:34:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Aug 2017 09:34:43 -0700
Message-Id: <20170801163443.10899-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH] glibc: Update to latest on 2.26 pre-release
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
X-List-Received-Date: Tue, 01 Aug 2017 16:34:52 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glibc/cross-localedef-native_2.25.90.bb        |  2 +-
 ...ress-pedantic-warning-caused-by-statement.patch | 90 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.25.90.bb           |  3 +-
 3 files changed, 93 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-assert-Suppress-pedantic-warning-caused-by-statement.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb b/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
index 5dd0c70400..6d84e52380 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
@@ -22,7 +22,7 @@ SRCBRANCH ?= "master"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
 
-SRCREV_glibc ?= "43a9f537fc121a867981ca31ea9d79f33ce0fd24"
+SRCREV_glibc ?= "930324b356778b985d26f30fd0386163852a35fe"
 SRCREV_localedef ?= "dfb4afe551c6c6e94f9cc85417bd1f582168c843"
 
 SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
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
diff --git a/meta/recipes-core/glibc/glibc_2.25.90.bb b/meta/recipes-core/glibc/glibc_2.25.90.bb
index caf1ff4138..6f373520bb 100644
--- a/meta/recipes-core/glibc/glibc_2.25.90.bb
+++ b/meta/recipes-core/glibc/glibc_2.25.90.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
 
 DEPENDS += "gperf-native"
 
-SRCREV ?= "43a9f537fc121a867981ca31ea9d79f33ce0fd24"
+SRCREV ?= "930324b356778b985d26f30fd0386163852a35fe"
 
 #SRCBRANCH ?= "release/${PV}/master"
 SRCBRANCH ?= "master"
@@ -41,6 +41,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
            file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
+           file://0026-assert-Suppress-pedantic-warning-caused-by-statement.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
2.13.3


