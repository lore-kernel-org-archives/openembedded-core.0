Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033B7C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 12:42:43 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.6918.1665664958234718475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 05:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SRYUR5zI;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id n73so1175871iod.13
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 05:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oQTywq9q0CgMjh3PPnYn21OfeDnw5uMF0ZLeZw31cqA=;
        b=SRYUR5zIaQyT8r0QxeO12Y7kXvbgQHPvwzk4wFfzsnk2O0jaeHggAlQpHSlqduQJou
         Z0gQpSVzNk5ywLqGsZ6s2XSM1oqcW71J2chAMJoP+hx99bWkxRu6bcP9ONVGP6Iiz49x
         nHtdyhXV3yxoy+YkP4yHUlme7MXs38Nysxs4UpZkESHBPaeUpW28GTioOphAY5Ikf0wE
         jGafrWbz+XJgMh7zbhjbD4EyPYRQHskUv/BUvwuqwoKSwo8esaHHQJ5OUgUSB9v8oJsC
         jX12KpYZR5s1dkJi6m+4HVv+4Psg/5NSRLA8zFsvt2YYBZ+QLU4bIb+0dnMNBB+C6NVC
         wLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQTywq9q0CgMjh3PPnYn21OfeDnw5uMF0ZLeZw31cqA=;
        b=LjfS5Q3vEfuFnGaNoVRnY7OMXX14yVUuORpsWCe87D3tcwH7zsZKee+2khReqlxg+E
         mdQALlnaGCeSdn4aFrYb5+MyHE+uoSE/D1FRSIb2mX0gYsATsk/OZxzvpeapacmv5PUo
         MWDF97gvwQDnUGphs6UhLuWX5+95sm28qIScoLCHBaPJMyboq9tNRN0kdYsMriaM9a6O
         d6iJh+TmeBxwCBYhimjXQcGCNvhAubSjwlgbSo33JrvP1zKEwjKr6AXUtTxAV6L+vvNN
         kwTW/pxG4CEcaBRMRH/6xvlEP0RqjG16E6CitZpjg/PNvXvoIc263lX4e/US4SV9KXgf
         RZRA==
X-Gm-Message-State: ACrzQf3/uRp5/FT8ub/qi42JB82Xr4f2JGuUWpkfP08M0EvzqNN/+D4c
	vdqRiBysjoxwTEDXhzu4DpzSPT4r6FJnIHnwN9o=
X-Google-Smtp-Source: AMsMyM4GC4wEbDhbBonR/9i2lKv315fkNiDS+pKUUj8AfuonHS/kr4Fbvz8X+vhIjxrpMjHA0cPc9MmabbmFpT64SeA=
X-Received: by 2002:a6b:4a0d:0:b0:6a3:1dea:9feb with SMTP id
 w13-20020a6b4a0d000000b006a31dea9febmr16382446iob.102.1665664957552; Thu, 13
 Oct 2022 05:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221012071714.751-1-alex.kiernan@gmail.com> <Y0fIxWwQGhsEpgs/@mail.local>
In-Reply-To: <Y0fIxWwQGhsEpgs/@mail.local>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 13 Oct 2022 13:42:26 +0100
Message-ID: <CAO5Uq5RQCfvMBZkv3Uzkt5czmS9N=auMMUoPmt-9FzHA5b_B8A@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] rust: update 1.63.0 -> 1.64.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 12:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171702

On Thu, Oct 13, 2022 at 9:13 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> On 12/10/2022 08:17:14+0100, Alex Kiernan wrote:
> > Release notes:
> >   https://blog.rust-lang.org/2022/09/22/Rust-1.64.0.html
> >
>
> This causes the following failure:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/5901/steps/12/logs/stdio
>
> ERROR: rust-1.64.0-r0 do_patch: Applying patch 'crossbeam_atomic.patch' on target directory '/home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/rust/1.64.0-r0/rustc-1.64.0-src'
> CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-64-poky-linux/rust/1.64.0-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch crossbeam_atomic.patch
> patching file vendor/crossbeam-utils/build.rs
> patching file vendor/crossbeam-utils/.cargo-checksum.json
> Hunk #1 FAILED at 1.
> 1 out of 1 hunk FAILED -- rejects in file vendor/crossbeam-utils/.cargo-checksum.json
> Patch crossbeam_atomic.patch does not apply (enforce with -f)
>

How odd... I was half expecting that to need rework and was surprised
when I tested it locally that it didn't! Clearly I've missed
something...

-- 
Alex Kiernan

