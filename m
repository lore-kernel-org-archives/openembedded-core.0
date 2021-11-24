Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768A5C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 10:20:30 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.4484.1637749229489796863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 02:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dDgo0vn0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 133so1827269wme.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 02:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=o2xi14jmya0Pwkvj3VvR80iqdlGuSd8ZPcwqAqfxe0Y=;
        b=dDgo0vn0MH4W7cqumhNAF5A7DcGuHfkRpL3L4VJoCBFN58bnL/KY/b13Ad9IFKS+7b
         h6D66X9ppUPjXS2ZHFbj4/PlE0gcClasmaO90tM4rVezBYG35+PBP3jqBYVfZQxn4dr1
         vzf15Ovw8Lf3raFOw55KvqLXDyqTBuPv6v11Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=o2xi14jmya0Pwkvj3VvR80iqdlGuSd8ZPcwqAqfxe0Y=;
        b=MA3ekgXWrJQZyExhdyGQRN6+e8BcwCpjJG+rWeqWOijTCjwNtcpydzqOxZejkNh46r
         drAM5hYPhtEWYTrdYJYMLaL7cKvgd84npPbRZ3T3pVYcVsLk7WejfdI7gwyU0uQ6bDby
         cu7fcxns/nEmkyfV0hERDVCqZXJASioXj6HIuIi35JY2rxMFwX85QYCcf5pJMHSXF3SI
         inb57BfmK0rEbCIgoj3EcI2ny/SvgctYbHCnTq7P5NM1sPeKFaYD1tfOSLyIorUMTuU8
         wQZ8Pk0nyFY6IFyXbAlxD0GHaojfo0RK43Auv2lfhlz/flp8norVHx6VKxos2mfpRQeo
         /rNA==
X-Gm-Message-State: AOAM532BZcFjdzuRaqsa/qEK749HwC5aGSrJuF7kZ1uz+/SapJH56iTn
	TCi2kvlHqiPLY0aQp21xoQ/InX6eosOd7Q==
X-Google-Smtp-Source: 
 ABdhPJyFe5LJTTbt6+tDSXg1QOcfFGJi7Xlvpyv9vHzF/xpPzNQuerWmLkSluOE5Sm55b+kaRkQwCA==
X-Received: by 2002:a05:600c:354f:: with SMTP id
 i15mr13322441wmq.59.1637749228020;
        Wed, 24 Nov 2021 02:20:28 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:246e:77cb:e23:80f?
 ([2001:8b0:aba:5f3c:246e:77cb:e23:80f])
        by smtp.gmail.com with ESMTPSA id
 o4sm4972465wmq.31.2021.11.24.02.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 02:20:27 -0800 (PST)
Message-ID: 
 <4676580ce5ca6db84befc3fa6c28dd0e7efa08a9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] meson: drop redundant patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 24 Nov 2021 10:20:27 +0000
In-Reply-To: 
 <CAAnfSTup6fCMbnHebYbgEecCZD4fNPRdFVYY351G_jV1QmB9gQ@mail.gmail.com>
References: <20211123193859.2983287-1-ross.burton@arm.com>
	 <4385af73ed16d497a0f066396ffe6baddc92d899.camel@linuxfoundation.org>
	 <CAAnfSTup6fCMbnHebYbgEecCZD4fNPRdFVYY351G_jV1QmB9gQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 10:20:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158685

On Wed, 2021-11-24 at 10:17 +0000, Ross Burton wrote:
> On Tue, 23 Nov 2021 at 22:36, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2021-11-23 at 19:38 +0000, Ross Burton wrote:
> > > This patch disables the debian-detection to use the correct $libdir by
> > > default on that platform.  However in cross builds this is always
> > > overridden to be $prefix/lib, and all recipes that inherit meson pass
> > > the correct libdir explicitly.
> > > 
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> > >  meta/recipes-devtools/meson/meson.inc         |  1 -
> > >  ...01-is_debianlike-always-return-False.patch | 26 -------------------
> > >  2 files changed, 27 deletions(-)
> > >  delete mode 100644 meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch
> > 
> > We build native things which are meson based. Do we want native tool libdir
> > paths depending on the existence of /etc/debian_version ? It was some reason
> > like that this was added as we found it doing 'fun' changes depending on the
> > host. Not sure I really want to debug that again...
> 
> Sure, and they pass --libdir.  I did a build of Sato and nothing
> moved, so I'm struggling to find the actual problem here.

Did we start setting libdir for native builds after that change merged?

I've spent half the last week chasing phantom issues so I'm just not feeling
keen on doing it with yet another issue but I guess we can queue this and wait
for something to break...

Cheers,

Richard


