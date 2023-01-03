Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C595EC53210
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 14:02:21 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.64206.1672754540770435036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 06:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I8ymGfo4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso23199024wmp.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 06:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPqzBAUIUR7YONV5p7Uz++L66qk4Vj8ytX1M4XooncY=;
        b=I8ymGfo4JdI5MP3iN2904uoSpdJcrbRUk6Mx26Q7T+J5S/DubqJfSuzWtN7OPk9ySx
         XIzPuim5TJXdH0+6iaAAym6olGC4dl4mDWUqui+NZcG0aBGrfmBpOHGDu/eiIXmX8QCK
         vViJdTGWyipUFE7TdVH07Vlc3IlUZd7cELDPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oPqzBAUIUR7YONV5p7Uz++L66qk4Vj8ytX1M4XooncY=;
        b=qzdgAY4pjvAjhQhm+mxMbaLKSyz312aH9N2SBd23tquD0xHlB84YvqHrbWkckpCDr5
         lUcHnyh+2eiQDjRLnZyGmrPwV56FWBIpebab4ii1tRy/qVkox8z6ZEbxPw5hR/PPoOsI
         XrzUSg/kShFzLo8pkaUKcByHejqnOViJh0RqCUq9KVz9YKPj5R8Eg9nx9GWOx1lI76Pe
         TiWmnSDe3//UJY2gBIMVJ/Uyt4wBtXUErZH0Wqd2mC8Rvi5xG0d/b55G4IfiQ0KFLJQ4
         SCYoVY0iTZv+H0b2IyCcXGypwXp2oEahjHohyY/GY00QjgacYVLnj04NZOxJgaheEgkq
         WPcw==
X-Gm-Message-State: AFqh2kotCxGQGu6K3GZ5tf85lAxtcjsbO+8gnxrVHxXmQo5GEyRX6iV1
	+xRa0JWz3xMGIRmxeSeVfxw0gA==
X-Google-Smtp-Source: AMrXdXsWigxrroReTK8XwNWqJVzBjVkWuC+QITHIHQXRbMwq/jp+j7ZfXIddiJOL6LHPb0yATLW8HA==
X-Received: by 2002:a05:600c:4f48:b0:3c6:f7ff:6f87 with SMTP id m8-20020a05600c4f4800b003c6f7ff6f87mr31793428wmq.11.1672754539058;
        Tue, 03 Jan 2023 06:02:19 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d934:7269:d594:9ac2? ([2001:8b0:aba:5f3c:d934:7269:d594:9ac2])
        by smtp.gmail.com with ESMTPSA id iv7-20020a05600c548700b003d35c09d4b9sm53522165wmb.40.2023.01.03.06.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:02:18 -0800 (PST)
Message-ID: <a801ec1885aee5847acdc047b9fe133d9250d8b2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][langdale][kirkstone][dunfell][PATCH]
 glibc-version.inc: Use https protocol for fetch task
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 03 Jan 2023 14:02:17 +0000
In-Reply-To: <29497.1672753788020339166@lists.openembedded.org>
References: 
	<52dceb5d7867a60a1da6c6f5879f4d949c9be483.camel@linuxfoundation.org>
	 <29497.1672753788020339166@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 14:02:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175354

On Tue, 2023-01-03 at 05:49 -0800, Ranjitsinh Rathod wrote:
> Hi Rechard,

Whilst that typo doesn't bother me, it does make me wonder about the
effort you're putting into these patches and I will judge them
accordingly.
>=20
> Thanks for the input.
> But is it okay to change protocol from git to https. I can change the
> commit message if it is possible

If I took this patch, I'd then get a load more changing all the other
git protocol usage to https and you'd point out I'd take one so lots of
others should be fine too. We've not made any decision to do that and I
doubt we could guarantee that they'd all work with https anyway so I'd
suggest you sort your network out so git works or have a good source
mirror.

> I hope it will not harm anything if we change the protocol, right?

According to your commit message, it wouldn't fix anything either. I
don't actually know what issue you're trying to solve as you've not
said. I can guess but that isn't really the point.

Cheers,

Richard



