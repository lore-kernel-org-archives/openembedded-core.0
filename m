Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9B29E6069C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 06:35:52 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id r14so35999370qtp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 22:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GyLObW3iGoxoTd35oHSkZQEb/DYzs1OS8KwcqItvEF8=;
	b=hJtx5EHt6daqDw6O0gkuCnHte+0WzxfUCCL7eenNeAHvZlADUjWbHxCCbt05Y0/EQz
	g1LnUovJ5iHBhAnXJifw9wZn+yLj29nD+63CQD+6lgBzmdLWXXdiI0uoFEvPuLIeCGjd
	PkD6k2Nnv5qtlMiKyOFrzisjSukN8ciUBS44xco41yHiFgW3U+CFkk+l+c1+9D/Onq0u
	EXPifVXqW+sF8s9jUQftdvWLE138S1ZhicEHVUCswTzi3ZuxNpcmik1aWGfVblrfYe2B
	tOduNmWkobum52w+F6Hw9C7sFOF7GlswsrD83IEHa/NwDWIgyaZJLbp8dtWA0PowmviT
	qnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GyLObW3iGoxoTd35oHSkZQEb/DYzs1OS8KwcqItvEF8=;
	b=bFkYlu4GB5zXxZ9dOx9PSJx6FO8Gh1bvpdIVHAGVBBbsvJGLLor4Bq0k5gpXuqBHz5
	O06v6i1gnaMtvdkbx07MkMMY0bVNULRqjuIYZhD3RglD5guZFp1jsIuzRTWlS4kOavT4
	xO3RWVcwEYe8z6ONuVrwlSdOGXhWm+oyOnQWLocZnIGqYaBFItTFteyuHanKBvXW5Jwn
	gSfzV69Ql/8+V1p94orsD3CIVP7+MPtUGjOPMVZUGQDphJhBntWM+9alqSIj3tqiDPgv
	wkTu89XHWy0K6/Bg68jqgcJBllzWRhgTcriiyNTGRHERpjFdQZ+M7QtBINRDu+868Zsu
	ThWg==
X-Gm-Message-State: AJcUukephXiv6qqRRcNB0iRe33O/tq9BYs+iN4pxySrE6qa+Q2dREp8/
	QdoBZ+klpvilm1gqb51ZJdhmGwn/9qGG2LoRVWs=
X-Google-Smtp-Source: ALg8bN7Hi+Kt+XvlzoD5mmVMHhpDSqWsE5nt4HdsVfy8zgs8qHZuFNPPZosii22TNiKnoauc9uIAY/+3ChTVjKs4OQI=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr46231040qva.50.1546497353184; 
	Wed, 02 Jan 2019 22:35:53 -0800 (PST)
MIME-Version: 1.0
References: <1546446977-27510-1-git-send-email-akuster808@gmail.com>
	<1546446977-27510-3-git-send-email-akuster808@gmail.com>
In-Reply-To: <1546446977-27510-3-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Jan 2019 22:35:27 -0800
Message-ID: <CAMKF1spP0b_U5S_5hEbM6rZsj1DCiyyc9eYzEC8NN-mgCk5ELA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] nettle: update to 3.4.1
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
X-List-Received-Date: Thu, 03 Jan 2019 06:35:52 -0000
Content-Type: text/plain; charset="UTF-8"

native version fails on ubuntu 14.04, seems like we need to pass
-std=c99 explicitly via cflags see

http://errors.yoctoproject.org/Errors/Details/214590/

On Wed, Jan 2, 2019 at 8:36 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> Bug fix only release
>
> Include:
>
>   CVE-2018-16868 gnutls: Bleichenbacher-like side channel leakage in
>   PKCS#1 1.5 verification and padding oracle verification
>
>   CVE-2018-16869 nettle: Leaky data conversion exposing a manager oracle
>
> For full details see:
> http://lists.lysator.liu.se/pipermail/nettle-bugs/2018/007369.html
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../Add-target-to-only-build-tests-not-run-them.patch                 | 0
>  .../check-header-files-of-openssl-only-if-enable_.patch               | 0
>  .../nettle/{nettle-3.4 => nettle-3.4.1}/dlopen-test.patch             | 0
>  meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/run-ptest    | 0
>  meta/recipes-support/nettle/{nettle_3.4.bb => nettle_3.4.1.bb}        | 4 ++--
>  5 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/Add-target-to-only-build-tests-not-run-them.patch (100%)
>  rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/check-header-files-of-openssl-only-if-enable_.patch (100%)
>  rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/dlopen-test.patch (100%)
>  rename meta/recipes-support/nettle/{nettle-3.4 => nettle-3.4.1}/run-ptest (100%)
>  rename meta/recipes-support/nettle/{nettle_3.4.bb => nettle_3.4.1.bb} (91%)
>
> diff --git a/meta/recipes-support/nettle/nettle-3.4/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/nettle-3.4.1/Add-target-to-only-build-tests-not-run-them.patch
> similarity index 100%
> rename from meta/recipes-support/nettle/nettle-3.4/Add-target-to-only-build-tests-not-run-them.patch
> rename to meta/recipes-support/nettle/nettle-3.4.1/Add-target-to-only-build-tests-not-run-them.patch
> diff --git a/meta/recipes-support/nettle/nettle-3.4/check-header-files-of-openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle-3.4.1/check-header-files-of-openssl-only-if-enable_.patch
> similarity index 100%
> rename from meta/recipes-support/nettle/nettle-3.4/check-header-files-of-openssl-only-if-enable_.patch
> rename to meta/recipes-support/nettle/nettle-3.4.1/check-header-files-of-openssl-only-if-enable_.patch
> diff --git a/meta/recipes-support/nettle/nettle-3.4/dlopen-test.patch b/meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
> similarity index 100%
> rename from meta/recipes-support/nettle/nettle-3.4/dlopen-test.patch
> rename to meta/recipes-support/nettle/nettle-3.4.1/dlopen-test.patch
> diff --git a/meta/recipes-support/nettle/nettle-3.4/run-ptest b/meta/recipes-support/nettle/nettle-3.4.1/run-ptest
> similarity index 100%
> rename from meta/recipes-support/nettle/nettle-3.4/run-ptest
> rename to meta/recipes-support/nettle/nettle-3.4.1/run-ptest
> diff --git a/meta/recipes-support/nettle/nettle_3.4.bb b/meta/recipes-support/nettle/nettle_3.4.1.bb
> similarity index 91%
> rename from meta/recipes-support/nettle/nettle_3.4.bb
> rename to meta/recipes-support/nettle/nettle_3.4.1.bb
> index ca8450e..33de928 100644
> --- a/meta/recipes-support/nettle/nettle_3.4.bb
> +++ b/meta/recipes-support/nettle/nettle_3.4.1.bb
> @@ -20,8 +20,8 @@ SRC_URI_append_class-target = "\
>              file://dlopen-test.patch \
>              "
>
> -SRC_URI[md5sum] = "dc0f13028264992f58e67b4e8915f53d"
> -SRC_URI[sha256sum] = "ae7a42df026550b85daca8389b6a60ba6313b0567f374392e54918588a411e94"
> +SRC_URI[md5sum] = "9bdebb0e2f638d3b9d91f7fc264b70c1"
> +SRC_URI[sha256sum] = "f941cf1535cd5d1819be5ccae5babef01f6db611f9b5a777bae9c7604b8a92ad"
>
>  UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

