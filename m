Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3421FC4167B
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 17:20:06 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.185287.1672248002187164304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 09:20:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LaEin4GY;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id p36so24393751lfa.12
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 09:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5AuVgGYeHM+77N+DZeBHdI+ngBTFaD9Qd1s4vKqLf/M=;
        b=LaEin4GYC9Y8ZDYCBSE6UoEb5gMNzBcjF4opa6lw0HaWwtGYok1zPp68Q1BuOqMvbO
         Og+2tzqcque+4qanEi6Uun7iztu+E90W9gWtnbzyd4peMLHVE3dyk+cwEkp6n1MUNbLP
         W9kz+GOCwtnk2VoxD1eLrxDQ0QMG9pkiRYMdkwL0EtF/9gHYr1C9mRe0KO/JwBxs2bvK
         6DSQzUUn4Z+/Rpto/cCQdR/OoBuwXycuQF4QS49VGIqKVaI+fNBFjqgFXbj3Q7H3xXR9
         nZQKa/Z/YTcHF00bt2G5UA8t6Qf9ZV7d1wmyGSvhMv2AB374VTlwOyhOzuwto+f7MxQ1
         pSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AuVgGYeHM+77N+DZeBHdI+ngBTFaD9Qd1s4vKqLf/M=;
        b=j4GlVOg5/eFJmu4CQQh2wLM/bizuN/nxi87DTx6fXigLvWEsVZooFf3opOlgql3YEn
         8tnJCfPFGsKvC0qCyg9sJeXUJ9HlNqdFNqLuj04lPKzltBizbGfKrruzXJkjowdcujZN
         obBKVmFzc3NOiWyBYd3iNWN+ImU6qGjRWOAFmD6mwTOlAF9bCrMPiCB40isqnJ/8QhfL
         6uKBEOaq0gvxFAlrGHvrTWunspjmLVKPlAIS6JdVysvwqT15PeAZX12xxBABsG4zGHQV
         xJDWLQeB3bRdkM2sT1auj0mQ5kkKnINCfFgdHii6pvaO1tX/Q/2nqXyZeFDiXNkRlK04
         516A==
X-Gm-Message-State: AFqh2kpAA2VyndIo76H2fROwXEdYDcLEDbpFuuKVnZcthcklAhFXzFbL
	nmNrMcb9JFKOc71MJCou2hAZJzTzJBfb7hIQL8A=
X-Google-Smtp-Source: AMrXdXuE1zDQGZEQjOqH9eNYXWfG3JdS3UIccH4fAjtbWo7580cgorlCrQkzNESnj60xhtyfjjZXHJzEwfOt+06xW/E=
X-Received: by 2002:ac2:4bc9:0:b0:4b5:4502:1323 with SMTP id
 o9-20020ac24bc9000000b004b545021323mr1540885lfq.345.1672248000244; Wed, 28
 Dec 2022 09:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20221224165943.1324800-1-alex@linutronix.de> <20221224165943.1324800-6-alex@linutronix.de>
 <05ddc76c998a397e7392957760517b2011a4d61e.camel@linuxfoundation.org>
In-Reply-To: <05ddc76c998a397e7392957760517b2011a4d61e.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Dec 2022 18:19:48 +0100
Message-ID: <CANNYZj8wuHTJ6+fH3hmepbs2SnRbJEW1KakTZneKEQEvKjeGiw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/7] libslirp: add recipe to continue slirp
 support in qemu
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 17:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175083

On Wed, 28 Dec 2022 at 14:42, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I've had some feedback about the way this was handled. In future things
> might be smoother if we:
>
> a) make sure the maintainers of other layers containing such recipes
>    are cc'd on the changes.
> b) mention in the commit which layer a recipe came from and who worked
>    on the underlying code
> c) mention any changes made to merge to core
> d) time things outside of holidays

I agree with documenting origin, giving credit and making
changes-on-top clear; I did copy the recipe (however simple) from
meta-virtualization and should've done that at that point.

Otherwise, there's no 'evil intent' with the timing. It's just that
recent AUH reports (and associated weekly CVE reports for master)
bother me more and more, Christmas season is a great time to get
actual work done :) and I handle hardest updates first - and qemu is
certainly in that category. I wouldn't do these large, disruptive,
inconveniently timed (for some) update batches if we had a healthy
maintainer ecosystem.

By the way, at Linutronix there is a requirement to clearly document
code that's been copied from elsewhere, one is not allowed to change
it in the same commit, and there's associated nomenclature for commit
messages. For example, recently I wrote this into a commit:

    (copy from external source:
    git: git://git.yoctoproject.org/poky
    archive: c615d00a361510b0425a57ea6afdda5a39069692
    copy: meta/recipes-core/initrdscripts/files/init-install-efi.sh
--> recipes-core/images/initramfs-module-someproduct-install/someproduct-partition-install.sh
    copy: meta/recipes-core/initrdscripts/files/init-install-efi.sh
--> recipes-core/images/initramfs-module-someproduct-install/someproduct-reinstall.sh
    )


Alex

