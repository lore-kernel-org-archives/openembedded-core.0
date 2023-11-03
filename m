Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9257EC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 09:58:14 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.47929.1699005490961920010
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 02:58:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K7ycCsRg;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c59a4dd14cso24874561fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699005489; x=1699610289; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5DBewHCHAfNj05NWgazY377NmYoD5AwKzubm2nZ1sQA=;
        b=K7ycCsRgASnmCKrhZ/qP0VeKxBosRMy1UhCq64vJsyAO/Y7fCP3LbrmCTPY8HzF3Ec
         Kq+4z7nBVUVmKb/hPFZ/f3KMKSP2B+2d0PYEGQID8fQtSBFRJJCH4dquuI6fFsqv70HA
         7zXHkz3PM3+2pKLptyec7imOuhbqdP34A4woZGBCmL905WozX8Onw+LKaFNA774o8Qb8
         9ogz/hLHRcVJkt3vn6mXK/zUBLr2Hk3LMxYUS1DWhlTp5jnPch4bLw1xAoIzNKW1liiB
         MqBda+SUJAEdIcb/XX7CNosoH9idlhSaAguw54f0/ZwLWlJoSyvdYRHR8W2ztSS7VXNV
         6hNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699005489; x=1699610289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DBewHCHAfNj05NWgazY377NmYoD5AwKzubm2nZ1sQA=;
        b=i/7p8pV46C9ND4BGtGVjRS6sOn1Ct84gphesexXxvEF0ERavA8SvacKFIec3QvgQ4k
         ez/2cMo1/JWHmwDKOr9vjilYKO02nxn+DTF+ysBONr105JWhNZcp0aC8jo+cx4patYzj
         zBKO4+5lasHt0zAtByGEoPM7IG4ZCdLvirJQNy4KGqVcqVVixWpAzlgsqOvfnRTdIRuc
         rt0bLDpzxoGowwxAo+vygd5mYq7jYQ7i42RLBuUFutZGq1Q9lLihfPLtAmxBDdcCdyKR
         lgoP9SUTkNMftr0MFcOZEnyfuV7F5bajHVHVUkh0gedzdhtkWnHY/wcnbYFHI0p5TR9M
         eBlw==
X-Gm-Message-State: AOJu0YxKj7FWtSf84te03DT+ocLHzYjtvUsJC8YrfbHAsogIkyo1da8D
	5blgEU6R9waZOQ1AWVLvp4dvKC0dOzydCAmFDOg=
X-Google-Smtp-Source: AGHT+IGJdjtYNoLiz6pwXDasHZAXEOhthUITNwj2vj5uj5Ba/ZWfXy+x/cmPHetlaZLyf4qzGy8IAszO1NgPn86BQrA=
X-Received: by 2002:a2e:8ed7:0:b0:2c5:1603:9c48 with SMTP id
 e23-20020a2e8ed7000000b002c516039c48mr18623398ljl.20.1699005489080; Fri, 03
 Nov 2023 02:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <1698996510-30721-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1698996510-30721-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 3 Nov 2023 10:57:57 +0100
Message-ID: <CANNYZj9_VLyhURL8_WpmQFA3t4f-PHL9=ewOSadRenm6nxZA-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography-vectors: upgrade 41.0.4 -> 41.0.5
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 09:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190147

On Fri, 3 Nov 2023 at 08:29, wangmy <wangmy@fujitsu.com> wrote:
>  # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
>  #       Upgrade both recipes at the same time

Please note this comment - there does not seem to be an upgrade of
python3-cryptography in your patch set, and it would be even better to
squash both updates together into a single commit.

Alex

