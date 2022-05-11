Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D32AC433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 20:27:43 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.1944.1652300854134730531
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RbXOwYU/;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id u23so5569785lfc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 13:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=szm9GMug4BBLZmYhfrot3zOFy+Lu4h9IzXPDU6hMEaA=;
        b=RbXOwYU/gV7xOexKdL5fvpabM3iov0+v0ldNMJOlQ0DpIVJRZQ4SMrLuxXEp3ac5Py
         lAuhnN6Di0l3ZInq4Sn93AW/tFJxCdp0+D1HpDXpvaSCFkkoaA+tc/lXsdWRWQskQoEC
         YT5JGC+7qy+94fS1E+LhiaAGDcnh5L/Le8IHRAqMvMu1JKlHWBPVgwgHB/EVJueyWnBK
         Be377Mzul33F4fJ2yOW8Xk/5b6BsrmtaLx9GVcpziGm4LKuLfmJ5L1KONVeEezD4YNdu
         BigCPluWfpR8OSpcMYxG6RvvP4nQIH/qhh8k6Fzq33DrRBGoUR7fwr+gbqaSPQSYf0Yq
         6p5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=szm9GMug4BBLZmYhfrot3zOFy+Lu4h9IzXPDU6hMEaA=;
        b=Rs0mEMa9cCfjafzLGt+yd43DhXTl4P4WN1wVM6wuuYsUdG4Cyal+7wd7XYEL58efRW
         U8mi9IUz2Hh46iWT8THy+f1drZlOTfNzW4RCYJLEiJJj/iBmUvOv9PZH5MBk60Cw/5bl
         GBcd4feEc68dffcIk5S8GwCqyP0xkqdk7JP+Gxg+es5sB8MEngzOcQzOhW4Jd+55zvXn
         mxXwnocdEcslsLOiNwFg91IHs9YxNOU1rKCdjSfrrzYxP97hA7EXJUweo4Jj3cy5An18
         JkvjaR2n/5ArbiX9TPk/HWTAbbslkRKHOxLk5wke5oGA2F/+8/KSGCnSr8+2Lgm3GDqo
         K3PA==
X-Gm-Message-State: AOAM530Hd4cpE1k5U7lONdpoMJSYusG0w1a2oyp6tTrjfzPFu0SUHD0j
	dvpb2Xim3FTmXvOUM5zlVIxTDAt5FEt8IcrQgYU=
X-Google-Smtp-Source: 
 ABdhPJz42w15GWr+rUEWz77ocSBdknMixCQmcqvRnvZdB5HjubHg5pQDuBQeq4mPlpRF7N/0EfNeM9B1YQCCa5jOBi8=
X-Received: by 2002:ac2:5b1e:0:b0:472:2c9f:5891 with SMTP id
 v30-20020ac25b1e000000b004722c9f5891mr20840089lfn.534.1652300851882; Wed, 11
 May 2022 13:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220506064155.2106140-1-alex@linutronix.de>
 <20220506064155.2106140-2-alex@linutronix.de>
 <20220506165155.1b255652@melee>
 <16EC8C486B6B2CFD.30531@lists.openembedded.org>
In-Reply-To: <16EC8C486B6B2CFD.30531@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 May 2022 22:27:20 +0200
Message-ID: 
 <CANNYZj97hX5g+za7gnBobM3tN-A=JQdmu4n4Dhx+23e01oTHmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] python3-setuptools: upgrade 59.5.0 ->
 62.1.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Tim Orling <ticotimo@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 20:27:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165526

On Fri, 6 May 2022 at 17:03, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> Tim, can you pick this up and get it to mergeable condition?

I have a fix for this queued locally, no need to work on it for now.

Alex

