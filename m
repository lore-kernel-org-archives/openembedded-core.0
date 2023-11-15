Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20098C54F34
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:13 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.14617.1700059029474879731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZBxEyz/e;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=R5YZfKEe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018bd36a25f9-df10fb78-39cc-4ec2-a7a4-236f572812ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ADnOzEYTm4ovq977GrwR+gIs7MOxpwsDH2DA0il32JA=;
	b=ZBxEyz/e38dPZ0maVCJlCR0/lQb/lwVSPSjeq23A5WgBr1vQakVnTZsrGg2+eGLZ
	mmGeXxlbfOp13pSKIzVU6fK7Le9j2q+aFt7ibVWVMvGJTKg9v6EC9apn9MAa5Xz4wJW
	2xeeCIqX3tbaTN/UsFkIA8SSfyK1kzMIltSX2OCI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059031;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ADnOzEYTm4ovq977GrwR+gIs7MOxpwsDH2DA0il32JA=;
	b=R5YZfKEelXR2bl4cqxq8lkfwirU9kAxhm+v+FpvlSw7zghzYmkVj6O5fDB2d3LYU
	9bt7yqNQx1Z+IPmi3IZUvPZ2nVA8pxLAIQEpzrRFqZc6ALepP4inSONc+oznBeFj4if
	Aq9ItdgNQabx5iY/OI32zM4orCbMCfsTgRSyZkjk=
Content-Type: multipart/mixed; boundary="===============1876842960839235392=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] valgrind: upgrading to 3.22.0 FAILED
Message-ID: <0101018bd36a25f9-df10fb78-39cc-4ec2-a7a4-236f572812ae-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190663

--===============1876842960839235392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *valgrind* to *3.22.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-valgrind-upgrade-3.21.0-3.22.0.patch
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
From 222550708ff9f1aec5fff94440c39cd958011bbb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 08:47:52 +0000
Subject: [PATCH] valgrind: upgrade 3.21.0 -> 3.22.0

