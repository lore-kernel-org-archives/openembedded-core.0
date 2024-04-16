Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7EA8C07E8D
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:07 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.13599.1713248039971961011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EMhDXvip;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=4DJdRvm9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018ee58a7722-7af6291a-7380-4f0a-9500-2f39e3329d83-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FaTpfWQ/tQqMRmG9RYsMMBChTuAQKYDJv/HWwQOmjPQ=;
	b=EMhDXvipZxp//pObjLAHG9NgxgAtLxlZUwZC3P6T7STXyxdNfOYCiq39ybDuRPmR
	0R8lLXB2YDLEpisOUeYRW0wufZo/Xz+bg7msTKqV75K6J1JLxLEPphScd59SqF31iKv
	/8F4fDu5KIr1f2IMRv4MSyeCf5pdzqgJe7vGuv2M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248040;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FaTpfWQ/tQqMRmG9RYsMMBChTuAQKYDJv/HWwQOmjPQ=;
	b=4DJdRvm9/8lYvYg83ubpjMuSvevG10oK26QFIEn5KOol17ulR43eHj4MPp805atz
	4049s33F7YmRjhe/c0NSpEpbXT9oNytMaDmP08TjQ7y6lVBmEvkM3jKvpZnLhLvOFLC
	+/D6aIaOnp5tsL3TGhEe6bShh97hNUkkz0WP7LD4=
Content-Type: multipart/mixed; boundary="===============6661050629125212424=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] strace: upgrading to 6.8 SUCCEEDED
Message-ID: <0101018ee58a7722-7af6291a-7380-4f0a-9500-2f39e3329d83-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198337

--===============6661050629125212424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *strace* to *6.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-strace-upgrade-6.7-6.8.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 2749d9a7ffdb26be285a1e08291380fa56b41174 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 21:22:04 +0000
Subject: [PATCH] strace: upgrade 6.7 -> 6.8

