Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63EB0C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 16:37:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.303.1746031055952567406
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 09:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7215ac96c5=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U6UftS030551;
	Wed, 30 Apr 2025 16:37:33 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6ug10rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 30 Apr 2025 16:37:33 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 30 Apr 2025 09:37:31 -0700
Received: from pop-os.wrs.com (172.25.44.3) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.43 via Frontend
 Transport; Wed, 30 Apr 2025 09:37:31 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <khem.raj@gmail.com>
Subject: [PATCH] valgrind: Upgrade from 3.24.0 to 3.25.0
Date: Wed, 30 Apr 2025 12:37:30 -0400
Message-ID: <20250430163730.3013394-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Xf6JzJ55 c=1 sm=1 tr=0 ts=681251cd cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=vMm7aj2tAAAA:8 a=3fyaaF4VAAAA:8 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=6ohNodAXAAAA:8
 a=QyXUC8HyAAAA:8 a=Uo9xHAOyZmI0EItA7IsA:9 a=tcE9Nx1ts1u96dY2:21 a=QVpHfkqoFdcA:10 a=cezRDF3_UckA:10 a=r6sWxlpsa93XciTrHfvA:22 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=0gLUg1G2xj6MhZ7RLP3J:22
X-Proofpoint-GUID: 3aUZ2EAFZ2lxZacmRC7rGteouVhEcQQA
X-Proofpoint-ORIG-GUID: 3aUZ2EAFZ2lxZacmRC7rGteouVhEcQQA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDExOCBTYWx0ZWRfX3+BfRVtBF3Ar zgTo/Gk6IO3m0Cu246mh73gsiVcfLQl2kKAnmQsXug9klL//LKRlP2ofS+bWTxqePvzZBur+m1n F6Q/PFgss31xeZitkG3fkRp+rFASxmPsn83CHTvHB1IYTV0rL1JQhU9NkfnK//VMIYFWWN58mzy
 CULYWYt+fnQhD2+sJJ/xdN62hCosyZLYxNCCIhMNa301lF9as5DNKqIWJO+8+DsHmA59E3Pm19w dT1QrpA8uzeXgELUgSCx6MUyOrOiBkfNQQxfke8nS3UEH0PXGxp9Bxo4JpcjPYko3EGwyPtGba8 Kkv3rf5CAsrL1uZqE5kRyoT3Jc4w9DErxtn32t2bb3vOJtjPke0oTfnslM61y6PG0UFq7qG7d/M
 dptP3cMb2VfLsY0M/U1CfsibSrKP7WYQ9H0NfohoL8FJfCGMQH/8fvydl0LRwcgKeSLBXqGr
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 16:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215753

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Declare riscv64 as a COMPATIBLE_HOST since upstream now support it.
For that target 'valgrind /bin/ls' warns with:
   --253-- WARNING: unhandled riscv64-linux syscall: 258
   --253-- You may be able to write your own handler.
   --253-- Read the file README_MISSING_SYSCALL_OR_IOCTL.
   --253-- Nevertheless we consider this a bug.  Please report
   --253-- it at http://valgrind.org/support/bug_reports.html.
This is a known issue:
   https://bugs.kde.org/show_bug.cgi?id=503253
but the tool does work, despite this warning with glibc.
For riscv64 with musl, the build is fine but running:
   # valgrind /bin/ls
produces the fatal error:
   ==306== Process terminating with default action of signal 4 (SIGILL)
   ==306==  Illegal opcode at address 0x1002015952
   ==306==    at 0x40E5F26: map_library (dynlink.c:845)
   ==306==    by 0x40E6C97: load_library (dynlink.c:1183)
   ==306==    by 0x40E7B63: load_preload (dynlink.c:1365)
   ==306==    by 0x40E7B63: __dls3 (dynlink.c:1963)
   ==306==    by 0x40E75D9: __dls2 (dynlink.c:1767)
   ==306==    by 0xFFFFFFFFFFFFFFFF: ???
which is not yet reported.

Patches reviewed, manually fix-up one word change in:
   0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
and refresh patches with devtool.

* ==================== CORE CHANGES ===================

* The valgrind gdbserver now supports the GDB remote protocol packet
  'x addr,len' (available in GDB release >= 16).
  The x packet can reduce the time taken by GDB to read memory from valgrind.