---
 ...inux-seg_override.c-add-missing-incl.patch |  30 --
 ...020-Committing-changes-from-do_patch.patch | 332 ++++++++++++++++++
 ...{valgrind_3.21.0.bb => valgrind_3.22.0.bb} |   4 +-
 3 files changed, 334 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0020-Committing-changes-from-do_patch.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.21.0.bb => valgrind_3.22.0.bb} (98%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
deleted file mode 100644
index 5e36c28523..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 978d9ed7f857f2cdcd2a8632f3c2feb56b99c825 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 8 May 2023 11:56:35 +0200
-Subject: [PATCH] none/tests/x86-linux/seg_override.c: add missing include for
- musl builds
-
-Otherwise SYS_modify_ldt is undefined.
-
-Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=382034]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- none/tests/x86-linux/seg_override.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/none/tests/x86-linux/seg_override.c b/none/tests/x86-linux/seg_override.c
-index ca8fbfe..4ef4394 100644
---- a/none/tests/x86-linux/seg_override.c
-+++ b/none/tests/x86-linux/seg_override.c
-@@ -3,6 +3,10 @@
- #include <errno.h>
- #include <string.h>
- #include "../../../config.h"
-+#if defined(MUSL_LIBC)
-+#include <syscall.h>
-+#include <unistd.h>
-+#endif
- 
- 
- /* Stuff from Wine. */
diff --git a/meta/recipes-devtools/valgrind/valgrind/0020-Committing-changes-from-do_patch.patch b/meta/recipes-devtools/valgrind/valgrind/0020-Committing-changes-from-do_patch.patch
new file mode 100644
index 0000000000..16c8dae137
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0020-Committing-changes-from-do_patch.patch
@@ -0,0 +1,332 @@
+From b2198850eae779cc4c823a4f65d0d80a39368cd8 Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Wed, 15 Nov 2023 08:46:51 +0000
+Subject: [PATCH] Committing changes from do_patch
+
+---
+ memcheck/tests/badfree3.stderr.exp |   4 +-
+ memcheck/tests/varinfo5.stderr.exp | 216 ++++++++++++++---------------
+ 2 files changed, 110 insertions(+), 110 deletions(-)
+
+diff --git a/memcheck/tests/badfree3.stderr.exp b/memcheck/tests/badfree3.stderr.exp
+index 20e48a6..b518703 100644
+--- a/memcheck/tests/badfree3.stderr.exp
++++ b/memcheck/tests/badfree3.stderr.exp
+@@ -1,11 +1,11 @@
+ Invalid free() / delete / delete[] / realloc()
+    at 0x........: free (vg_replace_malloc.c:...)
+-   by 0x........: main (tests/badfree.c:12)
++   by 0x........: main (badfree.c:12)
+  Address 0x........ is not stack'd, malloc'd or (recently) free'd
+ 
+ Invalid free() / delete / delete[] / realloc()
+    at 0x........: free (vg_replace_malloc.c:...)
+-   by 0x........: main (tests/badfree.c:15)
++   by 0x........: main (badfree.c:15)
+  Address 0x........ is on thread 1's stack
+  in frame #1, created by main (badfree.c:7)
+ 
+diff --git a/memcheck/tests/varinfo5.stderr.exp b/memcheck/tests/varinfo5.stderr.exp
+index 1a10d03..0fd1190 100644
+--- a/memcheck/tests/varinfo5.stderr.exp
++++ b/memcheck/tests/varinfo5.stderr.exp
+@@ -1,191 +1,191 @@
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: varinfo1_main (tests/varinfo5so.c:52)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:154)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: varinfo1_main (varinfo5so.c:52)
++   by 0x........: varinfo5_main (varinfo5so.c:154)
++   by 0x........: main (varinfo5.c:5)
+  Address 0x........ is 1 bytes inside a block of size 3 alloc'd
+    at 0x........: malloc (vg_replace_malloc.c:...)
+-   by 0x........: varinfo1_main (tests/varinfo5so.c:50)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:154)
+-   by 0x........: main (tests/varinfo5.c:5)
++   by 0x........: varinfo1_main (varinfo5so.c:50)
++   by 0x........: varinfo5_main (varinfo5so.c:154)
++   by 0x........: main (varinfo5.c:5)
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: varinfo1_main (tests/varinfo5so.c:55)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:154)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: varinfo1_main (varinfo5so.c:55)
++   by 0x........: varinfo5_main (varinfo5so.c:154)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 0 bytes inside global var "global_u1"
+  declared at varinfo5so.c:38
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: varinfo1_main (tests/varinfo5so.c:56)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:154)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: varinfo1_main (varinfo5so.c:56)
++   by 0x........: varinfo5_main (varinfo5so.c:154)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 0 bytes inside global var "global_i1"
+  declared at varinfo5so.c:40
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: varinfo1_main (tests/varinfo5so.c:57)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:154)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: varinfo1_main (varinfo5so.c:57)
++   by 0x........: varinfo5_main (varinfo5so.c:154)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 0 bytes inside global_u2[3],
+  a global variable declared at varinfo5so.c:42
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: varinfo1_main (tests/varinfo5so.c:58)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:154)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: varinfo1_main (varinfo5so.c:58)
++   by 0x........: varinfo5_main (varinfo5so.c:154)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 0 bytes inside global_i2[7],
+  a global variable declared at varinfo5so.c:44
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: varinfo1_main (tests/varinfo5so.c:59)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:154)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: varinfo1_main (varinfo5so.c:59)
++   by 0x........: varinfo5_main (varinfo5so.c:154)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 0 bytes inside local var "local"
+  declared at varinfo5so.c:49, in frame #X of thread 1
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: foo2 (tests/varinfo5so.c:71)
+-   by 0x........: varinfo2_main (tests/varinfo5so.c:81)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:155)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: foo2 (varinfo5so.c:71)
++   by 0x........: varinfo2_main (varinfo5so.c:81)
++   by 0x........: varinfo5_main (varinfo5so.c:155)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 0 bytes inside var[7],
+  declared at varinfo5so.c:69, in frame #X of thread 1
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: foo2 (tests/varinfo5so.c:73)
+-   by 0x........: varinfo2_main (tests/varinfo5so.c:81)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:155)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: foo2 (varinfo5so.c:73)
++   by 0x........: varinfo2_main (varinfo5so.c:81)
++   by 0x........: varinfo5_main (varinfo5so.c:155)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 2 bytes inside var.bar,
+  declared at varinfo5so.c:72, in frame #X of thread 1
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: foo2 (tests/varinfo5so.c:76)
+-   by 0x........: varinfo2_main (tests/varinfo5so.c:81)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:155)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: foo2 (varinfo5so.c:76)
++   by 0x........: varinfo2_main (varinfo5so.c:81)
++   by 0x........: varinfo5_main (varinfo5so.c:155)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 1 byte inside local var "var"
+  declared at varinfo5so.c:67, in frame #X of thread 1
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: foo3 (tests/varinfo5so.c:106)
+-   by 0x........: varinfo3_main (tests/varinfo5so.c:118)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:156)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: foo3 (varinfo5so.c:106)
++   by 0x........: varinfo3_main (varinfo5so.c:118)
++   by 0x........: varinfo5_main (varinfo5so.c:156)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 0 bytes inside static_global_def[1],
+  a global variable declared at varinfo5so.c:87
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: foo3 (tests/varinfo5so.c:107)
+-   by 0x........: varinfo3_main (tests/varinfo5so.c:118)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:156)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: foo3 (varinfo5so.c:107)
++   by 0x........: varinfo3_main (varinfo5so.c:118)
++   by 0x........: varinfo5_main (varinfo5so.c:156)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 0 bytes inside nonstatic_global_def[2],
+  a global variable declared at varinfo5so.c:88
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: foo3 (tests/varinfo5so.c:108)
+-   by 0x........: varinfo3_main (tests/varinfo5so.c:118)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:156)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: foo3 (varinfo5so.c:108)
++   by 0x........: varinfo3_main (varinfo5so.c:118)
++   by 0x........: varinfo5_main (varinfo5so.c:156)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 0 bytes inside static_global_undef[3],
+  a global variable declared at varinfo5so.c:89
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: foo3 (tests/varinfo5so.c:109)
+-   by 0x........: varinfo3_main (tests/varinfo5so.c:118)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:156)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: foo3 (varinfo5so.c:109)
++   by 0x........: varinfo3_main (varinfo5so.c:118)
++   by 0x........: varinfo5_main (varinfo5so.c:156)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 0 bytes inside nonstatic_global_undef[4],
+  a global variable declared at varinfo5so.c:90
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: bar3 (tests/varinfo5so.c:94)
+-   by 0x........: foo3 (tests/varinfo5so.c:110)
+-   by 0x........: varinfo3_main (tests/varinfo5so.c:118)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:156)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: bar3 (varinfo5so.c:94)
++   by 0x........: foo3 (varinfo5so.c:110)
++   by 0x........: varinfo3_main (varinfo5so.c:118)
++   by 0x........: varinfo5_main (varinfo5so.c:156)
++   by 0x........: main (varinfo5.c:5)
+  Address 0x........ is 5 bytes inside data symbol "static_local_def.XXXX"
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: bar3 (tests/varinfo5so.c:95)
+-   by 0x........: foo3 (tests/varinfo5so.c:110)
+-   by 0x........: varinfo3_main (tests/varinfo5so.c:118)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:156)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: bar3 (varinfo5so.c:95)
++   by 0x........: foo3 (varinfo5so.c:110)
++   by 0x........: varinfo3_main (varinfo5so.c:118)
++   by 0x........: varinfo5_main (varinfo5so.c:156)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 0 bytes inside nonstatic_local_def[6],
+  declared at varinfo5so.c:103, in frame #X of thread 1
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: bar3 (tests/varinfo5so.c:96)
+-   by 0x........: foo3 (tests/varinfo5so.c:110)
+-   by 0x........: varinfo3_main (tests/varinfo5so.c:118)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:156)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: bar3 (varinfo5so.c:96)
++   by 0x........: foo3 (varinfo5so.c:110)
++   by 0x........: varinfo3_main (varinfo5so.c:118)
++   by 0x........: varinfo5_main (varinfo5so.c:156)
++   by 0x........: main (varinfo5.c:5)
+  Address 0x........ is 7 bytes inside data symbol "static_local_undef.XXXX"
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: bar3 (tests/varinfo5so.c:97)
+-   by 0x........: foo3 (tests/varinfo5so.c:110)
+-   by 0x........: varinfo3_main (tests/varinfo5so.c:118)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:156)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: bar3 (varinfo5so.c:97)
++   by 0x........: foo3 (varinfo5so.c:110)
++   by 0x........: varinfo3_main (varinfo5so.c:118)
++   by 0x........: varinfo5_main (varinfo5so.c:156)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 0 bytes inside nonstatic_local_undef[8],
+  declared at varinfo5so.c:105, in frame #X of thread 1
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: blah4 (tests/varinfo5so.c:137)
+-   by 0x........: varinfo4_main (tests/varinfo5so.c:146)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:157)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: blah4 (varinfo5so.c:137)
++   by 0x........: varinfo4_main (varinfo5so.c:146)
++   by 0x........: varinfo5_main (varinfo5so.c:157)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 1 byte inside a[3].xyzzy[21].c1,
+  declared at varinfo5so.c:135, in frame #X of thread 1
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: blah4 (tests/varinfo5so.c:138)
+-   by 0x........: varinfo4_main (tests/varinfo5so.c:146)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:157)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: blah4 (varinfo5so.c:138)
++   by 0x........: varinfo4_main (varinfo5so.c:146)
++   by 0x........: varinfo5_main (varinfo5so.c:157)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 0 bytes inside a[5].bong,
+  declared at varinfo5so.c:135, in frame #X of thread 1
+ 
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: blah4 (tests/varinfo5so.c:139)
+-   by 0x........: varinfo4_main (tests/varinfo5so.c:146)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:157)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: blah4 (varinfo5so.c:139)
++   by 0x........: varinfo4_main (varinfo5so.c:146)
++   by 0x........: varinfo5_main (varinfo5so.c:157)
++   by 0x........: main (varinfo5.c:5)
+  Location 0x........ is 1 byte inside a[3].xyzzy[21].c2[2],
+  declared at varinfo5so.c:135, in frame #X of thread 1
+ 
+ answer is 0
+ Uninitialised byte(s) found during client check request
+-   at 0x........: croak (tests/varinfo5so.c:29)
+-   by 0x........: fun_c (tests/varinfo5so.c:164)
+-   by 0x........: fun_b (tests/varinfo5so.c:168)
+-   by 0x........: fun_a (tests/varinfo5so.c:172)
+-   by 0x........: inlinetest (tests/varinfo5so.c:178)
+-   by 0x........: varinfo5_main (tests/varinfo5so.c:158)
+-   by 0x........: main (tests/varinfo5.c:5)
++   at 0x........: croak (varinfo5so.c:29)
++   by 0x........: fun_c (varinfo5so.c:164)
++   by 0x........: fun_b (varinfo5so.c:168)
++   by 0x........: fun_a (varinfo5so.c:172)
++   by 0x........: inlinetest (varinfo5so.c:178)
++   by 0x........: varinfo5_main (varinfo5so.c:158)
++   by 0x........: main (varinfo5.c:5)
+  Address 0x........ is on thread 1's stack
+  in frame #X, created by varinfo5_main (varinfo5so.c:153)
+ 
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
similarity index 98%
rename from meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
index 68ab319a1b..c1ed76b849 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
@@ -36,9 +36,9 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-docs-Disable-manual-validation.patch \
-           file://0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch \
+           file://0020-Committing-changes-from-do_patch.patch \
            "
