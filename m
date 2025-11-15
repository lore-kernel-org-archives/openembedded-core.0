Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E2BCED27C
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:04 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12115.1763224714840444339
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=myEv9+2T;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Kl9kixJs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a8862608f-581c1dcf-be49-4fdb-a00c-6f2e13c1f8a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224740;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yk7qj4mpIA5qHHUPFeDQv/lZ5r9wbb2yLlOY3Vboe84=;
	b=myEv9+2TF6aPWpr+HBJRNk0jfUw6enDIhX7ooaGdvv5J/c4G8CBH1eXjh20ER5WX
	j2u6eWGp3ZoOI4Kvo7r90wPO7xVfwRsN+X5VOcCeknlYuhRSA/chPi9YUijnL07ICQG
	Ahno6oot3TmhEQRX5QXpZMi+9vLAEsFTLp8TmWZY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224740;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yk7qj4mpIA5qHHUPFeDQv/lZ5r9wbb2yLlOY3Vboe84=;
	b=Kl9kixJsg07K/0CFO98yxfkUTFPR6DuH+Pk084JPsZX3XIZCMi+ywp8XRCzlrpQc
	fia5DdnChH1ASHcX4yAneug0xPzpnjgRy48E2ZDG8oh34lAqZHSBWPcoCk+brIrcCWE
	TQLaQjrR8YfH9NymvPx9rCOz0LCnmWeVKiBx5IGU=
Content-Type: multipart/mixed; boundary="===============0226843606313998996=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] strace: upgrading to 6.17 FAILED
Message-ID: <0101019a8862608f-581c1dcf-be49-4fdb-a00c-6f2e13c1f8a2-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226395

--===============0226843606313998996==
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
From 8b41f4597df96293f9d2d4a3cb3481a8a65d15b4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 12:06:07 +0000
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
index 0000000000..78e9c7060f
--- /dev/null
+++ b/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
@@ -0,0 +1,62 @@
+From b20fea575e0412ddc7ce0d3a4eb1560177186f54 Mon Sep 17 00:00:00 2001
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
index 46894cd9d0..0179d2a954 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 267989559370a9f34646bf8a02001755bf64fb25 Mon Sep 17 00:00:00 2001
+From 4ffab5cd21bc1c4d7f3edfb716506d6c3a64a2e6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:54:27 -0800
 Subject: [PATCH] configure: Use autoconf macro to detect largefile support
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
index ee379688bf..efb0c16b8c 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
@@ -1,4 +1,4 @@
-From 59077f39cce499d11de5b0a9c23c9ded67ddb22e Mon Sep 17 00:00:00 2001
+From 119fa0c8e9c5ecd5ac5da776e4fa419ca637940a Mon Sep 17 00:00:00 2001
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
index ca909d573d..812b254225 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -1,4 +1,4 @@
-From 69083e93e92437e8d9d4225fca71a053906a4af0 Mon Sep 17 00:00:00 2001
+From 92733e287720d299c3638db9efafe3122fd1c59a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:56:13 -0800
 Subject: [PATCH] tests: Replace off64_t with off_t
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index 212eea8618..faee798b19 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 9d40d293ff73dea734f1353c354f51e51992a813 Mon Sep 17 00:00:00 2001
+From 0f8ca1e7fa5f47608619272491e7d98b7f9d7c10 Mon Sep 17 00:00:00 2001
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
index 661ed2c7bb..0b2347e103 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From 8bd827339ae72eab99dc9ad6a68b0ae98e5bbb49 Mon Sep 17 00:00:00 2001
+From 0cdbaabe764be7bc55a4a9d394161a297176559c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 29 May 2019 00:10:32 +0100
 Subject: [PATCH] strace: Tweak ptest disk space management
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/recipes-devtools/strace/strace/skip-load.patch
index 34948fd2ba..d8b5ac2b97 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,4 +1,4 @@
-From 46eceefb3bd184354cdaf0fd3dff6f2ad979aad9 Mon Sep 17 00:00:00 2001
+From 042d8e0033e4311587de7dd294b780348067cec3 Mon Sep 17 00:00:00 2001
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
index 193a4819ef..1168251299 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From c11380609788ff9c802d6527adc6b2c756d5f715 Mon Sep 17 00:00:00 2001
+From 6beb78ee83b9e8f7bf6145ba083a83e22a666190 Mon Sep 17 00:00:00 2001
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


