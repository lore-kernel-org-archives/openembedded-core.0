Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4752FCE79AB
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 09:16:45 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.33372.1695201395262768376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 02:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wf7J2u7F;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b703a0453fso109872681fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 02:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695201393; x=1695806193; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6ppHvUoX38bL63anNKNrniKBltt7AZFcRA4HvOtW6io=;
        b=Wf7J2u7FEwoq78XPm2iEaHkytis4iTLR4g6Wx/iPvCEwTkIyTegjtavvd8uCGA4VIs
         zSzYsb1fBMqRqqZuhwjLYnQshsVLvxd8p7+AXU3mGxFkpt8NMzzQq2/RSMUyzlh13Kqv
         1aALd3KGMOxlO9zMMgDExgO2QAkI/4hdJ34Kt6IiBZm8I63LAsHRx/5PBVCpT5DzLeua
         YOYklZXuNABVf/4Y199Jc1+QCrVYbXBzoFfMW0G+WeiSz12Ek2VOeIh1Cb6A9d7vnbPG
         27xMUW2IDle6U3AVagZoUsxNoQd025TkjmYu9XBdP1ZjP6GsooZFGFFqPa3nyo2bHAGF
         YFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695201393; x=1695806193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ppHvUoX38bL63anNKNrniKBltt7AZFcRA4HvOtW6io=;
        b=LTJJ3eZx1IOkQ+/x6hsvnj3FJowiIo86RByRdx4XnQ7yAd/CkuFdc6kXoXdlTWtElN
         cMiy82QH/EQ1VDCwXAEEYIxS7wUm9rUf7vsqixZm35zYEHeSEubHratgpj8OOkjtBezZ
         kdVtJsJ0zmaru938KEPiUY8kljDCD+7QfQ74FOigjkjSmSuyQN1cxmtoRHR2fdgZB0NT
         0s3YjhlMldh13uTHLLQft9B7SFqnTq+X9ayJxztD6taNejzttU/HKK8aKeFhOpZ017sB
         6IZQDF8XNriE05ptLaN0JmJHbvrxnA1W0ZPcuF0441M8AaguJDi0QZ9+xyjxpmz4ez37
         B0iA==
X-Gm-Message-State: AOJu0YybTCvfQaIzJylP1F/NJfgbqKYsq+u5/wXl+64K/Uwjsb0T3dwE
	Li4vv4JwN+AniDhwFPgiv82YddH678pxolStGtCz73+Z
X-Google-Smtp-Source: AGHT+IFcYQQBc8I8CVjt4nuflu4v8aaeZVL470ygQFoX7T20QxQiJRGEB9wAKc2/yNfUTUHVKaOjeUGdvSiEWxMbY/Y=
X-Received: by 2002:a2e:8095:0:b0:2bc:f739:2eda with SMTP id
 i21-20020a2e8095000000b002bcf7392edamr1550208ljg.5.1695201393216; Wed, 20 Sep
 2023 02:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230920090312.2496296-1-f_l_k@t-online.de> <CANNYZj8HKKdRo=yDwsCopP8oZBpz=xyp78GUHOajcdkDQjA0=Q@mail.gmail.com>
 <NO1A1S.XMF9OFTDUIW41@t-online.de>
In-Reply-To: <NO1A1S.XMF9OFTDUIW41@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Sep 2023 11:16:21 +0200
Message-ID: <CANNYZj_jBuT6CSMqY6xC8k0aLZKy42wxwTHzj2c+BQ74CpijqQ@mail.gmail.com>
Subject: Re: [oe-core][PATCHv3] vte: upgrade 2.72.2 -> 2.74.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 09:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187908

On Wed, 20 Sept 2023 at 11:14, Markus Volk <f_l_k@t-online.de> wrote:
> in this case it would be better to drop nativesdk option from vte
> The challange I guess would be to not build nativesdk for gtk+3/gtk4. As long as we allow to build them for nativesdk, vte will also depend on it.

Not at all. If X depends on Y, and Y is enabled for nativesdk, that
doesn't mean that X needs that as well. matchbox-terminal depends on
vte, but isn't enabled for nativesdk.

Alex

