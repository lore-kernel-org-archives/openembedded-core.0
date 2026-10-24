Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1832.1792822999272939115
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 23:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eruXsyZu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mu9dgkub;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a16c93f61f-87c7984b-3e9b-4ea3-aa70-64f42d8e00df-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792822998;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ksFPnWbDrLfGeGkUozu9GylklKs2bfZGdh+C2g1ab18=;
	b=eruXsyZuVtr+kK55Z2Tb3jp7MXxw4w+tZjBJx994zAClM8NWZSBrL4XyP6CVmSU0
	/IHnjaK6jbfvjj+RDcmd5ZKZzV3TPkN6FGAy0x1+FtEMzF0Jjbkf2AWp02ST9GT1pYE
	SGJce5QSHFVnqabWhKWtJvGu0oKo0nxJ53ETrw3M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792822998;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ksFPnWbDrLfGeGkUozu9GylklKs2bfZGdh+C2g1ab18=;
	b=mu9dgkubbJKlzRQnqVVY8aCWClMXg9QMgHLH5c6Spe0K8lmldW0JyS8f2HLg9102
	vtC/7w0iEgtcH7wbMGyYRCjQXvsGqRymF1nVtoHoJMadhAdRsBZpyz4cvPs7IevCOIE
	Mf5eKtL3Rq+2VYa9tSx9fGtE+hG9a0575cQa61IM=
Content-Type: multipart/mixed; boundary="===============1279514540360809310=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] valgrind: upgrading to 3.28.0 FAILED
Message-ID: <010101a16c93f61f-87c7984b-3e9b-4ea3-aa70-64f42d8e00df-000000@us-west-2.amazonses.com>
Date: Sat, 24 Oct 2026 06:23:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.24-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 06:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248580

--===============1279514540360809310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *valgrind* to *3.28.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-valgrind-upgrade-3.27.1-3.28.0.patch
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
From 48a3b71dfdb5e5f754d45d487663ae9ca8f1c945 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 24 Oct 2026 05:30:42 +0000
Subject: [PATCH] valgrind: upgrade 3.27.1 -> 3.28.0

Release 3.28.0 (23 Oct 2026)
This release supports X86/Linux, AMD64/Linux, ARM32/Linux, ARM64/Linux,
PPC32/Linux, PPC64BE/Linux, PPC64LE/Linux, S390X/Linux, MIPS32/Linux,
MIPS64/Linux, RISCV64/Linux, ARM/Android, ARM64/Android, MIPS32/Android,
X86/Android, X86/Solaris, AMD64/Solaris, X86/macOS, AMD64/macOS.
X86/FreeBSD, AMD64/FreeBSD and ARM64/FreeBSD. There is preliminary support
for nanoMIPS/Linux. macOS is supported up to version 13 Ventura (amd64 only).

  - VALGRIND_RUNNING_VERSION returns the Valgrind version that
    the guest executable is running under. The value returned
    is a decimal value in the form Mmm where M is the major
    version and mm is the minor version. For instance, this
    release returns 328. Returns 0 if the executable is not
    running under Valgrind, or is running under a version older
    than 3.28.

  under valgrind. By default, Valgrind can handle to up to 8000 madvise
  the --max-threads setting (which defaults to 500) times 16.
517144  Add PACKUSDW SSE4.1 support for x86
519223  Recognize ioctl(UFFDIO_*) operations
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
 .../{valgrind_3.27.1.bb => valgrind_3.28.0.bb}       |  2 +-
 18 files changed, 48 insertions(+), 50 deletions(-)
 rename meta/recipes-devtools/valgrind/{valgrind_3.27.1.bb => valgrind_3.28.0.bb} (98%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch b/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
index 3c8bec82b3..105a2c3995 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
@@ -1,4 +1,4 @@
-From 5a776e61af5ab7f0cfd10cde55c796189686916f Mon Sep 17 00:00:00 2001
+From d8ebc7316648ad5880ef91c58ff88a21bbf33a3b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 10 May 2024 16:27:34 -0700
 Subject: [PATCH] configure: Drop setting mcpu=cortex-a8 on arm
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2dfbd1c..b42fdd4 100755
+index 60c3861..fcfe8e2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -251,13 +251,13 @@ case "${host_cpu}" in
+@@ -309,13 +309,13 @@ case "${host_cpu}" in
  
       armv8*)
          AC_MSG_RESULT([ok (${host_cpu})])
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
index fbd799eeea..0111d5708e 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
@@ -1,4 +1,4 @@
-From 4f674f458b1f0675abdc0ced01239e99bfa40de8 Mon Sep 17 00:00:00 2001
+From b5f080fac99a060ff5bbd97ee6c84e8b92a57365 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Jan 2022 18:26:02 -0800
 Subject: [PATCH] docs: Disable manual validation
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/docs/Makefile.am b/docs/Makefile.am
-index 68a3da5..9833d5c 100644
+index 8b3f55c..61a6e45 100644
 --- a/docs/Makefile.am
 +++ b/docs/Makefile.am
-@@ -202,7 +202,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
+@@ -225,7 +225,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
  	  fi \
  	fi
  
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch b/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch
index 6afb6d79de..9889a06c62 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch
@@ -1,7 +1,7 @@
-From 8c2313226de5171dd6724c1878a679b556b6cab4 Mon Sep 17 00:00:00 2001
+From 286f86a330efc0d38bb60cc47e9163cc2783f310 Mon Sep 17 00:00:00 2001
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
index f8d1e87ba9..866dee3165 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
@@ -1,4 +1,4 @@
-From c878aaacadf8ec723be882f9335cb33240df13d6 Mon Sep 17 00:00:00 2001
+From 95f0afde244178821847030ea3efd1996c9f9142 Mon Sep 17 00:00:00 2001
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
index 200b2602cb..e362ae6f88 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
@@ -1,4 +1,4 @@
-From 3a51ed107f67732910dec12279a9279e158afbe7 Mon Sep 17 00:00:00 2001
+From 7676a737160ddd450b2d22f7f96d7f445c65cabb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 9 Mar 2020 16:30:19 -0700
 Subject: [PATCH] memcheck/tests: Fix timerfd syscall test
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 15 insertions(+), 3 deletions(-)
 
 diff --git a/config.h.in b/config.h.in
-index 00db1a6..23fd77a 100644
+index 7db71e8..8800fc9 100644
 --- a/config.h.in
 +++ b/config.h.in
-@@ -409,6 +409,9 @@
+@@ -442,6 +442,9 @@
  /* Define to 1 if you have the <sys/sysnvl.h> header file. */
  #undef HAVE_SYS_SYSNVL_H
  
@@ -30,10 +30,10 @@ index 00db1a6..23fd77a 100644
  #undef HAVE_SYS_TIME_H
  
 diff --git a/configure.ac b/configure.ac
