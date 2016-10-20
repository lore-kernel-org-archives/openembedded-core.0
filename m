Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 25F89600BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 02:54:45 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id 83so2170884vkd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 19:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Se35pj+Hl4d+fB/fIaSecAeSf4LZaHi8YamL3PGgn/U=;
	b=0a9UozElLn1eGKe7Uk0b8drGUspA7bQq+NjIu6sr1sskfzXKTJHTtM/H+Ut3fOEsNY
	mnTJW203NVESSUTfgUtgIo6BiBZFiFbJYBnMPxMY3FeziJe7d8NgbrXH0vcm70klpN6K
	FYQcytwc8ZfVuPLVfPJVELTv0WRo/xXSSToilg+SqHWDXwYUORgCX1NYhgdNcHnuWUHE
	JZtp2QwUdY4PdQmiWebjcKls0w6G7XcwUV3YXzx8xxnEUxj9mjevJr1NAKg2TbxVuWWk
	MU0L8hoKjEDaU5Ha5HtPK/OTsemPwWWlW8MKOORNLRJsfESQ8/V/2tQUXKcx1TlNaw5i
	1Wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Se35pj+Hl4d+fB/fIaSecAeSf4LZaHi8YamL3PGgn/U=;
	b=WiM70zdSq71lZnbHcFuu/DdakX+o8lXwSt4AjcLvWOW6DPxwgeL3wFQ+nbjHzQCBxl
	skVt5uDKzKevAXH9/7KuM5mfetZ3Yi2cMdq4BM33ychJCb9zvZO77mDJ2aR88hrXYGL8
	ZJSQTItR6eeWXTYZ5jBWVELG/SkWoBFNQEnYEO+ruZl1fUFs3nArTvz6ZcpD0drbH1tm
	ERayfmdMvQQHl0wtxnu8+SG0uSY74xHcGWX8wfNzbLH1JZVB1MzOu4qUsZcIOFB3jj/s
	+Cj6WW0qzCoaIz9nhfH79ffOJwWxYvzwhFfe/Stq6JaD/xiraqK8tX6w8oBsjrU4/VPY
	LRFg==
X-Gm-Message-State: AA6/9RkFmgo2WmYI+v6WoYU7ZtA9r610x4xGJPoheJjGtdJfqaGxuEWU3xqgk1MOh6KLF/IMhN0kTLne2wcbyQ==
X-Received: by 10.31.0.67 with SMTP id 64mr8680344vka.173.1476932087017; Wed,
	19 Oct 2016 19:54:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Wed, 19 Oct 2016 19:54:16 -0700 (PDT)
In-Reply-To: <1476925246-21514-1-git-send-email-akuster808@gmail.com>
References: <1476925246-21514-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Oct 2016 19:54:16 -0700
Message-ID: <CAMKF1so1ng=Yrr4CS8Z3bQvejWbawipTrCVkktqsL0jumB6TQQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][morty][krogoth][PATCH] musl: Security fix CVE-2016-8859
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
X-List-Received-Date: Thu, 20 Oct 2016 02:54:47 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 19, 2016 at 6:00 PM, Armin Kuster <akuster808@gmail.com> wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> CVE-2016-8859: TRE & musl libc regex integer overflows in buffer size computations
>
> Affects musl <= 1.1.15

