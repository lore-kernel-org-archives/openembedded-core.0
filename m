Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979FEC47DD7
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:06 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.4592.1704114719956425306
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:12:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AQO4UB4e;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dJzl14s4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018cc5270c6b-94a60f5b-e48a-4d3d-aa47-da28a5824c47-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Amc6y7xh1i6x4ysq4j79mgVosCPbuwiAii4AifHb+r8=;
	b=AQO4UB4ex3MmgPeBTF6wf1AJC9g24Lpmbm8F0dYH8g34ZZcUfbwYCnAS1DkTWd0c
	8GsJrM/ESkXC36PPuNG4idAMyOFeSsIX2a3Dwbf6C1e8wnDESWNIT2Z/+49tbZYzdnq
	IIVwHF8gKALofMtQaZXWMrSIBEmO4MlTI+MkT4eo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114720;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Amc6y7xh1i6x4ysq4j79mgVosCPbuwiAii4AifHb+r8=;
	b=dJzl14s4TFZBS1K0dPvUu1PqgbhldMf7Bk1cXdR0zxdAuzDz51c8l42NRbZLYq95
	4JQRjDD15tmOOVgb7FoYLp4OzSDGyh0HtT6tK8nogcu5+wvNskruEO11EDcJqZQBGtw
	j8emRxOAtZRtmdB0kMIGuOwreV0IJO8GwzTGifjU=
Content-Type: multipart/mixed; boundary="===============7787699440145918052=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] valgrind: upgrading to 3.22.0 FAILED
Message-ID: <0101018cc5270c6b-94a60f5b-e48a-4d3d-aa47-da28a5824c47-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193160

--===============7787699440145918052==
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
From 1a3016b39ff942c88ae22abfc2718f21a2675867 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 08:36:03 +0000
Subject: [PATCH] valgrind: upgrade 3.21.0 -> 3.22.0

