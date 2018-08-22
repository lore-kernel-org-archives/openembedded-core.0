Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id DBC8D792B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:17:49 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id s198-v6so2449865oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7mOoyO31zkjB1ka6NIprF8F9E6RJvwZnrvILBcaHkxA=;
	b=leML7YRYiR1rrzh7pPuW8G4zty4rPLGGS14+xqMYMgymIWgzsOclVj35POj5KGh5oy
	JT9vCuExV9/Ty+9ThodJd6ZOcs+AOdXinBJwQMghF7J2R7CY5y63XTcbZVFEKJDlkEkN
	tS65wVJu8f4l7ColnVYUI9sktbz+sRmKLQLRGQfjoQN1j7lqQ1r1W1aYDdNHOi9XMVW4
	RA9c3VHzwN/M2Q2bimRi+vK0y22qUOPwfC3054jWBNCByKBvz352zf9o+EkjEbAFTa3K
	6TfIu7XivrSg2FK9k1dGhgZf+hNyfx8Bt3B+ypBO+R9ArOOrziUtqbOCICHB8lDtaeVt
	DkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7mOoyO31zkjB1ka6NIprF8F9E6RJvwZnrvILBcaHkxA=;
	b=DWuv1lLTnhlt30dDqcKm0bWKYxZ167SA4U9QIqo1vwUn+3p+DKzax9bjcQIJ2HpR/F
	RDnGPzgmmK5EaUs7HF70NM3VajqdVUMGJH9hycatcaYM4d6SpgaxqITqydGuqpgFdqlH
	VuaQI4egoah8TXhARVDbOr5ZQdYBIkmuhKGgvhYXIPpDj5PS9jC6bILVFq1ME8CGf3m3
	onk0cO+m39lpTL7EX8JXnfptF7cYFBLbUDxDLaU45ZkQvTXos7mQJBCkdNgEQmNZJHMP
	GfYk6SX7u9oiVrIHtgV9PddM3kJHsFjJyJogWDS1BqFqyQLLPhOvYkD6aVOlPPhUZjmw
	e7ng==
X-Gm-Message-State: APzg51AoATUfUHwiTLSvp55uUCTLpcch5Fg5cqiZQwgcJ4Lt26iilVx3
	I4Uq7xa53pNkEVmCtTBrR43a6vebFFU=
X-Google-Smtp-Source: ANB0VdZsgxrX9CKViyBlSQuhCdWx+UiEl+9CbCUg3NnkPXijj6oR605O6prJ/tdYQ4vS2mKdVKAghw==
X-Received: by 2002:aca:b1c1:: with SMTP id
	a184-v6mr3177272oif.182.1534936670727; 
	Wed, 22 Aug 2018 04:17:50 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm694446oix.36.2018.08.22.04.17.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:17:50 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:46:50 +0530
Message-Id: <1534936615-11658-14-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
Cc: Ferret on Shark <shark_admin@mvista.co>
Subject: [SUMO][PATCH 14/19] perl: CVE-2018-6913
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
X-List-Received-Date: Wed, 22 Aug 2018 11:17:50 -0000

From: Ferret on Shark <shark_admin@mvista.co>

