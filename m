Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5DDC35274
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 12:24:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.61438.1702643048076866448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 04:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YtOFYLig;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40c3fe6c08fso6628975e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 04:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702643046; x=1703247846; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jdmaTZtd+Ve/jhSdoBiW0dHhHk5UpvI8vsfybWBffzo=;
        b=YtOFYLigDh32InvoJMtgNr/xrek8VIIZ3+fqDBUDv3eK5sumAcV1GgqbbrsWcvEoTU
         h0XvBRCmfaFpcKhwdaOf3JLRsZ1Wq5PlnwnZ6FAOKFR9JLB/JU+QmmgHUYdEx9qQl1pU
         W4XNj9+pfSxFvzunnit3JiWXEO2ejNxvvLpPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702643046; x=1703247846;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jdmaTZtd+Ve/jhSdoBiW0dHhHk5UpvI8vsfybWBffzo=;
        b=p6HpHTt8EQGpSD7HeFZptK0DHGuwj1yCrbon6G2+f8MFwYRHXwUaoke9UeB1viJ0fk
         /fF9YTBZs1ej6fvFYqFEBjB8LpLSuCHh976lU8Ty0kE9M8IXUsilotlQqK9ZbTudzbMy
         5O9lfj585wyjyW3BcIEmb8i4KUPzLnebfzarq39OTU2g5RuXNoQQBl9rR0OyhB74k4Xp
         JhnERX9HXx7VRI93lrzb43JuY7FGTA9DVGXAATeS5A9aZPrg9jZoLJYiA2qcjji8fPNj
         3IfIOpGwTqraSveoQSnXUgpk6vPmDe7D7FzCI2FxiEctXHKNf4y6m2AdvH7vOW69WuWI
         ZG/Q==
X-Gm-Message-State: AOJu0Yxfak/Jd9wGNWdfhE34zMBLM1/IwCQelnIvHe95DHmoeMMl2Pmn
	h65seV/o5UIc1a7TvduA0HgO3w==
X-Google-Smtp-Source: AGHT+IFf+6FVjnS5ph8rTVJqu+9dr9hw5rtaMGERvHuEe6erpl7bNfOX9XKJBwQXMAYSw2oteZ0wtQ==
X-Received: by 2002:a05:600c:4d0e:b0:40b:5641:4395 with SMTP id u14-20020a05600c4d0e00b0040b56414395mr4326466wmp.11.1702643046438;
        Fri, 15 Dec 2023 04:24:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a04:9eb3:3437:42f8? ([2001:8b0:aba:5f3c:a04:9eb3:3437:42f8])
        by smtp.gmail.com with ESMTPSA id he15-20020a05600c540f00b0040b5517ae31sm31028367wmb.6.2023.12.15.04.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 04:24:06 -0800 (PST)
Message-ID: <3dc045e3b2ef9099dd85da35469053ad0384ce54.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by
 default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <Ross.Burton@arm.com>, Yoann Congal <yoann.congal@smile.fr>
Cc: Khem Raj <raj.khem@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexander Kanavin
 <alex.kanavin@gmail.com>,  OE Core mailing list
 <openembedded-core@lists.openembedded.org>, Tim Orling
 <ticotimo@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 15 Dec 2023 12:24:05 +0000
In-Reply-To: <4F557F6F-8492-4027-AD2C-97773A476624@arm.com>
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
	 <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
	 <CAMKF1spsMdx55xzBT9VEb51my-fE4GeLCq5m3do-5-8AKr-BqQ@mail.gmail.com>
	 <20231214193346baddfca0@mail.local>
	 <CAMKF1soTi3X-eZf6+pd+hS3FpTvxSO7kR4ievYgM_F2N_8AVFA@mail.gmail.com>
	 <18825c98-a4bf-4918-833d-a797a9e5ac74@smile.fr>
	 <4F557F6F-8492-4027-AD2C-97773A476624@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 12:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192428

On Fri, 2023-12-15 at 11:59 +0000, Ross Burton wrote:
> On 15 Dec 2023, at 10:49, Yoann Congal <yoann.congal@smile.fr> wrote:
> > FYI, since Khem's patch ([OE-core] [PATCH] util-linux: Delete md-
> > raid tests) also prevent bluez to be built in a default core-image-
> > minimal build, we can skip this one (strace: Disable bluetooth
> > support by default) and still fix [YOCTO #15323].
>=20
> I=E2=80=99m a fan of both.  Bluetooth support in strace is a niche usecas=
e and easily enabled.

I have a half drafted email saying I was thinking of both too! (I then
got distracted).

Cheers,

Richard