--===============0226843606313998996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/strace: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/strace: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/strace: SRC_URI changed from "https://github.com/strace/strace/releases//download/v6.16/strace-6.16.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch file://0002-tests-Replace-off64_t-with-off_t.patch file://0001-tests-fix-uio.test-with-musl-libc.patch" to "https://github.com/strace/strace/releases//download/v6.17/strace-6.17.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch file://0002-tests-Replace-off64_t-with-off_t.patch file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch"
packages/x86-64-v3-poky-linux/strace/strace-dbg: FILELIST: added "/usr/lib/strace/ptest/tests/.debug/file_setattr-y /usr/lib/strace/ptest/tests/.debug/file_setattr-Xabbrev /usr/lib/strace/ptest/tests/.debug/file_getattr-success-Xabbrev /usr/lib/strace/ptest/tests/.debug/file_getattr /usr/lib/strace/ptest/tests/.debug/file_setattr-P /usr/lib/strace/ptest/tests/.debug/file_setattr /usr/lib/strace/ptest/tests/.debug/file_setattr-yy /usr/lib/strace/ptest/tests/.debug/file_getattr-yy /usr/lib/strace/ptest/tests/.debug/file_setattr-Xraw /usr/lib/strace/ptest/tests/.debug/file_getattr-P /usr/lib/strace/ptest/tests/.debug/file_getattr-success /usr/lib/strace/ptest/tests/.debug/file_getattr-success-Xraw /usr/lib/strace/ptest/tests/.debug/file_setattr-Xverbose /usr/lib/strace/ptest/tests/.debug/file_getattr-success-Xverbose /usr/lib/strace/ptest/tests/.debug/file_getattr-y"
packages/x86-64-v3-poky-linux/strace/strace-dbg: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/strace/strace-dbg: PKGSIZE changed from 72916200 to 73851488 (+1%)
packages/x86-64-v3-poky-linux/strace/strace-dbg: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/strace/strace-dev: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/strace/strace-dev: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/strace/strace-doc: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/strace/strace-doc: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/strace/strace-locale: PV changed from "6.16" to "6.17"
packages/x86-64-v3-poky-linux/strace/strace-locale: PKGV changed from 6.16 [default] to 6.17 [default]
packages/x86-64-v3-poky-linux/strace/strace-ptest: FILELIST: added "/usr/lib/strace/ptest/tests/file_getattr-P /usr/lib/strace/ptest/tests/file_setattr-P /usr/lib/strace/ptest/tests/file_setattr-yy.gen.test /usr/lib/strace/ptest/tests/file_getattr-yy.gen.test /usr/lib/strace/ptest/tests/file_getattr /usr/lib/strace/ptest/tests/file_getattr-success.gen.test /usr/lib/strace/ptest/tests/file_setattr-Xabbrev.gen.test /usr/lib/strace/ptest/tests/file_getattr-y /usr/lib/strace/ptest/tests/file_xetattr-common.c /usr/lib/strace/ptest/tests/file_setattr-y /usr/lib/strace/ptest/tests/file_getattr-success-Xraw.gen.test /usr/lib/strace/ptest/tests/file_getattr-yy /usr/lib/strace/ptest/tests/file_setattr-Xverbose /usr/lib/strace/ptest/tests/file_getattr-success-Xverbose.gen.test /usr/lib/strace/ptest/tests/file_getattr-success-Xraw /usr/lib/strace/ptest/tests/file_setattr /usr/lib/strace/ptest/tests/file_getattr-success /usr/lib/strace/ptest/tests/file_getattr-success-Xabbrev /usr/lib/strace/ptes
 t/tests/file_getattr-y.gen.test /usr/lib/strace/ptest/tests/file_getattr-P.gen.test /usr/lib/strace/ptest/tests/file_getattr-success-Xverbose /usr/lib/strace/ptest/tests/file_setattr-y.gen.test /usr/lib/strace/ptest/tests/file_setattr-P.gen.test /usr/lib/strace/ptest/tests/file_getattr-success-Xabbrev.gen.test /usr/lib/strace/ptest/tests/file_setattr-Xverbose.gen.test /usr/lib/strace/ptest/tests/file_setattr-Xraw /usr/lib/strace/ptest/tests/file_setattr-Xraw.gen.test /usr/lib/strace/ptest/tests/test_fs_xflags.h /usr/lib/strace/ptest/tests/file_getattr.gen.test /usr/lib/strace/ptest/tests/file_setattr.gen.test /usr/lib/strace/ptest/tests/file_setattr-Xabbrev /usr/lib/strace/ptest/tests/file_setattr-yy"
packages/x86-64-v3-poky-linux/strace/strace-ptest: PV changed from "6.16" to "6.17"
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

--===============0226843606313998996==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-strace-upgrade-6.16-6.17.patch"

