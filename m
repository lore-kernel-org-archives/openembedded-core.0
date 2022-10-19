Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C941CC433FE
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 14:57:33 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web12.9123.1666191451858416364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 07:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aVge8jHq;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id f4-20020a9d0384000000b0066208c73094so564620otf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 07:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AlwV5IQiOV8zIzf3PUtfTzTWhguc5KAfySd8K24Qz30=;
        b=aVge8jHqZswgDOVlyiGcMI9FhKLIxO7Q+DAO3ndg4fHy6kCRX/eMAhati7j+o0O+4M
         TTTSRfb+A7lEsFtXjAw9ALTMB45DWhwSI8uqgSw2p87Y/APjhumrD3EQmiuNIHUd7wDd
         cXasnektuG3zS4xiu0cP0gNJi4NUe5LK5R2PJJexXwKsWtY5UQ0kl/65Kb8QI8Kvc6TI
         UZcTt6BURegJRPj03vrIXoFAIVJbLzwMtCeHOkCB9CcJLL5Zb/dNyXX26gBJ5+Z1JgXa
         SEEbZF8q8ktJiQtpFzx+G9vI2Fte5oRTnOdCzspnA5M7xe0Bp0ogUtUPa7jJYebcu3gt
         9dQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AlwV5IQiOV8zIzf3PUtfTzTWhguc5KAfySd8K24Qz30=;
        b=ySZ9CjrJDIHrLTYXrQHJbQwgulrVZcGwsO9JueJ5OQgSvedVxaU0PKQNph8Y7UDua2
         tYK1dLyVub8dy4tRvx3AdDIlS2cpvzyrMpKJGmRGu0pljjL5qPUS8Q3qUEz5fDOuJwWc
         g+qVEO8ifzgiScjEGBwB4hFjNr4ul78iynbMEre6USSDYenE4CwylIFq6g7Wr6pdCTc3
         goa//kmCyp/udNs7il57zVMtzO/CGVMClK2pvYSBPWPKgwLk8emL+OTXN8+Ok9QzwmNe
         8GvsIUND2uXySNnNIIPxcdAyOLHL2o8dpB/1Jb6E6cN137yetMLlZCI1npOrQvt/OfiD
         +44w==
X-Gm-Message-State: ACrzQf3WCygihHnPKcN2GfSHRhzjv1mzLjkU149tFtRl8y9oke2TZpoU
	fYQaBikgisyk1vS5UV/dtGCfzksBcT1fQQwRgTI=
X-Google-Smtp-Source: AMsMyM4OeNduaCN3e8aKZCpj/Cc36Mou/wNU13w20sMA7pkq3zX2Cv15KHwMXceqgMJtHYQLqTwgHqRl++THCojtePw=
X-Received: by 2002:a9d:74c6:0:b0:661:c309:f0cf with SMTP id
 a6-20020a9d74c6000000b00661c309f0cfmr4032041otl.55.1666191450995; Wed, 19 Oct
 2022 07:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221019105739.2279010-1-nobuta.keiya@fujitsu.com> <20221019105739.2279010-3-nobuta.keiya@fujitsu.com>
In-Reply-To: <20221019105739.2279010-3-nobuta.keiya@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Oct 2022 07:57:05 -0700
Message-ID: <CAMKF1soYYhC7mMFB6EnTnz-SXL6PO8SOyqxzz8NxMgksds3f8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] gnutls: Unified pakcage names to lower-case
To: Keiya Nobuta <nobuta.keiya@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 14:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171968

On Wed, Oct 19, 2022 at 4:08 AM Keiya Nobuta <nobuta.keiya@fujitsu.com> wrote:
>
> create-spdx can't detect the license properly if the case doesn't
> match, so fix it.

I wonder if this could be some sort of QA warning that can flags such
issues, I do see this
might be a common error to make.

>
> Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>
> ---
>  meta/recipes-support/gnutls/gnutls_3.7.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/gnutls/gnutls_3.7.7.bb b/meta/recipes-support/gnutls/gnutls_3.7.7.bb
> index 01fd4dba3d..c7d782e4eb 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.7.7.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.7.7.bb
> @@ -8,7 +8,7 @@ LICENSE = "GPL-3.0-or-later & LGPL-2.1-or-later"
>  LICENSE:${PN} = "LGPL-2.1-or-later"
>  LICENSE:${PN}-xx = "LGPL-2.1-or-later"
>  LICENSE:${PN}-bin = "GPL-3.0-or-later"
> -LICENSE:${PN}-OpenSSL = "GPL-3.0-or-later"
> +LICENSE:${PN}-openssl = "GPL-3.0-or-later"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
>                      file://doc/COPYING;md5=c678957b0c8e964aa6c70fd77641a71e \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171966): https://lists.openembedded.org/g/openembedded-core/message/171966
> Mute This Topic: https://lists.openembedded.org/mt/94428130/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

