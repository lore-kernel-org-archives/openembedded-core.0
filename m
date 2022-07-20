Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF98C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 10:09:35 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.52104.1658311773714474482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 03:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fal/IOPE;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id u19so20617249lfs.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bDoTH6wPSyqGZbytaWYYdRljmqeymcJiIDtOM+mO6AM=;
        b=fal/IOPEw5rXi0bh79KaDo+2qOwASqwTPye/+7UZdkSGkSSqkaX1tTYRbRZFhR+4gL
         +G1tkmYF2L/nSOAPshOreDY77YQa8/RTYIF4ZT4e0lp/A4cR4KwFwVHqLQVvx3A/ntEC
         9EiGUMmv0NX2UvjsuJIqyk1SjfdAEiuhV1ESLY4I0J00uPpICg/bx0kLBy9I5PRy4/lX
         6tD1RclCiUFlbDhDdT5noeeKFIP8dPS9m0tnLpynHJxAoKpXmok8gUenXnNGOCdE41Xn
         T7fesF+1l9xn3Xq0QLqfuK3rIHazZQ+cwCafYURQ4D8ggk3T2hbWv9JnYOOiX+H0E53O
         oshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bDoTH6wPSyqGZbytaWYYdRljmqeymcJiIDtOM+mO6AM=;
        b=Buyvc3GcXrmIQjRWEDopXBMecakWOl47QaKymMo5W8qm3zcUnVQeeNNMph473jKyjt
         VQsEFbzJxWSQba3MUL7mFHpqwc8+RxgoGis4V445g5nvNDLx2/lkoO9zm/JWwfwZBfYb
         /1fsbLrkRUy9QysKFA7EMvbQZ4FRrgfa+CNX2QJdwc6xQmQDEphT01Iz4qa9WOdnrjUU
         lA/DS+pHuAznfvP2pqPaGydgehUN3zeld8iSzXyeFJbaT7XfN+TT0aznOe4Ah6+M79qi
         nD7MrL1aSJYOFcZOEpDHw+B/l13AvTqwox5itvt/ayfjgeO2YuQ6uVobddNHsg+N5yVw
         RiMA==
X-Gm-Message-State: AJIora/xQFL7w+b0Fxmy4QjTxKpBkBD/7RxCFDSOVyOacwfO2sLDzYWj
	5uZNlu0056pph+ToLexOohyly0Nuc6HcCWvu5yM=
X-Google-Smtp-Source: 
 AGRyM1tZW+MLcpl9duSuJDIGICiPIiB07PQSnSc8MqOIMoFWVMuP83fpMP2ySlM9tbTH9BAhrg3ZsuzBx8ZkLWpBaeA=
X-Received: by 2002:a05:6512:3409:b0:489:c549:4693 with SMTP id
 i9-20020a056512340900b00489c5494693mr18709818lfr.26.1658311771679; Wed, 20
 Jul 2022 03:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220720084442.2940187-1-alex@linutronix.de>
 <20220720084442.2940187-10-alex@linutronix.de>
 <YtfR3KLvG0D4eLcP@mail.local>
In-Reply-To: <YtfR3KLvG0D4eLcP@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Jul 2022 12:09:20 +0200
Message-ID: 
 <CANNYZj8oCFGN_fb8LY_tynsGG1NxatHORqSUVrfy_W8kjuo08g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/51] xf86-input-keyboard: remove the recipe
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 10:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168356

On Wed, 20 Jul 2022 at 11:58, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> > diff --git a/meta-poky/conf/distro/include/poky-floating-revisions.inc b/meta-poky/conf/distro/include/poky-floating-revisions.inc
> > index 6f473de88c..0cc4e005b9 100644
> > --- a/meta-poky/conf/distro/include/poky-floating-revisions.inc
> > +++ b/meta-poky/conf/distro/include/poky-floating-revisions.inc
> > @@ -43,8 +43,6 @@ SRCREV:pn-xf86-input-evdev = "${AUTOREV}"
> >  #PREFERRED_VERSION_xf86-input-evdev ?= "2.0.4"
> >  SRCREV:pn-xf86-input-mouse = "${AUTOREV}"
> >  #PREFERRED_VERSION_xf86-input-mouse ?= "1.3.0+git%"
> > -SRCREV:pn-xf86-input-keyboard = "${AUTOREV}"
> > -#PREFERRED_VERSION_xf86-input-keyboard ?= "1.3.1+git%"
> >  SRCREV:pn-xf86-input-synaptics = "${AUTOREV}"
> >  #PREFERRED_VERSION_xf86-input-synaptics ?= "0.15.2+git%"
>
> This patch doesn't apply because of this hunk.

Can you cherry-pick from
https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/package-version-updates
instead?

Alex