RnJvbSA4YjQxZjQ1OTdkZjk2MjkzZjlkMmQ0YTNjYjM0ODFhOGE2NWQxNWI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTI6MDY6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
dHJhY2U6IHVwZ3JhZGUgNi4xNiAtPiA2LjE3CgotLS0KIC4uLmdub3JlLXB3cml0ZXYtcHdyaXRl
NjQtdGVzdHMtb24tbXVzbC5wYXRjaCB8IDYyICsrKysrKysrKysrKysrKysrKysKIC4uLnRvY29u
Zi1tYWNyby10by1kZXRlY3QtbGFyZ2VmaWxlLXN1cC5wYXRjaCB8ICAyICstCiAuLi4wMDEtc3Ry
YWNlLWZpeC1yZXByb2R1Y2liaWx0eS1pc3N1ZXMucGF0Y2ggfCAgMiArLQogLi4uMDEtdGVzdHMt
Zml4LXVpby50ZXN0LXdpdGgtbXVzbC1saWJjLnBhdGNoIHwgMzAgLS0tLS0tLS0tCiAuLi4wMDIt
dGVzdHMtUmVwbGFjZS1vZmY2NF90LXdpdGgtb2ZmX3QucGF0Y2ggfCAgMiArLQogLi4uL3N0cmFj
ZS9zdHJhY2UvTWFrZWZpbGUtcHRlc3QucGF0Y2ggICAgICAgIHwgIDYgKy0KIC4uLi9zdHJhY2Uv
c3RyYWNlL3B0ZXN0LXNwYWNlc2F2ZS5wYXRjaCAgICAgICB8ICAyICstCiAuLi4vc3RyYWNlL3N0
cmFjZS9za2lwLWxvYWQucGF0Y2ggICAgICAgICAgICAgfCAxMyArKy0tCiAuLi4vc3RyYWNlL3N0
cmFjZS91cGRhdGUtZ2F3ay1wYXRocy5wYXRjaCAgICAgfCAgMiArLQogLi4uL3N0cmFjZS97c3Ry
YWNlXzYuMTYuYmIgPT4gc3RyYWNlXzYuMTcuYmJ9IHwgIDQgKy0KIDEwIGZpbGVzIGNoYW5nZWQs
IDc3IGluc2VydGlvbnMoKyksIDQ4IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2UvZmlsZXMvMDAwMS1JZ25vcmUtcHdyaXRldi1wd3Jp
dGU2NC10ZXN0cy1vbi1tdXNsLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvMDAwMS10ZXN0cy1maXgtdWlvLnRlc3Qtd2l0aC1tdXNs
LWxpYmMucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3tzdHJhY2Vf
Ni4xNi5iYiA9PiBzdHJhY2VfNi4xNy5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvc3RyYWNlL2ZpbGVzLzAwMDEtSWdub3JlLXB3cml0ZXYtcHdyaXRlNjQtdGVz
dHMtb24tbXVzbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2UvZmlsZXMvMDAw
MS1JZ25vcmUtcHdyaXRldi1wd3JpdGU2NC10ZXN0cy1vbi1tdXNsLnBhdGNoCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjc4ZTljNzA2MGYKLS0tIC9kZXYvbnVsbAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL2ZpbGVzLzAwMDEtSWdub3JlLXB3cml0ZXYt
cHdyaXRlNjQtdGVzdHMtb24tbXVzbC5wYXRjaApAQCAtMCwwICsxLDYyIEBACitGcm9tIGIyMGZl
YTU3NWUwNDEyZGRjN2NlMGQzYTRlYjE1NjAxNzcxODZmNTQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgorRGF0ZTogTW9uLCAxOCBB
dWcgMjAyNSAyMjoxODo1OCAtMDcwMAorU3ViamVjdDogW1BBVENIXSBJZ25vcmUgcHdyaXRldi9w
d3JpdGU2NCB0ZXN0cyBvbiBtdXNsCisKK211c2wgdXNlcyB3cmFwcGVycyBmb3IgcHdyaXRldiBh
bmQgcHdyaXRlNjQgdXNpbmcKK3B3cml0ZXYyIHN5c2NhbGwgWzFdLCBob3dldmVyIHRoZSB0ZXN0
IGV4ZXBjdHMgdGhhdCB0aGUKK3Byb2dyYW0gd2lsbCBjYWxsIHB3cml0ZXYgYW5kIHB3cml0ZTY0
ICggZ2xpYmMgYmVoYXZpb3IgKQorCitUaGlzIGNhbiBiZSBmaXhlZCBpZiB0aGUgZnVuY3Rpb24g
Y2FsbHMgYXJlIGNoYW5nZWQgdG8KK3VzZSBzeXNjYWxsKCkgQVBJIGRpcmVjdGx5LCBidXQgdGhh
dCBuZWVkcyBjaGFuZ2UgdXBzdHJlYW0gWzJdCisKK0lzc3VlIGlzIHJlcG9ydGVkIHVwc3RyZWFt
IFszXQorCitbMV0gaHR0cHM6Ly9naXQubXVzbC1saWJjLm9yZy9jZ2l0L211c2wvY29tbWl0L3Ny
Yz9pZD01MzcwMDcwZmRlZDYxYjU2OTE5Njc2NDY3M2E0ZmM4NDQwYWFjNzllCitbMl0gaHR0cHM6
Ly9naXRodWIuY29tL3N0cmFjZS9zdHJhY2UvcHVsbC8zNDcKK1szXSBodHRwczovL2dpdGh1Yi5j
b20vc3RyYWNlL3N0cmFjZS9pc3N1ZXMvMzQ5CisKK1Vwc3RyZWFtLVN0YXR1czogSW5hcHByb3By
aWF0ZSBbTXVzbCBTcGVjaWZpY10KK1NpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+CistLS0KKyB0ZXN0cy9wcmVhZDY0LXB3cml0ZTY0Lmdlbi50ZXN0IHwgMyArKysK
KyB0ZXN0cy9wcmVhZHYtcHdyaXRldi5nZW4udGVzdCAgIHwgMyArKysKKyB0ZXN0cy9wd3JpdGV2
Lmdlbi50ZXN0ICAgICAgICAgIHwgMyArKysKKyAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKQorCitkaWZmIC0tZ2l0IGEvdGVzdHMvcHJlYWQ2NC1wd3JpdGU2NC5nZW4udGVzdCBiL3Rl
c3RzL3ByZWFkNjQtcHdyaXRlNjQuZ2VuLnRlc3QKK2luZGV4IGI1M2UwNjkuLjBhMWU2ZTYgMTAw
NzU1CistLS0gYS90ZXN0cy9wcmVhZDY0LXB3cml0ZTY0Lmdlbi50ZXN0CisrKysgYi90ZXN0cy9w
cmVhZDY0LXB3cml0ZTY0Lmdlbi50ZXN0CitAQCAtMSw0ICsxLDcgQEAKKyAjIS9iaW4vc2ggLWVm
dQorICMgR2VuZXJhdGVkIGJ5IC4vdGVzdHMvZ2VuX3Rlc3RzLnNoIGZyb20gLi90ZXN0cy9nZW5f
dGVzdHMuaW4gKHByZWFkNjQtcHdyaXRlNjQgLWEyMSAtZXJlYWQ9MCAtZXdyaXRlPTEgLWUgdHJh
Y2U9cHJlYWQ2NCxwd3JpdGU2NCAtUCBwcmVhZDY0LXB3cml0ZTY0LXRtcGZpbGUgLVAgL2Rldi96
ZXJvIC1QIC9kZXYvbnVsbCk7IGRvIG5vdCBlZGl0LgorIC4gIiR7c3JjZGlyPS59L2luaXQuc2gi
CisrCisrc2tpcF8gIlRlc3Qgbm90IHBvcnRlZCB0byBtdXNsLCBtdXNsIGdlbmVyYXRlcyBwd3Jp
dGV2MiIKKysKKyBydW5fc3RyYWNlX21hdGNoX2RpZmYgLWEyMSAtZXJlYWQ9MCAtZXdyaXRlPTEg
LWUgdHJhY2U9cHJlYWQ2NCxwd3JpdGU2NCAtUCBwcmVhZDY0LXB3cml0ZTY0LXRtcGZpbGUgLVAg
L2Rldi96ZXJvIC1QIC9kZXYvbnVsbAorZGlmZiAtLWdpdCBhL3Rlc3RzL3ByZWFkdi1wd3JpdGV2
Lmdlbi50ZXN0IGIvdGVzdHMvcHJlYWR2LXB3cml0ZXYuZ2VuLnRlc3QKK2luZGV4IDVlZDgyOTcu
LmI4M2YxMjkgMTAwNzU1CistLS0gYS90ZXN0cy9wcmVhZHYtcHdyaXRldi5nZW4udGVzdAorKysr
IGIvdGVzdHMvcHJlYWR2LXB3cml0ZXYuZ2VuLnRlc3QKK0BAIC0xLDQgKzEsNyBAQAorICMhL2Jp
bi9zaCAtZWZ1CisgIyBHZW5lcmF0ZWQgYnkgLi90ZXN0cy9nZW5fdGVzdHMuc2ggZnJvbSAuL3Rl
c3RzL2dlbl90ZXN0cy5pbiAocHJlYWR2LXB3cml0ZXYgLWExOSAtZXJlYWQ9MCAtZXdyaXRlPTEg
LWUgdHJhY2U9cHJlYWR2LHB3cml0ZXYpOyBkbyBub3QgZWRpdC4KKyAuICIke3NyY2Rpcj0ufS9p
bml0LnNoIgorKworK3NraXBfICJUZXN0IG5vdCBwb3J0ZWQgdG8gbXVzbCwgbXVzbCBnZW5lcmF0
ZXMgcHdyaXRldjIiCisrCisgcnVuX3N0cmFjZV9tYXRjaF9kaWZmIC1hMTkgLWVyZWFkPTAgLWV3
cml0ZT0xIC1lIHRyYWNlPXByZWFkdixwd3JpdGV2CitkaWZmIC0tZ2l0IGEvdGVzdHMvcHdyaXRl
di5nZW4udGVzdCBiL3Rlc3RzL3B3cml0ZXYuZ2VuLnRlc3QKK2luZGV4IGU1NGZkMTUuLjQ5OTk4
MTYgMTAwNzU1CistLS0gYS90ZXN0cy9wd3JpdGV2Lmdlbi50ZXN0CisrKysgYi90ZXN0cy9wd3Jp
dGV2Lmdlbi50ZXN0CitAQCAtMSw0ICsxLDcgQEAKKyAjIS9iaW4vc2ggLWVmdQorICMgR2VuZXJh
dGVkIGJ5IC4vdGVzdHMvZ2VuX3Rlc3RzLnNoIGZyb20gLi90ZXN0cy9nZW5fdGVzdHMuaW4gKHB3
cml0ZXYgLWEyMiAtczcpOyBkbyBub3QgZWRpdC4KKyAuICIke3NyY2Rpcj0ufS9pbml0LnNoIgor
KworK3NraXBfICJUZXN0IG5vdCBwb3J0ZWQgdG8gbXVzbCwgbXVzbCBnZW5lcmF0ZXMgcHdyaXRl
djIiCisrCisgcnVuX3N0cmFjZV9tYXRjaF9kaWZmIC1hMjIgLXM3CmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAxLWNvbmZpZ3VyZS1Vc2UtYXV0b2Nv
bmYtbWFjcm8tdG8tZGV0ZWN0LWxhcmdlZmlsZS1zdXAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAxLWNvbmZpZ3VyZS1Vc2UtYXV0b2NvbmYtbWFjcm8tdG8t
ZGV0ZWN0LWxhcmdlZmlsZS1zdXAucGF0Y2gKaW5kZXggNDY4OTRjZDlkMC4uMDE3OWQyYTk1NCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvMDAwMS1jb25m
aWd1cmUtVXNlLWF1dG9jb25mLW1hY3JvLXRvLWRldGVjdC1sYXJnZWZpbGUtc3VwLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlLzAwMDEtY29uZmlndXJlLVVz
ZS1hdXRvY29uZi1tYWNyby10by1kZXRlY3QtbGFyZ2VmaWxlLXN1cC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gMjY3OTg5NTU5MzcwYTlmMzQ2NDZiZjhhMDIwMDE3NTViZjY0ZmIyNSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNGZmYWI1Y2QyMWJjMWM0ZDdmM2VkZmI3MTY1MDZk
NmMzYTY0YTJlNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDE1IERlYyAyMDIyIDE1OjU0OjI3IC0wODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZTogVXNlIGF1dG9jb25mIG1hY3JvIHRvIGRldGVjdCBs
YXJnZWZpbGUgc3VwcG9ydApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFj
ZS9zdHJhY2UvMDAwMS1zdHJhY2UtZml4LXJlcHJvZHVjaWJpbHR5LWlzc3Vlcy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlLzAwMDEtc3RyYWNlLWZpeC1yZXByb2R1
Y2liaWx0eS1pc3N1ZXMucGF0Y2gKaW5kZXggZWUzNzk2ODhiZi4uZWZiMGMxNmI4YyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvMDAwMS1zdHJhY2UtZml4
LXJlcHJvZHVjaWJpbHR5LWlzc3Vlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
c3RyYWNlL3N0cmFjZS8wMDAxLXN0cmFjZS1maXgtcmVwcm9kdWNpYmlsdHktaXNzdWVzLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1OTA3N2YzOWNjZTQ5OWQxMWRlNWIwYTljMjNjOWRlZDY3
ZGRiMjJlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxMTlmYTBjOGU5YzVlY2Q1YWM1
ZGE3NzZlNGZhNDE5Y2E2Mzc5NDBhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmVy
ZW15IFB1aGxtYW4gPGpwdWhsbWFuQG12aXN0YS5jb20+CiBEYXRlOiBXZWQsIDExIE1hciAyMDIw
IDE5OjU2OjU1ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHN0cmFjZTogZml4IHJlcHJvZHVjaWJp
bHR5IGlzc3VlcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJh
Y2UvMDAwMS10ZXN0cy1maXgtdWlvLnRlc3Qtd2l0aC1tdXNsLWxpYmMucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAxLXRlc3RzLWZpeC11aW8udGVzdC13aXRo
LW11c2wtbGliYy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYTg3OWNhNTBj
YS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8w
MDAxLXRlc3RzLWZpeC11aW8udGVzdC13aXRoLW11c2wtbGliYy5wYXRjaAorKysgL2Rldi9udWxs
CkBAIC0xLDMwICswLDAgQEAKLUZyb20gN2ZhZGY2OTQ3NzYxY2M1MjQ4YWE0YTM3NmJiOTUxNzQ4
MWRiYWE1MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEd5b3JneSBTYXJ2YXJpIDxz
a2FuZGlncmF1bkBnbWFpbC5jb20+Ci1EYXRlOiBUdWUsIDEyIEF1ZyAyMDI1IDIwOjAyOjMxICsw
MjAwCi1TdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiBmaXggdWlvLnRlc3Qgd2l0aCBtdXNsLWxpYmMK
LQotbXVzbC1saWJjIGhhbmRsZXMgdGhlIHB3cml0ZSBjYWxscyBkaWZmZXJlbnRseSB0aGFuIGds
aWJjLCBtYWtpbmcKLXRoZSB1aW8gdGVzdCBmYWlsLiAgVXNpbmcgZ2xpYmMsIHRoZXJlIGFyZSBz
ZXBhcmF0ZWQgcHdyaXRlIGFuZCBwd3JpdGV2Ci1jYWxscywgaG93ZXZlciBtdXNsIHVzZXMgb25s
eSBwd3JpdGV2MiBmb3IgYm90aCBwd3JpdGUgYW5kIHB3cml0ZXYuCi0KLVRvIGFjY291bnQgdG8g
dGhpcyBkaWZmZXJlbmNlLCBtb2RpZnkgdGhlIGV4cGVjdGVkIG1hdGNoaW5nIHJlZ2V4cAotdG8g
YWxzbyBtYXRjaCB0aGUgbXVzbCBvdXRwdXQgKGFwcGVuZCBpdCB3aXRoIGFuIE9SKS4KLQotVXBz
dHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL3N0cmFjZS9zdHJhY2Uv
cHVsbC8zNDddCi1TaWduZWQtb2ZmLWJ5OiBHeW9yZ3kgU2FydmFyaSA8c2thbmRpZ3JhdW5AZ21h
aWwuY29tPgotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLS0t
LQotIHRlc3RzL3Vpby5leHBlY3RlZCB8IDQgKystLQotIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS90ZXN0cy91aW8uZXhwZWN0
ZWQgYi90ZXN0cy91aW8uZXhwZWN0ZWQKLWluZGV4IDk4ZDVjMDYuLjJhNzEyYTEgMTAwNjQ0Ci0t
LS0gYS90ZXN0cy91aW8uZXhwZWN0ZWQKLSsrKyBiL3Rlc3RzL3Vpby5leHBlY3RlZAotQEAgLTEs
NCArMSw0IEBACi0gcHJlYWQoNjQpP1woMCwgIlxcMFxcMFxcMFxcMCIsIDQsIDEwMDQyMTEzNzk1
NzAwNjUxMzVcKSArPSA0Ci0gcHJlYWR2XCgwLCBcW1x7aW92X2Jhc2U9IlxcMFxcMFxcMFxcMCIs
IGlvdl9sZW49NFx9XF0sIDEsIDEwMDQyMTEzNzk1NzAwNjUxMzVcKSArPSA0Ci0tcHdyaXRlKDY0
KT9cKDAsICJcXDBcXDBcXDBcXDAiLCA0LCAxMDA0MjExMzc5NTcwMDY1MTM1XCkgKz0gNAotLXB3
cml0ZXZcKDAsIFxbXHtpb3ZfYmFzZT0iXFwwXFwwXFwwXFwwIiwgaW92X2xlbj00XH1cXSwgMSwg
MTAwNDIxMTM3OTU3MDA2NTEzNVwpICs9IDQKLStwd3JpdGUoNjQpP1woMCwgIlxcMFxcMFxcMFxc
MCIsIDQsIDEwMDQyMTEzNzk1NzAwNjUxMzVcKSArPSA0fHB3cml0ZXYyXCgwLCBcW1x7aW92X2Jh
c2U9IlxcMFxcMFxcMFxcMCIsIGlvdl9sZW49NH1dLCAxLCAxMDA0MjExMzc5NTcwMDY1MTM1LCBS
V0ZfTk9BUFBFTkRcKSArPSA0Ci0rcHdyaXRldlwoMCwgXFtce2lvdl9iYXNlPSJcXDBcXDBcXDBc
XDAiLCBpb3ZfbGVuPTRcfVxdLCAxLCAxMDA0MjExMzc5NTcwMDY1MTM1XCkgKz0gNHxwd3JpdGV2
MlwoMCwgXFtce2lvdl9iYXNlPSJcXDBcXDBcXDBcXDAiLCBpb3ZfbGVuPTR9XSwgMSwgMTAwNDIx
MTM3OTU3MDA2NTEzNSwgUldGX05PQVBQRU5EXCkgKz0gNApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvMDAwMi10ZXN0cy1SZXBsYWNlLW9mZjY0X3Qtd2l0
aC1vZmZfdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlLzAwMDIt
dGVzdHMtUmVwbGFjZS1vZmY2NF90LXdpdGgtb2ZmX3QucGF0Y2gKaW5kZXggY2E5MDlkNTczZC4u
ODEyYjI1NDIyNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJh
Y2UvMDAwMi10ZXN0cy1SZXBsYWNlLW9mZjY0X3Qtd2l0aC1vZmZfdC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAyLXRlc3RzLVJlcGxhY2Utb2ZmNjRf
dC13aXRoLW9mZl90LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2OTA4M2U5M2U5MjQzN2U4
ZDlkNDIyNWZjYTcxYTA1MzkwNmE0YWYwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5
MjczM2UyODc3MjBkMjk5YzM2MzhkYjllZmFmZTMxMjJmZDFjNTlhIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwg
MTUgRGVjIDIwMjIgMTU6NTY6MTMgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IFJlcGxh
Y2Ugb2ZmNjRfdCB3aXRoIG9mZl90CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
c3RyYWNlL3N0cmFjZS9NYWtlZmlsZS1wdGVzdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9zdHJhY2Uvc3RyYWNlL01ha2VmaWxlLXB0ZXN0LnBhdGNoCmluZGV4IDIxMmVlYTg2MTguLmZh
ZWU3OThiMTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNl
L01ha2VmaWxlLXB0ZXN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uv
c3RyYWNlL01ha2VmaWxlLXB0ZXN0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5ZDQwZDI5
M2ZmNzNkZWE3MzRmMTM1M2MzNTRmNTFlNTE5OTJhODEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSAwZjhjYTFlN2ZhNWY0NzYwODYxOTI3MjQ5MWU3ZDk4YjdmOWQ3YzEwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogR2FicmllbCBCYXJidSA8Z2FicmllbC5iYXJidUBlbmVh
LmNvbT4KIERhdGU6IFRodSwgMjUgSnVsIDIwMTMgMTU6Mjg6MzMgKzAyMDAKIFN1YmplY3Q6IFtQ
QVRDSF0gc3RyYWNlOiBBZGQgcHRlc3QKQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1ieTog
QW51aiBNaXR0YWwgPGFudWoubWl0dGFsQGludGVsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMjAg
aW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvTWFrZWZpbGUuYW0gYi90ZXN0cy9N
YWtlZmlsZS5hbQotaW5kZXggNmU5NDJiMS4uN2E3MDdkNyAxMDA2NDQKK2luZGV4IGQ3NmI1YzYu
LmQ0ZmMyMDYgMTAwNjQ0CiAtLS0gYS90ZXN0cy9NYWtlZmlsZS5hbQogKysrIGIvdGVzdHMvTWFr
ZWZpbGUuYW0KIEBAIC0xOCw2ICsxOCw3IEBAIFNJWkVPRl9MT05HID0gQFNJWkVPRl9MT05HQApA
QCAtMjQsNyArMjQsNyBAQCBpbmRleCA2ZTk0MmIxLi43YTcwN2Q3IDEwMDY0NAogIEFNX0NGTEFH
UyA9ICQoV0FSTl9DRkxBR1MpICQoVEVTVF9XQVJOX0NGTEFHUykKICBidW5kbGVkX0NQUEZMQUdT
ID0KICBpZiBVU0VfQlVORExFRF9IRUFERVJTCi1AQCAtOTM3LDMgKzkzOCwyMiBAQCBCVUlMVF9T
T1VSQ0VTID0ga3N5c2VudC5oCitAQCAtOTM5LDMgKzk0MCwyMiBAQCBCVUlMVF9TT1VSQ0VTID0g
a3N5c2VudC5oCiAgQ0xFQU5GSUxFUyA9IGtzeXNlbnQuaAogIAogIGluY2x1ZGUgLi4vc3JjL3Nj
bm8uYW0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlL3B0
ZXN0LXNwYWNlc2F2ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNl
L3B0ZXN0LXNwYWNlc2F2ZS5wYXRjaAppbmRleCA2NjFlZDJjN2JiLi4wYjIzNDdlMTAzIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS9wdGVzdC1zcGFjZXNh
dmUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvcHRlc3Qt
c3BhY2VzYXZlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4YmQ4MjczMzlhZTcyZWFiOTlk
YzlhZDZhNjhiMGFlOThlNWJiYjQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwY2Ri
YWFiZTc2NGJlN2JjNTVhNGE5ZDM5NDE2MWEyOTcxNzY1NTljIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmc+CiBEYXRlOiBXZWQsIDI5IE1heSAyMDE5IDAwOjEwOjMyICswMTAwCiBTdWJqZWN0OiBb
UEFUQ0hdIHN0cmFjZTogVHdlYWsgcHRlc3QgZGlzayBzcGFjZSBtYW5hZ2VtZW50CmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS9za2lwLWxvYWQucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS9za2lwLWxvYWQucGF0Y2gKaW5k
ZXggMzQ5NDhmZDJiYS4uZDhiNWFjMmI5NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3N0cmFjZS9zdHJhY2Uvc2tpcC1sb2FkLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9zdHJhY2Uvc3RyYWNlL3NraXAtbG9hZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
NDZlY2VlZmIzYmQxODQzNTRjZGFmMGZkM2RmZjZmMmFkOTc5YWFkOSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gMDQyZDhlMDAzM2U0MzExNTg3ZGU3ZGQyOTRiNzgwMzQ4MDY3Y2VjMyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBh
cm0uY29tPgogRGF0ZTogU2F0LCAzMCBBdWcgMjAyNSAwMDo0NzowMyArMDIwMAogU3ViamVjdDog
W1BBVENIXSBzdHJhY2U6IHNraXAgYSBudW1iZXIgb2YgbG9hZC1zZW5zaXRpdmUgdGVzdHMKQEAg
LTE3LDcgKzE3LDcgQEAgU2lnbmVkLW9mZi1ieTogT3NhbWEgQWJkZWxrYWRlciA8b3NhbWEuYWJk
ZWxrYWRlckBnbWFpbC5jb20+CiAgNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKIAog
ZGlmZiAtLWdpdCBhL3Rlc3RzL2Nsb2NrX25hbm9zbGVlcC5nZW4udGVzdCBiL3Rlc3RzL2Nsb2Nr
X25hbm9zbGVlcC5nZW4udGVzdAotaW5kZXggN2E2MDI1YmJkLi5mMGU2ZGJiNzMgMTAwNzU1Citp
bmRleCA3YTYwMjViLi5mMGU2ZGJiIDEwMDc1NQogLS0tIGEvdGVzdHMvY2xvY2tfbmFub3NsZWVw
Lmdlbi50ZXN0CiArKysgYi90ZXN0cy9jbG9ja19uYW5vc2xlZXAuZ2VuLnRlc3QKIEBAIC0xLDQg
KzEsNSBAQApAQCAtMjcsNyArMjcsNyBAQCBpbmRleCA3YTYwMjViYmQuLmYwZTZkYmI3MyAxMDA3
NTUKICtza2lwXyAiVGVzdCBub3QgcmVsaWFibGUgdW5kZXIgbG9hZCIKICBydW5fc3RyYWNlX21h
dGNoX2RpZmYgLWUgdHJhY2U9Y2xvY2tfbmFub3NsZWVwLGNsb2NrX2dldHRpbWUKIGRpZmYgLS1n
aXQgYS90ZXN0cy9kZWxheS50ZXN0IGIvdGVzdHMvZGVsYXkudGVzdAotaW5kZXggZjc0ZTI3ZjFl
Li4xNTEwYzc2NDcgMTAwNzU1CitpbmRleCBmNzRlMjdmLi4xNTEwYzc2IDEwMDc1NQogLS0tIGEv
dGVzdHMvZGVsYXkudGVzdAogKysrIGIvdGVzdHMvZGVsYXkudGVzdAogQEAgLTksNiArOSw3IEBA
CkBAIC0zOSw3ICszOSw3IEBAIGluZGV4IGY3NGUyN2YxZS4uMTUxMGM3NjQ3IDEwMDc1NQogIAlb
IC1uICIkZGVudGVyIiBdIHx8IGNvbnRpbnVlCiAgCiBkaWZmIC0tZ2l0IGEvdGVzdHMvbmFub3Ns
ZWVwLmdlbi50ZXN0IGIvdGVzdHMvbmFub3NsZWVwLmdlbi50ZXN0Ci1pbmRleCA0MTkyOGRlZDgu
LmY4YTg3Y2I4ZSAxMDA3NTUKK2luZGV4IDQxOTI4ZGUuLmY4YTg3Y2IgMTAwNzU1CiAtLS0gYS90
ZXN0cy9uYW5vc2xlZXAuZ2VuLnRlc3QKICsrKyBiL3Rlc3RzL25hbm9zbGVlcC5nZW4udGVzdAog
QEAgLTEsNCArMSw1IEBACkBAIC00OSw3ICs0OSw3IEBAIGluZGV4IDQxOTI4ZGVkOC4uZjhhODdj
YjhlIDEwMDc1NQogK3NraXBfICJUZXN0IG5vdCByZWxpYWJsZSB1bmRlciBsb2FkIgogIHJ1bl9z
dHJhY2VfbWF0Y2hfZGlmZiAtYTIwIAogZGlmZiAtLWdpdCBhL3Rlc3RzL3N0cmFjZS1yLnRlc3Qg
Yi90ZXN0cy9zdHJhY2Utci50ZXN0Ci1pbmRleCA4Mjk5NzM3NTMuLmU4OTQyMzQ4NSAxMDA3NTUK
K2luZGV4IDgyOTk3MzcuLmU4OTQyMzQgMTAwNzU1CiAtLS0gYS90ZXN0cy9zdHJhY2Utci50ZXN0
CiArKysgYi90ZXN0cy9zdHJhY2Utci50ZXN0CiBAQCAtOSw2ICs5LDcgQEAKQEAgLTYwLDYgKzYw
LDMgQEAgaW5kZXggODI5OTczNzUzLi5lODk0MjM0ODUgMTAwNzU1CiAgcl9vcHQ9IiR7MTotLXJ9
IgogIAogIHJ1bl9wcm9nIC4uL3NsZWVwIDAKLS0tIAotMi40My4wCi0KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlL3VwZGF0ZS1nYXdrLXBhdGhzLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvdXBkYXRlLWdhd2stcGF0aHMu
cGF0Y2gKaW5kZXggMTkzYTQ4MTllZi4uMTE2ODI1MTI5OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvdXBkYXRlLWdhd2stcGF0aHMucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvdXBkYXRlLWdhd2stcGF0aHMucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGMxMTM4MDYwOTc4OGZmOWM4MDJkNjUyN2FkYzZiMmM3
NTZkNWY3MTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZiZWI3OGVlODNiOWU4Zjdi
ZjYxNDViYTA4M2E4M2UyMmE2NjYxOTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBB
bmRyZSBNY0N1cmR5IDxhcm1jY3VyZHlAZ21haWwuY29tPgogRGF0ZTogTW9uLCAxOCBKYW4gMjAx
NiAxMTowMTowMCAtMDgwMAogU3ViamVjdDogW1BBVENIXSB1cGRhdGUgZ2F3ayBwYXRocywgL2Jp
bi9nYXdrIC0+IC91c3IvYmluL2dhd2sKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9zdHJhY2Uvc3RyYWNlXzYuMTYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0
cmFjZV82LjE3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzYuMTYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzYuMTcuYmIKaW5kZXggMDU1MmNhYTJiNi4uNTMwNTI1ZmE3
MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2VfNi4xNi5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZV82LjE3LmJiCkBAIC0x
NCwxMiArMTQsMTIgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7
UFZ9L3N0cmFjZS0ke1BWfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vc2tpcC1sb2FkLnBh
dGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtY29uZmlndXJlLVVzZS1hdXRvY29uZi1tYWNy
by10by1kZXRlY3QtbGFyZ2VmaWxlLXN1cC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAy
LXRlc3RzLVJlcGxhY2Utb2ZmNjRfdC13aXRoLW9mZl90LnBhdGNoIFwKLSAgICAgICAgICAgZmls
ZTovLzAwMDEtdGVzdHMtZml4LXVpby50ZXN0LXdpdGgtbXVzbC1saWJjLnBhdGNoIFwKKyAgICAg
ICAgICAgZmlsZTovLzAwMDEtSWdub3JlLXB3cml0ZXYtcHdyaXRlNjQtdGVzdHMtb24tbXVzbC5w
YXRjaCBcCiAgICAgICAgICAgICIKIFNSQ19VUkk6YXBwZW5kOmxpYmMtbXVzbCA9ICJcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAxLUlnbm9yZS1wd3JpdGV2LXB3cml0ZTY0LXRlc3RzLW9uLW11c2wu
cGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2Q3YWVlN2U0ZjA0
NGIyZjY3ZjNkNTFhOGE3NmVkYTE4MDc2ZTlmYjI3NzRkZTU0YWMzNTFkNzc3ZDRlYmZmYSIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICIwYTdjN2JlZGM3ZWZjMDc2ZjMyNDJhMDMxMGFmMmFlNjNjMjky
YTM2ZGQ0MjM2ZjA3OWU4OGE5M2U5OGNiOWMwIgogCiBpbmhlcml0IGF1dG90b29scyBnaXRodWIt
cmVsZWFzZXMgcHRlc3QKIAotLSAKMi40Ny4xCgo=

