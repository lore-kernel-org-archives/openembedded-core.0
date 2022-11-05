Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D9DC433FE
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 09:18:12 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.4378.1667639889644287726
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 02:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gvCf/w9P;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id u11so9463378ljk.6
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aP/7J07wvatr6Nrm5CUf1kon046HHPKmXm/ucqXb110=;
        b=gvCf/w9PQxpo0X91sh4/ZqUS6vovmHyYteMsIMyh/T7y8fpI1shxNWm5ajzdoL5fCk
         7TrrRFe1J+tIgVy0ZUorNkyHPq93UfC/xgnZ7iahcRGsfSmvWuCr0A1Svs6PWqv7yQRA
         T3ipP409iOpUzIj9Iv4sSRPU8MlUvCj1/JFH+RxyN6Yay/SJSetPRdDXKgkKH8Bkxs7u
         yDWj5hCMdD5SiHEXspTOnVwOkaRHiSG5t41HJAvgtn+/c1crnbQSF/7pgo9Rczik4zlD
         7GlMTyPikdfrgRvpLUo2pOfiZlFpM0/eC++EvGerLRF8RFGd4qbpze2IKXm6osz9hLj1
         yYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aP/7J07wvatr6Nrm5CUf1kon046HHPKmXm/ucqXb110=;
        b=C9pLV0Vov3K5MANIt+a8QXs59wfzC42SQB9xWtZfwEm6nuZ77MMAyN49rBonvBehP2
         /bNydIIoEgmwMTUmfTauhrH8T7OwW3Gs+TNARNiXcpaTQDZVLTMFqCzD8roxLLnzrTzF
         +Y4/LR85GWQ+R/Hq9+yeQtVSq5luzFod3GmUPIYsGS7Ce3waF/njfAEUEd8OI4yNIYKP
         GCOctPQfdwawskQ/kscoMxb1M0XJaRVIjR4mmrJXW64S/HmXnzUPN5lI5FTiy4SjwC0A
         PtH9yAYfuDMyNsUdie9il+FBM7PISiyJh5jRWnVTSGGRcULWoTTyuVglGgY1YQX/A5FO
         p9vA==
X-Gm-Message-State: ACrzQf2du5+9M2zPuvY5/8clrA8vUsYos11hztIfxPDq0K0hx56/PyHc
	sr0vItVWVacb9/LUysCbVO0PHhggC+8aStp725c=
X-Google-Smtp-Source: AMsMyM6Bra5cg+9ctuLbrZgQTN9DvO97BJwj1dxaJHwv/lFbbgZH5vpIqZ59rqng7xr+mq9FwUuNxBp/B3uyDRwSTVQ=
X-Received: by 2002:a2e:3011:0:b0:277:3a99:7a49 with SMTP id
 w17-20020a2e3011000000b002773a997a49mr14798983ljw.217.1667639887622; Sat, 05
 Nov 2022 02:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <0nTq.1667610027879668653.vTz4@lists.openembedded.org>
In-Reply-To: <0nTq.1667610027879668653.vTz4@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 5 Nov 2022 10:17:56 +0100
Message-ID: <CANNYZj_Pao8U0goh28E9bP2kz0S9+xphuJo=EQ9jmN-eN_ET_w@mail.gmail.com>
Subject: Re: [OE-core] Can we request Python 3.11 in kirkstone? #kirkstone
To: Livius <egyszeregy@freemail.hu>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 09:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172740

On Sat, 5 Nov 2022 at 02:00, Livius <egyszeregy@freemail.hu> wrote:
> I week ago Python 3 was succesfully updated to Python 3.11 in Poky master. Can we request to get it in kirkstone branch too? There are many new useful feature in new Python 3.11, it is faster and better in sleep timing.

Major updates like that do not happen in stable branches directly. You
need to create a mixin layer as a branch in this repo, and backport it
to that layer:
https://git.yoctoproject.org/meta-lts-mixins/
https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS

Alex

