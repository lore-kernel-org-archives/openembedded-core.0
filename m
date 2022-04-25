Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48ADCC4167D
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.32202.1650904993582930254
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 09:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KzkwKh6n;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id x21so1259839qtr.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 09:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qm4dcpnKa62+7Tklvl4tpWGzwm3QB+lcxO+hxOCMRFw=;
        b=KzkwKh6nA6PvnQI4livsXQZVO+My8esKrvoguEaECuRe7HUbqhg8zGQPc27HlCskWm
         DFKcWQh2lStjtYQAM8eCE1dRWZy8W7PTIOdRyY+xnsfwyIfYSkfViMno1jLqBAfGoq9p
         CXfqeXtjej+Mo31tzIalLqb/2RkTtorbFJreSU5WWcm1rIKsu/2IENcE+ppmmHLjVp2p
         VhdnJIlkbPCF4V5cfOjTJsZbQRelkEz/Kt5HzfNCULCrhrLJPPb6wbuhovZxR0J2sshm
         GfN9gRyw6Bwp5mKPmn6tAWE/7TL9GmRdaRluEMfZmJIZEoQWBED3m93swaAXPQMbS++W
         Nfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qm4dcpnKa62+7Tklvl4tpWGzwm3QB+lcxO+hxOCMRFw=;
        b=fmu345XrNtvTLpzTnHb15kfELRo7yMLGXC2YQ5OFsS9pRP8Vc2gcI4Qg6tMcVdOHpi
         tDNZD0Kn4seI/9LSNqg1lFrxaHqfjjfWrinqk4aQiZ++BHSgKTBpTCy1bjAePGFA4qJp
         5q3pWvFj0NbdCFCEF57mYsPrwQhqWF3W0J13qo5fqgpBY1wbeO/UzOOowu4nltDkQYsi
         U/cfhIa5hrunVS+4dYV7CFvV9//uwt3cbL2fXxrpa3jJH2Wachm5p3XaNji9F7LX+LKJ
         q1hS74Sx0cuQ1bhANdAypm5bf7x11y0I3pLx5+Rm/VhK51iZR3NwhFL5kyPvPRIbFmQG
         eMzw==
X-Gm-Message-State: AOAM533cCoqCycNxXM/kiLSTAU0SuN3Ms01MFItBG9eEWB7xoI15B6yR
	NNPSU+2CrThEDjEaE6bBRxILTd2O2HPwStScv0qgscTccJU=
X-Google-Smtp-Source: 
 ABdhPJx7v0zF7U2//NAanm1RixMwjehcwtqa0wVbX7wUU4Ggi9ECC2kJb1uzt3u7/xCaRIiwXTC59NWM1f6dwQ8bXrM=
X-Received: by 2002:ac8:728f:0:b0:2f1:e9d8:9091 with SMTP id
 v15-20020ac8728f000000b002f1e9d89091mr12511585qto.54.1650904992687; Mon, 25
 Apr 2022 09:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220425100533.101314-1-pgowda.cve@gmail.com>
 <12715f51-7013-d520-574c-c13774549e53@gmail.com>
 <CANNYZj-LgnwiS2UiSOwo-mKpaHtpoeJw5f6sBi4dOJoEOPcZ2Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-LgnwiS2UiSOwo-mKpaHtpoeJw5f6sBi4dOJoEOPcZ2Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Apr 2022 09:42:46 -0700
Message-ID: 
 <CAMKF1sqAuFW17AXdzjV5rsGqYU-SS58Z25YOQtbR673EXar-wQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: update 1.59.0 -> 1.60.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Pgowda <pgowda.cve@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <rwmacleod@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164836

On Mon, Apr 25, 2022 at 8:52 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Mon, 25 Apr 2022 at 17:33, Khem Raj <raj.khem@gmail.com> wrote:
> > > --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> > > +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> > > @@ -2,21 +2,21 @@
> > >   ## snapshot info is taken from rust/src/stage0.txt
> > >   ## TODO: find a way to add additional SRC_URIs based on the contents of an
> > >   ##       earlier SRC_URI.
> > > -RS_VERSION = "1.58.0"
> > > -CARGO_VERSION = "1.58.0"
> > > +RS_VERSION = "1.59.0"
> > > +CARGO_VERSION = "1.59.0"
> >
> > why 1.59.0 ? its a bit counter-intuitive.
>
> Rust is self-hosting and bootstraps itself with a pre-built previous
> version of itself. Just like gcc. The exact (previous) version that
> has been used is specified in the source tarball, here we just
> replicate that info.

right, this might be good to have as comment on top of that assignment
for future reference

>
> Alex

