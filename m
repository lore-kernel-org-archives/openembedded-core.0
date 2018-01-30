Return-Path: <anders.roxell@linaro.org>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id BB42C78834
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 13:12:52 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id a204so15280476lfa.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 05:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=aVMCmBLlZsV4/7M6z3dxbd6a6AejpYqUKgdzoCLFsbI=;
	b=LmHk8Iw03d9oPJAVpuH7+73iF2ZMkac7gpNdKuC6YGZq04i+8aaXoQyicKJFag9a6w
	e5Ly0OauoOKfN08glrxC6alR+rkFSOr7CDBnDPUJ+z2twLiZ4L4y6bXzLQtGJceDUFjk
	PmtkEfn49QDFEzoyqCHo23+61MHekwIvED4Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aVMCmBLlZsV4/7M6z3dxbd6a6AejpYqUKgdzoCLFsbI=;
	b=FNzayb/eMfh/Dch9bDe2QoWwqVaZ83QNyljPicuWZC/slGYmy46lybUTo12cWmsZo8
	qJLkhaCehGJGMUEPH4WZ+m7oTDsvWGGpQx6UDHYMapsXm6AzX5R2YyV/wtCLf+0HcvOg
	yalWf79tuQG7UrUw0JHa4muQoWE2F0cPB/XL1ZR5NMBd9P4Ke37zCB1MxjGGvwajFztj
	oM9tKlm6+LpFzQk9da7KhtQ8YqteZTwcDUUYJRP14wWQi3XCNOxPh7EuORgPlc+sVS7G
	p9Er9D7Ke8ZJC/7QIOiQ2RG8RYZuhW5N8WZIRXu8Nnwx4viOXCBOUqvs2zTZwWqESp2e
	gFJA==
X-Gm-Message-State: AKwxytcjilL4FSgLFgaiS5rNLGzE7t/LUp3XtP7/nsyUoRPXyjb+quce
	LF4qnkydSbVQAhh1/4BIlzki+ynCXjo=
X-Google-Smtp-Source: AH8x2247KpiaifXWL9Lg5l5H8coBT1cg+vidyMJh7+vwnViKuTbUxo/lj9n/XJ/XUsTFqMQOAxfiBg==
X-Received: by 10.25.121.21 with SMTP id u21mr13080937lfc.79.1517317972736;
	Tue, 30 Jan 2018 05:12:52 -0800 (PST)
Received: from localhost (c-153870d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.112.56.21]) by smtp.gmail.com with ESMTPSA id
	p10sm2234663lfd.78.2018.01.30.05.12.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jan 2018 05:12:51 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jan 2018 14:12:42 +0100
Message-Id: <1517317962-907-1-git-send-email-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] ltp: remove patches that already have fixes upstream
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
X-List-Received-Date: Tue, 30 Jan 2018 13:12:53 -0000

The following patches has already fixes for the issues they are solving
in upstream.
- 0001-add-_GNU_SOURCE-to-pec_listener.c.patch
- 0011-Rename-sigset-variable-to-sigset1.patch
- 0025-mc_gethost-include-sys-types.h.patch
- 0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
- 0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch

Suggested-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 .../0001-add-_GNU_SOURCE-to-pec_listener.c.patch   |  39 ------
 .../0011-Rename-sigset-variable-to-sigset1.patch   | 139 ---------------------
 .../ltp/0025-mc_gethost-include-sys-types.h.patch  |  30 -----
 ...sconf01-Use-_SC_2_C_VERSION-conditionally.patch |  32 -----
 ...1-Cover-GNU-specific-code-under-__USE_GNU.patch |  41 ------
 meta/recipes-extended/ltp/ltp_20180118.bb          |   5 -
 6 files changed, 286 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-add-_GNU_SOURCE-to-pec_listener.c.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0025-mc_gethost-include-sys-types.h.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-add-_GNU_SOURCE-to-pec_listener.c.patch b/meta/recipes-extended/ltp/ltp/0001-add-_GNU_SOURCE-to-pec_listener.c.patch
