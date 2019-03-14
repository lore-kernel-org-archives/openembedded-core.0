Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f178.google.com (mail-it1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id 73A7C6D56C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 19:25:26 +0000 (UTC)
Received: by mail-it1-f178.google.com with SMTP id h9so6924756itl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 12:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XuiIDAjXEiIi+afSr60p4Eqw1K2GqgSc2AbgDUrA6bk=;
	b=yKdvgcrpgkar7Ysfr6sy0Qj/dv1XxQvZ58Y4HIrNXWQRs2mqfHwPhiMOD+cG/hP6op
	rgAtGof9JPvJU+2hI5ENdECuTuWMmVLXhCaRjQM7OqOAf5cucJGPueXJOLmaREY4zYIF
	It5DTbe7WYCBI7rnbwuKFWkgzgE+NTvcLMQI1W6R4FFKSI+F/ufe219FoWPC/ZF6uNzV
	S9jWC7cNChyvJUFg3HRHNIP72Qt9rwcOXn/EtELogw7tUr6d3C/2UC2eiCLB8vqGTusa
	ZX2pUzfk+F+FXUl6doZlocWlMX3bnTOQAZ8lLYCkV2PKZ7S/XZPkXaUkxTAQrf0C19xI
	tDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XuiIDAjXEiIi+afSr60p4Eqw1K2GqgSc2AbgDUrA6bk=;
	b=kZ9IRt5dqH/KElKlRQQKyj3K+R0t3BF/NmJXH443Ra/KS4jN3fzqSv6zajo1hK4Q8R
	HBDxVetheDPJv221/H1EboZmL8yVA0JE3JUUqWZAnEgXRAC4AafXwYaO8gPWq9MXmGhV
	m4VwgOOC1zWHLfQYJg/GcygGJqHhQvB0ZPGKSVvchLmYAxG5M+vl4epdWjA8LSoWQ2h7
	R/KiToj7t2kiykZeWx/M81TMYbkzAI3ROcdogFD3yMnIHeRLbvp4hU+CMMMsPhKdt2gz
	aVslZqBvHk/J0ZwzjEZLc8McXHhjKx+OSFmL/CDZmwNmdDjmy1us0mMBNPF95y798SbR
	BSJQ==
X-Gm-Message-State: APjAAAXgsgnetlVIBiXQZpT7AifInAd0nd/xGZ5Q1yDdB9tn4fMO2hng
	vjJFIkjEKFqq4JthDr8OgqG+4dn5ihPx5BjBKyXxaZJS
X-Google-Smtp-Source: APXvYqwTbVF5lGcPdfLcFbpIB5i1j69L/e0ceSngxFiZRES18SUFQY45OGl1JiFVrTAGwnftJ9Y73xgiYc5j+485hQQ=
X-Received: by 2002:a24:9642:: with SMTP id z63mr89118itd.62.1552591527488;
	Thu, 14 Mar 2019 12:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190314191924.44162-1-joe.slater@windriver.com>
In-Reply-To: <20190314191924.44162-1-joe.slater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Mar 2019 19:25:16 +0000
Message-ID: <CAJTo0LafGyAEuh8hbQoXNQCR5bJ9YBmMDJV-idGZ0OPMkTGQoQ@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] puzzles: fix uninitialized variable compiler error
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
X-List-Received-Date: Thu, 14 Mar 2019 19:25:26 -0000
Content-Type: text/plain; charset="UTF-8"

Can we *please* start sending these upstream.  It's not like the
maintainer isn't responsive.

Ross

On Thu, 14 Mar 2019 at 19:20, Joe Slater <joe.slater@windriver.com> wrote:
>
> In tree234.c, change a while() loop to a for() loop so
> that the compiler will realize we loop at least once.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../puzzles/files/fix-ki-uninitialized.patch       | 25 ++++++++++++++++++++++
>  meta/recipes-sato/puzzles/puzzles_git.bb           |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch
>
> diff --git a/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch b/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch
> new file mode 100644
> index 0000000..7218d62
> --- /dev/null
> +++ b/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch
> @@ -0,0 +1,25 @@
> +puzzles: avoid compiler unitialized variable error
> +
> +The compiler does not realize that we must go through the while()
> +loop at least once, so we replace it with a for() loop.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +--- a/tree234.c
> ++++ b/tree234.c
> +@@ -326,8 +326,11 @@ static void *add234_internal(tree234 *t,
> +       return orig_e;
> +     }
> +
> +-    n = t->root;
> +-    while (n) {
> ++    /*
> ++     * We know t->root is not NULL.  The logic
> ++     * to break out of this is at the end of the loop.
> ++     */
> ++    for (n = t->root;;) {
> +       LOG(("  node %p: %p/%d \"%s\" %p/%d \"%s\" %p/%d \"%s\" %p/%d\n",
> +            n,
> +            n->kids[0], n->counts[0], n->elems[0],
> diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
> index 0766bd4..59b9525 100644
> --- a/meta/recipes-sato/puzzles/puzzles_git.bb
> +++ b/meta/recipes-sato/puzzles/puzzles_git.bb
> @@ -14,6 +14,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
>             file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
>             file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
>             file://0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch \
> +           file://fix-ki-uninitialized.patch \
>             "
>
>  UPSTREAM_CHECK_COMMITS = "1"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

