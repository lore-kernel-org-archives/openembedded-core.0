Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E031CD3427
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:24 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2352.1762384576429757912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Tj1dHpof;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=e5tOoKEr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019a564e7c6d-e8074625-610f-4257-b766-82debfff61af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ANoZ56/UHxtBwqFjwK0acJV/in4LjRV1rTTkrGSxEp8=;
	b=Tj1dHpofS2EZaMFA0JHbZTIGbjpapkJVblK/VkneYACa6WekHmJv+f435vLd0pfM
	WwdHU/aarco58cQfRgWG/Pr8D14UoPFfjBpQdwX0kcnNV8WNz8x7s0znFpfUu2ggbaj
	85xfil9AnEAvqvU5OubFMbl7s53tJqIZrYlTZNao=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ANoZ56/UHxtBwqFjwK0acJV/in4LjRV1rTTkrGSxEp8=;
	b=e5tOoKErMOouIRVafDLXRsWXjlvf7ohkle53bDlvjPU0S0Ma/l50N6/k/MCpmoXI
	/WT14Aveu2PR8ASH9q0xxZy9qVqgrRlWXKkHcc+kroA0T3D5IVpsN3Ly3K2NbXDQF8c
	zpBkZoBGc8mSfd190fUXMmukwW5ZuAEgfC6dXlwQ=
Content-Type: multipart/mixed; boundary="===============6218716355449345356=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] coreutils: upgrading to 9.8 SUCCEEDED
Message-ID: <0101019a564e7c6d-e8074625-610f-4257-b766-82debfff61af-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225802

--===============6218716355449345356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *coreutils* to *9.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-coreutils-upgrade-9.7-9.8.patch
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
From 95d0586174cd3da26560561f2d9cff35a9d97e00 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 15:10:07 +0000
Subject: [PATCH] coreutils: upgrade 9.7 -> 9.8

---
 ...1-sort-fix-buffer-under-read-CWE-127.patch | 112 ------------------
 .../remove-usr-local-lib-from-m4.patch        |   4 +-
 .../{coreutils_9.7.bb => coreutils_9.8.bb}    |   3 +-
 3 files changed, 3 insertions(+), 116 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch
 rename meta/recipes-core/coreutils/{coreutils_9.7.bb => coreutils_9.8.bb} (98%)

diff --git a/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch b/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch
deleted file mode 100644
index 41be1635b5..0000000000
--- a/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 8763c305c29d0abb7e2be4695212b42917d054b2 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
-Date: Tue, 20 May 2025 16:03:44 +0100
-Subject: [PATCH] sort: fix buffer under-read (CWE-127)
-
-* src/sort.c (begfield): Check pointer adjustment
-to avoid Out-of-range pointer offset (CWE-823).
-(limfield): Likewise.
-* tests/sort/sort-field-limit.sh: Add a new test,
-which triggers with ASAN or Valgrind.
-* tests/local.mk: Reference the new test.
-* NEWS: Mention bug fix introduced in v7.2 (2009).
-Fixes https://bugs.gnu.org/78507
-
-CVE: CVE-2025-5278
-
-Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=8c9602e3a145e9596dc1a63c6ed67865814b6633]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/sort.c                     | 12 ++++++++++--
- tests/local.mk                 |  1 +
- tests/sort/sort-field-limit.sh | 35 ++++++++++++++++++++++++++++++++++
- 3 files changed, 46 insertions(+), 2 deletions(-)
- create mode 100755 tests/sort/sort-field-limit.sh
-
-diff --git a/src/sort.c b/src/sort.c
-index b10183b6f..7af1a2512 100644
---- a/src/sort.c
-+++ b/src/sort.c
-@@ -1644,7 +1644,11 @@ begfield (struct line const *line, struct keyfield const *key)
-       ++ptr;
- 
-   /* Advance PTR by SCHAR (if possible), but no further than LIM.  */
--  ptr = MIN (lim, ptr + schar);
-+  size_t remaining_bytes = lim - ptr;
-+  if (schar < remaining_bytes)
-+    ptr += schar;
-+  else
-+    ptr = lim;
- 
-   return ptr;
- }
-@@ -1746,7 +1750,11 @@ limfield (struct line const *line, struct keyfield const *key)
-           ++ptr;
- 
-       /* Advance PTR by ECHAR (if possible), but no further than LIM.  */
--      ptr = MIN (lim, ptr + echar);
-+      size_t remaining_bytes = lim - ptr;
-+      if (echar < remaining_bytes)
-+        ptr += echar;
-+      else
-+        ptr = lim;
-     }
- 
-   return ptr;
-diff --git a/tests/local.mk b/tests/local.mk
-index 4da6756ac..642d225fa 100644
---- a/tests/local.mk
-+++ b/tests/local.mk
-@@ -388,6 +388,7 @@ all_tests =					\
-   tests/sort/sort-debug-keys.sh			\
-   tests/sort/sort-debug-warn.sh			\
-   tests/sort/sort-discrim.sh			\
-+  tests/sort/sort-field-limit.sh		\
-   tests/sort/sort-files0-from.pl		\
-   tests/sort/sort-float.sh			\
-   tests/sort/sort-h-thousands-sep.sh		\
-diff --git a/tests/sort/sort-field-limit.sh b/tests/sort/sort-field-limit.sh
-new file mode 100755
-index 000000000..52d8e1d17
---- /dev/null
-+++ b/tests/sort/sort-field-limit.sh
-@@ -0,0 +1,35 @@
-+#!/bin/sh
-+# From 7.2-9.7, this would trigger an out of bounds mem read
-+
-+# Copyright (C) 2025 Free Software Foundation, Inc.
-+
-+# This program is free software: you can redistribute it and/or modify
-+# it under the terms of the GNU General Public License as published by
-+# the Free Software Foundation, either version 3 of the License, or
-+# (at your option) any later version.
-+
-+# This program is distributed in the hope that it will be useful,
-+# but WITHOUT ANY WARRANTY; without even the implied warranty of
-+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+# GNU General Public License for more details.
-+
-+# You should have received a copy of the GNU General Public License
-+# along with this program.  If not, see <https://www.gnu.org/licenses/>.
-+
-+. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
-+print_ver_ sort
-+getlimits_
-+
-+# This issue triggers with valgrind or ASAN
-+valgrind --error-exitcode=1 sort --version 2>/dev/null &&
-+  VALGRIND='valgrind --error-exitcode=1'
-+
-+{ printf '%s\n' aa bb; } > in || framework_failure_
-+
-+_POSIX2_VERSION=200809 $VALGRIND sort +0.${SIZE_MAX}R in > out || fail=1
-+compare in out || fail=1
-+
-+_POSIX2_VERSION=200809 $VALGRIND sort +1 -1.${SIZE_MAX}R in > out || fail=1
-+compare in out || fail=1
-+
-+Exit $fail
--- 
-2.34.1
-
diff --git a/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
index 718de0ab78..ab19ac16d4 100644
--- a/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
+++ b/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-from-m4.patch
@@ -1,4 +1,4 @@
-From f53ffb5b27ab7d4a4c62df00ebd6a1a6936d1709 Mon Sep 17 00:00:00 2001
+From 9aa1e97a9b4dd52b8c05eda81e6f8436d63520f2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 Aug 2011 14:12:30 -0700
 Subject: [PATCH] coreutils: Fix build on uclibc
@@ -17,7 +17,7 @@ Upstream-Status: Inappropriate [Upstream does care for AIX while we may not]
  1 file changed, 12 deletions(-)
 
 diff --git a/m4/getloadavg.m4 b/m4/getloadavg.m4
-index 9d0236f..68f7c52 100644
+index 0d80b64..7ed11e5 100644
 --- a/m4/getloadavg.m4
 +++ b/m4/getloadavg.m4
 @@ -46,18 +46,6 @@ if test $ac_cv_func_getloadavg != yes; then
diff --git a/meta/recipes-core/coreutils/coreutils_9.7.bb b/meta/recipes-core/coreutils/coreutils_9.8.bb
similarity index 98%
rename from meta/recipes-core/coreutils/coreutils_9.7.bb
rename to meta/recipes-core/coreutils/coreutils_9.8.bb
index 201be4144c..795d74582b 100644
--- a/meta/recipes-core/coreutils/coreutils_9.7.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.8.bb
@@ -15,10 +15,9 @@ inherit autotools gettext texinfo
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
-           file://0001-sort-fix-buffer-under-read-CWE-127.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "e8bb26ad0293f9b5a1fc43fb42ba970e312c66ce92c1b0b16713d7500db251bf"
+SRC_URI[sha256sum] = "e6d4fd2d852c9141a1c2a18a13d146a0cd7e45195f72293a4e4c044ec6ccca15"
 
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 #
-- 
2.47.1


