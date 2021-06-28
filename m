Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.10791.1624885421881218909
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 06:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZHtXZBDC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id o22so10476916wms.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 06:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=fEo00R0HYxVw+tIn/BndpXTovn8IxXdwlnHNTkXId/c=;
        b=ZHtXZBDCNpO3DUVneWfiozYDg3GLZgEC82yo/lE/n50fNUJP6oSCzQ6a+mCEto1nDh
         OtHp3ruJ13kha23aYifazX0ltyvVIPIIJud+wCc041xs9osvblxTrW1a+dV4liW1v6dz
         dmWiBYdzdbMUitlIVlTakWKuLWala1eiIGLnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fEo00R0HYxVw+tIn/BndpXTovn8IxXdwlnHNTkXId/c=;
        b=DKzIOMgz1P2Q3F/naLY34IGRgVpPHidsu7zgvcT68+r37WluUz+gmPdYjZ6l1skqtS
         n6+oJeOoePEN0CsVQhBfrD65MKQB3+y7oysiKbsqfOO8RprtavnucyZpDAiz6QjfDok+
         r2MgVoJDRL9Sd7l+nrqoP5JxxVQGUV+jB5PPlbMRz98DWZAojPLr8jEUpnaS9FuR6b5u
         +2UhEoqWpFO3sqrnr2wpy9w+OLwrV7IXLrE4vHUQSz0km58PrvIcLCGdpOzcRjA6vMW7
         12fP/eQGrAMNZSy/sjmTH4qFnSkN5ViOvK5rOZMq+FApMOtG/bVG6nOiiP0ezGhuRjfY
         gnwA==
X-Gm-Message-State: AOAM533hDHmOoJnURv3CA8B0oZBRMxfDdGELM2Vmk6GqP01lfaWWrOso
	oQMrCeHm8cEyMr4wFJoRkkdxxA==
X-Google-Smtp-Source: ABdhPJzxc9Xv2VquDB62ZBD8dO7yIhuYut6y3XPFkgqXrt9JXf8y5SRaQhFpS9mg0dUHMa29k8r2YQ==
X-Received: by 2002:a1c:4682:: with SMTP id t124mr26271355wma.161.1624885420215;
        Mon, 28 Jun 2021 06:03:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6f48:4aa9:490d:a26? ([2001:8b0:aba:5f3c:6f48:4aa9:490d:a26])
        by smtp.gmail.com with ESMTPSA id i9sm14407443wrn.13.2021.06.28.06.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 06:03:39 -0700 (PDT)
Message-ID: <41c8f86302dbdf6be6d6dc4f057619e26b05c7ad.camel@linuxfoundation.org>
Subject: Re: [OE-core] RFC: pulseaudio vs. meson vs. neon
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrea Adami <andrea.adami@gmail.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jun 2021 14:03:39 +0100
In-Reply-To: <CAAQYJAvGNSy2CAD6Dwk2-LYz-KGUp-pFjXtOLKD_1iD4SOaghQ@mail.gmail.com>
References: 
	<CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
	 <CANNYZj_yZHkpbGKPaec_x4AQDQ8jR_rLk1mroBZxn6JCpQ9WbQ@mail.gmail.com>
	 <CAAQYJAspv72aL7J_fYri+vk_OfL=PDNCvGk9C6O=CisB3dEPeg@mail.gmail.com>
	 <CANNYZj-XL7NB0S=3bTv9DMvhbMTmUfJFK627YAqQ4for3QMDqA@mail.gmail.com>
	 <CAAQYJAvGNSy2CAD6Dwk2-LYz-KGUp-pFjXtOLKD_1iD4SOaghQ@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-06-28 at 14:44 +0200, Andrea Adami wrote:
> On Mon, Jun 28, 2021 at 2:36 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> > 
> > What I am saying is, can you discuss this with upstream first please?
> 
> Sorry, no, I'm not in the position to do that.
> Besides, I am dispatching my armv4/armv5te Zaurus hardware so I will
> not be able to test anymore.
> 
> My point here is, for this pulseaudio 14.x release (in Honister) we
> could do an effort and patch the damn file.
> I write this because this is the only failing recipe for
> core-image-sato for armv4 and this arch is still supported in oe-core
> (thank you so much Khem).
> 
> So I'd say as long as armv4 and armv5t are supported we need to patch
> the recipe.
> 
> With next pulseaudio 15.x the older arm will maybe lose support, I
> don't know now.

We've left armv4 "support" in there mainly as it doesn't really cost us
anything to do so and does help some users. We're not in a position
where we have many people interested in helping carry patches like this
to pulseaudio.

What that means is that where there are fixes, they need to be easy to 
maintain and not impact the more modern tunes.

Hacking CC as in the patch you linked to isn't particularly nice, nor
is a global export it requires (changing the behaviour of other arches). 
It is also risky as the pulseaudio build system tries to do something
quite different and this workaround is liable to break.

I'm not against patching in an explicit option to pulseaudio but it
would also be good to mention that to upstream, raising the fact there
is a problem, contra to what their commit says.

Cheers,

Richard



