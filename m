Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3624BC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 17:53:19 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.35077.1704217995760450251
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 09:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PhE21g47;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50e7b51b0ceso6071447e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 09:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704217994; x=1704822794; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9OLZhtfB7YlQnMRRrYLTf9g0RqVob/hEC+bUhZ8TGrs=;
        b=PhE21g475YlgzeXwsaLFyhah01IOG0mBJ98ixMOoOENkrUKr9pbOURf/d/r9tX4oqB
         cq39+FVNFDpi5pllwO8ZyMj6L2MKAnSn0RDxCZcyHLtqTcLdh+EiZvAtZPIjjcWBUp0f
         PSHI57rxQb+xwKMel7DS7rFEymOkPWUhyrsWug4OKrC+74s59YJO/Rk1GGe1CcHHw4HU
         Y/0kY6rMTEfQyGXSXa27jFm4JtI9SurCq9qSHEogJAOFfMDGtsYYu5JykMtITuG2Y5i6
         U0TbckfMtV+UnOgfd0abCkqwqFOyxAE7XxbjY6hSdDN4nRR8ZoUnis6O3qaQxfC/aPm8
         2Sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704217994; x=1704822794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OLZhtfB7YlQnMRRrYLTf9g0RqVob/hEC+bUhZ8TGrs=;
        b=LQYTBH3RHlp6F7TKhBhKRlI9K9/HS1TD+5aqISOtCI5ik6EpTHVJxhGrmlwxxp4lDH
         gpf5mvMzx9z7oTtyTzB2GMSdlhmhHEk0mv6E+Qdy8UgrxvbZxzpb7W9UjSM5WzreI0Sw
         8td1p9Q16HrE7SOz3IMSRb36aE1vjYihgR/yt9WNCfmO36T16jYSF0Xp9N5jsmocaaCb
         cS5azN9nVoKzuSA30fqoUlS3CITe+0dLY2hYGYEUlEz7OKz+SqwbzzoODmdGGxS7Ai/L
         Ypg9qE0dudoeMuLl4YKAc5gSq+kqNupGiMLwIZUReYf+X+6Db+NvL1RfbEndyanX7hmd
         p8Lw==
X-Gm-Message-State: AOJu0Yy3CcRtepr3NJhojseEgdFz9UeVOiH66DvMFcNHvZODHU0P2NLB
	XotMC/it1jJA4uJOWH98f3eVR9ZYmhUqlzuhsoY=
X-Google-Smtp-Source: AGHT+IHCU8p9k7m7fBaxlhwmCFLCvUdz82Vbtow1N+M+d2MIE4Y5xUqlHeun8AC1uC5LmCDepMoOWUGau5BGx2gCo/g=
X-Received: by 2002:a05:6512:2382:b0:50e:9357:2ddf with SMTP id
 c2-20020a056512238200b0050e93572ddfmr3526989lfv.17.1704217993814; Tue, 02 Jan
 2024 09:53:13 -0800 (PST)
MIME-Version: 1.0
References: <17A68917D46BD8C6.19767@lists.openembedded.org>
 <QIXM6S.ZGI08VQ09CW21@t-online.de> <CANNYZj9Lfxtbh+Uc05xbNyC5PuHX5S51tvVBPV7H50eMUSuKug@mail.gmail.com>
 <K9AN6S.UGINW8B1ETV41@t-online.de>
In-Reply-To: <K9AN6S.UGINW8B1ETV41@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Jan 2024 18:53:02 +0100
Message-ID: <CANNYZj_0UnYB6RUkMcxEgWhhcRxaHCBB1cExKWiaQRdYMaXCUw@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH] utfcpp: add recipe
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 17:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193254

So do I understand correctly that the two upstreams mutually
contradict each other? Can you file a ticket with one or the other?

Alex

On Tue, 2 Jan 2024 at 18:37, <f_l_k@t-online.de> wrote:
>
> On Tue, Jan 2 2024 at 05:43:31 PM +01:00:00, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> I wonder if we even need a separate recipe at all. Perhaps just list this in SRC_URI for taglib and copy the needed file out of its tree into where taglib can pick it up?
>
>
> https://github.com/taglib/taglib/blob/ef013b76dbfa8a5d8e5027d6c285bc9699f71208/CMakeLists.txt#L153
>
> taglib currently only supports cmake for finding utfcpp. It would be  possible to use gitsm fetcher to get the utfcpp code, if the recipe gets converted to git but also for that case it will utilize 3rdparty/utfcpp/CMakeLists.txt to install it.

