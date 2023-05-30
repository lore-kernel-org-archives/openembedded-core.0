Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7806C77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 14:44:07 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.944.1685457846535709747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 07:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Able6PpL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30a1fdde3d6so4535266f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 07:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685457845; x=1688049845;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OjhKlbSBmMU0tpo+6HWL4aD1oqFnZjgp+0hrU8gOjDw=;
        b=Able6PpLgGd3g7xf5gep5+iHDXEUCEZLQ6ZbEdnvB0+PLfdWty3fJYKoau1MFK5WFm
         7J2nxKPHo3Wl+yBzOF0tArGvn8mQaxr7m33NjY2hQwZjBL6sB6vZ5NOwvLz6AswIoNyV
         nnS8KayzcYQ/HV4sGMvwBrSi3GJODaxYnvfe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685457845; x=1688049845;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjhKlbSBmMU0tpo+6HWL4aD1oqFnZjgp+0hrU8gOjDw=;
        b=kfGf+up0Rec6Afw4uNVNwuL29Z6yd3fiZr3/9nipEvE7EF2ytOj5GsO9X6TPniU1sJ
         Pta+FvRcQRTLBZtiJUHX5jc89xLYkx2fmhKEboZC0z3VgqvOuwSKmk3wbqFYaay4HbuK
         sRhOXMjdJasOT3xTz+S9Zjmb9SXYrAH/CHyM+37pu8ywVG0oFw8i/RkKOn5OZNfip+Du
         aeRvyx5+2AMB7x1yaN56o4bNsGjqHufxxSoIeEF876WGDArw5b/lIQ9aq2ypF3we8bUO
         wwK3BzvvFzS6cqW/MWXd0Jz7JkruDf1ez/xCam30r3yzwZt20PJGyswhiq8SU8isy6kR
         fPHQ==
X-Gm-Message-State: AC+VfDzrzT5LTxlh8cXdUSR2DD9bL0m2ebODVfNIDmzrDZ+pBpxg2Fx3
	PhubKcpS1gMpFcT6JWcRnaelSQ==
X-Google-Smtp-Source: ACHHUZ49AVbdh9LWt4c+qti+k9Leja9a5Eo1mzABMCptrnXQA/b/yRYq84sYhvbjcyOnDgRInjT0RA==
X-Received: by 2002:a05:6000:ce:b0:30a:eada:8b9b with SMTP id q14-20020a05600000ce00b0030aeada8b9bmr1783744wrx.41.1685457844925;
        Tue, 30 May 2023 07:44:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3? ([2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3])
        by smtp.gmail.com with ESMTPSA id p13-20020a5d638d000000b0030ae3a6be5bsm3523649wru.78.2023.05.30.07.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:44:04 -0700 (PDT)
Message-ID: <c13fb9159ec84ab2bb4710a3e59190db61b54612.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v14] Rust Oe-Selftest implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons <frederic.martinsons@gmail.com>
Cc: Yash Shinde <yashinde145@gmail.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Randy.MacLeod@windriver.com, 
	Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	Yash.Shinde@windriver.com
Date: Tue, 30 May 2023 15:44:03 +0100
In-Reply-To: <CA+cAkeoEfQWbQkwYMhAUqQKQXyXcyCYJdoFewWkDKsVW=Mpyeg@mail.gmail.com>
References: <20230530105125.445622-1-yashinde145@gmail.com>
	 <7c9a0a78204958d84c4a3779da7c0f1b0e66dda8.camel@linuxfoundation.org>
	 <CA+cAkeoEfQWbQkwYMhAUqQKQXyXcyCYJdoFewWkDKsVW=Mpyeg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 14:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181931

On Tue, 2023-05-30 at 16:35 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> Beside the errors pointed by Richard, I'm wondering how it behave
> with the ptest-cargo class? Does this class still useful with this
> work? Is it some kind of complementary or did it concern a totally
> different matter/use case ?=C2=A0

As I understand it, the intent in this change was to enable the core
rust tests to run as ptests.

Could we use ptest-cargo for that instead for the core rust recipe? If
so, has anyone tried it?

Cheers,

Richard

