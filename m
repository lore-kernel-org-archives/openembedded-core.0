Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F8BC433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 00:31:19 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.1754.1658536278726620117
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 17:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GycWychQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id f9so4581262qvr.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 17:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/RQf5PN/4ZzQl3ug/SQHeUNXlxETHQFiLU4oQdTpJc0=;
        b=GycWychQ/hYKDYk1aGKGZR0QbFRY5DHENmhqJPMBbHRBnpShf0ORpbZjS6sSIFXNBM
         qtBYCoRIBUQJcWu0nvh5CRxeOL3KazYRmTEsaL+jaAw+NUrZsm7EK99vp9+1ikiDFs6O
         jINu/MH/tbpJsV7OELEq7iKTxWpaP/XieOEP1Q2o/6puidKGscNbZbBnpa0M/Wd2qrGO
         M6UtLR13+3aSQPKPh3sy5Lty3v8LcW57iS6+Zl1GQnVX0QY7EhXmTfXA6+YSqtvaqZgt
         MhKfVy7yTqNfAHASq6jMmwuFRQR8TBvFQLQ85pYp2IL45e6NjGfh6SMvXMiU4uf3eUfZ
         4IFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/RQf5PN/4ZzQl3ug/SQHeUNXlxETHQFiLU4oQdTpJc0=;
        b=k4exegPxWOV3Ro8TFdEkdglZo6/IsdftKFSqQKc9FfTcybZEot1J27JVsPEkX++Wls
         C6N6NCxHF6dQburC4/tm5Hhu54pgXVeKdDPXwr7KbsT4ua6yarkT+eGsfo1CcD7C4EJS
         4u/2sOKEf+gn6UW8K5S5exrz5fOuggB6GX5oD+j4ecE0ELMPvnSoEQOjbJDOwUx7tDXW
         FyAHy5/ep9t9KpjWnB9s+ShNHbfngfP3HG1q9opEo5iTMzIB7D+HiuplfuYY0ShAqrPg
         N1jZYanqrwTsociRjYm1CAgSYZWFCn5ZT56gQKGjSf3fPbcLqLZj0FxAQwQoEKtMrIKJ
         5DKQ==
X-Gm-Message-State: AJIora+7wFvF5GTLEIwPqDUK2e9znEXOgODRVUXh5BdYQBf8A79Tt5Dy
	hl349T9AWKptt9QFRYcNh9RGWWI1PpaExaKO72w=
X-Google-Smtp-Source: 
 AGRyM1ud1VKEG6KAQaFx9KP/dqID9zM4kjyzv/DFhwEtohKKwoFuyjBJjEAWBxX6BIcLXjhwI3lrM8YZWJHc31HIurg=
X-Received: by 2002:ad4:5ba2:0:b0:474:2a59:3459 with SMTP id
 2-20020ad45ba2000000b004742a593459mr984547qvq.36.1658536277626; Fri, 22 Jul
 2022 17:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <2022e0a9-cd4e-fbf0-47ac-4a8beae2fee6@gmail.com>
 <3600.1658522532283839512@lists.openembedded.org>
In-Reply-To: <3600.1658522532283839512@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jul 2022 20:30:51 -0400
Message-ID: 
 <CAMKF1srD9bQeLwfYDF5eQEMv-t=A6MkiWXEUMX4-i4dD4hG=Rg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rng-tools: add systemd-udev-settle wants to
 service
To: Drew Moseley <drew.moseley@gmail.com>, Claudius Heine <ch@denx.de>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 00:31:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168426

On Fri, Jul 22, 2022 at 4:42 PM Drew Moseley <drew.moseley@gmail.com> wrote:
>
> So should I submit a patch with that change? I don't know how to reproduce the original issue so I won't have any way to prove if this is a viable fix.
>

Does this fix the problem you see ? if it does then perhaps Claudius
can help trying it for the original issue and help validate further.

> Drew
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168425): https://lists.openembedded.org/g/openembedded-core/message/168425
> Mute This Topic: https://lists.openembedded.org/mt/85671578/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

