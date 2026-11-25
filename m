Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36112.1795583576147279887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ja4qTPWF;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=19803; q=dns/txt;
  s=iport01; t=1795583577; x=1796793177;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4ovlC5yRBzS4jRIZaePVaJ4GNnh7SpULvNhhAS2/7UA=;
  b=Ja4qTPWFf6SJFRuFmB8xkqrThyvySDxo0oLZlg52TN3iya5oI/gwfOz6
   AijhoTE8Z/GDyMXLYVVzI4XGwOluZL5YHu5imdInUzq6W39DkEbCCJLSf
   lp80uf4SyPD8+RoGQJOKDSAkPMYk6RbzYcdTZpyb/Ccf9Kivbnu/RRTru
   Btp+Q67+FOb60z7FEcK8zf3RGXkDoJgpMsIwtL/9rdw3l08NRFvw4ZGfp
   cAK945XtGYKGbxZkP5wKeJjodBw1qXG6DPQ4p4lGD8MPKx2LGrkm2KB8N
   tbZ9Fs327C9hZkGBqduArOYWd/pLgN4R3Yfup3S4PuGncBnnW+05S/cDf
   Q==;
X-CSE-ConnectionGUID: 5rdqmjGrRn6k+V5kNnFvZg==
X-CSE-MsgGUID: V8tIHj2BTTqed3iUTS+6Ww==
X-IPAS-Result: =?us-ascii?q?A0BJAgAhbQZr/8xK/pBQCh4BPAwCC4Flghg/dWFCSZQqg?=
 =?us-ascii?q?iGBFopTkkOBfg8BAQEPRA0EAQGCEpEXAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEKAQEFAQEBAgEHBYEOE4ZPDZASAS0LARQEAVkDAQJPCyMhgwIBgjoDNwIBE?=
 =?us-ascii?q?Qa5fYF5M4EBgk9aAT8CQ1DYTA2CWgELFAGBOIFhg2GDAIUlXRgBhH4nGxuBc?=
 =?us-ascii?q?oEVgnR2gQWBGkICgTOGcwSCDRWBDIFUHjGCU4lxAoFJiFJIgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheIYEIgXUCglGCA?=
 =?us-ascii?q?AIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQM?=
 =?us-ascii?q?BwkLwUZJjwbCoEMJx0eGQ4CKQYWIQs0GA1IESw3FRkEPm4HlBODCRIBLARDB?=
 =?us-ascii?q?wkKASMIRj8bTAEQB0YELJJnCpAUAYIhn1NNcQoog3mMJI8+hXwaM6lMgSYLm?=
 =?us-ascii?q?H2OCoQKkV8bTYRqgWg8gVlwFYMiCUoZD44rDguBFAEJgkKGUMgLIzUCAQEBB?=
 =?us-ascii?q?jIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:tcquNa05yeJbr0tfH/bD5Ydwkn2cJEfYwER7XKvMYLTBsI5bpzcBz
 jcXWz+BO/7fNmLzLt1+bIm28UoBupTdzIQyG1Zq3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcubzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGUVs6JIga1fxNBz9Nt
 sJFKxYLQA6xiLfjqF67YrEEasULJcTxeYdasXZ6wHSBVrAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NEiojx5nYj/7DLo3h/+hnHz2aRVTqUmeouw85G27IAlZjuC2a4SLJ4PiqcN9oBaEh
 0LEpU7FPggXOIee9Aa+sSyTmbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVVsAVF6gx7xuAj/KPpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:RklC/K+R6zU/YjDdfTNuk+DoI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcK67WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0aLShxv9Bib56ulRkY
 1kc6R4FZnMKGISt7ee3OF9eOxQp+VuN8uT9IPj80s=
