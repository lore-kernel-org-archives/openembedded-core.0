Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.923.1615759989072275721
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 15:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OF9EctF1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id c76-20020a1c9a4f0000b029010c94499aedso19146106wme.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 15:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ywBrXCTtUQHFIOPtIv5W7bpYQ8bSQy5ZOMTo0kPCL+E=;
        b=OF9EctF1EY7Nh4v0RaL49atbgjiXdkORZalEBjbFCczTwUCECHOsubUC4Gz1i0lvjG
         bYbLjJ/ZI2Yp01qUcQ8hcB3hB9S6NTfM9QE9epSNEhNnscWCeElATBWATy1fR9nXpyAa
         qSYCiYOeh7omyH7zaQia2NOQJQRPIxns4rWM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ywBrXCTtUQHFIOPtIv5W7bpYQ8bSQy5ZOMTo0kPCL+E=;
        b=qovYjx9IFBc9MdzCXUHK6zRDxYO9dQ8/Wd9CfIAaea2c20Cq1IhOyO1JRXbIEa0NMd
         /WBDF32YyTxd0d1kSVxB42Fcn8tqfA1f+mfcAmL/EXQwGUhJijeOcL5M4OoOdR/9Cl0y
         9vlTFhqGHu0Br8IGNM+Z3R1GaxrcrgJHp+JOguoBcKnVlVxXoIBqjOsfeQkGMQmcRCUc
         gQg7tRCsU7zfJ79tqvHg3bsOlap6PQV+RVoeXhgs/ROei42vLKPqzGtxoTbGrGyVetmY
         ZW7MZN6cRimDs0o2MwBTR0RhsXActihDRYc4jci4/i+564TO7hzCFHckrtP9lFjJKVo+
         xLVQ==
X-Gm-Message-State: AOAM532T5bhLxQ6a81rZQDNuNffv8mw8WgHNi2cZFvUHSfoJ3JH/aj2g
	pFOhEN8dTCBbYEjCDVDjauTvO3aqacN5mQ==
X-Google-Smtp-Source: ABdhPJzQK835mnVjbE2Bk068qcJUtkvOSwDjXEFCjcNNqGFjaH74MzE9alMsiBe7Y7keVfoDcSKePg==
X-Received: by 2002:a7b:c0c7:: with SMTP id s7mr23452112wmh.5.1615759987615;
        Sun, 14 Mar 2021 15:13:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4ab3:e50e:5e50:fc1e? ([2001:8b0:aba:5f3c:4ab3:e50e:5e50:fc1e])
        by smtp.gmail.com with ESMTPSA id l8sm16997144wrx.83.2021.03.14.15.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 15:13:07 -0700 (PDT)
Message-ID: <d54e14f4b19a9840fa0c13350d844299fe1750af.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] go-dep: Remove
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Sun, 14 Mar 2021 22:13:06 +0000
In-Reply-To: <7cae212d-110b-c72a-eeb9-b6713d4b3abd@gmail.com>
References: <20210312062107.1549935-1-raj.khem@gmail.com>
	 <20210312062107.1549935-4-raj.khem@gmail.com>
	 <729a07918ea4baec2608d1f462c4a4bdcd593551.camel@linuxfoundation.org>
	 <7cae212d-110b-c72a-eeb9-b6713d4b3abd@gmail.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-03-14 at 09:58 -0700, Khem Raj wrote:
> 
> On 3/14/21 9:31 AM, Richard Purdie wrote:
> > On Thu, 2021-03-11 at 22:21 -0800, Khem Raj wrote:
> > > go-dep was an effort for dependency management before go modules, which
> > > since 2020 has been deprecated in favor of go modules. Since its not
> > > developed any longer and go mdules is officially supported, this should
> > > be retired from OE-core as well.
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>
> > > ---
> > >   meta/classes/godep.bbclass                    |      8 -
> > >   meta/conf/distro/include/maintainers.inc      |      1 -
> > >   meta/lib/oeqa/selftest/cases/reproducible.py  |      1 -
> > >   .../0001-Add-support-for-mips-mips64.patch    |     54 -
> > >   ...bolt_riscv64-Add-support-for-riscv64.patch |     33 -
> > >   meta/recipes-devtools/go/go-dep_0.5.4.bb      |     30 -
> > >   7 files changed, 145701 deletions(-)
> > >   delete mode 100644 meta/classes/godep.bbclass
> > >   delete mode 100644 meta/recipes-devtools/go/go-dep/0001-Add-support-for-mips-mips64.patch
> > >   delete mode 100644 meta/recipes-devtools/go/go-dep/0001-bolt_riscv64-Add-support-for-riscv64.patch
> > >   delete mode 100644 meta/recipes-devtools/go/go-dep_0.5.4.bb
> > 
> > So we also need to remove the go-dep tests?
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1950/steps/14/logs/stdio
> > 
> > If so, is there some other go test we could replace them with?
> 
> 
> I think this is some connectivity issue. see the below error I pasted 
> from your logs.
> 
>     File 
> "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/gotoolchain.py", 
> line 68, in test_go_dep_build
>      retv = self.run_sdk_go_command('build', proj, name)
>    File 
> "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/gotoolchain.py", 
> line 54, in run_sdk_go_command
>      return runCmd(cmd).status
>    File 
> "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/utils/commands.py", 
> line 210, in runCmd
>      raise AssertionError("Command '%s' returned non-zero exit status 
> %d:\n%s" % (command, result.status, exc_output))
> AssertionError: Command 'cd 
> /tmp/SDKQA52f_qj7f/go/src/github.com/direnv/direnv; . 
> /tmp/SDKQA52f_qj7f/environment-setup-core2-64-poky-linux; export 
> GOPATH=/tmp/SDKQA52f_qj7f/go; ${CROSS_COMPILE}go build' returned 
> non-zero exit status 1:
> go: github.com/BurntSushi/toml@v0.3.1: Get 
> "https://proxy.golang.org/github.com/%21burnt%21sushi/toml/@v/v0.3.1.mod": 
> net/http: TLS handshake timeout

We have an open bug for a connectivity issue but the tests really shouldn't
be relying on the network if we can help it. I doubt this is a connectivity
issue as such, more likely rate limiting or some kind of DoS defence from 
github. It was odd that all the selftests failed with the same error.

I can rerun the build again, see if it happens to work but is there something
we can do to avoid the network?

Cheers,

Richard





