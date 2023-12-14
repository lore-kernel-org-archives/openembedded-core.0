Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07624C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 12:30:28 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.20873.1702557020394996361
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 04:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bVrH8g1a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c38de1ee4so57349655e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 04:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702557019; x=1703161819; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JoYYn5xJGXiT1U0OhANeQi/p04jYhxByx5PyUr51VVo=;
        b=bVrH8g1aBks7lhPXGxtQKNsdD8rs4WEGlHyzbiEIgQpKdhREvuPiEm+lx5ChxvWqEl
         idARZplWihhtXaWWE2LD3tF4Ard8EjWpPNpUIFJ9omof3k1XFk+jUT8rWQBpqk5YcPBc
         uU9pWDJrzhhkElEky9IBWuFKeBm0awAF3ibLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702557019; x=1703161819;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JoYYn5xJGXiT1U0OhANeQi/p04jYhxByx5PyUr51VVo=;
        b=mVaR27sJ3CPXhuv8OxAbPsImGjJl/58Wn8LYDSH65lazhFLf4MJAiIl7XIx4wandMq
         LyPJ+TsuUSeFiUtZch7oHq6WvEPUMrmcjTVxV7NQX+0H2TWBvhOkjyD9BJ94SgM34tDA
         Hhh7S6Y0UicpDONYuLCA7LM59GeTn8iMLsM+VUycN+Y8pqKcBfdt6YHzGn5z1VTn/cNn
         5Ubi2B1+BViqFESjAwZSiCKFimt1y/sWvd+srdTsmZTVyffYX7HKJDhtmwtqUw6N1fds
         lfQiCLxEaLziJSoqGo3qS0jFSrz/FFtE2XX3UVAPc12mYJvU0+usGVZNO4qxv3Gnd7fG
         9yvA==
X-Gm-Message-State: AOJu0YwDl2X3mnH7rze8SijpddJMF7NNqZFokFv5N3OFRsvVhVIMlFoZ
	PFTKG06ERtfiGhbhpKY/uSmOkw==
X-Google-Smtp-Source: AGHT+IHixbL1t8wEQv1Mp8sXvpTz4SmFjeN4Bh1KhoS+jqNt7wEIL3bB2+rA4JyL7eSM1dXqEPKvqA==
X-Received: by 2002:a05:600c:3b23:b0:401:bd2e:49fc with SMTP id m35-20020a05600c3b2300b00401bd2e49fcmr4702418wms.24.1702557018624;
        Thu, 14 Dec 2023 04:30:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e972:7f32:1182:98d2? ([2001:8b0:aba:5f3c:e972:7f32:1182:98d2])
        by smtp.gmail.com with ESMTPSA id d12-20020a05600c3acc00b0040b5377cf03sm26634686wms.1.2023.12.14.04.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 04:30:18 -0800 (PST)
Message-ID: <32526832f7e19b83551e786f0ab185cf7b879d1b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by
 default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, 
 openembedded-core@lists.openembedded.org, Tim Orling <ticotimo@gmail.com>, 
 Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 14 Dec 2023 12:30:17 +0000
In-Reply-To: <CANNYZj8bin4UjXK=gj-aR35t=ajQmNFsD8LKsiX_7x2-z08fYg@mail.gmail.com>
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
	 <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
	 <6cfb111def75c0f1549e7f004deac4e8a44365cf.camel@linuxfoundation.org>
	 <CANNYZj8iD+LQRz8Sqb=QbYEXd6W_rnXz11pEVmzk9mGFKywfyA@mail.gmail.com>
	 <7924018e34e7e6e76d5e1be046e8aa65481e15af.camel@linuxfoundation.org>
	 <CANNYZj8bin4UjXK=gj-aR35t=ajQmNFsD8LKsiX_7x2-z08fYg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 12:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192362

On Thu, 2023-12-14 at 13:17 +0100, Alexander Kanavin wrote:
> On Thu, 14 Dec 2023 at 13:11, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > I've wondered about this. The "prebuild" ends up quite slow as it would
> > involve rust for example and when I last tried this, it ended up being
> > a pain and just increased overall testing times even of the overall
> > load on the AB might have been lower. So I'm really not sure. I suspect
> > it wouldn't help the pain points as much as you think as there are
> > other sstate reuse issues at play too.
>=20
> But is it worth experimenting with it anyway, to collect some data?
> The more we know, the more we can rule out.

I think it would have a huge impact on the throughput of patches :( An
hour or two before the majority of the tests even start.

Cheers,

Richard

