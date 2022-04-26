Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68510C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 12:06:27 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.5322.1650974785018580150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 05:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g4MB8/Kd;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id y3so15233155ejo.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 05:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yt49XIFOYxRaEK9vyGAWLFTZc+WNI8EJHIKDHo07D6o=;
        b=g4MB8/KdHR9VcZ64ow4vHve+8OvwFBMXgLwzS4BRHn4IXuK+aoxXofymPM5D0CgP9g
         kADY3NRd9mlriIXGmfhsw/OWH1a5j1yaKyMg7vUiAePK8HQYkyUbJK2R/lPFZYO9H8OW
         G7xzrvfH5HIU23B4ts0Q27DJpTU36O5krxZ9s6vzsmkeYD14Fdfa5llYObagCrTZNJ8T
         lrpkdWSh93m2WSs+4XpQn9q7dHRaxfyWvrX096O3tlEwpzJa82GLIGRVp7wiKbQU61sa
         Ym48aHpUvTHvK6A1eInA4iQKoMs+muqHDYPyW6YoM6XUv+PsU4MPyD/QNfVAEoOtNmFx
         eELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yt49XIFOYxRaEK9vyGAWLFTZc+WNI8EJHIKDHo07D6o=;
        b=OZvmbI63lLUYW37Yog9M6qU0cv8O2tRBhKl9QfZx+12C6qVlbWk/nASn5aNb3ZwoYi
         z4A9ssQbfXklSFFtCrsu6cGjjvaiXMG3qqYbY9u7X6buVrvUzkv6EkJUNhJFRtEfrIXT
         pRjH6Ctx7+Ym4EMjvng2ozQ/OUo/XmIwzmIK96XVLdO+b+o3VOCOO7KdiiV3bN3Es4Op
         C3vm+qfS0Uy7S7FtaIxfCdv+5QQG5UtBdWhOQNg4+mV5lcuA/aJbfAmZc+tSnwZC4G6O
         60ccRZ/mNtCoy53urWQFLPd0fF0u3xgSvyiV3HH1kPVBZaK2K+C1rlOPvVZ2F6W/8C/5
         ADmg==
X-Gm-Message-State: AOAM533kdAIgoQ7QaNu2CjW8/aiTlKfYsaWGPMoHQyBrUWGKXHKlIWyi
	mltHPlzu5kTw1X5ds6P95V12x3pz5ah05gVLZQY=
X-Google-Smtp-Source: 
 ABdhPJww+cOEkKR76A92Sn0D7wqPVOZz9YGOyc0I4sHlS4poWMqngPRtFG7fIqeC4fI9vz+JncslJyCLJEU1Hkr9rFM=
X-Received: by 2002:a17:907:3f86:b0:6db:b745:f761 with SMTP id
 hr6-20020a1709073f8600b006dbb745f761mr20277037ejc.610.1650974783329; Tue, 26
 Apr 2022 05:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220425100533.101314-1-pgowda.cve@gmail.com>
 <20220426135605.34ac2f80@melee>
In-Reply-To: <20220426135605.34ac2f80@melee>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 26 Apr 2022 13:06:12 +0100
Message-ID: 
 <CAO5Uq5Rd2KdssUbeW6WSX743i2HCTq+MFcdDAFyJU8EVYvF6zQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: update 1.59.0 -> 1.60.0
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Pgowda <pgowda.cve@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, rwmacleod@gmail.com,
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 12:06:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164867

On Tue, Apr 26, 2022 at 12:56 PM Luca Ceresoli via
lists.openembedded.org
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:
>
> Hello Pgowda,
>
> Il giorno Mon, 25 Apr 2022 03:05:33 -0700
> "Pgowda" <pgowda.cve@gmail.com> ha scritto:
>
> > Rust has been upgraded to rust-1.60.0 that uses LLVM 14.
> >
> > Please refer the following link for more detailed features.
> > https://blog.rust-lang.org/2022/04/07/Rust-1.60.0.html
> > https://github.com/rust-lang/rust/blob/master/RELEASES.md
> >
> > Signed-off-by: pgowda <pgowda.cve@gmail.com>
>
> Testing with this patch applied triggers many warnings:
>
> WARNING: preferred version 1.59% of cargo-native not available (for item cargo-native)
> WARNING: versions of cargo-native available: 1.60.0
> WARNING: preferred version 1.59% of libstd-rs not available (for item libstd-rs)
> WARNING: versions of libstd-rs available: 1.60.0
> WARNING: preferred version 1.59% of libstd-rs not available (for item libstd-rs)
> WARNING: versions of libstd-rs available: 1.60.0
> WARNING: preferred version 1.59% of libstd-rs not available (for item libstd-rs-dev)
> WARNING: versions of libstd-rs available: 1.60.0
> WARNING: preferred version 1.59% of rust-native not available (for item rust-native)
> WARNING: versions of rust-native available: 1.60.0
> WARNING: preferred version 1.59% of rust-llvm-native not available (for item rust-llvm-native)
> WARNING: versions of rust-llvm-native available: 1.60.0
>

When I was cherry-picking this back for thud (don't ask) it looked
like the the version bump in tcmode-default.inc was missing.

-- 
Alex Kiernan

