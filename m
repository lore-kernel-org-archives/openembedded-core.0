Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC90C43217
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 10:49:49 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.10212.1668941380524884565
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 02:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gAHrYGI+;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id j4so14995077lfk.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 02:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atUdm6KBHXqqNWo/5SjkETHahG2jFUI0hvfui7+a4UQ=;
        b=gAHrYGI+dB6R4cH4HUqW8UVKaPl1gclhrre7uOhuhP2mfPV4Q7TPhI9UzQc0u1oiOi
         vrtBnXmqqT+qnmuGpLRnABwJRzOgbwdK7tYRNM2DjSZ5RqopRUGSWbk9X8ycWFJlvfd/
         UUqFt3iE5Kbk1jp9nT5e1ZX7UFn45iGiizhqVoM2s/ky5nO/zbax6VDWOSEHSGe/CYJu
         bqA+rlah8kcrzlOfIl0SsgSPOQRtLcO64R25fxRVtrSx30BsHi2z27dbCFsbGU4OLPCg
         FxOYRGr174p/Dsmf4Vh8XMiE5rkd8ExleFB/2JXd02LbEfXTcJTnAcxb6BDYtI0+HsNs
         3TlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atUdm6KBHXqqNWo/5SjkETHahG2jFUI0hvfui7+a4UQ=;
        b=jap2D2ho5KCmE01pwOjagioJlcjcWBZwi6T5qR6y5HbaPyjHdnvgyJdV1wwvOf+8yd
         oxrojEwvnRCCZEfyhq2mWBH2Hgs36UBMsxExygfw9/fMVkLhTwfcBAdq0RdwUfob6g4Q
         ud5bH+XRTpkgB4tiYzKTQDLPjhsE3VtRoSfRxcZS7blby3L70mbNzXC7hM5eigMRSoBN
         6ijzj/SyVAD+b3QonxC0O4MGzqzNmZWBGZoNSvifIRQvGR95P2KiRpDXuO+DFs8F5XTf
         20fp+iRuY9zD4NhiB6u+3oouZwTguj3HVQUbCB8T6+k4+CRsaFnfHvtbQleQLeM12iT3
         3wKQ==
X-Gm-Message-State: ANoB5pmnaHliqR3C+XSFPQxV3evJ5lhzBwxaGlOcmF5G1Li4XaNYX6Mt
	PuqvIeiyWnX+fGXshzpz0GVPk3kaWXNU2rBzHF8=
X-Google-Smtp-Source: AA0mqf74F7FjsO9+pvHZOcVHzdWyE/UnebT53gs0k4czsKa9w+hWAnZu13gekPGsP0cgO2zKEEAMeuH8BMqlwJ/z3OY=
X-Received: by 2002:a19:5f1e:0:b0:4aa:81bc:dcf with SMTP id
 t30-20020a195f1e000000b004aa81bc0dcfmr4912528lfb.393.1668941378592; Sun, 20
 Nov 2022 02:49:38 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj_UJUJ0QAsbtB7nMEdJ+WD2NPd-soRmbiNp-0gDB2aH=w@mail.gmail.com>
 <25534.1668862264618059714@lists.openembedded.org>
In-Reply-To: <25534.1668862264618059714@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 20 Nov 2022 11:49:27 +0100
Message-ID: <CANNYZj-YjKnAGcDzU6J9mkh9130L95+HgLt8ybs7iXfTp_cuNA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe] [PATCH] rust-snapshot:add riscv64 toolchains
To: cp0613 <cp0613@linux.alibaba.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 10:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173577

Right, but are you actually running bitbake on this board, which
according to the page has only 4 cores? And if you do, what targets
are you building and how long do they take?

Otherwise I am not sure what riscv rust-snapshot is useful for. It
would help if you explain the use case.

Alex

On Sat, 19 Nov 2022 at 13:51, cp0613 <cp0613@linux.alibaba.com> wrote:
>
> I am using a high performance riscv64 SOC TH1520, an example of the Wujia=
n 600=E2=80=99s platform released by T-Head. You can find more information =
from:
> https://riscv.org/blog/2022/08/alibaba-cloud-unveils-chip-development-pla=
tform-to-support-developers-with-risc-v-based-high-performance-socs-alibaba=
-cloud/
> Thanks.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173516): https://lists.openembedded.org/g/openembedde=
d-core/message/173516
> Mute This Topic: https://lists.openembedded.org/mt/95130600/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

