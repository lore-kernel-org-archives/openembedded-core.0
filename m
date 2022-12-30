Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CACDC4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 08:06:31 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.14234.1672387590676274508
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 00:06:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i8cRqz2F;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id j17so21319905lfr.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 00:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bhUjuaVfFwvMgY4RKQZT53NIFUYIaQXiJCxqaJguTew=;
        b=i8cRqz2FKOztR3v2s9DrAboMEbD6O1ApmUpVzBaxmnG2UjNwdDe0NS95GjDewbp+ZT
         a0kAfhPj7Azhn6qsiWyBvqjaB8YRemOjYKNhZ1qhvR61bbKOs+svwCc9IbeAh5burMtu
         Qn8scGzwIywzlcjqEo0A8tJ7k4cGrGT+uCXknwGG1fKvxAGeGbwYrS8efzEBH1TutQKg
         S4TRJ50CWkVmdKKBD7ESy2xzSLKBwOYfBks5NGotKjRLTTUyShcUYyXOPm393vgfnBeG
         ANzQe3/PVkrdnzLbfSu2de3pOCmneESGLLr4qrLCYc116YkMVekPfSHksJmGpJH8cPSX
         Jk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bhUjuaVfFwvMgY4RKQZT53NIFUYIaQXiJCxqaJguTew=;
        b=dne/LgwgExp8GAODCWdF2J8f5Vcz7MrXX5Vmo7XMth22zttrIE5EbpT7sYjYPrajTl
         xHAcEoIxQwwxUohvs4Uuikm89RBrkFBrKxn7NlJDZbti3689QtUHR51djxVgTyQBrvxV
         t3dbYF8Baw29Fnfud8yzspyf6HYZ+/dtFmlFiEwg5N2hsHA9ZrHm8qr7C1Mlp/ETgtNf
         7ZJJPdxD6zre/UeJfTHt6LRI5kf++tCD7D6zX/wzJBltRX3OfOkYLZrSkZyAAzdQfxbi
         kLc1EiVdomYFwIyF0DmNkHvj9pkaeRnE8gSLyVaKlb5cJWtl1gsx5H4gfvyHmSnfPdqe
         iuMg==
X-Gm-Message-State: AFqh2kpdfD8Oq7vi6X+2lKyGZ1XbIZdw2azkfiVzJjIxalfJ7svO1Vpc
	02wX0Hy2A7SZXDfqg8KMobC+7WwT1PTJXJ9EuZ0=
X-Google-Smtp-Source: AMrXdXs2HxcVHd5SXErEa/CGJWN7gK2aBX7WynYtXtvbF5GC/+VuDg+K/1a6gtAspsyxCzQdu7TBtJJvkQKFp7BOa5o=
X-Received: by 2002:ac2:5c5a:0:b0:4cb:154d:2178 with SMTP id
 s26-20020ac25c5a000000b004cb154d2178mr420979lfp.367.1672387588755; Fri, 30
 Dec 2022 00:06:28 -0800 (PST)
MIME-Version: 1.0
References: <20221224165943.1324800-1-alex@linutronix.de> <20221224165943.1324800-7-alex@linutronix.de>
 <6ea0dc08bc4007911090f49ebf4c9d9dee9579fb.camel@linuxfoundation.org> <173581B798B2479E.21302@lists.openembedded.org>
In-Reply-To: <173581B798B2479E.21302@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 30 Dec 2022 09:06:17 +0100
Message-ID: <CANNYZj__BZwPwMP2SzTWsJSvfzVM2cnJ-XNZzOmqOj2P+_h5Hg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] qemu: update 7.1.0 -> 7.2.0
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, alex.bennee@linaro.org, berrange@redhat.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175135

On Fri, 30 Dec 2022 at 08:31, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > Since I merged this we've been seeing an intermittent qemu ptest
> > failure on both arm and x86:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/4479/steps/12/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/4273/steps/12/logs/stdio
> >
> > Not sure what the pattern to trigger it is, not looked into it.
>
> I had filed a bug for this:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14996

The culprit is here:
https://git.qemu.org/?p=qemu.git;a=commitdiff;h=68406d10859385c88da73d0106254a7f47e6652e

Particularly the
    /* try to avoid a race to create the socket */
    g_usleep(1000);

bit is not reliable enough, there has to be hard synchronization.

I guess we have to disable the test altogether for now.

Alex

