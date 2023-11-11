Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88419C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 18:47:46 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.1595.1699728459246333734
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 10:47:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X7rpEJOJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40839652b97so23183805e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 10:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699728457; x=1700333257; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TDD5uq9FABxs1xa8IIdiT1XFU75zNziHvTl8rS/vyqY=;
        b=X7rpEJOJMhLHwHLtkfCwarvaqRZJFEnIQAxw04v5xhYd6i46GnNBSQ4I6/aWmngpVY
         ZniQJIJSzxA38XXVIktsCqwV6pf/L7vVZOEu8hRMgUCeMpeL4NPbQ1rkI97bkV2it1EG
         Kkm/7tQGLwGWZBWyICC9NNjQnchSyDO0P8SZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699728457; x=1700333257;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TDD5uq9FABxs1xa8IIdiT1XFU75zNziHvTl8rS/vyqY=;
        b=G+AotVk/ADC/Kd2/2B0y92j+nXrl37GsFOWSatp+Jt/bwie6GCEdkNzvHiHuLfGqdm
         9tewk2Y21l5L0T5E/1ykkfUAYDrGaa4Ku3bqeL2LRtIy5G/mdOYmj/RPgD9fhvD4IOeW
         jceSGmPoMEheEDPncIHMfenwf6Iyd2xV1Ndi1PmXf+Ddhe3cObvZZiGZBbzAsaDnbrfW
         iyGH9Msl8jJBDKCPF8Ziu/TAM0TispxtGk57lqtSGQQZ1Yw/SDN+uOSCr/crrTusIXUF
         RJNXqMb5njFUmcT4qkL9Cv/pIQUML63gucn5ZJan8/xQaSawAYRPVG9+jW8TAgGlJaeg
         /Upw==
X-Gm-Message-State: AOJu0YwMUu23VpLwI+RrytXCJdi0lBvTbfLwYxcvlQ2YtkvZZfeCcvAJ
	9Fmrx/99RSoVlbxoQ5PNGQahGA==
X-Google-Smtp-Source: AGHT+IFNxbBhgQrXZEqbAM3JPtb8wud71OF7/2EcqUB7TvrDjQiavmD+sPNAu4DTN/B2MvdGIMqKCQ==
X-Received: by 2002:a05:600c:4689:b0:408:37aa:4766 with SMTP id p9-20020a05600c468900b0040837aa4766mr2031507wmo.5.1699728457635;
        Sat, 11 Nov 2023 10:47:37 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:53e5:ae40:81ca:e333? ([2001:8b0:aba:5f3c:53e5:ae40:81ca:e333])
        by smtp.gmail.com with ESMTPSA id bi15-20020a05600c3d8f00b004095874f6d3sm2888108wmb.28.2023.11.11.10.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 10:47:37 -0800 (PST)
Message-ID: <f0a66fa3f97bf3eda5667077540cbf2900e753fe.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 15/15] lz4: specify gnu17 in CFLAGS to fix
 reproducibility issues
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 11 Nov 2023 18:47:36 +0000
In-Reply-To: <CAOSpxdZLvOAhz9t-m3BeOzpXjLjSELQMJpqn6hCpcxZY2wx3CA@mail.gmail.com>
References: <cover.1699714834.git.steve@sakoman.com>
	 <ce826b01d93ac99ce089c2212cb0cbff61cee1e4.1699714834.git.steve@sakoman.com>
	 <98dcc905adef3d2d828af60abdaa40291abd458d.camel@linuxfoundation.org>
	 <CAMKF1sqRD+yX+gFHSPhmrdY2nBHpLh24YYHv6HusfkSS5tmT5w@mail.gmail.com>
	 <CAOSpxdZLvOAhz9t-m3BeOzpXjLjSELQMJpqn6hCpcxZY2wx3CA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 18:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190438

On Sat, 2023-11-11 at 08:20 -1000, Steve Sakoman wrote:
> On Sat, Nov 11, 2023 at 8:08=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >=20
> > On Sat, Nov 11, 2023 at 9:36=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >=20
> > > On Sat, 2023-11-11 at 05:03 -1000, Steve Sakoman wrote:
> > > > We are seeing reproducibility issues where gcc-cross sometimes defa=
ults
> > > > to gnu11 and other times to gnu17.
> > >=20
> > > Why is gcc-cross doing that? It is supposed to be deterministic so we
> > > really need to get to the bottom of this :/.
> >=20
> > I think the previous patch to enforce OE cflags is exposing this
> > problem.
>=20
> No, the problem also exists without the previous patch.
>=20
> Richard suggested the backport as a potential solution, since it fixed
> a repro issue in master.
>=20
> It turned out to not be a complete fix in dunfell, hence my second patch.
>=20
> I agree that it would be good to get to the bottom of the gcc
> reproducibility problem.  But until we do, this second patch will fix
> the issue now and will do no harm once gcc is fixed since it is just
> explicitly specifying what should be the gcc default.

I worry that if we merge that, we'll not spend the time needed to get
to the bottom of the gcc issue :(. We don't know if the issue is there
on master or not :/.

Cheers,

Richard

