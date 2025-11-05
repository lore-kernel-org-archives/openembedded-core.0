Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0617BCD37B2
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:37 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2375.1762384594933287527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=e5zyKjWA;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=kWKJiJDi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019a564ec402-3af27c1b-7d88-40c1-9d93-32dcb63d6108-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384594;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EYkAnJVyvFElx1F4wy9Z2AouCDKDgJ4tYn5Q/r51oKc=;
	b=e5zyKjWAG41KAQ+kedvuXJXCAxhLGyIwN1LiKeGHR1FNGneWufD2SWStbafmaYcp
	L9Fo/9wGR2SwihHKF5ACiVrijxgLpbIO51cyVWXM2eq4oCokt4qLCXWLDwvPkTyih6Q
	Hy5jwwTyW/PN/wwtxQ1PEL53JZfueOgHAoLSV27w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384594;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EYkAnJVyvFElx1F4wy9Z2AouCDKDgJ4tYn5Q/r51oKc=;
	b=kWKJiJDiq6KlQANYHXKb181KxbulTIbxiJ9Wg0/HVauTf8xonIR8tOrxaH+hVIzB
	qZl641L4QDFnJcIs36MsxfPMQFPPhoKvObNcjs0DhgUWHEcotxvf3F8eptcD1j3f9AY
	2fx92oHJfyM18QARZDIgfQazzdRuFDkfrv8n6YRQ=
Content-Type: multipart/mixed; boundary="===============7194832484497245589=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] strace: upgrading to 6.17 FAILED
Message-ID: <0101019a564ec402-3af27c1b-7d88-40c1-9d93-32dcb63d6108-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225865

--===============7194832484497245589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *strace* to *6.17* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-strace-upgrade-6.16-6.17.patch
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
From 0b593d889c72dda83b4db6d2272d648c6bb425ff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 18:33:19 +0000
Subject: [PATCH] strace: upgrade 6.16 -> 6.17

---
 ...gnore-pwritev-pwrite64-tests-on-musl.patch | 62 +++++++++++++++++++
 ...toconf-macro-to-detect-largefile-sup.patch |  2 +-
 ...001-strace-fix-reproducibilty-issues.patch |  2 +-
 ...01-tests-fix-uio.test-with-musl-libc.patch | 30 ---------
 ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
 .../strace/strace/Makefile-ptest.patch        |  6 +-
 .../strace/strace/ptest-spacesave.patch       |  2 +-
 .../strace/strace/skip-load.patch             | 13 ++--
 .../strace/strace/update-gawk-paths.patch     |  2 +-
 .../strace/{strace_6.16.bb => strace_6.17.bb} |  4 +-
 10 files changed, 77 insertions(+), 48 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
 rename meta/recipes-devtools/strace/{strace_6.16.bb => strace_6.17.bb} (93%)

diff --git a/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch b/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
new file mode 100644
index 0000000000..d9aa6b4f2f
--- /dev/null
+++ b/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
@@ -0,0 +1,62 @@
+From 0a1a71675b8c147c69f855dfbcae106b0a7f9647 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Aug 2025 22:18:58 -0700
+Subject: [PATCH] Ignore pwritev/pwrite64 tests on musl
+
+musl uses wrappers for pwritev and pwrite64 using
+pwritev2 syscall [1], however the test exepcts that the
+program will call pwritev and pwrite64 ( glibc behavior )
+
+This can be fixed if the function calls are changed to
+use syscall() API directly, but that needs change upstream [2]
+
+Issue is reported upstream [3]
+
+[1] https://git.musl-libc.org/cgit/musl/commit/src?id=5370070fded61b569196764673a4fc8440aac79e
+[2] https://github.com/strace/strace/pull/347
+[3] https://github.com/strace/strace/issues/349
+
+Upstream-Status: Inappropriate [Musl Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/pread64-pwrite64.gen.test | 3 +++
+ tests/preadv-pwritev.gen.test   | 3 +++
+ tests/pwritev.gen.test          | 3 +++
+ 3 files changed, 9 insertions(+)
+
+diff --git a/tests/pread64-pwrite64.gen.test b/tests/pread64-pwrite64.gen.test
+index b53e069..0a1e6e6 100755
+--- a/tests/pread64-pwrite64.gen.test
++++ b/tests/pread64-pwrite64.gen.test
+@@ -1,4 +1,7 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (pread64-pwrite64 -a21 -eread=0 -ewrite=1 -e trace=pread64,pwrite64 -P pread64-pwrite64-tmpfile -P /dev/zero -P /dev/null); do not edit.
+ . "${srcdir=.}/init.sh"
++
++skip_ "Test not ported to musl, musl generates pwritev2"
++
+ run_strace_match_diff -a21 -eread=0 -ewrite=1 -e trace=pread64,pwrite64 -P pread64-pwrite64-tmpfile -P /dev/zero -P /dev/null
+diff --git a/tests/preadv-pwritev.gen.test b/tests/preadv-pwritev.gen.test
+index 5ed8297..b83f129 100755
+--- a/tests/preadv-pwritev.gen.test
++++ b/tests/preadv-pwritev.gen.test
+@@ -1,4 +1,7 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (preadv-pwritev -a19 -eread=0 -ewrite=1 -e trace=preadv,pwritev); do not edit.
+ . "${srcdir=.}/init.sh"
++
++skip_ "Test not ported to musl, musl generates pwritev2"
++
+ run_strace_match_diff -a19 -eread=0 -ewrite=1 -e trace=preadv,pwritev
+diff --git a/tests/pwritev.gen.test b/tests/pwritev.gen.test
+index e54fd15..4999816 100755
+--- a/tests/pwritev.gen.test
++++ b/tests/pwritev.gen.test
+@@ -1,4 +1,7 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (pwritev -a22 -s7); do not edit.
+ . "${srcdir=.}/init.sh"
++
++skip_ "Test not ported to musl, musl generates pwritev2"
++
+ run_strace_match_diff -a22 -s7
diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
index 46894cd9d0..1750f34518 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 267989559370a9f34646bf8a02001755bf64fb25 Mon Sep 17 00:00:00 2001
+From 4c7112f36a70d3034c583ab45058491129111585 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:54:27 -0800
 Subject: [PATCH] configure: Use autoconf macro to detect largefile support
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
index ee379688bf..c633531f44 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
@@ -1,4 +1,4 @@
-From 59077f39cce499d11de5b0a9c23c9ded67ddb22e Mon Sep 17 00:00:00 2001
+From d0bbbf170f70746b2b8e9bb6129b0b9441a1c4b5 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 19:56:55 +0000
 Subject: [PATCH] strace: fix reproducibilty issues
diff --git a/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch b/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
deleted file mode 100644
index a879ca50ca..0000000000
--- a/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7fadf6947761cc5248aa4a376bb9517481dbaa52 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Tue, 12 Aug 2025 20:02:31 +0200
-Subject: [PATCH] tests: fix uio.test with musl-libc
-
-musl-libc handles the pwrite calls differently than glibc, making
-the uio test fail.  Using glibc, there are separated pwrite and pwritev
-calls, however musl uses only pwritev2 for both pwrite and pwritev.
-
-To account to this difference, modify the expected matching regexp
-to also match the musl output (append it with an OR).
-
-Upstream-Status: Backport [https://github.com/strace/strace/pull/347]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/uio.expected | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/uio.expected b/tests/uio.expected
-index 98d5c06..2a712a1 100644
---- a/tests/uio.expected
-+++ b/tests/uio.expected
-@@ -1,4 +1,4 @@
- pread(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4
- preadv\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4
--pwrite(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4
--pwritev\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4
-+pwrite(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4|pwritev2\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4}], 1, 1004211379570065135, RWF_NOAPPEND\) += 4
-+pwritev\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4|pwritev2\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4}], 1, 1004211379570065135, RWF_NOAPPEND\) += 4
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
index ca909d573d..093cedc233 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -1,4 +1,4 @@
-From 69083e93e92437e8d9d4225fca71a053906a4af0 Mon Sep 17 00:00:00 2001
+From f487e2a0f1568c989a0294f4335f3dc9a6012d8d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:56:13 -0800
 Subject: [PATCH] tests: Replace off64_t with off_t
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 212eea8618..60562ae7d9 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 9d40d293ff73dea734f1353c354f51e51992a813 Mon Sep 17 00:00:00 2001
+From 6d77203fb22e076918dc983db47b48b28cbbc06d Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 6e942b1..7a707d7 100644
+index d76b5c6..d4fc206 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
@@ -24,7 +24,7 @@ index 6e942b1..7a707d7 100644
  AM_CFLAGS = $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
  bundled_CPPFLAGS =
  if USE_BUNDLED_HEADERS
