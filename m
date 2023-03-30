Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10CCC761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 16:39:12 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.30569.1680194349883115441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 09:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bhxPvQyp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id m2so19730513wrh.6
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 09:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680194348;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kIELM1N8Qcj8dsRMnGOudsGjxO53K2hVH/BCDNlOgBg=;
        b=bhxPvQypI+w9i4+pIYtBWEO7IlHxpKL4vFMdz8BSlWAuMsPULtdrO1tGPieCHe8o9g
         FZmoJ4vXxoTk3Wt17YeX4g06NAHazl+LShIowUm4JX6psZUjk4OvA0MQkuOlbIaSUy0k
         9+iKOGvN0V+RtJeLTNayLqwkv6rK7CALlfEvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680194348;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kIELM1N8Qcj8dsRMnGOudsGjxO53K2hVH/BCDNlOgBg=;
        b=KBcbNl6YWUUY9rF9FPflvC0jFoqgrYrFwrzdLtymGA7FlllAe5c/Jeiyc1dp/hCWHy
         Zl7WrVIiHhY/XNkWIUhcW9ZKS3J8NrUmYjSlRMSzjHLX+VglsR593dwmfmbOb80hQSZK
         uL3rhtvypXyg6J3MPM//HwjK7XAeEQ3eC390ALjTIwk8eijUidoFksAu/xhvs3hbxBCt
         Pughf0mnZ107TrJGWUGO6X+x/QEmpSVRDIVyTYn8EicZOs7U82BCrOe4/hq1BfEcXgLq
         obae2qgMaUrxFvmDl9fE7B4imdM/8WB5oQMQROBRFsQXj+gDXmywXGvxTuA0opLGIXvU
         IFTA==
X-Gm-Message-State: AAQBX9cFZHiKsN2S/y/06IEY079rb/V47KH/7DLG0NwV8HJnnqiPuzlP
	SGmAurQO+w7ThLjcTzXTAp2blg==
X-Google-Smtp-Source: AKy350aRzUlcLwE5DUKTd062JsyfRVvM5AuCyciKFfLvvySWONCbLFgf3qXdqweq5tRkm8ZJ8tzN3g==
X-Received: by 2002:adf:dcc5:0:b0:2e5:982:3805 with SMTP id x5-20020adfdcc5000000b002e509823805mr1702910wrm.59.1680194348345;
        Thu, 30 Mar 2023 09:39:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:77e0:6cb9:7d92:358e? ([2001:8b0:aba:5f3c:77e0:6cb9:7d92:358e])
        by smtp.gmail.com with ESMTPSA id t6-20020adff606000000b002d828a9f9ddsm25166423wrp.115.2023.03.30.09.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 09:39:08 -0700 (PDT)
Message-ID: <ab068d9c1e16fe78ea74b25a30412b55cad616a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Zoltan Boszormenyi
	 <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2023 17:39:07 +0100
In-Reply-To: <CANNYZj9uYcBaDHgBABrnjCuH9AGTEQ8PhkxuJBm+FaTTNkwaPw@mail.gmail.com>
References: <20230330134214.2772913-1-zboszor@gmail.com>
	 <a25c3a41d623242edf004723dc94518228cfc1da.camel@linuxfoundation.org>
	 <869f611a-1645-52b6-1f3b-e4b605f2ddd4@gmail.com>
	 <CANNYZj9uYcBaDHgBABrnjCuH9AGTEQ8PhkxuJBm+FaTTNkwaPw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 16:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179345

On Thu, 2023-03-30 at 16:10 +0200, Alexander Kanavin wrote:
> On Thu, 30 Mar 2023 at 16:08, Zoltan Boszormenyi <zboszor@gmail.com> wrot=
e:
> > Please see the MR:
> > https://gitlab.freedesktop.org/libfprint/libfprint/-/merge_requests/431
> >=20
> > udev (provided by systemd) -> libgudev -> libfprint
> > also:
> > udev-native -> libgudev-native -> libfprint-native -> libfprint
> >=20
> > Also, please read the TODO part of the patch for systemd
> > and consider it.
>=20
> We can simply direct libfprint to run its own target pieces under qemu
> usermode, and avoid all this nasty native stuff. Meson has direct
> support for it, and even if it doesn't work, libfprint can be patched
> to use a custom 'wrapper' for executing the binaries.

Before we jump to using qemu user mode, the first question has to be do
we really need a libgudev native to make libfprint-native work enough
to build libprintf.

I'd hope the answer is no, we don't as we don't want the build systems
udev setup/devices leaking into a target build.

We intentionally try and keep native dependencies minimal and needing
native udev/systemd versions of things sets of warnings in my mind and
in others since it often means we're doing things we shouldn't be or
don't actually need.

I appreciate there are issues with systemctl-native but those are
separate issues and should be addressed as such. Complicating the build
dependencies unnecessarily is bad and we should minimise them where
possible. it isn't that I didn't read that bit of the patch, I just
don't see it as a reason to have this dependency for libfprint.

So, I come back to the question of what libfprint needs from libfprint-
native and whether it really does need udev for that?

Cheers,

Richard

