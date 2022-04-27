Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B23C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 13:08:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.8051.1651064922520155093
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 06:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RciuaYok;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id u3so2446787wrg.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 06:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=s4gucwlm+4LSp2vIXH3z+hiC37279zxJBE59KrOIs04=;
        b=RciuaYok9expJ3IctAi2IXHrQUK6V9FSTfNTXOu1MloL18yh2GAMpfehqBaz1ZnNHJ
         R26VML2p9pusk1RjvxCT8ntDIR9sLLVt0p1JUHYjJ++SfYu8kMZll7xajqGlOGLWMkA6
         n+O50noCWewLEBOrBYB+wAL0xxjdmPF5qGQx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=s4gucwlm+4LSp2vIXH3z+hiC37279zxJBE59KrOIs04=;
        b=KCfGz5DTDEYcGWsfxiqZYbFHbUUx3imGgtw9IpCNmMtSHkbQKDDze6sVpuM1iSxv1B
         1oCaddVaY9xrE+seSQOwYs5qFlc2uZsmIQozHolMKF/bz88QWiZTLjybF8Rb+qcZVAbA
         6Q973keiNT5aH9NOMtnqBkHoGsRFRbX2Bl7ekuWEaGlOmoAXHyYPJP0/tY1hfBWg1pNj
         MvdPOgCRg3/rhNL53JXvXXdsCMjGttLkaBXRLY0STzJICy5gHBJpFON9IH9xOGCRg2vD
         coc5ypLutevx+gEv2HHa1oFMZxKOkHtalfla5aZFaNoBnoJsAorZJ1iuznXRYbXoYnRH
         Jq4g==
X-Gm-Message-State: AOAM532+TLvKVMRmsVCSNAFyH9US0mIozcUarC38ngrtmqin8h/nswzu
	hFnrfu7LE3c8ilFFoGp5gtXPaQ==
X-Google-Smtp-Source: 
 ABdhPJzFKTWJNMUqO25Ox8Ih0qkvCRYgSHjrYxOnPlw7BGDneSmAGZeTWDLysaI2LsBVg5fwmcbsPA==
X-Received: by 2002:a05:6000:188f:b0:20a:efca:f536 with SMTP id
 a15-20020a056000188f00b0020aefcaf536mr2464174wri.316.1651064920992;
        Wed, 27 Apr 2022 06:08:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aee4:ace8:5bdc:9ee3?
 ([2001:8b0:aba:5f3c:aee4:ace8:5bdc:9ee3])
        by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0037c91e085ddsm1907549wmq.40.2022.04.27.06.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 06:08:40 -0700 (PDT)
Message-ID: 
 <bf10143cf121d1a2a8e88080107b482938657078.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 13/18] valgrind: update 3.18.1 -> 3.19.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Wed, 27 Apr 2022 14:08:39 +0100
In-Reply-To: <20220427084009.3406717-13-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
	 <20220427084009.3406717-13-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 13:08:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164920

On Wed, 2022-04-27 at 10:40 +0200, Alexander Kanavin wrote:
> Dropped patches are either backports, were merged upstream,
> or upstream fixed the issue differently.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...Fix-drd-tests-shared_timed_mutex.cpp.patch |  26 +++
>  ...against-__GLIBC_PREREQ-for-musl-libc.patch |  36 ----
>  ...plement-linux-rseq-syscall-as-ENOSYS.patch | 198 ------------------
>  ...ster.c-Limit-rawmemchr-test-to-glibc.patch |  35 ----
>  .../0004-Fix-out-of-tree-builds.patch         | 176 ----------------
>  ...wrap.c-Fake-__GLIBC_PREREQ-with-musl.patch |  28 ---
>  ...{valgrind_3.18.1.bb => valgrind_3.19.0.bb} |  14 +-
>  7 files changed, 33 insertions(+), 480 deletions(-)
>  create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Fix-drd-tests-shared_timed_mutex.cpp.patch
>  delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch
>  delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Implement-linux-rseq-syscall-as-ENOSYS.patch
>  delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-str_tester.c-Limit-rawmemchr-test-to-glibc.patch
>  delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0004-Fix-out-of-tree-builds.patch
>  delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch
>  rename meta/recipes-devtools/valgrind/{valgrind_3.18.1.bb => valgrind_3.19.0.bb} (95%)

Did that patch result in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3176
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3176

?

Cheers,

RIchard


