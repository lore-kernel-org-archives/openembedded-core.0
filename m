Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B14FC64ED8
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:52:39 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.14929.1677235951288460266
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 02:52:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W4IsIvqL;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id s22so17289863lfi.9
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677235949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sA1R5DRcde7IEqtmdWWAdsn4AREFrb8kTZIR1POs6Ho=;
        b=W4IsIvqLFSDy7LaojCcVCvkKBJoq2CTKk8q3BsVvmBD8C/U//v1o+XhA4kk5ytfgGt
         /e8tQhM4ii+46VFpqaiCozlKCCGjxDzje1PYgwQ4gYcj0IITYxhwqSrHogbNCMci2BdY
         YRy2QZKop/k5bQlTh4qiA6Za0/MyJluQjsk3O7EbLrrFxP/1MNy43a8uhFuMjrJmWznC
         vUTwrAmDb4x+MP9j5YiHV14HyY8rWxtaUMYRge3/v6yVjytnJckIAyIoUkGDW3101bG8
         XQ/P+uJH5DnOXwuWWLXYBt+P3ric72G3YhUMHH2jHP+ViCpiJ20p9ZVSuStL6/VFVnFE
         U/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677235949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sA1R5DRcde7IEqtmdWWAdsn4AREFrb8kTZIR1POs6Ho=;
        b=iP0teKQ4XgEeOmdcz47mpxTIqZ/kATXJtAl4zzMYXnFlFz8m/NduBNgccIxRNq5GOf
         JfdO86KeVer0SWKIitAvW83sS7p3FxrLs3noP6vsTOJ4K2jJYXHpo74fZ4gdgwuWjzio
         8BchrITQzZ+aGHQf/ejFn4ki6IRXH9jAOUzxPwQa/l7ohrKAKqn9RspDiF8Qk/jXMBHa
         cN3dA9H6cNoUZhV3qGrKkvSpMiT5XJ4Yxqvndf6fFRbfqXU2pf4fX/J1938okb74W/bU
         6Jh403vkfemXy17XGaYSGtxs4XGwyG7R8OoCwBQf5wYTE46MWqaRW67oJ8dFobp1UMm+
         ToWg==
X-Gm-Message-State: AO0yUKWGn/Jv4jXq3Rm/pFkYn7MsEKsWobu/EJcgQz5k7QThc6+elPhM
	kAPKrxqeB8id7J1j93af9IAEazf9rT/fLmptcDc=
X-Google-Smtp-Source: AK7set+APEydCa6/3FDamYC9ddhoGGcUTi0cFA9unspzAnExGJ6QO0WqmE3MI7OTTm5iSI5FiKfhvBJIoDdcc3r4te4=
X-Received: by 2002:ac2:5689:0:b0:4d5:ca42:aeed with SMTP id
 9-20020ac25689000000b004d5ca42aeedmr4768371lfr.13.1677235949048; Fri, 24 Feb
 2023 02:52:29 -0800 (PST)
MIME-Version: 1.0
References: <20230224093850.3393567-1-zboszor@gmail.com> <20230224093850.3393567-4-zboszor@gmail.com>
 <3EE6D20C-8A7C-4772-BF56-E1CD25B12B6B@arm.com> <1746BAA6D62E4C0A.18951@lists.openembedded.org>
 <0dd9eb47-521e-7840-9196-f485f080b44c@gmail.com>
In-Reply-To: <0dd9eb47-521e-7840-9196-f485f080b44c@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Feb 2023 11:52:17 +0100
Message-ID: <CANNYZj8uDd_O2dOhs-+zRkwDjSOD_8Ezcdtd1WjV4dxk9wRa-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] mesa: Add PACKAGECONFIG "rusticl"
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 10:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177678

On Fri, 24 Feb 2023 at 11:34, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
> Problem is, now the configure stage fails with:
>
> | ../mesa-23.0.0/meson.build:964: WARNING: add_languages is missing native:, assuming
> languages are wanted for both host and build.
> | Compiler for language rust for the build machine not found.
> |
> | ../mesa-23.0.0/meson.build:964:2: ERROR: Rust compiler rustc -C
> linker=x86_64-oe-linux-gcc -C link-arg=-m64 -C link-arg=-march=nehalem -C
> link-arg=-mtune=generic -C link-arg=-mfpmath=sse -C link-arg=-msse4.2 -C
> link-arg=-fstack-protector-strong -C link-arg=-O2 -C link-arg=-D_FORTIFY_SOURCE=2 -C
> link-arg=-Wformat -C link-arg=-Wformat-security -C link-arg=-Werror=format-security -C
> link-arg=--sysroot=/data2/dtd-yocto-4.0/tmp-sicom-glibc/work/corei7-64-oe-linux/mesa/2_23.0.0-r0/recipe-sysroot
> can not compile programs.
> |
> | error: Error loading target specification: Could not find specification for target
> "x86_64-linux". Run `rustc --print target-list` for a list of built-in targets
>
> I also tried it with moving the conditionally set rust
> between or before the already inherited classes.
>
> It succeeds when inherit rust is not conditional.

It also succeeds when there is no inherit rust at all, in the current
master branch recipe.

If inherit rust is conditional, and condition is false, then there is
some other change that triggers the failure, and that change should be
conditional as well.

Alex

