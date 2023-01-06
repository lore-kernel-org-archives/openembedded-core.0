Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D67C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 10:36:19 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.11022.1673001376022842234
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 02:36:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JK6zGnsD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id bk16so875907wrb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 02:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vrSRyQ69YfehvqU/vSQ6FXWlljxv6G5mKvRbKb0WWHE=;
        b=JK6zGnsDvGOqWehXs60avuP9In2wnbMemtQct1C9R68jRs38MrrHpKQ24tDEFTYbV5
         lLPkfEtELQmPr5+1SOzTfVXHuuOgDk1TDsUtYI623HQP5KAUU7NSm/xySyasmfoKbAUX
         dF5yhQQ1THf0R3rZru7wB5jpdSvcQ/rWHli84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vrSRyQ69YfehvqU/vSQ6FXWlljxv6G5mKvRbKb0WWHE=;
        b=hcPpqC0FjS9kGFo8Dqbc6DNCcNZ+Sp8xNTGuyj/9IDVvkq65XyL1Qf8NxFqQN3JmCy
         s4XBUrAG7VL6nkTdvdcGLAVNRg5/6uqHf8luNtFcKwcv6BokIwBIudNgrE9inllJsJwm
         oWVDMDrp65eS+ByTc8hhE90v+X/0jpEDNbSE03CSODsjotLNfK8rBzljIlWvfJlxgkQ3
         +aLv/GbHOLeEWJcwnkeetLWWB/qhfSIkPJp5B0n7NDaiS7iTGoQTjfflN+pm84Ufk7XP
         0JRV+KDvMcFtoe6srx2T3ZpzHPGA7XsFtkbMxy7+3AmBEMaasGd37ib1B8KC3jklsL7D
         qNAg==
X-Gm-Message-State: AFqh2koz4IbJdyyF0l0LsuoRRcr6yrBgL/U32uh8YWo06grlACbppZf2
	g5qw62VzOdoxEVMGaUrupVQQKw==
X-Google-Smtp-Source: AMrXdXvxw/tEROKjnW8NqY2mP9E8ZDbvtQ6inNPdFKAsiGF+r8cnO3HEV5RYN2ZyWUaNtvqFgq02lA==
X-Received: by 2002:a05:6000:789:b0:242:43d1:6d8a with SMTP id bu9-20020a056000078900b0024243d16d8amr42336233wrb.59.1673001374433;
        Fri, 06 Jan 2023 02:36:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:49cf:c46d:e32d:e951? ([2001:8b0:aba:5f3c:49cf:c46d:e32d:e951])
        by smtp.gmail.com with ESMTPSA id z18-20020a5d44d2000000b002368f6b56desm950477wrr.18.2023.01.06.02.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 02:36:14 -0800 (PST)
Message-ID: <de6ea321f2dbd0eb5b7d1fd867af7327f0bdb1a2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcr: add opengl to REQUIRED_DISTRO_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Yu, Mingli"
	 <Mingli.Yu@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2023 10:36:13 +0000
In-Reply-To: <CANNYZj-BCH5XkMMcYMQSAdKSk-YGYLf5xk-pBbt6ekC6qPaa3Q@mail.gmail.com>
References: <20221223093229.823322-1-mingli.yu@eng.windriver.com>
	 <CANNYZj-iY82hN76qV6DZSfMHobF30hM7rKRXkVwFUYGDV1AkJw@mail.gmail.com>
	 <CO1PR11MB50090C2DFF0949D0B90ED483F1FA9@CO1PR11MB5009.namprd11.prod.outlook.com>
	 <CANNYZj9GAPNapBr3PyxAmj-JaiGRV=EnR1YqZnPXA5Yuf+_02A@mail.gmail.com>
	 <CO1PR11MB5009A23CA03A78D7FB67DA2EF1FB9@CO1PR11MB5009.namprd11.prod.outlook.com>
	 <CANNYZj-BCH5XkMMcYMQSAdKSk-YGYLf5xk-pBbt6ekC6qPaa3Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 10:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175571

On Fri, 2023-01-06 at 10:19 +0100, Alexander Kanavin wrote:
> I understand where it comes from, and that's not what I'm trying to
> express. Why do we need to insert those REQUIRED_DISTRO_FEATURES lines
> into every recipe that, directly, or indirectly depends on an opengl
> implementation, even when the component itself uses nothing from the
> opengl stack?
>=20
> With gtk4 becoming one of those items, this really does become a
> maintenance burden.
>=20
> What would happen if we instead drop them all, and keep
> REQUIRED_DISTRO_FEATURES only in the opengl provider itself, which
> would be mesa?

There is a bitbake 'limitation' where these things don't automatically
flow through dependency chains. The net result of that is that if you
just do this in mesa, "bitbake world" would show errors that XXX can't
find dependency mesa or opengl.

The first thought is, 'lets just make bitbake flow them' however the
trouble is bitbake can't know when this is appropriate and when it is
not.

For example, imagine the dependency is "virtual/libc" and somehow you
break the providers of it, i.e. break the glibc recipe. All of a sudden
"bitbake world" would return success even though it built nothing since
anything depending on virtual/libc was magically removed (which is
nearly everything at some point).

The conclusion I came too last time I thought about this was they we
really did want to mark up the cases where things have a specific
requirement, even if at times that is painful.

Cheers,

Richard

