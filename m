Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1438C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 13:08:27 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web08.6040.1650978497521726337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 06:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UnC0XbfV;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 4so8333096ljw.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 06:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p1JMTwfAg5+upS0VVq1h/sdl+7btoPCTHJ+ioB3MR3I=;
        b=UnC0XbfVLIfcC21QcseVngpxWQ4qlZ9ub9VDUOSvGMyrzYTO1X65vLx5qTHNzv1v1Y
         /nOqbx3Y1VokoACKYJL/J9+rFUSeDZtBGAEKeuLi9Lc3YJap2o3uVeM5c49TtKAHFmj/
         hJeBRr3fY1IdWyzwtWXtI2adRX71mgJLrzaei9jWAu93TyRMnijn1Vt9Bw/GDVzSQaMU
         lwPm7opYG66JA1ee2OzD17fndMsGTCw4v2st9Y7d5oB9Ey7LCG1HlTIhXfBG3jrixIo0
         irbrS7He/X62wMb2m9d//fTXh3qxTW8ouHkr3YmE6qPG0uY9yWHQPsN+o073u1HS5mJI
         J0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p1JMTwfAg5+upS0VVq1h/sdl+7btoPCTHJ+ioB3MR3I=;
        b=LrK/w40u5uAQIa+Rq5gG80MlTTXDtVMIZIgMdSlW0/jmVwBjDcSUnjQo1sWrno9a32
         6yvPObLuMPTY+B90GCqG5tUuVV/t8FegNS5mRFC+VzCHUX57/pu7CD3xL6TLA1LufpOl
         wY5ACKugadPFkhrcXGscoH31GmbaObDW9Tac8Og0TBSv8/tObHriU/w0zozq2kEFjYi2
         HYt8J8YnSfuoo4udZ6FaR5K5sj1Hp3xlvzVWGueIU7HwqXQF+DySKCCARuG632gillnV
         Re2eoT2y/yE6VesrjbgYzRA5lyEK8QY9OWbAIhOitrfeLdXTLKjP1kAWR1b+Xs2Zor5m
         TYdw==
X-Gm-Message-State: AOAM533w2cRNG1qWboy9Svzj0mq9F7GEvRjloDsKJ5Ldx190On6aeftu
	C/MMhp//Sf/XSsuqAWxbFqTpnI5TtqLlIfkzrsA=
X-Google-Smtp-Source: 
 ABdhPJyA9TND/rIM9AnOcqXOhj4hTGIiiEBlHCsGn2zNeBTS8+0YYRKBN4KFBQaqyaMuukogNMN01pO7p/bwNxnL6T8=
X-Received: by 2002:a2e:82d5:0:b0:247:e3e7:7c26 with SMTP id
 n21-20020a2e82d5000000b00247e3e77c26mr14746311ljh.395.1650978495723; Tue, 26
 Apr 2022 06:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220425100533.101314-1-pgowda.cve@gmail.com>
 <20220426135605.34ac2f80@melee>
 <CAO5Uq5Rd2KdssUbeW6WSX743i2HCTq+MFcdDAFyJU8EVYvF6zQ@mail.gmail.com>
In-Reply-To: 
 <CAO5Uq5Rd2KdssUbeW6WSX743i2HCTq+MFcdDAFyJU8EVYvF6zQ@mail.gmail.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Tue, 26 Apr 2022 18:38:03 +0530
Message-ID: 
 <CALY49850OECgkKV7pMH7j75-0tfv2rj_gA1xzjyDmAOxNMY-Pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: update 1.59.0 -> 1.60.0
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <rwmacleod@gmail.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 13:08:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164873

Hi,

@Khem
>> right, this might be good to have as comment on top of that assignment
>> for future reference
Thanks for the info.
It's been updated as per your comments.

> like the the version bump in tcmode-default.inc was missing.
Thanks for mentioning it.
I figured it out after seeing the warning message from Luca Ceresoli.
It's was updated, tested for all the recipes and a new version of the
patch is posted as:-
https://lists.openembedded.org/g/openembedded-core/message/164872

Thanks,
Pgowda

On Tue, Apr 26, 2022 at 5:36 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Tue, Apr 26, 2022 at 12:56 PM Luca Ceresoli via
> lists.openembedded.org
> <luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:
> >
> > Hello Pgowda,
> >
> > Il giorno Mon, 25 Apr 2022 03:05:33 -0700
> > "Pgowda" <pgowda.cve@gmail.com> ha scritto:
> >
> > > Rust has been upgraded to rust-1.60.0 that uses LLVM 14.
> > >
> > > Please refer the following link for more detailed features.
> > > https://blog.rust-lang.org/2022/04/07/Rust-1.60.0.html
> > > https://github.com/rust-lang/rust/blob/master/RELEASES.md
> > >
> > > Signed-off-by: pgowda <pgowda.cve@gmail.com>
> >
> > Testing with this patch applied triggers many warnings:
> >
> > WARNING: preferred version 1.59% of cargo-native not available (for item cargo-native)
> > WARNING: versions of cargo-native available: 1.60.0
> > WARNING: preferred version 1.59% of libstd-rs not available (for item libstd-rs)
> > WARNING: versions of libstd-rs available: 1.60.0
> > WARNING: preferred version 1.59% of libstd-rs not available (for item libstd-rs)
> > WARNING: versions of libstd-rs available: 1.60.0
> > WARNING: preferred version 1.59% of libstd-rs not available (for item libstd-rs-dev)
> > WARNING: versions of libstd-rs available: 1.60.0
> > WARNING: preferred version 1.59% of rust-native not available (for item rust-native)
> > WARNING: versions of rust-native available: 1.60.0
> > WARNING: preferred version 1.59% of rust-llvm-native not available (for item rust-llvm-native)
> > WARNING: versions of rust-llvm-native available: 1.60.0
> >
>
> When I was cherry-picking this back for thud (don't ask) it looked
> like the the version bump in tcmode-default.inc was missing.
>
> --
> Alex Kiernan

