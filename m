Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFDBC5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:22:50 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.692.1787116959464326202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DNcJ/gQo;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pF5cXg3Y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a01878c108-7dd8e99a-4eb1-4bd3-9286-57f4a333866a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787116962;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oIqtv0/gN2HTUcB16YXwf8NZnOUO0R7uEZPlOA8mrsM=;
	b=DNcJ/gQot/Xco4TI63aUVXo+K0RdWpMZKt1DL6GhljOmn2aNul+aI14/QypVNX1g
	HSut4XwTphrNXkxovK57vbKh7z91G++gS+iFkLiqd1JRXnJ6EUiKuNNnOi/3z4h9UaZ
	9NTaX4OJpSZZ9yn794zU6KvfCGuixjWWZ+wLsU7s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787116962;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oIqtv0/gN2HTUcB16YXwf8NZnOUO0R7uEZPlOA8mrsM=;
	b=pF5cXg3YSvde9mHXFc7r7wV4oVfrecdckSXqKrILOMQ74x1l8LmKvI9exR8n3+ji
	xxuWFEGwl6jm75eXfHVXZoP77El46qrywk3x3hw8aUbiOSG9nu6NGuBLsMIict1jN2R
	er/5ftaURpplJoHO4PZIoXZWoe9utWtR/GYx6pwI=
Content-Type: multipart/mixed; boundary="===============2088966030244473343=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] strace: upgrading to 7.2 SUCCEEDED
Message-ID: <010101a01878c108-7dd8e99a-4eb1-4bd3-9286-57f4a333866a-000000@us-west-2.amazonses.com>
Date: Wed, 19 Aug 2026 05:22:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.19-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 05:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243703

--===============2088966030244473343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *strace* to *7.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-strace-upgrade-7.1-7.2.patch
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
From f36f228e4fa510ccdfed7fb7f143b5c4e3e920f7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 19 Aug 2026 05:22:35 +0000
Subject: [PATCH] strace: upgrade 7.1 -> 7.2

Source: ChangeLog

2026-08-18  Dmitry V. Levin  <ldv@strace.io>

	Prepare for 7.2 release.
	* NEWS: Update for 7.2 release.

	Update copyright headers.
	Headers updated automatically using maint/update_copyright_years.sh
	script.

2026-08-18  Dmitry V. Levin  <ldv@strace.io>

	tests: fix futex test expectations for FUTEX_UNLOCK_*_LIST* on linux v7.2
	* tests/futex.c (main): Change FUTEX_UNLOCK_WAKE_LIST64,
	FUTEX_UNLOCK_WAKE_LIST64_PRIVATE, FUTEX_UNLOCK_WAKE_LIST32,
	FUTEX_UNLOCK_WAKE_LIST32_PRIVATE, FUTEX_UNLOCK_BITSET_LIST64,
	FUTEX_UNLOCK_BITSET_LIST64_PRIVATE, FUTEX_UNLOCK_BITSET_LIST32,
	and FUTEX_UNLOCK_BITSET_LIST32_PRIVATE checks to expect EFAULT
	instead of success.

	These operations require a valid robust list pending op pointer
	in uaddr2.  When uaddr2 is NULL, Linux v7.2 returns EFAULT.
	On older kernels that don't implement these operations, ENOSYS
	is still accepted via CHECK_FUTEX_ENOSYS.

	Fixes: v7.1-52-g07c1c3f00b02 "tests: check decoding of FUTEX_UNLOCK_*_LIST* constants"
	Assisted-by: Claude:claude-sonnet-4-5

2026-08-17  Gleb Fotengauer-Malinovskiy  <glebfm@altlinux.org>

	Update ioctl entries from linux v7.2.
	* src/linux/32/ioctls_inc_align16.h: Update from linux v7.2 using
	ioctls_gen.sh.
	* src/linux/32/ioctls_inc_align32.h: Likewise.
	* src/linux/32/ioctls_inc_align64.h: Likewise.
	* src/linux/64/ioctls_inc.h: Likewise.
	* src/linux/x32/ioctls_inc0.h: Likewise.
	* NEWS: Mention this change.

2026-08-17  Dmitry V. Levin  <ldv@strace.io>

	bundled: update linux UAPI headers to v7.2.
	Headers updated automatically using update-bundled-headers.sh script.

	* bundled/linux/include/uapi/linux/btrfs.h: Update to
	headers_install'ed Linux kernel v7.2.
	* bundled/linux/include/uapi/linux/ip_vs.h: Likewise.

2026-08-16  Dmitry V. Levin  <ldv@strace.io>

	io_uring: rename notif to event.
	Between Linux v7.2-rc1 and v7.2-rc7, the io_uring zero-copy RX
	interface underwent a systematic rename replacing "notif"/"notification"
	terminology with "event".

	* bundled/linux/include/uapi/linux/io_uring/query.h: Update to
	headers_install'ed Linux kernel v7.2-rc7 using update-bundled-headers.sh
	script.
	* bundled/linux/include/uapi/linux/io_uring/zcrx.h: Likewise.
	* src/xlat/uring_zcrx_notif_types.in: Rename to
	src/xlat/uring_zcrx_event_types.in and update constant names:
	ZCRX_NOTIF_NO_BUFFERS becomes ZCRX_EVENT_ALLOC_FAIL,
	ZCRX_NOTIF_COPY becomes ZCRX_EVENT_COPY.
	* src/xlat/uring_zcrx_ctrl_ops.in (ZCRX_CTRL_ARM_NOTIFICATION): Rename
	to ZCRX_CTRL_ARM_EVENT.
	* src/xlat/uring_query_ops.in (IO_URING_QUERY_ZCRX_NOTIF): Rename to
	IO_URING_QUERY_ZCRX_EVENT.
	* src/io_uring.c: Update to match kernel UAPI changes.
	(print_io_uring_zcrx_ifq_reg): notif_desc -> event_desc field.
	(print_zcrx_ctrl_arm_notif): Rename function to
	print_zcrx_ctrl_arm_event, update struct type and field names.
	(print_io_uring_zcrx_ctrl): Update case and union member references.
	(print_io_uring_query_zcrx_notif): Rename function to
	print_io_uring_query_zcrx_e

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...gnore-pwritev-pwrite64-tests-on-musl.patch | 62 +++++++++++++++++++
 ...toconf-macro-to-detect-largefile-sup.patch |  2 +-
 ...kport-ax_prog_cc_for_build.m4-macros.patch |  2 +-
 ...001-strace-fix-reproducibilty-issues.patch |  2 +-
 ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
 .../strace/strace/Makefile-ptest.patch        |  6 +-
 .../strace/strace/ptest-spacesave.patch       |  2 +-
 .../strace/strace/skip-load.patch             |  2 +-
 .../strace/strace/update-gawk-paths.patch     |  2 +-
 .../strace/{strace_7.1.bb => strace_7.2.bb}   |  2 +-
 10 files changed, 73 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
 rename meta/recipes-devtools/strace/{strace_7.1.bb => strace_7.2.bb} (96%)

diff --git a/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch b/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
new file mode 100644
index 0000000000..340e2b625e
--- /dev/null
+++ b/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
@@ -0,0 +1,62 @@
+From fe8a5ec102a93b3a8da5feab86a89dee540b9de5 Mon Sep 17 00:00:00 2001
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
index 5a7d05ae41..25f32d1734 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 65fb22e302a4dbec675377e61593b52c2e291705 Mon Sep 17 00:00:00 2001
+From 334b66af1329bc6970c9ff9ee668af6cc2133b8f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:54:27 -0800
 Subject: [PATCH] configure: Use autoconf macro to detect largefile support
diff --git a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
index d3e35077de..60e5141197 100644
--- a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
+++ b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch
@@ -1,4 +1,4 @@
-From 77790a889ca5227936e2de2c587ef1fd9c8e718c Mon Sep 17 00:00:00 2001
+From b402cfcdfb782ab3a8b264b23536a4de5f709746 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:39:47 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
index 78509da2b1..4907b16a1c 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-issues.patch
@@ -1,4 +1,4 @@
-From 455905ce2a3f886264e6344051654d7c2d9faf88 Mon Sep 17 00:00:00 2001
+From 5905b406c5325442f2001339937ad22b2d068b15 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 19:56:55 +0000
 Subject: [PATCH] strace: fix reproducibilty issues
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
index ec1905321a..e784268855 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-off_t.patch
@@ -1,4 +1,4 @@
-From 447203bdced57a521534c4fb7d1962318a81c1bd Mon Sep 17 00:00:00 2001
+From bcca8619f749ba78a4ce78d39c603e2606175175 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:56:13 -0800
 Subject: [PATCH] tests: Replace off64_t with off_t
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
index d864b68fc1..1e3c8ee2aa 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 6f9eb5907fa2a7d6127737e41fb4e9fb5fb091d3 Mon Sep 17 00:00:00 2001
+From 2749699b77b4fcce7e6e960f246259b05f3dafcc Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index f37d053..975f878 100644
+index 84a9638..23fd218 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG = @SIZEOF_LONG@
@@ -24,7 +24,7 @@ index f37d053..975f878 100644
  AM_CFLAGS = $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
  bundled_CPPFLAGS =
  if USE_BUNDLED_HEADERS
-@@ -967,3 +968,22 @@ check-valgrind-local: $(check_LIBRARIES) $(check_PROGRAMS)
+@@ -968,3 +969,22 @@ check-valgrind-local: $(check_LIBRARIES) $(check_PROGRAMS)
  CLEANFILES = ksysent.h
  
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
index 33f9c86894..00f404c003 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From 868dff21f47036dec4db603129d46d4f8ea4a29d Mon Sep 17 00:00:00 2001
+From ae538d4dcb0ea7265d72671b7dd3537ca1356437 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 29 May 2019 00:10:32 +0100
 Subject: [PATCH] strace: Tweak ptest disk space management
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/recipes-devtools/strace/strace/skip-load.patch
index 1bdcb77ddb..610dd94fe9 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,4 +1,4 @@
-From 537e44aa0204590171936eec0fcd279b74fbbfee Mon Sep 17 00:00:00 2001
+From 2653515537b66a4b1286be107e9ef406c55040b4 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Sat, 30 Aug 2025 00:47:03 +0200
 Subject: [PATCH] strace: skip a number of load-sensitive tests
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index a83eb49ba3..8895b0ff9e 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From 7066b2e49ddbde0379ca52cebeefeca4f80fb75b Mon Sep 17 00:00:00 2001
+From be1b3d74ca4ffb3c8d3e38fdb96f23d5920f8ef1 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
diff --git a/meta/recipes-devtools/strace/strace_7.1.bb b/meta/recipes-devtools/strace/strace_7.2.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_7.1.bb
rename to meta/recipes-devtools/strace/strace_7.2.bb
index b5c6543da0..6ae1de7c0b 100644
--- a/meta/recipes-devtools/strace/strace_7.1.bb
+++ b/meta/recipes-devtools/strace/strace_7.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
 SRC_URI:append:libc-musl = "\
            file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "
-SRC_URI[sha256sum] = "81743ecf2a5b44186b2f5038afdc8beda7e5c70aed15b4fbfbcc6e9ece24490f"
+SRC_URI[sha256sum] = "4bde6246926890dcee824f6e6ac42a06752f47d77e5097d86e3c0d6d4b709fe5"
 
 inherit autotools github-releases ptest
 
-- 
2.47.1


--===============2088966030244473343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/strace: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/strace: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/strace: SRC_URI changed from "https://github.com/strace/strace/releases//download/v7.1/strace-7.1.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch file://0002-tests-Replace-off64_t-with-off_t.patch file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch" to "https://github.com/strace/strace/releases//download/v7.2/strace-7.2.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch file://0002-tests-Replace-off64_t-with-off_t.patch file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch"
packages/x86-64-v3-poky-linux/strace/strace-dbg: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/strace/strace-dbg: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/strace/strace-dbg: PKGSIZE changed from 88311128 to 75939872 (-14%)
packages/x86-64-v3-poky-linux/strace/strace-dev: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/strace/strace-dev: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/strace/strace-doc: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/strace/strace-doc: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/strace/strace-doc: PKGSIZE changed from 62296 to 62317 (+0%)
packages/x86-64-v3-poky-linux/strace/strace-locale: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/strace/strace-locale: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/strace/strace-ptest: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/strace/strace-ptest: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/strace/strace-ptest: PKGSIZE changed from 36631935 to 35703820 (-3%)
packages/x86-64-v3-poky-linux/strace/strace-src: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/strace/strace-src: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/strace/strace-src: PKGSIZE changed from 11905375 to 11978361 (+1%)
packages/x86-64-v3-poky-linux/strace/strace-src: FILELIST: directory renamed /usr/src/debug/strace/7.1/bundled/linux/include/uapi/linux/netfilter/ipset -> /usr/src/debug/strace/7.2/bundled/linux/include/uapi/linux/netfilter/ipset, directory renamed /usr/src/debug/strace/7.1/src/linux/x86_64 -> /usr/src/debug/strace/7.2/src/linux/x86_64, directory renamed /usr/src/debug/strace/7.1/bundled/linux/include/uapi/linux/io_uring -> /usr/src/debug/strace/7.2/bundled/linux/include/uapi/linux/io_uring, directory renamed /usr/src/debug/strace/7.1/src/linux/generic -> /usr/src/debug/strace/7.2/src/linux/generic, directory renamed /usr/src/debug/strace/7.1/src/linux/i386 -> /usr/src/debug/strace/7.2/src/linux/i386, directory renamed /usr/src/debug/strace/7.1/bundled/linux/include/uapi/linux -> /usr/src/debug/strace/7.2/bundled/linux/include/uapi/linux, directory renamed /usr/src/debug/strace/7.1/bundled/linux/include/uapi/asm -> /usr/src/debug/strace/7.2/bundled/linux/include/uapi/asm, directory r
 enamed /usr/src/debug/strace/7.1/bundled/linux/include/uapi/mtd -> /usr/src/debug/strace/7.2/bundled/linux/include/uapi/mtd, directory renamed /usr/src/debug/strace/7.1/bundled/linux/include/uapi/rdma -> /usr/src/debug/strace/7.2/bundled/linux/include/uapi/rdma, directory renamed /usr/src/debug/strace/7.1/bundled/linux/include/uapi/linux/sched -> /usr/src/debug/strace/7.2/bundled/linux/include/uapi/linux/sched, directory renamed /usr/src/debug/strace/7.1/bundled/linux/include/uapi/linux/netfilter -> /usr/src/debug/strace/7.2/bundled/linux/include/uapi/linux/netfilter, directory renamed /usr/src/debug/strace/7.1/src/gen -> /usr/src/debug/strace/7.2/src/gen, removed "/usr/src/debug/strace/7.1/src/dm.c /usr/src/debug/strace/7.1/src/io.c /usr/src/debug/strace/7.1/src/mq.c /usr/src/debug/strace/7.1/tests/s390_sthyi.c /usr/src/debug/strace/7.1/src/xlat/uring_iowq_acct.h /usr/src/debug/strace/7.1/src/fetch_indirect_syscall_args.c /usr/src/debug/strace/7.1/src/xlat/clocknames.h /usr/src/deb
 ug/strace/7.1/tests/open--secontext.c /usr/src/debug/strace/7.1/src/v4l2.c /usr/src/debug/strace/7.1/tests/sockopt-timestamp.c /usr/src/debug/strace/7.1/src/print_timespec.h /usr/src/debug/strace/7.1/src/xlat/setsock_ipv6_options.h /usr/src/debug/strace/7.1/src/xlat/getsock_ipv6_options.h /usr/src/debug/strace/7.1/tests/ioctl_random.c /usr/src/debug/strace/7.1/src/xlat/perf_ioctl_flags.h /usr/src/debug/strace/7.1/tests/sockopt-sol_netlink.c /usr/src/debug/strace/7.1/tests/perf_event_open.c /usr/src/debug/strace/7.1/src/xlat/rtnl_family.h /usr/src/debug/strace/7.1/tests/ioctl_kvm_run_auxstr_vcpu.c /usr/src/debug/strace/7.1/src/xlat/neighbor_cache_entry_flags.h /usr/src/debug/strace/7.1/src/xlat/btrfs_balance_ctl_cmds.h /usr/src/debug/strace/7.1/src/xlat/sock_udp_options.h /usr/src/debug/strace/7.1/tests/check_sigign.c /usr/src/debug/strace/7.1/tests/faccessat--secontext.c /usr/src/debug/strace/7.1/tests/rt_sigsuspend.c /usr/src/debug/strace/7.1/tests/flock.c /usr/src/debug/strace/7.1
 /src/xlat/pr_riscv_icache_flush_ctxes.h /usr/src/debug/strace/7.1/tests/libmmsg.c /usr/src/debug/strace/7.1/tests/pc.c /usr/src/debug/strace/7.1/src/xlat/uffd_writeprotect_mode_flags.h /usr/src/debug/strace/7.1/tests/nlattr_ifla_xdp.c /usr/src/debug/strace/7.1/src/fsconfig.c /usr/src/debug/strace/7.1/tests/prctl-arg2-intptr.c /usr/src/debug/strace/7.1/tests/io_uring_enter.c /usr/src/debug/strace/7.1/tests/link.c /usr/src/debug/strace/7.1/src/xlat/personality_types.h /usr/src/debug/strace/7.1/tests/printstr.c /usr/src/debug/strace/7.1/tests/nfnetlink_queue.c /usr/src/debug/strace/7.1/tests/nfnetlink_ipset.c /usr/src/debug/strace/7.1/src/xlat/mmap_prot.h /usr/src/debug/strace/7.1/src/xlat/f_owner_types.h /usr/src/debug/strace/7.1/tests/s390_pci_mmio_read_write.c /usr/src/debug/strace/7.1/tests/sched_xetaffinity.c /usr/src/debug/strace/7.1/tests/test_ucopy.c /usr/src/debug/strace/7.1/tests/test_ucopy.h /usr/src/debug/strace/7.1/tests/file_handle.c /usr/src/debug/strace/7.1/tests/getden
 ts.c /usr/src/debug/strace/7.1/tests/getgid32.c /usr/src/debug/strace/7.1/tests/getuid32.c /usr/src/debug/strace/7.1/src/xlat/bpf_map_update_elem_flags.h /usr/src/debug/strace/7.1/tests/dup.c /usr/src/debug/strace/7.1/src/regset.c /usr/src/debug/strace/7.1/tests/ioctl_evdev-success.c /usr/src/debug/strace/7.1/src/xlat/counter_ioctl_event_types.h /usr/src/debug/strace/7.1/src/xlat/seccomp_ioctl_resp_flags.h /usr/src/debug/strace/7.1/src/netlink_unix_diag.c /usr/src/debug/strace/7.1/tests/openat.c /usr/src/debug/strace/7.1/tests/ptrace_set_syscall_info.c /usr/src/debug/strace/7.1/tests/waitpid.c /usr/src/debug/strace/7.1/src/xlat/nf_hook_msg_types.h /usr/src/debug/strace/7.1/tests/prctl-pdeathsig.c /usr/src/debug/strace/7.1/src/watchdog_ioctl.c /usr/src/debug/strace/7.1/tests/readlinkat.c /usr/src/debug/strace/7.1/tests/times-fail.c /usr/src/debug/strace/7.1/tests/removexattrat.c /usr/src/debug/strace/7.1/tests/unlink.c /usr/src/debug/strace/7.1/src/numa.c /usr/src/debug/strace/7.1/sr
 c/xlat/crypto_nl_attrs.h /usr/src/debug/strace/7.1/src/xlat/btrfs_dev_replace_cmds.h /usr/src/debug/strace/7.1/tests/unblock_reset_raise.c /usr/src/debug/strace/7.1/src/xlat/falloc_flags.h /usr/src/debug/strace/7.1/tests/setuid32.c /usr/src/debug/strace/7.1/src/xlat/fs_ioc_flags.h /usr/src/debug/strace/7.1/tests/setgid32.c /usr/src/debug/strace/7.1/tests/sendfile.c /usr/src/debug/strace/7.1/tests/open_tree_attr.c /usr/src/debug/strace/7.1/src/xlat/mtd_flags_options.h /usr/src/debug/strace/7.1/src/xlat/uring_mem_region_reg_flags.h /usr/src/debug/strace/7.1/tests/getpeername.c /usr/src/debug/strace/7.1/tests/getsockname.c /usr/src/debug/strace/7.1/src/kernel_timespec.h /usr/src/debug/strace/7.1/src/xlat/term_lflags.h /usr/src/debug/strace/7.1/tests/nlattr_nhmsg.c /usr/src/debug/strace/7.1/src/xlat/bootflags2.h /usr/src/debug/strace/7.1/src/string_to_uint.h /usr/src/debug/strace/7.1/src/string_to_uint.c /usr/src/debug/strace/7.1/tests/qual_inject-retval.c /usr/src/debug/strace/7.1/test
 s/nlattr_ifaddrmsg.c /usr/src/debug/strace/7.1/tests/qual_inject-signal.c /usr/src/debug/strace/7.1/src/xlat/syslog_action_type.h /usr/src/debug/strace/7.1/src/xlat/genl_nl80211_cmd.h /usr/src/debug/strace/7.1/tests/mq_sendrecv.c /usr/src/debug/strace/7.1/tests/umovestr_cached.c /usr/src/debug/strace/7.1/src/xgetdents.h /usr/src/debug/strace/7.1/tests/dup3.c /usr/src/debug/strace/7.1/src/xgetdents.c /usr/src/debug/strace/7.1/src/netlink_crypto.c /usr/src/debug/strace/7.1/tests/kernel_version.c /usr/src/debug/strace/7.1/tests/chmod.c /usr/src/debug/strace/7.1/tests/prctl-unalign.c /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_vf_port_attrs.h /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_vf_link_states.h /usr/src/debug/strace/7.1/tests/ptrace_syscall_info.c /usr/src/debug/strace/7.1/src/xlat/ioprio_who.h /usr/src/debug/strace/7.1/tests/mlock2.c /usr/src/debug/strace/7.1/tests/lsm_get_self_attr.c /usr/src/debug/strace/7.1/tests/lsm_set_self_attr.c /usr/src/debug/strace/7.1/src/xlat/sock_
 packet_options.h /usr/src/debug/strace/7.1/src/xlat/syslog_console_levels.h /usr/src/debug/strace/7.1/src/netlink_netlink_diag.c /usr/src/debug/strace/7.1/src/xlat/mount_setattr_flags.h /usr/src/debug/strace/7.1/src/xlat/mptcp_subflow_flags.h /usr/src/debug/strace/7.1/tests/listmount.c /usr/src/debug/strace/7.1/src/xlat/rtnl_nexthop_grp_types.h /usr/src/debug/strace/7.1/tests/xstatfsx.c /usr/src/debug/strace/7.1/tests/symlink.c /usr/src/debug/strace/7.1/tests/sysinfo.c /usr/src/debug/strace/7.1/src/xlat/uring_register_opcode_flags.h /usr/src/debug/strace/7.1/src/xlat/membarrier_flags.h /usr/src/debug/strace/7.1/src/xlat/evdev_relative_axes.h /usr/src/debug/strace/7.1/src/xlat/pidfd_open_flags.h /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_brport_attrs.h /usr/src/debug/strace/7.1/tests/ioperm.c /usr/src/debug/strace/7.1/src/xlat/pr_unalign_flags.h /usr/src/debug/strace/7.1/tests/swap.c /usr/src/debug/strace/7.1/src/fstatfs64.c /usr/src/debug/strace/7.1/src/xlat/ifstats_af_spec_mpls_a
 ttrs.h /usr/src/debug/strace/7.1/src/xlat/gpio_v2_line_attr_ids.h /usr/src/debug/strace/7.1/src/sendfile.c /usr/src/debug/strace/7.1/tests/symlinkat.c /usr/src/debug/strace/7.1/src/xlat/kd_key_dead_keys.h /usr/src/debug/strace/7.1/src/get_robust_list.c /usr/src/debug/strace/7.1/src/xlat/kd_key_lock_keys.h /usr/src/debug/strace/7.1/src/xlat/kd_key_spec_keys.h /usr/src/debug/strace/7.1/tests/nlattr_netconfmsg.c /usr/src/debug/strace/7.1/tests/ioctl_ptp.c /usr/src/debug/strace/7.1/src/xlat/sock_type_flags.h /usr/src/debug/strace/7.1/tests/acct.c /usr/src/debug/strace/7.1/src/xlat/personality_flags.h /usr/src/debug/strace/7.1/tests/seccomp_get_action_avail.c /usr/src/debug/strace/7.1/src/xlat/mlockall_flags.h /usr/src/debug/strace/7.1/src/xlat/evdev_ff_status.h /usr/src/debug/strace/7.1/tests/net-accept-connect.c /usr/src/debug/strace/7.1/tests/strace-k-z.c /usr/src/debug/strace/7.1/src/xlat/kd_default_led_flags.h /usr/src/debug/strace/7.1/tests/so_peerpidfd.c /usr/src/debug/strace/7.1/
 tests/pidns-cache.c /usr/src/debug/strace/7.1/src/xlat/snmp_icmp6_stats.h /usr/src/debug/strace/7.1/tests/seccomp-filter.c /usr/src/debug/strace/7.1/src/xlat/epollevents.h /usr/src/debug/strace/7.1/src/xlat/pr_tsc.h /usr/src/debug/strace/7.1/src/xlat/shutdown_modes.h /usr/src/debug/strace/7.1/tests/nlattr_unix_diag_msg.c /usr/src/debug/strace/7.1/src/print_time.c /usr/src/debug/strace/7.1/tests/int_0x80.c /usr/src/debug/strace/7.1/tests/nlattr_ndmsg.c /usr/src/debug/strace/7.1/src/xlat/evdev_ff_types.h /usr/src/debug/strace/7.1/src/xlat/advise.h /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_vfinfo_list_attrs.h /usr/src/debug/strace/7.1/src/xlat/ptrace_syscall_info_op.h /usr/src/debug/strace/7.1/src/rtnl_addrlabel.c /usr/src/debug/strace/7.1/tests/fork--pidns-translation.c /usr/src/debug/strace/7.1/tests/block_reset_raise_run.c /usr/src/debug/strace/7.1/tests/fadvise.h /usr/src/debug/strace/7.1/src/xlat/priorities.h /usr/src/debug/strace/7.1/src/xlat/counter_ioctl_component_types.h /u
 sr/src/debug/strace/7.1/tests/kill_child.c /usr/src/debug/strace/7.1/src/xlat/uring_rw_attr_flags.h /usr/src/debug/strace/7.1/src/xlat/uffd_continue_mode_flags.h /usr/src/debug/strace/7.1/src/xlat/dirent_types.h /usr/src/debug/strace/7.1/src/xlat/sigact_flags.h /usr/src/debug/strace/7.1/src/xlat/umount_flags.h /usr/src/debug/strace/7.1/tests/mknod.c /usr/src/debug/strace/7.1/src/listmount.c /usr/src/debug/strace/7.1/src/print_msgbuf.c /usr/src/debug/strace/7.1/src/xlat/inet_diag_ulp_info_attrs.h /usr/src/debug/strace/7.1/src/xlat/nfc_sockaddr_protocols.h /usr/src/debug/strace/7.1/src/xlat/loop_flags_options.h /usr/src/debug/strace/7.1/tests/ioctl_evdev.c /usr/src/debug/strace/7.1/src/xlat/futexwakecmps.h /usr/src/debug/strace/7.1/tests/pkey_free.c /usr/src/debug/strace/7.1/src/iovec.h /usr/src/debug/strace/7.1/src/xlat/bluetooth_l2_cid.h /usr/src/debug/strace/7.1/src/ptrace_syscall_info.h /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_af_spec_bridge_attrs.h /usr/src/debug/strace/7.1/t
 ests/sched_xetscheduler.c /usr/src/debug/strace/7.1/src/xlat/v4l2_input_types.h /usr/src/debug/strace/7.1/src/ptrace_syscall_info.c /usr/src/debug/strace/7.1/tests/openat2.c /usr/src/debug/strace/7.1/src/xlat/pr_riscv_icache_flush_scopes.h /usr/src/debug/strace/7.1/tests/readlink.c /usr/src/debug/strace/7.1/tests/recvfrom.c /usr/src/debug/strace/7.1/tests/renameat.c /usr/src/debug/strace/7.1/src/fetch_struct_mmsghdr.c /usr/src/debug/strace/7.1/tests/sync.c /usr/src/debug/strace/7.1/tests/xchownx.c /usr/src/debug/strace/7.1/tests/utimensat.c /usr/src/debug/strace/7.1/src/xlat/statmount_sb_flags.h /usr/src/debug/strace/7.1/tests/ioctl_block.c /usr/src/debug/strace/7.1/src/xlat/kd_key_brl_keys.h /usr/src/debug/strace/7.1/src/move_mount.c /usr/src/debug/strace/7.1/src/xlat/kd_key_cur_keys.h /usr/src/debug/strace/7.1/src/xlat/kd_key_pad_keys.h /usr/src/debug/strace/7.1/src/xlat/rtnl_tca_root_flags.h /usr/src/debug/strace/7.1/src/xlat/inet_diag_extended_flags.h /usr/src/debug/strace/7.1/s
 rc/xlat/ifstats_xstats_bond_3ad_attrs.h /usr/src/debug/strace/7.1/src/xlat/pr_riscv_v_states.h /usr/src/debug/strace/7.1/tests/net-icmp_filter.c /usr/src/debug/strace/7.1/src/syslog.c /usr/src/debug/strace/7.1/tests/nfnetlink_osf.c /usr/src/debug/strace/7.1/src/stat.h /usr/src/debug/strace/7.1/src/xlat.h /usr/src/debug/strace/7.1/src/printers.h /usr/src/debug/strace/7.1/tests/set_sigblock.c /usr/src/debug/strace/7.1/src/stat.c /usr/src/debug/strace/7.1/src/xlat.c /usr/src/debug/strace/7.1/tests/nlattr_ifla.h /usr/src/debug/strace/7.1/src/xlat/secbits.h /usr/src/debug/strace/7.1/src/xlat/lwtunnel_encap_types.h /usr/src/debug/strace/7.1/src/xlat/bpf_src.h /usr/src/debug/strace/7.1/tests/vhangup.c /usr/src/debug/strace/7.1/tests/getgid.c /usr/src/debug/strace/7.1/src/xlat/resources.h /usr/src/debug/strace/7.1/src/xlat/seccomp_mode.h /usr/src/debug/strace/7.1/tests/mincore.c /usr/src/debug/strace/7.1/src/xlat/hdio_busstates.h /usr/src/debug/strace/7.1/src/xlat/v4l2_buf_flags.h /usr/src/
 debug/strace/7.1/src/xlat/v4l2_buf_types.h /usr/src/debug/strace/7.1/src/count.c /usr/src/debug/strace/7.1/src/mount.c /usr/src/debug/strace/7.1/tests/sol_tipc-importance.c /usr/src/debug/strace/7.1/tests/accept.c /usr/src/debug/strace/7.1/tests/looping_threads.c /usr/src/debug/strace/7.1/src/xlat/f_seals.h /usr/src/debug/strace/7.1/src/xlat/scmvals.h /usr/src/debug/strace/7.1/tests/prctl-capbset.c /usr/src/debug/strace/7.1/tests/userfaultfd.c /usr/src/debug/strace/7.1/tests/set_ptracer_any.c /usr/src/debug/strace/7.1/src/open.c /usr/src/debug/strace/7.1/src/syscall_name.c /usr/src/debug/strace/7.1/tests/zeroargc.c /usr/src/debug/strace/7.1/src/xstring.h /usr/src/debug/strace/7.1/src/xlat/execveat_flags.h /usr/src/debug/strace/7.1/tests/hexquote_strndup.c /usr/src/debug/strace/7.1/tests/timer_xettime.c /usr/src/debug/strace/7.1/src/xlat/inotify_init_flags.h /usr/src/debug/strace/7.1/tests/tkill.c /usr/src/debug/strace/7.1/src/xlat/bpf_link_create_uprobe_multi_flags.h /usr/src/debug/
 strace/7.1/tests/sprintrc.c /usr/src/debug/strace/7.1/src/xlat/bpf_link_create_kprobe_multi_flags.h /usr/src/debug/strace/7.1/src/xlat/wait4_options.h /usr/src/debug/strace/7.1/tests/nlattr_cachereport.c /usr/src/debug/strace/7.1/src/xlat/prctl_options.h /usr/src/debug/strace/7.1/tests/fchmodat2.c /usr/src/debug/strace/7.1/tests/ioctl_lirc.c /usr/src/debug/strace/7.1/src/dirent.c /usr/src/debug/strace/7.1/src/xlat/access_modes.h /usr/src/debug/strace/7.1/src/xlat/sigbus_codes.h /usr/src/debug/strace/7.1/src/xlat/sigsys_codes.h /usr/src/debug/strace/7.1/src/xlat/statfs_flags.h /usr/src/debug/strace/7.1/tests/ioctl_loop.c /usr/src/debug/strace/7.1/src/xlat/rtnl_neightbl_attrs.h /usr/src/debug/strace/7.1/src/xlat/sock_shutdown_flags.h /usr/src/debug/strace/7.1/src/xlat/sock_pppol2tp_options.h /usr/src/debug/strace/7.1/src/xlat/nbd_ioctl_flags.h /usr/src/debug/strace/7.1/src/xlat/genl_ethtool_msg_recv.h /usr/src/debug/strace/7.1/src/xlat/netlink_protocols.h /usr/src/debug/strace/7.1/src
 /xlat/genl_ethtool_msg_send.h /usr/src/debug/strace/7.1/tests/setgroups32.c /usr/src/debug/strace/7.1/src/netlink.h /usr/src/debug/strace/7.1/src/xlat/uring_async_cancel_flags.h /usr/src/debug/strace/7.1/tests/signal2name.c /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_af_spec_bridge_vlan_tunnel_info_attrs.h /usr/src/debug/strace/7.1/src/netlink.c /usr/src/debug/strace/7.1/tests/setpgrp-exec.c /usr/src/debug/strace/7.1/src/file_attr.c /usr/src/debug/strace/7.1/src/netlink_generic.c /usr/src/debug/strace/7.1/tests/process_mrelease.c /usr/src/debug/strace/7.1/src/xlat/loop_crypt_type_options.h /usr/src/debug/strace/7.1/src/netlink_generic.h /usr/src/debug/strace/7.1/src/printsiginfo.c /usr/src/debug/strace/7.1/src/xlat/rtnl_tc_attrs.h /usr/src/debug/strace/7.1/src/xlat/nl_bridge_vlan_flags.h /usr/src/debug/strace/7.1/src/inotify_ioctl.c /usr/src/debug/strace/7.1/src/xlat/sock_alg_options.h /usr/src/debug/strace/7.1/src/printsiginfo.h /usr/src/debug/strace/7.1/tests/prctl-set_vma.c /usr
 /src/debug/strace/7.1/src/xlat/inet_diag_ulp_info_mptcp_attrs.h /usr/src/debug/strace/7.1/src/signalfd.c /usr/src/debug/strace/7.1/src/xlat/rtnl_netconf_attrs.h /usr/src/debug/strace/7.1/src/xlat/rtnl_nexthop_attrs.h /usr/src/debug/strace/7.1/src/xlat/sigsegv_codes.h /usr/src/debug/strace/7.1/src/xlat/uring_setup_flags.h /usr/src/debug/strace/7.1/src/kernel_types.h /usr/src/debug/strace/7.1/src/xlat/btrfs_scrub_flags.h /usr/src/debug/strace/7.1/src/xlat/v4l2_tuner_types.h /usr/src/debug/strace/7.1/src/xlat/bpf_mode.h /usr/src/debug/strace/7.1/tests/futex_waitv.c /usr/src/debug/strace/7.1/src/xlat/kd_meta_vals.h /usr/src/debug/strace/7.1/tests/rt_tgsigqueueinfo.c /usr/src/debug/strace/7.1/tests/bpf-obj_get_info_by_fd.c /usr/src/debug/strace/7.1/tests/faccessat-y--secontext.c /usr/src/debug/strace/7.1/src/io_uring.c /usr/src/debug/strace/7.1/src/xlat/pr_tagged_addr_enable.h /usr/src/debug/strace/7.1/tests/lookup_dcookie.c /usr/src/debug/strace/7.1/src/xlat/pr_mce_kill.h /usr/src/debug
 /strace/7.1/tests/nlattr_netlink_diag_msg.c /usr/src/debug/strace/7.1/tests/netlink_route.c /usr/src/debug/strace/7.1/tests/stack-fcall-1.c /usr/src/debug/strace/7.1/tests/status-failed.c /usr/src/debug/strace/7.1/tests/stack-fcall-3.c /usr/src/debug/strace/7.1/src/xlat/v4l2_vbi_flags.h /usr/src/debug/strace/7.1/src/xlat/af_packet_types.h /usr/src/debug/strace/7.1/tests/pidfd_getfd.c /usr/src/debug/strace/7.1/src/xlat/v4l2_std_ids.h /usr/src/debug/strace/7.1/src/bpf_filter.c /usr/src/debug/strace/7.1/tests/sol_tipc-group_join.c /usr/src/debug/strace/7.1/src/bpf_filter.h /usr/src/debug/strace/7.1/src/xlat/evdev_prop.h /usr/src/debug/strace/7.1/src/xlat/nl_policy_type_attr.h /usr/src/debug/strace/7.1/tests/nfnetlink_cthelper.c /usr/src/debug/strace/7.1/tests/erestartsys.c /usr/src/debug/strace/7.1/tests/ioctl_pidfd_get_info.c /usr/src/debug/strace/7.1/src/xlat/fsconfig_cmds.h /usr/src/debug/strace/7.1/tests/process_vm_readv_writev.c /usr/src/debug/strace/7.1/src/xlat/nf_cthelper_msg_t
 ypes.h /usr/src/debug/strace/7.1/src/xlat/kd_key_fn_keys.h /usr/src/debug/strace/7.1/src/xlat/key_reqkeys.h /usr/src/debug/strace/7.1/tests/getresugid.c /usr/src/debug/strace/7.1/tests/nlattr_mdba_router_port.c /usr/src/debug/strace/7.1/src/util.c /usr/src/debug/strace/7.1/src/xlat/ebpf_op_jmp.h /usr/src/debug/strace/7.1/src/xlat/pr_riscv_v_inherit.h /usr/src/debug/strace/7.1/tests/fallocate.c /usr/src/debug/strace/7.1/tests/remap_file_pages.c /usr/src/debug/strace/7.1/src/sync_file_range.c /usr/src/debug/strace/7.1/src/xlat/lsm_attrs.h /usr/src/debug/strace/7.1/tests/nlattr_inet_diag_req_compat.c /usr/src/debug/strace/7.1/src/rtnl_addr.c /usr/src/debug/strace/7.1/src/rtnl_link.c /usr/src/debug/strace/7.1/src/rtnl_nsid.c /usr/src/debug/strace/7.1/src/rtnl_rule.c /usr/src/debug/strace/7.1/tests/prctl-seccomp-strict.c /usr/src/debug/strace/7.1/src/xlat/v4l2_format_description_flags.h /usr/src/debug/strace/7.1/tests/clock_t_str.c /usr/src/debug/strace/7.1/tests/listns.c /usr/src/debug/
 strace/7.1/src/xlat/v4l2_control_types.h /usr/src/debug/strace/7.1/src/xlat/nf_ctnetlink_exp_msg_types.h /usr/src/debug/strace/7.1/tests/prctl_marker.c /usr/src/debug/strace/7.1/tests/getuid.c /usr/src/debug/strace/7.1/tests/waitid.c /usr/src/debug/strace/7.1/src/xmalloc.h /usr/src/debug/strace/7.1/src/xmalloc.c /usr/src/debug/strace/7.1/src/xlat/v4l2_tuner_audmodes.h /usr/src/debug/strace/7.1/tests/ioctl_fs_0x15.c /usr/src/debug/strace/7.1/src/xlat/kexec_file_load_flags.h /usr/src/debug/strace/7.1/tests/nlattr_ndtmsg.c /usr/src/debug/strace/7.1/tests/scm_pidfd-success.c /usr/src/debug/strace/7.1/src/xlat/pr_pac_keys.h /usr/src/debug/strace/7.1/tests/ioctl_sg_io_v4.c /usr/src/debug/strace/7.1/tests/open_tree.c /usr/src/debug/strace/7.1/src/netlink_route.h /usr/src/debug/strace/7.1/src/xlat/tcflsh_options.h /usr/src/debug/strace/7.1/tests/prctl-riscv-v-ctrl.c /usr/src/debug/strace/7.1/src/xlat/sock_rxrpc_options.h /usr/src/debug/strace/7.1/src/netlink_route.c /usr/src/debug/strace/7.
 1/tests/prctl-tsc.c /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_xdp_attrs.h /usr/src/debug/strace/7.1/src/xlat/rtnl_rta_metrics_attrs.h /usr/src/debug/strace/7.1/tests/mmsg_name.c /usr/src/debug/strace/7.1/src/process_vm.c /usr/src/debug/strace/7.1/tests/umoven-illptr.c /usr/src/debug/strace/7.1/src/xlat/bdaddr_types.h /usr/src/debug/strace/7.1/src/xlat/itimer_which.h /usr/src/debug/strace/7.1/src/xlat/cap_version.h /usr/src/debug/strace/7.1/tests/ftruncate.c /usr/src/debug/strace/7.1/src/xlat/bpf_attach_flags.h /usr/src/debug/strace/7.1/src/xlat/aio_iocb_flags.h /usr/src/debug/strace/7.1/src/xlat/seccomp_ioctl_addfd_flags.h /usr/src/debug/strace/7.1/tests/attach-p-cmd-cmd.c /usr/src/debug/strace/7.1/tests/sysctl.c /usr/src/debug/strace/7.1/src/xlat/genl_ioam6_cmd.h /usr/src/debug/strace/7.1/tests/nfnetlink_ctnetlink.c /usr/src/debug/strace/7.1/src/number_set.h /usr/src/debug/strace/7.1/src/membarrier.c /usr/src/debug/strace/7.1/src/number_set.c /usr/src/debug/strace/7.1/src/kd_mpe
 rs_ioctl.c /usr/src/debug/strace/7.1/src/xlat/genl_seg6_cmd.h /usr/src/debug/strace/7.1/tests/nlattr_inet_diag_req_v2.c /usr/src/debug/strace/7.1/src/xlat/v4l2_pix_fmts.h /usr/src/debug/strace/7.1/src/ipc_msg.c /usr/src/debug/strace/7.1/tests/getsid.c /usr/src/debug/strace/7.1/src/netlink_packet_diag.c /usr/src/debug/strace/7.1/src/xlat/pr_mdwe_flags.h /usr/src/debug/strace/7.1/tests/count-f.c /usr/src/debug/strace/7.1/src/pathtrace.c /usr/src/debug/strace/7.1/tests/printstrn-umoven-undumpable.c /usr/src/debug/strace/7.1/src/secontext.h /usr/src/debug/strace/7.1/tests/oldstat.c /usr/src/debug/strace/7.1/tests/s390_runtime_instr.c /usr/src/debug/strace/7.1/tests/xgetdents.c /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_info_data_bridge_attrs.h /usr/src/debug/strace/7.1/src/xlat/v4l2_tuner_rxsubchanses.h /usr/src/debug/strace/7.1/tests/ip_protocol.c /usr/src/debug/strace/7.1/src/xlat/routing_flags.h /usr/src/debug/strace/7.1/src/xlat/routing_types.h /usr/src/debug/strace/7.1/src/xlat/v
 4l2_input_status_flags.h /usr/src/debug/strace/7.1/src/print_struct_stat.c /usr/src/debug/strace/7.1/tests/status-unfinished-threads.c /usr/src/debug/strace/7.1/tests/net-yy-inet.c /usr/src/debug/strace/7.1/src/xlat/tls_info_ciphers.h /usr/src/debug/strace/7.1/tests/netlink_protocol.c /usr/src/debug/strace/7.1/src/print_dev_t.c /usr/src/debug/strace/7.1/tests/prctl-mdwe.c /usr/src/debug/strace/7.1/src/renameat.c /usr/src/debug/strace/7.1/src/xlat/statx_masks.h /usr/src/debug/strace/7.1/src/xlat/v4l2_input_capabilities_flags.h /usr/src/debug/strace/7.1/tests/old_mmap.c /usr/src/debug/strace/7.1/tests/oldfstat.c /usr/src/debug/strace/7.1/src/getpid.c /usr/src/debug/strace/7.1/tests/oldlstat.c /usr/src/debug/strace/7.1/tests/ioctl_kvm_run_auxstr_vcpu_more.c /usr/src/debug/strace/7.1/src/pidfd_ioctl.c /usr/src/debug/strace/7.1/src/capability.c /usr/src/debug/strace/7.1/src/xlat/at_statx_sync_types.h /usr/src/debug/strace/7.1/tests/_newselect.c /usr/src/debug/strace/7.1/tests/eventfd.c /
 usr/src/debug/strace/7.1/src/xlat/rtnl_nha_res_group_attrs.h /usr/src/debug/strace/7.1/tests/aio_pgetevents.c /usr/src/debug/strace/7.1/tests/umount.c /usr/src/debug/strace/7.1/src/rt_sigreturn.c /usr/src/debug/strace/7.1/src/xlat/sock_kcm_options.h /usr/src/debug/strace/7.1/tests/nfnetlink_ulog.c /usr/src/debug/strace/7.1/src/signal.c /usr/src/debug/strace/7.1/src/xlat/rtnl_neigh_attrs.h /usr/src/debug/strace/7.1/tests/net-sockaddr.c /usr/src/debug/strace/7.1/src/xlat/hdio_ide_nice.h /usr/src/debug/strace/7.1/src/poll.c /usr/src/debug/strace/7.1/tests/inject-nf.c /usr/src/debug/strace/7.1/tests/print_user_desc.c /usr/src/debug/strace/7.1/tests/linkat--secontext.c /usr/src/debug/strace/7.1/src/xlat/inet_diag_attrs.h /usr/src/debug/strace/7.1/src/xlat/unix_diag_attrs.h /usr/src/debug/strace/7.1/src/xlat/term_oflags_vtdly.h /usr/src/debug/strace/7.1/tests/execve--secontext.c /usr/src/debug/strace/7.1/src/xlat/statx_attrs.h /usr/src/debug/strace/7.1/tests/strace-n.c /usr/src/debug/stra
 ce/7.1/tests/strace-x.c /usr/src/debug/strace/7.1/tests/statfs64.c /usr/src/debug/strace/7.1/src/xlat/nl_audit_types.h /usr/src/debug/strace/7.1/src/poke.c /usr/src/debug/strace/7.1/src/poke.h /usr/src/debug/strace/7.1/tests/get_page_size.c /usr/src/debug/strace/7.1/tests/net-packet_mreq.c /usr/src/debug/strace/7.1/tests/ioctl_udmabuf.c /usr/src/debug/strace/7.1/src/xlat/netlink_ack_flags.h /usr/src/debug/strace/7.1/src/xlat/netlink_get_flags.h /usr/src/debug/strace/7.1/src/xlat/netlink_new_flags.h /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_port_attrs.h /usr/src/debug/strace/7.1/tests/sethostname.c /usr/src/debug/strace/7.1/src/xlat/fan_mark_flags.h /usr/src/debug/strace/7.1/src/xlat/fib_rule_actions.h /usr/src/debug/strace/7.1/tests/clock_xettime-common.c /usr/src/debug/strace/7.1/src/xlat/memfd_create_flags.h /usr/src/debug/strace/7.1/src/xlat/shadow_stack_flags.h /usr/src/debug/strace/7.1/src/xlat/inet6_devconf_indices.h /usr/src/debug/strace/7.1/tests/brk.c /usr/src/debug/stra
 ce/7.1/src/xlat/sock_bluetooth_options.h /usr/src/debug/strace/7.1/tests/ioctl_kvm_run.c /usr/src/debug/strace/7.1/tests/sleep-timing.c /usr/src/debug/strace/7.1/src/xlat/btrfs_snap_flags_v2.h /usr/src/debug/strace/7.1/tests/umask.c /usr/src/debug/strace/7.1/tests/nfnetlink_ctnetlink_exp.c /usr/src/debug/strace/7.1/tests/netlink_crypto.c /usr/src/debug/strace/7.1/src/umount.c /usr/src/debug/strace/7.1/tests/move_mount.c /usr/src/debug/strace/7.1/src/sysent.h /usr/src/debug/strace/7.1/tests/times.c /usr/src/debug/strace/7.1/tests/ustat.c /usr/src/debug/strace/7.1/tests/rmdir.c /usr/src/debug/strace/7.1/src/xlat/if_dqinfo_flags.h /usr/src/debug/strace/7.1/src/xlat/move_pages_flags.h /usr/src/debug/strace/7.1/tests/semop-common.c /usr/src/debug/strace/7.1/src/rtnl_tc.c /usr/src/debug/strace/7.1/src/xlat/uring_clone_buffers_flags.h /usr/src/debug/strace/7.1/tests/pidfd_send_signal.c /usr/src/debug/strace/7.1/tests/fcntl64.c /usr/src/debug/strace/7.1/src/xlat/ipc_private.h /usr/src/debug
 /strace/7.1/src/xlat/netfilter_versions.h /usr/src/debug/strace/7.1/src/xlat/tee_ioctl_optee_caps.h /usr/src/debug/strace/7.1/src/xlat/mount_attr_propagation.h /usr/src/debug/strace/7.1/src/xlat/nl_selinux_types.h /usr/src/debug/strace/7.1/src/xlat/v4l2_sliced_flags.h /usr/src/debug/strace/7.1/tests/getresgid32.c /usr/src/debug/strace/7.1/tests/getresuid32.c /usr/src/debug/strace/7.1/src/xlat/term_oflags_nldly.h /usr/src/debug/strace/7.1/src/perf_event_struct.h /usr/src/debug/strace/7.1/src/sg_io_v3.c /usr/src/debug/strace/7.1/src/ioperm.c /usr/src/debug/strace/7.1/tests/fchmodat2--secontext.c /usr/src/debug/strace/7.1/tests/trie_test.c /usr/src/debug/strace/7.1/src/memfd_secret.c /usr/src/debug/strace/7.1/tests/fsconfig.c /usr/src/debug/strace/7.1/src/fanotify.c /usr/src/debug/strace/7.1/tests/finit_module.c /usr/src/debug/strace/7.1/src/xlat/rtnl_addr_attrs.h /usr/src/debug/strace/7.1/src/kernel_rusage.h /usr/src/debug/strace/7.1/tests/delete_module.c /usr/src/debug/strace/7.1/src
 /xlat/rtc_backup_switch_modes.h /usr/src/debug/strace/7.1/src/xlat/bpf_stats_type.h /usr/src/debug/strace/7.1/tests/poke.c /usr/src/debug/strace/7.1/tests/xetpgid.c /usr/src/debug/strace/7.1/src/bpf_seccomp_filter.c /usr/src/debug/strace/7.1/src/xlat/gpio_line_flags.h /usr/src/debug/strace/7.1/tests/net-yy-netlink.c /usr/src/debug/strace/7.1/src/fs_f_ioctl.c /usr/src/debug/strace/7.1/tests/dirfd.c /usr/src/debug/strace/7.1/src/futex.c /usr/src/debug/strace/7.1/src/fetch_struct_stat64.c /usr/src/debug/strace/7.1/tests/ioctl_v4l2-success.c /usr/src/debug/strace/7.1/src/xlat/clone_flags.h /usr/src/debug/strace/7.1/src/xlat/mbind_flags.h /usr/src/debug/strace/7.1/src/xlat/mlock_flags.h /usr/src/debug/strace/7.1/src/xlat/modem_flags.h /usr/src/debug/strace/7.1/src/xlat/mount_flags.h /usr/src/debug/strace/7.1/src/xlat/sched_flags.h /usr/src/debug/strace/7.1/src/xlat/semop_flags.h /usr/src/debug/strace/7.1/src/fallocate.c /usr/src/debug/strace/7.1/tests/strace--decode-pids-comm.c /usr/src/
 debug/strace/7.1/tests/uname.c /usr/src/debug/strace/7.1/tests/rename.c /usr/src/debug/strace/7.1/src/xlat/netlink_states.h /usr/src/debug/strace/7.1/src/xlat/term_oflags_ffdly.h /usr/src/debug/strace/7.1/src/fetch_struct_stat.c /usr/src/debug/strace/7.1/tests/epoll_create.c /usr/src/debug/strace/7.1/tests/nlattr_ifinfomsg.c /usr/src/debug/strace/7.1/src/xlat/tee_ioctl_param_attr_types.h /usr/src/debug/strace/7.1/src/xlat/lbmd_pi_csum_types.h /usr/src/debug/strace/7.1/tests/prctl-ppc-dexcr.c /usr/src/debug/strace/7.1/src/xlat/tcp_ao_keyf_flags.h /usr/src/debug/strace/7.1/src/xlat/pr_ppc_dexcr_ctrl_flags.h /usr/src/debug/strace/7.1/src/xlat/sock_caif_options.h /usr/src/debug/strace/7.1/src/netlink_smc_diag.c /usr/src/debug/strace/7.1/tests/mknodat.c /usr/src/debug/strace/7.1/tests/tgkill.c /usr/src/debug/strace/7.1/tests/ioctl_scsi.c /usr/src/debug/strace/7.1/src/pidfd_getfd.c /usr/src/debug/strace/7.1/src/xlat/bpf_class.h /usr/src/debug/strace/7.1/tests/status-successful.c /usr/src/
 debug/strace/7.1/src/xlat/sock_llc_options.h /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_xdp_attached_mode.h /usr/src/debug/strace/7.1/src/pkeys.c /usr/src/debug/strace/7.1/tests/truncate64.c /usr/src/debug/strace/7.1/src/sigaltstack.c /usr/src/debug/strace/7.1/tests/inotify_init1.c /usr/src/debug/strace/7.1/tests/semtimedop-common.c /usr/src/debug/strace/7.1/src/retval.c /usr/src/debug/strace/7.1/tests/fork-f.c /usr/src/debug/strace/7.1/src/xlat/ioprio_class.h /usr/src/debug/strace/7.1/src/retval.h /usr/src/debug/strace/7.1/tests/prctl-pac-enabled-keys.c /usr/src/debug/strace/7.1/tests/nlattr_ifla_af_inet6.h /usr/src/debug/strace/7.1/tests/sigaltstack.c /usr/src/debug/strace/7.1/src/xlat/rtnl_dcb_attrs.h /usr/src/debug/strace/7.1/src/map_shadow_stack.c /usr/src/debug/strace/7.1/src/xlat/move_mount_flags.h /usr/src/debug/strace/7.1/src/ioctl.c /usr/src/debug/strace/7.1/src/prctl.c /usr/src/debug/strace/7.1/tests/ioctl_mtd.c /usr/src/debug/strace/7.1/tests/ioctl_nbd.c /usr/src/debug
 /strace/7.1/tests/printstrn-umoven-peekdata.c /usr/src/debug/strace/7.1/tests/rt_sigpending.c /usr/src/debug/strace/7.1/src/xlat/ieee802154_addr_types.h /usr/src/debug/strace/7.1/tests/shmxt.c /usr/src/debug/strace/7.1/tests/fsync.c /usr/src/debug/strace/7.1/tests/kcmp.c /usr/src/debug/strace/7.1/tests/pselect6-common.c /usr/src/debug/strace/7.1/src/xlat/timerfdflags.h /usr/src/debug/strace/7.1/src/xlat/ubi_data_types.h /usr/src/debug/strace/7.1/src/inotify.c /usr/src/debug/strace/7.1/src/xlat/uffd_api_features.h /usr/src/debug/strace/7.1/src/xlat/rtnl_mdba_mdb_attrs.h /usr/src/debug/strace/7.1/src/xlat/ifstats_xstats_bridge_attrs.h /usr/src/debug/strace/7.1/tests/uio.c /usr/src/debug/strace/7.1/tests/nlattr_tca_stab.c /usr/src/debug/strace/7.1/src/xlat/uring_query_ops.h /usr/src/debug/strace/7.1/src/xlat/genl_devlink_cmd.h /usr/src/debug/strace/7.1/src/xlat/packet_diag_attrs.h /usr/src/debug/strace/7.1/tests/sendfile64.c /usr/src/debug/strace/7.1/tests/statx.c /usr/src/debug/strace
 /7.1/src/xlat/name_to_handle_at_flags.h /usr/src/debug/strace/7.1/src/xlat/mdb_states.h /usr/src/debug/strace/7.1/src/xlat/smc_states.h /usr/src/debug/strace/7.1/src/xlat/tcp_states.h /usr/src/debug/strace/7.1/tests/sockopt-sol_socket.c /usr/src/debug/strace/7.1/tests/s390_guarded_storage.c /usr/src/debug/strace/7.1/src/xlat/uring_napi_ops.h /usr/src/debug/strace/7.1/tests/xgetrlimit.c /usr/src/debug/strace/7.1/src/xlat/madvise_hppa_generic_cmds.h /usr/src/debug/strace/7.1/tests/ioctl_sg_io_v3.c /usr/src/debug/strace/7.1/tests/prctl-syscall-user-dispatch.c /usr/src/debug/strace/7.1/tests/stat64.c /usr/src/debug/strace/7.1/src/xlat/netlink_diag_attrs.h /usr/src/debug/strace/7.1/tests/k_sockopt.c /usr/src/debug/strace/7.1/src/xlat/uring_enter_flags.h /usr/src/debug/strace/7.1/tests/reboot.c /usr/src/debug/strace/7.1/tests/k_sockopt.h /usr/src/debug/strace/7.1/src/xlat/genl_tcp_metrics_cmd.h /usr/src/debug/strace/7.1/src/xlat/perf_attr_size.h /usr/src/debug/strace/7.1/src/defs.h /usr/s
 rc/debug/strace/7.1/tests/semtimedop-syscall.c /usr/src/debug/strace/7.1/src/nsfs.c /usr/src/debug/strace/7.1/tests/sched_yield.c /usr/src/debug/strace/7.1/src/xlat/inet_diag_req_attrs.h /usr/src/debug/strace/7.1/src/xlat/bt_protocols.h /usr/src/debug/strace/7.1/tests/ioctl_nsfs-ns_get_pid.c /usr/src/debug/strace/7.1/src/xlat/term_cflags.h /usr/src/debug/strace/7.1/src/link.c /usr/src/debug/strace/7.1/tests/strace--syscall-limit.c /usr/src/debug/strace/7.1/tests/clock_xettime64.c /usr/src/debug/strace/7.1/tests/so_error.c /usr/src/debug/strace/7.1/src/xlat/nl_xfrm_types.h /usr/src/debug/strace/7.1/tests/sockname.c /usr/src/debug/strace/7.1/src/ucopy.c /usr/src/debug/strace/7.1/src/xlat/get_mempolicy_flags.h /usr/src/debug/strace/7.1/tests/prctl-name.c /usr/src/debug/strace/7.1/tests/print_time.c /usr/src/debug/strace/7.1/tests/statmount.c /usr/src/debug/strace/7.1/src/kcmp.c /usr/src/debug/strace/7.1/src/xlat/btrfs_key_types.h /usr/src/debug/strace/7.1/src/xlat/if_dqblk_valid.h /usr
 /src/debug/strace/7.1/src/evdev.c /usr/src/debug/strace/7.1/tests/check_sigblock.c /usr/src/debug/strace/7.1/tests/sched_getscheduler-success.c /usr/src/debug/strace/7.1/src/xlat/inet_diag_bytecodes.h /usr/src/debug/strace/7.1/tests/hexdump_strdup.c /usr/src/debug/strace/7.1/src/xlat/fsopen_flags.h /usr/src/debug/strace/7.1/src/fetch_struct_keyctl_kdf_params.c /usr/src/debug/strace/7.1/src/xlat/mpol_mode_flags.h /usr/src/debug/strace/7.1/src/xlat/open_mode_flags.h /usr/src/debug/strace/7.1/src/xlat/rtnl_tca_act_hw_stats.h /usr/src/debug/strace/7.1/src/print_instruction_pointer.c /usr/src/debug/strace/7.1/tests/semtimedop_time64.c /usr/src/debug/strace/7.1/src/color.h /usr/src/debug/strace/7.1/tests/stack-fcall.c /usr/src/debug/strace/7.1/tests/tampering-notes.c /usr/src/debug/strace/7.1/tests/stack-fcall.h /usr/src/debug/strace/7.1/src/color.c /usr/src/debug/strace/7.1/src/xlat/bpf_test_run_flags.h /usr/src/debug/strace/7.1/src/xlat/shm_resource_flags.h /usr/src/debug/strace/7.1/src
 /aio.c /usr/src/debug/strace/7.1/tests/strace--always-show-pid.c /usr/src/debug/strace/7.1/src/xlat/term_oflags_tabdly.h /usr/src/debug/strace/7.1/src/statmount.c /usr/src/debug/strace/7.1/src/gpio_ioctl.c /usr/src/debug/strace/7.1/tests/ioctl_dm.c /usr/src/debug/strace/7.1/tests/ioctl_kd.c /usr/src/debug/strace/7.1/tests/memfd_secret.c /usr/src/debug/strace/7.1/src/xlat/rxrpc_services.h /usr/src/debug/strace/7.1/src/xlat/mtd_mode_options.h /usr/src/debug/strace/7.1/tests/inode_of_sockfd.c /usr/src/debug/strace/7.1/tests/signal.c /usr/src/debug/strace/7.1/tests/wait4.c /usr/src/debug/strace/7.1/src/xlat/ptp_perout_flags.h /usr/src/debug/strace/7.1/src/xlat/gpio_v2_line_flags.h /usr/src/debug/strace/7.1/tests/printsignal.c /usr/src/debug/strace/7.1/tests/fspick.c /usr/src/debug/strace/7.1/src/perf.c /usr/src/debug/strace/7.1/src/xlat/smc_diag_extended_flags.h /usr/src/debug/strace/7.1/src/sockaddr.c /usr/src/debug/strace/7.1/src/xlat/counter_ioctl_scopes.h /usr/src/debug/strace/7.1/t
 ests/tests.h /usr/src/debug/strace/7.1/tests/nlattr_smc_diag_msg.c /usr/src/debug/strace/7.1/tests/umovestr_cached_adjacent.c /usr/src/debug/strace/7.1/tests/readahead.c /usr/src/debug/strace/7.1/src/xlat/pidfd_coredump_mask.h /usr/src/debug/strace/7.1/src/xlat/uring_recvsend_flags.h /usr/src/debug/strace/7.1/tests/group_req.c /usr/src/debug/strace/7.1/src/statfs.c /usr/src/debug/strace/7.1/src/xlat/ptrace_setoptions_flags.h /usr/src/debug/strace/7.1/src/statfs.h /usr/src/debug/strace/7.1/tests/ioctl_perf-success.c /usr/src/debug/strace/7.1/tests/getegid32.c /usr/src/debug/strace/7.1/tests/geteuid32.c /usr/src/debug/strace/7.1/src/xlat/fiemap_flags.h /usr/src/debug/strace/7.1/src/xlat/mremap_flags.h /usr/src/debug/strace/7.1/src/xlat/genl_thermal_cmd.h /usr/src/debug/strace/7.1/tests/quotactl-xfs.c /usr/src/debug/strace/7.1/tests/shutdown.c /usr/src/debug/strace/7.1/tests/answer.c /usr/src/debug/strace/7.1/src/kill_save_errno.h /usr/src/debug/strace/7.1/src/perf_ioctl.c /usr/src/deb
 ug/strace/7.1/tests/rseq_slice_yield.c /usr/src/debug/strace/7.1/tests/netlink_nlctrl.c /usr/src/debug/strace/7.1/tests/rt_sigaction.c /usr/src/debug/strace/7.1/src/xlat/sock_ipx_options.h /usr/src/debug/strace/7.1/src/xlat/neighbor_cache_entry_ext_flags.h /usr/src/debug/strace/7.1/src/xlat/sock_rds_options.h /usr/src/debug/strace/7.1/src/getcwd.c /usr/src/debug/strace/7.1/tests/pkey_alloc.c /usr/src/debug/strace/7.1/tests/nlattr_ifla_linkinfo.c /usr/src/debug/strace/7.1/tests/nlattr_ifla_protinfo.c /usr/src/debug/strace/7.1/src/xlat/ubi_volume_flags.h /usr/src/debug/strace/7.1/src/kernel_v4l2_types.h /usr/src/debug/strace/7.1/tests/nlattr_tc_stats.c /usr/src/debug/strace/7.1/tests/setns-report-ns-id.c /usr/src/debug/strace/7.1/tests/tail_alloc.c /usr/src/debug/strace/7.1/tests/tee.c /usr/src/debug/strace/7.1/src/xlat/uffd_register_ioctl_flags.h /usr/src/debug/strace/7.1/tests/nsyscalls.h /usr/src/debug/strace/7.1/src/ipc.c /usr/src/debug/strace/7.1/src/rtc.c /usr/src/debug/strace/7
 .1/tests/nsyscalls.c /usr/src/debug/strace/7.1/src/loop.c /usr/src/debug/strace/7.1/src/xlat/perf_hw_cache_id.h /usr/src/debug/strace/7.1/src/xlat/landlock_rule_types.h /usr/src/debug/strace/7.1/src/xlat/inet_diag_bpf_storages_attrs.h /usr/src/debug/strace/7.1/src/sys_func.h /usr/src/debug/strace/7.1/src/xlat/tee_ioctl_shm_flags.h /usr/src/debug/strace/7.1/src/bpf_fprog.h /usr/src/debug/strace/7.1/src/iopl.c /usr/src/debug/strace/7.1/src/xlat/getrandom_flags.h /usr/src/debug/strace/7.1/src/xlat/nf_ulog_msg_types.h /usr/src/debug/strace/7.1/tests/netlink_netlink_diag.c /usr/src/debug/strace/7.1/tests/nlattr_ifla_af_spec.c /usr/src/debug/strace/7.1/tests/ioctl_winsize.c /usr/src/debug/strace/7.1/tests/so_linger.c /usr/src/debug/strace/7.1/src/xlat/compat_ptrace_cmds.h /usr/src/debug/strace/7.1/src/xlat/mtd_nandecc_options.h /usr/src/debug/strace/7.1/src/xlat/ebpf_class.h /usr/src/debug/strace/7.1/src/xlat/bpf_file_flags.h /usr/src/debug/strace/7.1/src/xlat/sock_tcp_options.h /usr/src/
 debug/strace/7.1/tests/pselect6_time64.c /usr/src/debug/strace/7.1/src/xlat/ns_type.h /usr/src/debug/strace/7.1/src/xlat/evdev_leds.h /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_br_mcast_querier_attrs.h /usr/src/debug/strace/7.1/src/xlat/kexec_arch_values.h /usr/src/debug/strace/7.1/src/print_fields.h /usr/src/debug/strace/7.1/src/print_mq_attr.c /usr/src/debug/strace/7.1/tests/pwritev.c /usr/src/debug/strace/7.1/src/rseq.c /usr/src/debug/strace/7.1/src/xlat/statmount_mnt_propagation.h /usr/src/debug/strace/7.1/tests/nfnetlink_cttimeout.c /usr/src/debug/strace/7.1/tests/init_delete_module.h /usr/src/debug/strace/7.1/src/xlat/nt_descriptor_types.h /usr/src/debug/strace/7.1/src/xlat/tee_ioctl_impl_ids.h /usr/src/debug/strace/7.1/src/xlat/sock_raw_options.h /usr/src/debug/strace/7.1/src/sched.c /usr/src/debug/strace/7.1/src/xlat/routing_scopes.h /usr/src/debug/strace/7.1/src/print_statfs.c /usr/src/debug/strace/7.1/src/xlat/socketcalls.h /usr/src/debug/strace/7.1/src/truncate.c /usr/s
 rc/debug/strace/7.1/src/xlat/setns_types.h /usr/src/debug/strace/7.1/tests/ioctl_ubi.c /usr/src/debug/strace/7.1/tests/request_key.c /usr/src/debug/strace/7.1/tests/cachestat.c /usr/src/debug/strace/7.1/src/xlat/tls_info_configs.h /usr/src/debug/strace/7.1/src/xlat/epollctls.h /usr/src/debug/strace/7.1/tests/fchmod.c /usr/src/debug/strace/7.1/tests/netlink_unix_diag.c /usr/src/debug/strace/7.1/src/xlat/uring_socket_ops.h /usr/src/debug/strace/7.1/tests/copy_file_range.c /usr/src/debug/strace/7.1/src/xlat/tee_ioctl_gen_caps.h /usr/src/debug/strace/7.1/tests/unix-pair-sendto-recvfrom.c /usr/src/debug/strace/7.1/tests/xattr-strings.c /usr/src/debug/strace/7.1/tests/ioctl_kvm_run_common.c /usr/src/debug/strace/7.1/src/xlat/v4l2_streaming_capabilities.h /usr/src/debug/strace/7.1/tests/vfork-f.c /usr/src/debug/strace/7.1/src/xlat/perf_event_open_flags.h /usr/src/debug/strace/7.1/tests/sched_xetattr.c /usr/src/debug/strace/7.1/tests/fcntl-common.c /usr/src/debug/strace/7.1/tests/getrandom.
 c /usr/src/debug/strace/7.1/tests/get_process_reaper.c /usr/src/debug/strace/7.1/src/xlat/v4l2_control_id_bases.h /usr/src/debug/strace/7.1/src/xlat/ptp_pin_funcs.h /usr/src/debug/strace/7.1/tests/openat--secontext.c /usr/src/debug/strace/7.1/src/fstatfs.c /usr/src/debug/strace/7.1/src/xlat/rtnl_ipmra_msg_types.h /usr/src/debug/strace/7.1/tests/fill_memory.c /usr/src/debug/strace/7.1/src/fcntl.c /usr/src/debug/strace/7.1/src/xlat/smc_decl_codes.h /usr/src/debug/strace/7.1/src/xlat/bpf_map_lookup_elem_flags.h /usr/src/debug/strace/7.1/src/rtnl_neightbl.c /usr/src/debug/strace/7.1/tests/pidns.h /usr/src/debug/strace/7.1/src/xlat/perf_hw_cache_op_id.h /usr/src/debug/strace/7.1/tests/pidns.c /usr/src/debug/strace/7.1/src/exitkill.h /usr/src/debug/strace/7.1/src/xlat/pr_sud_cmds.h /usr/src/debug/strace/7.1/src/exitkill.c /usr/src/debug/strace/7.1/src/xlat/packet_diag_show.h /usr/src/debug/strace/7.1/tests/gettid.c /usr/src/debug/strace/7.1/tests/getgroups32.c /usr/src/debug/strace/7.1/te
 sts/rseq.c /usr/src/debug/strace/7.1/src/print_timex.h /usr/src/debug/strace/7.1/tests/munlockall.c /usr/src/debug/strace/7.1/src/xlat/hw_breakpoint_len.h /usr/src/debug/strace/7.1/tests/lstat64.c /usr/src/debug/strace/7.1/src/xlat/bpf_prog_flags.h /usr/src/debug/strace/7.1/src/xlat/bpf_prog_types.h /usr/src/debug/strace/7.1/tests/nlattr_ifla_port.c /usr/src/debug/strace/7.1/src/xlat/ifaddrflags.h /usr/src/debug/strace/7.1/tests/qual_signal.c /usr/src/debug/strace/7.1/tests/count_unknown_many.c /usr/src/debug/strace/7.1/tests/epoll_pwait2.c /usr/src/debug/strace/7.1/src/xlat/rtnl_tca_act_flags.h /usr/src/debug/strace/7.1/src/nlattr.h /usr/src/debug/strace/7.1/tests/seccomp-filter-v.c /usr/src/debug/strace/7.1/src/nlattr.c /usr/src/debug/strace/7.1/tests/timerfd_xettime.c /usr/src/debug/strace/7.1/tests/ioctl_epoll.c /usr/src/debug/strace/7.1/src/swapon.c /usr/src/debug/strace/7.1/tests/clone_parent.c /usr/src/debug/strace/7.1/tests/utime.c /usr/src/debug/strace/7.1/src/xlat/ax25_pro
 tocols.h /usr/src/debug/strace/7.1/src/xlat/caif_protocols.h /usr/src/debug/strace/7.1/src/xlat/inet_protocols.h /usr/src/debug/strace/7.1/src/xlat/irda_protocols.h /usr/src/debug/strace/7.1/src/xlat/isdn_protocols.h /usr/src/debug/strace/7.1/tests/errno2name.c /usr/src/debug/strace/7.1/tests/fanotify_mark.c /usr/src/debug/strace/7.1/tests/ugetrlimit.c /usr/src/debug/strace/7.1/src/xlat/btrfs_dev_replace_results.h /usr/src/debug/strace/7.1/src/xlat/route_nexthop_flags.h /usr/src/debug/strace/7.1/src/msghdr.c /usr/src/debug/strace/7.1/src/msghdr.h /usr/src/debug/strace/7.1/src/xlat/uffd_zeropage_flags.h /usr/src/debug/strace/7.1/tests/ioctl_uffdio.c /usr/src/debug/strace/7.1/tests/netlink_sock_diag.c /usr/src/debug/strace/7.1/src/xlat/genl_ctrl_attr.h /usr/src/debug/strace/7.1/src/xlat/ipccalls.h /usr/src/debug/strace/7.1/src/xlat/kcmp_types.h /usr/src/debug/strace/7.1/src/xlat/quotatypes.h /usr/src/debug/strace/7.1/tests/tprintf.c /usr/src/debug/strace/7.1/src/alarm.c /usr/src/debug
 /strace/7.1/src/list.h /usr/src/debug/strace/7.1/src/xlat/uffd_register_mode_flags.h /usr/src/debug/strace/7.1/src/xlat/sock_ipv6_options.h /usr/src/debug/strace/7.1/src/xlat/usagewho.h /usr/src/debug/strace/7.1/src/statfs64.c /usr/src/debug/strace/7.1/src/xlat/btrfs_logical_ino_args_flags.h /usr/src/debug/strace/7.1/src/xlat/unix_diag_show.h /usr/src/debug/strace/7.1/src/xlat/v4l2_fields.h /usr/src/debug/strace/7.1/src/xlat/nf_nft_compat_msg_types.h /usr/src/debug/strace/7.1/src/print_syscall_number.c /usr/src/debug/strace/7.1/src/xlat/open_resolve_flags.h /usr/src/debug/strace/7.1/src/xlat/ptrace_cmds.h /usr/src/debug/strace/7.1/src/xlat/rtnl_ipmra_creport_attr.h /usr/src/debug/strace/7.1/tests/adjtimex.c /usr/src/debug/strace/7.1/src/xlat/v4l2_capture_modes.h /usr/src/debug/strace/7.1/tests/netlink_inet_diag.c /usr/src/debug/strace/7.1/src/bpf_attr.h /usr/src/debug/strace/7.1/src/reboot.c /usr/src/debug/strace/7.1/src/print_ifindex.c /usr/src/debug/strace/7.1/tests/threads-execve
 .c /usr/src/debug/strace/7.1/src/xlat/hw_breakpoint_type.h /usr/src/debug/strace/7.1/src/xlat/kd_font_ops.h /usr/src/debug/strace/7.1/tests/nlattr_tcmsg.c /usr/src/debug/strace/7.1/tests/env-i.c /usr/src/debug/strace/7.1/tests/init_module.c /usr/src/debug/strace/7.1/tests/mlock.c /usr/src/debug/strace/7.1/tests/arch_prctl.c /usr/src/debug/strace/7.1/src/xlat/uring_op_flags.h /usr/src/debug/strace/7.1/src/xlat/cap_mask1.h /usr/src/debug/strace/7.1/tests/nlattr.c /usr/src/debug/strace/7.1/src/xlat/sock_nfcllcp_options.h /usr/src/debug/strace/7.1/tests/preadv-pwritev.c /usr/src/debug/strace/7.1/tests/set_sigign.c /usr/src/debug/strace/7.1/tests/setfsugid.c /usr/src/debug/strace/7.1/tests/setreugid.c /usr/src/debug/strace/7.1/src/keyctl_kdf_params.h /usr/src/debug/strace/7.1/src/xlat/v4l2_sdr_fmts.h /usr/src/debug/strace/7.1/tests/fchdir.c /usr/src/debug/strace/7.1/tests/fflush.c /usr/src/debug/strace/7.1/src/xlat/futexops.h /usr/src/debug/strace/7.1/src/netlink_inet_diag.c /usr/src/deb
 ug/strace/7.1/src/xlat/fs_shutdown_flags.h /usr/src/debug/strace/7.1/tests/prlimit64.c /usr/src/debug/strace/7.1/src/rtnl_dcb.c /usr/src/debug/strace/7.1/src/xlat/pr_set_vma.h /usr/src/debug/strace/7.1/src/xlat/bpf_op_alu.h /usr/src/debug/strace/7.1/src/xlat/mctp_addrs.h /usr/src/debug/strace/7.1/tests/prctl-sme.c /usr/src/debug/strace/7.1/src/xlat/term_cmds_overlapping.h /usr/src/debug/strace/7.1/tests/prctl-sve.c /usr/src/debug/strace/7.1/tests/print_ppid_tracerpid.c /usr/src/debug/strace/7.1/tests/poke-sendfile.c /usr/src/debug/strace/7.1/tests/landlock_restrict_self.c /usr/src/debug/strace/7.1/src/xlat/rtnl_mdba_mdb_eattr_attrs.h /usr/src/debug/strace/7.1/src/xlat/rtnl_mdba_mdb_entry_attrs.h /usr/src/debug/strace/7.1/src/xlat/term_cflags_csize.h /usr/src/debug/strace/7.1/src/xlat/nf_acct_msg_types.h /usr/src/debug/strace/7.1/src/xlat/routing_protocols.h /usr/src/debug/strace/7.1/src/xlat/fsmagic.h /usr/src/debug/strace/7.1/src/xlat/tee_ioctl_origins.h /usr/src/debug/strace/7.1/t
 ests/recvfrom-MSG_TRUNC.c /usr/src/debug/strace/7.1/src/nbd_ioctl.c /usr/src/debug/strace/7.1/tests/setns.c /usr/src/debug/strace/7.1/src/xlat/term_oflags_crdly.h /usr/src/debug/strace/7.1/src/strauss.c /usr/src/debug/strace/7.1/tests/umovestr2.c /usr/src/debug/strace/7.1/tests/renameat2.c /usr/src/debug/strace/7.1/src/strauss.h /usr/src/debug/strace/7.1/src/xlat/rtnl_neigh_fdb_ext_attrs.h /usr/src/debug/strace/7.1/src/fadvise.c /usr/src/debug/strace/7.1/src/xlat/listns_user_ns_id.h /usr/src/debug/strace/7.1/src/xlat/v4l2_control_ids.h /usr/src/debug/strace/7.1/src/xlat/ifstats_xstats_bridge_mcast_indices.h /usr/src/debug/strace/7.1/src/times.c /usr/src/debug/strace/7.1/tests/list_sigaction_signum.c /usr/src/debug/strace/7.1/tests/mount_setattr.c /usr/src/debug/strace/7.1/tests/prctl-no-args.c /usr/src/debug/strace/7.1/src/xlat/ubi_volume_types.h /usr/src/debug/strace/7.1/src/xlat/open_access_modes.h /usr/src/debug/strace/7.1/src/xlat/fsmount_attr_flags.h /usr/src/debug/strace/7.1/t
 ests/so_peercred.c /usr/src/debug/strace/7.1/tests/lsm_list_modules.c /usr/src/debug/strace/7.1/tests/pipe2.c /usr/src/debug/strace/7.1/src/fetch_struct_msghdr.c /usr/src/debug/strace/7.1/tests/create_nl_socket.c /usr/src/debug/strace/7.1/tests/nlattr_nlmsgerr.c /usr/src/debug/strace/7.1/src/xlat/mtd_type_options.h /usr/src/debug/strace/7.1/tests/umovestr.c /usr/src/debug/strace/7.1/src/xlat/perf_hw_cache_op_result_id.h /usr/src/debug/strace/7.1/src/kexec.c /usr/src/debug/strace/7.1/tests/mlockall.c /usr/src/debug/strace/7.1/src/stage_output.c /usr/src/debug/strace/7.1/src/xlat/in6_addr_gen_mode.h /usr/src/debug/strace/7.1/src/xlat/file_attr_flags.h /usr/src/debug/strace/7.1/tests/recvmmsg-timeout.c /usr/src/debug/strace/7.1/src/resource.c /usr/src/debug/strace/7.1/src/xlat/keyctl_caps0.h /usr/src/debug/strace/7.1/src/xlat/keyctl_caps1.h /usr/src/debug/strace/7.1/src/xlat/msgctl_flags.h /usr/src/debug/strace/7.1/src/xlat/rtc_vl_flags.h /usr/src/debug/strace/7.1/src/xlat/semctl_flags
 .h /usr/src/debug/strace/7.1/src/xlat/shmctl_flags.h /usr/src/debug/strace/7.1/src/xlat/sigill_codes.h /usr/src/debug/strace/7.1/tests/execve.c /usr/src/debug/strace/7.1/tests/quotactl.h /usr/src/debug/strace/7.1/src/xlat/x86_xfeature_bits.h /usr/src/debug/strace/7.1/tests/quotactl.c /usr/src/debug/strace/7.1/tests/getxpid.c /usr/src/debug/strace/7.1/tests/getxuid.c /usr/src/debug/strace/7.1/src/listns.c /usr/src/debug/strace/7.1/tests/getegid.c /usr/src/debug/strace/7.1/tests/geteuid.c /usr/src/debug/strace/7.1/tests/getpgrp.c /usr/src/debug/strace/7.1/tests/getppid.c /usr/src/debug/strace/7.1/tests/getxgid.c /usr/src/debug/strace/7.1/tests/membarrier.c /usr/src/debug/strace/7.1/tests/xet_robust_list.c /usr/src/debug/strace/7.1/src/xlat/evdev_abs.h /usr/src/debug/strace/7.1/src/dyxlat.c /usr/src/debug/strace/7.1/tests/xetpriority.c /usr/src/debug/strace/7.1/src/lirc_ioctl.c /usr/src/debug/strace/7.1/src/xlat/arp_hardware_types.h /usr/src/debug/strace/7.1/tests/print_quoted_string.c
  /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_vf_stats_attrs.h /usr/src/debug/strace/7.1/src/xlat/rtnl_tca_root_attrs.h /usr/src/debug/strace/7.1/src/xlat/rtnl_tca_stab_attrs.h /usr/src/debug/strace/7.1/src/xlat/lirc_features.h /usr/src/debug/strace/7.1/src/xlat/sigprocmaskcmds.h /usr/src/debug/strace/7.1/src/xlat/x86_xfeatures.h /usr/src/debug/strace/7.1/tests/memfd_create.c /usr/src/debug/strace/7.1/src/print_kernel_sigset.c /usr/src/debug/strace/7.1/src/xlat/alg_sockaddr_flags.h /usr/src/debug/strace/7.1/src/xlat/xdp_sockaddr_flags.h /usr/src/debug/strace/7.1/tests/net-y-unix.c /usr/src/debug/strace/7.1/tests/sync_file_range.c /usr/src/debug/strace/7.1/src/xlat/genl_mptcp_pm_cmd.h /usr/src/debug/strace/7.1/tests/nfnetlink_nft_compat.c /usr/src/debug/strace/7.1/tests/clock_nanosleep.c /usr/src/debug/strace/7.1/src/bpf_sock_filter.c /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_br_boolopt_flags.h /usr/src/debug/strace/7.1/tests/prctl-mce-kill.c /usr/src/debug/strace/7.1/tests/file_x
 etattr-common.c /usr/src/debug/strace/7.1/tests/nlattr_ifla_proto_down_reason.c /usr/src/debug/strace/7.1/src/xlat/kvm_cap.h /usr/src/debug/strace/7.1/tests/ioctl_gpio.c /usr/src/debug/strace/7.1/tests/ioctl_hdio.c /usr/src/debug/strace/7.1/tests/getdents64.c /usr/src/debug/strace/7.1/tests/ioprio.c /usr/src/debug/strace/7.1/tests/redirect-fds.c /usr/src/debug/strace/7.1/tests/ioctl_nsfs-ns_mnt_get.c /usr/src/debug/strace/7.1/tests/futex_requeue.c /usr/src/debug/strace/7.1/src/xlat/seccomp_ret_action.h /usr/src/debug/strace/7.1/tests/socketcall.c /usr/src/debug/strace/7.1/src/fchownat.c /usr/src/debug/strace/7.1/src/trie.c /usr/src/debug/strace/7.1/src/xlat/uring_zcrx_reg_flags.h /usr/src/debug/strace/7.1/tests/rt_sigprocmask.c /usr/src/debug/strace/7.1/tests/at_fdcwd-pathmax.c /usr/src/debug/strace/7.1/src/trie.h /usr/src/debug/strace/7.1/tests/ip_mreq.c /usr/src/debug/strace/7.1/tests/ipc_msg.c /usr/src/debug/strace/7.1/tests/ipc_sem.c /usr/src/debug/strace/7.1/tests/ipc_shm.c /us
 r/src/debug/strace/7.1/tests/setdomainname.c /usr/src/debug/strace/7.1/tests/netlink_kobject_uevent.c /usr/src/debug/strace/7.1/src/eventfd.c /usr/src/debug/strace/7.1/tests/rt_sigtimedwait.c /usr/src/debug/strace/7.1/tests/mmap.c /usr/src/debug/strace/7.1/src/xlat/archvals.h /usr/src/debug/strace/7.1/tests/test_printpath.c /usr/src/debug/strace/7.1/src/xlat/nl_attr_type.h /usr/src/debug/strace/7.1/tests/siginfo.c /usr/src/debug/strace/7.1/src/random_ioctl.c /usr/src/debug/strace/7.1/src/xlat/sock_ax25_options.h /usr/src/debug/strace/7.1/src/mount_setattr.c /usr/src/debug/strace/7.1/src/userfaultfd.c /usr/src/debug/strace/7.1/src/xlat/evdev_switch.h /usr/src/debug/strace/7.1/tests/msg_control.c /usr/src/debug/strace/7.1/tests/getcpu.c /usr/src/debug/strace/7.1/src/hdio.c /usr/src/debug/strace/7.1/src/cachestat.c /usr/src/debug/strace/7.1/tests/chown32.c /usr/src/debug/strace/7.1/tests/printpath-umovestr.c /usr/src/debug/strace/7.1/src/cachestat.h /usr/src/debug/strace/7.1/src/xlat/m
 advise_cmds.h /usr/src/debug/strace/7.1/tests/sockaddr_xlat.c /usr/src/debug/strace/7.1/src/xlat/fspick_flags.h /usr/src/debug/strace/7.1/tests/orphaned_process_group.c /usr/src/debug/strace/7.1/src/xlat/btrfs_dev_stats_flags.h /usr/src/debug/strace/7.1/src/xlat/nf_cttimeout_msg_types.h /usr/src/debug/strace/7.1/tests/semop.c /usr/src/debug/strace/7.1/src/xlat/fsmount_flags.h /usr/src/debug/strace/7.1/src/xlat/kd_font_flags.h /usr/src/debug/strace/7.1/src/rtnl_nh.c /usr/src/debug/strace/7.1/src/print_sigevent.c /usr/src/debug/strace/7.1/src/xlat/btrfs_features_compat_ro.h /usr/src/debug/strace/7.1/src/xlat/term_oflags.h /usr/src/debug/strace/7.1/src/xlat/evdev_ev.h /usr/src/debug/strace/7.1/src/xlat/fcntlcmds.h /usr/src/debug/strace/7.1/src/xlat/flockcmds.h /usr/src/debug/strace/7.1/src/xlat/lockfcmds.h /usr/src/debug/strace/7.1/src/xlat/ptrace_peeksiginfo_flags.h /usr/src/debug/strace/7.1/src/xlat/quotacmds.h /usr/src/debug/strace/7.1/tests/inet-cmsg.c /usr/src/debug/strace/7.1/tes
 ts/oldselect-efault.c /usr/src/debug/strace/7.1/src/copy_file_range.c /usr/src/debug/strace/7.1/src/uname.c /usr/src/debug/strace/7.1/tests/pause.c /usr/src/debug/strace/7.1/tests/tcp_ao.c /usr/src/debug/strace/7.1/src/xlat/evdev_snd.h /usr/src/debug/strace/7.1/src/rtnl_mdb.c /usr/src/debug/strace/7.1/tests/getsockname--secontext.c /usr/src/debug/strace/7.1/src/xlat/nf_osf_msg_types.h /usr/src/debug/strace/7.1/tests/scm_rights.c /usr/src/debug/strace/7.1/src/xlat/sa_handler_values.h /usr/src/debug/strace/7.1/tests/landlock_add_rule.c /usr/src/debug/strace/7.1/src/xlat/v4l2_device_capabilities_flags.h /usr/src/debug/strace/7.1/tests/count_unknown.c /usr/src/debug/strace/7.1/tests/close_range.c /usr/src/debug/strace/7.1/src/sg_io_v4.c /usr/src/debug/strace/7.1/src/xlat/mtd_file_mode_options.h /usr/src/debug/strace/7.1/src/xlat/vsock_cids.h /usr/src/debug/strace/7.1/tests/getpid.c /usr/src/debug/strace/7.1/tests/test_printstrn.c /usr/src/debug/strace/7.1/src/xlat/mctl_sync.h /usr/src/d
 ebug/strace/7.1/src/ipc_shm.c /usr/src/debug/strace/7.1/tests/netlink_selinux.c /usr/src/debug/strace/7.1/tests/rt_sigreturn.c /usr/src/debug/strace/7.1/tests/epoll_create1.c /usr/src/debug/strace/7.1/src/xlat/pr_sme_vl_flags.h /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_proto_down_reason_attrs.h /usr/src/debug/strace/7.1/src/xlat/pr_sve_vl_flags.h /usr/src/debug/strace/7.1/src/xlat/btrfs_balance_flags.h /usr/src/debug/strace/7.1/tests/kexec_load.c /usr/src/debug/strace/7.1/tests/printxval.c /usr/src/debug/strace/7.1/src/xlat/faccessat_flags.h /usr/src/debug/strace/7.1/src/xlat/uring_register_rsrc_flags.h /usr/src/debug/strace/7.1/src/xlat/uffd_poison_mode_flags.h /usr/src/debug/strace/7.1/tests/ftruncate64.c /usr/src/debug/strace/7.1/src/xlat/sock_vsock_options.h /usr/src/debug/strace/7.1/tests/get_sigset_size.c /usr/src/debug/strace/7.1/src/xlat/tls_info_versions.h /usr/src/debug/strace/7.1/tests/process_madvise.c /usr/src/debug/strace/7.1/src/xlat/pr_dumpable.h /usr/src/debug/st
 race/7.1/tests/printflags.c /usr/src/debug/strace/7.1/src/xlat/unshare_flags.h /usr/src/debug/strace/7.1/tests/fanotify_init.c /usr/src/debug/strace/7.1/src/scsi.c /usr/src/debug/strace/7.1/tests/migrate_pages.c /usr/src/debug/strace/7.1/src/hostname.c /usr/src/debug/strace/7.1/src/fspick.c /usr/src/debug/strace/7.1/src/seccomp_ioctl.c /usr/src/debug/strace/7.1/src/xlat/kd_modes.h /usr/src/debug/strace/7.1/src/xlat/ebpf_op_alu.h /usr/src/debug/strace/7.1/tests/xselect.c /usr/src/debug/strace/7.1/src/xlat/v4l2_control_classes.h /usr/src/debug/strace/7.1/tests/sched_xetparam.c /usr/src/debug/strace/7.1/tests/recv-MSG_TRUNC.c /usr/src/debug/strace/7.1/src/xlat/btrfs_tree_objectids.h /usr/src/debug/strace/7.1/tests/semtimedop-ipc.c /usr/src/debug/strace/7.1/src/xlat/clone3_flags.h /usr/src/debug/strace/7.1/src/xlat/sigpoll_codes.h /usr/src/debug/strace/7.1/tests/clock_adjtime64.c /usr/src/debug/strace/7.1/src/upoke.c /usr/src/debug/strace/7.1/tests/nlattr_rtmsg.c /usr/src/debug/strace/7
 .1/src/xlat/termios_cc.h /usr/src/debug/strace/7.1/src/xlat/rtnl_mdb_attrs.h /usr/src/debug/strace/7.1/tests/prctl-riscv-icache-flush-ctx.c /usr/src/debug/strace/7.1/src/kd_ioctl.c /usr/src/debug/strace/7.1/src/xlat/ptrace_events.h /usr/src/debug/strace/7.1/src/tee.c /usr/src/debug/strace/7.1/src/ipc_msgctl.c /usr/src/debug/strace/7.1/src/ipc_semctl.c /usr/src/debug/strace/7.1/src/ipc_shmctl.c /usr/src/debug/strace/7.1/tests/readdir.c /usr/src/debug/strace/7.1/tests/recvmsg.c /usr/src/debug/strace/7.1/tests/personality.c /usr/src/debug/strace/7.1/src/xlat/bluetooth_l2_psm.h /usr/src/debug/strace/7.1/tests/ifindex.c /usr/src/debug/strace/7.1/src/xlat/netlink_sk_meminfo_indices.h /usr/src/debug/strace/7.1/tests/getxattrat.c /usr/src/debug/strace/7.1/tests/ioctl_watchdog.c /usr/src/debug/strace/7.1/src/ioprio.c /usr/src/debug/strace/7.1/src/xlat/v4l2_frameinterval_types.h /usr/src/debug/strace/7.1/src/print_utils.h /usr/src/debug/strace/7.1/tests/sigaction.c /usr/src/debug/strace/7.1/t
 ests/sigreturn.c /usr/src/debug/strace/7.1/src/xlat/snmp_ip_stats.h /usr/src/debug/strace/7.1/tests/epoll_ctl.c /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_af_spec_inet_attrs.h /usr/src/debug/strace/7.1/src/xlat/af_tipc_importance.h /usr/src/debug/strace/7.1/src/xlat/pr_spec_get_store_bypass_flags.h /usr/src/debug/strace/7.1/src/xlat/pr_spec_set_store_bypass_flags.h /usr/src/debug/strace/7.1/src/epoll.c /usr/src/debug/strace/7.1/tests/rt_sigqueueinfo.c /usr/src/debug/strace/7.1/src/xlat/rtnl_mdba_router_pattr_attrs.h /usr/src/debug/strace/7.1/tests/access.c /usr/src/debug/strace/7.1/src/rtnl_neigh.c /usr/src/debug/strace/7.1/src/rtnl_route.c /usr/src/debug/strace/7.1/src/rtnl_stats.c /usr/src/debug/strace/7.1/tests/kern_features.c /usr/src/debug/strace/7.1/src/xlat/genl_ctrl_attr_policy.h /usr/src/debug/strace/7.1/tests/sched_rr_get_interval.c /usr/src/debug/strace/7.1/src/pidfd_open.c /usr/src/debug/strace/7.1/src/xlat/ieee802154_addrs.h /usr/src/debug/strace/7.1/tests/nlattr_pack
 et_diag_msg.c /usr/src/debug/strace/7.1/tests/seccomp-strict.c /usr/src/debug/strace/7.1/tests/kill.c /usr/src/debug/strace/7.1/src/xlat/v4l2_colorspaces.h /usr/src/debug/strace/7.1/tests/pread64-pwrite64.c /usr/src/debug/strace/7.1/src/xlat/btrfs_features_incompat.h /usr/src/debug/strace/7.1/tests/preadv2-pwritev2.c /usr/src/debug/strace/7.1/tests/ioctl_sock.c /usr/src/debug/strace/7.1/tests/maybe_switch_current_tcp.c /usr/src/debug/strace/7.1/tests/pkey_mprotect.c /usr/src/debug/strace/7.1/tests/ioctl_termios.c /usr/src/debug/strace/7.1/tests/getgroups.c /usr/src/debug/strace/7.1/src/xlat/addrfams.h /usr/src/debug/strace/7.1/src/print_group_req.c /usr/src/debug/strace/7.1/tests/status.c /usr/src/debug/strace/7.1/tests/mseal.c /usr/src/debug/strace/7.1/tests/net-tpacket_stats.c /usr/src/debug/strace/7.1/src/xlat/fdflags.h /usr/src/debug/strace/7.1/tests/signalfd4.c /usr/src/debug/strace/7.1/src/get_personality.h /usr/src/debug/strace/7.1/src/xlat/fdb_notify_flags.h /usr/src/debug/s
 trace/7.1/src/trace_event.h /usr/src/debug/strace/7.1/src/xlat/ifstats_attrs.h /usr/src/debug/strace/7.1/tests/strace-p1-Y-p.c /usr/src/debug/strace/7.1/tests/futimesat.c /usr/src/debug/strace/7.1/src/xlat/v4l2_control_query_flags.h /usr/src/debug/strace/7.1/tests/ioctl_fs_f.c /usr/src/debug/strace/7.1/tests/chroot.c /usr/src/debug/strace/7.1/tests/sync_file_range2.c /usr/src/debug/strace/7.1/tests/map_shadow_stack.c /usr/src/debug/strace/7.1/src/xlat/fan_classes.h /usr/src/debug/strace/7.1/tests/nlattr_br_port_msg.c /usr/src/debug/strace/7.1/src/xlat/uring_msg_ring_flags.h /usr/src/debug/strace/7.1/src/xlat/pr_sched_core_pidtypes.h /usr/src/debug/strace/7.1/src/ubi.c /usr/src/debug/strace/7.1/src/xlat/fan_event_flags.h /usr/src/debug/strace/7.1/src/xlat/key_perms.h /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_ext_filter_flags.h /usr/src/debug/strace/7.1/src/print_sg_req_info.c /usr/src/debug/strace/7.1/src/kvm.c /usr/src/debug/strace/7.1/src/fetch_bpf_fprog.c /usr/src/debug/strace/
 7.1/src/lsm.c /usr/src/debug/strace/7.1/src/error_prints.c /usr/src/debug/strace/7.1/src/mem.c /usr/src/debug/strace/7.1/src/bjm.c /usr/src/debug/strace/7.1/tests/futex.c /usr/src/debug/strace/7.1/src/error_prints.h /usr/src/debug/strace/7.1/tests/prctl-fp-mode.c /usr/src/debug/strace/7.1/src/xlat/ip_cmsg_types.h /usr/src/debug/strace/7.1/src/xlat/ipc_msg_flags.h /usr/src/debug/strace/7.1/tests/ipc_msgbuf.c /usr/src/debug/strace/7.1/tests/getrusage.c /usr/src/debug/strace/7.1/src/xlat/btrfs_qgroup_ctl_cmds.h /usr/src/debug/strace/7.1/tests/status-none.c /usr/src/debug/strace/7.1/tests/nlattr_rtgenmsg.c /usr/src/debug/strace/7.1/src/xlat/btrfs_qgroup_status_flags.h /usr/src/debug/strace/7.1/src/xlat/watchdog_ioctl_setoptions.h /usr/src/debug/strace/7.1/src/xlat/quota_formats.h /usr/src/debug/strace/7.1/src/getrandom.c /usr/src/debug/strace/7.1/src/xlat/multicast_router_types.h /usr/src/debug/strace/7.1/tests/ksysent.c /usr/src/debug/strace/7.1/tests/ppoll.c /usr/src/debug/strace/7.1/
 src/xlat/btrfs_dev_stats_values.h /usr/src/debug/strace/7.1/src/fsmount.c /usr/src/debug/strace/7.1/tests/mount.c /usr/src/debug/strace/7.1/src/xlat/inotify_flags.h /usr/src/debug/strace/7.1/tests/is_linux_mips_n64.c /usr/src/debug/strace/7.1/src/xlat/vsock_ports.h /usr/src/debug/strace/7.1/tests/futex_wait.c /usr/src/debug/strace/7.1/src/xlat/btrfs_defrag_flags.h /usr/src/debug/strace/7.1/src/xlat/watchdog_ioctl_flags.h /usr/src/debug/strace/7.1/tests/status-detached-threads.c /usr/src/debug/strace/7.1/src/xlat/btrfs_dev_replace_state.h /usr/src/debug/strace/7.1/src/ptrace.h /usr/src/debug/strace/7.1/src/listen.c /usr/src/debug/strace/7.1/src/xlat/fib_rule_flags.h /usr/src/debug/strace/7.1/src/ptrace.c /usr/src/debug/strace/7.1/src/strace.c /usr/src/debug/strace/7.1/src/umask.c /usr/src/debug/strace/7.1/src/xlat/sock_dccp_options.h /usr/src/debug/strace/7.1/src/negated_errno.h /usr/src/debug/strace/7.1/tests/listxattrat.c /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_bridge_flags.h 
 /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_bridge_modes.h /usr/src/debug/strace/7.1/src/xlat/kvm_mem_flags.h /usr/src/debug/strace/7.1/src/mpers_type.h /usr/src/debug/strace/7.1/src/xlat/xfs_quota_flags.h /usr/src/debug/strace/7.1/src/xlat/module_init_flags.h /usr/src/debug/strace/7.1/tests/sigprocmask.c /usr/src/debug/strace/7.1/tests/preadv.c /usr/src/debug/strace/7.1/src/xlat/netlink_diag_show.h /usr/src/debug/strace/7.1/src/getcpu.c /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_br_boolopts.h /usr/src/debug/strace/7.1/src/xlat/v4l2_tuner_capabilities.h /usr/src/debug/strace/7.1/src/xlat/sched_getattr_flags.h /usr/src/debug/strace/7.1/src/xlat/sg_io_dxfer_direction.h /usr/src/debug/strace/7.1/src/xlat/rtnl_rule_attrs.h /usr/src/debug/strace/7.1/tests/setugid.c /usr/src/debug/strace/7.1/src/fetch_struct_flock.c /usr/src/debug/strace/7.1/src/fetch_struct_iovec.c /usr/src/debug/strace/7.1/src/print_timeval.c /usr/src/debug/strace/7.1/src/xlat/ip_type_of_services.h /usr/src/debug/str
 ace/7.1/src/xlat/perf_hw_id.h /usr/src/debug/strace/7.1/src/xlat/evdev_mtslots.h /usr/src/debug/strace/7.1/src/sysctl.c /usr/src/debug/strace/7.1/src/xlat/uring_zcrx_ctrl_ops.h /usr/src/debug/strace/7.1/tests/ioctl_seccomp.c /usr/src/debug/strace/7.1/tests/status-successful-threads.c /usr/src/debug/strace/7.1/tests/clock_adjtime-common.c /usr/src/debug/strace/7.1/tests/secontext.h /usr/src/debug/strace/7.1/tests/signal_receive.c /usr/src/debug/strace/7.1/src/xlat/skf_ad.h /usr/src/debug/strace/7.1/tests/netlink_audit.c /usr/src/debug/strace/7.1/tests/setrlimit.c /usr/src/debug/strace/7.1/tests/fchmod--secontext.c /usr/src/debug/strace/7.1/src/landlock.c /usr/src/debug/strace/7.1/tests/fadvise64.c /usr/src/debug/strace/7.1/src/ldt.c /usr/src/debug/strace/7.1/src/net.c /usr/src/debug/strace/7.1/tests/modify_ldt.c /usr/src/debug/strace/7.1/src/xlat/adjtimex_status.h /usr/src/debug/strace/7.1/tests/delay.c /usr/src/debug/strace/7.1/src/bind.c /usr/src/debug/strace/7.1/src/xlat/pidfd_inf
 o_mask.h /usr/src/debug/strace/7.1/src/xlat/bpf_miscop.h /usr/src/debug/strace/7.1/tests/semop-indirect.c /usr/src/debug/strace/7.1/src/xlat/blkpg_ops.h /usr/src/debug/strace/7.1/src/xlat/uring_ops.h /usr/src/debug/strace/7.1/src/print_kernel_version.c /usr/src/debug/strace/7.1/src/xlat/bsg_protocol.h /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_info_data_tun_attrs.h /usr/src/debug/strace/7.1/src/xlat/rtnl_nha_res_bucket_attrs.h /usr/src/debug/strace/7.1/tests/inotify_init.c /usr/src/debug/strace/7.1/tests/ioctl_rtc.c /usr/src/debug/strace/7.1/tests/status-all.c /usr/src/debug/strace/7.1/tests/nlattr_inet_diag_msg.c /usr/src/debug/strace/7.1/src/xlat/genl_ctrl_cmd.h /usr/src/debug/strace/7.1/tests/ioctl_tee.c /usr/src/debug/strace/7.1/src/xlat/inet_diag_ulp_info_tls_attrs.h /usr/src/debug/strace/7.1/src/xlat/futex2_flags.h /usr/src/debug/strace/7.1/src/xlat/futex2_sizes.h /usr/src/debug/strace/7.1/src/keyctl.c /usr/src/debug/strace/7.1/src/xlat/btrfs_fs_info_flags.h /usr/src/debug/s
 trace/7.1/tests/sched_get_priority_mxx.c /usr/src/debug/strace/7.1/src/xlat/landlock_scope_flags.h /usr/src/debug/strace/7.1/tests/dev-pty-yy.c /usr/src/debug/strace/7.1/tests/pidfd_open.c /usr/src/debug/strace/7.1/tests/run_expect_termsig.c /usr/src/debug/strace/7.1/src/xlat/pidfd_send_signal_flags.h /usr/src/debug/strace/7.1/src/xlat/keyctl_commands.h /usr/src/debug/strace/7.1/tests/kexec_file_load.c /usr/src/debug/strace/7.1/src/xlat/nl_netfilter_subsys_ids.h /usr/src/debug/strace/7.1/tests/dup2.c /usr/src/debug/strace/7.1/src/memfd_create.c /usr/src/debug/strace/7.1/src/xlat/term_line_discs.h /usr/src/debug/strace/7.1/tests/printstrn-umoven.c /usr/src/debug/strace/7.1/tests/setresugid.c /usr/src/debug/strace/7.1/tests/create_tmpfile.c /usr/src/debug/strace/7.1/src/term.c /usr/src/debug/strace/7.1/src/xlat/keyctl_move_flags.h /usr/src/debug/strace/7.1/src/xlat/nl_netfilter_msg_types.h /usr/src/debug/strace/7.1/src/xlat/siginfo_codes.h /usr/src/debug/strace/7.1/tests/prctl-tid_add
 ress.c /usr/src/debug/strace/7.1/src/close_range.c /usr/src/debug/strace/7.1/src/xlat/statmount_mask.h /usr/src/debug/strace/7.1/src/xlat/bpf_attach_type.h /usr/src/debug/strace/7.1/tests/oldselect.c /usr/src/debug/strace/7.1/src/xlat/adjtimex_state.h /usr/src/debug/strace/7.1/tests/filter_seccomp-flag.c /usr/src/debug/strace/7.1/tests/perf_event_open_nonverbose.c /usr/src/debug/strace/7.1/tests/prctl-cap-ambient.c /usr/src/debug/strace/7.1/src/xlat/xdp_flags.h /usr/src/debug/strace/7.1/src/xlat/pollflags.h /usr/src/debug/strace/7.1/src/xlat/rwf_flags.h /usr/src/debug/strace/7.1/src/xlat/sfd_flags.h /usr/src/debug/strace/7.1/src/xlat/shm_flags.h /usr/src/debug/strace/7.1/src/xlat/bsg_flags.h /usr/src/debug/strace/7.1/src/xlat/efd_flags.h /usr/src/debug/strace/7.1/src/time.c /usr/src/debug/strace/7.1/src/xlat/fs_xflags.h /usr/src/debug/strace/7.1/tests/nlattr_ifaddrlblmsg.c /usr/src/debug/strace/7.1/src/xlat/pr_spec_cmds.h /usr/src/debug/strace/7.1/src/xlat/inet_diag_bpf_storage_attr
 s.h /usr/src/debug/strace/7.1/tests/set_mempolicy.c /usr/src/debug/strace/7.1/tests/netlink_generic.c /usr/src/debug/strace/7.1/src/xlat/sg_io_info.h /usr/src/debug/strace/7.1/src/xlat/rseq_cs_flags.h /usr/src/debug/strace/7.1/tests/segv_accerr.c /usr/src/debug/strace/7.1/tests/mq.c /usr/src/debug/strace/7.1/tests/segv_pkuerr.c /usr/src/debug/strace/7.1/src/xlat/mount_attr_attr.h /usr/src/debug/strace/7.1/src/epoll_ioctl.c /usr/src/debug/strace/7.1/src/kernel_timeval.h /usr/src/debug/strace/7.1/src/xlat/gpio_event_flags.h /usr/src/debug/strace/7.1/src/xlat/btrfs_balance_state.h /usr/src/debug/strace/7.1/tests/quotactl_fd.c /usr/src/debug/strace/7.1/src/xlat/uring_fixed_fd_flags.h /usr/src/debug/strace/7.1/tests/dev-yy.c /usr/src/debug/strace/7.1/tests/net-yy-unix.c /usr/src/debug/strace/7.1/tests/io_uring_register.c /usr/src/debug/strace/7.1/src/sen.h /usr/src/debug/strace/7.1/src/filter_qualify.c /usr/src/debug/strace/7.1/src/sigreturn.c /usr/src/debug/strace/7.1/src/xlat/uring_zcr
 x_area_flags.h /usr/src/debug/strace/7.1/tests/getcwd.c /usr/src/debug/strace/7.1/tests/kernel_old_timespec.h /usr/src/debug/strace/7.1/src/xlat/rtnl_neightbl_parms_attrs.h /usr/src/debug/strace/7.1/src/xlat/pkey_access.h /usr/src/debug/strace/7.1/src/xlat/gpio_handle_flags.h /usr/src/debug/strace/7.1/src/xlat/btrfs_qgroup_inherit_flags.h /usr/src/debug/strace/7.1/src/xlat/landlock_ruleset_access_fs.h /usr/src/debug/strace/7.1/src/chdir.c /usr/src/debug/strace/7.1/src/xlat/pr_sched_core_cmds.h /usr/src/debug/strace/7.1/src/xlat/getsock_options.h /usr/src/debug/strace/7.1/src/xlat/setsock_options.h /usr/src/debug/strace/7.1/tests/attach-f-p-cmd.c /usr/src/debug/strace/7.1/src/xlat/keyctl_pkey_ops.h /usr/src/debug/strace/7.1/tests/localtime.c /usr/src/debug/strace/7.1/tests/lock_file.c /usr/src/debug/strace/7.1/tests/truncate.c /usr/src/debug/strace/7.1/tests/futex_wake.c /usr/src/debug/strace/7.1/tests/riscv_flush_icache.c /usr/src/debug/strace/7.1/src/xlat/btrfs_space_info_flags.h /
 usr/src/debug/strace/7.1/src/readlink.c /usr/src/debug/strace/7.1/src/xlat/netlink_socket_flags.h /usr/src/debug/strace/7.1/tests/umode_t.c /usr/src/debug/strace/7.1/src/xlat/genl_taskstats_cmd.h /usr/src/debug/strace/7.1/tests/umount2.c /usr/src/debug/strace/7.1/src/xlat/memfd_secret_flags.h /usr/src/debug/strace/7.1/tests/nlattr_crypto_user_alg.c /usr/src/debug/strace/7.1/src/xlat/ebpf_mode.h /usr/src/debug/strace/7.1/tests/ioctl_perf.c /usr/src/debug/strace/7.1/tests/stack-fcall-0.c /usr/src/debug/strace/7.1/src/netlink_selinux.c /usr/src/debug/strace/7.1/src/xlat/sigaltstack_flags.h /usr/src/debug/strace/7.1/tests/stack-fcall-2.c /usr/src/debug/strace/7.1/src/xlat/adjtimex_modes.h /usr/src/debug/strace/7.1/src/xlat/v4l2_meta_fmts.h /usr/src/debug/strace/7.1/tests/faccessat.c /usr/src/debug/strace/7.1/src/sysinfo.c /usr/src/debug/strace/7.1/src/xlat/seccomp_filter_flags.h /usr/src/debug/strace/7.1/src/filter_seccomp.h /usr/src/debug/strace/7.1/tests/nlattr_dcbmsg.c /usr/src/debug
 /strace/7.1/src/xlat/uring_nop_flags.h /usr/src/debug/strace/7.1/src/filter_seccomp.c /usr/src/debug/strace/7.1/src/xlat/rtnl_addrlabel_attrs.h /usr/src/debug/strace/7.1/tests/clone-flags.c /usr/src/debug/strace/7.1/src/xlat/sock_netlink_options.h /usr/src/debug/strace/7.1/src/xlat/uring_restriction_opcodes.h /usr/src/debug/strace/7.1/src/xlat/bpf_file_mode_flags.h /usr/src/debug/strace/7.1/src/fetch_struct_xfs_quotastat.c /usr/src/debug/strace/7.1/tests/attach-f-p.c /usr/src/debug/strace/7.1/tests/count_unknown_mixed.c /usr/src/debug/strace/7.1/tests/fsmount.c /usr/src/debug/strace/7.1/tests/fstat64.c /usr/src/debug/strace/7.1/tests/fsync-y.c /usr/src/debug/strace/7.1/src/xlat/listmount_mnt_id.h /usr/src/debug/strace/7.1/src/xlat/af_packet_versions.h /usr/src/debug/strace/7.1/src/kernel_timex.h /usr/src/debug/strace/7.1/tests/nlattr_fib_rule_hdr.c /usr/src/debug/strace/7.1/tests/fanotify_mark--secontext.c /usr/src/debug/strace/7.1/src/xlat/nlmsgerr_attrs.h /usr/src/debug/strace/7.1
 /tests/fadvise64_64.c /usr/src/debug/strace/7.1/src/xlat/kvm_exit_reason.h /usr/src/debug/strace/7.1/src/xlat/can_protocols.h /usr/src/debug/strace/7.1/src/xlat/kcm_protocols.h /usr/src/debug/strace/7.1/src/xlat/nfc_protocols.h /usr/src/debug/strace/7.1/src/xlat/perf_event_sample_format.h /usr/src/debug/strace/7.1/src/xlat/rtnl_nsid_attrs.h /usr/src/debug/strace/7.1/src/xlat/smc_protocols.h /usr/src/debug/strace/7.1/src/xlat/delete_module_flags.h /usr/src/debug/strace/7.1/tests/fchmodat.c /usr/src/debug/strace/7.1/tests/fchown32.c /usr/src/debug/strace/7.1/tests/fchownat.c /usr/src/debug/strace/7.1/src/xlat/v4l2_framesize_types.h /usr/src/debug/strace/7.1/tests/readv.c /usr/src/debug/strace/7.1/tests/qual_inject-error-signal.c /usr/src/debug/strace/7.1/src/xlat/term_oflags_bsdly.h /usr/src/debug/strace/7.1/src/utimes.c /usr/src/debug/strace/7.1/src/xlat/perf_event_read_format.h /usr/src/debug/strace/7.1/src/xlat/bpf_task_fd_type.h /usr/src/debug/strace/7.1/src/xlat/open_tree_flags.h
  /usr/src/debug/strace/7.1/src/xlat/perf_branch_sample_type.h /usr/src/debug/strace/7.1/src/xlat/smc_link_group_roles.h /usr/src/debug/strace/7.1/tests/xutimes.c /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_af_spec_inet6_attrs.h /usr/src/debug/strace/7.1/src/seccomp.c /usr/src/debug/strace/7.1/tests/alarm.c /usr/src/debug/strace/7.1/src/xlat/rwh_write_life_hints.h /usr/src/debug/strace/7.1/src/xlat/landlock_ruleset_access_net.h /usr/src/debug/strace/7.1/tests/setgroups.c /usr/src/debug/strace/7.1/tests/nanosleep.c /usr/src/debug/strace/7.1/tests/ioctl_counter.c /usr/src/debug/strace/7.1/src/xlat/kvm_exit_io.h /usr/src/debug/strace/7.1/src/xlat/uring_files_update_fds.h /usr/src/debug/strace/7.1/src/xlat/tcxonc_options.h /usr/src/debug/strace/7.1/tests/mmsg-silent.c /usr/src/debug/strace/7.1/src/xlat/genl_ctrl_attr_op_flags.h /usr/src/debug/strace/7.1/src/pidns.c /usr/src/debug/strace/7.1/src/xlat/seccomp_ioctl_notif_flags.h /usr/src/debug/strace/7.1/src/xlat/btrfs_features_compat.h /
 usr/src/debug/strace/7.1/src/xlat/inet6_if_flags.h /usr/src/debug/strace/7.1/tests/scm_pidfd.c /usr/src/debug/strace/7.1/src/xlat/sync_file_range_flags.h /usr/src/debug/strace/7.1/src/netlink_nlctrl.c /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_info_attrs.h /usr/src/debug/strace/7.1/tests/unlinkat.c /usr/src/debug/strace/7.1/src/set_tid_address.c /usr/src/debug/strace/7.1/src/xlat/sock_xdp_options.h /usr/src/debug/strace/7.1/tests/status-none-f.c /usr/src/debug/strace/7.1/src/ustat.c /usr/src/debug/strace/7.1/src/xlat/nl_sock_diag_types.h /usr/src/debug/strace/7.1/src/personality.c /usr/src/debug/strace/7.1/tests/futex2_flags.h /usr/src/debug/strace/7.1/src/evdev_mpers.c /usr/src/debug/strace/7.1/src/xlat/genl_ctrl_attr_op.h /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_vf_vlan_list_attrs.h /usr/src/debug/strace/7.1/tests/execveat--secontext.c /usr/src/debug/strace/7.1/src/xlat/sock_ip_options.h /usr/src/debug/strace/7.1/src/xlat/sock_tls_options.h /usr/src/debug/strace/7.1/src/xlat
 /getsock_ip_options.h /usr/src/debug/strace/7.1/src/xlat/setsock_ip_options.h /usr/src/debug/strace/7.1/tests/filter_seccomp-perf.c /usr/src/debug/strace/7.1/tests/tracer_ppid_pgid_sid.c /usr/src/debug/strace/7.1/tests/pipe_maxfd.c /usr/src/debug/strace/7.1/tests/xattr.c /usr/src/debug/strace/7.1/src/xlat/bpf_link_create_netfilter_flags.h /usr/src/debug/strace/7.1/src/xlat/listmount_flags.h /usr/src/debug/strace/7.1/src/xlat/sock_iucv_options.h /usr/src/debug/strace/7.1/src/xlat/statmount_flags.h /usr/src/debug/strace/7.1/src/xlat/sock_can_raw_options.h /usr/src/debug/strace/7.1/tests/caps.c /usr/src/debug/strace/7.1/src/xlat/tcp_state_flags.h /usr/src/debug/strace/7.1/src/file_handle.c /usr/src/debug/strace/7.1/src/xlat/v4l2_buf_flags_ts_type.h /usr/src/debug/strace/7.1/src/xlat/cap_mask0.h /usr/src/debug/strace/7.1/tests/lchown32.c /usr/src/debug/strace/7.1/src/xlat/uffd_copy_flags.h /usr/src/debug/strace/7.1/tests/clone3.c /usr/src/debug/strace/7.1/src/xlat/ubi_volume_props.h /us
 r/src/debug/strace/7.1/tests/scm_credentials.c /usr/src/debug/strace/7.1/tests/sock_filter-v.c /usr/src/debug/strace/7.1/src/xlat/netlink_delete_flags.h /usr/src/debug/strace/7.1/src/xlat/uring_napi_tracking_strategies.h /usr/src/debug/strace/7.1/src/xlat/resource_flags.h /usr/src/debug/strace/7.1/src/xlat/ptp_extts_flags.h /usr/src/debug/strace/7.1/tests/restart_syscall.c /usr/src/debug/strace/7.1/tests/status-none-threads.c /usr/src/debug/strace/7.1/src/xlat/ieee802154_pan_ids.h /usr/src/debug/strace/7.1/src/xlat/landlock_create_ruleset_flags.h /usr/src/debug/strace/7.1/src/xlat/mctp_nets.h /usr/src/debug/strace/7.1/src/shutdown.c /usr/src/debug/strace/7.1/src/stat64.c /usr/src/debug/strace/7.1/tests/mmsg.c /usr/src/debug/strace/7.1/src/btrfs.c /usr/src/debug/strace/7.1/src/quota.c /usr/src/debug/strace/7.1/src/xlat/audit_arch.h /usr/src/debug/strace/7.1/tests/file_handle--secontext.c /usr/src/debug/strace/7.1/src/xlat/phonet_protocols.h /usr/src/debug/strace/7.1/src/xlat/lirc_mod
 es.h /usr/src/debug/strace/7.1/src/xlat/mpol_modes.h /usr/src/debug/strace/7.1/src/xlat/pr_tagged_addr_mte_tcf.h /usr/src/debug/strace/7.1/src/xlat/v4l2_buf_flags_ts_src.h /usr/src/debug/strace/7.1/tests/nfnetlink_nftables.c /usr/src/debug/strace/7.1/src/xlat/kd_keymap_flags.h /usr/src/debug/strace/7.1/src/xlat/ifstats_xstats_bond_attrs.h /usr/src/debug/strace/7.1/src/xlat/ifstats_xstats_type_attrs.h /usr/src/debug/strace/7.1/tests/setfsgid32.c /usr/src/debug/strace/7.1/src/xlat/smc_diag_mode.h /usr/src/debug/strace/7.1/tests/setfsuid32.c /usr/src/debug/strace/7.1/tests/setregid32.c /usr/src/debug/strace/7.1/tests/setreuid32.c /usr/src/debug/strace/7.1/src/fsopen.c /usr/src/debug/strace/7.1/src/xlat/sigtrap_codes.h /usr/src/debug/strace/7.1/src/xlat/bpf_map_flags.h /usr/src/debug/strace/7.1/src/xlat/bpf_map_types.h /usr/src/debug/strace/7.1/src/counter_ioctl.c /usr/src/debug/strace/7.1/src/xlat/sg_scsi_reset.h /usr/src/debug/strace/7.1/tests/nlattr_ifstats.c /usr/src/debug/strace/7.
 1/tests/open.c /usr/src/debug/strace/7.1/tests/sleep.c /usr/src/debug/strace/7.1/src/xlat/lsm_ids.h /usr/src/debug/strace/7.1/src/xlat/sock_sctp_options.h /usr/src/debug/strace/7.1/tests/xstatx.c /usr/src/debug/strace/7.1/src/xlat/kexec_load_flags.h /usr/src/debug/strace/7.1/src/macros.h /usr/src/debug/strace/7.1/src/xlat/packet_mreq_type.h /usr/src/debug/strace/7.1/tests/netlink_xfrm.c /usr/src/debug/strace/7.1/src/utime.c /usr/src/debug/strace/7.1/tests/ioctl_tiocm.c /usr/src/debug/strace/7.1/tests/libsocketcall.c /usr/src/debug/strace/7.1/tests/aio.c /usr/src/debug/strace/7.1/src/xlat/sockopt_txrehash_vals.h /usr/src/debug/strace/7.1/src/xlat/netlink_flags.h /usr/src/debug/strace/7.1/src/xlat/netlink_types.h /usr/src/debug/strace/7.1/src/xlat/numa_node.h /usr/src/debug/strace/7.1/src/fetch_struct_statfs.c /usr/src/debug/strace/7.1/src/xlat/btrfs_csum_types.h /usr/src/debug/strace/7.1/src/fs_x_ioctl.c /usr/src/debug/strace/7.1/tests/sigsuspend.c /usr/src/debug/strace/7.1/tests/ioc
 tl_v4l2.c /usr/src/debug/strace/7.1/tests/ioctl_pidfd_namespace.c /usr/src/debug/strace/7.1/tests/vmsplice.c /usr/src/debug/strace/7.1/src/xlat/ebpf_size.h /usr/src/debug/strace/7.1/tests/prctl-securebits.c /usr/src/debug/strace/7.1/tests/unshare.c /usr/src/debug/strace/7.1/src/xlat/term_iflags.h /usr/src/debug/strace/7.1/src/xlat/pr_cap_ambient.h /usr/src/debug/strace/7.1/tests/access--secontext.c /usr/src/debug/strace/7.1/src/xlat/sigchld_codes.h /usr/src/debug/strace/7.1/src/xlat/tee_ioctl_login_types.h /usr/src/debug/strace/7.1/tests/printpath-umovestr-peekdata.c /usr/src/debug/strace/7.1/src/xlat/fiemap_extent_flags.h /usr/src/debug/strace/7.1/src/xlat/rtnl_ip6mra_creport_attr.h /usr/src/debug/strace/7.1/src/xlat/kd_key_tables.h /usr/src/debug/strace/7.1/src/mmap_cache.h /usr/src/debug/strace/7.1/src/xlat/rename_flags.h /usr/src/debug/strace/7.1/src/xlat/sigfpe_codes.h /usr/src/debug/strace/7.1/src/xlat/splice_flags.h /usr/src/debug/strace/7.1/src/xlat/whence_codes.h /usr/src/d
 ebug/strace/7.1/tests/net-tpacket_req.c /usr/src/debug/strace/7.1/src/mmap_cache.c /usr/src/debug/strace/7.1/tests/execveat.c /usr/src/debug/strace/7.1/src/xlat/ebpf_regs.h /usr/src/debug/strace/7.1/src/readahead.c /usr/src/debug/strace/7.1/tests/add_key.c /usr/src/debug/strace/7.1/src/xlat/uring_sqe_flags.h /usr/src/debug/strace/7.1/tests/read-write.c /usr/src/debug/strace/7.1/tests/madvise.c /usr/src/debug/strace/7.1/tests/time_enjoyment.h /usr/src/debug/strace/7.1/src/xlat/xfs_dqblk_flags.h /usr/src/debug/strace/7.1/tests/prctl-dumpable.c /usr/src/debug/strace/7.1/src/print_mac.c /usr/src/debug/strace/7.1/src/printmode.c /usr/src/debug/strace/7.1/src/printrusage.c /usr/src/debug/strace/7.1/tests/inotify.c /usr/src/debug/strace/7.1/src/xlat/kd_key_types.h /usr/src/debug/strace/7.1/src/netlink_netfilter.c /usr/src/debug/strace/7.1/tests/poll.c /usr/src/debug/strace/7.1/src/xlat/btrfs_qgroup_limit_flags.h /usr/src/debug/strace/7.1/src/netlink_kobject_uevent.c /usr/src/debug/strace/7
 .1/src/netlink_kobject_uevent.h /usr/src/debug/strace/7.1/src/xlat/socketlayers.h /usr/src/debug/strace/7.1/tests/xet_thread_area_x86.c /usr/src/debug/strace/7.1/src/sigevent.h /usr/src/debug/strace/7.1/src/xlat/sigev_value.h /usr/src/debug/strace/7.1/src/rtnl_cachereport.c /usr/src/debug/strace/7.1/src/xlat/evdev_autorepeat.h /usr/src/debug/strace/7.1/src/xlat/hci_channels.h /usr/src/debug/strace/7.1/tests/timer_create.c /usr/src/debug/strace/7.1/tests/iopl.c /usr/src/debug/strace/7.1/tests/block_reset_run.c /usr/src/debug/strace/7.1/src/affinity.c /usr/src/debug/strace/7.1/tests/prctl-spec-inject.c /usr/src/debug/strace/7.1/src/xlat/bpf_op_jmp.h /usr/src/debug/strace/7.1/src/xlat/sock_tipc_options.h /usr/src/debug/strace/7.1/tests/sxetmask.c /usr/src/debug/strace/7.1/src/execve.c /usr/src/debug/strace/7.1/tests/prctl-set-ptracer-success.c /usr/src/debug/strace/7.1/tests/ioctl.c /usr/src/debug/strace/7.1/src/xlat/routing_table_ids.h /usr/src/debug/strace/7.1/src/xlat/uring_setup_fe
 atures.h /usr/src/debug/strace/7.1/src/xlat/if_dqinfo_valid.h /usr/src/debug/strace/7.1/tests/chmod--secontext.c /usr/src/debug/strace/7.1/src/xlat/packet_diag_info_flags.h /usr/src/debug/strace/7.1/tests/status-unfinished.c /usr/src/debug/strace/7.1/tests/set_mempolicy_home_node.c /usr/src/debug/strace/7.1/tests/xettimeofday.c /usr/src/debug/strace/7.1/tests/fstatat64.c /usr/src/debug/strace/7.1/tests/fstatfs64.c /usr/src/debug/strace/7.1/src/xlat/bsg_subprotocol.h /usr/src/debug/strace/7.1/src/xlat/nf_tables_msg_types.h /usr/src/debug/strace/7.1/src/native_printer_decls.h /usr/src/debug/strace/7.1/tests/bpf.c /usr/src/debug/strace/7.1/tests/error_msg.c /usr/src/debug/strace/7.1/tests/btrfs.c /usr/src/debug/strace/7.1/src/xlat/evdev_misc.h /usr/src/debug/strace/7.1/tests/printpath-umovestr-undumpable.c /usr/src/debug/strace/7.1/src/xlat/pr_pac_enabled_keys.h /usr/src/debug/strace/7.1/src/xlat/hdio_drive_cmds.h /usr/src/debug/strace/7.1/src/access.c /usr/src/debug/strace/7.1/src/xla
 t/rtc_params.h /usr/src/debug/strace/7.1/src/lookup_dcookie.c /usr/src/debug/strace/7.1/src/desc.c /usr/src/debug/strace/7.1/src/xlat/sigprof_codes.h /usr/src/debug/strace/7.1/src/xlat/pr_fp_mode.h /usr/src/debug/strace/7.1/src/xlat/lsm_flags.h /usr/src/debug/strace/7.1/src/xlat/mdb_flags.h /usr/src/debug/strace/7.1/src/xlat/msg_flags.h /usr/src/debug/strace/7.1/tests/pipe.c /usr/src/debug/strace/7.1/src/xlat/perf_type_id.h /usr/src/debug/strace/7.1/src/xlat/af_tipc_flags.h /usr/src/debug/strace/7.1/src/xlat/af_tipc_scope.h /usr/src/debug/strace/7.1/src/xlat/af_tipc_types.h /usr/src/debug/strace/7.1/src/xlat/bpf_size.h /usr/src/debug/strace/7.1/src/xlat/at_flags.h /usr/src/debug/strace/7.1/src/xlat/dm_flags.h /usr/src/debug/strace/7.1/src/rtnl_tc_action.c /usr/src/debug/strace/7.1/src/xlat/iffflags.h /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_af_spec_mctp_attrs.h /usr/src/debug/strace/7.1/tests/umovestr3.c /usr/src/debug/strace/7.1/src/filter.h /usr/src/debug/strace/7.1/src/statx.
 h /usr/src/debug/strace/7.1/tests/fsopen.c /usr/src/debug/strace/7.1/src/statx.c /usr/src/debug/strace/7.1/src/xlat/futexbitset.h /usr/src/debug/strace/7.1/tests/lseek.c /usr/src/debug/strace/7.1/src/syscall.c /usr/src/debug/strace/7.1/src/syscall.h /usr/src/debug/strace/7.1/src/xlat/futexwakeops.h /usr/src/debug/strace/7.1/src/xlat/notifyflags.h /usr/src/debug/strace/7.1/tests/detach-vfork.c /usr/src/debug/strace/7.1/src/nice.c /usr/src/debug/strace/7.1/src/xlat/inet_devconf_indices.h /usr/src/debug/strace/7.1/src/xlat/mtd_otp_options.h /usr/src/debug/strace/7.1/tests/test_nlattr.h /usr/src/debug/strace/7.1/tests/nlattr_tcamsg.c /usr/src/debug/strace/7.1/src/xlat/sock_irda_options.h /usr/src/debug/strace/7.1/tests/attach-p-cmd-p.c /usr/src/debug/strace/7.1/tests/epoll_pwait.c /usr/src/debug/strace/7.1/tests/print_maxfd.c /usr/src/debug/strace/7.1/src/delay.c /usr/src/debug/strace/7.1/src/delay.h /usr/src/debug/strace/7.1/src/xlat/pr_set_mm.h /usr/src/debug/strace/7.1/tests/get_memp
 olicy.c /usr/src/debug/strace/7.1/src/exit.c /usr/src/debug/strace/7.1/src/wait.c /usr/src/debug/strace/7.1/src/xlat/nfc_saps.h /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_events.h /usr/src/debug/strace/7.1/src/netlink_sock_diag.h /usr/src/debug/strace/7.1/src/xlat/nl_route_types.h /usr/src/debug/strace/7.1/src/netlink_sock_diag.c /usr/src/debug/strace/7.1/src/xlat/nf_ctnetlink_msg_types.h /usr/src/debug/strace/7.1/tests/ip_local_port_range.c /usr/src/debug/strace/7.1/tests/overflowuid.c /usr/src/debug/strace/7.1/src/xlat/kd_key_ascii_keys.h /usr/src/debug/strace/7.1/src/xlat/kd_key_shift_keys.h /usr/src/debug/strace/7.1/src/xlat/kd_key_slock_keys.h /usr/src/debug/strace/7.1/tests/ptrace.c /usr/src/debug/strace/7.1/src/xlat/mq_attr_flags.h /usr/src/debug/strace/7.1/src/xlat/qipcrtr_nodes.h /usr/src/debug/strace/7.1/src/xlat/qipcrtr_ports.h /usr/src/debug/strace/7.1/tests/ipc.c /usr/src/debug/strace/7.1/src/xlat/rtc_features.h /usr/src/debug/strace/7.1/src/xlat/membarrier_cmds.h /us
 r/src/debug/strace/7.1/src/xlat/modetypes.h /usr/src/debug/strace/7.1/src/xlat/socktypes.h /usr/src/debug/strace/7.1/src/xlat/key_spec.h /usr/src/debug/strace/7.1/src/chmod.c /usr/src/debug/strace/7.1/tests/ioctl_fs_x.c /usr/src/debug/strace/7.1/tests/xetitimer.c /usr/src/debug/strace/7.1/tests/clone_ptrace.c /usr/src/debug/strace/7.1/src/xlat/bpf_rval.h /usr/src/debug/strace/7.1/src/xlat/nf_ipset_msg_types.h /usr/src/debug/strace/7.1/src/xlat/pr_ppc_dexcr_aspects.h /usr/src/debug/strace/7.1/src/xlat/btrfs_compress_types.h /usr/src/debug/strace/7.1/src/xlat/close_range_flags.h /usr/src/debug/strace/7.1/src/xlat/rtnl_tc_action_attrs.h /usr/src/debug/strace/7.1/src/block.c /usr/src/debug/strace/7.1/src/flock.c /usr/src/debug/strace/7.1/src/xlat/ioctl_dirs.h /usr/src/debug/strace/7.1/tests/clone3-report-ns-id.c /usr/src/debug/strace/7.1/src/mmsghdr.c /usr/src/debug/strace/7.1/tests/prctl-pac-reset-keys.c /usr/src/debug/strace/7.1/src/rtnl_netconf.c /usr/src/debug/strace/7.1/src/xlat/ic
 mp_filter_flags.h /usr/src/debug/strace/7.1/src/xlat/smc_diag_attrs.h /usr/src/debug/strace/7.1/src/xlat/v4l2_control_flags.h /usr/src/debug/strace/7.1/tests/nfnetlink_acct.c /usr/src/debug/strace/7.1/tests/splice.c /usr/src/debug/strace/7.1/tests/umovestr-illptr.c /usr/src/debug/strace/7.1/src/xlat/btrfs_send_flags.h /usr/src/debug/strace/7.1/src/xlat/udmabuf_flags.h /usr/src/debug/strace/7.1/tests/nlattr_mdba_mdb_entry.c /usr/src/debug/strace/7.1/tests/time.c /usr/src/debug/strace/7.1/src/xlat/bootflags1.h /usr/src/debug/strace/7.1/src/kernel_dirent.h /usr/src/debug/strace/7.1/src/mtd.c /usr/src/debug/strace/7.1/src/uid.c /usr/src/debug/strace/7.1/src/xlat/rtnl_ifla_vf_info_attrs.h /usr/src/debug/strace/7.1/src/xlat/bootflags3.h /usr/src/debug/strace/7.1/tests/setxattrat.c /usr/src/debug/strace/7.1/src/bpf.c /usr/src/debug/strace/7.1/tests/mbind.c /usr/src/debug/strace/7.1/tests/ioctl_fiemap.c /usr/src/debug/strace/7.1/tests/attach-p-cmd.h /usr/src/debug/strace/7.1/src/xlat/uffd_a
 pi_flags.h /usr/src/debug/strace/7.1/src/sock.c /usr/src/debug/strace/7.1/src/clone.c /usr/src/debug/strace/7.1/src/oldstat.c /usr/src/debug/strace/7.1/tests/nlattr_ifla_vfinfo.c /usr/src/debug/strace/7.1/src/xlat/btrfs_cont_reading_from_srcdev_mode.h /usr/src/debug/strace/7.1/src/xlat/uring_accept_flags.h /usr/src/debug/strace/7.1/src/lseek.c /usr/src/debug/strace/7.1/src/xlat/tun_device_types.h /usr/src/debug/strace/7.1/tests/ioctl_nsfs.c /usr/src/debug/strace/7.1/tests/unix-pair-send-recv.c /usr/src/debug/strace/7.1/tests/chdir.c /usr/src/debug/strace/7.1/src/xlat/aio_cmds.h /usr/src/debug/strace/7.1/tests/sigpending.c /usr/src/debug/strace/7.1/src/mmap_notify.h /usr/src/debug/strace/7.1/src/xlat/btrfs_balance_args.h /usr/src/debug/strace/7.1/tests/fcntl.c /usr/src/debug/strace/7.1/tests/ioctl_inotify.c /usr/src/debug/strace/7.1/src/dup.c /usr/src/debug/strace/7.1/src/mmap_notify.c /usr/src/debug/strace/7.1/src/ptp.c /usr/src/debug/strace/7.1/src/xlat/ifstats_attr_flags.h /usr/sr
 c/debug/strace/7.1/tests/fdatasync.c /usr/src/debug/strace/7.1/src/udmabuf.c /usr/src/debug/strace/7.1/src/xlat/perf_sw_ids.h /usr/src/debug/strace/7.1/src/xlat/rtnl_br_stp_mode.h /usr/src/debug/strace/7.1/tests/ioctl-v.c /usr/src/debug/strace/7.1/tests/llseek.c /usr/src/debug/strace/7.1/tests/netlink_netfilter.c /usr/src/debug/strace/7.1/tests/keyctl.c /usr/src/debug/strace/7.1/src/ipc_sem.c /usr/src/debug/strace/7.1/src/xlat/waitid_types.h /usr/src/debug/strace/7.1/src/dirent64.c /usr/src/debug/strace/7.1/src/xlat/kd_kbd_modes.h /usr/src/debug/strace/7.1/src/xlat/kd_kbd_types.h /usr/src/debug/strace/7.1/src/xlat/kd_led_flags.h /usr/src/debug/strace/7.1/src/xlat/xattrat_flags.h /usr/src/debug/strace/7.1/src/mknod.c /usr/src/debug/strace/7.1/src/xlat/ethernet_protocols.h /usr/src/debug/strace/7.1/src/xlat/rtnl_link_attrs.h /usr/src/debug/strace/7.1/src/xlat/kd_key_fn_key_vals.h /usr/src/debug/strace/7.1/src/xlat/v4l2_memories.h /usr/src/debug/strace/7.1/src/xlat/baud_options.h /usr/
 src/debug/strace/7.1/src/xlat/sock_options.h /usr/src/debug/strace/7.1/src/xlat/xattrflags.h /usr/src/debug/strace/7.1/src/xlat/clockflags.h /usr/src/debug/strace/7.1/src/xlat/epollflags.h /usr/src/debug/strace/7.1/src/xlat/mmap_flags.h /usr/src/debug/strace/7.1/src/xlat/rseq_flags.h /usr/src/debug/strace/7.1/src/xlat/swap_flags.h /usr/src/debug/strace/7.1/src/xlat/uffd_flags.h /usr/src/debug/strace/7.1/src/futex2.c /usr/src/debug/strace/7.1/tests/subdir.c /usr/src/debug/strace/7.1/tests/prctl-sched-core.c /usr/src/debug/strace/7.1/tests/faccessat2.c /usr/src/debug/strace/7.1/src/xlat/cap.h /usr/src/debug/strace/7.1/tests/skip_unavailable.c /usr/src/debug/strace/7.1/tests/osf_utimes.c /usr/src/debug/strace/7.1/src/xlat/rtnl_tca_stats_attrs.h /usr/src/debug/strace/7.1/src/xlat/kvm_cpuid_flags.h /usr/src/debug/strace/7.1/src/xlat/rtnl_route_attrs.h /usr/src/debug/strace/7.1/src/xattr.c /usr/src/debug/strace/7.1/src/xlat/seccomp_ops.h /usr/src/debug/strace/7.1/tests/eventfd-yy.c /usr/s
 rc/debug/strace/7.1/src/xlat/ifstats_offload_attrs.h /usr/src/debug/strace/7.1/tests/filter-unavailable.c /usr/src/debug/strace/7.1/tests/prctl-seccomp-filter-v.c /usr/src/debug/strace/7.1/src/xlat/fan_init_flags.h /usr/src/debug/strace/7.1/tests/seccomp_get_notif_sizes.c /usr/src/debug/strace/7.1/tests/prctl-tagged-addr.c /usr/src/debug/strace/7.1/src/xlat/sock_pnp_options.h /usr/src/debug/strace/7.1/src/socketutils.c /usr/src/debug/strace/7.1/tests/setresgid32.c /usr/src/debug/strace/7.1/tests/setresuid32.c /usr/src/debug/strace/7.1/src/xlat/schedulers.h /usr/src/debug/strace/7.1/tests/fchmod-y--secontext.c /usr/src/debug/strace/7.1/tests/fchmodat--secontext.c /usr/src/debug/strace/7.1/tests/fchownat--secontext.c /usr/src/debug/strace/7.1/tests/move_pages.c /usr/src/debug/strace/7.1/tests/kernel_old_timex.h /usr/src/debug/strace/7.1/src/fs_0x15_ioctl.c /usr/src/debug/strace/7.1/src/fs_0x94_ioctl.c /usr/src/debug/strace/7.1/tests/landlock_create_ruleset.c /usr/src/debug/strace/7.1/
 src/socketcall.c /usr/src/debug/strace/7.1/src/xlat/bpf_query_flags.h /usr/src/debug/strace/7.1/tests/nlattr_ifla_brport.c /usr/src/debug/strace/7.1/src/xlat/genl_netdev_cmd.h /usr/src/debug/strace/7.1/tests/epoll_wait.c /usr/src/debug/strace/7.1/src/basic_filters.c /usr/src/debug/strace/7.1/src/xlat/rtnl_mdba_router_attrs.h /usr/src/debug/strace/7.1/src/xlat/genl_ctrl_attr_mcast_grp.h /usr/src/debug/strace/7.1/src/xlat/uring_register_opcodes.h /usr/src/debug/strace/7.1/tests/linkat.c /usr/src/debug/strace/7.1/tests/io_uring_setup.c /usr/src/debug/strace/7.1/src/xlat/neighbor_cache_entry_states.h /usr/src/debug/strace/7.1/tests/msg_name.c /usr/src/debug/strace/7.1/src/xlat/sg_io_flags.h /usr/src/debug/strace/7.1/src/xlat/vsock_flags.h /usr/src/debug/strace/7.1/src/xlat/pr_mce_kill_policy.h /usr/src/debug/strace/7.1/src/xlat/nf_queue_msg_types.h /usr/src/debug/strace/7.1/src/xlat/lbmd_pi_cap_flags.h /usr/src/debug/strace/7.1/tests/ioctl_sock_gifconf.c /usr/src/debug/strace/7.1/src/xl
 at/bpf_commands.h /usr/src/debug/strace/7.1/src/xlat/dcb_commands.h /usr/src/debug/strace/7.1/tests/qual_fault.c /usr/src/debug/strace/7.1/src/xlat/rtnl_ip6mra_msg_types.h /usr/src/debug/strace/7.1/src/xlat/nl_crypto_types.h /usr/src/debug/strace/7.1/tests/syslog.c /usr/src/debug/strace/7.1/src/xlat/fchmodat_flags.h /usr/src/debug/strace/7.1/src/xlat/evdev_keycode.h", added "/usr/src/debug/strace/7.2/tests/geteuid32.c /usr/src/debug/strace/7.2/tests/getegid32.c /usr/src/debug/strace/7.2/src/xlat/in6_addr_gen_mode.h /usr/src/debug/strace/7.2/src/getrandom.c /usr/src/debug/strace/7.2/src/umount.c /usr/src/debug/strace/7.2/tests/umovestr_cached.c /usr/src/debug/strace/7.2/tests/btrfs.c /usr/src/debug/strace/7.2/src/xlat/rtnl_netconf_attrs.h /usr/src/debug/strace/7.2/src/xlat/rtnl_nexthop_attrs.h /usr/src/debug/strace/7.2/tests/pwritev.c /usr/src/debug/strace/7.2/src/xlat/bsg_flags.h /usr/src/debug/strace/7.2/src/xlat/efd_flags.h /usr/src/debug/strace/7.2/src/xlat/fs_xflags.h /usr/src/d
 ebug/strace/7.2/src/xlat/lsm_flags.h /usr/src/debug/strace/7.2/src/xlat/mdb_flags.h /usr/src/debug/strace/7.2/src/xlat/msg_flags.h /usr/src/debug/strace/7.2/src/xlat/pollflags.h /usr/src/debug/strace/7.2/src/xlat/sfd_flags.h /usr/src/debug/strace/7.2/src/xlat/shm_flags.h /usr/src/debug/strace/7.2/src/xlat/rwf_flags.h /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_af_spec_bridge_attrs.h /usr/src/debug/strace/7.2/src/list.h /usr/src/debug/strace/7.2/tests/dup3.c /usr/src/debug/strace/7.2/src/xlat/pr_unalign_flags.h /usr/src/debug/strace/7.2/src/syslog.c /usr/src/debug/strace/7.2/tests/ioctl_sock_gifconf.c /usr/src/debug/strace/7.2/src/xlat/kvm_mem_flags.h /usr/src/debug/strace/7.2/tests/status-detached-threads.c /usr/src/debug/strace/7.2/src/xlat/mtd_mode_options.h /usr/src/debug/strace/7.2/src/xlat/btrfs_fs_info_flags.h /usr/src/debug/strace/7.2/src/get_robust_list.c /usr/src/debug/strace/7.2/src/xlat/rtnl_dcb_attrs.h /usr/src/debug/strace/7.2/tests/tee.c /usr/src/debug/strace/7.2/src/
 xlat/sock_ipv6_options.h /usr/src/debug/strace/7.2/src/xlat/adjtimex_modes.h /usr/src/debug/strace/7.2/src/xlat/v4l2_meta_fmts.h /usr/src/debug/strace/7.2/tests/create_nl_socket.c /usr/src/debug/strace/7.2/tests/sched_rr_get_interval.c /usr/src/debug/strace/7.2/src/xlat/ifstats_xstats_bridge_mcast_indices.h /usr/src/debug/strace/7.2/src/xlat/v4l2_control_flags.h /usr/src/debug/strace/7.2/tests/vfork-f.c /usr/src/debug/strace/7.2/tests/ioctl_tee.c /usr/src/debug/strace/7.2/tests/setdomainname.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_events.h /usr/src/debug/strace/7.2/src/kill_save_errno.h /usr/src/debug/strace/7.2/src/rtnl_nsid.c /usr/src/debug/strace/7.2/src/rtnl_rule.c /usr/src/debug/strace/7.2/src/xlat/nf_osf_msg_types.h /usr/src/debug/strace/7.2/src/rtnl_addr.c /usr/src/debug/strace/7.2/src/rtnl_link.c /usr/src/debug/strace/7.2/src/xlat/genl_devlink_cmd.h /usr/src/debug/strace/7.2/src/xlat/pr_sud_cmds.h /usr/src/debug/strace/7.2/src/xlat/ptp_extts_flags.h /usr/src/debug/str
 ace/7.2/src/hdio.c /usr/src/debug/strace/7.2/src/xlat/btrfs_snap_flags_v2.h /usr/src/debug/strace/7.2/src/xlat/perf_event_sample_format.h /usr/src/debug/strace/7.2/src/print_fields.c /usr/src/debug/strace/7.2/src/xlat/netlink_states.h /usr/src/debug/strace/7.2/src/print_fields.h /usr/src/debug/strace/7.2/tests/rt_sigprocmask.c /usr/src/debug/strace/7.2/src/inotify.c /usr/src/debug/strace/7.2/src/xlat/epollctls.h /usr/src/debug/strace/7.2/tests/prctl-seccomp-filter-v.c /usr/src/debug/strace/7.2/src/xlat/btrfs_defrag_flags.h /usr/src/debug/strace/7.2/src/poll.c /usr/src/debug/strace/7.2/tests/strace--decode-pids-comm.c /usr/src/debug/strace/7.2/tests/printpath-umovestr-undumpable.c /usr/src/debug/strace/7.2/src/sock.c /usr/src/debug/strace/7.2/src/affinity.c /usr/src/debug/strace/7.2/src/xlat/btrfs_cont_reading_from_srcdev_mode.h /usr/src/debug/strace/7.2/src/xlat/evdev_ff_types.h /usr/src/debug/strace/7.2/src/xlat/snmp_icmp6_stats.h /usr/src/debug/strace/7.2/src/xlat/rtnl_tc_attrs.h 
 /usr/src/debug/strace/7.2/tests/clock_adjtime64.c /usr/src/debug/strace/7.2/tests/so_linger.c /usr/src/debug/strace/7.2/tests/check_sigign.c /usr/src/debug/strace/7.2/src/sigevent.h /usr/src/debug/strace/7.2/src/statfs.c /usr/src/debug/strace/7.2/src/xlat/futexwakeops.h /usr/src/debug/strace/7.2/tests/libsocketcall.c /usr/src/debug/strace/7.2/src/xlat/v4l2_control_types.h /usr/src/debug/strace/7.2/src/statfs.h /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_xdp_attached_mode.h /usr/src/debug/strace/7.2/tests/nlattr_tc_stats.c /usr/src/debug/strace/7.2/tests/clone_parent.c /usr/src/debug/strace/7.2/tests/nlattr_ifla_xdp.c /usr/src/debug/strace/7.2/src/xlat/landlock_scope_flags.h /usr/src/debug/strace/7.2/src/xlat/sock_can_raw_options.h /usr/src/debug/strace/7.2/src/nice.c /usr/src/debug/strace/7.2/src/xlat/hdio_ide_nice.h /usr/src/debug/strace/7.2/tests/mmsg-silent.c /usr/src/debug/strace/7.2/tests/printstr.c /usr/src/debug/strace/7.2/tests/membarrier.c /usr/src/debug/strace/7.2/src/xla
 t/kvm_cpuid_flags.h /usr/src/debug/strace/7.2/tests/acct.c /usr/src/debug/strace/7.2/src/xlat/sock_type_flags.h /usr/src/debug/strace/7.2/src/xlat/adjtimex_state.h /usr/src/debug/strace/7.2/tests/truncate.c /usr/src/debug/strace/7.2/src/xlat/mctp_nets.h /usr/src/debug/strace/7.2/tests/ioctl_ubi.c /usr/src/debug/strace/7.2/src/print_mq_attr.c /usr/src/debug/strace/7.2/src/xlat/kd_kbd_modes.h /usr/src/debug/strace/7.2/src/xlat/kd_kbd_types.h /usr/src/debug/strace/7.2/src/xlat/kd_led_flags.h /usr/src/debug/strace/7.2/src/xlat/waitid_types.h /usr/src/debug/strace/7.2/src/xlat/uffd_api_flags.h /usr/src/debug/strace/7.2/src/xlat/rtnl_tca_act_flags.h /usr/src/debug/strace/7.2/tests/copy_file_range.c /usr/src/debug/strace/7.2/tests/strace-p1-Y-p.c /usr/src/debug/strace/7.2/tests/rmdir.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_ext_filter_flags.h /usr/src/debug/strace/7.2/tests/landlock_restrict_self.c /usr/src/debug/strace/7.2/tests/ioctl_v4l2.c /usr/src/debug/strace/7.2/src/xlat/pr_sch
 ed_core_cmds.h /usr/src/debug/strace/7.2/src/xlat/bootflags2.h /usr/src/debug/strace/7.2/src/xlat/v4l2_memories.h /usr/src/debug/strace/7.2/tests/delay.c /usr/src/debug/strace/7.2/src/macros.h /usr/src/debug/strace/7.2/tests/fchdir.c /usr/src/debug/strace/7.2/tests/sync_file_range2.c /usr/src/debug/strace/7.2/src/xlat/btrfs_qgroup_limit_flags.h /usr/src/debug/strace/7.2/src/xlat/uring_accept_flags.h /usr/src/debug/strace/7.2/tests/move_mount.c /usr/src/debug/strace/7.2/tests/reboot.c /usr/src/debug/strace/7.2/src/netlink.c /usr/src/debug/strace/7.2/src/netlink.h /usr/src/debug/strace/7.2/tests/prctl-set_vma.c /usr/src/debug/strace/7.2/src/xlat/rtc_features.h /usr/src/debug/strace/7.2/tests/finit_module.c /usr/src/debug/strace/7.2/tests/move_pages.c /usr/src/debug/strace/7.2/src/xlat/secbits.h /usr/src/debug/strace/7.2/tests/init_delete_module.h /usr/src/debug/strace/7.2/src/xlat/term_oflags_bsdly.h /usr/src/debug/strace/7.2/src/landlock.c /usr/src/debug/strace/7.2/src/xlat/rxrpc_ser
 vices.h /usr/src/debug/strace/7.2/src/sigaltstack.c /usr/src/debug/strace/7.2/src/xlat/numa_node.h /usr/src/debug/strace/7.2/src/xlat/archvals.h /usr/src/debug/strace/7.2/tests/orphaned_process_group.c /usr/src/debug/strace/7.2/tests/userfaultfd.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_vf_info_attrs.h /usr/src/debug/strace/7.2/src/xlat/sg_io_info.h /usr/src/debug/strace/7.2/src/xlat/syslog_action_type.h /usr/src/debug/strace/7.2/src/xlat/kd_font_ops.h /usr/src/debug/strace/7.2/src/ipc_sem.c /usr/src/debug/strace/7.2/src/xlat/ptrace_events.h /usr/src/debug/strace/7.2/tests/filter_seccomp-flag.c /usr/src/debug/strace/7.2/tests/quotactl_fd.c /usr/src/debug/strace/7.2/src/xlat/futexbitset.h /usr/src/debug/strace/7.2/src/xlat/perf_type_id.h /usr/src/debug/strace/7.2/src/xlat/listns_user_ns_id.h /usr/src/debug/strace/7.2/src/xlat/nl_audit_types.h /usr/src/debug/strace/7.2/src/xlat/rtnl_neightbl_parms_attrs.h /usr/src/debug/strace/7.2/tests/setgroups32.c /usr/src/debug/strace/7.2/src
 /xlat/btrfs_csum_types.h /usr/src/debug/strace/7.2/tests/is_linux_mips_n64.c /usr/src/debug/strace/7.2/tests/futex_wake.c /usr/src/debug/strace/7.2/tests/prctl-mce-kill.c /usr/src/debug/strace/7.2/tests/dup.c /usr/src/debug/strace/7.2/tests/nlattr_tcmsg.c /usr/src/debug/strace/7.2/src/xlat/landlock_rule_types.h /usr/src/debug/strace/7.2/src/xlat/v4l2_sdr_fmts.h /usr/src/debug/strace/7.2/tests/ptrace_set_syscall_info.c /usr/src/debug/strace/7.2/src/xlat/ptrace_cmds.h /usr/src/debug/strace/7.2/tests/lchown32.c /usr/src/debug/strace/7.2/tests/listmount.c /usr/src/debug/strace/7.2/src/xlat/seccomp_mode.h /usr/src/debug/strace/7.2/src/xlat/uring_async_cancel_flags.h /usr/src/debug/strace/7.2/tests/setresgid32.c /usr/src/debug/strace/7.2/tests/setresuid32.c /usr/src/debug/strace/7.2/tests/stat64.c /usr/src/debug/strace/7.2/src/xlat/nl_route_types.h /usr/src/debug/strace/7.2/src/xlat/mctp_addrs.h /usr/src/debug/strace/7.2/src/fetch_struct_flock.c /usr/src/debug/strace/7.2/src/fetch_struct_
 iovec.c /usr/src/debug/strace/7.2/src/xlat/nf_ctnetlink_msg_types.h /usr/src/debug/strace/7.2/src/xlat/uring_files_update_fds.h /usr/src/debug/strace/7.2/tests/net-yy-netlink.c /usr/src/debug/strace/7.2/tests/pause.c /usr/src/debug/strace/7.2/tests/kcmp.c /usr/src/debug/strace/7.2/tests/getuid.c /usr/src/debug/strace/7.2/tests/printstrn-umoven-peekdata.c /usr/src/debug/strace/7.2/tests/sigaltstack.c /usr/src/debug/strace/7.2/src/fcntl.c /usr/src/debug/strace/7.2/src/xlat/v4l2_input_capabilities_flags.h /usr/src/debug/strace/7.2/src/ioperm.c /usr/src/debug/strace/7.2/tests/quotactl.h /usr/src/debug/strace/7.2/src/xlat/sock_caif_options.h /usr/src/debug/strace/7.2/tests/mmap.c /usr/src/debug/strace/7.2/tests/quotactl.c /usr/src/debug/strace/7.2/src/xlat/ptrace_setoptions_flags.h /usr/src/debug/strace/7.2/src/xlat/tee_ioctl_impl_ids.h /usr/src/debug/strace/7.2/src/sysctl.c /usr/src/debug/strace/7.2/src/xlat/f_seals.h /usr/src/debug/strace/7.2/src/xlat/scmvals.h /usr/src/debug/strace/7.
 2/src/xlat/evdev_prop.h /usr/src/debug/strace/7.2/src/xlat/seccomp_ret_action.h /usr/src/debug/strace/7.2/tests/mmsg.c /usr/src/debug/strace/7.2/tests/times.c /usr/src/debug/strace/7.2/src/xlat/vsock_ports.h /usr/src/debug/strace/7.2/src/filter_qualify.c /usr/src/debug/strace/7.2/tests/segv_accerr.c /usr/src/debug/strace/7.2/tests/segv_pkuerr.c /usr/src/debug/strace/7.2/src/nbd_ioctl.c /usr/src/debug/strace/7.2/src/color.c /usr/src/debug/strace/7.2/src/color.h /usr/src/debug/strace/7.2/tests/rt_sigsuspend.c /usr/src/debug/strace/7.2/src/xlat/uring_iowq_acct.h /usr/src/debug/strace/7.2/tests/prctl-mdwe.c /usr/src/debug/strace/7.2/src/xlat/tee_ioctl_optee_caps.h /usr/src/debug/strace/7.2/tests/siginfo.c /usr/src/debug/strace/7.2/tests/status-none-threads.c /usr/src/debug/strace/7.2/src/xlat/sock_alg_options.h /usr/src/debug/strace/7.2/src/xlat/sock_iucv_options.h /usr/src/debug/strace/7.2/tests/aio.c /usr/src/debug/strace/7.2/src/xlat/rtnl_mdba_mdb_attrs.h /usr/src/debug/strace/7.2/sr
 c/dup.c /usr/src/debug/strace/7.2/src/ptp.c /usr/src/debug/strace/7.2/src/xlat/packet_diag_info_flags.h /usr/src/debug/strace/7.2/tests/lseek.c /usr/src/debug/strace/7.2/src/file_handle.c /usr/src/debug/strace/7.2/src/ldt.c /usr/src/debug/strace/7.2/src/net.c /usr/src/debug/strace/7.2/src/xlat/membarrier_flags.h /usr/src/debug/strace/7.2/tests/unix-pair-sendto-recvfrom.c /usr/src/debug/strace/7.2/src/xlat/rtnl_nha_res_group_attrs.h /usr/src/debug/strace/7.2/src/keyctl_kdf_params.h /usr/src/debug/strace/7.2/src/xlat/termios_cc.h /usr/src/debug/strace/7.2/tests/prctl-pdeathsig.c /usr/src/debug/strace/7.2/tests/kernel_old_timespec.h /usr/src/debug/strace/7.2/src/kernel_timespec.h /usr/src/debug/strace/7.2/src/netlink_generic.c /usr/src/debug/strace/7.2/tests/preadv-pwritev.c /usr/src/debug/strace/7.2/tests/fsmount.c /usr/src/debug/strace/7.2/src/xlat/sigprocmaskcmds.h /usr/src/debug/strace/7.2/src/netlink_generic.h /usr/src/debug/strace/7.2/tests/fstat64.c /usr/src/debug/strace/7.2/tes
 ts/fsync-y.c /usr/src/debug/strace/7.2/src/xlat/bpf_file_flags.h /usr/src/debug/strace/7.2/src/basic_filters.c /usr/src/debug/strace/7.2/tests/poke.c /usr/src/debug/strace/7.2/src/print_timespec.h /usr/src/debug/strace/7.2/src/xlat/af_packet_versions.h /usr/src/debug/strace/7.2/src/xlat/rename_flags.h /usr/src/debug/strace/7.2/src/xlat/sigfpe_codes.h /usr/src/debug/strace/7.2/src/xlat/splice_flags.h /usr/src/debug/strace/7.2/src/xlat/whence_codes.h /usr/src/debug/strace/7.2/src/xlat/perf_event_open_flags.h /usr/src/debug/strace/7.2/src/get_personality.h /usr/src/debug/strace/7.2/src/xlat/landlock_add_rule_flags.h /usr/src/debug/strace/7.2/src/xlat/sock_packet_options.h /usr/src/debug/strace/7.2/src/xlat/btrfs_qgroup_inherit_flags.h /usr/src/debug/strace/7.2/tests/xetpgid.c /usr/src/debug/strace/7.2/src/netlink_netfilter.c /usr/src/debug/strace/7.2/src/fetch_bpf_fprog.c /usr/src/debug/strace/7.2/src/xlat/kd_key_fn_keys.h /usr/src/debug/strace/7.2/src/xlat/unshare_flags.h /usr/src/deb
 ug/strace/7.2/src/fallocate.c /usr/src/debug/strace/7.2/tests/strace--syscall-limit.c /usr/src/debug/strace/7.2/src/membarrier.c /usr/src/debug/strace/7.2/src/number_set.c /usr/src/debug/strace/7.2/src/rtnl_tc_action.c /usr/src/debug/strace/7.2/tests/statmount.c /usr/src/debug/strace/7.2/tests/skip_unavailable.c /usr/src/debug/strace/7.2/src/number_set.h /usr/src/debug/strace/7.2/src/fetch_indirect_syscall_args.c /usr/src/debug/strace/7.2/src/xlat/v4l2_input_types.h /usr/src/debug/strace/7.2/src/xlat/getsock_options.h /usr/src/debug/strace/7.2/src/xlat/setsock_options.h /usr/src/debug/strace/7.2/tests/so_peerpidfd.c /usr/src/debug/strace/7.2/src/xlat/perf_branch_sample_type.h /usr/src/debug/strace/7.2/src/xlat/btrfs_balance_flags.h /usr/src/debug/strace/7.2/src/xlat/vsock_cids.h /usr/src/debug/strace/7.2/src/xlat/mtd_otp_options.h /usr/src/debug/strace/7.2/tests/check_sigblock.c /usr/src/debug/strace/7.2/src/xlat/bpf_map_lookup_elem_flags.h /usr/src/debug/strace/7.2/src/xlat/pr_set_
 mm.h /usr/src/debug/strace/7.2/tests/ioctl_sg_io_v4.c /usr/src/debug/strace/7.2/src/xlat/if_dqinfo_flags.h /usr/src/debug/strace/7.2/tests/nlattr_ifaddrmsg.c /usr/src/debug/strace/7.2/tests/sigaction.c /usr/src/debug/strace/7.2/tests/sigreturn.c /usr/src/debug/strace/7.2/src/bpf.c /usr/src/debug/strace/7.2/src/xlat/sock_xdp_options.h /usr/src/debug/strace/7.2/src/exitkill.c /usr/src/debug/strace/7.2/src/xlat/routing_protocols.h /usr/src/debug/strace/7.2/src/exitkill.h /usr/src/debug/strace/7.2/tests/net-packet_mreq.c /usr/src/debug/strace/7.2/tests/open--secontext.c /usr/src/debug/strace/7.2/src/futex.c /usr/src/debug/strace/7.2/src/xlat/gpio_v2_line_attr_ids.h /usr/src/debug/strace/7.2/tests/chroot.c /usr/src/debug/strace/7.2/src/xlat/mount_attr_attr.h /usr/src/debug/strace/7.2/tests/pkey_mprotect.c /usr/src/debug/strace/7.2/tests/swap.c /usr/src/debug/strace/7.2/src/xlat/smc_decl_codes.h /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_brport_attrs.h /usr/src/debug/strace/7.2/src/list
 ns.c /usr/src/debug/strace/7.2/tests/xetitimer.c /usr/src/debug/strace/7.2/src/xlat/bpf_attach_flags.h /usr/src/debug/strace/7.2/src/rtnl_netconf.c /usr/src/debug/strace/7.2/src/open.c /usr/src/debug/strace/7.2/src/print_mac.c /usr/src/debug/strace/7.2/src/printmode.c /usr/src/debug/strace/7.2/tests/inotify.c /usr/src/debug/strace/7.2/src/xlat/nf_nft_compat_msg_types.h /usr/src/debug/strace/7.2/src/xlat/nl_netfilter_msg_types.h /usr/src/debug/strace/7.2/src/xlat/v4l2_tuner_capabilities.h /usr/src/debug/strace/7.2/tests/umask.c /usr/src/debug/strace/7.2/src/xlat/uring_mem_region_reg_flags.h /usr/src/debug/strace/7.2/src/v4l2.c /usr/src/debug/strace/7.2/tests/shmxt.c /usr/src/debug/strace/7.2/src/statmount.c /usr/src/debug/strace/7.2/tests/nlattr_mdba_mdb_entry.c /usr/src/debug/strace/7.2/tests/process_vm_readv_writev.c /usr/src/debug/strace/7.2/tests/nlattr_ifla_vfinfo.c /usr/src/debug/strace/7.2/tests/access--secontext.c /usr/src/debug/strace/7.2/src/xlat/advise.h /usr/src/debug/str
 ace/7.2/src/perf.c /usr/src/debug/strace/7.2/src/print_utils.h /usr/src/debug/strace/7.2/src/xlat/v4l2_control_id_bases.h /usr/src/debug/strace/7.2/src/xlat/nt_descriptor_types.h /usr/src/debug/strace/7.2/src/xlat/lsm_ids.h /usr/src/debug/strace/7.2/src/xlat/fsmount_flags.h /usr/src/debug/strace/7.2/src/xlat/kd_font_flags.h /usr/src/debug/strace/7.2/tests/fallocate.c /usr/src/debug/strace/7.2/src/print_kernel_sigset.c /usr/src/debug/strace/7.2/tests/stack-fcall-3.c /usr/src/debug/strace/7.2/tests/inet-cmsg.c /usr/src/debug/strace/7.2/tests/netlink_nlctrl.c /usr/src/debug/strace/7.2/src/cachestat.c /usr/src/debug/strace/7.2/tests/chown32.c /usr/src/debug/strace/7.2/src/cachestat.h /usr/src/debug/strace/7.2/src/printrusage.c /usr/src/debug/strace/7.2/tests/status-unfinished.c /usr/src/debug/strace/7.2/tests/count_unknown_many.c /usr/src/debug/strace/7.2/tests/ptrace_syscall_info.c /usr/src/debug/strace/7.2/src/xlat/fiemap_extent_flags.h /usr/src/debug/strace/7.2/src/rtnl_dcb.c /usr/sr
 c/debug/strace/7.2/src/xlat/sg_scsi_reset.h /usr/src/debug/strace/7.2/src/xlat/socketcalls.h /usr/src/debug/strace/7.2/src/xlat/perf_hw_cache_id.h /usr/src/debug/strace/7.2/tests/s390_guarded_storage.c /usr/src/debug/strace/7.2/tests/nlattr_ifla_af_inet6.h /usr/src/debug/strace/7.2/tests/sol_tipc-group_join.c /usr/src/debug/strace/7.2/src/xlat/pidfd_send_signal_flags.h /usr/src/debug/strace/7.2/src/seccomp_ioctl.c /usr/src/debug/strace/7.2/src/xlat/gpio_event_flags.h /usr/src/debug/strace/7.2/src/xlat/delete_module_flags.h /usr/src/debug/strace/7.2/src/xlat/siginfo_codes.h /usr/src/debug/strace/7.2/tests/read-write.c /usr/src/debug/strace/7.2/tests/prctl-set-ptracer-success.c /usr/src/debug/strace/7.2/tests/shutdown.c /usr/src/debug/strace/7.2/tests/detach-vfork.c /usr/src/debug/strace/7.2/src/xlat/term_oflags_nldly.h /usr/src/debug/strace/7.2/src/dirent64.c /usr/src/debug/strace/7.2/src/count.c /usr/src/debug/strace/7.2/src/mount.c /usr/src/debug/strace/7.2/tests/tprintf.c /usr/src
 /debug/strace/7.2/tests/prctl-riscv-v-ctrl.c /usr/src/debug/strace/7.2/tests/nlattr_ifla_proto_down_reason.c /usr/src/debug/strace/7.2/tests/epoll_wait.c /usr/src/debug/strace/7.2/tests/printsignal.c /usr/src/debug/strace/7.2/src/xlat/bpf_map_update_elem_flags.h /usr/src/debug/strace/7.2/src/pidfd_ioctl.c /usr/src/debug/strace/7.2/src/xlat/baud_options.h /usr/src/debug/strace/7.2/src/xlat/sock_options.h /usr/src/debug/strace/7.2/tests/sock_filter-v.c /usr/src/debug/strace/7.2/tests/pipe2.c /usr/src/debug/strace/7.2/src/xlat/rseq_cs_flags.h /usr/src/debug/strace/7.2/tests/mmsg_name.c /usr/src/debug/strace/7.2/src/xlat/sock_dccp_options.h /usr/src/debug/strace/7.2/src/socketcall.c /usr/src/debug/strace/7.2/tests/nfnetlink_nft_compat.c /usr/src/debug/strace/7.2/src/ioctl.c /usr/src/debug/strace/7.2/src/prctl.c /usr/src/debug/strace/7.2/tests/clock_xettime64.c /usr/src/debug/strace/7.2/tests/pkey_free.c /usr/src/debug/strace/7.2/tests/strace--always-show-pid.c /usr/src/debug/strace/7.2/
 src/epoll.c /usr/src/debug/strace/7.2/src/xlat/mctl_sync.h /usr/src/debug/strace/7.2/tests/net-tpacket_stats.c /usr/src/debug/strace/7.2/tests/nlattr_netlink_diag_msg.c /usr/src/debug/strace/7.2/src/xlat/uffd_register_ioctl_flags.h /usr/src/debug/strace/7.2/tests/umovestr3.c /usr/src/debug/strace/7.2/tests/signalfd4.c /usr/src/debug/strace/7.2/src/ptrace.c /usr/src/debug/strace/7.2/src/strace.c /usr/src/debug/strace/7.2/src/xlat/fiemap_flags.h /usr/src/debug/strace/7.2/src/xlat/mremap_flags.h /usr/src/debug/strace/7.2/tests/file_handle--secontext.c /usr/src/debug/strace/7.2/src/ptrace.h /usr/src/debug/strace/7.2/src/quota.c /usr/src/debug/strace/7.2/src/xlat/landlock_create_ruleset_flags.h /usr/src/debug/strace/7.2/src/xlat/uring_zcrx_event_types.h /usr/src/debug/strace/7.2/tests/futex_wait.c /usr/src/debug/strace/7.2/src/xlat/pr_riscv_icache_flush_ctxes.h /usr/src/debug/strace/7.2/tests/printstrn-umoven-undumpable.c /usr/src/debug/strace/7.2/src/xlat/pr_sme_vl_flags.h /usr/src/debu
 g/strace/7.2/src/xlat/pr_sve_vl_flags.h /usr/src/debug/strace/7.2/src/xlat/genl_nl80211_cmd.h /usr/src/debug/strace/7.2/tests/chmod.c /usr/src/debug/strace/7.2/src/xlat/aio_cmds.h /usr/src/debug/strace/7.2/tests/ioctl_block.c /usr/src/debug/strace/7.2/tests/xattr.c /usr/src/debug/strace/7.2/src/xlat/sync_file_range_flags.h /usr/src/debug/strace/7.2/src/xlat/neighbor_cache_entry_ext_flags.h /usr/src/debug/strace/7.2/src/xlat/uring_register_opcodes.h /usr/src/debug/strace/7.2/src/xlat/sigaltstack_flags.h /usr/src/debug/strace/7.2/src/xlat/genl_ctrl_attr_op_flags.h /usr/src/debug/strace/7.2/tests/sethostname.c /usr/src/debug/strace/7.2/src/xlat/pr_ppc_dexcr_ctrl_flags.h /usr/src/debug/strace/7.2/tests/so_peercred.c /usr/src/debug/strace/7.2/tests/nlattr_ifla.h /usr/src/debug/strace/7.2/tests/bpf-obj_get_info_by_fd.c /usr/src/debug/strace/7.2/src/numa.c /usr/src/debug/strace/7.2/tests/unix-pair-send-recv.c /usr/src/debug/strace/7.2/tests/getcwd.c /usr/src/debug/strace/7.2/tests/print_qu
 oted_string.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_af_spec_mctp_attrs.h /usr/src/debug/strace/7.2/src/netlink_selinux.c /usr/src/debug/strace/7.2/tests/mlock2.c /usr/src/debug/strace/7.2/src/xlat/rtnl_br_stp_mode.h /usr/src/debug/strace/7.2/src/mmap_cache.h /usr/src/debug/strace/7.2/src/mmap_cache.c /usr/src/debug/strace/7.2/src/xlat/f_owner_types.h /usr/src/debug/strace/7.2/tests/init_module.c /usr/src/debug/strace/7.2/tests/accept.c /usr/src/debug/strace/7.2/tests/net-yy-unix.c /usr/src/debug/strace/7.2/tests/nlattr_tca_stab.c /usr/src/debug/strace/7.2/src/xlat/bpf_op_jmp.h /usr/src/debug/strace/7.2/tests/setfsugid.c /usr/src/debug/strace/7.2/tests/setreugid.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_af_spec_inet6_attrs.h /usr/src/debug/strace/7.2/tests/ftruncate64.c /usr/src/debug/strace/7.2/tests/epoll_create.c /usr/src/debug/strace/7.2/src/xlat/v4l2_control_classes.h /usr/src/debug/strace/7.2/tests/aio_pgetevents.c /usr/src/debug/strace/7.2/tests/ioctl_gpio.c /usr/s
 rc/debug/strace/7.2/tests/ioctl_hdio.c /usr/src/debug/strace/7.2/src/xlat/inet_diag_bpf_storages_attrs.h /usr/src/debug/strace/7.2/tests/nlattr_ifla_port.c /usr/src/debug/strace/7.2/src/bpf_sock_filter.c /usr/src/debug/strace/7.2/src/xlat/nf_hook_msg_types.h /usr/src/debug/strace/7.2/tests/waitid.c /usr/src/debug/strace/7.2/tests/nlattr_dcbmsg.c /usr/src/debug/strace/7.2/src/xlat/hdio_busstates.h /usr/src/debug/strace/7.2/src/xlat/v4l2_buf_flags.h /usr/src/debug/strace/7.2/src/xlat/v4l2_buf_types.h /usr/src/debug/strace/7.2/tests/print_ppid_tracerpid.c /usr/src/debug/strace/7.2/tests/attach-f-p-cmd.c /usr/src/debug/strace/7.2/src/xlat/memfd_secret_flags.h /usr/src/debug/strace/7.2/tests/fchmodat2.c /usr/src/debug/strace/7.2/src/xlat/futexops.h /usr/src/debug/strace/7.2/tests/ptrace.c /usr/src/debug/strace/7.2/src/xlat/close_range_flags.h /usr/src/debug/strace/7.2/src/xlat/pr_spec_cmds.h /usr/src/debug/strace/7.2/tests/ioctl-v.c /usr/src/debug/strace/7.2/tests/ioctl_scsi.c /usr/src/d
 ebug/strace/7.2/src/xlat/inotify_flags.h /usr/src/debug/strace/7.2/src/netlink_route.h /usr/src/debug/strace/7.2/src/netlink_route.c /usr/src/debug/strace/7.2/tests/vmsplice.c /usr/src/debug/strace/7.2/src/xlat/kd_key_ascii_keys.h /usr/src/debug/strace/7.2/src/xlat/kd_key_shift_keys.h /usr/src/debug/strace/7.2/src/xlat/kd_key_slock_keys.h /usr/src/debug/strace/7.2/src/xlat/lsm_attrs.h /usr/src/debug/strace/7.2/tests/printxval.c /usr/src/debug/strace/7.2/tests/prctl-name.c /usr/src/debug/strace/7.2/tests/print_time.c /usr/src/debug/strace/7.2/tests/readv.c /usr/src/debug/strace/7.2/src/xlat/counter_ioctl_event_types.h /usr/src/debug/strace/7.2/tests/arch_prctl.c /usr/src/debug/strace/7.2/src/xlat/sg_io_dxfer_direction.h /usr/src/debug/strace/7.2/src/xlat/landlock_ruleset_access_fs.h /usr/src/debug/strace/7.2/tests/fcntl.c /usr/src/debug/strace/7.2/src/netlink_netlink_diag.c /usr/src/debug/strace/7.2/src/xlat/route_nexthop_flags.h /usr/src/debug/strace/7.2/src/xlat/mtd_flags_options.h
  /usr/src/debug/strace/7.2/tests/setns.c /usr/src/debug/strace/7.2/src/sg_io_v4.c /usr/src/debug/strace/7.2/tests/ioctl_kvm_run.c /usr/src/debug/strace/7.2/src/dyxlat.c /usr/src/debug/strace/7.2/src/fspick.c /usr/src/debug/strace/7.2/src/mmsghdr.c /usr/src/debug/strace/7.2/tests/readlink.c /usr/src/debug/strace/7.2/tests/recvfrom.c /usr/src/debug/strace/7.2/tests/renameat.c /usr/src/debug/strace/7.2/tests/rseq.c /usr/src/debug/strace/7.2/tests/nlattr_ifaddrlblmsg.c /usr/src/debug/strace/7.2/src/xlat/netlink_socket_flags.h /usr/src/debug/strace/7.2/tests/ioctl_kvm_run_auxstr_vcpu_more.c /usr/src/debug/strace/7.2/src/kernel_dirent.h /usr/src/debug/strace/7.2/tests/sched_xetparam.c /usr/src/debug/strace/7.2/src/xlat/netfilter_versions.h /usr/src/debug/strace/7.2/src/xlat/evdev_abs.h /usr/src/debug/strace/7.2/tests/rt_sigpending.c /usr/src/debug/strace/7.2/src/xlat/bpf_stats_type.h /usr/src/debug/strace/7.2/tests/ioctl_rtc.c /usr/src/debug/strace/7.2/src/xlat/bpf_rval.h /usr/src/debug/s
 trace/7.2/src/xlat/open_resolve_flags.h /usr/src/debug/strace/7.2/src/xlat/key_reqkeys.h /usr/src/debug/strace/7.2/tests/semop.c /usr/src/debug/strace/7.2/tests/sol_tipc-importance.c /usr/src/debug/strace/7.2/src/xlat/tee_ioctl_param_attr_types.h /usr/src/debug/strace/7.2/tests/kill_child.c /usr/src/debug/strace/7.2/tests/sched_xetattr.c /usr/src/debug/strace/7.2/src/xlat/rtnl_family.h /usr/src/debug/strace/7.2/src/xlat/uring_enter_flags.h /usr/src/debug/strace/7.2/tests/nfnetlink_ctnetlink.c /usr/src/debug/strace/7.2/src/xlat/sock_llc_options.h /usr/src/debug/strace/7.2/tests/attach-p-cmd.h /usr/src/debug/strace/7.2/src/xlat/pr_tagged_addr_mte_tcf.h /usr/src/debug/strace/7.2/src/xlat/kvm_exit_io.h /usr/src/debug/strace/7.2/src/xlat/evdev_autorepeat.h /usr/src/debug/strace/7.2/src/xlat/uring_recvsend_flags.h /usr/src/debug/strace/7.2/src/xlat/uring_napi_tracking_strategies.h /usr/src/debug/strace/7.2/src/fetch_struct_stat.c /usr/src/debug/strace/7.2/src/xlat/nfc_saps.h /usr/src/debu
 g/strace/7.2/tests/eventfd-yy.c /usr/src/debug/strace/7.2/src/xlat/at_flags.h /usr/src/debug/strace/7.2/src/xlat/dm_flags.h /usr/src/debug/strace/7.2/src/xlat/iffflags.h /usr/src/debug/strace/7.2/src/xlat/nf_cthelper_msg_types.h /usr/src/debug/strace/7.2/tests/io_uring_enter.c /usr/src/debug/strace/7.2/src/xlat/cap_mask1.h /usr/src/debug/strace/7.2/src/xlat/kcmp_types.h /usr/src/debug/strace/7.2/src/xlat/quotatypes.h /usr/src/debug/strace/7.2/src/xlat/gpio_line_flags.h /usr/src/debug/strace/7.2/src/xlat/gpio_handle_flags.h /usr/src/debug/strace/7.2/tests/netlink_route.c /usr/src/debug/strace/7.2/src/xlat/uring_msg_ring_flags.h /usr/src/debug/strace/7.2/src/xlat/socketlayers.h /usr/src/debug/strace/7.2/tests/ioctl_fs_f.c /usr/src/debug/strace/7.2/src/reboot.c /usr/src/debug/strace/7.2/src/loop.c /usr/src/debug/strace/7.2/tests/tail_alloc.c /usr/src/debug/strace/7.2/src/print_statfs.c /usr/src/debug/strace/7.2/tests/maybe_switch_current_tcp.c /usr/src/debug/strace/7.2/src/xlat/rtnl_if
 la_vfinfo_list_attrs.h /usr/src/debug/strace/7.2/src/xlat/fdflags.h /usr/src/debug/strace/7.2/tests/pselect6_time64.c /usr/src/debug/strace/7.2/tests/getsid.c /usr/src/debug/strace/7.2/tests/net-icmp_filter.c /usr/src/debug/strace/7.2/src/xlat/tcp_state_flags.h /usr/src/debug/strace/7.2/src/xlat/term_cflags.h /usr/src/debug/strace/7.2/src/printsiginfo.h /usr/src/debug/strace/7.2/src/xlat/xfs_dqblk_flags.h /usr/src/debug/strace/7.2/src/xlat/listmount_flags.h /usr/src/debug/strace/7.2/src/printsiginfo.c /usr/src/debug/strace/7.2/src/xlat/statmount_flags.h /usr/src/debug/strace/7.2/src/netlink_unix_diag.c /usr/src/debug/strace/7.2/tests/printflags.c /usr/src/debug/strace/7.2/src/kernel_v4l2_types.h /usr/src/debug/strace/7.2/src/xlat/faccessat_flags.h /usr/src/debug/strace/7.2/src/xlat/term_lflags.h /usr/src/debug/strace/7.2/tests/setpgrp-exec.c /usr/src/debug/strace/7.2/src/xlat/kd_key_dead_keys.h /usr/src/debug/strace/7.2/src/xlat/kd_key_lock_keys.h /usr/src/debug/strace/7.2/src/xlat/
 kd_key_spec_keys.h /usr/src/debug/strace/7.2/tests/ioctl_pidfd_get_info.c /usr/src/debug/strace/7.2/src/fsmount.c /usr/src/debug/strace/7.2/tests/mount.c /usr/src/debug/strace/7.2/tests/attach-f-p.c /usr/src/debug/strace/7.2/tests/errno2name.c /usr/src/debug/strace/7.2/src/lookup_dcookie.c /usr/src/debug/strace/7.2/src/xlat/v4l2_vbi_flags.h /usr/src/debug/strace/7.2/src/xlat/rtnl_nsid_attrs.h /usr/src/debug/strace/7.2/src/xlat/pr_fp_mode.h /usr/src/debug/strace/7.2/tests/madvise.c /usr/src/debug/strace/7.2/src/sysent.h /usr/src/debug/strace/7.2/src/xlat/hdio_drive_cmds.h /usr/src/debug/strace/7.2/src/xlat/adjtimex_status.h /usr/src/debug/strace/7.2/src/xlat/getrandom_flags.h /usr/src/debug/strace/7.2/src/xlat/watchdog_ioctl_flags.h /usr/src/debug/strace/7.2/tests/ioprio.c /usr/src/debug/strace/7.2/tests/xchownx.c /usr/src/debug/strace/7.2/tests/group_req.c /usr/src/debug/strace/7.2/src/xlat/bdaddr_types.h /usr/src/debug/strace/7.2/src/xlat/itimer_which.h /usr/src/debug/strace/7.2/te
 sts/poll.c /usr/src/debug/strace/7.2/src/xlat/nl_selinux_types.h /usr/src/debug/strace/7.2/src/xlat/rtnl_rta_metrics_attrs.h /usr/src/debug/strace/7.2/src/execve.c /usr/src/debug/strace/7.2/tests/clone-flags.c /usr/src/debug/strace/7.2/tests/timer_create.c /usr/src/debug/strace/7.2/tests/mlockall.c /usr/src/debug/strace/7.2/src/xlat/ieee802154_addr_types.h /usr/src/debug/strace/7.2/tests/old_mmap.c /usr/src/debug/strace/7.2/src/access.c /usr/src/debug/strace/7.2/src/xlat/tee_ioctl_gen_caps.h /usr/src/debug/strace/7.2/tests/oldfstat.c /usr/src/debug/strace/7.2/tests/oldlstat.c /usr/src/debug/strace/7.2/tests/kexec_load.c /usr/src/debug/strace/7.2/tests/error_msg.c /usr/src/debug/strace/7.2/src/xlat/genl_ctrl_attr_mcast_grp.h /usr/src/debug/strace/7.2/src/xlat/bpf_prog_flags.h /usr/src/debug/strace/7.2/src/xlat/bpf_prog_types.h /usr/src/debug/strace/7.2/tests/fsync.c /usr/src/debug/strace/7.2/tests/erestartsys.c /usr/src/debug/strace/7.2/tests/dirfd.c /usr/src/debug/strace/7.2/tests/e
 poll_pwait.c /usr/src/debug/strace/7.2/src/xlat/netlink_flags.h /usr/src/debug/strace/7.2/src/xlat/netlink_types.h /usr/src/debug/strace/7.2/src/xlat/rtnl_neightbl_attrs.h /usr/src/debug/strace/7.2/src/xlat/notifyflags.h /usr/src/debug/strace/7.2/src/xlat/fchmodat_flags.h /usr/src/debug/strace/7.2/src/xlat/sock_nfcllcp_options.h /usr/src/debug/strace/7.2/src/print_timeval.c /usr/src/debug/strace/7.2/src/xlat/af_packet_types.h /usr/src/debug/strace/7.2/tests/execveat--secontext.c /usr/src/debug/strace/7.2/tests/rt_sigtimedwait.c /usr/src/debug/strace/7.2/tests/nlattr_ndmsg.c /usr/src/debug/strace/7.2/tests/munlockall.c /usr/src/debug/strace/7.2/src/xlat/v4l2_capture_modes.h /usr/src/debug/strace/7.2/tests/prctl-unalign.c /usr/src/debug/strace/7.2/src/xlat/genl_mptcp_pm_cmd.h /usr/src/debug/strace/7.2/src/xlat/nf_acct_msg_types.h /usr/src/debug/strace/7.2/tests/fchmod-y--secontext.c /usr/src/debug/strace/7.2/tests/fchmodat--secontext.c /usr/src/debug/strace/7.2/tests/scm_pidfd-success
 .c /usr/src/debug/strace/7.2/tests/fchownat--secontext.c /usr/src/debug/strace/7.2/tests/ioctl_fs_x.c /usr/src/debug/strace/7.2/src/xlat/kd_key_tables.h /usr/src/debug/strace/7.2/src/umask.c /usr/src/debug/strace/7.2/src/xlat/btrfs_qgroup_status_flags.h /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_af_spec_bridge_vlan_tunnel_info_attrs.h /usr/src/debug/strace/7.2/src/xlat/fib_rule_flags.h /usr/src/debug/strace/7.2/src/xlat/fan_init_flags.h /usr/src/debug/strace/7.2/tests/netlink_audit.c /usr/src/debug/strace/7.2/tests/nlattr_rtgenmsg.c /usr/src/debug/strace/7.2/tests/unshare.c /usr/src/debug/strace/7.2/tests/remap_file_pages.c /usr/src/debug/strace/7.2/src/xlat/aio_iocb_flags.h /usr/src/debug/strace/7.2/src/xlat/keyctl_pkey_ops.h /usr/src/debug/strace/7.2/src/xlat/pidfd_open_flags.h /usr/src/debug/strace/7.2/src/xlat/term_oflags_vtdly.h /usr/src/debug/strace/7.2/src/xlat/v4l2_frameinterval_types.h /usr/src/debug/strace/7.2/tests/fork--pidns-translation.c /usr/src/debug/strace/7.2/tes
 ts/getpeername.c /usr/src/debug/strace/7.2/src/xlat/statmount_sb_flags.h /usr/src/debug/strace/7.2/tests/getsockname.c /usr/src/debug/strace/7.2/tests/set_mempolicy_home_node.c /usr/src/debug/strace/7.2/tests/ipc.c /usr/src/debug/strace/7.2/src/netlink_crypto.c /usr/src/debug/strace/7.2/src/udmabuf.c /usr/src/debug/strace/7.2/src/link.c /usr/src/debug/strace/7.2/src/mknod.c /usr/src/debug/strace/7.2/tests/k_sockopt.h /usr/src/debug/strace/7.2/tests/ioctl_mtd.c /usr/src/debug/strace/7.2/tests/ioctl_nbd.c /usr/src/debug/strace/7.2/tests/umovestr.c /usr/src/debug/strace/7.2/tests/k_sockopt.c /usr/src/debug/strace/7.2/tests/mount_setattr.c /usr/src/debug/strace/7.2/tests/brk.c /usr/src/debug/strace/7.2/src/nsfs.c /usr/src/debug/strace/7.2/tests/_newselect.c /usr/src/debug/strace/7.2/src/defs.h /usr/src/debug/strace/7.2/tests/ioperm.c /usr/src/debug/strace/7.2/src/xlat/ieee802154_addrs.h /usr/src/debug/strace/7.2/src/evdev.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ipmra_msg_types.h /usr/
 src/debug/strace/7.2/tests/nlattr.c /usr/src/debug/strace/7.2/src/xlat/rtnl_addrlabel_attrs.h /usr/src/debug/strace/7.2/src/xlat/sock_vsock_options.h /usr/src/debug/strace/7.2/src/xlat/icmp_filter_flags.h /usr/src/debug/strace/7.2/src/xlat/sock_rxrpc_options.h /usr/src/debug/strace/7.2/src/xlat/v4l2_colorspaces.h /usr/src/debug/strace/7.2/src/xlat/sock_pppol2tp_options.h /usr/src/debug/strace/7.2/tests/prctl-sched-core.c /usr/src/debug/strace/7.2/tests/stack-fcall-1.c /usr/src/debug/strace/7.2/tests/getegid.c /usr/src/debug/strace/7.2/tests/geteuid.c /usr/src/debug/strace/7.2/tests/getpgrp.c /usr/src/debug/strace/7.2/tests/getppid.c /usr/src/debug/strace/7.2/tests/getxgid.c /usr/src/debug/strace/7.2/tests/getxpid.c /usr/src/debug/strace/7.2/tests/getxuid.c /usr/src/debug/strace/7.2/tests/time.c /usr/src/debug/strace/7.2/tests/fsconfig.c /usr/src/debug/strace/7.2/tests/getsockname--secontext.c /usr/src/debug/strace/7.2/src/xlat/ip_cmsg_types.h /usr/src/debug/strace/7.2/src/xlat/ipc_m
 sg_flags.h /usr/src/debug/strace/7.2/src/xlat/unix_diag_show.h /usr/src/debug/strace/7.2/tests/nlattr_ifla_af_spec.c /usr/src/debug/strace/7.2/tests/env-i.c /usr/src/debug/strace/7.2/tests/prctl-tid_address.c /usr/src/debug/strace/7.2/tests/ioctl_winsize.c /usr/src/debug/strace/7.2/src/sen.h /usr/src/debug/strace/7.2/src/nlattr.c /usr/src/debug/strace/7.2/tests/nlattr_rtmsg.c /usr/src/debug/strace/7.2/tests/prctl-riscv-icache-flush-ctx.c /usr/src/debug/strace/7.2/src/nlattr.h /usr/src/debug/strace/7.2/src/sg_io_v3.c /usr/src/debug/strace/7.2/tests/pidns.c /usr/src/debug/strace/7.2/src/xlat/inet_diag_bpf_storage_attrs.h /usr/src/debug/strace/7.2/tests/fanotify_mark--secontext.c /usr/src/debug/strace/7.2/tests/mknodat.c /usr/src/debug/strace/7.2/src/xlat/btrfs_dev_replace_cmds.h /usr/src/debug/strace/7.2/tests/pidns.h /usr/src/debug/strace/7.2/src/eventfd.c /usr/src/debug/strace/7.2/src/xlat/lirc_features.h /usr/src/debug/strace/7.2/src/xlat/x86_xfeatures.h /usr/src/debug/strace/7.2/t
 ests/pipe_maxfd.c /usr/src/debug/strace/7.2/src/renameat.c /usr/src/debug/strace/7.2/tests/qual_inject-retval.c /usr/src/debug/strace/7.2/tests/qual_inject-signal.c /usr/src/debug/strace/7.2/src/xlat/tcflsh_options.h /usr/src/debug/strace/7.2/src/xlat/neighbor_cache_entry_states.h /usr/src/debug/strace/7.2/tests/mknod.c /usr/src/debug/strace/7.2/tests/linkat--secontext.c /usr/src/debug/strace/7.2/tests/seccomp-filter.c /usr/src/debug/strace/7.2/src/xlat/nl_xfrm_types.h /usr/src/debug/strace/7.2/tests/syslog.c /usr/src/debug/strace/7.2/src/xlat/pr_riscv_v_states.h /usr/src/debug/strace/7.2/tests/signal.c /usr/src/debug/strace/7.2/src/fsopen.c /usr/src/debug/strace/7.2/tests/open.c /usr/src/debug/strace/7.2/tests/sigpending.c /usr/src/debug/strace/7.2/tests/nfnetlink_cttimeout.c /usr/src/debug/strace/7.2/src/xlat/packet_mreq_type.h /usr/src/debug/strace/7.2/src/xlat/bootflags3.h /usr/src/debug/strace/7.2/src/xlat/access_modes.h /usr/src/debug/strace/7.2/src/xlat/sigbus_codes.h /usr/sr
 c/debug/strace/7.2/src/xlat/sigsys_codes.h /usr/src/debug/strace/7.2/src/xlat/statfs_flags.h /usr/src/debug/strace/7.2/src/xlat/bootflags1.h /usr/src/debug/strace/7.2/src/xlat/getsock_ip_options.h /usr/src/debug/strace/7.2/src/xlat/setsock_ip_options.h /usr/src/debug/strace/7.2/src/capability.c /usr/src/debug/strace/7.2/src/xlat/sigsegv_codes.h /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_vf_stats_attrs.h /usr/src/debug/strace/7.2/src/xlat/v4l2_sliced_flags.h /usr/src/debug/strace/7.2/src/xlat/open_tree_flags.h /usr/src/debug/strace/7.2/tests/nlattr_ifinfomsg.c /usr/src/debug/strace/7.2/src/xlat/packet_diag_show.h /usr/src/debug/strace/7.2/src/xlat/genl_netdev_cmd.h /usr/src/debug/strace/7.2/src/xlat/shadow_stack_flags.h /usr/src/debug/strace/7.2/src/xlat/uffd_register_mode_flags.h /usr/src/debug/strace/7.2/tests/ioctl_v4l2-success.c /usr/src/debug/strace/7.2/tests/rt_sigqueueinfo.c /usr/src/debug/strace/7.2/tests/dup2.c /usr/src/debug/strace/7.2/src/xlat/pr_spec_get_store_bypass_fl
 ags.h /usr/src/debug/strace/7.2/src/xlat/pr_spec_set_store_bypass_flags.h /usr/src/debug/strace/7.2/src/xlat/sock_bluetooth_options.h /usr/src/debug/strace/7.2/tests/nlattr_crypto_user_alg.c /usr/src/debug/strace/7.2/src/xlat/sock_kcm_options.h /usr/src/debug/strace/7.2/tests/netlink_protocol.c /usr/src/debug/strace/7.2/tests/nlattr_smc_diag_msg.c /usr/src/debug/strace/7.2/src/xlat/sock_ax25_options.h /usr/src/debug/strace/7.2/tests/xattr-strings.c /usr/src/debug/strace/7.2/src/mtd.c /usr/src/debug/strace/7.2/src/uid.c /usr/src/debug/strace/7.2/src/xlat/clone_flags.h /usr/src/debug/strace/7.2/src/xlat/mbind_flags.h /usr/src/debug/strace/7.2/src/xlat/mlock_flags.h /usr/src/debug/strace/7.2/src/xlat/modem_flags.h /usr/src/debug/strace/7.2/src/xlat/mount_flags.h /usr/src/debug/strace/7.2/src/xlat/sched_flags.h /usr/src/debug/strace/7.2/src/xlat/semop_flags.h /usr/src/debug/strace/7.2/src/xlat/sg_io_flags.h /usr/src/debug/strace/7.2/src/xlat/vsock_flags.h /usr/src/debug/strace/7.2/tests
 /fchmodat2--secontext.c /usr/src/debug/strace/7.2/src/listen.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_info_data_bridge_attrs.h /usr/src/debug/strace/7.2/tests/close_range.c /usr/src/debug/strace/7.2/src/xlat/inet_diag_ulp_info_attrs.h /usr/src/debug/strace/7.2/src/xlat/mtd_file_mode_options.h /usr/src/debug/strace/7.2/src/xlat/v4l2_device_capabilities_flags.h /usr/src/debug/strace/7.2/tests/fanotify_init.c /usr/src/debug/strace/7.2/src/xlat/bpf_size.h /usr/src/debug/strace/7.2/src/keyctl.c /usr/src/debug/strace/7.2/tests/netlink_netfilter.c /usr/src/debug/strace/7.2/tests/futex.c /usr/src/debug/strace/7.2/tests/getresugid.c /usr/src/debug/strace/7.2/tests/create_tmpfile.c /usr/src/debug/strace/7.2/src/xlat/evdev_ev.h /usr/src/debug/strace/7.2/src/process_vm.c /usr/src/debug/strace/7.2/src/xlat/bpf_class.h /usr/src/debug/strace/7.2/src/xlat/nl_sock_diag_types.h /usr/src/debug/strace/7.2/src/socketutils.c /usr/src/debug/strace/7.2/src/kernel_rusage.h /usr/src/debug/strace/7.2/sr
 c/xlat/rtnl_tc_action_attrs.h /usr/src/debug/strace/7.2/tests/fchmod.c /usr/src/debug/strace/7.2/src/memfd_secret.c /usr/src/debug/strace/7.2/src/xlat/pr_tsc.h /usr/src/debug/strace/7.2/src/xlat/packet_diag_attrs.h /usr/src/debug/strace/7.2/src/xlat/btrfs_tree_objectids.h /usr/src/debug/strace/7.2/tests/hexdump_strdup.c /usr/src/debug/strace/7.2/src/utimes.c /usr/src/debug/strace/7.2/tests/set_ptracer_any.c /usr/src/debug/strace/7.2/src/scsi.c /usr/src/debug/strace/7.2/src/xlat/phonet_protocols.h /usr/src/debug/strace/7.2/src/xlat/fib_rule_actions.h /usr/src/debug/strace/7.2/tests/ioctl_counter.c /usr/src/debug/strace/7.2/tests/getgid.c /usr/src/debug/strace/7.2/src/kexec.c /usr/src/debug/strace/7.2/src/perf_ioctl.c /usr/src/debug/strace/7.2/tests/status-failed.c /usr/src/debug/strace/7.2/src/xlat/v4l2_framesize_types.h /usr/src/debug/strace/7.2/tests/ioctl_seccomp.c /usr/src/debug/strace/7.2/src/print_ifindex.c /usr/src/debug/strace/7.2/src/fetch_struct_keyctl_kdf_params.c /usr/src
 /debug/strace/7.2/tests/ustat.c /usr/src/debug/strace/7.2/src/xlat/priorities.h /usr/src/debug/strace/7.2/tests/ugetrlimit.c /usr/src/debug/strace/7.2/src/xlat/pr_pac_keys.h /usr/src/debug/strace/7.2/tests/sockaddr_xlat.c /usr/src/debug/strace/7.2/src/ptrace_syscall_info.h /usr/src/debug/strace/7.2/src/ptrace_syscall_info.c /usr/src/debug/strace/7.2/src/utime.c /usr/src/debug/strace/7.2/tests/nlattr_mdba_router_port.c /usr/src/debug/strace/7.2/src/xlat/ptrace_peeksiginfo_flags.h /usr/src/debug/strace/7.2/src/xlat/x86_xfeature_bits.h /usr/src/debug/strace/7.2/tests/statx.c /usr/src/debug/strace/7.2/tests/pread64-pwrite64.c /usr/src/debug/strace/7.2/tests/preadv2-pwritev2.c /usr/src/debug/strace/7.2/tests/sync_file_range.c /usr/src/debug/strace/7.2/src/personality.c /usr/src/debug/strace/7.2/tests/semop-indirect.c /usr/src/debug/strace/7.2/tests/nlattr_ifla_brport.c /usr/src/debug/strace/7.2/src/xlat/tls_info_versions.h /usr/src/debug/strace/7.2/src/xlat/ubi_volume_types.h /usr/src/de
 bug/strace/7.2/src/iopl.c /usr/src/debug/strace/7.2/src/ipc_shm.c /usr/src/debug/strace/7.2/src/xlat/seccomp_ioctl_addfd_flags.h /usr/src/debug/strace/7.2/src/xlat/nf_ipset_msg_types.h /usr/src/debug/strace/7.2/tests/restart_syscall.c /usr/src/debug/strace/7.2/src/fetch_struct_xfs_quotastat.c /usr/src/debug/strace/7.2/src/xlat/sock_tipc_options.h /usr/src/debug/strace/7.2/src/epoll_ioctl.c /usr/src/debug/strace/7.2/tests/openat--secontext.c /usr/src/debug/strace/7.2/tests/uio.c /usr/src/debug/strace/7.2/tests/inotify_init1.c /usr/src/debug/strace/7.2/tests/ftruncate.c /usr/src/debug/strace/7.2/src/xlat/move_mount_flags.h /usr/src/debug/strace/7.2/src/xlat/kvm_cap.h /usr/src/debug/strace/7.2/tests/epoll_pwait2.c /usr/src/debug/strace/7.2/tests/caps.c /usr/src/debug/strace/7.2/src/xlat/rwh_write_life_hints.h /usr/src/debug/strace/7.2/src/oldstat.c /usr/src/debug/strace/7.2/tests/oldselect.c /usr/src/debug/strace/7.2/tests/sched_getscheduler-success.c /usr/src/debug/strace/7.2/src/xlat
 /sock_sctp_options.h /usr/src/debug/strace/7.2/tests/rt_sigaction.c /usr/src/debug/strace/7.2/src/xlat/counter_ioctl_scopes.h /usr/src/debug/strace/7.2/src/xlat/inet_diag_ulp_info_mptcp_attrs.h /usr/src/debug/strace/7.2/src/xlat/tee_ioctl_origins.h /usr/src/debug/strace/7.2/src/xlat/execveat_flags.h /usr/src/debug/strace/7.2/src/xlat/fcntlcmds.h /usr/src/debug/strace/7.2/src/xlat/flockcmds.h /usr/src/debug/strace/7.2/src/xlat/lockfcmds.h /usr/src/debug/strace/7.2/src/xlat/quotacmds.h /usr/src/debug/strace/7.2/tests/nlattr_fib_rule_hdr.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_br_mcast_querier_attrs.h /usr/src/debug/strace/7.2/tests/pidns-cache.c /usr/src/debug/strace/7.2/src/xlat/netlink_delete_flags.h /usr/src/debug/strace/7.2/src/xlat/shutdown_modes.h /usr/src/debug/strace/7.2/src/xlat/btrfs_send_flags.h /usr/src/debug/strace/7.2/tests/poke-sendfile.c /usr/src/debug/strace/7.2/src/xlat/btrfs_scrub_flags.h /usr/src/debug/strace/7.2/src/xlat/uring_setup_flags.h /usr/src/debug/s
 trace/7.2/tests/execve.c /usr/src/debug/strace/7.2/tests/utime.c /usr/src/debug/strace/7.2/tests/ioctl_kvm_run_common.c /usr/src/debug/strace/7.2/tests/seccomp-strict.c /usr/src/debug/strace/7.2/src/xlat/genl_ethtool_msg_recv.h /usr/src/debug/strace/7.2/src/xlat/genl_ethtool_msg_send.h /usr/src/debug/strace/7.2/src/xmalloc.c /usr/src/debug/strace/7.2/tests/tcp_ao.c /usr/src/debug/strace/7.2/src/xmalloc.h /usr/src/debug/strace/7.2/tests/time_enjoyment.h /usr/src/debug/strace/7.2/tests/nlattr_ifla_linkinfo.c /usr/src/debug/strace/7.2/tests/msg_control.c /usr/src/debug/strace/7.2/src/xlat/audit_arch.h /usr/src/debug/strace/7.2/tests/nlattr_ifla_protinfo.c /usr/src/debug/strace/7.2/src/msghdr.h /usr/src/debug/strace/7.2/src/msghdr.c /usr/src/debug/strace/7.2/src/xlat/seccomp_ioctl_notif_flags.h /usr/src/debug/strace/7.2/src/xlat/nl_crypto_types.h /usr/src/debug/strace/7.2/src/kd_mpers_ioctl.c /usr/src/debug/strace/7.2/tests/setrlimit.c /usr/src/debug/strace/7.2/src/ubi.c /usr/src/debug/
 strace/7.2/tests/get_page_size.c /usr/src/debug/strace/7.2/tests/secontext.h /usr/src/debug/strace/7.2/src/xlat/uffd_poison_mode_flags.h /usr/src/debug/strace/7.2/tests/faccessat--secontext.c /usr/src/debug/strace/7.2/src/filter_seccomp.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_port_attrs.h /usr/src/debug/strace/7.2/tests/access.c /usr/src/debug/strace/7.2/src/filter_seccomp.h /usr/src/debug/strace/7.2/tests/setugid.c /usr/src/debug/strace/7.2/src/time.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_vf_vlan_list_attrs.h /usr/src/debug/strace/7.2/src/readlink.c /usr/src/debug/strace/7.2/src/xlat/v4l2_tuner_audmodes.h /usr/src/debug/strace/7.2/src/xlat/sock_netlink_options.h /usr/src/debug/strace/7.2/src/xlat/keyctl_caps0.h /usr/src/debug/strace/7.2/src/xlat/keyctl_caps1.h /usr/src/debug/strace/7.2/src/xlat/msgctl_flags.h /usr/src/debug/strace/7.2/src/xlat/rtc_vl_flags.h /usr/src/debug/strace/7.2/src/xlat/semctl_flags.h /usr/src/debug/strace/7.2/src/xlat/shmctl_flags.h /usr/src/de
 bug/strace/7.2/src/xlat/sigill_codes.h /usr/src/debug/strace/7.2/src/io_uring.c /usr/src/debug/strace/7.2/src/xlat/genl_ctrl_attr_policy.h /usr/src/debug/strace/7.2/tests/mq.c /usr/src/debug/strace/7.2/tests/getxattrat.c /usr/src/debug/strace/7.2/src/xlat/ieee802154_pan_ids.h /usr/src/debug/strace/7.2/src/xlat/btrfs_dev_stats_flags.h /usr/src/debug/strace/7.2/src/negated_errno.h /usr/src/debug/strace/7.2/src/alarm.c /usr/src/debug/strace/7.2/tests/request_key.c /usr/src/debug/strace/7.2/tests/qual_inject-error-signal.c /usr/src/debug/strace/7.2/tests/io_uring_register.c /usr/src/debug/strace/7.2/tests/open_tree.c /usr/src/debug/strace/7.2/tests/sched_get_priority_mxx.c /usr/src/debug/strace/7.2/src/print_syscall_number.c /usr/src/debug/strace/7.2/src/xlat/nlmsgerr_attrs.h /usr/src/debug/strace/7.2/tests/fstatat64.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_info_data_tun_attrs.h /usr/src/debug/strace/7.2/tests/fstatfs64.c /usr/src/debug/strace/7.2/tests/pidfd_open.c /usr/src/debug
 /strace/7.2/src/xlat/uring_query_ops.h /usr/src/debug/strace/7.2/tests/prctl-cap-ambient.c /usr/src/debug/strace/7.2/src/xlat/move_pages_flags.h /usr/src/debug/strace/7.2/src/xlat/ebpf_size.h /usr/src/debug/strace/7.2/tests/redirect-fds.c /usr/src/debug/strace/7.2/src/rtnl_tc.c /usr/src/debug/strace/7.2/tests/prlimit64.c /usr/src/debug/strace/7.2/src/xlat/fsmagic.h /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_af_spec_inet_attrs.h /usr/src/debug/strace/7.2/src/xlat/pr_ppc_dexcr_aspects.h /usr/src/debug/strace/7.2/src/xlat/tcxonc_options.h /usr/src/debug/strace/7.2/tests/clone3-report-ns-id.c /usr/src/debug/strace/7.2/tests/stack-fcall-2.c /usr/src/debug/strace/7.2/tests/ioctl_epoll.c /usr/src/debug/strace/7.2/tests/epoll_create1.c /usr/src/debug/strace/7.2/src/kernel_timex.h /usr/src/debug/strace/7.2/src/xlat/btrfs_features_compat.h /usr/src/debug/strace/7.2/src/move_mount.c /usr/src/debug/strace/7.2/tests/inject-nf.c /usr/src/debug/strace/7.2/src/xlat/nf_queue_msg_types.h /usr/src/d
 ebug/strace/7.2/src/xlat/smc_diag_extended_flags.h /usr/src/debug/strace/7.2/src/kd_ioctl.c /usr/src/debug/strace/7.2/src/xlat/v4l2_pix_fmts.h /usr/src/debug/strace/7.2/tests/unlinkat.c /usr/src/debug/strace/7.2/src/xlat/bluetooth_l2_cid.h /usr/src/debug/strace/7.2/tests/openat.c /usr/src/debug/strace/7.2/tests/zeroargc.c /usr/src/debug/strace/7.2/tests/net-tpacket_req.c /usr/src/debug/strace/7.2/src/xlat/inet_devconf_indices.h /usr/src/debug/strace/7.2/src/xlat/ebpf_regs.h /usr/src/debug/strace/7.2/src/xlat/falloc_flags.h /usr/src/debug/strace/7.2/src/xlat/fs_ioc_flags.h /usr/src/debug/strace/7.2/src/xlat/ptrace_syscall_info_op.h /usr/src/debug/strace/7.2/tests/tests.h /usr/src/debug/strace/7.2/tests/umovestr_cached_adjacent.c /usr/src/debug/strace/7.2/src/xlat/multicast_router_types.h /usr/src/debug/strace/7.2/src/xlat/inet_diag_attrs.h /usr/src/debug/strace/7.2/src/xlat/unix_diag_attrs.h /usr/src/debug/strace/7.2/tests/print_fields.c /usr/src/debug/strace/7.2/src/lseek.c /usr/src
 /debug/strace/7.2/src/xlat/netlink_protocols.h /usr/src/debug/strace/7.2/tests/ioctl_sock.c /usr/src/debug/strace/7.2/src/rseq.c /usr/src/debug/strace/7.2/src/xlat/hw_breakpoint_len.h /usr/src/debug/strace/7.2/tests/landlock_add_rule.c /usr/src/debug/strace/7.2/src/xlat/rtnl_mdba_mdb_eattr_attrs.h /usr/src/debug/strace/7.2/src/xlat/fan_event_flags.h /usr/src/debug/strace/7.2/src/xlat/rtnl_mdba_mdb_entry_attrs.h /usr/src/debug/strace/7.2/src/xlat/v4l2_control_ids.h /usr/src/debug/strace/7.2/tests/getpid.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ip6mra_msg_types.h /usr/src/debug/strace/7.2/src/xlat/netlink_diag_show.h /usr/src/debug/strace/7.2/tests/fanotify_mark.c /usr/src/debug/strace/7.2/src/xlat/uring_register_rsrc_flags.h /usr/src/debug/strace/7.2/src/xlat/tls_info_ciphers.h /usr/src/debug/strace/7.2/tests/xgetdents.c /usr/src/debug/strace/7.2/src/xlat/setns_types.h /usr/src/debug/strace/7.2/tests/umovestr2.c /usr/src/debug/strace/7.2/tests/modify_ldt.c /usr/src/debug/strace/7.2/
 src/xlat/prctl_options.h /usr/src/debug/strace/7.2/src/xlat/wait4_options.h /usr/src/debug/strace/7.2/tests/lsm_get_self_attr.c /usr/src/debug/strace/7.2/tests/lsm_set_self_attr.c /usr/src/debug/strace/7.2/src/fetch_struct_mmsghdr.c /usr/src/debug/strace/7.2/src/term.c /usr/src/debug/strace/7.2/src/xlat/ifstats_attrs.h /usr/src/debug/strace/7.2/src/xlat/hw_breakpoint_type.h /usr/src/debug/strace/7.2/src/xlat/v4l2_fields.h /usr/src/debug/strace/7.2/src/print_time.c /usr/src/debug/strace/7.2/src/xlat/btrfs_dev_stats_values.h /usr/src/debug/strace/7.2/tests/int_0x80.c /usr/src/debug/strace/7.2/tests/ioctl_kvm_run_auxstr_vcpu.c /usr/src/debug/strace/7.2/src/print_kernel_version.c /usr/src/debug/strace/7.2/src/xlat/v4l2_std_ids.h /usr/src/debug/strace/7.2/tests/net-accept-connect.c /usr/src/debug/strace/7.2/tests/semtimedop-ipc.c /usr/src/debug/strace/7.2/tests/link.c /usr/src/debug/strace/7.2/src/sysinfo.c /usr/src/debug/strace/7.2/tests/openat2.c /usr/src/debug/strace/7.2/src/memfd_cre
 ate.c /usr/src/debug/strace/7.2/tests/test_nlattr.h /usr/src/debug/strace/7.2/src/retval.c /usr/src/debug/strace/7.2/src/retval.h /usr/src/debug/strace/7.2/tests/fflush.c /usr/src/debug/strace/7.2/tests/process_madvise.c /usr/src/debug/strace/7.2/tests/fork-f.c /usr/src/debug/strace/7.2/tests/socketcall.c /usr/src/debug/strace/7.2/src/xlat/ipc_private.h /usr/src/debug/strace/7.2/src/xlat/perf_hw_id.h /usr/src/debug/strace/7.2/src/signalfd.c /usr/src/debug/strace/7.2/src/xlat/sock_shutdown_flags.h /usr/src/debug/strace/7.2/src/xlat/ifstats_attr_flags.h /usr/src/debug/strace/7.2/src/xlat/loop_crypt_type_options.h /usr/src/debug/strace/7.2/src/xlat/sock_raw_options.h /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_proto_down_reason_attrs.h /usr/src/debug/strace/7.2/src/xlat/skf_ad.h /usr/src/debug/strace/7.2/tests/mlock.c /usr/src/debug/strace/7.2/src/xlat/ifstats_xstats_bond_3ad_attrs.h /usr/src/debug/strace/7.2/src/xlat/seccomp_filter_flags.h /usr/src/debug/strace/7.2/tests/sync.c /usr/
 src/debug/strace/7.2/tests/bpf.c /usr/src/debug/strace/7.2/src/xlat/ptp_perout_flags.h /usr/src/debug/strace/7.2/tests/looping_threads.c /usr/src/debug/strace/7.2/src/xlat/sa_handler_values.h /usr/src/debug/strace/7.2/tests/mincore.c /usr/src/debug/strace/7.2/src/xlat/term_oflags_crdly.h /usr/src/debug/strace/7.2/src/xlat/term_oflags.h /usr/src/debug/strace/7.2/tests/status.c /usr/src/debug/strace/7.2/src/xlat/lbmd_pi_cap_flags.h /usr/src/debug/strace/7.2/tests/execve--secontext.c /usr/src/debug/strace/7.2/tests/sockopt-sol_netlink.c /usr/src/debug/strace/7.2/tests/nlattr_nlmsgerr.c /usr/src/debug/strace/7.2/src/xlat/pr_mce_kill_policy.h /usr/src/debug/strace/7.2/src/sys_func.h /usr/src/debug/strace/7.2/src/xlat/sock_tls_options.h /usr/src/debug/strace/7.2/src/xlat/ns_type.h /usr/src/debug/strace/7.2/src/xlat/quota_formats.h /usr/src/debug/strace/7.2/tests/xstatfsx.c /usr/src/debug/strace/7.2/src/util.c /usr/src/debug/strace/7.2/src/xlat/uring_sqe_flags.h /usr/src/debug/strace/7.2/s
 rc/xlat/bpf_miscop.h /usr/src/debug/strace/7.2/src/xlat/rtnl_link_attrs.h /usr/src/debug/strace/7.2/tests/ioctl_udmabuf.c /usr/src/debug/strace/7.2/src/xlat/bpf_link_create_kprobe_multi_flags.h /usr/src/debug/strace/7.2/src/xlat/bpf_link_create_uprobe_multi_flags.h /usr/src/debug/strace/7.2/tests/waitpid.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_vf_port_attrs.h /usr/src/debug/strace/7.2/src/xlat/netlink_ack_flags.h /usr/src/debug/strace/7.2/src/xlat/netlink_get_flags.h /usr/src/debug/strace/7.2/src/xlat/netlink_new_flags.h /usr/src/debug/strace/7.2/src/xattr.c /usr/src/debug/strace/7.2/src/ipc_msgctl.c /usr/src/debug/strace/7.2/src/ipc_semctl.c /usr/src/debug/strace/7.2/src/ipc_shmctl.c /usr/src/debug/strace/7.2/src/clone.c /usr/src/debug/strace/7.2/tests/chmod--secontext.c /usr/src/debug/strace/7.2/src/xlat/sock_irda_options.h /usr/src/debug/strace/7.2/tests/signal_receive.c /usr/src/debug/strace/7.2/src/xlat/genl_ctrl_attr.h /usr/src/debug/strace/7.2/src/xlat/rtc_backup_switc
 h_modes.h /usr/src/debug/strace/7.2/tests/xetpriority.c /usr/src/debug/strace/7.2/tests/keyctl.c /usr/src/debug/strace/7.2/src/dirent.c /usr/src/debug/strace/7.2/tests/readdir.c /usr/src/debug/strace/7.2/tests/faccessat-y--secontext.c /usr/src/debug/strace/7.2/tests/recvmsg.c /usr/src/debug/strace/7.2/src/xlat/tee_ioctl_shm_flags.h /usr/src/debug/strace/7.2/tests/xettimeofday.c /usr/src/debug/strace/7.2/tests/ip_local_port_range.c /usr/src/debug/strace/7.2/src/xlat/ifstats_offload_attrs.h /usr/src/debug/strace/7.2/src/fetch_struct_statfs.c /usr/src/debug/strace/7.2/src/xlat/term_iflags.h /usr/src/debug/strace/7.2/tests/test_ucopy.c /usr/src/debug/strace/7.2/tests/recvmmsg-timeout.c /usr/src/debug/strace/7.2/src/ipc_msg.c /usr/src/debug/strace/7.2/tests/test_ucopy.h /usr/src/debug/strace/7.2/src/string_to_uint.c /usr/src/debug/strace/7.2/tests/nfnetlink_cthelper.c /usr/src/debug/strace/7.2/src/xlat/fsopen_flags.h /usr/src/debug/strace/7.2/tests/inode_of_sockfd.c /usr/src/debug/strace
 /7.2/src/string_to_uint.h /usr/src/debug/strace/7.2/tests/dev-pty-yy.c /usr/src/debug/strace/7.2/tests/osf_utimes.c /usr/src/debug/strace/7.2/tests/sendfile.c /usr/src/debug/strace/7.2/tests/setgid32.c /usr/src/debug/strace/7.2/tests/setuid32.c /usr/src/debug/strace/7.2/tests/migrate_pages.c /usr/src/debug/strace/7.2/tests/chdir.c /usr/src/debug/strace/7.2/tests/setfsgid32.c /usr/src/debug/strace/7.2/tests/setfsuid32.c /usr/src/debug/strace/7.2/tests/setregid32.c /usr/src/debug/strace/7.2/tests/netlink_inet_diag.c /usr/src/debug/strace/7.2/tests/setreuid32.c /usr/src/debug/strace/7.2/src/xlat/neighbor_cache_entry_flags.h /usr/src/debug/strace/7.2/tests/scm_rights.c /usr/src/debug/strace/7.2/src/strauss.c /usr/src/debug/strace/7.2/tests/clock_nanosleep.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_br_boolopt_flags.h /usr/src/debug/strace/7.2/tests/libmmsg.c /usr/src/debug/strace/7.2/src/strauss.h /usr/src/debug/strace/7.2/tests/symlinkat.c /usr/src/debug/strace/7.2/tests/set_sigbloc
 k.c /usr/src/debug/strace/7.2/src/xlat/sockopt_txrehash_vals.h /usr/src/debug/strace/7.2/tests/prctl-tsc.c /usr/src/debug/strace/7.2/tests/adjtimex.c /usr/src/debug/strace/7.2/src/xlat/bluetooth_l2_psm.h /usr/src/debug/strace/7.2/src/xlat/kd_modes.h /usr/src/debug/strace/7.2/tests/symlink.c /usr/src/debug/strace/7.2/src/xlat/nl_attr_type.h /usr/src/debug/strace/7.2/tests/sysinfo.c /usr/src/debug/strace/7.2/src/xlat/lirc_modes.h /usr/src/debug/strace/7.2/src/xlat/mpol_modes.h /usr/src/debug/strace/7.2/tests/ioctl_inotify.c /usr/src/debug/strace/7.2/tests/overflowuid.c /usr/src/debug/strace/7.2/tests/prctl-sme.c /usr/src/debug/strace/7.2/tests/prctl-sve.c /usr/src/debug/strace/7.2/src/xlat/mount_setattr_flags.h /usr/src/debug/strace/7.2/src/xlat/mptcp_subflow_flags.h /usr/src/debug/strace/7.2/src/exit.c /usr/src/debug/strace/7.2/src/wait.c /usr/src/debug/strace/7.2/tests/futex2_flags.h /usr/src/debug/strace/7.2/tests/faccessat.c /usr/src/debug/strace/7.2/tests/listns.c /usr/src/debug/
 strace/7.2/src/shutdown.c /usr/src/debug/strace/7.2/tests/delete_module.c /usr/src/debug/strace/7.2/src/xlat/crypto_nl_attrs.h /usr/src/debug/strace/7.2/tests/mbind.c /usr/src/debug/strace/7.2/src/xlat/inet6_devconf_indices.h /usr/src/debug/strace/7.2/tests/readlinkat.c /usr/src/debug/strace/7.2/src/xlat/genl_ioam6_cmd.h /usr/src/debug/strace/7.2/tests/seccomp_get_notif_sizes.c /usr/src/debug/strace/7.2/src/fetch_struct_stat64.c /usr/src/debug/strace/7.2/src/xlat/af_tipc_importance.h /usr/src/debug/strace/7.2/src/xlat/ifstats_xstats_bridge_attrs.h /usr/src/debug/strace/7.2/tests/fcntl64.c /usr/src/debug/strace/7.2/src/xlat/ebpf_op_alu.h /usr/src/debug/strace/7.2/tests/umode_t.c /usr/src/debug/strace/7.2/tests/umount2.c /usr/src/debug/strace/7.2/tests/setns-report-ns-id.c /usr/src/debug/strace/7.2/src/xlat/statx_masks.h /usr/src/debug/strace/7.2/src/xlat/v4l2_streaming_capabilities.h /usr/src/debug/strace/7.2/src/xlat/personality_types.h /usr/src/debug/strace/7.2/tests/ioctl.c /usr/s
 rc/debug/strace/7.2/src/xlat/seccomp_ops.h /usr/src/debug/strace/7.2/tests/rseq_slice_yield.c /usr/src/debug/strace/7.2/tests/netlink_crypto.c /usr/src/debug/strace/7.2/tests/nlattr_packet_diag_msg.c /usr/src/debug/strace/7.2/src/xlat/rtnl_addr_attrs.h /usr/src/debug/strace/7.2/src/xlat/v4l2_tuner_types.h /usr/src/debug/strace/7.2/src/xlat/get_mempolicy_flags.h /usr/src/debug/strace/7.2/tests/fchmod--secontext.c /usr/src/debug/strace/7.2/tests/sysctl.c /usr/src/debug/strace/7.2/tests/epoll_ctl.c /usr/src/debug/strace/7.2/src/xlat/nf_cttimeout_msg_types.h /usr/src/debug/strace/7.2/src/fchownat.c /usr/src/debug/strace/7.2/tests/xutimes.c /usr/src/debug/strace/7.2/src/xlat/inet6_if_flags.h /usr/src/debug/strace/7.2/tests/getdents.c /usr/src/debug/strace/7.2/tests/getgid32.c /usr/src/debug/strace/7.2/tests/getuid32.c /usr/src/debug/strace/7.2/src/print_instruction_pointer.c /usr/src/debug/strace/7.2/tests/nfnetlink_ctnetlink_exp.c /usr/src/debug/strace/7.2/src/stat.c /usr/src/debug/stra
 ce/7.2/src/xlat.c /usr/src/debug/strace/7.2/tests/hexquote_strndup.c /usr/src/debug/strace/7.2/src/stat.h /usr/src/debug/strace/7.2/src/xlat.h /usr/src/debug/strace/7.2/src/xlat/sock_ip_options.h /usr/src/debug/strace/7.2/src/error_prints.h /usr/src/debug/strace/7.2/src/error_prints.c /usr/src/debug/strace/7.2/tests/ioctl_ptp.c /usr/src/debug/strace/7.2/tests/readahead.c /usr/src/debug/strace/7.2/tests/fsopen.c /usr/src/debug/strace/7.2/src/xlat/uring_rw_attr_flags.h /usr/src/debug/strace/7.2/src/chdir.c /usr/src/debug/strace/7.2/tests/fcntl-common.c /usr/src/debug/strace/7.2/src/xlat/mtd_nandecc_options.h /usr/src/debug/strace/7.2/src/bpf_attr.h /usr/src/debug/strace/7.2/src/dm.c /usr/src/debug/strace/7.2/src/io.c /usr/src/debug/strace/7.2/src/mq.c /usr/src/debug/strace/7.2/tests/set_mempolicy.c /usr/src/debug/strace/7.2/src/netlink_inet_diag.c /usr/src/debug/strace/7.2/tests/semop-common.c /usr/src/debug/strace/7.2/src/xlat/mtd_type_options.h /usr/src/debug/strace/7.2/tests/ioctl_
 loop.c /usr/src/debug/strace/7.2/src/xlat/inet_diag_req_attrs.h /usr/src/debug/strace/7.2/tests/count_unknown.c /usr/src/debug/strace/7.2/src/xlat/kd_key_fn_key_vals.h /usr/src/debug/strace/7.2/tests/getgroups32.c /usr/src/debug/strace/7.2/src/xlat/nl_bridge_vlan_flags.h /usr/src/debug/strace/7.2/tests/inotify_init.c /usr/src/debug/strace/7.2/tests/prctl-no-args.c /usr/src/debug/strace/7.2/src/close_range.c /usr/src/debug/strace/7.2/tests/rename.c /usr/src/debug/strace/7.2/src/sync_file_range.c /usr/src/debug/strace/7.2/src/regset.c /usr/src/debug/strace/7.2/src/copy_file_range.c /usr/src/debug/strace/7.2/src/xlat/v4l2_tuner_rxsubchanses.h /usr/src/debug/strace/7.2/src/xlat/fdb_notify_flags.h /usr/src/debug/strace/7.2/tests/nlattr_tcamsg.c /usr/src/debug/strace/7.2/src/xlat/pr_tagged_addr_enable.h /usr/src/debug/strace/7.2/tests/add_key.c /usr/src/debug/strace/7.2/src/readahead.c /usr/src/debug/strace/7.2/src/sockaddr.c /usr/src/debug/strace/7.2/src/xlat/evdev_keycode.h /usr/src/deb
 ug/strace/7.2/tests/netlink_generic.c /usr/src/debug/strace/7.2/src/xlat/kd_default_led_flags.h /usr/src/debug/strace/7.2/src/xlat/rtnl_mdba_router_pattr_attrs.h /usr/src/debug/strace/7.2/src/xlat/uring_zcrx_ctrl_ops.h /usr/src/debug/strace/7.2/src/xlat/file_attr_flags.h /usr/src/debug/strace/7.2/src/desc.c /usr/src/debug/strace/7.2/src/xlat/rtc_params.h /usr/src/debug/strace/7.2/tests/lstat64.c /usr/src/debug/strace/7.2/tests/recv-MSG_TRUNC.c /usr/src/debug/strace/7.2/src/xlat/bpf_query_flags.h /usr/src/debug/strace/7.2/src/xlat/ioprio_class.h /usr/src/debug/strace/7.2/src/xlat/key_spec.h /usr/src/debug/strace/7.2/tests/kernel_old_timex.h /usr/src/debug/strace/7.2/src/xlat/perf_sw_ids.h /usr/src/debug/strace/7.2/src/pidns.c /usr/src/debug/strace/7.2/src/watchdog_ioctl.c /usr/src/debug/strace/7.2/src/xlat/sigchld_codes.h /usr/src/debug/strace/7.2/tests/ioctl_lirc.c /usr/src/debug/strace/7.2/src/mpers_type.h /usr/src/debug/strace/7.2/tests/xet_robust_list.c /usr/src/debug/strace/7.2/
 src/xlat/snmp_ip_stats.h /usr/src/debug/strace/7.2/src/xlat/rtnl_tca_stats_attrs.h /usr/src/debug/strace/7.2/tests/ioctl_fs_0x15.c /usr/src/debug/strace/7.2/src/xlat/sock_udp_options.h /usr/src/debug/strace/7.2/tests/umoven-illptr.c /usr/src/debug/strace/7.2/src/xlat/statx_attrs.h /usr/src/debug/strace/7.2/tests/localtime.c /usr/src/debug/strace/7.2/tests/lock_file.c /usr/src/debug/strace/7.2/src/xlat/evdev_misc.h /usr/src/debug/strace/7.2/src/xlat/pr_set_vma.h /usr/src/debug/strace/7.2/tests/attach-p-cmd-cmd.c /usr/src/debug/strace/7.2/src/xlat/btrfs_features_compat_ro.h /usr/src/debug/strace/7.2/tests/ioctl_nsfs-ns_get_pid.c /usr/src/debug/strace/7.2/tests/nlattr_inet_diag_req_v2.c /usr/src/debug/strace/7.2/src/map_shadow_stack.c /usr/src/debug/strace/7.2/src/xlat/ubi_data_types.h /usr/src/debug/strace/7.2/tests/xet_thread_area_x86.c /usr/src/debug/strace/7.2/src/xlat/arp_hardware_types.h /usr/src/debug/strace/7.2/tests/fadvise64.c /usr/src/debug/strace/7.2/tests/pselect6-common.c
  /usr/src/debug/strace/7.2/tests/xgetrlimit.c /usr/src/debug/strace/7.2/src/xlat/blkpg_ops.h /usr/src/debug/strace/7.2/src/xlat/uring_ops.h /usr/src/debug/strace/7.2/tests/filter-unavailable.c /usr/src/debug/strace/7.2/src/xlat/membarrier_cmds.h /usr/src/debug/strace/7.2/tests/eventfd.c /usr/src/debug/strace/7.2/tests/net-yy-inet.c /usr/src/debug/strace/7.2/tests/ip_protocol.c /usr/src/debug/strace/7.2/tests/semtimedop-syscall.c /usr/src/debug/strace/7.2/tests/sxetmask.c /usr/src/debug/strace/7.2/src/xlat/addrfams.h /usr/src/debug/strace/7.2/tests/preadv.c /usr/src/debug/strace/7.2/tests/status-successful-threads.c /usr/src/debug/strace/7.2/tests/answer.c /usr/src/debug/strace/7.2/src/bjm.c /usr/src/debug/strace/7.2/src/kvm.c /usr/src/debug/strace/7.2/src/lsm.c /usr/src/debug/strace/7.2/src/mem.c /usr/src/debug/strace/7.2/src/aio.c /usr/src/debug/strace/7.2/tests/prctl-seccomp-strict.c /usr/src/debug/strace/7.2/src/btrfs.c /usr/src/debug/strace/7.2/src/xlat/btrfs_space_info_flags.h 
 /usr/src/debug/strace/7.2/src/xlat/btrfs_compress_types.h /usr/src/debug/strace/7.2/tests/ioctl_fiemap.c /usr/src/debug/strace/7.2/src/xlat/watchdog_ioctl_setoptions.h /usr/src/debug/strace/7.2/src/xlat/if_dqblk_valid.h /usr/src/debug/strace/7.2/tests/block_reset_raise_run.c /usr/src/debug/strace/7.2/src/native_printer_decls.h /usr/src/debug/strace/7.2/tests/open_tree_attr.c /usr/src/debug/strace/7.2/src/xlat/hci_channels.h /usr/src/debug/strace/7.2/tests/status-unfinished-threads.c /usr/src/debug/strace/7.2/tests/count-f.c /usr/src/debug/strace/7.2/src/secontext.h /usr/src/debug/strace/7.2/tests/sockopt-sol_socket.c /usr/src/debug/strace/7.2/src/xlat/pr_pac_enabled_keys.h /usr/src/debug/strace/7.2/src/xlat/kd_key_types.h /usr/src/debug/strace/7.2/src/xlat/resources.h /usr/src/debug/strace/7.2/tests/process_mrelease.c /usr/src/debug/strace/7.2/tests/sendfile64.c /usr/src/debug/strace/7.2/tests/get_process_reaper.c /usr/src/debug/strace/7.2/tests/quotactl-xfs.c /usr/src/debug/strace/
 7.2/tests/netlink_kobject_uevent.c /usr/src/debug/strace/7.2/src/xlat/rtnl_tca_root_attrs.h /usr/src/debug/strace/7.2/src/xlat/rtnl_tca_stab_attrs.h /usr/src/debug/strace/7.2/tests/semtimedop_time64.c /usr/src/debug/strace/7.2/src/xlat/at_statx_sync_types.h /usr/src/debug/strace/7.2/tests/unblock_reset_raise.c /usr/src/debug/strace/7.2/src/pidfd_open.c /usr/src/debug/strace/7.2/tests/getcpu.c /usr/src/debug/strace/7.2/tests/clock_xettime-common.c /usr/src/debug/strace/7.2/tests/nlattr_cachereport.c /usr/src/debug/strace/7.2/src/xlat/modetypes.h /usr/src/debug/strace/7.2/src/xlat/socktypes.h /usr/src/debug/strace/7.2/src/xlat/genl_tcp_metrics_cmd.h /usr/src/debug/strace/7.2/tests/getrusage.c /usr/src/debug/strace/7.2/src/rt_sigreturn.c /usr/src/debug/strace/7.2/src/xlat/uring_nop_flags.h /usr/src/debug/strace/7.2/src/xlat/pkey_access.h /usr/src/debug/strace/7.2/src/xlat/schedulers.h /usr/src/debug/strace/7.2/src/xlat/counter_ioctl_component_types.h /usr/src/debug/strace/7.2/src/xlat/
 term_oflags_tabdly.h /usr/src/debug/strace/7.2/tests/faccessat2.c /usr/src/debug/strace/7.2/tests/clock_t_str.c /usr/src/debug/strace/7.2/tests/prctl-capbset.c /usr/src/debug/strace/7.2/src/xlat/rtnl_tca_act_hw_stats.h /usr/src/debug/strace/7.2/src/ipc.c /usr/src/debug/strace/7.2/src/rtc.c /usr/src/debug/strace/7.2/tests/tkill.c /usr/src/debug/strace/7.2/tests/fdatasync.c /usr/src/debug/strace/7.2/src/tee.c /usr/src/debug/strace/7.2/src/rtnl_cachereport.c /usr/src/debug/strace/7.2/tests/ksysent.c /usr/src/debug/strace/7.2/tests/futimesat.c /usr/src/debug/strace/7.2/src/xlat/v4l2_control_query_flags.h /usr/src/debug/strace/7.2/src/syscall.h /usr/src/debug/strace/7.2/src/syscall.c /usr/src/debug/strace/7.2/tests/seccomp-filter-v.c /usr/src/debug/strace/7.2/tests/memfd_secret.c /usr/src/debug/strace/7.2/src/getcwd.c /usr/src/debug/strace/7.2/src/xlat/uffd_continue_mode_flags.h /usr/src/debug/strace/7.2/src/xlat/v4l2_buf_flags_ts_type.h /usr/src/debug/strace/7.2/src/xlat/fan_mark_flags.
 h /usr/src/debug/strace/7.2/src/signal.c /usr/src/debug/strace/7.2/src/xlat/nf_ctnetlink_exp_msg_types.h /usr/src/debug/strace/7.2/src/netlink_packet_diag.c /usr/src/debug/strace/7.2/tests/getgroups.c /usr/src/debug/strace/7.2/src/xlat/perf_event_read_format.h /usr/src/debug/strace/7.2/src/fs_x_ioctl.c /usr/src/debug/strace/7.2/tests/prctl-spec-inject.c /usr/src/debug/strace/7.2/src/xlat/tcp_ao_keyf_flags.h /usr/src/debug/strace/7.2/src/xlat/memfd_create_flags.h /usr/src/debug/strace/7.2/tests/wait4.c /usr/src/debug/strace/7.2/src/xlat/kexec_load_flags.h /usr/src/debug/strace/7.2/tests/stack-fcall-0.c /usr/src/debug/strace/7.2/src/xlat/evdev_snd.h /usr/src/debug/strace/7.2/tests/rt_tgsigqueueinfo.c /usr/src/debug/strace/7.2/tests/sockopt-timestamp.c /usr/src/debug/strace/7.2/src/xlat/fsconfig_cmds.h /usr/src/debug/strace/7.2/src/xlat/btrfs_balance_ctl_cmds.h /usr/src/debug/strace/7.2/src/xlat/mpol_mode_flags.h /usr/src/debug/strace/7.2/src/xlat/open_mode_flags.h /usr/src/debug/strac
 e/7.2/tests/kill.c /usr/src/debug/strace/7.2/src/xlat/if_dqinfo_valid.h /usr/src/debug/strace/7.2/src/xlat/pr_riscv_v_inherit.h /usr/src/debug/strace/7.2/tests/nfnetlink_acct.c /usr/src/debug/strace/7.2/src/xlat/pr_sched_core_pidtypes.h /usr/src/debug/strace/7.2/src/set_tid_address.c /usr/src/debug/strace/7.2/src/xlat/cap.h /usr/src/debug/strace/7.2/tests/umount.c /usr/src/debug/strace/7.2/tests/prctl-fp-mode.c /usr/src/debug/strace/7.2/tests/uname.c /usr/src/debug/strace/7.2/src/xlat/btrfs_logical_ino_args_flags.h /usr/src/debug/strace/7.2/src/fstatfs.c /usr/src/debug/strace/7.2/src/statfs64.c /usr/src/debug/strace/7.2/src/xlat/uring_restriction_opcodes.h /usr/src/debug/strace/7.2/src/xlat/personality_flags.h /usr/src/debug/strace/7.2/tests/test_printstrn.c /usr/src/debug/strace/7.2/tests/net-y-unix.c /usr/src/debug/strace/7.2/src/xlat/sigev_value.h /usr/src/debug/strace/7.2/tests/personality.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ip6mra_creport_attr.h /usr/src/debug/strace/7.2/
 tests/fill_memory.c /usr/src/debug/strace/7.2/tests/get_mempolicy.c /usr/src/debug/strace/7.2/tests/fadvise64_64.c /usr/src/debug/strace/7.2/tests/setxattrat.c /usr/src/debug/strace/7.2/tests/pkey_alloc.c /usr/src/debug/strace/7.2/src/getcpu.c /usr/src/debug/strace/7.2/tests/sigsuspend.c /usr/src/debug/strace/7.2/src/xlat/sock_rds_options.h /usr/src/debug/strace/7.2/src/xlat/v4l2_format_description_flags.h /usr/src/debug/strace/7.2/src/xlat/sock_ipx_options.h /usr/src/debug/strace/7.2/tests/removexattrat.c /usr/src/debug/strace/7.2/tests/kexec_file_load.c /usr/src/debug/strace/7.2/tests/ioctl_sg_io_v3.c /usr/src/debug/strace/7.2/src/xlat/uring_socket_ops.h /usr/src/debug/strace/7.2/src/poke.c /usr/src/debug/strace/7.2/src/delay.c /usr/src/debug/strace/7.2/tests/prctl-dumpable.c /usr/src/debug/strace/7.2/src/delay.h /usr/src/debug/strace/7.2/src/poke.h /usr/src/debug/strace/7.2/tests/trie_test.c /usr/src/debug/strace/7.2/src/print_timex.h /usr/src/debug/strace/7.2/src/xlat/key_perms.
 h /usr/src/debug/strace/7.2/src/xlat/term_line_discs.h /usr/src/debug/strace/7.2/src/xlat/inet_diag_extended_flags.h /usr/src/debug/strace/7.2/src/xlat/sock_pnp_options.h /usr/src/debug/strace/7.2/tests/tampering-notes.c /usr/src/debug/strace/7.2/tests/mseal.c /usr/src/debug/strace/7.2/tests/so_error.c /usr/src/debug/strace/7.2/tests/sockname.c /usr/src/debug/strace/7.2/src/xlat/sock_tcp_options.h /usr/src/debug/strace/7.2/src/xlat/uring_napi_ops.h /usr/src/debug/strace/7.2/src/fstatfs64.c /usr/src/debug/strace/7.2/src/xlat/statmount_mask.h /usr/src/debug/strace/7.2/tests/pipe.c /usr/src/debug/strace/7.2/src/xlat/name_to_handle_at_flags.h /usr/src/debug/strace/7.2/src/trace_event.h /usr/src/debug/strace/7.2/src/xlat/fan_classes.h /usr/src/debug/strace/7.2/src/xlat/tee_ioctl_login_types.h /usr/src/debug/strace/7.2/tests/perf_event_open_nonverbose.c /usr/src/debug/strace/7.2/src/xlat/ipccalls.h /usr/src/debug/strace/7.2/tests/pc.c /usr/src/debug/strace/7.2/tests/fspick.c /usr/src/debu
 g/strace/7.2/src/xlat/syslog_console_levels.h /usr/src/debug/strace/7.2/src/xlat/futex2_flags.h /usr/src/debug/strace/7.2/src/xlat/futex2_sizes.h /usr/src/debug/strace/7.2/src/xlat/compat_ptrace_cmds.h /usr/src/debug/strace/7.2/src/xlat/genl_ctrl_cmd.h /usr/src/debug/strace/7.2/src/statx.h /usr/src/debug/strace/7.2/src/xlat/ebpf_mode.h /usr/src/debug/strace/7.2/src/print_dev_t.c /usr/src/debug/strace/7.2/src/statx.c /usr/src/debug/strace/7.2/tests/semtimedop-common.c /usr/src/debug/strace/7.2/tests/dev-yy.c /usr/src/debug/strace/7.2/src/ioprio.c /usr/src/debug/strace/7.2/tests/getresgid32.c /usr/src/debug/strace/7.2/tests/getresuid32.c /usr/src/debug/strace/7.2/src/xlat/term_cflags_csize.h /usr/src/debug/strace/7.2/tests/sched_xetaffinity.c /usr/src/debug/strace/7.2/src/xlat/ifstats_af_spec_mpls_attrs.h /usr/src/debug/strace/7.2/tests/nlattr_ndtmsg.c /usr/src/debug/strace/7.2/src/xlat/evdev_relative_axes.h /usr/src/debug/strace/7.2/src/xlat/ubi_volume_props.h /usr/src/debug/strace/7
 .2/tests/nlattr_inet_diag_req_compat.c /usr/src/debug/strace/7.2/tests/oldselect-efault.c /usr/src/debug/strace/7.2/tests/gettid.c /usr/src/debug/strace/7.2/tests/s390_runtime_instr.c /usr/src/debug/strace/7.2/src/kernel_timeval.h /usr/src/debug/strace/7.2/tests/ioctl_perf.c /usr/src/debug/strace/7.2/src/xlat/genl_seg6_cmd.h /usr/src/debug/strace/7.2/src/xlat/usagewho.h /usr/src/debug/strace/7.2/tests/mq_sendrecv.c /usr/src/debug/strace/7.2/tests/fadvise.h /usr/src/debug/strace/7.2/tests/nlattr_inet_diag_msg.c /usr/src/debug/strace/7.2/tests/iopl.c /usr/src/debug/strace/7.2/src/mmap_notify.h /usr/src/debug/strace/7.2/src/xlat/pr_mdwe_flags.h /usr/src/debug/strace/7.2/src/xlat/pr_riscv_icache_flush_scopes.h /usr/src/debug/strace/7.2/src/chmod.c /usr/src/debug/strace/7.2/src/mmap_notify.c /usr/src/debug/strace/7.2/src/fs_f_ioctl.c /usr/src/debug/strace/7.2/tests/setresugid.c /usr/src/debug/strace/7.2/src/xlat/xdp_flags.h /usr/src/debug/strace/7.2/src/inotify_ioctl.c /usr/src/debug/str
 ace/7.2/src/xlat/ax25_protocols.h /usr/src/debug/strace/7.2/src/xlat/caif_protocols.h /usr/src/debug/strace/7.2/src/xlat/inet_protocols.h /usr/src/debug/strace/7.2/src/xlat/irda_protocols.h /usr/src/debug/strace/7.2/src/xlat/isdn_protocols.h /usr/src/debug/strace/7.2/src/xlat/kd_keymap_flags.h /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_xdp_attrs.h /usr/src/debug/strace/7.2/tests/netlink_selinux.c /usr/src/debug/strace/7.2/src/kcmp.c /usr/src/debug/strace/7.2/src/xlat/evdev_ff_status.h /usr/src/debug/strace/7.2/src/xlat/pidfd_info_mask.h /usr/src/debug/strace/7.2/tests/xselect.c /usr/src/debug/strace/7.2/tests/statfs64.c /usr/src/debug/strace/7.2/tests/strace-n.c /usr/src/debug/strace/7.2/tests/strace-x.c /usr/src/debug/strace/7.2/src/xlat/bsg_protocol.h /usr/src/debug/strace/7.2/src/xlat/timerfdflags.h /usr/src/debug/strace/7.2/src/xlat/inotify_init_flags.h /usr/src/debug/strace/7.2/tests/ipc_msgbuf.c /usr/src/debug/strace/7.2/tests/llseek.c /usr/src/debug/strace/7.2/tests/prctl-a
 rg2-intptr.c /usr/src/debug/strace/7.2/src/xlat/af_tipc_flags.h /usr/src/debug/strace/7.2/src/xlat/af_tipc_scope.h /usr/src/debug/strace/7.2/src/xlat/af_tipc_types.h /usr/src/debug/strace/7.2/src/xlat/kd_key_brl_keys.h /usr/src/debug/strace/7.2/tests/strace-k-z.c /usr/src/debug/strace/7.2/src/xlat/kd_key_cur_keys.h /usr/src/debug/strace/7.2/src/xlat/kd_key_pad_keys.h /usr/src/debug/strace/7.2/src/xlat/mq_attr_flags.h /usr/src/debug/strace/7.2/src/xlat/netlink_diag_attrs.h /usr/src/debug/strace/7.2/src/xlat/openat2_flags.h /usr/src/debug/strace/7.2/src/xlat/qipcrtr_nodes.h /usr/src/debug/strace/7.2/src/xlat/qipcrtr_ports.h /usr/src/debug/strace/7.2/src/xlat/rtnl_tca_root_flags.h /usr/src/debug/strace/7.2/tests/printpath-umovestr.c /usr/src/debug/strace/7.2/tests/riscv_flush_icache.c /usr/src/debug/strace/7.2/src/xlat/term_oflags_ffdly.h /usr/src/debug/strace/7.2/tests/ioctl_uffdio.c /usr/src/debug/strace/7.2/src/filter.h /usr/src/debug/strace/7.2/src/gpio_ioctl.c /usr/src/debug/strac
 e/7.2/tests/ioctl_dm.c /usr/src/debug/strace/7.2/tests/ioctl_kd.c /usr/src/debug/strace/7.2/tests/s390_pci_mmio_read_write.c /usr/src/debug/strace/7.2/src/xlat/bt_protocols.h /usr/src/debug/strace/7.2/src/stat64.c /usr/src/debug/strace/7.2/src/xlat/uring_zcrx_reg_flags.h /usr/src/debug/strace/7.2/src/resource.c /usr/src/debug/strace/7.2/src/xlat/kd_meta_vals.h /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_br_boolopts.h /usr/src/debug/strace/7.2/tests/ioctl_pidfd_namespace.c /usr/src/debug/strace/7.2/src/xlat/statmount_mnt_propagation.h /usr/src/debug/strace/7.2/src/rtnl_neightbl.c /usr/src/debug/strace/7.2/tests/ioctl_nsfs.c /usr/src/debug/strace/7.2/src/xlat/epollevents.h /usr/src/debug/strace/7.2/src/xlat/cap_version.h /usr/src/debug/strace/7.2/src/lirc_ioctl.c /usr/src/debug/strace/7.2/src/xlat/xattrat_flags.h /usr/src/debug/strace/7.2/tests/futex_waitv.c /usr/src/debug/strace/7.2/tests/vhangup.c /usr/src/debug/strace/7.2/tests/status-all.c /usr/src/debug/strace/7.2/tests/s390_sth
 yi.c /usr/src/debug/strace/7.2/tests/timer_xettime.c /usr/src/debug/strace/7.2/tests/pidfd_getfd.c /usr/src/debug/strace/7.2/tests/memfd_create.c /usr/src/debug/strace/7.2/src/fs_0x15_ioctl.c /usr/src/debug/strace/7.2/src/fs_0x94_ioctl.c /usr/src/debug/strace/7.2/tests/unlink.c /usr/src/debug/strace/7.2/tests/get_sigset_size.c /usr/src/debug/strace/7.2/src/bpf_seccomp_filter.c /usr/src/debug/strace/7.2/tests/seccomp_get_action_avail.c /usr/src/debug/strace/7.2/src/stage_output.c /usr/src/debug/strace/7.2/src/evdev_mpers.c /usr/src/debug/strace/7.2/src/printers.h /usr/src/debug/strace/7.2/tests/sleep-timing.c /usr/src/debug/strace/7.2/tests/listxattrat.c /usr/src/debug/strace/7.2/tests/nanosleep.c /usr/src/debug/strace/7.2/tests/lookup_dcookie.c /usr/src/debug/strace/7.2/tests/signal2name.c /usr/src/debug/strace/7.2/tests/scm_credentials.c /usr/src/debug/strace/7.2/tests/file_handle.c /usr/src/debug/strace/7.2/tests/lsm_list_modules.c /usr/src/debug/strace/7.2/tests/qual_fault.c /usr
 /src/debug/strace/7.2/tests/prctl-tagged-addr.c /usr/src/debug/strace/7.2/src/xlat/bpf_mode.h /usr/src/debug/strace/7.2/tests/list_sigaction_signum.c /usr/src/debug/strace/7.2/tests/prctl-ppc-dexcr.c /usr/src/debug/strace/7.2/src/netlink_kobject_uevent.c /usr/src/debug/strace/7.2/src/netlink_kobject_uevent.h /usr/src/debug/strace/7.2/tests/printstrn-umoven.c /usr/src/debug/strace/7.2/src/rtnl_addrlabel.c /usr/src/debug/strace/7.2/tests/prctl-pac-enabled-keys.c /usr/src/debug/strace/7.2/src/xlat/getsock_ipv6_options.h /usr/src/debug/strace/7.2/src/xlat/setsock_ipv6_options.h /usr/src/debug/strace/7.2/src/upoke.c /usr/src/debug/strace/7.2/tests/renameat2.c /usr/src/debug/strace/7.2/src/xlat/ptp_pin_funcs.h /usr/src/debug/strace/7.2/src/xlat/rtnl_mdb_attrs.h /usr/src/debug/strace/7.2/src/rtnl_mdb.c /usr/src/debug/strace/7.2/src/ustat.c /usr/src/debug/strace/7.2/tests/landlock_create_ruleset.c /usr/src/debug/strace/7.2/src/xlat/term_cmds_overlapping.h /usr/src/debug/strace/7.2/src/xlat/
 nf_ulog_msg_types.h /usr/src/debug/strace/7.2/tests/recvfrom-MSG_TRUNC.c /usr/src/debug/strace/7.2/src/xlat/btrfs_key_types.h /usr/src/debug/strace/7.2/tests/sleep.c /usr/src/debug/strace/7.2/src/xlat/tun_device_types.h /usr/src/debug/strace/7.2/src/xlat/udmabuf_flags.h /usr/src/debug/strace/7.2/tests/fchmodat.c /usr/src/debug/strace/7.2/tests/fchown32.c /usr/src/debug/strace/7.2/tests/fchownat.c /usr/src/debug/strace/7.2/tests/ioctl_watchdog.c /usr/src/debug/strace/7.2/src/xlat/ioprio_who.h /usr/src/debug/strace/7.2/src/perf_event_struct.h /usr/src/debug/strace/7.2/src/xlat/netlink_sk_meminfo_indices.h /usr/src/debug/strace/7.2/src/print_sg_req_info.c /usr/src/debug/strace/7.2/tests/run_expect_termsig.c /usr/src/debug/strace/7.2/tests/print_maxfd.c /usr/src/debug/strace/7.2/src/xlat/perf_hw_cache_op_id.h /usr/src/debug/strace/7.2/src/xlat/bpf_task_fd_type.h /usr/src/debug/strace/7.2/src/xlat/rtnl_rule_attrs.h /usr/src/debug/strace/7.2/src/xlat/listmount_mnt_id.h /usr/src/debug/stra
 ce/7.2/tests/block_reset_run.c /usr/src/debug/strace/7.2/src/xlat/mount_attr_propagation.h /usr/src/debug/strace/7.2/src/xlat/perf_hw_cache_op_result_id.h /usr/src/debug/strace/7.2/src/xlat/rtnl_neigh_fdb_ext_attrs.h /usr/src/debug/strace/7.2/src/truncate.c /usr/src/debug/strace/7.2/tests/status-successful.c /usr/src/debug/strace/7.2/src/xlat/uffd_zeropage_flags.h /usr/src/debug/strace/7.2/src/xlat/mmap_prot.h /usr/src/debug/strace/7.2/src/xlat/pr_mce_kill.h /usr/src/debug/strace/7.2/src/xgetdents.c /usr/src/debug/strace/7.2/src/xlat/bpf_link_create_netfilter_flags.h /usr/src/debug/strace/7.2/src/block.c /usr/src/debug/strace/7.2/src/flock.c /usr/src/debug/strace/7.2/src/xgetdents.h /usr/src/debug/strace/7.2/src/futex2.c /usr/src/debug/strace/7.2/src/xlat/landlock_ruleset_access_net.h /usr/src/debug/strace/7.2/src/xlat/tls_info_configs.h /usr/src/debug/strace/7.2/tests/file_xetattr-common.c /usr/src/debug/strace/7.2/src/print_msgbuf.c /usr/src/debug/strace/7.2/src/xlat/mdb_states.h 
 /usr/src/debug/strace/7.2/src/xlat/smc_states.h /usr/src/debug/strace/7.2/src/xlat/tcp_states.h /usr/src/debug/strace/7.2/src/fanotify.c /usr/src/debug/strace/7.2/tests/attach-p-cmd-p.c /usr/src/debug/strace/7.2/src/xlat/btrfs_dev_replace_results.h /usr/src/debug/strace/7.2/tests/ioctl_perf-success.c /usr/src/debug/strace/7.2/tests/clock_adjtime-common.c /usr/src/debug/strace/7.2/src/xlat/evdev_leds.h /usr/src/debug/strace/7.2/src/xlat/pr_dumpable.h /usr/src/debug/strace/7.2/tests/alarm.c /usr/src/debug/strace/7.2/tests/perf_event_open.c /usr/src/debug/strace/7.2/src/xlat/lwtunnel_encap_types.h /usr/src/debug/strace/7.2/src/listmount.c /usr/src/debug/strace/7.2/src/xlat/dirent_types.h /usr/src/debug/strace/7.2/src/xlat/sigact_flags.h /usr/src/debug/strace/7.2/src/xlat/umount_flags.h /usr/src/debug/strace/7.2/src/xlat/v4l2_input_status_flags.h /usr/src/debug/strace/7.2/src/xlat/nf_tables_msg_types.h /usr/src/debug/strace/7.2/src/xlat/uffd_api_features.h /usr/src/debug/strace/7.2/src/
 xlat/smc_diag_mode.h /usr/src/debug/strace/7.2/src/xlat/clockflags.h /usr/src/debug/strace/7.2/src/xlat/epollflags.h /usr/src/debug/strace/7.2/src/xlat/mmap_flags.h /usr/src/debug/strace/7.2/src/xlat/rseq_flags.h /usr/src/debug/strace/7.2/src/xlat/swap_flags.h /usr/src/debug/strace/7.2/src/xlat/uffd_flags.h /usr/src/debug/strace/7.2/src/xlat/xattrflags.h /usr/src/debug/strace/7.2/src/xlat/ip_type_of_services.h /usr/src/debug/strace/7.2/tests/sched_xetscheduler.c /usr/src/debug/strace/7.2/src/xlat/ifstats_xstats_bond_attrs.h /usr/src/debug/strace/7.2/src/xlat/ifstats_xstats_type_attrs.h /usr/src/debug/strace/7.2/src/xlat/clone3_flags.h /usr/src/debug/strace/7.2/src/hostname.c /usr/src/debug/strace/7.2/src/xlat/ebpf_class.h /usr/src/debug/strace/7.2/tests/at_fdcwd-pathmax.c /usr/src/debug/strace/7.2/src/xlat/bpf_src.h /usr/src/debug/strace/7.2/tests/flock.c /usr/src/debug/strace/7.2/tests/ioctl_nsfs-ns_mnt_get.c /usr/src/debug/strace/7.2/tests/utimensat.c /usr/src/debug/strace/7.2/tes
 ts/nfnetlink_osf.c /usr/src/debug/strace/7.2/src/xlat/loop_flags_options.h /usr/src/debug/strace/7.2/tests/nlattr_ifstats.c /usr/src/debug/strace/7.2/tests/clone_ptrace.c /usr/src/debug/strace/7.2/tests/print_user_desc.c /usr/src/debug/strace/7.2/src/uname.c /usr/src/debug/strace/7.2/src/xlat/module_init_flags.h /usr/src/debug/strace/7.2/tests/stack-fcall.c /usr/src/debug/strace/7.2/src/xlat/smc_diag_attrs.h /usr/src/debug/strace/7.2/src/xlat/routing_scopes.h /usr/src/debug/strace/7.2/tests/stack-fcall.h /usr/src/debug/strace/7.2/tests/times-fail.c /usr/src/debug/strace/7.2/src/xlat/btrfs_balance_args.h /usr/src/debug/strace/7.2/src/xlat/genl_taskstats_cmd.h /usr/src/debug/strace/7.2/tests/nlattr_nhmsg.c /usr/src/debug/strace/7.2/src/xlat/sigprof_codes.h /usr/src/debug/strace/7.2/src/rtnl_nh.c /usr/src/debug/strace/7.2/tests/filter_seccomp-perf.c /usr/src/debug/strace/7.2/src/xlat/alg_sockaddr_flags.h /usr/src/debug/strace/7.2/src/xlat/xdp_sockaddr_flags.h /usr/src/debug/strace/7.2/
 src/xlat/uring_clone_buffers_flags.h /usr/src/debug/strace/7.2/src/xlat/rtnl_nha_res_bucket_attrs.h /usr/src/debug/strace/7.2/src/xlat/ubi_volume_flags.h /usr/src/debug/strace/7.2/tests/ifindex.c /usr/src/debug/strace/7.2/tests/timerfd_xettime.c /usr/src/debug/strace/7.2/src/xlat/uring_fixed_fd_flags.h /usr/src/debug/strace/7.2/tests/count_unknown_mixed.c /usr/src/debug/strace/7.2/src/xlat/ethernet_protocols.h /usr/src/debug/strace/7.2/src/xlat/uring_register_opcode_flags.h /usr/src/debug/strace/7.2/src/ucopy.c /usr/src/debug/strace/7.2/tests/ioctl_tiocm.c /usr/src/debug/strace/7.2/tests/netlink_unix_diag.c /usr/src/debug/strace/7.2/tests/nfnetlink_ipset.c /usr/src/debug/strace/7.2/tests/msg_name.c /usr/src/debug/strace/7.2/tests/nfnetlink_queue.c /usr/src/debug/strace/7.2/tests/status-none-f.c /usr/src/debug/strace/7.2/tests/netlink_xfrm.c /usr/src/debug/strace/7.2/src/sched.c /usr/src/debug/strace/7.2/src/xlat/kvm_exit_reason.h /usr/src/debug/strace/7.2/tests/pidfd_send_signal.c /
 usr/src/debug/strace/7.2/src/xlat/perf_ioctl_flags.h /usr/src/debug/strace/7.2/src/xlat/sigpoll_codes.h /usr/src/debug/strace/7.2/src/xlat/keyctl_commands.h /usr/src/debug/strace/7.2/src/xlat/uffd_writeprotect_mode_flags.h /usr/src/debug/strace/7.2/src/fetch_struct_msghdr.c /usr/src/debug/strace/7.2/tests/rt_sigreturn.c /usr/src/debug/strace/7.2/tests/oldstat.c /usr/src/debug/strace/7.2/tests/scm_pidfd.c /usr/src/debug/strace/7.2/src/kernel_types.h /usr/src/debug/strace/7.2/src/xlat/ioctl_dirs.h /usr/src/debug/strace/7.2/src/xlat/inet_diag_ulp_info_tls_attrs.h /usr/src/debug/strace/7.2/tests/getdents64.c /usr/src/debug/strace/7.2/src/xlat/mlockall_flags.h /usr/src/debug/strace/7.2/tests/printpath-umovestr-peekdata.c /usr/src/debug/strace/7.2/tests/nlattr_br_port_msg.c /usr/src/debug/strace/7.2/src/xlat/bpf_file_mode_flags.h /usr/src/debug/strace/7.2/tests/setgroups.c /usr/src/debug/strace/7.2/tests/nlattr_unix_diag_msg.c /usr/src/debug/strace/7.2/src/xstring.h /usr/src/debug/strace/
 7.2/tests/ioctl_termios.c /usr/src/debug/strace/7.2/src/xlat/futexwakecmps.h /usr/src/debug/strace/7.2/src/xlat/evdev_switch.h /usr/src/debug/strace/7.2/tests/xstatx.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ipmra_creport_attr.h /usr/src/debug/strace/7.2/src/xlat/clocknames.h /usr/src/debug/strace/7.2/tests/netlink_sock_diag.c /usr/src/debug/strace/7.2/src/xlat/bpf_test_run_flags.h /usr/src/debug/strace/7.2/src/xlat/shm_resource_flags.h /usr/src/debug/strace/7.2/tests/sched_yield.c /usr/src/debug/strace/7.2/src/xlat/kexec_arch_values.h /usr/src/debug/strace/7.2/tests/threads-execve.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_bridge_flags.h /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_bridge_modes.h /usr/src/debug/strace/7.2/src/xlat/madvise_hppa_generic_cmds.h /usr/src/debug/strace/7.2/src/fadvise.c /usr/src/debug/strace/7.2/tests/sprintrc.c /usr/src/debug/strace/7.2/src/pidfd_getfd.c /usr/src/debug/strace/7.2/src/xlat/uring_op_flags.h /usr/src/debug/strace/7.2/src/pathtrace.c /u
 sr/src/debug/strace/7.2/tests/clone3.c /usr/src/debug/strace/7.2/src/print_sigevent.c /usr/src/debug/strace/7.2/src/xlat/smc_link_group_roles.h /usr/src/debug/strace/7.2/src/sendfile.c /usr/src/debug/strace/7.2/src/xlat/can_protocols.h /usr/src/debug/strace/7.2/src/xlat/kcm_protocols.h /usr/src/debug/strace/7.2/src/xlat/nfc_protocols.h /usr/src/debug/strace/7.2/src/xlat/smc_protocols.h /usr/src/debug/strace/7.2/tests/sigprocmask.c /usr/src/debug/strace/7.2/tests/prctl-securebits.c /usr/src/debug/strace/7.2/tests/kern_features.c /usr/src/debug/strace/7.2/src/counter_ioctl.c /usr/src/debug/strace/7.2/src/xlat/nl_netfilter_subsys_ids.h /usr/src/debug/strace/7.2/tests/getrandom.c /usr/src/debug/strace/7.2/src/userfaultfd.c /usr/src/debug/strace/7.2/src/xlat/pidfd_coredump_mask.h /usr/src/debug/strace/7.2/tests/qual_signal.c /usr/src/debug/strace/7.2/src/xlat/rtnl_mdba_router_attrs.h /usr/src/debug/strace/7.2/src/iovec.h /usr/src/debug/strace/7.2/src/xlat/madvise_cmds.h /usr/src/debug/st
 race/7.2/src/seccomp.c /usr/src/debug/strace/7.2/src/xlat/inet_diag_bytecodes.h /usr/src/debug/strace/7.2/src/xlat/nl_policy_type_attr.h /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_vf_link_states.h /usr/src/debug/strace/7.2/src/getpid.c /usr/src/debug/strace/7.2/src/xlat/resource_flags.h /usr/src/debug/strace/7.2/tests/io_uring_setup.c /usr/src/debug/strace/7.2/src/xlat/uring_zcrx_area_flags.h /usr/src/debug/strace/7.2/src/xlat/lbmd_pi_csum_types.h /usr/src/debug/strace/7.2/src/xlat/fspick_flags.h /usr/src/debug/strace/7.2/src/xlat/routing_flags.h /usr/src/debug/strace/7.2/src/xlat/routing_types.h /usr/src/debug/strace/7.2/src/netlink_nlctrl.c /usr/src/debug/strace/7.2/tests/net-sockaddr.c /usr/src/debug/strace/7.2/src/sigreturn.c /usr/src/debug/strace/7.2/src/xlat/kexec_file_load_flags.h /usr/src/debug/strace/7.2/src/xlat/bpf_map_flags.h /usr/src/debug/strace/7.2/src/xlat/bpf_map_types.h /usr/src/debug/strace/7.2/src/xlat/open_access_modes.h /usr/src/debug/strace/7.2/src/xlat/sigt
 rap_codes.h /usr/src/debug/strace/7.2/src/xlat/rtnl_route_attrs.h /usr/src/debug/strace/7.2/tests/test_printpath.c /usr/src/debug/strace/7.2/src/xlat/rtnl_neigh_attrs.h /usr/src/debug/strace/7.2/tests/kernel_version.c /usr/src/debug/strace/7.2/src/xlat/bpf_attach_type.h /usr/src/debug/strace/7.2/src/xlat/fs_shutdown_flags.h /usr/src/debug/strace/7.2/tests/prctl_marker.c /usr/src/debug/strace/7.2/src/xlat/gpio_v2_line_flags.h /usr/src/debug/strace/7.2/src/xlat/btrfs_dev_replace_state.h /usr/src/debug/strace/7.2/src/xlat/fsmount_attr_flags.h /usr/src/debug/strace/7.2/src/xlat/cap_mask0.h /usr/src/debug/strace/7.2/src/xlat/uring_setup_features.h /usr/src/debug/strace/7.2/src/xlat/uffd_copy_flags.h /usr/src/debug/strace/7.2/src/xlat/v4l2_buf_flags_ts_src.h /usr/src/debug/strace/7.2/src/xlat/bpf_op_alu.h /usr/src/debug/strace/7.2/src/xlat/genl_thermal_cmd.h /usr/src/debug/strace/7.2/src/xlat/nfc_sockaddr_protocols.h /usr/src/debug/strace/7.2/tests/umovestr-illptr.c /usr/src/debug/strace/
 7.2/src/syscall_name.c /usr/src/debug/strace/7.2/src/xlat/pr_cap_ambient.h /usr/src/debug/strace/7.2/src/xlat/perf_attr_size.h /usr/src/debug/strace/7.2/tests/prctl-syscall-user-dispatch.c /usr/src/debug/strace/7.2/tests/tracer_ppid_pgid_sid.c /usr/src/debug/strace/7.2/src/random_ioctl.c /usr/src/debug/strace/7.2/src/times.c /usr/src/debug/strace/7.2/src/xlat/rtnl_nexthop_grp_types.h /usr/src/debug/strace/7.2/tests/ip_mreq.c /usr/src/debug/strace/7.2/tests/ipc_msg.c /usr/src/debug/strace/7.2/tests/ipc_sem.c /usr/src/debug/strace/7.2/tests/ipc_shm.c /usr/src/debug/strace/7.2/src/swapon.c /usr/src/debug/strace/7.2/src/netlink_sock_diag.h /usr/src/debug/strace/7.2/tests/futex_requeue.c /usr/src/debug/strace/7.2/tests/ppoll.c /usr/src/debug/strace/7.2/src/netlink_sock_diag.c /usr/src/debug/strace/7.2/src/xlat/evdev_mtslots.h /usr/src/debug/strace/7.2/tests/map_shadow_stack.c /usr/src/debug/strace/7.2/src/print_struct_stat.c /usr/src/debug/strace/7.2/src/file_attr.c /usr/src/debug/strace
 /7.2/tests/status-none.c /usr/src/debug/strace/7.2/src/mount_setattr.c /usr/src/debug/strace/7.2/src/xlat/ebpf_op_jmp.h /usr/src/debug/strace/7.2/src/xlat/xfs_quota_flags.h /usr/src/debug/strace/7.2/src/xlat/bpf_commands.h /usr/src/debug/strace/7.2/src/xlat/dcb_commands.h /usr/src/debug/strace/7.2/tests/set_sigign.c /usr/src/debug/strace/7.2/tests/linkat.c /usr/src/debug/strace/7.2/tests/subdir.c /usr/src/debug/strace/7.2/src/xlat/routing_table_ids.h /usr/src/debug/strace/7.2/tests/nfnetlink_ulog.c /usr/src/debug/strace/7.2/src/xlat/bsg_subprotocol.h /usr/src/debug/strace/7.2/tests/splice.c /usr/src/debug/strace/7.2/src/xlat/btrfs_qgroup_ctl_cmds.h /usr/src/debug/strace/7.2/tests/nsyscalls.c /usr/src/debug/strace/7.2/src/xlat/rtnl_ifla_info_attrs.h /usr/src/debug/strace/7.2/src/xlat/sched_getattr_flags.h /usr/src/debug/strace/7.2/tests/nsyscalls.h /usr/src/debug/strace/7.2/tests/execveat.c /usr/src/debug/strace/7.2/src/fsconfig.c /usr/src/debug/strace/7.2/tests/nfnetlink_nftables.c 
 /usr/src/debug/strace/7.2/src/xlat/btrfs_balance_state.h /usr/src/debug/strace/7.2/tests/nlattr_netconfmsg.c /usr/src/debug/strace/7.2/tests/cachestat.c /usr/src/debug/strace/7.2/src/bind.c /usr/src/debug/strace/7.2/src/bpf_filter.h /usr/src/debug/strace/7.2/src/trie.h /usr/src/debug/strace/7.2/tests/ioctl_evdev.c /usr/src/debug/strace/7.2/src/xlat/nbd_ioctl_flags.h /usr/src/debug/strace/7.2/src/bpf_filter.c /usr/src/debug/strace/7.2/src/trie.c /usr/src/debug/strace/7.2/src/netlink_smc_diag.c /usr/src/debug/strace/7.2/tests/ioctl_random.c /usr/src/debug/strace/7.2/src/pkeys.c /usr/src/debug/strace/7.2/src/bpf_fprog.h /usr/src/debug/strace/7.2/src/print_group_req.c /usr/src/debug/strace/7.2/src/xlat/ifaddrflags.h /usr/src/debug/strace/7.2/src/rtnl_neigh.c /usr/src/debug/strace/7.2/src/rtnl_route.c /usr/src/debug/strace/7.2/src/rtnl_stats.c /usr/src/debug/strace/7.2/src/xlat/genl_ctrl_attr_op.h /usr/src/debug/strace/7.2/src/xlat/keyctl_move_flags.h /usr/src/debug/strace/7.2/tests/netl
 ink_netlink_diag.c /usr/src/debug/strace/7.2/src/xlat/btrfs_features_incompat.h /usr/src/debug/strace/7.2/tests/prctl-pac-reset-keys.c /usr/src/debug/strace/7.2/src/xlat/seccomp_ioctl_resp_flags.h /usr/src/debug/strace/7.2/tests/truncate64.c /usr/src/debug/strace/7.2/tests/tgkill.c /usr/src/debug/strace/7.2/tests/ioctl_evdev-success.c"
packages/x86-64-v3-poky-linux/strace/strace-staticdev: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/strace/strace-staticdev: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/strace/strace: PKGV changed from 7.1 [default] to 7.2 [default]
packages/x86-64-v3-poky-linux/strace/strace: PV changed from "7.1" to "7.2"
packages/x86-64-v3-poky-linux/strace/strace: PKGSIZE changed from 2937211 to 1982843 (-32%)

--===============2088966030244473343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/strace/strace-dbg: PKGSIZE changed from 88311128 to 75939872 (-14%)
packages/x86-64-v3-poky-linux/strace/strace: PKGSIZE changed from 2937211 to 1982843 (-32%)

--===============2088966030244473343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="strace-changelog.txt"

Q2hhbmdlbG9nIGZvciBzdHJhY2U6IDcuMSAtPiA3LjIKU291cmNlOiBDaGFuZ2VMb2cKCjIwMjYt
MDgtMTggIERtaXRyeSBWLiBMZXZpbiAgPGxkdkBzdHJhY2UuaW8+CgoJUHJlcGFyZSBmb3IgNy4y
IHJlbGVhc2UuCgkqIE5FV1M6IFVwZGF0ZSBmb3IgNy4yIHJlbGVhc2UuCgoJVXBkYXRlIGNvcHly
aWdodCBoZWFkZXJzLgoJSGVhZGVycyB1cGRhdGVkIGF1dG9tYXRpY2FsbHkgdXNpbmcgbWFpbnQv
dXBkYXRlX2NvcHlyaWdodF95ZWFycy5zaAoJc2NyaXB0LgoKMjAyNi0wOC0xOCAgRG1pdHJ5IFYu
IExldmluICA8bGR2QHN0cmFjZS5pbz4KCgl0ZXN0czogZml4IGZ1dGV4IHRlc3QgZXhwZWN0YXRp
b25zIGZvciBGVVRFWF9VTkxPQ0tfKl9MSVNUKiBvbiBsaW51eCB2Ny4yCgkqIHRlc3RzL2Z1dGV4
LmMgKG1haW4pOiBDaGFuZ2UgRlVURVhfVU5MT0NLX1dBS0VfTElTVDY0LAoJRlVURVhfVU5MT0NL
X1dBS0VfTElTVDY0X1BSSVZBVEUsIEZVVEVYX1VOTE9DS19XQUtFX0xJU1QzMiwKCUZVVEVYX1VO
TE9DS19XQUtFX0xJU1QzMl9QUklWQVRFLCBGVVRFWF9VTkxPQ0tfQklUU0VUX0xJU1Q2NCwKCUZV
VEVYX1VOTE9DS19CSVRTRVRfTElTVDY0X1BSSVZBVEUsIEZVVEVYX1VOTE9DS19CSVRTRVRfTElT
VDMyLAoJYW5kIEZVVEVYX1VOTE9DS19CSVRTRVRfTElTVDMyX1BSSVZBVEUgY2hlY2tzIHRvIGV4
cGVjdCBFRkFVTFQKCWluc3RlYWQgb2Ygc3VjY2Vzcy4KCglUaGVzZSBvcGVyYXRpb25zIHJlcXVp
cmUgYSB2YWxpZCByb2J1c3QgbGlzdCBwZW5kaW5nIG9wIHBvaW50ZXIKCWluIHVhZGRyMi4gIFdo
ZW4gdWFkZHIyIGlzIE5VTEwsIExpbnV4IHY3LjIgcmV0dXJucyBFRkFVTFQuCglPbiBvbGRlciBr
ZXJuZWxzIHRoYXQgZG9uJ3QgaW1wbGVtZW50IHRoZXNlIG9wZXJhdGlvbnMsIEVOT1NZUwoJaXMg
c3RpbGwgYWNjZXB0ZWQgdmlhIENIRUNLX0ZVVEVYX0VOT1NZUy4KCglGaXhlczogdjcuMS01Mi1n
MDdjMWMzZjAwYjAyICJ0ZXN0czogY2hlY2sgZGVjb2Rpbmcgb2YgRlVURVhfVU5MT0NLXypfTElT
VCogY29uc3RhbnRzIgoJQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtc29ubmV0LTQtNQoKMjAy
Ni0wOC0xNyAgR2xlYiBGb3RlbmdhdWVyLU1hbGlub3Zza2l5ICA8Z2xlYmZtQGFsdGxpbnV4Lm9y
Zz4KCglVcGRhdGUgaW9jdGwgZW50cmllcyBmcm9tIGxpbnV4IHY3LjIuCgkqIHNyYy9saW51eC8z
Mi9pb2N0bHNfaW5jX2FsaWduMTYuaDogVXBkYXRlIGZyb20gbGludXggdjcuMiB1c2luZwoJaW9j
dGxzX2dlbi5zaC4KCSogc3JjL2xpbnV4LzMyL2lvY3Rsc19pbmNfYWxpZ24zMi5oOiBMaWtld2lz
ZS4KCSogc3JjL2xpbnV4LzMyL2lvY3Rsc19pbmNfYWxpZ242NC5oOiBMaWtld2lzZS4KCSogc3Jj
L2xpbnV4LzY0L2lvY3Rsc19pbmMuaDogTGlrZXdpc2UuCgkqIHNyYy9saW51eC94MzIvaW9jdGxz
X2luYzAuaDogTGlrZXdpc2UuCgkqIE5FV1M6IE1lbnRpb24gdGhpcyBjaGFuZ2UuCgoyMDI2LTA4
LTE3ICBEbWl0cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNlLmlvPgoKCWJ1bmRsZWQ6IHVwZGF0ZSBs
aW51eCBVQVBJIGhlYWRlcnMgdG8gdjcuMi4KCUhlYWRlcnMgdXBkYXRlZCBhdXRvbWF0aWNhbGx5
IHVzaW5nIHVwZGF0ZS1idW5kbGVkLWhlYWRlcnMuc2ggc2NyaXB0LgoKCSogYnVuZGxlZC9saW51
eC9pbmNsdWRlL3VhcGkvbGludXgvYnRyZnMuaDogVXBkYXRlIHRvCgloZWFkZXJzX2luc3RhbGwn
ZWQgTGludXgga2VybmVsIHY3LjIuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBpL2xpbnV4
L2lwX3ZzLmg6IExpa2V3aXNlLgoKMjAyNi0wOC0xNiAgRG1pdHJ5IFYuIExldmluICA8bGR2QHN0
cmFjZS5pbz4KCglpb191cmluZzogcmVuYW1lIG5vdGlmIHRvIGV2ZW50LgoJQmV0d2VlbiBMaW51
eCB2Ny4yLXJjMSBhbmQgdjcuMi1yYzcsIHRoZSBpb191cmluZyB6ZXJvLWNvcHkgUlgKCWludGVy
ZmFjZSB1bmRlcndlbnQgYSBzeXN0ZW1hdGljIHJlbmFtZSByZXBsYWNpbmcgIm5vdGlmIi8ibm90
aWZpY2F0aW9uIgoJdGVybWlub2xvZ3kgd2l0aCAiZXZlbnQiLgoKCSogYnVuZGxlZC9saW51eC9p
bmNsdWRlL3VhcGkvbGludXgvaW9fdXJpbmcvcXVlcnkuaDogVXBkYXRlIHRvCgloZWFkZXJzX2lu
c3RhbGwnZWQgTGludXgga2VybmVsIHY3LjItcmM3IHVzaW5nIHVwZGF0ZS1idW5kbGVkLWhlYWRl
cnMuc2gKCXNjcmlwdC4KCSogYnVuZGxlZC9saW51eC9pbmNsdWRlL3VhcGkvbGludXgvaW9fdXJp
bmcvemNyeC5oOiBMaWtld2lzZS4KCSogc3JjL3hsYXQvdXJpbmdfemNyeF9ub3RpZl90eXBlcy5p
bjogUmVuYW1lIHRvCglzcmMveGxhdC91cmluZ196Y3J4X2V2ZW50X3R5cGVzLmluIGFuZCB1cGRh
dGUgY29uc3RhbnQgbmFtZXM6CglaQ1JYX05PVElGX05PX0JVRkZFUlMgYmVjb21lcyBaQ1JYX0VW
RU5UX0FMTE9DX0ZBSUwsCglaQ1JYX05PVElGX0NPUFkgYmVjb21lcyBaQ1JYX0VWRU5UX0NPUFku
CgkqIHNyYy94bGF0L3VyaW5nX3pjcnhfY3RybF9vcHMuaW4gKFpDUlhfQ1RSTF9BUk1fTk9USUZJ
Q0FUSU9OKTogUmVuYW1lCgl0byBaQ1JYX0NUUkxfQVJNX0VWRU5ULgoJKiBzcmMveGxhdC91cmlu
Z19xdWVyeV9vcHMuaW4gKElPX1VSSU5HX1FVRVJZX1pDUlhfTk9USUYpOiBSZW5hbWUgdG8KCUlP
X1VSSU5HX1FVRVJZX1pDUlhfRVZFTlQuCgkqIHNyYy9pb191cmluZy5jOiBVcGRhdGUgdG8gbWF0
Y2gga2VybmVsIFVBUEkgY2hhbmdlcy4KCShwcmludF9pb191cmluZ196Y3J4X2lmcV9yZWcpOiBu
b3RpZl9kZXNjIC0+IGV2ZW50X2Rlc2MgZmllbGQuCgkocHJpbnRfemNyeF9jdHJsX2FybV9ub3Rp
Zik6IFJlbmFtZSBmdW5jdGlvbiB0bwoJcHJpbnRfemNyeF9jdHJsX2FybV9ldmVudCwgdXBkYXRl
IHN0cnVjdCB0eXBlIGFuZCBmaWVsZCBuYW1lcy4KCShwcmludF9pb191cmluZ196Y3J4X2N0cmwp
OiBVcGRhdGUgY2FzZSBhbmQgdW5pb24gbWVtYmVyIHJlZmVyZW5jZXMuCgkocHJpbnRfaW9fdXJp
bmdfcXVlcnlfemNyeF9ub3RpZik6IFJlbmFtZSBmdW5jdGlvbiB0bwoJcHJpbnRfaW9fdXJpbmdf
cXVlcnlfemNyeF9ldmVudCwgdXBkYXRlIHN0cnVjdCB0eXBlIGFuZCBhbGwgZmllbGQKCW5hbWVz
IChub3RpZl9mbGFncyAtPiBldmVudF9mbGFncywgbm90aWZfc3RhdHNfc2l6ZSAtPiBzdGF0c19z
aXplLAoJbm90aWZfc3RhdHNfb2ZmX2FsaWdubWVudCAtPiBzdGF0c19vZmZfYWxpZ25tZW50KS4K
CShwcmludF9pb191cmluZ19xdWVyeV9saXN0KTogVXBkYXRlIGNhc2UgYW5kIGZ1bmN0aW9uIGNh
bGwuCgkqIHRlc3RzL2lvX3VyaW5nX3JlZ2lzdGVyLmM6IFVwZGF0ZSBhbGwgdGVzdCBjYXNlcyBh
bmQgZXhwZWN0ZWQgb3V0cHV0CglzdHJpbmdzIHRvIG1hdGNoIHJlbmFtZWQgY29uc3RhbnRzLCBz
dHJ1Y3RzLCBhbmQgZmllbGRzLgoKCUtlcm5lbCBjb21taXRzOgoJKiBhZjc4YzAwMjA0ODAgImlv
X3VyaW5nL3pjcng6IGRyb3AgJ25vdGlmJyBmcm9tIHN0YXRzIHN0cnVjdCBuYW1lcyIKCSogMjAx
ZTMwODEwMjIzICJpb191cmluZy96Y3J4OiByZW5hbWUgWkNSWF9OT1RJRl9OT19CVUZGRVJTIgoJ
KiBlMzY2YzE1ZTE2MTAgImlvX3VyaW5nL3pjcng6IHJlbmFtZSBub3RpZiB0byBldmVudCIKCglB
c3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQtNgoKMjAyNi0wOC0wMSAgZGVwZW5kYWJv
dFtib3RdICA8NDk2OTkzMzMrZGVwZW5kYWJvdFtib3RdQHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNv
bT4KCglidWlsZChkZXBzKTogYnVtcCBhY3Rpb25zL2NoZWNrb3V0IGZyb20gNy4wLjAgdG8gNy4w
LjEuCglCdW1wcyBbYWN0aW9ucy9jaGVja291dF0oaHR0cHM6Ly9naXRodWIuY29tL2FjdGlvbnMv
Y2hlY2tvdXQpIGZyb20gNy4wLjAgdG8gNy4wLjEuCgktIFtSZWxlYXNlIG5vdGVzXShodHRwczov
L2dpdGh1Yi5jb20vYWN0aW9ucy9jaGVja291dC9yZWxlYXNlcykKCS0gW0NoYW5nZWxvZ10oaHR0
cHM6Ly9naXRodWIuY29tL2FjdGlvbnMvY2hlY2tvdXQvYmxvYi9tYWluL0NIQU5HRUxPRy5tZCkK
CS0gW0NvbW1pdHNdKGh0dHBzOi8vZ2l0aHViLmNvbS9hY3Rpb25zL2NoZWNrb3V0L2NvbXBhcmUv
OWMwOTFiYjIxYjdjMWMxZDE5OTFiYjkwOGQ4OWU0ZTlkZGRmZTNlMC4uLjNkM2M0MmU1YWFjNWJh
ODA1ODI1ZGE3NjQxMGMxODEyNzNiYTkwYjEpCgoJLS0tCgl1cGRhdGVkLWRlcGVuZGVuY2llczoK
CS0gZGVwZW5kZW5jeS1uYW1lOiBhY3Rpb25zL2NoZWNrb3V0CgkgIGRlcGVuZGVuY3ktdmVyc2lv
bjogNy4wLjEKCSAgZGVwZW5kZW5jeS10eXBlOiBkaXJlY3Q6cHJvZHVjdGlvbgoJICB1cGRhdGUt
dHlwZTogdmVyc2lvbi11cGRhdGU6c2VtdmVyLXBhdGNoCgkuLi4KCjIwMjYtMDctMTUgIERtaXRy
eSBWLiBMZXZpbiAgPGxkdkBzdHJhY2UuaW8+CgoJb3BlbmF0MjogZGVjb2RlIE9QRU5BVDJfUkVH
VUxBUiBmbGFnLgoJKiBORVdTOiBNZW50aW9uIE9QRU5BVDJfUkVHVUxBUiBkZWNvZGluZy4KCSog
c3JjL3hsYXQvb3BlbmF0Ml9mbGFncy5pbjogTmV3IGZpbGUuCgkqIHNyYy9vcGVuLmM6IEluY2x1
ZGUgInhsYXQvb3BlbmF0Ml9mbGFncy5oIi4KCSh0cHJpbnRfb3Blbl9ob3dfZmxhZ3MpOiBOZXcg
ZnVuY3Rpb24gdGhhdCBjYWxscyBzcHJpbnRfb3Blbl9tb2RlX2ZsYWdzCgl3aXRoIGJvdGggb3Bl
bl9tb2RlX2ZsYWdzIGFuZCBvcGVuYXQyX2ZsYWdzLgoJKHByaW50X29wZW5faG93KTogVXNlIHRw
cmludF9vcGVuX2hvd19mbGFncyB0byBkZWNvZGUgdGhlIGZsYWdzIGZpZWxkLAoJdG8gaGFuZGxl
IE9QRU5BVDJfUkVHVUxBUiBmbGFnIGludHJvZHVjZWQgYnkgTGludXgga2VybmVsIGNvbW1pdAoJ
djcuMi1yYzF+MjI4XjJ+M14yfjEuCgkqIHRlc3RzL29wZW5hdDIuYyAobWFpbik6IENoZWNrIGl0
LgoKCUFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNC02CgoyMDI2LTA3LTE1ICBEbWl0
cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNlLmlvPgoKCW9wZW46IHJlZmFjdG9yIHNwcmludF9vcGVu
X21vZGVzNjQgdG8gc3VwcG9ydCBtdWx0aXBsZSB4bGF0IHRhYmxlcy4KCUludHJvZHVjZSBzcHJp
bnRmbGFnc19leHYsIGEgdmFfbGlzdCB2ZXJzaW9uIG9mIHNwcmludGZsYWdzX2V4IHRoYXQKCWl0
ZXJhdGVzIG11bHRpcGxlIE5VTEwtdGVybWluYXRlZCB4bGF0IHRhYmxlcyBiZWZvcmUgZm9ybWF0
dGluZwoJdW5rbm93biBiaXRzLiAgVHVybiBzcHJpbnRmbGFnc19leCBpbnRvIGEgdGhpbiB3cmFw
cGVyIGFyb3VuZCBhIG5ldwoJc3ByaW50ZmxhZ3NfZXhsIHN0YXRpYyB2YXJpYWRpYyB0cmFtcG9s
aW5lIHRoYXQgZm9yd2FyZHMgdG8KCXNwcmludGZsYWdzX2V4di4KCglSZW5hbWUgc3ByaW50X29w
ZW5fbW9kZXM2NCB0byBzcHJpbnRfb3Blbl9tb2RlX2ZsYWdzLCBtYWtlIGl0Cgl2YXJpYWRpYywg
YW5kIGZvcndhcmQgaXRzIHhsYXQgYXJndW1lbnRzIHRvIHNwcmludGZsYWdzX2V4di4KCVJlLWNy
ZWF0ZSBzcHJpbnRfb3Blbl9tb2RlczY0IGFzIGEgdGhpbiB3cmFwcGVyIHRoYXQgcGFzc2VzCglv
cGVuX21vZGVfZmxhZ3MuCgoJKiBzcmMveGxhdC5jIChzcHJpbnRmbGFnc19leHYpOiBOZXcgZnVu
Y3Rpb24uCgkoc3ByaW50ZmxhZ3NfZXhsKTogTmV3IHN0YXRpYyB2YXJpYWRpYyB0cmFtcG9saW5l
IGZvciBzcHJpbnRmbGFnc19leHYuCgkoc3ByaW50ZmxhZ3NfZXgpOiBUdXJuIGludG8gYSB0aGlu
IHdyYXBwZXIgYXJvdW5kIHNwcmludGZsYWdzX2V4bC4KCSogc3JjL2RlZnMuaCAoc3ByaW50Zmxh
Z3NfZXh2KTogTmV3IGRlY2xhcmF0aW9uLgoJKiBzcmMvb3Blbi5jIChzcHJpbnRfb3Blbl9tb2Rl
X2ZsYWdzKTogUmVuYW1lIGZyb20gc3ByaW50X29wZW5fbW9kZXM2NCwKCW1ha2UgdmFyaWFkaWMs
IGFuZCBmb3J3YXJkIHhsYXQgYXJndW1lbnRzIHRvIHNwcmludGZsYWdzX2V4di4KCShzcHJpbnRf
b3Blbl9tb2RlczY0KTogUmUtY3JlYXRlIGFzIGEgdGhpbiB3cmFwcGVyIGFyb3VuZAoJc3ByaW50
X29wZW5fbW9kZV9mbGFncy4KCglBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQtNgoK
MjAyNi0wNy0xNCAgRG1pdHJ5IFYuIExldmluICA8bGR2QHN0cmFjZS5pbz4KCglpb191cmluZzog
YWRkIG1pc3NpbmcgQ0hFQ0tfVFlQRV9TSVpFLCB1c2UgY29uc2lzdGVudCBzdHlsZS4KCUFkZCBt
aXNzaW5nIENIRUNLX1RZUEVfU0laRSBmb3Igd2hvbGUgc3RydWN0cyBhbmQgdGhlaXIgYXJyYXkg
bWVtYmVycy4KCVVzZSB2YXJpYWJsZS1iYXNlZCBDSEVDS19UWVBFX1NJWkUgY29uc2lzdGVudGx5
LCBwbGFjZSBhbGwgc2l6ZSBjaGVja3MKCXJpZ2h0IGFmdGVyIHZhcmlhYmxlIGRlY2xhcmF0aW9u
cy4KCgkqIHNyYy9pb191cmluZy5jIChpb191cmluZ19zZXR1cCk6IEFkZCBDSEVDS19UWVBFX1NJ
WkUgZm9yIHBhcmFtcy5yZXN2LgoJKHByaW50X2lvX3VyaW5nX2dldGV2ZW50c19hcmcpOiBVc2Ug
dmFyaWFibGUtYmFzZWQgQ0hFQ0tfVFlQRV9TSVpFLgoJKHByaW50X2lvX3VyaW5nX3Byb2JlKTog
QWRkIENIRUNLX1RZUEVfU0laRSBmb3IgKnByb2JlIGFuZAoJcHJvYmUtPnJlc3YyLgoJKHByaW50
X2lvX3VyaW5nX3N5bmNfY2FuY2VsX3JlZyk6IEFkZCBDSEVDS19UWVBFX1NJWkUgZm9yIGFyZywK
CWFyZy5wYWQsIGFuZCBhcmcucGFkMi4KCShwcmludF9pb191cmluZ19idWZfc3RhdHVzKTogQWRk
IENIRUNLX1RZUEVfU0laRSBmb3IgYXJnIGFuZCBhcmcucmVzdi4KCShwcmludF9pb191cmluZ19u
YXBpKTogQWRkIENIRUNLX1RZUEVfU0laRSBmb3IgYXJnIGFuZCBhcmcucGFkLgoJKHByaW50X2lv
X3VyaW5nX2F0dHJfcGkpOiBVc2UgdmFyaWFibGUtYmFzZWQgQ0hFQ0tfVFlQRV9TSVpFLgoJKHBy
aW50X2lvX3VyaW5nX3NxZSk6IFVzZSB2YXJpYWJsZS1iYXNlZCBDSEVDS19UWVBFX1NJWkUsIG1v
dmUgYmVmb3JlCgl1bW92ZS4KCShwcmludF9pb191cmluZ196Y3J4X29mZnNldHMpOiBBZGQgQ0hF
Q0tfVFlQRV9TSVpFIGZvciAqb2Zmc2V0cyBhbmQKCW9mZnNldHMtPl9fcmVzdi4KCShwcmludF9p
b191cmluZ196Y3J4X2lmcV9yZWcpOiBNb3ZlIENIRUNLX1RZUEVfU0laRSByaWdodCBhZnRlcgoJ
ZGVjbGFyYXRpb24uCgkocHJpbnRfemNyeF9jdHJsX2ZsdXNoX3JxKTogQWRkIENIRUNLX1RZUEVf
U0laRSBmb3IgKmZsdXNoIGFuZAoJZmx1c2gtPl9fcmVzdi4KCShwcmludF96Y3J4X2N0cmxfZXhw
b3J0KTogQWRkIENIRUNLX1RZUEVfU0laRSBmb3IgKmV4cG9ydCBhbmQKCWV4cG9ydC0+X19yZXN2
MS4KCShwcmludF96Y3J4X2N0cmxfYXJtX25vdGlmKTogQWRkIENIRUNLX1RZUEVfU0laRSBmb3Ig
KmFybSBhbmQKCWFybS0+X19yZXN2LgoJKHByaW50X2lvX3VyaW5nX3pjcnhfY3RybCk6IFVzZSB2
YXJpYWJsZS1iYXNlZCBDSEVDS19UWVBFX1NJWkUsIGFkZAoJQ0hFQ0tfVFlQRV9TSVpFIGZvciBh
cmcuX19yZXN2LgoJKHByaW50X2lvX3VyaW5nX3BhcmFtc19pbnB1dCk6IFVzZSB2YXJpYWJsZS1i
YXNlZCBDSEVDS19UWVBFX1NJWkUsCgltb3ZlIGJlZm9yZSB1bW92ZSwgYWRkIENIRUNLX1RZUEVf
U0laRSBmb3IgcGFyYW1zLnJlc3YuCgkocHJpbnRfaW9fdXJpbmdfbWVtX3JlZ2lvbl9yZWcpOiBV
c2UgdmFyaWFibGUtYmFzZWQgQ0hFQ0tfVFlQRV9TSVpFLAoJYWRkIENIRUNLX1RZUEVfU0laRSBm
b3IgYXJnLl9fcmVzdi4KCShwcmludF9pb191cmluZ19xdWVyeV9vcGNvZGUpOiBVc2UgdmFyaWFi
bGUtYmFzZWQgQ0hFQ0tfVFlQRV9TSVpFLAoJbW92ZSBiZWZvcmUgdW1vdmUuCgkocHJpbnRfaW9f
dXJpbmdfcXVlcnlfemNyeCk6IFVzZSB2YXJpYWJsZS1iYXNlZCBDSEVDS19UWVBFX1NJWkUsCglt
b3ZlIGJlZm9yZSB1bW92ZS4KCShwcmludF9pb191cmluZ19xdWVyeV96Y3J4X25vdGlmKTogVXNl
IHZhcmlhYmxlLWJhc2VkIENIRUNLX1RZUEVfU0laRSwKCW1vdmUgYmVmb3JlIHVtb3ZlLCBhZGQg
Q0hFQ0tfVFlQRV9TSVpFIGZvciBub3RpZi5fX3Jlc3YyLgoJKHByaW50X2lvX3VyaW5nX3F1ZXJ5
X3NjcSk6IFVzZSB2YXJpYWJsZS1iYXNlZCBDSEVDS19UWVBFX1NJWkUsIG1vdmUKCWJlZm9yZSB1
bW92ZS4KCShwcmludF9pb191cmluZ19xdWVyeV9saXN0KTogQWRkIENIRUNLX1RZUEVfU0laRSBm
b3IgaGRyLl9fcmVzdi4KCglBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQtNgoKMjAy
Ni0wNy0xMyAgRG1pdHJ5IFYuIExldmluICA8bGR2QHN0cmFjZS5pbz4KCglpb191cmluZzogZGVj
b2RlIElPX1VSSU5HX1FVRVJZX1pDUlhfTk9USUYgcXVlcnkgb3BlcmF0aW9uLgoJKiBzcmMvaW9f
dXJpbmcuYyAocHJpbnRfaW9fdXJpbmdfcXVlcnlfemNyeF9ub3RpZik6IE5ldyBmdW5jdGlvbi4K
CShwcmludF9pb191cmluZ19xdWVyeV9saXN0KTogSGFuZGxlIElPX1VSSU5HX1FVRVJZX1pDUlhf
Tk9USUYgY2FzZQoJaW50cm9kdWNlZCBieSBMaW51eCBrZXJuZWwgY29tbWl0IHY3LjItcmMxfjE1
Ml4yfjE3LgoJKiB0ZXN0cy9pb191cmluZ19yZWdpc3Rlci5jICh0ZXN0X0lPUklOR19SRUdJU1RF
Ul9RVUVSWSk6IEFkZCB0ZXN0cyBmb3IKCUlPX1VSSU5HX1FVRVJZX1pDUlhfTk9USUYgd2l0aCBh
bmQgd2l0aG91dCBub24temVybyByZXNlcnZlZCBmaWVsZHMuCgkqIE5FV1M6IE1lbnRpb24gdGhp
cyBjaGFuZ2UuCgoJQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTYKCjIwMjYtMDct
MTMgIERtaXRyeSBWLiBMZXZpbiAgPGxkdkBzdHJhY2UuaW8+CgoJaW9fdXJpbmc6IGRlY29kZSBa
Q1JYX0NUUkxfQVJNX05PVElGSUNBVElPTiBjdHJsIG9wZXJhdGlvbi4KCSogc3JjL3hsYXQvdXJp
bmdfemNyeF9jdHJsX29wcy5pbiAoWkNSWF9DVFJMX0FSTV9OT1RJRklDQVRJT04pOiBOZXcKCWNv
bnN0YW50IGludHJvZHVjZWQgYnkgTGludXgga2VybmVsIGNvbW1pdCB2Ny4yLXJjMX4xNTJeMn4x
OS4KCSogc3JjL3hsYXQvdXJpbmdfemNyeF9ub3RpZl90eXBlcy5pbjogTmV3IGZpbGUuCgkqIHNy
Yy9pb191cmluZy5jOiBJbmNsdWRlICJ4bGF0L3VyaW5nX3pjcnhfbm90aWZfdHlwZXMuaCIuCgko
cHJpbnRfemNyeF9jdHJsX2FybV9ub3RpZik6IE5ldyBmdW5jdGlvbi4KCShwcmludF9pb191cmlu
Z196Y3J4X2N0cmwpOiBBZGQgWkNSWF9DVFJMX0FSTV9OT1RJRklDQVRJT04gY2FzZS4KCSogdGVz
dHMvaW9fdXJpbmdfcmVnaXN0ZXIuYyAodGVzdF9JT1JJTkdfUkVHSVNURVJfWkNSWF9DVFJMKTog
QWRkIHRlc3RzCglmb3IgWkNSWF9DVFJMX0FSTV9OT1RJRklDQVRJT04gd2l0aCBkaWZmZXJlbnQg
bm90aWZpY2F0aW9uIHR5cGVzIGFuZAoJbm9uLXplcm8gcmVzZXJ2ZWQgZmllbGRzLgoJKiBORVdT
OiBNZW50aW9uIHRoaXMgY2hhbmdlLgoKCUFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMt
NC02CgoyMDI2LTA3LTEzICBEbWl0cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNlLmlvPgoKCXhsYXQ6
IHVwZGF0ZSBJT19VUklOR19RVUVSWV8qIGNvbnN0YW50cy4KCSogc3JjL3hsYXQvdXJpbmdfcXVl
cnlfb3BzLmluIChJT19VUklOR19RVUVSWV9aQ1JYX05PVElGKTogTmV3Cgljb25zdGFudCBpbnRy
b2R1Y2VkIGJ5IExpbnV4IGtlcm5lbCBjb21taXQgdjcuMi1yYzF+MTUyXjJ+MTcuCgkqIE5FV1M6
IE1lbnRpb24gdGhpcyBjaGFuZ2UuCgoJQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00
LTYKCjIwMjYtMDctMTIgIERtaXRyeSBWLiBMZXZpbiAgPGxkdkBzdHJhY2UuaW8+CgoJbGFuZGxv
Y2s6IGRlY29kZSBsYW5kbG9ja19hZGRfcnVsZSBmbGFncy4KCSogc3JjL3hsYXQvbGFuZGxvY2tf
YWRkX3J1bGVfZmxhZ3MuaW46IE5ldyBmaWxlLgoJKiBzcmMvbGFuZGxvY2suYzogSW5jbHVkZSAi
eGxhdC9sYW5kbG9ja19hZGRfcnVsZV9mbGFncy5oIi4KCShTWVNfRlVOQyhsYW5kbG9ja19hZGRf
cnVsZSkpOiBVc2UgcHJpbnRmbGFncyB3aXRoCglsYW5kbG9ja19hZGRfcnVsZV9mbGFncyB4bGF0
IGluc3RlYWQgb2YgUFJJTlRfVkFMX1ggZm9yIHRoZSBmbGFncwoJYXJndW1lbnQsIHRvIGRlY29k
ZSBMQU5ETE9DS19BRERfUlVMRV9RVUlFVCBmbGFnIGludHJvZHVjZWQgYnkgTGludXgKCWtlcm5l
bCBjb21taXQgdjcuMi1yYzF+OTFeMn43LgoJKiB0ZXN0cy9sYW5kbG9ja19hZGRfcnVsZS5jICht
YWluKTogVXBkYXRlIGV4cGVjdGVkIG91dHB1dCB0byB1c2UKCXN5bWJvbGljIGZsYWcgbmFtZXMu
CgkqIE5FV1M6IE1lbnRpb24gdGhpcyBjaGFuZ2UuCgoJQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1
ZGUtb3B1cy00LTYKCjIwMjYtMDctMDkgIERtaXRyeSBWLiBMZXZpbiAgPGxkdkBzdHJhY2UuaW8+
CgoJbGFuZGxvY2s6IGRlY29kZSBxdWlldCBmaWVsZHMgb2YgbGFuZGxvY2tfcnVsZXNldF9hdHRy
LgoJRGVjb2RlIHF1aWV0X2FjY2Vzc19mcywgcXVpZXRfYWNjZXNzX25ldCwgYW5kIHF1aWV0X3Nj
b3BlZCBmaWVsZHMKCW9mIHN0cnVjdCBsYW5kbG9ja19ydWxlc2V0X2F0dHIsIGludHJvZHVjZWQg
YnkgTGludXgga2VybmVsIGNvbW1pdAoJdjcuMi1yYzF+OTFeMn43LgoKCSogc3JjL2xhbmRsb2Nr
LmMgKHByaW50X2xhbmRsb2NrX3J1bGVzZXRfYXR0cik6IFVwZGF0ZSBtYXhfYXR0cl9zaXplIHRv
CglpbmNsdWRlIHF1aWV0X3Njb3BlZC4gIERlY29kZSBxdWlldF9hY2Nlc3NfZnMsIHF1aWV0X2Fj
Y2Vzc19uZXQsIGFuZAoJcXVpZXRfc2NvcGVkIGZpZWxkcy4KCSogdGVzdHMvbGFuZGxvY2tfY3Jl
YXRlX3J1bGVzZXQuYyAobWFpbik6IEV4dGVuZCBsb2NhbCBzdHJ1Y3QgYXR0ciB3aXRoCglxdWll
dCBmaWVsZHMuICBBZGQgdGVzdCBjYXNlcyBmb3IgcXVpZXRfYWNjZXNzX2ZzLCBxdWlldF9hY2Nl
c3NfbmV0LCBhbmQKCXF1aWV0X3Njb3BlZCBmaWVsZHMuCgkqIE5FV1M6IE1lbnRpb24gdGhpcyBj
aGFuZ2UuCgoJQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTYKCjIwMjYtMDctMDgg
IERtaXRyeSBWLiBMZXZpbiAgPGxkdkBzdHJhY2UuaW8+CgoJYnBmOiBkZWNvZGUgcGF0aF9mZCBm
aWVsZCBvZiBCUEZfTElOS19DUkVBVEUgdXByb2JlX211bHRpLgoJKiBzcmMvYnBmX2F0dHIuaCAo
QlBGX0xJTktfQ1JFQVRFX3N0cnVjdC51cHJvYmVfbXVsdGkucGF0aF9mZCk6IE5ldwoJZmllbGQs
IGludHJvZHVjZWQgYnkgTGludXgga2VybmVsIGNvbW1pdCB2Ny4yLXJjMX4xNDJeMn43XjJ+NC4K
CShCUEZfTElOS19DUkVBVEVfc3RydWN0X3NpemUsIGV4cGVjdGVkX0JQRl9MSU5LX0NSRUFURV9z
dHJ1Y3Rfc2l6ZSk6CglVcGRhdGUuCgkqIHNyYy9icGYuYyAoQkVHSU5fQlBGX0NNRF9ERUNPREVS
KEJQRl9MSU5LX0NSRUFURSkpOiBEZWNvZGUgcGF0aF9mZAoJaW4gdXByb2JlX211bHRpIHN1Yi1z
dHJ1Y3QuCgkqIHRlc3RzL2JwZi5jIChCUEZfTElOS19DUkVBVEVfY2hlY2tzKTogVXBkYXRlIHVw
cm9iZV9tdWx0aSB0ZXN0CgllbnRyaWVzIHRvIGluY2x1ZGUgcGF0aF9mZC4KCSogTkVXUzogTWVu
dGlvbiB0aGlzIGNoYW5nZS4KCglBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQtNgoK
MjAyNi0wNy0wNyAgRG1pdHJ5IFYuIExldmluICA8bGR2QHN0cmFjZS5pbz4KCglicGY6IGRlY29k
ZSBCUEZfTElOS19DUkVBVEUgdHJhY2luZ19tdWx0aSBzdWItc3RydWN0LgoJKiBzcmMvYnBmX2F0
dHIuaCAoc3RydWN0IEJQRl9MSU5LX0NSRUFURV9zdHJ1Y3QudHJhY2luZ19tdWx0aSk6IE5ldwoJ
dW5pb24gbWVtYmVyIHdpdGggaWRzLCBjb29raWVzLCBhbmQgY250IGZpZWxkcywgaW50cm9kdWNl
ZCBieSBMaW51eAoJa2VybmVsIGNvbW1pdCB2Ny4yLXJjMX4xNDJeMn4yOV4yfjE2LgoJKiBzcmMv
YnBmLmMgKEJQRl9MSU5LX0NSRUFURSk6IEFkZCBjYXNlcyBmb3IgQlBGX1RSQUNFX0ZFTlRSWV9N
VUxUSSwKCUJQRl9UUkFDRV9GRVhJVF9NVUxUSSwgYW5kIEJQRl9UUkFDRV9GU0VTU0lPTl9NVUxU
SSBhdHRhY2ggdHlwZXMsCglkZWNvZGUgdHJhY2luZ19tdWx0aS5pZHMgYXMgdTMyIGFycmF5LCB0
cmFjaW5nX211bHRpLmNvb2tpZXMgYXMgdTY0CglhcnJheSwgYW5kIHRyYWNpbmdfbXVsdGkuY250
LgoJKiB0ZXN0cy9icGYuYyAoc3BlY2lhbF9hdHRhY2hfdHlwZXMpOiBBZGQgQlBGX1RSQUNFX0ZF
TlRSWV9NVUxUSSwKCUJQRl9UUkFDRV9GRVhJVF9NVUxUSSwgQlBGX1RSQUNFX0ZTRVNTSU9OX01V
TFRJLgoJKGluaXRfQlBGX0xJTktfQ1JFQVRFX3RyYWNpbmdfbXVsdGksCglwcmludF9CUEZfTElO
S19DUkVBVEVfdHJhY2luZ19tdWx0aSk6IE5ldyBmdW5jdGlvbnMuCgkoQlBGX0xJTktfQ1JFQVRF
X2NoZWNrcyk6IEFkZCBjaGVja3MgZm9yIHRyYWNpbmdfbXVsdGkgZGVjb2RpbmcKCWluY2x1ZGlu
ZyBjbnQ9MCBzdGF0aWMgY2hlY2tzIGFuZCBhcnJheSBwcmludGluZyBkeW5hbWljIGNoZWNrLgoJ
KiBORVdTOiBNZW50aW9uIHRoaXMgY2hhbmdlLgoKCUFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRl
LW9wdXMtNC02CgoyMDI2LTA3LTA2ICBEbWl0cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNlLmlvPgoK
CXRlc3RzOiBjaGVjayBkZWNvZGluZyBvZiBGVVRFWF9VTkxPQ0tfKl9MSVNUKiBjb25zdGFudHMu
CgkqIHRlc3RzL2Z1dGV4LmMgKG1haW4pOiBDaGVjayBGVVRFWF9VTkxPQ0tfUElfTElTVDY0LAoJ
RlVURVhfVU5MT0NLX1BJX0xJU1Q2NF9QUklWQVRFLCBGVVRFWF9VTkxPQ0tfUElfTElTVDMyLAoJ
RlVURVhfVU5MT0NLX1BJX0xJU1QzMl9QUklWQVRFLCBGVVRFWF9VTkxPQ0tfV0FLRV9MSVNUNjQs
CglGVVRFWF9VTkxPQ0tfV0FLRV9MSVNUNjRfUFJJVkFURSwgRlVURVhfVU5MT0NLX1dBS0VfTElT
VDMyLAoJRlVURVhfVU5MT0NLX1dBS0VfTElTVDMyX1BSSVZBVEUsIEZVVEVYX1VOTE9DS19CSVRT
RVRfTElTVDY0LAoJRlVURVhfVU5MT0NLX0JJVFNFVF9MSVNUNjRfUFJJVkFURSwgRlVURVhfVU5M
T0NLX0JJVFNFVF9MSVNUMzIsCglhbmQgRlVURVhfVU5MT0NLX0JJVFNFVF9MSVNUMzJfUFJJVkFU
RSBkZWNvZGluZy4KCglBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQtNgoKMjAyNi0w
Ny0wNiAgRG1pdHJ5IFYuIExldmluICA8bGR2QHN0cmFjZS5pbz4KCgl4bGF0OiB1cGRhdGUgRlVU
RVhfKiBjb25zdGFudHMuCgkqIHNyYy94bGF0L2Z1dGV4b3BzLmluIChGVVRFWF9VTkxPQ0tfUElf
TElTVDY0LAoJRlVURVhfVU5MT0NLX1BJX0xJU1Q2NF9QUklWQVRFLCBGVVRFWF9VTkxPQ0tfUElf
TElTVDMyLAoJRlVURVhfVU5MT0NLX1BJX0xJU1QzMl9QUklWQVRFLCBGVVRFWF9VTkxPQ0tfV0FL
RV9MSVNUNjQsCglGVVRFWF9VTkxPQ0tfV0FLRV9MSVNUNjRfUFJJVkFURSwgRlVURVhfVU5MT0NL
X1dBS0VfTElTVDMyLAoJRlVURVhfVU5MT0NLX1dBS0VfTElTVDMyX1BSSVZBVEUsIEZVVEVYX1VO
TE9DS19CSVRTRVRfTElTVDY0LAoJRlVURVhfVU5MT0NLX0JJVFNFVF9MSVNUNjRfUFJJVkFURSwg
RlVURVhfVU5MT0NLX0JJVFNFVF9MSVNUMzIsCglGVVRFWF9VTkxPQ0tfQklUU0VUX0xJU1QzMl9Q
UklWQVRFKTogTmV3IGNvbnN0YW50cyBpbnRyb2R1Y2VkCglieSBMaW51eCBrZXJuZWwgY29tbWl0
IHY3LjItcmMxfjE5Nl4yfjEzLgoJKiBzcmMvZnV0ZXguYyAoRlVURVhfUk9CVVNUX1VOTE9DSywg
RlVURVhfUk9CVVNUX0xJU1QzMik6IEFkZAoJZmFsbGJhY2sgZGVmaW5pdGlvbnMuCgkqIHRlc3Rz
L2Z1dGV4LmM6IExpa2V3aXNlLgoJKiBORVdTOiBNZW50aW9uIHRoaXMgY2hhbmdlLgoKCUFzc2lz
dGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNC02CgoyMDI2LTA3LTA1ICBEbWl0cnkgVi4gTGV2
aW4gIDxsZHZAc3RyYWNlLmlvPgoKCXJ0bmxfbGluazogZGVjb2RlIElGTEFfQlJQT1JUX05FSUdI
X0ZPUldBUkRfR1JBVCBhdHRyaWJ1dGUuCgkqIHNyYy9ydG5sX2xpbmsuYyAoaWZsYV9icnBvcnRf
bmxhX2RlY29kZXJzKTogQWRkCglJRkxBX0JSUE9SVF9ORUlHSF9GT1JXQVJEX0dSQVQgZGVjb2Rl
ciBlbnRyeS4KCSogdGVzdHMvbmxhdHRyX2lmbGFfYnJwb3J0LmMgKG1haW4pOiBVcGRhdGUgZXhw
ZWN0ZWQgb3V0cHV0LgoJKiB0ZXN0cy9ubGF0dHJfaWZsYV9saW5raW5mby5jIChtYWluKTogTGlr
ZXdpc2UuCgkqIE5FV1M6IE1lbnRpb24gdGhpcyBjaGFuZ2UuCgoJQXNzaXN0ZWQtYnk6IENsYXVk
ZTpjbGF1ZGUtb3B1cy00LTYKCjIwMjYtMDctMDUgIERtaXRyeSBWLiBMZXZpbiAgPGxkdkBzdHJh
Y2UuaW8+CgoJeGxhdDogdXBkYXRlIElGTEFfQlJQT1JUXyogY29uc3RhbnRzLgoJKiBzcmMveGxh
dC9ydG5sX2lmbGFfYnJwb3J0X2F0dHJzLmluCgkoSUZMQV9CUlBPUlRfTkVJR0hfRk9SV0FSRF9H
UkFUKTogTmV3IGNvbnN0YW50IGludHJvZHVjZWQgYnkKCUxpbnV4IGtlcm5lbCBjb21taXQgdjcu
Mi1yYzF+MTQzXjJ+MzIwXjJ+NS4KCSogdGVzdHMvbmxhdHRyX2lmbGFfYnJwb3J0LmMgKG1haW4p
OiBVcGRhdGUgZXhwZWN0ZWQgb3V0cHV0LgoJKiB0ZXN0cy9ubGF0dHJfaWZsYV9saW5raW5mby5j
IChtYWluKTogTGlrZXdpc2UuCgkqIE5FV1M6IE1lbnRpb24gdGhpcyBjaGFuZ2UuCgoJQXNzaXN0
ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTYKCjIwMjYtMDctMDIgIERtaXRyeSBWLiBMZXZp
biAgPGxkdkBzdHJhY2UuaW8+CgoJeGxhdDogdXBkYXRlIFJURVhUX0ZJTFRFUl8qIGNvbnN0YW50
cy4KCSogc3JjL3hsYXQvcnRubF9pZmxhX2V4dF9maWx0ZXJfZmxhZ3MuaW4gKFJURVhUX0ZJTFRF
Ul9NU1QpOgoJTmV3IGNvbnN0YW50IGludHJvZHVjZWQgYnkgTGludXgga2VybmVsIGNvbW1pdCB2
NS4xOC1yYzF+MTM2XjJ+NTBeMn4xMi4KCShSVEVYVF9GSUxURVJfTkFNRV9PTkxZKTogTmV3IGNv
bnN0YW50IGludHJvZHVjZWQgYnkgTGludXgga2VybmVsCgljb21taXQgdjcuMi1yYzF+MTQzXjJ+
MzMxLgoJKiB0ZXN0cy9ubGF0dHJfaWZpbmZvbXNnLmMgKG1haW4pOiBVcGRhdGUgZXhwZWN0ZWQg
b3V0cHV0LgoJKiBORVdTOiBNZW50aW9uIHRoaXMgY2hhbmdlLgoKCUFzc2lzdGVkLWJ5OiBDbGF1
ZGU6Y2xhdWRlLW9wdXMtNC02CgoyMDI2LTA3LTAyICBEbWl0cnkgVi4gTGV2aW4gIDxsZHZAc3Ry
YWNlLmlvPgoKCXhsYXQ6IHVwZGF0ZSBYRlJNX01TR18qIGNvbnN0YW50cy4KCSogc3JjL3hsYXQv
bmxfeGZybV90eXBlcy5pbiAoWEZSTV9NU0dfTUlHUkFURV9TVEFURSk6IE5ldyBjb25zdGFudAoJ
aW50cm9kdWNlZCBieSBMaW51eCBrZXJuZWwgY29tbWl0IHY3LjItcmMxfjE0M14yfjQ1XjJeMn4y
LgoJKiBORVdTOiBNZW50aW9uIHRoaXMgY2hhbmdlLgoKCUFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xh
dWRlLW9wdXMtNC02CgoyMDI2LTA3LTAyICBEbWl0cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNlLmlv
PgoKCXhsYXQ6IHVwZGF0ZSBWNEwyX0NJRF8qIGNvbnN0YW50cy4KCSogc3JjL3hsYXQvdjRsMl9j
b250cm9sX2lkcy5pbgoJKFY0TDJfQ0lEX01QRUdfVklERU9fQkFDS0dST1VORF9ERVRFQ1RJT04p
OiBOZXcgY29uc3RhbnQKCWludHJvZHVjZWQgYnkgTGludXgga2VybmVsIGNvbW1pdCB2Ny4yLXJj
MX4xMDFeMn4zODcuCgkqIE5FV1M6IE1lbnRpb24gdGhpcyBjaGFuZ2UuCgoJQXNzaXN0ZWQtYnk6
IENsYXVkZTpjbGF1ZGUtb3B1cy00LTYKCjIwMjYtMDctMDIgIERtaXRyeSBWLiBMZXZpbiAgPGxk
dkBzdHJhY2UuaW8+CgoJeGxhdDogdXBkYXRlIEtWTV9DQVBfKiBjb25zdGFudHMuCgkqIHNyYy94
bGF0L2t2bV9jYXAuaW4gKEtWTV9DQVBfUzM5MF9IUEFHRV8yRyk6IE5ldyBjb25zdGFudAoJaW50
cm9kdWNlZCBieSBMaW51eCBrZXJuZWwgY29tbWl0IHY3LjItcmMxfjk1XjJ+NF4yfjEwLgoJKiBO
RVdTOiBNZW50aW9uIHRoaXMgY2hhbmdlLgoKCUFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9w
dXMtNC02CgoyMDI2LTA3LTAyICBEbWl0cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNlLmlvPgoKCXhs
YXQ6IHVwZGF0ZSBOTDgwMjExX0NNRF8qIGNvbnN0YW50cy4KCSogc3JjL3hsYXQvZ2VubF9ubDgw
MjExX2NtZC5pbiAoTkw4MDIxMV9DTURfU1RBUlRfUEQsCglOTDgwMjExX0NNRF9TVE9QX1BEKTog
TmV3IGNvbnN0YW50cyBpbnRyb2R1Y2VkIGJ5IExpbnV4IGtlcm5lbAoJY29tbWl0IHY3LjItcmMx
fjE0M14yfjM2OF4yfjQ4LgoJKiB0ZXN0cy9uZXRsaW5rX25sY3RybC5jICh0ZXN0X25sYV9vcHNf
ZmFtaWx5KTogQ2hlY2sgaXQuCgkqIE5FV1M6IE1lbnRpb24gdGhpcyBjaGFuZ2UuCgoJQXNzaXN0
ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTYKCjIwMjYtMDctMDIgIERtaXRyeSBWLiBMZXZp
biAgPGxkdkBzdHJhY2UuaW8+CgoJeGxhdDogdXBkYXRlIEVUSF9QXyogY29uc3RhbnRzLgoJKiBz
cmMveGxhdC9ldGhlcm5ldF9wcm90b2NvbHMuaW4gKEVUSF9QX0dSRV9PU0ksIEVUSF9QXzgwMjFB
QywKCUVUSF9QX05YUF9ORVRDKTogTmV3IGNvbnN0YW50cyBpbnRyb2R1Y2VkIGJ5IExpbnV4IGtl
cm5lbCBjb21taXQKCXY3LjItcmMxfjE0M14yfjExOS4KCSogTkVXUzogTWVudGlvbiB0aGlzIGNo
YW5nZS4KCglBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQtNgoKMjAyNi0wNy0wMiAg
RG1pdHJ5IFYuIExldmluICA8bGR2QHN0cmFjZS5pbz4KCgl4bGF0OiB1cGRhdGUgTEFORExPQ0tf
QUNDRVNTX05FVF8qIGNvbnN0YW50cy4KCSogc3JjL3hsYXQvbGFuZGxvY2tfcnVsZXNldF9hY2Nl
c3NfbmV0LmluCgkoTEFORExPQ0tfQUNDRVNTX05FVF9CSU5EX1VEUCk6IE5ldyBjb25zdGFudCBp
bnRyb2R1Y2VkIGJ5IExpbnV4CglrZXJuZWwgY29tbWl0IHY3LjItcmMxfjkxXjJ+MTQuCgkoTEFO
RExPQ0tfQUNDRVNTX05FVF9DT05ORUNUX1NFTkRfVURQKTogTmV3IGNvbnN0YW50IGludHJvZHVj
ZWQKCWJ5IExpbnV4IGtlcm5lbCBjb21taXQgdjcuMi1yYzF+OTFeMn4xMy4KCSogdGVzdHMvbGFu
ZGxvY2tfYWRkX3J1bGUuYyAobWFpbik6IFVwZGF0ZSBleHBlY3RlZCBvdXRwdXQuCgkqIHRlc3Rz
L2xhbmRsb2NrX2NyZWF0ZV9ydWxlc2V0LmMgKG1haW4pOiBMaWtld2lzZS4KCSogTkVXUzogTWVu
dGlvbiB0aGlzIGNoYW5nZS4KCglBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQtNgoK
MjAyNi0wNy0wMiAgRG1pdHJ5IFYuIExldmluICA8bGR2QHN0cmFjZS5pbz4KCgl4bGF0OiB1cGRh
dGUgRlNfWEZMQUdfKiBjb25zdGFudHMuCgkqIHNyYy94bGF0L2ZzX3hmbGFncy5pbiAoRlNfWEZM
QUdfQ0FTRUZPTEQsCglGU19YRkxBR19DQVNFTk9OUFJFU0VSVklORyk6IE5ldyBjb25zdGFudHMg
aW50cm9kdWNlZCBieSBMaW51eAoJa2VybmVsIGNvbW1pdCB2Ny4yLXJjMX4yMzFeMn4xXjJ+MTMu
CgkqIHRlc3RzL3Rlc3RfZnNfeGZsYWdzLmg6IFVwZGF0ZSBleHBlY3RlZCBvdXRwdXQuCgkqIE5F
V1M6IE1lbnRpb24gdGhpcyBjaGFuZ2UuCgoJQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1
cy00LTYKCjIwMjYtMDctMDIgIERtaXRyeSBWLiBMZXZpbiAgPGxkdkBzdHJhY2UuaW8+CgoJeGxh
dDogdXBkYXRlIE9fKiBjb25zdGFudHMuCgkqIHNyYy94bGF0L29wZW5fbW9kZV9mbGFncy5pbiAo
T19FTVBUWVBBVEgpOiBOZXcgY29uc3RhbnQKCWludHJvZHVjZWQgYnkgTGludXgga2VybmVsIGNv
bW1pdCB2Ny4yLXJjMX4yMjheMn40XjJ+MS4KCSogdGVzdHMvb3BlbmF0LmMgKG1haW4pOiBBZGQg
T19FTVBUWVBBVEggdG8gdGhlIGZsYWdzW10gYXJyYXkuCgkqIE5FV1M6IE1lbnRpb24gdGhpcyBj
aGFuZ2UuCgoJQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTYKCjIwMjYtMDctMDIg
IERtaXRyeSBWLiBMZXZpbiAgPGxkdkBzdHJhY2UuaW8+CgoJeGxhdDogdXBkYXRlIEJQRl8qIGNv
bnN0YW50cy4KCSogc3JjL3hsYXQvYnBmX21hcF90eXBlcy5pbiAoQlBGX01BUF9UWVBFX1JIQVNI
KTogTmV3IGNvbnN0YW50CglpbnRyb2R1Y2VkIGJ5IExpbnV4IGtlcm5lbCBjb21taXQgdjcuMi1y
YzF+MTQyXjJ+NTBeMn44LgoJKiBzcmMveGxhdC9icGZfYXR0YWNoX3R5cGUuaW4gKEJQRl9UUkFD
RV9GRU5UUllfTVVMVEksCglCUEZfVFJBQ0VfRkVYSVRfTVVMVEksIEJQRl9UUkFDRV9GU0VTU0lP
Tl9NVUxUSSk6IE5ldyBjb25zdGFudHMKCWludHJvZHVjZWQgYnkgTGludXgga2VybmVsIGNvbW1p
dCB2Ny4yLXJjMX4xNDJeMn4yOV4yfjE5LgoJKiBzcmMveGxhdC9icGZfbGlua19jcmVhdGVfdXBy
b2JlX211bHRpX2ZsYWdzLmluCgkoQlBGX0ZfVVBST0JFX01VTFRJX1BBVEhfRkQpOiBOZXcgY29u
c3RhbnQgaW50cm9kdWNlZCBieSBMaW51eAoJa2VybmVsIGNvbW1pdCB2Ny4yLXJjMX4xNDJeMn43
XjJ+NC4KCSogdGVzdHMvYnBmLmM6IFVwZGF0ZSBleHBlY3RlZCBvdXRwdXQuCgkqIE5FV1M6IE1l
bnRpb24gdGhpcyBjaGFuZ2UuCgoJQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTYK
CjIwMjYtMDctMDEgIERtaXRyeSBWLiBMZXZpbiAgPGxkdkBzdHJhY2UuaW8+CgoJZG9jL0hPV1RP
X1VQREFURV9YTEFUX0FGVEVSX1VBUEkubWQ6IGRvY3VtZW50IHhsYXQgdnMgZGVjb2RlciBjb21t
aXQgc2VwYXJhdGlvbgoJKiBkb2MvSE9XVE9fVVBEQVRFX1hMQVRfQUZURVJfVUFQSS5tZDogQWRk
IGd1aWRhbmNlIG9uIHJlYWRpbmcKCWtlcm5lbCBjb21taXRzIGZvciBuZXRsaW5rIGF0dHJpYnV0
ZSBkYXRhIHR5cGVzLCBzZXBhcmF0aW5nCglkZWNvZGVyIHVwZGF0ZXMgZnJvbSB4bGF0IHVwZGF0
ZXMgaW50byBmb2xsb3ctdXAgY29tbWl0cywgYW5kCglwbGFjaW5nIHRlc3QgZW50cmllcyBpbiB0
aGUgY29ycmVjdCBhcnJheSBiYXNlZCBvbiBkZWNvZGVyIHN0YXRlLgoKCUFzc2lzdGVkLWJ5OiBD
bGF1ZGU6Y2xhdWRlLW9wdXMtNC02CgoyMDI2LTA3LTAxICBEbWl0cnkgVi4gTGV2aW4gIDxsZHZA
c3RyYWNlLmlvPgoKCWRvYy9IT1dUT19VUERBVEVfWExBVF9BRlRFUl9VQVBJLm1kOiBkb2N1bWVu
dCB4bGF0LXRvLXRlc3QgbG9va3VwLgoJKiBkb2MvSE9XVE9fVVBEQVRFX1hMQVRfQUZURVJfVUFQ
SS5tZDogRG9jdW1lbnQgaG93IHRvIGZpbmQgdGhlCgl0ZXN0IGZpbGUgd2l0aCB0aGUgZGVuc2Vz
dCBjb3ZlcmFnZSBvZiBhIGdpdmVuIHhsYXQgYnkgZ3JlcHBpbmcKCWZvciBhbGwgY29uc3RhbnQg
bmFtZXMuCgoJQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTYKCjIwMjYtMDctMDEg
IERtaXRyeSBWLiBMZXZpbiAgPGxkdkBzdHJhY2UuaW8+CgoJZG9jL0hPV1RPX1VQREFURV9YTEFU
X0FGVEVSX1VBUEkubWQ6IGRvY3VtZW50IGJvdW5kYXJ5LXZhbHVlIHRlc3QgcGl0ZmFsbAoJKiBk
b2MvSE9XVE9fVVBEQVRFX1hMQVRfQUZURVJfVUFQSS5tZDogQWRkIHBpdGZhbGwgYWJvdXQKCWJv
dW5kYXJ5LXZhbHVlIHRlc3QgZW50cmllcyB0aGF0IHBhaXIgYSAibGFzdCBrbm93biIgY29uc3Rh
bnQgd2l0aAoJYSAiZmlyc3QgdW5rbm93biIgdmFsdWU6IHdoZW4gYWRkaW5nIG5ldyB4bGF0IGNv
bnN0YW50cywgc2hpZnQgYm90aAoJdGhlIG51bWVyaWMgZGF0YSB2YWx1ZXMgYW5kIGV4cGVjdGVk
IHN0cmluZ3MgaW5zdGVhZCBvZiBqdXN0Cgl1cGRhdGluZyB0aGUgZXhwZWN0ZWQgb3V0cHV0LgoK
CUFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNC02CgoyMDI2LTA3LTAxICBkZXBlbmRh
Ym90W2JvdF0gIDw0OTY5OTMzMytkZXBlbmRhYm90W2JvdF1AdXNlcnMubm9yZXBseS5naXRodWIu
Y29tPgoKCWJ1aWxkKGRlcHMpOiBidW1wIGFjdGlvbnMvY2hlY2tvdXQgZnJvbSA2LjAuMyB0byA3
LjAuMC4KCUJ1bXBzIFthY3Rpb25zL2NoZWNrb3V0XShodHRwczovL2dpdGh1Yi5jb20vYWN0aW9u
cy9jaGVja291dCkgZnJvbSA2LjAuMyB0byA3LjAuMC4KCS0gW1JlbGVhc2Ugbm90ZXNdKGh0dHBz
Oi8vZ2l0aHViLmNvbS9hY3Rpb25zL2NoZWNrb3V0L3JlbGVhc2VzKQoJLSBbQ2hhbmdlbG9nXSho
dHRwczovL2dpdGh1Yi5jb20vYWN0aW9ucy9jaGVja291dC9ibG9iL21haW4vQ0hBTkdFTE9HLm1k
KQoJLSBbQ29tbWl0c10oaHR0cHM6Ly9naXRodWIuY29tL2FjdGlvbnMvY2hlY2tvdXQvY29tcGFy
ZS9kZjRjYjFjMDY5ZTE4NzRlZGQzMWI0MzExZjE4ODQxNzJjZWMwZTEwLi4uOWMwOTFiYjIxYjdj
MWMxZDE5OTFiYjkwOGQ4OWU0ZTlkZGRmZTNlMCkKCgktLS0KCXVwZGF0ZWQtZGVwZW5kZW5jaWVz
OgoJLSBkZXBlbmRlbmN5LW5hbWU6IGFjdGlvbnMvY2hlY2tvdXQKCSAgZGVwZW5kZW5jeS12ZXJz
aW9uOiA3LjAuMAoJICBkZXBlbmRlbmN5LXR5cGU6IGRpcmVjdDpwcm9kdWN0aW9uCgkgIHVwZGF0
ZS10eXBlOiB2ZXJzaW9uLXVwZGF0ZTpzZW12ZXItbWFqb3IKCS4uLgoKMjAyNi0wNi0zMCAgRG1p
dHJ5IFYuIExldmluICA8bGR2QHN0cmFjZS5pbz4KCgl0ZXN0czogZml4IGJ1aWxkIG9mIGlvX3Vy
aW5nX3JlZ2lzdGVyIHRlc3Qgb24gcHBjNjRsZS4KCSogdGVzdHMvaW9fdXJpbmdfcmVnaXN0ZXIu
YyAodGVzdF9JT1JJTkdfUkVHSVNURVJfWkNSWF9JRlEpOgoJQ29uc2lzdGVudGx5IGNhc3Qgc3Ry
dWN0IGlvX3VyaW5nX3pjcnhfaWZxX3JlZy5ub3RpZl9kZXNjIHRvCgl1bnNpZ25lZCBsb25nIGxv
bmcuCgoJUmVzb2x2ZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9zdHJhY2Uvc3RyYWNlL2lzc3Vlcy80
MTAKCUZpeGVzOiB2Ny4xLTMzLWc3ODI1NWIyNWQgImlvX3VyaW5nOiB1cGRhdGUgZGVjb2Rpbmcg
b2Ygc3RydWN0IGlvX3VyaW5nX3pjcnhfaWZxX3JlZyIKCjIwMjYtMDYtMjkgIERtaXRyeSBWLiBM
ZXZpbiAgPGxkdkBzdHJhY2UuaW8+CgoJaW9fdXJpbmc6IHVwZGF0ZSBkZWNvZGluZyBvZiBzdHJ1
Y3QgaW9fdXJpbmdfemNyeF9pZnFfcmVnLgoJKiBidW5kbGVkL2xpbnV4L2luY2x1ZGUvdWFwaS9s
aW51eC9pb191cmluZy96Y3J4Lmg6IFVwZGF0ZSB0bwoJaGVhZGVyc19pbnN0YWxsJ2VkIExpbnV4
IGtlcm5lbCB2Ny4yLXJjMS4KCSogc3JjL2lvX3VyaW5nLmMgKHByaW50X2lvX3VyaW5nX3pjcnhf
aWZxX3JlZyk6IERlY29kZQoJc3RydWN0IGlvX3VyaW5nX3pjcnhfaWZxX3JlZy5ub3RpZl9kZXNj
IGludHJvZHVjZWQgYnkgTGludXgga2VybmVsCgljb21taXQgdjcuMi1yYzF+MTUyXjJ+MTkuCgkq
IHRlc3RzL2lvX3VyaW5nX3JlZ2lzdGVyLmMgKG1haW4pOiBDaGVjayBpdC4KCjIwMjYtMDYtMjkg
IERtaXRyeSBWLiBMZXZpbiAgPGxkdkBzdHJhY2UuaW8+CgoJYnVuZGxlZDogdXBkYXRlIGxpbnV4
IFVBUEkgaGVhZGVycyB0byB2Ny4yLXJjMS4KCVRoZSB1cGRhdGUgb2YgbGludXgvaW9fdXJpbmcv
emNyeC5oIGlzIGRlbGF5ZWQgYmVjYXVzZSB0aGUgY2hhbmdlCglpbiBzdHJ1Y3QgaW9fdXJpbmdf
emNyeF9pZnFfcmVnIHJlcXVpcmVzIGEgc3luY2hyb25vdXMgdXBkYXRlIG9mCgl0aGUgaGVhZGVy
LCB0aGUgcGFyc2VyIGFuZCB0aGUgdGVzdC4KCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBp
L2FzbS1nZW5lcmljL2ZjbnRsLmg6IFVwZGF0ZSB0bwoJaGVhZGVyc19pbnN0YWxsJ2VkIExpbnV4
IGtlcm5lbCB2Ny4yLXJjMS4KCSogYnVuZGxlZC9saW51eC9pbmNsdWRlL3VhcGkvbGludXgvYnRy
ZnMuaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBpL2xpbnV4L2Rldmxp
bmsuaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBpL2xpbnV4L2V0aHRv
b2wuaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBpL2xpbnV4L2ZzLmg6
IExpa2V3aXNlLgoJKiBidW5kbGVkL2xpbnV4L2luY2x1ZGUvdWFwaS9saW51eC9mdXRleC5oOiBM
aWtld2lzZS4KCSogYnVuZGxlZC9saW51eC9pbmNsdWRlL3VhcGkvbGludXgvaWZfYnJpZGdlLmg6
IExpa2V3aXNlLgoJKiBidW5kbGVkL2xpbnV4L2luY2x1ZGUvdWFwaS9saW51eC9pZl9ldGhlci5o
OiBMaWtld2lzZS4KCSogYnVuZGxlZC9saW51eC9pbmNsdWRlL3VhcGkvbGludXgvaWZfbGluay5o
OiBMaWtld2lzZS4KCSogYnVuZGxlZC9saW51eC9pbmNsdWRlL3VhcGkvbGludXgvaW9fdXJpbmcv
cXVlcnkuaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBpL2xpbnV4L2xh
bmRsb2NrLmg6IExpa2V3aXNlLgoJKiBidW5kbGVkL2xpbnV4L2luY2x1ZGUvdWFwaS9saW51eC9u
ZXRkZXYuaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBpL2xpbnV4L25s
ODAyMTEuaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBpL2xpbnV4L29w
ZW5hdDIuaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBpL2xpbnV4L3Br
dF9zY2hlZC5oOiBMaWtld2lzZS4KCSogYnVuZGxlZC9saW51eC9pbmNsdWRlL3VhcGkvbGludXgv
cnRuZXRsaW5rLmg6IExpa2V3aXNlLgoJKiBidW5kbGVkL2xpbnV4L2luY2x1ZGUvdWFwaS9saW51
eC90bHMuaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBpL2xpbnV4L3Y0
bDItY29udHJvbHMuaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBpL2xp
bnV4L3ZlcnNpb24uaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBpL3Jk
bWEvaWJfdXNlcl92ZXJicy5oOiBMaWtld2lzZS4KCSogYnVuZGxlZC9saW51eC9hcmNoL2FscGhh
L2luY2x1ZGUvdWFwaS9hc20vZmNudGwuaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvYXJj
aC9hcm0vaW5jbHVkZS91YXBpL2FzbS9mY250bC5oOiBMaWtld2lzZS4KCSogYnVuZGxlZC9saW51
eC9hcmNoL2FybTY0L2luY2x1ZGUvdWFwaS9hc20vZmNudGwuaDogTGlrZXdpc2UuCgkqIGJ1bmRs
ZWQvbGludXgvYXJjaC9tNjhrL2luY2x1ZGUvdWFwaS9hc20vZmNudGwuaDogTGlrZXdpc2UuCgkq
IGJ1bmRsZWQvbGludXgvYXJjaC9taXBzL2luY2x1ZGUvdWFwaS9hc20vZmNudGwuaDogTGlrZXdp
c2UuCgkqIGJ1bmRsZWQvbGludXgvYXJjaC9wYXJpc2MvaW5jbHVkZS91YXBpL2FzbS9mY250bC5o
OiBMaWtld2lzZS4KCSogYnVuZGxlZC9saW51eC9hcmNoL3Bvd2VycGMvaW5jbHVkZS91YXBpL2Fz
bS9mY250bC5oOiBMaWtld2lzZS4KCSogYnVuZGxlZC9saW51eC9hcmNoL3NwYXJjL2luY2x1ZGUv
dWFwaS9hc20vZmNudGwuaDogTGlrZXdpc2UuCgoyMDI2LTA2LTI3ICBEbWl0cnkgVi4gTGV2aW4g
IDxsZHZAc3RyYWNlLmlvPgoKCWRvYy9SRUFETUUtYnVuZGxlZC5tZCwgYnVuZGxlZC9SRUFETUUu
bWQ6IHJldmVyc2Ugc3ltbGluayBkaXJlY3Rpb24uCgkqIGRvYy9SRUFETUUtYnVuZGxlZC5tZDog
TW92ZSBmcm9tIGJ1bmRsZWQvUkVBRE1FLm1kICh3YXMgcmVhbCBmaWxlLAoJbm93IHN5bWxpbmsg
dGFyZ2V0KS4gIENvbnNvbGlkYXRlcyByZWZlcmVuY2UgZG9jdW1lbnRhdGlvbiBpbiBkb2MvLgoJ
KiBkb2MvR0xPU1NBUlkubWQgKGJ1bmRsZWQgaGVhZGVycyk6IENoYW5nZSBidW5kbGVkL1JFQURN
RS5tZCB0bwoJZG9jL1JFQURNRS1idW5kbGVkLm1kLgoJKiBkb2MvUkVBRE1FLm1kIChTdWJzeXN0
ZW0gRG9jdW1lbnRhdGlvbik6IExpa2V3aXNlLgoJKiBidW5kbGVkL1JFQURNRS5tZDogQ2hhbmdl
IHRvIHN5bWxpbmsgcG9pbnRpbmcgdG8KCS4uL2RvYy9SRUFETUUtYnVuZGxlZC5tZC4gIFByb3Zp
ZGVzIGNvbnZlbmllbnQgYWNjZXNzIGZvciBkZXZlbG9wZXJzCgl3b3JraW5nIGluIGJ1bmRsZWQv
IGRpcmVjdG9yeS4KCglBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQtNgoKMjAyNi0w
Ni0yNiAgRG1pdHJ5IFYuIExldmluICA8bGR2QHN0cmFjZS5pbz4KCglidW5kbGVkOiB1cGRhdGUg
bGludXggVUFQSSBoZWFkZXJzIHRvIHY3LjEuCglIZWFkZXJzIHVwZGF0ZWQgYXV0b21hdGljYWxs
eSB1c2luZyB1cGRhdGUtYnVuZGxlZC1oZWFkZXJzLnNoIHNjcmlwdC4KCgkqIGJ1bmRsZWQvbGlu
dXgvaW5jbHVkZS91YXBpL2xpbnV4L2JzZy5oOiBVcGRhdGUgdG8KCWhlYWRlcnNfaW5zdGFsbCdl
ZCBMaW51eCBrZXJuZWwgdjcuMS4KCSogYnVuZGxlZC9saW51eC9pbmNsdWRlL3VhcGkvbGludXgv
ZnMuaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBpL2xpbnV4L25ldGZp
bHRlci9uZl90YWJsZXMuaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBp
L2xpbnV4L25ldGxpbmsuaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBp
L2xpbnV4L25zZnMuaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBpL2xp
bnV4L3BpZGZkLmg6IExpa2V3aXNlLgoJKiBidW5kbGVkL2xpbnV4L2luY2x1ZGUvdWFwaS9saW51
eC9wa3Rfc2NoZWQuaDogTGlrZXdpc2UuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBpL2xp
bnV4L3N0ZGRlZi5oOiBMaWtld2lzZS4KCSogYnVuZGxlZC9saW51eC9pbmNsdWRlL3VhcGkvbGlu
dXgvdHlwZWxpbWl0cy5oOiBMaWtld2lzZS4KCSogYnVuZGxlZC9saW51eC9hcmNoL21pcHMvaW5j
bHVkZS91YXBpL2FzbS9mY250bC5oOiBMaWtld2lzZS4KCjIwMjYtMDYtMjYgIERtaXRyeSBWLiBM
ZXZpbiAgPGxkdkBzdHJhY2UuaW8+CgoJbWFpbnQ6IGFkZCBzY3JpcHRzIGZvciB1cGRhdGluZyBi
dW5kbGVkIExpbnV4IFVBUEkgaGVhZGVycy4KCSogbWFpbnQvZml4LXdoaXRlc3BhY2Uuc2g6IE5l
dyBmaWxlLCBhIGhlbHBlciBzY3JpcHQgdGhhdCBmaXhlcwoJZ2l0IHdoaXRlc3BhY2UgaXNzdWVz
ICh0cmFpbGluZyB3aGl0ZXNwYWNlLCBzcGFjZSBiZWZvcmUgdGFiIGluCglpbmRlbnQsIHRyYWls
aW5nIGJsYW5rIGxpbmVzIGF0IEVPRikgaW4gdGhlIHNwZWNpZmllZCBmaWxlcy4KCSogbWFpbnQv
dXBkYXRlLWJ1bmRsZWQtaGVhZGVycy5zaDogTmV3IGZpbGUsIGEgc2NyaXB0IHRoYXQKCWF1dG9t
YXRlcyB1cGRhdGluZyBidW5kbGVkIFVBUEkgaGVhZGVycyBmcm9tIGEgY2hlY2tlZC1vdXQgTGlu
dXgKCWtlcm5lbCB0cmVlIGJ5IHJ1bm5pbmcgbWFrZSBoZWFkZXJzX2luc3RhbGwgYW5kIGNvcHlp
bmcgc2FuaXRpemVkCgloZWFkZXJzIHRvIHRoZSBidW5kbGVkLyBkaXJlY3RvcnkuCgoJQXNzaXN0
ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTYKCjIwMjYtMDYtMjUgIERtaXRyeSBWLiBMZXZp
biAgPGxkdkBzdHJhY2UuaW8+CgoJZG9jOiB1cGRhdGUgZG9jdW1lbnRhdGlvbiBmb3IgcHJpbnRf
ZmllbGRzIHJlZmFjdG9yaW5nLgoJKiBkb2MvSU5URVJOQUxTLm1kIChLZXkgRmlsZXMpOiBVcGRh
dGUgcHJpbnRfZmllbGRzLmggZGVzY3JpcHRpb24sCglhZGQgcHJpbnRfZmllbGRzLmMuCgkqIGRv
Yy9ERUNPREVSX0FQSS5tZCAoRnVuY3Rpb24tQ2FsbCBEZWxpbWl0ZXJzKTogRG9jdW1lbnQKCXRw
cmludHNfZm5fYmVnaW4sIHRwcmludF9mbl9uZXh0LCBhbmQgdHByaW50X2ZuX2VuZCBwcmludGVy
cyBmb3IKCWNhbGwtc3R5bGUgZGVjb2RlciBvdXRwdXQsIGNsYXJpZnkgZGlzdGluY3Rpb24gZnJv
bSB0cHJpbnRzX2FyZ19iZWdpbgoJYW5kIHRwcmludF9hcmdfZW5kLgoJKFNlZSBBbHNvKTogVXBk
YXRlIHByaW50X2ZpZWxkcy5oIGRlc2NyaXB0aW9uLCBhZGQgcHJpbnRfZmllbGRzLmMuCgoJQXNz
aXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTYKCjIwMjYtMDYtMjUgIEdhYmkgRmFsayAg
PGdhYmlmYWxrQGdteC5jb20+CgoJQ29sb3JpemUgY2FsbC1zdHlsZSBkZWNvZGVyIG91dHB1dCBz
ZXBhcmF0ZWx5IGZyb20gc3lzY2FsbCBuYW1lcy4KCSogc3JjL2NvbG9yLmggKGVudW0gY29sb3Jf
a2luZF90KTogQWRkIENPTE9SX0NBTEwuCgkqIHNyYy9jb2xvci5jIChjb2xvcl9rZXlzKTogQWRk
IENBTEwuCgkoY29sb3Jfc2VxX3RhYmxlX2RlZmF1bHQpOiBBZGQgQ0FMTCBlbnRyeSwgbWF0Y2hp
bmcgdGhlIGRlZmF1bHQKCVNZU0NBTEwgY29sb3Igc28gdGhlIGRlZmF1bHQgYXBwZWFyYW5jZSBp
cyB1bmNoYW5nZWQuCgkqIHNyYy9wcmludF9maWVsZHMuaCAoQ09MT1JfQ0FMTCkgWyFJTl9TVFJB
Q0VdOiBOZXcgbWFjcm8uCgkqIHNyYy9wcmludF9maWVsZHMuYyAodHByaW50c19jYWxsX2JlZ2lu
KTogVXNlIENPTE9SX0NBTEwgaW5zdGVhZCBvZgoJQ09MT1JfU1lTQ0FMTC4KCSogZG9jL3N0cmFj
ZS4xLmluOiBEb2N1bWVudCB0aGUgY2FsbCBjb2xvciBrZXkuCgkqIE5FV1M6IE1lbnRpb24gdGhp
cyBjaGFuZ2UuCgoJQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtZmFibGUtNQoKMjAyNi0wNi0y
NSAgR2FiaSBGYWxrICA8Z2FiaWZhbGtAZ214LmNvbT4KCglJbnRyb2R1Y2Ugc2VwYXJhdGUgcHJp
bnRlcnMgZm9yIGNhbGwtc3R5bGUgZGVjb2RlciBvdXRwdXQuCglDYWxsLXN0eWxlIGRlY29kZXIg
b3V0cHV0IGxpa2UgaHRvbnMoLi4uKSBvciBfSU9DKC4uLikgc2hhcmVzIHRoZQoJdHByaW50X2Fy
Z18qIHByaW50ZXJzIHdpdGggdGhlIHN5c2NhbGwgYXJndW1lbnQgZnJhbWluZywgYnV0IHRoZQoJ
dXBjb21pbmcgc3RydWN0dXJlZCBvdXRwdXQgbW9kZSB0cmVhdHMgdGhlIHR3byBkaWZmZXJlbnRs
eS4gIEdpdmUgaXQKCWl0cyBvd24gdHByaW50c19mbl9iZWdpbiwgdHByaW50X2ZuX25leHQsIGFu
ZCB0cHJpbnRfZm5fZW5kIHByaW50ZXJzLAoJY2hhbmdpbmcgb25seSB0aGUgZGVjb2RlcnMgdGhh
dCBlbWl0IHN1Y2ggb3V0cHV0IGFuZCBsZWF2aW5nIHRoZQoJc3lzY2FsbCBhcmd1bWVudCBmcmFt
aW5nIG9uIHRwcmludF9hcmdfKi4KCglObyBjaGFuZ2UgaW4gb3V0cHV0LgoKCSogc3JjL3ByaW50
X2ZpZWxkcy5jICh0cHJpbnRzX2ZuX2JlZ2luLCB0cHJpbnRfZm5fbmV4dCwgdHByaW50X2ZuX2Vu
ZCk6CglOZXcgZnVuY3Rpb25zLgoJKiBzcmMvcHJpbnRfZmllbGRzLmggKHRwcmludHNfZm5fYmVn
aW4sIHRwcmludF9mbl9uZXh0LCB0cHJpbnRfZm5fZW5kKToKCURlY2xhcmUuCgkoUFJJTlRfRklF
TERfTkVUX1BPUlQpOiBVc2UgdHByaW50c19mbl9iZWdpbiBhbmQgdHByaW50X2ZuX2VuZCBpbnN0
ZWFkCglvZiB0cHJpbnRzX2FyZ19iZWdpbiBhbmQgdHByaW50X2FyZ19lbmQuCgkqIHNyYy9icGZf
ZmlsdGVyLmMgKHByaW50X2JwZl9maWx0ZXJfc3RtdCwgcHJpbnRfYnBmX2ZpbHRlcl9qdW1wKTog
VXNlCgl0cHJpbnRzX2ZuX2JlZ2luLCB0cHJpbnRfZm5fbmV4dCwgYW5kIHRwcmludF9mbl9lbmQg
aW5zdGVhZCBvZgoJdHByaW50c19hcmdfYmVnaW4sIHRwcmludF9hcmdfbmV4dCwgYW5kIHRwcmlu
dF9hcmdfZW5kLgoJKiBzcmMvaW9jdGwuYyAoaW9jdGxfcHJpbnRfY29kZSwgZXZkZXZfZGVjb2Rl
X251bWJlciwKCWhpZGRldl9kZWNvZGVfbnVtYmVyLCBpb2N0bF9kZWNvZGVfY29tbWFuZF9udW1i
ZXIpOiBMaWtld2lzZS4KCSogc3JjL2tkX2lvY3RsLmMgKGtkX2tiZF9lbnRyeSk6IExpa2V3aXNl
LgoJKiBzcmMvbmV0LmMgKFNZU19GVU5DKHNvY2tldCkpOiBMaWtld2lzZS4KCSogc3JjL25ldGxp
bmtfa29iamVjdF91ZXZlbnQuYyAoUFJJTlRfRklFTERfSFRPTkxfWCk6IExpa2V3aXNlLgoJKiBz
cmMvbmV0bGlua19uZXRmaWx0ZXIuYyAoZGVjb2RlX25ldGxpbmtfbmV0ZmlsdGVyKTogTGlrZXdp
c2UuCgkqIHNyYy9ubGF0dHIuYyAoZGVjb2RlX25sYV94dmFsLCBkZWNvZGVfbmxhX2ZsYWdzLCBk
ZWNvZGVfbmxhX2JlMTYsCglkZWNvZGVfbmxhX2JlMzIsIGRlY29kZV9ubGFfYmU2NCk6IExpa2V3
aXNlLgoJKiBzcmMvcHJpbnRfZGV2X3QuYyAocHJpbnRfZGV2X3QpOiBMaWtld2lzZS4KCSogc3Jj
L3ByaW50X2tlcm5lbF92ZXJzaW9uLmMgKHByaW50X2tlcm5lbF92ZXJzaW9uKTogTGlrZXdpc2Uu
CgkqIHNyYy9xdW90YS5jIChwcmludF9xY21kKTogTGlrZXdpc2UuCgkqIHNyYy9ydG5sX2xpbmsu
YyAoZGVjb2RlX2lmbGFfdmZfdmxhbl9pbmZvKTogTGlrZXdpc2UuCgkqIHNyYy9ydG5sX21kYi5j
IChkZWNvZGVfbWRiYV9tZGJfZW50cnlfaW5mbyk6IExpa2V3aXNlLgoJKiBzcmMvc29ja2FkZHIu
YyAocHJpbnRfaW5ldF9hZGRyLCBwcmludF9zb2NrYWRkcl9kYXRhX2luNiwKCXByaW50X3NvY2th
ZGRyX2RhdGFfaXB4LCBwcmludF9zbGxfcHJvdG9jb2wsIHByaW50X2JsdWV0b290aF9sMl9wc20s
CglwcmludF9ibHVldG9vdGhfbDJfY2lkLCBwcmludF9zb2NrYWRkcl9kYXRhX2J0KTogTGlrZXdp
c2UuCgkqIHNyYy90aW1lLmMgKHByaW50Y2xvY2tuYW1lKTogTGlrZXdpc2UuCgkqIHNyYy92NGwy
LmMgKHByaW50X3BpeGVsZm9ybWF0KTogTGlrZXdpc2UuCgoJQXNzaXN0ZWQtYnk6IENsYXVkZTpj
bGF1ZGUtb3B1cy00LTgKCjIwMjYtMDYtMjUgIEdhYmkgRmFsayAgPGdhYmlmYWxrQGdteC5jb20+
CgoJU3RvcCBpbmxpbmluZyBub24tdHJpdmlhbCBwcmludF9maWVsZHMuaCBwcmludGVycy4KCVNp
bmNlIGNvbW1pdCB2Ny4wfjMyICJJbXBsZW1lbnQgb3B0aW9uYWwgY29sb3JpemVkIHRyYWNlIG91
dHB1dCIgdGhlc2UKCXN0YXRpYyBpbmxpbmUgcHJpbnRlcnMgZXhwYW5kIHNldmVyYWwgY29waWVz
IG9mIHRwcmludF9jb2xvcl9zZXEgYXQKCWVhY2ggb2YgdGhlaXIgdGhvdXNhbmRzIG9mIGNhbGwg
c2l0ZXMsIHdoaWNoIGdyZXcgdGhlIC50ZXh0IHNlY3Rpb24gb2YKCXRoZSBzdHJhY2UgZXhlY3V0
YWJsZSAoeDg2XzY0LCBnY2MgLU8yKSBmcm9tIDE3OTQwOTkgdG8gMjkzMDAzNiBieXRlcy4KCglN
b3ZlIHRoZWlyIGJvZGllcyBpbnRvIHRoZSBuZXcgcHJpbnRfZmllbGRzLmMgYW5kIG9ubHkgZGVj
bGFyZSB0aGVtIGluCgl0aGUgaGVhZGVyLCBzbyB0aGV5IGFyZSBlbWl0dGVkIG9uY2U7IC50ZXh0
IHNocmlua3MgdG8gMTY2MTE2NCBieXRlcy4KCVRoZSB0ZXN0cywgd2hpY2ggY2Fubm90IGxpbmsg
YWdhaW5zdCBzdHJhY2UsIGdldCBwbGFpbiBjb2xvcmxlc3MgY29waWVzCglvZiB0aGUgZmV3IHBy
aW50ZXJzIHRoZXkgdXNlIGluIHRlc3RzL3ByaW50X2ZpZWxkcy5jLgoKCSogc3JjL3ByaW50X2Zp
ZWxkcy5jOiBOZXcgZmlsZS4KCSh0cHJpbnRfc3RydWN0X2JlZ2luLCB0cHJpbnRfc3RydWN0X25l
eHQsIHRwcmludF9zdHJ1Y3RfZW5kLAoJdHByaW50X3VuaW9uX2JlZ2luLCB0cHJpbnRfdW5pb25f
bmV4dCwgdHByaW50X3VuaW9uX2VuZCwKCXRwcmludF9hcnJheV9iZWdpbiwgdHByaW50X2FycmF5
X25leHQsIHRwcmludF9hcnJheV9lbmQsCgl0cHJpbnRfYXJyYXlfaW5kZXhfYmVnaW4sIHRwcmlu
dF9hcnJheV9pbmRleF9lcXVhbCwgdHByaW50c19hcmdfYmVnaW4sCgl0cHJpbnRfYXJnX25leHQs
IHRwcmludF9hcmdfZW5kLCB0cHJpbnRzX2FyZ19uYW1lX3VuY29uZGl0aW9uYWxseSwKCXRwcmlu
dHNfYXJnX25leHRfbmFtZV91bmNvbmRpdGlvbmFsbHksIHRwcmludHNfYXJnX25hbWUsCgl0cHJp
bnRzX2FyZ19uZXh0X25hbWUsIHRwcmludF9iaXRzZXRfYmVnaW4sIHRwcmludF9iaXRzZXRfbmV4
dCwKCXRwcmludF9iaXRzZXRfZW5kLCB0cHJpbnRfY29tbWVudF9iZWdpbiwgdHByaW50X2NvbW1l
bnRfZW5kLAoJdHByaW50X2luZGlyZWN0X2JlZ2luLCB0cHJpbnRfaW5kaXJlY3RfZW5kLCB0cHJp
bnRfYXR0cmlidXRlX2JlZ2luLAoJdHByaW50X2F0dHJpYnV0ZV9lbmQsIHRwcmludF9hc3NvY2lh
dGVkX2luZm9fYmVnaW4sCgl0cHJpbnRfYXNzb2NpYXRlZF9pbmZvX2VuZCwgdHByaW50X21vcmVf
ZGF0YV9mb2xsb3dzLAoJdHByaW50X3ZhbHVlX2NoYW5nZWQsIHRwcmludF9hbHRlcm5hdGl2ZV92
YWx1ZSwgdHByaW50X3VuYXZhaWxhYmxlLAoJdHByaW50X2ZsYWdzX29yLCB0cHJpbnRfbmV3bGlu
ZSwgdHByaW50c19maWVsZF9uYW1lLAoJdHByaW50X3N5c3JldF9iZWdpbiwgdHByaW50c19zeXNy
ZXRfbmV4dCwgdHByaW50c19zeXNyZXRfc3RyaW5nLAoJdHByaW50X3N5c3JldF9lbmQpOiBNb3Zl
IGhlcmUgZnJvbSBwcmludF9maWVsZHMuaCwgd2l0aCBleHRlcm5hbAoJbGlua2FnZS4KCSogc3Jj
L3ByaW50X2ZpZWxkcy5oOiBEZWNsYXJlIHRoZSBtb3ZlZCBwcmludGVycyBpbnN0ZWFkIG9mIGRl
ZmluaW5nCgl0aGVtLgoJKiBzcmMvTWFrZWZpbGUuYW0gKGxpYnN0cmFjZV9hX1NPVVJDRVMpOiBB
ZGQgcHJpbnRfZmllbGRzLmMuCgkqIHRlc3RzL3ByaW50X2ZpZWxkcy5jOiBOZXcgZmlsZS4KCSh0
cHJpbnRzX2ZpZWxkX25hbWUsIHRwcmludF9hcnJheV9iZWdpbiwgdHByaW50X2FycmF5X25leHQs
Cgl0cHJpbnRfYXJyYXlfZW5kKTogTmV3IGNvbG9ybGVzcyBjb3BpZXMgZm9yIHRoZSB0ZXN0cy4K
CSogdGVzdHMvTWFrZWZpbGUuYW0gKGxpYnRlc3RzX2FfU09VUkNFUyk6IEFkZCBwcmludF9maWVs
ZHMuYy4KCglBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1mYWJsZS01CgoyMDI2LTA2LTI0ICBE
bWl0cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNlLmlvPgoKCUFkZCBBR0VOVFMubWQuCgkqIEFHRU5U
Uy5tZDogTmV3IGZpbGUg4oCUIGd1aWRhbmNlIGZvciBBSSBhZ2VudHMuCgkqIENMQVVERS5tZDog
TmV3IHN5bWxpbmsgdG8gQUdFTlRTLm1kLgoKCUFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9w
dXMtNC02CgoyMDI2LTA2LTI0ICBEbWl0cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNlLmlvPgoKCWRv
Yy9HTE9TU0FSWS5tZDogYWRkIElOVEVSTkFMUy5tZCByZWZlcmVuY2VzLgoJKiBkb2MvR0xPU1NB
UlkubWQgKHRjYiwgc3lzZW50KTogQWRkIElOVEVSTkFMUy5tZCByZWZlcmVuY2UuCgoJQ09OVFJJ
QlVUSU5HLm1kOiBhZGQgYSBub3RlIGFib3V0IEFJLWFzc2lzdGVkIGNvbnRyaWJ1dGlvbnMuCgkq
IENPTlRSSUJVVElORy5tZCAoQUktYXNzaXN0ZWQgQ29udHJpYnV0aW9ucyk6IE5ldyBzZWN0aW9u
LgoKMjAyNi0wNi0yMyAgRG1pdHJ5IFYuIExldmluICA8bGR2QHN0cmFjZS5pbz4KCglBZGQgYnVu
ZGxlZC9SRUFETUUubWQuCgkqIGJ1bmRsZWQvUkVBRE1FLm1kOiBOZXcgZmlsZSDigJQgZG9jdW1l
bnRhdGlvbiBmb3IgYnVuZGxlZCBMaW51eCBVQVBJCgloZWFkZXJzLgoJKiBkb2MvUkVBRE1FLm1k
OiBBZGQgYnVuZGxlZC9SRUFETUUubWQgZW50cnkuCgkqIGRvYy9HTE9TU0FSWS5tZCAoYnVuZGxl
ZCBoZWFkZXJzKTogQWRkIHJlZmVyZW5jZSB0byBidW5kbGVkL1JFQURNRS5tZC4KCglBc3Npc3Rl
ZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTQtNgoKMjAyNi0wNi0yMyAgRG1pdHJ5IFYuIExldmlu
ICA8bGR2QHN0cmFjZS5pbz4KCglBZGQgZG9jL0hPV1RPX0FERF9ORVRMSU5LLm1kLgoJKiBkb2Mv
SE9XVE9fQUREX05FVExJTksubWQ6IE5ldyBmaWxlIOKAlCBjb21wcmVoZW5zaXZlIGd1aWRlIHRv
IGFkZGluZwoJbmV0bGluayBwcm90b2NvbCBmYW1pbHkgZGVjb2RlcnMuCgkqIGRvYy9SRUFETUUu
bWQ6IEFkZCBIT1dUT19BRERfTkVUTElOSy5tZCBlbnRyeS4KCSogZG9jL0lOVEVSTkFMUy5tZDog
QWRkIEhPV1RPX0FERF9ORVRMSU5LLm1kIHJlZmVyZW5jZS4KCglBc3Npc3RlZC1ieTogQ2xhdWRl
OmNsYXVkZS1vcHVzLTQtNgoKMjAyNi0wNi0yMyAgRG1pdHJ5IFYuIExldmluICA8bGR2QHN0cmFj
ZS5pbz4KCglBZGQgZG9jL0hPV1RPX0FERF9JT0NUTC5tZC4KCSogZG9jL0hPV1RPX0FERF9JT0NU
TC5tZDogTmV3IGZpbGUg4oCUIGNvbXByZWhlbnNpdmUgZ3VpZGUgdG8gYWRkaW5nIGlvY3RsCglk
ZWNvZGVycyBmb3IgZGV2aWNlLXNwZWNpZmljIGlvY3RsIGNvbW1hbmRzLgoJKiBkb2MvUkVBRE1F
Lm1kOiBBZGQgSE9XVE9fQUREX0lPQ1RMLm1kIGVudHJ5LgoJKiBkb2MvREVDT0RFUl9BUEkubWQ6
IEFkZCBIT1dUT19BRERfSU9DVEwubWQgcmVmZXJlbmNlcy4KCSogZG9jL0dMT1NTQVJZLm1kOiBB
ZGQgSE9XVE9fQUREX0lPQ1RMLm1kIHJlZmVyZW5jZS4KCSogZG9jL0lOVEVSTkFMUy5tZDogTGlr
ZXdpc2UuCgkqIGRvYy9IT1dUT19URVNULm1kOiBMaWtld2lzZS4KCglBc3Npc3RlZC1ieTogQ2xh
dWRlOmNsYXVkZS1vcHVzLTQtNgoKMjAyNi0wNi0yMiAgRG1pdHJ5IFYuIExldmluICA8bGR2QHN0
cmFjZS5pbz4KCglSRUFETUUtaGFja2luZzogdXBkYXRlLgoJKiBSRUFETUUtaGFja2luZzogRXhw
YW5kZWQgc2VjdGlvbiBoZWFkZXJzLCBjbGFyaWZpZWQgd29ya2Zsb3dzLCBhZGRlZAoJY3Jvc3Mt
cmVmZXJlbmNlcyB0byBkZXZlbG9wZXIgZG9jdW1lbnRhdGlvbiwgYW5kIHJlb3JnYW5pemVkIGNv
bnRlbnQgZm9yCgliZXR0ZXIgZGlzY292ZXJhYmlsaXR5LgoKCUFzc2lzdGVkLWJ5OiBDbGF1ZGU6
Y2xhdWRlLW9wdXMtNC02CgoyMDI2LTA2LTIyICBEbWl0cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNl
LmlvPgoKCUFkZCBkb2MvSE9XVE9fVEVTVC5tZC4KCSogZG9jL0hPV1RPX1RFU1QubWQ6IE5ldyBm
aWxlIOKAlCBjb21wcmVoZW5zaXZlIGd1aWRlIHRvIHdyaXRpbmcsIHJ1bm5pbmcsCglhbmQgZGVi
dWdnaW5nIHRlc3RzIGluIHN0cmFjZS4KCSogZG9jL1JFQURNRS5tZDogQWRkIEhPV1RPX1RFU1Qu
bWQgZW50cnkuCgkqIENPTlRSSUJVVElORy5tZCAoVGVzdGluZyk6IEFkZCByZWZlcmVuY2UgdG8g
ZG9jL0hPV1RPX1RFU1QubWQuCgoJQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtb3B1cy00LTYK
CjIwMjYtMDYtMjIgIERtaXRyeSBWLiBMZXZpbiAgPGxkdkBzdHJhY2UuaW8+CgoJQWRkIGRvYy9J
TlRFUk5BTFMubWQuCgkqIGRvYy9JTlRFUk5BTFMubWQ6IE5ldyBmaWxlIOKAlCBhcmNoaXRlY3R1
cmFsIG92ZXJ2aWV3IG9mIGhvdyBzdHJhY2Ugd29ya3MKCWludGVybmFsbHkgKHB0cmFjZSwgZXZl
bnQgbG9vcCwgZGVjb2RlcnMsIHN5c2NhbGwgZGlzcGF0Y2gpLgoJKiBkb2MvUkVBRE1FLm1kOiBB
ZGQgSU5URVJOQUxTLm1kIGVudHJ5LgoJKiBkb2MvREVDT0RFUl9BUEkubWQ6IEFkZCBJTlRFUk5B
TFMubWQgcmVmZXJlbmNlLgoJKiBkb2MvR0xPU1NBUlkubWQ6IEFkZCBJTlRFUk5BTFMubWQgcmVm
ZXJlbmNlLgoKCUFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNC02CgoyMDI2LTA2LTIx
ICBEbWl0cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNlLmlvPgoKCUFkZCBkb2MvR0xPU1NBUlkubWQu
CgkqIGRvYy9HTE9TU0FSWS5tZDogTmV3IGZpbGUg4oCUIGNvbXByZWhlbnNpdmUgZ2xvc3Nhcnkg
b2Ygc3RyYWNlCgl0ZXJtaW5vbG9neS4KCSogZG9jL1JFQURNRS5tZDogQWRkIEdMT1NTQVJZLm1k
IGVudHJ5LgoJKiBkb2MvREVDT0RFUl9BUEkubWQ6IEFkZCBHTE9TU0FSWS5tZCByZWZlcmVuY2Vz
LgoKCUFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNC02CgoyMDI2LTA2LTIxICBEbWl0
cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNlLmlvPgoKCUFkZCBkb2MvREVDT0RFUl9BUEkubWQuCgkq
IGRvYy9ERUNPREVSX0FQSS5tZDogTmV3IGZpbGUg4oCUIGNvbXByZWhlbnNpdmUgQVBJIHJlZmVy
ZW5jZSBmb3Igc3lzY2FsbAoJYW5kIGlvY3RsIGRlY29kZXIgd3JpdGVycy4KCSogZG9jL1JFQURN
RS5tZDogQWRkIERFQ09ERVJfQVBJLm1kIGVudHJ5LgoKCUFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xh
dWRlLW9wdXMtNC02CgoyMDI2LTA2LTIxICBEbWl0cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNlLmlv
PgoKCUFkZCBkb2MvUkVBRE1FLm1kLgoJKiBkb2MvUkVBRE1FLm1kOiBOZXcgZmlsZSDigJQgY29t
cHJlaGVuc2l2ZSBkZXZlbG9wZXIgZG9jdW1lbnRhdGlvbiBpbmRleC4KCSogUkVBRE1FLm1kIChE
b2N1bWVudGF0aW9uKTogQWRkIGEgcmVmZXJlbmNlIHRvIGRvYy9SRUFETUUubWQuCgkqIENPTlRS
SUJVVElORy5tZCAoRG9jdW1lbnRhdGlvbik6IEFkZCBhIHJlZmVyZW5jZSB0byBkb2MvUkVBRE1F
Lm1kLgoKCUFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xhdWRlLW9wdXMtNC02CgoyMDI2LTA2LTE4ICBE
bWl0cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNlLmlvPgoKCUFkZCBTRUNVUklUWS5tZC4KCSogU0VD
VVJJVFkubWQ6IE5ldyBmaWxlLgoJKiBSRUFETUUubWQgKERvY3VtZW50YXRpb24pOiBSZWZlciB0
byBpdC4KCglBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1zb25uZXQtNC02CgoyMDI2LTA2LTE4
ICBEbWl0cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNlLmlvPgoKCUFkZCBDT05UUklCVVRJTkcubWQu
CgkqIENPTlRSSUJVVElORy5tZDogTmV3IGZpbGUgYmFzZWQgb24gdGhlIGluZm9ybWF0aW9uIGRv
d25sb2FkZWQgZnJvbQoJaHR0cHM6Ly9zdHJhY2UuaW8vd2lraS9OZXdDb250cmlidXRvckd1aWRl
IHBhZ2UuCgkqIFJFQURNRS5tZCAoRG9jdW1lbnRhdGlvbik6IFJlZmVyIHRvIENPTlRSSUJVVElO
Ry5tZCBpbnN0ZWFkIG9mCgl0aGUgd2lraSBwYWdlLgoKCUFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xh
dWRlLXNvbm5ldC00LTYKCjIwMjYtMDYtMTggIERtaXRyeSBWLiBMZXZpbiAgPGxkdkBzdHJhY2Uu
aW8+CgoJUkVBRE1FLm1kOiBhZGQgYSByZWZlcmVuY2UgdG8gdGhlIG1hbnVhbCBwYWdlLgoJKiBS
RUFETUUubWQgKERvY3VtZW50YXRpb24pOiBOZXcgc2VjdGlvbi4KCglBc3Npc3RlZC1ieTogQ2xh
dWRlOmNsYXVkZS1zb25uZXQtNC02CgoyMDI2LTA2LTE4ICBEbWl0cnkgVi4gTGV2aW4gIDxsZHZA
c3RyYWNlLmlvPgoKCWRvYy9SRUFETUUtbXBlcnMubWQ6IGFkZCBtYWNybyByZWZlcmVuY2UgYW5k
IGZpeCBpbmNvbnNpc3RlbmNpZXMuCgkqIGRvYy9SRUFETUUtbXBlcnMubWQgKE1hY3JvIFJlZmVy
ZW5jZSk6IE5ldyBzZWN0aW9uIGRvY3VtZW50aW5nCglNUEVSUyBtYWNyb3MgKERFRl9NUEVSU19U
WVBFLCBNUEVSU19ERUZTLCBNUEVSU19QUklOVEVSX0RFQ0wsCglNUEVSU19GVU5DX05BTUUpLiAg
UHJvdmlkZSB0ZWNobmljYWwgZGV0YWlscyBhYm91dCB3aGF0IGVhY2ggbWFjcm8KCWV4cGFuZHMg
dG8gaW4gZGlmZmVyZW50IGJ1aWxkIGNvbnRleHRzLgoJKEhvdyB0byBXcml0ZSBNUEVSUy1Bd2Fy
ZSBDb2RlKTogUmVvcmRlciBzdGVwcyB0byBtYXRjaCB0aGUgYWN0dWFsCglleGFtcGxlIGNvZGU6
IERFRl9NUEVSU19UWVBFIGJlZm9yZSBoZWFkZXIgaW5jbHVkZXMgYW5kIHR5cGVkZWYuICBBZGQK
CWV4cGxpY2l0IHN0ZXAgMSBmb3IgaW5jbHVkaW5nIGRlZnMuaC4gIFNpbXBsaWZ5IHN0ZXAgNiBh
Ym91dCBjYWxsaW5nCglNUEVSUyBmdW5jdGlvbnMuCgoJQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1
ZGUtc29ubmV0LTQtNgoKMjAyNi0wNi0xNyAgRG1pdHJ5IFYuIExldmluICA8bGR2QHN0cmFjZS5p
bz4KCglkb2MvUkVBRE1FLXhsYXQubWQsIHNyYy94bGF0L1JFQURNRS5tZDogcmV2ZXJzZSBzeW1s
aW5rIGRpcmVjdGlvbi4KCSogZG9jL1JFQURNRS14bGF0Lm1kOiBNb3ZlIGZyb20gc3JjL3hsYXQv
UkVBRE1FLm1kICh3YXMgc3ltbGluaywgbm93CglyZWFsIGZpbGUpLiAgQ29uc29saWRhdGVzIHJl
ZmVyZW5jZSBkb2N1bWVudGF0aW9uIGluIGRvYy8uCgkqIGRvYy9DT01NSVQtTUVTU0FHRVMubWQg
KFJlbGF0ZWQgRG9jdW1lbnRhdGlvbik6IENoYW5nZSBzcmMveGxhdC9SRUFETUUubWQKCXRvIGRv
Yy9SRUFETUUteGxhdC5tZC4KCSogZG9jL2dlbl94bGF0X2RlZnMuc2guMSAoU0VFIEFMU08pOiBD
aGFuZ2Ugc3JjL3hsYXQvUkVBRE1FLm1kIHRvCglkb2MvUkVBRE1FLXhsYXQubWQuCgkqIHNyYy94
bGF0L1JFQURNRS5tZDogQ2hhbmdlIHRvIHN5bWxpbmsgcG9pbnRpbmcgdG8KCS4uLy4uL2RvYy9S
RUFETUUteGxhdC5tZC4gIFByb3ZpZGVzIGNvbnZlbmllbnQgYWNjZXNzIGZvciBkZXZlbG9wZXJz
Cgl3b3JraW5nIGluIHNyYy94bGF0LyBkaXJlY3RvcnkuCgoJQXNzaXN0ZWQtYnk6IENsYXVkZTpj
bGF1ZGUtc29ubmV0LTQtNgoKMjAyNi0wNi0xNyAgRG1pdHJ5IFYuIExldmluICA8bGR2QHN0cmFj
ZS5pbz4KCglJTlNUQUxMLWdpdC5tZDogdXBkYXRlLgoJKiBJTlNUQUxMLWdpdC5tZCAoUHJlcmVx
dWlzaXRlcyk6IE5ldyBzZWN0aW9uIGRvY3VtZW50aW5nIGJvb3RzdHJhcAoJcmVxdWlyZW1lbnRz
IHdpdGggcGFja2FnZSBpbnN0YWxsYXRpb24gY29tbWFuZHMgZm9yIERlYmlhbi9VYnVudHUKCWFu
ZCBGZWRvcmEvUkhFTC4KCShSdW5uaW5nIGJvb3RzdHJhcCk6IE5ldyBzZWN0aW9uLgoJKE5leHQg
U3RlcHMpOiBOZXcgc2VjdGlvbiB3aXRoIHF1aWNrLXN0YXJ0IGV4YW1wbGUgYW5kIHBvaW50ZXJz
IHRvCglkZXRhaWxlZCBidWlsZCBpbmZvcm1hdGlvbi4KCglBc3Npc3RlZC1ieTogQ2xhdWRlOmNs
YXVkZS1zb25uZXQtNC02CgoyMDI2LTA2LTE3ICBEbWl0cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNl
LmlvPgoKCWRpc3QvSU5TVEFMTDogdXBkYXRlLgoJKiBkaXN0L0lOU1RBTEwgKEJVSUxEIFJFUVVJ
UkVNRU5UUyk6IEFkZCBtaW5pbWFsIGJ1aWxkIHJlcXVpcmVtZW50cwoJc2VjdGlvbi4KCShTdGFj
ayB1bndpbmRpbmcpOiBBZGQgLS13aXRoLWxpYmR3IG9wdGlvbi4gIEFkZCBMaWJyYXJ5IHJlcXVp
cmVtZW50cy4KCShTRUxpbnV4IGNvbnRleHQgc3VwcG9ydCwgQmx1ZXRvb3RoIGlvY3RsIGRlY29k
ZXIpOiBOZXcgc2VjdGlvbnMuCgkoVEVTVElORyk6IERvY3VtZW50IG9wdGlvbmFsIHRlc3QgZGVw
ZW5kZW5jaWVzIGFuZCBlbnZpcm9ubWVudCB2YXJpYWJsZXMuCgkoRGlzdHJpYnV0aW9uIHRhcmJh
bGwpOiBEb2N1bWVudCBwYWNrYWdpbmcgcmVxdWlyZW1lbnRzLgoKCUFzc2lzdGVkLWJ5OiBDbGF1
ZGU6Y2xhdWRlLXNvbm5ldC00LTYKCjIwMjYtMDYtMTcgIERtaXRyeSBWLiBMZXZpbiAgPGxkdkBz
dHJhY2UuaW8+CgoJZG9jL1JFQURNRS1tcGVyczogcmVuYW1lIGFuZCBleHBhbmQuCglSZW5hbWUg
ZG9jL1JFQURNRS1tcGVycyB0byBkb2MvUkVBRE1FLW1wZXJzLm1kIGFuZCBjb252ZXJ0IHRvIG1h
cmtkb3duCglmb3JtYXQuCgoJKiBkb2MvUkVBRE1FLW1wZXJzOiBSZW5hbWUgdG8gLi4uCgkqIGRv
Yy9SRUFETUUtbXBlcnMubWQ6IC4uLiB0aGlzIGZpbGUuCgkoV2hhdCBJcyBNUEVSUyk6IE5ldyBz
ZWN0aW9uIGV4cGxhaW5pbmcgbXVsdGktcGVyc29uYWxpdHkgc3VwcG9ydCBjb25jZXB0CglhbmQg
cHJvdmlkaW5nIHg4Nl82NCBhcyBjb25jcmV0ZSBleGFtcGxlLgoJKFdoaWNoIEFyY2hpdGVjdHVy
ZXMgVXNlIE1QRVJTKTogTmV3IHNlY3Rpb24gd2l0aCBhcmNoaXRlY3R1cmUgdGFibGUgYW5kCglT
VVBQT1JURURfUEVSU09OQUxJVElFUyBkZXRlY3Rpb24gaW5zdHJ1Y3Rpb25zLgoJKEJ1aWxkIFBp
cGVsaW5lKTogTmV3IHNlY3Rpb24gZG9jdW1lbnRpbmcgbXBlcnMuc2gsIG1wZXJzLmF3aywgYW5k
IHRoZQoJbXVsdGktc3RhZ2UgYnVpbGQgcHJvY2Vzcy4KCShXaGljaCBGaWxlcyBOZWVkIE1QRVJT
KTogTmV3IHNlY3Rpb24gbGlzdGluZyBzdHJ1Y3R1cmUgdHlwZXMgdGhhdCB2YXJ5CgliZXR3ZWVu
IHBlcnNvbmFsaXRpZXMuCgkoSG93IHRvIFdyaXRlIE1QRVJTLUF3YXJlIENvZGUpOiBFeHBhbmRl
ZCBmcm9tIG9yaWdpbmFsIGNvbnRlbnQgd2l0aAoJd29ya2VkIGV4YW1wbGUuCgkoRXhhbXBsZTog
cHJpbnRfdGltZXNwZWMuYyk6IE5ldyBzZWN0aW9uLgoKCUFzc2lzdGVkLWJ5OiBDbGF1ZGU6Y2xh
dWRlLXNvbm5ldC00LTYKCjIwMjYtMDYtMTcgIEJhcnVjaCBTaWFjaCAgPGJhcnVjaEB0a29zLmNv
LmlsPgoKCW1hY3JvczogZml4IGFzc2VydCBtZXNzYWdlIHR5cG8uCgkqIHNyYy9tYWNyb3MuaCAo
Q0hFQ0tfVFlQRV9TSVpFLCBDSEVDS19JT0NUTF9TSVpFKTogRml4IHR5cG8KCS0tZW5hYmxlZC1i
dW5kbGVkIC0+IC0tZW5hYmxlLWJ1bmRsZWQuCgoyMDI2LTA2LTE2ICBEbWl0cnkgVi4gTGV2aW4g
IDxsZHZAc3RyYWNlLmlvPgoKCVJFQURNRTogcmVmbGVjdCBHaXRIdWIgYXMgcHJpbWFyeSBkZXZl
bG9wbWVudCBwbGF0Zm9ybS4KCSogUkVBRE1FLm1kOiBVcGRhdGUgdG8gcmVmbGVjdCB0aGF0IGRl
dmVsb3BtZW50IHByaW1hcmlseSB0YWtlcyBwbGFjZQoJb24gR2l0SHViIHdpdGggaXNzdWVzIGFu
ZCBwdWxsIHJlcXVlc3RzLCB3aXRoIHRoZSBtYWlsaW5nIGxpc3QgYXMKCWFuIGFsdGVybmF0aXZl
IGZvciBkaXNjdXNzaW9ucyBhbmQgcGF0Y2ggc3VibWlzc2lvbnMuCgkqIGRpc3QvUkVBRE1FOiBM
aWtld2lzZS4KCglDUkVESVRTLmluOiBhZGQgY3VycmVudCBtYWludGFpbmVycyBzZWN0aW9uLgoJ
KiBDUkVESVRTLmluOiBBZGQgIkN1cnJlbnQgbWFpbnRhaW5lcnMgb2Ygc3RyYWNlIiBzZWN0aW9u
IGF0IHRoZQoJYmVnaW5uaW5nLCBtYWtpbmcgaXQgZWFzaWVyIHRvIGZpbmQgY3VycmVudCBtYWlu
dGFpbmVyIGNvbnRhY3QKCWluZm9ybWF0aW9uLgoKCVBvc3QtcmVsZWFzZSBhZG1pbmlzdHJpdmlh
LgoJKiBORVdTOiBBZGQgYSBoZWFkZXIgbGluZSBmb3IgdGhlIG5leHQgcmVsZWFzZS4KCSogZGVi
aWFuL2NoYW5nZWxvZy5pbjogQWRkIGEgY2hhbmdlbG9nIGVudHJ5IGZvciA3LjEtMS4KCSogc3Ry
YWNlLnNwZWMuaW46IExpa2V3aXNlLgo=

--===============2088966030244473343==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-strace-upgrade-7.1-7.2.patch"

RnJvbSBmMzZmMjI4ZTRmYTUxMGNjZGZlZDdmYjdmMTQzYjVjNGUzZTkyMGY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTkgQXVnIDIwMjYgMDU6MjI6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
dHJhY2U6IHVwZ3JhZGUgNy4xIC0+IDcuMgoKU291cmNlOiBDaGFuZ2VMb2cKCjIwMjYtMDgtMTgg
IERtaXRyeSBWLiBMZXZpbiAgPGxkdkBzdHJhY2UuaW8+CgoJUHJlcGFyZSBmb3IgNy4yIHJlbGVh
c2UuCgkqIE5FV1M6IFVwZGF0ZSBmb3IgNy4yIHJlbGVhc2UuCgoJVXBkYXRlIGNvcHlyaWdodCBo
ZWFkZXJzLgoJSGVhZGVycyB1cGRhdGVkIGF1dG9tYXRpY2FsbHkgdXNpbmcgbWFpbnQvdXBkYXRl
X2NvcHlyaWdodF95ZWFycy5zaAoJc2NyaXB0LgoKMjAyNi0wOC0xOCAgRG1pdHJ5IFYuIExldmlu
ICA8bGR2QHN0cmFjZS5pbz4KCgl0ZXN0czogZml4IGZ1dGV4IHRlc3QgZXhwZWN0YXRpb25zIGZv
ciBGVVRFWF9VTkxPQ0tfKl9MSVNUKiBvbiBsaW51eCB2Ny4yCgkqIHRlc3RzL2Z1dGV4LmMgKG1h
aW4pOiBDaGFuZ2UgRlVURVhfVU5MT0NLX1dBS0VfTElTVDY0LAoJRlVURVhfVU5MT0NLX1dBS0Vf
TElTVDY0X1BSSVZBVEUsIEZVVEVYX1VOTE9DS19XQUtFX0xJU1QzMiwKCUZVVEVYX1VOTE9DS19X
QUtFX0xJU1QzMl9QUklWQVRFLCBGVVRFWF9VTkxPQ0tfQklUU0VUX0xJU1Q2NCwKCUZVVEVYX1VO
TE9DS19CSVRTRVRfTElTVDY0X1BSSVZBVEUsIEZVVEVYX1VOTE9DS19CSVRTRVRfTElTVDMyLAoJ
YW5kIEZVVEVYX1VOTE9DS19CSVRTRVRfTElTVDMyX1BSSVZBVEUgY2hlY2tzIHRvIGV4cGVjdCBF
RkFVTFQKCWluc3RlYWQgb2Ygc3VjY2Vzcy4KCglUaGVzZSBvcGVyYXRpb25zIHJlcXVpcmUgYSB2
YWxpZCByb2J1c3QgbGlzdCBwZW5kaW5nIG9wIHBvaW50ZXIKCWluIHVhZGRyMi4gIFdoZW4gdWFk
ZHIyIGlzIE5VTEwsIExpbnV4IHY3LjIgcmV0dXJucyBFRkFVTFQuCglPbiBvbGRlciBrZXJuZWxz
IHRoYXQgZG9uJ3QgaW1wbGVtZW50IHRoZXNlIG9wZXJhdGlvbnMsIEVOT1NZUwoJaXMgc3RpbGwg
YWNjZXB0ZWQgdmlhIENIRUNLX0ZVVEVYX0VOT1NZUy4KCglGaXhlczogdjcuMS01Mi1nMDdjMWMz
ZjAwYjAyICJ0ZXN0czogY2hlY2sgZGVjb2Rpbmcgb2YgRlVURVhfVU5MT0NLXypfTElTVCogY29u
c3RhbnRzIgoJQXNzaXN0ZWQtYnk6IENsYXVkZTpjbGF1ZGUtc29ubmV0LTQtNQoKMjAyNi0wOC0x
NyAgR2xlYiBGb3RlbmdhdWVyLU1hbGlub3Zza2l5ICA8Z2xlYmZtQGFsdGxpbnV4Lm9yZz4KCglV
cGRhdGUgaW9jdGwgZW50cmllcyBmcm9tIGxpbnV4IHY3LjIuCgkqIHNyYy9saW51eC8zMi9pb2N0
bHNfaW5jX2FsaWduMTYuaDogVXBkYXRlIGZyb20gbGludXggdjcuMiB1c2luZwoJaW9jdGxzX2dl
bi5zaC4KCSogc3JjL2xpbnV4LzMyL2lvY3Rsc19pbmNfYWxpZ24zMi5oOiBMaWtld2lzZS4KCSog
c3JjL2xpbnV4LzMyL2lvY3Rsc19pbmNfYWxpZ242NC5oOiBMaWtld2lzZS4KCSogc3JjL2xpbnV4
LzY0L2lvY3Rsc19pbmMuaDogTGlrZXdpc2UuCgkqIHNyYy9saW51eC94MzIvaW9jdGxzX2luYzAu
aDogTGlrZXdpc2UuCgkqIE5FV1M6IE1lbnRpb24gdGhpcyBjaGFuZ2UuCgoyMDI2LTA4LTE3ICBE
bWl0cnkgVi4gTGV2aW4gIDxsZHZAc3RyYWNlLmlvPgoKCWJ1bmRsZWQ6IHVwZGF0ZSBsaW51eCBV
QVBJIGhlYWRlcnMgdG8gdjcuMi4KCUhlYWRlcnMgdXBkYXRlZCBhdXRvbWF0aWNhbGx5IHVzaW5n
IHVwZGF0ZS1idW5kbGVkLWhlYWRlcnMuc2ggc2NyaXB0LgoKCSogYnVuZGxlZC9saW51eC9pbmNs
dWRlL3VhcGkvbGludXgvYnRyZnMuaDogVXBkYXRlIHRvCgloZWFkZXJzX2luc3RhbGwnZWQgTGlu
dXgga2VybmVsIHY3LjIuCgkqIGJ1bmRsZWQvbGludXgvaW5jbHVkZS91YXBpL2xpbnV4L2lwX3Zz
Lmg6IExpa2V3aXNlLgoKMjAyNi0wOC0xNiAgRG1pdHJ5IFYuIExldmluICA8bGR2QHN0cmFjZS5p
bz4KCglpb191cmluZzogcmVuYW1lIG5vdGlmIHRvIGV2ZW50LgoJQmV0d2VlbiBMaW51eCB2Ny4y
LXJjMSBhbmQgdjcuMi1yYzcsIHRoZSBpb191cmluZyB6ZXJvLWNvcHkgUlgKCWludGVyZmFjZSB1
bmRlcndlbnQgYSBzeXN0ZW1hdGljIHJlbmFtZSByZXBsYWNpbmcgIm5vdGlmIi8ibm90aWZpY2F0
aW9uIgoJdGVybWlub2xvZ3kgd2l0aCAiZXZlbnQiLgoKCSogYnVuZGxlZC9saW51eC9pbmNsdWRl
L3VhcGkvbGludXgvaW9fdXJpbmcvcXVlcnkuaDogVXBkYXRlIHRvCgloZWFkZXJzX2luc3RhbGwn
ZWQgTGludXgga2VybmVsIHY3LjItcmM3IHVzaW5nIHVwZGF0ZS1idW5kbGVkLWhlYWRlcnMuc2gK
CXNjcmlwdC4KCSogYnVuZGxlZC9saW51eC9pbmNsdWRlL3VhcGkvbGludXgvaW9fdXJpbmcvemNy
eC5oOiBMaWtld2lzZS4KCSogc3JjL3hsYXQvdXJpbmdfemNyeF9ub3RpZl90eXBlcy5pbjogUmVu
YW1lIHRvCglzcmMveGxhdC91cmluZ196Y3J4X2V2ZW50X3R5cGVzLmluIGFuZCB1cGRhdGUgY29u
c3RhbnQgbmFtZXM6CglaQ1JYX05PVElGX05PX0JVRkZFUlMgYmVjb21lcyBaQ1JYX0VWRU5UX0FM
TE9DX0ZBSUwsCglaQ1JYX05PVElGX0NPUFkgYmVjb21lcyBaQ1JYX0VWRU5UX0NPUFkuCgkqIHNy
Yy94bGF0L3VyaW5nX3pjcnhfY3RybF9vcHMuaW4gKFpDUlhfQ1RSTF9BUk1fTk9USUZJQ0FUSU9O
KTogUmVuYW1lCgl0byBaQ1JYX0NUUkxfQVJNX0VWRU5ULgoJKiBzcmMveGxhdC91cmluZ19xdWVy
eV9vcHMuaW4gKElPX1VSSU5HX1FVRVJZX1pDUlhfTk9USUYpOiBSZW5hbWUgdG8KCUlPX1VSSU5H
X1FVRVJZX1pDUlhfRVZFTlQuCgkqIHNyYy9pb191cmluZy5jOiBVcGRhdGUgdG8gbWF0Y2gga2Vy
bmVsIFVBUEkgY2hhbmdlcy4KCShwcmludF9pb191cmluZ196Y3J4X2lmcV9yZWcpOiBub3RpZl9k
ZXNjIC0+IGV2ZW50X2Rlc2MgZmllbGQuCgkocHJpbnRfemNyeF9jdHJsX2FybV9ub3RpZik6IFJl
bmFtZSBmdW5jdGlvbiB0bwoJcHJpbnRfemNyeF9jdHJsX2FybV9ldmVudCwgdXBkYXRlIHN0cnVj
dCB0eXBlIGFuZCBmaWVsZCBuYW1lcy4KCShwcmludF9pb191cmluZ196Y3J4X2N0cmwpOiBVcGRh
dGUgY2FzZSBhbmQgdW5pb24gbWVtYmVyIHJlZmVyZW5jZXMuCgkocHJpbnRfaW9fdXJpbmdfcXVl
cnlfemNyeF9ub3RpZik6IFJlbmFtZSBmdW5jdGlvbiB0bwoJcHJpbnRfaW9fdXJpbmdfcXVlcnlf
emNyeF9lCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDMwMDAgY2hhcmFjdGVy
czsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRhY2htZW50IHRvIHRo
ZSBBVUggZW1haWxdCi0tLQogLi4uZ25vcmUtcHdyaXRldi1wd3JpdGU2NC10ZXN0cy1vbi1tdXNs
LnBhdGNoIHwgNjIgKysrKysrKysrKysrKysrKysrKwogLi4udG9jb25mLW1hY3JvLXRvLWRldGVj
dC1sYXJnZWZpbGUtc3VwLnBhdGNoIHwgIDIgKy0KIC4uLmtwb3J0LWF4X3Byb2dfY2NfZm9yX2J1
aWxkLm00LW1hY3Jvcy5wYXRjaCB8ICAyICstCiAuLi4wMDEtc3RyYWNlLWZpeC1yZXByb2R1Y2li
aWx0eS1pc3N1ZXMucGF0Y2ggfCAgMiArLQogLi4uMDAyLXRlc3RzLVJlcGxhY2Utb2ZmNjRfdC13
aXRoLW9mZl90LnBhdGNoIHwgIDIgKy0KIC4uLi9zdHJhY2Uvc3RyYWNlL01ha2VmaWxlLXB0ZXN0
LnBhdGNoICAgICAgICB8ICA2ICstCiAuLi4vc3RyYWNlL3N0cmFjZS9wdGVzdC1zcGFjZXNhdmUu
cGF0Y2ggICAgICAgfCAgMiArLQogLi4uL3N0cmFjZS9zdHJhY2Uvc2tpcC1sb2FkLnBhdGNoICAg
ICAgICAgICAgIHwgIDIgKy0KIC4uLi9zdHJhY2Uvc3RyYWNlL3VwZGF0ZS1nYXdrLXBhdGhzLnBh
dGNoICAgICB8ICAyICstCiAuLi4vc3RyYWNlL3tzdHJhY2VfNy4xLmJiID0+IHN0cmFjZV83LjIu
YmJ9ICAgfCAgMiArLQogMTAgZmlsZXMgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFj
ZS9maWxlcy8wMDAxLUlnbm9yZS1wd3JpdGV2LXB3cml0ZTY0LXRlc3RzLW9uLW11c2wucGF0Y2gK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3tzdHJhY2VfNy4xLmJiID0+IHN0
cmFjZV83LjIuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0
cmFjZS9maWxlcy8wMDAxLUlnbm9yZS1wd3JpdGV2LXB3cml0ZTY0LXRlc3RzLW9uLW11c2wucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL2ZpbGVzLzAwMDEtSWdub3JlLXB3cml0
ZXYtcHdyaXRlNjQtdGVzdHMtb24tbXVzbC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi4zNDBlMmI2MjVlCi0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3N0cmFjZS9maWxlcy8wMDAxLUlnbm9yZS1wd3JpdGV2LXB3cml0ZTY0LXRlc3Rz
LW9uLW11c2wucGF0Y2gKQEAgLTAsMCArMSw2MiBAQAorRnJvbSBmZThhNWVjMTAyYTkzYjNhOGRh
NWZlYWI4NmE4OWRlZTU0MGI5ZGU1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KK0RhdGU6IE1vbiwgMTggQXVnIDIwMjUgMjI6MTg6
NTggLTA3MDAKK1N1YmplY3Q6IFtQQVRDSF0gSWdub3JlIHB3cml0ZXYvcHdyaXRlNjQgdGVzdHMg
b24gbXVzbAorCittdXNsIHVzZXMgd3JhcHBlcnMgZm9yIHB3cml0ZXYgYW5kIHB3cml0ZTY0IHVz
aW5nCitwd3JpdGV2MiBzeXNjYWxsIFsxXSwgaG93ZXZlciB0aGUgdGVzdCBleGVwY3RzIHRoYXQg
dGhlCitwcm9ncmFtIHdpbGwgY2FsbCBwd3JpdGV2IGFuZCBwd3JpdGU2NCAoIGdsaWJjIGJlaGF2
aW9yICkKKworVGhpcyBjYW4gYmUgZml4ZWQgaWYgdGhlIGZ1bmN0aW9uIGNhbGxzIGFyZSBjaGFu
Z2VkIHRvCit1c2Ugc3lzY2FsbCgpIEFQSSBkaXJlY3RseSwgYnV0IHRoYXQgbmVlZHMgY2hhbmdl
IHVwc3RyZWFtIFsyXQorCitJc3N1ZSBpcyByZXBvcnRlZCB1cHN0cmVhbSBbM10KKworWzFdIGh0
dHBzOi8vZ2l0Lm11c2wtbGliYy5vcmcvY2dpdC9tdXNsL2NvbW1pdC9zcmM/aWQ9NTM3MDA3MGZk
ZWQ2MWI1NjkxOTY3NjQ2NzNhNGZjODQ0MGFhYzc5ZQorWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9z
dHJhY2Uvc3RyYWNlL3B1bGwvMzQ3CitbM10gaHR0cHM6Ly9naXRodWIuY29tL3N0cmFjZS9zdHJh
Y2UvaXNzdWVzLzM0OQorCitVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW011c2wgU3Bl
Y2lmaWNdCitTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgorLS0t
CisgdGVzdHMvcHJlYWQ2NC1wd3JpdGU2NC5nZW4udGVzdCB8IDMgKysrCisgdGVzdHMvcHJlYWR2
LXB3cml0ZXYuZ2VuLnRlc3QgICB8IDMgKysrCisgdGVzdHMvcHdyaXRldi5nZW4udGVzdCAgICAg
ICAgICB8IDMgKysrCisgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKKworZGlmZiAt
LWdpdCBhL3Rlc3RzL3ByZWFkNjQtcHdyaXRlNjQuZ2VuLnRlc3QgYi90ZXN0cy9wcmVhZDY0LXB3
cml0ZTY0Lmdlbi50ZXN0CitpbmRleCBiNTNlMDY5Li4wYTFlNmU2IDEwMDc1NQorLS0tIGEvdGVz
dHMvcHJlYWQ2NC1wd3JpdGU2NC5nZW4udGVzdAorKysrIGIvdGVzdHMvcHJlYWQ2NC1wd3JpdGU2
NC5nZW4udGVzdAorQEAgLTEsNCArMSw3IEBACisgIyEvYmluL3NoIC1lZnUKKyAjIEdlbmVyYXRl
ZCBieSAuL3Rlc3RzL2dlbl90ZXN0cy5zaCBmcm9tIC4vdGVzdHMvZ2VuX3Rlc3RzLmluIChwcmVh
ZDY0LXB3cml0ZTY0IC1hMjEgLWVyZWFkPTAgLWV3cml0ZT0xIC1lIHRyYWNlPXByZWFkNjQscHdy
aXRlNjQgLVAgcHJlYWQ2NC1wd3JpdGU2NC10bXBmaWxlIC1QIC9kZXYvemVybyAtUCAvZGV2L251
bGwpOyBkbyBub3QgZWRpdC4KKyAuICIke3NyY2Rpcj0ufS9pbml0LnNoIgorKworK3NraXBfICJU
ZXN0IG5vdCBwb3J0ZWQgdG8gbXVzbCwgbXVzbCBnZW5lcmF0ZXMgcHdyaXRldjIiCisrCisgcnVu
X3N0cmFjZV9tYXRjaF9kaWZmIC1hMjEgLWVyZWFkPTAgLWV3cml0ZT0xIC1lIHRyYWNlPXByZWFk
NjQscHdyaXRlNjQgLVAgcHJlYWQ2NC1wd3JpdGU2NC10bXBmaWxlIC1QIC9kZXYvemVybyAtUCAv
ZGV2L251bGwKK2RpZmYgLS1naXQgYS90ZXN0cy9wcmVhZHYtcHdyaXRldi5nZW4udGVzdCBiL3Rl
c3RzL3ByZWFkdi1wd3JpdGV2Lmdlbi50ZXN0CitpbmRleCA1ZWQ4Mjk3Li5iODNmMTI5IDEwMDc1
NQorLS0tIGEvdGVzdHMvcHJlYWR2LXB3cml0ZXYuZ2VuLnRlc3QKKysrKyBiL3Rlc3RzL3ByZWFk
di1wd3JpdGV2Lmdlbi50ZXN0CitAQCAtMSw0ICsxLDcgQEAKKyAjIS9iaW4vc2ggLWVmdQorICMg
R2VuZXJhdGVkIGJ5IC4vdGVzdHMvZ2VuX3Rlc3RzLnNoIGZyb20gLi90ZXN0cy9nZW5fdGVzdHMu
aW4gKHByZWFkdi1wd3JpdGV2IC1hMTkgLWVyZWFkPTAgLWV3cml0ZT0xIC1lIHRyYWNlPXByZWFk
dixwd3JpdGV2KTsgZG8gbm90IGVkaXQuCisgLiAiJHtzcmNkaXI9Ln0vaW5pdC5zaCIKKysKKytz
a2lwXyAiVGVzdCBub3QgcG9ydGVkIHRvIG11c2wsIG11c2wgZ2VuZXJhdGVzIHB3cml0ZXYyIgor
KworIHJ1bl9zdHJhY2VfbWF0Y2hfZGlmZiAtYTE5IC1lcmVhZD0wIC1ld3JpdGU9MSAtZSB0cmFj
ZT1wcmVhZHYscHdyaXRldgorZGlmZiAtLWdpdCBhL3Rlc3RzL3B3cml0ZXYuZ2VuLnRlc3QgYi90
ZXN0cy9wd3JpdGV2Lmdlbi50ZXN0CitpbmRleCBlNTRmZDE1Li40OTk5ODE2IDEwMDc1NQorLS0t
IGEvdGVzdHMvcHdyaXRldi5nZW4udGVzdAorKysrIGIvdGVzdHMvcHdyaXRldi5nZW4udGVzdAor
QEAgLTEsNCArMSw3IEBACisgIyEvYmluL3NoIC1lZnUKKyAjIEdlbmVyYXRlZCBieSAuL3Rlc3Rz
L2dlbl90ZXN0cy5zaCBmcm9tIC4vdGVzdHMvZ2VuX3Rlc3RzLmluIChwd3JpdGV2IC1hMjIgLXM3
KTsgZG8gbm90IGVkaXQuCisgLiAiJHtzcmNkaXI9Ln0vaW5pdC5zaCIKKysKKytza2lwXyAiVGVz
dCBub3QgcG9ydGVkIHRvIG11c2wsIG11c2wgZ2VuZXJhdGVzIHB3cml0ZXYyIgorKworIHJ1bl9z
dHJhY2VfbWF0Y2hfZGlmZiAtYTIyIC1zNwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3N0cmFjZS9zdHJhY2UvMDAwMS1jb25maWd1cmUtVXNlLWF1dG9jb25mLW1hY3JvLXRvLWRl
dGVjdC1sYXJnZWZpbGUtc3VwLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9z
dHJhY2UvMDAwMS1jb25maWd1cmUtVXNlLWF1dG9jb25mLW1hY3JvLXRvLWRldGVjdC1sYXJnZWZp
bGUtc3VwLnBhdGNoCmluZGV4IDVhN2QwNWFlNDEuLjI1ZjMyZDE3MzQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlLzAwMDEtY29uZmlndXJlLVVzZS1hdXRv
Y29uZi1tYWNyby10by1kZXRlY3QtbGFyZ2VmaWxlLXN1cC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAxLWNvbmZpZ3VyZS1Vc2UtYXV0b2NvbmYtbWFj
cm8tdG8tZGV0ZWN0LWxhcmdlZmlsZS1zdXAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDY1
ZmIyMmUzMDJhNGRiZWM2NzUzNzdlNjE1OTNiNTJjMmUyOTE3MDUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDMzNGI2NmFmMTMyOWJjNjk3MGM5ZmY5ZWU2NjhhZjZjYzIxMzNiOGYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgogRGF0ZTogVGh1LCAxNSBEZWMgMjAyMiAxNTo1NDoyNyAtMDgwMAogU3ViamVjdDogW1BBVENI
XSBjb25maWd1cmU6IFVzZSBhdXRvY29uZiBtYWNybyB0byBkZXRlY3QgbGFyZ2VmaWxlIHN1cHBv
cnQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlLzAwMDEt
bTQtQmFja3BvcnQtYXhfcHJvZ19jY19mb3JfYnVpbGQubTQtbWFjcm9zLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvMDAwMS1tNC1CYWNrcG9ydC1heF9wcm9nX2Nj
X2Zvcl9idWlsZC5tNC1tYWNyb3MucGF0Y2gKaW5kZXggZDNlMzUwNzdkZS4uNjBlNTE0MTE5NyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvMDAwMS1tNC1C
YWNrcG9ydC1heF9wcm9nX2NjX2Zvcl9idWlsZC5tNC1tYWNyb3MucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvMDAwMS1tNC1CYWNrcG9ydC1heF9wcm9nX2Nj
X2Zvcl9idWlsZC5tNC1tYWNyb3MucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDc3NzkwYTg4
OWNhNTIyNzkzNmUyZGUyYzU4N2VmMWZkOWM4ZTcxOGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGI0MDJjZmNkZmI3ODJhYjNhOGIyNjRiMjM1MzZhNGRlNWY3MDk3NDYgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8a2hlbS5yYWpAb3NzLnF1YWxjb21tLmNv
bT4KIERhdGU6IEZyaSwgMTAgQXByIDIwMjYgMjM6Mzk6NDcgKzAwMDAKIFN1YmplY3Q6IFtQQVRD
SF0gbTQ6IEJhY2twb3J0IGF4X3Byb2dfY2NfZm9yX2J1aWxkLm00IG1hY3JvcwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvMDAwMS1zdHJhY2UtZml4LXJl
cHJvZHVjaWJpbHR5LWlzc3Vlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uv
c3RyYWNlLzAwMDEtc3RyYWNlLWZpeC1yZXByb2R1Y2liaWx0eS1pc3N1ZXMucGF0Y2gKaW5kZXgg
Nzg1MDlkYTJiMS4uNDkwN2IxNmExYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3N0cmFjZS9zdHJhY2UvMDAwMS1zdHJhY2UtZml4LXJlcHJvZHVjaWJpbHR5LWlzc3Vlcy5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAxLXN0cmFjZS1m
aXgtcmVwcm9kdWNpYmlsdHktaXNzdWVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NTU5
MDVjZTJhM2Y4ODYyNjRlNjM0NDA1MTY1NGQ3YzJkOWZhZjg4IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA1OTA1YjQwNmM1MzI1NDQyZjIwMDEzMzk5MzdhZDIyYjJkMDY4YjE1IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmVyZW15IFB1aGxtYW4gPGpwdWhsbWFuQG12aXN0
YS5jb20+CiBEYXRlOiBXZWQsIDExIE1hciAyMDIwIDE5OjU2OjU1ICswMDAwCiBTdWJqZWN0OiBb
UEFUQ0hdIHN0cmFjZTogZml4IHJlcHJvZHVjaWJpbHR5IGlzc3VlcwpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvMDAwMi10ZXN0cy1SZXBsYWNlLW9mZjY0
X3Qtd2l0aC1vZmZfdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNl
LzAwMDItdGVzdHMtUmVwbGFjZS1vZmY2NF90LXdpdGgtb2ZmX3QucGF0Y2gKaW5kZXggZWMxOTA1
MzIxYS4uZTc4NDI2ODg1NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFj
ZS9zdHJhY2UvMDAwMi10ZXN0cy1SZXBsYWNlLW9mZjY0X3Qtd2l0aC1vZmZfdC5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS8wMDAyLXRlc3RzLVJlcGxhY2Ut
b2ZmNjRfdC13aXRoLW9mZl90LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0NDcyMDNiZGNl
ZDU3YTUyMTUzNGM0ZmI3ZDE5NjIzMThhODFjMWJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBiY2NhODYxOWY3NDliYTc4YTRjZTc4ZDM5YzYwM2UyNjA2MTc1MTc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6
IFRodSwgMTUgRGVjIDIwMjIgMTU6NTY6MTMgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6
IFJlcGxhY2Ugb2ZmNjRfdCB3aXRoIG9mZl90CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvc3RyYWNlL3N0cmFjZS9NYWtlZmlsZS1wdGVzdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9zdHJhY2Uvc3RyYWNlL01ha2VmaWxlLXB0ZXN0LnBhdGNoCmluZGV4IGQ4NjRiNjhm
YzEuLjFlM2M4ZWUyYWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uv
c3RyYWNlL01ha2VmaWxlLXB0ZXN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9z
dHJhY2Uvc3RyYWNlL01ha2VmaWxlLXB0ZXN0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2
ZjllYjU5MDdmYTJhN2Q2MTI3NzM3ZTQxZmI0ZTlmYjVmYjA5MWQzIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSAyNzQ5Njk5Yjc3YjRmY2NlN2U2ZTk2MGYyNDYyNTliMDVmM2RhZmNjIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogR2FicmllbCBCYXJidSA8Z2FicmllbC5iYXJi
dUBlbmVhLmNvbT4KIERhdGU6IFRodSwgMjUgSnVsIDIwMTMgMTU6Mjg6MzMgKzAyMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gc3RyYWNlOiBBZGQgcHRlc3QKQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVkLW9m
Zi1ieTogQW51aiBNaXR0YWwgPGFudWoubWl0dGFsQGludGVsLmNvbT4KICAxIGZpbGUgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvTWFrZWZpbGUuYW0gYi90
ZXN0cy9NYWtlZmlsZS5hbQotaW5kZXggZjM3ZDA1My4uOTc1Zjg3OCAxMDA2NDQKK2luZGV4IDg0
YTk2MzguLjIzZmQyMTggMTAwNjQ0CiAtLS0gYS90ZXN0cy9NYWtlZmlsZS5hbQogKysrIGIvdGVz
dHMvTWFrZWZpbGUuYW0KIEBAIC0xOCw2ICsxOCw3IEBAIFNJWkVPRl9MT05HID0gQFNJWkVPRl9M
T05HQApAQCAtMjQsNyArMjQsNyBAQCBpbmRleCBmMzdkMDUzLi45NzVmODc4IDEwMDY0NAogIEFN
X0NGTEFHUyA9ICQoV0FSTl9DRkxBR1MpICQoVEVTVF9XQVJOX0NGTEFHUykKICBidW5kbGVkX0NQ
UEZMQUdTID0KICBpZiBVU0VfQlVORExFRF9IRUFERVJTCi1AQCAtOTY3LDMgKzk2OCwyMiBAQCBj
aGVjay12YWxncmluZC1sb2NhbDogJChjaGVja19MSUJSQVJJRVMpICQoY2hlY2tfUFJPR1JBTVMp
CitAQCAtOTY4LDMgKzk2OSwyMiBAQCBjaGVjay12YWxncmluZC1sb2NhbDogJChjaGVja19MSUJS
QVJJRVMpICQoY2hlY2tfUFJPR1JBTVMpCiAgQ0xFQU5GSUxFUyA9IGtzeXNlbnQuaAogIAogIGlu
Y2x1ZGUgLi4vc3JjL3Njbm8uYW0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9z
dHJhY2Uvc3RyYWNlL3B0ZXN0LXNwYWNlc2F2ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9zdHJhY2Uvc3RyYWNlL3B0ZXN0LXNwYWNlc2F2ZS5wYXRjaAppbmRleCAzM2Y5Yzg2ODk0Li4w
MGY0MDRjMDAzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFj
ZS9wdGVzdC1zcGFjZXNhdmUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFj
ZS9zdHJhY2UvcHRlc3Qtc3BhY2VzYXZlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4Njhk
ZmYyMWY0NzAzNmRlYzRkYjYwMzEyOWQ0NmQ0ZjhlYTRhMjlkIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBhZTUzOGQ0ZGNiMGVhNzI2NWQ3MjY3MWI3ZGQzNTM3Y2ExMzU2NDM3IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBXZWQsIDI5IE1heSAyMDE5IDAwOjEwOjMyICsw
MTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHN0cmFjZTogVHdlYWsgcHRlc3QgZGlzayBzcGFjZSBtYW5h
Z2VtZW50CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS9z
a2lwLWxvYWQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZS9za2lw
LWxvYWQucGF0Y2gKaW5kZXggMWJkY2I3N2RkYi4uNjEwZGQ5NGZlOSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2Uvc2tpcC1sb2FkLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlL3NraXAtbG9hZC5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gNTM3ZTQ0YWEwMjA0NTkwMTcxOTM2ZWVjMGZjZDI3OWI3NGZiYmZlZSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjY1MzUxNTUzN2I2NmE0YjEyODZiZTEwN2U5
ZWY0MDZjNTUwNDBiNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9u
IDxyb3NzLmJ1cnRvbkBhcm0uY29tPgogRGF0ZTogU2F0LCAzMCBBdWcgMjAyNSAwMDo0NzowMyAr
MDIwMAogU3ViamVjdDogW1BBVENIXSBzdHJhY2U6IHNraXAgYSBudW1iZXIgb2YgbG9hZC1zZW5z
aXRpdmUgdGVzdHMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3Ry
YWNlL3VwZGF0ZS1nYXdrLXBhdGhzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFj
ZS9zdHJhY2UvdXBkYXRlLWdhd2stcGF0aHMucGF0Y2gKaW5kZXggYTgzZWI0OWJhMy4uODg5NWIw
ZmY5ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9zdHJhY2UvdXBk
YXRlLWdhd2stcGF0aHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFjZS9z
dHJhY2UvdXBkYXRlLWdhd2stcGF0aHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDcwNjZi
MmU0OWRkYmRlMDM3OWNhNTJjZWJlZWZlY2E0ZjgwZmI3NWIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGJlMWIzZDc0Y2E0ZmZiM2M4ZDNlMzhmZGI5NmYyM2Q1OTIwZjhlZjEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZSBNY0N1cmR5IDxhcm1jY3VyZHlAZ21haWwu
Y29tPgogRGF0ZTogTW9uLCAxOCBKYW4gMjAxNiAxMTowMTowMCAtMDgwMAogU3ViamVjdDogW1BB
VENIXSB1cGRhdGUgZ2F3ayBwYXRocywgL2Jpbi9nYXdrIC0+IC91c3IvYmluL2dhd2sKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzcuMS5iYiBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzcuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk2
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZV83LjEuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzcuMi5iYgppbmRl
eCBiNWM2NTQzZGEwLi42YWUxZGU3YzBiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvc3RyYWNlL3N0cmFjZV83LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0cmFj
ZS9zdHJhY2VfNy4yLmJiCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFT
RV9VUkl9L2Rvd25sb2FkL3Yke1BWfS9zdHJhY2UtJHtQVn0udGFyLnh6IFwKIFNSQ19VUkk6YXBw
ZW5kOmxpYmMtbXVzbCA9ICJcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUlnbm9yZS1wd3JpdGV2
LXB3cml0ZTY0LXRlc3RzLW9uLW11c2wucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiODE3NDNlY2YyYTViNDQxODZiMmY1MDM4YWZkYzhiZWRhN2U1YzcwYWVkMTVi
NGZiZmJjYzZlOWVjZTI0NDkwZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0YmRlNjI0NjkyNjg5
MGRjZWU4MjRmNmU2YWM0MmEwNjc1MmY0N2Q3N2U1MDk3ZDg2ZTNjMGQ2ZDRiNzA5ZmU1IgogCiBp
bmhlcml0IGF1dG90b29scyBnaXRodWItcmVsZWFzZXMgcHRlc3QKIAotLSAKMi40Ny4xCgo=

--===============2088966030244473343==--

