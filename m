Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEEACFD34F
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 11:19:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.9021.1728645580848416182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 04:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Crfx+b61;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so16708175e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728645579; x=1729250379; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8tkoADY9F9B2N9iQWHsWM21g3rN1BNa/Qq4h/Z8BwUI=;
        b=Crfx+b61slbzmWxYei8lbRRE11MaTy6krYVQ2xT0DJOnKfxBbVxfZD7GF2sFJK3a8Q
         Ku+H64W/gXJvIBVZffuyI3Ubf89GEb0bHMYsgXDwrLA8k0/qdgRRxyI48JXzsCW26NlO
         RmSpYJK4YrT/i7DtRDTh2WSaZ8BI675qB5YQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728645579; x=1729250379;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8tkoADY9F9B2N9iQWHsWM21g3rN1BNa/Qq4h/Z8BwUI=;
        b=iw+Y14z1akmeM219HHxYrISpz6GvKJY9rKjAKKfRWrsSexxJ/XWZk07Bik4xCLylVa
         5/e5xpJhLl9e4FEmYeR6HPkfvfTHoh+BNt+WFpVVkA9UJ88Rrx8meyPUcRbMNnlT3rZo
         46oRSTeRw88SjimkziD2NU0W/L8QKIJ3iaV78+55rvO/H0eG0kBrgep+ywgkA3nlYVWU
         oo3MxIwJMFJs7ZerdDbNf8yBQHUzja5TMLWKLDTWx7iMIdUrR0gSRT1kialrXqkmnsQj
         oBoacwUzDe0OIciL3RMZWJUWSrZ8IDqyPJf1HOf4eoLqQ2FqqlGfvZEkxhxaLVbdliGB
         NN4Q==
X-Gm-Message-State: AOJu0Yww643VZ2337FANTqCVmPw2/Tbsihyk7HjSlvNauJ9/nN+vUR9F
	znrgvXYypHBPdtfyHsTc3P9QEuhaF4afiO0T77QIjwdnV6emW6GDRYaII6c/CM8=
X-Google-Smtp-Source: AGHT+IG2/PWMG9VS+qEEFzJBIINfUS552zInxWpZGjIM7uNLbhhKphU+574gGuD7DUILB2gi0R+zJA==
X-Received: by 2002:a05:600c:1c06:b0:42c:a8d5:2df5 with SMTP id 5b1f17b1804b1-4311df1e6b0mr20063335e9.24.1728645578836;
        Fri, 11 Oct 2024 04:19:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8145:ba6d:a6de:28af? ([2001:8b0:aba:5f3c:8145:ba6d:a6de:28af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf51c69sm71558365e9.28.2024.10.11.04.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 04:19:38 -0700 (PDT)
Message-ID: <0092cbd5b19661f2c88084cc2c00811c7c2f6563.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-check-update-nvd2-native: Incremement
 DL_DIR database location
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Marta Rybczynska
	 <marta.rybczynska@syslinbit.com>, Steve Sakoman <steve@sakoman.com>
Date: Fri, 11 Oct 2024 12:19:36 +0100
In-Reply-To: <CAApg2=RmrYULa7KMi6EMdGAhW3-uVA81ggVJg5BGDMSg0M0nLA@mail.gmail.com>
References: <17FD60BEC9A54A4B.2207@lists.openembedded.org>
	 <8281d9cb51a5e652f99ed998fd71c7b6a84e1e63.camel@linuxfoundation.org>
	 <CAApg2=RmrYULa7KMi6EMdGAhW3-uVA81ggVJg5BGDMSg0M0nLA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 11:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205673

On Fri, 2024-10-11 at 13:17 +0200, Marta Rybczynska wrote:
>=20
> On Fri, Oct 11, 2024 at 1:02=E2=80=AFPM Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >=20
> > I now do have an example of a corrupted database:
> >=20
> > https://valkyrie.yocto.io/pub/shared-failure-data/nvdcve_2-1.db
> >=20
> > I'm not sure why this is happening but the older releases are all
> > accessing the DB over NFS which makes me nervous. We're seeing a
> > lot of
> > failures on the new cluster, hopefully this will help isolate the
> > problem.
> >=20
>=20
>=20
> The database isn't completely corrupted, it looks like it is partial,
> however. What was the error
> that you got in that build? Any or just strange results? I'm running
> a verification vs a fresh database.

https://valkyrie.yoctoproject.org/#/builders/23/builds/238/steps/14/logs/st=
dio

Exception: sqlite3.DatabaseError: database disk image is malformed

Cheers,

Richard