-@@ -937,3 +938,22 @@ BUILT_SOURCES = ksysent.h
+@@ -939,3 +940,22 @@ BUILT_SOURCES = ksysent.h
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
index 661ed2c7bb..3e66b15850 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From 8bd827339ae72eab99dc9ad6a68b0ae98e5bbb49 Mon Sep 17 00:00:00 2001
+From 76c23e018608421624d1e00b9e387b265e6da469 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 29 May 2019 00:10:32 +0100
 Subject: [PATCH] strace: Tweak ptest disk space management
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/recipes-devtools/strace/strace/skip-load.patch
index 34948fd2ba..20535fe005 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,4 +1,4 @@
-From 46eceefb3bd184354cdaf0fd3dff6f2ad979aad9 Mon Sep 17 00:00:00 2001
+From 40244c27de6b8fa0f6f6685d20e64309884e73bf Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Sat, 30 Aug 2025 00:47:03 +0200
 Subject: [PATCH] strace: skip a number of load-sensitive tests
@@ -17,7 +17,7 @@ Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
  4 files changed, 4 insertions(+)
 
 diff --git a/tests/clock_nanosleep.gen.test b/tests/clock_nanosleep.gen.test
-index 7a6025bbd..f0e6dbb73 100755
+index 7a6025b..f0e6dbb 100755
 --- a/tests/clock_nanosleep.gen.test
 +++ b/tests/clock_nanosleep.gen.test
 @@ -1,4 +1,5 @@
@@ -27,7 +27,7 @@ index 7a6025bbd..f0e6dbb73 100755
 +skip_ "Test not reliable under load"
  run_strace_match_diff -e trace=clock_nanosleep,clock_gettime
 diff --git a/tests/delay.test b/tests/delay.test
-index f74e27f1e..1510c7647 100755
+index f74e27f..1510c76 100755
 --- a/tests/delay.test
 +++ b/tests/delay.test
 @@ -9,6 +9,7 @@
@@ -39,7 +39,7 @@ index f74e27f1e..1510c7647 100755
  	[ -n "$denter" ] || continue
  
 diff --git a/tests/nanosleep.gen.test b/tests/nanosleep.gen.test
-index 41928ded8..f8a87cb8e 100755
+index 41928de..f8a87cb 100755
 --- a/tests/nanosleep.gen.test
 +++ b/tests/nanosleep.gen.test
 @@ -1,4 +1,5 @@
@@ -49,7 +49,7 @@ index 41928ded8..f8a87cb8e 100755
 +skip_ "Test not reliable under load"
  run_strace_match_diff -a20 
 diff --git a/tests/strace-r.test b/tests/strace-r.test
-index 829973753..e89423485 100755
+index 8299737..e894234 100755
 --- a/tests/strace-r.test
 +++ b/tests/strace-r.test
 @@ -9,6 +9,7 @@
@@ -60,6 +60,3 @@ index 829973753..e89423485 100755
  r_opt="${1:--r}"
  
  run_prog ../sleep 0
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index 193a4819ef..bf4a8cd123 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From c11380609788ff9c802d6527adc6b2c756d5f715 Mon Sep 17 00:00:00 2001
+From 71bcc83993dd1f8f30c3defaece23211c9b73f33 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
diff --git a/meta/recipes-devtools/strace/strace_6.16.bb b/meta/recipes-devtools/strace/strace_6.17.bb
similarity index 93%
rename from meta/recipes-devtools/strace/strace_6.16.bb
rename to meta/recipes-devtools/strace/strace_6.17.bb
index 0552caa2b6..530525fa70 100644
--- a/meta/recipes-devtools/strace/strace_6.16.bb
+++ b/meta/recipes-devtools/strace/strace_6.17.bb
@@ -14,12 +14,12 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
-           file://0001-tests-fix-uio.test-with-musl-libc.patch \
+           file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "
 SRC_URI:append:libc-musl = "\
            file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "
-SRC_URI[sha256sum] = "3d7aee7e4f044b2f67f3d51a8a76eda18076e9fb2774de54ac351d777d4ebffa"
+SRC_URI[sha256sum] = "0a7c7bedc7efc076f3242a0310af2ae63c292a36dd4236f079e88a93e98cb9c0"
 
 inherit autotools github-releases ptest
 
-- 
2.47.1


--===============7194832484497245589==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-strace-upgrade-6.16-6.17.patch"