---
 ...toconf-macro-to-detect-largefile-sup.patch |  6 +-
 ...001-strace-fix-reproducibilty-issues.patch |  9 +--
 ...002-tests-Replace-off64_t-with-off_t.patch | 35 ++++++----
 .../strace/strace/Makefile-ptest.patch        |  9 ++-
 .../strace/strace/ptest-spacesave.patch       |  7 +-
 .../strace/strace/skip-load.patch             |  9 +--
 .../strace/strace/update-gawk-paths.patch     | 70 ++++++++++---------
 .../strace/{strace_6.7.bb => strace_6.8.bb}   |  2 +-
 8 files changed, 76 insertions(+), 71 deletions(-)
 rename meta/recipes-devtools/strace/{strace_6.7.bb => strace_6.8.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
index 76ca7a76a8..2028fe2b4a 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 470399f3636c412b74f9daf6ae430b13c3126f02 Mon Sep 17 00:00:00 2001
+From da3f5dfbb3e65a30e9c1a1559579688ed0870d83 Mon Sep 17 00:00:00 2001
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
index c4c176e6bc..0be22ff105 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
@@ -1,4 +1,4 @@
-From 6309792c49ca900cec6a7f1dc5b51bf75b629e11 Mon Sep 17 00:00:00 2001
+From 39db6fa4744472c20580f8384e1bbee49e3b1bba Mon Sep 17 00:00:00 2001
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
index 0cabdfe99f..e9cd3dbb87 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -1,4 +1,4 @@
-From 579b2ebe52d4b97f954e6188df2d07e137820075 Mon Sep 17 00:00:00 2001
+From 8790704100426b0b93ffefdfbd0c6c0e288ced90 Mon Sep 17 00:00:00 2001
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
index 9af7737662..e7719b5303 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 1f50e0a09d828be8f5b1f28db9af0b12492a1553 Mon Sep 17 00:00:00 2001
+From 2fea3b32a9debb2d4b335c481b4d0802317a02b0 Mon Sep 17 00:00:00 2001
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
index 4e86ccadc5..7d22da9f38 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From 3fad4821d90cd264d1b94253b9cf4fdf5d4034b8 Mon Sep 17 00:00:00 2001
+From c5db0243c787e023104ea04880b0167bdbd474b9 Mon Sep 17 00:00:00 2001
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
index b1acfda5d8..cdc897fc14 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,9 +1,13 @@
+From c85fdbe795733fde6506745499f23980c70c72c5 Mon Sep 17 00:00:00 2001
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
index a16ede95c2..efe8b1f082 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From 4cd26cfaec255ec87f22abe886e0be89312a9671 Mon Sep 17 00:00:00 2001
+From 95bcc8a6f2ae7388832572a2689c26994aa7b88f Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/strace/strace_6.7.bb b/meta/recipes-devtools/strace/strace_6.8.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_6.7.bb
rename to meta/recipes-devtools/strace/strace_6.8.bb
index f365477ccd..b22c57b45d 100644
--- a/meta/recipes-devtools/strace/strace_6.7.bb
+++ b/meta/recipes-devtools/strace/strace_6.8.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
            "
-SRC_URI[sha256sum] = "2090201e1a3ff32846f4fe421c1163b15f440bb38e31355d09f82d3949922af7"
+SRC_URI[sha256sum] = "ba6950a96824cdf93a584fa04f0a733896d2a6bc5f0ad9ffe505d9b41e970149"
 
 inherit autotools ptest
 
-- 
2.42.0


--===============6661050629125212424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/strace/strace-ptest: FILELIST: added "/usr/lib/strace/ptest/tests/statmount.gen.test /usr/lib/strace/ptest/tests/lsm_get_self_attr-success.gen.test /usr/lib/strace/ptest/tests/listmount.gen.test /usr/lib/strace/ptest/tests/lsm_list_modules.gen.test /usr/lib/strace/ptest/tests/tcp_ao /usr/lib/strace/ptest/tests/dev-pty-yy /usr/lib/strace/ptest/tests/dev-pty-yy.gen.test /usr/lib/strace/ptest/tests/tcp_ao.gen.test /usr/lib/strace/ptest/tests/lsm_set_self_attr /usr/lib/strace/ptest/tests/listmount /usr/lib/strace/ptest/tests/statmount /usr/lib/strace/ptest/tests/lsm_get_self_attr-success /usr/lib/strace/ptest/tests/listmount-success.gen.test /usr/lib/strace/ptest/tests/statmount-success.gen.test /usr/lib/strace/ptest/tests/listmount-success /usr/lib/strace/ptest/tests/lsm_get_self_attr /usr/lib/strace/ptest/tests/lsm_set_self_attr.gen.test /usr/lib/strace/ptest/tests/strace-k-with-depth-limit.test /usr/lib/strace/ptest/tests/lsm_get_self_attr.gen.test /usr/li
 b/strace/ptest/tests/lsm_list_modules-success /usr/lib/strace/ptest/tests/lsm_list_modules-success.gen.test /usr/lib/strace/ptest/tests/strace-k-with-depth-limit.expected /usr/lib/strace/ptest/tests/lsm_list_modules /usr/lib/strace/ptest/tests/statmount-success"
Changes to packages/x86_64-linux/binutils-cross-x86_64 (sysroot):
  /sysroot-providers/virtual_x86_64-poky-linux-binutils was added
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-addr2line was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-as was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++filt was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-dwp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-elfedit was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gprof was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.bfd was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.gold was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objcopy was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objdump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-readelf was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-size was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strings was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/libdep.so was added
  /usr/lib/x86_64-poky-linux/ldscripts was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/stamp was added
  /sysroot-providers/virtual_x86_64-poky-linux-musl-binutils was removed
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-addr2line was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-as was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++filt was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-dwp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-elfedit was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gprof was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld.gold was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objcopy was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objdump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-readelf was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-size was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strings was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/libdep.so was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/stamp was removed
Changes to packages/x86_64-linux/gcc-cross-x86_64 (sysroot):
  /sysroot-providers/virtual_x86_64-poky-linux-g++ was added
  /sysroot-providers/virtual_x86_64-poky-linux-gcc was added
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-cpp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-13.2.0 was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-dump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-tool was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-lto-dump was added
  /usr/libexec/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/cc1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/cc1plus was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/collect2 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/g++-mapper-server was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/fixincl was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/fixinc.sh was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/mkheaders was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld.gold was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcp1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcp1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/liblto_plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/lto1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/lto-wrapper was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/gengtype was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/strip was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ld.gold was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/x86_64-poky-linux/gcc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/adxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/ammintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxbf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxcomplexintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxfp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxtileintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx5124fmapsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx5124vnniwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512cdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512dqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512erintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512fintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512fp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512fp16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512pfintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vldqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxneconvertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxvnniint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxvnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/bmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/bmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/bmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cet.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cldemoteintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/clflushoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/clwbintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/clzerointrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cmpccxaddintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cpuid.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cross-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/emmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/enqcmdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/f16cintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include-fixed was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include-fixed/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/float.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/fma4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/fmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/fxsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/gfniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/hresetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/ia32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/immintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/iso646.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/keylockerintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/lwpintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/lzcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mm3dnow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mm_malloc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/movdirintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mwaitintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mwaitxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/nmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/pconfigintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/pkuintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/pmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/popcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/prfchiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/prfchwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/quadmath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/quadmath_weak.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/raointintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/rdseedintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/rtmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/serializeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/sgxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/shaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/smmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdalign.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdatomic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdbool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stddef.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdfix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdint-gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdnoreturn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/syslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/tbmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/tmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/uintrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/unwind.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/vaesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/varargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/waitpkgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/wmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/x86gprintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/x86intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xopintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsavecintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsaveintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsaveoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsavesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xtestintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/fixinc_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/include/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/macro_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/mkheaders.conf was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/gtype.state was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ada was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/addresses.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/align.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/all-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ansidecl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/array-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/asan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/attribs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/auto-host.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/auto-profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/backend.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/basic-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/b-header-vars was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/bitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtins.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtin-types.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/bversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/calls.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ccmp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfganal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfghooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cgraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cif-code.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/collect2.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/collect-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/color-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/conditions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/configargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/elfos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/biarch64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/convert.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/coretypes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/coverage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/contracts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cp-trait.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/operators.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cppdefault.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cpplib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cselib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ctfc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/d was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/data-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ddg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/debug.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/defaults.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/df.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dfp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-client-data-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/digraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dojump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dominance.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/domwalk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/double-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dump-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dumpfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/edit-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/errors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/escaped_string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/et-forest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/except.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/explow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/expmed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/file-find.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/filenames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fixed-value.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/flag-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fold-const.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/function-abi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcov-io.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcse-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/generic-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gengtype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/genrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gensupport.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ggc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-infer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimplify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/glimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graphds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graphite.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graphviz.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gsstruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gsyms.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hashtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-table.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hosthooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hwint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ifcvt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/inchash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/incpath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/input.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-addr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-attr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-codes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-modes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/internal-fn.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/internal-fn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/intl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ira.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ira-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/is-a.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/langhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lcm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/libiberty.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/limitx.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/limity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/line-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lra-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lto-compress.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/m2 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/m2/m2-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/machmode.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/machmode.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/make-unique.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/md5.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/memmodel.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/memory-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mem-stats.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mode-classes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mux-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/objc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/obstack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-expand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-general.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-offload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/options.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opt-problem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opts-jobserver.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/output.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/passes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pass-instances.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pass_manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin-version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pointer-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/poly-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/predict.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/prefix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/print-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/print-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/profile-count.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/read-md.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/real.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/realmpfr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/recog.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regcprop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/reg-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regrename.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/reload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/resource.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtlanal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl-error.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtlhash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sanitizer.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sched-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/selftest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sel-sched.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sese.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/signop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sparseset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/spellcheck.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sreal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/statistics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/stmt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/stor-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/stringpool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/substring-locations.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/system.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-globals.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-insns.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/targhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/timevar.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/timevar.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tm_p.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tm-preds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/toplev.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tracer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/trans-mem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-affine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-check.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-eh.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-nested.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-pass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-sra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/treestruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tristate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tsystem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/typeclass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ubsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/valtrack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-prof.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-range-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-range-storage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-relation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/varasm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vr-values.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/wide-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/xcoff.h was added
  /sysroot-providers/virtual_x86_64-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_x86_64-poky-linux-musl-gcc was removed
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-cpp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-13.2.0 was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-dump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-tool was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-lto-dump was removed
  /usr/libexec/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/cc1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/cc1plus was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/collect2 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/g++-mapper-server was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/fixincl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/mkheaders was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ld.gold was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcp1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/liblto_plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/lto1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/lto-wrapper was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/gengtype was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/strip was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ld.gold was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/x86_64-poky-linux-musl/gcc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/adxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/ammintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxbf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxcomplexintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxfp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxtileintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx5124fmapsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx5124vnniwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512cdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512dqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512erintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512fintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512fp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512pfintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxneconvertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxvnniint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxvnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/bmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/bmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/bmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cet.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cldemoteintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/clflushoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/clwbintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/clzerointrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cmpccxaddintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cpuid.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cross-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/emmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/enqcmdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/f16cintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include-fixed was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include-fixed/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/float.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/fma4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/fmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/fxsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/gfniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/hresetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/ia32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/immintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/iso646.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/keylockerintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/lwpintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/lzcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mm3dnow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mm_malloc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/movdirintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mwaitintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mwaitxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/nmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/pconfigintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/pkuintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/pmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/popcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/prfchiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/prfchwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/quadmath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/quadmath_weak.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/raointintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/rdseedintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/rtmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/serializeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/sgxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/shaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/smmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdalign.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdatomic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdbool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stddef.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdfix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdint-gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdnoreturn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/syslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/tbmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/tmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/uintrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/unwind.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/vaesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/varargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/waitpkgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/wmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/x86gprintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/x86intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xopintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsavecintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsaveintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsavesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xtestintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/fixinc_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/include/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/macro_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/gtype.state was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ada was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/addresses.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/align.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/all-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/array-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/asan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/attribs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/auto-host.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/backend.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/basic-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/b-header-vars was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/bitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtins.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/bversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/calls.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ccmp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfganal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cgraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cif-code.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/collect2.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/color-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/conditions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/configargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/biarch64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/convert.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/coretypes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/coverage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/contracts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cp-trait.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cpplib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cselib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ctfc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/d was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ddg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/debug.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/defaults.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/df.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dfp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-client-data-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/digraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dojump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dominance.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/domwalk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/double-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dump-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/edit-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/errors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/et-forest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/except.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/explow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/expmed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/file-find.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/filenames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/flag-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fold-const.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/function-abi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/generic-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gengtype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/genrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gensupport.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ggc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-infer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimplify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/glimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graphds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graphite.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graphviz.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gsyms.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hashtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-table.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hwint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/inchash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/incpath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/input.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/intl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ira.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ira-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/is-a.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/langhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lcm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/libiberty.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/limitx.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/limity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/line-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lra-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/m2 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/m2/m2-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/machmode.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/machmode.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/make-unique.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/md5.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/memmodel.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/memory-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/objc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/obstack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-general.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/options.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opts-jobserver.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/output.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/passes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pointer-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/poly-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/predict.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/prefix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/print-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/profile-count.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/read-md.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/real.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/recog.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regcprop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regrename.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/reload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/resource.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sched-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/selftest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sese.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/signop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sparseset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sreal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/statistics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/stmt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/stringpool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/system.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-globals.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-insns.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/targhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/timevar.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/timevar.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tm_p.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/toplev.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tracer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-check.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/treestruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tristate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tsystem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/typeclass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ubsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/valtrack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-prof.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-range-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-range-storage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-relation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/varasm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vr-values.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/wide-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/xcoff.h was removed

--===============6661050629125212424==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-strace-upgrade-6.7-6.8.patch"

RnJvbSAyNzQ5ZDlhN2ZmZGIyNmJlMjg1YTFlMDgyOTEzODBmYTU2YjQxMTc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjE6MjI6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
dHJhY2U6IHVwZ3JhZGUgNi43IC0+IDYuOAoKLS0tCiAuLi50b2NvbmYtbWFjcm8tdG8tZGV0ZWN0
LWxhcmdlZmlsZS1zdXAucGF0Y2ggfCAgNiArLQogLi4uMDAxLXN0cmFjZS1maXgtcmVwcm9kdWNp
YmlsdHktaXNzdWVzLnBhdGNoIHwgIDkgKy0tCiAuLi4wMDItdGVzdHMtUmVwbGFjZS1vZmY2NF90
LXdpdGgtb2ZmX3QucGF0Y2ggfCAzNSArKysrKystLS0tCiAuLi4vc3RyYWNlL3N0cmFjZS9NYWtl
ZmlsZS1wdGVzdC5wYXRjaCAgICAgICAgfCAgOSArKy0KIC4uLi9zdHJhY2Uvc3RyYWNlL3B0ZXN0
LXNwYWNlc2F2ZS5wYXRjaCAgICAgICB8ICA3ICstCiAuLi4vc3RyYWNlL3N0cmFjZS9za2lwLWxv
YWQucGF0Y2ggICAgICAgICAgICAgfCAgOSArLS0KIC4uLi9zdHJhY2Uvc3RyYWNlL3VwZGF0ZS1n
YXdrLXBhdGhzLnBhdGNoICAgICB8IDcwICsrKysrKysrKystLS0tLS0tLS0KIC4uLi9zdHJhY2Uv
e3N0cmFjZV82LjcuYmIgPT4gc3RyYWNlXzYuOC5iYn0gICB8ICAyICstCiA4IGZpbGVzIGNoYW5n
ZWQsIDc2IGluc2VydGlvbnMoKyksIDcxIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9zdHJhY2Uve3N0cmFjZV82LjcuYmIgPT4gc3RyYWNlXzYuOC5iYn0gKDk2JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAxLWNv
bmZpZ3VyZS1Vc2UtYXV0b2NvbmYtbWFjcm8tdG8tZGV0ZWN0LWxhcmdlZmlsZS1zdXAucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAxLWNvbmZpZ3VyZS1Vc2Ut
YXV0b2NvbmYtbWFjcm8tdG8tZGV0ZWN0LWxhcmdlZmlsZS1zdXAucGF0Y2gKaW5kZXggNzZjYTdh
NzZhOC4uMjAyOGZlMmI0YSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFj
ZS9zdHJhY2UvMDAwMS1jb25maWd1cmUtVXNlLWF1dG9jb25mLW1hY3JvLXRvLWRldGVjdC1sYXJn
ZWZpbGUtc3VwLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNl
LzAwMDEtY29uZmlndXJlLVVzZS1hdXRvY29uZi1tYWNyby10by1kZXRlY3QtbGFyZ2VmaWxlLXN1
cC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNDcwMzk5ZjM2MzZjNDEyYjc0ZjlkYWY2YWU0
MzBiMTNjMzEyNmYwMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZGEzZjVkZmJiM2U2
NWEzMGU5YzFhMTU1OTU3OTY4OGVkMDg3MGQ4MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDE1IERlYyAyMDIy
IDE1OjU0OjI3IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZTogVXNlIGF1dG9jb25m
IG1hY3JvIHRvIGRldGVjdCBsYXJnZWZpbGUgc3VwcG9ydApAQCAtMTMsMTAgKzEzLDEwIEBAIFNp
Z25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmln
dXJlLmFjCi1pbmRleCA0Nzk3YjQyZGQuLjdkNTdmYjI1NCAxMDA2NDQKK2luZGV4IDM2ZmZmOTAu
LjllNDBhYjUgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwot
QEAgLTQzLDYgKzQzLDggQEAgQUNfUFJPR19JTlNUQUxMCitAQCAtNDIsNiArNDIsOCBAQCBBQ19Q
Uk9HX0lOU1RBTEwKICBBQ19QUk9HX1JBTkxJQgogIEFDX1BST0dfTE5fUwogIApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvMDAwMS1zdHJhY2UtZml4LXJl
cHJvZHVjaWJpbHR5LWlzc3Vlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uv
c3RyYWNlLzAwMDEtc3RyYWNlLWZpeC1yZXByb2R1Y2liaWx0eS1pc3N1ZXMucGF0Y2gKaW5kZXgg
YzRjMTc2ZTZiYy4uMGJlMjJmZjEwNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3N0cmFjZS9zdHJhY2UvMDAwMS1zdHJhY2UtZml4LXJlcHJvZHVjaWJpbHR5LWlzc3Vlcy5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAxLXN0cmFjZS1m
aXgtcmVwcm9kdWNpYmlsdHktaXNzdWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2MzA5
NzkyYzQ5Y2E5MDBjZWM2YTdmMWRjNWI1MWJmNzViNjI5ZTExIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAzOWRiNmZhNDc0NDQ3MmMyMDU4MGY4Mzg0ZTFiYmVlNDllM2IxYmJhIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmVyZW15IFB1aGxtYW4gPGpwdWhsbWFuQG12aXN0
YS5jb20+CiBEYXRlOiBXZWQsIDExIE1hciAyMDIwIDE5OjU2OjU1ICswMDAwCiBTdWJqZWN0OiBb
UEFUQ0hdIHN0cmFjZTogZml4IHJlcHJvZHVjaWJpbHR5IGlzc3VlcwpAQCAtMTMsNyArMTMsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBKZXJlbXkgUHVobG1hbiA8anB1aGxtYW5AbXZpc3RhLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0t
Z2l0IGEvdGVzdHMvZ2VuX3Rlc3RzLnNoIGIvdGVzdHMvZ2VuX3Rlc3RzLnNoCi1pbmRleCA1ZTFl
N2M5Li4xZTY1ZWFjIDEwMDc1NQoraW5kZXggOGY0NzY1MS4uNjUyNjdkYiAxMDA3NTUKIC0tLSBh
L3Rlc3RzL2dlbl90ZXN0cy5zaAogKysrIGIvdGVzdHMvZ2VuX3Rlc3RzLnNoCiBAQCAtNDYsNyAr
NDYsNyBAQCB3aGlsZSByZWFkIC1yIG5hbWUgYXJnMCBhcmdzOyBkbyB7CkBAIC0yNSw3ICsyNSw3
IEBAIGluZGV4IDVlMWU3YzkuLjFlNjVlYWMgMTAwNzU1CiAgCiAgCWNhc2UgIiRhcmcwIiBpbgog
IAkJKyopCi1AQCAtODAsNyArODAsNyBAQCB3aGlsZSByZWFkIC1yIG5hbWUgYXJnMCBhcmdzOyBk
byB7CitAQCAtOTEsNyArOTEsNyBAQCB3aGlsZSByZWFkIC1yIG5hbWUgYXJnMCBhcmdzOyBkbyB7
CiAgCiAgaWYgWyAtbiAiJG5hbWVzIiBdOyB0aGVuCiAgCXsKQEAgLTM0LDYgKzM0LDMgQEAgaW5k
ZXggNWUxZTdjOS4uMWU2NWVhYyAxMDA3NTUKICAJCXByaW50ZiAnR0VOX1RFU1RTID0nCiAgCQlw
cmludGYgJyAlcy5nZW4udGVzdCcgJG5hbWVzCiAgCQllY2hvCi0tLSAKLTIuMjQuMQotCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAyLXRlc3RzLVJl
cGxhY2Utb2ZmNjRfdC13aXRoLW9mZl90LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0
cmFjZS9zdHJhY2UvMDAwMi10ZXN0cy1SZXBsYWNlLW9mZjY0X3Qtd2l0aC1vZmZfdC5wYXRjaApp
bmRleCAwY2FiZGZlOTlmLi5lOWNkM2RiYjg3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAyLXRlc3RzLVJlcGxhY2Utb2ZmNjRfdC13aXRoLW9mZl90
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlLzAwMDItdGVz
dHMtUmVwbGFjZS1vZmY2NF90LXdpdGgtb2ZmX3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDU3OWIyZWJlNTJkNGI5N2Y5NTRlNjE4OGRmMmQwN2UxMzc4MjAwNzUgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDg3OTA3MDQxMDA0MjZiMGI5M2ZmZWZkZmJkMGM2YzBlMjg4Y2VkOTAg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgogRGF0ZTogVGh1LCAxNSBEZWMgMjAyMiAxNTo1NjoxMyAtMDgwMAogU3ViamVjdDogW1BB
VENIXSB0ZXN0czogUmVwbGFjZSBvZmY2NF90IHdpdGggb2ZmX3QKQEAgLTEwLDkgKzEwLDEyIEBA
IFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vc3RyYWNlL3N0
cmFjZS9wdWxsLzIzMF0KIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+CiAtLS0KICB0ZXN0cy9yZWFkYWhlYWQuYyAgICAgICAgfCAyICstCisgdGVzdHMvc3luY19m
aWxlX3JhbmdlLmMgIHwgNCArKy0tCiAgdGVzdHMvc3luY19maWxlX3JhbmdlMi5jIHwgNCArKy0t
Ci0gMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCisgMyBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiAKK2RpZmYgLS1n
aXQgYS90ZXN0cy9yZWFkYWhlYWQuYyBiL3Rlc3RzL3JlYWRhaGVhZC5jCitpbmRleCAxMDcyMzc4
Li5iOTU5N2U2IDEwMDY0NAogLS0tIGEvdGVzdHMvcmVhZGFoZWFkLmMKICsrKyBiL3Rlc3RzL3Jl
YWRhaGVhZC5jCiBAQCAtNDIsNyArNDIsNyBAQCBzdGF0aWMgY29uc3QgaW50IGZkc1tdID0gewpA
QCAtMjQsMjkgKzI3LDMzIEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiAgCS0weDgwMDAwMDAwMDAwMDAwMDBMTCwKICAJLTB4NTA2MDcwODA5MGEwYjBjMExM
LAogIAktMUxMLAotLS0tIGEvdGVzdHMvc3luY19maWxlX3JhbmdlMi5jCi0rKysgYi90ZXN0cy9z
eW5jX2ZpbGVfcmFuZ2UyLmMKK2RpZmYgLS1naXQgYS90ZXN0cy9zeW5jX2ZpbGVfcmFuZ2UuYyBi
L3Rlc3RzL3N5bmNfZmlsZV9yYW5nZS5jCitpbmRleCBlOTNhYjZjLi5kYzc2ODY1IDEwMDY0NAor
LS0tIGEvdGVzdHMvc3luY19maWxlX3JhbmdlLmMKKysrKyBiL3Rlc3RzL3N5bmNfZmlsZV9yYW5n
ZS5jCiBAQCAtMjAsOCArMjAsOCBAQCBpbnQKICBtYWluKHZvaWQpCiAgewogIAljb25zdCBpbnQg
ZmQgPSAtMTsKLS0JY29uc3Qgb2ZmNjRfdCBvZmZzZXQgPSAweGRlYWRiZWVmYmFkYzBkZWQ7Ci0t
CWNvbnN0IG9mZjY0X3QgbmJ5dGVzID0gMHhmYWNlZmVlZGNhZmVmMDBkOwotKwljb25zdCBvZmZf
dCBvZmZzZXQgPSAweGRlYWRiZWVmYmFkYzBkZWQ7Ci0rCWNvbnN0IG9mZl90IG5ieXRlcyA9IDB4
ZmFjZWZlZWRjYWZlZjAwZDsKKy0JY29uc3Qgb2ZmNjRfdCBvZmZzZXQgPSAweGRlYWRiZWVmYmFk
YzBkZWRVTEw7CistCWNvbnN0IG9mZjY0X3QgbmJ5dGVzID0gMHhmYWNlZmVlZGNhZmVmMDBkVUxM
OworKwljb25zdCBvZmZfdCBvZmZzZXQgPSAweGRlYWRiZWVmYmFkYzBkZWRVTEw7CisrCWNvbnN0
IG9mZl90IG5ieXRlcyA9IDB4ZmFjZWZlZWRjYWZlZjAwZFVMTDsKICAJY29uc3QgdW5zaWduZWQg
aW50IGZsYWdzID0gLTE7CiAgCiAgCWludCByYyA9IHN5bmNfZmlsZV9yYW5nZShmZCwgb2Zmc2V0
LCBuYnl0ZXMsIGZsYWdzKTsKLS0tLSBhL3Rlc3RzL3N5bmNfZmlsZV9yYW5nZS5jCi0rKysgYi90
ZXN0cy9zeW5jX2ZpbGVfcmFuZ2UuYworZGlmZiAtLWdpdCBhL3Rlc3RzL3N5bmNfZmlsZV9yYW5n
ZTIuYyBiL3Rlc3RzL3N5bmNfZmlsZV9yYW5nZTIuYworaW5kZXggYjhkYzcxMi4uZTRiMDAzYyAx
MDA2NDQKKy0tLSBhL3Rlc3RzL3N5bmNfZmlsZV9yYW5nZTIuYworKysrIGIvdGVzdHMvc3luY19m
aWxlX3JhbmdlMi5jCiBAQCAtMjAsOCArMjAsOCBAQCBpbnQKICBtYWluKHZvaWQpCiAgewogIAlj
b25zdCBpbnQgZmQgPSAtMTsKLS0JY29uc3Qgb2ZmNjRfdCBvZmZzZXQgPSAweGRlYWRiZWVmYmFk
YzBkZWRVTEw7Ci0tCWNvbnN0IG9mZjY0X3QgbmJ5dGVzID0gMHhmYWNlZmVlZGNhZmVmMDBkVUxM
OwotKwljb25zdCBvZmZfdCBvZmZzZXQgPSAweGRlYWRiZWVmYmFkYzBkZWRVTEw7Ci0rCWNvbnN0
IG9mZl90IG5ieXRlcyA9IDB4ZmFjZWZlZWRjYWZlZjAwZFVMTDsKKy0JY29uc3Qgb2ZmNjRfdCBv
ZmZzZXQgPSAweGRlYWRiZWVmYmFkYzBkZWQ7CistCWNvbnN0IG9mZjY0X3QgbmJ5dGVzID0gMHhm
YWNlZmVlZGNhZmVmMDBkOworKwljb25zdCBvZmZfdCBvZmZzZXQgPSAweGRlYWRiZWVmYmFkYzBk
ZWQ7CisrCWNvbnN0IG9mZl90IG5ieXRlcyA9IDB4ZmFjZWZlZWRjYWZlZjAwZDsKICAJY29uc3Qg
dW5zaWduZWQgaW50IGZsYWdzID0gLTE7CiAgCiAgCWludCByYyA9IHN5bmNfZmlsZV9yYW5nZShm
ZCwgb2Zmc2V0LCBuYnl0ZXMsIGZsYWdzKTsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9zdHJhY2Uvc3RyYWNlL01ha2VmaWxlLXB0ZXN0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3N0cmFjZS9zdHJhY2UvTWFrZWZpbGUtcHRlc3QucGF0Y2gKaW5kZXggOWFmNzczNzY2
Mi4uZTc3MTliNTMwMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9z
dHJhY2UvTWFrZWZpbGUtcHRlc3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0
cmFjZS9zdHJhY2UvTWFrZWZpbGUtcHRlc3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDFm
NTBlMGEwOWQ4MjhiZThmNWIxZjI4ZGI5YWYwYjEyNDkyYTE1NTMgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDJmZWEzYjMyYTlkZWJiMmQ0YjMzNWM0ODFiNGQwODAyMzE3YTAyYjAgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBHYWJyaWVsIEJhcmJ1IDxnYWJyaWVsLmJhcmJ1
QGVuZWEuY29tPgogRGF0ZTogVGh1LCAyNSBKdWwgMjAxMyAxNToyODozMyArMDIwMAogU3ViamVj
dDogW1BBVENIXSBzdHJhY2U6IEFkZCBwdGVzdApAQCAtOCwxNiArOCwxNSBAQCBVcHN0cmVhbS1T
dGF0dXM6IEluYXBwcm9wcmlhdGUKIFNpZ25lZC1vZmYtYnk6IEdhYnJpZWwgQmFyYnUgPGdhYnJp
ZWwuYmFyYnVAZW5lYS5jb20+CiBTaWduZWQtb2ZmLWJ5OiBDaG9uZyBMdSA8Q2hvbmcuTHVAd2lu
ZHJpdmVyLmNvbT4KIFNpZ25lZC1vZmYtYnk6IEFudWogTWl0dGFsIDxhbnVqLm1pdHRhbEBpbnRl
bC5jb20+Ci0KIC0tLQogIHRlc3RzL01ha2VmaWxlLmFtIHwgMjAgKysrKysrKysrKysrKysrKysr
KysKICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvdGVz
dHMvTWFrZWZpbGUuYW0gYi90ZXN0cy9NYWtlZmlsZS5hbQotaW5kZXggNTU1NjZlZS4uYTdhZTZm
OSAxMDA2NDQKK2luZGV4IGVmNjg4OTguLjczNWI3M2QgMTAwNjQ0CiAtLS0gYS90ZXN0cy9NYWtl
ZmlsZS5hbQogKysrIGIvdGVzdHMvTWFrZWZpbGUuYW0KLUBAIC0xNiw2ICsxNiw3IEBAIFNJWkVP
Rl9MT05HID0gQFNJWkVPRl9MT05HQAorQEAgLTE4LDYgKzE4LDcgQEAgU0laRU9GX0xPTkcgPSBA
U0laRU9GX0xPTkdACiAgTVBFUlNfTkFNRSA9CiAgTVBFUlNfQ0NfRkxBR1MgPQogIEFSQ0hfTUZM
QUdTID0KQEAgLTI1LDcgKzI0LDcgQEAgaW5kZXggNTU1NjZlZS4uYTdhZTZmOSAxMDA2NDQKICBB
TV9DRkxBR1MgPSAkKFdBUk5fQ0ZMQUdTKQogIGJ1bmRsZWRfQ1BQRkxBR1MgPQogIGlmIFVTRV9C
VU5ETEVEX0hFQURFUlMKLUBAIC03MDMsMyArNzA0LDIyIEBAIEJVSUxUX1NPVVJDRVMgPSBrc3lz
ZW50LmgKK0BAIC04ODksMyArODkwLDIyIEBAIEJVSUxUX1NPVVJDRVMgPSBrc3lzZW50LmgKICBD
TEVBTkZJTEVTID0ga3N5c2VudC5oCiAgCiAgaW5jbHVkZSAuLi9zcmMvc2Nuby5hbQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvcHRlc3Qtc3BhY2VzYXZl
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvcHRlc3Qtc3BhY2Vz
YXZlLnBhdGNoCmluZGV4IDRlODZjY2FkYzUuLjdkMjJkYTlmMzggMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlL3B0ZXN0LXNwYWNlc2F2ZS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS9wdGVzdC1zcGFjZXNhdmUucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDNmYWQ0ODIxZDkwY2QyNjRkMWI5NDI1M2I5Y2Y0ZmRm
NWQ0MDM0YjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGM1ZGIwMjQzYzc4N2UwMjMx
MDRlYTA0ODgwYjAxNjdiZGJkNDc0YjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBS
aWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6
IFdlZCwgMjkgTWF5IDIwMTkgMDA6MTA6MzIgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gc3RyYWNl
OiBUd2VhayBwdGVzdCBkaXNrIHNwYWNlIG1hbmFnZW1lbnQKQEAgLTksMTYgKzksMTUgQEAgdXNp
bmcgYXJvdW5kIDYwME1CIG9mIGRpc2sgc3BhY2UgYW5kIHJ1bm5pbmcgb3VyIHB0ZXN0IGltYWdl
cyBvdXQgb2Ygc3BhY2UuCiBSUCAyMDE5LzUvMjkKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJv
cHJpYXRlIFtzcGVjaWZpYyB0byBPRSBpbWFnZSBzcGFjZSBpc3N1ZXNdCi0KIC0tLQogIHRlc3Rz
L2dlbl90ZXN0cy5zaCB8IDEgKwogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBk
aWZmIC0tZ2l0IGEvdGVzdHMvZ2VuX3Rlc3RzLnNoIGIvdGVzdHMvZ2VuX3Rlc3RzLnNoCi1pbmRl
eCAzNTQwMjA0Li41ZTFlN2M5IDEwMDc1NQoraW5kZXggY2UxNDY3ZS4uOGY0NzY1MSAxMDA3NTUK
IC0tLSBhL3Rlc3RzL2dlbl90ZXN0cy5zaAogKysrIGIvdGVzdHMvZ2VuX3Rlc3RzLnNoCi1AQCAt
NjIsNiArNjIsNyBAQCB3aGlsZSByZWFkIC1yIG5hbWUgYXJnMCBhcmdzOyBkbyB7CitAQCAtNzMs
NiArNzMsNyBAQCB3aGlsZSByZWFkIC1yIG5hbWUgYXJnMCBhcmdzOyBkbyB7CiAgCQkkaGRyCiAg
CQkuICJcJHtzcmNkaXI9Ln0vaW5pdC5zaCIKICAJCXJ1bl9zdHJhY2VfbWF0Y2hfZGlmZiAkYXJn
MCAkYXJncwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2Uv
c2tpcC1sb2FkLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2Uvc2tp
cC1sb2FkLnBhdGNoCmluZGV4IGIxYWNmZGE1ZDguLmNkYzg5N2ZjMTQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlL3NraXAtbG9hZC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS9za2lwLWxvYWQucGF0Y2gKQEAgLTEs
OSArMSwxMyBAQAorRnJvbSBjODVmZGJlNzk1NzMzZmRlNjUwNjc0NTQ5OWYyMzk4MGM3MGM3MmM1
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9u
QGFybS5jb20+CitEYXRlOiBNb24sIDMxIEphbiAyMDIyIDE3OjQwOjEzICswMDAwCitTdWJqZWN0
OiBbUEFUQ0hdIHN0cmFjZTogc2tpcCBhIG51bWJlciBvZiBsb2FkLXNlbnNpdGl2ZSB0ZXN0cwor
CiBTa2lwIHRlc3RzIHdoaWNoIGFyZSBrbm93biB0byBiZSB1bnJlbGlhYmxlIHVuZGVyIGxvYWQs
IHR5cGljYWxseSBiZWNhdXNlIHRoZXkKIGNhcmUgYWJvdXQgdGltaW5nLgogCiBVcHN0cmVhbS1T
dGF0dXM6IEluYXBwcm9wcmlhdGUKIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1
cnRvbkBhcm0uY29tPgotCiAtLS0KICB0ZXN0cy9jbG9ja19uYW5vc2xlZXAuZ2VuLnRlc3QgfCAx
ICsKICB0ZXN0cy9kZWxheS50ZXN0ICAgICAgICAgICAgICAgfCAxICsKQEAgLTQ0LDYgKzQ4LDMg
QEAgaW5kZXggODI5OTczNy4uZDg5YzdkZiAxMDA3NTUKICAKICByX29wdD0iJHsxOi0tcn0iCiAg
Ci0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNl
L3N0cmFjZS91cGRhdGUtZ2F3ay1wYXRocy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9z
dHJhY2Uvc3RyYWNlL3VwZGF0ZS1nYXdrLXBhdGhzLnBhdGNoCmluZGV4IGExNmVkZTk1YzIuLmVm
ZThiMWYwODIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNl
L3VwZGF0ZS1nYXdrLXBhdGhzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJh
Y2Uvc3RyYWNlL3VwZGF0ZS1nYXdrLXBhdGhzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0
Y2QyNmNmYWVjMjU1ZWM4N2YyMmFiZTg4NmUwYmU4OTMxMmE5NjcxIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA5NWJjYzhhNmYyYWU3Mzg4ODMyNTcyYTI2ODljMjY5OTRhYTdiODhmIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmUgTWNDdXJkeSA8YXJtY2N1cmR5QGdt
YWlsLmNvbT4KIERhdGU6IE1vbiwgMTggSmFuIDIwMTYgMTE6MDE6MDAgLTA4MDAKIFN1YmplY3Q6
IFtQQVRDSF0gdXBkYXRlIGdhd2sgcGF0aHMsIC9iaW4vZ2F3ayAtPiAvdXNyL2Jpbi9nYXdrCkBA
IC0xMSwyMiArMTEsMjQgQEAgZnJvbSAjIS9iaW4vZ2F3ayB0byAjIS91c3IvYmluL2dhd2suIEZp
eGVzIG1pc3NpbmcgUkRQRU5EUyBRQSB0ZXN0czoKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3By
aWF0ZSBbY29uZmlndXJhdGlvbl0KIAogU2lnbmVkLW9mZi1ieTogQW5kcmUgTWNDdXJkeSA8YXJt
Y2N1cmR5QGdtYWlsLmNvbT4KLQogLS0tCiAgc3JjL21wZXJzLmF3ayAgICAgICAgICAgICAgIHwg
MiArLQorIHRlc3RzLW0zMi9jYXBzLWFiYnJldi5hd2sgICB8IDIgKy0KICB0ZXN0cy1tMzIvY2Fw
cy5hd2sgICAgICAgICAgfCAyICstCiAgdGVzdHMtbTMyL21hdGNoLmF3ayAgICAgICAgIHwgMiAr
LQogIHRlc3RzLW0zMi9ydF9zaWdhY3Rpb24uYXdrICB8IDIgKy0KKyB0ZXN0cy1teDMyL2NhcHMt
YWJicmV2LmF3ayAgfCAyICstCiAgdGVzdHMtbXgzMi9jYXBzLmF3ayAgICAgICAgIHwgMiArLQog
IHRlc3RzLW14MzIvbWF0Y2guYXdrICAgICAgICB8IDIgKy0KICB0ZXN0cy1teDMyL3J0X3NpZ2Fj
dGlvbi5hd2sgfCAyICstCisgdGVzdHMvY2Fwcy1hYmJyZXYuYXdrICAgICAgIHwgMiArLQogIHRl
c3RzL2NhcHMuYXdrICAgICAgICAgICAgICB8IDIgKy0KICB0ZXN0cy9tYXRjaC5hd2sgICAgICAg
ICAgICAgfCAyICstCiAgdGVzdHMvcnRfc2lnYWN0aW9uLmF3ayAgICAgIHwgMiArLQotIDEwIGZp
bGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQorIDEzIGZpbGVz
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0
IGEvc3JjL21wZXJzLmF3ayBiL3NyYy9tcGVycy5hd2sKLWluZGV4IDI1YTIxMmYuLmIyZmY1M2Yg
MTAwNjQ0CitpbmRleCA0MjVhYjY1Li4zM2VjZTVjIDEwMDY0NAogLS0tIGEvc3JjL21wZXJzLmF3
awogKysrIGIvc3JjL21wZXJzLmF3awogQEAgLTEsNCArMSw0IEBACkBAIC0zNSw2ICszNywxNiBA
QCBpbmRleCAyNWEyMTJmLi5iMmZmNTNmIDEwMDY0NAogICMKICAjIENvcHlyaWdodCAoYykgMjAx
NSBFbHZpcmEgS2hhYmlyb3ZhIDxsaW5lcHJpbnRlcjBAZ21haWwuY29tPgogICMgQ29weXJpZ2h0
IChjKSAyMDE1LTIwMTYgRG1pdHJ5IFYuIExldmluIDxsZHZAc3RyYWNlLmlvPgorZGlmZiAtLWdp
dCBhL3Rlc3RzLW0zMi9jYXBzLWFiYnJldi5hd2sgYi90ZXN0cy1tMzIvY2Fwcy1hYmJyZXYuYXdr
CitpbmRleCBlODM5M2ZkLi43NmM0ZTUxIDEwMDY0NAorLS0tIGEvdGVzdHMtbTMyL2NhcHMtYWJi
cmV2LmF3aworKysrIGIvdGVzdHMtbTMyL2NhcHMtYWJicmV2LmF3aworQEAgLTEsNCArMSw0IEBA
CistIyEvYmluL2dhd2sKKysjIS91c3IvYmluL2dhd2sKKyAjCisgIyBUaGlzIGZpbGUgaXMgcGFy
dCBvZiBjYXBzIHN0cmFjZSB0ZXN0LgorICMKIGRpZmYgLS1naXQgYS90ZXN0cy1tMzIvY2Fwcy5h
d2sgYi90ZXN0cy1tMzIvY2Fwcy5hd2sKIGluZGV4IDY5NTAwZWMuLmU1ZGZkODcgMTAwNjQ0CiAt
LS0gYS90ZXN0cy1tMzIvY2Fwcy5hd2sKQEAgLTY1LDYgKzc3LDE2IEBAIGluZGV4IGRjZTc4ZjUu
LjU3M2Q5ZWEgMTAwNjQ0CiAgIwogICMgQ29weXJpZ2h0IChjKSAyMDE0LTIwMTUgRG1pdHJ5IFYu
IExldmluIDxsZHZAc3RyYWNlLmlvPgogICMgQ29weXJpZ2h0IChjKSAyMDE2IEVsdmlyYSBLaGFi
aXJvdmEgPGxpbmVwcmludGVyMEBnbWFpbC5jb20+CitkaWZmIC0tZ2l0IGEvdGVzdHMtbXgzMi9j
YXBzLWFiYnJldi5hd2sgYi90ZXN0cy1teDMyL2NhcHMtYWJicmV2LmF3aworaW5kZXggZTgzOTNm
ZC4uNzZjNGU1MSAxMDA2NDQKKy0tLSBhL3Rlc3RzLW14MzIvY2Fwcy1hYmJyZXYuYXdrCisrKysg
Yi90ZXN0cy1teDMyL2NhcHMtYWJicmV2LmF3aworQEAgLTEsNCArMSw0IEBACistIyEvYmluL2dh
d2sKKysjIS91c3IvYmluL2dhd2sKKyAjCisgIyBUaGlzIGZpbGUgaXMgcGFydCBvZiBjYXBzIHN0
cmFjZSB0ZXN0LgorICMKIGRpZmYgLS1naXQgYS90ZXN0cy1teDMyL2NhcHMuYXdrIGIvdGVzdHMt
bXgzMi9jYXBzLmF3awogaW5kZXggNjk1MDBlYy4uZTVkZmQ4NyAxMDA2NDQKIC0tLSBhL3Rlc3Rz
LW14MzIvY2Fwcy5hd2sKQEAgLTk1LDYgKzExNywxNiBAQCBpbmRleCBkY2U3OGY1Li41NzNkOWVh
IDEwMDY0NAogICMKICAjIENvcHlyaWdodCAoYykgMjAxNC0yMDE1IERtaXRyeSBWLiBMZXZpbiA8
bGR2QHN0cmFjZS5pbz4KICAjIENvcHlyaWdodCAoYykgMjAxNiBFbHZpcmEgS2hhYmlyb3ZhIDxs
aW5lcHJpbnRlcjBAZ21haWwuY29tPgorZGlmZiAtLWdpdCBhL3Rlc3RzL2NhcHMtYWJicmV2LmF3
ayBiL3Rlc3RzL2NhcHMtYWJicmV2LmF3aworaW5kZXggZTgzOTNmZC4uNzZjNGU1MSAxMDA2NDQK
Ky0tLSBhL3Rlc3RzL2NhcHMtYWJicmV2LmF3aworKysrIGIvdGVzdHMvY2Fwcy1hYmJyZXYuYXdr
CitAQCAtMSw0ICsxLDQgQEAKKy0jIS9iaW4vZ2F3aworKyMhL3Vzci9iaW4vZ2F3aworICMKKyAj
IFRoaXMgZmlsZSBpcyBwYXJ0IG9mIGNhcHMgc3RyYWNlIHRlc3QuCisgIwogZGlmZiAtLWdpdCBh
L3Rlc3RzL2NhcHMuYXdrIGIvdGVzdHMvY2Fwcy5hd2sKIGluZGV4IDY5NTAwZWMuLmU1ZGZkODcg
MTAwNjQ0CiAtLS0gYS90ZXN0cy9jYXBzLmF3awpAQCAtMTI1LDMzICsxNTcsMyBAQCBpbmRleCBk
Y2U3OGY1Li41NzNkOWVhIDEwMDY0NAogICMKICAjIENvcHlyaWdodCAoYykgMjAxNC0yMDE1IERt
aXRyeSBWLiBMZXZpbiA8bGR2QHN0cmFjZS5pbz4KICAjIENvcHlyaWdodCAoYykgMjAxNiBFbHZp
cmEgS2hhYmlyb3ZhIDxsaW5lcHJpbnRlcjBAZ21haWwuY29tPgotZGlmZiAtLWdpdCBhL3Rlc3Rz
LW0zMi9jYXBzLWFiYnJldi5hd2sgYi90ZXN0cy1tMzIvY2Fwcy1hYmJyZXYuYXdrCi1pbmRleCBj
MDAwMjNiLi5hNTZjZDU2IDEwMDY0NAotLS0tIGEvdGVzdHMtbTMyL2NhcHMtYWJicmV2LmF3awot
KysrIGIvdGVzdHMtbTMyL2NhcHMtYWJicmV2LmF3awotQEAgLTEsNCArMSw0IEBACi0tIyEvYmlu
L2dhd2sKLSsjIS91c3IvYmluL2dhd2sKLSAjCi0gIyBUaGlzIGZpbGUgaXMgcGFydCBvZiBjYXBz
IHN0cmFjZSB0ZXN0LgotICMKLWRpZmYgLS1naXQgYS90ZXN0cy1teDMyL2NhcHMtYWJicmV2LmF3
ayBiL3Rlc3RzLW14MzIvY2Fwcy1hYmJyZXYuYXdrCi1pbmRleCBjMDAwMjNiLi5hNTZjZDU2IDEw
MDY0NAotLS0tIGEvdGVzdHMtbXgzMi9jYXBzLWFiYnJldi5hd2sKLSsrKyBiL3Rlc3RzLW14MzIv
Y2Fwcy1hYmJyZXYuYXdrCi1AQCAtMSw0ICsxLDQgQEAKLS0jIS9iaW4vZ2F3awotKyMhL3Vzci9i
aW4vZ2F3awotICMKLSAjIFRoaXMgZmlsZSBpcyBwYXJ0IG9mIGNhcHMgc3RyYWNlIHRlc3QuCi0g
IwotZGlmZiAtLWdpdCBhL3Rlc3RzL2NhcHMtYWJicmV2LmF3ayBiL3Rlc3RzL2NhcHMtYWJicmV2
LmF3awotaW5kZXggYzAwMDIzYi4uYTU2Y2Q1NiAxMDA2NDQKLS0tLSBhL3Rlc3RzL2NhcHMtYWJi
cmV2LmF3awotKysrIGIvdGVzdHMvY2Fwcy1hYmJyZXYuYXdrCi1AQCAtMSw0ICsxLDQgQEAKLS0j
IS9iaW4vZ2F3awotKyMhL3Vzci9iaW4vZ2F3awotICMKLSAjIFRoaXMgZmlsZSBpcyBwYXJ0IG9m
IGNhcHMgc3RyYWNlIHRlc3QuCi0gIwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3N0cmFjZS9zdHJhY2VfNi43LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJh
Y2VfNi44LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzYuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3N0cmFjZS9zdHJhY2VfNi44LmJiCmluZGV4IGYzNjU0NzdjY2QuLmIyMmM1N2I0NWQgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzYuNy5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZV82LjguYmIKQEAgLTE1LDcgKzE1
LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL3N0cmFjZS5pby9maWxlcy8ke1BWfS9zdHJhY2UtJHtQ
Vn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtY29uZmlndXJlLVVzZS1hdXRvY29u
Zi1tYWNyby10by1kZXRlY3QtbGFyZ2VmaWxlLXN1cC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAyLXRlc3RzLVJlcGxhY2Utb2ZmNjRfdC13aXRoLW9mZl90LnBhdGNoIFwKICAgICAgICAg
ICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjIwOTAyMDFlMWEzZmYzMjg0NmY0ZmU0MjFjMTE2
M2IxNWY0NDBiYjM4ZTMxMzU1ZDA5ZjgyZDM5NDk5MjJhZjciCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYmE2OTUwYTk2ODI0Y2RmOTNhNTg0ZmEwNGYwYTczMzg5NmQyYTZiYzVmMGFkOWZmZTUwNWQ5
YjQxZTk3MDE0OSIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcHRlc3QKIAotLSAKMi40Mi4wCgo=

--===============6661050629125212424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/strace: PV changed from "6.7" to "6.8"
packages/core2-64-poky-linux/strace: PKGV changed from 6.7 [default] to 6.8 [default]
packages/core2-64-poky-linux/strace: SRC_URI changed from "https://strace.io/files/6.7/strace-6.7.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch file://0002-tests-Replace-off64_t-with-off_t.patch" to "https://strace.io/files/6.8/strace-6.8.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch file://0002-tests-Replace-off64_t-with-off_t.patch"
packages/core2-64-poky-linux/strace/strace-dbg: FILELIST: added "/usr/lib/strace/ptest/tests/.debug/lsm_set_self_attr /usr/lib/strace/ptest/tests/.debug/listmount-success /usr/lib/strace/ptest/tests/.debug/statmount-success /usr/lib/strace/ptest/tests/.debug/lsm_get_self_attr-success /usr/lib/strace/ptest/tests/.debug/dev-pty-yy /usr/lib/strace/ptest/tests/.debug/listmount /usr/lib/strace/ptest/tests/.debug/statmount /usr/lib/strace/ptest/tests/.debug/lsm_list_modules-success /usr/lib/strace/ptest/tests/.debug/lsm_get_self_attr /usr/lib/strace/ptest/tests/.debug/lsm_list_modules /usr/lib/strace/ptest/tests/.debug/tcp_ao"
packages/core2-64-poky-linux/strace/strace-dbg: PV changed from "6.7" to "6.8"
packages/core2-64-poky-linux/strace/strace-dbg: PKGSIZE changed from 57721744 to 58356136 (+1%)
packages/core2-64-poky-linux/strace/strace-dbg: PKGV changed from 6.7 [default] to 6.8 [default]
packages/core2-64-poky-linux/strace/strace-dev: PV changed from "6.7" to "6.8"
packages/core2-64-poky-linux/strace/strace-dev: PKGV changed from 6.7 [default] to 6.8 [default]
packages/core2-64-poky-linux/strace/strace-doc: PV changed from "6.7" to "6.8"
packages/core2-64-poky-linux/strace/strace-doc: PKGSIZE changed from 57901 to 58275 (+1%)
packages/core2-64-poky-linux/strace/strace-doc: PKGV changed from 6.7 [default] to 6.8 [default]
packages/core2-64-poky-linux/strace/strace-locale: PV changed from "6.7" to "6.8"
packages/core2-64-poky-linux/strace/strace-locale: PKGV changed from 6.7 [default] to 6.8 [default]
packages/core2-64-poky-linux/strace/strace-ptest: FILELIST: added "/usr/lib/strace/ptest/tests/lsm_get_self_attr-success /usr/lib/strace/ptest/tests/lsm_set_self_attr /usr/lib/strace/ptest/tests/strace-k-with-depth-limit.test /usr/lib/strace/ptest/tests/lsm_list_modules-success /usr/lib/strace/ptest/tests/statmount /usr/lib/strace/ptest/tests/listmount /usr/lib/strace/ptest/tests/strace-k-with-depth-limit.expected /usr/lib/strace/ptest/tests/tcp_ao /usr/lib/strace/ptest/tests/dev-pty-yy /usr/lib/strace/ptest/tests/lsm_list_modules-success.gen.test /usr/lib/strace/ptest/tests/listmount.gen.test /usr/lib/strace/ptest/tests/statmount.gen.test /usr/lib/strace/ptest/tests/listmount-success /usr/lib/strace/ptest/tests/statmount-success /usr/lib/strace/ptest/tests/lsm_get_self_attr-success.gen.test /usr/lib/strace/ptest/tests/lsm_set_self_attr.gen.test /usr/lib/strace/ptest/tests/lsm_get_self_attr /usr/lib/strace/ptest/tests/dev-pty-yy.gen.test /usr/lib/strace/ptest/tests/tcp_ao.gen.test /u
 sr/lib/strace/ptest/tests/lsm_get_self_attr.gen.test /usr/lib/strace/ptest/tests/listmount-success.gen.test /usr/lib/strace/ptest/tests/statmount-success.gen.test /usr/lib/strace/ptest/tests/lsm_list_modules.gen.test /usr/lib/strace/ptest/tests/lsm_list_modules"
packages/core2-64-poky-linux/strace/strace-ptest: PV changed from "6.7" to "6.8"
packages/core2-64-poky-linux/strace/strace-ptest: PKGSIZE changed from 31812099 to 32100671 (+1%)
packages/core2-64-poky-linux/strace/strace-ptest: PKGV changed from 6.7 [default] to 6.8 [default]
packages/core2-64-poky-linux/strace/strace-src: FILELIST: directory renamed /usr/src/debug/strace/6.7/src/linux/generic -> /usr/src/debug/strace/6.8/src/linux/generic, directory renamed /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/netfilter -> /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/netfilter, directory renamed /usr/src/debug/strace/6.7/src/linux/i386 -> /usr/src/debug/strace/6.8/src/linux/i386, directory renamed /usr/src/debug/strace/6.7/src/gen -> /usr/src/debug/strace/6.8/src/gen, directory renamed /usr/src/debug/strace/6.7/src/linux/x86_64 -> /usr/src/debug/strace/6.8/src/linux/x86_64, directory renamed /usr/src/debug/strace/6.7/bundled/linux/include/uapi/asm -> /usr/src/debug/strace/6.8/bundled/linux/include/uapi/asm, directory renamed /usr/src/debug/strace/6.7/bundled/linux/include/uapi/rdma -> /usr/src/debug/strace/6.8/bundled/linux/include/uapi/rdma, directory renamed /usr/src/debug/strace/6.7/bundled/linux/include/uapi/mtd -> /usr/src/debug/s
 trace/6.8/bundled/linux/include/uapi/mtd, directory renamed /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/netfilter/ipset -> /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/netfilter/ipset, removed "/usr/src/debug/strace/6.7/src/cachestat.c /usr/src/debug/strace/6.7/tests/chown32.c /usr/src/debug/strace/6.7/tests/nfnetlink_ulog.c /usr/src/debug/strace/6.7/src/cachestat.h /usr/src/debug/strace/6.7/src/xlat/if_dqblk_valid.h /usr/src/debug/strace/6.7/tests/semop.c /usr/src/debug/strace/6.7/src/rtnl_netconf.c /usr/src/debug/strace/6.7/src/xlat/term_line_discs.h /usr/src/debug/strace/6.7/src/xlat/sock_rds_options.h /usr/src/debug/strace/6.7/tests/nlattr_tc_stats.c /usr/src/debug/strace/6.7/tests/printflags.c /usr/src/debug/strace/6.7/tests/at_fdcwd-pathmax.c /usr/src/debug/strace/6.7/src/xlat/netlink_socket_flags.h /usr/src/debug/strace/6.7/src/mknod.c /usr/src/debug/strace/6.7/tests/semtimedop-syscall.c /usr/src/debug/strace/6.7/tests/faccessat--secontext.c /usr/
 src/debug/strace/6.7/src/xlat/rtnl_route_attrs.h /usr/src/debug/strace/6.7/tests/sprintrc.c /usr/src/debug/strace/6.7/src/xlat/ptp_pin_funcs.h /usr/src/debug/strace/6.7/src/xlat/mlockall_flags.h /usr/src/debug/strace/6.7/src/xlat/fiemap_extent_flags.h /usr/src/debug/strace/6.7/tests/netlink_kobject_uevent.c /usr/src/debug/strace/6.7/tests/rt_sigpending.c /usr/src/debug/strace/6.7/src/filter_qualify.c /usr/src/debug/strace/6.7/src/xlat/v4l2_input_types.h /usr/src/debug/strace/6.7/src/xlat/open_resolve_flags.h /usr/src/debug/strace/6.7/src/xlat/in6_addr_gen_mode.h /usr/src/debug/strace/6.7/src/xlat/v4l2_tuner_types.h /usr/src/debug/strace/6.7/tests/readdir.c /usr/src/debug/strace/6.7/tests/recvmsg.c /usr/src/debug/strace/6.7/src/xlat/fib_rule_actions.h /usr/src/debug/strace/6.7/src/xlat/compat_ptrace_cmds.h /usr/src/debug/strace/6.7/src/xlat/aio_cmds.h /usr/src/debug/strace/6.7/tests/print_quoted_string.c /usr/src/debug/strace/6.7/src/xlat/mtd_file_mode_options.h /usr/src/debug/strace
 /6.7/tests/pause.c /usr/src/debug/strace/6.7/tests/perf_event_open_nonverbose.c /usr/src/debug/strace/6.7/src/xlat/netlink_sk_meminfo_indices.h /usr/src/debug/strace/6.7/src/syslog.c /usr/src/debug/strace/6.7/tests/libmmsg.c /usr/src/debug/strace/6.7/tests/readlink.c /usr/src/debug/strace/6.7/tests/recvfrom.c /usr/src/debug/strace/6.7/tests/renameat.c /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_info_attrs.h /usr/src/debug/strace/6.7/src/xlat/v4l2_control_flags.h /usr/src/debug/strace/6.7/src/ipc_shm.c /usr/src/debug/strace/6.7/src/xlat/term_oflags_bsdly.h /usr/src/debug/strace/6.7/src/xlat/open_access_modes.h /usr/src/debug/strace/6.7/src/xlat/kd_key_types.h /usr/src/debug/strace/6.7/src/xlat/ieee802154_addrs.h /usr/src/debug/strace/6.7/src/landlock.c /usr/src/debug/strace/6.7/src/xlat/mtd_flags_options.h /usr/src/debug/strace/6.7/src/xlat/sock_raw_options.h /usr/src/debug/strace/6.7/src/xlat/fspick_flags.h /usr/src/debug/strace/6.7/src/xlat/landlock_rule_types.h /usr/src/debug/str
 ace/6.7/src/xlat/key_perms.h /usr/src/debug/strace/6.7/tests/getpid.c /usr/src/debug/strace/6.7/tests/ip_mreq.c /usr/src/debug/strace/6.7/tests/ipc_msg.c /usr/src/debug/strace/6.7/src/regset.c /usr/src/debug/strace/6.7/src/xlat/kvm_exit_reason.h /usr/src/debug/strace/6.7/tests/ipc_sem.c /usr/src/debug/strace/6.7/tests/ipc_shm.c /usr/src/debug/strace/6.7/src/move_mount.c /usr/src/debug/strace/6.7/src/delay.c /usr/src/debug/strace/6.7/tests/prctl-name.c /usr/src/debug/strace/6.7/src/kernel_rusage.h /usr/src/debug/strace/6.7/src/delay.h /usr/src/debug/strace/6.7/tests/print_time.c /usr/src/debug/strace/6.7/tests/block_reset_raise_run.c /usr/src/debug/strace/6.7/src/link.c /usr/src/debug/strace/6.7/src/filter.h /usr/src/debug/strace/6.7/src/xlat/arp_hardware_types.h /usr/src/debug/strace/6.7/tests/prlimit64.c /usr/src/debug/strace/6.7/tests/tampering-notes.c /usr/src/debug/strace/6.7/tests/netlink_selinux.c /usr/src/debug/strace/6.7/src/xlat/ebpf_class.h /usr/src/debug/strace/6.7/src/xl
 at/termios_cc.h /usr/src/debug/strace/6.7/src/xlat/v4l2_format_description_flags.h /usr/src/debug/strace/6.7/src/xlat/sock_sctp_options.h /usr/src/debug/strace/6.7/src/xlat/nf_cthelper_msg_types.h /usr/src/debug/strace/6.7/src/xlat/btrfs_qgroup_ctl_cmds.h /usr/src/debug/strace/6.7/tests/waitid.c /usr/src/debug/strace/6.7/tests/ioctl_scsi.c /usr/src/debug/strace/6.7/tests/tracer_ppid_pgid_sid.c /usr/src/debug/strace/6.7/src/xlat/rtnl_neightbl_parms_attrs.h /usr/src/debug/strace/6.7/tests/test_printstrn.c /usr/src/debug/strace/6.7/tests/rt_sigaction.c /usr/src/debug/strace/6.7/src/bpf_fprog.h /usr/src/debug/strace/6.7/tests/getdents64.c /usr/src/debug/strace/6.7/tests/looping_threads.c /usr/src/debug/strace/6.7/tests/nlattr_ifaddrmsg.c /usr/src/debug/strace/6.7/src/xattr.c /usr/src/debug/strace/6.7/tests/stat64.c /usr/src/debug/strace/6.7/src/rtnl_neightbl.c /usr/src/debug/strace/6.7/src/fetch_struct_msghdr.c /usr/src/debug/strace/6.7/tests/dup2.c /usr/src/debug/strace/6.7/src/xlat/if
 stats_xstats_bond_attrs.h /usr/src/debug/strace/6.7/src/xlat/ifstats_xstats_type_attrs.h /usr/src/debug/strace/6.7/src/keyctl.c /usr/src/debug/strace/6.7/src/xlat/v4l2_control_query_flags.h /usr/src/debug/strace/6.7/tests/test_printpath.c /usr/src/debug/strace/6.7/tests/fill_memory.c /usr/src/debug/strace/6.7/tests/futex_wait.c /usr/src/debug/strace/6.7/src/xlat/kd_default_led_flags.h /usr/src/debug/strace/6.7/tests/localtime.c /usr/src/debug/strace/6.7/tests/lock_file.c /usr/src/debug/strace/6.7/src/xlat/dirent_types.h /usr/src/debug/strace/6.7/src/xlat/sigact_flags.h /usr/src/debug/strace/6.7/src/xlat/umount_flags.h /usr/src/debug/strace/6.7/tests/sockaddr_xlat.c /usr/src/debug/strace/6.7/src/xlat/vsock_cids.h /usr/src/debug/strace/6.7/src/xlat/pr_unalign_flags.h /usr/src/debug/strace/6.7/src/xgetdents.c /usr/src/debug/strace/6.7/src/xlat/seccomp_ioctl_notif_flags.h /usr/src/debug/strace/6.7/src/xlat/btrfs_balance_args.h /usr/src/debug/strace/6.7/src/xgetdents.h /usr/src/debug/str
 ace/6.7/tests/getgroups.c /usr/src/debug/strace/6.7/src/filter_seccomp.c /usr/src/debug/strace/6.7/tests/printstr.c /usr/src/debug/strace/6.7/src/filter_seccomp.h /usr/src/debug/strace/6.7/src/xlat/statx_masks.h /usr/src/debug/strace/6.7/src/xlat/bpf_file_flags.h /usr/src/debug/strace/6.7/src/term.c /usr/src/debug/strace/6.7/src/xlat/fan_event_flags.h /usr/src/debug/strace/6.7/tests/nfnetlink_cttimeout.c /usr/src/debug/strace/6.7/src/xlat/inet_diag_attrs.h /usr/src/debug/strace/6.7/src/xlat/unix_diag_attrs.h /usr/src/debug/strace/6.7/src/syscall_name.c /usr/src/debug/strace/6.7/src/xlat/pr_cap_ambient.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/fib_rules.h /usr/src/debug/strace/6.7/src/xlat/sigev_value.h /usr/src/debug/strace/6.7/tests/unlinkat.c /usr/src/debug/strace/6.7/src/xlat/v4l2_input_capabilities_flags.h /usr/src/debug/strace/6.7/tests/ugetrlimit.c /usr/src/debug/strace/6.7/src/chdir.c /usr/src/debug/strace/6.7/tests/print_ppid_tracerpid.c /usr/src/debug/str
 ace/6.7/tests/nlattr_unix_diag_msg.c /usr/src/debug/strace/6.7/tests/test_nlattr.h /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_vf_stats_attrs.h /usr/src/debug/strace/6.7/tests/execve.c /usr/src/debug/strace/6.7/src/xmalloc.h /usr/src/debug/strace/6.7/src/xmalloc.c /usr/src/debug/strace/6.7/tests/process_mrelease.c /usr/src/debug/strace/6.7/src/xlat/bootflags1.h /usr/src/debug/strace/6.7/src/ptrace.h /usr/src/debug/strace/6.7/src/xlat/btrfs_send_flags.h /usr/src/debug/strace/6.7/tests/pkey_free.c /usr/src/debug/strace/6.7/src/ptrace.c /usr/src/debug/strace/6.7/src/strace.c /usr/src/debug/strace/6.7/tests/get_page_size.c /usr/src/debug/strace/6.7/src/xlat/rtnl_netconf_attrs.h /usr/src/debug/strace/6.7/src/xlat/rtnl_nexthop_attrs.h /usr/src/debug/strace/6.7/src/xlat/btrfs_csum_types.h /usr/src/debug/strace/6.7/src/xlat/delete_module_flags.h /usr/src/debug/strace/6.7/src/xlat/perf_event_read_format.h /usr/src/debug/strace/6.7/tests/prctl-pdeathsig.c /usr/src/debug/strace/6.7/tests/lsta
 t64.c /usr/src/debug/strace/6.7/src/xlat/aio_iocb_flags.h /usr/src/debug/strace/6.7/tests/status-all.c /usr/src/debug/strace/6.7/tests/strace--decode-pids-comm.c /usr/src/debug/strace/6.7/tests/nlattr_br_port_msg.c /usr/src/debug/strace/6.7/src/xlat/ethernet_protocols.h /usr/src/debug/strace/6.7/tests/recv-MSG_TRUNC.c /usr/src/debug/strace/6.7/tests/attach-p-cmd.h /usr/src/debug/strace/6.7/tests/threads-execve.c /usr/src/debug/strace/6.7/src/kexec.c /usr/src/debug/strace/6.7/tests/fchmodat2--secontext.c /usr/src/debug/strace/6.7/tests/inotify_init.c /usr/src/debug/strace/6.7/src/fstatfs64.c /usr/src/debug/strace/6.7/src/xlat/bt_protocols.h /usr/src/debug/strace/6.7/src/xlat/fan_classes.h /usr/src/debug/strace/6.7/src/xlat/bpf_map_update_elem_flags.h /usr/src/debug/strace/6.7/src/watchdog_ioctl.c /usr/src/debug/strace/6.7/src/xlat/evdev_ff_status.h /usr/src/debug/strace/6.7/src/map_shadow_stack.c /usr/src/debug/strace/6.7/src/xlat/sock_ip_options.h /usr/src/debug/strace/6.7/src/xlat/
 bpf_attach_type.h /usr/src/debug/strace/6.7/src/xlat/madvise_hppa_generic_cmds.h /usr/src/debug/strace/6.7/tests/signalfd4.c /usr/src/debug/strace/6.7/tests/hexdump_strdup.c /usr/src/debug/strace/6.7/tests/nfnetlink_cthelper.c /usr/src/debug/strace/6.7/src/personality.c /usr/src/debug/strace/6.7/src/xlat/term_oflags.h /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_info_data_bridge_attrs.h /usr/src/debug/strace/6.7/tests/fsconfig.c /usr/src/debug/strace/6.7/src/xlat/hw_breakpoint_type.h /usr/src/debug/strace/6.7/src/xlat/v4l2_sdr_fmts.h /usr/src/debug/strace/6.7/tests/check_sigign.c /usr/src/debug/strace/6.7/tests/ioctl_sock_gifconf.c /usr/src/debug/strace/6.7/src/xlat/ifaddrflags.h /usr/src/debug/strace/6.7/src/xlat/usagewho.h /usr/src/debug/strace/6.7/tests/getcpu.c /usr/src/debug/strace/6.7/tests/quotactl_fd.c /usr/src/debug/strace/6.7/tests/getcwd.c /usr/src/debug/strace/6.7/src/xlat/rtnl_tca_stats_attrs.h /usr/src/debug/strace/6.7/src/futex.c /usr/src/debug/strace/6.7/tests/fadvis
 e.h /usr/src/debug/strace/6.7/tests/kexec_file_load.c /usr/src/debug/strace/6.7/tests/seccomp-filter.c /usr/src/debug/strace/6.7/src/dirent.c /usr/src/debug/strace/6.7/tests/nlattr_nhmsg.c /usr/src/debug/strace/6.7/src/xlat/kd_keymap_flags.h /usr/src/debug/strace/6.7/src/ipc_msg.c /usr/src/debug/strace/6.7/src/xlat/bpf_map_lookup_elem_flags.h /usr/src/debug/strace/6.7/src/print_dev_t.c /usr/src/debug/strace/6.7/src/xlat/adjtimex_state.h /usr/src/debug/strace/6.7/tests/map_shadow_stack.c /usr/src/debug/strace/6.7/src/statx.c /usr/src/debug/strace/6.7/src/xlat/rxrpc_services.h /usr/src/debug/strace/6.7/src/xlat/mctp_addrs.h /usr/src/debug/strace/6.7/src/statx.h /usr/src/debug/strace/6.7/src/epoll.c /usr/src/debug/strace/6.7/src/print_timex.h /usr/src/debug/strace/6.7/src/xlat/nl_route_types.h /usr/src/debug/strace/6.7/tests/eventfd.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/mroute6.h /usr/src/debug/strace/6.7/src/utimes.c /usr/src/debug/strace/6.7/tests/netlink_inet_
 diag.c /usr/src/debug/strace/6.7/src/xlat/syslog_action_type.h /usr/src/debug/strace/6.7/src/poll.c /usr/src/debug/strace/6.7/tests/sysctl.c /usr/src/debug/strace/6.7/tests/nfnetlink_ipset.c /usr/src/debug/strace/6.7/tests/nfnetlink_queue.c /usr/src/debug/strace/6.7/src/bpf_seccomp_filter.c /usr/src/debug/strace/6.7/src/xlat/netlink_protocols.h /usr/src/debug/strace/6.7/tests/pipe2.c /usr/src/debug/strace/6.7/src/signal.c /usr/src/debug/strace/6.7/src/xlat/personality_flags.h /usr/src/debug/strace/6.7/src/xlat/perf_event_open_flags.h /usr/src/debug/strace/6.7/src/xlat/btrfs_qgroup_inherit_flags.h /usr/src/debug/strace/6.7/src/xlat/sock_alg_options.h /usr/src/debug/strace/6.7/src/xlat/schedulers.h /usr/src/debug/strace/6.7/tests/check_sigblock.c /usr/src/debug/strace/6.7/src/chmod.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/userfaultfd.h /usr/src/debug/strace/6.7/tests/clone_ptrace.c /usr/src/debug/strace/6.7/src/xlat/af_packet_versions.h /usr/src/debug/strace/6.7/sr
 c/xlat/if_dqinfo_valid.h /usr/src/debug/strace/6.7/tests/adjtimex.c /usr/src/debug/strace/6.7/tests/lseek.c /usr/src/debug/strace/6.7/tests/orphaned_process_group.c /usr/src/debug/strace/6.7/tests/ioctl_random.c /usr/src/debug/strace/6.7/tests/aio_pgetevents.c /usr/src/debug/strace/6.7/tests/epoll_wait.c /usr/src/debug/strace/6.7/tests/s390_guarded_storage.c /usr/src/debug/strace/6.7/src/lookup_dcookie.c /usr/src/debug/strace/6.7/src/ioprio.c /usr/src/debug/strace/6.7/tests/tests.h /usr/src/debug/strace/6.7/src/sigevent.h /usr/src/debug/strace/6.7/src/xlat/bpf_op_alu.h /usr/src/debug/strace/6.7/tests/ioctl_counter.c /usr/src/debug/strace/6.7/src/xlat/btrfs_features_incompat.h /usr/src/debug/strace/6.7/tests/nfnetlink_ctnetlink_exp.c /usr/src/debug/strace/6.7/tests/ip_protocol.c /usr/src/debug/strace/6.7/src/xlat/rtnl_rta_metrics_attrs.h /usr/src/debug/strace/6.7/tests/fallocate.c /usr/src/debug/strace/6.7/src/xlat/pr_sme_vl_flags.h /usr/src/debug/strace/6.7/src/xlat/pr_sve_vl_flags.
 h /usr/src/debug/strace/6.7/tests/error_msg.c /usr/src/debug/strace/6.7/src/xlat/mount_setattr_flags.h /usr/src/debug/strace/6.7/src/xlat/mptcp_subflow_flags.h /usr/src/debug/strace/6.7/src/capability.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/perf_event.h /usr/src/debug/strace/6.7/src/rtnl_tc_action.c /usr/src/debug/strace/6.7/src/xlat/ptrace_cmds.h /usr/src/debug/strace/6.7/tests/fspick.c /usr/src/debug/strace/6.7/src/xlat/membarrier_cmds.h /usr/src/debug/strace/6.7/tests/net-yy-inet.c /usr/src/debug/strace/6.7/src/xlat/ioprio_who.h /usr/src/debug/strace/6.7/tests/riscv_flush_icache.c /usr/src/debug/strace/6.7/tests/quotactl.h /usr/src/debug/strace/6.7/src/xlat/memfd_create_flags.h /usr/src/debug/strace/6.7/src/xlat/fchmodat_flags.h /usr/src/debug/strace/6.7/tests/remap_file_pages.c /usr/src/debug/strace/6.7/tests/quotactl.c /usr/src/debug/strace/6.7/src/xlat/cap_mask1.h /usr/src/debug/strace/6.7/tests/fcntl64.c /usr/src/debug/strace/6.7/bundled/linux/include/uap
 i/linux/rtnetlink.h /usr/src/debug/strace/6.7/tests/seccomp_get_notif_sizes.c /usr/src/debug/strace/6.7/tests/setresgid32.c /usr/src/debug/strace/6.7/tests/setresuid32.c /usr/src/debug/strace/6.7/tests/ioctl_evdev-success.c /usr/src/debug/strace/6.7/src/lseek.c /usr/src/debug/strace/6.7/src/xlat/pr_dumpable.h /usr/src/debug/strace/6.7/src/xlat/move_mount_flags.h /usr/src/debug/strace/6.7/src/xlat/seccomp_ret_action.h /usr/src/debug/strace/6.7/tests/prctl-syscall-user-dispatch.c /usr/src/debug/strace/6.7/src/xlat/netlink_delete_flags.h /usr/src/debug/strace/6.7/src/xlat/ubi_volume_props.h /usr/src/debug/strace/6.7/src/xlat/term_cflags.h /usr/src/debug/strace/6.7/tests/sockopt-sol_netlink.c /usr/src/debug/strace/6.7/src/wait.c /usr/src/debug/strace/6.7/src/fetch_struct_flock.c /usr/src/debug/strace/6.7/src/fetch_struct_iovec.c /usr/src/debug/strace/6.7/src/xlat/sock_llc_options.h /usr/src/debug/strace/6.7/src/fsmount.c /usr/src/debug/strace/6.7/src/xlat/bpf_prog_flags.h /usr/src/debug
 /strace/6.7/src/xlat/bpf_prog_types.h /usr/src/debug/strace/6.7/src/counter_ioctl.c /usr/src/debug/strace/6.7/src/xlat/kd_key_fn_key_vals.h /usr/src/debug/strace/6.7/tests/ioctl_nsfs.c /usr/src/debug/strace/6.7/tests/mount.c /usr/src/debug/strace/6.7/tests/pkey_alloc.c /usr/src/debug/strace/6.7/tests/prctl-set-ptracer-success.c /usr/src/debug/strace/6.7/tests/fchdir.c /usr/src/debug/strace/6.7/tests/so_peercred.c /usr/src/debug/strace/6.7/src/xlat/evdev_ev.h /usr/src/debug/strace/6.7/src/xlat/futexops.h /usr/src/debug/strace/6.7/src/fchownat.c /usr/src/debug/strace/6.7/tests/bpf.c /usr/src/debug/strace/6.7/src/xlat/ptp_perout_flags.h /usr/src/debug/strace/6.7/tests/epoll_pwait2.c /usr/src/debug/strace/6.7/src/netlink.h /usr/src/debug/strace/6.7/src/xlat/snmp_ip_stats.h /usr/src/debug/strace/6.7/src/netlink.c /usr/src/debug/strace/6.7/src/xlat/sock_type_flags.h /usr/src/debug/strace/6.7/src/xlat/fsmagic.h /usr/src/debug/strace/6.7/src/dirent64.c /usr/src/debug/strace/6.7/tests/attach
 -p-cmd-p.c /usr/src/debug/strace/6.7/src/util.c /usr/src/debug/strace/6.7/tests/keyctl.c /usr/src/debug/strace/6.7/src/fetch_struct_stat64.c /usr/src/debug/strace/6.7/src/statfs.h /usr/src/debug/strace/6.7/src/statfs.c /usr/src/debug/strace/6.7/src/xlat/pidfd_open_flags.h /usr/src/debug/strace/6.7/tests/nlattr_rtmsg.c /usr/src/debug/strace/6.7/src/xlat/netlink_diag_show.h /usr/src/debug/strace/6.7/src/process_vm.c /usr/src/debug/strace/6.7/tests/epoll_ctl.c /usr/src/debug/strace/6.7/tests/ioctl_ubi.c /usr/src/debug/strace/6.7/tests/setugid.c /usr/src/debug/strace/6.7/src/xlat/mpol_mode_flags.h /usr/src/debug/strace/6.7/src/xlat/open_mode_flags.h /usr/src/debug/strace/6.7/src/xlat/ifstats_offload_attrs.h /usr/src/debug/strace/6.7/src/xlat/lirc_features.h /usr/src/debug/strace/6.7/src/xlat/x86_xfeatures.h /usr/src/debug/strace/6.7/src/xlat/netlink_states.h /usr/src/debug/strace/6.7/tests/prctl-tid_address.c /usr/src/debug/strace/6.7/src/xlat/v4l2_tuner_rxsubchanses.h /usr/src/debug/st
 race/6.7/src/xlat/nl_xfrm_types.h /usr/src/debug/strace/6.7/src/xlat/inet_diag_ulp_info_tls_attrs.h /usr/src/debug/strace/6.7/tests/msg_control.c /usr/src/debug/strace/6.7/tests/fchmod.c /usr/src/debug/strace/6.7/src/sys_func.h /usr/src/debug/strace/6.7/src/xlat/tee_ioctl_shm_flags.h /usr/src/debug/strace/6.7/tests/mincore.c /usr/src/debug/strace/6.7/src/xlat/nlmsgerr_attrs.h /usr/src/debug/strace/6.7/src/print_mac.c /usr/src/debug/strace/6.7/src/printmode.c /usr/src/debug/strace/6.7/tests/inotify.c /usr/src/debug/strace/6.7/tests/ustat.c /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_xdp_attrs.h /usr/src/debug/strace/6.7/src/xlat/fsmount_flags.h /usr/src/debug/strace/6.7/src/xlat/kd_font_flags.h /usr/src/debug/strace/6.7/tests/umovestr2.c /usr/src/debug/strace/6.7/src/xlat/sock_ipx_options.h /usr/src/debug/strace/6.7/tests/sockopt-sol_socket.c /usr/src/debug/strace/6.7/src/desc.c /usr/src/debug/strace/6.7/src/xlat/bpf_query_flags.h /usr/src/debug/strace/6.7/src/xlat/uring_register_op
 codes.h /usr/src/debug/strace/6.7/tests/kernel_version.c /usr/src/debug/strace/6.7/src/sysinfo.c /usr/src/debug/strace/6.7/src/get_personality.h /usr/src/debug/strace/6.7/tests/execve--secontext.c /usr/src/debug/strace/6.7/src/bpf_filter.c /usr/src/debug/strace/6.7/tests/recvmmsg-timeout.c /usr/src/debug/strace/6.7/src/bpf_filter.h /usr/src/debug/strace/6.7/src/xlat/bootflags2.h /usr/src/debug/strace/6.7/src/xlat/bpf_test_run_flags.h /usr/src/debug/strace/6.7/src/xlat/shm_resource_flags.h /usr/src/debug/strace/6.7/src/xlat/perf_event_sample_format.h /usr/src/debug/strace/6.7/tests/setns.c /usr/src/debug/strace/6.7/src/xlat/numa_node.h /usr/src/debug/strace/6.7/tests/prctl-tagged-addr.c /usr/src/debug/strace/6.7/src/rtnl_cachereport.c /usr/src/debug/strace/6.7/tests/nlattr_ndtmsg.c /usr/src/debug/strace/6.7/tests/status-none-f.c /usr/src/debug/strace/6.7/tests/pidfd_send_signal.c /usr/src/debug/strace/6.7/src/xlat/uffd_poison_mode_flags.h /usr/src/debug/strace/6.7/src/xlat/timerfdfla
 gs.h /usr/src/debug/strace/6.7/src/xlat/rtnl_nexthop_grp_types.h /usr/src/debug/strace/6.7/src/xlat/sock_nfcllcp_options.h /usr/src/debug/strace/6.7/tests/pidns-cache.c /usr/src/debug/strace/6.7/src/print_group_req.c /usr/src/debug/strace/6.7/src/xlat/keyctl_caps0.h /usr/src/debug/strace/6.7/src/xlat/keyctl_caps1.h /usr/src/debug/strace/6.7/src/xlat/msgctl_flags.h /usr/src/debug/strace/6.7/src/xlat/rtc_vl_flags.h /usr/src/debug/strace/6.7/src/xlat/semctl_flags.h /usr/src/debug/strace/6.7/src/xlat/shmctl_flags.h /usr/src/debug/strace/6.7/src/xlat/sigill_codes.h /usr/src/debug/strace/6.7/src/xlat/skf_ad.h /usr/src/debug/strace/6.7/src/xlat/bsg_subprotocol.h /usr/src/debug/strace/6.7/tests/time_enjoyment.h /usr/src/debug/strace/6.7/src/xlat/phonet_protocols.h /usr/src/debug/strace/6.7/src/xlat/uring_op_flags.h /usr/src/debug/strace/6.7/src/netlink_netfilter.c /usr/src/debug/strace/6.7/src/xlat/inet_diag_bpf_storage_attrs.h /usr/src/debug/strace/6.7/src/xlat/rtnl_mdba_mdb_eattr_attrs.h 
 /usr/src/debug/strace/6.7/src/xlat/rtnl_mdba_mdb_entry_attrs.h /usr/src/debug/strace/6.7/tests/netlink_xfrm.c /usr/src/debug/strace/6.7/tests/stack-fcall-2.c /usr/src/debug/strace/6.7/src/xlat/lirc_modes.h /usr/src/debug/strace/6.7/src/xlat/mpol_modes.h /usr/src/debug/strace/6.7/tests/printxval.c /usr/src/debug/strace/6.7/tests/stack-fcall-0.c /usr/src/debug/strace/6.7/src/xlat/rtnl_mdb_attrs.h /usr/src/debug/strace/6.7/src/hostname.c /usr/src/debug/strace/6.7/tests/modify_ldt.c /usr/src/debug/strace/6.7/src/xlat/blkpg_ops.h /usr/src/debug/strace/6.7/src/xlat/sg_io_info.h /usr/src/debug/strace/6.7/src/xlat/uring_ops.h /usr/src/debug/strace/6.7/tests/fork-f.c /usr/src/debug/strace/6.7/src/xlat/ebpf_mode.h /usr/src/debug/strace/6.7/src/xlat/pr_sched_core_cmds.h /usr/src/debug/strace/6.7/tests/inet-cmsg.c /usr/src/debug/strace/6.7/tests/rt_sigqueueinfo.c /usr/src/debug/strace/6.7/tests/qual_inject-error-signal.c /usr/src/debug/strace/6.7/src/xlat/nf_nft_compat_msg_types.h /usr/src/debu
 g/strace/6.7/tests/pkey_mprotect.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/vm_sockets.h /usr/src/debug/strace/6.7/src/print_fields.h /usr/src/debug/strace/6.7/src/xlat/ptrace_events.h /usr/src/debug/strace/6.7/tests/semtimedop_time64.c /usr/src/debug/strace/6.7/src/xlat/close_range_flags.h /usr/src/debug/strace/6.7/tests/sxetmask.c /usr/src/debug/strace/6.7/src/xlat/term_oflags_vtdly.h /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_ext_filter_flags.h /usr/src/debug/strace/6.7/src/xlat/ip_cmsg_types.h /usr/src/debug/strace/6.7/src/xlat/ipc_msg_flags.h /usr/src/debug/strace/6.7/src/xlat/ubi_data_types.h /usr/src/debug/strace/6.7/tests/create_nl_socket.c /usr/src/debug/strace/6.7/tests/rmdir.c /usr/src/debug/strace/6.7/src/xlat/resources.h /usr/src/debug/strace/6.7/tests/ioctl_kvm_run.c /usr/src/debug/strace/6.7/tests/status-successful-threads.c /usr/src/debug/strace/6.7/tests/prctl-pac-enabled-keys.c /usr/src/debug/strace/6.7/src/ipc.c /usr/src/debug/strace/6.7/src/rt
 c.c /usr/src/debug/strace/6.7/tests/nanosleep.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/socket.h /usr/src/debug/strace/6.7/tests/sleep.c /usr/src/debug/strace/6.7/tests/openat--secontext.c /usr/src/debug/strace/6.7/tests/sendfile64.c /usr/src/debug/strace/6.7/tests/net-yy-netlink.c /usr/src/debug/strace/6.7/src/access.c /usr/src/debug/strace/6.7/src/xlat/ifstats_attr_flags.h /usr/src/debug/strace/6.7/tests/chroot.c /usr/src/debug/strace/6.7/src/xlat/sock_netlink_options.h /usr/src/debug/strace/6.7/src/xlat/futex2_flags.h /usr/src/debug/strace/6.7/src/xlat/futex2_sizes.h /usr/src/debug/strace/6.7/src/readlink.c /usr/src/debug/strace/6.7/src/xlat/kd_key_brl_keys.h /usr/src/debug/strace/6.7/src/sigaltstack.c /usr/src/debug/strace/6.7/src/xlat/kd_key_cur_keys.h /usr/src/debug/strace/6.7/src/xlat/kd_key_pad_keys.h /usr/src/debug/strace/6.7/tests/scm_pidfd.c /usr/src/debug/strace/6.7/src/fstatfs.c /usr/src/debug/strace/6.7/tests/sched_xetscheduler.c /usr/src/debug/strac
 e/6.7/src/strauss.c /usr/src/debug/strace/6.7/tests/prctl-mce-kill.c /usr/src/debug/strace/6.7/src/socketutils.c /usr/src/debug/strace/6.7/src/strauss.h /usr/src/debug/strace/6.7/src/xlat/nl_sock_diag_types.h /usr/src/debug/strace/6.7/src/xlat/ifstats_attrs.h /usr/src/debug/strace/6.7/src/xlat/icmp_filter_flags.h /usr/src/debug/strace/6.7/src/xlat/quota_formats.h /usr/src/debug/strace/6.7/src/utime.c /usr/src/debug/strace/6.7/src/print_sg_req_info.c /usr/src/debug/strace/6.7/tests/mknodat.c /usr/src/debug/strace/6.7/src/xlat/sa_handler_values.h /usr/src/debug/strace/6.7/src/kernel_timeval.h /usr/src/debug/strace/6.7/src/pidfd_open.c /usr/src/debug/strace/6.7/src/xlat/bpf_stats_type.h /usr/src/debug/strace/6.7/src/xlat/perf_attr_size.h /usr/src/debug/strace/6.7/tests/vmsplice.c /usr/src/debug/strace/6.7/tests/linkat.c /usr/src/debug/strace/6.7/tests/setgroups.c /usr/src/debug/strace/6.7/src/fetch_struct_xfs_quotastat.c /usr/src/debug/strace/6.7/src/xlat/bpf_size.h /usr/src/debug/stra
 ce/6.7/src/get_robust_list.c /usr/src/debug/strace/6.7/src/sched.c /usr/src/debug/strace/6.7/src/xlat/smc_diag_mode.h /usr/src/debug/strace/6.7/tests/dup3.c /usr/src/debug/strace/6.7/src/fetch_struct_statfs.c /usr/src/debug/strace/6.7/src/xlat/rtnl_neigh_attrs.h /usr/src/debug/strace/6.7/src/syscall.c /usr/src/debug/strace/6.7/src/xlat/perf_sw_ids.h /usr/src/debug/strace/6.7/tests/printpath-umovestr.c /usr/src/debug/strace/6.7/src/syscall.h /usr/src/debug/strace/6.7/src/swapon.c /usr/src/debug/strace/6.7/tests/filter_seccomp-perf.c /usr/src/debug/strace/6.7/src/xlat/sock_dccp_options.h /usr/src/debug/strace/6.7/src/affinity.c /usr/src/debug/strace/6.7/src/xlat/ifstats_af_spec_mpls_attrs.h /usr/src/debug/strace/6.7/src/xlat/uffd_api_features.h /usr/src/debug/strace/6.7/tests/fchmodat2.c /usr/src/debug/strace/6.7/src/xlat/sock_shutdown_flags.h /usr/src/debug/strace/6.7/tests/net-sockaddr.c /usr/src/debug/strace/6.7/src/xlat/bsg_protocol.h /usr/src/debug/strace/6.7/src/xlat/uring_setup
 _features.h /usr/src/debug/strace/6.7/tests/times.c /usr/src/debug/strace/6.7/tests/move_mount.c /usr/src/debug/strace/6.7/src/fetch_struct_mmsghdr.c /usr/src/debug/strace/6.7/src/kcmp.c /usr/src/debug/strace/6.7/tests/ioctl_kvm_run_auxstr_vcpu.c /usr/src/debug/strace/6.7/src/xlat/sock_ax25_options.h /usr/src/debug/strace/6.7/src/xlat/evdev_relative_axes.h /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_af_spec_bridge_attrs.h /usr/src/debug/strace/6.7/tests/rt_sigtimedwait.c /usr/src/debug/strace/6.7/tests/prctl-capbset.c /usr/src/debug/strace/6.7/tests/ioperm.c /usr/src/debug/strace/6.7/tests/tkill.c /usr/src/debug/strace/6.7/tests/file_handle.c /usr/src/debug/strace/6.7/tests/waitpid.c /usr/src/debug/strace/6.7/src/xlat/inet6_if_flags.h /usr/src/debug/strace/6.7/tests/sigprocmask.c /usr/src/debug/strace/6.7/src/print_time.c /usr/src/debug/strace/6.7/tests/int_0x80.c /usr/src/debug/strace/6.7/tests/semop-common.c /usr/src/debug/strace/6.7/src/xlat/evdev_mtslots.h /usr/src/debug/strace
 /6.7/tests/list_sigaction_signum.c /usr/src/debug/strace/6.7/tests/qual_fault.c /usr/src/debug/strace/6.7/src/xlat/keyctl_move_flags.h /usr/src/debug/strace/6.7/tests/nfnetlink_osf.c /usr/src/debug/strace/6.7/src/xlat/evdev_misc.h /usr/src/debug/strace/6.7/src/xlat/kcmp_types.h /usr/src/debug/strace/6.7/src/xlat/quotatypes.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/smc_diag.h /usr/src/debug/strace/6.7/src/xlat/perf_ioctl_flags.h /usr/src/debug/strace/6.7/tests/netlink_generic.c /usr/src/debug/strace/6.7/tests/filter-unavailable.c /usr/src/debug/strace/6.7/tests/fanotify_mark--secontext.c /usr/src/debug/strace/6.7/tests/get_process_reaper.c /usr/src/debug/strace/6.7/tests/status.c /usr/src/debug/strace/6.7/tests/nlattr_mdba_router_port.c /usr/src/debug/strace/6.7/src/xlat/btrfs_snap_flags_v2.h /usr/src/debug/strace/6.7/src/xlat/kvm_cpuid_flags.h /usr/src/debug/strace/6.7/tests/oldselect.c /usr/src/debug/strace/6.7/src/xlat/multicast_router_types.h /usr/src/debug/str
 ace/6.7/src/xlat/kvm_mem_flags.h /usr/src/debug/strace/6.7/src/basic_filters.c /usr/src/debug/strace/6.7/tests/clock_nanosleep.c /usr/src/debug/strace/6.7/tests/redirect-fds.c /usr/src/debug/strace/6.7/src/xlat/pr_spec_get_store_bypass_flags.h /usr/src/debug/strace/6.7/src/xlat/pr_spec_set_store_bypass_flags.h /usr/src/debug/strace/6.7/src/xlat/keyctl_pkey_ops.h /usr/src/debug/strace/6.7/tests/execveat--secontext.c /usr/src/debug/strace/6.7/tests/quotactl-xfs.c /usr/src/debug/strace/6.7/tests/filter_seccomp-flag.c /usr/src/debug/strace/6.7/src/xlat/kexec_file_load_flags.h /usr/src/debug/strace/6.7/src/xlat/v4l2_fields.h /usr/src/debug/strace/6.7/tests/nlattr_mdba_mdb_entry.c /usr/src/debug/strace/6.7/tests/semtimedop-ipc.c /usr/src/debug/strace/6.7/src/xlat/setns_types.h /usr/src/debug/strace/6.7/src/xlat/tls_info_ciphers.h /usr/src/debug/strace/6.7/src/rtnl_dcb.c /usr/src/debug/strace/6.7/src/xlat/tcflsh_options.h /usr/src/debug/strace/6.7/src/xlat/clone3_flags.h /usr/src/debug/str
 ace/6.7/tests/printsignal.c /usr/src/debug/strace/6.7/tests/status-failed.c /usr/src/debug/strace/6.7/src/xlat/btrfs_defrag_flags.h /usr/src/debug/strace/6.7/src/xlat/x86_xfeature_bits.h /usr/src/debug/strace/6.7/src/xlat/ebpf_op_alu.h /usr/src/debug/strace/6.7/tests/open--secontext.c /usr/src/debug/strace/6.7/src/xlat/gpio_v2_line_attr_ids.h /usr/src/debug/strace/6.7/src/fetch_struct_keyctl_kdf_params.c /usr/src/debug/strace/6.7/src/netlink_route.h /usr/src/debug/strace/6.7/src/netlink_route.c /usr/src/debug/strace/6.7/src/xlat/archvals.h /usr/src/debug/strace/6.7/src/native_printer_decls.h /usr/src/debug/strace/6.7/src/uname.c /usr/src/debug/strace/6.7/src/xlat/syslog_console_levels.h /usr/src/debug/strace/6.7/src/xlat/v4l2_control_id_bases.h /usr/src/debug/strace/6.7/tests/siginfo.c /usr/src/debug/strace/6.7/tests/dev-yy.c /usr/src/debug/strace/6.7/tests/setfsugid.c /usr/src/debug/strace/6.7/tests/setreugid.c /usr/src/debug/strace/6.7/src/xlat/inotify_flags.h /usr/src/debug/strac
 e/6.7/src/xlat/routing_scopes.h /usr/src/debug/strace/6.7/tests/clone-flags.c /usr/src/debug/strace/6.7/tests/getresugid.c /usr/src/debug/strace/6.7/src/xlat/inet_diag_shutdown_flags.h /usr/src/debug/strace/6.7/src/xlat/crypto_nl_attrs.h /usr/src/debug/strace/6.7/src/oldstat.c /usr/src/debug/strace/6.7/src/xlat/btrfs_qgroup_status_flags.h /usr/src/debug/strace/6.7/src/netlink_smc_diag.c /usr/src/debug/strace/6.7/src/xlat/sg_io_dxfer_direction.h /usr/src/debug/strace/6.7/tests/setgroups32.c /usr/src/debug/strace/6.7/src/print_utils.h /usr/src/debug/strace/6.7/src/xlat/v4l2_tuner_audmodes.h /usr/src/debug/strace/6.7/src/xlat/mount_attr_attr.h /usr/src/debug/strace/6.7/tests/xetpriority.c /usr/src/debug/strace/6.7/tests/llseek.c /usr/src/debug/strace/6.7/src/xlat/nf_ctnetlink_msg_types.h /usr/src/debug/strace/6.7/tests/pipe_maxfd.c /usr/src/debug/strace/6.7/src/fs_x_ioctl.c /usr/src/debug/strace/6.7/src/xlat/inet_diag_ulp_info_mptcp_attrs.h /usr/src/debug/strace/6.7/src/xlat/rtnl_neigh
 tbl_attrs.h /usr/src/debug/strace/6.7/src/clone.c /usr/src/debug/strace/6.7/tests/chmod--secontext.c /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_brport_attrs.h /usr/src/debug/strace/6.7/src/xlat/af_packet_types.h /usr/src/debug/strace/6.7/src/xlat/rtnl_nha_res_bucket_attrs.h /usr/src/debug/strace/6.7/src/xlat/btrfs_space_info_flags.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/keyctl.h /usr/src/debug/strace/6.7/tests/umovestr_cached.c /usr/src/debug/strace/6.7/tests/prctl_marker.c /usr/src/debug/strace/6.7/tests/futex_requeue.c /usr/src/debug/strace/6.7/tests/xstatfsx.c /usr/src/debug/strace/6.7/src/bjm.c /usr/src/debug/strace/6.7/src/kvm.c /usr/src/debug/strace/6.7/src/mem.c /usr/src/debug/strace/6.7/tests/ioctl_winsize.c /usr/src/debug/strace/6.7/src/xlat/ebpf_regs.h /usr/src/debug/strace/6.7/src/mmap_notify.h /usr/src/debug/strace/6.7/tests/lookup_dcookie.c /usr/src/debug/strace/6.7/tests/execveat.c /usr/src/debug/strace/6.7/tests/xetitimer.c /usr/src/debug/strace
 /6.7/src/xlat/futexbitset.h /usr/src/debug/strace/6.7/src/mmap_notify.c /usr/src/debug/strace/6.7/src/xlat/sock_kcm_options.h /usr/src/debug/strace/6.7/tests/mknod.c /usr/src/debug/strace/6.7/tests/netlink_sock_diag.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/dqblk_xfs.h /usr/src/debug/strace/6.7/src/xlat/ipccalls.h /usr/src/debug/strace/6.7/src/aio.c /usr/src/debug/strace/6.7/src/xlat/epollevents.h /usr/src/debug/strace/6.7/tests/nlattr_inet_diag_req_compat.c /usr/src/debug/strace/6.7/src/xlat/counter_ioctl_event_types.h /usr/src/debug/strace/6.7/src/xlat/mount_attr_propagation.h /usr/src/debug/strace/6.7/tests/epoll_pwait.c /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_af_spec_inet6_attrs.h /usr/src/debug/strace/6.7/tests/ioctl_loop.c /usr/src/debug/strace/6.7/tests/rt_sigreturn.c /usr/src/debug/strace/6.7/tests/uname.c /usr/src/debug/strace/6.7/src/xlat/packet_diag_info_flags.h /usr/src/debug/strace/6.7/src/stat.c /usr/src/debug/strace/6.7/src/xlat.c /usr/src/debu
 g/strace/6.7/src/xlat/btrfs_dev_replace_results.h /usr/src/debug/strace/6.7/tests/net-accept-connect.c /usr/src/debug/strace/6.7/src/stat.h /usr/src/debug/strace/6.7/src/xlat.h /usr/src/debug/strace/6.7/src/xlat/netfilter_versions.h /usr/src/debug/strace/6.7/src/xlat/sock_bluetooth_options.h /usr/src/debug/strace/6.7/tests/landlock_restrict_self.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/bsg.h /usr/src/debug/strace/6.7/src/xlat/perf_type_id.h /usr/src/debug/strace/6.7/tests/tprintf.c /usr/src/debug/strace/6.7/tests/print_maxfd.c /usr/src/debug/strace/6.7/src/open_tree.c /usr/src/debug/strace/6.7/tests/openat.c /usr/src/debug/strace/6.7/tests/init_delete_module.h /usr/src/debug/strace/6.7/tests/xselect.c /usr/src/debug/strace/6.7/tests/sockopt-timestamp.c /usr/src/debug/strace/6.7/src/xlat/personality_types.h /usr/src/debug/strace/6.7/src/xlat/fsopen_flags.h /usr/src/debug/strace/6.7/src/xlat/v4l2_std_ids.h /usr/src/debug/strace/6.7/src/xlat/uffd_continue_mode_flags
 .h /usr/src/debug/strace/6.7/src/xlat/bpf_mode.h /usr/src/debug/strace/6.7/src/xlat/kd_key_fn_keys.h /usr/src/debug/strace/6.7/tests/open_tree.c /usr/src/debug/strace/6.7/tests/statx.c /usr/src/debug/strace/6.7/src/shutdown.c /usr/src/debug/strace/6.7/src/xlat/pr_set_vma.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/if_bonding.h /usr/src/debug/strace/6.7/tests/nlattr_tcamsg.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/seccomp.h /usr/src/debug/strace/6.7/tests/ptrace.c /usr/src/debug/strace/6.7/src/print_msgbuf.c /usr/src/debug/strace/6.7/tests/getgroups32.c /usr/src/debug/strace/6.7/src/xlat/nf_queue_msg_types.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/pkt_sched.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/btrfs_tree.h /usr/src/debug/strace/6.7/src/xlat/btrfs_logical_ino_args_flags.h /usr/src/debug/strace/6.7/tests/poke-sendfile.c /usr/src/debug/strace/6.7/src/bind.c /usr/src/debug/strace/6.7/src/seccomp_ioctl.c /usr/s
 rc/debug/strace/6.7/tests/gettid.c /usr/src/debug/strace/6.7/src/xlat/get_mempolicy_flags.h /usr/src/debug/strace/6.7/src/renameat.c /usr/src/debug/strace/6.7/src/xlat/pr_tagged_addr_mte_tcf.h /usr/src/debug/strace/6.7/src/xlat/nl_crypto_types.h /usr/src/debug/strace/6.7/tests/set_sigblock.c /usr/src/debug/strace/6.7/src/trie.c /usr/src/debug/strace/6.7/src/print_mq_attr.c /usr/src/debug/strace/6.7/src/trie.h /usr/src/debug/strace/6.7/src/xlat/fan_init_flags.h /usr/src/debug/strace/6.7/src/xlat/siginfo_codes.h /usr/src/debug/strace/6.7/tests/setpgrp-exec.c /usr/src/debug/strace/6.7/src/xlat/evdev_leds.h /usr/src/debug/strace/6.7/tests/fchmod-y--secontext.c /usr/src/debug/strace/6.7/tests/fchmodat--secontext.c /usr/src/debug/strace/6.7/tests/fchownat--secontext.c /usr/src/debug/strace/6.7/src/btrfs.c /usr/src/debug/strace/6.7/src/xlat/v4l2_control_ids.h /usr/src/debug/strace/6.7/tests/prctl-unalign.c /usr/src/debug/strace/6.7/tests/ioctl_evdev.c /usr/src/debug/strace/6.7/tests/prctl-
 pac-reset-keys.c /usr/src/debug/strace/6.7/src/xlat/ioctl_dirs.h /usr/src/debug/strace/6.7/src/xlat/adjtimex_modes.h /usr/src/debug/strace/6.7/src/xlat/v4l2_meta_fmts.h /usr/src/debug/strace/6.7/src/xlat/v4l2_input_status_flags.h /usr/src/debug/strace/6.7/src/xlat/btrfs_dev_replace_state.h /usr/src/debug/strace/6.7/tests/ioctl_sock.c /usr/src/debug/strace/6.7/src/xlat/sock_packet_options.h /usr/src/debug/strace/6.7/tests/detach-vfork.c /usr/src/debug/strace/6.7/src/xlat/tee_ioctl_optee_caps.h /usr/src/debug/strace/6.7/tests/umode_t.c /usr/src/debug/strace/6.7/tests/umount2.c /usr/src/debug/strace/6.7/src/xlat/unix_diag_show.h /usr/src/debug/strace/6.7/src/xlat/btrfs_compress_types.h /usr/src/debug/strace/6.7/tests/ioctl_termios.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/nexthop.h /usr/src/debug/strace/6.7/src/fetch_struct_stat.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/netlink_diag.h /usr/src/debug/strace/6.7/src/io_uring.c /usr/src/debug/strace/6
 .7/src/xlat/mmap_prot.h /usr/src/debug/strace/6.7/src/xlat/v4l2_memories.h /usr/src/debug/strace/6.7/tests/kernel_old_timespec.h /usr/src/debug/strace/6.7/src/fadvise.c /usr/src/debug/strace/6.7/tests/hexquote_strndup.c /usr/src/debug/strace/6.7/src/xlat/getsock_ip_options.h /usr/src/debug/strace/6.7/src/xlat/setsock_ip_options.h /usr/src/debug/strace/6.7/src/xlat/tee_ioctl_login_types.h /usr/src/debug/strace/6.7/src/xlat/smc_diag_extended_flags.h /usr/src/debug/strace/6.7/src/xlat/fdflags.h /usr/src/debug/strace/6.7/tests/ioctl_watchdog.c /usr/src/debug/strace/6.7/src/xlat/mdb_states.h /usr/src/debug/strace/6.7/src/xlat/smc_states.h /usr/src/debug/strace/6.7/src/xlat/tcp_states.h /usr/src/debug/strace/6.7/tests/fcntl-common.c /usr/src/debug/strace/6.7/src/xlat/nl_audit_types.h /usr/src/debug/strace/6.7/tests/ioctl.c /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_proto_down_reason_attrs.h /usr/src/debug/strace/6.7/tests/times-fail.c /usr/src/debug/strace/6.7/src/xlat/ptrace_setoptions
 _flags.h /usr/src/debug/strace/6.7/tests/iopl.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/ptp_clock.h /usr/src/debug/strace/6.7/src/xlat/sock_can_raw_options.h /usr/src/debug/strace/6.7/src/xlat/sock_ipv6_options.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/blktrace_api.h /usr/src/debug/strace/6.7/tests/reboot.c /usr/src/debug/strace/6.7/src/perf_ioctl.c /usr/src/debug/strace/6.7/tests/socketcall.c /usr/src/debug/strace/6.7/src/copy_file_range.c /usr/src/debug/strace/6.7/tests/ioctl_tee.c /usr/src/debug/strace/6.7/src/xlat/xattrflags.h /usr/src/debug/strace/6.7/tests/getresgid32.c /usr/src/debug/strace/6.7/tests/getresuid32.c /usr/src/debug/strace/6.7/src/xlat/clockflags.h /usr/src/debug/strace/6.7/src/xlat/epollflags.h /usr/src/debug/strace/6.7/src/xlat/mmap_flags.h /usr/src/debug/strace/6.7/src/xlat/nf_hook_msg_types.h /usr/src/debug/strace/6.7/src/xlat/swap_flags.h /usr/src/debug/strace/6.7/src/xlat/uffd_flags.h /usr/src/debug/strace/6.7/src/xlat/
 perf_hw_cache_op_id.h /usr/src/debug/strace/6.7/src/xlat/uffd_register_mode_flags.h /usr/src/debug/strace/6.7/tests/get_mempolicy.c /usr/src/debug/strace/6.7/tests/shmxt.c /usr/src/debug/strace/6.7/tests/poll.c /usr/src/debug/strace/6.7/tests/syslog.c /usr/src/debug/strace/6.7/tests/sigaction.c /usr/src/debug/strace/6.7/tests/sigreturn.c /usr/src/debug/strace/6.7/src/xlat/ioprio_class.h /usr/src/debug/strace/6.7/tests/kcmp.c /usr/src/debug/strace/6.7/tests/setresugid.c /usr/src/debug/strace/6.7/tests/ioctl_fiemap.c /usr/src/debug/strace/6.7/tests/tee.c /usr/src/debug/strace/6.7/src/xlat/inet_diag_bytecodes.h /usr/src/debug/strace/6.7/tests/ioctl_v4l2.c /usr/src/debug/strace/6.7/tests/ioctl_rtc.c /usr/src/debug/strace/6.7/tests/mq_sendrecv.c /usr/src/debug/strace/6.7/src/rtnl_tc.c /usr/src/debug/strace/6.7/tests/xetpgid.c /usr/src/debug/strace/6.7/src/v4l2.c /usr/src/debug/strace/6.7/tests/getpeername.c /usr/src/debug/strace/6.7/tests/getsockname.c /usr/src/debug/strace/6.7/tests/ino
 de_of_sockfd.c /usr/src/debug/strace/6.7/src/xlat/sigtrap_codes.h /usr/src/debug/strace/6.7/src/xlat/bpf_map_flags.h /usr/src/debug/strace/6.7/src/xlat/bpf_map_types.h /usr/src/debug/strace/6.7/src/xlat/ebpf_op_jmp.h /usr/src/debug/strace/6.7/tests/clock_adjtime64.c /usr/src/debug/strace/6.7/src/xlat/alg_sockaddr_flags.h /usr/src/debug/strace/6.7/src/xlat/xdp_sockaddr_flags.h /usr/src/debug/strace/6.7/src/seccomp.c /usr/src/debug/strace/6.7/tests/dirfd.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/gen_stats.h /usr/src/debug/strace/6.7/src/xlat/module_init_flags.h /usr/src/debug/strace/6.7/src/xlat/sg_scsi_reset.h /usr/src/debug/strace/6.7/tests/getsid.c /usr/src/debug/strace/6.7/src/xlat/addrfams.h /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_bridge_flags.h /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_bridge_modes.h /usr/src/debug/strace/6.7/tests/nlattr_inet_diag_msg.c /usr/src/debug/strace/6.7/tests/get_sigset_size.c /usr/src/debug/strace/6.7/src/xlat/bluetooth_l2_c
 id.h /usr/src/debug/strace/6.7/src/fetch_bpf_fprog.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/if_addr.h /usr/src/debug/strace/6.7/tests/netlink_unix_diag.c /usr/src/debug/strace/6.7/src/xlat/v4l2_device_capabilities_flags.h /usr/src/debug/strace/6.7/src/xlat/v4l2_streaming_capabilities.h /usr/src/debug/strace/6.7/src/xlat/sock_pnp_options.h /usr/src/debug/strace/6.7/tests/nlattr_inet_diag_req_v2.c /usr/src/debug/strace/6.7/src/xlat/keyctl_commands.h /usr/src/debug/strace/6.7/src/perf.c /usr/src/debug/strace/6.7/tests/caps.c /usr/src/debug/strace/6.7/src/xlat/audit_arch.h /usr/src/debug/strace/6.7/tests/io_uring_enter.c /usr/src/debug/strace/6.7/src/xlat/bpf_task_fd_type.h /usr/src/debug/strace/6.7/tests/sigsuspend.c /usr/src/debug/strace/6.7/src/nsfs.c /usr/src/debug/strace/6.7/src/defs.h /usr/src/debug/strace/6.7/src/xlat/sock_pppol2tp_options.h /usr/src/debug/strace/6.7/tests/scm_pidfd-success.c /usr/src/debug/strace/6.7/src/count.c /usr/src/debug/strace/6.7/src/
 mount.c /usr/src/debug/strace/6.7/src/xlat/rtnl_family.h /usr/src/debug/strace/6.7/tests/printstrn-umoven.c /usr/src/debug/strace/6.7/tests/ioctl_uffdio.c /usr/src/debug/strace/6.7/src/xlat/rtnl_ip6mra_creport_attr.h /usr/src/debug/strace/6.7/src/xlat/unshare_flags.h /usr/src/debug/strace/6.7/src/xlat/ifstats_xstats_bridge_attrs.h /usr/src/debug/strace/6.7/tests/nlattr_dcbmsg.c /usr/src/debug/strace/6.7/src/xlat/tee_ioctl_gen_caps.h /usr/src/debug/strace/6.7/src/xlat/ifstats_xstats_bridge_mcast_indices.h /usr/src/debug/strace/6.7/src/xlat/socketlayers.h /usr/src/debug/strace/6.7/tests/madvise.c /usr/src/debug/strace/6.7/src/inotify_ioctl.c /usr/src/debug/strace/6.7/src/xlat/pr_tagged_addr_enable.h /usr/src/debug/strace/6.7/tests/ifindex.c /usr/src/debug/strace/6.7/src/xlat/sigpoll_codes.h /usr/src/debug/strace/6.7/tests/oldselect-efault.c /usr/src/debug/strace/6.7/src/ipc_sem.c /usr/src/debug/strace/6.7/src/xlat/uring_register_rsrc_flags.h /usr/src/debug/strace/6.7/src/xlat/v4l2_cap
 ture_modes.h /usr/src/debug/strace/6.7/tests/sched_yield.c /usr/src/debug/strace/6.7/tests/xet_thread_area_x86.c /usr/src/debug/strace/6.7/tests/net-tpacket_req.c /usr/src/debug/strace/6.7/tests/getgid.c /usr/src/debug/strace/6.7/tests/stack-fcall-1.c /usr/src/debug/strace/6.7/tests/ioctl_inotify.c /usr/src/debug/strace/6.7/src/xlat/pr_mce_kill_policy.h /usr/src/debug/strace/6.7/tests/nsyscalls.c /usr/src/debug/strace/6.7/tests/errno2name.c /usr/src/debug/strace/6.7/tests/ioctl_kvm_run_common.c /usr/src/debug/strace/6.7/tests/semtimedop-common.c /usr/src/debug/strace/6.7/tests/ioctl_sg_io_v4.c /usr/src/debug/strace/6.7/src/netlink_packet_diag.c /usr/src/debug/strace/6.7/src/xlat/btrfs_features_compat_ro.h /usr/src/debug/strace/6.7/tests/rt_tgsigqueueinfo.c /usr/src/debug/strace/6.7/src/socketcall.c /usr/src/debug/strace/6.7/tests/mlockall.c /usr/src/debug/strace/6.7/tests/nlattr_ndmsg.c /usr/src/debug/strace/6.7/src/netlink_netlink_diag.c /usr/src/debug/strace/6.7/tests/sock_filter-
 v.c /usr/src/debug/strace/6.7/tests/memfd_create.c /usr/src/debug/strace/6.7/tests/umovestr_cached_adjacent.c /usr/src/debug/strace/6.7/src/rtnl_nh.c /usr/src/debug/strace/6.7/tests/so_linger.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/cryptouser.h /usr/src/debug/strace/6.7/tests/oldfstat.c /usr/src/debug/strace/6.7/tests/oldlstat.c /usr/src/debug/strace/6.7/tests/old_mmap.c /usr/src/debug/strace/6.7/src/xlat/uring_sqe_flags.h /usr/src/debug/strace/6.7/tests/nlattr_ifla_linkinfo.c /usr/src/debug/strace/6.7/tests/nlattr_ifla_protinfo.c /usr/src/debug/strace/6.7/tests/copy_file_range.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/if_addrlabel.h /usr/src/debug/strace/6.7/src/ubi.c /usr/src/debug/strace/6.7/src/file_handle.c /usr/src/debug/strace/6.7/tests/nlattr_smc_diag_msg.c /usr/src/debug/strace/6.7/tests/setfsgid32.c /usr/src/debug/strace/6.7/tests/ioctl_perf-success.c /usr/src/debug/strace/6.7/tests/munlockall.c /usr/src/debug/strace/6.7/tests/setfsu
 id32.c /usr/src/debug/strace/6.7/tests/setregid32.c /usr/src/debug/strace/6.7/tests/setreuid32.c /usr/src/debug/strace/6.7/tests/futex.c /usr/src/debug/strace/6.7/src/sendfile.c /usr/src/debug/strace/6.7/src/xlat/mtd_nandecc_options.h /usr/src/debug/strace/6.7/tests/set_ptracer_any.c /usr/src/debug/strace/6.7/src/xlat/netlink_flags.h /usr/src/debug/strace/6.7/src/string_to_uint.h /usr/src/debug/strace/6.7/src/xlat/netlink_types.h /usr/src/debug/strace/6.7/src/string_to_uint.c /usr/src/debug/strace/6.7/src/xlat/btrfs_tree_objectids.h /usr/src/debug/strace/6.7/tests/unshare.c /usr/src/debug/strace/6.7/src/xlat/routing_protocols.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/fiemap.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/if_xdp.h /usr/src/debug/strace/6.7/src/xlat/nf_ctnetlink_exp_msg_types.h /usr/src/debug/strace/6.7/tests/strace-p1-Y-p.c /usr/src/debug/strace/6.7/src/xlat/kd_key_dead_keys.h /usr/src/debug/strace/6.7/src/xlat/kd_key_lock_keys.h /usr/
 src/debug/strace/6.7/src/xlat/kd_key_spec_keys.h /usr/src/debug/strace/6.7/tests/getegid32.c /usr/src/debug/strace/6.7/tests/geteuid32.c /usr/src/debug/strace/6.7/src/xlat/gpio_line_flags.h /usr/src/debug/strace/6.7/tests/rt_sigsuspend.c /usr/src/debug/strace/6.7/src/xlat/perf_hw_id.h /usr/src/debug/strace/6.7/tests/nlattr_ifla.h /usr/src/debug/strace/6.7/tests/net-tpacket_stats.c /usr/src/debug/strace/6.7/tests/preadv-pwritev.c /usr/src/debug/strace/6.7/src/xlat/uring_files_update_fds.h /usr/src/debug/strace/6.7/tests/nlattr_ifaddrlblmsg.c /usr/src/debug/strace/6.7/tests/signal_receive.c /usr/src/debug/strace/6.7/src/xlat/kd_key_tables.h /usr/src/debug/strace/6.7/src/xlat/ifstats_xstats_bond_3ad_attrs.h /usr/src/debug/strace/6.7/src/xlat/nl_bridge_vlan_flags.h /usr/src/debug/strace/6.7/tests/process_vm_readv_writev.c /usr/src/debug/strace/6.7/src/xlat/sigprof_codes.h /usr/src/debug/strace/6.7/src/xlat/v4l2_framesize_types.h /usr/src/debug/strace/6.7/src/xlat/netlink_diag_attrs.h /u
 sr/src/debug/strace/6.7/tests/flock.c /usr/src/debug/strace/6.7/tests/sched_xetparam.c /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_af_spec_inet_attrs.h /usr/src/debug/strace/6.7/tests/membarrier.c /usr/src/debug/strace/6.7/src/print_syscall_number.c /usr/src/debug/strace/6.7/src/xlat/rtnl_mdba_router_pattr_attrs.h /usr/src/debug/strace/6.7/src/xlat/sock_caif_options.h /usr/src/debug/strace/6.7/tests/io_uring_setup.c /usr/src/debug/strace/6.7/tests/nlattr_tcmsg.c /usr/src/debug/strace/6.7/src/xlat/sockopt_txrehash_vals.h /usr/src/debug/strace/6.7/src/upoke.c /usr/src/debug/strace/6.7/tests/fsopen.c /usr/src/debug/strace/6.7/src/print_statfs.c /usr/src/debug/strace/6.7/tests/run_expect_termsig.c /usr/src/debug/strace/6.7/tests/sigaltstack.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/netconf.h /usr/src/debug/strace/6.7/tests/process_madvise.c /usr/src/debug/strace/6.7/src/xlat/clocknames.h /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_vf_link_states.h /usr/src/debug/str
 ace/6.7/src/reboot.c /usr/src/debug/strace/6.7/src/xlat/pr_pac_keys.h /usr/src/debug/strace/6.7/src/xlat/tls_info_configs.h /usr/src/debug/strace/6.7/tests/readahead.c /usr/src/debug/strace/6.7/tests/alarm.c /usr/src/debug/strace/6.7/src/userfaultfd.c /usr/src/debug/strace/6.7/src/fsopen.c /usr/src/debug/strace/6.7/src/xlat/uring_enter_flags.h /usr/src/debug/strace/6.7/tests/open.c /usr/src/debug/strace/6.7/src/stat64.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/tcp.h /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_vfinfo_list_attrs.h /usr/src/debug/strace/6.7/tests/xgetrlimit.c /usr/src/debug/strace/6.7/tests/rt_sigprocmask.c /usr/src/debug/strace/6.7/src/xlat/rtnl_addrlabel_attrs.h /usr/src/debug/strace/6.7/tests/getsockname--secontext.c /usr/src/debug/strace/6.7/tests/faccessat.c /usr/src/debug/strace/6.7/src/xlat/membarrier_flags.h /usr/src/debug/strace/6.7/tests/symlinkat.c /usr/src/debug/strace/6.7/src/sync_file_range.c /usr/src/debug/strace/6.7/src/xlat/v4l2_tune
 r_capabilities.h /usr/src/debug/strace/6.7/src/mpers_type.h /usr/src/debug/strace/6.7/tests/landlock_add_rule.c /usr/src/debug/strace/6.7/tests/netlink_netlink_diag.c /usr/src/debug/strace/6.7/src/xlat/nbd_ioctl_flags.h /usr/src/debug/strace/6.7/tests/clone3.c /usr/src/debug/strace/6.7/src/xlat/sigaltstack_flags.h /usr/src/debug/strace/6.7/src/kernel_dirent.h /usr/src/debug/strace/6.7/src/macros.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/dm-ioctl.h /usr/src/debug/strace/6.7/tests/accept.c /usr/src/debug/strace/6.7/src/xlat/nf_acct_msg_types.h /usr/src/debug/strace/6.7/tests/chdir.c /usr/src/debug/strace/6.7/src/msghdr.h /usr/src/debug/strace/6.7/tests/ioctl_lirc.c /usr/src/debug/strace/6.7/tests/segv_accerr.c /usr/src/debug/strace/6.7/tests/segv_pkuerr.c /usr/src/debug/strace/6.7/tests/nlattr_ifla_xdp.c /usr/src/debug/strace/6.7/src/msghdr.c /usr/src/debug/strace/6.7/src/xlat/seccomp_filter_flags.h /usr/src/debug/strace/6.7/tests/getdents.c /usr/src/debug/strace/6.
 7/tests/getgid32.c /usr/src/debug/strace/6.7/tests/getuid32.c /usr/src/debug/strace/6.7/tests/ioctl_fs_f.c /usr/src/debug/strace/6.7/tests/ftruncate.c /usr/src/debug/strace/6.7/src/xlat/resource_flags.h /usr/src/debug/strace/6.7/tests/readv.c /usr/src/debug/strace/6.7/src/xlat/rtc_features.h /usr/src/debug/strace/6.7/tests/xet_robust_list.c /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_br_mcast_querier_attrs.h /usr/src/debug/strace/6.7/tests/lchown32.c /usr/src/debug/strace/6.7/src/xlat/mtd_mode_options.h /usr/src/debug/strace/6.7/tests/pidfd_getfd.c /usr/src/debug/strace/6.7/tests/pidns.h /usr/src/debug/strace/6.7/src/xlat/uffd_register_ioctl_flags.h /usr/src/debug/strace/6.7/tests/pidns.c /usr/src/debug/strace/6.7/tests/ioctl_gpio.c /usr/src/debug/strace/6.7/tests/dup.c /usr/src/debug/strace/6.7/tests/ioctl_hdio.c /usr/src/debug/strace/6.7/src/hdio.c /usr/src/debug/strace/6.7/src/xlat/gpio_event_flags.h /usr/src/debug/strace/6.7/src/keyctl_kdf_params.h /usr/src/debug/strace/6.7/src
 /xlat/v4l2_buf_flags_ts_src.h /usr/src/debug/strace/6.7/src/ptrace_syscall_info.c /usr/src/debug/strace/6.7/src/ptrace_syscall_info.h /usr/src/debug/strace/6.7/tests/prctl-no-args.c /usr/src/debug/strace/6.7/tests/setdomainname.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/in6.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/counter.h /usr/src/debug/strace/6.7/src/kernel_types.h /usr/src/debug/strace/6.7/src/stage_output.c /usr/src/debug/strace/6.7/src/xlat/netlink_ack_flags.h /usr/src/debug/strace/6.7/src/xlat/netlink_get_flags.h /usr/src/debug/strace/6.7/src/xlat/netlink_new_flags.h /usr/src/debug/strace/6.7/tests/seccomp-strict.c /usr/src/debug/strace/6.7/src/list.h /usr/src/debug/strace/6.7/src/xlat/uring_restriction_opcodes.h /usr/src/debug/strace/6.7/src/xlat/seccomp_mode.h /usr/src/debug/strace/6.7/tests/ksysent.c /usr/src/debug/strace/6.7/src/xlat/sock_vsock_options.h /usr/src/debug/strace/6.7/src/ustat.c /usr/src/debug/strace/6.7/tests/nlattr_rtge
 nmsg.c /usr/src/debug/strace/6.7/src/xlat/nf_osf_msg_types.h /usr/src/debug/strace/6.7/tests/subdir.c /usr/src/debug/strace/6.7/tests/pc.c /usr/src/debug/strace/6.7/tests/ipc.c /usr/src/debug/strace/6.7/src/pidns.c /usr/src/debug/strace/6.7/src/xlat/key_reqkeys.h /usr/src/debug/strace/6.7/src/xlat/nl_netfilter_subsys_ids.h /usr/src/debug/strace/6.7/tests/umovestr3.c /usr/src/debug/strace/6.7/src/xlat/getrandom_flags.h /usr/src/debug/strace/6.7/src/xlat/inet_diag_req_attrs.h /usr/src/debug/strace/6.7/tests/sched_get_priority_mxx.c /usr/src/debug/strace/6.7/src/printrusage.c /usr/src/debug/strace/6.7/src/kd_ioctl.c /usr/src/debug/strace/6.7/src/xlat/if_dqinfo_flags.h /usr/src/debug/strace/6.7/src/gpio_ioctl.c /usr/src/debug/strace/6.7/tests/ioctl_dm.c /usr/src/debug/strace/6.7/tests/ioctl_kd.c /usr/src/debug/strace/6.7/tests/fsync.c /usr/src/debug/strace/6.7/src/xlat/ptrace_syscall_info_op.h /usr/src/debug/strace/6.7/src/xlat/xfs_dqblk_flags.h /usr/src/debug/strace/6.7/src/xlat/term_o
 flags_ffdly.h /usr/src/debug/strace/6.7/src/xlat/lwtunnel_encap_types.h /usr/src/debug/strace/6.7/src/pkeys.c /usr/src/debug/strace/6.7/src/xlat/pr_mce_kill.h /usr/src/debug/strace/6.7/src/xlat/smc_diag_attrs.h /usr/src/debug/strace/6.7/tests/getuid.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/packet_diag.h /usr/src/debug/strace/6.7/src/xlat/evdev_abs.h /usr/src/debug/strace/6.7/src/xlat/btrfs_scrub_flags.h /usr/src/debug/strace/6.7/src/xlat/kvm_cap.h /usr/src/debug/strace/6.7/src/xlat/uring_setup_flags.h /usr/src/debug/strace/6.7/src/xlat/cap_version.h /usr/src/debug/strace/6.7/tests/unix-pair-sendto-recvfrom.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/io_uring.h /usr/src/debug/strace/6.7/tests/move_pages.c /usr/src/debug/strace/6.7/tests/so_error.c /usr/src/debug/strace/6.7/tests/sockname.c /usr/src/debug/strace/6.7/tests/epoll_create.c /usr/src/debug/strace/6.7/src/xlat/modetypes.h /usr/src/debug/strace/6.7/tests/fchown32.c /usr/src/debug/strace/6
 .7/tests/fchownat.c /usr/src/debug/strace/6.7/src/xlat/socktypes.h /usr/src/debug/strace/6.7/src/xlat/at_statx_sync_types.h /usr/src/debug/strace/6.7/tests/fchmodat.c /usr/src/debug/strace/6.7/tests/read-write.c /usr/src/debug/strace/6.7/tests/file_handle--secontext.c /usr/src/debug/strace/6.7/tests/xattr-strings.c /usr/src/debug/strace/6.7/tests/cachestat.c /usr/src/debug/strace/6.7/tests/acct.c /usr/src/debug/strace/6.7/tests/nlattr_ifla_af_inet6.h /usr/src/debug/strace/6.7/tests/prctl-set_vma.c /usr/src/debug/strace/6.7/src/xlat/rtnl_addr_attrs.h /usr/src/debug/strace/6.7/src/xlat/v4l2_frameinterval_types.h /usr/src/debug/strace/6.7/src/printsiginfo.c /usr/src/debug/strace/6.7/src/tee.c /usr/src/debug/strace/6.7/src/printsiginfo.h /usr/src/debug/strace/6.7/src/xlat/kexec_load_flags.h /usr/src/debug/strace/6.7/src/xlat/btrfs_cont_reading_from_srcdev_mode.h /usr/src/debug/strace/6.7/tests/prctl-spec-inject.c /usr/src/debug/strace/6.7/src/xlat/btrfs_key_types.h /usr/src/debug/strace
 /6.7/tests/osf_utimes.c /usr/src/debug/strace/6.7/tests/nfnetlink_nftables.c /usr/src/debug/strace/6.7/tests/xattr.c /usr/src/debug/strace/6.7/src/block.c /usr/src/debug/strace/6.7/src/flock.c /usr/src/debug/strace/6.7/tests/access.c /usr/src/debug/strace/6.7/tests/chmod.c /usr/src/debug/strace/6.7/src/print_kernel_sigset.c /usr/src/debug/strace/6.7/src/xlat/uffd_copy_flags.h /usr/src/debug/strace/6.7/src/xlat/tee_ioctl_origins.h /usr/src/debug/strace/6.7/src/ldt.c /usr/src/debug/strace/6.7/src/net.c /usr/src/debug/strace/6.7/src/xlat/key_spec.h /usr/src/debug/strace/6.7/src/xlat/v4l2_colorspaces.h /usr/src/debug/strace/6.7/src/kill_save_errno.h /usr/src/debug/strace/6.7/src/xlat/pr_spec_cmds.h /usr/src/debug/strace/6.7/src/xlat/evdev_keycode.h /usr/src/debug/strace/6.7/src/numa.c /usr/src/debug/strace/6.7/tests/recvfrom-MSG_TRUNC.c /usr/src/debug/strace/6.7/src/pathtrace.c /usr/src/debug/strace/6.7/src/xlat/kd_meta_vals.h /usr/src/debug/strace/6.7/src/xlat/bpf_commands.h /usr/src/d
 ebug/strace/6.7/src/xlat/dcb_commands.h /usr/src/debug/strace/6.7/src/xlat/pr_sud_cmds.h /usr/src/debug/strace/6.7/src/xlat/smc_link_group_roles.h /usr/src/debug/strace/6.7/src/xlat/term_iflags.h /usr/src/debug/strace/6.7/src/xlat/rtnl_nsid_attrs.h /usr/src/debug/strace/6.7/tests/time.c /usr/src/debug/strace/6.7/src/xlat/neighbor_cache_entry_ext_flags.h /usr/src/debug/strace/6.7/tests/nlattr_crypto_user_alg.c /usr/src/debug/strace/6.7/src/print_kernel_version.c /usr/src/debug/strace/6.7/tests/prctl-mdwe.c /usr/src/debug/strace/6.7/tests/mmsg-silent.c /usr/src/debug/strace/6.7/src/nlattr.h /usr/src/debug/strace/6.7/src/xlat/kd_key_ascii_keys.h /usr/src/debug/strace/6.7/src/xlat/kd_key_shift_keys.h /usr/src/debug/strace/6.7/src/xlat/kd_key_slock_keys.h /usr/src/debug/strace/6.7/tests/restart_syscall.c /usr/src/debug/strace/6.7/src/nlattr.c /usr/src/debug/strace/6.7/src/umask.c /usr/src/debug/strace/6.7/src/xlat/nf_cttimeout_msg_types.h /usr/src/debug/strace/6.7/src/time.c /usr/src/deb
 ug/strace/6.7/src/bpf.c /usr/src/debug/strace/6.7/tests/perf_event_open.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/if_alg.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/inet_diag.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/sock_diag.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/unix_diag.h /usr/src/debug/strace/6.7/src/xlat/term_lflags.h /usr/src/debug/strace/6.7/src/xlat/sock_tcp_options.h /usr/src/debug/strace/6.7/tests/qual_inject-retval.c /usr/src/debug/strace/6.7/tests/qual_inject-signal.c /usr/src/debug/strace/6.7/tests/net-packet_mreq.c /usr/src/debug/strace/6.7/tests/prctl-tsc.c /usr/src/debug/strace/6.7/src/print_timeval.c /usr/src/debug/strace/6.7/tests/nlattr_ifla_port.c /usr/src/debug/strace/6.7/src/xlat/sock_iucv_options.h /usr/src/debug/strace/6.7/src/xlat/hci_channels.h /usr/src/debug/strace/6.7/tests/ioctl_block.c /usr/src/debug/strace/6.7/src/xlat/rtnl_ipmra_msg_types.h /usr/src/debug/strace/6.7/src/xla
 t/can_protocols.h /usr/src/debug/strace/6.7/src/xlat/kcm_protocols.h /usr/src/debug/strace/6.7/src/xlat/nfc_protocols.h /usr/src/debug/strace/6.7/src/xlat/smc_protocols.h /usr/src/debug/strace/6.7/src/sigreturn.c /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_br_boolopts.h /usr/src/debug/strace/6.7/src/xlat/v4l2_control_types.h /usr/src/debug/strace/6.7/tests/delete_module.c /usr/src/debug/strace/6.7/tests/xettimeofday.c /usr/src/debug/strace/6.7/src/xlat/sock_tipc_options.h /usr/src/debug/strace/6.7/src/xlat/bluetooth_l2_psm.h /usr/src/debug/strace/6.7/tests/group_req.c /usr/src/debug/strace/6.7/src/xlat/fiemap_flags.h /usr/src/debug/strace/6.7/src/xlat/mremap_flags.h /usr/src/debug/strace/6.7/tests/ioctl_tiocm.c /usr/src/debug/strace/6.7/tests/mount_setattr.c /usr/src/debug/strace/6.7/tests/rename.c /usr/src/debug/strace/6.7/tests/ioctl_seccomp.c /usr/src/debug/strace/6.7/tests/preadv.c /usr/src/debug/strace/6.7/src/xlat/fsmount_attr_flags.h /usr/src/debug/strace/6.7/tests/nlattr_if
 la_af_spec.c /usr/src/debug/strace/6.7/src/xlat/nf_ipset_msg_types.h /usr/src/debug/strace/6.7/src/xlat/f_owner_types.h /usr/src/debug/strace/6.7/src/xlat/pr_set_mm.h /usr/src/debug/strace/6.7/tests/fcntl.c /usr/src/debug/strace/6.7/src/negated_errno.h /usr/src/debug/strace/6.7/tests/test_ucopy.c /usr/src/debug/strace/6.7/tests/sendfile.c /usr/src/debug/strace/6.7/tests/setgid32.c /usr/src/debug/strace/6.7/tests/setuid32.c /usr/src/debug/strace/6.7/tests/test_ucopy.h /usr/src/debug/strace/6.7/tests/umovestr.c /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_port_attrs.h /usr/src/debug/strace/6.7/tests/attach-f-p.c /usr/src/debug/strace/6.7/tests/create_tmpfile.c /usr/src/debug/strace/6.7/src/bpf_sock_filter.c /usr/src/debug/strace/6.7/tests/futimesat.c /usr/src/debug/strace/6.7/src/xlat/term_cmds_overlapping.h /usr/src/debug/strace/6.7/src/xlat/sock_tls_options.h /usr/src/debug/strace/6.7/tests/printpath-umovestr-undumpable.c /usr/src/debug/strace/6.7/src/xlat/memfd_secret_flags.h /usr/
 src/debug/strace/6.7/src/poke.c /usr/src/debug/strace/6.7/src/poke.h /usr/src/debug/strace/6.7/tests/fsync-y.c /usr/src/debug/strace/6.7/tests/fsmount.c /usr/src/debug/strace/6.7/tests/fstat64.c /usr/src/debug/strace/6.7/tests/init_module.c /usr/src/debug/strace/6.7/tests/fdatasync.c /usr/src/debug/strace/6.7/src/fs_0x94_ioctl.c /usr/src/debug/strace/6.7/tests/attach-f-p-cmd.c /usr/src/debug/strace/6.7/src/xlat/btrfs_dev_stats_flags.h /usr/src/debug/strace/6.7/tests/block_reset_run.c /usr/src/debug/strace/6.7/tests/mbind.c /usr/src/debug/strace/6.7/src/fallocate.c /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_xdp_attached_mode.h /usr/src/debug/strace/6.7/src/xlat/term_oflags_tabdly.h /usr/src/debug/strace/6.7/src/xlat/v4l2_buf_flags_ts_type.h /usr/src/debug/strace/6.7/src/xlat/perf_hw_cache_op_result_id.h /usr/src/debug/strace/6.7/tests/clone_parent.c /usr/src/debug/strace/6.7/tests/nlattr.c /usr/src/debug/strace/6.7/tests/linkat--secontext.c /usr/src/debug/strace/6.7/src/kd_mpers_io
 ctl.c /usr/src/debug/strace/6.7/src/xlat/qipcrtr_nodes.h /usr/src/debug/strace/6.7/src/xlat/qipcrtr_ports.h /usr/src/debug/strace/6.7/src/xlat/mq_attr_flags.h /usr/src/debug/strace/6.7/src/statfs64.c /usr/src/debug/strace/6.7/src/getrandom.c /usr/src/debug/strace/6.7/src/xlat/futexwakecmps.h /usr/src/debug/strace/6.7/tests/signal.c /usr/src/debug/strace/6.7/src/xlat/ebpf_size.h /usr/src/debug/strace/6.7/src/xlat/move_pages_flags.h /usr/src/debug/strace/6.7/src/xlat/neighbor_cache_entry_flags.h /usr/src/debug/strace/6.7/src/xlat/route_nexthop_flags.h /usr/src/debug/strace/6.7/tests/pwritev.c /usr/src/debug/strace/6.7/tests/xgetdents.c /usr/src/debug/strace/6.7/src/xlat/adjtimex_status.h /usr/src/debug/strace/6.7/tests/futex_waitv.c /usr/src/debug/strace/6.7/src/evdev_mpers.c /usr/src/debug/strace/6.7/src/xlat/evdev_switch.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/qrtr.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/stat.h /usr/src/debug/strace/6.7/src/
 fanotify.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/gpio.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/kcmp.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/loop.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/mctp.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/mpls.h /usr/src/debug/strace/6.7/tests/xstatx.c /usr/src/debug/strace/6.7/src/inotify.c /usr/src/debug/strace/6.7/src/xlat/fan_mark_flags.h /usr/src/debug/strace/6.7/tests/fork--pidns-translation.c /usr/src/debug/strace/6.7/tests/unblock_reset_raise.c /usr/src/debug/strace/6.7/tests/memfd_secret.c /usr/src/debug/strace/6.7/src/xlat/vsock_ports.h /usr/src/debug/strace/6.7/tests/ppoll.c /usr/src/debug/strace/6.7/tests/kern_features.c /usr/src/debug/strace/6.7/tests/umask.c /usr/src/debug/strace/6.7/src/xlat/bpf_miscop.h /usr/src/debug/strace/6.7/src/dyxlat.c /usr/src/debug/strace/6.7/tests/msg_name.c /usr/src/debug/strace/6.7/src/xlat/ubi_volume_flags.h /us
 r/src/debug/strace/6.7/src/perf_event_struct.h /usr/src/debug/strace/6.7/tests/kill.c /usr/src/debug/strace/6.7/src/xlat/rtnl_rule_attrs.h /usr/src/debug/strace/6.7/src/open.c /usr/src/debug/strace/6.7/tests/renameat2.c /usr/src/debug/strace/6.7/tests/set_sigign.c /usr/src/debug/strace/6.7/src/xlat/epollctls.h /usr/src/debug/strace/6.7/tests/is_linux_mips_n64.c /usr/src/debug/strace/6.7/tests/fanotify_init.c /usr/src/debug/strace/6.7/src/xlat/ieee802154_pan_ids.h /usr/src/debug/strace/6.7/src/quota.c /usr/src/debug/strace/6.7/src/xlat/nf_nftables_msg_types.h /usr/src/debug/strace/6.7/tests/prctl-seccomp-strict.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/v4l2-controls.h /usr/src/debug/strace/6.7/src/xlat/baud_options.h /usr/src/debug/strace/6.7/src/xlat/sock_options.h /usr/src/debug/strace/6.7/tests/readlinkat.c /usr/src/debug/strace/6.7/src/xlat/sigchld_codes.h /usr/src/debug/strace/6.7/src/rtnl_addrlabel.c /usr/src/debug/strace/6.7/tests/fflush.c /usr/src/debug/str
 ace/6.7/bundled/linux/include/uapi/linux/fs.h /usr/src/debug/strace/6.7/src/random_ioctl.c /usr/src/debug/strace/6.7/src/sen.h /usr/src/debug/strace/6.7/tests/printpath-umovestr-peekdata.c /usr/src/debug/strace/6.7/src/xlat/notifyflags.h /usr/src/debug/strace/6.7/src/xlat/advise.h /usr/src/debug/strace/6.7/tests/userfaultfd.c /usr/src/debug/strace/6.7/tests/poke.c /usr/src/debug/strace/6.7/src/getpid.c /usr/src/debug/strace/6.7/src/xlat/falloc_flags.h /usr/src/debug/strace/6.7/src/xlat/fs_ioc_flags.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/in.h /usr/src/debug/strace/6.7/tests/s390_pci_mmio_read_write.c /usr/src/debug/strace/6.7/src/xlat/loop_crypt_type_options.h /usr/src/debug/strace/6.7/tests/timer_create.c /usr/src/debug/strace/6.7/tests/stack-fcall-3.c /usr/src/debug/strace/6.7/tests/sethostname.c /usr/src/debug/strace/6.7/src/xlat/nfc_saps.h /usr/src/debug/strace/6.7/tests/status-unfinished.c /usr/src/debug/strace/6.7/src/xlat/nt_descriptor_types.h /usr/src/de
 bug/strace/6.7/src/xlat/pr_tsc.h /usr/src/debug/strace/6.7/tests/net-y-unix.c /usr/src/debug/strace/6.7/tests/umovestr-illptr.c /usr/src/debug/strace/6.7/src/listen.c /usr/src/debug/strace/6.7/tests/fadvise64.c /usr/src/debug/strace/6.7/src/xlat/pr_pac_enabled_keys.h /usr/src/debug/strace/6.7/src/xlat/pr_sched_core_pidtypes.h /usr/src/debug/strace/6.7/tests/utime.c /usr/src/debug/strace/6.7/tests/print_user_desc.c /usr/src/debug/strace/6.7/src/kernel_v4l2_types.h /usr/src/debug/strace/6.7/src/xlat/cap_mask0.h /usr/src/debug/strace/6.7/tests/status-detached-threads.c /usr/src/debug/strace/6.7/tests/overflowuid.c /usr/src/debug/strace/6.7/tests/nfnetlink_acct.c /usr/src/debug/strace/6.7/tests/tgkill.c /usr/src/debug/strace/6.7/tests/brk.c /usr/src/debug/strace/6.7/src/xlat/name_to_handle_at_flags.h /usr/src/debug/strace/6.7/src/xlat/bootflags3.h /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_vf_vlan_list_attrs.h /usr/src/debug/strace/6.7/src/xlat/evdev_prop.h /usr/src/debug/strace/6.7/s
 rc/xlat/rename_flags.h /usr/src/debug/strace/6.7/src/xlat/sigfpe_codes.h /usr/src/debug/strace/6.7/src/xlat/splice_flags.h /usr/src/debug/strace/6.7/src/xlat/whence_codes.h /usr/src/debug/strace/6.7/src/xlat/prctl_options.h /usr/src/debug/strace/6.7/src/xlat/wait4_options.h /usr/src/debug/strace/6.7/src/resource.c /usr/src/debug/strace/6.7/src/print_instruction_pointer.c /usr/src/debug/strace/6.7/src/xlat/smc_decl_codes.h /usr/src/debug/strace/6.7/src/xlat/rtnl_mdba_mdb_attrs.h /usr/src/debug/strace/6.7/src/sched_attr.h /usr/src/debug/strace/6.7/src/xlat/term_cflags_csize.h /usr/src/debug/strace/6.7/src/mount_setattr.c /usr/src/debug/strace/6.7/src/xlat/tls_info_versions.h /usr/src/debug/strace/6.7/src/xlat/bpf_class.h /usr/src/debug/strace/6.7/src/xlat/btrfs_qgroup_limit_flags.h /usr/src/debug/strace/6.7/src/xlat/ip_type_of_services.h /usr/src/debug/strace/6.7/tests/kexec_load.c /usr/src/debug/strace/6.7/src/xlat/kd_modes.h /usr/src/debug/strace/6.7/src/times.c /usr/src/debug/strac
 e/6.7/src/xlat/inet_devconf_indices.h /usr/src/debug/strace/6.7/src/evdev.c /usr/src/debug/strace/6.7/tests/shutdown.c /usr/src/debug/strace/6.7/tests/close_range.c /usr/src/debug/strace/6.7/src/xlat/rtnl_nha_res_group_attrs.h /usr/src/debug/strace/6.7/src/xlat/snmp_icmp6_stats.h /usr/src/debug/strace/6.7/tests/net-yy-unix.c /usr/src/debug/strace/6.7/tests/oldstat.c /usr/src/debug/strace/6.7/tests/pselect6_time64.c /usr/src/debug/strace/6.7/src/mmap_cache.h /usr/src/debug/strace/6.7/src/error_prints.c /usr/src/debug/strace/6.7/src/xlat/bpf_rval.h /usr/src/debug/strace/6.7/src/xlat/sock_udp_options.h /usr/src/debug/strace/6.7/tests/umount.c /usr/src/debug/strace/6.7/src/error_prints.h /usr/src/debug/strace/6.7/src/mmap_cache.c /usr/src/debug/strace/6.7/src/xlat/rtnl_tca_root_flags.h /usr/src/debug/strace/6.7/tests/vhangup.c /usr/src/debug/strace/6.7/src/xlat/rtnl_tca_act_flags.h /usr/src/debug/strace/6.7/src/xlat/seccomp_ioctl_resp_flags.h /usr/src/debug/strace/6.7/tests/clock_xettim
 e-common.c /usr/src/debug/strace/6.7/tests/fanotify_mark.c /usr/src/debug/strace/6.7/src/xlat/hw_breakpoint_len.h /usr/src/debug/strace/6.7/tests/printstrn-umoven-undumpable.c /usr/src/debug/strace/6.7/src/xlat/term_oflags_crdly.h /usr/src/debug/strace/6.7/tests/zeroargc.c /usr/src/debug/strace/6.7/src/xlat/packet_diag_attrs.h /usr/src/debug/strace/6.7/src/futex2.c /usr/src/debug/strace/6.7/src/ioperm.c /usr/src/debug/strace/6.7/tests/access--secontext.c /usr/src/debug/strace/6.7/tests/futex2_flags.h /usr/src/debug/strace/6.7/src/xlat/neighbor_cache_entry_states.h /usr/src/debug/strace/6.7/src/xlat/gpio_v2_line_flags.h /usr/src/debug/strace/6.7/src/xlat/rtnl_link_attrs.h /usr/src/debug/strace/6.7/src/xlat/rtnl_tc_attrs.h /usr/src/debug/strace/6.7/src/xlat/term_oflags_nldly.h /usr/src/debug/strace/6.7/tests/status-unfinished-threads.c /usr/src/debug/strace/6.7/tests/btrfs.c /usr/src/debug/strace/6.7/src/xlat/seccomp_ioctl_addfd_flags.h /usr/src/debug/strace/6.7/src/xlat/seccomp_ops.h
  /usr/src/debug/strace/6.7/src/xlat/rtnl_ipmra_creport_attr.h /usr/src/debug/strace/6.7/tests/prctl-dumpable.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/tls.h /usr/src/debug/strace/6.7/src/xlat/inet_diag_ulp_info_attrs.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/neighbour.h /usr/src/debug/strace/6.7/tests/netlink_netfilter.c /usr/src/debug/strace/6.7/src/xlat/ax25_protocols.h /usr/src/debug/strace/6.7/src/xlat/caif_protocols.h /usr/src/debug/strace/6.7/src/xlat/inet_protocols.h /usr/src/debug/strace/6.7/src/xlat/irda_protocols.h /usr/src/debug/strace/6.7/src/xlat/isdn_protocols.h /usr/src/debug/strace/6.7/tests/nlattr_fib_rule_hdr.c /usr/src/debug/strace/6.7/src/xlat/nfc_sockaddr_protocols.h /usr/src/debug/strace/6.7/tests/attach-p-cmd-cmd.c /usr/src/debug/strace/6.7/tests/futex_wake.c /usr/src/debug/strace/6.7/src/xlat/packet_mreq_type.h /usr/src/debug/strace/6.7/src/xlat/hdio_busstates.h /usr/src/debug/strace/6.7/src/xlat/v4l2_buf_flags.h /usr/src
 /debug/strace/6.7/src/memfd_secret.c /usr/src/debug/strace/6.7/src/xlat/v4l2_buf_types.h /usr/src/debug/strace/6.7/src/xlat/madvise_cmds.h /usr/src/debug/strace/6.7/src/xlat/priorities.h /usr/src/debug/strace/6.7/tests/status-none.c /usr/src/debug/strace/6.7/src/xlat/sigsegv_codes.h /usr/src/debug/strace/6.7/src/xlat/sock_xdp_options.h /usr/src/debug/strace/6.7/tests/mlock2.c /usr/src/debug/strace/6.7/src/xlat/v4l2_vbi_flags.h /usr/src/debug/strace/6.7/tests/unix-pair-send-recv.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/nfc.h /usr/src/debug/strace/6.7/tests/nlattr_ifstats.c /usr/src/debug/strace/6.7/tests/sched_rr_get_interval.c /usr/src/debug/strace/6.7/src/xlat/ptp_extts_flags.h /usr/src/debug/strace/6.7/src/pidfd_getfd.c /usr/src/debug/strace/6.7/src/number_set.h /usr/src/debug/strace/6.7/tests/nfnetlink_ctnetlink.c /usr/src/debug/strace/6.7/src/membarrier.c /usr/src/debug/strace/6.7/src/number_set.c /usr/src/debug/strace/6.7/src/sg_io_v3.c /usr/src/debug/strace
 /6.7/src/xlat/bdaddr_types.h /usr/src/debug/strace/6.7/src/xlat/itimer_which.h /usr/src/debug/strace/6.7/src/xlat/perf_branch_sample_type.h /usr/src/debug/strace/6.7/tests/migrate_pages.c /usr/src/debug/strace/6.7/src/xlat/rtnl_tca_act_hw_stats.h /usr/src/debug/strace/6.7/src/xlat/faccessat_flags.h /usr/src/debug/strace/6.7/tests/netlink_crypto.c /usr/src/debug/strace/6.7/tests/nlattr_ifinfomsg.c /usr/src/debug/strace/6.7/src/execve.c /usr/src/debug/strace/6.7/tests/fstatat64.c /usr/src/debug/strace/6.7/tests/fstatfs64.c /usr/src/debug/strace/6.7/tests/getrandom.c /usr/src/debug/strace/6.7/src/rt_sigreturn.c /usr/src/debug/strace/6.7/tests/_newselect.c /usr/src/debug/strace/6.7/src/xlat/nf_ulog_msg_types.h /usr/src/debug/strace/6.7/tests/truncate.c /usr/src/debug/strace/6.7/src/xlat/mctp_nets.h /usr/src/debug/strace/6.7/tests/getegid.c /usr/src/debug/strace/6.7/tests/geteuid.c /usr/src/debug/strace/6.7/tests/getpgrp.c /usr/src/debug/strace/6.7/tests/getppid.c /usr/src/debug/strace/6
 .7/tests/getxgid.c /usr/src/debug/strace/6.7/tests/getxpid.c /usr/src/debug/strace/6.7/tests/getxuid.c /usr/src/debug/strace/6.7/tests/aio.c /usr/src/debug/strace/6.7/tests/ioctl_fs_x.c /usr/src/debug/strace/6.7/tests/kernel_old_timex.h /usr/src/debug/strace/6.7/src/xlat/pr_mdwe_flags.h /usr/src/debug/strace/6.7/tests/nlattr_ifla_proto_down_reason.c /usr/src/debug/strace/6.7/tests/ptrace_syscall_info.c /usr/src/debug/strace/6.7/tests/prctl-cap-ambient.c /usr/src/debug/strace/6.7/tests/nlattr_tca_stab.c /usr/src/debug/strace/6.7/src/xlat/btrfs_balance_flags.h /usr/src/debug/strace/6.7/src/xlat/evdev_autorepeat.h /usr/src/debug/strace/6.7/src/xlat/uffd_zeropage_flags.h /usr/src/debug/strace/6.7/src/xlat/rtnl_neigh_fdb_ext_attrs.h /usr/src/debug/strace/6.7/tests/sigpending.c /usr/src/debug/strace/6.7/tests/nlattr_ifla_vfinfo.c /usr/src/debug/strace/6.7/src/xlat/futexwakeops.h /usr/src/debug/strace/6.7/src/xlat/routing_table_ids.h /usr/src/debug/strace/6.7/src/rtnl_addr.c /usr/src/debug
 /strace/6.7/src/rtnl_link.c /usr/src/debug/strace/6.7/src/rtnl_nsid.c /usr/src/debug/strace/6.7/src/rtnl_rule.c /usr/src/debug/strace/6.7/src/xlat/loop_flags_options.h /usr/src/debug/strace/6.7/tests/wait4.c /usr/src/debug/strace/6.7/tests/link.c /usr/src/debug/strace/6.7/src/xlat/hdio_ide_nice.h /usr/src/debug/strace/6.7/tests/seccomp_get_action_avail.c /usr/src/debug/strace/6.7/src/xlat/nl_selinux_types.h /usr/src/debug/strace/6.7/src/xlat/packet_diag_show.h /usr/src/debug/strace/6.7/src/xlat/landlock_ruleset_access_fs.h /usr/src/debug/strace/6.7/src/print_sigevent.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/tee.h /usr/src/debug/strace/6.7/tests/timer_xettime.c /usr/src/debug/strace/6.7/tests/ipc_msgbuf.c /usr/src/debug/strace/6.7/tests/strace--syscall-limit.c /usr/src/debug/strace/6.7/tests/splice.c /usr/src/debug/strace/6.7/tests/umoven-illptr.c /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_br_boolopt_flags.h /usr/src/debug/strace/6.7/tests/arch_prctl.c /usr/src/
 debug/strace/6.7/tests/scm_credentials.c /usr/src/debug/strace/6.7/tests/libsocketcall.c /usr/src/debug/strace/6.7/src/xlat/mctl_sync.h /usr/src/debug/strace/6.7/src/xlat/v4l2_pix_fmts.h /usr/src/debug/strace/6.7/tests/sched_xetattr.c /usr/src/debug/strace/6.7/tests/scm_rights.c /usr/src/debug/strace/6.7/tests/maybe_switch_current_tcp.c /usr/src/debug/strace/6.7/tests/symlink.c /usr/src/debug/strace/6.7/tests/sysinfo.c /usr/src/debug/strace/6.7/src/lirc_ioctl.c /usr/src/debug/strace/6.7/src/xlat/fsconfig_cmds.h /usr/src/debug/strace/6.7/tests/ioctl_sg_io_v3.c /usr/src/debug/strace/6.7/src/xlat/ipc_private.h /usr/src/debug/strace/6.7/src/sock.c /usr/src/debug/strace/6.7/tests/pselect6-common.c /usr/src/debug/strace/6.7/src/xlat/hdio_drive_cmds.h /usr/src/debug/strace/6.7/src/xlat/rtnl_mdba_router_attrs.h /usr/src/debug/strace/6.7/src/printers.h /usr/src/debug/strace/6.7/tests/ioctl_ptp.c /usr/src/debug/strace/6.7/src/xlat/bpf_op_jmp.h /usr/src/debug/strace/6.7/tests/ftruncate64.c /us
 r/src/debug/strace/6.7/src/eventfd.c /usr/src/debug/strace/6.7/tests/skip_unavailable.c /usr/src/debug/strace/6.7/tests/trie_test.c /usr/src/debug/strace/6.7/src/rtnl_neigh.c /usr/src/debug/strace/6.7/src/rtnl_route.c /usr/src/debug/strace/6.7/src/rtnl_stats.c /usr/src/debug/strace/6.7/tests/prctl-seccomp-filter-v.c /usr/src/debug/strace/6.7/src/fcntl.c /usr/src/debug/strace/6.7/src/sysctl.c /usr/src/debug/strace/6.7/src/xlat/statfs_flags.h /usr/src/debug/strace/6.7/src/xlat/access_modes.h /usr/src/debug/strace/6.7/src/xlat/sigbus_codes.h /usr/src/debug/strace/6.7/src/xlat/sigsys_codes.h /usr/src/debug/strace/6.7/tests/fchmod--secontext.c /usr/src/debug/strace/6.7/tests/stack-fcall.c /usr/src/debug/strace/6.7/src/xlat/f_seals.h /usr/src/debug/strace/6.7/src/xlat/scmvals.h /usr/src/debug/strace/6.7/tests/stack-fcall.h /usr/src/debug/strace/6.7/src/netlink_sock_diag.h /usr/src/debug/strace/6.7/src/readahead.c /usr/src/debug/strace/6.7/tests/add_key.c /usr/src/debug/strace/6.7/src/xlat
 /evdev_snd.h /usr/src/debug/strace/6.7/src/netlink_sock_diag.c /usr/src/debug/strace/6.7/src/xlat/mtd_type_options.h /usr/src/debug/strace/6.7/src/xlat/statx_attrs.h /usr/src/debug/strace/6.7/src/xlat/uffd_writeprotect_mode_flags.h /usr/src/debug/strace/6.7/src/xlat/counter_ioctl_scopes.h /usr/src/debug/strace/6.7/tests/clock_adjtime-common.c /usr/src/debug/strace/6.7/src/ipc_msgctl.c /usr/src/debug/strace/6.7/src/ipc_semctl.c /usr/src/debug/strace/6.7/src/ipc_shmctl.c /usr/src/debug/strace/6.7/src/xlat/ubi_volume_types.h /usr/src/debug/strace/6.7/tests/signal2name.c /usr/src/debug/strace/6.7/tests/ioctl_mtd.c /usr/src/debug/strace/6.7/tests/ioctl_nbd.c /usr/src/debug/strace/6.7/src/netlink_kobject_uevent.h /usr/src/debug/strace/6.7/src/xlat/tee_ioctl_max_arg_size.h /usr/src/debug/strace/6.7/src/netlink_kobject_uevent.c /usr/src/debug/strace/6.7/src/xlat/getsock_ipv6_options.h /usr/src/debug/strace/6.7/src/xlat/setsock_ipv6_options.h /usr/src/debug/strace/6.7/tests/prctl-securebits.
 c /usr/src/debug/strace/6.7/src/xlat/sock_irda_options.h /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_vf_info_attrs.h /usr/src/debug/strace/6.7/src/retval.h /usr/src/debug/strace/6.7/src/xlat/perf_hw_cache_id.h /usr/src/debug/strace/6.7/src/rtnl_mdb.c /usr/src/debug/strace/6.7/src/retval.c /usr/src/debug/strace/6.7/tests/erestartsys.c /usr/src/debug/strace/6.7/tests/mq.c /usr/src/debug/strace/6.7/src/xlat/tee_ioctl_param_attr_types.h /usr/src/debug/strace/6.7/src/netlink_inet_diag.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/openat2.h /usr/src/debug/strace/6.7/src/kernel_timespec.h /usr/src/debug/strace/6.7/tests/set_mempolicy_home_node.c /usr/src/debug/strace/6.7/src/xlat/btrfs_features_compat.h /usr/src/debug/strace/6.7/src/xlat/at_flags.h /usr/src/debug/strace/6.7/src/xlat/dm_flags.h /usr/src/debug/strace/6.7/src/xlat/iffflags.h /usr/src/debug/strace/6.7/tests/s390_sthyi.c /usr/src/debug/strace/6.7/src/xlat/fib_rule_flags.h /usr/src/debug/strace/6.7/tests/clock_xe
 ttime64.c /usr/src/debug/strace/6.7/src/fspick.c /usr/src/debug/strace/6.7/tests/finit_module.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/mptcp_pm.h /usr/src/debug/strace/6.7/src/xlat/tcxonc_options.h /usr/src/debug/strace/6.7/src/xlat/btrfs_balance_state.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/if_bridge.h /usr/src/debug/strace/6.7/src/dup.c /usr/src/debug/strace/6.7/src/ptp.c /usr/src/debug/strace/6.7/src/sockaddr.c /usr/src/debug/strace/6.7/src/xlat/routing_flags.h /usr/src/debug/strace/6.7/src/xlat/routing_types.h /usr/src/debug/strace/6.7/tests/prctl-fp-mode.c /usr/src/debug/strace/6.7/tests/xchownx.c /usr/src/debug/strace/6.7/tests/faccessat-y--secontext.c /usr/src/debug/strace/6.7/tests/pread64-pwrite64.c /usr/src/debug/strace/6.7/tests/preadv2-pwritev2.c /usr/src/debug/strace/6.7/tests/fadvise64_64.c /usr/src/debug/strace/6.7/tests/inject-nf.c /usr/src/debug/strace/6.7/src/xlat/tun_device_types.h /usr/src/debug/strace/6.7/tests/statfs64.c
  /usr/src/debug/strace/6.7/tests/strace-n.c /usr/src/debug/strace/6.7/tests/strace-x.c /usr/src/debug/strace/6.7/src/xlat/v4l2_control_classes.h /usr/src/debug/strace/6.7/src/getcwd.c /usr/src/debug/strace/6.7/tests/epoll_create1.c /usr/src/debug/strace/6.7/src/xlat/uffd_api_flags.h /usr/src/debug/strace/6.7/tests/netlink_audit.c /usr/src/debug/strace/6.7/src/xlat/bpf_file_mode_flags.h /usr/src/debug/strace/6.7/src/xlat/inet_diag_extended_flags.h /usr/src/debug/strace/6.7/tests/request_key.c /usr/src/debug/strace/6.7/src/xlat/landlock_create_ruleset_flags.h /usr/src/debug/strace/6.7/tests/openat2.c /usr/src/debug/strace/6.7/src/xlat/bsg_flags.h /usr/src/debug/strace/6.7/src/xlat/efd_flags.h /usr/src/debug/strace/6.7/src/xlat/fs_xflags.h /usr/src/debug/strace/6.7/src/xlat/mdb_flags.h /usr/src/debug/strace/6.7/src/xlat/msg_flags.h /usr/src/debug/strace/6.7/src/xlat/pollflags.h /usr/src/debug/strace/6.7/src/xlat/rwf_flags.h /usr/src/debug/strace/6.7/src/xlat/sfd_flags.h /usr/src/debug/
 strace/6.7/src/xlat/shm_flags.h /usr/src/debug/strace/6.7/src/xlat/xdp_flags.h /usr/src/debug/strace/6.7/tests/sched_xetaffinity.c /usr/src/debug/strace/6.7/tests/timerfd_xettime.c /usr/src/debug/strace/6.7/tests/set_mempolicy.c /usr/src/debug/strace/6.7/src/xlat/ieee802154_addr_types.h /usr/src/debug/strace/6.7/tests/status-successful.c /usr/src/debug/strace/6.7/tests/qual_signal.c /usr/src/debug/strace/6.7/src/xlat/rtnl_tca_root_attrs.h /usr/src/debug/strace/6.7/src/xlat/rtnl_tca_stab_attrs.h /usr/src/debug/strace/6.7/src/nbd_ioctl.c /usr/src/debug/strace/6.7/src/sg_io_v4.c /usr/src/debug/strace/6.7/tests/count-f.c /usr/src/debug/strace/6.7/src/trace_event.h /usr/src/debug/strace/6.7/tests/pidfd_open.c /usr/src/debug/strace/6.7/src/truncate.c /usr/src/debug/strace/6.7/src/secontext.h /usr/src/debug/strace/6.7/src/xlat/inet_diag_bpf_storages_attrs.h /usr/src/debug/strace/6.7/src/xlat/mtd_otp_options.h /usr/src/debug/strace/6.7/src/xlat/sigprocmaskcmds.h /usr/src/debug/strace/6.7/te
 sts/delay.c /usr/src/debug/strace/6.7/src/memfd_create.c /usr/src/debug/strace/6.7/src/netlink_unix_diag.c /usr/src/debug/strace/6.7/src/xlat/pr_fp_mode.h /usr/src/debug/strace/6.7/tests/nlattr_ifla_brport.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/if_link.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/netlink.h /usr/src/debug/strace/6.7/src/xlat/kd_font_ops.h /usr/src/debug/strace/6.7/src/fs_f_ioctl.c /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_vf_port_attrs.h /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_af_spec_bridge_vlan_tunnel_info_attrs.h /usr/src/debug/strace/6.7/src/xlat/rtnl_tc_action_attrs.h /usr/src/debug/strace/6.7/tests/getrusage.c /usr/src/debug/strace/6.7/src/xlat/xfs_quota_flags.h /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_events.h /usr/src/debug/strace/6.7/src/xlat/open_tree_flags.h /usr/src/debug/strace/6.7/tests/landlock_create_ruleset.c /usr/src/debug/strace/6.7/src/xlat/nl_netfilter_msg_types.h /usr/src/debug/strace/6.7/src/clo
 se_range.c /usr/src/debug/strace/6.7/tests/setrlimit.c /usr/src/debug/strace/6.7/src/xlat/rtc_params.h /usr/src/debug/strace/6.7/src/xlat/gpio_handle_flags.h /usr/src/debug/strace/6.7/src/xlat/getsock_options.h /usr/src/debug/strace/6.7/src/xlat/setsock_options.h /usr/src/debug/strace/6.7/tests/secontext.h /usr/src/debug/strace/6.7/src/xlat/btrfs_balance_ctl_cmds.h /usr/src/debug/strace/6.7/tests/net-icmp_filter.c /usr/src/debug/strace/6.7/tests/inotify_init1.c /usr/src/debug/strace/6.7/tests/seccomp-filter-v.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/mount.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/quota.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/sched.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/types.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/btrfs.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/blkpg.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/dcbnl.h /usr/src/de
 bug/strace/6.7/bundled/linux/include/uapi/linux/futex.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/input.h /usr/src/debug/strace/6.7/src/getcpu.c /usr/src/debug/strace/6.7/src/xlat/btrfs_dev_replace_cmds.h /usr/src/debug/strace/6.7/tests/pipe.c /usr/src/debug/strace/6.7/tests/sync_file_range.c /usr/src/debug/strace/6.7/src/ioctl.c /usr/src/debug/strace/6.7/src/prctl.c /usr/src/debug/strace/6.7/tests/nlattr_netlink_diag_msg.c /usr/src/debug/strace/6.7/src/xstring.h /usr/src/debug/strace/6.7/tests/faccessat2.c /usr/src/debug/strace/6.7/tests/ioctl_v4l2-success.c /usr/src/debug/strace/6.7/src/bpf_attr.h /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_af_spec_mctp_attrs.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/videodev2.h /usr/src/debug/strace/6.7/src/xlat/shadow_stack_flags.h /usr/src/debug/strace/6.7/src/xlat/fcntlcmds.h /usr/src/debug/strace/6.7/src/xlat/flockcmds.h /usr/src/debug/strace/6.7/src/xlat/lockfcmds.h /usr/src/debug/strace/6.7/src/xlat/quot
 acmds.h /usr/src/debug/strace/6.7/tests/utimensat.c /usr/src/debug/strace/6.7/src/xlat/sync_file_range_flags.h /usr/src/debug/strace/6.7/src/mmsghdr.c /usr/src/debug/strace/6.7/src/xlat/rtc_backup_switch_modes.h /usr/src/debug/strace/6.7/src/netlink_crypto.c /usr/src/debug/strace/6.7/src/xlat/btrfs_fs_info_flags.h /usr/src/debug/strace/6.7/src/loop.c /usr/src/debug/strace/6.7/tests/xutimes.c /usr/src/debug/strace/6.7/src/fetch_indirect_syscall_args.c /usr/src/debug/strace/6.7/src/xlat/kd_kbd_modes.h /usr/src/debug/strace/6.7/src/xlat/kd_kbd_types.h /usr/src/debug/strace/6.7/src/xlat/kd_led_flags.h /usr/src/debug/strace/6.7/src/xlat/ptrace_peeksiginfo_flags.h /usr/src/debug/strace/6.7/src/xlat/waitid_types.h /usr/src/debug/strace/6.7/src/netlink_selinux.c /usr/src/debug/strace/6.7/tests/mmap.c /usr/src/debug/strace/6.7/src/umount.c /usr/src/debug/strace/6.7/src/xlat/tcp_state_flags.h /usr/src/debug/strace/6.7/tests/s390_runtime_instr.c /usr/src/debug/strace/6.7/tests/ip_local_port_ra
 nge.c /usr/src/debug/strace/6.7/tests/sync.c /usr/src/debug/strace/6.7/src/xlat/bpf_link_create_kprobe_multi_flags.h /usr/src/debug/strace/6.7/src/print_ifindex.c /usr/src/debug/strace/6.7/src/fsconfig.c /usr/src/debug/strace/6.7/src/ucopy.c /usr/src/debug/strace/6.7/tests/ioprio.c /usr/src/debug/strace/6.7/tests/kill_child.c /usr/src/debug/strace/6.7/tests/nlattr_nlmsgerr.c /usr/src/debug/strace/6.7/src/xlat/uring_iowq_acct.h /usr/src/debug/strace/6.7/src/xlat/v4l2_sliced_flags.h /usr/src/debug/strace/6.7/tests/tail_alloc.c /usr/src/debug/strace/6.7/src/xlat/fdb_notify_flags.h /usr/src/debug/strace/6.7/tests/prctl-arg2-intptr.c /usr/src/debug/strace/6.7/tests/netlink_protocol.c /usr/src/debug/strace/6.7/tests/vfork-f.c /usr/src/debug/strace/6.7/src/xlat/bpf_attach_flags.h /usr/src/debug/strace/6.7/src/xlat/rtnl_ifla_info_data_tun_attrs.h /usr/src/debug/strace/6.7/src/xlat/sg_io_flags.h /usr/src/debug/strace/6.7/src/xlat/vsock_flags.h /usr/src/debug/strace/6.7/src/xlat/clone_flags.h
  /usr/src/debug/strace/6.7/src/xlat/mbind_flags.h /usr/src/debug/strace/6.7/src/xlat/mlock_flags.h /usr/src/debug/strace/6.7/src/xlat/modem_flags.h /usr/src/debug/strace/6.7/src/xlat/mount_flags.h /usr/src/debug/strace/6.7/src/xlat/sched_flags.h /usr/src/debug/strace/6.7/src/xlat/semop_flags.h /usr/src/debug/strace/6.7/src/exitkill.c /usr/src/debug/strace/6.7/src/xlat/bpf_src.h /usr/src/debug/strace/6.7/tests/printstrn-umoven-peekdata.c /usr/src/debug/strace/6.7/src/exitkill.h /usr/src/debug/strace/6.7/tests/uio.c /usr/src/debug/strace/6.7/src/xlat/secbits.h /usr/src/debug/strace/6.7/src/kernel_timex.h /usr/src/debug/strace/6.7/tests/netlink_route.c /usr/src/debug/strace/6.7/src/xlat/shutdown_modes.h /usr/src/debug/strace/6.7/tests/bpf-obj_get_info_by_fd.c /usr/src/debug/strace/6.7/src/xlat/socketcalls.h /usr/src/debug/strace/6.7/src/xlat/evdev_ff_types.h /usr/src/debug/strace/6.7/tests/semop-indirect.c /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/mqueue.h /usr/src/deb
 ug/strace/6.7/bundled/linux/include/uapi/linux/mroute.h /usr/src/debug/strace/6.7/src/sysent.h /usr/src/debug/strace/6.7/tests/clock_t_str.c /usr/src/debug/strace/6.7/tests/truncate64.c /usr/src/debug/strace/6.7/tests/status-none-threads.c /usr/src/debug/strace/6.7/src/dm.c /usr/src/debug/strace/6.7/src/io.c /usr/src/debug/strace/6.7/src/mq.c /usr/src/debug/strace/6.7/src/mtd.c /usr/src/debug/strace/6.7/src/uid.c /usr/src/debug/strace/6.7/src/xlat/counter_ioctl_component_types.h /usr/src/debug/strace/6.7/src/xlat/rtnl_ip6mra_msg_types.h /usr/src/debug/strace/6.7/tests/so_peerpidfd.c /usr/src/debug/strace/6.7/tests/nfnetlink_nft_compat.c /usr/src/debug/strace/6.7/tests/prctl-sched-core.c /usr/src/debug/strace/6.7/src/print_timespec.h /usr/src/debug/strace/6.7/src/xlat/kexec_arch_values.h /usr/src/debug/strace/6.7/tests/nlattr_packet_diag_msg.c /usr/src/debug/strace/6.7/tests/sync_file_range2.c /usr/src/debug/strace/6.7/tests/io_uring_register.c /usr/src/debug/strace/6.7/tests/mlock.c
  /usr/src/debug/strace/6.7/tests/ioctl_perf.c /usr/src/debug/strace/6.7/src/xlat/sock_rxrpc_options.h /usr/src/debug/strace/6.7/src/xlat/tee_ioctl_impl_ids.h /usr/src/debug/strace/6.7/src/scsi.c /usr/src/debug/strace/6.7/tests/mmsg_name.c /usr/src/debug/strace/6.7/tests/nlattr_cachereport.c /usr/src/debug/strace/6.7/tests/personality.c /usr/src/debug/strace/6.7/tests/nlattr_netconfmsg.c /usr/src/debug/strace/6.7/src/xlat/inotify_init_flags.h /usr/src/debug/strace/6.7/src/xlat/inet6_devconf_indices.h /usr/src/debug/strace/6.7/src/print_struct_stat.c /usr/src/debug/strace/6.7/tests/answer.c /usr/src/debug/strace/6.7/tests/swap.c /usr/src/debug/strace/6.7/tests/unlink.c /usr/src/debug/strace/6.7/src/xlat/btrfs_dev_stats_values.h /usr/src/debug/strace/6.7/bundled/linux/include/uapi/linux/landlock.h /usr/src/debug/strace/6.7/tests/mmsg.c /usr/src/debug/strace/6.7/src/xlat/rtnl_dcb_attrs.h /usr/src/debug/strace/6.7/src/xlat/pkey_access.h /usr/src/debug/strace/6.7/tests/prctl-sme.c /usr/sr
 c/debug/strace/6.7/tests/prctl-sve.c /usr/src/debug/strace/6.7/src/signalfd.c /usr/src/debug/strace/6.7/src/xlat/cap.h /usr/src/debug/strace/6.7/src/iovec.h", added "/usr/src/debug/strace/6.8/src/xlat/ebpf_class.h /usr/src/debug/strace/6.8/tests/ftruncate.c /usr/src/debug/strace/6.8/tests/futex.c /usr/src/debug/strace/6.8/src/xlat/futexwakeops.h /usr/src/debug/strace/6.8/src/xlat/nfc_sockaddr_protocols.h /usr/src/debug/strace/6.8/src/xlat/netlink_protocols.h /usr/src/debug/strace/6.8/src/xlat/rtnl_tca_act_hw_stats.h /usr/src/debug/strace/6.8/tests/status-successful-threads.c /usr/src/debug/strace/6.8/tests/pipe2.c /usr/src/debug/strace/6.8/src/xlat/keyctl_commands.h /usr/src/debug/strace/6.8/tests/netlink_audit.c /usr/src/debug/strace/6.8/src/xlat/syslog_action_type.h /usr/src/debug/strace/6.8/tests/mq_sendrecv.c /usr/src/debug/strace/6.8/src/xlat/inet6_if_flags.h /usr/src/debug/strace/6.8/tests/secontext.h /usr/src/debug/strace/6.8/src/fs_0x94_ioctl.c /usr/src/debug/strace/6.8/test
 s/setrlimit.c /usr/src/debug/strace/6.8/tests/nfnetlink_ctnetlink.c /usr/src/debug/strace/6.8/src/xlat/sock_tcp_options.h /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_proto_down_reason_attrs.h /usr/src/debug/strace/6.8/src/xlat/nl_route_types.h /usr/src/debug/strace/6.8/src/xlat/kd_kbd_types.h /usr/src/debug/strace/6.8/src/xlat/kd_led_flags.h /usr/src/debug/strace/6.8/src/xlat/waitid_types.h /usr/src/debug/strace/6.8/src/xlat/kd_kbd_modes.h /usr/src/debug/strace/6.8/src/xlat/term_oflags_crdly.h /usr/src/debug/strace/6.8/tests/attach-p-cmd-cmd.c /usr/src/debug/strace/6.8/tests/kern_features.c /usr/src/debug/strace/6.8/src/umask.c /usr/src/debug/strace/6.8/tests/ugetrlimit.c /usr/src/debug/strace/6.8/tests/pselect6_time64.c /usr/src/debug/strace/6.8/tests/redirect-fds.c /usr/src/debug/strace/6.8/src/xlat/kd_key_ascii_keys.h /usr/src/debug/strace/6.8/src/xlat/kd_key_shift_keys.h /usr/src/debug/strace/6.8/src/xlat/kd_key_slock_keys.h /usr/src/debug/strace/6.8/tests/lstat64.c /usr/src/de
 bug/strace/6.8/src/xlat/rtc_features.h /usr/src/debug/strace/6.8/src/xlat/term_cflags.h /usr/src/debug/strace/6.8/src/trie.c /usr/src/debug/strace/6.8/tests/sched_xetparam.c /usr/src/debug/strace/6.8/src/trie.h /usr/src/debug/strace/6.8/tests/ioctl_counter.c /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_vf_stats_attrs.h /usr/src/debug/strace/6.8/tests/list_sigaction_signum.c /usr/src/debug/strace/6.8/tests/vmsplice.c /usr/src/debug/strace/6.8/tests/fallocate.c /usr/src/debug/strace/6.8/src/ucopy.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/btrfs_tree.h /usr/src/debug/strace/6.8/src/xlat/lwtunnel_encap_types.h /usr/src/debug/strace/6.8/tests/subdir.c /usr/src/debug/strace/6.8/src/xlat/v4l2_buf_flags_ts_type.h /usr/src/debug/strace/6.8/src/xlat/tee_ioctl_param_attr_types.h /usr/src/debug/strace/6.8/tests/netlink_xfrm.c /usr/src/debug/strace/6.8/tests/getresugid.c /usr/src/debug/strace/6.8/src/xlat/v4l2_tuner_audmodes.h /usr/src/debug/strace/6.8/src/clone.c /usr/src/debu
 g/strace/6.8/src/xlat/sg_io_info.h /usr/src/debug/strace/6.8/tests/futimesat.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/nfc.h /usr/src/debug/strace/6.8/tests/ioctl_kvm_run_common.c /usr/src/debug/strace/6.8/tests/nlattr_ifla_vfinfo.c /usr/src/debug/strace/6.8/src/xlat/bpf_src.h /usr/src/debug/strace/6.8/src/rtnl_neigh.c /usr/src/debug/strace/6.8/src/dirent.c /usr/src/debug/strace/6.8/src/rtnl_route.c /usr/src/debug/strace/6.8/src/rtnl_stats.c /usr/src/debug/strace/6.8/src/xlat/fib_rule_actions.h /usr/src/debug/strace/6.8/src/fetch_struct_msghdr.c /usr/src/debug/strace/6.8/tests/getpeername.c /usr/src/debug/strace/6.8/tests/getsockname.c /usr/src/debug/strace/6.8/tests/execveat.c /usr/src/debug/strace/6.8/src/xlat/ptp_pin_funcs.h /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_info_data_tun_attrs.h /usr/src/debug/strace/6.8/src/xlat/term_iflags.h /usr/src/debug/strace/6.8/tests/remap_file_pages.c /usr/src/debug/strace/6.8/tests/poke-sendfile.c /usr/src/debug/strace/6.8
 /tests/fanotify_mark.c /usr/src/debug/strace/6.8/src/xlat/setns_types.h /usr/src/debug/strace/6.8/tests/fchmodat2--secontext.c /usr/src/debug/strace/6.8/tests/xetpriority.c /usr/src/debug/strace/6.8/src/xlat/tcp_ao_keyf_flags.h /usr/src/debug/strace/6.8/tests/nlattr_packet_diag_msg.c /usr/src/debug/strace/6.8/tests/caps.c /usr/src/debug/strace/6.8/src/xlat/mount_setattr_flags.h /usr/src/debug/strace/6.8/src/xlat/mptcp_subflow_flags.h /usr/src/debug/strace/6.8/tests/vfork-f.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/if_addr.h /usr/src/debug/strace/6.8/tests/get_mempolicy.c /usr/src/debug/strace/6.8/src/xlat/bluetooth_l2_cid.h /usr/src/debug/strace/6.8/tests/wait4.c /usr/src/debug/strace/6.8/tests/umount.c /usr/src/debug/strace/6.8/src/mtd.c /usr/src/debug/strace/6.8/src/uid.c /usr/src/debug/strace/6.8/src/xlat/madvise_hppa_generic_cmds.h /usr/src/debug/strace/6.8/src/xlat/perf_event_sample_format.h /usr/src/debug/strace/6.8/tests/file_handle--secontext.c /usr/src/de
 bug/strace/6.8/tests/nanosleep.c /usr/src/debug/strace/6.8/src/xlat/get_mempolicy_flags.h /usr/src/debug/strace/6.8/src/xlat/adjtimex_state.h /usr/src/debug/strace/6.8/tests/nlattr_ifla_linkinfo.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/tee.h /usr/src/debug/strace/6.8/src/xlat/x86_xfeature_bits.h /usr/src/debug/strace/6.8/tests/nlattr_ifla_protinfo.c /usr/src/debug/strace/6.8/tests/renameat2.c /usr/src/debug/strace/6.8/tests/seccomp_get_notif_sizes.c /usr/src/debug/strace/6.8/tests/prctl-unalign.c /usr/src/debug/strace/6.8/tests/sync_file_range.c /usr/src/debug/strace/6.8/tests/ptrace.c /usr/src/debug/strace/6.8/src/socketcall.c /usr/src/debug/strace/6.8/tests/libsocketcall.c /usr/src/debug/strace/6.8/src/xlat/ubi_volume_types.h /usr/src/debug/strace/6.8/tests/nfnetlink_ulog.c /usr/src/debug/strace/6.8/tests/semtimedop-ipc.c /usr/src/debug/strace/6.8/tests/pkey_mprotect.c /usr/src/debug/strace/6.8/tests/syslog.c /usr/src/debug/strace/6.8/src/xlat/mlockall_flags.h 
 /usr/src/debug/strace/6.8/src/xlat/pidfd_open_flags.h /usr/src/debug/strace/6.8/tests/printflags.c /usr/src/debug/strace/6.8/tests/pkey_alloc.c /usr/src/debug/strace/6.8/tests/preadv-pwritev.c /usr/src/debug/strace/6.8/src/xlat/sigprocmaskcmds.h /usr/src/debug/strace/6.8/src/xlat/seccomp_ops.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/packet_diag.h /usr/src/debug/strace/6.8/src/dup.c /usr/src/debug/strace/6.8/src/ptp.c /usr/src/debug/strace/6.8/src/xlat/nf_osf_msg_types.h /usr/src/debug/strace/6.8/src/xlat/ifstats_xstats_bridge_mcast_indices.h /usr/src/debug/strace/6.8/tests/epoll_wait.c /usr/src/debug/strace/6.8/src/xlat/seccomp_filter_flags.h /usr/src/debug/strace/6.8/tests/gettid.c /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_af_spec_bridge_vlan_tunnel_info_attrs.h /usr/src/debug/strace/6.8/tests/futex_wake.c /usr/src/debug/strace/6.8/tests/fill_memory.c /usr/src/debug/strace/6.8/src/xlat/uring_iowq_acct.h /usr/src/debug/strace/6.8/src/xlat/adjtimex_modes.h /usr/
 src/debug/strace/6.8/src/xlat/v4l2_meta_fmts.h /usr/src/debug/strace/6.8/tests/accept.c /usr/src/debug/strace/6.8/tests/xattr-strings.c /usr/src/debug/strace/6.8/tests/net-tpacket_req.c /usr/src/debug/strace/6.8/src/bpf_fprog.h /usr/src/debug/strace/6.8/src/xlat/ethernet_protocols.h /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_af_spec_inet_attrs.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/userfaultfd.h /usr/src/debug/strace/6.8/tests/clone_ptrace.c /usr/src/debug/strace/6.8/tests/keyctl.c /usr/src/debug/strace/6.8/src/xlat/tee_ioctl_shm_flags.h /usr/src/debug/strace/6.8/tests/ioctl_uffdio.c /usr/src/debug/strace/6.8/src/xlat/rtnl_rta_metrics_attrs.h /usr/src/debug/strace/6.8/tests/nlattr_ifla.h /usr/src/debug/strace/6.8/src/rtnl_tc_action.c /usr/src/debug/strace/6.8/src/xlat/inet_diag_bytecodes.h /usr/src/debug/strace/6.8/src/ipc_shm.c /usr/src/debug/strace/6.8/src/xlat/routing_table_ids.h /usr/src/debug/strace/6.8/tests/status-all.c /usr/src/debug/strace/6.8/src/xl
 at/mtd_mode_options.h /usr/src/debug/strace/6.8/tests/prctl-sme.c /usr/src/debug/strace/6.8/tests/prctl-sve.c /usr/src/debug/strace/6.8/src/xlat/v4l2_control_query_flags.h /usr/src/debug/strace/6.8/tests/prctl-tsc.c /usr/src/debug/strace/6.8/src/xlat/resources.h /usr/src/debug/strace/6.8/src/close_range.c /usr/src/debug/strace/6.8/tests/process_vm_readv_writev.c /usr/src/debug/strace/6.8/src/xlat/evdev_misc.h /usr/src/debug/strace/6.8/src/xlat/syslog_console_levels.h /usr/src/debug/strace/6.8/src/xlat/rtnl_mdba_mdb_eattr_attrs.h /usr/src/debug/strace/6.8/src/xlat/rtnl_mdba_mdb_entry_attrs.h /usr/src/debug/strace/6.8/tests/nfnetlink_cthelper.c /usr/src/debug/strace/6.8/src/print_struct_stat.c /usr/src/debug/strace/6.8/src/xlat/ipccalls.h /usr/src/debug/strace/6.8/tests/ioctl_random.c /usr/src/debug/strace/6.8/src/xlat/btrfs_tree_objectids.h /usr/src/debug/strace/6.8/src/membarrier.c /usr/src/debug/strace/6.8/src/number_set.c /usr/src/debug/strace/6.8/src/statx.h /usr/src/debug/strace
 /6.8/src/number_set.h /usr/src/debug/strace/6.8/src/statx.c /usr/src/debug/strace/6.8/tests/get_sigset_size.c /usr/src/debug/strace/6.8/tests/getuid.c /usr/src/debug/strace/6.8/src/xlat/kd_key_fn_keys.h /usr/src/debug/strace/6.8/src/get_robust_list.c /usr/src/debug/strace/6.8/src/xlat/sock_nfcllcp_options.h /usr/src/debug/strace/6.8/src/xlat/uring_restriction_opcodes.h /usr/src/debug/strace/6.8/tests/chmod--secontext.c /usr/src/debug/strace/6.8/src/xlat/rtnl_mdb_attrs.h /usr/src/debug/strace/6.8/tests/ioctl_rtc.c /usr/src/debug/strace/6.8/src/xlat/sg_io_dxfer_direction.h /usr/src/debug/strace/6.8/tests/ioctl_loop.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/v4l2-controls.h /usr/src/debug/strace/6.8/src/xlat/rtnl_mdba_mdb_attrs.h /usr/src/debug/strace/6.8/src/xlat/v4l2_fields.h /usr/src/debug/strace/6.8/src/xlat/dirent_types.h /usr/src/debug/strace/6.8/src/xlat/sigact_flags.h /usr/src/debug/strace/6.8/src/xlat/umount_flags.h /usr/src/debug/strace/6.8/tests/ioctl_kvm_r
 un.c /usr/src/debug/strace/6.8/src/xlat/evdev_snd.h /usr/src/debug/strace/6.8/src/xlat/pr_tsc.h /usr/src/debug/strace/6.8/src/xlat/pr_dumpable.h /usr/src/debug/strace/6.8/tests/semtimedop_time64.c /usr/src/debug/strace/6.8/tests/socketcall.c /usr/src/debug/strace/6.8/src/ioctl.c /usr/src/debug/strace/6.8/src/prctl.c /usr/src/debug/strace/6.8/src/xlat/phonet_protocols.h /usr/src/debug/strace/6.8/src/xlat/sync_file_range_flags.h /usr/src/debug/strace/6.8/tests/nlattr_ndmsg.c /usr/src/debug/strace/6.8/src/sg_io_v3.c /usr/src/debug/strace/6.8/src/xlat/sa_handler_values.h /usr/src/debug/strace/6.8/tests/pidfd_send_signal.c /usr/src/debug/strace/6.8/tests/nlattr_ifstats.c /usr/src/debug/strace/6.8/src/xlat/advise.h /usr/src/debug/strace/6.8/tests/nlattr_inet_diag_req_compat.c /usr/src/debug/strace/6.8/tests/rt_sigaction.c /usr/src/debug/strace/6.8/src/perf_event_struct.h /usr/src/debug/strace/6.8/tests/ioctl_tiocm.c /usr/src/debug/strace/6.8/src/xlat/uring_enter_flags.h /usr/src/debug/str
 ace/6.8/src/xlat/evdev_autorepeat.h /usr/src/debug/strace/6.8/src/xlat/uring_sqe_flags.h /usr/src/debug/strace/6.8/tests/timerfd_xettime.c /usr/src/debug/strace/6.8/src/btrfs.c /usr/src/debug/strace/6.8/src/xlat/ifstats_offload_attrs.h /usr/src/debug/strace/6.8/tests/clone-flags.c /usr/src/debug/strace/6.8/src/sigaltstack.c /usr/src/debug/strace/6.8/src/xlat/kvm_exit_reason.h /usr/src/debug/strace/6.8/tests/trie_test.c /usr/src/debug/strace/6.8/tests/move_pages.c /usr/src/debug/strace/6.8/src/xlat/v4l2_input_types.h /usr/src/debug/strace/6.8/src/xlat/nl_xfrm_types.h /usr/src/debug/strace/6.8/src/link.c /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_brport_attrs.h /usr/src/debug/strace/6.8/src/filter_qualify.c /usr/src/debug/strace/6.8/src/xlat/evdev_ev.h /usr/src/debug/strace/6.8/src/xlat/netlink_sk_meminfo_indices.h /usr/src/debug/strace/6.8/src/pidfd_getfd.c /usr/src/debug/strace/6.8/src/xlat/loop_flags_options.h /usr/src/debug/strace/6.8/src/xlat/notifyflags.h /usr/src/debug/strace
 /6.8/src/xlat/sock_packet_options.h /usr/src/debug/strace/6.8/src/xlat/statmount_mnt_propagation.h /usr/src/debug/strace/6.8/src/xlat/v4l2_control_ids.h /usr/src/debug/strace/6.8/tests/perf_event_open.c /usr/src/debug/strace/6.8/src/reboot.c /usr/src/debug/strace/6.8/tests/setns.c /usr/src/debug/strace/6.8/src/xlat/ebpf_op_jmp.h /usr/src/debug/strace/6.8/src/inotify.c /usr/src/debug/strace/6.8/src/xlat/landlock_rule_types.h /usr/src/debug/strace/6.8/tests/adjtimex.c /usr/src/debug/strace/6.8/src/xlat/nf_cthelper_msg_types.h /usr/src/debug/strace/6.8/tests/nlattr_inet_diag_req_v2.c /usr/src/debug/strace/6.8/src/xlat/bpf_rval.h /usr/src/debug/strace/6.8/tests/umovestr3.c /usr/src/debug/strace/6.8/tests/pc.c /usr/src/debug/strace/6.8/tests/ioctl_seccomp.c /usr/src/debug/strace/6.8/src/xlat/bpf_prog_flags.h /usr/src/debug/strace/6.8/src/xlat/bpf_prog_types.h /usr/src/debug/strace/6.8/src/xlat/sock_bluetooth_options.h /usr/src/debug/strace/6.8/tests/recv-MSG_TRUNC.c /usr/src/debug/strace
 /6.8/src/xlat/bpf_link_create_kprobe_multi_flags.h /usr/src/debug/strace/6.8/src/xlat/inet_diag_bpf_storages_attrs.h /usr/src/debug/strace/6.8/tests/futex2_flags.h /usr/src/debug/strace/6.8/tests/btrfs.c /usr/src/debug/strace/6.8/tests/seccomp_get_action_avail.c /usr/src/debug/strace/6.8/src/xlat/term_oflags_vtdly.h /usr/src/debug/strace/6.8/src/fallocate.c /usr/src/debug/strace/6.8/src/xlat/statmount_mask.h /usr/src/debug/strace/6.8/tests/times.c /usr/src/debug/strace/6.8/src/xlat/getsock_ipv6_options.h /usr/src/debug/strace/6.8/src/xlat/kexec_load_flags.h /usr/src/debug/strace/6.8/src/xlat/setsock_ipv6_options.h /usr/src/debug/strace/6.8/src/xlat/getsock_ip_options.h /usr/src/debug/strace/6.8/src/xlat/setsock_ip_options.h /usr/src/debug/strace/6.8/src/fetch_indirect_syscall_args.c /usr/src/debug/strace/6.8/tests/ioctl_lirc.c /usr/src/debug/strace/6.8/src/xlat/routing_flags.h /usr/src/debug/strace/6.8/src/xlat/routing_types.h /usr/src/debug/strace/6.8/tests/flock.c /usr/src/debug/s
 trace/6.8/src/delay.c /usr/src/debug/strace/6.8/src/delay.h /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_af_spec_bridge_attrs.h /usr/src/debug/strace/6.8/src/xlat/uring_register_opcodes.h /usr/src/debug/strace/6.8/src/ldt.c /usr/src/debug/strace/6.8/src/net.c /usr/src/debug/strace/6.8/src/kernel_rusage.h /usr/src/debug/strace/6.8/tests/nlattr_fib_rule_hdr.c /usr/src/debug/strace/6.8/src/xlat/v4l2_control_id_bases.h /usr/src/debug/strace/6.8/tests/signalfd4.c /usr/src/debug/strace/6.8/tests/io_uring_register.c /usr/src/debug/strace/6.8/tests/so_peerpidfd.c /usr/src/debug/strace/6.8/tests/mmap.c /usr/src/debug/strace/6.8/tests/time_enjoyment.h /usr/src/debug/strace/6.8/src/xlat/statx_attrs.h /usr/src/debug/strace/6.8/src/xlat/inet_diag_shutdown_flags.h /usr/src/debug/strace/6.8/tests/status-none-threads.c /usr/src/debug/strace/6.8/tests/fork-f.c /usr/src/debug/strace/6.8/src/perf.c /usr/src/debug/strace/6.8/tests/semtimedop-common.c /usr/src/debug/strace/6.8/src/memfd_secret.c /usr/sr
 c/debug/strace/6.8/src/xlat/kd_meta_vals.h /usr/src/debug/strace/6.8/tests/process_mrelease.c /usr/src/debug/strace/6.8/src/xlat/v4l2_tuner_types.h /usr/src/debug/strace/6.8/src/readahead.c /usr/src/debug/strace/6.8/tests/add_key.c /usr/src/debug/strace/6.8/tests/sockaddr_xlat.c /usr/src/debug/strace/6.8/src/xlat/kd_default_led_flags.h /usr/src/debug/strace/6.8/tests/dirfd.c /usr/src/debug/strace/6.8/tests/sxetmask.c /usr/src/debug/strace/6.8/src/affinity.c /usr/src/debug/strace/6.8/tests/nlattr_tcmsg.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/rtnetlink.h /usr/src/debug/strace/6.8/src/xlat/rtnl_tca_root_attrs.h /usr/src/debug/strace/6.8/src/xlat/rtnl_tca_stab_attrs.h /usr/src/debug/strace/6.8/tests/net-tpacket_stats.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/vm_sockets.h /usr/src/debug/strace/6.8/src/print_statfs.c /usr/src/debug/strace/6.8/src/filter.h /usr/src/debug/strace/6.8/src/xlat/pr_mce_kill_policy.h /usr/src/debug/strace/6.8/src/xlat/kd_k
 ey_dead_keys.h /usr/src/debug/strace/6.8/src/xlat/kd_key_lock_keys.h /usr/src/debug/strace/6.8/src/xlat/kd_key_spec_keys.h /usr/src/debug/strace/6.8/tests/inject-nf.c /usr/src/debug/strace/6.8/src/xlat/pr_sched_core_cmds.h /usr/src/debug/strace/6.8/tests/preadv.c /usr/src/debug/strace/6.8/src/rtnl_netconf.c /usr/src/debug/strace/6.8/src/xlat/uffd_api_flags.h /usr/src/debug/strace/6.8/tests/answer.c /usr/src/debug/strace/6.8/tests/sigprocmask.c /usr/src/debug/strace/6.8/src/xlat/splice_flags.h /usr/src/debug/strace/6.8/src/xlat/whence_codes.h /usr/src/debug/strace/6.8/src/xlat/rename_flags.h /usr/src/debug/strace/6.8/src/xlat/btrfs_send_flags.h /usr/src/debug/strace/6.8/src/xlat/sigfpe_codes.h /usr/src/debug/strace/6.8/src/xlat/gpio_v2_line_flags.h /usr/src/debug/strace/6.8/src/xlat/pr_spec_get_store_bypass_flags.h /usr/src/debug/strace/6.8/src/xlat/pr_spec_set_store_bypass_flags.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/videodev2.h /usr/src/debug/strace/6.8/src/pr
 int_timespec.h /usr/src/debug/strace/6.8/src/xlat/bpf_attach_flags.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/fib_rules.h /usr/src/debug/strace/6.8/src/xlat/name_to_handle_at_flags.h /usr/src/debug/strace/6.8/tests/fchown32.c /usr/src/debug/strace/6.8/tests/fchownat.c /usr/src/debug/strace/6.8/src/kernel_v4l2_types.h /usr/src/debug/strace/6.8/tests/fchmodat.c /usr/src/debug/strace/6.8/src/xlat/ifstats_attrs.h /usr/src/debug/strace/6.8/tests/pidfd_open.c /usr/src/debug/strace/6.8/src/xlat/pr_tagged_addr_mte_tcf.h /usr/src/debug/strace/6.8/src/xlat/ptp_extts_flags.h /usr/src/debug/strace/6.8/src/trace_event.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/landlock.h /usr/src/debug/strace/6.8/tests/ioctl_termios.c /usr/src/debug/strace/6.8/tests/faccessat2.c /usr/src/debug/strace/6.8/tests/s390_sthyi.c /usr/src/debug/strace/6.8/src/xlat/term_oflags_ffdly.h /usr/src/debug/strace/6.8/src/xlat/nf_acct_msg_types.h /usr/src/debug/strace/6.8/tests/io_uring_enter
 .c /usr/src/debug/strace/6.8/tests/strace--syscall-limit.c /usr/src/debug/strace/6.8/tests/fcntl64.c /usr/src/debug/strace/6.8/tests/clone_parent.c /usr/src/debug/strace/6.8/src/xlat/rtnl_tc_action_attrs.h /usr/src/debug/strace/6.8/src/getcpu.c /usr/src/debug/strace/6.8/src/uname.c /usr/src/debug/strace/6.8/tests/fchmod--secontext.c /usr/src/debug/strace/6.8/tests/mbind.c /usr/src/debug/strace/6.8/tests/migrate_pages.c /usr/src/debug/strace/6.8/src/execve.c /usr/src/debug/strace/6.8/tests/init_module.c /usr/src/debug/strace/6.8/tests/timer_create.c /usr/src/debug/strace/6.8/tests/prctl-mce-kill.c /usr/src/debug/strace/6.8/tests/lsm_get_self_attr.c /usr/src/debug/strace/6.8/tests/lsm_set_self_attr.c /usr/src/debug/strace/6.8/src/xlat/rtnl_ip6mra_msg_types.h /usr/src/debug/strace/6.8/src/xlat/nf_ctnetlink_msg_types.h /usr/src/debug/strace/6.8/tests/userfaultfd.c /usr/src/debug/strace/6.8/src/xlat/fcntlcmds.h /usr/src/debug/strace/6.8/src/xlat/flockcmds.h /usr/src/debug/strace/6.8/src/
 xlat/lockfcmds.h /usr/src/debug/strace/6.8/src/xlat/quotacmds.h /usr/src/debug/strace/6.8/src/xlat/evdev_relative_axes.h /usr/src/debug/strace/6.8/src/xlat/kd_key_fn_key_vals.h /usr/src/debug/strace/6.8/tests/eventfd.c /usr/src/debug/strace/6.8/src/xlat/btrfs_balance_state.h /usr/src/debug/strace/6.8/src/xlat/ip_cmsg_types.h /usr/src/debug/strace/6.8/src/xlat/ipc_msg_flags.h /usr/src/debug/strace/6.8/tests/unlinkat.c /usr/src/debug/strace/6.8/src/xlat/ptrace_syscall_info_op.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/in6.h /usr/src/debug/strace/6.8/src/lirc_ioctl.c /usr/src/debug/strace/6.8/src/xlat/v4l2_buf_flags_ts_src.h /usr/src/debug/strace/6.8/src/pathtrace.c /usr/src/debug/strace/6.8/tests/truncate64.c /usr/src/debug/strace/6.8/tests/move_mount.c /usr/src/debug/strace/6.8/tests/printpath-umovestr-undumpable.c /usr/src/debug/strace/6.8/src/xlat/inet_diag_attrs.h /usr/src/debug/strace/6.8/src/xlat/unix_diag_attrs.h /usr/src/debug/strace/6.8/tests/nsyscalls.c /us
 r/src/debug/strace/6.8/src/xlat/rtnl_ifla_info_attrs.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/if_alg.h /usr/src/debug/strace/6.8/tests/netlink_netfilter.c /usr/src/debug/strace/6.8/src/xlat/af_packet_types.h /usr/src/debug/strace/6.8/src/xlat/counter_ioctl_scopes.h /usr/src/debug/strace/6.8/tests/uio.c /usr/src/debug/strace/6.8/src/xlat/landlock_ruleset_access_net.h /usr/src/debug/strace/6.8/tests/ipc.c /usr/src/debug/strace/6.8/src/ptrace_syscall_info.c /usr/src/debug/strace/6.8/src/watchdog_ioctl.c /usr/src/debug/strace/6.8/src/ptrace_syscall_info.h /usr/src/debug/strace/6.8/src/xlat/bootflags1.h /usr/src/debug/strace/6.8/tests/truncate.c /usr/src/debug/strace/6.8/tests/lsm_list_modules.c /usr/src/debug/strace/6.8/src/xlat/fsmagic.h /usr/src/debug/strace/6.8/src/xlat/ieee802154_addrs.h /usr/src/debug/strace/6.8/src/xlat/term_oflags.h /usr/src/debug/strace/6.8/tests/attach-f-p.c /usr/src/debug/strace/6.8/tests/vhangup.c /usr/src/debug/strace/6.8/tests/ioctl_wins
 ize.c /usr/src/debug/strace/6.8/src/xlat/unix_diag_show.h /usr/src/debug/strace/6.8/tests/setugid.c /usr/src/debug/strace/6.8/tests/ioctl_v4l2.c /usr/src/debug/strace/6.8/src/pidfd_open.c /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_af_spec_mctp_attrs.h /usr/src/debug/strace/6.8/src/xlat/move_pages_flags.h /usr/src/debug/strace/6.8/src/negated_errno.h /usr/src/debug/strace/6.8/tests/lseek.c /usr/src/debug/strace/6.8/tests/test_printpath.c /usr/src/debug/strace/6.8/tests/test_ucopy.c /usr/src/debug/strace/6.8/src/xlat/gpio_handle_flags.h /usr/src/debug/strace/6.8/tests/test_ucopy.h /usr/src/debug/strace/6.8/src/xlat/open_access_modes.h /usr/src/debug/strace/6.8/src/xlat/fan_classes.h /usr/src/debug/strace/6.8/tests/ioctl_ptp.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/cryptouser.h /usr/src/debug/strace/6.8/src/xlat/v4l2_memories.h /usr/src/debug/strace/6.8/tests/process_madvise.c /usr/src/debug/strace/6.8/tests/fsync.c /usr/src/debug/strace/6.8/src/xlat/fib_rule_flag
 s.h /usr/src/debug/strace/6.8/src/xlat/v4l2_sdr_fmts.h /usr/src/debug/strace/6.8/tests/prctl-fp-mode.c /usr/src/debug/strace/6.8/src/xlat/v4l2_pix_fmts.h /usr/src/debug/strace/6.8/src/xlat/aio_cmds.h /usr/src/debug/strace/6.8/src/xlat/fsmount_attr_flags.h /usr/src/debug/strace/6.8/tests/inotify_init.c /usr/src/debug/strace/6.8/src/xlat/kcmp_types.h /usr/src/debug/strace/6.8/src/xlat/quotatypes.h /usr/src/debug/strace/6.8/src/perf_ioctl.c /usr/src/debug/strace/6.8/src/xlat/clocknames.h /usr/src/debug/strace/6.8/src/xlat/packet_diag_info_flags.h /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_af_spec_inet6_attrs.h /usr/src/debug/strace/6.8/tests/fchmod-y--secontext.c /usr/src/debug/strace/6.8/tests/fchmodat--secontext.c /usr/src/debug/strace/6.8/src/xlat/btrfs_logical_ino_args_flags.h /usr/src/debug/strace/6.8/tests/fchownat--secontext.c /usr/src/debug/strace/6.8/src/fstatfs64.c /usr/src/debug/strace/6.8/src/iovec.h /usr/src/debug/strace/6.8/tests/copy_file_range.c /usr/src/debug/strace/
 6.8/src/xlat/fdflags.h /usr/src/debug/strace/6.8/src/bpf_seccomp_filter.c /usr/src/debug/strace/6.8/src/syslog.c /usr/src/debug/strace/6.8/src/xlat/fiemap_extent_flags.h /usr/src/debug/strace/6.8/src/xlat/inet_diag_req_attrs.h /usr/src/debug/strace/6.8/src/rt_sigreturn.c /usr/src/debug/strace/6.8/src/xlat/nfc_saps.h /usr/src/debug/strace/6.8/tests/ptrace_syscall_info.c /usr/src/debug/strace/6.8/src/xlat/sock_ipv6_options.h /usr/src/debug/strace/6.8/tests/erestartsys.c /usr/src/debug/strace/6.8/tests/fanotify_init.c /usr/src/debug/strace/6.8/src/xlat/bdaddr_types.h /usr/src/debug/strace/6.8/src/xlat/itimer_which.h /usr/src/debug/strace/6.8/src/xlat/nf_ulog_msg_types.h /usr/src/debug/strace/6.8/tests/status-detached-threads.c /usr/src/debug/strace/6.8/src/ustat.c /usr/src/debug/strace/6.8/tests/prctl-sched-core.c /usr/src/debug/strace/6.8/src/fsmount.c /usr/src/debug/strace/6.8/tests/mount.c /usr/src/debug/strace/6.8/src/xlat/perf_branch_sample_type.h /usr/src/debug/strace/6.8/src/xla
 t/lirc_modes.h /usr/src/debug/strace/6.8/src/xlat/mpol_modes.h /usr/src/debug/strace/6.8/src/xlat/btrfs_dev_replace_results.h /usr/src/debug/strace/6.8/src/xlat/perf_event_open_flags.h /usr/src/debug/strace/6.8/src/msghdr.c /usr/src/debug/strace/6.8/src/msghdr.h /usr/src/debug/strace/6.8/tests/ioctl_perf.c /usr/src/debug/strace/6.8/src/aio.c /usr/src/debug/strace/6.8/tests/ioctl_perf-success.c /usr/src/debug/strace/6.8/src/xlat/btrfs_fs_info_flags.h /usr/src/debug/strace/6.8/src/xlat/ptrace_setoptions_flags.h /usr/src/debug/strace/6.8/src/xlat/alg_sockaddr_flags.h /usr/src/debug/strace/6.8/src/xlat/xdp_sockaddr_flags.h /usr/src/debug/strace/6.8/src/xlat/bluetooth_l2_psm.h /usr/src/debug/strace/6.8/tests/print_user_desc.c /usr/src/debug/strace/6.8/tests/signal.c /usr/src/debug/strace/6.8/src/xlat/gpio_v2_line_attr_ids.h /usr/src/debug/strace/6.8/tests/lookup_dcookie.c /usr/src/debug/strace/6.8/tests/fadvise.h /usr/src/debug/strace/6.8/tests/bpf.c /usr/src/debug/strace/6.8/src/xlat/pr
 _mdwe_flags.h /usr/src/debug/strace/6.8/src/hdio.c /usr/src/debug/strace/6.8/tests/create_nl_socket.c /usr/src/debug/strace/6.8/src/ubi.c /usr/src/debug/strace/6.8/src/xlat/counter_ioctl_component_types.h /usr/src/debug/strace/6.8/src/xlat/sigsegv_codes.h /usr/src/debug/strace/6.8/src/xlat/nf_nft_compat_msg_types.h /usr/src/debug/strace/6.8/src/netlink.h /usr/src/debug/strace/6.8/src/netlink.c /usr/src/debug/strace/6.8/src/xgetdents.h /usr/src/debug/strace/6.8/src/xgetdents.c /usr/src/debug/strace/6.8/tests/times-fail.c /usr/src/debug/strace/6.8/tests/ioctl_inotify.c /usr/src/debug/strace/6.8/src/xlat/ptp_perout_flags.h /usr/src/debug/strace/6.8/src/xlat/sock_udp_options.h /usr/src/debug/strace/6.8/tests/nlattr_ifla_af_inet6.h /usr/src/debug/strace/6.8/tests/dup3.c /usr/src/debug/strace/6.8/src/xlat/neighbor_cache_entry_ext_flags.h /usr/src/debug/strace/6.8/tests/utimensat.c /usr/src/debug/strace/6.8/src/xlat/fsopen_flags.h /usr/src/debug/strace/6.8/src/xlat/nl_crypto_types.h /usr/s
 rc/debug/strace/6.8/src/xlat/pr_cap_ambient.h /usr/src/debug/strace/6.8/src/tee.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/nexthop.h /usr/src/debug/strace/6.8/src/xlat/nf_nftables_msg_types.h /usr/src/debug/strace/6.8/src/xlat/v4l2_capture_modes.h /usr/src/debug/strace/6.8/tests/fork--pidns-translation.c /usr/src/debug/strace/6.8/tests/clock_adjtime64.c /usr/src/debug/strace/6.8/src/xlat/futexbitset.h /usr/src/debug/strace/6.8/tests/printstrn-umoven.c /usr/src/debug/strace/6.8/src/xlat/v4l2_control_types.h /usr/src/debug/strace/6.8/tests/clock_t_str.c /usr/src/debug/strace/6.8/tests/create_tmpfile.c /usr/src/debug/strace/6.8/tests/nlattr_mdba_mdb_entry.c /usr/src/debug/strace/6.8/src/xlat/prctl_options.h /usr/src/debug/strace/6.8/src/xlat/wait4_options.h /usr/src/debug/strace/6.8/src/xlat/term_oflags_bsdly.h /usr/src/debug/strace/6.8/src/xlat/sock_tipc_options.h /usr/src/debug/strace/6.8/src/xlat/bpf_size.h /usr/src/debug/strace/6.8/src/xlat/nl_netfilter_subsys_ids
 .h /usr/src/debug/strace/6.8/tests/printpath-umovestr-peekdata.c /usr/src/debug/strace/6.8/src/xlat/v4l2_colorspaces.h /usr/src/debug/strace/6.8/src/xlat/mctp_nets.h /usr/src/debug/strace/6.8/tests/detach-vfork.c /usr/src/debug/strace/6.8/tests/stack-fcall-1.c /usr/src/debug/strace/6.8/src/xlat/v4l2_vbi_flags.h /usr/src/debug/strace/6.8/tests/clock_xettime64.c /usr/src/debug/strace/6.8/tests/status.c /usr/src/debug/strace/6.8/tests/nlattr_rtgenmsg.c /usr/src/debug/strace/6.8/src/xlat/evdev_abs.h /usr/src/debug/strace/6.8/tests/rt_sigsuspend.c /usr/src/debug/strace/6.8/src/xlat/rtnl_tca_stats_attrs.h /usr/src/debug/strace/6.8/src/print_mac.c /usr/src/debug/strace/6.8/src/printmode.c /usr/src/debug/strace/6.8/src/xlat/kd_keymap_flags.h /usr/src/debug/strace/6.8/tests/inotify.c /usr/src/debug/strace/6.8/src/xlat/module_init_flags.h /usr/src/debug/strace/6.8/tests/nlattr_ifinfomsg.c /usr/src/debug/strace/6.8/src/xlat/perf_ioctl_flags.h /usr/src/debug/strace/6.8/src/chmod.c /usr/src/debu
 g/strace/6.8/src/xlat/hw_breakpoint_len.h /usr/src/debug/strace/6.8/tests/nfnetlink_ctnetlink_exp.c /usr/src/debug/strace/6.8/src/xlat/bsg_subprotocol.h /usr/src/debug/strace/6.8/tests/stack-fcall-3.c /usr/src/debug/strace/6.8/tests/tgkill.c /usr/src/debug/strace/6.8/src/xlat/xfs_quota_flags.h /usr/src/debug/strace/6.8/tests/mknodat.c /usr/src/debug/strace/6.8/tests/nlattr_dcbmsg.c /usr/src/debug/strace/6.8/src/xlat/getsock_options.h /usr/src/debug/strace/6.8/src/xlat/lsm_attrs.h /usr/src/debug/strace/6.8/src/xlat/setsock_options.h /usr/src/debug/strace/6.8/src/oldstat.c /usr/src/debug/strace/6.8/src/xlat/fan_init_flags.h /usr/src/debug/strace/6.8/tests/riscv_flush_icache.c /usr/src/debug/strace/6.8/tests/getegid32.c /usr/src/debug/strace/6.8/tests/geteuid32.c /usr/src/debug/strace/6.8/tests/msg_name.c /usr/src/debug/strace/6.8/src/xlat/f_owner_types.h /usr/src/debug/strace/6.8/src/kernel_timex.h /usr/src/debug/strace/6.8/tests/ioctl_sock.c /usr/src/debug/strace/6.8/src/xlat/ebpf_mo
 de.h /usr/src/debug/strace/6.8/src/mount_setattr.c /usr/src/debug/strace/6.8/src/xlat/pr_spec_cmds.h /usr/src/debug/strace/6.8/src/xlat/kvm_cap.h /usr/src/debug/strace/6.8/tests/fcntl-common.c /usr/src/debug/strace/6.8/src/xlat/landlock_create_ruleset_flags.h /usr/src/debug/strace/6.8/tests/ioctl_evdev.c /usr/src/debug/strace/6.8/src/xlat/packet_diag_attrs.h /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_bridge_flags.h /usr/src/debug/strace/6.8/src/rtnl_cachereport.c /usr/src/debug/strace/6.8/src/kd_mpers_ioctl.c /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_bridge_modes.h /usr/src/debug/strace/6.8/tests/link.c /usr/src/debug/strace/6.8/tests/check_sigblock.c /usr/src/debug/strace/6.8/src/sockaddr.c /usr/src/debug/strace/6.8/tests/net-yy-unix.c /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_br_boolopts.h /usr/src/debug/strace/6.8/tests/kexec_load.c /usr/src/debug/strace/6.8/src/xlat/futexops.h /usr/src/debug/strace/6.8/src/xlat/epollctls.h /usr/src/debug/strace/6.8/src/xlat/sigaltstack_f
 lags.h /usr/src/debug/strace/6.8/src/xlat/ptrace_peeksiginfo_flags.h /usr/src/debug/strace/6.8/src/print_msgbuf.c /usr/src/debug/strace/6.8/src/xlat/v4l2_frameinterval_types.h /usr/src/debug/strace/6.8/src/shutdown.c /usr/src/debug/strace/6.8/tests/execve.c /usr/src/debug/strace/6.8/tests/getcwd.c /usr/src/debug/strace/6.8/src/xlat/falloc_flags.h /usr/src/debug/strace/6.8/src/xlat/fs_ioc_flags.h /usr/src/debug/strace/6.8/tests/stack-fcall.c /usr/src/debug/strace/6.8/src/xlat/rtnl_mdba_router_pattr_attrs.h /usr/src/debug/strace/6.8/tests/prctl-tagged-addr.c /usr/src/debug/strace/6.8/tests/so_peercred.c /usr/src/debug/strace/6.8/tests/stack-fcall.h /usr/src/debug/strace/6.8/tests/ioctl_scsi.c /usr/src/debug/strace/6.8/tests/nlattr_netconfmsg.c /usr/src/debug/strace/6.8/src/xlat/sock_ax25_options.h /usr/src/debug/strace/6.8/tests/ioctl_mtd.c /usr/src/debug/strace/6.8/tests/ioctl_nbd.c /usr/src/debug/strace/6.8/tests/getgroups32.c /usr/src/debug/strace/6.8/src/list.h /usr/src/debug/stra
 ce/6.8/src/xlat/v4l2_input_status_flags.h /usr/src/debug/strace/6.8/tests/clock_adjtime-common.c /usr/src/debug/strace/6.8/tests/printstrn-umoven-peekdata.c /usr/src/debug/strace/6.8/tests/poll.c /usr/src/debug/strace/6.8/src/ioperm.c /usr/src/debug/strace/6.8/src/kernel_dirent.h /usr/src/debug/strace/6.8/src/xlat/rtnl_family.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/fs.h /usr/src/debug/strace/6.8/src/xlat/bpf_op_jmp.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/gen_stats.h /usr/src/debug/strace/6.8/src/mpers_type.h /usr/src/debug/strace/6.8/src/bpf_attr.h /usr/src/debug/strace/6.8/src/xlat/hdio_ide_nice.h /usr/src/debug/strace/6.8/tests/fchdir.c /usr/src/debug/strace/6.8/tests/print_quoted_string.c /usr/src/debug/strace/6.8/tests/status-successful.c /usr/src/debug/strace/6.8/src/xlat/fsconfig_cmds.h /usr/src/debug/strace/6.8/src/v4l2.c /usr/src/debug/strace/6.8/src/xlat/nlmsgerr_attrs.h /usr/src/debug/strace/6.8/tests/timer_xettime.c /usr/src/debug
 /strace/6.8/src/xlat/tls_info_ciphers.h /usr/src/debug/strace/6.8/src/xlat/term_cflags_csize.h /usr/src/debug/strace/6.8/tests/oldstat.c /usr/src/debug/strace/6.8/tests/ioctl_gpio.c /usr/src/debug/strace/6.8/tests/ioctl_hdio.c /usr/src/debug/strace/6.8/tests/xutimes.c /usr/src/debug/strace/6.8/tests/xet_robust_list.c /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_vf_port_attrs.h /usr/src/debug/strace/6.8/tests/maybe_switch_current_tcp.c /usr/src/debug/strace/6.8/tests/pread64-pwrite64.c /usr/src/debug/strace/6.8/tests/preadv2-pwritev2.c /usr/src/debug/strace/6.8/src/util.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/dm-ioctl.h /usr/src/debug/strace/6.8/tests/nfnetlink_acct.c /usr/src/debug/strace/6.8/src/xlat/memfd_secret_flags.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/bsg.h /usr/src/debug/strace/6.8/tests/siginfo.c /usr/src/debug/strace/6.8/src/xlat/pr_pac_enabled_keys.h /usr/src/debug/strace/6.8/src/xlat/seccomp_ioctl_notif_flags.h /usr/src/debug/st
 race/6.8/src/xlat/neighbor_cache_entry_flags.h /usr/src/debug/strace/6.8/tests/nlattr_tcamsg.c /usr/src/debug/strace/6.8/src/fetch_struct_stat64.c /usr/src/debug/strace/6.8/src/evdev_mpers.c /usr/src/debug/strace/6.8/src/xlat/bpf_file_flags.h /usr/src/debug/strace/6.8/src/xlat/sock_pppol2tp_options.h /usr/src/debug/strace/6.8/src/inotify_ioctl.c /usr/src/debug/strace/6.8/src/xlat/sock_rxrpc_options.h /usr/src/debug/strace/6.8/src/xlat/netlink_socket_flags.h /usr/src/debug/strace/6.8/src/filter_seccomp.h /usr/src/debug/strace/6.8/tests/pkey_free.c /usr/src/debug/strace/6.8/tests/setgroups.c /usr/src/debug/strace/6.8/src/xlat/btrfs_qgroup_status_flags.h /usr/src/debug/strace/6.8/tests/mincore.c /usr/src/debug/strace/6.8/src/filter_seccomp.c /usr/src/debug/strace/6.8/tests/umovestr.c /usr/src/debug/strace/6.8/src/print_syscall_number.c /usr/src/debug/strace/6.8/src/xlat/loop_crypt_type_options.h /usr/src/debug/strace/6.8/tests/time.c /usr/src/debug/strace/6.8/src/resource.c /usr/src/de
 bug/strace/6.8/src/xlat/socketcalls.h /usr/src/debug/strace/6.8/tests/nlattr_ifaddrlblmsg.c /usr/src/debug/strace/6.8/tests/nlattr_mdba_router_port.c /usr/src/debug/strace/6.8/src/fspick.c /usr/src/debug/strace/6.8/tests/semop.c /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_xdp_attached_mode.h /usr/src/debug/strace/6.8/tests/tests.h /usr/src/debug/strace/6.8/src/xlat/rtnl_rule_attrs.h /usr/src/debug/strace/6.8/tests/old_mmap.c /usr/src/debug/strace/6.8/tests/oldfstat.c /usr/src/debug/strace/6.8/tests/oldlstat.c /usr/src/debug/strace/6.8/src/string_to_uint.c /usr/src/debug/strace/6.8/tests/scm_pidfd.c /usr/src/debug/strace/6.8/src/xlat/rtnl_tca_root_flags.h /usr/src/debug/strace/6.8/src/string_to_uint.h /usr/src/debug/strace/6.8/src/xlat/btrfs_balance_flags.h /usr/src/debug/strace/6.8/tests/brk.c /usr/src/debug/strace/6.8/src/xlat/seccomp_ioctl_addfd_flags.h /usr/src/debug/strace/6.8/src/xlat/futexwakecmps.h /usr/src/debug/strace/6.8/src/xlat/fiemap_flags.h /usr/src/debug/strace/6.8/s
 rc/xlat/mremap_flags.h /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_vf_info_attrs.h /usr/src/debug/strace/6.8/src/xlat/v4l2_tuner_rxsubchanses.h /usr/src/debug/strace/6.8/tests/orphaned_process_group.c /usr/src/debug/strace/6.8/tests/block_reset_raise_run.c /usr/src/debug/strace/6.8/src/xlat/kd_key_brl_keys.h /usr/src/debug/strace/6.8/src/xlat/kd_key_cur_keys.h /usr/src/debug/strace/6.8/src/xlat/kd_key_pad_keys.h /usr/src/debug/strace/6.8/tests/tee.c /usr/src/debug/strace/6.8/src/netlink_netlink_diag.c /usr/src/debug/strace/6.8/tests/rt_sigtimedwait.c /usr/src/debug/strace/6.8/src/xlat/mctl_sync.h /usr/src/debug/strace/6.8/tests/tail_alloc.c /usr/src/debug/strace/6.8/src/xlat/pr_unalign_flags.h /usr/src/debug/strace/6.8/tests/getcpu.c /usr/src/debug/strace/6.8/tests/strace--decode-pids-comm.c /usr/src/debug/strace/6.8/src/syscall.c /usr/src/debug/strace/6.8/tests/net-packet_mreq.c /usr/src/debug/strace/6.8/src/kd_ioctl.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/key
 ctl.h /usr/src/debug/strace/6.8/src/syscall.h /usr/src/debug/strace/6.8/src/xlat/inet_diag_ulp_info_mptcp_attrs.h /usr/src/debug/strace/6.8/src/xlat/v4l2_control_flags.h /usr/src/debug/strace/6.8/tests/faccessat-y--secontext.c /usr/src/debug/strace/6.8/src/xlat/rtnl_route_attrs.h /usr/src/debug/strace/6.8/src/utime.c /usr/src/debug/strace/6.8/tests/qual_signal.c /usr/src/debug/strace/6.8/src/rtnl_tc.c /usr/src/debug/strace/6.8/src/keyctl_kdf_params.h /usr/src/debug/strace/6.8/src/random_ioctl.c /usr/src/debug/strace/6.8/src/xlat/evdev_keycode.h /usr/src/debug/strace/6.8/tests/nfnetlink_nft_compat.c /usr/src/debug/strace/6.8/tests/xselect.c /usr/src/debug/strace/6.8/tests/hexdump_strdup.c /usr/src/debug/strace/6.8/src/xlat/v4l2_std_ids.h /usr/src/debug/strace/6.8/tests/io_uring_setup.c /usr/src/debug/strace/6.8/src/rtnl_addr.c /usr/src/debug/strace/6.8/src/rtnl_link.c /usr/src/debug/strace/6.8/src/rtnl_nsid.c /usr/src/debug/strace/6.8/src/rtnl_rule.c /usr/src/debug/strace/6.8/tests/p
 rintsignal.c /usr/src/debug/strace/6.8/tests/nlattr_br_port_msg.c /usr/src/debug/strace/6.8/src/xlat/bpf_class.h /usr/src/debug/strace/6.8/tests/mmsg_name.c /usr/src/debug/strace/6.8/tests/ioprio.c /usr/src/debug/strace/6.8/tests/qual_inject-retval.c /usr/src/debug/strace/6.8/tests/qual_inject-signal.c /usr/src/debug/strace/6.8/src/xlat/fdb_notify_flags.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/mqueue.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/mroute.h /usr/src/debug/strace/6.8/tests/nlattr_tc_stats.c /usr/src/debug/strace/6.8/tests/kernel_old_timex.h /usr/src/debug/strace/6.8/src/lseek.c /usr/src/debug/strace/6.8/src/xlat/perf_type_id.h /usr/src/debug/strace/6.8/src/xlat/uring_op_flags.h /usr/src/debug/strace/6.8/src/xlat/pr_sud_cmds.h /usr/src/debug/strace/6.8/tests/seccomp-strict.c /usr/src/debug/strace/6.8/tests/ip_local_port_range.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/neighbour.h /usr/src/debug/strace/6.8/src/futex2.c 
 /usr/src/debug/strace/6.8/src/xlat/netlink_delete_flags.h /usr/src/debug/strace/6.8/tests/readdir.c /usr/src/debug/strace/6.8/src/print_dev_t.c /usr/src/debug/strace/6.8/tests/recvmsg.c /usr/src/debug/strace/6.8/src/statfs64.c /usr/src/debug/strace/6.8/tests/unblock_reset_raise.c /usr/src/debug/strace/6.8/src/io_uring.c /usr/src/debug/strace/6.8/src/xlat/v4l2_streaming_capabilities.h /usr/src/debug/strace/6.8/src/xlat/sock_alg_options.h /usr/src/debug/strace/6.8/src/xlat/vsock_cids.h /usr/src/debug/strace/6.8/src/block.c /usr/src/debug/strace/6.8/src/flock.c /usr/src/debug/strace/6.8/src/xlat/timerfdflags.h /usr/src/debug/strace/6.8/src/xlat/uring_setup_features.h /usr/src/debug/strace/6.8/tests/oldselect-efault.c /usr/src/debug/strace/6.8/src/print_mq_attr.c /usr/src/debug/strace/6.8/src/ipc_msgctl.c /usr/src/debug/strace/6.8/src/ipc_semctl.c /usr/src/debug/strace/6.8/src/ipc_shmctl.c /usr/src/debug/strace/6.8/src/xlat/hdio_drive_cmds.h /usr/src/debug/strace/6.8/src/xlat/open_resol
 ve_flags.h /usr/src/debug/strace/6.8/src/xlat/rtnl_addrlabel_attrs.h /usr/src/debug/strace/6.8/tests/msg_control.c /usr/src/debug/strace/6.8/src/xlat/btrfs_scrub_flags.h /usr/src/debug/strace/6.8/src/xlat/uring_setup_flags.h /usr/src/debug/strace/6.8/tests/epoll_ctl.c /usr/src/debug/strace/6.8/src/xlat/inet_devconf_indices.h /usr/src/debug/strace/6.8/src/xlat/uffd_register_ioctl_flags.h /usr/src/debug/strace/6.8/src/xlat/kd_modes.h /usr/src/debug/strace/6.8/tests/waitpid.c /usr/src/debug/strace/6.8/src/xlat/bt_protocols.h /usr/src/debug/strace/6.8/tests/sock_filter-v.c /usr/src/debug/strace/6.8/src/signalfd.c /usr/src/debug/strace/6.8/src/xlat/rtnl_link_attrs.h /usr/src/debug/strace/6.8/tests/netlink_netlink_diag.c /usr/src/debug/strace/6.8/src/xlat/sigchld_codes.h /usr/src/debug/strace/6.8/src/kexec.c /usr/src/debug/strace/6.8/src/ipc_sem.c /usr/src/debug/strace/6.8/tests/dev-pty-yy.c /usr/src/debug/strace/6.8/src/cachestat.h /usr/src/debug/strace/6.8/src/fs_x_ioctl.c /usr/src/debu
 g/strace/6.8/src/xlat/mpol_mode_flags.h /usr/src/debug/strace/6.8/src/xlat/open_mode_flags.h /usr/src/debug/strace/6.8/src/print_fields.h /usr/src/debug/strace/6.8/src/cachestat.c /usr/src/debug/strace/6.8/tests/chown32.c /usr/src/debug/strace/6.8/src/xlat/rtc_params.h /usr/src/debug/strace/6.8/src/xlat/perf_sw_ids.h /usr/src/debug/strace/6.8/src/xlat/access_modes.h /usr/src/debug/strace/6.8/src/xlat/bpf_mode.h /usr/src/debug/strace/6.8/src/xlat/sigbus_codes.h /usr/src/debug/strace/6.8/src/xlat/sigsys_codes.h /usr/src/debug/strace/6.8/src/xlat/statfs_flags.h /usr/src/debug/strace/6.8/src/access.c /usr/src/debug/strace/6.8/tests/seccomp-filter.c /usr/src/debug/strace/6.8/tests/rt_sigqueueinfo.c /usr/src/debug/strace/6.8/src/xlat/sock_llc_options.h /usr/src/debug/strace/6.8/tests/nfnetlink_nftables.c /usr/src/debug/strace/6.8/src/xlat/ifstats_xstats_bridge_attrs.h /usr/src/debug/strace/6.8/tests/mlock2.c /usr/src/debug/strace/6.8/src/xlat/personality_types.h /usr/src/debug/strace/6.8/
 tests/lchown32.c /usr/src/debug/strace/6.8/tests/netlink_sock_diag.c /usr/src/debug/strace/6.8/src/xlat/seccomp_ioctl_resp_flags.h /usr/src/debug/strace/6.8/tests/umovestr_cached.c /usr/src/debug/strace/6.8/src/landlock.c /usr/src/debug/strace/6.8/src/xlat/socketlayers.h /usr/src/debug/strace/6.8/tests/read-write.c /usr/src/debug/strace/6.8/tests/statmount.c /usr/src/debug/strace/6.8/src/xlat/perf_event_read_format.h /usr/src/debug/strace/6.8/src/xlat/nbd_ioctl_flags.h /usr/src/debug/strace/6.8/src/xlat/rtnl_ip6mra_creport_attr.h /usr/src/debug/strace/6.8/src/xlat/rtnl_nexthop_grp_types.h /usr/src/debug/strace/6.8/tests/sync.c /usr/src/debug/strace/6.8/src/netlink_packet_diag.c /usr/src/debug/strace/6.8/src/open_tree.c /usr/src/debug/strace/6.8/tests/kill.c /usr/src/debug/strace/6.8/tests/openat--secontext.c /usr/src/debug/strace/6.8/src/print_timex.h /usr/src/debug/strace/6.8/src/xstring.h /usr/src/debug/strace/6.8/src/xlat/ifaddrflags.h /usr/src/debug/strace/6.8/tests/set_sigblock
 .c /usr/src/debug/strace/6.8/src/sysinfo.c /usr/src/debug/strace/6.8/src/xlat/ifstats_af_spec_mpls_attrs.h /usr/src/debug/strace/6.8/tests/xgetdents.c /usr/src/debug/strace/6.8/src/xlat/ptrace_cmds.h /usr/src/debug/strace/6.8/src/xlat/v4l2_framesize_types.h /usr/src/debug/strace/6.8/src/xlat/term_lflags.h /usr/src/debug/strace/6.8/tests/openat.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/mptcp_pm.h /usr/src/debug/strace/6.8/src/xlat/sock_can_raw_options.h /usr/src/debug/strace/6.8/tests/ksysent.c /usr/src/debug/strace/6.8/src/xlat/ifstats_attr_flags.h /usr/src/debug/strace/6.8/tests/openat2.c /usr/src/debug/strace/6.8/src/xlat/termios_cc.h /usr/src/debug/strace/6.8/src/xlat/cap_mask0.h /usr/src/debug/strace/6.8/src/xlat/ioprio_class.h /usr/src/debug/strace/6.8/tests/unix-pair-sendto-recvfrom.c /usr/src/debug/strace/6.8/tests/kcmp.c /usr/src/debug/strace/6.8/src/xlat/term_line_discs.h /usr/src/debug/strace/6.8/src/loop.c /usr/src/debug/strace/6.8/src/xlat/if_dqinfo_va
 lid.h /usr/src/debug/strace/6.8/tests/tampering-notes.c /usr/src/debug/strace/6.8/src/xlat/sock_raw_options.h /usr/src/debug/strace/6.8/tests/recvfrom-MSG_TRUNC.c /usr/src/debug/strace/6.8/tests/chroot.c /usr/src/debug/strace/6.8/tests/get_page_size.c /usr/src/debug/strace/6.8/src/xlat/bootflags2.h /usr/src/debug/strace/6.8/src/xlat/skf_ad.h /usr/src/debug/strace/6.8/src/mmap_notify.c /usr/src/debug/strace/6.8/src/xlat/delete_module_flags.h /usr/src/debug/strace/6.8/tests/pselect6-common.c /usr/src/debug/strace/6.8/tests/filter-unavailable.c /usr/src/debug/strace/6.8/src/mmap_notify.h /usr/src/debug/strace/6.8/src/xlat/tun_device_types.h /usr/src/debug/strace/6.8/tests/osf_utimes.c /usr/src/debug/strace/6.8/tests/prctl-arg2-intptr.c /usr/src/debug/strace/6.8/tests/ip_mreq.c /usr/src/debug/strace/6.8/src/xlat/netlink_diag_attrs.h /usr/src/debug/strace/6.8/tests/ipc_msg.c /usr/src/debug/strace/6.8/src/xlat/uffd_copy_flags.h /usr/src/debug/strace/6.8/tests/ipc_sem.c /usr/src/debug/stra
 ce/6.8/tests/ipc_shm.c /usr/src/debug/strace/6.8/tests/threads-execve.c /usr/src/debug/strace/6.8/src/xlat/inotify_init_flags.h /usr/src/debug/strace/6.8/tests/get_process_reaper.c /usr/src/debug/strace/6.8/tests/epoll_pwait.c /usr/src/debug/strace/6.8/src/xlat/bpf_op_alu.h /usr/src/debug/strace/6.8/tests/localtime.c /usr/src/debug/strace/6.8/tests/lock_file.c /usr/src/debug/strace/6.8/tests/setfsgid32.c /usr/src/debug/strace/6.8/src/xlat/term_oflags_tabdly.h /usr/src/debug/strace/6.8/tests/prctl_marker.c /usr/src/debug/strace/6.8/tests/setfsuid32.c /usr/src/debug/strace/6.8/tests/setregid32.c /usr/src/debug/strace/6.8/tests/setreuid32.c /usr/src/debug/strace/6.8/tests/test_nlattr.h /usr/src/debug/strace/6.8/src/fadvise.c /usr/src/debug/strace/6.8/tests/acct.c /usr/src/debug/strace/6.8/tests/rt_sigpending.c /usr/src/debug/strace/6.8/tests/close_range.c /usr/src/debug/strace/6.8/src/xlat/evdev_leds.h /usr/src/debug/strace/6.8/tests/pidfd_getfd.c /usr/src/debug/strace/6.8/tests/open_t
 ree.c /usr/src/debug/strace/6.8/src/error_prints.c /usr/src/debug/strace/6.8/src/sock.c /usr/src/debug/strace/6.8/src/xlat/multicast_router_types.h /usr/src/debug/strace/6.8/src/error_prints.h /usr/src/debug/strace/6.8/src/xlat/nl_audit_types.h /usr/src/debug/strace/6.8/src/xlat/netfilter_versions.h /usr/src/debug/strace/6.8/tests/getresgid32.c /usr/src/debug/strace/6.8/tests/getresuid32.c /usr/src/debug/strace/6.8/src/xlat/rtnl_neightbl_attrs.h /usr/src/debug/strace/6.8/src/sched_attr.h /usr/src/debug/strace/6.8/src/xlat/blkpg_ops.h /usr/src/debug/strace/6.8/src/xlat/uring_ops.h /usr/src/debug/strace/6.8/tests/error_msg.c /usr/src/debug/strace/6.8/src/xlat/bpf_attach_type.h /usr/src/debug/strace/6.8/src/xlat/nf_cttimeout_msg_types.h /usr/src/debug/strace/6.8/tests/memfd_create.c /usr/src/debug/strace/6.8/tests/setdomainname.c /usr/src/debug/strace/6.8/src/kill_save_errno.h /usr/src/debug/strace/6.8/tests/fspick.c /usr/src/debug/strace/6.8/tests/nlattr_ifla_af_spec.c /usr/src/debug/
 strace/6.8/tests/net-sockaddr.c /usr/src/debug/strace/6.8/src/print_timeval.c /usr/src/debug/strace/6.8/tests/getrusage.c /usr/src/debug/strace/6.8/src/renameat.c /usr/src/debug/strace/6.8/tests/umovestr2.c /usr/src/debug/strace/6.8/src/xlat/perf_hw_cache_id.h /usr/src/debug/strace/6.8/src/xlat/pr_sched_core_pidtypes.h /usr/src/debug/strace/6.8/src/xlat/v4l2_device_capabilities_flags.h /usr/src/debug/strace/6.8/tests/run_expect_termsig.c /usr/src/debug/strace/6.8/tests/netlink_selinux.c /usr/src/debug/strace/6.8/tests/looping_threads.c /usr/src/debug/strace/6.8/src/xlat/pr_mce_kill.h /usr/src/debug/strace/6.8/tests/landlock_create_ruleset.c /usr/src/debug/strace/6.8/src/xlat/route_nexthop_flags.h /usr/src/debug/strace/6.8/src/xlat/sock_rds_options.h /usr/src/debug/strace/6.8/tests/nlattr_crypto_user_alg.c /usr/src/debug/strace/6.8/src/sg_io_v4.c /usr/src/debug/strace/6.8/src/swapon.c /usr/src/debug/strace/6.8/src/xlat/keyctl_pkey_ops.h /usr/src/debug/strace/6.8/src/xmalloc.c /usr/sr
 c/debug/strace/6.8/tests/s390_pci_mmio_read_write.c /usr/src/debug/strace/6.8/src/xmalloc.h /usr/src/debug/strace/6.8/src/xlat/sigprof_codes.h /usr/src/debug/strace/6.8/src/chdir.c /usr/src/debug/strace/6.8/tests/set_mempolicy_home_node.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/netlink.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/if_link.h /usr/src/debug/strace/6.8/src/macros.h /usr/src/debug/strace/6.8/tests/readlink.c /usr/src/debug/strace/6.8/tests/recvfrom.c /usr/src/debug/strace/6.8/tests/s390_guarded_storage.c /usr/src/debug/strace/6.8/tests/renameat.c /usr/src/debug/strace/6.8/src/ipc.c /usr/src/debug/strace/6.8/src/rtc.c /usr/src/debug/strace/6.8/tests/ioctl_nsfs.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/in.h /usr/src/debug/strace/6.8/src/exitkill.h /usr/src/debug/strace/6.8/src/native_printer_decls.h /usr/src/debug/strace/6.8/tests/prctl-syscall-user-dispatch.c /usr/src/debug/strace/6.8/tests/group_req.c /usr/src/debug/s
 trace/6.8/src/get_personality.h /usr/src/debug/strace/6.8/src/exitkill.c /usr/src/debug/strace/6.8/tests/mq.c /usr/src/debug/strace/6.8/src/xlat/term_cmds_overlapping.h /usr/src/debug/strace/6.8/src/poke.h /usr/src/debug/strace/6.8/src/xlat/kvm_mem_flags.h /usr/src/debug/strace/6.8/src/poke.c /usr/src/debug/strace/6.8/src/bjm.c /usr/src/debug/strace/6.8/src/kvm.c /usr/src/debug/strace/6.8/src/lsm.c /usr/src/debug/strace/6.8/src/mem.c /usr/src/debug/strace/6.8/src/xlat/at_flags.h /usr/src/debug/strace/6.8/src/xlat/close_range_flags.h /usr/src/debug/strace/6.8/src/xlat/dm_flags.h /usr/src/debug/strace/6.8/src/xlat/pkey_access.h /usr/src/debug/strace/6.8/src/xlat/iffflags.h /usr/src/debug/strace/6.8/src/xlat/sigev_value.h /usr/src/debug/strace/6.8/tests/clock_nanosleep.c /usr/src/debug/strace/6.8/src/xlat/netlink_flags.h /usr/src/debug/strace/6.8/src/xlat/netlink_types.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/perf_event.h /usr/src/debug/strace/6.8/tests/stack-fcall-
 0.c /usr/src/debug/strace/6.8/src/fcntl.c /usr/src/debug/strace/6.8/tests/sysctl.c /usr/src/debug/strace/6.8/src/netlink_netfilter.c /usr/src/debug/strace/6.8/tests/status-none-f.c /usr/src/debug/strace/6.8/src/xlat/landlock_ruleset_access_fs.h /usr/src/debug/strace/6.8/src/process_vm.c /usr/src/debug/strace/6.8/src/xlat/uring_register_rsrc_flags.h /usr/src/debug/strace/6.8/src/rtnl_addrlabel.c /usr/src/debug/strace/6.8/src/xlat/keyctl_caps0.h /usr/src/debug/strace/6.8/src/xlat/keyctl_caps1.h /usr/src/debug/strace/6.8/src/xlat/msgctl_flags.h /usr/src/debug/strace/6.8/src/xlat/rtc_vl_flags.h /usr/src/debug/strace/6.8/tests/listmount.c /usr/src/debug/strace/6.8/src/xlat/semctl_flags.h /usr/src/debug/strace/6.8/src/xlat/shmctl_flags.h /usr/src/debug/strace/6.8/src/xlat/sigill_codes.h /usr/src/debug/strace/6.8/src/getpid.c /usr/src/debug/strace/6.8/tests/umovestr-illptr.c /usr/src/debug/strace/6.8/tests/sigaltstack.c /usr/src/debug/strace/6.8/src/xlat/sock_type_flags.h /usr/src/debug/st
 race/6.8/tests/getpid.c /usr/src/debug/strace/6.8/tests/bpf-obj_get_info_by_fd.c /usr/src/debug/strace/6.8/tests/arch_prctl.c /usr/src/debug/strace/6.8/tests/prctl-tid_address.c /usr/src/debug/strace/6.8/tests/ifindex.c /usr/src/debug/strace/6.8/tests/nlattr_ifaddrmsg.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/blktrace_api.h /usr/src/debug/strace/6.8/src/xlat/rxrpc_services.h /usr/src/debug/strace/6.8/src/memfd_create.c /usr/src/debug/strace/6.8/src/file_handle.c /usr/src/debug/strace/6.8/tests/getsid.c /usr/src/debug/strace/6.8/tests/linkat.c /usr/src/debug/strace/6.8/src/xlat/netlink_ack_flags.h /usr/src/debug/strace/6.8/src/xlat/netlink_get_flags.h /usr/src/debug/strace/6.8/src/xlat/netlink_new_flags.h /usr/src/debug/strace/6.8/tests/nlattr_unix_diag_msg.c /usr/src/debug/strace/6.8/tests/prctl-name.c /usr/src/debug/strace/6.8/tests/print_time.c /usr/src/debug/strace/6.8/tests/printstrn-umoven-undumpable.c /usr/src/debug/strace/6.8/tests/ioperm.c /usr/src/debug/s
 trace/6.8/src/xlat/priorities.h /usr/src/debug/strace/6.8/src/xlat/rtnl_dcb_attrs.h /usr/src/debug/strace/6.8/tests/prctl-set-ptracer-success.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/btrfs.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/blkpg.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/dcbnl.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/futex.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/input.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/mount.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/quota.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/sched.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/types.h /usr/src/debug/strace/6.8/src/copy_file_range.c /usr/src/debug/strace/6.8/tests/libmmsg.c /usr/src/debug/strace/6.8/tests/strace-p1-Y-p.c /usr/src/debug/strace/6.8/src/xlat/ax25_protocols.h /usr/src/debug/strace/6.8/src/netlink_selinux.c /usr/src/deb
 ug/strace/6.8/src/xlat/caif_protocols.h /usr/src/debug/strace/6.8/src/xlat/inet_protocols.h /usr/src/debug/strace/6.8/src/xlat/irda_protocols.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/socket.h /usr/src/debug/strace/6.8/src/xlat/bpf_map_lookup_elem_flags.h /usr/src/debug/strace/6.8/tests/rmdir.c /usr/src/debug/strace/6.8/src/xlat/isdn_protocols.h /usr/src/debug/strace/6.8/tests/open--secontext.c /usr/src/debug/strace/6.8/src/dm.c /usr/src/debug/strace/6.8/src/io.c /usr/src/debug/strace/6.8/src/mq.c /usr/src/debug/strace/6.8/src/xlat/mtd_nandecc_options.h /usr/src/debug/strace/6.8/tests/prctl-seccomp-strict.c /usr/src/debug/strace/6.8/tests/pipe.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/ptp_clock.h /usr/src/debug/strace/6.8/src/xlat/perf_attr_size.h /usr/src/debug/strace/6.8/src/xlat/rtnl_nha_res_group_attrs.h /usr/src/debug/strace/6.8/tests/clone3.c /usr/src/debug/strace/6.8/tests/nlattr_ifla_proto_down_reason.c /usr/src/debug/strace/6.8/tests/st
 atus-none.c /usr/src/debug/strace/6.8/src/xlat/btrfs_dev_stats_values.h /usr/src/debug/strace/6.8/src/xlat/btrfs_defrag_flags.h /usr/src/debug/strace/6.8/src/xlat/arp_hardware_types.h /usr/src/debug/strace/6.8/tests/rt_sigreturn.c /usr/src/debug/strace/6.8/src/sysctl.c /usr/src/debug/strace/6.8/src/term.c /usr/src/debug/strace/6.8/src/ptrace.c /usr/src/debug/strace/6.8/src/strace.c /usr/src/debug/strace/6.8/src/xlat/v4l2_control_classes.h /usr/src/debug/strace/6.8/src/ptrace.h /usr/src/debug/strace/6.8/src/xlat/rtnl_ipmra_msg_types.h /usr/src/debug/strace/6.8/src/xlat/inet_diag_bpf_storage_attrs.h /usr/src/debug/strace/6.8/tests/unshare.c /usr/src/debug/strace/6.8/src/fstatfs.c /usr/src/debug/strace/6.8/src/xlat/fan_event_flags.h /usr/src/debug/strace/6.8/src/xlat/inet_diag_ulp_info_tls_attrs.h /usr/src/debug/strace/6.8/tests/delete_module.c /usr/src/debug/strace/6.8/tests/sockopt-timestamp.c /usr/src/debug/strace/6.8/tests/mmsg-silent.c /usr/src/debug/strace/6.8/src/kernel_timeval.
 h /usr/src/debug/strace/6.8/tests/qual_fault.c /usr/src/debug/strace/6.8/src/xlat/nl_selinux_types.h /usr/src/debug/strace/6.8/src/xlat/rtnl_mdba_router_attrs.h /usr/src/debug/strace/6.8/src/xlat/shadow_stack_flags.h /usr/src/debug/strace/6.8/tests/pwritev.c /usr/src/debug/strace/6.8/src/xlat/vsock_ports.h /usr/src/debug/strace/6.8/src/basic_filters.c /usr/src/debug/strace/6.8/src/xlat/sock_ip_options.h /usr/src/debug/strace/6.8/src/xlat/key_perms.h /usr/src/debug/strace/6.8/tests/sethostname.c /usr/src/debug/strace/6.8/src/xlat/routing_protocols.h /usr/src/debug/strace/6.8/tests/quotactl.h /usr/src/debug/strace/6.8/src/seccomp_ioctl.c /usr/src/debug/strace/6.8/src/sched.c /usr/src/debug/strace/6.8/src/fetch_struct_keyctl_kdf_params.c /usr/src/debug/strace/6.8/src/xlat/ip_type_of_services.h /usr/src/debug/strace/6.8/tests/quotactl.c /usr/src/debug/strace/6.8/tests/tkill.c /usr/src/debug/strace/6.8/tests/ioctl_fs_x.c /usr/src/debug/strace/6.8/src/xlat/v4l2_input_capabilities_flags.h 
 /usr/src/debug/strace/6.8/src/xlat/tee_ioctl_origins.h /usr/src/debug/strace/6.8/tests/netlink_protocol.c /usr/src/debug/strace/6.8/tests/xgetrlimit.c /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_port_attrs.h /usr/src/debug/strace/6.8/src/rtnl_dcb.c /usr/src/debug/strace/6.8/src/xlat/rtc_backup_switch_modes.h /usr/src/debug/strace/6.8/src/xlat/listmount_mnt_id.h /usr/src/debug/strace/6.8/tests/ioctl.c /usr/src/debug/strace/6.8/src/upoke.c /usr/src/debug/strace/6.8/src/xlat/nf_queue_msg_types.h /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_vfinfo_list_attrs.h /usr/src/debug/strace/6.8/tests/block_reset_run.c /usr/src/debug/strace/6.8/src/xlat/bpf_map_flags.h /usr/src/debug/strace/6.8/src/xlat/bpf_map_types.h /usr/src/debug/strace/6.8/src/xlat/sigtrap_codes.h /usr/src/debug/strace/6.8/src/rtnl_mdb.c /usr/src/debug/strace/6.8/tests/symlinkat.c /usr/src/debug/strace/6.8/src/xlat/uring_files_update_fds.h /usr/src/debug/strace/6.8/src/wait.c /usr/src/debug/strace/6.8/src/xlat/if_dqblk_vali
 d.h /usr/src/debug/strace/6.8/src/xlat/getrandom_flags.h /usr/src/debug/strace/6.8/src/xlat/personality_flags.h /usr/src/debug/strace/6.8/src/fetch_struct_stat.c /usr/src/debug/strace/6.8/tests/madvise.c /usr/src/debug/strace/6.8/tests/ppoll.c /usr/src/debug/strace/6.8/tests/ftruncate64.c /usr/src/debug/strace/6.8/src/signal.c /usr/src/debug/strace/6.8/tests/mlock.c /usr/src/debug/strace/6.8/src/xlat/adjtimex_status.h /usr/src/debug/strace/6.8/tests/nfnetlink_cttimeout.c /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_xdp_attrs.h /usr/src/debug/strace/6.8/src/xlat/smc_diag_mode.h /usr/src/debug/strace/6.8/src/xlat/xfs_dqblk_flags.h /usr/src/debug/strace/6.8/tests/modify_ldt.c /usr/src/debug/strace/6.8/tests/prctl-pac-enabled-keys.c /usr/src/debug/strace/6.8/src/xlat/v4l2_format_description_flags.h /usr/src/debug/strace/6.8/src/xlat/nf_hook_msg_types.h /usr/src/debug/strace/6.8/src/xlat/fspick_flags.h /usr/src/debug/strace/6.8/src/xlat/archvals.h /usr/src/debug/strace/6.8/tests/netlink_
 crypto.c /usr/src/debug/strace/6.8/tests/printxval.c /usr/src/debug/strace/6.8/src/fsopen.c /usr/src/debug/strace/6.8/tests/open.c /usr/src/debug/strace/6.8/src/xlat/keyctl_move_flags.h /usr/src/debug/strace/6.8/src/netlink_unix_diag.c /usr/src/debug/strace/6.8/tests/restart_syscall.c /usr/src/debug/strace/6.8/tests/rt_sigprocmask.c /usr/src/debug/strace/6.8/src/xlat/cap.h /usr/src/debug/strace/6.8/src/xlat/btrfs_key_types.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/smc_diag.h /usr/src/debug/strace/6.8/src/xlat/hci_channels.h /usr/src/debug/strace/6.8/tests/aio.c /usr/src/debug/strace/6.8/tests/ipc_msgbuf.c /usr/src/debug/strace/6.8/tests/fstatat64.c /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_vf_link_states.h /usr/src/debug/strace/6.8/src/xlat/evdev_prop.h /usr/src/debug/strace/6.8/tests/fstatfs64.c /usr/src/debug/strace/6.8/src/xlat/pr_set_mm.h /usr/src/debug/strace/6.8/tests/dup2.c /usr/src/debug/strace/6.8/src/xlat/smc_link_group_roles.h /usr/src/debug/strace/6
 .8/src/fetch_struct_mmsghdr.c /usr/src/debug/strace/6.8/tests/file_handle.c /usr/src/debug/strace/6.8/tests/sched_xetattr.c /usr/src/debug/strace/6.8/tests/aio_pgetevents.c /usr/src/debug/strace/6.8/tests/finit_module.c /usr/src/debug/strace/6.8/src/xlat/pr_sme_vl_flags.h /usr/src/debug/strace/6.8/src/xlat/pr_sve_vl_flags.h /usr/src/debug/strace/6.8/tests/landlock_restrict_self.c /usr/src/debug/strace/6.8/src/sys_func.h /usr/src/debug/strace/6.8/tests/linkat--secontext.c /usr/src/debug/strace/6.8/src/xlat/btrfs_features_incompat.h /usr/src/debug/strace/6.8/src/sendfile.c /usr/src/debug/strace/6.8/src/xlat/ifstats_xstats_bond_attrs.h /usr/src/debug/strace/6.8/src/xlat/ifstats_xstats_type_attrs.h /usr/src/debug/strace/6.8/src/evdev.c /usr/src/debug/strace/6.8/tests/scm_credentials.c /usr/src/debug/strace/6.8/src/personality.c /usr/src/debug/strace/6.8/src/getrandom.c /usr/src/debug/strace/6.8/src/xlat/tee_ioctl_impl_ids.h /usr/src/debug/strace/6.8/tests/at_fdcwd-pathmax.c /usr/src/deb
 ug/strace/6.8/src/xlat/tee_ioctl_gen_caps.h /usr/src/debug/strace/6.8/src/xlat/tee_ioctl_login_types.h /usr/src/debug/strace/6.8/tests/ustat.c /usr/src/debug/strace/6.8/tests/mlockall.c /usr/src/debug/strace/6.8/src/print_kernel_version.c /usr/src/debug/strace/6.8/tests/iopl.c /usr/src/debug/strace/6.8/src/xlat/siginfo_codes.h /usr/src/debug/strace/6.8/src/stage_output.c /usr/src/debug/strace/6.8/src/xlat/nl_sock_diag_types.h /usr/src/debug/strace/6.8/tests/nlattr_nlmsgerr.c /usr/src/debug/strace/6.8/src/xlat/bpf_commands.h /usr/src/debug/strace/6.8/src/xlat/dcb_commands.h /usr/src/debug/strace/6.8/tests/status-unfinished-threads.c /usr/src/debug/strace/6.8/src/xlat/faccessat_flags.h /usr/src/debug/strace/6.8/src/capability.c /usr/src/debug/strace/6.8/tests/sigpending.c /usr/src/debug/strace/6.8/tests/execveat--secontext.c /usr/src/debug/strace/6.8/tests/_newselect.c /usr/src/debug/strace/6.8/src/secontext.h /usr/src/debug/strace/6.8/tests/count-f.c /usr/src/debug/strace/6.8/bundled
 /linux/include/uapi/linux/if_addrlabel.h /usr/src/debug/strace/6.8/src/xlat/ieee802154_pan_ids.h /usr/src/debug/strace/6.8/tests/inotify_init1.c /usr/src/debug/strace/6.8/tests/readv.c /usr/src/debug/strace/6.8/src/fanotify.c /usr/src/debug/strace/6.8/tests/inode_of_sockfd.c /usr/src/debug/strace/6.8/tests/prctl-capbset.c /usr/src/debug/strace/6.8/src/xlat/ubi_volume_flags.h /usr/src/debug/strace/6.8/src/xlat/tcp_states.h /usr/src/debug/strace/6.8/src/xlat/mdb_states.h /usr/src/debug/strace/6.8/src/xlat/smc_states.h /usr/src/debug/strace/6.8/src/fetch_struct_flock.c /usr/src/debug/strace/6.8/src/fetch_struct_iovec.c /usr/src/debug/strace/6.8/src/gpio_ioctl.c /usr/src/debug/strace/6.8/tests/ioctl_dm.c /usr/src/debug/strace/6.8/tests/pause.c /usr/src/debug/strace/6.8/tests/overflowuid.c /usr/src/debug/strace/6.8/tests/ioctl_kd.c /usr/src/debug/strace/6.8/src/print_sg_req_info.c /usr/src/debug/strace/6.8/src/xlat/btrfs_features_compat.h /usr/src/debug/strace/6.8/tests/mmsg.c /usr/src/d
 ebug/strace/6.8/tests/shmxt.c /usr/src/debug/strace/6.8/src/poll.c /usr/src/debug/strace/6.8/tests/faccessat--secontext.c /usr/src/debug/strace/6.8/src/xlat/compat_ptrace_cmds.h /usr/src/debug/strace/6.8/tests/umode_t.c /usr/src/debug/strace/6.8/tests/umount2.c /usr/src/debug/strace/6.8/src/statmount.c /usr/src/debug/strace/6.8/src/xlat/uffd_api_features.h /usr/src/debug/strace/6.8/tests/shutdown.c /usr/src/debug/strace/6.8/tests/nfnetlink_osf.c /usr/src/debug/strace/6.8/tests/nlattr_inet_diag_msg.c /usr/src/debug/strace/6.8/src/xlat/bpf_task_fd_type.h /usr/src/debug/strace/6.8/tests/xettimeofday.c /usr/src/debug/strace/6.8/tests/swap.c /usr/src/debug/strace/6.8/tests/fcntl.c /usr/src/debug/strace/6.8/tests/netlink_route.c /usr/src/debug/strace/6.8/tests/ioctl_fs_f.c /usr/src/debug/strace/6.8/src/xlat/ioctl_dirs.h /usr/src/debug/strace/6.8/src/xlat/kexec_file_load_flags.h /usr/src/debug/strace/6.8/src/xlat/smc_decl_codes.h /usr/src/debug/strace/6.8/src/xlat/cap_version.h /usr/src/de
 bug/strace/6.8/src/xlat/msg_flags.h /usr/src/debug/strace/6.8/src/xlat/socktypes.h /usr/src/debug/strace/6.8/src/xlat/modetypes.h /usr/src/debug/strace/6.8/tests/fsconfig.c /usr/src/debug/strace/6.8/tests/access--secontext.c /usr/src/debug/strace/6.8/src/xlat/rtnl_tc_attrs.h /usr/src/debug/strace/6.8/src/xlat/uffd_poison_mode_flags.h /usr/src/debug/strace/6.8/src/xlat/sigpoll_codes.h /usr/src/debug/strace/6.8/src/ipc_msg.c /usr/src/debug/strace/6.8/src/hostname.c /usr/src/debug/strace/6.8/src/xlat/rtnl_nsid_attrs.h /usr/src/debug/strace/6.8/tests/attach-f-p-cmd.c /usr/src/debug/strace/6.8/tests/fanotify_mark--secontext.c /usr/src/debug/strace/6.8/tests/filter_seccomp-flag.c /usr/src/debug/strace/6.8/src/xlat/inet_diag_extended_flags.h /usr/src/debug/strace/6.8/tests/ioctl_sock_gifconf.c /usr/src/debug/strace/6.8/tests/uname.c /usr/src/debug/strace/6.8/src/xlat/kd_key_tables.h /usr/src/debug/strace/6.8/tests/fsmount.c /usr/src/debug/strace/6.8/tests/fstat64.c /usr/src/debug/strace/6.
 8/tests/fsync-y.c /usr/src/debug/strace/6.8/src/truncate.c /usr/src/debug/strace/6.8/tests/tcp_ao.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/io_uring.h /usr/src/debug/strace/6.8/src/xlat/btrfs_csum_types.h /usr/src/debug/strace/6.8/src/xlat/v4l2_tuner_capabilities.h /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_ext_filter_flags.h /usr/src/debug/strace/6.8/src/kernel_timespec.h /usr/src/debug/strace/6.8/src/xlat/sock_tls_options.h /usr/src/debug/strace/6.8/src/sync_file_range.c /usr/src/debug/strace/6.8/tests/so_error.c /usr/src/debug/strace/6.8/src/xlat/uffd_continue_mode_flags.h /usr/src/debug/strace/6.8/tests/ioctl_kvm_run_auxstr_vcpu.c /usr/src/debug/strace/6.8/tests/sockname.c /usr/src/debug/strace/6.8/src/sigevent.h /usr/src/debug/strace/6.8/tests/membarrier.c /usr/src/debug/strace/6.8/tests/umask.c /usr/src/debug/strace/6.8/tests/prctl-spec-inject.c /usr/src/debug/strace/6.8/src/xlat/btrfs_space_info_flags.h /usr/src/debug/strace/6.8/src/xlat/membarrier_cmds.h
  /usr/src/debug/strace/6.8/tests/getgid.c /usr/src/debug/strace/6.8/tests/attach-p-cmd-p.c /usr/src/debug/strace/6.8/src/scsi.c /usr/src/debug/strace/6.8/tests/ioctl_fiemap.c /usr/src/debug/strace/6.8/src/xlat/mtd_otp_options.h /usr/src/debug/strace/6.8/tests/xet_thread_area_x86.c /usr/src/debug/strace/6.8/tests/nlattr_nhmsg.c /usr/src/debug/strace/6.8/src/xlat/ptrace_events.h /usr/src/debug/strace/6.8/src/count.c /usr/src/debug/strace/6.8/src/mount.c /usr/src/debug/strace/6.8/src/xlat/nl_netfilter_msg_types.h /usr/src/debug/strace/6.8/tests/xattr.c /usr/src/debug/strace/6.8/tests/futex_wait.c /usr/src/debug/strace/6.8/tests/net-accept-connect.c /usr/src/debug/strace/6.8/tests/ioctl_watchdog.c /usr/src/debug/strace/6.8/src/xlat/pollflags.h /usr/src/debug/strace/6.8/src/xlat/shm_flags.h /usr/src/debug/strace/6.8/src/xlat/xdp_flags.h /usr/src/debug/strace/6.8/src/xlat/rwf_flags.h /usr/src/debug/strace/6.8/src/xlat/sfd_flags.h /usr/src/debug/strace/6.8/src/xlat/bsg_flags.h /usr/src/deb
 ug/strace/6.8/src/xlat/efd_flags.h /usr/src/debug/strace/6.8/src/xlat/fs_xflags.h /usr/src/debug/strace/6.8/src/xlat/lsm_flags.h /usr/src/debug/strace/6.8/src/xlat/mdb_flags.h /usr/src/debug/strace/6.8/tests/netlink_inet_diag.c /usr/src/debug/strace/6.8/tests/xstatx.c /usr/src/debug/strace/6.8/tests/chmod.c /usr/src/debug/strace/6.8/src/sigreturn.c /usr/src/debug/strace/6.8/src/xlat/bpf_stats_type.h /usr/src/debug/strace/6.8/src/stat.h /usr/src/debug/strace/6.8/src/xlat.h /usr/src/debug/strace/6.8/src/xlat/sock_caif_options.h /usr/src/debug/strace/6.8/src/times.c /usr/src/debug/strace/6.8/src/xlat.c /usr/src/debug/strace/6.8/src/stat.c /usr/src/debug/strace/6.8/src/xlat/rtnl_neightbl_parms_attrs.h /usr/src/debug/strace/6.8/tests/print_maxfd.c /usr/src/debug/strace/6.8/tests/signal2name.c /usr/src/debug/strace/6.8/src/xlat/snmp_icmp6_stats.h /usr/src/debug/strace/6.8/tests/seccomp-filter-v.c /usr/src/debug/strace/6.8/tests/semtimedop-syscall.c /usr/src/debug/strace/6.8/tests/epoll_cr
 eate1.c /usr/src/debug/strace/6.8/tests/getrandom.c /usr/src/debug/strace/6.8/tests/nlattr_tca_stab.c /usr/src/debug/strace/6.8/src/xlat/af_packet_versions.h /usr/src/debug/strace/6.8/tests/delay.c /usr/src/debug/strace/6.8/tests/status-unfinished.c /usr/src/debug/strace/6.8/src/xlat/rtnl_nha_res_bucket_attrs.h /usr/src/debug/strace/6.8/src/xlat/sock_xdp_options.h /usr/src/debug/strace/6.8/src/xlat/bpf_test_run_flags.h /usr/src/debug/strace/6.8/src/xlat/shm_resource_flags.h /usr/src/debug/strace/6.8/src/xlat/key_spec.h /usr/src/debug/strace/6.8/tests/cachestat.c /usr/src/debug/strace/6.8/tests/chdir.c /usr/src/debug/strace/6.8/tests/hexquote_strndup.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/if_bridge.h /usr/src/debug/strace/6.8/src/xlat/ieee802154_addr_types.h /usr/src/debug/strace/6.8/tests/net-yy-inet.c /usr/src/debug/strace/6.8/src/xlat/rtnl_ipmra_creport_attr.h /usr/src/debug/strace/6.8/tests/reboot.c /usr/src/debug/strace/6.8/src/xlat/mtd_type_options.h /usr/
 src/debug/strace/6.8/tests/prctl-no-args.c /usr/src/debug/strace/6.8/src/pidns.c /usr/src/debug/strace/6.8/tests/execve--secontext.c /usr/src/debug/strace/6.8/tests/stack-fcall-2.c /usr/src/debug/strace/6.8/tests/rt_tgsigqueueinfo.c /usr/src/debug/strace/6.8/src/xlat/fchmodat_flags.h /usr/src/debug/strace/6.8/src/xlat/counter_ioctl_event_types.h /usr/src/debug/strace/6.8/src/mmsghdr.c /usr/src/debug/strace/6.8/tests/prctl-mdwe.c /usr/src/debug/strace/6.8/src/xlat/routing_scopes.h /usr/src/debug/strace/6.8/src/xlat/fan_mark_flags.h /usr/src/debug/strace/6.8/src/xlat/uffd_writeprotect_mode_flags.h /usr/src/debug/strace/6.8/tests/getsockname--secontext.c /usr/src/debug/strace/6.8/tests/signal_receive.c /usr/src/debug/strace/6.8/src/syscall_name.c /usr/src/debug/strace/6.8/src/xlat/bsg_protocol.h /usr/src/debug/strace/6.8/src/xlat/addrfams.h /usr/src/debug/strace/6.8/src/netlink_route.h /usr/src/debug/strace/6.8/tests/poke.c /usr/src/debug/strace/6.8/tests/scm_pidfd-success.c /usr/src/d
 ebug/strace/6.8/src/netlink_route.c /usr/src/debug/strace/6.8/src/xlat/btrfs_balance_args.h /usr/src/debug/strace/6.8/src/xlat/quota_formats.h /usr/src/debug/strace/6.8/src/move_mount.c /usr/src/debug/strace/6.8/tests/readlinkat.c /usr/src/debug/strace/6.8/src/xlat/btrfs_dev_stats_flags.h /usr/src/debug/strace/6.8/tests/epoll_create.c /usr/src/debug/strace/6.8/tests/getgroups.c /usr/src/debug/strace/6.8/src/xlat/netlink_diag_show.h /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_info_data_bridge_attrs.h /usr/src/debug/strace/6.8/src/xlat/aio_iocb_flags.h /usr/src/debug/strace/6.8/src/xlat/clockflags.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/gpio.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/kcmp.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/loop.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/mctp.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/mpls.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/qr
 tr.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/seccomp.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/stat.h /usr/src/debug/strace/6.8/src/xlat/epollflags.h /usr/src/debug/strace/6.8/src/printers.h /usr/src/debug/strace/6.8/tests/mount_setattr.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/inet_diag.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/sock_diag.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/unix_diag.h /usr/src/debug/strace/6.8/src/time.c /usr/src/debug/strace/6.8/tests/map_shadow_stack.c /usr/src/debug/strace/6.8/tests/sigsuspend.c /usr/src/debug/strace/6.8/tests/setgroups32.c /usr/src/debug/strace/6.8/tests/dup.c /usr/src/debug/strace/6.8/src/umount.c /usr/src/debug/strace/6.8/tests/nlattr_smc_diag_msg.c /usr/src/debug/strace/6.8/src/mmap_cache.h /usr/src/debug/strace/6.8/tests/nlattr_ifla_port.c /usr/src/debug/strace/6.8/src/mmap_cache.c /usr/src/debug/strace/6.8/src/bind.c /usr/src/debug/strace/6
 .8/tests/set_sigign.c /usr/src/debug/strace/6.8/src/xlat/sock_vsock_options.h /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_br_boolopt_flags.h /usr/src/debug/strace/6.8/src/utimes.c /usr/src/debug/strace/6.8/src/xlat/bpf_map_update_elem_flags.h /usr/src/debug/strace/6.8/src/map_shadow_stack.c /usr/src/debug/strace/6.8/tests/status-failed.c /usr/src/debug/strace/6.8/src/numa.c /usr/src/debug/strace/6.8/tests/sched_xetaffinity.c /usr/src/debug/strace/6.8/src/ioprio.c /usr/src/debug/strace/6.8/src/xlat/resource_flags.h /usr/src/debug/strace/6.8/tests/prctl-dumpable.c /usr/src/debug/strace/6.8/tests/net-yy-netlink.c /usr/src/debug/strace/6.8/tests/stat64.c /usr/src/debug/strace/6.8/src/xlat/futex2_flags.h /usr/src/debug/strace/6.8/src/xlat/futex2_sizes.h /usr/src/debug/strace/6.8/src/fetch_struct_xfs_quotastat.c /usr/src/debug/strace/6.8/tests/set_mempolicy.c /usr/src/debug/strace/6.8/src/seccomp.c /usr/src/debug/strace/6.8/tests/personality.c /usr/src/debug/strace/6.8/src/print_sigevent
 .c /usr/src/debug/strace/6.8/tests/alarm.c /usr/src/debug/strace/6.8/src/listen.c /usr/src/debug/strace/6.8/tests/ioctl_sg_io_v3.c /usr/src/debug/strace/6.8/src/xattr.c /usr/src/debug/strace/6.8/src/xlat/mmap_flags.h /usr/src/debug/strace/6.8/src/xlat/swap_flags.h /usr/src/debug/strace/6.8/src/xlat/uffd_flags.h /usr/src/debug/strace/6.8/src/xlat/xattrflags.h /usr/src/debug/strace/6.8/tests/so_linger.c /usr/src/debug/strace/6.8/src/xlat/neighbor_cache_entry_states.h /usr/src/debug/strace/6.8/src/xlat/mq_attr_flags.h /usr/src/debug/strace/6.8/src/xlat/qipcrtr_nodes.h /usr/src/debug/strace/6.8/src/xlat/qipcrtr_ports.h /usr/src/debug/strace/6.8/src/xlat/icmp_filter_flags.h /usr/src/debug/strace/6.8/tests/errno2name.c /usr/src/debug/strace/6.8/tests/zeroargc.c /usr/src/debug/strace/6.8/tests/set_ptracer_any.c /usr/src/debug/strace/6.8/tests/umovestr_cached_adjacent.c /usr/src/debug/strace/6.8/src/xlat/in6_addr_gen_mode.h /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_vf_vlan_list_attrs.h /
 usr/src/debug/strace/6.8/tests/prctl-pdeathsig.c /usr/src/debug/strace/6.8/src/xlat/btrfs_compress_types.h /usr/src/debug/strace/6.8/tests/xetitimer.c /usr/src/debug/strace/6.8/src/fetch_struct_statfs.c /usr/src/debug/strace/6.8/src/xlat/key_reqkeys.h /usr/src/debug/strace/6.8/src/xlat/tcp_state_flags.h /usr/src/debug/strace/6.8/tests/nfnetlink_ipset.c /usr/src/debug/strace/6.8/tests/nfnetlink_queue.c /usr/src/debug/strace/6.8/src/xlat/v4l2_sliced_flags.h /usr/src/debug/strace/6.8/tests/netlink_generic.c /usr/src/debug/strace/6.8/src/xlat/ebpf_regs.h /usr/src/debug/strace/6.8/src/stat64.c /usr/src/debug/strace/6.8/src/print_group_req.c /usr/src/debug/strace/6.8/src/xlat/rtnl_netconf_attrs.h /usr/src/debug/strace/6.8/src/xlat/rtnl_nexthop_attrs.h /usr/src/debug/strace/6.8/src/xlat/kexec_arch_values.h /usr/src/debug/strace/6.8/tests/print_ppid_tracerpid.c /usr/src/debug/strace/6.8/src/xlat/hw_breakpoint_type.h /usr/src/debug/strace/6.8/tests/ioctl_v4l2-success.c /usr/src/debug/strace/
 6.8/tests/statfs64.c /usr/src/debug/strace/6.8/tests/strace-n.c /usr/src/debug/strace/6.8/tests/strace-x.c /usr/src/debug/strace/6.8/src/fetch_bpf_fprog.c /usr/src/debug/strace/6.8/tests/recvmmsg-timeout.c /usr/src/debug/strace/6.8/src/xlat/numa_node.h /usr/src/debug/strace/6.8/tests/futex_requeue.c /usr/src/debug/strace/6.8/tests/sockopt-sol_socket.c /usr/src/debug/strace/6.8/tests/landlock_add_rule.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/fiemap.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/if_xdp.h /usr/src/debug/strace/6.8/tests/memfd_secret.c /usr/src/debug/strace/6.8/src/xlat/usagewho.h /usr/src/debug/strace/6.8/tests/utime.c /usr/src/debug/strace/6.8/tests/is_linux_mips_n64.c /usr/src/debug/strace/6.8/tests/netlink_kobject_uevent.c /usr/src/debug/strace/6.8/src/xlat/crypto_nl_attrs.h /usr/src/debug/strace/6.8/src/xlat/ubi_data_types.h /usr/src/debug/strace/6.8/src/xlat/move_mount_flags.h /usr/src/debug/strace/6.8/tests/init_delete_module.h /
 usr/src/debug/strace/6.8/tests/prlimit64.c /usr/src/debug/strace/6.8/src/bpf_filter.h /usr/src/debug/strace/6.8/src/xlat/baud_options.h /usr/src/debug/strace/6.8/src/xlat/sock_options.h /usr/src/debug/strace/6.8/src/printrusage.c /usr/src/debug/strace/6.8/src/bpf_filter.c /usr/src/debug/strace/6.8/src/xlat/sock_netlink_options.h /usr/src/debug/strace/6.8/src/xlat/pr_pac_keys.h /usr/src/debug/strace/6.8/src/netlink_crypto.c /usr/src/debug/strace/6.8/src/xlat/can_protocols.h /usr/src/debug/strace/6.8/src/xlat/kcm_protocols.h /usr/src/debug/strace/6.8/src/xlat/nfc_protocols.h /usr/src/debug/strace/6.8/src/xlat/smc_protocols.h /usr/src/debug/strace/6.8/tests/check_sigign.c /usr/src/debug/strace/6.8/tests/kernel_old_timespec.h /usr/src/debug/strace/6.8/tests/setfsugid.c /usr/src/debug/strace/6.8/tests/setreugid.c /usr/src/debug/strace/6.8/tests/sendfile64.c /usr/src/debug/strace/6.8/tests/fdatasync.c /usr/src/debug/strace/6.8/src/xlat/statmount_sb_flags.h /usr/src/debug/strace/6.8/tests/
 prctl-cap-ambient.c /usr/src/debug/strace/6.8/src/xlat/sock_shutdown_flags.h /usr/src/debug/strace/6.8/src/socketutils.c /usr/src/debug/strace/6.8/src/xlat/tcxonc_options.h /usr/src/debug/strace/6.8/tests/sched_get_priority_mxx.c /usr/src/debug/strace/6.8/src/xlat/btrfs_cont_reading_from_srcdev_mode.h /usr/src/debug/strace/6.8/src/xlat/open_tree_flags.h /usr/src/debug/strace/6.8/tests/inet-cmsg.c /usr/src/debug/strace/6.8/src/xlat/btrfs_qgroup_inherit_flags.h /usr/src/debug/strace/6.8/src/xlat/ubi_volume_props.h /usr/src/debug/strace/6.8/src/dyxlat.c /usr/src/debug/strace/6.8/src/print_kernel_sigset.c /usr/src/debug/strace/6.8/src/xlat/tls_info_versions.h /usr/src/debug/strace/6.8/tests/nlattr_netlink_diag_msg.c /usr/src/debug/strace/6.8/src/xlat/evdev_ff_types.h /usr/src/debug/strace/6.8/tests/skip_unavailable.c /usr/src/debug/strace/6.8/src/xlat/bpf_file_mode_flags.h /usr/src/debug/strace/6.8/src/xlat/cap_mask1.h /usr/src/debug/strace/6.8/src/xlat/sock_ipx_options.h /usr/src/debug
 /strace/6.8/tests/test_printstrn.c /usr/src/debug/strace/6.8/tests/pipe_maxfd.c /usr/src/debug/strace/6.8/src/xlat/pr_set_vma.h /usr/src/debug/strace/6.8/tests/waitid.c /usr/src/debug/strace/6.8/src/xlat/uffd_zeropage_flags.h /usr/src/debug/strace/6.8/tests/statx.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/lsm.h /usr/src/debug/strace/6.8/src/xlat/nt_descriptor_types.h /usr/src/debug/strace/6.8/src/bpf_sock_filter.c /usr/src/debug/strace/6.8/tests/epoll_pwait2.c /usr/src/debug/strace/6.8/src/xlat/mount_attr_propagation.h /usr/src/debug/strace/6.8/tests/oldselect.c /usr/src/debug/strace/6.8/src/xlat/mount_attr_attr.h /usr/src/debug/strace/6.8/tests/sleep.c /usr/src/debug/strace/6.8/tests/access.c /usr/src/debug/strace/6.8/src/xlat/inotify_flags.h /usr/src/debug/strace/6.8/tests/segv_accerr.c /usr/src/debug/strace/6.8/tests/mknod.c /usr/src/debug/strace/6.8/tests/segv_pkuerr.c /usr/src/debug/strace/6.8/src/xlat/mtd_file_mode_options.h /usr/src/debug/strace/6.8/src/fute
 x.c /usr/src/debug/strace/6.8/src/xlat/secbits.h /usr/src/debug/strace/6.8/tests/fsopen.c /usr/src/debug/strace/6.8/src/keyctl.c /usr/src/debug/strace/6.8/src/xlat/sock_pnp_options.h /usr/src/debug/strace/6.8/tests/rename.c /usr/src/debug/strace/6.8/src/readlink.c /usr/src/debug/strace/6.8/tests/nlattr.c /usr/src/debug/strace/6.8/src/print_utils.h /usr/src/debug/strace/6.8/src/xlat/evdev_mtslots.h /usr/src/debug/strace/6.8/src/xlat/perf_hw_id.h /usr/src/debug/strace/6.8/src/xlat/ioprio_who.h /usr/src/debug/strace/6.8/tests/kexec_file_load.c /usr/src/debug/strace/6.8/tests/quotactl-xfs.c /usr/src/debug/strace/6.8/tests/xetpgid.c /usr/src/debug/strace/6.8/src/xlat/nl_bridge_vlan_flags.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/netconf.h /usr/src/debug/strace/6.8/tests/futex_waitv.c /usr/src/debug/strace/6.8/src/xlat/mtd_flags_options.h /usr/src/debug/strace/6.8/tests/nlattr_cachereport.c /usr/src/debug/strace/6.8/src/xlat/rtnl_addr_attrs.h /usr/src/debug/strace/6.8/s
 rc/kernel_types.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/mroute6.h /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_events.h /usr/src/debug/strace/6.8/src/xlat/uffd_register_mode_flags.h /usr/src/debug/strace/6.8/src/xlat/memfd_create_flags.h /usr/src/debug/strace/6.8/tests/symlink.c /usr/src/debug/strace/6.8/tests/sysinfo.c /usr/src/debug/strace/6.8/src/userfaultfd.c /usr/src/debug/strace/6.8/src/fsconfig.c /usr/src/debug/strace/6.8/src/xlat/ebpf_size.h /usr/src/debug/strace/6.8/tests/getdents.c /usr/src/debug/strace/6.8/tests/getgid32.c /usr/src/debug/strace/6.8/tests/getuid32.c /usr/src/debug/strace/6.8/tests/perf_event_open_nonverbose.c /usr/src/debug/strace/6.8/tests/prctl-securebits.c /usr/src/debug/strace/6.8/tests/sigaction.c /usr/src/debug/strace/6.8/tests/sigreturn.c /usr/src/debug/strace/6.8/src/xlat/statx_masks.h /usr/src/debug/strace/6.8/tests/nlattr_ifla_xdp.c /usr/src/debug/strace/6.8/src/xlat/bpf_query_flags.h /usr/src/debug/strace/6.8/tests/sched_xet
 scheduler.c /usr/src/debug/strace/6.8/tests/fadvise64_64.c /usr/src/debug/strace/6.8/tests/llseek.c /usr/src/debug/strace/6.8/src/xlat/sock_sctp_options.h /usr/src/debug/strace/6.8/src/eventfd.c /usr/src/debug/strace/6.8/src/xlat/hdio_busstates.h /usr/src/debug/strace/6.8/src/xlat/v4l2_buf_flags.h /usr/src/debug/strace/6.8/src/xlat/v4l2_buf_types.h /usr/src/debug/strace/6.8/src/sysent.h /usr/src/debug/strace/6.8/src/xlat/netlink_states.h /usr/src/debug/strace/6.8/tests/munlockall.c /usr/src/debug/strace/6.8/tests/prctl-pac-reset-keys.c /usr/src/debug/strace/6.8/tests/tracer_ppid_pgid_sid.c /usr/src/debug/strace/6.8/tests/prctl-set_vma.c /usr/src/debug/strace/6.8/tests/prctl-seccomp-filter-v.c /usr/src/debug/strace/6.8/src/xlat/sockopt_txrehash_vals.h /usr/src/debug/strace/6.8/tests/fchmod.c /usr/src/debug/strace/6.8/tests/ioctl_sg_io_v4.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/dqblk_xfs.h /usr/src/debug/strace/6.8/src/xlat/kvm_cpuid_flags.h /usr/src/debug/strace/
 6.8/tests/printstr.c /usr/src/debug/strace/6.8/tests/netlink_unix_diag.c /usr/src/debug/strace/6.8/src/fs_f_ioctl.c /usr/src/debug/strace/6.8/src/xlat/unshare_flags.h /usr/src/debug/strace/6.8/src/rtnl_nh.c /usr/src/debug/strace/6.8/src/xlat/shutdown_modes.h /usr/src/debug/strace/6.8/src/xlat/madvise_cmds.h /usr/src/debug/strace/6.8/tests/scm_rights.c /usr/src/debug/strace/6.8/src/xlat/f_seals.h /usr/src/debug/strace/6.8/src/xlat/scmvals.h /usr/src/debug/strace/6.8/tests/dev-yy.c /usr/src/debug/strace/6.8/tests/fchmodat2.c /usr/src/debug/strace/6.8/tests/filter_seccomp-perf.c /usr/src/debug/strace/6.8/src/xlat/membarrier_flags.h /usr/src/debug/strace/6.8/src/lookup_dcookie.c /usr/src/debug/strace/6.8/src/kcmp.c /usr/src/debug/strace/6.8/src/xlat/btrfs_qgroup_ctl_cmds.h /usr/src/debug/strace/6.8/src/xlat/if_dqinfo_flags.h /usr/src/debug/strace/6.8/src/xlat/btrfs_snap_flags_v2.h /usr/src/debug/strace/6.8/src/netlink_kobject_uevent.c /usr/src/debug/strace/6.8/tests/setresgid32.c /usr/s
 rc/debug/strace/6.8/tests/setresuid32.c /usr/src/debug/strace/6.8/src/xlat/evdev_ff_status.h /usr/src/debug/strace/6.8/src/netlink_kobject_uevent.h /usr/src/debug/strace/6.8/tests/ioctl_block.c /usr/src/debug/strace/6.8/src/xlat/btrfs_balance_ctl_cmds.h /usr/src/debug/strace/6.8/tests/faccessat.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/if_bonding.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/tls.h /usr/src/debug/strace/6.8/src/pkeys.c /usr/src/debug/strace/6.8/tests/pidns-cache.c /usr/src/debug/strace/6.8/src/xlat/nf_ctnetlink_exp_msg_types.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/netlink_diag.h /usr/src/debug/strace/6.8/tests/sendfile.c /usr/src/debug/strace/6.8/tests/setgid32.c /usr/src/debug/strace/6.8/tests/setuid32.c /usr/src/debug/strace/6.8/tests/semop-common.c /usr/src/debug/strace/6.8/src/statfs.h /usr/src/debug/strace/6.8/src/xlat/sg_scsi_reset.h /usr/src/debug/strace/6.8/src/statfs.c /usr/src/debug/strace/6.8/src/xlat/
 lsm_ids.h /usr/src/debug/strace/6.8/tests/net-icmp_filter.c /usr/src/debug/strace/6.8/tests/ioctl_evdev-success.c /usr/src/debug/strace/6.8/src/netlink_inet_diag.c /usr/src/debug/strace/6.8/src/sen.h /usr/src/debug/strace/6.8/src/rtnl_neightbl.c /usr/src/debug/strace/6.8/src/xlat/btrfs_features_compat_ro.h /usr/src/debug/strace/6.8/src/xlat/gpio_event_flags.h /usr/src/debug/strace/6.8/src/xlat/kd_key_types.h /usr/src/debug/strace/6.8/tests/clock_xettime-common.c /usr/src/debug/strace/6.8/tests/setpgrp-exec.c /usr/src/debug/strace/6.8/src/xlat/audit_arch.h /usr/src/debug/strace/6.8/tests/unix-pair-send-recv.c /usr/src/debug/strace/6.8/src/xlat/btrfs_qgroup_limit_flags.h /usr/src/debug/strace/6.8/src/xlat/sock_iucv_options.h /usr/src/debug/strace/6.8/src/xlat/packet_mreq_type.h /usr/src/debug/strace/6.8/tests/net-y-unix.c /usr/src/debug/strace/6.8/src/xlat/btrfs_dev_replace_cmds.h /usr/src/debug/strace/6.8/src/xlat/gpio_line_flags.h /usr/src/debug/strace/6.8/src/bpf.c /usr/src/debug/s
 trace/6.8/src/xlat/mmap_prot.h /usr/src/debug/strace/6.8/src/nlattr.h /usr/src/debug/strace/6.8/src/nlattr.c /usr/src/debug/strace/6.8/tests/sched_rr_get_interval.c /usr/src/debug/strace/6.8/src/xlat/rtnl_ifla_br_mcast_querier_attrs.h /usr/src/debug/strace/6.8/src/xlat/tee_ioctl_optee_caps.h /usr/src/debug/strace/6.8/tests/xchownx.c /usr/src/debug/strace/6.8/src/xlat/ifstats_xstats_bond_3ad_attrs.h /usr/src/debug/strace/6.8/src/xlat/at_statx_sync_types.h /usr/src/debug/strace/6.8/tests/quotactl_fd.c /usr/src/debug/strace/6.8/src/xlat/smc_diag_extended_flags.h /usr/src/debug/strace/6.8/tests/printpath-umovestr.c /usr/src/debug/strace/6.8/src/xlat/epollevents.h /usr/src/debug/strace/6.8/src/xlat/inet_diag_ulp_info_attrs.h /usr/src/debug/strace/6.8/src/xlat/rtnl_neigh_fdb_ext_attrs.h /usr/src/debug/strace/6.8/tests/splice.c /usr/src/debug/strace/6.8/src/xlat/btrfs_dev_replace_state.h /usr/src/debug/strace/6.8/src/xlat/ebpf_op_alu.h /usr/src/debug/strace/6.8/src/xlat/mctp_addrs.h /usr/s
 rc/debug/strace/6.8/tests/ip_protocol.c /usr/src/debug/strace/6.8/src/netlink_smc_diag.c /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/counter.h /usr/src/debug/strace/6.8/src/xlat/tcflsh_options.h /usr/src/debug/strace/6.8/src/printsiginfo.h /usr/src/debug/strace/6.8/src/print_ifindex.c /usr/src/debug/strace/6.8/src/printsiginfo.c /usr/src/debug/strace/6.8/tests/sockopt-sol_netlink.c /usr/src/debug/strace/6.8/src/xlat/sock_dccp_options.h /usr/src/debug/strace/6.8/tests/sprintrc.c /usr/src/debug/strace/6.8/src/netlink_sock_diag.c /usr/src/debug/strace/6.8/src/netlink_sock_diag.h /usr/src/debug/strace/6.8/src/xlat/tee_ioctl_max_arg_size.h /usr/src/debug/strace/6.8/src/xlat/tls_info_configs.h /usr/src/debug/strace/6.8/tests/s390_runtime_instr.c /usr/src/debug/strace/6.8/src/xlat/rtnl_neigh_attrs.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/tcp.h /usr/src/debug/strace/6.8/src/regset.c /usr/src/debug/strace/6.8/src/mknod.c /usr/src/debug/strace/6.8/tests/sync
 _file_range2.c /usr/src/debug/strace/6.8/src/xlat/nf_ipset_msg_types.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/openat2.h /usr/src/debug/strace/6.8/src/nbd_ioctl.c /usr/src/debug/strace/6.8/src/xlat/ipc_private.h /usr/src/debug/strace/6.8/tests/umoven-illptr.c /usr/src/debug/strace/6.8/src/xlat/kd_font_ops.h /usr/src/debug/strace/6.8/src/xlat/sock_irda_options.h /usr/src/debug/strace/6.8/src/xlat/packet_diag_show.h /usr/src/debug/strace/6.8/src/counter_ioctl.c /usr/src/debug/strace/6.8/src/retval.h /usr/src/debug/strace/6.8/tests/attach-p-cmd.h /usr/src/debug/strace/6.8/src/print_instruction_pointer.c /usr/src/debug/strace/6.8/src/getcwd.c /usr/src/debug/strace/6.8/src/open.c /usr/src/debug/strace/6.8/src/xlat/fsmount_flags.h /usr/src/debug/strace/6.8/src/retval.c /usr/src/debug/strace/6.8/src/xlat/kd_font_flags.h /usr/src/debug/strace/6.8/tests/setresugid.c /usr/src/debug/strace/6.8/tests/nlattr_rtmsg.c /usr/src/debug/strace/6.8/tests/getegid.c /usr/src/debug/stra
 ce/6.8/tests/geteuid.c /usr/src/debug/strace/6.8/tests/getpgrp.c /usr/src/debug/strace/6.8/tests/getppid.c /usr/src/debug/strace/6.8/tests/getxgid.c /usr/src/debug/strace/6.8/tests/getxpid.c /usr/src/debug/strace/6.8/tests/getxuid.c /usr/src/debug/strace/6.8/tests/nlattr_ifla_brport.c /usr/src/debug/strace/6.8/src/desc.c /usr/src/debug/strace/6.8/tests/unlink.c /usr/src/debug/strace/6.8/tests/semop-indirect.c /usr/src/debug/strace/6.8/tests/fadvise64.c /usr/src/debug/strace/6.8/tests/pidns.h /usr/src/debug/strace/6.8/src/xlat/sched_flags.h /usr/src/debug/strace/6.8/src/xlat/semop_flags.h /usr/src/debug/strace/6.8/src/xlat/sg_io_flags.h /usr/src/debug/strace/6.8/src/xlat/vsock_flags.h /usr/src/debug/strace/6.8/src/xlat/clone_flags.h /usr/src/debug/strace/6.8/src/xlat/mbind_flags.h /usr/src/debug/strace/6.8/src/xlat/mlock_flags.h /usr/src/debug/strace/6.8/src/xlat/modem_flags.h /usr/src/debug/strace/6.8/src/xlat/mount_flags.h /usr/src/debug/strace/6.8/src/listmount.c /usr/src/debug/st
 race/6.8/tests/pidns.c /usr/src/debug/strace/6.8/src/xlat/term_oflags_nldly.h /usr/src/debug/strace/6.8/src/xlat/pr_tagged_addr_enable.h /usr/src/debug/strace/6.8/tests/getdents64.c /usr/src/debug/strace/6.8/src/print_time.c /usr/src/debug/strace/6.8/tests/int_0x80.c /usr/src/debug/strace/6.8/tests/fflush.c /usr/src/debug/strace/6.8/src/xlat/seccomp_mode.h /usr/src/debug/strace/6.8/src/xlat/smc_diag_attrs.h /usr/src/debug/strace/6.8/tests/qual_inject-error-signal.c /usr/src/debug/strace/6.8/src/xlat/pr_fp_mode.h /usr/src/debug/strace/6.8/src/xlat/sock_kcm_options.h /usr/src/debug/strace/6.8/src/quota.c /usr/src/debug/strace/6.8/src/xlat/perf_hw_cache_op_result_id.h /usr/src/debug/strace/6.8/tests/readahead.c /usr/src/debug/strace/6.8/tests/nlattr_ndtmsg.c /usr/src/debug/strace/6.8/src/dirent64.c /usr/src/debug/strace/6.8/src/xlat/evdev_switch.h /usr/src/debug/strace/6.8/src/epoll.c /usr/src/debug/strace/6.8/src/strauss.h /usr/src/debug/strace/6.8/tests/tprintf.c /usr/src/debug/strac
 e/6.8/src/strauss.c /usr/src/debug/strace/6.8/tests/sched_yield.c /usr/src/debug/strace/6.8/src/xlat/perf_hw_cache_op_id.h /usr/src/debug/strace/6.8/tests/ioctl_ubi.c /usr/src/debug/strace/6.8/src/xlat/bootflags3.h /usr/src/debug/strace/6.8/src/xlat/snmp_ip_stats.h /usr/src/debug/strace/6.8/tests/kill_child.c /usr/src/debug/strace/6.8/src/xlat/schedulers.h /usr/src/debug/strace/6.8/src/fchownat.c /usr/src/debug/strace/6.8/src/xlat/bpf_miscop.h /usr/src/debug/strace/6.8/src/xlat/lirc_features.h /usr/src/debug/strace/6.8/src/xlat/x86_xfeatures.h /usr/src/debug/strace/6.8/src/xlat/clone3_flags.h /usr/src/debug/strace/6.8/tests/xstatfsx.c /usr/src/debug/strace/6.8/src/xlat/rtnl_tca_act_flags.h /usr/src/debug/strace/6.8/tests/ioctl_tee.c /usr/src/debug/strace/6.8/src/xlat/seccomp_ret_action.h /usr/src/debug/strace/6.8/bundled/linux/include/uapi/linux/pkt_sched.h /usr/src/debug/strace/6.8/src/defs.h /usr/src/debug/strace/6.8/src/nsfs.c /usr/src/debug/strace/6.8/tests/request_key.c /usr/sr
 c/debug/strace/6.8/src/xlat/inet6_devconf_indices.h /usr/src/debug/strace/6.8/tests/kernel_version.c"
packages/core2-64-poky-linux/strace/strace-src: PV changed from "6.7" to "6.8"
packages/core2-64-poky-linux/strace/strace-src: PKGSIZE changed from 10308533 to 10427307 (+1%)
packages/core2-64-poky-linux/strace/strace-src: PKGV changed from 6.7 [default] to 6.8 [default]
packages/core2-64-poky-linux/strace/strace-staticdev: PV changed from "6.7" to "6.8"
packages/core2-64-poky-linux/strace/strace-staticdev: PKGV changed from 6.7 [default] to 6.8 [default]
packages/core2-64-poky-linux/strace/strace: PV changed from "6.7" to "6.8"
packages/core2-64-poky-linux/strace/strace: PKGSIZE changed from 1810629 to 1831109 (+1%)
packages/core2-64-poky-linux/strace/strace: PKGV changed from 6.7 [default] to 6.8 [default]
Changes to packages/x86_64-linux/binutils-cross-x86_64 (sysroot):
  /sysroot-providers/virtual_x86_64-poky-linux-binutils was added
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-addr2line was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-as was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++filt was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-dwp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-elfedit was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gprof was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.bfd was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.gold was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objcopy was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objdump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-readelf was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-size was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strings was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/libdep.so was added
  /usr/lib/x86_64-poky-linux/ldscripts was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/stamp was added
  /sysroot-providers/virtual_x86_64-poky-linux-musl-binutils was removed
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-addr2line was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-as was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++filt was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-dwp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-elfedit was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gprof was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld.gold was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objcopy was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objdump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-readelf was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-size was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strings was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/libdep.so was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/stamp was removed
Changes to packages/x86_64-linux/gcc-cross-x86_64 (sysroot):
  /sysroot-providers/virtual_x86_64-poky-linux-g++ was added
  /sysroot-providers/virtual_x86_64-poky-linux-gcc was added
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-cpp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-13.2.0 was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-dump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-tool was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-lto-dump was added
  /usr/libexec/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/cc1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/cc1plus was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/collect2 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/g++-mapper-server was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/fixincl was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/fixinc.sh was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/mkheaders was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld.gold was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcp1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcp1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/liblto_plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/lto1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/lto-wrapper was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/gengtype was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/strip was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ld.gold was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/x86_64-poky-linux/gcc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/adxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/ammintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxbf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxcomplexintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxfp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxtileintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx5124fmapsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx5124vnniwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512cdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512dqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512erintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512fintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512fp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512fp16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512pfintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vldqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxneconvertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxvnniint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxvnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/bmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/bmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/bmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cet.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cldemoteintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/clflushoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/clwbintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/clzerointrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cmpccxaddintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cpuid.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cross-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/emmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/enqcmdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/f16cintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include-fixed was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include-fixed/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/float.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/fma4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/fmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/fxsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/gfniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/hresetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/ia32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/immintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/iso646.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/keylockerintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/lwpintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/lzcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mm3dnow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mm_malloc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/movdirintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mwaitintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mwaitxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/nmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/pconfigintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/pkuintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/pmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/popcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/prfchiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/prfchwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/quadmath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/quadmath_weak.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/raointintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/rdseedintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/rtmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/serializeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/sgxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/shaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/smmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdalign.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdatomic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdbool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stddef.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdfix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdint-gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdnoreturn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/syslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/tbmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/tmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/uintrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/unwind.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/vaesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/varargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/waitpkgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/wmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/x86gprintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/x86intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xopintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsavecintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsaveintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsaveoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsavesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xtestintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/fixinc_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/include/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/macro_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/mkheaders.conf was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/gtype.state was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ada was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/addresses.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/align.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/all-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ansidecl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/array-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/asan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/attribs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/auto-host.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/auto-profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/backend.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/basic-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/b-header-vars was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/bitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtins.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtin-types.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/bversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/calls.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ccmp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfganal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfghooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cgraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cif-code.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/collect2.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/collect-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/color-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/conditions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/configargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/elfos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/biarch64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/convert.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/coretypes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/coverage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/contracts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cp-trait.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/operators.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cppdefault.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cpplib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cselib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ctfc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/d was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/data-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ddg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/debug.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/defaults.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/df.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dfp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-client-data-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/digraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dojump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dominance.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/domwalk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/double-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dump-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dumpfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/edit-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/errors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/escaped_string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/et-forest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/except.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/explow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/expmed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/file-find.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/filenames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fixed-value.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/flag-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fold-const.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/function-abi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcov-io.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcse-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/generic-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gengtype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/genrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gensupport.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ggc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-infer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimplify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/glimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graphds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graphite.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graphviz.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gsstruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gsyms.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hashtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-table.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hosthooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hwint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ifcvt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/inchash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/incpath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/input.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-addr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-attr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-codes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-modes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/internal-fn.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/internal-fn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/intl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ira.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ira-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/is-a.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/langhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lcm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/libiberty.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/limitx.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/limity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/line-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lra-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lto-compress.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/m2 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/m2/m2-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/machmode.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/machmode.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/make-unique.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/md5.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/memmodel.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/memory-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mem-stats.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mode-classes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mux-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/objc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/obstack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-expand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-general.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-offload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/options.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opt-problem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opts-jobserver.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/output.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/passes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pass-instances.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pass_manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin-version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pointer-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/poly-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/predict.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/prefix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/print-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/print-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/profile-count.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/read-md.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/real.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/realmpfr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/recog.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regcprop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/reg-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regrename.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/reload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/resource.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtlanal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl-error.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtlhash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sanitizer.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sched-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/selftest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sel-sched.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sese.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/signop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sparseset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/spellcheck.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sreal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/statistics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/stmt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/stor-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/stringpool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/substring-locations.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/system.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-globals.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-insns.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/targhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/timevar.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/timevar.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tm_p.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tm-preds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/toplev.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tracer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/trans-mem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-affine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-check.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-eh.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-nested.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-pass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-sra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/treestruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tristate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tsystem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/typeclass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ubsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/valtrack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-prof.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-range-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-range-storage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-relation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/varasm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vr-values.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/wide-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/xcoff.h was added
  /sysroot-providers/virtual_x86_64-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_x86_64-poky-linux-musl-gcc was removed
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-cpp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-13.2.0 was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-dump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-tool was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-lto-dump was removed
  /usr/libexec/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/cc1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/cc1plus was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/collect2 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/g++-mapper-server was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/fixincl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/mkheaders was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ld.gold was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcp1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/liblto_plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/lto1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/lto-wrapper was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/gengtype was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/strip was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ld.gold was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/x86_64-poky-linux-musl/gcc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/adxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/ammintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxbf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxcomplexintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxfp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxtileintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx5124fmapsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx5124vnniwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512cdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512dqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512erintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512fintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512fp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512pfintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxneconvertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxvnniint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxvnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/bmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/bmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/bmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cet.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cldemoteintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/clflushoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/clwbintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/clzerointrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cmpccxaddintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cpuid.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cross-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/emmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/enqcmdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/f16cintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include-fixed was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include-fixed/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/float.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/fma4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/fmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/fxsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/gfniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/hresetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/ia32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/immintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/iso646.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/keylockerintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/lwpintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/lzcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mm3dnow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mm_malloc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/movdirintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mwaitintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mwaitxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/nmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/pconfigintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/pkuintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/pmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/popcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/prfchiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/prfchwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/quadmath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/quadmath_weak.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/raointintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/rdseedintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/rtmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/serializeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/sgxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/shaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/smmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdalign.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdatomic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdbool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stddef.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdfix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdint-gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdnoreturn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/syslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/tbmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/tmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/uintrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/unwind.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/vaesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/varargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/waitpkgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/wmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/x86gprintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/x86intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xopintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsavecintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsaveintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsavesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xtestintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/fixinc_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/include/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/macro_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/gtype.state was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ada was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/addresses.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/align.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/all-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/array-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/asan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/attribs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/auto-host.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/backend.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/basic-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/b-header-vars was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/bitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtins.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/bversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/calls.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ccmp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfganal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cgraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cif-code.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/collect2.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/color-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/conditions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/configargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/biarch64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/convert.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/coretypes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/coverage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/contracts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cp-trait.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cpplib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cselib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ctfc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/d was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ddg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/debug.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/defaults.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/df.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dfp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-client-data-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/digraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dojump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dominance.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/domwalk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/double-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dump-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/edit-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/errors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/et-forest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/except.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/explow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/expmed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/file-find.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/filenames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/flag-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fold-const.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/function-abi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/generic-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gengtype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/genrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gensupport.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ggc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-infer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimplify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/glimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graphds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graphite.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graphviz.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gsyms.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hashtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-table.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hwint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/inchash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/incpath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/input.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/intl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ira.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ira-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/is-a.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/langhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lcm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/libiberty.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/limitx.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/limity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/line-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lra-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/m2 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/m2/m2-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/machmode.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/machmode.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/make-unique.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/md5.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/memmodel.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/memory-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/objc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/obstack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-general.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/options.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opts-jobserver.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/output.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/passes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pointer-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/poly-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/predict.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/prefix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/print-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/profile-count.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/read-md.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/real.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/recog.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regcprop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regrename.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/reload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/resource.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sched-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/selftest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sese.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/signop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sparseset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sreal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/statistics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/stmt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/stringpool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/system.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-globals.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-insns.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/targhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/timevar.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/timevar.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tm_p.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/toplev.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tracer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-check.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/treestruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tristate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tsystem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/typeclass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ubsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/valtrack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-prof.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-range-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-range-storage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-relation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/varasm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vr-values.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/wide-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/xcoff.h was removed

--===============6661050629125212424==--

