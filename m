Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 47A9F60720
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 09:52:46 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id 90so5298995lfs.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 02:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=barWhLFLrNYjP13l4LjVSvOnx+cJOUM/zQbMStX7Z3A=;
	b=PBOWFeENmfrH8fiHPAVjmYidX/IPu0smnk6V2QiUe1hV6YHO3+V7+1FfzsBBVzeC6D
	KR/DjEJk6999q9m5KD6TuAcVCk2vFS3jQ945p0e4lzkRwR9UbapL7MKU4hKwbhGwTiSQ
	wZcCTrEvMSPeJLSsL5IknY+kMLZE90p2F4WDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=barWhLFLrNYjP13l4LjVSvOnx+cJOUM/zQbMStX7Z3A=;
	b=KcHbulV+MEJKJ3oX6ujWpC1qkp3WIvDF8Mk/iN5N74yWn+P1pNq79kxvang5PH6e5f
	Ihrpl61v8Ss5dVX3Qd7GlrhIeGdoP51YM7dwEZkpfOEPaaELwdUUOVZpVO6fbhnbrWQZ
	qfvH+duYy1Csn0M2ZemtgqqzOtzK36sZnttTgmxljrVJjb+gT8FmrX/dbOATBMWqfY8H
	YEe6oV9S+zDr34N2gRTZcXYiG+8+sQVjiJk3Q1jM5D/dN1Fr2DzFtCaT0EXJSwiGUEfU
	gekxC0qU5hqyQBadf1sA2Z7AOxMpMIsfICpC5a9lOtk3O0F7LVTLxW4qeNvHWOGYdjcY
	DTwA==
X-Gm-Message-State: AMCzsaXRRjS96i81H0IoCDho+HzM0p1+qQ3VYi2CEqlJCUIHpzxmpVrw
	kVtUqN5P2jb/Y7JzGkqJVcu7z3okpyM=
X-Google-Smtp-Source: AOwi7QBXmZ8uLxyWmQ5hBIIEzzdu9rE6PQ80qDgvJpUHt00BIr5TFk4/xV/npFjBWW7En2kTt9hroA==
X-Received: by 10.46.5.205 with SMTP id 196mr887710ljf.186.1507801966399;
	Thu, 12 Oct 2017 02:52:46 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-101.elisa-laajakaista.fi.
	[91.156.68.101])
	by smtp.gmail.com with ESMTPSA id w88sm1201010lfd.1.2017.10.12.02.52.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Oct 2017 02:52:44 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Oct 2017 12:52:42 +0300
Message-Id: <20171012095242.4865-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH v2] ltp: update to new upstream release 20170929
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Oct 2017 09:52:46 -0000

* Update SRCREV to match 20170929 release
* Drop patches available in 20170929 release:
  - 0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
  - 0038-commands-gdb01-replace-stdin-with-dev-null.patch
* Add patches backported from upstream:
  - 0037-commands-nm-fix-typo-INSTALL_TARTGETS-INSTALL_TARGET.patch
  - 0038-fanotify-fix-build-failure-with-Werror-format-securi.patch
* Add additional runtime dependencies:
  - ld01, file01 and logrotate tests requires file command.
  - quotacheck is required by quota_remount_test01 test.
  - LTP checks for a compliant 'tar' but finds that the version from
    busybox lacks the '-d' option.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
Changes in v2:
 * Add patches backported from upstream:
   - 0037-commands-nm-fix-typo-INSTALL_TARTGETS-INSTALL_TARGET.patch
   - 0038-fanotify-fix-build-failure-with-Werror-format-securi.patch
 * Add additional runtime dependencies:
   - ld01, file01 and logrotate tests requires file command.
   - quotacheck is required by quota_remount_test01 test.
   - LTP checks for a compliant 'tar' but finds that the version from
     busybox lacks the '-d' option.

 ...-fix-typo-INSTALL_TARTGETS-INSTALL_TARGET.patch |  35 +++++++
 ...E_SIZE-redefinition-and-O_CREAT-undeclear.patch | 113 ---------------------
 ...ommands-gdb01-replace-stdin-with-dev-null.patch |  34 -------
 ...x-build-failure-with-Werror-format-securi.patch |  38 +++++++
 .../ltp/{ltp_20170516.bb => ltp_20170929.bb}       |   9 +-
 5 files changed, 79 insertions(+), 150 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0037-commands-nm-fix-typo-INSTALL_TARTGETS-INSTALL_TARGET.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0038-fanotify-fix-build-failure-with-Werror-format-securi.patch
 rename meta/recipes-extended/ltp/{ltp_20170516.bb => ltp_20170929.bb} (96%)

