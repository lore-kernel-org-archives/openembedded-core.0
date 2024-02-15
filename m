Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C0FC54EBA
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:37 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.20334.1708018345349632608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fny0ywF+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=q8DgP1sI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018dadd3a58d-697c7f8b-86c0-4b86-ac92-5f56dc715b2c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TObjMKdTYk7uCgLQ/rvNFTaS/IxwOy6veRuu8GjcYa4=;
	b=fny0ywF+5aorN4246qQNL1DmOV1tvlGrnYxUGCVXvr1IcXxqGSoHh3oIaqCBtQNk
	ae2CmBGEPnEYotiLqQIaCLzztZz0j9l6hbdV2MK39FhxRPcxN+ocfxncySxH0JziO5s
	YEWxHB9ys9eqtWR5kcBc0Vq+BSiK/jaYv62t4RsE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018345;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TObjMKdTYk7uCgLQ/rvNFTaS/IxwOy6veRuu8GjcYa4=;
	b=q8DgP1sIutinVkv3VCOAIsQ+hrBWWkKwnPMLbIR8GIDSn2S1nrl/qOXR23MVg0xi
	1N/5lCoNXLYHznvXMwRJwoEnQI887U5kZUlcN3elHYr66hDV/ZGN9W0z0fzKjr93/XF
	WrK+MoSzUkd+NFfVoRAi3RmqUoZj61U2nNVJkL9Q=
Content-Type: multipart/mixed; boundary="===============3103970665179177515=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] valgrind: upgrading to 3.22.0 FAILED
Message-ID: <0101018dadd3a58d-697c7f8b-86c0-4b86-ac92-5f56dc715b2c-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195604

--===============3103970665179177515==
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
From 1d6ffc30eaba8929b1f1ec2a7b828b9b1cd2f6bf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 11:30:09 +0000
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
index 8d2ca5733e..04acfba508 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch
@@ -1,4 +1,4 @@
-From 2155c1b2cf00e744e280c493eb74bf457dfcc3b1 Mon Sep 17 00:00:00 2001
+From 5240aa8b254f18661ee0f0093cf215adef27005f Mon Sep 17 00:00:00 2001
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
index e7af5efecc..6af7ed6601 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Return-a-valid-exit_code-from-vg_regtest.patch
@@ -1,4 +1,4 @@
-From 5eebdefd2251803e7d21081745018fcb16b2ba71 Mon Sep 17 00:00:00 2001
+From 80b3cb0e385de435463923005cf8f09167597ac5 Mon Sep 17 00:00:00 2001
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
index 256ddb0c34..bd00d43dd6 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
@@ -1,4 +1,4 @@
-From 99fc6fe9b66becac3c94068129e84217330a71a6 Mon Sep 17 00:00:00 2001
+From 8c22eb74a0b5f27259eb88386e254cb2c16af7ee Mon Sep 17 00:00:00 2001
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
index 39b624d9f6..76299221c0 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-supported-on-mips32-linux.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-supported-on-mips32-linux.patch
@@ -1,7 +1,7 @@
-From fb5362f205b37c5060fcd764a7ed393abe4f2f3d Mon Sep 17 00:00:00 2001
+From a53c5be7aa19450dca64f09676cba9579d0e971b Mon Sep 17 00:00:00 2001
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
index 073713c139..bc2f7ae8c8 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
@@ -1,4 +1,4 @@
-From 715cf122388f3527afa5649cebf9f1522c240693 Mon Sep 17 00:00:00 2001
+From fd8447a92ff361724e728738f2883d7ef0f6bd90 Mon Sep 17 00:00:00 2001
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
index 15fbbe954f..3a0a1f3593 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
@@ -1,4 +1,4 @@
-From 5d411fd147d652e9d7bb259f4048693c6e4742aa Mon Sep 17 00:00:00 2001
+From 69fc147782b1f5938b2a4598306f97bff793df31 Mon Sep 17 00:00:00 2001
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
index dce8b52ba3..6ed9813fb2 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
@@ -1,4 +1,4 @@
-From 3ff82dcb844f98dbf67c69f11f6516bc234725a9 Mon Sep 17 00:00:00 2001
+From e688dd81781986ad073bf1eececeb4e823853e56 Mon Sep 17 00:00:00 2001
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
index e421ac6c80..fe5b65f4e3 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
@@ -1,4 +1,4 @@
-From f405297d3382cd98391d02f397e2387da1f42879 Mon Sep 17 00:00:00 2001
+From e989bf178f074d0844d5d11350da41d0995c66ec Mon Sep 17 00:00:00 2001
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
index 27366153f7..31eb4a72f4 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
@@ -1,17 +1,18 @@
-From 64ad2744acfb4fa40b1c114633a053f87125a203 Mon Sep 17 00:00:00 2001
+From 0af2ba558d19d867c209b64879a3a58335deae09 Mon Sep 17 00:00:00 2001
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
index bf0f0ded21..32f5fb22a5 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
@@ -1,7 +1,7 @@
-From d1dea3c2bcf1e22baab39e2c0b8ca59db8a5bc37 Mon Sep 17 00:00:00 2001
+From 0efc530ba7d0d38834b29ef6c7d049c26161c84d Mon Sep 17 00:00:00 2001
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
index 7f0e38cb95..6fb7d55011 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
@@ -1,4 +1,4 @@
-From 26c104adf6c5162572b7aa2fac89d0835b7f8f0b Mon Sep 17 00:00:00 2001
+From cb65496596e3c8ad86131f3254709123a9834fba Mon Sep 17 00:00:00 2001
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
index c2965c40df..f7d744af6c 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
@@ -1,7 +1,7 @@
-From ecbdea7bd8b08205f1bc3f6b72d4b4a80f313fcb Mon Sep 17 00:00:00 2001
+From ec7ceec1c930cdcfb6ef7f868830a04657866384 Mon Sep 17 00:00:00 2001
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
index fea3b00f62..7aa798daa3 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch
@@ -1,4 +1,4 @@
-From e244a72c6f8803550f37e81f72bbae039651013b Mon Sep 17 00:00:00 2001
+From ab102e2a7fa6385319a53e21fb96ce53f16b0382 Mon Sep 17 00:00:00 2001
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
index 0000000000..2dffbaf664
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0020-Committing-changes-from-do_patch.patch
@@ -0,0 +1,332 @@
+From 26fe695697cc6357b3ce6216c78e300957a070e8 Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Thu, 15 Feb 2024 11:29:15 +0000
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
index 51cd3532d3..a886eb0b99 100644
--- a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
@@ -1,4 +1,4 @@
-From 0bf4b0ac18d1ea41b32ad781d214b295ca1998f3 Mon Sep 17 00:00:00 2001
+From 190ba299e6ef3f7b53360565f3dee80454f19fa9 Mon Sep 17 00:00:00 2001
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
index 82b8344279..70446f2d2b 100644
--- a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
@@ -1,4 +1,4 @@
-From 8facc29c3c56e6cf9cfef70986cf73876044a3fb Mon Sep 17 00:00:00 2001
+From f374b54b1e35cdd1f15850869a1fa0b8ab0c52ff Mon Sep 17 00:00:00 2001
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
index b9804e7451..d7cc0155eb 100644
--- a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
@@ -1,4 +1,4 @@
-From beaa5b64c60d501fa9cd59fdc563e5f5bccf6882 Mon Sep 17 00:00:00 2001
+From 8074ef64ea84f04450572e05ba9b60dbc30cba62 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 31 Aug 2010 22:51:58 +0800
 Subject: [PATCH] valgrind: fix perl scripts
diff --git a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
index bde1241dc7..03a18b321f 100644
--- a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
@@ -1,7 +1,7 @@
-From 8154d38bac5cdb3675cfdaf562ab9da01988b263 Mon Sep 17 00:00:00 2001
+From f0f6ae8d7f3abb04d878066ff8a8e53998e663fe Mon Sep 17 00:00:00 2001
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
index f15d04b173..8212b945f5 100644
--- a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
@@ -1,4 +1,4 @@
-From d134dafc2f11e0d247420a0ba360bcdef77b4093 Mon Sep 17 00:00:00 2001
+From 817c61375a549b0c3a12a8c37b3d4f388ad979bf Mon Sep 17 00:00:00 2001
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
index d04297dca8..47079a0757 100644
--- a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
@@ -1,4 +1,4 @@
-From 005bd11809a1ce65e9f2c28e884354a4741650b9 Mon Sep 17 00:00:00 2001
+From d44a5964edb95acad1522fde2b9f015e40ddb9e5 Mon Sep 17 00:00:00 2001
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


--===============3103970665179177515==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-valgrind-upgrade-3.21.0-3.22.0.patch"

