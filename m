Return-Path: <chase.qi@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E44FC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 03:52:27 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.4129.1667879539720890804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 19:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=i7fuFvMS;
 spf=pass (domain: linaro.org, ip: 209.85.166.41, mailfrom: chase.qi@linaro.org)
Received: by mail-io1-f41.google.com with SMTP id e189so10580146iof.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 19:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/PN80gFDhx4Jw0nMtlH2Ou+rYR1qskMOmddU+XLnMSw=;
        b=i7fuFvMS1GSyFPRkV90OPdVL2k/6HXyL8YPYXe1TRupYBuU4UZVgCXbpfgOFgymVlJ
         TnB+N3P8hohnU1iNTVdpokg/vVFbrEdMjlumluEilewAh+gympoi55Ho22EJRn6W5IWZ
         LYeXz9zkWJC7CjBfOBnoXSZroGC2o41tYtsln7LXXDfoSewoYZ9S9LhanfScqSdjp3gR
         SeOsg1feuxb6tM7NWVFTwXEWoYeNFMGxQcjZ5fbUy1htw9+iOXEnWbcvCVO22u2HjfBU
         +hB8r2b5ePYQ8K793xjmUojbLfmIpIGQPV7YeIc8gb7jcQQO7reFwgejbZ0sKZqZ2/Fc
         ffOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PN80gFDhx4Jw0nMtlH2Ou+rYR1qskMOmddU+XLnMSw=;
        b=flEzz3TlPwi1Dm3D1L1obs3QtTqWTTIROzcBGmZN1wLCqPZPGd2wOsqlBOQc/G237/
         2Yg2edpPQ61SauOqR7f02bP5KikIZmi/YTQTnXpXKx2eo3WeF1i7uPuuX2peqmeE+mQs
         fxDd/vaYGyceJfdk7DqyrOjFAMCDQ1yOOWy6lRKJu8iJ7Mwv8eBXxSUwl2aWUZ6PdXZa
         8riZwqIZtTTLpjVKImL4kfPf1WbsXXLCKy45j56okE8N+qN/irB2JqIqFG5ExwK77hoK
         YPELFcQig6zo/hL62S8e3ricusX25wDsccTVzEHb2UjAnLNpo/JnMFo1gTBAIfHAddYS
         rerA==
X-Gm-Message-State: ACrzQf3TP9bdhdGSe8GGrFFh6IFdrHnAlnntDXs5Swn53qh+p98Qteny
	pQRDsg3Nih5jrkAMUEIbgYK1lGf9oaXHPFKvoF/5nQ==
X-Google-Smtp-Source: AMsMyM578kJP30Bn9tLFCBLg5/8Av/Ntic1GOi040C7tlMkgSLPaLR1MmY4m2XSs0WF56ZS/MlcanIZnyr7s6zpu9CA=
X-Received: by 2002:a02:cb91:0:b0:375:662b:5032 with SMTP id
 u17-20020a02cb91000000b00375662b5032mr25039778jap.219.1667879538855; Mon, 07
 Nov 2022 19:52:18 -0800 (PST)
MIME-Version: 1.0
References: <20221104100140.976337-1-chase.qi@linaro.org> <Y2TnY7I2mllJTkox@nuoska>
In-Reply-To: <Y2TnY7I2mllJTkox@nuoska>
From: Chase Qi <chase.qi@linaro.org>
Date: Tue, 8 Nov 2022 11:52:07 +0800
Message-ID: <CACLiBhDtuDwuu_xCJnEY+HYu5kAtmnqXNkGo8F269+FjhyDMFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] libc-test: add libc testsuite for musl
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 03:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172949

Hi Mikko,

Thanks for the review.

On Fri, 4 Nov 2022 at 18:20, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> On Fri, Nov 04, 2022 at 10:01:40AM +0000, Chase Qi wrote:
> > libc-test is a collection of unit test to measure the correctness and
> > robustness of a C/POSIX standard library implementation. It is developed
> > as part of the musl project.
> >
> > Signed-off-by: Chase Qi <chase.qi@linaro.org>
> > ---
> >  .../distro/include/ptest-packagelists.inc     |  1 +
> >  meta/recipes-core/musl/libc-test/run-ptest    | 17 +++++++
> >  meta/recipes-core/musl/libc-test_git.bb       | 50 +++++++++++++++++++
> >  3 files changed, 68 insertions(+)
> >  create mode 100644 meta/recipes-core/musl/libc-test/run-ptest
> >  create mode 100644 meta/recipes-core/musl/libc-test_git.bb
> >
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> > index 32b0e5297a..3c9ff43bd9 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -105,6 +105,7 @@ PTESTS_SLOW = "\
> >
> >  PTESTS_SLOW:remove:riscv64 = "valgrind-ptest"
> >  PTESTS_PROBLEMS:append:riscv64 = "valgrind-ptest"
> > +PTESTS_SLOW:append:libc-musl = " libc-test-ptest"
> >
> >  #    ruby-ptest \ # Timeout
> >  #    lz4-ptest \ # Needs a rewrite
> > diff --git a/meta/recipes-core/musl/libc-test/run-ptest b/meta/recipes-core/musl/libc-test/run-ptest
> > new file mode 100644
> > index 0000000000..a30cee590e
> > --- /dev/null
> > +++ b/meta/recipes-core/musl/libc-test/run-ptest
> > @@ -0,0 +1,17 @@
> > +#!/bin/sh
> > +
>
> Please use at least "set -e" to capture errors of failing
> commands.
>

+1 Enabled in v3.

> > +cd /opt/libc-test
> > +make cleanall
> > +make run | tee libc-test.log
>
> Depending how this handles errors, the return value from
> "make run" may need to be discarded, but I'd prefer
> this to be explicit if "set -e" is used.
>

Yes. In case the command return with non-zero, I switched to "make run
|| true" in v3 for the following log parsing.

> > +echo ""
> > +echo "--- ptest result ---"
> > +if grep -q '^FAIL src.*\.exe.*' libc-test.log; then
> > +    # Consolidate output format.
> > +    # e.g. "FAIL src/api/main.exe [status 1]" -> "FAIL: api_main"
> > +    grep '^FAIL src.*\.exe.*' libc-test.log \
> > +        | sed 's|^FAIL src/|FAIL: |;s|/|_|;s|\.exe.*\]||'
> > +    exit 1
> > +else
> > +    echo "PASS: libc-test"
>
> Would be nice if something would check that tests were actually
> executed.

I think src/REPORT can be used to check if 'make run' is finished
correctly. Per the logic here
http://nsz.repo.hu/git/?p=libc-test;a=blob;f=Makefile;h=cf2ab2b2c8ebef0a9eab8cb06efc7bb5d989cc83;hb=HEAD#l120,
I understand the file is generated after all sub-tests are finished.
Would you please review v3?

Thanks,
Chase

>
> Cheers,
>
> -Mikko

