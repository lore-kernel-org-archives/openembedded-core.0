Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C33AC04A95
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 14:13:09 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.7616.1666707187546461707
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 07:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LHzPyxKp;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id g7so22212673lfv.5
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 07:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xlrv5LVnnAIFR13+V+9xbSlDGd2L0pCyp4eftZ+taOc=;
        b=LHzPyxKpTtq1KEVBytpaX06d+otAIaGgk8mC69h+3W4jaXtnU7fprXykz7BtkAnat/
         x0S+diHK3CwOgAP//JjUo8UNwEvc4+paCzdMMfHcGXCkuMhwwB/F29iDb3EIgXmWHa7I
         ZQTSUrA0PWsiD9ToWnb2zyPinAfrSGLoa7fMaUdTyWMxZelecJJi3QxrJP1WzBsS/PWp
         hDyHcVaqlaSOkVMhjleyLlaG8bCbpBt4vYOF8aBOFumeblJvcD/N6lFJ/DRJB3nO6tii
         fhcWyqXws/1BLdhtdu5m5YufL9zF03sPhD2fQdx2oWRo4mawMlyk5hrPq5x76Eld+3U4
         GhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xlrv5LVnnAIFR13+V+9xbSlDGd2L0pCyp4eftZ+taOc=;
        b=hcRpE5dGz6TX9xADQ/ofn7jtcNmMs8GiUQUxWvz8IzkdVkLXZAm8hJEHeH1s7hLSnQ
         5KyphOnXZhrlXe5ij8+YXpe2niPMqh9heVyIYbpnnK4kxsPcLoxOFiAUbI5KsgG7PNjP
         8Fo49yK5d5uz4XVo6PbBGjHZJCEq+BCwn4bOyGrEFT3+Hku8huGKHT4hMEb6uPM+FRQq
         M8YR9Pm00VPDdIorcbY+wnY/8br6TQY/UwUb6F3npuQNXdNWJew5n3Q+gGioyeLdneuw
         Ebrl+hReb+pDCsRRkUo+3p73jEDihGVSXH2t6+h2d6Oi1igQ0Iky4GyJ8KoeQbTgtF3/
         mZ3Q==
X-Gm-Message-State: ACrzQf05tm+Fd4AxxoM4UWXQTRLbM1XDQj3d9CA/LicdIk+iMidgC5mr
	4H2fPs3Iq5+OmkBfYyoXaX7MC3LkbnO9UmoN29Q=
X-Google-Smtp-Source: AMsMyM7+wbTMPi4TL9P5s7IpsD4qPwBHdFMC1sxhtrTIXxcr1yw8TiZfKbPmRgkNMUJpcebDbdf7QNn28qyfbQhKsVo=
X-Received: by 2002:a05:6512:398d:b0:4a2:7d72:8629 with SMTP id
 j13-20020a056512398d00b004a27d728629mr13378686lfu.445.1666707185609; Tue, 25
 Oct 2022 07:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221006202339.24899-1-geissonator@gmail.com> <31059.1666705482958328555@lists.openembedded.org>
In-Reply-To: <31059.1666705482958328555@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Oct 2022 16:12:53 +0200
Message-ID: <CANNYZj_JA2DVD1GBsQ8p0y-a4GWOot43vAiEy_533684kwK11Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: add support to build on ppc64le
To: Andrew Geissler <geissonator@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 14:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172131

Patience please. As written in the weekly status emails, patch merging
is on hold currently.

Alex

On Tue, 25 Oct 2022 at 15:44, Andrew Geissler <geissonator@gmail.com> wrote:
>
> Hi, anything else needed to get this one in?
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172130): https://lists.openembedded.org/g/openembedded-core/message/172130
> Mute This Topic: https://lists.openembedded.org/mt/94166389/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

