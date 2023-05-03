Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE6AC77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 08:17:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.13842.1683101820124324800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 01:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LaEp8m78;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f4000ec6ecso813525e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 01:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683101818; x=1685693818;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TW1O8E8yFcZ/HCikINYfalGF9zOJcd98Lhwz21l7g0=;
        b=LaEp8m78ez/2uqJviezDt7itaiSvDbpGEin0AUq6/GCRK0mU6AevRfvDJjFGAukvaM
         nE/wzAZw+h6WtzrnvDi9+Crbah4nI3/wjjgznrFWAyydLDBpRLgQLlQjV1bRvRwiTnu8
         oFbp4fyhICulV9uOReo+C5HhmfvHu95XtluGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683101818; x=1685693818;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1TW1O8E8yFcZ/HCikINYfalGF9zOJcd98Lhwz21l7g0=;
        b=GRheNKDLUIVorHLcqSYeUcUxLwhMxS69Vu2Mq30UGmS8jCj0NalDrVwhDAp8bZcc2d
         u/LlnZWX1tknAMnTnNNp4h0R4l14CnLimpZwCRWBA1VZYMKXYsxv3uLqFVwI4iIJZt8W
         UK3QFQ9col20Wy7X1cIzqm+axfrQtKVNY4tTGHvBqXJvc8pm2fHI+Ioe5FktvUWB3zK/
         upM4+mU0W20rKn0NRRf2atjwCyPhcgkerTs/FBhExVH47eLuevYXZhPCvbBPvx0V4yX2
         2gvi6Ab59IZNhnmplXSTOyGFGUt5vYN0kCLEOYOxnRRtVfO7SupKCZH3GJxSY9RO86Fq
         dexA==
X-Gm-Message-State: AC+VfDw5lAphZvh16Dt43mC0Bf7JIk4xSFOIZGYfpGrRrnPF1i6VOAfC
	5/VryApd0bcuhAYF4kSoE4lpv6ATFgPpaPHMmI2KTg==
X-Google-Smtp-Source: ACHHUZ5pJl7pPORCTMeKnNn4QqgIrLu4Vc1I8uu3TOPTCjxbhptFwBJ3Nu/yfcEsG0CQfbK7zSup7w==
X-Received: by 2002:adf:eacc:0:b0:2fe:605e:c77a with SMTP id o12-20020adfeacc000000b002fe605ec77amr14629015wrn.52.1683101818469;
        Wed, 03 May 2023 01:16:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b? ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id w13-20020adff9cd000000b002cea9d931e6sm33197648wrr.78.2023.05.03.01.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 01:16:58 -0700 (PDT)
Message-ID: <d61ff6dcece01da702cf8fc6e98b65d613c129f1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] mesa: 23.0.2 -> 23.0.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 03 May 2023 09:16:57 +0100
In-Reply-To: <175B940FAEEE7C8B.14539@lists.openembedded.org>
References: <20230502201240.2372610-1-otavio@ossystems.com.br>
	 <175B940FAEEE7C8B.14539@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 08:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180786

On Wed, 2023-05-03 at 09:14 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2023-05-02 at 17:12 -0300, Otavio Salvador wrote:
> > Update to 23.0.3 stable release. Release notes in:
> >=20
> >  - https://docs.mesa3d.org/relnotes/23.0.3.html
> >=20
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
>=20
> Unfortunately I isolated this change to be causing qemuppc xorg sanity
> check failures:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/7010
> https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/4517
>=20
> I've not looked into why, just isolated it to this change.

Sorry, I was about to remove the patch and I'm not sure I have isolated
it to that :(.

I'll do some further checks as whilst I meant to isolate it to this,
I'm not sure I did.

Cheers,

Richard

