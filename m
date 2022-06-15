Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FCBC43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 08:39:24 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web09.2245.1655282359340047144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 01:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HvkHUKjr;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id t25so17749995lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 01:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HUU8xfYgt0tnbBq175/N2k887tdWpZBrlnJJcQ/CmUE=;
        b=HvkHUKjr2G01KBRPcfDgliEV17TiLjib69OAVKLCkdadqeJfU1d/aGRC0MIKbBFHF+
         aZ61OXhs/7GYSytoiUxrpHk0rTJCp0h5qx+i7NX/1TGTRkjcgJsVl3Xq2+iWL3m7p3PC
         lOJygt5qo619CWw+oU13OMY8pLhdySILsXv7uFAfUvx1KYov0dg1ZRL4140uDlccqpYU
         pO9U5iJHClezNHbNX11HlZnSLr4AyCLjXOgPzNr3YAxanV4cQ0QGb1UzJll1eMSjESAz
         qZFrQ8vb4Ow+mgEfT0AG3LAHQaAk2PLkYxLYEgMA9mKSHB7zPkxmLEpQIKanYifdqG5I
         al7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HUU8xfYgt0tnbBq175/N2k887tdWpZBrlnJJcQ/CmUE=;
        b=zI58dpQSeUjK8GyrRlhyVYnxwjLrzeqLn7oXarLswaGQ4aJs2/+l9SbV4EWseAAIem
         PXonylZWlzMPgjA+yMDnNNojgT7OuOoyRKelWZCVyrpZ+cH+Nnvoye2c3JeJy35Z5Exq
         iqdwUbJC7uRGyqF0sipSywxkoDSZ9gKG1A3D/z3veAJI04dblNrodrOLMjiDSDkSzE8L
         qETOSmy4fAP9FKPCFN49wfA41QByWCABLWesR7tCFJobVxzkSyq4i3PidQYPAjbQ+cgl
         yxIS6PzBZ6ylUMnM/JOxmYcycHRoDrk7N5t8w+U25o78RxXqgIsE0ugEBumedR7lX4Hi
         9AvQ==
X-Gm-Message-State: AJIora81DdRgUk2966uB4HBtrwSC5+t9haq1J9yI1XtTwbpSN3wlRxOi
	iUioHB/z1FCneNsVgGU2xliRsUkflYVVCtKrqFQ=
X-Google-Smtp-Source: 
 AGRyM1sWPaQt44MaGh+qY9AZ8uv3JYBsnQYYwkL9iiaiYN14pFfF04IbY+uTeOQA12GTDLGyWu8XVE0F0eYr90trGrw=
X-Received: by 2002:ac2:48ab:0:b0:47d:af82:65e9 with SMTP id
 u11-20020ac248ab000000b0047daf8265e9mr5237948lfg.673.1655282357610; Wed, 15
 Jun 2022 01:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <1655280963-6605-1-git-send-email-wangmy@fujitsu.com>
 <1655280963-6605-2-git-send-email-wangmy@fujitsu.com>
 <CANNYZj-0g9sjw03+1=_sYzneXG6uWVAvsrP7TEcEnbbsgspfNg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-0g9sjw03+1=_sYzneXG6uWVAvsrP7TEcEnbbsgspfNg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Jun 2022 10:39:06 +0200
Message-ID: 
 <CANNYZj-Koqhh-1zeyvkzzP+GTC9LZZCeS19v4uzMNDdtHUnuuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] erofs-utils: upgrade 1.4 -> 1.5
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 08:39:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166923

I believe this is the change: it's actually about relicensing the
library to be gpl or apache:
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/COPYING?id=49b344c5531a7819f282b0b1b6eb01682c0e41ae

As we do not package the library separately, I think you should make a
comment in the recipe that
# liberofs also available under Apache 2.0
and make a similar note in the commit message.

Alex

On Wed, 15 Jun 2022 at 10:32, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Wed, 15 Jun 2022 at 10:16, wangmy <wangmy@fujitsu.com> wrote:
> > License-Update: changed from "GPL-2.0-or-later" to "GPL-2.0+"
>
> ...
>
> > -LICENSE = "GPL-2.0-or-later"
> > +LICENSE = "GPL-2.0+"
> >  SECTION = "base"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=94fa01670a2a8f2d3ab2de15004e0848"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
>
> The license-update notice should be an explanation of what changed in
> the COPYING file, not just repeat the LICENSE change.
>
> Alex