X-Talos-CUID: 9a23:/8Nlo2xSkIA7NZDQnVZ3BgVJAMw8d3/y1k3WfUz7Nztqbru7V22frfY=
X-Talos-MUID: 9a23:gdMmYQSIMmXQVuW4RXTS1C1DFMUyyZiSEU0BypQ7h/LHaxNvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60336657"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:12:54 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id B94D1180006E3
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:12:53 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 6D800CC1634; Tue, 24 Nov 2026 21:12:52 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 1/6] git: fix CVE-2026-105437
Date: Tue, 24 Nov 2026 21:12:41 -0800
Message-Id: <20261125051246.3108822-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251135
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream Git 2.53.1 backport for
CVE-2026-105437. Use size_t for merge-output sizes and checked
addition before allocating the merge buffer. The upstream fix
series is referenced in [1] and the CVE advisory in [2].
The Git 2.53.1 release notes are referenced in [3].

Preserve Git 2.53.0 and retain the upstream regression tests.
The required st_add5() helper is included with the overflow fix.

[1] https://github.com/git/git/commit/1c93cc03eaed7d3e830864c502aae49551421fd2
[2] https://github.com/CVEProject/cvelistV5/blob/main/cves/2026/105xxx/CVE-2026-105437.json
[3] https://github.com/git/git/blob/v2.53.1/Documentation/RelNotes/2.53.1.adoc

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../git/git/CVE-2026-105437_p1.patch          | 235 ++++++++++++++++++
 .../git/git/CVE-2026-105437_p2.patch          | 211 ++++++++++++++++
 meta/recipes-devtools/git/git_2.53.0.bb       |   2 +
 3 files changed, 448 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2026-105437_p1.patch
 create mode 100644 meta/recipes-devtools/git/git/CVE-2026-105437_p2.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2026-105437_p1.patch b/meta/recipes-devtools/git/git/CVE-2026-105437_p1.patch
