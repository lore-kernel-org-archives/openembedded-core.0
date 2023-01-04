Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1F4C46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 20:07:13 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.1369.1672862829407063670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 12:07:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZyTJynP4;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id y25so52067695lfa.9
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 12:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eqzT5o64udTZ1O6FwrXOcinEKW6V6eYLxa3HUk51ZQ0=;
        b=ZyTJynP4CtGZok6WabZrZLT+OC7z8K2p1AXJHMHY9+PkjdsI1HGER3cqdMs69mZRoX
         0tvmEICYMDmlUZK32ayVVHIIlQvNLThopsrsTg/fA3lXDuZDfQ070XZbNlwltuY66SV/
         tJOtQAhC81piyThhb6dQJlihodc6cQMJoEvPLoYSMUD2E7dhoACvhm5h2M8DoqhFGc2W
         Yr9Kzu1S21wU3LZgFaRq3P6thOdyiUS0fPkNEvxIu+KJ/POiBxSiVFb7VcBhKGFdgr3h
         41J6YKetsBVcohWIhwXWevJ4hLNSD//VE7hgCG3lA0fZfzO3OtSsaKJHrE8gzt1Qwh2l
         /UxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqzT5o64udTZ1O6FwrXOcinEKW6V6eYLxa3HUk51ZQ0=;
        b=kCszn7AnsCMm79fZcm2vwh3AqRaK64BP0V82lQemO1tmmseB2pGCChMzD6YHaYlGaf
         H53q6OK665OAc8bWn1bwwL6oJ+gMEXDff5+8QQl4HEhQmPmir/2KBdRqJy40yz6P59qV
         +uX3GHO8vUkZgoYSk36DOYSPVZ/1jkK4RPlb6n3RzFlHI+onN9wCq18s8uaZcJ+0mMsd
         srMtDfDeBVekTHSJSYQlRB5JjtdQhyL1trrVb+uSBPhxet88/Hr25dcC1d8wvEepqeIt
         SzlJVpz6I3TnofldzW5FV5l0GPXZumxE/gH2xR+hTvG7/HZ0AB9Zfz0RYWIUFC/YHhfX
         15kA==
X-Gm-Message-State: AFqh2ko4ay+vmT5gAuQnbtgyPkzP2DHBf63/Ez6wncL13Jjy4L0c6F7z
	Fy57kH0oJobewapAeVkgZMv1MFmoJONDsbXinQ4=
X-Google-Smtp-Source: AMrXdXsR29op6sR6VgiuFqjFmVHAmX6KjcH06zDKKxtVjGsFqAcxnmwTvGTGzRLOuoMbtwkU7D8YU7ZPsy9Q25pPGjc=
X-Received: by 2002:ac2:568e:0:b0:4cb:4404:1bc3 with SMTP id
 14-20020ac2568e000000b004cb44041bc3mr210291lfr.263.1672862827627; Wed, 04 Jan
 2023 12:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20230104110548.2537259-1-alex@linutronix.de> <20230104110548.2537259-3-alex@linutronix.de>
 <a3fed81d-5310-ae68-4ef6-4aa8162a8b8e@gmail.com>
In-Reply-To: <a3fed81d-5310-ae68-4ef6-4aa8162a8b8e@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Jan 2023 21:06:56 +0100
Message-ID: <CANNYZj9pxUwb2N3OvKUCv2_dZGeFNHYt=n0Kp_xfCpj5Yub=Fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/77] ethtool: upgrade 6.0 -> 6.1
To: Khem Raj <raj.khem@gmail.com>, mkubecek@suse.cz
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 20:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175506

On Wed, 4 Jan 2023 at 19:09, Khem Raj <raj.khem@gmail.com> wrote:
> > +diff --git a/marvell.c b/marvell.c
> > +index d3d570e..86f1d46 100644
> > +--- a/marvell.c
> > ++++ b/marvell.c
> > +@@ -5,6 +5,8 @@
> > +  *  Stephen Hemminger <shemminger@osdl.org>
> > +  */
> > +
> > ++#define _GNU_SOURCE
>
> It is probably better to replace u_int32_t with uint32_t from stdint.h
> instead which is more portable than u_int32_t moreover using _GNU_SOURCE
> feature macro is also not needed.

Hello Michal,

this would be perhaps a better fix than the patch I sent.

Alex