* Valgrind now supports zstd compressed debug sections.

* The Linux Test Project (ltp) is integrated in the testsuite try
  'make ltpchecks' (this will take a while and will point out various
  missing syscalls and valgrind crashes!)

* ================== PLATFORM CHANGES =================

* Added RISCV64 support for Linux. Specifically for the RV64GC
  instruction set.

* Numerous bug fixes for Illumos, in particular fixed a Valgrind crash
  whenever a signal handler was called.

* On FreeBSD, a change to the libc code that runs atexit handlers was
  causing Helgrind to produce an extra error about exiting threads
  still holding locks for. This applied to every multithreaded application.
  The extra error is now filtered out. A syscall wrapper had been added
  for getrlimitusage.

* On Linux various new syscalls are supported (landlock*, io_pgetevents,
  open_tree, move_mount, fsopen, fsconfig, fsmount, fspick, userfaultfd).

* s390x has support for various new instructions (BPP, BPRP, PPA and NIAI).

* ==================== TOOL CHANGES ===================

* The --track-fds=yes and --track-fds=all options now treat all
  inherited file descriptors the same as 0, 1, 2 (stdin/out/err).
  And when the stdin/out/err descriptors are reassigned they are
  now treated as normal (non-inherited) file descriptors.

* A new option --modify-fds=high can be used together with
  --track-fds=yes to create new file descriptors with the highest
  possible number (and then decreasing) instead of always using the
  lowest possible number (which is required by POSIX). This will help
  catch issues where a file descriptor number might normally be reused
  between a close and another open call.

* Helgrind:
  There is a change to warnings about calls to pthread_cond_signal and
  pthread_cond_broadcast when the associated mutex is unlocked. Previously
  Helgrind would always warn about this. Now this error is controlled by
  a command line option, --check-cond-signal-mutex=yes|no. The default is
  no. This change has been made because some C and C++ standard libraries
  use pthread_cond_signal/pthread_cond_broadcast in this way. Users are
  obliged to use suppressions if they wish to avoid this noise.

The full 3.25.0 bug fix list can be found here:
   https://valgrind.org/docs/manual/dist.news.html

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch |  6 +++---
 .../valgrind/0001-docs-Disable-manual-validation.patch |  8 ++++----
 ...es-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch |  4 ++--
 .../0001-memcheck-tests-Fix-timerfd-syscall-test.patch | 10 +++++-----
 ...-memcheck-vgtests-remove-fullpath-after-flags.patch |  2 +-
 ...tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch |  6 +++---
 ...queue-Rename-_sifields-to-__si_fields-on-musl.patch |  2 +-
 .../valgrind/0001-tests-arm-Use-O-instead-of-O0.patch  |  2 +-
 ...-valgrind-filter_xml_frames-do-not-filter-usr.patch |  2 +-
 ...3-correct-include-directive-path-for-config.h.patch |  2 +-
 ...ed-support-for-PPC-instructions-mfatbu-mfatbl.patch |  4 ++--
 ...avoid-neon-for-targets-which-don-t-support-it.patch |  4 ++--
 .../valgrind/valgrind/fixed-perl-path.patch            |  2 +-
 .../valgrind/valgrind/s390x_vec_op_t.patch             |  6 +++---
 ...appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch |  2 +-
 ...rind-make-ld-XXX.so-strlen-intercept-optional.patch |  6 +++---
 .../{valgrind_3.24.0.bb => valgrind_3.25.0.bb}         |  4 ++--
 17 files changed, 36 insertions(+), 36 deletions(-)
 rename meta/recipes-devtools/valgrind/{valgrind_3.24.0.bb => valgrind_3.25.0.bb} (97%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch b/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
index 4ee5288336..3c8bec82b3 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
@@ -1,4 +1,4 @@
-From 26a3367fbbab2a664a288f4ff8ef3273ebe57124 Mon Sep 17 00:00:00 2001
+From 5a776e61af5ab7f0cfd10cde55c796189686916f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 10 May 2024 16:27:34 -0700
 Subject: [PATCH] configure: Drop setting mcpu=cortex-a8 on arm
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 095659a..75d42c9 100755
+index 2dfbd1c..b42fdd4 100755
 --- a/configure.ac
 +++ b/configure.ac
-@@ -275,13 +275,13 @@ case "${host_cpu}" in
+@@ -251,13 +251,13 @@ case "${host_cpu}" in
  
       armv8*)
          AC_MSG_RESULT([ok (${host_cpu})])
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
index df6f77cba4..fbd799eeea 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-validation.patch
@@ -1,4 +1,4 @@
-From 7fa34af750f113fd600cabcecb79e65b9d04fa15 Mon Sep 17 00:00:00 2001
+From 4f674f458b1f0675abdc0ced01239e99bfa40de8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Jan 2022 18:26:02 -0800
 Subject: [PATCH] docs: Disable manual validation
