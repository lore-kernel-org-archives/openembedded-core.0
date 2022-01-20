Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3278DC433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 20:33:36 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.1934.1642710815518556531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 12:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A3o7cxmS;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id hu2so8060807qvb.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 12:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9NDn3DV1+TOm03iFWCYYVtJFt3pttLRB8BlkftkQCD8=;
        b=A3o7cxmSwENWLo+7C4+Xy7JG4F/W109hICs8002yvaaEJlpWUZcv9ilvWSIeMEzKxg
         I2Z/iurXIaAL7/6JruJXpEIiqwjCf7m424iThGGfGzCbesyEkqF9YftDWffiKXsrGS2u
         sO4o5F+8JuajsArrKK3Bnv+IjYoOJYz9e88+VABvZ52P9/Gm8CubkT0Kf+XIZkfJnS6C
         fDX8uco3UcponLvwM0bREmfJxeDnhv5VIB7PpuBjKEysTOP0g4KvKWyhKKe0ZJaxwRjb
         LwoRRXCYocWLifFg6USLJ4ts3/ob6TilNspDajIhVG51FHEVOeX0EXobCLutbedoFz5b
         fXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9NDn3DV1+TOm03iFWCYYVtJFt3pttLRB8BlkftkQCD8=;
        b=yXbQuWIXw/7Yu1e/8xkVD19QXPbay288c+HeTNrHHEPJe2dvrsPmsoODYHFBlreXGw
         6qhGSI88dQy5cDywW3zWCU35ONQSNRv6MlqqljjQrfrqlV+hxXJESBR2e8EaUrKYEEGE
         x5hSsrvsQv+cYTxR8afd2zuCi+E8gGAGYCE19v46JoByV6UM7LM9uDM6h3OnmEpEi8ZY
         v51IwOirvKKoqjQCgRsFOuBDcGrXN2RBrgqfFaejV2gdhVI6YcUHorxk+NURg+gYRL7/
         C2TJhN+HSH506cPZIldxHh4IRCk4bZjTDO0F5h9RicyS8cm8Eu39DYw9LkBch5AmYz27
         +WGw==
X-Gm-Message-State: AOAM531m4LJOK7JfW05nc/ViESJiTGFQFJx2ceDqnC+aMzokp5pW+JYt
	IPT6P5IH70YzyYf5DxpgKWkV00bL/qnMAmnBUv8=
X-Google-Smtp-Source: 
 ABdhPJzGZUt046CYSPzgN06bBKsgnQlZCLTy9HvnD6yAvqVw6tHhGOHSgrKbKSENOyxMuhRRsxhEGXrZvgRaGBXAfGE=
X-Received: by 2002:a05:6214:629:: with SMTP id
 a9mr721673qvx.110.1642710814537;
 Thu, 20 Jan 2022 12:33:34 -0800 (PST)
MIME-Version: 1.0
References: <20220118185043.1778569-1-marex@denx.de>
 <CANNYZj8mJNZW=N-cgSzGGR8Av7Lij=NFzpK6cLWpyMjyHP2Oww@mail.gmail.com>
 <CAMKF1srtAJi+xvqJ1qNoi9rnCKpeN226r76o6AY=CMXe3x24Lg@mail.gmail.com>
 <7e645982-b148-680c-c6aa-89724716f659@denx.de>
In-Reply-To: <7e645982-b148-680c-c6aa-89724716f659@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jan 2022 12:33:08 -0800
Message-ID: 
 <CAMKF1soPeRuNjAtjFEONmS_i5oHPcBhWd0FeHh9VcVFO4D8jpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: Update from 4.4.1 to 5.0
To: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 20:33:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160785

On Thu, Jan 20, 2022 at 12:28 PM Marek Vasut <marex@denx.de> wrote:
>
> On 1/20/22 21:15, Khem Raj wrote:
> > there are bunch of failures in meta-openembedded as well  see
> >
> > https://errors.yoctoproject.org/Errors/Build/138784/
>
> So, how shall we proceed here ?
>
> I suspect Alex will send a patch for the problem detected in oe-core and
> then oe-core with ffmpeg 5.0 won't be broken anymore.
>
> As for the rest of the recipes in meta-openembedded, they will likely be
> catching up to ffmpeg 5.0 over time, so we can either upgrade them, or
> patch them. I suspect the former is more favorable approach.

Someone needs to fix them.
as seen this is not a trivial amount of recipes to fix. Generally its cordial to
keep meta-openembedded working for extended testing and CI.

>
> However, what is not clear to me is whether this breakage in
> meta-openembedded is a blocker for this patch to be applied to oe-core
> (with the fix from Alex), or not ?