diff --git a/meta/recipes-extended/ltp/ltp/0037-commands-nm-fix-typo-INSTALL_TARTGETS-INSTALL_TARGET.patch b/meta/recipes-extended/ltp/ltp/0037-commands-nm-fix-typo-INSTALL_TARTGETS-INSTALL_TARGET.patch
new file mode 100644
index 0000000000..f060e2960c
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0037-commands-nm-fix-typo-INSTALL_TARTGETS-INSTALL_TARGET.patch
@@ -0,0 +1,35 @@
+From b72c04385945c56a9b664e62569d0387ceaa3a5a Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fathi.boudra@linaro.org>
+Date: Thu, 12 Oct 2017 10:40:18 +0300
+Subject: [PATCH 1/1] commands: nm: fix typo INSTALL_TARTGETS ->
+ INSTALL_TARGETS
+
+Fix the typo preventing to install the files.
+
+cp: cannot stat '/opt/ltp/testcases/data/nm01/lib.a': No such file or
+directory
+1 TBROK: cp /opt/ltp/testcases/data/nm01/lib.a . failed
+
+Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+
+Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/6570df2d8cc894da6309acdca84dddc65a87851f]
+---
+ testcases/commands/nm/datafiles/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/commands/nm/datafiles/Makefile b/testcases/commands/nm/datafiles/Makefile
+index 3514665a9..371490e1c 100644
+--- a/testcases/commands/nm/datafiles/Makefile
++++ b/testcases/commands/nm/datafiles/Makefile
+@@ -15,7 +15,7 @@ top_srcdir		?= ../../../..
+ 
+ include $(top_srcdir)/include/mk/env_pre.mk
+ INSTALL_DIR		:= testcases/data/nm01
+-INSTALL_TARTGETS	:= f1 f2 f3 lib.a
++INSTALL_TARGETS		:= f1 f2 f3 lib.a
+ MAKE_TARGETS		+= f1 f2 f3 lib.a
+ 
+ lib.a: f1.o f2.o f3.o
+-- 
+2.14.2
+
diff --git a/meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch b/meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
deleted file mode 100644
index c8738ae0d4..0000000000
--- a/meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From a9d5595d2fa2ab252f1cabf63f4b65c3efbafeb9 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Thu, 10 Aug 2017 15:27:03 +0800
-Subject: [PATCH] ltp: fix PAGE_SIZE redefinition and O_CREAT undeclear when
- build with musl
-
-error 1:
-
-|stack_clash.c:50:22: error: expected identifier or '(' before numeric constant
-| static unsigned long PAGE_SIZE;
-
-This is because the musl libc already contain PAGE_SIZE definition in limits.c,
-we can check it here:
-
-    https://git.musl-libc.org/cgit/musl/tree/include/limits.h#n43
-
-error 2:
-
-|ck01.c:157:22: error: 'O_CREAT' undeclared (first use in this function); did you mean 'S_IREAD'?
-|   fd = open(filename, O_CREAT | O_TRUNC | O_RDWR, 0644);
-|                       ^~~~~~~
-|                       S_IREAD
-
-This is because the musl libc put those in fcntl.h, so we should include that
-file.
-
-Upstream-Status: Submitted [ https://github.com/linux-test-project/ltp/pull/194 ]
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- testcases/cve/stack_clash.c               | 12 ++++++------
- testcases/kernel/syscalls/flock/flock01.c |  1 +
- testcases/kernel/syscalls/flock/flock02.c |  1 +
- 3 files changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/testcases/cve/stack_clash.c b/testcases/cve/stack_clash.c
-index 2ef1a82..7c45991 100644
---- a/testcases/cve/stack_clash.c
-+++ b/testcases/cve/stack_clash.c
-@@ -47,7 +47,7 @@
- #include "tst_test.h"
- #include "tst_safe_stdio.h"
- 
--static unsigned long PAGE_SIZE;
-+static unsigned long PAGE_SIZE_tst;
- static unsigned long PAGE_MASK;
- static unsigned long GAP_PAGES = 256;
- static unsigned long THRESHOLD;
-@@ -66,7 +66,7 @@ void exhaust_stack_into_sigsegv(void)
- 	exhaust_stack_into_sigsegv();
- }
- 
--#define MAPPED_LEN PAGE_SIZE
-+#define MAPPED_LEN PAGE_SIZE_tst
- static unsigned long mapped_addr;
- 
- void segv_handler(int sig, siginfo_t *info, void *data LTP_ATTRIBUTE_UNUSED)
-@@ -150,7 +150,7 @@ void do_child(void)
- 	stack_t signal_stack;
- 	struct sigaction segv_sig = {.sa_sigaction = segv_handler, .sa_flags = SA_ONSTACK|SA_SIGINFO};
- 	void *map;
--	unsigned long gap = GAP_PAGES * PAGE_SIZE;
-+	unsigned long gap = GAP_PAGES * PAGE_SIZE_tst;
- 	struct rlimit rlimit;
- 
- 	rlimit.rlim_cur = rlimit.rlim_max = RLIM_INFINITY;
-@@ -200,8 +200,8 @@ void setup(void)
- {
- 	char buf[4096], *p;
- 
--	PAGE_SIZE = sysconf(_SC_PAGESIZE);
--	PAGE_MASK = ~(PAGE_SIZE - 1);
-+	PAGE_SIZE_tst = sysconf(_SC_PAGESIZE);
-+	PAGE_MASK = ~(PAGE_SIZE_tst - 1);
- 
- 	buf[4095] = '\0';
- 	SAFE_FILE_SCANF("/proc/cmdline", "%4095[^\n]", buf);
-@@ -214,7 +214,7 @@ void setup(void)
- 		tst_res(TINFO, "stack_guard_gap = %ld", GAP_PAGES);
- 	}
- 
--	THRESHOLD = (GAP_PAGES - 1) * PAGE_SIZE;
-+	THRESHOLD = (GAP_PAGES - 1) * PAGE_SIZE_tst;
- 
- 	{
- 		volatile int *a = alloca(128);
-diff --git a/testcases/kernel/syscalls/flock/flock01.c b/testcases/kernel/syscalls/flock/flock01.c
-index 3e17be4..06d89e3 100644
---- a/testcases/kernel/syscalls/flock/flock01.c
-+++ b/testcases/kernel/syscalls/flock/flock01.c
-@@ -69,6 +69,7 @@
- #include <stdio.h>
- #include <sys/wait.h>
- #include <sys/file.h>
-+#include <fcntl.h>
- #include "test.h"
- 
- void setup(void);
-diff --git a/testcases/kernel/syscalls/flock/flock02.c b/testcases/kernel/syscalls/flock/flock02.c
-index 414df68..9ddf729 100644
---- a/testcases/kernel/syscalls/flock/flock02.c
-+++ b/testcases/kernel/syscalls/flock/flock02.c
-@@ -75,6 +75,7 @@
- #include <sys/types.h>
- #include <sys/file.h>
- #include <sys/wait.h>
-+#include <fcntl.h>
- #include <errno.h>
- #include <stdio.h>
- #include "test.h"
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch b/meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch
deleted file mode 100644
index f7c0a4bf17..0000000000
--- a/meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2f6ab8f694b26b7f2566624f6d1f23788d6ab8a0 Mon Sep 17 00:00:00 2001
-From: Jan Stancek <jstancek@redhat.com>
-Date: Mon, 11 Sep 2017 12:57:58 +0200
-Subject: [PATCH] commands/gdb01: replace stdin with /dev/null
-
-If this testcase runs as background process, gdb can receive
-SIGTTOU and then testcase gets stuck.
-
-Signed-off-by: Jan Stancek <jstancek@redhat.com>
-
-Upstream-Status: Backport
-[https://github.com/linux-test-project/ltp/commit/2f6ab8f694b26b7f2566624f6d1f23788d6ab8a0]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- testcases/commands/gdb/gdb01.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/commands/gdb/gdb01.sh b/testcases/commands/gdb/gdb01.sh
-index 07ae36f..e3a5b51 100755
---- a/testcases/commands/gdb/gdb01.sh
-+++ b/testcases/commands/gdb/gdb01.sh
-@@ -29,7 +29,7 @@ TST_NEEDS_CMDS="gdb /bin/cat"
- 
- simple_test()
- {
--	gdb /bin/cat -ex "run /etc/passwd" -ex quit
-+	gdb /bin/cat -ex "run /etc/passwd" -ex quit < /dev/null
- 	RC=$?
- 	if [ $RC -eq 0 ] ; then
- 		tst_res TPASS "gdb attached to process and completed run"
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0038-fanotify-fix-build-failure-with-Werror-format-securi.patch b/meta/recipes-extended/ltp/ltp/0038-fanotify-fix-build-failure-with-Werror-format-securi.patch
new file mode 100644
index 0000000000..0a8ad287f7
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0038-fanotify-fix-build-failure-with-Werror-format-securi.patch
@@ -0,0 +1,38 @@
+From c367c135ef33cd6487f2da6bfddb12badc87ffb1 Mon Sep 17 00:00:00 2001
+From: Fathi Boudra <fathi.boudra@linaro.org>
+Date: Thu, 12 Oct 2017 11:26:41 +0300
+Subject: [PATCH 1/1] fanotify: fix build failure with -Werror=format-security
+
+fanotify08.c:56:3: error: format not a string literal and no format arguments [-Werror=format-security]
+   tst_res(TPASS, msg);
+   ^~~~~~~
+fanotify08.c:58:3: error: format not a string literal and no format arguments [-Werror=format-security]
+   tst_res(TFAIL, msg);
+   ^~~~~~~
+
+Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+
+Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/16bd1d479726fb6ee21ebe5b58fbf28c85c938a3]
+---
+ testcases/kernel/syscalls/fanotify/fanotify08.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/fanotify/fanotify08.c b/testcases/kernel/syscalls/fanotify/fanotify08.c
+index dc916ec13..8d3d40e46 100644
+--- a/testcases/kernel/syscalls/fanotify/fanotify08.c
++++ b/testcases/kernel/syscalls/fanotify/fanotify08.c
+@@ -53,9 +53,9 @@ static void test_init_bit(unsigned int fan_bit,
+ 	ret = SAFE_FCNTL(fd_notify, F_GETFD);
+ 
+ 	if ((ret & FD_CLOEXEC) == fd_bit) {
+-		tst_res(TPASS, msg);
++		tst_res(TPASS, "%s", msg);
+ 	} else {
+-		tst_res(TFAIL, msg);
++		tst_res(TFAIL, "%s", msg);
+ 	}
+ 
+ 	SAFE_CLOSE(fd_notify);
+-- 
+2.14.2
+
diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb b/meta/recipes-extended/ltp/ltp_20170929.bb
similarity index 96%
rename from meta/recipes-extended/ltp/ltp_20170516.bb
rename to meta/recipes-extended/ltp/ltp_20170929.bb
index 653cbfd4ed..7a0a83f6a8 100644
--- a/meta/recipes-extended/ltp/ltp_20170516.bb
+++ b/meta/recipes-extended/ltp/ltp_20170929.bb
@@ -21,7 +21,7 @@ DEPENDS_append_libc-musl = " fts "
 EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
 CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "18916a2e6d8c997b7b29dcfa9550d5a15b22ed22"
+SRCREV = "e671f2a13c695bbd87f7dfec2954ca7e3c43f377"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-add-_GNU_SOURCE-to-pec_listener.c.patch \
@@ -48,8 +48,8 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0034-periodic_output.patch \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
-           file://0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch \
-           file://0038-commands-gdb01-replace-stdin-with-dev-null.patch \
+           file://0037-commands-nm-fix-typo-INSTALL_TARTGETS-INSTALL_TARGET.patch \
+           file://0038-fanotify-fix-build-failure-with-Werror-format-securi.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -93,6 +93,7 @@ RDEPENDS_${PN} = "\
     curl \
     e2fsprogs-mke2fs \
     expect \
+    file \
     gawk \
     gzip \
     iproute2 \
@@ -101,6 +102,8 @@ RDEPENDS_${PN} = "\
     logrotate \
     perl \
     python-core \
+    quota \
+    tar \
     unzip \
     util-linux \
     which \
-- 
2.14.2


