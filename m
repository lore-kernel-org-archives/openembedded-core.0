Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4E7C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 14:41:08 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.73653.1673275266497499817
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 06:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O7FPuXWL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id m7so8374191wrn.10
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 06:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c8gxPXc3gI9gaW8RxBX7ljYEH2dTrK6fgr6hj9/d4xs=;
        b=O7FPuXWLaowDVQ2nIiL6Yzuj71j0wybx4z7GGaQB2qG8I0CmdxJVLesb4qB0u+xLZs
         WbHpT6ARrqEp//gIOE6NiyFVko/JYffSkIBbcyEeq3Zq006G6/VCl4xm8McfHwajZOKr
         Z2pVEwz8BY6K1Wc/6xVffiJgM1n9oy8c8p11k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8gxPXc3gI9gaW8RxBX7ljYEH2dTrK6fgr6hj9/d4xs=;
        b=mEFSR1BuUBgVDCeHHVZlKA0JjCXcZtWJJzzW1XEa9HbtUIPCmVOduoCDM5Ak00poex
         kgzOCZTspXm1LHKFODuxnPnQX+idr3cu2NwZryjTqWVaO/Sf13qMJ4yS2DGvztWqEIzw
         488QZViUQvgxJ/aBOpDebJLCg+gg/K7IhYxp0Yfrfpt6ii7NtqjrzP4JfFyNl1BzwNKs
         E9Ltt6JeZ0zm987BTwEIymmw5/PR3FSgcuLcyCkVbihcuEVeYzuf67GYBJeLAtqnLmy7
         yb3uzfcy7nDIaGt0WWuHmObhDDgpYwvYYfvhVxdYvu0Zt4JRskCG4QmB5DROBIFFu3X9
         u9fQ==
X-Gm-Message-State: AFqh2kqAYx2W+sd4adaNOUab8NIy6E1cFjoOY1wYzCsoTGYMQ+t4xUyR
	TahACXhnSJDS6s3lk+/dxFinG7BN39mV86xd
X-Google-Smtp-Source: AMrXdXuoi4c/ThQe/gmdExJiaw9MF3Ty5ibZ08RuZ7Xl85ooSXJNvms9Y+b5zTHCYmWt1X31cQ9aYQ==
X-Received: by 2002:a05:6000:1f81:b0:2bc:5115:f069 with SMTP id bw1-20020a0560001f8100b002bc5115f069mr2002913wrb.49.1673275265030;
        Mon, 09 Jan 2023 06:41:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bf05:daf1:cc08:7166? ([2001:8b0:aba:5f3c:bf05:daf1:cc08:7166])
        by smtp.gmail.com with ESMTPSA id t19-20020a0560001a5300b002362f6fcaf5sm8677946wry.48.2023.01.09.06.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 06:41:04 -0800 (PST)
Message-ID: <7924fc39148b590b213c2af2af82b78558354aba.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/14]]v2] kernel: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 09 Jan 2023 14:41:04 +0000
In-Reply-To: <cover.1673224444.git.bruce.ashfield@gmail.com>
References: <cover.1673224444.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 14:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175688

On Sun, 2023-01-08 at 19:38 -0500, bruce.ashfield@gmail.com wrote:
> This is v2 of the libc-headers and reference kernel bump that I
> sent before Christmas. It is largely the same, but I've addressed
> the one warning that popped up for qemuarm, as well as stacking
> more -stable commits on top of the previously sent changes.
>=20
> Once this merges, I'll move onto removing 5.19 and we can get the
> h/w references updated.

The updated version built cleanly so it is merged, thanks!

Cheers,

Richard

