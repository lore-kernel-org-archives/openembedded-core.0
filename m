Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D405AC433FE
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 15:16:38 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.151971.1669734991789294665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 07:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EmaWSef1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id bs21so22603772wrb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 07:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUcb1Yr7GR5Dl0HZMcReP+2IAI0X30WP4Bt+xhI7nxw=;
        b=EmaWSef1NFF2Xokl0AF0wp8vYUWGkitDULCWoORT12TRJFdvgrEoYMARs3dLsb7hYV
         3ajIWKRlGfeo25zng9ksdaVXPy2xDTbsFvMAipkL3gmUGiwqh8DSM2OFzwK4Qu/Sz2i9
         eJz/feVqzti7Gpn7wSmBXd33jMiLc8SvKqOAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qUcb1Yr7GR5Dl0HZMcReP+2IAI0X30WP4Bt+xhI7nxw=;
        b=vw4tQDpzEF/EitrryBf9b2jui1GOLu5JABAbVR+fgSH9/rOD/5oV3hEsXMjHfpYmQ7
         rARixxTiNtf2uJ2HL/6GQsGCiUazfYAWuqa6F7gFjRAUqBJUySY+aIq66Mi8IeFBAXlP
         HYpmKlyznAtbMVNdD/VUdw0YWeaP2lB6i/mTZy3CxvIKn3qciuQoRvMZ7Fqg+sHunR1W
         80Mlli+BBfI4wENQyuO3BYVOh7ySeo56/FBcha/lpPCb4+O479IDiqp5IkXEVj6wbtyY
         EtRFxLlvaNoN13B65MAp6q37ZZ+heg6F1lvA3qGNKJzP3zfo8xpU2g/iVor6fH8a2w1P
         3wWA==
X-Gm-Message-State: ANoB5pkfP7rw2Bgcxxfu4n1fp5ODp74yqFdxZi5boFYNeR4IvhKsShXa
	aNgEdTIxts5SE+HTYlOKoeawjw==
X-Google-Smtp-Source: AA0mqf7ZJrVfk42OHIuplqssg+TEpnJPs23KLCugHfzgnsCwJ/Z/qsF6Ogfo1PKV3FdegNbhdAEEig==
X-Received: by 2002:adf:f406:0:b0:235:e6a9:b492 with SMTP id g6-20020adff406000000b00235e6a9b492mr23527962wro.212.1669734989972;
        Tue, 29 Nov 2022 07:16:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:426:d29f:e451:e2dd? ([2001:8b0:aba:5f3c:426:d29f:e451:e2dd])
        by smtp.gmail.com with ESMTPSA id i8-20020a5d4388000000b00228d52b935asm14114587wrq.71.2022.11.29.07.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 07:16:29 -0800 (PST)
Message-ID: <85366683dfe3845128d1396287cc2288e9c18663.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2][master] go: Update reproducibility patch
 to fix panic errors
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ryan Eatmon <reatmon@ti.com>, raj.khem@gmail.com, 
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2022 15:16:27 +0000
In-Reply-To: <4b9cf683-b93c-b395-73b8-9b36d586c76c@ti.com>
References: <20221129122302.14589-1-reatmon@ti.com>
	 <c9c1630165f51411750d4ca7715bfb4c625916e1.camel@linuxfoundation.org>
	 <4b9cf683-b93c-b395-73b8-9b36d586c76c@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 15:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173977

On Tue, 2022-11-29 at 08:42 -0600, Ryan Eatmon wrote:
>=20
> On 11/29/2022 8:15, Richard Purdie wrote:
> > On Tue, 2022-11-29 at 06:23 -0600, Ryan Eatmon via
> > lists.openembedded.org wrote:
> > > Based on a discussion on the mailing list [1], there are panic
> > > errors that occur on a few platforms caused by the patch.  We
> > > cannot simply remove the original patch due to the
> > > reproducibility issues that it addresses, so this patch on the
> > > original patch fixes the cause of the panic errors.
> > >=20
> > > The previous version of this patch was a little too aggressive
> > > in cleaning up the environment.  Some of the variables impacted
> > > by the filerCompilerFlags() function require at least one value
> > > to remain in the array.  In this case, the values for ccExe,
> > > cxxExe, and fcExe require a value or later code that access
> > > them result in a panic related to accessing a value out of range.
> > >=20
> > > This updated patch adds a flag that requires keeping the first
> > > value so that at least one thing remains and the assignments
> > > for the Exes set that flag to true.  The first item in the
> > > array should be the executable name, so leaving it should be
> > > safe.
> > >=20
> > > I have run the oe-selftest and everything passed in my setup.
> > >=20
> > > There is a bug report [2] filed for the issue that this patch
> > > addresses.
> > >=20
> > > [1] https://lists.openembedded.org/g/openembedded-core/topic/94022663
> > > [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14976
> > >=20
> > > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > > ---
> > >   ...ent-based-hash-generation-less-pedan.patch | 30 ++++++++++------=
---
> > >   1 file changed, 16 insertions(+), 14 deletions(-)
> >=20
> > If I remember rightly, the filter function removes anything starting
> > with -m. Are you saying you found a case where the executable itself
> > was called -m<something?
> >=20
> > I'd like to understand what this was stripping out which was valid?
>=20
> The function in the patch actually did the opposite.  It only keeps=20
> values that start with -m.  I think what it was trying to strip out was=
=20
> anything with a path.
>=20
> Personally I think the way the original patch was implemented is like a=
=20
> sledge hammer.  Which may be ok with how go integrates into OE, but=20
> feels like overkill to me.

Ah, right. I suspect the issue is you can have --sysroot <X> or --
sysroot=3D which means removing one or two flags depending on the
context. I'd be happy to see the patch made to handle flags more
specifically though.

Cheers,

Richard

