Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43420C433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 15:50:51 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.38238.1653925842546759029
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 08:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cQeSzTHu;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: sakoman@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id n145so11692959iod.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 08:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m/4OfekiUHhFhjqnT9LH/kShGLqTIEDIoeMwqcCcrog=;
        b=cQeSzTHu5WycRcpDagEuzXVApl56nUJHDkXh+bN0fojmeb1UT/vyfgyDUIDitXpCt4
         9bXS6oEX8ckUgj0pfTs3tvrutzrPWg3tJkbvr2sPUrl57P0J1h+4Kv1LktBMhbMfJzQ9
         Esk0LaGQL7/0aFjdDyJ698Ucrz3RVE1qNzkmZuC0oQEwg7rBaykH27X+2cVqs2++K//3
         zdd2LaYGiF1aND6P+Jnl1Fx1w9sTPIfDKqJgWdiae+tdtmA5pmzwAuW+43fgQs5z12Vf
         6lXhM4Nfq3VEtoeXyVsvw60gG/7xhV1OG3z9F4JKiVbysa3GYFa94cL2opLjagStY/wo
         kN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m/4OfekiUHhFhjqnT9LH/kShGLqTIEDIoeMwqcCcrog=;
        b=MXxrnPOSbWIuzfephopB1fK/MvUXMibZrDzD3sdAsaLccbEjcPBqz9z2Nkjjp3ZwCk
         lsI6meozC7wqce85z1BaR2f7q2gBz/S4GPVhYjWDVyMU4TqmjDjz66EHORRV4CSaSphz
         YdtALO2FmXcBCaneQr9lHs6GDgswRN2rfvuBV7G9S5j2p9a59qwEWEmdIPVpsnnQveuW
         rANvrg63hSNt6Mh+IjL0WsLevJoceTDhp5zSHDNJAmqcA7Yt6oWyNwH9gIh6GbZnLnBs
         atk85hvGa0Tz8/cf8hyN5nZamnePb2ZeMhgMROgr6lStAsz7Y3VmfhXViA2GuhHRq85q
         m6JA==
X-Gm-Message-State: AOAM532sXVqoodaS2NyQ1uGHoPfaPEEt2iVjAQq783JuJ7GPYy3Tzzul
	1tHF/FgSwyYgqm4vLntGK4zwJ6WK/2+Ku8TvTMSPcFOP
X-Google-Smtp-Source: 
 ABdhPJwRPvHl3q+VldxARyCsOwK60rnwHX2NWXc77mkcBZL2I0uZ1FA/tbD1s0/pp7sdXkZ6lQlsIW+nG8YlgSHDN94=
X-Received: by 2002:a05:6602:29ca:b0:649:558a:f003 with SMTP id
 z10-20020a05660229ca00b00649558af003mr25488407ioq.160.1653925841995; Mon, 30
 May 2022 08:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220525092659.771559-1-lkml@jv-coder.de>
 <CAOSpxdZ6OyVH-FPQLi=t6Vp=airtau73oDg+-AKDQryNRADRxQ@mail.gmail.com>
 <ff1100eb-8f8e-5e64-0eeb-d0978d5756eb@jv-coder.de>
In-Reply-To: <ff1100eb-8f8e-5e64-0eeb-d0978d5756eb@jv-coder.de>
From: Steve Sakoman <sakoman@gmail.com>
Date: Mon, 30 May 2022 05:50:31 -1000
Message-ID: 
 <CAGDS+nmV27nZ+Dp-S=x+gQwz0iSp6+yxYRa_gnsQ-QrF7W3a1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libseccomp: Add missing files for ptests
To: "J?rg Vehlow" <lkml@jv-coder.de>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Joerg Vehlow <joerg.vehlow@aox.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 15:50:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166289

On Mon, May 30, 2022 at 4:43 AM J?rg Vehlow <lkml@jv-coder.de> wrote:
>
> Hi Steve,
>
> Am 5/30/2022 um 4:35 PM schrieb Steve Sakoman:
> > On Tue, May 24, 2022 at 11:27 PM J?rg Vehlow <lkml@jv-coder.de> wrote:
> >>
> >> From: Joerg Vehlow <joerg.vehlow@aox.de>
> >>
> >> pfc files are used e.g. in 38-basic-pfc_coverage.sh
> >> valgrind_test.supp is required, when valgrind is installed, otherwise
> >> all valgrind tests fail
> >
> > Is this issue specific to 2.5.4 or does it also apply to the 2.5.3
> > version in kirkstone?
> I am pretty sure that depending on the configuration (e.g. valgrind
> installed or bpf enabled), that these files are required in at least all
> 2.5 versions.

OK, will add this to my test queue.

Thanks!

Steve

