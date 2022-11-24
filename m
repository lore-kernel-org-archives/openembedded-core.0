Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33256C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 12:23:30 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.22351.1669292600510041029
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 04:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=boXdrAhY;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id bn5so1831520ljb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 04:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I4XLBPohpZCVC84W+qw8y4X/gN4btVO6XZi8B5t7OfM=;
        b=boXdrAhY6AcEd8tIS013tnqv9po06SKDuvqw0/j+COonuWgGncncqqrz1PKs6m2o44
         JhKB/buNYCXEPdlHPnowUkpFXcu6Si6gZntJGO5ucKcgvkaqNYBsn5gV/6rZiFr4VbnA
         A+VHoelgJGPhngec29pMUne4Ldf8DSkAsmLlcwOA9u6A6jUDsTdgjr9hAVzPuTHliTi5
         EZX8gn5s5s10mq+OoeIMW5XAG6DAhbmhjLFOQiPzAKTe0KsqFmNNjBtk2QWtcZ8NYnLh
         QL39ybmo3AreULMaYkxfO9llRWXiEFJrS3k3+gdZn8OSV6KO5EfqndrOrUZTdOs01DWO
         jQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4XLBPohpZCVC84W+qw8y4X/gN4btVO6XZi8B5t7OfM=;
        b=oW2gSg0tCjTfw6QVGvdS4F9bWQTE7KWZFUtpyfnIpKGT9Ss2dPDqNt6ab1gd1CW+X6
         B1vbt0Wzw1NUv6zzv6bhp+WZvtDkKXTMqHhvtFvFxR0PxG14nJVMlkk/6BtRtjaHDmQy
         8h/7OWPvCgHqhhLUqRKRJH7Xk+ote0a7IdC6Nxd5zIj6PKS3Vfk5f4pGumg6eIwgCkcB
         j5Nzt8F+xucDgdo4wbmp2JFyG2gqIQntM+cKq/6Uj9ZH/+bUr6MUujWpoTO6SfIxQv1q
         Tkf+FJKqA7teqH06o/Y+Tp4x8jf829SkpPymMyIxkqi1cYpOEh0MMdVZGIccmqOj318K
         pv5w==
X-Gm-Message-State: ANoB5pmyvtyVfRcmP5XDeXp4+1kvMw5eCpu9BpzVySO0rMWsOGegAU77
	3naw8CJ9/DoCBiJaUk7bBWPn1DCHzU50ePWFUmU=
X-Google-Smtp-Source: AA0mqf5Mpea+3zSa+Ruc0cXj5KLww5ITjrBqC249GcTSUkQqGQ03g4GV3BR0O6gZJtOo/VdHZZfvn4zSt7iXs5TOiI0=
X-Received: by 2002:a2e:9998:0:b0:279:7405:85d5 with SMTP id
 w24-20020a2e9998000000b00279740585d5mr3390369lji.31.1669292598553; Thu, 24
 Nov 2022 04:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20221120133122.2464634-1-alex@linutronix.de> <20221120133122.2464634-13-alex@linutronix.de>
 <034045b1e1ea7e23f19cab664e9c1491ba667658.camel@linuxfoundation.org>
In-Reply-To: <034045b1e1ea7e23f19cab664e9c1491ba667658.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Nov 2022 13:23:07 +0100
Message-ID: <CANNYZj_GjLd_-KAhSca8+ppdsN7U+UcRxqiPE6UWucuam7vORQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/17] webkitgtk: update 2.36.7 -> 2.38.2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 12:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173742

On Tue, 22 Nov 2022 at 16:21, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> I was going to say I was worried this introduces a reproducibility
> issue:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1907
>
> however I see the failure we encountered is on the previous version :(
>
> Diffoscope failed but the packages are here:
>
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20221120-kpjhpoep/packages/reproducibleA/tmp/deploy/deb/core2-64/
> http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20221120-kpjhpoep/packages/reproducibleB/tmp/deploy/deb/core2-64/
>
> I've not looked into what happened as yet.

The bug is here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14973

I wrote my findings there. I didn't quite get to the bottom of it, but
it should provide a lead if this happens again. The version update is
unrelated.

Alex

