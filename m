Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA282C48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 16:14:00 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.27379.1709828038465238918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 08:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f0b8E/ri;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51321e71673so1122368e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 08:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709828036; x=1710432836; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c2v7BJIcRF3g5d0Lmdjs3uk0nbhX44jwY0n+lPKCHHI=;
        b=f0b8E/ricryCAvketLrRioNTwctbHxw7E6K+/ehpm3Y0ZsDfdWFPyVAfdMmu8gyweJ
         AXMY8Ca+HlE5aV3lLesEIjyLmhRY1C/tDkEOiJDZuimDVDAYw7ldwojvsuFGAZHzn5Uh
         YwKFZL+jjhodzIv9I9yoV3j5k4o12xEQlDZI1GOjH4pMTTmG93jd7uBu9L3nqR3PUWoR
         HGHmKS+bWSXUL0W3v7XlnaE2vanX2ii8N6LWI2rLs4cxQAuVOxwm0Q8SYOY1mLRSyMqX
         2Q9eWyw1/rUsMKmkbsYfdRJloSZnwTaThqJuvPV8NJuWP1ta8ppxFMHwzhrrHHwGajZU
         mqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709828036; x=1710432836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2v7BJIcRF3g5d0Lmdjs3uk0nbhX44jwY0n+lPKCHHI=;
        b=df7u5qqsz517/LHxk2aEKxK5TRaxbTP8mswGsTpLZcQUcEPRRwWwJL9/0sr0ZWThqE
         YER/IYXwvvujsOutZlTdCVuwFFpHqemTlVvAnvShJCVUSrqd93qVRlNoeauqoEpKu1MJ
         84fTNU0vosFtvfwYffj1M/zV6tIszmKZ3Rn+xT4KbJr3ZnLNjQylEga2SaFin5ztTAMx
         8FsCrp9ckNaCWL0e1IRIDbzrDV4++kQfwsDuxUeZ+vo4+wBAr8kkADuq7lu0FMhRArLd
         CUX6cUdm7RKdVFB8TU0ttsDXp6zEGb6OPTOpteJ4GqU/RnXPGDwVMUglVHOZj9S7Ue/a
         GTRw==
X-Gm-Message-State: AOJu0YwN1tDjfGrl+GyYL9pI/pZsvzoutgj2nbmJz786u3cyp413Zhqf
	2X6kUeBI7l9t3bhWd6BizoUla5x59vfbW3dCqOTJokdlibX4lRBbnOPxqaHRFcVog9ldL4wwvg8
	7/lEEwfE23U+eX+hUWMJFxJ8W+MUTHpSZ
X-Google-Smtp-Source: AGHT+IGUjVs0+4mrODHnUZS5EhwHkvEcYAY35gxdy50TLmd24hCT1Rl2iZ3kvZLPG5C+ZeBY/zoHnzye2rR29u2q1jI=
X-Received: by 2002:a05:6512:3f2:b0:513:1c35:a23a with SMTP id
 n18-20020a05651203f200b005131c35a23amr1361078lfq.11.1709828036362; Thu, 07
 Mar 2024 08:13:56 -0800 (PST)
MIME-Version: 1.0
References: <20240307134316.3047342-1-tom.hochstein@nxp.com>
In-Reply-To: <20240307134316.3047342-1-tom.hochstein@nxp.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Mar 2024 17:13:45 +0100
Message-ID: <CANNYZj8G27VbzzQ8Ab7LK77YrEQsxR0roL8Ci2GbkgicdGiA=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] bmaptool: Add bmap-tools runtime alias for compatibility
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: openembedded-core@lists.openembedded.org, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 16:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196804

On Thu, 7 Mar 2024 at 14:43, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> +# For compatibility with layers before scarthgap
> +RPROVIDES:${PN} = "bmap-tools"
> +RREPLACES:${PN} = "bmap-tools"
> +RCONFLICTS:${PN} = "bmap-tools"

Only RREPLACES/RCONFLICTS please. Do not add the obsolete RPROVIDES.

Alex

