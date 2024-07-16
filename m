Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EF7C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 08:53:29 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.6499.1721120000920408811
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 01:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GDgrRn+s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-426636ef8c9so35021895e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 01:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721119999; x=1721724799; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F8a9GOcAdn8rsi5HB7Vc8KDti9snW8leyDOkygSGP90=;
        b=GDgrRn+sQSl0lfocvj7rohk4p/rdLbQzCrpT0KGr0eiDSBamxC4N7L7i5d3CMwwlXs
         yDtM5ZXSsPuTLTHZCOAMId8fKn4aq8tYBIdCaEnCdEkSQSj+AiAlogilQ6+WIA/LuLZX
         kifWZKNNXwCqeL/QbHkYfDHSUiOdOqYNUICzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721119999; x=1721724799;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F8a9GOcAdn8rsi5HB7Vc8KDti9snW8leyDOkygSGP90=;
        b=VUDbelWRXvSVItFJVaW6Bznl3AxQdqZZRDyDTMATJDxqDoPWyUqM3h/eYbFsQzX0vI
         qTPhCX2HWyb/Swtm98Uy7tSyfbs1GWXIHXSXyjJygkGlFOpgEYsnykUzY8hXKO7RuPxm
         roug5PFNkns4g0T4yMFdsXUs/wVCngWLRKSKyZDh1zeSMiw8UcSNJr09k3tjlg653AM6
         1lMzhFy0rCVWCcN3HHr/NiTFy1YbhRs8N0RLR7vPRsh6Ikm4QctD9br5mm4RXFGF88SW
         DPd8Syz1f5Bd3b3s26klOgfwftMOchl3mWJ7jE9JYfDT50Sfultw2YfTHLFA+CC8sygq
         u2Bg==
X-Gm-Message-State: AOJu0Yx/comCRLRVsLP+Uh8fHpE9tCrap85scyT/6KHrZLjijZXcaWA0
	Cyg2zYRnbsuZvyfhdSljnKkVk1GwnSoasY9s8RPlGh2JBmOc4WdDp4YJa0u7+jc=
X-Google-Smtp-Source: AGHT+IHfO5g8bDh8/0xUwdxfxIPr9WXqS2s+pp7XPYto8/KOI/hWIYoY3fXe9l7Fr7WZECIR6S/Hig==
X-Received: by 2002:a05:600c:1383:b0:426:5269:9824 with SMTP id 5b1f17b1804b1-427ba4a3d90mr11385195e9.0.1721119999353;
        Tue, 16 Jul 2024 01:53:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:86a0:3ee3:878:91c7? ([2001:8b0:aba:5f3c:86a0:3ee3:878:91c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef44b4sm115799965e9.42.2024.07.16.01.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 01:53:19 -0700 (PDT)
Message-ID: <e8520d5c4575c030098a7171cc5b0afb0d161954.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3] openssh: upgrade 9.7p1 -> 9.8p1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, Jose Quaresma
	 <jose.quaresma@foundries.io>
Date: Tue, 16 Jul 2024 09:53:18 +0100
In-Reply-To: <CANNYZj_UaF5VkQB2DaxB_2nDeO4aEckvd92PZpGQo1AdJj+=-Q@mail.gmail.com>
References: <20240715180205.2493035-2-jose.quaresma@foundries.io>
	 <CANNYZj_UaF5VkQB2DaxB_2nDeO4aEckvd92PZpGQo1AdJj+=-Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 08:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202086

On Tue, 2024-07-16 at 09:48 +0200, Alexander Kanavin via
lists.openembedded.org wrote:
> On Mon, 15 Jul 2024 at 20:02, Jose Quaresma via
> lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> > +From: Jose Quaresma <jose.quaresma@foundries.io>
> > +Date: Mon, 15 Jul 2024 18:43:08 +0100
> > +Subject: [PATCH] regress/test-exec: use the absolute path in the
> > SSH env
> > +
> > +The SSHAGENT_BIN was changed in [1] to SSH_BIN but
> > +the last one don't use the absolute path and consequently
> > +the function increase_datafile_size can loops forever.
> > +
> > +[1]
> > https://github.com/openssh/openssh-portable/commit/a68f80f2511f0e0c5cef=
737a8284cc2dfabad818
> > +
> > +Upstream-Status: Pending
>=20
> No Pending patches without a (good) reason please. Submit upstream
> before you submit here.

We need to be a little bit careful with this. I don't want to put
people off submitting upgrades to key components like this and the work
Jose has done to get this far is really helpful and appreciated.

I agree we need to cut down on the number of pending patches, so asking
people if they're able to submit is fair enough. Requiring it may be
something we can't afford to do though.

I am very worried about the height of the bar for submissions and I'm
struggling to make changes, let alone others :/.

Cheers,

Richard

