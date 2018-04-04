Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id F380074DFA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 21:28:12 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id s10-v6so13998332plp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 14:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=zXxaFZ229IcXqyGmZ9MaUQW7RfHPm6IA2taeSl7Ge6U=;
	b=rveGziYIQHArZpoLFKOuGLXtEhQavh96f2Q0Pj/U5+XVXfiecHLmaBkhRE1DSnMuLk
	8/6NuvrtqczyptZwb6Bvj97Kt0n7U7N5ws6bKeASDzSoIPDS8ERGnfII7pFx4PNiDgP+
	O+4aKtFsBUwV4hrPCwbH4iV647rMrQs8aEI7T69v8UForZKeJwbJ6nXraTeUEmoG1K3o
	zLjHhOIC2C7M+QTKeI3kQKT2thXlvO4fmG5IQJfzQf45WHLPPTzElXxbEWvcW8fDuzqb
	hkHhGMYBc1yASuvjMCCFifHIUtF8FUH5ohYNvULOcu/MfQC7joAokDj6jdjDuzFeaVNi
	I9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zXxaFZ229IcXqyGmZ9MaUQW7RfHPm6IA2taeSl7Ge6U=;
	b=Qmru2eHAHfhCqn/tqLpu2wEzZmKiSEItwyiUvbDN6u9jTCr2zA4FrXiGNcC+Q71Oro
	+n8sLlMfWEohtuFc7pyZdOvhkWfjGhQB/bd66k+lSOHnvf2my9BVZqU/pi72i6NEq6mW
	vsXKFZtl/qaJBiAfxv1ZMP/H86dpxryLREPhSsehC5m+a6oNOsUqaByA3/MTNYKptMP2
	6EAr+svo9gNf7+BcpykSnSDr9E+Gbr4CQBXCBym8UBziAIJ1bDeKd9GGdoPq8XIhKygG
	h9Lf1I1WXBNIaPV1qM5OLqlLXAnFKe/y6Him7s+Le+EeBKvzMF98k7pJtrty4BF45iKX
	+DYQ==
X-Gm-Message-State: AElRT7GjYGcm3IXHQ3+Md3amgLPPzAmHPbWzxHyMiK3VDn7jQZ7iWoP6
	4W0ZaGCXiN7ER8T0NnjjbSpqtkg0
X-Google-Smtp-Source: AIpwx4/fqE/xS/cFnqxwt4f+FUY2M3wulTOg1IXJ8kfKljnw3zrEiqg/U/HvuGg0ekB6Gi6TGgHDCA==
X-Received: by 10.98.31.216 with SMTP id l85mr15132333pfj.80.1522877293535;
	Wed, 04 Apr 2018 14:28:13 -0700 (PDT)
Received: from ?IPv6:2601:646:8880:466c:fde8:8784:7436:3e7a?
	([2601:646:8880:466c:fde8:8784:7436:3e7a])
	by smtp.gmail.com with ESMTPSA id
	c3sm12382281pfd.28.2018.04.04.14.28.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 14:28:12 -0700 (PDT)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180327154802.14611-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <39787e20-0d21-00bd-a5bb-73faa52c0839@gmail.com>
Date: Wed, 4 Apr 2018 14:28:11 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20180327154802.14611-1-ross.burton@intel.com>
Subject: Re: [PATCH][RFC] pseudo: intercept syscall() and return ENOTSUP for renameat2
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
X-List-Received-Date: Wed, 04 Apr 2018 21:28:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/27/18 8:48 AM, Ross Burton wrote:
> coreutils is now using renameat2() in mv(1) but as this syscall isn't in most
> glibc headers yet it falls back to directly calling syscall(), which pseudo
> doesn't intercept.  This results in permission problems as files mysteriously
> move without pseudo knowing.
> 
> This patch intercepts syscall() and returns ENOTSUP if renameat2() is being
> called.  Thanks to Andre McCurdy for the proof-of-concept that this patch is
> based on.

what is the performance impact of adding another stack frame and
function call in the chain here. Do we have data ?

> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/pseudo/files/renameat2.patch | 63 ++++++++++++++++++++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb         |  1 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta/recipes-devtools/pseudo/files/renameat2.patch
> 
> diff --git a/meta/recipes-devtools/pseudo/files/renameat2.patch b/meta/recipes-devtools/pseudo/files/renameat2.patch
> new file mode 100644
> index 00000000000..467b0b3e79f
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/renameat2.patch
> @@ -0,0 +1,63 @@
> +commit 3a4c536817dce4d0cbaa8f4efe30e722108357dd
> +Author: Ross Burton <ross.burton@intel.com>
> +Date:   Tue Mar 27 14:02:10 2018 +0100
> +
> +    HACK syscall
> +
> +diff --git a/ports/linux/guts/syscall.c b/ports/linux/guts/syscall.c
> +new file mode 100644
> +index 0000000..4ed38ed
> +--- /dev/null
> ++++ b/ports/linux/guts/syscall.c
> +@@ -0,0 +1,30 @@
> ++/*
> ++ * Copyright (c) 2018 Wind River Systems; see
> ++ * guts/COPYRIGHT for information.
> ++ *
> ++ * long syscall(long number, ...)
> ++ *	long rc = -1;
> ++ */
> ++	typedef long syscall_arg_t;
> ++	syscall_arg_t a,b,c,d,e,f;
> ++
> ++	//va_start (ap, number);
> ++	a = va_arg (ap, syscall_arg_t);
> ++	b = va_arg (ap, syscall_arg_t);
> ++	c = va_arg (ap, syscall_arg_t);
> ++	d = va_arg (ap, syscall_arg_t);
> ++	e = va_arg (ap, syscall_arg_t);
> ++	f = va_arg (ap, syscall_arg_t);
> ++	va_end (ap);
> ++
> ++	if ((number == SYS_renameat2)) {
> ++			errno = ENOTSUP;
> ++			rc = -1;
> ++	}
> ++	else {
> ++			rc = real_syscall (number, a, b, c, d, e, f);
> ++	}
> ++
> ++/*	return rc;
> ++ * }
> ++ */
> +diff --git a/ports/linux/wrapfuncs.in b/ports/linux/wrapfuncs.in
> +index fca5b50..137612c 100644
> +--- a/ports/linux/wrapfuncs.in
> ++++ b/ports/linux/wrapfuncs.in
> +@@ -54,3 +54,4 @@ int getpw(uid_t uid, char *buf);
> + int getpwent_r(struct passwd *pwbuf, char *buf, size_t buflen, struct passwd **pwbufp);
> + int getgrent_r(struct group *gbuf, char *buf, size_t buflen, struct group **gbufp);
> + int capset(cap_user_header_t hdrp, const cap_user_data_t datap); /* real_func=pseudo_capset */
> ++long syscall(long number, ...);
> +diff --git a/pseudo_wrappers.c b/pseudo_wrappers.c
> +index e05f73a..b7225d7 100644
> +--- a/pseudo_wrappers.c
> ++++ b/pseudo_wrappers.c
> +@@ -36,6 +36,7 @@
> + #include <sys/time.h>
> + #include <sys/wait.h>
> + #include <dlfcn.h>
> ++#include <sys/syscall.h>
> + 
> + /* include this to get PSEUDO_PORT_* definitions */
> + #include "pseudo.h"
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index 66da1cc53b8..44343c3bc57 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -6,6 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo \
>             file://fallback-group \
>             file://moreretries.patch \
>             file://toomanyfiles.patch \
> +           file://renameat2.patch \
>             "
>  
>  SRCREV = "d7c31a25e4b02af0c64e6be0b4b0a9ac4ffc9da2"
> 


