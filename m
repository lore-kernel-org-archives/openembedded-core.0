Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id B3CB260557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 11:58:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13315442"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Nov 2016 19:58:25 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id E956047AC8B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 19:58:22 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 25 Nov 2016 19:58:31 +0800
From: huangqy <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2016 11:58:00 -0800
Message-ID: <1480103880-1772-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: E956047AC8B4.A9202
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Subject: [PATCH] ltp: 20160126 -> 20160920
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
X-List-Received-Date: Fri, 25 Nov 2016 11:58:31 -0000
Content-Type: text/plain

From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

1)Upgrade ltp from 20160126 to 20160920. 2)Delete some
 patches, since they are integrated upstream.    
 0001-ltp-Don-t-link-against-libfl.patch    
 0006-sendfile-Use-off64_t-instead-of-__off64_t.patch    
 0007-replace-SIGCLD-with-SIGCHLD.patch    
 0009-Guard-error.h-with-__GLIBC__.patch    
 0012-fsstress.c-Replace-__int64_t-with-int64_t.patch    
 0013-include-fcntl.h-for-getting-O_-definitions.patch    
 0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch    
 0015-mincore01-Rename-PAGESIZE-to-pagesize.patch    
 0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch    
 0017-replace-sigval_t-with-union-sigval.patch    
 0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch    
 0022-include-sys-types.h.patch    
 0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch    
 0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch    
 0029-trace_shed-Fix-build-with-musl.patch    
 0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch    
 0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch    
 0032-regen.sh-Include-asm-unistd.h-explicitly.patch    
 0035-fix-test_proc_kill-hang.patch 3)Modify one patch, since the data has
 been changed.     0011-Rename-sigset-variable-to-sigset1.patch 4)Add some new
 patches.     0001-Define-__SIGRTMIN-and-__SIGRTMAX-on-musl.patch    
 0002-initialize-recursive-mutex-in-a-portable-way.patch    
 0003-lapi-Use-sig_t-instead-of-sighandler_t.patch    
 0004-rt_sigaction-rt_sigprocmark-Replace-SA_NOMASK-with-S.patch    
 0005-Fix-test_proc_kill-hanging.patch    
 0006-Remove-unused-__BEGIN_DECLS-and-__END_DECLS.patch

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../ltp/0001-ltp-Don-t-link-against-libfl.patch    |  30 --
 ...sendfile-Use-off64_t-instead-of-__off64_t.patch |  31 --
 .../ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch | 394 ---------------------
 .../ltp/0009-Guard-error.h-with-__GLIBC__.patch    | 270 --------------
 .../0011-Rename-sigset-variable-to-sigset1.patch   |  60 ++--
 ...fsstress.c-Replace-__int64_t-with-int64_t.patch | 351 ------------------
 ...nclude-fcntl.h-for-getting-O_-definitions.patch |  67 ----
 ...ing-Include-sys-types.h-for-pid_t-definit.patch |  56 ---
 ...015-mincore01-Rename-PAGESIZE-to-pagesize.patch |  64 ----
 ...Change-header-from-ustat.h-to-sys-ustat.h.patch |  45 ---
 .../0017-replace-sigval_t-with-union-sigval.patch  |  88 -----
 ...lace-canonicalize_file_name-with-realpath.patch |  32 --
 .../ltp/ltp/0022-include-sys-types.h.patch         |  29 --
 ...sconf01-Use-_SC_2_C_VERSION-conditionally.patch |  29 --
 ...n.h-Use-sighandler_t-instead-of-__sighand.patch |  43 ---
 .../ltp/0029-trace_shed-Fix-build-with-musl.patch  |  32 --
 ...READ_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch |  33 --
 ...age-size-offset-as-per-page-size-alignmen.patch |  33 --
 ...-regen.sh-Include-asm-unistd.h-explicitly.patch |  30 --
 .../ltp/ltp/0035-fix-test_proc_kill-hang.patch     |  23 --
 meta/recipes-extended/ltp/ltp_20160126.bb          | 118 ------
 21 files changed, 30 insertions(+), 1828 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-ltp-Don-t-link-against-libfl.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0009-Guard-error.h-with-__GLIBC__.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-getting-O_-definitions.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-PAGESIZE-to-pagesize.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-with-union-sigval.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0022-include-sys-types.h.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0029-trace_shed-Fix-build-with-musl.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-unistd.h-explicitly.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp_20160126.bb

