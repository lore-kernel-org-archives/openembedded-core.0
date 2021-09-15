Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.5572.1631701160025086523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 03:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NrdNqujC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id u18so1276229wrg.5
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 03:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=q8HTvQs7fvXol2l1T9P+QQQ9fKkd5m5EaKXQ0/HpyDg=;
        b=NrdNqujCV/QEGikoQTDkQ0mZ/j8a81RuZnmUs5Hwg7kLDdwu1SNzSdN5/SAErzt7GS
         A0tK0GdB3SjV/83E+8iHYBWrb8lP3yU4Vp2YXz3dhydtwy1pQ7BR42Vvakic/2kzydkY
         H3fJkGlXUYB7yAwuO6v4SWhRsqooHqPPn6eKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=q8HTvQs7fvXol2l1T9P+QQQ9fKkd5m5EaKXQ0/HpyDg=;
        b=WQffDZEXblgePgL0/8p4CYqlpiDSTybrDK35MIQBg2J7iA04Gs/4fr6cB/e7pFnrAZ
         UeHBu6WFav5rTuNYVD4ofijEo60/OWJzqJKX92f0EkoYAukvby8HRFrvfHdtdc2TaAI7
         wLe428XxkaDKX2PcYwP9LjJiYmiiH7O7n7qWzbS8m8BIZhRZe6TzCL/O6vx5o2i9LvEr
         2ZdX/bmcpe5WAWnC6dqAdtWl+vgfQfrQD1qxsU6FGCdssJ+CCpiaMR0sdj2XR2XRN0Rw
         fUztQ8CQTLKJ612EXVn7NETx2atnlAlVhcOiBaoR05fITtOybiQ1hvF/G4jmKx3y4OMP
         Dw+Q==
X-Gm-Message-State: AOAM5316Lrz5JKj0d2JCwZl4dUoybpTH+GbP4F6VqPwP3Jc9LvcywqXO
	HxXqjiyHjWlSskXj9BD+GN/u1g==
X-Google-Smtp-Source: ABdhPJz5BPhhyqFfmzRaMRE7LKy6JGY4g+bXpYQ2sSxe5oRdF8lvH1VuLC/EF1sN9JSt8vjMCUjIeA==
X-Received: by 2002:adf:ef02:: with SMTP id e2mr4036756wro.401.1631701158412;
        Wed, 15 Sep 2021 03:19:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:cb98:b99:6df8:dffd? ([2001:8b0:aba:5f3c:cb98:b99:6df8:dffd])
        by smtp.gmail.com with ESMTPSA id k19sm3697146wmr.21.2021.09.15.03.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 03:19:18 -0700 (PDT)
Message-ID: <7e9d2cf0ab043ab07dd2e2463916025a6476ca61.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/4] Rust oe-selftest script
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: pgowda cve <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy MacLeod
	 <rwmacleod@gmail.com>, umesh.kalappa0@gmail.com, Vinay Kumar
	 <vinay.m.engg@gmail.com>, alex.kanavin@gmail.com
Date: Wed, 15 Sep 2021 11:19:17 +0100
In-Reply-To: <CALY4987SWBHyYdCHAmOKCLGm6EqmAzT5uXUhFiSi4i3Vpi4vTw@mail.gmail.com>
References: <20210913173513.176653-1-pgowda.cve@gmail.com>
	 <04a96263ce4c741c833e1022dcc2a5a48119280a.camel@linuxfoundation.org>
	 <CALY4987SWBHyYdCHAmOKCLGm6EqmAzT5uXUhFiSi4i3Vpi4vTw@mail.gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-09-15 at 15:37 +0530, pgowda cve wrote:
> Hi Richard,
> 
> Thanks for reviewing the patch and your comments.
> 
> > We did see a couple of failures in testing on our infrastructure:
> We are using the following machine for running tests
> Description:    Ubuntu 18.04.3 LTS
> Release:        18.04
> 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/3970/steps/19/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/3967/steps/20/logs/stdio
> 
> We did not see the following error while running X86_64 target
>  "/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found
> Can you please let us know whether this is the failure you mentioned.

Yes, that would seem to be what is failing the build in the first case. In the
other it is slightly different:

/home/pokybuild/yocto-worker/qemux86/build/build-st-41976/tmp/work/core2-32-poky-linux/rust-testsuite/1.54.0-r0/rustc-1.54.0-src/build/x86_64-unknown-linux-gnu/test/run-make/issue-36710/issue-36710/foo: /lib32/libc.so.6: version `GLIBC_2.33' not found (required by /home/pokybuild/yocto-worker/qemux86/build/build-st-41976/tmp/work/core2-32-poky-linux/rust-testsuite/1.54.0-r0/rustc-1.54.0-src/build/x86_64-unknown-linux-gnu/test/run-make/issue-36710/issue-36710/foo)
/home/pokybuild/yocto-worker/qemux86/build/build-st-41976/tmp/work/core2-32-poky-linux/rust-testsuite/1.54.0-r0/rustc-1.54.0-src/build/x86_64-unknown-linux-gnu/test/run-make/issue-36710/issue-36710/foo: /lib32/libc.so.6: version `GLIBC_2.32' not found (required by /home/pokybuild/yocto-worker/qemux86/build/build-st-41976/tmp/work/core2-32-poky-linux/rust-testsuite/1.54.0-r0/rustc-1.54.0-src/build/x86_64-unknown-linux-gnu/test/run-make/issue-36710/issue-36710/foo)
/home/pokybuild/yocto-worker/qemux86/build/build-st-41976/tmp/work/core2-32-poky-linux/rust-testsuite/1.54.0-r0/rustc-1.54.0-src/build/x86_64-unknown-linux-gnu/test/run-make/issue-36710/issue-36710/foo: /lib32/libc.so.6: version `GLIBC_2.34' not found (required by /home/pokybuild/yocto-worker/qemux86/build/build-st-41976/tmp/work/core2-32-poky-linux/rust-testsuite/1.54.0-r0/rustc-1.54.0-src/build/x86_64-unknown-linux-gnu/test/run-make/issue-36710/issue-36710/foo)
make: *** [Makefile:14: all] Error 1

I'd note that one is from a debian10 system with no buildtools, the other is
from a ubuntu 1604 system which does have a buildtools tarball installed. I
suspect it is related to the version of lib on the host verses the version used
in the target.

Perhaps try running the build within a buildtools environment to reproduce?

https://downloads.yoctoproject.org/releases/yocto/milestones/yocto-3.4_M2/buildtools/x86_64-buildtools-extended-nativesdk-standalone-3.3%2Bsnapshot-1ad79313a5c3e6a453fbeb44caac5c5bbad46d3c.sh

> Please find attached the log files "rust-testsuite-logs.tar.bz2" for
> all 6 targets.
> We observed some test failures in the logs but there were no build failures.
> 

Unfortunately we can't merge this until all the tests pass reliably on our
infrastructure.

> > I also needed to add a maintainers entry:
> Thanks very much for adding the maintainers entry.

Cheers,

Richard


