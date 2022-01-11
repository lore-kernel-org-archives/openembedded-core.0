Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45639C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 14:00:46 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.7217.1641909644831604772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 06:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PwILXAy5;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id o6so67612158edc.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 06:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s9Cdu5u26u/7lZsRyRDyS3FmHWtiygWOW8XyYyVdPIA=;
        b=PwILXAy5ZAU/6gXYK2K1Oc6L7geasp8zS7+oleVyCcSR2XH1I4MzghoZgkn4ukc6JB
         +9rxupAuy0/YDVHvYhJsOAnxPfzJRYkx1fSNBqKDskIEwWSMMFWst2iB1qpv+WkOasdK
         3vo4IYJnCjJdeOUdYCCLHSZYTEtzSUGfQTBjO7T+8HUeSpWg4WZyz5R749gelYBrBnD+
         jbT/tdvW4+le+an3BHMO891MI/X03HInersVLYDTpP6DFhN4reC5cT9N7C+YBtfZpc8R
         UYDKYnPlimtlw2KT+h/dbARNqi1uF4b5P7gYhja4jUZ5pvXh6zI61GM4BvDKhySF7BZK
         2tUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s9Cdu5u26u/7lZsRyRDyS3FmHWtiygWOW8XyYyVdPIA=;
        b=1ZT3nhovvikhEF9YaY50rij5Mgv7iZNA5EOW5BBWCKLGTYN9HUWhhiQ6oxP7pEhEJy
         SlhNUcbNPn5NMciSmp+KLSJr/y/hP79yOW1Mb5tnwhPF85MB6v333SL7hQSxrQ4kO5L8
         0UqgKV//75jSuiSbjmn1cyxZUq+BnMNk9iwVpMO7EALrTZLWBaPMVKv8ym7nfOPzAdj4
         RHsd9DbJpyvMc+FFkyF9UjjIFLf4DXJKYG6rRXG3anlTTRF2Kf8O7BJEoZEqQWrkSePg
         GC1oKpnz0XsI+YGNrP7IzFoF4g/CweHPSrcwQ7e7OYR63UnYKgKUduHDyHhaVnjeKbvI
         YMEw==
X-Gm-Message-State: AOAM531eh4D6NHeKSTKeS7oPHAuFa641ZUXcKKBnDqNnFL/V0nIF+w64
	BUVAqHKCTMCwnU7Ho85fHgRxsEZOz599OOsFfKc=
X-Google-Smtp-Source: 
 ABdhPJxzxHakbT1rp70BmtsW4xbqinDKqnDHiramG3UCcmAFfxJaG62Y/xqMSyRHbuobDsno3474Cm2WkkbUtz7yNXY=
X-Received: by 2002:a17:906:dc95:: with SMTP id
 cs21mr3967080ejc.532.1641909643049;
 Tue, 11 Jan 2022 06:00:43 -0800 (PST)
MIME-Version: 1.0
References: <20220111135540.2874535-1-ross.burton@arm.com>
 <CAAnfSTuYa5wJEJWwqAFTp8cRYBndYeuh-2opSEYcatcqBo0sZQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTuYa5wJEJWwqAFTp8cRYBndYeuh-2opSEYcatcqBo0sZQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 11 Jan 2022 09:00:32 -0500
Message-ID: 
 <CADkTA4NLVQ_if_y+eqS6P5X_MN_RUwP1e_YL6S5vYOdSGsc5ig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/selftest: add test that kernels build with
 defconfig
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	"Mittal, Anuj" <anuj.mittal@intel.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 14:00:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160403

On Tue, Jan 11, 2022 at 8:57 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Tue, 11 Jan 2022 at 13:55, Ross Burton via lists.openembedded.org
> <ross=burtonini.com@lists.openembedded.org> wrote:
> > The standard linux-yocto builds using config fragments, but it's a
> > supported option to use the standard defconfig.
> >
> > However, our enhanced config checking means that defconfig will often
> > cause configure warnings.  Add a test suite that exercises a defconfig
> > build is successful without any warnings.
>
> Note that this breaks with current oe-core master:
> https://www.irccloud.com/pastebin/nAapZUm6/
>
> Anuj, would you be able to patch the x86_64_defconfig so that it
> doesn't break with our tools?

We also might be able to mask some of the warnings, if we decide that
they are optional / non-required.

Anuj: I'm finishing up some kernel updates, but if anyone starts
looking at this, feel free to ping me about options, etc.

Bruce

>
> Ross



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

