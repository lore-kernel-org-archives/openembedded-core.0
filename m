Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A06C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 01:30:30 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.5892.1635989429905571339
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 18:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n64TDuKE;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id j9so3990251pgh.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 18:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qd8sChBHOjuIbi2MrlNfaLPlbGMGILz+mrG6yU25cJA=;
        b=n64TDuKEAYrusYiKchDGfiw2BSJ00rxvc+h4biTeytnvA7dJ85g1NGkV3U4Ji9Rx40
         pyr1tDQ/Hhur5ea2Gtueu0LDBZMNii6VQ9EpxRUFk7dbVJpn+4Jiq/qnCY2aVaxng6Jt
         7q/9uV7bgZ77ZGBM+9tAFd0BIULmYDes990dDQthTaGMPkkixlOh4e20G5lS5qX5adDY
         ZQIRikZGUw8uUI2yejvQUI9ote6N9dSL/7vAjD72itRW9hK3UFLqFaGoqpJ5jxgClfzW
         7g4Xjimh0loRga/VrmNX4orWGKmfgOLCG95xDVnQ4gKaYbN3yF5gUxtU7L/12mwoODqz
         o/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qd8sChBHOjuIbi2MrlNfaLPlbGMGILz+mrG6yU25cJA=;
        b=6OYyS16YJHRjo6O9c5vb6i6bHCwKYLHfGzRm86LAhMB+OTW6rQrABIQiH4zikYVMCe
         Bjg4wCco7nw8YzKQB9+jCo9ox4AZFWnXPViO6jixZGG62UGMNJ8g6h0FZi1gd9ZoGtJa
         nZJv9oyCEO3O7gvgZsoqckehOhxiHFFZkEs4RVQCvPQuqmo9hP2VFpZS25zH2HPaGJCX
         2NCKZ9dp6irgD8Jdbq/gcF/Os1MD+j5d4eI2NusKwURp+rLJi2ShVjiZJ8vmPkm2dZmG
         0GUa6hyphEdKekYMvVqsgYbS1w5viZGgX5CF/SARqYXiiCKWha5metEM6+/HqPw2ryaT
         58TQ==
X-Gm-Message-State: AOAM532AZOLGW7+8qcOl/vfPZpLqppGMCgvZ/q8H42uxHm1oNbxcVBb6
	5ZfFIn9fvlHuEymtmMfFoR3Ip/R092w=
X-Google-Smtp-Source: 
 ABdhPJzynfEn+wFODGM6mQU3cNWtxBEw7vwrCgmyCsAqdFTLFiYIaOYuAqg5zch21f596sdzbYXTYw==
X-Received: by 2002:a63:d14:: with SMTP id c20mr36723018pgl.118.1635989427414;
        Wed, 03 Nov 2021 18:30:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 k4sm2748101pjl.20.2021.11.03.18.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 18:30:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] gdb: Upgrade to 11.1
Date: Wed,  3 Nov 2021 18:30:23 -0700
Message-Id: <20211104013024.3517635-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 01:30:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157834

Drop backported patches
Changes are here [1]

[1] https://sourceware.org/pipermail/gdb-announce/2021/000129.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../gdb/{gdb-10.2.inc => gdb-11.1.inc}        |  14 +-
 ...ian_10.2.bb => gdb-cross-canadian_11.1.bb} |   0
 .../{gdb-cross_10.2.bb => gdb-cross_11.1.bb}  |   0
 ...make-man-install-relative-to-DESTDIR.patch |  20 +-
 ...ux-nat-Define-_ABIO32-if-not-defined.patch |   8 +-
 ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  10 +-
 ...port-for-Renesas-SH-sh4-architecture.patch |  39 +-
 ...readline.a-when-using-disable-static.patch |  12 +-
 .../gdb/gdb/0006-use-asm-sgidefs.h.patch      |   8 +-
 ...atch => 0007-Change-order-of-CFLAGS.patch} |  12 +-
 ...8-resolve-restrict-keyword-conflict.patch} |   8 +-
 ...> 0009-Fix-invalid-sigprocmask-call.patch} |   8 +-
 ...h => 0010-gdbserver-ctrl-c-handling.patch} |  10 +-
 ...-arc-Add-support-for-signal-handlers.patch | 218 ---------
 ...-for-signal-frames-for-Linux-targets.patch | 232 ----------
 ...count-the-REGNUM-in-supply-collect-g.patch | 104 -----
 ...-native-support-for-ARC-in-GNU-Linux.patch | 414 ------------------
 .../gdb/{gdb_10.2.bb => gdb_11.1.bb}          |   0
 19 files changed, 74 insertions(+), 1045 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-10.2.inc => gdb-11.1.inc} (56%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_10.2.bb => gdb-cross-canadian_11.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_10.2.bb => gdb-cross_11.1.bb} (100%)
 rename meta/recipes-devtools/gdb/gdb/{0008-Change-order-of-CFLAGS.patch => 0007-Change-order-of-CFLAGS.patch} (75%)
 rename meta/recipes-devtools/gdb/gdb/{0009-resolve-restrict-keyword-conflict.patch => 0008-resolve-restrict-keyword-conflict.patch} (91%)
 rename meta/recipes-devtools/gdb/gdb/{0010-Fix-invalid-sigprocmask-call.patch => 0009-Fix-invalid-sigprocmask-call.patch} (90%)
 rename meta/recipes-devtools/gdb/gdb/{0011-gdbserver-ctrl-c-handling.patch => 0010-gdbserver-ctrl-c-handling.patch} (82%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0012-arc-Add-support-for-signal-handlers.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0013-arc-Add-support-for-signal-frames-for-Linux-targets.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0014-arc-Take-into-account-the-REGNUM-in-supply-collect-g.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0015-gdb-Add-native-support-for-ARC-in-GNU-Linux.patch
 rename meta/recipes-devtools/gdb/{gdb_10.2.bb => gdb_11.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 58f49800c4..88eafb3ce0 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -19,7 +19,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "11.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.37%"
-GDBVERSION ?= "10.%"
+GDBVERSION ?= "11.%"
 GLIBCVERSION ?= "2.34"
 LINUXLIBCVERSION ?= "5.14%"
 QEMUVERSION ?= "6.1%"
diff --git a/meta/recipes-devtools/gdb/gdb-10.2.inc b/meta/recipes-devtools/gdb/gdb-11.1.inc
similarity index 56%
rename from meta/recipes-devtools/gdb/gdb-10.2.inc
rename to meta/recipes-devtools/gdb/gdb-11.1.inc
index 0d275075e6..686627926d 100644
--- a/meta/recipes-devtools/gdb/gdb-10.2.inc
+++ b/meta/recipes-devtools/gdb/gdb-11.1.inc
@@ -11,13 +11,9 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0004-Add-support-for-Renesas-SH-sh4-architecture.patch \
            file://0005-Dont-disable-libreadline.a-when-using-disable-static.patch \
            file://0006-use-asm-sgidefs.h.patch \
-           file://0008-Change-order-of-CFLAGS.patch \
-           file://0009-resolve-restrict-keyword-conflict.patch \
-           file://0010-Fix-invalid-sigprocmask-call.patch \
-           file://0011-gdbserver-ctrl-c-handling.patch \
-           file://0012-arc-Add-support-for-signal-handlers.patch \
-           file://0013-arc-Add-support-for-signal-frames-for-Linux-targets.patch \
-           file://0014-arc-Take-into-account-the-REGNUM-in-supply-collect-g.patch \
-           file://0015-gdb-Add-native-support-for-ARC-in-GNU-Linux.patch \
+           file://0007-Change-order-of-CFLAGS.patch \
+           file://0008-resolve-restrict-keyword-conflict.patch \
+           file://0009-Fix-invalid-sigprocmask-call.patch \
+           file://0010-gdbserver-ctrl-c-handling.patch \
            "
-SRC_URI[sha256sum] = "aaa1223d534c9b700a8bec952d9748ee1977513f178727e1bee520ee000b4f29"
+SRC_URI[sha256sum] = "cccfcc407b20d343fb320d4a9a2110776dd3165118ffd41f4b1b162340333f94"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_10.2.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_10.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_11.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_10.2.bb b/meta/recipes-devtools/gdb/gdb-cross_11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_10.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross_11.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
index 84d178332d..824b96f6af 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
@@ -1,22 +1,22 @@
-From e5126c7167e26f865990dc5f86344602603aa8c6 Mon Sep 17 00:00:00 2001
+From a6d3df9d84463ec500d9d01558ab8a17e824e9e5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:27:55 +0000
-Subject: [PATCH 01/11] make man install relative to DESTDIR
+Subject: [PATCH 01/10] make man install relative to DESTDIR
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sim/common/Makefile.in | 2 +-
+ sim/common/Make-common.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/sim/common/Makefile.in b/sim/common/Makefile.in
-index f713fcaa35b..7c553709d3f 100644
---- a/sim/common/Makefile.in
-+++ b/sim/common/Makefile.in
-@@ -35,7 +35,7 @@ tooldir = $(libdir)/$(target_alias)
- datarootdir = @datarootdir@
+diff --git a/sim/common/Make-common.in b/sim/common/Make-common.in
+index 8c2cacea1e5..4a52eef2203 100644
+--- a/sim/common/Make-common.in
++++ b/sim/common/Make-common.in
+@@ -63,7 +63,7 @@ tooldir = $(libdir)/$(target_alias)
  datadir = @datadir@
+ datarootdir = @datarootdir@
  mandir = @mandir@
 -man1dir = $(mandir)/man1
 +man1dir = $(DESTDIR)$(mandir)/man1
@@ -24,5 +24,5 @@ index f713fcaa35b..7c553709d3f 100644
  includedir = @includedir@
  
 -- 
-2.29.2
+2.33.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
index f830993d5e..591c9bfa3f 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch
@@ -1,7 +1,7 @@
-From 0680242c9a3a0149a23e63034ecb4404de2293dd Mon Sep 17 00:00:00 2001
+From 7f1f25eaaace289bc33c5aaa1c5fe9e04e719651 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
-Subject: [PATCH 02/11] mips-linux-nat: Define _ABIO32 if not defined
+Subject: [PATCH 02/10] mips-linux-nat: Define _ABIO32 if not defined
 
 This helps building gdb on mips64 on musl, since
 musl does not provide sgidefs.h this define is
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 38ff461a35b..4337795bac8 100644
+index b21c7cb2ea6..6614b4de31e 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -41,6 +41,10 @@
@@ -31,5 +31,5 @@ index 38ff461a35b..4337795bac8 100644
  class mips_linux_nat_target final : public linux_nat_trad_target
  {
 -- 
-2.29.2
+2.33.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index cbe1779db7..09ea533b00 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -1,7 +1,7 @@
-From afbb66c244b1ae0aaaa90d88d3cd484f741c614f Mon Sep 17 00:00:00 2001
+From 0cb233ec3951582fa1a051a16bfd644ef4969df5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 18:32:14 -0700
-Subject: [PATCH 03/11] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC
+Subject: [PATCH 03/10] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC
  systems
 
 Upstream-Status: Pending
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+)
 
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index d937a65b69c..1fd54b4a0e0 100644
+index e712a9a5713..76bbcca0928 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
@@ -31,7 +31,7 @@ index d937a65b69c..1fd54b4a0e0 100644
  
  /* This sometimes isn't defined.  */
 diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
-index 337d555aee7..5d518f37268 100644
+index db9a88219ea..151e4183bb1 100644
 --- a/gdbserver/linux-ppc-low.cc
 +++ b/gdbserver/linux-ppc-low.cc
 @@ -23,7 +23,13 @@
@@ -49,5 +49,5 @@ index 337d555aee7..5d518f37268 100644
  #include "arch/ppc-linux-common.h"
  #include "arch/ppc-linux-tdesc.h"
 -- 
-2.29.2
+2.33.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0004-Add-support-for-Renesas-SH-sh4-architecture.patch b/meta/recipes-devtools/gdb/gdb/0004-Add-support-for-Renesas-SH-sh4-architecture.patch
index 561cfff943..37d633c9a8 100644
--- a/meta/recipes-devtools/gdb/gdb/0004-Add-support-for-Renesas-SH-sh4-architecture.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-Add-support-for-Renesas-SH-sh4-architecture.patch
@@ -1,7 +1,7 @@
-From 26e406962cf7298837b350b979afff0ac34ecb0b Mon Sep 17 00:00:00 2001
+From d86ff49710210fb10d149121fa9a04c7cf41cb8b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 02:31:12 +0000
-Subject: [PATCH 04/11] Add support for Renesas SH (sh4) architecture.
+Subject: [PATCH 04/10] Add support for Renesas SH (sh4) architecture.
 
 gdb (7.4-1~cvs20111117.2) experimental; urgency=low
  .
@@ -14,7 +14,7 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  gdb/Makefile.in                      |   2 +
- gdb/configure.host                   |   1 +
+ gdb/configure.host                   |   2 +
  gdb/sh-linux-tdep.c                  | 519 +++++++++++++++++++++++++++
  gdb/sh-tdep.c                        |  52 +--
  gdb/sh-tdep.h                        |  49 +++
@@ -24,15 +24,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gdb/testsuite/gdb.base/annota3.c     |   4 +
  gdb/testsuite/gdb.base/sigall.c      |   3 +
  gdb/testsuite/gdb.base/signals.c     |   4 +
- 11 files changed, 617 insertions(+), 28 deletions(-)
+ 11 files changed, 618 insertions(+), 28 deletions(-)
 
 diff --git a/gdb/Makefile.in b/gdb/Makefile.in
-index 4808357e651..a009004ab05 100644
+index b8729ed7b2e..ae5c05e1dbe 100644
 --- a/gdb/Makefile.in
 +++ b/gdb/Makefile.in
-@@ -2273,6 +2273,8 @@ ALLDEPFILES = \
- 	sh-nbsd-nat.c \
- 	sh-nbsd-tdep.c \
+@@ -2284,6 +2284,8 @@ ALLDEPFILES = \
+ 	sh-netbsd-nat.c \
+ 	sh-netbsd-tdep.c \
  	sh-tdep.c \
 +	sh-linux-tdep.c \
 +	sh-linux-nat.c \
@@ -40,19 +40,20 @@ index 4808357e651..a009004ab05 100644
  	solib-aix.c \
  	solib-svr4.c \
 diff --git a/gdb/configure.host b/gdb/configure.host
-index ce528237291..5b5173a71aa 100644
+index e94a19b0332..08b8478b56b 100644
 --- a/gdb/configure.host
 +++ b/gdb/configure.host
-@@ -148,6 +148,7 @@ riscv*-*-linux*)	gdb_host=linux ;;
+@@ -151,6 +151,8 @@ riscv*-*-linux*)	gdb_host=linux ;;
  
  s390*-*-linux*)		gdb_host=linux ;;
  
 +sh*-*-linux*)		gdb_host=linux ;;
