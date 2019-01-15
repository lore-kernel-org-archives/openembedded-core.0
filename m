Return-Path: <petr.vorel@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 186A37C07B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 21:23:06 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id b3so3810574ede.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 13:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O7cAtGdsbNmgs9fFFzKmUNd2JMKad4tRE3wlSCTp1Z8=;
	b=hwWEz/W5dD+EH+jGa2613zov6mdHV6t98aCkehwOwuaxDAQndh+E016j15Q5uHPYTE
	ill9uJqqTEQiDDCS4m7qo84MlZJLAkKWXL6xsq7SejEZAI60zzOK3tymRauDjcvN/D6d
	I38VQjQ1zTKDwW1rc4euGneK0xeQGkx9gdOI4V9smRuWwql2T2OPveUlTrMm1TJMG0RQ
	kVi8L5oN8hOOTz2iXy7KdttoVm17GpZNvMoTOprLhYfzhotU9M5Np2xEdu9HB1Yba/Jg
	VeTWzEwDgkUeoKfDBCxXo8tXK24lgIZW0s22HCjupM3ij46tCC/dT/Fsq3zrIP9PEENA
	8zOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O7cAtGdsbNmgs9fFFzKmUNd2JMKad4tRE3wlSCTp1Z8=;
	b=HgrkqWXSrdwOWNXAxvOfequyPFEKee55c1rPhnHmdSJZEyVj4GlddAU6S6nwhDjPHm
	hUKIGRMk2CAobMKw6yajICWlGYFWUD2OVsdMRwfcz5zl4Ky5b2C7xAoyTtsrtTBHHbQd
	x1luOVGxQae3dxBlV2ZnJlqy3iTXQDSgM9+mVPAqIlob+qaeZZljpeJ8yqewsXaGzSwA
	f3fetT4E/4GS9hI+xHMNFXcbh89FDRSUXlj6CoSexQxRBDvHuR9ENjmCZGQIeHplos3V
	pa4Bpt/s/IRDDfKugEriaeD6EmcHxIRCQzXTqguV4o2uo8Wd6ddjxghs84zdJCW/cgQ7
	O7jA==
X-Gm-Message-State: AJcUukd5vg+tL+X4ExWqJVhXmnEfV5jfgKvxMMMZ1Y46/0iz4XfuaI3g
	7vLGT/jC87J4WQgAHM6pTn05SYLS
X-Google-Smtp-Source: ALg8bN70Cm8+raQxGIwFna0JmTCjAs5Bnbs3KeT3b3vwh8ixJlnnirVw/Reu1IJjT0qyQM6aicCBUA==
X-Received: by 2002:a17:906:a984:: with SMTP id
	jr4-v6mr4455480ejb.90.1547587386739; 
	Tue, 15 Jan 2019 13:23:06 -0800 (PST)
Received: from dell5510.suse.cz ([62.201.25.198])
	by smtp.gmail.com with ESMTPSA id
	j23sm4924663edr.89.2019.01.15.13.23.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 13:23:05 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 22:22:56 +0100
Message-Id: <20190115212256.14404-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [PATCH 1/1] ltp: Update to 20190115
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
X-List-Received-Date: Tue, 15 Jan 2019 21:23:07 -0000
Content-Transfer-Encoding: 8bit