-SRC_URI[sha256sum] = "10ce1618bb3e33fad16eb79552b0a3e1211762448a0d7fce11c8a6243b9ac971"
+SRC_URI[sha256sum] = "c811db5add2c5f729944caf47c4e7a65dcaabb9461e472b578765dd7bf6d2d4c"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
-- 
2.39.2


--===============1876842960839235392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-85da6ad4e0e34f1f1eafaed69e4e9e81e8a827f5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:85da6ad4e0e34f1f1eafaed69e4e9e81e8a827f5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 497 Local 482 Mirrors 0 Missed 15 Current 510 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 792 of 1007 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/boost/boost_1.83.0.bb:do_create_spdx_setscene)
NOTE: recipe boost-1.83.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe boost-1.83.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 992 of 1007 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 998 of 1007 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1000 of 1007 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running task 1244 of 2728 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_recipe_qa)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe valgrind-3.22.0-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe valgrind-3.22.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1735 of 2728 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_fetch)
NOTE: recipe valgrind-3.22.0-r0: task do_fetch: Started
NOTE: recipe valgrind-3.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1736 of 2728 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_unpack)
NOTE: recipe valgrind-3.22.0-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1002 of 1007 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1004 of 1007 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1007 of 1007 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2198 of 2728 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe valgrind-3.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe valgrind-3.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe valgrind-3.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2709 of 2728 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_patch)
NOTE: Running task 2710 of 2728 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_collect_spdx_deps)
NOTE: recipe valgrind-3.22.0-r0: task do_patch: Started
NOTE: recipe valgrind-3.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe valgrind-3.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe valgrind-3.22.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 2710 tasks of which 2704 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115084731.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115084731.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_patch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: valgrind-3.22.0-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind/0020-Committing-changes-from-do_patch.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: valgrind-3.22.0-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/valgrind/3.22.0/temp/log.do_patch.2138766
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_patch) failed with exit code '1'

--===============1876842960839235392==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-valgrind-upgrade-3.21.0-3.22.0.patch"

