Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D36C3DA7F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 08:08:28 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.118369.1723709307357770470
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 01:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UafxgvMY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52f024f468bso755481e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 01:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723709305; x=1724314105; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jq6n6LZGSBqBd+/b0VebLLDdGxicRyKB1dGJkLzv4j4=;
        b=UafxgvMY/jVaktrl4JXZJkZi5l+z/DNqa6xEorNpih+qVtZa+L2C8Re3lSrgl3f6fr
         fj7Oc6KJdJtCU3PF4W3ae8iYl9McSIqVYx4glByLCPbYv86sHDCC4Aeh8fMufFzuFr0f
         zE8kgSwZQVcGBlar+LmBpKRpkxmCegxVSuvtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723709305; x=1724314105;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jq6n6LZGSBqBd+/b0VebLLDdGxicRyKB1dGJkLzv4j4=;
        b=l3sBqLPCWiXtXfGStk4FVY+d9UlftgYyUiDpTwukn129UKWJqSsyjDQd1JxJLnW1HQ
         9SDppAVpIsXKEafEgaAFjenwcVhnqKEDw00FmNfVMH8SqcweLU8G3R/74pC6pwGFKGo1
         FgSsAj+daYeXfq/y55iTvXd27NalLFMTipII06hrdop7aby61QRJXiR3GSFXRnJ7ME7y
         Omk7ZWANUJx4KpGYm7e53cH53VgAeICabMsXvhARME4abz3Lruu7TYvJi5rKfC2iB22B
         siq8ZTirkr+hURcZno2tdwvGT2SZxyW12x5tXCiHqCr69/RffpcJ0+it1c/8+zHUtyXw
         NiHA==
X-Gm-Message-State: AOJu0YyguwDXoJTlBQv7Pil7Cn1CyqtSlVeOOS9Q3m1S4YmGRP8cHCMx
	McGwnm3dkcmvkSRIFduDMbep7dKxy8gP7zVcaXMkAYyu9KoBMkCh7FySIJ2BhxU=
X-Google-Smtp-Source: AGHT+IHybP2ptePPcpeImJB8QCWQwsz8pHZhnasC1Ri9SGIaFXf0HbSErAqzcGB254ElXf6mhaPArw==
X-Received: by 2002:a05:6512:1088:b0:52e:be1f:bf7f with SMTP id 2adb3069b0e04-532eda89b9emr3409365e87.27.1723709305297;
        Thu, 15 Aug 2024 01:08:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:860b:dfcb:6b24:b0eb? ([2001:8b0:aba:5f3c:860b:dfcb:6b24:b0eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429e7c03ffdsm11977105e9.20.2024.08.15.01.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 01:08:24 -0700 (PDT)
Message-ID: <a11cc259b50cbc7edb9daf959ae92e107f363144.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-cryptography{-vectors}: upgrade
 42.0.8 -> 43.0.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: tim.orling@konsulko.com, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2024 09:08:23 +0100
In-Reply-To: <CAOyo-85dM7t_uByZ12qPh9haZmOHiKFTRnyfhMmp2u9oCzYoHA@mail.gmail.com>
References: <20240813031628.1123492-1-tim.orling@konsulko.com>
	 <20240814225104ed116094@mail.local>
	 <CAOyo-85dM7t_uByZ12qPh9haZmOHiKFTRnyfhMmp2u9oCzYoHA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 08:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203336

On Wed, 2024-08-14 at 16:39 -0700, Tim Orling via
lists.openembedded.org wrote:
>=20
>=20
> On Wed, Aug 14, 2024 at 3:51=E2=80=AFPM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > This causes reproducibility issues:
> >=20
>=20
>=20
> lol. This was supposed to fix reproducibility issues!
> =C2=A0
> >=20
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240813-qg=
fyyhkg/packages/diff-html/
> >=20
> >=20
>=20
>=20
> Those data.tar.xz differences look entirely different. I'm going to
> have to dig over the next couple days and perhaps ask upstream,
> unless someone else recognizes a pattern. Although I wonder if this
> is just "this rust package was not populated in Repro A because the
> task was already in state=C2=A0and it was populated in Repro B because it
> was built from scratch". If that is the case, we have something
> elsewhere causing problems with state=C2=A0(rust, cargo, python3-py03 or
> python3-maturin for instance).
>=20

They don't look that different. The RECORD file changed and the lines
look to have changed ordering as I think the same lines are there,
e.g.:

cryptography/hazmat/primitives/hashes.py,sha256=3DEvDIJBhj83Z7f-
oHbsA0TzZLFSDV_Yv8hQRdM4o8FD0,5091

and

cryptography/hazmat/primitives/hashes.py,sha256=3DEvDIJBhj83Z7f-
oHbsA0TzZLFSDV_Yv8hQRdM4o8FD0,5091

but different ordering.

So the question is what is writing that file and is it doing it based
on something like "ls" output which just lists the order on disk? If
that is true you can thrown a sort in somewhere...

Cheers,

Richard


