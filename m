Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.18.1614272146106191091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 08:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PrRnh3Fh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id a11so1951388wmd.5
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 08:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=gMKHSptUVJFIXmO7dKu0vcL9BNOtgj5YLQMLYh+wz0w=;
        b=PrRnh3FhkTVBgx5g84m9qhH1bhJ3lnONDXl4UfSLTgZoUwVWmlGLTos0PQ3ZkgD7Bh
         NTS9wX6D5yED0Tinn4coUyFZWqQM0XKIh4gXCnysEVZLLxrfQL0Qf0yN6jNf2puGSOLL
         VifFzox1+dKWjBnJzIpRibKtZVfHmgdyh3WKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gMKHSptUVJFIXmO7dKu0vcL9BNOtgj5YLQMLYh+wz0w=;
        b=gGqlvgXEIyr4QvsIIO3JAInbsO19xfY5QaBuxT1bqFk4S7xsjrTHqPBy4ZPKUoGnCp
         TzO327HMQz2m9vX7MjO8l/OIqZLapjMgW3IOrRxBM1e8JrzzghwSgGlxLzcjp0Wka76l
         ai5fXTka6+nStkuMmZ/2ru4vOXqoUCcBTDsqAzNYq/jSuo4QfJqrM8eYUYYTSUPltN+e
         Dd1lvlj0MLPWqD8o25/oYXcd8QSOnfyfsZxgpxj6LmFyiuwTnVzbFgAMuMtCqDwkoLp2
         M+W4nSUcldylhMGK3zHrl6AXh/4RaEvfPIE13XgXuu8EDFRBItbtPFMM71VHsKCFqzZS
         q3WQ==
X-Gm-Message-State: AOAM531j7IbXVJJV0cp3nt0dfECB1BQZQMq6c4UF3VqeA5I12Hw9v53J
	2IVdPj0kpNQCWgksyvrJhzoDgA==
X-Google-Smtp-Source: ABdhPJzAa8xkiN2Upmf8/U5pREIqrttmBB7PzWdtYyuFi5F9CikD0fDXRNjP4mpyV3LnsryzcTixSQ==
X-Received: by 2002:a05:600c:c3:: with SMTP id u3mr4241185wmm.64.1614272144554;
        Thu, 25 Feb 2021 08:55:44 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4258:f6b6:9d0d:f472? ([2001:8b0:aba:5f3c:4258:f6b6:9d0d:f472])
        by smtp.gmail.com with ESMTPSA id q18sm9910093wrw.91.2021.02.25.08.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 08:55:44 -0800 (PST)
Message-ID: <ad16b82158c2fa88c01b8b0962cc0455595b5b64.camel@linuxfoundation.org>
Subject: Re: [OE-core] [v2] Merge meta-rust to oe-core
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2021 16:55:43 +0000
In-Reply-To: <20210225014823.397741-1-Randy.MacLeod@windriver.com>
References: <16668FEB024AAA5B.31532@lists.openembedded.org>
	 <20210225014823.397741-1-Randy.MacLeod@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-02-24 at 20:48 -0500, Randy MacLeod wrote:
> Added or updated these commits:
> 
>    86109491bc maintainers: Add myself as maintainer for rust pkgs
>    ...
>    b411e322b3 rust: remove container build scripts used by meta-rust
>    c646d47ebc rust: update the README to conform to being in oe-core
>    e19d823567 meta-rust: merge commits
> 
> The last commit update was just squashing a new commit from meta-rust:
>    f8b9103 Remove checks for Rust versions we don't build anymore.
> 
> 
> To Do List
> ==========
> 
> 1) cargo-bitbake - the README suggest adding this using desktop
>    cargo but once we get the SDK merged, it should be added there.
>    Someone suggested using devtool for this rather than cargo-bitbake.
> 
> 2) Fix the SDK libcrypto, libstdc++ glibc-2.33 problem. I'm running a
> git bisect using poky, meta-oe/master, meta-rust+SDK patches.
> 
> 3) Add a test case to either:
>    - just build rust-hello-world or
>    - run it in qemu
> 
> N) Fix *some* of the remaining bugs in:
>       https://github.com/meta-rust/meta-rust/issues

I put this into master-next to see how it looked. The build hasn't completed
yet but so far:

rust-native doesn't build on debian8:
https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/40/steps/13/logs/stdio

oe-selftest:
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1855/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1887
(others will likely show the same issues)

which is basically three tests failing:

oe-selftest -r sstatetests.SStateTests.test_sstate_noop_samesigs
oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs
oe-selftest -r distrodata.Distrodata.test_maintainers

so the maintainers entries aren't quite right which is easy to fix and 
the sstate signatures aren't behaving correctly which may be more fun,
depends what is wrong. Those tests explain they're broken (which is what
we have the tests for) but more investigation would be needed to 
understand how/why.

Cheers,

Richard