--===============0226843606313998996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (0 cached, 947 parsed). 1945 targets, 54 skipped, 0 masked, 0 errors.
Removing 41 recipes from the qemux86_64 sysroot...done.
Removing 13 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-a877c9bc11ca90db6799bfac77a46b8694e646c2"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:a877c9bc11ca90db6799bfac77a46b8694e646c2"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 353 Local 338 Mirrors 0 Missed 15 Current 245 (95% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 257 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 263 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 271 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 274 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 275 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 276 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package_qa_setscene)
NOTE: Running setscene task 277 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 288 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 306 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 308 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_package_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_deb_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_qa_setscene: Started
NOTE: recipe grep-3.12-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe grep-3.12-r0: task do_package_qa_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 309 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 311 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_qa_setscene)
NOTE: recipe grep-3.12-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 314 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 318 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 320 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 322 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_package_write_ipk_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 323 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.12-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 326 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 334 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 336 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 339 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 340 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 342 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 344 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package_write_ipk_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 345 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package_write_ipk_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_qa_setscene: Started
NOTE: recipe grep-3.12-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 346 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_create_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 350 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 351 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 352 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe grep-3.12-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 354 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/strace/strace_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe grep-3.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 367 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe strace-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 369 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe strace-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe grep-3.12-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 375 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 376 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 384 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 857 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/strace/strace_6.17.bb:do_fetch)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 397 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 398 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe strace-6.17-r0: task do_fetch: Started
NOTE: Running setscene task 404 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 410 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe strace-6.17-r0: task do_fetch: Succeeded
NOTE: recipe grep-3.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 947 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/strace/strace_6.17.bb:do_unpack)
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 415 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 416 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_recipe_qa_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 421 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 425 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 426 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe strace-6.17-r0: task do_unpack: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 428 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 431 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 432 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 444 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe grep-3.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 457 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 458 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 462 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 472 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 474 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1006 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running task 1036 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1037 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 494 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1107 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1120 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe strace-6.17-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1121 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/strace/strace_6.17.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1122 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe strace-6.17-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1129 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1130 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 559 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 566 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 568 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 577 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 578 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1160 of 1663 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 587 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 588 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 9199b3c8fdfb9a0c9fa713de8bbd49b2cc3cc69ace76278dc7bf5065592375ad to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '365a9d30fbc2ffffe92d09350dc4bd78f7c9840298245f949f7d9273e8849fc7', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '9199b3c8fdfb9a0c9fa713de8bbd49b2cc3cc69ace76278dc7bf5065592375ad'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 365a9d30fbc2ffffe92d09350dc4bd78f7c9840298245f949f7d9273e8849fc7 -> 9199b3c8fdfb9a0c9fa713de8bbd49b2cc3cc69ace76278dc7bf5065592375ad as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 592 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 597 of 598 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
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
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115120550.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115120550.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/strace/strace_6.17.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/strace/6.17/temp/log.do_patch.3220181
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: strace-6.17-r0 do_patch: Applying patch '0001-Ignore-pwritev-pwrite64-tests-on-musl.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/strace/6.17/sources/strace-6.17'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/strace/6.17/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch 0001-Ignore-pwritev-pwrite64-tests-on-musl.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/strace/6.17/temp/log.do_patch.3220181
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/strace/strace_6.17.bb:do_patch) failed with exit code '1'

