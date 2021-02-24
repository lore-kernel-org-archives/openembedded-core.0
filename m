Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.1967.1614200298250258448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 12:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PBYuScrs;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id l25so2560153qtr.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 12:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F7CbOIJYsI2QIJuFIqIqF/TASRGZ+udsV1Zzryazbh0=;
        b=PBYuScrsK0zFf1GlJVGm6nqGMYiztiWG8XxKoPJiz4WjFjbAd5kkwHyRJucYMdaaWA
         fp4EimokpsN3RVPstAkH2LPC86blVadRF8GYzEYNTQKOJKIIW+vOrK7/Me2UDPYfytt4
         Xcv5QqdCYFJnz9SI3lWn3TeHGcvUG6/2txyYtUs5e5xk8z3rIO3b6bj6Fhnm0uaHh1dH
         gP0yFUGhE22EEU5xGRjxp8OR6bi+2bJC2D80tzwM19Zj/bUnU7NJNGmyD5Ha6Qp0WNoT
         AU986ue0Y8Uz8QFYVtZpKuGfEV3qUhKQnfM5Y3MOc16gusP+VoF0faMBK5sTk/QuDhok
         4F+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F7CbOIJYsI2QIJuFIqIqF/TASRGZ+udsV1Zzryazbh0=;
        b=uQ+RZfj45FxsPXkv6sZ+pm5/MU5mZgxPbKJG4aiAsB4pXTqWY6KzDQh9TcEHdrThgC
         VPTjfA+A3JUo8TccsocY1QwDwtxzI0bdSKf+kOYvXpXcg6Q6DASUQg6ub0zu9Ge6cr7H
         wGwEI45q2wuUEwDtY40pY1P44NWaQQZ1ppb8Rb3jHFsA57hg1PyBVqktkkxxeNF79+Ky
         /ICYdKHuBGBjrkK2i0ZI0frjRlqCXcG+j+Yk8QzjON3BD2KquacMz2UOoG/unWQcz2SW
         ob8V82PxRgwtFsszMLRBGggraSJqyKFoIsgvpwo+SZ6lpz3+o5Km/fyzFTImD+Is3L9F
         jHgg==
X-Gm-Message-State: AOAM533F/nvmqZp6QxzM/ijuNShRgXQi6zLAfQz7u9wzAd1lDkVzEtka
	a8LPQDH0bAeEQSs6WIdECxkeFSbKRylrZgHKhbI=
X-Google-Smtp-Source: ABdhPJx8iT04cARTwkKQbsX4R4MalNNUCdJdKaLpJ/79johuUDrPmyRrMcMbm92SzCRMxCHs1KQFpesg2pcGhJkL9G0=
X-Received: by 2002:ac8:7210:: with SMTP id a16mr31380669qtp.82.1614200297172;
 Wed, 24 Feb 2021 12:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20210224204523.32267-1-yifan.yu@windriver.com>
In-Reply-To: <20210224204523.32267-1-yifan.yu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 24 Feb 2021 12:57:51 -0800
Message-ID: <CAMKF1sovfyOAa9+qS9Du=ckDWCV1+kGhxRaFc9ckhizbp8evOQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gdb: Remove "ALLOW_EMPTY_gdbserver" on riscv
To: Yi Fan Yu <yifan.yu@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

yes in gdb 10+ this is available.

On Wed, Feb 24, 2021 at 12:45 PM Yi Fan Yu <yifan.yu@windriver.com> wrote:
>
> Revert 21e748d620022a75c0c2d0ab4a763a5992e8f154 "riscv32"
> Revert 111f65528e3c0b147c1713cfc684958f94c41cd6 "riscv64"
>
> Reason:
>
> The following commit present in binutils-2_35
>
> commit bf84f7066626c78884436e1c39fb60f04c665f21
> Author: Maciej W. Rozycki <macro@wdc.com>
> Date:   Wed Feb 19 01:24:37 2020 +0000
>
>     gdbserver: Add RISC-V/Linux support
>
> Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> ---
>  meta/recipes-devtools/gdb/gdb.inc | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
> index 249e24dc52..aa845b5c49 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -9,6 +9,3 @@ inherit gettext
>  PACKAGES =+ "gdbserver"
>  FILES_gdbserver = "${bindir}/gdbserver"
>
> -ALLOW_EMPTY_gdbserver_riscv64 = "1"
> -ALLOW_EMPTY_gdbserver_riscv32 = "1"
> -
> --
> 2.29.2
>
>
> 
>
