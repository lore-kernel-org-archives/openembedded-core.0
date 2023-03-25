Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7DFC6FD1C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 14:15:52 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.22516.1679753747286346587
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 07:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TyEo0hxK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so2556137wms.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 07:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679753746;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sKbr/jDjJBCNMhxL+fwFi2Lor93RlL//VexMr/a2hCY=;
        b=TyEo0hxKK9akIMU2EkA++bl1IXxNOWafKAVp0/oz0XSRE3dBGoX/VI3ab38rI+t/Fi
         wWpnPnRfZgvEV85W8wGTI1ccRwbC32WDZM+mkBHUAWH4pB+APYoUHL0W+qDoYLxrboPK
         qZznlGrFhb3sFGA5n4hN3Kk+o6nmcjD3gl1yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679753746;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sKbr/jDjJBCNMhxL+fwFi2Lor93RlL//VexMr/a2hCY=;
        b=yIVvI6kr3OszRKykqE+PImpMsD/hiWdRHSDo/mTZ72nn5KuNAbXVujDJDXNC74biJ2
         3UxZuGklqQadix64i/1/ktApUqINPf0IbcQLwNj1FLmZRlb4bWwkQM9V2NDQy0Tgy5IA
         OaG3lRcewRzac0XvYw8Idd29WFgRL4osyItUHikW9zd8F0CYVLiqFmFvGuTgZs9Hxgae
         QG7MQLKOmJLAOApAcChNSsbqMiZguNerEjwwPGtc+NiMcTh/UCH11Wtks5mzz6Tdto5j
         A4P3X1Nb0HIjfwrXauA+UCt87mUD3pR5apd/ZxAiA5aJxwqasQXyDBm4DDKlZKqBOkzM
         HUaw==
X-Gm-Message-State: AAQBX9elMpsOnpeESCSdBKFsV5YP9ADQaziJHLzFOslrlqvtdYQsdlnP
	ybS46xGcQgDUpJrtLVQ69gSK/g==
X-Google-Smtp-Source: AKy350aH10Wa59QO6la4te+YtpjOMUF0FXo/N2urmJnxIRJoE5B3de4CO7ew8N5owUc1cuZzQHmGQA==
X-Received: by 2002:a7b:c8c5:0:b0:3ef:62cd:1ef with SMTP id f5-20020a7bc8c5000000b003ef62cd01efmr1437540wml.25.1679753745660;
        Sat, 25 Mar 2023 07:15:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b5aa:4d6f:dd37:6d3d? ([2001:8b0:aba:5f3c:b5aa:4d6f:dd37:6d3d])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003ef6708bc1esm1301873wmq.43.2023.03.25.07.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 07:15:45 -0700 (PDT)
Message-ID: <2c86a440f61e95cc490e305bcdc016215d97ff55.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/7] kernel: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 25 Mar 2023 14:15:44 +0000
In-Reply-To: <174FAA516F586B9E.25304@lists.openembedded.org>
References: <cover.1679670268.git.bruce.ashfield@gmail.com>
	 <174FAA516F586B9E.25304@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 14:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179096

On Sat, 2023-03-25 at 12:47 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2023-03-24 at 11:08 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >=20
> > Richard,
> >=20
> > Here's the latest round of -stable updates. Along with them, there's
> > some fixes for on-target/SDK builds with kernel-devsrc and fixes to
> > ensure that 6.3+ works against the upcoming release.
> >=20
> > I was out of the office last week, or these would have been avialable
> > sooner .. I already have more -stable updates pending.
> >=20
> > I'll be sending hardware reference bumps, and updates to the LTS
> > releases in separate series.
>=20
> There is something not quite right with the kernel module builds on
> 5.15 (poky-altcfg):
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/5639/s=
teps/13/logs/stdio
>=20
>=20
> make -C /usr/src/kernel M=3D/tmp modules
> /bin/sh: -c: line 1: syntax error near unexpected token `('
> /bin/sh: -c: line 1: `if [ "gcc (GCC) 12.2.0" !=3D gcc (GCC) 12.2.0" ];
> then \'
> make[1]: *** [Makefile:1797: prepare] Error 2
> make: *** [Makefile:5: all] Error 2
>=20
> Looks like a quote went missing somewhere?

I tried:

https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3De0b4082f99a3=
970a5f10fa85850915ea3c254e2c

which seems to fix builds. I can sqaush in if it looks right to you?

Cheers,

Richard


