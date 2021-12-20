Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA4DC433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:16:13 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.6420.1640013371797130043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HXLXg+8Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.48,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f48.google.com with SMTP id j6so18936336edw.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EE9t6TxhU8lrj4uf0bGxeublVve9apFqtgf5cMa4cG4=;
        b=HXLXg+8QzYGVbho9G6ZL2qarvCaKY7P/QF+sEYn8jTuvb49GIJAmMrGkxluKZ3wcEJ
         HbNw8gZQ5P21VpN0BTXFCXxgF30P4ilFkFHYiK90dlVH+VilttZhprOAdsKplTe7iKvd
         L3333A30kVXeY9uQnNc/GWyugglRYkOswMX4MVDCrzokcm4i1TIUKdcZwYHTS9Yz4eZ7
         TlKgJsn+dMSMHl7PsTx9QC3A2Z3w24Kl7BgvjlyLHd8pPG1moUZfXvYjE9BzveXONnTK
         8Q6Wg3rNvrEk39n0LQPEBEtCxnXWJ2MYKIo/P7rojC9dc/39fD71q7l6mmccX1uKFJxA
         laQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EE9t6TxhU8lrj4uf0bGxeublVve9apFqtgf5cMa4cG4=;
        b=WHzdJIOkgtJZ+Nmgpo0zXhiPuGduoGkMiuTn2bDzcvd+g+M35JW2mtJhpOhkB14o35
         MKnlNi2km6N+jQu70Ie1+qAj8YD9vgLo8qDkANaCkX2qewOke4NoU7mY6zpd/EuoAL31
         Ku53xktEWug5yciNF2Zkl89BHQD8odHTmqhoyuGnJYDfY2aAqdu4XiYFI45Ky3XtYmJK
         bYcIoRYzZeJVSgFSPfL8hbjL9LtYyKloLURlv2Op/Mi8ejLlGzjJlrpC6/B4Qj02HUle
         AnecyBE4X7hH69m+4hIseLUyR5rFuRdFDWr20LasqtR4s7LqWpnVFKKHjD9Ymga8Z6Qf
         xa0g==
X-Gm-Message-State: AOAM533935AuNz8OO2kJwFjpbxlbIdzdRZaqLuEXcYmO+m2qE09rPpDi
	y+klBgvZ6IdE1M1u3Q4XaJ4v4cbAIi3UuEVmdakVeQ==
X-Google-Smtp-Source: 
 ABdhPJw0/54DU8yLH62s4b/0vgR+zi+4UBO/W+cvszzWCoj4LXAtKpfdHZ0QVpKiq84ObEXYAitFcXj7kE+FBAxmfME=
X-Received: by 2002:a17:906:2557:: with SMTP id
 j23mr13055138ejb.602.1640013368539;
 Mon, 20 Dec 2021 07:16:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1640012653.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1640012653.git.bruce.ashfield@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 20 Dec 2021 05:15:57 -1000
Message-ID: 
 <CAOSpxdbLiy00526bNrcw34nLxkOAVhUX0kNGYTQiR8hNN3U36w@mail.gmail.com>
Subject: Re: [PATCH 0/5] [dunfell]: kernel: -stable updates
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:16:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159882

On Mon, Dec 20, 2021 at 5:12 AM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Steve,
>
> I thought I had sent some of these before, but I didn't notice them
> in any of the recent dunfell updates.
>
> Here are the tested -stable updates that I've done (hence they aren't
> squashed, since each set of SRCREVs are a useful test/debug point).

I don't recall seeing these before, but will add them to my test queue.

Thanks!

Steve

> Cheers,
>
> Bruce
>
>
> The following changes since commit 795339092f87672e4f68e4d3bc4cfd0e252d1831:
>
>   build-appliance-image: Update to dunfell head revision (2021-12-14 22:49:36 +0000)
>
> are available in the Git repository at:
>
>   git://git.yoctoproject.org/poky-contrib zedd/kernel-dunfell
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-dunfell
>
> Bruce Ashfield (5):
>   linux-yocto/5.4: update to v5.4.159
>   linux-yocto/5.4: update to v5.4.162
>   linux-yocto/5.4: update to v5.4.163
>   linux-yocto/5.4: update to v5.4.165
>   linux-yocto/5.4: update to v5.4.167
>
>  .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
>  .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
>  3 files changed, 18 insertions(+), 18 deletions(-)
>
> --
> 2.19.1
>

