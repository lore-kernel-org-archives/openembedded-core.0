Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CB6CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 07:56:09 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7037.1779263766855516082
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 00:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qS9yQEHb;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48e82c23840so36532265e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 00:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779263765; x=1779868565; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqF+d+WtYw+J7r51M36vIeOzZI5/cBfQpCd4n4gWHxo=;
        b=qS9yQEHbIUVueBuWd3xwXyvUvIFP52IpssqQK5tTAGMz499hawBLSh0ohCN7HZ6hBq
         xdzN92RjgWxTPxi2lfDk+45LS3TfiYe5vXhXT9uWLRBvuW0x1R9Jd+Neqd5lykVrWNr5
         sLsKiByk641PZCe2EPdCaN66ZH+VrPzm2wFL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779263765; x=1779868565;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqF+d+WtYw+J7r51M36vIeOzZI5/cBfQpCd4n4gWHxo=;
        b=AxDYqUehn0Sx0ETcmNMHdwwID8aLP8irIyf3kDXDf7Np1rzlX61GO4Bk0eJl2ayvav
         ww4yprKuu9vhYi6AhcJBcrFIsldOy/cEIij7JkFtx8e2a0FZgxnXZySZKkC/rxZ8lgjH
         mX7OdBfiYLrIQMG72PTZIuUEsh9qd/Ggt9901vtb9pmMMuOQJtEQl9mr5Ac5JHD+IivI
         2SumC/glyywlEA4Ya/0Ev5tY8YO193ufAWqtyReK5+Q1MpiNb0DezG708Q5+/feiAriN
         unldhPG1+EyKagDmWAEA77TlWHs1z+D5RE3F9Ry9D9L5RdgtJd7Cp8aKOoB1Cc/dz85a
         4ypg==
X-Forwarded-Encrypted: i=1; AFNElJ9IbKjOv6LFlbbNsZxpz4q4Mr+G17aqVTdf10Y5SZhkrAJjBjgT9z0GXH+XGRJJDr75tGkodL5NL60BBzJ6aB60AA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwKlqHL9flAyrCRBAZEayuDOQG4g+HX6Smm/n5OWmLs1ps3/M2H
	uG+VhI9Pnl6Wyavyek9UyXZJ0Y4sr3PZ8Lx9ppFJQ6LqJwhpsgpyf0EuNX3PY1q8e+c=
X-Gm-Gg: Acq92OFZ+6VK+1ZGRoV2iHclAuIJIsrCxjOz53X/mqTzGUljFvFk1XTNkGNkl+dFQzU
	v+O78Suy1IDExUsg9cf+WpRcYUslU48TdzmjND0a6lIj4cu608bjZwazhgxpwps6qK7O8GBeRnT
	hMJqLQ8DizdFH1SKgGXg6/vuOVjKn5mOKuDHJzSdBSJ9dHeN3KnlTHHgLSAEWtBnFPb9WgOGMT3
	roTN1D5jFD0mXrUIbGATqzg5Y1MGAtRgYzEoIfuiarRa9QTTJIHd+LsIl0kQb3oUICO6psqrr0X
	I5sbR5z0gHQI5rYHUuIGG6I36PnelilNlWrKZSDRRfIr+gLBPpBRaRXRlAZAhd+/36/a3/kyNrl
	f0XT5ceBYrnUsW0rYxy3ikPsKq748mNRoP7WD8gxS6cLy9gviARpjDN9fTLB3z7ug2mHCd3ZWgy
	Iz+kaDfFfpC2IDeNEd1bLh7nhzHtyez44aBvo18Y+2M3FO/i1/7whPGZyR7Nv3UDkFUWI5qYI9F
	auqpOgYPQRv
X-Received: by 2002:a05:600c:870c:b0:490:320:949 with SMTP id 5b1f17b1804b1-490032009f3mr216539325e9.27.1779263765045;
        Wed, 20 May 2026 00:56:05 -0700 (PDT)
Received: from localhost (2a02-8440-250c-1761-bf48-cd02-2cb4-03a6.rev.sfr.net. [2a02:8440:250c:1761:bf48:cd02:2cb4:3a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe53ab671sm389313445e9.1.2026.05.20.00.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 00:56:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 09:56:03 +0200
Message-Id: <DINCD4UF7K6E.2U7I05MCKLQAY@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose 11/28] libsdl2: set status for CVE-2026-35444
X-Mailer: aerc 0.20.0
References: <cover.1779232800.git.yoann.congal@smile.fr>
 <e2ea9d60afddf38e5a8d4a7c4d22e5efd98a5e4e.1779232800.git.yoann.congal@smile.fr> <e18168d2da604d9645b4116d37ac99a572477cae.camel@pbarker.dev>
In-Reply-To: <e18168d2da604d9645b4116d37ac99a572477cae.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 07:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237388

On Wed May 20, 2026 at 9:37 AM CEST, Paul Barker wrote:
> On Wed, 2026-05-20 at 01:29 +0200, Yoann Congal via
> lists.openembedded.org wrote:
>> From: Peter Marko <peter.marko@siemens.com>
>>=20
>> This CVE is for SDL_IMAGE, not SDL.
>>=20
>> Mapping in sbom-cve-check tool seems to be wrong at [1].
>> It maps both SDL and SDL_IMAGE to the same CPE.
>>=20
>> [1] https://github.com/bootlin/sbom-cve-check/blob/v1.3.0/src/sbom_cve_c=
heck/products/products.toml#L1608
>>=20
>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit fef169063e49f516ea96e2243869808ba58550d0)
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>
> Hi Yoann,
>
> We should not need to backport this if we take the update to
> sbom-cve-check 1.3.1 (earlier in this series) as it fixes the offending
> products.toml entries.
>
> https://github.com/bootlin/sbom-cve-check/commit/30a5b3e94bbdd27557d3b8b7=
b1917b9980fc2564

Agreed, I removed it from my branch, I'll send a v2 of the series.

Thanks!

>
> Best regards,


--=20
Yoann Congal
Smile ECS


