Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A7EC433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 15:31:10 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web11.3123.1637249469541646270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 07:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c1SuQIo/;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id i6so14515068uae.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 07:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3EeS22u4kT2ifaWeduoCsFs7v6suEAncdV8jFvTGkEA=;
        b=c1SuQIo/y4ZoNJeoNcj9hUyJWwS0qUg50gODb+ZgHQ/avwbieNXq0UkSAlNRq3qTyZ
         6IG+hKD3innOZs4ocPGJSkcfhOKQ4C1pWIx6PGngaLIS0N2AHxGRqi4fIHpNxRKyDPZO
         RvMCKqvSkAbefFLZLfeR6GD48XPr1MIfZLANwIFfjt/EROZPC9Sz5sRQ1N0RXjXi8MhO
         OtSLSzdAqSl3rMyQCcCdqXQap5nuC74TFp7c/EjMxybSleLdET0zUEaHwj+npsjZavtS
         iN5IoCnculkvYN9TMMA5+U+jXAIXKxK9XKxB/5p4QR/P6dlr4KRIRqoG6TiGLxsFap6y
         E8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3EeS22u4kT2ifaWeduoCsFs7v6suEAncdV8jFvTGkEA=;
        b=hky0XAlhjKNSBsafmQWrfOkC1/Q+i9TJSsZ0nZ91z49byK4dZkeOJcw78v8A0HgTbe
         QiLtGXtKi0PmwzLQs7BHWh3bDddipLF8GQDAa8zTT/it/64RBFycbDcTjSEwTindSYXh
         sH206g9L6ddA+sYlFHshZ3j/qs8r9DyATiJLZUG3hhFfGJ6c+/vsGSCRCUQ4U3AfBBJV
         LqI/YPmMotSjWcTRS05pWGUqTKc3H6c+htX5PHm/B/+duM6m/71RXw1pBPbXP+ISr8S3
         fzLE/3nKWoroYE9LbwJakEh8xRsCDX7bOIMcr63PypWxHjEtfnGXyIpDDsnE4urHKTs8
         k9sA==
X-Gm-Message-State: AOAM532M1ygUjU8r3Mv4eyPjEIfwdiER03sEOaD8w0gCirNBnq2TuX+c
	m9fqGmgV0nkxz+5tm9BechvhBQrBTn4mbnnQ9ShV/o5u/PM=
X-Google-Smtp-Source: 
 ABdhPJx6IX9XFibjGReyO9wGcD87ktp+tZxIN/OP/Ae7wzJO7a+jLgSLe6hFIiIK3MYqnQwRpPpNI7ZlpMi1OAYAqIE=
X-Received: by 2002:ab0:812:: with SMTP id a18mr37431590uaf.33.1637249468409;
 Thu, 18 Nov 2021 07:31:08 -0800 (PST)
MIME-Version: 1.0
References: <20211115140340.8047-1-pgowda.cve@gmail.com>
In-Reply-To: <20211115140340.8047-1-pgowda.cve@gmail.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Thu, 18 Nov 2021 21:00:59 +0530
Message-ID: 
 <CALY4987g508BzDM2fmYvoTpNH7KAKJkycF4OUABhtUjMLmZbxg@mail.gmail.com>
Subject: Re: [hardknott][PATCH v2] rust-cross: Replace TARGET_ARCH with
 TUNE_PKGARCH
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <rwmacleod@gmail.com>,
	umesh.kalappa0@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 15:31:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158478

Hi,

Gentle ping on this patch.

Thanks,
pgowda

On Mon, Nov 15, 2021 at 7:33 PM Pgowda <pgowda.cve@gmail.com> wrote:
>
> rust-cross-* imported from meta-rust has incorrect signatures,
> depending on MACHINEOVERRIDES making it effectively MACHINE_ARCH
> as shown by sstate-diff-machines.sh:
>
> openembedded-core/scripts/sstate-diff-machines.sh --tmpdir=tmp-glibc \
> --machines="qemuarm64 qemuarm64copy" --targets=rust-cross-aarch64-glibc \
> --analyze
>
>  === Comparing signatures for task do_configure.sigdata between
>  qemuarm64 and qemuarm64copy ===
> ERROR: gcc-runtime different signature for task do_configure.sigdata
> between qemuarm64 and qemuarm64copy
> NOTE: Starting bitbake server...
> Hash for dependent task gcc/gcc-runtime_11.2.bb:do_prepare_recipe_sysroot
> changed from
> da4ebf1b272cb73153145a0a95e6438d2955ae2d36f84db10f6880b2781ec331 to
> 47a0ebb7a88c9f896fb9dbce269f575ab8a6faabb2b9e62d164be6e71c5e4e40
> Unable to find matching sigdata for
> openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:
> do_prepare_recipe_sysroot with hashes
> da4ebf1b272cb73153145a0a95e6438d2955ae2d36f84db10f6880b2781ec331 or
> 47a0ebb7a88c9f896fb9dbce269f575ab8a6faabb2b9e62d164be6e71c5e4e40
>
> The following patch takes TUNE_PKGARCH into consideration instead
> of TARGET_ARCH and results in signatures as expected.
>
> [YOCTO #14613]
>
> Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust-cross.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
> index bb625f4240..a77f7d5122 100644
> --- a/meta/recipes-devtools/rust/rust-cross.inc
> +++ b/meta/recipes-devtools/rust/rust-cross.inc
> @@ -34,7 +34,7 @@ DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs vir
>  DEPENDS += "rust-native"
>
>  PROVIDES = "virtual/${TARGET_PREFIX}rust"
> -PN = "rust-cross-${TARGET_ARCH}-${TCLIBC}"
> +PN = "rust-cross-${TUNE_PKGARCH}-${TCLIBC}"
>
>  # In the cross compilation case, rustc doesn't seem to get the rpath quite
>  # right. It manages to include '../../lib/${TARGET_PREFIX}', but doesn't
> --
> 2.31.1
>

