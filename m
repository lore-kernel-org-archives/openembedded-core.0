Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE08ACD8CA7
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 15:35:48 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1579.1780328146861494073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 08:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=mowXpId0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4Vst5S1p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019e83d3a559-580d7f4e-c62f-459c-98a3-de3df6a17c61-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1780328146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SJSr/KgQfpE4IRCTJ8epLFOxP5pU+kCZ2KMOsqXY4Gk=;
	b=mowXpId0bR/Mh9JzIz/1DXLtq/780SfRnUAHdUAV0ve1PXtxewjhgFQG1j6toqmG
	6hCuum4KD61lV1oLoZ4e8WIkSNXxTr7vyawztDr7SQKxgM2p5oqzRVnuGDmcSpV5pnr
	wu28j5FtrUbetaJ1CUDZS6hnTaHGsp1vB7oUs/zw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1780328146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SJSr/KgQfpE4IRCTJ8epLFOxP5pU+kCZ2KMOsqXY4Gk=;
	b=4Vst5S1poEIos4peK6nP9W18eTCDmm2kIep9xE21DIGjqcmGvG/gKUXzChZtesig
	MofymzHMLDaevSoLglSE4mpMMrXoD/nl9Im3WeLaavTnCGiykUKX417hOwd494od0Ca
	3pTVnUOyiGHnoqtqY5ugRqFkvvOmT1d82mzijSyE=
Content-Type: multipart/mixed; boundary="===============3076446398779891085=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] valgrind: upgrading to 3.27.1 SUCCEEDED
Message-ID: <0101019e83d3a559-580d7f4e-c62f-459c-98a3-de3df6a17c61-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jun 2026 15:35:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 15:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237910

--===============3076446398779891085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *valgrind* to *3.27.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-valgrind-upgrade-3.27.0-3.27.1.patch
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
From 7ab69fc4436fd45ba0963cc1f5502b9511877edf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jun 2026 10:25:08 +0000
Subject: [PATCH] valgrind: upgrade 3.27.0 -> 3.27.1

---
 ...onfigure-Drop-setting-mcpu-cortex-a8-on-arm.patch |  6 +++---
 .../0001-docs-Disable-manual-validation.patch        |  6 +++---
 ...filter.c-workaround-off64_t-not-defined-in-.patch |  8 +++-----
 ...-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch | 12 ++++++------
 ...001-memcheck-tests-Fix-timerfd-syscall-test.patch | 10 +++++-----
 ...emcheck-vgtests-remove-fullpath-after-flags.patch |  2 +-
 ...sts-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch |  2 +-
 ...eue-Rename-_sifields-to-__si_fields-on-musl.patch |  2 +-
 .../0001-tests-arm-Use-O-instead-of-O0.patch         |  6 +++---
 ...algrind-filter_xml_frames-do-not-filter-usr.patch |  2 +-
 ...correct-include-directive-path-for-config.h.patch |  2 +-
 ...-support-for-PPC-instructions-mfatbu-mfatbl.patch | 10 +++++-----
 ...oid-neon-for-targets-which-don-t-support-it.patch |  2 +-
 .../valgrind/valgrind/fixed-perl-path.patch          |  8 ++++----
 .../valgrind/valgrind/s390x_vec_op_t.patch           |  6 +++---
 ...propriate-march-mcpu-mfpu-for-ARM-test-apps.patch |  6 +++---
 ...nd-make-ld-XXX.so-strlen-intercept-optional.patch |  6 +++---
 .../{valgrind_3.27.0.bb => valgrind_3.27.1.bb}       |  2 +-
 18 files changed, 48 insertions(+), 50 deletions(-)
 rename meta/recipes-devtools/valgrind/{valgrind_3.27.0.bb => valgrind_3.27.1.bb} (98%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch b/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
index 3c8bec82b3..4c3204c142 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
@@ -1,4 +1,4 @@
-From 5a776e61af5ab7f0cfd10cde55c796189686916f Mon Sep 17 00:00:00 2001
+From 50a70a222f7a67fd0b3fed8453346ba2b12caa73 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 10 May 2024 16:27:34 -0700
 Subject: [PATCH] configure: Drop setting mcpu=cortex-a8 on arm
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2dfbd1c..b42fdd4 100755
+index 54f9d31..3bb498c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -251,13 +251,13 @@ case "${host_cpu}" in
+@@ -309,13 +309,13 @@ case "${host_cpu}" in
  
       armv8*)
          AC_MSG_RESULT([ok (${host_cpu})])
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
index fbd799eeea..f84a7d9f78 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
@@ -1,4 +1,4 @@
-From 4f674f458b1f0675abdc0ced01239e99bfa40de8 Mon Sep 17 00:00:00 2001
+From a238f73a6dc7f88955f3e1a590096f3e1a48e9de Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Jan 2022 18:26:02 -0800
 Subject: [PATCH] docs: Disable manual validation
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/docs/Makefile.am b/docs/Makefile.am
-index 68a3da5..9833d5c 100644
+index 6eefe18..335fa85 100644
 --- a/docs/Makefile.am
 +++ b/docs/Makefile.am
-@@ -202,7 +202,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
+@@ -224,7 +224,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
  	  fi \
  	fi
  
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch b/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch
index 6afb6d79de..63273df5c5 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch
@@ -1,7 +1,7 @@
-From 8c2313226de5171dd6724c1878a679b556b6cab4 Mon Sep 17 00:00:00 2001
+From ca9d69a389af9d2ca534cdc07b02e8c9af212209 Mon Sep 17 00:00:00 2001
 From: Alyssa Ross <hi@alyssa.is>
 Date: Sun, 2 Nov 2025 16:43:47 +0100
-Subject: [PATCH v2] Avoid Glibc-specific ino64_t/off64_t
+Subject: [PATCH] Avoid Glibc-specific ino64_t/off64_t
 
 The *64_t types are transitional APIs for applications that do not yet
 fully support large files on 32-bit platforms.  musl no longer
@@ -21,7 +21,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/none/tests/linux/getdents_filter.c b/none/tests/linux/getdents_filter.c
-index 361659f51..4f46a6ea2 100644
+index 361659f..4f46a6e 100644
 --- a/none/tests/linux/getdents_filter.c
 +++ b/none/tests/linux/getdents_filter.c
 @@ -2,6 +2,7 @@
@@ -43,5 +43,3 @@ index 361659f51..4f46a6ea2 100644
      unsigned short d_reclen;
      unsigned char  d_type;
      char           d_name[];
--- 
-2.51.0
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
index f8d1e87ba9..351f061387 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
@@ -1,4 +1,4 @@
-From c878aaacadf8ec723be882f9335cb33240df13d6 Mon Sep 17 00:00:00 2001
+From 2951e4bf0bad63399ee1db3d296cafa718ac332d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Apr 2017 10:11:16 -0700
 Subject: [PATCH] makefiles: Drop setting -mcpu to cortex-a8 on arm
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/helgrind/tests/Makefile.am b/helgrind/tests/Makefile.am
-index 7adc5c6..cac23c9 100755
+index bfdb3ff..3bd5569 100644
 --- a/helgrind/tests/Makefile.am
 +++ b/helgrind/tests/Makefile.am
-@@ -226,9 +226,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
+@@ -218,9 +218,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
  endif
  
  if VGCONF_PLATFORMS_INCLUDE_ARM_LINUX
@@ -36,10 +36,10 @@ index 7adc5c6..cac23c9 100755
  annotate_hbefore_CFLAGS = $(AM_CFLAGS)
  tc07_hbl1_CFLAGS        = $(AM_CFLAGS)
 diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
-index 41a5a03..a76981e 100644
+index d197575..f452d69 100644
 --- a/none/tests/arm/Makefile.am
 +++ b/none/tests/arm/Makefile.am
-@@ -56,10 +56,10 @@ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
+@@ -55,10 +55,10 @@ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
  # need special helping w.r.t -mfpu and -mfloat-abi, though.
  # Also force -O0 since -O takes hundreds of MB of memory 
  # for v6intThumb.c.
@@ -53,7 +53,7 @@ index 41a5a03..a76981e 100644
  
  v8crypto_a_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -marm -march=armv8-a
  v8crypto_t_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -mthumb -march=armv8-a
-@@ -74,23 +74,23 @@ v8memory_t_CFLAGS = $(AM_CFLAGS) -g -O0 \
+@@ -73,23 +73,23 @@ v8memory_t_CFLAGS = $(AM_CFLAGS) -g -O0 \
  
  vcvt_fixed_float_VFP_CFLAGS = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mfpu=neon
  
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
index 200b2602cb..eef0165412 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
@@ -1,4 +1,4 @@
-From 3a51ed107f67732910dec12279a9279e158afbe7 Mon Sep 17 00:00:00 2001
+From e7f4723a3340f5c7e3e05016eef0efb201be28ac Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 9 Mar 2020 16:30:19 -0700
 Subject: [PATCH] memcheck/tests: Fix timerfd syscall test
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 15 insertions(+), 3 deletions(-)
 
 diff --git a/config.h.in b/config.h.in
-index 00db1a6..23fd77a 100644
+index a852207..8098b15 100644
 --- a/config.h.in
 +++ b/config.h.in
-@@ -409,6 +409,9 @@
+@@ -451,6 +451,9 @@
  /* Define to 1 if you have the <sys/sysnvl.h> header file. */
  #undef HAVE_SYS_SYSNVL_H
  
@@ -30,10 +30,10 @@ index 00db1a6..23fd77a 100644
  #undef HAVE_SYS_TIME_H
  
 diff --git a/configure.ac b/configure.ac
