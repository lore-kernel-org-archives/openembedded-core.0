Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCC9C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 11:07:30 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.66219.1701688043790517054
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 03:07:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RUByJD9y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c09f4bea8so9706425e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 03:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701688042; x=1702292842; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpD+fK6GbhArd4e2eZx44waYCDNwnhNERp/FFtS6Wkw=;
        b=RUByJD9ywhTR83TC83hU+qW8lAy4avevic2EK0iKsZSi4jU3w3VdnKVAwwnpDc+Flj
         a0JL9Q5yVajwrDgCX7CtVH9BLzkwJmrungZ7993yq8q7uum2VIZd6xWErsvfSvOp6juy
         aHLdkQKfattkIQWA9KPoAra+pQLpUGdcorXmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701688042; x=1702292842;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gpD+fK6GbhArd4e2eZx44waYCDNwnhNERp/FFtS6Wkw=;
        b=UWrRy8ri63/NSaXEmvheU2VJNWN/wu5u6znL/CqY8o3E/HIyrhEK/xPFjf3IuJ306i
         AB73CTGUjFKjglzYbfIez4PM0I2vKNTkwsCxcDb4QouUcC3Z+GWw9WVAnq9q1o+ch57s
         VkehHdzfVQAF5FuQYmX87B+SA7+5jIuSL0BJn0SSC/Hh7vQu/Wkb8hvO+tG1QNMjxhLO
         qBHDB8CnKVs25k9T27glHmvWGgv/16uVvJWS88NoZOSDB95VbEldxmxr8f558demQU91
         GzfrlrJPQfOq9/kzC3QbsWzlFHu5Bgl7Igvqe9YWT0ql33FlngyaCmOledp+xFKxJ3vQ
         lgFA==
X-Gm-Message-State: AOJu0Yz7y2gubKg+2YHcE3DZeIEsOXNR9/clVnvmwx7asCIL8aLnwDTH
	bxM1MZikBQm4drgrfztVjkKRvQ==
X-Google-Smtp-Source: AGHT+IE+4VDpx4DrLP0kjPjhccz6mdg3YJuqKGx3zyCbBgCzM9v7JoJYLyvTzdBKxPSiJmkIaeo0yg==
X-Received: by 2002:a05:600c:35c8:b0:40b:5e21:e266 with SMTP id r8-20020a05600c35c800b0040b5e21e266mr2234901wmq.83.1701688042033;
        Mon, 04 Dec 2023 03:07:22 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8764:964d:4cf8:1001? ([2001:8b0:aba:5f3c:8764:964d:4cf8:1001])
        by smtp.gmail.com with ESMTPSA id hg10-20020a05600c538a00b0040b398f0585sm14828070wmb.9.2023.12.04.03.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 03:07:21 -0800 (PST)
Message-ID: <6170bfa781bf455736f763a3bc4e4978f916c96a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssh: Add SSHD_SERVICE_TYPE variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Dec 2023 11:07:19 +0000
In-Reply-To: <20231204085408.2125531-1-mingli.yu@windriver.com>
References: <20231204085408.2125531-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 11:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191734

On Mon, 2023-12-04 at 16:54 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>=20
> There are two types of sshd server now, one is based on socket
> activation(sshd.socket) and another is service activation(sshd.service).
> And the default sshd service type is based on socket by default as below.

Firstly, I'm a little frustrated about how these changes are being
proposed in pieces. The original patches made no mention that this was
eventually going to be controlled by a new variable. I did wonder if
something like this was going to happen but the didn't push back. Now
we're "pinned" into a corner with the direction this code takes now
we've already merged the on target configuration change.

> But it's more convenient to determine the service type at build time
> if there are so many devices.

Why did we merge a patch which made this an on target decision then?

> So add SSHD_SERVICE_TYPE variable to enable sshd.socket or sshd.service
> at build time and we still enable sshd.socket by default now.

No, we're not adding randomly named variables which take magic options.

I cannot look at SSHD_SERVICE_TYPE and know that "1" means socket
activation and not setting it means service activation (or whatever,
the fact I can't check what I've written easily proves my point). What
happens if I set it to "true", or "socket", or "apples"?

I'd suggest thinking about a PACKAGECONFIG option such as systemd-sshd-
socket-mode and systemd-sshd-service-mode which at least uses naming
users are mode used to and says what it does.

Cheers,

Richard

