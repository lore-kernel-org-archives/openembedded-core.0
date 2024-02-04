Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B6AC48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 09:47:27 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.35831.1707040037971777975
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 01:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QuuvLKNE;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-511413e52d4so1387697e87.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 01:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707040036; x=1707644836; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v/PDfLFPnXQyYV45EPLFblA3EOa1Z+i+4HUYRbqjMOg=;
        b=QuuvLKNEdg4q/B30WW9Q2+FdZ11KDisfHgWs8Euf37tfQcqkC0ltwRu/eIRBNc+Tl8
         rr6O5TFLiTjBkOUlQoepMQKNaoVqIm2bFM20qONj7CTV38SG9aUs9e7UioXJkwSP2kQ+
         wtoFezt33b7YsizIew60DcSOcvTcpzupgswMJjRLcyZy5nqz72Bjc1BM0dFXQTkOJKbP
         TAQCow6pIn4puwuOiqVjzMoDYxCLxDaQtI+zHPFY/LKkOz87DvhwkbUaUXB/tuvRdrv+
         jo7uvVdEYyl0dtLW8Jtppw/zJnAcDgcMCmfQMYUG2ESsBWJPA70K7dK6UpDFzf+L026Y
         elLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707040036; x=1707644836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/PDfLFPnXQyYV45EPLFblA3EOa1Z+i+4HUYRbqjMOg=;
        b=t69X93hi2Ojexkz/qAgGC6dAB1aqw6JRE/cvcgLZs3BYuJvPMHKc87Q+rd9fBctIAv
         vXydbwwHNf3UHQXAldShakya5WSYNgFkkPVE1ngLstAIjkRfJISu9tosuaSJwCQ1t8Vo
         S8H3sX/IdxdDDY8Mccqkau0eyYBxmt0pF2KTaEF8lVlleEUi8Pr+gXbD43tM36grueEU
         T33e8p5a0SBWEgIMD5LXWif2cWKGwY5c9v2gl2uEHuQgiGaKTwV3jHdo9WbZPhqDTRJh
         E1qh2ziqPZTDJxtu3SWXU/z1TXQ8+2vrQCoJvO9wiasLTLZEJhR156bI/90cS89QFTBB
         BCIQ==
X-Gm-Message-State: AOJu0YybLeEcWz8isZYA/+j/3ZWEkic7bTt6i+K/Mqzqr1n9GJGEgI7E
	wXDctbbEAUr5bdrvqHFY28nHJPQCy4cBGQGf8Ff1jSIre84019YuWegwu8+peu5UZWly2fF9hLI
	TfzgHIiCkr+gAFdHOhjyFgaRxlcM=
X-Google-Smtp-Source: AGHT+IFnJrOYiDpgIcKps9J5ROlAkYWVIK/2A61h9eKEc0mPqfZxvBifS5sUfmeB7LLzAUrOBV4dAoFHGK33ZufdU34=
X-Received: by 2002:a05:6512:1286:b0:511:3a32:4e4f with SMTP id
 u6-20020a056512128600b005113a324e4fmr3914495lfs.18.1707040035681; Sun, 04 Feb
 2024 01:47:15 -0800 (PST)
MIME-Version: 1.0
References: <17ABBC6806A4667E.11393@lists.openembedded.org> <e1c33511-a475-4cef-8454-09de1986fd33@windriver.com>
In-Reply-To: <e1c33511-a475-4cef-8454-09de1986fd33@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 4 Feb 2024 10:47:04 +0100
Message-ID: <CANNYZj9TwXqe+HNTRgnzwWsgEoyMPSTo7sWEymCm4CEXrqcybQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] xmlto: Remove the explicit PV setting
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 09:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194880

Doesn't this cause 'version going backwards' errors?

Alex

On Sun, 4 Feb 2024 at 08:18, Yu, Mingli <mingli.yu@eng.windriver.com> wrote:
>
> Ping.
>
> Thanks,
>
> On 1/19/24 19:33, Yu, Mingli wrote:
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > The latest release for xmlto is 0.0.28 [1], but the PV is set
> > individually [2] in terms of backport several patches to fix
> > builds with newer compilers after 0.0.28 was releases in 2015.
> >
> > [1] https://releases.pagure.org/xmlto/
> > [2] https://git.openembedded.org/openembedded-core/commit/?id=27a5000724e4f4df274279bcd801d1dc2830208e
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >   meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> > index d5a0e69849..69f989f5b8 100644
> > --- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> > +++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> > @@ -11,8 +11,6 @@ UPSTREAM_CHECK_COMMITS = "1"
> >   SRC_URI = "git://pagure.io/xmlto.git;protocol=https;branch=master"
> >   S = "${WORKDIR}/git"
> >
> > -PV .= "+0.0.29+git"
> > -
> >   inherit autotools
> >
> >   CLEANBROKEN = "1"
> >
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194877): https://lists.openembedded.org/g/openembedded-core/message/194877
> Mute This Topic: https://lists.openembedded.org/mt/103827978/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

