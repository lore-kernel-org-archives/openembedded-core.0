Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD69C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 08:54:00 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.41105.1674118429916772891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 00:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BdzBU1gO;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id bp15so2176532lfb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 00:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sHIwnRrcyzFS0h6zOQUc1yFWnsE5bcfG2uMe6eMTyO8=;
        b=BdzBU1gOC/ZGKi87GApN3Q+plNMA0MRXRX2BzUfUy9ZeDXeOL5kq5EPFOfN9wUgHmh
         meZnLW7czynTEZMbSn/5YkIkyUkvn4EQuAogoGwRbJRWFbJ7hVzuSOQf4ekSDsa5/jAU
         QWRhGaitTTqQ0CSCrXAtfDJAYLcKZk/J4ngg4lyHfTLITl3wIBSwfbnrJMWkscN++CU2
         G9ZRN6StXN9iPAhpam5rXVG3UKPgFpt77wBwCc48DPpjJOrQoijodnwoPSgO5ttlJcXc
         KbbGhTGzv3iD2mWpbPtzfRlcC2ho7NgDOXJ/ENnYqCklaFpUmKd8IHpeXPde5Rmda4hQ
         LciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHIwnRrcyzFS0h6zOQUc1yFWnsE5bcfG2uMe6eMTyO8=;
        b=tuDbTv8JcrW0N3P2KHVmHDx2H8x6gvufMPv+TLp4o2TXS3solAQ8UBCzLnQKnams5S
         NILn6B0POHGhtgjYBeM4dN9wpCkKGcFehYJTQAgiOcJXeaEebpbWeQpQZqIc5+pMH5Rs
         4UBUBfHLqgnxfgvUQAZ0Hw/VujeWjPMIXrch99942HNP3cBymgUmTUwDfFhOuPV78Vmw
         ZBpK7UNop0u3bJav3vBYFkR3SGUpQip72RQAUX94we3Ps3TDIoTVhyVtRe3UTbguhkvU
         OD17bxr8dRSeIsc/AoUD1Ev2b05qEWmPfb69ukhOOK8cACls74qlcOPoMZ7DghoTw3UB
         W80A==
X-Gm-Message-State: AFqh2kqlaUtN2g/oaZwaK/Cc5sMFToOON4L5Jfph0O6rWJZzFb8hyE0C
	FLUwgcG+HYEopSyj0lFsbBPFQylMcn4wA7ubVDs=
X-Google-Smtp-Source: AMrXdXvYKXGl2hRtwmFH5deAiGNcHgb3zhwJKBg72m8iRSdqCzp+7OgDkJi9wPw3Bv8Y2YWYJg4N+7b4XCYSYkKoe5U=
X-Received: by 2002:a05:6512:e9e:b0:4cc:716d:e018 with SMTP id
 bi30-20020a0565120e9e00b004cc716de018mr545636lfb.367.1674118427815; Thu, 19
 Jan 2023 00:53:47 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5RftGpqzF1=6NUhQChCqCyp2D-ud8KUB69u6+9=N1VkAg@mail.gmail.com>
In-Reply-To: <CAO5Uq5RftGpqzF1=6NUhQChCqCyp2D-ud8KUB69u6+9=N1VkAg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Jan 2023 09:53:36 +0100
Message-ID: <CANNYZj_9rpnJrSLp_oRvXsRzAXhA=W3ybEmQxrUtdcJtNq18rA@mail.gmail.com>
Subject: Re: [OE-core] Rust crate checksums
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 08:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176126

I think Cargo.lock contains those checksums and that forces cargo to
verify them? Can you check that verification happens and fails when it
should by e.g. patching it to have bogus checksums?

Alex

On Thu, 19 Jan 2023 at 08:15, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Unless I'm missing something, I just realised that we're not
> validating downloaded crate checksums when we fetch them with crate://
> - Surely we should be?
>
> --
> Alex Kiernan
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176125): https://lists.openembedded.org/g/openembedded-core/message/176125
> Mute This Topic: https://lists.openembedded.org/mt/96373035/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

