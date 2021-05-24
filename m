Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.27673.1621881003366245069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 11:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=stCwFVlD;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: petr.vorel@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id f6-20020a1c1f060000b0290175ca89f698so11917825wmf.5
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 11:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=moqAh51S6BNWXtRf7TjmoD+Gx6Nvjzx+tpjF+8H11mw=;
        b=stCwFVlDbJNgm0unWYefQ/uNWB0v1B8OhbmYJ2eeoiWRatfuOWZ56Vx4settB+r5zT
         eRmocTufOlD36DGeoaq283OOIkfiimc4/VrmH8pjeKawpiWe5LkOtXxO4DG4kHLMAfTe
         ERt6tFtlQJpc7VnRjkv4KyHfcUtGKMmD/ZMSx/3aIT/N/oLnUbN5uEJ1Ahqw3aOmptyw
         9PlFwPHJ9NfOuZRHmKOCCh/vX9HaAQMZzzvep/Kkg5cplSoEgtsg1xGx8ViTxc5dUVCr
         X9h0S/dAB5dyLmtO1l2IE0sESJ+Y6u2nwWPqoSGE6aUuQjXmLr6VCgMoy+GJW4+8nslK
         AVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=moqAh51S6BNWXtRf7TjmoD+Gx6Nvjzx+tpjF+8H11mw=;
        b=Qx1/eZ5DF3VDi2Pqi8n49RopJZ2DqDFC85q23NrxbT2REXMtkV1GJuiQ6NSljVa6O9
         gOYM1Z81c7J9KXLhOWtMV68lGL/l1ZjfCRNSYiuZtBDU/gVl3ZZ+lisATebxqtAFsnNw
         PXtk/VOk+LPneBXUE0ykDmmKPm7CGgRNS5Bj/TOOBMsSd5nmfDxz+IfLN/6vz29AI6KK
         xWEy/Uw2a43ZMXn5eMnCEiLn4mU2P/kFwlogFUVcgQYdcXoVktfi1r4WKB6HdR57UmFX
         4JMzSdXk3ttI/O68ZvmPO1wt2AbtWUHZ9RGrbBM9zIOOKoQYWFgjYQF0smJDfqeDvMra
         oiaA==
X-Gm-Message-State: AOAM532sAWCO2W+B2jdGtevr24uQBb205kkn4/VGYPSoYBTBlDX7323E
	B3bWVlcKnFCXComsg1F6QsKs1NeaCfDXEA==
X-Google-Smtp-Source: ABdhPJz5oc53Z4CSNvyZqyWcudTUZGW8IpwfTLvMO9Zj+tN2a0vFXvd4IPSyGQfU3PLUc7FF7bNNQQ==
X-Received: by 2002:a1c:3184:: with SMTP id x126mr355079wmx.52.1621881001532;
        Mon, 24 May 2021 11:30:01 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from dell5510.suse.de ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id z9sm8515261wmi.17.2021.05.24.11.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 11:30:01 -0700 (PDT)
From: "Petr Vorel" <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
	=?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2 1/1] ltp: Update to 20210524
Date: Mon, 24 May 2021 20:29:55 +0200
Message-Id: <20210524182955.29512-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove patches accepted in this upstream release
* determinism.patch (45530792a, 01fefa08c)
* libswapon.patch (2b64c727f)
* 0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch
  (f38172209)
* 0002-Makefile-Avoid-wildcard-determinism-issues.patch (edf60cf6a)
* 0003-syscalls-swapon-swapoff-Move-common-library-to-libs.patch
  (ac140ed58)

Removed (test rewritten to new API)
* 0007-Fix-test_proc_kill-hanging.patch

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* update patches list in ltp_20210524.bb
(forget to remove removed patches)

Sorry for invalid previous patch.

