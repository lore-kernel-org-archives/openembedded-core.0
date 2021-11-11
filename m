Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF97C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 02:18:00 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.5235.1636597080072299052
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 18:18:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FMNciFjr;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id k2so1486710lji.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 18:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DdvYU6CiXm44hyrCt/dj9kRc6scJxvqF4oizQVmbgcw=;
        b=FMNciFjrsSSQghOQP/i9sNG0Y7N1sgQDhOUQLaX0xw1YcRkEb/S2WxhZvD0lypXyrl
         O2WQpNh4dt2XpPjulmv3k3kIphlOJinnfHGxJOaHbEys5b3iExzRjNfCXPTwgtXRcwGs
         g1pu46zenCPAEqZxXW6+lTObksrAb+b5rIdSwpK3lmJxdGzbPwAfzKHUI5aUfVerTt0A
         kKvVhmTiIjIOWU1ZG1VtpMTxhZ0iBuI7ZRoqgNls4F0HW/RQYDx9Vg/1VR0ysV0N3xI5
         5ABSKiB1TpIZtfff7c/9SVgxLU3dWuG+f8wev5MqurHlCKeyMEVjGgsa0aKFWqmrw3gN
         An2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DdvYU6CiXm44hyrCt/dj9kRc6scJxvqF4oizQVmbgcw=;
        b=rS+yqlovQUc2eHQ3WrmNGomKYFCucwbhNkjSXuzmRA1GGcHuwzqmKSgkUwD8HXjW9L
         RXSrvDbJ5MYDEzGqT5AxHORCCbAZqr/BAVwp2KFa154gM2so3bmLcnGZgy7pmiFHRyVC
         YW7lWx7tflpjH+WuZpZHGZZUjGhqvhom9t6p7TeYt8Q7s86tPu4Qpsc9KcOOw9i37SU2
         tAK12UTSb5gP5JIitu+VM2C9dOnqZZ+QU82NvYfKfUuoYH6japKaaHgJ1fVUVkxGjKFt
         s4rMt0aqhK+nucvZA46JTsvVy6i0aFisMIrt3nqyY9RevDNYpM/8zhak6snadTvUUQVs
         vXlA==
X-Gm-Message-State: AOAM531i63pJwNObfsqQsF0io5e2h+vXTzjozXqkA+vkn4L1Rg+jXfqx
	il376kJg5/JNJIZtDLsMV7jxiCI/1kqVyX+L6/o=
X-Google-Smtp-Source: 
 ABdhPJzyA9PCNtzO/ha00xdu1Xl1Yy2Pw2MbrO+UlYCP5hpytfoxMWvHvgqSnagHSi6dYxAvSIOuwFWsN1BqFa7YrWA=
X-Received: by 2002:a2e:9ec3:: with SMTP id h3mr3652877ljk.151.1636597078117;
 Wed, 10 Nov 2021 18:17:58 -0800 (PST)
MIME-Version: 1.0
References: <20211110231856.5799-1-pkj@axis.com>
 <20211110231856.5799-3-pkj@axis.com>
In-Reply-To: <20211110231856.5799-3-pkj@axis.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 10 Nov 2021 18:17:42 -0800
Message-ID: 
 <CAJ86T=Vn=2gi=8m2hskxWsStR91GJ_B3DNzMGnhfQnoS1bc9Ow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] gcc-common.inc: Clean up the additions to
 MIRRORS
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 02:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158127

On Wed, Nov 10, 2021 at 3:19 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> Since commit 044fb04d in bitbake (fetch2: Allow whitespace only mirror
> entries) there is no need to separate the entries in MIRRORS with "\n".
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-devtools/gcc/gcc-common.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
> index 74190644e6..0d950e780d 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -86,11 +86,11 @@ get_tune_parameters[vardepsexclude] = "AVAILTUNES TUNE_CCARGS OVERRIDES TUNE_FEA
>  DEBIANNAME:${MLPREFIX}libgcc = "libgcc1"
>
>  MIRRORS =+ "\
> -${GNU_MIRROR}/gcc    ftp://gcc.gnu.org/pub/gcc/releases/ \n \
> -${GNU_MIRROR}/gcc      ftp://gd.tuwien.ac.at/gnu/gcc/ \n \
> -${GNU_MIRROR}/gcc      http://mirrors.rcn.net/pub/sourceware/gcc/releases/ \n \
> -${GNU_MIRROR}/gcc   http://gcc.get-software.com/releases/ \n \
> -${GNU_MIRROR}/gcc      http://gcc.get-software.com/releases/ \n \
> +    ${GNU_MIRROR}/gcc ftp://gcc.gnu.org/pub/gcc/releases/ \
> +    ${GNU_MIRROR}/gcc ftp://gd.tuwien.ac.at/gnu/gcc/ \
> +    ${GNU_MIRROR}/gcc http://mirrors.rcn.net/pub/sourceware/gcc/releases/ \
> +    ${GNU_MIRROR}/gcc http://gcc.get-software.com/releases/ \
> +    ${GNU_MIRROR}/gcc http://gcc.get-software.com/releases/ \

Last two lines are duplicates. ftp mirrors should probably be replaced
with https.

Are these even useful at all? They were added in 2012...

>  "
>  #
>  # Set some default values
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158118): https://lists.openembedded.org/g/openembedded-core/message/158118
> Mute This Topic: https://lists.openembedded.org/mt/86970465/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

