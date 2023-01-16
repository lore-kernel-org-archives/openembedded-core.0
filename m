Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C992CC54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 09:33:36 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.162760.1673861616322776284
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 01:33:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ccmbiPdh;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id q130so378615iod.4
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 01:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=46krs5qZ9xgJWh0QddX7i3OjtXK3cVFQ64PB2he553Y=;
        b=ccmbiPdhFxSvzVLsHzgpVzLd1waDWuqrIKnchWt0D3sg2CamnJIKQ8SiNM+7Zkgudo
         qQ5dqD8EZzLIq8aFvNlZq0G6/RnvcwTs8aWNRn+klh/DJYKeIc8vz+ZG/sfUDzmz9al5
         bAVxyYcu2L6pyE3iqaGgyqMGI/6lenDdPVh9jI+O6SiJB/sNBfxlB6Y+ma5Z7xgsbc+k
         82k71baiqgVmXH9OwABzTAxv6qe9ntt4TV1nPYfwxAPMTpn8Tn40jgE0aWXOY8mSOmg9
         kFgJ/dgiRXSipyPFQPY2VHCp8yxdUEw0nIzoKKEDfH7HdXouDwXPzavUbhIe7CCC5trh
         M3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46krs5qZ9xgJWh0QddX7i3OjtXK3cVFQ64PB2he553Y=;
        b=DDzgIqsLG7M4rNBTzZ5YdQQFST4ynQafgWtvfT2/mXTmqASklfnWA28IxPb6m+bBJW
         FjZl7zx6Rz1hndpnVOO9cSfKRKRMAF3uox5pDhekTK/2parO0HGmczQaGMZN8HktJpsE
         LM6NygONMT3BgLuf7uUltqhv7HyGlNmCLgfEpw6dd9KrfOQG1hf4Jtuiirkuo9L59sBr
         X4Cl/J2hAaJ1ECMyLaT5kgyQP51u/asb+LP5JqusbDukI+Q5pO5mUsYxQ78Qvsg0C175
         1ZJjHfq1dFc26cHuPig7WMvq697fX90hhzr3tp36BUy6yxI261Su7T6nuDewdD1QixTv
         g0hA==
X-Gm-Message-State: AFqh2kpq6CjqeZ54XnDGvHznSBGzcM77uNh6QwjNiXp6/7fmHpp/EvX6
	D+I34DjOBB7F6eXWoP5mTsySwyxGusMo8v+LpbMXQ+H43cw=
X-Google-Smtp-Source: AMrXdXtqHjW+NU3eI80QoEe0WS+JnyeMV1HmUInoUWRDvEGV4hgvldwutCPvIqz4Ok2HBB0T9RSa4dqp/Wx4diy/gUE=
X-Received: by 2002:a5d:8043:0:b0:6e0:19a2:fa1 with SMTP id
 b3-20020a5d8043000000b006e019a20fa1mr6492641ior.112.1673861614133; Mon, 16
 Jan 2023 01:33:34 -0800 (PST)
MIME-Version: 1.0
References: <20230107094839.26387-1-alex.kiernan@gmail.com> <6921.1673852415201846579@lists.openembedded.org>
In-Reply-To: <6921.1673852415201846579@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 16 Jan 2023 09:33:23 +0000
Message-ID: <CAO5Uq5StMcTxU9PvxDFNDW+s4Z8vAFbMaZyV8t2+8OakP_1ewA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust: Merge all rustc-source patches into rust-source.inc
To: "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 09:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175967

I guess we need to add a target RDEPENDS on gcc as its using that as
the linker (possibly interesting upstream commentary
https://github.com/rust-lang/rust/issues/71515). I'm just wondering
what happens if you have TOOLCHAIN = "clang"?

On Mon, Jan 16, 2023 at 7:00 AM Kokkonda, Sundeep
<sundeep.kokkonda@windriver.com> wrote:
>
> Hello Alex,
>
> This patch fixed the https://bugzilla.yoctoproject.org/show_bug.cgi?id=14975 ('bitbake core-image-full-cmdline' built without any issues.)
>
> But, I tried a 'hello world' program in booted image (bitbake core-image-minimal by adding 'cargo' to IMAGE_INSTALL:append) and getting below error.
>
> root@qemux86-64:~/# cargo new hello
> root@qemux86-64:~/# cd hello
> root@qemux86-64:~/hello# cargo run
>    Compiling hello v0.1.0 (/home/root/hello)
> error: linker `x86_64-poky-linux-gcc` not found
>   |
>   = note: No such file or directory (os error 2)
>
> error: could not compile `hello` due to previous error
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175960): https://lists.openembedded.org/g/openembedded-core/message/175960
> Mute This Topic: https://lists.openembedded.org/mt/96110740/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kiernan@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
Alex Kiernan

