Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261AECD37B4
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:37 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2352.1762384576133441754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=s7RDlwok;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=baSBZ2ko;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019a564ec66a-6e8ca640-e5b9-4051-b703-8d4bf8fa1ba7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384594;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZDKyd26mOO9FRUMSTAsJPkBAMyF3h2VpJEXo5AlAT4g=;
	b=s7RDlwokWgF3Mv1FStzKo8IDVgHLX7qEy/Ab29jFwvjESfJWVoe/K4Mwe/1HkmlZ
	mA/bH7eKHZ26jSYPZTE8v7mrLqa3QocyA6d8CbtywiZd6UYOIMgRT+oWiOHhli+xWMq
	zChhN1pSQx8g2wszjCP7gfN+k0gyEpO4wStE7LYk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384594;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZDKyd26mOO9FRUMSTAsJPkBAMyF3h2VpJEXo5AlAT4g=;
	b=baSBZ2koToGyfvgK+d0zu0vKwVsjaRUxXPytjKwRuHKHfuisvNbetpVVMfrOjCgx
	D1PE0oA2wWfkonpO/4st1/CIllayTE+6ZbdpFyc6P1J6QjU8sF9trYQepIGL7FKnQHi
	6WipMCxe15jJFdRGTgr+igrHAxaMxkJxroQdwoww=
Content-Type: multipart/mixed; boundary="===============7336379575657891172=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] valgrind: upgrading to 3.26.0 SUCCEEDED
Message-ID: <0101019a564ec66a-6e8ca640-e5b9-4051-b703-8d4bf8fa1ba7-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225866

--===============7336379575657891172==
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
From c895b188bb5747cf9d0d40d502f9f0d306e7d2a7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 18:41:35 +0000
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
index 3c8bec82b3..2093707ff0 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
@@ -1,4 +1,4 @@
-From 5a776e61af5ab7f0cfd10cde55c796189686916f Mon Sep 17 00:00:00 2001
+From bd65a36254ee2c513385e3ee18922e6db165fc68 Mon Sep 17 00:00:00 2001
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
index fbd799eeea..ad473ac9e8 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
@@ -1,4 +1,4 @@
-From 4f674f458b1f0675abdc0ced01239e99bfa40de8 Mon Sep 17 00:00:00 2001
+From 322077d5ba4b8fcf9ddc06ae11fce7fde219da0a Mon Sep 17 00:00:00 2001
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
index f8d1e87ba9..cd55d4e032 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
@@ -1,4 +1,4 @@
-From c878aaacadf8ec723be882f9335cb33240df13d6 Mon Sep 17 00:00:00 2001
+From fa546b57e7cd21d42dacacd7503689a68cf5dfec Mon Sep 17 00:00:00 2001
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
index 200b2602cb..21db164d53 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
@@ -1,4 +1,4 @@
-From 3a51ed107f67732910dec12279a9279e158afbe7 Mon Sep 17 00:00:00 2001
+From 72e13528ec922a73b222c9cac21e667743ebebbf Mon Sep 17 00:00:00 2001
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
index 9a3596cac1..71d0e4811e 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
@@ -1,4 +1,4 @@
-From b703b0d11adc9147a7d97817bd771ac40b8c4d39 Mon Sep 17 00:00:00 2001
+From 8b476ef9cbc87950ab33645f2312f9d920b259fa Mon Sep 17 00:00:00 2001
 From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
 Date: Wed, 16 Sep 2020 13:45:07 -0400
 Subject: [PATCH] memcheck vgtests remove fullpath-after flags
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
index 7deca99202..51f91998fd 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
@@ -1,4 +1,4 @@
-From bbb5e8a6fc5eec178f8077ab006ab42c009528d4 Mon Sep 17 00:00:00 2001
+From caee0a73d3f3b264713cd74a1aca4244d23d5407 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 24 Jan 2020 17:55:39 +0100
 Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
index efa6c2c895..7dfb876df5 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
@@ -1,4 +1,4 @@
-From c287382a1f3dd9f2db3df54dde54b4b266791bb9 Mon Sep 17 00:00:00 2001
+From be299212b2131682d8fe8ad393ecd86a70b097e2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 00:46:39 -0700
 Subject: [PATCH] sigqueue: Rename _sifields to __si_fields on musl
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
index 3eea195579..2e484dc1b6 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
@@ -1,4 +1,4 @@
-From 8087ae8dcc46f3f81af58ed9b7176761b988ee61 Mon Sep 17 00:00:00 2001
+From 3eb1b7354d149c5519471e8b796a5e0c0f874bc9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 10 May 2024 17:44:47 -0700
 Subject: [PATCH] tests/arm: Use -O instead of -O0
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
index c64c2afd3f..02e65dbc92 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
@@ -1,4 +1,4 @@
-From f8fbebcf69e4a8bf2122b7c55f2ce372377af1bc Mon Sep 17 00:00:00 2001
+From 6856b9f402850bcccb2acb33a44505850fcaab08 Mon Sep 17 00:00:00 2001
 From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Mon, 13 May 2019 17:12:21 -0400
 Subject: [PATCH] valgrind: filter_xml_frames: do not filter /usr
diff --git a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
index 3acb5a28f4..02a3b897d0 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
@@ -1,4 +1,4 @@
-From de4d7e478515b63f049b211266d9b946c15cc0b9 Mon Sep 17 00:00:00 2001
+From d9d4530f8aa4d7bb6d258c4d2c78909941e25856 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 01:03:17 -0700
 Subject: [PATCH] correct include directive path for config.h
diff --git a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
index 109caf76ab..686a0abb2f 100644
--- a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
@@ -1,4 +1,4 @@
-From 85bff993087cd7367ffc35de525c2bf6162398d2 Mon Sep 17 00:00:00 2001
+From d5ab43be3946298f4a3a17a52fbf00fe7af7c067 Mon Sep 17 00:00:00 2001
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
index 1597b3a021..ddb61b17fb 100644
--- a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
@@ -1,4 +1,4 @@
-From 596372bc9b4d31bc9811881cfa747d99a8c25141 Mon Sep 17 00:00:00 2001
+From 02d54537392735ac36b1b6e03737f8a238c11735 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 19 Jan 2016 16:42:36 -0800
 Subject: [PATCH] avoid neon for targets which don't support it
diff --git a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
index 6bfc6035ed..61f2ed44e1 100644
--- a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
@@ -1,4 +1,4 @@
-From 408f9b39ca4f5709b668f13829a94c4cae855006 Mon Sep 17 00:00:00 2001
+From d8b0e15f5c26ffa5dcfdd90a28ef338df9939a5f Mon Sep 17 00:00:00 2001
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
index 19690e5ebb..48bbeab992 100644
--- a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
@@ -1,4 +1,4 @@
-From 8c92089741d809cfd18354f1b4df18cd28398a20 Mon Sep 17 00:00:00 2001
+From de8984c1ff3ae148564be9ac62eb235feeb1a977 Mon Sep 17 00:00:00 2001
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
index 0c18a63c2b..554441c08d 100644
--- a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
@@ -1,4 +1,4 @@
-From a5cd00f1c2d78e2a15f4a0c595f5ac10ca4c3290 Mon Sep 17 00:00:00 2001
+From c1d239ec88224940cdd0e42c81034405501c2b47 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 19 Jan 2016 16:00:00 -0800
 Subject: [PATCH] use appropriate -march/-mcpu/-mfpu for ARM test apps
diff --git a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
index ca7f721d9c..c5778f98ce 100644
--- a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
@@ -1,4 +1,4 @@
-From b407514aa1a4fd3667b30527260e271da34ce4a7 Mon Sep 17 00:00:00 2001
+From 49e276593f6f620468eac32c7179c3d57637964d Mon Sep 17 00:00:00 2001
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


--===============7336379575657891172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/valgrind/valgrind: FILELIST: added "/usr/bin/vgstack"

--===============7336379575657891172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/valgrind: SRC_URI changed from "https://sourceware.org/pub/valgrind/valgrind-3.25.1.tar.bz2 file://fixed-perl-path.patch file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch file://avoid-neon-for-targets-which-don-t-support-it.patch file://0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch file://0003-correct-include-directive-path-for-config.h.patch file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch file://s390x_vec_op_t.patch file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch file://0001-docs-Disable-manual-validation.patch file://
 0001-tests-arm-Use-O-instead-of-O0.patch file://0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch" to "https://sourceware.org/pub/valgrind/valgrind-3.26.0.tar.bz2 file://fixed-perl-path.patch file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch file://avoid-neon-for-targets-which-don-t-support-it.patch file://0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch file://0003-correct-include-directive-path-for-config.h.patch file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch file://s390x_vec_op_t.patch file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch 
 file://0001-docs-Disable-manual-validation.patch file://0001-tests-arm-Use-O-instead-of-O0.patch"
packages/x86-64-v3-poky-linux/valgrind: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-cachegrind: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-cachegrind: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-callgrind: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-callgrind: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-dbg: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-dbg: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-dbg: PKGSIZE changed from 100832192 to 101815544 (+1%)
packages/x86-64-v3-poky-linux/valgrind/valgrind-dev: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-dev: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-dev: PKGSIZE changed from 2356524 to 2364128 (+0%)
packages/x86-64-v3-poky-linux/valgrind/valgrind-doc: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-doc: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-doc: PKGSIZE changed from 18251013 to 18621015 (+2%)
packages/x86-64-v3-poky-linux/valgrind/valgrind-locale: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-locale: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-massif: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-massif: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-src: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-src: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-src: PKGSIZE changed from 23687136 to 23766922 (+0%)
packages/x86-64-v3-poky-linux/valgrind/valgrind-staticdev: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind-staticdev: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-staticdev: PKGSIZE changed from 46792860 to 46995846 (+0%)
packages/x86-64-v3-poky-linux/valgrind/valgrind: PV changed from "3.25.1" to "3.26.0"
packages/x86-64-v3-poky-linux/valgrind/valgrind: PKGV changed from 3.25.1 [default] to 3.26.0 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind: FILELIST: added "/usr/bin/vgstack"
packages/x86-64-v3-poky-linux/valgrind/valgrind: PKGSIZE changed from 27165250 to 27537312 (+1%)

--===============7336379575657891172==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-valgrind-upgrade-3.25.1-3.26.0.patch"

