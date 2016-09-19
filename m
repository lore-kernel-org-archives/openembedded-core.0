Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA9565D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 14:42:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8JEgYbo002924
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Sep 2016 07:42:35 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Sep 2016 07:42:33 -0700
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>,
	<openembedded-core@lists.openembedded.org>
References: <3e483970-9380-d055-b023-a4eac99e5d53@linux.intel.com>
	<1474266905-13042-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <8e16422a-70ed-0989-f53f-538b18aaeb17@windriver.com>
Date: Mon, 19 Sep 2016 10:42:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474266905-13042-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH v2] ltp: 20160126 -> 20160510
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
X-List-Received-Date: Mon, 19 Sep 2016 14:42:44 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-09-19 02:35 AM, Wang Xin wrote:
> 1) Upgrade ltp from 20160126 to 20160510.
> 2) Modify some patches, since the data has been changed.
>     0011-Rename-sigset-variable-to-sigset1.patch
>     0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
> 3) Delete some patches, since they are no use.
Do you mean that they are integrated upstream? If so
it would be useful to provide the commit ID so that
anyone who wants to confirm that dropping the patch
makes sense, doesn't have to reproduce the work you
have done to also confirm that.

If there's another reason that these patches are not
useful, please explain since I presume that we added
each patch for a good reason previously.

../Randy

