Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989E6C6FD1C
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 03:03:20 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.3297.1679799798714591683
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 20:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LvMpCCyR;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id h14so1594020ilj.0
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 20:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679799798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anFNiThs9L/4+P0uK7yqwMbVmC9KlvtkXhWJ9M3zQJ8=;
        b=LvMpCCyRvd8FcaNE4fx/m4OpYzEKM+3Jgf/Ndw9OzN/ZW3moA38C55lGg4VtzAIJqq
         kW/Ku0tSc/WDl1jtbOa6cHtWdDNH2BAWvdyN6fP2AxHpgjM+NNCK43gvRP7qygfXYhX3
         IyPP+fbIoR1y1xu+J5idRj5SQAg+X9a8VdqSDtTDzxJ9/jiwjXcrN1ummMgeG+ICfaJN
         SA9I1DQUGihWCjO0iww/w4x7/wlIRf9NtKaYspbihI0O8OkjN+P88aPulbbp5B5v3Oag
         crWZf0XZWyqmrh1FYWEQS5CMBqAZNawQnGJKeZ9sbaHlusnARwN1RGFwb4VNGixoow3W
         CKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679799798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anFNiThs9L/4+P0uK7yqwMbVmC9KlvtkXhWJ9M3zQJ8=;
        b=7+XblDxcRlgyXfQtHLd8gzLCwnIjqJth0VEbyln7+IFqozsBOM4datp4TwDw7Fyn7z
         Dmq6afcdxqT5v7PJF1v2IDsrBqspuxq+nll6EEZ96qpeaHUOscE8xgrUcy3TiXn5fbUy
         lOShajuEK7XAIjJ5QQovS05qkuXwEGKB2SiF9Xsh9h7+adi20wW4dT3O6+0RW38aETOo
         g7p2dFJtIjw5Tjrf/9WSnJUvekrFAxbM48Mvyib8RuWCDnm+UJFPkOutw1UqeNIMPvhn
         f/ZxiF5lRHKFNq6ovo5d2xzPJ36BqzjCMS80anQxg42pUQGUgK6BEmOTnq/FqbLXI19K
         oGVQ==
X-Gm-Message-State: AAQBX9cB4gMttZxEdG3Bae2x6Z9xo4l6vmBYFBM2MPBEom9B3TaMPVFv
	Dp3pQ0pQ56MWy/Z2kqziUr9ong4lL28eT/W7k9o=
X-Google-Smtp-Source: AKy350b6Ti1S+sMdvWEaABf6Sar4k8kdXvEqXaYiyht+K9KYX3GX5XU3JBCm9G7oNeBEFC4T/4eCr+xkxxdDpxQ6gP8=
X-Received: by 2002:a92:d302:0:b0:316:f0d7:8db with SMTP id
 x2-20020a92d302000000b00316f0d708dbmr3510674ila.5.1679799797788; Sat, 25 Mar
 2023 20:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679670268.git.bruce.ashfield@gmail.com>
 <174FAA516F586B9E.25304@lists.openembedded.org> <2c86a440f61e95cc490e305bcdc016215d97ff55.camel@linuxfoundation.org>
In-Reply-To: <2c86a440f61e95cc490e305bcdc016215d97ff55.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 25 Mar 2023 23:03:07 -0400
Message-ID: <CADkTA4PmCKq8jQNk0OGjW-J+A00mtOgN-aEa-zd6NS6EzuZPkA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] kernel: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 03:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179109

On Sat, Mar 25, 2023 at 10:15=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2023-03-25 at 12:47 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Fri, 2023-03-24 at 11:08 -0400, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Richard,
> > >
> > > Here's the latest round of -stable updates. Along with them, there's
> > > some fixes for on-target/SDK builds with kernel-devsrc and fixes to
> > > ensure that 6.3+ works against the upcoming release.
> > >
> > > I was out of the office last week, or these would have been avialable
> > > sooner .. I already have more -stable updates pending.
> > >
> > > I'll be sending hardware reference bumps, and updates to the LTS
> > > releases in separate series.
> >
> > There is something not quite right with the kernel module builds on
> > 5.15 (poky-altcfg):
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/5639=
/steps/13/logs/stdio
> >
> >
> > make -C /usr/src/kernel M=3D/tmp modules
> > /bin/sh: -c: line 1: syntax error near unexpected token `('
> > /bin/sh: -c: line 1: `if [ "gcc (GCC) 12.2.0" !=3D gcc (GCC) 12.2.0" ];
> > then \'
> > make[1]: *** [Makefile:1797: prepare] Error 2
> > make: *** [Makefile:5: all] Error 2
> >
> > Looks like a quote went missing somewhere?
>
> I tried:
>
> https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3De0b4082f99=
a3970a5f10fa85850915ea3c254e2c
>
> which seems to fix builds. I can sqaush in if it looks right to you?

squash away. Looks fine to me.

Strange that I'm still not seeing that here, I tested all of my 6.1
and 6.3 updates with that in place!

Bruce

>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