RnJvbSAxZDZmZmMzMGVhYmE4OTI5YjFmMWVjMmE3YjgyOGI5YjFjZDJmNmJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTE6MzA6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
YWxncmluZDogdXBncmFkZSAzLjIxLjAgLT4gMy4yMi4wCgotLS0KIC4uLmlvbnMtc3RhdGljLXRv
LWF2b2lkLWFzc2VtYmxlci1lcnJvci5wYXRjaCB8ICAyNCArLQogLi4ucm4tYS12YWxpZC1leGl0
X2NvZGUtZnJvbS12Z19yZWd0ZXN0LnBhdGNoIHwgIDEwICstCiAuLi4vMDAwMS1kb2NzLURpc2Fi
bGUtbWFudWFsLXZhbGlkYXRpb24ucGF0Y2ggfCAgMTAgKy0KIC4uLm9wY29kZS1ub3Qtc3VwcG9y
dGVkLW9uLW1pcHMzMi1saW51eC5wYXRjaCB8ICAxOCArLQogLi4uZXR0aW5nLW1jcHUtdG8tY29y
dGV4LWE4LW9uLWFybS1hcmNoLnBhdGNoIHwgIDIwICstCiAuLi5jaGVjay10ZXN0cy1GaXgtdGlt
ZXJmZC1zeXNjYWxsLXRlc3QucGF0Y2ggfCAgMzMgKy0KIC4uLi12Z3Rlc3RzLXJlbW92ZS1mdWxs
cGF0aC1hZnRlci1mbGFncy5wYXRjaCB8ICAxMCArLQogLi4uZWFrX2Ntc2cuc3RkZXJyLmV4cC1h
ZGp1c3QtdG1wLXBhdGhzLnBhdGNoIHwgICA4ICstCiAuLi5pbnV4LXNlZ19vdmVycmlkZS5jLWFk
ZC1taXNzaW5nLWluY2wucGF0Y2ggfCAgMzAgLS0KIC4uLmFtZS1fc2lmaWVsZHMtdG8tX19zaV9m
aWVsZHMtb24tbXVzbC5wYXRjaCB8ICAxMCArLQogLi4uLWZpbHRlcl94bWxfZnJhbWVzLWRvLW5v
dC1maWx0ZXItdXNyLnBhdGNoIHwgIDEwICstCiAuLi5udGV4dC1BUElzLWFyZS1ub3QtYXZhaWxh
YmxlLW9uLW11c2wucGF0Y2ggfCAgMTQgKy0KIC4uLi1pbmNsdWRlLWRpcmVjdGl2ZS1wYXRoLWZv
ci1jb25maWcuaC5wYXRjaCB8ICAxMCArLQogLi4uZXN0LXdyYXBwZXItdG8tc3VwcG9ydC1QVEVT
VC1mb3JtYXRzLnBhdGNoIHwgICA2ICstCiAuLi4wMjAtQ29tbWl0dGluZy1jaGFuZ2VzLWZyb20t
ZG9fcGF0Y2gucGF0Y2ggfCAzMzIgKysrKysrKysrKysrKysrKysrCiAuLi50LWZvci1QUEMtaW5z
dHJ1Y3Rpb25zLW1mYXRidS1tZmF0YmwucGF0Y2ggfCAgMjYgKy0KIC4uLm4tZm9yLXRhcmdldHMt
d2hpY2gtZG9uLXQtc3VwcG9ydC1pdC5wYXRjaCB8ICAgNiArLQogLi4uL3ZhbGdyaW5kL3ZhbGdy
aW5kL2ZpeGVkLXBlcmwtcGF0aC5wYXRjaCAgIHwgICAyICstCiAuLi4vdmFsZ3JpbmQvdmFsZ3Jp
bmQvczM5MHhfdmVjX29wX3QucGF0Y2ggICAgfCAgMTIgKy0KIC4uLnRlLW1hcmNoLW1jcHUtbWZw
dS1mb3ItQVJNLXRlc3QtYXBwcy5wYXRjaCB8ICAxMCArLQogLi4uLWxkLVhYWC5zby1zdHJsZW4t
aW50ZXJjZXB0LW9wdGlvbmFsLnBhdGNoIHwgIDEwICstCiAuLi57dmFsZ3JpbmRfMy4yMS4wLmJi
ID0+IHZhbGdyaW5kXzMuMjIuMC5iYn0gfCAgIDQgKy0KIDIyIGZpbGVzIGNoYW5nZWQsIDQ0NSBp
bnNlcnRpb25zKCspLCAxNzAgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbm9uZS10ZXN0cy14ODYtbGlu
dXgtc2VnX292ZXJyaWRlLmMtYWRkLW1pc3NpbmctaW5jbC5wYXRjaAogY3JlYXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDIwLUNvbW1pdHRp
bmctY2hhbmdlcy1mcm9tLWRvX3BhdGNoLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3ZhbGdyaW5kL3t2YWxncmluZF8zLjIxLjAuYmIgPT4gdmFsZ3JpbmRfMy4yMi4wLmJifSAo
OTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmlu
ZC8wMDAxLU1ha2UtbG9jYWwtZnVuY3Rpb25zLXN0YXRpYy10by1hdm9pZC1hc3NlbWJsZXItZXJy
b3IucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1N
YWtlLWxvY2FsLWZ1bmN0aW9ucy1zdGF0aWMtdG8tYXZvaWQtYXNzZW1ibGVyLWVycm9yLnBhdGNo
CmluZGV4IDhkMmNhNTczM2UuLjA0YWNmYmE1MDggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLU1ha2UtbG9jYWwtZnVuY3Rpb25zLXN0YXRp
Yy10by1hdm9pZC1hc3NlbWJsZXItZXJyb3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtTWFrZS1sb2NhbC1mdW5jdGlvbnMtc3RhdGljLXRv
LWF2b2lkLWFzc2VtYmxlci1lcnJvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjE1NWMx
YjJjZjAwZTc0NGUyODBjNDkzZWI3NGJmNDU3ZGZjYzNiMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNTI0MGFhOGIyNTRmMTg2NjFlZTBmMDA5M2NmMjE1YWRlZjI3MDA1ZiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJhbmR5IE1hY0xlb2QgPFJhbmR5Lk1hY0xlb2RAd2lu
ZHJpdmVyLmNvbT4KIERhdGU6IFN1biwgMjEgT2N0IDIwMTggMTU6MDk6MzEgLTA0MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gTWFrZSBsb2NhbCBmdW5jdGlvbnMgc3RhdGljIHRvIGF2b2lkIGFzc2VtYmxl
ciBlcnJvcgpAQCAtMjEsMTIgKzIxLDEzIEBAIGFuZCBtb3JlIGltcG9ydGFudGx5IGFsc28gYXZv
aWQgYW4gYXNzZW1ibGVyIGVycm9yOgogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgaHR0cHM6
Ly9idWdzLmtkZS5vcmcvc2hvd19idWcuY2dpP2lkPTQwMDE2NAogCiBTaWduZWQtb2ZmLWJ5OiBS
YW5keSBNYWNMZW9kIDxSYW5keS5NYWNMZW9kQHdpbmRyaXZlci5jb20+CisKIC0tLQogIGhlbGdy
aW5kL3Rlc3RzL2Fubm90YXRlX2hiZWZvcmUuYyB8IDM0ICsrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0KICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9oZWxncmluZC90ZXN0cy9hbm5vdGF0ZV9oYmVmb3JlLmMgYi9o
ZWxncmluZC90ZXN0cy9hbm5vdGF0ZV9oYmVmb3JlLmMKLWluZGV4IGUzMTE3MTRmNy4uZjU1NTE0
ZTQ1IDEwMDY0NAoraW5kZXggMjU5ZDNiNi4uODQzODcwMSAxMDA2NDQKIC0tLSBhL2hlbGdyaW5k
L3Rlc3RzL2Fubm90YXRlX2hiZWZvcmUuYwogKysrIGIvaGVsZ3JpbmQvdGVzdHMvYW5ub3RhdGVf
aGJlZm9yZS5jCiBAQCAtMjQsNyArMjQsNyBAQCB0eXBlZGVmICB1bnNpZ25lZCBsb25nIGludCAg
VVdvcmQ7CkBAIC0xMDEsNyArMTAyLDcgQEAgaW5kZXggZTMxMTcxNGY3Li5mNTU1MTRlNDUgMTAw
NjQ0CiAgewogICAgVVdvcmQgc3VjY2VzczsKICAgIFVXb3JkIGJsb2NrWzNdID0geyAoVVdvcmQp
YWRkciwgbnl1LCBleHBlY3RlZH07Ci1AQCAtMjU2LDcgKzI1Niw3IEBAIFVXb3JkIGRvX2FjYXNX
ICggVVdvcmQqIGFkZHIsIFVXb3JkIGV4cGVjdGVkLCBVV29yZCBueXUgKQorQEAgLTI4NSw3ICsy
ODUsNyBAQCBVV29yZCBkb19hY2FzVyAoIFVXb3JkKiBhZGRyLCBVV29yZCBleHBlY3RlZCwgVVdv
cmQgbnl1ICkKICAKICAvLyBtaXBzNjQKICAvKiByZXR1cm4gMSBpZiBzdWNjZXNzLCAwIGlmIGZh
aWx1cmUgKi8KQEAgLTExMCw3ICsxMTEsNyBAQCBpbmRleCBlMzExNzE0ZjcuLmY1NTUxNGU0NSAx
MDA2NDQKICB7CiAgICBVV29yZCBzdWNjZXNzOwogICAgVVdvcmQgYmxvY2tbM10gPSB7IChVV29y
ZClhZGRyLCBueXUsIGV4cGVjdGVkfTsKLUBAIC0yODcsNyArMjg3LDcgQEAgVVdvcmQgZG9fYWNh
c1cgKCBVV29yZCogYWRkciwgVVdvcmQgZXhwZWN0ZWQsIFVXb3JkIG55dSApCitAQCAtMzE2LDcg
KzMxNiw3IEBAIFVXb3JkIGRvX2FjYXNXICggVVdvcmQqIGFkZHIsIFVXb3JkIGV4cGVjdGVkLCBV
V29yZCBueXUgKQogIAogICNlbmRpZgogIApAQCAtMTE5LDcgKzEyMCw3IEBAIGluZGV4IGUzMTE3
MTRmNy4uZjU1NTE0ZTQ1IDEwMDY0NAogIHsKICAgICB3aGlsZSAoMSkgewogICAgICAgIFVXb3Jk
IG9sZCA9ICp3OwotQEAgLTMwMSw3ICszMDEsNyBAQCB2b2lkIGF0b21pY19pbmNXICggVVdvcmQq
IHcgKQorQEAgLTMzMCw3ICszMzAsNyBAQCB2b2lkIGF0b21pY19pbmNXICggVVdvcmQqIHcgKQog
IAogICNkZWZpbmUgTk5OIDEwMDAwMDAKICAKQEAgLTEyOCw3ICsxMjksNyBAQCBpbmRleCBlMzEx
NzE0ZjcuLmY1NTUxNGU0NSAxMDA2NDQKICB7CiAgICBVV29yZCogdyA9IChVV29yZCopYXJnOwog
ICAgaW50IGk7Ci1AQCAtMzMxLDEwICszMzEsMTAgQEAgaW50IG1haW4gKCB2b2lkICkKK0BAIC0z
NjAsMTAgKzM2MCwxMCBAQCBpbnQgbWFpbiAoIHZvaWQgKQogIAogICNlbmRpZgogIApAQCAtMTQx
LDcgKzE0Miw3IEBAIGluZGV4IGUzMTE3MTRmNy4uZjU1NTE0ZTQ1IDEwMDY0NAogIHsKICAgICBz
dHJ1Y3QgdGltZXNwZWMgdHMgPSB7IDAsIDEgKiAxMDAwICogMTAwMCB9OwogICAgIC8vIFdlIGRv
IHRoZSBzbGVlcCBpbiBzbWFsbCBwaWVjZXMgdG8gaGF2ZSBzY2hlZHVsaW5nCi1AQCAtMzQ4LDcg
KzM0OCw3IEBAIHZvaWQgZGVsYXlYbXMgKCBpbnQgaSApCitAQCAtMzc2LDcgKzM3Niw3IEBAIHZv
aWQgZGVsYXlYbXMgKCBpbnQgaSApCiAgICAgfQogIH0KICAKQEAgLTE1MCw3ICsxNTEsNyBAQCBp
bmRleCBlMzExNzE0ZjcuLmY1NTUxNGU0NSAxMDA2NDQKICB7CiAgICBVV29yZCB3MCA9ICp3Owog
ICAgVVdvcmQgdm9sYXRpbGUgKiB3ViA9IHc7Ci1AQCAtMzU3LDcgKzM1Nyw3IEBAIHZvaWQgZG9f
d2FpdCAoIFVXb3JkKiB3ICkKK0BAIC0zODUsNyArMzg1LDcgQEAgdm9pZCBkb193YWl0ICggVVdv
cmQqIHcgKQogICAgQU5OT1RBVEVfSEFQUEVOU19BRlRFUih3KTsKICB9CiAgCkBAIC0xNTksNyAr
MTYwLDcgQEAgaW5kZXggZTMxMTcxNGY3Li5mNTU1MTRlNDUgMTAwNjQ0CiAgewogICAgQU5OT1RB
VEVfSEFQUEVOU19CRUZPUkUodyk7CiAgICBhdG9taWNfaW5jVyh3KTsKLUBAIC0zNjUsNyArMzY1
LDcgQEAgdm9pZCBkb19zaWduYWwgKCBVV29yZCogdyApCitAQCAtMzkzLDcgKzM5Myw3IEBAIHZv
aWQgZG9fc2lnbmFsICggVVdvcmQqIHcgKQogIAogIAogIApAQCAtMTY4LDcgKzE2OSw3IEBAIGlu
ZGV4IGUzMTE3MTRmNy4uZjU1NTE0ZTQ1IDEwMDY0NAogIHsKICAgIFVXb3JkKiB3ID0gKFVXb3Jk
Kilhcmc7CiAgICBkZWxheVhtcyg1MDApOyAgICAvLyBlbnN1cmUgdDIgZ2V0cyB0byBpdHMgd2Fp
dCBmaXJzdAotQEAgLTM3Niw3ICszNzYsNyBAQCB2b2lkKiB0aHJlYWRfZm4xICggdm9pZCogYXJn
ICkKK0BAIC00MDQsNyArNDA0LDcgQEAgdm9pZCogdGhyZWFkX2ZuMSAoIHZvaWQqIGFyZyApCiAg
ICByZXR1cm4gTlVMTDsKICB9CiAgCkBAIC0xNzcsNiArMTc4LDMgQEAgaW5kZXggZTMxMTcxNGY3
Li5mNTU1MTRlNDUgMTAwNjQ0CiAgewogICAgVVdvcmQqIHcgPSAoVVdvcmQqKWFyZzsKICAgIGRv
X3dhaXQodyk7ICAgICAgLy8gd2FpdCBmb3IgaC1iIGVkZ2UgZnJvbSBmaXJzdCB0aHJlYWQKLS0t
IAotMi4xNy4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92
YWxncmluZC8wMDAxLVJldHVybi1hLXZhbGlkLWV4aXRfY29kZS1mcm9tLXZnX3JlZ3Rlc3QucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1SZXR1cm4t
YS12YWxpZC1leGl0X2NvZGUtZnJvbS12Z19yZWd0ZXN0LnBhdGNoCmluZGV4IGU3YWY1ZWZlY2Mu
LjZhZjdlZDY2MDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92
YWxncmluZC8wMDAxLVJldHVybi1hLXZhbGlkLWV4aXRfY29kZS1mcm9tLXZnX3JlZ3Rlc3QucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtUmV0
dXJuLWEtdmFsaWQtZXhpdF9jb2RlLWZyb20tdmdfcmVndGVzdC5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gNWVlYmRlZmQyMjUxODAzZTdkMjEwODE3NDUwMThmY2IxNmIyYmE3MSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODBiM2NiMGUzODVkZTQzNTQ2MzkyMzAwNWNmOGYwOTE2
NzU5N2FjNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJhbmR5IE1hY0xlb2QgPFJh
bmR5Lk1hY0xlb2RAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgOCBNYXkgMjAxOSAyMDoxNjo1
MiAtMDQwMAogU3ViamVjdDogW1BBVENIXSBSZXR1cm4gYSB2YWxpZCBleGl0X2NvZGUgZnJvbSB2
Z19yZWd0ZXN0CkBAIC02LDE1ICs2LDE2IEBAIFN1YmplY3Q6IFtQQVRDSF0gUmV0dXJuIGEgdmFs
aWQgZXhpdF9jb2RlIGZyb20gdmdfcmVndGVzdAogVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAK
IFNpZ25lZC1vZmYtYnk6IFJhbmR5IE1hY0xlb2QgPFJhbmR5Lk1hY0xlb2RAd2luZHJpdmVyLmNv
bT4KKwogLS0tCiAgdGVzdHMvdmdfcmVndGVzdC5pbiB8IDEgKwogIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvdmdfcmVndGVzdC5pbiBiL3Rlc3Rz
L3ZnX3JlZ3Rlc3QuaW4KLWluZGV4IDkwOWFmM2JlOC4uZjI3OTljNGUzIDEwMDc1NQoraW5kZXgg
ZTRiZDhjYi4uZmQ1NzViMiAxMDA3NTUKIC0tLSBhL3Rlc3RzL3ZnX3JlZ3Rlc3QuaW4KICsrKyBi
L3Rlc3RzL3ZnX3JlZ3Rlc3QuaW4KLUBAIC00MDMsNiArNDAzLDcgQEAgc3ViIG15c3lzdGVtKCQp
CitAQCAtNDAxLDYgKzQwMSw3IEBAIHN1YiBteXN5c3RlbSgkKQogICAgICAgICAgICAgIGV4aXQg
MTsKICAgICAgICAgIH0KICAgICAgfQpAQCAtMjIsNiArMjMsMyBAQCBpbmRleCA5MDlhZjNiZTgu
LmYyNzk5YzRlMyAxMDA3NTUKICB9CiAgIyBpZiAka2VlcHVuZmlsdGVyZWQsIGNvcGllcyAkMSB0
byAkMS51bmZpbHRlcmVkLm91dAogICMgcmVuYW1lcyAkMCB0cCAkMQotLS0gCi0yLjE3LjAKLQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEt
ZG9jcy1EaXNhYmxlLW1hbnVhbC12YWxpZGF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtZG9jcy1EaXNhYmxlLW1hbnVhbC12YWxpZGF0aW9u
LnBhdGNoCmluZGV4IDI1NmRkYjBjMzQuLmJkMDBkNDNkZDYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLWRvY3MtRGlzYWJsZS1tYW51YWwt
dmFsaWRhdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFs
Z3JpbmQvMDAwMS1kb2NzLURpc2FibGUtbWFudWFsLXZhbGlkYXRpb24ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDk5ZmM2ZmU5YjY2YmVjYWMzYzk0MDY4MTI5ZTg0MjE3MzMwYTcxYTYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhjMjJlYjc0YTBiNWYyNzI1OWViODgzODZlMjU0
Y2IyYzE2YWY3ZWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAxMyBKYW4gMjAyMiAxODoyNjowMiAtMDgwMAog
U3ViamVjdDogW1BBVENIXSBkb2NzOiBEaXNhYmxlIG1hbnVhbCB2YWxpZGF0aW9uCkBAIC0xNCwx
NSArMTQsMTYgQEAgRml4ZXMKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtPRS1T
cGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CisK
IC0tLQogIGRvY3MvTWFrZWZpbGUuYW0gfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9kb2NzL01ha2VmaWxlLmFtIGIv
ZG9jcy9NYWtlZmlsZS5hbQotaW5kZXggZDQyNTBlOC4uYzUwMDMwNiAxMDA2NDQKK2luZGV4IGY5
YmE0ZTMuLjBiNWE2NjMgMTAwNjQ0CiAtLS0gYS9kb2NzL01ha2VmaWxlLmFtCiArKysgYi9kb2Nz
L01ha2VmaWxlLmFtCi1AQCAtMTkyLDcgKzE5Miw3IEBAIHZhbGlkLW1hbnBhZ2VzOiAkKE1BTlBB
R0VTX1hNTF9GSUxFUykKK0BAIC0xOTQsNyArMTk0LDcgQEAgdmFsaWQtbWFucGFnZXM6ICQoTUFO
UEFHRVNfWE1MX0ZJTEVTKQogIAkgIHRvdWNoICRAOyBcCiAgCWZpCiAgCkBAIC0zMSw2ICszMiwz
IEBAIGluZGV4IGQ0MjUwZTguLmM1MDAzMDYgMTAwNjQ0CiAgCiAgIyBUaGUgdGV4dCB2ZXJzaW9u
IG9mIHRoZSBGQVEuCiAgRkFRLnR4dDoKLS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLWZpeC1vcGNvZGUtbm90LXN1
cHBvcnRlZC1vbi1taXBzMzItbGludXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFs
Z3JpbmQvdmFsZ3JpbmQvMDAwMS1maXgtb3Bjb2RlLW5vdC1zdXBwb3J0ZWQtb24tbWlwczMyLWxp
bnV4LnBhdGNoCmluZGV4IDM5YjYyNGQ5ZjYuLjc2Mjk5MjIxYzAgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLWZpeC1vcGNvZGUtbm90LXN1
cHBvcnRlZC1vbi1taXBzMzItbGludXgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtZml4LW9wY29kZS1ub3Qtc3VwcG9ydGVkLW9uLW1pcHMz
Mi1saW51eC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gZmI1MzYyZjIwNWIzN2M1MDYwZmNk
NzY0YTdlZDM5M2FiZTRmMmYzZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTUzYzVi
ZTdhYTE5NDUwZGNhNjRmMDk2NzZjYmE5NTc5ZDBlOTcxYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IEZy
aSwgMjcgSnVsIDIwMTggMTc6Mzk6MzcgKzA4MDAKLVN1YmplY3Q6IFtQQVRDSCAxLzJdIGZpeCBv
cGNvZGUgbm90IHN1cHBvcnRlZCBvbiBtaXBzMzItbGludXgKK1N1YmplY3Q6IFtQQVRDSF0gZml4
IG9wY29kZSBub3Qgc3VwcG9ydGVkIG9uIG1pcHMzMi1saW51eAogCiBXaGlsZSBidWlsZCB0ZXN0
cyhgbWFrZSBjaGVjaycpIG9uIG1pcHMzMi1saW51eCwgdGhlcmUgYXJlCiBzZXJpYWwgZmFpbHVy
ZXMgc3VjaCBhczoKQEAgLTI0LDYgKzI0LDcgQEAgYnV0IG1pc3NlZCB0byBwYXNzIHRoZW0gdG8g
dGVzdHMgd2hpY2ggY2F1c2VkIHRoZSBhYm92ZSBmYWlsdXJlCiAKIFVwc3RyZWFtLVN0YXR1czog
U3VibWl0dGVkIFtodHRwczovL2J1Z3Mua2RlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9Mzk2OTA1XQog
U2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgorCiAt
LS0KICBoZWxncmluZC90ZXN0cy9NYWtlZmlsZS5hbSAgICB8IDUgKysrKysKICBtZW1jaGVjay90
ZXN0cy9NYWtlZmlsZS5hbSAgICB8IDUgKysrKysKQEAgLTMxLDEwICszMiwxMCBAQCBTaWduZWQt
b2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAgMyBmaWxlcyBj
aGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9oZWxncmluZC90ZXN0cy9N
YWtlZmlsZS5hbSBiL2hlbGdyaW5kL3Rlc3RzL01ha2VmaWxlLmFtCi1pbmRleCBhZDFhZjE5MWEu
LjYyMDlkMzVhNyAxMDA2NDQKK2luZGV4IDJmMzIzZDMuLmUxMGQ5YzAgMTAwNzU1CiAtLS0gYS9o
ZWxncmluZC90ZXN0cy9NYWtlZmlsZS5hbQogKysrIGIvaGVsZ3JpbmQvdGVzdHMvTWFrZWZpbGUu
YW0KLUBAIC0yMTQsNiArMjE0LDExIEBAIGNoZWNrX1BST0dSQU1TICs9IGFubm90YXRlX3J3bG9j
aworQEAgLTI0Myw2ICsyNDMsMTEgQEAgY2hlY2tfUFJPR1JBTVMgKz0gZ2V0YWRkcmluZm8KICBl
bmRpZgogIAogIEFNX0NGTEFHUyAgICs9ICQoQU1fRkxBR19NMzI2NF9QUkkpCkBAIC00NywxMCAr
NDgsMTAgQEAgaW5kZXggYWQxYWYxOTFhLi42MjA5ZDM1YTcgMTAwNjQ0CiAgCiAgTERBREQgPSAt
bHB0aHJlYWQKIGRpZmYgLS1naXQgYS9tZW1jaGVjay90ZXN0cy9NYWtlZmlsZS5hbSBiL21lbWNo
ZWNrL3Rlc3RzL01ha2VmaWxlLmFtCi1pbmRleCA4NGU0OTQwNWYuLmFmZjg2MWEzMiAxMDA2NDQK
K2luZGV4IDQ3YjUzODQuLjNkOTJiMzIgMTAwNjQ0CiAtLS0gYS9tZW1jaGVjay90ZXN0cy9NYWtl
ZmlsZS5hbQogKysrIGIvbWVtY2hlY2svdGVzdHMvTWFrZWZpbGUuYW0KLUBAIC00NDMsNiArNDQz
LDExIEBAIGNoZWNrX1BST0dSQU1TICs9IHJlYWNoX3RocmVhZF9yZWdpc3RlcgorQEAgLTU5MCw2
ICs1OTAsMTEgQEAgY2hlY2tfUFJPR1JBTVMgKz0gd2NzbmNweQogIGVuZGlmCiAgCiAgQU1fQ0ZM
QUdTICAgKz0gJChBTV9GTEFHX00zMjY0X1BSSSkKQEAgLTYzLDcgKzY0LDcgQEAgaW5kZXggODRl
NDk0MDVmLi5hZmY4NjFhMzIgMTAwNjQ0CiAgCiAgaWYgVkdDT05GX1BMQVRGT1JNU19JTkNMVURF
X0FSTV9MSU5VWAogZGlmZiAtLWdpdCBhL25vbmUvdGVzdHMvbWlwczMyL01ha2VmaWxlLmFtIGIv
bm9uZS90ZXN0cy9taXBzMzIvTWFrZWZpbGUuYW0KLWluZGV4IGQxMTU5MWQ0NS4uNjAyY2QyNmY2
IDEwMDY0NAoraW5kZXggNzAwOTlmZi4uNzEzZmYyMCAxMDA2NDQKIC0tLSBhL25vbmUvdGVzdHMv
bWlwczMyL01ha2VmaWxlLmFtCiArKysgYi9ub25lL3Rlc3RzL21pcHMzMi9NYWtlZmlsZS5hbQog
QEAgLTk5LDYgKzk5LDEwIEBAIGNoZWNrX1BST0dSQU1TID0gXApAQCAtNzcsNiArNzgsMyBAQCBp
bmRleCBkMTE1OTFkNDUuLjYwMmNkMjZmNiAxMDA2NDQKICBBTV9DRkxBR1MgICAgKz0gQEZMQUdf
TTMyQAogIEFNX0NYWEZMQUdTICArPSBARkxBR19NMzJACiAgQU1fQ0NBU0ZMQUdTICs9IEBGTEFH
X00zMkAKLS0tIAotMi4xNy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92
YWxncmluZC92YWxncmluZC8wMDAxLW1ha2VmaWxlcy1Ecm9wLXNldHRpbmctbWNwdS10by1jb3J0
ZXgtYTgtb24tYXJtLWFyY2gucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQv
dmFsZ3JpbmQvMDAwMS1tYWtlZmlsZXMtRHJvcC1zZXR0aW5nLW1jcHUtdG8tY29ydGV4LWE4LW9u
LWFybS1hcmNoLnBhdGNoCmluZGV4IDA3MzcxM2MxMzkuLmJjMmY3YWU4YzggMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW1ha2VmaWxlcy1E
cm9wLXNldHRpbmctbWNwdS10by1jb3J0ZXgtYTgtb24tYXJtLWFyY2gucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWFrZWZpbGVzLURyb3At
c2V0dGluZy1tY3B1LXRvLWNvcnRleC1hOC1vbi1hcm0tYXJjaC5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gNzE1Y2YxMjIzODhmMzUyN2FmYTU2NDljZWJmOWYxNTIyYzI0MDY5MyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmQ4NDQ3YTkyZmYzNjE3MjRlNzI4NzM4ZjI4ODNkN2Vm
MGY2YmQ5MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDIwIEFwciAyMDE3IDEwOjExOjE2IC0wNzAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIG1ha2VmaWxlczogRHJvcCBzZXR0aW5nIC1tY3B1IHRvIGNvcnRleC1hOCBv
biBhcm0KQEAgLTEzLDYgKzEzLDcgQEAgRml4ZXMKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVk
IFtodHRwczovL2J1Z3Mua2RlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NDU0MzQ2XQogCiBTaWduZWQt
b2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgorCiAtLS0KICBNYWtlZmlsZS5h
bGwuYW0gICAgICAgICAgICB8ICA2ICsrKy0tLQogIGhlbGdyaW5kL3Rlc3RzL01ha2VmaWxlLmFt
IHwgIDYgKysrLS0tCkBAIC0yMCwxMCArMjEsMTAgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4KICAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyks
IDE1IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUuYWxsLmFtIGIvTWFrZWZp
bGUuYWxsLmFtCi1pbmRleCAwMjA1OWEzLi5jN2M0NzAwIDEwMDY0NAoraW5kZXggOTRkNjVmMi4u
YjQ3Y2VkNyAxMDA3NTUKIC0tLSBhL01ha2VmaWxlLmFsbC5hbQogKysrIGIvTWFrZWZpbGUuYWxs
LmFtCi1AQCAtMTk3LDExICsxOTcsMTEgQEAgQU1fQ0NBU0ZMQUdTX1BQQzY0TEVfTElOVVggID0g
QEZMQUdfTTY0QCAtZworQEAgLTIzNCwxMSArMjM0LDExIEBAIEFNX0NDQVNGTEFHU19YODZfRlJF
RUJTRCAgICA9IEBGTEFHX00zMkAgLWcKICAKICBBTV9GTEFHX00zMjY0X0FSTV9MSU5VWCAgID0g
QEZMQUdfTTMyQAogIEFNX0NGTEFHU19BUk1fTElOVVggICAgICAgPSBARkxBR19NMzJAIFwKQEAg
LTM5LDEwICs0MCwxMCBAQCBpbmRleCAwMjA1OWEzLi5jN2M0NzAwIDEwMDY0NAogIEFNX0ZMQUdf
TTMyNjRfQVJNNjRfTElOVVggPSBARkxBR19NNjRACiAgQU1fQ0ZMQUdTX0FSTTY0X0xJTlVYICAg
ICA9IEBGTEFHX002NEAgJChBTV9DRkxBR1NfQkFTRSkKIGRpZmYgLS1naXQgYS9oZWxncmluZC90
ZXN0cy9NYWtlZmlsZS5hbSBiL2hlbGdyaW5kL3Rlc3RzL01ha2VmaWxlLmFtCi1pbmRleCBkZjgy
MTY5Li4wN2ViNjZhIDEwMDY0NAoraW5kZXggM2UyZWZhZC4uMmYzMjNkMyAxMDA3NTUKIC0tLSBh
L2hlbGdyaW5kL3Rlc3RzL01ha2VmaWxlLmFtCiArKysgYi9oZWxncmluZC90ZXN0cy9NYWtlZmls
ZS5hbQotQEAgLTE4OSw5ICsxODksOSBAQCBpZiAhIFZHQ09ORl9QTEFURk9STVNfSU5DTFVERV9Y
ODZfREFSV0lOCitAQCAtMjE2LDkgKzIxNiw5IEBAIGlmICEgVkdDT05GX1BMQVRGT1JNU19JTkNM
VURFX1g4Nl9EQVJXSU4KICBlbmRpZgogIAogIGlmIFZHQ09ORl9QTEFURk9STVNfSU5DTFVERV9B
Uk1fTElOVVgKQEAgLTU2LDEwICs1NywxMCBAQCBpbmRleCBkZjgyMTY5Li4wN2ViNjZhIDEwMDY0
NAogIGFubm90YXRlX2hiZWZvcmVfQ0ZMQUdTID0gJChBTV9DRkxBR1MpCiAgdGMwN19oYmwxX0NG
TEFHUyAgICAgICAgPSAkKEFNX0NGTEFHUykKIGRpZmYgLS1naXQgYS9ub25lL3Rlc3RzL2FybS9N
YWtlZmlsZS5hbSBiL25vbmUvdGVzdHMvYXJtL01ha2VmaWxlLmFtCi1pbmRleCAwMjRlYjZkLi5j
Y2VjYjkwIDEwMDY0NAoraW5kZXggYjMzN2Q3Ny4uYTkzMjE2NCAxMDA2NDQKIC0tLSBhL25vbmUv
dGVzdHMvYXJtL01ha2VmaWxlLmFtCiArKysgYi9ub25lL3Rlc3RzL2FybS9NYWtlZmlsZS5hbQot
QEAgLTUyLDEwICs1MiwxMCBAQCBhbGxleGVjX0NGTEFHUwkJPSAkKEFNX0NGTEFHUykgQEZMQUdf
V19OT19OT05OVUxMQAorQEAgLTU2LDEwICs1NiwxMCBAQCBhbGxleGVjX0NGTEFHUwkJPSAkKEFN
X0NGTEFHUykgQEZMQUdfV19OT19OT05OVUxMQAogICMgbmVlZCBzcGVjaWFsIGhlbHBpbmcgdy5y
LnQgLW1mcHUgYW5kIC1tZmxvYXQtYWJpLCB0aG91Z2guCiAgIyBBbHNvIGZvcmNlIC1PMCBzaW5j
ZSAtTyB0YWtlcyBodW5kcmVkcyBvZiBNQiBvZiBtZW1vcnkgCiAgIyBmb3IgdjZpbnRUaHVtYi5j
LgpAQCAtNzMsNyArNzQsNyBAQCBpbmRleCAwMjRlYjZkLi5jY2VjYjkwIDEwMDY0NAogIAogIHY4
Y3J5cHRvX2FfQ0ZMQUdTID0gJChBTV9DRkxBR1MpIC1nIC1PMCAtbWZwdT1jcnlwdG8tbmVvbi1m
cC1hcm12OCAtbWFybQogIHY4Y3J5cHRvX3RfQ0ZMQUdTID0gJChBTV9DRkxBR1MpIC1nIC1PMCAt
bWZwdT1jcnlwdG8tbmVvbi1mcC1hcm12OCAtbXRodW1iCi1AQCAtNjUsMjMgKzY1LDIzIEBAIHY4
bWVtb3J5X2FfQ0ZMQUdTID0gJChBTV9DRkxBR1MpIC1nIC1PMCBcCitAQCAtNzIsMjMgKzcyLDIz
IEBAIHY4bWVtb3J5X2FfQ0ZMQUdTID0gJChBTV9DRkxBR1MpIC1nIC1PMCBcCiAgdjhtZW1vcnlf
dF9DRkxBR1MgPSAkKEFNX0NGTEFHUykgLWcgLU8wIFwKICAJCQktbWFyY2g9YXJtdjgtYSAtbWZw
dT1jcnlwdG8tbmVvbi1mcC1hcm12OCAtbXRodW1iCiAgCkBAIC0xMDMsNiArMTA0LDMgQEAgaW5k
ZXggMDI0ZWI2ZC4uY2NlY2I5MCAxMDA2NDQKICt2Y3Z0X2ZpeGVkX2Zsb2F0X1ZGUF9DRkxBR1Mg
PSAkKEFNX0NGTEFHUykgLWcgLW1mcHU9dmZwdjMKICAKICB2ZnB2NF9mbWFfQ0ZMQUdTICA9ICQo
QU1fQ0ZMQUdTKSAtZyAtTzAgLW1hcmNoPWFybXY3dmUgLW1jcHU9Y29ydGV4LWExNSAtbWZwdT12
ZnB2NCAtbWFybQotLS0gCi0yLjEyLjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWVtY2hlY2stdGVzdHMtRml4LXRpbWVyZmQtc3lz
Y2FsbC10ZXN0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5k
LzAwMDEtbWVtY2hlY2stdGVzdHMtRml4LXRpbWVyZmQtc3lzY2FsbC10ZXN0LnBhdGNoCmluZGV4
IDE1ZmJiZTk1NGYuLjNhMGExZjM1OTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxncmluZC92YWxncmluZC8wMDAxLW1lbWNoZWNrLXRlc3RzLUZpeC10aW1lcmZkLXN5c2Nh
bGwtdGVzdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3Jp
bmQvMDAwMS1tZW1jaGVjay10ZXN0cy1GaXgtdGltZXJmZC1zeXNjYWxsLXRlc3QucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDVkNDExZmQxNDdkNjUyZTlkN2JiMjU5ZjQwNDg2OTNjNmU0NzQy
YWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY5ZmMxNDc3ODJiMWY1OTM4YjJhNDU5
ODMwNmY5N2JmZjc5M2RmMzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogTW9uLCA5IE1hciAyMDIwIDE2OjMwOjE5IC0w
NzAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lbWNoZWNrL3Rlc3RzOiBGaXggdGltZXJmZCBzeXNjYWxs
IHRlc3QKQEAgLTksMTUgKzksMTggQEAgaGF2ZSB0aGUgaW1wbGVtZW50YXRpb24gb3Igc3lzY2Fs
bCBpcyBub3QgZGVmaW5lZAogCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9z
b3VyY2Vmb3JnZS5uZXQvcC92YWxncmluZC9tYWlsbWFuL21lc3NhZ2UvMzY5NDM4OTcvXQogU2ln
bmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KKwogLS0tCi0gY29uZmln
LmguaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOSArKysrKysrKysKLSBjb25maWd1
cmUuYWMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsrKwotIG1lbWNoZWNrL3Rlc3Rz
L2xpbnV4L3RpbWVyZmQtc3lzY2FsbC5jIHwgMTAgKysrKysrKystLQotIDUgZmlsZXMgY2hhbmdl
ZCwgMzIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKKyBjb25maWcuaC5pbiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAzICsrKworIGNvbmZpZ3VyZS5hYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEgKworIG1lbWNoZWNrL3Rlc3RzL2xpbnV4L3RpbWVyZmQtc3lzY2Fs
bC5jIHwgMTQgKysrKysrKysrKystLS0KKyAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCiAKK2RpZmYgLS1naXQgYS9jb25maWcuaC5pbiBiL2NvbmZpZy5o
LmluCitpbmRleCBiYjUwODU0Li5lMzkyZjJhIDEwMDY0NAogLS0tIGEvY29uZmlnLmguaW4KICsr
KyBiL2NvbmZpZy5oLmluCi1AQCAtMzAxLDYgKzMwMSw5IEBACitAQCAtNDAwLDYgKzQwMCw5IEBA
CiAgLyogRGVmaW5lIHRvIDEgaWYgeW91IGhhdmUgdGhlIDxzeXMvc3lzbnZsLmg+IGhlYWRlciBm
aWxlLiAqLwogICN1bmRlZiBIQVZFX1NZU19TWVNOVkxfSAogIApAQCAtMjcsOSArMzAsMTEgQEAg
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAvKiBEZWZpbmUg
dG8gMSBpZiB5b3UgaGF2ZSB0aGUgPHN5cy90aW1lLmg+IGhlYWRlciBmaWxlLiAqLwogICN1bmRl
ZiBIQVZFX1NZU19USU1FX0gKICAKK2RpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1
cmUuYWMKK2luZGV4IGJmMDI0YWMuLmJjM2U1ZTYgMTAwNzU1CiAtLS0gYS9jb25maWd1cmUuYWMK
ICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTQwOTgsNiArNDA5OCw3IEBAIEFDX0NIRUNLX0hFQURF
UlMoWyAgICAgICBcCitAQCAtNDgxNCw2ICs0ODE0LDcgQEAgQUNfQ0hFQ0tfSEVBREVSUyhbICAg
ICAgIFwKICAgICAgICAgIHN5cy9zeXNjYWxsLmggICAgXAogICAgICAgICAgc3lzL3N5c252bC5o
ICAgICBcCiAgICAgICAgICBzeXMvdGltZS5oICAgICAgIFwKQEAgLTM3LDkgKzQyLDExIEBAIFNp
Z25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgICAgICAgICBzeXMv
dHlwZXMuaCAgICAgIFwKICAgICAgICAgIF0pCiAgCitkaWZmIC0tZ2l0IGEvbWVtY2hlY2svdGVz
dHMvbGludXgvdGltZXJmZC1zeXNjYWxsLmMgYi9tZW1jaGVjay90ZXN0cy9saW51eC90aW1lcmZk
LXN5c2NhbGwuYworaW5kZXggNjFkNzViNS4uMWJhODg4YSAxMDA2NDQKIC0tLSBhL21lbWNoZWNr
L3Rlc3RzL2xpbnV4L3RpbWVyZmQtc3lzY2FsbC5jCiArKysgYi9tZW1jaGVjay90ZXN0cy9saW51
eC90aW1lcmZkLXN5c2NhbGwuYwotQEAgLTQ1LDYgKzQ1LDkgQEAKK0BAIC00Miw2ICs0Miw5IEBA
CiAgI2lmIGRlZmluZWQoSEFWRV9TWVNfVElNRV9IKQogICNpbmNsdWRlIDxzeXMvdGltZS5oPgog
ICNlbmRpZgpAQCAtNDksNyArNTYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgogICNpZiBkZWZpbmVkKEhBVkVfU1lTX1RZUEVTX0gpCiAgI2luY2x1ZGUg
PHN5cy90eXBlcy5oPgogICNlbmRpZgotQEAgLTU0LDcgKzU3LDggQEAKK0BAIC01MSw3ICs1NCw4
IEBACiAgICogdGltZXJmZF8qIHN5c3RlbSBjYWxsIG51bWJlcnMgaW50cm9kdWNlZCBpbiAyLjYu
MjMuIFRoZXNlIGNvbnN0YW50cyBhcmUKICAgKiBub3QgeWV0IGluIHRoZSBnbGliYyAyLjcgaGVh
ZGVycywgdGhhdCBpcyB3aHkgdGhleSBhcmUgZGVmaW5lZCBoZXJlLgogICAqLwpAQCAtNTksNyAr
NjYsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogICNp
ZiBkZWZpbmVkKF9feDg2XzY0X18pCiAgI2RlZmluZSBfX05SX3RpbWVyZmRfY3JlYXRlICAyODMK
ICAjZWxpZiBkZWZpbmVkKF9faTM4Nl9fKQotQEAgLTY3LDggKzcxLDEwIEBACitAQCAtNjQsOCAr
NjgsMTAgQEAKICAjZXJyb3IgQ2Fubm90IGRldGVjdCB5b3VyIGFyY2hpdGVjdHVyZSEKICAjZW5k
aWYKICAjZW5kaWYKQEAgLTcxLDcgKzc4LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KICAjaWYgZGVmaW5lZChfX3g4Nl82NF9fKQogICNkZWZpbmUgX19O
Ul90aW1lcmZkX3NldHRpbWUgMjg2CiAgI2RlZmluZSBfX05SX3RpbWVyZmRfZ2V0dGltZSAyODcK
LUBAIC04NSw3ICs5MSw3IEBACitAQCAtODIsNyArODgsNyBAQAogICNlcnJvciBDYW5ub3QgZGV0
ZWN0IHlvdXIgYXJjaGl0ZWN0dXJlIQogICNlbmRpZgogICNlbmRpZgpAQCAtODAsNyArODcsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAogIAogIC8q
IERlZmluaXRpb25zIGZyb20gaW5jbHVkZS9saW51eC90aW1lcmZkLmggKi8KLUBAIC0xMjcsNiAr
MTMzLDcgQEAgdm9pZCBzZXRfdGltZXNwZWMoc3RydWN0IHRpbWVzcGVjICp0bXIsCitAQCAtMTI0
LDYgKzEzMCw3IEBAIHZvaWQgc2V0X3RpbWVzcGVjKHN0cnVjdCB0aW1lc3BlYyAqdG1yLCB1bnNp
Z25lZCBsb25nIGxvbmcgdXN0aW1lKQogICAgdG1yLT50dl9uc2VjID0gKGxvbmcpICgxMDAwVUxM
ICogKHVzdGltZSAlIDEwMDAwMDBVTEwpKTsKICB9CiAgCkBAIC04OCw3ICs5NSw3IEBAIFNpZ25l
ZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgaW50IHRpbWVyZmRfY3Jl
YXRlKGludCBjbG9ja2lkLCBpbnQgZmxhZ3MpCiAgewogICAgcmV0dXJuIHN5c2NhbGwoX19OUl90
aW1lcmZkX2NyZWF0ZSwgY2xvY2tpZCwgZmxhZ3MpOwotQEAgLTE0Miw2ICsxNDksNyBAQCBpbnQg
dGltZXJmZF9nZXR0aW1lKGludCB1ZmMsIHN0cnVjdCBpdGltCitAQCAtMTM5LDYgKzE0Niw3IEBA
IGludCB0aW1lcmZkX2dldHRpbWUoaW50IHVmYywgc3RydWN0IGl0aW1lcnNwZWMgKm90bXIpCiAg
ewogICAgcmV0dXJuIHN5c2NhbGwoX19OUl90aW1lcmZkX2dldHRpbWUsIHVmYywgb3Rtcik7CiAg
fQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAw
MDEtbWVtY2hlY2stdmd0ZXN0cy1yZW1vdmUtZnVsbHBhdGgtYWZ0ZXItZmxhZ3MucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1tZW1jaGVjay12Z3Rl
c3RzLXJlbW92ZS1mdWxscGF0aC1hZnRlci1mbGFncy5wYXRjaAppbmRleCBkY2U4YjUyYmEzLi42
ZWQ5ODEzZmIyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFs
Z3JpbmQvMDAwMS1tZW1jaGVjay12Z3Rlc3RzLXJlbW92ZS1mdWxscGF0aC1hZnRlci1mbGFncy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1t
ZW1jaGVjay12Z3Rlc3RzLXJlbW92ZS1mdWxscGF0aC1hZnRlci1mbGFncy5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gM2ZmODJkY2I4NDRmOThkYmY2N2M2OWYxMWY2NTE2YmMyMzQ3MjVhOSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTY4OGRkODE3ODE5ODZhZDA3M2JmMWVlY2Vj
ZWI0ZTgyMzg1M2U1NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFN0YWN5IEdhaWtv
dmFpYSA8U3RhY3kuR2Fpa292YWlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDE2IFNlcCAy
MDIwIDEzOjQ1OjA3IC0wNDAwCiBTdWJqZWN0OiBbUEFUQ0hdIG1lbWNoZWNrIHZndGVzdHMgcmVt
b3ZlIGZ1bGxwYXRoLWFmdGVyIGZsYWdzCkBAIC0xNCwxMyArMTQsMTQgQEAgcGF0aHMgaW4gY29y
cmVzcG9uZGluZyB0ZXN0cyAuYmIgc2NyaXB0LgogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJp
YXRlIFtlbWJlZGRlZCBzcGVjaWZpY10KIAogU2lnbmVkLW9mZi1ieTogU3RhY3kgR2Fpa292YWlh
IDxTdGFjeS5HYWlrb3ZhaWFAd2luZHJpdmVyLmNvbT4KKwogLS0tCiAgbWVtY2hlY2svdGVzdHMv
YmFkZnJlZTMudmd0ZXN0IHwgMiArLQogIG1lbWNoZWNrL3Rlc3RzL3ZhcmluZm81LnZndGVzdCB8
IDIgKy0KICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
IAogZGlmZiAtLWdpdCBhL21lbWNoZWNrL3Rlc3RzL2JhZGZyZWUzLnZndGVzdCBiL21lbWNoZWNr
L3Rlc3RzL2JhZGZyZWUzLnZndGVzdAotaW5kZXggM2RmYzVmZDhhLi40ZWUwM2YwMGEgMTAwNjQ0
CitpbmRleCAzZGZjNWZkLi40ZWUwM2YwIDEwMDY0NAogLS0tIGEvbWVtY2hlY2svdGVzdHMvYmFk
ZnJlZTMudmd0ZXN0CiArKysgYi9tZW1jaGVjay90ZXN0cy9iYWRmcmVlMy52Z3Rlc3QKIEBAIC0x
LDMgKzEsMyBAQApAQCAtMjksNyArMzAsNyBAQCBpbmRleCAzZGZjNWZkOGEuLjRlZTAzZjAwYSAx
MDA2NDQKICt2Z29wdHM6IC1xCiAgc3RkZXJyX2ZpbHRlcl9hcmdzOiBiYWRmcmVlLmMKIGRpZmYg
LS1naXQgYS9tZW1jaGVjay90ZXN0cy92YXJpbmZvNS52Z3Rlc3QgYi9tZW1jaGVjay90ZXN0cy92
YXJpbmZvNS52Z3Rlc3QKLWluZGV4IDA2M2QwMGRjZS4uNzljNGE3MmE0IDEwMDY0NAoraW5kZXgg
MDYzZDAwZC4uNzljNGE3MiAxMDA2NDQKIC0tLSBhL21lbWNoZWNrL3Rlc3RzL3ZhcmluZm81LnZn
dGVzdAogKysrIGIvbWVtY2hlY2svdGVzdHMvdmFyaW5mbzUudmd0ZXN0CiBAQCAtMSwzICsxLDMg
QEAKQEAgLTM3LDYgKzM4LDMgQEAgaW5kZXggMDYzZDAwZGNlLi43OWM0YTcyYTQgMTAwNjQ0CiAt
dmdvcHRzOiAtLWZ1bGxwYXRoLWFmdGVyPW1lbWNoZWNrLyAgLS1mdWxscGF0aC1hZnRlcj1jb3Jl
Z3JpbmQvIC0tcmVhZC12YXItaW5mbz15ZXMgLS1yZWFkLWlubGluZS1pbmZvPXllcyAtcQogK3Zn
b3B0czogLS1yZWFkLXZhci1pbmZvPXllcyAtLXJlYWQtaW5saW5lLWluZm89eWVzIC1xCiAgc3Rk
ZXJyX2ZpbHRlcjogZmlsdGVyX3ZhcmluZm8zCi0tLSAKLTIuMjUuMQotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1ub25lLXRlc3RzLWZk
bGVha19jbXNnLnN0ZGVyci5leHAtYWRqdXN0LXRtcC1wYXRocy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW5vbmUtdGVzdHMtZmRsZWFrX2Ntc2cu
c3RkZXJyLmV4cC1hZGp1c3QtdG1wLXBhdGhzLnBhdGNoCmluZGV4IGU0MjFhYzZjODAuLmZlNWI2
NWY0ZTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmlu
ZC8wMDAxLW5vbmUtdGVzdHMtZmRsZWFrX2Ntc2cuc3RkZXJyLmV4cC1hZGp1c3QtdG1wLXBhdGhz
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAx
LW5vbmUtdGVzdHMtZmRsZWFrX2Ntc2cuc3RkZXJyLmV4cC1hZGp1c3QtdG1wLXBhdGhzLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmNDA1Mjk3ZDMzODJjZDk4MzkxZDAyZjM5N2UyMzg3ZGEx
ZjQyODc5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlOTg5YmYxNzhmMDc0ZDA4NDRk
NWQxMTM1MGRhNDFkMDk5NWM2NmVjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDI0IEph
biAyMDIwIDE3OjU1OjM5ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIG5vbmUvdGVzdHMvZmRsZWFr
X2Ntc2cuc3RkZXJyLmV4cDogYWRqdXN0IC90bXAgcGF0aHMKQEAgLTgsMTIgKzgsMTMgQEAgdmFs
Z3JpbmQgb3V0cHV0IGNoYW5nZXMgYWNjb3JkaW5nbHkKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFw
cHJvcHJpYXRlIFtvZS1jb3JlIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CisKIC0tLQogIG5vbmUvdGVzdHMvZmRsZWFr
X2Ntc2cuc3RkZXJyLmV4cCB8IDQgKystLQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9ub25lL3Rlc3RzL2ZkbGVha19jbXNn
LnN0ZGVyci5leHAgYi9ub25lL3Rlc3RzL2ZkbGVha19jbXNnLnN0ZGVyci5leHAKLWluZGV4IDZl
NWE3OTdiOS4uMGVkZTFhYjE4IDEwMDY0NAoraW5kZXggMGZlNTZlYS4uNWEwNjA1ZSAxMDA2NDQK
IC0tLSBhL25vbmUvdGVzdHMvZmRsZWFrX2Ntc2cuc3RkZXJyLmV4cAogKysrIGIvbm9uZS90ZXN0
cy9mZGxlYWtfY21zZy5zdGRlcnIuZXhwCiBAQCAtMjUsMTAgKzI1LDEwIEBAIE9wZW4gZmlsZSBk
ZXNjcmlwdG9yIC4uLjogL2Rldi9udWxsCkBAIC0yOSw2ICszMCwzIEBAIGluZGV4IDZlNWE3OTdi
OS4uMGVkZTFhYjE4IDEwMDY0NAogICAgIC4uLgogIAogIE9wZW4gQUZfVU5JWCBzb2NrZXQgLi4u
OiA8dW5rbm93bj4KLS0tIAotMi4xNy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW5vbmUtdGVzdHMteDg2LWxpbnV4LXNlZ19vdmVy
cmlkZS5jLWFkZC1taXNzaW5nLWluY2wucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFs
Z3JpbmQvdmFsZ3JpbmQvMDAwMS1ub25lLXRlc3RzLXg4Ni1saW51eC1zZWdfb3ZlcnJpZGUuYy1h
ZGQtbWlzc2luZy1pbmNsLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA1ZTM2
YzI4NTIzLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92
YWxncmluZC8wMDAxLW5vbmUtdGVzdHMteDg2LWxpbnV4LXNlZ19vdmVycmlkZS5jLWFkZC1taXNz
aW5nLWluY2wucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzMCArMCwwIEBACi1Gcm9tIDk3OGQ5
ZWQ3Zjg1N2YyY2RjZDJhODYzMmYzYzJmZWI1NmI5OWM4MjUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCi1Gcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgotRGF0ZTog
TW9uLCA4IE1heSAyMDIzIDExOjU2OjM1ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIG5vbmUvdGVz
dHMveDg2LWxpbnV4L3NlZ19vdmVycmlkZS5jOiBhZGQgbWlzc2luZyBpbmNsdWRlIGZvcgotIG11
c2wgYnVpbGRzCi0KLU90aGVyd2lzZSBTWVNfbW9kaWZ5X2xkdCBpcyB1bmRlZmluZWQuCi0KLVVw
c3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2J1Z3Mua2RlLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MzgyMDM0XQotU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGlu
dXRyb25peC5kZT4KLQotLS0tCi0gbm9uZS90ZXN0cy94ODYtbGludXgvc2VnX292ZXJyaWRlLmMg
fCA0ICsrKysKLSAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQg
YS9ub25lL3Rlc3RzL3g4Ni1saW51eC9zZWdfb3ZlcnJpZGUuYyBiL25vbmUvdGVzdHMveDg2LWxp
bnV4L3NlZ19vdmVycmlkZS5jCi1pbmRleCBjYThmYmZlLi40ZWY0Mzk0IDEwMDY0NAotLS0tIGEv
bm9uZS90ZXN0cy94ODYtbGludXgvc2VnX292ZXJyaWRlLmMKLSsrKyBiL25vbmUvdGVzdHMveDg2
LWxpbnV4L3NlZ19vdmVycmlkZS5jCi1AQCAtMyw2ICszLDEwIEBACi0gI2luY2x1ZGUgPGVycm5v
Lmg+Ci0gI2luY2x1ZGUgPHN0cmluZy5oPgotICNpbmNsdWRlICIuLi8uLi8uLi9jb25maWcuaCIK
LSsjaWYgZGVmaW5lZChNVVNMX0xJQkMpCi0rI2luY2x1ZGUgPHN5c2NhbGwuaD4KLSsjaW5jbHVk
ZSA8dW5pc3RkLmg+Ci0rI2VuZGlmCi0gCi0gCi0gLyogU3R1ZmYgZnJvbSBXaW5lLiAqLwpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtc2ln
cXVldWUtUmVuYW1lLV9zaWZpZWxkcy10by1fX3NpX2ZpZWxkcy1vbi1tdXNsLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtc2lncXVldWUtUmVuYW1l
LV9zaWZpZWxkcy10by1fX3NpX2ZpZWxkcy1vbi1tdXNsLnBhdGNoCmluZGV4IDI3MzY2MTUzZjcu
LjMxZWI0YTcyZjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92
YWxncmluZC8wMDAxLXNpZ3F1ZXVlLVJlbmFtZS1fc2lmaWVsZHMtdG8tX19zaV9maWVsZHMtb24t
bXVzbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQv
MDAwMS1zaWdxdWV1ZS1SZW5hbWUtX3NpZmllbGRzLXRvLV9fc2lfZmllbGRzLW9uLW11c2wucGF0
Y2gKQEAgLTEsMTcgKzEsMTggQEAKLUZyb20gNjRhZDI3NDRhY2ZiNGZhNDBiMWMxMTQ2MzNhMDUz
Zjg3MTI1YTIwMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGFmMmJhNTU4ZDE5ZDg2
N2MyMDliNjQ4NzlhM2E1ODMzNWRlYWUwOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDEwIEp1biAyMDE3IDAw
OjQ2OjM5IC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0ggMS82XSBzaWdxdWV1ZTogUmVuYW1lIF9zaWZp
ZWxkcyB0byBfX3NpX2ZpZWxkcyBvbiBtdXNsCitTdWJqZWN0OiBbUEFUQ0hdIHNpZ3F1ZXVlOiBS
ZW5hbWUgX3NpZmllbGRzIHRvIF9fc2lfZmllbGRzIG9uIG11c2wKIAogVXBzdHJlYW0tU3RhdHVz
OiBQZW5kaW5nCiAKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+
CisKIC0tLQogIG1lbWNoZWNrL3Rlc3RzL2xpbnV4L3NpZ3F1ZXVlLmMgfCA1ICsrKysrCiAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEvbWVtY2hlY2svdGVz
dHMvbGludXgvc2lncXVldWUuYyBiL21lbWNoZWNrL3Rlc3RzL2xpbnV4L3NpZ3F1ZXVlLmMKLWlu
ZGV4IGQxOGJkNzIuLmFjYjdjYmEgMTAwNjQ0CitpbmRleCA0YjZmYjBmLi5kMzdmZTkzIDEwMDY0
NAogLS0tIGEvbWVtY2hlY2svdGVzdHMvbGludXgvc2lncXVldWUuYwogKysrIGIvbWVtY2hlY2sv
dGVzdHMvbGludXgvc2lncXVldWUuYwogQEAgLTgsNiArOCwxMSBAQApAQCAtMjYsNiArMjcsMyBA
QCBpbmRleCBkMThiZDcyLi5hY2I3Y2JhIDEwMDY0NAogIGludCBtYWluKGludCBhcmdjLCBjaGFy
ICoqYXJndikKICB7CiAgICBzaWdpbmZvX3QgKnNpOwotLS0gCi0yLjEzLjEKLQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtdmFsZ3JpbmQt
ZmlsdGVyX3htbF9mcmFtZXMtZG8tbm90LWZpbHRlci11c3IucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS12YWxncmluZC1maWx0ZXJfeG1sX2ZyYW1l
cy1kby1ub3QtZmlsdGVyLXVzci5wYXRjaAppbmRleCBiZjBmMGRlZDIxLi4zMmY1ZmIyMmE1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS12
YWxncmluZC1maWx0ZXJfeG1sX2ZyYW1lcy1kby1ub3QtZmlsdGVyLXVzci5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS12YWxncmluZC1maWx0
ZXJfeG1sX2ZyYW1lcy1kby1ub3QtZmlsdGVyLXVzci5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZy
b20gZDFkZWEzYzJiY2YxZTIyYmFhYjM5ZTJjMGI4Y2E1OWRiOGE1YmMzNyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gMGVmYzUzMGJhN2QwZDM4ODM0YjI5ZWY2YzdkMDQ5YzI2MTYxYzg0
ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJhbmR5IE1hY0xlb2QgPFJhbmR5Lk1h
Y0xlb2RAd2luZHJpdmVyLmNvbT4KIERhdGU6IE1vbiwgMTMgTWF5IDIwMTkgMTc6MTI6MjEgLTA0
MDAKLVN1YmplY3Q6IFtQQVRDSCAxLzJdIHZhbGdyaW5kOiBmaWx0ZXJfeG1sX2ZyYW1lczogZG8g
bm90IGZpbHRlciAvdXNyCitTdWJqZWN0OiBbUEFUQ0hdIHZhbGdyaW5kOiBmaWx0ZXJfeG1sX2Zy
YW1lczogZG8gbm90IGZpbHRlciAvdXNyCiAKIGZpbHRlcl94bWxfZnJhbWVzIGlzIGludGVuZGVk
IHRvIGZpbHRlciBzeXN0ZW0gcGF0aHMgdW5kZXIKICcvdXNyJyB0aGF0IHZhcnkgZnJvbSBwbGF0
Zm9ybSB0byBwbGF0Zm9ybS4gSW4gdGhlIHB0ZXN0IGNhc2UKQEAgLTE2LDEyICsxNiwxMyBAQCBh
bnkgbmVnYXRpdmUgaW1wYWN0LgogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtZb2N0
byBzcGVjaWZpY10KIAogU2lnbmVkLW9mZi1ieTogUmFuZHkgTWFjTGVvZCA8UmFuZHkuTWFjTGVv
ZEB3aW5kcml2ZXIuY29tPgorCiAtLS0KICB0ZXN0cy9maWx0ZXJfeG1sX2ZyYW1lcyB8IDMgKyst
CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZm
IC0tZ2l0IGEvdGVzdHMvZmlsdGVyX3htbF9mcmFtZXMgYi90ZXN0cy9maWx0ZXJfeG1sX2ZyYW1l
cwotaW5kZXggZjFmYTNmMDcwLi4wNGZiYzgyZGUgMTAwNzU1CitpbmRleCBmMWZhM2YwLi4wNGZi
YzgyIDEwMDc1NQogLS0tIGEvdGVzdHMvZmlsdGVyX3htbF9mcmFtZXMKICsrKyBiL3Rlc3RzL2Zp
bHRlcl94bWxfZnJhbWVzCiBAQCAtNDcsNyArNDcsOCBAQCB3aGlsZSAobXkgJGxpbmUgPSA8PikK
QEAgLTM0LDYgKzM1LDMgQEAgaW5kZXggZjFmYTNmMDcwLi4wNGZiYzgyZGUgMTAwNzU1CiAgICAg
IH0KICB9CiAgCi0tLSAKLTIuMTcuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMi1jb250ZXh0LUFQSXMtYXJlLW5vdC1hdmFpbGFibGUt
b24tbXVzbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8w
MDAyLWNvbnRleHQtQVBJcy1hcmUtbm90LWF2YWlsYWJsZS1vbi1tdXNsLnBhdGNoCmluZGV4IDdm
MGUzOGNiOTUuLjZmYjdkNTUwMTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92
YWxncmluZC92YWxncmluZC8wMDAyLWNvbnRleHQtQVBJcy1hcmUtbm90LWF2YWlsYWJsZS1vbi1t
dXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8w
MDAyLWNvbnRleHQtQVBJcy1hcmUtbm90LWF2YWlsYWJsZS1vbi1tdXNsLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSAyNmMxMDRhZGY2YzUxNjI1NzJiN2FhMmZhYzg5ZDA4MzViN2Y4ZjBiIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjYjY1NDk2NTk2ZTNjOGFkODYxMzFmMzI1NDcw
OTEyM2E5ODM0ZmJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmFuZHkgTWFjTGVv
ZCA8UmFuZHkuTWFjTGVvZEB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNiBPY3QgMjAxOCAy
MToyNzo0NiAtMDQwMAogU3ViamVjdDogW1BBVENIXSBjb250ZXh0IEFQSXMgYXJlIG5vdCBhdmFp
bGFibGUgb24gbXVzbApAQCAtMTQsMTMgKzE0LDE0IEBAIGZvciB2YWxncmluZC0zLjE3LgogVXBz
dHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vYnVncy5rZGUub3JnL3Nob3dfYnVnLmNn
aT9pZD00MzQ3NzVdCiAKIFNpZ25lZC1vZmYtYnk6IFlpIEZhbiBZdSA8eWlmYW4ueXVAd2luZHJp
dmVyLmNvbT4KKwogLS0tCiAgZHJkL3Rlc3RzL3N3YXBjb250ZXh0LmMgICAgICAgICAgICAgIHwg
NiArKysrKysKICBtZW1jaGVjay90ZXN0cy9saW51eC9zdGFja19jaGFuZ2VzLmMgfCA3ICsrKysr
Ky0KICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAog
ZGlmZiAtLWdpdCBhL2RyZC90ZXN0cy9zd2FwY29udGV4dC5jIGIvZHJkL3Rlc3RzL3N3YXBjb250
ZXh0LmMKLWluZGV4IDYyMmM3MGJjNS4uNWU3MmJiMGYzIDEwMDY0NAoraW5kZXggMmNiOTY5YS4u
M2E5ZDRmYSAxMDA2NDQKIC0tLSBhL2RyZC90ZXN0cy9zd2FwY29udGV4dC5jCiArKysgYi9kcmQv
dGVzdHMvc3dhcGNvbnRleHQuYwogQEAgLTIwLDYgKzIwLDcgQEAKQEAgLTMxLDcgKzMyLDcgQEAg
aW5kZXggNjIyYzcwYmM1Li41ZTcyYmIwZjMgMTAwNjQ0CiAgdHlwZWRlZiBzdHJ1Y3QgdGhyZWFk
X2xvY2FsIHsKICAgIHVjb250ZXh0X3QgdWNbM107CiAgICBzaXplX3QgbnJzdzsKLUBAIC02Nyw5
ICs2OCwxMSBAQCB2b2lkICp3b3JrZXIodm9pZCAqZGF0YSkKK0BAIC03MSw5ICs3MiwxMSBAQCB2
b2lkICp3b3JrZXIodm9pZCAqZGF0YSkKICAgIHN3YXBjb250ZXh0KCZ0bG9jYWwtPnVjWzBdLCAm
dGxvY2FsLT51Y1sxXSk7CiAgICByZXR1cm4gTlVMTDsKICB9CkBAIC00Myw3ICs0NCw3IEBAIGlu
ZGV4IDYyMmM3MGJjNS4uNWU3MmJiMGYzIDEwMDY0NAogICAgZW51bSB7IE5SID0gMzIgfTsKICAg
IHRocmVhZF9sb2NhbF90IHRsb2NhbFtOUl07CiAgICBwdGhyZWFkX3QgdGhyZWFkW05SXTsKLUBA
IC05NCw2ICs5Nyw5IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCitAQCAtOTks
NiArMTAyLDkgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAKICAgIGZvciAo
aSA9IDA7IGkgPCBOUjsgaSsrKQogICAgICBwdGhyZWFkX2pvaW4odGhyZWFkW2ldLCBOVUxMKTsK
QEAgLTU0LDcgKzU1LDcgQEAgaW5kZXggNjIyYzcwYmM1Li41ZTcyYmIwZjMgMTAwNjQ0CiAgICBy
ZXR1cm4gMDsKICB9CiBkaWZmIC0tZ2l0IGEvbWVtY2hlY2svdGVzdHMvbGludXgvc3RhY2tfY2hh
bmdlcy5jIGIvbWVtY2hlY2svdGVzdHMvbGludXgvc3RhY2tfY2hhbmdlcy5jCi1pbmRleCA3Zjk3
YjkwYTUuLmEyNmNiNGFlNiAxMDA2NDQKK2luZGV4IDdmOTdiOTAuLmEyNmNiNGEgMTAwNjQ0CiAt
LS0gYS9tZW1jaGVjay90ZXN0cy9saW51eC9zdGFja19jaGFuZ2VzLmMKICsrKyBiL21lbWNoZWNr
L3Rlc3RzL2xpbnV4L3N0YWNrX2NoYW5nZXMuYwogQEAgLTEwLDYgKzEwLDcgQEAKQEAgLTg3LDYg
Kzg4LDMgQEAgaW5kZXggN2Y5N2I5MGE1Li5hMjZjYjRhZTYgMTAwNjQ0CiArI2VuZGlmCiAgICAg
IHJldHVybiAwOwogIH0KLS0tIAotMi4xNy4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAzLWNvcnJlY3QtaW5jbHVkZS1kaXJlY3RpdmUt
cGF0aC1mb3ItY29uZmlnLmgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQv
dmFsZ3JpbmQvMDAwMy1jb3JyZWN0LWluY2x1ZGUtZGlyZWN0aXZlLXBhdGgtZm9yLWNvbmZpZy5o
LnBhdGNoCmluZGV4IGMyOTY1YzQwZGYuLmY3ZDc0NGFmNmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAzLWNvcnJlY3QtaW5jbHVkZS1kaXJl
Y3RpdmUtcGF0aC1mb3ItY29uZmlnLmgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDMtY29ycmVjdC1pbmNsdWRlLWRpcmVjdGl2ZS1wYXRoLWZv
ci1jb25maWcuaC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gZWNiZGVhN2JkOGIwODIwNWYx
YmMzZjZiNzJkNGI0YTgwZjMxM2ZjYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZWM3
Y2VlYzFjOTMwY2RjZmI2ZWY3Zjg2ODgzMGEwNDY1Nzg2NjM4NCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDEw
IEp1biAyMDE3IDAxOjAzOjE3IC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0ggMy82XSBjb3JyZWN0IGlu
Y2x1ZGUgZGlyZWN0aXZlIHBhdGggZm9yIGNvbmZpZy5oCitTdWJqZWN0OiBbUEFUQ0hdIGNvcnJl
Y3QgaW5jbHVkZSBkaXJlY3RpdmUgcGF0aCBmb3IgY29uZmlnLmgKIAogd2hlbiBidWlsZGluZyBv
dXQgb2Ygc291cmNlIHRyZWUsIGl0IGNhbiBub3QgZmluZAogdGhlIGdlbmVyYXRlZCBjb25maWcu
aCBvdGhlcndpc2UKQEAgLTksMTMgKzksMTQgQEAgdGhlIGdlbmVyYXRlZCBjb25maWcuaCBvdGhl
cndpc2UKIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgorCiAtLS0KICBtZW1jaGVjay90ZXN0cy9saW51eC9zeXNj
YWxscy0yMDA3LmMgIHwgMiArLQogIG1lbWNoZWNrL3Rlc3RzL2xpbnV4L3N5c2xvZy1zeXNjYWxs
LmMgfCAyICstCiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9tZW1jaGVjay90ZXN0cy9saW51eC9zeXNjYWxscy0yMDA3LmMg
Yi9tZW1jaGVjay90ZXN0cy9saW51eC9zeXNjYWxscy0yMDA3LmMKLWluZGV4IGI2MWM2ZDUuLmNj
M2ZkNjIgMTAwNjQ0CitpbmRleCBiOTFkZjgyLi5jMTVjM2ViIDEwMDY0NAogLS0tIGEvbWVtY2hl
Y2svdGVzdHMvbGludXgvc3lzY2FsbHMtMjAwNy5jCiArKysgYi9tZW1jaGVjay90ZXN0cy9saW51
eC9zeXNjYWxscy0yMDA3LmMKIEBAIC0xMCw3ICsxMCw3IEBACkBAIC00MCw2ICs0MSwzIEBAIGlu
ZGV4IDExNDM3MjIuLjIxZTc1OGIgMTAwNjQ0CiAgI2luY2x1ZGUgPHN0ZGlvLmg+CiAgI2lmIGRl
ZmluZWQoSEFWRV9TWVNfS0xPR19IKQogICNpbmNsdWRlIDxzeXMva2xvZy5oPgotLS0gCi0yLjEz
LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5k
LzAwMDUtTW9kaWZ5LXZnX3Rlc3Qtd3JhcHBlci10by1zdXBwb3J0LVBURVNULWZvcm1hdHMucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwNS1Nb2RpZnkt
dmdfdGVzdC13cmFwcGVyLXRvLXN1cHBvcnQtUFRFU1QtZm9ybWF0cy5wYXRjaAppbmRleCBmZWEz
YjAwZjYyLi43YWE3OThkYWEzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFs
Z3JpbmQvdmFsZ3JpbmQvMDAwNS1Nb2RpZnktdmdfdGVzdC13cmFwcGVyLXRvLXN1cHBvcnQtUFRF
U1QtZm9ybWF0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFs
Z3JpbmQvMDAwNS1Nb2RpZnktdmdfdGVzdC13cmFwcGVyLXRvLXN1cHBvcnQtUFRFU1QtZm9ybWF0
cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTI0NGE3MmM2Zjg4MDM1NTBmMzdlODFmNzJi
YmFlMDM5NjUxMDEzYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWIxMDJlMmE3ZmE2
Mzg1MzE5YTUzZTIxZmI5NmNlNTNmMTZiMDM4MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVHVl
LCAxNSBEZWMgMjAxNSAxNTo1MDo0NCArMDIwMAogU3ViamVjdDogW1BBVENIXSBNb2RpZnkgdmdf
dGVzdCB3cmFwcGVyIHRvIHN1cHBvcnQgUFRFU1QgZm9ybWF0cwpAQCAtMjQsNiArMjQsNyBAQCBJ
bmNyZWFzZSB0aW1lIGxpbWl0IHRvIDkwIHMuCiAoZG91YmxlIG9mIHRoZSBleHBlY3RlZCB0aW1l
IG9mIGRyZC90ZXN0cy9zdGRfbGlzdCBvbiBxZW11YXJtNjQpCiAKIFNpZ25lZC1vZmYtYnk6IFlp
IEZhbiBZdSA8eWlmYW4ueXVAd2luZHJpdmVyLmNvbT4KKwogLS0tCiAgdGVzdHMvdmdfcmVndGVz
dC5pbiB8IDc1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQog
IDEgZmlsZSBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKQEAgLTI1
Miw2ICsyNTMsMyBAQCBpbmRleCBhZDE4ODAwLi5lNGJkOGNiIDEwMDc1NQogICAgICB9CiAgICAg
IHByaW50ICJcbiI7CiAgfQotLS0gCi0yLjMwLjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMjAtQ29tbWl0dGluZy1jaGFuZ2VzLWZyb20t
ZG9fcGF0Y2gucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQv
MDAyMC1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5wYXRjaApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4yZGZmYmFmNjY0Ci0tLSAvZGV2L251bGwKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMjAtQ29tbWl0dGluZy1j
aGFuZ2VzLWZyb20tZG9fcGF0Y2gucGF0Y2gKQEAgLTAsMCArMSwzMzIgQEAKK0Zyb20gMjZmZTY5
NTY5N2NjNjM1N2IzY2U2MjE2Yzc4ZTMwMDk1N2EwNzBlOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb206IE9wZW5FbWJlZGRlZCA8b2UucGF0Y2hAb2U+CitEYXRlOiBUaHUsIDE1IEZlYiAy
MDI0IDExOjI5OjE1ICswMDAwCitTdWJqZWN0OiBbUEFUQ0hdIENvbW1pdHRpbmcgY2hhbmdlcyBm
cm9tIGRvX3BhdGNoCisKKy0tLQorIG1lbWNoZWNrL3Rlc3RzL2JhZGZyZWUzLnN0ZGVyci5leHAg
fCAgIDQgKy0KKyBtZW1jaGVjay90ZXN0cy92YXJpbmZvNS5zdGRlcnIuZXhwIHwgMjE2ICsrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tCisgMiBmaWxlcyBjaGFuZ2VkLCAxMTAgaW5zZXJ0aW9u
cygrKSwgMTEwIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEvbWVtY2hlY2svdGVzdHMvYmFk
ZnJlZTMuc3RkZXJyLmV4cCBiL21lbWNoZWNrL3Rlc3RzL2JhZGZyZWUzLnN0ZGVyci5leHAKK2lu
ZGV4IDIwZTQ4YTYuLmI1MTg3MDMgMTAwNjQ0CistLS0gYS9tZW1jaGVjay90ZXN0cy9iYWRmcmVl
My5zdGRlcnIuZXhwCisrKysgYi9tZW1jaGVjay90ZXN0cy9iYWRmcmVlMy5zdGRlcnIuZXhwCitA
QCAtMSwxMSArMSwxMSBAQAorIEludmFsaWQgZnJlZSgpIC8gZGVsZXRlIC8gZGVsZXRlW10gLyBy
ZWFsbG9jKCkKKyAgICBhdCAweC4uLi4uLi4uOiBmcmVlICh2Z19yZXBsYWNlX21hbGxvYy5jOi4u
LikKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy9iYWRmcmVlLmM6MTIpCisrICAgYnkg
MHguLi4uLi4uLjogbWFpbiAoYmFkZnJlZS5jOjEyKQorICBBZGRyZXNzIDB4Li4uLi4uLi4gaXMg
bm90IHN0YWNrJ2QsIG1hbGxvYydkIG9yIChyZWNlbnRseSkgZnJlZSdkCisgCisgSW52YWxpZCBm
cmVlKCkgLyBkZWxldGUgLyBkZWxldGVbXSAvIHJlYWxsb2MoKQorICAgIGF0IDB4Li4uLi4uLi46
IGZyZWUgKHZnX3JlcGxhY2VfbWFsbG9jLmM6Li4uKQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4g
KHRlc3RzL2JhZGZyZWUuYzoxNSkKKysgICBieSAweC4uLi4uLi4uOiBtYWluIChiYWRmcmVlLmM6
MTUpCisgIEFkZHJlc3MgMHguLi4uLi4uLiBpcyBvbiB0aHJlYWQgMSdzIHN0YWNrCisgIGluIGZy
YW1lICMxLCBjcmVhdGVkIGJ5IG1haW4gKGJhZGZyZWUuYzo3KQorIAorZGlmZiAtLWdpdCBhL21l
bWNoZWNrL3Rlc3RzL3ZhcmluZm81LnN0ZGVyci5leHAgYi9tZW1jaGVjay90ZXN0cy92YXJpbmZv
NS5zdGRlcnIuZXhwCitpbmRleCAxYTEwZDAzLi4wZmQxMTkwIDEwMDY0NAorLS0tIGEvbWVtY2hl
Y2svdGVzdHMvdmFyaW5mbzUuc3RkZXJyLmV4cAorKysrIGIvbWVtY2hlY2svdGVzdHMvdmFyaW5m
bzUuc3RkZXJyLmV4cAorQEAgLTEsMTkxICsxLDE5MSBAQAorIFVuaW5pdGlhbGlzZWQgYnl0ZShz
KSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAweC4uLi4uLi4uOiBj
cm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8x
X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzo1MikKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZv
NV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU0KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4g
KHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5mbzVz
by5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8xX21haW4gKHZhcmluZm81c28uYzo1
MikKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU0KQor
KyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81LmM6NSkKKyAgQWRkcmVzcyAweC4uLi4u
Li4uIGlzIDEgYnl0ZXMgaW5zaWRlIGEgYmxvY2sgb2Ygc2l6ZSAzIGFsbG9jJ2QKKyAgICBhdCAw
eC4uLi4uLi4uOiBtYWxsb2MgKHZnX3JlcGxhY2VfbWFsbG9jLmM6Li4uKQorLSAgIGJ5IDB4Li4u
Li4uLi46IHZhcmluZm8xX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzo1MCkKKy0gICBieSAweC4u
Li4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU0KQorLSAgIGJ5IDB4
Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBieSAweC4uLi4uLi4uOiB2
YXJpbmZvMV9tYWluICh2YXJpbmZvNXNvLmM6NTApCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5m
bzVfbWFpbiAodmFyaW5mbzVzby5jOjE1NCkKKysgICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJp
bmZvNS5jOjUpCisgCisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQg
Y2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNv
LmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzFfbWFpbiAodGVzdHMvdmFyaW5mbzVz
by5jOjU1KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81
c28uYzoxNTQpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQor
KyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4u
Li4uLjogdmFyaW5mbzFfbWFpbiAodmFyaW5mbzVzby5jOjU1KQorKyAgIGJ5IDB4Li4uLi4uLi46
IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTQpCisrICAgYnkgMHguLi4uLi4uLjogbWFp
biAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5zaWRl
IGdsb2JhbCB2YXIgImdsb2JhbF91MSIKKyAgZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5jOjM4Cisg
CisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVz
dAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAg
YnkgMHguLi4uLi4uLjogdmFyaW5mbzFfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjU2KQorLSAg
IGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTQpCist
ICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4u
Li4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5m
bzFfbWFpbiAodmFyaW5mbzVzby5jOjU2KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21h
aW4gKHZhcmluZm81c28uYzoxNTQpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUu
Yzo1KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5zaWRlIGdsb2JhbCB2YXIg
Imdsb2JhbF9pMSIKKyAgZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5jOjQwCisgCisgVW5pbml0aWFs
aXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4
Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4u
LjogdmFyaW5mbzFfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjU3KQorLSAgIGJ5IDB4Li4uLi4u
Li46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTQpCistICAgYnkgMHguLi4u
Li4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2Fr
ICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzFfbWFpbiAodmFy
aW5mbzVzby5jOjU3KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81
c28uYzoxNTQpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2Nh
dGlvbiAweC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5zaWRlIGdsb2JhbF91MlszXSwKKyAgYSBnbG9i
YWwgdmFyaWFibGUgZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5jOjQyCisgCisgVW5pbml0aWFsaXNl
ZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4u
Li4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjog
dmFyaW5mbzFfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjU4KQorLSAgIGJ5IDB4Li4uLi4uLi46
IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTQpCistICAgYnkgMHguLi4uLi4u
LjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2
YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzFfbWFpbiAodmFyaW5m
bzVzby5jOjU4KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28u
YzoxNTQpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlv
biAweC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5zaWRlIGdsb2JhbF9pMls3XSwKKyAgYSBnbG9iYWwg
dmFyaWFibGUgZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5jOjQ0CisgCisgVW5pbml0aWFsaXNlZCBi
eXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4u
Li46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogdmFy
aW5mbzFfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjU5KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZh
cmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTQpCistICAgYnkgMHguLi4uLi4uLjog
bWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJp
bmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzFfbWFpbiAodmFyaW5mbzVz
by5jOjU5KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzox
NTQpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAw
eC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5zaWRlIGxvY2FsIHZhciAibG9jYWwiCisgIGRlY2xhcmVk
IGF0IHZhcmluZm81c28uYzo0OSwgaW4gZnJhbWUgI1ggb2YgdGhyZWFkIDEKKyAKKyBVbmluaXRp
YWxpc2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0CistICAgYXQg
MHguLi4uLi4uLjogY3JvYWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAweC4uLi4u
Li4uOiBmb28yICh0ZXN0cy92YXJpbmZvNXNvLmM6NzEpCistICAgYnkgMHguLi4uLi4uLjogdmFy
aW5mbzJfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjgxKQorLSAgIGJ5IDB4Li4uLi4uLi46IHZh
cmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTUpCistICAgYnkgMHguLi4uLi4uLjog
bWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJp
bmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogZm9vMiAodmFyaW5mbzVzby5jOjcxKQor
KyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8yX21haW4gKHZhcmluZm81c28uYzo4MSkKKysgICBi
eSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU1KQorKyAgIGJ5IDB4
Li4uLi4uLi46IG1haW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAw
IGJ5dGVzIGluc2lkZSB2YXJbN10sCisgIGRlY2xhcmVkIGF0IHZhcmluZm81c28uYzo2OSwgaW4g
ZnJhbWUgI1ggb2YgdGhyZWFkIDEKKyAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykgZm91bmQgZHVy
aW5nIGNsaWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHRlc3Rz
L3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiBmb28yICh0ZXN0cy92YXJpbmZv
NXNvLmM6NzMpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzJfbWFpbiAodGVzdHMvdmFyaW5m
bzVzby5jOjgxKQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3Zhcmlu
Zm81c28uYzoxNTUpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1
KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHgu
Li4uLi4uLjogZm9vMiAodmFyaW5mbzVzby5jOjczKQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmlu
Zm8yX21haW4gKHZhcmluZm81c28uYzo4MSkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9t
YWluICh2YXJpbmZvNXNvLmM6MTU1KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81
LmM6NSkKKyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAyIGJ5dGVzIGluc2lkZSB2YXIuYmFyLAor
ICBkZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6NzIsIGluIGZyYW1lICNYIG9mIHRocmVhZCAxCisg
CisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVz
dAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAg
YnkgMHguLi4uLi4uLjogZm9vMiAodGVzdHMvdmFyaW5mbzVzby5jOjc2KQorLSAgIGJ5IDB4Li4u
Li4uLi46IHZhcmluZm8yX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzo4MSkKKy0gICBieSAweC4u
Li4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU1KQorLSAgIGJ5IDB4
Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBj
cm9hayAodmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46IGZvbzIgKHZhcmluZm81
c28uYzo3NikKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvMl9tYWluICh2YXJpbmZvNXNvLmM6
ODEpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5jOjE1NSkK
KysgICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5jOjUpCisgIExvY2F0aW9uIDB4Li4u
Li4uLi4gaXMgMSBieXRlIGluc2lkZSBsb2NhbCB2YXIgInZhciIKKyAgZGVjbGFyZWQgYXQgdmFy
aW5mbzVzby5jOjY3LCBpbiBmcmFtZSAjWCBvZiB0aHJlYWQgMQorIAorIFVuaW5pdGlhbGlzZWQg
Ynl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAweC4uLi4u
Li4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46IGZv
bzMgKHRlc3RzL3ZhcmluZm81c28uYzoxMDYpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzNf
bWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjExOCkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZv
NV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTU2KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4g
KHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBhdCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5mbzVz
by5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46IGZvbzMgKHZhcmluZm81c28uYzoxMDYpCisrICAg
YnkgMHguLi4uLi4uLjogdmFyaW5mbzNfbWFpbiAodmFyaW5mbzVzby5jOjExOCkKKysgICBieSAw
eC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU2KQorKyAgIGJ5IDB4Li4u
Li4uLi46IG1haW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAwIGJ5
dGVzIGluc2lkZSBzdGF0aWNfZ2xvYmFsX2RlZlsxXSwKKyAgYSBnbG9iYWwgdmFyaWFibGUgZGVj
bGFyZWQgYXQgdmFyaW5mbzVzby5jOjg3CisgCisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5k
IGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0
ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogZm9vMyAodGVzdHMvdmFy
aW5mbzVzby5jOjEwNykKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvM19tYWluICh0ZXN0cy92
YXJpbmZvNXNvLmM6MTE4KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3Rz
L3ZhcmluZm81c28uYzoxNTYpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5m
bzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAg
YnkgMHguLi4uLi4uLjogZm9vMyAodmFyaW5mbzVzby5jOjEwNykKKysgICBieSAweC4uLi4uLi4u
OiB2YXJpbmZvM19tYWluICh2YXJpbmZvNXNvLmM6MTE4KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZh
cmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTYpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAo
dmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5zaWRlIG5v
bnN0YXRpY19nbG9iYWxfZGVmWzJdLAorICBhIGdsb2JhbCB2YXJpYWJsZSBkZWNsYXJlZCBhdCB2
YXJpbmZvNXNvLmM6ODgKKyAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNs
aWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHRlc3RzL3Zhcmlu
Zm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiBmb28zICh0ZXN0cy92YXJpbmZvNXNvLmM6
MTA4KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8zX21haW4gKHRlc3RzL3ZhcmluZm81c28u
YzoxMTgpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVz
by5jOjE1NikKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisr
ICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHZhcmluZm81c28uYzoyOSkKKysgICBieSAweC4uLi4u
Li4uOiBmb28zICh2YXJpbmZvNXNvLmM6MTA4KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm8z
X21haW4gKHZhcmluZm81c28uYzoxMTgpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFp
biAodmFyaW5mbzVzby5jOjE1NikKKysgICBieSAweC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5j
OjUpCisgIExvY2F0aW9uIDB4Li4uLi4uLi4gaXMgMCBieXRlcyBpbnNpZGUgc3RhdGljX2dsb2Jh
bF91bmRlZlszXSwKKyAgYSBnbG9iYWwgdmFyaWFibGUgZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5j
Ojg5CisgCisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5kIGR1cmluZyBjbGllbnQgY2hlY2sg
cmVxdWVzdAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0ZXN0cy92YXJpbmZvNXNvLmM6Mjkp
CistICAgYnkgMHguLi4uLi4uLjogZm9vMyAodGVzdHMvdmFyaW5mbzVzby5jOjEwOSkKKy0gICBi
eSAweC4uLi4uLi4uOiB2YXJpbmZvM19tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTE4KQorLSAg
IGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTYpCist
ICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4u
Li4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogZm9vMyAo
dmFyaW5mbzVzby5jOjEwOSkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvM19tYWluICh2YXJp
bmZvNXNvLmM6MTE4KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81
c28uYzoxNTYpCisrICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2Nh
dGlvbiAweC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5zaWRlIG5vbnN0YXRpY19nbG9iYWxfdW5kZWZb
NF0sCisgIGEgZ2xvYmFsIHZhcmlhYmxlIGRlY2xhcmVkIGF0IHZhcmluZm81c28uYzo5MAorIAor
IFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QK
Ky0gICBhdCAweC4uLi4uLi4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5
IDB4Li4uLi4uLi46IGJhcjMgKHRlc3RzL3ZhcmluZm81c28uYzo5NCkKKy0gICBieSAweC4uLi4u
Li4uOiBmb28zICh0ZXN0cy92YXJpbmZvNXNvLmM6MTEwKQorLSAgIGJ5IDB4Li4uLi4uLi46IHZh
cmluZm8zX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxMTgpCistICAgYnkgMHguLi4uLi4uLjog
dmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NikKKy0gICBieSAweC4uLi4uLi4u
OiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHZh
cmluZm81c28uYzoyOSkKKysgICBieSAweC4uLi4uLi4uOiBiYXIzICh2YXJpbmZvNXNvLmM6OTQp
CisrICAgYnkgMHguLi4uLi4uLjogZm9vMyAodmFyaW5mbzVzby5jOjExMCkKKysgICBieSAweC4u
Li4uLi4uOiB2YXJpbmZvM19tYWluICh2YXJpbmZvNXNvLmM6MTE4KQorKyAgIGJ5IDB4Li4uLi4u
Li46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTYpCisrICAgYnkgMHguLi4uLi4uLjog
bWFpbiAodmFyaW5mbzUuYzo1KQorICBBZGRyZXNzIDB4Li4uLi4uLi4gaXMgNSBieXRlcyBpbnNp
ZGUgZGF0YSBzeW1ib2wgInN0YXRpY19sb2NhbF9kZWYuWFhYWCIKKyAKKyBVbmluaXRpYWxpc2Vk
IGJ5dGUocykgZm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4u
Li4uLjogY3JvYWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiBi
YXIzICh0ZXN0cy92YXJpbmZvNXNvLmM6OTUpCistICAgYnkgMHguLi4uLi4uLjogZm9vMyAodGVz
dHMvdmFyaW5mbzVzby5jOjExMCkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvM19tYWluICh0
ZXN0cy92YXJpbmZvNXNvLmM6MTE4KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4g
KHRlc3RzL3ZhcmluZm81c28uYzoxNTYpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMv
dmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6Mjkp
CisrICAgYnkgMHguLi4uLi4uLjogYmFyMyAodmFyaW5mbzVzby5jOjk1KQorKyAgIGJ5IDB4Li4u
Li4uLi46IGZvbzMgKHZhcmluZm81c28uYzoxMTApCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5m
bzNfbWFpbiAodmFyaW5mbzVzby5jOjExOCkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9t
YWluICh2YXJpbmZvNXNvLmM6MTU2KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81
LmM6NSkKKyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAwIGJ5dGVzIGluc2lkZSBub25zdGF0aWNf
bG9jYWxfZGVmWzZdLAorICBkZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6MTAzLCBpbiBmcmFtZSAj
WCBvZiB0aHJlYWQgMQorIAorIFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcgY2xp
ZW50IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAweC4uLi4uLi4uOiBjcm9hayAodGVzdHMvdmFyaW5m
bzVzby5jOjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46IGJhcjMgKHRlc3RzL3ZhcmluZm81c28uYzo5
NikKKy0gICBieSAweC4uLi4uLi4uOiBmb28zICh0ZXN0cy92YXJpbmZvNXNvLmM6MTEwKQorLSAg
IGJ5IDB4Li4uLi4uLi46IHZhcmluZm8zX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxMTgpCist
ICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NikK
Ky0gICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHgu
Li4uLi4uLjogY3JvYWsgKHZhcmluZm81c28uYzoyOSkKKysgICBieSAweC4uLi4uLi4uOiBiYXIz
ICh2YXJpbmZvNXNvLmM6OTYpCisrICAgYnkgMHguLi4uLi4uLjogZm9vMyAodmFyaW5mbzVzby5j
OjExMCkKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvM19tYWluICh2YXJpbmZvNXNvLmM6MTE4
KQorKyAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTYpCisr
ICAgYnkgMHguLi4uLi4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBBZGRyZXNzIDB4Li4uLi4u
Li4gaXMgNyBieXRlcyBpbnNpZGUgZGF0YSBzeW1ib2wgInN0YXRpY19sb2NhbF91bmRlZi5YWFhY
IgorIAorIFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBmb3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJl
cXVlc3QKKy0gICBhdCAweC4uLi4uLi4uOiBjcm9hayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQor
LSAgIGJ5IDB4Li4uLi4uLi46IGJhcjMgKHRlc3RzL3ZhcmluZm81c28uYzo5NykKKy0gICBieSAw
eC4uLi4uLi4uOiBmb28zICh0ZXN0cy92YXJpbmZvNXNvLmM6MTEwKQorLSAgIGJ5IDB4Li4uLi4u
Li46IHZhcmluZm8zX21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxMTgpCistICAgYnkgMHguLi4u
Li4uLjogdmFyaW5mbzVfbWFpbiAodGVzdHMvdmFyaW5mbzVzby5jOjE1NikKKy0gICBieSAweC4u
Li4uLi4uOiBtYWluICh0ZXN0cy92YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4uLi4uLjogY3Jv
YWsgKHZhcmluZm81c28uYzoyOSkKKysgICBieSAweC4uLi4uLi4uOiBiYXIzICh2YXJpbmZvNXNv
LmM6OTcpCisrICAgYnkgMHguLi4uLi4uLjogZm9vMyAodmFyaW5mbzVzby5jOjExMCkKKysgICBi
eSAweC4uLi4uLi4uOiB2YXJpbmZvM19tYWluICh2YXJpbmZvNXNvLmM6MTE4KQorKyAgIGJ5IDB4
Li4uLi4uLi46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTYpCisrICAgYnkgMHguLi4u
Li4uLjogbWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlzIDAgYnl0
ZXMgaW5zaWRlIG5vbnN0YXRpY19sb2NhbF91bmRlZls4XSwKKyAgZGVjbGFyZWQgYXQgdmFyaW5m
bzVzby5jOjEwNSwgaW4gZnJhbWUgI1ggb2YgdGhyZWFkIDEKKyAKKyBVbmluaXRpYWxpc2VkIGJ5
dGUocykgZm91bmQgZHVyaW5nIGNsaWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4uLi4u
LjogY3JvYWsgKHRlc3RzL3ZhcmluZm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiBibGFo
NCAodGVzdHMvdmFyaW5mbzVzby5jOjEzNykKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNF9t
YWluICh0ZXN0cy92YXJpbmZvNXNvLmM6MTQ2KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81
X21haW4gKHRlc3RzL3ZhcmluZm81c28uYzoxNTcpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAo
dGVzdHMvdmFyaW5mbzUuYzo1KQorKyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNv
LmM6MjkpCisrICAgYnkgMHguLi4uLi4uLjogYmxhaDQgKHZhcmluZm81c28uYzoxMzcpCisrICAg
YnkgMHguLi4uLi4uLjogdmFyaW5mbzRfbWFpbiAodmFyaW5mbzVzby5jOjE0NikKKysgICBieSAw
eC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh2YXJpbmZvNXNvLmM6MTU3KQorKyAgIGJ5IDB4Li4u
Li4uLi46IG1haW4gKHZhcmluZm81LmM6NSkKKyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAxIGJ5
dGUgaW5zaWRlIGFbM10ueHl6enlbMjFdLmMxLAorICBkZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6
MTM1LCBpbiBmcmFtZSAjWCBvZiB0aHJlYWQgMQorIAorIFVuaW5pdGlhbGlzZWQgYnl0ZShzKSBm
b3VuZCBkdXJpbmcgY2xpZW50IGNoZWNrIHJlcXVlc3QKKy0gICBhdCAweC4uLi4uLi4uOiBjcm9h
ayAodGVzdHMvdmFyaW5mbzVzby5jOjI5KQorLSAgIGJ5IDB4Li4uLi4uLi46IGJsYWg0ICh0ZXN0
cy92YXJpbmZvNXNvLmM6MTM4KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm80X21haW4gKHRl
c3RzL3ZhcmluZm81c28uYzoxNDYpCistICAgYnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAo
dGVzdHMvdmFyaW5mbzVzby5jOjE1NykKKy0gICBieSAweC4uLi4uLi4uOiBtYWluICh0ZXN0cy92
YXJpbmZvNS5jOjUpCisrICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHZhcmluZm81c28uYzoyOSkK
KysgICBieSAweC4uLi4uLi4uOiBibGFoNCAodmFyaW5mbzVzby5jOjEzOCkKKysgICBieSAweC4u
Li4uLi4uOiB2YXJpbmZvNF9tYWluICh2YXJpbmZvNXNvLmM6MTQ2KQorKyAgIGJ5IDB4Li4uLi4u
Li46IHZhcmluZm81X21haW4gKHZhcmluZm81c28uYzoxNTcpCisrICAgYnkgMHguLi4uLi4uLjog
bWFpbiAodmFyaW5mbzUuYzo1KQorICBMb2NhdGlvbiAweC4uLi4uLi4uIGlzIDAgYnl0ZXMgaW5z
aWRlIGFbNV0uYm9uZywKKyAgZGVjbGFyZWQgYXQgdmFyaW5mbzVzby5jOjEzNSwgaW4gZnJhbWUg
I1ggb2YgdGhyZWFkIDEKKyAKKyBVbmluaXRpYWxpc2VkIGJ5dGUocykgZm91bmQgZHVyaW5nIGNs
aWVudCBjaGVjayByZXF1ZXN0CistICAgYXQgMHguLi4uLi4uLjogY3JvYWsgKHRlc3RzL3Zhcmlu
Zm81c28uYzoyOSkKKy0gICBieSAweC4uLi4uLi4uOiBibGFoNCAodGVzdHMvdmFyaW5mbzVzby5j
OjEzOSkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNF9tYWluICh0ZXN0cy92YXJpbmZvNXNv
LmM6MTQ2KQorLSAgIGJ5IDB4Li4uLi4uLi46IHZhcmluZm81X21haW4gKHRlc3RzL3ZhcmluZm81
c28uYzoxNTcpCistICAgYnkgMHguLi4uLi4uLjogbWFpbiAodGVzdHMvdmFyaW5mbzUuYzo1KQor
KyAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh2YXJpbmZvNXNvLmM6MjkpCisrICAgYnkgMHguLi4u
Li4uLjogYmxhaDQgKHZhcmluZm81c28uYzoxMzkpCisrICAgYnkgMHguLi4uLi4uLjogdmFyaW5m
bzRfbWFpbiAodmFyaW5mbzVzby5jOjE0NikKKysgICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9t
YWluICh2YXJpbmZvNXNvLmM6MTU3KQorKyAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHZhcmluZm81
LmM6NSkKKyAgTG9jYXRpb24gMHguLi4uLi4uLiBpcyAxIGJ5dGUgaW5zaWRlIGFbM10ueHl6enlb
MjFdLmMyWzJdLAorICBkZWNsYXJlZCBhdCB2YXJpbmZvNXNvLmM6MTM1LCBpbiBmcmFtZSAjWCBv
ZiB0aHJlYWQgMQorIAorIGFuc3dlciBpcyAwCisgVW5pbml0aWFsaXNlZCBieXRlKHMpIGZvdW5k
IGR1cmluZyBjbGllbnQgY2hlY2sgcmVxdWVzdAorLSAgIGF0IDB4Li4uLi4uLi46IGNyb2FrICh0
ZXN0cy92YXJpbmZvNXNvLmM6MjkpCistICAgYnkgMHguLi4uLi4uLjogZnVuX2MgKHRlc3RzL3Zh
cmluZm81c28uYzoxNjQpCistICAgYnkgMHguLi4uLi4uLjogZnVuX2IgKHRlc3RzL3ZhcmluZm81
c28uYzoxNjgpCistICAgYnkgMHguLi4uLi4uLjogZnVuX2EgKHRlc3RzL3ZhcmluZm81c28uYzox
NzIpCistICAgYnkgMHguLi4uLi4uLjogaW5saW5ldGVzdCAodGVzdHMvdmFyaW5mbzVzby5jOjE3
OCkKKy0gICBieSAweC4uLi4uLi4uOiB2YXJpbmZvNV9tYWluICh0ZXN0cy92YXJpbmZvNXNvLmM6
MTU4KQorLSAgIGJ5IDB4Li4uLi4uLi46IG1haW4gKHRlc3RzL3ZhcmluZm81LmM6NSkKKysgICBh
dCAweC4uLi4uLi4uOiBjcm9hayAodmFyaW5mbzVzby5jOjI5KQorKyAgIGJ5IDB4Li4uLi4uLi46
IGZ1bl9jICh2YXJpbmZvNXNvLmM6MTY0KQorKyAgIGJ5IDB4Li4uLi4uLi46IGZ1bl9iICh2YXJp
bmZvNXNvLmM6MTY4KQorKyAgIGJ5IDB4Li4uLi4uLi46IGZ1bl9hICh2YXJpbmZvNXNvLmM6MTcy
KQorKyAgIGJ5IDB4Li4uLi4uLi46IGlubGluZXRlc3QgKHZhcmluZm81c28uYzoxNzgpCisrICAg
YnkgMHguLi4uLi4uLjogdmFyaW5mbzVfbWFpbiAodmFyaW5mbzVzby5jOjE1OCkKKysgICBieSAw
eC4uLi4uLi4uOiBtYWluICh2YXJpbmZvNS5jOjUpCisgIEFkZHJlc3MgMHguLi4uLi4uLiBpcyBv
biB0aHJlYWQgMSdzIHN0YWNrCisgIGluIGZyYW1lICNYLCBjcmVhdGVkIGJ5IHZhcmluZm81X21h
aW4gKHZhcmluZm81c28uYzoxNTMpCisgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdmFsZ3JpbmQvdmFsZ3JpbmQvQWRkZWQtc3VwcG9ydC1mb3ItUFBDLWluc3RydWN0aW9ucy1t
ZmF0YnUtbWZhdGJsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdy
aW5kL0FkZGVkLXN1cHBvcnQtZm9yLVBQQy1pbnN0cnVjdGlvbnMtbWZhdGJ1LW1mYXRibC5wYXRj
aAppbmRleCA1MWNkMzUzMmQzLi5hODg2ZWIwYjk5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvQWRkZWQtc3VwcG9ydC1mb3ItUFBDLWluc3RydWN0
aW9ucy1tZmF0YnUtbWZhdGJsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxn
cmluZC92YWxncmluZC9BZGRlZC1zdXBwb3J0LWZvci1QUEMtaW5zdHJ1Y3Rpb25zLW1mYXRidS1t
ZmF0YmwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDBiZjRiMGFjMThkMWVhNDFiMzJhZDc4
MWQyMTRiMjk1Y2ExOTk4ZjMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE5MGJhMjk5
ZTZlZjNmN2I1MzM2MDU2NWYzZGVlODA0NTRmMTlmYTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBBbmVlc2ggQmFuc2FsIDxhbmVlc2guYmFuc2FsQGZyZWVzY2FsZS5jb20+CiBEYXRl
OiBNb24sIDIxIE5vdiAyMDExIDE3OjMxOjM5ICswNTMwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZGVk
IHN1cHBvcnQgZm9yIFBQQyBpbnN0cnVjdGlvbnMgbWZhdGJ1LCBtZmF0YmwuCkBAIC0xMCwxOCAr
MTAsMTggQEAgZGlzSW5zdHIocHBjKTogdW5oYW5kbGVkIGluc3RydWN0aW9uOiAweDdDMEY4MkE2
CiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9idWdzLmtkZS5vcmcvc2hvd19i
dWcuY2dpP2lkPTI4OTgzNl0KIAogU2lnbmVkLW9mZi1ieTogQW5lZXNoIEJhbnNhbCA8YW5lZXNo
LmJhbnNhbEBmcmVlc2NhbGUuY29tPgotLS0tCiAKLSBWRVgvcHJpdi9ndWVzdF9wcGNfZGVmcy5o
ICAgIHwgICAgMiArKwotIFZFWC9wcml2L2d1ZXN0X3BwY19oZWxwZXJzLmMgfCAgIDE4ICsrKysr
KysrKysrKysrKysrKwotIFZFWC9wcml2L2d1ZXN0X3BwY190b0lSLmMgICAgfCAgIDIyICsrKysr
KysrKysrKysrKysrKysrKysKLSAzIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDAg
ZGVsZXRpb25zKC0pCistLS0KKyBWRVgvcHJpdi9ndWVzdF9wcGNfZGVmcy5oICAgIHwgIDIgKysK
KyBWRVgvcHJpdi9ndWVzdF9wcGNfaGVscGVycy5jIHwgMTggKysrKysrKysrKysrKysrKysrCisg
VkVYL3ByaXYvZ3Vlc3RfcHBjX3RvSVIuYyAgICB8IDIyICsrKysrKysrKysrKysrKysrKysrKysK
KyAzIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL1ZFWC9w
cml2L2d1ZXN0X3BwY19kZWZzLmggYi9WRVgvcHJpdi9ndWVzdF9wcGNfZGVmcy5oCi1pbmRleCBk
ZDNjNjJlLi4xMWEzNGFhIDEwMDY0NAoraW5kZXggMjIwZmJmMS4uY2QyNTlmMyAxMDA2NDQKIC0t
LSBhL1ZFWC9wcml2L2d1ZXN0X3BwY19kZWZzLmgKICsrKyBiL1ZFWC9wcml2L2d1ZXN0X3BwY19k
ZWZzLmgKLUBAIC0xNDYsNiArMTQ2LDggQEAgZXh0ZXJuIFVJbnQgcHBjMzJnX2RpcnR5aGVscGVy
X01GU1BSXzI2OF8yNjkgKCBVSW50ICk7CitAQCAtMjMzLDYgKzIzMyw4IEBAIGV4dGVybiBVSW50
IHBwYzMyZ19kaXJ0eWhlbHBlcl9NRlNQUl8yNjhfMjY5ICggVUludCApOwogIAogIGV4dGVybiBV
SW50IHBwYzMyZ19kaXJ0eWhlbHBlcl9NRlNQUl8yODcgKCB2b2lkICk7CiAgCkBAIC0zMSwxMCAr
MzEsMTAgQEAgaW5kZXggZGQzYzYyZS4uMTFhMzRhYSAxMDA2NDQKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgVUludCB2RF9pZHgsIFVJbnQgc2gsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFVJbnQgc2hpZnRfcmlnaHQgKTsKIGRpZmYgLS1naXQg
YS9WRVgvcHJpdi9ndWVzdF9wcGNfaGVscGVycy5jIGIvVkVYL3ByaXYvZ3Vlc3RfcHBjX2hlbHBl
cnMuYwotaW5kZXggMTFhYTQyOC4uYjQ5ZWEzZiAxMDA2NDQKK2luZGV4IDI2MTFlNTIuLjcyYzM0
OWIgMTAwNjQ0CiAtLS0gYS9WRVgvcHJpdi9ndWVzdF9wcGNfaGVscGVycy5jCiArKysgYi9WRVgv
cHJpdi9ndWVzdF9wcGNfaGVscGVycy5jCi1AQCAtMTE5LDYgKzExOSwyNCBAQCBVSW50IHBwYzMy
Z19kaXJ0eWhlbHBlcl9NRlNQUl8yODcgKCB2b2lkICkKK0BAIC0xMTgsNiArMTE4LDI0IEBAIFVJ
bnQgcHBjMzJnX2RpcnR5aGVscGVyX01GU1BSXzI4NyAoIHZvaWQgKQogICMgIGVuZGlmCiAgfQog
IApAQCAtNjAsMTAgKzYwLDEwIEBAIGluZGV4IDExYWE0MjguLmI0OWVhM2YgMTAwNjQ0CiAgLyog
Q0FMTEVEIEZST00gR0VORVJBVEVEIENPREUgKi8KICAvKiBESVJUWSBIRUxQRVIgKHJlYWRzIGd1
ZXN0IHN0YXRlLCB3cml0ZXMgZ3Vlc3QgbWVtKSAqLwogZGlmZiAtLWdpdCBhL1ZFWC9wcml2L2d1
ZXN0X3BwY190b0lSLmMgYi9WRVgvcHJpdi9ndWVzdF9wcGNfdG9JUi5jCi1pbmRleCBmOGQyMjBk
Li4zN2M4OTc0IDEwMDY0NAoraW5kZXggZDA1Y2NlMy4uNzIzZTA2YSAxMDA2NDQKIC0tLSBhL1ZF
WC9wcml2L2d1ZXN0X3BwY190b0lSLmMKICsrKyBiL1ZFWC9wcml2L2d1ZXN0X3BwY190b0lSLmMK
LUBAIC01NjU3LDYgKzU2NTcsMjggQEAgc3RhdGljIEJvb2wgZGlzX3Byb2NfY3RsICggVmV4QWJp
SW5mbyogdmJpLCBVSW50IHRoZUluc3RyICkKK0BAIC0xMTg3NSw2ICsxMTg3NSwyOCBAQCBzdGF0
aWMgQm9vbCBkaXNfcHJvY19jdGwgKCBjb25zdCBWZXhBYmlJbmZvKiB2YmksIFVJbnQgcHJlZml4
LCBVSW50IHRoZUluc3RyICkKICAgICAgICAgICBicmVhazsKICAgICAgICB9CiAgCkBAIC05Miw1
ICs5MiwzIEBAIGluZGV4IGY4ZDIyMGQuLjM3Yzg5NzQgMTAwNjQ0CiAgICAgICAgZGVmYXVsdDoK
ICAgICAgICAgICB2ZXhfcHJpbnRmKCJkaXNfcHJvY19jdGwocHBjKShtZnNwcixTUFIpKDB4JXgp
XG4iLCBTUFIpOwogICAgICAgICAgIHJldHVybiBGYWxzZTsKLS0tIAotMS43LjAuNApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL2F2b2lkLW5lb24t
Zm9yLXRhcmdldHMtd2hpY2gtZG9uLXQtc3VwcG9ydC1pdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy92YWxncmluZC92YWxncmluZC9hdm9pZC1uZW9uLWZvci10YXJnZXRzLXdoaWNoLWRv
bi10LXN1cHBvcnQtaXQucGF0Y2gKaW5kZXggODJiODM0NDI3OS4uNzA0NDZmMmQyYiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL2F2b2lkLW5lb24t
Zm9yLXRhcmdldHMtd2hpY2gtZG9uLXQtc3VwcG9ydC1pdC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvYXZvaWQtbmVvbi1mb3ItdGFyZ2V0cy13aGlj
aC1kb24tdC1zdXBwb3J0LWl0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4ZmFjYzI5YzNj
NTZlNmNmOWNmZWY3MDk4NmNmNzM4NzYwNDRhM2ZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBmMzc0YjU0YjFlMzVjZGQxZjE1ODUwODY5YTFmYTBiOGFiMGM1MmZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQW5kcmUgTWNDdXJkeSA8YXJtY2N1cmR5QGdtYWlsLmNvbT4K
IERhdGU6IFR1ZSwgMTkgSmFuIDIwMTYgMTY6NDI6MzYgLTA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
YXZvaWQgbmVvbiBmb3IgdGFyZ2V0cyB3aGljaCBkb24ndCBzdXBwb3J0IGl0CkBAIC0xMSw2ICsx
MSw3IEBAIHN1cHBvcnQgbmVvbi4KIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczov
L2J1Z3Mua2RlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9NDU0MzQ2XQogCiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZSBNY0N1cmR5IDxhcm1jY3VyZHlAZ21haWwuY29tPgorCiAtLS0KICBtZW1jaGVjay90ZXN0
cy9zaC1tZW0tcmFuZG9tLmMgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCkBAIC0yOCw2ICsyOSwzIEBAIGluZGV4IGFlODIyNDguLjgxNmUxMzkg
MTAwNjQ0CiAgICAgICAgICAgICAgLyogT24gYXJtMzIsIG1hbnkgY29tcGlsZXJzIGdlbmVyYXRl
IGEgNjQtYml0IGZsb2F0IG1vdmUKICAgICAgICAgICAgICAgICB1c2luZyB0d28gMzIgYml0IGlu
dGVnZXIgcmVnaXN0ZXJzLCB3aGljaCBjb21wbGV0ZWx5CiAgICAgICAgICAgICAgICAgZGVmZWF0
cyB0aGlzIHRlc3QuICBIZW5jZSBmb3JjZSBhIDY0LWJpdCBORU9OIGxvYWQgYW5kCi0tLSAKLTEu
OS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmlu
ZC9maXhlZC1wZXJsLXBhdGgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQv
dmFsZ3JpbmQvZml4ZWQtcGVybC1wYXRoLnBhdGNoCmluZGV4IGI5ODA0ZTc0NTEuLmQ3Y2MwMTU1
ZWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC9m
aXhlZC1wZXJsLXBhdGgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5k
L3ZhbGdyaW5kL2ZpeGVkLXBlcmwtcGF0aC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmVh
YTViNjRjNjBkNTAxZmE5Y2Q1OWZkYzU2M2U1ZjViY2NmNjg4MiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gODA3NGVmNjRlYTg0ZjA0NDUwNTcyZTA1YmE5YjYwZGJjMzBjYmE2MiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFFpbmcgSGUgPHFpbmcuaGVAaW50ZWwuY29tPgog
RGF0ZTogVHVlLCAzMSBBdWcgMjAxMCAyMjo1MTo1OCArMDgwMAogU3ViamVjdDogW1BBVENIXSB2
YWxncmluZDogZml4IHBlcmwgc2NyaXB0cwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3MzOTB4X3ZlY19vcF90LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3MzOTB4X3ZlY19vcF90LnBhdGNoCmluZGV4IGJk
ZTEyNDFkYzcuLjAzYTE4YjMyMWYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92
YWxncmluZC92YWxncmluZC9zMzkweF92ZWNfb3BfdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvczM5MHhfdmVjX29wX3QucGF0Y2gKQEAgLTEsNyAr
MSw3IEBACi1Gcm9tIDgxNTRkMzhiYWM1Y2RiMzY3NWNmZGFmNTYyYWI5ZGEwMTk4OGIyNjMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGYwZjZhZThkN2YzYWJiMDRkODc4MDY2ZmY4YThl
NTM5OThlNjYzZmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBZaSBGYW4gWXUgPHlp
ZmFuLnl1QHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDE3IE1hciAyMDIxIDEyOjE2OjMxIC0w
NDAwCi1TdWJqZWN0OiBbUEFUQ0ggMTkvMjBdIHJlbW92ZSBzMzkweF92ZWNfb3BfdAorU3ViamVj
dDogW1BBVENIXSByZW1vdmUgczM5MHhfdmVjX29wX3QKIAogczM5MHhfdmVjX29wX3QgaXMgbm90
IG5lZWRlZCBhbnl3aGVyZSwgb25seSBlbGVtZW50cyBvZiBlbnVtIGFyZSBhY2Nlc3NlZAogcmVt
b3ZpbmcgaXQgZW5zdXJlcyB0aGF0IHZhbGdyaW5kIGNhbiBiZSBidWlsdCB3aXRoIC1mbm8tY29t
bW9uIG9wdGlvbgpAQCAtMTMsMTUgKzEzLDE2IEBAIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwog
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIAogU2lnbmVkLW9m
Zi1ieTogWWkgRmFuIFl1IDx5aWZhbi55dUB3aW5kcml2ZXIuY29tPgorCiAtLS0KICBWRVgvcHJp
di9ndWVzdF9zMzkwX2RlZnMuaCB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL1ZFWC9wcml2L2d1ZXN0X3MzOTBfZGVm
cy5oIGIvVkVYL3ByaXYvZ3Vlc3RfczM5MF9kZWZzLmgKLWluZGV4IDkwNTQyOTAuLmRhYjgwMDIg
MTAwNjQ0CitpbmRleCAyNGYzNzk4Li43YjhiZTc4IDEwMDY0NAogLS0tIGEvVkVYL3ByaXYvZ3Vl
c3RfczM5MF9kZWZzLmgKICsrKyBiL1ZFWC9wcml2L2d1ZXN0X3MzOTBfZGVmcy5oCi1AQCAtMjg0
LDcgKzI4NCw3IEBAIHR5cGVkZWYgZW51bSB7CitAQCAtMjc5LDcgKzI3OSw3IEBAIHR5cGVkZWYg
ZW51bSB7CiAgICAgUzM5MF9WRUNfT1BfVkJQRVJNLAogICAgIFMzOTBfVkVDX09QX1ZNU0wsCiAg
ICAgUzM5MF9WRUNfT1BfTEFTVCAgICAgICAgICAgICAvLyBzdXBwb3NlZCB0byBiZSB0aGUgbGFz
dCBlbGVtZW50IGluIGVudW0KQEAgLTMwLDYgKzMxLDMgQEAgaW5kZXggOTA1NDI5MC4uZGFiODAw
MiAxMDA2NDQKICAKICAvKiBBcmd1bWVudHMgb2YgczM5MHhfZGlydHloZWxwZXJfdmVjX29wKC4u
Likgd2hpY2ggYXJlIHBhY2tlZCBpbnRvIG9uZQogICAgIFVMb25nIHZhcmlhYmxlLgotLS0gCi0y
LjI5LjIKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdy
aW5kL3VzZS1hcHByb3ByaWF0ZS1tYXJjaC1tY3B1LW1mcHUtZm9yLUFSTS10ZXN0LWFwcHMucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvdXNlLWFwcHJvcHJp
YXRlLW1hcmNoLW1jcHUtbWZwdS1mb3ItQVJNLXRlc3QtYXBwcy5wYXRjaAppbmRleCBmMTVkMDRi
MTczLi44MjEyYjk0NWY1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3Jp
bmQvdmFsZ3JpbmQvdXNlLWFwcHJvcHJpYXRlLW1hcmNoLW1jcHUtbWZwdS1mb3ItQVJNLXRlc3Qt
YXBwcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQv
dXNlLWFwcHJvcHJpYXRlLW1hcmNoLW1jcHUtbWZwdS1mb3ItQVJNLXRlc3QtYXBwcy5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gZDEzNGRhZmMyZjExZTBkMjQ3NDIwYTBiYTM2MGJjZGVmNzdi
NDA5MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODE3YzYxMzc1YTU0OWIwYzNhMTJh
OGMzN2IzZDRmMzg4YWQ5NzliZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJl
IE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDE5IEphbiAyMDE2IDE2
OjAwOjAwIC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHVzZSBhcHByb3ByaWF0ZSAtbWFyY2gvLW1j
cHUvLW1mcHUgZm9yIEFSTSB0ZXN0IGFwcHMKQEAgLTE4LDE1ICsxOCwxNiBAQCBTZWUgc2ltaWxh
ciBjYXNlcyBpbiBub25lL3Rlc3RzL2FybS9NYWtlZmlsZS5hbQogVXBzdHJlYW0tU3RhdHVzOiBT
dWJtaXR0ZWQgW2h0dHBzOi8vYnVncy5rZGUub3JnL3Nob3dfYnVnLmNnaT9pZD00NTQzNDZdCiAK
IFNpZ25lZC1vZmYtYnk6IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+CisKIC0t
LQogIG5vbmUvdGVzdHMvYXJtL01ha2VmaWxlLmFtIHwgNiArKysrLS0KICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbm9uZS90
ZXN0cy9hcm0vTWFrZWZpbGUuYW0gYi9ub25lL3Rlc3RzL2FybS9NYWtlZmlsZS5hbQotaW5kZXgg
NDUwN2EyMC4uODI1MjkwZiAxMDA2NDQKK2luZGV4IDQ3NzZlYTcuLmIzMzdkNzcgMTAwNjQ0CiAt
LS0gYS9ub25lL3Rlc3RzL2FybS9NYWtlZmlsZS5hbQogKysrIGIvbm9uZS90ZXN0cy9hcm0vTWFr
ZWZpbGUuYW0KLUBAIC02Miw4ICs2MiwxMCBAQCBuZW9uNjRfQ0ZMQUdTICAgICA9ICQoQU1fQ0ZM
QUdTKSAtZyAtTzAgLW1jcHU9Y29ydGV4LWE4IFwKK0BAIC04NSw4ICs4NSwxMCBAQCBuZW9uNjRf
Q0ZMQUdTICAgICA9ICQoQU1fQ0ZMQUdTKSAtZyAtTzAgLW1jcHU9Y29ydGV4LWE4IFwKICAJCQkt
bWZwdT1uZW9uIFwKICAJCQktbXRodW1iCiAgCkBAIC0zOSw2ICs0MCwzIEBAIGluZGV4IDQ1MDdh
MjAuLjgyNTI5MGYgMTAwNjQ0CiArdmN2dF9maXhlZF9mbG9hdF9WRlBfQ0ZMQUdTID0gJChBTV9D
RkxBR1MpIC1nIC1tY3B1PWNvcnRleC1hOCAtbWZwdT12ZnB2MwogKwogK3ZmcHY0X2ZtYV9DRkxB
R1MgID0gJChBTV9DRkxBR1MpIC1nIC1PMCAtbWFyY2g9YXJtdjd2ZSAtbWNwdT1jb3J0ZXgtYTE1
IC1tZnB1PXZmcHY0IC1tYXJtCi0tLSAKLTEuOS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC92YWxncmluZC1tYWtlLWxkLVhYWC5zby1zdHJs
ZW4taW50ZXJjZXB0LW9wdGlvbmFsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdy
aW5kL3ZhbGdyaW5kL3ZhbGdyaW5kLW1ha2UtbGQtWFhYLnNvLXN0cmxlbi1pbnRlcmNlcHQtb3B0
aW9uYWwucGF0Y2gKaW5kZXggZDA0Mjk3ZGNhOC4uNDcwNzlhMDc1NyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3ZhbGdyaW5kLW1ha2UtbGQtWFhY
LnNvLXN0cmxlbi1pbnRlcmNlcHQtb3B0aW9uYWwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3ZhbGdyaW5kLW1ha2UtbGQtWFhYLnNvLXN0cmxlbi1p
bnRlcmNlcHQtb3B0aW9uYWwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDAwNWJkMTE4MDlh
MWNlNjVlOWYyYzI4ZTg4NDM1NGE0NzQxNjUwYjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGQ0NGE1OTY0ZWRiOTVhY2FkMTUyMmZkZTJiOWYwMTVlNDBkZGI5ZTUgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZSBNY0N1cmR5IDxhcm1jY3VyZHlAZ21haWwuY29tPgog
RGF0ZTogVHVlLCAxMyBEZWMgMjAxNiAxMToyOTo1NSArMDgwMAogU3ViamVjdDogW1BBVENIXSBt
YWtlIGxkLVhYWC5zbyBzdHJsZW4gaW50ZXJjZXB0IG9wdGlvbmFsCkBAIC0xMiwxNSArMTIsMTYg
QEAgVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlCiAKIFNpZ25lZC1vZmYtYnk6IEFuZHJl
IE1jQ3VyZHkgPGFybWNjdXJkeUBnbWFpbC5jb20+CiBTaWduZWQtb2ZmLWJ5OiBKYWNraWUgSHVh
bmcgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPgorCiAtLS0KICBjb3JlZ3JpbmQvbV9yZWRp
ci5jIHwgMTMgKysrKysrKysrKysrLQogIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9jb3JlZ3JpbmQvbV9yZWRpci5jIGIvY29y
ZWdyaW5kL21fcmVkaXIuYwotaW5kZXggZmYzNTAwOS4uZDdkNjgxNiAxMDA2NDQKK2luZGV4IGNl
ZjI0MWIuLjBhN2RjNWYgMTAwNjQ0CiAtLS0gYS9jb3JlZ3JpbmQvbV9yZWRpci5jCiArKysgYi9j
b3JlZ3JpbmQvbV9yZWRpci5jCi1AQCAtMTI3NSw3ICsxMjc1LDE4IEBAIHN0YXRpYyB2b2lkIGFk
ZF9oYXJkd2lyZWRfc3BlYyAoY29uc3QgIEhDaGFyKiBzb3BhdHQsIGNvbnN0IEhDaGFyKiBmbnBh
dHQsCitAQCAtMTMwNyw3ICsxMzA3LDE4IEBAIHN0YXRpYyB2b2lkIGFkZF9oYXJkd2lyZWRfc3Bl
YyAoY29uc3QgIEhDaGFyKiBzb3BhdHQsIGNvbnN0IEhDaGFyKiBmbnBhdHQsCiAgICAgc3BlYy0+
dG9fYWRkciAgICAgPSB0b19hZGRyOwogICAgIHNwZWMtPmlzV3JhcCAgICAgID0gRmFsc2U7CiAg
ICAgc3BlYy0+aXNHbG9iYWwgICAgPSBGYWxzZTsKQEAgLTQwLDYgKzQxLDMgQEAgaW5kZXggZmYz
NTAwOS4uZDdkNjgxNiAxMDA2NDQKICAgICAvKiBWQVJJQUJMRSBQQVJUUyAqLwogICAgIHNwZWMt
Pm1hcmsgICAgICAgID0gRmFsc2U7IC8qIG5vdCBzaWduaWZpY2FudCAqLwogICAgIHNwZWMtPmRv
bmUgICAgICAgID0gRmFsc2U7IC8qIG5vdCBzaWduaWZpY2FudCAqLwotLS0gCi0xLjkuMQotCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmRfMy4yMS4w
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kXzMuMjIuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFs
Z3JpbmQvdmFsZ3JpbmRfMy4yMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dmFsZ3JpbmQvdmFsZ3JpbmRfMy4yMi4wLmJiCmluZGV4IDY3YTE5N2M1MDkuLjYxMmJlYzE5MGIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZF8zLjIx
LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kXzMuMjIu
MC5iYgpAQCAtMzYsOSArMzYsOSBAQCBTUkNfVVJJID0gImh0dHBzOi8vc291cmNld2FyZS5vcmcv
cHViL3ZhbGdyaW5kL3ZhbGdyaW5kLSR7UFZ9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8v
MDAwMS1ub25lLXRlc3RzLWZkbGVha19jbXNnLnN0ZGVyci5leHAtYWRqdXN0LXRtcC1wYXRocy5w
YXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLW1lbWNoZWNrLXRlc3RzLUZpeC10aW1lcmZk
LXN5c2NhbGwtdGVzdC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWRvY3MtRGlzYWJs
ZS1tYW51YWwtdmFsaWRhdGlvbi5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLW5vbmUt
dGVzdHMteDg2LWxpbnV4LXNlZ19vdmVycmlkZS5jLWFkZC1taXNzaW5nLWluY2wucGF0Y2ggXAor
ICAgICAgICAgICBmaWxlOi8vMDAyMC1Db21taXR0aW5nLWNoYW5nZXMtZnJvbS1kb19wYXRjaC5w
YXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxMGNlMTYxOGJiM2Uz
M2ZhZDE2ZWI3OTU1MmIwYTNlMTIxMTc2MjQ0OGEwZDdmY2UxMWM4YTYyNDNiOWFjOTcxIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImM4MTFkYjVhZGQyYzVmNzI5OTQ0Y2FmNDdjNGU3YTY1ZGNhYWJi
OTQ2MWU0NzJiNTc4NzY1ZGQ3YmY2ZDJkNGMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJ2YWxn
cmluZC0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAogQ09NUEFUSUJMRV9IT1NUID0gJyhp
Ljg2fHg4Nl82NHxhcm18YWFyY2g2NHxtaXBzfHBvd2VycGN8cG93ZXJwYzY0KS4qLWxpbnV4Jwot
LSAKMi40Mi4wCgo=

