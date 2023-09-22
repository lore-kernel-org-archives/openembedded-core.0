Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B62E7D0CB
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 05:54:50 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.15210.1695362085944546452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 22:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ASKqfZeQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2bff7d81b5eso29838701fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 22:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695362084; x=1695966884; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NFAOLnWUs3ttKAKJmx8g8PDbevbequ0C0XKCHFETe5o=;
        b=ASKqfZeQK8s/fDhpN/rwsldNKq4osSppND5cueV1Mg7/fpiEIkMMRozikMYAh4Lwiz
         Y4q7WK2opq7++0dyrHczZO38cUt19/Vo7U1oYTpU/ZlRqJpDuMRW54jRjqLb2MenEKbS
         rBZFDncFdKy6t25xQIvSKNa7VATTb4KumWTZP5yKgmH/OB7HmKurdFPjGlsU2y7NVdI8
         Ci4vIVfV4RgVgNEqWvVkn4n6c2sqKBTh/zCuECDU8xGMNyqxm0GwLN3x0j8M+Ky4+mLu
         0jHwCNysvZg4wEhezfdDUs8STJBwk2hcwd2YVRlNCMGGlStN3bxquCmEQ9iuUBrcDNm4
         kx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695362084; x=1695966884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFAOLnWUs3ttKAKJmx8g8PDbevbequ0C0XKCHFETe5o=;
        b=Gn7zJmd26d4nUmsf6R5uWVRydDTxwuH6bjhw+2+V+Bv1YL/Hgr+9nMm3lis0P0KxVL
         lAcS+YmcYSqwySNbvSaFkvFvfZRjjVFyJqNjVEVdCp83NrX5quQTDRrdWdFwTqD4WWFy
         5IDBNm8TLLvVNQTBw23zwwVrUDUlO2uthaDoIQ78yWau8aw7kJnT4vBJLxcCx+AsQk66
         /rKUdqh/0bDnQItMbK570tMnRhuUkYtt5ZfWIyl4UU9QPsckaliuK2WJRo2H2F6UCSA/
         6BbWpDY9QmgJrvay7dhp+gd30HLmSkAzoZiiaBmldTzYekxnMw0utWdJwO+8lVS3iqSm
         O7bw==
X-Gm-Message-State: AOJu0Yz9s8y6gYbUyGJdHjBVWxPHRE6nK+C1JNT1hUUVU4SzvJmKrAs1
	hgiXpFzSW3B+zE1cPuKcvH93uQF79HbYjDEKuhg=
X-Google-Smtp-Source: AGHT+IGRvjjk6T1EF0dQtgH6a73UU76anHStZ786PAuSo0EDU8ysjbfwArgZIN0kbvyELDH8XYkeM/TCyKuhXg2VuTI=
X-Received: by 2002:a2e:9f14:0:b0:2c0:122a:322b with SMTP id
 u20-20020a2e9f14000000b002c0122a322bmr6442623ljk.48.1695362083703; Thu, 21
 Sep 2023 22:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230920181526.386874-1-f_l_k@t-online.de> <2023092114422322cfc0b0@mail.local>
 <CANNYZj_RbS9pqZ6Aei-HpN8-Horzzvs-f-xT-S7ZDaQi98Loug@mail.gmail.com> <2023092121043261a17d09@mail.local>
In-Reply-To: <2023092121043261a17d09@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Sep 2023 07:54:32 +0200
Message-ID: <CANNYZj-RRfNbTRgtX0sHsxSyn+sPP31qyyXEBWwQfvM9rJhNJw@mail.gmail.com>
Subject: Re: [oe-core][PATCHv6] vte: upgrade 2.72.2 -> 2.74.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 05:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188038

I think for now we can actually fix this via enabling gtk4 in vte
subject to opengl in DISTRO_FEATURES. The options do exist:
https://github.com/GNOME/vte/blob/master/meson_options.txt#L74

I see it as something of a temporary compromise, but it won't require
changing the test matrix, until vte drops gtk3 support, or gtk3 goes
EOL, at which point there'll be the question of whether we want to
continue with sato altogether, or move everything to weston.

Alex

On Thu, 21 Sept 2023 at 23:04, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 21/09/2023 16:46:49+0200, Alexander Kanavin wrote:
> > On Thu, 21 Sept 2023 at 16:42, Alexandre Belloni via
> > lists.openembedded.org
> > <alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/7816/steps/12/logs/stdio
> > >
> > > ERROR: Nothing PROVIDES 'vte' (but /home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb DEPENDS on or otherwise requires it)
> > > vte was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
> > > NOTE: Runtime target 'matchbox-terminal' is unbuildable, removing...
> > > Missing or unbuildable dependency chain was: ['matchbox-terminal', 'vte']
> > > NOTE: Runtime target 'packagegroup-core-x11-base' is unbuildable, removing...
> > > Missing or unbuildable dependency chain was: ['packagegroup-core-x11-base', 'matchbox-terminal', 'vte']
> > > NOTE: Runtime target 'core-image-sato' is unbuildable, removing...
> > > Missing or unbuildable dependency chain was: ['core-image-sato', 'packagegroup-core-x11-base', 'matchbox-terminal', 'vte']
> > > NOTE: Runtime target 'packagegroup-core-x11-sato' is unbuildable, removing...
> > > Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato', 'matchbox-terminal', 'vte']
> > > NOTE: Runtime target 'packagegroup-core-x11-sato-base' is unbuildable, removing...
> > > Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato-base', 'matchbox-terminal', 'vte']
> > > NOTE: Runtime target 'packagegroup-core-x11-sato-games' is unbuildable, removing...
> > > Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato-games', 'matchbox-terminal', 'vte']
> > > NOTE: Runtime target 'packagegroup-core-x11-sato-apps' is unbuildable, removing...
> > > Missing or unbuildable dependency chain was: ['packagegroup-core-x11-sato-apps', 'matchbox-terminal', 'vte']
> > > ERROR: Nothing RPROVIDES 'matchbox-terminal-dev' (but /home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb RDEPENDS on or otherwise requires it)
> >
> > It seems the time has come to make the decision:
> > 1. Enable opengl distro feature by default in oe-core (something I've
> > been pushing for for a while).
>
> I'd prefer we don't do this because we are still supporting platforms
> that don't have a GPU and this will reduce the amount of testing that is
> done without opengl whereas we have many others targets that will
> exercise opengl support.
>
> > or
> > 2. Drop sato images and replace them with non-graphical or basic x11
> > images in https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n313
> > or
> > 3. Something else?
> >
> > Alex
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#188010): https://lists.openembedded.org/g/openembedded-core/message/188010
> > Mute This Topic: https://lists.openembedded.org/mt/101484377/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

