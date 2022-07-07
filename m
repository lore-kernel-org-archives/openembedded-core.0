Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10C1C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 13:15:14 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.5395.1657199710259416182
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 06:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QHkMnkEe;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id w2so5855572ljj.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 06:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7ooDaBAjsrPl8gfozstsCQlcofQPXRI0KpqEkEFQZP8=;
        b=QHkMnkEeeLm7uKWW3VoSPMEVFVNkjkJDFlxb0D+CG0XXe01d/la5rggXFkE+slHr6P
         YQDga/jriBjIDOstkryycVTA98M0tYgQq7Y6B9yGyclMhttF+wISsgw76EEzS1ejdqZy
         P0PaDn5FDPa+wxuw2sYvISeAHTsCrRUIgktU8FsQfPi7UHllsZ1r9J2SsKWz459JSxma
         uGoKdT+160Q6do1ezsSQPdiqlimTvnZIVwMv1kulwm/DnZjO/5go+7OZAnDJggK8jzNM
         Mek9QgvxquppHcXcifGnmufLaWv965wULX/UcbSisRtIMGaPVvd7RLnIvi7vY7Sl9C7s
         guRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7ooDaBAjsrPl8gfozstsCQlcofQPXRI0KpqEkEFQZP8=;
        b=TrCagsa+5c0axN22Ynd1119pnbL/ciQ2m5H0VggOFLveQdr7zArsPciMcoILrf4BD8
         LUJmrV18uAzWKaqyiQI4pZjZK0DRLBPgBXZUB7xpCiSrtHAA0fI5IPVYFE5Ds2flxvt2
         YLpVGymYC6q9U6plwx65YS3SABjZyFYdkhqAaIHI/6l+c0ogXF62ciULuCk/aegs2Ecq
         7nOspExTcmrRUy3anaxU4YemVbSc+q9vBhCYZIFe0E1BroSS9vFkwoJWdpgPDiYKRvTq
         oDbMfs6Z4i6Y7nj49bYkg0rHHJsag6YVsaNF/E/oHP7vnUxXK1dQlFducnwLBCY4Xynk
         I2sg==
X-Gm-Message-State: AJIora//mOrm1ei8mSgkosnDvNhiCewNEWVT+ELPU0ABfhQZHUbhsnVT
	nXQqMzle4ewe1ujExu1bnFF1fmQXVNOul1vu5/M=
X-Google-Smtp-Source: 
 AGRyM1s8KnM9MXCsMPtFZN69MderXHlPsA8XC+1whAqSgMyPs8ZonuV7Ndw9K+dX0OzCDi+nalhVC0dOpavyLYBPmdk=
X-Received: by 2002:a05:651c:1542:b0:249:5d86:3164 with SMTP id
 y2-20020a05651c154200b002495d863164mr26490856ljp.500.1657199708176; Thu, 07
 Jul 2022 06:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220706195311.974830-1-JPEWhacker@gmail.com>
 <CAA2FC7D-8003-431C-B856-B8DE9DCDC202@arm.com>
 <CANNYZj-tF-QYoJ2U-V-PgJJXfAWbRDmELLBziUrq40SzXi5LwQ@mail.gmail.com>
 <639E7961-BBE7-42D1-952E-FFCABEFB2655@arm.com>
 <CANNYZj-nwwT2EsrgSS2+X1RQ_RcOuv-iL181PWz0ys2TeYiffA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-nwwT2EsrgSS2+X1RQ_RcOuv-iL181PWz0ys2TeYiffA@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 7 Jul 2022 08:14:56 -0500
Message-ID: 
 <CAJdd5GY88gdyNsHwLuf-GqDZ-B0vFfHqa1wJpmvDjcGjfs5xLA@mail.gmail.com>
Subject: Re: [OE-core][RFC] Layer Setup JSON schema and example
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 13:15:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167777

On Thu, Jul 7, 2022 at 5:40 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Thu, 7 Jul 2022 at 12:36, Ross Burton <Ross.Burton@arm.com> wrote:
> > > Wait, how is YAML more readable, if JSON is valid YAML?
> >
> > But YAML is not valid JSON, and YAML is the one which can be readable, unlike JSON.
>
> YAML is also not an included python battery, while JSON is. I'll stick
> with JSON for now, if you provide specific examples of how the JSON
> that we're defining would look more readable rendered in YAML, that
> would be appreciated.

I generally agree that YAML is better for humans, but using JSON now
allows us to make progress without having to hash out that discussion,
and won't exclude using YAML in the future (since YAML is a strict
superset of JSON).

>
> Alex

