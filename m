Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id CA42972F84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 16:28:51 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id x71so60930083qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 08:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hv7XGfOmcZyul4O4c65xcfxhENnIudzbBU8VrPcElWg=;
	b=ovx3MrDzgj0v/lXyPm4cwM9iA/mQ9vMB/aP3pww9DJuqEzRs4kYDWgN+MWfBI4qhdL
	q4+o6qB0zOR/MbKcsRw/NbzdjIAy/dKK3lQz2fRpdCTT2mucSzpI5ak6mRdVhQVyIYnu
	yLa/jONv/Cdtus2+zf1qj0hi3LQS0XSvd76pmMqt6eHQplAdZjOenPEg69UBw2wOKm1D
	Z+bkeIuzROy/+3wUnp/EKCM+nUQTGtwhT9VVrzAQhsltB8fJy6XwWgnnPM9e1/OEUe4d
	B/ctzWhx9kVA47fl6200GsbPRWG+DRQ+jtQx+kwgW4ODIDSxwrsH4jyTXgz8zvtdFEkJ
	grMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hv7XGfOmcZyul4O4c65xcfxhENnIudzbBU8VrPcElWg=;
	b=eKmeX+4nHaRX4kCQJesnC1519MMZn8ZyysHK5II8vp5Rma/2l0ayZODN0VGMZzTiYV
	jl4JWunEKiTN4Dz4tc/lTuWYtWR9wVyuUkiEjTfIqPsrxr1PigJiFQRsu4+TE/sNMyAh
	t3Q27sjXeD4IXa6otN1sWUA4ZRoGGolt4knNTmo3nJ9jo9TKz/9AhyldYUkl2p0MKlPP
	95zA6W2RYCnuyEWOsltHvrr4RDbAXBYUnpFfvpKck4+M2QD1/FDIIKwQbhxBypf5IZlD
	X7mTawZavEON7ZbN4UsUlwNiBRbVybXcrK8HzdxaV3ZRGRUR/CLuyVTU12mkdgcAJNj/
	urdQ==
X-Gm-Message-State: AMke39koWpLpV7vECDfJHAFf10wCAwj82QxWALG5p2KvOIwjgynkcDD/lVnFFFJpNtv3qHLLk4LtT3x0N7x3uyHw
X-Received: by 10.55.47.4 with SMTP id v4mr25412534qkh.77.1487694531605; Tue,
	21 Feb 2017 08:28:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 21 Feb 2017 08:28:31 -0800 (PST)
In-Reply-To: <1c00a35e3fe8eea61912ec53b61409257152e7d7.1487648281.git.dengke.du@windriver.com>
References: <cover.1487648281.git.dengke.du@windriver.com>
	<1c00a35e3fe8eea61912ec53b61409257152e7d7.1487648281.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Feb 2017 16:28:31 +0000
Message-ID: <CAJTo0Lb4Vjg-1X7O8cQ05YxVeK407i0KM2Ah7m8hXcFwJJhGvg@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 1/1] ltp: upgrade to 20170116
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
X-List-Received-Date: Tue, 21 Feb 2017 16:28:52 -0000
Content-Type: multipart/alternative; boundary=001a114f410817583b05490ce0f5

--001a114f410817583b05490ce0f5
Content-Type: text/plain; charset=UTF-8

Fails with security flags enabled:

| In file included from ../../../../include/old/test.h:47:0,
|                  from fchmodat01.c:44:
| fchmodat01.c: In function 'setup':
| ../../../../include/old/old_safe_file_ops.h:55:27: error: format not a
string literal and no format arguments [-Werror=format-security]
|                    (path), (fmt), ## __VA_ARGS__)
|                            ^
| fchmodat01.c:130:2: note: in expansion of macro 'SAFE_FILE_PRINTF'
|   SAFE_FILE_PRINTF(cleanup, testfile, testfile);
|   ^~~~~~~~~~~~~~~~
| ../../../../include/old/old_safe_file_ops.h:55:27: error: format not a
string literal and no format arguments [-Werror=format-security]
|                    (path), (fmt), ## __VA_ARGS__)
|                            ^
| fchmodat01.c:131:2: note: in expansion of macro 'SAFE_FILE_PRINTF'
|   SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
|   ^~~~~~~~~~~~~~~~

Ross

On 21 February 2017 at 05:13, Dengke Du <dengke.du@windriver.com> wrote:

