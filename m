Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35824C433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 16:49:28 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web08.7404.1652892558293509960
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 09:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NMntUYIk;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id w14so4606727lfl.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 09:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kfiY2jP296cRG2dGmIAsbOdVnkmgfZdOdbsWag45Cfk=;
        b=NMntUYIk5Pv19ktJ9L6QmCrvZjI0aNsZ+xVtb37V8Uv5RavbmsZbtJFA+aOJPwtvET
         OjTQGoR7ek5HhGr82cGiFU72dZu5TOfeD6NUV7LNcUyitdveoAvFq6VIIh6qia8Bd93x
         KpGXUmUUvDUowgDtpSOHq5gHtRTRzAnRtnsdbdmzE/gIltPmmTIkGLqaZEjMKbzLq2Gp
         RGQGuwcyolsVVtTdMDFtZdpj9jWfyeMhN+W79WXI67gI6YkgQXB6rtBuFwJftGzoQweT
         VHXOax0QkhkRUYSExI6OqI6vY5ISlOdXbzFfupSCYLQxx2OZEUgp55TXRLwDvb2GXKtP
         Xczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kfiY2jP296cRG2dGmIAsbOdVnkmgfZdOdbsWag45Cfk=;
        b=1QiHJ1omodxai1urEAAp13fOduMbVskQiHcOK/afpah7qM+GNORDYQOuanp/70n45Z
         rxEtAY9XbRds092RTbuP5poA5CY1U5rh/FJTDWut20S4vfb7UeGGaDFY0rt7EGO5oHiH
         kt4MwBqWMiF11sATzlr6eJMFf6W0gx20TVO4vbEEu3dhCzUex/tXdq8+vmYkrBTyDdcj
         p/QFzEzX0yIQ1vArwYQSYSbObzuLIQnPIg9ZYYS7g+QR08iQOmEQCbPM0tQVut+E/WG7
         b28jBgCBdoAL6dJhl23dNauYAZuJ/iL2Aug4Y3jX6tHh37gc3zTdnpCQelXHCrzb4tg/
         PwFg==
X-Gm-Message-State: AOAM532e/Xl0jXlhpdlYOFGQk39cBkXRw1RxiMDl7lw1ALw1GxVzNfg4
	7Ltd8fz+zojB0NXjTGjeIsh5klrh34WH2qlc584=
X-Google-Smtp-Source: 
 ABdhPJxyIe2mynvtG59Crh3TL1U+x2jN0VZZXr8QalNnIr9XUa4n3fxSpdPKyLzpk61RNsVvifeSwYdRcH9ial6nfKA=
X-Received: by 2002:a05:6512:3047:b0:473:cf43:6d8f with SMTP id
 b7-20020a056512304700b00473cf436d8fmr294898lfb.380.1652892556407; Wed, 18 May
 2022 09:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220518105843.3299331-1-alex@linutronix.de>
 <20220518105843.3299331-30-alex@linutronix.de>
 <20220518170913.17d12bcf@melee>
In-Reply-To: <20220518170913.17d12bcf@melee>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 May 2022 18:49:04 +0200
Message-ID: 
 <CANNYZj9K3x5n53FtAh8OrVCsAhxJ-zsjy98jLQzr8f1x8E=Tug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 30/49] librepo: upgrade 1.14.2 -> 1.14.3
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 16:49:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165861

On Wed, 18 May 2022 at 17:09, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> wangmy sent an identical patch on May 7th and it is already on my
> testing branch. I'm taking the other 48.

No problem, my sets are usually meant as a catch-all for things others
didn't send it, and occasionally duplicates occur.

Alex

