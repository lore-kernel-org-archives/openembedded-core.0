Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D8FC77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:33:58 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.44776.1684312434330677989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EoaeHO/y;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4efd6e26585so635620e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684312432; x=1686904432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IiCexgcstYnmAbW7tIyQiScjzaZW2GlU66y21txJITY=;
        b=EoaeHO/y5P5vWeZDxtnS+1xMb0rfdiFs6eU4lHZ8lqiKKQ+y+HZvWoWkpQzHqdRNXT
         l46WIjTxdxOY989LYuppTWSsEppwP+4WkyXfQ6POXH5KhAqaxG1Kz3RwQwJBrDYz2a3Z
         DYGQeU+CoknEzy+JdLLbEwgd7nPYz+trSx+KmIug8LcFgrwY5OOfljxut89jECzmOdNX
         vH4FgxWePGBwWM65UVQOAb6Ol1XaDYS1AuoKI3PuGDzv3URYJn10p3WMH04An/0bmwm6
         DhyBYib0GH4oHjertIAG3t7dQc0wwpLzfT+S42M1/+BwdsVsDidk/mwLAL2hMkx6Fczg
         MBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684312432; x=1686904432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiCexgcstYnmAbW7tIyQiScjzaZW2GlU66y21txJITY=;
        b=e3t+iPRpVWqjFUcjz9Sik4R9qtXwOz1R9SK0yzj5ZkdTPhIH28fmAb234/lckT51ll
         J47b3tLyaOA3fbAyf4EEfoIbqld6wGiMbBUvqslLABnjkeXr45O4Pj+1vR8iUwC0JIqJ
         h9c9JUrKS6qZlxVtaGC3AqbGXMTB0G9vNHuaeXXo+IxjubfIsMrz4XqsNkxGjP7qgLkG
         zkY3Dc1zeUAG4p3q4QCbThQ5kv7IfF3l5phAaqv8UeBYVnHblfElly1W0mmIkWwzuuTn
         Y2Fe2c5O8Lp+EeWeb+QsO+nUKGKDlKISPBifQrZpqmHd7F8oVghAhjdmxVHl09QpflZJ
         aFfg==
X-Gm-Message-State: AC+VfDz0TIyWKY8m2pjfuVx9VmRdqfFqLTHsHeU46Br/DY5QL8lzPVce
	fgGjRKx7R0BxxiD0T3uj8YSNJvy8PJf01d/DcAI=
X-Google-Smtp-Source: ACHHUZ6xQOp+o8p8MgAl8g+3XALfECFTWtVC8dVNO2thfQ+8E/DunSJSdIqpQCwzOaAvNaTw9O8EK1/ObrxZEwk89Xs=
X-Received: by 2002:ac2:442e:0:b0:4d8:6c17:8a65 with SMTP id
 w14-20020ac2442e000000b004d86c178a65mr8901283lfl.58.1684312431894; Wed, 17
 May 2023 01:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9UPH2R1y36BdmbkOpSVNCdzEQXdS_aoO3Yfjj7RXVuyw@mail.gmail.com>
 <22909.1684312326470689785@lists.openembedded.org>
In-Reply-To: <22909.1684312326470689785@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 May 2023 10:33:40 +0200
Message-ID: <CANNYZj-kDR5qr7EuPgSs4Nj2S8+=Ge6T1DRq9BWRY2da_3_85A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ncurses: change GitHub mirror
To: Florin Diaconescu <florin.diaconescu009@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181477

Thanks, this should go into the commit message. You also need to find
out why the license checksum doesn't match and explain that too.

Alex

On Wed, 17 May 2023 at 10:32, Florin Diaconescu
<florin.diaconescu009@gmail.com> wrote:
>
> This was done in a similar way to this commit, when the change was made from Debian packaging to GitHub's mirror:
>
> https://git.yoctoproject.org/poky/commit/meta/recipes-core/ncurses?id=dfaabf971b02e33870f9f927e9b1356e05e74a17
> If I only change the SRC_URI, then it won't find the original 79b9071f2be20a24c7be031655a5638f6032f29f revision.
>
> 1003914e200fd622a27237abca155ce6bf2e6030 is the commit hash of the 6.4 release tag:
> https://github.com/ThomasDickey/ncurses-snapshots/releases/tag/v6_4
>
> Florin
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181475): https://lists.openembedded.org/g/openembedded-core/message/181475
> Mute This Topic: https://lists.openembedded.org/mt/98944084/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

