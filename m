Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7718EC001DE
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 13:49:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.43099.1691761761878149951
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 06:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=haPTBely;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-3fbea14706eso17501915e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 06:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691761760; x=1692366560;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LWd7iR8FCAVirfKoGgTVmmH2412tlxXKkH4lZrkPCrs=;
        b=haPTBelylCpAIjMA++Rxyj8vTEKgBXmvhF7Xp0UWvhRDMf+oksiYdf/U8IU2Th7Tza
         Bvn5c+l+TUPBiGVHTiD+T/s0+PB9XuHTNXxH7VF1XSabSarWYVkbCyF88liIr9jk1s9h
         NtWf52N1ktV+kTXoDmpGLtYdQ9qYMKDkLcFQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691761760; x=1692366560;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LWd7iR8FCAVirfKoGgTVmmH2412tlxXKkH4lZrkPCrs=;
        b=PbAazReAgDAx0Uc1fZjXp6mPX0RaRBXakG4bcZXmrxAvsSr4m3JlYcF/pFP2ouE3aB
         kL8a7ltS8MUWtNNgp5Uvt+dl/eUcROi7hXDHrw8FufjFBFtnLZyxHihnVhF5P7AFveRc
         BelMUwqsU6jUBgr8oCR/xxbpIGtSn2ZPdO4AlAIm/VQmjwoPwveAry1Y7xSWrJMgWjKr
         Wv0YsWQrgapRPLHynAAY/Qk+/x1ZDyhxB08bLLSef2q/SRxrfcEGRkJLbzChfVQHW7J8
         jtB4A6RTs5gHtbL9ljfwreA1iDXItE/em7SqjNNYEs1yTAf2ijH9nq29314REgxMaXwA
         DjPw==
X-Gm-Message-State: AOJu0Ywl8mbYnVAl/WigKQzObyvCl1Yem7LthMNcTitiKo4n/NgXopaC
	wILhn3D9RO2Ob+Y0Jea+5Q6OpQ==
X-Google-Smtp-Source: AGHT+IGJ9ecbgOm674N9jFt/+kxFfcC+IquMV9v3RKizmtGcnPacw8ishX0kM8eiJedboTqQ5lJzDg==
X-Received: by 2002:adf:fdd0:0:b0:317:576c:285 with SMTP id i16-20020adffdd0000000b00317576c0285mr1575741wrs.7.1691761760246;
        Fri, 11 Aug 2023 06:49:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:abc2:839a:7473:990f? ([2001:8b0:aba:5f3c:abc2:839a:7473:990f])
        by smtp.gmail.com with ESMTPSA id e11-20020adffc4b000000b00314427091a2sm5498425wrs.98.2023.08.11.06.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 06:49:19 -0700 (PDT)
Message-ID: <ef79f3ac2155891e59a9eeef14e8798842d70a79.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] recipes/classes/scripts: Drop SRCPV usage in
 OE-Core
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2023 14:49:19 +0100
In-Reply-To: <CANPvuR=4dx_Ob_g9wgLHpi+sh029Ge=RGBVko=5eCf0znVkauA@mail.gmail.com>
References: <20230811133541.32176-1-richard.purdie@linuxfoundation.org>
	 <CANPvuR=4dx_Ob_g9wgLHpi+sh029Ge=RGBVko=5eCf0znVkauA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 13:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185844

On Fri, 2023-08-11 at 14:45 +0100, Jose Quaresma wrote:
> Something to warm the user about the usage of it on existing layers
> around will be useful=C2=A0in my opinion.

It is harmless but I'm sure we'll reach a point where we do something
like that. There are also docs changes likely needed and so on.

Right now I'd like to get the patch series exposed to the real world a
bit as I'm fairly sure there are some issues going to crop up with
this.

Cheers,

Richard