>     0001-ltp-Don-t-link-against-libfl.patch
>     0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
>     0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
>     0013-include-fcntl.h-for-getting-O_-definitions.patch
>     0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
>     0015-mincore01-Rename-PAGESIZE-to-pagesize.patch
>     0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
>     0017-replace-sigval_t-with-union-sigval.patch
>     0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
>     0032-regen.sh-Include-asm-unistd.h-explicitly.patch
>
> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> ---
>  .../ltp/0001-ltp-Don-t-link-against-libfl.patch    |  30 --
>  ...sendfile-Use-off64_t-instead-of-__off64_t.patch |  31 --
>  .../0011-Rename-sigset-variable-to-sigset1.patch   |  60 ++--
>  ...fsstress.c-Replace-__int64_t-with-int64_t.patch | 351 ---------------------
>  ...nclude-fcntl.h-for-getting-O_-definitions.patch |  67 ----
>  ...ing-Include-sys-types.h-for-pid_t-definit.patch |  56 ----
>  ...015-mincore01-Rename-PAGESIZE-to-pagesize.patch |  64 ----
>  ...Change-header-from-ustat.h-to-sys-ustat.h.patch |  45 ---
>  .../0017-replace-sigval_t-with-union-sigval.patch  |  88 ------
>  ...lace-canonicalize_file_name-with-realpath.patch |  32 --
>  ...READ_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch |   6 +-
>  ...-regen.sh-Include-asm-unistd.h-explicitly.patch |  30 --
>  .../ltp/{ltp_20160126.bb => ltp_20160510.bb}       |  12 +-
>  13 files changed, 34 insertions(+), 838 deletions(-)
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0001-ltp-Don-t-link-against-libfl.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-getting-O_-definitions.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-PAGESIZE-to-pagesize.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-with-union-sigval.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-unistd.h-explicitly.patch
>  rename meta/recipes-extended/ltp/{ltp_20160126.bb => ltp_20160510.bb} (88%)
>
> diff --git a/meta/recipes-extended/ltp/ltp/0001-ltp-Don-t-link-against-libfl.patch b/meta/recipes-extended/ltp/ltp/0001-ltp-Don-t-link-against-libfl.patch
> deleted file mode 100644
> index 585b7cb..0000000
> --- a/meta/recipes-extended/ltp/ltp/0001-ltp-Don-t-link-against-libfl.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 14985fccf7428eaa0b45decc22bfd20fd780f621 Mon Sep 17 00:00:00 2001
> -From: Chong Lu <Chong.Lu@windriver.com>
> -Date: Tue, 11 Mar 2014 14:47:22 +0800
> -Subject: [PATCH 01/32] ltp: Don't link against libfl
> -
> -We have already defined yywrap function in scan.l file. After this, we no longer need to
> -link against libfl and so no longer get errors about undefined references to yylex.
> -
> -Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - pan/Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/pan/Makefile b/pan/Makefile
> -index 4cc6466..a4b575b 100644
> ---- a/pan/Makefile
> -+++ b/pan/Makefile
> -@@ -31,7 +31,7 @@ CPPFLAGS		+= -Wno-error
> -
> - CPPFLAGS		+= -I$(abs_srcdir)
> -
> --LDLIBS			+= -lm $(LEXLIB)
> -+LDLIBS			+= -lm
> -
> - LFLAGS			+= -l
> -
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-instead-of-__off64_t.patch b/meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
> deleted file mode 100644
> index 56a48ab..0000000
> --- a/meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From fb8b895385a641d74f2186fe5f20a872209692ed Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Jan 2016 18:24:20 +0000
> -Subject: [PATCH 06/32] sendfile: Use off64_t instead of __off64_t
> -
> -__off64_t is specific to glibc where as off64_t is widely available
> -Add _GNU_SOURCE for off64_t defines from sys/types.h
> -Fixes
> -<command-line>:0:7: error: unknown type name 'off64_t'
> -sendfile02.c:97:18: note: in expansion of macro 'OFF_T'
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - testcases/kernel/syscalls/sendfile/Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/testcases/kernel/syscalls/sendfile/Makefile b/testcases/kernel/syscalls/sendfile/Makefile
> -index df7b63f..1bd1b57 100644
> ---- a/testcases/kernel/syscalls/sendfile/Makefile
> -+++ b/testcases/kernel/syscalls/sendfile/Makefile
> -@@ -21,6 +21,6 @@ top_srcdir		?= ../../../..
> - include $(top_srcdir)/include/mk/testcases.mk
> - include $(abs_srcdir)/../utils/newer_64.mk
> -
> --%_64: CPPFLAGS += -D_FILE_OFFSET_BITS=64 -DOFF_T=__off64_t
> -+%_64: CPPFLAGS += -D_FILE_OFFSET_BITS=64 -DOFF_T=off64_t -D_GNU_SOURCE
> -
> - include $(top_srcdir)/include/mk/generic_leaf_target.mk
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch b/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
> index 945280c..6eace63 100644
> --- a/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
> +++ b/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
> @@ -20,8 +20,8 @@ index 7203e9e..fce87d6 100644
>   /**************/
>
>   key_t key;
> --sigset_t sigset;
> -+sigset_t sigset1;
> +-sigset_t set;
> ++sigset_t set1;
>
>   #define  SIZE  16*1024
>
> @@ -29,12 +29,12 @@ index 7203e9e..fce87d6 100644
>
>   	key = (key_t) getpid();
>
> --	sigemptyset(&sigset);
> --	sigaddset(&sigset, SIGUSR1);
> --	sigprocmask(SIG_BLOCK, &sigset, NULL);
> -+	sigemptyset(&sigset1);
> -+	sigaddset(&sigset1, SIGUSR1);
> -+	sigprocmask(SIG_BLOCK, &sigset1, NULL);
> +-	sigemptyset(&set);
> +-	sigaddset(&set, SIGUSR1);
> +-	sigprocmask(SIG_BLOCK, &set, NULL);
> ++	sigemptyset(&set1);
> ++	sigaddset(&set1, SIGUSR1);
> ++	sigprocmask(SIG_BLOCK, &set1, NULL);
>
>   	pid = fork();
>   	switch (pid) {
> @@ -42,8 +42,8 @@ index 7203e9e..fce87d6 100644
>   	char *cp;
>   	int sig;
>
> --	sigwait(&sigset, &sig);
> -+	sigwait(&sigset1, &sig);
> +-	sigwait(&set, &sig);
> ++	sigwait(&set1, &sig);
>   	chld_pid = getpid();
>   /*--------------------------------------------------------*/
>
> @@ -55,8 +55,8 @@ index a3c9ca3..77b0fc9 100644
>   /**************/
>
>   key_t key;
> --sigset_t sigset;
> -+sigset_t sigset1;
> +-sigset_t set;
> ++sigset_t set1;
>
>   int child();
>   static int rm_shm(int);
> @@ -64,12 +64,12 @@ index a3c9ca3..77b0fc9 100644
>
>   	key = (key_t) getpid();
>
> --	sigemptyset(&sigset);
> --	sigaddset(&sigset, SIGUSR1);
> --	sigprocmask(SIG_BLOCK, &sigset, NULL);
> -+	sigemptyset(&sigset1);
> -+	sigaddset(&sigset1, SIGUSR1);
> -+	sigprocmask(SIG_BLOCK, &sigset1, NULL);
> +-	sigemptyset(&set);
> +-	sigaddset(&set, SIGUSR1);
> +-	sigprocmask(SIG_BLOCK, &set, NULL);
> ++	sigemptyset(&set1);
> ++	sigaddset(&set1, SIGUSR1);
> ++	sigprocmask(SIG_BLOCK, &set1, NULL);
>
>   	pid = fork();
>   	switch (pid) {
> @@ -77,8 +77,8 @@ index a3c9ca3..77b0fc9 100644
>   	char *cp;
>   	int sig;
>
> --	sigwait(&sigset, &sig);
> -+	sigwait(&sigset1, &sig);
> +-	sigwait(&set, &sig);
> ++	sigwait(&set1, &sig);
>   	chld_pid = getpid();
>
>   	if ((shmid = shmget(key, SIZE, 0)) < 0) {
> @@ -90,8 +90,8 @@ index 20fca52..6fb1d57 100644
>   int sig_catch = 0;		/* variable to blocked/unblocked signals */
>
>   struct sigaction sa_new;	/* struct to hold signal info */
> --sigset_t sigset;		/* signal set to hold signal lists */
> -+sigset_t sigset1;		/* signal set to hold signal lists */
> +-sigset_t set;		/* signal set to hold signal lists */
> ++sigset_t set1;		/* signal set to hold signal lists */
>   sigset_t sigset2;
>
>   int main(int ac, char **av)
> @@ -99,8 +99,8 @@ index 20fca52..6fb1d57 100644
>   		 * so that, signal will not be delivered to
>   		 * the test process.
>   		 */
> --		TEST(sigprocmask(SIG_BLOCK, &sigset, 0));
> -+		TEST(sigprocmask(SIG_BLOCK, &sigset1, 0));
> +-		TEST(sigprocmask(SIG_BLOCK, &set, 0));
> ++		TEST(sigprocmask(SIG_BLOCK, &set1, 0));
>
>   		/* Get the process id of test process */
>   		my_pid = getpid();
> @@ -108,8 +108,8 @@ index 20fca52..6fb1d57 100644
>   				 */
>   				errno = 0;
>   				if (sigprocmask(SIG_UNBLOCK,
> --						&sigset, 0) == -1) {
> -+						&sigset1, 0) == -1) {
> +-						&set, 0) == -1) {
> ++						&set1, 0) == -1) {
>   					tst_brkm(TFAIL, cleanup,
>   						 "sigprocmask() failed "
>   						 "to unblock signal, "
> @@ -117,8 +117,8 @@ index 20fca52..6fb1d57 100644
>   	 * Initialise the signal sets with the list that
>   	 * excludes/includes  all system-defined signals.
>   	 */
> --	if (sigemptyset(&sigset) == -1) {
> -+	if (sigemptyset(&sigset1) == -1) {
> +-	if (sigemptyset(&set) == -1) {
> ++	if (sigemptyset(&set1) == -1) {
>   		tst_brkm(TFAIL, cleanup,
>   			 "sigemptyset() failed, errno=%d : %s",
>   			 errno, strerror(errno));
> @@ -126,8 +126,8 @@ index 20fca52..6fb1d57 100644
>   	 * Add specified signal (SIGINT) to the signal set
>   	 * which excludes system-defined signals.
>   	 */
> --	if (sigaddset(&sigset, SIGINT) == -1) {
> -+	if (sigaddset(&sigset1, SIGINT) == -1) {
> +-	if (sigaddset(&set, SIGINT) == -1) {
> ++	if (sigaddset(&set1, SIGINT) == -1) {
>   		tst_brkm(TFAIL, cleanup,
>   			 "sigaddset() failed, errno=%d : %s",
>   			 errno, strerror(errno));
> diff --git a/meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__int64_t-with-int64_t.patch b/meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
> deleted file mode 100644
> index e1532c1..0000000
> --- a/meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
> +++ /dev/null
> @@ -1,351 +0,0 @@
> -From 54e098a366a1d773c4d7d4124f2f5aab976681c3 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Jan 2016 19:58:08 +0000
> -Subject: [PATCH 12/32] fsstress.c: Replace __int64_t with int64_t
> -
> -int64_t is defined in ISO C99
> -include limits.h to get defintions of PATH_MAX
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - testcases/kernel/fs/fsstress/fsstress.c       | 31 +++++++++---------
> - testcases/network/nfs/nfs_fsstress/fsstress.c | 47 ++++++++++++++-------------
> - 2 files changed, 40 insertions(+), 38 deletions(-)
> -
> -diff --git a/testcases/kernel/fs/fsstress/fsstress.c b/testcases/kernel/fs/fsstress/fsstress.c
> -index 2f89903..89f0b19 100644
> ---- a/testcases/kernel/fs/fsstress/fsstress.c
> -+++ b/testcases/kernel/fs/fsstress/fsstress.c
> -@@ -36,6 +36,7 @@
> - #ifdef HAVE_SYS_PRCTL_H
> - # include <sys/prctl.h>
> - #endif
> -+#include <limits.h>
> -
> - #define XFS_ERRTAG_MAX		17
> -
> -@@ -1572,7 +1573,7 @@ void bulkstat_f(int opno, long r)
> - 	__u64 last;
> - 	__s32 nent;
> - 	xfs_bstat_t *t;
> --	__int64_t total;
> -+	int64_t total;
> - 	xfs_fsop_bulkreq_t bsr;
> -
> - 	last = 0;
> -@@ -1764,14 +1765,14 @@ int setdirect(int fd)
> -
> - void dread_f(int opno, long r)
> - {
> --	__int64_t align;
> -+	int64_t align;
> - 	char *buf = NULL;
> - 	struct dioattr diob;
> - 	int e;
> - 	pathname_t f;
> - 	int fd;
> - 	size_t len;
> --	__int64_t lr;
> -+	int64_t lr;
> - 	off64_t off;
> - 	struct stat64 stb;
> - 	int v;
> -@@ -1835,8 +1836,8 @@ void dread_f(int opno, long r)
> - 		return;
> - 	}
> - #endif
> --	align = (__int64_t) diob.d_miniosz;
> --	lr = ((__int64_t) random() << 32) + random();
> -+	align = (int64_t) diob.d_miniosz;
> -+	lr = ((int64_t) random() << 32) + random();
> - 	off = (off64_t) (lr % stb.st_size);
> - 	off -= (off % align);
> - 	lseek64(fd, off, SEEK_SET);
> -@@ -1865,14 +1866,14 @@ void dread_f(int opno, long r)
> -
> - void dwrite_f(int opno, long r)
> - {
> --	__int64_t align;
> -+	int64_t align;
> - 	char *buf = NULL;
> - 	struct dioattr diob;
> - 	int e;
> - 	pathname_t f;
> - 	int fd;
> - 	size_t len;
> --	__int64_t lr;
> -+	int64_t lr;
> - 	off64_t off;
> - 	struct stat64 stb;
> - 	int v;
> -@@ -1925,8 +1926,8 @@ void dwrite_f(int opno, long r)
> - 		return;
> - 	}
> - #endif
> --	align = (__int64_t) diob.d_miniosz;
> --	lr = ((__int64_t) random() << 32) + random();
> -+	align = (int64_t) diob.d_miniosz;
> -+	lr = ((int64_t) random() << 32) + random();
> - 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> - 	off -= (off % align);
> - 	lseek64(fd, off, SEEK_SET);
> -@@ -2224,7 +2225,7 @@ void read_f(int opno, long r)
> - 	pathname_t f;
> - 	int fd;
> - 	size_t len;
> --	__int64_t lr;
> -+	int64_t lr;
> - 	off64_t off;
> - 	struct stat64 stb;
> - 	int v;
> -@@ -2262,7 +2263,7 @@ void read_f(int opno, long r)
> - 		close(fd);
> - 		return;
> - 	}
> --	lr = ((__int64_t) random() << 32) + random();
> -+	lr = ((int64_t) random() << 32) + random();
> - 	off = (off64_t) (lr % stb.st_size);
> - 	lseek64(fd, off, SEEK_SET);
> - 	len = (random() % (getpagesize() * 32)) + 1;
> -@@ -2509,7 +2510,7 @@ void truncate_f(int opno, long r)
> - {
> - 	int e;
> - 	pathname_t f;
> --	__int64_t lr;
> -+	int64_t lr;
> - 	off64_t off;
> - 	struct stat64 stb;
> - 	int v;
> -@@ -2530,7 +2531,7 @@ void truncate_f(int opno, long r)
> - 		free_pathname(&f);
> - 		return;
> - 	}
> --	lr = ((__int64_t) random() << 32) + random();
> -+	lr = ((int64_t) random() << 32) + random();
> - 	off = lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE);
> - 	off %= maxfsize;
> - 	e = truncate64_path(&f, off) < 0 ? errno : 0;
> -@@ -2626,7 +2627,7 @@ void write_f(int opno, long r)
> - 	pathname_t f;
> - 	int fd;
> - 	size_t len;
> --	__int64_t lr;
> -+	int64_t lr;
> - 	off64_t off;
> - 	struct stat64 stb;
> - 	int v;
> -@@ -2656,7 +2657,7 @@ void write_f(int opno, long r)
> - 		close(fd);
> - 		return;
> - 	}
> --	lr = ((__int64_t) random() << 32) + random();
> -+	lr = ((int64_t) random() << 32) + random();
> - 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> - 	off %= maxfsize;
> - 	lseek64(fd, off, SEEK_SET);
> -diff --git a/testcases/network/nfs/nfs_fsstress/fsstress.c b/testcases/network/nfs/nfs_fsstress/fsstress.c
> -index ac91262..a34c416 100644
> ---- a/testcases/network/nfs/nfs_fsstress/fsstress.c
> -+++ b/testcases/network/nfs/nfs_fsstress/fsstress.c
> -@@ -31,6 +31,7 @@
> -  */
> -
> - #include "global.h"
> -+#include <limits.h>
> -
> - #define XFS_ERRTAG_MAX		17
> -
> -@@ -1368,7 +1369,7 @@ void allocsp_f(int opno, long r)
> - 	pathname_t f;
> - 	int fd;
> - 	struct flock64 fl;
> --	__int64_t lr;
> -+	int64_t lr;
> - 	off64_t off;
> - 	struct stat64 stb;
> - 	int v;
> -@@ -1398,7 +1399,7 @@ void allocsp_f(int opno, long r)
> - 		close(fd);
> - 		return;
> - 	}
> --	lr = ((__int64_t) random() << 32) + random();
> -+	lr = ((int64_t) random() << 32) + random();
> - 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> - 	off %= maxfsize;
> - 	fl.l_whence = SEEK_SET;
> -@@ -1519,7 +1520,7 @@ void bulkstat_f(int opno, long r)
> - 	__uint64_t last;
> - 	int nent;
> - 	xfs_bstat_t *t;
> --	__int64_t total;
> -+	int64_t total;
> - 	xfs_fsop_bulkreq_t bsr;
> -
> - 	last = 0;
> -@@ -1708,14 +1709,14 @@ int setdirect(int fd)
> -
> - void dread_f(int opno, long r)
> - {
> --	__int64_t align;
> -+	int64_t align;
> - 	char *buf;
> - 	struct dioattr diob;
> - 	int e;
> - 	pathname_t f;
> - 	int fd;
> - 	size_t len;
> --	__int64_t lr;
> -+	int64_t lr;
> - 	off64_t off;
> - 	struct stat64 stb;
> - 	int v;
> -@@ -1775,8 +1776,8 @@ void dread_f(int opno, long r)
> - 		return;
> - 	}
> - #endif
> --	align = (__int64_t) diob.d_miniosz;
> --	lr = ((__int64_t) random() << 32) + random();
> -+	align = (int64_t) diob.d_miniosz;
> -+	lr = ((int64_t) random() << 32) + random();
> - 	off = (off64_t) (lr % stb.st_size);
> - 	off -= (off % align);
> - 	lseek64(fd, off, SEEK_SET);
> -@@ -1798,14 +1799,14 @@ void dread_f(int opno, long r)
> -
> - void dwrite_f(int opno, long r)
> - {
> --	__int64_t align;
> -+	int64_t align;
> - 	char *buf;
> - 	struct dioattr diob;
> - 	int e;
> - 	pathname_t f;
> - 	int fd;
> - 	size_t len;
> --	__int64_t lr;
> -+	int64_t lr;
> - 	off64_t off;
> - 	struct stat64 stb;
> - 	int v;
> -@@ -1854,8 +1855,8 @@ void dwrite_f(int opno, long r)
> - 		return;
> - 	}
> - #endif
> --	align = (__int64_t) diob.d_miniosz;
> --	lr = ((__int64_t) random() << 32) + random();
> -+	align = (int64_t) diob.d_miniosz;
> -+	lr = ((int64_t) random() << 32) + random();
> - 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> - 	off -= (off % align);
> - 	lseek64(fd, off, SEEK_SET);
> -@@ -1917,7 +1918,7 @@ void freesp_f(int opno, long r)
> - 	pathname_t f;
> - 	int fd;
> - 	struct flock64 fl;
> --	__int64_t lr;
> -+	int64_t lr;
> - 	off64_t off;
> - 	struct stat64 stb;
> - 	int v;
> -@@ -1947,7 +1948,7 @@ void freesp_f(int opno, long r)
> - 		close(fd);
> - 		return;
> - 	}
> --	lr = ((__int64_t) random() << 32) + random();
> -+	lr = ((int64_t) random() << 32) + random();
> - 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> - 	off %= maxfsize;
> - 	fl.l_whence = SEEK_SET;
> -@@ -2145,7 +2146,7 @@ void read_f(int opno, long r)
> - 	pathname_t f;
> - 	int fd;
> - 	size_t len;
> --	__int64_t lr;
> -+	int64_t lr;
> - 	off64_t off;
> - 	struct stat64 stb;
> - 	int v;
> -@@ -2183,7 +2184,7 @@ void read_f(int opno, long r)
> - 		close(fd);
> - 		return;
> - 	}
> --	lr = ((__int64_t) random() << 32) + random();
> -+	lr = ((int64_t) random() << 32) + random();
> - 	off = (off64_t) (lr % stb.st_size);
> - 	lseek64(fd, off, SEEK_SET);
> - 	len = (random() % (getpagesize() * 32)) + 1;
> -@@ -2281,7 +2282,7 @@ void resvsp_f(int opno, long r)
> - 	pathname_t f;
> - 	int fd;
> - 	struct flock64 fl;
> --	__int64_t lr;
> -+	int64_t lr;
> - 	off64_t off;
> - 	struct stat64 stb;
> - 	int v;
> -@@ -2311,7 +2312,7 @@ void resvsp_f(int opno, long r)
> - 		close(fd);
> - 		return;
> - 	}
> --	lr = ((__int64_t) random() << 32) + random();
> -+	lr = ((int64_t) random() << 32) + random();
> - 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> - 	off %= maxfsize;
> - 	fl.l_whence = SEEK_SET;
> -@@ -2428,7 +2429,7 @@ void truncate_f(int opno, long r)
> - {
> - 	int e;
> - 	pathname_t f;
> --	__int64_t lr;
> -+	int64_t lr;
> - 	off64_t off;
> - 	struct stat64 stb;
> - 	int v;
> -@@ -2449,7 +2450,7 @@ void truncate_f(int opno, long r)
> - 		free_pathname(&f);
> - 		return;
> - 	}
> --	lr = ((__int64_t) random() << 32) + random();
> -+	lr = ((int64_t) random() << 32) + random();
> - 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> - 	off %= maxfsize;
> - 	e = truncate64_path(&f, off) < 0 ? errno : 0;
> -@@ -2491,7 +2492,7 @@ void unresvsp_f(int opno, long r)
> - 	pathname_t f;
> - 	int fd;
> - 	struct flock64 fl;
> --	__int64_t lr;
> -+	int64_t lr;
> - 	off64_t off;
> - 	struct stat64 stb;
> - 	int v;
> -@@ -2521,7 +2522,7 @@ void unresvsp_f(int opno, long r)
> - 		close(fd);
> - 		return;
> - 	}
> --	lr = ((__int64_t) random() << 32) + random();
> -+	lr = ((int64_t) random() << 32) + random();
> - 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> - 	off %= maxfsize;
> - 	fl.l_whence = SEEK_SET;
> -@@ -2543,7 +2544,7 @@ void write_f(int opno, long r)
> - 	pathname_t f;
> - 	int fd;
> - 	size_t len;
> --	__int64_t lr;
> -+	int64_t lr;
> - 	off64_t off;
> - 	struct stat64 stb;
> - 	int v;
> -@@ -2573,7 +2574,7 @@ void write_f(int opno, long r)
> - 		close(fd);
> - 		return;
> - 	}
> --	lr = ((__int64_t) random() << 32) + random();
> -+	lr = ((int64_t) random() << 32) + random();
> - 	off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> - 	off %= maxfsize;
> - 	lseek64(fd, off, SEEK_SET);
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-getting-O_-definitions.patch b/meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-getting-O_-definitions.patch
> deleted file mode 100644
> index 4266e4f..0000000
> --- a/meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-getting-O_-definitions.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From 1ef8c32317064438ec3b37a114f5d82957f4e0c6 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Jan 2016 20:05:54 +0000
> -Subject: [PATCH 13/32] include fcntl.h for getting O_* definitions
> -
> -musl exposes this issue, with glibc fcntl.h is included via some other
> -header and this problem remained latent
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - testcases/kernel/ipc/ipc_stress/shmem_test_03.c   | 1 +
> - testcases/kernel/syscalls/mq_notify/mq_notify01.c | 1 +
> - testcases/network/tcp_cmds/sendfile/testsf_c.c    | 1 +
> - testcases/network/tcp_cmds/sendfile/testsf_s.c    | 1 +
> - 4 files changed, 4 insertions(+)
> -
> -diff --git a/testcases/kernel/ipc/ipc_stress/shmem_test_03.c b/testcases/kernel/ipc/ipc_stress/shmem_test_03.c
> -index c1b11fd..8be156f 100644
> ---- a/testcases/kernel/ipc/ipc_stress/shmem_test_03.c
> -+++ b/testcases/kernel/ipc/ipc_stress/shmem_test_03.c
> -@@ -72,6 +72,7 @@
> - #include <string.h>
> - #include <unistd.h>
> - #include <limits.h>
> -+#include <fcntl.h>
> - #include <sys/file.h>
> - #include <sys/ipc.h>
> - #include <sys/mman.h>
> -diff --git a/testcases/kernel/syscalls/mq_notify/mq_notify01.c b/testcases/kernel/syscalls/mq_notify/mq_notify01.c
> -index 4728c70..5c7846c 100644
> ---- a/testcases/kernel/syscalls/mq_notify/mq_notify01.c
> -+++ b/testcases/kernel/syscalls/mq_notify/mq_notify01.c
> -@@ -41,6 +41,7 @@
> - #include <mqueue.h>
> - #include <signal.h>
> - #include <stdlib.h>
> -+#include <fcntl.h>
> -
> - #include "../utils/include_j_h.h"
> -
> -diff --git a/testcases/network/tcp_cmds/sendfile/testsf_c.c b/testcases/network/tcp_cmds/sendfile/testsf_c.c
> -index 449784f..38d3274 100644
> ---- a/testcases/network/tcp_cmds/sendfile/testsf_c.c
> -+++ b/testcases/network/tcp_cmds/sendfile/testsf_c.c
> -@@ -9,6 +9,7 @@
> - #include <sys/types.h>
> - #include <stdlib.h>
> - #include <string.h>
> -+#include <fcntl.h>
> - #include <sys/file.h>
> - #include <arpa/inet.h>
> - #include <netinet/in.h>
> -diff --git a/testcases/network/tcp_cmds/sendfile/testsf_s.c b/testcases/network/tcp_cmds/sendfile/testsf_s.c
> -index 17e98ad..bce8dd1 100644
> ---- a/testcases/network/tcp_cmds/sendfile/testsf_s.c
> -+++ b/testcases/network/tcp_cmds/sendfile/testsf_s.c
> -@@ -6,6 +6,7 @@
> - #include <stdio.h>
> - #include <stdlib.h>
> - #include <unistd.h>
> -+#include <fcntl.h>
> - #include <sys/file.h>
> - #include <errno.h>
> - #include <sys/signal.h>
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch b/meta/recipes-extended/ltp/ltp/0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
> deleted file mode 100644
> index 84d81e9..0000000
> --- a/meta/recipes-extended/ltp/ltp/0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From d63fefa86dac437c47b9ebbea0a82a1240aaba2c Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Jan 2016 20:09:56 +0000
> -Subject: [PATCH 14/32] hyperthreading: Include sys/types.h for pid_t
> - definition
> -
> -If sys/types.h is not included then it will not define pid_t_needed
> -and therefore typedef wont be included and we get errors about pid_t
> -being not known
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h  | 1 +
> - testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h   | 1 +
> - testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h | 1 +
> - 3 files changed, 3 insertions(+)
> -
> -diff --git a/testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h b/testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h
> -index 1ec9794..9084aa7 100644
> ---- a/testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h
> -+++ b/testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h
> -@@ -3,6 +3,7 @@
> - #define _HTUTILS_H_
> -
> - #include <stdlib.h>
> -+#include <sys/types.h>
> -
> - int is_cmdline_para(const char *para);
> -
> -diff --git a/testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h b/testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h
> -index 1ec9794..c03a124 100644
> ---- a/testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h
> -+++ b/testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h
> -@@ -2,6 +2,7 @@
> - #ifndef _HTUTILS_H_
> - #define _HTUTILS_H_
> -
> -+#include <sys/types.h>
> - #include <stdlib.h>
> -
> - int is_cmdline_para(const char *para);
> -diff --git a/testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h b/testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h
> -index 2977ad0..6b484e1 100644
> ---- a/testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h
> -+++ b/testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h
> -@@ -3,6 +3,7 @@
> - #define _HTUTILS_H_
> -
> - #include <stdlib.h>
> -+#include <sys/types.h>
> -
> - int is_cmdline_para(const char *para);
> -
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-PAGESIZE-to-pagesize.patch b/meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-PAGESIZE-to-pagesize.patch
> deleted file mode 100644
> index 963536f..0000000
> --- a/meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-PAGESIZE-to-pagesize.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From f091839532f3afe0a58e8ba0b45615c899a43a47 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Jan 2016 20:12:09 +0000
> -Subject: [PATCH 15/32] mincore01: Rename PAGESIZE to pagesize
> -
> -PAGESIZE conflicts with system headers on musl
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - testcases/kernel/syscalls/mincore/mincore01.c | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/testcases/kernel/syscalls/mincore/mincore01.c b/testcases/kernel/syscalls/mincore/mincore01.c
> -index 97a3d95..fa426d1 100644
> ---- a/testcases/kernel/syscalls/mincore/mincore01.c
> -+++ b/testcases/kernel/syscalls/mincore/mincore01.c
> -@@ -45,7 +45,7 @@
> - #include "test.h"
> - #include "safe_macros.h"
> -
> --static int PAGESIZE;
> -+static int pagesize;
> - static rlim_t STACK_LIMIT = 10485760;
> -
> - static void cleanup(void);
> -@@ -146,7 +146,7 @@ static void setup4(struct test_case_t *tc)
> - 	}
> -
> - 	tc->addr = global_pointer;
> --	tc->len = as_lim.rlim_cur - (rlim_t)global_pointer + PAGESIZE;
> -+	tc->len = as_lim.rlim_cur - (rlim_t)global_pointer + pagesize;
> - 	tc->vector = global_vec;
> -
> - 	/*
> -@@ -161,7 +161,7 @@ static void setup(void)
> - 	char *buf;
> - 	int fd;
> -
> --	PAGESIZE = getpagesize();
> -+	pagesize = getpagesize();
> -
> - 	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -@@ -170,7 +170,7 @@ static void setup(void)
> - 	TEST_PAUSE;
> -
> - 	/* global_pointer will point to a mmapped area of global_len bytes */
> --	global_len = PAGESIZE * 2;
> -+	global_len = pagesize * 2;
> -
> - 	buf = SAFE_MALLOC(cleanup, global_len);
> - 	memset(buf, 42, global_len);
> -@@ -186,7 +186,7 @@ static void setup(void)
> - 				   PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> -
> - 	global_vec = SAFE_MALLOC(cleanup,
> --				 (global_len + PAGESIZE - 1) / PAGESIZE);
> -+				 (global_len + pagesize - 1) / pagesize);
> -
> - 	SAFE_CLOSE(cleanup, fd);
> - }
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch b/meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
> deleted file mode 100644
> index 1b5b93a..0000000
> --- a/meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 2b9be924bbad8a1f84ae553fdd1aa8391aa8d2f4 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Jan 2016 20:15:07 +0000
> -Subject: [PATCH 16/32] ustat: Change header from ustat.h to sys/ustat.h
> -
> -makes it portable for musl, on glibc ustat.h is just including
> -sys/ustat.h too
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - testcases/kernel/syscalls/ustat/ustat01.c | 2 +-
> - testcases/kernel/syscalls/ustat/ustat02.c | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/testcases/kernel/syscalls/ustat/ustat01.c b/testcases/kernel/syscalls/ustat/ustat01.c
> -index 01b7688..494647b 100644
> ---- a/testcases/kernel/syscalls/ustat/ustat01.c
> -+++ b/testcases/kernel/syscalls/ustat/ustat01.c
> -@@ -20,8 +20,8 @@
> -  */
> -
> - #include <unistd.h>
> --#include <ustat.h>
> - #include <errno.h>
> -+#include <sys/ustat.h>
> - #include <sys/types.h>
> - #include <sys/stat.h>
> - #include "test.h"
> -diff --git a/testcases/kernel/syscalls/ustat/ustat02.c b/testcases/kernel/syscalls/ustat/ustat02.c
> -index 4e66236..edada31 100644
> ---- a/testcases/kernel/syscalls/ustat/ustat02.c
> -+++ b/testcases/kernel/syscalls/ustat/ustat02.c
> -@@ -21,8 +21,8 @@
> -  */
> -
> - #include <unistd.h>
> --#include <ustat.h>
> - #include <errno.h>
> -+#include <sys/ustat.h>
> - #include <sys/stat.h>
> - #include <sys/types.h>
> - #include "test.h"
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-with-union-sigval.patch b/meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-with-union-sigval.patch
> deleted file mode 100644
> index ed25802..0000000
> --- a/meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-with-union-sigval.patch
> +++ /dev/null
> @@ -1,88 +0,0 @@
> -From c882bcd18820b44a685f0d5edd7aaff77a88c912 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Jan 2016 20:17:55 +0000
> -Subject: [PATCH 17/32] replace sigval_t with union sigval
> -
> -This makes it compatible across musl and glibc
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c | 2 +-
> - testcases/kernel/syscalls/timer_gettime/timer_gettime01.c       | 2 +-
> - testcases/kernel/timers/timer_create/timer_create02.c           | 4 ++--
> - testcases/kernel/timers/timer_create/timer_create03.c           | 4 ++--
> - 4 files changed, 6 insertions(+), 6 deletions(-)
> -
> -diff --git a/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c b/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c
> -index d186c1f..bc03544 100644
> ---- a/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c
> -+++ b/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c
> -@@ -54,7 +54,7 @@ int main(int ac, char **av)
> -
> - 	setup();
> -
> --	ev.sigev_value = (sigval_t) 0;
> -+	ev.sigev_value = (union sigval) 0;
> - 	ev.sigev_signo = SIGALRM;
> - 	ev.sigev_notify = SIGEV_SIGNAL;
> - 	TEST(ltp_syscall(__NR_timer_create, CLOCK_REALTIME, &ev, &timer));
> -diff --git a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
> -index b583aee..9371a6a 100644
> ---- a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
> -+++ b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
> -@@ -55,7 +55,7 @@ int main(int ac, char **av)
> -
> - 	setup();
> -
> --	ev.sigev_value = (sigval_t) 0;
> -+	ev.sigev_value = (union sigval) 0;
> - 	ev.sigev_signo = SIGALRM;
> - 	ev.sigev_notify = SIGEV_SIGNAL;
> - 	TEST(ltp_syscall(__NR_timer_create, CLOCK_REALTIME, &ev, &timer));
> -diff --git a/testcases/kernel/timers/timer_create/timer_create02.c b/testcases/kernel/timers/timer_create/timer_create02.c
> -index 7f528ed..1127400 100644
> ---- a/testcases/kernel/timers/timer_create/timer_create02.c
> -+++ b/testcases/kernel/timers/timer_create/timer_create02.c
> -@@ -142,7 +142,7 @@ void setup_test(int option)
> - {
> - 	switch (option) {
> - 	case 0:
> --		evp.sigev_value = (sigval_t) 0;
> -+		evp.sigev_value = (union sigval) 0;
> - 		evp.sigev_signo = SIGALRM;
> - 		evp.sigev_notify = SIGEV_SIGNAL;
> - 		evp_ptr = &evp;
> -@@ -151,7 +151,7 @@ void setup_test(int option)
> - 		evp_ptr = NULL;
> - 		break;
> - 	case 2:
> --		evp.sigev_value = (sigval_t) 0;
> -+		evp.sigev_value = (union sigval) 0;
> - 		evp.sigev_signo = SIGALRM;	/* any will do */
> - 		evp.sigev_notify = SIGEV_NONE;
> - 		evp_ptr = &evp;
> -diff --git a/testcases/kernel/timers/timer_create/timer_create03.c b/testcases/kernel/timers/timer_create/timer_create03.c
> -index 291fcfa..8b01bf7 100644
> ---- a/testcases/kernel/timers/timer_create/timer_create03.c
> -+++ b/testcases/kernel/timers/timer_create/timer_create03.c
> -@@ -129,7 +129,7 @@ void setup_test(int option)
> - {
> - 	switch (option) {
> - 	case 0:
> --		evp.sigev_value = (sigval_t) 0;
> -+		evp.sigev_value = (union sigval) 0;
> - 		evp.sigev_signo = SIGALRM;
> - 		evp.sigev_notify = SIGEV_SIGNAL;
> - 		evp_ptr = &evp;
> -@@ -138,7 +138,7 @@ void setup_test(int option)
> - 		evp_ptr = NULL;
> - 		break;
> - 	case 2:
> --		evp.sigev_value = (sigval_t) 0;
> -+		evp.sigev_value = (union sigval) 0;
> - 		evp.sigev_signo = SIGALRM;	/* any will do */
> - 		evp.sigev_notify = SIGEV_NONE;
> - 		evp_ptr = &evp;
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch b/meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
> deleted file mode 100644
> index 0a4c5f0..0000000
> --- a/meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 721e94985b9cff3e2724af7ea5be7d005bc12dec Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 8 Jan 2016 06:55:27 +0000
> -Subject: [PATCH 19/32] tomoyo: Replace canonicalize_file_name() with
> - realpath()
> -
> -canonicalize_file_name() API is specific to glibc
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c b/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
> -index da4af0f..5c1a3ca 100644
> ---- a/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
> -+++ b/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
> -@@ -274,9 +274,9 @@ int main(int argc, char *argv[])
> - 	/* Test mount(). */
> - 	{
> - 		static char buf[4096];
> --		char *dev_ram_path = canonicalize_file_name("/dev/ram0");
> -+		char *dev_ram_path = realpath("/dev/ram0", NULL);
> - 		if (!dev_ram_path)
> --			dev_ram_path = canonicalize_file_name("/dev/ram");
> -+			dev_ram_path = realpath("/dev/ram", NULL);
> - 		if (!dev_ram_path) {
> - 			dev_ram_path = "/dev/ram0";
> - 			mknod(dev_ram_path, S_IFBLK, MKDEV(1, 0));
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch b/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
> index d2d6d76..13b6b24 100644
> --- a/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
> +++ b/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
> @@ -25,9 +25,9 @@ index 5c1c58c..3244b5e 100644
>  +#else
>  +static pthread_mutex_t tmutex = {  PTHREAD_MUTEX_RECURSIVE };
>  +#endif
> - /*
> -  * Define local function prototypes.
> -  */
> + static void check_env(void);
> + static void tst_condense(int tnum, int ttype, const char *tmesg);
> + static void tst_print(const char *tcid, int tnum, int ttype, const char *tmesg);
>  --
>  2.7.0
>
> diff --git a/meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-unistd.h-explicitly.patch b/meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-unistd.h-explicitly.patch
> deleted file mode 100644
> index 5c6bf91..0000000
> --- a/meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-unistd.h-explicitly.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 4f1905ff09c730091674818bd1b48ee221347101 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 8 Jan 2016 08:30:29 +0000
> -Subject: [PATCH 32/32] regen.sh: Include asm/unistd.h explicitly
> -
> -on musl this is not included indirectly and it results in errors like
> -testcases/kernel/include/linux_syscall_numbers.h:1035:25: error:
> -'__NR_SYSCALL_BASE' undeclared (first use in this function)
> -|  #  define __NR_readdir (__NR_SYSCALL_BASE+ 89)
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - testcases/kernel/include/regen.sh | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/testcases/kernel/include/regen.sh b/testcases/kernel/include/regen.sh
> -index f93f49b..ee790af 100755
> ---- a/testcases/kernel/include/regen.sh
> -+++ b/testcases/kernel/include/regen.sh
> -@@ -32,6 +32,7 @@ cat << EOF > "${output_pid}"
> -
> - #include <errno.h>
> - #include <sys/syscall.h>
> -+#include <asm/unistd.h>
> - #include "cleanup.c"
> -
> - #define ltp_syscall(NR, ...) ({ \\
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb b/meta/recipes-extended/ltp/ltp_20160510.bb
> similarity index 88%
> rename from meta/recipes-extended/ltp/ltp_20160126.bb
> rename to meta/recipes-extended/ltp/ltp_20160510.bb
> index 7631e0e..9ac386f 100644
> --- a/meta/recipes-extended/ltp/ltp_20160126.bb
> +++ b/meta/recipes-extended/ltp/ltp_20160510.bb
> @@ -24,28 +24,19 @@ DEPENDS_append_libc-musl = " fts "
>  EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
>  CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS_append_mips64 = " -D__SANE_USERSPACE_TYPES__"
> -SRCREV = "fce797676b14f50406718e7ef640b50da66c9b36"
> +SRCREV = "149490ec2de45a5dc7a9fd2c31add615fdd4f82b"
>
>  SRC_URI = "git://github.com/linux-test-project/ltp.git \
> -           file://0001-ltp-Don-t-link-against-libfl.patch \
>             file://0002-Add-knob-to-control-whether-numa-support-should-be-c.patch \
>             file://0003-Add-knob-to-control-tirpc-support.patch \
>             file://0004-build-Add-option-to-select-libc-implementation.patch \
>             file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch \
> -           file://0006-sendfile-Use-off64_t-instead-of-__off64_t.patch \
>             file://0007-replace-SIGCLD-with-SIGCHLD.patch \
>             file://0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch \
>             file://0009-Guard-error.h-with-__GLIBC__.patch \
>             file://0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch \
>             file://0011-Rename-sigset-variable-to-sigset1.patch \
> -           file://0012-fsstress.c-Replace-__int64_t-with-int64_t.patch \
> -           file://0013-include-fcntl.h-for-getting-O_-definitions.patch \
> -           file://0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch \
> -           file://0015-mincore01-Rename-PAGESIZE-to-pagesize.patch \
> -           file://0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch \
> -           file://0017-replace-sigval_t-with-union-sigval.patch \
>             file://0018-guard-mallocopt-with-__GLIBC__.patch \
> -           file://0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch \
>             file://0020-getdents-define-getdents-getdents64-only-for-glibc.patch \
>             file://0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch \
>             file://0022-include-sys-types.h.patch \
> @@ -58,7 +49,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
>             file://0029-trace_shed-Fix-build-with-musl.patch \
>             file://0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch \
>             file://0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch \
> -           file://0032-regen.sh-Include-asm-unistd.h-explicitly.patch \
>             file://0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch \
>             file://0034-periodic_output.patch \
>             file://0035-fix-test_proc_kill-hang.patch \
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