--===============0226843606313998996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/strace/strace-ptest: FILELIST: added "/usr/lib/strace/ptest/tests/file_getattr-success-Xverbose /usr/lib/strace/ptest/tests/file_setattr-Xraw.gen.test /usr/lib/strace/ptest/tests/file_setattr-Xabbrev /usr/lib/strace/ptest/tests/file_getattr-success-Xabbrev /usr/lib/strace/ptest/tests/test_fs_xflags.h /usr/lib/strace/ptest/tests/file_getattr-success-Xraw /usr/lib/strace/ptest/tests/file_setattr-Xraw /usr/lib/strace/ptest/tests/file_setattr-Xverbose.gen.test /usr/lib/strace/ptest/tests/file_getattr.gen.test /usr/lib/strace/ptest/tests/file_setattr.gen.test /usr/lib/strace/ptest/tests/file_getattr-P.gen.test /usr/lib/strace/ptest/tests/file_setattr-P.gen.test /usr/lib/strace/ptest/tests/file_getattr-y.gen.test /usr/lib/strace/ptest/tests/file_setattr-y.gen.test /usr/lib/strace/ptest/tests/file_setattr /usr/lib/strace/ptest/tests/file_getattr-P /usr/lib/strace/ptest/tests/file_setattr-P /usr/lib/strace/ptest/tests/file_getattr-success-Xverbose.gen.test /usr/
 lib/strace/ptest/tests/file_getattr-success-Xabbrev.gen.test /usr/lib/strace/ptest/tests/file_getattr-success /usr/lib/strace/ptest/tests/file_getattr-success.gen.test /usr/lib/strace/ptest/tests/file_setattr-Xabbrev.gen.test /usr/lib/strace/ptest/tests/file_xetattr-common.c /usr/lib/strace/ptest/tests/file_getattr-y /usr/lib/strace/ptest/tests/file_setattr-y /usr/lib/strace/ptest/tests/file_getattr-success-Xraw.gen.test /usr/lib/strace/ptest/tests/file_setattr-Xverbose /usr/lib/strace/ptest/tests/file_setattr-yy.gen.test /usr/lib/strace/ptest/tests/file_getattr-yy.gen.test /usr/lib/strace/ptest/tests/file_setattr-yy /usr/lib/strace/ptest/tests/file_getattr-yy /usr/lib/strace/ptest/tests/file_getattr"

--===============0226843606313998996==--

