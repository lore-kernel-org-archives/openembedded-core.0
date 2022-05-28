Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735BDC433EF
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 09:57:25 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.13474.1653731842683085705
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 May 2022 02:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lkjuxOR+;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id q21so12793418ejm.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 28 May 2022 02:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GBuFohmlO8nY6F2sovEvHnnnQMMroBTHftGafyjWerk=;
        b=lkjuxOR+evn4pkXn56b6t2cs8/lwS1ERW4M7OeoBKjuIaGjffgToMiRXFfq/uonx4Z
         G8YYW98dVlgSFvCFVGBWzR761c6kyKwfUuY9Zy5sEftGC9jAtw4iPAUJD6K2HmOAV92E
         NNq/RZKXdyt4PEhZnp1RuBfSf/5TYsn9TISXin1tk51Rpn+5y9Dd8w8Zvj8mciK0gfqi
         TzT7/IdmKVzZ4pbjYz/SPkXwk3eTZhA7nL6ip0i724M/ucKn0zrCecbOpJKDlVRY/Sn1
         jA+m2OzlQQeW4VUVCQidV6CaUnieRI+muQMt2tgjZh5yIIUlA5IjFM8tK9qXAaJMcs18
         5PyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GBuFohmlO8nY6F2sovEvHnnnQMMroBTHftGafyjWerk=;
        b=hup4fjDSjgpPrKPmpaoKKq1PKIboStmE3A4n7U43QbTT8KLHAbjIHepEMbDS/G67dP
         snSOvJV1z1Gh1Ldca9kWqSPNmIwJzLf/wQKNa8jpDLTK+kGiAyKjExjsD3oC5QYzU/8W
         nhGffvAf1kprbJsjCHAY+lXvlxQKoD3qAy+FHaXbkJ5MySpfH/iDyh/lMYacWko3/gH0
         7g7+BaN1UTB7zZ+p3zLTNwjZSsgmXUnMtA8p7lXelWupv7gFxiy/PeWJSTpAIs66xMpU
         ka/8VorY2knScxVIz8xpq0z9phcunXXHHNL4dKXDh3hPyG1Jdvq51gfjTSBk4PQ4UoIG
         rQCw==
X-Gm-Message-State: AOAM533BmSRa72t0cXB8NVLYJVNsBznBYUxEYVjf+iC6bwOifps0Lc6k
	u19ZmuDswVCV3mVE1fkQO6KNfjMm09hBf5XdiXk=
X-Google-Smtp-Source: 
 ABdhPJxzMhzhCHEQ5FHQ2xnH6Jpeuph3veaerRpy4yiVuV8DlHnSDfHJDI817JaRc7++B1/3ekQT6fX+py2Xtg94RnM=
X-Received: by 2002:a17:906:a10e:b0:6f3:e70b:b572 with SMTP id
 t14-20020a170906a10e00b006f3e70bb572mr40232232ejy.546.1653731841076; Sat, 28
 May 2022 02:57:21 -0700 (PDT)
MIME-Version: 1.0
References: 
 <OS0PR01MB61783B64BAF9C5AE3BE85331A0D89@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <CANNYZj8LKgJA5vheJz-fMO_7ySbgPenzGMH58zSZSCMLCm50mA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8LKgJA5vheJz-fMO_7ySbgPenzGMH58zSZSCMLCm50mA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 28 May 2022 10:57:09 +0100
Message-ID: 
 <CAO5Uq5SfVGqyu-+-Nnxn4hFSaZDBtA2qhUo+TQ89CjxgvYU-cA@mail.gmail.com>
Subject: Re: [OE-core] DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"
 doesn't work.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: leimaohui <leimaohui@fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 May 2022 09:57:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166224

I suspect it's that you can't set it in local.conf now:

# $INIT_MANAGER [3 operations]
#   set /home/alexk/poky/build/conf/local.conf:291
#     "systemd"
#   set /home/alexk/poky/meta-poky/conf/distro/poky.conf:70
#     "sysvinit"
#   set /home/alexk/poky/meta/conf/distro/defaultsetup.conf:20
#     [_defaultval] "none"
# pre-expansion value:
#   "sysvinit"
INIT_MANAGER="sysvinit"

On Fri, May 27, 2022 at 8:11 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Can you explain the use case please? If you just want to use systemd,
> set INIT_MANAGER = "systemd".
>
> Alex
>
> On Fri, 27 May 2022 at 02:39, leimaohui <leimaohui@fujitsu.com> wrote:
> >
> > Hi, all
> >
> > Because the following patch, "DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"" doesn't work anymore. I have to " DISTRO_FEATURES:remove = "sysvinit" " instead to disable sysvinit.
> > But I'm not very clear if there is difference between "DISTRO_FEATURES_BACKFILL_CONSIDERED" and " DISTRO_FEATURES:remove " for my image. Can anybody tell me?
> > --------------------------------------
> > commit a6ebbe3a10ff76386dde03ddaa7097bdb2f5d9a5
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Wed Apr 13 18:41:39 2022 +0100
> >
> >     poky: Use INIT_MANAGER in main distro config
> >
> >     Just to keep things standard and clear, use the new INIT_MANAGER variable
> >     in the main distro config. This matches the default config with the addition
> >     of some DISTRO_FEATURES tweaks.
> >     ......
> >     BB_HASHSERVE ??= "auto"
> >     +
> >     +INIT_MANAGER = "sysvinit"
> > --------------------------------------
> >
> > Best regards
> > Lei
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166217): https://lists.openembedded.org/g/openembedded-core/message/166217
> Mute This Topic: https://lists.openembedded.org/mt/91367188/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kiernan@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
Alex Kiernan

