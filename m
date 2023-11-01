Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666AFC0018C
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:14 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.8497.1698848705389087593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MVlD2fIB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oxQcYpYT;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.23, mailfrom: 0101018b8b460921-c825f9bd-16c1-400f-a496-58105facdf92-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Dbc8fxi54c5K6ct+HtKqYhppKjZEPnwCVxKWWE4P7zU=;
	b=MVlD2fIBdS+pzPvRcVv0CKUwflNVWc14GlPJekKg5mLWyguHBHvblT4TZJ9xg+2p
	50Nv6dY7ATFEFuO/65QKBP3XQtmwvZoNpGfzOTYdHU46G1WHXdEsr2BkBOqM2algM6L
	S28JhmCXZBbWvaDHkV6alu0teJlMLkUO5woPLjBc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848704;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Dbc8fxi54c5K6ct+HtKqYhppKjZEPnwCVxKWWE4P7zU=;
	b=oxQcYpYTD+7Dq5IKrimFAOKP59Rw/dYyr5A5IU28wjrR1OSXS7LG81mdmXemUDAD
	kv6q45ECny7M+l3O1Do4zfH3UX8M0RWFmTLV00bYQKS9l9mZy64xvZxTh9sYpjNWQbt
	LzSXXMKPAZ+P1t2rPt47hK9LbXg3zvK6g+z55EoM=
Content-Type: multipart/mixed; boundary="===============2576392915930474442=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] valgrind: upgrading to 3.22.0 FAILED
Message-ID: <0101018b8b460921-c825f9bd-16c1-400f-a496-58105facdf92-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189979

--===============2576392915930474442==
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
From 8486f003637ff95c72dd12775b053ff2b0df6962 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 11:05:55 +0000
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
index 0000000000..0752dc26e8
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0020-Committing-changes-from-do_patch.patch
@@ -0,0 +1,332 @@
+From de2beb17ebda7470ec6dc71ac839f8724745f98f Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Wed, 1 Nov 2023 11:05:11 +0000
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
index 717d82830e..62a453dfef 100644
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


--===============2576392915930474442==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-valgrind-upgrade-3.21.0-3.22.0.patch"