deleted file mode 100644
index 7ec66f8..0000000
--- a/meta/recipes-extended/ltp/ltp/0001-add-_GNU_SOURCE-to-pec_listener.c.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From ae10245c15a617bd57337981bb42eb36629f9b59 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 8 Feb 2017 15:53:31 +0800
-Subject: [PATCH 01/26] add _GNU_SOURCE to pec_listener.c
-
-In previous patch 0007-replace-SIGCLD-with-SIGCHLD.patch made by Khem Raj
-contains two aspects:
-
-	1. replace SIGCLD with SIGCHLD
-	2. add _GNU_SOURCE to pec_listener.c
-
-The replace SIGCLD with SIGCHLD have been integrated upstream, so make a
-another patch to add _GNU_SOURCE to pec_listener.c comply with Khem Raj's
-previous patch.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
-Upstream-Status: Pending
-
-%% original patch: 0001-add-_GNU_SOURCE-to-pec_listener.c.patch
----
- testcases/kernel/connectors/pec/pec_listener.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/testcases/kernel/connectors/pec/pec_listener.c b/testcases/kernel/connectors/pec/pec_listener.c
-index d11e4dc..b8b5e0d 100644
---- a/testcases/kernel/connectors/pec/pec_listener.c
-+++ b/testcases/kernel/connectors/pec/pec_listener.c
-@@ -20,6 +20,7 @@
- /*                                                                            */
- /******************************************************************************/
- 
-+#define _GNU_SOURCE
- #include <sys/socket.h>
- #include <sys/poll.h>
- #include <sys/types.h>
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch b/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
deleted file mode 100644
index 25f6ba7..0000000
--- a/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-From dc1905b6d972f9176b40da270c83d8fb4d1751b5 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 8 Feb 2017 16:12:34 +0800
-Subject: [PATCH 2/5] Rename sigset variable to sigset1
-
-sigset API from signal.h is shadowed by this name conflict
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
-
-Upstream-Status: Pending
----
- testcases/kernel/mem/shmt/shmt04.c                    | 10 +++++-----
- testcases/kernel/mem/shmt/shmt06.c                    | 10 +++++-----
- testcases/kernel/syscalls/sigprocmask/sigprocmask01.c | 10 +++++-----
- 3 files changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/testcases/kernel/mem/shmt/shmt04.c b/testcases/kernel/mem/shmt/shmt04.c
-index b2682da..3f35fad 100644
---- a/testcases/kernel/mem/shmt/shmt04.c
-+++ b/testcases/kernel/mem/shmt/shmt04.c
-@@ -56,7 +56,7 @@ int TST_TOTAL = 2;		/* Total number of test cases. */
- /**************/
- 
- key_t key;
--sigset_t set;
-+sigset_t set1;
- 
- #define  SIZE  16*1024
- 
-@@ -71,9 +71,9 @@ int main(void)
- 
- 	key = (key_t) getpid();
- 
--	sigemptyset(&set);
--	sigaddset(&set, SIGUSR1);
--	sigprocmask(SIG_BLOCK, &set, NULL);
-+	sigemptyset(&set1);
-+	sigaddset(&set1, SIGUSR1);
-+	sigprocmask(SIG_BLOCK, &set1, NULL);
- 
- 	pid = fork();
- 	switch (pid) {
-@@ -148,7 +148,7 @@ int child(void)
- 	char *cp;
- 	int sig;
- 
--	sigwait(&set, &sig);
-+	sigwait(&set1, &sig);
- 	chld_pid = getpid();
- /*--------------------------------------------------------*/
- 
-diff --git a/testcases/kernel/mem/shmt/shmt06.c b/testcases/kernel/mem/shmt/shmt06.c
-index dd69de7..56fb1da 100644
---- a/testcases/kernel/mem/shmt/shmt06.c
-+++ b/testcases/kernel/mem/shmt/shmt06.c
-@@ -57,7 +57,7 @@ int TST_TOTAL = 2;		/* Total number of test cases. */
- /**************/
- 
- key_t key;
--sigset_t set;
-+sigset_t set1;
- 
- int child();
- static int rm_shm(int);
-@@ -70,9 +70,9 @@ int main(void)
- 
- 	key = (key_t) getpid();
- 
--	sigemptyset(&set);
--	sigaddset(&set, SIGUSR1);
--	sigprocmask(SIG_BLOCK, &set, NULL);
-+	sigemptyset(&set1);
-+	sigaddset(&set1, SIGUSR1);
-+	sigprocmask(SIG_BLOCK, &set1, NULL);
- 
- 	pid = fork();
- 	switch (pid) {
-@@ -147,7 +147,7 @@ int child(void)
- 	char *cp;
- 	int sig;
- 
--	sigwait(&set, &sig);
-+	sigwait(&set1, &sig);
- 	chld_pid = getpid();
- 
- 	if ((shmid = shmget(key, SIZE, 0)) < 0) {
-diff --git a/testcases/kernel/syscalls/sigprocmask/sigprocmask01.c b/testcases/kernel/syscalls/sigprocmask/sigprocmask01.c
-index 232d25a..06d902f 100644
---- a/testcases/kernel/syscalls/sigprocmask/sigprocmask01.c
-+++ b/testcases/kernel/syscalls/sigprocmask/sigprocmask01.c
-@@ -91,7 +91,7 @@ int TST_TOTAL = 1;
- int sig_catch = 0;		/* variable to blocked/unblocked signals */
- 
- struct sigaction sa_new;	/* struct to hold signal info */
--sigset_t set;		/* signal set to hold signal lists */
-+sigset_t set1;		/* signal set to hold signal lists */
- sigset_t sigset2;
- 
- int main(int ac, char **av)
-@@ -112,7 +112,7 @@ int main(int ac, char **av)
- 		 * so that, signal will not be delivered to
- 		 * the test process.
- 		 */
--		TEST(sigprocmask(SIG_BLOCK, &set, 0));
-+		TEST(sigprocmask(SIG_BLOCK, &set1, 0));
- 
- 		/* Get the process id of test process */
- 		my_pid = getpid();
-@@ -165,7 +165,7 @@ int main(int ac, char **av)
- 				 */
- 				errno = 0;
- 				if (sigprocmask(SIG_UNBLOCK,
--						&set, 0) == -1) {
-+						&set1, 0) == -1) {
- 					tst_brkm(TFAIL, cleanup,
- 						 "sigprocmask() failed "
- 						 "to unblock signal, "
-@@ -212,7 +212,7 @@ void setup(void)
- 	 * Initialise the signal sets with the list that
- 	 * excludes/includes  all system-defined signals.
- 	 */
--	if (sigemptyset(&set) == -1) {
-+	if (sigemptyset(&set1) == -1) {
- 		tst_brkm(TFAIL, cleanup,
- 			 "sigemptyset() failed, errno=%d : %s",
- 			 errno, strerror(errno));
-@@ -235,7 +235,7 @@ void setup(void)
- 	 * Add specified signal (SIGINT) to the signal set
- 	 * which excludes system-defined signals.
- 	 */
--	if (sigaddset(&set, SIGINT) == -1) {
-+	if (sigaddset(&set1, SIGINT) == -1) {
- 		tst_brkm(TFAIL, cleanup,
- 			 "sigaddset() failed, errno=%d : %s",
- 			 errno, strerror(errno));
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0025-mc_gethost-include-sys-types.h.patch b/meta/recipes-extended/ltp/ltp/0025-mc_gethost-include-sys-types.h.patch
deleted file mode 100644
index afcba63..0000000
--- a/meta/recipes-extended/ltp/ltp/0025-mc_gethost-include-sys-types.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 9d14edfc12eefac900dd54729a88b3ccf91c1c43 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 07:18:15 +0000
-Subject: [PATCH 25/32] mc_gethost: include sys/types.h
-
-Fix build on musl
-error: unknown type name 'u_char'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- testcases/network/multicast/mc_gethost/mc_gethost.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/testcases/network/multicast/mc_gethost/mc_gethost.c b/testcases/network/multicast/mc_gethost/mc_gethost.c
-index 5b9a790..c799e2a 100644
---- a/testcases/network/multicast/mc_gethost/mc_gethost.c
-+++ b/testcases/network/multicast/mc_gethost/mc_gethost.c
-@@ -6,6 +6,7 @@
- 
- #include <sys/param.h>
- #include <sys/socket.h>
-+#include <sys/types.h>
- #include <netinet/in.h>
- #include <arpa/inet.h>
- #include <arpa/nameser.h>
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch b/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
deleted file mode 100644
index adf6f27..0000000
--- a/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1471012164ba8f26046d4b1ce5531a0d92805ef5 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 8 Feb 2017 16:21:16 +0800
-Subject: [PATCH 4/5] sysconf01: Use _SC_2_C_VERSION conditionally
-
-_SC_2_C_VERSION is not available on musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
-
-Upstream-Status: Pending
----
- testcases/kernel/syscalls/sysconf/sysconf01.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/testcases/kernel/syscalls/sysconf/sysconf01.c b/testcases/kernel/syscalls/sysconf/sysconf01.c
-index 583deef..de93695 100644
---- a/testcases/kernel/syscalls/sysconf/sysconf01.c
-+++ b/testcases/kernel/syscalls/sysconf/sysconf01.c
-@@ -103,7 +103,9 @@ int main(void)
- 	test_sysconf(_SC_2_C_BIND);
- 	test_sysconf(_SC_2_C_DEV);
- #ifdef _SC_2_C_VERSION
-+#ifdef __GLIBC__
- 	test_sysconf(_SC_2_C_VERSION);
-+#endif
- #else
- 	tst_resm(TCONF, "_SC_2_C_VERSION not defined");
- #endif
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch b/meta/recipes-extended/ltp/ltp/0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch
deleted file mode 100644
index 868e1cf..0000000
--- a/meta/recipes-extended/ltp/ltp/0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 5e3dea669e5b0b769f322d54a3bb9f320b5327da Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 22 Mar 2016 15:47:14 +0000
-Subject: [PATCH 26/26] shmat1: Cover GNU specific code under __USE_GNU
-
-on x86, we use uc_mcontext element from sigcontext
-which is marked gnu-specific in glibc, this patch
-adds this condition around the code
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- testcases/kernel/mem/mtest06/shmat1.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/kernel/mem/mtest06/shmat1.c b/testcases/kernel/mem/mtest06/shmat1.c
-index 0d6d7a4..bee69f6 100644
---- a/testcases/kernel/mem/mtest06/shmat1.c
-+++ b/testcases/kernel/mem/mtest06/shmat1.c
-@@ -111,7 +111,7 @@ int done_shmat = 0;		/* disallow read and writes before shmat      */
- static void sig_handler(int signal,	/* signal number, set to handle SIGALRM       */
- 			int code, struct ucontext *ut)
- {				/* contains pointer to sigcontext structure   */
--#ifdef __i386__
-+#if defined(__i386__) && defined(__USE_GNU)
- 	unsigned long except;	/* exception type.                            */
- 	int ret = 0;		/* exit code from signal handler.             */
- 	struct sigcontext *scp =	/* pointer to sigcontext structure            */
-@@ -122,7 +122,7 @@ static void sig_handler(int signal,	/* signal number, set to handle SIGALRM
- 		fprintf(stdout, "Test ended, success\n");
- 		exit(0);
- 	}
--#ifdef __i386__
-+#if defined(__i386__) && defined(__USE_GNU)
- 	else {
- 		except = scp->trapno;
- 		fprintf(stderr, "signal caught - [%d] ", signal);
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/ltp/ltp_20180118.bb b/meta/recipes-extended/ltp/ltp_20180118.bb
index a4a2724..369b98d 100644
--- a/meta/recipes-extended/ltp/ltp_20180118.bb
+++ b/meta/recipes-extended/ltp/ltp_20180118.bb
@@ -24,7 +24,6 @@ CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
 SRCREV = "731cd34e682d297b207668be8b1d15320a9ac1b1"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
-           file://0001-add-_GNU_SOURCE-to-pec_listener.c.patch \
            file://0002-Add-knob-to-control-whether-numa-support-should-be-c.patch \
            file://0003-Add-knob-to-control-tirpc-support.patch \
            file://0004-build-Add-option-to-select-libc-implementation.patch \
@@ -33,17 +32,13 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch \
            file://0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch \
            file://0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch \
-           file://0011-Rename-sigset-variable-to-sigset1.patch \
            file://0018-guard-mallocopt-with-__GLIBC__.patch \
            file://0020-getdents-define-getdents-getdents64-only-for-glibc.patch \
            file://0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch \
            file://0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch \
            file://0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch \
-           file://0025-mc_gethost-include-sys-types.h.patch \
            file://0026-crash01-Define-_GNU_SOURCE.patch \
-           file://0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch \
            file://0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch \
-           file://0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch \
            file://0034-periodic_output.patch \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
-- 
2.7.4