diff --git a/meta/recipes-extended/ltp/ltp/0001-ltp-Don-t-link-against-libfl.patch b/meta/recipes-extended/ltp/ltp/0001-ltp-Don-t-link-against-libfl.patch
deleted file mode 100644
index 585b7cb..0000000
--- a/meta/recipes-extended/ltp/ltp/0001-ltp-Don-t-link-against-libfl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 14985fccf7428eaa0b45decc22bfd20fd780f621 Mon Sep 17 00:00:00 2001
-From: Chong Lu <Chong.Lu@windriver.com>
-Date: Tue, 11 Mar 2014 14:47:22 +0800
-Subject: [PATCH 01/32] ltp: Don't link against libfl
-
-We have already defined yywrap function in scan.l file. After this, we no longer need to
-link against libfl and so no longer get errors about undefined references to yylex.
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pan/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pan/Makefile b/pan/Makefile
-index 4cc6466..a4b575b 100644
---- a/pan/Makefile
-+++ b/pan/Makefile
-@@ -31,7 +31,7 @@ CPPFLAGS		+= -Wno-error
- 
- CPPFLAGS		+= -I$(abs_srcdir)
- 
--LDLIBS			+= -lm $(LEXLIB)
-+LDLIBS			+= -lm
- 
- LFLAGS			+= -l
- 
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-instead-of-__off64_t.patch b/meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
deleted file mode 100644
index 56a48ab..0000000
--- a/meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From fb8b895385a641d74f2186fe5f20a872209692ed Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 18:24:20 +0000
-Subject: [PATCH 06/32] sendfile: Use off64_t instead of __off64_t
-
-__off64_t is specific to glibc where as off64_t is widely available
-Add _GNU_SOURCE for off64_t defines from sys/types.h
-Fixes
-<command-line>:0:7: error: unknown type name 'off64_t'
-sendfile02.c:97:18: note: in expansion of macro 'OFF_T'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/syscalls/sendfile/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/sendfile/Makefile b/testcases/kernel/syscalls/sendfile/Makefile
-index df7b63f..1bd1b57 100644
---- a/testcases/kernel/syscalls/sendfile/Makefile
-+++ b/testcases/kernel/syscalls/sendfile/Makefile
-@@ -21,6 +21,6 @@ top_srcdir		?= ../../../..
- include $(top_srcdir)/include/mk/testcases.mk
- include $(abs_srcdir)/../utils/newer_64.mk
- 
--%_64: CPPFLAGS += -D_FILE_OFFSET_BITS=64 -DOFF_T=__off64_t
-+%_64: CPPFLAGS += -D_FILE_OFFSET_BITS=64 -DOFF_T=off64_t -D_GNU_SOURCE
- 
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch b/meta/recipes-extended/ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch
deleted file mode 100644
index 4be906e..0000000
--- a/meta/recipes-extended/ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch
+++ /dev/null
@@ -1,394 +0,0 @@
-From 405c03171e4bf0edd698cb602cf7bd7fe1d0401a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 19:33:53 +0000
-Subject: [PATCH 07/32] replace SIGCLD with SIGCHLD
-
-its defined to use SIGCHLD anyway in
-
-bits/signum.h:#define     SIGCLD          SIGCHLD /* Same as SIGCHLD
-(System V).  */
-
-plus it helps these tests compile with musl which adheres to posix
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/tst_sig.c                                   |  8 ++++----
- testcases/kernel/connectors/pec/pec_listener.c  |  1 +
- testcases/kernel/fs/doio/doio.c                 |  4 ++--
- testcases/kernel/fs/doio/growfiles.c            |  2 +-
- testcases/kernel/syscalls/fcntl/fcntl11.c       |  8 ++++----
- testcases/kernel/syscalls/fcntl/fcntl17.c       |  8 ++++----
- testcases/kernel/syscalls/fcntl/fcntl19.c       |  8 ++++----
- testcases/kernel/syscalls/fcntl/fcntl20.c       |  8 ++++----
- testcases/kernel/syscalls/fcntl/fcntl21.c       |  8 ++++----
- testcases/kernel/syscalls/kill/kill02.c         |  6 +++---
- testcases/kernel/syscalls/kill/kill12.c         |  8 ++++----
- testcases/kernel/syscalls/mkdir/mkdir09.c       | 12 ++++++------
- testcases/kernel/syscalls/sighold/sighold02.c   |  2 +-
- testcases/network/tcp_cmds/perf_lan/pingpong.c  |  2 +-
- testcases/network/tcp_cmds/perf_lan/pingpong6.c |  2 +-
- 15 files changed, 44 insertions(+), 43 deletions(-)
-
-diff --git a/lib/tst_sig.c b/lib/tst_sig.c
-index 3af5ffd..36565e1 100644
---- a/lib/tst_sig.c
-+++ b/lib/tst_sig.c
-@@ -49,7 +49,7 @@
- 		fork_flag - set to FORK or NOFORK depending upon whether the
- 			calling program executes a fork() system call.  It
- 			is normally the case that the calling program treats
--			SIGCLD as an expected signal if fork() is being used.
-+			SIGCHLD as an expected signal if fork() is being used.
- 
- 		handler - a pointer to the unexpected signal handler to
- 			be executed after an unexpected signal has been
-@@ -82,7 +82,7 @@ static void (*tst_setup_signal(int, void (*)(int))) (int);
- 
- /****************************************************************************
-  * tst_sig() : set-up to catch unexpected signals.  fork_flag is set to NOFORK
-- *    if SIGCLD is to be an "unexpected signal", otherwise it is set to
-+ *    if SIGCHLD is to be an "unexpected signal", otherwise it is set to
-  *    FORK.  cleanup points to a cleanup routine to be executed before
-  *    tst_exit is called (cleanup is set to NULL if no cleanup is desired).
-  *    handler is a pointer to the signal handling routine (if handler is
-@@ -117,7 +117,7 @@ void tst_sig(int fork_flag, void (*handler) (), void (*cleanup) ())
- 	for (sig = 1; sig < NSIG; sig++) {
- 		/*
- 		 * SIGKILL is never unexpected.
--		 * SIGCLD is only unexpected when
-+		 * SIGCHLD is only unexpected when
- 		 *    no forking is being done.
- 		 * SIGINFO is used for file quotas and should be expected
- 		 */
-@@ -205,7 +205,7 @@ void tst_sig(int fork_flag, void (*handler) (), void (*cleanup) ())
- #endif
- 			break;
- 
--		case SIGCLD:
-+		case SIGCHLD:
- 			if (fork_flag == FORK)
- 				continue;
- 
-diff --git a/testcases/kernel/connectors/pec/pec_listener.c b/testcases/kernel/connectors/pec/pec_listener.c
-index a1beb13..002750a 100644
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
-diff --git a/testcases/kernel/fs/doio/doio.c b/testcases/kernel/fs/doio/doio.c
-index 4b0dec5..5f65ef9 100644
---- a/testcases/kernel/fs/doio/doio.c
-+++ b/testcases/kernel/fs/doio/doio.c
-@@ -573,7 +573,7 @@ int main(int argc, char **argv)
- 		case SIGTSTP:
- 		case SIGSTOP:
- 		case SIGCONT:
--		case SIGCLD:
-+		case SIGCHLD:
- 		case SIGBUS:
- 		case SIGSEGV:
- 		case SIGQUIT:
-@@ -615,7 +615,7 @@ int main(int argc, char **argv)
- 	}
- 
- 	sigemptyset(&block_mask);
--	sigaddset(&block_mask, SIGCLD);
-+	sigaddset(&block_mask, SIGCHLD);
- 	sigprocmask(SIG_BLOCK, &block_mask, &omask);
- 
- 	/*
-diff --git a/testcases/kernel/fs/doio/growfiles.c b/testcases/kernel/fs/doio/growfiles.c
-index 09e7f35..bbad230 100644
---- a/testcases/kernel/fs/doio/growfiles.c
-+++ b/testcases/kernel/fs/doio/growfiles.c
-@@ -1640,7 +1640,7 @@ int set_sig(void)
- #ifdef SIGRESTART
- 		case SIGRESTART:
- #endif /* SIGRESTART */
--		case SIGCLD:
-+		case SIGCHLD:
- 			break;
- 
- 		default:
-diff --git a/testcases/kernel/syscalls/fcntl/fcntl11.c b/testcases/kernel/syscalls/fcntl/fcntl11.c
-index fa6ce53..2de2b6c 100644
---- a/testcases/kernel/syscalls/fcntl/fcntl11.c
-+++ b/testcases/kernel/syscalls/fcntl/fcntl11.c
-@@ -105,10 +105,10 @@ void setup(void)
- 	memset(&act, 0, sizeof(act));
- 	act.sa_handler = catch_child;
- 	sigemptyset(&act.sa_mask);
--	sigaddset(&act.sa_mask, SIGCLD);
--	if ((sigaction(SIGCLD, &act, NULL)) < 0)
-+	sigaddset(&act.sa_mask, SIGCHLD);
-+	if ((sigaction(SIGCHLD, &act, NULL)) < 0)
- 		tst_brkm(TBROK | TERRNO, cleanup,
--			 "sigaction(SIGCLD, ..) failed");
-+			 "sigaction(SIGCHLD, ..) failed");
- }
- 
- void do_child(void)
-@@ -227,7 +227,7 @@ void stop_child(void)
- {
- 	struct flock fl;
- 
--	signal(SIGCLD, SIG_DFL);
-+	signal(SIGCHLD, SIG_DFL);
- 	fl.l_type = STOP;
- 	parent_put(&fl);
- 	wait(0);
-diff --git a/testcases/kernel/syscalls/fcntl/fcntl17.c b/testcases/kernel/syscalls/fcntl/fcntl17.c
-index 5b03e39..6598b20 100644
---- a/testcases/kernel/syscalls/fcntl/fcntl17.c
-+++ b/testcases/kernel/syscalls/fcntl/fcntl17.c
-@@ -150,9 +150,9 @@ int setup(void)
- 	memset(&act, 0, sizeof(act));
- 	act.sa_handler = catch_child;
- 	sigemptyset(&act.sa_mask);
--	sigaddset(&act.sa_mask, SIGCLD);
--	if (sigaction(SIGCLD, &act, NULL) < 0) {
--		tst_resm(TFAIL, "SIGCLD signal setup failed, errno: %d", errno);
-+	sigaddset(&act.sa_mask, SIGCHLD);
-+	if (sigaction(SIGCHLD, &act, NULL) < 0) {
-+		tst_resm(TFAIL, "SIGCHLD signal setup failed, errno: %d", errno);
- 		return 1;
- 	}
- 	return 0;
-@@ -381,7 +381,7 @@ void stop_children(void)
- {
- 	int arg;
- 
--	signal(SIGCLD, SIG_DFL);
-+	signal(SIGCHLD, SIG_DFL);
- 	arg = STOP;
- 	child_free(child_pipe1[1], arg);
- 	child_free(child_pipe2[1], arg);
-diff --git a/testcases/kernel/syscalls/fcntl/fcntl19.c b/testcases/kernel/syscalls/fcntl/fcntl19.c
-index a542cfc..88c91d6 100644
---- a/testcases/kernel/syscalls/fcntl/fcntl19.c
-+++ b/testcases/kernel/syscalls/fcntl/fcntl19.c
-@@ -112,9 +112,9 @@ void setup(void)
- 	memset(&act, 0, sizeof(act));
- 	act.sa_handler = catch_child;
- 	sigemptyset(&act.sa_mask);
--	sigaddset(&act.sa_mask, SIGCLD);
--	if ((sigaction(SIGCLD, &act, NULL)) < 0) {
--		tst_resm(TFAIL, "SIGCLD signal setup failed, errno: %d", errno);
-+	sigaddset(&act.sa_mask, SIGCHLD);
-+	if ((sigaction(SIGCHLD, &act, NULL)) < 0) {
-+		tst_resm(TFAIL, "SIGCHLD signal setup failed, errno: %d", errno);
- 		fail = 1;
- 	}
- }
-@@ -265,7 +265,7 @@ void stop_child(void)
- {
- 	struct flock fl;
- 
--	signal(SIGCLD, SIG_DFL);
-+	signal(SIGCHLD, SIG_DFL);
- 	fl.l_type = STOP;
- 	parent_put(&fl);
- 	wait(0);
-diff --git a/testcases/kernel/syscalls/fcntl/fcntl20.c b/testcases/kernel/syscalls/fcntl/fcntl20.c
-index aa06bab..99fd783 100644
---- a/testcases/kernel/syscalls/fcntl/fcntl20.c
-+++ b/testcases/kernel/syscalls/fcntl/fcntl20.c
-@@ -109,9 +109,9 @@ void setup(void)
- 	memset(&act, 0, sizeof(act));
- 	act.sa_handler = catch_child;
- 	sigemptyset(&act.sa_mask);
--	sigaddset(&act.sa_mask, SIGCLD);
--	if (sigaction(SIGCLD, &act, NULL) == -1)
--		tst_brkm(TFAIL | TERRNO, cleanup, "SIGCLD signal setup failed");
-+	sigaddset(&act.sa_mask, SIGCHLD);
-+	if (sigaction(SIGCHLD, &act, NULL) == -1)
-+		tst_brkm(TFAIL | TERRNO, cleanup, "SIGCHLD signal setup failed");
- }
- 
- void cleanup(void)
-@@ -264,7 +264,7 @@ void stop_child(void)
- {
- 	struct flock fl;
- 
--	signal(SIGCLD, SIG_DFL);
-+	signal(SIGCHLD, SIG_DFL);
- 	fl.l_type = STOP;
- 	parent_put(&fl);
- 	wait(0);
-diff --git a/testcases/kernel/syscalls/fcntl/fcntl21.c b/testcases/kernel/syscalls/fcntl/fcntl21.c
-index 5307021..8f1a67c 100644
---- a/testcases/kernel/syscalls/fcntl/fcntl21.c
-+++ b/testcases/kernel/syscalls/fcntl/fcntl21.c
-@@ -110,9 +110,9 @@ void setup(void)
- 	memset(&act, 0, sizeof(act));
- 	act.sa_handler = catch_child;
- 	sigemptyset(&act.sa_mask);
--	sigaddset(&act.sa_mask, SIGCLD);
--	if ((sigaction(SIGCLD, &act, NULL)) < 0) {
--		tst_resm(TFAIL, "SIGCLD signal setup failed, errno: %d", errno);
-+	sigaddset(&act.sa_mask, SIGCHLD);
-+	if ((sigaction(SIGCHLD, &act, NULL)) < 0) {
-+		tst_resm(TFAIL, "SIGCHLD signal setup failed, errno: %d", errno);
- 		fail = 1;
- 	}
- }
-@@ -272,7 +272,7 @@ void stop_child(void)
- {
- 	struct flock fl;
- 
--	signal(SIGCLD, SIG_DFL);
-+	signal(SIGCHLD, SIG_DFL);
- 	fl.l_type = STOP;
- 	parent_put(&fl);
- 	wait(0);
-diff --git a/testcases/kernel/syscalls/kill/kill02.c b/testcases/kernel/syscalls/kill/kill02.c
-index 9d6cc68..08360dd 100644
---- a/testcases/kernel/syscalls/kill/kill02.c
-+++ b/testcases/kernel/syscalls/kill/kill02.c
-@@ -701,7 +701,7 @@ void setup(void)
- 
- 	/*
- 	 *  Set to catch unexpected signals.
--	 *  SIGCLD is set to be ignored because we do not wait for termination status.
-+	 *  SIGCHLD is set to be ignored because we do not wait for termination status.
- 	 *  SIGUSR1 is set to be ignored because this is the signal we are using for
- 	 *  the test and we are not concerned with the parent getting it.
- 	 */
-@@ -713,9 +713,9 @@ void setup(void)
- 			 "signal(SIGUSR1, SIG_IGN) failed");
- 	}
- 
--	if (signal(SIGCLD, SIG_IGN) == SIG_ERR) {
-+	if (signal(SIGCHLD, SIG_IGN) == SIG_ERR) {
- 		tst_brkm(TBROK | TERRNO, NULL,
--			 "signal(SIGCLD, SIG_IGN) failed");
-+			 "signal(SIGCHLD, SIG_IGN) failed");
- 	}
- 
- 	TEST_PAUSE;
-diff --git a/testcases/kernel/syscalls/kill/kill12.c b/testcases/kernel/syscalls/kill/kill12.c
-index 7a47a4a..d7c4147 100644
---- a/testcases/kernel/syscalls/kill/kill12.c
-+++ b/testcases/kernel/syscalls/kill/kill12.c
-@@ -98,7 +98,7 @@ int main(int argc, char **argv)
- 
- 	exno = 1;
- 
--	if (sigset(SIGCLD, chsig) == SIG_ERR) {
-+	if (sigset(SIGCHLD, chsig) == SIG_ERR) {
- 		fprintf(temp, "\tsigset failed, errno = %d\n", errno);
- 		fail_exit();
- 	}
-@@ -128,7 +128,7 @@ int main(int argc, char **argv)
- 				sleep(1);
- 
- 			kill(pid, sig);	/* child should ignroe this sig */
--			kill(pid, SIGCLD);	/* child should exit */
-+			kill(pid, SIGCHLD);	/* child should exit */
- 
- #ifdef BCS
- 			while ((npid = wait(&status)) != pid
-@@ -222,14 +222,14 @@ void do_child(void)
- 	int exno = 1;
- 
- #ifdef UCLINUX
--	if (sigset(SIGCLD, chsig) == SIG_ERR) {
-+	if (sigset(SIGCHLD, chsig) == SIG_ERR) {
- 		fprintf(temp, "\tsigset failed, errno = %d\n", errno);
- 		fail_exit();
- 	}
- #endif
- 
- 	sigset(sig, SIG_IGN);	/* set to ignore signal */
--	kill(getppid(), SIGCLD);	/* tell parent we are ready */
-+	kill(getppid(), SIGCHLD);	/* tell parent we are ready */
- 	while (!chflag)
- 		sleep(1);	/* wait for parent */
- 
-diff --git a/testcases/kernel/syscalls/mkdir/mkdir09.c b/testcases/kernel/syscalls/mkdir/mkdir09.c
-index 41c20e9..07b4fb8 100644
---- a/testcases/kernel/syscalls/mkdir/mkdir09.c
-+++ b/testcases/kernel/syscalls/mkdir/mkdir09.c
-@@ -122,10 +122,10 @@ int main(int argc, char *argv[])
- 
- 	}
- 
--	/* Set up to catch SIGCLD signal */
--	if (signal(SIGCLD, chld) == SIG_ERR) {
-+	/* Set up to catch SIGCHLD signal */
-+	if (signal(SIGCHLD, chld) == SIG_ERR) {
- 		tst_brkm(TFAIL, cleanup,
--			 "Error setting up SIGCLD signal, ERRNO = %d", errno);
-+			 "Error setting up SIGCHLD signal, ERRNO = %d", errno);
- 
- 	}
- 
-@@ -236,9 +236,9 @@ int runtest(void)
- 		tst_brkm(TFAIL, cleanup,
- 			 "Error resetting SIGTERM signal, ERRNO = %d", errno);
- 	}
--	if (signal(SIGCLD, SIG_DFL) == SIG_ERR) {
-+	if (signal(SIGCHLD, SIG_DFL) == SIG_ERR) {
- 		tst_brkm(TFAIL, cleanup,
--			 "Error resetting SIGCLD signal, ERRNO = %d", errno);
-+			 "Error resetting SIGCHLD signal, ERRNO = %d", errno);
- 	}
- 
- 	if (test_time) {
-@@ -372,7 +372,7 @@ void term(int sig)
- 
- void chld(int sig)
- {
--	/* Routine to handle SIGCLD signal. */
-+	/* Routine to handle SIGCHLD signal. */
- 
- 	sigchld++;
- 	if (jump) {
-diff --git a/testcases/kernel/syscalls/sighold/sighold02.c b/testcases/kernel/syscalls/sighold/sighold02.c
-index e3076fb..be01874 100644
---- a/testcases/kernel/syscalls/sighold/sighold02.c
-+++ b/testcases/kernel/syscalls/sighold/sighold02.c
-@@ -77,7 +77,7 @@ static int sigs_map[NUMSIGS];
- static int skip_sig(int sig)
- {
- 	switch (sig) {
--	case SIGCLD:
-+	case SIGCHLD:
- 	case SIGKILL:
- 	case SIGALRM:
- 	case SIGSTOP:
-diff --git a/testcases/network/tcp_cmds/perf_lan/pingpong.c b/testcases/network/tcp_cmds/perf_lan/pingpong.c
-index 1196312..5b06798 100644
---- a/testcases/network/tcp_cmds/perf_lan/pingpong.c
-+++ b/testcases/network/tcp_cmds/perf_lan/pingpong.c
-@@ -182,7 +182,7 @@ int main(int argc, char *argv[])
- 
- 	/* Setup traps */
- 	signal(SIGINT, finish);
--	signal(SIGCLD, finish);
-+	signal(SIGCHLD, finish);
- 
- 	/* Fork a child process to continue sending packets */
- 	tst_resm(TINFO, "Create a child process to continue to send packets");
-diff --git a/testcases/network/tcp_cmds/perf_lan/pingpong6.c b/testcases/network/tcp_cmds/perf_lan/pingpong6.c
-index 9747f58..0a0fb1d 100644
---- a/testcases/network/tcp_cmds/perf_lan/pingpong6.c
-+++ b/testcases/network/tcp_cmds/perf_lan/pingpong6.c
-@@ -153,7 +153,7 @@ char *argv[];
- 
- 	/* Setup traps */
- 	signal(SIGINT, finish);
--	signal(SIGCLD, finish);
-+	signal(SIGCHLD, finish);
- 
- 	/* Fork a child process to continue sending packets */
- 	printf("Create a child process to continue to send packets \n");
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0009-Guard-error.h-with-__GLIBC__.patch b/meta/recipes-extended/ltp/ltp/0009-Guard-error.h-with-__GLIBC__.patch
deleted file mode 100644
index e58e5a9..0000000
--- a/meta/recipes-extended/ltp/ltp/0009-Guard-error.h-with-__GLIBC__.patch
+++ /dev/null
@@ -1,270 +0,0 @@
-From 4ba19d64e95a874995d0b554b891b5ec35bd9495 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 19:45:35 +0000
-Subject: [PATCH 09/32] Guard error.h with __GLIBC__
-
-error API is specific to glibc so use the guard to make it conditional
-on glibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/syscalls/faccessat/faccessat01.c   | 2 ++
- testcases/kernel/syscalls/fallocate/fallocate01.c   | 2 ++
- testcases/kernel/syscalls/fchmodat/fchmodat01.c     | 2 ++
- testcases/kernel/syscalls/fchownat/fchownat01.c     | 2 ++
- testcases/kernel/syscalls/fchownat/fchownat02.c     | 2 ++
- testcases/kernel/syscalls/fstatat/fstatat01.c       | 2 ++
- testcases/kernel/syscalls/futimesat/futimesat01.c   | 2 ++
- testcases/kernel/syscalls/linkat/linkat01.c         | 2 ++
- testcases/kernel/syscalls/linkat/linkat02.c         | 2 ++
- testcases/kernel/syscalls/mkdirat/mkdirat01.c       | 2 ++
- testcases/kernel/syscalls/mknodat/mknodat01.c       | 2 ++
- testcases/kernel/syscalls/mknodat/mknodat02.c       | 2 ++
- testcases/kernel/syscalls/openat/openat01.c         | 2 ++
- testcases/kernel/syscalls/readlinkat/readlinkat01.c | 2 ++
- testcases/kernel/syscalls/renameat/renameat01.c     | 2 ++
- testcases/kernel/syscalls/symlinkat/symlinkat01.c   | 2 ++
- testcases/kernel/syscalls/unlinkat/unlinkat01.c     | 2 ++
- 17 files changed, 34 insertions(+)
-
-diff --git a/testcases/kernel/syscalls/faccessat/faccessat01.c b/testcases/kernel/syscalls/faccessat/faccessat01.c
-index 7f0e87a..c72dcf0 100644
---- a/testcases/kernel/syscalls/faccessat/faccessat01.c
-+++ b/testcases/kernel/syscalls/faccessat/faccessat01.c
-@@ -37,7 +37,9 @@
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <unistd.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
-diff --git a/testcases/kernel/syscalls/fallocate/fallocate01.c b/testcases/kernel/syscalls/fallocate/fallocate01.c
-index e72b123..643c0e2 100644
---- a/testcases/kernel/syscalls/fallocate/fallocate01.c
-+++ b/testcases/kernel/syscalls/fallocate/fallocate01.c
-@@ -96,7 +96,9 @@
- #include <fcntl.h>
- #include <sys/syscall.h>
- #include <unistd.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <inttypes.h>
- #include <sys/utsname.h>
- 
-diff --git a/testcases/kernel/syscalls/fchmodat/fchmodat01.c b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
-index 19e9ad5..ae6d807 100644
---- a/testcases/kernel/syscalls/fchmodat/fchmodat01.c
-+++ b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
-@@ -37,7 +37,9 @@
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <unistd.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
-diff --git a/testcases/kernel/syscalls/fchownat/fchownat01.c b/testcases/kernel/syscalls/fchownat/fchownat01.c
-index b361253..a5218af 100644
---- a/testcases/kernel/syscalls/fchownat/fchownat01.c
-+++ b/testcases/kernel/syscalls/fchownat/fchownat01.c
-@@ -28,7 +28,9 @@
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <unistd.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
-diff --git a/testcases/kernel/syscalls/fchownat/fchownat02.c b/testcases/kernel/syscalls/fchownat/fchownat02.c
-index 6b0304c..8d2863f 100644
---- a/testcases/kernel/syscalls/fchownat/fchownat02.c
-+++ b/testcases/kernel/syscalls/fchownat/fchownat02.c
-@@ -26,7 +26,9 @@
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <unistd.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
-diff --git a/testcases/kernel/syscalls/fstatat/fstatat01.c b/testcases/kernel/syscalls/fstatat/fstatat01.c
-index 61531c6..e99fbd2 100644
---- a/testcases/kernel/syscalls/fstatat/fstatat01.c
-+++ b/testcases/kernel/syscalls/fstatat/fstatat01.c
-@@ -48,7 +48,9 @@
- #include <sys/stat.h>
- #include <sys/time.h>
- #include <fcntl.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
-diff --git a/testcases/kernel/syscalls/futimesat/futimesat01.c b/testcases/kernel/syscalls/futimesat/futimesat01.c
-index ae8d4fe..316dd78 100644
---- a/testcases/kernel/syscalls/futimesat/futimesat01.c
-+++ b/testcases/kernel/syscalls/futimesat/futimesat01.c
-@@ -37,7 +37,9 @@
- #include <sys/stat.h>
- #include <sys/time.h>
- #include <fcntl.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
-diff --git a/testcases/kernel/syscalls/linkat/linkat01.c b/testcases/kernel/syscalls/linkat/linkat01.c
-index fc0687b..83cbfe7 100644
---- a/testcases/kernel/syscalls/linkat/linkat01.c
-+++ b/testcases/kernel/syscalls/linkat/linkat01.c
-@@ -49,7 +49,9 @@
- #include <sys/time.h>
- #include <fcntl.h>
- #include <unistd.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
-diff --git a/testcases/kernel/syscalls/linkat/linkat02.c b/testcases/kernel/syscalls/linkat/linkat02.c
-index e9a752a..8d7e431 100644
---- a/testcases/kernel/syscalls/linkat/linkat02.c
-+++ b/testcases/kernel/syscalls/linkat/linkat02.c
-@@ -23,7 +23,9 @@
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <unistd.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
-diff --git a/testcases/kernel/syscalls/mkdirat/mkdirat01.c b/testcases/kernel/syscalls/mkdirat/mkdirat01.c
-index 7e15947..1dbc038 100644
---- a/testcases/kernel/syscalls/mkdirat/mkdirat01.c
-+++ b/testcases/kernel/syscalls/mkdirat/mkdirat01.c
-@@ -30,7 +30,9 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <fcntl.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
-diff --git a/testcases/kernel/syscalls/mknodat/mknodat01.c b/testcases/kernel/syscalls/mknodat/mknodat01.c
-index 26e5538..f034f05 100644
---- a/testcases/kernel/syscalls/mknodat/mknodat01.c
-+++ b/testcases/kernel/syscalls/mknodat/mknodat01.c
-@@ -29,7 +29,9 @@
- #include <sys/types.h>
- #include <fcntl.h>
- #include <sys/stat.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
-diff --git a/testcases/kernel/syscalls/mknodat/mknodat02.c b/testcases/kernel/syscalls/mknodat/mknodat02.c
-index f6368fa..7d0f7c0 100644
---- a/testcases/kernel/syscalls/mknodat/mknodat02.c
-+++ b/testcases/kernel/syscalls/mknodat/mknodat02.c
-@@ -29,7 +29,9 @@
- #include <sys/types.h>
- #include <fcntl.h>
- #include <sys/stat.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
-diff --git a/testcases/kernel/syscalls/openat/openat01.c b/testcases/kernel/syscalls/openat/openat01.c
-index 85f9a91..4ee0117 100644
---- a/testcases/kernel/syscalls/openat/openat01.c
-+++ b/testcases/kernel/syscalls/openat/openat01.c
-@@ -29,7 +29,9 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <fcntl.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
-diff --git a/testcases/kernel/syscalls/readlinkat/readlinkat01.c b/testcases/kernel/syscalls/readlinkat/readlinkat01.c
-index 97a49e8..b162853 100644
---- a/testcases/kernel/syscalls/readlinkat/readlinkat01.c
-+++ b/testcases/kernel/syscalls/readlinkat/readlinkat01.c
-@@ -29,7 +29,9 @@
- #include <sys/stat.h>
- #include <sys/time.h>
- #include <fcntl.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
-diff --git a/testcases/kernel/syscalls/renameat/renameat01.c b/testcases/kernel/syscalls/renameat/renameat01.c
-index f4cd51b..105a05b 100644
---- a/testcases/kernel/syscalls/renameat/renameat01.c
-+++ b/testcases/kernel/syscalls/renameat/renameat01.c
-@@ -42,7 +42,9 @@
- #include <sys/stat.h>
- #include <sys/time.h>
- #include <fcntl.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
-diff --git a/testcases/kernel/syscalls/symlinkat/symlinkat01.c b/testcases/kernel/syscalls/symlinkat/symlinkat01.c
-index 5c238d8..cb7a7e8 100644
---- a/testcases/kernel/syscalls/symlinkat/symlinkat01.c
-+++ b/testcases/kernel/syscalls/symlinkat/symlinkat01.c
-@@ -37,7 +37,9 @@
- #include <sys/stat.h>
- #include <sys/time.h>
- #include <fcntl.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
-diff --git a/testcases/kernel/syscalls/unlinkat/unlinkat01.c b/testcases/kernel/syscalls/unlinkat/unlinkat01.c
-index 31fe4e7..26f6d9a 100644
---- a/testcases/kernel/syscalls/unlinkat/unlinkat01.c
-+++ b/testcases/kernel/syscalls/unlinkat/unlinkat01.c
-@@ -37,7 +37,9 @@
- #include <sys/stat.h>
- #include <sys/time.h>
- #include <fcntl.h>
-+#ifdef __GLIBC__
- #include <error.h>
-+#endif
- #include <stdlib.h>
- #include <errno.h>
- #include <string.h>
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch b/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
index 945280c..6eace63 100644
--- a/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
+++ b/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
@@ -20,8 +20,8 @@ index 7203e9e..fce87d6 100644
  /**************/
  
  key_t key;
--sigset_t sigset;
-+sigset_t sigset1;
+-sigset_t set;
++sigset_t set1;
  
  #define  SIZE  16*1024
  
@@ -29,12 +29,12 @@ index 7203e9e..fce87d6 100644
  
  	key = (key_t) getpid();
  
--	sigemptyset(&sigset);
--	sigaddset(&sigset, SIGUSR1);
--	sigprocmask(SIG_BLOCK, &sigset, NULL);
-+	sigemptyset(&sigset1);
-+	sigaddset(&sigset1, SIGUSR1);
-+	sigprocmask(SIG_BLOCK, &sigset1, NULL);
+-	sigemptyset(&set);
+-	sigaddset(&set, SIGUSR1);
+-	sigprocmask(SIG_BLOCK, &set, NULL);
++	sigemptyset(&set1);
++	sigaddset(&set1, SIGUSR1);
++	sigprocmask(SIG_BLOCK, &set1, NULL);
  
  	pid = fork();
  	switch (pid) {
@@ -42,8 +42,8 @@ index 7203e9e..fce87d6 100644
  	char *cp;
  	int sig;
  
--	sigwait(&sigset, &sig);
-+	sigwait(&sigset1, &sig);
+-	sigwait(&set, &sig);
++	sigwait(&set1, &sig);
  	chld_pid = getpid();
  /*--------------------------------------------------------*/
  
@@ -55,8 +55,8 @@ index a3c9ca3..77b0fc9 100644
  /**************/
  
  key_t key;
--sigset_t sigset;
-+sigset_t sigset1;
+-sigset_t set;
++sigset_t set1;
  
  int child();
  static int rm_shm(int);
@@ -64,12 +64,12 @@ index a3c9ca3..77b0fc9 100644
  
  	key = (key_t) getpid();
  
--	sigemptyset(&sigset);
--	sigaddset(&sigset, SIGUSR1);
--	sigprocmask(SIG_BLOCK, &sigset, NULL);
-+	sigemptyset(&sigset1);
-+	sigaddset(&sigset1, SIGUSR1);
-+	sigprocmask(SIG_BLOCK, &sigset1, NULL);
+-	sigemptyset(&set);
+-	sigaddset(&set, SIGUSR1);
+-	sigprocmask(SIG_BLOCK, &set, NULL);
++	sigemptyset(&set1);
++	sigaddset(&set1, SIGUSR1);
++	sigprocmask(SIG_BLOCK, &set1, NULL);
  
  	pid = fork();
  	switch (pid) {
@@ -77,8 +77,8 @@ index a3c9ca3..77b0fc9 100644
  	char *cp;
  	int sig;
  
--	sigwait(&sigset, &sig);
-+	sigwait(&sigset1, &sig);
+-	sigwait(&set, &sig);
++	sigwait(&set1, &sig);
  	chld_pid = getpid();
  
  	if ((shmid = shmget(key, SIZE, 0)) < 0) {
@@ -90,8 +90,8 @@ index 20fca52..6fb1d57 100644
  int sig_catch = 0;		/* variable to blocked/unblocked signals */
  
  struct sigaction sa_new;	/* struct to hold signal info */
--sigset_t sigset;		/* signal set to hold signal lists */
-+sigset_t sigset1;		/* signal set to hold signal lists */
+-sigset_t set;		/* signal set to hold signal lists */
++sigset_t set1;		/* signal set to hold signal lists */
  sigset_t sigset2;
  
  int main(int ac, char **av)
@@ -99,8 +99,8 @@ index 20fca52..6fb1d57 100644
  		 * so that, signal will not be delivered to
  		 * the test process.
  		 */
--		TEST(sigprocmask(SIG_BLOCK, &sigset, 0));
-+		TEST(sigprocmask(SIG_BLOCK, &sigset1, 0));
+-		TEST(sigprocmask(SIG_BLOCK, &set, 0));
++		TEST(sigprocmask(SIG_BLOCK, &set1, 0));
  
  		/* Get the process id of test process */
  		my_pid = getpid();
@@ -108,8 +108,8 @@ index 20fca52..6fb1d57 100644
  				 */
  				errno = 0;
  				if (sigprocmask(SIG_UNBLOCK,
--						&sigset, 0) == -1) {
-+						&sigset1, 0) == -1) {
+-						&set, 0) == -1) {
++						&set1, 0) == -1) {
  					tst_brkm(TFAIL, cleanup,
  						 "sigprocmask() failed "
  						 "to unblock signal, "
@@ -117,8 +117,8 @@ index 20fca52..6fb1d57 100644
  	 * Initialise the signal sets with the list that
  	 * excludes/includes  all system-defined signals.
  	 */
--	if (sigemptyset(&sigset) == -1) {
-+	if (sigemptyset(&sigset1) == -1) {
+-	if (sigemptyset(&set) == -1) {
++	if (sigemptyset(&set1) == -1) {
  		tst_brkm(TFAIL, cleanup,
  			 "sigemptyset() failed, errno=%d : %s",
  			 errno, strerror(errno));
@@ -126,8 +126,8 @@ index 20fca52..6fb1d57 100644
  	 * Add specified signal (SIGINT) to the signal set
  	 * which excludes system-defined signals.
  	 */
--	if (sigaddset(&sigset, SIGINT) == -1) {
-+	if (sigaddset(&sigset1, SIGINT) == -1) {
+-	if (sigaddset(&set, SIGINT) == -1) {
++	if (sigaddset(&set1, SIGINT) == -1) {
  		tst_brkm(TFAIL, cleanup,
  			 "sigaddset() failed, errno=%d : %s",
  			 errno, strerror(errno));
diff --git a/meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__int64_t-with-int64_t.patch b/meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
deleted file mode 100644
index e1532c1..0000000
--- a/meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
+++ /dev/null
@@ -1,351 +0,0 @@
-From 54e098a366a1d773c4d7d4124f2f5aab976681c3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 19:58:08 +0000
-Subject: [PATCH 12/32] fsstress.c: Replace __int64_t with int64_t
-
-int64_t is defined in ISO C99
-include limits.h to get defintions of PATH_MAX
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/fs/fsstress/fsstress.c       | 31 +++++++++---------
- testcases/network/nfs/nfs_fsstress/fsstress.c | 47 ++++++++++++++-------------
- 2 files changed, 40 insertions(+), 38 deletions(-)
-
-diff --git a/testcases/kernel/fs/fsstress/fsstress.c b/testcases/kernel/fs/fsstress/fsstress.c
-index 2f89903..89f0b19 100644
---- a/testcases/kernel/fs/fsstress/fsstress.c
-+++ b/testcases/kernel/fs/fsstress/fsstress.c
-@@ -36,6 +36,7 @@
- #ifdef HAVE_SYS_PRCTL_H
- # include <sys/prctl.h>
- #endif
-+#include <limits.h>
- 
- #define XFS_ERRTAG_MAX		17
- 
-@@ -1572,7 +1573,7 @@ void bulkstat_f(int opno, long r)
- 	__u64 last;
- 	__s32 nent;
- 	xfs_bstat_t *t;
--	__int64_t total;
-+	int64_t total;
- 	xfs_fsop_bulkreq_t bsr;
- 
- 	last = 0;
-@@ -1764,14 +1765,14 @@ int setdirect(int fd)
- 
- void dread_f(int opno, long r)
- {
--	__int64_t align;
-+	int64_t align;
- 	char *buf = NULL;
- 	struct dioattr diob;
- 	int e;
- 	pathname_t f;
- 	int fd;
- 	size_t len;
--	__int64_t lr;
-+	int64_t lr;
- 	off64_t off;
- 	struct stat64 stb;
- 	int v;
-@@ -1835,8 +1836,8 @@ void dread_f(int opno, long r)
- 		return;
- 	}
- #endif
--	align = (__int64_t) diob.d_miniosz;
--	lr = ((__int64_t) random() << 32) + random();
-+	align = (int64_t) diob.d_miniosz;
-+	lr = ((int64_t) random() << 32) + random();
- 	off = (off64_t) (lr % stb.st_size);
- 	off -= (off % align);
- 	lseek64(fd, off, SEEK_SET);
-@@ -1865,14 +1866,14 @@ void dread_f(int opno, long r)
- 
- void dwrite_f(int opno, long r)
- {
--	__int64_t align;
-+	int64_t align;
- 	char *buf = NULL;
- 	struct dioattr diob;
- 	int e;
- 	pathname_t f;
- 	int fd;
- 	size_t len;
--	__int64_t lr;
-+	int64_t lr;
- 	off64_t off;
- 	struct stat64 stb;
- 	int v;
-@@ -1925,8 +1926,8 @@ void dwrite_f(int opno, long r)
- 		return;
- 	}
- #endif
--	align = (__int64_t) diob.d_miniosz;
--	lr = ((__int64_t) random() << 32) + random();
-+	align = (int64_t) diob.d_miniosz;
-+	lr = ((int64_t) random() << 32) + random();
- 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
- 	off -= (off % align);
- 	lseek64(fd, off, SEEK_SET);
-@@ -2224,7 +2225,7 @@ void read_f(int opno, long r)
- 	pathname_t f;
- 	int fd;
- 	size_t len;
--	__int64_t lr;
-+	int64_t lr;
- 	off64_t off;
- 	struct stat64 stb;
- 	int v;
-@@ -2262,7 +2263,7 @@ void read_f(int opno, long r)
- 		close(fd);
- 		return;
- 	}
--	lr = ((__int64_t) random() << 32) + random();
-+	lr = ((int64_t) random() << 32) + random();
- 	off = (off64_t) (lr % stb.st_size);
- 	lseek64(fd, off, SEEK_SET);
- 	len = (random() % (getpagesize() * 32)) + 1;
-@@ -2509,7 +2510,7 @@ void truncate_f(int opno, long r)
- {
- 	int e;
- 	pathname_t f;
--	__int64_t lr;
-+	int64_t lr;
- 	off64_t off;
- 	struct stat64 stb;
- 	int v;
-@@ -2530,7 +2531,7 @@ void truncate_f(int opno, long r)
- 		free_pathname(&f);
- 		return;
- 	}
--	lr = ((__int64_t) random() << 32) + random();
-+	lr = ((int64_t) random() << 32) + random();
- 	off = lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE);
- 	off %= maxfsize;
- 	e = truncate64_path(&f, off) < 0 ? errno : 0;
-@@ -2626,7 +2627,7 @@ void write_f(int opno, long r)
- 	pathname_t f;
- 	int fd;
- 	size_t len;
--	__int64_t lr;
-+	int64_t lr;
- 	off64_t off;
- 	struct stat64 stb;
- 	int v;
-@@ -2656,7 +2657,7 @@ void write_f(int opno, long r)
- 		close(fd);
- 		return;
- 	}
--	lr = ((__int64_t) random() << 32) + random();
-+	lr = ((int64_t) random() << 32) + random();
- 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
- 	off %= maxfsize;
- 	lseek64(fd, off, SEEK_SET);
-diff --git a/testcases/network/nfs/nfs_fsstress/fsstress.c b/testcases/network/nfs/nfs_fsstress/fsstress.c
-index ac91262..a34c416 100644
---- a/testcases/network/nfs/nfs_fsstress/fsstress.c
-+++ b/testcases/network/nfs/nfs_fsstress/fsstress.c
-@@ -31,6 +31,7 @@
-  */
- 
- #include "global.h"
-+#include <limits.h>
- 
- #define XFS_ERRTAG_MAX		17
- 
-@@ -1368,7 +1369,7 @@ void allocsp_f(int opno, long r)
- 	pathname_t f;
- 	int fd;
- 	struct flock64 fl;
--	__int64_t lr;
-+	int64_t lr;
- 	off64_t off;
- 	struct stat64 stb;
- 	int v;
-@@ -1398,7 +1399,7 @@ void allocsp_f(int opno, long r)
- 		close(fd);
- 		return;
- 	}
--	lr = ((__int64_t) random() << 32) + random();
-+	lr = ((int64_t) random() << 32) + random();
- 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
- 	off %= maxfsize;
- 	fl.l_whence = SEEK_SET;
-@@ -1519,7 +1520,7 @@ void bulkstat_f(int opno, long r)
- 	__uint64_t last;
- 	int nent;
- 	xfs_bstat_t *t;
--	__int64_t total;
-+	int64_t total;
- 	xfs_fsop_bulkreq_t bsr;
- 
- 	last = 0;
-@@ -1708,14 +1709,14 @@ int setdirect(int fd)
- 
- void dread_f(int opno, long r)
- {
--	__int64_t align;
-+	int64_t align;
- 	char *buf;
- 	struct dioattr diob;
- 	int e;
- 	pathname_t f;
- 	int fd;
- 	size_t len;
--	__int64_t lr;
-+	int64_t lr;
- 	off64_t off;
- 	struct stat64 stb;
- 	int v;
-@@ -1775,8 +1776,8 @@ void dread_f(int opno, long r)
- 		return;
- 	}
- #endif
--	align = (__int64_t) diob.d_miniosz;
--	lr = ((__int64_t) random() << 32) + random();
-+	align = (int64_t) diob.d_miniosz;
-+	lr = ((int64_t) random() << 32) + random();
- 	off = (off64_t) (lr % stb.st_size);
- 	off -= (off % align);
- 	lseek64(fd, off, SEEK_SET);
-@@ -1798,14 +1799,14 @@ void dread_f(int opno, long r)
- 
- void dwrite_f(int opno, long r)
- {
--	__int64_t align;
-+	int64_t align;
- 	char *buf;
- 	struct dioattr diob;
- 	int e;
- 	pathname_t f;
- 	int fd;
- 	size_t len;
--	__int64_t lr;
-+	int64_t lr;
- 	off64_t off;
- 	struct stat64 stb;
- 	int v;
-@@ -1854,8 +1855,8 @@ void dwrite_f(int opno, long r)
- 		return;
- 	}
- #endif
--	align = (__int64_t) diob.d_miniosz;
--	lr = ((__int64_t) random() << 32) + random();
-+	align = (int64_t) diob.d_miniosz;
-+	lr = ((int64_t) random() << 32) + random();
- 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
- 	off -= (off % align);
- 	lseek64(fd, off, SEEK_SET);
-@@ -1917,7 +1918,7 @@ void freesp_f(int opno, long r)
- 	pathname_t f;
- 	int fd;
- 	struct flock64 fl;
--	__int64_t lr;
-+	int64_t lr;
- 	off64_t off;
- 	struct stat64 stb;
- 	int v;
-@@ -1947,7 +1948,7 @@ void freesp_f(int opno, long r)
- 		close(fd);
- 		return;
- 	}
--	lr = ((__int64_t) random() << 32) + random();
-+	lr = ((int64_t) random() << 32) + random();
- 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
- 	off %= maxfsize;
- 	fl.l_whence = SEEK_SET;
-@@ -2145,7 +2146,7 @@ void read_f(int opno, long r)
- 	pathname_t f;
- 	int fd;
- 	size_t len;
--	__int64_t lr;
-+	int64_t lr;
- 	off64_t off;
- 	struct stat64 stb;
- 	int v;
-@@ -2183,7 +2184,7 @@ void read_f(int opno, long r)
- 		close(fd);
- 		return;
- 	}
--	lr = ((__int64_t) random() << 32) + random();
-+	lr = ((int64_t) random() << 32) + random();
- 	off = (off64_t) (lr % stb.st_size);
- 	lseek64(fd, off, SEEK_SET);
- 	len = (random() % (getpagesize() * 32)) + 1;
-@@ -2281,7 +2282,7 @@ void resvsp_f(int opno, long r)
- 	pathname_t f;
- 	int fd;
- 	struct flock64 fl;
--	__int64_t lr;
-+	int64_t lr;
- 	off64_t off;
- 	struct stat64 stb;
- 	int v;
-@@ -2311,7 +2312,7 @@ void resvsp_f(int opno, long r)
- 		close(fd);
- 		return;
- 	}
--	lr = ((__int64_t) random() << 32) + random();
-+	lr = ((int64_t) random() << 32) + random();
- 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
- 	off %= maxfsize;
- 	fl.l_whence = SEEK_SET;
-@@ -2428,7 +2429,7 @@ void truncate_f(int opno, long r)
- {
- 	int e;
- 	pathname_t f;
--	__int64_t lr;
-+	int64_t lr;
- 	off64_t off;
- 	struct stat64 stb;
- 	int v;
-@@ -2449,7 +2450,7 @@ void truncate_f(int opno, long r)
- 		free_pathname(&f);
- 		return;
- 	}
--	lr = ((__int64_t) random() << 32) + random();
-+	lr = ((int64_t) random() << 32) + random();
- 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
- 	off %= maxfsize;
- 	e = truncate64_path(&f, off) < 0 ? errno : 0;
-@@ -2491,7 +2492,7 @@ void unresvsp_f(int opno, long r)
- 	pathname_t f;
- 	int fd;
- 	struct flock64 fl;
--	__int64_t lr;
-+	int64_t lr;
- 	off64_t off;
- 	struct stat64 stb;
- 	int v;
-@@ -2521,7 +2522,7 @@ void unresvsp_f(int opno, long r)
- 		close(fd);
- 		return;
- 	}
--	lr = ((__int64_t) random() << 32) + random();
-+	lr = ((int64_t) random() << 32) + random();
- 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
- 	off %= maxfsize;
- 	fl.l_whence = SEEK_SET;
-@@ -2543,7 +2544,7 @@ void write_f(int opno, long r)
- 	pathname_t f;
- 	int fd;
- 	size_t len;
--	__int64_t lr;
-+	int64_t lr;
- 	off64_t off;
- 	struct stat64 stb;
- 	int v;
-@@ -2573,7 +2574,7 @@ void write_f(int opno, long r)
- 		close(fd);
- 		return;
- 	}
--	lr = ((__int64_t) random() << 32) + random();
-+	lr = ((int64_t) random() << 32) + random();
- 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
- 	off %= maxfsize;
- 	lseek64(fd, off, SEEK_SET);
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-getting-O_-definitions.patch b/meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-getting-O_-definitions.patch
deleted file mode 100644
index 4266e4f..0000000
--- a/meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-getting-O_-definitions.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 1ef8c32317064438ec3b37a114f5d82957f4e0c6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 20:05:54 +0000
-Subject: [PATCH 13/32] include fcntl.h for getting O_* definitions
-
-musl exposes this issue, with glibc fcntl.h is included via some other
-header and this problem remained latent
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/ipc/ipc_stress/shmem_test_03.c   | 1 +
- testcases/kernel/syscalls/mq_notify/mq_notify01.c | 1 +
- testcases/network/tcp_cmds/sendfile/testsf_c.c    | 1 +
- testcases/network/tcp_cmds/sendfile/testsf_s.c    | 1 +
- 4 files changed, 4 insertions(+)
-
-diff --git a/testcases/kernel/ipc/ipc_stress/shmem_test_03.c b/testcases/kernel/ipc/ipc_stress/shmem_test_03.c
-index c1b11fd..8be156f 100644
---- a/testcases/kernel/ipc/ipc_stress/shmem_test_03.c
-+++ b/testcases/kernel/ipc/ipc_stress/shmem_test_03.c
-@@ -72,6 +72,7 @@
- #include <string.h>
- #include <unistd.h>
- #include <limits.h>
-+#include <fcntl.h>
- #include <sys/file.h>
- #include <sys/ipc.h>
- #include <sys/mman.h>
-diff --git a/testcases/kernel/syscalls/mq_notify/mq_notify01.c b/testcases/kernel/syscalls/mq_notify/mq_notify01.c
-index 4728c70..5c7846c 100644
---- a/testcases/kernel/syscalls/mq_notify/mq_notify01.c
-+++ b/testcases/kernel/syscalls/mq_notify/mq_notify01.c
-@@ -41,6 +41,7 @@
- #include <mqueue.h>
- #include <signal.h>
- #include <stdlib.h>
-+#include <fcntl.h>
- 
- #include "../utils/include_j_h.h"
- 
-diff --git a/testcases/network/tcp_cmds/sendfile/testsf_c.c b/testcases/network/tcp_cmds/sendfile/testsf_c.c
-index 449784f..38d3274 100644
---- a/testcases/network/tcp_cmds/sendfile/testsf_c.c
-+++ b/testcases/network/tcp_cmds/sendfile/testsf_c.c
-@@ -9,6 +9,7 @@
- #include <sys/types.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <fcntl.h>
- #include <sys/file.h>
- #include <arpa/inet.h>
- #include <netinet/in.h>
-diff --git a/testcases/network/tcp_cmds/sendfile/testsf_s.c b/testcases/network/tcp_cmds/sendfile/testsf_s.c
-index 17e98ad..bce8dd1 100644
---- a/testcases/network/tcp_cmds/sendfile/testsf_s.c
-+++ b/testcases/network/tcp_cmds/sendfile/testsf_s.c
-@@ -6,6 +6,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <unistd.h>
-+#include <fcntl.h>
- #include <sys/file.h>
- #include <errno.h>
- #include <sys/signal.h>
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch b/meta/recipes-extended/ltp/ltp/0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
deleted file mode 100644
index 84d81e9..0000000
--- a/meta/recipes-extended/ltp/ltp/0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From d63fefa86dac437c47b9ebbea0a82a1240aaba2c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 20:09:56 +0000
-Subject: [PATCH 14/32] hyperthreading: Include sys/types.h for pid_t
- definition
-
-If sys/types.h is not included then it will not define pid_t_needed
-and therefore typedef wont be included and we get errors about pid_t
-being not known
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h  | 1 +
- testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h   | 1 +
- testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h b/testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h
-index 1ec9794..9084aa7 100644
---- a/testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h
-+++ b/testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h
-@@ -3,6 +3,7 @@
- #define _HTUTILS_H_
- 
- #include <stdlib.h>
-+#include <sys/types.h>
- 
- int is_cmdline_para(const char *para);
- 
-diff --git a/testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h b/testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h
-index 1ec9794..c03a124 100644
---- a/testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h
-+++ b/testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h
-@@ -2,6 +2,7 @@
- #ifndef _HTUTILS_H_
- #define _HTUTILS_H_
- 
-+#include <sys/types.h>
- #include <stdlib.h>
- 
- int is_cmdline_para(const char *para);
-diff --git a/testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h b/testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h
-index 2977ad0..6b484e1 100644
---- a/testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h
-+++ b/testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h
-@@ -3,6 +3,7 @@
- #define _HTUTILS_H_
- 
- #include <stdlib.h>
-+#include <sys/types.h>
- 
- int is_cmdline_para(const char *para);
- 
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-PAGESIZE-to-pagesize.patch b/meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-PAGESIZE-to-pagesize.patch
deleted file mode 100644
index 963536f..0000000
--- a/meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-PAGESIZE-to-pagesize.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From f091839532f3afe0a58e8ba0b45615c899a43a47 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 20:12:09 +0000
-Subject: [PATCH 15/32] mincore01: Rename PAGESIZE to pagesize
-
-PAGESIZE conflicts with system headers on musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/syscalls/mincore/mincore01.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/mincore/mincore01.c b/testcases/kernel/syscalls/mincore/mincore01.c
-index 97a3d95..fa426d1 100644
---- a/testcases/kernel/syscalls/mincore/mincore01.c
-+++ b/testcases/kernel/syscalls/mincore/mincore01.c
-@@ -45,7 +45,7 @@
- #include "test.h"
- #include "safe_macros.h"
- 
--static int PAGESIZE;
-+static int pagesize;
- static rlim_t STACK_LIMIT = 10485760;
- 
- static void cleanup(void);
-@@ -146,7 +146,7 @@ static void setup4(struct test_case_t *tc)
- 	}
- 
- 	tc->addr = global_pointer;
--	tc->len = as_lim.rlim_cur - (rlim_t)global_pointer + PAGESIZE;
-+	tc->len = as_lim.rlim_cur - (rlim_t)global_pointer + pagesize;
- 	tc->vector = global_vec;
- 
- 	/*
-@@ -161,7 +161,7 @@ static void setup(void)
- 	char *buf;
- 	int fd;
- 
--	PAGESIZE = getpagesize();
-+	pagesize = getpagesize();
- 
- 	tst_sig(NOFORK, DEF_HANDLER, cleanup);
- 
-@@ -170,7 +170,7 @@ static void setup(void)
- 	TEST_PAUSE;
- 
- 	/* global_pointer will point to a mmapped area of global_len bytes */
--	global_len = PAGESIZE * 2;
-+	global_len = pagesize * 2;
- 
- 	buf = SAFE_MALLOC(cleanup, global_len);
- 	memset(buf, 42, global_len);
-@@ -186,7 +186,7 @@ static void setup(void)
- 				   PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
- 
- 	global_vec = SAFE_MALLOC(cleanup,
--				 (global_len + PAGESIZE - 1) / PAGESIZE);
-+				 (global_len + pagesize - 1) / pagesize);
- 
- 	SAFE_CLOSE(cleanup, fd);
- }
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch b/meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
deleted file mode 100644
index 1b5b93a..0000000
--- a/meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 2b9be924bbad8a1f84ae553fdd1aa8391aa8d2f4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 20:15:07 +0000
-Subject: [PATCH 16/32] ustat: Change header from ustat.h to sys/ustat.h
-
-makes it portable for musl, on glibc ustat.h is just including
-sys/ustat.h too
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/syscalls/ustat/ustat01.c | 2 +-
- testcases/kernel/syscalls/ustat/ustat02.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/ustat/ustat01.c b/testcases/kernel/syscalls/ustat/ustat01.c
-index 01b7688..494647b 100644
---- a/testcases/kernel/syscalls/ustat/ustat01.c
-+++ b/testcases/kernel/syscalls/ustat/ustat01.c
-@@ -20,8 +20,8 @@
-  */
- 
- #include <unistd.h>
--#include <ustat.h>
- #include <errno.h>
-+#include <sys/ustat.h>
- #include <sys/types.h>
- #include <sys/stat.h>
- #include "test.h"
-diff --git a/testcases/kernel/syscalls/ustat/ustat02.c b/testcases/kernel/syscalls/ustat/ustat02.c
-index 4e66236..edada31 100644
---- a/testcases/kernel/syscalls/ustat/ustat02.c
-+++ b/testcases/kernel/syscalls/ustat/ustat02.c
-@@ -21,8 +21,8 @@
-  */
- 
- #include <unistd.h>
--#include <ustat.h>
- #include <errno.h>
-+#include <sys/ustat.h>
- #include <sys/stat.h>
- #include <sys/types.h>
- #include "test.h"
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-with-union-sigval.patch b/meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-with-union-sigval.patch
deleted file mode 100644
index ed25802..0000000
--- a/meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-with-union-sigval.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From c882bcd18820b44a685f0d5edd7aaff77a88c912 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 20:17:55 +0000
-Subject: [PATCH 17/32] replace sigval_t with union sigval
-
-This makes it compatible across musl and glibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c | 2 +-
- testcases/kernel/syscalls/timer_gettime/timer_gettime01.c       | 2 +-
- testcases/kernel/timers/timer_create/timer_create02.c           | 4 ++--
- testcases/kernel/timers/timer_create/timer_create03.c           | 4 ++--
- 4 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c b/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c
-index d186c1f..bc03544 100644
---- a/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c
-+++ b/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c
-@@ -54,7 +54,7 @@ int main(int ac, char **av)
- 
- 	setup();
- 
--	ev.sigev_value = (sigval_t) 0;
-+	ev.sigev_value = (union sigval) 0;
- 	ev.sigev_signo = SIGALRM;
- 	ev.sigev_notify = SIGEV_SIGNAL;
- 	TEST(ltp_syscall(__NR_timer_create, CLOCK_REALTIME, &ev, &timer));
-diff --git a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
-index b583aee..9371a6a 100644
---- a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
-+++ b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
-@@ -55,7 +55,7 @@ int main(int ac, char **av)
- 
- 	setup();
- 
--	ev.sigev_value = (sigval_t) 0;
-+	ev.sigev_value = (union sigval) 0;
- 	ev.sigev_signo = SIGALRM;
- 	ev.sigev_notify = SIGEV_SIGNAL;
- 	TEST(ltp_syscall(__NR_timer_create, CLOCK_REALTIME, &ev, &timer));
-diff --git a/testcases/kernel/timers/timer_create/timer_create02.c b/testcases/kernel/timers/timer_create/timer_create02.c
-index 7f528ed..1127400 100644
---- a/testcases/kernel/timers/timer_create/timer_create02.c
-+++ b/testcases/kernel/timers/timer_create/timer_create02.c
-@@ -142,7 +142,7 @@ void setup_test(int option)
- {
- 	switch (option) {
- 	case 0:
--		evp.sigev_value = (sigval_t) 0;
-+		evp.sigev_value = (union sigval) 0;
- 		evp.sigev_signo = SIGALRM;
- 		evp.sigev_notify = SIGEV_SIGNAL;
- 		evp_ptr = &evp;
-@@ -151,7 +151,7 @@ void setup_test(int option)
- 		evp_ptr = NULL;
- 		break;
- 	case 2:
--		evp.sigev_value = (sigval_t) 0;
-+		evp.sigev_value = (union sigval) 0;
- 		evp.sigev_signo = SIGALRM;	/* any will do */
- 		evp.sigev_notify = SIGEV_NONE;
- 		evp_ptr = &evp;
-diff --git a/testcases/kernel/timers/timer_create/timer_create03.c b/testcases/kernel/timers/timer_create/timer_create03.c
-index 291fcfa..8b01bf7 100644
---- a/testcases/kernel/timers/timer_create/timer_create03.c
-+++ b/testcases/kernel/timers/timer_create/timer_create03.c
-@@ -129,7 +129,7 @@ void setup_test(int option)
- {
- 	switch (option) {
- 	case 0:
--		evp.sigev_value = (sigval_t) 0;
-+		evp.sigev_value = (union sigval) 0;
- 		evp.sigev_signo = SIGALRM;
- 		evp.sigev_notify = SIGEV_SIGNAL;
- 		evp_ptr = &evp;
-@@ -138,7 +138,7 @@ void setup_test(int option)
- 		evp_ptr = NULL;
- 		break;
- 	case 2:
--		evp.sigev_value = (sigval_t) 0;
-+		evp.sigev_value = (union sigval) 0;
- 		evp.sigev_signo = SIGALRM;	/* any will do */
- 		evp.sigev_notify = SIGEV_NONE;
- 		evp_ptr = &evp;
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch b/meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
deleted file mode 100644
index 0a4c5f0..0000000
--- a/meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 721e94985b9cff3e2724af7ea5be7d005bc12dec Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 06:55:27 +0000
-Subject: [PATCH 19/32] tomoyo: Replace canonicalize_file_name() with
- realpath()
-
-canonicalize_file_name() API is specific to glibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c b/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
-index da4af0f..5c1a3ca 100644
---- a/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
-+++ b/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
-@@ -274,9 +274,9 @@ int main(int argc, char *argv[])
- 	/* Test mount(). */
- 	{
- 		static char buf[4096];
--		char *dev_ram_path = canonicalize_file_name("/dev/ram0");
-+		char *dev_ram_path = realpath("/dev/ram0", NULL);
- 		if (!dev_ram_path)
--			dev_ram_path = canonicalize_file_name("/dev/ram");
-+			dev_ram_path = realpath("/dev/ram", NULL);
- 		if (!dev_ram_path) {
- 			dev_ram_path = "/dev/ram0";
- 			mknod(dev_ram_path, S_IFBLK, MKDEV(1, 0));
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0022-include-sys-types.h.patch b/meta/recipes-extended/ltp/ltp/0022-include-sys-types.h.patch
deleted file mode 100644
index 413b44a..0000000
--- a/meta/recipes-extended/ltp/ltp/0022-include-sys-types.h.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 7ac6fd51991ac61d1d7594f601d87842060ee284 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 07:06:11 +0000
-Subject: [PATCH 22/32] include sys/types.h
-
-Fixes
-
-error: unknown type name 'uint'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/ipc/ipc_stress/shmem_test_04.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/testcases/kernel/ipc/ipc_stress/shmem_test_04.c b/testcases/kernel/ipc/ipc_stress/shmem_test_04.c
-index 72c2e60..e7e5f61 100644
---- a/testcases/kernel/ipc/ipc_stress/shmem_test_04.c
-+++ b/testcases/kernel/ipc/ipc_stress/shmem_test_04.c
-@@ -65,6 +65,7 @@
- #include <signal.h>
- #include <stdint.h>
- #include <sys/mman.h>
-+#include <sys/types.h>
- 
- #ifdef _LINUX_
- typedef unsigned long ulong_t;
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch b/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
deleted file mode 100644
index b47d097..0000000
--- a/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 4a74b275acc8158850f2500928a1467c3482c986 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 07:23:11 +0000
-Subject: [PATCH 27/32] sysconf01: Use _SC_2_C_VERSION conditionally
-
-_SC_2_C_VERSION is not available on musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/syscalls/sysconf/sysconf01.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/testcases/kernel/syscalls/sysconf/sysconf01.c b/testcases/kernel/syscalls/sysconf/sysconf01.c
-index 8542e77..e806943 100644
---- a/testcases/kernel/syscalls/sysconf/sysconf01.c
-+++ b/testcases/kernel/syscalls/sysconf/sysconf01.c
-@@ -102,7 +102,9 @@ int main(void)
- 	test_sysconf(_SC_ATEXIT_MAX);
- 	test_sysconf(_SC_2_C_BIND);
- 	test_sysconf(_SC_2_C_DEV);
-+#ifdef __GLIBC__
- 	test_sysconf(_SC_2_C_VERSION);
-+#endif
- 	/* 21 - 25 */
- 	test_sysconf(_SC_2_CHAR_TERM);
- 	test_sysconf(_SC_2_FORT_DEV);
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch b/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
deleted file mode 100644
index fc82ff9..0000000
--- a/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 94557fb7e1293c61145c959b8c5ffecf4a2b1069 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 07:24:44 +0000
-Subject: [PATCH 28/32] rt_sigaction.h: Use sighandler_t instead of
- __sighandler_t
-
-When _GNU_SOURCE is used then both typedefs are same and using
-sighandler_t makes it work on musl too
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/lapi/rt_sigaction.h                      | 2 +-
- testcases/kernel/syscalls/rt_sigsuspend/Makefile | 3 +++
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/include/lapi/rt_sigaction.h b/include/lapi/rt_sigaction.h
-index 3a5a763..870918c 100644
---- a/include/lapi/rt_sigaction.h
-+++ b/include/lapi/rt_sigaction.h
-@@ -34,7 +34,7 @@
- #define INVAL_SA_PTR ((void *)-1)
- 
- struct kernel_sigaction {
--	__sighandler_t k_sa_handler;
-+	sighandler_t k_sa_handler;
- 	unsigned long sa_flags;
- 	void (*sa_restorer) (void);
- 	sigset_t sa_mask;
-diff --git a/testcases/kernel/syscalls/rt_sigsuspend/Makefile b/testcases/kernel/syscalls/rt_sigsuspend/Makefile
-index 37bc3a9..2ca7f7c 100644
---- a/testcases/kernel/syscalls/rt_sigsuspend/Makefile
-+++ b/testcases/kernel/syscalls/rt_sigsuspend/Makefile
-@@ -19,4 +19,7 @@
- top_srcdir		?= ../../../..
- 
- include $(top_srcdir)/include/mk/testcases.mk
-+
-+CFLAGS	+= -D_GNU_SOURCE
-+
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0029-trace_shed-Fix-build-with-musl.patch b/meta/recipes-extended/ltp/ltp/0029-trace_shed-Fix-build-with-musl.patch
deleted file mode 100644
index f7ece9e..0000000
--- a/meta/recipes-extended/ltp/ltp/0029-trace_shed-Fix-build-with-musl.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 2f8a57f66a94210d34dd0361659a8297cf3d813f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 07:29:24 +0000
-Subject: [PATCH 29/32] trace_shed: Fix build with musl
-
-Errors on musl are
-
-trace_sched.c:425:16: error: invalid operands to binary & (have
-'thread_sched_t * {aka struct <anonymous> *}' and 'int')
-      thrd_ndx, WEXITSTATUS(status));
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/sched/tool/trace_sched.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/sched/tool/trace_sched.c b/testcases/kernel/sched/tool/trace_sched.c
-index 7815686..30dca5f 100644
---- a/testcases/kernel/sched/tool/trace_sched.c
-+++ b/testcases/kernel/sched/tool/trace_sched.c
-@@ -422,7 +422,7 @@ int main(int argc,		/* number of input parameters.                        */
- 			if (status == (thread_sched_t *) - 1) {
- 				fprintf(stderr,
- 					"thread [%d] - process exited with errors %d\n",
--					thrd_ndx, WEXITSTATUS(status));
-+					thrd_ndx, WEXITSTATUS((int)status));
- 				exit(-1);
- 			} else {
- 				exp_prio[thrd_ndx] = status->exp_prio;
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch b/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
deleted file mode 100644
index d2d6d76..0000000
--- a/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 77c95dacffe90382a1f131c801ac569120d95949 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 07:32:24 +0000
-Subject: [PATCH 30/32] lib: Use PTHREAD_MUTEX_RECURSIVE in place of
- PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP for non-glibc
-
-e.g. musl does not implement the _NP mutex types
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/tst_res.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/lib/tst_res.c b/lib/tst_res.c
-index 5c1c58c..3244b5e 100644
---- a/lib/tst_res.c
-+++ b/lib/tst_res.c
-@@ -104,8 +104,11 @@ int TEST_ERRNO;
- 	assert(strlen(buf) > 0);		\
- } while (0)
- 
-+#ifdef __GLIBC__
- static pthread_mutex_t tmutex = PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP;
--
-+#else
-+static pthread_mutex_t tmutex = {  PTHREAD_MUTEX_RECURSIVE };
-+#endif
- /*
-  * Define local function prototypes.
-  */
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch b/meta/recipes-extended/ltp/ltp/0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch
deleted file mode 100644
index 473ca4c..0000000
--- a/meta/recipes-extended/ltp/ltp/0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 293ff1da06748ed4c69be6ece262d42e562e7298 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 07:36:19 +0000
-Subject: [PATCH 31/32] vma03: fix page size offset as per page size alignment
-
-the offset the param of mmap2() doesn't align the page size, but,
-this param allow must be a multiple of the page size as returned
-by sysconf(_SC_PAGE_SIZE).meanwhile offset * 4096 must be a
-multiple of the system page size, so modify the input param of offset
-pgoff = (ULONG_MAX - 1)&(~((pgsz-1)>>12));
-
-Signed-off-by: Chuang Dong <Chuang.Dong@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/mem/vma/vma03.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/mem/vma/vma03.c b/testcases/kernel/mem/vma/vma03.c
-index ad8a7b4..a539233 100644
---- a/testcases/kernel/mem/vma/vma03.c
-+++ b/testcases/kernel/mem/vma/vma03.c
-@@ -85,7 +85,7 @@ int main(int argc, char *argv[])
- 		if (fd == -1)
- 			tst_brkm(TBROK | TERRNO, NULL, "open %s", TESTFILE);
- 
--		pgoff = ULONG_MAX - 1;
-+		pgoff = (ULONG_MAX - 1)&(~((pgsz-1)>>12));
- 		map = mmap2(NULL, pgsz, PROT_READ | PROT_WRITE, MAP_PRIVATE,
- 			    fd, pgoff);
- 		if (map == MAP_FAILED)
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-unistd.h-explicitly.patch b/meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-unistd.h-explicitly.patch
deleted file mode 100644
index 5c6bf91..0000000
--- a/meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-unistd.h-explicitly.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 4f1905ff09c730091674818bd1b48ee221347101 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 08:30:29 +0000
-Subject: [PATCH 32/32] regen.sh: Include asm/unistd.h explicitly
-
-on musl this is not included indirectly and it results in errors like
-testcases/kernel/include/linux_syscall_numbers.h:1035:25: error:
-'__NR_SYSCALL_BASE' undeclared (first use in this function)
-|  #  define __NR_readdir (__NR_SYSCALL_BASE+ 89)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/include/regen.sh | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/testcases/kernel/include/regen.sh b/testcases/kernel/include/regen.sh
-index f93f49b..ee790af 100755
---- a/testcases/kernel/include/regen.sh
-+++ b/testcases/kernel/include/regen.sh
-@@ -32,6 +32,7 @@ cat << EOF > "${output_pid}"
- 
- #include <errno.h>
- #include <sys/syscall.h>
-+#include <asm/unistd.h>
- #include "cleanup.c"
- 
- #define ltp_syscall(NR, ...) ({ \\
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch b/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch
deleted file mode 100644
index 32ae8aa..0000000
--- a/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Fix test_proc_kill hanging
-
-Sometimes the signal is delivered to memcg_process before the framework took
-into consideration its pid entered in the tasks. Fixed by delaying the signal
-send command.
-
-Signed-off-by: George Nita <george.nita@enea.com>
-Upstream-Status: Pending 
-
-diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
-index ffbe006..e81bf74 100755
---- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
-+++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
-@@ -220,8 +220,8 @@ test_proc_kill()
- 
- 	$TEST_PATH/memcg_process $2 -s $3 &
- 	pid=$!
--	sleep 1
- 	echo $pid > tasks
-+	sleep 1
- 
- 	kill -s USR1 $pid 2> /dev/null
- 	sleep 1
diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb b/meta/recipes-extended/ltp/ltp_20160126.bb
deleted file mode 100644
index 7ee84e3..0000000
--- a/meta/recipes-extended/ltp/ltp_20160126.bb
+++ /dev/null
@@ -1,118 +0,0 @@
-SUMMARY = "Linux Test Project"
-DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, and Bull with a goal to deliver test suites to the open source community that validate the reliability, robustness, and stability of Linux. The Linux Test Project is a collection of tools for testing the Linux kernel and related features."
-HOMEPAGE = "http://ltp.sourceforge.net"
-SECTION = "console/utils"
-LICENSE = "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
-LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-    file://testcases/kernel/controllers/freezer/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-    file://testcases/kernel/controllers/freezer/run_freezer.sh;beginline=5;endline=17;md5=86a61d2c042d59836ffb353a21456498 \
-    file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
-    file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
-    file://testcases/open_posix_testsuite/COPYING;md5=216e43b72efbe4ed9017cc19c4c68b01 \
-    file://testcases/realtime/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
-    file://tools/netpipe-2.4/COPYING;md5=9e3781bb5fe787aa80e1f51f5006b6fa \
-    file://tools/netpipe-2.4-ipv6/COPYING;md5=9e3781bb5fe787aa80e1f51f5006b6fa \
-    file://tools/top-LTP/proc/COPYING;md5=aefc88eb8a41672fbfcfe6b69ab8c49c \
-    file://tools/pounder21/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-    file://utils/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
-"
-
-DEPENDS = "attr libaio libcap acl openssl zip-native"
-DEPENDS_append_libc-musl = " fts "
-EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
-CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
-CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "fce797676b14f50406718e7ef640b50da66c9b36"
-
-SRC_URI = "git://github.com/linux-test-project/ltp.git \
-           file://0001-ltp-Don-t-link-against-libfl.patch \
-           file://0002-Add-knob-to-control-whether-numa-support-should-be-c.patch \
-           file://0003-Add-knob-to-control-tirpc-support.patch \
-           file://0004-build-Add-option-to-select-libc-implementation.patch \
-           file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch \
-           file://0006-sendfile-Use-off64_t-instead-of-__off64_t.patch \
-           file://0007-replace-SIGCLD-with-SIGCHLD.patch \
-           file://0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch \
-           file://0009-Guard-error.h-with-__GLIBC__.patch \
-           file://0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch \
-           file://0011-Rename-sigset-variable-to-sigset1.patch \
-           file://0012-fsstress.c-Replace-__int64_t-with-int64_t.patch \
-           file://0013-include-fcntl.h-for-getting-O_-definitions.patch \
-           file://0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch \
-           file://0015-mincore01-Rename-PAGESIZE-to-pagesize.patch \
-           file://0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch \
-           file://0017-replace-sigval_t-with-union-sigval.patch \
-           file://0018-guard-mallocopt-with-__GLIBC__.patch \
-           file://0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch \
-           file://0020-getdents-define-getdents-getdents64-only-for-glibc.patch \
-           file://0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch \
-           file://0022-include-sys-types.h.patch \
-           file://0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch \
-           file://0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch \
-           file://0025-mc_gethost-include-sys-types.h.patch \
-           file://0026-crash01-Define-_GNU_SOURCE.patch \
-           file://0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch \
-           file://0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch \
-           file://0029-trace_shed-Fix-build-with-musl.patch \
-           file://0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch \
-           file://0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch \
-           file://0032-regen.sh-Include-asm-unistd.h-explicitly.patch \
-           file://0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch \
-           file://0034-periodic_output.patch \
-           file://0035-fix-test_proc_kill-hang.patch \
-           file://0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
-           "
-
-S = "${WORKDIR}/git"
-
-inherit autotools-brokensep
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-export prefix = "/opt/ltp"
-export exec_prefix = "/opt/ltp"
-
-PACKAGECONFIG[numa] = "--with-numa, --without-numa, numactl,"
-EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
-EXTRA_OECONF = " --with-power-management-testsuite --with-realtime-testsuite "
-# ltp network/rpc test cases ftbfs when libtirpc is found
-EXTRA_OECONF += " --without-tirpc "
-
-# The makefiles make excessive use of make -C and several include testcases.mk
-# which triggers a build of the syscall header. To reproduce, build ltp,
-# then delete the header, then "make -j XX" and watch regen.sh run multiple
-# times. Its easier to generate this once here instead.
-do_compile_prepend () {
-	( make -C ${B}/testcases/kernel include/linux_syscall_numbers.h )
-}
-
-do_install(){
-    install -d ${D}/opt/ltp/
-    oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
-
-    # fixup not deploy STPfailure_report.pl to avoid confusing about it fails to run
-    # as it lacks dependency on some perl moudle such as LWP::Simple
-    # And this script previously works as a tool for analyzing failures from LTP
-    # runs on the OSDL's Scaleable Test Platform (STP) and it mainly accesses
-    # http://khack.osdl.org to retrieve ltp test results run on
-    # OSDL's Scaleable Test Platform, but now http://khack.osdl.org unaccessible
-    rm -rf ${D}/opt/ltp/bin/STPfailure_report.pl
-
-    # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
-    cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
-}
-
-RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect ldd"
-
-FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
-
-FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testcases/open_posix_testsuite/tools/*"
-
-# Avoid generated binaries stripping. Otherwise some of the ltp tests such as ldd01 & nm01 fails
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-# However, test_arch_stripped is already stripped, so...
-INSANE_SKIP_${PN} += "already-stripped"
-
-- 
2.7.4




