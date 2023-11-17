Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E244C072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 13:33:34 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.11179.1700228007320708191
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 05:33:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jUdlndpa;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c5087d19a6so24985401fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 05:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700228005; x=1700832805; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LakKiK9pzXHWGiPIszAV2KWHbnup+FA+ojtkeFkGRNc=;
        b=jUdlndpa0/CT2xiL/qR34+syxclxhfEe64Akbz5We9FBfxXslKx/LO7S3WZwLIltEK
         oeZ1l0a3iblTDph2n48EsEpBAn2xf0RHINWNNmjzQKrrblmDSDYESImHsMXXQ4NNbCiW
         gkW81T32liZ1gyKWlpkNPmAJUFsodefCACFehOd+c/1H9ofxvPDKoX7EBVfu7jov8h/n
         iaEugBOm8WZmeUMEM6JJ4kpD9OE5iBMVHSVhIFaWDRzjFFiwFGn2lPqQtkyL/SNO6J3M
         dkEgNG//FLRvzAB7rczMnb3zOPXilRYkN4k7bR/7f3DeHYHwstEbIiQ/GxMI0Rov7coe
         oHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700228005; x=1700832805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LakKiK9pzXHWGiPIszAV2KWHbnup+FA+ojtkeFkGRNc=;
        b=lUdfagsWEDvnK0CdIOFFA59uUZpGww7uI0R39ImWWzFIFbbqFCLRleZ58m7TqluKIY
         l6Pobjnlpml5SEEQ3RxfHtAjDAX2Ej+c0/LUEXw9qWV3EkDBRvpFE7Z2DywR9/sxRJPa
         hE+WMMtjsl9BJk9EwY4+i0qDAJNwq1pc7HrvmSrY2bMsE1EppJ0MnJgg1HpV27XJyQP2
         5DjjuTBpCe8H6BGIQVOga9SC3bvUIdWPHFNVt3ID8R+gihS5xNoCb+vIQtjujBVOkOzM
         Rl951xeg9jkVGBuxPq9ma/DzbGGjNsvxX7Wm0Jvw5gZ5rXoDkaXHSlK3bxlsP4KP+zbK
         JLfA==
X-Gm-Message-State: AOJu0YxG3tG8Air4WUD76Z9mrYw63TBuywtiV83slQi9NTKRNQSr/3Lz
	S3Ct2WJMDXEmx4nCB+6hRIpz1IzbNBwrcU71g6U=
X-Google-Smtp-Source: AGHT+IFDmAUK68v4Z+I+0R1HIX7MaDqOdIH+qy1YiLMzLNgbC009NdP9oFIO65HNkt8pmeKqkykai0kyYXM/yvaIXfY=
X-Received: by 2002:a2e:a4a2:0:b0:2c5:6d8:8dfc with SMTP id
 g2-20020a2ea4a2000000b002c506d88dfcmr9299840ljm.13.1700228005265; Fri, 17 Nov
 2023 05:33:25 -0800 (PST)
MIME-Version: 1.0
References: <0101018bd371ac9e-f3e617c1-3285-42ca-b76d-805f5ba01cac-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018bd371ac9e-f3e617c1-3285-42ca-b76d-805f5ba01cac-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Nov 2023 14:33:13 +0100
Message-ID: <CANNYZj-3GjmxVFSdryznTp6vGnkR673TxH0fUmCLYcA0UkjxNA@mail.gmail.com>
Subject: Re: [OE-core] [AUH] Upgrade status: 2023-11-15
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 13:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190848

On Wed, 15 Nov 2023 at 15:45, Auto Upgrade Helper <auh@yoctoproject.org> wrote:
>         python3-cython, 3.0.5, Trevor Gamblin <tgamblin@baylibre.com>
>         python3-mako, 1.3.0, Trevor Gamblin <tgamblin@baylibre.com>
>         python3-numpy, 1.26.2, Trevor Gamblin <tgamblin@baylibre.com>
>         python3-trove-classifiers, 2023.11.14, Trevor Gamblin <tgamblin@baylibre.com>
>         python3, 3.12.0, Trevor Gamblin <tgamblin@baylibre.com>
>     Trevor Gamblin <tgamblin: attempted=5 succeeded=4(80.00%) failed=1(20.00%)

Hello Trevor,

I'm working on python 3.12.0 update. Can you handle the other four please?

Alex