++
  sh*-*-netbsdelf* | sh*-*-knetbsd*-gnu)
  			gdb_host=nbsd ;;
  sh*-*-openbsd*)		gdb_host=nbsd ;;
 diff --git a/gdb/sh-linux-tdep.c b/gdb/sh-linux-tdep.c
-index 5d2f38f5801..06a45b74827 100644
+index 700df35bc3b..aaed47ded81 100644
 --- a/gdb/sh-linux-tdep.c
 +++ b/gdb/sh-linux-tdep.c
 @@ -18,14 +18,37 @@
@@ -596,11 +597,11 @@ index 5d2f38f5801..06a45b74827 100644
 +    set_gdbarch_regset_from_core_section (gdbarch,
 +                                         sh_linux_regset_from_core_section);
 +
-   linux_init_abi (info, gdbarch);
+   linux_init_abi (info, gdbarch, 0);
  
    /* GNU/Linux uses SVR4-style shared libraries.  */
 diff --git a/gdb/sh-tdep.c b/gdb/sh-tdep.c
-index 7aadf9165ca..e173e215a2d 100644
+index bfb220adf79..6a077b235bf 100644
 --- a/gdb/sh-tdep.c
 +++ b/gdb/sh-tdep.c
 @@ -21,6 +21,9 @@
