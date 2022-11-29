Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B2AC4321E
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 13:45:08 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.149899.1669729498411983289
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 05:44:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kaaKspQp;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id bn5so17089035ljb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 05:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pc237YXRIj2C0DrzmzcTs+aLovyCg/ihQ3sDO/qKNT8=;
        b=kaaKspQp/FgFo4/ZLdPJ6w0/hIbURll9UW4XQ7100+wCOwIxDyUPlsBzKA8qTVrt1R
         LaNmldx92UDkGMiDPoDnmULDznxKGxqhJVmX0a2l/PIuJEtpteeZQNgVosE/0noy70Xy
         rhK73YKlh8UJnaMqZ1WsIV/HpU2FW1ZzYbF9IMUuBPB6ZIaBPYBoEDd9T9k6YLwz8gXi
         obujSec4YYTCVeoWrRXMXdVV8/sz9doIRo6XdVDvmFHgpnxuARIwMIU7gUvgPLtWhjbO
         MVZ6EnGX867Y39kKvN4RQ+2DUeVGGlNU6vYiXz8hCJaeEwSUo3+oDZ2Bv4BFF9f1a1JF
         mxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pc237YXRIj2C0DrzmzcTs+aLovyCg/ihQ3sDO/qKNT8=;
        b=aLn6SQw9T54nOSwpcSYXnRaarcI+0xIxzdi9kd6hTRP6BklvcL7HyfquBUKu4slJlV
         ir82x3NmW0x79IzLFGvq1Bw2fTNx+L/ZpFfu/xd1CErVkPiwlU6c02SFFQTUe/8hQ9xT
         CZVDpYj96MHZbyfwyYKGHdbOKFMVyxz429zFCtlZzrTlte2jw4Jly5qgxoZDfEE2Xrdm
         xeStvm5Jtvq8r6acdWXSuED5XqhBxmyv1LT50h2KdAlzB6ly+HpMqGAA245QsLPO5Jin
         11XXjFm4YweK+/sTgbZKwEd4ZPRoJifj/ZNJZK3JJBDBomghezwJgEUHf2nwNNJn584T
         iDMA==
X-Gm-Message-State: ANoB5pnjnRnQnfqnXEQSAJLS8oDgn/Bq4mg0FUCAI793zbnnw6kc/H11
	Gduc0zvd/mOUWUUYo5GIdPJDQhl83RYIuwmaFjQ=
X-Google-Smtp-Source: AA0mqf4fMLppPmp3ty41N6l2gGp5a68lQ2Sl78GiAu1f5Kz78UQ8a8ioePlsVjpqdH4zsjbF9PnlTt7Lqg2+of0RxR4=
X-Received: by 2002:a05:6512:25ab:b0:4b4:d443:6550 with SMTP id
 bf43-20020a05651225ab00b004b4d4436550mr14990380lfb.393.1669729496504; Tue, 29
 Nov 2022 05:44:56 -0800 (PST)
MIME-Version: 1.0
References: <20221129122302.14589-1-reatmon@ti.com> <20221129133601.GQ22689@denix.org>
In-Reply-To: <20221129133601.GQ22689@denix.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 29 Nov 2022 14:44:44 +0100
Message-ID: <CANNYZj9PLN=YmbCzn9YEmFhr-uvt5gXpW-qgYKytWNe8jLER1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2][master] go: Update reproducibility patch to
 fix panic errors
To: Denys Dmytriyenko <denis@denix.org>
Cc: reatmon@ti.com, raj.khem@gmail.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 13:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173971

On Tue, 29 Nov 2022 at 14:36, Denys Dmytriyenko <denis@denix.org> wrote:
> Should be specified here as:
>
> [YOCTO #14976]

I prefer both. Clickable links help.

Alex

