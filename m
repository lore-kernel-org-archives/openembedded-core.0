Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F41CED27F
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:04 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12121.1763224723505291008
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=wB5FJcLR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=eH4ynlPB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019a8862610a-f4410a70-4c0e-4e4d-bb88-7d6d68ca5b73-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224740;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ezZYOzRgpEbMUpFlSgbPaLKmoVWqPFXjImcK1U8O/34=;
	b=wB5FJcLRXsgLrO4g6L9ItLBqwXTAaavjFvjQVT1XjXZy9thlnKNq85B3I/ly5Nhz
	ARNKOVEMy6xSYfRMcW7FTyaSuYZViDB8DuNAsn6W3PP/EG8te1JTJid8gHTcCQPZinA
	dt3CVoIqX7GQputYeiQKPgEmAes29dv/eF79nh9Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224740;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ezZYOzRgpEbMUpFlSgbPaLKmoVWqPFXjImcK1U8O/34=;
	b=eH4ynlPBxCyFZB92pgiFujgXXiZO5IjgWex3XhVkiWChNmegytZVcAnMQdGlpVgD
	EToo2ZMNa/PsKjRuIQyBP6xLYBjWG3QWE9ywqNa6Ahs0Gs8vLNgVEK0zUt1N6SlPyF6
	YPMymO/aBdjcgd5/Y0OUHPYKRFhwQsJGLbRJPjTo=
Content-Type: multipart/mixed; boundary="===============0179690318880044557=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] valgrind: upgrading to 3.26.0 SUCCEEDED
Message-ID: <0101019a8862610a-f4410a70-4c0e-4e4d-bb88-7d6d68ca5b73-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226396

--===============0179690318880044557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *valgrind* to *3.26.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-valgrind-upgrade-3.25.1-3.26.0.patch
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
From 2ec0d2379f5f2cc37166bdb8eae407db414d55d9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 12:14:15 +0000
Subject: [PATCH] valgrind: upgrade 3.25.1 -> 3.26.0