-index b42fdd4..ec95146 100755
+index fcfe8e2..33acca6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4892,6 +4892,7 @@ AC_CHECK_HEADERS([       \
+@@ -5334,6 +5334,7 @@ AC_CHECK_HEADERS([       \
          sys/syscall.h    \
          sys/sysnvl.h     \
          sys/time.h       \
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
index 9a3596cac1..3d6f80c6c2 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
@@ -1,4 +1,4 @@
-From b703b0d11adc9147a7d97817bd771ac40b8c4d39 Mon Sep 17 00:00:00 2001
+From 2ebd36d1190bb16ff537ab2189802c025803b116 Mon Sep 17 00:00:00 2001
 From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
 Date: Wed, 16 Sep 2020 13:45:07 -0400
 Subject: [PATCH] memcheck vgtests remove fullpath-after flags
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
index 7deca99202..9e2f179252 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
@@ -1,4 +1,4 @@
-From bbb5e8a6fc5eec178f8077ab006ab42c009528d4 Mon Sep 17 00:00:00 2001
+From e0efed171478290f06a186b809b4de1d30b69035 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 24 Jan 2020 17:55:39 +0100
 Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
index efa6c2c895..a020d30ec8 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
@@ -1,4 +1,4 @@
-From c287382a1f3dd9f2db3df54dde54b4b266791bb9 Mon Sep 17 00:00:00 2001
+From 951319748b6e60615fdf12a59c6df56a25e39cdd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 00:46:39 -0700
 Subject: [PATCH] sigqueue: Rename _sifields to __si_fields on musl
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
index 3eea195579..b1a27dfee3 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
@@ -1,4 +1,4 @@
-From 8087ae8dcc46f3f81af58ed9b7176761b988ee61 Mon Sep 17 00:00:00 2001
+From 12fec29880ae4b1ce8ac98f6fa54323264ecdd11 Mon Sep 17 00:00:00 2001
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
index c64c2afd3f..686f6b2692 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
@@ -1,4 +1,4 @@
-From f8fbebcf69e4a8bf2122b7c55f2ce372377af1bc Mon Sep 17 00:00:00 2001
+From 0965cb629d9fe745e4b903510345178c81523118 Mon Sep 17 00:00:00 2001
 From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Mon, 13 May 2019 17:12:21 -0400
 Subject: [PATCH] valgrind: filter_xml_frames: do not filter /usr
diff --git a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
index 3acb5a28f4..71196df8a3 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
@@ -1,4 +1,4 @@
-From de4d7e478515b63f049b211266d9b946c15cc0b9 Mon Sep 17 00:00:00 2001
+From 3dcfafff80f37b65153f100bccf09ac8092dced1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 01:03:17 -0700
 Subject: [PATCH] correct include directive path for config.h
diff --git a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
index 109caf76ab..f6589fffdb 100644
--- a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
@@ -1,4 +1,4 @@
-From 85bff993087cd7367ffc35de525c2bf6162398d2 Mon Sep 17 00:00:00 2001
+From 492d4c3cfcd57edd5610ab355ab9f9ba901c6edc Mon Sep 17 00:00:00 2001
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
+index dbeba05..1e51b40 100644
 --- a/VEX/priv/guest_ppc_toIR.c
 +++ b/VEX/priv/guest_ppc_toIR.c
-@@ -11875,6 +11875,28 @@ static Bool dis_proc_ctl ( const VexAbiInfo* vbi, UInt prefix, UInt theInstr )
+@@ -11864,6 +11864,28 @@ static Bool dis_proc_ctl ( const VexAbiInfo* vbi, UInt prefix, UInt theInstr )
           break;
        }
  
diff --git a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
index 1597b3a021..57c242dddc 100644
--- a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
@@ -1,4 +1,4 @@
-From 596372bc9b4d31bc9811881cfa747d99a8c25141 Mon Sep 17 00:00:00 2001
+From 0bd621fdd5a211369c30136b4b1408e5ea3748d3 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 19 Jan 2016 16:42:36 -0800
 Subject: [PATCH] avoid neon for targets which don't support it
diff --git a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
index 6bfc6035ed..4f9c74efdb 100644
--- a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
@@ -1,4 +1,4 @@
-From 408f9b39ca4f5709b668f13829a94c4cae855006 Mon Sep 17 00:00:00 2001
+From d39ee9960e306aabe707f3a8a1416e39b983ab79 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 31 Aug 2010 22:51:58 +0800
 Subject: [PATCH] valgrind: fix perl scripts
@@ -24,7 +24,7 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/massif/ms_print.in b/massif/ms_print.in
-index a206ce4..df1bc31 100755
+index d97b878..b4a762f 100644
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
index 19690e5ebb..9b4bfd2a87 100644
--- a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
@@ -1,4 +1,4 @@
-From 8c92089741d809cfd18354f1b4df18cd28398a20 Mon Sep 17 00:00:00 2001
+From dcb40da8ebf6ad6fe1ab308973c7896717f7e199 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Wed, 17 Mar 2021 12:16:31 -0400
 Subject: [PATCH] remove s390x_vec_op_t
@@ -18,10 +18,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/VEX/priv/guest_s390_defs.h b/VEX/priv/guest_s390_defs.h
-index 29efa01..3a8f0a0 100644
+index 5c87d2b..9210822 100644
 --- a/VEX/priv/guest_s390_defs.h
 +++ b/VEX/priv/guest_s390_defs.h
-@@ -285,7 +285,7 @@ typedef enum {
+@@ -281,7 +281,7 @@ typedef enum {
     S390_VEC_OP_VCLFNL,
     S390_VEC_OP_VCRNF,
     S390_VEC_OP_LAST             // supposed to be the last element in enum
diff --git a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
index 0c18a63c2b..a258eba914 100644
--- a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
@@ -1,4 +1,4 @@
-From a5cd00f1c2d78e2a15f4a0c595f5ac10ca4c3290 Mon Sep 17 00:00:00 2001
+From 9578dae640073ae06df6a1c2c77c9263f2d0b85b Mon Sep 17 00:00:00 2001
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
index ca7f721d9c..73c386ce44 100644
--- a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
@@ -1,4 +1,4 @@
-From b407514aa1a4fd3667b30527260e271da34ce4a7 Mon Sep 17 00:00:00 2001
+From 5726038404bbfd795d4878a77b07f5154bede977 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.27.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.28.0.bb
similarity index 98%
rename from meta/recipes-devtools/valgrind/valgrind_3.27.1.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.28.0.bb
index 829b6c96a8..b9d421ffd3 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.27.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.28.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-tests-arm-Use-O-instead-of-O0.patch \
            file://0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch \
            "
-SRC_URI[sha256sum] = "5d589152eb8071c02feab8ce6ab719e431a1fbc3e2b1700f5432632a8b9264dc"
+SRC_URI[sha256sum] = "9f7a18d128f05d3a80fea53e6953f34aad7200a425ceaee46099a8a798a7dd9c"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64|riscv64).*-linux'
-- 
2.47.1


--===============1279514540360809310==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-valgrind-upgrade-3.27.1-3.28.0.patch"

RnJvbSA0OGEzYjcxZGZkYjVlNWY3NTRkNDVkNDg3NjYzYWU5Y2E4ZjFjOTQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjQgT2N0IDIwMjYgMDU6MzA6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
YWxncmluZDogdXBncmFkZSAzLjI3LjEgLT4gMy4yOC4wCgpSZWxlYXNlIDMuMjguMCAoMjMgT2N0
IDIwMjYpClRoaXMgcmVsZWFzZSBzdXBwb3J0cyBYODYvTGludXgsIEFNRDY0L0xpbnV4LCBBUk0z
Mi9MaW51eCwgQVJNNjQvTGludXgsClBQQzMyL0xpbnV4LCBQUEM2NEJFL0xpbnV4LCBQUEM2NExF
L0xpbnV4LCBTMzkwWC9MaW51eCwgTUlQUzMyL0xpbnV4LApNSVBTNjQvTGludXgsIFJJU0NWNjQv
TGludXgsIEFSTS9BbmRyb2lkLCBBUk02NC9BbmRyb2lkLCBNSVBTMzIvQW5kcm9pZCwKWDg2L0Fu
ZHJvaWQsIFg4Ni9Tb2xhcmlzLCBBTUQ2NC9Tb2xhcmlzLCBYODYvbWFjT1MsIEFNRDY0L21hY09T
LgpYODYvRnJlZUJTRCwgQU1ENjQvRnJlZUJTRCBhbmQgQVJNNjQvRnJlZUJTRC4gVGhlcmUgaXMg
cHJlbGltaW5hcnkgc3VwcG9ydApmb3IgbmFub01JUFMvTGludXguIG1hY09TIGlzIHN1cHBvcnRl
ZCB1cCB0byB2ZXJzaW9uIDEzIFZlbnR1cmEgKGFtZDY0IG9ubHkpLgoKICAtIFZBTEdSSU5EX1JV
Tk5JTkdfVkVSU0lPTiByZXR1cm5zIHRoZSBWYWxncmluZCB2ZXJzaW9uIHRoYXQKICAgIHRoZSBn
dWVzdCBleGVjdXRhYmxlIGlzIHJ1bm5pbmcgdW5kZXIuIFRoZSB2YWx1ZSByZXR1cm5lZAogICAg
aXMgYSBkZWNpbWFsIHZhbHVlIGluIHRoZSBmb3JtIE1tbSB3aGVyZSBNIGlzIHRoZSBtYWpvcgog
ICAgdmVyc2lvbiBhbmQgbW0gaXMgdGhlIG1pbm9yIHZlcnNpb24uIEZvciBpbnN0YW5jZSwgdGhp
cwogICAgcmVsZWFzZSByZXR1cm5zIDMyOC4gUmV0dXJucyAwIGlmIHRoZSBleGVjdXRhYmxlIGlz
IG5vdAogICAgcnVubmluZyB1bmRlciBWYWxncmluZCwgb3IgaXMgcnVubmluZyB1bmRlciBhIHZl
cnNpb24gb2xkZXIKICAgIHRoYW4gMy4yOC4KCiAgdW5kZXIgdmFsZ3JpbmQuIEJ5IGRlZmF1bHQs
IFZhbGdyaW5kIGNhbiBoYW5kbGUgdG8gdXAgdG8gODAwMCBtYWR2aXNlCiAgdGhlIC0tbWF4LXRo
cmVhZHMgc2V0dGluZyAod2hpY2ggZGVmYXVsdHMgdG8gNTAwKSB0aW1lcyAxNi4KNTE3MTQ0ICBB
ZGQgUEFDS1VTRFcgU1NFNC4xIHN1cHBvcnQgZm9yIHg4Ngo1MTkyMjMgIFJlY29nbml6ZSBpb2N0
bChVRkZESU9fKikgb3BlcmF0aW9ucwotLS0KIC4uLm9uZmlndXJlLURyb3Atc2V0dGluZy1tY3B1
LWNvcnRleC1hOC1vbi1hcm0ucGF0Y2ggfCAgNiArKystLS0KIC4uLi8wMDAxLWRvY3MtRGlzYWJs
ZS1tYW51YWwtdmFsaWRhdGlvbi5wYXRjaCAgICAgICAgfCAgNiArKystLS0KIC4uLmZpbHRlci5j
LXdvcmthcm91bmQtb2ZmNjRfdC1ub3QtZGVmaW5lZC1pbi0ucGF0Y2ggfCAgOCArKystLS0tLQog
Li4uLURyb3Atc2V0dGluZy1tY3B1LXRvLWNvcnRleC1hOC1vbi1hcm0tYXJjaC5wYXRjaCB8IDEy
ICsrKysrKy0tLS0tLQogLi4uMDAxLW1lbWNoZWNrLXRlc3RzLUZpeC10aW1lcmZkLXN5c2NhbGwt
dGVzdC5wYXRjaCB8IDEwICsrKysrLS0tLS0KIC4uLmVtY2hlY2stdmd0ZXN0cy1yZW1vdmUtZnVs
bHBhdGgtYWZ0ZXItZmxhZ3MucGF0Y2ggfCAgMiArLQogLi4uc3RzLWZkbGVha19jbXNnLnN0ZGVy
ci5leHAtYWRqdXN0LXRtcC1wYXRocy5wYXRjaCB8ICAyICstCiAuLi5ldWUtUmVuYW1lLV9zaWZp
ZWxkcy10by1fX3NpX2ZpZWxkcy1vbi1tdXNsLnBhdGNoIHwgIDIgKy0KIC4uLi8wMDAxLXRlc3Rz
LWFybS1Vc2UtTy1pbnN0ZWFkLW9mLU8wLnBhdGNoICAgICAgICAgfCAgNiArKystLS0KIC4uLmFs
Z3JpbmQtZmlsdGVyX3htbF9mcmFtZXMtZG8tbm90LWZpbHRlci11c3IucGF0Y2ggfCAgMiArLQog
Li4uY29ycmVjdC1pbmNsdWRlLWRpcmVjdGl2ZS1wYXRoLWZvci1jb25maWcuaC5wYXRjaCB8ICAy
ICstCiAuLi4tc3VwcG9ydC1mb3ItUFBDLWluc3RydWN0aW9ucy1tZmF0YnUtbWZhdGJsLnBhdGNo
IHwgMTAgKysrKystLS0tLQogLi4ub2lkLW5lb24tZm9yLXRhcmdldHMtd2hpY2gtZG9uLXQtc3Vw
cG9ydC1pdC5wYXRjaCB8ICAyICstCiAuLi4vdmFsZ3JpbmQvdmFsZ3JpbmQvZml4ZWQtcGVybC1w
YXRoLnBhdGNoICAgICAgICAgIHwgIDggKysrKy0tLS0KIC4uLi92YWxncmluZC92YWxncmluZC9z
MzkweF92ZWNfb3BfdC5wYXRjaCAgICAgICAgICAgfCAgNiArKystLS0KIC4uLnByb3ByaWF0ZS1t
YXJjaC1tY3B1LW1mcHUtZm9yLUFSTS10ZXN0LWFwcHMucGF0Y2ggfCAgNiArKystLS0KIC4uLm5k
LW1ha2UtbGQtWFhYLnNvLXN0cmxlbi1pbnRlcmNlcHQtb3B0aW9uYWwucGF0Y2ggfCAgNiArKyst
LS0KIC4uLi97dmFsZ3JpbmRfMy4yNy4xLmJiID0+IHZhbGdyaW5kXzMuMjguMC5iYn0gICAgICAg
fCAgMiArLQogMTggZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgNTAgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3t2YWxncmluZF8zLjI3
LjEuYmIgPT4gdmFsZ3JpbmRfMy4yOC4wLmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLWNvbmZpZ3VyZS1Ecm9wLXNldHRp
bmctbWNwdS1jb3J0ZXgtYTgtb24tYXJtLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGdyaW5kL3ZhbGdyaW5kLzAwMDEtY29uZmlndXJlLURyb3Atc2V0dGluZy1tY3B1LWNvcnRleC1h
OC1vbi1hcm0ucGF0Y2gKaW5kZXggM2M4YmVjODJiMy4uMTA1YTJjMzk5NSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtY29uZmlndXJlLURy
b3Atc2V0dGluZy1tY3B1LWNvcnRleC1hOC1vbi1hcm0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtY29uZmlndXJlLURyb3Atc2V0dGluZy1t
Y3B1LWNvcnRleC1hOC1vbi1hcm0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDVhNzc2ZTYx
YWY1YWI3ZjBjZmQxMGNkZTU1Yzc5NjE4OTY4NjkxNmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGQ4ZWJjNzMxNjY0OGFkNTg4MGVmOTFjNThmZjg4YTIxYmJmMzNhM2IgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0
ZTogRnJpLCAxMCBNYXkgMjAyNCAxNjoyNzozNCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBjb25m
aWd1cmU6IERyb3Agc2V0dGluZyBtY3B1PWNvcnRleC1hOCBvbiBhcm0KQEAgLTE2LDEwICsxNiwx
MCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQg
YS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDJkZmJkMWMuLmI0MmZkZDQgMTAw
NzU1CitpbmRleCA2MGMzODYxLi5mY2ZlOGUyIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiAr
KysgYi9jb25maWd1cmUuYWMKLUBAIC0yNTEsMTMgKzI1MSwxMyBAQCBjYXNlICIke2hvc3RfY3B1
fSIgaW4KK0BAIC0zMDksMTMgKzMwOSwxMyBAQCBjYXNlICIke2hvc3RfY3B1fSIgaW4KICAKICAg
ICAgIGFybXY4KikKICAgICAgICAgIEFDX01TR19SRVNVTFQoW29rICgke2hvc3RfY3B1fSldKQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEt
ZG9jcy1EaXNhYmxlLW1hbnVhbC12YWxpZGF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtZG9jcy1EaXNhYmxlLW1hbnVhbC12YWxpZGF0aW9u
LnBhdGNoCmluZGV4IGZiZDc5OWVlZWEuLjAxMTFkNTcwOGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLWRvY3MtRGlzYWJsZS1tYW51YWwt
dmFsaWRhdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFs
Z3JpbmQvMDAwMS1kb2NzLURpc2FibGUtbWFudWFsLXZhbGlkYXRpb24ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDRmNjc0ZjQ1OGIxZjA2NzVhYmRjMGNlZDAxMjM5ZTk5YmZhNDBkZTggTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGI1ZjA4MGZhYzk5YTA2MGZmNWJiZDk3ZWU2Yzg0
ZThiOTJhNTczNjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPgogRGF0ZTogVGh1LCAxMyBKYW4gMjAyMiAxODoyNjowMiAtMDgwMAog
U3ViamVjdDogW1BBVENIXSBkb2NzOiBEaXNhYmxlIG1hbnVhbCB2YWxpZGF0aW9uCkBAIC0xOSwx
MCArMTksMTAgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4K
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL2RvY3MvTWFrZWZpbGUuYW0gYi9kb2NzL01ha2VmaWxlLmFtCi1pbmRleCA2OGEzZGE1
Li45ODMzZDVjIDEwMDY0NAoraW5kZXggOGIzZjU1Yy4uNjFhNmU0NSAxMDA2NDQKIC0tLSBhL2Rv
Y3MvTWFrZWZpbGUuYW0KICsrKyBiL2RvY3MvTWFrZWZpbGUuYW0KLUBAIC0yMDIsNyArMjAyLDcg
QEAgdmFsaWQtbWFucGFnZXM6ICQoTUFOUEFHRVNfWE1MX0ZJTEVTKQorQEAgLTIyNSw3ICsyMjUs
NyBAQCB2YWxpZC1tYW5wYWdlczogJChNQU5QQUdFU19YTUxfRklMRVMpCiAgCSAgZmkgXAogIAlm
aQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5k
LzAwMDEtZ2V0ZGVudHNfZmlsdGVyLmMtd29ya2Fyb3VuZC1vZmY2NF90LW5vdC1kZWZpbmVkLWlu
LS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLWdl
dGRlbnRzX2ZpbHRlci5jLXdvcmthcm91bmQtb2ZmNjRfdC1ub3QtZGVmaW5lZC1pbi0ucGF0Y2gK
aW5kZXggNmFmYjZkNzlkZS4uOTg4OWEwNmM2MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtZ2V0ZGVudHNfZmlsdGVyLmMtd29ya2Fyb3Vu
ZC1vZmY2NF90LW5vdC1kZWZpbmVkLWluLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1nZXRkZW50c19maWx0ZXIuYy13b3JrYXJvdW5kLW9m
ZjY0X3Qtbm90LWRlZmluZWQtaW4tLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSA4YzIzMTMy
MjZkZTUxNzFkZDY3MjRjMTg3OGE2NzliNTU2YjZjYWI0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSAyODZmODZhMzMwZWZjMGQzOGJiNjBjYzQ3ZTkxNjNjYzI3ODNmMzEwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWx5c3NhIFJvc3MgPGhpQGFseXNzYS5pcz4KIERhdGU6
IFN1biwgMiBOb3YgMjAyNSAxNjo0Mzo0NyArMDEwMAotU3ViamVjdDogW1BBVENIIHYyXSBBdm9p
ZCBHbGliYy1zcGVjaWZpYyBpbm82NF90L29mZjY0X3QKK1N1YmplY3Q6IFtQQVRDSF0gQXZvaWQg
R2xpYmMtc3BlY2lmaWMgaW5vNjRfdC9vZmY2NF90CiAKIFRoZSAqNjRfdCB0eXBlcyBhcmUgdHJh
bnNpdGlvbmFsIEFQSXMgZm9yIGFwcGxpY2F0aW9ucyB0aGF0IGRvIG5vdCB5ZXQKIGZ1bGx5IHN1
cHBvcnQgbGFyZ2UgZmlsZXMgb24gMzItYml0IHBsYXRmb3Jtcy4gIG11c2wgbm8gbG9uZ2VyCkBA
IC0yMSw3ICsyMSw3IEBAIFNpZ25lZC1vZmYtYnk6IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRy
aXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIAogZGlmZiAtLWdpdCBhL25vbmUvdGVzdHMvbGludXgvZ2V0ZGVudHNfZmlsdGVyLmMgYi9u
b25lL3Rlc3RzL2xpbnV4L2dldGRlbnRzX2ZpbHRlci5jCi1pbmRleCAzNjE2NTlmNTEuLjRmNDZh
NmVhMiAxMDA2NDQKK2luZGV4IDM2MTY1OWYuLjRmNDZhNmUgMTAwNjQ0CiAtLS0gYS9ub25lL3Rl
c3RzL2xpbnV4L2dldGRlbnRzX2ZpbHRlci5jCiArKysgYi9ub25lL3Rlc3RzL2xpbnV4L2dldGRl
bnRzX2ZpbHRlci5jCiBAQCAtMiw2ICsyLDcgQEAKQEAgLTQzLDUgKzQzLDMgQEAgaW5kZXggMzYx
NjU5ZjUxLi40ZjQ2YTZlYTIgMTAwNjQ0CiAgICAgIHVuc2lnbmVkIHNob3J0IGRfcmVjbGVuOwog
ICAgICB1bnNpZ25lZCBjaGFyICBkX3R5cGU7CiAgICAgIGNoYXIgICAgICAgICAgIGRfbmFtZVtd
OwotLS0gCi0yLjUxLjAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmlu
ZC92YWxncmluZC8wMDAxLW1ha2VmaWxlcy1Ecm9wLXNldHRpbmctbWNwdS10by1jb3J0ZXgtYTgt
b24tYXJtLWFyY2gucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3Jp
bmQvMDAwMS1tYWtlZmlsZXMtRHJvcC1zZXR0aW5nLW1jcHUtdG8tY29ydGV4LWE4LW9uLWFybS1h
cmNoLnBhdGNoCmluZGV4IGY4ZDFlODdiYTkuLjg2NmRlZTMxNjUgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLW1ha2VmaWxlcy1Ecm9wLXNl
dHRpbmctbWNwdS10by1jb3J0ZXgtYTgtb24tYXJtLWFyY2gucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWFrZWZpbGVzLURyb3Atc2V0dGlu
Zy1tY3B1LXRvLWNvcnRleC1hOC1vbi1hcm0tYXJjaC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gYzg3OGFhYWNhZGY4ZWM3MjNiZTg4MmY5MzM1Y2IzMzI0MGRmMTNkNiBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gOTVmMGFmZGUyNDQxNzg4MjE4NDcwMzBlYTNlZmQxOTk2YzlmOTE0
MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiBEYXRlOiBUaHUsIDIwIEFwciAyMDE3IDEwOjExOjE2IC0wNzAwCiBTdWJqZWN0OiBb
UEFUQ0hdIG1ha2VmaWxlczogRHJvcCBzZXR0aW5nIC1tY3B1IHRvIGNvcnRleC1hOCBvbiBhcm0K
QEAgLTE5LDEwICsxOSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9oZWxncmluZC90ZXN0cy9NYWtlZmlsZS5hbSBiL2hlbGdyaW5k
L3Rlc3RzL01ha2VmaWxlLmFtCi1pbmRleCA3YWRjNWM2Li5jYWMyM2M5IDEwMDc1NQoraW5kZXgg
YmZkYjNmZi4uM2JkNTU2OSAxMDA2NDQKIC0tLSBhL2hlbGdyaW5kL3Rlc3RzL01ha2VmaWxlLmFt
CiArKysgYi9oZWxncmluZC90ZXN0cy9NYWtlZmlsZS5hbQotQEAgLTIyNiw5ICsyMjYsOSBAQCBp
ZiAhIFZHQ09ORl9QTEFURk9STVNfSU5DTFVERV9YODZfREFSV0lOCitAQCAtMjE4LDkgKzIxOCw5
IEBAIGlmICEgVkdDT05GX1BMQVRGT1JNU19JTkNMVURFX1g4Nl9EQVJXSU4KICBlbmRpZgogIAog
IGlmIFZHQ09ORl9QTEFURk9STVNfSU5DTFVERV9BUk1fTElOVVgKQEAgLTM2LDEwICszNiwxMCBA
QCBpbmRleCA3YWRjNWM2Li5jYWMyM2M5IDEwMDc1NQogIGFubm90YXRlX2hiZWZvcmVfQ0ZMQUdT
ID0gJChBTV9DRkxBR1MpCiAgdGMwN19oYmwxX0NGTEFHUyAgICAgICAgPSAkKEFNX0NGTEFHUykK
IGRpZmYgLS1naXQgYS9ub25lL3Rlc3RzL2FybS9NYWtlZmlsZS5hbSBiL25vbmUvdGVzdHMvYXJt
L01ha2VmaWxlLmFtCi1pbmRleCA0MWE1YTAzLi5hNzY5ODFlIDEwMDY0NAoraW5kZXggZDE5NzU3
NS4uZjQ1MmQ2OSAxMDA2NDQKIC0tLSBhL25vbmUvdGVzdHMvYXJtL01ha2VmaWxlLmFtCiArKysg
Yi9ub25lL3Rlc3RzL2FybS9NYWtlZmlsZS5hbQotQEAgLTU2LDEwICs1NiwxMCBAQCBhbGxleGVj
X0NGTEFHUwkJPSAkKEFNX0NGTEFHUykgQEZMQUdfV19OT19OT05OVUxMQAorQEAgLTU1LDEwICs1
NSwxMCBAQCBhbGxleGVjX0NGTEFHUwkJPSAkKEFNX0NGTEFHUykgQEZMQUdfV19OT19OT05OVUxM
QAogICMgbmVlZCBzcGVjaWFsIGhlbHBpbmcgdy5yLnQgLW1mcHUgYW5kIC1tZmxvYXQtYWJpLCB0
aG91Z2guCiAgIyBBbHNvIGZvcmNlIC1PMCBzaW5jZSAtTyB0YWtlcyBodW5kcmVkcyBvZiBNQiBv
ZiBtZW1vcnkgCiAgIyBmb3IgdjZpbnRUaHVtYi5jLgpAQCAtNTMsNyArNTMsNyBAQCBpbmRleCA0
MWE1YTAzLi5hNzY5ODFlIDEwMDY0NAogIAogIHY4Y3J5cHRvX2FfQ0ZMQUdTID0gJChBTV9DRkxB
R1MpIC1nIC1PMCAtbWZwdT1jcnlwdG8tbmVvbi1mcC1hcm12OCAtbWFybSAtbWFyY2g9YXJtdjgt
YQogIHY4Y3J5cHRvX3RfQ0ZMQUdTID0gJChBTV9DRkxBR1MpIC1nIC1PMCAtbWZwdT1jcnlwdG8t
bmVvbi1mcC1hcm12OCAtbXRodW1iIC1tYXJjaD1hcm12OC1hCi1AQCAtNzQsMjMgKzc0LDIzIEBA
IHY4bWVtb3J5X3RfQ0ZMQUdTID0gJChBTV9DRkxBR1MpIC1nIC1PMCBcCitAQCAtNzMsMjMgKzcz
LDIzIEBAIHY4bWVtb3J5X3RfQ0ZMQUdTID0gJChBTV9DRkxBR1MpIC1nIC1PMCBcCiAgCiAgdmN2
dF9maXhlZF9mbG9hdF9WRlBfQ0ZMQUdTID0gJChBTV9DRkxBR1MpIC1nIC1PMCAtbWNwdT1jb3J0
ZXgtYTggLW1mcHU9bmVvbgogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWVtY2hlY2stdGVzdHMtRml4LXRpbWVyZmQtc3lzY2FsbC10
ZXN0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEt
bWVtY2hlY2stdGVzdHMtRml4LXRpbWVyZmQtc3lzY2FsbC10ZXN0LnBhdGNoCmluZGV4IDIwMGIy
NjAyY2IuLmUzNjJhZTZmODggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxn
cmluZC92YWxncmluZC8wMDAxLW1lbWNoZWNrLXRlc3RzLUZpeC10aW1lcmZkLXN5c2NhbGwtdGVz
dC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAw
MS1tZW1jaGVjay10ZXN0cy1GaXgtdGltZXJmZC1zeXNjYWxsLXRlc3QucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDNhNTFlZDEwN2Y2NzczMjkxMGRlYzEyMjc5YTkyNzllMTU4YWZiZTcgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDc2NzZhNzM3MTYwZGRkNDUwYjJkMjJmN2Y5NmQ3
ZjQ0NWM2NWNhYmIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPgogRGF0ZTogTW9uLCA5IE1hciAyMDIwIDE2OjMwOjE5IC0wNzAwCiBT
dWJqZWN0OiBbUEFUQ0hdIG1lbWNoZWNrL3Rlc3RzOiBGaXggdGltZXJmZCBzeXNjYWxsIHRlc3QK
QEAgLTE2LDEwICsxNiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZy5oLmluIGIvY29uZmlnLmguaW4KLWluZGV4IDAwZGIx
YTYuLjIzZmQ3N2EgMTAwNjQ0CitpbmRleCA3ZGI3MWU4Li44ODAwZmM5IDEwMDY0NAogLS0tIGEv
Y29uZmlnLmguaW4KICsrKyBiL2NvbmZpZy5oLmluCi1AQCAtNDA5LDYgKzQwOSw5IEBACitAQCAt
NDQyLDYgKzQ0Miw5IEBACiAgLyogRGVmaW5lIHRvIDEgaWYgeW91IGhhdmUgdGhlIDxzeXMvc3lz
bnZsLmg+IGhlYWRlciBmaWxlLiAqLwogICN1bmRlZiBIQVZFX1NZU19TWVNOVkxfSAogIApAQCAt
MzAsMTAgKzMwLDEwIEBAIGluZGV4IDAwZGIxYTYuLjIzZmQ3N2EgMTAwNjQ0CiAgI3VuZGVmIEhB
VkVfU1lTX1RJTUVfSAogIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5h
YwotaW5kZXggYjQyZmRkNC4uZWM5NTE0NiAxMDA3NTUKK2luZGV4IGZjZmU4ZTIuLjMzYWNjYTYg
MTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTQ4OTIs
NiArNDg5Miw3IEBAIEFDX0NIRUNLX0hFQURFUlMoWyAgICAgICBcCitAQCAtNTMzNCw2ICs1MzM0
LDcgQEAgQUNfQ0hFQ0tfSEVBREVSUyhbICAgICAgIFwKICAgICAgICAgIHN5cy9zeXNjYWxsLmgg
ICAgXAogICAgICAgICAgc3lzL3N5c252bC5oICAgICBcCiAgICAgICAgICBzeXMvdGltZS5oICAg
ICAgIFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmlu
ZC8wMDAxLW1lbWNoZWNrLXZndGVzdHMtcmVtb3ZlLWZ1bGxwYXRoLWFmdGVyLWZsYWdzLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbWVtY2hlY2st
dmd0ZXN0cy1yZW1vdmUtZnVsbHBhdGgtYWZ0ZXItZmxhZ3MucGF0Y2gKaW5kZXggOWEzNTk2Y2Fj
MS4uM2Q2ZjgwYzZjMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5k
L3ZhbGdyaW5kLzAwMDEtbWVtY2hlY2stdmd0ZXN0cy1yZW1vdmUtZnVsbHBhdGgtYWZ0ZXItZmxh
Z3MucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAw
MDEtbWVtY2hlY2stdmd0ZXN0cy1yZW1vdmUtZnVsbHBhdGgtYWZ0ZXItZmxhZ3MucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGI3MDNiMGQxMWFkYzkxNDdhN2Q5NzgxN2JkNzcxYWM0MGI4YzRk
MzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJlYmQzNmQxMTkwYmIxNmZmNTM3YWIy
MTg5ODAyYzAyNTgwM2IxMTYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBTdGFjeSBH
YWlrb3ZhaWEgPFN0YWN5LkdhaWtvdmFpYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAxNiBT
ZXAgMjAyMCAxMzo0NTowNyAtMDQwMAogU3ViamVjdDogW1BBVENIXSBtZW1jaGVjayB2Z3Rlc3Rz
IHJlbW92ZSBmdWxscGF0aC1hZnRlciBmbGFncwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtbm9uZS10ZXN0cy1mZGxlYWtfY21zZy5zdGRl
cnIuZXhwLWFkanVzdC10bXAtcGF0aHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFs
Z3JpbmQvdmFsZ3JpbmQvMDAwMS1ub25lLXRlc3RzLWZkbGVha19jbXNnLnN0ZGVyci5leHAtYWRq
dXN0LXRtcC1wYXRocy5wYXRjaAppbmRleCA3ZGVjYTk5MjAyLi45ZTJmMTc5MjUyIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1ub25lLXRl
c3RzLWZkbGVha19jbXNnLnN0ZGVyci5leHAtYWRqdXN0LXRtcC1wYXRocy5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1ub25lLXRlc3RzLWZk
bGVha19jbXNnLnN0ZGVyci5leHAtYWRqdXN0LXRtcC1wYXRocy5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gYmJiNWU4YTZmYzVlZWMxNzhmODA3N2FiMDA2YWI0MmMwMDk1MjhkNCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTBlZmVkMTcxNDc4MjkwZjA2YTE4NmI4MDliNGRlMWQz
MGI2OTAzNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmlu
IDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAyNCBKYW4gMjAyMCAxNzo1NToz
OSArMDEwMAogU3ViamVjdDogW1BBVENIXSBub25lL3Rlc3RzL2ZkbGVha19jbXNnLnN0ZGVyci5l
eHA6IGFkanVzdCAvdG1wIHBhdGhzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS1zaWdxdWV1ZS1SZW5hbWUtX3NpZmllbGRzLXRvLV9fc2lf
ZmllbGRzLW9uLW11c2wucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFs
Z3JpbmQvMDAwMS1zaWdxdWV1ZS1SZW5hbWUtX3NpZmllbGRzLXRvLV9fc2lfZmllbGRzLW9uLW11
c2wucGF0Y2gKaW5kZXggZWZhNmMyYzg5NS4uYTAyMGQzMGVjOCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtc2lncXVldWUtUmVuYW1lLV9z
aWZpZWxkcy10by1fX3NpX2ZpZWxkcy1vbi1tdXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLXNpZ3F1ZXVlLVJlbmFtZS1fc2lmaWVsZHMt
dG8tX19zaV9maWVsZHMtb24tbXVzbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYzI4NzM4
MmExZjNkZDlmMmRiM2RmNTRkZGU1NGI0YjI2Njc5MWJiOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gOTUxMzE5NzQ4YjZlNjA2MTVmZGYxMmE1OWM2ZGY1NmEyNWUzOWNkZCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBE
YXRlOiBTYXQsIDEwIEp1biAyMDE3IDAwOjQ2OjM5IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNp
Z3F1ZXVlOiBSZW5hbWUgX3NpZmllbGRzIHRvIF9fc2lfZmllbGRzIG9uIG11c2wKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLXRlc3RzLWFy
bS1Vc2UtTy1pbnN0ZWFkLW9mLU8wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdy
aW5kL3ZhbGdyaW5kLzAwMDEtdGVzdHMtYXJtLVVzZS1PLWluc3RlYWQtb2YtTzAucGF0Y2gKaW5k
ZXggM2VlYTE5NTU3OS4uYjFhMjdkZmVlMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEtdGVzdHMtYXJtLVVzZS1PLWluc3RlYWQtb2YtTzAu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDEt
dGVzdHMtYXJtLVVzZS1PLWluc3RlYWQtb2YtTzAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDgwODdhZThkY2M0NmYzZjgxYWY1OGVkOWI3MTc2NzYxYjk4OGVlNjEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDEyZmVjMjk4ODBhZTRiMWNlOGFjOThmNmZhNTQzMjMyNjRlY2RkMTEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgogRGF0ZTogRnJpLCAxMCBNYXkgMjAyNCAxNzo0NDo0NyAtMDcwMAogU3ViamVjdDogW1BB
VENIXSB0ZXN0cy9hcm06IFVzZSAtTyBpbnN0ZWFkIG9mIC1PMApAQCAtMTksMTAgKzE5LDEwIEBA
IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL25v
bmUvdGVzdHMvYXJtL01ha2VmaWxlLmFtIGIvbm9uZS90ZXN0cy9hcm0vTWFrZWZpbGUuYW0KLWlu
ZGV4IGE3Njk4MWUuLmExOThmNzMgMTAwNjQ0CitpbmRleCBmNDUyZDY5Li5mYmQ5NDE2IDEwMDY0
NAogLS0tIGEvbm9uZS90ZXN0cy9hcm0vTWFrZWZpbGUuYW0KICsrKyBiL25vbmUvdGVzdHMvYXJt
L01ha2VmaWxlLmFtCi1AQCAtNTcsOSArNTcsOSBAQCBhbGxleGVjX0NGTEFHUwkJPSAkKEFNX0NG
TEFHUykgQEZMQUdfV19OT19OT05OVUxMQAorQEAgLTU2LDkgKzU2LDkgQEAgYWxsZXhlY19DRkxB
R1MJCT0gJChBTV9DRkxBR1MpIEBGTEFHX1dfTk9fTk9OTlVMTEAKICAjIEFsc28gZm9yY2UgLU8w
IHNpbmNlIC1PIHRha2VzIGh1bmRyZWRzIG9mIE1CIG9mIG1lbW9yeSAKICAjIGZvciB2NmludFRo
dW1iLmMuCiAgdjZpbnRBUk1fQ0ZMQUdTICAgPSAkKEFNX0NGTEFHUykgLWcgLU8wIC1tYXJtCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvMDAwMS12
YWxncmluZC1maWx0ZXJfeG1sX2ZyYW1lcy1kby1ub3QtZmlsdGVyLXVzci5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLXZhbGdyaW5kLWZpbHRlcl94
bWxfZnJhbWVzLWRvLW5vdC1maWx0ZXItdXNyLnBhdGNoCmluZGV4IGM2NGMyYWZkM2YuLjY4NmY2
YjI2OTIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmlu
ZC8wMDAxLXZhbGdyaW5kLWZpbHRlcl94bWxfZnJhbWVzLWRvLW5vdC1maWx0ZXItdXNyLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8wMDAxLXZhbGdy
aW5kLWZpbHRlcl94bWxfZnJhbWVzLWRvLW5vdC1maWx0ZXItdXNyLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBmOGZiZWJjZjY5ZTRhOGJmMjEyMmI3YzU1ZjJjZTM3MjM3N2FmMWJjIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwOTY1Y2I2MjlkOWZlNzQ1ZTRiOTAzNTEwMzQ1MTc4
YzgxNTIzMTE4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmFuZHkgTWFjTGVvZCA8
UmFuZHkuTWFjTGVvZEB3aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAxMyBNYXkgMjAxOSAxNzox
MjoyMSAtMDQwMAogU3ViamVjdDogW1BBVENIXSB2YWxncmluZDogZmlsdGVyX3htbF9mcmFtZXM6
IGRvIG5vdCBmaWx0ZXIgL3VzcgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGdyaW5kL3ZhbGdyaW5kLzAwMDMtY29ycmVjdC1pbmNsdWRlLWRpcmVjdGl2ZS1wYXRoLWZvci1j
b25maWcuaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC8w
MDAzLWNvcnJlY3QtaW5jbHVkZS1kaXJlY3RpdmUtcGF0aC1mb3ItY29uZmlnLmgucGF0Y2gKaW5k
ZXggM2FjYjVhMjhmNC4uNzExOTZkZjhhMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3ZhbGdyaW5kL3ZhbGdyaW5kLzAwMDMtY29ycmVjdC1pbmNsdWRlLWRpcmVjdGl2ZS1wYXRo
LWZvci1jb25maWcuaC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQv
dmFsZ3JpbmQvMDAwMy1jb3JyZWN0LWluY2x1ZGUtZGlyZWN0aXZlLXBhdGgtZm9yLWNvbmZpZy5o
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkZTRkN2U0Nzg1MTViNjNmMDQ5YjIxMTI2NmQ5
Yjk0NmMxNWNjMGI5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzZGNmYWZmZjgwZjM3
YjY1MTUzZjEwMGJjY2YwOWFjODA5MmRjZWQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTAgSnVuIDIwMTcg
MDE6MDM6MTcgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29ycmVjdCBpbmNsdWRlIGRpcmVjdGl2
ZSBwYXRoIGZvciBjb25maWcuaApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Zh
bGdyaW5kL3ZhbGdyaW5kL0FkZGVkLXN1cHBvcnQtZm9yLVBQQy1pbnN0cnVjdGlvbnMtbWZhdGJ1
LW1mYXRibC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZC9B
ZGRlZC1zdXBwb3J0LWZvci1QUEMtaW5zdHJ1Y3Rpb25zLW1mYXRidS1tZmF0YmwucGF0Y2gKaW5k
ZXggMTA5Y2FmNzZhYi4uZjY1ODlmZmZkYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL0FkZGVkLXN1cHBvcnQtZm9yLVBQQy1pbnN0cnVjdGlvbnMt
bWZhdGJ1LW1mYXRibC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQv
dmFsZ3JpbmQvQWRkZWQtc3VwcG9ydC1mb3ItUFBDLWluc3RydWN0aW9ucy1tZmF0YnUtbWZhdGJs
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4NWJmZjk5MzA4N2NkNzM2N2ZmYzM1ZGU1MjVj
MmJmNjE2MjM5OGQyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0OTJkNGMzY2ZjZDU3
ZWRkNTYxMGFiMzU1YWI5ZjliYTkwMWM2ZWRjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogQW5lZXNoIEJhbnNhbCA8YW5lZXNoLmJhbnNhbEBmcmVlc2NhbGUuY29tPgogRGF0ZTogTW9u
LCAyMSBOb3YgMjAxMSAxNzozMTozOSArMDUzMAogU3ViamVjdDogW1BBVENIXSBBZGRlZCBzdXBw
b3J0IGZvciBQUEMgaW5zdHJ1Y3Rpb25zIG1mYXRidSwgbWZhdGJsLgpAQCAtMTcsNyArMTcsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBBbmVlc2ggQmFuc2FsIDxhbmVlc2guYmFuc2FsQGZyZWVzY2FsZS5j
b20+CiAgMyBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9W
RVgvcHJpdi9ndWVzdF9wcGNfZGVmcy5oIGIvVkVYL3ByaXYvZ3Vlc3RfcHBjX2RlZnMuaAotaW5k
ZXggMjIwZmJmMS4uY2QyNTlmMyAxMDA2NDQKK2luZGV4IGY1NTcxYzQuLjdiODBjOTYgMTAwNjQ0
CiAtLS0gYS9WRVgvcHJpdi9ndWVzdF9wcGNfZGVmcy5oCiArKysgYi9WRVgvcHJpdi9ndWVzdF9w
cGNfZGVmcy5oCiBAQCAtMjMzLDYgKzIzMyw4IEBAIGV4dGVybiBVSW50IHBwYzMyZ19kaXJ0eWhl
bHBlcl9NRlNQUl8yNjhfMjY5ICggVUludCApOwpAQCAtMzAsNyArMzAsNyBAQCBpbmRleCAyMjBm
YmYxLi5jZDI1OWYzIDEwMDY0NAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBVSW50IHZEX2lkeCwgVUludCBzaCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgVUludCBzaGlmdF9yaWdodCApOwogZGlmZiAtLWdpdCBhL1ZFWC9wcml2L2d1ZXN0X3Bw
Y19oZWxwZXJzLmMgYi9WRVgvcHJpdi9ndWVzdF9wcGNfaGVscGVycy5jCi1pbmRleCAyNjExZTUy
Li43MmMzNDliIDEwMDY0NAoraW5kZXggYTQ4MTY0YS4uMjI5YjVhOCAxMDA2NDQKIC0tLSBhL1ZF
WC9wcml2L2d1ZXN0X3BwY19oZWxwZXJzLmMKICsrKyBiL1ZFWC9wcml2L2d1ZXN0X3BwY19oZWxw
ZXJzLmMKIEBAIC0xMTgsNiArMTE4LDI0IEBAIFVJbnQgcHBjMzJnX2RpcnR5aGVscGVyX01GU1BS
XzI4NyAoIHZvaWQgKQpAQCAtNTksMTAgKzU5LDEwIEBAIGluZGV4IDI2MTFlNTIuLjcyYzM0OWIg
MTAwNjQ0CiAgLyogQ0FMTEVEIEZST00gR0VORVJBVEVEIENPREUgKi8KICAvKiBESVJUWSBIRUxQ
RVIgKHJlYWRzIGd1ZXN0IHN0YXRlLCB3cml0ZXMgZ3Vlc3QgbWVtKSAqLwogZGlmZiAtLWdpdCBh
L1ZFWC9wcml2L2d1ZXN0X3BwY190b0lSLmMgYi9WRVgvcHJpdi9ndWVzdF9wcGNfdG9JUi5jCi1p
bmRleCAxODcxNmRkLi5iMmU3MmEwIDEwMDY0NAoraW5kZXggZGJlYmEwNS4uMWU1MWI0MCAxMDA2
NDQKIC0tLSBhL1ZFWC9wcml2L2d1ZXN0X3BwY190b0lSLmMKICsrKyBiL1ZFWC9wcml2L2d1ZXN0
X3BwY190b0lSLmMKLUBAIC0xMTg3NSw2ICsxMTg3NSwyOCBAQCBzdGF0aWMgQm9vbCBkaXNfcHJv
Y19jdGwgKCBjb25zdCBWZXhBYmlJbmZvKiB2YmksIFVJbnQgcHJlZml4LCBVSW50IHRoZUluc3Ry
ICkKK0BAIC0xMTg2NCw2ICsxMTg2NCwyOCBAQCBzdGF0aWMgQm9vbCBkaXNfcHJvY19jdGwgKCBj
b25zdCBWZXhBYmlJbmZvKiB2YmksIFVJbnQgcHJlZml4LCBVSW50IHRoZUluc3RyICkKICAgICAg
ICAgICBicmVhazsKICAgICAgICB9CiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdmFsZ3JpbmQvdmFsZ3JpbmQvYXZvaWQtbmVvbi1mb3ItdGFyZ2V0cy13aGljaC1kb24tdC1z
dXBwb3J0LWl0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5k
L2F2b2lkLW5lb24tZm9yLXRhcmdldHMtd2hpY2gtZG9uLXQtc3VwcG9ydC1pdC5wYXRjaAppbmRl
eCAxNTk3YjNhMDIxLi41N2MyNDJkZGRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdmFsZ3JpbmQvdmFsZ3JpbmQvYXZvaWQtbmVvbi1mb3ItdGFyZ2V0cy13aGljaC1kb24tdC1z
dXBwb3J0LWl0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxn
cmluZC9hdm9pZC1uZW9uLWZvci10YXJnZXRzLXdoaWNoLWRvbi10LXN1cHBvcnQtaXQucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDU5NjM3MmJjOWI0ZDMxYmM5ODExODgxY2ZhNzQ3ZDk5YThj
MjUxNDEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBiZDYyMWZkZDVhMjExMzY5YzMw
MTM2YjRiMTQwOGU1ZWEzNzQ4ZDMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRy
ZSBNY0N1cmR5IDxhcm1jY3VyZHlAZ21haWwuY29tPgogRGF0ZTogVHVlLCAxOSBKYW4gMjAxNiAx
Njo0MjozNiAtMDgwMAogU3ViamVjdDogW1BBVENIXSBhdm9pZCBuZW9uIGZvciB0YXJnZXRzIHdo
aWNoIGRvbid0IHN1cHBvcnQgaXQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92
YWxncmluZC92YWxncmluZC9maXhlZC1wZXJsLXBhdGgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvZml4ZWQtcGVybC1wYXRoLnBhdGNoCmluZGV4IDZiZmM2
MDM1ZWQuLjRmOWM3NGVmZGIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxn
cmluZC92YWxncmluZC9maXhlZC1wZXJsLXBhdGgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL2ZpeGVkLXBlcmwtcGF0aC5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gNDA4ZjliMzljYTRmNTcwOWI2NjhmMTM4MjlhOTRjNGNhZTg1NTAwNiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDM5ZWU5OTYwZTMwNmFhYmU3MDdmM2E4YTE0MTZl
MzliOTgzYWI3OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFFpbmcgSGUgPHFpbmcu
aGVAaW50ZWwuY29tPgogRGF0ZTogVHVlLCAzMSBBdWcgMjAxMCAyMjo1MTo1OCArMDgwMAogU3Vi
amVjdDogW1BBVENIXSB2YWxncmluZDogZml4IHBlcmwgc2NyaXB0cwpAQCAtMjQsNyArMjQsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBNYXhpbiBCLiBKb2huIDxtYXhpbi5qb2huQGludGVsLmNvbT4KICAz
IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL21hc3NpZi9tc19wcmludC5pbiBiL21hc3NpZi9tc19wcmludC5pbgotaW5kZXggYTIw
NmNlNC4uZGYxYmMzMSAxMDA3NTUKK2luZGV4IGQ5N2I4NzguLmI0YTc2MmYgMTAwNjQ0CiAtLS0g
YS9tYXNzaWYvbXNfcHJpbnQuaW4KICsrKyBiL21hc3NpZi9tc19wcmludC5pbgogQEAgLTEsNCAr
MSw0IEBACkBAIC0zNCw3ICszNCw3IEBAIGluZGV4IGEyMDZjZTQuLmRmMWJjMzEgMTAwNzU1CiAg
IyMtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSMjCiAgIyMtLS0gTWFzc2lmJ3MgcmVzdWx0cyBwcmludGVyICAgICAgICAg
ICAgICAgICAgICAgICAgIG1zX3ByaW50LmluIC0tLSMjCiBkaWZmIC0tZ2l0IGEvcGVyZi92Z19w
ZXJmLmluIGIvcGVyZi92Z19wZXJmLmluCi1pbmRleCA5MGVlMWQyLi5jNTg1MDk2IDEwMDY0NAor
aW5kZXggY2MyNzgzNC4uMGU0OTU1MCAxMDA2NDQKIC0tLSBhL3BlcmYvdmdfcGVyZi5pbgogKysr
IGIvcGVyZi92Z19wZXJmLmluCiBAQCAtMSw0ICsxLDQgQEAKQEAgLTQ0LDcgKzQ0LDcgQEAgaW5k
ZXggOTBlZTFkMi4uYzU4NTA5NiAxMDA2NDQKICAjIy0tLSBWYWxncmluZCBwZXJmb3JtYW5jZSB0
ZXN0aW5nIHNjcmlwdCAgICAgICAgICAgICAgICAgIHZnX3BlcmYgLS0tIyMKICAjIy0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tIyMKIGRpZmYgLS1naXQgYS90ZXN0cy92Z19yZWd0ZXN0LmluIGIvdGVzdHMvdmdfcmVndGVz
dC5pbgotaW5kZXggMzQ3MTMyMi4uNDllMTExNCAxMDA3NTUKK2luZGV4IDJjNGZlOGMuLjIwMTc4
NDEgMTAwNjQ0CiAtLS0gYS90ZXN0cy92Z19yZWd0ZXN0LmluCiArKysgYi90ZXN0cy92Z19yZWd0
ZXN0LmluCiBAQCAtMSw0ICsxLDQgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxncmluZC92YWxncmluZC9zMzkweF92ZWNfb3BfdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy92YWxncmluZC92YWxncmluZC9zMzkweF92ZWNfb3BfdC5wYXRjaAppbmRleCAxOTY5
MGU1ZWJiLi45YjRiZmQyYTg3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFs
Z3JpbmQvdmFsZ3JpbmQvczM5MHhfdmVjX29wX3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3MzOTB4X3ZlY19vcF90LnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA4YzkyMDg5NzQxZDgwOWNmZDE4MzU0ZjFiNGRmMThjZDI4Mzk4YTIwIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkY2I0MGRhOGViZjZhZDZmZTFhYjMwODk3M2M3ODk2
NzE3ZjdlMTk5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogWWkgRmFuIFl1IDx5aWZh
bi55dUB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCAxNyBNYXIgMjAyMSAxMjoxNjozMSAtMDQw
MAogU3ViamVjdDogW1BBVENIXSByZW1vdmUgczM5MHhfdmVjX29wX3QKQEAgLTE4LDEwICsxOCwx
MCBAQCBTaWduZWQtb2ZmLWJ5OiBZaSBGYW4gWXUgPHlpZmFuLnl1QHdpbmRyaXZlci5jb20+CiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1n
aXQgYS9WRVgvcHJpdi9ndWVzdF9zMzkwX2RlZnMuaCBiL1ZFWC9wcml2L2d1ZXN0X3MzOTBfZGVm
cy5oCi1pbmRleCAyOWVmYTAxLi4zYThmMGEwIDEwMDY0NAoraW5kZXggNWM4N2QyYi4uOTIxMDgy
MiAxMDA2NDQKIC0tLSBhL1ZFWC9wcml2L2d1ZXN0X3MzOTBfZGVmcy5oCiArKysgYi9WRVgvcHJp
di9ndWVzdF9zMzkwX2RlZnMuaAotQEAgLTI4NSw3ICsyODUsNyBAQCB0eXBlZGVmIGVudW0gewor
QEAgLTI4MSw3ICsyODEsNyBAQCB0eXBlZGVmIGVudW0gewogICAgIFMzOTBfVkVDX09QX1ZDTEZO
TCwKICAgICBTMzkwX1ZFQ19PUF9WQ1JORiwKICAgICBTMzkwX1ZFQ19PUF9MQVNUICAgICAgICAg
ICAgIC8vIHN1cHBvc2VkIHRvIGJlIHRoZSBsYXN0IGVsZW1lbnQgaW4gZW51bQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3VzZS1hcHByb3ByaWF0
ZS1tYXJjaC1tY3B1LW1mcHUtZm9yLUFSTS10ZXN0LWFwcHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvdXNlLWFwcHJvcHJpYXRlLW1hcmNoLW1jcHUtbWZw
dS1mb3ItQVJNLXRlc3QtYXBwcy5wYXRjaAppbmRleCAwYzE4YTYzYzJiLi5hMjU4ZWJhOTE0IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvdXNlLWFw
cHJvcHJpYXRlLW1hcmNoLW1jcHUtbWZwdS1mb3ItQVJNLXRlc3QtYXBwcy5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmQvdXNlLWFwcHJvcHJpYXRlLW1h
cmNoLW1jcHUtbWZwdS1mb3ItQVJNLXRlc3QtYXBwcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gYTVjZDAwZjFjMmQ3OGUyYTE1ZjRhMGM1OTVmNWFjMTBjYTRjMzI5MCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gOTU3OGRhZTY0MDA3M2FlMDZkZjZhMWMyYzc3YzkyNjNmMmQwYjg1
YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFuZHJlIE1jQ3VyZHkgPGFybWNjdXJk
eUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDE5IEphbiAyMDE2IDE2OjAwOjAwIC0wODAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIHVzZSBhcHByb3ByaWF0ZSAtbWFyY2gvLW1jcHUvLW1mcHUgZm9yIEFSTSB0
ZXN0IGFwcHMKQEAgLTIzLDEwICsyMywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbmRyZSBNY0N1cmR5
IDxhcm1jY3VyZHlAZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9ub25lL3Rlc3RzL2FybS9NYWtlZmlsZS5h
bSBiL25vbmUvdGVzdHMvYXJtL01ha2VmaWxlLmFtCi1pbmRleCA3OWI5NTdjLi40MWE1YTAzIDEw
MDY0NAoraW5kZXggNTI0MWJiZC4uZDE5NzU3NSAxMDA2NDQKIC0tLSBhL25vbmUvdGVzdHMvYXJt
L01ha2VmaWxlLmFtCiArKysgYi9ub25lL3Rlc3RzL2FybS9NYWtlZmlsZS5hbQotQEAgLTg3LDgg
Kzg3LDEwIEBAIG5lb242NF9DRkxBR1MgICAgID0gJChBTV9DRkxBR1MpIC1nIC1PMCAtbWNwdT1j
b3J0ZXgtYTggXAorQEAgLTg2LDggKzg2LDEwIEBAIG5lb242NF9DRkxBR1MgICAgID0gJChBTV9D
RkxBR1MpIC1nIC1PMCAtbWNwdT1jb3J0ZXgtYTggXAogIAkJCS1tZnB1PW5lb24gXAogIAkJCS1t
dGh1bWIKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxn
cmluZC92YWxncmluZC1tYWtlLWxkLVhYWC5zby1zdHJsZW4taW50ZXJjZXB0LW9wdGlvbmFsLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kL3ZhbGdyaW5kLW1h
a2UtbGQtWFhYLnNvLXN0cmxlbi1pbnRlcmNlcHQtb3B0aW9uYWwucGF0Y2gKaW5kZXggY2E3Zjcy
MWQ5Yy4uNzNjMzg2Y2U0NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdy
aW5kL3ZhbGdyaW5kL3ZhbGdyaW5kLW1ha2UtbGQtWFhYLnNvLXN0cmxlbi1pbnRlcmNlcHQtb3B0
aW9uYWwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5k
L3ZhbGdyaW5kLW1ha2UtbGQtWFhYLnNvLXN0cmxlbi1pbnRlcmNlcHQtb3B0aW9uYWwucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGI0MDc1MTRhYTFhNGZkMzY2N2IzMDUyNzI2MGUyNzFkYTM0
Y2U0YTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU3MjYwMzg0MDRiYmZkNzk1ZDQ4
NzhhNzdiMDdmNTE1NGJlZGU5NzcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRy
ZSBNY0N1cmR5IDxhcm1jY3VyZHlAZ21haWwuY29tPgogRGF0ZTogVHVlLCAxMyBEZWMgMjAxNiAx
MToyOTo1NSArMDgwMAogU3ViamVjdDogW1BBVENIXSBtYWtlIGxkLVhYWC5zbyBzdHJsZW4gaW50
ZXJjZXB0IG9wdGlvbmFsCkBAIC0xNywxMCArMTcsMTAgQEAgU2lnbmVkLW9mZi1ieTogSmFja2ll
IEh1YW5nIDxqYWNraWUuaHVhbmdAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29yZWdyaW5kL21f
cmVkaXIuYyBiL2NvcmVncmluZC9tX3JlZGlyLmMKLWluZGV4IDYzMTcyYjkuLjFiNWJmOTUgMTAw
NjQ0CitpbmRleCAwYzQzNzMxLi4xYmFmYjQ3IDEwMDY0NAogLS0tIGEvY29yZWdyaW5kL21fcmVk
aXIuYwogKysrIGIvY29yZWdyaW5kL21fcmVkaXIuYwotQEAgLTEzMjEsNyArMTMyMSwxOCBAQCBz
dGF0aWMgdm9pZCBhZGRfaGFyZHdpcmVkX3NwZWMgKGNvbnN0ICBIQ2hhciogc29wYXR0LCBjb25z
dCBIQ2hhciogZm5wYXR0LAorQEAgLTEzNDksNyArMTM0OSwxOCBAQCBzdGF0aWMgdm9pZCBhZGRf
aGFyZHdpcmVkX3NwZWMgKGNvbnN0ICBIQ2hhciogc29wYXR0LCBjb25zdCBIQ2hhciogZm5wYXR0
LAogICAgIHNwZWMtPnRvX2FkZHIgICAgID0gdG9fYWRkcjsKICAgICBzcGVjLT5pc1dyYXAgICAg
ICA9IEZhbHNlOwogICAgIHNwZWMtPmlzR2xvYmFsICAgID0gRmFsc2U7CmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3JpbmRfMy4yNy4xLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kXzMuMjguMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFsZ3Jp
bmRfMy4yNy4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsZ3JpbmQvdmFs
Z3JpbmRfMy4yOC4wLmJiCmluZGV4IDgyOWI2Yzk2YTguLmI5ZDQyMWZmZDMgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxncmluZC92YWxncmluZF8zLjI3LjEuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGdyaW5kL3ZhbGdyaW5kXzMuMjguMC5iYgpAQCAtMjcs
NyArMjcsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vc291cmNld2FyZS5vcmcvcHViL3ZhbGdyaW5k
L3ZhbGdyaW5kLSR7UFZ9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS10ZXN0cy1h
cm0tVXNlLU8taW5zdGVhZC1vZi1PMC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWdl
dGRlbnRzX2ZpbHRlci5jLXdvcmthcm91bmQtb2ZmNjRfdC1ub3QtZGVmaW5lZC1pbi0ucGF0Y2gg
XAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWQ1ODkxNTJlYjgwNzFjMDJm
ZWFiOGNlNmFiNzE5ZTQzMWExZmJjM2UyYjE3MDBmNTQzMjYzMmE4YjkyNjRkYyIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI5ZjdhMThkMTI4ZjA1ZDNhODBmZWE1M2U2OTUzZjM0YWFkNzIwMGE0MjVj
ZWFlZTQ2MDk5YThhNzk4YTdkZDljIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAidmFsZ3JpbmQt
KD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKIENPTVBBVElCTEVfSE9TVCA9ICcoaS44Nnx4
ODZfNjR8YXJtfGFhcmNoNjR8bWlwc3xwb3dlcnBjfHBvd2VycGM2NHxyaXNjdjY0KS4qLWxpbnV4
JwotLSAKMi40Ny4xCgo=

--===============1279514540360809310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="valgrind-changelog.txt"

Release 3.28.0 (23 Oct 2026)
This release supports X86/Linux, AMD64/Linux, ARM32/Linux, ARM64/Linux,
PPC32/Linux, PPC64BE/Linux, PPC64LE/Linux, S390X/Linux, MIPS32/Linux,
MIPS64/Linux, RISCV64/Linux, ARM/Android, ARM64/Android, MIPS32/Android,
X86/Android, X86/Solaris, AMD64/Solaris, X86/macOS, AMD64/macOS.
X86/FreeBSD, AMD64/FreeBSD and ARM64/FreeBSD. There is preliminary support
for nanoMIPS/Linux. macOS is supported up to version 13 Ventura (amd64 only).

  - VALGRIND_RUNNING_VERSION returns the Valgrind version that
    the guest executable is running under. The value returned
    is a decimal value in the form Mmm where M is the major
    version and mm is the minor version. For instance, this
    release returns 328. Returns 0 if the executable is not
    running under Valgrind, or is running under a version older
    than 3.28.

  under valgrind. By default, Valgrind can handle to up to 8000 madvise
  the --max-threads setting (which defaults to 500) times 16.
517144  Add PACKUSDW SSE4.1 support for x86
519223  Recognize ioctl(UFFDIO_*) operations

--===============1279514540360809310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1996 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-791532cc1099e6f4949aabc399750cf98e0767d4"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:791532cc1099e6f4949aabc399750cf98e0767d4"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 471 Local 457 Mirrors 0 Missed 14 Current 357 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 536 of 828 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_create_spdx_setscene)
NOTE: Running task 696 of 2189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.28.0.bb:do_recipe_qa)
NOTE: recipe perl-5.44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe valgrind-3.28.0-r0: task do_recipe_qa: Started
NOTE: recipe perl-5.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe valgrind-3.28.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1748 of 2189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.28.0.bb:do_fetch)
NOTE: recipe valgrind-3.28.0-r0: task do_fetch: Started
NOTE: Running task 2140 of 2189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.28.0.bb:do_create_recipe_spdx)
NOTE: recipe valgrind-3.28.0-r0: task do_fetch: Succeeded
NOTE: Running task 2172 of 2189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.28.0.bb:do_unpack)
NOTE: Running task 2173 of 2189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.28.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe valgrind-3.28.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe valgrind-3.28.0-r0: task do_unpack: Started
NOTE: recipe valgrind-3.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe valgrind-3.28.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe valgrind-3.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe valgrind-3.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 2174 of 2189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.28.0.bb:do_patch)
NOTE: recipe valgrind-3.28.0-r0: task do_patch: Started
NOTE: recipe valgrind-3.28.0-r0: task do_patch: Succeeded
NOTE: Running task 2175 of 2189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2176 of 2189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.28.0.bb:do_populate_lic)
NOTE: recipe valgrind-3.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe valgrind-3.28.0-r0: task do_populate_lic: Started
NOTE: recipe valgrind-3.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2177 of 2189 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.28.0.bb:do_configure)
NOTE: recipe valgrind-3.28.0-r0: task do_configure: Started
NOTE: recipe valgrind-3.28.0-r0: task do_populate_lic: Succeeded
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.44.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_16.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-native_2.6.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/autoconf/autoconf_2.73.bb:do_populate_sysroot', 'virtual:native:
 /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/automake/automake_1.19.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'glibc', 'binutils-cross-x86_64', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-cross', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'linux-libc-headers', 'zlib-native', 'autoconf-native', 'automake-native', 'flex-native', 'gnu-config-native', 'patch-native', 'pseudo-native', 'zstd-native', 'attr-native', 'gmp-native', 'libmpc-native', 'mpfr-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_sitefiles
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_sitefiles finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing ACLOCAL="aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/recipe-sysroot/usr/share/aclocal/" autoreconf -Wcross --verbose --install --force --exclude=autopoint
| autoreconf: export WARNINGS=cross,no-obsolete
| autoreconf: Entering directory '.'
| autoreconf: configure.ac: not running autopoint: --exclude autopoint was given
| autoreconf: running: aclocal --aclocal-path=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/recipe-sysroot/usr/share/aclocal/ --force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: not using Libtool
| autoreconf: configure.ac: not using Intltool
| autoreconf: configure.ac: not using Gtkdoc
| autoreconf: configure.ac: no need to run autopoint (confirmed)
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/recipe-sysroot-native/usr/bin/autoconf --force
| configure.ac:4135: warning: AC_RUN_IFELSE called without default to allow cross compiling
| ../sources/autoconf-2.73/lib/autoconf/general.m4:3037: AC_RUN_IFELSE is expanded from...
| configure.ac:4135: the top level
| configure.ac:4156: warning: AC_RUN_IFELSE called without default to allow cross compiling
| ../sources/autoconf-2.73/lib/autoconf/general.m4:3037: AC_RUN_IFELSE is expanded from...
| configure.ac:4156: the top level
| configure.ac:4286: warning: cannot check for file existence when cross compiling
| ../sources/autoconf-2.73/lib/autoconf/general.m4:3066: AC_CHECK_FILE is expanded from...
| configure.ac:4286: the top level
| configure.ac:4372: warning: AC_RUN_IFELSE called without default to allow cross compiling
| ../sources/autoconf-2.73/lib/autoconf/general.m4:3037: AC_RUN_IFELSE is expanded from...
| configure.ac:4372: the top level
| configure.ac:4405: warning: AC_RUN_IFELSE called without default to allow cross compiling
| ../sources/autoconf-2.73/lib/autoconf/general.m4:3037: AC_RUN_IFELSE is expanded from...
| configure.ac:4405: the top level
| configure.ac:4472: warning: AC_RUN_IFELSE called without default to allow cross compiling
| ../sources/autoconf-2.73/lib/autoconf/general.m4:3037: AC_RUN_IFELSE is expanded from...
| configure.ac:4472: the top level
| configure.ac:4983: warning: AC_RUN_IFELSE called without default to allow cross compiling
| ../sources/autoconf-2.73/lib/autoconf/general.m4:3037: AC_RUN_IFELSE is expanded from...
| configure.ac:4983: the top level
| configure.ac:5151: warning: AC_RUN_IFELSE called without default to allow cross compiling
| ../sources/autoconf-2.73/lib/autoconf/general.m4:3037: AC_RUN_IFELSE is expanded from...
| configure.ac:5151: the top level
| configure.ac:5196: warning: AC_RUN_IFELSE called without default to allow cross compiling
| ../sources/autoconf-2.73/lib/autoconf/general.m4:3037: AC_RUN_IFELSE is expanded from...
| configure.ac:5196: the top level
| autoreconf: running: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/recipe-sysroot-native/usr/bin/autoheader --force
| autoreconf: running: automake --add-missing --copy --force-missing
| none/tests/arm/Makefile.am:93: warning: vcvt_fixed_float_VFP_CFLAGS multiply defined in condition TRUE ...
| none/tests/arm/Makefile.am:74: ... 'vcvt_fixed_float_VFP_CFLAGS' previously defined here
| autoreconf: configure.ac: not running make: --make not given
| autoreconf: Leaving directory '.'
| NOTE: Running ./configure  --build=x86_64-linux 		  --host=x86_64-poky-linux 		  --target=x86_64-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking --enable-tls --without-mpicc --enable-only64bit --disable-static
| configure: WARNING: unrecognized options: --disable-static
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/endian-little
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/common-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/common-glibc
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/x86_64-linux
| configure: loading site script /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/site/common
| checking for a BSD-compatible install... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/install -c
| checking whether sleep supports fractional seconds... yes
| checking filesystem timestamp resolution... 0.01
| checking whether build environment is sane... yes
| checking for x86_64-poky-linux-strip... x86_64-poky-linux-strip
| checking for a race-free mkdir -p... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking xargs -n works... yes
| checking whether UID '6000' is supported by ustar format... yes
| checking whether GID '6000' is supported by ustar format... yes
| checking how to create a ustar tar archive... gnutar
| checking whether to enable maintainer-specific portions of Makefiles... no
| checking whether ln -s works... yes
| checking for x86_64-poky-linux-gcc... x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -no-pie -fno-PIE --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/recipe-sysroot
| checking whether the C compiler works... yes
| checking for C compiler default output file name... a.out
| checking for suffix of executables...
| checking whether we are cross compiling... yes
| checking for suffix of object files... o
| checking whether the compiler supports GNU C... yes
| checking whether x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -no-pie -fno-PIE --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/recipe-sysroot accepts -g... yes
| checking for x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -no-pie -fno-PIE --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/recipe-sysroot option to enable C23 features... none needed
| checking whether x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -no-pie -fno-PIE --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/recipe-sysroot understands -c and -o together... yes
| checking whether make supports the include directive... yes (GNU style)
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -no-pie -fno-PIE --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/recipe-sysroot... none
| checking how to run the C preprocessor... x86_64-poky-linux-gcc -E --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/recipe-sysroot  -m64 -march=x86-64-v3 -no-pie -fno-PIE
| checking whether the compiler supports GNU C++... yes
| checking whether x86_64-poky-linux-g++  -m64 -march=x86-64-v3 -no-pie -fno-PIE --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/recipe-sysroot accepts -g... yes
| checking dependency style of x86_64-poky-linux-g++  -m64 -march=x86-64-v3 -no-pie -fno-PIE --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/recipe-sysroot... none
| checking for x86_64-poky-linux-ranlib... x86_64-poky-linux-gcc-ranlib
| checking for gcc-ranlib... no
| checking for a sed that does not truncate output... (cached) sed
| checking for gsha256sum... no
| checking for sha256sum... sha256sum
| checking for gcc-ar... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/gcc-ar
| checking for perl... (cached) /usr/bin/env perl
| checking for gdb... no
| checking for ggdb... no
| checking dependency style of x86_64-poky-linux-gcc  -m64 -march=x86-64-v3 -no-pie -fno-PIE --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/recipe-sysroot... none
| checking for diff -u... yes
| checking for a supported version of gcc... checking build system type... x86_64-pc-linux-gnu
| checking host system type... x86_64-poky-linux-gnu
| ok (16.2.0)
| checking for a supported CPU... ok (x86_64)
| checking for a 64-bit only build... yes
| checking for a 32-bit only build... no
| checking for a supported OS... ok (linux-gnu)
| checking for the kernel version... 2.6 or later (4.18.0-553.174.1.el8_10.x86_64)
| checking for 32 bit build and execution support... cross compiling, assuming no
| checking for a supported CPU/OS combination... ok (amd64-linux)
| checking for use as an inner Valgrind... no
| checking for using the undefined behaviour sanitiser... no
| checking where gdb scripts are installed... /usr/libexec/valgrind
| checking for stdio.h... yes
| checking for stdlib.h... yes
| checking for string.h... yes
| checking for inttypes.h... yes
| checking for stdint.h... yes
| checking for strings.h... yes
| checking for sys/stat.h... yes
| checking for sys/types.h... yes
| checking for unistd.h... yes
| checking for sys/time.h... yes
| checking for sys/param.h... yes
| checking for features.h... yes
| checking for egrep -e... /srv/pokybuild/yocto-worker/auh/build/build/tmp/hosttools/grep -E
| checking whether pthread_create needs libpthread... no
| checking the glibc version... 2.44 family
| checking for AT_FDCWD... yes
| checking for MADV_GUARD_INSTALL... yes
| checking for stpncpy... yes
| checking for PTRACE_GETREGS... yes
| checking for CLOCK_MONOTONIC... yes
| checking for Elf32_Chdr... yes
| checking for Elf64_Chdr... yes
| checking for pthread_rwlock_t... yes
| checking for clockid_t... yes
| checking for PTHREAD_MUTEX_ADAPTIVE_NP... yes
| checking for PTHREAD_MUTEX_ERRORCHECK_NP... yes
| checking for PTHREAD_MUTEX_RECURSIVE_NP... yes
| checking for PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP... yes
| checking for pthread_mutex_t.__m_kind... no
| checking for pthread_mutex_t.__data.__kind... yes
| checking that assembler knows ISA 2.07 instructions ... no
| checking for Altivec support in the compiler ... no
| checking for VSX compiler flag support... no
| checking for VSX support in the assembler ... no
| checking that assembler knows DFP... no
| checking that compiler knows -mhard-dfp switch... no
| checking that compiler knows DFP datatypes... yes
| checking if compiler accepts the -mhtm flag... no
| checking if compiler can find the htm builtins... no
| checking that assembler knows ISA 3.00 ... no
| checking that assembler knows xscvhpdp ... no
| checking that assembler knows darn instruction ... no
| checking that compiler supports power9 (ISA 3.0) ... no
| checking that assembler knows ISA 3.1 ... no
| checking that compiler supports power10 and power11 (ISA 3.1)... no
| checking for pthread_create@GLIBC2.0()... no
| checking for dlinfo RTLD_DI_TLS_MODID... yes
| checking for eventfd()... yes
| checking that C++ compiler can compile C++17 code... yes
| checking that C++ compiler supports constexpr if... yes
| checking that C++ compiler supports std::align_val_t... yes
| checking that C++ compiler can include <thread> header file... yes
| checking that C++ compiler can include <condition_variable> header file... yes
| checking that C++ compiler can use std::shared_timed_mutex... yes
| checking that C++ compiler can use std::timed_mutex... yes
| checking if g++ accepts -faligned-new... yes
| checking if g++ accepts -fsized-deallocation... yes
| checking if g++ supports aligned new and delete... yes
| checking if g++ supports __sync_add_and_fetch... yes
| checking if libstdc++ supports annotating shared pointers... yes
| checking for struct user_regs_struct... yes
| checking for __NR_membarrier... yes
| checking for __NR_io_pgetevents... yes
| checking for PROCMAP_QUERY... yes
| checking if gcc accepts -m32... yes
| checking if gcc accepts -m64... yes
| checking if gcc accepts -march=octeon... no
| checking if gcc accepts -march=octeon2... no
| checking if gcc accepts -mmsa... no
| checking if gcc is producing mips n32 binaries... no
| checking if gcc is producing mips n64 binaries... no
| checking if gcc accepts -mmmx... yes
| checking if gcc accepts -msse... yes
| checking if gcc accepts -mpreferred-stack-boundary=2 -m32... yes
| checking if gcc accepts -mlong-double-128... yes
| checking for using the link time optimisation... no
| checking if gcc accepts -Wmemset-transposed-args... yes
| checking if gcc accepts -Wnonnull... yes
| checking if gcc accepts -Woverflow... yes
| checking if gcc accepts -Wpointer-sign... yes
| checking if gcc accepts -Wuninitialized... yes
| checking if gcc accepts -Wmaybe-uninitialized... yes
| checking if gcc accepts -Wunused-function... yes
| checking if gcc accepts -Wstatic-local-in-inline... no
| checking if gcc accepts -Wmismatched-new-delete... yes
| checking if gcc accepts -Winfinite-recursion... yes
| checking if gcc accepts -Wexpansion-to-defined... yes
| checking if gcc accepts -Wunused-variable... yes
| checking if gcc accepts -Wunused-but-set-variable... yes
| checking if gcc accepts -Wnon-power-of-two-alignment... no
| checking if gcc accepts -Wsign-compare... yes
| checking if gcc accepts -Wstringop-overflow... yes
| checking if gcc accepts -Wstringop-overread... yes
| checking if gcc accepts -Wstringop-truncation... yes
| checking if gcc accepts -Wformat-overflow... yes
| checking if gcc accepts -Wuse-after-free... yes
| checking if gcc accepts -Wfree-nonheap-object... yes
| checking if gcc accepts -Wfortify-source... no
| checking if gcc accepts -Wbuiltin-memcpy-chk-size... no
| checking if gcc accepts -Wincompatible-pointer-types-discards-qualifiers... no
| checking if gcc accepts -Wsuspicious-bzero... no
| checking if gcc accepts -Wattributes... yes
| checking if gcc accepts -Wunused-result... yes
| checking if gcc accepts -Winfinite-recursion... yes
| checking if gcc accepts -Wdeprecated... yes
| checking if gcc accepts -Walloc-size... yes
| checking if gcc accepts -Wdeprecated-declarations... yes
| checking if gcc accepts -Wnullability-completeness... no
| checking if gcc accepts -Wwrite-strings... yes
| checking if gcc accepts -Wempty-body... yes
| checking if gcc accepts -Wformat... yes
| checking if gcc accepts -Wformat-signedness... yes
| checking if gcc accepts -Wcast-qual... yes
| checking if gcc accepts -Wold-style-declaration... yes
| checking if gcc accepts -Wignored-qualifiers... yes
| checking if gcc accepts -Wmissing-parameter-type... yes
| checking if gcc accepts -Wlogical-op... yes
| checking if gcc accepts -Wenum-conversion... yes
| checking if gcc accepts -Wimplicit-fallthrough=2... yes
| checking if gcc accepts -Walloc-size-larger-than=18446744073709551616... yes
| checking if g++ accepts -Wmissing-exception-spec... no
| checking if g++ accepts -Wimplicit-exception-spec-mismatch... no
| checking if gcc accepts -Wformat-security... yes
| checking if gcc accepts -Wextra or -W... -Wextra
| checking if gcc accepts -fno-stack-protector... yes
| checking if gcc accepts -finline-functions... yes
| checking if gcc accepts -fno-diagnostics-show-caret... yes
| checking if gcc accepts -ftrack-macro-expansion=0... yes
| checking if gcc accepts -fno-ipa-icf... yes
| checking if gcc accepts --param inline-unit-growth... yes
| checking if gcc accepts -gdwarf-4 -fdebug-types-section... yes
| checking if gcc accepts -g -gz=zlib... yes
| checking if gcc accepts -g -gz=zlib-gnu... yes
| checking if gcc accepts -g -gz=zstd... no
| checking if gcc accepts nested functions... yes
| checking if gcc accepts the 'p' constraint in asm statements... yes
| checking if gcc accepts -pie... yes
| checking if gcc accepts -ansi... yes
| checking if gcc accepts -no-pie... yes
| checking if the linker accepts -Wl,--image-base... yes
| configure: ld --image-base or -Ttext-segment used, no need to strip build-id NOTEs.
| checking if the linker accepts -Wl,--no-warn-execstack... yes
| checking if ppc32/64 as supports mtocrf/mfocrf... no
| checking if ppc32/64 asm supports phased out floating point instructions... no
| checking if amd64 assembler supports fxsave64/fxrstor64... yes
| checking if x86/amd64 assembler speaks SSE3... yes
| checking if x86/amd64 assembler speaks SSSE3... yes
| checking if x86/amd64 assembler supports 'pclmulqdq'... yes
| checking if x86/amd64 assembler supports 'vpclmulqdq'... yes
| checking if x86/amd64 assembler supports FMA4 'vfmaddpd'... yes
| checking if x86/amd64 assembler supports 'lzcnt'... yes
| checking if x86/amd64 assembler supports 'loopnel'... yes
| checking if x86/amd64 assembler supports 'addr32'... yes
| checking if x86/amd64 assembler speaks SSE4.2... yes
| checking if x86/amd64 assembler speaks SSE4.2 x86... yes
| checking if x86/amd64 assembler speaks AES... yes
| checking if x86/amd64 assembler speaks AVX... yes
| checking if x86/amd64 assembler speaks AVX2... yes
| checking if x86/amd64 assembler speaks TSX... yes
| checking if x86/amd64 assembler speaks BMI1 and BMI2... yes
| checking if x86/amd64 assembler speaks FMA... yes
| checking if amd64 assembler knows the MPX instructions... no
| checking if amd64 assembler knows the ADX instructions... yes
| checking if amd64 assembler knows the RDRAND instruction... yes
| checking if amd64 assembler knows the RDSEED instruction... yes
| checking if amd64 assembler knows the F16C instructions... yes
| checking if x86/amd64 assembler knows the MOVBE insn... yes
| checking if x86/amd64 assembler knows the MOVBE insn x86... yes
| checking if gcc supports the ifunc attribute... yes
| checking if gcc supports the armv8 crc feature flag... no
| checking if gcc supports the armv81 feature flag and assembler supports v8.1 instructions... no
| checking if gcc supports the armv82 feature flag and assembler supports v8.2 instructions... no
| checking if armv82-a+dotprod is supported for tests... configure: error: in '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/sources/valgrind-3.28.0':
| configure: error: cannot run test program while cross compiling
| See 'config.log' for more details
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/sources/valgrind-3.28.0/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/temp/run.do_configure.1580001:275 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/temp/run.do_configure.1580001, line 275
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/temp/run.do_configure.1580001, line 251
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/temp/run.do_configure.1580001, line 224
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/temp/run.do_configure.1580001, line 145
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/temp/run.do_configure.1580001, line 279
NOTE: recipe valgrind-3.28.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2177 tasks of which 2168 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261024053012.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261024053012.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.28.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/temp/log.do_configure.1580001
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: valgrind-3.28.0-r0 do_configure: configure failed
ERROR: valgrind-3.28.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/temp/run.do_configure.1580001' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/valgrind/3.28.0/temp/log.do_configure.1580001
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/valgrind/valgrind_3.28.0.bb:do_configure) failed with exit code '1'

--===============1279514540360809310==--