@@ -694,7 +695,7 @@ index 7aadf9165ca..e173e215a2d 100644
  
    if (regnum < SH_NUM_REGS && cache->saved_regs[regnum] != -1)
      return frame_unwind_got_memory (this_frame, regnum,
-@@ -2234,8 +2221,8 @@ sh_return_in_first_hidden_param_p (struct gdbarch *gdbarch,
+@@ -2236,8 +2223,8 @@ sh_return_in_first_hidden_param_p (struct gdbarch *gdbarch,
  static struct gdbarch *
  sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
  {
@@ -704,7 +705,7 @@ index 7aadf9165ca..e173e215a2d 100644
  
    /* If there is already a candidate, use it.  */
    arches = gdbarch_list_lookup_by_info (arches, &info);
-@@ -2247,6 +2234,18 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
+@@ -2249,6 +2236,18 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
    tdep = XCNEW (struct gdbarch_tdep);
    gdbarch = gdbarch_alloc (&info, tdep);
  
@@ -723,7 +724,7 @@ index 7aadf9165ca..e173e215a2d 100644
    set_gdbarch_short_bit (gdbarch, 2 * TARGET_CHAR_BIT);
    set_gdbarch_int_bit (gdbarch, 4 * TARGET_CHAR_BIT);
    set_gdbarch_long_bit (gdbarch, 4 * TARGET_CHAR_BIT);
-@@ -2398,10 +2397,11 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
+@@ -2400,10 +2399,11 @@ sh_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
        break;
      }
  
@@ -737,7 +738,7 @@ index 7aadf9165ca..e173e215a2d 100644
    frame_unwind_append_unwinder (gdbarch, &sh_frame_unwind);
  
 diff --git a/gdb/sh-tdep.h b/gdb/sh-tdep.h
-index 76e2e76e39b..2710f63010c 100644
+index 737b6dc6bdc..8d82e819b8c 100644
 --- a/gdb/sh-tdep.h
 +++ b/gdb/sh-tdep.h
 @@ -21,6 +21,12 @@
@@ -820,7 +821,7 @@ index 76e2e76e39b..2710f63010c 100644
       where each general-purpose register is stored inside the associated
       core file section.  */
 diff --git a/gdb/testsuite/gdb.asm/asm-source.exp b/gdb/testsuite/gdb.asm/asm-source.exp
-index 4914498f98c..6e25cbed185 100644
+index dedcd92f2df..ae81b8becd3 100644
 --- a/gdb/testsuite/gdb.asm/asm-source.exp
 +++ b/gdb/testsuite/gdb.asm/asm-source.exp
 @@ -116,6 +116,11 @@ switch -glob -- [istarget] {
@@ -909,5 +910,5 @@ index 756606880fa..1205a9bc9c5 100644
  static int count = 0;
  
 -- 
-2.29.2
+2.33.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch
index 71eab1c2b1..02ea30f9bf 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-Dont-disable-libreadline.a-when-using-disable-static.patch
@@ -1,7 +1,7 @@
-From ec566877c50bdae0013a38dd457004e1db725d86 Mon Sep 17 00:00:00 2001
+From e2efd044c479895767f1b929f5a54fa0c689f318 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:25:03 -0700
-Subject: [PATCH 05/11] Dont disable libreadline.a when using --disable-static
+Subject: [PATCH 05/10] Dont disable libreadline.a when using --disable-static
 
 If gdb is configured with --disable-static then this is dutifully passed to
 readline which then disables libreadline.a, which causes a problem when gdb
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.def b/Makefile.def
-index 76d062bb671..e0a1e2b14b1 100644
+index 5a460f1dbbc..77a702ac6d6 100644
 --- a/Makefile.def
 +++ b/Makefile.def
 @@ -105,7 +105,8 @@ host_modules= { module= libiconv;
@@ -33,10 +33,10 @@ index 76d062bb671..e0a1e2b14b1 100644
  host_modules= { module= sim; };
  host_modules= { module= texinfo; no_install= true; };
 diff --git a/Makefile.in b/Makefile.in
-index 9dfd39fae13..eaf1dd0f229 100644
+index 9b3a5d75735..98cbe844fca 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -25548,7 +25548,7 @@ configure-readline:
+@@ -25607,7 +25607,7 @@ configure-readline:
  	  $$s/$$module_srcdir/configure \
  	  --srcdir=$${topdir}/$$module_srcdir \
  	  $(HOST_CONFIGARGS) --build=${build_alias} --host=${host_alias} \
@@ -46,5 +46,5 @@ index 9dfd39fae13..eaf1dd0f229 100644
  @endif readline
  
 -- 
-2.29.2
+2.33.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch b/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
index a2932be6fb..ef271c45e2 100644
--- a/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-use-asm-sgidefs.h.patch
@@ -1,7 +1,7 @@
-From 4b02e54b87d435e1715ce871bcce720561a7afb1 Mon Sep 17 00:00:00 2001
+From 5077518c11e8d75e9bf65cdf9ca21c59564e1037 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <amccurdy@gmail.com>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
-Subject: [PATCH 06/11] use <asm/sgidefs.h>
+Subject: [PATCH 06/10] use <asm/sgidefs.h>
 
 Build fix for MIPS with musl libc
 
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 4337795bac8..7c8e54cabe0 100644
+index 6614b4de31e..237eb6eb975 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -31,7 +31,7 @@
@@ -32,5 +32,5 @@ index 4337795bac8..7c8e54cabe0 100644
  #include <asm/ptrace.h>
  #include "inf-ptrace.h"
 -- 
-2.29.2
+2.33.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0008-Change-order-of-CFLAGS.patch b/meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch
similarity index 75%
rename from meta/recipes-devtools/gdb/gdb/0008-Change-order-of-CFLAGS.patch
rename to meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch
index 4622752247..40d12579c0 100644
--- a/meta/recipes-devtools/gdb/gdb/0008-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-Change-order-of-CFLAGS.patch
@@ -1,7 +1,7 @@
-From 07175ae348c9d07581e1db94762d5a2d577a75ad Mon Sep 17 00:00:00 2001
+From 80080e6c8425ac51498f49c2063b960a08f9a27d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:35:39 -0700
-Subject: [PATCH 08/11] Change order of CFLAGS
+Subject: [PATCH 07/10] Change order of CFLAGS
 
 Lets us override Werror if need be
 
@@ -13,11 +13,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
-index 2b1a77f2de7..cb5ddb12fd5 100644
+index 12e9b2777ae..ad44fbc3309 100644
 --- a/gdbserver/Makefile.in
 +++ b/gdbserver/Makefile.in
-@@ -161,7 +161,7 @@ WIN32APILIBS = @WIN32APILIBS@
- INTERNAL_CFLAGS_BASE = ${CXXFLAGS} ${GLOBAL_CFLAGS} \
+@@ -172,7 +172,7 @@ WIN32APILIBS = @WIN32APILIBS@
+ INTERNAL_CFLAGS_BASE = ${GLOBAL_CFLAGS} \
  	${PROFILE_CFLAGS} ${INCLUDE_CFLAGS} ${CPPFLAGS} $(PTHREAD_CFLAGS)
  INTERNAL_WARN_CFLAGS = ${INTERNAL_CFLAGS_BASE} $(WARN_CFLAGS)
 -INTERNAL_CFLAGS = ${INTERNAL_WARN_CFLAGS} $(WERROR_CFLAGS) -DGDBSERVER
@@ -26,5 +26,5 @@ index 2b1a77f2de7..cb5ddb12fd5 100644
  # LDFLAGS is specifically reserved for setting from the command line
  # when running make.
 -- 
-2.29.2
+2.33.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0009-resolve-restrict-keyword-conflict.patch b/meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-conflict.patch
similarity index 91%
rename from meta/recipes-devtools/gdb/gdb/0009-resolve-restrict-keyword-conflict.patch
rename to meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-conflict.patch
index 698fdb0672..9095f90582 100644
--- a/meta/recipes-devtools/gdb/gdb/0009-resolve-restrict-keyword-conflict.patch
+++ b/meta/recipes-devtools/gdb/gdb/0008-resolve-restrict-keyword-conflict.patch
@@ -1,7 +1,7 @@
-From 73a3babe48c7948f71683d0862eddc1609fdaa3d Mon Sep 17 00:00:00 2001
+From 4ee7e8afb9ff259e889ac938c673fda9ddc5e15a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 May 2016 08:47:05 -0700
-Subject: [PATCH 09/11] resolve restrict keyword conflict
+Subject: [PATCH 08/10] resolve restrict keyword conflict
 
 GCC detects that we call 'restrict' as param name in function
 signatures and complains since both params are called 'restrict'
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/gnulib/import/sys_time.in.h b/gnulib/import/sys_time.in.h
-index d30b26719b2..fd76af5e6d9 100644
+index 90a67d18426..664641a1fe8 100644
 --- a/gnulib/import/sys_time.in.h
 +++ b/gnulib/import/sys_time.in.h
 @@ -93,20 +93,20 @@ struct timeval
@@ -44,5 +44,5 @@ index d30b26719b2..fd76af5e6d9 100644
  _GL_CXXALIASWARN (gettimeofday);
  # if defined __cplusplus && defined GNULIB_NAMESPACE
 -- 
-2.29.2
+2.33.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0010-Fix-invalid-sigprocmask-call.patch b/meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call.patch
similarity index 90%
rename from meta/recipes-devtools/gdb/gdb/0010-Fix-invalid-sigprocmask-call.patch
rename to meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call.patch
index 7cf3eae753..5b9d1cfaf9 100644
--- a/meta/recipes-devtools/gdb/gdb/0010-Fix-invalid-sigprocmask-call.patch
+++ b/meta/recipes-devtools/gdb/gdb/0009-Fix-invalid-sigprocmask-call.patch
@@ -1,7 +1,7 @@
-From c5c5372c6a319cac8b3f9f86304fcebcbb5ea06f Mon Sep 17 00:00:00 2001
+From 5740876d92ddb67b039d5fbcd1b71e6c58823c08 Mon Sep 17 00:00:00 2001
 From: Yousong Zhou <yszhou4tech@gmail.com>
 Date: Fri, 24 Mar 2017 10:36:03 +0800
-Subject: [PATCH 10/11] Fix invalid sigprocmask call
+Subject: [PATCH 09/10] Fix invalid sigprocmask call
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -32,7 +32,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdbsupport/signals-state-save-restore.cc b/gdbsupport/signals-state-save-restore.cc
-index c292d498daf..af9dcaeb08e 100644
+index 95c156e5036..f4aa512d105 100644
 --- a/gdbsupport/signals-state-save-restore.cc
 +++ b/gdbsupport/signals-state-save-restore.cc
 @@ -38,7 +38,7 @@ save_original_signals_state (bool quiet)
@@ -45,5 +45,5 @@ index c292d498daf..af9dcaeb08e 100644
      perror_with_name (("sigprocmask"));
  
 -- 
-2.29.2
+2.33.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0011-gdbserver-ctrl-c-handling.patch b/meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.patch
similarity index 82%
rename from meta/recipes-devtools/gdb/gdb/0011-gdbserver-ctrl-c-handling.patch
rename to meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.patch
index 0a596b522f..cb4744e5dd 100644
--- a/meta/recipes-devtools/gdb/gdb/0011-gdbserver-ctrl-c-handling.patch
+++ b/meta/recipes-devtools/gdb/gdb/0010-gdbserver-ctrl-c-handling.patch
@@ -1,7 +1,7 @@
-From 63df98fa78c8a6e12b40ebdc5c155838d2bf8b5f Mon Sep 17 00:00:00 2001
+From d611a68f05c0c86af27bf6beae189a90a946e2e3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 29 Nov 2018 18:00:23 -0800
-Subject: [PATCH 11/11] gdbserver ctrl-c handling
+Subject: [PATCH 10/10] gdbserver ctrl-c handling
 
 This problem was created by the upstream commit 78708b7c8c
 After applying the commit, it will send SIGINT to the process
@@ -23,10 +23,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/gdbserver/linux-low.cc b/gdbserver/linux-low.cc
-index e45493339d2..aabc099b456 100644
+index 5c6191d941c..7f7acf6700d 100644
 --- a/gdbserver/linux-low.cc
 +++ b/gdbserver/linux-low.cc
-@@ -5714,7 +5714,7 @@ linux_process_target::request_interrupt ()
+@@ -5733,7 +5733,7 @@ linux_process_target::request_interrupt ()
  {
    /* Send a SIGINT to the process group.  This acts just like the user
       typed a ^C on the controlling terminal.  */
@@ -36,5 +36,5 @@ index e45493339d2..aabc099b456 100644
  
  bool
 -- 
-2.29.2
+2.33.1
 
diff --git a/meta/recipes-devtools/gdb/gdb/0012-arc-Add-support-for-signal-handlers.patch b/meta/recipes-devtools/gdb/gdb/0012-arc-Add-support-for-signal-handlers.patch
deleted file mode 100644
index 6a98b65766..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0012-arc-Add-support-for-signal-handlers.patch
+++ /dev/null
@@ -1,218 +0,0 @@
-From bfee93403b46ae4f050282b7721ba39073905c69 Mon Sep 17 00:00:00 2001
-From: Anton Kolesov <Anton.Kolesov@synopsys.com>
-Date: Mon, 22 Aug 2016 19:39:46 +0300
-Subject: [PATCH 1/4] arc: Add support for signal handlers
-
-This patch adds the necessary infrastructure to handle signal frames for
-ARC architecture.  It is fairly similar to what any other architecture
-would have.  Linux specific parts will be in a separate patch.
-
-v2 [1]:
-- Make the logic of "arc_sigtramp_frame_sniffer ()" simpler.
-
-[1] Tom's remark for the first version
-https://sourceware.org/pipermail/gdb-patches/2020-November/173221.html
-
-gdb/ChangeLog:
-
-	* arc-tdep.c (arc_make_sigtramp_frame_cache): New function.
-	(arc_sigtramp_frame_this_id): Likewise.
-	(arc_sigtramp_frame_prev_register): Likewise.
-	(arc_sigtramp_frame_sniffer): Likewise.
-	(arc_siftramp_frame_unwind): New global variable.
-	(arc_gdbarch_init): Use sigtramp capabilities.
-	(arc_dump_tdep): Print sigtramp fields.
-	* arc-tdep.h (gdbarch_tdep): Add sigtramp fields.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=b4e3cd0440109d0a5552d3313ccbd35c8103335b]
-
-Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
-Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- gdb/arc-tdep.c | 123 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- gdb/arc-tdep.h |  13 ++++++
- 2 files changed, 136 insertions(+)
-
-diff --git a/gdb/arc-tdep.c b/gdb/arc-tdep.c
-index 93e2fd88a9a..3356252525d 100644
---- a/gdb/arc-tdep.c
-+++ b/gdb/arc-tdep.c
-@@ -1843,6 +1843,104 @@ arc_dwarf2_frame_init_reg (struct gdbarch *gdbarch, int regnum,
-     reg->how = DWARF2_FRAME_REG_CFA;
- }
- 
-+/*  Signal trampoline frame unwinder.  Allows frame unwinding to happen
-+    from within signal handlers.  */
-+
-+static struct arc_frame_cache *
-+arc_make_sigtramp_frame_cache (struct frame_info *this_frame)
-+{
-+  if (arc_debug)
-+    debug_printf ("arc: sigtramp_frame_cache\n");
-+
-+  struct gdbarch_tdep *tdep = gdbarch_tdep (get_frame_arch (this_frame));
-+
-+  /* Allocate new frame cache instance and space for saved register info.  */
-+  struct arc_frame_cache *cache = FRAME_OBSTACK_ZALLOC (struct arc_frame_cache);
-+  cache->saved_regs = trad_frame_alloc_saved_regs (this_frame);
-+
-+  /* Get the stack pointer and use it as the frame base.  */
-+  cache->prev_sp = arc_frame_base_address (this_frame, NULL);
-+
-+  /* If the ARC-private target-dependent info doesn't have a table of
-+     offsets of saved register contents within an OS signal context
-+     structure, then there is nothing to analyze.  */
-+  if (tdep->sc_reg_offset == NULL)
-+    return cache;
-+
-+  /* Find the address of the sigcontext structure.  */
-+  CORE_ADDR addr = tdep->sigcontext_addr (this_frame);
-+
-+  /* For each register, if its contents have been saved within the
-+     sigcontext structure, determine the address of those contents.  */
-+  gdb_assert (tdep->sc_num_regs <= (ARC_LAST_REGNUM + 1));
-+  for (int i = 0; i < tdep->sc_num_regs; i++)
-+    {
-+      if (tdep->sc_reg_offset[i] != ARC_OFFSET_NO_REGISTER)
-+	cache->saved_regs[i].addr = addr + tdep->sc_reg_offset[i];
-+    }
-+
-+  return cache;
-+}
-+
-+/* Implement the "this_id" frame_unwind method for signal trampoline
-+   frames.  */
-+
-+static void
-+arc_sigtramp_frame_this_id (struct frame_info *this_frame,
-+			    void **this_cache, struct frame_id *this_id)
-+{
-+  if (arc_debug)
-+    debug_printf ("arc: sigtramp_frame_this_id\n");
-+
-+  if (*this_cache == NULL)
-+    *this_cache = arc_make_sigtramp_frame_cache (this_frame);
-+
-+  struct gdbarch *gdbarch = get_frame_arch (this_frame);
-+  struct arc_frame_cache *cache = (struct arc_frame_cache *) *this_cache;
-+  CORE_ADDR stack_addr = cache->prev_sp;
-+  CORE_ADDR code_addr
-+    = get_frame_register_unsigned (this_frame, gdbarch_pc_regnum (gdbarch));
-+  *this_id = frame_id_build (stack_addr, code_addr);
-+}
-+
-+/* Get a register from a signal handler frame.  */
-+
-+static struct value *
-+arc_sigtramp_frame_prev_register (struct frame_info *this_frame,
-+				  void **this_cache, int regnum)
-+{
-+  if (arc_debug)
-+    debug_printf ("arc: sigtramp_frame_prev_register (regnum = %d)\n", regnum);
-+
-+  /* Make sure we've initialized the cache.  */
-+  if (*this_cache == NULL)
-+    *this_cache = arc_make_sigtramp_frame_cache (this_frame);
-+
-+  struct arc_frame_cache *cache = (struct arc_frame_cache *) *this_cache;
-+  return trad_frame_get_prev_register (this_frame, cache->saved_regs, regnum);
-+}
-+
-+/* Frame sniffer for signal handler frame.  Only recognize a frame if we
-+   have a sigcontext_addr handler in the target dependency.  */
-+
-+static int
-+arc_sigtramp_frame_sniffer (const struct frame_unwind *self,
-+			    struct frame_info *this_frame,
-+			    void **this_cache)
-+{
-+  struct gdbarch_tdep *tdep;
-+
-+  if (arc_debug)
-+    debug_printf ("arc: sigtramp_frame_sniffer\n");
-+
-+  tdep = gdbarch_tdep (get_frame_arch (this_frame));
-+
-+  /* If we have a sigcontext_addr handler, then just return 1 (same as the
-+     "default_frame_sniffer ()").  */
-+  return (tdep->sigcontext_addr != NULL && tdep->is_sigtramp != NULL
-+	  && tdep->is_sigtramp (this_frame));
-+}
-+
- /* Structure defining the ARC ordinary frame unwind functions.  Since we are
-    the fallback unwinder, we use the default frame sniffer, which always
-    accepts the frame.  */
-@@ -1858,6 +1956,21 @@ static const struct frame_unwind arc_frame_unwind = {
-   NULL
- };
- 
-+/* Structure defining the ARC signal frame unwind functions.  Custom
-+   sniffer is used, because this frame must be accepted only in the right
-+   context.  */
-+
-+static const struct frame_unwind arc_sigtramp_frame_unwind = {
-+  SIGTRAMP_FRAME,
-+  default_frame_unwind_stop_reason,
-+  arc_sigtramp_frame_this_id,
-+  arc_sigtramp_frame_prev_register,
-+  NULL,
-+  arc_sigtramp_frame_sniffer,
-+  NULL,
-+  NULL
-+};
-+
- 
- static const struct frame_base arc_normal_base = {
-   &arc_frame_unwind,
-@@ -2272,6 +2385,7 @@ arc_gdbarch_init (struct gdbarch_info info, struct gdbarch_list *arches)
-   /* Frame unwinders and sniffers.  */
-   dwarf2_frame_set_init_reg (gdbarch, arc_dwarf2_frame_init_reg);
-   dwarf2_append_unwinders (gdbarch);
-+  frame_unwind_append_unwinder (gdbarch, &arc_sigtramp_frame_unwind);
-   frame_unwind_append_unwinder (gdbarch, &arc_frame_unwind);
-   frame_base_set_default (gdbarch, &arc_normal_base);
- 
-@@ -2350,6 +2464,15 @@ arc_dump_tdep (struct gdbarch *gdbarch, struct ui_file *file)
-   struct gdbarch_tdep *tdep = gdbarch_tdep (gdbarch);
- 
-   fprintf_unfiltered (file, "arc_dump_tdep: jb_pc = %i\n", tdep->jb_pc);
-+
-+  fprintf_unfiltered (file, "arc_dump_tdep: is_sigtramp = <%s>\n",
-+		      host_address_to_string (tdep->is_sigtramp));
-+  fprintf_unfiltered (file, "arc_dump_tdep: sigcontext_addr = <%s>\n",
-+		      host_address_to_string (tdep->sigcontext_addr));
-+  fprintf_unfiltered (file, "arc_dump_tdep: sc_reg_offset = <%s>\n",
-+		      host_address_to_string (tdep->sc_reg_offset));
-+  fprintf_unfiltered (file, "arc_dump_tdep: sc_num_regs = %d\n",
-+		      tdep->sc_num_regs);
- }
- 
- /* This command accepts single argument - address of instruction to
-diff --git a/gdb/arc-tdep.h b/gdb/arc-tdep.h
-index 50b14905134..70fc3d95c48 100644
---- a/gdb/arc-tdep.h
-+++ b/gdb/arc-tdep.h
-@@ -124,6 +124,19 @@ struct gdbarch_tdep
- 
-   /* Whether target has hardware (aka zero-delay) loops.  */
-   bool has_hw_loops;
-+
-+  /* Detect sigtramp.  */
-+  bool (*is_sigtramp) (struct frame_info *);
-+
-+  /* Get address of sigcontext for sigtramp.  */
-+  CORE_ADDR (*sigcontext_addr) (struct frame_info *);
-+
-+  /* Offset of registers in `struct sigcontext'.  */
-+  const int *sc_reg_offset;
-+
-+  /* Number of registers in sc_reg_offsets.  Most likely a ARC_LAST_REGNUM,
-+     but in theory it could be less, so it is kept separate.  */
-+  int sc_num_regs;
- };
- 
- /* Utility functions used by other ARC-specific modules.  */
--- 
-2.16.2
-
diff --git a/meta/recipes-devtools/gdb/gdb/0013-arc-Add-support-for-signal-frames-for-Linux-targets.patch b/meta/recipes-devtools/gdb/gdb/0013-arc-Add-support-for-signal-frames-for-Linux-targets.patch
deleted file mode 100644
index f699a5888d..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0013-arc-Add-support-for-signal-frames-for-Linux-targets.patch
+++ /dev/null
@@ -1,232 +0,0 @@
-From 16ddc17b4f403a38701e0108b02aff967900cc66 Mon Sep 17 00:00:00 2001
-From: Anton Kolesov <Anton.Kolesov@synopsys.com>
-Date: Thu, 22 Dec 2016 21:52:16 +0300
-Subject: [PATCH 2/4] arc: Add support for signal frames for Linux targets
-
-Implement functions needed to unwind signal frames on ARC Linux targets.
-
-gdb/ChangeLog
-
-	* arc-linux-tdep.c (arc_linux_sc_reg_offsets): New static variable.
-	(arc_linux_is_sigtramp): New function.
-	(arc_linux_sigcontext_addr): Likewise.
-	(arc_linux_init_osabi): Use them.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d4af727286e3a9f177ba11677fbd3a012d36558a]
-
-Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
-Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- gdb/arc-linux-tdep.c | 181 +++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 181 insertions(+)
-
-diff --git a/gdb/arc-linux-tdep.c b/gdb/arc-linux-tdep.c
-index a7bace12623..17bb3e7b276 100644
---- a/gdb/arc-linux-tdep.c
-+++ b/gdb/arc-linux-tdep.c
-@@ -33,6 +33,60 @@
- 
- #define REGOFF(offset) (offset * ARC_REGISTER_SIZE)
- 
-+/* arc_linux_sc_reg_offsets[i] is the offset of register i in the `struct
-+   sigcontext'.  Array index is an internal GDB register number, as defined in
-+   arc-tdep.h:arc_regnum.
-+
-+   From <include/uapi/asm/sigcontext.h> and <include/uapi/asm/ptrace.h>.
-+
-+   The layout of this struct is tightly bound to "arc_regnum" enum
-+   in arc-tdep.h.  Any change of order in there, must be reflected
-+   here as well.  */
-+static const int arc_linux_sc_reg_offsets[] = {
-+  /* R0 - R12.  */
-+  REGOFF (22), REGOFF (21), REGOFF (20), REGOFF (19),
-+  REGOFF (18), REGOFF (17), REGOFF (16), REGOFF (15),
-+  REGOFF (14), REGOFF (13), REGOFF (12), REGOFF (11),
-+  REGOFF (10),
-+
-+  /* R13 - R25.  */
-+  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
-+  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
-+  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
-+  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
-+  ARC_OFFSET_NO_REGISTER,
-+
-+  REGOFF (9),			/* R26 (GP) */
-+  REGOFF (8),			/* FP */
-+  REGOFF (23),			/* SP */
-+  ARC_OFFSET_NO_REGISTER,	/* ILINK */
-+  ARC_OFFSET_NO_REGISTER,	/* R30 */
-+  REGOFF (7),			/* BLINK */
-+
-+  /* R32 - R59.  */
-+  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
-+  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
-+  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
-+  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
-+  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
-+  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
-+  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
-+  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
-+  ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER, ARC_OFFSET_NO_REGISTER,
-+  ARC_OFFSET_NO_REGISTER,
-+
-+  REGOFF (4),			/* LP_COUNT */
-+  ARC_OFFSET_NO_REGISTER,	/* RESERVED */
-+  ARC_OFFSET_NO_REGISTER,	/* LIMM */
-+  ARC_OFFSET_NO_REGISTER,	/* PCL */
-+
-+  REGOFF (6),			/* PC  */
-+  REGOFF (5),			/* STATUS32 */
-+  REGOFF (2),			/* LP_START */
-+  REGOFF (3),			/* LP_END */
-+  REGOFF (1),			/* BTA */
-+};
-+
- /* arc_linux_core_reg_offsets[i] is the offset in the .reg section of GDB
-    regnum i.  Array index is an internal GDB register number, as defined in
-    arc-tdep.h:arc_regnum.
-@@ -87,6 +141,127 @@ static const int arc_linux_core_reg_offsets[] = {
-   REGOFF (6)			/* ERET */
- };
- 
-+/* Is THIS_FRAME a sigtramp function - the function that returns from
-+   signal handler into normal execution flow? This is the case if the PC is
-+   either at the start of, or in the middle of the two instructions:
-+
-+     mov r8, __NR_rt_sigreturn ; __NR_rt_sigreturn == 139
-+     trap_s 0 ; `swi' for ARC700
-+
-+   On ARC uClibc Linux this function is called __default_rt_sa_restorer.
-+
-+   Returns TRUE if this is a sigtramp frame.  */
-+
-+static bool
-+arc_linux_is_sigtramp (struct frame_info *this_frame)
-+{
-+  struct gdbarch *gdbarch = get_frame_arch (this_frame);
-+  CORE_ADDR pc = get_frame_pc (this_frame);
-+
-+  if (arc_debug)
-+    {
-+      debug_printf ("arc-linux: arc_linux_is_sigtramp, pc=%s\n",
-+		    paddress(gdbarch, pc));
-+    }
-+
-+  static const gdb_byte insns_be_hs[] = {
-+    0x20, 0x8a, 0x12, 0xc2,	/* mov  r8,nr_rt_sigreturn */
-+    0x78, 0x1e			/* trap_s 0 */
-+  };
-+  static const gdb_byte insns_be_700[] = {
-+    0x20, 0x8a, 0x12, 0xc2,	/* mov  r8,nr_rt_sigreturn */
-+    0x22, 0x6f, 0x00, 0x3f	/* swi */
-+  };
-+
-+  gdb_byte arc_sigtramp_insns[sizeof (insns_be_700)];
-+  size_t insns_sz;
-+  if (arc_mach_is_arcv2 (gdbarch))
-+    {
-+      insns_sz = sizeof (insns_be_hs);
-+      memcpy (arc_sigtramp_insns, insns_be_hs, insns_sz);
-+    }
-+  else
-+    {
-+      insns_sz = sizeof (insns_be_700);
-+      memcpy (arc_sigtramp_insns, insns_be_700, insns_sz);
-+    }
-+  if (gdbarch_byte_order (gdbarch) == BFD_ENDIAN_LITTLE)
-+    {
-+      /* On little endian targets, ARC code section is in what is called
-+	 "middle endian", where half-words are in the big-endian order,
-+	 only bytes inside the halfwords are in the little endian order.
-+	 As a result it is very easy to convert big endian instruction to
-+	 little endian, since it is needed to swap bytes in the halfwords,
-+	 so there is no need to have information on whether that is a
-+	 4-byte instruction or 2-byte.  */
-+      gdb_assert ((insns_sz % 2) == 0);
-+      for (int i = 0; i < insns_sz; i += 2)
-+	std::swap (arc_sigtramp_insns[i], arc_sigtramp_insns[i+1]);
-+    }
-+
-+  gdb_byte buf[insns_sz];
-+
-+  /* Read the memory at the PC.  Since we are stopped, any breakpoint must
-+     have been removed.  */
-+  if (!safe_frame_unwind_memory (this_frame, pc, buf, insns_sz))
-+    {
-+      /* Failed to unwind frame.  */
-+      return FALSE;
-+    }
-+
-+  /* Is that code the sigtramp instruction sequence?  */
-+  if (memcmp (buf, arc_sigtramp_insns, insns_sz) == 0)
-+    return TRUE;
-+
-+  /* No - look one instruction earlier in the code...  */
-+  if (!safe_frame_unwind_memory (this_frame, pc - 4, buf, insns_sz))
-+    {
-+      /* Failed to unwind frame.  */
-+      return FALSE;
-+    }
-+
-+  return (memcmp (buf, arc_sigtramp_insns, insns_sz) == 0);
-+}
-+
-+/* Get sigcontext structure of sigtramp frame - it contains saved
-+   registers of interrupted frame.
-+
-+   Stack pointer points to the rt_sigframe structure, and sigcontext can
-+   be found as in:
-+
-+   struct rt_sigframe {
-+     struct siginfo info;
-+     struct ucontext uc;
-+     ...
-+   };
-+
-+   struct ucontext {
-+     unsigned long uc_flags;
-+     struct ucontext *uc_link;
-+     stack_t uc_stack;
-+     struct sigcontext uc_mcontext;
-+     sigset_t uc_sigmask;
-+   };
-+
-+   sizeof (struct siginfo) == 0x80
-+   offsetof (struct ucontext, uc_mcontext) == 0x14
-+
-+   GDB cannot include linux headers and use offsetof () because those are
-+   target headers and GDB might be built for a different run host.  There
-+   doesn't seem to be an established mechanism to figure out those offsets
-+   via gdbserver, so the only way is to hardcode values in the GDB,
-+   meaning that GDB will be broken if values will change.  That seems to
-+   be a very unlikely scenario and other arches (aarch64, alpha, amd64,
-+   etc) in GDB hardcode values.  */
-+
-+static CORE_ADDR
-+arc_linux_sigcontext_addr (struct frame_info *this_frame)
-+{
-+  const int ucontext_offset = 0x80;
-+  const int sigcontext_offset = 0x14;
-+  return get_frame_sp (this_frame) + ucontext_offset + sigcontext_offset;
-+}
-+
- /* Implement the "cannot_fetch_register" gdbarch method.  */
- 
- static int
-@@ -504,6 +679,12 @@ arc_linux_init_osabi (struct gdbarch_info info, struct gdbarch *gdbarch)
-   if (arc_debug)
-     debug_printf ("arc-linux: GNU/Linux OS/ABI initialization.\n");
- 
-+  /* Fill in target-dependent info in ARC-private structure.  */
-+  tdep->is_sigtramp = arc_linux_is_sigtramp;
-+  tdep->sigcontext_addr = arc_linux_sigcontext_addr;
-+  tdep->sc_reg_offset = arc_linux_sc_reg_offsets;
-+  tdep->sc_num_regs = ARRAY_SIZE (arc_linux_sc_reg_offsets);
-+
-   /* If we are using Linux, we have in uClibc
-      (libc/sysdeps/linux/arc/bits/setjmp.h):
- 
--- 
-2.16.2
-
diff --git a/meta/recipes-devtools/gdb/gdb/0014-arc-Take-into-account-the-REGNUM-in-supply-collect-g.patch b/meta/recipes-devtools/gdb/gdb/0014-arc-Take-into-account-the-REGNUM-in-supply-collect-g.patch
deleted file mode 100644
index a7256065cc..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0014-arc-Take-into-account-the-REGNUM-in-supply-collect-g.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 5eb97d5e92ad23ee81cebc1ebd5eafe0aa55fc17 Mon Sep 17 00:00:00 2001
-From: Shahab Vahedi <shahab@synopsys.com>
-Date: Tue, 10 Nov 2020 19:34:57 +0100
-Subject: [PATCH 3/4] arc: Take into account the REGNUM in supply/collect gdb
- hooks
-
-All the arc_linux_supply_*() target operations and the
-arc_linux_collect_v2_regset() in arc-linux-tdep.c were
-supplying/collecting all the registers in regcache as if the
-REGNUM was set to -1.
-
-The more efficient behavior is to examine the REGNUM and act
-accordingly.  That is what this patch does.
-
-gdb/ChangeLog:
-
-	* arc-linux-tdep.c (supply_register): New.
-	(arc_linux_supply_gregset, arc_linux_supply_v2_regset,
-	arc_linux_collect_v2_regset): Consider REGNUM.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=46023bbe81355230b4e7b76d3084337823d02362]
-
-Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- gdb/arc-linux-tdep.c | 41 ++++++++++++++++++++++++++++++++---------
- 1 file changed, 32 insertions(+), 9 deletions(-)
-
-diff --git a/gdb/arc-linux-tdep.c b/gdb/arc-linux-tdep.c
-index 17bb3e7b276..e83d82b6f5c 100644
---- a/gdb/arc-linux-tdep.c
-+++ b/gdb/arc-linux-tdep.c
-@@ -535,6 +535,18 @@ arc_linux_skip_solib_resolver (struct gdbarch *gdbarch, CORE_ADDR pc)
-     }
- }
- 
-+/* Populate REGCACHE with register REGNUM from BUF.  */
-+
-+static void
-+supply_register (struct regcache *regcache, int regnum, const gdb_byte *buf)
-+{
-+  /* Skip non-existing registers.  */
-+  if ((arc_linux_core_reg_offsets[regnum] == ARC_OFFSET_NO_REGISTER))
-+    return;
-+
-+  regcache->raw_supply (regnum, buf + arc_linux_core_reg_offsets[regnum]);
-+}
-+
- void
- arc_linux_supply_gregset (const struct regset *regset,
- 			  struct regcache *regcache,
-@@ -545,9 +557,14 @@ arc_linux_supply_gregset (const struct regset *regset,
- 
-   const bfd_byte *buf = (const bfd_byte *) gregs;
- 
--  for (int reg = 0; reg <= ARC_LAST_REGNUM; reg++)
--      if (arc_linux_core_reg_offsets[reg] != ARC_OFFSET_NO_REGISTER)
--	regcache->raw_supply (reg, buf + arc_linux_core_reg_offsets[reg]);
-+  /* regnum == -1 means writing all the registers.  */
-+  if (regnum == -1)
-+    for (int reg = 0; reg <= ARC_LAST_REGNUM; reg++)
-+      supply_register (regcache, reg, buf);
-+  else if (regnum <= ARC_LAST_REGNUM)
-+    supply_register (regcache, regnum, buf);
-+  else
-+    gdb_assert_not_reached ("Invalid regnum in arc_linux_supply_gregset.");
- }
- 
- void
-@@ -558,9 +575,12 @@ arc_linux_supply_v2_regset (const struct regset *regset,
-   const bfd_byte *buf = (const bfd_byte *) v2_regs;
- 
-   /* user_regs_arcv2 is defined in linux arch/arc/include/uapi/asm/ptrace.h.  */
--  regcache->raw_supply (ARC_R30_REGNUM, buf);
--  regcache->raw_supply (ARC_R58_REGNUM, buf + REGOFF (1));
--  regcache->raw_supply (ARC_R59_REGNUM, buf + REGOFF (2));
-+  if (regnum == -1 || regnum == ARC_R30_REGNUM)
-+    regcache->raw_supply (ARC_R30_REGNUM, buf);
-+  if (regnum == -1 || regnum == ARC_R58_REGNUM)
-+    regcache->raw_supply (ARC_R58_REGNUM, buf + REGOFF (1));
-+  if (regnum == -1 || regnum == ARC_R59_REGNUM)
-+    regcache->raw_supply (ARC_R59_REGNUM, buf + REGOFF (2));
- }
- 
- /* Populate BUF with register REGNUM from the REGCACHE.  */
-@@ -618,9 +638,12 @@ arc_linux_collect_v2_regset (const struct regset *regset,
- {
-   bfd_byte *buf = (bfd_byte *) v2_regs;
- 
--  regcache->raw_collect (ARC_R30_REGNUM, buf);
--  regcache->raw_collect (ARC_R58_REGNUM, buf + REGOFF (1));
--  regcache->raw_collect (ARC_R59_REGNUM, buf + REGOFF (2));
-+  if (regnum == -1 || regnum == ARC_R30_REGNUM)
-+    regcache->raw_collect (ARC_R30_REGNUM, buf);
-+  if (regnum == -1 || regnum == ARC_R58_REGNUM)
-+    regcache->raw_collect (ARC_R58_REGNUM, buf + REGOFF (1));
-+  if (regnum == -1 || regnum == ARC_R59_REGNUM)
-+    regcache->raw_collect (ARC_R59_REGNUM, buf + REGOFF (2));
- }
- 
- /* Linux regset definitions.  */
--- 
-2.16.2
-
diff --git a/meta/recipes-devtools/gdb/gdb/0015-gdb-Add-native-support-for-ARC-in-GNU-Linux.patch b/meta/recipes-devtools/gdb/gdb/0015-gdb-Add-native-support-for-ARC-in-GNU-Linux.patch
deleted file mode 100644
index 31cf0b0be2..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0015-gdb-Add-native-support-for-ARC-in-GNU-Linux.patch
+++ /dev/null
@@ -1,414 +0,0 @@
-From 32b366249fd42d74cbc4a91039431554ebadcfd0 Mon Sep 17 00:00:00 2001
-From: Anton Kolesov <anton.kolesov@synopsys.com>
-Date: Fri, 14 Feb 2014 11:56:23 +0400
-Subject: [PATCH 4/4] gdb: Add native support for ARC in GNU/Linux
-
-With this patch in place it is possible to build a GDB that
-can run on ARC (GNU/Linux) hosts for debugging ARC targets.
-
-The "arc-linux-nat.c" is a rather small one that mostly deals
-with registers and a few thread related hooks.
-
-v2 [1]:
-- Remove "void" from the input of "_initialize_arc_linux_nat ()"
-
-[1] Tom's remark after the first patch
-https://sourceware.org/pipermail/gdb-patches/2020-November/173223.html
-
-gdb/ChangeLog:
-
-	* Makefile.in (ALLDEPFILES): Add arc-linux-nat.c.
-	* configure.host (host to gdb names): Add arc*-*-linux*.
-	* configure.nat (gdb_host_cpu): Add arc.
-	* arc-linux-nat.c: New.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=04c9f85efcd8df5fc482ce97c0104cc7dd5d19e6]
-
-Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
-Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- gdb/Makefile.in     |   1 +
- gdb/arc-linux-nat.c | 320 ++++++++++++++++++++++++++++++++++++++++++++++++++++
- gdb/configure.host  |   3 +
- gdb/configure.nat   |   4 +
- 4 files changed, 328 insertions(+)
- create mode 100644 gdb/arc-linux-nat.c
-
-diff --git a/gdb/Makefile.in b/gdb/Makefile.in
-index ec371fc7e52..c76136907ae 100644
---- a/gdb/Makefile.in
-+++ b/gdb/Makefile.in
-@@ -2136,6 +2136,7 @@ ALLDEPFILES = \
- 	amd64-obsd-tdep.c \
- 	amd64-sol2-tdep.c \
- 	amd64-tdep.c \
-+	arc-linux-nat.c \
- 	arc-tdep.c \
- 	arm.c \
- 	arm-bsd-tdep.c \
-diff --git a/gdb/arc-linux-nat.c b/gdb/arc-linux-nat.c
-new file mode 100644
-index 00000000000..41301fd4fed
---- /dev/null
-+++ b/gdb/arc-linux-nat.c
-@@ -0,0 +1,320 @@
-+/* Native-dependent code for GNU/Linux ARC.
-+
-+   Copyright 2020 Free Software Foundation, Inc.
-+
-+   This file is part of GDB.
-+
-+   This program is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by
-+   the Free Software Foundation; either version 3 of the License, or
-+   (at your option) any later version.
-+
-+   This program is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+   GNU General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License
-+   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
-+
-+#include "defs.h"
-+#include "frame.h"
-+#include "inferior.h"
-+#include "gdbcore.h"
-+#include "regcache.h"
-+#include "gdbsupport/gdb_assert.h"
-+#include "target.h"
-+#include "linux-nat.h"
-+#include "nat/gdb_ptrace.h"
-+
-+#include <stdint.h>
-+#include <sys/types.h>
-+#include <sys/param.h>
-+#include <signal.h>
-+#include <sys/user.h>
-+#include <sys/ioctl.h>
-+#include "gdbsupport/gdb_wait.h"
-+#include <fcntl.h>
-+#include <sys/procfs.h>
-+#include <linux/elf.h>
-+
-+#include "gregset.h"
-+#include "arc-tdep.h"
-+#include "arc-linux-tdep.h"
-+#include "arch/arc.h"
-+
-+/* Defines ps_err_e, struct ps_prochandle.  */
-+#include "gdb_proc_service.h"
-+
-+/* Linux starting with 4.12 supports NT_ARC_V2 note type, which adds R30,
-+   R58 and R59 registers, which are specific to ARC HS and aren't
-+   available in ARC 700.  */
-+#if defined (NT_ARC_V2) && defined (__ARCHS__)
-+#define ARC_HAS_V2_REGSET
-+#endif
-+
-+class arc_linux_nat_target final : public linux_nat_target
-+{
-+public:
-+  /* Add ARC register access methods.  */
-+  void fetch_registers (struct regcache *, int) override;
-+  void store_registers (struct regcache *, int) override;
-+
-+  const struct target_desc *read_description () override;
-+
-+  /* Handle threads  */
-+  void low_prepare_to_resume (struct lwp_info *lp) override;
-+};
-+
-+static arc_linux_nat_target the_arc_linux_nat_target;
-+
-+/* Read general registers from target process/thread (via ptrace)
-+   into REGCACHE.  */
-+
-+static void
-+fetch_gregs (struct regcache *regcache, int regnum)
-+{
-+  const int tid = get_ptrace_pid (regcache->ptid ());
-+  struct iovec iov;
-+  gdb_gregset_t regs;
-+
-+  iov.iov_base = &regs;
-+  iov.iov_len = sizeof (gdb_gregset_t);
-+
-+  if (ptrace (PTRACE_GETREGSET, tid, NT_PRSTATUS, (void *) &iov) < 0)
-+    perror_with_name (_("Couldn't get general registers"));
-+  else
-+    arc_linux_supply_gregset (NULL, regcache, regnum, &regs, 0);
-+}
-+
-+#ifdef ARC_HAS_V2_REGSET
-+/* Read ARC v2 registers from target process/thread (via ptrace)
-+   into REGCACHE.  */
-+
-+static void
-+fetch_v2_regs (struct regcache *regcache, int regnum)
-+{
-+  const int tid = get_ptrace_pid (regcache->ptid ());
-+  struct iovec iov;
-+  bfd_byte v2_buffer[ARC_LINUX_SIZEOF_V2_REGSET];
-+
-+  iov.iov_base = &v2_buffer;
-+  iov.iov_len = ARC_LINUX_SIZEOF_V2_REGSET;
-+
-+  if (ptrace (PTRACE_GETREGSET, tid, NT_ARC_V2, (void *) &iov) < 0)
-+    perror_with_name (_("Couldn't get ARC HS registers"));
-+  else
-+    arc_linux_supply_v2_regset (NULL, regcache, regnum, v2_buffer, 0);
-+}
-+#endif
-+
-+/* Store general registers from REGCACHE into the target process/thread.  */
-+
-+static void
-+store_gregs (const struct regcache *regcache, int regnum)
-+{
-+  const int tid = get_ptrace_pid (regcache->ptid ());
-+  struct iovec iov;
-+  gdb_gregset_t regs;
-+
-+  iov.iov_base = &regs;
-+  iov.iov_len = sizeof (gdb_gregset_t);
-+
-+  if (ptrace (PTRACE_GETREGSET, tid, NT_PRSTATUS, (void *) &iov) < 0)
-+    perror_with_name (_("Couldn't get general registers"));
-+  else
-+    {
-+      arc_linux_collect_gregset (NULL, regcache, regnum, regs, 0);
-+
-+      if (ptrace (PTRACE_SETREGSET, tid, NT_PRSTATUS, (void *) &iov) < 0)
-+	perror_with_name (_("Couldn't write general registers"));
-+    }
-+}
-+
-+#ifdef ARC_HAS_V2_REGSET
-+/* Store ARC v2 registers from REGCACHE into the target process/thread.  */
-+
-+static void
-+store_v2_regs (const struct regcache *regcache, int regnum)
-+{
-+  const int tid = get_ptrace_pid (regcache->ptid ());
-+  struct iovec iov;
-+  bfd_byte v2_buffer[ARC_LINUX_SIZEOF_V2_REGSET];
-+
-+  iov.iov_base = &v2_buffer;
-+  iov.iov_len = ARC_LINUX_SIZEOF_V2_REGSET;
-+
-+  if (ptrace (PTRACE_GETREGSET, tid, NT_ARC_V2, (void *) &iov) < 0)
-+    perror_with_name (_("Couldn't get ARC HS registers"));
-+  else
-+    {
-+      arc_linux_collect_v2_regset (NULL, regcache, regnum, v2_buffer, 0);
-+
-+      if (ptrace (PTRACE_SETREGSET, tid, NT_ARC_V2, (void *) &iov) < 0)
-+	perror_with_name (_("Couldn't write ARC HS registers"));
-+    }
-+}
-+#endif
-+
-+/* Target operation: Read REGNUM register (all registers if REGNUM == -1)
-+   from target process into REGCACHE.  */
-+
-+void
-+arc_linux_nat_target::fetch_registers (struct regcache *regcache, int regnum)
-+{
-+
-+  if (regnum == -1 || regnum <= ARC_LAST_REGNUM)
-+    fetch_gregs (regcache, regnum);
-+
-+#ifdef ARC_HAS_V2_REGSET
-+  if (regnum == -1
-+      || regnum == ARC_R30_REGNUM
-+      || regnum == ARC_R58_REGNUM
-+      || regnum == ARC_R59_REGNUM)
-+      fetch_v2_regs (regcache, regnum);
-+#endif
-+}
-+
-+/* Target operation: Store REGNUM register (all registers if REGNUM == -1)
-+   to the target process from REGCACHE.  */
-+
-+void
-+arc_linux_nat_target::store_registers (struct regcache *regcache, int regnum)
-+{
-+  if (regnum == -1 || regnum <= ARC_LAST_REGNUM)
-+    store_gregs (regcache, regnum);
-+
-+#ifdef ARC_HAS_V2_REGSET
-+  if (regnum == -1
-+      || regnum == ARC_R30_REGNUM
-+      || regnum == ARC_R58_REGNUM
-+      || regnum == ARC_R59_REGNUM)
-+    store_v2_regs (regcache, regnum);
-+#endif
-+}
-+
-+/* Copy general purpose register(s) from REGCACHE into regset GREGS.
-+   This function is exported to proc-service.c  */
-+
-+void
-+fill_gregset (const struct regcache *regcache,
-+	      gdb_gregset_t *gregs, int regnum)
-+{
-+  arc_linux_collect_gregset (NULL, regcache, regnum, gregs, 0);
-+}
-+
-+/* Copy all the general purpose registers from regset GREGS into REGCACHE.
-+   This function is exported to proc-service.c.  */
-+
-+void
-+supply_gregset (struct regcache *regcache, const gdb_gregset_t *gregs)
-+{
-+  arc_linux_supply_gregset (NULL, regcache, -1, gregs, 0);
-+}
-+
-+/* ARC doesn't have separate FP registers.  This function is exported
-+   to proc-service.c.  */
-+
-+void
-+fill_fpregset (const struct regcache *regcache,
-+	       gdb_fpregset_t *fpregsetp, int regnum)
-+{
-+  if (arc_debug)
-+    debug_printf ("arc-linux-nat: fill_fpregset called.");
-+  return;
-+}
-+
-+/* ARC doesn't have separate FP registers.  This function is exported
-+   to proc-service.c.  */
-+
-+void
-+supply_fpregset (struct regcache *regcache, const gdb_fpregset_t *fpregsetp)
-+{
-+  if (arc_debug)
-+    debug_printf ("arc-linux-nat: supply_fpregset called.");
-+  return;
-+}
-+
-+/* Implement the "read_description" method of linux_nat_target.  */
-+
-+const struct target_desc *
-+arc_linux_nat_target::read_description ()
-+{
-+  /* This is a native target, hence description is hardcoded.  */
-+#ifdef __ARCHS__
-+  arc_arch_features features (4, ARC_ISA_ARCV2);
-+#else
-+  arc_arch_features features (4, ARC_ISA_ARCV1);
-+#endif
-+  return arc_lookup_target_description (features);
-+}
-+
-+/* As described in arc_linux_collect_gregset(), we need to write resume-PC
-+   to ERET.  However by default GDB for native targets doesn't write
-+   registers if they haven't been changed.  This is a callback called by
-+   generic GDB, and in this callback we have to rewrite PC value so it
-+   would force rewrite of register on target.  It seems that the only
-+   other arch that utilizes this hook is x86/x86-64 for HW breakpoint
-+   support.  But then, AFAIK no other arch has this stop_pc/eret
-+   complexity.
-+
-+   No better way was found, other than this fake write of register value,
-+   to force GDB into writing register to target.  Is there any?  */
-+
-+void
-+arc_linux_nat_target::low_prepare_to_resume (struct lwp_info *lwp)
-+{
-+  /* When new processes and threads are created we do not have the address
-+     space for them and calling get_thread_regcache will cause an internal
-+     error in GDB.  It looks like that checking for last_resume_kind is the
-+     sensible way to determine processes for which we cannot get regcache.
-+     Ultimately, a better way would be removing the need for
-+     low_prepare_to_resume in the first place.  */
-+  if (lwp->last_resume_kind == resume_stop)
-+    return;
-+
-+  struct regcache *regcache = get_thread_regcache (this, lwp->ptid);
-+  struct gdbarch *gdbarch = regcache->arch ();
-+
-+  /* Read current PC value, then write it back.  It is required to call
-+     invalidate(), otherwise GDB will note that new value is equal to old
-+     value and will skip write.  */
-+  ULONGEST new_pc;
-+  regcache_cooked_read_unsigned (regcache, gdbarch_pc_regnum (gdbarch),
-+				 &new_pc);
-+  regcache->invalidate (gdbarch_pc_regnum (gdbarch));
-+  regcache_cooked_write_unsigned (regcache, gdbarch_pc_regnum (gdbarch),
-+				  new_pc);
-+}
-+
-+/* Fetch the thread-local storage pointer for libthread_db.  Note that
-+   this function is not called from GDB, but is called from libthread_db.
-+   This is required to debug multithreaded applications with NPTL.  */
-+
-+ps_err_e
-+ps_get_thread_area (struct ps_prochandle *ph, lwpid_t lwpid, int idx,
-+		    void **base)
-+{
-+  if (arc_debug >= 2)
-+    debug_printf ("arc-linux-nat: ps_get_thread_area called");
-+
-+  if (ptrace (PTRACE_GET_THREAD_AREA, lwpid, NULL, base) != 0)
-+    return PS_ERR;
-+
-+  /* IDX is the bias from the thread pointer to the beginning of the
-+     thread descriptor.  It has to be subtracted due to implementation
-+     quirks in libthread_db.  */
-+  *base = (void *) ((char *) *base - idx);
-+
-+  return PS_OK;
-+}
-+
-+/* Suppress warning from -Wmissing-prototypes.  */
-+void _initialize_arc_linux_nat ();
-+void
-+_initialize_arc_linux_nat ()
-+{
-+  /* Register the target.  */
-+  linux_target = &the_arc_linux_nat_target;
-+  add_inf_child_target (&the_arc_linux_nat_target);
-+}
-diff --git a/gdb/configure.host b/gdb/configure.host
-index ce528237291..e94a19b0332 100644
---- a/gdb/configure.host
-+++ b/gdb/configure.host
-@@ -60,6 +60,7 @@ case "${host_cpu}" in
- 
- aarch64*)		gdb_host_cpu=aarch64 ;;
- alpha*)			gdb_host_cpu=alpha ;;
-+arc*)			gdb_host_cpu=arc ;;
- arm*)			gdb_host_cpu=arm ;;
- hppa*)			gdb_host_cpu=pa ;;
- i[34567]86*)		gdb_host_cpu=i386 ;;
-@@ -91,6 +92,8 @@ alpha*-*-netbsd* | alpha*-*-knetbsd*-gnu)
- 			gdb_host=nbsd ;;
- alpha*-*-openbsd*)	gdb_host=nbsd ;;
- 
-+arc*-*-linux*)		gdb_host=linux ;;
-+
- arm*-*-freebsd*)	gdb_host=fbsd ;;
- arm*-*-linux*)		gdb_host=linux ;;
- arm*-*-netbsdelf* | arm*-*-knetbsd*-gnu)
-diff --git a/gdb/configure.nat b/gdb/configure.nat
-index bb70e303384..cd11bc86dca 100644
---- a/gdb/configure.nat
-+++ b/gdb/configure.nat
-@@ -238,6 +238,10 @@ case ${gdb_host} in
- 		nat/aarch64-linux.o \
- 		nat/aarch64-sve-linux-ptrace.o"
- 		;;
-+	    arc)
-+		# Host: ARC based machine running GNU/Linux
-+		NATDEPFILES="${NATDEPFILES} arc-linux-nat.o"
-+		;;
- 	    arm)
- 		# Host: ARM based machine running GNU/Linux
- 		NATDEPFILES="${NATDEPFILES} arm-linux-nat.o \
--- 
-2.16.2
-
diff --git a/meta/recipes-devtools/gdb/gdb_10.2.bb b/meta/recipes-devtools/gdb/gdb_11.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_10.2.bb
rename to meta/recipes-devtools/gdb/gdb_11.1.bb
-- 
2.33.1


