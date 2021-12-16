Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979FFC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 14:47:13 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.11386.1639666031835858456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 06:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j4IkhdN8;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id a18so44668833wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 06:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=guVAiit3JsGYf+j3sxfmcuZmaFz30OtlAUf51xlhTow=;
        b=j4IkhdN8BTDhcIMQK/OPPADMqxAdUZEG5LVMZeH45mDjj1VpmsCDUoR5sDH1Sdhutb
         JKsTd/BiJSkucXiDOkMc6FlxY18f74W1WE3ueIJkF4ViJ5sFrxJudQEV8FzmE9x3TbEd
         ROoRripf4K/jgpfbS44v5Nctia6jpgLVS+OUnovR900nXMrVITBGCFmCfIFpCv0EdSEF
         q18QxjtLfP346Xp9AQA7hx6RrwhWfNSmJQUdA72ojZQy5Ub5H+PbTurMByxscOi/Vnd1
         pPjdNPvj6mRg4F/0Gc25fSReQ9yd1cn5DLDhSBVSS4dk9D0c609ACce0nLLlOSI+lRrE
         z0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=guVAiit3JsGYf+j3sxfmcuZmaFz30OtlAUf51xlhTow=;
        b=W6iYI2rDh9h83kww7TjAEQTa/KD7BmUaF/JNZYkvaTkQ7wtWeliG0/ncrV6gsyV0+f
         DRCrDRob1r0ux9J9WJZ9rOhE9K7/miui3FA7R0JE0P8qHqxsQWxtcAGD6W16Dy/wb/Mg
         u8pnAQ+aPPw4ZmpxEGn7aVrDMyscoOAE9mnsU74/cDL/p5elx6jXaKCkUl2wR7fydubn
         gms9PmNmqZpQZZAIBBpZsQ5lFgsMO2Mrwzmej3kuHK3pIoFzJdUGFbZxBCH8thEIwiao
         23MfdMSdmNR7u1b90wQtUiSn6HIZjcrzG2kmc2C1vSvGQLPBI0PBpOAdXSjROJM0z9Nl
         ru7A==
X-Gm-Message-State: AOAM532XZFvN0ewsLqA/kD9I0+38xCcvX1I3POBTjMB3i+LgHY8/haQ4
	CSAnwpQwnEEXHuWtW7gi6Au3DiPKFKMKmH7SEzk=
X-Google-Smtp-Source: 
 ABdhPJzBvnO/mf3204hr+MGMNi8v1gjojHa9Pt3qtflCbhOE4w3pJAHtR1+Tq8y2NaGfE4aEd6a2fHlncuAwq2DuFUk=
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr9245065wrq.94.1639666030311;
 Thu, 16 Dec 2021 06:47:10 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAGgRHJqMNi+rfsiojpsxTG6e2JurK22zwK6CLOoyzz2BW0RQmA@mail.gmail.com>
In-Reply-To: 
 <CAGgRHJqMNi+rfsiojpsxTG6e2JurK22zwK6CLOoyzz2BW0RQmA@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 16 Dec 2021 08:46:59 -0600
Message-ID: 
 <CAJdd5GYn5ozdUsdhd67+xXESuyyTjxyr=-zgRox1zvmL+pLrww@mail.gmail.com>
Subject: Re: [OE-core] cargo fetcher, SRCPV, and setscene issues
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 14:47:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159787

On Wed, Dec 15, 2021 at 8:16 AM Matt Madison <matt@madison.systems> wrote:
>
> I'm finding that none of the Rust recipes are getting setscened in my builds off
> master due to the the SRCPV hack that was added to make the cargo fetcher
> visible during parsing. There's no error reported about it, but by adding an
> exception handler into the sstate code I tracked it down to pstaging_fetch()'s
> using d.getVar('SRCPV').  Since the cargo fetcher doesn't advertise
> srcrev support,
> the base fetcher class raises an exception on this, causing the
> mostly-silent failure.

Hmm, this is strange. I have this recipe:
https://github.com/JPEWdev/meta-phosh/blob/master/recipes-graphics/squeekboard/squeekboard_git.bb
that is using the cargo fetcher and it is definitely using sstate like
I would expect; perhaps there is some other strange interaction with
another class?

>
> There's no issue if the sstate package is already in the local cache;
> it only affects
> builds where I need to fetch from my sstate mirror.
>
> I'd submit a patch, but I'm not sure what the right solution would be.
>
> Regards,
> -Matt
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159725): https://lists.openembedded.org/g/openembedded-core/message/159725
> Mute This Topic: https://lists.openembedded.org/mt/87744591/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