RnJvbSAyMjI1NTA3MDhmZjlmMWFlYzVmZmY5NDQ0MGMzOWNkOTU4MDExYmJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDg6NDc6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
YWxncmluZDogdXBncmFkZSAzLjIxLjAgLT4gMy4yMi4wCgotLS0KIC4uLmludXgtc2VnX292ZXJy
aWRlLmMtYWRkLW1pc3NpbmctaW5jbC5wYXRjaCB8ICAzMCAtLQogLi4uMDIwLUNvbW1pdHRpbmct
Y2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoIHwgMzMyICsrKysrKysrKysrKysrKysrKwogLi4u
e3ZhbGdyaW5kXzMuMjEuMC5iYiA9PiB2YWxncmluZF8zLjIyLjAuYmJ9IHwgICA0ICstCiAzIGZp
bGVzIGNoYW5nZWQsIDMzNCBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBt
b2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1u
b25lLXRlc3RzLXg4Ni1saW51eC1zZWdfb3ZlcnJpZGUuYy1hZGQtbWlzc2luZy1pbmNsLnBhdGNo
CiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdy
aW5kLzAwMjAtQ29tbWl0dGluZy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2gKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQve3ZhbGdyaW5kXzMuMjEuMC5iYiA9PiB2YWxn
cmluZF8zLjIyLjAuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbm9uZS10ZXN0cy14ODYtbGludXgtc2VnX292ZXJyaWRl
LmMtYWRkLW1pc3NpbmctaW5jbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmlu
ZC92YWxncmluZC8wMDAxLW5vbmUtdGVzdHMteDg2LWxpbnV4LXNlZ19vdmVycmlkZS5jLWFkZC1t
aXNzaW5nLWluY2wucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDVlMzZjMjg1
MjMuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdy
aW5kLzAwMDEtbm9uZS10ZXN0cy14ODYtbGludXgtc2VnX292ZXJyaWRlLmMtYWRkLW1pc3Npbmct
aW5jbC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDMwICswLDAgQEAKLUZyb20gOTc4ZDllZDdm
ODU3ZjJjZGNkMmE4NjMyZjNjMmZlYjU2Yjk5YzgyNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
LUZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci1EYXRlOiBNb24s
IDggTWF5IDIwMjMgMTE6NTY6MzUgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gbm9uZS90ZXN0cy94
ODYtbGludXgvc2VnX292ZXJyaWRlLmM6IGFkZCBtaXNzaW5nIGluY2x1ZGUgZm9yCi0gbXVzbCBi
dWlsZHMKLQotT3RoZXJ3aXNlIFNZU19tb2RpZnlfbGR0IGlzIHVuZGVmaW5lZC4KLQotVXBzdHJl
YW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vYnVncy5rZGUub3JnL3Nob3dfYnVnLmNnaT9p
ZD0zODIwMzRdCi1TaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJv
bml4LmRlPgotCi0tLS0KLSBub25lL3Rlc3RzL3g4Ni1saW51eC9zZWdfb3ZlcnJpZGUuYyB8IDQg
KysrKwotIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBhL25v
bmUvdGVzdHMveDg2LWxpbnV4L3NlZ19vdmVycmlkZS5jIGIvbm9uZS90ZXN0cy94ODYtbGludXgv
c2VnX292ZXJyaWRlLmMKLWluZGV4IGNhOGZiZmUuLjRlZjQzOTQgMTAwNjQ0Ci0tLS0gYS9ub25l
L3Rlc3RzL3g4Ni1saW51eC9zZWdfb3ZlcnJpZGUuYwotKysrIGIvbm9uZS90ZXN0cy94ODYtbGlu
dXgvc2VnX292ZXJyaWRlLmMKLUBAIC0zLDYgKzMsMTAgQEAKLSAjaW5jbHVkZSA8ZXJybm8uaD4K
LSAjaW5jbHVkZSA8c3RyaW5nLmg+Ci0gI2luY2x1ZGUgIi4uLy4uLy4uL2NvbmZpZy5oIgotKyNp
ZiBkZWZpbmVkKE1VU0xfTElCQykKLSsjaW5jbHVkZSA8c3lzY2FsbC5oPgotKyNpbmNsdWRlIDx1
bmlzdGQuaD4KLSsjZW5kaWYKLSAKLSAKLSAvKiBTdHVmZiBmcm9tIFdpbmUuICovCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAyMC1Db21taXR0
aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92
YWxncmluZC92YWxncmluZC8wMDIwLUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBh
dGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjE2YzhkYWUxMzcKLS0t
IC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQv
MDAyMC1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaApAQCAtMCwwICsxLDMz
MiBAQAorRnJvbSBiMjE5ODg1MGVhZTc3OWNjNGM4MjNhNGY2NWQwZDgwYTM5MzY4Y2Q4IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogT3BlbkVtYmVkZGVkIDxvZS5wYXRjaEBvZT4KK0Rh
dGU6IFdlZCwgMTUgTm92IDIwMjMgMDg6NDY6NTEgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gQ29t
bWl0dGluZyBjaGFuZ2VzIGZyb20gZG9fcGF0Y2gKKworLS0tCisgbWVtY2hlY2svdGVzdHMvYmFk
ZnJlZTMuc3RkZXJyLmV4cCB8ICAgNCArLQorIG1lbWNoZWNrL3Rlc3RzL3ZhcmluZm81LnN0ZGVy
ci5leHAgfCAyMTYgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KKyAyIGZpbGVzIGNoYW5n
ZWQsIDExMCBpbnNlcnRpb25zKCspLCAxMTAgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9t
ZW1jaGVjay90ZXN0cy9iYWRmcmVlMy5zdGRlcnIuZXhwIGIvbWVtY2hlY2svdGVzdHMvYmFkZnJl
ZTMuc3RkZXJyLmV4cAoraW5kZXggMjBlNDhhNi4uYjUxODcwMyAxMDA2NDQKKy0tLSBhL21lbWNo
ZWNrL3Rlc3RzL2JhZGZyZWUzLnN0ZGVyci5leHAKKysrKyBiL21lbWNoZWNrL3Rlc3RzL2JhZGZy
ZWUzLnN0ZGVyci5leHAKK0BAIC0xLDExICsxLDExIEBACisgSW52YWxpZCBmcmVlKCkgLyBkZWxl
dGUgLyBkZWxldGVbXSAvIHJlYWxsb2MoKQorICAgIGF0IDB4Li4uLi4uLi46IGZyZWUgKHZnX3Jl
cGxhY2VfbWFsbG9jLmM6Li4uKQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3RzL2JhZGZy
ZWUuYzoxMikKKysgICBieSAweC4uLi4uLi4uOiBtYWluIChiYWRmcmVlLmM6MTIpCisgIEFkZHJl
c3MgMHguLi4uLi4uLiBpcyBub3Qgc3RhY2snZCwgbWFsbG9jJ2Qgb3IgKHJlY2VudGx5KSBmcmVl
J2QKKyAKKyBJbnZhbGlkIGZyZWUoKSAvIGRlbGV0ZSAvIGRlbGV0ZVtdIC8gcmVhbGxvYygpCisg
ICAgYXQgMHguLi4uLi4uLjogZnJlZSAodmdfcmVwbGFjZV9tYWxsb2MuYzouLi4pCistICAgYnkg
MHguLi4uLi4uLjogbWFpbiAodGVzdHMvYmFkZnJlZS5jOjE1KQorKyAgIGJ5IDB4Li4uLi4uLi46
IG1haW4gKGJhZGZyZWUuYzoxNSkKKyAgQWRkcmVzcyAweC4uLi4uLi4uIGlzIG9uIHRocmVhZCAx
J3Mgc3RhY2sKKyAgaW4gZnJhbWUgIzEsIGNyZWF0ZWQgYnkgbWFpbiAoYmFkZnJlZS5jOjcpCisg
CitkaWZmIC0tZ2l0IGEvbWVtY2hlY2svdGVzdHMvdmFyaW5mbzUuc3RkZXJyLmV4cCBiL21lbWNo
ZWNrL3Rlc3RzL3ZhcmluZm81LnN0ZGVyci5leHAKK2luZGV4IDFhMTBkMDMuLjBmZDExOTAgMTAw
NjQ0CistLS0gYS9tZW1jaGVjay90ZXN0cy92YXJpbmZvNS5zdGRlcnIuZXhwCisrKysgYi9tZW1j
aGVjay90ZXN0cy92YXJpbmZvNS5zdGRlcnIuZXhwCitAQCAtMSwxOTEgKzEsMTkxIEBACisgVW5p
bml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAg
IGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHgu
Li4uLi4uLjogdmFyaW5mbzFfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjUyKQorLSAgIGJ5IDB4
Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTQpCistICAgYnkg
MHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46
IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzFfbWFp
biAodmFyaW5mbzVzby5jOjUyKQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZh
cmluZm81c28uYzoxNTQpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQor
ICBBZGRyZXNzIDB4Li4uLi4uLi4gaXMgMSBieXRlcyBpbnNpZGUgYSBibG9jayBvZiBzaXplIDMg
YWxsb2MnZAorICAgIGF0IDB4Li4uLi4uLi46IG1hbGxvYyAodmdfcmVwbGFjZV9tYWxsb2MuYzou
Li4pCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzFfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5j
OjUwKQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28u
YzoxNTQpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAg
IGJ5IDB4Li4uLi4uLi46IHZhcmluZm8xX21haW4gKHZhcmluZm81c28uYzo1MCkKKysgICBieSAw
eC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU0KQorKyAgIGJ5IDB4Li4u
Li4uLi46IG1haW4gKHZhcmluZm81LmM6NSkKKyAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykgZm91
bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3JvYWsg
KHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvMV9tYWlu
ICh0ZXN0cy92YXJpbmZvNXNvLmM6NTUpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFp
biAodGVzdHMvdmFyaW5mbzVzby5jOjE1NCkKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0
cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHZhcmluZm81c28uYzoy
OSkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvMV9tYWluICh2YXJpbmZvNXNvLmM6NTUpCisr
ICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5jOjE1NCkKKysgICBi
eSAweC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5jOjUpCisgIExvY2F0aW9uIDB4Li4uLi4uLi4g
aXMgMCBieXRlcyBpbnNpZGUgZ2xvYmFsIHZhciAiZ2xvYmFsX3UxIgorICBkZWNsYXJlZCBhdCB2
YXJpbmZvNXNvLmM6MzgKKyAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNs
aWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHRlc3RzL3Zhcmlu
Zm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvMV9tYWluICh0ZXN0cy92YXJp
bmZvNXNvLmM6NTYpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFy
aW5mbzVzby5jOjE1NCkKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5j
OjUpCisrICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHZhcmluZm81c28uYzoyOSkKKysgICBieSAw
eC4uLi4uLi4uOiB2YXJpbmZvMV9tYWluICh2YXJpbmZvNXNvLmM6NTYpCisrICAgYnkgMHguLi4u
Li4uLjogdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5jOjE1NCkKKysgICBieSAweC4uLi4uLi4u
OiBtYWluICh2YXJpbmZvNS5jOjUpCisgIExvY2F0aW9uIDB4Li4uLi4uLi4gaXMgMCBieXRlcyBp
bnNpZGUgZ2xvYmFsIHZhciAiZ2xvYmFsX2kxIgorICBkZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6
NDAKKyAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayBy
ZXF1ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkK
Ky0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvMV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6NTcp
CistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1
NCkKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQg
MHguLi4uLi4uLjogY3JvYWsgKHZhcmluZm81c28uYzoyOSkKKysgICBieSAweC4uLi4uLi4uOiB2
YXJpbmZvMV9tYWluICh2YXJpbmZvNXNvLmM6NTcpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5m
bzVfbWFpbiAodmFyaW5mbzVzby5jOjE1NCkKKysgICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJp
bmZvNS5jOjUpCisgIExvY2F0aW9uIDB4Li4uLi4uLi4gaXMgMCBieXRlcyBpbnNpZGUgZ2xvYmFs
X3UyWzNdLAorICBhIGdsb2JhbCB2YXJpYWJsZSBkZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6NDIK
KyAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1
ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0g
ICBieSAweC4uLi4uLi4uOiB2YXJpbmZvMV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6NTgpCist
ICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NCkK
Ky0gICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHgu
Li4uLi4uLjogY3JvYWsgKHZhcmluZm81c28uYzoyOSkKKysgICBieSAweC4uLi4uLi4uOiB2YXJp
bmZvMV9tYWluICh2YXJpbmZvNXNvLmM6NTgpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVf
bWFpbiAodmFyaW5mbzVzby5jOjE1NCkKKysgICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJpbmZv
NS5jOjUpCisgIExvY2F0aW9uIDB4Li4uLi4uLi4gaXMgMCBieXRlcyBpbnNpZGUgZ2xvYmFsX2ky
WzddLAorICBhIGdsb2JhbCB2YXJpYWJsZSBkZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6NDQKKyAK
KyBVbmluaXRpYWxpc2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0
CistICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBi
eSAweC4uLi4uLi4uOiB2YXJpbmZvMV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6NTkpCistICAg
YnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NCkKKy0g
ICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4u
Li4uLjogY3JvYWsgKHZhcmluZm81c28uYzoyOSkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZv
MV9tYWluICh2YXJpbmZvNXNvLmM6NTkpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFp
biAodmFyaW5mbzVzby5jOjE1NCkKKysgICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5j
OjUpCisgIExvY2F0aW9uIDB4Li4uLi4uLi4gaXMgMCBieXRlcyBpbnNpZGUgbG9jYWwgdmFyICJs
b2NhbCIKKyAgZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5jOjQ5LCBpbiBmcmFtZSAjWCBvZiB0aHJl
YWQgMQorIAorIFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNr
IHJlcXVlc3QKKy0gICBhdCAweC4uLi4uLi4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5
KQorLSAgIGJ5IDB4Li4uLi4uLi46IGZvbzIgKHRlc3RzL3ZhcmluZm81c28uYzo3MSkKKy0gICBi
eSAweC4uLi4uLi4uOiB2YXJpbmZvMl9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6ODEpCistICAg
YnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NSkKKy0g
ICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4u
Li4uLjogY3JvYWsgKHZhcmluZm81c28uYzoyOSkKKysgICBieSAweC4uLi4uLi4uOiBmb28yICh2
YXJpbmZvNXNvLmM6NzEpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzJfbWFpbiAodmFyaW5m
bzVzby5jOjgxKQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28u
YzoxNTUpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlv
biAweC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5zaWRlIHZhcls3XSwKKyAgZGVjbGFyZWQgYXQgdmFy
aW5mbzVzby5jOjY5LCBpbiBmcmFtZSAjWCBvZiB0aHJlYWQgMQorIAorIFVuaW5pdGlhbGlzZWQg
Ynl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAweC4uLi4u
Li4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46IGZv
bzIgKHRlc3RzL3ZhcmluZm81c28uYzo3MykKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvMl9t
YWluICh0ZXN0cy92YXJpbmZvNXNvLmM6ODEpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVf
bWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NSkKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0
ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHZhcmluZm81c28u
YzoyOSkKKysgICBieSAweC4uLi4uLi4uOiBmb28yICh2YXJpbmZvNXNvLmM6NzMpCisrICAgYnkg
MHguLi4uLi4uLjogdmFyaW5mbzJfbWFpbiAodmFyaW5mbzVzby5jOjgxKQorKyAgIGJ5IDB4Li4u
Li4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTUpCisrICAgYnkgMHguLi4uLi4u
LjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlzIDIgYnl0ZXMg
aW5zaWRlIHZhci5iYXIsCisgIGRlY2xhcmVkIGF0IHZhcmluZm81c28uYzo3MiwgaW4gZnJhbWUg
I1ggb2YgdGhyZWFkIDEKKyAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNs
aWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHRlc3RzL3Zhcmlu
Zm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiBmb28yICh0ZXN0cy92YXJpbmZvNXNvLmM6
NzYpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzJfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5j
OjgxKQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28u
YzoxNTUpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAg
IGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4u
LjogZm9vMiAodmFyaW5mbzVzby5jOjc2KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8yX21h
aW4gKHZhcmluZm81c28uYzo4MSkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2
YXJpbmZvNXNvLmM6MTU1KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81LmM6NSkK
KyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAxIGJ5dGUgaW5zaWRlIGxvY2FsIHZhciAidmFyIgor
ICBkZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6NjcsIGluIGZyYW1lICNYIG9mIHRocmVhZCAxCisg
CisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVz
dAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAg
YnkgMHguLi4uLi4uLjogZm9vMyAodGVzdHMvdmFyaW5mbzVzby5jOjEwNikKKy0gICBieSAweC4u
Li4uLi4uOiB2YXJpbmZvM19tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTE4KQorLSAgIGJ5IDB4
Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTYpCistICAgYnkg
MHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46
IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogZm9vMyAodmFyaW5m
bzVzby5jOjEwNikKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvM19tYWluICh2YXJpbmZvNXNv
LmM6MTE4KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzox
NTYpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAw
eC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5zaWRlIHN0YXRpY19nbG9iYWxfZGVmWzFdLAorICBhIGds
b2JhbCB2YXJpYWJsZSBkZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6ODcKKyAKKyBVbmluaXRpYWxp
c2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHgu
Li4uLi4uLjogY3JvYWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4u
OiBmb28zICh0ZXN0cy92YXJpbmZvNXNvLmM6MTA3KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmlu
Zm8zX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxMTgpCistICAgYnkgMHguLi4uLi4uLjogdmFy
aW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NikKKy0gICBieSAweC4uLi4uLi4uOiBt
YWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHZhcmlu
Zm81c28uYzoyOSkKKysgICBieSAweC4uLi4uLi4uOiBmb28zICh2YXJpbmZvNXNvLmM6MTA3KQor
KyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8zX21haW4gKHZhcmluZm81c28uYzoxMTgpCisrICAg
YnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5jOjE1NikKKysgICBieSAw
eC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5jOjUpCisgIExvY2F0aW9uIDB4Li4uLi4uLi4gaXMg
MCBieXRlcyBpbnNpZGUgbm9uc3RhdGljX2dsb2JhbF9kZWZbMl0sCisgIGEgZ2xvYmFsIHZhcmlh
YmxlIGRlY2xhcmVkIGF0IHZhcmluZm81c28uYzo4OAorIAorIFVuaW5pdGlhbGlzZWQgYnl0ZShz
KSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAweC4uLi4uLi4uOiBj
cm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46IGZvbzMgKHRl
c3RzL3ZhcmluZm81c28uYzoxMDgpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzNfbWFpbiAo
dGVzdHMvdmFyaW5mbzVzby5jOjExOCkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWlu
ICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU2KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3Rz
L3ZhcmluZm81LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5mbzVzby5jOjI5
KQorKyAgIGJ5IDB4Li4uLi4uLi46IGZvbzMgKHZhcmluZm81c28uYzoxMDgpCisrICAgYnkgMHgu
Li4uLi4uLjogdmFyaW5mbzNfbWFpbiAodmFyaW5mbzVzby5jOjExOCkKKysgICBieSAweC4uLi4u
Li4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU2KQorKyAgIGJ5IDB4Li4uLi4uLi46
IG1haW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAwIGJ5dGVzIGlu
c2lkZSBzdGF0aWNfZ2xvYmFsX3VuZGVmWzNdLAorICBhIGdsb2JhbCB2YXJpYWJsZSBkZWNsYXJl
ZCBhdCB2YXJpbmZvNXNvLmM6ODkKKyAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykgZm91bmQgZHVy
aW5nIGNsaWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHRlc3Rz
L3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiBmb28zICh0ZXN0cy92YXJpbmZv
NXNvLmM6MTA5KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8zX21haW4gKHRlc3RzL3Zhcmlu
Zm81c28uYzoxMTgpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFy
aW5mbzVzby5jOjE1NikKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5j
OjUpCisrICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHZhcmluZm81c28uYzoyOSkKKysgICBieSAw
eC4uLi4uLi4uOiBmb28zICh2YXJpbmZvNXNvLmM6MTA5KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZh
cmluZm8zX21haW4gKHZhcmluZm81c28uYzoxMTgpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5m
bzVfbWFpbiAodmFyaW5mbzVzby5jOjE1NikKKysgICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJp
bmZvNS5jOjUpCisgIExvY2F0aW9uIDB4Li4uLi4uLi4gaXMgMCBieXRlcyBpbnNpZGUgbm9uc3Rh
dGljX2dsb2JhbF91bmRlZls0XSwKKyAgYSBnbG9iYWwgdmFyaWFibGUgZGVjbGFyZWQgYXQgdmFy
aW5mbzVzby5jOjkwCisgCisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGll
bnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZv
NXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogYmFyMyAodGVzdHMvdmFyaW5mbzVzby5jOjk0
KQorLSAgIGJ5IDB4Li4uLi4uLi46IGZvbzMgKHRlc3RzL3ZhcmluZm81c28uYzoxMTApCistICAg
YnkgMHguLi4uLi4uLjogdmFyaW5mbzNfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjExOCkKKy0g
ICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU2KQor
LSAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBhdCAweC4u
Li4uLi4uOiBjcm9hayAodmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46IGJhcjMg
KHZhcmluZm81c28uYzo5NCkKKysgICBieSAweC4uLi4uLi4uOiBmb28zICh2YXJpbmZvNXNvLmM6
MTEwKQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8zX21haW4gKHZhcmluZm81c28uYzoxMTgp
CisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5jOjE1NikKKysg
ICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5jOjUpCisgIEFkZHJlc3MgMHguLi4uLi4u
LiBpcyA1IGJ5dGVzIGluc2lkZSBkYXRhIHN5bWJvbCAic3RhdGljX2xvY2FsX2RlZi5YWFhYIgor
IAorIFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVl
c3QKKy0gICBhdCAweC4uLi4uLi4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAg
IGJ5IDB4Li4uLi4uLi46IGJhcjMgKHRlc3RzL3ZhcmluZm81c28uYzo5NSkKKy0gICBieSAweC4u
Li4uLi4uOiBmb28zICh0ZXN0cy92YXJpbmZvNXNvLmM6MTEwKQorLSAgIGJ5IDB4Li4uLi4uLi46
IHZhcmluZm8zX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxMTgpCistICAgYnkgMHguLi4uLi4u
LjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NikKKy0gICBieSAweC4uLi4u
Li4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4uLi4uLjogY3JvYWsg
KHZhcmluZm81c28uYzoyOSkKKysgICBieSAweC4uLi4uLi4uOiBiYXIzICh2YXJpbmZvNXNvLmM6
OTUpCisrICAgYnkgMHguLi4uLi4uLjogZm9vMyAodmFyaW5mbzVzby5jOjExMCkKKysgICBieSAw
eC4uLi4uLi4uOiB2YXJpbmZvM19tYWluICh2YXJpbmZvNXNvLmM6MTE4KQorKyAgIGJ5IDB4Li4u
Li4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTYpCisrICAgYnkgMHguLi4uLi4u
LjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlzIDAgYnl0ZXMg
aW5zaWRlIG5vbnN0YXRpY19sb2NhbF9kZWZbNl0sCisgIGRlY2xhcmVkIGF0IHZhcmluZm81c28u
YzoxMDMsIGluIGZyYW1lICNYIG9mIHRocmVhZCAxCisgCisgVW5pbml0aWFsaXNlZCBieXRlKHMp
IGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4uLi46IGNy
b2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogYmFyMyAodGVz
dHMvdmFyaW5mbzVzby5jOjk2KQorLSAgIGJ5IDB4Li4uLi4uLi46IGZvbzMgKHRlc3RzL3Zhcmlu
Zm81c28uYzoxMTApCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzNfbWFpbiAodGVzdHMvdmFy
aW5mbzVzby5jOjExOCkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92
YXJpbmZvNXNvLmM6MTU2KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81
LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5
IDB4Li4uLi4uLi46IGJhcjMgKHZhcmluZm81c28uYzo5NikKKysgICBieSAweC4uLi4uLi4uOiBm
b28zICh2YXJpbmZvNXNvLmM6MTEwKQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8zX21haW4g
KHZhcmluZm81c28uYzoxMTgpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodmFy
aW5mbzVzby5jOjE1NikKKysgICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5jOjUpCisg
IEFkZHJlc3MgMHguLi4uLi4uLiBpcyA3IGJ5dGVzIGluc2lkZSBkYXRhIHN5bWJvbCAic3RhdGlj
X2xvY2FsX3VuZGVmLlhYWFgiCisgCisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmlu
ZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92
YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogYmFyMyAodGVzdHMvdmFyaW5mbzVz
by5jOjk3KQorLSAgIGJ5IDB4Li4uLi4uLi46IGZvbzMgKHRlc3RzL3ZhcmluZm81c28uYzoxMTAp
CistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzNfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjEx
OCkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6
MTU2KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBh
dCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46
IGJhcjMgKHZhcmluZm81c28uYzo5NykKKysgICBieSAweC4uLi4uLi4uOiBmb28zICh2YXJpbmZv
NXNvLmM6MTEwKQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8zX21haW4gKHZhcmluZm81c28u
YzoxMTgpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5jOjE1
NikKKysgICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5jOjUpCisgIExvY2F0aW9uIDB4
Li4uLi4uLi4gaXMgMCBieXRlcyBpbnNpZGUgbm9uc3RhdGljX2xvY2FsX3VuZGVmWzhdLAorICBk
ZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6MTA1LCBpbiBmcmFtZSAjWCBvZiB0aHJlYWQgMQorIAor
IFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QK
Ky0gICBhdCAweC4uLi4uLi4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5
IDB4Li4uLi4uLi46IGJsYWg0ICh0ZXN0cy92YXJpbmZvNXNvLmM6MTM3KQorLSAgIGJ5IDB4Li4u
Li4uLi46IHZhcmluZm80X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNDYpCistICAgYnkgMHgu
Li4uLi4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NykKKy0gICBieSAw
eC4uLi4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4uLi4uLjog
Y3JvYWsgKHZhcmluZm81c28uYzoyOSkKKysgICBieSAweC4uLi4uLi4uOiBibGFoNCAodmFyaW5m
bzVzby5jOjEzNykKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNF9tYWluICh2YXJpbmZvNXNv
LmM6MTQ2KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzox
NTcpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAw
eC4uLi4uLi4uIGlzIDEgYnl0ZSBpbnNpZGUgYVszXS54eXp6eVsyMV0uYzEsCisgIGRlY2xhcmVk
IGF0IHZhcmluZm81c28uYzoxMzUsIGluIGZyYW1lICNYIG9mIHRocmVhZCAxCisgCisgVW5pbml0
aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0
IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4u
Li4uLjogYmxhaDQgKHRlc3RzL3ZhcmluZm81c28uYzoxMzgpCistICAgYnkgMHguLi4uLi4uLjog
dmFyaW5mbzRfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE0NikKKy0gICBieSAweC4uLi4uLi4u
OiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU3KQorLSAgIGJ5IDB4Li4uLi4u
Li46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBjcm9hayAo
dmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46IGJsYWg0ICh2YXJpbmZvNXNvLmM6
MTM4KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm80X21haW4gKHZhcmluZm81c28uYzoxNDYp
CisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5jOjE1NykKKysg
ICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5jOjUpCisgIExvY2F0aW9uIDB4Li4uLi4u
Li4gaXMgMCBieXRlcyBpbnNpZGUgYVs1XS5ib25nLAorICBkZWNsYXJlZCBhdCB2YXJpbmZvNXNv
LmM6MTM1LCBpbiBmcmFtZSAjWCBvZiB0aHJlYWQgMQorIAorIFVuaW5pdGlhbGlzZWQgYnl0ZShz
KSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAweC4uLi4uLi4uOiBj
cm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46IGJsYWg0ICh0
ZXN0cy92YXJpbmZvNXNvLmM6MTM5KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm80X21haW4g
KHRlc3RzL3ZhcmluZm81c28uYzoxNDYpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFp
biAodGVzdHMvdmFyaW5mbzVzby5jOjE1NykKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0
cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHZhcmluZm81c28uYzoy
OSkKKysgICBieSAweC4uLi4uLi4uOiBibGFoNCAodmFyaW5mbzVzby5jOjEzOSkKKysgICBieSAw
eC4uLi4uLi4uOiB2YXJpbmZvNF9tYWluICh2YXJpbmZvNXNvLmM6MTQ2KQorKyAgIGJ5IDB4Li4u
Li4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTcpCisrICAgYnkgMHguLi4uLi4u
LjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlzIDEgYnl0ZSBp
bnNpZGUgYVszXS54eXp6eVsyMV0uYzJbMl0sCisgIGRlY2xhcmVkIGF0IHZhcmluZm81c28uYzox
MzUsIGluIGZyYW1lICNYIG9mIHRocmVhZCAxCisgCisgYW5zd2VyIGlzIDAKKyBVbmluaXRpYWxp
c2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHgu
Li4uLi4uLjogY3JvYWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4u
OiBmdW5fYyAodGVzdHMvdmFyaW5mbzVzby5jOjE2NCkKKy0gICBieSAweC4uLi4uLi4uOiBmdW5f
YiAodGVzdHMvdmFyaW5mbzVzby5jOjE2OCkKKy0gICBieSAweC4uLi4uLi4uOiBmdW5fYSAodGVz
dHMvdmFyaW5mbzVzby5jOjE3MikKKy0gICBieSAweC4uLi4uLi4uOiBpbmxpbmV0ZXN0ICh0ZXN0
cy92YXJpbmZvNXNvLmM6MTc4KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRl
c3RzL3ZhcmluZm81c28uYzoxNTgpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFy
aW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisr
ICAgYnkgMHguLi4uLi4uLjogZnVuX2MgKHZhcmluZm81c28uYzoxNjQpCisrICAgYnkgMHguLi4u
Li4uLjogZnVuX2IgKHZhcmluZm81c28uYzoxNjgpCisrICAgYnkgMHguLi4uLi4uLjogZnVuX2Eg
KHZhcmluZm81c28uYzoxNzIpCisrICAgYnkgMHguLi4uLi4uLjogaW5saW5ldGVzdCAodmFyaW5m
bzVzby5jOjE3OCkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNv
LmM6MTU4KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81LmM6NSkKKyAgQWRkcmVz
cyAweC4uLi4uLi4uIGlzIG9uIHRocmVhZCAxJ3Mgc3RhY2sKKyAgaW4gZnJhbWUgI1gsIGNyZWF0
ZWQgYnkgdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5jOjE1MykKKyAKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZF8zLjIxLjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmRfMy4yMi4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmlu
ZF8zLjIxLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxn
cmluZF8zLjIyLjAuYmIKaW5kZXggNjhhYjMxOWExYi4uYzFlZDc2Yjg0OSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kXzMuMjEuMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmRfMy4yMi4wLmJiCkBAIC0zNiw5
ICszNiw5IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9wdWIvdmFsZ3JpbmQv
dmFsZ3JpbmQtJHtQVn0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW5vbmUtdGVz
dHMtZmRsZWFrX2Ntc2cuc3RkZXJyLmV4cC1hZGp1c3QtdG1wLXBhdGhzLnBhdGNoIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtbWVtY2hlY2stdGVzdHMtRml4LXRpbWVyZmQtc3lzY2FsbC10ZXN0
LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtZG9jcy1EaXNhYmxlLW1hbnVhbC12YWxp
ZGF0aW9uLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtbm9uZS10ZXN0cy14ODYtbGlu
dXgtc2VnX292ZXJyaWRlLmMtYWRkLW1pc3NpbmctaW5jbC5wYXRjaCBcCisgICAgICAgICAgIGZp
bGU6Ly8wMDIwLUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoIFwKICAgICAg
ICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjEwY2UxNjE4YmIzZTMzZmFkMTZlYjc5NTUy
YjBhM2UxMjExNzYyNDQ4YTBkN2ZjZTExYzhhNjI0M2I5YWM5NzEiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiYzgxMWRiNWFkZDJjNWY3Mjk5NDRjYWY0N2M0ZTdhNjVkY2FhYmI5NDYxZTQ3MmI1Nzg3
NjVkZDdiZjZkMmQ0YyIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gInZhbGdyaW5kLSg/UDxwdmVy
PlxkKyhcLlxkKykrKVwudGFyIgogCiBDT01QQVRJQkxFX0hPU1QgPSAnKGkuODZ8eDg2XzY0fGFy
bXxhYXJjaDY0fG1pcHN8cG93ZXJwY3xwb3dlcnBjNjQpLiotbGludXgnCi0tIAoyLjM5LjIKCg==

--===============1876842960839235392==--