(perl #131844) fix various space calculation issues in
 pp_pack.c

- for the originally reported case, if the start/cur pointer is in the
  top 75% of the address space the add (cur) + glen addition would
  overflow, resulting in the condition failing incorrectly.

- the addition of the existing space used to the space needed could
  overflow, resulting in too small an allocation and a buffer overflow.

- the scaling for UTF8 could overflow.

- the multiply to calculate the space needed for many items could
  overflow.

For the first case, do a space calculation without making new pointers.

For the other cases, detect the overflow and croak if there's an
overflow.

Originally this used Size_t_MAX as the maximum size of a memory
allocation, but for -DDEBUGGING builds realloc() throws a panic for
allocations over half the address space in size, changing the error
reported for the allocation.

For non-DEBUGGING builds the Size_t_MAX limit has the small chance
of finding a system that has 3GB of contiguous space available, and
allocating that space, which could be a denial of servce in some cases.

Unfortunately changing the limit to half the address space means that
the exact case with the original issue can no longer occur, so the
test is no longer testing against the address + length issue that
caused the original problem, since the allocation is failing earlier.

One option would be to change the test so the size request by pack is
just under 2GB, but this has a higher (but still low) probability that
the system has the address space available, and will actually try to
allocate the memory, so let's not do that.

Note: changed
plan tests => 14713;
to
plan tests => 14712;
in a/t/op/pack.t
to apply this patch on perl 5.24.1.

Affects perl < 5.26.2

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../recipes-devtools/perl/perl/CVE-2018-6913.patch | 153 +++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.1.bb          |   1 +
 2 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-6913.patch

diff --git a/meta/recipes-devtools/perl/perl/CVE-2018-6913.patch b/meta/recipes-devtools/perl/perl/CVE-2018-6913.patch
new file mode 100644
index 0000000..157af7b
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/CVE-2018-6913.patch
@@ -0,0 +1,153 @@
+From f17fed5006177dce8ac48229c424a2da0d6ba492 Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Tue, 8 Aug 2017 09:32:58 +1000
+Subject: [PATCH] (perl #131844) fix various space calculation issues in
+ pp_pack.c
+
+- for the originally reported case, if the start/cur pointer is in the
+  top 75% of the address space the add (cur) + glen addition would
+  overflow, resulting in the condition failing incorrectly.
+
+- the addition of the existing space used to the space needed could
+  overflow, resulting in too small an allocation and a buffer overflow.
+
+- the scaling for UTF8 could overflow.
+
+- the multiply to calculate the space needed for many items could
+  overflow.
+
+For the first case, do a space calculation without making new pointers.
+
+For the other cases, detect the overflow and croak if there's an
+overflow.
+
+Originally this used Size_t_MAX as the maximum size of a memory
+allocation, but for -DDEBUGGING builds realloc() throws a panic for
+allocations over half the address space in size, changing the error
+reported for the allocation.
+
+For non-DEBUGGING builds the Size_t_MAX limit has the small chance
+of finding a system that has 3GB of contiguous space available, and
+allocating that space, which could be a denial of servce in some cases.
+
+Unfortunately changing the limit to half the address space means that
+the exact case with the original issue can no longer occur, so the
+test is no longer testing against the address + length issue that
+caused the original problem, since the allocation is failing earlier.
+
+One option would be to change the test so the size request by pack is
+just under 2GB, but this has a higher (but still low) probability that
+the system has the address space available, and will actually try to
+allocate the memory, so let's not do that.
+
+Note: changed 
+plan tests => 14713;
+to 
+plan tests => 14712;
+in a/t/op/pack.t
+to apply this patch on perl 5.24.1.
+
+CVE: CVE-2018-6913
+Upstream-Status: Backport [https://perl5.git.perl.org/perl.git/commitdiff/f17fed5006177dce8ac48229c424a2da0d6ba492]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ pp_pack.c   | 25 +++++++++++++++++++++----
+ t/op/pack.t | 24 +++++++++++++++++++++++-
+ 2 files changed, 44 insertions(+), 5 deletions(-)
+
+diff --git a/pp_pack.c b/pp_pack.c
+index 8937d6d715..5e9cc64301 100644
+--- a/pp_pack.c
++++ b/pp_pack.c
+@@ -357,11 +357,28 @@ STMT_START {							\
+     }								\
+ } STMT_END
+ 
++#define SAFE_UTF8_EXPAND(var)	\
++STMT_START {				\
++    if ((var) > SSize_t_MAX / UTF8_EXPAND) \
++        Perl_croak(aTHX_ "%s", "Out of memory during pack()"); \
++    (var) = (var) * UTF8_EXPAND; \
++} STMT_END
++
++#define GROWING2(utf8, cat, start, cur, item_size, item_count)	\
++STMT_START {							\
++    if (SSize_t_MAX / (item_size) < (item_count))		\
++        Perl_croak(aTHX_ "%s", "Out of memory during pack()");	\
++    GROWING((utf8), (cat), (start), (cur), (item_size) * (item_count)); \
++} STMT_END
++
+ #define GROWING(utf8, cat, start, cur, in_len)	\
+ STMT_START {					\
+     STRLEN glen = (in_len);			\
+-    if (utf8) glen *= UTF8_EXPAND;		\
+-    if ((cur) + glen >= (start) + SvLEN(cat)) {	\
++    STRLEN catcur = (STRLEN)((cur) - (start));	\
++    if (utf8) SAFE_UTF8_EXPAND(glen);		\
++    if (SSize_t_MAX - glen < catcur)		\
++        Perl_croak(aTHX_ "%s", "Out of memory during pack()"); \
++    if (catcur + glen >= SvLEN(cat)) {	\
+ 	(start) = sv_exp_grow(cat, glen);	\
+ 	(cur) = (start) + SvCUR(cat);		\
+     }						\
+@@ -372,7 +389,7 @@ STMT_START {					\
+ STMT_START {					\
+     const STRLEN glen = (in_len);		\
+     STRLEN gl = glen;				\
+-    if (utf8) gl *= UTF8_EXPAND;		\
++    if (utf8) SAFE_UTF8_EXPAND(gl);		\
+     if ((cur) + gl >= (start) + SvLEN(cat)) {	\
+         *cur = '\0';				\
+         SvCUR_set((cat), (cur) - (start));	\
+@@ -2126,7 +2143,7 @@ S_pack_rec(pTHX_ SV *cat, tempsym_t* sym
+ 	    if (props && !(props & PACK_SIZE_UNPREDICTABLE)) {
+ 		/* We can process this letter. */
+ 		STRLEN size = props & PACK_SIZE_MASK;
+-		GROWING(utf8, cat, start, cur, (STRLEN) len * size);
++		GROWING2(utf8, cat, start, cur, size, (STRLEN)len);
+ 	    }
+         }
+ 
+diff --git a/t/op/pack.t b/t/op/pack.t
+index 664aaaf1b0..cf0e286509 100644
+--- a/t/op/pack.t
++++ b/t/op/pack.t
+@@ -12,7 +12,7 @@ my $no_endianness = $] > 5.009 ? '' :
+ my $no_signedness = $] > 5.009 ? '' :
+   "Signed/unsigned pack modifiers not available on this perl";
+ 
+-plan tests => 14712;
++plan tests => 14717;
+ 
+ use strict;
+ use warnings qw(FATAL all);
+@@ -2044,3 +2044,25 @@ ok(1, "argument underflow did not crash"
+     is(pack("H40", $up_nul), $twenty_nuls,
+        "check pack H zero fills (utf8 source)");
+ }
++
++SKIP:
++{
++  # [perl #131844] pointer addition overflow
++    $Config{ptrsize} == 4
++      or skip "[perl #131844] need 32-bit build for this test", 4;
++    # prevent ASAN just crashing on the allocation failure
++    local $ENV{ASAN_OPTIONS} = $ENV{ASAN_OPTIONS};
++    $ENV{ASAN_OPTIONS} .= ",allocator_may_return_null=1";
++    fresh_perl_like('pack "f999999999"', qr/Out of memory during pack/, { stderr => 1 },
++		    "pointer addition overflow");
++
++    # integer (STRLEN) overflow from addition of glen to current length
++    fresh_perl_like('pack "c10f1073741823"', qr/Out of memory during pack/, { stderr => 1 },
++		    "integer overflow calculating allocation (addition)");
++
++    fresh_perl_like('pack "W10f536870913", 256', qr/Out of memory during pack/, { stderr => 1 },
++		    "integer overflow calculating allocation (utf8)");
++
++    fresh_perl_like('pack "c10f1073741824"', qr/Out of memory during pack/, { stderr => 1 },
++		    "integer overflow calculating allocation (multiply)");
++}
+-- 
+2.15.1-424-g9478a660812
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 882c1cf..bb18c6a 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -69,6 +69,7 @@ SRC_URI += " \
         file://CVE-2018-6798-1.patch \
         file://CVE-2018-6798-2.patch \
         file://CVE-2018-6797.patch \
+        file://CVE-2018-6913.patch \
 "
 
 # Fix test case issues
-- 
2.7.4


