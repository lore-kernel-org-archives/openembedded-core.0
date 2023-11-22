Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9312FC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 15:52:30 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.22980.1700668348858624775
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 07:52:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PJ9QH2SP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.180, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c5056059e0so92630221fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 07:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700668347; x=1701273147; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjGCmCO19gzhgCtVvlpELr69Ni8Ily5CUer3FO0nRr0=;
        b=PJ9QH2SPSIChEBQ/QxZpSQZfuPz8ecPOSZ0aSO5ZiO9ikf+2gQ3TMu6FQZOylCIOG8
         aUPsqr1pXrmeNPZQaqEb1apF6MeiqBlz2jkbl0Q3oMxnd2UeNOC58zsPU68XnLIk6RPj
         IONR5C4I0lNXr9C6gEJE64To+F4XhDHIG3e18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700668347; x=1701273147;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VjGCmCO19gzhgCtVvlpELr69Ni8Ily5CUer3FO0nRr0=;
        b=VfVCp9Sw1jTH62SPwvq+fNqIVo0vKBztU6r77BvuZNKnevWqgLOKHmSFXNhJw7YUgG
         gSymTc3Cj5JRgeUM/jbt9gxYobug9VnH8cjf5yyDInx7iYJllTuu/D4O3NKSbgp5Sfje
         i7D8PEnIQv//w/QQ9KfKOYRi1y+J2sY13kDhBSvJUZ9A/JNTlbF2enoYco+7XvaaI3yj
         g5khMsN4sYDwAHvOxg/C+3f0DTFpSg1Ygu8ozDu5AIu4y7qt7NW9d9jS9S3MTAhsJWcL
         BKyu5U8KGILPiJ2g/hXeaNV9Eb0LzzVEpYONQV7YDWv+GFzXm10dep1IRqLfMAsg1/wl
         YcVA==
X-Gm-Message-State: AOJu0YxvOgPXhxZFG/kOUP+Y5XMgEES4gYU+nA4+xh6jXcTIq2g3w6RK
	TLPWfKEzelBg1IDeuHQXlZsICQ==
X-Google-Smtp-Source: AGHT+IH/x8XJpH0ZKBQeTY3R/HACoTF+sAJu3PABfEcxGIy6YY8cLf8LhqaRGRI3L/XR+3Ym3ck0fQ==
X-Received: by 2002:a2e:b547:0:b0:2c5:9e4:3fdd with SMTP id a7-20020a2eb547000000b002c509e43fddmr1875299ljn.27.1700668346844;
        Wed, 22 Nov 2023 07:52:26 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1718:e534:44cc:c75e? ([2001:8b0:aba:5f3c:1718:e534:44cc:c75e])
        by smtp.gmail.com with ESMTPSA id b10-20020a05600c4e0a00b0040684abb623sm2638644wmq.24.2023.11.22.07.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 07:52:26 -0800 (PST)
Message-ID: <e89f4252c89898078cef97fed0ddac01d1fa5725.camel@linuxfoundation.org>
Subject: Re: [OE-core] [Kirkstone] joe editor broken with current ncurses
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tobias Jakobi <tobias.jakobi@compleo-cs.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2023 15:52:25 +0000
In-Reply-To: <31510.1700667996856303830@lists.openembedded.org>
References: <5528444bae3c60d3541ea04836b764b900c0f123.camel@rpsys.net>
	 <31510.1700667996856303830@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 15:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191115

On Wed, 2023-11-22 at 07:46 -0800, Tobias Jakobi wrote:
> Yeah, the "causing other problems" bit is also what worries me at the
> moment. In particular because a lot of other packages depend on
> ncurses. Usually not on libncurses itself, but on libtinfo. Let me
> know if I can do further tests. I can't guarantee though how much
> more time I can spend on this. Our product owner is already asking me
> why stuff is taking so long :D

Someone looking into it and helping fix things properly does take time
but without it, the project doesn't work. You may be able to point out
all the fixes you haven't had to work on that come from the project and
that this is small by comparison! :)

Cheers,

Richard

