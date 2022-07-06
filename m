Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB385C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 13:54:33 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.6443.1657115664586401782
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 06:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GtBhO1MK;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id f11so1156103plr.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 06:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9yLinnFZXsQcWEp/AdIt0YlM6oIxI+3VHxLY1NCMQys=;
        b=GtBhO1MKLmCEPxtB1iGHJ8+HLDSs/1XJInUXKfSsQEj8b7lcmKZGe8JzyLaR1fcs1j
         KyPWm7XYsDjeN4my0Pw0xC6+Q1pD7w3RjLqfSHAkizAj2I5EFpYcyxji288H4f9Df7sg
         Rh424NB7pAyKnb1Y3FZUYLTowlqF2ucQuiuY5+spPtXDWdyW48sdajqUEmx4GuXtWQF0
         pKp5uAoGHL5yx5lHWAzhRvUJMVKg0FVQC+VQ5uoK06/mg2iruSMSpEgmV8jwpA+tL1wF
         RtiVdKGLg4W0w3V7z5EZ4jJ8bxyYEav90AhIvmeLrEdKbOzXcqMEKMzpBDpN3nx/iCSm
         WRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9yLinnFZXsQcWEp/AdIt0YlM6oIxI+3VHxLY1NCMQys=;
        b=KZaIXwUujVnz1/ar/E4uQ3k/co3p5qrTnFiGDuaqvCOxBQ9+/aa7S/Ah4CH1ARBqJX
         QNrK7o0mV4eQn8HzEXfa17xIUIUZrF+ce+jZXJaJZXRYWea8WKhXEmaCvlhcZ3Z8PyYR
         ppiNSJCnqW82YTm/Ln5HR2LZLfBhBSRdf5C8kiI7mHsQpurESPphIoA4zZVYVaaMnKBQ
         APVTJiG76iRR/vlroJ9AAJp4I2nX2RGfK8FpWcFtnRBKthOsV10aGMEzwlhjF5ChSnDq
         vYXsPp+X+pWnso9qJ5iBM1AG5u6PmTl3shoIlmMq7NMWb7FYeA7VVhjew8xk1gcfnIZW
         k9gg==
X-Gm-Message-State: AJIora/ayLYOLvh6hflR5EIW2u4G9NIxrJmjR2q4jqrEfK3EmvFBeIfR
	pqL2BoMBN7DJrbyDy790X3gY9iKdxO1JOwk0TdU=
X-Google-Smtp-Source: 
 AGRyM1tsg+y0moHk+Dju+LpXR0ptvhP8u6oztWUBMt5snj997VzM7eo0b20n5mQppfIZ0gIOB8CY77J+ynhdhk3KRFI=
X-Received: by 2002:a17:90b:1807:b0:1ef:8aa5:1158 with SMTP id
 lw7-20020a17090b180700b001ef8aa51158mr18952263pjb.163.1657115663910; Wed, 06
 Jul 2022 06:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <YsWOLwlNxhAq7sKz@mail.local>
In-Reply-To: <YsWOLwlNxhAq7sKz@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Jul 2022 09:54:11 -0400
Message-ID: 
 <CADkTA4MA9UzD3=scNNj=G_p4Lvv-3WZ=20PH9QzsaL0L5k022w@mail.gmail.com>
Subject: Re: linux-yocto 5.15.48 reproducibility failure
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 13:54:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167726

On Wed, Jul 6, 2022 at 9:29 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Bruce,
>
> I got the following reproducible build failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1116/steps/12/logs/stdio
>
> To me, it looks like the in-kernel config changed, did the compression
> alg change?
>
> Are you able to look at that soon or should I file a bug?

I won't be doing any more reproducibility work until the end of next
week at this point.

FWIW, I have more -stable changes queued already, but the can stay
pending until we sort these out.

Bruce

>
> Regards,
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

