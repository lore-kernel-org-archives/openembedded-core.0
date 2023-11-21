Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73D6C61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:34:49 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.40193.1700573684812010423
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=inF4cjX9;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c501bd6ff1so69025001fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 05:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700573683; x=1701178483; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7HaQOS7OcCulB/daubP8Do2QuMV50xz8p9JzeMHc1l8=;
        b=inF4cjX91JWHXrXSsbqxK81C1FbGqTBy7oNDfKLAJWkTW42NyJFh43LSAv4EQsB7US
         7vqzl63qN7Luqa6udcs9X4yXbGg0JGY6ZKlohaedKyvYLu+kcc5Gx415g+6IkZiby1Hh
         /EMD3iLojJLawQSMaMt/+RCTiE7dgsA/XStvX/xFOAWNY9eXya5rPm+ya8gRF2fYG0d7
         dHoc4ziWG/mcqKMPgclNaqXXw06fkXSisIwRnM/okryjFlKV+z1SK2rrfIh2JWS+8LtP
         VxJHtouM1r7icmGv878Kvvc2qI4Sj2xq53DfjAyRnbJOFYTNz1rl9OpyW0lqfIpkvJq/
         T3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700573683; x=1701178483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HaQOS7OcCulB/daubP8Do2QuMV50xz8p9JzeMHc1l8=;
        b=pmx7h3ffh7gwLtusbk2PI9ceWhPheFDuN8UB/d4GqdXtYuMMq4m0cJ0KGhKSqNPmbQ
         2eZDvDs40l2s5BOoZYn8mjJHScDg9duXF9q96AAr3ghAb3EnGh1Jd7g1KzslyWjsZAhc
         NlOhEbT5PE7JpocnmLZZK0IVVwBXw9R0cjRh3XGT8KfUtCU/dfD8fXVktEn7vs6XSoEZ
         LO+0wszAQiEJpGmrbhoofMCczUwprVyMFRORKBz+wFDWlH2mUp3ejagskHbF1uY4M80s
         ABEsXcffBJ5HM99UJ1sE9LvxC1sRUk4Z8OsVHQQMhB3SkYmvat2cYU6ko1MVc5JllDhu
         Rxqg==
X-Gm-Message-State: AOJu0YwbrZNgcs6P0BgJTRNtjm+ifqXa+06pMW0v6iJTgoDDlwx/DVpQ
	FFp5UVHFrubg/Eure6LtFt/VXWji/GHqEiPbintn37p4
X-Google-Smtp-Source: AGHT+IFDYivERv4JxmeNDE8RazQyOMLo+re1cLLlGRH0tSZOpGp4PM6cPRfJcUUCt5YrJm3HX8ca5WrXvAxZtL8FJPk=
X-Received: by 2002:a2e:8198:0:b0:2c6:ed45:8c94 with SMTP id
 e24-20020a2e8198000000b002c6ed458c94mr7116404ljg.51.1700573682931; Tue, 21
 Nov 2023 05:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20231121132203.932559-1-ppjadhav456@gmail.com>
 <CANNYZj9SpzPK_vAw56KSckFTd4Cfisuffb_N9mpw3oD0Nj=khQ@mail.gmail.com> <43135cba-e82f-4426-b049-7f926830817b@gmail.com>
In-Reply-To: <43135cba-e82f-4426-b049-7f926830817b@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Nov 2023 14:34:31 +0100
Message-ID: <CANNYZj-jCS4BTKpXROmyJKs3HP9M-OFP-LTH9+W4-9Y=fVmevQ@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] ptest-packagelists: Add sdbus-c++
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Poonam Jadhav <ppjadhav456@gmail.com>, openembedded-core@lists.openembedded.org, 
	poonam.jadhav@kpit.com, ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 13:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190980

And it's already in corresponding list as well in meta-oe/confi/include/

Alex

On Tue, 21 Nov 2023 at 14:28, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>
> On 21.11.2023 14:24, Alexander Kanavin wrote:
> > On Tue, 21 Nov 2023 at 14:22, Poonam Jadhav <ppjadhav456@gmail.com> wrote:
> >
> >
> >> Add sdbus-c++ in ptest-packagelists to run ptest
> > sdbus-c++ is not in oe-core, and so cannot be added. You need to add
> > it to the list via .bbappend or a custom image recipe.
> >
> > Alex
>
> It's in meta-oe. Please resend it to
> openembedded-devel@lists.openembedded.org
>
> Slava

