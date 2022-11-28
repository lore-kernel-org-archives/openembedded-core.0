Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9BEC4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 16:35:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.122748.1669653338300979344
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 08:35:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fmXnXDZb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso8802718wmo.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 08:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RYbucHog/xBqXThyQzT86s+TTDDUo+ob0ZaKAbr4ruo=;
        b=fmXnXDZbc8QHBzi72q0rBReWFIm1BYRnLni3seqxbVa7auDvKYOhQQwdxFCxFCqqzh
         iMA7rv8TTc7q7+L99LYXlWxyj4jB70hz3W/9Uw4K4vIp4+Fv3Q3OtJ8TGmU0bOrP890c
         HwzAfZqHhjUSjjccGYkMl1l7B8eJh00XiKKYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RYbucHog/xBqXThyQzT86s+TTDDUo+ob0ZaKAbr4ruo=;
        b=PXLSKiIUmx8q4+eIDix+eCnPARE3jDKFcwU6PcwB9NEk6Uk7YIdspLmdMt+x89dSPr
         VAvmKAPODv+9F09aKXJd2/psQtIjT+o57qBXGpQX9LUP5VrcM2SeY87RuTVTNL5RA/Ag
         dXI3dXWPffTuRDRm29i1Wf3u742Oy/eXv+xSrLqE8zBQQKh55imALGXaKIT8bUNdfB+7
         toKZPvgdlsyI+RdCWeK/TjgBeogBqlZ4IN65bbQzMFN6SlX0kLIVifBbQm7bm/7dez51
         /476raOTuMU8wwTWcaOmHE3nJQKS6Dj1N2IVvFu1HKtW95j4jYlCCzpC+WwLHe1mWnre
         3sVg==
X-Gm-Message-State: ANoB5pn2dZDngT5axXoCVqeqQQw/xOl0g5/ArItnx/LyyX3gRR8LuD02
	i60NhGzC+iPGSTF1eE03Lnw4Qw==
X-Google-Smtp-Source: AA0mqf6pvVuKz1YC+M4dPmV5aJ3lBdUYOnk9KaL043FNj1eiIoctbSgAk21aNwOze0/l8ZIh/CiFmg==
X-Received: by 2002:a05:600c:1e1a:b0:3cf:7959:d8be with SMTP id ay26-20020a05600c1e1a00b003cf7959d8bemr31291310wmb.85.1669653336700;
        Mon, 28 Nov 2022 08:35:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1da4:7286:b644:a924? ([2001:8b0:aba:5f3c:1da4:7286:b644:a924])
        by smtp.gmail.com with ESMTPSA id z4-20020a05600c0a0400b003c70191f267sm21802421wmp.39.2022.11.28.08.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:35:36 -0800 (PST)
Message-ID: <5c3727292185042fe2bcdba5e0d42ad8fa40ca12.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RFC] base: Switch to use addpylib directive
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Vishal Bhoj <vishal.bhoj@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2022 16:35:35 +0000
In-Reply-To: <CAKdWgSwO_C22j+0SYRNAf-q_ZueV7Jf3bkrZ7WSf7w+BhktmyA@mail.gmail.com>
References: <20221127213640.539995-1-richard.purdie@linuxfoundation.org>
	 <CAKdWgSw2tZ68R531RZgi2bqLrdOXkc1oZnxM_rEugv7S-ysOUA@mail.gmail.com>
	 <89a3d3880e4da3f35326c7c3c2d4c904bae5f2aa.camel@linuxfoundation.org>
	 <CAKdWgSwO_C22j+0SYRNAf-q_ZueV7Jf3bkrZ7WSf7w+BhktmyA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 16:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173932

On Mon, 2022-11-28 at 21:00 +0530, Vishal Bhoj wrote:
>=20
>=20
> On Mon, 28 Nov 2022 at 20:14, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2022-11-28 at 19:29 +0530, Vishal Bhoj wrote:
> > > I get the below backtrace with this patch on master-next. The
> > > same
> > > patchset works fine on debian-11. Are there any specific versions
> > > of
> > > packages that need to be installed as=C2=A0=C2=A0dependency=C2=A0?
> > >=20
> > > Tested on host os: ubuntu-18.04/ubuntu-20.04=C2=A0
> >=20
> >=20
> > Which python versions are those? It looks like I perhaps assumed a
> > piece of newer python syntax accidentally. I suspect this code only
> > works with python 3.9+:
> >=20
>=20
>=20
> Looks like it is the case:
> ubuntu-18.04: python 3.6
> ubuntu-20.04: python 3.8
>=20

Thanks. I've tested and performance is the same without this chunk of
code so I've sent an updated version.

Cheers,

Richard

