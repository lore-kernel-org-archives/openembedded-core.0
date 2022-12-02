Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5125C4321E
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 16:06:52 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.79462.1669997203185692844
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 08:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VGgXD7Jy;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id l42-20020a9d1b2d000000b0066c6366fbc3so3185659otl.3
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 08:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YR8MeFiKWqBRoCq7Q+07tWHruFwGHp05RLy0MHZ+CCY=;
        b=VGgXD7JynFRFKdIKxvIg0yMv0EhypDVuW7hT30MSiAf1mGIrNgdkfxBKBLebIJxYLo
         HiXKYk5MI0EUkk0uHwuZ3LNAbLvlABmG/MZ4DtYS2A6EUQ+BDdlVy6nuNMnPlTrnSNXp
         xLSNh/cRtZ6MQTR8B8l4C834gpoGaKhiqaOQMT18UMHEPOqRU6i4h/cDkYUrZv1hJRfj
         mlfvaOvB57mPqkcES4+j1HH+jk3Gudpg7t7dqJNC8Q1j1+FpIz1YoNYA395EJtFnHFCN
         pRvp022RBfQqif2GKMp5g5UG+L5al9D6Jw1VWdhRLRmYhC1MfRB984pzw4BQ8/FWWN46
         Mrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YR8MeFiKWqBRoCq7Q+07tWHruFwGHp05RLy0MHZ+CCY=;
        b=BO9fKp8xKJwbUZ/gPSXXJS9A06PCCeu6Ioy2HUYZXFDeFd0shauUeREzEsPhPxs+48
         eXaDlObJyMdJTzxtZyCitmDbxb2n27MT+q1JsRHR27woNLo2nbY8NQCfDVsSSER0IVXf
         LrhsAHdG4ufwR0mE8oSMFFvOfwT3pXcB6KHyJrmn9UHmNjRxa7GA2dmfXGbnzwLsw97P
         0Q7/+KyuW/sEmc4wsBer6IftwsSHif/8YDU7hS8lY7jSHIJ0qIb+w2Z0e0PP8G3p0Smm
         zotPBAePjqzXRJrG0k+lCsMhEQtpQpsf5c56dQcFZetrbU/6NF5pcOugE65cq49xRX9q
         Ykzg==
X-Gm-Message-State: ANoB5pnKsgNXwWoXtVUSlq4p6+5ItN/JO5j0inClHW0yxzhESX0RH8kr
	z44oL2XeEUV/qYX5Igr1pPIlphAZo4iW1+o8tgM=
X-Google-Smtp-Source: AA0mqf5rpToXbQmbIfRdTFfFWjWzLEanHSgSjvI05kxyDhb5/hCLaYdDpLQHDnwUWr39XtU0FgLLYuBni35aq5wK3HU=
X-Received: by 2002:a9d:6486:0:b0:66d:ca7a:8b1a with SMTP id
 g6-20020a9d6486000000b0066dca7a8b1amr26834126otl.55.1669997202329; Fri, 02
 Dec 2022 08:06:42 -0800 (PST)
MIME-Version: 1.0
References: <20221201173942.1218836-1-f_l_k@t-online.de> <CAMKF1srMw290_AT2_dmHYXnCoZ96JNbyVC56-nw9a+E_Df6Ycg@mail.gmail.com>
 <BW09MR.QR2T5EVWARF73@t-online.de>
In-Reply-To: <BW09MR.QR2T5EVWARF73@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Dec 2022 08:06:16 -0800
Message-ID: <CAMKF1srzs3tr6q7tCVwPfZth1nML0D7+=H4gwURBEqRBFd+vKw@mail.gmail.com>
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 16:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174239

On Thu, Dec 1, 2022 at 9:36 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> Am Do, 1. Dez 2022 um 11:44:16 -0800 schrieb Khem Raj <raj.khem@gmail.com>:
>
> build for qemuriscv32 to find out.
>
>
> mesa 22.3.0 did compile for qemuriscv32 without errors

OK. Thanks for checking.

