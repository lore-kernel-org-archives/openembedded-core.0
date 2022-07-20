Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD2DC43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 13:40:36 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web08.54081.1658324433168791356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 06:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m31pIeni;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id by8so17546061ljb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 06:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+oCz4nifJSyjraJfPrmPTYvlCB5wZeiAZ1n2/9vRJ9Q=;
        b=m31pIeni013acuEafkliRCplR72uXYDGfPn4K1mMJO5c3GvQl6a/YrgNFFfoEClOt4
         jxqNE6hZKoLl9OLdRPzQhoJRyZx9I3wS1/QSsCkHmrHw2xMvq0MnGl/Fxz5DLu8n8/zF
         bhS2KC6wZkwMOCTdl9+Bho5anaob9anJ0NZMR2+9Ld4/rd2LWHx4Aqy5nOkn3WlsB0rp
         XFQdYjfm5V298IcgCKq0XYwKSgJmoZsXHpRSNtC7uPq5lL5xr20lKHuEL07xuL5diLWx
         YGzVOnYUhHsNek+3Poja9Wg4nHhKW9pxT4gPQSWTzLsOgPht4ScZXMsMsjC9umq4JKxJ
         Qwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+oCz4nifJSyjraJfPrmPTYvlCB5wZeiAZ1n2/9vRJ9Q=;
        b=SYPIBYv7PtYTWlJf4eZkwF3YUjhhM4s0Ocdf9z4vAT7c+TdUQ97mPTUWE+8XOvnxEF
         zmUu8JUxmdTDVKjmUQG5hxTnb+O8+KNOMiQzdzTh06AXPmoyWaJW57tA0dD4dNK8GXjQ
         vWmd28RVGlOqfGSCYiKp961i2bnHdJgYuukQ8Xod7X2Q1tawUAgMKg+QwiuuRHclHYvi
         7QglnrlXHn2DB4spxCN6qvxBC58kmGhjHUG77Oah6l4ztSDdl/XoxOPjFwibMP+j8Ahl
         3iq9aU948AFQ4nqwyn6kJqZVmFA43RXyqykkbRX5a5pElLVZ51KhbYMvfcppjCi4TNRI
         8/cA==
X-Gm-Message-State: AJIora+RqSFp5ocR7S68KeetZYNpwBFQXOVauKs3iDX9wDZqCRML8hhu
	0mwKM5n5IFRTykI7NwQBvfZwL6/URLe/8GADVSI=
X-Google-Smtp-Source: 
 AGRyM1u29feN7OW8YbUqXTPIG8HMIdKfWP+pM3fALp4xMo22jRYGFJOwajGnnSvCfsYnf+xvB3ROvETBzkeXRnrqAZ8=
X-Received: by 2002:a2e:a36a:0:b0:25d:d73d:d8c9 with SMTP id
 i10-20020a2ea36a000000b0025dd73dd8c9mr1073736ljn.68.1658324431364; Wed, 20
 Jul 2022 06:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220720084442.2940187-1-alex@linutronix.de>
 <20220720084442.2940187-10-alex@linutronix.de>
 <YtfR3KLvG0D4eLcP@mail.local>
 <CANNYZj8oCFGN_fb8LY_tynsGG1NxatHORqSUVrfy_W8kjuo08g@mail.gmail.com>
 <Ytfw5F9y/GhSXqFv@mail.local>
In-Reply-To: <Ytfw5F9y/GhSXqFv@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Jul 2022 15:40:20 +0200
Message-ID: 
 <CANNYZj85zg8X1LjqdzO5Pe9KhAKU4R2YyTjiPMcwyaX+J4vHcQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/51] xf86-input-keyboard: remove the recipe
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 13:40:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168364

On Wed, 20 Jul 2022 at 14:11, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> I can but it doesn't change that the whole patch can't be applied
> because a hunk is for meta-yocto and the others are for oe-core so this
> has to be split as we are not applying patches on poky directly.

Right, I misunderstood what the problem was. I split the patch and
sent the core bit here, and the poky bit to poky list.

Alex