RnJvbSBjODk1YjE4OGJiNTc0N2NmOWQwZDQwZDUwMmY5ZjBkMzA2ZTdkMmE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxODo0MTozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZh
bGdyaW5kOiB1cGdyYWRlIDMuMjUuMSAtPiAzLjI2LjAKCi0tLQogLi4udGF4LWZvci1wdXNoc2Vj
dGlvbi1kaXJlY3RpdmUtaW4taW5sLnBhdGNoIHwgICAzMSAtCiAuLi5lLURyb3Atc2V0dGluZy1t
Y3B1LWNvcnRleC1hOC1vbi1hcm0ucGF0Y2ggfCAgICA0ICstCiAuLi4vMDAwMS1kb2NzLURpc2Fi
bGUtbWFudWFsLXZhbGlkYXRpb24ucGF0Y2ggfCAgICA2ICstCiAuLi5ldHRpbmctbWNwdS10by1j
b3J0ZXgtYTgtb24tYXJtLWFyY2gucGF0Y2ggfCAgICA2ICstCiAuLi5jaGVjay10ZXN0cy1GaXgt
dGltZXJmZC1zeXNjYWxsLXRlc3QucGF0Y2ggfCAgIDEwICstCiAuLi4tdmd0ZXN0cy1yZW1vdmUt
ZnVsbHBhdGgtYWZ0ZXItZmxhZ3MucGF0Y2ggfCAgICAyICstCiAuLi5lYWtfY21zZy5zdGRlcnIu
ZXhwLWFkanVzdC10bXAtcGF0aHMucGF0Y2ggfCAgICAyICstCiAuLi5hbWUtX3NpZmllbGRzLXRv
LV9fc2lfZmllbGRzLW9uLW11c2wucGF0Y2ggfCAgICAyICstCiAuLi4vMDAwMS10ZXN0cy1hcm0t
VXNlLU8taW5zdGVhZC1vZi1PMC5wYXRjaCAgfCAgICAyICstCiAuLi4tZmlsdGVyX3htbF9mcmFt
ZXMtZG8tbm90LWZpbHRlci11c3IucGF0Y2ggfCAgICAyICstCiAuLi4taW5jbHVkZS1kaXJlY3Rp
dmUtcGF0aC1mb3ItY29uZmlnLmgucGF0Y2ggfCAgICAyICstCiAuLi50LWZvci1QUEMtaW5zdHJ1
Y3Rpb25zLW1mYXRidS1tZmF0YmwucGF0Y2ggfCAgICA4ICstCiAuLi5uLWZvci10YXJnZXRzLXdo
aWNoLWRvbi10LXN1cHBvcnQtaXQucGF0Y2ggfCAgICAyICstCiAuLi4vdmFsZ3JpbmQvdmFsZ3Jp
bmQvZml4ZWQtcGVybC1wYXRoLnBhdGNoICAgfCAgICA4ICstCiAuLi4vdmFsZ3JpbmQvdmFsZ3Jp
bmQvczM5MHhfdmVjX29wX3QucGF0Y2ggICAgfCAgICA0ICstCiAuLi50ZS1tYXJjaC1tY3B1LW1m
cHUtZm9yLUFSTS10ZXN0LWFwcHMucGF0Y2ggfCAgICAyICstCiAuLi4tbGQtWFhYLnNvLXN0cmxl
bi1pbnRlcmNlcHQtb3B0aW9uYWwucGF0Y2ggfCAgICA0ICstCiAuLi4vdmFsZ3JpbmQvdmFsZ3Jp
bmRfMy4yNS4xLmJiICAgICAgICAgICAgICAgfCAgMTE2IC0tCiAuLi4vdmFsZ3JpbmQvdmFsZ3Jp
bmRfMy4yNi4wLmJiICAgICAgICAgICAgICAgfCAxMTE2ICsrKysrKysrKysrKysrKysrCiAxOSBm
aWxlcyBjaGFuZ2VkLCAxMTQ5IGluc2VydGlvbnMoKyksIDE4MCBkZWxldGlvbnMoLSkKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAw
MS1Vc2UtcG9ydGFibGUtc3ludGF4LWZvci1wdXNoc2VjdGlvbi1kaXJlY3RpdmUtaW4taW5sLnBh
dGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3Zh
bGdyaW5kXzMuMjUuMS5iYgogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxncmluZC92YWxncmluZF8zLjI2LjAuYmIKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1Vc2UtcG9ydGFibGUtc3ludGF4LWZvci1w
dXNoc2VjdGlvbi1kaXJlY3RpdmUtaW4taW5sLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtVXNlLXBvcnRhYmxlLXN5bnRheC1mb3ItcHVzaHNlY3Rp
b24tZGlyZWN0aXZlLWluLWlubC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
YjU5YzU0NDIyMy4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3Jp
bmQvdmFsZ3JpbmQvMDAwMS1Vc2UtcG9ydGFibGUtc3ludGF4LWZvci1wdXNoc2VjdGlvbi1kaXJl
Y3RpdmUtaW4taW5sLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzEgKzAsMCBAQAotRnJvbSAy
MDg5MzgzYTBlM2E1MGY1MjczMzdlYTA1MTg4YjNlMzAyMDY5ODg4IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQotRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLURhdGU6IFdlZCwg
MTQgTWF5IDIwMjUgMDk6Mjk6MzMgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSF0gVXNlIHBvcnRhYmxl
IHN5bnRheCBmb3IgcHVzaHNlY3Rpb24gZGlyZWN0aXZlIGluIGlubGluZQotIGFzc2VtYmx5Ci0K
LSdAJyBkb2VzIG5vdCB3b3JrIHdpdGggY2xhbmcgaW5saW5lIGFzc2VtYmxlciwgYnV0ICclJyB3
b3JrcyB3aXRoIGJvdGgKLWdjYyBhbmQgY2xhbmcuIFRoZXJlZm9yZSB1c2UgJyUnIHRvIG1ha2Ug
aXQgbW9yZSBwb3J0YWJsZQotCi1GaXhlcwotPGlubGluZSBhc20+OjE6NDE6IGVycm9yOiBleHBl
Y3RlZCAnJTx0eXBlPicgb3IgIjx0eXBlPiIKLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQg
W2h0dHBzOi8vYnVncy5rZGUub3JnL3Nob3dfYnVnLmNnaT9pZD01MDQyMjJdCi1TaWduZWQtb2Zm
LWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gY29yZWdyaW5kL3ZnX3By
ZWxvYWRlZC5jIHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvY29yZWdyaW5kL3ZnX3ByZWxvYWRlZC5jIGIvY29yZWdy
aW5kL3ZnX3ByZWxvYWRlZC5jCi1pbmRleCA1YmVjNTFkLi5lNGMyZGJjIDEwMDY0NAotLS0tIGEv
Y29yZWdyaW5kL3ZnX3ByZWxvYWRlZC5jCi0rKysgYi9jb3JlZ3JpbmQvdmdfcHJlbG9hZGVkLmMK
LUBAIC01NSw3ICs1NSw3IEBACi0gLyogTm90ZTogVGhlICJNUyIgc2VjdGlvbiBmbGFncyBhcmUg
dG8gcmVtb3ZlIGR1cGxpY2F0ZXMuICAqLwotICNkZWZpbmUgREVGSU5FX0dEQl9QWV9TQ1JJUFQo
c2NyaXB0X25hbWUpIFwKLSAgIGFzbSgiXAotLS5wdXNoc2VjdGlvbiBcIi5kZWJ1Z19nZGJfc2Ny
aXB0c1wiLCBcIk1TXCIsQHByb2diaXRzLDFcblwKLSsucHVzaHNlY3Rpb24gXCIuZGVidWdfZ2Ri
X3NjcmlwdHNcIiwgXCJNU1wiLCVwcm9nYml0cywxXG5cCi0gLmJ5dGUgMSAvKiBQeXRob24gKi9c
blwKLSAuYXNjaXogXCIiIHNjcmlwdF9uYW1lICJcIlxuXAotIC5wb3BzZWN0aW9uIFxuXApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtY29u
ZmlndXJlLURyb3Atc2V0dGluZy1tY3B1LWNvcnRleC1hOC1vbi1hcm0ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1jb25maWd1cmUtRHJvcC1zZXR0
aW5nLW1jcHUtY29ydGV4LWE4LW9uLWFybS5wYXRjaAppbmRleCAzYzhiZWM4MmIzLi4yMDkzNzA3
ZmYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQv
MDAwMS1jb25maWd1cmUtRHJvcC1zZXR0aW5nLW1jcHUtY29ydGV4LWE4LW9uLWFybS5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1jb25maWd1
cmUtRHJvcC1zZXR0aW5nLW1jcHUtY29ydGV4LWE4LW9uLWFybS5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gNWE3NzZlNjFhZjVhYjdmMGNmZDEwY2RlNTVjNzk2MTg5Njg2OTE2ZiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYmQ2NWEzNjI1NGVlMmM1MTMzODVlM2VlMTg5MjJlNmRi
MTY1ZmM2OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDEwIE1heSAyMDI0IDE2OjI3OjM0IC0wNzAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZTogRHJvcCBzZXR0aW5nIG1jcHU9Y29ydGV4LWE4IG9uIGFy
bQpAQCAtMTYsNyArMTYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDJkZmJk
MWMuLmI0MmZkZDQgMTAwNzU1CitpbmRleCBlMzBlNGMxLi5hMjUwNjgwIDEwMDY0NAogLS0tIGEv
Y29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKIEBAIC0yNTEsMTMgKzI1MSwxMyBAQCBj
YXNlICIke2hvc3RfY3B1fSIgaW4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92
YWxncmluZC92YWxncmluZC8wMDAxLWRvY3MtRGlzYWJsZS1tYW51YWwtdmFsaWRhdGlvbi5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLWRvY3MtRGlz
YWJsZS1tYW51YWwtdmFsaWRhdGlvbi5wYXRjaAppbmRleCBmYmQ3OTllZWVhLi5hZDQ3M2FjOWU4
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAw
MS1kb2NzLURpc2FibGUtbWFudWFsLXZhbGlkYXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtZG9jcy1EaXNhYmxlLW1hbnVhbC12YWxp
ZGF0aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0ZjY3NGY0NThiMWYwNjc1YWJkYzBj
ZWQwMTIzOWU5OWJmYTQwZGU4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzMjIwNzdk
NWJhNGI4ZmNmOWRkYzA2YWUxMWZjZTdmZGUyMTlkYTBhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMTMgSmFu
IDIwMjIgMTg6MjY6MDIgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZG9jczogRGlzYWJsZSBtYW51
YWwgdmFsaWRhdGlvbgpAQCAtMTksMTAgKzE5LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9kb2NzL01ha2VmaWxlLmFtIGIvZG9jcy9NYWtl
ZmlsZS5hbQotaW5kZXggNjhhM2RhNS4uOTgzM2Q1YyAxMDA2NDQKK2luZGV4IDdlNWVkMzguLjYz
YTFhYTcgMTAwNjQ0CiAtLS0gYS9kb2NzL01ha2VmaWxlLmFtCiArKysgYi9kb2NzL01ha2VmaWxl
LmFtCi1AQCAtMjAyLDcgKzIwMiw3IEBAIHZhbGlkLW1hbnBhZ2VzOiAkKE1BTlBBR0VTX1hNTF9G
SUxFUykKK0BAIC0yMjMsNyArMjIzLDcgQEAgdmFsaWQtbWFucGFnZXM6ICQoTUFOUEFHRVNfWE1M
X0ZJTEVTKQogIAkgIGZpIFwKICAJZmkKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW1ha2VmaWxlcy1Ecm9wLXNldHRpbmctbWNwdS10
by1jb3J0ZXgtYTgtb24tYXJtLWFyY2gucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFs
Z3JpbmQvdmFsZ3JpbmQvMDAwMS1tYWtlZmlsZXMtRHJvcC1zZXR0aW5nLW1jcHUtdG8tY29ydGV4
LWE4LW9uLWFybS1hcmNoLnBhdGNoCmluZGV4IGY4ZDFlODdiYTkuLmNkNTVkNGUwMzIgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW1ha2Vm
aWxlcy1Ecm9wLXNldHRpbmctbWNwdS10by1jb3J0ZXgtYTgtb24tYXJtLWFyY2gucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWFrZWZpbGVz
LURyb3Atc2V0dGluZy1tY3B1LXRvLWNvcnRleC1hOC1vbi1hcm0tYXJjaC5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gYzg3OGFhYWNhZGY4ZWM3MjNiZTg4MmY5MzM1Y2IzMzI0MGRmMTNkNiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmE1NDZiNTdlN2NkMjFkNDJkYWNhY2Q3NTAz
Njg5YTY4Y2Y1ZGZlYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDIwIEFwciAyMDE3IDEwOjExOjE2IC0wNzAw
CiBTdWJqZWN0OiBbUEFUQ0hdIG1ha2VmaWxlczogRHJvcCBzZXR0aW5nIC1tY3B1IHRvIGNvcnRl
eC1hOCBvbiBhcm0KQEAgLTE5LDEwICsxOSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgogIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9oZWxncmluZC90ZXN0cy9NYWtlZmlsZS5h
bSBiL2hlbGdyaW5kL3Rlc3RzL01ha2VmaWxlLmFtCi1pbmRleCA3YWRjNWM2Li5jYWMyM2M5IDEw
MDc1NQoraW5kZXggYjhjNWZkMC4uYzU1Nzc1YSAxMDA2NDQKIC0tLSBhL2hlbGdyaW5kL3Rlc3Rz
L01ha2VmaWxlLmFtCiArKysgYi9oZWxncmluZC90ZXN0cy9NYWtlZmlsZS5hbQotQEAgLTIyNiw5
ICsyMjYsOSBAQCBpZiAhIFZHQ09ORl9QTEFURk9STVNfSU5DTFVERV9YODZfREFSV0lOCitAQCAt
MjI3LDkgKzIyNyw5IEBAIGlmICEgVkdDT05GX1BMQVRGT1JNU19JTkNMVURFX1g4Nl9EQVJXSU4K
ICBlbmRpZgogIAogIGlmIFZHQ09ORl9QTEFURk9STVNfSU5DTFVERV9BUk1fTElOVVgKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW1lbWNo
ZWNrLXRlc3RzLUZpeC10aW1lcmZkLXN5c2NhbGwtdGVzdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW1lbWNoZWNrLXRlc3RzLUZpeC10aW1lcmZk
LXN5c2NhbGwtdGVzdC5wYXRjaAppbmRleCAyMDBiMjYwMmNiLi4yMWRiMTY0ZDUzIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1tZW1jaGVj
ay10ZXN0cy1GaXgtdGltZXJmZC1zeXNjYWxsLXRlc3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWVtY2hlY2stdGVzdHMtRml4LXRpbWVy
ZmQtc3lzY2FsbC10ZXN0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzYTUxZWQxMDdmNjc3
MzI5MTBkZWMxMjI3OWE5Mjc5ZTE1OGFmYmU3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA3MmUxMzUyOGVjOTIyYTczYjIyMmM5Y2FjMjFlNjY3NzQzZWJlYmJmIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IE1v
biwgOSBNYXIgMjAyMCAxNjozMDoxOSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBtZW1jaGVjay90
ZXN0czogRml4IHRpbWVyZmQgc3lzY2FsbCB0ZXN0CkBAIC0xNiwxMCArMTYsMTAgQEAgU2lnbmVk
LW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAzIGZpbGVzIGNoYW5nZWQs
IDE1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWcu
aC5pbiBiL2NvbmZpZy5oLmluCi1pbmRleCAwMGRiMWE2Li4yM2ZkNzdhIDEwMDY0NAoraW5kZXgg
MGQ0ZDE3MC4uZjAyYjA1YSAxMDA2NDQKIC0tLSBhL2NvbmZpZy5oLmluCiArKysgYi9jb25maWcu
aC5pbgotQEAgLTQwOSw2ICs0MDksOSBAQAorQEAgLTQyMSw2ICs0MjEsOSBAQAogIC8qIERlZmlu
ZSB0byAxIGlmIHlvdSBoYXZlIHRoZSA8c3lzL3N5c252bC5oPiBoZWFkZXIgZmlsZS4gKi8KICAj
dW5kZWYgSEFWRV9TWVNfU1lTTlZMX0gKICAKQEAgLTMwLDEwICszMCwxMCBAQCBpbmRleCAwMGRi
MWE2Li4yM2ZkNzdhIDEwMDY0NAogICN1bmRlZiBIQVZFX1NZU19USU1FX0gKICAKIGRpZmYgLS1n
aXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGI0MmZkZDQuLmVjOTUxNDYg
MTAwNzU1CitpbmRleCBhMjUwNjgwLi44NzBmNDRkIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFj
CiArKysgYi9jb25maWd1cmUuYWMKLUBAIC00ODkyLDYgKzQ4OTIsNyBAQCBBQ19DSEVDS19IRUFE
RVJTKFsgICAgICAgXAorQEAgLTQ5MjYsNiArNDkyNiw3IEBAIEFDX0NIRUNLX0hFQURFUlMoWyAg
ICAgICBcCiAgICAgICAgICBzeXMvc3lzY2FsbC5oICAgIFwKICAgICAgICAgIHN5cy9zeXNudmwu
aCAgICAgXAogICAgICAgICAgc3lzL3RpbWUuaCAgICAgICBcCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1tZW1jaGVjay12Z3Rlc3RzLXJl
bW92ZS1mdWxscGF0aC1hZnRlci1mbGFncy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92
YWxncmluZC92YWxncmluZC8wMDAxLW1lbWNoZWNrLXZndGVzdHMtcmVtb3ZlLWZ1bGxwYXRoLWFm
dGVyLWZsYWdzLnBhdGNoCmluZGV4IDlhMzU5NmNhYzEuLjcxZDBlNDgxMWUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW1lbWNoZWNrLXZn
dGVzdHMtcmVtb3ZlLWZ1bGxwYXRoLWFmdGVyLWZsYWdzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW1lbWNoZWNrLXZndGVzdHMtcmVtb3Zl
LWZ1bGxwYXRoLWFmdGVyLWZsYWdzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiNzAzYjBk
MTFhZGM5MTQ3YTdkOTc4MTdiZDc3MWFjNDBiOGM0ZDM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA4YjQ3NmVmOWNiYzg3OTUwYWIzMzY0NWYyMzEyZjlkOTIwYjI1OWZhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogU3RhY3kgR2Fpa292YWlhIDxTdGFjeS5HYWlrb3ZhaWFA
d2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMTYgU2VwIDIwMjAgMTM6NDU6MDcgLTA0MDAKIFN1
YmplY3Q6IFtQQVRDSF0gbWVtY2hlY2sgdmd0ZXN0cyByZW1vdmUgZnVsbHBhdGgtYWZ0ZXIgZmxh
Z3MKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8w
MDAxLW5vbmUtdGVzdHMtZmRsZWFrX2Ntc2cuc3RkZXJyLmV4cC1hZGp1c3QtdG1wLXBhdGhzLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbm9uZS10
ZXN0cy1mZGxlYWtfY21zZy5zdGRlcnIuZXhwLWFkanVzdC10bXAtcGF0aHMucGF0Y2gKaW5kZXgg
N2RlY2E5OTIwMi4uNTFmOTE5OThmZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbm9uZS10ZXN0cy1mZGxlYWtfY21zZy5zdGRlcnIuZXhw
LWFkanVzdC10bXAtcGF0aHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdy
aW5kL3ZhbGdyaW5kLzAwMDEtbm9uZS10ZXN0cy1mZGxlYWtfY21zZy5zdGRlcnIuZXhwLWFkanVz
dC10bXAtcGF0aHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJiYjVlOGE2ZmM1ZWVjMTc4
ZjgwNzdhYjAwNmFiNDJjMDA5NTI4ZDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGNh
ZWUwYTczZDNmM2IyNjQ3MTNjZDc0YTFhY2E0MjQ0ZDIzZDU0MDcgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4K
IERhdGU6IEZyaSwgMjQgSmFuIDIwMjAgMTc6NTU6MzkgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0g
bm9uZS90ZXN0cy9mZGxlYWtfY21zZy5zdGRlcnIuZXhwOiBhZGp1c3QgL3RtcCBwYXRocwpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtc2ln
cXVldWUtUmVuYW1lLV9zaWZpZWxkcy10by1fX3NpX2ZpZWxkcy1vbi1tdXNsLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtc2lncXVldWUtUmVuYW1l
LV9zaWZpZWxkcy10by1fX3NpX2ZpZWxkcy1vbi1tdXNsLnBhdGNoCmluZGV4IGVmYTZjMmM4OTUu
LjdkZmI4NzZkZjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92
YWxncmluZC8wMDAxLXNpZ3F1ZXVlLVJlbmFtZS1fc2lmaWVsZHMtdG8tX19zaV9maWVsZHMtb24t
bXVzbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQv
MDAwMS1zaWdxdWV1ZS1SZW5hbWUtX3NpZmllbGRzLXRvLV9fc2lfZmllbGRzLW9uLW11c2wucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGMyODczODJhMWYzZGQ5ZjJkYjNkZjU0ZGRlNTRiNGIy
NjY3OTFiYjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGJlMjk5MjEyYjIxMzE2ODJk
OGZlOGFkMzkzZWNkODZhNzBiMDk3ZTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogU2F0LCAxMCBKdW4gMjAxNyAwMDo0
NjozOSAtMDcwMAogU3ViamVjdDogW1BBVENIXSBzaWdxdWV1ZTogUmVuYW1lIF9zaWZpZWxkcyB0
byBfX3NpX2ZpZWxkcyBvbiBtdXNsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS10ZXN0cy1hcm0tVXNlLU8taW5zdGVhZC1vZi1PMC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLXRlc3RzLWFy
bS1Vc2UtTy1pbnN0ZWFkLW9mLU8wLnBhdGNoCmluZGV4IDNlZWExOTU1NzkuLjJlNDg0ZGMxYjYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAx
LXRlc3RzLWFybS1Vc2UtTy1pbnN0ZWFkLW9mLU8wLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLXRlc3RzLWFybS1Vc2UtTy1pbnN0ZWFkLW9m
LU8wLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4MDg3YWU4ZGNjNDZmM2Y4MWFmNThlZDli
NzE3Njc2MWI5ODhlZTYxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzZWIxYjczNTRk
MTQ5YzU1MTk0NzFlOGI3OTZhNWUwYzBmODc0YmM5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMTAgTWF5IDIw
MjQgMTc6NDQ6NDcgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvYXJtOiBVc2UgLU8gaW5z
dGVhZCBvZiAtTzAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92
YWxncmluZC8wMDAxLXZhbGdyaW5kLWZpbHRlcl94bWxfZnJhbWVzLWRvLW5vdC1maWx0ZXItdXNy
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtdmFs
Z3JpbmQtZmlsdGVyX3htbF9mcmFtZXMtZG8tbm90LWZpbHRlci11c3IucGF0Y2gKaW5kZXggYzY0
YzJhZmQzZi4uMDJlNjVkYmM5MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGdyaW5kL3ZhbGdyaW5kLzAwMDEtdmFsZ3JpbmQtZmlsdGVyX3htbF9mcmFtZXMtZG8tbm90LWZp
bHRlci11c3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdy
aW5kLzAwMDEtdmFsZ3JpbmQtZmlsdGVyX3htbF9mcmFtZXMtZG8tbm90LWZpbHRlci11c3IucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY4ZmJlYmNmNjllNGE4YmYyMTIyYjdjNTVmMmNlMzcy
Mzc3YWYxYmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY4NTZiOWY0MDI4NTBiY2Nj
YjJhY2IzM2E0NDUwNTg1MGZjYWFiMDggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBS
YW5keSBNYWNMZW9kIDxSYW5keS5NYWNMZW9kQHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24sIDEz
IE1heSAyMDE5IDE3OjEyOjIxIC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHZhbGdyaW5kOiBmaWx0
ZXJfeG1sX2ZyYW1lczogZG8gbm90IGZpbHRlciAvdXNyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMy1jb3JyZWN0LWluY2x1ZGUtZGlyZWN0
aXZlLXBhdGgtZm9yLWNvbmZpZy5oLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdy
aW5kL3ZhbGdyaW5kLzAwMDMtY29ycmVjdC1pbmNsdWRlLWRpcmVjdGl2ZS1wYXRoLWZvci1jb25m
aWcuaC5wYXRjaAppbmRleCAzYWNiNWEyOGY0Li4wMmEzYjg5N2QwIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMy1jb3JyZWN0LWluY2x1ZGUt
ZGlyZWN0aXZlLXBhdGgtZm9yLWNvbmZpZy5oLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy92YWxncmluZC92YWxncmluZC8wMDAzLWNvcnJlY3QtaW5jbHVkZS1kaXJlY3RpdmUtcGF0
aC1mb3ItY29uZmlnLmgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGRlNGQ3ZTQ3ODUxNWI2
M2YwNDliMjExMjY2ZDliOTQ2YzE1Y2MwYjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGQ5ZDQ1MzBmOGFhNGQ3YmI2ZDI1OGM0ZDJjNzg5MDk5NDFlMjU4NTYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogU2F0
LCAxMCBKdW4gMjAxNyAwMTowMzoxNyAtMDcwMAogU3ViamVjdDogW1BBVENIXSBjb3JyZWN0IGlu
Y2x1ZGUgZGlyZWN0aXZlIHBhdGggZm9yIGNvbmZpZy5oCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvQWRkZWQtc3VwcG9ydC1mb3ItUFBDLWluc3Ry
dWN0aW9ucy1tZmF0YnUtbWZhdGJsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdy
aW5kL3ZhbGdyaW5kL0FkZGVkLXN1cHBvcnQtZm9yLVBQQy1pbnN0cnVjdGlvbnMtbWZhdGJ1LW1m
YXRibC5wYXRjaAppbmRleCAxMDljYWY3NmFiLi42ODZhMGFiYjJmIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvQWRkZWQtc3VwcG9ydC1mb3ItUFBD
LWluc3RydWN0aW9ucy1tZmF0YnUtbWZhdGJsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy92YWxncmluZC92YWxncmluZC9BZGRlZC1zdXBwb3J0LWZvci1QUEMtaW5zdHJ1Y3Rpb25z
LW1mYXRidS1tZmF0YmwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDg1YmZmOTkzMDg3Y2Q3
MzY3ZmZjMzVkZTUyNWMyYmY2MTYyMzk4ZDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGQ1YWI0M2JlMzk0NjI5OGY0YTNhMTdhNTJmYmYwMGZlN2FmN2MwNjcgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBBbmVlc2ggQmFuc2FsIDxhbmVlc2guYmFuc2FsQGZyZWVzY2FsZS5j
b20+CiBEYXRlOiBNb24sIDIxIE5vdiAyMDExIDE3OjMxOjM5ICswNTMwCiBTdWJqZWN0OiBbUEFU
Q0hdIEFkZGVkIHN1cHBvcnQgZm9yIFBQQyBpbnN0cnVjdGlvbnMgbWZhdGJ1LCBtZmF0YmwuCkBA
IC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFuZWVzaCBCYW5zYWwgPGFuZWVzaC5iYW5z
YWxAZnJlZXNjYWxlLmNvbT4KICAzIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKIAog
ZGlmZiAtLWdpdCBhL1ZFWC9wcml2L2d1ZXN0X3BwY19kZWZzLmggYi9WRVgvcHJpdi9ndWVzdF9w
cGNfZGVmcy5oCi1pbmRleCAyMjBmYmYxLi5jZDI1OWYzIDEwMDY0NAoraW5kZXggZjU1NzFjNC4u
N2I4MGM5NiAxMDA2NDQKIC0tLSBhL1ZFWC9wcml2L2d1ZXN0X3BwY19kZWZzLmgKICsrKyBiL1ZF
WC9wcml2L2d1ZXN0X3BwY19kZWZzLmgKIEBAIC0yMzMsNiArMjMzLDggQEAgZXh0ZXJuIFVJbnQg
cHBjMzJnX2RpcnR5aGVscGVyX01GU1BSXzI2OF8yNjkgKCBVSW50ICk7CkBAIC0zMCw3ICszMCw3
IEBAIGluZGV4IDIyMGZiZjEuLmNkMjU5ZjMgMTAwNjQ0CiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFVJbnQgdkRfaWR4LCBVSW50IHNoLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBVSW50IHNoaWZ0X3JpZ2h0ICk7CiBkaWZmIC0tZ2l0IGEvVkVY
L3ByaXYvZ3Vlc3RfcHBjX2hlbHBlcnMuYyBiL1ZFWC9wcml2L2d1ZXN0X3BwY19oZWxwZXJzLmMK
LWluZGV4IDI2MTFlNTIuLjcyYzM0OWIgMTAwNjQ0CitpbmRleCAxMDZmNTdlLi5jM2IwOGU0IDEw
MDY0NAogLS0tIGEvVkVYL3ByaXYvZ3Vlc3RfcHBjX2hlbHBlcnMuYwogKysrIGIvVkVYL3ByaXYv
Z3Vlc3RfcHBjX2hlbHBlcnMuYwogQEAgLTExOCw2ICsxMTgsMjQgQEAgVUludCBwcGMzMmdfZGly
dHloZWxwZXJfTUZTUFJfMjg3ICggdm9pZCApCkBAIC01OSw3ICs1OSw3IEBAIGluZGV4IDI2MTFl
NTIuLjcyYzM0OWIgMTAwNjQ0CiAgLyogQ0FMTEVEIEZST00gR0VORVJBVEVEIENPREUgKi8KICAv
KiBESVJUWSBIRUxQRVIgKHJlYWRzIGd1ZXN0IHN0YXRlLCB3cml0ZXMgZ3Vlc3QgbWVtKSAqLwog
ZGlmZiAtLWdpdCBhL1ZFWC9wcml2L2d1ZXN0X3BwY190b0lSLmMgYi9WRVgvcHJpdi9ndWVzdF9w
cGNfdG9JUi5jCi1pbmRleCAxODcxNmRkLi5iMmU3MmEwIDEwMDY0NAoraW5kZXggMjMxZTkxNC4u
Mjg3MDhiMCAxMDA2NDQKIC0tLSBhL1ZFWC9wcml2L2d1ZXN0X3BwY190b0lSLmMKICsrKyBiL1ZF
WC9wcml2L2d1ZXN0X3BwY190b0lSLmMKIEBAIC0xMTg3NSw2ICsxMTg3NSwyOCBAQCBzdGF0aWMg
Qm9vbCBkaXNfcHJvY19jdGwgKCBjb25zdCBWZXhBYmlJbmZvKiB2YmksIFVJbnQgcHJlZml4LCBV
SW50IHRoZUluc3RyICkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmlu
ZC92YWxncmluZC9hdm9pZC1uZW9uLWZvci10YXJnZXRzLXdoaWNoLWRvbi10LXN1cHBvcnQtaXQu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvYXZvaWQtbmVv
bi1mb3ItdGFyZ2V0cy13aGljaC1kb24tdC1zdXBwb3J0LWl0LnBhdGNoCmluZGV4IDE1OTdiM2Ew
MjEuLmRkYjYxYjE3ZmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmlu
ZC92YWxncmluZC9hdm9pZC1uZW9uLWZvci10YXJnZXRzLXdoaWNoLWRvbi10LXN1cHBvcnQtaXQu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL2F2b2lk
LW5lb24tZm9yLXRhcmdldHMtd2hpY2gtZG9uLXQtc3VwcG9ydC1pdC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gNTk2MzcyYmM5YjRkMzFiYzk4MTE4ODFjZmE3NDdkOTlhOGMyNTE0MSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMDJkNTQ1MzczOTI3MzVhYzM2YjFiNmUwMzczN2Y4
YTIzOGMxMTczNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJlIE1jQ3VyZHkg
PGFybWNjdXJkeUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDE5IEphbiAyMDE2IDE2OjQyOjM2IC0w
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF2b2lkIG5lb24gZm9yIHRhcmdldHMgd2hpY2ggZG9uJ3Qg
c3VwcG9ydCBpdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3Zh
bGdyaW5kL2ZpeGVkLXBlcmwtcGF0aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxn
cmluZC92YWxncmluZC9maXhlZC1wZXJsLXBhdGgucGF0Y2gKaW5kZXggNmJmYzYwMzVlZC4uNjFm
MmVkNDRlMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdy
aW5kL2ZpeGVkLXBlcmwtcGF0aC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFs
Z3JpbmQvdmFsZ3JpbmQvZml4ZWQtcGVybC1wYXRoLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSA0MDhmOWIzOWNhNGY1NzA5YjY2OGYxMzgyOWE5NGM0Y2FlODU1MDA2IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBkOGIwZTE1ZjVjMjZmZmE1ZGNmZGQ5MGEyOGVmMzM4ZGY5OTM5YTVm
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUWluZyBIZSA8cWluZy5oZUBpbnRlbC5j
b20+CiBEYXRlOiBUdWUsIDMxIEF1ZyAyMDEwIDIyOjUxOjU4ICswODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHZhbGdyaW5kOiBmaXggcGVybCBzY3JpcHRzCkBAIC0yNCw3ICsyNCw3IEBAIFNpZ25lZC1v
ZmYtYnk6IE1heGluIEIuIEpvaG4gPG1heGluLmpvaG5AaW50ZWwuY29tPgogIDMgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbWFz
c2lmL21zX3ByaW50LmluIGIvbWFzc2lmL21zX3ByaW50LmluCi1pbmRleCBhMjA2Y2U0Li5kZjFi
YzMxIDEwMDc1NQoraW5kZXggZWNkOWYzOC4uMzMxMzlkZSAxMDA2NDQKIC0tLSBhL21hc3NpZi9t
c19wcmludC5pbgogKysrIGIvbWFzc2lmL21zX3ByaW50LmluCiBAQCAtMSw0ICsxLDQgQEAKQEAg
LTM0LDcgKzM0LDcgQEAgaW5kZXggYTIwNmNlNC4uZGYxYmMzMSAxMDA3NTUKICAjIy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tIyMKICAjIy0tLSBNYXNzaWYncyByZXN1bHRzIHByaW50ZXIgICAgICAgICAgICAgICAgICAg
ICAgICAgbXNfcHJpbnQuaW4gLS0tIyMKIGRpZmYgLS1naXQgYS9wZXJmL3ZnX3BlcmYuaW4gYi9w
ZXJmL3ZnX3BlcmYuaW4KLWluZGV4IDkwZWUxZDIuLmM1ODUwOTYgMTAwNjQ0CitpbmRleCBjYzI3
ODM0Li4wZTQ5NTUwIDEwMDY0NAogLS0tIGEvcGVyZi92Z19wZXJmLmluCiArKysgYi9wZXJmL3Zn
X3BlcmYuaW4KIEBAIC0xLDQgKzEsNCBAQApAQCAtNDQsNyArNDQsNyBAQCBpbmRleCA5MGVlMWQy
Li5jNTg1MDk2IDEwMDY0NAogICMjLS0tIFZhbGdyaW5kIHBlcmZvcm1hbmNlIHRlc3Rpbmcgc2Ny
aXB0ICAgICAgICAgICAgICAgICAgdmdfcGVyZiAtLS0jIwogICMjLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0jIwogZGlm
ZiAtLWdpdCBhL3Rlc3RzL3ZnX3JlZ3Rlc3QuaW4gYi90ZXN0cy92Z19yZWd0ZXN0LmluCi1pbmRl
eCAzNDcxMzIyLi40OWUxMTE0IDEwMDc1NQoraW5kZXggMGQ3ZWM3MS4uYjQ0ZWI4OSAxMDA2NDQK
IC0tLSBhL3Rlc3RzL3ZnX3JlZ3Rlc3QuaW4KICsrKyBiL3Rlc3RzL3ZnX3JlZ3Rlc3QuaW4KIEBA
IC0xLDQgKzEsNCBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5k
L3ZhbGdyaW5kL3MzOTB4X3ZlY19vcF90LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGdyaW5kL3ZhbGdyaW5kL3MzOTB4X3ZlY19vcF90LnBhdGNoCmluZGV4IDE5NjkwZTVlYmIuLjQ4
YmJlYWI5OTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxn
cmluZC9zMzkweF92ZWNfb3BfdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFs
Z3JpbmQvdmFsZ3JpbmQvczM5MHhfdmVjX29wX3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDhjOTIwODk3NDFkODA5Y2ZkMTgzNTRmMWI0ZGYxOGNkMjgzOThhMjAgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGRlODk4NGMxZmYzYWUxNDg1NjRiZTlhYzYyZWIyMzVmZWViMWE5Nzcg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBZaSBGYW4gWXUgPHlpZmFuLnl1QHdpbmRy
aXZlci5jb20+CiBEYXRlOiBXZWQsIDE3IE1hciAyMDIxIDEyOjE2OjMxIC0wNDAwCiBTdWJqZWN0
OiBbUEFUQ0hdIHJlbW92ZSBzMzkweF92ZWNfb3BfdApAQCAtMTgsNyArMTgsNyBAQCBTaWduZWQt
b2ZmLWJ5OiBZaSBGYW4gWXUgPHlpZmFuLnl1QHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9WRVgvcHJp
di9ndWVzdF9zMzkwX2RlZnMuaCBiL1ZFWC9wcml2L2d1ZXN0X3MzOTBfZGVmcy5oCi1pbmRleCAy
OWVmYTAxLi4zYThmMGEwIDEwMDY0NAoraW5kZXggYTc4MGU4My4uNDY2MDlhYyAxMDA2NDQKIC0t
LSBhL1ZFWC9wcml2L2d1ZXN0X3MzOTBfZGVmcy5oCiArKysgYi9WRVgvcHJpdi9ndWVzdF9zMzkw
X2RlZnMuaAogQEAgLTI4NSw3ICsyODUsNyBAQCB0eXBlZGVmIGVudW0gewpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3VzZS1hcHByb3ByaWF0ZS1t
YXJjaC1tY3B1LW1mcHUtZm9yLUFSTS10ZXN0LWFwcHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvdXNlLWFwcHJvcHJpYXRlLW1hcmNoLW1jcHUtbWZwdS1m
b3ItQVJNLXRlc3QtYXBwcy5wYXRjaAppbmRleCAwYzE4YTYzYzJiLi41NTQ0NDFjMDhkIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvdXNlLWFwcHJv
cHJpYXRlLW1hcmNoLW1jcHUtbWZwdS1mb3ItQVJNLXRlc3QtYXBwcy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvdXNlLWFwcHJvcHJpYXRlLW1hcmNo
LW1jcHUtbWZwdS1mb3ItQVJNLXRlc3QtYXBwcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
YTVjZDAwZjFjMmQ3OGUyYTE1ZjRhMGM1OTVmNWFjMTBjYTRjMzI5MCBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gYzFkMjM5ZWM4ODIyNDk0MGNkZDBlNDJjODEwMzQ0MDU1MDFjMmI0NyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBn
bWFpbC5jb20+CiBEYXRlOiBUdWUsIDE5IEphbiAyMDE2IDE2OjAwOjAwIC0wODAwCiBTdWJqZWN0
OiBbUEFUQ0hdIHVzZSBhcHByb3ByaWF0ZSAtbWFyY2gvLW1jcHUvLW1mcHUgZm9yIEFSTSB0ZXN0
IGFwcHMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmlu
ZC92YWxncmluZC1tYWtlLWxkLVhYWC5zby1zdHJsZW4taW50ZXJjZXB0LW9wdGlvbmFsLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3ZhbGdyaW5kLW1ha2Ut
bGQtWFhYLnNvLXN0cmxlbi1pbnRlcmNlcHQtb3B0aW9uYWwucGF0Y2gKaW5kZXggY2E3ZjcyMWQ5
Yy4uYzU3NzhmOThjZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5k
L3ZhbGdyaW5kL3ZhbGdyaW5kLW1ha2UtbGQtWFhYLnNvLXN0cmxlbi1pbnRlcmNlcHQtb3B0aW9u
YWwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3Zh
bGdyaW5kLW1ha2UtbGQtWFhYLnNvLXN0cmxlbi1pbnRlcmNlcHQtb3B0aW9uYWwucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGI0MDc1MTRhYTFhNGZkMzY2N2IzMDUyNzI2MGUyNzFkYTM0Y2U0
YTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDQ5ZTI3NjU5M2Y2ZjYyMDQ2OGVhYzMy
YzcxNzljM2Q1NzYzNzk2NGQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZSBN
Y0N1cmR5IDxhcm1jY3VyZHlAZ21haWwuY29tPgogRGF0ZTogVHVlLCAxMyBEZWMgMjAxNiAxMToy
OTo1NSArMDgwMAogU3ViamVjdDogW1BBVENIXSBtYWtlIGxkLVhYWC5zbyBzdHJsZW4gaW50ZXJj
ZXB0IG9wdGlvbmFsCkBAIC0xNyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEphY2tpZSBIdWFu
ZyA8amFja2llLmh1YW5nQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvcmVncmluZC9tX3JlZGly
LmMgYi9jb3JlZ3JpbmQvbV9yZWRpci5jCi1pbmRleCA2MzE3MmI5Li4xYjViZjk1IDEwMDY0NAor
aW5kZXggZTBmNTk2Zi4uNDYzMTU2NCAxMDA2NDQKIC0tLSBhL2NvcmVncmluZC9tX3JlZGlyLmMK
ICsrKyBiL2NvcmVncmluZC9tX3JlZGlyLmMKIEBAIC0xMzIxLDcgKzEzMjEsMTggQEAgc3RhdGlj
IHZvaWQgYWRkX2hhcmR3aXJlZF9zcGVjIChjb25zdCAgSENoYXIqIHNvcGF0dCwgY29uc3QgSENo
YXIqIGZucGF0dCwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92
YWxncmluZF8zLjI1LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3Jp
bmRfMy4yNS4xLmJiCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBhOGIwYmU1NzY3Li4w
MDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZF8z
LjI1LjEuYmIKKysrIC9kZXYvbnVsbApAQCAtMSwxMTYgKzAsMCBAQAotU1VNTUFSWSA9ICJWYWxn
cmluZCBtZW1vcnkgZGVidWdnZXIgYW5kIGluc3RydW1lbnRhdGlvbiBmcmFtZXdvcmsiCi1IT01F
UEFHRSA9ICJodHRwOi8vdmFsZ3JpbmQub3JnLyIKLURFU0NSSVBUSU9OID0gIlZhbGdyaW5kIGlz
IGFuIGluc3RydW1lbnRhdGlvbiBmcmFtZXdvcmsgZm9yIGJ1aWxkaW5nIGR5bmFtaWMgYW5hbHlz
aXMgdG9vbHMuIFRoZXJlIGFyZSBWYWxncmluZCB0b29scyB0aGF0IGNhbiBhdXRvbWF0aWNhbGx5
IGRldGVjdCBtYW55IG1lbW9yeSBtYW5hZ2VtZW50IGFuZCB0aHJlYWRpbmcgYnVncywgYW5kIHBy
b2ZpbGUgeW91ciBwcm9ncmFtcyBpbiBkZXRhaWwuIgotQlVHVFJBQ0tFUiA9ICJodHRwOi8vdmFs
Z3JpbmQub3JnL3N1cHBvcnQvYnVnX3JlcG9ydHMuaHRtbCIKLUxJQ0VOU0UgPSAiR1BMLTIuMC1v
bmx5ICYgR1BMLTIuMC1vci1sYXRlciAmIEJTRC0zLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIFwK
LSAgICAgICAgICAgICAgICAgICAgZmlsZTovL2luY2x1ZGUvcHViX3Rvb2xfYmFzaWNzLmg7YmVn
aW5saW5lPTY7ZW5kbGluZT0yOTttZDU9NDFjNDEwZThkM2YzMDVhZWU3YWFhNjY2YjJlNGYzNjYg
XAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vaW5jbHVkZS92YWxncmluZC5oO2JlZ2lubGlu
ZT0xO2VuZGxpbmU9NTY7bWQ1PWFkM2IzMTdmMzI4NmI2YjcwNDU3NWQ5ZWZlNmNhNWRmIFwKLSAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJTkcuRE9DUzttZDU9MjRlYTRjNzA5MjIzMzg0
OWI0Mzk0Njk5MzMzYjVjNTYiCi0KLVNSQ19VUkkgPSAiaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9w
dWIvdmFsZ3JpbmQvdmFsZ3JpbmQtJHtQVn0udGFyLmJ6MiBcCi0gICAgICAgICAgIGZpbGU6Ly9m
aXhlZC1wZXJsLXBhdGgucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vQWRkZWQtc3VwcG9ydC1m
b3ItUFBDLWluc3RydWN0aW9ucy1tZmF0YnUtbWZhdGJsLnBhdGNoIFwKLSAgICAgICAgICAgZmls
ZTovL3VzZS1hcHByb3ByaWF0ZS1tYXJjaC1tY3B1LW1mcHUtZm9yLUFSTS10ZXN0LWFwcHMucGF0
Y2ggXAotICAgICAgICAgICBmaWxlOi8vYXZvaWQtbmVvbi1mb3ItdGFyZ2V0cy13aGljaC1kb24t
dC1zdXBwb3J0LWl0LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtY29uZmlndXJlLURy
b3Atc2V0dGluZy1tY3B1LWNvcnRleC1hOC1vbi1hcm0ucGF0Y2ggXAotICAgICAgICAgICBmaWxl
Oi8vdmFsZ3JpbmQtbWFrZS1sZC1YWFguc28tc3RybGVuLWludGVyY2VwdC1vcHRpb25hbC5wYXRj
aCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLW1ha2VmaWxlcy1Ecm9wLXNldHRpbmctbWNwdS10
by1jb3J0ZXgtYTgtb24tYXJtLWFyY2gucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1z
aWdxdWV1ZS1SZW5hbWUtX3NpZmllbGRzLXRvLV9fc2lfZmllbGRzLW9uLW11c2wucGF0Y2ggXAot
ICAgICAgICAgICBmaWxlOi8vMDAwMy1jb3JyZWN0LWluY2x1ZGUtZGlyZWN0aXZlLXBhdGgtZm9y
LWNvbmZpZy5oLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtdmFsZ3JpbmQtZmlsdGVy
X3htbF9mcmFtZXMtZG8tbm90LWZpbHRlci11c3IucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8v
MDAwMS1tZW1jaGVjay12Z3Rlc3RzLXJlbW92ZS1mdWxscGF0aC1hZnRlci1mbGFncy5wYXRjaCBc
Ci0gICAgICAgICAgIGZpbGU6Ly9zMzkweF92ZWNfb3BfdC5wYXRjaCBcCi0gICAgICAgICAgIGZp
bGU6Ly8wMDAxLW5vbmUtdGVzdHMtZmRsZWFrX2Ntc2cuc3RkZXJyLmV4cC1hZGp1c3QtdG1wLXBh
dGhzLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtbWVtY2hlY2stdGVzdHMtRml4LXRp
bWVyZmQtc3lzY2FsbC10ZXN0LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtZG9jcy1E
aXNhYmxlLW1hbnVhbC12YWxpZGF0aW9uLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEt
dGVzdHMtYXJtLVVzZS1PLWluc3RlYWQtb2YtTzAucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8v
MDAwMS1Vc2UtcG9ydGFibGUtc3ludGF4LWZvci1wdXNoc2VjdGlvbi1kaXJlY3RpdmUtaW4taW5s
LnBhdGNoIFwKLSAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYxZGViOGQwNzI3
YjQ1YzI2OGVmZGMxYjNiNmM5ZTY3OWNkOTdjYmY1ZWU0YjI4ZDFkZWFkN2M4YjdhMjcxYWYiCi1V
UFNUUkVBTV9DSEVDS19SRUdFWCA9ICJ2YWxncmluZC0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRh
ciIKLQotQ09NUEFUSUJMRV9IT1NUID0gJyhpLjg2fHg4Nl82NHxhcm18YWFyY2g2NHxtaXBzfHBv
d2VycGN8cG93ZXJwYzY0fHJpc2N2NjQpLiotbGludXgnCi0KLSMgdmFsZ3JpbmQgc3VwcG9ydHMg
YXJtdjcgYW5kIGFib3ZlCi1DT01QQVRJQkxFX0hPU1Q6YXJtdjQgPSAnbnVsbCcKLUNPTVBBVElC
TEVfSE9TVDphcm12NSA9ICdudWxsJwotQ09NUEFUSUJMRV9IT1NUOmFybXY2ID0gJ251bGwnCi0K
LSMgdmFsZ3JpbmQgZmFpbHMgd2l0aCBwb3dlcnBjIHNvZnQtZmxvYXQKLUNPTVBBVElCTEVfSE9T
VDpwb3dlcnBjID0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdUQVJHRVRfRlBVJywgJ3NvZnQnLCAn
bnVsbCcsICcuKi1saW51eCcsIGQpfSIKLQotIyBYMzIgaXNuJ3Qgc3VwcG9ydGVkIGJ5IHZhbGdy
aW5kIGF0IHRoaXMgdGltZQotQ09NUEFUSUJMRV9IT1NUOmxpbnV4LWdudXgzMiA9ICdudWxsJwot
Q09NUEFUSUJMRV9IT1NUOmxpbnV4LW11c2x4MzIgPSAnbnVsbCcKLQotIyBEaXNhYmxlIGZvciBz
b21lIE1JUFMgdmFyaWFudHMKLUNPTVBBVElCTEVfSE9TVDptaXBzYXJjaHI2ID0gJ251bGwnCi1D
T01QQVRJQkxFX0hPU1Q6bGludXgtZ251bjMyID0gJ251bGwnCi0KLSMgRGlzYWJsZSBmb3IgcG93
ZXJwYzY0IHdpdGggbXVzbAotQ09NUEFUSUJMRV9IT1NUOmxpYmMtbXVzbDpwb3dlcnBjNjQgPSAn
bnVsbCcKLQotaW5oZXJpdCBhdXRvdG9vbHMtYnJva2Vuc2VwIG11bHRpbGliX2hlYWRlcgotCi1F
WFRSQV9PRUNPTkYgPSAiLS1lbmFibGUtdGxzIC0td2l0aG91dC1tcGljYyIKLUVYVFJBX09FQ09O
RiArPSAiJHtAWyctLWVuYWJsZS1vbmx5MzJiaXQnLCctLWVuYWJsZS1vbmx5NjRiaXQnXVtkLmdl
dFZhcignU0lURUlORk9fQklUUycpICE9ICczMiddfSIKLQotIyB2YWxncmluZCBjaGVja3MgaG9z
dF9jcHUgImFybXY3KikiLCBzbyB3ZSBuZWVkIHRvIG92ZXItcmlkZSB0aGUgYXV0b3Rvb2xzLmJi
Y2xhc3MgZGVmYXVsdCAtLWhvc3Qgb3B0aW9uCi1FWFRSQV9PRUNPTkY6YXBwZW5kOmFybSA9ICIg
LS1ob3N0PWFybXY3JHtIT1NUX1ZFTkRPUn0tJHtIT1NUX09TfSIKLQotRVhUUkFfT0VNQUtFID0g
Ii13IgotCi1DQUNIRURfQ09ORklHVVJFVkFSUyArPSAiYWNfY3ZfcGF0aF9QRVJMPScvdXNyL2Jp
bi9lbnYgcGVybCciCi0KLSMgdmFsZ3JpbmQgbGlrZXMgdG8gY29udHJvbCBpdHMgb3duIG9wdGlt
aXNhdGlvbiBmbGFncy4gSXQgZ2VuZXJhbGx5IGRlZmF1bHRzCi0jIHRvIC1PMiBidXQgdXNlcyAt
TzAgZm9yIHNvbWUgc3BlY2lmaWMgdGVzdCBhcHBzIGV0Yy4gUGFzc2luZyBvdXIgb3duIGZsYWdz
Ci0jICh2aWEgQ0ZMQUdTKSBtZWFucyB3ZSBpbnRlcmZlcmUgd2l0aCB0aGF0LiBPbmx5IHBhc3Mg
REVCVUdfRkxBR1MgdG8gaXQKLSMgd2hpY2ggZml4ZXMgYnVpbGQgcGF0aCBpc3N1ZSBpbiBEV0FS
Ri4KLVNFTEVDVEVEX09QVElNSVpBVElPTiA9ICIke0RFQlVHX0xFVkVMRkxBR30iCi0KLSMgU3Bs
aXQgb3V0IHZhcmlvdXMgaGVscGVyIHNjcmlwdHMgdG8gc2VwYXJhdGUgcGFja2FnZXMgdG8gYXZv
aWQgdGhlCi0jIG1haW4gcGFja2FnZSBkZXBlbmRpbmcgb24gcGVybCBhbmQgcHl0aG9uLgotUEFD
S0FHRVMgPSsgIiR7UE59LWNhY2hlZ3JpbmQgJHtQTn0tbWFzc2lmICR7UE59LWNhbGxncmluZCIK
LQotRklMRVM6JHtQTn0tY2FjaGVncmluZCA9ICIke2JpbmRpcn0vY2dfKiIKLUZJTEVTOiR7UE59
LW1hc3NpZiA9ICIke2JpbmRpcn0vbXNfKiIKLUZJTEVTOiR7UE59LWNhbGxncmluZCA9ICIke2Jp
bmRpcn0vY2FsbGdyaW5kXyoiCi0KLVJERVBFTkRTOiR7UE59LWNhY2hlZ3JpbmQgPSAiJHtQTn0g
cHl0aG9uMy1jb3JlIgotUkRFUEVORFM6JHtQTn0tbWFzc2lmID0gIiR7UE59IHBlcmwiCi1SREVQ
RU5EUzoke1BOfS1jYWxsZ3JpbmQgPSAiJHtQTn0gcGVybCIKLQotZG9fY29uZmlndXJlOnByZXBl
bmQgKCkgewotICAgIHJtIC1yZiAke1N9L2NvbmZpZy5oCi19Ci0KLWRvX2luc3RhbGw6YXBwZW5k
ICgpIHsKLSAgICBpbnN0YWxsIC1tIDY0NCAke0J9L2RlZmF1bHQuc3VwcCAke0R9LyR7bGliZXhl
Y2Rpcn0vdmFsZ3JpbmQvCi0gICAgb2VfbXVsdGlsaWJfaGVhZGVyIHZhbGdyaW5kL2NvbmZpZy5o
Ci19Ci0KLVZBTEdSSU5EQVJDSCA/PSAiJHtUQVJHRVRfQVJDSH0iCi1WQUxHUklOREFSQ0g6YWFy
Y2g2NCA9ICJhcm02NCIKLVZBTEdSSU5EQVJDSDp4ODYtNjQgPSAiYW1kNjQiCi1WQUxHUklOREFS
Q0g6eDg2ID0gIng4NiIKLVZBTEdSSU5EQVJDSDptaXBzID0gIm1pcHMzMiIKLVZBTEdSSU5EQVJD
SDptaXBzZWwgPSAibWlwczMyIgotVkFMR1JJTkRBUkNIOm1pcHM2NGVsID0gIm1pcHM2NCIKLVZB
TEdSSU5EQVJDSDpwb3dlcnBjID0gInBwYyIKLVZBTEdSSU5EQVJDSDpwb3dlcnBjNjQgPSAicHBj
NjQiCi1WQUxHUklOREFSQ0g6cG93ZXJwYzY0bGUgPSAicHBjNjRsZSIKLQotSU5ISUJJVF9QQUNL
QUdFX1NUUklQX0ZJTEVTID0gIiR7UEtHRH0ke2xpYmV4ZWNkaXJ9L3ZhbGdyaW5kL3ZncHJlbG9h
ZF9tZW1jaGVjay0ke1ZBTEdSSU5EQVJDSH0tbGludXguc28iCi0KLSMgdmFsZ3JpbmQgbmVlZHMg
ZGVidWcgaW5mb3JtYXRpb24gZm9yIGxkLnNvIGF0IHJ1bnRpbWUgaW4gb3JkZXIgdG8KLSMgcmVk
aXJlY3QgZnVuY3Rpb25zIGxpa2Ugc3RybGVuLgotUlJFQ09NTUVORFM6JHtQTn0gKz0gIiR7VENM
SUJDfS1kYmciCi0KLSMgVmFsZ3JpbmQgbmVlZHMgaW50cmluc2ljcyB3aGljaCBhcmUgbm90IHBy
b3ZpZGVkIGJ5IGNsYW5nCi0jIG1fc2lnbmFscy5jOjIyMTM6NzogZXJyb3I6IF9fYnVpbHRpbl9s
b25nam1wIGlzIG5vdCBzdXBwb3J0ZWQgZm9yIHRoZSBjdXJyZW50IHRhcmdldAotIyAyMjEzIHwg
ICAgICAgVkdfTUlOSU1BTF9MT05HSk1QKHRzdC0+c2NoZWRfam1wYnVmKTsKLSMgICAgICB8ICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KLSMKLSMgSXQgbmVlZHMg
c29tZXRoaW5nIGxpa2UgLSBodHRwczovL2J1Z3Mua2RlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MzY5
NzIzCi1UT09MQ0hBSU46cmlzY3Y2NCA9ICJnY2MiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmRfMy4yNi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3ZhbGdyaW5kL3ZhbGdyaW5kXzMuMjYuMC5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi5lMTJiZTU5ZDM5Ci0tLSAvZGV2L251bGwKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kXzMuMjYuMC5iYgpAQCAtMCwwICsxLDExMTYgQEAK
KyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBi
eSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBi
ZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRl
IHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBp
bgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4
YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMg
VGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0xLDI4
MSArMSw2MjIgQEAKKyMgICAgICAgICAgICAgICAgICAgICAgR05VIEdFTkVSQUwgUFVCTElDIExJ
Q0VOU0UKKyMgLSAgICAgICAgICAgICAgICAgICAgICAgVmVyc2lvbiAyLCBKdW5lIDE5OTEKKyMg
LQorIyAtIENvcHlyaWdodCAoQykgMTk4OSwgMTk5MSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24s
IEluYy4sCisjIC0gNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAw
MjExMC0xMzAxIFVTQQorIyArICAgICAgICAgICAgICAgICAgICAgICBWZXJzaW9uIDMsIDI5IEp1
bmUgMjAwNworIyArCisjICsgQ29weXJpZ2h0IChDKSAyMDA3IEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbiwgSW5jLiA8aHR0cHM6Ly9mc2Yub3JnLz4KKyMgICBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQg
dG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMKKyMgICBvZiB0aGlzIGxpY2Vu
c2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgIAorIyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFByZWFtYmxlCisjICAKKyMgLSAgVGhlIGxpY2Vuc2Vz
IGZvciBtb3N0IHNvZnR3YXJlIGFyZSBkZXNpZ25lZCB0byB0YWtlIGF3YXkgeW91cgorIyAtZnJl
ZWRvbSB0byBzaGFyZSBhbmQgY2hhbmdlIGl0LiAgQnkgY29udHJhc3QsIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMKKyMgLUxpY2Vuc2UgaXMgaW50ZW5kZWQgdG8gZ3VhcmFudGVlIHlvdXIgZnJlZWRv
bSB0byBzaGFyZSBhbmQgY2hhbmdlIGZyZWUKKyMgLXNvZnR3YXJlLS10byBtYWtlIHN1cmUgdGhl
IHNvZnR3YXJlIGlzIGZyZWUgZm9yIGFsbCBpdHMgdXNlcnMuICBUaGlzCisjIC1HZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGFwcGxpZXMgdG8gbW9zdCBvZiB0aGUgRnJlZSBTb2Z0d2FyZQorIyAtRm91
bmRhdGlvbidzIHNvZnR3YXJlIGFuZCB0byBhbnkgb3RoZXIgcHJvZ3JhbSB3aG9zZSBhdXRob3Jz
IGNvbW1pdCB0bworIyAtdXNpbmcgaXQuICAoU29tZSBvdGhlciBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb24gc29mdHdhcmUgaXMgY292ZXJlZCBieQorIyAtdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZSBpbnN0ZWFkLikgIFlvdSBjYW4gYXBwbHkgaXQgdG8KKyMgKyAgVGhlIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGlzIGEgZnJlZSwgY29weWxlZnQgbGljZW5zZSBmb3IK
KyMgK3NvZnR3YXJlIGFuZCBvdGhlciBraW5kcyBvZiB3b3Jrcy4KKyMgKworIyArICBUaGUgbGlj
ZW5zZXMgZm9yIG1vc3Qgc29mdHdhcmUgYW5kIG90aGVyIHByYWN0aWNhbCB3b3JrcyBhcmUgZGVz
aWduZWQKKyMgK3RvIHRha2UgYXdheSB5b3VyIGZyZWVkb20gdG8gc2hhcmUgYW5kIGNoYW5nZSB0
aGUgd29ya3MuICBCeSBjb250cmFzdCwKKyMgK3RoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZSBpcyBpbnRlbmRlZCB0byBndWFyYW50ZWUgeW91ciBmcmVlZG9tIHRvCisjICtzaGFyZSBhbmQg
Y2hhbmdlIGFsbCB2ZXJzaW9ucyBvZiBhIHByb2dyYW0tLXRvIG1ha2Ugc3VyZSBpdCByZW1haW5z
IGZyZWUKKyMgK3NvZnR3YXJlIGZvciBhbGwgaXRzIHVzZXJzLiAgV2UsIHRoZSBGcmVlIFNvZnR3
YXJlIEZvdW5kYXRpb24sIHVzZSB0aGUKKyMgK0dOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZv
ciBtb3N0IG9mIG91ciBzb2Z0d2FyZTsgaXQgYXBwbGllcyBhbHNvIHRvCisjICthbnkgb3RoZXIg
d29yayByZWxlYXNlZCB0aGlzIHdheSBieSBpdHMgYXV0aG9ycy4gIFlvdSBjYW4gYXBwbHkgaXQg
dG8KKyMgIHlvdXIgcHJvZ3JhbXMsIHRvby4KKyMgIAorIyAgICBXaGVuIHdlIHNwZWFrIG9mIGZy
ZWUgc29mdHdhcmUsIHdlIGFyZSByZWZlcnJpbmcgdG8gZnJlZWRvbSwgbm90CisjICBwcmljZS4g
IE91ciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlcyBhcmUgZGVzaWduZWQgdG8gbWFrZSBzdXJlIHRo
YXQgeW91CisjICBoYXZlIHRoZSBmcmVlZG9tIHRvIGRpc3RyaWJ1dGUgY29waWVzIG9mIGZyZWUg
c29mdHdhcmUgKGFuZCBjaGFyZ2UgZm9yCisjIC10aGlzIHNlcnZpY2UgaWYgeW91IHdpc2gpLCB0
aGF0IHlvdSByZWNlaXZlIHNvdXJjZSBjb2RlIG9yIGNhbiBnZXQgaXQKKyMgLWlmIHlvdSB3YW50
IGl0LCB0aGF0IHlvdSBjYW4gY2hhbmdlIHRoZSBzb2Z0d2FyZSBvciB1c2UgcGllY2VzIG9mIGl0
CisjIC1pbiBuZXcgZnJlZSBwcm9ncmFtczsgYW5kIHRoYXQgeW91IGtub3cgeW91IGNhbiBkbyB0
aGVzZSB0aGluZ3MuCisjIC0KKyMgLSAgVG8gcHJvdGVjdCB5b3VyIHJpZ2h0cywgd2UgbmVlZCB0
byBtYWtlIHJlc3RyaWN0aW9ucyB0aGF0IGZvcmJpZAorIyAtYW55b25lIHRvIGRlbnkgeW91IHRo
ZXNlIHJpZ2h0cyBvciB0byBhc2sgeW91IHRvIHN1cnJlbmRlciB0aGUgcmlnaHRzLgorIyAtVGhl
c2UgcmVzdHJpY3Rpb25zIHRyYW5zbGF0ZSB0byBjZXJ0YWluIHJlc3BvbnNpYmlsaXRpZXMgZm9y
IHlvdSBpZiB5b3UKKyMgLWRpc3RyaWJ1dGUgY29waWVzIG9mIHRoZSBzb2Z0d2FyZSwgb3IgaWYg
eW91IG1vZGlmeSBpdC4KKyMgK3RoZW0gaWYgeW91IHdpc2gpLCB0aGF0IHlvdSByZWNlaXZlIHNv
dXJjZSBjb2RlIG9yIGNhbiBnZXQgaXQgaWYgeW91CisjICt3YW50IGl0LCB0aGF0IHlvdSBjYW4g
Y2hhbmdlIHRoZSBzb2Z0d2FyZSBvciB1c2UgcGllY2VzIG9mIGl0IGluIG5ldworIyArZnJlZSBw
cm9ncmFtcywgYW5kIHRoYXQgeW91IGtub3cgeW91IGNhbiBkbyB0aGVzZSB0aGluZ3MuCisjICsK
KyMgKyAgVG8gcHJvdGVjdCB5b3VyIHJpZ2h0cywgd2UgbmVlZCB0byBwcmV2ZW50IG90aGVycyBm
cm9tIGRlbnlpbmcgeW91CisjICt0aGVzZSByaWdodHMgb3IgYXNraW5nIHlvdSB0byBzdXJyZW5k
ZXIgdGhlIHJpZ2h0cy4gIFRoZXJlZm9yZSwgeW91IGhhdmUKKyMgK2NlcnRhaW4gcmVzcG9uc2li
aWxpdGllcyBpZiB5b3UgZGlzdHJpYnV0ZSBjb3BpZXMgb2YgdGhlIHNvZnR3YXJlLCBvciBpZgor
IyAreW91IG1vZGlmeSBpdDogcmVzcG9uc2liaWxpdGllcyB0byByZXNwZWN0IHRoZSBmcmVlZG9t
IG9mIG90aGVycy4KKyMgIAorIyAgICBGb3IgZXhhbXBsZSwgaWYgeW91IGRpc3RyaWJ1dGUgY29w
aWVzIG9mIHN1Y2ggYSBwcm9ncmFtLCB3aGV0aGVyCisjIC1ncmF0aXMgb3IgZm9yIGEgZmVlLCB5
b3UgbXVzdCBnaXZlIHRoZSByZWNpcGllbnRzIGFsbCB0aGUgcmlnaHRzIHRoYXQKKyMgLXlvdSBo
YXZlLiAgWW91IG11c3QgbWFrZSBzdXJlIHRoYXQgdGhleSwgdG9vLCByZWNlaXZlIG9yIGNhbiBn
ZXQgdGhlCisjIC1zb3VyY2UgY29kZS4gIEFuZCB5b3UgbXVzdCBzaG93IHRoZW0gdGhlc2UgdGVy
bXMgc28gdGhleSBrbm93IHRoZWlyCisjIC1yaWdodHMuCisjIC0KKyMgLSAgV2UgcHJvdGVjdCB5
b3VyIHJpZ2h0cyB3aXRoIHR3byBzdGVwczogKDEpIGNvcHlyaWdodCB0aGUgc29mdHdhcmUsIGFu
ZAorIyAtKDIpIG9mZmVyIHlvdSB0aGlzIGxpY2Vuc2Ugd2hpY2ggZ2l2ZXMgeW91IGxlZ2FsIHBl
cm1pc3Npb24gdG8gY29weSwKKyMgLWRpc3RyaWJ1dGUgYW5kL29yIG1vZGlmeSB0aGUgc29mdHdh
cmUuCisjIC0KKyMgLSAgQWxzbywgZm9yIGVhY2ggYXV0aG9yJ3MgcHJvdGVjdGlvbiBhbmQgb3Vy
cywgd2Ugd2FudCB0byBtYWtlIGNlcnRhaW4KKyMgLXRoYXQgZXZlcnlvbmUgdW5kZXJzdGFuZHMg
dGhhdCB0aGVyZSBpcyBubyB3YXJyYW50eSBmb3IgdGhpcyBmcmVlCisjIC1zb2Z0d2FyZS4gIElm
IHRoZSBzb2Z0d2FyZSBpcyBtb2RpZmllZCBieSBzb21lb25lIGVsc2UgYW5kIHBhc3NlZCBvbiwg
d2UKKyMgLXdhbnQgaXRzIHJlY2lwaWVudHMgdG8ga25vdyB0aGF0IHdoYXQgdGhleSBoYXZlIGlz
IG5vdCB0aGUgb3JpZ2luYWwsIHNvCisjIC10aGF0IGFueSBwcm9ibGVtcyBpbnRyb2R1Y2VkIGJ5
IG90aGVycyB3aWxsIG5vdCByZWZsZWN0IG9uIHRoZSBvcmlnaW5hbAorIyAtYXV0aG9ycycgcmVw
dXRhdGlvbnMuCisjIC0KKyMgLSAgRmluYWxseSwgYW55IGZyZWUgcHJvZ3JhbSBpcyB0aHJlYXRl
bmVkIGNvbnN0YW50bHkgYnkgc29mdHdhcmUKKyMgLXBhdGVudHMuICBXZSB3aXNoIHRvIGF2b2lk
IHRoZSBkYW5nZXIgdGhhdCByZWRpc3RyaWJ1dG9ycyBvZiBhIGZyZWUKKyMgLXByb2dyYW0gd2ls
bCBpbmRpdmlkdWFsbHkgb2J0YWluIHBhdGVudCBsaWNlbnNlcywgaW4gZWZmZWN0IG1ha2luZyB0
aGUKKyMgLXByb2dyYW0gcHJvcHJpZXRhcnkuICBUbyBwcmV2ZW50IHRoaXMsIHdlIGhhdmUgbWFk
ZSBpdCBjbGVhciB0aGF0IGFueQorIyAtcGF0ZW50IG11c3QgYmUgbGljZW5zZWQgZm9yIGV2ZXJ5
b25lJ3MgZnJlZSB1c2Ugb3Igbm90IGxpY2Vuc2VkIGF0IGFsbC4KKyMgK2dyYXRpcyBvciBmb3Ig
YSBmZWUsIHlvdSBtdXN0IHBhc3Mgb24gdG8gdGhlIHJlY2lwaWVudHMgdGhlIHNhbWUKKyMgK2Zy
ZWVkb21zIHRoYXQgeW91IHJlY2VpdmVkLiAgWW91IG11c3QgbWFrZSBzdXJlIHRoYXQgdGhleSwg
dG9vLCByZWNlaXZlCisjICtvciBjYW4gZ2V0IHRoZSBzb3VyY2UgY29kZS4gIEFuZCB5b3UgbXVz
dCBzaG93IHRoZW0gdGhlc2UgdGVybXMgc28gdGhleQorIyAra25vdyB0aGVpciByaWdodHMuCisj
ICsKKyMgKyAgRGV2ZWxvcGVycyB0aGF0IHVzZSB0aGUgR05VIEdQTCBwcm90ZWN0IHlvdXIgcmln
aHRzIHdpdGggdHdvIHN0ZXBzOgorIyArKDEpIGFzc2VydCBjb3B5cmlnaHQgb24gdGhlIHNvZnR3
YXJlLCBhbmQgKDIpIG9mZmVyIHlvdSB0aGlzIExpY2Vuc2UKKyMgK2dpdmluZyB5b3UgbGVnYWwg
cGVybWlzc2lvbiB0byBjb3B5LCBkaXN0cmlidXRlIGFuZC9vciBtb2RpZnkgaXQuCisjICsKKyMg
KyAgRm9yIHRoZSBkZXZlbG9wZXJzJyBhbmQgYXV0aG9ycycgcHJvdGVjdGlvbiwgdGhlIEdQTCBj
bGVhcmx5IGV4cGxhaW5zCisjICt0aGF0IHRoZXJlIGlzIG5vIHdhcnJhbnR5IGZvciB0aGlzIGZy
ZWUgc29mdHdhcmUuICBGb3IgYm90aCB1c2VycycgYW5kCisjICthdXRob3JzJyBzYWtlLCB0aGUg
R1BMIHJlcXVpcmVzIHRoYXQgbW9kaWZpZWQgdmVyc2lvbnMgYmUgbWFya2VkIGFzCisjICtjaGFu
Z2VkLCBzbyB0aGF0IHRoZWlyIHByb2JsZW1zIHdpbGwgbm90IGJlIGF0dHJpYnV0ZWQgZXJyb25l
b3VzbHkgdG8KKyMgK2F1dGhvcnMgb2YgcHJldmlvdXMgdmVyc2lvbnMuCisjICsKKyMgKyAgU29t
ZSBkZXZpY2VzIGFyZSBkZXNpZ25lZCB0byBkZW55IHVzZXJzIGFjY2VzcyB0byBpbnN0YWxsIG9y
IHJ1bgorIyArbW9kaWZpZWQgdmVyc2lvbnMgb2YgdGhlIHNvZnR3YXJlIGluc2lkZSB0aGVtLCBh
bHRob3VnaCB0aGUgbWFudWZhY3R1cmVyCisjICtjYW4gZG8gc28uICBUaGlzIGlzIGZ1bmRhbWVu
dGFsbHkgaW5jb21wYXRpYmxlIHdpdGggdGhlIGFpbSBvZgorIyArcHJvdGVjdGluZyB1c2Vycycg
ZnJlZWRvbSB0byBjaGFuZ2UgdGhlIHNvZnR3YXJlLiAgVGhlIHN5c3RlbWF0aWMKKyMgK3BhdHRl
cm4gb2Ygc3VjaCBhYnVzZSBvY2N1cnMgaW4gdGhlIGFyZWEgb2YgcHJvZHVjdHMgZm9yIGluZGl2
aWR1YWxzIHRvCisjICt1c2UsIHdoaWNoIGlzIHByZWNpc2VseSB3aGVyZSBpdCBpcyBtb3N0IHVu
YWNjZXB0YWJsZS4gIFRoZXJlZm9yZSwgd2UKKyMgK2hhdmUgZGVzaWduZWQgdGhpcyB2ZXJzaW9u
IG9mIHRoZSBHUEwgdG8gcHJvaGliaXQgdGhlIHByYWN0aWNlIGZvciB0aG9zZQorIyArcHJvZHVj
dHMuICBJZiBzdWNoIHByb2JsZW1zIGFyaXNlIHN1YnN0YW50aWFsbHkgaW4gb3RoZXIgZG9tYWlu
cywgd2UKKyMgK3N0YW5kIHJlYWR5IHRvIGV4dGVuZCB0aGlzIHByb3Zpc2lvbiB0byB0aG9zZSBk
b21haW5zIGluIGZ1dHVyZSB2ZXJzaW9ucworIyArb2YgdGhlIEdQTCwgYXMgbmVlZGVkIHRvIHBy
b3RlY3QgdGhlIGZyZWVkb20gb2YgdXNlcnMuCisjICsKKyMgKyAgRmluYWxseSwgZXZlcnkgcHJv
Z3JhbSBpcyB0aHJlYXRlbmVkIGNvbnN0YW50bHkgYnkgc29mdHdhcmUgcGF0ZW50cy4KKyMgK1N0
YXRlcyBzaG91bGQgbm90IGFsbG93IHBhdGVudHMgdG8gcmVzdHJpY3QgZGV2ZWxvcG1lbnQgYW5k
IHVzZSBvZgorIyArc29mdHdhcmUgb24gZ2VuZXJhbC1wdXJwb3NlIGNvbXB1dGVycywgYnV0IGlu
IHRob3NlIHRoYXQgZG8sIHdlIHdpc2ggdG8KKyMgK2F2b2lkIHRoZSBzcGVjaWFsIGRhbmdlciB0
aGF0IHBhdGVudHMgYXBwbGllZCB0byBhIGZyZWUgcHJvZ3JhbSBjb3VsZAorIyArbWFrZSBpdCBl
ZmZlY3RpdmVseSBwcm9wcmlldGFyeS4gIFRvIHByZXZlbnQgdGhpcywgdGhlIEdQTCBhc3N1cmVz
IHRoYXQKKyMgK3BhdGVudHMgY2Fubm90IGJlIHVzZWQgdG8gcmVuZGVyIHRoZSBwcm9ncmFtIG5v
bi1mcmVlLgorIyAgCisjICAgIFRoZSBwcmVjaXNlIHRlcm1zIGFuZCBjb25kaXRpb25zIGZvciBj
b3B5aW5nLCBkaXN0cmlidXRpb24gYW5kCisjICBtb2RpZmljYXRpb24gZm9sbG93LgorIyAgCisj
IC0gICAgICAgICAgICAgICAgICAgIEdOVSBHRU5FUkFMIFBVQkxJQyBMSUNFTlNFCisjIC0gICBU
RVJNUyBBTkQgQ09ORElUSU9OUyBGT1IgQ09QWUlORywgRElTVFJJQlVUSU9OIEFORCBNT0RJRklD
QVRJT04KKyMgLQorIyAtICAwLiBUaGlzIExpY2Vuc2UgYXBwbGllcyB0byBhbnkgcHJvZ3JhbSBv
ciBvdGhlciB3b3JrIHdoaWNoIGNvbnRhaW5zCisjIC1hIG5vdGljZSBwbGFjZWQgYnkgdGhlIGNv
cHlyaWdodCBob2xkZXIgc2F5aW5nIGl0IG1heSBiZSBkaXN0cmlidXRlZAorIyAtdW5kZXIgdGhl
IHRlcm1zIG9mIHRoaXMgR2VuZXJhbCBQdWJsaWMgTGljZW5zZS4gIFRoZSAiUHJvZ3JhbSIsIGJl
bG93LAorIyAtcmVmZXJzIHRvIGFueSBzdWNoIHByb2dyYW0gb3Igd29yaywgYW5kIGEgIndvcmsg
YmFzZWQgb24gdGhlIFByb2dyYW0iCisjIC1tZWFucyBlaXRoZXIgdGhlIFByb2dyYW0gb3IgYW55
IGRlcml2YXRpdmUgd29yayB1bmRlciBjb3B5cmlnaHQgbGF3OgorIyAtdGhhdCBpcyB0byBzYXks
IGEgd29yayBjb250YWluaW5nIHRoZSBQcm9ncmFtIG9yIGEgcG9ydGlvbiBvZiBpdCwKKyMgLWVp
dGhlciB2ZXJiYXRpbSBvciB3aXRoIG1vZGlmaWNhdGlvbnMgYW5kL29yIHRyYW5zbGF0ZWQgaW50
byBhbm90aGVyCisjIC1sYW5ndWFnZS4gIChIZXJlaW5hZnRlciwgdHJhbnNsYXRpb24gaXMgaW5j
bHVkZWQgd2l0aG91dCBsaW1pdGF0aW9uIGluCisjIC10aGUgdGVybSAibW9kaWZpY2F0aW9uIi4p
ICBFYWNoIGxpY2Vuc2VlIGlzIGFkZHJlc3NlZCBhcyAieW91Ii4KKyMgLQorIyAtQWN0aXZpdGll
cyBvdGhlciB0aGFuIGNvcHlpbmcsIGRpc3RyaWJ1dGlvbiBhbmQgbW9kaWZpY2F0aW9uIGFyZSBu
b3QKKyMgLWNvdmVyZWQgYnkgdGhpcyBMaWNlbnNlOyB0aGV5IGFyZSBvdXRzaWRlIGl0cyBzY29w
ZS4gIFRoZSBhY3Qgb2YKKyMgLXJ1bm5pbmcgdGhlIFByb2dyYW0gaXMgbm90IHJlc3RyaWN0ZWQs
IGFuZCB0aGUgb3V0cHV0IGZyb20gdGhlIFByb2dyYW0KKyMgLWlzIGNvdmVyZWQgb25seSBpZiBp
dHMgY29udGVudHMgY29uc3RpdHV0ZSBhIHdvcmsgYmFzZWQgb24gdGhlCisjIC1Qcm9ncmFtIChp
bmRlcGVuZGVudCBvZiBoYXZpbmcgYmVlbiBtYWRlIGJ5IHJ1bm5pbmcgdGhlIFByb2dyYW0pLgor
IyAtV2hldGhlciB0aGF0IGlzIHRydWUgZGVwZW5kcyBvbiB3aGF0IHRoZSBQcm9ncmFtIGRvZXMu
CisjIC0KKyMgLSAgMS4gWW91IG1heSBjb3B5IGFuZCBkaXN0cmlidXRlIHZlcmJhdGltIGNvcGll
cyBvZiB0aGUgUHJvZ3JhbSdzCisjIC1zb3VyY2UgY29kZSBhcyB5b3UgcmVjZWl2ZSBpdCwgaW4g
YW55IG1lZGl1bSwgcHJvdmlkZWQgdGhhdCB5b3UKKyMgLWNvbnNwaWN1b3VzbHkgYW5kIGFwcHJv
cHJpYXRlbHkgcHVibGlzaCBvbiBlYWNoIGNvcHkgYW4gYXBwcm9wcmlhdGUKKyMgLWNvcHlyaWdo
dCBub3RpY2UgYW5kIGRpc2NsYWltZXIgb2Ygd2FycmFudHk7IGtlZXAgaW50YWN0IGFsbCB0aGUK
KyMgLW5vdGljZXMgdGhhdCByZWZlciB0byB0aGlzIExpY2Vuc2UgYW5kIHRvIHRoZSBhYnNlbmNl
IG9mIGFueSB3YXJyYW50eTsKKyMgLWFuZCBnaXZlIGFueSBvdGhlciByZWNpcGllbnRzIG9mIHRo
ZSBQcm9ncmFtIGEgY29weSBvZiB0aGlzIExpY2Vuc2UKKyMgLWFsb25nIHdpdGggdGhlIFByb2dy
YW0uCisjIC0KKyMgLVlvdSBtYXkgY2hhcmdlIGEgZmVlIGZvciB0aGUgcGh5c2ljYWwgYWN0IG9m
IHRyYW5zZmVycmluZyBhIGNvcHksIGFuZAorIyAteW91IG1heSBhdCB5b3VyIG9wdGlvbiBvZmZl
ciB3YXJyYW50eSBwcm90ZWN0aW9uIGluIGV4Y2hhbmdlIGZvciBhIGZlZS4KKyMgLQorIyAtICAy
LiBZb3UgbWF5IG1vZGlmeSB5b3VyIGNvcHkgb3IgY29waWVzIG9mIHRoZSBQcm9ncmFtIG9yIGFu
eSBwb3J0aW9uCisjIC1vZiBpdCwgdGh1cyBmb3JtaW5nIGEgd29yayBiYXNlZCBvbiB0aGUgUHJv
Z3JhbSwgYW5kIGNvcHkgYW5kCisjIC1kaXN0cmlidXRlIHN1Y2ggbW9kaWZpY2F0aW9ucyBvciB3
b3JrIHVuZGVyIHRoZSB0ZXJtcyBvZiBTZWN0aW9uIDEKKyMgLWFib3ZlLCBwcm92aWRlZCB0aGF0
IHlvdSBhbHNvIG1lZXQgYWxsIG9mIHRoZXNlIGNvbmRpdGlvbnM6CisjIC0KKyMgLSAgICBhKSBZ
b3UgbXVzdCBjYXVzZSB0aGUgbW9kaWZpZWQgZmlsZXMgdG8gY2FycnkgcHJvbWluZW50IG5vdGlj
ZXMKKyMgLSAgICBzdGF0aW5nIHRoYXQgeW91IGNoYW5nZWQgdGhlIGZpbGVzIGFuZCB0aGUgZGF0
ZSBvZiBhbnkgY2hhbmdlLgorIyAtCisjIC0gICAgYikgWW91IG11c3QgY2F1c2UgYW55IHdvcmsg
dGhhdCB5b3UgZGlzdHJpYnV0ZSBvciBwdWJsaXNoLCB0aGF0IGluCisjIC0gICAgd2hvbGUgb3Ig
aW4gcGFydCBjb250YWlucyBvciBpcyBkZXJpdmVkIGZyb20gdGhlIFByb2dyYW0gb3IgYW55Cisj
IC0gICAgcGFydCB0aGVyZW9mLCB0byBiZSBsaWNlbnNlZCBhcyBhIHdob2xlIGF0IG5vIGNoYXJn
ZSB0byBhbGwgdGhpcmQKKyMgLSAgICBwYXJ0aWVzIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGlzIExp
Y2Vuc2UuCisjIC0KKyMgLSAgICBjKSBJZiB0aGUgbW9kaWZpZWQgcHJvZ3JhbSBub3JtYWxseSBy
ZWFkcyBjb21tYW5kcyBpbnRlcmFjdGl2ZWx5CisjIC0gICAgd2hlbiBydW4sIHlvdSBtdXN0IGNh
dXNlIGl0LCB3aGVuIHN0YXJ0ZWQgcnVubmluZyBmb3Igc3VjaAorIyAtICAgIGludGVyYWN0aXZl
IHVzZSBpbiB0aGUgbW9zdCBvcmRpbmFyeSB3YXksIHRvIHByaW50IG9yIGRpc3BsYXkgYW4KKyMg
LSAgICBhbm5vdW5jZW1lbnQgaW5jbHVkaW5nIGFuIGFwcHJvcHJpYXRlIGNvcHlyaWdodCBub3Rp
Y2UgYW5kIGEKKyMgLSAgICBub3RpY2UgdGhhdCB0aGVyZSBpcyBubyB3YXJyYW50eSAob3IgZWxz
ZSwgc2F5aW5nIHRoYXQgeW91IHByb3ZpZGUKKyMgLSAgICBhIHdhcnJhbnR5KSBhbmQgdGhhdCB1
c2VycyBtYXkgcmVkaXN0cmlidXRlIHRoZSBwcm9ncmFtIHVuZGVyCisjIC0gICAgdGhlc2UgY29u
ZGl0aW9ucywgYW5kIHRlbGxpbmcgdGhlIHVzZXIgaG93IHRvIHZpZXcgYSBjb3B5IG9mIHRoaXMK
KyMgLSAgICBMaWNlbnNlLiAgKEV4Y2VwdGlvbjogaWYgdGhlIFByb2dyYW0gaXRzZWxmIGlzIGlu
dGVyYWN0aXZlIGJ1dAorIyAtICAgIGRvZXMgbm90IG5vcm1hbGx5IHByaW50IHN1Y2ggYW4gYW5u
b3VuY2VtZW50LCB5b3VyIHdvcmsgYmFzZWQgb24KKyMgLSAgICB0aGUgUHJvZ3JhbSBpcyBub3Qg
cmVxdWlyZWQgdG8gcHJpbnQgYW4gYW5ub3VuY2VtZW50LikKKyMgLQorIyAtVGhlc2UgcmVxdWly
ZW1lbnRzIGFwcGx5IHRvIHRoZSBtb2RpZmllZCB3b3JrIGFzIGEgd2hvbGUuICBJZgorIyAtaWRl
bnRpZmlhYmxlIHNlY3Rpb25zIG9mIHRoYXQgd29yayBhcmUgbm90IGRlcml2ZWQgZnJvbSB0aGUg
UHJvZ3JhbSwKKyMgLWFuZCBjYW4gYmUgcmVhc29uYWJseSBjb25zaWRlcmVkIGluZGVwZW5kZW50
IGFuZCBzZXBhcmF0ZSB3b3JrcyBpbgorIyAtdGhlbXNlbHZlcywgdGhlbiB0aGlzIExpY2Vuc2Us
IGFuZCBpdHMgdGVybXMsIGRvIG5vdCBhcHBseSB0byB0aG9zZQorIyAtc2VjdGlvbnMgd2hlbiB5
b3UgZGlzdHJpYnV0ZSB0aGVtIGFzIHNlcGFyYXRlIHdvcmtzLiAgQnV0IHdoZW4geW91CisjIC1k
aXN0cmlidXRlIHRoZSBzYW1lIHNlY3Rpb25zIGFzIHBhcnQgb2YgYSB3aG9sZSB3aGljaCBpcyBh
IHdvcmsgYmFzZWQKKyMgLW9uIHRoZSBQcm9ncmFtLCB0aGUgZGlzdHJpYnV0aW9uIG9mIHRoZSB3
aG9sZSBtdXN0IGJlIG9uIHRoZSB0ZXJtcyBvZgorIyAtdGhpcyBMaWNlbnNlLCB3aG9zZSBwZXJt
aXNzaW9ucyBmb3Igb3RoZXIgbGljZW5zZWVzIGV4dGVuZCB0byB0aGUKKyMgLWVudGlyZSB3aG9s
ZSwgYW5kIHRodXMgdG8gZWFjaCBhbmQgZXZlcnkgcGFydCByZWdhcmRsZXNzIG9mIHdobyB3cm90
ZSBpdC4KKyMgLQorIyAtVGh1cywgaXQgaXMgbm90IHRoZSBpbnRlbnQgb2YgdGhpcyBzZWN0aW9u
IHRvIGNsYWltIHJpZ2h0cyBvciBjb250ZXN0CisjIC15b3VyIHJpZ2h0cyB0byB3b3JrIHdyaXR0
ZW4gZW50aXJlbHkgYnkgeW91OyByYXRoZXIsIHRoZSBpbnRlbnQgaXMgdG8KKyMgLWV4ZXJjaXNl
IHRoZSByaWdodCB0byBjb250cm9sIHRoZSBkaXN0cmlidXRpb24gb2YgZGVyaXZhdGl2ZSBvcgor
IyAtY29sbGVjdGl2ZSB3b3JrcyBiYXNlZCBvbiB0aGUgUHJvZ3JhbS4KKyMgLQorIyAtSW4gYWRk
aXRpb24sIG1lcmUgYWdncmVnYXRpb24gb2YgYW5vdGhlciB3b3JrIG5vdCBiYXNlZCBvbiB0aGUg
UHJvZ3JhbQorIyAtd2l0aCB0aGUgUHJvZ3JhbSAob3Igd2l0aCBhIHdvcmsgYmFzZWQgb24gdGhl
IFByb2dyYW0pIG9uIGEgdm9sdW1lIG9mCisjIC1hIHN0b3JhZ2Ugb3IgZGlzdHJpYnV0aW9uIG1l
ZGl1bSBkb2VzIG5vdCBicmluZyB0aGUgb3RoZXIgd29yayB1bmRlcgorIyAtdGhlIHNjb3BlIG9m
IHRoaXMgTGljZW5zZS4KKyMgLQorIyAtICAzLiBZb3UgbWF5IGNvcHkgYW5kIGRpc3RyaWJ1dGUg
dGhlIFByb2dyYW0gKG9yIGEgd29yayBiYXNlZCBvbiBpdCwKKyMgLXVuZGVyIFNlY3Rpb24gMikg
aW4gb2JqZWN0IGNvZGUgb3IgZXhlY3V0YWJsZSBmb3JtIHVuZGVyIHRoZSB0ZXJtcyBvZgorIyAt
U2VjdGlvbnMgMSBhbmQgMiBhYm92ZSBwcm92aWRlZCB0aGF0IHlvdSBhbHNvIGRvIG9uZSBvZiB0
aGUgZm9sbG93aW5nOgorIyAtCisjIC0gICAgYSkgQWNjb21wYW55IGl0IHdpdGggdGhlIGNvbXBs
ZXRlIGNvcnJlc3BvbmRpbmcgbWFjaGluZS1yZWFkYWJsZQorIyAtICAgIHNvdXJjZSBjb2RlLCB3
aGljaCBtdXN0IGJlIGRpc3RyaWJ1dGVkIHVuZGVyIHRoZSB0ZXJtcyBvZiBTZWN0aW9ucworIyAt
ICAgIDEgYW5kIDIgYWJvdmUgb24gYSBtZWRpdW0gY3VzdG9tYXJpbHkgdXNlZCBmb3Igc29mdHdh
cmUgaW50ZXJjaGFuZ2U7IG9yLAorIyAtCisjIC0gICAgYikgQWNjb21wYW55IGl0IHdpdGggYSB3
cml0dGVuIG9mZmVyLCB2YWxpZCBmb3IgYXQgbGVhc3QgdGhyZWUKKyMgLSAgICB5ZWFycywgdG8g
Z2l2ZSBhbnkgdGhpcmQgcGFydHksIGZvciBhIGNoYXJnZSBubyBtb3JlIHRoYW4geW91cgorIyAt
ICAgIGNvc3Qgb2YgcGh5c2ljYWxseSBwZXJmb3JtaW5nIHNvdXJjZSBkaXN0cmlidXRpb24sIGEg
Y29tcGxldGUKKyMgLSAgICBtYWNoaW5lLXJlYWRhYmxlIGNvcHkgb2YgdGhlIGNvcnJlc3BvbmRp
bmcgc291cmNlIGNvZGUsIHRvIGJlCisjIC0gICAgZGlzdHJpYnV0ZWQgdW5kZXIgdGhlIHRlcm1z
IG9mIFNlY3Rpb25zIDEgYW5kIDIgYWJvdmUgb24gYSBtZWRpdW0KKyMgLSAgICBjdXN0b21hcmls
eSB1c2VkIGZvciBzb2Z0d2FyZSBpbnRlcmNoYW5nZTsgb3IsCisjIC0KKyMgLSAgICBjKSBBY2Nv
bXBhbnkgaXQgd2l0aCB0aGUgaW5mb3JtYXRpb24geW91IHJlY2VpdmVkIGFzIHRvIHRoZSBvZmZl
cgorIyAtICAgIHRvIGRpc3RyaWJ1dGUgY29ycmVzcG9uZGluZyBzb3VyY2UgY29kZS4gIChUaGlz
IGFsdGVybmF0aXZlIGlzCisjIC0gICAgYWxsb3dlZCBvbmx5IGZvciBub25jb21tZXJjaWFsIGRp
c3RyaWJ1dGlvbiBhbmQgb25seSBpZiB5b3UKKyMgLSAgICByZWNlaXZlZCB0aGUgcHJvZ3JhbSBp
biBvYmplY3QgY29kZSBvciBleGVjdXRhYmxlIGZvcm0gd2l0aCBzdWNoCisjIC0gICAgYW4gb2Zm
ZXIsIGluIGFjY29yZCB3aXRoIFN1YnNlY3Rpb24gYiBhYm92ZS4pCisjIC0KKyMgLVRoZSBzb3Vy
Y2UgY29kZSBmb3IgYSB3b3JrIG1lYW5zIHRoZSBwcmVmZXJyZWQgZm9ybSBvZiB0aGUgd29yayBm
b3IKKyMgLW1ha2luZyBtb2RpZmljYXRpb25zIHRvIGl0LiAgRm9yIGFuIGV4ZWN1dGFibGUgd29y
aywgY29tcGxldGUgc291cmNlCisjIC1jb2RlIG1lYW5zIGFsbCB0aGUgc291cmNlIGNvZGUgZm9y
IGFsbCBtb2R1bGVzIGl0IGNvbnRhaW5zLCBwbHVzIGFueQorIyAtYXNzb2NpYXRlZCBpbnRlcmZh
Y2UgZGVmaW5pdGlvbiBmaWxlcywgcGx1cyB0aGUgc2NyaXB0cyB1c2VkIHRvCisjIC1jb250cm9s
IGNvbXBpbGF0aW9uIGFuZCBpbnN0YWxsYXRpb24gb2YgdGhlIGV4ZWN1dGFibGUuICBIb3dldmVy
LCBhcyBhCisjIC1zcGVjaWFsIGV4Y2VwdGlvbiwgdGhlIHNvdXJjZSBjb2RlIGRpc3RyaWJ1dGVk
IG5lZWQgbm90IGluY2x1ZGUKKyMgLWFueXRoaW5nIHRoYXQgaXMgbm9ybWFsbHkgZGlzdHJpYnV0
ZWQgKGluIGVpdGhlciBzb3VyY2Ugb3IgYmluYXJ5CisjIC1mb3JtKSB3aXRoIHRoZSBtYWpvciBj
b21wb25lbnRzIChjb21waWxlciwga2VybmVsLCBhbmQgc28gb24pIG9mIHRoZQorIyAtb3BlcmF0
aW5nIHN5c3RlbSBvbiB3aGljaCB0aGUgZXhlY3V0YWJsZSBydW5zLCB1bmxlc3MgdGhhdCBjb21w
b25lbnQKKyMgLWl0c2VsZiBhY2NvbXBhbmllcyB0aGUgZXhlY3V0YWJsZS4KKyMgLQorIyAtSWYg
ZGlzdHJpYnV0aW9uIG9mIGV4ZWN1dGFibGUgb3Igb2JqZWN0IGNvZGUgaXMgbWFkZSBieSBvZmZl
cmluZworIyAtYWNjZXNzIHRvIGNvcHkgZnJvbSBhIGRlc2lnbmF0ZWQgcGxhY2UsIHRoZW4gb2Zm
ZXJpbmcgZXF1aXZhbGVudAorIyAtYWNjZXNzIHRvIGNvcHkgdGhlIHNvdXJjZSBjb2RlIGZyb20g
dGhlIHNhbWUgcGxhY2UgY291bnRzIGFzCisjIC1kaXN0cmlidXRpb24gb2YgdGhlIHNvdXJjZSBj
b2RlLCBldmVuIHRob3VnaCB0aGlyZCBwYXJ0aWVzIGFyZSBub3QKKyMgLWNvbXBlbGxlZCB0byBj
b3B5IHRoZSBzb3VyY2UgYWxvbmcgd2l0aCB0aGUgb2JqZWN0IGNvZGUuCisjIC0KKyMgLSAgNC4g
WW91IG1heSBub3QgY29weSwgbW9kaWZ5LCBzdWJsaWNlbnNlLCBvciBkaXN0cmlidXRlIHRoZSBQ
cm9ncmFtCisjIC1leGNlcHQgYXMgZXhwcmVzc2x5IHByb3ZpZGVkIHVuZGVyIHRoaXMgTGljZW5z
ZS4gIEFueSBhdHRlbXB0CisjIC1vdGhlcndpc2UgdG8gY29weSwgbW9kaWZ5LCBzdWJsaWNlbnNl
IG9yIGRpc3RyaWJ1dGUgdGhlIFByb2dyYW0gaXMKKyMgLXZvaWQsIGFuZCB3aWxsIGF1dG9tYXRp
Y2FsbHkgdGVybWluYXRlIHlvdXIgcmlnaHRzIHVuZGVyIHRoaXMgTGljZW5zZS4KKyMgLUhvd2V2
ZXIsIHBhcnRpZXMgd2hvIGhhdmUgcmVjZWl2ZWQgY29waWVzLCBvciByaWdodHMsIGZyb20geW91
IHVuZGVyCisjIC10aGlzIExpY2Vuc2Ugd2lsbCBub3QgaGF2ZSB0aGVpciBsaWNlbnNlcyB0ZXJt
aW5hdGVkIHNvIGxvbmcgYXMgc3VjaAorIyAtcGFydGllcyByZW1haW4gaW4gZnVsbCBjb21wbGlh
bmNlLgorIyAtCisjIC0gIDUuIFlvdSBhcmUgbm90IHJlcXVpcmVkIHRvIGFjY2VwdCB0aGlzIExp
Y2Vuc2UsIHNpbmNlIHlvdSBoYXZlIG5vdAorIyAtc2lnbmVkIGl0LiAgSG93ZXZlciwgbm90aGlu
ZyBlbHNlIGdyYW50cyB5b3UgcGVybWlzc2lvbiB0byBtb2RpZnkgb3IKKyMgLWRpc3RyaWJ1dGUg
dGhlIFByb2dyYW0gb3IgaXRzIGRlcml2YXRpdmUgd29ya3MuICBUaGVzZSBhY3Rpb25zIGFyZQor
IyAtcHJvaGliaXRlZCBieSBsYXcgaWYgeW91IGRvIG5vdCBhY2NlcHQgdGhpcyBMaWNlbnNlLiAg
VGhlcmVmb3JlLCBieQorIyAtbW9kaWZ5aW5nIG9yIGRpc3RyaWJ1dGluZyB0aGUgUHJvZ3JhbSAo
b3IgYW55IHdvcmsgYmFzZWQgb24gdGhlCisjIC1Qcm9ncmFtKSwgeW91IGluZGljYXRlIHlvdXIg
YWNjZXB0YW5jZSBvZiB0aGlzIExpY2Vuc2UgdG8gZG8gc28sIGFuZAorIyAtYWxsIGl0cyB0ZXJt
cyBhbmQgY29uZGl0aW9ucyBmb3IgY29weWluZywgZGlzdHJpYnV0aW5nIG9yIG1vZGlmeWluZwor
IyAtdGhlIFByb2dyYW0gb3Igd29ya3MgYmFzZWQgb24gaXQuCisjIC0KKyMgLSAgNi4gRWFjaCB0
aW1lIHlvdSByZWRpc3RyaWJ1dGUgdGhlIFByb2dyYW0gKG9yIGFueSB3b3JrIGJhc2VkIG9uIHRo
ZQorIyAtUHJvZ3JhbSksIHRoZSByZWNpcGllbnQgYXV0b21hdGljYWxseSByZWNlaXZlcyBhIGxp
Y2Vuc2UgZnJvbSB0aGUKKyMgLW9yaWdpbmFsIGxpY2Vuc29yIHRvIGNvcHksIGRpc3RyaWJ1dGUg
b3IgbW9kaWZ5IHRoZSBQcm9ncmFtIHN1YmplY3QgdG8KKyMgLXRoZXNlIHRlcm1zIGFuZCBjb25k
aXRpb25zLiAgWW91IG1heSBub3QgaW1wb3NlIGFueSBmdXJ0aGVyCisjIC1yZXN0cmljdGlvbnMg
b24gdGhlIHJlY2lwaWVudHMnIGV4ZXJjaXNlIG9mIHRoZSByaWdodHMgZ3JhbnRlZCBoZXJlaW4u
CisjIC1Zb3UgYXJlIG5vdCByZXNwb25zaWJsZSBmb3IgZW5mb3JjaW5nIGNvbXBsaWFuY2UgYnkg
dGhpcmQgcGFydGllcyB0bworIyArICAgICAgICAgICAgICAgICAgICAgICBURVJNUyBBTkQgQ09O
RElUSU9OUworIyArCisjICsgIDAuIERlZmluaXRpb25zLgorIyArCisjICsgICJUaGlzIExpY2Vu
c2UiIHJlZmVycyB0byB2ZXJzaW9uIDMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
LgorIyArCisjICsgICJDb3B5cmlnaHQiIGFsc28gbWVhbnMgY29weXJpZ2h0LWxpa2UgbGF3cyB0
aGF0IGFwcGx5IHRvIG90aGVyIGtpbmRzIG9mCisjICt3b3Jrcywgc3VjaCBhcyBzZW1pY29uZHVj
dG9yIG1hc2tzLgorIyArCisjICsgICJUaGUgUHJvZ3JhbSIgcmVmZXJzIHRvIGFueSBjb3B5cmln
aHRhYmxlIHdvcmsgbGljZW5zZWQgdW5kZXIgdGhpcworIyArTGljZW5zZS4gIEVhY2ggbGljZW5z
ZWUgaXMgYWRkcmVzc2VkIGFzICJ5b3UiLiAgIkxpY2Vuc2VlcyIgYW5kCisjICsicmVjaXBpZW50
cyIgbWF5IGJlIGluZGl2aWR1YWxzIG9yIG9yZ2FuaXphdGlvbnMuCisjICsKKyMgKyAgVG8gIm1v
ZGlmeSIgYSB3b3JrIG1lYW5zIHRvIGNvcHkgZnJvbSBvciBhZGFwdCBhbGwgb3IgcGFydCBvZiB0
aGUgd29yaworIyAraW4gYSBmYXNoaW9uIHJlcXVpcmluZyBjb3B5cmlnaHQgcGVybWlzc2lvbiwg
b3RoZXIgdGhhbiB0aGUgbWFraW5nIG9mIGFuCisjICtleGFjdCBjb3B5LiAgVGhlIHJlc3VsdGlu
ZyB3b3JrIGlzIGNhbGxlZCBhICJtb2RpZmllZCB2ZXJzaW9uIiBvZiB0aGUKKyMgK2VhcmxpZXIg
d29yayBvciBhIHdvcmsgImJhc2VkIG9uIiB0aGUgZWFybGllciB3b3JrLgorIyArCisjICsgIEEg
ImNvdmVyZWQgd29yayIgbWVhbnMgZWl0aGVyIHRoZSB1bm1vZGlmaWVkIFByb2dyYW0gb3IgYSB3
b3JrIGJhc2VkCisjICtvbiB0aGUgUHJvZ3JhbS4KKyMgKworIyArICBUbyAicHJvcGFnYXRlIiBh
IHdvcmsgbWVhbnMgdG8gZG8gYW55dGhpbmcgd2l0aCBpdCB0aGF0LCB3aXRob3V0CisjICtwZXJt
aXNzaW9uLCB3b3VsZCBtYWtlIHlvdSBkaXJlY3RseSBvciBzZWNvbmRhcmlseSBsaWFibGUgZm9y
CisjICtpbmZyaW5nZW1lbnQgdW5kZXIgYXBwbGljYWJsZSBjb3B5cmlnaHQgbGF3LCBleGNlcHQg
ZXhlY3V0aW5nIGl0IG9uIGEKKyMgK2NvbXB1dGVyIG9yIG1vZGlmeWluZyBhIHByaXZhdGUgY29w
eS4gIFByb3BhZ2F0aW9uIGluY2x1ZGVzIGNvcHlpbmcsCisjICtkaXN0cmlidXRpb24gKHdpdGgg
b3Igd2l0aG91dCBtb2RpZmljYXRpb24pLCBtYWtpbmcgYXZhaWxhYmxlIHRvIHRoZQorIyArcHVi
bGljLCBhbmQgaW4gc29tZSBjb3VudHJpZXMgb3RoZXIgYWN0aXZpdGllcyBhcyB3ZWxsLgorIyAr
CisjICsgIFRvICJjb252ZXkiIGEgd29yayBtZWFucyBhbnkga2luZCBvZiBwcm9wYWdhdGlvbiB0
aGF0IGVuYWJsZXMgb3RoZXIKKyMgK3BhcnRpZXMgdG8gbWFrZSBvciByZWNlaXZlIGNvcGllcy4g
IE1lcmUgaW50ZXJhY3Rpb24gd2l0aCBhIHVzZXIgdGhyb3VnaAorIyArYSBjb21wdXRlciBuZXR3
b3JrLCB3aXRoIG5vIHRyYW5zZmVyIG9mIGEgY29weSwgaXMgbm90IGNvbnZleWluZy4KKyMgKwor
IyArICBBbiBpbnRlcmFjdGl2ZSB1c2VyIGludGVyZmFjZSBkaXNwbGF5cyAiQXBwcm9wcmlhdGUg
TGVnYWwgTm90aWNlcyIKKyMgK3RvIHRoZSBleHRlbnQgdGhhdCBpdCBpbmNsdWRlcyBhIGNvbnZl
bmllbnQgYW5kIHByb21pbmVudGx5IHZpc2libGUKKyMgK2ZlYXR1cmUgdGhhdCAoMSkgZGlzcGxh
eXMgYW4gYXBwcm9wcmlhdGUgY29weXJpZ2h0IG5vdGljZSwgYW5kICgyKQorIyArdGVsbHMgdGhl
IHVzZXIgdGhhdCB0aGVyZSBpcyBubyB3YXJyYW50eSBmb3IgdGhlIHdvcmsgKGV4Y2VwdCB0byB0
aGUKKyMgK2V4dGVudCB0aGF0IHdhcnJhbnRpZXMgYXJlIHByb3ZpZGVkKSwgdGhhdCBsaWNlbnNl
ZXMgbWF5IGNvbnZleSB0aGUKKyMgK3dvcmsgdW5kZXIgdGhpcyBMaWNlbnNlLCBhbmQgaG93IHRv
IHZpZXcgYSBjb3B5IG9mIHRoaXMgTGljZW5zZS4gIElmCisjICt0aGUgaW50ZXJmYWNlIHByZXNl
bnRzIGEgbGlzdCBvZiB1c2VyIGNvbW1hbmRzIG9yIG9wdGlvbnMsIHN1Y2ggYXMgYQorIyArbWVu
dSwgYSBwcm9taW5lbnQgaXRlbSBpbiB0aGUgbGlzdCBtZWV0cyB0aGlzIGNyaXRlcmlvbi4KKyMg
KworIyArICAxLiBTb3VyY2UgQ29kZS4KKyMgKworIyArICBUaGUgInNvdXJjZSBjb2RlIiBmb3Ig
YSB3b3JrIG1lYW5zIHRoZSBwcmVmZXJyZWQgZm9ybSBvZiB0aGUgd29yaworIyArZm9yIG1ha2lu
ZyBtb2RpZmljYXRpb25zIHRvIGl0LiAgIk9iamVjdCBjb2RlIiBtZWFucyBhbnkgbm9uLXNvdXJj
ZQorIyArZm9ybSBvZiBhIHdvcmsuCisjICsKKyMgKyAgQSAiU3RhbmRhcmQgSW50ZXJmYWNlIiBt
ZWFucyBhbiBpbnRlcmZhY2UgdGhhdCBlaXRoZXIgaXMgYW4gb2ZmaWNpYWwKKyMgK3N0YW5kYXJk
IGRlZmluZWQgYnkgYSByZWNvZ25pemVkIHN0YW5kYXJkcyBib2R5LCBvciwgaW4gdGhlIGNhc2Ug
b2YKKyMgK2ludGVyZmFjZXMgc3BlY2lmaWVkIGZvciBhIHBhcnRpY3VsYXIgcHJvZ3JhbW1pbmcg
bGFuZ3VhZ2UsIG9uZSB0aGF0CisjICtpcyB3aWRlbHkgdXNlZCBhbW9uZyBkZXZlbG9wZXJzIHdv
cmtpbmcgaW4gdGhhdCBsYW5ndWFnZS4KKyMgKworIyArICBUaGUgIlN5c3RlbSBMaWJyYXJpZXMi
IG9mIGFuIGV4ZWN1dGFibGUgd29yayBpbmNsdWRlIGFueXRoaW5nLCBvdGhlcgorIyArdGhhbiB0
aGUgd29yayBhcyBhIHdob2xlLCB0aGF0IChhKSBpcyBpbmNsdWRlZCBpbiB0aGUgbm9ybWFsIGZv
cm0gb2YKKyMgK3BhY2thZ2luZyBhIE1ham9yIENvbXBvbmVudCwgYnV0IHdoaWNoIGlzIG5vdCBw
YXJ0IG9mIHRoYXQgTWFqb3IKKyMgK0NvbXBvbmVudCwgYW5kIChiKSBzZXJ2ZXMgb25seSB0byBl
bmFibGUgdXNlIG9mIHRoZSB3b3JrIHdpdGggdGhhdAorIyArTWFqb3IgQ29tcG9uZW50LCBvciB0
byBpbXBsZW1lbnQgYSBTdGFuZGFyZCBJbnRlcmZhY2UgZm9yIHdoaWNoIGFuCisjICtpbXBsZW1l
bnRhdGlvbiBpcyBhdmFpbGFibGUgdG8gdGhlIHB1YmxpYyBpbiBzb3VyY2UgY29kZSBmb3JtLiAg
QQorIyArIk1ham9yIENvbXBvbmVudCIsIGluIHRoaXMgY29udGV4dCwgbWVhbnMgYSBtYWpvciBl
c3NlbnRpYWwgY29tcG9uZW50CisjICsoa2VybmVsLCB3aW5kb3cgc3lzdGVtLCBhbmQgc28gb24p
IG9mIHRoZSBzcGVjaWZpYyBvcGVyYXRpbmcgc3lzdGVtCisjICsoaWYgYW55KSBvbiB3aGljaCB0
aGUgZXhlY3V0YWJsZSB3b3JrIHJ1bnMsIG9yIGEgY29tcGlsZXIgdXNlZCB0bworIyArcHJvZHVj
ZSB0aGUgd29yaywgb3IgYW4gb2JqZWN0IGNvZGUgaW50ZXJwcmV0ZXIgdXNlZCB0byBydW4gaXQu
CisjICsKKyMgKyAgVGhlICJDb3JyZXNwb25kaW5nIFNvdXJjZSIgZm9yIGEgd29yayBpbiBvYmpl
Y3QgY29kZSBmb3JtIG1lYW5zIGFsbAorIyArdGhlIHNvdXJjZSBjb2RlIG5lZWRlZCB0byBnZW5l
cmF0ZSwgaW5zdGFsbCwgYW5kIChmb3IgYW4gZXhlY3V0YWJsZQorIyArd29yaykgcnVuIHRoZSBv
YmplY3QgY29kZSBhbmQgdG8gbW9kaWZ5IHRoZSB3b3JrLCBpbmNsdWRpbmcgc2NyaXB0cyB0bwor
IyArY29udHJvbCB0aG9zZSBhY3Rpdml0aWVzLiAgSG93ZXZlciwgaXQgZG9lcyBub3QgaW5jbHVk
ZSB0aGUgd29yaydzCisjICtTeXN0ZW0gTGlicmFyaWVzLCBvciBnZW5lcmFsLXB1cnBvc2UgdG9v
bHMgb3IgZ2VuZXJhbGx5IGF2YWlsYWJsZSBmcmVlCisjICtwcm9ncmFtcyB3aGljaCBhcmUgdXNl
ZCB1bm1vZGlmaWVkIGluIHBlcmZvcm1pbmcgdGhvc2UgYWN0aXZpdGllcyBidXQKKyMgK3doaWNo
IGFyZSBub3QgcGFydCBvZiB0aGUgd29yay4gIEZvciBleGFtcGxlLCBDb3JyZXNwb25kaW5nIFNv
dXJjZQorIyAraW5jbHVkZXMgaW50ZXJmYWNlIGRlZmluaXRpb24gZmlsZXMgYXNzb2NpYXRlZCB3
aXRoIHNvdXJjZSBmaWxlcyBmb3IKKyMgK3RoZSB3b3JrLCBhbmQgdGhlIHNvdXJjZSBjb2RlIGZv
ciBzaGFyZWQgbGlicmFyaWVzIGFuZCBkeW5hbWljYWxseQorIyArbGlua2VkIHN1YnByb2dyYW1z
IHRoYXQgdGhlIHdvcmsgaXMgc3BlY2lmaWNhbGx5IGRlc2lnbmVkIHRvIHJlcXVpcmUsCisjICtz
dWNoIGFzIGJ5IGludGltYXRlIGRhdGEgY29tbXVuaWNhdGlvbiBvciBjb250cm9sIGZsb3cgYmV0
d2VlbiB0aG9zZQorIyArc3VicHJvZ3JhbXMgYW5kIG90aGVyIHBhcnRzIG9mIHRoZSB3b3JrLgor
IyArCisjICsgIFRoZSBDb3JyZXNwb25kaW5nIFNvdXJjZSBuZWVkIG5vdCBpbmNsdWRlIGFueXRo
aW5nIHRoYXQgdXNlcnMKKyMgK2NhbiByZWdlbmVyYXRlIGF1dG9tYXRpY2FsbHkgZnJvbSBvdGhl
ciBwYXJ0cyBvZiB0aGUgQ29ycmVzcG9uZGluZworIyArU291cmNlLgorIyArCisjICsgIFRoZSBD
b3JyZXNwb25kaW5nIFNvdXJjZSBmb3IgYSB3b3JrIGluIHNvdXJjZSBjb2RlIGZvcm0gaXMgdGhh
dAorIyArc2FtZSB3b3JrLgorIyArCisjICsgIDIuIEJhc2ljIFBlcm1pc3Npb25zLgorIyArCisj
ICsgIEFsbCByaWdodHMgZ3JhbnRlZCB1bmRlciB0aGlzIExpY2Vuc2UgYXJlIGdyYW50ZWQgZm9y
IHRoZSB0ZXJtIG9mCisjICtjb3B5cmlnaHQgb24gdGhlIFByb2dyYW0sIGFuZCBhcmUgaXJyZXZv
Y2FibGUgcHJvdmlkZWQgdGhlIHN0YXRlZAorIyArY29uZGl0aW9ucyBhcmUgbWV0LiAgVGhpcyBM
aWNlbnNlIGV4cGxpY2l0bHkgYWZmaXJtcyB5b3VyIHVubGltaXRlZAorIyArcGVybWlzc2lvbiB0
byBydW4gdGhlIHVubW9kaWZpZWQgUHJvZ3JhbS4gIFRoZSBvdXRwdXQgZnJvbSBydW5uaW5nIGEK
KyMgK2NvdmVyZWQgd29yayBpcyBjb3ZlcmVkIGJ5IHRoaXMgTGljZW5zZSBvbmx5IGlmIHRoZSBv
dXRwdXQsIGdpdmVuIGl0cworIyArY29udGVudCwgY29uc3RpdHV0ZXMgYSBjb3ZlcmVkIHdvcmsu
ICBUaGlzIExpY2Vuc2UgYWNrbm93bGVkZ2VzIHlvdXIKKyMgK3JpZ2h0cyBvZiBmYWlyIHVzZSBv
ciBvdGhlciBlcXVpdmFsZW50LCBhcyBwcm92aWRlZCBieSBjb3B5cmlnaHQgbGF3LgorIyArCisj
ICsgIFlvdSBtYXkgbWFrZSwgcnVuIGFuZCBwcm9wYWdhdGUgY292ZXJlZCB3b3JrcyB0aGF0IHlv
dSBkbyBub3QKKyMgK2NvbnZleSwgd2l0aG91dCBjb25kaXRpb25zIHNvIGxvbmcgYXMgeW91ciBs
aWNlbnNlIG90aGVyd2lzZSByZW1haW5zCisjICtpbiBmb3JjZS4gIFlvdSBtYXkgY29udmV5IGNv
dmVyZWQgd29ya3MgdG8gb3RoZXJzIGZvciB0aGUgc29sZSBwdXJwb3NlCisjICtvZiBoYXZpbmcg
dGhlbSBtYWtlIG1vZGlmaWNhdGlvbnMgZXhjbHVzaXZlbHkgZm9yIHlvdSwgb3IgcHJvdmlkZSB5
b3UKKyMgK3dpdGggZmFjaWxpdGllcyBmb3IgcnVubmluZyB0aG9zZSB3b3JrcywgcHJvdmlkZWQg
dGhhdCB5b3UgY29tcGx5IHdpdGgKKyMgK3RoZSB0ZXJtcyBvZiB0aGlzIExpY2Vuc2UgaW4gY29u
dmV5aW5nIGFsbCBtYXRlcmlhbCBmb3Igd2hpY2ggeW91IGRvCisjICtub3QgY29udHJvbCBjb3B5
cmlnaHQuICBUaG9zZSB0aHVzIG1ha2luZyBvciBydW5uaW5nIHRoZSBjb3ZlcmVkIHdvcmtzCisj
ICtmb3IgeW91IG11c3QgZG8gc28gZXhjbHVzaXZlbHkgb24geW91ciBiZWhhbGYsIHVuZGVyIHlv
dXIgZGlyZWN0aW9uCisjICthbmQgY29udHJvbCwgb24gdGVybXMgdGhhdCBwcm9oaWJpdCB0aGVt
IGZyb20gbWFraW5nIGFueSBjb3BpZXMgb2YKKyMgK3lvdXIgY29weXJpZ2h0ZWQgbWF0ZXJpYWwg
b3V0c2lkZSB0aGVpciByZWxhdGlvbnNoaXAgd2l0aCB5b3UuCisjICsKKyMgKyAgQ29udmV5aW5n
IHVuZGVyIGFueSBvdGhlciBjaXJjdW1zdGFuY2VzIGlzIHBlcm1pdHRlZCBzb2xlbHkgdW5kZXIK
KyMgK3RoZSBjb25kaXRpb25zIHN0YXRlZCBiZWxvdy4gIFN1YmxpY2Vuc2luZyBpcyBub3QgYWxs
b3dlZDsgc2VjdGlvbiAxMAorIyArbWFrZXMgaXQgdW5uZWNlc3NhcnkuCisjICsKKyMgKyAgMy4g
UHJvdGVjdGluZyBVc2VycycgTGVnYWwgUmlnaHRzIEZyb20gQW50aS1DaXJjdW12ZW50aW9uIExh
dy4KKyMgKworIyArICBObyBjb3ZlcmVkIHdvcmsgc2hhbGwgYmUgZGVlbWVkIHBhcnQgb2YgYW4g
ZWZmZWN0aXZlIHRlY2hub2xvZ2ljYWwKKyMgK21lYXN1cmUgdW5kZXIgYW55IGFwcGxpY2FibGUg
bGF3IGZ1bGZpbGxpbmcgb2JsaWdhdGlvbnMgdW5kZXIgYXJ0aWNsZQorIyArMTEgb2YgdGhlIFdJ
UE8gY29weXJpZ2h0IHRyZWF0eSBhZG9wdGVkIG9uIDIwIERlY2VtYmVyIDE5OTYsIG9yCisjICtz
aW1pbGFyIGxhd3MgcHJvaGliaXRpbmcgb3IgcmVzdHJpY3RpbmcgY2lyY3VtdmVudGlvbiBvZiBz
dWNoCisjICttZWFzdXJlcy4KKyMgKworIyArICBXaGVuIHlvdSBjb252ZXkgYSBjb3ZlcmVkIHdv
cmssIHlvdSB3YWl2ZSBhbnkgbGVnYWwgcG93ZXIgdG8gZm9yYmlkCisjICtjaXJjdW12ZW50aW9u
IG9mIHRlY2hub2xvZ2ljYWwgbWVhc3VyZXMgdG8gdGhlIGV4dGVudCBzdWNoIGNpcmN1bXZlbnRp
b24KKyMgK2lzIGVmZmVjdGVkIGJ5IGV4ZXJjaXNpbmcgcmlnaHRzIHVuZGVyIHRoaXMgTGljZW5z
ZSB3aXRoIHJlc3BlY3QgdG8KKyMgK3RoZSBjb3ZlcmVkIHdvcmssIGFuZCB5b3UgZGlzY2xhaW0g
YW55IGludGVudGlvbiB0byBsaW1pdCBvcGVyYXRpb24gb3IKKyMgK21vZGlmaWNhdGlvbiBvZiB0
aGUgd29yayBhcyBhIG1lYW5zIG9mIGVuZm9yY2luZywgYWdhaW5zdCB0aGUgd29yaydzCisjICt1
c2VycywgeW91ciBvciB0aGlyZCBwYXJ0aWVzJyBsZWdhbCByaWdodHMgdG8gZm9yYmlkIGNpcmN1
bXZlbnRpb24gb2YKKyMgK3RlY2hub2xvZ2ljYWwgbWVhc3VyZXMuCisjICsKKyMgKyAgNC4gQ29u
dmV5aW5nIFZlcmJhdGltIENvcGllcy4KKyMgKworIyArICBZb3UgbWF5IGNvbnZleSB2ZXJiYXRp
bSBjb3BpZXMgb2YgdGhlIFByb2dyYW0ncyBzb3VyY2UgY29kZSBhcyB5b3UKKyMgK3JlY2VpdmUg
aXQsIGluIGFueSBtZWRpdW0sIHByb3ZpZGVkIHRoYXQgeW91IGNvbnNwaWN1b3VzbHkgYW5kCisj
ICthcHByb3ByaWF0ZWx5IHB1Ymxpc2ggb24gZWFjaCBjb3B5IGFuIGFwcHJvcHJpYXRlIGNvcHly
aWdodCBub3RpY2U7CisjICtrZWVwIGludGFjdCBhbGwgbm90aWNlcyBzdGF0aW5nIHRoYXQgdGhp
cyBMaWNlbnNlIGFuZCBhbnkKKyMgK25vbi1wZXJtaXNzaXZlIHRlcm1zIGFkZGVkIGluIGFjY29y
ZCB3aXRoIHNlY3Rpb24gNyBhcHBseSB0byB0aGUgY29kZTsKKyMgK2tlZXAgaW50YWN0IGFsbCBu
b3RpY2VzIG9mIHRoZSBhYnNlbmNlIG9mIGFueSB3YXJyYW50eTsgYW5kIGdpdmUgYWxsCisjICty
ZWNpcGllbnRzIGEgY29weSBvZiB0aGlzIExpY2Vuc2UgYWxvbmcgd2l0aCB0aGUgUHJvZ3JhbS4K
KyMgKworIyArICBZb3UgbWF5IGNoYXJnZSBhbnkgcHJpY2Ugb3Igbm8gcHJpY2UgZm9yIGVhY2gg
Y29weSB0aGF0IHlvdSBjb252ZXksCisjICthbmQgeW91IG1heSBvZmZlciBzdXBwb3J0IG9yIHdh
cnJhbnR5IHByb3RlY3Rpb24gZm9yIGEgZmVlLgorIyArCisjICsgIDUuIENvbnZleWluZyBNb2Rp
ZmllZCBTb3VyY2UgVmVyc2lvbnMuCisjICsKKyMgKyAgWW91IG1heSBjb252ZXkgYSB3b3JrIGJh
c2VkIG9uIHRoZSBQcm9ncmFtLCBvciB0aGUgbW9kaWZpY2F0aW9ucyB0bworIyArcHJvZHVjZSBp
dCBmcm9tIHRoZSBQcm9ncmFtLCBpbiB0aGUgZm9ybSBvZiBzb3VyY2UgY29kZSB1bmRlciB0aGUK
KyMgK3Rlcm1zIG9mIHNlY3Rpb24gNCwgcHJvdmlkZWQgdGhhdCB5b3UgYWxzbyBtZWV0IGFsbCBv
ZiB0aGVzZSBjb25kaXRpb25zOgorIyArCisjICsgICAgYSkgVGhlIHdvcmsgbXVzdCBjYXJyeSBw
cm9taW5lbnQgbm90aWNlcyBzdGF0aW5nIHRoYXQgeW91IG1vZGlmaWVkCisjICsgICAgaXQsIGFu
ZCBnaXZpbmcgYSByZWxldmFudCBkYXRlLgorIyArCisjICsgICAgYikgVGhlIHdvcmsgbXVzdCBj
YXJyeSBwcm9taW5lbnQgbm90aWNlcyBzdGF0aW5nIHRoYXQgaXQgaXMKKyMgKyAgICByZWxlYXNl
ZCB1bmRlciB0aGlzIExpY2Vuc2UgYW5kIGFueSBjb25kaXRpb25zIGFkZGVkIHVuZGVyIHNlY3Rp
b24KKyMgKyAgICA3LiAgVGhpcyByZXF1aXJlbWVudCBtb2RpZmllcyB0aGUgcmVxdWlyZW1lbnQg
aW4gc2VjdGlvbiA0IHRvCisjICsgICAgImtlZXAgaW50YWN0IGFsbCBub3RpY2VzIi4KKyMgKwor
IyArICAgIGMpIFlvdSBtdXN0IGxpY2Vuc2UgdGhlIGVudGlyZSB3b3JrLCBhcyBhIHdob2xlLCB1
bmRlciB0aGlzCisjICsgICAgTGljZW5zZSB0byBhbnlvbmUgd2hvIGNvbWVzIGludG8gcG9zc2Vz
c2lvbiBvZiBhIGNvcHkuICBUaGlzCisjICsgICAgTGljZW5zZSB3aWxsIHRoZXJlZm9yZSBhcHBs
eSwgYWxvbmcgd2l0aCBhbnkgYXBwbGljYWJsZSBzZWN0aW9uIDcKKyMgKyAgICBhZGRpdGlvbmFs
IHRlcm1zLCB0byB0aGUgd2hvbGUgb2YgdGhlIHdvcmssIGFuZCBhbGwgaXRzIHBhcnRzLAorIyAr
ICAgIHJlZ2FyZGxlc3Mgb2YgaG93IHRoZXkgYXJlIHBhY2thZ2VkLiAgVGhpcyBMaWNlbnNlIGdp
dmVzIG5vCisjICsgICAgcGVybWlzc2lvbiB0byBsaWNlbnNlIHRoZSB3b3JrIGluIGFueSBvdGhl
ciB3YXksIGJ1dCBpdCBkb2VzIG5vdAorIyArICAgIGludmFsaWRhdGUgc3VjaCBwZXJtaXNzaW9u
IGlmIHlvdSBoYXZlIHNlcGFyYXRlbHkgcmVjZWl2ZWQgaXQuCisjICsKKyMgKyAgICBkKSBJZiB0
aGUgd29yayBoYXMgaW50ZXJhY3RpdmUgdXNlciBpbnRlcmZhY2VzLCBlYWNoIG11c3QgZGlzcGxh
eQorIyArICAgIEFwcHJvcHJpYXRlIExlZ2FsIE5vdGljZXM7IGhvd2V2ZXIsIGlmIHRoZSBQcm9n
cmFtIGhhcyBpbnRlcmFjdGl2ZQorIyArICAgIGludGVyZmFjZXMgdGhhdCBkbyBub3QgZGlzcGxh
eSBBcHByb3ByaWF0ZSBMZWdhbCBOb3RpY2VzLCB5b3VyCisjICsgICAgd29yayBuZWVkIG5vdCBt
YWtlIHRoZW0gZG8gc28uCisjICsKKyMgKyAgQSBjb21waWxhdGlvbiBvZiBhIGNvdmVyZWQgd29y
ayB3aXRoIG90aGVyIHNlcGFyYXRlIGFuZCBpbmRlcGVuZGVudAorIyArd29ya3MsIHdoaWNoIGFy
ZSBub3QgYnkgdGhlaXIgbmF0dXJlIGV4dGVuc2lvbnMgb2YgdGhlIGNvdmVyZWQgd29yaywKKyMg
K2FuZCB3aGljaCBhcmUgbm90IGNvbWJpbmVkIHdpdGggaXQgc3VjaCBhcyB0byBmb3JtIGEgbGFy
Z2VyIHByb2dyYW0sCisjICtpbiBvciBvbiBhIHZvbHVtZSBvZiBhIHN0b3JhZ2Ugb3IgZGlzdHJp
YnV0aW9uIG1lZGl1bSwgaXMgY2FsbGVkIGFuCisjICsiYWdncmVnYXRlIiBpZiB0aGUgY29tcGls
YXRpb24gYW5kIGl0cyByZXN1bHRpbmcgY29weXJpZ2h0IGFyZSBub3QKKyMgK3VzZWQgdG8gbGlt
aXQgdGhlIGFjY2VzcyBvciBsZWdhbCByaWdodHMgb2YgdGhlIGNvbXBpbGF0aW9uJ3MgdXNlcnMK
KyMgK2JleW9uZCB3aGF0IHRoZSBpbmRpdmlkdWFsIHdvcmtzIHBlcm1pdC4gIEluY2x1c2lvbiBv
ZiBhIGNvdmVyZWQgd29yaworIyAraW4gYW4gYWdncmVnYXRlIGRvZXMgbm90IGNhdXNlIHRoaXMg
TGljZW5zZSB0byBhcHBseSB0byB0aGUgb3RoZXIKKyMgK3BhcnRzIG9mIHRoZSBhZ2dyZWdhdGUu
CisjICsKKyMgKyAgNi4gQ29udmV5aW5nIE5vbi1Tb3VyY2UgRm9ybXMuCisjICsKKyMgKyAgWW91
IG1heSBjb252ZXkgYSBjb3ZlcmVkIHdvcmsgaW4gb2JqZWN0IGNvZGUgZm9ybSB1bmRlciB0aGUg
dGVybXMKKyMgK29mIHNlY3Rpb25zIDQgYW5kIDUsIHByb3ZpZGVkIHRoYXQgeW91IGFsc28gY29u
dmV5IHRoZQorIyArbWFjaGluZS1yZWFkYWJsZSBDb3JyZXNwb25kaW5nIFNvdXJjZSB1bmRlciB0
aGUgdGVybXMgb2YgdGhpcyBMaWNlbnNlLAorIyAraW4gb25lIG9mIHRoZXNlIHdheXM6CisjICsK
KyMgKyAgICBhKSBDb252ZXkgdGhlIG9iamVjdCBjb2RlIGluLCBvciBlbWJvZGllZCBpbiwgYSBw
aHlzaWNhbCBwcm9kdWN0CisjICsgICAgKGluY2x1ZGluZyBhIHBoeXNpY2FsIGRpc3RyaWJ1dGlv
biBtZWRpdW0pLCBhY2NvbXBhbmllZCBieSB0aGUKKyMgKyAgICBDb3JyZXNwb25kaW5nIFNvdXJj
ZSBmaXhlZCBvbiBhIGR1cmFibGUgcGh5c2ljYWwgbWVkaXVtCisjICsgICAgY3VzdG9tYXJpbHkg
dXNlZCBmb3Igc29mdHdhcmUgaW50ZXJjaGFuZ2UuCisjICsKKyMgKyAgICBiKSBDb252ZXkgdGhl
IG9iamVjdCBjb2RlIGluLCBvciBlbWJvZGllZCBpbiwgYSBwaHlzaWNhbCBwcm9kdWN0CisjICsg
ICAgKGluY2x1ZGluZyBhIHBoeXNpY2FsIGRpc3RyaWJ1dGlvbiBtZWRpdW0pLCBhY2NvbXBhbmll
ZCBieSBhCisjICsgICAgd3JpdHRlbiBvZmZlciwgdmFsaWQgZm9yIGF0IGxlYXN0IHRocmVlIHll
YXJzIGFuZCB2YWxpZCBmb3IgYXMKKyMgKyAgICBsb25nIGFzIHlvdSBvZmZlciBzcGFyZSBwYXJ0
cyBvciBjdXN0b21lciBzdXBwb3J0IGZvciB0aGF0IHByb2R1Y3QKKyMgKyAgICBtb2RlbCwgdG8g
Z2l2ZSBhbnlvbmUgd2hvIHBvc3Nlc3NlcyB0aGUgb2JqZWN0IGNvZGUgZWl0aGVyICgxKSBhCisj
ICsgICAgY29weSBvZiB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgZm9yIGFsbCB0aGUgc29mdHdh
cmUgaW4gdGhlCisjICsgICAgcHJvZHVjdCB0aGF0IGlzIGNvdmVyZWQgYnkgdGhpcyBMaWNlbnNl
LCBvbiBhIGR1cmFibGUgcGh5c2ljYWwKKyMgKyAgICBtZWRpdW0gY3VzdG9tYXJpbHkgdXNlZCBm
b3Igc29mdHdhcmUgaW50ZXJjaGFuZ2UsIGZvciBhIHByaWNlIG5vCisjICsgICAgbW9yZSB0aGFu
IHlvdXIgcmVhc29uYWJsZSBjb3N0IG9mIHBoeXNpY2FsbHkgcGVyZm9ybWluZyB0aGlzCisjICsg
ICAgY29udmV5aW5nIG9mIHNvdXJjZSwgb3IgKDIpIGFjY2VzcyB0byBjb3B5IHRoZQorIyArICAg
IENvcnJlc3BvbmRpbmcgU291cmNlIGZyb20gYSBuZXR3b3JrIHNlcnZlciBhdCBubyBjaGFyZ2Uu
CisjICsKKyMgKyAgICBjKSBDb252ZXkgaW5kaXZpZHVhbCBjb3BpZXMgb2YgdGhlIG9iamVjdCBj
b2RlIHdpdGggYSBjb3B5IG9mIHRoZQorIyArICAgIHdyaXR0ZW4gb2ZmZXIgdG8gcHJvdmlkZSB0
aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UuICBUaGlzCisjICsgICAgYWx0ZXJuYXRpdmUgaXMgYWxs
b3dlZCBvbmx5IG9jY2FzaW9uYWxseSBhbmQgbm9uY29tbWVyY2lhbGx5LCBhbmQKKyMgKyAgICBv
bmx5IGlmIHlvdSByZWNlaXZlZCB0aGUgb2JqZWN0IGNvZGUgd2l0aCBzdWNoIGFuIG9mZmVyLCBp
biBhY2NvcmQKKyMgKyAgICB3aXRoIHN1YnNlY3Rpb24gNmIuCisjICsKKyMgKyAgICBkKSBDb252
ZXkgdGhlIG9iamVjdCBjb2RlIGJ5IG9mZmVyaW5nIGFjY2VzcyBmcm9tIGEgZGVzaWduYXRlZAor
IyArICAgIHBsYWNlIChncmF0aXMgb3IgZm9yIGEgY2hhcmdlKSwgYW5kIG9mZmVyIGVxdWl2YWxl
bnQgYWNjZXNzIHRvIHRoZQorIyArICAgIENvcnJlc3BvbmRpbmcgU291cmNlIGluIHRoZSBzYW1l
IHdheSB0aHJvdWdoIHRoZSBzYW1lIHBsYWNlIGF0IG5vCisjICsgICAgZnVydGhlciBjaGFyZ2Uu
ICBZb3UgbmVlZCBub3QgcmVxdWlyZSByZWNpcGllbnRzIHRvIGNvcHkgdGhlCisjICsgICAgQ29y
cmVzcG9uZGluZyBTb3VyY2UgYWxvbmcgd2l0aCB0aGUgb2JqZWN0IGNvZGUuICBJZiB0aGUgcGxh
Y2UgdG8KKyMgKyAgICBjb3B5IHRoZSBvYmplY3QgY29kZSBpcyBhIG5ldHdvcmsgc2VydmVyLCB0
aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UKKyMgKyAgICBtYXkgYmUgb24gYSBkaWZmZXJlbnQgc2Vy
dmVyIChvcGVyYXRlZCBieSB5b3Ugb3IgYSB0aGlyZCBwYXJ0eSkKKyMgKyAgICB0aGF0IHN1cHBv
cnRzIGVxdWl2YWxlbnQgY29weWluZyBmYWNpbGl0aWVzLCBwcm92aWRlZCB5b3UgbWFpbnRhaW4K
KyMgKyAgICBjbGVhciBkaXJlY3Rpb25zIG5leHQgdG8gdGhlIG9iamVjdCBjb2RlIHNheWluZyB3
aGVyZSB0byBmaW5kIHRoZQorIyArICAgIENvcnJlc3BvbmRpbmcgU291cmNlLiAgUmVnYXJkbGVz
cyBvZiB3aGF0IHNlcnZlciBob3N0cyB0aGUKKyMgKyAgICBDb3JyZXNwb25kaW5nIFNvdXJjZSwg
eW91IHJlbWFpbiBvYmxpZ2F0ZWQgdG8gZW5zdXJlIHRoYXQgaXQgaXMKKyMgKyAgICBhdmFpbGFi
bGUgZm9yIGFzIGxvbmcgYXMgbmVlZGVkIHRvIHNhdGlzZnkgdGhlc2UgcmVxdWlyZW1lbnRzLgor
IyArCisjICsgICAgZSkgQ29udmV5IHRoZSBvYmplY3QgY29kZSB1c2luZyBwZWVyLXRvLXBlZXIg
dHJhbnNtaXNzaW9uLCBwcm92aWRlZAorIyArICAgIHlvdSBpbmZvcm0gb3RoZXIgcGVlcnMgd2hl
cmUgdGhlIG9iamVjdCBjb2RlIGFuZCBDb3JyZXNwb25kaW5nCisjICsgICAgU291cmNlIG9mIHRo
ZSB3b3JrIGFyZSBiZWluZyBvZmZlcmVkIHRvIHRoZSBnZW5lcmFsIHB1YmxpYyBhdCBubworIyAr
ICAgIGNoYXJnZSB1bmRlciBzdWJzZWN0aW9uIDZkLgorIyArCisjICsgIEEgc2VwYXJhYmxlIHBv
cnRpb24gb2YgdGhlIG9iamVjdCBjb2RlLCB3aG9zZSBzb3VyY2UgY29kZSBpcyBleGNsdWRlZAor
IyArZnJvbSB0aGUgQ29ycmVzcG9uZGluZyBTb3VyY2UgYXMgYSBTeXN0ZW0gTGlicmFyeSwgbmVl
ZCBub3QgYmUKKyMgK2luY2x1ZGVkIGluIGNvbnZleWluZyB0aGUgb2JqZWN0IGNvZGUgd29yay4K
KyMgKworIyArICBBICJVc2VyIFByb2R1Y3QiIGlzIGVpdGhlciAoMSkgYSAiY29uc3VtZXIgcHJv
ZHVjdCIsIHdoaWNoIG1lYW5zIGFueQorIyArdGFuZ2libGUgcGVyc29uYWwgcHJvcGVydHkgd2hp
Y2ggaXMgbm9ybWFsbHkgdXNlZCBmb3IgcGVyc29uYWwsIGZhbWlseSwKKyMgK29yIGhvdXNlaG9s
ZCBwdXJwb3Nlcywgb3IgKDIpIGFueXRoaW5nIGRlc2lnbmVkIG9yIHNvbGQgZm9yIGluY29ycG9y
YXRpb24KKyMgK2ludG8gYSBkd2VsbGluZy4gIEluIGRldGVybWluaW5nIHdoZXRoZXIgYSBwcm9k
dWN0IGlzIGEgY29uc3VtZXIgcHJvZHVjdCwKKyMgK2RvdWJ0ZnVsIGNhc2VzIHNoYWxsIGJlIHJl
c29sdmVkIGluIGZhdm9yIG9mIGNvdmVyYWdlLiAgRm9yIGEgcGFydGljdWxhcgorIyArcHJvZHVj
dCByZWNlaXZlZCBieSBhIHBhcnRpY3VsYXIgdXNlciwgIm5vcm1hbGx5IHVzZWQiIHJlZmVycyB0
byBhCisjICt0eXBpY2FsIG9yIGNvbW1vbiB1c2Ugb2YgdGhhdCBjbGFzcyBvZiBwcm9kdWN0LCBy
ZWdhcmRsZXNzIG9mIHRoZSBzdGF0dXMKKyMgK29mIHRoZSBwYXJ0aWN1bGFyIHVzZXIgb3Igb2Yg
dGhlIHdheSBpbiB3aGljaCB0aGUgcGFydGljdWxhciB1c2VyCisjICthY3R1YWxseSB1c2VzLCBv
ciBleHBlY3RzIG9yIGlzIGV4cGVjdGVkIHRvIHVzZSwgdGhlIHByb2R1Y3QuICBBIHByb2R1Y3QK
KyMgK2lzIGEgY29uc3VtZXIgcHJvZHVjdCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhlIHByb2R1
Y3QgaGFzIHN1YnN0YW50aWFsCisjICtjb21tZXJjaWFsLCBpbmR1c3RyaWFsIG9yIG5vbi1jb25z
dW1lciB1c2VzLCB1bmxlc3Mgc3VjaCB1c2VzIHJlcHJlc2VudAorIyArdGhlIG9ubHkgc2lnbmlm
aWNhbnQgbW9kZSBvZiB1c2Ugb2YgdGhlIHByb2R1Y3QuCisjICsKKyMgKyAgIkluc3RhbGxhdGlv
biBJbmZvcm1hdGlvbiIgZm9yIGEgVXNlciBQcm9kdWN0IG1lYW5zIGFueSBtZXRob2RzLAorIyAr
cHJvY2VkdXJlcywgYXV0aG9yaXphdGlvbiBrZXlzLCBvciBvdGhlciBpbmZvcm1hdGlvbiByZXF1
aXJlZCB0byBpbnN0YWxsCisjICthbmQgZXhlY3V0ZSBtb2RpZmllZCB2ZXJzaW9ucyBvZiBhIGNv
dmVyZWQgd29yayBpbiB0aGF0IFVzZXIgUHJvZHVjdCBmcm9tCisjICthIG1vZGlmaWVkIHZlcnNp
b24gb2YgaXRzIENvcnJlc3BvbmRpbmcgU291cmNlLiAgVGhlIGluZm9ybWF0aW9uIG11c3QKKyMg
K3N1ZmZpY2UgdG8gZW5zdXJlIHRoYXQgdGhlIGNvbnRpbnVlZCBmdW5jdGlvbmluZyBvZiB0aGUg
bW9kaWZpZWQgb2JqZWN0CisjICtjb2RlIGlzIGluIG5vIGNhc2UgcHJldmVudGVkIG9yIGludGVy
ZmVyZWQgd2l0aCBzb2xlbHkgYmVjYXVzZQorIyArbW9kaWZpY2F0aW9uIGhhcyBiZWVuIG1hZGUu
CisjICsKKyMgKyAgSWYgeW91IGNvbnZleSBhbiBvYmplY3QgY29kZSB3b3JrIHVuZGVyIHRoaXMg
c2VjdGlvbiBpbiwgb3Igd2l0aCwgb3IKKyMgK3NwZWNpZmljYWxseSBmb3IgdXNlIGluLCBhIFVz
ZXIgUHJvZHVjdCwgYW5kIHRoZSBjb252ZXlpbmcgb2NjdXJzIGFzCisjICtwYXJ0IG9mIGEgdHJh
bnNhY3Rpb24gaW4gd2hpY2ggdGhlIHJpZ2h0IG9mIHBvc3Nlc3Npb24gYW5kIHVzZSBvZiB0aGUK
KyMgK1VzZXIgUHJvZHVjdCBpcyB0cmFuc2ZlcnJlZCB0byB0aGUgcmVjaXBpZW50IGluIHBlcnBl
dHVpdHkgb3IgZm9yIGEKKyMgK2ZpeGVkIHRlcm0gKHJlZ2FyZGxlc3Mgb2YgaG93IHRoZSB0cmFu
c2FjdGlvbiBpcyBjaGFyYWN0ZXJpemVkKSwgdGhlCisjICtDb3JyZXNwb25kaW5nIFNvdXJjZSBj
b252ZXllZCB1bmRlciB0aGlzIHNlY3Rpb24gbXVzdCBiZSBhY2NvbXBhbmllZAorIyArYnkgdGhl
IEluc3RhbGxhdGlvbiBJbmZvcm1hdGlvbi4gIEJ1dCB0aGlzIHJlcXVpcmVtZW50IGRvZXMgbm90
IGFwcGx5CisjICtpZiBuZWl0aGVyIHlvdSBub3IgYW55IHRoaXJkIHBhcnR5IHJldGFpbnMgdGhl
IGFiaWxpdHkgdG8gaW5zdGFsbAorIyArbW9kaWZpZWQgb2JqZWN0IGNvZGUgb24gdGhlIFVzZXIg
UHJvZHVjdCAoZm9yIGV4YW1wbGUsIHRoZSB3b3JrIGhhcworIyArYmVlbiBpbnN0YWxsZWQgaW4g
Uk9NKS4KKyMgKworIyArICBUaGUgcmVxdWlyZW1lbnQgdG8gcHJvdmlkZSBJbnN0YWxsYXRpb24g
SW5mb3JtYXRpb24gZG9lcyBub3QgaW5jbHVkZSBhCisjICtyZXF1aXJlbWVudCB0byBjb250aW51
ZSB0byBwcm92aWRlIHN1cHBvcnQgc2VydmljZSwgd2FycmFudHksIG9yIHVwZGF0ZXMKKyMgK2Zv
ciBhIHdvcmsgdGhhdCBoYXMgYmVlbiBtb2RpZmllZCBvciBpbnN0YWxsZWQgYnkgdGhlIHJlY2lw
aWVudCwgb3IgZm9yCisjICt0aGUgVXNlciBQcm9kdWN0IGluIHdoaWNoIGl0IGhhcyBiZWVuIG1v
ZGlmaWVkIG9yIGluc3RhbGxlZC4gIEFjY2VzcyB0byBhCisjICtuZXR3b3JrIG1heSBiZSBkZW5p
ZWQgd2hlbiB0aGUgbW9kaWZpY2F0aW9uIGl0c2VsZiBtYXRlcmlhbGx5IGFuZAorIyArYWR2ZXJz
ZWx5IGFmZmVjdHMgdGhlIG9wZXJhdGlvbiBvZiB0aGUgbmV0d29yayBvciB2aW9sYXRlcyB0aGUg
cnVsZXMgYW5kCisjICtwcm90b2NvbHMgZm9yIGNvbW11bmljYXRpb24gYWNyb3NzIHRoZSBuZXR3
b3JrLgorIyArCisjICsgIENvcnJlc3BvbmRpbmcgU291cmNlIGNvbnZleWVkLCBhbmQgSW5zdGFs
bGF0aW9uIEluZm9ybWF0aW9uIHByb3ZpZGVkLAorIyAraW4gYWNjb3JkIHdpdGggdGhpcyBzZWN0
aW9uIG11c3QgYmUgaW4gYSBmb3JtYXQgdGhhdCBpcyBwdWJsaWNseQorIyArZG9jdW1lbnRlZCAo
YW5kIHdpdGggYW4gaW1wbGVtZW50YXRpb24gYXZhaWxhYmxlIHRvIHRoZSBwdWJsaWMgaW4KKyMg
K3NvdXJjZSBjb2RlIGZvcm0pLCBhbmQgbXVzdCByZXF1aXJlIG5vIHNwZWNpYWwgcGFzc3dvcmQg
b3Iga2V5IGZvcgorIyArdW5wYWNraW5nLCByZWFkaW5nIG9yIGNvcHlpbmcuCisjICsKKyMgKyAg
Ny4gQWRkaXRpb25hbCBUZXJtcy4KKyMgKworIyArICAiQWRkaXRpb25hbCBwZXJtaXNzaW9ucyIg
YXJlIHRlcm1zIHRoYXQgc3VwcGxlbWVudCB0aGUgdGVybXMgb2YgdGhpcworIyArTGljZW5zZSBi
eSBtYWtpbmcgZXhjZXB0aW9ucyBmcm9tIG9uZSBvciBtb3JlIG9mIGl0cyBjb25kaXRpb25zLgor
IyArQWRkaXRpb25hbCBwZXJtaXNzaW9ucyB0aGF0IGFyZSBhcHBsaWNhYmxlIHRvIHRoZSBlbnRp
cmUgUHJvZ3JhbSBzaGFsbAorIyArYmUgdHJlYXRlZCBhcyB0aG91Z2ggdGhleSB3ZXJlIGluY2x1
ZGVkIGluIHRoaXMgTGljZW5zZSwgdG8gdGhlIGV4dGVudAorIyArdGhhdCB0aGV5IGFyZSB2YWxp
ZCB1bmRlciBhcHBsaWNhYmxlIGxhdy4gIElmIGFkZGl0aW9uYWwgcGVybWlzc2lvbnMKKyMgK2Fw
cGx5IG9ubHkgdG8gcGFydCBvZiB0aGUgUHJvZ3JhbSwgdGhhdCBwYXJ0IG1heSBiZSB1c2VkIHNl
cGFyYXRlbHkKKyMgK3VuZGVyIHRob3NlIHBlcm1pc3Npb25zLCBidXQgdGhlIGVudGlyZSBQcm9n
cmFtIHJlbWFpbnMgZ292ZXJuZWQgYnkKKyMgK3RoaXMgTGljZW5zZSB3aXRob3V0IHJlZ2FyZCB0
byB0aGUgYWRkaXRpb25hbCBwZXJtaXNzaW9ucy4KKyMgKworIyArICBXaGVuIHlvdSBjb252ZXkg
YSBjb3B5IG9mIGEgY292ZXJlZCB3b3JrLCB5b3UgbWF5IGF0IHlvdXIgb3B0aW9uCisjICtyZW1v
dmUgYW55IGFkZGl0aW9uYWwgcGVybWlzc2lvbnMgZnJvbSB0aGF0IGNvcHksIG9yIGZyb20gYW55
IHBhcnQgb2YKKyMgK2l0LiAgKEFkZGl0aW9uYWwgcGVybWlzc2lvbnMgbWF5IGJlIHdyaXR0ZW4g
dG8gcmVxdWlyZSB0aGVpciBvd24KKyMgK3JlbW92YWwgaW4gY2VydGFpbiBjYXNlcyB3aGVuIHlv
dSBtb2RpZnkgdGhlIHdvcmsuKSAgWW91IG1heSBwbGFjZQorIyArYWRkaXRpb25hbCBwZXJtaXNz
aW9ucyBvbiBtYXRlcmlhbCwgYWRkZWQgYnkgeW91IHRvIGEgY292ZXJlZCB3b3JrLAorIyArZm9y
IHdoaWNoIHlvdSBoYXZlIG9yIGNhbiBnaXZlIGFwcHJvcHJpYXRlIGNvcHlyaWdodCBwZXJtaXNz
aW9uLgorIyArCisjICsgIE5vdHdpdGhzdGFuZGluZyBhbnkgb3RoZXIgcHJvdmlzaW9uIG9mIHRo
aXMgTGljZW5zZSwgZm9yIG1hdGVyaWFsIHlvdQorIyArYWRkIHRvIGEgY292ZXJlZCB3b3JrLCB5
b3UgbWF5IChpZiBhdXRob3JpemVkIGJ5IHRoZSBjb3B5cmlnaHQgaG9sZGVycyBvZgorIyArdGhh
dCBtYXRlcmlhbCkgc3VwcGxlbWVudCB0aGUgdGVybXMgb2YgdGhpcyBMaWNlbnNlIHdpdGggdGVy
bXM6CisjICsKKyMgKyAgICBhKSBEaXNjbGFpbWluZyB3YXJyYW50eSBvciBsaW1pdGluZyBsaWFi
aWxpdHkgZGlmZmVyZW50bHkgZnJvbSB0aGUKKyMgKyAgICB0ZXJtcyBvZiBzZWN0aW9ucyAxNSBh
bmQgMTYgb2YgdGhpcyBMaWNlbnNlOyBvcgorIyArCisjICsgICAgYikgUmVxdWlyaW5nIHByZXNl
cnZhdGlvbiBvZiBzcGVjaWZpZWQgcmVhc29uYWJsZSBsZWdhbCBub3RpY2VzIG9yCisjICsgICAg
YXV0aG9yIGF0dHJpYnV0aW9ucyBpbiB0aGF0IG1hdGVyaWFsIG9yIGluIHRoZSBBcHByb3ByaWF0
ZSBMZWdhbAorIyArICAgIE5vdGljZXMgZGlzcGxheWVkIGJ5IHdvcmtzIGNvbnRhaW5pbmcgaXQ7
IG9yCisjICsKKyMgKyAgICBjKSBQcm9oaWJpdGluZyBtaXNyZXByZXNlbnRhdGlvbiBvZiB0aGUg
b3JpZ2luIG9mIHRoYXQgbWF0ZXJpYWwsIG9yCisjICsgICAgcmVxdWlyaW5nIHRoYXQgbW9kaWZp
ZWQgdmVyc2lvbnMgb2Ygc3VjaCBtYXRlcmlhbCBiZSBtYXJrZWQgaW4KKyMgKyAgICByZWFzb25h
YmxlIHdheXMgYXMgZGlmZmVyZW50IGZyb20gdGhlIG9yaWdpbmFsIHZlcnNpb247IG9yCisjICsK
KyMgKyAgICBkKSBMaW1pdGluZyB0aGUgdXNlIGZvciBwdWJsaWNpdHkgcHVycG9zZXMgb2YgbmFt
ZXMgb2YgbGljZW5zb3JzIG9yCisjICsgICAgYXV0aG9ycyBvZiB0aGUgbWF0ZXJpYWw7IG9yCisj
ICsKKyMgKyAgICBlKSBEZWNsaW5pbmcgdG8gZ3JhbnQgcmlnaHRzIHVuZGVyIHRyYWRlbWFyayBs
YXcgZm9yIHVzZSBvZiBzb21lCisjICsgICAgdHJhZGUgbmFtZXMsIHRyYWRlbWFya3MsIG9yIHNl
cnZpY2UgbWFya3M7IG9yCisjICsKKyMgKyAgICBmKSBSZXF1aXJpbmcgaW5kZW1uaWZpY2F0aW9u
IG9mIGxpY2Vuc29ycyBhbmQgYXV0aG9ycyBvZiB0aGF0CisjICsgICAgbWF0ZXJpYWwgYnkgYW55
b25lIHdobyBjb252ZXlzIHRoZSBtYXRlcmlhbCAob3IgbW9kaWZpZWQgdmVyc2lvbnMgb2YKKyMg
KyAgICBpdCkgd2l0aCBjb250cmFjdHVhbCBhc3N1bXB0aW9ucyBvZiBsaWFiaWxpdHkgdG8gdGhl
IHJlY2lwaWVudCwgZm9yCisjICsgICAgYW55IGxpYWJpbGl0eSB0aGF0IHRoZXNlIGNvbnRyYWN0
dWFsIGFzc3VtcHRpb25zIGRpcmVjdGx5IGltcG9zZSBvbgorIyArICAgIHRob3NlIGxpY2Vuc29y
cyBhbmQgYXV0aG9ycy4KKyMgKworIyArICBBbGwgb3RoZXIgbm9uLXBlcm1pc3NpdmUgYWRkaXRp
b25hbCB0ZXJtcyBhcmUgY29uc2lkZXJlZCAiZnVydGhlcgorIyArcmVzdHJpY3Rpb25zIiB3aXRo
aW4gdGhlIG1lYW5pbmcgb2Ygc2VjdGlvbiAxMC4gIElmIHRoZSBQcm9ncmFtIGFzIHlvdQorIyAr
cmVjZWl2ZWQgaXQsIG9yIGFueSBwYXJ0IG9mIGl0LCBjb250YWlucyBhIG5vdGljZSBzdGF0aW5n
IHRoYXQgaXQgaXMKKyMgK2dvdmVybmVkIGJ5IHRoaXMgTGljZW5zZSBhbG9uZyB3aXRoIGEgdGVy
bSB0aGF0IGlzIGEgZnVydGhlcgorIyArcmVzdHJpY3Rpb24sIHlvdSBtYXkgcmVtb3ZlIHRoYXQg
dGVybS4gIElmIGEgbGljZW5zZSBkb2N1bWVudCBjb250YWlucworIyArYSBmdXJ0aGVyIHJlc3Ry
aWN0aW9uIGJ1dCBwZXJtaXRzIHJlbGljZW5zaW5nIG9yIGNvbnZleWluZyB1bmRlciB0aGlzCisj
ICtMaWNlbnNlLCB5b3UgbWF5IGFkZCB0byBhIGNvdmVyZWQgd29yayBtYXRlcmlhbCBnb3Zlcm5l
ZCBieSB0aGUgdGVybXMKKyMgK29mIHRoYXQgbGljZW5zZSBkb2N1bWVudCwgcHJvdmlkZWQgdGhh
dCB0aGUgZnVydGhlciByZXN0cmljdGlvbiBkb2VzCisjICtub3Qgc3Vydml2ZSBzdWNoIHJlbGlj
ZW5zaW5nIG9yIGNvbnZleWluZy4KKyMgKworIyArICBJZiB5b3UgYWRkIHRlcm1zIHRvIGEgY292
ZXJlZCB3b3JrIGluIGFjY29yZCB3aXRoIHRoaXMgc2VjdGlvbiwgeW91CisjICttdXN0IHBsYWNl
LCBpbiB0aGUgcmVsZXZhbnQgc291cmNlIGZpbGVzLCBhIHN0YXRlbWVudCBvZiB0aGUKKyMgK2Fk
ZGl0aW9uYWwgdGVybXMgdGhhdCBhcHBseSB0byB0aG9zZSBmaWxlcywgb3IgYSBub3RpY2UgaW5k
aWNhdGluZworIyArd2hlcmUgdG8gZmluZCB0aGUgYXBwbGljYWJsZSB0ZXJtcy4KKyMgKworIyAr
ICBBZGRpdGlvbmFsIHRlcm1zLCBwZXJtaXNzaXZlIG9yIG5vbi1wZXJtaXNzaXZlLCBtYXkgYmUg
c3RhdGVkIGluIHRoZQorIyArZm9ybSBvZiBhIHNlcGFyYXRlbHkgd3JpdHRlbiBsaWNlbnNlLCBv
ciBzdGF0ZWQgYXMgZXhjZXB0aW9uczsKKyMgK3RoZSBhYm92ZSByZXF1aXJlbWVudHMgYXBwbHkg
ZWl0aGVyIHdheS4KKyMgKworIyArICA4LiBUZXJtaW5hdGlvbi4KKyMgKworIyArICBZb3UgbWF5
IG5vdCBwcm9wYWdhdGUgb3IgbW9kaWZ5IGEgY292ZXJlZCB3b3JrIGV4Y2VwdCBhcyBleHByZXNz
bHkKKyMgK3Byb3ZpZGVkIHVuZGVyIHRoaXMgTGljZW5zZS4gIEFueSBhdHRlbXB0IG90aGVyd2lz
ZSB0byBwcm9wYWdhdGUgb3IKKyMgK21vZGlmeSBpdCBpcyB2b2lkLCBhbmQgd2lsbCBhdXRvbWF0
aWNhbGx5IHRlcm1pbmF0ZSB5b3VyIHJpZ2h0cyB1bmRlcgorIyArdGhpcyBMaWNlbnNlIChpbmNs
dWRpbmcgYW55IHBhdGVudCBsaWNlbnNlcyBncmFudGVkIHVuZGVyIHRoZSB0aGlyZAorIyArcGFy
YWdyYXBoIG9mIHNlY3Rpb24gMTEpLgorIyArCisjICsgIEhvd2V2ZXIsIGlmIHlvdSBjZWFzZSBh
bGwgdmlvbGF0aW9uIG9mIHRoaXMgTGljZW5zZSwgdGhlbiB5b3VyCisjICtsaWNlbnNlIGZyb20g
YSBwYXJ0aWN1bGFyIGNvcHlyaWdodCBob2xkZXIgaXMgcmVpbnN0YXRlZCAoYSkKKyMgK3Byb3Zp
c2lvbmFsbHksIHVubGVzcyBhbmQgdW50aWwgdGhlIGNvcHlyaWdodCBob2xkZXIgZXhwbGljaXRs
eSBhbmQKKyMgK2ZpbmFsbHkgdGVybWluYXRlcyB5b3VyIGxpY2Vuc2UsIGFuZCAoYikgcGVybWFu
ZW50bHksIGlmIHRoZSBjb3B5cmlnaHQKKyMgK2hvbGRlciBmYWlscyB0byBub3RpZnkgeW91IG9m
IHRoZSB2aW9sYXRpb24gYnkgc29tZSByZWFzb25hYmxlIG1lYW5zCisjICtwcmlvciB0byA2MCBk
YXlzIGFmdGVyIHRoZSBjZXNzYXRpb24uCisjICsKKyMgKyAgTW9yZW92ZXIsIHlvdXIgbGljZW5z
ZSBmcm9tIGEgcGFydGljdWxhciBjb3B5cmlnaHQgaG9sZGVyIGlzCisjICtyZWluc3RhdGVkIHBl
cm1hbmVudGx5IGlmIHRoZSBjb3B5cmlnaHQgaG9sZGVyIG5vdGlmaWVzIHlvdSBvZiB0aGUKKyMg
K3Zpb2xhdGlvbiBieSBzb21lIHJlYXNvbmFibGUgbWVhbnMsIHRoaXMgaXMgdGhlIGZpcnN0IHRp
bWUgeW91IGhhdmUKKyMgK3JlY2VpdmVkIG5vdGljZSBvZiB2aW9sYXRpb24gb2YgdGhpcyBMaWNl
bnNlIChmb3IgYW55IHdvcmspIGZyb20gdGhhdAorIyArY29weXJpZ2h0IGhvbGRlciwgYW5kIHlv
dSBjdXJlIHRoZSB2aW9sYXRpb24gcHJpb3IgdG8gMzAgZGF5cyBhZnRlcgorIyAreW91ciByZWNl
aXB0IG9mIHRoZSBub3RpY2UuCisjICsKKyMgKyAgVGVybWluYXRpb24gb2YgeW91ciByaWdodHMg
dW5kZXIgdGhpcyBzZWN0aW9uIGRvZXMgbm90IHRlcm1pbmF0ZSB0aGUKKyMgK2xpY2Vuc2VzIG9m
IHBhcnRpZXMgd2hvIGhhdmUgcmVjZWl2ZWQgY29waWVzIG9yIHJpZ2h0cyBmcm9tIHlvdSB1bmRl
cgorIyArdGhpcyBMaWNlbnNlLiAgSWYgeW91ciByaWdodHMgaGF2ZSBiZWVuIHRlcm1pbmF0ZWQg
YW5kIG5vdCBwZXJtYW5lbnRseQorIyArcmVpbnN0YXRlZCwgeW91IGRvIG5vdCBxdWFsaWZ5IHRv
IHJlY2VpdmUgbmV3IGxpY2Vuc2VzIGZvciB0aGUgc2FtZQorIyArbWF0ZXJpYWwgdW5kZXIgc2Vj
dGlvbiAxMC4KKyMgKworIyArICA5LiBBY2NlcHRhbmNlIE5vdCBSZXF1aXJlZCBmb3IgSGF2aW5n
IENvcGllcy4KKyMgKworIyArICBZb3UgYXJlIG5vdCByZXF1aXJlZCB0byBhY2NlcHQgdGhpcyBM
aWNlbnNlIGluIG9yZGVyIHRvIHJlY2VpdmUgb3IKKyMgK3J1biBhIGNvcHkgb2YgdGhlIFByb2dy
YW0uICBBbmNpbGxhcnkgcHJvcGFnYXRpb24gb2YgYSBjb3ZlcmVkIHdvcmsKKyMgK29jY3Vycmlu
ZyBzb2xlbHkgYXMgYSBjb25zZXF1ZW5jZSBvZiB1c2luZyBwZWVyLXRvLXBlZXIgdHJhbnNtaXNz
aW9uCisjICt0byByZWNlaXZlIGEgY29weSBsaWtld2lzZSBkb2VzIG5vdCByZXF1aXJlIGFjY2Vw
dGFuY2UuICBIb3dldmVyLAorIyArbm90aGluZyBvdGhlciB0aGFuIHRoaXMgTGljZW5zZSBncmFu
dHMgeW91IHBlcm1pc3Npb24gdG8gcHJvcGFnYXRlIG9yCisjICttb2RpZnkgYW55IGNvdmVyZWQg
d29yay4gIFRoZXNlIGFjdGlvbnMgaW5mcmluZ2UgY29weXJpZ2h0IGlmIHlvdSBkbworIyArbm90
IGFjY2VwdCB0aGlzIExpY2Vuc2UuICBUaGVyZWZvcmUsIGJ5IG1vZGlmeWluZyBvciBwcm9wYWdh
dGluZyBhCisjICtjb3ZlcmVkIHdvcmssIHlvdSBpbmRpY2F0ZSB5b3VyIGFjY2VwdGFuY2Ugb2Yg
dGhpcyBMaWNlbnNlIHRvIGRvIHNvLgorIyArCisjICsgIDEwLiBBdXRvbWF0aWMgTGljZW5zaW5n
IG9mIERvd25zdHJlYW0gUmVjaXBpZW50cy4KKyMgKworIyArICBFYWNoIHRpbWUgeW91IGNvbnZl
eSBhIGNvdmVyZWQgd29yaywgdGhlIHJlY2lwaWVudCBhdXRvbWF0aWNhbGx5CisjICtyZWNlaXZl
cyBhIGxpY2Vuc2UgZnJvbSB0aGUgb3JpZ2luYWwgbGljZW5zb3JzLCB0byBydW4sIG1vZGlmeSBh
bmQKKyMgK3Byb3BhZ2F0ZSB0aGF0IHdvcmssIHN1YmplY3QgdG8gdGhpcyBMaWNlbnNlLiAgWW91
IGFyZSBub3QgcmVzcG9uc2libGUKKyMgK2ZvciBlbmZvcmNpbmcgY29tcGxpYW5jZSBieSB0aGly
ZCBwYXJ0aWVzIHdpdGggdGhpcyBMaWNlbnNlLgorIyArCisjICsgIEFuICJlbnRpdHkgdHJhbnNh
Y3Rpb24iIGlzIGEgdHJhbnNhY3Rpb24gdHJhbnNmZXJyaW5nIGNvbnRyb2wgb2YgYW4KKyMgK29y
Z2FuaXphdGlvbiwgb3Igc3Vic3RhbnRpYWxseSBhbGwgYXNzZXRzIG9mIG9uZSwgb3Igc3ViZGl2
aWRpbmcgYW4KKyMgK29yZ2FuaXphdGlvbiwgb3IgbWVyZ2luZyBvcmdhbml6YXRpb25zLiAgSWYg
cHJvcGFnYXRpb24gb2YgYSBjb3ZlcmVkCisjICt3b3JrIHJlc3VsdHMgZnJvbSBhbiBlbnRpdHkg
dHJhbnNhY3Rpb24sIGVhY2ggcGFydHkgdG8gdGhhdAorIyArdHJhbnNhY3Rpb24gd2hvIHJlY2Vp
dmVzIGEgY29weSBvZiB0aGUgd29yayBhbHNvIHJlY2VpdmVzIHdoYXRldmVyCisjICtsaWNlbnNl
cyB0byB0aGUgd29yayB0aGUgcGFydHkncyBwcmVkZWNlc3NvciBpbiBpbnRlcmVzdCBoYWQgb3Ig
Y291bGQKKyMgK2dpdmUgdW5kZXIgdGhlIHByZXZpb3VzIHBhcmFncmFwaCwgcGx1cyBhIHJpZ2h0
IHRvIHBvc3Nlc3Npb24gb2YgdGhlCisjICtDb3JyZXNwb25kaW5nIFNvdXJjZSBvZiB0aGUgd29y
ayBmcm9tIHRoZSBwcmVkZWNlc3NvciBpbiBpbnRlcmVzdCwgaWYKKyMgK3RoZSBwcmVkZWNlc3Nv
ciBoYXMgaXQgb3IgY2FuIGdldCBpdCB3aXRoIHJlYXNvbmFibGUgZWZmb3J0cy4KKyMgKworIyAr
ICBZb3UgbWF5IG5vdCBpbXBvc2UgYW55IGZ1cnRoZXIgcmVzdHJpY3Rpb25zIG9uIHRoZSBleGVy
Y2lzZSBvZiB0aGUKKyMgK3JpZ2h0cyBncmFudGVkIG9yIGFmZmlybWVkIHVuZGVyIHRoaXMgTGlj
ZW5zZS4gIEZvciBleGFtcGxlLCB5b3UgbWF5CisjICtub3QgaW1wb3NlIGEgbGljZW5zZSBmZWUs
IHJveWFsdHksIG9yIG90aGVyIGNoYXJnZSBmb3IgZXhlcmNpc2Ugb2YKKyMgK3JpZ2h0cyBncmFu
dGVkIHVuZGVyIHRoaXMgTGljZW5zZSwgYW5kIHlvdSBtYXkgbm90IGluaXRpYXRlIGxpdGlnYXRp
b24KKyMgKyhpbmNsdWRpbmcgYSBjcm9zcy1jbGFpbSBvciBjb3VudGVyY2xhaW0gaW4gYSBsYXdz
dWl0KSBhbGxlZ2luZyB0aGF0CisjICthbnkgcGF0ZW50IGNsYWltIGlzIGluZnJpbmdlZCBieSBt
YWtpbmcsIHVzaW5nLCBzZWxsaW5nLCBvZmZlcmluZyBmb3IKKyMgK3NhbGUsIG9yIGltcG9ydGlu
ZyB0aGUgUHJvZ3JhbSBvciBhbnkgcG9ydGlvbiBvZiBpdC4KKyMgKworIyArICAxMS4gUGF0ZW50
cy4KKyMgKworIyArICBBICJjb250cmlidXRvciIgaXMgYSBjb3B5cmlnaHQgaG9sZGVyIHdobyBh
dXRob3JpemVzIHVzZSB1bmRlciB0aGlzCisjICtMaWNlbnNlIG9mIHRoZSBQcm9ncmFtIG9yIGEg
d29yayBvbiB3aGljaCB0aGUgUHJvZ3JhbSBpcyBiYXNlZC4gIFRoZQorIyArd29yayB0aHVzIGxp
Y2Vuc2VkIGlzIGNhbGxlZCB0aGUgY29udHJpYnV0b3IncyAiY29udHJpYnV0b3IgdmVyc2lvbiIu
CisjICsKKyMgKyAgQSBjb250cmlidXRvcidzICJlc3NlbnRpYWwgcGF0ZW50IGNsYWltcyIgYXJl
IGFsbCBwYXRlbnQgY2xhaW1zCisjICtvd25lZCBvciBjb250cm9sbGVkIGJ5IHRoZSBjb250cmli
dXRvciwgd2hldGhlciBhbHJlYWR5IGFjcXVpcmVkIG9yCisjICtoZXJlYWZ0ZXIgYWNxdWlyZWQs
IHRoYXQgd291bGQgYmUgaW5mcmluZ2VkIGJ5IHNvbWUgbWFubmVyLCBwZXJtaXR0ZWQKKyMgK2J5
IHRoaXMgTGljZW5zZSwgb2YgbWFraW5nLCB1c2luZywgb3Igc2VsbGluZyBpdHMgY29udHJpYnV0
b3IgdmVyc2lvbiwKKyMgK2J1dCBkbyBub3QgaW5jbHVkZSBjbGFpbXMgdGhhdCB3b3VsZCBiZSBp
bmZyaW5nZWQgb25seSBhcyBhCisjICtjb25zZXF1ZW5jZSBvZiBmdXJ0aGVyIG1vZGlmaWNhdGlv
biBvZiB0aGUgY29udHJpYnV0b3IgdmVyc2lvbi4gIEZvcgorIyArcHVycG9zZXMgb2YgdGhpcyBk
ZWZpbml0aW9uLCAiY29udHJvbCIgaW5jbHVkZXMgdGhlIHJpZ2h0IHRvIGdyYW50CisjICtwYXRl
bnQgc3VibGljZW5zZXMgaW4gYSBtYW5uZXIgY29uc2lzdGVudCB3aXRoIHRoZSByZXF1aXJlbWVu
dHMgb2YKKyMgIHRoaXMgTGljZW5zZS4KKyMgIAorIyAtICA3LiBJZiwgYXMgYSBjb25zZXF1ZW5j
ZSBvZiBhIGNvdXJ0IGp1ZGdtZW50IG9yIGFsbGVnYXRpb24gb2YgcGF0ZW50CisjIC1pbmZyaW5n
ZW1lbnQgb3IgZm9yIGFueSBvdGhlciByZWFzb24gKG5vdCBsaW1pdGVkIHRvIHBhdGVudCBpc3N1
ZXMpLAorIyAtY29uZGl0aW9ucyBhcmUgaW1wb3NlZCBvbiB5b3UgKHdoZXRoZXIgYnkgY291cnQg
b3JkZXIsIGFncmVlbWVudCBvcgorIyArICBFYWNoIGNvbnRyaWJ1dG9yIGdyYW50cyB5b3UgYSBu
b24tZXhjbHVzaXZlLCB3b3JsZHdpZGUsIHJveWFsdHktZnJlZQorIyArcGF0ZW50IGxpY2Vuc2Ug
dW5kZXIgdGhlIGNvbnRyaWJ1dG9yJ3MgZXNzZW50aWFsIHBhdGVudCBjbGFpbXMsIHRvCisjICtt
YWtlLCB1c2UsIHNlbGwsIG9mZmVyIGZvciBzYWxlLCBpbXBvcnQgYW5kIG90aGVyd2lzZSBydW4s
IG1vZGlmeSBhbmQKKyMgK3Byb3BhZ2F0ZSB0aGUgY29udGVudHMgb2YgaXRzIGNvbnRyaWJ1dG9y
IHZlcnNpb24uCisjICsKKyMgKyAgSW4gdGhlIGZvbGxvd2luZyB0aHJlZSBwYXJhZ3JhcGhzLCBh
ICJwYXRlbnQgbGljZW5zZSIgaXMgYW55IGV4cHJlc3MKKyMgK2FncmVlbWVudCBvciBjb21taXRt
ZW50LCBob3dldmVyIGRlbm9taW5hdGVkLCBub3QgdG8gZW5mb3JjZSBhIHBhdGVudAorIyArKHN1
Y2ggYXMgYW4gZXhwcmVzcyBwZXJtaXNzaW9uIHRvIHByYWN0aWNlIGEgcGF0ZW50IG9yIGNvdmVu
YW50IG5vdCB0bworIyArc3VlIGZvciBwYXRlbnQgaW5mcmluZ2VtZW50KS4gIFRvICJncmFudCIg
c3VjaCBhIHBhdGVudCBsaWNlbnNlIHRvIGEKKyMgK3BhcnR5IG1lYW5zIHRvIG1ha2Ugc3VjaCBh
biBhZ3JlZW1lbnQgb3IgY29tbWl0bWVudCBub3QgdG8gZW5mb3JjZSBhCisjICtwYXRlbnQgYWdh
aW5zdCB0aGUgcGFydHkuCisjICsKKyMgKyAgSWYgeW91IGNvbnZleSBhIGNvdmVyZWQgd29yaywg
a25vd2luZ2x5IHJlbHlpbmcgb24gYSBwYXRlbnQgbGljZW5zZSwKKyMgK2FuZCB0aGUgQ29ycmVz
cG9uZGluZyBTb3VyY2Ugb2YgdGhlIHdvcmsgaXMgbm90IGF2YWlsYWJsZSBmb3IgYW55b25lCisj
ICt0byBjb3B5LCBmcmVlIG9mIGNoYXJnZSBhbmQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoaXMgTGlj
ZW5zZSwgdGhyb3VnaCBhCisjICtwdWJsaWNseSBhdmFpbGFibGUgbmV0d29yayBzZXJ2ZXIgb3Ig
b3RoZXIgcmVhZGlseSBhY2Nlc3NpYmxlIG1lYW5zLAorIyArdGhlbiB5b3UgbXVzdCBlaXRoZXIg
KDEpIGNhdXNlIHRoZSBDb3JyZXNwb25kaW5nIFNvdXJjZSB0byBiZSBzbworIyArYXZhaWxhYmxl
LCBvciAoMikgYXJyYW5nZSB0byBkZXByaXZlIHlvdXJzZWxmIG9mIHRoZSBiZW5lZml0IG9mIHRo
ZQorIyArcGF0ZW50IGxpY2Vuc2UgZm9yIHRoaXMgcGFydGljdWxhciB3b3JrLCBvciAoMykgYXJy
YW5nZSwgaW4gYSBtYW5uZXIKKyMgK2NvbnNpc3RlbnQgd2l0aCB0aGUgcmVxdWlyZW1lbnRzIG9m
IHRoaXMgTGljZW5zZSwgdG8gZXh0ZW5kIHRoZSBwYXRlbnQKKyMgK2xpY2Vuc2UgdG8gZG93bnN0
cmVhbSByZWNpcGllbnRzLiAgIktub3dpbmdseSByZWx5aW5nIiBtZWFucyB5b3UgaGF2ZQorIyAr
YWN0dWFsIGtub3dsZWRnZSB0aGF0LCBidXQgZm9yIHRoZSBwYXRlbnQgbGljZW5zZSwgeW91ciBj
b252ZXlpbmcgdGhlCisjICtjb3ZlcmVkIHdvcmsgaW4gYSBjb3VudHJ5LCBvciB5b3VyIHJlY2lw
aWVudCdzIHVzZSBvZiB0aGUgY292ZXJlZCB3b3JrCisjICtpbiBhIGNvdW50cnksIHdvdWxkIGlu
ZnJpbmdlIG9uZSBvciBtb3JlIGlkZW50aWZpYWJsZSBwYXRlbnRzIGluIHRoYXQKKyMgK2NvdW50
cnkgdGhhdCB5b3UgaGF2ZSByZWFzb24gdG8gYmVsaWV2ZSBhcmUgdmFsaWQuCisjICsKKyMgKyAg
SWYsIHB1cnN1YW50IHRvIG9yIGluIGNvbm5lY3Rpb24gd2l0aCBhIHNpbmdsZSB0cmFuc2FjdGlv
biBvcgorIyArYXJyYW5nZW1lbnQsIHlvdSBjb252ZXksIG9yIHByb3BhZ2F0ZSBieSBwcm9jdXJp
bmcgY29udmV5YW5jZSBvZiwgYQorIyArY292ZXJlZCB3b3JrLCBhbmQgZ3JhbnQgYSBwYXRlbnQg
bGljZW5zZSB0byBzb21lIG9mIHRoZSBwYXJ0aWVzCisjICtyZWNlaXZpbmcgdGhlIGNvdmVyZWQg
d29yayBhdXRob3JpemluZyB0aGVtIHRvIHVzZSwgcHJvcGFnYXRlLCBtb2RpZnkKKyMgK29yIGNv
bnZleSBhIHNwZWNpZmljIGNvcHkgb2YgdGhlIGNvdmVyZWQgd29yaywgdGhlbiB0aGUgcGF0ZW50
IGxpY2Vuc2UKKyMgK3lvdSBncmFudCBpcyBhdXRvbWF0aWNhbGx5IGV4dGVuZGVkIHRvIGFsbCBy
ZWNpcGllbnRzIG9mIHRoZSBjb3ZlcmVkCisjICt3b3JrIGFuZCB3b3JrcyBiYXNlZCBvbiBpdC4K
KyMgKworIyArICBBIHBhdGVudCBsaWNlbnNlIGlzICJkaXNjcmltaW5hdG9yeSIgaWYgaXQgZG9l
cyBub3QgaW5jbHVkZSB3aXRoaW4KKyMgK3RoZSBzY29wZSBvZiBpdHMgY292ZXJhZ2UsIHByb2hp
Yml0cyB0aGUgZXhlcmNpc2Ugb2YsIG9yIGlzCisjICtjb25kaXRpb25lZCBvbiB0aGUgbm9uLWV4
ZXJjaXNlIG9mIG9uZSBvciBtb3JlIG9mIHRoZSByaWdodHMgdGhhdCBhcmUKKyMgK3NwZWNpZmlj
YWxseSBncmFudGVkIHVuZGVyIHRoaXMgTGljZW5zZS4gIFlvdSBtYXkgbm90IGNvbnZleSBhIGNv
dmVyZWQKKyMgK3dvcmsgaWYgeW91IGFyZSBhIHBhcnR5IHRvIGFuIGFycmFuZ2VtZW50IHdpdGgg
YSB0aGlyZCBwYXJ0eSB0aGF0IGlzCisjICtpbiB0aGUgYnVzaW5lc3Mgb2YgZGlzdHJpYnV0aW5n
IHNvZnR3YXJlLCB1bmRlciB3aGljaCB5b3UgbWFrZSBwYXltZW50CisjICt0byB0aGUgdGhpcmQg
cGFydHkgYmFzZWQgb24gdGhlIGV4dGVudCBvZiB5b3VyIGFjdGl2aXR5IG9mIGNvbnZleWluZwor
IyArdGhlIHdvcmssIGFuZCB1bmRlciB3aGljaCB0aGUgdGhpcmQgcGFydHkgZ3JhbnRzLCB0byBh
bnkgb2YgdGhlCisjICtwYXJ0aWVzIHdobyB3b3VsZCByZWNlaXZlIHRoZSBjb3ZlcmVkIHdvcmsg
ZnJvbSB5b3UsIGEgZGlzY3JpbWluYXRvcnkKKyMgK3BhdGVudCBsaWNlbnNlIChhKSBpbiBjb25u
ZWN0aW9uIHdpdGggY29waWVzIG9mIHRoZSBjb3ZlcmVkIHdvcmsKKyMgK2NvbnZleWVkIGJ5IHlv
dSAob3IgY29waWVzIG1hZGUgZnJvbSB0aG9zZSBjb3BpZXMpLCBvciAoYikgcHJpbWFyaWx5Cisj
ICtmb3IgYW5kIGluIGNvbm5lY3Rpb24gd2l0aCBzcGVjaWZpYyBwcm9kdWN0cyBvciBjb21waWxh
dGlvbnMgdGhhdAorIyArY29udGFpbiB0aGUgY292ZXJlZCB3b3JrLCB1bmxlc3MgeW91IGVudGVy
ZWQgaW50byB0aGF0IGFycmFuZ2VtZW50LAorIyArb3IgdGhhdCBwYXRlbnQgbGljZW5zZSB3YXMg
Z3JhbnRlZCwgcHJpb3IgdG8gMjggTWFyY2ggMjAwNy4KKyMgKworIyArICBOb3RoaW5nIGluIHRo
aXMgTGljZW5zZSBzaGFsbCBiZSBjb25zdHJ1ZWQgYXMgZXhjbHVkaW5nIG9yIGxpbWl0aW5nCisj
ICthbnkgaW1wbGllZCBsaWNlbnNlIG9yIG90aGVyIGRlZmVuc2VzIHRvIGluZnJpbmdlbWVudCB0
aGF0IG1heQorIyArb3RoZXJ3aXNlIGJlIGF2YWlsYWJsZSB0byB5b3UgdW5kZXIgYXBwbGljYWJs
ZSBwYXRlbnQgbGF3LgorIyArCisjICsgIDEyLiBObyBTdXJyZW5kZXIgb2YgT3RoZXJzJyBGcmVl
ZG9tLgorIyArCisjICsgIElmIGNvbmRpdGlvbnMgYXJlIGltcG9zZWQgb24geW91ICh3aGV0aGVy
IGJ5IGNvdXJ0IG9yZGVyLCBhZ3JlZW1lbnQgb3IKKyMgIG90aGVyd2lzZSkgdGhhdCBjb250cmFk
aWN0IHRoZSBjb25kaXRpb25zIG9mIHRoaXMgTGljZW5zZSwgdGhleSBkbyBub3QKKyMgLWV4Y3Vz
ZSB5b3UgZnJvbSB0aGUgY29uZGl0aW9ucyBvZiB0aGlzIExpY2Vuc2UuICBJZiB5b3UgY2Fubm90
CisjIC1kaXN0cmlidXRlIHNvIGFzIHRvIHNhdGlzZnkgc2ltdWx0YW5lb3VzbHkgeW91ciBvYmxp
Z2F0aW9ucyB1bmRlciB0aGlzCisjIC1MaWNlbnNlIGFuZCBhbnkgb3RoZXIgcGVydGluZW50IG9i
bGlnYXRpb25zLCB0aGVuIGFzIGEgY29uc2VxdWVuY2UgeW91CisjIC1tYXkgbm90IGRpc3RyaWJ1
dGUgdGhlIFByb2dyYW0gYXQgYWxsLiAgRm9yIGV4YW1wbGUsIGlmIGEgcGF0ZW50CisjIC1saWNl
bnNlIHdvdWxkIG5vdCBwZXJtaXQgcm95YWx0eS1mcmVlIHJlZGlzdHJpYnV0aW9uIG9mIHRoZSBQ
cm9ncmFtIGJ5CisjIC1hbGwgdGhvc2Ugd2hvIHJlY2VpdmUgY29waWVzIGRpcmVjdGx5IG9yIGlu
ZGlyZWN0bHkgdGhyb3VnaCB5b3UsIHRoZW4KKyMgLXRoZSBvbmx5IHdheSB5b3UgY291bGQgc2F0
aXNmeSBib3RoIGl0IGFuZCB0aGlzIExpY2Vuc2Ugd291bGQgYmUgdG8KKyMgLXJlZnJhaW4gZW50
aXJlbHkgZnJvbSBkaXN0cmlidXRpb24gb2YgdGhlIFByb2dyYW0uCisjIC0KKyMgLUlmIGFueSBw
b3J0aW9uIG9mIHRoaXMgc2VjdGlvbiBpcyBoZWxkIGludmFsaWQgb3IgdW5lbmZvcmNlYWJsZSB1
bmRlcgorIyAtYW55IHBhcnRpY3VsYXIgY2lyY3Vtc3RhbmNlLCB0aGUgYmFsYW5jZSBvZiB0aGUg
c2VjdGlvbiBpcyBpbnRlbmRlZCB0bworIyAtYXBwbHkgYW5kIHRoZSBzZWN0aW9uIGFzIGEgd2hv
bGUgaXMgaW50ZW5kZWQgdG8gYXBwbHkgaW4gb3RoZXIKKyMgLWNpcmN1bXN0YW5jZXMuCisjIC0K
KyMgLUl0IGlzIG5vdCB0aGUgcHVycG9zZSBvZiB0aGlzIHNlY3Rpb24gdG8gaW5kdWNlIHlvdSB0
byBpbmZyaW5nZSBhbnkKKyMgLXBhdGVudHMgb3Igb3RoZXIgcHJvcGVydHkgcmlnaHQgY2xhaW1z
IG9yIHRvIGNvbnRlc3QgdmFsaWRpdHkgb2YgYW55CisjIC1zdWNoIGNsYWltczsgdGhpcyBzZWN0
aW9uIGhhcyB0aGUgc29sZSBwdXJwb3NlIG9mIHByb3RlY3RpbmcgdGhlCisjIC1pbnRlZ3JpdHkg
b2YgdGhlIGZyZWUgc29mdHdhcmUgZGlzdHJpYnV0aW9uIHN5c3RlbSwgd2hpY2ggaXMKKyMgLWlt
cGxlbWVudGVkIGJ5IHB1YmxpYyBsaWNlbnNlIHByYWN0aWNlcy4gIE1hbnkgcGVvcGxlIGhhdmUg
bWFkZQorIyAtZ2VuZXJvdXMgY29udHJpYnV0aW9ucyB0byB0aGUgd2lkZSByYW5nZSBvZiBzb2Z0
d2FyZSBkaXN0cmlidXRlZAorIyAtdGhyb3VnaCB0aGF0IHN5c3RlbSBpbiByZWxpYW5jZSBvbiBj
b25zaXN0ZW50IGFwcGxpY2F0aW9uIG9mIHRoYXQKKyMgLXN5c3RlbTsgaXQgaXMgdXAgdG8gdGhl
IGF1dGhvci9kb25vciB0byBkZWNpZGUgaWYgaGUgb3Igc2hlIGlzIHdpbGxpbmcKKyMgLXRvIGRp
c3RyaWJ1dGUgc29mdHdhcmUgdGhyb3VnaCBhbnkgb3RoZXIgc3lzdGVtIGFuZCBhIGxpY2Vuc2Vl
IGNhbm5vdAorIyAtaW1wb3NlIHRoYXQgY2hvaWNlLgorIyAtCisjIC1UaGlzIHNlY3Rpb24gaXMg
aW50ZW5kZWQgdG8gbWFrZSB0aG9yb3VnaGx5IGNsZWFyIHdoYXQgaXMgYmVsaWV2ZWQgdG8KKyMg
LWJlIGEgY29uc2VxdWVuY2Ugb2YgdGhlIHJlc3Qgb2YgdGhpcyBMaWNlbnNlLgorIyAtCisjIC0g
IDguIElmIHRoZSBkaXN0cmlidXRpb24gYW5kL29yIHVzZSBvZiB0aGUgUHJvZ3JhbSBpcyByZXN0
cmljdGVkIGluCisjIC1jZXJ0YWluIGNvdW50cmllcyBlaXRoZXIgYnkgcGF0ZW50cyBvciBieSBj
b3B5cmlnaHRlZCBpbnRlcmZhY2VzLCB0aGUKKyMgLW9yaWdpbmFsIGNvcHlyaWdodCBob2xkZXIg
d2hvIHBsYWNlcyB0aGUgUHJvZ3JhbSB1bmRlciB0aGlzIExpY2Vuc2UKKyMgLW1heSBhZGQgYW4g
ZXhwbGljaXQgZ2VvZ3JhcGhpY2FsIGRpc3RyaWJ1dGlvbiBsaW1pdGF0aW9uIGV4Y2x1ZGluZwor
IyAtdGhvc2UgY291bnRyaWVzLCBzbyB0aGF0IGRpc3RyaWJ1dGlvbiBpcyBwZXJtaXR0ZWQgb25s
eSBpbiBvciBhbW9uZworIyAtY291bnRyaWVzIG5vdCB0aHVzIGV4Y2x1ZGVkLiAgSW4gc3VjaCBj
YXNlLCB0aGlzIExpY2Vuc2UgaW5jb3Jwb3JhdGVzCisjIC10aGUgbGltaXRhdGlvbiBhcyBpZiB3
cml0dGVuIGluIHRoZSBib2R5IG9mIHRoaXMgTGljZW5zZS4KKyMgLQorIyAtICA5LiBUaGUgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uIG1heSBwdWJsaXNoIHJldmlzZWQgYW5kL29yIG5ldyB2ZXJz
aW9ucworIyAtb2YgdGhlIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZnJvbSB0aW1lIHRvIHRpbWUu
ICBTdWNoIG5ldyB2ZXJzaW9ucyB3aWxsCisjICtleGN1c2UgeW91IGZyb20gdGhlIGNvbmRpdGlv
bnMgb2YgdGhpcyBMaWNlbnNlLiAgSWYgeW91IGNhbm5vdCBjb252ZXkgYQorIyArY292ZXJlZCB3
b3JrIHNvIGFzIHRvIHNhdGlzZnkgc2ltdWx0YW5lb3VzbHkgeW91ciBvYmxpZ2F0aW9ucyB1bmRl
ciB0aGlzCisjICtMaWNlbnNlIGFuZCBhbnkgb3RoZXIgcGVydGluZW50IG9ibGlnYXRpb25zLCB0
aGVuIGFzIGEgY29uc2VxdWVuY2UgeW91IG1heQorIyArbm90IGNvbnZleSBpdCBhdCBhbGwuICBG
b3IgZXhhbXBsZSwgaWYgeW91IGFncmVlIHRvIHRlcm1zIHRoYXQgb2JsaWdhdGUgeW91CisjICt0
byBjb2xsZWN0IGEgcm95YWx0eSBmb3IgZnVydGhlciBjb252ZXlpbmcgZnJvbSB0aG9zZSB0byB3
aG9tIHlvdSBjb252ZXkKKyMgK3RoZSBQcm9ncmFtLCB0aGUgb25seSB3YXkgeW91IGNvdWxkIHNh
dGlzZnkgYm90aCB0aG9zZSB0ZXJtcyBhbmQgdGhpcworIyArTGljZW5zZSB3b3VsZCBiZSB0byBy
ZWZyYWluIGVudGlyZWx5IGZyb20gY29udmV5aW5nIHRoZSBQcm9ncmFtLgorIyArCisjICsgIDEz
LiBVc2Ugd2l0aCB0aGUgR05VIEFmZmVybyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlLgorIyArCisj
ICsgIE5vdHdpdGhzdGFuZGluZyBhbnkgb3RoZXIgcHJvdmlzaW9uIG9mIHRoaXMgTGljZW5zZSwg
eW91IGhhdmUKKyMgK3Blcm1pc3Npb24gdG8gbGluayBvciBjb21iaW5lIGFueSBjb3ZlcmVkIHdv
cmsgd2l0aCBhIHdvcmsgbGljZW5zZWQKKyMgK3VuZGVyIHZlcnNpb24gMyBvZiB0aGUgR05VIEFm
ZmVybyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGludG8gYSBzaW5nbGUKKyMgK2NvbWJpbmVkIHdv
cmssIGFuZCB0byBjb252ZXkgdGhlIHJlc3VsdGluZyB3b3JrLiAgVGhlIHRlcm1zIG9mIHRoaXMK
KyMgK0xpY2Vuc2Ugd2lsbCBjb250aW51ZSB0byBhcHBseSB0byB0aGUgcGFydCB3aGljaCBpcyB0
aGUgY292ZXJlZCB3b3JrLAorIyArYnV0IHRoZSBzcGVjaWFsIHJlcXVpcmVtZW50cyBvZiB0aGUg
R05VIEFmZmVybyBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlLAorIyArc2VjdGlvbiAxMywgY29uY2Vy
bmluZyBpbnRlcmFjdGlvbiB0aHJvdWdoIGEgbmV0d29yayB3aWxsIGFwcGx5IHRvIHRoZQorIyAr
Y29tYmluYXRpb24gYXMgc3VjaC4KKyMgKworIyArICAxNC4gUmV2aXNlZCBWZXJzaW9ucyBvZiB0
aGlzIExpY2Vuc2UuCisjICsKKyMgKyAgVGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiBtYXkg
cHVibGlzaCByZXZpc2VkIGFuZC9vciBuZXcgdmVyc2lvbnMgb2YKKyMgK3RoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBmcm9tIHRpbWUgdG8gdGltZS4gIFN1Y2ggbmV3IHZlcnNpb25zIHdp
bGwKKyMgIGJlIHNpbWlsYXIgaW4gc3Bpcml0IHRvIHRoZSBwcmVzZW50IHZlcnNpb24sIGJ1dCBt
YXkgZGlmZmVyIGluIGRldGFpbCB0bworIyAgYWRkcmVzcyBuZXcgcHJvYmxlbXMgb3IgY29uY2Vy
bnMuCisjICAKKyMgLUVhY2ggdmVyc2lvbiBpcyBnaXZlbiBhIGRpc3Rpbmd1aXNoaW5nIHZlcnNp
b24gbnVtYmVyLiAgSWYgdGhlIFByb2dyYW0KKyMgLXNwZWNpZmllcyBhIHZlcnNpb24gbnVtYmVy
IG9mIHRoaXMgTGljZW5zZSB3aGljaCBhcHBsaWVzIHRvIGl0IGFuZCAiYW55CisjIC1sYXRlciB2
ZXJzaW9uIiwgeW91IGhhdmUgdGhlIG9wdGlvbiBvZiBmb2xsb3dpbmcgdGhlIHRlcm1zIGFuZCBj
b25kaXRpb25zCisjIC1laXRoZXIgb2YgdGhhdCB2ZXJzaW9uIG9yIG9mIGFueSBsYXRlciB2ZXJz
aW9uIHB1Ymxpc2hlZCBieSB0aGUgRnJlZQorIyAtU29mdHdhcmUgRm91bmRhdGlvbi4gIElmIHRo
ZSBQcm9ncmFtIGRvZXMgbm90IHNwZWNpZnkgYSB2ZXJzaW9uIG51bWJlciBvZgorIyAtdGhpcyBM
aWNlbnNlLCB5b3UgbWF5IGNob29zZSBhbnkgdmVyc2lvbiBldmVyIHB1Ymxpc2hlZCBieSB0aGUg
RnJlZSBTb2Z0d2FyZQorIyAtRm91bmRhdGlvbi4KKyMgLQorIyAtICAxMC4gSWYgeW91IHdpc2gg
dG8gaW5jb3Jwb3JhdGUgcGFydHMgb2YgdGhlIFByb2dyYW0gaW50byBvdGhlciBmcmVlCisjIC1w
cm9ncmFtcyB3aG9zZSBkaXN0cmlidXRpb24gY29uZGl0aW9ucyBhcmUgZGlmZmVyZW50LCB3cml0
ZSB0byB0aGUgYXV0aG9yCisjIC10byBhc2sgZm9yIHBlcm1pc3Npb24uICBGb3Igc29mdHdhcmUg
d2hpY2ggaXMgY29weXJpZ2h0ZWQgYnkgdGhlIEZyZWUKKyMgLVNvZnR3YXJlIEZvdW5kYXRpb24s
IHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IHdlIHNvbWV0aW1lcworIyAt
bWFrZSBleGNlcHRpb25zIGZvciB0aGlzLiAgT3VyIGRlY2lzaW9uIHdpbGwgYmUgZ3VpZGVkIGJ5
IHRoZSB0d28gZ29hbHMKKyMgLW9mIHByZXNlcnZpbmcgdGhlIGZyZWUgc3RhdHVzIG9mIGFsbCBk
ZXJpdmF0aXZlcyBvZiBvdXIgZnJlZSBzb2Z0d2FyZSBhbmQKKyMgLW9mIHByb21vdGluZyB0aGUg
c2hhcmluZyBhbmQgcmV1c2Ugb2Ygc29mdHdhcmUgZ2VuZXJhbGx5LgorIyAtCisjIC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgTk8gV0FSUkFOVFkKKyMgLQorIyAtICAxMS4gQkVDQVVTRSBU
SEUgUFJPR1JBTSBJUyBMSUNFTlNFRCBGUkVFIE9GIENIQVJHRSwgVEhFUkUgSVMgTk8gV0FSUkFO
VFkKKyMgLUZPUiBUSEUgUFJPR1JBTSwgVE8gVEhFIEVYVEVOVCBQRVJNSVRURUQgQlkgQVBQTElD
QUJMRSBMQVcuICBFWENFUFQgV0hFTgorIyAtT1RIRVJXSVNFIFNUQVRFRCBJTiBXUklUSU5HIFRI
RSBDT1BZUklHSFQgSE9MREVSUyBBTkQvT1IgT1RIRVIgUEFSVElFUworIyAtUFJPVklERSBUSEUg
UFJPR1JBTSAiQVMgSVMiIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsIEVJVEhFUiBFWFBS
RVNTRUQKKyMgLU9SIElNUExJRUQsIElOQ0xVRElORywgQlVUIE5PVCBMSU1JVEVEIFRPLCBUSEUg
SU1QTElFRCBXQVJSQU5USUVTIE9GCisjIC1NRVJDSEFOVEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9S
IEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgVEhFIEVOVElSRSBSSVNLIEFTCisjIC1UTyBUSEUgUVVB
TElUWSBBTkQgUEVSRk9STUFOQ0UgT0YgVEhFIFBST0dSQU0gSVMgV0lUSCBZT1UuICBTSE9VTEQg
VEhFCisjIC1QUk9HUkFNIFBST1ZFIERFRkVDVElWRSwgWU9VIEFTU1VNRSBUSEUgQ09TVCBPRiBB
TEwgTkVDRVNTQVJZIFNFUlZJQ0lORywKKyMgLVJFUEFJUiBPUiBDT1JSRUNUSU9OLgorIyAtCisj
IC0gIDEyLiBJTiBOTyBFVkVOVCBVTkxFU1MgUkVRVUlSRUQgQlkgQVBQTElDQUJMRSBMQVcgT1Ig
QUdSRUVEIFRPIElOIFdSSVRJTkcKKyMgLVdJTEwgQU5ZIENPUFlSSUdIVCBIT0xERVIsIE9SIEFO
WSBPVEhFUiBQQVJUWSBXSE8gTUFZIE1PRElGWSBBTkQvT1IKKyMgLVJFRElTVFJJQlVURSBUSEUg
UFJPR1JBTSBBUyBQRVJNSVRURUQgQUJPVkUsIEJFIExJQUJMRSBUTyBZT1UgRk9SIERBTUFHRVMs
CisjIC1JTkNMVURJTkcgQU5ZIEdFTkVSQUwsIFNQRUNJQUwsIElOQ0lERU5UQUwgT1IgQ09OU0VR
VUVOVElBTCBEQU1BR0VTIEFSSVNJTkcKKyMgLU9VVCBPRiBUSEUgVVNFIE9SIElOQUJJTElUWSBU
TyBVU0UgVEhFIFBST0dSQU0gKElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQKKyMgLVRPIExPU1Mg
T0YgREFUQSBPUiBEQVRBIEJFSU5HIFJFTkRFUkVEIElOQUNDVVJBVEUgT1IgTE9TU0VTIFNVU1RB
SU5FRCBCWQorIyAtWU9VIE9SIFRISVJEIFBBUlRJRVMgT1IgQSBGQUlMVVJFIE9GIFRIRSBQUk9H
UkFNIFRPIE9QRVJBVEUgV0lUSCBBTlkgT1RIRVIKKyMgLVBST0dSQU1TKSwgRVZFTiBJRiBTVUNI
IEhPTERFUiBPUiBPVEhFUiBQQVJUWSBIQVMgQkVFTiBBRFZJU0VEIE9GIFRIRQorIyAtUE9TU0lC
SUxJVFkgT0YgU1VDSCBEQU1BR0VTLgorIyArICBFYWNoIHZlcnNpb24gaXMgZ2l2ZW4gYSBkaXN0
aW5ndWlzaGluZyB2ZXJzaW9uIG51bWJlci4gIElmIHRoZQorIyArUHJvZ3JhbSBzcGVjaWZpZXMg
dGhhdCBhIGNlcnRhaW4gbnVtYmVyZWQgdmVyc2lvbiBvZiB0aGUgR05VIEdlbmVyYWwKKyMgK1B1
YmxpYyBMaWNlbnNlICJvciBhbnkgbGF0ZXIgdmVyc2lvbiIgYXBwbGllcyB0byBpdCwgeW91IGhh
dmUgdGhlCisjICtvcHRpb24gb2YgZm9sbG93aW5nIHRoZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBl
aXRoZXIgb2YgdGhhdCBudW1iZXJlZAorIyArdmVyc2lvbiBvciBvZiBhbnkgbGF0ZXIgdmVyc2lv
biBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUKKyMgK0ZvdW5kYXRpb24uICBJZiB0aGUg
UHJvZ3JhbSBkb2VzIG5vdCBzcGVjaWZ5IGEgdmVyc2lvbiBudW1iZXIgb2YgdGhlCisjICtHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSwgeW91IG1heSBjaG9vc2UgYW55IHZlcnNpb24gZXZlciBw
dWJsaXNoZWQKKyMgK2J5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uCisjICsKKyMgKyAg
SWYgdGhlIFByb2dyYW0gc3BlY2lmaWVzIHRoYXQgYSBwcm94eSBjYW4gZGVjaWRlIHdoaWNoIGZ1
dHVyZQorIyArdmVyc2lvbnMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGNhbiBi
ZSB1c2VkLCB0aGF0IHByb3h5J3MKKyMgK3B1YmxpYyBzdGF0ZW1lbnQgb2YgYWNjZXB0YW5jZSBv
ZiBhIHZlcnNpb24gcGVybWFuZW50bHkgYXV0aG9yaXplcyB5b3UKKyMgK3RvIGNob29zZSB0aGF0
IHZlcnNpb24gZm9yIHRoZSBQcm9ncmFtLgorIyArCisjICsgIExhdGVyIGxpY2Vuc2UgdmVyc2lv
bnMgbWF5IGdpdmUgeW91IGFkZGl0aW9uYWwgb3IgZGlmZmVyZW50CisjICtwZXJtaXNzaW9ucy4g
IEhvd2V2ZXIsIG5vIGFkZGl0aW9uYWwgb2JsaWdhdGlvbnMgYXJlIGltcG9zZWQgb24gYW55Cisj
ICthdXRob3Igb3IgY29weXJpZ2h0IGhvbGRlciBhcyBhIHJlc3VsdCBvZiB5b3VyIGNob29zaW5n
IHRvIGZvbGxvdyBhCisjICtsYXRlciB2ZXJzaW9uLgorIyArCisjICsgIDE1LiBEaXNjbGFpbWVy
IG9mIFdhcnJhbnR5LgorIyArCisjICsgIFRIRVJFIElTIE5PIFdBUlJBTlRZIEZPUiBUSEUgUFJP
R1JBTSwgVE8gVEhFIEVYVEVOVCBQRVJNSVRURUQgQlkKKyMgK0FQUExJQ0FCTEUgTEFXLiAgRVhD
RVBUIFdIRU4gT1RIRVJXSVNFIFNUQVRFRCBJTiBXUklUSU5HIFRIRSBDT1BZUklHSFQKKyMgK0hP
TERFUlMgQU5EL09SIE9USEVSIFBBUlRJRVMgUFJPVklERSBUSEUgUFJPR1JBTSAiQVMgSVMiIFdJ
VEhPVVQgV0FSUkFOVFkKKyMgK09GIEFOWSBLSU5ELCBFSVRIRVIgRVhQUkVTU0VEIE9SIElNUExJ
RUQsIElOQ0xVRElORywgQlVUIE5PVCBMSU1JVEVEIFRPLAorIyArVEhFIElNUExJRUQgV0FSUkFO
VElFUyBPRiBNRVJDSEFOVEFCSUxJVFkgQU5EIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUgorIyAr
UFVSUE9TRS4gIFRIRSBFTlRJUkUgUklTSyBBUyBUTyBUSEUgUVVBTElUWSBBTkQgUEVSRk9STUFO
Q0UgT0YgVEhFIFBST0dSQU0KKyMgK0lTIFdJVEggWU9VLiAgU0hPVUxEIFRIRSBQUk9HUkFNIFBS
T1ZFIERFRkVDVElWRSwgWU9VIEFTU1VNRSBUSEUgQ09TVCBPRgorIyArQUxMIE5FQ0VTU0FSWSBT
RVJWSUNJTkcsIFJFUEFJUiBPUiBDT1JSRUNUSU9OLgorIyArCisjICsgIDE2LiBMaW1pdGF0aW9u
IG9mIExpYWJpbGl0eS4KKyMgKworIyArICBJTiBOTyBFVkVOVCBVTkxFU1MgUkVRVUlSRUQgQlkg
QVBQTElDQUJMRSBMQVcgT1IgQUdSRUVEIFRPIElOIFdSSVRJTkcKKyMgK1dJTEwgQU5ZIENPUFlS
SUdIVCBIT0xERVIsIE9SIEFOWSBPVEhFUiBQQVJUWSBXSE8gTU9ESUZJRVMgQU5EL09SIENPTlZF
WVMKKyMgK1RIRSBQUk9HUkFNIEFTIFBFUk1JVFRFRCBBQk9WRSwgQkUgTElBQkxFIFRPIFlPVSBG
T1IgREFNQUdFUywgSU5DTFVESU5HIEFOWQorIyArR0VORVJBTCwgU1BFQ0lBTCwgSU5DSURFTlRB
TCBPUiBDT05TRVFVRU5USUFMIERBTUFHRVMgQVJJU0lORyBPVVQgT0YgVEhFCisjICtVU0UgT1Ig
SU5BQklMSVRZIFRPIFVTRSBUSEUgUFJPR1JBTSAoSU5DTFVESU5HIEJVVCBOT1QgTElNSVRFRCBU
TyBMT1NTIE9GCisjICtEQVRBIE9SIERBVEEgQkVJTkcgUkVOREVSRUQgSU5BQ0NVUkFURSBPUiBM
T1NTRVMgU1VTVEFJTkVEIEJZIFlPVSBPUiBUSElSRAorIyArUEFSVElFUyBPUiBBIEZBSUxVUkUg
T0YgVEhFIFBST0dSQU0gVE8gT1BFUkFURSBXSVRIIEFOWSBPVEhFUiBQUk9HUkFNUyksCisjICtF
VkVOIElGIFNVQ0ggSE9MREVSIE9SIE9USEVSIFBBUlRZIEhBUyBCRUVOIEFEVklTRUQgT0YgVEhF
IFBPU1NJQklMSVRZIE9GCisjICtTVUNIIERBTUFHRVMuCisjICsKKyMgKyAgMTcuIEludGVycHJl
dGF0aW9uIG9mIFNlY3Rpb25zIDE1IGFuZCAxNi4KKyMgKworIyArICBJZiB0aGUgZGlzY2xhaW1l
ciBvZiB3YXJyYW50eSBhbmQgbGltaXRhdGlvbiBvZiBsaWFiaWxpdHkgcHJvdmlkZWQKKyMgK2Fi
b3ZlIGNhbm5vdCBiZSBnaXZlbiBsb2NhbCBsZWdhbCBlZmZlY3QgYWNjb3JkaW5nIHRvIHRoZWly
IHRlcm1zLAorIyArcmV2aWV3aW5nIGNvdXJ0cyBzaGFsbCBhcHBseSBsb2NhbCBsYXcgdGhhdCBt
b3N0IGNsb3NlbHkgYXBwcm94aW1hdGVzCisjICthbiBhYnNvbHV0ZSB3YWl2ZXIgb2YgYWxsIGNp
dmlsIGxpYWJpbGl0eSBpbiBjb25uZWN0aW9uIHdpdGggdGhlCisjICtQcm9ncmFtLCB1bmxlc3Mg
YSB3YXJyYW50eSBvciBhc3N1bXB0aW9uIG9mIGxpYWJpbGl0eSBhY2NvbXBhbmllcyBhCisjICtj
b3B5IG9mIHRoZSBQcm9ncmFtIGluIHJldHVybiBmb3IgYSBmZWUuCisjICAKKyMgICAgICAgICAg
ICAgICAgICAgICAgIEVORCBPRiBURVJNUyBBTkQgQ09ORElUSU9OUworIyAgCisjIEBAIC0yODcs
MTUgKzYyOCwxNSBAQAorIyAgCisjICAgIFRvIGRvIHNvLCBhdHRhY2ggdGhlIGZvbGxvd2luZyBu
b3RpY2VzIHRvIHRoZSBwcm9ncmFtLiAgSXQgaXMgc2FmZXN0CisjICB0byBhdHRhY2ggdGhlbSB0
byB0aGUgc3RhcnQgb2YgZWFjaCBzb3VyY2UgZmlsZSB0byBtb3N0IGVmZmVjdGl2ZWx5CisjIC1j
b252ZXkgdGhlIGV4Y2x1c2lvbiBvZiB3YXJyYW50eTsgYW5kIGVhY2ggZmlsZSBzaG91bGQgaGF2
ZSBhdCBsZWFzdAorIyArc3RhdGUgdGhlIGV4Y2x1c2lvbiBvZiB3YXJyYW50eTsgYW5kIGVhY2gg
ZmlsZSBzaG91bGQgaGF2ZSBhdCBsZWFzdAorIyAgdGhlICJjb3B5cmlnaHQiIGxpbmUgYW5kIGEg
cG9pbnRlciB0byB3aGVyZSB0aGUgZnVsbCBub3RpY2UgaXMgZm91bmQuCisjICAKKyMgICAgICA8
b25lIGxpbmUgdG8gZ2l2ZSB0aGUgcHJvZ3JhbSdzIG5hbWUgYW5kIGEgYnJpZWYgaWRlYSBvZiB3
aGF0IGl0IGRvZXMuPgorIyAgICAgIENvcHlyaWdodCAoQykgPHllYXI+ICA8bmFtZSBvZiBhdXRo
b3I+CisjICAKKyMgLSAgICBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiBy
ZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorIyArICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVl
IHNvZnR3YXJlOiB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisjICAgICAg
aXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBw
dWJsaXNoZWQgYnkKKyMgLSAgICB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIg
dmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgorIyArICAgIHRoZSBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb24sIGVpdGhlciB2ZXJzaW9uIDMgb2YgdGhlIExpY2Vuc2UsIG9yCisjICAgICAgKGF0
IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KKyMgIAorIyAgICAgIFRoaXMgcHJvZ3Jh
bSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorIyBA
QCAtMzAzLDM3ICs2NDQsMzEgQEAKKyMgICAgICBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBG
T1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCisjICAgICAgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMgIAorIyAtICAgIFlvdSBzaG91bGQgaGF2
ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFsb25n
CisjIC0gICAgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29m
dHdhcmUgRm91bmRhdGlvbiwgSW5jLiwKKyMgLSAgICA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRo
IEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBLgorIyArICAgIFlvdSBzaG91bGQgaGF2
ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisjICsg
ICAgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW0uICBJZiBub3QsIHNlZSA8aHR0cHM6Ly93d3cuZ251
Lm9yZy9saWNlbnNlcy8+LgorIyAgCisjICBBbHNvIGFkZCBpbmZvcm1hdGlvbiBvbiBob3cgdG8g
Y29udGFjdCB5b3UgYnkgZWxlY3Ryb25pYyBhbmQgcGFwZXIgbWFpbC4KKyMgIAorIyAtSWYgdGhl
IHByb2dyYW0gaXMgaW50ZXJhY3RpdmUsIG1ha2UgaXQgb3V0cHV0IGEgc2hvcnQgbm90aWNlIGxp
a2UgdGhpcworIyAtd2hlbiBpdCBzdGFydHMgaW4gYW4gaW50ZXJhY3RpdmUgbW9kZToKKyMgLQor
IyAtICAgIEdub21vdmlzaW9uIHZlcnNpb24gNjksIENvcHlyaWdodCAoQykgeWVhciBuYW1lIG9m
IGF1dGhvcgorIyAtICAgIEdub21vdmlzaW9uIGNvbWVzIHdpdGggQUJTT0xVVEVMWSBOTyBXQVJS
QU5UWTsgZm9yIGRldGFpbHMgdHlwZSBgc2hvdyB3Jy4KKyMgKyAgSWYgdGhlIHByb2dyYW0gZG9l
cyB0ZXJtaW5hbCBpbnRlcmFjdGlvbiwgbWFrZSBpdCBvdXRwdXQgYSBzaG9ydAorIyArbm90aWNl
IGxpa2UgdGhpcyB3aGVuIGl0IHN0YXJ0cyBpbiBhbiBpbnRlcmFjdGl2ZSBtb2RlOgorIyArCisj
ICsgICAgPHByb2dyYW0+ICBDb3B5cmlnaHQgKEMpIDx5ZWFyPiAgPG5hbWUgb2YgYXV0aG9yPgor
IyArICAgIFRoaXMgcHJvZ3JhbSBjb21lcyB3aXRoIEFCU09MVVRFTFkgTk8gV0FSUkFOVFk7IGZv
ciBkZXRhaWxzIHR5cGUgYHNob3cgdycuCisjICAgICAgVGhpcyBpcyBmcmVlIHNvZnR3YXJlLCBh
bmQgeW91IGFyZSB3ZWxjb21lIHRvIHJlZGlzdHJpYnV0ZSBpdAorIyAgICAgIHVuZGVyIGNlcnRh
aW4gY29uZGl0aW9uczsgdHlwZSBgc2hvdyBjJyBmb3IgZGV0YWlscy4KKyMgIAorIyAgVGhlIGh5
cG90aGV0aWNhbCBjb21tYW5kcyBgc2hvdyB3JyBhbmQgYHNob3cgYycgc2hvdWxkIHNob3cgdGhl
IGFwcHJvcHJpYXRlCisjIC1wYXJ0cyBvZiB0aGUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZS4gIE9m
IGNvdXJzZSwgdGhlIGNvbW1hbmRzIHlvdSB1c2UgbWF5CisjIC1iZSBjYWxsZWQgc29tZXRoaW5n
IG90aGVyIHRoYW4gYHNob3cgdycgYW5kIGBzaG93IGMnOyB0aGV5IGNvdWxkIGV2ZW4gYmUKKyMg
LW1vdXNlLWNsaWNrcyBvciBtZW51IGl0ZW1zLS13aGF0ZXZlciBzdWl0cyB5b3VyIHByb2dyYW0u
CisjIC0KKyMgLVlvdSBzaG91bGQgYWxzbyBnZXQgeW91ciBlbXBsb3llciAoaWYgeW91IHdvcmsg
YXMgYSBwcm9ncmFtbWVyKSBvciB5b3VyCisjIC1zY2hvb2wsIGlmIGFueSwgdG8gc2lnbiBhICJj
b3B5cmlnaHQgZGlzY2xhaW1lciIgZm9yIHRoZSBwcm9ncmFtLCBpZgorIyAtbmVjZXNzYXJ5LiAg
SGVyZSBpcyBhIHNhbXBsZTsgYWx0ZXIgdGhlIG5hbWVzOgorIyAtCisjIC0gIFlveW9keW5lLCBJ
bmMuLCBoZXJlYnkgZGlzY2xhaW1zIGFsbCBjb3B5cmlnaHQgaW50ZXJlc3QgaW4gdGhlIHByb2dy
YW0KKyMgLSAgYEdub21vdmlzaW9uJyAod2hpY2ggbWFrZXMgcGFzc2VzIGF0IGNvbXBpbGVycykg
d3JpdHRlbiBieSBKYW1lcyBIYWNrZXIuCisjIC0KKyMgLSAgPHNpZ25hdHVyZSBvZiBUeSBDb29u
PiwgMSBBcHJpbCAxOTg5CisjIC0gIFR5IENvb24sIFByZXNpZGVudCBvZiBWaWNlCisjIC0KKyMg
LVRoaXMgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBkb2VzIG5vdCBwZXJtaXQgaW5jb3Jwb3JhdGlu
ZyB5b3VyIHByb2dyYW0gaW50bworIyAtcHJvcHJpZXRhcnkgcHJvZ3JhbXMuICBJZiB5b3VyIHBy
b2dyYW0gaXMgYSBzdWJyb3V0aW5lIGxpYnJhcnksIHlvdSBtYXkKKyMgLWNvbnNpZGVyIGl0IG1v
cmUgdXNlZnVsIHRvIHBlcm1pdCBsaW5raW5nIHByb3ByaWV0YXJ5IGFwcGxpY2F0aW9ucyB3aXRo
IHRoZQorIyAtbGlicmFyeS4gIElmIHRoaXMgaXMgd2hhdCB5b3Ugd2FudCB0byBkbywgdXNlIHRo
ZSBHTlUgTGVzc2VyIEdlbmVyYWwKKyMgLVB1YmxpYyBMaWNlbnNlIGluc3RlYWQgb2YgdGhpcyBM
aWNlbnNlLgorIyArcGFydHMgb2YgdGhlIEdlbmVyYWwgUHVibGljIExpY2Vuc2UuICBPZiBjb3Vy
c2UsIHlvdXIgcHJvZ3JhbSdzIGNvbW1hbmRzCisjICttaWdodCBiZSBkaWZmZXJlbnQ7IGZvciBh
IEdVSSBpbnRlcmZhY2UsIHlvdSB3b3VsZCB1c2UgYW4gImFib3V0IGJveCIuCisjICsKKyMgKyAg
WW91IHNob3VsZCBhbHNvIGdldCB5b3VyIGVtcGxveWVyIChpZiB5b3Ugd29yayBhcyBhIHByb2dy
YW1tZXIpIG9yIHNjaG9vbCwKKyMgK2lmIGFueSwgdG8gc2lnbiBhICJjb3B5cmlnaHQgZGlzY2xh
aW1lciIgZm9yIHRoZSBwcm9ncmFtLCBpZiBuZWNlc3NhcnkuCisjICtGb3IgbW9yZSBpbmZvcm1h
dGlvbiBvbiB0aGlzLCBhbmQgaG93IHRvIGFwcGx5IGFuZCBmb2xsb3cgdGhlIEdOVSBHUEwsIHNl
ZQorIyArPGh0dHBzOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyMgKworIyArICBUaGUgR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZG9lcyBub3QgcGVybWl0IGluY29ycG9yYXRpbmcgeW91
ciBwcm9ncmFtCisjICtpbnRvIHByb3ByaWV0YXJ5IHByb2dyYW1zLiAgSWYgeW91ciBwcm9ncmFt
IGlzIGEgc3Vicm91dGluZSBsaWJyYXJ5LCB5b3UKKyMgK21heSBjb25zaWRlciBpdCBtb3JlIHVz
ZWZ1bCB0byBwZXJtaXQgbGlua2luZyBwcm9wcmlldGFyeSBhcHBsaWNhdGlvbnMgd2l0aAorIyAr
dGhlIGxpYnJhcnkuICBJZiB0aGlzIGlzIHdoYXQgeW91IHdhbnQgdG8gZG8sIHVzZSB0aGUgR05V
IExlc3NlciBHZW5lcmFsCisjICtQdWJsaWMgTGljZW5zZSBpbnN0ZWFkIG9mIHRoaXMgTGljZW5z
ZS4gIEJ1dCBmaXJzdCwgcGxlYXNlIHJlYWQKKyMgKzxodHRwczovL3d3dy5nbnUub3JnL2xpY2Vu
c2VzL3doeS1ub3QtbGdwbC5odG1sPi4KKyMgLS0tIGluY2x1ZGUvcHViX3Rvb2xfYmFzaWNzLmgK
KyMgKysrIGluY2x1ZGUvcHViX3Rvb2xfYmFzaWNzLmgKKyMgQEAgLTcsNyArNyw3IEBACisjICAK
KyMgICAgIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3IKKyMgICAgIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBH
ZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzCisjIC0gICBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29m
dHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUKKyMgKyAgIHB1Ymxpc2hl
ZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAzIG9mIHRo
ZQorIyAgICAgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4K
KyMgIAorIyAgICAgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQg
aXQgd2lsbCBiZSB1c2VmdWwsIGJ1dAorIyAtLS0gaW5jbHVkZS92YWxncmluZC5oCisjICsrKyBp
bmNsdWRlL3ZhbGdyaW5kLmgKKyMgQEAgLTMsNyArMyw3IEBACisjICAKKyMgICAgIE5vdGljZSB0
aGF0IHRoZSBmb2xsb3dpbmcgQlNELXN0eWxlIGxpY2Vuc2UgYXBwbGllcyB0byB0aGlzIG9uZQor
IyAgICAgZmlsZSAodmFsZ3JpbmQuaCkgb25seS4gIFRoZSByZXN0IG9mIFZhbGdyaW5kIGlzIGxp
Y2Vuc2VkIHVuZGVyIHRoZQorIyAtICAgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlLCB2ZXJzaW9uIDIsIHVubGVzcworIyArICAgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlLCB2ZXJzaW9uIDMsIHVubGVzcworIyAgICAgb3RoZXJ3aXNlIGluZGlj
YXRlZC4gIFNlZSB0aGUgQ09QWUlORyBmaWxlIGluIHRoZSBzb3VyY2UKKyMgICAgIGRpc3RyaWJ1
dGlvbiBmb3IgZGV0YWlscy4KKyMgIAorIyBAQCAtNDksNyArNDksNyBAQAorIyAgCisjICAgICBO
b3RpY2UgdGhhdCB0aGUgYWJvdmUgQlNELXN0eWxlIGxpY2Vuc2UgYXBwbGllcyB0byB0aGlzIG9u
ZSBmaWxlCisjICAgICAodmFsZ3JpbmQuaCkgb25seS4gIFRoZSBlbnRpcmUgcmVzdCBvZiBWYWxn
cmluZCBpcyBsaWNlbnNlZCB1bmRlcgorIyAtICAgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSwgdmVyc2lvbiAyLiAgU2VlIHRoZQorIyArICAgdGhlIHRlcm1zIG9m
IHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSwgdmVyc2lvbiAzLiAgU2VlIHRoZQorIyAg
ICAgQ09QWUlORyBmaWxlIGluIHRoZSBzb3VyY2UgZGlzdHJpYnV0aW9uIGZvciBkZXRhaWxzLgor
IyAgCisjICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tIAorIyAKKyMKKworU1VNTUFSWSA9ICJWYWxncmluZCBtZW1vcnkg
ZGVidWdnZXIgYW5kIGluc3RydW1lbnRhdGlvbiBmcmFtZXdvcmsiCitIT01FUEFHRSA9ICJodHRw
Oi8vdmFsZ3JpbmQub3JnLyIKK0RFU0NSSVBUSU9OID0gIlZhbGdyaW5kIGlzIGFuIGluc3RydW1l
bnRhdGlvbiBmcmFtZXdvcmsgZm9yIGJ1aWxkaW5nIGR5bmFtaWMgYW5hbHlzaXMgdG9vbHMuIFRo
ZXJlIGFyZSBWYWxncmluZCB0b29scyB0aGF0IGNhbiBhdXRvbWF0aWNhbGx5IGRldGVjdCBtYW55
IG1lbW9yeSBtYW5hZ2VtZW50IGFuZCB0aHJlYWRpbmcgYnVncywgYW5kIHByb2ZpbGUgeW91ciBw
cm9ncmFtcyBpbiBkZXRhaWwuIgorQlVHVFJBQ0tFUiA9ICJodHRwOi8vdmFsZ3JpbmQub3JnL3N1
cHBvcnQvYnVnX3JlcG9ydHMuaHRtbCIKK0xJQ0VOU0UgPSAiR1BMLTIuMC1vbmx5ICYgR1BMLTIu
MC1vci1sYXRlciAmIEJTRC0zLUNsYXVzZSIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PTFlYmJkM2UzNDIzN2FmMjZkYTVkYzA4YTRlNDQwNDY0IFwKKyAgICAgICAgICAg
ICAgICAgICAgZmlsZTovL2luY2x1ZGUvcHViX3Rvb2xfYmFzaWNzLmg7YmVnaW5saW5lPTY7ZW5k
bGluZT0yOTttZDU9OWJhNDQ5ZDEyMGY2ODQ1ZTZhNDMyMDczMjc4ZDZlM2EgXAorICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vaW5jbHVkZS92YWxncmluZC5oO2JlZ2lubGluZT0xO2VuZGxpbmU9
NTY7bWQ1PTk5MzU2M2FhYTEyMjU1OGRmOWM1ZDc0M2RlMDc0ZDA0IFwKKyAgICAgICAgICAgICAg
ICAgICAgZmlsZTovL0NPUFlJTkcuRE9DUzttZDU9MjRlYTRjNzA5MjIzMzg0OWI0Mzk0Njk5MzMz
YjVjNTYgXAorICAgICAgICAgICAgICAgICAgICAiCisKK1NSQ19VUkkgPSAiaHR0cHM6Ly9zb3Vy
Y2V3YXJlLm9yZy9wdWIvdmFsZ3JpbmQvdmFsZ3JpbmQtJHtQVn0udGFyLmJ6MiBcCisgICAgICAg
ICAgIGZpbGU6Ly9maXhlZC1wZXJsLXBhdGgucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vQWRk
ZWQtc3VwcG9ydC1mb3ItUFBDLWluc3RydWN0aW9ucy1tZmF0YnUtbWZhdGJsLnBhdGNoIFwKKyAg
ICAgICAgICAgZmlsZTovL3VzZS1hcHByb3ByaWF0ZS1tYXJjaC1tY3B1LW1mcHUtZm9yLUFSTS10
ZXN0LWFwcHMucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vYXZvaWQtbmVvbi1mb3ItdGFyZ2V0
cy13aGljaC1kb24tdC1zdXBwb3J0LWl0LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEt
Y29uZmlndXJlLURyb3Atc2V0dGluZy1tY3B1LWNvcnRleC1hOC1vbi1hcm0ucGF0Y2ggXAorICAg
ICAgICAgICBmaWxlOi8vdmFsZ3JpbmQtbWFrZS1sZC1YWFguc28tc3RybGVuLWludGVyY2VwdC1v
cHRpb25hbC5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLW1ha2VmaWxlcy1Ecm9wLXNl
dHRpbmctbWNwdS10by1jb3J0ZXgtYTgtb24tYXJtLWFyY2gucGF0Y2ggXAorICAgICAgICAgICBm
aWxlOi8vMDAwMS1zaWdxdWV1ZS1SZW5hbWUtX3NpZmllbGRzLXRvLV9fc2lfZmllbGRzLW9uLW11
c2wucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwMy1jb3JyZWN0LWluY2x1ZGUtZGlyZWN0
aXZlLXBhdGgtZm9yLWNvbmZpZy5oLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEtdmFs
Z3JpbmQtZmlsdGVyX3htbF9mcmFtZXMtZG8tbm90LWZpbHRlci11c3IucGF0Y2ggXAorICAgICAg
ICAgICBmaWxlOi8vMDAwMS1tZW1jaGVjay12Z3Rlc3RzLXJlbW92ZS1mdWxscGF0aC1hZnRlci1m
bGFncy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly9zMzkweF92ZWNfb3BfdC5wYXRjaCBcCisg
ICAgICAgICAgIGZpbGU6Ly8wMDAxLW5vbmUtdGVzdHMtZmRsZWFrX2Ntc2cuc3RkZXJyLmV4cC1h
ZGp1c3QtdG1wLXBhdGhzLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEtbWVtY2hlY2st
dGVzdHMtRml4LXRpbWVyZmQtc3lzY2FsbC10ZXN0LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTov
LzAwMDEtZG9jcy1EaXNhYmxlLW1hbnVhbC12YWxpZGF0aW9uLnBhdGNoIFwKKyAgICAgICAgICAg
ZmlsZTovLzAwMDEtdGVzdHMtYXJtLVVzZS1PLWluc3RlYWQtb2YtTzAucGF0Y2ggXAorICAgICAg
ICAgICAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOGQ1NGM3MTcwMjkxMDZmMTY0NGFhZGFmODAy
YWI5NjkyZTUzZDkzZGQwMTVjYmQxOWU3NDE5MGViYTYxNmJkNyIKK1VQU1RSRUFNX0NIRUNLX1JF
R0VYID0gInZhbGdyaW5kLSg/UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgorCitDT01QQVRJQkxF
X0hPU1QgPSAnKGkuODZ8eDg2XzY0fGFybXxhYXJjaDY0fG1pcHN8cG93ZXJwY3xwb3dlcnBjNjR8
cmlzY3Y2NCkuKi1saW51eCcKKworIyB2YWxncmluZCBzdXBwb3J0cyBhcm12NyBhbmQgYWJvdmUK
K0NPTVBBVElCTEVfSE9TVDphcm12NCA9ICdudWxsJworQ09NUEFUSUJMRV9IT1NUOmFybXY1ID0g
J251bGwnCitDT01QQVRJQkxFX0hPU1Q6YXJtdjYgPSAnbnVsbCcKKworIyB2YWxncmluZCBmYWls
cyB3aXRoIHBvd2VycGMgc29mdC1mbG9hdAorQ09NUEFUSUJMRV9IT1NUOnBvd2VycGMgPSAiJHtA
YmIudXRpbHMuY29udGFpbnMoJ1RBUkdFVF9GUFUnLCAnc29mdCcsICdudWxsJywgJy4qLWxpbnV4
JywgZCl9IgorCisjIFgzMiBpc24ndCBzdXBwb3J0ZWQgYnkgdmFsZ3JpbmQgYXQgdGhpcyB0aW1l
CitDT01QQVRJQkxFX0hPU1Q6bGludXgtZ251eDMyID0gJ251bGwnCitDT01QQVRJQkxFX0hPU1Q6
bGludXgtbXVzbHgzMiA9ICdudWxsJworCisjIERpc2FibGUgZm9yIHNvbWUgTUlQUyB2YXJpYW50
cworQ09NUEFUSUJMRV9IT1NUOm1pcHNhcmNocjYgPSAnbnVsbCcKK0NPTVBBVElCTEVfSE9TVDps
aW51eC1nbnVuMzIgPSAnbnVsbCcKKworIyBEaXNhYmxlIGZvciBwb3dlcnBjNjQgd2l0aCBtdXNs
CitDT01QQVRJQkxFX0hPU1Q6bGliYy1tdXNsOnBvd2VycGM2NCA9ICdudWxsJworCitpbmhlcml0
IGF1dG90b29scy1icm9rZW5zZXAgbXVsdGlsaWJfaGVhZGVyCisKK0VYVFJBX09FQ09ORiA9ICIt
LWVuYWJsZS10bHMgLS13aXRob3V0LW1waWNjIgorRVhUUkFfT0VDT05GICs9ICIke0BbJy0tZW5h
YmxlLW9ubHkzMmJpdCcsJy0tZW5hYmxlLW9ubHk2NGJpdCddW2QuZ2V0VmFyKCdTSVRFSU5GT19C
SVRTJykgIT0gJzMyJ119IgorCisjIHZhbGdyaW5kIGNoZWNrcyBob3N0X2NwdSAiYXJtdjcqKSIs
IHNvIHdlIG5lZWQgdG8gb3Zlci1yaWRlIHRoZSBhdXRvdG9vbHMuYmJjbGFzcyBkZWZhdWx0IC0t
aG9zdCBvcHRpb24KK0VYVFJBX09FQ09ORjphcHBlbmQ6YXJtID0gIiAtLWhvc3Q9YXJtdjcke0hP
U1RfVkVORE9SfS0ke0hPU1RfT1N9IgorCitFWFRSQV9PRU1BS0UgPSAiLXciCisKK0NBQ0hFRF9D
T05GSUdVUkVWQVJTICs9ICJhY19jdl9wYXRoX1BFUkw9Jy91c3IvYmluL2VudiBwZXJsJyIKKwor
IyB2YWxncmluZCBsaWtlcyB0byBjb250cm9sIGl0cyBvd24gb3B0aW1pc2F0aW9uIGZsYWdzLiBJ
dCBnZW5lcmFsbHkgZGVmYXVsdHMKKyMgdG8gLU8yIGJ1dCB1c2VzIC1PMCBmb3Igc29tZSBzcGVj
aWZpYyB0ZXN0IGFwcHMgZXRjLiBQYXNzaW5nIG91ciBvd24gZmxhZ3MKKyMgKHZpYSBDRkxBR1Mp
IG1lYW5zIHdlIGludGVyZmVyZSB3aXRoIHRoYXQuIE9ubHkgcGFzcyBERUJVR19GTEFHUyB0byBp
dAorIyB3aGljaCBmaXhlcyBidWlsZCBwYXRoIGlzc3VlIGluIERXQVJGLgorU0VMRUNURURfT1BU
SU1JWkFUSU9OID0gIiR7REVCVUdfTEVWRUxGTEFHfSIKKworIyBTcGxpdCBvdXQgdmFyaW91cyBo
ZWxwZXIgc2NyaXB0cyB0byBzZXBhcmF0ZSBwYWNrYWdlcyB0byBhdm9pZCB0aGUKKyMgbWFpbiBw
YWNrYWdlIGRlcGVuZGluZyBvbiBwZXJsIGFuZCBweXRob24uCitQQUNLQUdFUyA9KyAiJHtQTn0t
Y2FjaGVncmluZCAke1BOfS1tYXNzaWYgJHtQTn0tY2FsbGdyaW5kIgorCitGSUxFUzoke1BOfS1j
YWNoZWdyaW5kID0gIiR7YmluZGlyfS9jZ18qIgorRklMRVM6JHtQTn0tbWFzc2lmID0gIiR7Ymlu
ZGlyfS9tc18qIgorRklMRVM6JHtQTn0tY2FsbGdyaW5kID0gIiR7YmluZGlyfS9jYWxsZ3JpbmRf
KiIKKworUkRFUEVORFM6JHtQTn0tY2FjaGVncmluZCA9ICIke1BOfSBweXRob24zLWNvcmUiCitS
REVQRU5EUzoke1BOfS1tYXNzaWYgPSAiJHtQTn0gcGVybCIKK1JERVBFTkRTOiR7UE59LWNhbGxn
cmluZCA9ICIke1BOfSBwZXJsIgorCitkb19jb25maWd1cmU6cHJlcGVuZCAoKSB7CisgICAgcm0g
LXJmICR7U30vY29uZmlnLmgKK30KKworZG9faW5zdGFsbDphcHBlbmQgKCkgeworICAgIGluc3Rh
bGwgLW0gNjQ0ICR7Qn0vZGVmYXVsdC5zdXBwICR7RH0vJHtsaWJleGVjZGlyfS92YWxncmluZC8K
KyAgICBvZV9tdWx0aWxpYl9oZWFkZXIgdmFsZ3JpbmQvY29uZmlnLmgKK30KKworVkFMR1JJTkRB
UkNIID89ICIke1RBUkdFVF9BUkNIfSIKK1ZBTEdSSU5EQVJDSDphYXJjaDY0ID0gImFybTY0Igor
VkFMR1JJTkRBUkNIOng4Ni02NCA9ICJhbWQ2NCIKK1ZBTEdSSU5EQVJDSDp4ODYgPSAieDg2Igor
VkFMR1JJTkRBUkNIOm1pcHMgPSAibWlwczMyIgorVkFMR1JJTkRBUkNIOm1pcHNlbCA9ICJtaXBz
MzIiCitWQUxHUklOREFSQ0g6bWlwczY0ZWwgPSAibWlwczY0IgorVkFMR1JJTkRBUkNIOnBvd2Vy
cGMgPSAicHBjIgorVkFMR1JJTkRBUkNIOnBvd2VycGM2NCA9ICJwcGM2NCIKK1ZBTEdSSU5EQVJD
SDpwb3dlcnBjNjRsZSA9ICJwcGM2NGxlIgorCitJTkhJQklUX1BBQ0tBR0VfU1RSSVBfRklMRVMg
PSAiJHtQS0dEfSR7bGliZXhlY2Rpcn0vdmFsZ3JpbmQvdmdwcmVsb2FkX21lbWNoZWNrLSR7VkFM
R1JJTkRBUkNIfS1saW51eC5zbyIKKworIyB2YWxncmluZCBuZWVkcyBkZWJ1ZyBpbmZvcm1hdGlv
biBmb3IgbGQuc28gYXQgcnVudGltZSBpbiBvcmRlciB0bworIyByZWRpcmVjdCBmdW5jdGlvbnMg
bGlrZSBzdHJsZW4uCitSUkVDT01NRU5EUzoke1BOfSArPSAiJHtUQ0xJQkN9LWRiZyIKKworIyBW
YWxncmluZCBuZWVkcyBpbnRyaW5zaWNzIHdoaWNoIGFyZSBub3QgcHJvdmlkZWQgYnkgY2xhbmcK
KyMgbV9zaWduYWxzLmM6MjIxMzo3OiBlcnJvcjogX19idWlsdGluX2xvbmdqbXAgaXMgbm90IHN1
cHBvcnRlZCBmb3IgdGhlIGN1cnJlbnQgdGFyZ2V0CisjIDIyMTMgfCAgICAgICBWR19NSU5JTUFM
X0xPTkdKTVAodHN0LT5zY2hlZF9qbXBidWYpOworIyAgICAgIHwgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgorIworIyBJdCBuZWVkcyBzb21ldGhpbmcgbGlrZSAt
IGh0dHBzOi8vYnVncy5rZGUub3JnL3Nob3dfYnVnLmNnaT9pZD0zNjk3MjMKK1RPT0xDSEFJTjpy
aXNjdjY0ID0gImdjYyIKLS0gCjIuNDcuMQoK

--===============7336379575657891172==--

