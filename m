Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944D2C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 22:31:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.18262.1638570674565874390
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 14:31:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oo6rl1mp;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.41,
 mailfrom: steve@sakoman.com)
Received: by mail-wm1-f41.google.com with SMTP id p18so3452043wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 14:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U7xvFVlQW75YO5nggOompy73UZkLWkPJuTPJsNqBG8I=;
        b=oo6rl1mpael1mJllqmU1MhCh6J8etMbg0axE2ApIILycWS2uzfJ4fL5RSUgaVwFeuS
         Wzke4H6oFHUW936klZBLvWntY58ozsPK7c31BLgAkmARO+kI5X+PNxzHYnoE1cngCXto
         HUePtVwB1n2+EwZxeMEYhssiolXzpKd49bXgLeqXusdgPCK5DXXekJdyg4NfbE4RVZyb
         GcdCT8kmqZ471rzikteXHd09oG8NpNAJzRLtCfKGwv5IYQBL3bbqmGYzoLqMZZtGtCf1
         YSGZ189upEUbGYmhMgi8C6336LpUDY8djsbhjlahQ1sEOu4UuIj7I/wf6Xp4ye64MR/C
         TiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U7xvFVlQW75YO5nggOompy73UZkLWkPJuTPJsNqBG8I=;
        b=llp09rGzkxCiQrEadYewC9GyRl0IKQ698UawyfBbnSFfaoOGCrRLkBg6vleP6Y2gLt
         eN5jBw2T2hIiKM6yaikcUmGlRqSVBV8IZ8D5gw7IyBX1N4t8n2MssgVNjXqUFx/AdM/q
         gHA/N84NEmdutTrKtYWmUcSc+kGAmi4GkyoTS3a0bjtE4R7vOU2ziNYKWGSZOluYDt9d
         yn+wAc7W2ab7d4SVqAghjkRfIduFKxM+m/xzxo5mdWqcWozIBzDkGVen1VQLIV8GoDoO
         JQW3DUV9vC3p3mptCbB4+g/AwAO3Y0vYCbkq8gTXSLpqD5HvuXcho+9sEbXSq8vsPokR
         qMvw==
X-Gm-Message-State: AOAM532Csag5/nHttAvLigYn9lMY0XyQ59UG1OD1EdZOfgoSfz54gP2q
	n2t/IsFmjV9pxY0bARwdBRZtqgtJBFdUyt9SQZjcWh7mkmypiWgY
X-Google-Smtp-Source: 
 ABdhPJyzIMBgNEOlD602AeLdds/16LGcn3knowCaOAtN80eORPvLZWyuH7+SliHhxrzvYndYXSRRUUcI+j/vYbjDizc=
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr18746281wml.23.1638570672746;
 Fri, 03 Dec 2021 14:31:12 -0800 (PST)
MIME-Version: 1.0
References: <16BC55C5B56D2FD4.26361@lists.openembedded.org>
 <8033bf1f7ebb9b35c62a3cd74fcb910d6ff2d8d2.camel@vaisala.com>
In-Reply-To: <8033bf1f7ebb9b35c62a3cd74fcb910d6ff2d8d2.camel@vaisala.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 3 Dec 2021 12:31:01 -1000
Message-ID: 
 <CAOSpxdac+r+TzT6mvX+MD67vJa=-H5yv7wLwSTspy=PKbNmYtA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] cmake: FindGTest: Add target for gmock
 library
To: Eero Aaltonen <eero.aaltonen@vaisala.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 22:31:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159147

On Fri, Dec 3, 2021 at 1:47 AM Eero Aaltonen <eero.aaltonen@vaisala.com> wrote:
>
> On Tue, 2021-11-30 at 15:23 +0200, Eero Aaltonen via
> lists.openembedded.org wrote:
> >
> > Update `Modules/FindGTest.cmake` to provide the same targets as the
> > CMake Config-file Package and backwards compatible targets and result
> > variables.
>
> Bump.

See the patch set I sent out for review earlier today.

Steve

>
> The googletest recipe at meta-oe dunfell branch is for version 1.10.
> The fact that CMake Find Module masked the targets of the GTest package
> resulted in a number of very confusing build failures.
>
> This patch is mostly about backporting the fixed forwarding behaviour
> from the Find Module to the Config-file Package that was released in
> CMake v3.20.0.
>
> --
> Eero Aaltonen
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159115): https://lists.openembedded.org/g/openembedded-core/message/159115
> Mute This Topic: https://lists.openembedded.org/mt/87401815/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

