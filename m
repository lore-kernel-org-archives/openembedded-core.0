Return-Path: <raj.khem@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1F928605C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 21:00:31 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id v2so1222651ywg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 14:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cpnmb5JL+Qnj4UcECsjLdW4KHxnQ4W0rG9ijXYE5OwM=;
	b=WduZhsikJay/fXRBasTLD+ZaKHV08Via02Twf3A6+PEYm9JAeF9JI7PajW1YjQnA63
	28/UyeAJIGBjRq4XGbK1omodD2VOJLlYGNGTTEeQS9IHs77/1oqAN6NWmMRICkwGIYjX
	sww/TTa8/mMqe+ZUgiCW9mhNTZKcu4+/eQmSoZw18+OlWN9eK/ZZtjJk6cAXj+/s/DUE
	vbc7mURoUF+DhCoTQC1MmwYRSB6VtNrp2hvB8jl3l4aGQM2ne5vUSxxRM6y8ThWQA0HH
	66tW+sQqZwmlcflkQClIPzsDguqpRn1hvs8tEuAq4Krp4kesXrl95rliY/ebpk1nVbAP
	TcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cpnmb5JL+Qnj4UcECsjLdW4KHxnQ4W0rG9ijXYE5OwM=;
	b=mMAn0ww8Wkb2Q9MH4ukOTGjK4WQQ81r6ClFw5T5I7dirR9+5isrRJW+Ub1c9TlxdM+
	QrMXzjGl9pPJpopw7kMFl1ERGBht+4pns9gF38FefROomRQuSrISIhORHVTGi5CslrY4
	o2pN64TpqwKPwnh0bnsS6tjMME0b5R3WXPcgb0EwEUtWfxSKsUV3/iKLIq+zM7n/4yc4
	YJPMy/A4Zq3O9YYsPddUHpAVAYb30Puq7REJPnoHkDcPR/4zNn9PKwA9otQu0AjUMG6x
	6E2RRrKmhPMyfRiXlBKA6nU10FYv6PeFYSxOHWlZ+9ylKonsntCmi4/pa4s/qQlNwcR3
	d9pg==
X-Gm-Message-State: AE9vXwP6rUWqrlAekZQjBETyKZXsfI6En5/ROqzMCL5ILq2P3yKgxiacFquY4rrDLBUQ6tJB8eCb3Q46fXxvXA==
X-Received: by 10.13.254.135 with SMTP id o129mr31928522ywf.117.1474405233027; 
	Tue, 20 Sep 2016 14:00:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Tue, 20 Sep 2016 14:00:01 -0700 (PDT)
In-Reply-To: <1473603090-1486-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
References: <1473603090-1486-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Sep 2016 14:00:01 -0700
Message-ID: <CAMKF1sqCtck=AodR=8qs7Kpe0g197cWJCXERGYcgD9n+kSzqAQ@mail.gmail.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: 20160126 -> 20160510
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
X-List-Received-Date: Tue, 20 Sep 2016 21:00:32 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Sep 11, 2016 at 7:11 AM, Wang Xin
<wangxin2015.fnst@cn.fujitsu.com> wrote:
> 1) Upgrade ltp from 20160126 to 20160510.
> 2) Modify some patches, since the data has been changed.
>     0011-Rename-sigset-variable-to-sigset1.patch
>     0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
> 3) Delete some patches, since they are no use.
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

Please test this on musl as well. Please backport the needed patches from
https://github.com/kraj/ltp/tree/oe/master

Some of these patches are merged upstream but new ones may be needed.

> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> ---
>  .../0011-Rename-sigset-variable-to-sigset1.patch   | 60 +++++++++++-----------
>  ...READ_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch |  6 +--
>  .../ltp/{ltp_20160126.bb => ltp_20160510.bb}       | 12 +----
>  3 files changed, 34 insertions(+), 44 deletions(-)
>  rename meta/recipes-extended/ltp/{ltp_20160126.bb => ltp_20160510.bb} (88%)
>
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
>         key = (key_t) getpid();
>
> --      sigemptyset(&sigset);
> --      sigaddset(&sigset, SIGUSR1);
> --      sigprocmask(SIG_BLOCK, &sigset, NULL);
> -+      sigemptyset(&sigset1);
> -+      sigaddset(&sigset1, SIGUSR1);
> -+      sigprocmask(SIG_BLOCK, &sigset1, NULL);
> +-      sigemptyset(&set);
> +-      sigaddset(&set, SIGUSR1);
> +-      sigprocmask(SIG_BLOCK, &set, NULL);
> ++      sigemptyset(&set1);
> ++      sigaddset(&set1, SIGUSR1);
> ++      sigprocmask(SIG_BLOCK, &set1, NULL);
>
>         pid = fork();
>         switch (pid) {
> @@ -42,8 +42,8 @@ index 7203e9e..fce87d6 100644
>         char *cp;
>         int sig;
>
> --      sigwait(&sigset, &sig);
> -+      sigwait(&sigset1, &sig);
> +-      sigwait(&set, &sig);
> ++      sigwait(&set1, &sig);
>         chld_pid = getpid();
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
>         key = (key_t) getpid();
>
> --      sigemptyset(&sigset);
> --      sigaddset(&sigset, SIGUSR1);
> --      sigprocmask(SIG_BLOCK, &sigset, NULL);
> -+      sigemptyset(&sigset1);
> -+      sigaddset(&sigset1, SIGUSR1);
> -+      sigprocmask(SIG_BLOCK, &sigset1, NULL);
> +-      sigemptyset(&set);
> +-      sigaddset(&set, SIGUSR1);
> +-      sigprocmask(SIG_BLOCK, &set, NULL);
> ++      sigemptyset(&set1);
> ++      sigaddset(&set1, SIGUSR1);
> ++      sigprocmask(SIG_BLOCK, &set1, NULL);
>
>         pid = fork();
>         switch (pid) {
> @@ -77,8 +77,8 @@ index a3c9ca3..77b0fc9 100644
>         char *cp;
>         int sig;
>
> --      sigwait(&sigset, &sig);
> -+      sigwait(&sigset1, &sig);
> +-      sigwait(&set, &sig);
> ++      sigwait(&set1, &sig);
>         chld_pid = getpid();
>
>         if ((shmid = shmget(key, SIZE, 0)) < 0) {
> @@ -90,8 +90,8 @@ index 20fca52..6fb1d57 100644
>   int sig_catch = 0;            /* variable to blocked/unblocked signals */
>
>   struct sigaction sa_new;      /* struct to hold signal info */
> --sigset_t sigset;              /* signal set to hold signal lists */
> -+sigset_t sigset1;             /* signal set to hold signal lists */
> +-sigset_t set;         /* signal set to hold signal lists */
> ++sigset_t set1;                /* signal set to hold signal lists */
>   sigset_t sigset2;
>
>   int main(int ac, char **av)
> @@ -99,8 +99,8 @@ index 20fca52..6fb1d57 100644
>                  * so that, signal will not be delivered to
>                  * the test process.
>                  */
> --              TEST(sigprocmask(SIG_BLOCK, &sigset, 0));
> -+              TEST(sigprocmask(SIG_BLOCK, &sigset1, 0));
> +-              TEST(sigprocmask(SIG_BLOCK, &set, 0));
> ++              TEST(sigprocmask(SIG_BLOCK, &set1, 0));
>
>                 /* Get the process id of test process */
>                 my_pid = getpid();
> @@ -108,8 +108,8 @@ index 20fca52..6fb1d57 100644
>                                  */
>                                 errno = 0;
>                                 if (sigprocmask(SIG_UNBLOCK,
> --                                              &sigset, 0) == -1) {
> -+                                              &sigset1, 0) == -1) {
> +-                                              &set, 0) == -1) {
> ++                                              &set1, 0) == -1) {
>                                         tst_brkm(TFAIL, cleanup,
>                                                  "sigprocmask() failed "
>                                                  "to unblock signal, "
> @@ -117,8 +117,8 @@ index 20fca52..6fb1d57 100644
>          * Initialise the signal sets with the list that
>          * excludes/includes  all system-defined signals.
>          */
> --      if (sigemptyset(&sigset) == -1) {
> -+      if (sigemptyset(&sigset1) == -1) {
> +-      if (sigemptyset(&set) == -1) {
> ++      if (sigemptyset(&set1) == -1) {
>                 tst_brkm(TFAIL, cleanup,
>                          "sigemptyset() failed, errno=%d : %s",
>                          errno, strerror(errno));
> @@ -126,8 +126,8 @@ index 20fca52..6fb1d57 100644
>          * Add specified signal (SIGINT) to the signal set
>          * which excludes system-defined signals.
>          */
> --      if (sigaddset(&sigset, SIGINT) == -1) {
> -+      if (sigaddset(&sigset1, SIGINT) == -1) {
> +-      if (sigaddset(&set, SIGINT) == -1) {
> ++      if (sigaddset(&set1, SIGINT) == -1) {
>                 tst_brkm(TFAIL, cleanup,
>                          "sigaddset() failed, errno=%d : %s",
>                          errno, strerror(errno));
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
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

