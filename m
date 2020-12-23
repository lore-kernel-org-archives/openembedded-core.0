Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.3112.1608763157767630594
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 14:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BuRpNsqp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id m5so593145wrx.9
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 14:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/rGO+Pvcv0WOEyRnz9pdtR2RoYK2IniXTfCo9QJmQbA=;
        b=BuRpNsqpdf28WM2PT1VP/0BZ42qLv28oKVT7f59CZHs0Eayb7E22z5lTEsgRK0HtL0
         vRlPHZZk8RGB2vUtyVgenagru14L8tQ6lljk4MvthEkr7EPntayWA7QthFzH8g2CuSmd
         iimjKBLwqy6SAioynPvl5O1REUKdYRIrGRNNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/rGO+Pvcv0WOEyRnz9pdtR2RoYK2IniXTfCo9QJmQbA=;
        b=m7CKmml9WLC3pwt9h1I/LfXpiA6oTRlyaUGG/vrQXFosD6KdbUkUJf8uBFFyI+SsUg
         /AHk0rXIQ9XfTtW/Qz38H3Tmy9ghgl6571Yzk33rSq072GqCSljt2OOGYFVxxX5Ihoz3
         rn6+QJvM82yU10o8hyT4BXafNFxGu7x1WmAYrNUBMi6EgOPKu3oqxT+dx+R/jSDXOahn
         4Ru0ViVfUsauVy2FCop0Hdtfq7xfhoRS88ef/ng0AY3xa9LVPjnMPu98wv5LSDEReYSd
         xaqmHJWY/Tz9inVZ1fb0lPwe9x/mlUA3GAjf+hhQquBdzcdznZC/yqtGluFIUTZBx0xD
         oIYg==
X-Gm-Message-State: AOAM533aG+pRc+FKTOpVaybp9M7JGcbtIbiNcQcX+TXHnPhlD0zbAEHq
	DR8wAPYsfR+Q3Kry+yrJC3sJ4w==
X-Google-Smtp-Source: ABdhPJwA2bwouyKSgOvq7WL7o3Ufr6dr9WRSH/l/TVjcIwLeB4sKzuQJLK43kYTjJNuAM+zJ6CcvNQ==
X-Received: by 2002:a5d:4dc6:: with SMTP id f6mr31618667wru.336.1608763156075;
        Wed, 23 Dec 2020 14:39:16 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.7.9.f.e.b.4.7.3.0.6.1.b.d.b.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.7.9.f.e.b.4.7.3.0.6.1.b.d.b.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8bdb:1603:74be:f976])
        by smtp.gmail.com with ESMTPSA id x18sm43215319wrg.55.2020.12.23.14.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 14:39:15 -0800 (PST)
Message-ID: <9aa299f27c8b60572769b3840ca7b127b5694277.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master-next][PATCH 2/3] psplash: work on first boot (sysvinit)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 23 Dec 2020 22:39:14 +0000
In-Reply-To: <20201223223555.GA1089@localhost>
References: <20201223170621.35727-1-twoerner@gmail.com>
	 <20201223170621.35727-2-twoerner@gmail.com>
	 <743d9e91ea6fb99193e315f8b20778e418109da7.camel@linuxfoundation.org>
	 <20201223215005.GA9542@localhost>
	 <4a7f64f4a7a6e458974fd411b68a1075ba7204a7.camel@linuxfoundation.org>
	 <20201223223555.GA1089@localhost>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-12-23 at 17:35 -0500, Trevor Woerner wrote:
> On Wed 2020-12-23 @ 10:06:05 PM, Richard Purdie wrote:
> > On Wed, 2020-12-23 at 16:50 -0500, Trevor Woerner wrote:
> > > On Wed 2020-12-23 @ 06:00:21 PM, Richard Purdie wrote:
> > > > Personally, I don't really like the idea of having a top level
> > > > directory called .psplash,
> > > 
> > > Neither do I, which is why I also added the code to remove the
> > > directory once
> > > the psplash program is done running. Whenever psplash is run the
> > > directory is
> > > created just before it starts and removed when psplash is done.
> > > 
> > > > is there a reason it doesn't work in /mnt?
> > > 
> > > This all works fine (without any changes) on the qemuX machines,
> > > but
> > > on a real device (e.g. rpi) when the image is booted for the
> > > first
> > > time everything is mounted, initially, RO, when using sysvinit.
> > > At
> > > the end of the first boot, and for every subsequent boot, the
> > > filesystem is R/W, so everything works on
> > > subsequent boots.
> > 
> > Right, but why can't psplash create /mnt/.psplash? Why do we need /
> > and
> > not /mnt ?
> 
> Ah okay.
> 
> Let me play with it some more. The only point of /mnt/.psplash (or
> /.psplash)
> is to have a directory in which a tmpfs can be mounted in which the
> fifo is
> created. [this is the current behaviour]
> 
> It all sounds rather convoluted. I'll look for something better.

I remember being involved in trying to make this work.

With sysvinit, /tmp and /var aren't available before populate-volatiles
which is at init ordering "23" which was deemed too late for the splash
screen. The only other option for a rw directory was either to mount
one ourselves (the solution implemented) or maybe use something in
devtmpfs but devtmpfs wasn't really the way people did things back then
and wouldn't work universally.

The world has moved on, could we assume devtmpfs now?

Cheers,

Richard


