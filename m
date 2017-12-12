Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4DAA3788C2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 17:23:31 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id b11so13841776pgu.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wGAlJVKDpPYbDwXuPywFoI9eeNBuP1xbjZJ46vrP6uU=;
	b=f/NWS7zY9BPOJThTKzcGN/c/ZggKLszmE4nCs7/zyG5DgGGPpOO++Dabx4PH2TxO0d
	jDCbEvdw78pf0hrCQv3a6zfOVW1s2mm/q3tMV37Ke+H3GOqgGoDeNlQ9tjRCiNzXHW7n
	YkieXdAbmPjDEs+fV0Z+0XO40RuXuBiQThGkpe0bJW/nOzqtt3DHUcSD6npYB01GRVuS
	+qBC695wp/C30k4d0eszZi31OwnwwueD5JEAtkYShbhDPVzPCLDo4vjSCv9JIDCg5cHF
	Ugc4QgP7xhtFmH1C5JOhEB60Srj8PzRNpvWPQpwRtrcXNCqDXy+EAGFWx7xAb9J68YVH
	vM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wGAlJVKDpPYbDwXuPywFoI9eeNBuP1xbjZJ46vrP6uU=;
	b=WfF+A2PhwFqYunGvQLNC2w7ieuXYQNldYoz6YL0ANW18jgvQf0BmzZutON5YRV4OFj
	A3Bb7Ky4RISeyMtjUmhtGwt6YubxWNYgZ87Ibf09SrJBIdOpPxDtsCKBxAuBA2GcyUaf
	rPFWerYm/Mo7jLpcvIqKhxE05Tvgm6pa0TP1fYKjO+ty9IPulumXM3quMttrzAzOmz1N
	Nm5+kreSK5pDeNOSEoY0P423r6rt2Rfp2Wd652m+e8bMKkWb8Z6+bs7JuzhxkMnTbjl2
	bSP4rKycIHfC6wteyJ4CLyhvLkDqdBVmrVaOJqh7v1EBI/A3plkghgn+NXbq2tfHPZke
	jOcA==
X-Gm-Message-State: AKGB3mLooNfp6ymfFsTBt3sR8vln/vAq3/NFqlDbrP5ZK5Kc/uR2TRXR
	sd3HcgTPsUFZiLIN2fa+1V53Dg==
X-Google-Smtp-Source: ACJfBotY2J0sd9eoZQFDyf2doeKUrL53rQdO3IWYCpYS5e7+4HKtwCa7OqGeyHXBdtkBcNHw9SUaTA==
X-Received: by 10.99.109.193 with SMTP id i184mr2662163pgc.187.1513099412977; 
	Tue, 12 Dec 2017 09:23:32 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::c579])
	by smtp.gmail.com with ESMTPSA id
	k197sm18790329pga.42.2017.12.12.09.23.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 09:23:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 09:23:15 -0800
Message-Id: <20171212172317.601-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171212172317.601-1-raj.khem@gmail.com>
References: <20171212172317.601-1-raj.khem@gmail.com>
Subject: [PATCH 7/9] glibc: Upgrade to latest on 2.26 release
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
X-List-Received-Date: Tue, 12 Dec 2017 17:23:32 -0000

For detailed view of changes see
https://github.com/kraj/glibc/compare/glibc-2.26...77f921dac17c5fa99bd9e926d926c327982895f7

drop upstreamed 1 patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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
2.15.1


