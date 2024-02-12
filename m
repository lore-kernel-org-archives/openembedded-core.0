Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70BB2C4829E
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 22:43:46 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.854.1707777823207673773
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 14:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lrCBR360;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-410c804e933so12595575e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707777821; x=1708382621; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tal2B18UR0JvXprIViTqHLCtsWTF16B4T35zLMbfKaI=;
        b=lrCBR360odH3jvYZJ88v9x0vxtovkNuJIeRj6upoRFo3ry31PGEr/RD2+nH+YmG+xj
         b44lPv95UGCfvJv1+1HAxeO6DETTLp8cPxiWaWITTflRqtUn+KPskXgmUSDNBVHa0mYu
         RSmv4yVvXoF+EaobYf27oGz9Iue7a4cZeJ3cH8O+V1MlzEUy6sgmkQK1cTLQzJLYty+Z
         nEkTQgir34DyfysemxlVtLQcGs4rUd0RSkWsUG5gNaCG7fEgzJx/Gr8koajYYBRm6oDJ
         V9Od0lpL0d9d3oU3aMDSgJL29xk93qOyzi9+WvCQJGAk1n3j6c7YtMWmkDqfP8Njazyh
         2vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707777821; x=1708382621;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tal2B18UR0JvXprIViTqHLCtsWTF16B4T35zLMbfKaI=;
        b=vwCWdI4Y4s/ZpAPcdoyB18I383snzavyCe5ZlM2+Dbzh6BWwrq3a+iEe5rj1fzw+ti
         hRlZbaCey1UlZsCixf6w8MdwfiumP/fCPf+ABDqZnntrSBeRpeOD2qbr3UtKM2mkRcKZ
         7rtToTdEBOHMFIeuae4Am0lNCuzJUaHFiaUHg334DZdMMo9ONHWUnMi+ib4IvVb8o0R0
         oMjP/ocBidvlT6rpoQadaMHuNLYtGL9cGVzBUikNVE2r6XLC/QLE6egXHYc861WFP8Tn
         RuuzTGbh/d4x1bjlwwyj7VROWNEdjb27O+M3SCX9FAI+/QaEhWvHHrSFE5IgWfpCpYyb
         F6tw==
X-Gm-Message-State: AOJu0Ywe6bDK7IfZvp4mrgJHiNudkldgD1WlsflRMSJTSnbw2wChw8Iz
	qNnt0D0L+ZmTn7UnVO5fU/vqDQ9RG/k7R+twUTYvuk7EKn65hz8b
X-Google-Smtp-Source: AGHT+IEW+q9H3p9Q7oqQmJrfL0S+i0WCeVMvoUscUSkuMqXKjy/OjStb7Pc26DvxTKBeUvbxculDjQ==
X-Received: by 2002:adf:e384:0:b0:33b:49da:22e5 with SMTP id e4-20020adfe384000000b0033b49da22e5mr6282927wrm.9.1707777821370;
        Mon, 12 Feb 2024 14:43:41 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id k9-20020a05600c1c8900b00410d7e55e5asm4038812wms.3.2024.02.12.14.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 14:43:40 -0800 (PST)
Message-ID: <41652303df50bbbe33931faf78515af5a8667993.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] vscode: improve settings for new yocto plugin
From: adrian.freihofer@gmail.com
To: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2024 23:43:40 +0100
In-Reply-To: <62436f79-ff09-4084-8e94-55e055198b6a@savoirfairelinux.com>
References: <20240209203029.3801065-1-adrian.freihofer@siemens.com>
	 <7bfdb37aa85722d20776c58b4d8a61233f5ae23a.camel@linuxfoundation.org>
	 <40d4cf0612a459eb5405a802aebb0fb09fbb5b8a.camel@gmail.com>
	 <5acae196-d10c-42e3-b201-e4acc61e55c5@savoirfairelinux.com>
	 <8ed89336017da50392be926a152a10901c8ceea7.camel@gmail.com>
	 <62436f79-ff09-4084-8e94-55e055198b6a@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 22:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195366

Hi Enguerrand
>=20


My first solution was too complicated. After re-thinking it, I replaced
it by a much simpler implementation: The new implementation is about
extending the templates which are already in poky.

> What I like with your new script is that it produces a seamless=20
> equivalent to the previous static config. If the static config cannot
> be=20
> versioned (I still didn't understand why), then yes, creating the
> file=20
> seems like the way to go. However, I have a few concerns with the=20
> current implementation:
> =C2=A0 1. If the user has different settings, they may be corrupted by th=
e
> script when running oe-init-build-env. My suggestion would be to not=20
> generate anything if a settings.json is already present.

Yes, that's simple and exactly what the new implementation does.

> =C2=A0 2. Would just having the static file somewhere and simply copying
> it=20
> work rather than assembling it? What other dynamic configurations are
> addressed with your script?
>=20
Yes, that's more or less what the template does.

> I'm not sure I understand what kind of users and workflows are
> targeted=20
> by this script and how it connects with the documentation guiding
> flows.=20
> Should we rather edit the plugin's guide example configurations for
> poky?

I think it should just work out of the box at least for the default use
case which is also documented in the Yocto quick setup guide. And
that's what it does with the few lines of code which I just pushed to
https://git.yoctoproject.org/poky-contrib/log/?h=3Dadrianf/vscode-yocto-plu=
gin

What do you think?

Thank you and best regards,
Adrian


