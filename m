Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828E8CD4F26
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 08:46:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71208.1778575590091939315
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 01:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z0VITOhh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so55510345e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 01:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778575588; x=1779180388; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1Q+IlSTZiKKF3dsuykyzKztkObll536xessfEgwoJk=;
        b=Z0VITOhh8IyfGXyLtQ9R9+HobKspDXXJOjXtURjGg94Yb9Z4gBK9miFlvLAOCupmp8
         gozeyX/fymEUtFCyXPVACQIVvv7n8AIoS/C/JjLvKDSYSr4zt513bY5biu2FLH73MG9C
         whhp8qIPR2bbIHBYIWogkw9aVZ3rh7QFnh3AE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778575588; x=1779180388;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1Q+IlSTZiKKF3dsuykyzKztkObll536xessfEgwoJk=;
        b=JAr98zMHGVybCRknn29Q7kc9EBQDMERfBvHqi+/0LNdR/XjTKMnkZ+Onuv7S9LkGew
         MJDw5nDU/4th3l7jh6BzPqDzN+2WxthF5FlevZAJUXF966bD6LuKRRmlwJo7hfpKtjyp
         KYpr2HgVbwqJjYAfH/AoL/Pd/YI9FfBeGifTGKgU9Jzbsy/snRTAJ+6TONk7dU3Tel79
         VXBusZhdWXN2Jl9PZKtw+gEO+Aj6duZuwo1QZszb6fBlNkx0CE0R4HYKTUdjcXiyhNML
         R0H0mzRhK672w7DDaSzRLIYwh+MPjNixIvsZUxWxshgRPzYFVXfqBTZhkf75wGPFC4t0
         /BLA==
X-Forwarded-Encrypted: i=1; AFNElJ9WkEckrFfQmXF1SftVFTFURaTHHiz6SaA9pZE0Q+t3J4PQ+UjEs44PLwqfHSIjXpcckYJrkQ8hbOBieQ/CobCdwA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzS6FWzLvTMFPjzg3Y/QEGxQmSg54POY0PsPvGPgvOfYK8lKGvh
	xEWLbwikmnWcMdIN3fLF3oO5TkT9in8Aq7wY6PGu+LOUswSZ0U+TPAOWWKc1YzEIqRc=
X-Gm-Gg: Acq92OF/pvPvAAsmqPvmKAMlQPwfC3hJrDGmbDFzDCW7nwSaNTWYemPDDBHPUsS0RlP
	fePACGy9dCoxTL/gQl8VsRAQGebsfpAxtjkGC8qxqiCHZvpPhpsv7sdWxB34Z2ZCV3giP2bI1k9
	agnE71DmhUxH44N35HNm+k384Lv7kXsN2Pnf+zRFPWR1Rizxa3Y1HmTjl9xjTtJa9L9SlXWZsMR
	gXOpj31vYP0CB2ldbwNib5xKYFne8qAKwpKLS2lBskrU6KVvSe8HRKfjA/X0jsqqYNrPij6daXT
	2IHDQEVWoPlQJdj9SQM9mR43PQsXDgIw5++e5AfYcd//LCFr4+yLph8Y52Xr/QwvoJqHYXxbmMr
	dyQ/yp+AzrTpch5MgWYOmTkCnlwPpAei5tsE/XrUwUBXYXzpg9XZgE27KeOad5igu/ApWb/xGD9
	qzqbi602pCfc24xZsLUF8ysaxQjsFmrfoRCuMMoXAmF7Y/6RsSXSGxM5KUznyjuRKFuHr4zrePM
	pa3KgOoR4q47XEq
X-Received: by 2002:a05:600c:350a:b0:488:d6eb:e63c with SMTP id 5b1f17b1804b1-48e8fe732b6mr29208515e9.15.1778575588180;
        Tue, 12 May 2026 01:46:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:44a5:ca0b:d27c:9664? ([2001:8b0:aba:5f3c:44a5:ca0b:d27c:9664])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ec8184114sm1080305e9.36.2026.05.12.01.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:46:27 -0700 (PDT)
Message-ID: <a74ef617f11ddfc139fb23c7d688118de207712e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] ovmf: drop gcc-12 specific BUILD_CFLAGS
 setting
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: joaomarcos.costa@bootlin.com, quentin.schulz@cherry.de, 
	openembedded-core@lists.openembedded.org
Date: Tue, 12 May 2026 09:46:25 +0100
In-Reply-To: <2558d49d-58e6-4e0b-be28-3d27cf521dc1@bootlin.com>
References: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
	 <20260511092935.2631121-3-joaomarcos.costa@bootlin.com>
	 <5f42f257-59fa-4085-a42c-7cbe55472567@cherry.de>
	 <708f2321-2420-431e-8b9a-3a5a470228dd@bootlin.com>
	 <bf76e336-9a8a-4488-a7fd-c4315303e53b@cherry.de>
	 <2558d49d-58e6-4e0b-be28-3d27cf521dc1@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 08:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236861

On Mon, 2026-05-11 at 16:00 +0200, Joao Marcos Costa via lists.openembedded=
.org wrote:
> Hello,
>=20
> On 5/11/26 15:52, Quentin Schulz via lists.openembedded.org wrote:
> (...)
> >=20
> > Not necessarily true as I don't think we build GCC for native recipes=
=20
> > (and ovmf has a native variant), so it depends on the GCC on the host=
=20
> > (unless you have uninative?). I don't know the autobuilder=20
> > infrastructure, e.g. whether we build patches on multiple workers on=
=20
> > different distros to have a big GCC version test matrix.
> >=20
> > But yes, building with a newer GCC will generally not make warnings fro=
m=20
> > previous versions disappear and I'm hoping upstream has had time to fix=
=20
> > warnings returned by GCC12 in the last 4 years :)
> >=20
> > Cheers,
> > Quentin
>=20
> Yep, my whole point is based on the the distros in SANITY_TESTED_DISTROS=
=20
> being recent enough to ship GCC > 12 :)
>=20
> I should have made it explicit in my commit message.

I hate to say this but:

Alma/Centos/Rocky 8 have gcc 8
Debian 11 has gcc 10

and we don't use buildtools on debian 11.

I'm therefore not sure how you concluded that from SANITY_TESTED_DISTROS.

Cheers,

Richard

