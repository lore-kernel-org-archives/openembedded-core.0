Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178E1C41513
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 10:28:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12820.1716546516569772013
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 03:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5874198975=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O5bu34024382
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 10:28:35 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yaa9mgppp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 10:28:35 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 03:28:34 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 03:28:34 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] strace: upgrade 6.8 -> 6.9
Date: Fri, 24 May 2024 03:28:27 -0700
Message-ID: <cde4735a3f75fced2cee7cf4b08b8fcb3f184d9b.1716543967.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1716543967.git.liezhi.yang@windriver.com>
References: <cover.1716543967.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Epu7lIO5hjQl2MnzeCvjkQK3kaWMtW91
X-Proofpoint-ORIG-GUID: Epu7lIO5hjQl2MnzeCvjkQK3kaWMtW91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 10:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199838

From: Robert Yang <liezhi.yang@windriver.com>

This patch is made by AUH and rebased the following patches:
0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
0001-strace-fix-reproducibilty-issues.patch
0002-tests-Replace-off64_t-with-off_t.patch
Makefile-ptest.patch
ptest-spacesave.patch
skip-load.patch
update-gawk-paths.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...toconf-macro-to-detect-largefile-sup.patch |  6 +-
 ...001-strace-fix-reproducibilty-issues.patch |  9 +--
 ...002-tests-Replace-off64_t-with-off_t.patch | 35 ++++++----
 .../strace/strace/Makefile-ptest.patch        |  9 ++-
 .../strace/strace/ptest-spacesave.patch       |  7 +-
 .../strace/strace/skip-load.patch             |  9 +--
 .../strace/strace/update-gawk-paths.patch     | 70 ++++++++++---------
 .../strace/{strace_6.8.bb => strace_6.9.bb}   |  2 +-
 8 files changed, 76 insertions(+), 71 deletions(-)
 rename meta/recipes-devtools/strace/{strace_6.8.bb => strace_6.9.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
index 76ca7a76a85..86dcd97713a 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 470399f3636c412b74f9daf6ae430b13c3126f02 Mon Sep 17 00:00:00 2001
+From ec543417b8e1df7c71dfc4728313849d9ab669a6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:54:27 -0800
 Subject: [PATCH] configure: Use autoconf macro to detect largefile support
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 4797b42dd..7d57fb254 100644
+index 36fff90..9e40ab5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -43,6 +43,8 @@ AC_PROG_INSTALL
+@@ -42,6 +42,8 @@ AC_PROG_INSTALL
  AC_PROG_RANLIB
  AC_PROG_LN_S
  
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
index c4c176e6bcd..9cdb7c6134e 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
@@ -1,4 +1,4 @@
-From 6309792c49ca900cec6a7f1dc5b51bf75b629e11 Mon Sep 17 00:00:00 2001
+From d5f681c2de834110de260f4d071c7bc1fb0d7564 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 19:56:55 +0000
 Subject: [PATCH] strace: fix reproducibilty issues
@@ -13,7 +13,7 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh
-index 5e1e7c9..1e65eac 100755
+index 8f47651..65267db 100755
 --- a/tests/gen_tests.sh
 +++ b/tests/gen_tests.sh
 @@ -46,7 +46,7 @@ while read -r name arg0 args; do {
@@ -25,7 +25,7 @@ index 5e1e7c9..1e65eac 100755
  
  	case "$arg0" in
  		+*)
-@@ -80,7 +80,7 @@ while read -r name arg0 args; do {
+@@ -91,7 +91,7 @@ while read -r name arg0 args; do {
  
  if [ -n "$names" ]; then
  	{
@@ -34,6 +34,3 @@ index 5e1e7c9..1e65eac 100755
  		printf 'GEN_TESTS ='
  		printf ' %s.gen.test' $names
  		echo
--- 
-2.24.1
-
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
index 0cabdfe99f8..fc6ed7ac4d2 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -1,4 +1,4 @@
-From 579b2ebe52d4b97f954e6188df2d07e137820075 Mon Sep 17 00:00:00 2001
+From 1891db87da3b204c512f47155aaa4e692008f1bf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:56:13 -0800
 Subject: [PATCH] tests: Replace off64_t with off_t
@@ -10,9 +10,12 @@ Upstream-Status: Submitted [https://github.com/strace/strace/pull/230]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  tests/readahead.c        | 2 +-
+ tests/sync_file_range.c  | 4 ++--
  tests/sync_file_range2.c | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
+ 3 files changed, 5 insertions(+), 5 deletions(-)
 
+diff --git a/tests/readahead.c b/tests/readahead.c
+index 1072378..b9597e6 100644
 --- a/tests/readahead.c
 +++ b/tests/readahead.c
 @@ -42,7 +42,7 @@ static const int fds[] = {
@@ -24,29 +27,33 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	-0x8000000000000000LL,
  	-0x5060708090a0b0c0LL,
  	-1LL,
---- a/tests/sync_file_range2.c
-+++ b/tests/sync_file_range2.c
+diff --git a/tests/sync_file_range.c b/tests/sync_file_range.c
+index e93ab6c..dc76865 100644
+--- a/tests/sync_file_range.c
++++ b/tests/sync_file_range.c
 @@ -20,8 +20,8 @@ int
  main(void)
  {
  	const int fd = -1;
--	const off64_t offset = 0xdeadbeefbadc0ded;
--	const off64_t nbytes = 0xfacefeedcafef00d;
-+	const off_t offset = 0xdeadbeefbadc0ded;
-+	const off_t nbytes = 0xfacefeedcafef00d;
+-	const off64_t offset = 0xdeadbeefbadc0dedULL;
+-	const off64_t nbytes = 0xfacefeedcafef00dULL;
++	const off_t offset = 0xdeadbeefbadc0dedULL;
++	const off_t nbytes = 0xfacefeedcafef00dULL;
  	const unsigned int flags = -1;
  
  	int rc = sync_file_range(fd, offset, nbytes, flags);
---- a/tests/sync_file_range.c
-+++ b/tests/sync_file_range.c
+diff --git a/tests/sync_file_range2.c b/tests/sync_file_range2.c
+index b8dc712..e4b003c 100644
+--- a/tests/sync_file_range2.c
++++ b/tests/sync_file_range2.c
 @@ -20,8 +20,8 @@ int
  main(void)
  {
  	const int fd = -1;
--	const off64_t offset = 0xdeadbeefbadc0dedULL;
--	const off64_t nbytes = 0xfacefeedcafef00dULL;
-+	const off_t offset = 0xdeadbeefbadc0dedULL;
-+	const off_t nbytes = 0xfacefeedcafef00dULL;
+-	const off64_t offset = 0xdeadbeefbadc0ded;
+-	const off64_t nbytes = 0xfacefeedcafef00d;
++	const off_t offset = 0xdeadbeefbadc0ded;
++	const off_t nbytes = 0xfacefeedcafef00d;
  	const unsigned int flags = -1;
  
  	int rc = sync_file_range(fd, offset, nbytes, flags);
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 9af77376626..3e50bf40f0f 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 1f50e0a09d828be8f5b1f28db9af0b12492a1553 Mon Sep 17 00:00:00 2001
+From 245f6322cf64e562d3227dfac26ce93c905b0380 Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -8,16 +8,15 @@ Upstream-Status: Inappropriate
 Signed-off-by: Gabriel Barbu <gabriel.barbu@enea.com>
 Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
 ---
  tests/Makefile.am | 20 ++++++++++++++++++++
  1 file changed, 20 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 55566ee..a7ae6f9 100644
+index ef68898..735b73d 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -16,6 +16,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
+@@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
  MPERS_NAME =
  MPERS_CC_FLAGS =
  ARCH_MFLAGS =
@@ -25,7 +24,7 @@ index 55566ee..a7ae6f9 100644
  AM_CFLAGS = $(WARN_CFLAGS)
  bundled_CPPFLAGS =
  if USE_BUNDLED_HEADERS
-@@ -703,3 +704,22 @@ BUILT_SOURCES = ksysent.h
+@@ -889,3 +890,22 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
index 4e86ccadc5b..14ea469c59d 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From 3fad4821d90cd264d1b94253b9cf4fdf5d4034b8 Mon Sep 17 00:00:00 2001
+From cf77d301faf96cc892c6df0e19fccbf5853f249d Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 29 May 2019 00:10:32 +0100
 Subject: [PATCH] strace: Tweak ptest disk space management
@@ -9,16 +9,15 @@ using around 600MB of disk space and running our ptest images out of space.
 RP 2019/5/29
 
 Upstream-Status: Inappropriate [specific to OE image space issues]
-
 ---
  tests/gen_tests.sh | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh
-index 3540204..5e1e7c9 100755
+index ce1467e..8f47651 100755
 --- a/tests/gen_tests.sh
 +++ b/tests/gen_tests.sh
-@@ -62,6 +62,7 @@ while read -r name arg0 args; do {
+@@ -73,6 +73,7 @@ while read -r name arg0 args; do {
  		$hdr
  		. "\${srcdir=.}/init.sh"
  		run_strace_match_diff $arg0 $args
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/recipes-devtools/strace/strace/skip-load.patch
index b1acfda5d80..fe737d8f9aa 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,9 +1,13 @@
+From 3af7272a3435fc79e5da729155480a346ccf2d44 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 31 Jan 2022 17:40:13 +0000
+Subject: [PATCH] strace: skip a number of load-sensitive tests
+
 Skip tests which are known to be unreliable under load, typically because they
 care about timing.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
-
 ---
  tests/clock_nanosleep.gen.test | 1 +
  tests/delay.test               | 1 +
@@ -44,6 +48,3 @@ index 8299737..d89c7df 100755
  
  r_opt="${1:--r}"
  
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index a16ede95c26..429588d2188 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From 4cd26cfaec255ec87f22abe886e0be89312a9671 Mon Sep 17 00:00:00 2001
+From 920ff2e0e838fae4fe49bf8e8fa093d5b2485677 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
@@ -11,22 +11,24 @@ from #!/bin/gawk to #!/usr/bin/gawk. Fixes missing RDPENDS QA tests:
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-
 ---
  src/mpers.awk               | 2 +-
+ tests-m32/caps-abbrev.awk   | 2 +-
  tests-m32/caps.awk          | 2 +-
  tests-m32/match.awk         | 2 +-
  tests-m32/rt_sigaction.awk  | 2 +-
+ tests-mx32/caps-abbrev.awk  | 2 +-
  tests-mx32/caps.awk         | 2 +-
  tests-mx32/match.awk        | 2 +-
  tests-mx32/rt_sigaction.awk | 2 +-
+ tests/caps-abbrev.awk       | 2 +-
  tests/caps.awk              | 2 +-
  tests/match.awk             | 2 +-
  tests/rt_sigaction.awk      | 2 +-
- 10 files changed, 10 insertions(+), 10 deletions(-)
+ 13 files changed, 13 insertions(+), 13 deletions(-)
 
 diff --git a/src/mpers.awk b/src/mpers.awk
-index 25a212f..b2ff53f 100644
+index 425ab65..33ece5c 100644
 --- a/src/mpers.awk
 +++ b/src/mpers.awk
 @@ -1,4 +1,4 @@
@@ -35,6 +37,16 @@ index 25a212f..b2ff53f 100644
  #
  # Copyright (c) 2015 Elvira Khabirova <lineprinter0@gmail.com>
  # Copyright (c) 2015-2016 Dmitry V. Levin <ldv@strace.io>
+diff --git a/tests-m32/caps-abbrev.awk b/tests-m32/caps-abbrev.awk
+index e8393fd..76c4e51 100644
+--- a/tests-m32/caps-abbrev.awk
++++ b/tests-m32/caps-abbrev.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
 diff --git a/tests-m32/caps.awk b/tests-m32/caps.awk
 index 69500ec..e5dfd87 100644
 --- a/tests-m32/caps.awk
@@ -65,6 +77,16 @@ index dce78f5..573d9ea 100644
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@strace.io>
  # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
+diff --git a/tests-mx32/caps-abbrev.awk b/tests-mx32/caps-abbrev.awk
+index e8393fd..76c4e51 100644
+--- a/tests-mx32/caps-abbrev.awk
++++ b/tests-mx32/caps-abbrev.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
 diff --git a/tests-mx32/caps.awk b/tests-mx32/caps.awk
 index 69500ec..e5dfd87 100644
 --- a/tests-mx32/caps.awk
@@ -95,6 +117,16 @@ index dce78f5..573d9ea 100644
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@strace.io>
  # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
+diff --git a/tests/caps-abbrev.awk b/tests/caps-abbrev.awk
+index e8393fd..76c4e51 100644
+--- a/tests/caps-abbrev.awk
++++ b/tests/caps-abbrev.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
 diff --git a/tests/caps.awk b/tests/caps.awk
 index 69500ec..e5dfd87 100644
 --- a/tests/caps.awk
@@ -125,33 +157,3 @@ index dce78f5..573d9ea 100644
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@strace.io>
  # Copyright (c) 2016 Elvira Khabirova <lineprinter0@gmail.com>
-diff --git a/tests-m32/caps-abbrev.awk b/tests-m32/caps-abbrev.awk
-index c00023b..a56cd56 100644
---- a/tests-m32/caps-abbrev.awk
-+++ b/tests-m32/caps-abbrev.awk
-@@ -1,4 +1,4 @@
--#!/bin/gawk
-+#!/usr/bin/gawk
- #
- # This file is part of caps strace test.
- #
-diff --git a/tests-mx32/caps-abbrev.awk b/tests-mx32/caps-abbrev.awk
-index c00023b..a56cd56 100644
---- a/tests-mx32/caps-abbrev.awk
-+++ b/tests-mx32/caps-abbrev.awk
-@@ -1,4 +1,4 @@
--#!/bin/gawk
-+#!/usr/bin/gawk
- #
- # This file is part of caps strace test.
- #
-diff --git a/tests/caps-abbrev.awk b/tests/caps-abbrev.awk
-index c00023b..a56cd56 100644
---- a/tests/caps-abbrev.awk
-+++ b/tests/caps-abbrev.awk
-@@ -1,4 +1,4 @@
--#!/bin/gawk
-+#!/usr/bin/gawk
- #
- # This file is part of caps strace test.
- #
diff --git a/meta/recipes-devtools/strace/strace_6.8.bb b/meta/recipes-devtools/strace/strace_6.9.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_6.8.bb
rename to meta/recipes-devtools/strace/strace_6.9.bb
index e1cc65e053e..bb9f8e42bab 100644
--- a/meta/recipes-devtools/strace/strace_6.8.bb
+++ b/meta/recipes-devtools/strace/strace_6.9.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            "
-SRC_URI[sha256sum] = "ba6950a96824cdf93a584fa04f0a733896d2a6bc5f0ad9ffe505d9b41e970149"
+SRC_URI[sha256sum] = "da189e990a82e3ca3a5a4631012f7ecfd489dab459854d82d8caf6a865c1356a"
 
 inherit autotools ptest
 
-- 
2.45.1


