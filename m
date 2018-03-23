Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8A46B78897
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 05:22:08 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id 123so4331780pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 22:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kgvFRA7LF7UHEl7hfj6XqUqINh7dn/cf8K0Z5PNjdLI=;
	b=Lc0KqvidlBKm9FPRIntG7L8ySSU++DOl55j6WMfly96KEFeXEUiiWkI3ivp0VKoIZP
	KxUIAHzSEy07OD0E3a1+feacLhHPh4/b9NGkA7nQTQAj2RYnxe5scjjpE3wcjBdJer8D
	imGmnwJMue764wUBYI/8+LpZVPmjVzCKoNq4Ez2lWZC8ZrBjc4268yOHxlMCVx+wVYaG
	3Sp7WViifoLoKphuRbt0uNns4r05p+gYRjHbA8+R3vCJL6cJq+8G5kxwsHqwcp2XmLhx
	I4cHXT0pdyvn5SxG2MIuhdu9SHzG/mQJO9lHzWXvsixfh0MPOhAiCA0e+VZafF9Hwfsx
	2iPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kgvFRA7LF7UHEl7hfj6XqUqINh7dn/cf8K0Z5PNjdLI=;
	b=qAAs01cGS3U3HNAR0gspeVEy7aU2RFpzfZsbccQpzmtnWUXmX/boguGPk5YRKZzhfA
	OVPrsEg23OldG5kJz2a5dCIDtwBqwG21IoNf3r1yPo1mhzTKSGQD/TDmmmtXFw4DWdhf
	jKm/NAXHJRHQnJ3vRhZPWyGdjpHlzGsvA2n/Qg0zWCD2Xs4Jgh4/60BMRHTz5lIUcHq4
	kFuj5vecfiPyUHXNZG6zayPRIMcvBDdsseFufiJmJhB/zgDogsIxmHw/d9cmY4TWKVzl
	uUKb7NolssLVKN1zoQDxUkn7krXKgDHteeID6SjQrFUV5ncBBTQT5FmwzB8bsM5ftleR
	lbhQ==
X-Gm-Message-State: AElRT7HCh8IwPW5Ufgp4COFOk4hQGr2TQ0YpnTKpnoiIliGJAVwPcNKz
	87bKL3QJMM45wHmr+BdLei1kgku8AXYqL2DXp5w=
X-Google-Smtp-Source: AG47ELvYXa04M1O8UWCj3HNxSiZ79j+HCM2ra0LE7g4R8UznVgMZNadlGpZqvi+vFSRR66rdzNLYlLCEkh16ED/Xprw=
X-Received: by 10.101.97.15 with SMTP id z15mr18059860pgu.393.1521782529510;
	Thu, 22 Mar 2018 22:22:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.173.149 with HTTP; Thu, 22 Mar 2018 22:21:39 -0700 (PDT)
In-Reply-To: <20180322173742.40112-1-oobitots@cisco.com>
References: <20180322173742.40112-1-oobitots@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2018 22:21:39 -0700
Message-ID: <CAMKF1sojOiyVd8eRcVt=59U6a1+3YhW3DeeDEsW=VhHuT4_ghw@mail.gmail.com>
To: Oleksiy Obitotskyy <oobitots@cisco.com>
Cc: XE-Linux <xe-linux-external@cisco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcp-wrappers: Fix build with clang
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
X-List-Received-Date: Fri, 23 Mar 2018 05:22:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 22, 2018 at 10:37 AM, Oleksiy Obitotskyy <oobitots@cisco.com> wrote:
> Fix non-void function 'fix_options' should return a value.
>

this patch is ok. Can you also check if this function signature is needed in
other source files as well ?

> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> ---
>  .../0001-Fix-build-with-clang.patch                | 30 ++++++++++++++++++++++
>  .../tcp-wrappers/tcp-wrappers_7.6.bb               |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
>
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
> new file mode 100644
> index 0000000..e601409
> --- /dev/null
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Fix-build-with-clang.patch
> @@ -0,0 +1,30 @@
> +From 46ade5e6f3bd3e11b6dd25fa0116c39753d2ba06 Mon Sep 17 00:00:00 2001
> +From: Oleksiy Obitotskyy <oobitots@cisco.com>
> +Date: Mon, 5 Feb 2018 08:29:10 -0800
> +Subject: [PATCH] Fix build with clang
> +
> +Fix "error: non-void function 'fix_options' should return a value".
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> +---
> + fix_options.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/fix_options.c b/fix_options.c
> +index b5e81b8..9958ff4 100644
> +--- a/fix_options.c
> ++++ b/fix_options.c
> +@@ -29,7 +29,7 @@ static char sccsid[] = "@(#) fix_options.c 1.6 97/04/08 02:29:19";
> +
> + /* fix_options - get rid of IP-level socket options */
> +
> +-fix_options(request)
> ++void fix_options(request)
> + struct request_info *request;
> + {
> + #ifdef IP_OPTIONS
> +--
> +2.10.3.dirty
> +
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> index 5fdbbce..8519da6 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> @@ -44,6 +44,7 @@ SRC_URI = "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
>             file://safe_finger.8 \
>             file://makefile-fix-parallel.patch \
>             file://musl-decls.patch \
> +           file://0001-Fix-build-with-clang.patch \
>             "
>
>  SRC_URI[md5sum] = "e6fa25f71226d090f34de3f6b122fb5a"
> --
> 2.10.3.dirty
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

