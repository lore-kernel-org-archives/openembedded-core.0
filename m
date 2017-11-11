Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4520978519
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Nov 2017 23:42:27 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id j16so4526385pgn.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Nov 2017 15:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=70KDo7NEfbhREVTqJ/P9yy9ggeTzCr6nyGfQf9dDVFs=;
	b=b2NLreWzV0tz1BLhhDVyrohcVJiFZIs+eUbuIVhZk3GFY8m2x007CX1AQ9WJ51zbh8
	5C4V9ADh9kMnT2jXY7vJkYGxv8Wktr/hTbqzTRS3vwHr4aosE/QOQJwUaPDPkJLucweO
	Bkhg6A6EH8VuSSB5RyzN6ueMc5JTkFzCb+h1LZDipuLrAJFXGOBFSjeSf2toPcPMYYUU
	EL6wuK6oenfQLF5r928+jQX5TI+IACOIvmST9akstcOStFnO5hGHGnbj2E26sjLkO7OS
	lYbrKIe+i4v2Q1T1ZFD6O/qp2F+1LctqhB+Zmqh5Y0O/mSTggUIqHrrsxC08h20LQKFy
	kQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=70KDo7NEfbhREVTqJ/P9yy9ggeTzCr6nyGfQf9dDVFs=;
	b=XTlR+jMO6cexdO9ufNQS7/HdvYY4nZR9jvpiFyZDCPJCforfhg4lpdgHWk1ap07d0M
	2/FrZDgS5cYa6F1vylzN3vqRWPzwrmuFfCqDfaeN4XnWgiijJIDqs3kw0cn2LQSiw1iN
	hyGcKuyJaaDTGGA5oORiPV1ZqPQ85BbLjaE8NDGN/ApvtKDtlW9nXAospp8fpHQVdh57
	hIvk9jjHOHQyh4dcjvKs7Z+YKiAICBoOsNAFjoWRhm8Ejp+b4soa8GAqKOytHmUL7Z+K
	QiaCKadvCjhIQYZ3na+/SW7ofjyo8pFfaGVHagJm0vwsx2GZWwa8PBoeJmrB7PgJGTlq
	ggRA==
X-Gm-Message-State: AJaThX6GYG1fGas8rmMM/CE+c/8yiB1/o5zG7W+AXgAhVWqQJmFgZfFC
	zDO7R1pfvx/gbHAfkLFKkdS7kT05KqTKFFECzvc=
X-Google-Smtp-Source: AGs4zMZ0uLS0D1tmz6P1Oq+431zxeXGuFY++WILTVpv4l36hMUxxYJfYLFqqqd7FN512//Jwmf8ddIezXJycitdJ2F4=
X-Received: by 10.98.207.71 with SMTP id b68mr5073179pfg.125.1510443749187;
	Sat, 11 Nov 2017 15:42:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.166.171 with HTTP; Sat, 11 Nov 2017 15:41:58 -0800 (PST)
In-Reply-To: <1510435976-10490-2-git-send-email-akuster808@gmail.com>
References: <1510435976-10490-1-git-send-email-akuster808@gmail.com>
	<1510435976-10490-2-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Nov 2017 15:41:58 -0800
Message-ID: <CAMKF1sqkDp6r9fThLUTCD5FdQMz_1zGOLgxU1PDttesgg8Gqqw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: update to 2.29.1
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
X-List-Received-Date: Sat, 11 Nov 2017 23:42:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 11, 2017 at 1:32 PM, Armin Kuster <akuster808@gmail.com> wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> update to 2.29.1 to fix the following missing CVE's
>
> CVE-2017-15939, CVE-2017-15938, CVE-2017-15225, CVE-2017-15025,
> CVE-2017-15024, CVE-2017-15023, CVE-2017-15022, CVE-2017-15021,
> CVE-2017-15020, CVE-2017-14974, CVE-2017-14940, CVE-2017-14939,
> CVE-2017-14938, CVE-2017-14934, CVE-2017-14933, CVE-2017-14932,
> CVE-2017-14930, CVE-2017-14745, CVE-2017-14729, CVE-2017-14529,
> CVE-2017-14333, CVE-2017-14130, CVE-2017-14129, CVE-2017-14128,
> CVE-2017-13757, CVE-2017-13716, CVE-2017-13710, CVE-2017-12967,
> CVE-2017-12799, CVE-2017-12459, CVE-2017-12458, CVE-2017-12457,
> CVE-2017-12456, CVE-2017-12455, CVE-2017-12454, CVE-2017-12453,
> CVE-2017-12452, CVE-2017-12451, CVE-2017-12450, CVE-2017-12449,
> CVE-2017-12448
>
> see Changelogs for additional information
>

This looks good. I will cherry pick it into my testing and see if
there are any issues

> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../binutils/{binutils-2.29.inc => binutils-2.29.1.inc}                 | 2 +-
>  ...inutils-cross-canadian_2.29.bb => binutils-cross-canadian_2.29.1.bb} | 0
>  .../binutils/{binutils-cross_2.29.bb => binutils-cross_2.29.1.bb}       | 0
>  .../binutils/{binutils-crosssdk_2.29.bb => binutils-crosssdk_2.29.1.bb} | 0
>  meta/recipes-devtools/binutils/{binutils_2.29.bb => binutils_2.29.1.bb} | 0
>  5 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/binutils/{binutils-2.29.inc => binutils-2.29.1.inc} (97%)
>  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.29.bb => binutils-cross-canadian_2.29.1.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-cross_2.29.bb => binutils-cross_2.29.1.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.29.bb => binutils-crosssdk_2.29.1.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils_2.29.bb => binutils_2.29.1.bb} (100%)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.29.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
> similarity index 97%
> rename from meta/recipes-devtools/binutils/binutils-2.29.inc
> rename to meta/recipes-devtools/binutils/binutils-2.29.1.inc
> index 27d46eb..d92bbbc 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.29.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
> @@ -18,7 +18,7 @@ BINUPV = "${@binutils_branch_version(d)}"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>
> -SRCREV = "37e991bb143ca2106330bcdc625590d53838b7a1"
> +SRCREV = "90276f15379d380761fc499da2ba24cfb3c12a94"
>  SRC_URI = "\
>       git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
>       file://0003-configure-widen-the-regexp-for-SH-architectures.patch \
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.bb
> rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.29.1.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.29.bb b/meta/recipes-devtools/binutils/binutils-cross_2.29.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-cross_2.29.bb
> rename to meta/recipes-devtools/binutils/binutils-cross_2.29.1.bb
> diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.29.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.29.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.29.bb
> rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.29.1.bb
> diff --git a/meta/recipes-devtools/binutils/binutils_2.29.bb b/meta/recipes-devtools/binutils/binutils_2.29.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/binutils/binutils_2.29.bb
> rename to meta/recipes-devtools/binutils/binutils_2.29.1.bb
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