-index b42fdd4..ec95146 100755
+index 3bb498c..88dfe30 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4892,6 +4892,7 @@ AC_CHECK_HEADERS([       \
+@@ -5235,6 +5235,7 @@ AC_CHECK_HEADERS([       \
          sys/syscall.h    \
          sys/sysnvl.h     \
          sys/time.h       \
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
index 9a3596cac1..c7eac6b228 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
@@ -1,4 +1,4 @@
-From b703b0d11adc9147a7d97817bd771ac40b8c4d39 Mon Sep 17 00:00:00 2001
+From 889683a4079b7f5ef1eb1760656742021dc605c0 Mon Sep 17 00:00:00 2001
 From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
 Date: Wed, 16 Sep 2020 13:45:07 -0400
 Subject: [PATCH] memcheck vgtests remove fullpath-after flags
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
index 7deca99202..a262327f58 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
@@ -1,4 +1,4 @@
-From bbb5e8a6fc5eec178f8077ab006ab42c009528d4 Mon Sep 17 00:00:00 2001
+From 478a4c747d61dd9db65c893b821bf89035ae7bee Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 24 Jan 2020 17:55:39 +0100
 Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
index efa6c2c895..1b396c6470 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
@@ -1,4 +1,4 @@
-From c287382a1f3dd9f2db3df54dde54b4b266791bb9 Mon Sep 17 00:00:00 2001
+From 15031f16a048887c23fedd9283c9894b012c1c82 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 00:46:39 -0700
 Subject: [PATCH] sigqueue: Rename _sifields to __si_fields on musl
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
index 3eea195579..67967c2e80 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
@@ -1,4 +1,4 @@
-From 8087ae8dcc46f3f81af58ed9b7176761b988ee61 Mon Sep 17 00:00:00 2001
+From 385037a74d9270343c51321d1c96a491b3369ecb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 10 May 2024 17:44:47 -0700
 Subject: [PATCH] tests/arm: Use -O instead of -O0
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
-index a76981e..a198f73 100644
+index f452d69..fbd9416 100644
 --- a/none/tests/arm/Makefile.am
 +++ b/none/tests/arm/Makefile.am
-@@ -57,9 +57,9 @@ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
+@@ -56,9 +56,9 @@ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
  # Also force -O0 since -O takes hundreds of MB of memory 
  # for v6intThumb.c.
  v6intARM_CFLAGS   = $(AM_CFLAGS) -g -O0 -marm
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
index c64c2afd3f..f344b05020 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
@@ -1,4 +1,4 @@
-From f8fbebcf69e4a8bf2122b7c55f2ce372377af1bc Mon Sep 17 00:00:00 2001
+From a6d3cd87a9f9bd6b6f2bf1677dff3e8c4d9564bf Mon Sep 17 00:00:00 2001
 From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Mon, 13 May 2019 17:12:21 -0400
 Subject: [PATCH] valgrind: filter_xml_frames: do not filter /usr
diff --git a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
index 3acb5a28f4..0c1f513934 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
@@ -1,4 +1,4 @@
-From de4d7e478515b63f049b211266d9b946c15cc0b9 Mon Sep 17 00:00:00 2001
+From e4ef39f284a2bf292a97363c8c3eddf396587c30 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 01:03:17 -0700
 Subject: [PATCH] correct include directive path for config.h
diff --git a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
index 109caf76ab..61eb8e292a 100644
--- a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
@@ -1,4 +1,4 @@
-From 85bff993087cd7367ffc35de525c2bf6162398d2 Mon Sep 17 00:00:00 2001
+From fcf7424559a676b9a130452350a92f38dd2ed9e6 Mon Sep 17 00:00:00 2001
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
+index a48164a..229b5a8 100644
 --- a/VEX/priv/guest_ppc_helpers.c
 +++ b/VEX/priv/guest_ppc_helpers.c
 @@ -118,6 +118,24 @@ UInt ppc32g_dirtyhelper_MFSPR_287 ( void )
@@ -59,10 +59,10 @@ index 2611e52..72c349b 100644
  /* CALLED FROM GENERATED CODE */
  /* DIRTY HELPER (reads guest state, writes guest mem) */
 diff --git a/VEX/priv/guest_ppc_toIR.c b/VEX/priv/guest_ppc_toIR.c
-index 18716dd..b2e72a0 100644
+index a5134e6..f44da32 100644
 --- a/VEX/priv/guest_ppc_toIR.c
 +++ b/VEX/priv/guest_ppc_toIR.c
-@@ -11875,6 +11875,28 @@ static Bool dis_proc_ctl ( const VexAbiInfo* vbi, UInt prefix, UInt theInstr )
+@@ -11864,6 +11864,28 @@ static Bool dis_proc_ctl ( const VexAbiInfo* vbi, UInt prefix, UInt theInstr )
           break;
        }
  
diff --git a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
index 1597b3a021..70fd43f25a 100644
--- a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
@@ -1,4 +1,4 @@
-From 596372bc9b4d31bc9811881cfa747d99a8c25141 Mon Sep 17 00:00:00 2001
+From 4c7de937548a0145e52fadf56e24193258a64ae1 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 19 Jan 2016 16:42:36 -0800
 Subject: [PATCH] avoid neon for targets which don't support it
diff --git a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
index 6bfc6035ed..6511540004 100644
--- a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
@@ -1,4 +1,4 @@
-From 408f9b39ca4f5709b668f13829a94c4cae855006 Mon Sep 17 00:00:00 2001
+From fba714ea22dfda792c84d8e2718b1f7d76ef3611 Mon Sep 17 00:00:00 2001
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
+index 2c4fe8c..2017841 100644
 --- a/tests/vg_regtest.in
 +++ b/tests/vg_regtest.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
index 19690e5ebb..de758e6a08 100644
--- a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
@@ -1,4 +1,4 @@
-From 8c92089741d809cfd18354f1b4df18cd28398a20 Mon Sep 17 00:00:00 2001
+From 5be090f91bbebef06132f0f93fb74886ac21cd16 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Wed, 17 Mar 2021 12:16:31 -0400
 Subject: [PATCH] remove s390x_vec_op_t
@@ -18,10 +18,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/VEX/priv/guest_s390_defs.h b/VEX/priv/guest_s390_defs.h
-index 29efa01..3a8f0a0 100644
+index 1d3a2be..684eb2b 100644
 --- a/VEX/priv/guest_s390_defs.h
 +++ b/VEX/priv/guest_s390_defs.h
-@@ -285,7 +285,7 @@ typedef enum {
+@@ -280,7 +280,7 @@ typedef enum {
     S390_VEC_OP_VCLFNL,
     S390_VEC_OP_VCRNF,
     S390_VEC_OP_LAST             // supposed to be the last element in enum
diff --git a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
index 0c18a63c2b..0a3bbde719 100644
--- a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
@@ -1,4 +1,4 @@
-From a5cd00f1c2d78e2a15f4a0c595f5ac10ca4c3290 Mon Sep 17 00:00:00 2001
+From 17c4d49a97be8036e2c02dc7bf6fdd29570beca9 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 19 Jan 2016 16:00:00 -0800
 Subject: [PATCH] use appropriate -march/-mcpu/-mfpu for ARM test apps
@@ -23,10 +23,10 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
-index 79b957c..41a5a03 100644
+index 5241bbd..d197575 100644
 --- a/none/tests/arm/Makefile.am
 +++ b/none/tests/arm/Makefile.am
-@@ -87,8 +87,10 @@ neon64_CFLAGS     = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
+@@ -86,8 +86,10 @@ neon64_CFLAGS     = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
  			-mfpu=neon \
  			-mthumb
  
diff --git a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
index ca7f721d9c..1aab844aa5 100644
--- a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
@@ -1,4 +1,4 @@
-From b407514aa1a4fd3667b30527260e271da34ce4a7 Mon Sep 17 00:00:00 2001
+From 603102e816847e012dd7b4d235b11ea43c72e5f9 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 13 Dec 2016 11:29:55 +0800
 Subject: [PATCH] make ld-XXX.so strlen intercept optional
@@ -17,10 +17,10 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/coregrind/m_redir.c b/coregrind/m_redir.c
-index 63172b9..1b5bf95 100644
+index 0c43731..1bafb47 100644
 --- a/coregrind/m_redir.c
 +++ b/coregrind/m_redir.c
-@@ -1321,7 +1321,18 @@ static void add_hardwired_spec (const  HChar* sopatt, const HChar* fnpatt,
+@@ -1349,7 +1349,18 @@ static void add_hardwired_spec (const  HChar* sopatt, const HChar* fnpatt,
     spec->to_addr     = to_addr;
     spec->isWrap      = False;
     spec->isGlobal    = False;
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.27.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.27.1.bb
similarity index 98%
rename from meta/recipes-devtools/valgrind/valgrind_3.27.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.27.1.bb
index 4886dd0d3b..1b08f2fc5f 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.27.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.27.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-tests-arm-Use-O-instead-of-O0.patch \
            file://0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch \
            "
-SRC_URI[sha256sum] = "5b5937de8257ee8f51698ea71b9711adce98061aa07daa4a685efc3af9215bef"
+SRC_URI[sha256sum] = "5d589152eb8071c02feab8ce6ab719e431a1fbc3e2b1700f5432632a8b9264dc"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64|riscv64).*-linux'
-- 
2.47.1


--===============3076446398779891085==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-valgrind-upgrade-3.27.0-3.27.1.patch"

RnJvbSA3YWI2OWZjNDQzNmZkNDViYTA5NjNjYzFmNTUwMmI5NTExODc3ZWRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdW4gMjAyNiAxMDoyNTowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZh
bGdyaW5kOiB1cGdyYWRlIDMuMjcuMCAtPiAzLjI3LjEKCi0tLQogLi4ub25maWd1cmUtRHJvcC1z
ZXR0aW5nLW1jcHUtY29ydGV4LWE4LW9uLWFybS5wYXRjaCB8ICA2ICsrKy0tLQogLi4uLzAwMDEt
ZG9jcy1EaXNhYmxlLW1hbnVhbC12YWxpZGF0aW9uLnBhdGNoICAgICAgICB8ICA2ICsrKy0tLQog
Li4uZmlsdGVyLmMtd29ya2Fyb3VuZC1vZmY2NF90LW5vdC1kZWZpbmVkLWluLS5wYXRjaCB8ICA4
ICsrKy0tLS0tCiAuLi4tRHJvcC1zZXR0aW5nLW1jcHUtdG8tY29ydGV4LWE4LW9uLWFybS1hcmNo
LnBhdGNoIHwgMTIgKysrKysrLS0tLS0tCiAuLi4wMDEtbWVtY2hlY2stdGVzdHMtRml4LXRpbWVy
ZmQtc3lzY2FsbC10ZXN0LnBhdGNoIHwgMTAgKysrKystLS0tLQogLi4uZW1jaGVjay12Z3Rlc3Rz
LXJlbW92ZS1mdWxscGF0aC1hZnRlci1mbGFncy5wYXRjaCB8ICAyICstCiAuLi5zdHMtZmRsZWFr
X2Ntc2cuc3RkZXJyLmV4cC1hZGp1c3QtdG1wLXBhdGhzLnBhdGNoIHwgIDIgKy0KIC4uLmV1ZS1S
ZW5hbWUtX3NpZmllbGRzLXRvLV9fc2lfZmllbGRzLW9uLW11c2wucGF0Y2ggfCAgMiArLQogLi4u
LzAwMDEtdGVzdHMtYXJtLVVzZS1PLWluc3RlYWQtb2YtTzAucGF0Y2ggICAgICAgICB8ICA2ICsr
Ky0tLQogLi4uYWxncmluZC1maWx0ZXJfeG1sX2ZyYW1lcy1kby1ub3QtZmlsdGVyLXVzci5wYXRj
aCB8ICAyICstCiAuLi5jb3JyZWN0LWluY2x1ZGUtZGlyZWN0aXZlLXBhdGgtZm9yLWNvbmZpZy5o
LnBhdGNoIHwgIDIgKy0KIC4uLi1zdXBwb3J0LWZvci1QUEMtaW5zdHJ1Y3Rpb25zLW1mYXRidS1t
ZmF0YmwucGF0Y2ggfCAxMCArKysrKy0tLS0tCiAuLi5vaWQtbmVvbi1mb3ItdGFyZ2V0cy13aGlj
aC1kb24tdC1zdXBwb3J0LWl0LnBhdGNoIHwgIDIgKy0KIC4uLi92YWxncmluZC92YWxncmluZC9m
aXhlZC1wZXJsLXBhdGgucGF0Y2ggICAgICAgICAgfCAgOCArKysrLS0tLQogLi4uL3ZhbGdyaW5k
L3ZhbGdyaW5kL3MzOTB4X3ZlY19vcF90LnBhdGNoICAgICAgICAgICB8ICA2ICsrKy0tLQogLi4u
cHJvcHJpYXRlLW1hcmNoLW1jcHUtbWZwdS1mb3ItQVJNLXRlc3QtYXBwcy5wYXRjaCB8ICA2ICsr
Ky0tLQogLi4ubmQtbWFrZS1sZC1YWFguc28tc3RybGVuLWludGVyY2VwdC1vcHRpb25hbC5wYXRj
aCB8ICA2ICsrKy0tLQogLi4uL3t2YWxncmluZF8zLjI3LjAuYmIgPT4gdmFsZ3JpbmRfMy4yNy4x
LmJifSAgICAgICB8ICAyICstCiAxOCBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCA1
MCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQve3Zh
bGdyaW5kXzMuMjcuMC5iYiA9PiB2YWxncmluZF8zLjI3LjEuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtY29uZmlndXJl
LURyb3Atc2V0dGluZy1tY3B1LWNvcnRleC1hOC1vbi1hcm0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1jb25maWd1cmUtRHJvcC1zZXR0aW5nLW1j
cHUtY29ydGV4LWE4LW9uLWFybS5wYXRjaAppbmRleCAzYzhiZWM4MmIzLi40YzMyMDRjMTQyIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1j
b25maWd1cmUtRHJvcC1zZXR0aW5nLW1jcHUtY29ydGV4LWE4LW9uLWFybS5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1jb25maWd1cmUtRHJv
cC1zZXR0aW5nLW1jcHUtY29ydGV4LWE4LW9uLWFybS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gNWE3NzZlNjFhZjVhYjdmMGNmZDEwY2RlNTVjNzk2MTg5Njg2OTE2ZiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gNTBhNzBhMjIyZjdhNjdmZDBiM2ZlZDg0NTMzNDZiYTJiMTJjYWE3
MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiBEYXRlOiBGcmksIDEwIE1heSAyMDI0IDE2OjI3OjM0IC0wNzAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGNvbmZpZ3VyZTogRHJvcCBzZXR0aW5nIG1jcHU9Y29ydGV4LWE4IG9uIGFybQpAQCAt
MTYsMTAgKzE2LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAog
ZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggMmRmYmQxYy4u
YjQyZmRkNCAxMDA3NTUKK2luZGV4IDU0ZjlkMzEuLjNiYjQ5OGMgMTAwNjQ0CiAtLS0gYS9jb25m
aWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTI1MSwxMyArMjUxLDEzIEBAIGNhc2Ug
IiR7aG9zdF9jcHV9IiBpbgorQEAgLTMwOSwxMyArMzA5LDEzIEBAIGNhc2UgIiR7aG9zdF9jcHV9
IiBpbgogIAogICAgICAgYXJtdjgqKQogICAgICAgICAgQUNfTVNHX1JFU1VMVChbb2sgKCR7aG9z
dF9jcHV9KV0pCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFs
Z3JpbmQvMDAwMS1kb2NzLURpc2FibGUtbWFudWFsLXZhbGlkYXRpb24ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1kb2NzLURpc2FibGUtbWFudWFs
LXZhbGlkYXRpb24ucGF0Y2gKaW5kZXggZmJkNzk5ZWVlYS4uZjg0YTdkOWY3OCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtZG9jcy1EaXNh
YmxlLW1hbnVhbC12YWxpZGF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92
YWxncmluZC92YWxncmluZC8wMDAxLWRvY3MtRGlzYWJsZS1tYW51YWwtdmFsaWRhdGlvbi5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNGY2NzRmNDU4YjFmMDY3NWFiZGMwY2VkMDEyMzllOTli
ZmE0MGRlOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTIzOGY3M2E2ZGM3Zjg4OTU1
ZjNlMWE1OTAwOTZmM2UxYTQ4ZTlkZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDEzIEphbiAyMDIyIDE4OjI2
OjAyIC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRvY3M6IERpc2FibGUgbWFudWFsIHZhbGlkYXRp
b24KQEAgLTE5LDEwICsxOSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogCiBkaWZmIC0tZ2l0IGEvZG9jcy9NYWtlZmlsZS5hbSBiL2RvY3MvTWFrZWZpbGUuYW0KLWlu
ZGV4IDY4YTNkYTUuLjk4MzNkNWMgMTAwNjQ0CitpbmRleCA2ZWVmZTE4Li4zMzVmYTg1IDEwMDY0
NAogLS0tIGEvZG9jcy9NYWtlZmlsZS5hbQogKysrIGIvZG9jcy9NYWtlZmlsZS5hbQotQEAgLTIw
Miw3ICsyMDIsNyBAQCB2YWxpZC1tYW5wYWdlczogJChNQU5QQUdFU19YTUxfRklMRVMpCitAQCAt
MjI0LDcgKzIyNCw3IEBAIHZhbGlkLW1hbnBhZ2VzOiAkKE1BTlBBR0VTX1hNTF9GSUxFUykKICAJ
ICBmaSBcCiAgCWZpCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3Jp
bmQvdmFsZ3JpbmQvMDAwMS1nZXRkZW50c19maWx0ZXIuYy13b3JrYXJvdW5kLW9mZjY0X3Qtbm90
LWRlZmluZWQtaW4tLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdy
aW5kLzAwMDEtZ2V0ZGVudHNfZmlsdGVyLmMtd29ya2Fyb3VuZC1vZmY2NF90LW5vdC1kZWZpbmVk
LWluLS5wYXRjaAppbmRleCA2YWZiNmQ3OWRlLi42MzI3M2RmNWM1IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1nZXRkZW50c19maWx0ZXIu
Yy13b3JrYXJvdW5kLW9mZjY0X3Qtbm90LWRlZmluZWQtaW4tLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLWdldGRlbnRzX2ZpbHRlci5jLXdv
cmthcm91bmQtb2ZmNjRfdC1ub3QtZGVmaW5lZC1pbi0ucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1G
cm9tIDhjMjMxMzIyNmRlNTE3MWRkNjcyNGMxODc4YTY3OWI1NTZiNmNhYjQgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGNhOWQ2OWEzODlhZjlkMmNhNTM0Y2RjMDdiMDJlOGM5YWYyMTIy
MDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbHlzc2EgUm9zcyA8aGlAYWx5c3Nh
LmlzPgogRGF0ZTogU3VuLCAyIE5vdiAyMDI1IDE2OjQzOjQ3ICswMTAwCi1TdWJqZWN0OiBbUEFU
Q0ggdjJdIEF2b2lkIEdsaWJjLXNwZWNpZmljIGlubzY0X3Qvb2ZmNjRfdAorU3ViamVjdDogW1BB
VENIXSBBdm9pZCBHbGliYy1zcGVjaWZpYyBpbm82NF90L29mZjY0X3QKIAogVGhlICo2NF90IHR5
cGVzIGFyZSB0cmFuc2l0aW9uYWwgQVBJcyBmb3IgYXBwbGljYXRpb25zIHRoYXQgZG8gbm90IHll
dAogZnVsbHkgc3VwcG9ydCBsYXJnZSBmaWxlcyBvbiAzMi1iaXQgcGxhdGZvcm1zLiAgbXVzbCBu
byBsb25nZXIKQEAgLTIxLDcgKzIxLDcgQEAgU2lnbmVkLW9mZi1ieTogTWluZ2xpIFl1IDxtaW5n
bGkueXVAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbm9uZS90ZXN0cy9saW51eC9nZXRkZW50c19m
aWx0ZXIuYyBiL25vbmUvdGVzdHMvbGludXgvZ2V0ZGVudHNfZmlsdGVyLmMKLWluZGV4IDM2MTY1
OWY1MS4uNGY0NmE2ZWEyIDEwMDY0NAoraW5kZXggMzYxNjU5Zi4uNGY0NmE2ZSAxMDA2NDQKIC0t
LSBhL25vbmUvdGVzdHMvbGludXgvZ2V0ZGVudHNfZmlsdGVyLmMKICsrKyBiL25vbmUvdGVzdHMv
bGludXgvZ2V0ZGVudHNfZmlsdGVyLmMKIEBAIC0yLDYgKzIsNyBAQApAQCAtNDMsNSArNDMsMyBA
QCBpbmRleCAzNjE2NTlmNTEuLjRmNDZhNmVhMiAxMDA2NDQKICAgICAgdW5zaWduZWQgc2hvcnQg
ZF9yZWNsZW47CiAgICAgIHVuc2lnbmVkIGNoYXIgIGRfdHlwZTsKICAgICAgY2hhciAgICAgICAg
ICAgZF9uYW1lW107Ci0tLSAKLTIuNTEuMApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWFrZWZpbGVzLURyb3Atc2V0dGluZy1tY3B1LXRv
LWNvcnRleC1hOC1vbi1hcm0tYXJjaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxn
cmluZC92YWxncmluZC8wMDAxLW1ha2VmaWxlcy1Ecm9wLXNldHRpbmctbWNwdS10by1jb3J0ZXgt
YTgtb24tYXJtLWFyY2gucGF0Y2gKaW5kZXggZjhkMWU4N2JhOS4uMzUxZjA2MTM4NyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWFrZWZp
bGVzLURyb3Atc2V0dGluZy1tY3B1LXRvLWNvcnRleC1hOC1vbi1hcm0tYXJjaC5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1tYWtlZmlsZXMt
RHJvcC1zZXR0aW5nLW1jcHUtdG8tY29ydGV4LWE4LW9uLWFybS1hcmNoLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBjODc4YWFhY2FkZjhlYzcyM2JlODgyZjkzMzVjYjMzMjQwZGYxM2Q2IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyOTUxZTRiZjBiYWQ2MzM5OWVlMWRiM2QyOTZj
YWZhNzE4YWMzMzJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjAgQXByIDIwMTcgMTA6MTE6MTYgLTA3MDAK
IFN1YmplY3Q6IFtQQVRDSF0gbWFrZWZpbGVzOiBEcm9wIHNldHRpbmcgLW1jcHUgdG8gY29ydGV4
LWE4IG9uIGFybQpAQCAtMTksMTAgKzE5LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+CiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAx
MiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2hlbGdyaW5kL3Rlc3RzL01ha2VmaWxlLmFt
IGIvaGVsZ3JpbmQvdGVzdHMvTWFrZWZpbGUuYW0KLWluZGV4IDdhZGM1YzYuLmNhYzIzYzkgMTAw
NzU1CitpbmRleCBiZmRiM2ZmLi4zYmQ1NTY5IDEwMDY0NAogLS0tIGEvaGVsZ3JpbmQvdGVzdHMv
TWFrZWZpbGUuYW0KICsrKyBiL2hlbGdyaW5kL3Rlc3RzL01ha2VmaWxlLmFtCi1AQCAtMjI2LDkg
KzIyNiw5IEBAIGlmICEgVkdDT05GX1BMQVRGT1JNU19JTkNMVURFX1g4Nl9EQVJXSU4KK0BAIC0y
MTgsOSArMjE4LDkgQEAgaWYgISBWR0NPTkZfUExBVEZPUk1TX0lOQ0xVREVfWDg2X0RBUldJTgog
IGVuZGlmCiAgCiAgaWYgVkdDT05GX1BMQVRGT1JNU19JTkNMVURFX0FSTV9MSU5VWApAQCAtMzYs
MTAgKzM2LDEwIEBAIGluZGV4IDdhZGM1YzYuLmNhYzIzYzkgMTAwNzU1CiAgYW5ub3RhdGVfaGJl
Zm9yZV9DRkxBR1MgPSAkKEFNX0NGTEFHUykKICB0YzA3X2hibDFfQ0ZMQUdTICAgICAgICA9ICQo
QU1fQ0ZMQUdTKQogZGlmZiAtLWdpdCBhL25vbmUvdGVzdHMvYXJtL01ha2VmaWxlLmFtIGIvbm9u
ZS90ZXN0cy9hcm0vTWFrZWZpbGUuYW0KLWluZGV4IDQxYTVhMDMuLmE3Njk4MWUgMTAwNjQ0Citp
bmRleCBkMTk3NTc1Li5mNDUyZDY5IDEwMDY0NAogLS0tIGEvbm9uZS90ZXN0cy9hcm0vTWFrZWZp
bGUuYW0KICsrKyBiL25vbmUvdGVzdHMvYXJtL01ha2VmaWxlLmFtCi1AQCAtNTYsMTAgKzU2LDEw
IEBAIGFsbGV4ZWNfQ0ZMQUdTCQk9ICQoQU1fQ0ZMQUdTKSBARkxBR19XX05PX05PTk5VTExACitA
QCAtNTUsMTAgKzU1LDEwIEBAIGFsbGV4ZWNfQ0ZMQUdTCQk9ICQoQU1fQ0ZMQUdTKSBARkxBR19X
X05PX05PTk5VTExACiAgIyBuZWVkIHNwZWNpYWwgaGVscGluZyB3LnIudCAtbWZwdSBhbmQgLW1m
bG9hdC1hYmksIHRob3VnaC4KICAjIEFsc28gZm9yY2UgLU8wIHNpbmNlIC1PIHRha2VzIGh1bmRy
ZWRzIG9mIE1CIG9mIG1lbW9yeSAKICAjIGZvciB2NmludFRodW1iLmMuCkBAIC01Myw3ICs1Myw3
IEBAIGluZGV4IDQxYTVhMDMuLmE3Njk4MWUgMTAwNjQ0CiAgCiAgdjhjcnlwdG9fYV9DRkxBR1Mg
PSAkKEFNX0NGTEFHUykgLWcgLU8wIC1tZnB1PWNyeXB0by1uZW9uLWZwLWFybXY4IC1tYXJtIC1t
YXJjaD1hcm12OC1hCiAgdjhjcnlwdG9fdF9DRkxBR1MgPSAkKEFNX0NGTEFHUykgLWcgLU8wIC1t
ZnB1PWNyeXB0by1uZW9uLWZwLWFybXY4IC1tdGh1bWIgLW1hcmNoPWFybXY4LWEKLUBAIC03NCwy
MyArNzQsMjMgQEAgdjhtZW1vcnlfdF9DRkxBR1MgPSAkKEFNX0NGTEFHUykgLWcgLU8wIFwKK0BA
IC03MywyMyArNzMsMjMgQEAgdjhtZW1vcnlfdF9DRkxBR1MgPSAkKEFNX0NGTEFHUykgLWcgLU8w
IFwKICAKICB2Y3Z0X2ZpeGVkX2Zsb2F0X1ZGUF9DRkxBR1MgPSAkKEFNX0NGTEFHUykgLWcgLU8w
IC1tY3B1PWNvcnRleC1hOCAtbWZwdT1uZW9uCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1tZW1jaGVjay10ZXN0cy1GaXgtdGltZXJm
ZC1zeXNjYWxsLXRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFs
Z3JpbmQvMDAwMS1tZW1jaGVjay10ZXN0cy1GaXgtdGltZXJmZC1zeXNjYWxsLXRlc3QucGF0Y2gK
aW5kZXggMjAwYjI2MDJjYi4uZWVmMDE2NTQxMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWVtY2hlY2stdGVzdHMtRml4LXRpbWVyZmQt
c3lzY2FsbC10ZXN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92
YWxncmluZC8wMDAxLW1lbWNoZWNrLXRlc3RzLUZpeC10aW1lcmZkLXN5c2NhbGwtdGVzdC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2E1MWVkMTA3ZjY3NzMyOTEwZGVjMTIyNzlhOTI3OWUx
NThhZmJlNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTdmNDcyM2EzMzQwZjVjN2Uz
ZTA1MDE2ZWVmMGVmYjIwMWJlMjhhYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDkgTWFyIDIwMjAgMTY6MzA6
MTkgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVtY2hlY2svdGVzdHM6IEZpeCB0aW1lcmZkIHN5
c2NhbGwgdGVzdApAQCAtMTYsMTAgKzE2LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+CiAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlnLmguaW4gYi9jb25maWcuaC5pbgot
aW5kZXggMDBkYjFhNi4uMjNmZDc3YSAxMDA2NDQKK2luZGV4IGE4NTIyMDcuLjgwOThiMTUgMTAw
NjQ0CiAtLS0gYS9jb25maWcuaC5pbgogKysrIGIvY29uZmlnLmguaW4KLUBAIC00MDksNiArNDA5
LDkgQEAKK0BAIC00NTEsNiArNDUxLDkgQEAKICAvKiBEZWZpbmUgdG8gMSBpZiB5b3UgaGF2ZSB0
aGUgPHN5cy9zeXNudmwuaD4gaGVhZGVyIGZpbGUuICovCiAgI3VuZGVmIEhBVkVfU1lTX1NZU05W
TF9ICiAgCkBAIC0zMCwxMCArMzAsMTAgQEAgaW5kZXggMDBkYjFhNi4uMjNmZDc3YSAxMDA2NDQK
ICAjdW5kZWYgSEFWRV9TWVNfVElNRV9ICiAgCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIv
Y29uZmlndXJlLmFjCi1pbmRleCBiNDJmZGQ0Li5lYzk1MTQ2IDEwMDc1NQoraW5kZXggM2JiNDk4
Yy4uODhkZmUzMCAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFj
Ci1AQCAtNDg5Miw2ICs0ODkyLDcgQEAgQUNfQ0hFQ0tfSEVBREVSUyhbICAgICAgIFwKK0BAIC01
MjM1LDYgKzUyMzUsNyBAQCBBQ19DSEVDS19IRUFERVJTKFsgICAgICAgXAogICAgICAgICAgc3lz
L3N5c2NhbGwuaCAgICBcCiAgICAgICAgICBzeXMvc3lzbnZsLmggICAgIFwKICAgICAgICAgIHN5
cy90aW1lLmggICAgICAgXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdy
aW5kL3ZhbGdyaW5kLzAwMDEtbWVtY2hlY2stdmd0ZXN0cy1yZW1vdmUtZnVsbHBhdGgtYWZ0ZXIt
ZmxhZ3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAw
MS1tZW1jaGVjay12Z3Rlc3RzLXJlbW92ZS1mdWxscGF0aC1hZnRlci1mbGFncy5wYXRjaAppbmRl
eCA5YTM1OTZjYWMxLi5jN2VhYzZiMjI4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1tZW1jaGVjay12Z3Rlc3RzLXJlbW92ZS1mdWxscGF0
aC1hZnRlci1mbGFncy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQv
dmFsZ3JpbmQvMDAwMS1tZW1jaGVjay12Z3Rlc3RzLXJlbW92ZS1mdWxscGF0aC1hZnRlci1mbGFn
cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjcwM2IwZDExYWRjOTE0N2E3ZDk3ODE3YmQ3
NzFhYzQwYjhjNGQzOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODg5NjgzYTQwNzli
N2Y1ZWYxZWIxNzYwNjU2NzQyMDIxZGM2MDVjMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IFN0YWN5IEdhaWtvdmFpYSA8U3RhY3kuR2Fpa292YWlhQHdpbmRyaXZlci5jb20+CiBEYXRl
OiBXZWQsIDE2IFNlcCAyMDIwIDEzOjQ1OjA3IC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lbWNo
ZWNrIHZndGVzdHMgcmVtb3ZlIGZ1bGxwYXRoLWFmdGVyIGZsYWdzCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1ub25lLXRlc3RzLWZkbGVh
a19jbXNnLnN0ZGVyci5leHAtYWRqdXN0LXRtcC1wYXRocy5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW5vbmUtdGVzdHMtZmRsZWFrX2Ntc2cuc3Rk
ZXJyLmV4cC1hZGp1c3QtdG1wLXBhdGhzLnBhdGNoCmluZGV4IDdkZWNhOTkyMDIuLmEyNjIzMjdm
NTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8w
MDAxLW5vbmUtdGVzdHMtZmRsZWFrX2Ntc2cuc3RkZXJyLmV4cC1hZGp1c3QtdG1wLXBhdGhzLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW5v
bmUtdGVzdHMtZmRsZWFrX2Ntc2cuc3RkZXJyLmV4cC1hZGp1c3QtdG1wLXBhdGhzLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBiYmI1ZThhNmZjNWVlYzE3OGY4MDc3YWIwMDZhYjQyYzAwOTUy
OGQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0NzhhNGM3NDdkNjFkZDlkYjY1Yzg5
M2I4MjFiZjg5MDM1YWU3YmVlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDI0IEphbiAy
MDIwIDE3OjU1OjM5ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIG5vbmUvdGVzdHMvZmRsZWFrX2Nt
c2cuc3RkZXJyLmV4cDogYWRqdXN0IC90bXAgcGF0aHMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLXNpZ3F1ZXVlLVJlbmFtZS1fc2lmaWVs
ZHMtdG8tX19zaV9maWVsZHMtb24tbXVzbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92
YWxncmluZC92YWxncmluZC8wMDAxLXNpZ3F1ZXVlLVJlbmFtZS1fc2lmaWVsZHMtdG8tX19zaV9m
aWVsZHMtb24tbXVzbC5wYXRjaAppbmRleCBlZmE2YzJjODk1Li4xYjM5NmM2NDcwIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1zaWdxdWV1
ZS1SZW5hbWUtX3NpZmllbGRzLXRvLV9fc2lfZmllbGRzLW9uLW11c2wucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtc2lncXVldWUtUmVuYW1l
LV9zaWZpZWxkcy10by1fX3NpX2ZpZWxkcy1vbi1tdXNsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSBjMjg3MzgyYTFmM2RkOWYyZGIzZGY1NGRkZTU0YjRiMjY2NzkxYmI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAxNTAzMWYxNmEwNDg4ODdjMjNmZWRkOTI4M2M5ODk0YjAxMmMx
YzgyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KIERhdGU6IFNhdCwgMTAgSnVuIDIwMTcgMDA6NDY6MzkgLTA3MDAKIFN1YmplY3Q6
IFtQQVRDSF0gc2lncXVldWU6IFJlbmFtZSBfc2lmaWVsZHMgdG8gX19zaV9maWVsZHMgb24gbXVz
bApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAw
MDEtdGVzdHMtYXJtLVVzZS1PLWluc3RlYWQtb2YtTzAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS10ZXN0cy1hcm0tVXNlLU8taW5zdGVhZC1vZi1P
MC5wYXRjaAppbmRleCAzZWVhMTk1NTc5Li42Nzk2N2MyZTgwIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS10ZXN0cy1hcm0tVXNlLU8taW5z
dGVhZC1vZi1PMC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFs
Z3JpbmQvMDAwMS10ZXN0cy1hcm0tVXNlLU8taW5zdGVhZC1vZi1PMC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gODA4N2FlOGRjYzQ2ZjNmODFhZjU4ZWQ5YjcxNzY3NjFiOTg4ZWU2MSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzg1MDM3YTc0ZDkyNzAzNDNjNTEzMjFkMWM5NmE0
OTFiMzM2OWVjYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDEwIE1heSAyMDI0IDE3OjQ0OjQ3IC0wNzAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHRlc3RzL2FybTogVXNlIC1PIGluc3RlYWQgb2YgLU8wCkBAIC0xOSwx
MCArMTksMTAgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZm
IC0tZ2l0IGEvbm9uZS90ZXN0cy9hcm0vTWFrZWZpbGUuYW0gYi9ub25lL3Rlc3RzL2FybS9NYWtl
ZmlsZS5hbQotaW5kZXggYTc2OTgxZS4uYTE5OGY3MyAxMDA2NDQKK2luZGV4IGY0NTJkNjkuLmZi
ZDk0MTYgMTAwNjQ0CiAtLS0gYS9ub25lL3Rlc3RzL2FybS9NYWtlZmlsZS5hbQogKysrIGIvbm9u
ZS90ZXN0cy9hcm0vTWFrZWZpbGUuYW0KLUBAIC01Nyw5ICs1Nyw5IEBAIGFsbGV4ZWNfQ0ZMQUdT
CQk9ICQoQU1fQ0ZMQUdTKSBARkxBR19XX05PX05PTk5VTExACitAQCAtNTYsOSArNTYsOSBAQCBh
bGxleGVjX0NGTEFHUwkJPSAkKEFNX0NGTEFHUykgQEZMQUdfV19OT19OT05OVUxMQAogICMgQWxz
byBmb3JjZSAtTzAgc2luY2UgLU8gdGFrZXMgaHVuZHJlZHMgb2YgTUIgb2YgbWVtb3J5IAogICMg
Zm9yIHY2aW50VGh1bWIuYy4KICB2NmludEFSTV9DRkxBR1MgICA9ICQoQU1fQ0ZMQUdTKSAtZyAt
TzAgLW1hcm0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxn
cmluZC8wMDAxLXZhbGdyaW5kLWZpbHRlcl94bWxfZnJhbWVzLWRvLW5vdC1maWx0ZXItdXNyLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtdmFsZ3Jp
bmQtZmlsdGVyX3htbF9mcmFtZXMtZG8tbm90LWZpbHRlci11c3IucGF0Y2gKaW5kZXggYzY0YzJh
ZmQzZi4uZjM0NGIwNTAyMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdy
aW5kL3ZhbGdyaW5kLzAwMDEtdmFsZ3JpbmQtZmlsdGVyX3htbF9mcmFtZXMtZG8tbm90LWZpbHRl
ci11c3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5k
LzAwMDEtdmFsZ3JpbmQtZmlsdGVyX3htbF9mcmFtZXMtZG8tbm90LWZpbHRlci11c3IucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGY4ZmJlYmNmNjllNGE4YmYyMTIyYjdjNTVmMmNlMzcyMzc3
YWYxYmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGE2ZDNjZDg3YTlmOWJkNmI2ZjJi
ZjE2NzdkZmYzZThjNGQ5NTY0YmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSYW5k
eSBNYWNMZW9kIDxSYW5keS5NYWNMZW9kQHdpbmRyaXZlci5jb20+CiBEYXRlOiBNb24sIDEzIE1h
eSAyMDE5IDE3OjEyOjIxIC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHZhbGdyaW5kOiBmaWx0ZXJf
eG1sX2ZyYW1lczogZG8gbm90IGZpbHRlciAvdXNyCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMy1jb3JyZWN0LWluY2x1ZGUtZGlyZWN0aXZl
LXBhdGgtZm9yLWNvbmZpZy5oLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5k
L3ZhbGdyaW5kLzAwMDMtY29ycmVjdC1pbmNsdWRlLWRpcmVjdGl2ZS1wYXRoLWZvci1jb25maWcu
aC5wYXRjaAppbmRleCAzYWNiNWEyOGY0Li4wYzFmNTEzOTM0IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMy1jb3JyZWN0LWluY2x1ZGUtZGly
ZWN0aXZlLXBhdGgtZm9yLWNvbmZpZy5oLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxncmluZC92YWxncmluZC8wMDAzLWNvcnJlY3QtaW5jbHVkZS1kaXJlY3RpdmUtcGF0aC1m
b3ItY29uZmlnLmgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGRlNGQ3ZTQ3ODUxNWI2M2Yw
NDliMjExMjY2ZDliOTQ2YzE1Y2MwYjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU0
ZWYzOWYyODRhMmJmMjkyYTk3MzYzYzhjM2VkZGYzOTY1ODdjMzAgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogU2F0LCAx
MCBKdW4gMjAxNyAwMTowMzoxNyAtMDcwMAogU3ViamVjdDogW1BBVENIXSBjb3JyZWN0IGluY2x1
ZGUgZGlyZWN0aXZlIHBhdGggZm9yIGNvbmZpZy5oCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvQWRkZWQtc3VwcG9ydC1mb3ItUFBDLWluc3RydWN0
aW9ucy1tZmF0YnUtbWZhdGJsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5k
L3ZhbGdyaW5kL0FkZGVkLXN1cHBvcnQtZm9yLVBQQy1pbnN0cnVjdGlvbnMtbWZhdGJ1LW1mYXRi
bC5wYXRjaAppbmRleCAxMDljYWY3NmFiLi42MWViOGUyOTJhIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvQWRkZWQtc3VwcG9ydC1mb3ItUFBDLWlu
c3RydWN0aW9ucy1tZmF0YnUtbWZhdGJsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxncmluZC92YWxncmluZC9BZGRlZC1zdXBwb3J0LWZvci1QUEMtaW5zdHJ1Y3Rpb25zLW1m
YXRidS1tZmF0YmwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDg1YmZmOTkzMDg3Y2Q3MzY3
ZmZjMzVkZTUyNWMyYmY2MTYyMzk4ZDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZj
Zjc0MjQ1NTlhNjc2YjlhMTMwNDUyMzUwYTkyZjM4ZGQyZWQ5ZTYgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBBbmVlc2ggQmFuc2FsIDxhbmVlc2guYmFuc2FsQGZyZWVzY2FsZS5jb20+
CiBEYXRlOiBNb24sIDIxIE5vdiAyMDExIDE3OjMxOjM5ICswNTMwCiBTdWJqZWN0OiBbUEFUQ0hd
IEFkZGVkIHN1cHBvcnQgZm9yIFBQQyBpbnN0cnVjdGlvbnMgbWZhdGJ1LCBtZmF0YmwuCkBAIC0x
Nyw3ICsxNyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFuZWVzaCBCYW5zYWwgPGFuZWVzaC5iYW5zYWxA
ZnJlZXNjYWxlLmNvbT4KICAzIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKIAogZGlm
ZiAtLWdpdCBhL1ZFWC9wcml2L2d1ZXN0X3BwY19kZWZzLmggYi9WRVgvcHJpdi9ndWVzdF9wcGNf
ZGVmcy5oCi1pbmRleCAyMjBmYmYxLi5jZDI1OWYzIDEwMDY0NAoraW5kZXggZjU1NzFjNC4uN2I4
MGM5NiAxMDA2NDQKIC0tLSBhL1ZFWC9wcml2L2d1ZXN0X3BwY19kZWZzLmgKICsrKyBiL1ZFWC9w
cml2L2d1ZXN0X3BwY19kZWZzLmgKIEBAIC0yMzMsNiArMjMzLDggQEAgZXh0ZXJuIFVJbnQgcHBj
MzJnX2RpcnR5aGVscGVyX01GU1BSXzI2OF8yNjkgKCBVSW50ICk7CkBAIC0zMCw3ICszMCw3IEBA
IGluZGV4IDIyMGZiZjEuLmNkMjU5ZjMgMTAwNjQ0CiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFVJbnQgdkRfaWR4LCBVSW50IHNoLAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBVSW50IHNoaWZ0X3JpZ2h0ICk7CiBkaWZmIC0tZ2l0IGEvVkVYL3By
aXYvZ3Vlc3RfcHBjX2hlbHBlcnMuYyBiL1ZFWC9wcml2L2d1ZXN0X3BwY19oZWxwZXJzLmMKLWlu
ZGV4IDI2MTFlNTIuLjcyYzM0OWIgMTAwNjQ0CitpbmRleCBhNDgxNjRhLi4yMjliNWE4IDEwMDY0
NAogLS0tIGEvVkVYL3ByaXYvZ3Vlc3RfcHBjX2hlbHBlcnMuYwogKysrIGIvVkVYL3ByaXYvZ3Vl
c3RfcHBjX2hlbHBlcnMuYwogQEAgLTExOCw2ICsxMTgsMjQgQEAgVUludCBwcGMzMmdfZGlydHlo
ZWxwZXJfTUZTUFJfMjg3ICggdm9pZCApCkBAIC01OSwxMCArNTksMTAgQEAgaW5kZXggMjYxMWU1
Mi4uNzJjMzQ5YiAxMDA2NDQKICAvKiBDQUxMRUQgRlJPTSBHRU5FUkFURUQgQ09ERSAqLwogIC8q
IERJUlRZIEhFTFBFUiAocmVhZHMgZ3Vlc3Qgc3RhdGUsIHdyaXRlcyBndWVzdCBtZW0pICovCiBk
aWZmIC0tZ2l0IGEvVkVYL3ByaXYvZ3Vlc3RfcHBjX3RvSVIuYyBiL1ZFWC9wcml2L2d1ZXN0X3Bw
Y190b0lSLmMKLWluZGV4IDE4NzE2ZGQuLmIyZTcyYTAgMTAwNjQ0CitpbmRleCBhNTEzNGU2Li5m
NDRkYTMyIDEwMDY0NAogLS0tIGEvVkVYL3ByaXYvZ3Vlc3RfcHBjX3RvSVIuYwogKysrIGIvVkVY
L3ByaXYvZ3Vlc3RfcHBjX3RvSVIuYwotQEAgLTExODc1LDYgKzExODc1LDI4IEBAIHN0YXRpYyBC
b29sIGRpc19wcm9jX2N0bCAoIGNvbnN0IFZleEFiaUluZm8qIHZiaSwgVUludCBwcmVmaXgsIFVJ
bnQgdGhlSW5zdHIgKQorQEAgLTExODY0LDYgKzExODY0LDI4IEBAIHN0YXRpYyBCb29sIGRpc19w
cm9jX2N0bCAoIGNvbnN0IFZleEFiaUluZm8qIHZiaSwgVUludCBwcmVmaXgsIFVJbnQgdGhlSW5z
dHIgKQogICAgICAgICAgIGJyZWFrOwogICAgICAgIH0KICAKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC9hdm9pZC1uZW9uLWZvci10YXJnZXRzLXdo
aWNoLWRvbi10LXN1cHBvcnQtaXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3Jp
bmQvdmFsZ3JpbmQvYXZvaWQtbmVvbi1mb3ItdGFyZ2V0cy13aGljaC1kb24tdC1zdXBwb3J0LWl0
LnBhdGNoCmluZGV4IDE1OTdiM2EwMjEuLjcwZmQ0M2YyNWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC9hdm9pZC1uZW9uLWZvci10YXJnZXRzLXdo
aWNoLWRvbi10LXN1cHBvcnQtaXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGdyaW5kL3ZhbGdyaW5kL2F2b2lkLW5lb24tZm9yLXRhcmdldHMtd2hpY2gtZG9uLXQtc3VwcG9y
dC1pdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTk2MzcyYmM5YjRkMzFiYzk4MTE4ODFj
ZmE3NDdkOTlhOGMyNTE0MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNGM3ZGU5Mzc1
NDhhMDE0NWU1MmZhZGY1NmUyNDE5MzI1OGE2NGFlMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDE5
IEphbiAyMDE2IDE2OjQyOjM2IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF2b2lkIG5lb24gZm9y
IHRhcmdldHMgd2hpY2ggZG9uJ3Qgc3VwcG9ydCBpdApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL2ZpeGVkLXBlcmwtcGF0aC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC9maXhlZC1wZXJsLXBhdGgucGF0Y2gK
aW5kZXggNmJmYzYwMzVlZC4uNjUxMTU0MDAwNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL2ZpeGVkLXBlcmwtcGF0aC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvZml4ZWQtcGVybC1wYXRoLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0MDhmOWIzOWNhNGY1NzA5YjY2OGYxMzgyOWE5NGM0Y2Fl
ODU1MDA2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmYmE3MTRlYTIyZGZkYTc5MmM4
NGQ4ZTI3MThiMWY3ZDc2ZWYzNjExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUWlu
ZyBIZSA8cWluZy5oZUBpbnRlbC5jb20+CiBEYXRlOiBUdWUsIDMxIEF1ZyAyMDEwIDIyOjUxOjU4
ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHZhbGdyaW5kOiBmaXggcGVybCBzY3JpcHRzCkBAIC0y
NCw3ICsyNCw3IEBAIFNpZ25lZC1vZmYtYnk6IE1heGluIEIuIEpvaG4gPG1heGluLmpvaG5AaW50
ZWwuY29tPgogIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQogCiBkaWZmIC0tZ2l0IGEvbWFzc2lmL21zX3ByaW50LmluIGIvbWFzc2lmL21zX3ByaW50Lmlu
Ci1pbmRleCBhMjA2Y2U0Li5kZjFiYzMxIDEwMDc1NQoraW5kZXggZWNkOWYzOC4uMzMxMzlkZSAx
MDA2NDQKIC0tLSBhL21hc3NpZi9tc19wcmludC5pbgogKysrIGIvbWFzc2lmL21zX3ByaW50Lmlu
CiBAQCAtMSw0ICsxLDQgQEAKQEAgLTM0LDcgKzM0LDcgQEAgaW5kZXggYTIwNmNlNC4uZGYxYmMz
MSAxMDA3NTUKICAjIy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIyMKICAjIy0tLSBNYXNzaWYncyByZXN1bHRzIHByaW50
ZXIgICAgICAgICAgICAgICAgICAgICAgICAgbXNfcHJpbnQuaW4gLS0tIyMKIGRpZmYgLS1naXQg
YS9wZXJmL3ZnX3BlcmYuaW4gYi9wZXJmL3ZnX3BlcmYuaW4KLWluZGV4IDkwZWUxZDIuLmM1ODUw
OTYgMTAwNjQ0CitpbmRleCBjYzI3ODM0Li4wZTQ5NTUwIDEwMDY0NAogLS0tIGEvcGVyZi92Z19w
ZXJmLmluCiArKysgYi9wZXJmL3ZnX3BlcmYuaW4KIEBAIC0xLDQgKzEsNCBAQApAQCAtNDQsNyAr
NDQsNyBAQCBpbmRleCA5MGVlMWQyLi5jNTg1MDk2IDEwMDY0NAogICMjLS0tIFZhbGdyaW5kIHBl
cmZvcm1hbmNlIHRlc3Rpbmcgc2NyaXB0ICAgICAgICAgICAgICAgICAgdmdfcGVyZiAtLS0jIwog
ICMjLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0jIwogZGlmZiAtLWdpdCBhL3Rlc3RzL3ZnX3JlZ3Rlc3QuaW4gYi90ZXN0
cy92Z19yZWd0ZXN0LmluCi1pbmRleCAzNDcxMzIyLi40OWUxMTE0IDEwMDc1NQoraW5kZXggMmM0
ZmU4Yy4uMjAxNzg0MSAxMDA2NDQKIC0tLSBhL3Rlc3RzL3ZnX3JlZ3Rlc3QuaW4KICsrKyBiL3Rl
c3RzL3ZnX3JlZ3Rlc3QuaW4KIEBAIC0xLDQgKzEsNCBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3MzOTB4X3ZlY19vcF90LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3MzOTB4X3ZlY19vcF90LnBhdGNo
CmluZGV4IDE5NjkwZTVlYmIuLmRlNzU4ZTZhMDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy92YWxncmluZC92YWxncmluZC9zMzkweF92ZWNfb3BfdC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvczM5MHhfdmVjX29wX3QucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDhjOTIwODk3NDFkODA5Y2ZkMTgzNTRmMWI0ZGYxOGNkMjgz
OThhMjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDViZTA5MGY5MWJiZWJlZjA2MTMy
ZjBmOTNmYjc0ODg2YWMyMWNkMTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBZaSBG
YW4gWXUgPHlpZmFuLnl1QHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDE3IE1hciAyMDIxIDEy
OjE2OjMxIC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHJlbW92ZSBzMzkweF92ZWNfb3BfdApAQCAt
MTgsMTAgKzE4LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFlpIEZhbiBZdSA8eWlmYW4ueXVAd2luZHJp
dmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IAogZGlmZiAtLWdpdCBhL1ZFWC9wcml2L2d1ZXN0X3MzOTBfZGVmcy5oIGIvVkVYL3ByaXYvZ3Vl
c3RfczM5MF9kZWZzLmgKLWluZGV4IDI5ZWZhMDEuLjNhOGYwYTAgMTAwNjQ0CitpbmRleCAxZDNh
MmJlLi42ODRlYjJiIDEwMDY0NAogLS0tIGEvVkVYL3ByaXYvZ3Vlc3RfczM5MF9kZWZzLmgKICsr
KyBiL1ZFWC9wcml2L2d1ZXN0X3MzOTBfZGVmcy5oCi1AQCAtMjg1LDcgKzI4NSw3IEBAIHR5cGVk
ZWYgZW51bSB7CitAQCAtMjgwLDcgKzI4MCw3IEBAIHR5cGVkZWYgZW51bSB7CiAgICAgUzM5MF9W
RUNfT1BfVkNMRk5MLAogICAgIFMzOTBfVkVDX09QX1ZDUk5GLAogICAgIFMzOTBfVkVDX09QX0xB
U1QgICAgICAgICAgICAgLy8gc3VwcG9zZWQgdG8gYmUgdGhlIGxhc3QgZWxlbWVudCBpbiBlbnVt
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvdXNl
LWFwcHJvcHJpYXRlLW1hcmNoLW1jcHUtbWZwdS1mb3ItQVJNLXRlc3QtYXBwcy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC91c2UtYXBwcm9wcmlhdGUtbWFy
Y2gtbWNwdS1tZnB1LWZvci1BUk0tdGVzdC1hcHBzLnBhdGNoCmluZGV4IDBjMThhNjNjMmIuLjBh
M2JiZGU3MTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxn
cmluZC91c2UtYXBwcm9wcmlhdGUtbWFyY2gtbWNwdS1tZnB1LWZvci1BUk0tdGVzdC1hcHBzLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC91c2UtYXBw
cm9wcmlhdGUtbWFyY2gtbWNwdS1tZnB1LWZvci1BUk0tdGVzdC1hcHBzLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBhNWNkMDBmMWMyZDc4ZTJhMTVmNGEwYzU5NWY1YWMxMGNhNGMzMjkwIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxN2M0ZDQ5YTk3YmU4MDM2ZTJjMDJkYzdiZjZm
ZGQyOTU3MGJlY2E5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmUgTWNDdXJk
eSA8YXJtY2N1cmR5QGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMTkgSmFuIDIwMTYgMTY6MDA6MDAg
LTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdXNlIGFwcHJvcHJpYXRlIC1tYXJjaC8tbWNwdS8tbWZw
dSBmb3IgQVJNIHRlc3QgYXBwcwpAQCAtMjMsMTAgKzIzLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFu
ZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL25vbmUvdGVzdHMvYXJt
L01ha2VmaWxlLmFtIGIvbm9uZS90ZXN0cy9hcm0vTWFrZWZpbGUuYW0KLWluZGV4IDc5Yjk1N2Mu
LjQxYTVhMDMgMTAwNjQ0CitpbmRleCA1MjQxYmJkLi5kMTk3NTc1IDEwMDY0NAogLS0tIGEvbm9u
ZS90ZXN0cy9hcm0vTWFrZWZpbGUuYW0KICsrKyBiL25vbmUvdGVzdHMvYXJtL01ha2VmaWxlLmFt
Ci1AQCAtODcsOCArODcsMTAgQEAgbmVvbjY0X0NGTEFHUyAgICAgPSAkKEFNX0NGTEFHUykgLWcg
LU8wIC1tY3B1PWNvcnRleC1hOCBcCitAQCAtODYsOCArODYsMTAgQEAgbmVvbjY0X0NGTEFHUyAg
ICAgPSAkKEFNX0NGTEFHUykgLWcgLU8wIC1tY3B1PWNvcnRleC1hOCBcCiAgCQkJLW1mcHU9bmVv
biBcCiAgCQkJLW10aHVtYgogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGdyaW5kL3ZhbGdyaW5kL3ZhbGdyaW5kLW1ha2UtbGQtWFhYLnNvLXN0cmxlbi1pbnRlcmNlcHQt
b3B0aW9uYWwucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQv
dmFsZ3JpbmQtbWFrZS1sZC1YWFguc28tc3RybGVuLWludGVyY2VwdC1vcHRpb25hbC5wYXRjaApp
bmRleCBjYTdmNzIxZDljLi4xYWFiODQ0YWE1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvdmFsZ3JpbmQtbWFrZS1sZC1YWFguc28tc3RybGVuLWlu
dGVyY2VwdC1vcHRpb25hbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3Jp
bmQvdmFsZ3JpbmQvdmFsZ3JpbmQtbWFrZS1sZC1YWFguc28tc3RybGVuLWludGVyY2VwdC1vcHRp
b25hbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjQwNzUxNGFhMWE0ZmQzNjY3YjMwNTI3
MjYwZTI3MWRhMzRjZTRhNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjAzMTAyZTgx
Njg0N2UwMTJkZDdiNGQyMzViMTFlYTQzYzcyZTVmOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDEz
IERlYyAyMDE2IDExOjI5OjU1ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1ha2UgbGQtWFhYLnNv
IHN0cmxlbiBpbnRlcmNlcHQgb3B0aW9uYWwKQEAgLTE3LDEwICsxNywxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBKYWNraWUgSHVhbmcgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9j
b3JlZ3JpbmQvbV9yZWRpci5jIGIvY29yZWdyaW5kL21fcmVkaXIuYwotaW5kZXggNjMxNzJiOS4u
MWI1YmY5NSAxMDA2NDQKK2luZGV4IDBjNDM3MzEuLjFiYWZiNDcgMTAwNjQ0CiAtLS0gYS9jb3Jl
Z3JpbmQvbV9yZWRpci5jCiArKysgYi9jb3JlZ3JpbmQvbV9yZWRpci5jCi1AQCAtMTMyMSw3ICsx
MzIxLDE4IEBAIHN0YXRpYyB2b2lkIGFkZF9oYXJkd2lyZWRfc3BlYyAoY29uc3QgIEhDaGFyKiBz
b3BhdHQsIGNvbnN0IEhDaGFyKiBmbnBhdHQsCitAQCAtMTM0OSw3ICsxMzQ5LDE4IEBAIHN0YXRp
YyB2b2lkIGFkZF9oYXJkd2lyZWRfc3BlYyAoY29uc3QgIEhDaGFyKiBzb3BhdHQsIGNvbnN0IEhD
aGFyKiBmbnBhdHQsCiAgICAgc3BlYy0+dG9fYWRkciAgICAgPSB0b19hZGRyOwogICAgIHNwZWMt
PmlzV3JhcCAgICAgID0gRmFsc2U7CiAgICAgc3BlYy0+aXNHbG9iYWwgICAgPSBGYWxzZTsKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZF8zLjI3LjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmRfMy4yNy4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxn
cmluZC92YWxncmluZF8zLjI3LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy92
YWxncmluZC92YWxncmluZF8zLjI3LjEuYmIKaW5kZXggNDg4NmRkMGQzYi4uMWIwOGYyZmM1ZiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kXzMuMjcu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmRfMy4yNy4x
LmJiCkBAIC0yNyw3ICsyNyw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9w
dWIvdmFsZ3JpbmQvdmFsZ3JpbmQtJHtQVn0udGFyLmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLXRlc3RzLWFybS1Vc2UtTy1pbnN0ZWFkLW9mLU8wLnBhdGNoIFwKICAgICAgICAgICAgZmls
ZTovLzAwMDEtZ2V0ZGVudHNfZmlsdGVyLmMtd29ya2Fyb3VuZC1vZmY2NF90LW5vdC1kZWZpbmVk
LWluLS5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1YjU5Mzdk
ZTgyNTdlZThmNTE2OThlYTcxYjk3MTFhZGNlOTgwNjFhYTA3ZGFhNGE2ODVlZmMzYWY5MjE1YmVm
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVkNTg5MTUyZWI4MDcxYzAyZmVhYjhjZTZhYjcxOWU0
MzFhMWZiYzNlMmIxNzAwZjU0MzI2MzJhOGI5MjY0ZGMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9
ICJ2YWxncmluZC0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAogQ09NUEFUSUJMRV9IT1NU
ID0gJyhpLjg2fHg4Nl82NHxhcm18YWFyY2g2NHxtaXBzfHBvd2VycGN8cG93ZXJwYzY0fHJpc2N2
NjQpLiotbGludXgnCi0tIAoyLjQ3LjEKCg==

--===============3076446398779891085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/valgrind: SRC_URI changed from "https://sourceware.org/pub/valgrind/valgrind-3.27.0.tar.bz2 file://fixed-perl-path.patch file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch file://avoid-neon-for-targets-which-don-t-support-it.patch file://0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch file://0003-correct-include-directive-path-for-config.h.patch file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch file://s390x_vec_op_t.patch file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch file://0001-docs-Disable-manual-validation.patch file://
 0001-tests-arm-Use-O-instead-of-O0.patch file://0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch" to "https://sourceware.org/pub/valgrind/valgrind-3.27.1.tar.bz2 file://fixed-perl-path.patch file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch file://avoid-neon-for-targets-which-don-t-support-it.patch file://0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch file://0003-correct-include-directive-path-for-config.h.patch file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch file://s390x_vec_op_t.patch file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch 
 file://0001-docs-Disable-manual-validation.patch file://0001-tests-arm-Use-O-instead-of-O0.patch file://0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch"
packages/x86-64-v3-poky-linux/valgrind: PKGV changed from 3.27.0 [default] to 3.27.1 [default]
packages/x86-64-v3-poky-linux/valgrind: PV changed from "3.27.0" to "3.27.1"
packages/x86-64-v3-poky-linux/valgrind/valgrind-cachegrind: PKGV changed from 3.27.0 [default] to 3.27.1 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-cachegrind: PV changed from "3.27.0" to "3.27.1"
packages/x86-64-v3-poky-linux/valgrind/valgrind-callgrind: PKGV changed from 3.27.0 [default] to 3.27.1 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-callgrind: PV changed from "3.27.0" to "3.27.1"
packages/x86-64-v3-poky-linux/valgrind/valgrind-dbg: PKGV changed from 3.27.0 [default] to 3.27.1 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-dbg: PKGSIZE changed from 111443080 to 111489968 (+0%)
packages/x86-64-v3-poky-linux/valgrind/valgrind-dbg: PV changed from "3.27.0" to "3.27.1"
packages/x86-64-v3-poky-linux/valgrind/valgrind-dev: PKGV changed from 3.27.0 [default] to 3.27.1 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-dev: PV changed from "3.27.0" to "3.27.1"
packages/x86-64-v3-poky-linux/valgrind/valgrind-doc: PKGV changed from 3.27.0 [default] to 3.27.1 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-doc: PKGSIZE changed from 18622942 to 18886704 (+1%)
packages/x86-64-v3-poky-linux/valgrind/valgrind-doc: PV changed from "3.27.0" to "3.27.1"
packages/x86-64-v3-poky-linux/valgrind/valgrind-locale: PKGV changed from 3.27.0 [default] to 3.27.1 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-locale: PV changed from "3.27.0" to "3.27.1"
packages/x86-64-v3-poky-linux/valgrind/valgrind-massif: PKGV changed from 3.27.0 [default] to 3.27.1 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-massif: PV changed from "3.27.0" to "3.27.1"
packages/x86-64-v3-poky-linux/valgrind/valgrind-src: PKGV changed from 3.27.0 [default] to 3.27.1 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-src: PKGSIZE changed from 24014576 to 24021250 (+0%)
packages/x86-64-v3-poky-linux/valgrind/valgrind-src: PV changed from "3.27.0" to "3.27.1"
packages/x86-64-v3-poky-linux/valgrind/valgrind-src: FILELIST: directory renamed /usr/src/debug/valgrind/3.27.0/coregrind/m_initimg -> /usr/src/debug/valgrind/3.27.1/coregrind/m_initimg, directory renamed /usr/src/debug/valgrind/3.27.0/cachegrind -> /usr/src/debug/valgrind/3.27.1/cachegrind, directory renamed /usr/src/debug/valgrind/3.27.0/VEX/priv/objdump -> /usr/src/debug/valgrind/3.27.1/VEX/priv/objdump, directory renamed /usr/src/debug/valgrind/3.27.0/drd -> /usr/src/debug/valgrind/3.27.1/drd, directory renamed /usr/src/debug/valgrind/3.27.0/coregrind -> /usr/src/debug/valgrind/3.27.1/coregrind, directory renamed /usr/src/debug/valgrind/3.27.0/coregrind/m_coredump -> /usr/src/debug/valgrind/3.27.1/coregrind/m_coredump, directory renamed /usr/src/debug/valgrind/3.27.0/exp-bbv -> /usr/src/debug/valgrind/3.27.1/exp-bbv, directory renamed /usr/src/debug/valgrind/3.27.0/coregrind/m_gdbserver -> /usr/src/debug/valgrind/3.27.1/coregrind/m_gdbserver, directory renamed /usr/src/debug/valg
 rind/3.27.0/coregrind/m_replacemalloc -> /usr/src/debug/valgrind/3.27.1/coregrind/m_replacemalloc, directory renamed /usr/src/debug/valgrind/3.27.0/coregrind/m_debuginfo -> /usr/src/debug/valgrind/3.27.1/coregrind/m_debuginfo, directory renamed /usr/src/debug/valgrind/3.27.0/lackey -> /usr/src/debug/valgrind/3.27.1/lackey, directory renamed /usr/src/debug/valgrind/3.27.0/coregrind/m_sigframe -> /usr/src/debug/valgrind/3.27.1/coregrind/m_sigframe, directory renamed /usr/src/debug/valgrind/3.27.0/VEX/priv -> /usr/src/debug/valgrind/3.27.1/VEX/priv, directory renamed /usr/src/debug/valgrind/3.27.0/coregrind/m_extension -> /usr/src/debug/valgrind/3.27.1/coregrind/m_extension, directory renamed /usr/src/debug/valgrind/3.27.0/coregrind/m_ume -> /usr/src/debug/valgrind/3.27.1/coregrind/m_ume, directory renamed /usr/src/debug/valgrind/3.27.0/helgrind -> /usr/src/debug/valgrind/3.27.1/helgrind, directory renamed /usr/src/debug/valgrind/3.27.0/include -> /usr/src/debug/valgrind/3.27.1/include
 , directory renamed /usr/src/debug/valgrind/3.27.0/dhat -> /usr/src/debug/valgrind/3.27.1/dhat, directory renamed /usr/src/debug/valgrind/3.27.0/include/vki -> /usr/src/debug/valgrind/3.27.1/include/vki, directory renamed /usr/src/debug/valgrind/3.27.0/coregrind/m_syswrap -> /usr/src/debug/valgrind/3.27.1/coregrind/m_syswrap, directory renamed /usr/src/debug/valgrind/3.27.0/VEX/pub -> /usr/src/debug/valgrind/3.27.1/VEX/pub, directory renamed /usr/src/debug/valgrind/3.27.0/memcheck -> /usr/src/debug/valgrind/3.27.1/memcheck, directory renamed /usr/src/debug/valgrind/3.27.0/none -> /usr/src/debug/valgrind/3.27.1/none, directory renamed /usr/src/debug/valgrind/3.27.0/callgrind -> /usr/src/debug/valgrind/3.27.1/callgrind, directory renamed /usr/src/debug/valgrind/3.27.0/coregrind/m_gdbserver/gdb -> /usr/src/debug/valgrind/3.27.1/coregrind/m_gdbserver/gdb, directory renamed /usr/src/debug/valgrind/3.27.0/coregrind/m_dispatch -> /usr/src/debug/valgrind/3.27.1/coregrind/m_dispatch, directo
 ry renamed /usr/src/debug/valgrind/3.27.0/coregrind/m_aspacemgr -> /usr/src/debug/valgrind/3.27.1/coregrind/m_aspacemgr, directory renamed /usr/src/debug/valgrind/3.27.0/coregrind/m_demangle -> /usr/src/debug/valgrind/3.27.1/coregrind/m_demangle, directory renamed /usr/src/debug/valgrind/3.27.0/massif -> /usr/src/debug/valgrind/3.27.1/massif, directory renamed /usr/src/debug/valgrind/3.27.0/shared -> /usr/src/debug/valgrind/3.27.1/shared, directory renamed /usr/src/debug/valgrind/3.27.0/auxprogs -> /usr/src/debug/valgrind/3.27.1/auxprogs, removed "/usr/src/debug/valgrind/3.27.0/coregrind/m_scheduler/scheduler.c /usr/src/debug/valgrind/3.27.0/coregrind/m_scheduler/sched-lock-generic.c /usr/src/debug/valgrind/3.27.0/coregrind/m_scheduler/sched-lock.c /usr/src/debug/valgrind/3.27.0/coregrind/m_scheduler/priv_sema.h /usr/src/debug/valgrind/3.27.0/coregrind/m_scheduler/priv_sched-lock.h /usr/src/debug/valgrind/3.27.0/coregrind/m_scheduler/priv_sched-lock-impl.h /usr/src/debug/valgrind/3.
 27.0/coregrind/m_scheduler/sema.c", added "/usr/src/debug/valgrind/3.27.1/coregrind/m_scheduler/scheduler.c /usr/src/debug/valgrind/3.27.1/coregrind/m_scheduler/sched-lock-generic.c /usr/src/debug/valgrind/3.27.1/coregrind/m_scheduler/ticket-lock-linux.c /usr/src/debug/valgrind/3.27.1/coregrind/m_scheduler/sched-lock.c /usr/src/debug/valgrind/3.27.1/coregrind/m_scheduler/priv_sched-lock.h /usr/src/debug/valgrind/3.27.1/coregrind/m_scheduler/priv_sema.h /usr/src/debug/valgrind/3.27.1/coregrind/m_scheduler/priv_sched-lock-impl.h /usr/src/debug/valgrind/3.27.1/coregrind/m_scheduler/sema.c"
packages/x86-64-v3-poky-linux/valgrind/valgrind-staticdev: PKGV changed from 3.27.0 [default] to 3.27.1 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind-staticdev: PKGSIZE changed from 48375266 to 48387398 (+0%)
packages/x86-64-v3-poky-linux/valgrind/valgrind-staticdev: PV changed from "3.27.0" to "3.27.1"
packages/x86-64-v3-poky-linux/valgrind/valgrind: PKGV changed from 3.27.0 [default] to 3.27.1 [default]
packages/x86-64-v3-poky-linux/valgrind/valgrind: PKGSIZE changed from 28438060 to 28462636 (+0%)
packages/x86-64-v3-poky-linux/valgrind/valgrind: PV changed from "3.27.0" to "3.27.1"

--===============3076446398779891085==--

