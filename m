Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240D5CF258D
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 07:27:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.27333.1728804418961409719
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Oct 2024 00:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PhXMXC+9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-431195c3538so21178155e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 00:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728804417; x=1729409217; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q+lPNDc2SmeXcMUrcbSpjlzg7IYE108eBWxfg3gUjPM=;
        b=PhXMXC+9e9nXkdG6LLkTrTARQdEzxsY/7VILbJYg6+ANf1r8mUNUMgyocRh25qf4wM
         ZgG/jbOlRqYs24r7nbBL48htnc1ZGTXc8o4TAS0SdnRdgirykCpsaZiL9WoXqwVpNQIj
         4AXdrweEEo7Gv98D+msxkUc+HGDybX2LTRLZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728804417; x=1729409217;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+lPNDc2SmeXcMUrcbSpjlzg7IYE108eBWxfg3gUjPM=;
        b=FcX2t+mfBTHP2AAxarGGLYtZuUopD1P/l3AlLWawORnsk1Wh+MB2BV8kBQEb5lUTEl
         kwDwRPysY1MfkqFfWffOknzxFFWbkTC1EIljKpXxMPHSDe9dQvhXr74EAdxxymRw5F1a
         Pb9OOQa5l8F/XUB74Dc8EDkmcePOiCfKWCEpzQFxttH8PyGsdO+JmjqBNq9rz8PQuILi
         +QIabJXbr+Z6lS3UjJ4d/MkwUI07ff5nY+7I8/h7ZPf8pg98uV7M6vMqTt4XCdhZCLfk
         eigQXGu8bu/QcFht1VpDLgg/VtZ+KzrmTnWmsXnYZfe9sPpLcpF5YzPBRHUcwj9i2uhL
         ZCuw==
X-Gm-Message-State: AOJu0Yx87AHFUAL5iLeZ75o9IPwDM3OKbSmcXU3SXc7106svgHmw67dg
	g9xL6Qq4rFUrDG8zsvdmIbzO2MvvfKSalTAE69Zb3a3nXx9YeuFUUh51PVKKMvY=
X-Google-Smtp-Source: AGHT+IHrWPViy8z0wyYfJyItc02oRmr6NWZk7llUnY9ccTlTust8BKEojjEiWVzWagw+cKrZO9JTlw==
X-Received: by 2002:a05:600c:4ec7:b0:427:ff3b:7a20 with SMTP id 5b1f17b1804b1-4311df47618mr53180445e9.27.1728804417018;
        Sun, 13 Oct 2024 00:26:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:145f:f6b9:9ebe:60c5? ([2001:8b0:aba:5f3c:145f:f6b9:9ebe:60c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311835d7b2sm85042805e9.42.2024.10.13.00.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 00:26:56 -0700 (PDT)
Message-ID: <7586d126df58b1d6861dda0991bbc6ac47f569b3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-check-update-nvd2-native: Incremement
 DL_DIR database location
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Marta Rybczynska
	 <marta.rybczynska@syslinbit.com>, Steve Sakoman <steve@sakoman.com>
Date: Sun, 13 Oct 2024 08:26:54 +0100
In-Reply-To: <CAApg2=R_F-YUiv23wC_ACZFNe590h+RGxJ4R=-n2uT_LE5rqFg@mail.gmail.com>
References: <17FD60BEC9A54A4B.2207@lists.openembedded.org>
	 <8281d9cb51a5e652f99ed998fd71c7b6a84e1e63.camel@linuxfoundation.org>
	 <CAApg2=RmrYULa7KMi6EMdGAhW3-uVA81ggVJg5BGDMSg0M0nLA@mail.gmail.com>
	 <0092cbd5b19661f2c88084cc2c00811c7c2f6563.camel@linuxfoundation.org>
	 <CAApg2=R_F-YUiv23wC_ACZFNe590h+RGxJ4R=-n2uT_LE5rqFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 07:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205715

On Fri, 2024-10-11 at 13:24 +0200, Marta Rybczynska wrote:
>=20
>=20
> On Fri, Oct 11, 2024 at 1:19=E2=80=AFPM Richard Purdie <richard.purdie@li=
nuxfoundation.org> wrote:
> > On Fri, 2024-10-11 at 13:17 +0200, Marta Rybczynska wrote:
> > >=20
> > > On Fri, Oct 11, 2024 at 1:02=E2=80=AFPM Richard Purdie via
> > > lists.openembedded.org
> > > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> > > >=20
> > > > I now do have an example of a corrupted database:
> > > >=20
> > > > https://valkyrie.yocto.io/pub/shared-failure-data/nvdcve_2-1.db
> > > >=20
> > > > I'm not sure why this is happening but the older releases are all
> > > > accessing the DB over NFS which makes me nervous. We're seeing a
> > > > lot of
> > > > failures on the new cluster, hopefully this will help isolate the
> > > > problem.
> > > >=20
> > >=20
> > >=20
> > > The database isn't completely corrupted, it looks like it is partial,
> > > however. What was the error
> > > that you got in that build? Any or just strange results? I'm running
> > > a verification vs a fresh database.
> >=20
> > https://valkyrie.yoctoproject.org/#/builders/23/builds/238/steps/14/log=
s/stdio
> >=20
> > Exception: sqlite3.DatabaseError: database disk image is malformed
> >=20
> >=20
>=20
>=20
> Managed to get the same error with the sqlite command line.


I merged this patch as it would rule out a lot of things. The error recurre=
d:

https://valkyrie.yoctoproject.org//#/builders/76/builds/235/steps/14/logs/s=
tdio

This means that it happens with the access patterns in master alone.
I'm also noticing there seems to be a trend for this to happen on alma9
(older centos systems?).

Running those tests manually on that worker passed the tests ok.

It has python 3.9.18 with sqlite3 not available as an external command.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14899

Cheers,

Richard