> 1. Upgrade ltp from 20160126 to 20170116.
>
> 2. Delete some patches because these have been integrated in upstream.
>
>         0001-ltp-Don-t-link-against-libfl.patch
>         0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
>         0007-replace-SIGCLD-with-SIGCHLD.patch
>         0009-Guard-error.h-with-__GLIBC__.patch
>         0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
>         0013-include-fcntl.h-for-getting-O_-definitions.patch
>         0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
>         0015-mincore01-Rename-PAGESIZE-to-pagesize.patch
>         0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
>         0017-replace-sigval_t-with-union-sigval.patch
>         0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
>         0022-include-sys-types.h.patch
>         0029-trace_shed-Fix-build-with-musl.patch
>         0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch
>         0032-regen.sh-Include-asm-unistd.h-explicitly.patch
>         0037-containers-netns_netlink-Avoid-segmentation-fault.patch
>         0038-run-posix-option-group-test-replace-CWD-qith-PWD.patch
>         0040-containers-userns05-use-unsigned-int-for-ns-id.patch
>
> 3. Add new patch based on Khem Raj's 0007-replace-SIGCLD-with-
> SIGCHLD.patch
>
>         0001-add-_GNU_SOURCE-to-pec_listener.c.patch
>
> 4. Add new patches fix building errors with musl:
>
>         0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
>         0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
>         0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch
>
> 5. Modify some patches because the upstream contains changes, those patches
>    maybe failed when they apply to the new version of ltp.
>
>         0011-Rename-sigset-variable-to-sigset1.patch
>         0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
>         0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
>         0035-fix-test_proc_kill-hang.patch
>
> 6. Rename and modify this patch.
>
>         fcntl-fix-the-time-def-to-use-time_t.patch to
>         0039-fcntl-fix-the-time-def-to-use-time_t.patch
>
> 7. The new version of ltp add the checking for ksh and csh, we doesn't
> support
>    ksh and csh in oe-core, so remove the checking files when the system
> executes
>    do_install function.
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  .../0001-add-_GNU_SOURCE-to-pec_listener.c.patch   |  39 ++
>  .../ltp/0001-ltp-Don-t-link-against-libfl.patch    |  30 --
>  ...TH_MAX-undeclared-when-building-with-musl.patch |  30 ++
>  ...sendfile-Use-off64_t-instead-of-__off64_t.patch |  31 --
>  ...RDSIZE-undeclared-when-building-with-musl.patch |  30 ++
>  .../ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch | 394
> ---------------------
>  .../ltp/0009-Guard-error.h-with-__GLIBC__.patch    | 270 --------------
>  ...ition-of-struct-msgbuf-error-building-wit.patch |  35 ++
>  .../0011-Rename-sigset-variable-to-sigset1.patch   |  77 ++--
>  ...fsstress.c-Replace-__int64_t-with-int64_t.patch | 351
> ------------------
>  ...nclude-fcntl.h-for-getting-O_-definitions.patch |  67 ----
>  ...ing-Include-sys-types.h-for-pid_t-definit.patch |  56 ---
>  ...015-mincore01-Rename-PAGESIZE-to-pagesize.patch |  64 ----
>  ...Change-header-from-ustat.h-to-sys-ustat.h.patch |  45 ---
>  .../0017-replace-sigval_t-with-union-sigval.patch  |  88 -----
>  ...lace-canonicalize_file_name-with-realpath.patch |  32 --
>  .../ltp/ltp/0022-include-sys-types.h.patch         |  29 --
>  ...sconf01-Use-_SC_2_C_VERSION-conditionally.patch |  23 +-
>  .../ltp/0029-trace_shed-Fix-build-with-musl.patch  |  32 --
>  ...READ_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch |  26 +-
>  ...age-size-offset-as-per-page-size-alignmen.patch |  33 --
>  ...-regen.sh-Include-asm-unistd.h-explicitly.patch |  30 --
>  .../ltp/ltp/0035-fix-test_proc_kill-hang.patch     |  27 +-
>  ...rs-netns_netlink-Avoid-segmentation-fault.patch |  50 ---
>  ...ix-option-group-test-replace-CWD-qith-PWD.patch |  44 ---
>  ...0039-fcntl-fix-the-time-def-to-use-time_t.patch |  17 +-
>  .../ltp/{ltp_20160126.bb => ltp_20170116.bb}       |  34 +-
>  27 files changed, 235 insertions(+), 1749 deletions(-)
>  create mode 100644 meta/recipes-extended/ltp/ltp/
> 0001-add-_GNU_SOURCE-to-pec_listener.c.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0001-ltp-Don-t-link-against-libfl.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/
> 0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-
> undeclared-when-building-with-musl.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0007-replace-SIGCLD-with-SIGCHLD.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0009-Guard-error.h-with-__GLIBC__.patch
>  create mode 100644 meta/recipes-extended/ltp/ltp/
> 0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0013-include-fcntl.h-for-getting-O_-definitions.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-
> PAGESIZE-to-pagesize.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0017-replace-sigval_t-with-union-sigval.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-
> canonicalize_file_name-with-realpath.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0022-include-sys-types.h.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0029-trace_shed-Fix-build-with-musl.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0032-regen.sh-Include-asm-unistd.h-explicitly.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0037-containers-netns_netlink-Avoid-segmentation-fault.patch
>  delete mode 100644 meta/recipes-extended/ltp/ltp/
> 0038-run-posix-option-group-test-replace-CWD-qith-PWD.patch
>  rename meta/recipes-extended/ltp/{ltp_20160126.bb => ltp_20170116.bb}
> (77%)
>
> diff --git a/meta/recipes-extended/ltp/ltp/0001-add-_GNU_SOURCE-to-pec_listener.c.patch
> b/meta/recipes-extended/ltp/ltp/0001-add-_GNU_SOURCE-to-
> pec_listener.c.patch
> new file mode 100644
> index 0000000..7ec66f8
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0001-add-_GNU_SOURCE-to-
> pec_listener.c.patch
> @@ -0,0 +1,39 @@
> +From ae10245c15a617bd57337981bb42eb36629f9b59 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Wed, 8 Feb 2017 15:53:31 +0800
> +Subject: [PATCH 01/26] add _GNU_SOURCE to pec_listener.c
> +
> +In previous patch 0007-replace-SIGCLD-with-SIGCHLD.patch made by Khem Raj
> +contains two aspects:
> +
> +       1. replace SIGCLD with SIGCHLD
> +       2. add _GNU_SOURCE to pec_listener.c
> +
> +The replace SIGCLD with SIGCHLD have been integrated upstream, so make a
> +another patch to add _GNU_SOURCE to pec_listener.c comply with Khem Raj's
> +previous patch.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +Upstream-Status: Pending
> +
> +%% original patch: 0001-add-_GNU_SOURCE-to-pec_listener.c.patch
> +---
> + testcases/kernel/connectors/pec/pec_listener.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/testcases/kernel/connectors/pec/pec_listener.c
> b/testcases/kernel/connectors/pec/pec_listener.c
> +index d11e4dc..b8b5e0d 100644
> +--- a/testcases/kernel/connectors/pec/pec_listener.c
> ++++ b/testcases/kernel/connectors/pec/pec_listener.c
> +@@ -20,6 +20,7 @@
> + /*
>       */
> + /***********************************************************
> *******************/
> +
> ++#define _GNU_SOURCE
> + #include <sys/socket.h>
> + #include <sys/poll.h>
> + #include <sys/types.h>
> +--
> +2.8.1
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0001-ltp-Don-t-link-against-libfl.patch
> b/meta/recipes-extended/ltp/ltp/0001-ltp-Don-t-link-against-libfl.patch
> deleted file mode 100644
> index 585b7cb..0000000
> --- a/meta/recipes-extended/ltp/ltp/0001-ltp-Don-t-link-
> against-libfl.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 14985fccf7428eaa0b45decc22bfd20fd780f621 Mon Sep 17 00:00:00 2001
> -From: Chong Lu <Chong.Lu@windriver.com>
> -Date: Tue, 11 Mar 2014 14:47:22 +0800
> -Subject: [PATCH 01/32] ltp: Don't link against libfl
> -
> -We have already defined yywrap function in scan.l file. After this, we no
> longer need to
> -link against libfl and so no longer get errors about undefined references
> to yylex.
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
> -@@ -31,7 +31,7 @@ CPPFLAGS             += -Wno-error
> -
> - CPPFLAGS              += -I$(abs_srcdir)
> -
> --LDLIBS                        += -lm $(LEXLIB)
> -+LDLIBS                        += -lm
> -
> - LFLAGS                        += -l
> -
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-
> undeclared-when-building-with-musl.patch b/meta/recipes-extended/ltp/
> ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
> new file mode 100644
> index 0000000..8874b95
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-
> undeclared-when-building-with-musl.patch
> @@ -0,0 +1,30 @@
> +From 32644bde4d33b677614534ec37030e57883b8e15 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Thu, 9 Feb 2017 16:41:12 +0800
> +Subject: [PATCH 1/3] fix PATH_MAX undeclared when building with musl
> +
> +fix PATH_MAX undeclared when building with musl.
> +
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +Upstream-Status: Pending
> +---
> + include/tst_test.h | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/include/tst_test.h b/include/tst_test.h
> +index 7ff33b2..9779c0e 100644
> +--- a/include/tst_test.h
> ++++ b/include/tst_test.h
> +@@ -19,6 +19,9 @@
> + #define TST_TEST_H__
> +
> + #include <unistd.h>
> ++#ifndef __GLIBC__
> ++#include <limits.h>
> ++#endif
> +
> + #include "tst_common.h"
> + #include "tst_res_flags.h"
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
> b/meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-
> instead-of-__off64_t.patch
> deleted file mode 100644
> index 56a48ab..0000000
> --- a/meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-
> instead-of-__off64_t.patch
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
> -diff --git a/testcases/kernel/syscalls/sendfile/Makefile
> b/testcases/kernel/syscalls/sendfile/Makefile
> -index df7b63f..1bd1b57 100644
> ---- a/testcases/kernel/syscalls/sendfile/Makefile
> -+++ b/testcases/kernel/syscalls/sendfile/Makefile
> -@@ -21,6 +21,6 @@ top_srcdir           ?= ../../../..
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
> diff --git a/meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-
> undeclared-when-building-with-musl.patch b/meta/recipes-extended/ltp/
> ltp/0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
> new file mode 100644
> index 0000000..8d0e739
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-
> undeclared-when-building-with-musl.patch
> @@ -0,0 +1,30 @@
> +From a2639bd0f0d3f9f3049ee33e6710fed06225f54f Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Thu, 9 Feb 2017 18:20:58 +0800
> +Subject: [PATCH 1/2] fix __WORDSIZE undeclared when building with musl
> +
> +fix __WORDSIZE undeclared when building with musl.
> +
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +Upstream-Status: Pending
> +---
> + include/old/test.h | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/include/old/test.h b/include/old/test.h
> +index d492560..263e92e 100644
> +--- a/include/old/test.h
> ++++ b/include/old/test.h
> +@@ -58,6 +58,9 @@
> + #include "tst_clone.h"
> + #include "old_device.h"
> + #include "old_tmpdir.h"
> ++#ifndef __GLIBC__
> ++#include <bits/reg.h>
> ++#endif
> +
> + /*
> +  * Ensure that NUMSIGS is defined.
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch
> b/meta/recipes-extended/ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch
> deleted file mode 100644
> index 4be906e..0000000
> --- a/meta/recipes-extended/ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch
> +++ /dev/null
> @@ -1,394 +0,0 @@
> -From 405c03171e4bf0edd698cb602cf7bd7fe1d0401a Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Jan 2016 19:33:53 +0000
> -Subject: [PATCH 07/32] replace SIGCLD with SIGCHLD
> -
> -its defined to use SIGCHLD anyway in
> -
> -bits/signum.h:#define     SIGCLD          SIGCHLD /* Same as SIGCHLD
> -(System V).  */
> -
> -plus it helps these tests compile with musl which adheres to posix
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - lib/tst_sig.c                                   |  8 ++++----
> - testcases/kernel/connectors/pec/pec_listener.c  |  1 +
> - testcases/kernel/fs/doio/doio.c                 |  4 ++--
> - testcases/kernel/fs/doio/growfiles.c            |  2 +-
> - testcases/kernel/syscalls/fcntl/fcntl11.c       |  8 ++++----
> - testcases/kernel/syscalls/fcntl/fcntl17.c       |  8 ++++----
> - testcases/kernel/syscalls/fcntl/fcntl19.c       |  8 ++++----
> - testcases/kernel/syscalls/fcntl/fcntl20.c       |  8 ++++----
> - testcases/kernel/syscalls/fcntl/fcntl21.c       |  8 ++++----
> - testcases/kernel/syscalls/kill/kill02.c         |  6 +++---
> - testcases/kernel/syscalls/kill/kill12.c         |  8 ++++----
> - testcases/kernel/syscalls/mkdir/mkdir09.c       | 12 ++++++------
> - testcases/kernel/syscalls/sighold/sighold02.c   |  2 +-
> - testcases/network/tcp_cmds/perf_lan/pingpong.c  |  2 +-
> - testcases/network/tcp_cmds/perf_lan/pingpong6.c |  2 +-
> - 15 files changed, 44 insertions(+), 43 deletions(-)
> -
> -diff --git a/lib/tst_sig.c b/lib/tst_sig.c
> -index 3af5ffd..36565e1 100644
> ---- a/lib/tst_sig.c
> -+++ b/lib/tst_sig.c
> -@@ -49,7 +49,7 @@
> -               fork_flag - set to FORK or NOFORK depending upon whether
> the
> -                       calling program executes a fork() system call.  It
> -                       is normally the case that the calling program
> treats
> --                      SIGCLD as an expected signal if fork() is being
> used.
> -+                      SIGCHLD as an expected signal if fork() is being
> used.
> -
> -               handler - a pointer to the unexpected signal handler to
> -                       be executed after an unexpected signal has been
> -@@ -82,7 +82,7 @@ static void (*tst_setup_signal(int, void (*)(int)))
> (int);
> -
> - /***********************************************************
> *****************
> -  * tst_sig() : set-up to catch unexpected signals.  fork_flag is set to
> NOFORK
> -- *    if SIGCLD is to be an "unexpected signal", otherwise it is set to
> -+ *    if SIGCHLD is to be an "unexpected signal", otherwise it is set to
> -  *    FORK.  cleanup points to a cleanup routine to be executed before
> -  *    tst_exit is called (cleanup is set to NULL if no cleanup is
> desired).
> -  *    handler is a pointer to the signal handling routine (if handler is
> -@@ -117,7 +117,7 @@ void tst_sig(int fork_flag, void (*handler) (), void
> (*cleanup) ())
> -       for (sig = 1; sig < NSIG; sig++) {
> -               /*
> -                * SIGKILL is never unexpected.
> --               * SIGCLD is only unexpected when
> -+               * SIGCHLD is only unexpected when
> -                *    no forking is being done.
> -                * SIGINFO is used for file quotas and should be expected
> -                */
> -@@ -205,7 +205,7 @@ void tst_sig(int fork_flag, void (*handler) (), void
> (*cleanup) ())
> - #endif
> -                       break;
> -
> --              case SIGCLD:
> -+              case SIGCHLD:
> -                       if (fork_flag == FORK)
> -                               continue;
> -
> -diff --git a/testcases/kernel/connectors/pec/pec_listener.c
> b/testcases/kernel/connectors/pec/pec_listener.c
> -index a1beb13..002750a 100644
> ---- a/testcases/kernel/connectors/pec/pec_listener.c
> -+++ b/testcases/kernel/connectors/pec/pec_listener.c
> -@@ -20,6 +20,7 @@
> - /*
>       */
> - /***********************************************************
> *******************/
> -
> -+#define _GNU_SOURCE
> - #include <sys/socket.h>
> - #include <sys/poll.h>
> - #include <sys/types.h>
> -diff --git a/testcases/kernel/fs/doio/doio.c b/testcases/kernel/fs/doio/
> doio.c
> -index 4b0dec5..5f65ef9 100644
> ---- a/testcases/kernel/fs/doio/doio.c
> -+++ b/testcases/kernel/fs/doio/doio.c
> -@@ -573,7 +573,7 @@ int main(int argc, char **argv)
> -               case SIGTSTP:
> -               case SIGSTOP:
> -               case SIGCONT:
> --              case SIGCLD:
> -+              case SIGCHLD:
> -               case SIGBUS:
> -               case SIGSEGV:
> -               case SIGQUIT:
> -@@ -615,7 +615,7 @@ int main(int argc, char **argv)
> -       }
> -
> -       sigemptyset(&block_mask);
> --      sigaddset(&block_mask, SIGCLD);
> -+      sigaddset(&block_mask, SIGCHLD);
> -       sigprocmask(SIG_BLOCK, &block_mask, &omask);
> -
> -       /*
> -diff --git a/testcases/kernel/fs/doio/growfiles.c
> b/testcases/kernel/fs/doio/growfiles.c
> -index 09e7f35..bbad230 100644
> ---- a/testcases/kernel/fs/doio/growfiles.c
> -+++ b/testcases/kernel/fs/doio/growfiles.c
> -@@ -1640,7 +1640,7 @@ int set_sig(void)
> - #ifdef SIGRESTART
> -               case SIGRESTART:
> - #endif /* SIGRESTART */
> --              case SIGCLD:
> -+              case SIGCHLD:
> -                       break;
> -
> -               default:
> -diff --git a/testcases/kernel/syscalls/fcntl/fcntl11.c
> b/testcases/kernel/syscalls/fcntl/fcntl11.c
> -index fa6ce53..2de2b6c 100644
> ---- a/testcases/kernel/syscalls/fcntl/fcntl11.c
> -+++ b/testcases/kernel/syscalls/fcntl/fcntl11.c
> -@@ -105,10 +105,10 @@ void setup(void)
> -       memset(&act, 0, sizeof(act));
> -       act.sa_handler = catch_child;
> -       sigemptyset(&act.sa_mask);
> --      sigaddset(&act.sa_mask, SIGCLD);
> --      if ((sigaction(SIGCLD, &act, NULL)) < 0)
> -+      sigaddset(&act.sa_mask, SIGCHLD);
> -+      if ((sigaction(SIGCHLD, &act, NULL)) < 0)
> -               tst_brkm(TBROK | TERRNO, cleanup,
> --                       "sigaction(SIGCLD, ..) failed");
> -+                       "sigaction(SIGCHLD, ..) failed");
> - }
> -
> - void do_child(void)
> -@@ -227,7 +227,7 @@ void stop_child(void)
> - {
> -       struct flock fl;
> -
> --      signal(SIGCLD, SIG_DFL);
> -+      signal(SIGCHLD, SIG_DFL);
> -       fl.l_type = STOP;
> -       parent_put(&fl);
> -       wait(0);
> -diff --git a/testcases/kernel/syscalls/fcntl/fcntl17.c
> b/testcases/kernel/syscalls/fcntl/fcntl17.c
> -index 5b03e39..6598b20 100644
> ---- a/testcases/kernel/syscalls/fcntl/fcntl17.c
> -+++ b/testcases/kernel/syscalls/fcntl/fcntl17.c
> -@@ -150,9 +150,9 @@ int setup(void)
> -       memset(&act, 0, sizeof(act));
> -       act.sa_handler = catch_child;
> -       sigemptyset(&act.sa_mask);
> --      sigaddset(&act.sa_mask, SIGCLD);
> --      if (sigaction(SIGCLD, &act, NULL) < 0) {
> --              tst_resm(TFAIL, "SIGCLD signal setup failed, errno: %d",
> errno);
> -+      sigaddset(&act.sa_mask, SIGCHLD);
> -+      if (sigaction(SIGCHLD, &act, NULL) < 0) {
> -+              tst_resm(TFAIL, "SIGCHLD signal setup failed, errno: %d",
> errno);
> -               return 1;
> -       }
> -       return 0;
> -@@ -381,7 +381,7 @@ void stop_children(void)
> - {
> -       int arg;
> -
> --      signal(SIGCLD, SIG_DFL);
> -+      signal(SIGCHLD, SIG_DFL);
> -       arg = STOP;
> -       child_free(child_pipe1[1], arg);
> -       child_free(child_pipe2[1], arg);
> -diff --git a/testcases/kernel/syscalls/fcntl/fcntl19.c
> b/testcases/kernel/syscalls/fcntl/fcntl19.c
> -index a542cfc..88c91d6 100644
> ---- a/testcases/kernel/syscalls/fcntl/fcntl19.c
> -+++ b/testcases/kernel/syscalls/fcntl/fcntl19.c
> -@@ -112,9 +112,9 @@ void setup(void)
> -       memset(&act, 0, sizeof(act));
> -       act.sa_handler = catch_child;
> -       sigemptyset(&act.sa_mask);
> --      sigaddset(&act.sa_mask, SIGCLD);
> --      if ((sigaction(SIGCLD, &act, NULL)) < 0) {
> --              tst_resm(TFAIL, "SIGCLD signal setup failed, errno: %d",
> errno);
> -+      sigaddset(&act.sa_mask, SIGCHLD);
> -+      if ((sigaction(SIGCHLD, &act, NULL)) < 0) {
> -+              tst_resm(TFAIL, "SIGCHLD signal setup failed, errno: %d",
> errno);
> -               fail = 1;
> -       }
> - }
> -@@ -265,7 +265,7 @@ void stop_child(void)
> - {
> -       struct flock fl;
> -
> --      signal(SIGCLD, SIG_DFL);
> -+      signal(SIGCHLD, SIG_DFL);
> -       fl.l_type = STOP;
> -       parent_put(&fl);
> -       wait(0);
> -diff --git a/testcases/kernel/syscalls/fcntl/fcntl20.c
> b/testcases/kernel/syscalls/fcntl/fcntl20.c
> -index aa06bab..99fd783 100644
> ---- a/testcases/kernel/syscalls/fcntl/fcntl20.c
> -+++ b/testcases/kernel/syscalls/fcntl/fcntl20.c
> -@@ -109,9 +109,9 @@ void setup(void)
> -       memset(&act, 0, sizeof(act));
> -       act.sa_handler = catch_child;
> -       sigemptyset(&act.sa_mask);
> --      sigaddset(&act.sa_mask, SIGCLD);
> --      if (sigaction(SIGCLD, &act, NULL) == -1)
> --              tst_brkm(TFAIL | TERRNO, cleanup, "SIGCLD signal setup
> failed");
> -+      sigaddset(&act.sa_mask, SIGCHLD);
> -+      if (sigaction(SIGCHLD, &act, NULL) == -1)
> -+              tst_brkm(TFAIL | TERRNO, cleanup, "SIGCHLD signal setup
> failed");
> - }
> -
> - void cleanup(void)
> -@@ -264,7 +264,7 @@ void stop_child(void)
> - {
> -       struct flock fl;
> -
> --      signal(SIGCLD, SIG_DFL);
> -+      signal(SIGCHLD, SIG_DFL);
> -       fl.l_type = STOP;
> -       parent_put(&fl);
> -       wait(0);
> -diff --git a/testcases/kernel/syscalls/fcntl/fcntl21.c
> b/testcases/kernel/syscalls/fcntl/fcntl21.c
> -index 5307021..8f1a67c 100644
> ---- a/testcases/kernel/syscalls/fcntl/fcntl21.c
> -+++ b/testcases/kernel/syscalls/fcntl/fcntl21.c
> -@@ -110,9 +110,9 @@ void setup(void)
> -       memset(&act, 0, sizeof(act));
> -       act.sa_handler = catch_child;
> -       sigemptyset(&act.sa_mask);
> --      sigaddset(&act.sa_mask, SIGCLD);
> --      if ((sigaction(SIGCLD, &act, NULL)) < 0) {
> --              tst_resm(TFAIL, "SIGCLD signal setup failed, errno: %d",
> errno);
> -+      sigaddset(&act.sa_mask, SIGCHLD);
> -+      if ((sigaction(SIGCHLD, &act, NULL)) < 0) {
> -+              tst_resm(TFAIL, "SIGCHLD signal setup failed, errno: %d",
> errno);
> -               fail = 1;
> -       }
> - }
> -@@ -272,7 +272,7 @@ void stop_child(void)
> - {
> -       struct flock fl;
> -
> --      signal(SIGCLD, SIG_DFL);
> -+      signal(SIGCHLD, SIG_DFL);
> -       fl.l_type = STOP;
> -       parent_put(&fl);
> -       wait(0);
> -diff --git a/testcases/kernel/syscalls/kill/kill02.c
> b/testcases/kernel/syscalls/kill/kill02.c
> -index 9d6cc68..08360dd 100644
> ---- a/testcases/kernel/syscalls/kill/kill02.c
> -+++ b/testcases/kernel/syscalls/kill/kill02.c
> -@@ -701,7 +701,7 @@ void setup(void)
> -
> -       /*
> -        *  Set to catch unexpected signals.
> --       *  SIGCLD is set to be ignored because we do not wait for
> termination status.
> -+       *  SIGCHLD is set to be ignored because we do not wait for
> termination status.
> -        *  SIGUSR1 is set to be ignored because this is the signal we are
> using for
> -        *  the test and we are not concerned with the parent getting it.
> -        */
> -@@ -713,9 +713,9 @@ void setup(void)
> -                        "signal(SIGUSR1, SIG_IGN) failed");
> -       }
> -
> --      if (signal(SIGCLD, SIG_IGN) == SIG_ERR) {
> -+      if (signal(SIGCHLD, SIG_IGN) == SIG_ERR) {
> -               tst_brkm(TBROK | TERRNO, NULL,
> --                       "signal(SIGCLD, SIG_IGN) failed");
> -+                       "signal(SIGCHLD, SIG_IGN) failed");
> -       }
> -
> -       TEST_PAUSE;
> -diff --git a/testcases/kernel/syscalls/kill/kill12.c
> b/testcases/kernel/syscalls/kill/kill12.c
> -index 7a47a4a..d7c4147 100644
> ---- a/testcases/kernel/syscalls/kill/kill12.c
> -+++ b/testcases/kernel/syscalls/kill/kill12.c
> -@@ -98,7 +98,7 @@ int main(int argc, char **argv)
> -
> -       exno = 1;
> -
> --      if (sigset(SIGCLD, chsig) == SIG_ERR) {
> -+      if (sigset(SIGCHLD, chsig) == SIG_ERR) {
> -               fprintf(temp, "\tsigset failed, errno = %d\n", errno);
> -               fail_exit();
> -       }
> -@@ -128,7 +128,7 @@ int main(int argc, char **argv)
> -                               sleep(1);
> -
> -                       kill(pid, sig); /* child should ignroe this sig */
> --                      kill(pid, SIGCLD);      /* child should exit */
> -+                      kill(pid, SIGCHLD);     /* child should exit */
> -
> - #ifdef BCS
> -                       while ((npid = wait(&status)) != pid
> -@@ -222,14 +222,14 @@ void do_child(void)
> -       int exno = 1;
> -
> - #ifdef UCLINUX
> --      if (sigset(SIGCLD, chsig) == SIG_ERR) {
> -+      if (sigset(SIGCHLD, chsig) == SIG_ERR) {
> -               fprintf(temp, "\tsigset failed, errno = %d\n", errno);
> -               fail_exit();
> -       }
> - #endif
> -
> -       sigset(sig, SIG_IGN);   /* set to ignore signal */
> --      kill(getppid(), SIGCLD);        /* tell parent we are ready */
> -+      kill(getppid(), SIGCHLD);       /* tell parent we are ready */
> -       while (!chflag)
> -               sleep(1);       /* wait for parent */
> -
> -diff --git a/testcases/kernel/syscalls/mkdir/mkdir09.c
> b/testcases/kernel/syscalls/mkdir/mkdir09.c
> -index 41c20e9..07b4fb8 100644
> ---- a/testcases/kernel/syscalls/mkdir/mkdir09.c
> -+++ b/testcases/kernel/syscalls/mkdir/mkdir09.c
> -@@ -122,10 +122,10 @@ int main(int argc, char *argv[])
> -
> -       }
> -
> --      /* Set up to catch SIGCLD signal */
> --      if (signal(SIGCLD, chld) == SIG_ERR) {
> -+      /* Set up to catch SIGCHLD signal */
> -+      if (signal(SIGCHLD, chld) == SIG_ERR) {
> -               tst_brkm(TFAIL, cleanup,
> --                       "Error setting up SIGCLD signal, ERRNO = %d",
> errno);
> -+                       "Error setting up SIGCHLD signal, ERRNO = %d",
> errno);
> -
> -       }
> -
> -@@ -236,9 +236,9 @@ int runtest(void)
> -               tst_brkm(TFAIL, cleanup,
> -                        "Error resetting SIGTERM signal, ERRNO = %d",
> errno);
> -       }
> --      if (signal(SIGCLD, SIG_DFL) == SIG_ERR) {
> -+      if (signal(SIGCHLD, SIG_DFL) == SIG_ERR) {
> -               tst_brkm(TFAIL, cleanup,
> --                       "Error resetting SIGCLD signal, ERRNO = %d",
> errno);
> -+                       "Error resetting SIGCHLD signal, ERRNO = %d",
> errno);
> -       }
> -
> -       if (test_time) {
> -@@ -372,7 +372,7 @@ void term(int sig)
> -
> - void chld(int sig)
> - {
> --      /* Routine to handle SIGCLD signal. */
> -+      /* Routine to handle SIGCHLD signal. */
> -
> -       sigchld++;
> -       if (jump) {
> -diff --git a/testcases/kernel/syscalls/sighold/sighold02.c
> b/testcases/kernel/syscalls/sighold/sighold02.c
> -index e3076fb..be01874 100644
> ---- a/testcases/kernel/syscalls/sighold/sighold02.c
> -+++ b/testcases/kernel/syscalls/sighold/sighold02.c
> -@@ -77,7 +77,7 @@ static int sigs_map[NUMSIGS];
> - static int skip_sig(int sig)
> - {
> -       switch (sig) {
> --      case SIGCLD:
> -+      case SIGCHLD:
> -       case SIGKILL:
> -       case SIGALRM:
> -       case SIGSTOP:
> -diff --git a/testcases/network/tcp_cmds/perf_lan/pingpong.c
> b/testcases/network/tcp_cmds/perf_lan/pingpong.c
> -index 1196312..5b06798 100644
> ---- a/testcases/network/tcp_cmds/perf_lan/pingpong.c
> -+++ b/testcases/network/tcp_cmds/perf_lan/pingpong.c
> -@@ -182,7 +182,7 @@ int main(int argc, char *argv[])
> -
> -       /* Setup traps */
> -       signal(SIGINT, finish);
> --      signal(SIGCLD, finish);
> -+      signal(SIGCHLD, finish);
> -
> -       /* Fork a child process to continue sending packets */
> -       tst_resm(TINFO, "Create a child process to continue to send
> packets");
> -diff --git a/testcases/network/tcp_cmds/perf_lan/pingpong6.c
> b/testcases/network/tcp_cmds/perf_lan/pingpong6.c
> -index 9747f58..0a0fb1d 100644
> ---- a/testcases/network/tcp_cmds/perf_lan/pingpong6.c
> -+++ b/testcases/network/tcp_cmds/perf_lan/pingpong6.c
> -@@ -153,7 +153,7 @@ char *argv[];
> -
> -       /* Setup traps */
> -       signal(SIGINT, finish);
> --      signal(SIGCLD, finish);
> -+      signal(SIGCHLD, finish);
> -
> -       /* Fork a child process to continue sending packets */
> -       printf("Create a child process to continue to send packets \n");
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0009-Guard-error.h-with-__GLIBC__.patch
> b/meta/recipes-extended/ltp/ltp/0009-Guard-error.h-with-__GLIBC__.patch
> deleted file mode 100644
> index e58e5a9..0000000
> --- a/meta/recipes-extended/ltp/ltp/0009-Guard-error.h-with-__
> GLIBC__.patch
> +++ /dev/null
> @@ -1,270 +0,0 @@
> -From 4ba19d64e95a874995d0b554b891b5ec35bd9495 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Jan 2016 19:45:35 +0000
> -Subject: [PATCH 09/32] Guard error.h with __GLIBC__
> -
> -error API is specific to glibc so use the guard to make it conditional
> -on glibc
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - testcases/kernel/syscalls/faccessat/faccessat01.c   | 2 ++
> - testcases/kernel/syscalls/fallocate/fallocate01.c   | 2 ++
> - testcases/kernel/syscalls/fchmodat/fchmodat01.c     | 2 ++
> - testcases/kernel/syscalls/fchownat/fchownat01.c     | 2 ++
> - testcases/kernel/syscalls/fchownat/fchownat02.c     | 2 ++
> - testcases/kernel/syscalls/fstatat/fstatat01.c       | 2 ++
> - testcases/kernel/syscalls/futimesat/futimesat01.c   | 2 ++
> - testcases/kernel/syscalls/linkat/linkat01.c         | 2 ++
> - testcases/kernel/syscalls/linkat/linkat02.c         | 2 ++
> - testcases/kernel/syscalls/mkdirat/mkdirat01.c       | 2 ++
> - testcases/kernel/syscalls/mknodat/mknodat01.c       | 2 ++
> - testcases/kernel/syscalls/mknodat/mknodat02.c       | 2 ++
> - testcases/kernel/syscalls/openat/openat01.c         | 2 ++
> - testcases/kernel/syscalls/readlinkat/readlinkat01.c | 2 ++
> - testcases/kernel/syscalls/renameat/renameat01.c     | 2 ++
> - testcases/kernel/syscalls/symlinkat/symlinkat01.c   | 2 ++
> - testcases/kernel/syscalls/unlinkat/unlinkat01.c     | 2 ++
> - 17 files changed, 34 insertions(+)
> -
> -diff --git a/testcases/kernel/syscalls/faccessat/faccessat01.c
> b/testcases/kernel/syscalls/faccessat/faccessat01.c
> -index 7f0e87a..c72dcf0 100644
> ---- a/testcases/kernel/syscalls/faccessat/faccessat01.c
> -+++ b/testcases/kernel/syscalls/faccessat/faccessat01.c
> -@@ -37,7 +37,9 @@
> - #include <sys/stat.h>
> - #include <fcntl.h>
> - #include <unistd.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> -diff --git a/testcases/kernel/syscalls/fallocate/fallocate01.c
> b/testcases/kernel/syscalls/fallocate/fallocate01.c
> -index e72b123..643c0e2 100644
> ---- a/testcases/kernel/syscalls/fallocate/fallocate01.c
> -+++ b/testcases/kernel/syscalls/fallocate/fallocate01.c
> -@@ -96,7 +96,9 @@
> - #include <fcntl.h>
> - #include <sys/syscall.h>
> - #include <unistd.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <inttypes.h>
> - #include <sys/utsname.h>
> -
> -diff --git a/testcases/kernel/syscalls/fchmodat/fchmodat01.c
> b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
> -index 19e9ad5..ae6d807 100644
> ---- a/testcases/kernel/syscalls/fchmodat/fchmodat01.c
> -+++ b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
> -@@ -37,7 +37,9 @@
> - #include <sys/stat.h>
> - #include <fcntl.h>
> - #include <unistd.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> -diff --git a/testcases/kernel/syscalls/fchownat/fchownat01.c
> b/testcases/kernel/syscalls/fchownat/fchownat01.c
> -index b361253..a5218af 100644
> ---- a/testcases/kernel/syscalls/fchownat/fchownat01.c
> -+++ b/testcases/kernel/syscalls/fchownat/fchownat01.c
> -@@ -28,7 +28,9 @@
> - #include <sys/stat.h>
> - #include <fcntl.h>
> - #include <unistd.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> -diff --git a/testcases/kernel/syscalls/fchownat/fchownat02.c
> b/testcases/kernel/syscalls/fchownat/fchownat02.c
> -index 6b0304c..8d2863f 100644
> ---- a/testcases/kernel/syscalls/fchownat/fchownat02.c
> -+++ b/testcases/kernel/syscalls/fchownat/fchownat02.c
> -@@ -26,7 +26,9 @@
> - #include <sys/stat.h>
> - #include <fcntl.h>
> - #include <unistd.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> -diff --git a/testcases/kernel/syscalls/fstatat/fstatat01.c
> b/testcases/kernel/syscalls/fstatat/fstatat01.c
> -index 61531c6..e99fbd2 100644
> ---- a/testcases/kernel/syscalls/fstatat/fstatat01.c
> -+++ b/testcases/kernel/syscalls/fstatat/fstatat01.c
> -@@ -48,7 +48,9 @@
> - #include <sys/stat.h>
> - #include <sys/time.h>
> - #include <fcntl.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> -diff --git a/testcases/kernel/syscalls/futimesat/futimesat01.c
> b/testcases/kernel/syscalls/futimesat/futimesat01.c
> -index ae8d4fe..316dd78 100644
> ---- a/testcases/kernel/syscalls/futimesat/futimesat01.c
> -+++ b/testcases/kernel/syscalls/futimesat/futimesat01.c
> -@@ -37,7 +37,9 @@
> - #include <sys/stat.h>
> - #include <sys/time.h>
> - #include <fcntl.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> -diff --git a/testcases/kernel/syscalls/linkat/linkat01.c
> b/testcases/kernel/syscalls/linkat/linkat01.c
> -index fc0687b..83cbfe7 100644
> ---- a/testcases/kernel/syscalls/linkat/linkat01.c
> -+++ b/testcases/kernel/syscalls/linkat/linkat01.c
> -@@ -49,7 +49,9 @@
> - #include <sys/time.h>
> - #include <fcntl.h>
> - #include <unistd.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> -diff --git a/testcases/kernel/syscalls/linkat/linkat02.c
> b/testcases/kernel/syscalls/linkat/linkat02.c
> -index e9a752a..8d7e431 100644
> ---- a/testcases/kernel/syscalls/linkat/linkat02.c
> -+++ b/testcases/kernel/syscalls/linkat/linkat02.c
> -@@ -23,7 +23,9 @@
> - #include <sys/stat.h>
> - #include <fcntl.h>
> - #include <unistd.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> -diff --git a/testcases/kernel/syscalls/mkdirat/mkdirat01.c
> b/testcases/kernel/syscalls/mkdirat/mkdirat01.c
> -index 7e15947..1dbc038 100644
> ---- a/testcases/kernel/syscalls/mkdirat/mkdirat01.c
> -+++ b/testcases/kernel/syscalls/mkdirat/mkdirat01.c
> -@@ -30,7 +30,9 @@
> - #include <sys/types.h>
> - #include <sys/stat.h>
> - #include <fcntl.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> -diff --git a/testcases/kernel/syscalls/mknodat/mknodat01.c
> b/testcases/kernel/syscalls/mknodat/mknodat01.c
> -index 26e5538..f034f05 100644
> ---- a/testcases/kernel/syscalls/mknodat/mknodat01.c
> -+++ b/testcases/kernel/syscalls/mknodat/mknodat01.c
> -@@ -29,7 +29,9 @@
> - #include <sys/types.h>
> - #include <fcntl.h>
> - #include <sys/stat.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> -diff --git a/testcases/kernel/syscalls/mknodat/mknodat02.c
> b/testcases/kernel/syscalls/mknodat/mknodat02.c
> -index f6368fa..7d0f7c0 100644
> ---- a/testcases/kernel/syscalls/mknodat/mknodat02.c
> -+++ b/testcases/kernel/syscalls/mknodat/mknodat02.c
> -@@ -29,7 +29,9 @@
> - #include <sys/types.h>
> - #include <fcntl.h>
> - #include <sys/stat.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> -diff --git a/testcases/kernel/syscalls/openat/openat01.c
> b/testcases/kernel/syscalls/openat/openat01.c
> -index 85f9a91..4ee0117 100644
> ---- a/testcases/kernel/syscalls/openat/openat01.c
> -+++ b/testcases/kernel/syscalls/openat/openat01.c
> -@@ -29,7 +29,9 @@
> - #include <sys/types.h>
> - #include <sys/stat.h>
> - #include <fcntl.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> -diff --git a/testcases/kernel/syscalls/readlinkat/readlinkat01.c
> b/testcases/kernel/syscalls/readlinkat/readlinkat01.c
> -index 97a49e8..b162853 100644
> ---- a/testcases/kernel/syscalls/readlinkat/readlinkat01.c
> -+++ b/testcases/kernel/syscalls/readlinkat/readlinkat01.c
> -@@ -29,7 +29,9 @@
> - #include <sys/stat.h>
> - #include <sys/time.h>
> - #include <fcntl.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> -diff --git a/testcases/kernel/syscalls/renameat/renameat01.c
> b/testcases/kernel/syscalls/renameat/renameat01.c
> -index f4cd51b..105a05b 100644
> ---- a/testcases/kernel/syscalls/renameat/renameat01.c
> -+++ b/testcases/kernel/syscalls/renameat/renameat01.c
> -@@ -42,7 +42,9 @@
> - #include <sys/stat.h>
> - #include <sys/time.h>
> - #include <fcntl.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> -diff --git a/testcases/kernel/syscalls/symlinkat/symlinkat01.c
> b/testcases/kernel/syscalls/symlinkat/symlinkat01.c
> -index 5c238d8..cb7a7e8 100644
> ---- a/testcases/kernel/syscalls/symlinkat/symlinkat01.c
> -+++ b/testcases/kernel/syscalls/symlinkat/symlinkat01.c
> -@@ -37,7 +37,9 @@
> - #include <sys/stat.h>
> - #include <sys/time.h>
> - #include <fcntl.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> -diff --git a/testcases/kernel/syscalls/unlinkat/unlinkat01.c
> b/testcases/kernel/syscalls/unlinkat/unlinkat01.c
> -index 31fe4e7..26f6d9a 100644
> ---- a/testcases/kernel/syscalls/unlinkat/unlinkat01.c
> -+++ b/testcases/kernel/syscalls/unlinkat/unlinkat01.c
> -@@ -37,7 +37,9 @@
> - #include <sys/stat.h>
> - #include <sys/time.h>
> - #include <fcntl.h>
> -+#ifdef __GLIBC__
> - #include <error.h>
> -+#endif
> - #include <stdlib.h>
> - #include <errno.h>
> - #include <string.h>
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0009-fix-redefinition-of-
> struct-msgbuf-error-building-wit.patch b/meta/recipes-extended/ltp/
> ltp/0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch
> new file mode 100644
> index 0000000..6886c55
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0009-fix-redefinition-of-
> struct-msgbuf-error-building-wit.patch
> @@ -0,0 +1,35 @@
> +From 2d7ea67e8eaa41cbd6816f7ab654254b40b530a1 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Thu, 9 Feb 2017 17:17:37 +0800
> +Subject: [PATCH] fix redefinition of 'struct msgbuf' error building with
> musl
> +
> +When building with musl the file "sys/msg.h" already contain 'struct
> msgbuf'
> +
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +Upstream-Status: Pending
> +---
> + testcases/kernel/syscalls/ipc/msgrcv/msgrcv08.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv08.c
> b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv08.c
> +index a757c0d..e023114 100644
> +--- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv08.c
> ++++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv08.c
> +@@ -47,11 +47,13 @@ const char *TCID = "msgrcv08";
> + const int TST_TOTAL = 1;
> +
> + #if __WORDSIZE == 32
> +-
> ++#ifdef __GLIBC__
> + struct msgbuf {
> +       long mtype;     /* message type, must be > 0 */
> +       char mtext[16]; /* message data */
> + };
> ++#else
> ++#endif
> +
> + static void msr(int msqid)
> + {
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
> b/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-
> variable-to-sigset1.patch
> index 945280c..4ac14dc 100644
> --- a/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-
> variable-to-sigset1.patch
> +++ b/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-
> variable-to-sigset1.patch
> @@ -1,11 +1,12 @@
> -From aff0e2a8f011fa80b472355355a7e8cdacd50189 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 7 Jan 2016 19:53:30 +0000
> -Subject: [PATCH 11/32] Rename sigset variable to sigset1
> +From dc1905b6d972f9176b40da270c83d8fb4d1751b5 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Wed, 8 Feb 2017 16:12:34 +0800
> +Subject: [PATCH 2/5] Rename sigset variable to sigset1
>
>  sigset API from signal.h is shadowed by this name conflict
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
>  ---
>   testcases/kernel/mem/shmt/shmt04.c                    | 10 +++++-----
>   testcases/kernel/mem/shmt/shmt06.c                    | 10 +++++-----
> @@ -13,15 +14,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   3 files changed, 15 insertions(+), 15 deletions(-)
>
>  diff --git a/testcases/kernel/mem/shmt/shmt04.c
> b/testcases/kernel/mem/shmt/shmt04.c
> -index 7203e9e..fce87d6 100644
> +index b2682da..3f35fad 100644
>  --- a/testcases/kernel/mem/shmt/shmt04.c
>  +++ b/testcases/kernel/mem/shmt/shmt04.c
>  @@ -56,7 +56,7 @@ int TST_TOTAL = 2;           /* Total number of test
> cases. */
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
> @@ -29,12 +30,12 @@ index 7203e9e..fce87d6 100644
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
> @@ -42,21 +43,21 @@ index 7203e9e..fce87d6 100644
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
>  diff --git a/testcases/kernel/mem/shmt/shmt06.c
> b/testcases/kernel/mem/shmt/shmt06.c
> -index a3c9ca3..77b0fc9 100644
> +index dd69de7..56fb1da 100644
>  --- a/testcases/kernel/mem/shmt/shmt06.c
>  +++ b/testcases/kernel/mem/shmt/shmt06.c
>  @@ -57,7 +57,7 @@ int TST_TOTAL = 2;           /* Total number of test
> cases. */
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
> @@ -64,12 +65,12 @@ index a3c9ca3..77b0fc9 100644
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
> @@ -77,21 +78,21 @@ index a3c9ca3..77b0fc9 100644
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
>  diff --git a/testcases/kernel/syscalls/sigprocmask/sigprocmask01.c
> b/testcases/kernel/syscalls/sigprocmask/sigprocmask01.c
> -index 20fca52..6fb1d57 100644
> +index 232d25a..06d902f 100644
>  --- a/testcases/kernel/syscalls/sigprocmask/sigprocmask01.c
>  +++ b/testcases/kernel/syscalls/sigprocmask/sigprocmask01.c
>  @@ -91,7 +91,7 @@ int TST_TOTAL = 1;
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
> @@ -99,8 +100,8 @@ index 20fca52..6fb1d57 100644
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
> @@ -108,8 +109,8 @@ index 20fca52..6fb1d57 100644
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
> @@ -117,8 +118,8 @@ index 20fca52..6fb1d57 100644
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
> @@ -126,11 +127,11 @@ index 20fca52..6fb1d57 100644
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
>  --
> -2.7.0
> +2.7.4
>
> diff --git a/meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
> b/meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__
> int64_t-with-int64_t.patch
> deleted file mode 100644
> index e1532c1..0000000
> --- a/meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__
> int64_t-with-int64_t.patch
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
> - testcases/network/nfs/nfs_fsstress/fsstress.c | 47
> ++++++++++++++-------------
> - 2 files changed, 40 insertions(+), 38 deletions(-)
> -
> -diff --git a/testcases/kernel/fs/fsstress/fsstress.c
> b/testcases/kernel/fs/fsstress/fsstress.c
> -index 2f89903..89f0b19 100644
> ---- a/testcases/kernel/fs/fsstress/fsstress.c
> -+++ b/testcases/kernel/fs/fsstress/fsstress.c
> -@@ -36,6 +36,7 @@
> - #ifdef HAVE_SYS_PRCTL_H
> - # include <sys/prctl.h>
> - #endif
> -+#include <limits.h>
> -
> - #define XFS_ERRTAG_MAX                17
> -
> -@@ -1572,7 +1573,7 @@ void bulkstat_f(int opno, long r)
> -       __u64 last;
> -       __s32 nent;
> -       xfs_bstat_t *t;
> --      __int64_t total;
> -+      int64_t total;
> -       xfs_fsop_bulkreq_t bsr;
> -
> -       last = 0;
> -@@ -1764,14 +1765,14 @@ int setdirect(int fd)
> -
> - void dread_f(int opno, long r)
> - {
> --      __int64_t align;
> -+      int64_t align;
> -       char *buf = NULL;
> -       struct dioattr diob;
> -       int e;
> -       pathname_t f;
> -       int fd;
> -       size_t len;
> --      __int64_t lr;
> -+      int64_t lr;
> -       off64_t off;
> -       struct stat64 stb;
> -       int v;
> -@@ -1835,8 +1836,8 @@ void dread_f(int opno, long r)
> -               return;
> -       }
> - #endif
> --      align = (__int64_t) diob.d_miniosz;
> --      lr = ((__int64_t) random() << 32) + random();
> -+      align = (int64_t) diob.d_miniosz;
> -+      lr = ((int64_t) random() << 32) + random();
> -       off = (off64_t) (lr % stb.st_size);
> -       off -= (off % align);
> -       lseek64(fd, off, SEEK_SET);
> -@@ -1865,14 +1866,14 @@ void dread_f(int opno, long r)
> -
> - void dwrite_f(int opno, long r)
> - {
> --      __int64_t align;
> -+      int64_t align;
> -       char *buf = NULL;
> -       struct dioattr diob;
> -       int e;
> -       pathname_t f;
> -       int fd;
> -       size_t len;
> --      __int64_t lr;
> -+      int64_t lr;
> -       off64_t off;
> -       struct stat64 stb;
> -       int v;
> -@@ -1925,8 +1926,8 @@ void dwrite_f(int opno, long r)
> -               return;
> -       }
> - #endif
> --      align = (__int64_t) diob.d_miniosz;
> --      lr = ((__int64_t) random() << 32) + random();
> -+      align = (int64_t) diob.d_miniosz;
> -+      lr = ((int64_t) random() << 32) + random();
> -       off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> -       off -= (off % align);
> -       lseek64(fd, off, SEEK_SET);
> -@@ -2224,7 +2225,7 @@ void read_f(int opno, long r)
> -       pathname_t f;
> -       int fd;
> -       size_t len;
> --      __int64_t lr;
> -+      int64_t lr;
> -       off64_t off;
> -       struct stat64 stb;
> -       int v;
> -@@ -2262,7 +2263,7 @@ void read_f(int opno, long r)
> -               close(fd);
> -               return;
> -       }
> --      lr = ((__int64_t) random() << 32) + random();
> -+      lr = ((int64_t) random() << 32) + random();
> -       off = (off64_t) (lr % stb.st_size);
> -       lseek64(fd, off, SEEK_SET);
> -       len = (random() % (getpagesize() * 32)) + 1;
> -@@ -2509,7 +2510,7 @@ void truncate_f(int opno, long r)
> - {
> -       int e;
> -       pathname_t f;
> --      __int64_t lr;
> -+      int64_t lr;
> -       off64_t off;
> -       struct stat64 stb;
> -       int v;
> -@@ -2530,7 +2531,7 @@ void truncate_f(int opno, long r)
> -               free_pathname(&f);
> -               return;
> -       }
> --      lr = ((__int64_t) random() << 32) + random();
> -+      lr = ((int64_t) random() << 32) + random();
> -       off = lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE);
> -       off %= maxfsize;
> -       e = truncate64_path(&f, off) < 0 ? errno : 0;
> -@@ -2626,7 +2627,7 @@ void write_f(int opno, long r)
> -       pathname_t f;
> -       int fd;
> -       size_t len;
> --      __int64_t lr;
> -+      int64_t lr;
> -       off64_t off;
> -       struct stat64 stb;
> -       int v;
> -@@ -2656,7 +2657,7 @@ void write_f(int opno, long r)
> -               close(fd);
> -               return;
> -       }
> --      lr = ((__int64_t) random() << 32) + random();
> -+      lr = ((int64_t) random() << 32) + random();
> -       off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> -       off %= maxfsize;
> -       lseek64(fd, off, SEEK_SET);
> -diff --git a/testcases/network/nfs/nfs_fsstress/fsstress.c
> b/testcases/network/nfs/nfs_fsstress/fsstress.c
> -index ac91262..a34c416 100644
> ---- a/testcases/network/nfs/nfs_fsstress/fsstress.c
> -+++ b/testcases/network/nfs/nfs_fsstress/fsstress.c
> -@@ -31,6 +31,7 @@
> -  */
> -
> - #include "global.h"
> -+#include <limits.h>
> -
> - #define XFS_ERRTAG_MAX                17
> -
> -@@ -1368,7 +1369,7 @@ void allocsp_f(int opno, long r)
> -       pathname_t f;
> -       int fd;
> -       struct flock64 fl;
> --      __int64_t lr;
> -+      int64_t lr;
> -       off64_t off;
> -       struct stat64 stb;
> -       int v;
> -@@ -1398,7 +1399,7 @@ void allocsp_f(int opno, long r)
> -               close(fd);
> -               return;
> -       }
> --      lr = ((__int64_t) random() << 32) + random();
> -+      lr = ((int64_t) random() << 32) + random();
> -       off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> -       off %= maxfsize;
> -       fl.l_whence = SEEK_SET;
> -@@ -1519,7 +1520,7 @@ void bulkstat_f(int opno, long r)
> -       __uint64_t last;
> -       int nent;
> -       xfs_bstat_t *t;
> --      __int64_t total;
> -+      int64_t total;
> -       xfs_fsop_bulkreq_t bsr;
> -
> -       last = 0;
> -@@ -1708,14 +1709,14 @@ int setdirect(int fd)
> -
> - void dread_f(int opno, long r)
> - {
> --      __int64_t align;
> -+      int64_t align;
> -       char *buf;
> -       struct dioattr diob;
> -       int e;
> -       pathname_t f;
> -       int fd;
> -       size_t len;
> --      __int64_t lr;
> -+      int64_t lr;
> -       off64_t off;
> -       struct stat64 stb;
> -       int v;
> -@@ -1775,8 +1776,8 @@ void dread_f(int opno, long r)
> -               return;
> -       }
> - #endif
> --      align = (__int64_t) diob.d_miniosz;
> --      lr = ((__int64_t) random() << 32) + random();
> -+      align = (int64_t) diob.d_miniosz;
> -+      lr = ((int64_t) random() << 32) + random();
> -       off = (off64_t) (lr % stb.st_size);
> -       off -= (off % align);
> -       lseek64(fd, off, SEEK_SET);
> -@@ -1798,14 +1799,14 @@ void dread_f(int opno, long r)
> -
> - void dwrite_f(int opno, long r)
> - {
> --      __int64_t align;
> -+      int64_t align;
> -       char *buf;
> -       struct dioattr diob;
> -       int e;
> -       pathname_t f;
> -       int fd;
> -       size_t len;
> --      __int64_t lr;
> -+      int64_t lr;
> -       off64_t off;
> -       struct stat64 stb;
> -       int v;
> -@@ -1854,8 +1855,8 @@ void dwrite_f(int opno, long r)
> -               return;
> -       }
> - #endif
> --      align = (__int64_t) diob.d_miniosz;
> --      lr = ((__int64_t) random() << 32) + random();
> -+      align = (int64_t) diob.d_miniosz;
> -+      lr = ((int64_t) random() << 32) + random();
> -       off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> -       off -= (off % align);
> -       lseek64(fd, off, SEEK_SET);
> -@@ -1917,7 +1918,7 @@ void freesp_f(int opno, long r)
> -       pathname_t f;
> -       int fd;
> -       struct flock64 fl;
> --      __int64_t lr;
> -+      int64_t lr;
> -       off64_t off;
> -       struct stat64 stb;
> -       int v;
> -@@ -1947,7 +1948,7 @@ void freesp_f(int opno, long r)
> -               close(fd);
> -               return;
> -       }
> --      lr = ((__int64_t) random() << 32) + random();
> -+      lr = ((int64_t) random() << 32) + random();
> -       off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> -       off %= maxfsize;
> -       fl.l_whence = SEEK_SET;
> -@@ -2145,7 +2146,7 @@ void read_f(int opno, long r)
> -       pathname_t f;
> -       int fd;
> -       size_t len;
> --      __int64_t lr;
> -+      int64_t lr;
> -       off64_t off;
> -       struct stat64 stb;
> -       int v;
> -@@ -2183,7 +2184,7 @@ void read_f(int opno, long r)
> -               close(fd);
> -               return;
> -       }
> --      lr = ((__int64_t) random() << 32) + random();
> -+      lr = ((int64_t) random() << 32) + random();
> -       off = (off64_t) (lr % stb.st_size);
> -       lseek64(fd, off, SEEK_SET);
> -       len = (random() % (getpagesize() * 32)) + 1;
> -@@ -2281,7 +2282,7 @@ void resvsp_f(int opno, long r)
> -       pathname_t f;
> -       int fd;
> -       struct flock64 fl;
> --      __int64_t lr;
> -+      int64_t lr;
> -       off64_t off;
> -       struct stat64 stb;
> -       int v;
> -@@ -2311,7 +2312,7 @@ void resvsp_f(int opno, long r)
> -               close(fd);
> -               return;
> -       }
> --      lr = ((__int64_t) random() << 32) + random();
> -+      lr = ((int64_t) random() << 32) + random();
> -       off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> -       off %= maxfsize;
> -       fl.l_whence = SEEK_SET;
> -@@ -2428,7 +2429,7 @@ void truncate_f(int opno, long r)
> - {
> -       int e;
> -       pathname_t f;
> --      __int64_t lr;
> -+      int64_t lr;
> -       off64_t off;
> -       struct stat64 stb;
> -       int v;
> -@@ -2449,7 +2450,7 @@ void truncate_f(int opno, long r)
> -               free_pathname(&f);
> -               return;
> -       }
> --      lr = ((__int64_t) random() << 32) + random();
> -+      lr = ((int64_t) random() << 32) + random();
> -       off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> -       off %= maxfsize;
> -       e = truncate64_path(&f, off) < 0 ? errno : 0;
> -@@ -2491,7 +2492,7 @@ void unresvsp_f(int opno, long r)
> -       pathname_t f;
> -       int fd;
> -       struct flock64 fl;
> --      __int64_t lr;
> -+      int64_t lr;
> -       off64_t off;
> -       struct stat64 stb;
> -       int v;
> -@@ -2521,7 +2522,7 @@ void unresvsp_f(int opno, long r)
> -               close(fd);
> -               return;
> -       }
> --      lr = ((__int64_t) random() << 32) + random();
> -+      lr = ((int64_t) random() << 32) + random();
> -       off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> -       off %= maxfsize;
> -       fl.l_whence = SEEK_SET;
> -@@ -2543,7 +2544,7 @@ void write_f(int opno, long r)
> -       pathname_t f;
> -       int fd;
> -       size_t len;
> --      __int64_t lr;
> -+      int64_t lr;
> -       off64_t off;
> -       struct stat64 stb;
> -       int v;
> -@@ -2573,7 +2574,7 @@ void write_f(int opno, long r)
> -               close(fd);
> -               return;
> -       }
> --      lr = ((__int64_t) random() << 32) + random();
> -+      lr = ((int64_t) random() << 32) + random();
> -       off = (off64_t) (lr % MIN(stb.st_size + (1024 * 1024), MAXFSIZE));
> -       off %= maxfsize;
> -       lseek64(fd, off, SEEK_SET);
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-getting-O_-definitions.patch
> b/meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-
> getting-O_-definitions.patch
> deleted file mode 100644
> index 4266e4f..0000000
> --- a/meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-
> getting-O_-definitions.patch
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
> -diff --git a/testcases/kernel/ipc/ipc_stress/shmem_test_03.c
> b/testcases/kernel/ipc/ipc_stress/shmem_test_03.c
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
> -diff --git a/testcases/kernel/syscalls/mq_notify/mq_notify01.c
> b/testcases/kernel/syscalls/mq_notify/mq_notify01.c
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
> -diff --git a/testcases/network/tcp_cmds/sendfile/testsf_c.c
> b/testcases/network/tcp_cmds/sendfile/testsf_c.c
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
> -diff --git a/testcases/network/tcp_cmds/sendfile/testsf_s.c
> b/testcases/network/tcp_cmds/sendfile/testsf_s.c
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
> diff --git a/meta/recipes-extended/ltp/ltp/0014-hyperthreading-
> Include-sys-types.h-for-pid_t-definit.patch b/meta/recipes-extended/ltp/
> ltp/0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
> deleted file mode 100644
> index 84d81e9..0000000
> --- a/meta/recipes-extended/ltp/ltp/0014-hyperthreading-
> Include-sys-types.h-for-pid_t-definit.patch
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
> -diff --git a/testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h
> b/testcases/kernel/sched/hyperthreading/ht_affinity/ht_utils.h
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
> -diff --git a/testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h
> b/testcases/kernel/sched/hyperthreading/ht_enabled/ht_utils.h
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
> -diff --git a/testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h
> b/testcases/kernel/sched/hyperthreading/ht_interrupt/ht_utils.h
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
> diff --git a/meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-PAGESIZE-to-pagesize.patch
> b/meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-
> PAGESIZE-to-pagesize.patch
> deleted file mode 100644
> index 963536f..0000000
> --- a/meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-
> PAGESIZE-to-pagesize.patch
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
> -diff --git a/testcases/kernel/syscalls/mincore/mincore01.c
> b/testcases/kernel/syscalls/mincore/mincore01.c
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
> -       }
> -
> -       tc->addr = global_pointer;
> --      tc->len = as_lim.rlim_cur - (rlim_t)global_pointer + PAGESIZE;
> -+      tc->len = as_lim.rlim_cur - (rlim_t)global_pointer + pagesize;
> -       tc->vector = global_vec;
> -
> -       /*
> -@@ -161,7 +161,7 @@ static void setup(void)
> -       char *buf;
> -       int fd;
> -
> --      PAGESIZE = getpagesize();
> -+      pagesize = getpagesize();
> -
> -       tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -@@ -170,7 +170,7 @@ static void setup(void)
> -       TEST_PAUSE;
> -
> -       /* global_pointer will point to a mmapped area of global_len bytes
> */
> --      global_len = PAGESIZE * 2;
> -+      global_len = pagesize * 2;
> -
> -       buf = SAFE_MALLOC(cleanup, global_len);
> -       memset(buf, 42, global_len);
> -@@ -186,7 +186,7 @@ static void setup(void)
> -                                  PROT_READ | PROT_WRITE, MAP_SHARED, fd,
> 0);
> -
> -       global_vec = SAFE_MALLOC(cleanup,
> --                               (global_len + PAGESIZE - 1) / PAGESIZE);
> -+                               (global_len + pagesize - 1) / pagesize);
> -
> -       SAFE_CLOSE(cleanup, fd);
> - }
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-
> from-ustat.h-to-sys-ustat.h.patch b/meta/recipes-extended/ltp/
> ltp/0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
> deleted file mode 100644
> index 1b5b93a..0000000
> --- a/meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-
> from-ustat.h-to-sys-ustat.h.patch
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
> -diff --git a/testcases/kernel/syscalls/ustat/ustat01.c
> b/testcases/kernel/syscalls/ustat/ustat01.c
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
> -diff --git a/testcases/kernel/syscalls/ustat/ustat02.c
> b/testcases/kernel/syscalls/ustat/ustat02.c
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
> diff --git a/meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-with-union-sigval.patch
> b/meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-
> with-union-sigval.patch
> deleted file mode 100644
> index ed25802..0000000
> --- a/meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-
> with-union-sigval.patch
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
> -diff --git a/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c
> b/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c
> -index d186c1f..bc03544 100644
> ---- a/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c
> -+++ b/testcases/kernel/syscalls/timer_getoverrun/timer_getoverrun01.c
> -@@ -54,7 +54,7 @@ int main(int ac, char **av)
> -
> -       setup();
> -
> --      ev.sigev_value = (sigval_t) 0;
> -+      ev.sigev_value = (union sigval) 0;
> -       ev.sigev_signo = SIGALRM;
> -       ev.sigev_notify = SIGEV_SIGNAL;
> -       TEST(ltp_syscall(__NR_timer_create, CLOCK_REALTIME, &ev, &timer));
> -diff --git a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
> b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
> -index b583aee..9371a6a 100644
> ---- a/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
> -+++ b/testcases/kernel/syscalls/timer_gettime/timer_gettime01.c
> -@@ -55,7 +55,7 @@ int main(int ac, char **av)
> -
> -       setup();
> -
> --      ev.sigev_value = (sigval_t) 0;
> -+      ev.sigev_value = (union sigval) 0;
> -       ev.sigev_signo = SIGALRM;
> -       ev.sigev_notify = SIGEV_SIGNAL;
> -       TEST(ltp_syscall(__NR_timer_create, CLOCK_REALTIME, &ev, &timer));
> -diff --git a/testcases/kernel/timers/timer_create/timer_create02.c
> b/testcases/kernel/timers/timer_create/timer_create02.c
> -index 7f528ed..1127400 100644
> ---- a/testcases/kernel/timers/timer_create/timer_create02.c
> -+++ b/testcases/kernel/timers/timer_create/timer_create02.c
> -@@ -142,7 +142,7 @@ void setup_test(int option)
> - {
> -       switch (option) {
> -       case 0:
> --              evp.sigev_value = (sigval_t) 0;
> -+              evp.sigev_value = (union sigval) 0;
> -               evp.sigev_signo = SIGALRM;
> -               evp.sigev_notify = SIGEV_SIGNAL;
> -               evp_ptr = &evp;
> -@@ -151,7 +151,7 @@ void setup_test(int option)
> -               evp_ptr = NULL;
> -               break;
> -       case 2:
> --              evp.sigev_value = (sigval_t) 0;
> -+              evp.sigev_value = (union sigval) 0;
> -               evp.sigev_signo = SIGALRM;      /* any will do */
> -               evp.sigev_notify = SIGEV_NONE;
> -               evp_ptr = &evp;
> -diff --git a/testcases/kernel/timers/timer_create/timer_create03.c
> b/testcases/kernel/timers/timer_create/timer_create03.c
> -index 291fcfa..8b01bf7 100644
> ---- a/testcases/kernel/timers/timer_create/timer_create03.c
> -+++ b/testcases/kernel/timers/timer_create/timer_create03.c
> -@@ -129,7 +129,7 @@ void setup_test(int option)
> - {
> -       switch (option) {
> -       case 0:
> --              evp.sigev_value = (sigval_t) 0;
> -+              evp.sigev_value = (union sigval) 0;
> -               evp.sigev_signo = SIGALRM;
> -               evp.sigev_notify = SIGEV_SIGNAL;
> -               evp_ptr = &evp;
> -@@ -138,7 +138,7 @@ void setup_test(int option)
> -               evp_ptr = NULL;
> -               break;
> -       case 2:
> --              evp.sigev_value = (sigval_t) 0;
> -+              evp.sigev_value = (union sigval) 0;
> -               evp.sigev_signo = SIGALRM;      /* any will do */
> -               evp.sigev_notify = SIGEV_NONE;
> -               evp_ptr = &evp;
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-
> canonicalize_file_name-with-realpath.patch b/meta/recipes-extended/ltp/
> ltp/0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
> deleted file mode 100644
> index 0a4c5f0..0000000
> --- a/meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-
> canonicalize_file_name-with-realpath.patch
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
> -diff --git a/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
> b/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
> -index da4af0f..5c1a3ca 100644
> ---- a/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
> -+++ b/testcases/kernel/security/tomoyo/tomoyo_filesystem_test.c
> -@@ -274,9 +274,9 @@ int main(int argc, char *argv[])
> -       /* Test mount(). */
> -       {
> -               static char buf[4096];
> --              char *dev_ram_path = canonicalize_file_name("/dev/ram0");
> -+              char *dev_ram_path = realpath("/dev/ram0", NULL);
> -               if (!dev_ram_path)
> --                      dev_ram_path = canonicalize_file_name("/dev/ram");
> -+                      dev_ram_path = realpath("/dev/ram", NULL);
> -               if (!dev_ram_path) {
> -                       dev_ram_path = "/dev/ram0";
> -                       mknod(dev_ram_path, S_IFBLK, MKDEV(1, 0));
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0022-include-sys-types.h.patch
> b/meta/recipes-extended/ltp/ltp/0022-include-sys-types.h.patch
> deleted file mode 100644
> index 413b44a..0000000
> --- a/meta/recipes-extended/ltp/ltp/0022-include-sys-types.h.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 7ac6fd51991ac61d1d7594f601d87842060ee284 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 8 Jan 2016 07:06:11 +0000
> -Subject: [PATCH 22/32] include sys/types.h
> -
> -Fixes
> -
> -error: unknown type name 'uint'
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - testcases/kernel/ipc/ipc_stress/shmem_test_04.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/testcases/kernel/ipc/ipc_stress/shmem_test_04.c
> b/testcases/kernel/ipc/ipc_stress/shmem_test_04.c
> -index 72c2e60..e7e5f61 100644
> ---- a/testcases/kernel/ipc/ipc_stress/shmem_test_04.c
> -+++ b/testcases/kernel/ipc/ipc_stress/shmem_test_04.c
> -@@ -65,6 +65,7 @@
> - #include <signal.h>
> - #include <stdint.h>
> - #include <sys/mman.h>
> -+#include <sys/types.h>
> -
> - #ifdef _LINUX_
> - typedef unsigned long ulong_t;
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
> b/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_
> C_VERSION-conditionally.patch
> index b47d097..f75e33b 100644
> --- a/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_
> C_VERSION-conditionally.patch
> +++ b/meta/recipes-extended/ltp/ltp/0027-sysconf01-Use-_SC_2_
> C_VERSION-conditionally.patch
> @@ -1,29 +1,30 @@
> -From 4a74b275acc8158850f2500928a1467c3482c986 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 8 Jan 2016 07:23:11 +0000
> -Subject: [PATCH 27/32] sysconf01: Use _SC_2_C_VERSION conditionally
> +From 1471012164ba8f26046d4b1ce5531a0d92805ef5 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Wed, 8 Feb 2017 16:21:16 +0800
> +Subject: [PATCH 4/5] sysconf01: Use _SC_2_C_VERSION conditionally
>
>  _SC_2_C_VERSION is not available on musl
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
>  ---
>   testcases/kernel/syscalls/sysconf/sysconf01.c | 2 ++
>   1 file changed, 2 insertions(+)
>
>  diff --git a/testcases/kernel/syscalls/sysconf/sysconf01.c
> b/testcases/kernel/syscalls/sysconf/sysconf01.c
> -index 8542e77..e806943 100644
> +index 583deef..de93695 100644
>  --- a/testcases/kernel/syscalls/sysconf/sysconf01.c
>  +++ b/testcases/kernel/syscalls/sysconf/sysconf01.c
> -@@ -102,7 +102,9 @@ int main(void)
> -       test_sysconf(_SC_ATEXIT_MAX);
> +@@ -103,7 +103,9 @@ int main(void)
>         test_sysconf(_SC_2_C_BIND);
>         test_sysconf(_SC_2_C_DEV);
> + #ifdef _SC_2_C_VERSION
>  +#ifdef __GLIBC__
>         test_sysconf(_SC_2_C_VERSION);
>  +#endif
> -       /* 21 - 25 */
> -       test_sysconf(_SC_2_CHAR_TERM);
> -       test_sysconf(_SC_2_FORT_DEV);
> + #else
> +       tst_resm(TCONF, "_SC_2_C_VERSION not defined");
> + #endif
>  --
> -2.7.0
> +2.7.4
>
> diff --git a/meta/recipes-extended/ltp/ltp/0029-trace_shed-Fix-build-with-musl.patch
> b/meta/recipes-extended/ltp/ltp/0029-trace_shed-Fix-build-with-musl.patch
> deleted file mode 100644
> index f7ece9e..0000000
> --- a/meta/recipes-extended/ltp/ltp/0029-trace_shed-Fix-build-
> with-musl.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 2f8a57f66a94210d34dd0361659a8297cf3d813f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 8 Jan 2016 07:29:24 +0000
> -Subject: [PATCH 29/32] trace_shed: Fix build with musl
> -
> -Errors on musl are
> -
> -trace_sched.c:425:16: error: invalid operands to binary & (have
> -'thread_sched_t * {aka struct <anonymous> *}' and 'int')
> -      thrd_ndx, WEXITSTATUS(status));
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - testcases/kernel/sched/tool/trace_sched.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/testcases/kernel/sched/tool/trace_sched.c
> b/testcases/kernel/sched/tool/trace_sched.c
> -index 7815686..30dca5f 100644
> ---- a/testcases/kernel/sched/tool/trace_sched.c
> -+++ b/testcases/kernel/sched/tool/trace_sched.c
> -@@ -422,7 +422,7 @@ int main(int argc,         /* number of input
> parameters.                        */
> -                       if (status == (thread_sched_t *) - 1) {
> -                               fprintf(stderr,
> -                                       "thread [%d] - process exited with
> errors %d\n",
> --                                      thrd_ndx, WEXITSTATUS(status));
> -+                                      thrd_ndx,
> WEXITSTATUS((int)status));
> -                               exit(-1);
> -                       } else {
> -                               exp_prio[thrd_ndx] = status->exp_prio;
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_
> MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch b/meta/recipes-extended/ltp/
> ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
> index d2d6d76..c5fac9b 100644
> --- a/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_
> MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
> +++ b/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_
> MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
> @@ -1,33 +1,33 @@
> -From 77c95dacffe90382a1f131c801ac569120d95949 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 8 Jan 2016 07:32:24 +0000
> -Subject: [PATCH 30/32] lib: Use PTHREAD_MUTEX_RECURSIVE in place of
> +From 00ba7cdd0608b1507027428f9f87b1cb9747372b Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Thu, 9 Feb 2017 15:54:53 +0800
> +Subject: [PATCH] lib: Use PTHREAD_MUTEX_RECURSIVE in place of
>   PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP for non-glibc
>
>  e.g. musl does not implement the _NP mutex types
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
>  ---
> - lib/tst_res.c | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> + lib/tst_res.c | 4 ++++
> + 1 file changed, 4 insertions(+)
>
>  diff --git a/lib/tst_res.c b/lib/tst_res.c
> -index 5c1c58c..3244b5e 100644
> +index 61daaeb..435224f 100644
>  --- a/lib/tst_res.c
>  +++ b/lib/tst_res.c
> -@@ -104,8 +104,11 @@ int TEST_ERRNO;
> +@@ -79,7 +79,11 @@ int TEST_ERRNO;
>         assert(strlen(buf) > 0);                \
>   } while (0)
>
>  +#ifdef __GLIBC__
>   static pthread_mutex_t tmutex = PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP;
> --
>  +#else
>  +static pthread_mutex_t tmutex = {  PTHREAD_MUTEX_RECURSIVE };
>  +#endif
> - /*
> -  * Define local function prototypes.
> -  */
> +
> + static void check_env(void);
> + static void tst_condense(int tnum, int ttype, const char *tmesg);
>  --
> -2.7.0
> +2.7.4
>
> diff --git a/meta/recipes-extended/ltp/ltp/0031-vma03-fix-page-size-
> offset-as-per-page-size-alignmen.patch b/meta/recipes-extended/ltp/
> ltp/0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch
> deleted file mode 100644
> index 473ca4c..0000000
> --- a/meta/recipes-extended/ltp/ltp/0031-vma03-fix-page-size-
> offset-as-per-page-size-alignmen.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 293ff1da06748ed4c69be6ece262d42e562e7298 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 8 Jan 2016 07:36:19 +0000
> -Subject: [PATCH 31/32] vma03: fix page size offset as per page size
> alignment
> -
> -the offset the param of mmap2() doesn't align the page size, but,
> -this param allow must be a multiple of the page size as returned
> -by sysconf(_SC_PAGE_SIZE).meanwhile offset * 4096 must be a
> -multiple of the system page size, so modify the input param of offset
> -pgoff = (ULONG_MAX - 1)&(~((pgsz-1)>>12));
> -
> -Signed-off-by: Chuang Dong <Chuang.Dong@windriver.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - testcases/kernel/mem/vma/vma03.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/testcases/kernel/mem/vma/vma03.c b/testcases/kernel/mem/vma/
> vma03.c
> -index ad8a7b4..a539233 100644
> ---- a/testcases/kernel/mem/vma/vma03.c
> -+++ b/testcases/kernel/mem/vma/vma03.c
> -@@ -85,7 +85,7 @@ int main(int argc, char *argv[])
> -               if (fd == -1)
> -                       tst_brkm(TBROK | TERRNO, NULL, "open %s",
> TESTFILE);
> -
> --              pgoff = ULONG_MAX - 1;
> -+              pgoff = (ULONG_MAX - 1)&(~((pgsz-1)>>12));
> -               map = mmap2(NULL, pgsz, PROT_READ | PROT_WRITE,
> MAP_PRIVATE,
> -                           fd, pgoff);
> -               if (map == MAP_FAILED)
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-unistd.h-explicitly.patch
> b/meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-
> unistd.h-explicitly.patch
> deleted file mode 100644
> index 5c6bf91..0000000
> --- a/meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-
> unistd.h-explicitly.patch
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
> -diff --git a/testcases/kernel/include/regen.sh
> b/testcases/kernel/include/regen.sh
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
> diff --git a/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch
> b/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch
> index 32ae8aa..71e32a5 100644
> --- a/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch
> +++ b/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch
> @@ -1,23 +1,32 @@
> -Fix test_proc_kill hanging
> +From f7c602b639db0d118e07d3fa7b6deead0be0c72b Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Wed, 8 Feb 2017 16:17:17 +0800
> +Subject: [PATCH 3/5] Fix test_proc_kill hanging
>
>  Sometimes the signal is delivered to memcg_process before the framework
> took
>  into consideration its pid entered in the tasks. Fixed by delaying the
> signal
>  send command.
>
>  Signed-off-by: George Nita <george.nita@enea.com>
> -Upstream-Status: Pending
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +
> +Upstream-Status: Pending
> +---
> + testcases/kernel/controllers/memcg/functional/memcg_lib.sh | 1 +
> + 1 file changed, 1 insertion(+)
>
>  diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
> b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
> -index ffbe006..e81bf74 100755
> +index b785fe3..2918cc5 100755
>  --- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
>  +++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
> -@@ -220,8 +220,8 @@ test_proc_kill()
> -
> -       $TEST_PATH/memcg_process $2 -s $3 &
> +@@ -283,6 +283,7 @@ test_proc_kill()
>         pid=$!
> --      sleep 1
> +       TST_CHECKPOINT_WAIT 0
>         echo $pid > tasks
>  +      sleep 1
>
> -       kill -s USR1 $pid 2> /dev/null
> -       sleep 1
> +       signal_memcg_process $pid $3
> +
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-extended/ltp/ltp/0037-containers-netns_
> netlink-Avoid-segmentation-fault.patch b/meta/recipes-extended/ltp/
> ltp/0037-containers-netns_netlink-Avoid-segmentation-fault.patch
> deleted file mode 100644
> index 18d1f72..0000000
> --- a/meta/recipes-extended/ltp/ltp/0037-containers-netns_
> netlink-Avoid-segmentation-fault.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 193ce739b2a5174269a958b00c3a5590de944e0d Mon Sep 17 00:00:00 2001
> -From: Huacai Chen <chenhc@lemote.com>
> -Date: Thu, 27 Oct 2016 14:45:52 +0800
> -Subject: [PATCH] containers/netns_netlink: Avoid segmentation fault
> -
> -In order to avoid segmentation fault (use NULL as a function pointer),
> -this patch modify check_netns() by passing a dummy function pointer to
> -do_clone_unshare_test().
> -
> -Signed-off-by: Huacai Chen <chenhc@lemote.com>
> -Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - testcases/kernel/containers/netns/netns_helper.h | 10 ++++++++--
> - 1 file changed, 8 insertions(+), 2 deletions(-)
> -
> -diff --git a/testcases/kernel/containers/netns/netns_helper.h
> b/testcases/kernel/containers/netns/netns_helper.h
> -index 2a331ae..7df6dcb 100644
> ---- a/testcases/kernel/containers/netns/netns_helper.h
> -+++ b/testcases/kernel/containers/netns/netns_helper.h
> -@@ -56,6 +56,12 @@ static void check_iproute(unsigned int spe_ipver)
> -       pclose(ipf);
> - }
> -
> -+static int dummy(void *arg)
> -+{
> -+      (void) arg;
> -+      return 0;
> -+}
> -+
> - static void check_netns(void)
> - {
> -       int pid, status;
> -@@ -64,8 +70,8 @@ static void check_netns(void)
> -               tst_brkm(TCONF | TERRNO, NULL, "CLONE_NEWNS (%d) not
> supported",
> -                        CLONE_NEWNS);
> -
> --      pid = do_clone_unshare_test(T_UNSHARE, CLONE_NEWNET |
> CLONE_NEWNS, NULL,
> --                      NULL);
> -+      pid = do_clone_unshare_test(T_UNSHARE, CLONE_NEWNET | CLONE_NEWNS,
> -+                                  dummy, NULL);
> -       if (pid == -1)
> -               tst_brkm(TCONF | TERRNO, NULL,
> -                               "unshare syscall smoke test failed");
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0038-run-posix-option-
> group-test-replace-CWD-qith-PWD.patch b/meta/recipes-extended/ltp/
> ltp/0038-run-posix-option-group-test-replace-CWD-qith-PWD.patch
> deleted file mode 100644
> index 8034152..0000000
> --- a/meta/recipes-extended/ltp/ltp/0038-run-posix-option-
> group-test-replace-CWD-qith-PWD.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From f356775c400f40e3803d80a7bd295b4265959c45 Mon Sep 17 00:00:00 2001
> -From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
> -Date: Mon, 29 Feb 2016 14:34:40 +0530
> -Subject: [PATCH] run-posix-option-group-test: replace CWD qith PWD
> -
> -When running LTP Open Posix Testsuite there is lot of messages as:
> -
> -| Usage: basename FILE [SUFFIX]
> -|
> -| Strip directory path and .SUFFIX from FILE
> -|
> -| *******************
> -| Testing
> -| *******************
> -
> -This is because there is no $CWD defined in shell and it looks like $PWD
> -was intended instead.
> -
> -Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> -Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ----
> - testcases/open_posix_testsuite/bin/run-tests.sh | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/testcases/open_posix_testsuite/bin/run-tests.sh
> b/testcases/open_posix_testsuite/bin/run-tests.sh
> -index d4bd988..5ee5687 100755
> ---- a/testcases/open_posix_testsuite/bin/run-tests.sh
> -+++ b/testcases/open_posix_testsuite/bin/run-tests.sh
> -@@ -29,7 +29,7 @@ run_test_loop() {
> -
> -       cat <<EOF
> - *******************
> --Testing $(basename $CWD)
> -+Testing $(basename $PWD)
> - *******************
> - $(printf "PASS\t\t%3d" $NUM_PASS)
> - $(printf "FAIL\t\t%3d" $NUM_FAIL)
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0039-fcntl-fix-the-time-def-to-use-time_t.patch
> b/meta/recipes-extended/ltp/ltp/0039-fcntl-fix-the-time-
> def-to-use-time_t.patch
> index f7e805a..c0c1dad 100644
> --- a/meta/recipes-extended/ltp/ltp/0039-fcntl-fix-the-time-
> def-to-use-time_t.patch
> +++ b/meta/recipes-extended/ltp/ltp/0039-fcntl-fix-the-time-
> def-to-use-time_t.patch
> @@ -1,28 +1,29 @@
> -From 9590d073d3abe02fe0783ef8c530aef2e873ba9b Mon Sep 17 00:00:00 2001
> -From: Christopher Larson <chris_larson@mentor.com>
> -Date: Tue, 13 Dec 2016 12:48:29 -0700
> -Subject: [PATCH] fcntl: fix the time() def to use time_t
> +From 7bce3d223494803cb32897cabe66119076e53d89 Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Wed, 8 Feb 2017 16:23:51 +0800
> +Subject: [PATCH 5/5] fcntl: fix the time() def to use time_t
>
>  This fixes the build on X32, where long is 32-bit rather than 64-bit.
>
>  Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
>  ---
>   testcases/kernel/syscalls/fcntl/fcntl14.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/testcases/kernel/syscalls/fcntl/fcntl14.c
> b/testcases/kernel/syscalls/fcntl/fcntl14.c
> -index 3b36572..65ac8fa 100644
> +index c61eb24..99e3867 100644
>  --- a/testcases/kernel/syscalls/fcntl/fcntl14.c
>  +++ b/testcases/kernel/syscalls/fcntl/fcntl14.c
> -@@ -789,7 +789,7 @@ void dochild(void)
> +@@ -775,7 +775,7 @@ void dochild(void)
>
>   void run_test(int file_flag, int file_mode, int seek, int start, int end)
>   {
>  -      extern long time();
>  +      extern time_t time();
>
> -       /* reset fail to 0 for each run_test call */
>         fail = 0;
> +
>  --
> -2.8.0
> +2.7.4
>
> diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb
> b/meta/recipes-extended/ltp/ltp_20170116.bb
> similarity index 77%
> rename from meta/recipes-extended/ltp/ltp_20160126.bb
> rename to meta/recipes-extended/ltp/ltp_20170116.bb
> index aaa63c2..81c11ee 100644
> --- a/meta/recipes-extended/ltp/ltp_20160126.bb
> +++ b/meta/recipes-extended/ltp/ltp_20170116.bb
> @@ -11,9 +11,6 @@ LIC_FILES_CHKSUM = "\
>      file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=
> e04a2e542b2b8629bf9cd2ba29b0fe41 \
>      file://testcases/open_posix_testsuite/COPYING;md5=
> 216e43b72efbe4ed9017cc19c4c68b01 \
>      file://testcases/realtime/COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e
> \
> -    file://tools/netpipe-2.4/COPYING;md5=9e3781bb5fe787aa80e1f51f5006b6fa
> \
> -    file://tools/netpipe-2.4-ipv6/COPYING;md5=
> 9e3781bb5fe787aa80e1f51f5006b6fa \
> -    file://tools/top-LTP/proc/COPYING;md5=aefc88eb8a41672fbfcfe6b69ab8c49c
> \
>      file://tools/pounder21/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>      file://utils/benchmark/kernbench-0.42/COPYING;md5=
> 94d55d512a9ba36caa9b7df079bae19f \
>      file://utils/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803
> \
> @@ -24,49 +21,35 @@ DEPENDS_append_libc-musl = " fts "
>  EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
>  CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
> -SRCREV = "fce797676b14f50406718e7ef640b50da66c9b36"
> +SRCREV = "2c8457b0769fc026e4e1772f4c2a6da0be63a631"
>
>  SRC_URI = "git://github.com/linux-test-project/ltp.git \
> -           file://0001-ltp-Don-t-link-against-libfl.patch \
> +           file://0001-add-_GNU_SOURCE-to-pec_listener.c.patch \
>             file://0002-Add-knob-to-control-whether-numa-support-should-be-c.patch
> \
>             file://0003-Add-knob-to-control-tirpc-support.patch \
>             file://0004-build-Add-option-to-select-libc-implementation.patch
> \
>             file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
> \
> -           file://0006-sendfile-Use-off64_t-instead-of-__off64_t.patch \
> -           file://0007-replace-SIGCLD-with-SIGCHLD.patch \
> +           file://0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
> \
> +           file://0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
> \
>             file://0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
> \
> -           file://0009-Guard-error.h-with-__GLIBC__.patch \
> +           file://0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch
> \
>             file://0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch \
>             file://0011-Rename-sigset-variable-to-sigset1.patch \
> -           file://0012-fsstress.c-Replace-__int64_t-with-int64_t.patch \
> -           file://0013-include-fcntl.h-for-getting-O_-definitions.patch \
> -           file://0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
> \
> -           file://0015-mincore01-Rename-PAGESIZE-to-pagesize.patch \
> -           file://0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
> \
> -           file://0017-replace-sigval_t-with-union-sigval.patch \
>             file://0018-guard-mallocopt-with-__GLIBC__.patch \
> -           file://0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
> \
>             file://0020-getdents-define-getdents-getdents64-only-for-glibc.patch
> \
>             file://0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
> \
> -           file://0022-include-sys-types.h.patch \
>             file://0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch
> \
>             file://0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch
> \
>             file://0025-mc_gethost-include-sys-types.h.patch \
>             file://0026-crash01-Define-_GNU_SOURCE.patch \
>             file://0027-sysconf01-Use-_SC_2_C_VERSION-conditionally.patch
> \
>             file://0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
> \
> -           file://0029-trace_shed-Fix-build-with-musl.patch \
>             file://0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
> \
> -           file://0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch
> \
> -           file://0032-regen.sh-Include-asm-unistd.h-explicitly.patch \
>             file://0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch
> \
>             file://0034-periodic_output.patch \
>             file://0035-fix-test_proc_kill-hang.patch \
>             file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
> \
> -           file://0037-containers-netns_netlink-Avoid-segmentation-fault.patch
> \
> -           file://0038-run-posix-option-group-test-replace-CWD-qith-PWD.patch
> \
>             file://0039-fcntl-fix-the-time-def-to-use-time_t.patch \
> -           file://0040-containers-userns05-use-unsigned-int-for-ns-id.patch
> \
>             "
>
>  S = "${WORKDIR}/git"
> @@ -104,13 +87,16 @@ do_install(){
>      # OSDL's Scaleable Test Platform, but now http://khack.osdl.org
> unaccessible
>      rm -rf ${D}/opt/ltp/bin/STPfailure_report.pl
>
> +    # In oe-core, we doesn't support ksh and csh now, so remove in.csh
> and in.ksh.
> +    rm ${D}/opt/ltp/testcases/data/file01/in.csh
> +    rm ${D}/opt/ltp/testcases/data/file01/in.ksh
>      # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
>      cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
>  }
>
> -RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk
> expect ldd"
> +RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk
> expect ldd unzip gzip cpio cronie logrotate which at"
>
> -FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
> +FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a
> /opt/ltp/testcases/data/nm01/lib.a"
>
>  FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/*
> /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/*
> /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/*
> /opt/ltp/testcases/open_posix_testsuite/conformance/*
> /opt/ltp/testcases/open_posix_testsuite/Documentation/*
> /opt/ltp/testcases/open_posix_testsuite/functional/*
> /opt/ltp/testcases/open_posix_testsuite/include/*
> /opt/ltp/testcases/open_posix_testsuite/scripts/*
> /opt/ltp/testcases/open_posix_testsuite/stress/*
> /opt/ltp/testcases/open_posix_testsuite/tools/*"
>
> --
> 2.8.1
>
>

--001a114f410817583b05490ce0f5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Fails with security flags enabled:<div><br></div><div><div=
>| In file included from ../../../../include/old/test.h:47:0,</div><div>| =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from fchmodat=
01.c:44:</div><div>| fchmodat01.c: In function &#39;setup&#39;:</div><div>|=
 ../../../../include/old/old_safe_file_ops.h:55:27: error: format not a str=
ing literal and no format arguments [-Werror=3Dformat-security]</div><div>|=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(path=
), (fmt), ## __VA_ARGS__)</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>|=
 fchmodat01.c:130:2: note: in expansion of macro &#39;SAFE_FILE_PRINTF&#39;=
</div><div>| =C2=A0 SAFE_FILE_PRINTF(cleanup, testfile, testfile);</div><di=
v>| =C2=A0 ^~~~~~~~~~~~~~~~</div><div>| ../../../../include/old/old_safe_fi=
le_ops.h:55:27: error: format not a string literal and no format arguments =
[-Werror=3Dformat-security]</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(path), (fmt), ## __VA_ARGS__)</div><div>=
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>| fchmodat01.c:131:2: note: in expansio=
n of macro &#39;SAFE_FILE_PRINTF&#39;</div><div>| =C2=A0 SAFE_FILE_PRINTF(c=
leanup, testfile2, testfile2);</div><div>| =C2=A0 ^~~~~~~~~~~~~~~~</div></d=
iv><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On 21 February 2017 at 05:13, Dengke Du <span dir=3D"=
ltr">&lt;<a href=3D"mailto:dengke.du@windriver.com" target=3D"_blank">dengk=
e.du@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
1. Upgrade ltp from 20160126 to 20170116.<br>
<br>
2. Delete some patches because these have been integrated in upstream.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0001-ltp-Don-t-link-against-<wbr>libfl.patch<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0006-sendfile-Use-off64_t-<wbr>instead-of-__off=
64_t.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0007-replace-SIGCLD-with-<wbr>SIGCHLD.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0009-Guard-error.h-with-__<wbr>GLIBC__.patch<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0012-fsstress.c-Replace-__<wbr>int64_t-with-int=
64_t.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0013-include-fcntl.h-for-<wbr>getting-O_-defini=
tions.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0014-hyperthreading-Include-<wbr>sys-types.h-fo=
r-pid_t-definit.<wbr>patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0015-mincore01-Rename-<wbr>PAGESIZE-to-pagesize=
.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0016-ustat-Change-header-from-<wbr>ustat.h-to-s=
ys-ustat.h.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0017-replace-sigval_t-with-<wbr>union-sigval.pa=
tch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0019-tomoyo-Replace-<wbr>canonicalize_file_name=
-with-<wbr>realpath.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0022-include-sys-types.h.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0029-trace_shed-Fix-build-<wbr>with-musl.patch<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0031-vma03-fix-page-size-<wbr>offset-as-per-pag=
e-size-<wbr>alignmen.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0032-regen.sh-Include-asm-<wbr>unistd.h-explici=
tly.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0037-containers-netns_netlink-<wbr>Avoid-segmen=
tation-fault.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0038-run-posix-option-group-<wbr>test-replace-C=
WD-qith-PWD.<wbr>patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0040-containers-userns05-use-<wbr>unsigned-int-=
for-ns-id.patch<br>
<br>
3. Add new patch based on Khem Raj&#39;s 0007-replace-SIGCLD-with-<wbr>SIGC=
HLD.patch<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0001-add-_GNU_SOURCE-to-pec_<wbr>listener.c.pat=
ch<br>
<br>
4. Add new patches fix building errors with musl:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0006-fix-PATH_MAX-undeclared-<wbr>when-building=
-with-musl.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0007-fix-__WORDSIZE-<wbr>undeclared-when-buildi=
ng-with-<wbr>musl.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0009-fix-redefinition-of-<wbr>struct-msgbuf-err=
or-building-<wbr>wit.patch<br>
<br>
5. Modify some patches because the upstream contains changes, those patches=
<br>
=C2=A0 =C2=A0maybe failed when they apply to the new version of ltp.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0011-Rename-sigset-variable-<wbr>to-sigset1.pat=
ch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0027-sysconf01-Use-_SC_2_C_<wbr>VERSION-conditi=
onally.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0030-lib-Use-PTHREAD_MUTEX_<wbr>RECURSIVE-in-pl=
ace-of-PTHREAD_<wbr>.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0035-fix-test_proc_kill-hang.<wbr>patch<br>
<br>
6. Rename and modify this patch.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fcntl-fix-the-time-def-to-use-<wbr>time_t.patch=
 to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0039-fcntl-fix-the-time-def-<wbr>to-use-time_t.=
patch<br>
<br>
7. The new version of ltp add the checking for ksh and csh, we doesn&#39;t =
support<br>
=C2=A0 =C2=A0ksh and csh in oe-core, so remove the checking files when the =
system executes<br>
=C2=A0 =C2=A0do_install function.<br>
<br>
Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">den=
gke.du@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../0001-add-_GNU_SOURCE-to-<wbr>pec_listener.c.patch=C2=A0 =C2=A0|=
=C2=A0 39 ++<br>
=C2=A0.../ltp/0001-ltp-Don-t-link-<wbr>against-libfl.patch=C2=A0 =C2=A0 |=
=C2=A0 30 --<br>
=C2=A0...TH_MAX-undeclared-when-<wbr>building-with-musl.patch |=C2=A0 30 ++=
<br>
=C2=A0...sendfile-Use-off64_t-<wbr>instead-of-__off64_t.patch |=C2=A0 31 --=
<br>
=C2=A0...RDSIZE-undeclared-when-<wbr>building-with-musl.patch |=C2=A0 30 ++=
<br>
=C2=A0.../ltp/ltp/0007-replace-<wbr>SIGCLD-with-SIGCHLD.patch | 394 -------=
--------------<br>
=C2=A0.../ltp/0009-Guard-error.h-<wbr>with-__GLIBC__.patch=C2=A0 =C2=A0 | 2=
70 --------------<br>
=C2=A0...ition-of-struct-msgbuf-<wbr>error-building-wit.patch |=C2=A0 35 ++=
<br>
=C2=A0.../0011-Rename-sigset-<wbr>variable-to-sigset1.patch=C2=A0 =C2=A0|=
=C2=A0 77 ++--<br>
=C2=A0...fsstress.c-Replace-__int64_<wbr>t-with-int64_t.patch | 351 -------=
-----------<br>
=C2=A0...nclude-fcntl.h-for-getting-<wbr>O_-definitions.patch |=C2=A0 67 --=
--<br>
=C2=A0...ing-Include-sys-types.h-<wbr>for-pid_t-definit.patch |=C2=A0 56 --=
-<br>
=C2=A0...015-mincore01-Rename-<wbr>PAGESIZE-to-pagesize.patch |=C2=A0 64 --=
--<br>
=C2=A0...Change-header-from-ustat.h-<wbr>to-sys-ustat.h.patch |=C2=A0 45 --=
-<br>
=C2=A0.../0017-replace-sigval_t-<wbr>with-union-sigval.patch=C2=A0 |=C2=A0 =
88 -----<br>
=C2=A0...lace-canonicalize_file_<wbr>name-with-realpath.patch |=C2=A0 32 --=
<br>
=C2=A0.../ltp/ltp/0022-include-sys-<wbr>types.h.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 29 --<br>
=C2=A0...sconf01-Use-_SC_2_C_<wbr>VERSION-conditionally.patch |=C2=A0 23 +-=
<br>
=C2=A0.../ltp/0029-trace_shed-Fix-<wbr>build-with-musl.patch=C2=A0 |=C2=A0 =
32 --<br>
=C2=A0...READ_MUTEX_RECURSIVE-in-<wbr>place-of-PTHREAD_.patch |=C2=A0 26 +-=
<br>
=C2=A0...age-size-offset-as-per-<wbr>page-size-alignmen.patch |=C2=A0 33 --=
<br>
=C2=A0...-regen.sh-Include-asm-<wbr>unistd.h-explicitly.patch |=C2=A0 30 --=
<br>
=C2=A0.../ltp/ltp/0035-fix-test_<wbr>proc_kill-hang.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 27 +-<br>
=C2=A0...rs-netns_netlink-Avoid-<wbr>segmentation-fault.patch |=C2=A0 50 --=
-<br>
=C2=A0...ix-option-group-test-<wbr>replace-CWD-qith-PWD.patch |=C2=A0 44 --=
-<br>
=C2=A0...0039-fcntl-fix-the-time-<wbr>def-to-use-time_t.patch |=C2=A0 17 +-=
<br>
=C2=A0.../ltp/{<a href=3D"http://ltp_20160126.bb" rel=3D"noreferrer" target=
=3D"_blank">ltp_20160126.bb</a> =3D&gt; <a href=3D"http://ltp_20170116.bb" =
rel=3D"noreferrer" target=3D"_blank">ltp_20170116.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 34 +-<br>
=C2=A027 files changed, 235 insertions(+), 1749 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0001-add-_GNU_S=
OURCE-to-pec_<wbr>listener.c.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0001-ltp-Don-t-=
link-against-<wbr>libfl.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0006-fix-PATH_M=
AX-undeclared-<wbr>when-building-with-musl.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0006-sendfile-U=
se-off64_t-<wbr>instead-of-__off64_t.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0007-fix-__WORD=
SIZE-<wbr>undeclared-when-building-with-<wbr>musl.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0007-replace-SI=
GCLD-with-<wbr>SIGCHLD.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0009-Guard-erro=
r.h-with-__<wbr>GLIBC__.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0009-fix-redefi=
nition-of-<wbr>struct-msgbuf-error-building-<wbr>wit.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0012-fsstress.c=
-Replace-__<wbr>int64_t-with-int64_t.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0013-include-fc=
ntl.h-for-<wbr>getting-O_-definitions.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0014-hyperthrea=
ding-Include-<wbr>sys-types.h-for-pid_t-definit.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0015-mincore01-=
Rename-<wbr>PAGESIZE-to-pagesize.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0016-ustat-Chan=
ge-header-from-<wbr>ustat.h-to-sys-ustat.h.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0017-replace-si=
gval_t-with-<wbr>union-sigval.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0019-tomoyo-Rep=
lace-<wbr>canonicalize_file_name-with-<wbr>realpath.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0022-include-sy=
s-types.h.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0029-trace_shed=
-Fix-build-<wbr>with-musl.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0031-vma03-fix-=
page-size-<wbr>offset-as-per-page-size-<wbr>alignmen.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0032-regen.sh-I=
nclude-asm-<wbr>unistd.h-explicitly.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0037-containers=
-netns_netlink-<wbr>Avoid-segmentation-fault.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/ltp/ltp/<wbr>0038-run-posix-=
option-group-<wbr>test-replace-CWD-qith-PWD.<wbr>patch<br>
=C2=A0rename meta/recipes-extended/ltp/{<a href=3D"http://ltp_20160126.bb" =
rel=3D"noreferrer" target=3D"_blank">ltp<wbr>_20160126.bb</a> =3D&gt; <a hr=
ef=3D"http://ltp_20170116.bb" rel=3D"noreferrer" target=3D"_blank">ltp_2017=
0116.bb</a>} (77%)<br>
<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0001-add-_GNU_SOURCE-to-<wb=
r>pec_listener.c.patch b/meta/recipes-extended/ltp/<wbr>ltp/0001-add-_GNU_S=
OURCE-to-<wbr>pec_listener.c.patch<br>
new file mode 100644<br>
index 0000000..7ec66f8<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/<wbr>ltp/0001-add-_GNU_SOURCE-to-<wbr>pec_l=
istener.c.patch<br>
@@ -0,0 +1,39 @@<br>
+From ae10245c15a617bd57337981bb42eb<wbr>36629f9b59 Mon Sep 17 00:00:00 200=
1<br>
+From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke.du@w=
indriver.com</a>&gt;<br>
+Date: Wed, 8 Feb 2017 15:53:31 +0800<br>
+Subject: [PATCH 01/26] add _GNU_SOURCE to pec_listener.c<br>
+<br>
+In previous patch 0007-replace-SIGCLD-with-<wbr>SIGCHLD.patch made by Khem=
 Raj<br>
+contains two aspects:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A01. replace SIGCLD with SIGCHLD<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A02. add _GNU_SOURCE to pec_listener.c<br>
+<br>
+The replace SIGCLD with SIGCHLD have been integrated upstream, so make a<b=
r>
+another patch to add _GNU_SOURCE to pec_listener.c comply with Khem Raj&#3=
9;s<br>
+previous patch.<br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
+Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">de=
ngke.du@windriver.com</a>&gt;<br>
+Upstream-Status: Pending<br>
+<br>
+%% original patch: 0001-add-_GNU_SOURCE-to-pec_<wbr>listener.c.patch<br>
+---<br>
+ testcases/kernel/connectors/<wbr>pec/pec_listener.c | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/testcases/kernel/connectors/<wbr>pec/pec_listener.c b/testcas=
es/kernel/connectors/<wbr>pec/pec_listener.c<br>
+index d11e4dc..b8b5e0d 100644<br>
+--- a/testcases/kernel/connectors/<wbr>pec/pec_listener.c<br>
++++ b/testcases/kernel/connectors/<wbr>pec/pec_listener.c<br>
+@@ -20,6 +20,7 @@<br>
+ /*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+ /*****************************<wbr>******************************<wbr>***=
****************/<br>
+<br>
++#define _GNU_SOURCE<br>
+ #include &lt;sys/socket.h&gt;<br>
+ #include &lt;sys/poll.h&gt;<br>
+ #include &lt;sys/types.h&gt;<br>
+--<br>
+2.8.1<br>
+<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0001-ltp-Don-t-link-<wbr>ag=
ainst-libfl.patch b/meta/recipes-extended/ltp/<wbr>ltp/0001-ltp-Don-t-link-=
<wbr>against-libfl.patch<br>
deleted file mode 100644<br>
index 585b7cb..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0001-ltp-Don-t-link-<wbr>against-l=
ibfl.patch<br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-From 14985fccf7428eaa0b45decc22bfd2<wbr>0fd780f621 Mon Sep 17 00:00:00 200=
1<br>
-From: Chong Lu &lt;<a href=3D"mailto:Chong.Lu@windriver.com">Chong.Lu@wind=
river.com</a>&gt;<br>
-Date: Tue, 11 Mar 2014 14:47:22 +0800<br>
-Subject: [PATCH 01/32] ltp: Don&#39;t link against libfl<br>
-<br>
-We have already defined yywrap function in scan.l file. After this, we no =
longer need to<br>
-link against libfl and so no longer get errors about undefined references =
to yylex.<br>
-<br>
-Signed-off-by: Chong Lu &lt;<a href=3D"mailto:Chong.Lu@windriver.com">Chon=
g.Lu@windriver.com</a>&gt;<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- pan/Makefile | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/pan/Makefile b/pan/Makefile<br>
-index 4cc6466..a4b575b 100644<br>
---- a/pan/Makefile<br>
-+++ b/pan/Makefile<br>
-@@ -31,7 +31,7 @@ CPPFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
+=3D -Wno-error<br>
-<br>
- CPPFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D -I$(abs_src=
dir)<br>
-<br>
--LDLIBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 +=3D -lm $(LEXLIB)<br>
-+LDLIBS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 +=3D -lm<br>
-<br>
- LFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 +=3D -l<br>
-<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0006-fix-PATH_MAX-<wbr>unde=
clared-when-building-with-<wbr>musl.patch b/meta/recipes-extended/ltp/<wbr>=
ltp/0006-fix-PATH_MAX-<wbr>undeclared-when-building-with-<wbr>musl.patch<br=
>
new file mode 100644<br>
index 0000000..8874b95<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/<wbr>ltp/0006-fix-PATH_MAX-<wbr>undeclared-=
when-building-with-<wbr>musl.patch<br>
@@ -0,0 +1,30 @@<br>
+From 32644bde4d33b677614534ec37030e<wbr>57883b8e15 Mon Sep 17 00:00:00 200=
1<br>
+From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke.du@w=
indriver.com</a>&gt;<br>
+Date: Thu, 9 Feb 2017 16:41:12 +0800<br>
+Subject: [PATCH 1/3] fix PATH_MAX undeclared when building with musl<br>
+<br>
+fix PATH_MAX undeclared when building with musl.<br>
+<br>
+Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">de=
ngke.du@windriver.com</a>&gt;<br>
+Upstream-Status: Pending<br>
+---<br>
+ include/tst_test.h | 3 +++<br>
+ 1 file changed, 3 insertions(+)<br>
+<br>
+diff --git a/include/tst_test.h b/include/tst_test.h<br>
+index 7ff33b2..9779c0e 100644<br>
+--- a/include/tst_test.h<br>
++++ b/include/tst_test.h<br>
+@@ -19,6 +19,9 @@<br>
+ #define TST_TEST_H__<br>
+<br>
+ #include &lt;unistd.h&gt;<br>
++#ifndef __GLIBC__<br>
++#include &lt;limits.h&gt;<br>
++#endif<br>
+<br>
+ #include &quot;tst_common.h&quot;<br>
+ #include &quot;tst_res_flags.h&quot;<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0006-sendfile-Use-off64_t-<=
wbr>instead-of-__off64_t.patch b/meta/recipes-extended/ltp/<wbr>ltp/0006-se=
ndfile-Use-off64_t-<wbr>instead-of-__off64_t.patch<br>
deleted file mode 100644<br>
index 56a48ab..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0006-sendfile-Use-off64_t-<wbr>ins=
tead-of-__off64_t.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From fb8b895385a641d74f2186fe5f20a8<wbr>72209692ed Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Thu, 7 Jan 2016 18:24:20 +0000<br>
-Subject: [PATCH 06/32] sendfile: Use off64_t instead of __off64_t<br>
-<br>
-__off64_t is specific to glibc where as off64_t is widely available<br>
-Add _GNU_SOURCE for off64_t defines from sys/types.h<br>
-Fixes<br>
-&lt;command-line&gt;:0:7: error: unknown type name &#39;off64_t&#39;<br>
-sendfile02.c:97:18: note: in expansion of macro &#39;OFF_T&#39;<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- testcases/kernel/syscalls/<wbr>sendfile/Makefile | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/testcases/kernel/syscalls/<wbr>sendfile/Makefile b/testcases/=
kernel/syscalls/<wbr>sendfile/Makefile<br>
-index df7b63f..1bd1b57 100644<br>
---- a/testcases/kernel/syscalls/<wbr>sendfile/Makefile<br>
-+++ b/testcases/kernel/syscalls/<wbr>sendfile/Makefile<br>
-@@ -21,6 +21,6 @@ top_srcdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D =
../../../..<br>
- include $(top_srcdir)/include/mk/<a href=3D"http://testcases.mk" rel=3D"n=
oreferrer" target=3D"_blank">testc<wbr>ases.mk</a><br>
- include $(abs_srcdir)/../utils/<a href=3D"http://newer_64.mk" rel=3D"nore=
ferrer" target=3D"_blank">newer_<wbr>64.mk</a><br>
-<br>
--%_64: CPPFLAGS +=3D -D_FILE_OFFSET_BITS=3D64 -DOFF_T=3D__off64_t<br>
-+%_64: CPPFLAGS +=3D -D_FILE_OFFSET_BITS=3D64 -DOFF_T=3Doff64_t -D_GNU_SOU=
RCE<br>
-<br>
- include $(top_srcdir)/include/mk/<a href=3D"http://generic_leaf_target.mk=
" rel=3D"noreferrer" target=3D"_blank">gener<wbr>ic_leaf_target.mk</a><br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0007-fix-__WORDSIZE-<wbr>un=
declared-when-building-with-<wbr>musl.patch b/meta/recipes-extended/ltp/<wb=
r>ltp/0007-fix-__WORDSIZE-<wbr>undeclared-when-building-with-<wbr>musl.patc=
h<br>
new file mode 100644<br>
index 0000000..8d0e739<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/<wbr>ltp/0007-fix-__WORDSIZE-<wbr>undeclare=
d-when-building-with-<wbr>musl.patch<br>
@@ -0,0 +1,30 @@<br>
+From a2639bd0f0d3f9f3049ee33e6710fe<wbr>d06225f54f Mon Sep 17 00:00:00 200=
1<br>
+From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke.du@w=
indriver.com</a>&gt;<br>
+Date: Thu, 9 Feb 2017 18:20:58 +0800<br>
+Subject: [PATCH 1/2] fix __WORDSIZE undeclared when building with musl<br>
+<br>
+fix __WORDSIZE undeclared when building with musl.<br>
+<br>
+Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">de=
ngke.du@windriver.com</a>&gt;<br>
+Upstream-Status: Pending<br>
+---<br>
+ include/old/test.h | 3 +++<br>
+ 1 file changed, 3 insertions(+)<br>
+<br>
+diff --git a/include/old/test.h b/include/old/test.h<br>
+index d492560..263e92e 100644<br>
+--- a/include/old/test.h<br>
++++ b/include/old/test.h<br>
+@@ -58,6 +58,9 @@<br>
+ #include &quot;tst_clone.h&quot;<br>
+ #include &quot;old_device.h&quot;<br>
+ #include &quot;old_tmpdir.h&quot;<br>
++#ifndef __GLIBC__<br>
++#include &lt;bits/reg.h&gt;<br>
++#endif<br>
+<br>
+ /*<br>
+=C2=A0 * Ensure that NUMSIGS is defined.<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0007-replace-SIGCLD-with-<w=
br>SIGCHLD.patch b/meta/recipes-extended/ltp/<wbr>ltp/0007-replace-SIGCLD-w=
ith-<wbr>SIGCHLD.patch<br>
deleted file mode 100644<br>
index 4be906e..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0007-replace-SIGCLD-with-<wbr>SIGC=
HLD.patch<br>
+++ /dev/null<br>
@@ -1,394 +0,0 @@<br>
-From 405c03171e4bf0edd698cb602cf7bd<wbr>7fe1d0401a Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Thu, 7 Jan 2016 19:33:53 +0000<br>
-Subject: [PATCH 07/32] replace SIGCLD with SIGCHLD<br>
-<br>
-its defined to use SIGCHLD anyway in<br>
-<br>
-bits/signum.h:#define=C2=A0 =C2=A0 =C2=A0SIGCLD=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 SIGCHLD /* Same as SIGCHLD<br>
-(System V).=C2=A0 */<br>
-<br>
-plus it helps these tests compile with musl which adheres to posix<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- lib/tst_sig.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8=
 ++++----<br>
- testcases/kernel/connectors/<wbr>pec/pec_listener.c=C2=A0 |=C2=A0 1 +<br>
- testcases/kernel/fs/doio/doio.<wbr>c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
- testcases/kernel/fs/doio/<wbr>growfiles.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
- testcases/kernel/syscalls/<wbr>fcntl/fcntl11.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 8 ++++----<br>
- testcases/kernel/syscalls/<wbr>fcntl/fcntl17.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 8 ++++----<br>
- testcases/kernel/syscalls/<wbr>fcntl/fcntl19.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 8 ++++----<br>
- testcases/kernel/syscalls/<wbr>fcntl/fcntl20.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 8 ++++----<br>
- testcases/kernel/syscalls/<wbr>fcntl/fcntl21.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 8 ++++----<br>
- testcases/kernel/syscalls/<wbr>kill/kill02.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 6 +++---<br>
- testcases/kernel/syscalls/<wbr>kill/kill12.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 8 ++++----<br>
- testcases/kernel/syscalls/<wbr>mkdir/mkdir09.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 12 ++++++------<br>
- testcases/kernel/syscalls/<wbr>sighold/sighold02.c=C2=A0 =C2=A0|=C2=A0 2 =
+-<br>
- testcases/network/tcp_cmds/<wbr>perf_lan/pingpong.c=C2=A0 |=C2=A0 2 +-<br=
>
- testcases/network/tcp_cmds/<wbr>perf_lan/pingpong6.c |=C2=A0 2 +-<br>
- 15 files changed, 44 insertions(+), 43 deletions(-)<br>
-<br>
-diff --git a/lib/tst_sig.c b/lib/tst_sig.c<br>
-index 3af5ffd..36565e1 100644<br>
---- a/lib/tst_sig.c<br>
-+++ b/lib/tst_sig.c<br>
-@@ -49,7 +49,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fork_flag - set to =
FORK or NOFORK depending upon whether the<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0calling program executes a fork() system call.=C2=A0 It<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0is normally the case that the calling program treats<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SIGCLD as an expected signal if fork() is being used.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 SIGCHLD as an expected signal if fork() is being used.<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handler - a pointer=
 to the unexpected signal handler to<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0be executed after an unexpected signal has been<br>
-@@ -82,7 +82,7 @@ static void (*tst_setup_signal(int, void (*)(int))) (int=
);<br>
-<br>
- /*****************************<wbr>******************************<wbr>***=
**************<br>
-=C2=A0 * tst_sig() : set-up to catch unexpected signals.=C2=A0 fork_flag i=
s set to NOFORK<br>
-- *=C2=A0 =C2=A0 if SIGCLD is to be an &quot;unexpected signal&quot;, othe=
rwise it is set to<br>
-+ *=C2=A0 =C2=A0 if SIGCHLD is to be an &quot;unexpected signal&quot;, oth=
erwise it is set to<br>
-=C2=A0 *=C2=A0 =C2=A0 FORK.=C2=A0 cleanup points to a cleanup routine to b=
e executed before<br>
-=C2=A0 *=C2=A0 =C2=A0 tst_exit is called (cleanup is set to NULL if no cle=
anup is desired).<br>
-=C2=A0 *=C2=A0 =C2=A0 handler is a pointer to the signal handling routine =
(if handler is<br>
-@@ -117,7 +117,7 @@ void tst_sig(int fork_flag, void (*handler) (), void (=
*cleanup) ())<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for (sig =3D 1; sig &lt; NSIG; sig++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * SIGKILL is never=
 unexpected.<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* SIGCLD is only u=
nexpected when<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* SIGCHLD is only =
unexpected when<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 no =
forking is being done.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * SIGINFO is used =
for file quotas and should be expected<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-@@ -205,7 +205,7 @@ void tst_sig(int fork_flag, void (*handler) (), void (=
*cleanup) ())<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case SIGCLD:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case SIGCHLD:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (fork_flag =3D=3D FORK)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
-<br>
-diff --git a/testcases/kernel/connectors/<wbr>pec/pec_listener.c b/testcas=
es/kernel/connectors/<wbr>pec/pec_listener.c<br>
-index a1beb13..002750a 100644<br>
---- a/testcases/kernel/connectors/<wbr>pec/pec_listener.c<br>
-+++ b/testcases/kernel/connectors/<wbr>pec/pec_listener.c<br>
-@@ -20,6 +20,7 @@<br>
- /*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
- /*****************************<wbr>******************************<wbr>***=
****************/<br>
-<br>
-+#define _GNU_SOURCE<br>
- #include &lt;sys/socket.h&gt;<br>
- #include &lt;sys/poll.h&gt;<br>
- #include &lt;sys/types.h&gt;<br>
-diff --git a/testcases/kernel/fs/doio/<wbr>doio.c b/testcases/kernel/fs/do=
io/<wbr>doio.c<br>
-index 4b0dec5..5f65ef9 100644<br>
---- a/testcases/kernel/fs/doio/<wbr>doio.c<br>
-+++ b/testcases/kernel/fs/doio/<wbr>doio.c<br>
-@@ -573,7 +573,7 @@ int main(int argc, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SIGTSTP:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SIGSTOP:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SIGCONT:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case SIGCLD:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case SIGCHLD:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SIGBUS:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SIGSEGV:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SIGQUIT:<br>
-@@ -615,7 +615,7 @@ int main(int argc, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sigemptyset(&amp;block_mask);<br>
--=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;block_mask, SIGCLD);<br>
-+=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;block_mask, SIGCHLD);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sigprocmask(SIG_BLOCK, &amp;block_mask, &amp;om=
ask);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-diff --git a/testcases/kernel/fs/doio/<wbr>growfiles.c b/testcases/kernel/=
fs/doio/<wbr>growfiles.c<br>
-index 09e7f35..bbad230 100644<br>
---- a/testcases/kernel/fs/doio/<wbr>growfiles.c<br>
-+++ b/testcases/kernel/fs/doio/<wbr>growfiles.c<br>
-@@ -1640,7 +1640,7 @@ int set_sig(void)<br>
- #ifdef SIGRESTART<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SIGRESTART:<br=
>
- #endif /* SIGRESTART */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case SIGCLD:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case SIGCHLD:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-diff --git a/testcases/kernel/syscalls/<wbr>fcntl/fcntl11.c b/testcases/ke=
rnel/syscalls/<wbr>fcntl/fcntl11.c<br>
-index fa6ce53..2de2b6c 100644<br>
---- a/testcases/kernel/syscalls/<wbr>fcntl/fcntl11.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>fcntl/fcntl11.c<br>
-@@ -105,10 +105,10 @@ void setup(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;act, 0, sizeof(act));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0act.sa_handler =3D catch_child;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sigemptyset(&amp;act.sa_mask);<br>
--=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;act.sa_mask, SIGCLD);<br>
--=C2=A0 =C2=A0 =C2=A0 if ((sigaction(SIGCLD, &amp;act, NULL)) &lt; 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;act.sa_mask, SIGCHLD);<br>
-+=C2=A0 =C2=A0 =C2=A0 if ((sigaction(SIGCHLD, &amp;act, NULL)) &lt; 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm(TBROK | TE=
RRNO, cleanup,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;sigaction(SIGCLD, ..) failed&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;sigaction(SIGCHLD, ..) failed&quot;);<br>
- }<br>
-<br>
- void do_child(void)<br>
-@@ -227,7 +227,7 @@ void stop_child(void)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct flock fl;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 signal(SIGCLD, SIG_DFL);<br>
-+=C2=A0 =C2=A0 =C2=A0 signal(SIGCHLD, SIG_DFL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fl.l_type =3D STOP;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0parent_put(&amp;fl);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0wait(0);<br>
-diff --git a/testcases/kernel/syscalls/<wbr>fcntl/fcntl17.c b/testcases/ke=
rnel/syscalls/<wbr>fcntl/fcntl17.c<br>
-index 5b03e39..6598b20 100644<br>
---- a/testcases/kernel/syscalls/<wbr>fcntl/fcntl17.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>fcntl/fcntl17.c<br>
-@@ -150,9 +150,9 @@ int setup(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;act, 0, sizeof(act));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0act.sa_handler =3D catch_child;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sigemptyset(&amp;act.sa_mask);<br>
--=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;act.sa_mask, SIGCLD);<br>
--=C2=A0 =C2=A0 =C2=A0 if (sigaction(SIGCLD, &amp;act, NULL) &lt; 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TFAIL, &quot;SI=
GCLD signal setup failed, errno: %d&quot;, errno);<br>
-+=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;act.sa_mask, SIGCHLD);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (sigaction(SIGCHLD, &amp;act, NULL) &lt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TFAIL, &quot;SI=
GCHLD signal setup failed, errno: %d&quot;, errno);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-@@ -381,7 +381,7 @@ void stop_children(void)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int arg;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 signal(SIGCLD, SIG_DFL);<br>
-+=C2=A0 =C2=A0 =C2=A0 signal(SIGCHLD, SIG_DFL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0arg =3D STOP;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0child_free(child_pipe1[1], arg);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0child_free(child_pipe2[1], arg);<br>
-diff --git a/testcases/kernel/syscalls/<wbr>fcntl/fcntl19.c b/testcases/ke=
rnel/syscalls/<wbr>fcntl/fcntl19.c<br>
-index a542cfc..88c91d6 100644<br>
---- a/testcases/kernel/syscalls/<wbr>fcntl/fcntl19.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>fcntl/fcntl19.c<br>
-@@ -112,9 +112,9 @@ void setup(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;act, 0, sizeof(act));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0act.sa_handler =3D catch_child;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sigemptyset(&amp;act.sa_mask);<br>
--=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;act.sa_mask, SIGCLD);<br>
--=C2=A0 =C2=A0 =C2=A0 if ((sigaction(SIGCLD, &amp;act, NULL)) &lt; 0) {<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TFAIL, &quot;SI=
GCLD signal setup failed, errno: %d&quot;, errno);<br>
-+=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;act.sa_mask, SIGCHLD);<br>
-+=C2=A0 =C2=A0 =C2=A0 if ((sigaction(SIGCHLD, &amp;act, NULL)) &lt; 0) {<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TFAIL, &quot;SI=
GCHLD signal setup failed, errno: %d&quot;, errno);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fail =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
-@@ -265,7 +265,7 @@ void stop_child(void)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct flock fl;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 signal(SIGCLD, SIG_DFL);<br>
-+=C2=A0 =C2=A0 =C2=A0 signal(SIGCHLD, SIG_DFL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fl.l_type =3D STOP;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0parent_put(&amp;fl);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0wait(0);<br>
-diff --git a/testcases/kernel/syscalls/<wbr>fcntl/fcntl20.c b/testcases/ke=
rnel/syscalls/<wbr>fcntl/fcntl20.c<br>
-index aa06bab..99fd783 100644<br>
---- a/testcases/kernel/syscalls/<wbr>fcntl/fcntl20.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>fcntl/fcntl20.c<br>
-@@ -109,9 +109,9 @@ void setup(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;act, 0, sizeof(act));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0act.sa_handler =3D catch_child;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sigemptyset(&amp;act.sa_mask);<br>
--=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;act.sa_mask, SIGCLD);<br>
--=C2=A0 =C2=A0 =C2=A0 if (sigaction(SIGCLD, &amp;act, NULL) =3D=3D -1)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm(TFAIL | TERRNO,=
 cleanup, &quot;SIGCLD signal setup failed&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;act.sa_mask, SIGCHLD);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (sigaction(SIGCHLD, &amp;act, NULL) =3D=3D -1)<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm(TFAIL | TERRNO,=
 cleanup, &quot;SIGCHLD signal setup failed&quot;);<br>
- }<br>
-<br>
- void cleanup(void)<br>
-@@ -264,7 +264,7 @@ void stop_child(void)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct flock fl;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 signal(SIGCLD, SIG_DFL);<br>
-+=C2=A0 =C2=A0 =C2=A0 signal(SIGCHLD, SIG_DFL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fl.l_type =3D STOP;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0parent_put(&amp;fl);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0wait(0);<br>
-diff --git a/testcases/kernel/syscalls/<wbr>fcntl/fcntl21.c b/testcases/ke=
rnel/syscalls/<wbr>fcntl/fcntl21.c<br>
-index 5307021..8f1a67c 100644<br>
---- a/testcases/kernel/syscalls/<wbr>fcntl/fcntl21.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>fcntl/fcntl21.c<br>
-@@ -110,9 +110,9 @@ void setup(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(&amp;act, 0, sizeof(act));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0act.sa_handler =3D catch_child;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sigemptyset(&amp;act.sa_mask);<br>
--=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;act.sa_mask, SIGCLD);<br>
--=C2=A0 =C2=A0 =C2=A0 if ((sigaction(SIGCLD, &amp;act, NULL)) &lt; 0) {<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TFAIL, &quot;SI=
GCLD signal setup failed, errno: %d&quot;, errno);<br>
-+=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;act.sa_mask, SIGCHLD);<br>
-+=C2=A0 =C2=A0 =C2=A0 if ((sigaction(SIGCHLD, &amp;act, NULL)) &lt; 0) {<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_resm(TFAIL, &quot;SI=
GCHLD signal setup failed, errno: %d&quot;, errno);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fail =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
-@@ -272,7 +272,7 @@ void stop_child(void)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct flock fl;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 signal(SIGCLD, SIG_DFL);<br>
-+=C2=A0 =C2=A0 =C2=A0 signal(SIGCHLD, SIG_DFL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fl.l_type =3D STOP;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0parent_put(&amp;fl);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0wait(0);<br>
-diff --git a/testcases/kernel/syscalls/<wbr>kill/kill02.c b/testcases/kern=
el/syscalls/<wbr>kill/kill02.c<br>
-index 9d6cc68..08360dd 100644<br>
---- a/testcases/kernel/syscalls/<wbr>kill/kill02.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>kill/kill02.c<br>
-@@ -701,7 +701,7 @@ void setup(void)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 Set to catch unexpected signals.<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 SIGCLD is set to be ignored because we=
 do not wait for termination status.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0*=C2=A0 SIGCHLD is set to be ignored because w=
e do not wait for termination status.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 SIGUSR1 is set to be ignored because t=
his is the signal we are using for<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 the test and we are not concerned with=
 the parent getting it.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-@@ -713,9 +713,9 @@ void setup(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;signal(SIGUSR1, SIG_IGN) failed&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 if (signal(SIGCLD, SIG_IGN) =3D=3D SIG_ERR) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (signal(SIGCHLD, SIG_IGN) =3D=3D SIG_ERR) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm(TBROK | TE=
RRNO, NULL,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;signal(SIGCLD, SIG_IGN) failed&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;signal(SIGCHLD, SIG_IGN) failed&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST_PAUSE;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>kill/kill12.c b/testcases/kern=
el/syscalls/<wbr>kill/kill12.c<br>
-index 7a47a4a..d7c4147 100644<br>
---- a/testcases/kernel/syscalls/<wbr>kill/kill12.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>kill/kill12.c<br>
-@@ -98,7 +98,7 @@ int main(int argc, char **argv)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0exno =3D 1;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 if (sigset(SIGCLD, chsig) =3D=3D SIG_ERR) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (sigset(SIGCHLD, chsig) =3D=3D SIG_ERR) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(temp, &quot=
;\tsigset failed, errno =3D %d\n&quot;, errno);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fail_exit();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -128,7 +128,7 @@ int main(int argc, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sleep(1);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kill(pid, sig); /* child should ignroe this sig */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kill(pid, SIGCLD);=C2=A0 =C2=A0 =C2=A0 /* child should exit */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kill(pid, SIGCHLD);=C2=A0 =C2=A0 =C2=A0/* child should exit */<br>
-<br>
- #ifdef BCS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0while ((npid =3D wait(&amp;status)) !=3D pid<br>
-@@ -222,14 +222,14 @@ void do_child(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int exno =3D 1;<br>
-<br>
- #ifdef UCLINUX<br>
--=C2=A0 =C2=A0 =C2=A0 if (sigset(SIGCLD, chsig) =3D=3D SIG_ERR) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (sigset(SIGCHLD, chsig) =3D=3D SIG_ERR) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(temp, &quot=
;\tsigset failed, errno =3D %d\n&quot;, errno);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fail_exit();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- #endif<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sigset(sig, SIG_IGN);=C2=A0 =C2=A0/* set to ign=
ore signal */<br>
--=C2=A0 =C2=A0 =C2=A0 kill(getppid(), SIGCLD);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
/* tell parent we are ready */<br>
-+=C2=A0 =C2=A0 =C2=A0 kill(getppid(), SIGCHLD);=C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* tell parent we are ready */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0while (!chflag)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sleep(1);=C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* wait for parent */<br>
-<br>
-diff --git a/testcases/kernel/syscalls/<wbr>mkdir/mkdir09.c b/testcases/ke=
rnel/syscalls/<wbr>mkdir/mkdir09.c<br>
-index 41c20e9..07b4fb8 100644<br>
---- a/testcases/kernel/syscalls/<wbr>mkdir/mkdir09.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>mkdir/mkdir09.c<br>
-@@ -122,10 +122,10 @@ int main(int argc, char *argv[])<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 /* Set up to catch SIGCLD signal */<br>
--=C2=A0 =C2=A0 =C2=A0 if (signal(SIGCLD, chld) =3D=3D SIG_ERR) {<br>
-+=C2=A0 =C2=A0 =C2=A0 /* Set up to catch SIGCHLD signal */<br>
-+=C2=A0 =C2=A0 =C2=A0 if (signal(SIGCHLD, chld) =3D=3D SIG_ERR) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm(TFAIL, cle=
anup,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Error setting up SIGCLD signal, ERRNO =3D %d&quot;, errno);=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Error setting up SIGCHLD signal, ERRNO =3D %d&quot;, errno)=
;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-@@ -236,9 +236,9 @@ int runtest(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm(TFAIL, cle=
anup,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Error resetting SIGTERM signal, ERRNO =3D %d&quot;, errno)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 if (signal(SIGCLD, SIG_DFL) =3D=3D SIG_ERR) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (signal(SIGCHLD, SIG_DFL) =3D=3D SIG_ERR) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm(TFAIL, cle=
anup,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Error resetting SIGCLD signal, ERRNO =3D %d&quot;, errno);<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;Error resetting SIGCHLD signal, ERRNO =3D %d&quot;, errno);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (test_time) {<br>
-@@ -372,7 +372,7 @@ void term(int sig)<br>
-<br>
- void chld(int sig)<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 /* Routine to handle SIGCLD signal. */<br>
-+=C2=A0 =C2=A0 =C2=A0 /* Routine to handle SIGCHLD signal. */<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sigchld++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (jump) {<br>
-diff --git a/testcases/kernel/syscalls/<wbr>sighold/sighold02.c b/testcase=
s/kernel/syscalls/<wbr>sighold/sighold02.c<br>
-index e3076fb..be01874 100644<br>
---- a/testcases/kernel/syscalls/<wbr>sighold/sighold02.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>sighold/sighold02.c<br>
-@@ -77,7 +77,7 @@ static int sigs_map[NUMSIGS];<br>
- static int skip_sig(int sig)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (sig) {<br>
--=C2=A0 =C2=A0 =C2=A0 case SIGCLD:<br>
-+=C2=A0 =C2=A0 =C2=A0 case SIGCHLD:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case SIGKILL:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case SIGALRM:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case SIGSTOP:<br>
-diff --git a/testcases/network/tcp_cmds/<wbr>perf_lan/pingpong.c b/testcas=
es/network/tcp_cmds/<wbr>perf_lan/pingpong.c<br>
-index 1196312..5b06798 100644<br>
---- a/testcases/network/tcp_cmds/<wbr>perf_lan/pingpong.c<br>
-+++ b/testcases/network/tcp_cmds/<wbr>perf_lan/pingpong.c<br>
-@@ -182,7 +182,7 @@ int main(int argc, char *argv[])<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Setup traps */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0signal(SIGINT, finish);<br>
--=C2=A0 =C2=A0 =C2=A0 signal(SIGCLD, finish);<br>
-+=C2=A0 =C2=A0 =C2=A0 signal(SIGCHLD, finish);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fork a child process to continue sending pac=
kets */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_resm(TINFO, &quot;Create a child process to=
 continue to send packets&quot;);<br>
-diff --git a/testcases/network/tcp_cmds/<wbr>perf_lan/pingpong6.c b/testca=
ses/network/tcp_cmds/<wbr>perf_lan/pingpong6.c<br>
-index 9747f58..0a0fb1d 100644<br>
---- a/testcases/network/tcp_cmds/<wbr>perf_lan/pingpong6.c<br>
-+++ b/testcases/network/tcp_cmds/<wbr>perf_lan/pingpong6.c<br>
-@@ -153,7 +153,7 @@ char *argv[];<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Setup traps */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0signal(SIGINT, finish);<br>
--=C2=A0 =C2=A0 =C2=A0 signal(SIGCLD, finish);<br>
-+=C2=A0 =C2=A0 =C2=A0 signal(SIGCHLD, finish);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fork a child process to continue sending pac=
kets */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;Create a child process to continue=
 to send packets \n&quot;);<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0009-Guard-error.h-with-__<=
wbr>GLIBC__.patch b/meta/recipes-extended/ltp/<wbr>ltp/0009-Guard-error.h-w=
ith-__<wbr>GLIBC__.patch<br>
deleted file mode 100644<br>
index e58e5a9..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0009-Guard-error.h-with-__<wbr>GLI=
BC__.patch<br>
+++ /dev/null<br>
@@ -1,270 +0,0 @@<br>
-From 4ba19d64e95a874995d0b554b891b5<wbr>ec35bd9495 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Thu, 7 Jan 2016 19:45:35 +0000<br>
-Subject: [PATCH 09/32] Guard error.h with __GLIBC__<br>
-<br>
-error API is specific to glibc so use the guard to make it conditional<br>
-on glibc<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- testcases/kernel/syscalls/<wbr>faccessat/faccessat01.c=C2=A0 =C2=A0| 2 ++=
<br>
- testcases/kernel/syscalls/<wbr>fallocate/fallocate01.c=C2=A0 =C2=A0| 2 ++=
<br>
- testcases/kernel/syscalls/<wbr>fchmodat/fchmodat01.c=C2=A0 =C2=A0 =C2=A0|=
 2 ++<br>
- testcases/kernel/syscalls/<wbr>fchownat/fchownat01.c=C2=A0 =C2=A0 =C2=A0|=
 2 ++<br>
- testcases/kernel/syscalls/<wbr>fchownat/fchownat02.c=C2=A0 =C2=A0 =C2=A0|=
 2 ++<br>
- testcases/kernel/syscalls/<wbr>fstatat/fstatat01.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 ++<br>
- testcases/kernel/syscalls/<wbr>futimesat/futimesat01.c=C2=A0 =C2=A0| 2 ++=
<br>
- testcases/kernel/syscalls/<wbr>linkat/linkat01.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 ++<br>
- testcases/kernel/syscalls/<wbr>linkat/linkat02.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 ++<br>
- testcases/kernel/syscalls/<wbr>mkdirat/mkdirat01.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 ++<br>
- testcases/kernel/syscalls/<wbr>mknodat/mknodat01.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 ++<br>
- testcases/kernel/syscalls/<wbr>mknodat/mknodat02.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 ++<br>
- testcases/kernel/syscalls/<wbr>openat/openat01.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 ++<br>
- testcases/kernel/syscalls/<wbr>readlinkat/readlinkat01.c | 2 ++<br>
- testcases/kernel/syscalls/<wbr>renameat/renameat01.c=C2=A0 =C2=A0 =C2=A0|=
 2 ++<br>
- testcases/kernel/syscalls/<wbr>symlinkat/symlinkat01.c=C2=A0 =C2=A0| 2 ++=
<br>
- testcases/kernel/syscalls/<wbr>unlinkat/unlinkat01.c=C2=A0 =C2=A0 =C2=A0|=
 2 ++<br>
- 17 files changed, 34 insertions(+)<br>
-<br>
-diff --git a/testcases/kernel/syscalls/<wbr>faccessat/faccessat01.c b/test=
cases/kernel/syscalls/<wbr>faccessat/faccessat01.c<br>
-index 7f0e87a..c72dcf0 100644<br>
---- a/testcases/kernel/syscalls/<wbr>faccessat/faccessat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>faccessat/faccessat01.c<br>
-@@ -37,7 +37,9 @@<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
- #include &lt;unistd.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>fallocate/fallocate01.c b/test=
cases/kernel/syscalls/<wbr>fallocate/fallocate01.c<br>
-index e72b123..643c0e2 100644<br>
---- a/testcases/kernel/syscalls/<wbr>fallocate/fallocate01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>fallocate/fallocate01.c<br>
-@@ -96,7 +96,9 @@<br>
- #include &lt;fcntl.h&gt;<br>
- #include &lt;sys/syscall.h&gt;<br>
- #include &lt;unistd.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;inttypes.h&gt;<br>
- #include &lt;sys/utsname.h&gt;<br>
-<br>
-diff --git a/testcases/kernel/syscalls/<wbr>fchmodat/fchmodat01.c b/testca=
ses/kernel/syscalls/<wbr>fchmodat/fchmodat01.c<br>
-index 19e9ad5..ae6d807 100644<br>
---- a/testcases/kernel/syscalls/<wbr>fchmodat/fchmodat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>fchmodat/fchmodat01.c<br>
-@@ -37,7 +37,9 @@<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
- #include &lt;unistd.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>fchownat/fchownat01.c b/testca=
ses/kernel/syscalls/<wbr>fchownat/fchownat01.c<br>
-index b361253..a5218af 100644<br>
---- a/testcases/kernel/syscalls/<wbr>fchownat/fchownat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>fchownat/fchownat01.c<br>
-@@ -28,7 +28,9 @@<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
- #include &lt;unistd.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>fchownat/fchownat02.c b/testca=
ses/kernel/syscalls/<wbr>fchownat/fchownat02.c<br>
-index 6b0304c..8d2863f 100644<br>
---- a/testcases/kernel/syscalls/<wbr>fchownat/fchownat02.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>fchownat/fchownat02.c<br>
-@@ -26,7 +26,9 @@<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
- #include &lt;unistd.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>fstatat/fstatat01.c b/testcase=
s/kernel/syscalls/<wbr>fstatat/fstatat01.c<br>
-index 61531c6..e99fbd2 100644<br>
---- a/testcases/kernel/syscalls/<wbr>fstatat/fstatat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>fstatat/fstatat01.c<br>
-@@ -48,7 +48,9 @@<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;sys/time.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>futimesat/futimesat01.c b/test=
cases/kernel/syscalls/<wbr>futimesat/futimesat01.c<br>
-index ae8d4fe..316dd78 100644<br>
---- a/testcases/kernel/syscalls/<wbr>futimesat/futimesat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>futimesat/futimesat01.c<br>
-@@ -37,7 +37,9 @@<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;sys/time.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>linkat/linkat01.c b/testcases/=
kernel/syscalls/<wbr>linkat/linkat01.c<br>
-index fc0687b..83cbfe7 100644<br>
---- a/testcases/kernel/syscalls/<wbr>linkat/linkat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>linkat/linkat01.c<br>
-@@ -49,7 +49,9 @@<br>
- #include &lt;sys/time.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
- #include &lt;unistd.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>linkat/linkat02.c b/testcases/=
kernel/syscalls/<wbr>linkat/linkat02.c<br>
-index e9a752a..8d7e431 100644<br>
---- a/testcases/kernel/syscalls/<wbr>linkat/linkat02.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>linkat/linkat02.c<br>
-@@ -23,7 +23,9 @@<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
- #include &lt;unistd.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>mkdirat/mkdirat01.c b/testcase=
s/kernel/syscalls/<wbr>mkdirat/mkdirat01.c<br>
-index 7e15947..1dbc038 100644<br>
---- a/testcases/kernel/syscalls/<wbr>mkdirat/mkdirat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>mkdirat/mkdirat01.c<br>
-@@ -30,7 +30,9 @@<br>
- #include &lt;sys/types.h&gt;<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>mknodat/mknodat01.c b/testcase=
s/kernel/syscalls/<wbr>mknodat/mknodat01.c<br>
-index 26e5538..f034f05 100644<br>
---- a/testcases/kernel/syscalls/<wbr>mknodat/mknodat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>mknodat/mknodat01.c<br>
-@@ -29,7 +29,9 @@<br>
- #include &lt;sys/types.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
- #include &lt;sys/stat.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>mknodat/mknodat02.c b/testcase=
s/kernel/syscalls/<wbr>mknodat/mknodat02.c<br>
-index f6368fa..7d0f7c0 100644<br>
---- a/testcases/kernel/syscalls/<wbr>mknodat/mknodat02.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>mknodat/mknodat02.c<br>
-@@ -29,7 +29,9 @@<br>
- #include &lt;sys/types.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
- #include &lt;sys/stat.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>openat/openat01.c b/testcases/=
kernel/syscalls/<wbr>openat/openat01.c<br>
-index 85f9a91..4ee0117 100644<br>
---- a/testcases/kernel/syscalls/<wbr>openat/openat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>openat/openat01.c<br>
-@@ -29,7 +29,9 @@<br>
- #include &lt;sys/types.h&gt;<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>readlinkat/readlinkat01.c b/te=
stcases/kernel/syscalls/<wbr>readlinkat/readlinkat01.c<br>
-index 97a49e8..b162853 100644<br>
---- a/testcases/kernel/syscalls/<wbr>readlinkat/readlinkat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>readlinkat/readlinkat01.c<br>
-@@ -29,7 +29,9 @@<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;sys/time.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>renameat/renameat01.c b/testca=
ses/kernel/syscalls/<wbr>renameat/renameat01.c<br>
-index f4cd51b..105a05b 100644<br>
---- a/testcases/kernel/syscalls/<wbr>renameat/renameat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>renameat/renameat01.c<br>
-@@ -42,7 +42,9 @@<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;sys/time.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>symlinkat/symlinkat01.c b/test=
cases/kernel/syscalls/<wbr>symlinkat/symlinkat01.c<br>
-index 5c238d8..cb7a7e8 100644<br>
---- a/testcases/kernel/syscalls/<wbr>symlinkat/symlinkat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>symlinkat/symlinkat01.c<br>
-@@ -37,7 +37,9 @@<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;sys/time.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>unlinkat/unlinkat01.c b/testca=
ses/kernel/syscalls/<wbr>unlinkat/unlinkat01.c<br>
-index 31fe4e7..26f6d9a 100644<br>
---- a/testcases/kernel/syscalls/<wbr>unlinkat/unlinkat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>unlinkat/unlinkat01.c<br>
-@@ -37,7 +37,9 @@<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;sys/time.h&gt;<br>
- #include &lt;fcntl.h&gt;<br>
-+#ifdef __GLIBC__<br>
- #include &lt;error.h&gt;<br>
-+#endif<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;string.h&gt;<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0009-fix-redefinition-of-<w=
br>struct-msgbuf-error-building-<wbr>wit.patch b/meta/recipes-extended/ltp/=
<wbr>ltp/0009-fix-redefinition-of-<wbr>struct-msgbuf-error-building-<wbr>wi=
t.patch<br>
new file mode 100644<br>
index 0000000..6886c55<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/<wbr>ltp/0009-fix-redefinition-of-<wbr>stru=
ct-msgbuf-error-building-<wbr>wit.patch<br>
@@ -0,0 +1,35 @@<br>
+From 2d7ea67e8eaa41cbd6816f7ab65425<wbr>4b40b530a1 Mon Sep 17 00:00:00 200=
1<br>
+From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke.du@w=
indriver.com</a>&gt;<br>
+Date: Thu, 9 Feb 2017 17:17:37 +0800<br>
+Subject: [PATCH] fix redefinition of &#39;struct msgbuf&#39; error buildin=
g with musl<br>
+<br>
+When building with musl the file &quot;sys/msg.h&quot; already contain &#3=
9;struct msgbuf&#39;<br>
+<br>
+Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">de=
ngke.du@windriver.com</a>&gt;<br>
+Upstream-Status: Pending<br>
+---<br>
+ testcases/kernel/syscalls/ipc/<wbr>msgrcv/msgrcv08.c | 4 +++-<br>
+ 1 file changed, 3 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/testcases/kernel/syscalls/<wbr>ipc/msgrcv/msgrcv08.c b/testca=
ses/kernel/syscalls/<wbr>ipc/msgrcv/msgrcv08.c<br>
+index a757c0d..e023114 100644<br>
+--- a/testcases/kernel/syscalls/<wbr>ipc/msgrcv/msgrcv08.c<br>
++++ b/testcases/kernel/syscalls/<wbr>ipc/msgrcv/msgrcv08.c<br>
+@@ -47,11 +47,13 @@ const char *TCID =3D &quot;msgrcv08&quot;;<br>
+ const int TST_TOTAL =3D 1;<br>
+<br>
+ #if __WORDSIZE =3D=3D 32<br>
+-<br>
++#ifdef __GLIBC__<br>
+ struct msgbuf {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0long mtype;=C2=A0 =C2=A0 =C2=A0/* message type,=
 must be &gt; 0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char mtext[16]; /* message data */<br>
+ };<br>
++#else<br>
++#endif<br>
+<br>
+ static void msr(int msqid)<br>
+ {<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0011-Rename-sigset-<wbr>var=
iable-to-sigset1.patch b/meta/recipes-extended/ltp/<wbr>ltp/0011-Rename-sig=
set-<wbr>variable-to-sigset1.patch<br>
index 945280c..4ac14dc 100644<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0011-Rename-sigset-<wbr>variable-t=
o-sigset1.patch<br>
+++ b/meta/recipes-extended/ltp/<wbr>ltp/0011-Rename-sigset-<wbr>variable-t=
o-sigset1.patch<br>
@@ -1,11 +1,12 @@<br>
-From aff0e2a8f011fa80b472355355a7e8<wbr>cdacd50189 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Thu, 7 Jan 2016 19:53:30 +0000<br>
-Subject: [PATCH 11/32] Rename sigset variable to sigset1<br>
+From dc1905b6d972f9176b40da270c83d8<wbr>fb4d1751b5 Mon Sep 17 00:00:00 200=
1<br>
+From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke.du@w=
indriver.com</a>&gt;<br>
+Date: Wed, 8 Feb 2017 16:12:34 +0800<br>
+Subject: [PATCH 2/5] Rename sigset variable to sigset1<br>
<br>
=C2=A0sigset API from signal.h is shadowed by this name conflict<br>
<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br>
+Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">de=
ngke.du@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 testcases/kernel/mem/shmt/<wbr>shmt04.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
=C2=A0 testcases/kernel/mem/shmt/<wbr>shmt06.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 +++++-----<br>
@@ -13,15 +14,15 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 3 files changed, 15 insertions(+), 15 deletions(-)<br>
<br>
=C2=A0diff --git a/testcases/kernel/mem/shmt/<wbr>shmt04.c b/testcases/kern=
el/mem/shmt/<wbr>shmt04.c<br>
-index 7203e9e..fce87d6 100644<br>
+index b2682da..3f35fad 100644<br>
=C2=A0--- a/testcases/kernel/mem/shmt/<wbr>shmt04.c<br>
=C2=A0+++ b/testcases/kernel/mem/shmt/<wbr>shmt04.c<br>
=C2=A0@@ -56,7 +56,7 @@ int TST_TOTAL =3D 2;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Total number of test cases. */<br>
=C2=A0 /**************/<br>
<br>
=C2=A0 key_t key;<br>
--sigset_t sigset;<br>
-+sigset_t sigset1;<br>
+-sigset_t set;<br>
++sigset_t set1;<br>
<br>
=C2=A0 #define=C2=A0 SIZE=C2=A0 16*1024<br>
<br>
@@ -29,12 +30,12 @@ index 7203e9e..fce87d6 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D (key_t) getpid();<br>
<br>
--=C2=A0 =C2=A0 =C2=A0 sigemptyset(&amp;sigset);<br>
--=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;sigset, SIGUSR1);<br>
--=C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_BLOCK, &amp;sigset, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 sigemptyset(&amp;sigset1);<br>
-+=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;sigset1, SIGUSR1);<br>
-+=C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_BLOCK, &amp;sigset1, NULL);<br>
+-=C2=A0 =C2=A0 =C2=A0 sigemptyset(&amp;set);<br>
+-=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;set, SIGUSR1);<br>
+-=C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_BLOCK, &amp;set, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 sigemptyset(&amp;set1);<br>
++=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;set1, SIGUSR1);<br>
++=C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_BLOCK, &amp;set1, NULL);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pid =3D fork();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (pid) {<br>
@@ -42,21 +43,21 @@ index 7203e9e..fce87d6 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *cp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int sig;<br>
<br>
--=C2=A0 =C2=A0 =C2=A0 sigwait(&amp;sigset, &amp;sig);<br>
-+=C2=A0 =C2=A0 =C2=A0 sigwait(&amp;sigset1, &amp;sig);<br>
+-=C2=A0 =C2=A0 =C2=A0 sigwait(&amp;set, &amp;sig);<br>
++=C2=A0 =C2=A0 =C2=A0 sigwait(&amp;set1, &amp;sig);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chld_pid =3D getpid();<br>
=C2=A0 /*----------------------------<wbr>----------------------------*/<br=
>
<br>
=C2=A0diff --git a/testcases/kernel/mem/shmt/<wbr>shmt06.c b/testcases/kern=
el/mem/shmt/<wbr>shmt06.c<br>
-index a3c9ca3..77b0fc9 100644<br>
+index dd69de7..56fb1da 100644<br>
=C2=A0--- a/testcases/kernel/mem/shmt/<wbr>shmt06.c<br>
=C2=A0+++ b/testcases/kernel/mem/shmt/<wbr>shmt06.c<br>
=C2=A0@@ -57,7 +57,7 @@ int TST_TOTAL =3D 2;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Total number of test cases. */<br>
=C2=A0 /**************/<br>
<br>
=C2=A0 key_t key;<br>
--sigset_t sigset;<br>
-+sigset_t sigset1;<br>
+-sigset_t set;<br>
++sigset_t set1;<br>
<br>
=C2=A0 int child();<br>
=C2=A0 static int rm_shm(int);<br>
@@ -64,12 +65,12 @@ index a3c9ca3..77b0fc9 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 key =3D (key_t) getpid();<br>
<br>
--=C2=A0 =C2=A0 =C2=A0 sigemptyset(&amp;sigset);<br>
--=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;sigset, SIGUSR1);<br>
--=C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_BLOCK, &amp;sigset, NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 sigemptyset(&amp;sigset1);<br>
-+=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;sigset1, SIGUSR1);<br>
-+=C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_BLOCK, &amp;sigset1, NULL);<br>
+-=C2=A0 =C2=A0 =C2=A0 sigemptyset(&amp;set);<br>
+-=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;set, SIGUSR1);<br>
+-=C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_BLOCK, &amp;set, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 sigemptyset(&amp;set1);<br>
++=C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;set1, SIGUSR1);<br>
++=C2=A0 =C2=A0 =C2=A0 sigprocmask(SIG_BLOCK, &amp;set1, NULL);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pid =3D fork();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (pid) {<br>
@@ -77,21 +78,21 @@ index a3c9ca3..77b0fc9 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *cp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int sig;<br>
<br>
--=C2=A0 =C2=A0 =C2=A0 sigwait(&amp;sigset, &amp;sig);<br>
-+=C2=A0 =C2=A0 =C2=A0 sigwait(&amp;sigset1, &amp;sig);<br>
+-=C2=A0 =C2=A0 =C2=A0 sigwait(&amp;set, &amp;sig);<br>
++=C2=A0 =C2=A0 =C2=A0 sigwait(&amp;set1, &amp;sig);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chld_pid =3D getpid();<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((shmid =3D shmget(key, SIZE, 0)) &lt; 0) {<=
br>
=C2=A0diff --git a/testcases/kernel/syscalls/<wbr>sigprocmask/sigprocmask01=
.c b/testcases/kernel/syscalls/<wbr>sigprocmask/sigprocmask01.c<br>
-index 20fca52..6fb1d57 100644<br>
+index 232d25a..06d902f 100644<br>
=C2=A0--- a/testcases/kernel/syscalls/<wbr>sigprocmask/sigprocmask01.c<br>
=C2=A0+++ b/testcases/kernel/syscalls/<wbr>sigprocmask/sigprocmask01.c<br>
=C2=A0@@ -91,7 +91,7 @@ int TST_TOTAL =3D 1;<br>
=C2=A0 int sig_catch =3D 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* var=
iable to blocked/unblocked signals */<br>
<br>
=C2=A0 struct sigaction sa_new;=C2=A0 =C2=A0 =C2=A0 /* struct to hold signa=
l info */<br>
--sigset_t sigset;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* signa=
l set to hold signal lists */<br>
-+sigset_t sigset1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* signa=
l set to hold signal lists */<br>
+-sigset_t set;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* signal set to hold sign=
al lists */<br>
++sigset_t set1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
signal set to hold signal lists */<br>
=C2=A0 sigset_t sigset2;<br>
<br>
=C2=A0 int main(int ac, char **av)<br>
@@ -99,8 +100,8 @@ index 20fca52..6fb1d57 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* so that, si=
gnal will not be delivered to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the test pr=
ocess.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST(sigprocmask(SIG_BLO=
CK, &amp;sigset, 0));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST(sigprocmask(SIG_BLO=
CK, &amp;sigset1, 0));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST(sigprocmask(SIG_BLO=
CK, &amp;set, 0));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TEST(sigprocmask(SIG_BLO=
CK, &amp;set1, 0));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get the process =
id of test process */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 my_pid =3D getpid()=
;<br>
@@ -108,8 +109,8 @@ index 20fca52..6fb1d57 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sigprocmask(SIG_UNBLOCK,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;sigset, 0) =3D=3D -1) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;sigset1, 0) =3D=3D -1) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;set, 0) =3D=3D -1) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;set1, 0) =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm=
(TFAIL, cleanup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;sigprocmask() failed &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;to unblock signal, &quot;<br>
@@ -117,8 +118,8 @@ index 20fca52..6fb1d57 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Initialise the signal sets with the lis=
t that<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* excludes/includes=C2=A0 all system-defi=
ned signals.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 =C2=A0 if (sigemptyset(&amp;sigset) =3D=3D -1) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (sigemptyset(&amp;sigset1) =3D=3D -1) {<br>
+-=C2=A0 =C2=A0 =C2=A0 if (sigemptyset(&amp;set) =3D=3D -1) {<br>
++=C2=A0 =C2=A0 =C2=A0 if (sigemptyset(&amp;set1) =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm(TFAIL, cle=
anup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;sigemptyset() failed, errno=3D%d : %s&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0errno, strerror(errno));<br>
@@ -126,11 +127,11 @@ index 20fca52..6fb1d57 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Add specified signal (SIGINT) to the si=
gnal set<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* which excludes system-defined signals.<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
--=C2=A0 =C2=A0 =C2=A0 if (sigaddset(&amp;sigset, SIGINT) =3D=3D -1) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (sigaddset(&amp;sigset1, SIGINT) =3D=3D -1) {<br>
+-=C2=A0 =C2=A0 =C2=A0 if (sigaddset(&amp;set, SIGINT) =3D=3D -1) {<br>
++=C2=A0 =C2=A0 =C2=A0 if (sigaddset(&amp;set1, SIGINT) =3D=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_brkm(TFAIL, cle=
anup,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;sigaddset() failed, errno=3D%d : %s&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0errno, strerror(errno));<br>
=C2=A0--<br>
-2.7.0<br>
+2.7.4<br>
<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0012-fsstress.c-Replace-__<=
wbr>int64_t-with-int64_t.patch b/meta/recipes-extended/ltp/<wbr>ltp/0012-fs=
stress.c-Replace-__<wbr>int64_t-with-int64_t.patch<br>
deleted file mode 100644<br>
index e1532c1..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0012-fsstress.c-Replace-__<wbr>int=
64_t-with-int64_t.patch<br>
+++ /dev/null<br>
@@ -1,351 +0,0 @@<br>
-From 54e098a366a1d773c4d7d4124f2f5a<wbr>ab976681c3 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Thu, 7 Jan 2016 19:58:08 +0000<br>
-Subject: [PATCH 12/32] fsstress.c: Replace __int64_t with int64_t<br>
-<br>
-int64_t is defined in ISO C99<br>
-include limits.h to get defintions of PATH_MAX<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- testcases/kernel/fs/fsstress/<wbr>fsstress.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
31 +++++++++---------<br>
- testcases/network/nfs/nfs_<wbr>fsstress/fsstress.c | 47 ++++++++++++++---=
----------<br>
- 2 files changed, 40 insertions(+), 38 deletions(-)<br>
-<br>
-diff --git a/testcases/kernel/fs/<wbr>fsstress/fsstress.c b/testcases/kern=
el/fs/<wbr>fsstress/fsstress.c<br>
-index 2f89903..89f0b19 100644<br>
---- a/testcases/kernel/fs/<wbr>fsstress/fsstress.c<br>
-+++ b/testcases/kernel/fs/<wbr>fsstress/fsstress.c<br>
-@@ -36,6 +36,7 @@<br>
- #ifdef HAVE_SYS_PRCTL_H<br>
- # include &lt;sys/prctl.h&gt;<br>
- #endif<br>
-+#include &lt;limits.h&gt;<br>
-<br>
- #define XFS_ERRTAG_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 17<br>
-<br>
-@@ -1572,7 +1573,7 @@ void bulkstat_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 last;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0__s32 nent;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0xfs_bstat_t *t;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t total;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t total;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0xfs_fsop_bulkreq_t bsr;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0last =3D 0;<br>
-@@ -1764,14 +1765,14 @@ int setdirect(int fd)<br>
-<br>
- void dread_f(int opno, long r)<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t align;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t align;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dioattr diob;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int e;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pathname_t f;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t lr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t lr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t off;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat64 stb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int v;<br>
-@@ -1835,8 +1836,8 @@ void dread_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- #endif<br>
--=C2=A0 =C2=A0 =C2=A0 align =3D (__int64_t) diob.d_miniosz;<br>
--=C2=A0 =C2=A0 =C2=A0 lr =3D ((__int64_t) random() &lt;&lt; 32) + random()=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 align =3D (int64_t) diob.d_miniosz;<br>
-+=C2=A0 =C2=A0 =C2=A0 lr =3D ((int64_t) random() &lt;&lt; 32) + random();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D (off64_t) (lr % stb.st_size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off -=3D (off % align);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lseek64(fd, off, SEEK_SET);<br>
-@@ -1865,14 +1866,14 @@ void dread_f(int opno, long r)<br>
-<br>
- void dwrite_f(int opno, long r)<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t align;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t align;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dioattr diob;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int e;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pathname_t f;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t lr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t lr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t off;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat64 stb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int v;<br>
-@@ -1925,8 +1926,8 @@ void dwrite_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- #endif<br>
--=C2=A0 =C2=A0 =C2=A0 align =3D (__int64_t) diob.d_miniosz;<br>
--=C2=A0 =C2=A0 =C2=A0 lr =3D ((__int64_t) random() &lt;&lt; 32) + random()=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 align =3D (int64_t) diob.d_miniosz;<br>
-+=C2=A0 =C2=A0 =C2=A0 lr =3D ((int64_t) random() &lt;&lt; 32) + random();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D (off64_t) (lr % MIN(stb.st_size + (1024=
 * 1024), MAXFSIZE));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off -=3D (off % align);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lseek64(fd, off, SEEK_SET);<br>
-@@ -2224,7 +2225,7 @@ void read_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pathname_t f;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t lr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t lr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t off;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat64 stb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int v;<br>
-@@ -2262,7 +2263,7 @@ void read_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 lr =3D ((__int64_t) random() &lt;&lt; 32) + random()=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 lr =3D ((int64_t) random() &lt;&lt; 32) + random();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D (off64_t) (lr % stb.st_size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lseek64(fd, off, SEEK_SET);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D (random() % (getpagesize() * 32)) + 1;<=
br>
-@@ -2509,7 +2510,7 @@ void truncate_f(int opno, long r)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int e;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pathname_t f;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t lr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t lr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t off;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat64 stb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int v;<br>
-@@ -2530,7 +2531,7 @@ void truncate_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free_pathname(&amp;=
f);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 lr =3D ((__int64_t) random() &lt;&lt; 32) + random()=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 lr =3D ((int64_t) random() &lt;&lt; 32) + random();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D lr % MIN(stb.st_size + (1024 * 1024), M=
AXFSIZE);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off %=3D maxfsize;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0e =3D truncate64_path(&amp;f, off) &lt; 0 ? err=
no : 0;<br>
-@@ -2626,7 +2627,7 @@ void write_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pathname_t f;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t lr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t lr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t off;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat64 stb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int v;<br>
-@@ -2656,7 +2657,7 @@ void write_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 lr =3D ((__int64_t) random() &lt;&lt; 32) + random()=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 lr =3D ((int64_t) random() &lt;&lt; 32) + random();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D (off64_t) (lr % MIN(stb.st_size + (1024=
 * 1024), MAXFSIZE));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off %=3D maxfsize;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lseek64(fd, off, SEEK_SET);<br>
-diff --git a/testcases/network/nfs/nfs_<wbr>fsstress/fsstress.c b/testcase=
s/network/nfs/nfs_<wbr>fsstress/fsstress.c<br>
-index ac91262..a34c416 100644<br>
---- a/testcases/network/nfs/nfs_<wbr>fsstress/fsstress.c<br>
-+++ b/testcases/network/nfs/nfs_<wbr>fsstress/fsstress.c<br>
-@@ -31,6 +31,7 @@<br>
-=C2=A0 */<br>
-<br>
- #include &quot;global.h&quot;<br>
-+#include &lt;limits.h&gt;<br>
-<br>
- #define XFS_ERRTAG_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 17<br>
-<br>
-@@ -1368,7 +1369,7 @@ void allocsp_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pathname_t f;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct flock64 fl;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t lr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t lr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t off;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat64 stb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int v;<br>
-@@ -1398,7 +1399,7 @@ void allocsp_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 lr =3D ((__int64_t) random() &lt;&lt; 32) + random()=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 lr =3D ((int64_t) random() &lt;&lt; 32) + random();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D (off64_t) (lr % MIN(stb.st_size + (1024=
 * 1024), MAXFSIZE));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off %=3D maxfsize;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fl.l_whence =3D SEEK_SET;<br>
-@@ -1519,7 +1520,7 @@ void bulkstat_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0__uint64_t last;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int nent;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0xfs_bstat_t *t;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t total;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t total;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0xfs_fsop_bulkreq_t bsr;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0last =3D 0;<br>
-@@ -1708,14 +1709,14 @@ int setdirect(int fd)<br>
-<br>
- void dread_f(int opno, long r)<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t align;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t align;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dioattr diob;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int e;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pathname_t f;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t lr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t lr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t off;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat64 stb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int v;<br>
-@@ -1775,8 +1776,8 @@ void dread_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- #endif<br>
--=C2=A0 =C2=A0 =C2=A0 align =3D (__int64_t) diob.d_miniosz;<br>
--=C2=A0 =C2=A0 =C2=A0 lr =3D ((__int64_t) random() &lt;&lt; 32) + random()=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 align =3D (int64_t) diob.d_miniosz;<br>
-+=C2=A0 =C2=A0 =C2=A0 lr =3D ((int64_t) random() &lt;&lt; 32) + random();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D (off64_t) (lr % stb.st_size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off -=3D (off % align);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lseek64(fd, off, SEEK_SET);<br>
-@@ -1798,14 +1799,14 @@ void dread_f(int opno, long r)<br>
-<br>
- void dwrite_f(int opno, long r)<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t align;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t align;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dioattr diob;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int e;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pathname_t f;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t lr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t lr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t off;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat64 stb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int v;<br>
-@@ -1854,8 +1855,8 @@ void dwrite_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- #endif<br>
--=C2=A0 =C2=A0 =C2=A0 align =3D (__int64_t) diob.d_miniosz;<br>
--=C2=A0 =C2=A0 =C2=A0 lr =3D ((__int64_t) random() &lt;&lt; 32) + random()=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 align =3D (int64_t) diob.d_miniosz;<br>
-+=C2=A0 =C2=A0 =C2=A0 lr =3D ((int64_t) random() &lt;&lt; 32) + random();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D (off64_t) (lr % MIN(stb.st_size + (1024=
 * 1024), MAXFSIZE));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off -=3D (off % align);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lseek64(fd, off, SEEK_SET);<br>
-@@ -1917,7 +1918,7 @@ void freesp_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pathname_t f;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct flock64 fl;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t lr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t lr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t off;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat64 stb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int v;<br>
-@@ -1947,7 +1948,7 @@ void freesp_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 lr =3D ((__int64_t) random() &lt;&lt; 32) + random()=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 lr =3D ((int64_t) random() &lt;&lt; 32) + random();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D (off64_t) (lr % MIN(stb.st_size + (1024=
 * 1024), MAXFSIZE));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off %=3D maxfsize;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fl.l_whence =3D SEEK_SET;<br>
-@@ -2145,7 +2146,7 @@ void read_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pathname_t f;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t lr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t lr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t off;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat64 stb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int v;<br>
-@@ -2183,7 +2184,7 @@ void read_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 lr =3D ((__int64_t) random() &lt;&lt; 32) + random()=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 lr =3D ((int64_t) random() &lt;&lt; 32) + random();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D (off64_t) (lr % stb.st_size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lseek64(fd, off, SEEK_SET);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D (random() % (getpagesize() * 32)) + 1;<=
br>
-@@ -2281,7 +2282,7 @@ void resvsp_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pathname_t f;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct flock64 fl;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t lr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t lr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t off;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat64 stb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int v;<br>
-@@ -2311,7 +2312,7 @@ void resvsp_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 lr =3D ((__int64_t) random() &lt;&lt; 32) + random()=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 lr =3D ((int64_t) random() &lt;&lt; 32) + random();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D (off64_t) (lr % MIN(stb.st_size + (1024=
 * 1024), MAXFSIZE));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off %=3D maxfsize;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fl.l_whence =3D SEEK_SET;<br>
-@@ -2428,7 +2429,7 @@ void truncate_f(int opno, long r)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int e;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pathname_t f;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t lr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t lr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t off;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat64 stb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int v;<br>
-@@ -2449,7 +2450,7 @@ void truncate_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free_pathname(&amp;=
f);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 lr =3D ((__int64_t) random() &lt;&lt; 32) + random()=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 lr =3D ((int64_t) random() &lt;&lt; 32) + random();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D (off64_t) (lr % MIN(stb.st_size + (1024=
 * 1024), MAXFSIZE));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off %=3D maxfsize;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0e =3D truncate64_path(&amp;f, off) &lt; 0 ? err=
no : 0;<br>
-@@ -2491,7 +2492,7 @@ void unresvsp_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pathname_t f;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct flock64 fl;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t lr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t lr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t off;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat64 stb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int v;<br>
-@@ -2521,7 +2522,7 @@ void unresvsp_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 lr =3D ((__int64_t) random() &lt;&lt; 32) + random()=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 lr =3D ((int64_t) random() &lt;&lt; 32) + random();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D (off64_t) (lr % MIN(stb.st_size + (1024=
 * 1024), MAXFSIZE));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off %=3D maxfsize;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fl.l_whence =3D SEEK_SET;<br>
-@@ -2543,7 +2544,7 @@ void write_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pathname_t f;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len;<br>
--=C2=A0 =C2=A0 =C2=A0 __int64_t lr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int64_t lr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off64_t off;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct stat64 stb;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int v;<br>
-@@ -2573,7 +2574,7 @@ void write_f(int opno, long r)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 lr =3D ((__int64_t) random() &lt;&lt; 32) + random()=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 lr =3D ((int64_t) random() &lt;&lt; 32) + random();<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off =3D (off64_t) (lr % MIN(stb.st_size + (1024=
 * 1024), MAXFSIZE));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0off %=3D maxfsize;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0lseek64(fd, off, SEEK_SET);<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0013-include-fcntl.h-for-<w=
br>getting-O_-definitions.patch b/meta/recipes-extended/ltp/<wbr>ltp/0013-i=
nclude-fcntl.h-for-<wbr>getting-O_-definitions.patch<br>
deleted file mode 100644<br>
index 4266e4f..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0013-include-fcntl.h-for-<wbr>gett=
ing-O_-definitions.patch<br>
+++ /dev/null<br>
@@ -1,67 +0,0 @@<br>
-From 1ef8c32317064438ec3b37a114f5d8<wbr>2957f4e0c6 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Thu, 7 Jan 2016 20:05:54 +0000<br>
-Subject: [PATCH 13/32] include fcntl.h for getting O_* definitions<br>
-<br>
-musl exposes this issue, with glibc fcntl.h is included via some other<br>
-header and this problem remained latent<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- testcases/kernel/ipc/ipc_<wbr>stress/shmem_test_03.c=C2=A0 =C2=A0| 1 +<br=
>
- testcases/kernel/syscalls/mq_<wbr>notify/mq_notify01.c | 1 +<br>
- testcases/network/tcp_cmds/<wbr>sendfile/testsf_c.c=C2=A0 =C2=A0 | 1 +<br=
>
- testcases/network/tcp_cmds/<wbr>sendfile/testsf_s.c=C2=A0 =C2=A0 | 1 +<br=
>
- 4 files changed, 4 insertions(+)<br>
-<br>
-diff --git a/testcases/kernel/ipc/ipc_<wbr>stress/shmem_test_03.c b/testca=
ses/kernel/ipc/ipc_<wbr>stress/shmem_test_03.c<br>
-index c1b11fd..8be156f 100644<br>
---- a/testcases/kernel/ipc/ipc_<wbr>stress/shmem_test_03.c<br>
-+++ b/testcases/kernel/ipc/ipc_<wbr>stress/shmem_test_03.c<br>
-@@ -72,6 +72,7 @@<br>
- #include &lt;string.h&gt;<br>
- #include &lt;unistd.h&gt;<br>
- #include &lt;limits.h&gt;<br>
-+#include &lt;fcntl.h&gt;<br>
- #include &lt;sys/file.h&gt;<br>
- #include &lt;sys/ipc.h&gt;<br>
- #include &lt;sys/mman.h&gt;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>mq_notify/mq_notify01.c b/test=
cases/kernel/syscalls/<wbr>mq_notify/mq_notify01.c<br>
-index 4728c70..5c7846c 100644<br>
---- a/testcases/kernel/syscalls/<wbr>mq_notify/mq_notify01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>mq_notify/mq_notify01.c<br>
-@@ -41,6 +41,7 @@<br>
- #include &lt;mqueue.h&gt;<br>
- #include &lt;signal.h&gt;<br>
- #include &lt;stdlib.h&gt;<br>
-+#include &lt;fcntl.h&gt;<br>
-<br>
- #include &quot;../utils/include_j_h.h&quot;<br>
-<br>
-diff --git a/testcases/network/tcp_cmds/<wbr>sendfile/testsf_c.c b/testcas=
es/network/tcp_cmds/<wbr>sendfile/testsf_c.c<br>
-index 449784f..38d3274 100644<br>
---- a/testcases/network/tcp_cmds/<wbr>sendfile/testsf_c.c<br>
-+++ b/testcases/network/tcp_cmds/<wbr>sendfile/testsf_c.c<br>
-@@ -9,6 +9,7 @@<br>
- #include &lt;sys/types.h&gt;<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;string.h&gt;<br>
-+#include &lt;fcntl.h&gt;<br>
- #include &lt;sys/file.h&gt;<br>
- #include &lt;arpa/inet.h&gt;<br>
- #include &lt;netinet/in.h&gt;<br>
-diff --git a/testcases/network/tcp_cmds/<wbr>sendfile/testsf_s.c b/testcas=
es/network/tcp_cmds/<wbr>sendfile/testsf_s.c<br>
-index 17e98ad..bce8dd1 100644<br>
---- a/testcases/network/tcp_cmds/<wbr>sendfile/testsf_s.c<br>
-+++ b/testcases/network/tcp_cmds/<wbr>sendfile/testsf_s.c<br>
-@@ -6,6 +6,7 @@<br>
- #include &lt;stdio.h&gt;<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;unistd.h&gt;<br>
-+#include &lt;fcntl.h&gt;<br>
- #include &lt;sys/file.h&gt;<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;sys/signal.h&gt;<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0014-hyperthreading-<wbr>In=
clude-sys-types.h-for-pid_t-<wbr>definit.patch b/meta/recipes-extended/ltp/=
<wbr>ltp/0014-hyperthreading-<wbr>Include-sys-types.h-for-pid_t-<wbr>defini=
t.patch<br>
deleted file mode 100644<br>
index 84d81e9..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0014-hyperthreading-<wbr>Include-s=
ys-types.h-for-pid_t-<wbr>definit.patch<br>
+++ /dev/null<br>
@@ -1,56 +0,0 @@<br>
-From d63fefa86dac437c47b9ebbea0a82a<wbr>1240aaba2c Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Thu, 7 Jan 2016 20:09:56 +0000<br>
-Subject: [PATCH 14/32] hyperthreading: Include sys/types.h for pid_t<br>
- definition<br>
-<br>
-If sys/types.h is not included then it will not define pid_t_needed<br>
-and therefore typedef wont be included and we get errors about pid_t<br>
-being not known<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- testcases/kernel/sched/<wbr>hyperthreading/ht_affinity/ht_<wbr>utils.h=C2=
=A0 | 1 +<br>
- testcases/kernel/sched/<wbr>hyperthreading/ht_enabled/ht_<wbr>utils.h=C2=
=A0 =C2=A0| 1 +<br>
- testcases/kernel/sched/<wbr>hyperthreading/ht_interrupt/<wbr>ht_utils.h |=
 1 +<br>
- 3 files changed, 3 insertions(+)<br>
-<br>
-diff --git a/testcases/kernel/sched/<wbr>hyperthreading/ht_affinity/ht_<wb=
r>utils.h b/testcases/kernel/sched/<wbr>hyperthreading/ht_affinity/ht_<wbr>=
utils.h<br>
-index 1ec9794..9084aa7 100644<br>
---- a/testcases/kernel/sched/<wbr>hyperthreading/ht_affinity/ht_<wbr>utils=
.h<br>
-+++ b/testcases/kernel/sched/<wbr>hyperthreading/ht_affinity/ht_<wbr>utils=
.h<br>
-@@ -3,6 +3,7 @@<br>
- #define _HTUTILS_H_<br>
-<br>
- #include &lt;stdlib.h&gt;<br>
-+#include &lt;sys/types.h&gt;<br>
-<br>
- int is_cmdline_para(const char *para);<br>
-<br>
-diff --git a/testcases/kernel/sched/<wbr>hyperthreading/ht_enabled/ht_<wbr=
>utils.h b/testcases/kernel/sched/<wbr>hyperthreading/ht_enabled/ht_<wbr>ut=
ils.h<br>
-index 1ec9794..c03a124 100644<br>
---- a/testcases/kernel/sched/<wbr>hyperthreading/ht_enabled/ht_<wbr>utils.=
h<br>
-+++ b/testcases/kernel/sched/<wbr>hyperthreading/ht_enabled/ht_<wbr>utils.=
h<br>
-@@ -2,6 +2,7 @@<br>
- #ifndef _HTUTILS_H_<br>
- #define _HTUTILS_H_<br>
-<br>
-+#include &lt;sys/types.h&gt;<br>
- #include &lt;stdlib.h&gt;<br>
-<br>
- int is_cmdline_para(const char *para);<br>
-diff --git a/testcases/kernel/sched/<wbr>hyperthreading/ht_interrupt/<wbr>=
ht_utils.h b/testcases/kernel/sched/<wbr>hyperthreading/ht_interrupt/<wbr>h=
t_utils.h<br>
-index 2977ad0..6b484e1 100644<br>
---- a/testcases/kernel/sched/<wbr>hyperthreading/ht_interrupt/<wbr>ht_util=
s.h<br>
-+++ b/testcases/kernel/sched/<wbr>hyperthreading/ht_interrupt/<wbr>ht_util=
s.h<br>
-@@ -3,6 +3,7 @@<br>
- #define _HTUTILS_H_<br>
-<br>
- #include &lt;stdlib.h&gt;<br>
-+#include &lt;sys/types.h&gt;<br>
-<br>
- int is_cmdline_para(const char *para);<br>
-<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0015-mincore01-Rename-<wbr>=
PAGESIZE-to-pagesize.patch b/meta/recipes-extended/ltp/<wbr>ltp/0015-mincor=
e01-Rename-<wbr>PAGESIZE-to-pagesize.patch<br>
deleted file mode 100644<br>
index 963536f..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0015-mincore01-Rename-<wbr>PAGESIZ=
E-to-pagesize.patch<br>
+++ /dev/null<br>
@@ -1,64 +0,0 @@<br>
-From f091839532f3afe0a58e8ba0b45615<wbr>c899a43a47 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Thu, 7 Jan 2016 20:12:09 +0000<br>
-Subject: [PATCH 15/32] mincore01: Rename PAGESIZE to pagesize<br>
-<br>
-PAGESIZE conflicts with system headers on musl<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- testcases/kernel/syscalls/<wbr>mincore/mincore01.c | 10 +++++-----<br>
- 1 file changed, 5 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/testcases/kernel/syscalls/<wbr>mincore/mincore01.c b/testcase=
s/kernel/syscalls/<wbr>mincore/mincore01.c<br>
-index 97a3d95..fa426d1 100644<br>
---- a/testcases/kernel/syscalls/<wbr>mincore/mincore01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>mincore/mincore01.c<br>
-@@ -45,7 +45,7 @@<br>
- #include &quot;test.h&quot;<br>
- #include &quot;safe_macros.h&quot;<br>
-<br>
--static int PAGESIZE;<br>
-+static int pagesize;<br>
- static rlim_t STACK_LIMIT =3D 10485760;<br>
-<br>
- static void cleanup(void);<br>
-@@ -146,7 +146,7 @@ static void setup4(struct test_case_t *tc)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;addr =3D global_pointer;<br>
--=C2=A0 =C2=A0 =C2=A0 tc-&gt;len =3D as_lim.rlim_cur - (rlim_t)global_poin=
ter + PAGESIZE;<br>
-+=C2=A0 =C2=A0 =C2=A0 tc-&gt;len =3D as_lim.rlim_cur - (rlim_t)global_poin=
ter + pagesize;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;vector =3D global_vec;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
-@@ -161,7 +161,7 @@ static void setup(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 PAGESIZE =3D getpagesize();<br>
-+=C2=A0 =C2=A0 =C2=A0 pagesize =3D getpagesize();<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_sig(NOFORK, DEF_HANDLER, cleanup);<br>
-<br>
-@@ -170,7 +170,7 @@ static void setup(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST_PAUSE;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* global_pointer will point to a mmapped area =
of global_len bytes */<br>
--=C2=A0 =C2=A0 =C2=A0 global_len =3D PAGESIZE * 2;<br>
-+=C2=A0 =C2=A0 =C2=A0 global_len =3D pagesize * 2;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D SAFE_MALLOC(cleanup, global_len);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(buf, 42, global_len);<br>
-@@ -186,7 +186,7 @@ static void setup(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROT_READ | PROT_WRITE, MAP_S=
HARED, fd, 0);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0global_vec =3D SAFE_MALLOC(cleanup,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(global_len + PAGESIZE - 1) / PAGESIZ=
E);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(global_len + pagesize - 1) / pagesiz=
e);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_CLOSE(cleanup, fd);<br>
- }<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0016-ustat-Change-header-<w=
br>from-ustat.h-to-sys-ustat.h.<wbr>patch b/meta/recipes-extended/ltp/<wbr>=
ltp/0016-ustat-Change-header-<wbr>from-ustat.h-to-sys-ustat.h.<wbr>patch<br=
>
deleted file mode 100644<br>
index 1b5b93a..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0016-ustat-Change-header-<wbr>from=
-ustat.h-to-sys-ustat.h.<wbr>patch<br>
+++ /dev/null<br>
@@ -1,45 +0,0 @@<br>
-From 2b9be924bbad8a1f84ae553fdd1aa8<wbr>391aa8d2f4 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Thu, 7 Jan 2016 20:15:07 +0000<br>
-Subject: [PATCH 16/32] ustat: Change header from ustat.h to sys/ustat.h<br=
>
-<br>
-makes it portable for musl, on glibc ustat.h is just including<br>
-sys/ustat.h too<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- testcases/kernel/syscalls/<wbr>ustat/ustat01.c | 2 +-<br>
- testcases/kernel/syscalls/<wbr>ustat/ustat02.c | 2 +-<br>
- 2 files changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/testcases/kernel/syscalls/<wbr>ustat/ustat01.c b/testcases/ke=
rnel/syscalls/<wbr>ustat/ustat01.c<br>
-index 01b7688..494647b 100644<br>
---- a/testcases/kernel/syscalls/<wbr>ustat/ustat01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>ustat/ustat01.c<br>
-@@ -20,8 +20,8 @@<br>
-=C2=A0 */<br>
-<br>
- #include &lt;unistd.h&gt;<br>
--#include &lt;ustat.h&gt;<br>
- #include &lt;errno.h&gt;<br>
-+#include &lt;sys/ustat.h&gt;<br>
- #include &lt;sys/types.h&gt;<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &quot;test.h&quot;<br>
-diff --git a/testcases/kernel/syscalls/<wbr>ustat/ustat02.c b/testcases/ke=
rnel/syscalls/<wbr>ustat/ustat02.c<br>
-index 4e66236..edada31 100644<br>
---- a/testcases/kernel/syscalls/<wbr>ustat/ustat02.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>ustat/ustat02.c<br>
-@@ -21,8 +21,8 @@<br>
-=C2=A0 */<br>
-<br>
- #include &lt;unistd.h&gt;<br>
--#include &lt;ustat.h&gt;<br>
- #include &lt;errno.h&gt;<br>
-+#include &lt;sys/ustat.h&gt;<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;sys/types.h&gt;<br>
- #include &quot;test.h&quot;<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0017-replace-sigval_t-<wbr>=
with-union-sigval.patch b/meta/recipes-extended/ltp/<wbr>ltp/0017-replace-s=
igval_t-<wbr>with-union-sigval.patch<br>
deleted file mode 100644<br>
index ed25802..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0017-replace-sigval_t-<wbr>with-un=
ion-sigval.patch<br>
+++ /dev/null<br>
@@ -1,88 +0,0 @@<br>
-From c882bcd18820b44a685f0d5edd7aaf<wbr>f77a88c912 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Thu, 7 Jan 2016 20:17:55 +0000<br>
-Subject: [PATCH 17/32] replace sigval_t with union sigval<br>
-<br>
-This makes it compatible across musl and glibc<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- testcases/kernel/syscalls/<wbr>timer_getoverrun/timer_<wbr>getoverrun01.c=
 | 2 +-<br>
- testcases/kernel/syscalls/<wbr>timer_gettime/timer_gettime01.<wbr>c=C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
- testcases/kernel/timers/timer_<wbr>create/timer_create02.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
- testcases/kernel/timers/timer_<wbr>create/timer_create03.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
- 4 files changed, 6 insertions(+), 6 deletions(-)<br>
-<br>
-diff --git a/testcases/kernel/syscalls/<wbr>timer_getoverrun/timer_<wbr>ge=
toverrun01.c b/testcases/kernel/syscalls/<wbr>timer_getoverrun/timer_<wbr>g=
etoverrun01.c<br>
-index d186c1f..bc03544 100644<br>
---- a/testcases/kernel/syscalls/<wbr>timer_getoverrun/timer_<wbr>getoverru=
n01.c<br>
-+++ b/testcases/kernel/syscalls/<wbr>timer_getoverrun/timer_<wbr>getoverru=
n01.c<br>
-@@ -54,7 +54,7 @@ int main(int ac, char **av)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0setup();<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ev.sigev_value =3D (sigval_t) 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 ev.sigev_value =3D (union sigval) 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ev.sigev_signo =3D SIGALRM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ev.sigev_notify =3D SIGEV_SIGNAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(ltp_syscall(__NR_timer_<wbr>create, CLOCK_=
REALTIME, &amp;ev, &amp;timer));<br>
-diff --git a/testcases/kernel/syscalls/<wbr>timer_gettime/timer_gettime01.=
<wbr>c b/testcases/kernel/syscalls/<wbr>timer_gettime/timer_gettime01.<wbr>=
c<br>
-index b583aee..9371a6a 100644<br>
---- a/testcases/kernel/syscalls/<wbr>timer_gettime/timer_gettime01.<wbr>c<=
br>
-+++ b/testcases/kernel/syscalls/<wbr>timer_gettime/timer_gettime01.<wbr>c<=
br>
-@@ -55,7 +55,7 @@ int main(int ac, char **av)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0setup();<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 ev.sigev_value =3D (sigval_t) 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 ev.sigev_value =3D (union sigval) 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ev.sigev_signo =3D SIGALRM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ev.sigev_notify =3D SIGEV_SIGNAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0TEST(ltp_syscall(__NR_timer_<wbr>create, CLOCK_=
REALTIME, &amp;ev, &amp;timer));<br>
-diff --git a/testcases/kernel/timers/<wbr>timer_create/timer_create02.c b/=
testcases/kernel/timers/<wbr>timer_create/timer_create02.c<br>
-index 7f528ed..1127400 100644<br>
---- a/testcases/kernel/timers/<wbr>timer_create/timer_create02.c<br>
-+++ b/testcases/kernel/timers/<wbr>timer_create/timer_create02.c<br>
-@@ -142,7 +142,7 @@ void setup_test(int option)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (option) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 evp.sigev_value =3D (sig=
val_t) 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 evp.sigev_value =3D (uni=
on sigval) 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evp.sigev_signo =3D=
 SIGALRM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evp.sigev_notify =
=3D SIGEV_SIGNAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evp_ptr =3D &amp;ev=
p;<br>
-@@ -151,7 +151,7 @@ void setup_test(int option)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evp_ptr =3D NULL;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case 2:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 evp.sigev_value =3D (sig=
val_t) 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 evp.sigev_value =3D (uni=
on sigval) 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evp.sigev_signo =3D=
 SIGALRM;=C2=A0 =C2=A0 =C2=A0 /* any will do */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evp.sigev_notify =
=3D SIGEV_NONE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evp_ptr =3D &amp;ev=
p;<br>
-diff --git a/testcases/kernel/timers/<wbr>timer_create/timer_create03.c b/=
testcases/kernel/timers/<wbr>timer_create/timer_create03.c<br>
-index 291fcfa..8b01bf7 100644<br>
---- a/testcases/kernel/timers/<wbr>timer_create/timer_create03.c<br>
-+++ b/testcases/kernel/timers/<wbr>timer_create/timer_create03.c<br>
-@@ -129,7 +129,7 @@ void setup_test(int option)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (option) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 evp.sigev_value =3D (sig=
val_t) 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 evp.sigev_value =3D (uni=
on sigval) 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evp.sigev_signo =3D=
 SIGALRM;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evp.sigev_notify =
=3D SIGEV_SIGNAL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evp_ptr =3D &amp;ev=
p;<br>
-@@ -138,7 +138,7 @@ void setup_test(int option)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evp_ptr =3D NULL;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case 2:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 evp.sigev_value =3D (sig=
val_t) 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 evp.sigev_value =3D (uni=
on sigval) 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evp.sigev_signo =3D=
 SIGALRM;=C2=A0 =C2=A0 =C2=A0 /* any will do */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evp.sigev_notify =
=3D SIGEV_NONE;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0evp_ptr =3D &amp;ev=
p;<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0019-tomoyo-Replace-<wbr>ca=
nonicalize_file_name-with-<wbr>realpath.patch b/meta/recipes-extended/ltp/<=
wbr>ltp/0019-tomoyo-Replace-<wbr>canonicalize_file_name-with-<wbr>realpath.=
patch<br>
deleted file mode 100644<br>
index 0a4c5f0..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0019-tomoyo-Replace-<wbr>canonical=
ize_file_name-with-<wbr>realpath.patch<br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-From 721e94985b9cff3e2724af7ea5be7d<wbr>005bc12dec Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Fri, 8 Jan 2016 06:55:27 +0000<br>
-Subject: [PATCH 19/32] tomoyo: Replace canonicalize_file_name() with<br>
- realpath()<br>
-<br>
-canonicalize_file_name() API is specific to glibc<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- testcases/kernel/security/<wbr>tomoyo/tomoyo_filesystem_test.<wbr>c | 4 +=
+--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/testcases/kernel/security/<wbr>tomoyo/tomoyo_filesystem_test.=
<wbr>c b/testcases/kernel/security/<wbr>tomoyo/tomoyo_filesystem_test.<wbr>=
c<br>
-index da4af0f..5c1a3ca 100644<br>
---- a/testcases/kernel/security/<wbr>tomoyo/tomoyo_filesystem_test.<wbr>c<=
br>
-+++ b/testcases/kernel/security/<wbr>tomoyo/tomoyo_filesystem_test.<wbr>c<=
br>
-@@ -274,9 +274,9 @@ int main(int argc, char *argv[])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Test mount(). */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0static char buf[409=
6];<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *dev_ram_path =3D c=
anonicalize_file_name(&quot;/dev/<wbr>ram0&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *dev_ram_path =3D r=
ealpath(&quot;/dev/ram0&quot;, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dev_ram_path)<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dev_ram_path =3D canonicalize_file_name(&quot;/dev/<wbr>ram&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dev_ram_path =3D realpath(&quot;/dev/ram&quot;, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!dev_ram_path) =
{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_ram_path =3D &quot;/dev/ram0&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mknod(dev_ram_path, S_IFBLK, MKDEV(1, 0));<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0022-include-sys-types.h.<w=
br>patch b/meta/recipes-extended/ltp/<wbr>ltp/0022-include-sys-types.h.<wbr=
>patch<br>
deleted file mode 100644<br>
index 413b44a..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0022-include-sys-types.h.<wbr>patc=
h<br>
+++ /dev/null<br>
@@ -1,29 +0,0 @@<br>
-From 7ac6fd51991ac61d1d7594f601d878<wbr>42060ee284 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Fri, 8 Jan 2016 07:06:11 +0000<br>
-Subject: [PATCH 22/32] include sys/types.h<br>
-<br>
-Fixes<br>
-<br>
-error: unknown type name &#39;uint&#39;<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- testcases/kernel/ipc/ipc_<wbr>stress/shmem_test_04.c | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/testcases/kernel/ipc/ipc_<wbr>stress/shmem_test_04.c b/testca=
ses/kernel/ipc/ipc_<wbr>stress/shmem_test_04.c<br>
-index 72c2e60..e7e5f61 100644<br>
---- a/testcases/kernel/ipc/ipc_<wbr>stress/shmem_test_04.c<br>
-+++ b/testcases/kernel/ipc/ipc_<wbr>stress/shmem_test_04.c<br>
-@@ -65,6 +65,7 @@<br>
- #include &lt;signal.h&gt;<br>
- #include &lt;stdint.h&gt;<br>
- #include &lt;sys/mman.h&gt;<br>
-+#include &lt;sys/types.h&gt;<br>
-<br>
- #ifdef _LINUX_<br>
- typedef unsigned long ulong_t;<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0027-sysconf01-Use-_SC_2_<w=
br>C_VERSION-conditionally.patch b/meta/recipes-extended/ltp/<wbr>ltp/0027-=
sysconf01-Use-_SC_2_<wbr>C_VERSION-conditionally.patch<br>
index b47d097..f75e33b 100644<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0027-sysconf01-Use-_SC_2_<wbr>C_VE=
RSION-conditionally.patch<br>
+++ b/meta/recipes-extended/ltp/<wbr>ltp/0027-sysconf01-Use-_SC_2_<wbr>C_VE=
RSION-conditionally.patch<br>
@@ -1,29 +1,30 @@<br>
-From 4a74b275acc8158850f2500928a146<wbr>7c3482c986 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Fri, 8 Jan 2016 07:23:11 +0000<br>
-Subject: [PATCH 27/32] sysconf01: Use _SC_2_C_VERSION conditionally<br>
+From 1471012164ba8f26046d4b1ce5531a<wbr>0d92805ef5 Mon Sep 17 00:00:00 200=
1<br>
+From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke.du@w=
indriver.com</a>&gt;<br>
+Date: Wed, 8 Feb 2017 16:21:16 +0800<br>
+Subject: [PATCH 4/5] sysconf01: Use _SC_2_C_VERSION conditionally<br>
<br>
=C2=A0_SC_2_C_VERSION is not available on musl<br>
<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br>
+Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">de=
ngke.du@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 testcases/kernel/syscalls/<wbr>sysconf/sysconf01.c | 2 ++<br>
=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
=C2=A0diff --git a/testcases/kernel/syscalls/<wbr>sysconf/sysconf01.c b/tes=
tcases/kernel/syscalls/<wbr>sysconf/sysconf01.c<br>
-index 8542e77..e806943 100644<br>
+index 583deef..de93695 100644<br>
=C2=A0--- a/testcases/kernel/syscalls/<wbr>sysconf/sysconf01.c<br>
=C2=A0+++ b/testcases/kernel/syscalls/<wbr>sysconf/sysconf01.c<br>
-@@ -102,7 +102,9 @@ int main(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0test_sysconf(_SC_ATEXIT_MAX);<br>
+@@ -103,7 +103,9 @@ int main(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_sysconf(_SC_2_C_BIND);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_sysconf(_SC_2_C_DEV);<br>
+ #ifdef _SC_2_C_VERSION<br>
=C2=A0+#ifdef __GLIBC__<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_sysconf(_SC_2_C_VERSION);<br>
=C2=A0+#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 21 - 25 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0test_sysconf(_SC_2_CHAR_TERM);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0test_sysconf(_SC_2_FORT_DEV);<br>
+ #else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tst_resm(TCONF, &quot;_SC_2_C_VERSION not defin=
ed&quot;);<br>
+ #endif<br>
=C2=A0--<br>
-2.7.0<br>
+2.7.4<br>
<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0029-trace_shed-Fix-build-<=
wbr>with-musl.patch b/meta/recipes-extended/ltp/<wbr>ltp/0029-trace_shed-Fi=
x-build-<wbr>with-musl.patch<br>
deleted file mode 100644<br>
index f7ece9e..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0029-trace_shed-Fix-build-<wbr>wit=
h-musl.patch<br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-From 2f8a57f66a94210d34dd0361659a82<wbr>97cf3d813f Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Fri, 8 Jan 2016 07:29:24 +0000<br>
-Subject: [PATCH 29/32] trace_shed: Fix build with musl<br>
-<br>
-Errors on musl are<br>
-<br>
-trace_sched.c:425:16: error: invalid operands to binary &amp; (have<br>
-&#39;thread_sched_t * {aka struct &lt;anonymous&gt; *}&#39; and &#39;int&#=
39;)<br>
-=C2=A0 =C2=A0 =C2=A0 thrd_ndx, WEXITSTATUS(status));<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- testcases/kernel/sched/tool/<wbr>trace_sched.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/testcases/kernel/sched/tool/<wbr>trace_sched.c b/testcases/ke=
rnel/sched/tool/<wbr>trace_sched.c<br>
-index 7815686..30dca5f 100644<br>
---- a/testcases/kernel/sched/tool/<wbr>trace_sched.c<br>
-+++ b/testcases/kernel/sched/tool/<wbr>trace_sched.c<br>
-@@ -422,7 +422,7 @@ int main(int argc,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 number of input parameters.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (status =3D=3D (thread_sched_t *) - 1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;thr=
ead [%d] - process exited with errors %d\n&quot;,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thrd_ndx, WEXIT=
STATUS(status));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thrd_ndx, WEXIT=
STATUS((int)status));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(-1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exp_prio[thrd_ndx] =3D status-&gt;exp=
_prio;<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0030-lib-Use-PTHREAD_<wbr>M=
UTEX_RECURSIVE-in-place-of-<wbr>PTHREAD_.patch b/meta/recipes-extended/ltp/=
<wbr>ltp/0030-lib-Use-PTHREAD_<wbr>MUTEX_RECURSIVE-in-place-of-<wbr>PTHREAD=
_.patch<br>
index d2d6d76..c5fac9b 100644<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0030-lib-Use-PTHREAD_<wbr>MUTEX_RE=
CURSIVE-in-place-of-<wbr>PTHREAD_.patch<br>
+++ b/meta/recipes-extended/ltp/<wbr>ltp/0030-lib-Use-PTHREAD_<wbr>MUTEX_RE=
CURSIVE-in-place-of-<wbr>PTHREAD_.patch<br>
@@ -1,33 +1,33 @@<br>
-From 77c95dacffe90382a1f131c801ac56<wbr>9120d95949 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Fri, 8 Jan 2016 07:32:24 +0000<br>
-Subject: [PATCH 30/32] lib: Use PTHREAD_MUTEX_RECURSIVE in place of<br>
+From 00ba7cdd0608b1507027428f9f87b1<wbr>cb9747372b Mon Sep 17 00:00:00 200=
1<br>
+From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke.du@w=
indriver.com</a>&gt;<br>
+Date: Thu, 9 Feb 2017 15:54:53 +0800<br>
+Subject: [PATCH] lib: Use PTHREAD_MUTEX_RECURSIVE in place of<br>
=C2=A0 PTHREAD_RECURSIVE_MUTEX_<wbr>INITIALIZER_NP for non-glibc<br>
<br>
=C2=A0e.g. musl does not implement the _NP mutex types<br>
<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br>
+Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">de=
ngke.du@windriver.com</a>&gt;<br>
=C2=A0---<br>
- lib/tst_res.c | 5 ++++-<br>
- 1 file changed, 4 insertions(+), 1 deletion(-)<br>
+ lib/tst_res.c | 4 ++++<br>
+ 1 file changed, 4 insertions(+)<br>
<br>
=C2=A0diff --git a/lib/tst_res.c b/lib/tst_res.c<br>
-index 5c1c58c..3244b5e 100644<br>
+index 61daaeb..435224f 100644<br>
=C2=A0--- a/lib/tst_res.c<br>
=C2=A0+++ b/lib/tst_res.c<br>
-@@ -104,8 +104,11 @@ int TEST_ERRNO;<br>
+@@ -79,7 +79,11 @@ int TEST_ERRNO;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(strlen(buf) &gt; 0);=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 } while (0)<br>
<br>
=C2=A0+#ifdef __GLIBC__<br>
=C2=A0 static pthread_mutex_t tmutex =3D PTHREAD_RECURSIVE_MUTEX_<wbr>INITI=
ALIZER_NP;<br>
--<br>
=C2=A0+#else<br>
=C2=A0+static pthread_mutex_t tmutex =3D {=C2=A0 PTHREAD_MUTEX_RECURSIVE };=
<br>
=C2=A0+#endif<br>
- /*<br>
-=C2=A0 * Define local function prototypes.<br>
-=C2=A0 */<br>
+<br>
+ static void check_env(void);<br>
+ static void tst_condense(int tnum, int ttype, const char *tmesg);<br>
=C2=A0--<br>
-2.7.0<br>
+2.7.4<br>
<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0031-vma03-fix-page-size-<w=
br>offset-as-per-page-size-<wbr>alignmen.patch b/meta/recipes-extended/ltp/=
<wbr>ltp/0031-vma03-fix-page-size-<wbr>offset-as-per-page-size-<wbr>alignme=
n.patch<br>
deleted file mode 100644<br>
index 473ca4c..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0031-vma03-fix-page-size-<wbr>offs=
et-as-per-page-size-<wbr>alignmen.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-From 293ff1da06748ed4c69be6ece262d4<wbr>2e562e7298 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Fri, 8 Jan 2016 07:36:19 +0000<br>
-Subject: [PATCH 31/32] vma03: fix page size offset as per page size alignm=
ent<br>
-<br>
-the offset the param of mmap2() doesn&#39;t align the page size, but,<br>
-this param allow must be a multiple of the page size as returned<br>
-by sysconf(_SC_PAGE_SIZE).<wbr>meanwhile offset * 4096 must be a<br>
-multiple of the system page size, so modify the input param of offset<br>
-pgoff =3D (ULONG_MAX - 1)&amp;(~((pgsz-1)&gt;&gt;12));<br>
-<br>
-Signed-off-by: Chuang Dong &lt;<a href=3D"mailto:Chuang.Dong@windriver.com=
">Chuang.Dong@windriver.com</a>&gt;<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- testcases/kernel/mem/vma/<wbr>vma03.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/testcases/kernel/mem/vma/<wbr>vma03.c b/testcases/kernel/mem/=
vma/<wbr>vma03.c<br>
-index ad8a7b4..a539233 100644<br>
---- a/testcases/kernel/mem/vma/<wbr>vma03.c<br>
-+++ b/testcases/kernel/mem/vma/<wbr>vma03.c<br>
-@@ -85,7 +85,7 @@ int main(int argc, char *argv[])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1)<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tst_brkm(TBROK | TERRNO, NULL, &quot;open %s&quot;, TESTFILE);<br=
>
-<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pgoff =3D ULONG_MAX - 1;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pgoff =3D (ULONG_MAX - 1=
)&amp;(~((pgsz-1)&gt;&gt;12));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0map =3D mmap2(NULL,=
 pgsz, PROT_READ | PROT_WRITE, MAP_PRIVATE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0fd, pgoff);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (map =3D=3D MAP_=
FAILED)<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0032-regen.sh-Include-asm-<=
wbr>unistd.h-explicitly.patch b/meta/recipes-extended/ltp/<wbr>ltp/0032-reg=
en.sh-Include-asm-<wbr>unistd.h-explicitly.patch<br>
deleted file mode 100644<br>
index 5c6bf91..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0032-regen.sh-Include-asm-<wbr>uni=
std.h-explicitly.patch<br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-From 4f1905ff09c730091674818bd1b48e<wbr>e221347101 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Fri, 8 Jan 2016 08:30:29 +0000<br>
-Subject: [PATCH 32/32] regen.sh: Include asm/unistd.h explicitly<br>
-<br>
-on musl this is not included indirectly and it results in errors like<br>
-testcases/kernel/include/<wbr>linux_syscall_numbers.h:1035:<wbr>25: error:=
<br>
-&#39;__NR_SYSCALL_BASE&#39; undeclared (first use in this function)<br>
-|=C2=A0 #=C2=A0 define __NR_readdir (__NR_SYSCALL_BASE+ 89)<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
- testcases/kernel/include/<wbr>regen.sh | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/testcases/kernel/include/<wbr>regen.sh b/testcases/kernel/inc=
lude/<wbr>regen.sh<br>
-index f93f49b..ee790af 100755<br>
---- a/testcases/kernel/include/<wbr>regen.sh<br>
-+++ b/testcases/kernel/include/<wbr>regen.sh<br>
-@@ -32,6 +32,7 @@ cat &lt;&lt; EOF &gt; &quot;${output_pid}&quot;<br>
-<br>
- #include &lt;errno.h&gt;<br>
- #include &lt;sys/syscall.h&gt;<br>
-+#include &lt;asm/unistd.h&gt;<br>
- #include &quot;cleanup.c&quot;<br>
-<br>
- #define ltp_syscall(NR, ...) ({ \\<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0035-fix-test_proc_kill-<wb=
r>hang.patch b/meta/recipes-extended/ltp/<wbr>ltp/0035-fix-test_proc_kill-<=
wbr>hang.patch<br>
index 32ae8aa..71e32a5 100644<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0035-fix-test_proc_kill-<wbr>hang.=
patch<br>
+++ b/meta/recipes-extended/ltp/<wbr>ltp/0035-fix-test_proc_kill-<wbr>hang.=
patch<br>
@@ -1,23 +1,32 @@<br>
-Fix test_proc_kill hanging<br>
+From f7c602b639db0d118e07d3fa7b6dee<wbr>ad0be0c72b Mon Sep 17 00:00:00 200=
1<br>
+From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke.du@w=
indriver.com</a>&gt;<br>
+Date: Wed, 8 Feb 2017 16:17:17 +0800<br>
+Subject: [PATCH 3/5] Fix test_proc_kill hanging<br>
<br>
=C2=A0Sometimes the signal is delivered to memcg_process before the framewo=
rk took<br>
=C2=A0into consideration its pid entered in the tasks. Fixed by delaying th=
e signal<br>
=C2=A0send command.<br>
<br>
=C2=A0Signed-off-by: George Nita &lt;<a href=3D"mailto:george.nita@enea.com=
">george.nita@enea.com</a>&gt;<br>
-Upstream-Status: Pending<br>
+Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">de=
ngke.du@windriver.com</a>&gt;<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ testcases/kernel/controllers/<wbr>memcg/functional/memcg_lib.sh | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
<br>
=C2=A0diff --git a/testcases/kernel/<wbr>controllers/memcg/functional/<wbr>=
memcg_lib.sh b/testcases/kernel/<wbr>controllers/memcg/functional/<wbr>memc=
g_lib.sh<br>
-index ffbe006..e81bf74 100755<br>
+index b785fe3..2918cc5 100755<br>
=C2=A0--- a/testcases/kernel/<wbr>controllers/memcg/functional/<wbr>memcg_l=
ib.sh<br>
=C2=A0+++ b/testcases/kernel/<wbr>controllers/memcg/functional/<wbr>memcg_l=
ib.sh<br>
-@@ -220,8 +220,8 @@ test_proc_kill()<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$TEST_PATH/memcg_process $2 -s $3 &amp;<br>
+@@ -283,6 +283,7 @@ test_proc_kill()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pid=3D$!<br>
--=C2=A0 =C2=A0 =C2=A0 sleep 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TST_CHECKPOINT_WAIT 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $pid &gt; tasks<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 sleep 1<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kill -s USR1 $pid 2&gt; /dev/null<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sleep 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0signal_memcg_process $pid $3<br>
+<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0037-containers-netns_<wbr>=
netlink-Avoid-segmentation-<wbr>fault.patch b/meta/recipes-extended/ltp/<wb=
r>ltp/0037-containers-netns_<wbr>netlink-Avoid-segmentation-<wbr>fault.patc=
h<br>
deleted file mode 100644<br>
index 18d1f72..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0037-containers-netns_<wbr>netlink=
-Avoid-segmentation-<wbr>fault.patch<br>
+++ /dev/null<br>
@@ -1,50 +0,0 @@<br>
-From 193ce739b2a5174269a958b00c3a55<wbr>90de944e0d Mon Sep 17 00:00:00 200=
1<br>
-From: Huacai Chen &lt;<a href=3D"mailto:chenhc@lemote.com">chenhc@lemote.c=
om</a>&gt;<br>
-Date: Thu, 27 Oct 2016 14:45:52 +0800<br>
-Subject: [PATCH] containers/netns_netlink: Avoid segmentation fault<br>
-<br>
-In order to avoid segmentation fault (use NULL as a function pointer),<br>
-this patch modify check_netns() by passing a dummy function pointer to<br>
-do_clone_unshare_test().<br>
-<br>
-Signed-off-by: Huacai Chen &lt;<a href=3D"mailto:chenhc@lemote.com">chenhc=
@lemote.com</a>&gt;<br>
-Signed-off-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz">chrubis=
@suse.cz</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-Signed-off-by: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.c=
om">jackie.huang@windriver.com</a>&gt;<br>
----<br>
- testcases/kernel/containers/<wbr>netns/netns_helper.h | 10 ++++++++--<br>
- 1 file changed, 8 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/testcases/kernel/containers/<wbr>netns/netns_helper.h b/testc=
ases/kernel/containers/<wbr>netns/netns_helper.h<br>
-index 2a331ae..7df6dcb 100644<br>
---- a/testcases/kernel/containers/<wbr>netns/netns_helper.h<br>
-+++ b/testcases/kernel/containers/<wbr>netns/netns_helper.h<br>
-@@ -56,6 +56,12 @@ static void check_iproute(unsigned int spe_ipver)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pclose(ipf);<br>
- }<br>
-<br>
-+static int dummy(void *arg)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 (void) arg;<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+}<br>
-+<br>
- static void check_netns(void)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int pid, status;<br>
-@@ -64,8 +70,8 @@ static void check_netns(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm(TCONF | TE=
RRNO, NULL, &quot;CLONE_NEWNS (%d) not supported&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 CLONE_NEWNS);<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 pid =3D do_clone_unshare_test(T_<wbr>UNSHARE, CLONE_=
NEWNET | CLONE_NEWNS, NULL,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NULL);<br>
-+=C2=A0 =C2=A0 =C2=A0 pid =3D do_clone_unshare_test(T_<wbr>UNSHARE, CLONE_=
NEWNET | CLONE_NEWNS,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dummy, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pid =3D=3D -1)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tst_brkm(TCONF | TE=
RRNO, NULL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;unshare syscall smoke test fail=
ed&quot;);<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0038-run-posix-option-<wbr>=
group-test-replace-CWD-qith-<wbr>PWD.patch b/meta/recipes-extended/ltp/<wbr=
>ltp/0038-run-posix-option-<wbr>group-test-replace-CWD-qith-<wbr>PWD.patch<=
br>
deleted file mode 100644<br>
index 8034152..0000000<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0038-run-posix-option-<wbr>group-t=
est-replace-CWD-qith-<wbr>PWD.patch<br>
+++ /dev/null<br>
@@ -1,44 +0,0 @@<br>
-From f356775c400f40e3803d80a7bd295b<wbr>4265959c45 Mon Sep 17 00:00:00 200=
1<br>
-From: Vineet Gupta &lt;<a href=3D"mailto:Vineet.Gupta1@synopsys.com">Vinee=
t.Gupta1@synopsys.com</a>&gt;<br>
-Date: Mon, 29 Feb 2016 14:34:40 +0530<br>
-Subject: [PATCH] run-posix-option-group-test: replace CWD qith PWD<br>
-<br>
-When running LTP Open Posix Testsuite there is lot of messages as:<br>
-<br>
-| Usage: basename FILE [SUFFIX]<br>
-|<br>
-| Strip directory path and .SUFFIX from FILE<br>
-|<br>
-| *******************<br>
-| Testing<br>
-| *******************<br>
-<br>
-This is because there is no $CWD defined in shell and it looks like $PWD<b=
r>
-was intended instead.<br>
-<br>
-Signed-off-by: Vineet Gupta &lt;<a href=3D"mailto:vgupta@synopsys.com">vgu=
pta@synopsys.com</a>&gt;<br>
-Signed-off-by: Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz">chrubis=
@suse.cz</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-Signed-off-by: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.c=
om">jackie.huang@windriver.com</a>&gt;<br>
----<br>
- testcases/open_posix_<wbr>testsuite/bin/run-tests.sh | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/testcases/open_posix_<wbr>testsuite/bin/run-tests.sh b/testca=
ses/open_posix_<wbr>testsuite/bin/run-tests.sh<br>
-index d4bd988..5ee5687 100755<br>
---- a/testcases/open_posix_<wbr>testsuite/bin/run-tests.sh<br>
-+++ b/testcases/open_posix_<wbr>testsuite/bin/run-tests.sh<br>
-@@ -29,7 +29,7 @@ run_test_loop() {<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cat &lt;&lt;EOF<br>
- *******************<br>
--Testing $(basename $CWD)<br>
-+Testing $(basename $PWD)<br>
- *******************<br>
- $(printf &quot;PASS\t\t%3d&quot; $NUM_PASS)<br>
- $(printf &quot;FAIL\t\t%3d&quot; $NUM_FAIL)<br>
---<br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-extended/ltp/<wbr>ltp/0039-fcntl-fix-the-time-<wb=
r>def-to-use-time_t.patch b/meta/recipes-extended/ltp/<wbr>ltp/0039-fcntl-f=
ix-the-time-<wbr>def-to-use-time_t.patch<br>
index f7e805a..c0c1dad 100644<br>
--- a/meta/recipes-extended/ltp/<wbr>ltp/0039-fcntl-fix-the-time-<wbr>def-t=
o-use-time_t.patch<br>
+++ b/meta/recipes-extended/ltp/<wbr>ltp/0039-fcntl-fix-the-time-<wbr>def-t=
o-use-time_t.patch<br>
@@ -1,28 +1,29 @@<br>
-From 9590d073d3abe02fe0783ef8c530ae<wbr>f2e873ba9b Mon Sep 17 00:00:00 200=
1<br>
-From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com">ch=
ris_larson@mentor.com</a>&gt;<br>
-Date: Tue, 13 Dec 2016 12:48:29 -0700<br>
-Subject: [PATCH] fcntl: fix the time() def to use time_t<br>
+From 7bce3d223494803cb32897cabe6611<wbr>9076e53d89 Mon Sep 17 00:00:00 200=
1<br>
+From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke.du@w=
indriver.com</a>&gt;<br>
+Date: Wed, 8 Feb 2017 16:23:51 +0800<br>
+Subject: [PATCH 5/5] fcntl: fix the time() def to use time_t<br>
<br>
=C2=A0This fixes the build on X32, where long is 32-bit rather than 64-bit.=
<br>
<br>
=C2=A0Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@=
mentor.com">chris_larson@mentor.com</a>&gt;<br>
+Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">de=
ngke.du@windriver.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 testcases/kernel/syscalls/<wbr>fcntl/fcntl14.c | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/testcases/kernel/syscalls/<wbr>fcntl/fcntl14.c b/testcas=
es/kernel/syscalls/<wbr>fcntl/fcntl14.c<br>
-index 3b36572..65ac8fa 100644<br>
+index c61eb24..99e3867 100644<br>
=C2=A0--- a/testcases/kernel/syscalls/<wbr>fcntl/fcntl14.c<br>
=C2=A0+++ b/testcases/kernel/syscalls/<wbr>fcntl/fcntl14.c<br>
-@@ -789,7 +789,7 @@ void dochild(void)<br>
+@@ -775,7 +775,7 @@ void dochild(void)<br>
<br>
=C2=A0 void run_test(int file_flag, int file_mode, int seek, int start, int=
 end)<br>
=C2=A0 {<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 extern long time();<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 extern time_t time();<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* reset fail to 0 for each run_test call */<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fail =3D 0;<br>
+<br>
=C2=A0--<br>
-2.8.0<br>
+2.7.4<br>
<br>
diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20160126.bb" r=
el=3D"noreferrer" target=3D"_blank">lt<wbr>p_20160126.bb</a> b/meta/recipes=
-extended/ltp/<a href=3D"http://ltp_20170116.bb" rel=3D"noreferrer" target=
=3D"_blank">lt<wbr>p_20170116.bb</a><br>
similarity index 77%<br>
rename from meta/recipes-extended/ltp/<a href=3D"http://ltp_20160126.bb" re=
l=3D"noreferrer" target=3D"_blank">ltp_<wbr>20160126.bb</a><br>
rename to meta/recipes-extended/ltp/<a href=3D"http://ltp_20170116.bb" rel=
=3D"noreferrer" target=3D"_blank">ltp_<wbr>20170116.bb</a><br>
index aaa63c2..81c11ee 100644<br>
--- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20160126.bb" rel=3D"n=
oreferrer" target=3D"_blank">lt<wbr>p_20160126.bb</a><br>
+++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20170116.bb" rel=3D"n=
oreferrer" target=3D"_blank">lt<wbr>p_20170116.bb</a><br>
@@ -11,9 +11,6 @@ LIC_FILES_CHKSUM =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://testcases/kernel/<wbr>hotplug/cpu_hotplug/COPYIN=
G;<wbr>md5=3D<wbr>e04a2e542b2b8629bf9cd2ba29b0fe<wbr>41 \<br>
=C2=A0 =C2=A0 =C2=A0file://testcases/open_posix_<wbr>testsuite/COPYING;md5=
=3D<wbr>216e43b72efbe4ed9017cc19c4c68b<wbr>01 \<br>
=C2=A0 =C2=A0 =C2=A0file://testcases/realtime/<wbr>COPYING;md5=3D<wbr>12f88=
4d2ae1ff87c09e5b7ccc2c4ca<wbr>7e \<br>
-=C2=A0 =C2=A0 file://tools/netpipe-2.4/<wbr>COPYING;md5=3D<wbr>9e3781bb5fe=
787aa80e1f51f5006b6<wbr>fa \<br>
-=C2=A0 =C2=A0 file://tools/netpipe-2.4-ipv6/<wbr>COPYING;md5=3D<wbr>9e3781=
bb5fe787aa80e1f51f5006b6<wbr>fa \<br>
-=C2=A0 =C2=A0 file://tools/top-LTP/proc/<wbr>COPYING;md5=3D<wbr>aefc88eb8a=
41672fbfcfe6b69ab8c4<wbr>9c \<br>
=C2=A0 =C2=A0 =C2=A0file://tools/pounder21/<wbr>COPYING;md5=3D<wbr>94d55d51=
2a9ba36caa9b7df079bae1<wbr>9f \<br>
=C2=A0 =C2=A0 =C2=A0file://utils/benchmark/<wbr>kernbench-0.42/COPYING;md5=
=3D<wbr>94d55d512a9ba36caa9b7df079bae1<wbr>9f \<br>
=C2=A0 =C2=A0 =C2=A0file://utils/ffsb-6.0-rc2/<wbr>COPYING;md5=3D<wbr>c4608=
2167a314d785d012a244748d8<wbr>03 \<br>
@@ -24,49 +21,35 @@ DEPENDS_append_libc-musl =3D &quot; fts &quot;<br>
=C2=A0EXTRA_OEMAKE_append_libc-musl =3D &quot; LIBC=3Dmusl &quot;<br>
=C2=A0CFLAGS_append_powerpc64 =3D &quot; -D__SANE_USERSPACE_TYPES__&quot;<b=
r>
=C2=A0CFLAGS_append_mipsarchn64 =3D &quot; -D__SANE_USERSPACE_TYPES__&quot;=
<br>
-SRCREV =3D &quot;<wbr>fce797676b14f50406718e7ef640b5<wbr>0da66c9b36&quot;<=
br>
+SRCREV =3D &quot;<wbr>2c8457b0769fc026e4e1772f4c2a6d<wbr>a0be63a631&quot;<=
br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/linux-test-proje=
ct/ltp.git" rel=3D"noreferrer" target=3D"_blank">github.com/linux-test-<wbr=
>project/ltp.git</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-ltp-Don-t-link-<wbr>a=
gainst-libfl.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-add-_GNU_SOURCE-<wbr>=
to-pec_listener.c.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Add-knob-to-<wbr>cont=
rol-whether-numa-support-<wbr>should-be-c.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-Add-knob-to-<wbr>cont=
rol-tirpc-support.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-build-Add-option-<wbr=
>to-select-libc-implementation.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-kernel-<wbr>controlle=
rs-Link-with-libfts-<wbr>explicitly-on-mu.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-sendfile-Use-<wbr>off=
64_t-instead-of-__off64_t.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-replace-SIGCLD-<wbr>w=
ith-SIGCHLD.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-fix-PATH_MAX-<wbr>und=
eclared-when-building-with-<wbr>musl.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-fix-__WORDSIZE-<wbr>u=
ndeclared-when-building-with-<wbr>musl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0008-Check-if-__GLIBC_<wbr=
>PREREQ-is-defined-before-<wbr>using-it.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-Guard-error.h-<wbr>wi=
th-__GLIBC__.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-fix-redefinition-<wbr=
>of-struct-msgbuf-error-<wbr>building-wit.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0010-replace-__BEGIN_<wbr>=
DECLS-and-__END_DECLS.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0011-Rename-sigset-<wbr>va=
riable-to-sigset1.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-fsstress.c-<wbr>Repla=
ce-__int64_t-with-int64_<wbr>t.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0013-include-fcntl.h-<wbr>=
for-getting-O_-definitions.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0014-hyperthreading-<wbr>I=
nclude-sys-types.h-for-pid_t-<wbr>definit.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0015-mincore01-Rename-<wbr=
>PAGESIZE-to-pagesize.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0016-ustat-Change-<wbr>hea=
der-from-ustat.h-to-sys-<wbr>ustat.h.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0017-replace-sigval_t-<wbr=
>with-union-sigval.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0018-guard-mallocopt-<wbr>=
with-__GLIBC__.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0019-tomoyo-Replace-<wbr>c=
anonicalize_file_name-with-<wbr>realpath.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0020-getdents-define-<wbr>=
getdents-getdents64-only-for-<wbr>glibc.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0021-Define-_GNU_<wbr>SOUR=
CE-for-MREMAP_MAYMOVE-<wbr>definition.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0022-include-sys-types.<wb=
r>h.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0023-ptrace-Use-int-<wbr>i=
nstead-of-enum-__ptrace_<wbr>request.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0024-rt_sigaction-rt_<wbr>=
sigprocmark-Define-_GNU_<wbr>SOURCE.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0025-mc_gethost-<wbr>inclu=
de-sys-types.h.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0026-crash01-Define-_<wbr>=
GNU_SOURCE.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0027-sysconf01-Use-_SC_<wb=
r>2_C_VERSION-conditionally.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0028-rt_sigaction.h-<wbr>U=
se-sighandler_t-instead-of-__<wbr>sighand.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0029-trace_shed-Fix-<wbr>b=
uild-with-musl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0030-lib-Use-PTHREAD_<wbr>=
MUTEX_RECURSIVE-in-place-of-<wbr>PTHREAD_.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0031-vma03-fix-page-<wbr>s=
ize-offset-as-per-page-size-<wbr>alignmen.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0032-regen.sh-Include-<wbr=
>asm-unistd.h-explicitly.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0033-shmat1-Cover-GNU-<wbr=
>specific-code-under-__USE_GNU.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0034-periodic_output.<wbr>=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0035-fix-test_proc_<wbr>ki=
ll-hang.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0036-testcases-network-<wb=
r>nfsv4-acl-acl1.c-Security-fix-<wbr>on-s.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0037-containers-netns_<wbr=
>netlink-Avoid-segmentation-<wbr>fault.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0038-run-posix-option-<wbr=
>group-test-replace-CWD-qith-<wbr>PWD.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0039-fcntl-fix-the-<wbr>ti=
me-def-to-use-time_t.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0040-containers-<wbr>usern=
s05-use-unsigned-int-for-<wbr>ns-id.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
@@ -104,13 +87,16 @@ do_install(){<br>
=C2=A0 =C2=A0 =C2=A0# OSDL&#39;s Scaleable Test Platform, but now <a href=
=3D"http://khack.osdl.org" rel=3D"noreferrer" target=3D"_blank">http://khac=
k.osdl.org</a> unaccessible<br>
=C2=A0 =C2=A0 =C2=A0rm -rf ${D}/opt/ltp/bin/STPfailure_<wbr><a href=3D"http=
://report.pl">report.pl</a><br>
<br>
+=C2=A0 =C2=A0 # In oe-core, we doesn&#39;t support ksh and csh now, so rem=
ove in.csh and in.ksh.<br>
+=C2=A0 =C2=A0 rm ${D}/opt/ltp/testcases/data/<wbr>file01/in.csh<br>
+=C2=A0 =C2=A0 rm ${D}/opt/ltp/testcases/data/<wbr>file01/in.ksh<br>
=C2=A0 =C2=A0 =C2=A0# Copy POSIX test suite into ${D}/opt/ltp/testcases by =
manual<br>
=C2=A0 =C2=A0 =C2=A0cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testc=
ases<br>
=C2=A0}<br>
<br>
-RDEPENDS_${PN} =3D &quot;perl e2fsprogs-mke2fs python-core libaio bash gaw=
k expect ldd&quot;<br>
+RDEPENDS_${PN} =3D &quot;perl e2fsprogs-mke2fs python-core libaio bash gaw=
k expect ldd unzip gzip cpio cronie logrotate which at&quot;<br>
<br>
-FILES_${PN}-staticdev +=3D &quot;/opt/ltp/lib/libmem.a&quot;<br>
+FILES_${PN}-staticdev +=3D &quot;/opt/ltp/lib/libmem.a /opt/ltp/testcases/=
data/nm01/<wbr>lib.a&quot;<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenari=
o_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp=
/testscripts/* /opt/ltp/testcases/open_posix_<wbr>testsuite/* /opt/ltp/test=
cases/open_posix_<wbr>testsuite/conformance/* /opt/ltp/testcases/open_posix=
_<wbr>testsuite/Documentation/* /opt/ltp/testcases/open_posix_<wbr>testsuit=
e/functional/* /opt/ltp/testcases/open_posix_<wbr>testsuite/include/* /opt/=
ltp/testcases/open_posix_<wbr>testsuite/scripts/* /opt/ltp/testcases/open_p=
osix_<wbr>testsuite/stress/* /opt/ltp/testcases/open_posix_<wbr>testsuite/t=
ools/*&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.8.1<br>
<br>
</font></span></blockquote></div><br></div>

--001a114f410817583b05490ce0f5--
