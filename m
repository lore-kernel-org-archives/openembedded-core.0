Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F30BC4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 11:41:11 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.5788.1671277265571476763
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Dec 2022 03:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WR3rMkrt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id f18so4766187wrj.5
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 03:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAFlfGE2FZP9sxu5ry9FfuniplL/gEN3pT5g4/GXjEU=;
        b=WR3rMkrtlPy3wOKtu/wITZRG+yksMwuDm6J75YZEigzBbkg65n+jxTD+IskVF1U8rH
         WxdYFuOC9YFu3G83a9m3mzp41jorBVVfOEs3jdDzjAYhWxN/clWVUCy+899diy1H0rEa
         J6GZexH5TxNRG85xcvzqbSPjnV55ixYPZFMb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pAFlfGE2FZP9sxu5ry9FfuniplL/gEN3pT5g4/GXjEU=;
        b=B9XRihMWRxYnVkZf1KI/QXgQexJQg7xnP7Wyeqd6HV2BlG7+qwqRLJkyWwUIIARg0f
         2kq1TpYtXfy8scWIoxD3VQPnRcohHokhxPsHioah+tSXXnyaMq2RVrHFIyfcr8OUuFbO
         aCMi8iqXpTzFpe0xGiuLLXGep1POqRkYfyByeTGvALksZ8mHQTOgNQhRWR54FEugWvbf
         qjri5++XsEWuYk4ocbx5Lt/CG4OcQme2S9vETnQMO9Crrf4CXaSWLKD2MZghqVLt7tsy
         xCk5gg9JQxDVnVmni5auAiztugjes7PqqPR3RgZBaOle59t4mLWV4kXAL5PZxsYen/yR
         7CUQ==
X-Gm-Message-State: ANoB5pkzdLLkWISTGwwJJ0Y1VDAzc39iwWUJJZ3I6zH3l1rL6ofpcTrZ
	BdxyYKWK7ZxzfmsVhFYW0tc1K/e3mL46ZW6/
X-Google-Smtp-Source: AA0mqf7nS8RJH1nAb0rZFhbkLTmokczUuzglHeMDkXAhI9XcCk5DU5B28X+OTv7Ty8w7jP1mFM4Yiw==
X-Received: by 2002:a5d:6a87:0:b0:24f:11eb:1eca with SMTP id s7-20020a5d6a87000000b0024f11eb1ecamr16400832wru.42.1671277264048;
        Sat, 17 Dec 2022 03:41:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6? ([2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6])
        by smtp.gmail.com with ESMTPSA id w4-20020adfec44000000b00241dd5de644sm4699626wrn.97.2022.12.17.03.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 03:41:03 -0800 (PST)
Message-ID: <48cbee269a6c8ed3a7cc9a6e16d5eb460f116eb2.camel@linuxfoundation.org>
Subject: Re: [OE-Core][master][PATCH] curl: Correct LICENSE from
 MIT-open-group to curl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>, Patches and
 discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Date: Sat, 17 Dec 2022 11:41:03 +0000
In-Reply-To: <CACpMEhN6D0bdzZL0b2ghX3zhyUgYG4gFGMHvjuQt7q2sVTaJ2Q@mail.gmail.com>
References: <173135C5CA37888A.22470@lists.openembedded.org>
	 <CACpMEhN6D0bdzZL0b2ghX3zhyUgYG4gFGMHvjuQt7q2sVTaJ2Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 11:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174777

On Sat, 2022-12-17 at 16:57 +0530, Ranjitsinh Rathod wrote:
> ping
>=20
> On Fri, 16 Dec, 2022, 1:04 pm Ranjitsinh Rathod via
> lists.openembedded.org,
> <ranjitsinhrathod1991=3Dgmail.com@lists.openembedded.org> wrote:
> > From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

You sent the patch just over 24 hours ago. That is not a reasonable
timeframe to expect it to merge in.

Cheers,

Richard

