Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDCAC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 12:37:37 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.20991.1702557456443975631
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 04:37:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VCv2Uadc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33635d11d92so1605788f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 04:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702557455; x=1703162255; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wFxsgB94PUuNbyeQ1J+nquEoDW35NeAS5uhO3lLgIQs=;
        b=VCv2Uadc/Vc0AqnNx+sp6nJqRLwL09aSC/ph5oMk5NRDSxK0+hNu+wdj00xIQdu+Kl
         FlldqgPfJlchLBWG05XythnnQGMESnF3OxErm55qrh0qoXdAOJUFH6zB216y6DVlMt0W
         SYiEcctc8G9ORvvX2QadkWfJSVCTvM0kwyLNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702557455; x=1703162255;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wFxsgB94PUuNbyeQ1J+nquEoDW35NeAS5uhO3lLgIQs=;
        b=Pq6+YVqM4IhKB2uKY6RPM5AoozO+SVOb7J5iLy6rsKL6C6t5Jiguhi4KfjU0udTqQm
         GhBZJs3eHsW/+3tPNhXW/ac/LWgCoyPORapizaAyGJJC8sTVGFBVf4wkUF3CiQFTVvY1
         aCs4b4rCS7iM+CIK2Fbszaa8maYXmgIHYG/JS+PezLJ2ysO6j19Cypai+UF7hmqE7gFE
         h5FZ8uEpucEapKU8KscuTUzyh0h88SMIHZECly7jC3YOijwWKw/THx0QcVdXAbt32nPU
         Q57TfGfiTyLvN8bQOJdq/+uH3tDmiqfvgijEuLMzEsB6c13xkpycA4ApTJv3PwEeh34d
         hpsQ==
X-Gm-Message-State: AOJu0YzblJLOzgjP/e8aQpI3vOBWM+/RbpTD1qbc2RVQlMyupwfIi2hn
	xohzWM/HkuaqJan1aWHQnPkPLg==
X-Google-Smtp-Source: AGHT+IFNuJvpFlEwWXDtK1kElLZGZj1gE+I7mfDfJByCATqfcsddgKaMfnn70eOw2Y6FW44XNk34tA==
X-Received: by 2002:adf:cd91:0:b0:336:35bd:be99 with SMTP id q17-20020adfcd91000000b0033635bdbe99mr2513396wrj.12.1702557454876;
        Thu, 14 Dec 2023 04:37:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e972:7f32:1182:98d2? ([2001:8b0:aba:5f3c:e972:7f32:1182:98d2])
        by smtp.gmail.com with ESMTPSA id j12-20020a5d452c000000b003363db0399asm3988741wra.94.2023.12.14.04.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 04:37:34 -0800 (PST)
Message-ID: <ff1629d4d4fef4f3e8db9bad3fad4220d08f01ef.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by
 default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, 
 openembedded-core@lists.openembedded.org, Tim Orling <ticotimo@gmail.com>, 
 Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 14 Dec 2023 12:37:33 +0000
In-Reply-To: <CANNYZj9umd8trnf1BaBC0TBxtE44oYzkHUNAmVj+is7mP94Tnw@mail.gmail.com>
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
	 <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
	 <6cfb111def75c0f1549e7f004deac4e8a44365cf.camel@linuxfoundation.org>
	 <CANNYZj8iD+LQRz8Sqb=QbYEXd6W_rnXz11pEVmzk9mGFKywfyA@mail.gmail.com>
	 <7924018e34e7e6e76d5e1be046e8aa65481e15af.camel@linuxfoundation.org>
	 <CANNYZj8bin4UjXK=gj-aR35t=ajQmNFsD8LKsiX_7x2-z08fYg@mail.gmail.com>
	 <32526832f7e19b83551e786f0ab185cf7b879d1b.camel@linuxfoundation.org>
	 <CANNYZj9umd8trnf1BaBC0TBxtE44oYzkHUNAmVj+is7mP94Tnw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 12:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192364

On Thu, 2023-12-14 at 13:34 +0100, Alexander Kanavin wrote:
> On Thu, 14 Dec 2023 at 13:30, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I think it would have a huge impact on the throughput of patches :( An
> > hour or two before the majority of the tests even start.
>=20
> Then the only remaining idea I have is adding more hardware. So that
> there's enough of it to rarely if ever have a situation where several
> builds run on the same worker.

We are in the process of trying to work out which direction the
infrastructure will take as we are due a hardware refresh FWIW.

I do still also think we need to take a look at the sstate
matches/mismatches...

Cheers,

Richard

