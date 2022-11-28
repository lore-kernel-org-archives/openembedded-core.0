Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968CEC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 20:57:52 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.130414.1669669065760908486
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 12:57:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YWHiA8M8;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id b3so19378566lfv.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 12:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mKDmKVGxnW86rUBog+tYHKR3RqX9Uy0r53y4e3EaKCw=;
        b=YWHiA8M8OZ15ASlWaHtfK9na5yM7/6j3UEMBQrm705HqsvmLhkTz+io/J+6ZOZ7MSP
         etAUeRifd3QSz+wKPPEThiIz4D6wOzrs0MiXTxHB8zj5XwrSBLFCrGCffX5LuX/b2zAQ
         gDbeBt5VZIrxQ8KM40hRmRsFaH+F4SWqz3Eidze427wSAUteD9aJiLTDr8RuLvDcXsea
         WVU5oW8m50GODCTt2803COY7OzzAOcd3SPItKUWvq9mYAQ13JLOzUDnh9tBS2K1uYHxh
         FQMHl0JEu4ccfC9ubEL1stnghAewkSFZT/Q1AmSEA5GQ1KwAkTh0wFV+wWZ5wtwveRi/
         gyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKDmKVGxnW86rUBog+tYHKR3RqX9Uy0r53y4e3EaKCw=;
        b=3kCOqQEHVWP3eC6B7FPW3AR3PUPCdSWRFuIWmlGVgTdYkoO8Kv13Y7vP5erdCbIdSK
         lozA3eUzwgDL6tmurIHoQQSQWodlnQO5cqDrPq0wTbH9A6UOSo5pJPOxTkYPkOTQnVi2
         T6JhajnJz/3GCPLyfkDrvPbBkwJucvs0A8DCeCQTBXJq6TY4nTlEmvBIi4WI3tIqtqsY
         0UUKQABiocgxguxe3DPZZXdve58ODAlvCuUDCiGl0VKdeR+h6zwrcsOgekF5lMajMsQf
         +3JLWXWUA8p13KWlkxUZ30DqLGFJVWWS1y7/pEXPdgfXT1G/yHDafefZRtLwYUt6yn0S
         LaPQ==
X-Gm-Message-State: ANoB5pn3rrh2CgBOWj01rzqYxOTQg8sHu99jHZG0hM49d9Q6r/Ke1hq3
	GXXWtVtHzwqdN0JuwOkGejZss8p6gsKW9X+Rc0E=
X-Google-Smtp-Source: AA0mqf5ljOCdrgb3EkDaS8+oMwky5IyNyTXv6Hmu9TbL+OEt4uhfc4avwBQopwnnGhcqrOez6HPxF66LcLjFW3ngnUg=
X-Received: by 2002:ac2:53a8:0:b0:4b1:5125:2f14 with SMTP id
 j8-20020ac253a8000000b004b151252f14mr12116061lfh.345.1669669063801; Mon, 28
 Nov 2022 12:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20221128161319.335950-1-f_l_k@t-online.de> <Y4T8JW+C10og7zeA@mail.local>
 <MES2MR.QEUQIOP8KV0L1@t-online.de>
In-Reply-To: <MES2MR.QEUQIOP8KV0L1@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Nov 2022 21:57:31 +0100
Message-ID: <CANNYZj_dD+wyGk4Gi0Djx2qz7KxPPOB47qdAPgp3G-oOLiECRw@mail.gmail.com>
Subject: Re: [oe-core][PATCHv5] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Markus Volk <f_l_k@t-online.de>
Cc: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 20:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173946

If we want to keep epiphany/webkit in core, then yes, we need gtk4 in
it too. Epiphany master has already landed the gtk4 port, but there's
no tagged release yet.

Please test your oe-core patches with a setup that includes only
oe-core and no other layers. Then you'd immediately see that the new
gcr recipe won't build.

Alex

On Mon, 28 Nov 2022 at 21:47, Markus Volk <f_l_k@t-online.de> wrote:
>
> On Mon, Nov 28 2022 at 07:21:25 PM +0100, Alexandre Belloni via lists.openembedded.org <alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
>
> Don't you need to also add gtk4 to oe-core?
>
>
> If this decision is final, I will send the patch for it tomorrow morning. At the moment I am not at home.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173945): https://lists.openembedded.org/g/openembedded-core/message/173945
> Mute This Topic: https://lists.openembedded.org/mt/95313340/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

