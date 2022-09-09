Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78061ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 16:49:47 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.172.1662742179792030128
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bSdaaBaJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 az24-20020a05600c601800b003a842e4983cso1824622wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=cxWQvghGRCpdO6Pi82MOknSM3jR0z5/KjNqt/gD92uU=;
        b=bSdaaBaJsiB7iJur82NRdMFJfyl3WzvQ2hSqqN19JOdV2oRayH4gBlzPRpc79C1oD0
         uKpFqGLTxyE7RBkitBK16YeegvP+vqXlKDTsDbZnV5MNYgJLODvslcNHUFS0LtgzvGKS
         Cgw48Top17BKT4brEIkmIzQ4kQWO+OldIaLrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=cxWQvghGRCpdO6Pi82MOknSM3jR0z5/KjNqt/gD92uU=;
        b=j++ZcdeTZkoVFOMbK4hDicW8TYfo3j9nEX03x3LUFi/Ts3Dlbv//nkntNygSdU86de
         V5kkXl+aS084N8EmdgVxFb7jTYyCkT6sez6QviILQKoS4WTzr/W+RHpYJypVWXHjCVJ0
         hlaXSURPnj/Kn9APjAShqYdUtIDQCFn16jgWQ3IuyH9CcKUv1aiqDcVmz5gzG1G+ZAIP
         KqRosPOTZUNNy8fEJsBCfPcA5TKgmYFwhDSvet1Vu8V67TUs017q6tC0uTdDW/TT+hty
         kqJLepoWKfdVDqHOx1yKTtFUP3NffY8699MTqh6InZOeqG+lOdR9Ndepvu5xkbwNplZM
         1yVg==
X-Gm-Message-State: ACgBeo0eNnpt1x/A3l1GVMbQJUT9NpXkm26hirpSpeeSMUQ/N8DIuSpq
	zjN6VuXElxmwA7h/en7Hsyc34A==
X-Google-Smtp-Source: 
 AA6agR6N9pmQkjlPfcqNZ5s8b2Ofs4x7Ac9XPpNcvCTG09jyY2ZmOPPatFYroLkFe4IYcrtLUf5TXA==
X-Received: by 2002:a1c:5401:0:b0:3b4:621f:6f49 with SMTP id
 i1-20020a1c5401000000b003b4621f6f49mr1301231wmb.127.1662742177973;
        Fri, 09 Sep 2022 09:49:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:52ef:c9b0:71c9:e992?
 ([2001:8b0:aba:5f3c:52ef:c9b0:71c9:e992])
        by smtp.gmail.com with ESMTPSA id
 v12-20020adfe4cc000000b00228c8ed21c8sm967807wrm.17.2022.09.09.09.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 09:49:37 -0700 (PDT)
Message-ID: 
 <833b85038912859a815e58ed789b9c7be5689c5c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] rust-hello-world: move to recipes-extended
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Fri, 09 Sep 2022 17:49:36 +0100
In-Reply-To: 
 <CAP9ODKqjc8VuRCVoBZLG7+e2aYZRjnQ4LRFMLZcot3-7V0jCrQ@mail.gmail.com>
References: <20220909151221.434124-1-otavio@ossystems.com.br>
	 <f1f703776907dd518e83f15cc333c99094241cac.camel@linuxfoundation.org>
	 <CAP9ODKqjc8VuRCVoBZLG7+e2aYZRjnQ4LRFMLZcot3-7V0jCrQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 16:49:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170498

On Fri, 2022-09-09 at 13:14 -0300, Otavio Salvador wrote:
>=20
>=20
> Em sex., 9 de set. de 2022 =C3=A0s 12:16, Richard Purdie
> <richard.purdie@linuxfoundation.org> escreveu:
> > On Fri, 2022-09-09 at 12:12 -0300, Otavio Salvador wrote:
> > > There is no need to have a single recipe in recipes-example;
> > > moving it
> > > to recipes-extended allow it being use inside QA tests.
> >=20
> > I'm a bit puzzled why it doesn't work from it's current location?
> >=20
>=20
>=20
> It does but=C2=A0 recipes-example only has this recipe.


That makes the commit message a bit misleading then as it doesn't fix
any QA test.

Cheers,

Richard


