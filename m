Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B03C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 18:31:28 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.825.1678300283247133350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 10:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IZAC+iCC;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id s22so22500009lfi.9
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 10:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678300281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yz4C9sgnZf5FAo/VE4rjGgGHpRUNajsYYFpGdHQculE=;
        b=IZAC+iCC3muacK61o/ZBLY2+GXgGdveINe6R7t09FuqAHh/0q0FmVG9/g0O3Zs8Nfn
         O2lDo3KaEJ2MSVC3RDqrFI6SCnIh+mZs717ogB0o5Db9+VSRiT9iHlR9/ic745JqywQU
         62fwsF/BXA95ld6BH6Ial6E2jVUAWugUeXBIEaVOIFLMTTxckCpDODuGzxSXK2UZ45Mr
         lGnFEdc+EIkJyjXZkBv2pAfC4Kqze1ojTkJ2dDoLimvpfe1n68HYn2zPEGuHBsvJF+qe
         byVr+faHCR88twYFohSxTAMRGaEVlh+BYNiYc4Ceq+A+BbG/8GQjUsetU6k8Mf7c/+VB
         c4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678300281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yz4C9sgnZf5FAo/VE4rjGgGHpRUNajsYYFpGdHQculE=;
        b=WgGSM2ZUxHETnMoZlWFxumrFqJlMZPJlvRi+J+y/ntSOraPlbJLcCj4XAWCG4ABDkg
         o9LtGVDTwKgH8qxUqMmG9ftfnnvny72mwg6wX5AUk5xe4ADeiquNS1bEkbSEKG/OZCVt
         yNaTw6F1AL68KQpUchEqGGjfXQHMKLom0FPoI7B/6dZQaMbVK/DKmCxDsxvAleHFjCSb
         5RJ1fXm45iCiED6rxhOXzFrsByo/bP2hgO0X8nds1SAz9hmqOVB/cg4BTfPVID99+b8h
         pw/LTWkwOiBRSzK0OnmYG6QBw52nxEcCEL/yvaVE8d1VNx8LMIDzf3lyzGWSx19YW/rg
         hHlA==
X-Gm-Message-State: AO0yUKV3k4Uw5LFEehNyKoBkI8udugBP0K3VBUj3nHztlZ0kJfB1YebN
	yR7vmE6RTxzAVhE18daYp46dwP6IqpGUbaJwNyA=
X-Google-Smtp-Source: AK7set8PLg0JjoxS8iG35MHs6Lq5yz0qccrb+0uwxe4MlxNOq7Uu5b/OZppaHjewSAFtokp3B1qPTsn4h1El61E5p98=
X-Received: by 2002:ac2:4884:0:b0:4db:4604:6328 with SMTP id
 x4-20020ac24884000000b004db46046328mr5775314lfc.11.1678300281313; Wed, 08 Mar
 2023 10:31:21 -0800 (PST)
MIME-Version: 1.0
References: <20230308172909.2052236-1-sundeep.kokkonda@gmail.com>
In-Reply-To: <20230308172909.2052236-1-sundeep.kokkonda@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Mar 2023 19:31:09 +0100
Message-ID: <CANNYZj83YFEQ6ZnzfL1Wh4EeM2BtGA+kooTcmsjUp7vDRuA9Qw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: added missing runtime dependencies to run
 rust on target
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: openembedded-core@lists.openembedded.org, rwmacleod@gmail.com, 
	umesh.kalappa0@gmail.com, pgowda.cve@gmail.com, shivams@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 18:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178189

On Wed, 8 Mar 2023 at 18:30, Sundeep KOKKONDA
<sundeep.kokkonda@gmail.com> wrote:
> rust files are not linking on target due to missing dependencies and observed below error.
> error: linker `x86_64-poky-linux-gcc` not found
>
> Added the required dependencies to run rust on target machine.
> +RDEPENDS:${PN}:append:class-target = " gcc g++ binutils"

Are all three required? Particularly, why g++?

Alex

