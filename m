Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F2FC43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 15:36:35 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web08.33607.1654529786185055169
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 08:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=UrJa/DVn;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.41,
 mailfrom: brgl@bgdev.pl)
Received: by mail-ed1-f41.google.com with SMTP id w27so19315028edl.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 08:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S+J4AmK2pxja40vBDBKTwSIl2QYvzVRAgTQkSHK8Rk8=;
        b=UrJa/DVnhuJAqqIVmfVYRGd1wI1GBPuG2AbSdvKTLJHUnfO64TTnaUSbcaJPBPnjEa
         O95rFEpbp4Ly4dOQvkDUqEGZzLkJrCX97tLQZvTikesvcj4aANJpyOtSAlhHXSThB7Cr
         2d/RJk4f+Lp1zDIe22zmcze6P4psxkmhrFBj4MwLBMUTmBypD0LUGRbVsyHpPbFWw2q2
         Ay+FARUgHQqcgJShNufraOn/z+ls82SHH07I26b+hEIVs92rrswqEZuTtLvkGoVoDfAE
         HzckAw6rT98zsI/ojOrU4GjQWJAgHp9mkiIVW9uhFYiEOPc9xuHzEUIxtGmpLf4lM7Ko
         Uv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S+J4AmK2pxja40vBDBKTwSIl2QYvzVRAgTQkSHK8Rk8=;
        b=1I9yU7usZ/A3fRBz2HCi97N155ioMnacyGDaivvfxe/EcQ7huxbX2c/JiM+dGaOlXD
         KmyMqiL2zMWe0mpCRjBGexJ1OKcwxh6haSY9dlBQcbcucq+YkF+DTau7lEqtXb5NHQYh
         7qCmv5zOzgEh94A+3udTfpQiMyERKNF5C1CtW9zSLFqyLHGPJdty7UDSyJ5M3WgtKJOm
         Pfgviuwc3kBOr6OBhS7mTgorUbF2K/JC5vG3l+tbKiedCLGf0BmlYCW6gsp0GlI6e9Zu
         3T6aTSH0gR+clgRGd94dFi3Lw1jANqyRkNb2F39OD8KOT4v3X7jifofg7rAcySJwx54v
         6Org==
X-Gm-Message-State: AOAM530NJYu12UREuQAWKrGWbApuJ1ZawajIRVGmnK/3BQi/MojDrAhe
	ufFnBhbEuPxe6z/fTWlhVgUwT17cbPkd2iHdbvnfEw==
X-Google-Smtp-Source: 
 ABdhPJwiS9YwfKLygL99SaabgGK5l50M2zQMfI+9zu1DfOfmkgbVRwgukJpQPMO5hBZ2WcRPKkqBxLNPgPN2jX8KbrM=
X-Received: by 2002:aa7:d8d8:0:b0:42d:dbb0:f05b with SMTP id
 k24-20020aa7d8d8000000b0042ddbb0f05bmr27630164eds.82.1654529784260; Mon, 06
 Jun 2022 08:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220606132653.60232-1-brgl@bgdev.pl>
 <20220606132653.60232-5-brgl@bgdev.pl>
 <CANNYZj9g-POf_jFigmeb5E6PosUPhSi5omiBoS-D9_aF4VFM5Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9g-POf_jFigmeb5E6PosUPhSi5omiBoS-D9_aF4VFM5Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 6 Jun 2022 17:36:13 +0200
Message-ID: 
 <CAMRc=MeNjfyccRPOLxJba7Pi0MS01JSphS6o+kibi+P9hG+ckQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 4/4] gstreamer1.0-plugins-rs: new package
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 15:36:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166650

On Mon, Jun 6, 2022 at 5:23 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Thanks; is this something that oe-core needs to provide? As it's not
> in version lockstep with the rest of gstreamer, it seems more like a
> collection of experimental plugins and is maybe a better fit for
> meta-oe for now?
>

Fine with me but the first three patches need to go into oe-core
anyway so I'd like to hear some feedback and then this one can be put
into meta-oe.

Bart