--===============6218716355449345356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/coreutils/coreutils-ptest: FILELIST: removed "/usr/lib/coreutils/ptest/src/make-prime-list.o /usr/lib/coreutils/ptest/tests/misc/fold.pl /usr/lib/coreutils/ptest/src/make-prime-list", added "/usr/lib/coreutils/ptest/tests/stty/bad-speed.sh /usr/lib/coreutils/ptest/src/termios.c /usr/lib/coreutils/ptest/tests/date/date-thailand.sh /usr/lib/coreutils/ptest/tests/wc/wc-cpu.sh /usr/lib/coreutils/ptest/tests/fold/fold-zero-width.sh /usr/lib/coreutils/ptest/tests/date/date-iran.sh /usr/lib/coreutils/ptest/tests/readlink/readlink-posix.sh /usr/lib/coreutils/ptest/tests/fold/fold-characters.sh /usr/lib/coreutils/ptest/tests/fold/fold-nbsp.sh /usr/lib/coreutils/ptest/src/speedlist.h /usr/lib/coreutils/ptest/tests/fold/fold.pl /usr/lib/coreutils/ptest/tests/nproc/nproc-quota.sh /usr/lib/coreutils/ptest/src/copy-file-data.o /usr/lib/coreutils/ptest/tests/misc/option-aliases.sh /usr/lib/coreutils/ptest/src/copy-file-data.c /usr/lib/coreutils/ptest/tests/od/big-w.sh 
 /usr/lib/coreutils/ptest/tests/date/date-ethiopia.sh /usr/lib/coreutils/ptest/tests/cksum/cksum-sha3.sh /usr/lib/coreutils/ptest/tests/fold/fold-spaces.sh"
Changes to packages/x86_64-linux/gcc-cross-x86_64 (sysroot):
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-cpp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-15.2.0 was added
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
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cc1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cc1plus was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/collect2 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/g++-mapper-server was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixincl was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixinc.sh was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkheaders was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/liblto_plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/lto1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/lto-wrapper was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/gengtype was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/strip was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/x86_64-poky-linux/gcc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/adxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/ammintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxavx512intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxbf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxcomplexintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxfp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxfp8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxmovrsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtf32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtileintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtransposeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512convertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512mediaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512minmaxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512satcvtintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2convertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2copyintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2mediaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2minmaxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2satcvtintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bitalgvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512cdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512dqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fp16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vldqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxneconvertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniint16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cet.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cldemoteintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clflushoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clwbintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clzerointrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cmpccxaddintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cpuid.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cross-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/emmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/enqcmdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/f16cintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include-fixed was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include-fixed/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/float.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fma4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fxsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/gfniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/hresetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/ia32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/immintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/iso646.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/keylockerintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/lwpintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/lzcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mm3dnow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mm_malloc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/movdirintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/movrsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mwaitintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mwaitxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/nmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pconfigintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pkuintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/popcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/prfchiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/prfchwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/quadmath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/quadmath_weak.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/raointintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/rdseedintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/rtmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/serializeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sgxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sha512intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/shaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sm3intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sm4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/smmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdalign.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdatomic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdbool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdckdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stddef.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdfix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdint-gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdnoreturn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/syslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tbmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/uintrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/unwind.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/usermsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/vaesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/varargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/waitpkgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/wmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/x86gprintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/x86intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xopintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsavecintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsaveintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsaveoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsavesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xtestintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixinc_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/macro_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkheaders.conf was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/gtype.state was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/addresses.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/align.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/all-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/access-diagram.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analysis-plan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-language.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-logging.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-selftests.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/bar-chart.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-details.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-info.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/checker-event.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/checker-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/complexity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/constraint-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/diagnostic-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/engine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/event-loc-info.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/exploded-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/feasible-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/function-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/inlining-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/known-function-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/pending-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/program-point.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/program-state.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/ranges.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/reachability.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/record-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model-reachability.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/sm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/state-purge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/store.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/supergraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/svalue.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/symbol.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/trimmed-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ansidecl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/array-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/asan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attribs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attr-urls.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/auto-host.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/auto-profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/avoid-store-forwarding.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/backend.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/basic-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/b-header-vars was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtins.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtin-types.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/calls.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ccmp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c/c-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfganal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfghooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cgraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cif-code.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect2.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/color-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/conditions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/configargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/elfos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/biarch64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/convert.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coretypes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coverage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/contracts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-trait.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/operators.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cppdefault.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cpplib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/crc-verification.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cselib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ctfc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/d was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/data-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ddg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/debug.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/defaults.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/df.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dfp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-buffer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-client-data-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-diagram.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format-sarif.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format-text.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-highlight-colors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-label-effects.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-macro-unwinding.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-output-file.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/digraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dojump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dominance.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/domwalk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/double-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dump-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dumpfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2codeview.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/edit-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/errors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/escaped_string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/et-forest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/except.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/explow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/expmed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/file-find.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/filenames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fixed-value.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/flag-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fold-const.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/function-abi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-urlifier.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-urlifier.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcov-io.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcse-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/generic-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gengtype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/genrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gensupport.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ggc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-lower-bitint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-infer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-phi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimplify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/glimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphite.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphviz.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsstruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsyms.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hashtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-table.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hosthooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hwint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ifcvt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/inchash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/incpath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/input.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-addr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-attr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-codes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-modes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-opinit.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/internal-fn.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/internal-fn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/intl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-cp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-locality-cloning.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-strub.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ira.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ira-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/is-a.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/json-parsing.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/label-text.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/langhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lazy-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lcm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libgdiagnostics++.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libgdiagnostics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libiberty.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libsarifreplay.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/limitx.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/limity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/line-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lockfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lra-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-compress.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-ltrans-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/m2 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/m2/m2-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/machmode.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/machmode.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/make-unique.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/md5.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/memmodel.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/memory-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mem-stats.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mode-classes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mux-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/objc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/obstack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-expand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-general.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-offload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-selectors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/options.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opt-problem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts-jobserver.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/output.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pair-fusion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/passes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pass-instances.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pass_manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin-version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pointer-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/poly-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/predict.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/prefix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-format-impl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-markup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-urlifier.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/print-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/print-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/profile-count.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range-op-mixed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/read-md.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/real.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/realmpfr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/recog.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regcprop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/reg-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regrename.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/reload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/resource.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlanal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-error.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlhash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sanitizer.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sarif-spec-urls.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sched-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic-show-locus.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sese.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/signop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/simple-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sparseset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/spellcheck.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sreal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/statistics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stmt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stor-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stringpool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/substring-locations.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/system.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-globals.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-insns.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/targhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/text-range-label.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/timevar.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/timevar.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm_p.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm-preds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/toplev.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tracer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/trans-mem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-affine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-check.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-eh.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-nested.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pretty-print-markup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-sra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/treestruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tristate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tsystem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/typeclass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ubsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/unique-argv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/valtrack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-prof.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range-storage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-relation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/varasm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vr-values.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/xcoff.h was added
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-cpp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-15.2.0 was removed
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
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cc1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cc1plus was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/collect2 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/g++-mapper-server was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixincl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkheaders was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/liblto_plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/lto1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/lto-wrapper was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/gengtype was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/strip was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/x86_64-poky-linux-musl/gcc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/adxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/ammintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxavx512intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxbf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxcomplexintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxfp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxfp8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxmovrsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtf32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtileintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtransposeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512convertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512mediaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512minmaxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512satcvtintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2convertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2copyintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2mediaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2minmaxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2satcvtintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bitalgvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512cdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512dqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxneconvertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniint16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cet.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cldemoteintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clflushoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clwbintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clzerointrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cmpccxaddintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cpuid.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cross-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/emmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/enqcmdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/f16cintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include-fixed was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include-fixed/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/float.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fma4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fxsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/gfniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/hresetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/ia32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/immintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/iso646.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/keylockerintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/lwpintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/lzcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mm3dnow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mm_malloc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/movdirintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/movrsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mwaitintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mwaitxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/nmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pconfigintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pkuintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/popcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/prfchiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/prfchwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/quadmath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/quadmath_weak.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/raointintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/rdseedintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/rtmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/serializeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sgxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sha512intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/shaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sm3intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sm4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/smmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdalign.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdatomic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdbool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdckdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stddef.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdfix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdint-gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdnoreturn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/syslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tbmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/uintrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/unwind.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/usermsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/vaesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/varargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/waitpkgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/wmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/x86gprintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/x86intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xopintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsavecintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsaveintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsavesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xtestintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixinc_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/macro_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/gtype.state was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/addresses.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/align.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/all-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/access-diagram.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analysis-plan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-language.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-logging.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-selftests.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/bar-chart.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-details.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-info.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/checker-event.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/checker-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/complexity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/constraint-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/diagnostic-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/engine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/event-loc-info.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/exploded-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/feasible-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/function-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/inlining-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/known-function-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/pending-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/program-point.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/program-state.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/ranges.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/reachability.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/record-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model-reachability.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/sm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/state-purge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/store.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/supergraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/svalue.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/symbol.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/trimmed-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/array-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/asan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attribs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attr-urls.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/auto-host.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/avoid-store-forwarding.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/backend.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/basic-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/b-header-vars was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtins.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/calls.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ccmp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c/c-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfganal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cgraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cif-code.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect2.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/color-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/conditions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/configargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/biarch64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/convert.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coretypes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coverage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/contracts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-trait.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cpplib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/crc-verification.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cselib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ctfc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/d was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ddg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/debug.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/defaults.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/df.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dfp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-buffer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-client-data-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-diagram.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format-sarif.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format-text.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-highlight-colors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-label-effects.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-macro-unwinding.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-output-file.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/digraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dojump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dominance.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/domwalk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/double-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dump-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2codeview.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/edit-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/errors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/et-forest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/except.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/explow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/expmed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/file-find.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/filenames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/flag-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fold-const.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/function-abi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-urlifier.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-urlifier.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/generic-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gengtype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/genrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gensupport.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ggc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-lower-bitint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-infer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-phi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimplify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/glimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphite.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphviz.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsyms.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hashtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-table.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hwint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/inchash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/incpath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/input.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-opinit.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/intl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-cp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-locality-cloning.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-strub.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ira.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ira-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/is-a.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/json-parsing.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/label-text.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/langhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lazy-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lcm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libgdiagnostics++.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libgdiagnostics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libiberty.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libsarifreplay.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/limitx.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/limity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/line-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lockfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lra-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-ltrans-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/m2 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/m2/m2-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/machmode.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/machmode.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/make-unique.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/md5.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/memmodel.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/memory-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/objc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/obstack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-general.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-selectors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/options.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts-jobserver.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/output.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pair-fusion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/passes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pointer-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/poly-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/predict.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/prefix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-format-impl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-markup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-urlifier.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/print-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/profile-count.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range-op-mixed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/read-md.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/real.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/recog.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regcprop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regrename.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/reload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/resource.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sarif-spec-urls.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sched-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic-show-locus.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sese.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/signop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/simple-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sparseset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sreal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/statistics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stmt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stringpool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/system.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-globals.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-insns.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/targhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/text-range-label.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/timevar.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/timevar.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm_p.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/toplev.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tracer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-check.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pretty-print-markup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/treestruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tristate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tsystem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/typeclass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ubsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/unique-argv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/valtrack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-prof.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range-storage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-relation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/varasm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vr-values.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/xcoff.h was removed

