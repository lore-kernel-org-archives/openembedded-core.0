Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FDCC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 10:17:51 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.4416.1637749070048820112
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 02:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=BIQMWopH;
 spf=pass (domain: burtonini.com, ip: 209.85.128.44,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f44.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so1616236wmc.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 02:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PG6b7cbfXPpGeRTAzU8ZIkzJeiNt0iGeiractq8+qVY=;
        b=BIQMWopHA+GF0wb8FD/GH2ripCzEU/1iC2gNXAMw/t6BR/S8/8vWdMDaAOKdjRuYli
         c8Khfzrxka/iQMQmH1Et/NhFxLfT02PVG55tK4+nWZtsDhST9dYf5mbIs30uRIdwNjyb
         k8hQujQwewBrbBUr+gQQX5AavrefFOUYNAFV4q1ARZKWIeaeRRH/nS9vuVxgy144WepV
         bzfCZ7ahY2IgivGArvzM32LGZDPbneVUe3P7gPkPODHYZtlO/aPg8NygzQynVGRiPH2i
         AyhKwucqjUkDgbvEQxyvJvwxqlOFUYHfY4oDnpuxd9df02b5ck8wVZWh0iQ9fHO13FlD
         kMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PG6b7cbfXPpGeRTAzU8ZIkzJeiNt0iGeiractq8+qVY=;
        b=6bFkPjGom8YPK52kpqRxt2rTQXwXV1WGrTVGaPFwnlhf3orjFlL8pZF2oC+ppXiavJ
         vmDEcR9JeSe1UdToYtida/mpBJea9yZI7Z9of9Pd96k4A412syicAaLskwKArAxEris7
         DBRxfgQdhj2ctMz+MfHUCd7g1HJjCJnIyAmSmt1j5Iefcdl83koqukoUvu2wAAjhAq97
         +zUbPa0e3M2JtGLFPvGj4uZd8mAKaW2FqODx2iAvR0StD8IffjPUZVSQs+1VVIB4APpz
         nm/BKkVqPWDz0hj0ay85n4SkDPi2ReAqrrGb9YG007IKWnDEh8dk3fm3DaBG/g2LNleN
         Ce2g==
X-Gm-Message-State: AOAM533p/m6k0ItyY0xMKIEyIglSo7H/ul+g7jPJhvHzbWE9GgdwtOaJ
	6pwrBdj2bjTa/pgJf5k+QRqHQoXTaZXePFaA7TiDpg==
X-Google-Smtp-Source: 
 ABdhPJxZZHsdxmgtlxVzhtwsVKLsftfZWDgNm8vHmX4EBLNweRx07HPUH4rDzN7dmZVpjdjgiGDyFhio5AS7unD6jZE=
X-Received: by 2002:a1c:1d42:: with SMTP id
 d63mr13320983wmd.184.1637749068264;
 Wed, 24 Nov 2021 02:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20211123193859.2983287-1-ross.burton@arm.com>
 <4385af73ed16d497a0f066396ffe6baddc92d899.camel@linuxfoundation.org>
In-Reply-To: 
 <4385af73ed16d497a0f066396ffe6baddc92d899.camel@linuxfoundation.org>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 24 Nov 2021 10:17:37 +0000
Message-ID: 
 <CAAnfSTup6fCMbnHebYbgEecCZD4fNPRdFVYY351G_jV1QmB9gQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meson: drop redundant patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 10:17:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158684

On Tue, 23 Nov 2021 at 22:36, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2021-11-23 at 19:38 +0000, Ross Burton wrote:
> > This patch disables the debian-detection to use the correct $libdir by
> > default on that platform.  However in cross builds this is always
> > overridden to be $prefix/lib, and all recipes that inherit meson pass
> > the correct libdir explicitly.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-devtools/meson/meson.inc         |  1 -
> >  ...01-is_debianlike-always-return-False.patch | 26 -------------------
> >  2 files changed, 27 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-False.patch
>
> We build native things which are meson based. Do we want native tool libdir
> paths depending on the existence of /etc/debian_version ? It was some reason
> like that this was added as we found it doing 'fun' changes depending on the
> host. Not sure I really want to debug that again...

Sure, and they pass --libdir.  I did a build of Sato and nothing
moved, so I'm struggling to find the actual problem here.

Ross