@@ -19,11 +19,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/docs/Makefile.am b/docs/Makefile.am
-index 6859ee8..d5e4e2f 100644
+index 68a3da5..9833d5c 100644
 --- a/docs/Makefile.am
 +++ b/docs/Makefile.am
-@@ -195,7 +195,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
- 	  touch $@; \
+@@ -202,7 +202,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
+ 	  fi \
  	fi
  
 -check-local: valid-manual valid-manpages
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
index ef65edfb76..f8d1e87ba9 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
@@ -1,4 +1,4 @@
-From a9292f711375c12c5135b207698e623e297b049b Mon Sep 17 00:00:00 2001
+From c878aaacadf8ec723be882f9335cb33240df13d6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Apr 2017 10:11:16 -0700
 Subject: [PATCH] makefiles: Drop setting -mcpu to cortex-a8 on arm
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/helgrind/tests/Makefile.am b/helgrind/tests/Makefile.am
-index d7101ed..670c29f 100755
+index 7adc5c6..cac23c9 100755
 --- a/helgrind/tests/Makefile.am
 +++ b/helgrind/tests/Makefile.am
 @@ -226,9 +226,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
index fe652ccdb4..200b2602cb 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timerfd-syscall-test.patch
@@ -1,4 +1,4 @@
-From ddf3ac832d85bd9a1266c52ff3ae5ec88c4114db Mon Sep 17 00:00:00 2001
+From 3a51ed107f67732910dec12279a9279e158afbe7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 9 Mar 2020 16:30:19 -0700
 Subject: [PATCH] memcheck/tests: Fix timerfd syscall test
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 15 insertions(+), 3 deletions(-)
 
 diff --git a/config.h.in b/config.h.in
-index d2e8b26..f235dec 100644
+index 00db1a6..23fd77a 100644
 --- a/config.h.in
 +++ b/config.h.in
-@@ -406,6 +406,9 @@
+@@ -409,6 +409,9 @@
  /* Define to 1 if you have the <sys/sysnvl.h> header file. */
  #undef HAVE_SYS_SYSNVL_H
  
@@ -30,10 +30,10 @@ index d2e8b26..f235dec 100644
  #undef HAVE_SYS_TIME_H
  
 diff --git a/configure.ac b/configure.ac
