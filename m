Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEB5C4167B
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 18:33:32 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.142036.1672079602482406659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Dec 2022 10:33:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XT9Bqb4e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id y16so10591391wrm.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 10:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FEuvoPliBgA3PMH6o/LETSyecKpUVNqOcPLYi88rwmY=;
        b=XT9Bqb4ep/9tKcINqAW7HrT0eeGUFxlstnPomhwcg8QhdVqcgxY7FWzUG875MkM+TO
         y9033R3i8GDDybaGfRF34tswdhqGjzLDqhSTfKqUCVSYe2QHgvKCBq8vwUVYiZCqrPtn
         Lyt1u2g/Qi0/+mvzV6fayaZhmz0ztjt5oyj+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FEuvoPliBgA3PMH6o/LETSyecKpUVNqOcPLYi88rwmY=;
        b=XsKwhHLYGo0SRD+YQC5zCCvy2iu75/0Aa1Gcx4ZiUUqA0HhcrzgOgfEOvmWfEWfEXw
         sBBLpuxpPfJt3Jsc7dmXnXEpJ9yGJN97VPe/Mlgps+tWoxh2qI/gEpLoE9HUWnp46nB5
         G8B8jexK4G/Q4NZKJlKhA551O7NSz9ej7Qdy9NOFQIe+wbZOBQYvT1HYkubOGYqpM4IU
         i1Z5FFgOFuE1uDh0XRgNCyfAO6fA1Sda+7NpqUpPNWCDQknnuqynUXxzwatHdzK36ypy
         2TSZqYyqi16nXaAdZQu0xhoHk71MDIVcJ1lF+NoslL+0PiYYaDsm5xx3LqRNEhx51T90
         04iA==
X-Gm-Message-State: AFqh2kqEX9PqJgdd7n+aa2AU0UKzMUyGuuT0eD5nPEFXgLIyQmlsGPYv
	3n6UaVY3yksan69TUF+hDXc13Q==
X-Google-Smtp-Source: AMrXdXsBr0g8TJg9YE6EyJ4g47CmVnyvE7FRw3Arr/EG8PvMeK9NphHXnOzaPCxYQtUDl5Zif3bLDw==
X-Received: by 2002:a5d:5606:0:b0:242:5ae0:5b38 with SMTP id l6-20020a5d5606000000b002425ae05b38mr10293768wrv.8.1672079600689;
        Mon, 26 Dec 2022 10:33:20 -0800 (PST)
Received: from max.broadband ([90.253.2.200])
        by smtp.gmail.com with ESMTPSA id f8-20020a5d58e8000000b0022e57e66824sm12421520wrd.99.2022.12.26.10.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 10:33:20 -0800 (PST)
Message-ID: <d9a2558d888f94721deb2696a426773dced38c44.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v4 00/11] Add rust runtime tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, Randy MacLeod
	 <randy.macleod@windriver.com>
Date: Mon, 26 Dec 2022 18:33:19 +0000
In-Reply-To: <20221225215921.12868-1-alex.kiernan@gmail.com>
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 18:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175022

On Sun, 2022-12-25 at 21:59 +0000, Alex Kiernan wrote:
> This series adds runtime tests for rust and cargo, merges (most of) the
> include files into the base recipes and fixes target cargo builds.
>=20
> Also add SDK_TOOLCHAIN_LANGS for selection of target toolchains as part
> of packagegroup-core-sdk.
>=20
> Changes in v4:
> - Fixup `__stack_chk_fail_local` in musl-x86
> - Add crossbeam atomics fixes for ppc/mips
>=20
> Changes in v3:
> - Switch to packagegroup-core-sdk driven from TARGET_TOOLCHAIN_LANGS
>   (which defaults to SDK_TOOLCHAIN_LANGS)
>=20
> Changes in v2:
> - Drop rust.inc/rust.bb merge, not actually made use of in the change
>   set
> - Reorder so cargo test goes after build fixes
>=20
> Alex Kiernan (11):
>   rust-llvm: Merge .inc into .bb
>   rust-llvm: Update LLVM_VERSION to match embedded version
>   packagegroup-rust-sdk-target: Add Rust SDK target packagegroup
>   packagegroup-core-sdk: Add SDK toolchain language selection support
>   cargo: Merge .inc into .bb
>   cargo: Extend DEBUG_PREFIX_MAP to cover vendor
>   rust: Merge .inc into .bb
>   rust: Move musl-x86 fix for `__stack_chk_fail_local` to rust-source
>   cargo: Override crossbeam-utils with 0.8.14
>   packagegroup-rust-sdk-target: Add cargo
>   oeqa/runtime/rust: Add cargo test

Looks much better thanks. There was one remaining issue which showed up
in testing with a reproducibility issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2119/ste=
ps/12/logs/stdio

We did already have an open bug for a rust reproducibility issue and we
excluded it from the tests until we could get to the bottom of it, I
suspect cargo may have the same issue. It frustrates me a bit as it is
the one reproducibility exclusion for core.

Ideally we would fix it but excluding it from the tests and noting it
in the bug may be an option if it is the same issue. It may be simpler
to reproduce and fix the issue with cargo too.

Cc: Sundeep who as been looking at it.

Cheers,

Richard