new file mode 100644
index 0000000000..f2e60f5a4a
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2026-105437_p1.patch
@@ -0,0 +1,235 @@
+From 5a0e9915092ece3be3f7c06b409504c066950585 Mon Sep 17 00:00:00 2001
+From: Kaartic Sivaraam <kaartic.sivaraam@gmail.com>
+Date: Fri, 16 Oct 2026 15:30:01 +0530
+Subject: [PATCH] xdiff: use size_t for merge buffer size computations
+
+libxdiff keeps some intermediate size computations in "long" and "int"
+variables and then feeds the result to malloc(). These can overflow,
+especially "int", which is 32 bits even on 64-bit platforms ("long" is
+too, on Windows). Often this is harmless apart from a wrong answer:
+when the same truncated value is passed both to malloc() and to the
+memcpy() that fills the buffer, the copy stays inside the allocation
+and the result is merely truncated.
+
+xdl_fill_merge_buffer() is different. It adds up the output size in an
+int, allocates that much, then writes each piece at "dest + size". The
+sum can overflow because a conflict-marker-size from .gitattributes
+accepts any positive int and is added several times per conflict, and
+because diff3 output of large inputs can exceed INT_MAX.
+
+We considered both ways the sum can wrap:
+
+  1. It ends up negative. malloc() sees a huge size_t and fails, which
+     is a spurious error but not exploitable.
+
+  2. It wraps back to a small positive value. malloc() succeeds with a
+     buffer that is too small. Each addend is below 2^31, so the
+     running offset passes through negative values on the way. Writes
+     therefore first run past the end of the buffer and then land
+     before its start.
+
+Convert these variables to size_t. The running sum can then no longer
+go negative, and on 64-bit platforms it can no longer realistically
+wrap either. Two holes remain, which the next commit closes by using
+st_add*(): the marker addends (e.g. "marker_size + 1 + needs_cr +
+marker1_size") are still computed as int and can overflow when
+conflict-marker-size is close to INT_MAX, and on 32-bit platforms
+size_t itself can still wrap.
+
+Note that in xdl_do_merge(), the value returned by xdl_fill_merge_buffer()
+is assigned to mmbuffer_t's size which is a long. This may result in
+silent truncation on LLP64 platforms like Windows, where long is 32 bits.
+Fixing this properly means converting the users of mmbuffer_t, which
+pass its size on to functions taking an unsigned long, and the code
+they call, to size_t. That is a larger effort for a separate series.
+Until then, fail the merge when the result does not fit in a long.
+This turns a silent truncation into an error the caller already
+knows how to handle.
+
+CVE: CVE-2026-105437
+Upstream-Status: Backport [https://github.com/git/git/commit/288266c11d91a01239e8e17f4bd90f1276e30030]
+
+Based-on-patch-by: Jeff King <peff@peff.net>
+Helped-by: Toon Claes <toon@iotcl.com>
+Helped-by: Christian Couder <christian@gitlab.com>
+Signed-off-by: Kaartic Sivaraam <kaartic.sivaraam@gmail.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ t/t4300-merge-tree.sh | 74 +++++++++++++++++++++++++++++++++++++++++++
+ xdiff/xmerge.c        | 45 ++++++++++++++------------
+ 2 files changed, 99 insertions(+), 20 deletions(-)
+
+diff --git a/t/t4300-merge-tree.sh b/t/t4300-merge-tree.sh
+index 27fbe193bc..13e883c491 100755
+--- a/t/t4300-merge-tree.sh
++++ b/t/t4300-merge-tree.sh
+@@ -378,4 +378,78 @@ test_expect_success 'merge-tree respects core.useReplaceRefs=false' '
+ 	test valid = $merged
+ '
+ 
++# A couple of tests to ensure merge-tree does not undergo a heap
++# buffer overflow.
++#
++# Number of lines per file, and every Nth line is a conflict site.
++# With N=5 and 2100 lines there are 420 independent conflict hunks per file.
++# We use the specified MARKER_SIZE as it amounts to around 10MiB of conflict
++# hunk text for each conflict in the file. This helps us to quickly trigger
++# the heap buffer overflow with just 420 conflict hunks.
++LINES=2100
++STEP=5
++MARKER_SIZE=3495254
++
++# gen_file <label>: emit a file whose conflict-site lines carry <label>.
++# Context lines between sites contain alphanumerics so that xdiff does not
++# coalesce neighbouring hunks into one large conflict.
++gen_file () {
++	n=1
++	while test $n -le $LINES
++	do
++		if test $(($n % $STEP)) = 0
++		then
++			echo "$1 site $n"
++		else
++			echo "context line $n"
++		fi
++		n=$(($n + 1))
++	done
++}
++
++test_expect_success EXPENSIVE 'setup: base commit with attributes' '
++	echo "big.txt conflict-marker-size=$MARKER_SIZE" >.gitattributes &&
++	gen_file base >big.txt &&
++	gen_file base >other.txt &&
++	git add .gitattributes big.txt other.txt &&
++	git commit -m base &&
++	git branch -M main &&
++
++	git checkout -b side1 main &&
++	gen_file ours >big.txt &&
++	gen_file ours >other.txt &&
++	git commit -a -m side1 &&
++
++	git checkout -b side2 main &&
++	gen_file theirs >big.txt &&
++	gen_file theirs >other.txt &&
++	git commit -a -m side2
++'
++
++# We have LONG_IS_64BIT as a prerequisite since we guard against downcasts
++# from 64-bit size_t to 32-bit long (for example on Windows)
++test_expect_success EXPENSIVE,SIZE_T_IS_64BIT,LONG_IS_64BIT 'no buffer overflow in merge-tree --write-tree' '
++	test_expect_code 1 git merge-tree --write-tree side1 side2 >out &&
++	tree=$(head -n 1 out) &&
++	git cat-file -e "$tree^{tree}"
++'
++
++test_expect_success EXPENSIVE,SIZE_T_IS_64BIT,LONG_IS_64BIT 'conflicted paths are listed without buffer overflow' '
++	test_expect_code 1 git merge-tree --write-tree --name-only \
++		side1 side2 >out &&
++	sed -n "2,\$p" out | sed "/^\$/,\$d" | sort -u >actual &&
++	cat >expect <<-\EOF &&
++	big.txt
++	other.txt
++	EOF
++	test_cmp expect actual
++'
++
++# Ensure we properly identify a downcast from 64-bit size_t to
++# 32-bit long on Windows
++test_expect_success EXPENSIVE,SIZE_T_IS_64BIT,!LONG_IS_64BIT 'merge-tree dies when merge buffer size does not fit long' '
++	test_must_fail git merge-tree --write-tree side1 side2 2>err &&
++	test_grep "failure to merge" err
++'
++
+ test_done
+diff --git a/xdiff/xmerge.c b/xdiff/xmerge.c
+index 29dad98c49..d18c6f30be 100644
+--- a/xdiff/xmerge.c
++++ b/xdiff/xmerge.c
+@@ -109,10 +109,10 @@ static int xdl_merge_cmp_lines(xdfenv_t *xe1, int i1, xdfenv_t *xe2, int i2,
+ 	return 0;
+ }
+ 
+-static int xdl_recs_copy_0(int use_orig, xdfenv_t *xe, int i, int count, int needs_cr, int add_nl, char *dest)
++static size_t xdl_recs_copy_0(int use_orig, xdfenv_t *xe, int i, int count, int needs_cr, int add_nl, char *dest)
+ {
+ 	xrecord_t *recs;
+-	int size = 0;
++	size_t size = 0;
+ 
+ 	recs = (use_orig ? xe->xdf1.recs : xe->xdf2.recs) + i;
+ 
+@@ -139,12 +139,12 @@ static int xdl_recs_copy_0(int use_orig, xdfenv_t *xe, int i, int count, int nee
+ 	return size;
+ }
+ 
+-static int xdl_recs_copy(xdfenv_t *xe, int i, int count, int needs_cr, int add_nl, char *dest)
++static size_t xdl_recs_copy(xdfenv_t *xe, int i, int count, int needs_cr, int add_nl, char *dest)
+ {
+ 	return xdl_recs_copy_0(0, xe, i, count, needs_cr, add_nl, dest);
+ }
+ 
+-static int xdl_orig_copy(xdfenv_t *xe, int i, int count, int needs_cr, int add_nl, char *dest)
++static size_t xdl_orig_copy(xdfenv_t *xe, int i, int count, int needs_cr, int add_nl, char *dest)
+ {
+ 	return xdl_recs_copy_0(1, xe, i, count, needs_cr, add_nl, dest);
+ }
+@@ -193,11 +193,11 @@ static int is_cr_needed(xdfenv_t *xe1, xdfenv_t *xe2, xdmerge_t *m)
+ 	return needs_cr < 0 ? 0 : needs_cr;
+ }
+ 
+-static int fill_conflict_hunk(xdfenv_t *xe1, const char *name1,
+-			      xdfenv_t *xe2, const char *name2,
+-			      const char *name3,
+-			      int size, int i, int style,
+-			      xdmerge_t *m, char *dest, int marker_size)
++static size_t fill_conflict_hunk(xdfenv_t *xe1, const char *name1,
++				 xdfenv_t *xe2, const char *name2,
++				 const char *name3,
++				 size_t size, int i, int style,
++				 xdmerge_t *m, char *dest, int marker_size)
+ {
+ 	int marker1_size = (name1 ? strlen(name1) + 1 : 0);
+ 	int marker2_size = (name2 ? strlen(name2) + 1 : 0);
+@@ -280,14 +280,15 @@ static int fill_conflict_hunk(xdfenv_t *xe1, const char *name1,
+ 	return size;
+ }
+ 
+-static int xdl_fill_merge_buffer(xdfenv_t *xe1, const char *name1,
+-				 xdfenv_t *xe2, const char *name2,
+-				 const char *ancestor_name,
+-				 int favor,
+-				 xdmerge_t *m, char *dest, int style,
+-				 int marker_size)
++static size_t xdl_fill_merge_buffer(xdfenv_t *xe1, const char *name1,
++				    xdfenv_t *xe2, const char *name2,
++				    const char *ancestor_name,
++				    int favor,
++				    xdmerge_t *m, char *dest, int style,
++				    int marker_size)
+ {
+-	int size, i;
++	size_t size;
++	int i;
+ 
+ 	for (size = i = 0; m; m = m->next) {
+ 		if (favor && !m->mode)
+@@ -664,10 +665,14 @@ static int xdl_do_merge(xdfenv_t *xe1, xdchange_t *xscr1,
+ 	/* output */
+ 	if (result) {
+ 		int marker_size = xmp->marker_size;
+-		int size = xdl_fill_merge_buffer(xe1, name1, xe2, name2,
+-						 ancestor_name,
+-						 favor, changes, NULL, style,
+-						 marker_size);
++		size_t size = xdl_fill_merge_buffer(xe1, name1, xe2, name2,
++						    ancestor_name,
++						    favor, changes, NULL, style,
++						    marker_size);
++		if (size > LONG_MAX) {
++			xdl_cleanup_merge(changes);
++			return -1;
++		}
+ 		result->ptr = xdl_malloc(size);
+ 		if (!result->ptr) {
+ 			xdl_cleanup_merge(changes);
diff --git a/meta/recipes-devtools/git/git/CVE-2026-105437_p2.patch b/meta/recipes-devtools/git/git/CVE-2026-105437_p2.patch
new file mode 100644
index 0000000000..c430990dc5
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2026-105437_p2.patch
@@ -0,0 +1,211 @@
+From 101cf0f0ac86c6f0ffa6866cd139db2253af84b4 Mon Sep 17 00:00:00 2001
+From: Kaartic Sivaraam <kaartic.sivaraam@gmail.com>
+Date: Fri, 16 Oct 2026 15:30:02 +0530
+Subject: [PATCH] xdiff: check for overflow when computing merge buffer size
+
+The previous commit switched the merge buffer size computation in
+xdl_fill_merge_buffer() and its helpers to size_t. That keeps the
+running sum from going negative, but two ways to overflow remain.
+
+First, the conflict marker addends (e.g. "marker_size + 1 + needs_cr +
+marker1_size") are still summed as int before being added to "size".
+When conflict-marker-size is close to INT_MAX, that int sum overflows
+and goes negative. Converted to size_t and added, it makes "size"
+smaller instead of larger, even on 64-bit platforms.
+
+Second, on platforms where size_t is 32 bits, the running sum itself
+can still wrap, for example with a large conflict-marker-size.
+
+Either way, malloc() returns a buffer that is too small, and the
+write pass, which replays the same sum, runs past its end.
+
+Use the st_add*() helpers to sum the sizes, adding each marker addend
+separately, so an overflow dies instead of silently wrapping.
+
+Note that in fill_conflict_hunk() we do not cover all manipulations of
+"size"; that's because the function is called twice: once with a NULL
+dest to compute the size, and the second time to fill it (with the
+assumption that the caller gave us "size" bytes). We need only perform
+the overflow checks on the first round.
+
+CVE: CVE-2026-105437
+Upstream-Status: Backport [https://github.com/git/git/commit/b1313872cefef5704a0acff14b7c0869a9d5dc7c]
+
+Backport Changes:
+- Keep Git 2.53.0's struct-based records. Remove the record-length
+  and final record-count casts to match Git 2.53.1.
+- Fold the required st_add5() helper from upstream commit [1],
+  which is absent in Git 2.53.0.
+
+[1] https://github.com/git/git/commit/0dc3b5c0224b985e48be513330f8d79e87db9a12
+
+Based-on-patch-by: Jeff King <peff@peff.net>
+Signed-off-by: Kaartic Sivaraam <kaartic.sivaraam@gmail.com>
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ git-compat-util.h     |  1 +
+ t/t4300-merge-tree.sh |  9 +++++++++
+ xdiff/xmerge.c        | 46 +++++++++++++++++++++----------------------
+ 3 files changed, 33 insertions(+), 23 deletions(-)
+
+diff --git a/git-compat-util.h b/git-compat-util.h
+index bebcf9f698..43fa765a44 100644
+--- a/git-compat-util.h
++++ b/git-compat-util.h
+@@ -614,6 +614,7 @@ static inline size_t st_add(size_t a, size_t b)
+ }
+ #define st_add3(a,b,c)   st_add(st_add((a),(b)),(c))
+ #define st_add4(a,b,c,d) st_add(st_add3((a),(b),(c)),(d))
++#define st_add5(a,b,c,d,e) st_add(st_add4((a),(b),(c),(d)),(e))
+ 
+ static inline size_t st_mult(size_t a, size_t b)
+ {
+diff --git a/t/t4300-merge-tree.sh b/t/t4300-merge-tree.sh
+index 13e883c491..41386d6025 100755
+--- a/t/t4300-merge-tree.sh
++++ b/t/t4300-merge-tree.sh
+@@ -386,6 +386,10 @@ test_expect_success 'merge-tree respects core.useReplaceRefs=false' '
+ # We use the specified MARKER_SIZE as it amounts to around 10MiB of conflict
+ # hunk text for each conflict in the file. This helps us to quickly trigger
+ # the heap buffer overflow with just 420 conflict hunks.
++#
++# The merged file comes out at just over 4GiB. On 64-bit builds merge-tree
++# must produce it. On 32-bit builds it cannot fit in size_t, so merge-tree
++# must die instead of wrapping the size and overflowing the buffer.
+ LINES=2100
+ STEP=5
+ MARKER_SIZE=3495254
+@@ -452,4 +456,9 @@ test_expect_success EXPENSIVE,SIZE_T_IS_64BIT,!LONG_IS_64BIT 'merge-tree dies wh
+ 	test_grep "failure to merge" err
+ '
+ 
++test_expect_success EXPENSIVE,!SIZE_T_IS_64BIT 'merge-tree dies when merge buffer size overflows size_t' '
++	test_must_fail git merge-tree --write-tree side1 side2 2>err &&
++	test_grep "size_t overflow" err
++'
++
+ test_done
+diff --git a/xdiff/xmerge.c b/xdiff/xmerge.c
+index d18c6f30be..9844449a8e 100644
+--- a/xdiff/xmerge.c
++++ b/xdiff/xmerge.c
+@@ -119,7 +119,7 @@ static size_t xdl_recs_copy_0(int use_orig, xdfenv_t *xe, int i, int count, int
+ 	if (count < 1)
+ 		return 0;
+ 
+-	for (i = 0; i < count; size += (int)recs[i++].size)
++	for (i = 0; i < count; size = st_add(size, recs[i++].size))
+ 		if (dest)
+ 			memcpy(dest + size, recs[i].ptr, recs[i].size);
+ 	if (add_nl) {
+@@ -128,12 +128,12 @@ static size_t xdl_recs_copy_0(int use_orig, xdfenv_t *xe, int i, int count, int
+ 			if (needs_cr) {
+ 				if (dest)
+ 					dest[size] = '\r';
+-				size++;
++				size = st_add(size, 1);
+ 			}
+ 
+ 			if (dest)
+ 				dest[size] = '\n';
+-			size++;
++			size = st_add(size, 1);
+ 		}
+ 	}
+ 	return size;
+@@ -208,11 +208,11 @@ static size_t fill_conflict_hunk(xdfenv_t *xe1, const char *name1,
+ 		marker_size = DEFAULT_CONFLICT_MARKER_SIZE;
+ 
+ 	/* Before conflicting part */
+-	size += xdl_recs_copy(xe1, i, m->i1 - i, 0, 0,
+-			      dest ? dest + size : NULL);
++	size = st_add(size, xdl_recs_copy(xe1, i, m->i1 - i, 0, 0,
++					  dest ? dest + size : NULL));
+ 
+ 	if (!dest) {
+-		size += marker_size + 1 + needs_cr + marker1_size;
++		size = st_add5(size, marker_size, 1, needs_cr, marker1_size);
+ 	} else {
+ 		memset(dest + size, '<', marker_size);
+ 		size += marker_size;
+@@ -227,13 +227,13 @@ static size_t fill_conflict_hunk(xdfenv_t *xe1, const char *name1,
+ 	}
+ 
+ 	/* Postimage from side #1 */
+-	size += xdl_recs_copy(xe1, m->i1, m->chg1, needs_cr, 1,
+-			      dest ? dest + size : NULL);
++	size = st_add(size, xdl_recs_copy(xe1, m->i1, m->chg1, needs_cr, 1,
++					  dest ? dest + size : NULL));
+ 
+ 	if (style == XDL_MERGE_DIFF3 || style == XDL_MERGE_ZEALOUS_DIFF3) {
+ 		/* Shared preimage */
+ 		if (!dest) {
+-			size += marker_size + 1 + needs_cr + marker3_size;
++			size = st_add5(size, marker_size, 1, needs_cr, marker3_size);
+ 		} else {
+ 			memset(dest + size, '|', marker_size);
+ 			size += marker_size;
+@@ -246,12 +246,12 @@ static size_t fill_conflict_hunk(xdfenv_t *xe1, const char *name1,
+ 				dest[size++] = '\r';
+ 			dest[size++] = '\n';
+ 		}
+-		size += xdl_orig_copy(xe1, m->i0, m->chg0, needs_cr, 1,
+-				      dest ? dest + size : NULL);
++		size = st_add(size, xdl_orig_copy(xe1, m->i0, m->chg0, needs_cr, 1,
++						  dest ? dest + size : NULL));
+ 	}
+ 
+ 	if (!dest) {
+-		size += marker_size + 1 + needs_cr;
++		size = st_add4(size, marker_size, 1, needs_cr);
+ 	} else {
+ 		memset(dest + size, '=', marker_size);
+ 		size += marker_size;
+@@ -261,10 +261,10 @@ static size_t fill_conflict_hunk(xdfenv_t *xe1, const char *name1,
+ 	}
+ 
+ 	/* Postimage from side #2 */
+-	size += xdl_recs_copy(xe2, m->i2, m->chg2, needs_cr, 1,
+-			      dest ? dest + size : NULL);
++	size = st_add(size, xdl_recs_copy(xe2, m->i2, m->chg2, needs_cr, 1,
++					  dest ? dest + size : NULL));
+ 	if (!dest) {
+-		size += marker_size + 1 + needs_cr + marker2_size;
++		size = st_add5(size, marker_size, 1, needs_cr, marker2_size);
+ 	} else {
+ 		memset(dest + size, '>', marker_size);
+ 		size += marker_size;
+@@ -301,25 +301,25 @@ static size_t xdl_fill_merge_buffer(xdfenv_t *xe1, const char *name1,
+ 						  marker_size);
+ 		else if (m->mode & 3) {
+ 			/* Before conflicting part */
+-			size += xdl_recs_copy(xe1, i, m->i1 - i, 0, 0,
+-					      dest ? dest + size : NULL);
++			size = st_add(size, xdl_recs_copy(xe1, i, m->i1 - i, 0, 0,
++							  dest ? dest + size : NULL));
+ 			/* Postimage from side #1 */
+ 			if (m->mode & 1) {
+ 				int needs_cr = is_cr_needed(xe1, xe2, m);
+ 
+-				size += xdl_recs_copy(xe1, m->i1, m->chg1, needs_cr, (m->mode & 2),
+-						      dest ? dest + size : NULL);
++				size = st_add(size, xdl_recs_copy(xe1, m->i1, m->chg1, needs_cr, (m->mode & 2),
++								  dest ? dest + size : NULL));
+ 			}
+ 			/* Postimage from side #2 */
+ 			if (m->mode & 2)
+-				size += xdl_recs_copy(xe2, m->i2, m->chg2, 0, 0,
+-						      dest ? dest + size : NULL);
++				size = st_add(size, xdl_recs_copy(xe2, m->i2, m->chg2, 0, 0,
++								  dest ? dest + size : NULL));
+ 		} else
+ 			continue;
+ 		i = m->i1 + m->chg1;
+ 	}
+-	size += xdl_recs_copy(xe1, i, (int)xe1->xdf2.nrec - i, 0, 0,
+-			      dest ? dest + size : NULL);
++	size = st_add(size, xdl_recs_copy(xe1, i, xe1->xdf2.nrec - i, 0, 0,
++					  dest ? dest + size : NULL));
+ 	return size;
+ }
+ 
diff --git a/meta/recipes-devtools/git/git_2.53.0.bb b/meta/recipes-devtools/git/git_2.53.0.bb
index 5244891113..da8fe2fb00 100644
--- a/meta/recipes-devtools/git/git_2.53.0.bb
+++ b/meta/recipes-devtools/git/git_2.53.0.bb
@@ -10,6 +10,8 @@ PROVIDES:append:class-native = " git-replacement-native"
 SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://fixsort.patch \
            file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch \
+           file://CVE-2026-105437_p1.patch \
+           file://CVE-2026-105437_p2.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6

