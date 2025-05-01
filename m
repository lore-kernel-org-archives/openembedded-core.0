Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A90C3ABB6
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:33 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1775.1746113609540292983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OSL8jiPW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fsowKi1Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101968c7b3cbc-029b9a14-b275-4229-8b26-094e2fde1ecd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113609;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dhlj/fofg/O1ai+vhxPTsgVdFey39ptOFvhK6GTmIMs=;
	b=OSL8jiPWQ3vk2G/MO4B0GWc5hXFWBKeIaVSl4sGyM2RriVPdELuPaX4nOmxdcRzF
	0EY23ExBtkUpyh8GgvOO8CNbtXlEcJ61qBn7JQW9Nh5nEANwDxhyTFn1afzzjsFzjhi
	/VbnxH4yPWuW1gBIl0ZoV369AV2DgA5FYKTvdCVY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113609;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dhlj/fofg/O1ai+vhxPTsgVdFey39ptOFvhK6GTmIMs=;
	b=fsowKi1QuqPaO0YVpk3mTK5807UXfywSgU2KvRU6UqvMb0wdfGQnR/Ze4hIHwgfg
	JuBX+w7g/HsBDZgkISNdluQIjy9WRgBepjeLQOlfauQ1+6qNlBygYB5RuXh2QGLKVA8
	6HeP8UHYjMRXZe4rjnz5vxFdYjvfn6eJaysnlK+Q=
Content-Type: multipart/mixed; boundary="===============7823871386746540430=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdb-cross-canadian-x86-64,gdb-cross-x86_64,gdb: upgrading to
 16.3,16.3,16.3 FAILED
Message-ID: <010101968c7b3cbc-029b9a14-b275-4229-8b26-094e2fde1ecd-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215781

--===============7823871386746540430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gdb-cross-canadian-x86-64,gdb-cross-x86_64,gdb* to *16.3,16.3,16.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gdb-cross-canadian-x86-64-gdb-cross-x86_64-gdb-upgra.patch
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
From 7033f7516e3b7d63ce4145b7253c8698f2d2a2ce Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 05:51:40 +0000
Subject: [PATCH] gdb-cross-canadian-x86-64,gdb-cross-x86_64,gdb: upgrade 16.2
 -> 16.3,16.2 -> 16.3,16.2 -> 16.3

---
 ...s-canadian_16.2.bb => gdb-cross-canadian-x86-64_16.3.bb} | 1 +
 .../gdb/{gdb-cross_16.2.bb => gdb-cross-x86_64_16.3.bb}     | 1 +
 meta/recipes-devtools/gdb/gdb.inc                           | 2 +-
 .../0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch | 4 ++--
 ...c-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 6 +++---
 ...nt-disable-libreadline.a-when-using-disable-static.patch | 6 +++---
 meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch  | 4 ++--
 .../gdb/gdb/0005-Change-order-of-CFLAGS.patch               | 4 ++--
 .../gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch         | 4 ++--
 ...fine-alignof-using-_Alignof-when-using-C11-or-newe.patch | 4 ++--
 meta/recipes-devtools/gdb/{gdb_16.2.bb => gdb_16.3.bb}      | 0
 11 files changed, 19 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_16.2.bb => gdb-cross-canadian-x86-64_16.3.bb} (98%)
 rename meta/recipes-devtools/gdb/{gdb-cross_16.2.bb => gdb-cross-x86_64_16.3.bb} (97%)
 rename meta/recipes-devtools/gdb/{gdb_16.2.bb => gdb_16.3.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_16.2.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian-x86-64_16.3.bb
similarity index 98%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_16.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian-x86-64_16.3.bb
index 4ab2b7156d..c6d7ca941c 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_16.2.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian-x86-64_16.3.bb
@@ -1,3 +1,4 @@
 require gdb-common.inc
 require gdb-cross-canadian.inc
 require gdb.inc
+
diff --git a/meta/recipes-devtools/gdb/gdb-cross_16.2.bb b/meta/recipes-devtools/gdb/gdb-cross-x86_64_16.3.bb
similarity index 97%
rename from meta/recipes-devtools/gdb/gdb-cross_16.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross-x86_64_16.3.bb
index 3b654a2f0d..2048424ea1 100644
--- a/meta/recipes-devtools/gdb/gdb-cross_16.2.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-x86_64_16.3.bb
@@ -1,2 +1,3 @@
 require gdb-cross.inc
 require gdb.inc
+
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 1ac29b45f6..3c517a0090 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -13,4 +13,4 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0006-Fix-invalid-sigprocmask-call.patch \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            "
-SRC_URI[sha256sum] = "4002cb7f23f45c37c790536a13a720942ce4be0402d929c9085e92f10d480119"
+SRC_URI[sha256sum] = "bcfcd095528a987917acf9fff3f1672181694926cc18d609c99d0042c00224c5"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
index 5e313a08b2..50c9fc2fae 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
@@ -1,4 +1,4 @@
-From 31c6c42479e750aff3130e76bae2646c418cb548 Mon Sep 17 00:00:00 2001
+From 9daf76366c3489b8097f981688729cdd3c3b0bfc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
 Subject: [PATCH] mips-linux-nat: Define _ABIO32 if not defined
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 3d072ea935c..ca38caeacc2 100644
+index 3d072ea..ca38cae 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -40,6 +40,10 @@
diff --git a/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index 69d4d51af0..3b3a72c586 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -1,4 +1,4 @@
-From 8f350f9b7b3934bd492cad35e1b6e44d142313a4 Mon Sep 17 00:00:00 2001
+From 7095ecf0120781a8489af4fe56ba42b6b167902c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 18:32:14 -0700
 Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+)
 
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index b51e2278f4b..f1bc07df0e9 100644
+index 3efc1b9..635d074 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
@@ -30,7 +30,7 @@ index b51e2278f4b..f1bc07df0e9 100644
  
  /* This sometimes isn't defined.  */
 diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