--===============3103970665179177515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1858 entries from dependency cache.
Parsing recipes...done.
Parsing of 914 .bb files complete (913 cached, 1 parsed). 1857 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-4ad48edfdfb184aaa2aa55ea16660f991ba01f61"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4ad48edfdfb184aaa2aa55ea16660f991ba01f61"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 453 Local 439 Mirrors 0 Missed 14 Current 566 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 674 of 1019 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe valgrind-3.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe valgrind-3.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1597 of 2760 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_fetch)
NOTE: recipe valgrind-3.22.0-r0: task do_fetch: Started
NOTE: recipe valgrind-3.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 2079 of 2760 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_unpack)
NOTE: Running task 2080 of 2760 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe valgrind-3.22.0-r0: task do_unpack: Started
NOTE: recipe valgrind-3.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe valgrind-3.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe valgrind-3.22.0-r0: task do_unpack: Succeeded
NOTE: Running task 2741 of 2760 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_patch)
NOTE: Running task 2742 of 2760 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_collect_spdx_deps)
NOTE: recipe valgrind-3.22.0-r0: task do_patch: Started
NOTE: recipe valgrind-3.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe valgrind-3.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe valgrind-3.22.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 2742 tasks of which 2737 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215112951.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240215112951.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_patch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: valgrind-3.22.0-r0 do_patch: QA Issue: Missing Upstream-Status in patch
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind/0020-Committing-changes-from-do_patch.patch
Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
ERROR: valgrind-3.22.0-r0 do_patch: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/valgrind/3.22.0/temp/log.do_patch.2312742
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb:do_patch) failed with exit code '1'

--===============3103970665179177515==--