-index 75d42c9..b6ec119 100755
+index b42fdd4..ec95146 100755
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4844,6 +4844,7 @@ AC_CHECK_HEADERS([       \
+@@ -4892,6 +4892,7 @@ AC_CHECK_HEADERS([       \
          sys/syscall.h    \
          sys/sysnvl.h     \
          sys/time.h       \
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
index bb32fa0bda..9a3596cac1 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
@@ -1,4 +1,4 @@
-From f5c0021a016116c53d21d8d5902ea92e682658b6 Mon Sep 17 00:00:00 2001
+From b703b0d11adc9147a7d97817bd771ac40b8c4d39 Mon Sep 17 00:00:00 2001
 From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
 Date: Wed, 16 Sep 2020 13:45:07 -0400
 Subject: [PATCH] memcheck vgtests remove fullpath-after flags
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
index 10e7d71622..7deca99202 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
@@ -1,4 +1,4 @@
-From 4c27b9259f4aa1b4dc0741c56ab90b6c57905564 Mon Sep 17 00:00:00 2001
+From bbb5e8a6fc5eec178f8077ab006ab42c009528d4 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 24 Jan 2020 17:55:39 +0100
 Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
@@ -13,13 +13,13 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/none/tests/fdleak_cmsg.stderr.exp b/none/tests/fdleak_cmsg.stderr.exp
-index 0fe56ea..5a0605e 100644
+index 6b3b53f..45e7e2f 100644
 --- a/none/tests/fdleak_cmsg.stderr.exp
 +++ b/none/tests/fdleak_cmsg.stderr.exp
 @@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null
  
  
- FILE DESCRIPTORS: 6 open (3 std) at exit.
+ FILE DESCRIPTORS: 6 open (3 inherited) at exit.
 -Open file descriptor ...: /tmp/data2
 +Open file descriptor ...: ...
     ...
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
index 1f2cce1a55..efa6c2c895 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
@@ -1,4 +1,4 @@
-From 4dddd9e533847f07327cde9a062fc7cbba9d5584 Mon Sep 17 00:00:00 2001
+From c287382a1f3dd9f2db3df54dde54b4b266791bb9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 00:46:39 -0700
 Subject: [PATCH] sigqueue: Rename _sifields to __si_fields on musl
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
index a5afc78b07..3eea195579 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-of-O0.patch
@@ -1,4 +1,4 @@
-From 0fba6bce02108b355a291f7dcb9497d0c7291e6b Mon Sep 17 00:00:00 2001
+From 8087ae8dcc46f3f81af58ed9b7176761b988ee61 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 10 May 2024 17:44:47 -0700
 Subject: [PATCH] tests/arm: Use -O instead of -O0
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
index 974c1a2362..c64c2afd3f 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
@@ -1,4 +1,4 @@
-From a7437450577c324d6f85a6e9d7b61be76555d49a Mon Sep 17 00:00:00 2001
+From f8fbebcf69e4a8bf2122b7c55f2ce372377af1bc Mon Sep 17 00:00:00 2001
 From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Mon, 13 May 2019 17:12:21 -0400
 Subject: [PATCH] valgrind: filter_xml_frames: do not filter /usr
diff --git a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
index 21725f3d3c..3acb5a28f4 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directive-path-for-config.h.patch
@@ -1,4 +1,4 @@
-From fbddd889e2fbc1195009d8947211b8900c03c641 Mon Sep 17 00:00:00 2001
+From de4d7e478515b63f049b211266d9b946c15cc0b9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 01:03:17 -0700
 Subject: [PATCH] correct include directive path for config.h
diff --git a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
index 24b9edbccf..109caf76ab 100644
--- a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
@@ -1,4 +1,4 @@
-From 6e914403985f3f094e318b06ee206f7df16215cf Mon Sep 17 00:00:00 2001
+From 85bff993087cd7367ffc35de525c2bf6162398d2 Mon Sep 17 00:00:00 2001
 From: Aneesh Bansal <aneesh.bansal@freescale.com>
 Date: Mon, 21 Nov 2011 17:31:39 +0530
 Subject: [PATCH] Added support for PPC instructions mfatbu, mfatbl.
@@ -59,7 +59,7 @@ index 2611e52..72c349b 100644
  /* CALLED FROM GENERATED CODE */
  /* DIRTY HELPER (reads guest state, writes guest mem) */
 diff --git a/VEX/priv/guest_ppc_toIR.c b/VEX/priv/guest_ppc_toIR.c
-index 94930aa..be2ac0a 100644
+index 18716dd..b2e72a0 100644
 --- a/VEX/priv/guest_ppc_toIR.c
 +++ b/VEX/priv/guest_ppc_toIR.c
 @@ -11875,6 +11875,28 @@ static Bool dis_proc_ctl ( const VexAbiInfo* vbi, UInt prefix, UInt theInstr )
diff --git a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
index fb5e32b3bb..1597b3a021 100644
--- a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-don-t-support-it.patch
@@ -1,4 +1,4 @@
-From 5c0afe3f46d52923dd37845aea1e51be1e54ce19 Mon Sep 17 00:00:00 2001
+From 596372bc9b4d31bc9811881cfa747d99a8c25141 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 19 Jan 2016 16:42:36 -0800
 Subject: [PATCH] avoid neon for targets which don't support it
@@ -16,7 +16,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/memcheck/tests/sh-mem-random.c b/memcheck/tests/sh-mem-random.c
-index ae82248..816e139 100644
+index 0e01684..e41957e 100644
 --- a/memcheck/tests/sh-mem-random.c
 +++ b/memcheck/tests/sh-mem-random.c
 @@ -191,7 +191,7 @@ void do_test_at ( U1* arr )
diff --git a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
index 59f6daa7bd..6bfc6035ed 100644
--- a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
@@ -1,4 +1,4 @@
-From 8258b92d458ffed94d90cb8f43b766e29f364601 Mon Sep 17 00:00:00 2001
+From 408f9b39ca4f5709b668f13829a94c4cae855006 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 31 Aug 2010 22:51:58 +0800
 Subject: [PATCH] valgrind: fix perl scripts
diff --git a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
index 07578c5b02..19690e5ebb 100644
--- a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
@@ -1,4 +1,4 @@
-From 5dbb49abc08acb9a484bc187c18c433fb821d281 Mon Sep 17 00:00:00 2001
+From 8c92089741d809cfd18354f1b4df18cd28398a20 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Wed, 17 Mar 2021 12:16:31 -0400
 Subject: [PATCH] remove s390x_vec_op_t
@@ -18,10 +18,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/VEX/priv/guest_s390_defs.h b/VEX/priv/guest_s390_defs.h
-index a64d563..fb963e9 100644
+index 29efa01..3a8f0a0 100644
 --- a/VEX/priv/guest_s390_defs.h
 +++ b/VEX/priv/guest_s390_defs.h
-@@ -286,7 +286,7 @@ typedef enum {
+@@ -285,7 +285,7 @@ typedef enum {
     S390_VEC_OP_VCLFNL,
     S390_VEC_OP_VCRNF,
     S390_VEC_OP_LAST             // supposed to be the last element in enum
diff --git a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
index a2a96cf735..0c18a63c2b 100644
--- a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
@@ -1,4 +1,4 @@
-From 2446e14216b6888dd39eed877bc6952c577b4e41 Mon Sep 17 00:00:00 2001
+From a5cd00f1c2d78e2a15f4a0c595f5ac10ca4c3290 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 19 Jan 2016 16:00:00 -0800
 Subject: [PATCH] use appropriate -march/-mcpu/-mfpu for ARM test apps
diff --git a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
index aa852e9115..ca7f721d9c 100644
--- a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
@@ -1,4 +1,4 @@
-From 18919d07e531a06c6fba74d4e43f6200f79aaca3 Mon Sep 17 00:00:00 2001
+From b407514aa1a4fd3667b30527260e271da34ce4a7 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 13 Dec 2016 11:29:55 +0800
 Subject: [PATCH] make ld-XXX.so strlen intercept optional
@@ -17,10 +17,10 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 12 insertions(+), 1 deletion(-)
 
 diff --git a/coregrind/m_redir.c b/coregrind/m_redir.c
-index f9e8d88..453732e 100644
+index 63172b9..1b5bf95 100644
 --- a/coregrind/m_redir.c
 +++ b/coregrind/m_redir.c
-@@ -1315,7 +1315,18 @@ static void add_hardwired_spec (const  HChar* sopatt, const HChar* fnpatt,
+@@ -1321,7 +1321,18 @@ static void add_hardwired_spec (const  HChar* sopatt, const HChar* fnpatt,
     spec->to_addr     = to_addr;
     spec->isWrap      = False;
     spec->isGlobal    = False;
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.24.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.25.0.bb
similarity index 97%
rename from meta/recipes-devtools/valgrind/valgrind_3.24.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.25.0.bb
index 34c306ca52..67166a4ef0 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.24.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.25.0.bb
@@ -26,10 +26,10 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-docs-Disable-manual-validation.patch \
            file://0001-tests-arm-Use-O-instead-of-O0.patch \
            "
-SRC_URI[sha256sum] = "71aee202bdef1ae73898ccf7e9c315134fa7db6c246063afc503aef702ec03bd"
+SRC_URI[sha256sum] = "295f60291d6b64c0d90c1ce645634bdc5361d39b0c50ecf9de6385ee77586ecc"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
-COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
+COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64|riscv64).*-linux'
 
 # valgrind supports armv7 and above
 COMPATIBLE_HOST:armv4 = 'null'
-- 
2.34.1