-index bd3ac143660..1c8c0b3a98e 100644
+index 3ce978f..3853429 100644
 --- a/gdbserver/linux-ppc-low.cc
 +++ b/gdbserver/linux-ppc-low.cc
 @@ -22,7 +22,13 @@
diff --git a/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch
index 0f7f387866..eaf61515cf 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-using-disable-static.patch
@@ -1,4 +1,4 @@
-From c4102e4fd74804b053c437352ef92c64c8b1fdbf Mon Sep 17 00:00:00 2001
+From a19bca7c0f3934eeadc6c1367859131c5167bf8f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:25:03 -0700
 Subject: [PATCH] Dont disable libreadline.a when using --disable-static
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.def b/Makefile.def
-index 4896c5c692c..17e3256be7d 100644
+index 4896c5c..17e3256 100644
 --- a/Makefile.def
 +++ b/Makefile.def
 @@ -134,7 +134,8 @@ host_modules= { module= libiconv;
@@ -33,7 +33,7 @@ index 4896c5c692c..17e3256be7d 100644
  host_modules= { module= sim; };
  host_modules= { module= texinfo; no_install= true; };
 diff --git a/Makefile.in b/Makefile.in
-index f12c251f9c8..17ea24e8012 100644
+index f12c251..17ea24e 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -31593,7 +31593,7 @@ configure-readline:
diff --git a/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
index 6dee5037da..d4d575e5d2 100644
--- a/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
@@ -1,4 +1,4 @@
-From 91e294b399c8e3de2cbdd495309f31b6a218516d Mon Sep 17 00:00:00 2001
+From 8b4e18a97236ea3af8061cd005b525ce00f21a84 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <amccurdy@gmail.com>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
 Subject: [PATCH] use <asm/sgidefs.h>
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index ca38caeacc2..2f044ca508a 100644
+index ca38cae..2f044ca 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -30,7 +30,7 @@
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
index 6d5d3a7e4f..8d20bbb941 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
@@ -1,4 +1,4 @@
-From c151a90c6df7a8b31fe0a6c4d6d28aaff55ac25f Mon Sep 17 00:00:00 2001
+From 4d3d44bda801d3e5492829542e6cab49dc281f29 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:35:39 -0700
 Subject: [PATCH] Change order of CFLAGS
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
-index 6148ccf9121..3ad15573923 100644
+index 365dcf2..fc16218 100644
 --- a/gdbserver/Makefile.in
 +++ b/gdbserver/Makefile.in
 @@ -174,6 +174,7 @@ INTERNAL_CFLAGS = \
diff --git a/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch b/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch
index a256b8fc68..502a784eb2 100644
--- a/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch
@@ -1,4 +1,4 @@
-From f63dddf6b986642eeeefa27176d59780e1681ddd Mon Sep 17 00:00:00 2001
+From 59f40922cbd93e8e2e9b543cc2e2dc2966032ba5 Mon Sep 17 00:00:00 2001
 From: Yousong Zhou <yszhou4tech@gmail.com>
 Date: Fri, 24 Mar 2017 10:36:03 +0800
 Subject: [PATCH] Fix invalid sigprocmask call
@@ -32,7 +32,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdbsupport/signals-state-save-restore.cc b/gdbsupport/signals-state-save-restore.cc
-index 60724f95c87..8b493271aa6 100644
+index 60724f9..8b49327 100644
 --- a/gdbsupport/signals-state-save-restore.cc
 +++ b/gdbsupport/signals-state-save-restore.cc
 @@ -37,7 +37,7 @@ save_original_signals_state (bool quiet)
diff --git a/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
index dcc01e414c..2800f12f95 100644
--- a/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
@@ -1,4 +1,4 @@
-From f1b4a90ea61771840fcf4889f616b156b5157843 Mon Sep 17 00:00:00 2001
+From 2eac8c49dedac391c14160139173e81934004872 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Jan 2023 00:16:25 -0800
 Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
@@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/libiberty/sha1.c b/libiberty/sha1.c
-index 49e8e0b6c2b..72de5cc8ad6 100644
+index 49e8e0b..72de5cc 100644
 --- a/libiberty/sha1.c
 +++ b/libiberty/sha1.c
 @@ -234,7 +234,17 @@ sha1_process_bytes (const void *buffer, size_t len, struct sha1_ctx *ctx)
diff --git a/meta/recipes-devtools/gdb/gdb_16.2.bb b/meta/recipes-devtools/gdb/gdb_16.3.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_16.2.bb
rename to meta/recipes-devtools/gdb/gdb_16.3.bb
-- 
2.47.1


--===============7823871386746540430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1899 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (925 cached, 3 parsed). 1897 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9cf164b4f99965774cd03c919c44ac17a5125a8f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 440 Local 410 Mirrors 0 Missed 30 Current 599 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 850 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 866 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_create_spdx_setscene)
NOTE: Running setscene task 922 of 1039 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.2.13.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-native-4.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-native-8.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-native-0.192-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpfr-native-4.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-native-8.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe elfutils-native-0.192-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2069 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_recipe_qa)
NOTE: Running task 2070 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-canadian-x86-64_16.3.bb:do_recipe_qa)
NOTE: recipe gdb-16.3-r0: task do_recipe_qa: Started
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_recipe_qa: Started
NOTE: Running task 2284 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-x86_64_16.3.bb:do_recipe_qa)
NOTE: recipe gdb-cross-x86_64-64-r0: task do_recipe_qa: Started
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe gdb-16.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-canadian-x86-64_16.3.bb:do_recipe_qa unihash changed to cf6fde632da2620c591300a54436f8234f0fa3d76443046d27ebf888fe2f2b18
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_recipe_qa unihash changed to 9465b14bd53d6d5a1d199ae17217b8cd62fb4c1a13dc210cead1f06b201abe0d
NOTE: Setscene tasks completed
NOTE: Running task 2433 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_fetch)
NOTE: Running task 2434 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-canadian-x86-64_16.3.bb:do_fetch)
NOTE: recipe gdb-cross-x86_64-64-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2454 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-x86_64_16.3.bb:do_fetch)
NOTE: recipe gdb-16.3-r0: task do_fetch: Started
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_fetch: Started
NOTE: recipe gdb-cross-x86_64-64-r0: task do_fetch: Started
NOTE: recipe gdb-16.3-r0: task do_fetch: Succeeded
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_fetch: Succeeded
NOTE: Running task 2572 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_unpack)
NOTE: Running task 2573 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-canadian-x86-64_16.3.bb:do_unpack)
NOTE: Running task 2574 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2575 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-canadian-x86-64_16.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdb-16.3-r0: task do_unpack: Started
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_unpack: Started
NOTE: recipe gdb-16.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdb-16.3-r0: task do_prepare_recipe_sysroot: Succeeded
WARNING: gdb-cross-x86_64-64-r0 do_fetch: Failed to fetch URL https://ftp.gnu.org/gnu/gdb/gdb-64.tar.xz, attempting MIRRORS if available
NOTE: recipe gdb-16.3-r0: task do_unpack: Succeeded
NOTE: Running task 2703 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_patch)
NOTE: Running task 2704 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_collect_spdx_deps)
NOTE: recipe gdb-16.3-r0: task do_patch: Started
NOTE: recipe gdb-16.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdb-16.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gdb-16.3-r0: task do_patch: Succeeded
NOTE: Running task 2705 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2706 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_populate_lic)
NOTE: recipe gdb-16.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdb-16.3-r0: task do_populate_lic: Started
NOTE: recipe gdb-16.3-r0: task do_populate_lic: Succeeded
NOTE: recipe gdb-16.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_populate_lic unihash changed to 95dfa14f17973fd10d3b4593f8ff4bd22bc88c3e7b3bfed5858994b24206d9d8
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_deploy_source_date_epoch unihash changed to b0c80237a7352593b098c19d8363aea8afda9f17783ea0c8078b39e7d204342e
NOTE: Setscene tasks completed
NOTE: Running task 2707 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_configure)
NOTE: recipe gdb-16.3-r0: task do_configure: Started
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_unpack: Succeeded
NOTE: Running task 2708 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-canadian-x86-64_16.3.bb:do_patch)
NOTE: Running task 2709 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-canadian-x86-64_16.3.bb:do_collect_spdx_deps)
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_patch: Started
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_patch: Succeeded
NOTE: Running task 2710 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-canadian-x86-64_16.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2711 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-canadian-x86-64_16.3.bb:do_populate_lic)
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_populate_lic: Started
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-canadian-x86-64_16.3.bb:do_deploy_source_date_epoch unihash changed to bfac0539d4c6671ce984165a19916fe5e50f8d4c0ddde851e9eef63483a238f0
NOTE: Setscene tasks completed
NOTE: Running task 2712 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-canadian-x86-64_16.3.bb:do_configure)
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_configure: Started
NOTE: recipe gdb-16.3-r0: task do_configure: Succeeded
NOTE: Running task 2713 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb_16.3.bb:do_compile)
NOTE: recipe gdb-16.3-r0: task do_compile: Started
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_configure: Succeeded
NOTE: Running task 2714 of 2749 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-canadian-x86-64_16.3.bb:do_compile)
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_compile: Started
NOTE: recipe gdb-cross-x86_64-64-r0: task do_fetch: Failed
NOTE: recipe gdb-cross-canadian-x86-64-16.3-r0: task do_compile: Succeeded
NOTE: recipe gdb-16.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2714 tasks of which 2692 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501054957.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501054957.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-x86_64_16.3.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/64/temp/log.do_fetch.2340324
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gdb-cross-x86_64-64-r0 do_fetch: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export PATH="/srv/pokybuild/yocto-worker/auh/build/scripts/cross-intercept:/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/64/recipe-sysroot-native/usr/bin/python3-native:/srv/pokybuild/yocto-worker/auh/build/scripts:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/64/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/64/recipe-sysroot-native/srv/pokybuild/yocto-worker/auh/build/build/t
 mp/work/x86_64-linux/gdb-cross-x86_64/64/recipe-sysroot-native/usr/bin/x86_64-poky-linux/crossscripts:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/64/recipe-sysroot-native/usr/sbin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/64/recipe-sysroot-native/usr/bin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/64/recipe-sysroot-native/sbin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/64/recipe-sysroot-native/bin:/srv/pokybuild/yocto-worker/auh/build/bitbake/bin:/srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools"; export HOME="/srv/pokybuild"; /usr/bin/env wget --tries=2 --timeout=100 --output-document=/srv/pokybuild/yocto-worker/auh/build/build/downloads/gdb-64.tar.xz.tmp --continue --directory-prefix=/srv/pokybuild/yocto-worker/auh/build/build/downloads 'https://ftp.gnu.org/gnu/gdb/gdb-64.tar.xz' --progress=dot --verbose failed with 
 exit code 8, see logfile for output
