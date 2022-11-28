Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C6BC43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 09:54:39 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.114066.1669629270386834991
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 01:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e+vCXMWt;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id d3so12511188ljl.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 01:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pL4tJaSX/Ll87GxvbreQ1sPppqhFB5c2JrW2tmWRGOw=;
        b=e+vCXMWtoxhp+Li6ws5vFv5vUYpB3PfijOfuUfizyAMUbJOtxLeQ4qLoTzaZT4cTVa
         b7PUKNtqJIFZ8WMyTosUXnljZ/23tpKo/1pg4UUNAe3BNYP2cOkxlG/KbDg2qjPIgnQJ
         cs7sAU/lZP0iM0dDEyTYiaKZZp6AJo5iSnzK+2w1cuLpo6TKlGtU54BZAdewDUk2gAdF
         7+jli0QpO5bCfHGhPdfcnbWTt+pLh8TibKVIsW1nKkOv1sa6Z0RnaotzPoX8gYzIAMJA
         RKOdWTT7bQn0F19yRakXYE5PHGFtL12ozYnXDJNJ9S4rUl8fgpJ+LrW9gFJprVad0EM5
         4jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pL4tJaSX/Ll87GxvbreQ1sPppqhFB5c2JrW2tmWRGOw=;
        b=PJ5Vm7+w9YkF09idTrBBfjIXWxTo5lertbCGeLwBaHyK8HzEQozBQ48fBycpW4RsVO
         JVQ3duR45JQPzDUHpdtidWp9GCLBOtJiKjj8y5OyWh68UI6VwX9KPM1cdsCvkVyaUvNj
         oXZh0UlZncH/gqd+8Tf3EOjm499SK2/p8MdZCY8n/0ALzE9YW8p0WOCbjYkI+MfBXGrS
         KKUID32OZnDmsYfdIpjFLnzsw+uXK/sz3ydaTjunkeevmUKikRjTe2XaEJ622dThSS82
         6DOAiKvbtYZpDqMNpi0F5o1E7TkSob1I0/OxXfvN6/dhNamhteBzatnObnXKz94BkgSq
         YJtg==
X-Gm-Message-State: ANoB5pkj2PVSkyUIgyGyQ4CRaZdCsZ58qg2Ca3wB/ERME9xYyrTZarLa
	F4aD9eKqZeDRrPOUDJUNqMvl1JORgHTEUnpEo60=
X-Google-Smtp-Source: AA0mqf5HbIKcYmbnSzh+cGhDSAaRIpETf+tJu+QLeo3EcQT7USfHXUhUPQzZZNrGAi6n4+kiu35zF8XzeBRse/etfXo=
X-Received: by 2002:a05:651c:c8f:b0:26d:d196:d04 with SMTP id
 bz15-20020a05651c0c8f00b0026dd1960d04mr16757394ljb.403.1669629268299; Mon, 28
 Nov 2022 01:54:28 -0800 (PST)
MIME-Version: 1.0
References: <20221125211558.20985-1-alex@linutronix.de> <458025bf556060dc1e3ef56bafd564d4b998c2fb.camel@linuxfoundation.org>
In-Reply-To: <458025bf556060dc1e3ef56bafd564d4b998c2fb.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Nov 2022 10:54:16 +0100
Message-ID: <CANNYZj_pM6M3pBCZDyfcJoq9WbkZSX3bRtHoATeWCNCsUzeWzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] qemu-helper: depend on unfs3 and pseudo directly
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 09:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173899

On Mon, 28 Nov 2022 at 00:58, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> NFS isn't really a dependency of qemu though. The thinking here was
> that you could boot a real board onto an NFS mount from your local
> system for development purposes. That is why it was being included as
> an SDK tool.
>
> Perhaps we should just add it to qemu helper as well to simplify the
> runqemu case?

I'm fine with that, just want to point out that commit history does
not have this justification - meta-* additions of nfs server
dependency specifically talk about qemu only, and sdk packagegroup
commit [1] does not describe the use case. I don't think there's a BSP
where this way of booting is officially supported and documented.

[1] https://git.yoctoproject.org/poky/commit/?h=master-next&id=b5b3825ce6df45b16e1f3e15001da213bc8b0a55

Alex

