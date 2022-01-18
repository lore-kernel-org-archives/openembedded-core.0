Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFA7C433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 18:55:11 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.1297.1642532110239444933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 10:55:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=apbRLTdr;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id y17so23176458qtx.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 10:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0ml8xN7hMmQvb9b/gJ9tR25L9xxKrAYLIFT+n6ZAaS4=;
        b=apbRLTdrgPm5rMZxh1CygK0kGt+HI+PQdLqlPNTphqxD99p6fGfvSlfTvNz5tBQrtZ
         OA9VfqaTjWVamr9Mhmo/eg20tQHkY8ReN/XQsdjaZk6hpaGsz2pqj9kO8fBRppSPaZ5s
         vXcEhdmmvW++pajtWcTbSMNchOxn69/9G/XBMWZtANGkyytSlJKCsjE/AnnWulubvrhH
         GSMvmezznDKH2hNd41q70wduNcItjidfJEBlVa/7Q7z7rhfNN1KLuhgCUbHrqbW12qcj
         U/UYtAZVOYe4C7/WgwRiFFTNBLuWotuuToavzA0TgCx7Nhj1C4i9KdSn0utmmYtRu3FE
         prtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ml8xN7hMmQvb9b/gJ9tR25L9xxKrAYLIFT+n6ZAaS4=;
        b=tQCAicQZVSTANaHYscb2UO8FYQx9x08cSBFgQhE426kDe+mD+giYne/nrCXDiy+Rv2
         qhtWLJSrAoNhODpWbTEHwQnmz6pCdP9pxIea0zLnQzwU3TiwnTarDFz1h4Ty0hhbsIPF
         T3wF0vDgC1Up5iuTVQcEH5OS5a0SsqHhwWjR8tTY38QpttCjudJMKVazXvCl18/qY1lV
         sVrRMVwoGNJBBMK1SpdylFgMDaSAz0hpQ3trqb9OouoR9tOBOGlfKFy0Z8giC1M7OW59
         vuPIgUQibf7lNt9xQJAUoEbY5KiSbml8RFrA6aHqVFFktNMvnAx2r8Y/fsnull0it8ew
         fQfg==
X-Gm-Message-State: AOAM532LUGSNcFdaHj0xwCcuNHWhKj1JF7Akc2FiyQAk94HWS9Smut+F
	K6Cn+UQjwwPQ8CJXjOlwAIa0baCw4gTfI8kQsDA=
X-Google-Smtp-Source: 
 ABdhPJwcd/P0wiLkhIuX7aXDZrICQsgdazBpWJFcMi9ker1zG9HQQomIeY6H67ehDsrgfCFiIbcoLW2qudGWLC5+xg4=
X-Received: by 2002:a05:622a:144f:: with SMTP id
 v15mr7164958qtx.634.1642532109164;
 Tue, 18 Jan 2022 10:55:09 -0800 (PST)
MIME-Version: 1.0
References: <20220118013139.62641-1-changhyeok.bae@gmail.com>
In-Reply-To: <20220118013139.62641-1-changhyeok.bae@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jan 2022 10:54:43 -0800
Message-ID: 
 <CAMKF1srwct2MrLnRnL=vfUJDpZ_wjsGKWpWjX_V0G+UpTbTWoA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] iproute2: update 5.15.0 to 5.16.0
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jan 2022 18:55:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160677

On Mon, Jan 17, 2022 at 5:31 PM Changhyeok Bae <changhyeok.bae@gmail.com> wrote:
>
> 0001-lib-fix-ax25.h-include-for-musl.patch is the fix for musl and comes
> from upstream.
>
> Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
> ---
>  ...0001-lib-fix-ax25.h-include-for-musl.patch | 37 +++++++++++++++++++
>  ...{iproute2_5.15.0.bb => iproute2_5.16.0.bb} |  3 +-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch
>  rename meta/recipes-connectivity/iproute2/{iproute2_5.15.0.bb => iproute2_5.16.0.bb} (64%)
>
> diff --git a/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch b/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch
> new file mode 100644
> index 0000000000..338def399e
> --- /dev/null
> +++ b/meta/recipes-connectivity/iproute2/iproute2/0001-lib-fix-ax25.h-include-for-musl.patch
> @@ -0,0 +1,37 @@
> +From 8bced38a941a181f1468fa39541e872e51b6022f Mon Sep 17 00:00:00 2001
> +From: Sam James <sam@gentoo.org>
> +Date: Thu, 13 Jan 2022 08:14:13 +0000
> +Subject: [PATCH] lib: fix ax25.h include for musl
> +
> +ax25.h isn't guaranteed to be avilable in netax25/*;
> +it's dependent on our choice of libc (it's not available
> +on musl at least) [0].
> +
> +Let's use the version from linux-headers.
> +
> +[0] https://sourceware.org/glibc/wiki/Synchronizing_Headers
> +Bug: https://bugs.gentoo.org/831102
> +
> +Signed-off-by: Sam James <sam@gentoo.org>
> +Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
> +
> +Upstream-Status: Backport

please mention https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=8bced38a941a181f1468fa39541e872e51b6022f
here to point to backport link from upstream

> +---
> + lib/ax25_ntop.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/ax25_ntop.c b/lib/ax25_ntop.c
> +index cfd0e04b..3a72a43e 100644
> +--- a/lib/ax25_ntop.c
> ++++ b/lib/ax25_ntop.c
> +@@ -2,7 +2,7 @@
> +
> + #include <errno.h>
> + #include <sys/socket.h>
> +-#include <netax25/ax25.h>
> ++#include <linux/ax25.h>
> +
> + #include "utils.h"
> +
> +--
> +2.32.0 (Apple Git-132)
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_5.15.0.bb b/meta/recipes-connectivity/iproute2/iproute2_5.16.0.bb
> similarity index 64%
> rename from meta/recipes-connectivity/iproute2/iproute2_5.15.0.bb
> rename to meta/recipes-connectivity/iproute2/iproute2_5.16.0.bb
> index 99a743391a..871f8d8fb7 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_5.15.0.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_5.16.0.bb
> @@ -2,9 +2,10 @@ require iproute2.inc
>
>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BP}.tar.xz \
>             file://0001-libc-compat.h-add-musl-workaround.patch \
> +           file://0001-lib-fix-ax25.h-include-for-musl.patch \
>             "
>
> -SRC_URI[sha256sum] = "38e3e4a5f9a7f5575c015027a10df097c149111eeb739993128e5b2b35b291ff"
> +SRC_URI[sha256sum] = "c064b66f6b001c2a35aa5224b5b1ac8aa4bee104d7dce30d6f10a84cb8b01e2f"
>
>  # CFLAGS are computed in Makefile and reference CCOPTS
>  #
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160668): https://lists.openembedded.org/g/openembedded-core/message/160668
> Mute This Topic: https://lists.openembedded.org/mt/88500407/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

