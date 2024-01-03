Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35914C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 23:25:58 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.42398.1704324355888815691
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 15:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LXsGlg03;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33723ad790cso4381778f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 15:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704324354; x=1704929154; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JrVaXENTAgRUOvXltBenjXj4w0OS8IHzCWs1W31iTi0=;
        b=LXsGlg03DdzYXL1hzLq4OoocyVee141B9VKGJ8XaCXBmngVeKDasnc150/cBjaIUek
         22dbCRpm9VFp34A/iZoOQgyyZsLLekMtJMKRSrvjWF50Kvgrgv86W1l03J+nqYX3dr6r
         adiZf/rVEJEOdjDMHJcQrTPTsIv3h/tr+UMsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704324354; x=1704929154;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JrVaXENTAgRUOvXltBenjXj4w0OS8IHzCWs1W31iTi0=;
        b=rDtIUmgkR+SChntdHN8AE8nBLOHRxnuHRTQ6OcoZmaK0WqirwkdgZesI00JP9prypf
         xoqDoqB/YjSbM/yNGrSf7MXldQoHoOHAElSTXRq/h9Gu+Tw9ohg5ky7FerxdLulGIxJi
         D4VU6RXmtwfpvvWkyuE4HpfZ1FZG6s3Uzet0R9PUx+FGcbhgk0Wek+xZE1647fD4O5kK
         eERRQt7ZU5f+AuHWqmTBP2941uK4OkCxu2khimD5lu2EynmGiRYXEm61GaedEqv/aqI8
         Zy1VI5dJ65XI3YbzAZreYUdhnzhE8LuaHo4SI5WertZyrWtR2zzlWlPkI/QrdvqMsQSV
         ZXSQ==
X-Gm-Message-State: AOJu0YziNdK9Xt+9vJ8NzpH6izCwOwum9CwQzbgjyqDej3LiQa0fiYfA
	V8LLONumnq02SNKQgyNvA7+Y+F0bMroXRA==
X-Google-Smtp-Source: AGHT+IHTr3vIbi3TZu0buymuOJEzXMdXg5Kl3BYyMD7lU96nXDqawg8olrjcQrR3VzX+uSnoSz67WA==
X-Received: by 2002:a5d:5f8a:0:b0:336:c9e0:4371 with SMTP id dr10-20020a5d5f8a000000b00336c9e04371mr7267551wrb.148.1704324354279;
        Wed, 03 Jan 2024 15:25:54 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7c49:db55:5c5b:1a5b? ([2001:8b0:aba:5f3c:7c49:db55:5c5b:1a5b])
        by smtp.gmail.com with ESMTPSA id m17-20020adffe51000000b003364a0e6983sm31508459wrs.62.2024.01.03.15.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 15:25:53 -0800 (PST)
Message-ID: <0e71617a87f786db81fcb971833ad8897c88841c.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/7] kernel: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org, Jon Mason <Jon.Mason@arm.com>,
  Ross Burton <ross.burton@arm.com>
Date: Wed, 03 Jan 2024 23:25:53 +0000
In-Reply-To: <cover.1704169585.git.bruce.ashfield@gmail.com>
References: <cover.1704169585.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 23:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193295

On Mon, 2024-01-01 at 23:31 -0500, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Richard,
>=20
> As promised, I waited until the new year to send this update
> to introduce the 6.6 kernel and libc-headers.
>=20
> I'll be sending patches to the appropriate lists to remove
> 6.5 shortly and make 6.6 the default. Once we have the reference
> boards updated to 6.6, the 6.1 kernel will also be removed.
>=20
> I've built 6.6 for all supported arches, core-image-* and have
> also tested against musl.
>=20
> Patches to meta-oe have been sent, and the work done with
> 6.6 as the -dev kernel means that the tightly coupled packages
> already build against 6.6.
>=20
> I'm sure there will be issues .. as there always are, but at
> this point, I need more eyes and test cycles to find those
> issues.

Thanks for putting this together (and deferring it!). I ran some tests
with this series and the QA warning tweak applied. It looks like the
remaining issues are:

Some issue with 6.6 preempt-rt failing to fetch:
https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8393/step=
s/34/logs/stdio

Some issue with qemuarm64 ptest images failing:
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/5933

[    1.664613] jitterentropy: Initialization failed with host not compliant=
 with requirements: 9

which looks familiar but I'm failing to page in the context offhand.

There is also a meta-arm config check issue (copying Jon/Ross):

https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/5059

The build is close to finishing but hasn't quiet at the time of
writing.

Cheers,

Richard