this is ok. I have a version bump planned for master soon after so
master should be covered.
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-core/musl/files/CVE-2016-8859.patch | 79 ++++++++++++++++++++++++
>  meta/recipes-core/musl/musl_git.bb               |  1 +
>  2 files changed, 80 insertions(+)
>  create mode 100644 meta/recipes-core/musl/files/CVE-2016-8859.patch
>
> diff --git a/meta/recipes-core/musl/files/CVE-2016-8859.patch b/meta/recipes-core/musl/files/CVE-2016-8859.patch
> new file mode 100644
> index 0000000..82da86f
> --- /dev/null
> +++ b/meta/recipes-core/musl/files/CVE-2016-8859.patch
> @@ -0,0 +1,79 @@
> +From c3edc06d1e1360f3570db9155d6b318ae0d0f0f7 Mon Sep 17 00:00:00 2001
> +From: Rich Felker <dalias@aerifal.cx>
> +Date: Thu, 6 Oct 2016 18:34:58 -0400
> +Subject: [PATCH] fix missing integer overflow checks in regexec buffer size
> + computations
> +
> +most of the possible overflows were already ruled out in practice by
> +regcomp having already succeeded performing larger allocations.
> +however at least the num_states*num_tags multiplication can clearly
> +overflow in practice. for safety, check them all, and use the proper
> +type, size_t, rather than int.
> +
> +also improve comments, use calloc in place of malloc+memset, and
> +remove bogus casts.
> +
> +Upstream-Status: Backport
> +CVE: CVE-2016-8859
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + src/regex/regexec.c | 23 ++++++++++++++++++-----
> + 1 file changed, 18 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/regex/regexec.c b/src/regex/regexec.c
> +index 16c5d0a..dd52319 100644
> +--- a/src/regex/regexec.c
> ++++ b/src/regex/regexec.c
> +@@ -34,6 +34,7 @@
> + #include <wchar.h>
> + #include <wctype.h>
> + #include <limits.h>
> ++#include <stdint.h>
> +
> + #include <regex.h>
> +
> +@@ -206,11 +207,24 @@ tre_tnfa_run_parallel(const tre_tnfa_t *tnfa, const void *string,
> +
> +   /* Allocate memory for temporary data required for matching.        This needs to
> +      be done for every matching operation to be thread safe.  This allocates
> +-     everything in a single large block from the stack frame using alloca()
> +-     or with malloc() if alloca is unavailable. */
> ++     everything in a single large block with calloc(). */
> +   {
> +-    int tbytes, rbytes, pbytes, xbytes, total_bytes;
> ++    size_t tbytes, rbytes, pbytes, xbytes, total_bytes;
> +     char *tmp_buf;
> ++
> ++    /* Ensure that tbytes and xbytes*num_states cannot overflow, and that
> ++     * they don't contribute more than 1/8 of SIZE_MAX to total_bytes. */
> ++    if (num_tags > SIZE_MAX/(8 * sizeof(int) * tnfa->num_states))
> ++      goto error_exit;
> ++
> ++    /* Likewise check rbytes. */
> ++    if (tnfa->num_states+1 > SIZE_MAX/(8 * sizeof(*reach_next)))
> ++      goto error_exit;
> ++
> ++    /* Likewise check pbytes. */
> ++    if (tnfa->num_states > SIZE_MAX/(8 * sizeof(*reach_pos)))
> ++      goto error_exit;
> ++
> +     /* Compute the length of the block we need. */
> +     tbytes = sizeof(*tmp_tags) * num_tags;
> +     rbytes = sizeof(*reach_next) * (tnfa->num_states + 1);
> +@@ -221,10 +235,9 @@ tre_tnfa_run_parallel(const tre_tnfa_t *tnfa, const void *string,
> +       + (rbytes + xbytes * tnfa->num_states) * 2 + tbytes + pbytes;
> +
> +     /* Allocate the memory. */
> +-    buf = xmalloc((unsigned)total_bytes);
> ++    buf = calloc(total_bytes, 1);
> +     if (buf == NULL)
> +       return REG_ESPACE;
> +-    memset(buf, 0, (size_t)total_bytes);
> +
> +     /* Get the various pointers within tmp_buf (properly aligned). */
> +     tmp_tags = (void *)buf;
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index c07101b..1ee56b6 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -11,6 +11,7 @@ PV = "1.1.15+git${SRCPV}"
>
>  SRC_URI = "git://git.musl-libc.org/musl \
>             file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
> +           file://CVE-2016-8859.patch \
>            "
>
>  S = "${WORKDIR}/git"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

