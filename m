Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CDFC83032
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:12 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.20965.1650546100597619819
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 06:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=go7kbVSW;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso5865182wma.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 06:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dKaAZFS7r/QjJrXkxpw2fTit1rprYK2BKnhpmkwVF3k=;
        b=go7kbVSWaX7GLiQps6hG4V5yq+EqF1QJrrWenE7FeFbXa0RI5309pBrhJO4DcPFRxE
         ddCsgQySPiBZw9ldXXxDj1FndyD2dAMTXOkEGk5fUKojWkOQa8iLM4oEdNpyPWNRSwUr
         huNRBPCFaGaWWvUfkXwgAuzA1n+lOBivi20hOMyCngs/MGtApIbf7Cr2v2NA/wWGGXaz
         sg+7dQA++VlOemXfoDTThVNkPxtyA32MEYLPkaAm9rvUR8iEKR7M6LHi7HOmJfmQ70Jp
         qU6PLtIZo65Aa7ixzUyMFDvcdXNz+3zyvas27rKmiLS/9kVS8JbfPUk1szKTENAqX5/e
         U+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dKaAZFS7r/QjJrXkxpw2fTit1rprYK2BKnhpmkwVF3k=;
        b=Qw/BlSgywo2WylcOiRBmFDzyD4IjPRFcjW+EP5GynssZ5M071HELqlEhTjGdYmm+TZ
         7IDI0cmyVCaPbz/xkpC7pgPmc4nnndRON+EozPptnWzRqEPORC3SgqD1G8ZW5F5vn7VL
         P88hRnI9/GYbMA0JhWw3BsrGfUaSmqjuxapFs1lg+UwslT4X93lMYAJ8MYaLgBxXXN3F
         53rQQUOx/2Z10/WRYQcY+ctkKYTavrpUDKqqecW/QNb4qIS+UIma7wY9J8Df+weWnFDQ
         RpwaU3BEjSuJtEuZSq+waf1yhPJTO1OoeW9fpxWX9I76+z0pvMa+tH4yqH8Oc8mvOp1f
         R+Zg==
X-Gm-Message-State: AOAM531whZkwHVTFjmzA3bzhWHswTgdYXrktv0tWnL0ZDJJnyocPULkS
	GAjX2553hIfu+5hqFjNCrn5Nb41hCs2oa3hWH68=
X-Google-Smtp-Source: 
 ABdhPJz1uN68xojQrMIclsGNjPGdiEJ2q0HQ6gbHaneM35hDgzBBQZJbNRhpQ0tp4/o6iMEQo7EyDdEA/yazV0bf7y0=
X-Received: by 2002:a7b:c30e:0:b0:37f:a63d:3d1f with SMTP id
 k14-20020a7bc30e000000b0037fa63d3d1fmr8351473wmj.178.1650546098918; Thu, 21
 Apr 2022 06:01:38 -0700 (PDT)
MIME-Version: 1.0
References: 
 <a202e0b962ce90da8c68599db32bc1d218be6530.camel@linuxfoundation.org>
 <2605.1650536093249509630@lists.openembedded.org>
In-Reply-To: <2605.1650536093249509630@lists.openembedded.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 21 Apr 2022 08:01:27 -0500
Message-ID: 
 <CAJdd5GZPZFjzg-a4WW4wX15UC20_CxaU=-PpAXXLTXATYSmjEw@mail.gmail.com>
Subject: Re: [OE-core] create-spdx: question about virtual/kernel dependency
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Saul Wold <Saul.Wold@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164760

David,

It does seem like the line `do_image_complete[depends] =
"virtual/kernel:do_create_spdx"` doesn't need to be hardcoded; I
unfortunately don't remember why I added that. As a guess I would
imagine it was so that you can add items that aren't normally part of
an "image" (u-boot, kernel, etc.) to SPDX generation, in which case it
should probably at least be a variable that can be overridden. It's
also possible that line simply isn't useful at all since just creating
the SPDX for those recipes doesn't mean they will be in the final SPDX
generated tarball, and if they do we need some mechanism to
specifically add them which would cover adding the dependencies also.

TL; DR It seems likely it can be removed.

CC'd Saul Wold (who did most of the kernel SPDX generation) in case he
knows something I don't


On Thu, Apr 21, 2022 at 5:14 AM Davide Gardenal
<davidegarde2000@gmail.com> wrote:
>
> Yes we could but I'm not sure if that dependency is needed in the first place.
> Looking at the dependency graph I can see that other tasks depend upon it so could it be redundant to have it?
>
> Davide
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164757): https://lists.openembedded.org/g/openembedded-core/message/164757
> Mute This Topic: https://lists.openembedded.org/mt/90602531/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

