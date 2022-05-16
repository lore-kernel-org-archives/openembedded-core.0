Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAFFC433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 14:44:01 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web09.29876.1652712240923614865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 07:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hqd3/Kpe;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id bx33so18381434ljb.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 07:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=08K/3tVrMWHuRdI42neYANyoWwpr0Dw6vXMAxwZGraw=;
        b=Hqd3/Kpee/WuRVEakf9EiL405l4n3T7ndkY5TKHEXReRjy8lvwLR0YLyysjvFd4iyD
         zLpzr/IA9AqmNMHVm+0gIPSBqMyKVRHPcrzDV9OAOiOE64r5oMFrnG/nHmXK5Ow3UXm4
         ybdLc/r3rhkZ5uqQJytS7NfzKJcNlCOl99I+kp8pdvAfvnndSF7BEXt4s1ageQRPnOGN
         k5seWAB68to/+sQczaPVLIz63x4pLV2pN0uNcb+mFRz2MloctAgKZ56pna/9S4qqH9Qq
         NR6AAezFv3zdMvjzme5+rJedme5XNL2sQg3SPUA4H6O9TvnFXnQX6nn/TnrenNx8LigV
         0fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=08K/3tVrMWHuRdI42neYANyoWwpr0Dw6vXMAxwZGraw=;
        b=16E3WG6Wc7mXiTpturmnBber6MpuHlCbe2acRipLeBJ3+bEJIcCsWNzdD4nN1q++RT
         ubbc+/UEvHaLITwgBLS4CooMgP6slwzE7VjTGaTcRf733a70IO+yDJpyjTabXLLktHOF
         xuO+W/J5ikSXGNFYs75kgu1RAJdCHGVHZ81Mi7U+6pUcTeCNTQdAeqZ5d6dTbugjNrt+
         lQO32FTxNVXrSk/uu0/7xqQocJ/oNDaxxVpu5H432Qnx3ukjU9zH617G0FbaWkMuJPmO
         +ZC9MVwVz4mq5XJBFhZvaQQBsVTs9fhdKuB6hcT7oLiZ4ROoduU5wUtmwcpxi0oO4alP
         4szw==
X-Gm-Message-State: AOAM532qi6iugLL5hA439vip7kq6kyEfYk+j0CKdqzJY5Sk68F4UvQpk
	BcnjPAkTUegm0+Z+Dx6flIWZK8Y7AqzOE5yuN44=
X-Google-Smtp-Source: 
 ABdhPJybUmsP+oHmswGfVc1hVmcQJsgFbK+zJd0c0XQjlOmnz36MA+3obZmTfFuKtPl92zskftWdd+wRm97xEMAvfcc=
X-Received: by 2002:a2e:a486:0:b0:24f:fd5:cdb7 with SMTP id
 h6-20020a2ea486000000b0024f0fd5cdb7mr11031390lji.109.1652712238868; Mon, 16
 May 2022 07:43:58 -0700 (PDT)
MIME-Version: 1.0
References: 
 <01010180c8b78249-6b4db853-83f0-4b03-aed5-d70d27cab76f-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <01010180c8b78249-6b4db853-83f0-4b03-aed5-d70d27cab76f-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 16 May 2022 16:43:47 +0200
Message-ID: 
 <CANNYZj90hTOst=OQGfvKrJkv6THpTrLFRFBsKE+uQZgLUawvFw@mail.gmail.com>
Subject: Re: [OE-core] [AUH] u-boot-tools: upgrading to 2022.04 FAILED
To: Marek Vasut <marek.vasut@gmail.com>, Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 14:44:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165686

On Sun, 15 May 2022 at 19:15, Auto Upgrade Helper <auh@yoctoproject.org> wrote:
> do_compile failed

The u-boot update is held by
https://source.denx.de/u-boot/u-boot/-/issues/12

Please address :)

Alex