Removed patches (accepted in upstream)
* 0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
* 0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch
* 0001-setrlimit05-Use-another-method-to-get-bad-address.patch
* 0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
* 0001-statx-fix-compile-errors.patch
* 0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch
(accepted v2 version, see http://lists.linux.it/pipermail/ltp/2018-October/009691.html)

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...getcpu-to-avoid-conflict-with-glibc-.patch |  57 ------
 ...use-ping-6-when-ping6-is-not-avaliab.patch |  45 -----
 ...se-another-method-to-get-bad-address.patch |  61 ------
 ...-recent-glibc-calls-syscall-directly.patch |  75 -------
 .../ltp/0001-statx-fix-compile-errors.patch   |  35 ----
 ...ake-OFD-command-use-fcntl64-syscall-.patch | 184 ------------------
 .../ltp/{ltp_20180926.bb => ltp_20190115.bb}  |   6 -
 7 files changed, 463 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-statx-fix-compile-errors.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch
 rename meta/recipes-extended/ltp/{ltp_20180926.bb => ltp_20190115.bb} (92%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch b/meta/recipes-extended/ltp/ltp/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
deleted file mode 100644
index d0c847774d..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From c9edb0eaaca83c18ac7b5ea3330faad8d47d3fd1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 14 Dec 2018 06:44:02 -0800
-Subject: [PATCH] getcpu01: Rename getcpu to avoid conflict with glibc >= 2.29
-
-glibc has added getcpu() API starting with glibc 2.29 release, this
-makes the static function in conflict and signatures are not same as
-well.
-
-Renaming helps to keep ltp build going
-
-Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2018-December/010321.html]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/kernel/syscalls/getcpu/getcpu01.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/getcpu/getcpu01.c b/testcases/kernel/syscalls/getcpu/getcpu01.c
-index c927512ca..e850fe844 100644
---- a/testcases/kernel/syscalls/getcpu/getcpu01.c
-+++ b/testcases/kernel/syscalls/getcpu/getcpu01.c
-@@ -82,7 +82,7 @@ int sys_support = 0;
- 
- void cleanup(void);
- void setup(void);
--static inline int getcpu(unsigned int *, unsigned int *, void *);
-+static inline int get_cpu(unsigned int *, unsigned int *, void *);
- unsigned int set_cpu_affinity(void);
- unsigned int get_nodeid(unsigned int);
- unsigned int max_cpuid(size_t, cpu_set_t *);
-@@ -124,7 +124,7 @@ int main(int ac, char **av)
- #ifdef __i386__
- 		node_set = get_nodeid(cpu_set);
- #endif
--		TEST(getcpu(&cpu_id, &node_id, NULL));
-+		TEST(get_cpu(&cpu_id, &node_id, NULL));
- 		if (TEST_RETURN == 0) {
- 			if (cpu_id != cpu_set) {
- 				tst_resm(TFAIL, "getcpu() returned wrong value"
-@@ -157,10 +157,10 @@ int main(int ac, char **av)
- }
- 
- /*
-- * getcpu() - calls the system call
-+ * get_cpu() - calls the system call
-  */
--static inline int getcpu(unsigned *cpu_id, unsigned *node_id,
--			 void *cache_struct)
-+static inline int get_cpu(unsigned *cpu_id, unsigned *node_id,
-+			  void *cache_struct)
- {
- #if defined(__i386__)
- 	return syscall(318, cpu_id, node_id, cache_struct);
--- 
-2.20.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch b/meta/recipes-extended/ltp/ltp/0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch
deleted file mode 100644
index 32e7a0eb25..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 76d8343ad300f6507233abcdf97629290e35848a Mon Sep 17 00:00:00 2001
-From: Lei Yang <Lei.Yang@windriver.com>
-Date: Wed, 29 Aug 2018 11:51:24 +0800
-Subject: [PATCH] netns_helper.sh: use 'ping -6' when ping6 is not avaliable
-
-ping6 has been merged into ping since 2015 by using "ping -6"
-in some distributions (e.g. OpenEmbedded) they dropped ping6 completely
-this patch will let both "ping -6" and ping6 work.
-
-[pvorel: change was done in s20150815:
-ebad35f ("ping: merge `ping6` command into `ping`"),
-before that release switch '-6' didn't exist.
-Upstream leaves ping6 symlink to distributions.]
-
-Upstream-Status: Backport
-[https://github.com/linux-test-project/ltp/commit/76d8343ad300f6507233abcdf97629290e35848a]
-
-Signed-off-by: Lei Yang <Lei.Yang@windriver.com>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- testcases/kernel/containers/netns/netns_helper.sh | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/containers/netns/netns_helper.sh b/testcases/kernel/containers/netns/netns_helper.sh
-index 6aea10b..a9d0459 100755
---- a/testcases/kernel/containers/netns/netns_helper.sh
-+++ b/testcases/kernel/containers/netns/netns_helper.sh
-@@ -168,7 +168,12 @@ netns_setup()
- 	ipv6)
- 		IFCONF_IN6_ARG="inet6 add"
- 		IP0=$6; IP1=$7;
--		tping="ping6"; NETMASK=64
-+		if which ping6 >/dev/null 2>&1; then
-+		    tping="ping6"
-+		else
-+		    tping="ping -6"
-+		fi
-+		NETMASK=64
- 		;;
- 	*)
- 		tst_brkm TBROK "second argument must be an ip version (ipv4|ipv6)"
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch b/meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch
deleted file mode 100644
index 4bfe2767d8..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From c4d02b23d12b7136b5739b3075e817fc037e41d4 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Mon, 19 Nov 2018 23:07:01 -0800
-Subject: [PATCH] setrlimit05: Use another method to get bad address
-
-This testcase fails on mips32. The process is killed by SIGBUS which
-is not as expect.
-
-This is because:
-((void *)-1) is not a legal bad address which causes the process
-killed by SIGBUG on mips.
-
-'tst_get_bad_addr()' returns an address that should works on mips
-and other arches.
-
-Upstream-Status: Accepted [80bed467bc6ab48a6cd88a8ab74ca15d08830cb0]
-
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
----
- testcases/kernel/syscalls/setrlimit/setrlimit05.c | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/setrlimit/setrlimit05.c b/testcases/kernel/syscalls/setrlimit/setrlimit05.c
-index e7167229b4..004a149a65 100644
---- a/testcases/kernel/syscalls/setrlimit/setrlimit05.c
-+++ b/testcases/kernel/syscalls/setrlimit/setrlimit05.c
-@@ -26,6 +26,8 @@
- 
- #include "tst_test.h"
- 
-+static void *bad_addr;
-+
- static void verify_setrlimit(void)
- {
- 	int status;
-@@ -33,7 +35,7 @@ static void verify_setrlimit(void)
- 
- 	pid = SAFE_FORK();
- 	if (!pid) {
--		TEST(setrlimit(RLIMIT_NOFILE, (void *) -1));
-+		TEST(setrlimit(RLIMIT_NOFILE, bad_addr));
- 		if (TST_RET != -1) {
- 			tst_res(TFAIL, "setrlimit()  succeeded unexpectedly");
- 			exit(0);
-@@ -67,7 +69,13 @@ static void verify_setrlimit(void)
- 	tst_res(TBROK, "child %s", tst_strstatus(status));
- }
- 
-+static void setup(void)
-+{
-+	bad_addr = tst_get_bad_addr(NULL);
-+}
-+
- static struct tst_test test = {
- 	.test_all = verify_setrlimit,
- 	.forks_child = 1,
-+	.setup = setup,
- };
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch b/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
deleted file mode 100644
index c412c89e99..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From bb977ca0716ae98f10102c7122fe15bc0ddb5356 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Thu, 20 Sep 2018 21:49:02 -0400
-Subject: [PATCH] sigwaitinfo01: recent glibc calls syscall directly
-
-glibc commit
-  8b0e795aaa44 ("Simplify Linux sig{timed}wait{info} implementations")
-changed sigwaitinfo to call sigtimedwait, which calls rt_sigtimedwait
-syscall directly.
-
-So, an invalid pointer no longer crashes child process and test
-reports failure. Fix it by accepting either crash or EFAULT.
-
-Signed-off-by: Jan Stancek <jstancek@redhat.com>
-
-Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2018-September/009338.html]
-
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
----
- .../kernel/syscalls/sigwaitinfo/sigwaitinfo01.c    | 30 +++++++++++++++++++---
- 1 file changed, 26 insertions(+), 4 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
-index 95a9436a4..8fa8ac34b 100644
---- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
-+++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
-@@ -371,19 +371,41 @@ void test_bad_address2(swi_func sigwaitinfo, int signo)
- 		tst_brkm(TBROK | TERRNO, NULL, "fork() failed");
- 	case 0:
- 		signal(SIGSEGV, SIG_DFL);
-+
-+       /*
-+        * depending on glibc implementation we should
-+        * either crash or get EFAULT
-+        */
- 		TEST(sigwaitinfo((void *)1, NULL, NULL));
- 
--		_exit(0);
-+       if (TEST_RETURN == -1 && TEST_ERRNO == EFAULT)
-+           _exit(0);
-+
-+       tst_resm(TINFO, "swi_func returned: %ld, errno: %d",
-+           TEST_RETURN, TEST_ERRNO);
-+       _exit(1);
-+
- 		break;
- 	default:
- 		break;
- 	}
- 
- 	SUCCEED_OR_DIE(waitpid, "waitpid failed", pid, &status, 0);
--	if (WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV)
-+
-+   if ((WIFSIGNALED(status) && WTERMSIG(status) == SIGSEGV)
-+       || (WIFEXITED(status) && WEXITSTATUS(status) == 0)) {
- 		tst_resm(TPASS, "Test passed");
--	else
--		tst_resm(TFAIL, "Unrecognised child exit code");
-+       return;
-+   }
-+
-+   if (WIFEXITED(status)) {
-+       tst_resm(TFAIL, "Unrecognised child exit code: %d",
-+           WEXITSTATUS(status));
-+   }
-+   if (WIFSIGNALED(status)) {
-+       tst_resm(TFAIL, "Unrecognised child termsig: %d",
-+           WTERMSIG(status));
-+   }
- }
- 
- void test_bad_address3(swi_func sigwaitinfo, int signo)
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-statx-fix-compile-errors.patch b/meta/recipes-extended/ltp/ltp/0001-statx-fix-compile-errors.patch
deleted file mode 100644
index 140bfeb879..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-statx-fix-compile-errors.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a945304b6a2286d0665c70250cc5475eb07fd21e Mon Sep 17 00:00:00 2001
-From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
-Date: Wed, 26 Sep 2018 11:15:45 -0300
-Subject: [PATCH] statx: fix compile errors
-
-struct statx is only defined in sys/stat.h when _GNU_SOURCE is defined.
-The testcases do define _GNU_SOURCE, but not the m4 struct check.
-
-Upstream-Status: Backport
-Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
-Acked-by: Cyril Hrubis <chrubis@suse.cz>
----
- m4/ltp-statx.m4 | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/m4/ltp-statx.m4 b/m4/ltp-statx.m4
-index 44303d30c..5f79a94cd 100644
---- a/m4/ltp-statx.m4
-+++ b/m4/ltp-statx.m4
-@@ -23,6 +23,11 @@ dnl
- AC_DEFUN([LTP_CHECK_STATX],[
- AC_CHECK_FUNCS(statx,,,[[#include <sys/stat.h>]])
- AC_CHECK_HEADER(linux/fs.h,,,)
--AC_CHECK_TYPES([struct statx],,,[[#include <sys/stat.h>]])
--AC_CHECK_TYPES([struct statx_timestamp],,,[[#include <sys/stat.h>]])
-+AC_CHECK_TYPES([struct statx],,,[[
-+	#define _GNU_SOURCE
-+	#include <sys/stat.h>
-+]])
-+AC_CHECK_TYPES([struct statx_timestamp],,,[[
-+	#define _GNU_SOURCE
-+	#include <sys/stat.h>]])
- ])
---
-2.19.1
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch
deleted file mode 100644
index 2755596d03..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch
+++ /dev/null
@@ -1,184 +0,0 @@
-From 8de03ea1200480b922d5ba05b69dc94db60496f5 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Sat, 15 Sep 2018 22:39:32 -0400
-Subject: [PATCH] syscalls/fcntl: make OFD command use fcntl64() syscall on
- 32-bit
-
-To cope with glibc commit:
-  06ab719d30b0 ("Fix Linux fcntl OFD locks for non-LFS architectures
-(BZ#20251)")
-
-WIP: Still need to test this with new glibc.
-     Test with old glibc look OK so far.
-
-Signed-off-by: Jan Stancek <jstancek@redhat.com>
-
-Upstream-Status: Backport
-    Backported from upstream maillist
-    https://lists.linux.it/pipermail/ltp/2018-September/009370.html
-
-Signed-off-by: Hongzhi Song <hongzhi.song@windriver.com>
----
- testcases/kernel/syscalls/fcntl/fcntl34.c      | 12 +++++++---
- testcases/kernel/syscalls/fcntl/fcntl36.c      | 23 +++++++++++++-----
- testcases/kernel/syscalls/fcntl/fcntl_common.h | 32 ++++++++++++++++++++++++++
- 3 files changed, 58 insertions(+), 9 deletions(-)
- create mode 100644 testcases/kernel/syscalls/fcntl/fcntl_common.h
-
-diff --git a/testcases/kernel/syscalls/fcntl/fcntl34.c b/testcases/kernel/syscalls/fcntl/fcntl34.c
-index aa29cf9..109f834 100644
---- a/testcases/kernel/syscalls/fcntl/fcntl34.c
-+++ b/testcases/kernel/syscalls/fcntl/fcntl34.c
-@@ -28,6 +28,7 @@
- #include "lapi/fcntl.h"
- #include "tst_safe_pthread.h"
- #include "tst_test.h"
-+#include "fcntl_common.h"
- 
- static int thread_cnt;
- static const int max_thread_cnt = 32;
-@@ -68,7 +69,12 @@ void *thread_fn_01(void *arg)
- 
- 	memset(buf, (intptr_t)arg, write_size);
- 
--	struct flock64 lck = {
-+    /* see explanation in fcntl_common.h */
-+    #ifdef USE_STRUCT_FLOCK
-+        struct flock lck = {
-+    #else
-+        struct flock64 lck = {
-+    #endif
- 		.l_whence = SEEK_SET,
- 		.l_start  = 0,
- 		.l_len    = 1,
-@@ -76,13 +82,13 @@ void *thread_fn_01(void *arg)
- 
- 	for (i = 0; i < writes_num; ++i) {
- 		lck.l_type = F_WRLCK;
--		SAFE_FCNTL(fd, F_OFD_SETLKW, &lck);
-+        my_fcntl(fd, F_OFD_SETLKW, &lck);
- 
- 		SAFE_LSEEK(fd, 0, SEEK_END);
- 		SAFE_WRITE(1, fd, buf, write_size);
- 
- 		lck.l_type = F_UNLCK;
--		SAFE_FCNTL(fd, F_OFD_SETLKW, &lck);
-+        my_fcntl(fd, F_OFD_SETLKW, &lck);
- 
- 		sched_yield();
- 	}
-diff --git a/testcases/kernel/syscalls/fcntl/fcntl36.c b/testcases/kernel/syscalls/fcntl/fcntl36.c
-index 3246d13..f263b6b 100644
---- a/testcases/kernel/syscalls/fcntl/fcntl36.c
-+++ b/testcases/kernel/syscalls/fcntl/fcntl36.c
-@@ -57,6 +57,7 @@
- #include "lapi/fcntl.h"
- #include "tst_safe_pthread.h"
- #include "tst_test.h"
-+#include "fcntl_common.h"
- 
- static int thread_cnt;
- static int fail_flag = 0;
-@@ -87,7 +88,12 @@ static void *fn_ofd_w(void *arg)
- 	int fd = SAFE_OPEN(fname, O_RDWR);
- 	long wt = pa->cnt;
- 
--	struct flock64 lck = {
-+    /* see explanation in fcntl_common.h */
-+    #ifdef USE_STRUCT_FLOCK
-+        struct flock lck = {
-+    #else
-+        struct flock64 lck = {
-+    #endif
- 		.l_whence = SEEK_SET,
- 		.l_start  = pa->offset,
- 		.l_len    = pa->length,
-@@ -99,13 +105,13 @@ static void *fn_ofd_w(void *arg)
- 		memset(buf, wt, pa->length);
- 
- 		lck.l_type = F_WRLCK;
--		SAFE_FCNTL(fd, F_OFD_SETLKW, &lck);
-+        my_fcntl(fd, F_OFD_SETLKW, &lck);
- 
- 		SAFE_LSEEK(fd, pa->offset, SEEK_SET);
- 		SAFE_WRITE(1, fd, buf, pa->length);
- 
- 		lck.l_type = F_UNLCK;
--		SAFE_FCNTL(fd, F_OFD_SETLKW, &lck);
-+        my_fcntl(fd, F_OFD_SETLKW, &lck);
- 
- 		wt++;
- 		if (wt >= 255)
-@@ -166,7 +172,12 @@ static void *fn_ofd_r(void *arg)
- 	int i;
- 	int fd = SAFE_OPEN(fname, O_RDWR);
- 
--	struct flock64 lck = {
-+    /* see explanation in fcntl_common.h */
-+    #ifdef USE_STRUCT_FLOCK
-+        struct flock lck = {
-+    #else
-+        struct flock64 lck = {
-+    #endif
- 		.l_whence = SEEK_SET,
- 		.l_start  = pa->offset,
- 		.l_len    = pa->length,
-@@ -178,7 +189,7 @@ static void *fn_ofd_r(void *arg)
- 		memset(buf, 0, pa->length);
- 
- 		lck.l_type = F_RDLCK;
--		SAFE_FCNTL(fd, F_OFD_SETLKW, &lck);
-+        my_fcntl(fd, F_OFD_SETLKW, &lck);
- 
- 		/* rlock acquired */
- 		SAFE_LSEEK(fd, pa->offset, SEEK_SET);
-@@ -209,7 +220,7 @@ static void *fn_ofd_r(void *arg)
- 		}
- 
- 		lck.l_type = F_UNLCK;
--		SAFE_FCNTL(fd, F_OFD_SETLK, &lck);
-+        my_fcntl(fd, F_OFD_SETLK, &lck);
- 
- 		sched_yield();
- 	}
-diff --git a/testcases/kernel/syscalls/fcntl/fcntl_common.h b/testcases/kernel/syscalls/fcntl/fcntl_common.h
-new file mode 100644
-index 0000000..3fe399b
---- /dev/null
-+++ b/testcases/kernel/syscalls/fcntl/fcntl_common.h
-@@ -0,0 +1,32 @@
-+#include "lapi/syscalls.h"
-+
-+/*
-+ * glibc commit:
-+ *   06ab719d30b0 ("Fix Linux fcntl OFD locks for non-LFS architectures (BZ#20251)")
-+ * changed behavior of arg parameter for OFD commands. It is no
-+ * longer passing arg directly to syscall, but expects it to be
-+ * 'struct flock'.
-+ *
-+ * On 64-bit or _FILE_OFFSET_BITS == 64 we can use fcntl() and
-+ * struct flock with any glibc version. struct flock and flock64
-+ * should be identical.
-+ *
-+ * On 32-bit, older glibc would pass arg directly, recent one treats
-+ * it as 'struct flock' and converts it to 'struct flock64'.
-+ * So, for 32-bit we use fcntl64 syscall directly with struct flock64.
-+ */
-+#if __WORDSIZE == 64 || _FILE_OFFSET_BITS == 64
-+#define USE_STRUCT_FLOCK
-+static int my_fcntl(int fd, int cmd, void *lck)
-+{
-+        return SAFE_FCNTL(fd, cmd, lck);
-+}
-+#else
-+static int my_fcntl(int fd, int cmd, void *lck)
-+{
-+        int ret = tst_syscall(__NR_fcntl64, fd, cmd, lck);
-+        if (ret == -1)
-+                tst_brk(TBROK|TERRNO, "fcntl64");
-+        return ret;
-+}
-+#endif
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/ltp/ltp_20180926.bb b/meta/recipes-extended/ltp/ltp_20190115.bb
similarity index 92%
rename from meta/recipes-extended/ltp/ltp_20180926.bb
rename to meta/recipes-extended/ltp/ltp_20190115.bb
index 99e7023b25..6d26555a96 100644
--- a/meta/recipes-extended/ltp/ltp_20180926.bb
+++ b/meta/recipes-extended/ltp/ltp_20190115.bb
@@ -46,13 +46,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
-           file://0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch \
-           file://0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch \
-           file://0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch \
            file://0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
-           file://0001-statx-fix-compile-errors.patch \
-           file://0001-setrlimit05-Use-another-method-to-get-bad-address.patch \
-           file://0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.19.2


