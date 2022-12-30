Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810DBC4332F
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 07:31:11 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.13956.1672385461724110721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 23:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P6/BtS15;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id z26so30727579lfu.8
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 23:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Nfer1Iu9qTKkOlf2NBTIiLjZBAwok5rV4yMtGvJWRI=;
        b=P6/BtS15dYwZ9+JtJ5T2Ag5kcKk7OX/LWilb1fqfkPun6iJm4zXmzLM2oEwnLvbzEC
         Wojq4FuhdFwlwVrepVZ8q6scnMSOgWVi1cz0K/OH7Ai2wXiJUXFWkTKokNCYKZJMr19t
         pZCFkRJco1nxNqfyD++RzKJDjZw4K5tzOg6qBAXHe7bM5yh6vSlNvtIxb3HJQ0ReExd0
         gnchcDJPJMCKdv1v4DiO9mKWdkK0Hi2PpHG1XM810VpQwg6jtKfPjp2fa+2InrNshza2
         P6j10TU/kdRSi3jyw/BWuYA5t0USGhngDE7f1tTlkmi5zq84Hwpz8DyEK+rl+B/PS6wI
         j5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Nfer1Iu9qTKkOlf2NBTIiLjZBAwok5rV4yMtGvJWRI=;
        b=IRES284tz/C0jg4DS1Q7p9dHzB/6yAhjJh7F2e/lNfdoNx6QPOy9Wm+7oU2WaEO8q5
         hnnJfXRo7VJSKLqVY+WNZNgLV0fA02wEMHPoifMHilvWPTamG3BUEKhnCzlNHE8eJHKd
         veMjSwv9YmX9auuoRsUrSI0JeLcNZpv/R82/ReECzLftM/LBjAUI+Sn4TtS0nP55CNzT
         jSfVcfuxR0eO7C/1+ByOD3HeOB2Kypjk53gEozPI/bqyb0BCMt3I7TtL5NjOwonJWs8A
         ZRcMQ4iPj6IN8Bg9H1iEQP8PeM+ervszsATv+yCL71xZ4q+WbAhSyzoA1jCxHtmwx6Fb
         dNkw==
X-Gm-Message-State: AFqh2kryHCe8u0INK6CPQ2zDrI72+CRhnF6ABlWexEu1CHKVk1sMLTvm
	5FMA7a7Q5U1GFIpdS4bCN3yK9dpxaCxcg97/i0s=
X-Google-Smtp-Source: AMrXdXtf/5dCUc33qlyHTNGOTpSZ9SwkE5GkqNur4weFTumlHcunvi9z7/iHnQ8qx1Vlji2S4SFOgIO8rPucGnuUo3w=
X-Received: by 2002:ac2:5c5a:0:b0:4cb:154d:2178 with SMTP id
 s26-20020ac25c5a000000b004cb154d2178mr418065lfp.367.1672385459691; Thu, 29
 Dec 2022 23:30:59 -0800 (PST)
MIME-Version: 1.0
References: <20221224165943.1324800-1-alex@linutronix.de> <20221224165943.1324800-7-alex@linutronix.de>
 <6ea0dc08bc4007911090f49ebf4c9d9dee9579fb.camel@linuxfoundation.org>
In-Reply-To: <6ea0dc08bc4007911090f49ebf4c9d9dee9579fb.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 30 Dec 2022 08:30:48 +0100
Message-ID: <CANNYZj8Tyumh3oN5UN24rXOjrfFR7M7=e57mgyZ+Ai6HVybWWg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] qemu: update 7.1.0 -> 7.2.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 07:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175134

On Fri, 30 Dec 2022 at 00:19, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Since I merged this we've been seeing an intermittent qemu ptest
> failure on both arm and x86:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/4479/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/4273/steps/12/logs/stdio
>
> Not sure what the pattern to trigger it is, not looked into it.

I had filed a bug for this:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14996

The immediate trigger might be the non-deterministic running order of
tests, I'll see if I can reproduce the failing order.

Alex