Kind regards,
Petr

 ...uite-generate-makefiles.sh-Avoid-inc.patch |  40 --
 ...le-Avoid-wildcard-determinism-issues.patch | 310 ---------------
 ...-swapoff-Move-common-library-to-libs.patch | 133 -------
 .../ltp/0007-Fix-test_proc_kill-hanging.patch |  32 --
 .../ltp/ltp/determinism.patch                 |  43 --
 meta/recipes-extended/ltp/ltp/libswapon.patch | 368 ------------------
 .../ltp/{ltp_20210121.bb => ltp_20210524.bb}  |   7 +-
 7 files changed, 1 insertion(+), 932 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0002-Makefile-Avoid-wildcard-determinism-issues.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0003-syscalls-swapon-swapoff-Move-common-library-to-libs.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0007-Fix-test_proc_kill-hanging.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/determinism.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/libswapon.patch
 rename meta/recipes-extended/ltp/{ltp_20210121.bb => ltp_20210524.bb} (94%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch b/meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch
deleted file mode 100644
index c2a70dcb67..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 2d1d6350af1db28ec520e26d0069a0518950b0a1 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Tue, 9 Mar 2021 15:21:11 +0000
-Subject: [PATCH 1/3] open_posix_testsuite/generate-makefiles.sh: Avoid
- inconsistencies with make version
-
-With make 4.1, INSTALL_TARGETS+=<tab> will add a space to the variable whereas
-with make 4.3, it will not. This leads to differing run.sh files in installed
-in packages which is undesireable. If tests is empty we don't have to add
-the line to the makefiles at all which seems like the easiest way to
-avoid the differences in make behaviour.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2021-March/021386.html]
-
----
- .../open_posix_testsuite/scripts/generate-makefiles.sh      | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/testcases/open_posix_testsuite/scripts/generate-makefiles.sh b/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
-index 200a631db..4b3aaa4a0 100755
---- a/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
-+++ b/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
-@@ -148,8 +148,12 @@ EOF
- 
- 	fi
- 
--	cat >> "$makefile.2" <<EOF
-+	if [ ! -z "${tests}" ]; then
-+		cat >> "$makefile.2" <<EOF
- INSTALL_TARGETS+=	${tests}
-+EOF
-+	fi
-+	cat >> "$makefile.2" <<EOF
- MAKE_TARGETS+=		${targets}
- 
- EOF
--- 
-2.27.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0002-Makefile-Avoid-wildcard-determinism-issues.patch b/meta/recipes-extended/ltp/ltp/0002-Makefile-Avoid-wildcard-determinism-issues.patch
deleted file mode 100644
index 4859c3eaed..0000000000
--- a/meta/recipes-extended/ltp/ltp/0002-Makefile-Avoid-wildcard-determinism-issues.patch
+++ /dev/null
@@ -1,310 +0,0 @@
-From 4030e28f2c2296ba138cb5e2495202f8aec7ba32 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Tue, 9 Mar 2021 15:21:36 +0000
-Subject: [PATCH 2/3] Makefile: Avoid wildcard determinism issues
-
-wildcard used in Makefiles preserves the order of the files on disk
-which leads to differences in the order the binaries are linked.
-
-This patch tweaks the usage of wildcard to also have a sort, making
-the binaries reproducible. A previous patch massively improved
-the situation but wider testing showed that these other changes can
-have an effect on some binaries, this patch avoids those issues as
-exposed by our wider testing.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2021-March/021388.html]
-
----
- include/mk/env_post.mk                                     | 2 +-
- include/mk/module.mk                                       | 2 +-
- runtest/Makefile                                           | 2 +-
- scenario_groups/Makefile                                   | 2 +-
- testcases/commands/ldd/datafiles/Makefile                  | 2 +-
- testcases/kernel/hotplug/memory_hotplug/Makefile           | 3 ++-
- testcases/kernel/io/disktest/Makefile                      | 2 +-
- testcases/kernel/io/disktest/Makefile.linux                | 4 ++--
- testcases/kernel/sched/hyperthreading/ht_affinity/Makefile | 2 +-
- testcases/kernel/sched/hyperthreading/ht_enabled/Makefile  | 2 +-
- testcases/kernel/sched/sched_stress/Makefile               | 2 +-
- testcases/kernel/syscalls/lchown/Makefile                  | 2 +-
- testcases/kernel/syscalls/migrate_pages/Makefile           | 2 +-
- testcases/kernel/syscalls/move_pages/Makefile              | 2 +-
- testcases/kernel/syscalls/utils/compat_16.mk               | 2 +-
- testcases/kernel/syscalls/utils/newer_64.mk                | 2 +-
- testcases/misc/math/float/Makefile                         | 2 +-
- testcases/network/nfs/nfs_stress/nfs05_make_tree.c         | 4 ++--
- testcases/network/nfsv4/locks/Makefile                     | 2 +-
- utils/sctp/func_tests/Makefile                             | 2 +-
- 20 files changed, 23 insertions(+), 22 deletions(-)
-
-diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
-index d52ad9f0b..1d22f9c53 100644
---- a/include/mk/env_post.mk
-+++ b/include/mk/env_post.mk
-@@ -47,7 +47,7 @@ LDFLAGS				+= -L$(top_builddir)/lib/android_libpthread
- LDFLAGS				+= -L$(top_builddir)/lib/android_librt
- endif
- 
--MAKE_TARGETS			?= $(notdir $(patsubst %.c,%,$(wildcard $(abs_srcdir)/*.c)))
-+MAKE_TARGETS			?= $(notdir $(patsubst %.c,%,$(sort $(wildcard $(abs_srcdir)/*.c))))
- MAKE_TARGETS			:= $(filter-out $(FILTER_OUT_MAKE_TARGETS),$(MAKE_TARGETS))
- 
- # with only *.dwo, .[0-9]+.dwo can not be cleaned
-diff --git a/include/mk/module.mk b/include/mk/module.mk
-index 95fb8336a..6c8814b96 100644
---- a/include/mk/module.mk
-+++ b/include/mk/module.mk
-@@ -42,7 +42,7 @@ endif
- 
- ifneq ($(filter install clean,$(MAKECMDGOALS)),)
- MAKE_TARGETS := $(filter-out %.ko, $(MAKE_TARGETS))
--MAKE_TARGETS += $(wildcard *.ko)
-+MAKE_TARGETS += $(sort $(wildcard *.ko))
- endif
- 
- CLEAN_TARGETS += .dep_modules *.mod built-in.a
-diff --git a/runtest/Makefile b/runtest/Makefile
-index b7caaee06..6a1565b6a 100644
---- a/runtest/Makefile
-+++ b/runtest/Makefile
-@@ -36,7 +36,7 @@ ifneq ($(WITH_POWER_MANAGEMENT_TESTSUITE),yes)
- UNWANTED_FILES		+= power_management_tests
- endif
- 
--INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(wildcard $(abs_srcdir)/*))))
-+INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(sort $(wildcard $(abs_srcdir)/*)))))
- 
- MAKE_TARGETS		:=
- 
-diff --git a/scenario_groups/Makefile b/scenario_groups/Makefile
-index 2978675d9..fcbc92708 100644
---- a/scenario_groups/Makefile
-+++ b/scenario_groups/Makefile
-@@ -31,7 +31,7 @@ UNWANTED_FILES		:= Makefile
- 
- INSTALL_MODE		:= 00644
- 
--INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(wildcard $(abs_srcdir)/*))))
-+INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(sort $(wildcard $(abs_srcdir)/*)))))
- 
- MAKE_TARGETS		:=
- 
-diff --git a/testcases/commands/ldd/datafiles/Makefile b/testcases/commands/ldd/datafiles/Makefile
-index d8bcf5c06..01c352052 100644
---- a/testcases/commands/ldd/datafiles/Makefile
-+++ b/testcases/commands/ldd/datafiles/Makefile
-@@ -21,7 +21,7 @@ CPPFLAGS		+= -fpic
- 
- INSTALL_TARGETS		:= ldd*.so lddfile.out
- 
--LDD_C_FILES		:= $(wildcard $(abs_srcdir)/lddfile*.c)
-+LDD_C_FILES		:= $(sort $(wildcard $(abs_srcdir)/lddfile*.c))
- LDD_SO_FILES		:= $(patsubst $(abs_srcdir)/%.c,%.obj.so,$(LDD_C_FILES))
- MAKE_TARGETS		:= lddfile.out
- CLEAN_TARGETS		+= *.obj $(LDD_SO_FILES)
-diff --git a/testcases/kernel/hotplug/memory_hotplug/Makefile b/testcases/kernel/hotplug/memory_hotplug/Makefile
-index d1ba65e65..38a77a2ba 100644
---- a/testcases/kernel/hotplug/memory_hotplug/Makefile
-+++ b/testcases/kernel/hotplug/memory_hotplug/Makefile
-@@ -31,6 +31,7 @@ LDLIBS		:= $(filter-out -lltp,$(LDLIBS))
- 
- MAKE_TARGETS	:= memtoy
- 
--memtoy: $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
-+memtoy: $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
-+
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
-diff --git a/testcases/kernel/io/disktest/Makefile b/testcases/kernel/io/disktest/Makefile
-index d10d98434..3a3a9cbf0 100644
---- a/testcases/kernel/io/disktest/Makefile
-+++ b/testcases/kernel/io/disktest/Makefile
-@@ -209,7 +209,7 @@ LDLIBS		+= -lpthread
- 
- MAKE_TARGETS	:= disktest
- 
--OBJS		:= $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
-+OBJS		:= $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
- 
- disktest-$(VER):
- 	mkdir -p "$@"
-diff --git a/testcases/kernel/io/disktest/Makefile.linux b/testcases/kernel/io/disktest/Makefile.linux
-index ea45b5a57..0f3aab622 100644
---- a/testcases/kernel/io/disktest/Makefile.linux
-+++ b/testcases/kernel/io/disktest/Makefile.linux
-@@ -167,8 +167,8 @@ mandir=/usr/share/man
- 
- VER=`grep VER_STR main.h | awk -F\" '{print $$2}'`
- GBLHDRS=main.h globals.h defs.h
--ALLHDRS=$(wildcard *.h)
--SRCS=$(wildcard *.c)
-+ALLHDRS=$(sort $(wildcard *.h))
-+SRCS=$(sort $(wildcard *.c))
- OBJS=$(SRCS:.c=.o)
- 
- CFLAGS += -g -Wall -O -D"LINUX" -D"_THREAD_SAFE" -D"_GNU_SOURCE" -D"_LARGE_FILES" -D"_LARGEFILE64_SOURCE" -D"_FILE_OFFSET_BITS=64" $(RPM_OPT_FLAGS)
-diff --git a/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile b/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile
-index 10fec96dc..6b64bd261 100644
---- a/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile
-+++ b/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile
-@@ -28,6 +28,6 @@ INSTALL_TARGETS		:= smt_smp_affinity.sh
- 
- MAKE_TARGETS		:= ht_affinity
- 
--$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
-+$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
-diff --git a/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile b/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile
-index 9c1e139d6..585ff1383 100644
---- a/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile
-+++ b/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile
-@@ -28,6 +28,6 @@ INSTALL_TARGETS		:= smt_smp_enabled.sh
- 
- MAKE_TARGETS		:= ht_enabled
- 
--$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
-+$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
-diff --git a/testcases/kernel/sched/sched_stress/Makefile b/testcases/kernel/sched/sched_stress/Makefile
-index b76126c73..4dbbf3477 100644
---- a/testcases/kernel/sched/sched_stress/Makefile
-+++ b/testcases/kernel/sched/sched_stress/Makefile
-@@ -10,7 +10,7 @@ INSTALL_TARGETS		:= sched_stress.sh
- 
- LDLIBS			+= -lpthread
- 
--MAKE_TARGETS		:= $(filter-out sched,$(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*.c)))
-+MAKE_TARGETS		:= $(filter-out sched,$(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*.c))))
- 
- RM			+= -r
- 
-diff --git a/testcases/kernel/syscalls/lchown/Makefile b/testcases/kernel/syscalls/lchown/Makefile
-index 13d39cb81..305fee281 100644
---- a/testcases/kernel/syscalls/lchown/Makefile
-+++ b/testcases/kernel/syscalls/lchown/Makefile
-@@ -5,7 +5,7 @@ top_srcdir		?= ../../../..
- 
- include $(top_srcdir)/include/mk/testcases.mk
- 
--SRCS			:= $(wildcard $(abs_srcdir)/lchown*.c)
-+SRCS			:= $(sort $(wildcard $(abs_srcdir)/lchown*.c))
- 
- include $(abs_srcdir)/../utils/compat_16.mk
- 
-diff --git a/testcases/kernel/syscalls/migrate_pages/Makefile b/testcases/kernel/syscalls/migrate_pages/Makefile
-index 46912b025..9cf3ce526 100644
---- a/testcases/kernel/syscalls/migrate_pages/Makefile
-+++ b/testcases/kernel/syscalls/migrate_pages/Makefile
-@@ -5,7 +5,7 @@ top_srcdir		?= ../../../..
- 
- include $(top_srcdir)/include/mk/testcases.mk
- 
--MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*[0-9].c))
-+MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*[0-9].c)))
- $(MAKE_TARGETS): %: migrate_pages_common.o
- 
- CPPFLAGS		+= -I$(abs_srcdir)/../utils/
-diff --git a/testcases/kernel/syscalls/move_pages/Makefile b/testcases/kernel/syscalls/move_pages/Makefile
-index cd7ff6349..4b22160ed 100644
---- a/testcases/kernel/syscalls/move_pages/Makefile
-+++ b/testcases/kernel/syscalls/move_pages/Makefile
-@@ -7,7 +7,7 @@ include $(top_srcdir)/include/mk/testcases.mk
- 
- CPPFLAGS		+= -I$(abs_srcdir)/../utils
- 
--MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*[0-9].c))
-+MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*[0-9].c)))
- 
- $(MAKE_TARGETS): %: move_pages_support.o
- 
-diff --git a/testcases/kernel/syscalls/utils/compat_16.mk b/testcases/kernel/syscalls/utils/compat_16.mk
-index a0ff8f558..e81a00c40 100644
---- a/testcases/kernel/syscalls/utils/compat_16.mk
-+++ b/testcases/kernel/syscalls/utils/compat_16.mk
-@@ -50,7 +50,7 @@
- 
- CPPFLAGS		+= -I$(abs_srcdir) -I$(abs_srcdir)/../utils
- 
--SRCS			?= $(wildcard $(abs_srcdir)/*.c)
-+SRCS			?= $(sort $(wildcard $(abs_srcdir)/*.c))
- 
- MAKE_TARGETS		:= $(notdir $(patsubst %.c,%,$(SRCS)))
- MAKE_TARGETS_OBJS_WO_COMPAT_16	:= $(addsuffix .o,$(MAKE_TARGETS))
-diff --git a/testcases/kernel/syscalls/utils/newer_64.mk b/testcases/kernel/syscalls/utils/newer_64.mk
-index 8cd7e03c8..5e798057a 100644
---- a/testcases/kernel/syscalls/utils/newer_64.mk
-+++ b/testcases/kernel/syscalls/utils/newer_64.mk
-@@ -25,7 +25,7 @@
- 
- CPPFLAGS		+= -I$(abs_srcdir) -I$(abs_srcdir)/../utils
- 
--SRCS			?= $(wildcard $(abs_srcdir)/*.c)
-+SRCS			?= $(sort $(wildcard $(abs_srcdir)/*.c))
- 
- MAKE_TARGETS		:= $(notdir $(patsubst %.c,%,$(SRCS)))
- 
-diff --git a/testcases/misc/math/float/Makefile b/testcases/misc/math/float/Makefile
-index 79dda35d6..5f4cb0f6c 100644
---- a/testcases/misc/math/float/Makefile
-+++ b/testcases/misc/math/float/Makefile
-@@ -27,6 +27,6 @@ include $(top_srcdir)/include/mk/testcases.mk
- LDLIBS		+= -lpthread -lm
- 
- # main.c doesn't compile...
--MAKE_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/float*.c))
-+MAKE_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/float*.c)))
- 
- include $(top_srcdir)/include/mk/generic_trunk_target.mk
-diff --git a/testcases/network/nfs/nfs_stress/nfs05_make_tree.c b/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
-index 12c86799d..23c520d9d 100644
---- a/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
-+++ b/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
-@@ -104,7 +104,7 @@ static void *thread_fn(LTP_ATTRIBUTE_UNUSED void *args)
- 				"\treturn 0;\n}\n";
- 
- 	const char make_buf_n[] = "CFLAGS := -O -w -g\n"
--				  "SRCS=$(wildcard *.c)\n"
-+				  "SRCS=$(sort $(wildcard *.c))\n"
- 				  "TARGETS=$(SRCS:.c=)\n"
- 				  "all: $(TARGETS)\n"
- 				  "$(TARGETS): %: %.c\n"
-@@ -114,7 +114,7 @@ static void *thread_fn(LTP_ATTRIBUTE_UNUSED void *args)
- 
- 	const char make_buf[] = "CFLAGS := -O -w -g\n"
- 				"SUBDIR = dir\n"
--				"SRCS=$(wildcard *.c)\n"
-+				"SRCS=$(sort $(wildcard *.c))\n"
- 				"TARGETS=$(SRCS:.c=)\n"
- 				"all: $(SUBDIR) $(TARGETS)\n"
- 				"$(TARGETS): %: %.c\n"
-diff --git a/testcases/network/nfsv4/locks/Makefile b/testcases/network/nfsv4/locks/Makefile
-index 5812dea3a..05941c892 100644
---- a/testcases/network/nfsv4/locks/Makefile
-+++ b/testcases/network/nfsv4/locks/Makefile
-@@ -28,6 +28,6 @@ MAKE_TARGETS		:= locktests
- 
- LDLIBS			+= -lpthread
- 
--$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
-+$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
-diff --git a/utils/sctp/func_tests/Makefile b/utils/sctp/func_tests/Makefile
-index d296c652a..a17107853 100644
---- a/utils/sctp/func_tests/Makefile
-+++ b/utils/sctp/func_tests/Makefile
-@@ -30,7 +30,7 @@ LDFLAGS		+= $(addprefix -L$(abs_builddir)/../,lib testlib)
- 
- LDLIBS		+= -lsctputil -lsctp -lpthread
- 
--V4_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*.c))
-+V4_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*.c)))
- 
- V6_TARGETS	:= test_basic_v6 test_fragments_v6 test_getname_v6 \
- 		   test_inaddr_any_v6 test_peeloff_v6 \
--- 
-2.27.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0003-syscalls-swapon-swapoff-Move-common-library-to-libs.patch b/meta/recipes-extended/ltp/ltp/0003-syscalls-swapon-swapoff-Move-common-library-to-libs.patch
deleted file mode 100644
index 5ace82dba5..0000000000
--- a/meta/recipes-extended/ltp/ltp/0003-syscalls-swapon-swapoff-Move-common-library-to-libs.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 0653f1d809d0cc13f84facb9d2d82d984ac4d0ac Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Tue, 9 Mar 2021 15:25:16 +0000
-Subject: [PATCH 3/3] syscalls/swapon/swapoff: Move common library to libs/
-
-There is a race/determinism issue with libswapon currently as depending on
-which makefile path builds it, the debug paths may be "../swapon/libswapon.c"
-or "libswapon.c". To avoid the determinism issue, move libswapon to libs/
-and use it from the shared location.
-
-The header is moved to the common includes directory to match and
-the Makefile.inc fragment can be dropped.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2021-March/021387.html]
-
----
- .../kernel/syscalls/swapon => include}/libswapon.h   |  0
- libs/libltpswapon/Makefile                           | 12 ++++++++++++
- .../swapon => libs/libltpswapon}/libswapon.c         |  0
- testcases/kernel/syscalls/swapoff/Makefile           |  7 +++++--
- testcases/kernel/syscalls/swapoff/Makefile.inc       |  6 ------
- testcases/kernel/syscalls/swapoff/swapoff01.c        |  2 +-
- testcases/kernel/syscalls/swapoff/swapoff02.c        |  2 +-
- testcases/kernel/syscalls/swapon/Makefile            |  6 +++---
- 8 files changed, 22 insertions(+), 13 deletions(-)
- rename {testcases/kernel/syscalls/swapon => include}/libswapon.h (100%)
- create mode 100644 libs/libltpswapon/Makefile
- rename {testcases/kernel/syscalls/swapon => libs/libltpswapon}/libswapon.c (100%)
- delete mode 100644 testcases/kernel/syscalls/swapoff/Makefile.inc
-
-diff --git a/testcases/kernel/syscalls/swapon/libswapon.h b/include/libswapon.h
-similarity index 100%
-rename from testcases/kernel/syscalls/swapon/libswapon.h
-rename to include/libswapon.h
-diff --git a/libs/libltpswapon/Makefile b/libs/libltpswapon/Makefile
-new file mode 100644
-index 000000000..8f738338b
---- /dev/null
-+++ b/libs/libltpswapon/Makefile
-@@ -0,0 +1,12 @@
-+# SPDX-License-Identifier: GPL-2.0-or-later
-+#
-+# Copyright (C) Richard Purdie <richard.purdie@linuxfoundation.org>
-+
-+top_srcdir		?= ../..
-+
-+include $(top_srcdir)/include/mk/env_pre.mk
-+
-+INTERNAL_LIB		:= libltpswapon.a
-+
-+include $(top_srcdir)/include/mk/lib.mk
-+include $(top_srcdir)/include/mk/generic_leaf_target.mk
-diff --git a/testcases/kernel/syscalls/swapon/libswapon.c b/libs/libltpswapon/libswapon.c
-similarity index 100%
-rename from testcases/kernel/syscalls/swapon/libswapon.c
-rename to libs/libltpswapon/libswapon.c
-diff --git a/testcases/kernel/syscalls/swapoff/Makefile b/testcases/kernel/syscalls/swapoff/Makefile
-index fbfbe0441..a74374605 100644
---- a/testcases/kernel/syscalls/swapoff/Makefile
-+++ b/testcases/kernel/syscalls/swapoff/Makefile
-@@ -3,7 +3,10 @@
- 
- top_srcdir		?= ../../../..
- 
-+LTPLIBS = ltpswapon
-+
- include $(top_srcdir)/include/mk/testcases.mk
--include $(abs_srcdir)/./Makefile.inc
-+
-+LTPLDLIBS  = -lltpswapon
-+
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
--$(MAKE_TARGETS): %: ../swapon/libswapon.o
-diff --git a/testcases/kernel/syscalls/swapoff/Makefile.inc b/testcases/kernel/syscalls/swapoff/Makefile.inc
-deleted file mode 100644
-index 65350cbeb..000000000
---- a/testcases/kernel/syscalls/swapoff/Makefile.inc
-+++ /dev/null
-@@ -1,6 +0,0 @@
--LIBDIR			+= ../swapon/
--LIBSWAPON		:= $(LIBDIR)/libswapon.o
--$(LIBSWAPON):
--	$(MAKE) -C $(LIBDIR)
--CPPFLAGS		+= -I$(abs_srcdir)/$(LIBDIR)
--LDFLAGS			+= -L$(abs_builddir)/$(LIBDIR)
-diff --git a/testcases/kernel/syscalls/swapoff/swapoff01.c b/testcases/kernel/syscalls/swapoff/swapoff01.c
-index e115269c0..87a217a89 100644
---- a/testcases/kernel/syscalls/swapoff/swapoff01.c
-+++ b/testcases/kernel/syscalls/swapoff/swapoff01.c
-@@ -25,7 +25,7 @@
- #include <stdlib.h>
- #include "config.h"
- #include "lapi/syscalls.h"
--#include "../swapon/libswapon.h"
-+#include "libswapon.h"
- 
- static void setup(void);
- static void cleanup(void);
-diff --git a/testcases/kernel/syscalls/swapoff/swapoff02.c b/testcases/kernel/syscalls/swapoff/swapoff02.c
-index 8954f975f..60cd66c26 100644
---- a/testcases/kernel/syscalls/swapoff/swapoff02.c
-+++ b/testcases/kernel/syscalls/swapoff/swapoff02.c
-@@ -33,7 +33,7 @@
- #include "test.h"
- #include "lapi/syscalls.h"
- #include "safe_macros.h"
--#include "../swapon/libswapon.h"
-+#include "libswapon.h"
- 
- static void setup(void);
- static void cleanup(void);
-diff --git a/testcases/kernel/syscalls/swapon/Makefile b/testcases/kernel/syscalls/swapon/Makefile
-index 97113a447..57ec45d48 100644
---- a/testcases/kernel/syscalls/swapon/Makefile
-+++ b/testcases/kernel/syscalls/swapon/Makefile
-@@ -8,10 +8,10 @@ endif
- 
- top_srcdir		?= ../../../..
- 
-+LTPLIBS = ltpswapon
-+
- include $(top_srcdir)/include/mk/testcases.mk
- 
--FILTER_OUT_MAKE_TARGETS         := libswapon
-+LTPLDLIBS  = -lltpswapon
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
--
--$(MAKE_TARGETS): %: libswapon.o
--- 
-2.27.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0007-Fix-test_proc_kill-hanging.patch b/meta/recipes-extended/ltp/ltp/0007-Fix-test_proc_kill-hanging.patch
deleted file mode 100644
index 0e7264574f..0000000000
--- a/meta/recipes-extended/ltp/ltp/0007-Fix-test_proc_kill-hanging.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f4fafbdffae3a63c81f65cef98c72dda26283e06 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 8 Feb 2017 16:17:17 +0800
-Subject: [PATCH] Fix test_proc_kill hanging
-
-Sometimes the signal is delivered to memcg_process before the framework took
-into consideration its pid entered in the tasks. Fixed by delaying the signal
-send command.
-
-Upstream-Status: Pending
-
-Signed-off-by: George Nita <george.nita@enea.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- testcases/kernel/controllers/memcg/functional/memcg_lib.sh | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
-index aadaae4..deea5d6 100755
---- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
-+++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
-@@ -291,6 +291,7 @@ test_proc_kill()
- 	pid=$!
- 	TST_CHECKPOINT_WAIT 0
- 	echo $pid > tasks
-+	sleep 1
- 
- 	signal_memcg_process $pid $3
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/determinism.patch b/meta/recipes-extended/ltp/ltp/determinism.patch
deleted file mode 100644
index 76d40721b8..0000000000
--- a/meta/recipes-extended/ltp/ltp/determinism.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-open_posix_testsuite/generate-makefiles.sh: Fix determinism issue
-
-Currently the list of tests is generated by the order of the files found
-within the directories. This results in differences in the run.sh and 
-Makefiles. Within Yocto Project this results in differing target
-test packages. The fix is simple, just sort the output from locate-test.
-
-mk/lib.mk: Sort wildcard expansion for determinism
-
-The order of the objects linked into libltp.a varies depending on the
-order of the files found on disk. This results in most ltp binaries
-differing depending on that order too.
-
-Sort the wildcard expansion of *.c which leads to reproducible binaries.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2021-March/021272.html http://lists.linux.it/pipermail/ltp/2021-March/021273.html]
-
-Index: git/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
-===================================================================
---- git.orig/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
-+++ git/testcases/open_posix_testsuite/scripts/generate-makefiles.sh
-@@ -24,7 +24,7 @@ generate_locate_test_makefile() {
- 
- 	echo "Generating $maketype Makefiles"
- 
--	locate-test --$maketype | sed -e 's,^./,,g' > make-gen.$maketype
-+	locate-test --$maketype | sed -e 's,^./,,g' | sort > make-gen.$maketype
- 
- 	generate_makefiles make-gen.$maketype $*
- 
-Index: git/include/mk/lib.mk
-===================================================================
---- git.orig/include/mk/lib.mk
-+++ git/include/mk/lib.mk
-@@ -50,6 +50,7 @@ endif
- MAKE_TARGETS	+= $(LIB)
- 
- LIBSRCS		?= $(wildcard $(abs_srcdir)/*.c)
-+LIBSRCS		:= $(sort $(LIBSRCS))
- LIBSRCS		:= $(abspath $(LIBSRCS))
- LIBSRCS		:= $(subst $(abs_srcdir)/,,$(wildcard $(LIBSRCS)))
- LIBSRCS		:= $(filter-out $(FILTER_OUT_LIBSRCS),$(LIBSRCS))
diff --git a/meta/recipes-extended/ltp/ltp/libswapon.patch b/meta/recipes-extended/ltp/ltp/libswapon.patch
deleted file mode 100644
index 07b0dcefcf..0000000000
--- a/meta/recipes-extended/ltp/ltp/libswapon.patch
+++ /dev/null
@@ -1,368 +0,0 @@
-Index: git/libs/libltpswapon/Makefile
-===================================================================
---- /dev/null
-+++ git/libs/libltpswapon/Makefile
-@@ -0,0 +1,12 @@
-+# SPDX-License-Identifier: GPL-2.0-or-later
-+#
-+# Copyright (C) Richard Purdie <richard.purdie@linuxfoundation.org>
-+
-+top_srcdir		?= ../..
-+
-+include $(top_srcdir)/include/mk/env_pre.mk
-+
-+INTERNAL_LIB		:= libltpswapon.a
-+
-+include $(top_srcdir)/include/mk/lib.mk
-+include $(top_srcdir)/include/mk/generic_leaf_target.mk
-Index: git/libs/libltpswapon/libswapon.c
-===================================================================
---- /dev/null
-+++ git/libs/libltpswapon/libswapon.c
-@@ -0,0 +1,90 @@
-+/*
-+ * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
-+ *
-+ * This program is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU General Public License as
-+ * published by the Free Software Foundation; either version 2 of
-+ * the License, or (at your option) any later version.
-+ *
-+ * This program is distributed in the hope that it would be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write the Free Software Foundation,
-+ * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-+ *
-+ * Author: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
-+ *
-+ */
-+
-+#include <errno.h>
-+#include "lapi/syscalls.h"
-+#include "test.h"
-+#include "libswapon.h"
-+
-+/*
-+ * Make a swap file
-+ */
-+int make_swapfile(void (cleanup)(void), const char *swapfile, int safe)
-+{
-+	if (!tst_fs_has_free(NULL, ".", sysconf(_SC_PAGESIZE) * 10,
-+	    TST_BYTES)) {
-+		tst_brkm(TBROK, cleanup,
-+			"Insufficient disk space to create swap file");
-+	}
-+
-+	/* create file */
-+	if (tst_fill_file(swapfile, 0,
-+			sysconf(_SC_PAGESIZE), 10) != 0) {
-+		tst_brkm(TBROK, cleanup, "Failed to create swapfile");
-+	}
-+
-+	/* make the file swapfile */
-+	const char *argv[2 + 1];
-+	argv[0] = "mkswap";
-+	argv[1] = swapfile;
-+	argv[2] = NULL;
-+
-+	return tst_cmd(cleanup, argv, "/dev/null", "/dev/null", safe);
-+}
-+
-+/*
-+ * Check swapon/swapoff support status of filesystems or files
-+ * we are testing on.
-+ */
-+void is_swap_supported(void (cleanup)(void), const char *filename)
-+{
-+	int fibmap = tst_fibmap(filename);
-+	long fs_type = tst_fs_type(cleanup, filename);
-+	const char *fstype = tst_fs_type_name(fs_type);
-+
-+	int ret = make_swapfile(NULL, filename, 1);
-+	if (ret != 0) {
-+		if (fibmap == 1) {
-+			tst_brkm(TCONF, cleanup,
-+				"mkswap on %s not supported", fstype);
-+		} else {
-+			tst_brkm(TFAIL, cleanup,
-+				"mkswap on %s failed", fstype);
-+		}
-+	}
-+
-+	TEST(ltp_syscall(__NR_swapon, filename, 0));
-+	if (TEST_RETURN == -1) {
-+		if (fibmap == 1 && errno == EINVAL) {
-+			tst_brkm(TCONF, cleanup,
-+				"Swapfile on %s not implemented", fstype);
-+		} else {
-+			tst_brkm(TFAIL | TERRNO, cleanup,
-+				 "swapon on %s failed", fstype);
-+		}
-+	}
-+
-+	TEST(ltp_syscall(__NR_swapoff, filename, 0));
-+	if (TEST_RETURN == -1) {
-+		tst_brkm(TFAIL | TERRNO, cleanup,
-+			"swapoff on %s failed", fstype);
-+	}
-+}
-Index: git/testcases/kernel/syscalls/swapoff/Makefile
-===================================================================
---- git.orig/testcases/kernel/syscalls/swapoff/Makefile
-+++ git/testcases/kernel/syscalls/swapoff/Makefile
-@@ -3,7 +3,11 @@
- 
- top_srcdir		?= ../../../..
- 
-+LTPLIBS = ltpswapon
-+ 
- include $(top_srcdir)/include/mk/testcases.mk
--include $(abs_srcdir)/./Makefile.inc
-+
-+LTPLDLIBS  = -lltpswapon
-+
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
--$(MAKE_TARGETS): %: ../swapon/libswapon.o
-+
-Index: git/testcases/kernel/syscalls/swapoff/Makefile.inc
-===================================================================
---- git.orig/testcases/kernel/syscalls/swapoff/Makefile.inc
-+++ /dev/null
-@@ -1,6 +0,0 @@
--LIBDIR			+= ../swapon/
--LIBSWAPON		:= $(LIBDIR)/libswapon.o
--$(LIBSWAPON):
--	$(MAKE) -C $(LIBDIR)
--CPPFLAGS		+= -I$(abs_srcdir)/$(LIBDIR)
--LDFLAGS			+= -L$(abs_builddir)/$(LIBDIR)
-Index: git/testcases/kernel/syscalls/swapon/Makefile
-===================================================================
---- git.orig/testcases/kernel/syscalls/swapon/Makefile
-+++ git/testcases/kernel/syscalls/swapon/Makefile
-@@ -8,10 +8,10 @@ endif
- 
- top_srcdir		?= ../../../..
- 
-+LTPLIBS = ltpswapon
-+
- include $(top_srcdir)/include/mk/testcases.mk
- 
--FILTER_OUT_MAKE_TARGETS         := libswapon
-+LTPLDLIBS  = -lltpswapon
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
--
--$(MAKE_TARGETS): %: libswapon.o
-Index: git/testcases/kernel/syscalls/swapon/libswapon.c
-===================================================================
---- git.orig/testcases/kernel/syscalls/swapon/libswapon.c
-+++ /dev/null
-@@ -1,90 +0,0 @@
--/*
-- * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
-- *
-- * This program is free software; you can redistribute it and/or
-- * modify it under the terms of the GNU General Public License as
-- * published by the Free Software Foundation; either version 2 of
-- * the License, or (at your option) any later version.
-- *
-- * This program is distributed in the hope that it would be useful,
-- * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- * GNU General Public License for more details.
-- *
-- * You should have received a copy of the GNU General Public License
-- * along with this program; if not, write the Free Software Foundation,
-- * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-- *
-- * Author: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
-- *
-- */
--
--#include <errno.h>
--#include "lapi/syscalls.h"
--#include "test.h"
--#include "libswapon.h"
--
--/*
-- * Make a swap file
-- */
--int make_swapfile(void (cleanup)(void), const char *swapfile, int safe)
--{
--	if (!tst_fs_has_free(NULL, ".", sysconf(_SC_PAGESIZE) * 10,
--	    TST_BYTES)) {
--		tst_brkm(TBROK, cleanup,
--			"Insufficient disk space to create swap file");
--	}
--
--	/* create file */
--	if (tst_fill_file(swapfile, 0,
--			sysconf(_SC_PAGESIZE), 10) != 0) {
--		tst_brkm(TBROK, cleanup, "Failed to create swapfile");
--	}
--
--	/* make the file swapfile */
--	const char *argv[2 + 1];
--	argv[0] = "mkswap";
--	argv[1] = swapfile;
--	argv[2] = NULL;
--
--	return tst_cmd(cleanup, argv, "/dev/null", "/dev/null", safe);
--}
--
--/*
-- * Check swapon/swapoff support status of filesystems or files
-- * we are testing on.
-- */
--void is_swap_supported(void (cleanup)(void), const char *filename)
--{
--	int fibmap = tst_fibmap(filename);
--	long fs_type = tst_fs_type(cleanup, filename);
--	const char *fstype = tst_fs_type_name(fs_type);
--
--	int ret = make_swapfile(NULL, filename, 1);
--	if (ret != 0) {
--		if (fibmap == 1) {
--			tst_brkm(TCONF, cleanup,
--				"mkswap on %s not supported", fstype);
--		} else {
--			tst_brkm(TFAIL, cleanup,
--				"mkswap on %s failed", fstype);
--		}
--	}
--
--	TEST(ltp_syscall(__NR_swapon, filename, 0));
--	if (TEST_RETURN == -1) {
--		if (fibmap == 1 && errno == EINVAL) {
--			tst_brkm(TCONF, cleanup,
--				"Swapfile on %s not implemented", fstype);
--		} else {
--			tst_brkm(TFAIL | TERRNO, cleanup,
--				 "swapon on %s failed", fstype);
--		}
--	}
--
--	TEST(ltp_syscall(__NR_swapoff, filename, 0));
--	if (TEST_RETURN == -1) {
--		tst_brkm(TFAIL | TERRNO, cleanup,
--			"swapoff on %s failed", fstype);
--	}
--}
-Index: git/testcases/kernel/syscalls/swapon/libswapon.h
-===================================================================
---- git.orig/testcases/kernel/syscalls/swapon/libswapon.h
-+++ /dev/null
-@@ -1,39 +0,0 @@
--/*
-- * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
-- *
-- * This program is free software; you can redistribute it and/or
-- * modify it under the terms of the GNU General Public License as
-- * published by the Free Software Foundation; either version 2 of
-- * the License, or (at your option) any later version.
-- *
-- * This program is distributed in the hope that it would be useful,
-- * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- * GNU General Public License for more details.
-- *
-- * You should have received a copy of the GNU General Public License
-- * along with this program; if not, write the Free Software Foundation,
-- * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-- *
-- * Author: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
-- *
-- */
--
--/*
-- * Contains common content for all swapon tests
-- */
--
--#ifndef __LIBSWAPON_H__
--#define __LIBSWAPON_H__
--
--/*
-- * Make a swap file
-- */
--int make_swapfile(void (cleanup)(void), const char *swapfile, int safe);
--
--/*
-- * Check swapon/swapoff support status of filesystems or files
-- * we are testing on.
-- */
--void is_swap_supported(void (cleanup)(void), const char *filename);
--#endif /* __LIBSWAPON_H__ */
-Index: git/testcases/kernel/syscalls/swapoff/swapoff01.c
-===================================================================
---- git.orig/testcases/kernel/syscalls/swapoff/swapoff01.c
-+++ git/testcases/kernel/syscalls/swapoff/swapoff01.c
-@@ -25,7 +25,7 @@
- #include <stdlib.h>
- #include "config.h"
- #include "lapi/syscalls.h"
--#include "../swapon/libswapon.h"
-+#include "libswapon.h"
- 
- static void setup(void);
- static void cleanup(void);
-Index: git/testcases/kernel/syscalls/swapoff/swapoff02.c
-===================================================================
---- git.orig/testcases/kernel/syscalls/swapoff/swapoff02.c
-+++ git/testcases/kernel/syscalls/swapoff/swapoff02.c
-@@ -33,7 +33,7 @@
- #include "test.h"
- #include "lapi/syscalls.h"
- #include "safe_macros.h"
--#include "../swapon/libswapon.h"
-+#include "libswapon.h"
- 
- static void setup(void);
- static void cleanup(void);
-Index: git/include/libswapon.h
-===================================================================
---- /dev/null
-+++ git/include/libswapon.h
-@@ -0,0 +1,39 @@
-+/*
-+ * Copyright (c) 2013 Oracle and/or its affiliates. All Rights Reserved.
-+ *
-+ * This program is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU General Public License as
-+ * published by the Free Software Foundation; either version 2 of
-+ * the License, or (at your option) any later version.
-+ *
-+ * This program is distributed in the hope that it would be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write the Free Software Foundation,
-+ * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-+ *
-+ * Author: Stanislav Kholmanskikh <stanislav.kholmanskikh@oracle.com>
-+ *
-+ */
-+
-+/*
-+ * Contains common content for all swapon tests
-+ */
-+
-+#ifndef __LIBSWAPON_H__
-+#define __LIBSWAPON_H__
-+
-+/*
-+ * Make a swap file
-+ */
-+int make_swapfile(void (cleanup)(void), const char *swapfile, int safe);
-+
-+/*
-+ * Check swapon/swapoff support status of filesystems or files
-+ * we are testing on.
-+ */
-+void is_swap_supported(void (cleanup)(void), const char *filename);
-+#endif /* __LIBSWAPON_H__ */
diff --git a/meta/recipes-extended/ltp/ltp_20210121.bb b/meta/recipes-extended/ltp/ltp_20210524.bb
similarity index 94%
rename from meta/recipes-extended/ltp/ltp_20210121.bb
rename to meta/recipes-extended/ltp/ltp_20210524.bb
index e1ffd0ddf4..bf6e564482 100644
--- a/meta/recipes-extended/ltp/ltp_20210121.bb
+++ b/meta/recipes-extended/ltp/ltp_20210524.bb
@@ -27,19 +27,14 @@ CFLAGS_append_x86-64 = " -fomit-frame-pointer"
 
 CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "4d005621edd109d119627eb9210b224a63bf22cb"
+SRCREV = "0fb171f2beddaf64bd27597577c206c0f892b3cd"
 
 # remove at next version upgrade or when output changes
 PR = "r4"
 HASHEQUIV_HASH_VERSION .= ".4"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
-           file://0007-Fix-test_proc_kill-hanging.patch \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           file://determinism.patch \
-           file://0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch \
-           file://0002-Makefile-Avoid-wildcard-determinism-issues.patch \
-           file://0003-syscalls-swapon-swapoff-Move-common-library-to-libs.patch \
            file://disable_hanging_tests.patch \
            "
 
-- 
2.31.1