--===============6218716355449345356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/coreutils/coreutils-dbg: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-dbg: FILELIST: removed "/usr/lib/coreutils/ptest/src/.debug/make-prime-list /usr/lib/coreutils/ptest/src/.debug/make-prime-list.o", added "/usr/lib/coreutils/ptest/src/.debug/copy-file-data.o"
packages/x86-64-v3-poky-linux/coreutils/coreutils-dbg: PKGSIZE changed from 65860856 to 63111200 (-4%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-dbg: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-dev: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-dev: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-doc: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-doc: PKGSIZE changed from 1286556 to 1307633 (+2%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-doc: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-af: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-af: PKGSIZE changed from 25829 to 25782 (-0%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-af: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-be: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-be: PKGSIZE changed from 53005 to 52328 (-1%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-be: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-bg: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-bg: PKGSIZE changed from 506440 to 488922 (-3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-bg: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ca: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ca: PKGSIZE changed from 365963 to 353910 (-3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ca: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-cs: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-cs: PKGSIZE changed from 391432 to 378373 (-3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-cs: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-da: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-da: PKGSIZE changed from 330255 to 319906 (-3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-da: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-de: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-de: PKGSIZE changed from 394589 to 395469 (+0%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-de: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-el: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-el: PKGSIZE changed from 22750 to 22407 (-2%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-el: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-eo: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-eo: PKGSIZE changed from 140320 to 137535 (-2%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-eo: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-es: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-es: PKGSIZE changed from 205590 to 201163 (-2%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-es: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-et: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-et: PKGSIZE changed from 361485 to 362335 (+0%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-et: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-eu: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-eu: PKGSIZE changed from 25920 to 25212 (-3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-eu: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-fi: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-fi: PKGSIZE changed from 106502 to 104560 (-2%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-fi: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-fr: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-fr: PKGSIZE changed from 402499 to 403430 (+0%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-fr: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ga: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ga: PKGSIZE changed from 99006 to 97426 (-2%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ga: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-gl: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-gl: PKGSIZE changed from 24925 to 24355 (-2%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-gl: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-hr: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-hr: PKGSIZE changed from 376593 to 364444 (-3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-hr: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-hu: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-hu: PKGSIZE changed from 277180 to 270053 (-3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-hu: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ia: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ia: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-id: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-id: PKGSIZE changed from 121545 to 119337 (-2%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-id: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-it: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-it: PKGSIZE changed from 136899 to 133738 (-2%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-it: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ja: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ja: PKGSIZE changed from 380568 to 393223 (+3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ja: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ka: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ka: PKGSIZE changed from 120492 to 129695 (+8%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ka: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-kk: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-kk: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ko: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ko: PKGSIZE changed from 398405 to 399133 (+0%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ko: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-lg: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-lg: PKGSIZE changed from 175237 to 171064 (-2%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-lg: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-lt: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-lt: PKGSIZE changed from 28247 to 28070 (-1%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-lt: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ms: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ms: PKGSIZE changed from 20607 to 20551 (-0%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ms: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-nb: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-nb: PKGSIZE changed from 312018 to 301594 (-3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-nb: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-nl: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-nl: PKGSIZE changed from 358268 to 364969 (+2%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-nl: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-pl: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-pl: PKGSIZE changed from 390886 to 391706 (+0%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-pl: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-pt-br: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-pt-br: PKGSIZE changed from 281660 to 274076 (-3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-pt-br: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-pt: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-pt: PKGSIZE changed from 372207 to 373032 (+0%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-pt: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ro: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ro: PKGSIZE changed from 405513 to 406268 (+0%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ro: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ru: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ru: PKGSIZE changed from 421079 to 406643 (-3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ru: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-sk: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-sk: PKGSIZE changed from 64255 to 63812 (-1%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-sk: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-sl: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-sl: PKGSIZE changed from 319609 to 311336 (-3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-sl: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-sr: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-sr: PKGSIZE changed from 473446 to 460983 (-3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-sr: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-sv: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-sv: PKGSIZE changed from 370151 to 370901 (+0%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-sv: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ta: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ta: PKGSIZE changed from 52097 to 51799 (-1%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-ta: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-tr: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-tr: PKGSIZE changed from 316713 to 306039 (-3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-tr: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-uk: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-uk: PKGSIZE changed from 493286 to 494201 (+0%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-uk: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-vi: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-vi: PKGSIZE changed from 289478 to 281615 (-3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-vi: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-zh-cn: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-zh-cn: PKGSIZE changed from 366972 to 367674 (+0%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-zh-cn: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-zh-tw: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-zh-tw: PKGSIZE changed from 255442 to 249384 (-2%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-locale-zh-tw: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-ptest: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-ptest: FILELIST: removed "/usr/lib/coreutils/ptest/src/make-prime-list /usr/lib/coreutils/ptest/src/make-prime-list.o /usr/lib/coreutils/ptest/tests/misc/fold.pl", added "/usr/lib/coreutils/ptest/tests/fold/fold-nbsp.sh /usr/lib/coreutils/ptest/tests/fold/fold-characters.sh /usr/lib/coreutils/ptest/src/speedlist.h /usr/lib/coreutils/ptest/tests/date/date-thailand.sh /usr/lib/coreutils/ptest/tests/date/date-ethiopia.sh /usr/lib/coreutils/ptest/tests/cksum/cksum-sha3.sh /usr/lib/coreutils/ptest/tests/stty/bad-speed.sh /usr/lib/coreutils/ptest/tests/nproc/nproc-quota.sh /usr/lib/coreutils/ptest/tests/fold/fold-spaces.sh /usr/lib/coreutils/ptest/tests/misc/option-aliases.sh /usr/lib/coreutils/ptest/tests/readlink/readlink-posix.sh /usr/lib/coreutils/ptest/tests/fold/fold.pl /usr/lib/coreutils/ptest/src/copy-file-data.c /usr/lib/coreutils/ptest/tests/date/date-iran.sh /usr/lib/coreutils/ptest/tests/fold/fold-zero-width.sh /usr/lib/coreutil
 s/ptest/src/copy-file-data.o /usr/lib/coreutils/ptest/src/termios.c /usr/lib/coreutils/ptest/tests/od/big-w.sh /usr/lib/coreutils/ptest/tests/wc/wc-cpu.sh"
packages/x86-64-v3-poky-linux/coreutils/coreutils-ptest: PKGSIZE changed from 16689589 to 16825281 (+1%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-ptest: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-src: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-src: FILELIST: directory renamed /usr/src/debug/coreutils/9.7/lib/selinux -> /usr/src/debug/coreutils/9.8/lib/selinux, directory renamed /usr/src/debug/coreutils/9.7/lib/sys -> /usr/src/debug/coreutils/9.8/lib/sys, directory renamed /usr/src/debug/coreutils/9.7/lib/malloc -> /usr/src/debug/coreutils/9.8/lib/malloc, removed "/usr/src/debug/coreutils/9.7/lib/dirent.h /usr/src/debug/coreutils/9.7/lib/unistd.h /usr/src/debug/coreutils/9.7/lib/string.h /usr/src/debug/coreutils/9.7/lib/signal.h /usr/src/debug/coreutils/9.7/lib/stdlib.h /usr/src/debug/coreutils/9.7/lib/unistr.h /usr/src/debug/coreutils/9.7/lib/unitypes.h /usr/src/debug/coreutils/9.7/src/version.c /usr/src/debug/coreutils/9.7/lib/wchar.h /usr/src/debug/coreutils/9.7/lib/langinfo.h /usr/src/debug/coreutils/9.7/lib/fnmatch.h /usr/src/debug/coreutils/9.7/lib/obstack.h /usr/src/debug/coreutils/9.7/lib/stdio.h /usr/src/debug/coreutils/9.7/lib/fcntl.h /usr/src/debug/coreutils/9.7/s
 rc/version.h /usr/src/debug/coreutils/9.7/lib/time.h /usr/src/debug/coreutils/9.7/lib/uchar.h /usr/src/debug/coreutils/9.7/lib/error.h", added "/usr/src/debug/coreutils/9.8/lib/langinfo.h /usr/src/debug/coreutils/9.8/lib/time.h /usr/src/debug/coreutils/9.8/src/speedlist.h /usr/src/debug/coreutils/9.8/lib/stdio.h /usr/src/debug/coreutils/9.8/lib/fcntl.h /usr/src/debug/coreutils/9.8/lib/uchar.h /usr/src/debug/coreutils/9.8/lib/error.h /usr/src/debug/coreutils/9.8/lib/fts_.h /usr/src/debug/coreutils/9.8/lib/unitypes.h /usr/src/debug/coreutils/9.8/lib/wchar.h /usr/src/debug/coreutils/9.8/lib/dirent.h /usr/src/debug/coreutils/9.8/lib/signal.h /usr/src/debug/coreutils/9.8/lib/stdlib.h /usr/src/debug/coreutils/9.8/lib/string.h /usr/src/debug/coreutils/9.8/lib/unistd.h /usr/src/debug/coreutils/9.8/lib/unistr.h /usr/src/debug/coreutils/9.8/src/version.c /usr/src/debug/coreutils/9.8/lib/fnmatch.h /usr/src/debug/coreutils/9.8/lib/obstack.h /usr/src/debug/coreutils/9.8/src/version.h"
packages/x86-64-v3-poky-linux/coreutils/coreutils-src: PKGSIZE changed from 917009 to 948903 (+3%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-src: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-staticdev: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-staticdev: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils-stdbuf: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils-stdbuf: PKGSIZE changed from 90256 to 86160 (-5%)
packages/x86-64-v3-poky-linux/coreutils/coreutils-stdbuf: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils/coreutils: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils/coreutils: PKGSIZE changed from 8005464 to 8058712 (+1%)
packages/x86-64-v3-poky-linux/coreutils/coreutils: PV changed from "9.7" to "9.8"
packages/x86-64-v3-poky-linux/coreutils: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/coreutils/coreutils-9.7.tar.xz file://remove-usr-local-lib-from-m4.patch file://0001-sort-fix-buffer-under-read-CWE-127.patch file://run-ptest" to "https://ftpmirror.gnu.org/gnu/coreutils/coreutils-9.8.tar.xz file://remove-usr-local-lib-from-m4.patch file://run-ptest"
packages/x86-64-v3-poky-linux/coreutils: PKGV changed from 9.7 [default] to 9.8 [default]
packages/x86-64-v3-poky-linux/coreutils: PV changed from "9.7" to "9.8"
Changes to packages/x86_64-linux/gcc-cross-x86_64 (sysroot):
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-cpp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-15.2.0 was added
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
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cc1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cc1plus was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/collect2 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/g++-mapper-server was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixincl was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixinc.sh was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkheaders was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcc1.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/libcp1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/liblto_plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/lto1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/lto-wrapper was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/gengtype was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/strip was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/x86_64-poky-linux/gcc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/adxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/ammintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxavx512intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxbf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxcomplexintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxfp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxfp8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxmovrsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtf32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtileintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/amxtransposeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512convertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512mediaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512minmaxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2-512satcvtintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2convertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2copyintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2mediaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2minmaxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx10_2satcvtintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bitalgvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512bwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512cdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512dqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512fp16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vldqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxneconvertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniint16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/avxvnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/bmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cet.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cldemoteintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clflushoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clwbintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/clzerointrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cmpccxaddintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cpuid.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/cross-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/emmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/enqcmdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/f16cintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include-fixed was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include-fixed/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/float.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fma4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/fxsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/gfniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/hresetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/ia32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/immintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/iso646.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/keylockerintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/lwpintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/lzcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mm3dnow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mm_malloc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/movdirintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/movrsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mwaitintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/mwaitxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/nmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pconfigintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pkuintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/pmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/popcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/prfchiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/prfchwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/quadmath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/quadmath_weak.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/raointintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/rdseedintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/rtmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/serializeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sgxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sha512intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/shaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sm3intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/sm4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/smmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdalign.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdatomic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdbool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdckdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stddef.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdfix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdint-gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/stdnoreturn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/syslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tbmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/uintrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/unwind.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/usermsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/vaesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/varargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/waitpkgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/wmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/x86gprintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/x86intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xopintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsavecintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsaveintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsaveoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xsavesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/include/xtestintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/fixinc_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/include/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/macro_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/install-tools/mkheaders.conf was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/gtype.state was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/addresses.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/align.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/all-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/access-diagram.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analysis-plan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-language.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-logging.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/analyzer-selftests.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/bar-chart.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-details.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-info.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/call-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/checker-event.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/checker-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/complexity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/constraint-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/diagnostic-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/engine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/event-loc-info.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/exploded-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/feasible-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/function-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/inlining-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/known-function-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/pending-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/program-point.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/program-state.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/ranges.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/reachability.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/record-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model-manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/region-model-reachability.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/sm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/state-purge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/store.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/supergraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/svalue.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/symbol.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/analyzer/trimmed-graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ansidecl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/array-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/asan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attribs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/attr-urls.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/auto-host.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/auto-profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/avoid-store-forwarding.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/backend.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/basic-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/b-header-vars was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtins.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/builtin-types.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/bversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/calls.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ccmp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c/c-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfganal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfghooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cgraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cif-code.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect2.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/collect-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/color-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/conditions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/configargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/elfos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/biarch64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/convert.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coretypes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/coverage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/contracts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-trait.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/operators.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cppdefault.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cpplib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/crc-verification.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/cselib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ctfc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/c-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/d was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/data-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ddg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/debug.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/defaults.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/df.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dfp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-buffer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-client-data-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-diagram.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format-sarif.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-format-text.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-highlight-colors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-label-effects.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-macro-unwinding.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-output-file.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/digraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dojump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dominance.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/domwalk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/double-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dump-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dumpfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2codeview.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/edit-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/errors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/escaped_string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/et-forest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/except.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/explow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/expmed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/file-find.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/filenames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fixed-value.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/flag-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/fold-const.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/function-abi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-urlifier.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcc-urlifier.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcov-io.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcse-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gcse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/generic-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gengtype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/genrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gensupport.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ggc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-lower-bitint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-infer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-phi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimplify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/glimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphite.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/graphviz.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsstruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsyms.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hashtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-table.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hosthooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/hwint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ifcvt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/inchash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/incpath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/input.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-addr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-attr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-codes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-modes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/insn-opinit.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/internal-fn.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/internal-fn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/intl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-cp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-locality-cloning.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-strub.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ira.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ira-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/is-a.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/json-parsing.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/label-text.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/langhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lazy-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lcm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libgdiagnostics++.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libgdiagnostics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libiberty.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/libsarifreplay.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/limitx.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/limity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/line-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lockfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lra-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-compress.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-ltrans-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/m2 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/m2/m2-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/machmode.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/machmode.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/make-unique.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/md5.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/memmodel.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/memory-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mem-stats.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mode-classes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/mux-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/objc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/obstack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-expand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-general.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-offload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-selectors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/optinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/options.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opt-problem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opts-jobserver.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/output.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pair-fusion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/passes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pass-instances.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pass_manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/plugin-version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pointer-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/poly-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/predict.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/prefix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-format-impl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-markup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/pretty-print-urlifier.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/print-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/print-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/profile-count.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/range-op-mixed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/read-md.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/real.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/realmpfr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/recog.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regcprop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/reg-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regrename.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/regs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/reload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/resource.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlanal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-error.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlhash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sanitizer.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sarif-spec-urls.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sched-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-diagnostic-show-locus.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/selftest-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sese.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/signop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/simple-diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sparseset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/spellcheck.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sreal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/statistics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stmt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stor-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/stringpool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/substring-locations.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/system.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-globals.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/target-insns.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/targhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/text-range-label.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/timevar.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/timevar.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm_p.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tm-preds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/toplev.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tracer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/trans-mem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-affine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-check.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-eh.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-nested.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-pretty-print-markup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-sra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/treestruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tristate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/tsystem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/typeclass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/ubsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/unique-argv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/valtrack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-prof.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-range-storage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/value-relation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/varasm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vr-values.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/15.2.0/plugin/include/xcoff.h was added
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-cpp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-15.2.0 was removed
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
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cc1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cc1plus was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/collect2 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/g++-mapper-server was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixincl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkheaders was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcc1.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/libcp1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/liblto_plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/lto1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/lto-wrapper was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/gengtype was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/strip was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/x86_64-poky-linux-musl/gcc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/adxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/ammintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxavx512intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxbf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxcomplexintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxfp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxfp8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxmovrsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtf32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtileintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/amxtransposeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512convertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512mediaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512minmaxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2-512satcvtintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2convertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2copyintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2mediaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2minmaxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx10_2satcvtintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bitalgvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512bwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512cdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512dqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxneconvertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniint16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/avxvnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/bmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cet.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cldemoteintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clflushoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clwbintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/clzerointrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cmpccxaddintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cpuid.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/cross-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/emmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/enqcmdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/f16cintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include-fixed was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include-fixed/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/float.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fma4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/fxsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/gfniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/hresetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/ia32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/immintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/iso646.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/keylockerintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/lwpintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/lzcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mm3dnow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mm_malloc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/movdirintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/movrsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mwaitintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/mwaitxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/nmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pconfigintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pkuintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/pmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/popcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/prfchiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/prfchwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/quadmath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/quadmath_weak.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/raointintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/rdseedintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/rtmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/serializeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sgxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sha512intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/shaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sm3intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/sm4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/smmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdalign.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdatomic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdbool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdckdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stddef.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdfix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdint-gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/stdnoreturn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/syslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tbmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/uintrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/unwind.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/usermsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/vaesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/varargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/waitpkgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/wmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/x86gprintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/x86intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xopintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsavecintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsaveintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xsavesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/include/xtestintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/fixinc_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/include/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/macro_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/gtype.state was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/addresses.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/align.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/all-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/access-diagram.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analysis-plan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-language.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-logging.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/analyzer-selftests.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/bar-chart.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-details.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-info.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/call-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/checker-event.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/checker-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/complexity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/constraint-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/diagnostic-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/engine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/event-loc-info.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/exploded-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/feasible-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/function-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/inlining-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/known-function-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/pending-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/program-point.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/program-state.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/ranges.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/reachability.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/record-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model-manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/region-model-reachability.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/sm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/state-purge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/store.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/supergraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/svalue.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/symbol.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/analyzer/trimmed-graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/array-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/asan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attribs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/attr-urls.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/auto-host.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/avoid-store-forwarding.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/backend.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/basic-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/b-header-vars was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtins.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/bversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/calls.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ccmp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c/c-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfganal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cgraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cif-code.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect2.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/color-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/conditions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/configargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/biarch64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/convert.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coretypes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/coverage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/contracts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-trait.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cpplib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/crc-verification.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/cselib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ctfc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/c-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/d was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ddg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/debug.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/defaults.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/df.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dfp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-buffer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-client-data-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-diagram.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format-sarif.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-format-text.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-highlight-colors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-label-effects.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-macro-unwinding.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-output-file.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/digraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dojump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dominance.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/domwalk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/double-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dump-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2codeview.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/edit-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/errors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/et-forest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/except.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/explow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/expmed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/file-find.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/filenames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/flag-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/fold-const.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/function-abi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-urlifier.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcc-urlifier.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gcse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/generic-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gengtype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/genrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gensupport.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ggc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-lower-bitint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-infer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-phi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimplify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/glimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphite.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/graphviz.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsyms.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hashtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-table.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/hwint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/inchash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/incpath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/input.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/insn-opinit.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/intl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-cp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-locality-cloning.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-strub.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ira.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ira-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/is-a.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/json-parsing.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/label-text.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/langhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lazy-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lcm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libgdiagnostics++.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libgdiagnostics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libiberty.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/libsarifreplay.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/limitx.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/limity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/line-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lockfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lra-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-ltrans-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/m2 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/m2/m2-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/machmode.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/machmode.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/make-unique.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/md5.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/memmodel.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/memory-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/objc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/obstack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-general.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-selectors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/optinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/options.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opts-jobserver.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/output.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pair-fusion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/passes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pointer-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/poly-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/predict.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/prefix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-format-impl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-markup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/pretty-print-urlifier.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/print-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/profile-count.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/range-op-mixed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/read-md.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/real.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/recog.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regcprop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regrename.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/regs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/reload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/resource.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sarif-spec-urls.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sched-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-diagnostic-show-locus.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/selftest-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sese.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/signop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/simple-diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sparseset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sreal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/statistics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stmt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/stringpool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/system.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-globals.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/target-insns.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/targhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/text-range-label.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/timevar.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/timevar.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm_p.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/toplev.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tracer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-check.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-pretty-print-markup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/treestruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tristate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/tsystem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/typeclass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/ubsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/unique-argv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/valtrack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-prof.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-range-storage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/value-relation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/varasm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vr-values.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/plugin/include/xcoff.h was removed

--===============6218716355449345356==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-coreutils-upgrade-9.7-9.8.patch"

RnJvbSA5NWQwNTg2MTc0Y2QzZGEyNjU2MDU2MWYyZDljZmYzNWE5ZDk3ZTAwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNToxMDowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNv
cmV1dGlsczogdXBncmFkZSA5LjcgLT4gOS44CgotLS0KIC4uLjEtc29ydC1maXgtYnVmZmVyLXVu
ZGVyLXJlYWQtQ1dFLTEyNy5wYXRjaCB8IDExMiAtLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi9yZW1v
dmUtdXNyLWxvY2FsLWxpYi1mcm9tLW00LnBhdGNoICAgICAgICB8ICAgNCArLQogLi4uL3tjb3Jl
dXRpbHNfOS43LmJiID0+IGNvcmV1dGlsc185LjguYmJ9ICAgIHwgICAzICstCiAzIGZpbGVzIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTE2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRpbHMvMDAwMS1zb3J0LWZpeC1i
dWZmZXItdW5kZXItcmVhZC1DV0UtMTI3LnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUv
Y29yZXV0aWxzL3tjb3JldXRpbHNfOS43LmJiID0+IGNvcmV1dGlsc185LjguYmJ9ICg5OCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvY29yZXV0aWxzL2NvcmV1dGlscy8wMDAxLXNv
cnQtZml4LWJ1ZmZlci11bmRlci1yZWFkLUNXRS0xMjcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29y
ZS9jb3JldXRpbHMvY29yZXV0aWxzLzAwMDEtc29ydC1maXgtYnVmZmVyLXVuZGVyLXJlYWQtQ1dF
LTEyNy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNDFiZTE2MzViNS4uMDAw
MDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMvY29yZXV0aWxzLzAwMDEt
c29ydC1maXgtYnVmZmVyLXVuZGVyLXJlYWQtQ1dFLTEyNy5wYXRjaAorKysgL2Rldi9udWxsCkBA
IC0xLDExMiArMCwwIEBACi1Gcm9tIDg3NjNjMzA1YzI5ZDBhYmI3ZTJiZTQ2OTUyMTJiNDI5MTdk
MDU0YjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiA9P1VURi04P3E/UD1DMz1BMWRy
YWlnPTIwQnJhZHk/PSA8UEBkcmFpZ0JyYWR5LmNvbT4KLURhdGU6IFR1ZSwgMjAgTWF5IDIwMjUg
MTY6MDM6NDQgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gc29ydDogZml4IGJ1ZmZlciB1bmRlci1y
ZWFkIChDV0UtMTI3KQotCi0qIHNyYy9zb3J0LmMgKGJlZ2ZpZWxkKTogQ2hlY2sgcG9pbnRlciBh
ZGp1c3RtZW50Ci10byBhdm9pZCBPdXQtb2YtcmFuZ2UgcG9pbnRlciBvZmZzZXQgKENXRS04MjMp
LgotKGxpbWZpZWxkKTogTGlrZXdpc2UuCi0qIHRlc3RzL3NvcnQvc29ydC1maWVsZC1saW1pdC5z
aDogQWRkIGEgbmV3IHRlc3QsCi13aGljaCB0cmlnZ2VycyB3aXRoIEFTQU4gb3IgVmFsZ3JpbmQu
Ci0qIHRlc3RzL2xvY2FsLm1rOiBSZWZlcmVuY2UgdGhlIG5ldyB0ZXN0LgotKiBORVdTOiBNZW50
aW9uIGJ1ZyBmaXggaW50cm9kdWNlZCBpbiB2Ny4yICgyMDA5KS4KLUZpeGVzIGh0dHBzOi8vYnVn
cy5nbnUub3JnLzc4NTA3Ci0KLUNWRTogQ1ZFLTIwMjUtNTI3OAotCi1VcHN0cmVhbS1TdGF0dXM6
IEJhY2twb3J0IFtodHRwczovL2NnaXQuZ2l0LnNhdmFubmFoLmdudS5vcmcvY2dpdC9jb3JldXRp
bHMuZ2l0L2NvbW1pdC8/aWQ9OGM5NjAyZTNhMTQ1ZTk1OTZkYzFhNjNjNmVkNjc4NjU4MTRiNjYz
M10KLQotU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgotLS0t
Ci0gc3JjL3NvcnQuYyAgICAgICAgICAgICAgICAgICAgIHwgMTIgKysrKysrKysrKy0tCi0gdGVz
dHMvbG9jYWwubWsgICAgICAgICAgICAgICAgIHwgIDEgKwotIHRlc3RzL3NvcnQvc29ydC1maWVs
ZC1saW1pdC5zaCB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKLSAzIGZp
bGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCi0gY3JlYXRlIG1v
ZGUgMTAwNzU1IHRlc3RzL3NvcnQvc29ydC1maWVsZC1saW1pdC5zaAotCi1kaWZmIC0tZ2l0IGEv
c3JjL3NvcnQuYyBiL3NyYy9zb3J0LmMKLWluZGV4IGIxMDE4M2I2Zi4uN2FmMWEyNTEyIDEwMDY0
NAotLS0tIGEvc3JjL3NvcnQuYwotKysrIGIvc3JjL3NvcnQuYwotQEAgLTE2NDQsNyArMTY0NCwx
MSBAQCBiZWdmaWVsZCAoc3RydWN0IGxpbmUgY29uc3QgKmxpbmUsIHN0cnVjdCBrZXlmaWVsZCBj
b25zdCAqa2V5KQotICAgICAgICsrcHRyOwotIAotICAgLyogQWR2YW5jZSBQVFIgYnkgU0NIQVIg
KGlmIHBvc3NpYmxlKSwgYnV0IG5vIGZ1cnRoZXIgdGhhbiBMSU0uICAqLwotLSAgcHRyID0gTUlO
IChsaW0sIHB0ciArIHNjaGFyKTsKLSsgIHNpemVfdCByZW1haW5pbmdfYnl0ZXMgPSBsaW0gLSBw
dHI7Ci0rICBpZiAoc2NoYXIgPCByZW1haW5pbmdfYnl0ZXMpCi0rICAgIHB0ciArPSBzY2hhcjsK
LSsgIGVsc2UKLSsgICAgcHRyID0gbGltOwotIAotICAgcmV0dXJuIHB0cjsKLSB9Ci1AQCAtMTc0
Niw3ICsxNzUwLDExIEBAIGxpbWZpZWxkIChzdHJ1Y3QgbGluZSBjb25zdCAqbGluZSwgc3RydWN0
IGtleWZpZWxkIGNvbnN0ICprZXkpCi0gICAgICAgICAgICsrcHRyOwotIAotICAgICAgIC8qIEFk
dmFuY2UgUFRSIGJ5IEVDSEFSIChpZiBwb3NzaWJsZSksIGJ1dCBubyBmdXJ0aGVyIHRoYW4gTElN
LiAgKi8KLS0gICAgICBwdHIgPSBNSU4gKGxpbSwgcHRyICsgZWNoYXIpOwotKyAgICAgIHNpemVf
dCByZW1haW5pbmdfYnl0ZXMgPSBsaW0gLSBwdHI7Ci0rICAgICAgaWYgKGVjaGFyIDwgcmVtYWlu
aW5nX2J5dGVzKQotKyAgICAgICAgcHRyICs9IGVjaGFyOwotKyAgICAgIGVsc2UKLSsgICAgICAg
IHB0ciA9IGxpbTsKLSAgICAgfQotIAotICAgcmV0dXJuIHB0cjsKLWRpZmYgLS1naXQgYS90ZXN0
cy9sb2NhbC5tayBiL3Rlc3RzL2xvY2FsLm1rCi1pbmRleCA0ZGE2NzU2YWMuLjY0MmQyMjVmYSAx
MDA2NDQKLS0tLSBhL3Rlc3RzL2xvY2FsLm1rCi0rKysgYi90ZXN0cy9sb2NhbC5tawotQEAgLTM4
OCw2ICszODgsNyBAQCBhbGxfdGVzdHMgPQkJCQkJXAotICAgdGVzdHMvc29ydC9zb3J0LWRlYnVn
LWtleXMuc2gJCQlcCi0gICB0ZXN0cy9zb3J0L3NvcnQtZGVidWctd2Fybi5zaAkJCVwKLSAgIHRl
c3RzL3NvcnQvc29ydC1kaXNjcmltLnNoCQkJXAotKyAgdGVzdHMvc29ydC9zb3J0LWZpZWxkLWxp
bWl0LnNoCQlcCi0gICB0ZXN0cy9zb3J0L3NvcnQtZmlsZXMwLWZyb20ucGwJCVwKLSAgIHRlc3Rz
L3NvcnQvc29ydC1mbG9hdC5zaAkJCVwKLSAgIHRlc3RzL3NvcnQvc29ydC1oLXRob3VzYW5kcy1z
ZXAuc2gJCVwKLWRpZmYgLS1naXQgYS90ZXN0cy9zb3J0L3NvcnQtZmllbGQtbGltaXQuc2ggYi90
ZXN0cy9zb3J0L3NvcnQtZmllbGQtbGltaXQuc2gKLW5ldyBmaWxlIG1vZGUgMTAwNzU1Ci1pbmRl
eCAwMDAwMDAwMDAuLjUyZDhlMWQxNwotLS0tIC9kZXYvbnVsbAotKysrIGIvdGVzdHMvc29ydC9z
b3J0LWZpZWxkLWxpbWl0LnNoCi1AQCAtMCwwICsxLDM1IEBACi0rIyEvYmluL3NoCi0rIyBGcm9t
IDcuMi05LjcsIHRoaXMgd291bGQgdHJpZ2dlciBhbiBvdXQgb2YgYm91bmRzIG1lbSByZWFkCi0r
Ci0rIyBDb3B5cmlnaHQgKEMpIDIwMjUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCi0r
Ci0rIyBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTogeW91IGNhbiByZWRpc3RyaWJ1dGUg
aXQgYW5kL29yIG1vZGlmeQotKyMgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKLSsjIHRoZSBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb24sIGVpdGhlciB2ZXJzaW9uIDMgb2YgdGhlIExpY2Vuc2UsIG9yCi0rIyAoYXQgeW91
ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgotKwotKyMgVGhpcyBwcm9ncmFtIGlzIGRpc3Ry
aWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCi0rIyBidXQgV0lUSE9V
VCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgotKyMg
TUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2Vl
IHRoZQotKyMgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KLSsK
LSsjIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlCi0rIyBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbS4gIElmIG5vdCwgc2VlIDxo
dHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCi0rCi0rLiAiJHtzcmNkaXI9Ln0vdGVzdHMv
aW5pdC5zaCI7IHBhdGhfcHJlcGVuZF8gLi9zcmMKLStwcmludF92ZXJfIHNvcnQKLStnZXRsaW1p
dHNfCi0rCi0rIyBUaGlzIGlzc3VlIHRyaWdnZXJzIHdpdGggdmFsZ3JpbmQgb3IgQVNBTgotK3Zh
bGdyaW5kIC0tZXJyb3ItZXhpdGNvZGU9MSBzb3J0IC0tdmVyc2lvbiAyPi9kZXYvbnVsbCAmJgot
KyAgVkFMR1JJTkQ9J3ZhbGdyaW5kIC0tZXJyb3ItZXhpdGNvZGU9MScKLSsKLSt7IHByaW50ZiAn
JXNcbicgYWEgYmI7IH0gPiBpbiB8fCBmcmFtZXdvcmtfZmFpbHVyZV8KLSsKLStfUE9TSVgyX1ZF
UlNJT049MjAwODA5ICRWQUxHUklORCBzb3J0ICswLiR7U0laRV9NQVh9UiBpbiA+IG91dCB8fCBm
YWlsPTEKLStjb21wYXJlIGluIG91dCB8fCBmYWlsPTEKLSsKLStfUE9TSVgyX1ZFUlNJT049MjAw
ODA5ICRWQUxHUklORCBzb3J0ICsxIC0xLiR7U0laRV9NQVh9UiBpbiA+IG91dCB8fCBmYWlsPTEK
LStjb21wYXJlIGluIG91dCB8fCBmYWlsPTEKLSsKLStFeGl0ICRmYWlsCi0tLSAKLTIuMzQuMQot
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMvY29yZXV0aWxzL3JlbW92
ZS11c3ItbG9jYWwtbGliLWZyb20tbTQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRp
bHMvY29yZXV0aWxzL3JlbW92ZS11c3ItbG9jYWwtbGliLWZyb20tbTQucGF0Y2gKaW5kZXggNzE4
ZGUwYWI3OC4uYWIxOWFjMTZkNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvY29yZXV0
aWxzL2NvcmV1dGlscy9yZW1vdmUtdXNyLWxvY2FsLWxpYi1mcm9tLW00LnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRpbHMvcmVtb3ZlLXVzci1sb2NhbC1saWIt
ZnJvbS1tNC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjUzZmZiNWIyN2FiN2Q0YTRjNjJk
ZjAwZWJkNmExYTY5MzZkMTcwOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWFhMWU5
N2E5YjRkZDUyYjhjMDVlZGE4MWU2Zjg0MzZkNjM1MjBmMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDMgQXVn
IDIwMTEgMTQ6MTI6MzAgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29yZXV0aWxzOiBGaXggYnVp
bGQgb24gdWNsaWJjCkBAIC0xNyw3ICsxNyw3IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3By
aWF0ZSBbVXBzdHJlYW0gZG9lcyBjYXJlIGZvciBBSVggd2hpbGUgd2UgbWF5IG5vdF0KICAxIGZp
bGUgY2hhbmdlZCwgMTIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tNC9nZXRsb2FkYXZn
Lm00IGIvbTQvZ2V0bG9hZGF2Zy5tNAotaW5kZXggOWQwMjM2Zi4uNjhmN2M1MiAxMDA2NDQKK2lu
ZGV4IDBkODBiNjQuLjdlZDExZTUgMTAwNjQ0CiAtLS0gYS9tNC9nZXRsb2FkYXZnLm00CiArKysg
Yi9tNC9nZXRsb2FkYXZnLm00CiBAQCAtNDYsMTggKzQ2LDYgQEAgaWYgdGVzdCAkYWNfY3ZfZnVu
Y19nZXRsb2FkYXZnICE9IHllczsgdGhlbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
Y29yZXV0aWxzL2NvcmV1dGlsc185LjcuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9jb3JldXRpbHMv
Y29yZXV0aWxzXzkuOC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtY29yZS9jb3JldXRpbHMvY29yZXV0aWxzXzkuNy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWNvcmUvY29yZXV0aWxzL2NvcmV1dGlsc185LjguYmIKaW5kZXggMjAxYmU0MTQ0Yy4uNzk1
ZDc0NTgyYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvY29yZXV0aWxzL2NvcmV1dGls
c185LjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvY29yZXV0aWxzL2NvcmV1dGlsc185Ljgu
YmIKQEAgLTE1LDEwICsxNSw5IEBAIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRleHQgdGV4aW5mbwog
CiBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vY29yZXV0aWxzLyR7QlB9LnRhci54eiBcCiAgICAg
ICAgICAgIGZpbGU6Ly9yZW1vdmUtdXNyLWxvY2FsLWxpYi1mcm9tLW00LnBhdGNoIFwKLSAgICAg
ICAgICAgZmlsZTovLzAwMDEtc29ydC1maXgtYnVmZmVyLXVuZGVyLXJlYWQtQ1dFLTEyNy5wYXRj
aCBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiZThiYjI2YWQwMjkzZjliNWExZmM0M2ZiNDJiYTk3MGUzMTJjNjZjZTky
YzFiMGIxNjcxM2Q3NTAwZGIyNTFiZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlNmQ0ZmQyZDg1
MmM5MTQxYTFjMmExOGExM2QxNDZhMGNkN2U0NTE5NWY3MjI5M2E0ZTRjMDQ0ZWM2Y2NjYTE1Igog
CiAjIGh0dHA6Ly9naXQuc2F2YW5uYWguZ251Lm9yZy9jZ2l0L2NvcmV1dGlscy5naXQvY29tbWl0
Lz9pZD12OC4yNy0xMDEtZ2Y1ZDdjMDg0MgogIwotLSAKMi40Ny4xCgo=

--===============6218716355449345356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (0 cached, 948 parsed). 1946 targets, 54 skipped, 0 masked, 0 errors.
Removing 83 recipes from the qemux86_64 sysroot...done.
Removing 24 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-456e47ac710499cbcac312836f6978afbfea33b9"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:456e47ac710499cbcac312836f6978afbfea33b9"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 551 Local 512 Mirrors 0 Missed 39 Current 230 (92% match, 95% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 232 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 233 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 237 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 241 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 243 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 248 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_package_qa_setscene)
NOTE: Running setscene task 254 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 262 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 264 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 265 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 269 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 279 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 283 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.76-r0: task do_package_write_deb_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_package_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_package_qa_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_package_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 287 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_create_spdx_setscene)
NOTE: recipe libcap-2.76-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 288 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 290 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_qa_setscene)
NOTE: recipe perl-5.40.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 297 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_package_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 298 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 302 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 304 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe xz-5.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 309 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 311 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 314 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 315 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 327 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 328 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 332 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_qa_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 336 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 337 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 342 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 344 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_populate_lic_setscene)
NOTE: recipe perl-5.40.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 352 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 353 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_package_write_ipk_setscene)
NOTE: recipe xz-5.8.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 356 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 357 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 360 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 364 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 365 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_package_write_ipk_setscene)
NOTE: recipe sed-4.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 367 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package_qa_setscene)
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 369 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 370 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-9.8-r0: task do_populate_lic_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 372 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_package_qa_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 377 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 381 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 383 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 385 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 389 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 391 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 396 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 397 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_create_spdx_setscene)
NOTE: recipe perl-5.40.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe coreutils-9.8-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 400 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 402 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/grep/grep_3.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 409 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/procps/procps_4.0.5.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 414 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe grep-3.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 426 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 432 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 438 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe procps-4.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_setscene)
NOTE: Running setscene task 444 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 450 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_setscene)
NOTE: Running setscene task 451 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 453 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: Running setscene task 462 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 470 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 473 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 484 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 487 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 498 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 500 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/base-passwd/3.6.7/temp/log.do_packagedata_setscene.2413415
NOTE: Running setscene task 502 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 506 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 508 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_package_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 518 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 519 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 528 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 566 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 569 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.3.2-r0: task do_package_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_package_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 572 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 575 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_package_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 584 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package_setscene)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_package_setscene)
NOTE: recipe acl-2.3.2-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 596 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 600 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_package_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 616 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 627 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: Running task 863 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_fetch)
NOTE: Running task 902 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe coreutils-9.8-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.8-r0: task do_fetch: Succeeded
NOTE: Running task 1145 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1146 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1147 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_unpack)
NOTE: recipe libcap-2.76-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 631 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe coreutils-9.8-r0: task do_unpack: Started
NOTE: recipe acl-2.3.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 635 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1153 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 636 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 637 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1156 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1167 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe coreutils-9.8-r0: task do_unpack: Succeeded
NOTE: Running task 1168 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe coreutils-9.8-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1169 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running setscene task 638 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 639 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe coreutils-9.8-r0: task do_patch: Succeeded
NOTE: Running task 1170 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 644 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 645 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 654 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 655 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_deploy_source_date_epoch unihash changed to 059aa312dae33a47f7a4c9b118db5d651d97a4f79cae165d1702bef198de4d53
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 659 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 665 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 667 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 674 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1240 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe perl-5.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe perl-5.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 683 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 719 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 731 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 735 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 757 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: Running task 1342 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 416c6d2caaaf59beb20159fd08105abb3555ae5dde491228b82611b466c530ce to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '7f4a9e7f47adfbf6b65f59741addc2615ce2b140e22dae3312913b3c7400c5be', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '416c6d2caaaf59beb20159fd08105abb3555ae5dde491228b82611b466c530ce'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 7f4a9e7f47adfbf6b65f59741addc2615ce2b140e22dae3312913b3c7400c5be -> 416c6d2caaaf59beb20159fd08105abb3555ae5dde491228b82611b466c530ce as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 776 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 778 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1616 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1768 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata)
NOTE: Running task 1974 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2026 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_package_write_rpm)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.76-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2028 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_configure)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata: Succeeded
NOTE: Running task 2044 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package_write_ipk)
NOTE: Running task 2045 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package_write_deb)
NOTE: Running task 2046 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package_write_rpm)
NOTE: Running task 2047 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package_qa)
NOTE: recipe coreutils-9.8-r0: task do_configure: Started
NOTE: recipe shadow-4.18.0-r0: task do_package_write_ipk: Started
NOTE: recipe shadow-4.18.0-r0: task do_package_write_deb: Started
NOTE: recipe shadow-4.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe shadow-4.18.0-r0: task do_package_qa: Started
NOTE: recipe libcap-2.76-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_package_write_rpm unihash changed to 77603164da3fb08edba4d11d461c765dbe2d2d6d1cb50f022960aeab37890b67
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package_write_ipk unihash changed to 4a7d4c78efa1e0e1cfd18c2aa606ab84e0cd7d10b7f6b7cb5e346f7fa642566f
NOTE: recipe shadow-4.18.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package_qa unihash changed to 0bb077b71b201596cf09eb8aaaa7c512931e65c607ebcc47c311b517c8b851bf
NOTE: recipe shadow-4.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package_write_rpm unihash changed to 10cdb31fc75f00e6c931d31529feec766ce9d1c1349844dc89800e50ca8a66a2
NOTE: recipe shadow-4.18.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package_write_deb unihash changed to fc7ab88692a76b2b155aea7165895c55367a5a07dd750b6a94eff748fd5debec
NOTE: recipe coreutils-9.8-r0: task do_configure: Succeeded
NOTE: Running task 2060 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.8-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2061 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_compile)
NOTE: recipe coreutils-9.8-r0: task do_compile: Started
NOTE: recipe coreutils-9.8-r0: task do_compile: Succeeded
NOTE: Running task 2062 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.8-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2063 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_install)
NOTE: recipe coreutils-9.8-r0: task do_install: Started
NOTE: recipe coreutils-9.8-r0: task do_install: Succeeded
NOTE: Running task 2064 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.8-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2065 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_package)
NOTE: Running task 2066 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_populate_sysroot)
NOTE: recipe coreutils-9.8-r0: task do_populate_sysroot: Started
NOTE: recipe coreutils-9.8-r0: task do_package: Started
NOTE: recipe coreutils-9.8-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_populate_sysroot unihash changed to 5ce387977fb34056dbe7656bc140b55b178835c123bb15beaf210719d34fdeb1
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_package unihash changed to d14944d2bf28eedfc5f09a36de09bf5e37e92f3ddfb5c630fdd19f9c9217864a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_deb became valid
NOTE: Running setscene task 758 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 761 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 762 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 764 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 765 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 771 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 774 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 775 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 779 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_package_qa_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_qa_setscene: Started
NOTE: recipe gawk-5.3.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gawk-5.3.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 781 of 781 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2068 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_create_spdx)
NOTE: Running task 2071 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_rpm)
NOTE: Running task 2073 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk)
NOTE: Running task 2074 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb)
NOTE: Running task 2075 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm)
NOTE: Running task 2076 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa)
NOTE: Running task 2077 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_ipk)
NOTE: recipe coreutils-9.8-r0: task do_create_spdx: Started
NOTE: Running task 2078 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_deb)
NOTE: recipe gawk-5.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.3-r0: task do_package_write_ipk: Started
NOTE: recipe bash-5.3-r0: task do_package_write_deb: Started
NOTE: Running task 2079 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_rpm)
NOTE: recipe bash-5.3-r0: task do_package_write_rpm: Started
NOTE: Running task 2080 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa)
NOTE: recipe bash-5.3-r0: task do_package_qa: Started
NOTE: Running task 2083 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_rpm)
NOTE: Running task 2087 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_rpm)
NOTE: Running task 2089 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_package_write_ipk)
NOTE: Running task 2090 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_package_write_deb)
NOTE: Running task 2091 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_package_write_rpm)
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb: Started
NOTE: Running task 2092 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_package_qa)
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm: Started
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm: Started
NOTE: recipe acl-2.3.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.13.9-r0: task do_package_qa: Started
NOTE: recipe coreutils-9.8-r0: task do_package_write_ipk: Started
NOTE: recipe coreutils-9.8-r0: task do_package_write_deb: Started
NOTE: recipe coreutils-9.8-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.8-r0: task do_package_qa: Started
NOTE: recipe coreutils-9.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2093 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_create_package_spdx)
NOTE: recipe coreutils-9.8-r0: task do_create_package_spdx: Started
NOTE: recipe coreutils-9.8-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_package_write_ipk unihash changed to 8e1e775b779c8cff146569fd95ea53ea3b9718db7bd5d100f4a665e548bf666b
NOTE: recipe bash-5.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk unihash changed to a7f99344f8ec234e58b86d4784fec777b80e0c883b056b3c868fec0e3afcaff7
NOTE: recipe acl-2.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_package_write_rpm unihash changed to 3ae0cfc667cc32f00e312820bce6ac990fe4005e35964106cad1491bbd2844a4
NOTE: recipe findutils-4.10.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_package_write_rpm unihash changed to 3c0277343deaa777478e047fb3578c0ebd53f1ab1790285cf2ca97de04a0d408
NOTE: recipe bash-5.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa unihash changed to 2191a17a6e62778d6a462e7ae8ab1b5ac6e8befe52e8067551c849d2df7d70ce
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_ipk unihash changed to ff0893c91b9cd90b494091670dc525f62711325f90755dff02983f241c7b640e
NOTE: recipe bash-5.3-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb unihash changed to 170848a274c4df5466a009ec82a595e43e5275fbf6d83edd52eb39427e4152f7
NOTE: recipe gawk-5.3.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_package_write_rpm unihash changed to 7fa34200255f6a53cd3f61197dd5417c8d79db9a961bba9ff1ca61c77e975003
NOTE: recipe coreutils-9.8-r0: task do_create_package_spdx: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm unihash changed to 4b8fac0b68028d9445852a105df45d741ea0b7383c9f1b07b0ca54df87dfb3d0
NOTE: recipe coreutils-9.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_package_write_rpm unihash changed to c23559eb74d9d6ffbc170838a201709dc1c12e4dac483deb505adaae2d12b2fd
NOTE: recipe coreutils-9.8-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_package_qa unihash changed to 34c85fa96fdeea6b2d82e0566ef5ffc290eefb41314cf33989c0e74f68f470b0
NOTE: recipe python3-3.13.9-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa unihash changed to 60e46a8285446640424efe470789a7d40b821cb556d7aa6c179eeaa147e35383
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_rpm unihash changed to 79ed0c180f2eb1a433814a6286a582a53a599aa289c5602e8cf563eb06419a0d
NOTE: recipe coreutils-9.8-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_package_write_deb unihash changed to 41db1bbb130cfa58786f5fda157450fd0d580e5e9a36b87068f73a3f8bdf3d2f
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_deb unihash changed to 1f994212bad88c35ca3630ba902afb736c738c4aafb51ba5ca7aab2448c08241
NOTE: Running noexec task 2094 of 2094 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.8.bb:do_build)
NOTE: Tasks Summary: Attempted 2094 tasks of which 2047 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: base-passwd-3.6.7-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-src went backwards which would break package feeds (from 0:3.6.8-r0 to 0:3.6.7-r0) [version-going-backwards]
ERROR: base-passwd-3.6.7-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-dbg went backwards which would break package feeds (from 0:3.6.8-r0 to 0:3.6.7-r0) [version-going-backwards]
ERROR: base-passwd-3.6.7-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-update went backwards which would break package feeds (from 0:3.6.8-r0 to 0:3.6.7-r0) [version-going-backwards]
ERROR: base-passwd-3.6.7-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-staticdev went backwards which would break package feeds (from 0:3.6.8-r0 to 0:3.6.7-r0) [version-going-backwards]
ERROR: base-passwd-3.6.7-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-dev went backwards which would break package feeds (from 0:3.6.8-r0 to 0:3.6.7-r0) [version-going-backwards]
ERROR: base-passwd-3.6.7-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-doc went backwards which would break package feeds (from 0:3.6.8-r0 to 0:3.6.7-r0) [version-going-backwards]
ERROR: base-passwd-3.6.7-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd-locale went backwards which would break package feeds (from 0:3.6.8-r0 to 0:3.6.7-r0) [version-going-backwards]
ERROR: base-passwd-3.6.7-r0 do_packagedata_setscene: QA Issue: Package version for package base-passwd went backwards which would break package feeds (from 0:3.6.8-r0 to 0:3.6.7-r0) [version-going-backwards]
ERROR: base-passwd-3.6.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6218716355449345356==--