RnJvbSAwYjU5M2Q4ODljNzJkZGE4M2I0ZGI2ZDIyNzJkNjQ4YzZiYjQyNWZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxODozMzoxOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN0
cmFjZTogdXBncmFkZSA2LjE2IC0+IDYuMTcKCi0tLQogLi4uZ25vcmUtcHdyaXRldi1wd3JpdGU2
NC10ZXN0cy1vbi1tdXNsLnBhdGNoIHwgNjIgKysrKysrKysrKysrKysrKysrKwogLi4udG9jb25m
LW1hY3JvLXRvLWRldGVjdC1sYXJnZWZpbGUtc3VwLnBhdGNoIHwgIDIgKy0KIC4uLjAwMS1zdHJh
Y2UtZml4LXJlcHJvZHVjaWJpbHR5LWlzc3Vlcy5wYXRjaCB8ICAyICstCiAuLi4wMS10ZXN0cy1m
aXgtdWlvLnRlc3Qtd2l0aC1tdXNsLWxpYmMucGF0Y2ggfCAzMCAtLS0tLS0tLS0KIC4uLjAwMi10
ZXN0cy1SZXBsYWNlLW9mZjY0X3Qtd2l0aC1vZmZfdC5wYXRjaCB8ICAyICstCiAuLi4vc3RyYWNl
L3N0cmFjZS9NYWtlZmlsZS1wdGVzdC5wYXRjaCAgICAgICAgfCAgNiArLQogLi4uL3N0cmFjZS9z
dHJhY2UvcHRlc3Qtc3BhY2VzYXZlLnBhdGNoICAgICAgIHwgIDIgKy0KIC4uLi9zdHJhY2Uvc3Ry
YWNlL3NraXAtbG9hZC5wYXRjaCAgICAgICAgICAgICB8IDEzICsrLS0KIC4uLi9zdHJhY2Uvc3Ry
YWNlL3VwZGF0ZS1nYXdrLXBhdGhzLnBhdGNoICAgICB8ICAyICstCiAuLi4vc3RyYWNlL3tzdHJh
Y2VfNi4xNi5iYiA9PiBzdHJhY2VfNi4xNy5iYn0gfCAgNCArLQogMTAgZmlsZXMgY2hhbmdlZCwg
NzcgaW5zZXJ0aW9ucygrKSwgNDggZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9maWxlcy8wMDAxLUlnbm9yZS1wd3JpdGV2LXB3cml0
ZTY0LXRlc3RzLW9uLW11c2wucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAxLXRlc3RzLWZpeC11aW8udGVzdC13aXRoLW11c2wt
bGliYy5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uve3N0cmFjZV82
LjE2LmJiID0+IHN0cmFjZV82LjE3LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9zdHJhY2UvZmlsZXMvMDAwMS1JZ25vcmUtcHdyaXRldi1wd3JpdGU2NC10ZXN0
cy1vbi1tdXNsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9maWxlcy8wMDAx
LUlnbm9yZS1wd3JpdGV2LXB3cml0ZTY0LXRlc3RzLW9uLW11c2wucGF0Y2gKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZDlhYTZiNGYyZgotLS0gL2Rldi9udWxsCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2UvZmlsZXMvMDAwMS1JZ25vcmUtcHdyaXRldi1w
d3JpdGU2NC10ZXN0cy1vbi1tdXNsLnBhdGNoCkBAIC0wLDAgKzEsNjIgQEAKK0Zyb20gMGExYTcx
Njc1YjhjMTQ3YzY5Zjg1NWRmYmNhZTEwNmIwYTdmOTY0NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CitEYXRlOiBNb24sIDE4IEF1
ZyAyMDI1IDIyOjE4OjU4IC0wNzAwCitTdWJqZWN0OiBbUEFUQ0hdIElnbm9yZSBwd3JpdGV2L3B3
cml0ZTY0IHRlc3RzIG9uIG11c2wKKworbXVzbCB1c2VzIHdyYXBwZXJzIGZvciBwd3JpdGV2IGFu
ZCBwd3JpdGU2NCB1c2luZworcHdyaXRldjIgc3lzY2FsbCBbMV0sIGhvd2V2ZXIgdGhlIHRlc3Qg
ZXhlcGN0cyB0aGF0IHRoZQorcHJvZ3JhbSB3aWxsIGNhbGwgcHdyaXRldiBhbmQgcHdyaXRlNjQg
KCBnbGliYyBiZWhhdmlvciApCisKK1RoaXMgY2FuIGJlIGZpeGVkIGlmIHRoZSBmdW5jdGlvbiBj
YWxscyBhcmUgY2hhbmdlZCB0bwordXNlIHN5c2NhbGwoKSBBUEkgZGlyZWN0bHksIGJ1dCB0aGF0
IG5lZWRzIGNoYW5nZSB1cHN0cmVhbSBbMl0KKworSXNzdWUgaXMgcmVwb3J0ZWQgdXBzdHJlYW0g
WzNdCisKK1sxXSBodHRwczovL2dpdC5tdXNsLWxpYmMub3JnL2NnaXQvbXVzbC9jb21taXQvc3Jj
P2lkPTUzNzAwNzBmZGVkNjFiNTY5MTk2NzY0NjczYTRmYzg0NDBhYWM3OWUKK1syXSBodHRwczov
L2dpdGh1Yi5jb20vc3RyYWNlL3N0cmFjZS9wdWxsLzM0NworWzNdIGh0dHBzOi8vZ2l0aHViLmNv
bS9zdHJhY2Uvc3RyYWNlL2lzc3Vlcy8zNDkKKworVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJp
YXRlIFtNdXNsIFNwZWNpZmljXQorU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KKy0tLQorIHRlc3RzL3ByZWFkNjQtcHdyaXRlNjQuZ2VuLnRlc3QgfCAzICsrKwor
IHRlc3RzL3ByZWFkdi1wd3JpdGV2Lmdlbi50ZXN0ICAgfCAzICsrKworIHRlc3RzL3B3cml0ZXYu
Z2VuLnRlc3QgICAgICAgICAgfCAzICsrKworIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspCisKK2RpZmYgLS1naXQgYS90ZXN0cy9wcmVhZDY0LXB3cml0ZTY0Lmdlbi50ZXN0IGIvdGVz
dHMvcHJlYWQ2NC1wd3JpdGU2NC5nZW4udGVzdAoraW5kZXggYjUzZTA2OS4uMGExZTZlNiAxMDA3
NTUKKy0tLSBhL3Rlc3RzL3ByZWFkNjQtcHdyaXRlNjQuZ2VuLnRlc3QKKysrKyBiL3Rlc3RzL3By
ZWFkNjQtcHdyaXRlNjQuZ2VuLnRlc3QKK0BAIC0xLDQgKzEsNyBAQAorICMhL2Jpbi9zaCAtZWZ1
CisgIyBHZW5lcmF0ZWQgYnkgLi90ZXN0cy9nZW5fdGVzdHMuc2ggZnJvbSAuL3Rlc3RzL2dlbl90
ZXN0cy5pbiAocHJlYWQ2NC1wd3JpdGU2NCAtYTIxIC1lcmVhZD0wIC1ld3JpdGU9MSAtZSB0cmFj
ZT1wcmVhZDY0LHB3cml0ZTY0IC1QIHByZWFkNjQtcHdyaXRlNjQtdG1wZmlsZSAtUCAvZGV2L3pl
cm8gLVAgL2Rldi9udWxsKTsgZG8gbm90IGVkaXQuCisgLiAiJHtzcmNkaXI9Ln0vaW5pdC5zaCIK
KysKKytza2lwXyAiVGVzdCBub3QgcG9ydGVkIHRvIG11c2wsIG11c2wgZ2VuZXJhdGVzIHB3cml0
ZXYyIgorKworIHJ1bl9zdHJhY2VfbWF0Y2hfZGlmZiAtYTIxIC1lcmVhZD0wIC1ld3JpdGU9MSAt
ZSB0cmFjZT1wcmVhZDY0LHB3cml0ZTY0IC1QIHByZWFkNjQtcHdyaXRlNjQtdG1wZmlsZSAtUCAv
ZGV2L3plcm8gLVAgL2Rldi9udWxsCitkaWZmIC0tZ2l0IGEvdGVzdHMvcHJlYWR2LXB3cml0ZXYu
Z2VuLnRlc3QgYi90ZXN0cy9wcmVhZHYtcHdyaXRldi5nZW4udGVzdAoraW5kZXggNWVkODI5Ny4u
YjgzZjEyOSAxMDA3NTUKKy0tLSBhL3Rlc3RzL3ByZWFkdi1wd3JpdGV2Lmdlbi50ZXN0CisrKysg
Yi90ZXN0cy9wcmVhZHYtcHdyaXRldi5nZW4udGVzdAorQEAgLTEsNCArMSw3IEBACisgIyEvYmlu
L3NoIC1lZnUKKyAjIEdlbmVyYXRlZCBieSAuL3Rlc3RzL2dlbl90ZXN0cy5zaCBmcm9tIC4vdGVz
dHMvZ2VuX3Rlc3RzLmluIChwcmVhZHYtcHdyaXRldiAtYTE5IC1lcmVhZD0wIC1ld3JpdGU9MSAt
ZSB0cmFjZT1wcmVhZHYscHdyaXRldik7IGRvIG5vdCBlZGl0LgorIC4gIiR7c3JjZGlyPS59L2lu
aXQuc2giCisrCisrc2tpcF8gIlRlc3Qgbm90IHBvcnRlZCB0byBtdXNsLCBtdXNsIGdlbmVyYXRl
cyBwd3JpdGV2MiIKKysKKyBydW5fc3RyYWNlX21hdGNoX2RpZmYgLWExOSAtZXJlYWQ9MCAtZXdy
aXRlPTEgLWUgdHJhY2U9cHJlYWR2LHB3cml0ZXYKK2RpZmYgLS1naXQgYS90ZXN0cy9wd3JpdGV2
Lmdlbi50ZXN0IGIvdGVzdHMvcHdyaXRldi5nZW4udGVzdAoraW5kZXggZTU0ZmQxNS4uNDk5OTgx
NiAxMDA3NTUKKy0tLSBhL3Rlc3RzL3B3cml0ZXYuZ2VuLnRlc3QKKysrKyBiL3Rlc3RzL3B3cml0
ZXYuZ2VuLnRlc3QKK0BAIC0xLDQgKzEsNyBAQAorICMhL2Jpbi9zaCAtZWZ1CisgIyBHZW5lcmF0
ZWQgYnkgLi90ZXN0cy9nZW5fdGVzdHMuc2ggZnJvbSAuL3Rlc3RzL2dlbl90ZXN0cy5pbiAocHdy
aXRldiAtYTIyIC1zNyk7IGRvIG5vdCBlZGl0LgorIC4gIiR7c3JjZGlyPS59L2luaXQuc2giCisr
Cisrc2tpcF8gIlRlc3Qgbm90IHBvcnRlZCB0byBtdXNsLCBtdXNsIGdlbmVyYXRlcyBwd3JpdGV2
MiIKKysKKyBydW5fc3RyYWNlX21hdGNoX2RpZmYgLWEyMiAtczcKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlLzAwMDEtY29uZmlndXJlLVVzZS1hdXRvY29u
Zi1tYWNyby10by1kZXRlY3QtbGFyZ2VmaWxlLXN1cC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9zdHJhY2Uvc3RyYWNlLzAwMDEtY29uZmlndXJlLVVzZS1hdXRvY29uZi1tYWNyby10by1k
ZXRlY3QtbGFyZ2VmaWxlLXN1cC5wYXRjaAppbmRleCA0Njg5NGNkOWQwLi4xNzUwZjM0NTE4IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAxLWNvbmZp
Z3VyZS1Vc2UtYXV0b2NvbmYtbWFjcm8tdG8tZGV0ZWN0LWxhcmdlZmlsZS1zdXAucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvMDAwMS1jb25maWd1cmUtVXNl
LWF1dG9jb25mLW1hY3JvLXRvLWRldGVjdC1sYXJnZWZpbGUtc3VwLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSAyNjc5ODk1NTkzNzBhOWYzNDY0NmJmOGEwMjAwMTc1NWJmNjRmYjI1IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0YzcxMTJmMzZhNzBkMzAzNGM1ODNhYjQ1MDU4NDkx
MTI5MTExNTg1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTU6NTQ6MjcgLTA4MDAKIFN1
YmplY3Q6IFtQQVRDSF0gY29uZmlndXJlOiBVc2UgYXV0b2NvbmYgbWFjcm8gdG8gZGV0ZWN0IGxh
cmdlZmlsZSBzdXBwb3J0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNl
L3N0cmFjZS8wMDAxLXN0cmFjZS1maXgtcmVwcm9kdWNpYmlsdHktaXNzdWVzLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvMDAwMS1zdHJhY2UtZml4LXJlcHJvZHVj
aWJpbHR5LWlzc3Vlcy5wYXRjaAppbmRleCBlZTM3OTY4OGJmLi5jNjMzNTMxZjQ0IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAxLXN0cmFjZS1maXgt
cmVwcm9kdWNpYmlsdHktaXNzdWVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9z
dHJhY2Uvc3RyYWNlLzAwMDEtc3RyYWNlLWZpeC1yZXByb2R1Y2liaWx0eS1pc3N1ZXMucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDU5MDc3ZjM5Y2NlNDk5ZDExZGU1YjBhOWMyM2M5ZGVkNjdk
ZGIyMmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQwYmJiZjE3MGY3MDc0NmIyYjhl
OWJiNjEyOWIwYjk0NDFhMWM0YjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKZXJl
bXkgUHVobG1hbiA8anB1aGxtYW5AbXZpc3RhLmNvbT4KIERhdGU6IFdlZCwgMTEgTWFyIDIwMjAg
MTk6NTY6NTUgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gc3RyYWNlOiBmaXggcmVwcm9kdWNpYmls
dHkgaXNzdWVzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFj
ZS8wMDAxLXRlc3RzLWZpeC11aW8udGVzdC13aXRoLW11c2wtbGliYy5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlLzAwMDEtdGVzdHMtZml4LXVpby50ZXN0LXdpdGgt
bXVzbC1saWJjLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBhODc5Y2E1MGNh
Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlLzAw
MDEtdGVzdHMtZml4LXVpby50ZXN0LXdpdGgtbXVzbC1saWJjLnBhdGNoCisrKyAvZGV2L251bGwK
QEAgLTEsMzAgKzAsMCBAQAotRnJvbSA3ZmFkZjY5NDc3NjFjYzUyNDhhYTRhMzc2YmI5NTE3NDgx
ZGJhYTUyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogR3lvcmd5IFNhcnZhcmkgPHNr
YW5kaWdyYXVuQGdtYWlsLmNvbT4KLURhdGU6IFR1ZSwgMTIgQXVnIDIwMjUgMjA6MDI6MzEgKzAy
MDAKLVN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IGZpeCB1aW8udGVzdCB3aXRoIG11c2wtbGliYwot
Ci1tdXNsLWxpYmMgaGFuZGxlcyB0aGUgcHdyaXRlIGNhbGxzIGRpZmZlcmVudGx5IHRoYW4gZ2xp
YmMsIG1ha2luZwotdGhlIHVpbyB0ZXN0IGZhaWwuICBVc2luZyBnbGliYywgdGhlcmUgYXJlIHNl
cGFyYXRlZCBwd3JpdGUgYW5kIHB3cml0ZXYKLWNhbGxzLCBob3dldmVyIG11c2wgdXNlcyBvbmx5
IHB3cml0ZXYyIGZvciBib3RoIHB3cml0ZSBhbmQgcHdyaXRldi4KLQotVG8gYWNjb3VudCB0byB0
aGlzIGRpZmZlcmVuY2UsIG1vZGlmeSB0aGUgZXhwZWN0ZWQgbWF0Y2hpbmcgcmVnZXhwCi10byBh
bHNvIG1hdGNoIHRoZSBtdXNsIG91dHB1dCAoYXBwZW5kIGl0IHdpdGggYW4gT1IpLgotCi1VcHN0
cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20vc3RyYWNlL3N0cmFjZS9w
dWxsLzM0N10KLVNpZ25lZC1vZmYtYnk6IEd5b3JneSBTYXJ2YXJpIDxza2FuZGlncmF1bkBnbWFp
bC5jb20+Ci1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0t
Ci0gdGVzdHMvdWlvLmV4cGVjdGVkIHwgNCArKy0tCi0gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL3Rlc3RzL3Vpby5leHBlY3Rl
ZCBiL3Rlc3RzL3Vpby5leHBlY3RlZAotaW5kZXggOThkNWMwNi4uMmE3MTJhMSAxMDA2NDQKLS0t
LSBhL3Rlc3RzL3Vpby5leHBlY3RlZAotKysrIGIvdGVzdHMvdWlvLmV4cGVjdGVkCi1AQCAtMSw0
ICsxLDQgQEAKLSBwcmVhZCg2NCk/XCgwLCAiXFwwXFwwXFwwXFwwIiwgNCwgMTAwNDIxMTM3OTU3
MDA2NTEzNVwpICs9IDQKLSBwcmVhZHZcKDAsIFxbXHtpb3ZfYmFzZT0iXFwwXFwwXFwwXFwwIiwg
aW92X2xlbj00XH1cXSwgMSwgMTAwNDIxMTM3OTU3MDA2NTEzNVwpICs9IDQKLS1wd3JpdGUoNjQp
P1woMCwgIlxcMFxcMFxcMFxcMCIsIDQsIDEwMDQyMTEzNzk1NzAwNjUxMzVcKSArPSA0Ci0tcHdy
aXRldlwoMCwgXFtce2lvdl9iYXNlPSJcXDBcXDBcXDBcXDAiLCBpb3ZfbGVuPTRcfVxdLCAxLCAx
MDA0MjExMzc5NTcwMDY1MTM1XCkgKz0gNAotK3B3cml0ZSg2NCk/XCgwLCAiXFwwXFwwXFwwXFww
IiwgNCwgMTAwNDIxMTM3OTU3MDA2NTEzNVwpICs9IDR8cHdyaXRldjJcKDAsIFxbXHtpb3ZfYmFz
ZT0iXFwwXFwwXFwwXFwwIiwgaW92X2xlbj00fV0sIDEsIDEwMDQyMTEzNzk1NzAwNjUxMzUsIFJX
Rl9OT0FQUEVORFwpICs9IDQKLStwd3JpdGV2XCgwLCBcW1x7aW92X2Jhc2U9IlxcMFxcMFxcMFxc
MCIsIGlvdl9sZW49NFx9XF0sIDEsIDEwMDQyMTEzNzk1NzAwNjUxMzVcKSArPSA0fHB3cml0ZXYy
XCgwLCBcW1x7aW92X2Jhc2U9IlxcMFxcMFxcMFxcMCIsIGlvdl9sZW49NH1dLCAxLCAxMDA0MjEx
Mzc5NTcwMDY1MTM1LCBSV0ZfTk9BUFBFTkRcKSArPSA0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAyLXRlc3RzLVJlcGxhY2Utb2ZmNjRfdC13aXRo
LW9mZl90LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvMDAwMi10
ZXN0cy1SZXBsYWNlLW9mZjY0X3Qtd2l0aC1vZmZfdC5wYXRjaAppbmRleCBjYTkwOWQ1NzNkLi4w
OTNjZWRjMjMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFj
ZS8wMDAyLXRlc3RzLVJlcGxhY2Utb2ZmNjRfdC13aXRoLW9mZl90LnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlLzAwMDItdGVzdHMtUmVwbGFjZS1vZmY2NF90
LXdpdGgtb2ZmX3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDY5MDgzZTkzZTkyNDM3ZThk
OWQ0MjI1ZmNhNzFhMDUzOTA2YTRhZjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY0
ODdlMmEwZjE1NjhjOTg5YTAyOTRmNDMzNWYzZGM5YTYwMTJkOGQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAx
NSBEZWMgMjAyMiAxNTo1NjoxMyAtMDgwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0czogUmVwbGFj
ZSBvZmY2NF90IHdpdGggb2ZmX3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9z
dHJhY2Uvc3RyYWNlL01ha2VmaWxlLXB0ZXN0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3N0cmFjZS9zdHJhY2UvTWFrZWZpbGUtcHRlc3QucGF0Y2gKaW5kZXggMjEyZWVhODYxOC4uNjA1
NjJhZTdkOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2Uv
TWFrZWZpbGUtcHRlc3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9z
dHJhY2UvTWFrZWZpbGUtcHRlc3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDlkNDBkMjkz
ZmY3M2RlYTczNGYxMzUzYzM1NGY1MWU1MTk5MmE4MTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDZkNzcyMDNmYjIyZTA3NjkxOGRjOTgzZGI0N2I0OGIyOGNiYmMwNmQgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBHYWJyaWVsIEJhcmJ1IDxnYWJyaWVsLmJhcmJ1QGVuZWEu
Y29tPgogRGF0ZTogVGh1LCAyNSBKdWwgMjAxMyAxNToyODozMyArMDIwMAogU3ViamVjdDogW1BB
VENIXSBzdHJhY2U6IEFkZCBwdGVzdApAQCAtMTMsNyArMTMsNyBAQCBTaWduZWQtb2ZmLWJ5OiBB
bnVqIE1pdHRhbCA8YW51ai5taXR0YWxAaW50ZWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyMCBp
bnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS90ZXN0cy9NYWtlZmlsZS5hbSBiL3Rlc3RzL01h
a2VmaWxlLmFtCi1pbmRleCA2ZTk0MmIxLi43YTcwN2Q3IDEwMDY0NAoraW5kZXggZDc2YjVjNi4u
ZDRmYzIwNiAxMDA2NDQKIC0tLSBhL3Rlc3RzL01ha2VmaWxlLmFtCiArKysgYi90ZXN0cy9NYWtl
ZmlsZS5hbQogQEAgLTE4LDYgKzE4LDcgQEAgU0laRU9GX0xPTkcgPSBAU0laRU9GX0xPTkdACkBA
IC0yNCw3ICsyNCw3IEBAIGluZGV4IDZlOTQyYjEuLjdhNzA3ZDcgMTAwNjQ0CiAgQU1fQ0ZMQUdT
ID0gJChXQVJOX0NGTEFHUykgJChURVNUX1dBUk5fQ0ZMQUdTKQogIGJ1bmRsZWRfQ1BQRkxBR1Mg
PQogIGlmIFVTRV9CVU5ETEVEX0hFQURFUlMKLUBAIC05MzcsMyArOTM4LDIyIEBAIEJVSUxUX1NP
VVJDRVMgPSBrc3lzZW50LmgKK0BAIC05MzksMyArOTQwLDIyIEBAIEJVSUxUX1NPVVJDRVMgPSBr
c3lzZW50LmgKICBDTEVBTkZJTEVTID0ga3N5c2VudC5oCiAgCiAgaW5jbHVkZSAuLi9zcmMvc2Nu
by5hbQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvcHRl
c3Qtc3BhY2VzYXZlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2Uv
cHRlc3Qtc3BhY2VzYXZlLnBhdGNoCmluZGV4IDY2MWVkMmM3YmIuLjNlNjZiMTU4NTAgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlL3B0ZXN0LXNwYWNlc2F2
ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS9wdGVzdC1z
cGFjZXNhdmUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDhiZDgyNzMzOWFlNzJlYWI5OWRj
OWFkNmE2OGIwYWU5OGU1YmJiNDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDc2YzIz
ZTAxODYwODQyMTYyNGQxZTAwYjllMzg3YjI2NWU2ZGE0NjkgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9u
Lm9yZz4KIERhdGU6IFdlZCwgMjkgTWF5IDIwMTkgMDA6MTA6MzIgKzAxMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gc3RyYWNlOiBUd2VhayBwdGVzdCBkaXNrIHNwYWNlIG1hbmFnZW1lbnQKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlL3NraXAtbG9hZC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlL3NraXAtbG9hZC5wYXRjaAppbmRl
eCAzNDk0OGZkMmJhLi4yMDUzNWZlMDA1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvc3RyYWNlL3N0cmFjZS9za2lwLWxvYWQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3N0cmFjZS9zdHJhY2Uvc2tpcC1sb2FkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0
NmVjZWVmYjNiZDE4NDM1NGNkYWYwZmQzZGZmNmYyYWQ5NzlhYWQ5IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA0MDI0NGMyN2RlNmI4ZmEwZjZmNjY4NWQyMGU2NDMwOTg4NGU3M2JmIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFy
bS5jb20+CiBEYXRlOiBTYXQsIDMwIEF1ZyAyMDI1IDAwOjQ3OjAzICswMjAwCiBTdWJqZWN0OiBb
UEFUQ0hdIHN0cmFjZTogc2tpcCBhIG51bWJlciBvZiBsb2FkLXNlbnNpdGl2ZSB0ZXN0cwpAQCAt
MTcsNyArMTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBPc2FtYSBBYmRlbGthZGVyIDxvc2FtYS5hYmRl
bGthZGVyQGdtYWlsLmNvbT4KICA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQogCiBk
aWZmIC0tZ2l0IGEvdGVzdHMvY2xvY2tfbmFub3NsZWVwLmdlbi50ZXN0IGIvdGVzdHMvY2xvY2tf
bmFub3NsZWVwLmdlbi50ZXN0Ci1pbmRleCA3YTYwMjViYmQuLmYwZTZkYmI3MyAxMDA3NTUKK2lu
ZGV4IDdhNjAyNWIuLmYwZTZkYmIgMTAwNzU1CiAtLS0gYS90ZXN0cy9jbG9ja19uYW5vc2xlZXAu
Z2VuLnRlc3QKICsrKyBiL3Rlc3RzL2Nsb2NrX25hbm9zbGVlcC5nZW4udGVzdAogQEAgLTEsNCAr
MSw1IEBACkBAIC0yNyw3ICsyNyw3IEBAIGluZGV4IDdhNjAyNWJiZC4uZjBlNmRiYjczIDEwMDc1
NQogK3NraXBfICJUZXN0IG5vdCByZWxpYWJsZSB1bmRlciBsb2FkIgogIHJ1bl9zdHJhY2VfbWF0
Y2hfZGlmZiAtZSB0cmFjZT1jbG9ja19uYW5vc2xlZXAsY2xvY2tfZ2V0dGltZQogZGlmZiAtLWdp
dCBhL3Rlc3RzL2RlbGF5LnRlc3QgYi90ZXN0cy9kZWxheS50ZXN0Ci1pbmRleCBmNzRlMjdmMWUu
LjE1MTBjNzY0NyAxMDA3NTUKK2luZGV4IGY3NGUyN2YuLjE1MTBjNzYgMTAwNzU1CiAtLS0gYS90
ZXN0cy9kZWxheS50ZXN0CiArKysgYi90ZXN0cy9kZWxheS50ZXN0CiBAQCAtOSw2ICs5LDcgQEAK
QEAgLTM5LDcgKzM5LDcgQEAgaW5kZXggZjc0ZTI3ZjFlLi4xNTEwYzc2NDcgMTAwNzU1CiAgCVsg
LW4gIiRkZW50ZXIiIF0gfHwgY29udGludWUKICAKIGRpZmYgLS1naXQgYS90ZXN0cy9uYW5vc2xl
ZXAuZ2VuLnRlc3QgYi90ZXN0cy9uYW5vc2xlZXAuZ2VuLnRlc3QKLWluZGV4IDQxOTI4ZGVkOC4u
ZjhhODdjYjhlIDEwMDc1NQoraW5kZXggNDE5MjhkZS4uZjhhODdjYiAxMDA3NTUKIC0tLSBhL3Rl
c3RzL25hbm9zbGVlcC5nZW4udGVzdAogKysrIGIvdGVzdHMvbmFub3NsZWVwLmdlbi50ZXN0CiBA
QCAtMSw0ICsxLDUgQEAKQEAgLTQ5LDcgKzQ5LDcgQEAgaW5kZXggNDE5MjhkZWQ4Li5mOGE4N2Ni
OGUgMTAwNzU1CiArc2tpcF8gIlRlc3Qgbm90IHJlbGlhYmxlIHVuZGVyIGxvYWQiCiAgcnVuX3N0
cmFjZV9tYXRjaF9kaWZmIC1hMjAgCiBkaWZmIC0tZ2l0IGEvdGVzdHMvc3RyYWNlLXIudGVzdCBi
L3Rlc3RzL3N0cmFjZS1yLnRlc3QKLWluZGV4IDgyOTk3Mzc1My4uZTg5NDIzNDg1IDEwMDc1NQor
aW5kZXggODI5OTczNy4uZTg5NDIzNCAxMDA3NTUKIC0tLSBhL3Rlc3RzL3N0cmFjZS1yLnRlc3QK
ICsrKyBiL3Rlc3RzL3N0cmFjZS1yLnRlc3QKIEBAIC05LDYgKzksNyBAQApAQCAtNjAsNiArNjAs
MyBAQCBpbmRleCA4Mjk5NzM3NTMuLmU4OTQyMzQ4NSAxMDA3NTUKICByX29wdD0iJHsxOi0tcn0i
CiAgCiAgcnVuX3Byb2cgLi4vc2xlZXAgMAotLS0gCi0yLjQzLjAKLQpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvdXBkYXRlLWdhd2stcGF0aHMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS91cGRhdGUtZ2F3ay1wYXRocy5w
YXRjaAppbmRleCAxOTNhNDgxOWVmLi5iZjRhOGNkMTIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS91cGRhdGUtZ2F3ay1wYXRocy5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS91cGRhdGUtZ2F3ay1wYXRocy5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzExMzgwNjA5Nzg4ZmY5YzgwMmQ2NTI3YWRjNmIyYzc1
NmQ1ZjcxNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzFiY2M4Mzk5M2RkMWY4ZjMw
YzNkZWZhZWNlMjMyMTFjOWI3M2YzMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFu
ZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDE4IEphbiAyMDE2
IDExOjAxOjAwIC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHVwZGF0ZSBnYXdrIHBhdGhzLCAvYmlu
L2dhd2sgLT4gL3Vzci9iaW4vZ2F3awpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3N0cmFjZS9zdHJhY2VfNi4xNi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3Ry
YWNlXzYuMTcuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3N0cmFjZS9zdHJhY2VfNi4xNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3N0cmFjZS9zdHJhY2VfNi4xNy5iYgppbmRleCAwNTUyY2FhMmI2Li41MzA1MjVmYTcw
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZV82LjE2LmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzYuMTcuYmIKQEAgLTE0
LDEyICsxNCwxMiBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC92JHtQ
Vn0vc3RyYWNlLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly9za2lwLWxvYWQucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1jb25maWd1cmUtVXNlLWF1dG9jb25mLW1hY3Jv
LXRvLWRldGVjdC1sYXJnZWZpbGUtc3VwLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDIt
dGVzdHMtUmVwbGFjZS1vZmY2NF90LXdpdGgtb2ZmX3QucGF0Y2ggXAotICAgICAgICAgICBmaWxl
Oi8vMDAwMS10ZXN0cy1maXgtdWlvLnRlc3Qtd2l0aC1tdXNsLWxpYmMucGF0Y2ggXAorICAgICAg
ICAgICBmaWxlOi8vMDAwMS1JZ25vcmUtcHdyaXRldi1wd3JpdGU2NC10ZXN0cy1vbi1tdXNsLnBh
dGNoIFwKICAgICAgICAgICAgIgogU1JDX1VSSTphcHBlbmQ6bGliYy1tdXNsID0gIlwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtSWdub3JlLXB3cml0ZXYtcHdyaXRlNjQtdGVzdHMtb24tbXVzbC5w
YXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzZDdhZWU3ZTRmMDQ0
YjJmNjdmM2Q1MWE4YTc2ZWRhMTgwNzZlOWZiMjc3NGRlNTRhYzM1MWQ3NzdkNGViZmZhIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjBhN2M3YmVkYzdlZmMwNzZmMzI0MmEwMzEwYWYyYWU2M2MyOTJh
MzZkZDQyMzZmMDc5ZTg4YTkzZTk4Y2I5YzAiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGdpdGh1Yi1y
ZWxlYXNlcyBwdGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============7194832484497245589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/strace/strace-ptest: FILELIST: added "/usr/lib/strace/ptest/tests/file_getattr-y /usr/lib/strace/ptest/tests/file_setattr-y /usr/lib/strace/ptest/tests/file_xetattr-common.c /usr/lib/strace/ptest/tests/file_setattr-Xverbose /usr/lib/strace/ptest/tests/file_setattr-Xraw /usr/lib/strace/ptest/tests/file_getattr-success-Xverbose /usr/lib/strace/ptest/tests/file_getattr-success-Xraw /usr/lib/strace/ptest/tests/file_getattr-yy.gen.test /usr/lib/strace/ptest/tests/file_getattr-success.gen.test /usr/lib/strace/ptest/tests/file_setattr-Xabbrev.gen.test /usr/lib/strace/ptest/tests/file_getattr-success-Xraw.gen.test /usr/lib/strace/ptest/tests/file_getattr-P /usr/lib/strace/ptest/tests/file_setattr-P /usr/lib/strace/ptest/tests/file_getattr-yy /usr/lib/strace/ptest/tests/file_setattr-Xraw.gen.test /usr/lib/strace/ptest/tests/file_getattr-success-Xabbrev /usr/lib/strace/ptest/tests/file_getattr-success /usr/lib/strace/ptest/tests/file_setattr-Xverbose.gen.test /usr
 /lib/strace/ptest/tests/file_setattr-y.gen.test /usr/lib/strace/ptest/tests/file_getattr-y.gen.test /usr/lib/strace/ptest/tests/file_getattr-P.gen.test /usr/lib/strace/ptest/tests/file_setattr-P.gen.test /usr/lib/strace/ptest/tests/file_setattr.gen.test /usr/lib/strace/ptest/tests/file_getattr.gen.test /usr/lib/strace/ptest/tests/file_getattr /usr/lib/strace/ptest/tests/file_setattr /usr/lib/strace/ptest/tests/file_setattr-Xabbrev /usr/lib/strace/ptest/tests/file_getattr-success-Xabbrev.gen.test /usr/lib/strace/ptest/tests/file_getattr-success-Xverbose.gen.test /usr/lib/strace/ptest/tests/file_setattr-yy.gen.test /usr/lib/strace/ptest/tests/file_setattr-yy /usr/lib/strace/ptest/tests/test_fs_xflags.h"

