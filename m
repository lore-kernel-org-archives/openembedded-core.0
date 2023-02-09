Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6530C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 16:08:08 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.19769.1675958878527187221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 08:07:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cNkKIYl5;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1442977d77dso3131633fac.6
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 08:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NW13OtLuqBlemDlowlYhSb5PY3qS02Jd9TliT7nDfk0=;
        b=cNkKIYl5U7JjBJSh0ZjETGPLZ5SxnfkJqllXG7CjiWBZ+tjCDY//2LqqB3g29Btl4S
         DbdZm2kpXjgJU3ejakBusMD3eY7Vnmp9quONT7lDgfniFkz1UFSjVbIQUC/UxaV7HkJO
         IIjFfOwwzKflwsX0RHW3lc7ROIt0qq2DBejK3QWFp5mNn/Z1DiHBosbQmt14IT4CSZYt
         3uWonAcc6pKE97G0hmWSlFa+S4HlU2Rcl7yZjtTjnlDw3NYmtxPwjE3CDqCBI5uIBEmp
         NPDVUtQfe58iIlVF6EQianWzUkN58Fa2wcHSNvpDtnxrIzxflJDui3L0o0Mfzkd6XLEE
         qBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NW13OtLuqBlemDlowlYhSb5PY3qS02Jd9TliT7nDfk0=;
        b=Q68x1XXwcvTOENJYJxr92B+DOOdWtnDuekIuNQY6oOp4JX8eGNacwiSR5uPSwmXjTn
         pd0JIIekIDkcAd262JZtbUMpyuhagctfPtQcKycd0u5lzbYxuHUzpj5oDPyxGdsSuRlW
         lyJIzvV6DfE7xOpLo8U+7ZRCSCVXVuVYwYmJYc33YprUKQcassvy8895479gtce7qEu7
         Mm8N276BQ+nNujYSbTRh+MWhBAxgUOE0ymZmvHXfA6dyGCTjrEO+TrakHzSZXMlW4r+a
         0V07ZajDOGXjWyRurbded4EaQdHBBK6XzM9iEn5wf3q+Edt+gG7Sn0VlljvhwpTUpP9j
         ygXw==
X-Gm-Message-State: AO0yUKW6VwdRcbnIN+YtDzpAhR2IU+9XtUmoRgGbU366HoQS09sqgbek
	75UE2NIrQDRvYFdI162ot5yPZTrj2iBUz3IIc+ESsDcI8cs=
X-Google-Smtp-Source: AK7set+npyM9cKwokyWRbXfgCeQOFQeB8/mkHdAhJ/72RDG8YpGmNVqU2SGFygiALzP++4JYI3K+77XBcdZfTs6b+M4=
X-Received: by 2002:a05:6870:430a:b0:163:b85e:f1ca with SMTP id
 w10-20020a056870430a00b00163b85ef1camr1079588oah.262.1675958876118; Thu, 09
 Feb 2023 08:07:56 -0800 (PST)
MIME-Version: 1.0
References: <20230209100011.2101196-1-yi.zhao@windriver.com>
In-Reply-To: <20230209100011.2101196-1-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Feb 2023 08:07:30 -0800
Message-ID: <CAMKF1som+=wecO_M=rGC1nanpphpW1enU3Fr+22ppwL3wtZiig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: unify wordsize.h between arm and aarch64
To: Yi Zhao <yi.zhao@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 16:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176963

thanks for finding and fixing it. It has  happened with every upgrade
that this file goes out of sync due to copyright headers change.
its perhaps worth trying to use a symlink instead try this patch and
see if it works in your settings

https://uclibc.org/~kraj/0001-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch

if it does then we should use this instead of the original patch

On Thu, Feb 9, 2023 at 2:00 AM Yi Zhao <yi.zhao@eng.windriver.com> wrote:
>
> There is a redundant change in
> 0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch that
> causes wordsize.h to be different in arm and aarch64. This causes the
> build error when enable multilib:
>
> Error: Transaction test error:
>   file /usr/include/bits/wordsize.h conflicts between attempted installs of lib32-libc6-dev-2.37-r0.armv7vet2hf_vfp and libc6-dev-2.37-r0.cortexa57
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...y-the-header-between-arm-and-aarch64.patch | 20 ++++++-------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
> index 9ed89c93da..90a6cc2363 100644
> --- a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
> +++ b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
> @@ -11,10 +11,10 @@ Upstream-Status: Inappropriate [ OE-Specific ]
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - sysdeps/aarch64/bits/wordsize.h          |  8 ++++++--
> - sysdeps/{aarch64 => arm}/bits/wordsize.h | 10 +++++++---
> - 2 files changed, 13 insertions(+), 5 deletions(-)
> - copy sysdeps/{aarch64 => arm}/bits/wordsize.h (80%)
> + sysdeps/aarch64/bits/wordsize.h          | 8 ++++++--
> + sysdeps/{aarch64 => arm}/bits/wordsize.h | 8 ++++++--
> + 2 files changed, 12 insertions(+), 4 deletions(-)
> + copy sysdeps/{aarch64 => arm}/bits/wordsize.h (85%)
>
>  diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
>  index 04d4be9519..63876a7830 100644
> @@ -40,20 +40,12 @@ index 04d4be9519..63876a7830 100644
>
>   #define __WORDSIZE_TIME64_COMPAT32    0
>  diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
> -similarity index 80%
> +similarity index 85%
>  copy from sysdeps/aarch64/bits/wordsize.h
>  copy to sysdeps/arm/bits/wordsize.h
> -index 04d4be9519..5ef0ed21f3 100644
> +index 04d4be9519..63876a7830 100644
>  --- a/sysdeps/aarch64/bits/wordsize.h
>  +++ b/sysdeps/arm/bits/wordsize.h
> -@@ -1,6 +1,6 @@
> - /* Determine the wordsize from the preprocessor defines.
> -
> --   Copyright (C) 2016-2023 Free Software Foundation, Inc.
> -+   Copyright (C) 2016-2022 Free Software Foundation, Inc.
> -    This file is part of the GNU C Library.
> -
> -    The GNU C Library is free software; you can redistribute it and/or
>  @@ -17,12 +17,16 @@
>      License along with the GNU C Library; if not, see
>      <https://www.gnu.org/licenses/>.  */
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176937): https://lists.openembedded.org/g/openembedded-core/message/176937
> Mute This Topic: https://lists.openembedded.org/mt/96850115/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

