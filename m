Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBD7E71083
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 14:47:13 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.19797.1695307623108277841
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 07:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YnvyDM78;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c008042211so17467141fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 07:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695307621; x=1695912421; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6sFFjL02nUhjMSU4MAuTNi8XuaTAlPMMd/hTvpKbt4M=;
        b=YnvyDM781eQjlez51H9cB2ht1ONBLcbtZbBMyR1SktA2J7wGIm66xbhEriobUw8Vu0
         WX6cj45ni9RBuWicOA8atecFhxe4EiXgV03klLf0t6NpfS0PyDZeXkdjIHi41xu4idaz
         yncvMwuCUA3fGdtM+OzQtJrPDOk5QYd2DeP43DA1yd9ETt5xW04Sqlcll11ACjaswhes
         cCkc4HQgipnc0KsCmrTzxAzct/RymRo0zBRJoeUdpzeTofgeYyh3A/bSqCHR1UzifOgs
         cJEPKoV2pMZ+xX5eEvgTItNlEC3Ji+ZPYxFapXqp2JeTGADByuFlJ3IzoX/jaWGq9rlw
         Y0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695307621; x=1695912421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sFFjL02nUhjMSU4MAuTNi8XuaTAlPMMd/hTvpKbt4M=;
        b=jN16aOiMJPOBBohRJPspME35BX3QcVyxNT+YZhRCqho4/k4YEeYqgKiLZIV37U8UEp
         5mJlB+Be6ZaSyww8PauYJl7sv36NZdcKQnMBdJ2Xu4ujuLlZatj7lCVzeH9ljvIuzw8V
         PTDN7Ij9D3Yauv6pwbEy8+lg6KBYzMDxgMBzJPRhq8Xrir/ojdrG5eWxj3nKScMND8XA
         7OV7s+H1Mj2gVbJMpfV5jgLuT2dG/bn2VzOB7AoDAIVsHrLDwPXk2UkNvNnbLr0F04hu
         Qm5YDaVSATgqTOSUdw7mRDx+Bh5EBR64SaE935c7TEgDf2KF9ZW9e0mvI7HzWwlOQEVN
         +PPw==
X-Gm-Message-State: AOJu0YyeiTdUpO3HnNLPyloZfKvcgnKfDNOESmzY1J0z+yBYiRkU2SHr
	og99o9jSJkyZDcLeaRJXECNq0Yh7v+IuqHamTs0=
X-Google-Smtp-Source: AGHT+IHuc5/5gWsBu11y4PjYwvCMpvDw6TOdTxlZuyrqwMpOyB/+gi0m87lRpB/QDtZExYJdNg4TUfwj6KLWWGYrwUo=
X-Received: by 2002:a2e:9f14:0:b0:2c0:122a:322b with SMTP id
 u20-20020a2e9f14000000b002c0122a322bmr5007709ljk.48.1695307620559; Thu, 21
 Sep 2023 07:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230920181526.386874-1-f_l_k@t-online.de> <2023092114422322cfc0b0@mail.local>
In-Reply-To: <2023092114422322cfc0b0@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Sep 2023 16:46:49 +0200
Message-ID: <CANNYZj_RbS9pqZ6Aei-HpN8-Horzzvs-f-xT-S7ZDaQi98Loug@mail.gmail.com>
Subject: Re: [oe-core][PATCHv6] vte: upgrade 2.72.2 -> 2.74.0
To: alexandre.belloni@bootlin.com
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 14:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188010

On Thu, 21 Sept 2023 at 16:42, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/7816/steps/12/logs/stdio
>
> ERROR: Nothing PROVIDES 'vte' (but /home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb DEPENDS on or otherwise requires it)
> vte was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
> NOTE: Runtime target 'matchbox-terminal' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['matchbox-terminal', 'vte']
> NOTE: Runtime target 'packagegroup-core-x11-base' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-core-x11-base', 'matchbox-terminal', 'vte']
> NOTE: Runtime target 'core-image-sato' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['core-image-sato', 'packagegroup-core-x11-base', 'matchbox-terminal', 'vte']
> NOTE: Runtime target 'packagegroup-core-x11-sato' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato', 'matchbox-terminal', 'vte']
> NOTE: Runtime target 'packagegroup-core-x11-sato-base' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato-base', 'matchbox-terminal', 'vte']
> NOTE: Runtime target 'packagegroup-core-x11-sato-games' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato-games', 'matchbox-terminal', 'vte']
> NOTE: Runtime target 'packagegroup-core-x11-sato-apps' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato-apps', 'matchbox-terminal', 'vte']
> ERROR: Nothing RPROVIDES 'matchbox-terminal-dev' (but /home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb RDEPENDS on or otherwise requires it)

It seems the time has come to make the decision:
1. Enable opengl distro feature by default in oe-core (something I've
been pushing for for a while).
or
2. Drop sato images and replace them with non-graphical or basic x11
images in https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n313
or
3. Something else?

Alex