ERROR: gdb-cross-x86_64-64-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://ftp.gnu.org/gnu/gdb/gdb-64.tar.xz')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/gdb-cross-x86_64/64/temp/log.do_fetch.2340324
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gdb/gdb-cross-x86_64_16.3.bb:do_fetch) failed with exit code '1'

--===============7823871386746540430==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gdb-cross-canadian-x86-64-gdb-cross-x86_64-gdb-upgra.patch"

RnJvbSA3MDMzZjc1MTZlM2I3ZDYzY2U0MTQ1YjcyNTNjODY5OGYyZDJhMmNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwNTo1MTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdk
Yi1jcm9zcy1jYW5hZGlhbi14ODYtNjQsZ2RiLWNyb3NzLXg4Nl82NCxnZGI6IHVwZ3JhZGUgMTYu
MgogLT4gMTYuMywxNi4yIC0+IDE2LjMsMTYuMiAtPiAxNi4zCgotLS0KIC4uLnMtY2FuYWRpYW5f
MTYuMi5iYiA9PiBnZGItY3Jvc3MtY2FuYWRpYW4teDg2LTY0XzE2LjMuYmJ9IHwgMSArCiAuLi4v
Z2RiL3tnZGItY3Jvc3NfMTYuMi5iYiA9PiBnZGItY3Jvc3MteDg2XzY0XzE2LjMuYmJ9ICAgICB8
IDEgKwogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGIuaW5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAyICstCiAuLi4vMDAwMS1taXBzLWxpbnV4LW5hdC1EZWZpbmUtX0FCSU8zMi1p
Zi1ub3QtZGVmaW5lZC5wYXRjaCB8IDQgKystLQogLi4uYy1wdHJhY2UtRGVmaW5lLXB0X3JlZ3Mt
dWFwaV9wdF9yZWdzLW9uLUdMSUJDLXN5c3QucGF0Y2ggfCA2ICsrKy0tLQogLi4ubnQtZGlzYWJs
ZS1saWJyZWFkbGluZS5hLXdoZW4tdXNpbmctZGlzYWJsZS1zdGF0aWMucGF0Y2ggfCA2ICsrKy0t
LQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGIvMDAwNC11c2UtYXNtLXNnaWRlZnMuaC5w
YXRjaCAgfCA0ICsrLS0KIC4uLi9nZGIvZ2RiLzAwMDUtQ2hhbmdlLW9yZGVyLW9mLUNGTEFHUy5w
YXRjaCAgICAgICAgICAgICAgIHwgNCArKy0tCiAuLi4vZ2RiL2dkYi8wMDA2LUZpeC1pbnZhbGlk
LXNpZ3Byb2NtYXNrLWNhbGwucGF0Y2ggICAgICAgICB8IDQgKystLQogLi4uZmluZS1hbGlnbm9m
LXVzaW5nLV9BbGlnbm9mLXdoZW4tdXNpbmctQzExLW9yLW5ld2UucGF0Y2ggfCA0ICsrLS0KIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9nZGIve2dkYl8xNi4yLmJiID0+IGdkYl8xNi4zLmJifSAgICAg
IHwgMAogMTEgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi97Z2RiLWNyb3NzLWNhbmFkaWFuXzE2
LjIuYmIgPT4gZ2RiLWNyb3NzLWNhbmFkaWFuLXg4Ni02NF8xNi4zLmJifSAoOTglKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIve2dkYi1jcm9zc18xNi4yLmJiID0+IGdkYi1jcm9z
cy14ODZfNjRfMTYuMy5iYn0gKDk3JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Ri
L3tnZGJfMTYuMi5iYiA9PiBnZGJfMTYuMy5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2dkYi9nZGItY3Jvc3MtY2FuYWRpYW5fMTYuMi5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9nZGIvZ2RiLWNyb3NzLWNhbmFkaWFuLXg4Ni02NF8xNi4zLmJiCnNpbWls
YXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2Ri
LWNyb3NzLWNhbmFkaWFuXzE2LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9n
ZGIvZ2RiLWNyb3NzLWNhbmFkaWFuLXg4Ni02NF8xNi4zLmJiCmluZGV4IDRhYjJiNzE1NmQuLmM2
ZDdjYTk0MWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLWNyb3Nz
LWNhbmFkaWFuXzE2LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGItY3Jv
c3MtY2FuYWRpYW4teDg2LTY0XzE2LjMuYmIKQEAgLTEsMyArMSw0IEBACiByZXF1aXJlIGdkYi1j
b21tb24uaW5jCiByZXF1aXJlIGdkYi1jcm9zcy1jYW5hZGlhbi5pbmMKIHJlcXVpcmUgZ2RiLmlu
YworCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi1jcm9zc18xNi4y
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGItY3Jvc3MteDg2XzY0XzE2LjMuYmIK
c2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dk
Yi9nZGItY3Jvc3NfMTYuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9n
ZGItY3Jvc3MteDg2XzY0XzE2LjMuYmIKaW5kZXggM2I2NTRhMmYwZC4uMjA0ODQyNGVhMSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGItY3Jvc3NfMTYuMi5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi1jcm9zcy14ODZfNjRfMTYuMy5iYgpAQCAt
MSwyICsxLDMgQEAKIHJlcXVpcmUgZ2RiLWNyb3NzLmluYwogcmVxdWlyZSBnZGIuaW5jCisKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLmluYyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9nZGIvZ2RiLmluYwppbmRleCAxYWMyOWI0NWY2Li4zYzUxN2EwMDkwIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi5pbmMKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2dkYi9nZGIuaW5jCkBAIC0xMyw0ICsxMyw0IEBAIFNSQ19VUkkgPSAiJHtH
TlVfTUlSUk9SfS9nZGIvZ2RiLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDA2
LUZpeC1pbnZhbGlkLXNpZ3Byb2NtYXNrLWNhbGwucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8v
MDAwNy1EZWZpbmUtYWxpZ25vZi11c2luZy1fQWxpZ25vZi13aGVuLXVzaW5nLUMxMS1vci1uZXdl
LnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQwMDJjYjdmMjNm
NDVjMzdjNzkwNTM2YTEzYTcyMDk0MmNlNGJlMDQwMmQ5MjljOTA4NWU5MmYxMGQ0ODAxMTkiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiYmNmY2QwOTU1MjhhOTg3OTE3YWNmOWZmZjNmMTY3MjE4MTY5
NDkyNmNjMThkNjA5Yzk5ZDAwNDJjMDAyMjRjNSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nZGIvZ2RiLzAwMDEtbWlwcy1saW51eC1uYXQtRGVmaW5lLV9BQklPMzItaWYtbm90
LWRlZmluZWQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi8wMDAxLW1pcHMt
bGludXgtbmF0LURlZmluZS1fQUJJTzMyLWlmLW5vdC1kZWZpbmVkLnBhdGNoCmluZGV4IDVlMzEz
YTA4YjIuLjUwYzlmYzJmYWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIv
Z2RiLzAwMDEtbWlwcy1saW51eC1uYXQtRGVmaW5lLV9BQklPMzItaWYtbm90LWRlZmluZWQucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGIvMDAwMS1taXBzLWxpbnV4LW5h
dC1EZWZpbmUtX0FCSU8zMi1pZi1ub3QtZGVmaW5lZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMzFjNmM0MjQ3OWU3NTBhZmYzMTMwZTc2YmFlMjY0NmM0MThjYjU0OCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gOWRhZjc2MzY2YzM0ODliODA5N2Y5ODE2ODg3MjljZGQzYzNiMGJm
YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiBEYXRlOiBXZWQsIDIzIE1hciAyMDE2IDA2OjMwOjA5ICswMDAwCiBTdWJqZWN0OiBb
UEFUQ0hdIG1pcHMtbGludXgtbmF0OiBEZWZpbmUgX0FCSU8zMiBpZiBub3QgZGVmaW5lZApAQCAt
MTYsNyArMTYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL2dkYi9t
aXBzLWxpbnV4LW5hdC5jIGIvZ2RiL21pcHMtbGludXgtbmF0LmMKLWluZGV4IDNkMDcyZWE5MzVj
Li5jYTM4Y2FlYWNjMiAxMDA2NDQKK2luZGV4IDNkMDcyZWEuLmNhMzhjYWUgMTAwNjQ0CiAtLS0g
YS9nZGIvbWlwcy1saW51eC1uYXQuYwogKysrIGIvZ2RiL21pcHMtbGludXgtbmF0LmMKIEBAIC00
MCw2ICs0MCwxMCBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGIv
MDAwMi1wcGMtcHRyYWNlLURlZmluZS1wdF9yZWdzLXVhcGlfcHRfcmVncy1vbi1HTElCQy1zeXN0
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGIvMDAwMi1wcGMtcHRyYWNlLURl
ZmluZS1wdF9yZWdzLXVhcGlfcHRfcmVncy1vbi1HTElCQy1zeXN0LnBhdGNoCmluZGV4IDY5ZDRk
NTFhZjAuLjNiM2E3MmM1ODYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIv
Z2RiLzAwMDItcHBjLXB0cmFjZS1EZWZpbmUtcHRfcmVncy11YXBpX3B0X3JlZ3Mtb24tR0xJQkMt
c3lzdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi8wMDAyLXBwYy1w
dHJhY2UtRGVmaW5lLXB0X3JlZ3MtdWFwaV9wdF9yZWdzLW9uLUdMSUJDLXN5c3QucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDhmMzUwZjliN2IzOTM0YmQ0OTJjYWQzNWUxYjZlNDRkMTQyMzEz
YTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDcwOTVlY2YwMTIwNzgxYTg0ODlhZjRm
ZTU2YmE0MmI2YjE2NzkwMmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogU2F0LCAzMCBBcHIgMjAxNiAxODozMjoxNCAt
MDcwMAogU3ViamVjdDogW1BBVENIXSBwcGMvcHRyYWNlOiBEZWZpbmUgcHRfcmVncyB1YXBpX3B0
X3JlZ3Mgb24gIUdMSUJDIHN5c3RlbXMKQEAgLTEyLDcgKzEyLDcgQEAgU2lnbmVkLW9mZi1ieTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL2dkYi9uYXQvcHBjLWxpbnV4LmggYi9nZGIvbmF0L3Bw
Yy1saW51eC5oCi1pbmRleCBiNTFlMjI3OGY0Yi4uZjFiYzA3ZGYwZTkgMTAwNjQ0CitpbmRleCAz
ZWZjMWI5Li42MzVkMDc0IDEwMDY0NAogLS0tIGEvZ2RiL25hdC9wcGMtbGludXguaAogKysrIGIv
Z2RiL25hdC9wcGMtbGludXguaAogQEAgLTE4LDcgKzE4LDEzIEBACkBAIC0zMCw3ICszMCw3IEBA
IGluZGV4IGI1MWUyMjc4ZjRiLi5mMWJjMDdkZjBlOSAxMDA2NDQKICAKICAvKiBUaGlzIHNvbWV0
aW1lcyBpc24ndCBkZWZpbmVkLiAgKi8KIGRpZmYgLS1naXQgYS9nZGJzZXJ2ZXIvbGludXgtcHBj
LWxvdy5jYyBiL2dkYnNlcnZlci9saW51eC1wcGMtbG93LmNjCi1pbmRleCBiZDNhYzE0MzY2MC4u
MWM4YzBiM2E5OGUgMTAwNjQ0CitpbmRleCAzY2U5NzhmLi4zODUzNDI5IDEwMDY0NAogLS0tIGEv
Z2Ric2VydmVyL2xpbnV4LXBwYy1sb3cuY2MKICsrKyBiL2dkYnNlcnZlci9saW51eC1wcGMtbG93
LmNjCiBAQCAtMjIsNyArMjIsMTMgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9nZGIvZ2RiLzAwMDMtRG9udC1kaXNhYmxlLWxpYnJlYWRsaW5lLmEtd2hlbi11c2luZy1kaXNh
YmxlLXN0YXRpYy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLzAwMDMtRG9u
dC1kaXNhYmxlLWxpYnJlYWRsaW5lLmEtd2hlbi11c2luZy1kaXNhYmxlLXN0YXRpYy5wYXRjaApp
bmRleCAwZjdmMzg3ODY2Li5lYWY2MTUxNWNmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2RiL2dkYi8wMDAzLURvbnQtZGlzYWJsZS1saWJyZWFkbGluZS5hLXdoZW4tdXNpbmct
ZGlzYWJsZS1zdGF0aWMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGIv
MDAwMy1Eb250LWRpc2FibGUtbGlicmVhZGxpbmUuYS13aGVuLXVzaW5nLWRpc2FibGUtc3RhdGlj
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjNDEwMmU0ZmQ3NDgwNGIwNTNjNDM3MzUyZWY5
MmM2NGM4YjFmZGJmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMTliY2E3YzBmMzkz
NGVlYWRjNmMxMzY3ODU5MTMxYzUxNjdiZjhmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMzAgQXByIDIwMTYg
MTU6MjU6MDMgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gRG9udCBkaXNhYmxlIGxpYnJlYWRsaW5l
LmEgd2hlbiB1c2luZyAtLWRpc2FibGUtc3RhdGljCkBAIC0xOSw3ICsxOSw3IEBAIFNpZ25lZC1v
ZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5k
ZWYgYi9NYWtlZmlsZS5kZWYKLWluZGV4IDQ4OTZjNWM2OTJjLi4xN2UzMjU2YmU3ZCAxMDA2NDQK
K2luZGV4IDQ4OTZjNWMuLjE3ZTMyNTYgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5kZWYKICsrKyBi
L01ha2VmaWxlLmRlZgogQEAgLTEzNCw3ICsxMzQsOCBAQCBob3N0X21vZHVsZXM9IHsgbW9kdWxl
PSBsaWJpY29udjsKQEAgLTMzLDcgKzMzLDcgQEAgaW5kZXggNDg5NmM1YzY5MmMuLjE3ZTMyNTZi
ZTdkIDEwMDY0NAogIGhvc3RfbW9kdWxlcz0geyBtb2R1bGU9IHNpbTsgfTsKICBob3N0X21vZHVs
ZXM9IHsgbW9kdWxlPSB0ZXhpbmZvOyBub19pbnN0YWxsPSB0cnVlOyB9OwogZGlmZiAtLWdpdCBh
L01ha2VmaWxlLmluIGIvTWFrZWZpbGUuaW4KLWluZGV4IGYxMmMyNTFmOWM4Li4xN2VhMjRlODAx
MiAxMDA2NDQKK2luZGV4IGYxMmMyNTEuLjE3ZWEyNGUgMTAwNjQ0CiAtLS0gYS9NYWtlZmlsZS5p
bgogKysrIGIvTWFrZWZpbGUuaW4KIEBAIC0zMTU5Myw3ICszMTU5Myw3IEBAIGNvbmZpZ3VyZS1y
ZWFkbGluZToKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLzAwMDQt
dXNlLWFzbS1zZ2lkZWZzLmgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi8w
MDA0LXVzZS1hc20tc2dpZGVmcy5oLnBhdGNoCmluZGV4IDZkZWU1MDM3ZGEuLmQ0ZDU3NWU1ZDIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLzAwMDQtdXNlLWFzbS1z
Z2lkZWZzLmgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGIvMDAwNC11
c2UtYXNtLXNnaWRlZnMuaC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTFlMjk0YjM5OWM4
ZTNkZTJjYmRkNDk1MzA5ZjMxYjZhMjE4NTE2ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gOGI0ZTE4YTk3MjM2ZWEzYWY4MDYxY2QwMDViNTI1Y2UwMGYyMWE4NCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEFuZHJlIE1jQ3VyZHkgPGFtY2N1cmR5QGdtYWlsLmNvbT4KIERh
dGU6IFNhdCwgMzAgQXByIDIwMTYgMTU6Mjk6MDYgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gdXNl
IDxhc20vc2dpZGVmcy5oPgpAQCAtMTksNyArMTksNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZ2RiL21pcHMtbGludXgtbmF0LmMgYi9nZGIv
bWlwcy1saW51eC1uYXQuYwotaW5kZXggY2EzOGNhZWFjYzIuLjJmMDQ0Y2E1MDhhIDEwMDY0NAor
aW5kZXggY2EzOGNhZS4uMmYwNDRjYSAxMDA2NDQKIC0tLSBhL2dkYi9taXBzLWxpbnV4LW5hdC5j
CiArKysgYi9nZGIvbWlwcy1saW51eC1uYXQuYwogQEAgLTMwLDcgKzMwLDcgQEAKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLzAwMDUtQ2hhbmdlLW9yZGVyLW9mLUNG
TEFHUy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLzAwMDUtQ2hhbmdlLW9y
ZGVyLW9mLUNGTEFHUy5wYXRjaAppbmRleCA2ZDVkM2E3ZTRmLi44ZDIwYmJiOTQxIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi8wMDA1LUNoYW5nZS1vcmRlci1vZi1D
RkxBR1MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGIvMDAwNS1DaGFu
Z2Utb3JkZXItb2YtQ0ZMQUdTLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMTUxYTkwYzZk
ZjdhOGIzMWZlMGE2YzRkNmQyOGFhZmY1NWFjMjVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA0ZDNkNDRiZGE4MDFkM2U1NDkyODI5NTQyZTZjYWI0OWRjMjgxZjI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6
IFNhdCwgMzAgQXByIDIwMTYgMTU6MzU6MzkgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gQ2hhbmdl
IG9yZGVyIG9mIENGTEFHUwpAQCAtMTMsNyArMTMsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQog
CiBkaWZmIC0tZ2l0IGEvZ2Ric2VydmVyL01ha2VmaWxlLmluIGIvZ2Ric2VydmVyL01ha2VmaWxl
LmluCi1pbmRleCA2MTQ4Y2NmOTEyMS4uM2FkMTU1NzM5MjMgMTAwNjQ0CitpbmRleCAzNjVkY2Yy
Li5mYzE2MjE4IDEwMDY0NAogLS0tIGEvZ2Ric2VydmVyL01ha2VmaWxlLmluCiArKysgYi9nZGJz
ZXJ2ZXIvTWFrZWZpbGUuaW4KIEBAIC0xNzQsNiArMTc0LDcgQEAgSU5URVJOQUxfQ0ZMQUdTID0g
XApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGIvMDAwNi1GaXgtaW52
YWxpZC1zaWdwcm9jbWFzay1jYWxsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9n
ZGIvMDAwNi1GaXgtaW52YWxpZC1zaWdwcm9jbWFzay1jYWxsLnBhdGNoCmluZGV4IGEyNTZiOGZj
NjguLjUwMmE3ODRlYjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2Ri
LzAwMDYtRml4LWludmFsaWQtc2lncHJvY21hc2stY2FsbC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ2RiL2dkYi8wMDA2LUZpeC1pbnZhbGlkLXNpZ3Byb2NtYXNrLWNhbGwucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY2M2RkZGY2Yjk4NjY0MmVlZWVmYTI3MTc2ZDU5Nzgw
ZTE2ODFkZGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU5ZjQwOTIyY2JkOTNlOGUy
ZTliNTQzY2MyZTJkYzI5NjYwMzJiYTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBZ
b3Vzb25nIFpob3UgPHlzemhvdTR0ZWNoQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMjQgTWFyIDIw
MTcgMTA6MzY6MDMgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IGludmFsaWQgc2lncHJvY21h
c2sgY2FsbApAQCAtMzIsNyArMzIsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogCiBkaWZmIC0tZ2l0IGEvZ2Ric3VwcG9ydC9zaWduYWxzLXN0YXRlLXNhdmUtcmVzdG9y
ZS5jYyBiL2dkYnN1cHBvcnQvc2lnbmFscy1zdGF0ZS1zYXZlLXJlc3RvcmUuY2MKLWluZGV4IDYw
NzI0Zjk1Yzg3Li44YjQ5MzI3MWFhNiAxMDA2NDQKK2luZGV4IDYwNzI0ZjkuLjhiNDkzMjcgMTAw
NjQ0CiAtLS0gYS9nZGJzdXBwb3J0L3NpZ25hbHMtc3RhdGUtc2F2ZS1yZXN0b3JlLmNjCiArKysg
Yi9nZGJzdXBwb3J0L3NpZ25hbHMtc3RhdGUtc2F2ZS1yZXN0b3JlLmNjCiBAQCAtMzcsNyArMzcs
NyBAQCBzYXZlX29yaWdpbmFsX3NpZ25hbHNfc3RhdGUgKGJvb2wgcXVpZXQpCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi8wMDA3LURlZmluZS1hbGlnbm9mLXVzaW5n
LV9BbGlnbm9mLXdoZW4tdXNpbmctQzExLW9yLW5ld2UucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2RiL2dkYi8wMDA3LURlZmluZS1hbGlnbm9mLXVzaW5nLV9BbGlnbm9mLXdoZW4tdXNp
bmctQzExLW9yLW5ld2UucGF0Y2gKaW5kZXggZGNjMDFlNDE0Yy4uMjgwMGYxMmY5NSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGIvMDAwNy1EZWZpbmUtYWxpZ25vZi11
c2luZy1fQWxpZ25vZi13aGVuLXVzaW5nLUMxMS1vci1uZXdlLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9nZGIvZ2RiLzAwMDctRGVmaW5lLWFsaWdub2YtdXNpbmctX0FsaWdub2Yt
d2hlbi11c2luZy1DMTEtb3ItbmV3ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjFiNGE5
MGVhNjE3NzE4NDBmY2Y0ODg5ZjYxNmIxNTZiNTE1Nzg0MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMmVhYzhjNDlkZWRhYzM5MWMxNDE2MDEzOTE3M2U4MTkzNDAwNDg3MiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBE
YXRlOiBTdW4sIDE1IEphbiAyMDIzIDAwOjE2OjI1IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIERl
ZmluZSBhbGlnbm9mIHVzaW5nIF9BbGlnbm9mIHdoZW4gdXNpbmcgQzExIG9yIG5ld2VyCkBAIC0y
NSw3ICsyNSw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+
CiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL2xpYmli
ZXJ0eS9zaGExLmMgYi9saWJpYmVydHkvc2hhMS5jCi1pbmRleCA0OWU4ZTBiNmMyYi4uNzJkZTVj
YzhhZDYgMTAwNjQ0CitpbmRleCA0OWU4ZTBiLi43MmRlNWNjIDEwMDY0NAogLS0tIGEvbGliaWJl
cnR5L3NoYTEuYwogKysrIGIvbGliaWJlcnR5L3NoYTEuYwogQEAgLTIzNCw3ICsyMzQsMTcgQEAg
c2hhMV9wcm9jZXNzX2J5dGVzIChjb25zdCB2b2lkICpidWZmZXIsIHNpemVfdCBsZW4sIHN0cnVj
dCBzaGExX2N0eCAqY3R4KQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9n
ZGJfMTYuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiXzE2LjMuYmIKc2ltaWxh
cml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2Ri
XzE2LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiXzE2LjMuYmIK
LS0gCjIuNDcuMQoK

--===============7823871386746540430==--

