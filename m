Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22D3C43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 13:19:46 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.21763.1657718382410633777
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 06:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y0+HHIjC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 p27-20020a05600c1d9b00b003a2f36054d0so1168760wms.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=hHLdLZDwKZ2bkYseuUg1xDTVnQgSXarCTOgT6O9/luQ=;
        b=Y0+HHIjCqcS36jFJGLaOYmMX96f5AmR2T+dLLLZqfT/hGu/tIFa1VtZByQ6xd6B1Pm
         7Ta285mfcvAZ5KmT7b7og5eql/gEUGNdFclzsQvPJfkPpR28Xo8MZ+yNxYjBkOg7L7Pq
         qoJgg+G0i3kGX9EA9qU3ExFkZ1fHuy5lT2W5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=hHLdLZDwKZ2bkYseuUg1xDTVnQgSXarCTOgT6O9/luQ=;
        b=7I3ybbuPPXrrQoCEjhmN7p80iYiW5FBhpwPoNtf7Eb9Hi6aexu+f/z6xZp0J0YxHa1
         8SoZVtQXAOMTVe9gBwXaJagvCXeIenICI5tyG+zbCmr6DsX3OnKtACzFdjPAM0yaXNcs
         AavAd2M+7QfUXT6ELETyUORhvOf+UE0xXZ+uXa1TsFr3zjROUevt+NFQ4W+N65w/bGgP
         z5hxTKa6yqg2I2CDLOLtGu+3L3lCAvZLXecEPj0iSDBdcm51hRvgxR/PaTE3ZDSaoKUp
         OOUb8jPpGNOv3A//Uf4Ih1eHa4uiAMndL7XIoRZMIinWe4k7wWTz1X2vycLSj043D3UM
         X57Q==
X-Gm-Message-State: AJIora9p5Z69Iez48/Jq4H9iS3YVSFFX6N0WSMCNvye8TN3q8misaYet
	Grchehl9ia+QeHWlprNqso2w+g==
X-Google-Smtp-Source: 
 AGRyM1vXY1ol1h0Lq3+cIaY29v5l5d0FmAPVhYj2S32iQdRixt3MijiABmUAPwa/Qa3K9vlnCB16CA==
X-Received: by 2002:a05:600c:4e54:b0:3a0:4e07:ce with SMTP id
 e20-20020a05600c4e5400b003a04e0700cemr3661255wmq.37.1657718380681;
        Wed, 13 Jul 2022 06:19:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5d1c:2bb3:e975:b527?
 ([2001:8b0:aba:5f3c:5d1c:2bb3:e975:b527])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a5d69c6000000b0021d69860b66sm13838603wrw.9.2022.07.13.06.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 06:19:39 -0700 (PDT)
Message-ID: 
 <9f596d5368294084433399218427fb0d14031fd1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Paul Eggleton
	 <paul.eggleton@microsoft.com>
Date: Wed, 13 Jul 2022 14:19:38 +0100
In-Reply-To: 
 <CAMw=ZnQxrxMS_B-5RYp+krab8s6yR+5ny_q1_ioaL=W-u68XdQ@mail.gmail.com>
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
	 <ba078de5f59105d61daed5b8abc69cd1e15bc43e.camel@linuxfoundation.org>
	 <CAMw=ZnRwkp6nkZzqw69Xc83xDp0QRCZ+MNwHx=QiTdmncZ5L3A@mail.gmail.com>
	 <d4dd373c6d1718f6fd417c8484a057268df6d495.camel@linuxfoundation.org>
	 <CAMw=ZnQxrxMS_B-5RYp+krab8s6yR+5ny_q1_ioaL=W-u68XdQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 13:19:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167957

On Wed, 2022-07-13 at 00:30 +0100, Luca Boccassi wrote:
> On Tue, 12 Jul 2022 at 22:55, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > The configuration is yocto-autobuilder-helper but the best place to
> > start is probably the poky-altcfg distro config.
> >=20
> > Once we change that we'll have to run through the testing, see how much
> > breaks and then find someone to try and fix any issues if/as needed.
> > There is a lot of work just in pulling things together for testing and
> > triaging the result and I'm depressed it will probably end up on my
> > plate when I personally disagree with the decision.
>=20
> We've been running this configuration internally for ~3 years in our
> Yocto downstream, never seen any issue, not even at the beginning, it
> just worked.
> Nowadays most major distros have switched over, Gentoo's the other one
> left but it's planned for this year.
> Any issues in upstream softwares should have been fixed years ago when
> Fedora started the process.
> So hopefully it shouldn't be too bad?

My worry is the QA framework and tests likely haven't been used with
it. It may be fine or it may not. I do know how much of my time this
stuff takes up with other issues.

> > I was asked earlier today if we should just make the systemd include
> > files force usrmerge on. The challenge is that OE/YP give users choice
> > to configure their system how they wish, we don't just force
> > configurations upon them. Or only real option is therefore to throw
> > errors and have them decide what to do (which basically amounts to
> > submitting to the upstream decision).
> >=20
> > > Also is a deprecation notification needed? How is it handled usually?
> >=20
> > Do we have time for such a notification or are we in the situation
> > where we just throw errors to the user and let them agree to the
> > usrmerge change? The timescale is unclear but if the systems are
> > already throwing deprecation warnings at runtime, this isn't a good
> > experience for our users.
>=20
> It's not urgent. But the build-time warning has been in place for a
> couple of years now, you should have already seen it.

I haven't :(.

> The runtime is a taint flag in 'systemctl status', and was introduced
> in the most recent release.
> There is no timeline as of now for dropping legacy compat code and
> configuration, as the runtime taint was just added.
> Certainly won't be this year. I've been doing the rounds ensuring
> everyone who hasn't switched already is aware with plenty of time to
> spare.

Well, it is good to have the warning, thanks.

>=20
> > > Aside from process details, I assume there's no problem with doing th=
e
> > > change in principle?
> >=20
> > There is, but it appears a done deal which we just have to accept so
> > I'm trying not to start a discussion which I don't think can go
> > anywhere productive. If this isn't a done deal, then let me know as
> > that would be different.
>=20
> It is a done deal as far as we are concerned upstream, matter of
> 'when' not 'if'.

This is not going to help systemd's reputation. Basically, we have to
do what Fedora does and look as we're told to, which does go against
our configurability objective. We already have tensions around musl and
this will further demonstrate our direction and systemd's are not
aligned. I do understand why systemd is doing what it is doing and that
it really doesn't care about our use cases. That doesn't stop some
users wanting it (but also wanting other things we have like musl).

Cheers,

Richard


