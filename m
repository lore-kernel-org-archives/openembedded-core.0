Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 79234601D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 13:39:14 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id v15-v6so5799299ual.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vgvgakA9RW+L8apP14vVzyyBLJGx0gZBF8Xf3mhLF6w=;
	b=Rme7CLIvSEksyqa0oWAbs2rb+mOi279xIMQrS2QZ1uTsUjPN6wUCI6s8F2jFzcT1rk
	LxWKP6PoUProgFucFN1v2ZVVYSDk8tqgIP4qrkghanD4893RP1w5QlZ9a8UlrXz9WHED
	canQOTWo5DZC3LSFt6H0WfZQCHUwZicvqtihWfmGSMwHYWN+2+9xnr2wJbcMdM9Cs802
	Gci4mKlU0IOFF6dNNF4cUSKcIxP1bycDLslPGdju72x6W9qn7YfCvWPhUaQ8PtMe/++s
	PxXZ5rFcsCfos/vkrsvxKDARwxrgSBNvfrwiaYNA2drzBCXGKxFKNkRLQGMvamUr2lQ9
	Y6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vgvgakA9RW+L8apP14vVzyyBLJGx0gZBF8Xf3mhLF6w=;
	b=KWtxZwFah4DmNqHjhnjWUwc+nHjH16j6sItg8X4QlS8/U0Cd0y+FFglBiwtQ1jhFKi
	HgXdNTP75T6mdAggWoNfVICpzoAhXPJq2DcQ9ked6q5npmmD43WJbmXu2gJNW3o7pOof
	BudWsVfN5LGpPAKZH+g0wDMnKvx7c5To5q1SgOVmLPRrenAmZ4tLfH/n0+dyKfvNk7GA
	n/LlhtcPuFBK8yAIwDKPxUJtzaQDLWSKZp1y5jKYFIKYPQx7oitu5LcHVUUK1SMKl2IY
	7Gg4bcl8Bf3pyTeYOeRLGBlmOFseaZ28q/snGA4GpIrjYLS7Cu4UssA5XydZkrYUVyFV
	OqrA==
X-Gm-Message-State: APt69E1sTD/H1z2t/PDhkunvE0H6E80Y/cMa5LCn6KF5kW81smFdOeIr
	6+HGaD7TphK100dXFvsZAEaQ0UnWu8Gy4Ha+mKg=
X-Google-Smtp-Source: AAOMgpftUVpsYw0GBJluDZp/4wpWhki6+X4nNCtGad3yKiAFYNOA0+x+5EuW3LW5QP7hj99xQ+jiPCzGI7mg9pQXQOE=
X-Received: by 2002:ab0:50cd:: with SMTP id
	d13-v6mr6606152uaa.45.1530279554924; 
	Fri, 29 Jun 2018 06:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20180629125837.14657-1-george.mccollister@gmail.com>
In-Reply-To: <20180629125837.14657-1-george.mccollister@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Jun 2018 06:38:34 -0700
Message-ID: <CAMKF1src-wXJ9jXzOa+npmRNCBOod9hFNhmFV=m5CDa3sQqrTw@mail.gmail.com>
To: George McCollister <george.mccollister@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] apr: fix off_t size can't match when configure and in target glibc
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
X-List-Received-Date: Fri, 29 Jun 2018 13:39:14 -0000
Content-Type: text/plain; charset="UTF-8"

this is ok. however we should refer to

https://bz.apache.org/bugzilla/show_bug.cgi?id=56053

