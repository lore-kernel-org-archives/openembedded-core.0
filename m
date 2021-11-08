Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F74C433EF
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 21:56:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.3511.1636408597945745270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 13:56:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CSmfu3eM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 71so14173660wma.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 13:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=e7qJ1tmB8Wy218L7rSskKZEv6stexpO7wmEUqLjyIRs=;
        b=CSmfu3eM16F3H4FCwDRLzdx7mq+T/uwhoCVs5ESK4J/zSYOBj8fhPXd/yhfjzhf77c
         JLPlXb/CnPg13yPAUu4vw3U4bf8lMwn4BIo/4CQ/baUcyj5frEtoJWqPpMhuO3t0At3U
         JcA/1l+srXhpeW/i464wiIWhw4V3kxMDt3yHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=e7qJ1tmB8Wy218L7rSskKZEv6stexpO7wmEUqLjyIRs=;
        b=25MI4sRxYNFrrJd4vNJj+5xwGU9w6ooLD8x+/hfpWS6zSAKHaNsj1fduE9F6/G7Jt3
         GSW/Sii8qBjqVxtcB/Mr+FiSaFtc/Hx6ZgJPw2Q1dLywLC2fSIfND1ULxH0Zg1/VxN93
         epI+2ueeYIeoQutWAG2nyvsKmS18KXDSzpT0GS7BR6GrOx0nkr4hgAUif4qwWQKqANTR
         3ePQexzoP6gXxdfEpQBeqoBHWILl05AYM01JXfOcerIEqUbMthsqv7wOMJJ+dEPNIW8Y
         a0GvUJJwWBfwgXHPrxLfWGWtqke1OndlIrXu0UrpMBwE5Z5ffQKpeo/sbORTUmnuv2Ua
         oxNw==
X-Gm-Message-State: AOAM531mMafMQnOcMhBhf8UzNtWkHQt6rsdvaTGv1JZLJYeYhCNTLsQn
	Bq5n8Xo33nOVMgMMCRMcUN3oJg==
X-Google-Smtp-Source: 
 ABdhPJxl9hDDWo0z3X20lvcZJ/PTxr0udVgY4vvnyX9g23jxHeOaQPSyqqe+XC13Uw6njDtRjXfpZw==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr1565037wmj.149.1636408596339;
        Mon, 08 Nov 2021 13:56:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:10b7:e9c6:d1a:6f7c?
 ([2001:8b0:aba:5f3c:10b7:e9c6:d1a:6f7c])
        by smtp.gmail.com with ESMTPSA id
 l26sm523502wms.15.2021.11.08.13.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 13:56:35 -0800 (PST)
Message-ID: 
 <5a504e34529cf69e28b9f1e3810ecdd3797cd1f3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-nose: translate to python3 code
 before build
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 08 Nov 2021 21:56:35 +0000
In-Reply-To: <20211108065510.25048-1-yi.zhao@windriver.com>
References: <20211108065510.25048-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 21:56:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157989

On Mon, 2021-11-08 at 14:55 +0800, Yi Zhao wrote:
> Setuptools has removed support for 2to3 during builds since version
> 58[1]. But the nose's setup.py relies on use_2to3 option in setuptools,
> it is failing an import and building without running 2to3 and generating
> valid python3 code. As a workaround, we use command line 2to3 tool to
> translate to Python3 code before build it.
> 
> Fixes:
> $ python3
> > > > import nose
> Traceback (most recent call last):
> File "<stdin>", line 1, in <module>
> File "/usr/lib/python3.10/site-packages/nose/_init_.py", line 1, in <module>
> from nose.core import collector, main, run, run_exit, runmodule
> File "/usr/lib/python3.10/site-packages/nose/core.py", line 153
> print "%s version %s" % (os.path.basename(sys.argv[0]), _version_)
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> SyntaxError: Missing parentheses in call to 'print'. Did you mean print(...)?
> > > > 
> 
> [1] https://github.com/pypa/setuptools/issues/2086
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta/recipes-devtools/python/python-nose.inc  |  6 ++
>  .../python3-nose/0001-Remove-use_2to3.patch   | 71 +++++++++++++++++++
>  2 files changed, 77 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-nose/0001-Remove-use_2to3.patch

This failed in testing unfortunately:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/4323/steps/14/logs/stdio

Cheers,

Richard


