Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD8B7807D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 18:35:30 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id 17so4739pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 11:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IhUgno93M/aC5btkP2yyAqroeLd+9ewvFMHyTg8tPF8=;
	b=iyeny7eQBH+lyOyg087Vy08kTP8itNlDogrCcsm6y95oG5hGkqePAnOpw580+8Nnca
	olXvB0AOFpaNKzXZBhaNPdVpgfCunMbhHKDhbaJBR19P2EtsRJT+ITzb6XmLu6Hgu3rP
	Teje0OlhyLzCWQx00vl/CDUuAbWTZkt0C8LxqYz5lSHHq1yoeWerr4YDixiqzfTk9g5T
	r9cswtP5lJ4nzyoIACqfik3uH/4xLVXGvRRGiDbCBPlhE5i0Qiprn/pBkFW4OKGOJDs5
	2CcSqXm6/jc+3XG5f042Nn6kMzbOo8p+vM0HBVBplWjNcKJTlDwaQgoVDTQbVUCalHl0
	3/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IhUgno93M/aC5btkP2yyAqroeLd+9ewvFMHyTg8tPF8=;
	b=HB+4pCS1QjLF65xGUQq+H0Q1hmrNoAgqwQ1abLzAjKMIsjVAWHNp+Z+Y6KMtwRrrYk
	cTMfqeC+DjWuLXApqeBCciwJYHhZLeHP/Ku88HHoZepPx3mC2ZgW/GSOGNQ6TZgqnyv3
	ks6QcjU+Jg3HwhpHJ7iURp0MVZPvzaXsrViHSiOJLDAXc4nrVlQQLIwtpzoD8GklKo+U
	dSB8JBr0XIfIRt9pGZOR4ND65yYJeyh3qmwI9JU5AessWvI11dDAj64ofWg4pMMUIW2g
	ynXogBozkv1MkVcYbiZMCOaZRXx6mn4uAu9GjUKieI9G1Cqqz0BvqtLmVszk3/chA8y8
	wQHg==
X-Gm-Message-State: AHPjjUhXMz+aIuXVNBnu7xymOP3ttQSTOAxgMSeyj7eH0HJr2AwQ1UiD
	0TUzhHLVZp5tGzXzDY5OBwKNjMp8mkfu4WqHCW0=
X-Google-Smtp-Source: AOwi7QBT7+1ECoRC+eEMCKXGJRTl+3wsAXJ4JKM5HF5dUZhfmZYgvzs4jKpFCtwP07sH5+HF8fm5aear9og8050dD1g=
X-Received: by 10.101.85.204 with SMTP id k12mr21845593pgs.439.1507228532271; 
	Thu, 05 Oct 2017 11:35:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.135.23 with HTTP; Thu, 5 Oct 2017 11:35:01 -0700 (PDT)
In-Reply-To: <20171005174751.30098-1-fathi.boudra@linaro.org>
References: <20171005174751.30098-1-fathi.boudra@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Oct 2017 11:35:01 -0700
Message-ID: <CAMKF1spMYPvDqR0T6iwOZbbx1whfDrH-NegcB7RWNGhKWvfv9A@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: update to new upstream release 20170929
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
X-List-Received-Date: Thu, 05 Oct 2017 18:35:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 5, 2017 at 10:47 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> * Update SRCREV to match 20170929 release
> * Drop patches available in 20170929 release:
>   - 0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
>   - 0038-commands-gdb01-replace-stdin-with-dev-null.patch
>

A build time test for musl target would be appreciated.

> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  ...E_SIZE-redefinition-and-O_CREAT-undeclear.patch | 113 ---------------------
>  ...ommands-gdb01-replace-stdin-with-dev-null.patch |  34 -------
>  .../ltp/{ltp_20170516.bb => ltp_20170929.bb}       |   4 +-
>  3 files changed, 1 insertion(+), 150 deletions(-)
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch
>  rename meta/recipes-extended/ltp/{ltp_20170516.bb => ltp_20170929.bb} (96%)
>
> diff --git a/meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch b/meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
> deleted file mode 100644
> index c8738ae0d4..0000000000
> --- a/meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
> +++ /dev/null
> @@ -1,113 +0,0 @@
> -From a9d5595d2fa2ab252f1cabf63f4b65c3efbafeb9 Mon Sep 17 00:00:00 2001
> -From: Dengke Du <dengke.du@windriver.com>
> -Date: Thu, 10 Aug 2017 15:27:03 +0800
> -Subject: [PATCH] ltp: fix PAGE_SIZE redefinition and O_CREAT undeclear when
> - build with musl
> -
> -error 1:
> -
> -|stack_clash.c:50:22: error: expected identifier or '(' before numeric constant
> -| static unsigned long PAGE_SIZE;
> -
> -This is because the musl libc already contain PAGE_SIZE definition in limits.c,
> -we can check it here:
> -
> -    https://git.musl-libc.org/cgit/musl/tree/include/limits.h#n43
> -
> -error 2:
> -
> -|ck01.c:157:22: error: 'O_CREAT' undeclared (first use in this function); did you mean 'S_IREAD'?
> -|   fd = open(filename, O_CREAT | O_TRUNC | O_RDWR, 0644);
> -|                       ^~~~~~~
> -|                       S_IREAD
> -
> -This is because the musl libc put those in fcntl.h, so we should include that
> -file.
> -
> -Upstream-Status: Submitted [ https://github.com/linux-test-project/ltp/pull/194 ]
> -
> -Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ----
> - testcases/cve/stack_clash.c               | 12 ++++++------
> - testcases/kernel/syscalls/flock/flock01.c |  1 +
> - testcases/kernel/syscalls/flock/flock02.c |  1 +
> - 3 files changed, 8 insertions(+), 6 deletions(-)
> -
> -diff --git a/testcases/cve/stack_clash.c b/testcases/cve/stack_clash.c
> -index 2ef1a82..7c45991 100644
> ---- a/testcases/cve/stack_clash.c
> -+++ b/testcases/cve/stack_clash.c
> -@@ -47,7 +47,7 @@
> - #include "tst_test.h"
> - #include "tst_safe_stdio.h"
> -
> --static unsigned long PAGE_SIZE;
> -+static unsigned long PAGE_SIZE_tst;
> - static unsigned long PAGE_MASK;
> - static unsigned long GAP_PAGES = 256;
> - static unsigned long THRESHOLD;
> -@@ -66,7 +66,7 @@ void exhaust_stack_into_sigsegv(void)
> -       exhaust_stack_into_sigsegv();
> - }
> -
> --#define MAPPED_LEN PAGE_SIZE
> -+#define MAPPED_LEN PAGE_SIZE_tst
> - static unsigned long mapped_addr;
> -
> - void segv_handler(int sig, siginfo_t *info, void *data LTP_ATTRIBUTE_UNUSED)
> -@@ -150,7 +150,7 @@ void do_child(void)
> -       stack_t signal_stack;
> -       struct sigaction segv_sig = {.sa_sigaction = segv_handler, .sa_flags = SA_ONSTACK|SA_SIGINFO};
> -       void *map;
> --      unsigned long gap = GAP_PAGES * PAGE_SIZE;
> -+      unsigned long gap = GAP_PAGES * PAGE_SIZE_tst;
> -       struct rlimit rlimit;
> -
> -       rlimit.rlim_cur = rlimit.rlim_max = RLIM_INFINITY;
> -@@ -200,8 +200,8 @@ void setup(void)
> - {
> -       char buf[4096], *p;
> -
> --      PAGE_SIZE = sysconf(_SC_PAGESIZE);
> --      PAGE_MASK = ~(PAGE_SIZE - 1);
> -+      PAGE_SIZE_tst = sysconf(_SC_PAGESIZE);
> -+      PAGE_MASK = ~(PAGE_SIZE_tst - 1);
> -
> -       buf[4095] = '\0';
> -       SAFE_FILE_SCANF("/proc/cmdline", "%4095[^\n]", buf);
> -@@ -214,7 +214,7 @@ void setup(void)
> -               tst_res(TINFO, "stack_guard_gap = %ld", GAP_PAGES);
> -       }
> -
> --      THRESHOLD = (GAP_PAGES - 1) * PAGE_SIZE;
> -+      THRESHOLD = (GAP_PAGES - 1) * PAGE_SIZE_tst;
> -
> -       {
> -               volatile int *a = alloca(128);
> -diff --git a/testcases/kernel/syscalls/flock/flock01.c b/testcases/kernel/syscalls/flock/flock01.c
> -index 3e17be4..06d89e3 100644
> ---- a/testcases/kernel/syscalls/flock/flock01.c
> -+++ b/testcases/kernel/syscalls/flock/flock01.c
> -@@ -69,6 +69,7 @@
> - #include <stdio.h>
> - #include <sys/wait.h>
> - #include <sys/file.h>
> -+#include <fcntl.h>
> - #include "test.h"
> -
> - void setup(void);
> -diff --git a/testcases/kernel/syscalls/flock/flock02.c b/testcases/kernel/syscalls/flock/flock02.c
> -index 414df68..9ddf729 100644
> ---- a/testcases/kernel/syscalls/flock/flock02.c
> -+++ b/testcases/kernel/syscalls/flock/flock02.c
> -@@ -75,6 +75,7 @@
> - #include <sys/types.h>
> - #include <sys/file.h>
> - #include <sys/wait.h>
> -+#include <fcntl.h>
> - #include <errno.h>
> - #include <stdio.h>
> - #include "test.h"
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch b/meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch
> deleted file mode 100644
> index f7c0a4bf17..0000000000
> --- a/meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 2f6ab8f694b26b7f2566624f6d1f23788d6ab8a0 Mon Sep 17 00:00:00 2001
> -From: Jan Stancek <jstancek@redhat.com>
> -Date: Mon, 11 Sep 2017 12:57:58 +0200
> -Subject: [PATCH] commands/gdb01: replace stdin with /dev/null
> -
> -If this testcase runs as background process, gdb can receive
> -SIGTTOU and then testcase gets stuck.
> -
> -Signed-off-by: Jan Stancek <jstancek@redhat.com>
> -
> -Upstream-Status: Backport
> -[https://github.com/linux-test-project/ltp/commit/2f6ab8f694b26b7f2566624f6d1f23788d6ab8a0]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - testcases/commands/gdb/gdb01.sh | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/testcases/commands/gdb/gdb01.sh b/testcases/commands/gdb/gdb01.sh
> -index 07ae36f..e3a5b51 100755
> ---- a/testcases/commands/gdb/gdb01.sh
> -+++ b/testcases/commands/gdb/gdb01.sh
> -@@ -29,7 +29,7 @@ TST_NEEDS_CMDS="gdb /bin/cat"
> -
> - simple_test()
> - {
> --      gdb /bin/cat -ex "run /etc/passwd" -ex quit
> -+      gdb /bin/cat -ex "run /etc/passwd" -ex quit < /dev/null
> -       RC=$?
> -       if [ $RC -eq 0 ] ; then
> -               tst_res TPASS "gdb attached to process and completed run"
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb b/meta/recipes-extended/ltp/ltp_20170929.bb
> similarity index 96%
> rename from meta/recipes-extended/ltp/ltp_20170516.bb
> rename to meta/recipes-extended/ltp/ltp_20170929.bb
> index 653cbfd4ed..925dd91256 100644
> --- a/meta/recipes-extended/ltp/ltp_20170516.bb
> +++ b/meta/recipes-extended/ltp/ltp_20170929.bb
> @@ -21,7 +21,7 @@ DEPENDS_append_libc-musl = " fts "
>  EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
>  CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
> -SRCREV = "18916a2e6d8c997b7b29dcfa9550d5a15b22ed22"
> +SRCREV = "e671f2a13c695bbd87f7dfec2954ca7e3c43f377"
>
>  SRC_URI = "git://github.com/linux-test-project/ltp.git \
>             file://0001-add-_GNU_SOURCE-to-pec_listener.c.patch \
> @@ -48,8 +48,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
>             file://0034-periodic_output.patch \
>             file://0035-fix-test_proc_kill-hang.patch \
>             file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
> -           file://0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch \
> -           file://0038-commands-gdb01-replace-stdin-with-dev-null.patch \
>             "
>
>  S = "${WORKDIR}/git"
> --
> 2.14.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