---
 ...ions-static-to-avoid-assembler-error.patch |  24 +-
 ...rn-a-valid-exit_code-from-vg_regtest.patch |  10 +-
 .../0001-docs-Disable-manual-validation.patch |  10 +-
 ...opcode-not-supported-on-mips32-linux.patch |  18 +-
 ...etting-mcpu-to-cortex-a8-on-arm-arch.patch |  20 +-
 ...check-tests-Fix-timerfd-syscall-test.patch |  33 +-
 ...-vgtests-remove-fullpath-after-flags.patch |  10 +-
 ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch |   8 +-
 ...inux-seg_override.c-add-missing-incl.patch |  30 --
 ...ame-_sifields-to-__si_fields-on-musl.patch |  10 +-
 ...-filter_xml_frames-do-not-filter-usr.patch |  10 +-
 ...ntext-APIs-are-not-available-on-musl.patch |  14 +-
 ...-include-directive-path-for-config.h.patch |  10 +-
 ...est-wrapper-to-support-PTEST-formats.patch |   6 +-
 ...020-Committing-changes-from-do_patch.patch | 332 ++++++++++++++++++
 ...t-for-PPC-instructions-mfatbu-mfatbl.patch |  26 +-
 ...n-for-targets-which-don-t-support-it.patch |   6 +-
 .../valgrind/valgrind/fixed-perl-path.patch   |   2 +-
 .../valgrind/valgrind/s390x_vec_op_t.patch    |  12 +-
 ...te-march-mcpu-mfpu-for-ARM-test-apps.patch |  10 +-
 ...-ld-XXX.so-strlen-intercept-optional.patch |  10 +-
 ...{valgrind_3.21.0.bb => valgrind_3.22.0.bb} |   4 +-
 22 files changed, 445 insertions(+), 170 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0020-Committing-changes-from-do_patch.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.21.0.bb => valgrind_3.22.0.bb} (98%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch
index 8d2ca5733e..ad77d8834f 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch
@@ -1,4 +1,4 @@
-From 2155c1b2cf00e744e280c493eb74bf457dfcc3b1 Mon Sep 17 00:00:00 2001
+From aa83e0d9d1cd8051e868b8571824ce6b454c8ebc Mon Sep 17 00:00:00 2001
 From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Sun, 21 Oct 2018 15:09:31 -0400
 Subject: [PATCH] Make local functions static to avoid assembler error
@@ -21,12 +21,13 @@ and more importantly also avoid an assembler error:
 Upstream-Status: Submitted https://bugs.kde.org/show_bug.cgi?id=400164
 
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+
 ---
  helgrind/tests/annotate_hbefore.c | 34 +++++++++++++++----------------
  1 file changed, 17 insertions(+), 17 deletions(-)
 
 diff --git a/helgrind/tests/annotate_hbefore.c b/helgrind/tests/annotate_hbefore.c
-index e311714f7..f55514e45 100644
+index 259d3b6..8438701 100644
 --- a/helgrind/tests/annotate_hbefore.c
 +++ b/helgrind/tests/annotate_hbefore.c
 @@ -24,7 +24,7 @@ typedef  unsigned long int  UWord;
@@ -101,7 +102,7 @@ index e311714f7..f55514e45 100644
  {
    UWord success;
    UWord block[3] = { (UWord)addr, nyu, expected};
-@@ -256,7 +256,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+@@ -285,7 +285,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
  
  // mips64
  /* return 1 if success, 0 if failure */
@@ -110,7 +111,7 @@ index e311714f7..f55514e45 100644
  {
    UWord success;
    UWord block[3] = { (UWord)addr, nyu, expected};
-@@ -287,7 +287,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+@@ -316,7 +316,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
  
  #endif
  
@@ -119,7 +120,7 @@ index e311714f7..f55514e45 100644
  {
     while (1) {
        UWord old = *w;
-@@ -301,7 +301,7 @@ void atomic_incW ( UWord* w )
+@@ -330,7 +330,7 @@ void atomic_incW ( UWord* w )
  
  #define NNN 1000000
  
@@ -128,7 +129,7 @@ index e311714f7..f55514e45 100644
  {
    UWord* w = (UWord*)arg;
    int i;
-@@ -331,10 +331,10 @@ int main ( void )
+@@ -360,10 +360,10 @@ int main ( void )
  
  #endif
  
@@ -141,7 +142,7 @@ index e311714f7..f55514e45 100644
  {
     struct timespec ts = { 0, 1 * 1000 * 1000 };
     // We do the sleep in small pieces to have scheduling
-@@ -348,7 +348,7 @@ void delayXms ( int i )
+@@ -376,7 +376,7 @@ void delayXms ( int i )
     }
  }
  
@@ -150,7 +151,7 @@ index e311714f7..f55514e45 100644
  {
    UWord w0 = *w;
    UWord volatile * wV = w;
-@@ -357,7 +357,7 @@ void do_wait ( UWord* w )
+@@ -385,7 +385,7 @@ void do_wait ( UWord* w )
    ANNOTATE_HAPPENS_AFTER(w);
  }
  
@@ -159,7 +160,7 @@ index e311714f7..f55514e45 100644
  {
    ANNOTATE_HAPPENS_BEFORE(w);
    atomic_incW(w);
-@@ -365,7 +365,7 @@ void do_signal ( UWord* w )
+@@ -393,7 +393,7 @@ void do_signal ( UWord* w )
  
  
  
@@ -168,7 +169,7 @@ index e311714f7..f55514e45 100644
  {
    UWord* w = (UWord*)arg;
    delayXms(500);    // ensure t2 gets to its wait first
-@@ -376,7 +376,7 @@ void* thread_fn1 ( void* arg )
+@@ -404,7 +404,7 @@ void* thread_fn1 ( void* arg )
    return NULL;
  }
  
@@ -177,6 +178,3 @@ index e311714f7..f55514e45 100644
  {
    UWord* w = (UWord*)arg;
    do_wait(w);      // wait for h-b edge from first thread
--- 
-2.17.0
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch
index e7af5efecc..d5f1ba2d54 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch
@@ -1,4 +1,4 @@
-From 5eebdefd2251803e7d21081745018fcb16b2ba71 Mon Sep 17 00:00:00 2001
+From a954a674230055b76e2a95cac02c271c2f0c67a1 Mon Sep 17 00:00:00 2001
 From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Wed, 8 May 2019 20:16:52 -0400
 Subject: [PATCH] Return a valid exit_code from vg_regtest
@@ -6,15 +6,16 @@ Subject: [PATCH] Return a valid exit_code from vg_regtest
 Upstream-Status: Pending
 
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+
 ---
  tests/vg_regtest.in | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
-index 909af3be8..f2799c4e3 100755
+index e4bd8cb..fd575b2 100755
 --- a/tests/vg_regtest.in
 +++ b/tests/vg_regtest.in
-@@ -403,6 +403,7 @@ sub mysystem($)
+@@ -401,6 +401,7 @@ sub mysystem($)
              exit 1;
          }
      }
@@ -22,6 +23,3 @@ index 909af3be8..f2799c4e3 100755
  }
  # if $keepunfiltered, copies $1 to $1.unfiltered.out
  # renames $0 tp $1
--- 
-2.17.0
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
index 256ddb0c34..e161dca029 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
@@ -1,4 +1,4 @@
-From 99fc6fe9b66becac3c94068129e84217330a71a6 Mon Sep 17 00:00:00 2001
+From eec9a14f755627a17bea97c7cb7d38f71d08c30b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Jan 2022 18:26:02 -0800
 Subject: [PATCH] docs: Disable manual validation
@@ -14,15 +14,16 @@ Fixes
 
 Upstream-Status: Inappropriate [OE-Specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  docs/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/docs/Makefile.am b/docs/Makefile.am
-index d4250e8..c500306 100644
+index f9ba4e3..0b5a663 100644
 --- a/docs/Makefile.am
 +++ b/docs/Makefile.am
-@@ -192,7 +192,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
+@@ -194,7 +194,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
  	  touch $@; \
  	fi
  
@@ -31,6 +32,3 @@ index d4250e8..c500306 100644
  
  # The text version of the FAQ.
  FAQ.txt:
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-supported-on-mips32-linux.patch b/meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-supported-on-mips32-linux.patch
index 39b624d9f6..9484972749 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-supported-on-mips32-linux.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-supported-on-mips32-linux.patch
@@ -1,7 +1,7 @@
-From fb5362f205b37c5060fcd764a7ed393abe4f2f3d Mon Sep 17 00:00:00 2001
+From e9c662a5c11bab16f6f9d3a68fd5030f57d2a1f2 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 27 Jul 2018 17:39:37 +0800
-Subject: [PATCH 1/2] fix opcode not supported on mips32-linux
+Subject: [PATCH] fix opcode not supported on mips32-linux
 
 While build tests(`make check') on mips32-linux, there are
 serial failures such as:
@@ -24,6 +24,7 @@ but missed to pass them to tests which caused the above failure
 
 Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=396905]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  helgrind/tests/Makefile.am    | 5 +++++
  memcheck/tests/Makefile.am    | 5 +++++
@@ -31,10 +32,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  3 files changed, 14 insertions(+)
 
 diff --git a/helgrind/tests/Makefile.am b/helgrind/tests/Makefile.am
-index ad1af191a..6209d35a7 100644
+index 2f323d3..e10d9c0 100755
 --- a/helgrind/tests/Makefile.am
 +++ b/helgrind/tests/Makefile.am
-@@ -214,6 +214,11 @@ check_PROGRAMS += annotate_rwlock
+@@ -243,6 +243,11 @@ check_PROGRAMS += getaddrinfo
  endif
  
  AM_CFLAGS   += $(AM_FLAG_M3264_PRI)
@@ -47,10 +48,10 @@ index ad1af191a..6209d35a7 100644
  
  LDADD = -lpthread
 diff --git a/memcheck/tests/Makefile.am b/memcheck/tests/Makefile.am
-index 84e49405f..aff861a32 100644
+index 47b5384..3d92b32 100644
 --- a/memcheck/tests/Makefile.am
 +++ b/memcheck/tests/Makefile.am
-@@ -443,6 +443,11 @@ check_PROGRAMS += reach_thread_register
+@@ -590,6 +590,11 @@ check_PROGRAMS += wcsncpy
  endif
  
  AM_CFLAGS   += $(AM_FLAG_M3264_PRI)
@@ -63,7 +64,7 @@ index 84e49405f..aff861a32 100644
  
  if VGCONF_PLATFORMS_INCLUDE_ARM_LINUX
 diff --git a/none/tests/mips32/Makefile.am b/none/tests/mips32/Makefile.am
-index d11591d45..602cd26f6 100644
+index 70099ff..713ff20 100644
 --- a/none/tests/mips32/Makefile.am
 +++ b/none/tests/mips32/Makefile.am
 @@ -99,6 +99,10 @@ check_PROGRAMS = \
@@ -77,6 +78,3 @@ index d11591d45..602cd26f6 100644
  AM_CFLAGS    += @FLAG_M32@
  AM_CXXFLAGS  += @FLAG_M32@
  AM_CCASFLAGS += @FLAG_M32@
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
index 073713c139..a5690f35ce 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
@@ -1,4 +1,4 @@
-From 715cf122388f3527afa5649cebf9f1522c240693 Mon Sep 17 00:00:00 2001
+From 38a620d9065ea6f61e53b6f910da8bee2635fb7a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Apr 2017 10:11:16 -0700
 Subject: [PATCH] makefiles: Drop setting -mcpu to cortex-a8 on arm
@@ -13,6 +13,7 @@ Fixes
 Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=454346]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  Makefile.all.am            |  6 +++---
  helgrind/tests/Makefile.am |  6 +++---
@@ -20,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 15 insertions(+), 15 deletions(-)
 
 diff --git a/Makefile.all.am b/Makefile.all.am
-index 02059a3..c7c4700 100644
+index 94d65f2..b47ced7 100755
 --- a/Makefile.all.am
 +++ b/Makefile.all.am
-@@ -197,11 +197,11 @@ AM_CCASFLAGS_PPC64LE_LINUX  = @FLAG_M64@ -g
+@@ -234,11 +234,11 @@ AM_CCASFLAGS_X86_FREEBSD    = @FLAG_M32@ -g
  
  AM_FLAG_M3264_ARM_LINUX   = @FLAG_M32@
  AM_CFLAGS_ARM_LINUX       = @FLAG_M32@ \
@@ -39,10 +40,10 @@ index 02059a3..c7c4700 100644
  AM_FLAG_M3264_ARM64_LINUX = @FLAG_M64@
  AM_CFLAGS_ARM64_LINUX     = @FLAG_M64@ $(AM_CFLAGS_BASE)
 diff --git a/helgrind/tests/Makefile.am b/helgrind/tests/Makefile.am
-index df82169..07eb66a 100644
+index 3e2efad..2f323d3 100755
 --- a/helgrind/tests/Makefile.am
 +++ b/helgrind/tests/Makefile.am
-@@ -189,9 +189,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
+@@ -216,9 +216,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
  endif
  
  if VGCONF_PLATFORMS_INCLUDE_ARM_LINUX
@@ -56,10 +57,10 @@ index df82169..07eb66a 100644
  annotate_hbefore_CFLAGS = $(AM_CFLAGS)
  tc07_hbl1_CFLAGS        = $(AM_CFLAGS)
 diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
-index 024eb6d..ccecb90 100644
+index b337d77..a932164 100644
 --- a/none/tests/arm/Makefile.am
 +++ b/none/tests/arm/Makefile.am
-@@ -52,10 +52,10 @@ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
+@@ -56,10 +56,10 @@ allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
  # need special helping w.r.t -mfpu and -mfloat-abi, though.
  # Also force -O0 since -O takes hundreds of MB of memory 
  # for v6intThumb.c.
@@ -73,7 +74,7 @@ index 024eb6d..ccecb90 100644
  
  v8crypto_a_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -marm
  v8crypto_t_CFLAGS = $(AM_CFLAGS) -g -O0 -mfpu=crypto-neon-fp-armv8 -mthumb
-@@ -65,23 +65,23 @@ v8memory_a_CFLAGS = $(AM_CFLAGS) -g -O0 \
+@@ -72,23 +72,23 @@ v8memory_a_CFLAGS = $(AM_CFLAGS) -g -O0 \
  v8memory_t_CFLAGS = $(AM_CFLAGS) -g -O0 \
  			-march=armv8-a -mfpu=crypto-neon-fp-armv8 -mthumb
  
@@ -103,6 +104,3 @@ index 024eb6d..ccecb90 100644
 +vcvt_fixed_float_VFP_CFLAGS = $(AM_CFLAGS) -g -mfpu=vfpv3
  
  vfpv4_fma_CFLAGS  = $(AM_CFLAGS) -g -O0 -march=armv7ve -mcpu=cortex-a15 -mfpu=vfpv4 -marm
--- 
-2.12.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
index 15fbbe954f..4fe9417753 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
@@ -1,4 +1,4 @@
-From 5d411fd147d652e9d7bb259f4048693c6e4742aa Mon Sep 17 00:00:00 2001
+From f973a4a40fc7390531d309d5816d3581d4e2e048 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 9 Mar 2020 16:30:19 -0700
 Subject: [PATCH] memcheck/tests: Fix timerfd syscall test
@@ -9,15 +9,18 @@ have the implementation or syscall is not defined
 
 Upstream-Status: Submitted [https://sourceforge.net/p/valgrind/mailman/message/36943897/]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- config.h.in                            |  9 +++++++++
- configure.ac                           |  3 +++
- memcheck/tests/linux/timerfd-syscall.c | 10 ++++++++--
- 5 files changed, 32 insertions(+), 2 deletions(-)
+ config.h.in                            |  3 +++
+ configure.ac                           |  1 +
+ memcheck/tests/linux/timerfd-syscall.c | 14 +++++++++++---
+ 3 files changed, 15 insertions(+), 3 deletions(-)
 
+diff --git a/config.h.in b/config.h.in
+index bb50854..e392f2a 100644
 --- a/config.h.in
 +++ b/config.h.in
-@@ -301,6 +301,9 @@
+@@ -400,6 +400,9 @@
  /* Define to 1 if you have the <sys/sysnvl.h> header file. */
  #undef HAVE_SYS_SYSNVL_H
  
@@ -27,9 +30,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  /* Define to 1 if you have the <sys/time.h> header file. */
  #undef HAVE_SYS_TIME_H
  
+diff --git a/configure.ac b/configure.ac
+index bf024ac..bc3e5e6 100755
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4098,6 +4098,7 @@ AC_CHECK_HEADERS([       \
+@@ -4814,6 +4814,7 @@ AC_CHECK_HEADERS([       \
          sys/syscall.h    \
          sys/sysnvl.h     \
          sys/time.h       \
@@ -37,9 +42,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          sys/types.h      \
          ])
  
+diff --git a/memcheck/tests/linux/timerfd-syscall.c b/memcheck/tests/linux/timerfd-syscall.c
+index 61d75b5..1ba888a 100644
 --- a/memcheck/tests/linux/timerfd-syscall.c
 +++ b/memcheck/tests/linux/timerfd-syscall.c
-@@ -45,6 +45,9 @@
+@@ -42,6 +42,9 @@
  #if defined(HAVE_SYS_TIME_H)
  #include <sys/time.h>
  #endif
@@ -49,7 +56,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if defined(HAVE_SYS_TYPES_H)
  #include <sys/types.h>
  #endif
-@@ -54,7 +57,8 @@
+@@ -51,7 +54,8 @@
   * timerfd_* system call numbers introduced in 2.6.23. These constants are
   * not yet in the glibc 2.7 headers, that is why they are defined here.
   */
@@ -59,7 +66,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if defined(__x86_64__)
  #define __NR_timerfd_create  283
  #elif defined(__i386__)
-@@ -67,8 +71,10 @@
+@@ -64,8 +68,10 @@
  #error Cannot detect your architecture!
  #endif
  #endif
@@ -71,7 +78,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if defined(__x86_64__)
  #define __NR_timerfd_settime 286
  #define __NR_timerfd_gettime 287
-@@ -85,7 +91,7 @@
+@@ -82,7 +88,7 @@
  #error Cannot detect your architecture!
  #endif
  #endif
@@ -80,7 +87,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  /* Definitions from include/linux/timerfd.h */
-@@ -127,6 +133,7 @@ void set_timespec(struct timespec *tmr,
+@@ -124,6 +130,7 @@ void set_timespec(struct timespec *tmr, unsigned long long ustime)
    tmr->tv_nsec = (long) (1000ULL * (ustime % 1000000ULL));
  }
  
@@ -88,7 +95,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  int timerfd_create(int clockid, int flags)
  {
    return syscall(__NR_timerfd_create, clockid, flags);
-@@ -142,6 +149,7 @@ int timerfd_gettime(int ufc, struct itim
+@@ -139,6 +146,7 @@ int timerfd_gettime(int ufc, struct itimerspec *otmr)
  {
    return syscall(__NR_timerfd_gettime, ufc, otmr);
  }
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
index dce8b52ba3..f1df16936e 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
@@ -1,4 +1,4 @@
-From 3ff82dcb844f98dbf67c69f11f6516bc234725a9 Mon Sep 17 00:00:00 2001
+From 222d377e09bd9bc52545c88687bce75ece228645 Mon Sep 17 00:00:00 2001
 From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
 Date: Wed, 16 Sep 2020 13:45:07 -0400
 Subject: [PATCH] memcheck vgtests remove fullpath-after flags
@@ -14,13 +14,14 @@ paths in corresponding tests .bb script.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
+
 ---
  memcheck/tests/badfree3.vgtest | 2 +-
  memcheck/tests/varinfo5.vgtest | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/memcheck/tests/badfree3.vgtest b/memcheck/tests/badfree3.vgtest
-index 3dfc5fd8a..4ee03f00a 100644
+index 3dfc5fd..4ee03f0 100644
 --- a/memcheck/tests/badfree3.vgtest
 +++ b/memcheck/tests/badfree3.vgtest
 @@ -1,3 +1,3 @@
@@ -29,7 +30,7 @@ index 3dfc5fd8a..4ee03f00a 100644
 +vgopts: -q
  stderr_filter_args: badfree.c
 diff --git a/memcheck/tests/varinfo5.vgtest b/memcheck/tests/varinfo5.vgtest
-index 063d00dce..79c4a72a4 100644
+index 063d00d..79c4a72 100644
 --- a/memcheck/tests/varinfo5.vgtest
 +++ b/memcheck/tests/varinfo5.vgtest
 @@ -1,3 +1,3 @@
@@ -37,6 +38,3 @@ index 063d00dce..79c4a72a4 100644
 -vgopts: --fullpath-after=memcheck/  --fullpath-after=coregrind/ --read-var-info=yes --read-inline-info=yes -q
 +vgopts: --read-var-info=yes --read-inline-info=yes -q
  stderr_filter: filter_varinfo3
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
index e421ac6c80..5cf029f149 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
@@ -1,4 +1,4 @@
-From f405297d3382cd98391d02f397e2387da1f42879 Mon Sep 17 00:00:00 2001
+From 37ad9ab360ac9137ee36963789208dfd730127a8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 24 Jan 2020 17:55:39 +0100
 Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
@@ -8,12 +8,13 @@ valgrind output changes accordingly
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  none/tests/fdleak_cmsg.stderr.exp | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/none/tests/fdleak_cmsg.stderr.exp b/none/tests/fdleak_cmsg.stderr.exp
-index 6e5a797b9..0ede1ab18 100644
+index 0fe56ea..5a0605e 100644
 --- a/none/tests/fdleak_cmsg.stderr.exp
 +++ b/none/tests/fdleak_cmsg.stderr.exp
 @@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null
@@ -29,6 +30,3 @@ index 6e5a797b9..0ede1ab18 100644
     ...
  
  Open AF_UNIX socket ...: <unknown>
--- 
-2.17.1
-
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
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
index 27366153f7..287ba1cb2e 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
@@ -1,17 +1,18 @@
-From 64ad2744acfb4fa40b1c114633a053f87125a203 Mon Sep 17 00:00:00 2001
+From 11ef269e93391fa5fbb8506323d0763549a24920 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 00:46:39 -0700
-Subject: [PATCH 1/6] sigqueue: Rename _sifields to __si_fields on musl
+Subject: [PATCH] sigqueue: Rename _sifields to __si_fields on musl
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  memcheck/tests/linux/sigqueue.c | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/memcheck/tests/linux/sigqueue.c b/memcheck/tests/linux/sigqueue.c
-index d18bd72..acb7cba 100644
+index 4b6fb0f..d37fe93 100644
 --- a/memcheck/tests/linux/sigqueue.c
 +++ b/memcheck/tests/linux/sigqueue.c
 @@ -8,6 +8,11 @@
@@ -26,6 +27,3 @@ index d18bd72..acb7cba 100644
  int main(int argc, char **argv)
  {
    siginfo_t *si;
--- 
-2.13.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
index bf0f0ded21..13486859b2 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
@@ -1,7 +1,7 @@
-From d1dea3c2bcf1e22baab39e2c0b8ca59db8a5bc37 Mon Sep 17 00:00:00 2001
+From 4ea3415bc089a8f967f9d82443fed29823e7af4c Mon Sep 17 00:00:00 2001
 From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Mon, 13 May 2019 17:12:21 -0400
-Subject: [PATCH 1/2] valgrind: filter_xml_frames: do not filter /usr
+Subject: [PATCH] valgrind: filter_xml_frames: do not filter /usr
 
 filter_xml_frames is intended to filter system paths under
 '/usr' that vary from platform to platform. In the ptest case
@@ -16,12 +16,13 @@ any negative impact.
 Upstream-Status: Inappropriate [Yocto specific]
 
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+
 ---
  tests/filter_xml_frames | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/tests/filter_xml_frames b/tests/filter_xml_frames
-index f1fa3f070..04fbc82de 100755
+index f1fa3f0..04fbc82 100755
 --- a/tests/filter_xml_frames
 +++ b/tests/filter_xml_frames
 @@ -47,7 +47,8 @@ while (my $line = <>)
@@ -34,6 +35,3 @@ index f1fa3f070..04fbc82de 100755
      }
  }
  
--- 
-2.17.0
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
index 7f0e38cb95..ba644ccf96 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
@@ -1,4 +1,4 @@
-From 26c104adf6c5162572b7aa2fac89d0835b7f8f0b Mon Sep 17 00:00:00 2001
+From 5721b54470ecbd9e061679ef8ca477a502a9e929 Mon Sep 17 00:00:00 2001
 From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Tue, 16 Oct 2018 21:27:46 -0400
 Subject: [PATCH] context APIs are not available on musl
@@ -14,13 +14,14 @@ for valgrind-3.17.
 Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=434775]
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+
 ---
  drd/tests/swapcontext.c              | 6 ++++++
  memcheck/tests/linux/stack_changes.c | 7 ++++++-
  2 files changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/drd/tests/swapcontext.c b/drd/tests/swapcontext.c
-index 622c70bc5..5e72bb0f3 100644
+index 2cb969a..3a9d4fa 100644
 --- a/drd/tests/swapcontext.c
 +++ b/drd/tests/swapcontext.c
 @@ -20,6 +20,7 @@
@@ -31,7 +32,7 @@ index 622c70bc5..5e72bb0f3 100644
  typedef struct thread_local {
    ucontext_t uc[3];
    size_t nrsw;
-@@ -67,9 +68,11 @@ void *worker(void *data)
+@@ -71,9 +72,11 @@ void *worker(void *data)
    swapcontext(&tlocal->uc[0], &tlocal->uc[1]);
    return NULL;
  }
@@ -43,7 +44,7 @@ index 622c70bc5..5e72bb0f3 100644
    enum { NR = 32 };
    thread_local_t tlocal[NR];
    pthread_t thread[NR];
-@@ -94,6 +97,9 @@ int main(int argc, char *argv[])
+@@ -99,6 +102,9 @@ int main(int argc, char *argv[])
  
    for (i = 0; i < NR; i++)
      pthread_join(thread[i], NULL);
@@ -54,7 +55,7 @@ index 622c70bc5..5e72bb0f3 100644
    return 0;
  }
 diff --git a/memcheck/tests/linux/stack_changes.c b/memcheck/tests/linux/stack_changes.c
-index 7f97b90a5..a26cb4ae6 100644
+index 7f97b90..a26cb4a 100644
 --- a/memcheck/tests/linux/stack_changes.c
 +++ b/memcheck/tests/linux/stack_changes.c
 @@ -10,6 +10,7 @@
@@ -87,6 +88,3 @@ index 7f97b90a5..a26cb4ae6 100644
 +#endif
      return 0;
  }
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
index c2965c40df..bef8e6d275 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
@@ -1,7 +1,7 @@
-From ecbdea7bd8b08205f1bc3f6b72d4b4a80f313fcb Mon Sep 17 00:00:00 2001
+From 8cad0a4723bd23beca3788c108ed44ce891cc67b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 01:03:17 -0700
-Subject: [PATCH 3/6] correct include directive path for config.h
+Subject: [PATCH] correct include directive path for config.h
 
 when building out of source tree, it can not find
 the generated config.h otherwise
@@ -9,13 +9,14 @@ the generated config.h otherwise
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  memcheck/tests/linux/syscalls-2007.c  | 2 +-
  memcheck/tests/linux/syslog-syscall.c | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/memcheck/tests/linux/syscalls-2007.c b/memcheck/tests/linux/syscalls-2007.c
-index b61c6d5..cc3fd62 100644
+index b91df82..c15c3eb 100644
 --- a/memcheck/tests/linux/syscalls-2007.c
 +++ b/memcheck/tests/linux/syscalls-2007.c
 @@ -10,7 +10,7 @@
@@ -40,6 +41,3 @@ index 1143722..21e758b 100644
  #include <stdio.h>
  #if defined(HAVE_SYS_KLOG_H)
  #include <sys/klog.h>
--- 
-2.13.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
index fea3b00f62..ae6764f7e7 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
@@ -1,4 +1,4 @@
-From e244a72c6f8803550f37e81f72bbae039651013b Mon Sep 17 00:00:00 2001
+From 9d528af838c8f35e41c2071634814fd20a8007f8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 15 Dec 2015 15:50:44 +0200
 Subject: [PATCH] Modify vg_test wrapper to support PTEST formats
@@ -24,6 +24,7 @@ Increase time limit to 90 s.
 (double of the expected time of drd/tests/std_list on qemuarm64)
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+
 ---
  tests/vg_regtest.in | 75 +++++++++++++++++++++++++++++++++------------
  1 file changed, 55 insertions(+), 20 deletions(-)
@@ -252,6 +253,3 @@ index ad18800..e4bd8cb 100755
      }
      print "\n";
  }
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0020-Committing-changes-from-do_patch.patch b/meta/recipes-devtools/valgrind/valgrind/0020-Committing-changes-from-do_patch.patch
new file mode 100644
index 0000000000..d8285bad31
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0020-Committing-changes-from-do_patch.patch
@@ -0,0 +1,332 @@
+From 561f89b95851e0055fae5010c63433f0472e913a Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Mon, 1 Jan 2024 08:34:58 +0000
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
diff --git a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
index 51cd3532d3..b7038c2c3b 100644
--- a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
@@ -1,4 +1,4 @@
-From 0bf4b0ac18d1ea41b32ad781d214b295ca1998f3 Mon Sep 17 00:00:00 2001
+From 496b74206106553ecb6b603019c3989347f33d7a Mon Sep 17 00:00:00 2001
 From: Aneesh Bansal <aneesh.bansal@freescale.com>
 Date: Mon, 21 Nov 2011 17:31:39 +0530
 Subject: [PATCH] Added support for PPC instructions mfatbu, mfatbl.
@@ -10,18 +10,18 @@ disInstr(ppc): unhandled instruction: 0x7C0F82A6
 Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=289836]
 
 Signed-off-by: Aneesh Bansal <aneesh.bansal@freescale.com>
----
 
- VEX/priv/guest_ppc_defs.h    |    2 ++
- VEX/priv/guest_ppc_helpers.c |   18 ++++++++++++++++++
- VEX/priv/guest_ppc_toIR.c    |   22 ++++++++++++++++++++++
- 3 files changed, 42 insertions(+), 0 deletions(-)
+---
+ VEX/priv/guest_ppc_defs.h    |  2 ++
+ VEX/priv/guest_ppc_helpers.c | 18 ++++++++++++++++++
+ VEX/priv/guest_ppc_toIR.c    | 22 ++++++++++++++++++++++
+ 3 files changed, 42 insertions(+)
 
 diff --git a/VEX/priv/guest_ppc_defs.h b/VEX/priv/guest_ppc_defs.h
-index dd3c62e..11a34aa 100644
+index 220fbf1..cd259f3 100644
 --- a/VEX/priv/guest_ppc_defs.h
 +++ b/VEX/priv/guest_ppc_defs.h
-@@ -146,6 +146,8 @@ extern UInt ppc32g_dirtyhelper_MFSPR_268_269 ( UInt );
+@@ -233,6 +233,8 @@ extern UInt ppc32g_dirtyhelper_MFSPR_268_269 ( UInt );
  
  extern UInt ppc32g_dirtyhelper_MFSPR_287 ( void );
  
@@ -31,10 +31,10 @@ index dd3c62e..11a34aa 100644
                                       UInt vD_idx, UInt sh,
                                       UInt shift_right );
 diff --git a/VEX/priv/guest_ppc_helpers.c b/VEX/priv/guest_ppc_helpers.c
-index 11aa428..b49ea3f 100644
+index 2611e52..72c349b 100644
 --- a/VEX/priv/guest_ppc_helpers.c
 +++ b/VEX/priv/guest_ppc_helpers.c
-@@ -119,6 +119,24 @@ UInt ppc32g_dirtyhelper_MFSPR_287 ( void )
+@@ -118,6 +118,24 @@ UInt ppc32g_dirtyhelper_MFSPR_287 ( void )
  #  endif
  }
  
@@ -60,10 +60,10 @@ index 11aa428..b49ea3f 100644
  /* CALLED FROM GENERATED CODE */
  /* DIRTY HELPER (reads guest state, writes guest mem) */
 diff --git a/VEX/priv/guest_ppc_toIR.c b/VEX/priv/guest_ppc_toIR.c
-index f8d220d..37c8974 100644
+index d05cce3..723e06a 100644
 --- a/VEX/priv/guest_ppc_toIR.c
 +++ b/VEX/priv/guest_ppc_toIR.c
-@@ -5657,6 +5657,28 @@ static Bool dis_proc_ctl ( VexAbiInfo* vbi, UInt theInstr )
+@@ -11875,6 +11875,28 @@ static Bool dis_proc_ctl ( const VexAbiInfo* vbi, UInt prefix, UInt theInstr )
           break;
        }
  
@@ -92,5 +92,3 @@ index f8d220d..37c8974 100644
        default:
           vex_printf("dis_proc_ctl(ppc)(mfspr,SPR)(0x%x)\n", SPR);
           return False;
--- 
-1.7.0.4
diff --git a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
index 82b8344279..4b9002b445 100644
--- a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
@@ -1,4 +1,4 @@
-From 8facc29c3c56e6cf9cfef70986cf73876044a3fb Mon Sep 17 00:00:00 2001
+From 76025e32cb7c9605243b08d4ba5978f0bf3f68b6 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 19 Jan 2016 16:42:36 -0800
 Subject: [PATCH] avoid neon for targets which don't support it
@@ -11,6 +11,7 @@ support neon.
 Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=454346]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
 ---
  memcheck/tests/sh-mem-random.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -28,6 +29,3 @@ index ae82248..816e139 100644
              /* On arm32, many compilers generate a 64-bit float move
                 using two 32 bit integer registers, which completely
                 defeats this test.  Hence force a 64-bit NEON load and
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
index b9804e7451..6576b92baf 100644
--- a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
@@ -1,4 +1,4 @@
-From beaa5b64c60d501fa9cd59fdc563e5f5bccf6882 Mon Sep 17 00:00:00 2001
+From e4353114490bdf48f6e830ddfc85d22106db8862 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 31 Aug 2010 22:51:58 +0800
 Subject: [PATCH] valgrind: fix perl scripts
diff --git a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
index bde1241dc7..8fec742f9d 100644
--- a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
@@ -1,7 +1,7 @@
-From 8154d38bac5cdb3675cfdaf562ab9da01988b263 Mon Sep 17 00:00:00 2001
+From 56b629da43fb42d4dc98ea9281b7e4b960039c49 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Wed, 17 Mar 2021 12:16:31 -0400
-Subject: [PATCH 19/20] remove s390x_vec_op_t
+Subject: [PATCH] remove s390x_vec_op_t
 
 s390x_vec_op_t is not needed anywhere, only elements of enum are accessed
 removing it ensures that valgrind can be built with -fno-common option
@@ -13,15 +13,16 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+
 ---
  VEX/priv/guest_s390_defs.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/VEX/priv/guest_s390_defs.h b/VEX/priv/guest_s390_defs.h
-index 9054290..dab8002 100644
+index 24f3798..7b8be78 100644
 --- a/VEX/priv/guest_s390_defs.h
 +++ b/VEX/priv/guest_s390_defs.h
-@@ -284,7 +284,7 @@ typedef enum {
+@@ -279,7 +279,7 @@ typedef enum {
     S390_VEC_OP_VBPERM,
     S390_VEC_OP_VMSL,
     S390_VEC_OP_LAST             // supposed to be the last element in enum
@@ -30,6 +31,3 @@ index 9054290..dab8002 100644
  
  /* Arguments of s390x_dirtyhelper_vec_op(...) which are packed into one
     ULong variable.
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
index f15d04b173..634fbbd76f 100644
--- a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
@@ -1,4 +1,4 @@
-From d134dafc2f11e0d247420a0ba360bcdef77b4093 Mon Sep 17 00:00:00 2001
+From 321c5bc8ad2a481ec839b8786fe8364a39941c25 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 19 Jan 2016 16:00:00 -0800
 Subject: [PATCH] use appropriate -march/-mcpu/-mfpu for ARM test apps
@@ -18,15 +18,16 @@ See similar cases in none/tests/arm/Makefile.am
 Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=454346]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
 ---
  none/tests/arm/Makefile.am | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
-index 4507a20..825290f 100644
+index 4776ea7..b337d77 100644
 --- a/none/tests/arm/Makefile.am
 +++ b/none/tests/arm/Makefile.am
-@@ -62,8 +62,10 @@ neon64_CFLAGS     = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
+@@ -85,8 +85,10 @@ neon64_CFLAGS     = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
  			-mfpu=neon \
  			-mthumb
  
@@ -39,6 +40,3 @@ index 4507a20..825290f 100644
 +vcvt_fixed_float_VFP_CFLAGS = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mfpu=vfpv3
 +
 +vfpv4_fma_CFLAGS  = $(AM_CFLAGS) -g -O0 -march=armv7ve -mcpu=cortex-a15 -mfpu=vfpv4 -marm
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
index d04297dca8..aeef0bda61 100644
--- a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
@@ -1,4 +1,4 @@
-From 005bd11809a1ce65e9f2c28e884354a4741650b9 Mon Sep 17 00:00:00 2001
+From f59919de901cbfc65e0ce24c81665f08148bc2b6 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 13 Dec 2016 11:29:55 +0800
 Subject: [PATCH] make ld-XXX.so strlen intercept optional
@@ -12,15 +12,16 @@ Upstream-Status: Inappropriate
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
 ---
  coregrind/m_redir.c | 13 ++++++++++++-
  1 file changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/coregrind/m_redir.c b/coregrind/m_redir.c
-index ff35009..d7d6816 100644
+index cef241b..0a7dc5f 100644
 --- a/coregrind/m_redir.c
 +++ b/coregrind/m_redir.c
-@@ -1275,7 +1275,18 @@ static void add_hardwired_spec (const  HChar* sopatt, const HChar* fnpatt,
+@@ -1307,7 +1307,18 @@ static void add_hardwired_spec (const  HChar* sopatt, const HChar* fnpatt,
     spec->to_addr     = to_addr;
     spec->isWrap      = False;
     spec->isGlobal    = False;
@@ -40,6 +41,3 @@ index ff35009..d7d6816 100644
     /* VARIABLE PARTS */
     spec->mark        = False; /* not significant */
     spec->done        = False; /* not significant */
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
similarity index 98%
rename from meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
index 67a197c509..612bec190b 100644
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
2.42.0


--===============7787699440145918052==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1848 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (912 cached, 1 parsed). 1847 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-8681992f9e2c264485abda2465d86c7703e1715a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8681992f9e2c264485abda2465d86c7703e1715a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 509 Local 494 Mirrors 0 Missed 15 Current 495 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 765 of 1004 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/boost/boost_1.83.0.bb:do_create_spdx_setscene)
NOTE: recipe boost-1.83.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe boost-1.83.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 981 of 1004 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 983 of 1004 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running task 1191 of 2716 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_recipe_qa)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe valgrind-3.22.0-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 989 of 1004 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 990 of 1004 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 992 of 1004 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe valgrind-3.22.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_recipe_qa unihash changed to f32022b7311f47e7dc9f0718a52cb61a6db055d35157538ca42890e15e39459a
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1730 of 2716 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_fetch)
NOTE: recipe valgrind-3.22.0-r0: task do_fetch: Started
NOTE: recipe valgrind-3.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 1731 of 2716 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_unpack)
NOTE: recipe valgrind-3.22.0-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 999 of 1004 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1001 of 1004 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1004 of 1004 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2176 of 2716 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe valgrind-3.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe valgrind-3.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe valgrind-3.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2697 of 2716 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_patch)
NOTE: Running task 2698 of 2716 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_collect_spdx_deps)
NOTE: recipe valgrind-3.22.0-r0: task do_patch: Started
NOTE: recipe valgrind-3.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe valgrind-3.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe valgrind-3.22.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 2698 tasks of which 2692 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101083540.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101083540.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_patch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: valgrind-3.22.0-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind/0020-Committing-changes-from-do_patch.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: valgrind-3.22.0-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/valgrind/3.22.0/temp/log.do_patch.789312
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_patch) failed with exit code '1'

--===============7787699440145918052==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-valgrind-upgrade-3.21.0-3.22.0.patch"

RnJvbSAxYTMwMTZiMzlmZjk0MmM4OGFlMjJhYmZjMjcxOGYyMWEyNjc1ODY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwODozNjowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZh
bGdyaW5kOiB1cGdyYWRlIDMuMjEuMCAtPiAzLjIyLjAKCi0tLQogLi4uaW9ucy1zdGF0aWMtdG8t
YXZvaWQtYXNzZW1ibGVyLWVycm9yLnBhdGNoIHwgIDI0ICstCiAuLi5ybi1hLXZhbGlkLWV4aXRf
Y29kZS1mcm9tLXZnX3JlZ3Rlc3QucGF0Y2ggfCAgMTAgKy0KIC4uLi8wMDAxLWRvY3MtRGlzYWJs
ZS1tYW51YWwtdmFsaWRhdGlvbi5wYXRjaCB8ICAxMCArLQogLi4ub3Bjb2RlLW5vdC1zdXBwb3J0
ZWQtb24tbWlwczMyLWxpbnV4LnBhdGNoIHwgIDE4ICstCiAuLi5ldHRpbmctbWNwdS10by1jb3J0
ZXgtYTgtb24tYXJtLWFyY2gucGF0Y2ggfCAgMjAgKy0KIC4uLmNoZWNrLXRlc3RzLUZpeC10aW1l
cmZkLXN5c2NhbGwtdGVzdC5wYXRjaCB8ICAzMyArLQogLi4uLXZndGVzdHMtcmVtb3ZlLWZ1bGxw
YXRoLWFmdGVyLWZsYWdzLnBhdGNoIHwgIDEwICstCiAuLi5lYWtfY21zZy5zdGRlcnIuZXhwLWFk
anVzdC10bXAtcGF0aHMucGF0Y2ggfCAgIDggKy0KIC4uLmludXgtc2VnX292ZXJyaWRlLmMtYWRk
LW1pc3NpbmctaW5jbC5wYXRjaCB8ICAzMCAtLQogLi4uYW1lLV9zaWZpZWxkcy10by1fX3NpX2Zp
ZWxkcy1vbi1tdXNsLnBhdGNoIHwgIDEwICstCiAuLi4tZmlsdGVyX3htbF9mcmFtZXMtZG8tbm90
LWZpbHRlci11c3IucGF0Y2ggfCAgMTAgKy0KIC4uLm50ZXh0LUFQSXMtYXJlLW5vdC1hdmFpbGFi
bGUtb24tbXVzbC5wYXRjaCB8ICAxNCArLQogLi4uLWluY2x1ZGUtZGlyZWN0aXZlLXBhdGgtZm9y
LWNvbmZpZy5oLnBhdGNoIHwgIDEwICstCiAuLi5lc3Qtd3JhcHBlci10by1zdXBwb3J0LVBURVNU
LWZvcm1hdHMucGF0Y2ggfCAgIDYgKy0KIC4uLjAyMC1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1k
b19wYXRjaC5wYXRjaCB8IDMzMiArKysrKysrKysrKysrKysrKysKIC4uLnQtZm9yLVBQQy1pbnN0
cnVjdGlvbnMtbWZhdGJ1LW1mYXRibC5wYXRjaCB8ICAyNiArLQogLi4ubi1mb3ItdGFyZ2V0cy13
aGljaC1kb24tdC1zdXBwb3J0LWl0LnBhdGNoIHwgICA2ICstCiAuLi4vdmFsZ3JpbmQvdmFsZ3Jp
bmQvZml4ZWQtcGVybC1wYXRoLnBhdGNoICAgfCAgIDIgKy0KIC4uLi92YWxncmluZC92YWxncmlu
ZC9zMzkweF92ZWNfb3BfdC5wYXRjaCAgICB8ICAxMiArLQogLi4udGUtbWFyY2gtbWNwdS1tZnB1
LWZvci1BUk0tdGVzdC1hcHBzLnBhdGNoIHwgIDEwICstCiAuLi4tbGQtWFhYLnNvLXN0cmxlbi1p
bnRlcmNlcHQtb3B0aW9uYWwucGF0Y2ggfCAgMTAgKy0KIC4uLnt2YWxncmluZF8zLjIxLjAuYmIg
PT4gdmFsZ3JpbmRfMy4yMi4wLmJifSB8ICAgNCArLQogMjIgZmlsZXMgY2hhbmdlZCwgNDQ1IGlu
c2VydGlvbnMoKyksIDE3MCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1ub25lLXRlc3RzLXg4Ni1saW51
eC1zZWdfb3ZlcnJpZGUuYy1hZGQtbWlzc2luZy1pbmNsLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMjAtQ29tbWl0dGlu
Zy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdmFsZ3JpbmQve3ZhbGdyaW5kXzMuMjEuMC5iYiA9PiB2YWxncmluZF8zLjIyLjAuYmJ9ICg5
OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5k
LzAwMDEtTWFrZS1sb2NhbC1mdW5jdGlvbnMtc3RhdGljLXRvLWF2b2lkLWFzc2VtYmxlci1lcnJv
ci5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLU1h
a2UtbG9jYWwtZnVuY3Rpb25zLXN0YXRpYy10by1hdm9pZC1hc3NlbWJsZXItZXJyb3IucGF0Y2gK
aW5kZXggOGQyY2E1NzMzZS4uYWQ3N2Q4ODM0ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtTWFrZS1sb2NhbC1mdW5jdGlvbnMtc3RhdGlj
LXRvLWF2b2lkLWFzc2VtYmxlci1lcnJvci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1NYWtlLWxvY2FsLWZ1bmN0aW9ucy1zdGF0aWMtdG8t
YXZvaWQtYXNzZW1ibGVyLWVycm9yLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyMTU1YzFi
MmNmMDBlNzQ0ZTI4MGM0OTNlYjc0YmY0NTdkZmNjM2IxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBhYTgzZTBkOWQxY2Q4MDUxZTg2OGI4NTcxODI0Y2U2YjQ1NGM4ZWJjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmFuZHkgTWFjTGVvZCA8UmFuZHkuTWFjTGVvZEB3aW5k
cml2ZXIuY29tPgogRGF0ZTogU3VuLCAyMSBPY3QgMjAxOCAxNTowOTozMSAtMDQwMAogU3ViamVj
dDogW1BBVENIXSBNYWtlIGxvY2FsIGZ1bmN0aW9ucyBzdGF0aWMgdG8gYXZvaWQgYXNzZW1ibGVy
IGVycm9yCkBAIC0yMSwxMiArMjEsMTMgQEAgYW5kIG1vcmUgaW1wb3J0YW50bHkgYWxzbyBhdm9p
ZCBhbiBhc3NlbWJsZXIgZXJyb3I6CiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBodHRwczov
L2J1Z3Mua2RlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NDAwMTY0CiAKIFNpZ25lZC1vZmYtYnk6IFJh
bmR5IE1hY0xlb2QgPFJhbmR5Lk1hY0xlb2RAd2luZHJpdmVyLmNvbT4KKwogLS0tCiAgaGVsZ3Jp
bmQvdGVzdHMvYW5ub3RhdGVfaGJlZm9yZS5jIHwgMzQgKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMo
LSkKIAogZGlmZiAtLWdpdCBhL2hlbGdyaW5kL3Rlc3RzL2Fubm90YXRlX2hiZWZvcmUuYyBiL2hl
bGdyaW5kL3Rlc3RzL2Fubm90YXRlX2hiZWZvcmUuYwotaW5kZXggZTMxMTcxNGY3Li5mNTU1MTRl
NDUgMTAwNjQ0CitpbmRleCAyNTlkM2I2Li44NDM4NzAxIDEwMDY0NAogLS0tIGEvaGVsZ3JpbmQv
dGVzdHMvYW5ub3RhdGVfaGJlZm9yZS5jCiArKysgYi9oZWxncmluZC90ZXN0cy9hbm5vdGF0ZV9o
YmVmb3JlLmMKIEBAIC0yNCw3ICsyNCw3IEBAIHR5cGVkZWYgIHVuc2lnbmVkIGxvbmcgaW50ICBV
V29yZDsKQEAgLTEwMSw3ICsxMDIsNyBAQCBpbmRleCBlMzExNzE0ZjcuLmY1NTUxNGU0NSAxMDA2
NDQKICB7CiAgICBVV29yZCBzdWNjZXNzOwogICAgVVdvcmQgYmxvY2tbM10gPSB7IChVV29yZClh
ZGRyLCBueXUsIGV4cGVjdGVkfTsKLUBAIC0yNTYsNyArMjU2LDcgQEAgVVdvcmQgZG9fYWNhc1cg
KCBVV29yZCogYWRkciwgVVdvcmQgZXhwZWN0ZWQsIFVXb3JkIG55dSApCitAQCAtMjg1LDcgKzI4
NSw3IEBAIFVXb3JkIGRvX2FjYXNXICggVVdvcmQqIGFkZHIsIFVXb3JkIGV4cGVjdGVkLCBVV29y
ZCBueXUgKQogIAogIC8vIG1pcHM2NAogIC8qIHJldHVybiAxIGlmIHN1Y2Nlc3MsIDAgaWYgZmFp
bHVyZSAqLwpAQCAtMTEwLDcgKzExMSw3IEBAIGluZGV4IGUzMTE3MTRmNy4uZjU1NTE0ZTQ1IDEw
MDY0NAogIHsKICAgIFVXb3JkIHN1Y2Nlc3M7CiAgICBVV29yZCBibG9ja1szXSA9IHsgKFVXb3Jk
KWFkZHIsIG55dSwgZXhwZWN0ZWR9OwotQEAgLTI4Nyw3ICsyODcsNyBAQCBVV29yZCBkb19hY2Fz
VyAoIFVXb3JkKiBhZGRyLCBVV29yZCBleHBlY3RlZCwgVVdvcmQgbnl1ICkKK0BAIC0zMTYsNyAr
MzE2LDcgQEAgVVdvcmQgZG9fYWNhc1cgKCBVV29yZCogYWRkciwgVVdvcmQgZXhwZWN0ZWQsIFVX
b3JkIG55dSApCiAgCiAgI2VuZGlmCiAgCkBAIC0xMTksNyArMTIwLDcgQEAgaW5kZXggZTMxMTcx
NGY3Li5mNTU1MTRlNDUgMTAwNjQ0CiAgewogICAgIHdoaWxlICgxKSB7CiAgICAgICAgVVdvcmQg
b2xkID0gKnc7Ci1AQCAtMzAxLDcgKzMwMSw3IEBAIHZvaWQgYXRvbWljX2luY1cgKCBVV29yZCog
dyApCitAQCAtMzMwLDcgKzMzMCw3IEBAIHZvaWQgYXRvbWljX2luY1cgKCBVV29yZCogdyApCiAg
CiAgI2RlZmluZSBOTk4gMTAwMDAwMAogIApAQCAtMTI4LDcgKzEyOSw3IEBAIGluZGV4IGUzMTE3
MTRmNy4uZjU1NTE0ZTQ1IDEwMDY0NAogIHsKICAgIFVXb3JkKiB3ID0gKFVXb3JkKilhcmc7CiAg
ICBpbnQgaTsKLUBAIC0zMzEsMTAgKzMzMSwxMCBAQCBpbnQgbWFpbiAoIHZvaWQgKQorQEAgLTM2
MCwxMCArMzYwLDEwIEBAIGludCBtYWluICggdm9pZCApCiAgCiAgI2VuZGlmCiAgCkBAIC0xNDEs
NyArMTQyLDcgQEAgaW5kZXggZTMxMTcxNGY3Li5mNTU1MTRlNDUgMTAwNjQ0CiAgewogICAgIHN0
cnVjdCB0aW1lc3BlYyB0cyA9IHsgMCwgMSAqIDEwMDAgKiAxMDAwIH07CiAgICAgLy8gV2UgZG8g
dGhlIHNsZWVwIGluIHNtYWxsIHBpZWNlcyB0byBoYXZlIHNjaGVkdWxpbmcKLUBAIC0zNDgsNyAr
MzQ4LDcgQEAgdm9pZCBkZWxheVhtcyAoIGludCBpICkKK0BAIC0zNzYsNyArMzc2LDcgQEAgdm9p
ZCBkZWxheVhtcyAoIGludCBpICkKICAgICB9CiAgfQogIApAQCAtMTUwLDcgKzE1MSw3IEBAIGlu
ZGV4IGUzMTE3MTRmNy4uZjU1NTE0ZTQ1IDEwMDY0NAogIHsKICAgIFVXb3JkIHcwID0gKnc7CiAg
ICBVV29yZCB2b2xhdGlsZSAqIHdWID0gdzsKLUBAIC0zNTcsNyArMzU3LDcgQEAgdm9pZCBkb193
YWl0ICggVVdvcmQqIHcgKQorQEAgLTM4NSw3ICszODUsNyBAQCB2b2lkIGRvX3dhaXQgKCBVV29y
ZCogdyApCiAgICBBTk5PVEFURV9IQVBQRU5TX0FGVEVSKHcpOwogIH0KICAKQEAgLTE1OSw3ICsx
NjAsNyBAQCBpbmRleCBlMzExNzE0ZjcuLmY1NTUxNGU0NSAxMDA2NDQKICB7CiAgICBBTk5PVEFU
RV9IQVBQRU5TX0JFRk9SRSh3KTsKICAgIGF0b21pY19pbmNXKHcpOwotQEAgLTM2NSw3ICszNjUs
NyBAQCB2b2lkIGRvX3NpZ25hbCAoIFVXb3JkKiB3ICkKK0BAIC0zOTMsNyArMzkzLDcgQEAgdm9p
ZCBkb19zaWduYWwgKCBVV29yZCogdyApCiAgCiAgCiAgCkBAIC0xNjgsNyArMTY5LDcgQEAgaW5k
ZXggZTMxMTcxNGY3Li5mNTU1MTRlNDUgMTAwNjQ0CiAgewogICAgVVdvcmQqIHcgPSAoVVdvcmQq
KWFyZzsKICAgIGRlbGF5WG1zKDUwMCk7ICAgIC8vIGVuc3VyZSB0MiBnZXRzIHRvIGl0cyB3YWl0
IGZpcnN0Ci1AQCAtMzc2LDcgKzM3Niw3IEBAIHZvaWQqIHRocmVhZF9mbjEgKCB2b2lkKiBhcmcg
KQorQEAgLTQwNCw3ICs0MDQsNyBAQCB2b2lkKiB0aHJlYWRfZm4xICggdm9pZCogYXJnICkKICAg
IHJldHVybiBOVUxMOwogIH0KICAKQEAgLTE3Nyw2ICsxNzgsMyBAQCBpbmRleCBlMzExNzE0Zjcu
LmY1NTUxNGU0NSAxMDA2NDQKICB7CiAgICBVV29yZCogdyA9IChVV29yZCopYXJnOwogICAgZG9f
d2FpdCh3KTsgICAgICAvLyB3YWl0IGZvciBoLWIgZWRnZSBmcm9tIGZpcnN0IHRocmVhZAotLS0g
Ci0yLjE3LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3Zh
bGdyaW5kLzAwMDEtUmV0dXJuLWEtdmFsaWQtZXhpdF9jb2RlLWZyb20tdmdfcmVndGVzdC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLVJldHVybi1h
LXZhbGlkLWV4aXRfY29kZS1mcm9tLXZnX3JlZ3Rlc3QucGF0Y2gKaW5kZXggZTdhZjVlZmVjYy4u
ZDVmMWJhMmQ1NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3Zh
bGdyaW5kLzAwMDEtUmV0dXJuLWEtdmFsaWQtZXhpdF9jb2RlLWZyb20tdmdfcmVndGVzdC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1SZXR1
cm4tYS12YWxpZC1leGl0X2NvZGUtZnJvbS12Z19yZWd0ZXN0LnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA1ZWViZGVmZDIyNTE4MDNlN2QyMTA4MTc0NTAxOGZjYjE2YjJiYTcxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhOTU0YTY3NDIzMDA1NWI3NmUyYTk1Y2FjMDJjMjcxYzJm
MGM2N2ExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmFuZHkgTWFjTGVvZCA8UmFu
ZHkuTWFjTGVvZEB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCA4IE1heSAyMDE5IDIwOjE2OjUy
IC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJldHVybiBhIHZhbGlkIGV4aXRfY29kZSBmcm9tIHZn
X3JlZ3Rlc3QKQEAgLTYsMTUgKzYsMTYgQEAgU3ViamVjdDogW1BBVENIXSBSZXR1cm4gYSB2YWxp
ZCBleGl0X2NvZGUgZnJvbSB2Z19yZWd0ZXN0CiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIAog
U2lnbmVkLW9mZi1ieTogUmFuZHkgTWFjTGVvZCA8UmFuZHkuTWFjTGVvZEB3aW5kcml2ZXIuY29t
PgorCiAtLS0KICB0ZXN0cy92Z19yZWd0ZXN0LmluIHwgMSArCiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS90ZXN0cy92Z19yZWd0ZXN0LmluIGIvdGVzdHMv
dmdfcmVndGVzdC5pbgotaW5kZXggOTA5YWYzYmU4Li5mMjc5OWM0ZTMgMTAwNzU1CitpbmRleCBl
NGJkOGNiLi5mZDU3NWIyIDEwMDc1NQogLS0tIGEvdGVzdHMvdmdfcmVndGVzdC5pbgogKysrIGIv
dGVzdHMvdmdfcmVndGVzdC5pbgotQEAgLTQwMyw2ICs0MDMsNyBAQCBzdWIgbXlzeXN0ZW0oJCkK
K0BAIC00MDEsNiArNDAxLDcgQEAgc3ViIG15c3lzdGVtKCQpCiAgICAgICAgICAgICAgZXhpdCAx
OwogICAgICAgICAgfQogICAgICB9CkBAIC0yMiw2ICsyMywzIEBAIGluZGV4IDkwOWFmM2JlOC4u
ZjI3OTljNGUzIDEwMDc1NQogIH0KICAjIGlmICRrZWVwdW5maWx0ZXJlZCwgY29waWVzICQxIHRv
ICQxLnVuZmlsdGVyZWQub3V0CiAgIyByZW5hbWVzICQwIHRwICQxCi0tLSAKLTIuMTcuMAotCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1k
b2NzLURpc2FibGUtbWFudWFsLXZhbGlkYXRpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1kb2NzLURpc2FibGUtbWFudWFsLXZhbGlkYXRpb24u
cGF0Y2gKaW5kZXggMjU2ZGRiMGMzNC4uZTE2MWRjYTAyOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtZG9jcy1EaXNhYmxlLW1hbnVhbC12
YWxpZGF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxn
cmluZC8wMDAxLWRvY3MtRGlzYWJsZS1tYW51YWwtdmFsaWRhdGlvbi5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gOTlmYzZmZTliNjZiZWNhYzNjOTQwNjgxMjllODQyMTczMzBhNzFhNiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZWVjOWExNGY3NTU2MjdhMTdiZWE5N2M3Y2I3ZDM4
ZjcxZDA4YzMwYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDEzIEphbiAyMDIyIDE4OjI2OjAyIC0wODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIGRvY3M6IERpc2FibGUgbWFudWFsIHZhbGlkYXRpb24KQEAgLTE0LDE1
ICsxNCwxNiBAQCBGaXhlcwogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW09FLVNw
ZWNpZmljXQogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KKwog
LS0tCiAgZG9jcy9NYWtlZmlsZS5hbSB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2RvY3MvTWFrZWZpbGUuYW0gYi9k
b2NzL01ha2VmaWxlLmFtCi1pbmRleCBkNDI1MGU4Li5jNTAwMzA2IDEwMDY0NAoraW5kZXggZjli
YTRlMy4uMGI1YTY2MyAxMDA2NDQKIC0tLSBhL2RvY3MvTWFrZWZpbGUuYW0KICsrKyBiL2RvY3Mv
TWFrZWZpbGUuYW0KLUBAIC0xOTIsNyArMTkyLDcgQEAgdmFsaWQtbWFucGFnZXM6ICQoTUFOUEFH
RVNfWE1MX0ZJTEVTKQorQEAgLTE5NCw3ICsxOTQsNyBAQCB2YWxpZC1tYW5wYWdlczogJChNQU5Q
QUdFU19YTUxfRklMRVMpCiAgCSAgdG91Y2ggJEA7IFwKICAJZmkKICAKQEAgLTMxLDYgKzMyLDMg
QEAgaW5kZXggZDQyNTBlOC4uYzUwMDMwNiAxMDA2NDQKICAKICAjIFRoZSB0ZXh0IHZlcnNpb24g
b2YgdGhlIEZBUS4KICBGQVEudHh0OgotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtZml4LW9wY29kZS1ub3Qtc3Vw
cG9ydGVkLW9uLW1pcHMzMi1saW51eC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxn
cmluZC92YWxncmluZC8wMDAxLWZpeC1vcGNvZGUtbm90LXN1cHBvcnRlZC1vbi1taXBzMzItbGlu
dXgucGF0Y2gKaW5kZXggMzliNjI0ZDlmNi4uOTQ4NDk3Mjc0OSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtZml4LW9wY29kZS1ub3Qtc3Vw
cG9ydGVkLW9uLW1pcHMzMi1saW51eC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1maXgtb3Bjb2RlLW5vdC1zdXBwb3J0ZWQtb24tbWlwczMy
LWxpbnV4LnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBmYjUzNjJmMjA1YjM3YzUwNjBmY2Q3
NjRhN2VkMzkzYWJlNGYyZjNkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlOWM2NjJh
NWMxMWJhYjE2ZjZmOWQzYTY4ZmQ1MDMwZjU3ZDJhMWYyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogRnJp
LCAyNyBKdWwgMjAxOCAxNzozOTozNyArMDgwMAotU3ViamVjdDogW1BBVENIIDEvMl0gZml4IG9w
Y29kZSBub3Qgc3VwcG9ydGVkIG9uIG1pcHMzMi1saW51eAorU3ViamVjdDogW1BBVENIXSBmaXgg
b3Bjb2RlIG5vdCBzdXBwb3J0ZWQgb24gbWlwczMyLWxpbnV4CiAKIFdoaWxlIGJ1aWxkIHRlc3Rz
KGBtYWtlIGNoZWNrJykgb24gbWlwczMyLWxpbnV4LCB0aGVyZSBhcmUKIHNlcmlhbCBmYWlsdXJl
cyBzdWNoIGFzOgpAQCAtMjQsNiArMjQsNyBAQCBidXQgbWlzc2VkIHRvIHBhc3MgdGhlbSB0byB0
ZXN0cyB3aGljaCBjYXVzZWQgdGhlIGFib3ZlIGZhaWx1cmUKIAogVXBzdHJlYW0tU3RhdHVzOiBT
dWJtaXR0ZWQgW2h0dHBzOi8vYnVncy5rZGUub3JnL3Nob3dfYnVnLmNnaT9pZD0zOTY5MDVdCiBT
aWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CisKIC0t
LQogIGhlbGdyaW5kL3Rlc3RzL01ha2VmaWxlLmFtICAgIHwgNSArKysrKwogIG1lbWNoZWNrL3Rl
c3RzL01ha2VmaWxlLmFtICAgIHwgNSArKysrKwpAQCAtMzEsMTAgKzMyLDEwIEBAIFNpZ25lZC1v
ZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KICAzIGZpbGVzIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL2hlbGdyaW5kL3Rlc3RzL01h
a2VmaWxlLmFtIGIvaGVsZ3JpbmQvdGVzdHMvTWFrZWZpbGUuYW0KLWluZGV4IGFkMWFmMTkxYS4u
NjIwOWQzNWE3IDEwMDY0NAoraW5kZXggMmYzMjNkMy4uZTEwZDljMCAxMDA3NTUKIC0tLSBhL2hl
bGdyaW5kL3Rlc3RzL01ha2VmaWxlLmFtCiArKysgYi9oZWxncmluZC90ZXN0cy9NYWtlZmlsZS5h
bQotQEAgLTIxNCw2ICsyMTQsMTEgQEAgY2hlY2tfUFJPR1JBTVMgKz0gYW5ub3RhdGVfcndsb2Nr
CitAQCAtMjQzLDYgKzI0MywxMSBAQCBjaGVja19QUk9HUkFNUyArPSBnZXRhZGRyaW5mbwogIGVu
ZGlmCiAgCiAgQU1fQ0ZMQUdTICAgKz0gJChBTV9GTEFHX00zMjY0X1BSSSkKQEAgLTQ3LDEwICs0
OCwxMCBAQCBpbmRleCBhZDFhZjE5MWEuLjYyMDlkMzVhNyAxMDA2NDQKICAKICBMREFERCA9IC1s
cHRocmVhZAogZGlmZiAtLWdpdCBhL21lbWNoZWNrL3Rlc3RzL01ha2VmaWxlLmFtIGIvbWVtY2hl
Y2svdGVzdHMvTWFrZWZpbGUuYW0KLWluZGV4IDg0ZTQ5NDA1Zi4uYWZmODYxYTMyIDEwMDY0NAor
aW5kZXggNDdiNTM4NC4uM2Q5MmIzMiAxMDA2NDQKIC0tLSBhL21lbWNoZWNrL3Rlc3RzL01ha2Vm
aWxlLmFtCiArKysgYi9tZW1jaGVjay90ZXN0cy9NYWtlZmlsZS5hbQotQEAgLTQ0Myw2ICs0NDMs
MTEgQEAgY2hlY2tfUFJPR1JBTVMgKz0gcmVhY2hfdGhyZWFkX3JlZ2lzdGVyCitAQCAtNTkwLDYg
KzU5MCwxMSBAQCBjaGVja19QUk9HUkFNUyArPSB3Y3NuY3B5CiAgZW5kaWYKICAKICBBTV9DRkxB
R1MgICArPSAkKEFNX0ZMQUdfTTMyNjRfUFJJKQpAQCAtNjMsNyArNjQsNyBAQCBpbmRleCA4NGU0
OTQwNWYuLmFmZjg2MWEzMiAxMDA2NDQKICAKICBpZiBWR0NPTkZfUExBVEZPUk1TX0lOQ0xVREVf
QVJNX0xJTlVYCiBkaWZmIC0tZ2l0IGEvbm9uZS90ZXN0cy9taXBzMzIvTWFrZWZpbGUuYW0gYi9u
b25lL3Rlc3RzL21pcHMzMi9NYWtlZmlsZS5hbQotaW5kZXggZDExNTkxZDQ1Li42MDJjZDI2ZjYg
MTAwNjQ0CitpbmRleCA3MDA5OWZmLi43MTNmZjIwIDEwMDY0NAogLS0tIGEvbm9uZS90ZXN0cy9t
aXBzMzIvTWFrZWZpbGUuYW0KICsrKyBiL25vbmUvdGVzdHMvbWlwczMyL01ha2VmaWxlLmFtCiBA
QCAtOTksNiArOTksMTAgQEAgY2hlY2tfUFJPR1JBTVMgPSBcCkBAIC03Nyw2ICs3OCwzIEBAIGlu
ZGV4IGQxMTU5MWQ0NS4uNjAyY2QyNmY2IDEwMDY0NAogIEFNX0NGTEFHUyAgICArPSBARkxBR19N
MzJACiAgQU1fQ1hYRkxBR1MgICs9IEBGTEFHX00zMkAKICBBTV9DQ0FTRkxBR1MgKz0gQEZMQUdf
TTMyQAotLS0gCi0yLjE3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWFrZWZpbGVzLURyb3Atc2V0dGluZy1tY3B1LXRvLWNvcnRl
eC1hOC1vbi1hcm0tYXJjaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92
YWxncmluZC8wMDAxLW1ha2VmaWxlcy1Ecm9wLXNldHRpbmctbWNwdS10by1jb3J0ZXgtYTgtb24t
YXJtLWFyY2gucGF0Y2gKaW5kZXggMDczNzEzYzEzOS4uYTU2OTBmMzVjZSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWFrZWZpbGVzLURy
b3Atc2V0dGluZy1tY3B1LXRvLWNvcnRleC1hOC1vbi1hcm0tYXJjaC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1tYWtlZmlsZXMtRHJvcC1z
ZXR0aW5nLW1jcHUtdG8tY29ydGV4LWE4LW9uLWFybS1hcmNoLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA3MTVjZjEyMjM4OGYzNTI3YWZhNTY0OWNlYmY5ZjE1MjJjMjQwNjkzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzOGE2MjBkOTA2NWVhNmY2MWU1M2I2ZjkxMGRhOGJlZTI2
MzVmYjdhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjAgQXByIDIwMTcgMTA6MTE6MTYgLTA3MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gbWFrZWZpbGVzOiBEcm9wIHNldHRpbmcgLW1jcHUgdG8gY29ydGV4LWE4IG9u
IGFybQpAQCAtMTMsNiArMTMsNyBAQCBGaXhlcwogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQg
W2h0dHBzOi8vYnVncy5rZGUub3JnL3Nob3dfYnVnLmNnaT9pZD00NTQzNDZdCiAKIFNpZ25lZC1v
ZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CisKIC0tLQogIE1ha2VmaWxlLmFs
bC5hbSAgICAgICAgICAgIHwgIDYgKysrLS0tCiAgaGVsZ3JpbmQvdGVzdHMvTWFrZWZpbGUuYW0g
fCAgNiArKystLS0KQEAgLTIwLDEwICsyMSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgogIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
MTUgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9NYWtlZmlsZS5hbGwuYW0gYi9NYWtlZmls
ZS5hbGwuYW0KLWluZGV4IDAyMDU5YTMuLmM3YzQ3MDAgMTAwNjQ0CitpbmRleCA5NGQ2NWYyLi5i
NDdjZWQ3IDEwMDc1NQogLS0tIGEvTWFrZWZpbGUuYWxsLmFtCiArKysgYi9NYWtlZmlsZS5hbGwu
YW0KLUBAIC0xOTcsMTEgKzE5NywxMSBAQCBBTV9DQ0FTRkxBR1NfUFBDNjRMRV9MSU5VWCAgPSBA
RkxBR19NNjRAIC1nCitAQCAtMjM0LDExICsyMzQsMTEgQEAgQU1fQ0NBU0ZMQUdTX1g4Nl9GUkVF
QlNEICAgID0gQEZMQUdfTTMyQCAtZwogIAogIEFNX0ZMQUdfTTMyNjRfQVJNX0xJTlVYICAgPSBA
RkxBR19NMzJACiAgQU1fQ0ZMQUdTX0FSTV9MSU5VWCAgICAgICA9IEBGTEFHX00zMkAgXApAQCAt
MzksMTAgKzQwLDEwIEBAIGluZGV4IDAyMDU5YTMuLmM3YzQ3MDAgMTAwNjQ0CiAgQU1fRkxBR19N
MzI2NF9BUk02NF9MSU5VWCA9IEBGTEFHX002NEAKICBBTV9DRkxBR1NfQVJNNjRfTElOVVggICAg
ID0gQEZMQUdfTTY0QCAkKEFNX0NGTEFHU19CQVNFKQogZGlmZiAtLWdpdCBhL2hlbGdyaW5kL3Rl
c3RzL01ha2VmaWxlLmFtIGIvaGVsZ3JpbmQvdGVzdHMvTWFrZWZpbGUuYW0KLWluZGV4IGRmODIx
NjkuLjA3ZWI2NmEgMTAwNjQ0CitpbmRleCAzZTJlZmFkLi4yZjMyM2QzIDEwMDc1NQogLS0tIGEv
aGVsZ3JpbmQvdGVzdHMvTWFrZWZpbGUuYW0KICsrKyBiL2hlbGdyaW5kL3Rlc3RzL01ha2VmaWxl
LmFtCi1AQCAtMTg5LDkgKzE4OSw5IEBAIGlmICEgVkdDT05GX1BMQVRGT1JNU19JTkNMVURFX1g4
Nl9EQVJXSU4KK0BAIC0yMTYsOSArMjE2LDkgQEAgaWYgISBWR0NPTkZfUExBVEZPUk1TX0lOQ0xV
REVfWDg2X0RBUldJTgogIGVuZGlmCiAgCiAgaWYgVkdDT05GX1BMQVRGT1JNU19JTkNMVURFX0FS
TV9MSU5VWApAQCAtNTYsMTAgKzU3LDEwIEBAIGluZGV4IGRmODIxNjkuLjA3ZWI2NmEgMTAwNjQ0
CiAgYW5ub3RhdGVfaGJlZm9yZV9DRkxBR1MgPSAkKEFNX0NGTEFHUykKICB0YzA3X2hibDFfQ0ZM
QUdTICAgICAgICA9ICQoQU1fQ0ZMQUdTKQogZGlmZiAtLWdpdCBhL25vbmUvdGVzdHMvYXJtL01h
a2VmaWxlLmFtIGIvbm9uZS90ZXN0cy9hcm0vTWFrZWZpbGUuYW0KLWluZGV4IDAyNGViNmQuLmNj
ZWNiOTAgMTAwNjQ0CitpbmRleCBiMzM3ZDc3Li5hOTMyMTY0IDEwMDY0NAogLS0tIGEvbm9uZS90
ZXN0cy9hcm0vTWFrZWZpbGUuYW0KICsrKyBiL25vbmUvdGVzdHMvYXJtL01ha2VmaWxlLmFtCi1A
QCAtNTIsMTAgKzUyLDEwIEBAIGFsbGV4ZWNfQ0ZMQUdTCQk9ICQoQU1fQ0ZMQUdTKSBARkxBR19X
X05PX05PTk5VTExACitAQCAtNTYsMTAgKzU2LDEwIEBAIGFsbGV4ZWNfQ0ZMQUdTCQk9ICQoQU1f
Q0ZMQUdTKSBARkxBR19XX05PX05PTk5VTExACiAgIyBuZWVkIHNwZWNpYWwgaGVscGluZyB3LnIu
dCAtbWZwdSBhbmQgLW1mbG9hdC1hYmksIHRob3VnaC4KICAjIEFsc28gZm9yY2UgLU8wIHNpbmNl
IC1PIHRha2VzIGh1bmRyZWRzIG9mIE1CIG9mIG1lbW9yeSAKICAjIGZvciB2NmludFRodW1iLmMu
CkBAIC03Myw3ICs3NCw3IEBAIGluZGV4IDAyNGViNmQuLmNjZWNiOTAgMTAwNjQ0CiAgCiAgdjhj
cnlwdG9fYV9DRkxBR1MgPSAkKEFNX0NGTEFHUykgLWcgLU8wIC1tZnB1PWNyeXB0by1uZW9uLWZw
LWFybXY4IC1tYXJtCiAgdjhjcnlwdG9fdF9DRkxBR1MgPSAkKEFNX0NGTEFHUykgLWcgLU8wIC1t
ZnB1PWNyeXB0by1uZW9uLWZwLWFybXY4IC1tdGh1bWIKLUBAIC02NSwyMyArNjUsMjMgQEAgdjht
ZW1vcnlfYV9DRkxBR1MgPSAkKEFNX0NGTEFHUykgLWcgLU8wIFwKK0BAIC03MiwyMyArNzIsMjMg
QEAgdjhtZW1vcnlfYV9DRkxBR1MgPSAkKEFNX0NGTEFHUykgLWcgLU8wIFwKICB2OG1lbW9yeV90
X0NGTEFHUyA9ICQoQU1fQ0ZMQUdTKSAtZyAtTzAgXAogIAkJCS1tYXJjaD1hcm12OC1hIC1tZnB1
PWNyeXB0by1uZW9uLWZwLWFybXY4IC1tdGh1bWIKICAKQEAgLTEwMyw2ICsxMDQsMyBAQCBpbmRl
eCAwMjRlYjZkLi5jY2VjYjkwIDEwMDY0NAogK3ZjdnRfZml4ZWRfZmxvYXRfVkZQX0NGTEFHUyA9
ICQoQU1fQ0ZMQUdTKSAtZyAtbWZwdT12ZnB2MwogIAogIHZmcHY0X2ZtYV9DRkxBR1MgID0gJChB
TV9DRkxBR1MpIC1nIC1PMCAtbWFyY2g9YXJtdjd2ZSAtbWNwdT1jb3J0ZXgtYTE1IC1tZnB1PXZm
cHY0IC1tYXJtCi0tLSAKLTIuMTIuMgotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1tZW1jaGVjay10ZXN0cy1GaXgtdGltZXJmZC1zeXNj
YWxsLXRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQv
MDAwMS1tZW1jaGVjay10ZXN0cy1GaXgtdGltZXJmZC1zeXNjYWxsLXRlc3QucGF0Y2gKaW5kZXgg
MTVmYmJlOTU0Zi4uNGZlOTQxNzc1MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWVtY2hlY2stdGVzdHMtRml4LXRpbWVyZmQtc3lzY2Fs
bC10ZXN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmlu
ZC8wMDAxLW1lbWNoZWNrLXRlc3RzLUZpeC10aW1lcmZkLXN5c2NhbGwtdGVzdC5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gNWQ0MTFmZDE0N2Q2NTJlOWQ3YmIyNTlmNDA0ODY5M2M2ZTQ3NDJh
YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZjk3M2E0YTQwZmM3MzkwNTMxZDMwOWQ1
ODE2ZDM1ODFkNGUyZTA0OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBNb24sIDkgTWFyIDIwMjAgMTY6MzA6MTkgLTA3
MDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVtY2hlY2svdGVzdHM6IEZpeCB0aW1lcmZkIHN5c2NhbGwg
dGVzdApAQCAtOSwxNSArOSwxOCBAQCBoYXZlIHRoZSBpbXBsZW1lbnRhdGlvbiBvciBzeXNjYWxs
IGlzIG5vdCBkZWZpbmVkCiAKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL3Nv
dXJjZWZvcmdlLm5ldC9wL3ZhbGdyaW5kL21haWxtYW4vbWVzc2FnZS8zNjk0Mzg5Ny9dCiBTaWdu
ZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgorCiAtLS0KLSBjb25maWcu
aC5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA5ICsrKysrKysrKwotIGNvbmZpZ3Vy
ZS5hYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKysrCi0gbWVtY2hlY2svdGVzdHMv
bGludXgvdGltZXJmZC1zeXNjYWxsLmMgfCAxMCArKysrKysrKy0tCi0gNSBmaWxlcyBjaGFuZ2Vk
LCAzMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorIGNvbmZpZy5oLmluICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDMgKysrCisgY29uZmlndXJlLmFjICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArCisgbWVtY2hlY2svdGVzdHMvbGludXgvdGltZXJmZC1zeXNjYWxs
LmMgfCAxNCArKysrKysrKysrKy0tLQorIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKIAorZGlmZiAtLWdpdCBhL2NvbmZpZy5oLmluIGIvY29uZmlnLmgu
aW4KK2luZGV4IGJiNTA4NTQuLmUzOTJmMmEgMTAwNjQ0CiAtLS0gYS9jb25maWcuaC5pbgogKysr
IGIvY29uZmlnLmguaW4KLUBAIC0zMDEsNiArMzAxLDkgQEAKK0BAIC00MDAsNiArNDAwLDkgQEAK
ICAvKiBEZWZpbmUgdG8gMSBpZiB5b3UgaGF2ZSB0aGUgPHN5cy9zeXNudmwuaD4gaGVhZGVyIGZp
bGUuICovCiAgI3VuZGVmIEhBVkVfU1lTX1NZU05WTF9ICiAgCkBAIC0yNyw5ICszMCwxMSBAQCBT
aWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIC8qIERlZmluZSB0
byAxIGlmIHlvdSBoYXZlIHRoZSA8c3lzL3RpbWUuaD4gaGVhZGVyIGZpbGUuICovCiAgI3VuZGVm
IEhBVkVfU1lTX1RJTUVfSAogIAorZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3Vy
ZS5hYworaW5kZXggYmYwMjRhYy4uYmMzZTVlNiAxMDA3NTUKIC0tLSBhL2NvbmZpZ3VyZS5hYwog
KysrIGIvY29uZmlndXJlLmFjCi1AQCAtNDA5OCw2ICs0MDk4LDcgQEAgQUNfQ0hFQ0tfSEVBREVS
UyhbICAgICAgIFwKK0BAIC00ODE0LDYgKzQ4MTQsNyBAQCBBQ19DSEVDS19IRUFERVJTKFsgICAg
ICAgXAogICAgICAgICAgc3lzL3N5c2NhbGwuaCAgICBcCiAgICAgICAgICBzeXMvc3lzbnZsLmgg
ICAgIFwKICAgICAgICAgIHN5cy90aW1lLmggICAgICAgXApAQCAtMzcsOSArNDIsMTEgQEAgU2ln
bmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAgICAgICAgIHN5cy90
eXBlcy5oICAgICAgXAogICAgICAgICAgXSkKICAKK2RpZmYgLS1naXQgYS9tZW1jaGVjay90ZXN0
cy9saW51eC90aW1lcmZkLXN5c2NhbGwuYyBiL21lbWNoZWNrL3Rlc3RzL2xpbnV4L3RpbWVyZmQt
c3lzY2FsbC5jCitpbmRleCA2MWQ3NWI1Li4xYmE4ODhhIDEwMDY0NAogLS0tIGEvbWVtY2hlY2sv
dGVzdHMvbGludXgvdGltZXJmZC1zeXNjYWxsLmMKICsrKyBiL21lbWNoZWNrL3Rlc3RzL2xpbnV4
L3RpbWVyZmQtc3lzY2FsbC5jCi1AQCAtNDUsNiArNDUsOSBAQAorQEAgLTQyLDYgKzQyLDkgQEAK
ICAjaWYgZGVmaW5lZChIQVZFX1NZU19USU1FX0gpCiAgI2luY2x1ZGUgPHN5cy90aW1lLmg+CiAg
I2VuZGlmCkBAIC00OSw3ICs1Niw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+CiAgI2lmIGRlZmluZWQoSEFWRV9TWVNfVFlQRVNfSCkKICAjaW5jbHVkZSA8
c3lzL3R5cGVzLmg+CiAgI2VuZGlmCi1AQCAtNTQsNyArNTcsOCBAQAorQEAgLTUxLDcgKzU0LDgg
QEAKICAgKiB0aW1lcmZkXyogc3lzdGVtIGNhbGwgbnVtYmVycyBpbnRyb2R1Y2VkIGluIDIuNi4y
My4gVGhlc2UgY29uc3RhbnRzIGFyZQogICAqIG5vdCB5ZXQgaW4gdGhlIGdsaWJjIDIuNyBoZWFk
ZXJzLCB0aGF0IGlzIHdoeSB0aGV5IGFyZSBkZWZpbmVkIGhlcmUuCiAgICovCkBAIC01OSw3ICs2
Niw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgI2lm
IGRlZmluZWQoX194ODZfNjRfXykKICAjZGVmaW5lIF9fTlJfdGltZXJmZF9jcmVhdGUgIDI4Mwog
ICNlbGlmIGRlZmluZWQoX19pMzg2X18pCi1AQCAtNjcsOCArNzEsMTAgQEAKK0BAIC02NCw4ICs2
OCwxMCBAQAogICNlcnJvciBDYW5ub3QgZGV0ZWN0IHlvdXIgYXJjaGl0ZWN0dXJlIQogICNlbmRp
ZgogICNlbmRpZgpAQCAtNzEsNyArNzgsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPgogICNpZiBkZWZpbmVkKF9feDg2XzY0X18pCiAgI2RlZmluZSBfX05S
X3RpbWVyZmRfc2V0dGltZSAyODYKICAjZGVmaW5lIF9fTlJfdGltZXJmZF9nZXR0aW1lIDI4Nwot
QEAgLTg1LDcgKzkxLDcgQEAKK0BAIC04Miw3ICs4OCw3IEBACiAgI2Vycm9yIENhbm5vdCBkZXRl
Y3QgeW91ciBhcmNoaXRlY3R1cmUhCiAgI2VuZGlmCiAgI2VuZGlmCkBAIC04MCw3ICs4Nyw3IEBA
IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgCiAgCiAgLyog
RGVmaW5pdGlvbnMgZnJvbSBpbmNsdWRlL2xpbnV4L3RpbWVyZmQuaCAqLwotQEAgLTEyNyw2ICsx
MzMsNyBAQCB2b2lkIHNldF90aW1lc3BlYyhzdHJ1Y3QgdGltZXNwZWMgKnRtciwKK0BAIC0xMjQs
NiArMTMwLDcgQEAgdm9pZCBzZXRfdGltZXNwZWMoc3RydWN0IHRpbWVzcGVjICp0bXIsIHVuc2ln
bmVkIGxvbmcgbG9uZyB1c3RpbWUpCiAgICB0bXItPnR2X25zZWMgPSAobG9uZykgKDEwMDBVTEwg
KiAodXN0aW1lICUgMTAwMDAwMFVMTCkpOwogIH0KICAKQEAgLTg4LDcgKzk1LDcgQEAgU2lnbmVk
LW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICBpbnQgdGltZXJmZF9jcmVh
dGUoaW50IGNsb2NraWQsIGludCBmbGFncykKICB7CiAgICByZXR1cm4gc3lzY2FsbChfX05SX3Rp
bWVyZmRfY3JlYXRlLCBjbG9ja2lkLCBmbGFncyk7Ci1AQCAtMTQyLDYgKzE0OSw3IEBAIGludCB0
aW1lcmZkX2dldHRpbWUoaW50IHVmYywgc3RydWN0IGl0aW0KK0BAIC0xMzksNiArMTQ2LDcgQEAg
aW50IHRpbWVyZmRfZ2V0dGltZShpbnQgdWZjLCBzdHJ1Y3QgaXRpbWVyc3BlYyAqb3RtcikKICB7
CiAgICByZXR1cm4gc3lzY2FsbChfX05SX3RpbWVyZmRfZ2V0dGltZSwgdWZjLCBvdG1yKTsKICB9
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAw
MS1tZW1jaGVjay12Z3Rlc3RzLXJlbW92ZS1mdWxscGF0aC1hZnRlci1mbGFncy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW1lbWNoZWNrLXZndGVz
dHMtcmVtb3ZlLWZ1bGxwYXRoLWFmdGVyLWZsYWdzLnBhdGNoCmluZGV4IGRjZThiNTJiYTMuLmYx
ZGYxNjkzNmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxn
cmluZC8wMDAxLW1lbWNoZWNrLXZndGVzdHMtcmVtb3ZlLWZ1bGxwYXRoLWFmdGVyLWZsYWdzLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW1l
bWNoZWNrLXZndGVzdHMtcmVtb3ZlLWZ1bGxwYXRoLWFmdGVyLWZsYWdzLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSAzZmY4MmRjYjg0NGY5OGRiZjY3YzY5ZjExZjY1MTZiYzIzNDcyNWE5IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyMjJkMzc3ZTA5YmQ5YmM1MjU0NWM4ODY4N2Jj
ZTc1ZWNlMjI4NjQ1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogU3RhY3kgR2Fpa292
YWlhIDxTdGFjeS5HYWlrb3ZhaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMTYgU2VwIDIw
MjAgMTM6NDU6MDcgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVtY2hlY2sgdmd0ZXN0cyByZW1v
dmUgZnVsbHBhdGgtYWZ0ZXIgZmxhZ3MKQEAgLTE0LDEzICsxNCwxNCBAQCBwYXRocyBpbiBjb3Jy
ZXNwb25kaW5nIHRlc3RzIC5iYiBzY3JpcHQuCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlh
dGUgW2VtYmVkZGVkIHNwZWNpZmljXQogCiBTaWduZWQtb2ZmLWJ5OiBTdGFjeSBHYWlrb3ZhaWEg
PFN0YWN5LkdhaWtvdmFpYUB3aW5kcml2ZXIuY29tPgorCiAtLS0KICBtZW1jaGVjay90ZXN0cy9i
YWRmcmVlMy52Z3Rlc3QgfCAyICstCiAgbWVtY2hlY2svdGVzdHMvdmFyaW5mbzUudmd0ZXN0IHwg
MiArLQogIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
CiBkaWZmIC0tZ2l0IGEvbWVtY2hlY2svdGVzdHMvYmFkZnJlZTMudmd0ZXN0IGIvbWVtY2hlY2sv
dGVzdHMvYmFkZnJlZTMudmd0ZXN0Ci1pbmRleCAzZGZjNWZkOGEuLjRlZTAzZjAwYSAxMDA2NDQK
K2luZGV4IDNkZmM1ZmQuLjRlZTAzZjAgMTAwNjQ0CiAtLS0gYS9tZW1jaGVjay90ZXN0cy9iYWRm
cmVlMy52Z3Rlc3QKICsrKyBiL21lbWNoZWNrL3Rlc3RzL2JhZGZyZWUzLnZndGVzdAogQEAgLTEs
MyArMSwzIEBACkBAIC0yOSw3ICszMCw3IEBAIGluZGV4IDNkZmM1ZmQ4YS4uNGVlMDNmMDBhIDEw
MDY0NAogK3Znb3B0czogLXEKICBzdGRlcnJfZmlsdGVyX2FyZ3M6IGJhZGZyZWUuYwogZGlmZiAt
LWdpdCBhL21lbWNoZWNrL3Rlc3RzL3ZhcmluZm81LnZndGVzdCBiL21lbWNoZWNrL3Rlc3RzL3Zh
cmluZm81LnZndGVzdAotaW5kZXggMDYzZDAwZGNlLi43OWM0YTcyYTQgMTAwNjQ0CitpbmRleCAw
NjNkMDBkLi43OWM0YTcyIDEwMDY0NAogLS0tIGEvbWVtY2hlY2svdGVzdHMvdmFyaW5mbzUudmd0
ZXN0CiArKysgYi9tZW1jaGVjay90ZXN0cy92YXJpbmZvNS52Z3Rlc3QKIEBAIC0xLDMgKzEsMyBA
QApAQCAtMzcsNiArMzgsMyBAQCBpbmRleCAwNjNkMDBkY2UuLjc5YzRhNzJhNCAxMDA2NDQKIC12
Z29wdHM6IC0tZnVsbHBhdGgtYWZ0ZXI9bWVtY2hlY2svICAtLWZ1bGxwYXRoLWFmdGVyPWNvcmVn
cmluZC8gLS1yZWFkLXZhci1pbmZvPXllcyAtLXJlYWQtaW5saW5lLWluZm89eWVzIC1xCiArdmdv
cHRzOiAtLXJlYWQtdmFyLWluZm89eWVzIC0tcmVhZC1pbmxpbmUtaW5mbz15ZXMgLXEKICBzdGRl
cnJfZmlsdGVyOiBmaWx0ZXJfdmFyaW5mbzMKLS0tIAotMi4yNS4xCi0KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW5vbmUtdGVzdHMtZmRs
ZWFrX2Ntc2cuc3RkZXJyLmV4cC1hZGp1c3QtdG1wLXBhdGhzLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbm9uZS10ZXN0cy1mZGxlYWtfY21zZy5z
dGRlcnIuZXhwLWFkanVzdC10bXAtcGF0aHMucGF0Y2gKaW5kZXggZTQyMWFjNmM4MC4uNWNmMDI5
ZjE0OSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5k
LzAwMDEtbm9uZS10ZXN0cy1mZGxlYWtfY21zZy5zdGRlcnIuZXhwLWFkanVzdC10bXAtcGF0aHMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEt
bm9uZS10ZXN0cy1mZGxlYWtfY21zZy5zdGRlcnIuZXhwLWFkanVzdC10bXAtcGF0aHMucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGY0MDUyOTdkMzM4MmNkOTgzOTFkMDJmMzk3ZTIzODdkYTFm
NDI4NzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDM3YWQ5YWIzNjBhYzkxMzdlZTM2
OTYzNzg5MjA4ZGZkNzMwMTI3YTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMjQgSmFu
IDIwMjAgMTc6NTU6MzkgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gbm9uZS90ZXN0cy9mZGxlYWtf
Y21zZy5zdGRlcnIuZXhwOiBhZGp1c3QgL3RtcCBwYXRocwpAQCAtOCwxMiArOCwxMyBAQCB2YWxn
cmluZCBvdXRwdXQgY2hhbmdlcyBhY2NvcmRpbmdseQogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBw
cm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KKwogLS0tCiAgbm9uZS90ZXN0cy9mZGxlYWtf
Y21zZy5zdGRlcnIuZXhwIHwgNCArKy0tCiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL25vbmUvdGVzdHMvZmRsZWFrX2Ntc2cu
c3RkZXJyLmV4cCBiL25vbmUvdGVzdHMvZmRsZWFrX2Ntc2cuc3RkZXJyLmV4cAotaW5kZXggNmU1
YTc5N2I5Li4wZWRlMWFiMTggMTAwNjQ0CitpbmRleCAwZmU1NmVhLi41YTA2MDVlIDEwMDY0NAog
LS0tIGEvbm9uZS90ZXN0cy9mZGxlYWtfY21zZy5zdGRlcnIuZXhwCiArKysgYi9ub25lL3Rlc3Rz
L2ZkbGVha19jbXNnLnN0ZGVyci5leHAKIEBAIC0yNSwxMCArMjUsMTAgQEAgT3BlbiBmaWxlIGRl
c2NyaXB0b3IgLi4uOiAvZGV2L251bGwKQEAgLTI5LDYgKzMwLDMgQEAgaW5kZXggNmU1YTc5N2I5
Li4wZWRlMWFiMTggMTAwNjQ0CiAgICAgLi4uCiAgCiAgT3BlbiBBRl9VTklYIHNvY2tldCAuLi46
IDx1bmtub3duPgotLS0gCi0yLjE3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbm9uZS10ZXN0cy14ODYtbGludXgtc2VnX292ZXJy
aWRlLmMtYWRkLW1pc3NpbmctaW5jbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxn
cmluZC92YWxncmluZC8wMDAxLW5vbmUtdGVzdHMteDg2LWxpbnV4LXNlZ19vdmVycmlkZS5jLWFk
ZC1taXNzaW5nLWluY2wucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDVlMzZj
Mjg1MjMuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3Zh
bGdyaW5kLzAwMDEtbm9uZS10ZXN0cy14ODYtbGludXgtc2VnX292ZXJyaWRlLmMtYWRkLW1pc3Np
bmctaW5jbC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDMwICswLDAgQEAKLUZyb20gOTc4ZDll
ZDdmODU3ZjJjZGNkMmE4NjMyZjNjMmZlYjU2Yjk5YzgyNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKLUZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+Ci1EYXRlOiBN
b24sIDggTWF5IDIwMjMgMTE6NTY6MzUgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gbm9uZS90ZXN0
cy94ODYtbGludXgvc2VnX292ZXJyaWRlLmM6IGFkZCBtaXNzaW5nIGluY2x1ZGUgZm9yCi0gbXVz
bCBidWlsZHMKLQotT3RoZXJ3aXNlIFNZU19tb2RpZnlfbGR0IGlzIHVuZGVmaW5lZC4KLQotVXBz
dHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vYnVncy5rZGUub3JnL3Nob3dfYnVnLmNn
aT9pZD0zODIwMzRdCi1TaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51
dHJvbml4LmRlPgotCi0tLS0KLSBub25lL3Rlc3RzL3g4Ni1saW51eC9zZWdfb3ZlcnJpZGUuYyB8
IDQgKysrKwotIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBh
L25vbmUvdGVzdHMveDg2LWxpbnV4L3NlZ19vdmVycmlkZS5jIGIvbm9uZS90ZXN0cy94ODYtbGlu
dXgvc2VnX292ZXJyaWRlLmMKLWluZGV4IGNhOGZiZmUuLjRlZjQzOTQgMTAwNjQ0Ci0tLS0gYS9u
b25lL3Rlc3RzL3g4Ni1saW51eC9zZWdfb3ZlcnJpZGUuYwotKysrIGIvbm9uZS90ZXN0cy94ODYt
bGludXgvc2VnX292ZXJyaWRlLmMKLUBAIC0zLDYgKzMsMTAgQEAKLSAjaW5jbHVkZSA8ZXJybm8u
aD4KLSAjaW5jbHVkZSA8c3RyaW5nLmg+Ci0gI2luY2x1ZGUgIi4uLy4uLy4uL2NvbmZpZy5oIgot
KyNpZiBkZWZpbmVkKE1VU0xfTElCQykKLSsjaW5jbHVkZSA8c3lzY2FsbC5oPgotKyNpbmNsdWRl
IDx1bmlzdGQuaD4KLSsjZW5kaWYKLSAKLSAKLSAvKiBTdHVmZiBmcm9tIFdpbmUuICovCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1zaWdx
dWV1ZS1SZW5hbWUtX3NpZmllbGRzLXRvLV9fc2lfZmllbGRzLW9uLW11c2wucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1zaWdxdWV1ZS1SZW5hbWUt
X3NpZmllbGRzLXRvLV9fc2lfZmllbGRzLW9uLW11c2wucGF0Y2gKaW5kZXggMjczNjYxNTNmNy4u
Mjg3YmExY2IyZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3Zh
bGdyaW5kLzAwMDEtc2lncXVldWUtUmVuYW1lLV9zaWZpZWxkcy10by1fX3NpX2ZpZWxkcy1vbi1t
dXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8w
MDAxLXNpZ3F1ZXVlLVJlbmFtZS1fc2lmaWVsZHMtdG8tX19zaV9maWVsZHMtb24tbXVzbC5wYXRj
aApAQCAtMSwxNyArMSwxOCBAQAotRnJvbSA2NGFkMjc0NGFjZmI0ZmE0MGIxYzExNDYzM2EwNTNm
ODcxMjVhMjAzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxMWVmMjY5ZTkzMzkxZmE1
ZmJiODUwNjMyM2QwNzYzNTQ5YTI0OTIwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTAgSnVuIDIwMTcgMDA6
NDY6MzkgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSCAxLzZdIHNpZ3F1ZXVlOiBSZW5hbWUgX3NpZmll
bGRzIHRvIF9fc2lfZmllbGRzIG9uIG11c2wKK1N1YmplY3Q6IFtQQVRDSF0gc2lncXVldWU6IFJl
bmFtZSBfc2lmaWVsZHMgdG8gX19zaV9maWVsZHMgb24gbXVzbAogCiBVcHN0cmVhbS1TdGF0dXM6
IFBlbmRpbmcKIAogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
KwogLS0tCiAgbWVtY2hlY2svdGVzdHMvbGludXgvc2lncXVldWUuYyB8IDUgKysrKysKICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9tZW1jaGVjay90ZXN0
cy9saW51eC9zaWdxdWV1ZS5jIGIvbWVtY2hlY2svdGVzdHMvbGludXgvc2lncXVldWUuYwotaW5k
ZXggZDE4YmQ3Mi4uYWNiN2NiYSAxMDA2NDQKK2luZGV4IDRiNmZiMGYuLmQzN2ZlOTMgMTAwNjQ0
CiAtLS0gYS9tZW1jaGVjay90ZXN0cy9saW51eC9zaWdxdWV1ZS5jCiArKysgYi9tZW1jaGVjay90
ZXN0cy9saW51eC9zaWdxdWV1ZS5jCiBAQCAtOCw2ICs4LDExIEBACkBAIC0yNiw2ICsyNywzIEBA
IGluZGV4IGQxOGJkNzIuLmFjYjdjYmEgMTAwNjQ0CiAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIg
Kiphcmd2KQogIHsKICAgIHNpZ2luZm9fdCAqc2k7Ci0tLSAKLTIuMTMuMQotCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS12YWxncmluZC1m
aWx0ZXJfeG1sX2ZyYW1lcy1kby1ub3QtZmlsdGVyLXVzci5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLXZhbGdyaW5kLWZpbHRlcl94bWxfZnJhbWVz
LWRvLW5vdC1maWx0ZXItdXNyLnBhdGNoCmluZGV4IGJmMGYwZGVkMjEuLjEzNDg2ODU5YjIgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLXZh
bGdyaW5kLWZpbHRlcl94bWxfZnJhbWVzLWRvLW5vdC1maWx0ZXItdXNyLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLXZhbGdyaW5kLWZpbHRl
cl94bWxfZnJhbWVzLWRvLW5vdC1maWx0ZXItdXNyLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJv
bSBkMWRlYTNjMmJjZjFlMjJiYWFiMzllMmMwYjhjYTU5ZGI4YTViYzM3IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA0ZWEzNDE1YmMwODlhOGY5NjdmOWQ4MjQ0M2ZlZDI5ODIzZTdhZjRj
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmFuZHkgTWFjTGVvZCA8UmFuZHkuTWFj
TGVvZEB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAxMyBNYXkgMjAxOSAxNzoxMjoyMSAtMDQw
MAotU3ViamVjdDogW1BBVENIIDEvMl0gdmFsZ3JpbmQ6IGZpbHRlcl94bWxfZnJhbWVzOiBkbyBu
b3QgZmlsdGVyIC91c3IKK1N1YmplY3Q6IFtQQVRDSF0gdmFsZ3JpbmQ6IGZpbHRlcl94bWxfZnJh
bWVzOiBkbyBub3QgZmlsdGVyIC91c3IKIAogZmlsdGVyX3htbF9mcmFtZXMgaXMgaW50ZW5kZWQg
dG8gZmlsdGVyIHN5c3RlbSBwYXRocyB1bmRlcgogJy91c3InIHRoYXQgdmFyeSBmcm9tIHBsYXRm
b3JtIHRvIHBsYXRmb3JtLiBJbiB0aGUgcHRlc3QgY2FzZQpAQCAtMTYsMTIgKzE2LDEzIEBAIGFu
eSBuZWdhdGl2ZSBpbXBhY3QuCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW1lvY3Rv
IHNwZWNpZmljXQogCiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBNYWNMZW9kIDxSYW5keS5NYWNMZW9k
QHdpbmRyaXZlci5jb20+CisKIC0tLQogIHRlc3RzL2ZpbHRlcl94bWxfZnJhbWVzIHwgMyArKy0K
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYg
LS1naXQgYS90ZXN0cy9maWx0ZXJfeG1sX2ZyYW1lcyBiL3Rlc3RzL2ZpbHRlcl94bWxfZnJhbWVz
Ci1pbmRleCBmMWZhM2YwNzAuLjA0ZmJjODJkZSAxMDA3NTUKK2luZGV4IGYxZmEzZjAuLjA0ZmJj
ODIgMTAwNzU1CiAtLS0gYS90ZXN0cy9maWx0ZXJfeG1sX2ZyYW1lcwogKysrIGIvdGVzdHMvZmls
dGVyX3htbF9mcmFtZXMKIEBAIC00Nyw3ICs0Nyw4IEBAIHdoaWxlIChteSAkbGluZSA9IDw+KQpA
QCAtMzQsNiArMzUsMyBAQCBpbmRleCBmMWZhM2YwNzAuLjA0ZmJjODJkZSAxMDA3NTUKICAgICAg
fQogIH0KICAKLS0tIAotMi4xNy4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxncmluZC92YWxncmluZC8wMDAyLWNvbnRleHQtQVBJcy1hcmUtbm90LWF2YWlsYWJsZS1v
bi1tdXNsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAw
MDItY29udGV4dC1BUElzLWFyZS1ub3QtYXZhaWxhYmxlLW9uLW11c2wucGF0Y2gKaW5kZXggN2Yw
ZTM4Y2I5NS4uYmE2NDRjY2Y5NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGdyaW5kL3ZhbGdyaW5kLzAwMDItY29udGV4dC1BUElzLWFyZS1ub3QtYXZhaWxhYmxlLW9uLW11
c2wucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAw
MDItY29udGV4dC1BUElzLWFyZS1ub3QtYXZhaWxhYmxlLW9uLW11c2wucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDI2YzEwNGFkZjZjNTE2MjU3MmI3YWEyZmFjODlkMDgzNWI3ZjhmMGIgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU3MjFiNTQ0NzBlY2JkOWUwNjE2NzllZjhjYTQ3
N2E1MDJhOWU5MjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSYW5keSBNYWNMZW9k
IDxSYW5keS5NYWNMZW9kQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE2IE9jdCAyMDE4IDIx
OjI3OjQ2IC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbnRleHQgQVBJcyBhcmUgbm90IGF2YWls
YWJsZSBvbiBtdXNsCkBAIC0xNCwxMyArMTQsMTQgQEAgZm9yIHZhbGdyaW5kLTMuMTcuCiBVcHN0
cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9idWdzLmtkZS5vcmcvc2hvd19idWcuY2dp
P2lkPTQzNDc3NV0KIAogU2lnbmVkLW9mZi1ieTogWWkgRmFuIFl1IDx5aWZhbi55dUB3aW5kcml2
ZXIuY29tPgorCiAtLS0KICBkcmQvdGVzdHMvc3dhcGNvbnRleHQuYyAgICAgICAgICAgICAgfCA2
ICsrKysrKwogIG1lbWNoZWNrL3Rlc3RzL2xpbnV4L3N0YWNrX2NoYW5nZXMuYyB8IDcgKysrKysr
LQogIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBk
aWZmIC0tZ2l0IGEvZHJkL3Rlc3RzL3N3YXBjb250ZXh0LmMgYi9kcmQvdGVzdHMvc3dhcGNvbnRl
eHQuYwotaW5kZXggNjIyYzcwYmM1Li41ZTcyYmIwZjMgMTAwNjQ0CitpbmRleCAyY2I5NjlhLi4z
YTlkNGZhIDEwMDY0NAogLS0tIGEvZHJkL3Rlc3RzL3N3YXBjb250ZXh0LmMKICsrKyBiL2RyZC90
ZXN0cy9zd2FwY29udGV4dC5jCiBAQCAtMjAsNiArMjAsNyBAQApAQCAtMzEsNyArMzIsNyBAQCBp
bmRleCA2MjJjNzBiYzUuLjVlNzJiYjBmMyAxMDA2NDQKICB0eXBlZGVmIHN0cnVjdCB0aHJlYWRf
bG9jYWwgewogICAgdWNvbnRleHRfdCB1Y1szXTsKICAgIHNpemVfdCBucnN3OwotQEAgLTY3LDkg
KzY4LDExIEBAIHZvaWQgKndvcmtlcih2b2lkICpkYXRhKQorQEAgLTcxLDkgKzcyLDExIEBAIHZv
aWQgKndvcmtlcih2b2lkICpkYXRhKQogICAgc3dhcGNvbnRleHQoJnRsb2NhbC0+dWNbMF0sICZ0
bG9jYWwtPnVjWzFdKTsKICAgIHJldHVybiBOVUxMOwogIH0KQEAgLTQzLDcgKzQ0LDcgQEAgaW5k
ZXggNjIyYzcwYmM1Li41ZTcyYmIwZjMgMTAwNjQ0CiAgICBlbnVtIHsgTlIgPSAzMiB9OwogICAg
dGhyZWFkX2xvY2FsX3QgdGxvY2FsW05SXTsKICAgIHB0aHJlYWRfdCB0aHJlYWRbTlJdOwotQEAg
LTk0LDYgKzk3LDkgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKK0BAIC05OSw2
ICsxMDIsOSBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltdKQogIAogICAgZm9yIChp
ID0gMDsgaSA8IE5SOyBpKyspCiAgICAgIHB0aHJlYWRfam9pbih0aHJlYWRbaV0sIE5VTEwpOwpA
QCAtNTQsNyArNTUsNyBAQCBpbmRleCA2MjJjNzBiYzUuLjVlNzJiYjBmMyAxMDA2NDQKICAgIHJl
dHVybiAwOwogIH0KIGRpZmYgLS1naXQgYS9tZW1jaGVjay90ZXN0cy9saW51eC9zdGFja19jaGFu
Z2VzLmMgYi9tZW1jaGVjay90ZXN0cy9saW51eC9zdGFja19jaGFuZ2VzLmMKLWluZGV4IDdmOTdi
OTBhNS4uYTI2Y2I0YWU2IDEwMDY0NAoraW5kZXggN2Y5N2I5MC4uYTI2Y2I0YSAxMDA2NDQKIC0t
LSBhL21lbWNoZWNrL3Rlc3RzL2xpbnV4L3N0YWNrX2NoYW5nZXMuYwogKysrIGIvbWVtY2hlY2sv
dGVzdHMvbGludXgvc3RhY2tfY2hhbmdlcy5jCiBAQCAtMTAsNiArMTAsNyBAQApAQCAtODcsNiAr
ODgsMyBAQCBpbmRleCA3Zjk3YjkwYTUuLmEyNmNiNGFlNiAxMDA2NDQKICsjZW5kaWYKICAgICAg
cmV0dXJuIDA7CiAgfQotLS0gCi0yLjE3LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDMtY29ycmVjdC1pbmNsdWRlLWRpcmVjdGl2ZS1w
YXRoLWZvci1jb25maWcuaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92
YWxncmluZC8wMDAzLWNvcnJlY3QtaW5jbHVkZS1kaXJlY3RpdmUtcGF0aC1mb3ItY29uZmlnLmgu
cGF0Y2gKaW5kZXggYzI5NjVjNDBkZi4uYmVmOGU2ZDI3NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDMtY29ycmVjdC1pbmNsdWRlLWRpcmVj
dGl2ZS1wYXRoLWZvci1jb25maWcuaC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMy1jb3JyZWN0LWluY2x1ZGUtZGlyZWN0aXZlLXBhdGgtZm9y
LWNvbmZpZy5oLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSBlY2JkZWE3YmQ4YjA4MjA1ZjFi
YzNmNmI3MmQ0YjRhODBmMzEzZmNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4Y2Fk
MGE0NzIzYmQyM2JlY2EzNzg4YzEwOGVkNDRjZTg5MWNjNjdiIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTAg
SnVuIDIwMTcgMDE6MDM6MTcgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSCAzLzZdIGNvcnJlY3QgaW5j
bHVkZSBkaXJlY3RpdmUgcGF0aCBmb3IgY29uZmlnLmgKK1N1YmplY3Q6IFtQQVRDSF0gY29ycmVj
dCBpbmNsdWRlIGRpcmVjdGl2ZSBwYXRoIGZvciBjb25maWcuaAogCiB3aGVuIGJ1aWxkaW5nIG91
dCBvZiBzb3VyY2UgdHJlZSwgaXQgY2FuIG5vdCBmaW5kCiB0aGUgZ2VuZXJhdGVkIGNvbmZpZy5o
IG90aGVyd2lzZQpAQCAtOSwxMyArOSwxNCBAQCB0aGUgZ2VuZXJhdGVkIGNvbmZpZy5oIG90aGVy
d2lzZQogVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CisKIC0tLQogIG1lbWNoZWNrL3Rlc3RzL2xpbnV4L3N5c2Nh
bGxzLTIwMDcuYyAgfCAyICstCiAgbWVtY2hlY2svdGVzdHMvbGludXgvc3lzbG9nLXN5c2NhbGwu
YyB8IDIgKy0KICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIAogZGlmZiAtLWdpdCBhL21lbWNoZWNrL3Rlc3RzL2xpbnV4L3N5c2NhbGxzLTIwMDcuYyBi
L21lbWNoZWNrL3Rlc3RzL2xpbnV4L3N5c2NhbGxzLTIwMDcuYwotaW5kZXggYjYxYzZkNS4uY2Mz
ZmQ2MiAxMDA2NDQKK2luZGV4IGI5MWRmODIuLmMxNWMzZWIgMTAwNjQ0CiAtLS0gYS9tZW1jaGVj
ay90ZXN0cy9saW51eC9zeXNjYWxscy0yMDA3LmMKICsrKyBiL21lbWNoZWNrL3Rlc3RzL2xpbnV4
L3N5c2NhbGxzLTIwMDcuYwogQEAgLTEwLDcgKzEwLDcgQEAKQEAgLTQwLDYgKzQxLDMgQEAgaW5k
ZXggMTE0MzcyMi4uMjFlNzU4YiAxMDA2NDQKICAjaW5jbHVkZSA8c3RkaW8uaD4KICAjaWYgZGVm
aW5lZChIQVZFX1NZU19LTE9HX0gpCiAgI2luY2x1ZGUgPHN5cy9rbG9nLmg+Ci0tLSAKLTIuMTMu
MQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQv
MDAwNS1Nb2RpZnktdmdfdGVzdC13cmFwcGVyLXRvLXN1cHBvcnQtUFRFU1QtZm9ybWF0cy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDA1LU1vZGlmeS12
Z190ZXN0LXdyYXBwZXItdG8tc3VwcG9ydC1QVEVTVC1mb3JtYXRzLnBhdGNoCmluZGV4IGZlYTNi
MDBmNjIuLmFlNjc2NGY3ZTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxn
cmluZC92YWxncmluZC8wMDA1LU1vZGlmeS12Z190ZXN0LXdyYXBwZXItdG8tc3VwcG9ydC1QVEVT
VC1mb3JtYXRzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxn
cmluZC8wMDA1LU1vZGlmeS12Z190ZXN0LXdyYXBwZXItdG8tc3VwcG9ydC1QVEVTVC1mb3JtYXRz
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMjQ0YTcyYzZmODgwMzU1MGYzN2U4MWY3MmJi
YWUwMzk2NTEwMTNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5ZDUyOGFmODM4Yzhm
MzVlNDFjMjA3MTYzNDgxNGZkMjBhODAwN2Y4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUs
IDE1IERlYyAyMDE1IDE1OjUwOjQ0ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1vZGlmeSB2Z190
ZXN0IHdyYXBwZXIgdG8gc3VwcG9ydCBQVEVTVCBmb3JtYXRzCkBAIC0yNCw2ICsyNCw3IEBAIElu
Y3JlYXNlIHRpbWUgbGltaXQgdG8gOTAgcy4KIChkb3VibGUgb2YgdGhlIGV4cGVjdGVkIHRpbWUg
b2YgZHJkL3Rlc3RzL3N0ZF9saXN0IG9uIHFlbXVhcm02NCkKIAogU2lnbmVkLW9mZi1ieTogWWkg
RmFuIFl1IDx5aWZhbi55dUB3aW5kcml2ZXIuY29tPgorCiAtLS0KICB0ZXN0cy92Z19yZWd0ZXN0
LmluIHwgNzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAg
MSBmaWxlIGNoYW5nZWQsIDU1IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQpAQCAtMjUy
LDYgKzI1MywzIEBAIGluZGV4IGFkMTg4MDAuLmU0YmQ4Y2IgMTAwNzU1CiAgICAgIH0KICAgICAg
cHJpbnQgIlxuIjsKICB9Ci0tLSAKLTIuMzAuMgotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAyMC1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1k
b19wYXRjaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8w
MDIwLUNvbW1pdHRpbmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmQ4Mjg1YmFkMzEKLS0tIC9kZXYvbnVsbAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAyMC1Db21taXR0aW5nLWNo
YW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaApAQCAtMCwwICsxLDMzMiBAQAorRnJvbSA1NjFmODli
OTU4NTFlMDA1NWZhZTUwMTBjNjM0MzNmMDQ3MmU5MTNhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbTogT3BlbkVtYmVkZGVkIDxvZS5wYXRjaEBvZT4KK0RhdGU6IE1vbiwgMSBKYW4gMjAy
NCAwODozNDo1OCArMDAwMAorU3ViamVjdDogW1BBVENIXSBDb21taXR0aW5nIGNoYW5nZXMgZnJv
bSBkb19wYXRjaAorCistLS0KKyBtZW1jaGVjay90ZXN0cy9iYWRmcmVlMy5zdGRlcnIuZXhwIHwg
ICA0ICstCisgbWVtY2hlY2svdGVzdHMvdmFyaW5mbzUuc3RkZXJyLmV4cCB8IDIxNiArKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLQorIDIgZmlsZXMgY2hhbmdlZCwgMTEwIGluc2VydGlvbnMo
KyksIDExMCBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL21lbWNoZWNrL3Rlc3RzL2JhZGZy
ZWUzLnN0ZGVyci5leHAgYi9tZW1jaGVjay90ZXN0cy9iYWRmcmVlMy5zdGRlcnIuZXhwCitpbmRl
eCAyMGU0OGE2Li5iNTE4NzAzIDEwMDY0NAorLS0tIGEvbWVtY2hlY2svdGVzdHMvYmFkZnJlZTMu
c3RkZXJyLmV4cAorKysrIGIvbWVtY2hlY2svdGVzdHMvYmFkZnJlZTMuc3RkZXJyLmV4cAorQEAg
LTEsMTEgKzEsMTEgQEAKKyBJbnZhbGlkIGZyZWUoKSAvIGRlbGV0ZSAvIGRlbGV0ZVtdIC8gcmVh
bGxvYygpCisgICAgYXQgMHguLi4uLi4uLjogZnJlZSAodmdfcmVwbGFjZV9tYWxsb2MuYzouLi4p
CistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvYmFkZnJlZS5jOjEyKQorKyAgIGJ5IDB4
Li4uLi4uLi46IG1haW4gKGJhZGZyZWUuYzoxMikKKyAgQWRkcmVzcyAweC4uLi4uLi4uIGlzIG5v
dCBzdGFjaydkLCBtYWxsb2MnZCBvciAocmVjZW50bHkpIGZyZWUnZAorIAorIEludmFsaWQgZnJl
ZSgpIC8gZGVsZXRlIC8gZGVsZXRlW10gLyByZWFsbG9jKCkKKyAgICBhdCAweC4uLi4uLi4uOiBm
cmVlICh2Z19yZXBsYWNlX21hbGxvYy5jOi4uLikKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0
ZXN0cy9iYWRmcmVlLmM6MTUpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAoYmFkZnJlZS5jOjE1
KQorICBBZGRyZXNzIDB4Li4uLi4uLi4gaXMgb24gdGhyZWFkIDEncyBzdGFjaworICBpbiBmcmFt
ZSAjMSwgY3JlYXRlZCBieSBtYWluIChiYWRmcmVlLmM6NykKKyAKK2RpZmYgLS1naXQgYS9tZW1j
aGVjay90ZXN0cy92YXJpbmZvNS5zdGRlcnIuZXhwIGIvbWVtY2hlY2svdGVzdHMvdmFyaW5mbzUu
c3RkZXJyLmV4cAoraW5kZXggMWExMGQwMy4uMGZkMTE5MCAxMDA2NDQKKy0tLSBhL21lbWNoZWNr
L3Rlc3RzL3ZhcmluZm81LnN0ZGVyci5leHAKKysrKyBiL21lbWNoZWNrL3Rlc3RzL3ZhcmluZm81
LnN0ZGVyci5leHAKK0BAIC0xLDE5MSArMSwxOTEgQEAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykg
Zm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3Jv
YWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvMV9t
YWluICh0ZXN0cy92YXJpbmZvNXNvLmM6NTIpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVf
bWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NCkKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0
ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHZhcmluZm81c28u
YzoyOSkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvMV9tYWluICh2YXJpbmZvNXNvLmM6NTIp
CisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5jOjE1NCkKKysg
ICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5jOjUpCisgIEFkZHJlc3MgMHguLi4uLi4u
LiBpcyAxIGJ5dGVzIGluc2lkZSBhIGJsb2NrIG9mIHNpemUgMyBhbGxvYydkCisgICAgYXQgMHgu
Li4uLi4uLjogbWFsbG9jICh2Z19yZXBsYWNlX21hbGxvYy5jOi4uLikKKy0gICBieSAweC4uLi4u
Li4uOiB2YXJpbmZvMV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6NTApCistICAgYnkgMHguLi4u
Li4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NCkKKy0gICBieSAweC4u
Li4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYnkgMHguLi4uLi4uLjogdmFy
aW5mbzFfbWFpbiAodmFyaW5mbzVzby5jOjUwKQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81
X21haW4gKHZhcmluZm81c28uYzoxNTQpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5m
bzUuYzo1KQorIAorIFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNo
ZWNrIHJlcXVlc3QKKy0gICBhdCAweC4uLi4uLi4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5j
OjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8xX21haW4gKHRlc3RzL3ZhcmluZm81c28u
Yzo1NSkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNv
LmM6MTU0KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysg
ICBhdCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4u
Li46IHZhcmluZm8xX21haW4gKHZhcmluZm81c28uYzo1NSkKKysgICBieSAweC4uLi4uLi4uOiB2
YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU0KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4g
KHZhcmluZm81LmM6NSkKKyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAwIGJ5dGVzIGluc2lkZSBn
bG9iYWwgdmFyICJnbG9iYWxfdTEiCisgIGRlY2xhcmVkIGF0IHZhcmluZm81c28uYzozOAorIAor
IFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QK
Ky0gICBhdCAweC4uLi4uLi4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5
IDB4Li4uLi4uLi46IHZhcmluZm8xX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzo1NikKKy0gICBi
eSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU0KQorLSAg
IGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBhdCAweC4uLi4u
Li4uOiBjcm9hayAodmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8x
X21haW4gKHZhcmluZm81c28uYzo1NikKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWlu
ICh2YXJpbmZvNXNvLmM6MTU0KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81LmM6
NSkKKyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAwIGJ5dGVzIGluc2lkZSBnbG9iYWwgdmFyICJn
bG9iYWxfaTEiCisgIGRlY2xhcmVkIGF0IHZhcmluZm81c28uYzo0MAorIAorIFVuaW5pdGlhbGlz
ZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAweC4u
Li4uLi4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46
IHZhcmluZm8xX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzo1NykKKy0gICBieSAweC4uLi4uLi4u
OiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU0KQorLSAgIGJ5IDB4Li4uLi4u
Li46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBjcm9hayAo
dmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8xX21haW4gKHZhcmlu
Zm81c28uYzo1NykKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNv
LmM6MTU0KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRp
b24gMHguLi4uLi4uLiBpcyAwIGJ5dGVzIGluc2lkZSBnbG9iYWxfdTJbM10sCisgIGEgZ2xvYmFs
IHZhcmlhYmxlIGRlY2xhcmVkIGF0IHZhcmluZm81c28uYzo0MgorIAorIFVuaW5pdGlhbGlzZWQg
Ynl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAweC4uLi4u
Li4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZh
cmluZm8xX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzo1OCkKKy0gICBieSAweC4uLi4uLi4uOiB2
YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU0KQorLSAgIGJ5IDB4Li4uLi4uLi46
IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBjcm9hayAodmFy
aW5mbzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8xX21haW4gKHZhcmluZm81
c28uYzo1OCkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6
MTU0KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRpb24g
MHguLi4uLi4uLiBpcyAwIGJ5dGVzIGluc2lkZSBnbG9iYWxfaTJbN10sCisgIGEgZ2xvYmFsIHZh
cmlhYmxlIGRlY2xhcmVkIGF0IHZhcmluZm81c28uYzo0NAorIAorIFVuaW5pdGlhbGlzZWQgYnl0
ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAweC4uLi4uLi4u
OiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmlu
Zm8xX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzo1OSkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJp
bmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU0KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1h
aW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5m
bzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8xX21haW4gKHZhcmluZm81c28u
Yzo1OSkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU0
KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRpb24gMHgu
Li4uLi4uLiBpcyAwIGJ5dGVzIGluc2lkZSBsb2NhbCB2YXIgImxvY2FsIgorICBkZWNsYXJlZCBh
dCB2YXJpbmZvNXNvLmM6NDksIGluIGZyYW1lICNYIG9mIHRocmVhZCAxCisgCisgVW5pbml0aWFs
aXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4
Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4u
LjogZm9vMiAodGVzdHMvdmFyaW5mbzVzby5jOjcxKQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmlu
Zm8yX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzo4MSkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJp
bmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU1KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1h
aW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5m
bzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46IGZvbzIgKHZhcmluZm81c28uYzo3MSkKKysg
ICBieSAweC4uLi4uLi4uOiB2YXJpbmZvMl9tYWluICh2YXJpbmZvNXNvLmM6ODEpCisrICAgYnkg
MHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5jOjE1NSkKKysgICBieSAweC4u
Li4uLi4uOiBtYWluICh2YXJpbmZvNS5jOjUpCisgIExvY2F0aW9uIDB4Li4uLi4uLi4gaXMgMCBi
eXRlcyBpbnNpZGUgdmFyWzddLAorICBkZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6NjksIGluIGZy
YW1lICNYIG9mIHRocmVhZCAxCisgCisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmlu
ZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92
YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogZm9vMiAodGVzdHMvdmFyaW5mbzVz
by5jOjczKQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8yX21haW4gKHRlc3RzL3ZhcmluZm81
c28uYzo4MSkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZv
NXNvLmM6MTU1KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkK
KysgICBhdCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5IDB4Li4u
Li4uLi46IGZvbzIgKHZhcmluZm81c28uYzo3MykKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZv
Ml9tYWluICh2YXJpbmZvNXNvLmM6ODEpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFp
biAodmFyaW5mbzVzby5jOjE1NSkKKysgICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5j
OjUpCisgIExvY2F0aW9uIDB4Li4uLi4uLi4gaXMgMiBieXRlcyBpbnNpZGUgdmFyLmJhciwKKyAg
ZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5jOjcyLCBpbiBmcmFtZSAjWCBvZiB0aHJlYWQgMQorIAor
IFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QK
Ky0gICBhdCAweC4uLi4uLi4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5
IDB4Li4uLi4uLi46IGZvbzIgKHRlc3RzL3ZhcmluZm81c28uYzo3NikKKy0gICBieSAweC4uLi4u
Li4uOiB2YXJpbmZvMl9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6ODEpCistICAgYnkgMHguLi4u
Li4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NSkKKy0gICBieSAweC4u
Li4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4uLi4uLjogY3Jv
YWsgKHZhcmluZm81c28uYzoyOSkKKysgICBieSAweC4uLi4uLi4uOiBmb28yICh2YXJpbmZvNXNv
LmM6NzYpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzJfbWFpbiAodmFyaW5mbzVzby5jOjgx
KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTUpCisr
ICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAweC4uLi4u
Li4uIGlzIDEgYnl0ZSBpbnNpZGUgbG9jYWwgdmFyICJ2YXIiCisgIGRlY2xhcmVkIGF0IHZhcmlu
Zm81c28uYzo2NywgaW4gZnJhbWUgI1ggb2YgdGhyZWFkIDEKKyAKKyBVbmluaXRpYWxpc2VkIGJ5
dGUocykgZm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4uLi4u
LjogY3JvYWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiBmb28z
ICh0ZXN0cy92YXJpbmZvNXNvLmM6MTA2KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8zX21h
aW4gKHRlc3RzL3ZhcmluZm81c28uYzoxMTgpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVf
bWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NikKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0
ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHZhcmluZm81c28u
YzoyOSkKKysgICBieSAweC4uLi4uLi4uOiBmb28zICh2YXJpbmZvNXNvLmM6MTA2KQorKyAgIGJ5
IDB4Li4uLi4uLi46IHZhcmluZm8zX21haW4gKHZhcmluZm81c28uYzoxMTgpCisrICAgYnkgMHgu
Li4uLi4uLjogdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5jOjE1NikKKysgICBieSAweC4uLi4u
Li4uOiBtYWluICh2YXJpbmZvNS5jOjUpCisgIExvY2F0aW9uIDB4Li4uLi4uLi4gaXMgMCBieXRl
cyBpbnNpZGUgc3RhdGljX2dsb2JhbF9kZWZbMV0sCisgIGEgZ2xvYmFsIHZhcmlhYmxlIGRlY2xh
cmVkIGF0IHZhcmluZm81c28uYzo4NworIAorIFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBk
dXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAweC4uLi4uLi4uOiBjcm9hayAodGVz
dHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46IGZvbzMgKHRlc3RzL3Zhcmlu
Zm81c28uYzoxMDcpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzNfbWFpbiAodGVzdHMvdmFy
aW5mbzVzby5jOjExOCkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92
YXJpbmZvNXNvLmM6MTU2KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81
LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5
IDB4Li4uLi4uLi46IGZvbzMgKHZhcmluZm81c28uYzoxMDcpCisrICAgYnkgMHguLi4uLi4uLjog
dmFyaW5mbzNfbWFpbiAodmFyaW5mbzVzby5jOjExOCkKKysgICBieSAweC4uLi4uLi4uOiB2YXJp
bmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU2KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZh
cmluZm81LmM6NSkKKyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAwIGJ5dGVzIGluc2lkZSBub25z
dGF0aWNfZ2xvYmFsX2RlZlsyXSwKKyAgYSBnbG9iYWwgdmFyaWFibGUgZGVjbGFyZWQgYXQgdmFy
aW5mbzVzby5jOjg4CisgCisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGll
bnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZv
NXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogZm9vMyAodGVzdHMvdmFyaW5mbzVzby5jOjEw
OCkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvM19tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6
MTE4KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28u
YzoxNTYpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAg
IGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4u
LjogZm9vMyAodmFyaW5mbzVzby5jOjEwOCkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvM19t
YWluICh2YXJpbmZvNXNvLmM6MTE4KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4g
KHZhcmluZm81c28uYzoxNTYpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1
KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5zaWRlIHN0YXRpY19nbG9iYWxf
dW5kZWZbM10sCisgIGEgZ2xvYmFsIHZhcmlhYmxlIGRlY2xhcmVkIGF0IHZhcmluZm81c28uYzo4
OQorIAorIFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJl
cXVlc3QKKy0gICBhdCAweC4uLi4uLi4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQor
LSAgIGJ5IDB4Li4uLi4uLi46IGZvbzMgKHRlc3RzL3ZhcmluZm81c28uYzoxMDkpCistICAgYnkg
MHguLi4uLi4uLjogdmFyaW5mbzNfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjExOCkKKy0gICBi
eSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU2KQorLSAg
IGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBhdCAweC4uLi4u
Li4uOiBjcm9hayAodmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46IGZvbzMgKHZh
cmluZm81c28uYzoxMDkpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzNfbWFpbiAodmFyaW5m
bzVzby5jOjExOCkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNv
LmM6MTU2KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRp
b24gMHguLi4uLi4uLiBpcyAwIGJ5dGVzIGluc2lkZSBub25zdGF0aWNfZ2xvYmFsX3VuZGVmWzRd
LAorICBhIGdsb2JhbCB2YXJpYWJsZSBkZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6OTAKKyAKKyBV
bmluaXRpYWxpc2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0Cist
ICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAw
eC4uLi4uLi4uOiBiYXIzICh0ZXN0cy92YXJpbmZvNXNvLmM6OTQpCistICAgYnkgMHguLi4uLi4u
LjogZm9vMyAodGVzdHMvdmFyaW5mbzVzby5jOjExMCkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJp
bmZvM19tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTE4KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZh
cmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTYpCistICAgYnkgMHguLi4uLi4uLjog
bWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJp
bmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogYmFyMyAodmFyaW5mbzVzby5jOjk0KQor
KyAgIGJ5IDB4Li4uLi4uLi46IGZvbzMgKHZhcmluZm81c28uYzoxMTApCisrICAgYnkgMHguLi4u
Li4uLjogdmFyaW5mbzNfbWFpbiAodmFyaW5mbzVzby5jOjExOCkKKysgICBieSAweC4uLi4uLi4u
OiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU2KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1h
aW4gKHZhcmluZm81LmM6NSkKKyAgQWRkcmVzcyAweC4uLi4uLi4uIGlzIDUgYnl0ZXMgaW5zaWRl
IGRhdGEgc3ltYm9sICJzdGF0aWNfbG9jYWxfZGVmLlhYWFgiCisgCisgVW5pbml0aWFsaXNlZCBi
eXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4u
Li46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogYmFy
MyAodGVzdHMvdmFyaW5mbzVzby5jOjk1KQorLSAgIGJ5IDB4Li4uLi4uLi46IGZvbzMgKHRlc3Rz
L3ZhcmluZm81c28uYzoxMTApCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzNfbWFpbiAodGVz
dHMvdmFyaW5mbzVzby5jOjExOCkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh0
ZXN0cy92YXJpbmZvNXNvLmM6MTU2KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3RzL3Zh
cmluZm81LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5mbzVzby5jOjI5KQor
KyAgIGJ5IDB4Li4uLi4uLi46IGJhcjMgKHZhcmluZm81c28uYzo5NSkKKysgICBieSAweC4uLi4u
Li4uOiBmb28zICh2YXJpbmZvNXNvLmM6MTEwKQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8z
X21haW4gKHZhcmluZm81c28uYzoxMTgpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFp
biAodmFyaW5mbzVzby5jOjE1NikKKysgICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5j
OjUpCisgIExvY2F0aW9uIDB4Li4uLi4uLi4gaXMgMCBieXRlcyBpbnNpZGUgbm9uc3RhdGljX2xv
Y2FsX2RlZls2XSwKKyAgZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5jOjEwMywgaW4gZnJhbWUgI1gg
b2YgdGhyZWFkIDEKKyAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNsaWVu
dCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHRlc3RzL3ZhcmluZm81
c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiBiYXIzICh0ZXN0cy92YXJpbmZvNXNvLmM6OTYp
CistICAgYnkgMHguLi4uLi4uLjogZm9vMyAodGVzdHMvdmFyaW5mbzVzby5jOjExMCkKKy0gICBi
eSAweC4uLi4uLi4uOiB2YXJpbmZvM19tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTE4KQorLSAg
IGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTYpCist
ICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4u
Li4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogYmFyMyAo
dmFyaW5mbzVzby5jOjk2KQorKyAgIGJ5IDB4Li4uLi4uLi46IGZvbzMgKHZhcmluZm81c28uYzox
MTApCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzNfbWFpbiAodmFyaW5mbzVzby5jOjExOCkK
KysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU2KQorKyAg
IGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81LmM6NSkKKyAgQWRkcmVzcyAweC4uLi4uLi4u
IGlzIDcgYnl0ZXMgaW5zaWRlIGRhdGEgc3ltYm9sICJzdGF0aWNfbG9jYWxfdW5kZWYuWFhYWCIK
KyAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1
ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0g
ICBieSAweC4uLi4uLi4uOiBiYXIzICh0ZXN0cy92YXJpbmZvNXNvLmM6OTcpCistICAgYnkgMHgu
Li4uLi4uLjogZm9vMyAodGVzdHMvdmFyaW5mbzVzby5jOjExMCkKKy0gICBieSAweC4uLi4uLi4u
OiB2YXJpbmZvM19tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTE4KQorLSAgIGJ5IDB4Li4uLi4u
Li46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTYpCistICAgYnkgMHguLi4u
Li4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2Fr
ICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogYmFyMyAodmFyaW5mbzVzby5j
Ojk3KQorKyAgIGJ5IDB4Li4uLi4uLi46IGZvbzMgKHZhcmluZm81c28uYzoxMTApCisrICAgYnkg
MHguLi4uLi4uLjogdmFyaW5mbzNfbWFpbiAodmFyaW5mbzVzby5jOjExOCkKKysgICBieSAweC4u
Li4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU2KQorKyAgIGJ5IDB4Li4uLi4u
Li46IG1haW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAwIGJ5dGVz
IGluc2lkZSBub25zdGF0aWNfbG9jYWxfdW5kZWZbOF0sCisgIGRlY2xhcmVkIGF0IHZhcmluZm81
c28uYzoxMDUsIGluIGZyYW1lICNYIG9mIHRocmVhZCAxCisgCisgVW5pbml0aWFsaXNlZCBieXRl
KHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4uLi46
IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogYmxhaDQg
KHRlc3RzL3ZhcmluZm81c28uYzoxMzcpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzRfbWFp
biAodGVzdHMvdmFyaW5mbzVzby5jOjE0NikKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9t
YWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU3KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHRl
c3RzL3ZhcmluZm81LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5mbzVzby5j
OjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46IGJsYWg0ICh2YXJpbmZvNXNvLmM6MTM3KQorKyAgIGJ5
IDB4Li4uLi4uLi46IHZhcmluZm80X21haW4gKHZhcmluZm81c28uYzoxNDYpCisrICAgYnkgMHgu
Li4uLi4uLjogdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5jOjE1NykKKysgICBieSAweC4uLi4u
Li4uOiBtYWluICh2YXJpbmZvNS5jOjUpCisgIExvY2F0aW9uIDB4Li4uLi4uLi4gaXMgMSBieXRl
IGluc2lkZSBhWzNdLnh5enp5WzIxXS5jMSwKKyAgZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5jOjEz
NSwgaW4gZnJhbWUgI1ggb2YgdGhyZWFkIDEKKyAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykgZm91
bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3JvYWsg
KHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiBibGFoNCAodGVzdHMv
dmFyaW5mbzVzby5jOjEzOCkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNF9tYWluICh0ZXN0
cy92YXJpbmZvNXNvLmM6MTQ2KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRl
c3RzL3ZhcmluZm81c28uYzoxNTcpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFy
aW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisr
ICAgYnkgMHguLi4uLi4uLjogYmxhaDQgKHZhcmluZm81c28uYzoxMzgpCisrICAgYnkgMHguLi4u
Li4uLjogdmFyaW5mbzRfbWFpbiAodmFyaW5mbzVzby5jOjE0NikKKysgICBieSAweC4uLi4uLi4u
OiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU3KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1h
aW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAwIGJ5dGVzIGluc2lk
ZSBhWzVdLmJvbmcsCisgIGRlY2xhcmVkIGF0IHZhcmluZm81c28uYzoxMzUsIGluIGZyYW1lICNY
IG9mIHRocmVhZCAxCisgCisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGll
bnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZv
NXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogYmxhaDQgKHRlc3RzL3ZhcmluZm81c28uYzox
MzkpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzRfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5j
OjE0NikKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNv
LmM6MTU3KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysg
ICBhdCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4u
Li46IGJsYWg0ICh2YXJpbmZvNXNvLmM6MTM5KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm80
X21haW4gKHZhcmluZm81c28uYzoxNDYpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFp
biAodmFyaW5mbzVzby5jOjE1NykKKysgICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5j
OjUpCisgIExvY2F0aW9uIDB4Li4uLi4uLi4gaXMgMSBieXRlIGluc2lkZSBhWzNdLnh5enp5WzIx
XS5jMlsyXSwKKyAgZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5jOjEzNSwgaW4gZnJhbWUgI1ggb2Yg
dGhyZWFkIDEKKyAKKyBhbnN3ZXIgaXMgMAorIFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBk
dXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAweC4uLi4uLi4uOiBjcm9hayAodGVz
dHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46IGZ1bl9jICh0ZXN0cy92YXJp
bmZvNXNvLmM6MTY0KQorLSAgIGJ5IDB4Li4uLi4uLi46IGZ1bl9iICh0ZXN0cy92YXJpbmZvNXNv
LmM6MTY4KQorLSAgIGJ5IDB4Li4uLi4uLi46IGZ1bl9hICh0ZXN0cy92YXJpbmZvNXNvLmM6MTcy
KQorLSAgIGJ5IDB4Li4uLi4uLi46IGlubGluZXRlc3QgKHRlc3RzL3ZhcmluZm81c28uYzoxNzgp
CistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1
OCkKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQg
MHguLi4uLi4uLjogY3JvYWsgKHZhcmluZm81c28uYzoyOSkKKysgICBieSAweC4uLi4uLi4uOiBm
dW5fYyAodmFyaW5mbzVzby5jOjE2NCkKKysgICBieSAweC4uLi4uLi4uOiBmdW5fYiAodmFyaW5m
bzVzby5jOjE2OCkKKysgICBieSAweC4uLi4uLi4uOiBmdW5fYSAodmFyaW5mbzVzby5jOjE3MikK
KysgICBieSAweC4uLi4uLi4uOiBpbmxpbmV0ZXN0ICh2YXJpbmZvNXNvLmM6MTc4KQorKyAgIGJ5
IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTgpCisrICAgYnkgMHgu
Li4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBBZGRyZXNzIDB4Li4uLi4uLi4gaXMgb24g
dGhyZWFkIDEncyBzdGFjaworICBpbiBmcmFtZSAjWCwgY3JlYXRlZCBieSB2YXJpbmZvNV9tYWlu
ICh2YXJpbmZvNXNvLmM6MTUzKQorIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3ZhbGdyaW5kL3ZhbGdyaW5kL0FkZGVkLXN1cHBvcnQtZm9yLVBQQy1pbnN0cnVjdGlvbnMtbWZh
dGJ1LW1mYXRibC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmlu
ZC9BZGRlZC1zdXBwb3J0LWZvci1QUEMtaW5zdHJ1Y3Rpb25zLW1mYXRidS1tZmF0YmwucGF0Y2gK
aW5kZXggNTFjZDM1MzJkMy4uYjcwMzhjMmMzYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL0FkZGVkLXN1cHBvcnQtZm9yLVBQQy1pbnN0cnVjdGlv
bnMtbWZhdGJ1LW1mYXRibC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3Jp
bmQvdmFsZ3JpbmQvQWRkZWQtc3VwcG9ydC1mb3ItUFBDLWluc3RydWN0aW9ucy1tZmF0YnUtbWZh
dGJsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwYmY0YjBhYzE4ZDFlYTQxYjMyYWQ3ODFk
MjE0YjI5NWNhMTk5OGYzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0OTZiNzQyMDYx
MDY1NTNlY2I2YjYwMzAxOWMzOTg5MzQ3ZjMzZDdhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQW5lZXNoIEJhbnNhbCA8YW5lZXNoLmJhbnNhbEBmcmVlc2NhbGUuY29tPgogRGF0ZTog
TW9uLCAyMSBOb3YgMjAxMSAxNzozMTozOSArMDUzMAogU3ViamVjdDogW1BBVENIXSBBZGRlZCBz
dXBwb3J0IGZvciBQUEMgaW5zdHJ1Y3Rpb25zIG1mYXRidSwgbWZhdGJsLgpAQCAtMTAsMTggKzEw
LDE4IEBAIGRpc0luc3RyKHBwYyk6IHVuaGFuZGxlZCBpbnN0cnVjdGlvbjogMHg3QzBGODJBNgog
VXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vYnVncy5rZGUub3JnL3Nob3dfYnVn
LmNnaT9pZD0yODk4MzZdCiAKIFNpZ25lZC1vZmYtYnk6IEFuZWVzaCBCYW5zYWwgPGFuZWVzaC5i
YW5zYWxAZnJlZXNjYWxlLmNvbT4KLS0tLQogCi0gVkVYL3ByaXYvZ3Vlc3RfcHBjX2RlZnMuaCAg
ICB8ICAgIDIgKysKLSBWRVgvcHJpdi9ndWVzdF9wcGNfaGVscGVycy5jIHwgICAxOCArKysrKysr
KysrKysrKysrKysKLSBWRVgvcHJpdi9ndWVzdF9wcGNfdG9JUi5jICAgIHwgICAyMiArKysrKysr
KysrKysrKysrKysrKysrCi0gMyBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAwIGRl
bGV0aW9ucygtKQorLS0tCisgVkVYL3ByaXYvZ3Vlc3RfcHBjX2RlZnMuaCAgICB8ICAyICsrCisg
VkVYL3ByaXYvZ3Vlc3RfcHBjX2hlbHBlcnMuYyB8IDE4ICsrKysrKysrKysrKysrKysrKworIFZF
WC9wcml2L2d1ZXN0X3BwY190b0lSLmMgICAgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCisg
MyBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9WRVgvcHJp
di9ndWVzdF9wcGNfZGVmcy5oIGIvVkVYL3ByaXYvZ3Vlc3RfcHBjX2RlZnMuaAotaW5kZXggZGQz
YzYyZS4uMTFhMzRhYSAxMDA2NDQKK2luZGV4IDIyMGZiZjEuLmNkMjU5ZjMgMTAwNjQ0CiAtLS0g
YS9WRVgvcHJpdi9ndWVzdF9wcGNfZGVmcy5oCiArKysgYi9WRVgvcHJpdi9ndWVzdF9wcGNfZGVm
cy5oCi1AQCAtMTQ2LDYgKzE0Niw4IEBAIGV4dGVybiBVSW50IHBwYzMyZ19kaXJ0eWhlbHBlcl9N
RlNQUl8yNjhfMjY5ICggVUludCApOworQEAgLTIzMyw2ICsyMzMsOCBAQCBleHRlcm4gVUludCBw
cGMzMmdfZGlydHloZWxwZXJfTUZTUFJfMjY4XzI2OSAoIFVJbnQgKTsKICAKICBleHRlcm4gVUlu
dCBwcGMzMmdfZGlydHloZWxwZXJfTUZTUFJfMjg3ICggdm9pZCApOwogIApAQCAtMzEsMTAgKzMx
LDEwIEBAIGluZGV4IGRkM2M2MmUuLjExYTM0YWEgMTAwNjQ0CiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFVJbnQgdkRfaWR4LCBVSW50IHNoLAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBVSW50IHNoaWZ0X3JpZ2h0ICk7CiBkaWZmIC0tZ2l0IGEv
VkVYL3ByaXYvZ3Vlc3RfcHBjX2hlbHBlcnMuYyBiL1ZFWC9wcml2L2d1ZXN0X3BwY19oZWxwZXJz
LmMKLWluZGV4IDExYWE0MjguLmI0OWVhM2YgMTAwNjQ0CitpbmRleCAyNjExZTUyLi43MmMzNDli
IDEwMDY0NAogLS0tIGEvVkVYL3ByaXYvZ3Vlc3RfcHBjX2hlbHBlcnMuYwogKysrIGIvVkVYL3By
aXYvZ3Vlc3RfcHBjX2hlbHBlcnMuYwotQEAgLTExOSw2ICsxMTksMjQgQEAgVUludCBwcGMzMmdf
ZGlydHloZWxwZXJfTUZTUFJfMjg3ICggdm9pZCApCitAQCAtMTE4LDYgKzExOCwyNCBAQCBVSW50
IHBwYzMyZ19kaXJ0eWhlbHBlcl9NRlNQUl8yODcgKCB2b2lkICkKICAjICBlbmRpZgogIH0KICAK
QEAgLTYwLDEwICs2MCwxMCBAQCBpbmRleCAxMWFhNDI4Li5iNDllYTNmIDEwMDY0NAogIC8qIENB
TExFRCBGUk9NIEdFTkVSQVRFRCBDT0RFICovCiAgLyogRElSVFkgSEVMUEVSIChyZWFkcyBndWVz
dCBzdGF0ZSwgd3JpdGVzIGd1ZXN0IG1lbSkgKi8KIGRpZmYgLS1naXQgYS9WRVgvcHJpdi9ndWVz
dF9wcGNfdG9JUi5jIGIvVkVYL3ByaXYvZ3Vlc3RfcHBjX3RvSVIuYwotaW5kZXggZjhkMjIwZC4u
MzdjODk3NCAxMDA2NDQKK2luZGV4IGQwNWNjZTMuLjcyM2UwNmEgMTAwNjQ0CiAtLS0gYS9WRVgv
cHJpdi9ndWVzdF9wcGNfdG9JUi5jCiArKysgYi9WRVgvcHJpdi9ndWVzdF9wcGNfdG9JUi5jCi1A
QCAtNTY1Nyw2ICs1NjU3LDI4IEBAIHN0YXRpYyBCb29sIGRpc19wcm9jX2N0bCAoIFZleEFiaUlu
Zm8qIHZiaSwgVUludCB0aGVJbnN0ciApCitAQCAtMTE4NzUsNiArMTE4NzUsMjggQEAgc3RhdGlj
IEJvb2wgZGlzX3Byb2NfY3RsICggY29uc3QgVmV4QWJpSW5mbyogdmJpLCBVSW50IHByZWZpeCwg
VUludCB0aGVJbnN0ciApCiAgICAgICAgICAgYnJlYWs7CiAgICAgICAgfQogIApAQCAtOTIsNSAr
OTIsMyBAQCBpbmRleCBmOGQyMjBkLi4zN2M4OTc0IDEwMDY0NAogICAgICAgIGRlZmF1bHQ6CiAg
ICAgICAgICAgdmV4X3ByaW50ZigiZGlzX3Byb2NfY3RsKHBwYykobWZzcHIsU1BSKSgweCV4KVxu
IiwgU1BSKTsKICAgICAgICAgICByZXR1cm4gRmFsc2U7Ci0tLSAKLTEuNy4wLjQKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC9hdm9pZC1uZW9uLWZv
ci10YXJnZXRzLXdoaWNoLWRvbi10LXN1cHBvcnQtaXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvYXZvaWQtbmVvbi1mb3ItdGFyZ2V0cy13aGljaC1kb24t
dC1zdXBwb3J0LWl0LnBhdGNoCmluZGV4IDgyYjgzNDQyNzkuLjRiOTAwMmI0NDUgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC9hdm9pZC1uZW9uLWZv
ci10YXJnZXRzLXdoaWNoLWRvbi10LXN1cHBvcnQtaXQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL2F2b2lkLW5lb24tZm9yLXRhcmdldHMtd2hpY2gt
ZG9uLXQtc3VwcG9ydC1pdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGZhY2MyOWMzYzU2
ZTZjZjljZmVmNzA5ODZjZjczODc2MDQ0YTNmYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNzYwMjVlMzJjYjdjOTYwNTI0M2IwOGQ0YmE1OTc4ZjBiZjNmNjhiNiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+CiBE
YXRlOiBUdWUsIDE5IEphbiAyMDE2IDE2OjQyOjM2IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGF2
b2lkIG5lb24gZm9yIHRhcmdldHMgd2hpY2ggZG9uJ3Qgc3VwcG9ydCBpdApAQCAtMTEsNiArMTEs
NyBAQCBzdXBwb3J0IG5lb24uCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9i
dWdzLmtkZS5vcmcvc2hvd19idWcuY2dpP2lkPTQ1NDM0Nl0KIAogU2lnbmVkLW9mZi1ieTogQW5k
cmUgTWNDdXJkeSA8YXJtY2N1cmR5QGdtYWlsLmNvbT4KKwogLS0tCiAgbWVtY2hlY2svdGVzdHMv
c2gtbWVtLXJhbmRvbS5jIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQpAQCAtMjgsNiArMjksMyBAQCBpbmRleCBhZTgyMjQ4Li44MTZlMTM5IDEw
MDY0NAogICAgICAgICAgICAgIC8qIE9uIGFybTMyLCBtYW55IGNvbXBpbGVycyBnZW5lcmF0ZSBh
IDY0LWJpdCBmbG9hdCBtb3ZlCiAgICAgICAgICAgICAgICAgdXNpbmcgdHdvIDMyIGJpdCBpbnRl
Z2VyIHJlZ2lzdGVycywgd2hpY2ggY29tcGxldGVseQogICAgICAgICAgICAgICAgIGRlZmVhdHMg
dGhpcyB0ZXN0LiAgSGVuY2UgZm9yY2UgYSA2NC1iaXQgTkVPTiBsb2FkIGFuZAotLS0gCi0xLjku
MQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQv
Zml4ZWQtcGVybC1wYXRoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3Zh
bGdyaW5kL2ZpeGVkLXBlcmwtcGF0aC5wYXRjaAppbmRleCBiOTgwNGU3NDUxLi42NTc2YjkyYmFm
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvZml4
ZWQtcGVybC1wYXRoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92
YWxncmluZC9maXhlZC1wZXJsLXBhdGgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGJlYWE1
YjY0YzYwZDUwMWZhOWNkNTlmZGM1NjNlNWY1YmNjZjY4ODIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGU0MzUzMTE0NDkwYmRmNDhmNmU4MzBkZGZjODVkMjIxMDZkYjg4NjIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBRaW5nIEhlIDxxaW5nLmhlQGludGVsLmNvbT4KIERh
dGU6IFR1ZSwgMzEgQXVnIDIwMTAgMjI6NTE6NTggKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdmFs
Z3JpbmQ6IGZpeCBwZXJsIHNjcmlwdHMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxncmluZC92YWxncmluZC9zMzkweF92ZWNfb3BfdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy92YWxncmluZC92YWxncmluZC9zMzkweF92ZWNfb3BfdC5wYXRjaAppbmRleCBiZGUx
MjQxZGM3Li44ZmVjNzQyZjlkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFs
Z3JpbmQvdmFsZ3JpbmQvczM5MHhfdmVjX29wX3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3MzOTB4X3ZlY19vcF90LnBhdGNoCkBAIC0xLDcgKzEs
NyBAQAotRnJvbSA4MTU0ZDM4YmFjNWNkYjM2NzVjZmRhZjU2MmFiOWRhMDE5ODhiMjYzIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1NmI2MjlkYTQzZmI0MmQ0ZGM5OGVhOTI4MWI3ZTRi
OTYwMDM5YzQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogWWkgRmFuIFl1IDx5aWZh
bi55dUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAxNyBNYXIgMjAyMSAxMjoxNjozMSAtMDQw
MAotU3ViamVjdDogW1BBVENIIDE5LzIwXSByZW1vdmUgczM5MHhfdmVjX29wX3QKK1N1YmplY3Q6
IFtQQVRDSF0gcmVtb3ZlIHMzOTB4X3ZlY19vcF90CiAKIHMzOTB4X3ZlY19vcF90IGlzIG5vdCBu
ZWVkZWQgYW55d2hlcmUsIG9ubHkgZWxlbWVudHMgb2YgZW51bSBhcmUgYWNjZXNzZWQKIHJlbW92
aW5nIGl0IGVuc3VyZXMgdGhhdCB2YWxncmluZCBjYW4gYmUgYnVpbHQgd2l0aCAtZm5vLWNvbW1v
biBvcHRpb24KQEAgLTEzLDE1ICsxMywxNiBAQCBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIFNp
Z25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAKIFNpZ25lZC1vZmYt
Ynk6IFlpIEZhbiBZdSA8eWlmYW4ueXVAd2luZHJpdmVyLmNvbT4KKwogLS0tCiAgVkVYL3ByaXYv
Z3Vlc3RfczM5MF9kZWZzLmggfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9WRVgvcHJpdi9ndWVzdF9zMzkwX2RlZnMu
aCBiL1ZFWC9wcml2L2d1ZXN0X3MzOTBfZGVmcy5oCi1pbmRleCA5MDU0MjkwLi5kYWI4MDAyIDEw
MDY0NAoraW5kZXggMjRmMzc5OC4uN2I4YmU3OCAxMDA2NDQKIC0tLSBhL1ZFWC9wcml2L2d1ZXN0
X3MzOTBfZGVmcy5oCiArKysgYi9WRVgvcHJpdi9ndWVzdF9zMzkwX2RlZnMuaAotQEAgLTI4NCw3
ICsyODQsNyBAQCB0eXBlZGVmIGVudW0geworQEAgLTI3OSw3ICsyNzksNyBAQCB0eXBlZGVmIGVu
dW0gewogICAgIFMzOTBfVkVDX09QX1ZCUEVSTSwKICAgICBTMzkwX1ZFQ19PUF9WTVNMLAogICAg
IFMzOTBfVkVDX09QX0xBU1QgICAgICAgICAgICAgLy8gc3VwcG9zZWQgdG8gYmUgdGhlIGxhc3Qg
ZWxlbWVudCBpbiBlbnVtCkBAIC0zMCw2ICszMSwzIEBAIGluZGV4IDkwNTQyOTAuLmRhYjgwMDIg
MTAwNjQ0CiAgCiAgLyogQXJndW1lbnRzIG9mIHMzOTB4X2RpcnR5aGVscGVyX3ZlY19vcCguLi4p
IHdoaWNoIGFyZSBwYWNrZWQgaW50byBvbmUKICAgICBVTG9uZyB2YXJpYWJsZS4KLS0tIAotMi4y
OS4yCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmlu
ZC91c2UtYXBwcm9wcmlhdGUtbWFyY2gtbWNwdS1tZnB1LWZvci1BUk0tdGVzdC1hcHBzLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3VzZS1hcHByb3ByaWF0
ZS1tYXJjaC1tY3B1LW1mcHUtZm9yLUFSTS10ZXN0LWFwcHMucGF0Y2gKaW5kZXggZjE1ZDA0YjE3
My4uNjM0ZmJiZDc2ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5k
L3ZhbGdyaW5kL3VzZS1hcHByb3ByaWF0ZS1tYXJjaC1tY3B1LW1mcHUtZm9yLUFSTS10ZXN0LWFw
cHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3Vz
ZS1hcHByb3ByaWF0ZS1tYXJjaC1tY3B1LW1mcHUtZm9yLUFSTS10ZXN0LWFwcHMucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGQxMzRkYWZjMmYxMWUwZDI0NzQyMGEwYmEzNjBiY2RlZjc3YjQw
OTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDMyMWM1YmM4YWQyYTQ4MWVjODM5Yjg3
ODZmZTgzNjRhMzk5NDFjMjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZSBN
Y0N1cmR5IDxhcm1jY3VyZHlAZ21haWwuY29tPgogRGF0ZTogVHVlLCAxOSBKYW4gMjAxNiAxNjow
MDowMCAtMDgwMAogU3ViamVjdDogW1BBVENIXSB1c2UgYXBwcm9wcmlhdGUgLW1hcmNoLy1tY3B1
Ly1tZnB1IGZvciBBUk0gdGVzdCBhcHBzCkBAIC0xOCwxNSArMTgsMTYgQEAgU2VlIHNpbWlsYXIg
Y2FzZXMgaW4gbm9uZS90ZXN0cy9hcm0vTWFrZWZpbGUuYW0KIFVwc3RyZWFtLVN0YXR1czogU3Vi
bWl0dGVkIFtodHRwczovL2J1Z3Mua2RlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NDU0MzQ2XQogCiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZSBNY0N1cmR5IDxhcm1jY3VyZHlAZ21haWwuY29tPgorCiAtLS0K
ICBub25lL3Rlc3RzL2FybS9NYWtlZmlsZS5hbSB8IDYgKysrKy0tCiAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL25vbmUvdGVz
dHMvYXJtL01ha2VmaWxlLmFtIGIvbm9uZS90ZXN0cy9hcm0vTWFrZWZpbGUuYW0KLWluZGV4IDQ1
MDdhMjAuLjgyNTI5MGYgMTAwNjQ0CitpbmRleCA0Nzc2ZWE3Li5iMzM3ZDc3IDEwMDY0NAogLS0t
IGEvbm9uZS90ZXN0cy9hcm0vTWFrZWZpbGUuYW0KICsrKyBiL25vbmUvdGVzdHMvYXJtL01ha2Vm
aWxlLmFtCi1AQCAtNjIsOCArNjIsMTAgQEAgbmVvbjY0X0NGTEFHUyAgICAgPSAkKEFNX0NGTEFH
UykgLWcgLU8wIC1tY3B1PWNvcnRleC1hOCBcCitAQCAtODUsOCArODUsMTAgQEAgbmVvbjY0X0NG
TEFHUyAgICAgPSAkKEFNX0NGTEFHUykgLWcgLU8wIC1tY3B1PWNvcnRleC1hOCBcCiAgCQkJLW1m
cHU9bmVvbiBcCiAgCQkJLW10aHVtYgogIApAQCAtMzksNiArNDAsMyBAQCBpbmRleCA0NTA3YTIw
Li44MjUyOTBmIDEwMDY0NAogK3ZjdnRfZml4ZWRfZmxvYXRfVkZQX0NGTEFHUyA9ICQoQU1fQ0ZM
QUdTKSAtZyAtbWNwdT1jb3J0ZXgtYTggLW1mcHU9dmZwdjMKICsKICt2ZnB2NF9mbWFfQ0ZMQUdT
ICA9ICQoQU1fQ0ZMQUdTKSAtZyAtTzAgLW1hcmNoPWFybXY3dmUgLW1jcHU9Y29ydGV4LWExNSAt
bWZwdT12ZnB2NCAtbWFybQotLS0gCi0xLjkuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvdmFsZ3JpbmQtbWFrZS1sZC1YWFguc28tc3RybGVu
LWludGVyY2VwdC1vcHRpb25hbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmlu
ZC92YWxncmluZC92YWxncmluZC1tYWtlLWxkLVhYWC5zby1zdHJsZW4taW50ZXJjZXB0LW9wdGlv
bmFsLnBhdGNoCmluZGV4IGQwNDI5N2RjYTguLmFlZWYwYmRhNjEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC92YWxncmluZC1tYWtlLWxkLVhYWC5z
by1zdHJsZW4taW50ZXJjZXB0LW9wdGlvbmFsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy92YWxncmluZC92YWxncmluZC92YWxncmluZC1tYWtlLWxkLVhYWC5zby1zdHJsZW4taW50
ZXJjZXB0LW9wdGlvbmFsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMDViZDExODA5YTFj
ZTY1ZTlmMmMyOGU4ODQzNTRhNDc0MTY1MGI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBmNTk5MTlkZTkwMWNiZmM2NWUwY2UyNGM4MTY2NWYwODE0OGJjMmI2IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQW5kcmUgTWNDdXJkeSA8YXJtY2N1cmR5QGdtYWlsLmNvbT4KIERh
dGU6IFR1ZSwgMTMgRGVjIDIwMTYgMTE6Mjk6NTUgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gbWFr
ZSBsZC1YWFguc28gc3RybGVuIGludGVyY2VwdCBvcHRpb25hbApAQCAtMTIsMTUgKzEyLDE2IEBA
IFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZQogCiBTaWduZWQtb2ZmLWJ5OiBBbmRyZSBN
Y0N1cmR5IDxhcm1jY3VyZHlAZ21haWwuY29tPgogU2lnbmVkLW9mZi1ieTogSmFja2llIEh1YW5n
IDxqYWNraWUuaHVhbmdAd2luZHJpdmVyLmNvbT4KKwogLS0tCiAgY29yZWdyaW5kL21fcmVkaXIu
YyB8IDEzICsrKysrKysrKysrKy0KICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29yZWdyaW5kL21fcmVkaXIuYyBiL2NvcmVn
cmluZC9tX3JlZGlyLmMKLWluZGV4IGZmMzUwMDkuLmQ3ZDY4MTYgMTAwNjQ0CitpbmRleCBjZWYy
NDFiLi4wYTdkYzVmIDEwMDY0NAogLS0tIGEvY29yZWdyaW5kL21fcmVkaXIuYwogKysrIGIvY29y
ZWdyaW5kL21fcmVkaXIuYwotQEAgLTEyNzUsNyArMTI3NSwxOCBAQCBzdGF0aWMgdm9pZCBhZGRf
aGFyZHdpcmVkX3NwZWMgKGNvbnN0ICBIQ2hhciogc29wYXR0LCBjb25zdCBIQ2hhciogZm5wYXR0
LAorQEAgLTEzMDcsNyArMTMwNywxOCBAQCBzdGF0aWMgdm9pZCBhZGRfaGFyZHdpcmVkX3NwZWMg
KGNvbnN0ICBIQ2hhciogc29wYXR0LCBjb25zdCBIQ2hhciogZm5wYXR0LAogICAgIHNwZWMtPnRv
X2FkZHIgICAgID0gdG9fYWRkcjsKICAgICBzcGVjLT5pc1dyYXAgICAgICA9IEZhbHNlOwogICAg
IHNwZWMtPmlzR2xvYmFsICAgID0gRmFsc2U7CkBAIC00MCw2ICs0MSwzIEBAIGluZGV4IGZmMzUw
MDkuLmQ3ZDY4MTYgMTAwNjQ0CiAgICAgLyogVkFSSUFCTEUgUEFSVFMgKi8KICAgICBzcGVjLT5t
YXJrICAgICAgICA9IEZhbHNlOyAvKiBub3Qgc2lnbmlmaWNhbnQgKi8KICAgICBzcGVjLT5kb25l
ICAgICAgICA9IEZhbHNlOyAvKiBub3Qgc2lnbmlmaWNhbnQgKi8KLS0tIAotMS45LjEKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kXzMuMjEuMC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZF8zLjIyLjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdy
aW5kL3ZhbGdyaW5kXzMuMjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGdyaW5kL3ZhbGdyaW5kXzMuMjIuMC5iYgppbmRleCA2N2ExOTdjNTA5Li42MTJiZWMxOTBiIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmRfMy4yMS4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZF8zLjIyLjAu
YmIKQEAgLTM2LDkgKzM2LDkgQEAgU1JDX1VSSSA9ICJodHRwczovL3NvdXJjZXdhcmUub3JnL3B1
Yi92YWxncmluZC92YWxncmluZC0ke1BWfS50YXIuYnoyIFwKICAgICAgICAgICAgZmlsZTovLzAw
MDEtbm9uZS10ZXN0cy1mZGxlYWtfY21zZy5zdGRlcnIuZXhwLWFkanVzdC10bXAtcGF0aHMucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1tZW1jaGVjay10ZXN0cy1GaXgtdGltZXJmZC1z
eXNjYWxsLXRlc3QucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1kb2NzLURpc2FibGUt
bWFudWFsLXZhbGlkYXRpb24ucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1ub25lLXRl
c3RzLXg4Ni1saW51eC1zZWdfb3ZlcnJpZGUuYy1hZGQtbWlzc2luZy1pbmNsLnBhdGNoIFwKKyAg
ICAgICAgICAgZmlsZTovLzAwMjAtQ29tbWl0dGluZy1jaGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0
Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTBjZTE2MThiYjNlMzNm
YWQxNmViNzk1NTJiMGEzZTEyMTE3NjI0NDhhMGQ3ZmNlMTFjOGE2MjQzYjlhYzk3MSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJjODExZGI1YWRkMmM1ZjcyOTk0NGNhZjQ3YzRlN2E2NWRjYWFiYjk0
NjFlNDcyYjU3ODc2NWRkN2JmNmQyZDRjIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAidmFsZ3Jp
bmQtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKIENPTVBBVElCTEVfSE9TVCA9ICcoaS44
Nnx4ODZfNjR8YXJtfGFhcmNoNjR8bWlwc3xwb3dlcnBjfHBvd2VycGM2NCkuKi1saW51eCcKLS0g
CjIuNDIuMAoK

--===============7787699440145918052==--