---
 ...tax-for-pushsection-directive-in-inl.patch |   31 -
 ...e-Drop-setting-mcpu-cortex-a8-on-arm.patch |    4 +-
 .../0001-docs-Disable-manual-validation.patch |    6 +-
 ...etting-mcpu-to-cortex-a8-on-arm-arch.patch |    6 +-
 ...check-tests-Fix-timerfd-syscall-test.patch |   10 +-
 ...-vgtests-remove-fullpath-after-flags.patch |    2 +-
 ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch |    2 +-
 ...ame-_sifields-to-__si_fields-on-musl.patch |    2 +-
 .../0001-tests-arm-Use-O-instead-of-O0.patch  |    2 +-
 ...-filter_xml_frames-do-not-filter-usr.patch |    2 +-
 ...-include-directive-path-for-config.h.patch |    2 +-
 ...t-for-PPC-instructions-mfatbu-mfatbl.patch |    8 +-
 ...n-for-targets-which-don-t-support-it.patch |    2 +-
 .../valgrind/valgrind/fixed-perl-path.patch   |    8 +-
 .../valgrind/valgrind/s390x_vec_op_t.patch    |    4 +-
 ...te-march-mcpu-mfpu-for-ARM-test-apps.patch |    2 +-
 ...-ld-XXX.so-strlen-intercept-optional.patch |    4 +-
 .../valgrind/valgrind_3.25.1.bb               |  116 --
 .../valgrind/valgrind_3.26.0.bb               | 1116 +++++++++++++++++
 19 files changed, 1149 insertions(+), 180 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind_3.25.1.bb
 create mode 100644 meta/recipes-devtools/valgrind/valgrind_3.26.0.bb

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch
deleted file mode 100644
index b59c544223..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 2089383a0e3a50f527337ea05188b3e302069888 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 14 May 2025 09:29:33 -0700
-Subject: [PATCH] Use portable syntax for pushsection directive in inline
- assembly
-
-'@' does not work with clang inline assembler, but '%' works with both
-gcc and clang. Therefore use '%' to make it more portable
-
-Fixes
-<inline asm>:1:41: error: expected '%<type>' or "<type>"
-
-Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=504222]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- coregrind/vg_preloaded.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
-index 5bec51d..e4c2dbc 100644
---- a/coregrind/vg_preloaded.c
-+++ b/coregrind/vg_preloaded.c
-@@ -55,7 +55,7 @@
- /* Note: The "MS" section flags are to remove duplicates.  */
- #define DEFINE_GDB_PY_SCRIPT(script_name) \
-   asm("\
--.pushsection \".debug_gdb_scripts\", \"MS\",@progbits,1\n\
-+.pushsection \".debug_gdb_scripts\", \"MS\",%progbits,1\n\
- .byte 1 /* Python */\n\
- .asciz \"" script_name "\"\n\
- .popsection \n\
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch b/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
index 3c8bec82b3..a400902943 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
@@ -1,4 +1,4 @@
-From 5a776e61af5ab7f0cfd10cde55c796189686916f Mon Sep 17 00:00:00 2001
+From cc20a717b582032c1032b22afe7efa7338aa840c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 10 May 2024 16:27:34 -0700
 Subject: [PATCH] configure: Drop setting mcpu=cortex-a8 on arm
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2dfbd1c..b42fdd4 100755
+index e30e4c1..a250680 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -251,13 +251,13 @@ case "${host_cpu}" in
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
index fbd799eeea..dabf6086f7 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
@@ -1,4 +1,4 @@
-From 4f674f458b1f0675abdc0ced01239e99bfa40de8 Mon Sep 17 00:00:00 2001
+From bda595942888921d30f8f7c17d4bcd807306310b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Jan 2022 18:26:02 -0800
 Subject: [PATCH] docs: Disable manual validation
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/docs/Makefile.am b/docs/Makefile.am
-index 68a3da5..9833d5c 100644
+index 7e5ed38..63a1aa7 100644
 --- a/docs/Makefile.am
 +++ b/docs/Makefile.am
-@@ -202,7 +202,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
+@@ -223,7 +223,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
  	  fi \
  	fi
  
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
index f8d1e87ba9..9c6e3c5fe0 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
@@ -1,4 +1,4 @@
-From c878aaacadf8ec723be882f9335cb33240df13d6 Mon Sep 17 00:00:00 2001
+From 5c30d8337849e958a2484ba4b207664cf4ff246c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Apr 2017 10:11:16 -0700
 Subject: [PATCH] makefiles: Drop setting -mcpu to cortex-a8 on arm
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/helgrind/tests/Makefile.am b/helgrind/tests/Makefile.am
-index 7adc5c6..cac23c9 100755
+index b8c5fd0..c55775a 100644
 --- a/helgrind/tests/Makefile.am
 +++ b/helgrind/tests/Makefile.am
-@@ -226,9 +226,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
+@@ -227,9 +227,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
  endif
  
  if VGCONF_PLATFORMS_INCLUDE_ARM_LINUX
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
index 200b2602cb..a91e26a476 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
@@ -1,4 +1,4 @@
-From 3a51ed107f67732910dec12279a9279e158afbe7 Mon Sep 17 00:00:00 2001
+From 630d9b8b012e4d2cbfcde3177aa324e19f73dd3f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 9 Mar 2020 16:30:19 -0700
 Subject: [PATCH] memcheck/tests: Fix timerfd syscall test
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 15 insertions(+), 3 deletions(-)
 
 diff --git a/config.h.in b/config.h.in
-index 00db1a6..23fd77a 100644
+index 0d4d170..f02b05a 100644
 --- a/config.h.in
 +++ b/config.h.in
-@@ -409,6 +409,9 @@
+@@ -421,6 +421,9 @@
  /* Define to 1 if you have the <sys/sysnvl.h> header file. */
  #undef HAVE_SYS_SYSNVL_H
  
@@ -30,10 +30,10 @@ index 00db1a6..23fd77a 100644
  #undef HAVE_SYS_TIME_H
  
 diff --git a/configure.ac b/configure.ac
-index b42fdd4..ec95146 100755
+index a250680..870f44d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4892,6 +4892,7 @@ AC_CHECK_HEADERS([       \
+@@ -4926,6 +4926,7 @@ AC_CHECK_HEADERS([       \
          sys/syscall.h    \
          sys/sysnvl.h     \
          sys/time.h       \
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
index 9a3596cac1..5a8afaff5b 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
@@ -1,4 +1,4 @@
-From b703b0d11adc9147a7d97817bd771ac40b8c4d39 Mon Sep 17 00:00:00 2001
+From 9821e407a836db5170544c157a919f4cb0a03f0c Mon Sep 17 00:00:00 2001
 From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
 Date: Wed, 16 Sep 2020 13:45:07 -0400
 Subject: [PATCH] memcheck vgtests remove fullpath-after flags
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
index 7deca99202..f9b31d499b 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
@@ -1,4 +1,4 @@
-From bbb5e8a6fc5eec178f8077ab006ab42c009528d4 Mon Sep 17 00:00:00 2001
+From 1a7b18a75a2988afcfc52e8325563914da6e2772 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 24 Jan 2020 17:55:39 +0100
 Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
index efa6c2c895..4c798e008c 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
@@ -1,4 +1,4 @@
-From c287382a1f3dd9f2db3df54dde54b4b266791bb9 Mon Sep 17 00:00:00 2001
+From 1276d1add05b4f428639c1bc043d7b5f9278e8be Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 00:46:39 -0700
 Subject: [PATCH] sigqueue: Rename _sifields to __si_fields on musl
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
index 3eea195579..f59069e12e 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
@@ -1,4 +1,4 @@
-From 8087ae8dcc46f3f81af58ed9b7176761b988ee61 Mon Sep 17 00:00:00 2001
+From 17d9d18a36875bf9b873ff6c4c90c8924ea565d4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 10 May 2024 17:44:47 -0700
 Subject: [PATCH] tests/arm: Use -O instead of -O0
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
index c64c2afd3f..56c90ed09f 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
@@ -1,4 +1,4 @@
-From f8fbebcf69e4a8bf2122b7c55f2ce372377af1bc Mon Sep 17 00:00:00 2001
+From 709e677d367ffac63441ea689b6c655a6bff44f0 Mon Sep 17 00:00:00 2001
 From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Mon, 13 May 2019 17:12:21 -0400
 Subject: [PATCH] valgrind: filter_xml_frames: do not filter /usr
diff --git a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
index 3acb5a28f4..526c362f4e 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
@@ -1,4 +1,4 @@
-From de4d7e478515b63f049b211266d9b946c15cc0b9 Mon Sep 17 00:00:00 2001
+From f9e8d5ae96f29340d44669cc28ff634f8fc0cac8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 01:03:17 -0700
 Subject: [PATCH] correct include directive path for config.h
diff --git a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
index 109caf76ab..37cac6b8e1 100644
--- a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
@@ -1,4 +1,4 @@
-From 85bff993087cd7367ffc35de525c2bf6162398d2 Mon Sep 17 00:00:00 2001
+From a49ccba2dc23eba51c77ce2f4b02d01b5959d730 Mon Sep 17 00:00:00 2001
 From: Aneesh Bansal <aneesh.bansal@freescale.com>
 Date: Mon, 21 Nov 2011 17:31:39 +0530
 Subject: [PATCH] Added support for PPC instructions mfatbu, mfatbl.
@@ -17,7 +17,7 @@ Signed-off-by: Aneesh Bansal <aneesh.bansal@freescale.com>
  3 files changed, 42 insertions(+)
 
 diff --git a/VEX/priv/guest_ppc_defs.h b/VEX/priv/guest_ppc_defs.h
-index 220fbf1..cd259f3 100644
+index f5571c4..7b80c96 100644
 --- a/VEX/priv/guest_ppc_defs.h
 +++ b/VEX/priv/guest_ppc_defs.h
 @@ -233,6 +233,8 @@ extern UInt ppc32g_dirtyhelper_MFSPR_268_269 ( UInt );
@@ -30,7 +30,7 @@ index 220fbf1..cd259f3 100644
                                       UInt vD_idx, UInt sh,
                                       UInt shift_right );
 diff --git a/VEX/priv/guest_ppc_helpers.c b/VEX/priv/guest_ppc_helpers.c
-index 2611e52..72c349b 100644
+index 106f57e..c3b08e4 100644
 --- a/VEX/priv/guest_ppc_helpers.c
 +++ b/VEX/priv/guest_ppc_helpers.c
 @@ -118,6 +118,24 @@ UInt ppc32g_dirtyhelper_MFSPR_287 ( void )
@@ -59,7 +59,7 @@ index 2611e52..72c349b 100644
  /* CALLED FROM GENERATED CODE */
  /* DIRTY HELPER (reads guest state, writes guest mem) */
 diff --git a/VEX/priv/guest_ppc_toIR.c b/VEX/priv/guest_ppc_toIR.c
-index 18716dd..b2e72a0 100644
+index 231e914..28708b0 100644
 --- a/VEX/priv/guest_ppc_toIR.c
 +++ b/VEX/priv/guest_ppc_toIR.c
 @@ -11875,6 +11875,28 @@ static Bool dis_proc_ctl ( const VexAbiInfo* vbi, UInt prefix, UInt theInstr )
diff --git a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
index 1597b3a021..c0a8330315 100644
--- a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
@@ -1,4 +1,4 @@
-From 596372bc9b4d31bc9811881cfa747d99a8c25141 Mon Sep 17 00:00:00 2001
+From 5b69bd90942cc54fdf2c32046c525ef5bf919799 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 19 Jan 2016 16:42:36 -0800
 Subject: [PATCH] avoid neon for targets which don't support it
diff --git a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
index 6bfc6035ed..c0daa9dfb3 100644
--- a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
@@ -1,4 +1,4 @@
-From 408f9b39ca4f5709b668f13829a94c4cae855006 Mon Sep 17 00:00:00 2001
+From b1ab759aed5ed7fd701dae5d63a20bac0dadaad3 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 31 Aug 2010 22:51:58 +0800
 Subject: [PATCH] valgrind: fix perl scripts
@@ -24,7 +24,7 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/massif/ms_print.in b/massif/ms_print.in
-index a206ce4..df1bc31 100755
+index ecd9f38..33139de 100644
 --- a/massif/ms_print.in
 +++ b/massif/ms_print.in
 @@ -1,4 +1,4 @@
@@ -34,7 +34,7 @@ index a206ce4..df1bc31 100755
  ##--------------------------------------------------------------------##
  ##--- Massif's results printer                         ms_print.in ---##
 diff --git a/perf/vg_perf.in b/perf/vg_perf.in
-index 90ee1d2..c585096 100644
+index cc27834..0e49550 100644
 --- a/perf/vg_perf.in
 +++ b/perf/vg_perf.in
 @@ -1,4 +1,4 @@
@@ -44,7 +44,7 @@ index 90ee1d2..c585096 100644
  ##--- Valgrind performance testing script                  vg_perf ---##
  ##--------------------------------------------------------------------##
 diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
-index 3471322..49e1114 100755
+index 0d7ec71..b44eb89 100644
 --- a/tests/vg_regtest.in
 +++ b/tests/vg_regtest.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
index 19690e5ebb..aebdfb36cd 100644
--- a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
@@ -1,4 +1,4 @@
-From 8c92089741d809cfd18354f1b4df18cd28398a20 Mon Sep 17 00:00:00 2001
+From 928896e26b588fe5193dd60d523c0e23fd902cca Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Wed, 17 Mar 2021 12:16:31 -0400
 Subject: [PATCH] remove s390x_vec_op_t
@@ -18,7 +18,7 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/VEX/priv/guest_s390_defs.h b/VEX/priv/guest_s390_defs.h
-index 29efa01..3a8f0a0 100644
+index a780e83..46609ac 100644
 --- a/VEX/priv/guest_s390_defs.h
 +++ b/VEX/priv/guest_s390_defs.h
 @@ -285,7 +285,7 @@ typedef enum {
diff --git a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
index 0c18a63c2b..71060cf15a 100644
--- a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
@@ -1,4 +1,4 @@
-From a5cd00f1c2d78e2a15f4a0c595f5ac10ca4c3290 Mon Sep 17 00:00:00 2001
+From bc0cad4a6482af3c12cbf353958df4b7fbc56f9d Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 19 Jan 2016 16:00:00 -0800
 Subject: [PATCH] use appropriate -march/-mcpu/-mfpu for ARM test apps
diff --git a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
index ca7f721d9c..f5f37357cd 100644
--- a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
@@ -1,4 +1,4 @@
-From b407514aa1a4fd3667b30527260e271da34ce4a7 Mon Sep 17 00:00:00 2001
+From 4daa544855761f523ae60e5b7c9bc8450306f8aa Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 13 Dec 2016 11:29:55 +0800
 Subject: [PATCH] make ld-XXX.so strlen intercept optional
@@ -17,7 +17,7 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/coregrind/m_redir.c b/coregrind/m_redir.c
-index 63172b9..1b5bf95 100644
+index e0f596f..4631564 100644
 --- a/coregrind/m_redir.c
 +++ b/coregrind/m_redir.c
 @@ -1321,7 +1321,18 @@ static void add_hardwired_spec (const  HChar* sopatt, const HChar* fnpatt,
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.25.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.25.1.bb
deleted file mode 100644
index a8b0be5767..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind_3.25.1.bb
+++ /dev/null
@@ -1,116 +0,0 @@
-SUMMARY = "Valgrind memory debugger and instrumentation framework"
-HOMEPAGE = "http://valgrind.org/"
-DESCRIPTION = "Valgrind is an instrumentation framework for building dynamic analysis tools. There are Valgrind tools that can automatically detect many memory management and threading bugs, and profile your programs in detail."
-BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://include/pub_tool_basics.h;beginline=6;endline=29;md5=41c410e8d3f305aee7aaa666b2e4f366 \
-                    file://include/valgrind.h;beginline=1;endline=56;md5=ad3b317f3286b6b704575d9efe6ca5df \
-                    file://COPYING.DOCS;md5=24ea4c7092233849b4394699333b5c56"
-
-SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
-           file://fixed-perl-path.patch \
-           file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
-           file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
-           file://avoid-neon-for-targets-which-don-t-support-it.patch \
-           file://0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch \
-           file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch \
-           file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch \
-           file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch \
-           file://0003-correct-include-directive-path-for-config.h.patch \
-           file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
-           file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch \
-           file://s390x_vec_op_t.patch \
-           file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
-           file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
-           file://0001-docs-Disable-manual-validation.patch \
-           file://0001-tests-arm-Use-O-instead-of-O0.patch \
-           file://0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch \
-           "
-SRC_URI[sha256sum] = "61deb8d0727b45c268efdc1b3b6c9e679cd97cbf5ee4b28d1dead7c8b7a271af"
-UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
-
-COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64|riscv64).*-linux'
-
-# valgrind supports armv7 and above
-COMPATIBLE_HOST:armv4 = 'null'
-COMPATIBLE_HOST:armv5 = 'null'
-COMPATIBLE_HOST:armv6 = 'null'
-
-# valgrind fails with powerpc soft-float
-COMPATIBLE_HOST:powerpc = "${@bb.utils.contains('TARGET_FPU', 'soft', 'null', '.*-linux', d)}"
-
-# X32 isn't supported by valgrind at this time
-COMPATIBLE_HOST:linux-gnux32 = 'null'
-COMPATIBLE_HOST:linux-muslx32 = 'null'
-
-# Disable for some MIPS variants
-COMPATIBLE_HOST:mipsarchr6 = 'null'
-COMPATIBLE_HOST:linux-gnun32 = 'null'
-
-# Disable for powerpc64 with musl
-COMPATIBLE_HOST:libc-musl:powerpc64 = 'null'
-
-inherit autotools-brokensep multilib_header
-
-EXTRA_OECONF = "--enable-tls --without-mpicc"
-EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS') != '32']}"
-
-# valgrind checks host_cpu "armv7*)", so we need to over-ride the autotools.bbclass default --host option
-EXTRA_OECONF:append:arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
-
-EXTRA_OEMAKE = "-w"
-
-CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
-
-# valgrind likes to control its own optimisation flags. It generally defaults
-# to -O2 but uses -O0 for some specific test apps etc. Passing our own flags
-# (via CFLAGS) means we interfere with that. Only pass DEBUG_FLAGS to it
-# which fixes build path issue in DWARF.
-SELECTED_OPTIMIZATION = "${DEBUG_LEVELFLAG}"
-
-# Split out various helper scripts to separate packages to avoid the
-# main package depending on perl and python.
-PACKAGES =+ "${PN}-cachegrind ${PN}-massif ${PN}-callgrind"
-
-FILES:${PN}-cachegrind = "${bindir}/cg_*"
-FILES:${PN}-massif = "${bindir}/ms_*"
-FILES:${PN}-callgrind = "${bindir}/callgrind_*"
-
-RDEPENDS:${PN}-cachegrind = "${PN} python3-core"
-RDEPENDS:${PN}-massif = "${PN} perl"
-RDEPENDS:${PN}-callgrind = "${PN} perl"
-
-do_configure:prepend () {
-    rm -rf ${S}/config.h
-}
-
-do_install:append () {
-    install -m 644 ${B}/default.supp ${D}/${libexecdir}/valgrind/
-    oe_multilib_header valgrind/config.h
-}
-
-VALGRINDARCH ?= "${TARGET_ARCH}"
-VALGRINDARCH:aarch64 = "arm64"
-VALGRINDARCH:x86-64 = "amd64"
-VALGRINDARCH:x86 = "x86"
-VALGRINDARCH:mips = "mips32"
-VALGRINDARCH:mipsel = "mips32"
-VALGRINDARCH:mips64el = "mips64"
-VALGRINDARCH:powerpc = "ppc"
-VALGRINDARCH:powerpc64 = "ppc64"
-VALGRINDARCH:powerpc64le = "ppc64le"
-
-INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libexecdir}/valgrind/vgpreload_memcheck-${VALGRINDARCH}-linux.so"
-
-# valgrind needs debug information for ld.so at runtime in order to
-# redirect functions like strlen.
-RRECOMMENDS:${PN} += "${TCLIBC}-dbg"
-
-# Valgrind needs intrinsics which are not provided by clang
-# m_signals.c:2213:7: error: __builtin_longjmp is not supported for the current target
-# 2213 |       VG_MINIMAL_LONGJMP(tst->sched_jmpbuf);
-#      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-#
-# It needs something like - https://bugs.kde.org/show_bug.cgi?id=369723
-TOOLCHAIN:riscv64 = "gcc"
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
new file mode 100644
index 0000000000..e12be59d39
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
@@ -0,0 +1,1116 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,281 +1,622 @@
+#                      GNU GENERAL PUBLIC LICENSE
+# -                       Version 2, June 1991
+# -
+# - Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+# - 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+# +                       Version 3, 29 June 2007
+# +
+# + Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+#                              Preamble
+#  
+# -  The licenses for most software are designed to take away your
+# -freedom to share and change it.  By contrast, the GNU General Public
+# -License is intended to guarantee your freedom to share and change free
+# -software--to make sure the software is free for all its users.  This
+# -General Public License applies to most of the Free Software
+# -Foundation's software and to any other program whose authors commit to
+# -using it.  (Some other Free Software Foundation software is covered by
+# -the GNU Lesser General Public License instead.)  You can apply it to
+# +  The GNU General Public License is a free, copyleft license for
+# +software and other kinds of works.
+# +
+# +  The licenses for most software and other practical works are designed
+# +to take away your freedom to share and change the works.  By contrast,
+# +the GNU General Public License is intended to guarantee your freedom to
+# +share and change all versions of a program--to make sure it remains free
+# +software for all its users.  We, the Free Software Foundation, use the
+# +GNU General Public License for most of our software; it applies also to
+# +any other work released this way by its authors.  You can apply it to
+#  your programs, too.
+#  
+#    When we speak of free software, we are referring to freedom, not
+#  price.  Our General Public Licenses are designed to make sure that you
+#  have the freedom to distribute copies of free software (and charge for
+# -this service if you wish), that you receive source code or can get it
+# -if you want it, that you can change the software or use pieces of it
+# -in new free programs; and that you know you can do these things.
+# -
+# -  To protect your rights, we need to make restrictions that forbid
+# -anyone to deny you these rights or to ask you to surrender the rights.
+# -These restrictions translate to certain responsibilities for you if you
+# -distribute copies of the software, or if you modify it.
+# +them if you wish), that you receive source code or can get it if you
+# +want it, that you can change the software or use pieces of it in new
+# +free programs, and that you know you can do these things.
+# +
+# +  To protect your rights, we need to prevent others from denying you
+# +these rights or asking you to surrender the rights.  Therefore, you have
+# +certain responsibilities if you distribute copies of the software, or if
+# +you modify it: responsibilities to respect the freedom of others.
+#  
+#    For example, if you distribute copies of such a program, whether
+# -gratis or for a fee, you must give the recipients all the rights that
+# -you have.  You must make sure that they, too, receive or can get the
+# -source code.  And you must show them these terms so they know their
+# -rights.
+# -
+# -  We protect your rights with two steps: (1) copyright the software, and
+# -(2) offer you this license which gives you legal permission to copy,
+# -distribute and/or modify the software.
+# -
+# -  Also, for each author's protection and ours, we want to make certain
+# -that everyone understands that there is no warranty for this free
+# -software.  If the software is modified by someone else and passed on, we
+# -want its recipients to know that what they have is not the original, so
+# -that any problems introduced by others will not reflect on the original
+# -authors' reputations.
+# -
+# -  Finally, any free program is threatened constantly by software
+# -patents.  We wish to avoid the danger that redistributors of a free
+# -program will individually obtain patent licenses, in effect making the
+# -program proprietary.  To prevent this, we have made it clear that any
+# -patent must be licensed for everyone's free use or not licensed at all.
+# +gratis or for a fee, you must pass on to the recipients the same
+# +freedoms that you received.  You must make sure that they, too, receive
+# +or can get the source code.  And you must show them these terms so they
+# +know their rights.
+# +
+# +  Developers that use the GNU GPL protect your rights with two steps:
+# +(1) assert copyright on the software, and (2) offer you this License
+# +giving you legal permission to copy, distribute and/or modify it.
+# +
+# +  For the developers' and authors' protection, the GPL clearly explains
+# +that there is no warranty for this free software.  For both users' and
+# +authors' sake, the GPL requires that modified versions be marked as
+# +changed, so that their problems will not be attributed erroneously to
+# +authors of previous versions.
+# +
+# +  Some devices are designed to deny users access to install or run
+# +modified versions of the software inside them, although the manufacturer
+# +can do so.  This is fundamentally incompatible with the aim of
+# +protecting users' freedom to change the software.  The systematic
+# +pattern of such abuse occurs in the area of products for individuals to
+# +use, which is precisely where it is most unacceptable.  Therefore, we
+# +have designed this version of the GPL to prohibit the practice for those
+# +products.  If such problems arise substantially in other domains, we
+# +stand ready to extend this provision to those domains in future versions
+# +of the GPL, as needed to protect the freedom of users.
+# +
+# +  Finally, every program is threatened constantly by software patents.
+# +States should not allow patents to restrict development and use of
+# +software on general-purpose computers, but in those that do, we wish to
+# +avoid the special danger that patents applied to a free program could
+# +make it effectively proprietary.  To prevent this, the GPL assures that
+# +patents cannot be used to render the program non-free.
+#  
+#    The precise terms and conditions for copying, distribution and
+#  modification follow.
+#  
+# -                    GNU GENERAL PUBLIC LICENSE
+# -   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
+# -
+# -  0. This License applies to any program or other work which contains
+# -a notice placed by the copyright holder saying it may be distributed
+# -under the terms of this General Public License.  The "Program", below,
+# -refers to any such program or work, and a "work based on the Program"
+# -means either the Program or any derivative work under copyright law:
+# -that is to say, a work containing the Program or a portion of it,
+# -either verbatim or with modifications and/or translated into another
+# -language.  (Hereinafter, translation is included without limitation in
+# -the term "modification".)  Each licensee is addressed as "you".
+# -
+# -Activities other than copying, distribution and modification are not
+# -covered by this License; they are outside its scope.  The act of
+# -running the Program is not restricted, and the output from the Program
+# -is covered only if its contents constitute a work based on the
+# -Program (independent of having been made by running the Program).
+# -Whether that is true depends on what the Program does.
+# -
+# -  1. You may copy and distribute verbatim copies of the Program's
+# -source code as you receive it, in any medium, provided that you
+# -conspicuously and appropriately publish on each copy an appropriate
+# -copyright notice and disclaimer of warranty; keep intact all the
+# -notices that refer to this License and to the absence of any warranty;
+# -and give any other recipients of the Program a copy of this License
+# -along with the Program.
+# -
+# -You may charge a fee for the physical act of transferring a copy, and
+# -you may at your option offer warranty protection in exchange for a fee.
+# -
+# -  2. You may modify your copy or copies of the Program or any portion
+# -of it, thus forming a work based on the Program, and copy and
+# -distribute such modifications or work under the terms of Section 1
+# -above, provided that you also meet all of these conditions:
+# -
+# -    a) You must cause the modified files to carry prominent notices
+# -    stating that you changed the files and the date of any change.
+# -
+# -    b) You must cause any work that you distribute or publish, that in
+# -    whole or in part contains or is derived from the Program or any
+# -    part thereof, to be licensed as a whole at no charge to all third
+# -    parties under the terms of this License.
+# -
+# -    c) If the modified program normally reads commands interactively
+# -    when run, you must cause it, when started running for such
+# -    interactive use in the most ordinary way, to print or display an
+# -    announcement including an appropriate copyright notice and a
+# -    notice that there is no warranty (or else, saying that you provide
+# -    a warranty) and that users may redistribute the program under
+# -    these conditions, and telling the user how to view a copy of this
+# -    License.  (Exception: if the Program itself is interactive but
+# -    does not normally print such an announcement, your work based on
+# -    the Program is not required to print an announcement.)
+# -
+# -These requirements apply to the modified work as a whole.  If
+# -identifiable sections of that work are not derived from the Program,
+# -and can be reasonably considered independent and separate works in
+# -themselves, then this License, and its terms, do not apply to those
+# -sections when you distribute them as separate works.  But when you
+# -distribute the same sections as part of a whole which is a work based
+# -on the Program, the distribution of the whole must be on the terms of
+# -this License, whose permissions for other licensees extend to the
+# -entire whole, and thus to each and every part regardless of who wrote it.
+# -
+# -Thus, it is not the intent of this section to claim rights or contest
+# -your rights to work written entirely by you; rather, the intent is to
+# -exercise the right to control the distribution of derivative or
+# -collective works based on the Program.
+# -
+# -In addition, mere aggregation of another work not based on the Program
+# -with the Program (or with a work based on the Program) on a volume of
+# -a storage or distribution medium does not bring the other work under
+# -the scope of this License.
+# -
+# -  3. You may copy and distribute the Program (or a work based on it,
+# -under Section 2) in object code or executable form under the terms of
+# -Sections 1 and 2 above provided that you also do one of the following:
+# -
+# -    a) Accompany it with the complete corresponding machine-readable
+# -    source code, which must be distributed under the terms of Sections
+# -    1 and 2 above on a medium customarily used for software interchange; or,
+# -
+# -    b) Accompany it with a written offer, valid for at least three
+# -    years, to give any third party, for a charge no more than your
+# -    cost of physically performing source distribution, a complete
+# -    machine-readable copy of the corresponding source code, to be
+# -    distributed under the terms of Sections 1 and 2 above on a medium
+# -    customarily used for software interchange; or,
+# -
+# -    c) Accompany it with the information you received as to the offer
+# -    to distribute corresponding source code.  (This alternative is
+# -    allowed only for noncommercial distribution and only if you
+# -    received the program in object code or executable form with such
+# -    an offer, in accord with Subsection b above.)
+# -
+# -The source code for a work means the preferred form of the work for
+# -making modifications to it.  For an executable work, complete source
+# -code means all the source code for all modules it contains, plus any
+# -associated interface definition files, plus the scripts used to
+# -control compilation and installation of the executable.  However, as a
+# -special exception, the source code distributed need not include
+# -anything that is normally distributed (in either source or binary
+# -form) with the major components (compiler, kernel, and so on) of the
+# -operating system on which the executable runs, unless that component
+# -itself accompanies the executable.
+# -
+# -If distribution of executable or object code is made by offering
+# -access to copy from a designated place, then offering equivalent
+# -access to copy the source code from the same place counts as
+# -distribution of the source code, even though third parties are not
+# -compelled to copy the source along with the object code.
+# -
+# -  4. You may not copy, modify, sublicense, or distribute the Program
+# -except as expressly provided under this License.  Any attempt
+# -otherwise to copy, modify, sublicense or distribute the Program is
+# -void, and will automatically terminate your rights under this License.
+# -However, parties who have received copies, or rights, from you under
+# -this License will not have their licenses terminated so long as such
+# -parties remain in full compliance.
+# -
+# -  5. You are not required to accept this License, since you have not
+# -signed it.  However, nothing else grants you permission to modify or
+# -distribute the Program or its derivative works.  These actions are
+# -prohibited by law if you do not accept this License.  Therefore, by
+# -modifying or distributing the Program (or any work based on the
+# -Program), you indicate your acceptance of this License to do so, and
+# -all its terms and conditions for copying, distributing or modifying
+# -the Program or works based on it.
+# -
+# -  6. Each time you redistribute the Program (or any work based on the
+# -Program), the recipient automatically receives a license from the
+# -original licensor to copy, distribute or modify the Program subject to
+# -these terms and conditions.  You may not impose any further
+# -restrictions on the recipients' exercise of the rights granted herein.
+# -You are not responsible for enforcing compliance by third parties to
+# +                       TERMS AND CONDITIONS
+# +
+# +  0. Definitions.
+# +
+# +  "This License" refers to version 3 of the GNU General Public License.
+# +
+# +  "Copyright" also means copyright-like laws that apply to other kinds of
+# +works, such as semiconductor masks.
+# +
+# +  "The Program" refers to any copyrightable work licensed under this
+# +License.  Each licensee is addressed as "you".  "Licensees" and
+# +"recipients" may be individuals or organizations.
+# +
+# +  To "modify" a work means to copy from or adapt all or part of the work
+# +in a fashion requiring copyright permission, other than the making of an
+# +exact copy.  The resulting work is called a "modified version" of the
+# +earlier work or a work "based on" the earlier work.
+# +
+# +  A "covered work" means either the unmodified Program or a work based
+# +on the Program.
+# +
+# +  To "propagate" a work means to do anything with it that, without
+# +permission, would make you directly or secondarily liable for
+# +infringement under applicable copyright law, except executing it on a
+# +computer or modifying a private copy.  Propagation includes copying,
+# +distribution (with or without modification), making available to the
+# +public, and in some countries other activities as well.
+# +
+# +  To "convey" a work means any kind of propagation that enables other
+# +parties to make or receive copies.  Mere interaction with a user through
+# +a computer network, with no transfer of a copy, is not conveying.
+# +
+# +  An interactive user interface displays "Appropriate Legal Notices"
+# +to the extent that it includes a convenient and prominently visible
+# +feature that (1) displays an appropriate copyright notice, and (2)
+# +tells the user that there is no warranty for the work (except to the
+# +extent that warranties are provided), that licensees may convey the
+# +work under this License, and how to view a copy of this License.  If
+# +the interface presents a list of user commands or options, such as a
+# +menu, a prominent item in the list meets this criterion.
+# +
+# +  1. Source Code.
+# +
+# +  The "source code" for a work means the preferred form of the work
+# +for making modifications to it.  "Object code" means any non-source
+# +form of a work.
+# +
+# +  A "Standard Interface" means an interface that either is an official
+# +standard defined by a recognized standards body, or, in the case of
+# +interfaces specified for a particular programming language, one that
+# +is widely used among developers working in that language.
+# +
+# +  The "System Libraries" of an executable work include anything, other
+# +than the work as a whole, that (a) is included in the normal form of
+# +packaging a Major Component, but which is not part of that Major
+# +Component, and (b) serves only to enable use of the work with that
+# +Major Component, or to implement a Standard Interface for which an
+# +implementation is available to the public in source code form.  A
+# +"Major Component", in this context, means a major essential component
+# +(kernel, window system, and so on) of the specific operating system
+# +(if any) on which the executable work runs, or a compiler used to
+# +produce the work, or an object code interpreter used to run it.
+# +
+# +  The "Corresponding Source" for a work in object code form means all
+# +the source code needed to generate, install, and (for an executable
+# +work) run the object code and to modify the work, including scripts to
+# +control those activities.  However, it does not include the work's
+# +System Libraries, or general-purpose tools or generally available free
+# +programs which are used unmodified in performing those activities but
+# +which are not part of the work.  For example, Corresponding Source
+# +includes interface definition files associated with source files for
+# +the work, and the source code for shared libraries and dynamically
+# +linked subprograms that the work is specifically designed to require,
+# +such as by intimate data communication or control flow between those
+# +subprograms and other parts of the work.
+# +
+# +  The Corresponding Source need not include anything that users
+# +can regenerate automatically from other parts of the Corresponding
+# +Source.
+# +
+# +  The Corresponding Source for a work in source code form is that
+# +same work.
+# +
+# +  2. Basic Permissions.
+# +
+# +  All rights granted under this License are granted for the term of
+# +copyright on the Program, and are irrevocable provided the stated
+# +conditions are met.  This License explicitly affirms your unlimited
+# +permission to run the unmodified Program.  The output from running a
+# +covered work is covered by this License only if the output, given its
+# +content, constitutes a covered work.  This License acknowledges your
+# +rights of fair use or other equivalent, as provided by copyright law.
+# +
+# +  You may make, run and propagate covered works that you do not
+# +convey, without conditions so long as your license otherwise remains
+# +in force.  You may convey covered works to others for the sole purpose
+# +of having them make modifications exclusively for you, or provide you
+# +with facilities for running those works, provided that you comply with
+# +the terms of this License in conveying all material for which you do
+# +not control copyright.  Those thus making or running the covered works
+# +for you must do so exclusively on your behalf, under your direction
+# +and control, on terms that prohibit them from making any copies of
+# +your copyrighted material outside their relationship with you.
+# +
+# +  Conveying under any other circumstances is permitted solely under
+# +the conditions stated below.  Sublicensing is not allowed; section 10
+# +makes it unnecessary.
+# +
+# +  3. Protecting Users' Legal Rights From Anti-Circumvention Law.
+# +
+# +  No covered work shall be deemed part of an effective technological
+# +measure under any applicable law fulfilling obligations under article
+# +11 of the WIPO copyright treaty adopted on 20 December 1996, or
+# +similar laws prohibiting or restricting circumvention of such
+# +measures.
+# +
+# +  When you convey a covered work, you waive any legal power to forbid
+# +circumvention of technological measures to the extent such circumvention
+# +is effected by exercising rights under this License with respect to
+# +the covered work, and you disclaim any intention to limit operation or
+# +modification of the work as a means of enforcing, against the work's
+# +users, your or third parties' legal rights to forbid circumvention of
+# +technological measures.
+# +
+# +  4. Conveying Verbatim Copies.
+# +
+# +  You may convey verbatim copies of the Program's source code as you
+# +receive it, in any medium, provided that you conspicuously and
+# +appropriately publish on each copy an appropriate copyright notice;
+# +keep intact all notices stating that this License and any
+# +non-permissive terms added in accord with section 7 apply to the code;
+# +keep intact all notices of the absence of any warranty; and give all
+# +recipients a copy of this License along with the Program.
+# +
+# +  You may charge any price or no price for each copy that you convey,
+# +and you may offer support or warranty protection for a fee.
+# +
+# +  5. Conveying Modified Source Versions.
+# +
+# +  You may convey a work based on the Program, or the modifications to
+# +produce it from the Program, in the form of source code under the
+# +terms of section 4, provided that you also meet all of these conditions:
+# +
+# +    a) The work must carry prominent notices stating that you modified
+# +    it, and giving a relevant date.
+# +
+# +    b) The work must carry prominent notices stating that it is
+# +    released under this License and any conditions added under section
+# +    7.  This requirement modifies the requirement in section 4 to
+# +    "keep intact all notices".
+# +
+# +    c) You must license the entire work, as a whole, under this
+# +    License to anyone who comes into possession of a copy.  This
+# +    License will therefore apply, along with any applicable section 7
+# +    additional terms, to the whole of the work, and all its parts,
+# +    regardless of how they are packaged.  This License gives no
+# +    permission to license the work in any other way, but it does not
+# +    invalidate such permission if you have separately received it.
+# +
+# +    d) If the work has interactive user interfaces, each must display
+# +    Appropriate Legal Notices; however, if the Program has interactive
+# +    interfaces that do not display Appropriate Legal Notices, your
+# +    work need not make them do so.
+# +
+# +  A compilation of a covered work with other separate and independent
+# +works, which are not by their nature extensions of the covered work,
+# +and which are not combined with it such as to form a larger program,
+# +in or on a volume of a storage or distribution medium, is called an
+# +"aggregate" if the compilation and its resulting copyright are not
+# +used to limit the access or legal rights of the compilation's users
+# +beyond what the individual works permit.  Inclusion of a covered work
+# +in an aggregate does not cause this License to apply to the other
+# +parts of the aggregate.
+# +
+# +  6. Conveying Non-Source Forms.
+# +
+# +  You may convey a covered work in object code form under the terms
+# +of sections 4 and 5, provided that you also convey the
+# +machine-readable Corresponding Source under the terms of this License,
+# +in one of these ways:
+# +
+# +    a) Convey the object code in, or embodied in, a physical product
+# +    (including a physical distribution medium), accompanied by the
+# +    Corresponding Source fixed on a durable physical medium
+# +    customarily used for software interchange.
+# +
+# +    b) Convey the object code in, or embodied in, a physical product
+# +    (including a physical distribution medium), accompanied by a
+# +    written offer, valid for at least three years and valid for as
+# +    long as you offer spare parts or customer support for that product
+# +    model, to give anyone who possesses the object code either (1) a
+# +    copy of the Corresponding Source for all the software in the
+# +    product that is covered by this License, on a durable physical
+# +    medium customarily used for software interchange, for a price no
+# +    more than your reasonable cost of physically performing this
+# +    conveying of source, or (2) access to copy the
+# +    Corresponding Source from a network server at no charge.
+# +
+# +    c) Convey individual copies of the object code with a copy of the
+# +    written offer to provide the Corresponding Source.  This
+# +    alternative is allowed only occasionally and noncommercially, and
+# +    only if you received the object code with such an offer, in accord
+# +    with subsection 6b.
+# +
+# +    d) Convey the object code by offering access from a designated
+# +    place (gratis or for a charge), and offer equivalent access to the
+# +    Corresponding Source in the same way through the same place at no
+# +    further charge.  You need not require recipients to copy the
+# +    Corresponding Source along with the object code.  If the place to
+# +    copy the object code is a network server, the Corresponding Source
+# +    may be on a different server (operated by you or a third party)
+# +    that supports equivalent copying facilities, provided you maintain
+# +    clear directions next to the object code saying where to find the
+# +    Corresponding Source.  Regardless of what server hosts the
+# +    Corresponding Source, you remain obligated to ensure that it is
+# +    available for as long as needed to satisfy these requirements.
+# +
+# +    e) Convey the object code using peer-to-peer transmission, provided
+# +    you inform other peers where the object code and Corresponding
+# +    Source of the work are being offered to the general public at no
+# +    charge under subsection 6d.
+# +
+# +  A separable portion of the object code, whose source code is excluded
+# +from the Corresponding Source as a System Library, need not be
+# +included in conveying the object code work.
+# +
+# +  A "User Product" is either (1) a "consumer product", which means any
+# +tangible personal property which is normally used for personal, family,
+# +or household purposes, or (2) anything designed or sold for incorporation
+# +into a dwelling.  In determining whether a product is a consumer product,
+# +doubtful cases shall be resolved in favor of coverage.  For a particular
+# +product received by a particular user, "normally used" refers to a
+# +typical or common use of that class of product, regardless of the status
+# +of the particular user or of the way in which the particular user
+# +actually uses, or expects or is expected to use, the product.  A product
+# +is a consumer product regardless of whether the product has substantial
+# +commercial, industrial or non-consumer uses, unless such uses represent
+# +the only significant mode of use of the product.
+# +
+# +  "Installation Information" for a User Product means any methods,
+# +procedures, authorization keys, or other information required to install
+# +and execute modified versions of a covered work in that User Product from
+# +a modified version of its Corresponding Source.  The information must
+# +suffice to ensure that the continued functioning of the modified object
+# +code is in no case prevented or interfered with solely because
+# +modification has been made.
+# +
+# +  If you convey an object code work under this section in, or with, or
+# +specifically for use in, a User Product, and the conveying occurs as
+# +part of a transaction in which the right of possession and use of the
+# +User Product is transferred to the recipient in perpetuity or for a
+# +fixed term (regardless of how the transaction is characterized), the
+# +Corresponding Source conveyed under this section must be accompanied
+# +by the Installation Information.  But this requirement does not apply
+# +if neither you nor any third party retains the ability to install
+# +modified object code on the User Product (for example, the work has
+# +been installed in ROM).
+# +
+# +  The requirement to provide Installation Information does not include a
+# +requirement to continue to provide support service, warranty, or updates
+# +for a work that has been modified or installed by the recipient, or for
+# +the User Product in which it has been modified or installed.  Access to a
+# +network may be denied when the modification itself materially and
+# +adversely affects the operation of the network or violates the rules and
+# +protocols for communication across the network.
+# +
+# +  Corresponding Source conveyed, and Installation Information provided,
+# +in accord with this section must be in a format that is publicly
+# +documented (and with an implementation available to the public in
+# +source code form), and must require no special password or key for
+# +unpacking, reading or copying.
+# +
+# +  7. Additional Terms.
+# +
+# +  "Additional permissions" are terms that supplement the terms of this
+# +License by making exceptions from one or more of its conditions.
+# +Additional permissions that are applicable to the entire Program shall
+# +be treated as though they were included in this License, to the extent
+# +that they are valid under applicable law.  If additional permissions
+# +apply only to part of the Program, that part may be used separately
+# +under those permissions, but the entire Program remains governed by
+# +this License without regard to the additional permissions.
+# +
+# +  When you convey a copy of a covered work, you may at your option
+# +remove any additional permissions from that copy, or from any part of
+# +it.  (Additional permissions may be written to require their own
+# +removal in certain cases when you modify the work.)  You may place
+# +additional permissions on material, added by you to a covered work,
+# +for which you have or can give appropriate copyright permission.
+# +
+# +  Notwithstanding any other provision of this License, for material you
+# +add to a covered work, you may (if authorized by the copyright holders of
+# +that material) supplement the terms of this License with terms:
+# +
+# +    a) Disclaiming warranty or limiting liability differently from the
+# +    terms of sections 15 and 16 of this License; or
+# +
+# +    b) Requiring preservation of specified reasonable legal notices or
+# +    author attributions in that material or in the Appropriate Legal
+# +    Notices displayed by works containing it; or
+# +
+# +    c) Prohibiting misrepresentation of the origin of that material, or
+# +    requiring that modified versions of such material be marked in
+# +    reasonable ways as different from the original version; or
+# +
+# +    d) Limiting the use for publicity purposes of names of licensors or
+# +    authors of the material; or
+# +
+# +    e) Declining to grant rights under trademark law for use of some
+# +    trade names, trademarks, or service marks; or
+# +
+# +    f) Requiring indemnification of licensors and authors of that
+# +    material by anyone who conveys the material (or modified versions of
+# +    it) with contractual assumptions of liability to the recipient, for
+# +    any liability that these contractual assumptions directly impose on
+# +    those licensors and authors.
+# +
+# +  All other non-permissive additional terms are considered "further
+# +restrictions" within the meaning of section 10.  If the Program as you
+# +received it, or any part of it, contains a notice stating that it is
+# +governed by this License along with a term that is a further
+# +restriction, you may remove that term.  If a license document contains
+# +a further restriction but permits relicensing or conveying under this
+# +License, you may add to a covered work material governed by the terms
+# +of that license document, provided that the further restriction does
+# +not survive such relicensing or conveying.
+# +
+# +  If you add terms to a covered work in accord with this section, you
+# +must place, in the relevant source files, a statement of the
+# +additional terms that apply to those files, or a notice indicating
+# +where to find the applicable terms.
+# +
+# +  Additional terms, permissive or non-permissive, may be stated in the
+# +form of a separately written license, or stated as exceptions;
+# +the above requirements apply either way.
+# +
+# +  8. Termination.
+# +
+# +  You may not propagate or modify a covered work except as expressly
+# +provided under this License.  Any attempt otherwise to propagate or
+# +modify it is void, and will automatically terminate your rights under
+# +this License (including any patent licenses granted under the third
+# +paragraph of section 11).
+# +
+# +  However, if you cease all violation of this License, then your
+# +license from a particular copyright holder is reinstated (a)
+# +provisionally, unless and until the copyright holder explicitly and
+# +finally terminates your license, and (b) permanently, if the copyright
+# +holder fails to notify you of the violation by some reasonable means
+# +prior to 60 days after the cessation.
+# +
+# +  Moreover, your license from a particular copyright holder is
+# +reinstated permanently if the copyright holder notifies you of the
+# +violation by some reasonable means, this is the first time you have
+# +received notice of violation of this License (for any work) from that
+# +copyright holder, and you cure the violation prior to 30 days after
+# +your receipt of the notice.
+# +
+# +  Termination of your rights under this section does not terminate the
+# +licenses of parties who have received copies or rights from you under
+# +this License.  If your rights have been terminated and not permanently
+# +reinstated, you do not qualify to receive new licenses for the same
+# +material under section 10.
+# +
+# +  9. Acceptance Not Required for Having Copies.
+# +
+# +  You are not required to accept this License in order to receive or
+# +run a copy of the Program.  Ancillary propagation of a covered work
+# +occurring solely as a consequence of using peer-to-peer transmission
+# +to receive a copy likewise does not require acceptance.  However,
+# +nothing other than this License grants you permission to propagate or
+# +modify any covered work.  These actions infringe copyright if you do
+# +not accept this License.  Therefore, by modifying or propagating a
+# +covered work, you indicate your acceptance of this License to do so.
+# +
+# +  10. Automatic Licensing of Downstream Recipients.
+# +
+# +  Each time you convey a covered work, the recipient automatically
+# +receives a license from the original licensors, to run, modify and
+# +propagate that work, subject to this License.  You are not responsible
+# +for enforcing compliance by third parties with this License.
+# +
+# +  An "entity transaction" is a transaction transferring control of an
+# +organization, or substantially all assets of one, or subdividing an
+# +organization, or merging organizations.  If propagation of a covered
+# +work results from an entity transaction, each party to that
+# +transaction who receives a copy of the work also receives whatever
+# +licenses to the work the party's predecessor in interest had or could
+# +give under the previous paragraph, plus a right to possession of the
+# +Corresponding Source of the work from the predecessor in interest, if
+# +the predecessor has it or can get it with reasonable efforts.
+# +
+# +  You may not impose any further restrictions on the exercise of the
+# +rights granted or affirmed under this License.  For example, you may
+# +not impose a license fee, royalty, or other charge for exercise of
+# +rights granted under this License, and you may not initiate litigation
+# +(including a cross-claim or counterclaim in a lawsuit) alleging that
+# +any patent claim is infringed by making, using, selling, offering for
+# +sale, or importing the Program or any portion of it.
+# +
+# +  11. Patents.
+# +
+# +  A "contributor" is a copyright holder who authorizes use under this
+# +License of the Program or a work on which the Program is based.  The
+# +work thus licensed is called the contributor's "contributor version".
+# +
+# +  A contributor's "essential patent claims" are all patent claims
+# +owned or controlled by the contributor, whether already acquired or
+# +hereafter acquired, that would be infringed by some manner, permitted
+# +by this License, of making, using, or selling its contributor version,
+# +but do not include claims that would be infringed only as a
+# +consequence of further modification of the contributor version.  For
+# +purposes of this definition, "control" includes the right to grant
+# +patent sublicenses in a manner consistent with the requirements of
+#  this License.
+#  
+# -  7. If, as a consequence of a court judgment or allegation of patent
+# -infringement or for any other reason (not limited to patent issues),
+# -conditions are imposed on you (whether by court order, agreement or
+# +  Each contributor grants you a non-exclusive, worldwide, royalty-free
+# +patent license under the contributor's essential patent claims, to
+# +make, use, sell, offer for sale, import and otherwise run, modify and
+# +propagate the contents of its contributor version.
+# +
+# +  In the following three paragraphs, a "patent license" is any express
+# +agreement or commitment, however denominated, not to enforce a patent
+# +(such as an express permission to practice a patent or covenant not to
+# +sue for patent infringement).  To "grant" such a patent license to a
+# +party means to make such an agreement or commitment not to enforce a
+# +patent against the party.
+# +
+# +  If you convey a covered work, knowingly relying on a patent license,
+# +and the Corresponding Source of the work is not available for anyone
+# +to copy, free of charge and under the terms of this License, through a
+# +publicly available network server or other readily accessible means,
+# +then you must either (1) cause the Corresponding Source to be so
+# +available, or (2) arrange to deprive yourself of the benefit of the
+# +patent license for this particular work, or (3) arrange, in a manner
+# +consistent with the requirements of this License, to extend the patent
+# +license to downstream recipients.  "Knowingly relying" means you have
+# +actual knowledge that, but for the patent license, your conveying the
+# +covered work in a country, or your recipient's use of the covered work
+# +in a country, would infringe one or more identifiable patents in that
+# +country that you have reason to believe are valid.
+# +
+# +  If, pursuant to or in connection with a single transaction or
+# +arrangement, you convey, or propagate by procuring conveyance of, a
+# +covered work, and grant a patent license to some of the parties
+# +receiving the covered work authorizing them to use, propagate, modify
+# +or convey a specific copy of the covered work, then the patent license
+# +you grant is automatically extended to all recipients of the covered
+# +work and works based on it.
+# +
+# +  A patent license is "discriminatory" if it does not include within
+# +the scope of its coverage, prohibits the exercise of, or is
+# +conditioned on the non-exercise of one or more of the rights that are
+# +specifically granted under this License.  You may not convey a covered
+# +work if you are a party to an arrangement with a third party that is
+# +in the business of distributing software, under which you make payment
+# +to the third party based on the extent of your activity of conveying
+# +the work, and under which the third party grants, to any of the
+# +parties who would receive the covered work from you, a discriminatory
+# +patent license (a) in connection with copies of the covered work
+# +conveyed by you (or copies made from those copies), or (b) primarily
+# +for and in connection with specific products or compilations that
+# +contain the covered work, unless you entered into that arrangement,
+# +or that patent license was granted, prior to 28 March 2007.
+# +
+# +  Nothing in this License shall be construed as excluding or limiting
+# +any implied license or other defenses to infringement that may
+# +otherwise be available to you under applicable patent law.
+# +
+# +  12. No Surrender of Others' Freedom.
+# +
+# +  If conditions are imposed on you (whether by court order, agreement or
+#  otherwise) that contradict the conditions of this License, they do not
+# -excuse you from the conditions of this License.  If you cannot
+# -distribute so as to satisfy simultaneously your obligations under this
+# -License and any other pertinent obligations, then as a consequence you
+# -may not distribute the Program at all.  For example, if a patent
+# -license would not permit royalty-free redistribution of the Program by
+# -all those who receive copies directly or indirectly through you, then
+# -the only way you could satisfy both it and this License would be to
+# -refrain entirely from distribution of the Program.
+# -
+# -If any portion of this section is held invalid or unenforceable under
+# -any particular circumstance, the balance of the section is intended to
+# -apply and the section as a whole is intended to apply in other
+# -circumstances.
+# -
+# -It is not the purpose of this section to induce you to infringe any
+# -patents or other property right claims or to contest validity of any
+# -such claims; this section has the sole purpose of protecting the
+# -integrity of the free software distribution system, which is
+# -implemented by public license practices.  Many people have made
+# -generous contributions to the wide range of software distributed
+# -through that system in reliance on consistent application of that
+# -system; it is up to the author/donor to decide if he or she is willing
+# -to distribute software through any other system and a licensee cannot
+# -impose that choice.
+# -
+# -This section is intended to make thoroughly clear what is believed to
+# -be a consequence of the rest of this License.
+# -
+# -  8. If the distribution and/or use of the Program is restricted in
+# -certain countries either by patents or by copyrighted interfaces, the
+# -original copyright holder who places the Program under this License
+# -may add an explicit geographical distribution limitation excluding
+# -those countries, so that distribution is permitted only in or among
+# -countries not thus excluded.  In such case, this License incorporates
+# -the limitation as if written in the body of this License.
+# -
+# -  9. The Free Software Foundation may publish revised and/or new versions
+# -of the General Public License from time to time.  Such new versions will
+# +excuse you from the conditions of this License.  If you cannot convey a
+# +covered work so as to satisfy simultaneously your obligations under this
+# +License and any other pertinent obligations, then as a consequence you may
+# +not convey it at all.  For example, if you agree to terms that obligate you
+# +to collect a royalty for further conveying from those to whom you convey
+# +the Program, the only way you could satisfy both those terms and this
+# +License would be to refrain entirely from conveying the Program.
+# +
+# +  13. Use with the GNU Affero General Public License.
+# +
+# +  Notwithstanding any other provision of this License, you have
+# +permission to link or combine any covered work with a work licensed
+# +under version 3 of the GNU Affero General Public License into a single
+# +combined work, and to convey the resulting work.  The terms of this
+# +License will continue to apply to the part which is the covered work,
+# +but the special requirements of the GNU Affero General Public License,
+# +section 13, concerning interaction through a network will apply to the
+# +combination as such.
+# +
+# +  14. Revised Versions of this License.
+# +
+# +  The Free Software Foundation may publish revised and/or new versions of
+# +the GNU General Public License from time to time.  Such new versions will
+#  be similar in spirit to the present version, but may differ in detail to
+#  address new problems or concerns.
+#  
+# -Each version is given a distinguishing version number.  If the Program
+# -specifies a version number of this License which applies to it and "any
+# -later version", you have the option of following the terms and conditions
+# -either of that version or of any later version published by the Free
+# -Software Foundation.  If the Program does not specify a version number of
+# -this License, you may choose any version ever published by the Free Software
+# -Foundation.
+# -
+# -  10. If you wish to incorporate parts of the Program into other free
+# -programs whose distribution conditions are different, write to the author
+# -to ask for permission.  For software which is copyrighted by the Free
+# -Software Foundation, write to the Free Software Foundation; we sometimes
+# -make exceptions for this.  Our decision will be guided by the two goals
+# -of preserving the free status of all derivatives of our free software and
+# -of promoting the sharing and reuse of software generally.
+# -
+# -                            NO WARRANTY
+# -
+# -  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
+# -FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
+# -OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
+# -PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
+# -OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+# -MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
+# -TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
+# -PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
+# -REPAIR OR CORRECTION.
+# -
+# -  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+# -WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
+# -REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
+# -INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
+# -OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
+# -TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
+# -YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
+# -PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+# -POSSIBILITY OF SUCH DAMAGES.
+# +  Each version is given a distinguishing version number.  If the
+# +Program specifies that a certain numbered version of the GNU General
+# +Public License "or any later version" applies to it, you have the
+# +option of following the terms and conditions either of that numbered
+# +version or of any later version published by the Free Software
+# +Foundation.  If the Program does not specify a version number of the
+# +GNU General Public License, you may choose any version ever published
+# +by the Free Software Foundation.
+# +
+# +  If the Program specifies that a proxy can decide which future
+# +versions of the GNU General Public License can be used, that proxy's
+# +public statement of acceptance of a version permanently authorizes you
+# +to choose that version for the Program.
+# +
+# +  Later license versions may give you additional or different
+# +permissions.  However, no additional obligations are imposed on any
+# +author or copyright holder as a result of your choosing to follow a
+# +later version.
+# +
+# +  15. Disclaimer of Warranty.
+# +
+# +  THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
+# +APPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT
+# +HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY
+# +OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO,
+# +THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+# +PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM
+# +IS WITH YOU.  SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF
+# +ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+# +
+# +  16. Limitation of Liability.
+# +
+# +  IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
+# +WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR CONVEYS
+# +THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES, INCLUDING ANY
+# +GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE
+# +USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED TO LOSS OF
+# +DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD
+# +PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS),
+# +EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
+# +SUCH DAMAGES.
+# +
+# +  17. Interpretation of Sections 15 and 16.
+# +
+# +  If the disclaimer of warranty and limitation of liability provided
+# +above cannot be given local legal effect according to their terms,
+# +reviewing courts shall apply local law that most closely approximates
+# +an absolute waiver of all civil liability in connection with the
+# +Program, unless a warranty or assumption of liability accompanies a
+# +copy of the Program in return for a fee.
+#  
+#                       END OF TERMS AND CONDITIONS
+#  
+# @@ -287,15 +628,15 @@
+#  
+#    To do so, attach the following notices to the program.  It is safest
+#  to attach them to the start of each source file to most effectively
+# -convey the exclusion of warranty; and each file should have at least
+# +state the exclusion of warranty; and each file should have at least
+#  the "copyright" line and a pointer to where the full notice is found.
+#  
+#      <one line to give the program's name and a brief idea of what it does.>
+#      Copyright (C) <year>  <name of author>
+#  
+# -    This program is free software; you can redistribute it and/or modify
+# +    This program is free software: you can redistribute it and/or modify
+#      it under the terms of the GNU General Public License as published by
+# -    the Free Software Foundation; either version 2 of the License, or
+# +    the Free Software Foundation, either version 3 of the License, or
+#      (at your option) any later version.
+#  
+#      This program is distributed in the hope that it will be useful,
+# @@ -303,37 +644,31 @@
+#      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+#      GNU General Public License for more details.
+#  
+# -    You should have received a copy of the GNU General Public License along
+# -    with this program; if not, write to the Free Software Foundation, Inc.,
+# -    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# +    You should have received a copy of the GNU General Public License
+# +    along with this program.  If not, see <https://www.gnu.org/licenses/>.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+# -If the program is interactive, make it output a short notice like this
+# -when it starts in an interactive mode:
+# -
+# -    Gnomovision version 69, Copyright (C) year name of author
+# -    Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+# +  If the program does terminal interaction, make it output a short
+# +notice like this when it starts in an interactive mode:
+# +
+# +    <program>  Copyright (C) <year>  <name of author>
+# +    This program comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
+#      This is free software, and you are welcome to redistribute it
+#      under certain conditions; type `show c' for details.
+#  
+#  The hypothetical commands `show w' and `show c' should show the appropriate
+# -parts of the General Public License.  Of course, the commands you use may
+# -be called something other than `show w' and `show c'; they could even be
+# -mouse-clicks or menu items--whatever suits your program.
+# -
+# -You should also get your employer (if you work as a programmer) or your
+# -school, if any, to sign a "copyright disclaimer" for the program, if
+# -necessary.  Here is a sample; alter the names:
+# -
+# -  Yoyodyne, Inc., hereby disclaims all copyright interest in the program
+# -  `Gnomovision' (which makes passes at compilers) written by James Hacker.
+# -
+# -  <signature of Ty Coon>, 1 April 1989
+# -  Ty Coon, President of Vice
+# -
+# -This General Public License does not permit incorporating your program into
+# -proprietary programs.  If your program is a subroutine library, you may
+# -consider it more useful to permit linking proprietary applications with the
+# -library.  If this is what you want to do, use the GNU Lesser General
+# -Public License instead of this License.
+# +parts of the General Public License.  Of course, your program's commands
+# +might be different; for a GUI interface, you would use an "about box".
+# +
+# +  You should also get your employer (if you work as a programmer) or school,
+# +if any, to sign a "copyright disclaimer" for the program, if necessary.
+# +For more information on this, and how to apply and follow the GNU GPL, see
+# +<https://www.gnu.org/licenses/>.
+# +
+# +  The GNU General Public License does not permit incorporating your program
+# +into proprietary programs.  If your program is a subroutine library, you
+# +may consider it more useful to permit linking proprietary applications with
+# +the library.  If this is what you want to do, use the GNU Lesser General
+# +Public License instead of this License.  But first, please read
+# +<https://www.gnu.org/licenses/why-not-lgpl.html>.
+# --- include/pub_tool_basics.h
+# +++ include/pub_tool_basics.h
+# @@ -7,7 +7,7 @@
+#  
+#     This program is free software; you can redistribute it and/or
+#     modify it under the terms of the GNU General Public License as
+# -   published by the Free Software Foundation; either version 2 of the
+# +   published by the Free Software Foundation; either version 3 of the
+#     License, or (at your option) any later version.
+#  
+#     This program is distributed in the hope that it will be useful, but
+# --- include/valgrind.h
+# +++ include/valgrind.h
+# @@ -3,7 +3,7 @@
+#  
+#     Notice that the following BSD-style license applies to this one
+#     file (valgrind.h) only.  The rest of Valgrind is licensed under the
+# -   terms of the GNU General Public License, version 2, unless
+# +   terms of the GNU General Public License, version 3, unless
+#     otherwise indicated.  See the COPYING file in the source
+#     distribution for details.
+#  
+# @@ -49,7 +49,7 @@
+#  
+#     Notice that the above BSD-style license applies to this one file
+#     (valgrind.h) only.  The entire rest of Valgrind is licensed under
+# -   the terms of the GNU General Public License, version 2.  See the
+# +   the terms of the GNU General Public License, version 3.  See the
+#     COPYING file in the source distribution for details.
+#  
+#     ---------------------------------------------------------------- 
+# 
+#
+
+SUMMARY = "Valgrind memory debugger and instrumentation framework"
+HOMEPAGE = "http://valgrind.org/"
+DESCRIPTION = "Valgrind is an instrumentation framework for building dynamic analysis tools. There are Valgrind tools that can automatically detect many memory management and threading bugs, and profile your programs in detail."
+BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
+LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
+                    file://include/pub_tool_basics.h;beginline=6;endline=29;md5=9ba449d120f6845e6a432073278d6e3a \
+                    file://include/valgrind.h;beginline=1;endline=56;md5=993563aaa122558df9c5d743de074d04 \
+                    file://COPYING.DOCS;md5=24ea4c7092233849b4394699333b5c56 \
+                    "
+
+SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
+           file://fixed-perl-path.patch \
+           file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
+           file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
+           file://avoid-neon-for-targets-which-don-t-support-it.patch \
+           file://0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch \
+           file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch \
+           file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch \
+           file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch \
+           file://0003-correct-include-directive-path-for-config.h.patch \
+           file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
+           file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch \
+           file://s390x_vec_op_t.patch \
+           file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
+           file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
+           file://0001-docs-Disable-manual-validation.patch \
+           file://0001-tests-arm-Use-O-instead-of-O0.patch \
+           "
+SRC_URI[sha256sum] = "8d54c717029106f1644aadaf802ab9692e53d93dd015cbd19e74190eba616bd7"
+UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
+
+COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64|riscv64).*-linux'
+
+# valgrind supports armv7 and above
+COMPATIBLE_HOST:armv4 = 'null'
+COMPATIBLE_HOST:armv5 = 'null'
+COMPATIBLE_HOST:armv6 = 'null'
+
+# valgrind fails with powerpc soft-float
+COMPATIBLE_HOST:powerpc = "${@bb.utils.contains('TARGET_FPU', 'soft', 'null', '.*-linux', d)}"
+
+# X32 isn't supported by valgrind at this time
+COMPATIBLE_HOST:linux-gnux32 = 'null'
+COMPATIBLE_HOST:linux-muslx32 = 'null'
+
+# Disable for some MIPS variants
+COMPATIBLE_HOST:mipsarchr6 = 'null'
+COMPATIBLE_HOST:linux-gnun32 = 'null'
+
+# Disable for powerpc64 with musl
+COMPATIBLE_HOST:libc-musl:powerpc64 = 'null'
+
+inherit autotools-brokensep multilib_header
+
+EXTRA_OECONF = "--enable-tls --without-mpicc"
+EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS') != '32']}"
+
+# valgrind checks host_cpu "armv7*)", so we need to over-ride the autotools.bbclass default --host option
+EXTRA_OECONF:append:arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
+
+EXTRA_OEMAKE = "-w"
+
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
+
+# valgrind likes to control its own optimisation flags. It generally defaults
+# to -O2 but uses -O0 for some specific test apps etc. Passing our own flags
+# (via CFLAGS) means we interfere with that. Only pass DEBUG_FLAGS to it
+# which fixes build path issue in DWARF.
+SELECTED_OPTIMIZATION = "${DEBUG_LEVELFLAG}"
+
+# Split out various helper scripts to separate packages to avoid the
+# main package depending on perl and python.
+PACKAGES =+ "${PN}-cachegrind ${PN}-massif ${PN}-callgrind"
+
+FILES:${PN}-cachegrind = "${bindir}/cg_*"
+FILES:${PN}-massif = "${bindir}/ms_*"
+FILES:${PN}-callgrind = "${bindir}/callgrind_*"
+
+RDEPENDS:${PN}-cachegrind = "${PN} python3-core"
+RDEPENDS:${PN}-massif = "${PN} perl"
+RDEPENDS:${PN}-callgrind = "${PN} perl"
+
+do_configure:prepend () {
+    rm -rf ${S}/config.h
+}
+
+do_install:append () {
+    install -m 644 ${B}/default.supp ${D}/${libexecdir}/valgrind/
+    oe_multilib_header valgrind/config.h
+}
+
+VALGRINDARCH ?= "${TARGET_ARCH}"
+VALGRINDARCH:aarch64 = "arm64"
+VALGRINDARCH:x86-64 = "amd64"
+VALGRINDARCH:x86 = "x86"
+VALGRINDARCH:mips = "mips32"
+VALGRINDARCH:mipsel = "mips32"
+VALGRINDARCH:mips64el = "mips64"
+VALGRINDARCH:powerpc = "ppc"
+VALGRINDARCH:powerpc64 = "ppc64"
+VALGRINDARCH:powerpc64le = "ppc64le"
+
+INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libexecdir}/valgrind/vgpreload_memcheck-${VALGRINDARCH}-linux.so"
+
+# valgrind needs debug information for ld.so at runtime in order to
+# redirect functions like strlen.
+RRECOMMENDS:${PN} += "${TCLIBC}-dbg"
+
+# Valgrind needs intrinsics which are not provided by clang
+# m_signals.c:2213:7: error: __builtin_longjmp is not supported for the current target
+# 2213 |       VG_MINIMAL_LONGJMP(tst->sched_jmpbuf);
+#      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+#
+# It needs something like - https://bugs.kde.org/show_bug.cgi?id=369723
+TOOLCHAIN:riscv64 = "gcc"
-- 
2.47.1


--===============0179690318880044557==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-valgrind-upgrade-3.25.1-3.26.0.patch"

RnJvbSAyZWMwZDIzNzlmNWYyY2MzNzE2NmJkYjhlYWU0MDdkYjQxNGQ1NWQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTI6MTQ6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
YWxncmluZDogdXBncmFkZSAzLjI1LjEgLT4gMy4yNi4wCgotLS0KIC4uLnRheC1mb3ItcHVzaHNl
Y3Rpb24tZGlyZWN0aXZlLWluLWlubC5wYXRjaCB8ICAgMzEgLQogLi4uZS1Ecm9wLXNldHRpbmct
bWNwdS1jb3J0ZXgtYTgtb24tYXJtLnBhdGNoIHwgICAgNCArLQogLi4uLzAwMDEtZG9jcy1EaXNh
YmxlLW1hbnVhbC12YWxpZGF0aW9uLnBhdGNoIHwgICAgNiArLQogLi4uZXR0aW5nLW1jcHUtdG8t
Y29ydGV4LWE4LW9uLWFybS1hcmNoLnBhdGNoIHwgICAgNiArLQogLi4uY2hlY2stdGVzdHMtRml4
LXRpbWVyZmQtc3lzY2FsbC10ZXN0LnBhdGNoIHwgICAxMCArLQogLi4uLXZndGVzdHMtcmVtb3Zl
LWZ1bGxwYXRoLWFmdGVyLWZsYWdzLnBhdGNoIHwgICAgMiArLQogLi4uZWFrX2Ntc2cuc3RkZXJy
LmV4cC1hZGp1c3QtdG1wLXBhdGhzLnBhdGNoIHwgICAgMiArLQogLi4uYW1lLV9zaWZpZWxkcy10
by1fX3NpX2ZpZWxkcy1vbi1tdXNsLnBhdGNoIHwgICAgMiArLQogLi4uLzAwMDEtdGVzdHMtYXJt
LVVzZS1PLWluc3RlYWQtb2YtTzAucGF0Y2ggIHwgICAgMiArLQogLi4uLWZpbHRlcl94bWxfZnJh
bWVzLWRvLW5vdC1maWx0ZXItdXNyLnBhdGNoIHwgICAgMiArLQogLi4uLWluY2x1ZGUtZGlyZWN0
aXZlLXBhdGgtZm9yLWNvbmZpZy5oLnBhdGNoIHwgICAgMiArLQogLi4udC1mb3ItUFBDLWluc3Ry
dWN0aW9ucy1tZmF0YnUtbWZhdGJsLnBhdGNoIHwgICAgOCArLQogLi4ubi1mb3ItdGFyZ2V0cy13
aGljaC1kb24tdC1zdXBwb3J0LWl0LnBhdGNoIHwgICAgMiArLQogLi4uL3ZhbGdyaW5kL3ZhbGdy
aW5kL2ZpeGVkLXBlcmwtcGF0aC5wYXRjaCAgIHwgICAgOCArLQogLi4uL3ZhbGdyaW5kL3ZhbGdy
aW5kL3MzOTB4X3ZlY19vcF90LnBhdGNoICAgIHwgICAgNCArLQogLi4udGUtbWFyY2gtbWNwdS1t
ZnB1LWZvci1BUk0tdGVzdC1hcHBzLnBhdGNoIHwgICAgMiArLQogLi4uLWxkLVhYWC5zby1zdHJs
ZW4taW50ZXJjZXB0LW9wdGlvbmFsLnBhdGNoIHwgICAgNCArLQogLi4uL3ZhbGdyaW5kL3ZhbGdy
aW5kXzMuMjUuMS5iYiAgICAgICAgICAgICAgIHwgIDExNiAtLQogLi4uL3ZhbGdyaW5kL3ZhbGdy
aW5kXzMuMjYuMC5iYiAgICAgICAgICAgICAgIHwgMTExNiArKysrKysrKysrKysrKysrKwogMTkg
ZmlsZXMgY2hhbmdlZCwgMTE0OSBpbnNlcnRpb25zKCspLCAxODAgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAw
MDEtVXNlLXBvcnRhYmxlLXN5bnRheC1mb3ItcHVzaHNlY3Rpb24tZGlyZWN0aXZlLWluLWlubC5w
YXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92
YWxncmluZF8zLjI1LjEuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdmFsZ3JpbmQvdmFsZ3JpbmRfMy4yNi4wLmJiCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtVXNlLXBvcnRhYmxlLXN5bnRheC1mb3It
cHVzaHNlY3Rpb24tZGlyZWN0aXZlLWluLWlubC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxncmluZC92YWxncmluZC8wMDAxLVVzZS1wb3J0YWJsZS1zeW50YXgtZm9yLXB1c2hzZWN0
aW9uLWRpcmVjdGl2ZS1pbi1pbmwucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IGI1OWM1NDQyMjMuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdy
aW5kL3ZhbGdyaW5kLzAwMDEtVXNlLXBvcnRhYmxlLXN5bnRheC1mb3ItcHVzaHNlY3Rpb24tZGly
ZWN0aXZlLWluLWlubC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDMxICswLDAgQEAKLUZyb20g
MjA4OTM4M2EwZTNhNTBmNTI3MzM3ZWEwNTE4OGIzZTMwMjA2OTg4OCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBXZWQs
IDE0IE1heSAyMDI1IDA5OjI5OjMzIC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0hdIFVzZSBwb3J0YWJs
ZSBzeW50YXggZm9yIHB1c2hzZWN0aW9uIGRpcmVjdGl2ZSBpbiBpbmxpbmUKLSBhc3NlbWJseQot
Ci0nQCcgZG9lcyBub3Qgd29yayB3aXRoIGNsYW5nIGlubGluZSBhc3NlbWJsZXIsIGJ1dCAnJScg
d29ya3Mgd2l0aCBib3RoCi1nY2MgYW5kIGNsYW5nLiBUaGVyZWZvcmUgdXNlICclJyB0byBtYWtl
IGl0IG1vcmUgcG9ydGFibGUKLQotRml4ZXMKLTxpbmxpbmUgYXNtPjoxOjQxOiBlcnJvcjogZXhw
ZWN0ZWQgJyU8dHlwZT4nIG9yICI8dHlwZT4iCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVk
IFtodHRwczovL2J1Z3Mua2RlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NTA0MjIyXQotU2lnbmVkLW9m
Zi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLS0tLQotIGNvcmVncmluZC92Z19w
cmVsb2FkZWQuYyB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL2NvcmVncmluZC92Z19wcmVsb2FkZWQuYyBiL2NvcmVn
cmluZC92Z19wcmVsb2FkZWQuYwotaW5kZXggNWJlYzUxZC4uZTRjMmRiYyAxMDA2NDQKLS0tLSBh
L2NvcmVncmluZC92Z19wcmVsb2FkZWQuYwotKysrIGIvY29yZWdyaW5kL3ZnX3ByZWxvYWRlZC5j
Ci1AQCAtNTUsNyArNTUsNyBAQAotIC8qIE5vdGU6IFRoZSAiTVMiIHNlY3Rpb24gZmxhZ3MgYXJl
IHRvIHJlbW92ZSBkdXBsaWNhdGVzLiAgKi8KLSAjZGVmaW5lIERFRklORV9HREJfUFlfU0NSSVBU
KHNjcmlwdF9uYW1lKSBcCi0gICBhc20oIlwKLS0ucHVzaHNlY3Rpb24gXCIuZGVidWdfZ2RiX3Nj
cmlwdHNcIiwgXCJNU1wiLEBwcm9nYml0cywxXG5cCi0rLnB1c2hzZWN0aW9uIFwiLmRlYnVnX2dk
Yl9zY3JpcHRzXCIsIFwiTVNcIiwlcHJvZ2JpdHMsMVxuXAotIC5ieXRlIDEgLyogUHl0aG9uICov
XG5cCi0gLmFzY2l6IFwiIiBzY3JpcHRfbmFtZSAiXCJcblwKLSAucG9wc2VjdGlvbiBcblwKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLWNv
bmZpZ3VyZS1Ecm9wLXNldHRpbmctbWNwdS1jb3J0ZXgtYTgtb24tYXJtLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtY29uZmlndXJlLURyb3Atc2V0
dGluZy1tY3B1LWNvcnRleC1hOC1vbi1hcm0ucGF0Y2gKaW5kZXggM2M4YmVjODJiMy4uYTQwMDkw
Mjk0MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5k
LzAwMDEtY29uZmlndXJlLURyb3Atc2V0dGluZy1tY3B1LWNvcnRleC1hOC1vbi1hcm0ucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtY29uZmln
dXJlLURyb3Atc2V0dGluZy1tY3B1LWNvcnRleC1hOC1vbi1hcm0ucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDVhNzc2ZTYxYWY1YWI3ZjBjZmQxMGNkZTU1Yzc5NjE4OTY4NjkxNmYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGNjMjBhNzE3YjU4MjAzMmMxMDMyYjIyYWZlN2VmYTcz
MzhhYTg0MGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgogRGF0ZTogRnJpLCAxMCBNYXkgMjAyNCAxNjoyNzozNCAtMDcwMAogU3Vi
amVjdDogW1BBVENIXSBjb25maWd1cmU6IERyb3Agc2V0dGluZyBtY3B1PWNvcnRleC1hOCBvbiBh
cm0KQEAgLTE2LDcgKzE2LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCAyZGZi
ZDFjLi5iNDJmZGQ0IDEwMDc1NQoraW5kZXggZTMwZTRjMS4uYTI1MDY4MCAxMDA2NDQKIC0tLSBh
L2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtMjUxLDEzICsyNTEsMTMgQEAg
Y2FzZSAiJHtob3N0X2NwdX0iIGluCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1kb2NzLURpc2FibGUtbWFudWFsLXZhbGlkYXRpb24ucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1kb2NzLURp
c2FibGUtbWFudWFsLXZhbGlkYXRpb24ucGF0Y2gKaW5kZXggZmJkNzk5ZWVlYS4uZGFiZjYwODZm
NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAw
MDEtZG9jcy1EaXNhYmxlLW1hbnVhbC12YWxpZGF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLWRvY3MtRGlzYWJsZS1tYW51YWwtdmFs
aWRhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNGY2NzRmNDU4YjFmMDY3NWFiZGMw
Y2VkMDEyMzllOTliZmE0MGRlOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYmRhNTk1
OTQyODg4OTIxZDMwZjhmN2MxN2Q0YmNkODA3MzA2MzEwYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDEzIEph
biAyMDIyIDE4OjI2OjAyIC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRvY3M6IERpc2FibGUgbWFu
dWFsIHZhbGlkYXRpb24KQEAgLTE5LDEwICsxOSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvZG9jcy9NYWtlZmlsZS5hbSBiL2RvY3MvTWFr
ZWZpbGUuYW0KLWluZGV4IDY4YTNkYTUuLjk4MzNkNWMgMTAwNjQ0CitpbmRleCA3ZTVlZDM4Li42
M2ExYWE3IDEwMDY0NAogLS0tIGEvZG9jcy9NYWtlZmlsZS5hbQogKysrIGIvZG9jcy9NYWtlZmls
ZS5hbQotQEAgLTIwMiw3ICsyMDIsNyBAQCB2YWxpZC1tYW5wYWdlczogJChNQU5QQUdFU19YTUxf
RklMRVMpCitAQCAtMjIzLDcgKzIyMyw3IEBAIHZhbGlkLW1hbnBhZ2VzOiAkKE1BTlBBR0VTX1hN
TF9GSUxFUykKICAJICBmaSBcCiAgCWZpCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1tYWtlZmlsZXMtRHJvcC1zZXR0aW5nLW1jcHUt
dG8tY29ydGV4LWE4LW9uLWFybS1hcmNoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWFrZWZpbGVzLURyb3Atc2V0dGluZy1tY3B1LXRvLWNvcnRl
eC1hOC1vbi1hcm0tYXJjaC5wYXRjaAppbmRleCBmOGQxZTg3YmE5Li45YzZlM2M1ZmUwIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1tYWtl
ZmlsZXMtRHJvcC1zZXR0aW5nLW1jcHUtdG8tY29ydGV4LWE4LW9uLWFybS1hcmNoLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW1ha2VmaWxl
cy1Ecm9wLXNldHRpbmctbWNwdS10by1jb3J0ZXgtYTgtb24tYXJtLWFyY2gucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIGM4NzhhYWFjYWRmOGVjNzIzYmU4ODJmOTMzNWNiMzMyNDBkZjEzZDYg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDVjMzBkODMzNzg0OWU5NThhMjQ4NGJhNGIy
MDc2NjRjZjRmZjI0NmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyMCBBcHIgMjAxNyAxMDoxMToxNiAtMDcw
MAogU3ViamVjdDogW1BBVENIXSBtYWtlZmlsZXM6IERyb3Agc2V0dGluZyAtbWNwdSB0byBjb3J0
ZXgtYTggb24gYXJtCkBAIC0xOSwxMCArMTksMTAgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4KICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvaGVsZ3JpbmQvdGVzdHMvTWFrZWZpbGUu
YW0gYi9oZWxncmluZC90ZXN0cy9NYWtlZmlsZS5hbQotaW5kZXggN2FkYzVjNi4uY2FjMjNjOSAx
MDA3NTUKK2luZGV4IGI4YzVmZDAuLmM1NTc3NWEgMTAwNjQ0CiAtLS0gYS9oZWxncmluZC90ZXN0
cy9NYWtlZmlsZS5hbQogKysrIGIvaGVsZ3JpbmQvdGVzdHMvTWFrZWZpbGUuYW0KLUBAIC0yMjYs
OSArMjI2LDkgQEAgaWYgISBWR0NPTkZfUExBVEZPUk1TX0lOQ0xVREVfWDg2X0RBUldJTgorQEAg
LTIyNyw5ICsyMjcsOSBAQCBpZiAhIFZHQ09ORl9QTEFURk9STVNfSU5DTFVERV9YODZfREFSV0lO
CiAgZW5kaWYKICAKICBpZiBWR0NPTkZfUExBVEZPUk1TX0lOQ0xVREVfQVJNX0xJTlVYCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1tZW1j
aGVjay10ZXN0cy1GaXgtdGltZXJmZC1zeXNjYWxsLXRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1tZW1jaGVjay10ZXN0cy1GaXgtdGltZXJm
ZC1zeXNjYWxsLXRlc3QucGF0Y2gKaW5kZXggMjAwYjI2MDJjYi4uYTkxZTI2YTQ3NiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWVtY2hl
Y2stdGVzdHMtRml4LXRpbWVyZmQtc3lzY2FsbC10ZXN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW1lbWNoZWNrLXRlc3RzLUZpeC10aW1l
cmZkLXN5c2NhbGwtdGVzdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2E1MWVkMTA3ZjY3
NzMyOTEwZGVjMTIyNzlhOTI3OWUxNThhZmJlNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNjMwZDliOGIwMTJlNGQyY2JmY2RlMzE3N2FhMzI0ZTE5ZjczZGQzZiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBN
b24sIDkgTWFyIDIwMjAgMTY6MzA6MTkgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVtY2hlY2sv
dGVzdHM6IEZpeCB0aW1lcmZkIHN5c2NhbGwgdGVzdApAQCAtMTYsMTAgKzE2LDEwIEBAIFNpZ25l
ZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMyBmaWxlcyBjaGFuZ2Vk
LCAxNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmln
LmguaW4gYi9jb25maWcuaC5pbgotaW5kZXggMDBkYjFhNi4uMjNmZDc3YSAxMDA2NDQKK2luZGV4
IDBkNGQxNzAuLmYwMmIwNWEgMTAwNjQ0CiAtLS0gYS9jb25maWcuaC5pbgogKysrIGIvY29uZmln
LmguaW4KLUBAIC00MDksNiArNDA5LDkgQEAKK0BAIC00MjEsNiArNDIxLDkgQEAKICAvKiBEZWZp
bmUgdG8gMSBpZiB5b3UgaGF2ZSB0aGUgPHN5cy9zeXNudmwuaD4gaGVhZGVyIGZpbGUuICovCiAg
I3VuZGVmIEhBVkVfU1lTX1NZU05WTF9ICiAgCkBAIC0zMCwxMCArMzAsMTAgQEAgaW5kZXggMDBk
YjFhNi4uMjNmZDc3YSAxMDA2NDQKICAjdW5kZWYgSEFWRV9TWVNfVElNRV9ICiAgCiBkaWZmIC0t
Z2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBiNDJmZGQ0Li5lYzk1MTQ2
IDEwMDc1NQoraW5kZXggYTI1MDY4MC4uODcwZjQ0ZCAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5h
YwogKysrIGIvY29uZmlndXJlLmFjCi1AQCAtNDg5Miw2ICs0ODkyLDcgQEAgQUNfQ0hFQ0tfSEVB
REVSUyhbICAgICAgIFwKK0BAIC00OTI2LDYgKzQ5MjYsNyBAQCBBQ19DSEVDS19IRUFERVJTKFsg
ICAgICAgXAogICAgICAgICAgc3lzL3N5c2NhbGwuaCAgICBcCiAgICAgICAgICBzeXMvc3lzbnZs
LmggICAgIFwKICAgICAgICAgIHN5cy90aW1lLmggICAgICAgXApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWVtY2hlY2stdmd0ZXN0cy1y
ZW1vdmUtZnVsbHBhdGgtYWZ0ZXItZmxhZ3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1tZW1jaGVjay12Z3Rlc3RzLXJlbW92ZS1mdWxscGF0aC1h
ZnRlci1mbGFncy5wYXRjaAppbmRleCA5YTM1OTZjYWMxLi41YThhZmFmZjViIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1tZW1jaGVjay12
Z3Rlc3RzLXJlbW92ZS1mdWxscGF0aC1hZnRlci1mbGFncy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1tZW1jaGVjay12Z3Rlc3RzLXJlbW92
ZS1mdWxscGF0aC1hZnRlci1mbGFncy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjcwM2Iw
ZDExYWRjOTE0N2E3ZDk3ODE3YmQ3NzFhYzQwYjhjNGQzOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gOTgyMWU0MDdhODM2ZGI1MTcwNTQ0YzE1N2E5MTlmNGNiMGEwM2YwYyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFN0YWN5IEdhaWtvdmFpYSA8U3RhY3kuR2Fpa292YWlh
QHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDE2IFNlcCAyMDIwIDEzOjQ1OjA3IC0wNDAwCiBT
dWJqZWN0OiBbUEFUQ0hdIG1lbWNoZWNrIHZndGVzdHMgcmVtb3ZlIGZ1bGxwYXRoLWFmdGVyIGZs
YWdzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQv
MDAwMS1ub25lLXRlc3RzLWZkbGVha19jbXNnLnN0ZGVyci5leHAtYWRqdXN0LXRtcC1wYXRocy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW5vbmUt
dGVzdHMtZmRsZWFrX2Ntc2cuc3RkZXJyLmV4cC1hZGp1c3QtdG1wLXBhdGhzLnBhdGNoCmluZGV4
IDdkZWNhOTkyMDIuLmY5YjMxZDQ5OWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxncmluZC92YWxncmluZC8wMDAxLW5vbmUtdGVzdHMtZmRsZWFrX2Ntc2cuc3RkZXJyLmV4
cC1hZGp1c3QtdG1wLXBhdGhzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxn
cmluZC92YWxncmluZC8wMDAxLW5vbmUtdGVzdHMtZmRsZWFrX2Ntc2cuc3RkZXJyLmV4cC1hZGp1
c3QtdG1wLXBhdGhzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiYmI1ZThhNmZjNWVlYzE3
OGY4MDc3YWIwMDZhYjQyYzAwOTUyOGQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAx
YTdiMThhNzVhMjk4OGFmY2ZjNTJlODMyNTU2MzkxNGRhNmUyNzcyIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+
CiBEYXRlOiBGcmksIDI0IEphbiAyMDIwIDE3OjU1OjM5ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hd
IG5vbmUvdGVzdHMvZmRsZWFrX2Ntc2cuc3RkZXJyLmV4cDogYWRqdXN0IC90bXAgcGF0aHMKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLXNp
Z3F1ZXVlLVJlbmFtZS1fc2lmaWVsZHMtdG8tX19zaV9maWVsZHMtb24tbXVzbC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLXNpZ3F1ZXVlLVJlbmFt
ZS1fc2lmaWVsZHMtdG8tX19zaV9maWVsZHMtb24tbXVzbC5wYXRjaAppbmRleCBlZmE2YzJjODk1
Li40Yzc5OGUwMDhjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQv
dmFsZ3JpbmQvMDAwMS1zaWdxdWV1ZS1SZW5hbWUtX3NpZmllbGRzLXRvLV9fc2lfZmllbGRzLW9u
LW11c2wucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5k
LzAwMDEtc2lncXVldWUtUmVuYW1lLV9zaWZpZWxkcy10by1fX3NpX2ZpZWxkcy1vbi1tdXNsLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjMjg3MzgyYTFmM2RkOWYyZGIzZGY1NGRkZTU0YjRi
MjY2NzkxYmI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxMjc2ZDFhZGQwNWI0ZjQy
ODYzOWMxYmMwNDNkN2I1ZjkyNzhlOGJlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTAgSnVuIDIwMTcgMDA6
NDY6MzkgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gc2lncXVldWU6IFJlbmFtZSBfc2lmaWVsZHMg
dG8gX19zaV9maWVsZHMgb24gbXVzbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtdGVzdHMtYXJtLVVzZS1PLWluc3RlYWQtb2YtTzAucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS10ZXN0cy1h
cm0tVXNlLU8taW5zdGVhZC1vZi1PMC5wYXRjaAppbmRleCAzZWVhMTk1NTc5Li5mNTkwNjllMTJl
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAw
MS10ZXN0cy1hcm0tVXNlLU8taW5zdGVhZC1vZi1PMC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS10ZXN0cy1hcm0tVXNlLU8taW5zdGVhZC1v
Zi1PMC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gODA4N2FlOGRjYzQ2ZjNmODFhZjU4ZWQ5
YjcxNzY3NjFiOTg4ZWU2MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMTdkOWQxOGEz
Njg3NWJmOWI4NzNmZjZjNGM5MGM4OTI0ZWE1NjVkNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDEwIE1heSAy
MDI0IDE3OjQ0OjQ3IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL2FybTogVXNlIC1PIGlu
c3RlYWQgb2YgLU8wCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQv
dmFsZ3JpbmQvMDAwMS12YWxncmluZC1maWx0ZXJfeG1sX2ZyYW1lcy1kby1ub3QtZmlsdGVyLXVz
ci5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLXZh
bGdyaW5kLWZpbHRlcl94bWxfZnJhbWVzLWRvLW5vdC1maWx0ZXItdXNyLnBhdGNoCmluZGV4IGM2
NGMyYWZkM2YuLjU2YzkwZWQwOWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92
YWxncmluZC92YWxncmluZC8wMDAxLXZhbGdyaW5kLWZpbHRlcl94bWxfZnJhbWVzLWRvLW5vdC1m
aWx0ZXItdXNyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxn
cmluZC8wMDAxLXZhbGdyaW5kLWZpbHRlcl94bWxfZnJhbWVzLWRvLW5vdC1maWx0ZXItdXNyLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmOGZiZWJjZjY5ZTRhOGJmMjEyMmI3YzU1ZjJjZTM3
MjM3N2FmMWJjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3MDllNjc3ZDM2N2ZmYWM2
MzQ0MWVhNjg5YjZjNjU1YTZiZmY0NGYwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
UmFuZHkgTWFjTGVvZCA8UmFuZHkuTWFjTGVvZEB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAx
MyBNYXkgMjAxOSAxNzoxMjoyMSAtMDQwMAogU3ViamVjdDogW1BBVENIXSB2YWxncmluZDogZmls
dGVyX3htbF9mcmFtZXM6IGRvIG5vdCBmaWx0ZXIgL3VzcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDMtY29ycmVjdC1pbmNsdWRlLWRpcmVj
dGl2ZS1wYXRoLWZvci1jb25maWcuaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxn
cmluZC92YWxncmluZC8wMDAzLWNvcnJlY3QtaW5jbHVkZS1kaXJlY3RpdmUtcGF0aC1mb3ItY29u
ZmlnLmgucGF0Y2gKaW5kZXggM2FjYjVhMjhmNC4uNTI2YzM2MmY0ZSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDMtY29ycmVjdC1pbmNsdWRl
LWRpcmVjdGl2ZS1wYXRoLWZvci1jb25maWcuaC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMy1jb3JyZWN0LWluY2x1ZGUtZGlyZWN0aXZlLXBh
dGgtZm9yLWNvbmZpZy5oLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkZTRkN2U0Nzg1MTVi
NjNmMDQ5YjIxMTI2NmQ5Yjk0NmMxNWNjMGI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBmOWU4ZDVhZTk2ZjI5MzQwZDQ0NjY5Y2MyOGZmNjM0ZjhmYzBjYWM4IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNh
dCwgMTAgSnVuIDIwMTcgMDE6MDM6MTcgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29ycmVjdCBp
bmNsdWRlIGRpcmVjdGl2ZSBwYXRoIGZvciBjb25maWcuaApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL0FkZGVkLXN1cHBvcnQtZm9yLVBQQy1pbnN0
cnVjdGlvbnMtbWZhdGJ1LW1mYXRibC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxn
cmluZC92YWxncmluZC9BZGRlZC1zdXBwb3J0LWZvci1QUEMtaW5zdHJ1Y3Rpb25zLW1mYXRidS1t
ZmF0YmwucGF0Y2gKaW5kZXggMTA5Y2FmNzZhYi4uMzdjYWM2YjhlMSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL0FkZGVkLXN1cHBvcnQtZm9yLVBQ
Qy1pbnN0cnVjdGlvbnMtbWZhdGJ1LW1mYXRibC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvQWRkZWQtc3VwcG9ydC1mb3ItUFBDLWluc3RydWN0aW9u
cy1tZmF0YnUtbWZhdGJsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4NWJmZjk5MzA4N2Nk
NzM2N2ZmYzM1ZGU1MjVjMmJmNjE2MjM5OGQyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBhNDljY2JhMmRjMjNlYmE1MWM3N2NlMmY0YjAyZDAxYjU5NTlkNzMwIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQW5lZXNoIEJhbnNhbCA8YW5lZXNoLmJhbnNhbEBmcmVlc2NhbGUu
Y29tPgogRGF0ZTogTW9uLCAyMSBOb3YgMjAxMSAxNzozMTozOSArMDUzMAogU3ViamVjdDogW1BB
VENIXSBBZGRlZCBzdXBwb3J0IGZvciBQUEMgaW5zdHJ1Y3Rpb25zIG1mYXRidSwgbWZhdGJsLgpA
QCAtMTcsNyArMTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbmVlc2ggQmFuc2FsIDxhbmVlc2guYmFu
c2FsQGZyZWVzY2FsZS5jb20+CiAgMyBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCiAK
IGRpZmYgLS1naXQgYS9WRVgvcHJpdi9ndWVzdF9wcGNfZGVmcy5oIGIvVkVYL3ByaXYvZ3Vlc3Rf
cHBjX2RlZnMuaAotaW5kZXggMjIwZmJmMS4uY2QyNTlmMyAxMDA2NDQKK2luZGV4IGY1NTcxYzQu
LjdiODBjOTYgMTAwNjQ0CiAtLS0gYS9WRVgvcHJpdi9ndWVzdF9wcGNfZGVmcy5oCiArKysgYi9W
RVgvcHJpdi9ndWVzdF9wcGNfZGVmcy5oCiBAQCAtMjMzLDYgKzIzMyw4IEBAIGV4dGVybiBVSW50
IHBwYzMyZ19kaXJ0eWhlbHBlcl9NRlNQUl8yNjhfMjY5ICggVUludCApOwpAQCAtMzAsNyArMzAs
NyBAQCBpbmRleCAyMjBmYmYxLi5jZDI1OWYzIDEwMDY0NAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBVSW50IHZEX2lkeCwgVUludCBzaCwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgVUludCBzaGlmdF9yaWdodCApOwogZGlmZiAtLWdpdCBhL1ZF
WC9wcml2L2d1ZXN0X3BwY19oZWxwZXJzLmMgYi9WRVgvcHJpdi9ndWVzdF9wcGNfaGVscGVycy5j
Ci1pbmRleCAyNjExZTUyLi43MmMzNDliIDEwMDY0NAoraW5kZXggMTA2ZjU3ZS4uYzNiMDhlNCAx
MDA2NDQKIC0tLSBhL1ZFWC9wcml2L2d1ZXN0X3BwY19oZWxwZXJzLmMKICsrKyBiL1ZFWC9wcml2
L2d1ZXN0X3BwY19oZWxwZXJzLmMKIEBAIC0xMTgsNiArMTE4LDI0IEBAIFVJbnQgcHBjMzJnX2Rp
cnR5aGVscGVyX01GU1BSXzI4NyAoIHZvaWQgKQpAQCAtNTksNyArNTksNyBAQCBpbmRleCAyNjEx
ZTUyLi43MmMzNDliIDEwMDY0NAogIC8qIENBTExFRCBGUk9NIEdFTkVSQVRFRCBDT0RFICovCiAg
LyogRElSVFkgSEVMUEVSIChyZWFkcyBndWVzdCBzdGF0ZSwgd3JpdGVzIGd1ZXN0IG1lbSkgKi8K
IGRpZmYgLS1naXQgYS9WRVgvcHJpdi9ndWVzdF9wcGNfdG9JUi5jIGIvVkVYL3ByaXYvZ3Vlc3Rf
cHBjX3RvSVIuYwotaW5kZXggMTg3MTZkZC4uYjJlNzJhMCAxMDA2NDQKK2luZGV4IDIzMWU5MTQu
LjI4NzA4YjAgMTAwNjQ0CiAtLS0gYS9WRVgvcHJpdi9ndWVzdF9wcGNfdG9JUi5jCiArKysgYi9W
RVgvcHJpdi9ndWVzdF9wcGNfdG9JUi5jCiBAQCAtMTE4NzUsNiArMTE4NzUsMjggQEAgc3RhdGlj
IEJvb2wgZGlzX3Byb2NfY3RsICggY29uc3QgVmV4QWJpSW5mbyogdmJpLCBVSW50IHByZWZpeCwg
VUludCB0aGVJbnN0ciApCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3Jp
bmQvdmFsZ3JpbmQvYXZvaWQtbmVvbi1mb3ItdGFyZ2V0cy13aGljaC1kb24tdC1zdXBwb3J0LWl0
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL2F2b2lkLW5l
b24tZm9yLXRhcmdldHMtd2hpY2gtZG9uLXQtc3VwcG9ydC1pdC5wYXRjaAppbmRleCAxNTk3YjNh
MDIxLi5jMGE4MzMwMzE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3Jp
bmQvdmFsZ3JpbmQvYXZvaWQtbmVvbi1mb3ItdGFyZ2V0cy13aGljaC1kb24tdC1zdXBwb3J0LWl0
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC9hdm9p
ZC1uZW9uLWZvci10YXJnZXRzLXdoaWNoLWRvbi10LXN1cHBvcnQtaXQucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDU5NjM3MmJjOWI0ZDMxYmM5ODExODgxY2ZhNzQ3ZDk5YThjMjUxNDEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDViNjliZDkwOTQyY2M1NGZkZjJjMzIwNDZjNTI1
ZWY1YmY5MTk3OTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZSBNY0N1cmR5
IDxhcm1jY3VyZHlAZ21haWwuY29tPgogRGF0ZTogVHVlLCAxOSBKYW4gMjAxNiAxNjo0MjozNiAt
MDgwMAogU3ViamVjdDogW1BBVENIXSBhdm9pZCBuZW9uIGZvciB0YXJnZXRzIHdoaWNoIGRvbid0
IHN1cHBvcnQgaXQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92
YWxncmluZC9maXhlZC1wZXJsLXBhdGgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFs
Z3JpbmQvdmFsZ3JpbmQvZml4ZWQtcGVybC1wYXRoLnBhdGNoCmluZGV4IDZiZmM2MDM1ZWQuLmMw
ZGFhOWRmYjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxn
cmluZC9maXhlZC1wZXJsLXBhdGgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGdyaW5kL3ZhbGdyaW5kL2ZpeGVkLXBlcmwtcGF0aC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gNDA4ZjliMzljYTRmNTcwOWI2NjhmMTM4MjlhOTRjNGNhZTg1NTAwNiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gYjFhYjc1OWFlZDVlZDdmZDcwMWRhZTVkNjNhMjBiYWMwZGFkYWFk
MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFFpbmcgSGUgPHFpbmcuaGVAaW50ZWwu
Y29tPgogRGF0ZTogVHVlLCAzMSBBdWcgMjAxMCAyMjo1MTo1OCArMDgwMAogU3ViamVjdDogW1BB
VENIXSB2YWxncmluZDogZml4IHBlcmwgc2NyaXB0cwpAQCAtMjQsNyArMjQsNyBAQCBTaWduZWQt
b2ZmLWJ5OiBNYXhpbiBCLiBKb2huIDxtYXhpbi5qb2huQGludGVsLmNvbT4KICAzIGZpbGVzIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL21h
c3NpZi9tc19wcmludC5pbiBiL21hc3NpZi9tc19wcmludC5pbgotaW5kZXggYTIwNmNlNC4uZGYx
YmMzMSAxMDA3NTUKK2luZGV4IGVjZDlmMzguLjMzMTM5ZGUgMTAwNjQ0CiAtLS0gYS9tYXNzaWYv
bXNfcHJpbnQuaW4KICsrKyBiL21hc3NpZi9tc19wcmludC5pbgogQEAgLTEsNCArMSw0IEBACkBA
IC0zNCw3ICszNCw3IEBAIGluZGV4IGEyMDZjZTQuLmRmMWJjMzEgMTAwNzU1CiAgIyMtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLSMjCiAgIyMtLS0gTWFzc2lmJ3MgcmVzdWx0cyBwcmludGVyICAgICAgICAgICAgICAgICAg
ICAgICAgIG1zX3ByaW50LmluIC0tLSMjCiBkaWZmIC0tZ2l0IGEvcGVyZi92Z19wZXJmLmluIGIv
cGVyZi92Z19wZXJmLmluCi1pbmRleCA5MGVlMWQyLi5jNTg1MDk2IDEwMDY0NAoraW5kZXggY2My
NzgzNC4uMGU0OTU1MCAxMDA2NDQKIC0tLSBhL3BlcmYvdmdfcGVyZi5pbgogKysrIGIvcGVyZi92
Z19wZXJmLmluCiBAQCAtMSw0ICsxLDQgQEAKQEAgLTQ0LDcgKzQ0LDcgQEAgaW5kZXggOTBlZTFk
Mi4uYzU4NTA5NiAxMDA2NDQKICAjIy0tLSBWYWxncmluZCBwZXJmb3JtYW5jZSB0ZXN0aW5nIHNj
cmlwdCAgICAgICAgICAgICAgICAgIHZnX3BlcmYgLS0tIyMKICAjIy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIyMKIGRp
ZmYgLS1naXQgYS90ZXN0cy92Z19yZWd0ZXN0LmluIGIvdGVzdHMvdmdfcmVndGVzdC5pbgotaW5k
ZXggMzQ3MTMyMi4uNDllMTExNCAxMDA3NTUKK2luZGV4IDBkN2VjNzEuLmI0NGViODkgMTAwNjQ0
CiAtLS0gYS90ZXN0cy92Z19yZWd0ZXN0LmluCiArKysgYi90ZXN0cy92Z19yZWd0ZXN0LmluCiBA
QCAtMSw0ICsxLDQgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmlu
ZC92YWxncmluZC9zMzkweF92ZWNfb3BfdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92
YWxncmluZC92YWxncmluZC9zMzkweF92ZWNfb3BfdC5wYXRjaAppbmRleCAxOTY5MGU1ZWJiLi5h
ZWJkZmIzNmNkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFs
Z3JpbmQvczM5MHhfdmVjX29wX3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGdyaW5kL3ZhbGdyaW5kL3MzOTB4X3ZlY19vcF90LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSA4YzkyMDg5NzQxZDgwOWNmZDE4MzU0ZjFiNGRmMThjZDI4Mzk4YTIwIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA5Mjg4OTZlMjZiNTg4ZmU1MTkzZGQ2MGQ1MjNjMGUyM2ZkOTAyY2Nh
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogWWkgRmFuIFl1IDx5aWZhbi55dUB3aW5k
cml2ZXIuY29tPgogRGF0ZTogV2VkLCAxNyBNYXIgMjAyMSAxMjoxNjozMSAtMDQwMAogU3ViamVj
dDogW1BBVENIXSByZW1vdmUgczM5MHhfdmVjX29wX3QKQEAgLTE4LDcgKzE4LDcgQEAgU2lnbmVk
LW9mZi1ieTogWWkgRmFuIFl1IDx5aWZhbi55dUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvVkVYL3By
aXYvZ3Vlc3RfczM5MF9kZWZzLmggYi9WRVgvcHJpdi9ndWVzdF9zMzkwX2RlZnMuaAotaW5kZXgg
MjllZmEwMS4uM2E4ZjBhMCAxMDA2NDQKK2luZGV4IGE3ODBlODMuLjQ2NjA5YWMgMTAwNjQ0CiAt
LS0gYS9WRVgvcHJpdi9ndWVzdF9zMzkwX2RlZnMuaAogKysrIGIvVkVYL3ByaXYvZ3Vlc3RfczM5
MF9kZWZzLmgKIEBAIC0yODUsNyArMjg1LDcgQEAgdHlwZWRlZiBlbnVtIHsKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC91c2UtYXBwcm9wcmlhdGUt
bWFyY2gtbWNwdS1tZnB1LWZvci1BUk0tdGVzdC1hcHBzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3VzZS1hcHByb3ByaWF0ZS1tYXJjaC1tY3B1LW1mcHUt
Zm9yLUFSTS10ZXN0LWFwcHMucGF0Y2gKaW5kZXggMGMxOGE2M2MyYi4uNzEwNjBjZjE1YSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3VzZS1hcHBy
b3ByaWF0ZS1tYXJjaC1tY3B1LW1mcHUtZm9yLUFSTS10ZXN0LWFwcHMucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3VzZS1hcHByb3ByaWF0ZS1tYXJj
aC1tY3B1LW1mcHUtZm9yLUFSTS10ZXN0LWFwcHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGE1Y2QwMGYxYzJkNzhlMmExNWY0YTBjNTk1ZjVhYzEwY2E0YzMyOTAgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGJjMGNhZDRhNjQ4MmFmM2MxMmNiZjM1Mzk1OGRmNGI3ZmJjNTZmOWQg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZSBNY0N1cmR5IDxhcm1jY3VyZHlA
Z21haWwuY29tPgogRGF0ZTogVHVlLCAxOSBKYW4gMjAxNiAxNjowMDowMCAtMDgwMAogU3ViamVj
dDogW1BBVENIXSB1c2UgYXBwcm9wcmlhdGUgLW1hcmNoLy1tY3B1Ly1tZnB1IGZvciBBUk0gdGVz
dCBhcHBzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3Jp
bmQvdmFsZ3JpbmQtbWFrZS1sZC1YWFguc28tc3RybGVuLWludGVyY2VwdC1vcHRpb25hbC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC92YWxncmluZC1tYWtl
LWxkLVhYWC5zby1zdHJsZW4taW50ZXJjZXB0LW9wdGlvbmFsLnBhdGNoCmluZGV4IGNhN2Y3MjFk
OWMuLmY1ZjM3MzU3Y2QgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmlu
ZC92YWxncmluZC92YWxncmluZC1tYWtlLWxkLVhYWC5zby1zdHJsZW4taW50ZXJjZXB0LW9wdGlv
bmFsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC92
YWxncmluZC1tYWtlLWxkLVhYWC5zby1zdHJsZW4taW50ZXJjZXB0LW9wdGlvbmFsLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBiNDA3NTE0YWExYTRmZDM2NjdiMzA1MjcyNjBlMjcxZGEzNGNl
NGE3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0ZGFhNTQ0ODU1NzYxZjUyM2FlNjBl
NWI3YzliYzg0NTAzMDZmOGFhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmUg
TWNDdXJkeSA8YXJtY2N1cmR5QGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMTMgRGVjIDIwMTYgMTE6
Mjk6NTUgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gbWFrZSBsZC1YWFguc28gc3RybGVuIGludGVy
Y2VwdCBvcHRpb25hbApAQCAtMTcsNyArMTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBKYWNraWUgSHVh
bmcgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb3JlZ3JpbmQvbV9yZWRp
ci5jIGIvY29yZWdyaW5kL21fcmVkaXIuYwotaW5kZXggNjMxNzJiOS4uMWI1YmY5NSAxMDA2NDQK
K2luZGV4IGUwZjU5NmYuLjQ2MzE1NjQgMTAwNjQ0CiAtLS0gYS9jb3JlZ3JpbmQvbV9yZWRpci5j
CiArKysgYi9jb3JlZ3JpbmQvbV9yZWRpci5jCiBAQCAtMTMyMSw3ICsxMzIxLDE4IEBAIHN0YXRp
YyB2b2lkIGFkZF9oYXJkd2lyZWRfc3BlYyAoY29uc3QgIEhDaGFyKiBzb3BhdHQsIGNvbnN0IEhD
aGFyKiBmbnBhdHQsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQv
dmFsZ3JpbmRfMy4yNS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdy
aW5kXzMuMjUuMS5iYgpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYThiMGJlNTc2Ny4u
MDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmRf
My4yNS4xLmJiCisrKyAvZGV2L251bGwKQEAgLTEsMTE2ICswLDAgQEAKLVNVTU1BUlkgPSAiVmFs
Z3JpbmQgbWVtb3J5IGRlYnVnZ2VyIGFuZCBpbnN0cnVtZW50YXRpb24gZnJhbWV3b3JrIgotSE9N
RVBBR0UgPSAiaHR0cDovL3ZhbGdyaW5kLm9yZy8iCi1ERVNDUklQVElPTiA9ICJWYWxncmluZCBp
cyBhbiBpbnN0cnVtZW50YXRpb24gZnJhbWV3b3JrIGZvciBidWlsZGluZyBkeW5hbWljIGFuYWx5
c2lzIHRvb2xzLiBUaGVyZSBhcmUgVmFsZ3JpbmQgdG9vbHMgdGhhdCBjYW4gYXV0b21hdGljYWxs
eSBkZXRlY3QgbWFueSBtZW1vcnkgbWFuYWdlbWVudCBhbmQgdGhyZWFkaW5nIGJ1Z3MsIGFuZCBw
cm9maWxlIHlvdXIgcHJvZ3JhbXMgaW4gZGV0YWlsLiIKLUJVR1RSQUNLRVIgPSAiaHR0cDovL3Zh
bGdyaW5kLm9yZy9zdXBwb3J0L2J1Z19yZXBvcnRzLmh0bWwiCi1MSUNFTlNFID0gIkdQTC0yLjAt
b25seSAmIEdQTC0yLjAtb3ItbGF0ZXIgJiBCU0QtMy1DbGF1c2UiCi1MSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyBc
Ci0gICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9pbmNsdWRlL3B1Yl90b29sX2Jhc2ljcy5oO2Jl
Z2lubGluZT02O2VuZGxpbmU9Mjk7bWQ1PTQxYzQxMGU4ZDNmMzA1YWVlN2FhYTY2NmIyZTRmMzY2
IFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL2luY2x1ZGUvdmFsZ3JpbmQuaDtiZWdpbmxp
bmU9MTtlbmRsaW5lPTU2O21kNT1hZDNiMzE3ZjMyODZiNmI3MDQ1NzVkOWVmZTZjYTVkZiBcCi0g
ICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HLkRPQ1M7bWQ1PTI0ZWE0YzcwOTIyMzM4
NDliNDM5NDY5OTMzM2I1YzU2IgotCi1TUkNfVVJJID0gImh0dHBzOi8vc291cmNld2FyZS5vcmcv
cHViL3ZhbGdyaW5kL3ZhbGdyaW5kLSR7UFZ9LnRhci5iejIgXAotICAgICAgICAgICBmaWxlOi8v
Zml4ZWQtcGVybC1wYXRoLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL0FkZGVkLXN1cHBvcnQt
Zm9yLVBQQy1pbnN0cnVjdGlvbnMtbWZhdGJ1LW1mYXRibC5wYXRjaCBcCi0gICAgICAgICAgIGZp
bGU6Ly91c2UtYXBwcm9wcmlhdGUtbWFyY2gtbWNwdS1tZnB1LWZvci1BUk0tdGVzdC1hcHBzLnBh
dGNoIFwKLSAgICAgICAgICAgZmlsZTovL2F2b2lkLW5lb24tZm9yLXRhcmdldHMtd2hpY2gtZG9u
LXQtc3VwcG9ydC1pdC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWNvbmZpZ3VyZS1E
cm9wLXNldHRpbmctbWNwdS1jb3J0ZXgtYTgtb24tYXJtLnBhdGNoIFwKLSAgICAgICAgICAgZmls
ZTovL3ZhbGdyaW5kLW1ha2UtbGQtWFhYLnNvLXN0cmxlbi1pbnRlcmNlcHQtb3B0aW9uYWwucGF0
Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1tYWtlZmlsZXMtRHJvcC1zZXR0aW5nLW1jcHUt
dG8tY29ydGV4LWE4LW9uLWFybS1hcmNoLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEt
c2lncXVldWUtUmVuYW1lLV9zaWZpZWxkcy10by1fX3NpX2ZpZWxkcy1vbi1tdXNsLnBhdGNoIFwK
LSAgICAgICAgICAgZmlsZTovLzAwMDMtY29ycmVjdC1pbmNsdWRlLWRpcmVjdGl2ZS1wYXRoLWZv
ci1jb25maWcuaC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLXZhbGdyaW5kLWZpbHRl
cl94bWxfZnJhbWVzLWRvLW5vdC1maWx0ZXItdXNyLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTov
LzAwMDEtbWVtY2hlY2stdmd0ZXN0cy1yZW1vdmUtZnVsbHBhdGgtYWZ0ZXItZmxhZ3MucGF0Y2gg
XAotICAgICAgICAgICBmaWxlOi8vczM5MHhfdmVjX29wX3QucGF0Y2ggXAotICAgICAgICAgICBm
aWxlOi8vMDAwMS1ub25lLXRlc3RzLWZkbGVha19jbXNnLnN0ZGVyci5leHAtYWRqdXN0LXRtcC1w
YXRocy5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLW1lbWNoZWNrLXRlc3RzLUZpeC10
aW1lcmZkLXN5c2NhbGwtdGVzdC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLWRvY3Mt
RGlzYWJsZS1tYW51YWwtdmFsaWRhdGlvbi5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAx
LXRlc3RzLWFybS1Vc2UtTy1pbnN0ZWFkLW9mLU8wLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTov
LzAwMDEtVXNlLXBvcnRhYmxlLXN5bnRheC1mb3ItcHVzaHNlY3Rpb24tZGlyZWN0aXZlLWluLWlu
bC5wYXRjaCBcCi0gICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2MWRlYjhkMDcy
N2I0NWMyNjhlZmRjMWIzYjZjOWU2NzljZDk3Y2JmNWVlNGIyOGQxZGVhZDdjOGI3YTI3MWFmIgot
VVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAidmFsZ3JpbmQtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50
YXIiCi0KLUNPTVBBVElCTEVfSE9TVCA9ICcoaS44Nnx4ODZfNjR8YXJtfGFhcmNoNjR8bWlwc3xw
b3dlcnBjfHBvd2VycGM2NHxyaXNjdjY0KS4qLWxpbnV4JwotCi0jIHZhbGdyaW5kIHN1cHBvcnRz
IGFybXY3IGFuZCBhYm92ZQotQ09NUEFUSUJMRV9IT1NUOmFybXY0ID0gJ251bGwnCi1DT01QQVRJ
QkxFX0hPU1Q6YXJtdjUgPSAnbnVsbCcKLUNPTVBBVElCTEVfSE9TVDphcm12NiA9ICdudWxsJwot
Ci0jIHZhbGdyaW5kIGZhaWxzIHdpdGggcG93ZXJwYyBzb2Z0LWZsb2F0Ci1DT01QQVRJQkxFX0hP
U1Q6cG93ZXJwYyA9ICIke0BiYi51dGlscy5jb250YWlucygnVEFSR0VUX0ZQVScsICdzb2Z0Jywg
J251bGwnLCAnLiotbGludXgnLCBkKX0iCi0KLSMgWDMyIGlzbid0IHN1cHBvcnRlZCBieSB2YWxn
cmluZCBhdCB0aGlzIHRpbWUKLUNPTVBBVElCTEVfSE9TVDpsaW51eC1nbnV4MzIgPSAnbnVsbCcK
LUNPTVBBVElCTEVfSE9TVDpsaW51eC1tdXNseDMyID0gJ251bGwnCi0KLSMgRGlzYWJsZSBmb3Ig
c29tZSBNSVBTIHZhcmlhbnRzCi1DT01QQVRJQkxFX0hPU1Q6bWlwc2FyY2hyNiA9ICdudWxsJwot
Q09NUEFUSUJMRV9IT1NUOmxpbnV4LWdudW4zMiA9ICdudWxsJwotCi0jIERpc2FibGUgZm9yIHBv
d2VycGM2NCB3aXRoIG11c2wKLUNPTVBBVElCTEVfSE9TVDpsaWJjLW11c2w6cG93ZXJwYzY0ID0g
J251bGwnCi0KLWluaGVyaXQgYXV0b3Rvb2xzLWJyb2tlbnNlcCBtdWx0aWxpYl9oZWFkZXIKLQot
RVhUUkFfT0VDT05GID0gIi0tZW5hYmxlLXRscyAtLXdpdGhvdXQtbXBpY2MiCi1FWFRSQV9PRUNP
TkYgKz0gIiR7QFsnLS1lbmFibGUtb25seTMyYml0JywnLS1lbmFibGUtb25seTY0Yml0J11bZC5n
ZXRWYXIoJ1NJVEVJTkZPX0JJVFMnKSAhPSAnMzInXX0iCi0KLSMgdmFsZ3JpbmQgY2hlY2tzIGhv
c3RfY3B1ICJhcm12NyopIiwgc28gd2UgbmVlZCB0byBvdmVyLXJpZGUgdGhlIGF1dG90b29scy5i
YmNsYXNzIGRlZmF1bHQgLS1ob3N0IG9wdGlvbgotRVhUUkFfT0VDT05GOmFwcGVuZDphcm0gPSAi
IC0taG9zdD1hcm12NyR7SE9TVF9WRU5ET1J9LSR7SE9TVF9PU30iCi0KLUVYVFJBX09FTUFLRSA9
ICItdyIKLQotQ0FDSEVEX0NPTkZJR1VSRVZBUlMgKz0gImFjX2N2X3BhdGhfUEVSTD0nL3Vzci9i
aW4vZW52IHBlcmwnIgotCi0jIHZhbGdyaW5kIGxpa2VzIHRvIGNvbnRyb2wgaXRzIG93biBvcHRp
bWlzYXRpb24gZmxhZ3MuIEl0IGdlbmVyYWxseSBkZWZhdWx0cwotIyB0byAtTzIgYnV0IHVzZXMg
LU8wIGZvciBzb21lIHNwZWNpZmljIHRlc3QgYXBwcyBldGMuIFBhc3Npbmcgb3VyIG93biBmbGFn
cwotIyAodmlhIENGTEFHUykgbWVhbnMgd2UgaW50ZXJmZXJlIHdpdGggdGhhdC4gT25seSBwYXNz
IERFQlVHX0ZMQUdTIHRvIGl0Ci0jIHdoaWNoIGZpeGVzIGJ1aWxkIHBhdGggaXNzdWUgaW4gRFdB
UkYuCi1TRUxFQ1RFRF9PUFRJTUlaQVRJT04gPSAiJHtERUJVR19MRVZFTEZMQUd9IgotCi0jIFNw
bGl0IG91dCB2YXJpb3VzIGhlbHBlciBzY3JpcHRzIHRvIHNlcGFyYXRlIHBhY2thZ2VzIHRvIGF2
b2lkIHRoZQotIyBtYWluIHBhY2thZ2UgZGVwZW5kaW5nIG9uIHBlcmwgYW5kIHB5dGhvbi4KLVBB
Q0tBR0VTID0rICIke1BOfS1jYWNoZWdyaW5kICR7UE59LW1hc3NpZiAke1BOfS1jYWxsZ3JpbmQi
Ci0KLUZJTEVTOiR7UE59LWNhY2hlZ3JpbmQgPSAiJHtiaW5kaXJ9L2NnXyoiCi1GSUxFUzoke1BO
fS1tYXNzaWYgPSAiJHtiaW5kaXJ9L21zXyoiCi1GSUxFUzoke1BOfS1jYWxsZ3JpbmQgPSAiJHti
aW5kaXJ9L2NhbGxncmluZF8qIgotCi1SREVQRU5EUzoke1BOfS1jYWNoZWdyaW5kID0gIiR7UE59
IHB5dGhvbjMtY29yZSIKLVJERVBFTkRTOiR7UE59LW1hc3NpZiA9ICIke1BOfSBwZXJsIgotUkRF
UEVORFM6JHtQTn0tY2FsbGdyaW5kID0gIiR7UE59IHBlcmwiCi0KLWRvX2NvbmZpZ3VyZTpwcmVw
ZW5kICgpIHsKLSAgICBybSAtcmYgJHtTfS9jb25maWcuaAotfQotCi1kb19pbnN0YWxsOmFwcGVu
ZCAoKSB7Ci0gICAgaW5zdGFsbCAtbSA2NDQgJHtCfS9kZWZhdWx0LnN1cHAgJHtEfS8ke2xpYmV4
ZWNkaXJ9L3ZhbGdyaW5kLwotICAgIG9lX211bHRpbGliX2hlYWRlciB2YWxncmluZC9jb25maWcu
aAotfQotCi1WQUxHUklOREFSQ0ggPz0gIiR7VEFSR0VUX0FSQ0h9IgotVkFMR1JJTkRBUkNIOmFh
cmNoNjQgPSAiYXJtNjQiCi1WQUxHUklOREFSQ0g6eDg2LTY0ID0gImFtZDY0IgotVkFMR1JJTkRB
UkNIOng4NiA9ICJ4ODYiCi1WQUxHUklOREFSQ0g6bWlwcyA9ICJtaXBzMzIiCi1WQUxHUklOREFS
Q0g6bWlwc2VsID0gIm1pcHMzMiIKLVZBTEdSSU5EQVJDSDptaXBzNjRlbCA9ICJtaXBzNjQiCi1W
QUxHUklOREFSQ0g6cG93ZXJwYyA9ICJwcGMiCi1WQUxHUklOREFSQ0g6cG93ZXJwYzY0ID0gInBw
YzY0IgotVkFMR1JJTkRBUkNIOnBvd2VycGM2NGxlID0gInBwYzY0bGUiCi0KLUlOSElCSVRfUEFD
S0FHRV9TVFJJUF9GSUxFUyA9ICIke1BLR0R9JHtsaWJleGVjZGlyfS92YWxncmluZC92Z3ByZWxv
YWRfbWVtY2hlY2stJHtWQUxHUklOREFSQ0h9LWxpbnV4LnNvIgotCi0jIHZhbGdyaW5kIG5lZWRz
IGRlYnVnIGluZm9ybWF0aW9uIGZvciBsZC5zbyBhdCBydW50aW1lIGluIG9yZGVyIHRvCi0jIHJl
ZGlyZWN0IGZ1bmN0aW9ucyBsaWtlIHN0cmxlbi4KLVJSRUNPTU1FTkRTOiR7UE59ICs9ICIke1RD
TElCQ30tZGJnIgotCi0jIFZhbGdyaW5kIG5lZWRzIGludHJpbnNpY3Mgd2hpY2ggYXJlIG5vdCBw
cm92aWRlZCBieSBjbGFuZwotIyBtX3NpZ25hbHMuYzoyMjEzOjc6IGVycm9yOiBfX2J1aWx0aW5f
bG9uZ2ptcCBpcyBub3Qgc3VwcG9ydGVkIGZvciB0aGUgY3VycmVudCB0YXJnZXQKLSMgMjIxMyB8
ICAgICAgIFZHX01JTklNQUxfTE9OR0pNUCh0c3QtPnNjaGVkX2ptcGJ1Zik7Ci0jICAgICAgfCAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Ci0jCi0jIEl0IG5lZWRz
IHNvbWV0aGluZyBsaWtlIC0gaHR0cHM6Ly9idWdzLmtkZS5vcmcvc2hvd19idWcuY2dpP2lkPTM2
OTcyMwotVE9PTENIQUlOOnJpc2N2NjQgPSAiZ2NjIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kXzMuMjYuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy92YWxncmluZC92YWxncmluZF8zLjI2LjAuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMC4uZTEyYmU1OWQzOQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy92YWxncmluZC92YWxncmluZF8zLjI2LjAuYmIKQEAgLTAsMCArMSwxMTE2IEBA
CisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQg
YnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2Ug
YmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0
ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMg
aW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChl
eGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisj
IFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtMSwy
ODEgKzEsNjIyIEBACisjICAgICAgICAgICAgICAgICAgICAgIEdOVSBHRU5FUkFMIFBVQkxJQyBM
SUNFTlNFCisjIC0gICAgICAgICAgICAgICAgICAgICAgIFZlcnNpb24gMiwgSnVuZSAxOTkxCisj
IC0KKyMgLSBDb3B5cmlnaHQgKEMpIDE5ODksIDE5OTEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9u
LCBJbmMuLAorIyAtIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEg
MDIxMTAtMTMwMSBVU0EKKyMgKyAgICAgICAgICAgICAgICAgICAgICAgVmVyc2lvbiAzLCAyOSBK
dW5lIDIwMDcKKyMgKworIyArIENvcHlyaWdodCAoQykgMjAwNyBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb24sIEluYy4gPGh0dHBzOi8vZnNmLm9yZy8+CisjICAgRXZlcnlvbmUgaXMgcGVybWl0dGVk
IHRvIGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29waWVzCisjICAgb2YgdGhpcyBsaWNl
bnNlIGRvY3VtZW50LCBidXQgY2hhbmdpbmcgaXQgaXMgbm90IGFsbG93ZWQuCisjICAKKyMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBQcmVhbWJsZQorIyAgCisjIC0gIFRoZSBsaWNlbnNl
cyBmb3IgbW9zdCBzb2Z0d2FyZSBhcmUgZGVzaWduZWQgdG8gdGFrZSBhd2F5IHlvdXIKKyMgLWZy
ZWVkb20gdG8gc2hhcmUgYW5kIGNoYW5nZSBpdC4gIEJ5IGNvbnRyYXN0LCB0aGUgR05VIEdlbmVy
YWwgUHVibGljCisjIC1MaWNlbnNlIGlzIGludGVuZGVkIHRvIGd1YXJhbnRlZSB5b3VyIGZyZWVk
b20gdG8gc2hhcmUgYW5kIGNoYW5nZSBmcmVlCisjIC1zb2Z0d2FyZS0tdG8gbWFrZSBzdXJlIHRo
ZSBzb2Z0d2FyZSBpcyBmcmVlIGZvciBhbGwgaXRzIHVzZXJzLiAgVGhpcworIyAtR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZSBhcHBsaWVzIHRvIG1vc3Qgb2YgdGhlIEZyZWUgU29mdHdhcmUKKyMgLUZv
dW5kYXRpb24ncyBzb2Z0d2FyZSBhbmQgdG8gYW55IG90aGVyIHByb2dyYW0gd2hvc2UgYXV0aG9y
cyBjb21taXQgdG8KKyMgLXVzaW5nIGl0LiAgKFNvbWUgb3RoZXIgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uIHNvZnR3YXJlIGlzIGNvdmVyZWQgYnkKKyMgLXRoZSBHTlUgTGVzc2VyIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgaW5zdGVhZC4pICBZb3UgY2FuIGFwcGx5IGl0IHRvCisjICsgIFRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBpcyBhIGZyZWUsIGNvcHlsZWZ0IGxpY2Vuc2UgZm9y
CisjICtzb2Z0d2FyZSBhbmQgb3RoZXIga2luZHMgb2Ygd29ya3MuCisjICsKKyMgKyAgVGhlIGxp
Y2Vuc2VzIGZvciBtb3N0IHNvZnR3YXJlIGFuZCBvdGhlciBwcmFjdGljYWwgd29ya3MgYXJlIGRl
c2lnbmVkCisjICt0byB0YWtlIGF3YXkgeW91ciBmcmVlZG9tIHRvIHNoYXJlIGFuZCBjaGFuZ2Ug
dGhlIHdvcmtzLiAgQnkgY29udHJhc3QsCisjICt0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UgaXMgaW50ZW5kZWQgdG8gZ3VhcmFudGVlIHlvdXIgZnJlZWRvbSB0bworIyArc2hhcmUgYW5k
IGNoYW5nZSBhbGwgdmVyc2lvbnMgb2YgYSBwcm9ncmFtLS10byBtYWtlIHN1cmUgaXQgcmVtYWlu
cyBmcmVlCisjICtzb2Z0d2FyZSBmb3IgYWxsIGl0cyB1c2Vycy4gIFdlLCB0aGUgRnJlZSBTb2Z0
d2FyZSBGb3VuZGF0aW9uLCB1c2UgdGhlCisjICtHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBm
b3IgbW9zdCBvZiBvdXIgc29mdHdhcmU7IGl0IGFwcGxpZXMgYWxzbyB0bworIyArYW55IG90aGVy
IHdvcmsgcmVsZWFzZWQgdGhpcyB3YXkgYnkgaXRzIGF1dGhvcnMuICBZb3UgY2FuIGFwcGx5IGl0
IHRvCisjICB5b3VyIHByb2dyYW1zLCB0b28uCisjICAKKyMgICAgV2hlbiB3ZSBzcGVhayBvZiBm
cmVlIHNvZnR3YXJlLCB3ZSBhcmUgcmVmZXJyaW5nIHRvIGZyZWVkb20sIG5vdAorIyAgcHJpY2Uu
ICBPdXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZXMgYXJlIGRlc2lnbmVkIHRvIG1ha2Ugc3VyZSB0
aGF0IHlvdQorIyAgaGF2ZSB0aGUgZnJlZWRvbSB0byBkaXN0cmlidXRlIGNvcGllcyBvZiBmcmVl
IHNvZnR3YXJlIChhbmQgY2hhcmdlIGZvcgorIyAtdGhpcyBzZXJ2aWNlIGlmIHlvdSB3aXNoKSwg
dGhhdCB5b3UgcmVjZWl2ZSBzb3VyY2UgY29kZSBvciBjYW4gZ2V0IGl0CisjIC1pZiB5b3Ugd2Fu
dCBpdCwgdGhhdCB5b3UgY2FuIGNoYW5nZSB0aGUgc29mdHdhcmUgb3IgdXNlIHBpZWNlcyBvZiBp
dAorIyAtaW4gbmV3IGZyZWUgcHJvZ3JhbXM7IGFuZCB0aGF0IHlvdSBrbm93IHlvdSBjYW4gZG8g
dGhlc2UgdGhpbmdzLgorIyAtCisjIC0gIFRvIHByb3RlY3QgeW91ciByaWdodHMsIHdlIG5lZWQg
dG8gbWFrZSByZXN0cmljdGlvbnMgdGhhdCBmb3JiaWQKKyMgLWFueW9uZSB0byBkZW55IHlvdSB0
aGVzZSByaWdodHMgb3IgdG8gYXNrIHlvdSB0byBzdXJyZW5kZXIgdGhlIHJpZ2h0cy4KKyMgLVRo
ZXNlIHJlc3RyaWN0aW9ucyB0cmFuc2xhdGUgdG8gY2VydGFpbiByZXNwb25zaWJpbGl0aWVzIGZv
ciB5b3UgaWYgeW91CisjIC1kaXN0cmlidXRlIGNvcGllcyBvZiB0aGUgc29mdHdhcmUsIG9yIGlm
IHlvdSBtb2RpZnkgaXQuCisjICt0aGVtIGlmIHlvdSB3aXNoKSwgdGhhdCB5b3UgcmVjZWl2ZSBz
b3VyY2UgY29kZSBvciBjYW4gZ2V0IGl0IGlmIHlvdQorIyArd2FudCBpdCwgdGhhdCB5b3UgY2Fu
IGNoYW5nZSB0aGUgc29mdHdhcmUgb3IgdXNlIHBpZWNlcyBvZiBpdCBpbiBuZXcKKyMgK2ZyZWUg
cHJvZ3JhbXMsIGFuZCB0aGF0IHlvdSBrbm93IHlvdSBjYW4gZG8gdGhlc2UgdGhpbmdzLgorIyAr
CisjICsgIFRvIHByb3RlY3QgeW91ciByaWdodHMsIHdlIG5lZWQgdG8gcHJldmVudCBvdGhlcnMg
ZnJvbSBkZW55aW5nIHlvdQorIyArdGhlc2UgcmlnaHRzIG9yIGFza2luZyB5b3UgdG8gc3VycmVu
ZGVyIHRoZSByaWdodHMuICBUaGVyZWZvcmUsIHlvdSBoYXZlCisjICtjZXJ0YWluIHJlc3BvbnNp
YmlsaXRpZXMgaWYgeW91IGRpc3RyaWJ1dGUgY29waWVzIG9mIHRoZSBzb2Z0d2FyZSwgb3IgaWYK
KyMgK3lvdSBtb2RpZnkgaXQ6IHJlc3BvbnNpYmlsaXRpZXMgdG8gcmVzcGVjdCB0aGUgZnJlZWRv
bSBvZiBvdGhlcnMuCisjICAKKyMgICAgRm9yIGV4YW1wbGUsIGlmIHlvdSBkaXN0cmlidXRlIGNv
cGllcyBvZiBzdWNoIGEgcHJvZ3JhbSwgd2hldGhlcgorIyAtZ3JhdGlzIG9yIGZvciBhIGZlZSwg
eW91IG11c3QgZ2l2ZSB0aGUgcmVjaXBpZW50cyBhbGwgdGhlIHJpZ2h0cyB0aGF0CisjIC15b3Ug
aGF2ZS4gIFlvdSBtdXN0IG1ha2Ugc3VyZSB0aGF0IHRoZXksIHRvbywgcmVjZWl2ZSBvciBjYW4g
Z2V0IHRoZQorIyAtc291cmNlIGNvZGUuICBBbmQgeW91IG11c3Qgc2hvdyB0aGVtIHRoZXNlIHRl
cm1zIHNvIHRoZXkga25vdyB0aGVpcgorIyAtcmlnaHRzLgorIyAtCisjIC0gIFdlIHByb3RlY3Qg
eW91ciByaWdodHMgd2l0aCB0d28gc3RlcHM6ICgxKSBjb3B5cmlnaHQgdGhlIHNvZnR3YXJlLCBh
bmQKKyMgLSgyKSBvZmZlciB5b3UgdGhpcyBsaWNlbnNlIHdoaWNoIGdpdmVzIHlvdSBsZWdhbCBw
ZXJtaXNzaW9uIHRvIGNvcHksCisjIC1kaXN0cmlidXRlIGFuZC9vciBtb2RpZnkgdGhlIHNvZnR3
YXJlLgorIyAtCisjIC0gIEFsc28sIGZvciBlYWNoIGF1dGhvcidzIHByb3RlY3Rpb24gYW5kIG91
cnMsIHdlIHdhbnQgdG8gbWFrZSBjZXJ0YWluCisjIC10aGF0IGV2ZXJ5b25lIHVuZGVyc3RhbmRz
IHRoYXQgdGhlcmUgaXMgbm8gd2FycmFudHkgZm9yIHRoaXMgZnJlZQorIyAtc29mdHdhcmUuICBJ
ZiB0aGUgc29mdHdhcmUgaXMgbW9kaWZpZWQgYnkgc29tZW9uZSBlbHNlIGFuZCBwYXNzZWQgb24s
IHdlCisjIC13YW50IGl0cyByZWNpcGllbnRzIHRvIGtub3cgdGhhdCB3aGF0IHRoZXkgaGF2ZSBp
cyBub3QgdGhlIG9yaWdpbmFsLCBzbworIyAtdGhhdCBhbnkgcHJvYmxlbXMgaW50cm9kdWNlZCBi
eSBvdGhlcnMgd2lsbCBub3QgcmVmbGVjdCBvbiB0aGUgb3JpZ2luYWwKKyMgLWF1dGhvcnMnIHJl
cHV0YXRpb25zLgorIyAtCisjIC0gIEZpbmFsbHksIGFueSBmcmVlIHByb2dyYW0gaXMgdGhyZWF0
ZW5lZCBjb25zdGFudGx5IGJ5IHNvZnR3YXJlCisjIC1wYXRlbnRzLiAgV2Ugd2lzaCB0byBhdm9p
ZCB0aGUgZGFuZ2VyIHRoYXQgcmVkaXN0cmlidXRvcnMgb2YgYSBmcmVlCisjIC1wcm9ncmFtIHdp
bGwgaW5kaXZpZHVhbGx5IG9idGFpbiBwYXRlbnQgbGljZW5zZXMsIGluIGVmZmVjdCBtYWtpbmcg
dGhlCisjIC1wcm9ncmFtIHByb3ByaWV0YXJ5LiAgVG8gcHJldmVudCB0aGlzLCB3ZSBoYXZlIG1h
ZGUgaXQgY2xlYXIgdGhhdCBhbnkKKyMgLXBhdGVudCBtdXN0IGJlIGxpY2Vuc2VkIGZvciBldmVy
eW9uZSdzIGZyZWUgdXNlIG9yIG5vdCBsaWNlbnNlZCBhdCBhbGwuCisjICtncmF0aXMgb3IgZm9y
IGEgZmVlLCB5b3UgbXVzdCBwYXNzIG9uIHRvIHRoZSByZWNpcGllbnRzIHRoZSBzYW1lCisjICtm
cmVlZG9tcyB0aGF0IHlvdSByZWNlaXZlZC4gIFlvdSBtdXN0IG1ha2Ugc3VyZSB0aGF0IHRoZXks
IHRvbywgcmVjZWl2ZQorIyArb3IgY2FuIGdldCB0aGUgc291cmNlIGNvZGUuICBBbmQgeW91IG11
c3Qgc2hvdyB0aGVtIHRoZXNlIHRlcm1zIHNvIHRoZXkKKyMgK2tub3cgdGhlaXIgcmlnaHRzLgor
IyArCisjICsgIERldmVsb3BlcnMgdGhhdCB1c2UgdGhlIEdOVSBHUEwgcHJvdGVjdCB5b3VyIHJp
Z2h0cyB3aXRoIHR3byBzdGVwczoKKyMgKygxKSBhc3NlcnQgY29weXJpZ2h0IG9uIHRoZSBzb2Z0
d2FyZSwgYW5kICgyKSBvZmZlciB5b3UgdGhpcyBMaWNlbnNlCisjICtnaXZpbmcgeW91IGxlZ2Fs
IHBlcm1pc3Npb24gdG8gY29weSwgZGlzdHJpYnV0ZSBhbmQvb3IgbW9kaWZ5IGl0LgorIyArCisj
ICsgIEZvciB0aGUgZGV2ZWxvcGVycycgYW5kIGF1dGhvcnMnIHByb3RlY3Rpb24sIHRoZSBHUEwg
Y2xlYXJseSBleHBsYWlucworIyArdGhhdCB0aGVyZSBpcyBubyB3YXJyYW50eSBmb3IgdGhpcyBm
cmVlIHNvZnR3YXJlLiAgRm9yIGJvdGggdXNlcnMnIGFuZAorIyArYXV0aG9ycycgc2FrZSwgdGhl
IEdQTCByZXF1aXJlcyB0aGF0IG1vZGlmaWVkIHZlcnNpb25zIGJlIG1hcmtlZCBhcworIyArY2hh
bmdlZCwgc28gdGhhdCB0aGVpciBwcm9ibGVtcyB3aWxsIG5vdCBiZSBhdHRyaWJ1dGVkIGVycm9u
ZW91c2x5IHRvCisjICthdXRob3JzIG9mIHByZXZpb3VzIHZlcnNpb25zLgorIyArCisjICsgIFNv
bWUgZGV2aWNlcyBhcmUgZGVzaWduZWQgdG8gZGVueSB1c2VycyBhY2Nlc3MgdG8gaW5zdGFsbCBv
ciBydW4KKyMgK21vZGlmaWVkIHZlcnNpb25zIG9mIHRoZSBzb2Z0d2FyZSBpbnNpZGUgdGhlbSwg
YWx0aG91Z2ggdGhlIG1hbnVmYWN0dXJlcgorIyArY2FuIGRvIHNvLiAgVGhpcyBpcyBmdW5kYW1l
bnRhbGx5IGluY29tcGF0aWJsZSB3aXRoIHRoZSBhaW0gb2YKKyMgK3Byb3RlY3RpbmcgdXNlcnMn
IGZyZWVkb20gdG8gY2hhbmdlIHRoZSBzb2Z0d2FyZS4gIFRoZSBzeXN0ZW1hdGljCisjICtwYXR0
ZXJuIG9mIHN1Y2ggYWJ1c2Ugb2NjdXJzIGluIHRoZSBhcmVhIG9mIHByb2R1Y3RzIGZvciBpbmRp
dmlkdWFscyB0bworIyArdXNlLCB3aGljaCBpcyBwcmVjaXNlbHkgd2hlcmUgaXQgaXMgbW9zdCB1
bmFjY2VwdGFibGUuICBUaGVyZWZvcmUsIHdlCisjICtoYXZlIGRlc2lnbmVkIHRoaXMgdmVyc2lv
biBvZiB0aGUgR1BMIHRvIHByb2hpYml0IHRoZSBwcmFjdGljZSBmb3IgdGhvc2UKKyMgK3Byb2R1
Y3RzLiAgSWYgc3VjaCBwcm9ibGVtcyBhcmlzZSBzdWJzdGFudGlhbGx5IGluIG90aGVyIGRvbWFp
bnMsIHdlCisjICtzdGFuZCByZWFkeSB0byBleHRlbmQgdGhpcyBwcm92aXNpb24gdG8gdGhvc2Ug
ZG9tYWlucyBpbiBmdXR1cmUgdmVyc2lvbnMKKyMgK29mIHRoZSBHUEwsIGFzIG5lZWRlZCB0byBw
cm90ZWN0IHRoZSBmcmVlZG9tIG9mIHVzZXJzLgorIyArCisjICsgIEZpbmFsbHksIGV2ZXJ5IHBy
b2dyYW0gaXMgdGhyZWF0ZW5lZCBjb25zdGFudGx5IGJ5IHNvZnR3YXJlIHBhdGVudHMuCisjICtT
dGF0ZXMgc2hvdWxkIG5vdCBhbGxvdyBwYXRlbnRzIHRvIHJlc3RyaWN0IGRldmVsb3BtZW50IGFu
ZCB1c2Ugb2YKKyMgK3NvZnR3YXJlIG9uIGdlbmVyYWwtcHVycG9zZSBjb21wdXRlcnMsIGJ1dCBp
biB0aG9zZSB0aGF0IGRvLCB3ZSB3aXNoIHRvCisjICthdm9pZCB0aGUgc3BlY2lhbCBkYW5nZXIg
dGhhdCBwYXRlbnRzIGFwcGxpZWQgdG8gYSBmcmVlIHByb2dyYW0gY291bGQKKyMgK21ha2UgaXQg
ZWZmZWN0aXZlbHkgcHJvcHJpZXRhcnkuICBUbyBwcmV2ZW50IHRoaXMsIHRoZSBHUEwgYXNzdXJl
cyB0aGF0CisjICtwYXRlbnRzIGNhbm5vdCBiZSB1c2VkIHRvIHJlbmRlciB0aGUgcHJvZ3JhbSBu
b24tZnJlZS4KKyMgIAorIyAgICBUaGUgcHJlY2lzZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBmb3Ig
Y29weWluZywgZGlzdHJpYnV0aW9uIGFuZAorIyAgbW9kaWZpY2F0aW9uIGZvbGxvdy4KKyMgIAor
IyAtICAgICAgICAgICAgICAgICAgICBHTlUgR0VORVJBTCBQVUJMSUMgTElDRU5TRQorIyAtICAg
VEVSTVMgQU5EIENPTkRJVElPTlMgRk9SIENPUFlJTkcsIERJU1RSSUJVVElPTiBBTkQgTU9ESUZJ
Q0FUSU9OCisjIC0KKyMgLSAgMC4gVGhpcyBMaWNlbnNlIGFwcGxpZXMgdG8gYW55IHByb2dyYW0g
b3Igb3RoZXIgd29yayB3aGljaCBjb250YWlucworIyAtYSBub3RpY2UgcGxhY2VkIGJ5IHRoZSBj
b3B5cmlnaHQgaG9sZGVyIHNheWluZyBpdCBtYXkgYmUgZGlzdHJpYnV0ZWQKKyMgLXVuZGVyIHRo
ZSB0ZXJtcyBvZiB0aGlzIEdlbmVyYWwgUHVibGljIExpY2Vuc2UuICBUaGUgIlByb2dyYW0iLCBi
ZWxvdywKKyMgLXJlZmVycyB0byBhbnkgc3VjaCBwcm9ncmFtIG9yIHdvcmssIGFuZCBhICJ3b3Jr
IGJhc2VkIG9uIHRoZSBQcm9ncmFtIgorIyAtbWVhbnMgZWl0aGVyIHRoZSBQcm9ncmFtIG9yIGFu
eSBkZXJpdmF0aXZlIHdvcmsgdW5kZXIgY29weXJpZ2h0IGxhdzoKKyMgLXRoYXQgaXMgdG8gc2F5
LCBhIHdvcmsgY29udGFpbmluZyB0aGUgUHJvZ3JhbSBvciBhIHBvcnRpb24gb2YgaXQsCisjIC1l
aXRoZXIgdmVyYmF0aW0gb3Igd2l0aCBtb2RpZmljYXRpb25zIGFuZC9vciB0cmFuc2xhdGVkIGlu
dG8gYW5vdGhlcgorIyAtbGFuZ3VhZ2UuICAoSGVyZWluYWZ0ZXIsIHRyYW5zbGF0aW9uIGlzIGlu
Y2x1ZGVkIHdpdGhvdXQgbGltaXRhdGlvbiBpbgorIyAtdGhlIHRlcm0gIm1vZGlmaWNhdGlvbiIu
KSAgRWFjaCBsaWNlbnNlZSBpcyBhZGRyZXNzZWQgYXMgInlvdSIuCisjIC0KKyMgLUFjdGl2aXRp
ZXMgb3RoZXIgdGhhbiBjb3B5aW5nLCBkaXN0cmlidXRpb24gYW5kIG1vZGlmaWNhdGlvbiBhcmUg
bm90CisjIC1jb3ZlcmVkIGJ5IHRoaXMgTGljZW5zZTsgdGhleSBhcmUgb3V0c2lkZSBpdHMgc2Nv
cGUuICBUaGUgYWN0IG9mCisjIC1ydW5uaW5nIHRoZSBQcm9ncmFtIGlzIG5vdCByZXN0cmljdGVk
LCBhbmQgdGhlIG91dHB1dCBmcm9tIHRoZSBQcm9ncmFtCisjIC1pcyBjb3ZlcmVkIG9ubHkgaWYg
aXRzIGNvbnRlbnRzIGNvbnN0aXR1dGUgYSB3b3JrIGJhc2VkIG9uIHRoZQorIyAtUHJvZ3JhbSAo
aW5kZXBlbmRlbnQgb2YgaGF2aW5nIGJlZW4gbWFkZSBieSBydW5uaW5nIHRoZSBQcm9ncmFtKS4K
KyMgLVdoZXRoZXIgdGhhdCBpcyB0cnVlIGRlcGVuZHMgb24gd2hhdCB0aGUgUHJvZ3JhbSBkb2Vz
LgorIyAtCisjIC0gIDEuIFlvdSBtYXkgY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3Bp
ZXMgb2YgdGhlIFByb2dyYW0ncworIyAtc291cmNlIGNvZGUgYXMgeW91IHJlY2VpdmUgaXQsIGlu
IGFueSBtZWRpdW0sIHByb3ZpZGVkIHRoYXQgeW91CisjIC1jb25zcGljdW91c2x5IGFuZCBhcHBy
b3ByaWF0ZWx5IHB1Ymxpc2ggb24gZWFjaCBjb3B5IGFuIGFwcHJvcHJpYXRlCisjIC1jb3B5cmln
aHQgbm90aWNlIGFuZCBkaXNjbGFpbWVyIG9mIHdhcnJhbnR5OyBrZWVwIGludGFjdCBhbGwgdGhl
CisjIC1ub3RpY2VzIHRoYXQgcmVmZXIgdG8gdGhpcyBMaWNlbnNlIGFuZCB0byB0aGUgYWJzZW5j
ZSBvZiBhbnkgd2FycmFudHk7CisjIC1hbmQgZ2l2ZSBhbnkgb3RoZXIgcmVjaXBpZW50cyBvZiB0
aGUgUHJvZ3JhbSBhIGNvcHkgb2YgdGhpcyBMaWNlbnNlCisjIC1hbG9uZyB3aXRoIHRoZSBQcm9n
cmFtLgorIyAtCisjIC1Zb3UgbWF5IGNoYXJnZSBhIGZlZSBmb3IgdGhlIHBoeXNpY2FsIGFjdCBv
ZiB0cmFuc2ZlcnJpbmcgYSBjb3B5LCBhbmQKKyMgLXlvdSBtYXkgYXQgeW91ciBvcHRpb24gb2Zm
ZXIgd2FycmFudHkgcHJvdGVjdGlvbiBpbiBleGNoYW5nZSBmb3IgYSBmZWUuCisjIC0KKyMgLSAg
Mi4gWW91IG1heSBtb2RpZnkgeW91ciBjb3B5IG9yIGNvcGllcyBvZiB0aGUgUHJvZ3JhbSBvciBh
bnkgcG9ydGlvbgorIyAtb2YgaXQsIHRodXMgZm9ybWluZyBhIHdvcmsgYmFzZWQgb24gdGhlIFBy
b2dyYW0sIGFuZCBjb3B5IGFuZAorIyAtZGlzdHJpYnV0ZSBzdWNoIG1vZGlmaWNhdGlvbnMgb3Ig
d29yayB1bmRlciB0aGUgdGVybXMgb2YgU2VjdGlvbiAxCisjIC1hYm92ZSwgcHJvdmlkZWQgdGhh
dCB5b3UgYWxzbyBtZWV0IGFsbCBvZiB0aGVzZSBjb25kaXRpb25zOgorIyAtCisjIC0gICAgYSkg
WW91IG11c3QgY2F1c2UgdGhlIG1vZGlmaWVkIGZpbGVzIHRvIGNhcnJ5IHByb21pbmVudCBub3Rp
Y2VzCisjIC0gICAgc3RhdGluZyB0aGF0IHlvdSBjaGFuZ2VkIHRoZSBmaWxlcyBhbmQgdGhlIGRh
dGUgb2YgYW55IGNoYW5nZS4KKyMgLQorIyAtICAgIGIpIFlvdSBtdXN0IGNhdXNlIGFueSB3b3Jr
IHRoYXQgeW91IGRpc3RyaWJ1dGUgb3IgcHVibGlzaCwgdGhhdCBpbgorIyAtICAgIHdob2xlIG9y
IGluIHBhcnQgY29udGFpbnMgb3IgaXMgZGVyaXZlZCBmcm9tIHRoZSBQcm9ncmFtIG9yIGFueQor
IyAtICAgIHBhcnQgdGhlcmVvZiwgdG8gYmUgbGljZW5zZWQgYXMgYSB3aG9sZSBhdCBubyBjaGFy
Z2UgdG8gYWxsIHRoaXJkCisjIC0gICAgcGFydGllcyB1bmRlciB0aGUgdGVybXMgb2YgdGhpcyBM
aWNlbnNlLgorIyAtCisjIC0gICAgYykgSWYgdGhlIG1vZGlmaWVkIHByb2dyYW0gbm9ybWFsbHkg
cmVhZHMgY29tbWFuZHMgaW50ZXJhY3RpdmVseQorIyAtICAgIHdoZW4gcnVuLCB5b3UgbXVzdCBj
YXVzZSBpdCwgd2hlbiBzdGFydGVkIHJ1bm5pbmcgZm9yIHN1Y2gKKyMgLSAgICBpbnRlcmFjdGl2
ZSB1c2UgaW4gdGhlIG1vc3Qgb3JkaW5hcnkgd2F5LCB0byBwcmludCBvciBkaXNwbGF5IGFuCisj
IC0gICAgYW5ub3VuY2VtZW50IGluY2x1ZGluZyBhbiBhcHByb3ByaWF0ZSBjb3B5cmlnaHQgbm90
aWNlIGFuZCBhCisjIC0gICAgbm90aWNlIHRoYXQgdGhlcmUgaXMgbm8gd2FycmFudHkgKG9yIGVs
c2UsIHNheWluZyB0aGF0IHlvdSBwcm92aWRlCisjIC0gICAgYSB3YXJyYW50eSkgYW5kIHRoYXQg
dXNlcnMgbWF5IHJlZGlzdHJpYnV0ZSB0aGUgcHJvZ3JhbSB1bmRlcgorIyAtICAgIHRoZXNlIGNv
bmRpdGlvbnMsIGFuZCB0ZWxsaW5nIHRoZSB1c2VyIGhvdyB0byB2aWV3IGEgY29weSBvZiB0aGlz
CisjIC0gICAgTGljZW5zZS4gIChFeGNlcHRpb246IGlmIHRoZSBQcm9ncmFtIGl0c2VsZiBpcyBp
bnRlcmFjdGl2ZSBidXQKKyMgLSAgICBkb2VzIG5vdCBub3JtYWxseSBwcmludCBzdWNoIGFuIGFu
bm91bmNlbWVudCwgeW91ciB3b3JrIGJhc2VkIG9uCisjIC0gICAgdGhlIFByb2dyYW0gaXMgbm90
IHJlcXVpcmVkIHRvIHByaW50IGFuIGFubm91bmNlbWVudC4pCisjIC0KKyMgLVRoZXNlIHJlcXVp
cmVtZW50cyBhcHBseSB0byB0aGUgbW9kaWZpZWQgd29yayBhcyBhIHdob2xlLiAgSWYKKyMgLWlk
ZW50aWZpYWJsZSBzZWN0aW9ucyBvZiB0aGF0IHdvcmsgYXJlIG5vdCBkZXJpdmVkIGZyb20gdGhl
IFByb2dyYW0sCisjIC1hbmQgY2FuIGJlIHJlYXNvbmFibHkgY29uc2lkZXJlZCBpbmRlcGVuZGVu
dCBhbmQgc2VwYXJhdGUgd29ya3MgaW4KKyMgLXRoZW1zZWx2ZXMsIHRoZW4gdGhpcyBMaWNlbnNl
LCBhbmQgaXRzIHRlcm1zLCBkbyBub3QgYXBwbHkgdG8gdGhvc2UKKyMgLXNlY3Rpb25zIHdoZW4g
eW91IGRpc3RyaWJ1dGUgdGhlbSBhcyBzZXBhcmF0ZSB3b3Jrcy4gIEJ1dCB3aGVuIHlvdQorIyAt
ZGlzdHJpYnV0ZSB0aGUgc2FtZSBzZWN0aW9ucyBhcyBwYXJ0IG9mIGEgd2hvbGUgd2hpY2ggaXMg
YSB3b3JrIGJhc2VkCisjIC1vbiB0aGUgUHJvZ3JhbSwgdGhlIGRpc3RyaWJ1dGlvbiBvZiB0aGUg
d2hvbGUgbXVzdCBiZSBvbiB0aGUgdGVybXMgb2YKKyMgLXRoaXMgTGljZW5zZSwgd2hvc2UgcGVy
bWlzc2lvbnMgZm9yIG90aGVyIGxpY2Vuc2VlcyBleHRlbmQgdG8gdGhlCisjIC1lbnRpcmUgd2hv
bGUsIGFuZCB0aHVzIHRvIGVhY2ggYW5kIGV2ZXJ5IHBhcnQgcmVnYXJkbGVzcyBvZiB3aG8gd3Jv
dGUgaXQuCisjIC0KKyMgLVRodXMsIGl0IGlzIG5vdCB0aGUgaW50ZW50IG9mIHRoaXMgc2VjdGlv
biB0byBjbGFpbSByaWdodHMgb3IgY29udGVzdAorIyAteW91ciByaWdodHMgdG8gd29yayB3cml0
dGVuIGVudGlyZWx5IGJ5IHlvdTsgcmF0aGVyLCB0aGUgaW50ZW50IGlzIHRvCisjIC1leGVyY2lz
ZSB0aGUgcmlnaHQgdG8gY29udHJvbCB0aGUgZGlzdHJpYnV0aW9uIG9mIGRlcml2YXRpdmUgb3IK
KyMgLWNvbGxlY3RpdmUgd29ya3MgYmFzZWQgb24gdGhlIFByb2dyYW0uCisjIC0KKyMgLUluIGFk
ZGl0aW9uLCBtZXJlIGFnZ3JlZ2F0aW9uIG9mIGFub3RoZXIgd29yayBub3QgYmFzZWQgb24gdGhl
IFByb2dyYW0KKyMgLXdpdGggdGhlIFByb2dyYW0gKG9yIHdpdGggYSB3b3JrIGJhc2VkIG9uIHRo
ZSBQcm9ncmFtKSBvbiBhIHZvbHVtZSBvZgorIyAtYSBzdG9yYWdlIG9yIGRpc3RyaWJ1dGlvbiBt
ZWRpdW0gZG9lcyBub3QgYnJpbmcgdGhlIG90aGVyIHdvcmsgdW5kZXIKKyMgLXRoZSBzY29wZSBv
ZiB0aGlzIExpY2Vuc2UuCisjIC0KKyMgLSAgMy4gWW91IG1heSBjb3B5IGFuZCBkaXN0cmlidXRl
IHRoZSBQcm9ncmFtIChvciBhIHdvcmsgYmFzZWQgb24gaXQsCisjIC11bmRlciBTZWN0aW9uIDIp
IGluIG9iamVjdCBjb2RlIG9yIGV4ZWN1dGFibGUgZm9ybSB1bmRlciB0aGUgdGVybXMgb2YKKyMg
LVNlY3Rpb25zIDEgYW5kIDIgYWJvdmUgcHJvdmlkZWQgdGhhdCB5b3UgYWxzbyBkbyBvbmUgb2Yg
dGhlIGZvbGxvd2luZzoKKyMgLQorIyAtICAgIGEpIEFjY29tcGFueSBpdCB3aXRoIHRoZSBjb21w
bGV0ZSBjb3JyZXNwb25kaW5nIG1hY2hpbmUtcmVhZGFibGUKKyMgLSAgICBzb3VyY2UgY29kZSwg
d2hpY2ggbXVzdCBiZSBkaXN0cmlidXRlZCB1bmRlciB0aGUgdGVybXMgb2YgU2VjdGlvbnMKKyMg
LSAgICAxIGFuZCAyIGFib3ZlIG9uIGEgbWVkaXVtIGN1c3RvbWFyaWx5IHVzZWQgZm9yIHNvZnR3
YXJlIGludGVyY2hhbmdlOyBvciwKKyMgLQorIyAtICAgIGIpIEFjY29tcGFueSBpdCB3aXRoIGEg
d3JpdHRlbiBvZmZlciwgdmFsaWQgZm9yIGF0IGxlYXN0IHRocmVlCisjIC0gICAgeWVhcnMsIHRv
IGdpdmUgYW55IHRoaXJkIHBhcnR5LCBmb3IgYSBjaGFyZ2Ugbm8gbW9yZSB0aGFuIHlvdXIKKyMg
LSAgICBjb3N0IG9mIHBoeXNpY2FsbHkgcGVyZm9ybWluZyBzb3VyY2UgZGlzdHJpYnV0aW9uLCBh
IGNvbXBsZXRlCisjIC0gICAgbWFjaGluZS1yZWFkYWJsZSBjb3B5IG9mIHRoZSBjb3JyZXNwb25k
aW5nIHNvdXJjZSBjb2RlLCB0byBiZQorIyAtICAgIGRpc3RyaWJ1dGVkIHVuZGVyIHRoZSB0ZXJt
cyBvZiBTZWN0aW9ucyAxIGFuZCAyIGFib3ZlIG9uIGEgbWVkaXVtCisjIC0gICAgY3VzdG9tYXJp
bHkgdXNlZCBmb3Igc29mdHdhcmUgaW50ZXJjaGFuZ2U7IG9yLAorIyAtCisjIC0gICAgYykgQWNj
b21wYW55IGl0IHdpdGggdGhlIGluZm9ybWF0aW9uIHlvdSByZWNlaXZlZCBhcyB0byB0aGUgb2Zm
ZXIKKyMgLSAgICB0byBkaXN0cmlidXRlIGNvcnJlc3BvbmRpbmcgc291cmNlIGNvZGUuICAoVGhp
cyBhbHRlcm5hdGl2ZSBpcworIyAtICAgIGFsbG93ZWQgb25seSBmb3Igbm9uY29tbWVyY2lhbCBk
aXN0cmlidXRpb24gYW5kIG9ubHkgaWYgeW91CisjIC0gICAgcmVjZWl2ZWQgdGhlIHByb2dyYW0g
aW4gb2JqZWN0IGNvZGUgb3IgZXhlY3V0YWJsZSBmb3JtIHdpdGggc3VjaAorIyAtICAgIGFuIG9m
ZmVyLCBpbiBhY2NvcmQgd2l0aCBTdWJzZWN0aW9uIGIgYWJvdmUuKQorIyAtCisjIC1UaGUgc291
cmNlIGNvZGUgZm9yIGEgd29yayBtZWFucyB0aGUgcHJlZmVycmVkIGZvcm0gb2YgdGhlIHdvcmsg
Zm9yCisjIC1tYWtpbmcgbW9kaWZpY2F0aW9ucyB0byBpdC4gIEZvciBhbiBleGVjdXRhYmxlIHdv
cmssIGNvbXBsZXRlIHNvdXJjZQorIyAtY29kZSBtZWFucyBhbGwgdGhlIHNvdXJjZSBjb2RlIGZv
ciBhbGwgbW9kdWxlcyBpdCBjb250YWlucywgcGx1cyBhbnkKKyMgLWFzc29jaWF0ZWQgaW50ZXJm
YWNlIGRlZmluaXRpb24gZmlsZXMsIHBsdXMgdGhlIHNjcmlwdHMgdXNlZCB0bworIyAtY29udHJv
bCBjb21waWxhdGlvbiBhbmQgaW5zdGFsbGF0aW9uIG9mIHRoZSBleGVjdXRhYmxlLiAgSG93ZXZl
ciwgYXMgYQorIyAtc3BlY2lhbCBleGNlcHRpb24sIHRoZSBzb3VyY2UgY29kZSBkaXN0cmlidXRl
ZCBuZWVkIG5vdCBpbmNsdWRlCisjIC1hbnl0aGluZyB0aGF0IGlzIG5vcm1hbGx5IGRpc3RyaWJ1
dGVkIChpbiBlaXRoZXIgc291cmNlIG9yIGJpbmFyeQorIyAtZm9ybSkgd2l0aCB0aGUgbWFqb3Ig
Y29tcG9uZW50cyAoY29tcGlsZXIsIGtlcm5lbCwgYW5kIHNvIG9uKSBvZiB0aGUKKyMgLW9wZXJh
dGluZyBzeXN0ZW0gb24gd2hpY2ggdGhlIGV4ZWN1dGFibGUgcnVucywgdW5sZXNzIHRoYXQgY29t
cG9uZW50CisjIC1pdHNlbGYgYWNjb21wYW5pZXMgdGhlIGV4ZWN1dGFibGUuCisjIC0KKyMgLUlm
IGRpc3RyaWJ1dGlvbiBvZiBleGVjdXRhYmxlIG9yIG9iamVjdCBjb2RlIGlzIG1hZGUgYnkgb2Zm
ZXJpbmcKKyMgLWFjY2VzcyB0byBjb3B5IGZyb20gYSBkZXNpZ25hdGVkIHBsYWNlLCB0aGVuIG9m
ZmVyaW5nIGVxdWl2YWxlbnQKKyMgLWFjY2VzcyB0byBjb3B5IHRoZSBzb3VyY2UgY29kZSBmcm9t
IHRoZSBzYW1lIHBsYWNlIGNvdW50cyBhcworIyAtZGlzdHJpYnV0aW9uIG9mIHRoZSBzb3VyY2Ug
Y29kZSwgZXZlbiB0aG91Z2ggdGhpcmQgcGFydGllcyBhcmUgbm90CisjIC1jb21wZWxsZWQgdG8g
Y29weSB0aGUgc291cmNlIGFsb25nIHdpdGggdGhlIG9iamVjdCBjb2RlLgorIyAtCisjIC0gIDQu
IFlvdSBtYXkgbm90IGNvcHksIG1vZGlmeSwgc3VibGljZW5zZSwgb3IgZGlzdHJpYnV0ZSB0aGUg
UHJvZ3JhbQorIyAtZXhjZXB0IGFzIGV4cHJlc3NseSBwcm92aWRlZCB1bmRlciB0aGlzIExpY2Vu
c2UuICBBbnkgYXR0ZW1wdAorIyAtb3RoZXJ3aXNlIHRvIGNvcHksIG1vZGlmeSwgc3VibGljZW5z
ZSBvciBkaXN0cmlidXRlIHRoZSBQcm9ncmFtIGlzCisjIC12b2lkLCBhbmQgd2lsbCBhdXRvbWF0
aWNhbGx5IHRlcm1pbmF0ZSB5b3VyIHJpZ2h0cyB1bmRlciB0aGlzIExpY2Vuc2UuCisjIC1Ib3dl
dmVyLCBwYXJ0aWVzIHdobyBoYXZlIHJlY2VpdmVkIGNvcGllcywgb3IgcmlnaHRzLCBmcm9tIHlv
dSB1bmRlcgorIyAtdGhpcyBMaWNlbnNlIHdpbGwgbm90IGhhdmUgdGhlaXIgbGljZW5zZXMgdGVy
bWluYXRlZCBzbyBsb25nIGFzIHN1Y2gKKyMgLXBhcnRpZXMgcmVtYWluIGluIGZ1bGwgY29tcGxp
YW5jZS4KKyMgLQorIyAtICA1LiBZb3UgYXJlIG5vdCByZXF1aXJlZCB0byBhY2NlcHQgdGhpcyBM
aWNlbnNlLCBzaW5jZSB5b3UgaGF2ZSBub3QKKyMgLXNpZ25lZCBpdC4gIEhvd2V2ZXIsIG5vdGhp
bmcgZWxzZSBncmFudHMgeW91IHBlcm1pc3Npb24gdG8gbW9kaWZ5IG9yCisjIC1kaXN0cmlidXRl
IHRoZSBQcm9ncmFtIG9yIGl0cyBkZXJpdmF0aXZlIHdvcmtzLiAgVGhlc2UgYWN0aW9ucyBhcmUK
KyMgLXByb2hpYml0ZWQgYnkgbGF3IGlmIHlvdSBkbyBub3QgYWNjZXB0IHRoaXMgTGljZW5zZS4g
IFRoZXJlZm9yZSwgYnkKKyMgLW1vZGlmeWluZyBvciBkaXN0cmlidXRpbmcgdGhlIFByb2dyYW0g
KG9yIGFueSB3b3JrIGJhc2VkIG9uIHRoZQorIyAtUHJvZ3JhbSksIHlvdSBpbmRpY2F0ZSB5b3Vy
IGFjY2VwdGFuY2Ugb2YgdGhpcyBMaWNlbnNlIHRvIGRvIHNvLCBhbmQKKyMgLWFsbCBpdHMgdGVy
bXMgYW5kIGNvbmRpdGlvbnMgZm9yIGNvcHlpbmcsIGRpc3RyaWJ1dGluZyBvciBtb2RpZnlpbmcK
KyMgLXRoZSBQcm9ncmFtIG9yIHdvcmtzIGJhc2VkIG9uIGl0LgorIyAtCisjIC0gIDYuIEVhY2gg
dGltZSB5b3UgcmVkaXN0cmlidXRlIHRoZSBQcm9ncmFtIChvciBhbnkgd29yayBiYXNlZCBvbiB0
aGUKKyMgLVByb2dyYW0pLCB0aGUgcmVjaXBpZW50IGF1dG9tYXRpY2FsbHkgcmVjZWl2ZXMgYSBs
aWNlbnNlIGZyb20gdGhlCisjIC1vcmlnaW5hbCBsaWNlbnNvciB0byBjb3B5LCBkaXN0cmlidXRl
IG9yIG1vZGlmeSB0aGUgUHJvZ3JhbSBzdWJqZWN0IHRvCisjIC10aGVzZSB0ZXJtcyBhbmQgY29u
ZGl0aW9ucy4gIFlvdSBtYXkgbm90IGltcG9zZSBhbnkgZnVydGhlcgorIyAtcmVzdHJpY3Rpb25z
IG9uIHRoZSByZWNpcGllbnRzJyBleGVyY2lzZSBvZiB0aGUgcmlnaHRzIGdyYW50ZWQgaGVyZWlu
LgorIyAtWW91IGFyZSBub3QgcmVzcG9uc2libGUgZm9yIGVuZm9yY2luZyBjb21wbGlhbmNlIGJ5
IHRoaXJkIHBhcnRpZXMgdG8KKyMgKyAgICAgICAgICAgICAgICAgICAgICAgVEVSTVMgQU5EIENP
TkRJVElPTlMKKyMgKworIyArICAwLiBEZWZpbml0aW9ucy4KKyMgKworIyArICAiVGhpcyBMaWNl
bnNlIiByZWZlcnMgdG8gdmVyc2lvbiAzIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZS4KKyMgKworIyArICAiQ29weXJpZ2h0IiBhbHNvIG1lYW5zIGNvcHlyaWdodC1saWtlIGxhd3Mg
dGhhdCBhcHBseSB0byBvdGhlciBraW5kcyBvZgorIyArd29ya3MsIHN1Y2ggYXMgc2VtaWNvbmR1
Y3RvciBtYXNrcy4KKyMgKworIyArICAiVGhlIFByb2dyYW0iIHJlZmVycyB0byBhbnkgY29weXJp
Z2h0YWJsZSB3b3JrIGxpY2Vuc2VkIHVuZGVyIHRoaXMKKyMgK0xpY2Vuc2UuICBFYWNoIGxpY2Vu
c2VlIGlzIGFkZHJlc3NlZCBhcyAieW91Ii4gICJMaWNlbnNlZXMiIGFuZAorIyArInJlY2lwaWVu
dHMiIG1heSBiZSBpbmRpdmlkdWFscyBvciBvcmdhbml6YXRpb25zLgorIyArCisjICsgIFRvICJt
b2RpZnkiIGEgd29yayBtZWFucyB0byBjb3B5IGZyb20gb3IgYWRhcHQgYWxsIG9yIHBhcnQgb2Yg
dGhlIHdvcmsKKyMgK2luIGEgZmFzaGlvbiByZXF1aXJpbmcgY29weXJpZ2h0IHBlcm1pc3Npb24s
IG90aGVyIHRoYW4gdGhlIG1ha2luZyBvZiBhbgorIyArZXhhY3QgY29weS4gIFRoZSByZXN1bHRp
bmcgd29yayBpcyBjYWxsZWQgYSAibW9kaWZpZWQgdmVyc2lvbiIgb2YgdGhlCisjICtlYXJsaWVy
IHdvcmsgb3IgYSB3b3JrICJiYXNlZCBvbiIgdGhlIGVhcmxpZXIgd29yay4KKyMgKworIyArICBB
ICJjb3ZlcmVkIHdvcmsiIG1lYW5zIGVpdGhlciB0aGUgdW5tb2RpZmllZCBQcm9ncmFtIG9yIGEg
d29yayBiYXNlZAorIyArb24gdGhlIFByb2dyYW0uCisjICsKKyMgKyAgVG8gInByb3BhZ2F0ZSIg
YSB3b3JrIG1lYW5zIHRvIGRvIGFueXRoaW5nIHdpdGggaXQgdGhhdCwgd2l0aG91dAorIyArcGVy
bWlzc2lvbiwgd291bGQgbWFrZSB5b3UgZGlyZWN0bHkgb3Igc2Vjb25kYXJpbHkgbGlhYmxlIGZv
cgorIyAraW5mcmluZ2VtZW50IHVuZGVyIGFwcGxpY2FibGUgY29weXJpZ2h0IGxhdywgZXhjZXB0
IGV4ZWN1dGluZyBpdCBvbiBhCisjICtjb21wdXRlciBvciBtb2RpZnlpbmcgYSBwcml2YXRlIGNv
cHkuICBQcm9wYWdhdGlvbiBpbmNsdWRlcyBjb3B5aW5nLAorIyArZGlzdHJpYnV0aW9uICh3aXRo
IG9yIHdpdGhvdXQgbW9kaWZpY2F0aW9uKSwgbWFraW5nIGF2YWlsYWJsZSB0byB0aGUKKyMgK3B1
YmxpYywgYW5kIGluIHNvbWUgY291bnRyaWVzIG90aGVyIGFjdGl2aXRpZXMgYXMgd2VsbC4KKyMg
KworIyArICBUbyAiY29udmV5IiBhIHdvcmsgbWVhbnMgYW55IGtpbmQgb2YgcHJvcGFnYXRpb24g
dGhhdCBlbmFibGVzIG90aGVyCisjICtwYXJ0aWVzIHRvIG1ha2Ugb3IgcmVjZWl2ZSBjb3BpZXMu
ICBNZXJlIGludGVyYWN0aW9uIHdpdGggYSB1c2VyIHRocm91Z2gKKyMgK2EgY29tcHV0ZXIgbmV0
d29yaywgd2l0aCBubyB0cmFuc2ZlciBvZiBhIGNvcHksIGlzIG5vdCBjb252ZXlpbmcuCisjICsK
KyMgKyAgQW4gaW50ZXJhY3RpdmUgdXNlciBpbnRlcmZhY2UgZGlzcGxheXMgIkFwcHJvcHJpYXRl
IExlZ2FsIE5vdGljZXMiCisjICt0byB0aGUgZXh0ZW50IHRoYXQgaXQgaW5jbHVkZXMgYSBjb252
ZW5pZW50IGFuZCBwcm9taW5lbnRseSB2aXNpYmxlCisjICtmZWF0dXJlIHRoYXQgKDEpIGRpc3Bs
YXlzIGFuIGFwcHJvcHJpYXRlIGNvcHlyaWdodCBub3RpY2UsIGFuZCAoMikKKyMgK3RlbGxzIHRo
ZSB1c2VyIHRoYXQgdGhlcmUgaXMgbm8gd2FycmFudHkgZm9yIHRoZSB3b3JrIChleGNlcHQgdG8g
dGhlCisjICtleHRlbnQgdGhhdCB3YXJyYW50aWVzIGFyZSBwcm92aWRlZCksIHRoYXQgbGljZW5z
ZWVzIG1heSBjb252ZXkgdGhlCisjICt3b3JrIHVuZGVyIHRoaXMgTGljZW5zZSwgYW5kIGhvdyB0
byB2aWV3IGEgY29weSBvZiB0aGlzIExpY2Vuc2UuICBJZgorIyArdGhlIGludGVyZmFjZSBwcmVz
ZW50cyBhIGxpc3Qgb2YgdXNlciBjb21tYW5kcyBvciBvcHRpb25zLCBzdWNoIGFzIGEKKyMgK21l
bnUsIGEgcHJvbWluZW50IGl0ZW0gaW4gdGhlIGxpc3QgbWVldHMgdGhpcyBjcml0ZXJpb24uCisj
ICsKKyMgKyAgMS4gU291cmNlIENvZGUuCisjICsKKyMgKyAgVGhlICJzb3VyY2UgY29kZSIgZm9y
IGEgd29yayBtZWFucyB0aGUgcHJlZmVycmVkIGZvcm0gb2YgdGhlIHdvcmsKKyMgK2ZvciBtYWtp
bmcgbW9kaWZpY2F0aW9ucyB0byBpdC4gICJPYmplY3QgY29kZSIgbWVhbnMgYW55IG5vbi1zb3Vy
Y2UKKyMgK2Zvcm0gb2YgYSB3b3JrLgorIyArCisjICsgIEEgIlN0YW5kYXJkIEludGVyZmFjZSIg
bWVhbnMgYW4gaW50ZXJmYWNlIHRoYXQgZWl0aGVyIGlzIGFuIG9mZmljaWFsCisjICtzdGFuZGFy
ZCBkZWZpbmVkIGJ5IGEgcmVjb2duaXplZCBzdGFuZGFyZHMgYm9keSwgb3IsIGluIHRoZSBjYXNl
IG9mCisjICtpbnRlcmZhY2VzIHNwZWNpZmllZCBmb3IgYSBwYXJ0aWN1bGFyIHByb2dyYW1taW5n
IGxhbmd1YWdlLCBvbmUgdGhhdAorIyAraXMgd2lkZWx5IHVzZWQgYW1vbmcgZGV2ZWxvcGVycyB3
b3JraW5nIGluIHRoYXQgbGFuZ3VhZ2UuCisjICsKKyMgKyAgVGhlICJTeXN0ZW0gTGlicmFyaWVz
IiBvZiBhbiBleGVjdXRhYmxlIHdvcmsgaW5jbHVkZSBhbnl0aGluZywgb3RoZXIKKyMgK3RoYW4g
dGhlIHdvcmsgYXMgYSB3aG9sZSwgdGhhdCAoYSkgaXMgaW5jbHVkZWQgaW4gdGhlIG5vcm1hbCBm
b3JtIG9mCisjICtwYWNrYWdpbmcgYSBNYWpvciBDb21wb25lbnQsIGJ1dCB3aGljaCBpcyBub3Qg
cGFydCBvZiB0aGF0IE1ham9yCisjICtDb21wb25lbnQsIGFuZCAoYikgc2VydmVzIG9ubHkgdG8g
ZW5hYmxlIHVzZSBvZiB0aGUgd29yayB3aXRoIHRoYXQKKyMgK01ham9yIENvbXBvbmVudCwgb3Ig
dG8gaW1wbGVtZW50IGEgU3RhbmRhcmQgSW50ZXJmYWNlIGZvciB3aGljaCBhbgorIyAraW1wbGVt
ZW50YXRpb24gaXMgYXZhaWxhYmxlIHRvIHRoZSBwdWJsaWMgaW4gc291cmNlIGNvZGUgZm9ybS4g
IEEKKyMgKyJNYWpvciBDb21wb25lbnQiLCBpbiB0aGlzIGNvbnRleHQsIG1lYW5zIGEgbWFqb3Ig
ZXNzZW50aWFsIGNvbXBvbmVudAorIyArKGtlcm5lbCwgd2luZG93IHN5c3RlbSwgYW5kIHNvIG9u
KSBvZiB0aGUgc3BlY2lmaWMgb3BlcmF0aW5nIHN5c3RlbQorIyArKGlmIGFueSkgb24gd2hpY2gg
dGhlIGV4ZWN1dGFibGUgd29yayBydW5zLCBvciBhIGNvbXBpbGVyIHVzZWQgdG8KKyMgK3Byb2R1
Y2UgdGhlIHdvcmssIG9yIGFuIG9iamVjdCBjb2RlIGludGVycHJldGVyIHVzZWQgdG8gcnVuIGl0
LgorIyArCisjICsgIFRoZSAiQ29ycmVzcG9uZGluZyBTb3VyY2UiIGZvciBhIHdvcmsgaW4gb2Jq
ZWN0IGNvZGUgZm9ybSBtZWFucyBhbGwKKyMgK3RoZSBzb3VyY2UgY29kZSBuZWVkZWQgdG8gZ2Vu
ZXJhdGUsIGluc3RhbGwsIGFuZCAoZm9yIGFuIGV4ZWN1dGFibGUKKyMgK3dvcmspIHJ1biB0aGUg
b2JqZWN0IGNvZGUgYW5kIHRvIG1vZGlmeSB0aGUgd29yaywgaW5jbHVkaW5nIHNjcmlwdHMgdG8K
KyMgK2NvbnRyb2wgdGhvc2UgYWN0aXZpdGllcy4gIEhvd2V2ZXIsIGl0IGRvZXMgbm90IGluY2x1
ZGUgdGhlIHdvcmsncworIyArU3lzdGVtIExpYnJhcmllcywgb3IgZ2VuZXJhbC1wdXJwb3NlIHRv
b2xzIG9yIGdlbmVyYWxseSBhdmFpbGFibGUgZnJlZQorIyArcHJvZ3JhbXMgd2hpY2ggYXJlIHVz
ZWQgdW5tb2RpZmllZCBpbiBwZXJmb3JtaW5nIHRob3NlIGFjdGl2aXRpZXMgYnV0CisjICt3aGlj
aCBhcmUgbm90IHBhcnQgb2YgdGhlIHdvcmsuICBGb3IgZXhhbXBsZSwgQ29ycmVzcG9uZGluZyBT
b3VyY2UKKyMgK2luY2x1ZGVzIGludGVyZmFjZSBkZWZpbml0aW9uIGZpbGVzIGFzc29jaWF0ZWQg
d2l0aCBzb3VyY2UgZmlsZXMgZm9yCisjICt0aGUgd29yaywgYW5kIHRoZSBzb3VyY2UgY29kZSBm
b3Igc2hhcmVkIGxpYnJhcmllcyBhbmQgZHluYW1pY2FsbHkKKyMgK2xpbmtlZCBzdWJwcm9ncmFt
cyB0aGF0IHRoZSB3b3JrIGlzIHNwZWNpZmljYWxseSBkZXNpZ25lZCB0byByZXF1aXJlLAorIyAr
c3VjaCBhcyBieSBpbnRpbWF0ZSBkYXRhIGNvbW11bmljYXRpb24gb3IgY29udHJvbCBmbG93IGJl
dHdlZW4gdGhvc2UKKyMgK3N1YnByb2dyYW1zIGFuZCBvdGhlciBwYXJ0cyBvZiB0aGUgd29yay4K
KyMgKworIyArICBUaGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgbmVlZCBub3QgaW5jbHVkZSBhbnl0
aGluZyB0aGF0IHVzZXJzCisjICtjYW4gcmVnZW5lcmF0ZSBhdXRvbWF0aWNhbGx5IGZyb20gb3Ro
ZXIgcGFydHMgb2YgdGhlIENvcnJlc3BvbmRpbmcKKyMgK1NvdXJjZS4KKyMgKworIyArICBUaGUg
Q29ycmVzcG9uZGluZyBTb3VyY2UgZm9yIGEgd29yayBpbiBzb3VyY2UgY29kZSBmb3JtIGlzIHRo
YXQKKyMgK3NhbWUgd29yay4KKyMgKworIyArICAyLiBCYXNpYyBQZXJtaXNzaW9ucy4KKyMgKwor
IyArICBBbGwgcmlnaHRzIGdyYW50ZWQgdW5kZXIgdGhpcyBMaWNlbnNlIGFyZSBncmFudGVkIGZv
ciB0aGUgdGVybSBvZgorIyArY29weXJpZ2h0IG9uIHRoZSBQcm9ncmFtLCBhbmQgYXJlIGlycmV2
b2NhYmxlIHByb3ZpZGVkIHRoZSBzdGF0ZWQKKyMgK2NvbmRpdGlvbnMgYXJlIG1ldC4gIFRoaXMg
TGljZW5zZSBleHBsaWNpdGx5IGFmZmlybXMgeW91ciB1bmxpbWl0ZWQKKyMgK3Blcm1pc3Npb24g
dG8gcnVuIHRoZSB1bm1vZGlmaWVkIFByb2dyYW0uICBUaGUgb3V0cHV0IGZyb20gcnVubmluZyBh
CisjICtjb3ZlcmVkIHdvcmsgaXMgY292ZXJlZCBieSB0aGlzIExpY2Vuc2Ugb25seSBpZiB0aGUg
b3V0cHV0LCBnaXZlbiBpdHMKKyMgK2NvbnRlbnQsIGNvbnN0aXR1dGVzIGEgY292ZXJlZCB3b3Jr
LiAgVGhpcyBMaWNlbnNlIGFja25vd2xlZGdlcyB5b3VyCisjICtyaWdodHMgb2YgZmFpciB1c2Ug
b3Igb3RoZXIgZXF1aXZhbGVudCwgYXMgcHJvdmlkZWQgYnkgY29weXJpZ2h0IGxhdy4KKyMgKwor
IyArICBZb3UgbWF5IG1ha2UsIHJ1biBhbmQgcHJvcGFnYXRlIGNvdmVyZWQgd29ya3MgdGhhdCB5
b3UgZG8gbm90CisjICtjb252ZXksIHdpdGhvdXQgY29uZGl0aW9ucyBzbyBsb25nIGFzIHlvdXIg
bGljZW5zZSBvdGhlcndpc2UgcmVtYWlucworIyAraW4gZm9yY2UuICBZb3UgbWF5IGNvbnZleSBj
b3ZlcmVkIHdvcmtzIHRvIG90aGVycyBmb3IgdGhlIHNvbGUgcHVycG9zZQorIyArb2YgaGF2aW5n
IHRoZW0gbWFrZSBtb2RpZmljYXRpb25zIGV4Y2x1c2l2ZWx5IGZvciB5b3UsIG9yIHByb3ZpZGUg
eW91CisjICt3aXRoIGZhY2lsaXRpZXMgZm9yIHJ1bm5pbmcgdGhvc2Ugd29ya3MsIHByb3ZpZGVk
IHRoYXQgeW91IGNvbXBseSB3aXRoCisjICt0aGUgdGVybXMgb2YgdGhpcyBMaWNlbnNlIGluIGNv
bnZleWluZyBhbGwgbWF0ZXJpYWwgZm9yIHdoaWNoIHlvdSBkbworIyArbm90IGNvbnRyb2wgY29w
eXJpZ2h0LiAgVGhvc2UgdGh1cyBtYWtpbmcgb3IgcnVubmluZyB0aGUgY292ZXJlZCB3b3Jrcwor
IyArZm9yIHlvdSBtdXN0IGRvIHNvIGV4Y2x1c2l2ZWx5IG9uIHlvdXIgYmVoYWxmLCB1bmRlciB5
b3VyIGRpcmVjdGlvbgorIyArYW5kIGNvbnRyb2wsIG9uIHRlcm1zIHRoYXQgcHJvaGliaXQgdGhl
bSBmcm9tIG1ha2luZyBhbnkgY29waWVzIG9mCisjICt5b3VyIGNvcHlyaWdodGVkIG1hdGVyaWFs
IG91dHNpZGUgdGhlaXIgcmVsYXRpb25zaGlwIHdpdGggeW91LgorIyArCisjICsgIENvbnZleWlu
ZyB1bmRlciBhbnkgb3RoZXIgY2lyY3Vtc3RhbmNlcyBpcyBwZXJtaXR0ZWQgc29sZWx5IHVuZGVy
CisjICt0aGUgY29uZGl0aW9ucyBzdGF0ZWQgYmVsb3cuICBTdWJsaWNlbnNpbmcgaXMgbm90IGFs
bG93ZWQ7IHNlY3Rpb24gMTAKKyMgK21ha2VzIGl0IHVubmVjZXNzYXJ5LgorIyArCisjICsgIDMu
IFByb3RlY3RpbmcgVXNlcnMnIExlZ2FsIFJpZ2h0cyBGcm9tIEFudGktQ2lyY3VtdmVudGlvbiBM
YXcuCisjICsKKyMgKyAgTm8gY292ZXJlZCB3b3JrIHNoYWxsIGJlIGRlZW1lZCBwYXJ0IG9mIGFu
IGVmZmVjdGl2ZSB0ZWNobm9sb2dpY2FsCisjICttZWFzdXJlIHVuZGVyIGFueSBhcHBsaWNhYmxl
IGxhdyBmdWxmaWxsaW5nIG9ibGlnYXRpb25zIHVuZGVyIGFydGljbGUKKyMgKzExIG9mIHRoZSBX
SVBPIGNvcHlyaWdodCB0cmVhdHkgYWRvcHRlZCBvbiAyMCBEZWNlbWJlciAxOTk2LCBvcgorIyAr
c2ltaWxhciBsYXdzIHByb2hpYml0aW5nIG9yIHJlc3RyaWN0aW5nIGNpcmN1bXZlbnRpb24gb2Yg
c3VjaAorIyArbWVhc3VyZXMuCisjICsKKyMgKyAgV2hlbiB5b3UgY29udmV5IGEgY292ZXJlZCB3
b3JrLCB5b3Ugd2FpdmUgYW55IGxlZ2FsIHBvd2VyIHRvIGZvcmJpZAorIyArY2lyY3VtdmVudGlv
biBvZiB0ZWNobm9sb2dpY2FsIG1lYXN1cmVzIHRvIHRoZSBleHRlbnQgc3VjaCBjaXJjdW12ZW50
aW9uCisjICtpcyBlZmZlY3RlZCBieSBleGVyY2lzaW5nIHJpZ2h0cyB1bmRlciB0aGlzIExpY2Vu
c2Ugd2l0aCByZXNwZWN0IHRvCisjICt0aGUgY292ZXJlZCB3b3JrLCBhbmQgeW91IGRpc2NsYWlt
IGFueSBpbnRlbnRpb24gdG8gbGltaXQgb3BlcmF0aW9uIG9yCisjICttb2RpZmljYXRpb24gb2Yg
dGhlIHdvcmsgYXMgYSBtZWFucyBvZiBlbmZvcmNpbmcsIGFnYWluc3QgdGhlIHdvcmsncworIyAr
dXNlcnMsIHlvdXIgb3IgdGhpcmQgcGFydGllcycgbGVnYWwgcmlnaHRzIHRvIGZvcmJpZCBjaXJj
dW12ZW50aW9uIG9mCisjICt0ZWNobm9sb2dpY2FsIG1lYXN1cmVzLgorIyArCisjICsgIDQuIENv
bnZleWluZyBWZXJiYXRpbSBDb3BpZXMuCisjICsKKyMgKyAgWW91IG1heSBjb252ZXkgdmVyYmF0
aW0gY29waWVzIG9mIHRoZSBQcm9ncmFtJ3Mgc291cmNlIGNvZGUgYXMgeW91CisjICtyZWNlaXZl
IGl0LCBpbiBhbnkgbWVkaXVtLCBwcm92aWRlZCB0aGF0IHlvdSBjb25zcGljdW91c2x5IGFuZAor
IyArYXBwcm9wcmlhdGVseSBwdWJsaXNoIG9uIGVhY2ggY29weSBhbiBhcHByb3ByaWF0ZSBjb3B5
cmlnaHQgbm90aWNlOworIyAra2VlcCBpbnRhY3QgYWxsIG5vdGljZXMgc3RhdGluZyB0aGF0IHRo
aXMgTGljZW5zZSBhbmQgYW55CisjICtub24tcGVybWlzc2l2ZSB0ZXJtcyBhZGRlZCBpbiBhY2Nv
cmQgd2l0aCBzZWN0aW9uIDcgYXBwbHkgdG8gdGhlIGNvZGU7CisjICtrZWVwIGludGFjdCBhbGwg
bm90aWNlcyBvZiB0aGUgYWJzZW5jZSBvZiBhbnkgd2FycmFudHk7IGFuZCBnaXZlIGFsbAorIyAr
cmVjaXBpZW50cyBhIGNvcHkgb2YgdGhpcyBMaWNlbnNlIGFsb25nIHdpdGggdGhlIFByb2dyYW0u
CisjICsKKyMgKyAgWW91IG1heSBjaGFyZ2UgYW55IHByaWNlIG9yIG5vIHByaWNlIGZvciBlYWNo
IGNvcHkgdGhhdCB5b3UgY29udmV5LAorIyArYW5kIHlvdSBtYXkgb2ZmZXIgc3VwcG9ydCBvciB3
YXJyYW50eSBwcm90ZWN0aW9uIGZvciBhIGZlZS4KKyMgKworIyArICA1LiBDb252ZXlpbmcgTW9k
aWZpZWQgU291cmNlIFZlcnNpb25zLgorIyArCisjICsgIFlvdSBtYXkgY29udmV5IGEgd29yayBi
YXNlZCBvbiB0aGUgUHJvZ3JhbSwgb3IgdGhlIG1vZGlmaWNhdGlvbnMgdG8KKyMgK3Byb2R1Y2Ug
aXQgZnJvbSB0aGUgUHJvZ3JhbSwgaW4gdGhlIGZvcm0gb2Ygc291cmNlIGNvZGUgdW5kZXIgdGhl
CisjICt0ZXJtcyBvZiBzZWN0aW9uIDQsIHByb3ZpZGVkIHRoYXQgeW91IGFsc28gbWVldCBhbGwg
b2YgdGhlc2UgY29uZGl0aW9uczoKKyMgKworIyArICAgIGEpIFRoZSB3b3JrIG11c3QgY2Fycnkg
cHJvbWluZW50IG5vdGljZXMgc3RhdGluZyB0aGF0IHlvdSBtb2RpZmllZAorIyArICAgIGl0LCBh
bmQgZ2l2aW5nIGEgcmVsZXZhbnQgZGF0ZS4KKyMgKworIyArICAgIGIpIFRoZSB3b3JrIG11c3Qg
Y2FycnkgcHJvbWluZW50IG5vdGljZXMgc3RhdGluZyB0aGF0IGl0IGlzCisjICsgICAgcmVsZWFz
ZWQgdW5kZXIgdGhpcyBMaWNlbnNlIGFuZCBhbnkgY29uZGl0aW9ucyBhZGRlZCB1bmRlciBzZWN0
aW9uCisjICsgICAgNy4gIFRoaXMgcmVxdWlyZW1lbnQgbW9kaWZpZXMgdGhlIHJlcXVpcmVtZW50
IGluIHNlY3Rpb24gNCB0bworIyArICAgICJrZWVwIGludGFjdCBhbGwgbm90aWNlcyIuCisjICsK
KyMgKyAgICBjKSBZb3UgbXVzdCBsaWNlbnNlIHRoZSBlbnRpcmUgd29yaywgYXMgYSB3aG9sZSwg
dW5kZXIgdGhpcworIyArICAgIExpY2Vuc2UgdG8gYW55b25lIHdobyBjb21lcyBpbnRvIHBvc3Nl
c3Npb24gb2YgYSBjb3B5LiAgVGhpcworIyArICAgIExpY2Vuc2Ugd2lsbCB0aGVyZWZvcmUgYXBw
bHksIGFsb25nIHdpdGggYW55IGFwcGxpY2FibGUgc2VjdGlvbiA3CisjICsgICAgYWRkaXRpb25h
bCB0ZXJtcywgdG8gdGhlIHdob2xlIG9mIHRoZSB3b3JrLCBhbmQgYWxsIGl0cyBwYXJ0cywKKyMg
KyAgICByZWdhcmRsZXNzIG9mIGhvdyB0aGV5IGFyZSBwYWNrYWdlZC4gIFRoaXMgTGljZW5zZSBn
aXZlcyBubworIyArICAgIHBlcm1pc3Npb24gdG8gbGljZW5zZSB0aGUgd29yayBpbiBhbnkgb3Ro
ZXIgd2F5LCBidXQgaXQgZG9lcyBub3QKKyMgKyAgICBpbnZhbGlkYXRlIHN1Y2ggcGVybWlzc2lv
biBpZiB5b3UgaGF2ZSBzZXBhcmF0ZWx5IHJlY2VpdmVkIGl0LgorIyArCisjICsgICAgZCkgSWYg
dGhlIHdvcmsgaGFzIGludGVyYWN0aXZlIHVzZXIgaW50ZXJmYWNlcywgZWFjaCBtdXN0IGRpc3Bs
YXkKKyMgKyAgICBBcHByb3ByaWF0ZSBMZWdhbCBOb3RpY2VzOyBob3dldmVyLCBpZiB0aGUgUHJv
Z3JhbSBoYXMgaW50ZXJhY3RpdmUKKyMgKyAgICBpbnRlcmZhY2VzIHRoYXQgZG8gbm90IGRpc3Bs
YXkgQXBwcm9wcmlhdGUgTGVnYWwgTm90aWNlcywgeW91cgorIyArICAgIHdvcmsgbmVlZCBub3Qg
bWFrZSB0aGVtIGRvIHNvLgorIyArCisjICsgIEEgY29tcGlsYXRpb24gb2YgYSBjb3ZlcmVkIHdv
cmsgd2l0aCBvdGhlciBzZXBhcmF0ZSBhbmQgaW5kZXBlbmRlbnQKKyMgK3dvcmtzLCB3aGljaCBh
cmUgbm90IGJ5IHRoZWlyIG5hdHVyZSBleHRlbnNpb25zIG9mIHRoZSBjb3ZlcmVkIHdvcmssCisj
ICthbmQgd2hpY2ggYXJlIG5vdCBjb21iaW5lZCB3aXRoIGl0IHN1Y2ggYXMgdG8gZm9ybSBhIGxh
cmdlciBwcm9ncmFtLAorIyAraW4gb3Igb24gYSB2b2x1bWUgb2YgYSBzdG9yYWdlIG9yIGRpc3Ry
aWJ1dGlvbiBtZWRpdW0sIGlzIGNhbGxlZCBhbgorIyArImFnZ3JlZ2F0ZSIgaWYgdGhlIGNvbXBp
bGF0aW9uIGFuZCBpdHMgcmVzdWx0aW5nIGNvcHlyaWdodCBhcmUgbm90CisjICt1c2VkIHRvIGxp
bWl0IHRoZSBhY2Nlc3Mgb3IgbGVnYWwgcmlnaHRzIG9mIHRoZSBjb21waWxhdGlvbidzIHVzZXJz
CisjICtiZXlvbmQgd2hhdCB0aGUgaW5kaXZpZHVhbCB3b3JrcyBwZXJtaXQuICBJbmNsdXNpb24g
b2YgYSBjb3ZlcmVkIHdvcmsKKyMgK2luIGFuIGFnZ3JlZ2F0ZSBkb2VzIG5vdCBjYXVzZSB0aGlz
IExpY2Vuc2UgdG8gYXBwbHkgdG8gdGhlIG90aGVyCisjICtwYXJ0cyBvZiB0aGUgYWdncmVnYXRl
LgorIyArCisjICsgIDYuIENvbnZleWluZyBOb24tU291cmNlIEZvcm1zLgorIyArCisjICsgIFlv
dSBtYXkgY29udmV5IGEgY292ZXJlZCB3b3JrIGluIG9iamVjdCBjb2RlIGZvcm0gdW5kZXIgdGhl
IHRlcm1zCisjICtvZiBzZWN0aW9ucyA0IGFuZCA1LCBwcm92aWRlZCB0aGF0IHlvdSBhbHNvIGNv
bnZleSB0aGUKKyMgK21hY2hpbmUtcmVhZGFibGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgdW5kZXIg
dGhlIHRlcm1zIG9mIHRoaXMgTGljZW5zZSwKKyMgK2luIG9uZSBvZiB0aGVzZSB3YXlzOgorIyAr
CisjICsgICAgYSkgQ29udmV5IHRoZSBvYmplY3QgY29kZSBpbiwgb3IgZW1ib2RpZWQgaW4sIGEg
cGh5c2ljYWwgcHJvZHVjdAorIyArICAgIChpbmNsdWRpbmcgYSBwaHlzaWNhbCBkaXN0cmlidXRp
b24gbWVkaXVtKSwgYWNjb21wYW5pZWQgYnkgdGhlCisjICsgICAgQ29ycmVzcG9uZGluZyBTb3Vy
Y2UgZml4ZWQgb24gYSBkdXJhYmxlIHBoeXNpY2FsIG1lZGl1bQorIyArICAgIGN1c3RvbWFyaWx5
IHVzZWQgZm9yIHNvZnR3YXJlIGludGVyY2hhbmdlLgorIyArCisjICsgICAgYikgQ29udmV5IHRo
ZSBvYmplY3QgY29kZSBpbiwgb3IgZW1ib2RpZWQgaW4sIGEgcGh5c2ljYWwgcHJvZHVjdAorIyAr
ICAgIChpbmNsdWRpbmcgYSBwaHlzaWNhbCBkaXN0cmlidXRpb24gbWVkaXVtKSwgYWNjb21wYW5p
ZWQgYnkgYQorIyArICAgIHdyaXR0ZW4gb2ZmZXIsIHZhbGlkIGZvciBhdCBsZWFzdCB0aHJlZSB5
ZWFycyBhbmQgdmFsaWQgZm9yIGFzCisjICsgICAgbG9uZyBhcyB5b3Ugb2ZmZXIgc3BhcmUgcGFy
dHMgb3IgY3VzdG9tZXIgc3VwcG9ydCBmb3IgdGhhdCBwcm9kdWN0CisjICsgICAgbW9kZWwsIHRv
IGdpdmUgYW55b25lIHdobyBwb3NzZXNzZXMgdGhlIG9iamVjdCBjb2RlIGVpdGhlciAoMSkgYQor
IyArICAgIGNvcHkgb2YgdGhlIENvcnJlc3BvbmRpbmcgU291cmNlIGZvciBhbGwgdGhlIHNvZnR3
YXJlIGluIHRoZQorIyArICAgIHByb2R1Y3QgdGhhdCBpcyBjb3ZlcmVkIGJ5IHRoaXMgTGljZW5z
ZSwgb24gYSBkdXJhYmxlIHBoeXNpY2FsCisjICsgICAgbWVkaXVtIGN1c3RvbWFyaWx5IHVzZWQg
Zm9yIHNvZnR3YXJlIGludGVyY2hhbmdlLCBmb3IgYSBwcmljZSBubworIyArICAgIG1vcmUgdGhh
biB5b3VyIHJlYXNvbmFibGUgY29zdCBvZiBwaHlzaWNhbGx5IHBlcmZvcm1pbmcgdGhpcworIyAr
ICAgIGNvbnZleWluZyBvZiBzb3VyY2UsIG9yICgyKSBhY2Nlc3MgdG8gY29weSB0aGUKKyMgKyAg
ICBDb3JyZXNwb25kaW5nIFNvdXJjZSBmcm9tIGEgbmV0d29yayBzZXJ2ZXIgYXQgbm8gY2hhcmdl
LgorIyArCisjICsgICAgYykgQ29udmV5IGluZGl2aWR1YWwgY29waWVzIG9mIHRoZSBvYmplY3Qg
Y29kZSB3aXRoIGEgY29weSBvZiB0aGUKKyMgKyAgICB3cml0dGVuIG9mZmVyIHRvIHByb3ZpZGUg
dGhlIENvcnJlc3BvbmRpbmcgU291cmNlLiAgVGhpcworIyArICAgIGFsdGVybmF0aXZlIGlzIGFs
bG93ZWQgb25seSBvY2Nhc2lvbmFsbHkgYW5kIG5vbmNvbW1lcmNpYWxseSwgYW5kCisjICsgICAg
b25seSBpZiB5b3UgcmVjZWl2ZWQgdGhlIG9iamVjdCBjb2RlIHdpdGggc3VjaCBhbiBvZmZlciwg
aW4gYWNjb3JkCisjICsgICAgd2l0aCBzdWJzZWN0aW9uIDZiLgorIyArCisjICsgICAgZCkgQ29u
dmV5IHRoZSBvYmplY3QgY29kZSBieSBvZmZlcmluZyBhY2Nlc3MgZnJvbSBhIGRlc2lnbmF0ZWQK
KyMgKyAgICBwbGFjZSAoZ3JhdGlzIG9yIGZvciBhIGNoYXJnZSksIGFuZCBvZmZlciBlcXVpdmFs
ZW50IGFjY2VzcyB0byB0aGUKKyMgKyAgICBDb3JyZXNwb25kaW5nIFNvdXJjZSBpbiB0aGUgc2Ft
ZSB3YXkgdGhyb3VnaCB0aGUgc2FtZSBwbGFjZSBhdCBubworIyArICAgIGZ1cnRoZXIgY2hhcmdl
LiAgWW91IG5lZWQgbm90IHJlcXVpcmUgcmVjaXBpZW50cyB0byBjb3B5IHRoZQorIyArICAgIENv
cnJlc3BvbmRpbmcgU291cmNlIGFsb25nIHdpdGggdGhlIG9iamVjdCBjb2RlLiAgSWYgdGhlIHBs
YWNlIHRvCisjICsgICAgY29weSB0aGUgb2JqZWN0IGNvZGUgaXMgYSBuZXR3b3JrIHNlcnZlciwg
dGhlIENvcnJlc3BvbmRpbmcgU291cmNlCisjICsgICAgbWF5IGJlIG9uIGEgZGlmZmVyZW50IHNl
cnZlciAob3BlcmF0ZWQgYnkgeW91IG9yIGEgdGhpcmQgcGFydHkpCisjICsgICAgdGhhdCBzdXBw
b3J0cyBlcXVpdmFsZW50IGNvcHlpbmcgZmFjaWxpdGllcywgcHJvdmlkZWQgeW91IG1haW50YWlu
CisjICsgICAgY2xlYXIgZGlyZWN0aW9ucyBuZXh0IHRvIHRoZSBvYmplY3QgY29kZSBzYXlpbmcg
d2hlcmUgdG8gZmluZCB0aGUKKyMgKyAgICBDb3JyZXNwb25kaW5nIFNvdXJjZS4gIFJlZ2FyZGxl
c3Mgb2Ygd2hhdCBzZXJ2ZXIgaG9zdHMgdGhlCisjICsgICAgQ29ycmVzcG9uZGluZyBTb3VyY2Us
IHlvdSByZW1haW4gb2JsaWdhdGVkIHRvIGVuc3VyZSB0aGF0IGl0IGlzCisjICsgICAgYXZhaWxh
YmxlIGZvciBhcyBsb25nIGFzIG5lZWRlZCB0byBzYXRpc2Z5IHRoZXNlIHJlcXVpcmVtZW50cy4K
KyMgKworIyArICAgIGUpIENvbnZleSB0aGUgb2JqZWN0IGNvZGUgdXNpbmcgcGVlci10by1wZWVy
IHRyYW5zbWlzc2lvbiwgcHJvdmlkZWQKKyMgKyAgICB5b3UgaW5mb3JtIG90aGVyIHBlZXJzIHdo
ZXJlIHRoZSBvYmplY3QgY29kZSBhbmQgQ29ycmVzcG9uZGluZworIyArICAgIFNvdXJjZSBvZiB0
aGUgd29yayBhcmUgYmVpbmcgb2ZmZXJlZCB0byB0aGUgZ2VuZXJhbCBwdWJsaWMgYXQgbm8KKyMg
KyAgICBjaGFyZ2UgdW5kZXIgc3Vic2VjdGlvbiA2ZC4KKyMgKworIyArICBBIHNlcGFyYWJsZSBw
b3J0aW9uIG9mIHRoZSBvYmplY3QgY29kZSwgd2hvc2Ugc291cmNlIGNvZGUgaXMgZXhjbHVkZWQK
KyMgK2Zyb20gdGhlIENvcnJlc3BvbmRpbmcgU291cmNlIGFzIGEgU3lzdGVtIExpYnJhcnksIG5l
ZWQgbm90IGJlCisjICtpbmNsdWRlZCBpbiBjb252ZXlpbmcgdGhlIG9iamVjdCBjb2RlIHdvcmsu
CisjICsKKyMgKyAgQSAiVXNlciBQcm9kdWN0IiBpcyBlaXRoZXIgKDEpIGEgImNvbnN1bWVyIHBy
b2R1Y3QiLCB3aGljaCBtZWFucyBhbnkKKyMgK3RhbmdpYmxlIHBlcnNvbmFsIHByb3BlcnR5IHdo
aWNoIGlzIG5vcm1hbGx5IHVzZWQgZm9yIHBlcnNvbmFsLCBmYW1pbHksCisjICtvciBob3VzZWhv
bGQgcHVycG9zZXMsIG9yICgyKSBhbnl0aGluZyBkZXNpZ25lZCBvciBzb2xkIGZvciBpbmNvcnBv
cmF0aW9uCisjICtpbnRvIGEgZHdlbGxpbmcuICBJbiBkZXRlcm1pbmluZyB3aGV0aGVyIGEgcHJv
ZHVjdCBpcyBhIGNvbnN1bWVyIHByb2R1Y3QsCisjICtkb3VidGZ1bCBjYXNlcyBzaGFsbCBiZSBy
ZXNvbHZlZCBpbiBmYXZvciBvZiBjb3ZlcmFnZS4gIEZvciBhIHBhcnRpY3VsYXIKKyMgK3Byb2R1
Y3QgcmVjZWl2ZWQgYnkgYSBwYXJ0aWN1bGFyIHVzZXIsICJub3JtYWxseSB1c2VkIiByZWZlcnMg
dG8gYQorIyArdHlwaWNhbCBvciBjb21tb24gdXNlIG9mIHRoYXQgY2xhc3Mgb2YgcHJvZHVjdCwg
cmVnYXJkbGVzcyBvZiB0aGUgc3RhdHVzCisjICtvZiB0aGUgcGFydGljdWxhciB1c2VyIG9yIG9m
IHRoZSB3YXkgaW4gd2hpY2ggdGhlIHBhcnRpY3VsYXIgdXNlcgorIyArYWN0dWFsbHkgdXNlcywg
b3IgZXhwZWN0cyBvciBpcyBleHBlY3RlZCB0byB1c2UsIHRoZSBwcm9kdWN0LiAgQSBwcm9kdWN0
CisjICtpcyBhIGNvbnN1bWVyIHByb2R1Y3QgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZSBwcm9k
dWN0IGhhcyBzdWJzdGFudGlhbAorIyArY29tbWVyY2lhbCwgaW5kdXN0cmlhbCBvciBub24tY29u
c3VtZXIgdXNlcywgdW5sZXNzIHN1Y2ggdXNlcyByZXByZXNlbnQKKyMgK3RoZSBvbmx5IHNpZ25p
ZmljYW50IG1vZGUgb2YgdXNlIG9mIHRoZSBwcm9kdWN0LgorIyArCisjICsgICJJbnN0YWxsYXRp
b24gSW5mb3JtYXRpb24iIGZvciBhIFVzZXIgUHJvZHVjdCBtZWFucyBhbnkgbWV0aG9kcywKKyMg
K3Byb2NlZHVyZXMsIGF1dGhvcml6YXRpb24ga2V5cywgb3Igb3RoZXIgaW5mb3JtYXRpb24gcmVx
dWlyZWQgdG8gaW5zdGFsbAorIyArYW5kIGV4ZWN1dGUgbW9kaWZpZWQgdmVyc2lvbnMgb2YgYSBj
b3ZlcmVkIHdvcmsgaW4gdGhhdCBVc2VyIFByb2R1Y3QgZnJvbQorIyArYSBtb2RpZmllZCB2ZXJz
aW9uIG9mIGl0cyBDb3JyZXNwb25kaW5nIFNvdXJjZS4gIFRoZSBpbmZvcm1hdGlvbiBtdXN0Cisj
ICtzdWZmaWNlIHRvIGVuc3VyZSB0aGF0IHRoZSBjb250aW51ZWQgZnVuY3Rpb25pbmcgb2YgdGhl
IG1vZGlmaWVkIG9iamVjdAorIyArY29kZSBpcyBpbiBubyBjYXNlIHByZXZlbnRlZCBvciBpbnRl
cmZlcmVkIHdpdGggc29sZWx5IGJlY2F1c2UKKyMgK21vZGlmaWNhdGlvbiBoYXMgYmVlbiBtYWRl
LgorIyArCisjICsgIElmIHlvdSBjb252ZXkgYW4gb2JqZWN0IGNvZGUgd29yayB1bmRlciB0aGlz
IHNlY3Rpb24gaW4sIG9yIHdpdGgsIG9yCisjICtzcGVjaWZpY2FsbHkgZm9yIHVzZSBpbiwgYSBV
c2VyIFByb2R1Y3QsIGFuZCB0aGUgY29udmV5aW5nIG9jY3VycyBhcworIyArcGFydCBvZiBhIHRy
YW5zYWN0aW9uIGluIHdoaWNoIHRoZSByaWdodCBvZiBwb3NzZXNzaW9uIGFuZCB1c2Ugb2YgdGhl
CisjICtVc2VyIFByb2R1Y3QgaXMgdHJhbnNmZXJyZWQgdG8gdGhlIHJlY2lwaWVudCBpbiBwZXJw
ZXR1aXR5IG9yIGZvciBhCisjICtmaXhlZCB0ZXJtIChyZWdhcmRsZXNzIG9mIGhvdyB0aGUgdHJh
bnNhY3Rpb24gaXMgY2hhcmFjdGVyaXplZCksIHRoZQorIyArQ29ycmVzcG9uZGluZyBTb3VyY2Ug
Y29udmV5ZWQgdW5kZXIgdGhpcyBzZWN0aW9uIG11c3QgYmUgYWNjb21wYW5pZWQKKyMgK2J5IHRo
ZSBJbnN0YWxsYXRpb24gSW5mb3JtYXRpb24uICBCdXQgdGhpcyByZXF1aXJlbWVudCBkb2VzIG5v
dCBhcHBseQorIyAraWYgbmVpdGhlciB5b3Ugbm9yIGFueSB0aGlyZCBwYXJ0eSByZXRhaW5zIHRo
ZSBhYmlsaXR5IHRvIGluc3RhbGwKKyMgK21vZGlmaWVkIG9iamVjdCBjb2RlIG9uIHRoZSBVc2Vy
IFByb2R1Y3QgKGZvciBleGFtcGxlLCB0aGUgd29yayBoYXMKKyMgK2JlZW4gaW5zdGFsbGVkIGlu
IFJPTSkuCisjICsKKyMgKyAgVGhlIHJlcXVpcmVtZW50IHRvIHByb3ZpZGUgSW5zdGFsbGF0aW9u
IEluZm9ybWF0aW9uIGRvZXMgbm90IGluY2x1ZGUgYQorIyArcmVxdWlyZW1lbnQgdG8gY29udGlu
dWUgdG8gcHJvdmlkZSBzdXBwb3J0IHNlcnZpY2UsIHdhcnJhbnR5LCBvciB1cGRhdGVzCisjICtm
b3IgYSB3b3JrIHRoYXQgaGFzIGJlZW4gbW9kaWZpZWQgb3IgaW5zdGFsbGVkIGJ5IHRoZSByZWNp
cGllbnQsIG9yIGZvcgorIyArdGhlIFVzZXIgUHJvZHVjdCBpbiB3aGljaCBpdCBoYXMgYmVlbiBt
b2RpZmllZCBvciBpbnN0YWxsZWQuICBBY2Nlc3MgdG8gYQorIyArbmV0d29yayBtYXkgYmUgZGVu
aWVkIHdoZW4gdGhlIG1vZGlmaWNhdGlvbiBpdHNlbGYgbWF0ZXJpYWxseSBhbmQKKyMgK2FkdmVy
c2VseSBhZmZlY3RzIHRoZSBvcGVyYXRpb24gb2YgdGhlIG5ldHdvcmsgb3IgdmlvbGF0ZXMgdGhl
IHJ1bGVzIGFuZAorIyArcHJvdG9jb2xzIGZvciBjb21tdW5pY2F0aW9uIGFjcm9zcyB0aGUgbmV0
d29yay4KKyMgKworIyArICBDb3JyZXNwb25kaW5nIFNvdXJjZSBjb252ZXllZCwgYW5kIEluc3Rh
bGxhdGlvbiBJbmZvcm1hdGlvbiBwcm92aWRlZCwKKyMgK2luIGFjY29yZCB3aXRoIHRoaXMgc2Vj
dGlvbiBtdXN0IGJlIGluIGEgZm9ybWF0IHRoYXQgaXMgcHVibGljbHkKKyMgK2RvY3VtZW50ZWQg
KGFuZCB3aXRoIGFuIGltcGxlbWVudGF0aW9uIGF2YWlsYWJsZSB0byB0aGUgcHVibGljIGluCisj
ICtzb3VyY2UgY29kZSBmb3JtKSwgYW5kIG11c3QgcmVxdWlyZSBubyBzcGVjaWFsIHBhc3N3b3Jk
IG9yIGtleSBmb3IKKyMgK3VucGFja2luZywgcmVhZGluZyBvciBjb3B5aW5nLgorIyArCisjICsg
IDcuIEFkZGl0aW9uYWwgVGVybXMuCisjICsKKyMgKyAgIkFkZGl0aW9uYWwgcGVybWlzc2lvbnMi
IGFyZSB0ZXJtcyB0aGF0IHN1cHBsZW1lbnQgdGhlIHRlcm1zIG9mIHRoaXMKKyMgK0xpY2Vuc2Ug
YnkgbWFraW5nIGV4Y2VwdGlvbnMgZnJvbSBvbmUgb3IgbW9yZSBvZiBpdHMgY29uZGl0aW9ucy4K
KyMgK0FkZGl0aW9uYWwgcGVybWlzc2lvbnMgdGhhdCBhcmUgYXBwbGljYWJsZSB0byB0aGUgZW50
aXJlIFByb2dyYW0gc2hhbGwKKyMgK2JlIHRyZWF0ZWQgYXMgdGhvdWdoIHRoZXkgd2VyZSBpbmNs
dWRlZCBpbiB0aGlzIExpY2Vuc2UsIHRvIHRoZSBleHRlbnQKKyMgK3RoYXQgdGhleSBhcmUgdmFs
aWQgdW5kZXIgYXBwbGljYWJsZSBsYXcuICBJZiBhZGRpdGlvbmFsIHBlcm1pc3Npb25zCisjICth
cHBseSBvbmx5IHRvIHBhcnQgb2YgdGhlIFByb2dyYW0sIHRoYXQgcGFydCBtYXkgYmUgdXNlZCBz
ZXBhcmF0ZWx5CisjICt1bmRlciB0aG9zZSBwZXJtaXNzaW9ucywgYnV0IHRoZSBlbnRpcmUgUHJv
Z3JhbSByZW1haW5zIGdvdmVybmVkIGJ5CisjICt0aGlzIExpY2Vuc2Ugd2l0aG91dCByZWdhcmQg
dG8gdGhlIGFkZGl0aW9uYWwgcGVybWlzc2lvbnMuCisjICsKKyMgKyAgV2hlbiB5b3UgY29udmV5
IGEgY29weSBvZiBhIGNvdmVyZWQgd29yaywgeW91IG1heSBhdCB5b3VyIG9wdGlvbgorIyArcmVt
b3ZlIGFueSBhZGRpdGlvbmFsIHBlcm1pc3Npb25zIGZyb20gdGhhdCBjb3B5LCBvciBmcm9tIGFu
eSBwYXJ0IG9mCisjICtpdC4gIChBZGRpdGlvbmFsIHBlcm1pc3Npb25zIG1heSBiZSB3cml0dGVu
IHRvIHJlcXVpcmUgdGhlaXIgb3duCisjICtyZW1vdmFsIGluIGNlcnRhaW4gY2FzZXMgd2hlbiB5
b3UgbW9kaWZ5IHRoZSB3b3JrLikgIFlvdSBtYXkgcGxhY2UKKyMgK2FkZGl0aW9uYWwgcGVybWlz
c2lvbnMgb24gbWF0ZXJpYWwsIGFkZGVkIGJ5IHlvdSB0byBhIGNvdmVyZWQgd29yaywKKyMgK2Zv
ciB3aGljaCB5b3UgaGF2ZSBvciBjYW4gZ2l2ZSBhcHByb3ByaWF0ZSBjb3B5cmlnaHQgcGVybWlz
c2lvbi4KKyMgKworIyArICBOb3R3aXRoc3RhbmRpbmcgYW55IG90aGVyIHByb3Zpc2lvbiBvZiB0
aGlzIExpY2Vuc2UsIGZvciBtYXRlcmlhbCB5b3UKKyMgK2FkZCB0byBhIGNvdmVyZWQgd29yaywg
eW91IG1heSAoaWYgYXV0aG9yaXplZCBieSB0aGUgY29weXJpZ2h0IGhvbGRlcnMgb2YKKyMgK3Ro
YXQgbWF0ZXJpYWwpIHN1cHBsZW1lbnQgdGhlIHRlcm1zIG9mIHRoaXMgTGljZW5zZSB3aXRoIHRl
cm1zOgorIyArCisjICsgICAgYSkgRGlzY2xhaW1pbmcgd2FycmFudHkgb3IgbGltaXRpbmcgbGlh
YmlsaXR5IGRpZmZlcmVudGx5IGZyb20gdGhlCisjICsgICAgdGVybXMgb2Ygc2VjdGlvbnMgMTUg
YW5kIDE2IG9mIHRoaXMgTGljZW5zZTsgb3IKKyMgKworIyArICAgIGIpIFJlcXVpcmluZyBwcmVz
ZXJ2YXRpb24gb2Ygc3BlY2lmaWVkIHJlYXNvbmFibGUgbGVnYWwgbm90aWNlcyBvcgorIyArICAg
IGF1dGhvciBhdHRyaWJ1dGlvbnMgaW4gdGhhdCBtYXRlcmlhbCBvciBpbiB0aGUgQXBwcm9wcmlh
dGUgTGVnYWwKKyMgKyAgICBOb3RpY2VzIGRpc3BsYXllZCBieSB3b3JrcyBjb250YWluaW5nIGl0
OyBvcgorIyArCisjICsgICAgYykgUHJvaGliaXRpbmcgbWlzcmVwcmVzZW50YXRpb24gb2YgdGhl
IG9yaWdpbiBvZiB0aGF0IG1hdGVyaWFsLCBvcgorIyArICAgIHJlcXVpcmluZyB0aGF0IG1vZGlm
aWVkIHZlcnNpb25zIG9mIHN1Y2ggbWF0ZXJpYWwgYmUgbWFya2VkIGluCisjICsgICAgcmVhc29u
YWJsZSB3YXlzIGFzIGRpZmZlcmVudCBmcm9tIHRoZSBvcmlnaW5hbCB2ZXJzaW9uOyBvcgorIyAr
CisjICsgICAgZCkgTGltaXRpbmcgdGhlIHVzZSBmb3IgcHVibGljaXR5IHB1cnBvc2VzIG9mIG5h
bWVzIG9mIGxpY2Vuc29ycyBvcgorIyArICAgIGF1dGhvcnMgb2YgdGhlIG1hdGVyaWFsOyBvcgor
IyArCisjICsgICAgZSkgRGVjbGluaW5nIHRvIGdyYW50IHJpZ2h0cyB1bmRlciB0cmFkZW1hcmsg
bGF3IGZvciB1c2Ugb2Ygc29tZQorIyArICAgIHRyYWRlIG5hbWVzLCB0cmFkZW1hcmtzLCBvciBz
ZXJ2aWNlIG1hcmtzOyBvcgorIyArCisjICsgICAgZikgUmVxdWlyaW5nIGluZGVtbmlmaWNhdGlv
biBvZiBsaWNlbnNvcnMgYW5kIGF1dGhvcnMgb2YgdGhhdAorIyArICAgIG1hdGVyaWFsIGJ5IGFu
eW9uZSB3aG8gY29udmV5cyB0aGUgbWF0ZXJpYWwgKG9yIG1vZGlmaWVkIHZlcnNpb25zIG9mCisj
ICsgICAgaXQpIHdpdGggY29udHJhY3R1YWwgYXNzdW1wdGlvbnMgb2YgbGlhYmlsaXR5IHRvIHRo
ZSByZWNpcGllbnQsIGZvcgorIyArICAgIGFueSBsaWFiaWxpdHkgdGhhdCB0aGVzZSBjb250cmFj
dHVhbCBhc3N1bXB0aW9ucyBkaXJlY3RseSBpbXBvc2Ugb24KKyMgKyAgICB0aG9zZSBsaWNlbnNv
cnMgYW5kIGF1dGhvcnMuCisjICsKKyMgKyAgQWxsIG90aGVyIG5vbi1wZXJtaXNzaXZlIGFkZGl0
aW9uYWwgdGVybXMgYXJlIGNvbnNpZGVyZWQgImZ1cnRoZXIKKyMgK3Jlc3RyaWN0aW9ucyIgd2l0
aGluIHRoZSBtZWFuaW5nIG9mIHNlY3Rpb24gMTAuICBJZiB0aGUgUHJvZ3JhbSBhcyB5b3UKKyMg
K3JlY2VpdmVkIGl0LCBvciBhbnkgcGFydCBvZiBpdCwgY29udGFpbnMgYSBub3RpY2Ugc3RhdGlu
ZyB0aGF0IGl0IGlzCisjICtnb3Zlcm5lZCBieSB0aGlzIExpY2Vuc2UgYWxvbmcgd2l0aCBhIHRl
cm0gdGhhdCBpcyBhIGZ1cnRoZXIKKyMgK3Jlc3RyaWN0aW9uLCB5b3UgbWF5IHJlbW92ZSB0aGF0
IHRlcm0uICBJZiBhIGxpY2Vuc2UgZG9jdW1lbnQgY29udGFpbnMKKyMgK2EgZnVydGhlciByZXN0
cmljdGlvbiBidXQgcGVybWl0cyByZWxpY2Vuc2luZyBvciBjb252ZXlpbmcgdW5kZXIgdGhpcwor
IyArTGljZW5zZSwgeW91IG1heSBhZGQgdG8gYSBjb3ZlcmVkIHdvcmsgbWF0ZXJpYWwgZ292ZXJu
ZWQgYnkgdGhlIHRlcm1zCisjICtvZiB0aGF0IGxpY2Vuc2UgZG9jdW1lbnQsIHByb3ZpZGVkIHRo
YXQgdGhlIGZ1cnRoZXIgcmVzdHJpY3Rpb24gZG9lcworIyArbm90IHN1cnZpdmUgc3VjaCByZWxp
Y2Vuc2luZyBvciBjb252ZXlpbmcuCisjICsKKyMgKyAgSWYgeW91IGFkZCB0ZXJtcyB0byBhIGNv
dmVyZWQgd29yayBpbiBhY2NvcmQgd2l0aCB0aGlzIHNlY3Rpb24sIHlvdQorIyArbXVzdCBwbGFj
ZSwgaW4gdGhlIHJlbGV2YW50IHNvdXJjZSBmaWxlcywgYSBzdGF0ZW1lbnQgb2YgdGhlCisjICth
ZGRpdGlvbmFsIHRlcm1zIHRoYXQgYXBwbHkgdG8gdGhvc2UgZmlsZXMsIG9yIGEgbm90aWNlIGlu
ZGljYXRpbmcKKyMgK3doZXJlIHRvIGZpbmQgdGhlIGFwcGxpY2FibGUgdGVybXMuCisjICsKKyMg
KyAgQWRkaXRpb25hbCB0ZXJtcywgcGVybWlzc2l2ZSBvciBub24tcGVybWlzc2l2ZSwgbWF5IGJl
IHN0YXRlZCBpbiB0aGUKKyMgK2Zvcm0gb2YgYSBzZXBhcmF0ZWx5IHdyaXR0ZW4gbGljZW5zZSwg
b3Igc3RhdGVkIGFzIGV4Y2VwdGlvbnM7CisjICt0aGUgYWJvdmUgcmVxdWlyZW1lbnRzIGFwcGx5
IGVpdGhlciB3YXkuCisjICsKKyMgKyAgOC4gVGVybWluYXRpb24uCisjICsKKyMgKyAgWW91IG1h
eSBub3QgcHJvcGFnYXRlIG9yIG1vZGlmeSBhIGNvdmVyZWQgd29yayBleGNlcHQgYXMgZXhwcmVz
c2x5CisjICtwcm92aWRlZCB1bmRlciB0aGlzIExpY2Vuc2UuICBBbnkgYXR0ZW1wdCBvdGhlcndp
c2UgdG8gcHJvcGFnYXRlIG9yCisjICttb2RpZnkgaXQgaXMgdm9pZCwgYW5kIHdpbGwgYXV0b21h
dGljYWxseSB0ZXJtaW5hdGUgeW91ciByaWdodHMgdW5kZXIKKyMgK3RoaXMgTGljZW5zZSAoaW5j
bHVkaW5nIGFueSBwYXRlbnQgbGljZW5zZXMgZ3JhbnRlZCB1bmRlciB0aGUgdGhpcmQKKyMgK3Bh
cmFncmFwaCBvZiBzZWN0aW9uIDExKS4KKyMgKworIyArICBIb3dldmVyLCBpZiB5b3UgY2Vhc2Ug
YWxsIHZpb2xhdGlvbiBvZiB0aGlzIExpY2Vuc2UsIHRoZW4geW91cgorIyArbGljZW5zZSBmcm9t
IGEgcGFydGljdWxhciBjb3B5cmlnaHQgaG9sZGVyIGlzIHJlaW5zdGF0ZWQgKGEpCisjICtwcm92
aXNpb25hbGx5LCB1bmxlc3MgYW5kIHVudGlsIHRoZSBjb3B5cmlnaHQgaG9sZGVyIGV4cGxpY2l0
bHkgYW5kCisjICtmaW5hbGx5IHRlcm1pbmF0ZXMgeW91ciBsaWNlbnNlLCBhbmQgKGIpIHBlcm1h
bmVudGx5LCBpZiB0aGUgY29weXJpZ2h0CisjICtob2xkZXIgZmFpbHMgdG8gbm90aWZ5IHlvdSBv
ZiB0aGUgdmlvbGF0aW9uIGJ5IHNvbWUgcmVhc29uYWJsZSBtZWFucworIyArcHJpb3IgdG8gNjAg
ZGF5cyBhZnRlciB0aGUgY2Vzc2F0aW9uLgorIyArCisjICsgIE1vcmVvdmVyLCB5b3VyIGxpY2Vu
c2UgZnJvbSBhIHBhcnRpY3VsYXIgY29weXJpZ2h0IGhvbGRlciBpcworIyArcmVpbnN0YXRlZCBw
ZXJtYW5lbnRseSBpZiB0aGUgY29weXJpZ2h0IGhvbGRlciBub3RpZmllcyB5b3Ugb2YgdGhlCisj
ICt2aW9sYXRpb24gYnkgc29tZSByZWFzb25hYmxlIG1lYW5zLCB0aGlzIGlzIHRoZSBmaXJzdCB0
aW1lIHlvdSBoYXZlCisjICtyZWNlaXZlZCBub3RpY2Ugb2YgdmlvbGF0aW9uIG9mIHRoaXMgTGlj
ZW5zZSAoZm9yIGFueSB3b3JrKSBmcm9tIHRoYXQKKyMgK2NvcHlyaWdodCBob2xkZXIsIGFuZCB5
b3UgY3VyZSB0aGUgdmlvbGF0aW9uIHByaW9yIHRvIDMwIGRheXMgYWZ0ZXIKKyMgK3lvdXIgcmVj
ZWlwdCBvZiB0aGUgbm90aWNlLgorIyArCisjICsgIFRlcm1pbmF0aW9uIG9mIHlvdXIgcmlnaHRz
IHVuZGVyIHRoaXMgc2VjdGlvbiBkb2VzIG5vdCB0ZXJtaW5hdGUgdGhlCisjICtsaWNlbnNlcyBv
ZiBwYXJ0aWVzIHdobyBoYXZlIHJlY2VpdmVkIGNvcGllcyBvciByaWdodHMgZnJvbSB5b3UgdW5k
ZXIKKyMgK3RoaXMgTGljZW5zZS4gIElmIHlvdXIgcmlnaHRzIGhhdmUgYmVlbiB0ZXJtaW5hdGVk
IGFuZCBub3QgcGVybWFuZW50bHkKKyMgK3JlaW5zdGF0ZWQsIHlvdSBkbyBub3QgcXVhbGlmeSB0
byByZWNlaXZlIG5ldyBsaWNlbnNlcyBmb3IgdGhlIHNhbWUKKyMgK21hdGVyaWFsIHVuZGVyIHNl
Y3Rpb24gMTAuCisjICsKKyMgKyAgOS4gQWNjZXB0YW5jZSBOb3QgUmVxdWlyZWQgZm9yIEhhdmlu
ZyBDb3BpZXMuCisjICsKKyMgKyAgWW91IGFyZSBub3QgcmVxdWlyZWQgdG8gYWNjZXB0IHRoaXMg
TGljZW5zZSBpbiBvcmRlciB0byByZWNlaXZlIG9yCisjICtydW4gYSBjb3B5IG9mIHRoZSBQcm9n
cmFtLiAgQW5jaWxsYXJ5IHByb3BhZ2F0aW9uIG9mIGEgY292ZXJlZCB3b3JrCisjICtvY2N1cnJp
bmcgc29sZWx5IGFzIGEgY29uc2VxdWVuY2Ugb2YgdXNpbmcgcGVlci10by1wZWVyIHRyYW5zbWlz
c2lvbgorIyArdG8gcmVjZWl2ZSBhIGNvcHkgbGlrZXdpc2UgZG9lcyBub3QgcmVxdWlyZSBhY2Nl
cHRhbmNlLiAgSG93ZXZlciwKKyMgK25vdGhpbmcgb3RoZXIgdGhhbiB0aGlzIExpY2Vuc2UgZ3Jh
bnRzIHlvdSBwZXJtaXNzaW9uIHRvIHByb3BhZ2F0ZSBvcgorIyArbW9kaWZ5IGFueSBjb3ZlcmVk
IHdvcmsuICBUaGVzZSBhY3Rpb25zIGluZnJpbmdlIGNvcHlyaWdodCBpZiB5b3UgZG8KKyMgK25v
dCBhY2NlcHQgdGhpcyBMaWNlbnNlLiAgVGhlcmVmb3JlLCBieSBtb2RpZnlpbmcgb3IgcHJvcGFn
YXRpbmcgYQorIyArY292ZXJlZCB3b3JrLCB5b3UgaW5kaWNhdGUgeW91ciBhY2NlcHRhbmNlIG9m
IHRoaXMgTGljZW5zZSB0byBkbyBzby4KKyMgKworIyArICAxMC4gQXV0b21hdGljIExpY2Vuc2lu
ZyBvZiBEb3duc3RyZWFtIFJlY2lwaWVudHMuCisjICsKKyMgKyAgRWFjaCB0aW1lIHlvdSBjb252
ZXkgYSBjb3ZlcmVkIHdvcmssIHRoZSByZWNpcGllbnQgYXV0b21hdGljYWxseQorIyArcmVjZWl2
ZXMgYSBsaWNlbnNlIGZyb20gdGhlIG9yaWdpbmFsIGxpY2Vuc29ycywgdG8gcnVuLCBtb2RpZnkg
YW5kCisjICtwcm9wYWdhdGUgdGhhdCB3b3JrLCBzdWJqZWN0IHRvIHRoaXMgTGljZW5zZS4gIFlv
dSBhcmUgbm90IHJlc3BvbnNpYmxlCisjICtmb3IgZW5mb3JjaW5nIGNvbXBsaWFuY2UgYnkgdGhp
cmQgcGFydGllcyB3aXRoIHRoaXMgTGljZW5zZS4KKyMgKworIyArICBBbiAiZW50aXR5IHRyYW5z
YWN0aW9uIiBpcyBhIHRyYW5zYWN0aW9uIHRyYW5zZmVycmluZyBjb250cm9sIG9mIGFuCisjICtv
cmdhbml6YXRpb24sIG9yIHN1YnN0YW50aWFsbHkgYWxsIGFzc2V0cyBvZiBvbmUsIG9yIHN1YmRp
dmlkaW5nIGFuCisjICtvcmdhbml6YXRpb24sIG9yIG1lcmdpbmcgb3JnYW5pemF0aW9ucy4gIElm
IHByb3BhZ2F0aW9uIG9mIGEgY292ZXJlZAorIyArd29yayByZXN1bHRzIGZyb20gYW4gZW50aXR5
IHRyYW5zYWN0aW9uLCBlYWNoIHBhcnR5IHRvIHRoYXQKKyMgK3RyYW5zYWN0aW9uIHdobyByZWNl
aXZlcyBhIGNvcHkgb2YgdGhlIHdvcmsgYWxzbyByZWNlaXZlcyB3aGF0ZXZlcgorIyArbGljZW5z
ZXMgdG8gdGhlIHdvcmsgdGhlIHBhcnR5J3MgcHJlZGVjZXNzb3IgaW4gaW50ZXJlc3QgaGFkIG9y
IGNvdWxkCisjICtnaXZlIHVuZGVyIHRoZSBwcmV2aW91cyBwYXJhZ3JhcGgsIHBsdXMgYSByaWdo
dCB0byBwb3NzZXNzaW9uIG9mIHRoZQorIyArQ29ycmVzcG9uZGluZyBTb3VyY2Ugb2YgdGhlIHdv
cmsgZnJvbSB0aGUgcHJlZGVjZXNzb3IgaW4gaW50ZXJlc3QsIGlmCisjICt0aGUgcHJlZGVjZXNz
b3IgaGFzIGl0IG9yIGNhbiBnZXQgaXQgd2l0aCByZWFzb25hYmxlIGVmZm9ydHMuCisjICsKKyMg
KyAgWW91IG1heSBub3QgaW1wb3NlIGFueSBmdXJ0aGVyIHJlc3RyaWN0aW9ucyBvbiB0aGUgZXhl
cmNpc2Ugb2YgdGhlCisjICtyaWdodHMgZ3JhbnRlZCBvciBhZmZpcm1lZCB1bmRlciB0aGlzIExp
Y2Vuc2UuICBGb3IgZXhhbXBsZSwgeW91IG1heQorIyArbm90IGltcG9zZSBhIGxpY2Vuc2UgZmVl
LCByb3lhbHR5LCBvciBvdGhlciBjaGFyZ2UgZm9yIGV4ZXJjaXNlIG9mCisjICtyaWdodHMgZ3Jh
bnRlZCB1bmRlciB0aGlzIExpY2Vuc2UsIGFuZCB5b3UgbWF5IG5vdCBpbml0aWF0ZSBsaXRpZ2F0
aW9uCisjICsoaW5jbHVkaW5nIGEgY3Jvc3MtY2xhaW0gb3IgY291bnRlcmNsYWltIGluIGEgbGF3
c3VpdCkgYWxsZWdpbmcgdGhhdAorIyArYW55IHBhdGVudCBjbGFpbSBpcyBpbmZyaW5nZWQgYnkg
bWFraW5nLCB1c2luZywgc2VsbGluZywgb2ZmZXJpbmcgZm9yCisjICtzYWxlLCBvciBpbXBvcnRp
bmcgdGhlIFByb2dyYW0gb3IgYW55IHBvcnRpb24gb2YgaXQuCisjICsKKyMgKyAgMTEuIFBhdGVu
dHMuCisjICsKKyMgKyAgQSAiY29udHJpYnV0b3IiIGlzIGEgY29weXJpZ2h0IGhvbGRlciB3aG8g
YXV0aG9yaXplcyB1c2UgdW5kZXIgdGhpcworIyArTGljZW5zZSBvZiB0aGUgUHJvZ3JhbSBvciBh
IHdvcmsgb24gd2hpY2ggdGhlIFByb2dyYW0gaXMgYmFzZWQuICBUaGUKKyMgK3dvcmsgdGh1cyBs
aWNlbnNlZCBpcyBjYWxsZWQgdGhlIGNvbnRyaWJ1dG9yJ3MgImNvbnRyaWJ1dG9yIHZlcnNpb24i
LgorIyArCisjICsgIEEgY29udHJpYnV0b3IncyAiZXNzZW50aWFsIHBhdGVudCBjbGFpbXMiIGFy
ZSBhbGwgcGF0ZW50IGNsYWltcworIyArb3duZWQgb3IgY29udHJvbGxlZCBieSB0aGUgY29udHJp
YnV0b3IsIHdoZXRoZXIgYWxyZWFkeSBhY3F1aXJlZCBvcgorIyAraGVyZWFmdGVyIGFjcXVpcmVk
LCB0aGF0IHdvdWxkIGJlIGluZnJpbmdlZCBieSBzb21lIG1hbm5lciwgcGVybWl0dGVkCisjICti
eSB0aGlzIExpY2Vuc2UsIG9mIG1ha2luZywgdXNpbmcsIG9yIHNlbGxpbmcgaXRzIGNvbnRyaWJ1
dG9yIHZlcnNpb24sCisjICtidXQgZG8gbm90IGluY2x1ZGUgY2xhaW1zIHRoYXQgd291bGQgYmUg
aW5mcmluZ2VkIG9ubHkgYXMgYQorIyArY29uc2VxdWVuY2Ugb2YgZnVydGhlciBtb2RpZmljYXRp
b24gb2YgdGhlIGNvbnRyaWJ1dG9yIHZlcnNpb24uICBGb3IKKyMgK3B1cnBvc2VzIG9mIHRoaXMg
ZGVmaW5pdGlvbiwgImNvbnRyb2wiIGluY2x1ZGVzIHRoZSByaWdodCB0byBncmFudAorIyArcGF0
ZW50IHN1YmxpY2Vuc2VzIGluIGEgbWFubmVyIGNvbnNpc3RlbnQgd2l0aCB0aGUgcmVxdWlyZW1l
bnRzIG9mCisjICB0aGlzIExpY2Vuc2UuCisjICAKKyMgLSAgNy4gSWYsIGFzIGEgY29uc2VxdWVu
Y2Ugb2YgYSBjb3VydCBqdWRnbWVudCBvciBhbGxlZ2F0aW9uIG9mIHBhdGVudAorIyAtaW5mcmlu
Z2VtZW50IG9yIGZvciBhbnkgb3RoZXIgcmVhc29uIChub3QgbGltaXRlZCB0byBwYXRlbnQgaXNz
dWVzKSwKKyMgLWNvbmRpdGlvbnMgYXJlIGltcG9zZWQgb24geW91ICh3aGV0aGVyIGJ5IGNvdXJ0
IG9yZGVyLCBhZ3JlZW1lbnQgb3IKKyMgKyAgRWFjaCBjb250cmlidXRvciBncmFudHMgeW91IGEg
bm9uLWV4Y2x1c2l2ZSwgd29ybGR3aWRlLCByb3lhbHR5LWZyZWUKKyMgK3BhdGVudCBsaWNlbnNl
IHVuZGVyIHRoZSBjb250cmlidXRvcidzIGVzc2VudGlhbCBwYXRlbnQgY2xhaW1zLCB0bworIyAr
bWFrZSwgdXNlLCBzZWxsLCBvZmZlciBmb3Igc2FsZSwgaW1wb3J0IGFuZCBvdGhlcndpc2UgcnVu
LCBtb2RpZnkgYW5kCisjICtwcm9wYWdhdGUgdGhlIGNvbnRlbnRzIG9mIGl0cyBjb250cmlidXRv
ciB2ZXJzaW9uLgorIyArCisjICsgIEluIHRoZSBmb2xsb3dpbmcgdGhyZWUgcGFyYWdyYXBocywg
YSAicGF0ZW50IGxpY2Vuc2UiIGlzIGFueSBleHByZXNzCisjICthZ3JlZW1lbnQgb3IgY29tbWl0
bWVudCwgaG93ZXZlciBkZW5vbWluYXRlZCwgbm90IHRvIGVuZm9yY2UgYSBwYXRlbnQKKyMgKyhz
dWNoIGFzIGFuIGV4cHJlc3MgcGVybWlzc2lvbiB0byBwcmFjdGljZSBhIHBhdGVudCBvciBjb3Zl
bmFudCBub3QgdG8KKyMgK3N1ZSBmb3IgcGF0ZW50IGluZnJpbmdlbWVudCkuICBUbyAiZ3JhbnQi
IHN1Y2ggYSBwYXRlbnQgbGljZW5zZSB0byBhCisjICtwYXJ0eSBtZWFucyB0byBtYWtlIHN1Y2gg
YW4gYWdyZWVtZW50IG9yIGNvbW1pdG1lbnQgbm90IHRvIGVuZm9yY2UgYQorIyArcGF0ZW50IGFn
YWluc3QgdGhlIHBhcnR5LgorIyArCisjICsgIElmIHlvdSBjb252ZXkgYSBjb3ZlcmVkIHdvcmss
IGtub3dpbmdseSByZWx5aW5nIG9uIGEgcGF0ZW50IGxpY2Vuc2UsCisjICthbmQgdGhlIENvcnJl
c3BvbmRpbmcgU291cmNlIG9mIHRoZSB3b3JrIGlzIG5vdCBhdmFpbGFibGUgZm9yIGFueW9uZQor
IyArdG8gY29weSwgZnJlZSBvZiBjaGFyZ2UgYW5kIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGlzIExp
Y2Vuc2UsIHRocm91Z2ggYQorIyArcHVibGljbHkgYXZhaWxhYmxlIG5ldHdvcmsgc2VydmVyIG9y
IG90aGVyIHJlYWRpbHkgYWNjZXNzaWJsZSBtZWFucywKKyMgK3RoZW4geW91IG11c3QgZWl0aGVy
ICgxKSBjYXVzZSB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgdG8gYmUgc28KKyMgK2F2YWlsYWJs
ZSwgb3IgKDIpIGFycmFuZ2UgdG8gZGVwcml2ZSB5b3Vyc2VsZiBvZiB0aGUgYmVuZWZpdCBvZiB0
aGUKKyMgK3BhdGVudCBsaWNlbnNlIGZvciB0aGlzIHBhcnRpY3VsYXIgd29yaywgb3IgKDMpIGFy
cmFuZ2UsIGluIGEgbWFubmVyCisjICtjb25zaXN0ZW50IHdpdGggdGhlIHJlcXVpcmVtZW50cyBv
ZiB0aGlzIExpY2Vuc2UsIHRvIGV4dGVuZCB0aGUgcGF0ZW50CisjICtsaWNlbnNlIHRvIGRvd25z
dHJlYW0gcmVjaXBpZW50cy4gICJLbm93aW5nbHkgcmVseWluZyIgbWVhbnMgeW91IGhhdmUKKyMg
K2FjdHVhbCBrbm93bGVkZ2UgdGhhdCwgYnV0IGZvciB0aGUgcGF0ZW50IGxpY2Vuc2UsIHlvdXIg
Y29udmV5aW5nIHRoZQorIyArY292ZXJlZCB3b3JrIGluIGEgY291bnRyeSwgb3IgeW91ciByZWNp
cGllbnQncyB1c2Ugb2YgdGhlIGNvdmVyZWQgd29yaworIyAraW4gYSBjb3VudHJ5LCB3b3VsZCBp
bmZyaW5nZSBvbmUgb3IgbW9yZSBpZGVudGlmaWFibGUgcGF0ZW50cyBpbiB0aGF0CisjICtjb3Vu
dHJ5IHRoYXQgeW91IGhhdmUgcmVhc29uIHRvIGJlbGlldmUgYXJlIHZhbGlkLgorIyArCisjICsg
IElmLCBwdXJzdWFudCB0byBvciBpbiBjb25uZWN0aW9uIHdpdGggYSBzaW5nbGUgdHJhbnNhY3Rp
b24gb3IKKyMgK2FycmFuZ2VtZW50LCB5b3UgY29udmV5LCBvciBwcm9wYWdhdGUgYnkgcHJvY3Vy
aW5nIGNvbnZleWFuY2Ugb2YsIGEKKyMgK2NvdmVyZWQgd29yaywgYW5kIGdyYW50IGEgcGF0ZW50
IGxpY2Vuc2UgdG8gc29tZSBvZiB0aGUgcGFydGllcworIyArcmVjZWl2aW5nIHRoZSBjb3ZlcmVk
IHdvcmsgYXV0aG9yaXppbmcgdGhlbSB0byB1c2UsIHByb3BhZ2F0ZSwgbW9kaWZ5CisjICtvciBj
b252ZXkgYSBzcGVjaWZpYyBjb3B5IG9mIHRoZSBjb3ZlcmVkIHdvcmssIHRoZW4gdGhlIHBhdGVu
dCBsaWNlbnNlCisjICt5b3UgZ3JhbnQgaXMgYXV0b21hdGljYWxseSBleHRlbmRlZCB0byBhbGwg
cmVjaXBpZW50cyBvZiB0aGUgY292ZXJlZAorIyArd29yayBhbmQgd29ya3MgYmFzZWQgb24gaXQu
CisjICsKKyMgKyAgQSBwYXRlbnQgbGljZW5zZSBpcyAiZGlzY3JpbWluYXRvcnkiIGlmIGl0IGRv
ZXMgbm90IGluY2x1ZGUgd2l0aGluCisjICt0aGUgc2NvcGUgb2YgaXRzIGNvdmVyYWdlLCBwcm9o
aWJpdHMgdGhlIGV4ZXJjaXNlIG9mLCBvciBpcworIyArY29uZGl0aW9uZWQgb24gdGhlIG5vbi1l
eGVyY2lzZSBvZiBvbmUgb3IgbW9yZSBvZiB0aGUgcmlnaHRzIHRoYXQgYXJlCisjICtzcGVjaWZp
Y2FsbHkgZ3JhbnRlZCB1bmRlciB0aGlzIExpY2Vuc2UuICBZb3UgbWF5IG5vdCBjb252ZXkgYSBj
b3ZlcmVkCisjICt3b3JrIGlmIHlvdSBhcmUgYSBwYXJ0eSB0byBhbiBhcnJhbmdlbWVudCB3aXRo
IGEgdGhpcmQgcGFydHkgdGhhdCBpcworIyAraW4gdGhlIGJ1c2luZXNzIG9mIGRpc3RyaWJ1dGlu
ZyBzb2Z0d2FyZSwgdW5kZXIgd2hpY2ggeW91IG1ha2UgcGF5bWVudAorIyArdG8gdGhlIHRoaXJk
IHBhcnR5IGJhc2VkIG9uIHRoZSBleHRlbnQgb2YgeW91ciBhY3Rpdml0eSBvZiBjb252ZXlpbmcK
KyMgK3RoZSB3b3JrLCBhbmQgdW5kZXIgd2hpY2ggdGhlIHRoaXJkIHBhcnR5IGdyYW50cywgdG8g
YW55IG9mIHRoZQorIyArcGFydGllcyB3aG8gd291bGQgcmVjZWl2ZSB0aGUgY292ZXJlZCB3b3Jr
IGZyb20geW91LCBhIGRpc2NyaW1pbmF0b3J5CisjICtwYXRlbnQgbGljZW5zZSAoYSkgaW4gY29u
bmVjdGlvbiB3aXRoIGNvcGllcyBvZiB0aGUgY292ZXJlZCB3b3JrCisjICtjb252ZXllZCBieSB5
b3UgKG9yIGNvcGllcyBtYWRlIGZyb20gdGhvc2UgY29waWVzKSwgb3IgKGIpIHByaW1hcmlseQor
IyArZm9yIGFuZCBpbiBjb25uZWN0aW9uIHdpdGggc3BlY2lmaWMgcHJvZHVjdHMgb3IgY29tcGls
YXRpb25zIHRoYXQKKyMgK2NvbnRhaW4gdGhlIGNvdmVyZWQgd29yaywgdW5sZXNzIHlvdSBlbnRl
cmVkIGludG8gdGhhdCBhcnJhbmdlbWVudCwKKyMgK29yIHRoYXQgcGF0ZW50IGxpY2Vuc2Ugd2Fz
IGdyYW50ZWQsIHByaW9yIHRvIDI4IE1hcmNoIDIwMDcuCisjICsKKyMgKyAgTm90aGluZyBpbiB0
aGlzIExpY2Vuc2Ugc2hhbGwgYmUgY29uc3RydWVkIGFzIGV4Y2x1ZGluZyBvciBsaW1pdGluZwor
IyArYW55IGltcGxpZWQgbGljZW5zZSBvciBvdGhlciBkZWZlbnNlcyB0byBpbmZyaW5nZW1lbnQg
dGhhdCBtYXkKKyMgK290aGVyd2lzZSBiZSBhdmFpbGFibGUgdG8geW91IHVuZGVyIGFwcGxpY2Fi
bGUgcGF0ZW50IGxhdy4KKyMgKworIyArICAxMi4gTm8gU3VycmVuZGVyIG9mIE90aGVycycgRnJl
ZWRvbS4KKyMgKworIyArICBJZiBjb25kaXRpb25zIGFyZSBpbXBvc2VkIG9uIHlvdSAod2hldGhl
ciBieSBjb3VydCBvcmRlciwgYWdyZWVtZW50IG9yCisjICBvdGhlcndpc2UpIHRoYXQgY29udHJh
ZGljdCB0aGUgY29uZGl0aW9ucyBvZiB0aGlzIExpY2Vuc2UsIHRoZXkgZG8gbm90CisjIC1leGN1
c2UgeW91IGZyb20gdGhlIGNvbmRpdGlvbnMgb2YgdGhpcyBMaWNlbnNlLiAgSWYgeW91IGNhbm5v
dAorIyAtZGlzdHJpYnV0ZSBzbyBhcyB0byBzYXRpc2Z5IHNpbXVsdGFuZW91c2x5IHlvdXIgb2Js
aWdhdGlvbnMgdW5kZXIgdGhpcworIyAtTGljZW5zZSBhbmQgYW55IG90aGVyIHBlcnRpbmVudCBv
YmxpZ2F0aW9ucywgdGhlbiBhcyBhIGNvbnNlcXVlbmNlIHlvdQorIyAtbWF5IG5vdCBkaXN0cmli
dXRlIHRoZSBQcm9ncmFtIGF0IGFsbC4gIEZvciBleGFtcGxlLCBpZiBhIHBhdGVudAorIyAtbGlj
ZW5zZSB3b3VsZCBub3QgcGVybWl0IHJveWFsdHktZnJlZSByZWRpc3RyaWJ1dGlvbiBvZiB0aGUg
UHJvZ3JhbSBieQorIyAtYWxsIHRob3NlIHdobyByZWNlaXZlIGNvcGllcyBkaXJlY3RseSBvciBp
bmRpcmVjdGx5IHRocm91Z2ggeW91LCB0aGVuCisjIC10aGUgb25seSB3YXkgeW91IGNvdWxkIHNh
dGlzZnkgYm90aCBpdCBhbmQgdGhpcyBMaWNlbnNlIHdvdWxkIGJlIHRvCisjIC1yZWZyYWluIGVu
dGlyZWx5IGZyb20gZGlzdHJpYnV0aW9uIG9mIHRoZSBQcm9ncmFtLgorIyAtCisjIC1JZiBhbnkg
cG9ydGlvbiBvZiB0aGlzIHNlY3Rpb24gaXMgaGVsZCBpbnZhbGlkIG9yIHVuZW5mb3JjZWFibGUg
dW5kZXIKKyMgLWFueSBwYXJ0aWN1bGFyIGNpcmN1bXN0YW5jZSwgdGhlIGJhbGFuY2Ugb2YgdGhl
IHNlY3Rpb24gaXMgaW50ZW5kZWQgdG8KKyMgLWFwcGx5IGFuZCB0aGUgc2VjdGlvbiBhcyBhIHdo
b2xlIGlzIGludGVuZGVkIHRvIGFwcGx5IGluIG90aGVyCisjIC1jaXJjdW1zdGFuY2VzLgorIyAt
CisjIC1JdCBpcyBub3QgdGhlIHB1cnBvc2Ugb2YgdGhpcyBzZWN0aW9uIHRvIGluZHVjZSB5b3Ug
dG8gaW5mcmluZ2UgYW55CisjIC1wYXRlbnRzIG9yIG90aGVyIHByb3BlcnR5IHJpZ2h0IGNsYWlt
cyBvciB0byBjb250ZXN0IHZhbGlkaXR5IG9mIGFueQorIyAtc3VjaCBjbGFpbXM7IHRoaXMgc2Vj
dGlvbiBoYXMgdGhlIHNvbGUgcHVycG9zZSBvZiBwcm90ZWN0aW5nIHRoZQorIyAtaW50ZWdyaXR5
IG9mIHRoZSBmcmVlIHNvZnR3YXJlIGRpc3RyaWJ1dGlvbiBzeXN0ZW0sIHdoaWNoIGlzCisjIC1p
bXBsZW1lbnRlZCBieSBwdWJsaWMgbGljZW5zZSBwcmFjdGljZXMuICBNYW55IHBlb3BsZSBoYXZl
IG1hZGUKKyMgLWdlbmVyb3VzIGNvbnRyaWJ1dGlvbnMgdG8gdGhlIHdpZGUgcmFuZ2Ugb2Ygc29m
dHdhcmUgZGlzdHJpYnV0ZWQKKyMgLXRocm91Z2ggdGhhdCBzeXN0ZW0gaW4gcmVsaWFuY2Ugb24g
Y29uc2lzdGVudCBhcHBsaWNhdGlvbiBvZiB0aGF0CisjIC1zeXN0ZW07IGl0IGlzIHVwIHRvIHRo
ZSBhdXRob3IvZG9ub3IgdG8gZGVjaWRlIGlmIGhlIG9yIHNoZSBpcyB3aWxsaW5nCisjIC10byBk
aXN0cmlidXRlIHNvZnR3YXJlIHRocm91Z2ggYW55IG90aGVyIHN5c3RlbSBhbmQgYSBsaWNlbnNl
ZSBjYW5ub3QKKyMgLWltcG9zZSB0aGF0IGNob2ljZS4KKyMgLQorIyAtVGhpcyBzZWN0aW9uIGlz
IGludGVuZGVkIHRvIG1ha2UgdGhvcm91Z2hseSBjbGVhciB3aGF0IGlzIGJlbGlldmVkIHRvCisj
IC1iZSBhIGNvbnNlcXVlbmNlIG9mIHRoZSByZXN0IG9mIHRoaXMgTGljZW5zZS4KKyMgLQorIyAt
ICA4LiBJZiB0aGUgZGlzdHJpYnV0aW9uIGFuZC9vciB1c2Ugb2YgdGhlIFByb2dyYW0gaXMgcmVz
dHJpY3RlZCBpbgorIyAtY2VydGFpbiBjb3VudHJpZXMgZWl0aGVyIGJ5IHBhdGVudHMgb3IgYnkg
Y29weXJpZ2h0ZWQgaW50ZXJmYWNlcywgdGhlCisjIC1vcmlnaW5hbCBjb3B5cmlnaHQgaG9sZGVy
IHdobyBwbGFjZXMgdGhlIFByb2dyYW0gdW5kZXIgdGhpcyBMaWNlbnNlCisjIC1tYXkgYWRkIGFu
IGV4cGxpY2l0IGdlb2dyYXBoaWNhbCBkaXN0cmlidXRpb24gbGltaXRhdGlvbiBleGNsdWRpbmcK
KyMgLXRob3NlIGNvdW50cmllcywgc28gdGhhdCBkaXN0cmlidXRpb24gaXMgcGVybWl0dGVkIG9u
bHkgaW4gb3IgYW1vbmcKKyMgLWNvdW50cmllcyBub3QgdGh1cyBleGNsdWRlZC4gIEluIHN1Y2gg
Y2FzZSwgdGhpcyBMaWNlbnNlIGluY29ycG9yYXRlcworIyAtdGhlIGxpbWl0YXRpb24gYXMgaWYg
d3JpdHRlbiBpbiB0aGUgYm9keSBvZiB0aGlzIExpY2Vuc2UuCisjIC0KKyMgLSAgOS4gVGhlIEZy
ZWUgU29mdHdhcmUgRm91bmRhdGlvbiBtYXkgcHVibGlzaCByZXZpc2VkIGFuZC9vciBuZXcgdmVy
c2lvbnMKKyMgLW9mIHRoZSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZyb20gdGltZSB0byB0aW1l
LiAgU3VjaCBuZXcgdmVyc2lvbnMgd2lsbAorIyArZXhjdXNlIHlvdSBmcm9tIHRoZSBjb25kaXRp
b25zIG9mIHRoaXMgTGljZW5zZS4gIElmIHlvdSBjYW5ub3QgY29udmV5IGEKKyMgK2NvdmVyZWQg
d29yayBzbyBhcyB0byBzYXRpc2Z5IHNpbXVsdGFuZW91c2x5IHlvdXIgb2JsaWdhdGlvbnMgdW5k
ZXIgdGhpcworIyArTGljZW5zZSBhbmQgYW55IG90aGVyIHBlcnRpbmVudCBvYmxpZ2F0aW9ucywg
dGhlbiBhcyBhIGNvbnNlcXVlbmNlIHlvdSBtYXkKKyMgK25vdCBjb252ZXkgaXQgYXQgYWxsLiAg
Rm9yIGV4YW1wbGUsIGlmIHlvdSBhZ3JlZSB0byB0ZXJtcyB0aGF0IG9ibGlnYXRlIHlvdQorIyAr
dG8gY29sbGVjdCBhIHJveWFsdHkgZm9yIGZ1cnRoZXIgY29udmV5aW5nIGZyb20gdGhvc2UgdG8g
d2hvbSB5b3UgY29udmV5CisjICt0aGUgUHJvZ3JhbSwgdGhlIG9ubHkgd2F5IHlvdSBjb3VsZCBz
YXRpc2Z5IGJvdGggdGhvc2UgdGVybXMgYW5kIHRoaXMKKyMgK0xpY2Vuc2Ugd291bGQgYmUgdG8g
cmVmcmFpbiBlbnRpcmVseSBmcm9tIGNvbnZleWluZyB0aGUgUHJvZ3JhbS4KKyMgKworIyArICAx
My4gVXNlIHdpdGggdGhlIEdOVSBBZmZlcm8gR2VuZXJhbCBQdWJsaWMgTGljZW5zZS4KKyMgKwor
IyArICBOb3R3aXRoc3RhbmRpbmcgYW55IG90aGVyIHByb3Zpc2lvbiBvZiB0aGlzIExpY2Vuc2Us
IHlvdSBoYXZlCisjICtwZXJtaXNzaW9uIHRvIGxpbmsgb3IgY29tYmluZSBhbnkgY292ZXJlZCB3
b3JrIHdpdGggYSB3b3JrIGxpY2Vuc2VkCisjICt1bmRlciB2ZXJzaW9uIDMgb2YgdGhlIEdOVSBB
ZmZlcm8gR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBpbnRvIGEgc2luZ2xlCisjICtjb21iaW5lZCB3
b3JrLCBhbmQgdG8gY29udmV5IHRoZSByZXN1bHRpbmcgd29yay4gIFRoZSB0ZXJtcyBvZiB0aGlz
CisjICtMaWNlbnNlIHdpbGwgY29udGludWUgdG8gYXBwbHkgdG8gdGhlIHBhcnQgd2hpY2ggaXMg
dGhlIGNvdmVyZWQgd29yaywKKyMgK2J1dCB0aGUgc3BlY2lhbCByZXF1aXJlbWVudHMgb2YgdGhl
IEdOVSBBZmZlcm8gR2VuZXJhbCBQdWJsaWMgTGljZW5zZSwKKyMgK3NlY3Rpb24gMTMsIGNvbmNl
cm5pbmcgaW50ZXJhY3Rpb24gdGhyb3VnaCBhIG5ldHdvcmsgd2lsbCBhcHBseSB0byB0aGUKKyMg
K2NvbWJpbmF0aW9uIGFzIHN1Y2guCisjICsKKyMgKyAgMTQuIFJldmlzZWQgVmVyc2lvbnMgb2Yg
dGhpcyBMaWNlbnNlLgorIyArCisjICsgIFRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24gbWF5
IHB1Ymxpc2ggcmV2aXNlZCBhbmQvb3IgbmV3IHZlcnNpb25zIG9mCisjICt0aGUgR05VIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UgZnJvbSB0aW1lIHRvIHRpbWUuICBTdWNoIG5ldyB2ZXJzaW9ucyB3
aWxsCisjICBiZSBzaW1pbGFyIGluIHNwaXJpdCB0byB0aGUgcHJlc2VudCB2ZXJzaW9uLCBidXQg
bWF5IGRpZmZlciBpbiBkZXRhaWwgdG8KKyMgIGFkZHJlc3MgbmV3IHByb2JsZW1zIG9yIGNvbmNl
cm5zLgorIyAgCisjIC1FYWNoIHZlcnNpb24gaXMgZ2l2ZW4gYSBkaXN0aW5ndWlzaGluZyB2ZXJz
aW9uIG51bWJlci4gIElmIHRoZSBQcm9ncmFtCisjIC1zcGVjaWZpZXMgYSB2ZXJzaW9uIG51bWJl
ciBvZiB0aGlzIExpY2Vuc2Ugd2hpY2ggYXBwbGllcyB0byBpdCBhbmQgImFueQorIyAtbGF0ZXIg
dmVyc2lvbiIsIHlvdSBoYXZlIHRoZSBvcHRpb24gb2YgZm9sbG93aW5nIHRoZSB0ZXJtcyBhbmQg
Y29uZGl0aW9ucworIyAtZWl0aGVyIG9mIHRoYXQgdmVyc2lvbiBvciBvZiBhbnkgbGF0ZXIgdmVy
c2lvbiBwdWJsaXNoZWQgYnkgdGhlIEZyZWUKKyMgLVNvZnR3YXJlIEZvdW5kYXRpb24uICBJZiB0
aGUgUHJvZ3JhbSBkb2VzIG5vdCBzcGVjaWZ5IGEgdmVyc2lvbiBudW1iZXIgb2YKKyMgLXRoaXMg
TGljZW5zZSwgeW91IG1heSBjaG9vc2UgYW55IHZlcnNpb24gZXZlciBwdWJsaXNoZWQgYnkgdGhl
IEZyZWUgU29mdHdhcmUKKyMgLUZvdW5kYXRpb24uCisjIC0KKyMgLSAgMTAuIElmIHlvdSB3aXNo
IHRvIGluY29ycG9yYXRlIHBhcnRzIG9mIHRoZSBQcm9ncmFtIGludG8gb3RoZXIgZnJlZQorIyAt
cHJvZ3JhbXMgd2hvc2UgZGlzdHJpYnV0aW9uIGNvbmRpdGlvbnMgYXJlIGRpZmZlcmVudCwgd3Jp
dGUgdG8gdGhlIGF1dGhvcgorIyAtdG8gYXNrIGZvciBwZXJtaXNzaW9uLiAgRm9yIHNvZnR3YXJl
IHdoaWNoIGlzIGNvcHlyaWdodGVkIGJ5IHRoZSBGcmVlCisjIC1Tb2Z0d2FyZSBGb3VuZGF0aW9u
LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyB3ZSBzb21ldGltZXMKKyMg
LW1ha2UgZXhjZXB0aW9ucyBmb3IgdGhpcy4gIE91ciBkZWNpc2lvbiB3aWxsIGJlIGd1aWRlZCBi
eSB0aGUgdHdvIGdvYWxzCisjIC1vZiBwcmVzZXJ2aW5nIHRoZSBmcmVlIHN0YXR1cyBvZiBhbGwg
ZGVyaXZhdGl2ZXMgb2Ygb3VyIGZyZWUgc29mdHdhcmUgYW5kCisjIC1vZiBwcm9tb3RpbmcgdGhl
IHNoYXJpbmcgYW5kIHJldXNlIG9mIHNvZnR3YXJlIGdlbmVyYWxseS4KKyMgLQorIyAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIE5PIFdBUlJBTlRZCisjIC0KKyMgLSAgMTEuIEJFQ0FVU0Ug
VEhFIFBST0dSQU0gSVMgTElDRU5TRUQgRlJFRSBPRiBDSEFSR0UsIFRIRVJFIElTIE5PIFdBUlJB
TlRZCisjIC1GT1IgVEhFIFBST0dSQU0sIFRPIFRIRSBFWFRFTlQgUEVSTUlUVEVEIEJZIEFQUExJ
Q0FCTEUgTEFXLiAgRVhDRVBUIFdIRU4KKyMgLU9USEVSV0lTRSBTVEFURUQgSU4gV1JJVElORyBU
SEUgQ09QWVJJR0hUIEhPTERFUlMgQU5EL09SIE9USEVSIFBBUlRJRVMKKyMgLVBST1ZJREUgVEhF
IFBST0dSQU0gIkFTIElTIiBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFSVRIRVIgRVhQ
UkVTU0VECisjIC1PUiBJTVBMSUVELCBJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywgVEhF
IElNUExJRUQgV0FSUkFOVElFUyBPRgorIyAtTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZP
UiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFRIRSBFTlRJUkUgUklTSyBBUworIyAtVE8gVEhFIFFV
QUxJVFkgQU5EIFBFUkZPUk1BTkNFIE9GIFRIRSBQUk9HUkFNIElTIFdJVEggWU9VLiAgU0hPVUxE
IFRIRQorIyAtUFJPR1JBTSBQUk9WRSBERUZFQ1RJVkUsIFlPVSBBU1NVTUUgVEhFIENPU1QgT0Yg
QUxMIE5FQ0VTU0FSWSBTRVJWSUNJTkcsCisjIC1SRVBBSVIgT1IgQ09SUkVDVElPTi4KKyMgLQor
IyAtICAxMi4gSU4gTk8gRVZFTlQgVU5MRVNTIFJFUVVJUkVEIEJZIEFQUExJQ0FCTEUgTEFXIE9S
IEFHUkVFRCBUTyBJTiBXUklUSU5HCisjIC1XSUxMIEFOWSBDT1BZUklHSFQgSE9MREVSLCBPUiBB
TlkgT1RIRVIgUEFSVFkgV0hPIE1BWSBNT0RJRlkgQU5EL09SCisjIC1SRURJU1RSSUJVVEUgVEhF
IFBST0dSQU0gQVMgUEVSTUlUVEVEIEFCT1ZFLCBCRSBMSUFCTEUgVE8gWU9VIEZPUiBEQU1BR0VT
LAorIyAtSU5DTFVESU5HIEFOWSBHRU5FUkFMLCBTUEVDSUFMLCBJTkNJREVOVEFMIE9SIENPTlNF
UVVFTlRJQUwgREFNQUdFUyBBUklTSU5HCisjIC1PVVQgT0YgVEhFIFVTRSBPUiBJTkFCSUxJVFkg
VE8gVVNFIFRIRSBQUk9HUkFNIChJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVECisjIC1UTyBMT1NT
IE9GIERBVEEgT1IgREFUQSBCRUlORyBSRU5ERVJFRCBJTkFDQ1VSQVRFIE9SIExPU1NFUyBTVVNU
QUlORUQgQlkKKyMgLVlPVSBPUiBUSElSRCBQQVJUSUVTIE9SIEEgRkFJTFVSRSBPRiBUSEUgUFJP
R1JBTSBUTyBPUEVSQVRFIFdJVEggQU5ZIE9USEVSCisjIC1QUk9HUkFNUyksIEVWRU4gSUYgU1VD
SCBIT0xERVIgT1IgT1RIRVIgUEFSVFkgSEFTIEJFRU4gQURWSVNFRCBPRiBUSEUKKyMgLVBPU1NJ
QklMSVRZIE9GIFNVQ0ggREFNQUdFUy4KKyMgKyAgRWFjaCB2ZXJzaW9uIGlzIGdpdmVuIGEgZGlz
dGluZ3Vpc2hpbmcgdmVyc2lvbiBudW1iZXIuICBJZiB0aGUKKyMgK1Byb2dyYW0gc3BlY2lmaWVz
IHRoYXQgYSBjZXJ0YWluIG51bWJlcmVkIHZlcnNpb24gb2YgdGhlIEdOVSBHZW5lcmFsCisjICtQ
dWJsaWMgTGljZW5zZSAib3IgYW55IGxhdGVyIHZlcnNpb24iIGFwcGxpZXMgdG8gaXQsIHlvdSBo
YXZlIHRoZQorIyArb3B0aW9uIG9mIGZvbGxvd2luZyB0aGUgdGVybXMgYW5kIGNvbmRpdGlvbnMg
ZWl0aGVyIG9mIHRoYXQgbnVtYmVyZWQKKyMgK3ZlcnNpb24gb3Igb2YgYW55IGxhdGVyIHZlcnNp
b24gcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlCisjICtGb3VuZGF0aW9uLiAgSWYgdGhl
IFByb2dyYW0gZG9lcyBub3Qgc3BlY2lmeSBhIHZlcnNpb24gbnVtYmVyIG9mIHRoZQorIyArR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UsIHlvdSBtYXkgY2hvb3NlIGFueSB2ZXJzaW9uIGV2ZXIg
cHVibGlzaGVkCisjICtieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgorIyArCisjICsg
IElmIHRoZSBQcm9ncmFtIHNwZWNpZmllcyB0aGF0IGEgcHJveHkgY2FuIGRlY2lkZSB3aGljaCBm
dXR1cmUKKyMgK3ZlcnNpb25zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBjYW4g
YmUgdXNlZCwgdGhhdCBwcm94eSdzCisjICtwdWJsaWMgc3RhdGVtZW50IG9mIGFjY2VwdGFuY2Ug
b2YgYSB2ZXJzaW9uIHBlcm1hbmVudGx5IGF1dGhvcml6ZXMgeW91CisjICt0byBjaG9vc2UgdGhh
dCB2ZXJzaW9uIGZvciB0aGUgUHJvZ3JhbS4KKyMgKworIyArICBMYXRlciBsaWNlbnNlIHZlcnNp
b25zIG1heSBnaXZlIHlvdSBhZGRpdGlvbmFsIG9yIGRpZmZlcmVudAorIyArcGVybWlzc2lvbnMu
ICBIb3dldmVyLCBubyBhZGRpdGlvbmFsIG9ibGlnYXRpb25zIGFyZSBpbXBvc2VkIG9uIGFueQor
IyArYXV0aG9yIG9yIGNvcHlyaWdodCBob2xkZXIgYXMgYSByZXN1bHQgb2YgeW91ciBjaG9vc2lu
ZyB0byBmb2xsb3cgYQorIyArbGF0ZXIgdmVyc2lvbi4KKyMgKworIyArICAxNS4gRGlzY2xhaW1l
ciBvZiBXYXJyYW50eS4KKyMgKworIyArICBUSEVSRSBJUyBOTyBXQVJSQU5UWSBGT1IgVEhFIFBS
T0dSQU0sIFRPIFRIRSBFWFRFTlQgUEVSTUlUVEVEIEJZCisjICtBUFBMSUNBQkxFIExBVy4gIEVY
Q0VQVCBXSEVOIE9USEVSV0lTRSBTVEFURUQgSU4gV1JJVElORyBUSEUgQ09QWVJJR0hUCisjICtI
T0xERVJTIEFORC9PUiBPVEhFUiBQQVJUSUVTIFBST1ZJREUgVEhFIFBST0dSQU0gIkFTIElTIiBX
SVRIT1VUIFdBUlJBTlRZCisjICtPRiBBTlkgS0lORCwgRUlUSEVSIEVYUFJFU1NFRCBPUiBJTVBM
SUVELCBJTkNMVURJTkcsIEJVVCBOT1QgTElNSVRFRCBUTywKKyMgK1RIRSBJTVBMSUVEIFdBUlJB
TlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZIEFORCBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIKKyMg
K1BVUlBPU0UuICBUSEUgRU5USVJFIFJJU0sgQVMgVE8gVEhFIFFVQUxJVFkgQU5EIFBFUkZPUk1B
TkNFIE9GIFRIRSBQUk9HUkFNCisjICtJUyBXSVRIIFlPVS4gIFNIT1VMRCBUSEUgUFJPR1JBTSBQ
Uk9WRSBERUZFQ1RJVkUsIFlPVSBBU1NVTUUgVEhFIENPU1QgT0YKKyMgK0FMTCBORUNFU1NBUlkg
U0VSVklDSU5HLCBSRVBBSVIgT1IgQ09SUkVDVElPTi4KKyMgKworIyArICAxNi4gTGltaXRhdGlv
biBvZiBMaWFiaWxpdHkuCisjICsKKyMgKyAgSU4gTk8gRVZFTlQgVU5MRVNTIFJFUVVJUkVEIEJZ
IEFQUExJQ0FCTEUgTEFXIE9SIEFHUkVFRCBUTyBJTiBXUklUSU5HCisjICtXSUxMIEFOWSBDT1BZ
UklHSFQgSE9MREVSLCBPUiBBTlkgT1RIRVIgUEFSVFkgV0hPIE1PRElGSUVTIEFORC9PUiBDT05W
RVlTCisjICtUSEUgUFJPR1JBTSBBUyBQRVJNSVRURUQgQUJPVkUsIEJFIExJQUJMRSBUTyBZT1Ug
Rk9SIERBTUFHRVMsIElOQ0xVRElORyBBTlkKKyMgK0dFTkVSQUwsIFNQRUNJQUwsIElOQ0lERU5U
QUwgT1IgQ09OU0VRVUVOVElBTCBEQU1BR0VTIEFSSVNJTkcgT1VUIE9GIFRIRQorIyArVVNFIE9S
IElOQUJJTElUWSBUTyBVU0UgVEhFIFBST0dSQU0gKElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQg
VE8gTE9TUyBPRgorIyArREFUQSBPUiBEQVRBIEJFSU5HIFJFTkRFUkVEIElOQUNDVVJBVEUgT1Ig
TE9TU0VTIFNVU1RBSU5FRCBCWSBZT1UgT1IgVEhJUkQKKyMgK1BBUlRJRVMgT1IgQSBGQUlMVVJF
IE9GIFRIRSBQUk9HUkFNIFRPIE9QRVJBVEUgV0lUSCBBTlkgT1RIRVIgUFJPR1JBTVMpLAorIyAr
RVZFTiBJRiBTVUNIIEhPTERFUiBPUiBPVEhFUiBQQVJUWSBIQVMgQkVFTiBBRFZJU0VEIE9GIFRI
RSBQT1NTSUJJTElUWSBPRgorIyArU1VDSCBEQU1BR0VTLgorIyArCisjICsgIDE3LiBJbnRlcnBy
ZXRhdGlvbiBvZiBTZWN0aW9ucyAxNSBhbmQgMTYuCisjICsKKyMgKyAgSWYgdGhlIGRpc2NsYWlt
ZXIgb2Ygd2FycmFudHkgYW5kIGxpbWl0YXRpb24gb2YgbGlhYmlsaXR5IHByb3ZpZGVkCisjICth
Ym92ZSBjYW5ub3QgYmUgZ2l2ZW4gbG9jYWwgbGVnYWwgZWZmZWN0IGFjY29yZGluZyB0byB0aGVp
ciB0ZXJtcywKKyMgK3Jldmlld2luZyBjb3VydHMgc2hhbGwgYXBwbHkgbG9jYWwgbGF3IHRoYXQg
bW9zdCBjbG9zZWx5IGFwcHJveGltYXRlcworIyArYW4gYWJzb2x1dGUgd2FpdmVyIG9mIGFsbCBj
aXZpbCBsaWFiaWxpdHkgaW4gY29ubmVjdGlvbiB3aXRoIHRoZQorIyArUHJvZ3JhbSwgdW5sZXNz
IGEgd2FycmFudHkgb3IgYXNzdW1wdGlvbiBvZiBsaWFiaWxpdHkgYWNjb21wYW5pZXMgYQorIyAr
Y29weSBvZiB0aGUgUHJvZ3JhbSBpbiByZXR1cm4gZm9yIGEgZmVlLgorIyAgCisjICAgICAgICAg
ICAgICAgICAgICAgICBFTkQgT0YgVEVSTVMgQU5EIENPTkRJVElPTlMKKyMgIAorIyBAQCAtMjg3
LDE1ICs2MjgsMTUgQEAKKyMgIAorIyAgICBUbyBkbyBzbywgYXR0YWNoIHRoZSBmb2xsb3dpbmcg
bm90aWNlcyB0byB0aGUgcHJvZ3JhbS4gIEl0IGlzIHNhZmVzdAorIyAgdG8gYXR0YWNoIHRoZW0g
dG8gdGhlIHN0YXJ0IG9mIGVhY2ggc291cmNlIGZpbGUgdG8gbW9zdCBlZmZlY3RpdmVseQorIyAt
Y29udmV5IHRoZSBleGNsdXNpb24gb2Ygd2FycmFudHk7IGFuZCBlYWNoIGZpbGUgc2hvdWxkIGhh
dmUgYXQgbGVhc3QKKyMgK3N0YXRlIHRoZSBleGNsdXNpb24gb2Ygd2FycmFudHk7IGFuZCBlYWNo
IGZpbGUgc2hvdWxkIGhhdmUgYXQgbGVhc3QKKyMgIHRoZSAiY29weXJpZ2h0IiBsaW5lIGFuZCBh
IHBvaW50ZXIgdG8gd2hlcmUgdGhlIGZ1bGwgbm90aWNlIGlzIGZvdW5kLgorIyAgCisjICAgICAg
PG9uZSBsaW5lIHRvIGdpdmUgdGhlIHByb2dyYW0ncyBuYW1lIGFuZCBhIGJyaWVmIGlkZWEgb2Yg
d2hhdCBpdCBkb2VzLj4KKyMgICAgICBDb3B5cmlnaHQgKEMpIDx5ZWFyPiAgPG5hbWUgb2YgYXV0
aG9yPgorIyAgCisjIC0gICAgVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4g
cmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyMgKyAgICBUaGlzIHByb2dyYW0gaXMgZnJl
ZSBzb2Z0d2FyZTogeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorIyAgICAg
IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMg
cHVibGlzaGVkIGJ5CisjIC0gICAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVy
IHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwgb3IKKyMgKyAgICB0aGUgRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uLCBlaXRoZXIgdmVyc2lvbiAzIG9mIHRoZSBMaWNlbnNlLCBvcgorIyAgICAgIChh
dCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisjICAKKyMgICAgICBUaGlzIHByb2dy
YW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyMg
QEAgLTMwMywzNyArNjQ0LDMxIEBACisjICAgICAgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1Mg
Rk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQorIyAgICAgIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisjICAKKyMgLSAgICBZb3Ugc2hvdWxkIGhh
dmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhbG9u
ZworIyAtICAgIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb24sIEluYy4sCisjIC0gICAgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0
aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVTQS4KKyMgKyAgICBZb3Ugc2hvdWxkIGhh
dmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQorIyAr
ICAgIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtLiAgSWYgbm90LCBzZWUgPGh0dHBzOi8vd3d3Lmdu
dS5vcmcvbGljZW5zZXMvPi4KKyMgIAorIyAgQWxzbyBhZGQgaW5mb3JtYXRpb24gb24gaG93IHRv
IGNvbnRhY3QgeW91IGJ5IGVsZWN0cm9uaWMgYW5kIHBhcGVyIG1haWwuCisjICAKKyMgLUlmIHRo
ZSBwcm9ncmFtIGlzIGludGVyYWN0aXZlLCBtYWtlIGl0IG91dHB1dCBhIHNob3J0IG5vdGljZSBs
aWtlIHRoaXMKKyMgLXdoZW4gaXQgc3RhcnRzIGluIGFuIGludGVyYWN0aXZlIG1vZGU6CisjIC0K
KyMgLSAgICBHbm9tb3Zpc2lvbiB2ZXJzaW9uIDY5LCBDb3B5cmlnaHQgKEMpIHllYXIgbmFtZSBv
ZiBhdXRob3IKKyMgLSAgICBHbm9tb3Zpc2lvbiBjb21lcyB3aXRoIEFCU09MVVRFTFkgTk8gV0FS
UkFOVFk7IGZvciBkZXRhaWxzIHR5cGUgYHNob3cgdycuCisjICsgIElmIHRoZSBwcm9ncmFtIGRv
ZXMgdGVybWluYWwgaW50ZXJhY3Rpb24sIG1ha2UgaXQgb3V0cHV0IGEgc2hvcnQKKyMgK25vdGlj
ZSBsaWtlIHRoaXMgd2hlbiBpdCBzdGFydHMgaW4gYW4gaW50ZXJhY3RpdmUgbW9kZToKKyMgKwor
IyArICAgIDxwcm9ncmFtPiAgQ29weXJpZ2h0IChDKSA8eWVhcj4gIDxuYW1lIG9mIGF1dGhvcj4K
KyMgKyAgICBUaGlzIHByb2dyYW0gY29tZXMgd2l0aCBBQlNPTFVURUxZIE5PIFdBUlJBTlRZOyBm
b3IgZGV0YWlscyB0eXBlIGBzaG93IHcnLgorIyAgICAgIFRoaXMgaXMgZnJlZSBzb2Z0d2FyZSwg
YW5kIHlvdSBhcmUgd2VsY29tZSB0byByZWRpc3RyaWJ1dGUgaXQKKyMgICAgICB1bmRlciBjZXJ0
YWluIGNvbmRpdGlvbnM7IHR5cGUgYHNob3cgYycgZm9yIGRldGFpbHMuCisjICAKKyMgIFRoZSBo
eXBvdGhldGljYWwgY29tbWFuZHMgYHNob3cgdycgYW5kIGBzaG93IGMnIHNob3VsZCBzaG93IHRo
ZSBhcHByb3ByaWF0ZQorIyAtcGFydHMgb2YgdGhlIEdlbmVyYWwgUHVibGljIExpY2Vuc2UuICBP
ZiBjb3Vyc2UsIHRoZSBjb21tYW5kcyB5b3UgdXNlIG1heQorIyAtYmUgY2FsbGVkIHNvbWV0aGlu
ZyBvdGhlciB0aGFuIGBzaG93IHcnIGFuZCBgc2hvdyBjJzsgdGhleSBjb3VsZCBldmVuIGJlCisj
IC1tb3VzZS1jbGlja3Mgb3IgbWVudSBpdGVtcy0td2hhdGV2ZXIgc3VpdHMgeW91ciBwcm9ncmFt
LgorIyAtCisjIC1Zb3Ugc2hvdWxkIGFsc28gZ2V0IHlvdXIgZW1wbG95ZXIgKGlmIHlvdSB3b3Jr
IGFzIGEgcHJvZ3JhbW1lcikgb3IgeW91cgorIyAtc2Nob29sLCBpZiBhbnksIHRvIHNpZ24gYSAi
Y29weXJpZ2h0IGRpc2NsYWltZXIiIGZvciB0aGUgcHJvZ3JhbSwgaWYKKyMgLW5lY2Vzc2FyeS4g
IEhlcmUgaXMgYSBzYW1wbGU7IGFsdGVyIHRoZSBuYW1lczoKKyMgLQorIyAtICBZb3lvZHluZSwg
SW5jLiwgaGVyZWJ5IGRpc2NsYWltcyBhbGwgY29weXJpZ2h0IGludGVyZXN0IGluIHRoZSBwcm9n
cmFtCisjIC0gIGBHbm9tb3Zpc2lvbicgKHdoaWNoIG1ha2VzIHBhc3NlcyBhdCBjb21waWxlcnMp
IHdyaXR0ZW4gYnkgSmFtZXMgSGFja2VyLgorIyAtCisjIC0gIDxzaWduYXR1cmUgb2YgVHkgQ29v
bj4sIDEgQXByaWwgMTk4OQorIyAtICBUeSBDb29uLCBQcmVzaWRlbnQgb2YgVmljZQorIyAtCisj
IC1UaGlzIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZG9lcyBub3QgcGVybWl0IGluY29ycG9yYXRp
bmcgeW91ciBwcm9ncmFtIGludG8KKyMgLXByb3ByaWV0YXJ5IHByb2dyYW1zLiAgSWYgeW91ciBw
cm9ncmFtIGlzIGEgc3Vicm91dGluZSBsaWJyYXJ5LCB5b3UgbWF5CisjIC1jb25zaWRlciBpdCBt
b3JlIHVzZWZ1bCB0byBwZXJtaXQgbGlua2luZyBwcm9wcmlldGFyeSBhcHBsaWNhdGlvbnMgd2l0
aCB0aGUKKyMgLWxpYnJhcnkuICBJZiB0aGlzIGlzIHdoYXQgeW91IHdhbnQgdG8gZG8sIHVzZSB0
aGUgR05VIExlc3NlciBHZW5lcmFsCisjIC1QdWJsaWMgTGljZW5zZSBpbnN0ZWFkIG9mIHRoaXMg
TGljZW5zZS4KKyMgK3BhcnRzIG9mIHRoZSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlLiAgT2YgY291
cnNlLCB5b3VyIHByb2dyYW0ncyBjb21tYW5kcworIyArbWlnaHQgYmUgZGlmZmVyZW50OyBmb3Ig
YSBHVUkgaW50ZXJmYWNlLCB5b3Ugd291bGQgdXNlIGFuICJhYm91dCBib3giLgorIyArCisjICsg
IFlvdSBzaG91bGQgYWxzbyBnZXQgeW91ciBlbXBsb3llciAoaWYgeW91IHdvcmsgYXMgYSBwcm9n
cmFtbWVyKSBvciBzY2hvb2wsCisjICtpZiBhbnksIHRvIHNpZ24gYSAiY29weXJpZ2h0IGRpc2Ns
YWltZXIiIGZvciB0aGUgcHJvZ3JhbSwgaWYgbmVjZXNzYXJ5LgorIyArRm9yIG1vcmUgaW5mb3Jt
YXRpb24gb24gdGhpcywgYW5kIGhvdyB0byBhcHBseSBhbmQgZm9sbG93IHRoZSBHTlUgR1BMLCBz
ZWUKKyMgKzxodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisjICsKKyMgKyAgVGhlIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGRvZXMgbm90IHBlcm1pdCBpbmNvcnBvcmF0aW5nIHlv
dXIgcHJvZ3JhbQorIyAraW50byBwcm9wcmlldGFyeSBwcm9ncmFtcy4gIElmIHlvdXIgcHJvZ3Jh
bSBpcyBhIHN1YnJvdXRpbmUgbGlicmFyeSwgeW91CisjICttYXkgY29uc2lkZXIgaXQgbW9yZSB1
c2VmdWwgdG8gcGVybWl0IGxpbmtpbmcgcHJvcHJpZXRhcnkgYXBwbGljYXRpb25zIHdpdGgKKyMg
K3RoZSBsaWJyYXJ5LiAgSWYgdGhpcyBpcyB3aGF0IHlvdSB3YW50IHRvIGRvLCB1c2UgdGhlIEdO
VSBMZXNzZXIgR2VuZXJhbAorIyArUHVibGljIExpY2Vuc2UgaW5zdGVhZCBvZiB0aGlzIExpY2Vu
c2UuICBCdXQgZmlyc3QsIHBsZWFzZSByZWFkCisjICs8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNl
bnNlcy93aHktbm90LWxncGwuaHRtbD4uCisjIC0tLSBpbmNsdWRlL3B1Yl90b29sX2Jhc2ljcy5o
CisjICsrKyBpbmNsdWRlL3B1Yl90b29sX2Jhc2ljcy5oCisjIEBAIC03LDcgKzcsNyBAQAorIyAg
CisjICAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1
dGUgaXQgYW5kL29yCisjICAgICBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcworIyAtICAgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlCisjICsgICBwdWJsaXNo
ZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMyBvZiB0
aGUKKyMgICAgIExpY2Vuc2UsIG9yIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24u
CisjICAKKyMgICAgIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0
IGl0IHdpbGwgYmUgdXNlZnVsLCBidXQKKyMgLS0tIGluY2x1ZGUvdmFsZ3JpbmQuaAorIyArKysg
aW5jbHVkZS92YWxncmluZC5oCisjIEBAIC0zLDcgKzMsNyBAQAorIyAgCisjICAgICBOb3RpY2Ug
dGhhdCB0aGUgZm9sbG93aW5nIEJTRC1zdHlsZSBsaWNlbnNlIGFwcGxpZXMgdG8gdGhpcyBvbmUK
KyMgICAgIGZpbGUgKHZhbGdyaW5kLmgpIG9ubHkuICBUaGUgcmVzdCBvZiBWYWxncmluZCBpcyBs
aWNlbnNlZCB1bmRlciB0aGUKKyMgLSAgIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSwgdmVyc2lvbiAyLCB1bmxlc3MKKyMgKyAgIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSwgdmVyc2lvbiAzLCB1bmxlc3MKKyMgICAgIG90aGVyd2lzZSBpbmRp
Y2F0ZWQuICBTZWUgdGhlIENPUFlJTkcgZmlsZSBpbiB0aGUgc291cmNlCisjICAgICBkaXN0cmli
dXRpb24gZm9yIGRldGFpbHMuCisjICAKKyMgQEAgLTQ5LDcgKzQ5LDcgQEAKKyMgIAorIyAgICAg
Tm90aWNlIHRoYXQgdGhlIGFib3ZlIEJTRC1zdHlsZSBsaWNlbnNlIGFwcGxpZXMgdG8gdGhpcyBv
bmUgZmlsZQorIyAgICAgKHZhbGdyaW5kLmgpIG9ubHkuICBUaGUgZW50aXJlIHJlc3Qgb2YgVmFs
Z3JpbmQgaXMgbGljZW5zZWQgdW5kZXIKKyMgLSAgIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVy
YWwgUHVibGljIExpY2Vuc2UsIHZlcnNpb24gMi4gIFNlZSB0aGUKKyMgKyAgIHRoZSB0ZXJtcyBv
ZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UsIHZlcnNpb24gMy4gIFNlZSB0aGUKKyMg
ICAgIENPUFlJTkcgZmlsZSBpbiB0aGUgc291cmNlIGRpc3RyaWJ1dGlvbiBmb3IgZGV0YWlscy4K
KyMgIAorIyAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSAKKyMgCisjCisKK1NVTU1BUlkgPSAiVmFsZ3JpbmQgbWVtb3J5
IGRlYnVnZ2VyIGFuZCBpbnN0cnVtZW50YXRpb24gZnJhbWV3b3JrIgorSE9NRVBBR0UgPSAiaHR0
cDovL3ZhbGdyaW5kLm9yZy8iCitERVNDUklQVElPTiA9ICJWYWxncmluZCBpcyBhbiBpbnN0cnVt
ZW50YXRpb24gZnJhbWV3b3JrIGZvciBidWlsZGluZyBkeW5hbWljIGFuYWx5c2lzIHRvb2xzLiBU
aGVyZSBhcmUgVmFsZ3JpbmQgdG9vbHMgdGhhdCBjYW4gYXV0b21hdGljYWxseSBkZXRlY3QgbWFu
eSBtZW1vcnkgbWFuYWdlbWVudCBhbmQgdGhyZWFkaW5nIGJ1Z3MsIGFuZCBwcm9maWxlIHlvdXIg
cHJvZ3JhbXMgaW4gZGV0YWlsLiIKK0JVR1RSQUNLRVIgPSAiaHR0cDovL3ZhbGdyaW5kLm9yZy9z
dXBwb3J0L2J1Z19yZXBvcnRzLmh0bWwiCitMSUNFTlNFID0gIkdQTC0yLjAtb25seSAmIEdQTC0y
LjAtb3ItbGF0ZXIgJiBCU0QtMy1DbGF1c2UiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9D
T1BZSU5HO21kNT0xZWJiZDNlMzQyMzdhZjI2ZGE1ZGMwOGE0ZTQ0MDQ2NCBcCisgICAgICAgICAg
ICAgICAgICAgIGZpbGU6Ly9pbmNsdWRlL3B1Yl90b29sX2Jhc2ljcy5oO2JlZ2lubGluZT02O2Vu
ZGxpbmU9Mjk7bWQ1PTliYTQ0OWQxMjBmNjg0NWU2YTQzMjA3MzI3OGQ2ZTNhIFwKKyAgICAgICAg
ICAgICAgICAgICAgZmlsZTovL2luY2x1ZGUvdmFsZ3JpbmQuaDtiZWdpbmxpbmU9MTtlbmRsaW5l
PTU2O21kNT05OTM1NjNhYWExMjI1NThkZjljNWQ3NDNkZTA3NGQwNCBcCisgICAgICAgICAgICAg
ICAgICAgIGZpbGU6Ly9DT1BZSU5HLkRPQ1M7bWQ1PTI0ZWE0YzcwOTIyMzM4NDliNDM5NDY5OTMz
M2I1YzU2IFwKKyAgICAgICAgICAgICAgICAgICAgIgorCitTUkNfVVJJID0gImh0dHBzOi8vc291
cmNld2FyZS5vcmcvcHViL3ZhbGdyaW5kL3ZhbGdyaW5kLSR7UFZ9LnRhci5iejIgXAorICAgICAg
ICAgICBmaWxlOi8vZml4ZWQtcGVybC1wYXRoLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovL0Fk
ZGVkLXN1cHBvcnQtZm9yLVBQQy1pbnN0cnVjdGlvbnMtbWZhdGJ1LW1mYXRibC5wYXRjaCBcCisg
ICAgICAgICAgIGZpbGU6Ly91c2UtYXBwcm9wcmlhdGUtbWFyY2gtbWNwdS1tZnB1LWZvci1BUk0t
dGVzdC1hcHBzLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovL2F2b2lkLW5lb24tZm9yLXRhcmdl
dHMtd2hpY2gtZG9uLXQtc3VwcG9ydC1pdC5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAx
LWNvbmZpZ3VyZS1Ecm9wLXNldHRpbmctbWNwdS1jb3J0ZXgtYTgtb24tYXJtLnBhdGNoIFwKKyAg
ICAgICAgICAgZmlsZTovL3ZhbGdyaW5kLW1ha2UtbGQtWFhYLnNvLXN0cmxlbi1pbnRlcmNlcHQt
b3B0aW9uYWwucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwMS1tYWtlZmlsZXMtRHJvcC1z
ZXR0aW5nLW1jcHUtdG8tY29ydGV4LWE4LW9uLWFybS1hcmNoLnBhdGNoIFwKKyAgICAgICAgICAg
ZmlsZTovLzAwMDEtc2lncXVldWUtUmVuYW1lLV9zaWZpZWxkcy10by1fX3NpX2ZpZWxkcy1vbi1t
dXNsLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDMtY29ycmVjdC1pbmNsdWRlLWRpcmVj
dGl2ZS1wYXRoLWZvci1jb25maWcuaC5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLXZh
bGdyaW5kLWZpbHRlcl94bWxfZnJhbWVzLWRvLW5vdC1maWx0ZXItdXNyLnBhdGNoIFwKKyAgICAg
ICAgICAgZmlsZTovLzAwMDEtbWVtY2hlY2stdmd0ZXN0cy1yZW1vdmUtZnVsbHBhdGgtYWZ0ZXIt
ZmxhZ3MucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vczM5MHhfdmVjX29wX3QucGF0Y2ggXAor
ICAgICAgICAgICBmaWxlOi8vMDAwMS1ub25lLXRlc3RzLWZkbGVha19jbXNnLnN0ZGVyci5leHAt
YWRqdXN0LXRtcC1wYXRocy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLW1lbWNoZWNr
LXRlc3RzLUZpeC10aW1lcmZkLXN5c2NhbGwtdGVzdC5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6
Ly8wMDAxLWRvY3MtRGlzYWJsZS1tYW51YWwtdmFsaWRhdGlvbi5wYXRjaCBcCisgICAgICAgICAg
IGZpbGU6Ly8wMDAxLXRlc3RzLWFybS1Vc2UtTy1pbnN0ZWFkLW9mLU8wLnBhdGNoIFwKKyAgICAg
ICAgICAgIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhkNTRjNzE3MDI5MTA2ZjE2NDRhYWRhZjgw
MmFiOTY5MmU1M2Q5M2RkMDE1Y2JkMTllNzQxOTBlYmE2MTZiZDciCitVUFNUUkVBTV9DSEVDS19S
RUdFWCA9ICJ2YWxncmluZC0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKKworQ09NUEFUSUJM
RV9IT1NUID0gJyhpLjg2fHg4Nl82NHxhcm18YWFyY2g2NHxtaXBzfHBvd2VycGN8cG93ZXJwYzY0
fHJpc2N2NjQpLiotbGludXgnCisKKyMgdmFsZ3JpbmQgc3VwcG9ydHMgYXJtdjcgYW5kIGFib3Zl
CitDT01QQVRJQkxFX0hPU1Q6YXJtdjQgPSAnbnVsbCcKK0NPTVBBVElCTEVfSE9TVDphcm12NSA9
ICdudWxsJworQ09NUEFUSUJMRV9IT1NUOmFybXY2ID0gJ251bGwnCisKKyMgdmFsZ3JpbmQgZmFp
bHMgd2l0aCBwb3dlcnBjIHNvZnQtZmxvYXQKK0NPTVBBVElCTEVfSE9TVDpwb3dlcnBjID0gIiR7
QGJiLnV0aWxzLmNvbnRhaW5zKCdUQVJHRVRfRlBVJywgJ3NvZnQnLCAnbnVsbCcsICcuKi1saW51
eCcsIGQpfSIKKworIyBYMzIgaXNuJ3Qgc3VwcG9ydGVkIGJ5IHZhbGdyaW5kIGF0IHRoaXMgdGlt
ZQorQ09NUEFUSUJMRV9IT1NUOmxpbnV4LWdudXgzMiA9ICdudWxsJworQ09NUEFUSUJMRV9IT1NU
OmxpbnV4LW11c2x4MzIgPSAnbnVsbCcKKworIyBEaXNhYmxlIGZvciBzb21lIE1JUFMgdmFyaWFu
dHMKK0NPTVBBVElCTEVfSE9TVDptaXBzYXJjaHI2ID0gJ251bGwnCitDT01QQVRJQkxFX0hPU1Q6
bGludXgtZ251bjMyID0gJ251bGwnCisKKyMgRGlzYWJsZSBmb3IgcG93ZXJwYzY0IHdpdGggbXVz
bAorQ09NUEFUSUJMRV9IT1NUOmxpYmMtbXVzbDpwb3dlcnBjNjQgPSAnbnVsbCcKKworaW5oZXJp
dCBhdXRvdG9vbHMtYnJva2Vuc2VwIG11bHRpbGliX2hlYWRlcgorCitFWFRSQV9PRUNPTkYgPSAi
LS1lbmFibGUtdGxzIC0td2l0aG91dC1tcGljYyIKK0VYVFJBX09FQ09ORiArPSAiJHtAWyctLWVu
YWJsZS1vbmx5MzJiaXQnLCctLWVuYWJsZS1vbmx5NjRiaXQnXVtkLmdldFZhcignU0lURUlORk9f
QklUUycpICE9ICczMiddfSIKKworIyB2YWxncmluZCBjaGVja3MgaG9zdF9jcHUgImFybXY3Kiki
LCBzbyB3ZSBuZWVkIHRvIG92ZXItcmlkZSB0aGUgYXV0b3Rvb2xzLmJiY2xhc3MgZGVmYXVsdCAt
LWhvc3Qgb3B0aW9uCitFWFRSQV9PRUNPTkY6YXBwZW5kOmFybSA9ICIgLS1ob3N0PWFybXY3JHtI
T1NUX1ZFTkRPUn0tJHtIT1NUX09TfSIKKworRVhUUkFfT0VNQUtFID0gIi13IgorCitDQUNIRURf
Q09ORklHVVJFVkFSUyArPSAiYWNfY3ZfcGF0aF9QRVJMPScvdXNyL2Jpbi9lbnYgcGVybCciCisK
KyMgdmFsZ3JpbmQgbGlrZXMgdG8gY29udHJvbCBpdHMgb3duIG9wdGltaXNhdGlvbiBmbGFncy4g
SXQgZ2VuZXJhbGx5IGRlZmF1bHRzCisjIHRvIC1PMiBidXQgdXNlcyAtTzAgZm9yIHNvbWUgc3Bl
Y2lmaWMgdGVzdCBhcHBzIGV0Yy4gUGFzc2luZyBvdXIgb3duIGZsYWdzCisjICh2aWEgQ0ZMQUdT
KSBtZWFucyB3ZSBpbnRlcmZlcmUgd2l0aCB0aGF0LiBPbmx5IHBhc3MgREVCVUdfRkxBR1MgdG8g
aXQKKyMgd2hpY2ggZml4ZXMgYnVpbGQgcGF0aCBpc3N1ZSBpbiBEV0FSRi4KK1NFTEVDVEVEX09Q
VElNSVpBVElPTiA9ICIke0RFQlVHX0xFVkVMRkxBR30iCisKKyMgU3BsaXQgb3V0IHZhcmlvdXMg
aGVscGVyIHNjcmlwdHMgdG8gc2VwYXJhdGUgcGFja2FnZXMgdG8gYXZvaWQgdGhlCisjIG1haW4g
cGFja2FnZSBkZXBlbmRpbmcgb24gcGVybCBhbmQgcHl0aG9uLgorUEFDS0FHRVMgPSsgIiR7UE59
LWNhY2hlZ3JpbmQgJHtQTn0tbWFzc2lmICR7UE59LWNhbGxncmluZCIKKworRklMRVM6JHtQTn0t
Y2FjaGVncmluZCA9ICIke2JpbmRpcn0vY2dfKiIKK0ZJTEVTOiR7UE59LW1hc3NpZiA9ICIke2Jp
bmRpcn0vbXNfKiIKK0ZJTEVTOiR7UE59LWNhbGxncmluZCA9ICIke2JpbmRpcn0vY2FsbGdyaW5k
XyoiCisKK1JERVBFTkRTOiR7UE59LWNhY2hlZ3JpbmQgPSAiJHtQTn0gcHl0aG9uMy1jb3JlIgor
UkRFUEVORFM6JHtQTn0tbWFzc2lmID0gIiR7UE59IHBlcmwiCitSREVQRU5EUzoke1BOfS1jYWxs
Z3JpbmQgPSAiJHtQTn0gcGVybCIKKworZG9fY29uZmlndXJlOnByZXBlbmQgKCkgeworICAgIHJt
IC1yZiAke1N9L2NvbmZpZy5oCit9CisKK2RvX2luc3RhbGw6YXBwZW5kICgpIHsKKyAgICBpbnN0
YWxsIC1tIDY0NCAke0J9L2RlZmF1bHQuc3VwcCAke0R9LyR7bGliZXhlY2Rpcn0vdmFsZ3JpbmQv
CisgICAgb2VfbXVsdGlsaWJfaGVhZGVyIHZhbGdyaW5kL2NvbmZpZy5oCit9CisKK1ZBTEdSSU5E
QVJDSCA/PSAiJHtUQVJHRVRfQVJDSH0iCitWQUxHUklOREFSQ0g6YWFyY2g2NCA9ICJhcm02NCIK
K1ZBTEdSSU5EQVJDSDp4ODYtNjQgPSAiYW1kNjQiCitWQUxHUklOREFSQ0g6eDg2ID0gIng4NiIK
K1ZBTEdSSU5EQVJDSDptaXBzID0gIm1pcHMzMiIKK1ZBTEdSSU5EQVJDSDptaXBzZWwgPSAibWlw
czMyIgorVkFMR1JJTkRBUkNIOm1pcHM2NGVsID0gIm1pcHM2NCIKK1ZBTEdSSU5EQVJDSDpwb3dl
cnBjID0gInBwYyIKK1ZBTEdSSU5EQVJDSDpwb3dlcnBjNjQgPSAicHBjNjQiCitWQUxHUklOREFS
Q0g6cG93ZXJwYzY0bGUgPSAicHBjNjRsZSIKKworSU5ISUJJVF9QQUNLQUdFX1NUUklQX0ZJTEVT
ID0gIiR7UEtHRH0ke2xpYmV4ZWNkaXJ9L3ZhbGdyaW5kL3ZncHJlbG9hZF9tZW1jaGVjay0ke1ZB
TEdSSU5EQVJDSH0tbGludXguc28iCisKKyMgdmFsZ3JpbmQgbmVlZHMgZGVidWcgaW5mb3JtYXRp
b24gZm9yIGxkLnNvIGF0IHJ1bnRpbWUgaW4gb3JkZXIgdG8KKyMgcmVkaXJlY3QgZnVuY3Rpb25z
IGxpa2Ugc3RybGVuLgorUlJFQ09NTUVORFM6JHtQTn0gKz0gIiR7VENMSUJDfS1kYmciCisKKyMg
VmFsZ3JpbmQgbmVlZHMgaW50cmluc2ljcyB3aGljaCBhcmUgbm90IHByb3ZpZGVkIGJ5IGNsYW5n
CisjIG1fc2lnbmFscy5jOjIyMTM6NzogZXJyb3I6IF9fYnVpbHRpbl9sb25nam1wIGlzIG5vdCBz
dXBwb3J0ZWQgZm9yIHRoZSBjdXJyZW50IHRhcmdldAorIyAyMjEzIHwgICAgICAgVkdfTUlOSU1B
TF9MT05HSk1QKHRzdC0+c2NoZWRfam1wYnVmKTsKKyMgICAgICB8ICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KKyMKKyMgSXQgbmVlZHMgc29tZXRoaW5nIGxpa2Ug
LSBodHRwczovL2J1Z3Mua2RlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MzY5NzIzCitUT09MQ0hBSU46
cmlzY3Y2NCA9ICJnY2MiCi0tIAoyLjQ3LjEKCg==

--===============0179690318880044557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/valgrind: SRC_URI changed from "https://sourceware.org/pub/valgrind/valgrind-3.25.1.tar.bz2 file://fixed-perl-path.patch file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch file://avoid-neon-for-targets-which-don-t-support-it.patch file://0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch file://0003-correct-include-directive-path-for-config.h.patch file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch file://s390x_vec_op_t.patch file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch file://0001-docs-Disable-manual-validation.patch file://
 0001-tests-arm-Use-O-instead-of-O0.patch file://0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch" to "https://sourceware.org/pub/valgrind/valgrind-3.26.0.tar.bz2 file://fixed-perl-path.patch file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch file://avoid-neon-for-targets-which-don-t-support-it.patch file://0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch file://0003-correct-include-directive-path-for-config.h.patch file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch file://s390x_vec_op_t.patch file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch 
 file://0001-docs-Disable-manual-validation.patch file://0001-tests-arm-Use-O-instead-of-O0.patch"
packages/x86-64-v3-poky-linux/valgrind: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-cachegrind: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-cachegrind: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-callgrind: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-callgrind: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-dbg: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-dbg: PKGSIZE changed from 100832192 to 101815544 (+1%)
packages/x86-64-v3-poky-linux/valgrind/valgrind-dbg: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-dev: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-dev: PKGSIZE changed from 2356524 to 2364128 (+0%)
packages/x86-64-v3-poky-linux/valgrind/valgrind-dev: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-doc: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-doc: PKGSIZE changed from 18251013 to 18621015 (+2%)
packages/x86-64-v3-poky-linux/valgrind/valgrind-doc: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-locale: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-locale: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-massif: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-massif: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-src: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-src: PKGSIZE changed from 23687136 to 23766922 (+0%)
packages/x86-64-v3-poky-linux/valgrind/valgrind-src: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-staticdev: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-staticdev: PKGSIZE changed from 46792860 to 46995846 (+0%)
packages/x86-64-v3-poky-linux/valgrind/valgrind-staticdev: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind: FILELIST: added "/usr/bin/vgstack"
packages/x86-64-v3-poky-linux/valgrind/valgrind: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind: PKGSIZE changed from 27165250 to 27537312 (+1%)
packages/x86-64-v3-poky-linux/valgrind/valgrind: PV changed from "3.25.1" to "3.26.0"

--===============0179690318880044557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/valgrind/valgrind: FILELIST: added "/usr/bin/vgstack"

--===============0179690318880044557==--

