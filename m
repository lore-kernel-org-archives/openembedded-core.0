Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF803C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 11:07:04 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web09.3227.1655291219217839267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 04:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OIDhppoy;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id s6so18285698lfo.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 04:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=61L3CgNq1SPKTMyGHBrWvB5m9N9jwMIzG1huv8qmZJg=;
        b=OIDhppoyja39yx9NJRQbNDkTy6lqBiTya/64+kdHL3sxpp0hFWQbnJkWUI0ZdvN1LU
         MeeyJ47Qf5KMNx3kkkC6Kmr/0BbrlYYnHSlnwg+0Cg7fxAeqrNqnsHDjQF15Jbl285mV
         gGZlklUlQ8THZfh49PfPgHX4UFLnWKCpKvqlFXxtkyN5kyrrVbJln0HDZfR2BlxB0qAC
         qu3raNqXsj8PYHopgsLzINZgqz3ksGl5EXWe3hPM2YSFQRFYdubiqp/upA3GbaX5HEl8
         F9xgyFbPoteH0fqdgE37XzEFcKTbONJfVkk6feoGeVZmSC3pOP6X+MlyZ86/VoKTVw4v
         nUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=61L3CgNq1SPKTMyGHBrWvB5m9N9jwMIzG1huv8qmZJg=;
        b=aVeDNUy9v9uSrKNHYueyt+D51VTsNPkaA2noLfHUjN8rmPRRBHuX7LdkWwPTdQep9c
         FQOO7jzRIQtnpEWatxyG7gn2e3Tz5ZTUeqRVUbiGV5yXB/NTY2hLGT8pIbO+o5FUfylI
         O6zVMnngxsy/JXgJXA8+B9iSupWOj0A5a2VxddulkU5WW8A92rpho+7q3DTW/hHMF3no
         Et6T6mDXPzNDNtKlzPLM5RiaZMI8iufND1ziUvWar4LGFJfBL0IcBrZBypMYkVnwyhhX
         q3oFinxLKpBN9EukFIvC8OeQ2eugAfQPJHPf0/MgsQdmWaOkk0UVUTM3gmewpxlXImnr
         1HUA==
X-Gm-Message-State: AJIora+TfgM11v3JIFA1H/AAcj8n3bQTyIf10HyjLWGq4pxuFXkbDbdm
	xTIKZ5qg8dq6FlKMmLJnbe0MvqR9sl5RYMG3CAo=
X-Google-Smtp-Source: 
 AGRyM1ugtnAbsAjFBj2ofVkaUyJ96rAfM77gEfZiLknGZ4YJ5rjlj4p8VTk1Xv1Nj7BKMM9NELR4USRvnTzOM/+RI4A=
X-Received: by 2002:ac2:48ab:0:b0:47d:af82:65e9 with SMTP id
 u11-20020ac248ab000000b0047daf8265e9mr5563888lfg.673.1655291217405; Wed, 15
 Jun 2022 04:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <1655284069-7150-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1655284069-7150-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Jun 2022 13:06:46 +0200
Message-ID: 
 <CANNYZj9dmfgbj5FsfxFn1uKQwC-CjFjygC85GKVQ1i5g9Xsiig@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] erofs-utils: upgrade 1.4 -> 1.5
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 11:07:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166931

On Wed, 15 Jun 2022 at 11:08, wangmy <wangmy@fujitsu.com> wrote:
> License-Update: license switch to GPL-2.0+ OR Apache-2.0
>                 for better 3rd-party integration.
> -LICENSE = "GPL-2.0-or-later"
> +LICENSE = "GPL-2.0-or-later or Apache-2.0"
>  SECTION = "base"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94fa01670a2a8f2d3ab2de15004e0848"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"

Only liberofs is dual licensed. The rest remains gpl-only. Please
consider again what I said in my previous emaii:
As we do not package the library separately, I think you should make a
comment in the recipe that

# liberofs also available under Apache 2.0

and make a similar note in the commit message.

Alex