--===============7194832484497245589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/strace: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/strace: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/strace: SRC_URI changed from "https://github.com/strace/strace/releases//download/v6.16/strace-6.16.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch file://0002-tests-Replace-off64_t-with-off_t.patch file://0001-tests-fix-uio.test-with-musl-libc.patch" to "https://github.com/strace/strace/releases//download/v6.17/strace-6.17.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch file://0002-tests-Replace-off64_t-with-off_t.patch file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch"
packages/x86-64-v3-poky-linux/strace/strace-dbg: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/strace/strace-dbg: FILELIST: added "/usr/lib/strace/ptest/tests/.debug/file_setattr-y /usr/lib/strace/ptest/tests/.debug/file_setattr-Xverbose /usr/lib/strace/ptest/tests/.debug/file_getattr-P /usr/lib/strace/ptest/tests/.debug/file_setattr /usr/lib/strace/ptest/tests/.debug/file_setattr-P /usr/lib/strace/ptest/tests/.debug/file_getattr-success-Xraw /usr/lib/strace/ptest/tests/.debug/file_getattr-success-Xabbrev /usr/lib/strace/ptest/tests/.debug/file_getattr-y /usr/lib/strace/ptest/tests/.debug/file_getattr-success-Xverbose /usr/lib/strace/ptest/tests/.debug/file_setattr-Xabbrev /usr/lib/strace/ptest/tests/.debug/file_setattr-yy /usr/lib/strace/ptest/tests/.debug/file_getattr /usr/lib/strace/ptest/tests/.debug/file_getattr-success /usr/lib/strace/ptest/tests/.debug/file_getattr-yy /usr/lib/strace/ptest/tests/.debug/file_setattr-Xraw"
packages/x86-64-v3-poky-linux/strace/strace-dbg: PKGSIZE changed from 72916200 to 73851488 (+1%)
packages/x86-64-v3-poky-linux/strace/strace-dbg: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/strace/strace-dev: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/strace/strace-dev: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/strace/strace-doc: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/strace/strace-doc: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/strace/strace-locale: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/strace/strace-locale: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/strace/strace-ptest: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/strace/strace-ptest: FILELIST: added "/usr/lib/strace/ptest/tests/file_setattr-Xabbrev /usr/lib/strace/ptest/tests/file_setattr-Xverbose /usr/lib/strace/ptest/tests/file_getattr-success-Xraw.gen.test /usr/lib/strace/ptest/tests/file_getattr-success /usr/lib/strace/ptest/tests/file_xetattr-common.c /usr/lib/strace/ptest/tests/file_setattr-y /usr/lib/strace/ptest/tests/file_getattr-y /usr/lib/strace/ptest/tests/file_getattr-success-Xraw /usr/lib/strace/ptest/tests/file_getattr-success.gen.test /usr/lib/strace/ptest/tests/test_fs_xflags.h /usr/lib/strace/ptest/tests/file_setattr-yy /usr/lib/strace/ptest/tests/file_getattr-yy /usr/lib/strace/ptest/tests/file_getattr-success-Xverbose /usr/lib/strace/ptest/tests/file_setattr-P /usr/lib/strace/ptest/tests/file_getattr-P /usr/lib/strace/ptest/tests/file_getattr /usr/lib/strace/ptest/tests/file_getattr-success-Xabbrev.gen.test /usr/lib/strace/ptest/tests/file_setattr-Xraw.gen.test /usr/lib/strace/ptest/tests/file
 _setattr-Xverbose.gen.test /usr/lib/strace/ptest/tests/file_setattr /usr/lib/strace/ptest/tests/file_setattr-Xraw /usr/lib/strace/ptest/tests/file_getattr-y.gen.test /usr/lib/strace/ptest/tests/file_setattr-y.gen.test /usr/lib/strace/ptest/tests/file_setattr-P.gen.test /usr/lib/strace/ptest/tests/file_getattr-P.gen.test /usr/lib/strace/ptest/tests/file_setattr.gen.test /usr/lib/strace/ptest/tests/file_getattr.gen.test /usr/lib/strace/ptest/tests/file_getattr-success-Xabbrev /usr/lib/strace/ptest/tests/file_setattr-yy.gen.test /usr/lib/strace/ptest/tests/file_getattr-success-Xverbose.gen.test /usr/lib/strace/ptest/tests/file_getattr-yy.gen.test /usr/lib/strace/ptest/tests/file_setattr-Xabbrev.gen.test"