RnJvbSA4NDg2ZjAwMzYzN2ZmOTVjNzJkZDEyNzc1YjA1M2ZmMmIwZGY2OTYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMTowNTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZh
bGdyaW5kOiB1cGdyYWRlIDMuMjEuMCAtPiAzLjIyLjAKCi0tLQogLi4uaW51eC1zZWdfb3ZlcnJp
ZGUuYy1hZGQtbWlzc2luZy1pbmNsLnBhdGNoIHwgIDMwIC0tCiAuLi4wMjAtQ29tbWl0dGluZy1j
aGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2ggfCAzMzIgKysrKysrKysrKysrKysrKysrCiAuLi57
dmFsZ3JpbmRfMy4yMS4wLmJiID0+IHZhbGdyaW5kXzMuMjIuMC5iYn0gfCAgIDQgKy0KIDMgZmls
ZXMgY2hhbmdlZCwgMzM0IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW5v
bmUtdGVzdHMteDg2LWxpbnV4LXNlZ19vdmVycmlkZS5jLWFkZC1taXNzaW5nLWluY2wucGF0Y2gK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3Jp
bmQvMDAyMC1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaAogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC97dmFsZ3JpbmRfMy4yMS4wLmJiID0+IHZhbGdy
aW5kXzMuMjIuMC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1ub25lLXRlc3RzLXg4Ni1saW51eC1zZWdfb3ZlcnJpZGUu
Yy1hZGQtbWlzc2luZy1pbmNsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5k
L3ZhbGdyaW5kLzAwMDEtbm9uZS10ZXN0cy14ODYtbGludXgtc2VnX292ZXJyaWRlLmMtYWRkLW1p
c3NpbmctaW5jbC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNWUzNmMyODUy
My4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3Jp
bmQvMDAwMS1ub25lLXRlc3RzLXg4Ni1saW51eC1zZWdfb3ZlcnJpZGUuYy1hZGQtbWlzc2luZy1p
bmNsLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzAgKzAsMCBAQAotRnJvbSA5NzhkOWVkN2Y4
NTdmMmNkY2QyYTg2MzJmM2MyZmViNTZiOTljODI1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQot
RnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLURhdGU6IE1vbiwg
OCBNYXkgMjAyMyAxMTo1NjozNSArMDIwMAotU3ViamVjdDogW1BBVENIXSBub25lL3Rlc3RzL3g4
Ni1saW51eC9zZWdfb3ZlcnJpZGUuYzogYWRkIG1pc3NpbmcgaW5jbHVkZSBmb3IKLSBtdXNsIGJ1
aWxkcwotCi1PdGhlcndpc2UgU1lTX21vZGlmeV9sZHQgaXMgdW5kZWZpbmVkLgotCi1VcHN0cmVh
bS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9idWdzLmtkZS5vcmcvc2hvd19idWcuY2dpP2lk
PTM4MjAzNF0KLVNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9u
aXguZGU+Ci0KLS0tLQotIG5vbmUvdGVzdHMveDg2LWxpbnV4L3NlZ19vdmVycmlkZS5jIHwgNCAr
KysrCi0gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQotCi1kaWZmIC0tZ2l0IGEvbm9u
ZS90ZXN0cy94ODYtbGludXgvc2VnX292ZXJyaWRlLmMgYi9ub25lL3Rlc3RzL3g4Ni1saW51eC9z
ZWdfb3ZlcnJpZGUuYwotaW5kZXggY2E4ZmJmZS4uNGVmNDM5NCAxMDA2NDQKLS0tLSBhL25vbmUv
dGVzdHMveDg2LWxpbnV4L3NlZ19vdmVycmlkZS5jCi0rKysgYi9ub25lL3Rlc3RzL3g4Ni1saW51
eC9zZWdfb3ZlcnJpZGUuYwotQEAgLTMsNiArMywxMCBAQAotICNpbmNsdWRlIDxlcnJuby5oPgot
ICNpbmNsdWRlIDxzdHJpbmcuaD4KLSAjaW5jbHVkZSAiLi4vLi4vLi4vY29uZmlnLmgiCi0rI2lm
IGRlZmluZWQoTVVTTF9MSUJDKQotKyNpbmNsdWRlIDxzeXNjYWxsLmg+Ci0rI2luY2x1ZGUgPHVu
aXN0ZC5oPgotKyNlbmRpZgotIAotIAotIC8qIFN0dWZmIGZyb20gV2luZS4gKi8KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDIwLUNvbW1pdHRp
bmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGdyaW5kL3ZhbGdyaW5kLzAwMjAtQ29tbWl0dGluZy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0
Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMDc1MmRjMjZlOAotLS0g
L2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8w
MDIwLUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoCkBAIC0wLDAgKzEsMzMy
IEBACitGcm9tIGRlMmJlYjE3ZWJkYTc0NzBlYzZkYzcxYWM4MzlmODcyNDc0NWY5OGYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBPcGVuRW1iZWRkZWQgPG9lLnBhdGNoQG9lPgorRGF0
ZTogV2VkLCAxIE5vdiAyMDIzIDExOjA1OjExICswMDAwCitTdWJqZWN0OiBbUEFUQ0hdIENvbW1p
dHRpbmcgY2hhbmdlcyBmcm9tIGRvX3BhdGNoCisKKy0tLQorIG1lbWNoZWNrL3Rlc3RzL2JhZGZy
ZWUzLnN0ZGVyci5leHAgfCAgIDQgKy0KKyBtZW1jaGVjay90ZXN0cy92YXJpbmZvNS5zdGRlcnIu
ZXhwIHwgMjE2ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCisgMiBmaWxlcyBjaGFuZ2Vk
LCAxMTAgaW5zZXJ0aW9ucygrKSwgMTEwIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvbWVt
Y2hlY2svdGVzdHMvYmFkZnJlZTMuc3RkZXJyLmV4cCBiL21lbWNoZWNrL3Rlc3RzL2JhZGZyZWUz
LnN0ZGVyci5leHAKK2luZGV4IDIwZTQ4YTYuLmI1MTg3MDMgMTAwNjQ0CistLS0gYS9tZW1jaGVj
ay90ZXN0cy9iYWRmcmVlMy5zdGRlcnIuZXhwCisrKysgYi9tZW1jaGVjay90ZXN0cy9iYWRmcmVl
My5zdGRlcnIuZXhwCitAQCAtMSwxMSArMSwxMSBAQAorIEludmFsaWQgZnJlZSgpIC8gZGVsZXRl
IC8gZGVsZXRlW10gLyByZWFsbG9jKCkKKyAgICBhdCAweC4uLi4uLi4uOiBmcmVlICh2Z19yZXBs
YWNlX21hbGxvYy5jOi4uLikKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy9iYWRmcmVl
LmM6MTIpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAoYmFkZnJlZS5jOjEyKQorICBBZGRyZXNz
IDB4Li4uLi4uLi4gaXMgbm90IHN0YWNrJ2QsIG1hbGxvYydkIG9yIChyZWNlbnRseSkgZnJlZSdk
CisgCisgSW52YWxpZCBmcmVlKCkgLyBkZWxldGUgLyBkZWxldGVbXSAvIHJlYWxsb2MoKQorICAg
IGF0IDB4Li4uLi4uLi46IGZyZWUgKHZnX3JlcGxhY2VfbWFsbG9jLmM6Li4uKQorLSAgIGJ5IDB4
Li4uLi4uLi46IG1haW4gKHRlc3RzL2JhZGZyZWUuYzoxNSkKKysgICBieSAweC4uLi4uLi4uOiBt
YWluIChiYWRmcmVlLmM6MTUpCisgIEFkZHJlc3MgMHguLi4uLi4uLiBpcyBvbiB0aHJlYWQgMSdz
IHN0YWNrCisgIGluIGZyYW1lICMxLCBjcmVhdGVkIGJ5IG1haW4gKGJhZGZyZWUuYzo3KQorIAor
ZGlmZiAtLWdpdCBhL21lbWNoZWNrL3Rlc3RzL3ZhcmluZm81LnN0ZGVyci5leHAgYi9tZW1jaGVj
ay90ZXN0cy92YXJpbmZvNS5zdGRlcnIuZXhwCitpbmRleCAxYTEwZDAzLi4wZmQxMTkwIDEwMDY0
NAorLS0tIGEvbWVtY2hlY2svdGVzdHMvdmFyaW5mbzUuc3RkZXJyLmV4cAorKysrIGIvbWVtY2hl
Y2svdGVzdHMvdmFyaW5mbzUuc3RkZXJyLmV4cAorQEAgLTEsMTkxICsxLDE5MSBAQAorIFVuaW5p
dGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QKKy0gICBh
dCAweC4uLi4uLi4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5IDB4Li4u
Li4uLi46IHZhcmluZm8xX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzo1MikKKy0gICBieSAweC4u
Li4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU0KQorLSAgIGJ5IDB4
Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBj
cm9hayAodmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8xX21haW4g
KHZhcmluZm81c28uYzo1MikKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJp
bmZvNXNvLmM6MTU0KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81LmM6NSkKKyAg
QWRkcmVzcyAweC4uLi4uLi4uIGlzIDEgYnl0ZXMgaW5zaWRlIGEgYmxvY2sgb2Ygc2l6ZSAzIGFs
bG9jJ2QKKyAgICBhdCAweC4uLi4uLi4uOiBtYWxsb2MgKHZnX3JlcGxhY2VfbWFsbG9jLmM6Li4u
KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8xX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzo1
MCkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6
MTU0KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBi
eSAweC4uLi4uLi4uOiB2YXJpbmZvMV9tYWluICh2YXJpbmZvNXNvLmM6NTApCisrICAgYnkgMHgu
Li4uLi4uLjogdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5jOjE1NCkKKysgICBieSAweC4uLi4u
Li4uOiBtYWluICh2YXJpbmZvNS5jOjUpCisgCisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5k
IGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0
ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzFfbWFpbiAo
dGVzdHMvdmFyaW5mbzVzby5jOjU1KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4g
KHRlc3RzL3ZhcmluZm81c28uYzoxNTQpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMv
dmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6Mjkp
CisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzFfbWFpbiAodmFyaW5mbzVzby5jOjU1KQorKyAg
IGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTQpCisrICAgYnkg
MHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlz
IDAgYnl0ZXMgaW5zaWRlIGdsb2JhbCB2YXIgImdsb2JhbF91MSIKKyAgZGVjbGFyZWQgYXQgdmFy
aW5mbzVzby5jOjM4CisgCisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGll
bnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZv
NXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzFfbWFpbiAodGVzdHMvdmFyaW5m
bzVzby5jOjU2KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3Zhcmlu
Zm81c28uYzoxNTQpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1
KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHgu
Li4uLi4uLjogdmFyaW5mbzFfbWFpbiAodmFyaW5mbzVzby5jOjU2KQorKyAgIGJ5IDB4Li4uLi4u
Li46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTQpCisrICAgYnkgMHguLi4uLi4uLjog
bWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5z
aWRlIGdsb2JhbCB2YXIgImdsb2JhbF9pMSIKKyAgZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5jOjQw
CisgCisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVx
dWVzdAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCist
ICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzFfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjU3KQor
LSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTQp
CistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4
Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogdmFy
aW5mbzFfbWFpbiAodmFyaW5mbzVzby5jOjU3KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81
X21haW4gKHZhcmluZm81c28uYzoxNTQpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5m
bzUuYzo1KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5zaWRlIGdsb2JhbF91
MlszXSwKKyAgYSBnbG9iYWwgdmFyaWFibGUgZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5jOjQyCisg
CisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVz
dAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAg
YnkgMHguLi4uLi4uLjogdmFyaW5mbzFfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjU4KQorLSAg
IGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTQpCist
ICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4u
Li4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5m
bzFfbWFpbiAodmFyaW5mbzVzby5jOjU4KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21h
aW4gKHZhcmluZm81c28uYzoxNTQpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUu
Yzo1KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5zaWRlIGdsb2JhbF9pMls3
XSwKKyAgYSBnbG9iYWwgdmFyaWFibGUgZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5jOjQ0CisgCisg
VW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVzdAor
LSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAgYnkg
MHguLi4uLi4uLjogdmFyaW5mbzFfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjU5KQorLSAgIGJ5
IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTQpCistICAg
YnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4u
Li46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzFf
bWFpbiAodmFyaW5mbzVzby5jOjU5KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4g
KHZhcmluZm81c28uYzoxNTQpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1
KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5zaWRlIGxvY2FsIHZhciAibG9j
YWwiCisgIGRlY2xhcmVkIGF0IHZhcmluZm81c28uYzo0OSwgaW4gZnJhbWUgI1ggb2YgdGhyZWFk
IDEKKyAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayBy
ZXF1ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkK
Ky0gICBieSAweC4uLi4uLi4uOiBmb28yICh0ZXN0cy92YXJpbmZvNXNvLmM6NzEpCistICAgYnkg
MHguLi4uLi4uLjogdmFyaW5mbzJfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjgxKQorLSAgIGJ5
IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTUpCistICAg
YnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4u
Li46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogZm9vMiAodmFy
aW5mbzVzby5jOjcxKQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8yX21haW4gKHZhcmluZm81
c28uYzo4MSkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6
MTU1KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRpb24g
MHguLi4uLi4uLiBpcyAwIGJ5dGVzIGluc2lkZSB2YXJbN10sCisgIGRlY2xhcmVkIGF0IHZhcmlu
Zm81c28uYzo2OSwgaW4gZnJhbWUgI1ggb2YgdGhyZWFkIDEKKyAKKyBVbmluaXRpYWxpc2VkIGJ5
dGUocykgZm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4uLi4u
LjogY3JvYWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiBmb28y
ICh0ZXN0cy92YXJpbmZvNXNvLmM6NzMpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzJfbWFp
biAodGVzdHMvdmFyaW5mbzVzby5jOjgxKQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21h
aW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTUpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVz
dHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6
MjkpCisrICAgYnkgMHguLi4uLi4uLjogZm9vMiAodmFyaW5mbzVzby5jOjczKQorKyAgIGJ5IDB4
Li4uLi4uLi46IHZhcmluZm8yX21haW4gKHZhcmluZm81c28uYzo4MSkKKysgICBieSAweC4uLi4u
Li4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU1KQorKyAgIGJ5IDB4Li4uLi4uLi46
IG1haW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAyIGJ5dGVzIGlu
c2lkZSB2YXIuYmFyLAorICBkZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6NzIsIGluIGZyYW1lICNY
IG9mIHRocmVhZCAxCisgCisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGll
bnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZv
NXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogZm9vMiAodGVzdHMvdmFyaW5mbzVzby5jOjc2
KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8yX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzo4
MSkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6
MTU1KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBh
dCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46
IGZvbzIgKHZhcmluZm81c28uYzo3NikKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvMl9tYWlu
ICh2YXJpbmZvNXNvLmM6ODEpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodmFy
aW5mbzVzby5jOjE1NSkKKysgICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5jOjUpCisg
IExvY2F0aW9uIDB4Li4uLi4uLi4gaXMgMSBieXRlIGluc2lkZSBsb2NhbCB2YXIgInZhciIKKyAg
ZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5jOjY3LCBpbiBmcmFtZSAjWCBvZiB0aHJlYWQgMQorIAor
IFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QK
Ky0gICBhdCAweC4uLi4uLi4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5
IDB4Li4uLi4uLi46IGZvbzMgKHRlc3RzL3ZhcmluZm81c28uYzoxMDYpCistICAgYnkgMHguLi4u
Li4uLjogdmFyaW5mbzNfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjExOCkKKy0gICBieSAweC4u
Li4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU2KQorLSAgIGJ5IDB4
Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBj
cm9hayAodmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46IGZvbzMgKHZhcmluZm81
c28uYzoxMDYpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzNfbWFpbiAodmFyaW5mbzVzby5j
OjExOCkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU2
KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRpb24gMHgu
Li4uLi4uLiBpcyAwIGJ5dGVzIGluc2lkZSBzdGF0aWNfZ2xvYmFsX2RlZlsxXSwKKyAgYSBnbG9i
YWwgdmFyaWFibGUgZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5jOjg3CisgCisgVW5pbml0aWFsaXNl
ZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4u
Li4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjog
Zm9vMyAodGVzdHMvdmFyaW5mbzVzby5jOjEwNykKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZv
M19tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTE4KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmlu
Zm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTYpCistICAgYnkgMHguLi4uLi4uLjogbWFp
biAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZv
NXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogZm9vMyAodmFyaW5mbzVzby5jOjEwNykKKysg
ICBieSAweC4uLi4uLi4uOiB2YXJpbmZvM19tYWluICh2YXJpbmZvNXNvLmM6MTE4KQorKyAgIGJ5
IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTYpCisrICAgYnkgMHgu
Li4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlzIDAg
Ynl0ZXMgaW5zaWRlIG5vbnN0YXRpY19nbG9iYWxfZGVmWzJdLAorICBhIGdsb2JhbCB2YXJpYWJs
ZSBkZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6ODgKKyAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykg
Zm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3Jv
YWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiBmb28zICh0ZXN0
cy92YXJpbmZvNXNvLmM6MTA4KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8zX21haW4gKHRl
c3RzL3ZhcmluZm81c28uYzoxMTgpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAo
dGVzdHMvdmFyaW5mbzVzby5jOjE1NikKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy92
YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHZhcmluZm81c28uYzoyOSkK
KysgICBieSAweC4uLi4uLi4uOiBmb28zICh2YXJpbmZvNXNvLmM6MTA4KQorKyAgIGJ5IDB4Li4u
Li4uLi46IHZhcmluZm8zX21haW4gKHZhcmluZm81c28uYzoxMTgpCisrICAgYnkgMHguLi4uLi4u
LjogdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5jOjE1NikKKysgICBieSAweC4uLi4uLi4uOiBt
YWluICh2YXJpbmZvNS5jOjUpCisgIExvY2F0aW9uIDB4Li4uLi4uLi4gaXMgMCBieXRlcyBpbnNp
ZGUgc3RhdGljX2dsb2JhbF91bmRlZlszXSwKKyAgYSBnbG9iYWwgdmFyaWFibGUgZGVjbGFyZWQg
YXQgdmFyaW5mbzVzby5jOjg5CisgCisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmlu
ZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92
YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogZm9vMyAodGVzdHMvdmFyaW5mbzVz
by5jOjEwOSkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvM19tYWluICh0ZXN0cy92YXJpbmZv
NXNvLmM6MTE4KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3Zhcmlu
Zm81c28uYzoxNTYpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1
KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHgu
Li4uLi4uLjogZm9vMyAodmFyaW5mbzVzby5jOjEwOSkKKysgICBieSAweC4uLi4uLi4uOiB2YXJp
bmZvM19tYWluICh2YXJpbmZvNXNvLmM6MTE4KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81
X21haW4gKHZhcmluZm81c28uYzoxNTYpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5m
bzUuYzo1KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5zaWRlIG5vbnN0YXRp
Y19nbG9iYWxfdW5kZWZbNF0sCisgIGEgZ2xvYmFsIHZhcmlhYmxlIGRlY2xhcmVkIGF0IHZhcmlu
Zm81c28uYzo5MAorIAorIFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50
IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAweC4uLi4uLi4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVz
by5jOjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46IGJhcjMgKHRlc3RzL3ZhcmluZm81c28uYzo5NCkK
Ky0gICBieSAweC4uLi4uLi4uOiBmb28zICh0ZXN0cy92YXJpbmZvNXNvLmM6MTEwKQorLSAgIGJ5
IDB4Li4uLi4uLi46IHZhcmluZm8zX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxMTgpCistICAg
YnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NikKKy0g
ICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4u
Li4uLjogY3JvYWsgKHZhcmluZm81c28uYzoyOSkKKysgICBieSAweC4uLi4uLi4uOiBiYXIzICh2
YXJpbmZvNXNvLmM6OTQpCisrICAgYnkgMHguLi4uLi4uLjogZm9vMyAodmFyaW5mbzVzby5jOjEx
MCkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvM19tYWluICh2YXJpbmZvNXNvLmM6MTE4KQor
KyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTYpCisrICAg
YnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBBZGRyZXNzIDB4Li4uLi4uLi4g
aXMgNSBieXRlcyBpbnNpZGUgZGF0YSBzeW1ib2wgInN0YXRpY19sb2NhbF9kZWYuWFhYWCIKKyAK
KyBVbmluaXRpYWxpc2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0
CistICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBi
eSAweC4uLi4uLi4uOiBiYXIzICh0ZXN0cy92YXJpbmZvNXNvLmM6OTUpCistICAgYnkgMHguLi4u
Li4uLjogZm9vMyAodGVzdHMvdmFyaW5mbzVzby5jOjExMCkKKy0gICBieSAweC4uLi4uLi4uOiB2
YXJpbmZvM19tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTE4KQorLSAgIGJ5IDB4Li4uLi4uLi46
IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTYpCistICAgYnkgMHguLi4uLi4u
LjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2
YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogYmFyMyAodmFyaW5mbzVzby5jOjk1
KQorKyAgIGJ5IDB4Li4uLi4uLi46IGZvbzMgKHZhcmluZm81c28uYzoxMTApCisrICAgYnkgMHgu
Li4uLi4uLjogdmFyaW5mbzNfbWFpbiAodmFyaW5mbzVzby5jOjExOCkKKysgICBieSAweC4uLi4u
Li4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU2KQorKyAgIGJ5IDB4Li4uLi4uLi46
IG1haW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAwIGJ5dGVzIGlu
c2lkZSBub25zdGF0aWNfbG9jYWxfZGVmWzZdLAorICBkZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6
MTAzLCBpbiBmcmFtZSAjWCBvZiB0aHJlYWQgMQorIAorIFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBm
b3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAweC4uLi4uLi4uOiBjcm9h
ayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46IGJhcjMgKHRlc3Rz
L3ZhcmluZm81c28uYzo5NikKKy0gICBieSAweC4uLi4uLi4uOiBmb28zICh0ZXN0cy92YXJpbmZv
NXNvLmM6MTEwKQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8zX21haW4gKHRlc3RzL3Zhcmlu
Zm81c28uYzoxMTgpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFy
aW5mbzVzby5jOjE1NikKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5j
OjUpCisrICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHZhcmluZm81c28uYzoyOSkKKysgICBieSAw
eC4uLi4uLi4uOiBiYXIzICh2YXJpbmZvNXNvLmM6OTYpCisrICAgYnkgMHguLi4uLi4uLjogZm9v
MyAodmFyaW5mbzVzby5jOjExMCkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvM19tYWluICh2
YXJpbmZvNXNvLmM6MTE4KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmlu
Zm81c28uYzoxNTYpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBB
ZGRyZXNzIDB4Li4uLi4uLi4gaXMgNyBieXRlcyBpbnNpZGUgZGF0YSBzeW1ib2wgInN0YXRpY19s
b2NhbF91bmRlZi5YWFhYIgorIAorIFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcg
Y2xpZW50IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAweC4uLi4uLi4uOiBjcm9hayAodGVzdHMvdmFy
aW5mbzVzby5jOjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46IGJhcjMgKHRlc3RzL3ZhcmluZm81c28u
Yzo5NykKKy0gICBieSAweC4uLi4uLi4uOiBmb28zICh0ZXN0cy92YXJpbmZvNXNvLmM6MTEwKQor
LSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8zX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxMTgp
CistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1
NikKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQg
MHguLi4uLi4uLjogY3JvYWsgKHZhcmluZm81c28uYzoyOSkKKysgICBieSAweC4uLi4uLi4uOiBi
YXIzICh2YXJpbmZvNXNvLmM6OTcpCisrICAgYnkgMHguLi4uLi4uLjogZm9vMyAodmFyaW5mbzVz
by5jOjExMCkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvM19tYWluICh2YXJpbmZvNXNvLmM6
MTE4KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTYp
CisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAweC4u
Li4uLi4uIGlzIDAgYnl0ZXMgaW5zaWRlIG5vbnN0YXRpY19sb2NhbF91bmRlZls4XSwKKyAgZGVj
bGFyZWQgYXQgdmFyaW5mbzVzby5jOjEwNSwgaW4gZnJhbWUgI1ggb2YgdGhyZWFkIDEKKyAKKyBV
bmluaXRpYWxpc2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0Cist
ICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAw
eC4uLi4uLi4uOiBibGFoNCAodGVzdHMvdmFyaW5mbzVzby5jOjEzNykKKy0gICBieSAweC4uLi4u
Li4uOiB2YXJpbmZvNF9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTQ2KQorLSAgIGJ5IDB4Li4u
Li4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTcpCistICAgYnkgMHgu
Li4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNy
b2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogYmxhaDQgKHZhcmluZm81
c28uYzoxMzcpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzRfbWFpbiAodmFyaW5mbzVzby5j
OjE0NikKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU3
KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRpb24gMHgu
Li4uLi4uLiBpcyAxIGJ5dGUgaW5zaWRlIGFbM10ueHl6enlbMjFdLmMxLAorICBkZWNsYXJlZCBh
dCB2YXJpbmZvNXNvLmM6MTM1LCBpbiBmcmFtZSAjWCBvZiB0aHJlYWQgMQorIAorIFVuaW5pdGlh
bGlzZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAw
eC4uLi4uLi4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5IDB4Li4uLi4u
Li46IGJsYWg0ICh0ZXN0cy92YXJpbmZvNXNvLmM6MTM4KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZh
cmluZm80X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNDYpCistICAgYnkgMHguLi4uLi4uLjog
dmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NykKKy0gICBieSAweC4uLi4uLi4u
OiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHZh
cmluZm81c28uYzoyOSkKKysgICBieSAweC4uLi4uLi4uOiBibGFoNCAodmFyaW5mbzVzby5jOjEz
OCkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNF9tYWluICh2YXJpbmZvNXNvLmM6MTQ2KQor
KyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTcpCisrICAg
YnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAweC4uLi4uLi4u
IGlzIDAgYnl0ZXMgaW5zaWRlIGFbNV0uYm9uZywKKyAgZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5j
OjEzNSwgaW4gZnJhbWUgI1ggb2YgdGhyZWFkIDEKKyAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykg
Zm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3Jv
YWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiBibGFoNCAodGVz
dHMvdmFyaW5mbzVzby5jOjEzOSkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNF9tYWluICh0
ZXN0cy92YXJpbmZvNXNvLmM6MTQ2KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4g
KHRlc3RzL3ZhcmluZm81c28uYzoxNTcpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMv
dmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6Mjkp
CisrICAgYnkgMHguLi4uLi4uLjogYmxhaDQgKHZhcmluZm81c28uYzoxMzkpCisrICAgYnkgMHgu
Li4uLi4uLjogdmFyaW5mbzRfbWFpbiAodmFyaW5mbzVzby5jOjE0NikKKysgICBieSAweC4uLi4u
Li4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU3KQorKyAgIGJ5IDB4Li4uLi4uLi46
IG1haW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAxIGJ5dGUgaW5z
aWRlIGFbM10ueHl6enlbMjFdLmMyWzJdLAorICBkZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6MTM1
LCBpbiBmcmFtZSAjWCBvZiB0aHJlYWQgMQorIAorIGFuc3dlciBpcyAwCisgVW5pbml0aWFsaXNl
ZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4u
Li4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjog
ZnVuX2MgKHRlc3RzL3ZhcmluZm81c28uYzoxNjQpCistICAgYnkgMHguLi4uLi4uLjogZnVuX2Ig
KHRlc3RzL3ZhcmluZm81c28uYzoxNjgpCistICAgYnkgMHguLi4uLi4uLjogZnVuX2EgKHRlc3Rz
L3ZhcmluZm81c28uYzoxNzIpCistICAgYnkgMHguLi4uLi4uLjogaW5saW5ldGVzdCAodGVzdHMv
dmFyaW5mbzVzby5jOjE3OCkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0
cy92YXJpbmZvNXNvLmM6MTU4KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3RzL3Zhcmlu
Zm81LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5mbzVzby5jOjI5KQorKyAg
IGJ5IDB4Li4uLi4uLi46IGZ1bl9jICh2YXJpbmZvNXNvLmM6MTY0KQorKyAgIGJ5IDB4Li4uLi4u
Li46IGZ1bl9iICh2YXJpbmZvNXNvLmM6MTY4KQorKyAgIGJ5IDB4Li4uLi4uLi46IGZ1bl9hICh2
YXJpbmZvNXNvLmM6MTcyKQorKyAgIGJ5IDB4Li4uLi4uLi46IGlubGluZXRlc3QgKHZhcmluZm81
c28uYzoxNzgpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5j
OjE1OCkKKysgICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5jOjUpCisgIEFkZHJlc3Mg
MHguLi4uLi4uLiBpcyBvbiB0aHJlYWQgMSdzIHN0YWNrCisgIGluIGZyYW1lICNYLCBjcmVhdGVk
IGJ5IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTMpCisgCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmRfMy4yMS4wLmJiIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kXzMuMjIuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmRf
My4yMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3Jp
bmRfMy4yMi4wLmJiCmluZGV4IDcxN2Q4MjgzMGUuLjYyYTQ1M2RmZWYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZF8zLjIxLjAuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kXzMuMjIuMC5iYgpAQCAtMzYsOSAr
MzYsOSBAQCBTUkNfVVJJID0gImh0dHBzOi8vc291cmNld2FyZS5vcmcvcHViL3ZhbGdyaW5kL3Zh
bGdyaW5kLSR7UFZ9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1ub25lLXRlc3Rz
LWZkbGVha19jbXNnLnN0ZGVyci5leHAtYWRqdXN0LXRtcC1wYXRocy5wYXRjaCBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLW1lbWNoZWNrLXRlc3RzLUZpeC10aW1lcmZkLXN5c2NhbGwtdGVzdC5w
YXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWRvY3MtRGlzYWJsZS1tYW51YWwtdmFsaWRh
dGlvbi5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLW5vbmUtdGVzdHMteDg2LWxpbnV4
LXNlZ19vdmVycmlkZS5jLWFkZC1taXNzaW5nLWluY2wucGF0Y2ggXAorICAgICAgICAgICBmaWxl
Oi8vMDAyMC1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaCBcCiAgICAgICAg
ICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxMGNlMTYxOGJiM2UzM2ZhZDE2ZWI3OTU1MmIw
YTNlMTIxMTc2MjQ0OGEwZDdmY2UxMWM4YTYyNDNiOWFjOTcxIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImM4MTFkYjVhZGQyYzVmNzI5OTQ0Y2FmNDdjNGU3YTY1ZGNhYWJiOTQ2MWU0NzJiNTc4NzY1
ZGQ3YmY2ZDJkNGMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJ2YWxncmluZC0oP1A8cHZlcj5c
ZCsoXC5cZCspKylcLnRhciIKIAogQ09NUEFUSUJMRV9IT1NUID0gJyhpLjg2fHg4Nl82NHxhcm18
YWFyY2g2NHxtaXBzfHBvd2VycGN8cG93ZXJwYzY0KS4qLWxpbnV4JwotLSAKMi4zOS4yCgo=

