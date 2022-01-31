Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DBDC433F5
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 21:41:48 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web09.39802.1643665307310826275
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 13:41:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qyWc4zmI;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: sakoman@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id w5so12648832ilo.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 13:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wf/KzKsEiH14gSU0r/o9erSBEsbTUCiT0dG8A2SWXcg=;
        b=qyWc4zmIQvDGkreU/0SPQFdMZDbzsKP1DqzoVS2r3vm6h4PCUeFGmhK2vqNqw6h8zs
         dDUBrdQTiPIx5BS3+iwBKbnrF1KaKCq82l/6TwgcpM+ItdtCIXhm0HvlE9UGrJaqTAAI
         7wyvVzdSp0dEcjgYYgVX7FBWXyeUdFhl7+nrKMKIOESHUtf7zE2TVXxoXiN5wGQDHncG
         uMpSTn8w6lg/ubhwV7CMGkjNeZTD5OQL4oFY9JriOJuPwSKMxnZBEGv+G+/y5GAlcbuT
         aBQpMwG3Q4OuyVD69PX+n574Wkc1JNcrN8OMiSx9N5YUQMmK6siiBHxr3x65M+VlxlNF
         A7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wf/KzKsEiH14gSU0r/o9erSBEsbTUCiT0dG8A2SWXcg=;
        b=vrb1eBbht7wQCnPTPDUNHUxNoYPx0sRF34tbEgDWiSkv+6zbKbc8WwQ8dSqa2Iry/h
         uJ2v6ag+LioSUcwXeiMMjIOfFYx7bACPB4mu4OMMhsqFGPuUo9tzaQ083oVtJsaAKH1r
         nk7uxo+vGYsDKPvHrE6djB0CWobID593yLYnwkFEWRI+AVh5QYECM3KPlWIf1Yl5Tf5O
         Ym2HGp8p19Wf+2DwZ1nJatWtd9rtJl+ReegclbY6daVBClKBf0P2x87qh31PvsIEpbKz
         yuAPFzr2u0uD4/Yh28/TIi2vLg8I6e/y0G1DjPErMgrliHKOeom3rGs3rKJwOwEnS/5V
         oOBQ==
X-Gm-Message-State: AOAM533EuX2SCeEIGrL0lRFsPW7bAH6rpYtJNbaCajC1gBmOsW8NPcaq
	kJuco48od1nU3I/dwpRqKZEnaeKxruE+btmNM0w=
X-Google-Smtp-Source: 
 ABdhPJzfA+5pcGOffjS1duOotm7PeYaeFHkpdewb99IIj/5dPZYFw7QWlO4MK2QoyVXwBZg65MMAAghaYv6gHJqOvgM=
X-Received: by 2002:a05:6e02:1b81:: with SMTP id
 h1mr13876216ili.239.1643665306736;
 Mon, 31 Jan 2022 13:41:46 -0800 (PST)
MIME-Version: 1.0
References: <FFD7F607-B72E-4FF2-A0C0-170CB57158F8@arm.com>
 <10591.1643660570158239445@lists.openembedded.org>
In-Reply-To: <10591.1643660570158239445@lists.openembedded.org>
From: Steve Sakoman <sakoman@gmail.com>
Date: Mon, 31 Jan 2022 11:41:36 -1000
Message-ID: 
 <CAGDS+nmU4Lc967GXWigT-R20sag-+vNmwJiZLucgVs84PuKRJA@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH 1/6] lsof: correct LICENSE
To: Nisha Parrakat <nishaparrakat@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 21:41:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161140

On Mon, Jan 31, 2022 at 10:22 AM Nisha Parrakat <nishaparrakat@gmail.com> wrote:
>
> ack. I will submit a new patch set.

You can see the ones I've already pulled in here, so no need to resubmit those:

https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Steve

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161136): https://lists.openembedded.org/g/openembedded-core/message/161136
> Mute This Topic: https://lists.openembedded.org/mt/88651664/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

