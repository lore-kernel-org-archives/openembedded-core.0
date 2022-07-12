Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A7EC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 15:59:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.11000.1657641581105848221
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ceAb2zz8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id ay25so4990699wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=sj+sDONmeBOELu3v8Y9yE+0kFEaNlYTL/aLlwhl5Z84=;
        b=ceAb2zz8aJS/Rb6Haf201Z0na5lcgHKUwd2rm5ck3/mlY7UKRFqMGTf5f2/nnVoRUO
         JiLmEwGmnwmJ9rEFc//MoyuhSopIVWkpUIccTWCFuRnrVq+YW524cx5tpncVLpe8gRHC
         59Zfrf/J30I9EDZeP684Adl8Q5HpTlhLIaaC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=sj+sDONmeBOELu3v8Y9yE+0kFEaNlYTL/aLlwhl5Z84=;
        b=jSq1QTcpVnX/fF8fP0gOMtoiFtiELqOLc/jhuhLtfvIEpyafci1hbQ5d2kVQOEijJd
         yPtl2SeRKRG6RhE5fTd4yeVTWz98Q904DYQh411j8cr4mc5vhpkHH7vopdRy2RCJJ8Aa
         ZpCXN4FdyOO9ii6djej9QUKS0dNCovpjFbjJJACuA3ZJmDK48OYc3x0vdFtTFIG36s3d
         eEhYPa8Xy3UHnmRGD1BBB/rjHdUy4LQn0ig59VHLvMLRYCKC6rSRpw2GQc+FyXIdL2vS
         XkVgMRdWlRG9i4Ab8WvtoJMI38DrwitHef0QOCSZSda9Iu8jiUDbgWn5LbVMyA96n9bY
         p+3g==
X-Gm-Message-State: AJIora+oETHLndDh20kWGuUcYUYhEsOkF2UP3lq7fDrKBItByHigtX4X
	7csbeqxgnJcQGE+LpxrT8VLsPA==
X-Google-Smtp-Source: 
 AGRyM1sEOUCw3lc5VDskkJZKzFRaktXYBs6uQojkVqaACiBQhRO9AIeY7ciRwQD2cjxu0YQsuenPTQ==
X-Received: by 2002:a05:600c:348d:b0:3a2:d019:2366 with SMTP id
 a13-20020a05600c348d00b003a2d0192366mr4706966wmq.187.1657641579428;
        Tue, 12 Jul 2022 08:59:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:375:1449:b69:de14?
 ([2001:8b0:aba:5f3c:375:1449:b69:de14])
        by smtp.gmail.com with ESMTPSA id
 o6-20020a1c7506000000b003a1a02c6d7bsm13105388wmc.35.2022.07.12.08.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 08:59:38 -0700 (PDT)
Message-ID: 
 <b6e4ab672382fd9866b9140a22b6632055827e69.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/4] devtool fixes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.microsoft.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2022 16:59:38 +0100
In-Reply-To: <cover.1657597513.git.paul.eggleton@linux.microsoft.com>
References: <cover.1657597513.git.paul.eggleton@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 15:59:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167938

On Mon, 2022-07-11 at 21:06 -0700, Paul Eggleton wrote:
> A few fixes for devtool, mostly relating to recipes that fetch from git
> where S points to a subdirectory of the repo.
>=20
> Note: I wasn't 100% sure if it was appropriate to be referencing WORKDIR
> in patch.py; let me know if I should try to rework that.

It is probably ok. The code won't pick up on the variable usage from a
hash perspective there but it would be referenced elsewhere anyway.

There was a failure which is probably from this series though:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3817/step=
s/14/logs/stdio


(I've not confirmed it was the series, I'm just guessing)

Cheers,

Richard