in the patch description somewhere, at least on master.
On Fri, Jun 29, 2018 at 5:59 AM George McCollister
<george.mccollister@gmail.com> wrote:
>
> From: Dengke Du <dengke.du@windriver.com>
>
> When subversion run on x86 and lib32 on x86-64, it use the APR's
> apr.h header file. But when configure the APR, APR meets the cross
> compiling, it was hardcoded in configure.in in apr source code. As
> the following:
>
>         APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], off_t, 8)
>
> It pass 8 bytes to off_t when meets cross compiling, but on x86 or lib32
> the off_t in glibc was 4 bytes, so it let the application who use apr.h
> go to wrong.
>
> Such as subversion:
>
>         svnadmin create test
>
> So we should let the APR detect the correct off_t when cross compiling,
> change it to the following:
>
>         AC_CHECK_SIZEOF(off_t)
>
> The same for the following hardcoded types for cross compiling:
>
>         pid_t   8
>         size_t  8
>         ssize_t 8
>
> Change the above correspondingly.
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> Cherry-picked from master e18820ca9202c07e2406d702c46f45415182b7a6
> I spent 4 hours tracking down a problem where apache was responding
> to a request with corrupt Content-Range data. This patch fixes the
> problem.
>
> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> ---
>  ...ze-doesn-t-match-in-glibc-when-cross.patch | 76 +++++++++++++++++++
>  meta/recipes-support/apr/apr_1.5.2.bb         |  1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
>
> diff --git a/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch b/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
> new file mode 100644
> index 0000000000..12371428f0
> --- /dev/null
> +++ b/meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch
> @@ -0,0 +1,76 @@
> +From f26e8b88d2c90ed7eb9d4e276412b0923c23d10f Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Wed, 14 Dec 2016 18:13:08 +0800
> +Subject: [PATCH] apr: fix off_t size doesn't match in glibc when cross
> + compiling
> +
> +In configure.in, it contains the following:
> +
> +       APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], off_t, 8)
> +
> +the macro "APR_CHECK_SIZEOF_EXTENDED" was defined in build/apr_common.m4,
> +it use the "AC_TRY_RUN" macro, this macro let the off_t to 8, when cross
> +compiling enable.
> +
> +So it was hardcoded for cross compiling, we should detect it dynamic based on
> +the sysroot's glibc. We change it to the following:
> +
> +       AC_CHECK_SIZEOF(off_t)
> +
> +The same for the following hardcoded types for cross compiling:
> +
> +       pid_t   8
> +       ssize_t 8
> +       size_t  8
> +       off_t   8
> +
> +Change the above correspondingly.
> +
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +---
> + configure.in | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/configure.in b/configure.in
> +index 9d57ae6..5b19940 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -1681,7 +1681,7 @@ else
> +     socklen_t_value="int"
> + fi
> +
> +-APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], pid_t, 8)
> ++AC_CHECK_SIZEOF(pid_t)
> +
> + if test "$ac_cv_sizeof_pid_t" = "$ac_cv_sizeof_short"; then
> +     pid_t_fmt='#define APR_PID_T_FMT "hd"'
> +@@ -1750,7 +1750,7 @@ APR_CHECK_TYPES_COMPATIBLE(ssize_t, long, [ssize_t_fmt="ld"])
> + APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned int, [size_t_fmt="u"])
> + APR_CHECK_TYPES_COMPATIBLE(size_t, unsigned long, [size_t_fmt="lu"])
> +
> +-APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], ssize_t, 8)
> ++AC_CHECK_SIZEOF(ssize_t)
> +
> + AC_MSG_CHECKING([which format to use for apr_ssize_t])
> + if test -n "$ssize_t_fmt"; then
> +@@ -1767,7 +1767,7 @@ fi
> +
> + ssize_t_fmt="#define APR_SSIZE_T_FMT \"$ssize_t_fmt\""
> +
> +-APR_CHECK_SIZEOF_EXTENDED([#include <stddef.h>], size_t, 8)
> ++AC_CHECK_SIZEOF(size_t)
> +
> + AC_MSG_CHECKING([which format to use for apr_size_t])
> + if test -n "$size_t_fmt"; then
> +@@ -1784,7 +1784,7 @@ fi
> +
> + size_t_fmt="#define APR_SIZE_T_FMT \"$size_t_fmt\""
> +
> +-APR_CHECK_SIZEOF_EXTENDED([#include <sys/types.h>], off_t, 8)
> ++AC_CHECK_SIZEOF(off_t)
> +
> + if test "${ac_cv_sizeof_off_t}${apr_cv_use_lfs64}" = "4yes"; then
> +     # Enable LFS
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-support/apr/apr_1.5.2.bb b/meta/recipes-support/apr/apr_1.5.2.bb
> index 302c93504b..f560c8b9c4 100644
> --- a/meta/recipes-support/apr/apr_1.5.2.bb
> +++ b/meta/recipes-support/apr/apr_1.5.2.bb
> @@ -17,6 +17,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
>             file://upgrade-and-fix-1.5.1.patch \
>             file://Fix-packet-discards-HTTP-redirect.patch \
>             file://configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch \
> +           file://0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch \
>  "
>
>  SRC_URI[md5sum] = "4e9769f3349fe11fc0a5e1b224c236aa"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

