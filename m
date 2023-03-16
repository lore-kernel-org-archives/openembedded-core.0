Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07509C7618B
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 08:14:26 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.7350.1678954458194482071
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 01:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LaY2igZC;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id z5so753229ljc.8
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678954456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dC0JNAw/gVVQMbQyzcXlvth3iFxWdpfwo6gdE3OIJ8w=;
        b=LaY2igZChXrjznW2g/MpCM88dGe35YOWd3dL1hhkqYF50EXRArDCv8jutHx0K2Of43
         tM9zpAIT/sWGcRcrsJLc8hsnZh8IYAQu/UYIFLE+3oZSJ6LtEu6/n6Yi77nBl5pfdlPZ
         zNNL/GQcIjXs4HiPPa3TMs7kb6ded+POlTl6bOCG2hmDdCWGFlVGMT76jdslQcUVSumg
         YezXGrGcRQ6i7YxGjdPMXOvUbctbqCVSEBr0nilHlBS9LWit+QiFT4cCZJ9Ws9Zx1pDW
         7N1wDsowzVf1kRSEcMDx04lKkCjKYTRc1nGwPHeRUVsu2dkckkd6/GR0TDeJylM8kWuC
         L7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678954456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dC0JNAw/gVVQMbQyzcXlvth3iFxWdpfwo6gdE3OIJ8w=;
        b=NXKCM8mb5h6aqWcX3cbEsnwwzB9z29ru4miRU5I95nMst2cFcmcKMw/EKbGWwbd2h6
         r5gvE2hgjB9XQ4FpRGtpyAxXHsbI2U9VZwPQvwhhf3xMPNLr0xuPydhjKjE2b+znyfvs
         QZM3SsHknE56r5JGLMJk60E0M/hwRbXc7WJO3hu+kjHMFcEMTVA//QeTLVzwavZaX6Iu
         8HYhGUPld19vgRj/8XXCcs7EI6OwXLCgYD//3ZrPUy7ipHnFxAsvjbYzDuWD0APZ+Ema
         O5xgHHB9sbOddC9QuBw91le39dZuyLBG12MRKfeiqwSBCS8EDZVVNbDmctJoOuwRX7iD
         gnkg==
X-Gm-Message-State: AO0yUKU6M3+/LxYnCzxmInnnzWy8PkdKV/aaygbY6Ck8k2whn+GHEbtu
	FRBT9DBe492d9RtBrt5cb1H9oDKgrN6X3twlCCOoyo7X
X-Google-Smtp-Source: AK7set8HtaM52M00nSUjvyPtRB8HXKqb0mA7zUsyaOKogR3Nk6exMD/Ou6Ut7UjyN73z/daL8th1BCC5Bm7IJ8vuRe4=
X-Received: by 2002:a2e:b548:0:b0:293:2f6e:91bf with SMTP id
 a8-20020a2eb548000000b002932f6e91bfmr1791781ljn.7.1678954456071; Thu, 16 Mar
 2023 01:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <1678878683-19486-1-git-send-email-wangmy@fujitsu.com> <4909d0d1ebf1cb85ee289d31a301f70df3a5ec0d.camel@linuxfoundation.org>
In-Reply-To: <4909d0d1ebf1cb85ee289d31a301f70df3a5ec0d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 Mar 2023 09:14:04 +0100
Message-ID: <CANNYZj98=i015GuwchUZrxjtmcWFVfCO3mKA1SdGGQ+VeYDKPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grep: upgrade 3.8 -> 3.9
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 08:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178677

On Thu, 16 Mar 2023 at 09:11, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-03-15 at 19:11 +0800, wangmy wrote:
> > From: Upgrade Helper <uh@not.set>
>
> I noticed a number of your patches have this set which is incorrect!

Mass-reassigning the author can be done with something like:

git rebase origin/master --exec 'git commit --amend -a -s --no-edit
--reset-author'

Alex