--===============2576392915930474442==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-ab3646ba02a40fe9d1c7ed64af8895020d1a3048"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ab3646ba02a40fe9d1c7ed64af8895020d1a3048"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 115 Local 104 Mirrors 0 Missed 11 Current 826 (90% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1524 of 2601 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_recipe_qa)
NOTE: recipe valgrind-3.22.0-r0: task do_recipe_qa: Started
NOTE: recipe valgrind-3.22.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2394 of 2601 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_fetch)
NOTE: recipe valgrind-3.22.0-r0: task do_fetch: Started
NOTE: recipe valgrind-3.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2582 of 2601 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_unpack)
NOTE: Running task 2583 of 2601 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe valgrind-3.22.0-r0: task do_unpack: Started
NOTE: recipe valgrind-3.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe valgrind-3.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe valgrind-3.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2584 of 2601 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_patch)
NOTE: Running task 2585 of 2601 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_collect_spdx_deps)
NOTE: recipe valgrind-3.22.0-r0: task do_patch: Started
NOTE: recipe valgrind-3.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe valgrind-3.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe valgrind-3.22.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 2585 tasks of which 2579 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_patch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: valgrind-3.22.0-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/valgrind/valgrind/0020-Committing-changes-from-do_patch.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: valgrind-3.22.0-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/valgrind/3.22.0/temp/log.do_patch.421899
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_patch) failed with exit code '1'

--===============2576392915930474442==--

