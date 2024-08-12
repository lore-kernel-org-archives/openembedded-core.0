Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A0DC3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 12:47:54 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.45369.1723466872901689323
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 05:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=meh1gPlr;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fd69e44596so28968845ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723466872; x=1724071672; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro6aA7r9GLWO1n9mRCtVdHn0w1BM8Zh3Dhy/0p0DM7M=;
        b=meh1gPlrGp5PdIpDr7ve8OXxQhr+j/7iU1TqgXUe6yar+xGeKiLw74HJr134mwl4Ac
         DRKl5k4E/fSOr5xRCka9Vyt0Aq9iRicxRwd8JwzRcPcQRrUqlHeTT6XZpG8gTKMW8b5b
         L/ZqguCCjusFBb+eMg9YhhGx2XyKLCEM5JEVBonCFmD3mqx1tpl0SPd71mXM0hqAE3BW
         XziprLgPnvRu2AFYQH9h4YTlPAs42SONskYoO9smd07Ar2u9oYeHTqlYnH04saFRQtY5
         qcNMRYYLTdTK8RXK1JWqcduen1+lEfgzimFvq1TTK/ySk4uv9RPdnyL8yyExIYnyXqBD
         YsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723466872; x=1724071672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ro6aA7r9GLWO1n9mRCtVdHn0w1BM8Zh3Dhy/0p0DM7M=;
        b=rYHpiOpngRbWvX+yAD8qAOknWTLa3V9vVw8ipV57LYxS361W4DODWFwZuP6LnhjJJ4
         9I+7mKCyudnhrJViLMCrJBRDjxW82OdEtfmcLWgtIuvWiZ7iOMNCFgOFCD09av25+cEU
         HA/PiugAdgkGPcb+eikzcyWBbsm7dkToy/ivWetAlXPbDbV/lFGeWIeI9evE35GOnTTz
         fqp8Gnp/PjeRnyOAt9l0NjZyUDuTKcU/2mpcj8c2PiV+xz4Ub3rT2NMVIuKD3ypJOPkW
         4iDwPAEu1z23akF4ud3fprfjdGnijz1ckYwu6294RtP+6N0cPLXd1vxX7g19aVI/ttGH
         26tQ==
X-Gm-Message-State: AOJu0Yynp9H2GYl/BJ2d0S5N8anSHgIvtAwyaA6lF7ctu8N6RARhlU+G
	tpQC3fHc6SheW72vj+Jrt9H5lbnU3Z+AfO4c0GcSxaFzeDEUG5n4YF2ZELns7oqXPZ/MR9xa9rt
	xCd/FQtH40sLZyDB/kFWtJREI3zY=
X-Google-Smtp-Source: AGHT+IHtqmXf98I5oiztGupCoYyvX7OIKf5lVZzy91NcGv7yQaNvfFSbS4AXH/7F9LVBAD9MDcGsnWkkU1A7nxgzZlU=
X-Received: by 2002:a17:903:2384:b0:1fa:97ec:3a4 with SMTP id
 d9443c01a7336-200ae4fa984mr132612845ad.8.1723466871735; Mon, 12 Aug 2024
 05:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723399246.git.bruce.ashfield@gmail.com> <ec8e2073832a257923c07970bc250d8a354d4203.camel@linuxfoundation.org>
In-Reply-To: <ec8e2073832a257923c07970bc250d8a354d4203.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Aug 2024 08:47:42 -0400
Message-ID: <CADkTA4Nq5uvbwNo+_OBfniFf67x1hjnBnBPiFcFF5MDRhw9XXg@mail.gmail.com>
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 12:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203224

On Mon, Aug 12, 2024 at 5:47=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Bruce,
>
> On Sun, 2024-08-11 at 14:04 -0400, bruce.ashfield@gmail.com wrote:
> > This is mainly a v3 of the 6.10 introduction series, but I've
> > also included a 6.6 version bump and 6.11 for -dev.
> >
> > This should fix the:
> >
> >   - trap seen on multiple machines with 6.10.3, I've disabled a
> >     NFS option that was introduced in .3 (and shoulldn't have
> >     been)
> >   - I've updated -rt to fix the build issue
>
> Thanks, those are indeed fixed :)
>
> > As I mentioned in another reply, the config warning that showed
> > up on meta-virt shouldn't have happened, since the Kconfig option
> > in question was removed from the kernel-cache about three weeks
> > ago. If that warning comes back, I'll want to have a look at the
> > SRCREVs being built to see what is going on!
>
> The meta-virt warnings are still there:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3487/s=
teps/13/logs/stdio

I finally know what this is, I can fix it in meta-virt, so it will gone sho=
rtly.

>
> (for qemuarm, qemux86-64, qemuarm64)
>
> There are a couple of genericarm64 warnings:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/166/builds/727
> https://autobuilder.yoctoproject.org/typhoon/#/builders/165/builds/723

Confirmed. I see the same here. If someone needs my help on them,
I can send patches, but I've stayed away for now since I don't know
what is already in progress.

>
> The meta-aws and meta-arm issues are fixed.
>
> We're probably at the point this should merge and the remaining bits
> get fixed as we sort them out as we're down to warnings?

Agreed. Let's start seeing if there are more subtle issues with the kernel
under the ptest/AB load that will only pop out with some repeated
execution.

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