packages/x86-64-v3-poky-linux/strace/strace-ptest: PKGSIZE changed from 34707216 to 35094737 (+1%)
packages/x86-64-v3-poky-linux/strace/strace-ptest: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/strace/strace-src: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/strace/strace-src: PKGSIZE changed from 32990 to 33088 (+0%)
packages/x86-64-v3-poky-linux/strace/strace-src: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/strace/strace-staticdev: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/strace/strace-staticdev: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/strace/strace: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/strace/strace: PKGSIZE changed from 2011419 to 2015515 (+0%)
packages/x86-64-v3-poky-linux/strace/strace: PKGV changed from 6.16 [default] to 6.17 [default]

--===============7194832484497245589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (0 cached, 948 parsed). 1946 targets, 54 skipped, 0 masked, 0 errors.
Removing 46 recipes from the qemux86_64 sysroot...done.
Removing 21 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-61fc54ba346d422e42217adaf6898345d554c25e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:61fc54ba346d422e42217adaf6898345d554c25e"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 353 Local 338 Mirrors 0 Missed 15 Current 245 (95% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 246 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 247 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 251 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_package_qa_setscene)
NOTE: Running setscene task 264 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 267 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 268 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 273 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 277 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 284 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 287 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 301 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 307 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 308 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 309 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe grep-3.12-r0: task do_package_qa_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe grep-3.12-r0: task do_package_write_deb_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_qa_setscene: Started
NOTE: recipe grep-3.12-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 311 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 318 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_deb_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 321 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 322 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_ipk_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 326 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.12-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 329 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package_qa_setscene)
NOTE: Running setscene task 330 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 332 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 335 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 339 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 344 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 345 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 346 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 347 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package_qa_setscene: Started
NOTE: recipe grep-3.12-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 348 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 349 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 350 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 355 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/strace/strace_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe grep-3.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.12-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 360 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 367 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_packagedata_setscene)
NOTE: recipe grep-3.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 368 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe strace-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe strace-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 379 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe grep-3.12-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 381 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 383 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 395 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 398 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 405 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 407 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 417 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 419 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe grep-3.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_recipe_qa_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 857 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/strace/strace_6.17.bb:do_fetch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 436 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 442 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 444 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 447 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 448 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 462 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe strace-6.17-r0: task do_fetch: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 466 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 475 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe strace-6.17-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 930 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/strace/strace_6.17.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 937 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 486 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 495 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe strace-6.17-r0: task do_unpack: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1039 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1040 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 522 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1107 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1120 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1121 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1122 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe strace-6.17-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1129 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/strace/strace_6.17.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe strace-6.17-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1130 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 568 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 577 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1160 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 590 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 749c72d934358c3867454d5d1a0c0db0e254adddd72bcc5e15ab46c0adb4982e to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'cbbe59ce558621b9094f1c67a0216a6d8c1192c62705f8d1c0fe326583913010', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '749c72d934358c3867454d5d1a0c0db0e254adddd72bcc5e15ab46c0adb4982e'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed cbbe59ce558621b9094f1c67a0216a6d8c1192c62705f8d1c0fe326583913010 -> 749c72d934358c3867454d5d1a0c0db0e254adddd72bcc5e15ab46c0adb4982e as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 597 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1375 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/strace/strace_6.17.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1575 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/strace/strace_6.17.bb:do_collect_spdx_deps)
NOTE: recipe strace-6.17-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-6.17-r0: task do_collect_spdx_deps: Started
NOTE: recipe strace-6.17-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe strace-6.17-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe strace-6.17-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1645 tasks of which 1631 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105183304.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105183304.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/strace/strace_6.17.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/strace/6.17/temp/log.do_patch.2041987
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: strace-6.17-r0 do_patch: Applying patch '0001-Ignore-pwritev-pwrite64-tests-on-musl.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/strace/6.17/sources/strace-6.17'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/strace/6.17/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch 0001-Ignore-pwritev-pwrite64-tests-on-musl.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/strace/6.17/temp/log.do_patch.2041987
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/strace/strace_6.17.bb:do_patch) failed with exit code '1'

--===============7194832484497245589==--

