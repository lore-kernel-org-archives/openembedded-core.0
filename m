Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D397C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 21:09:28 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.14059.1641935367635087705
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 13:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H2yL9MRq;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 30so1459559edv.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 13:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qSdOEBYPXxEE065TaYo61YKl+nE3S3BJQM27YQr6MWI=;
        b=H2yL9MRqCm8c489frmUPcg531xSK3VTdUEIZzduBo+C+qeAwWY1/XWpnJFyJpAV09p
         BfmCWU4spHKl7a5mlRgQ33u4l3+0YeS0nMhvviAU98oVr5xuo7nt6fv8Y7FXrv6Rx8nA
         xffCcajt3p6Sl81R9Fdg469XdY1NAJkuhU0ExC5ftjlgAq3yze116Vqwe5kK8MyqBI/a
         r+g65KV5I0kzgt6KWCledNxlMqL+JSRCzmGuNEdl+mZoYgyAQ7023JWtHvp2AjKIS1Ae
         JMoHa+iAHBy4ntmmS9coSP4IYIhVwJNg2zZax09rkaqfGi/2AZ1FBw4/Y27uEZ9DMTup
         2Tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qSdOEBYPXxEE065TaYo61YKl+nE3S3BJQM27YQr6MWI=;
        b=b7I/eP1bvaofAOrtzv+/PZxcB4RWSdD7hemeHZ4zj2gh8mumebA3Dzve4NVo6OnuWq
         xXCOX8Fa3GgwDnazVuN3Pt6PxMpXrNPh6c5SaknaeivQAedQWlDINAbUz24rS931dywE
         7CfQo/BwTm/MQWGLOn+3YM4AOAEln+qPO4hgIpZj594/3qCH0BO2PsIRWKq+p9R3bcYa
         u7LjENKz70EwUQUPK5va7CC9qtP+pQpIKsmXAUBw3qJbXxJ5xRUVE4UNZOHo8atdm0iz
         S+KZblEcxvS3humZM9xRTgd0WI63I8DxgPV9C75e0KyFqB0Vw3OuN8x8s7XqikcoD7Wu
         p/zw==
X-Gm-Message-State: AOAM53291Mk+EPijLikUVeSS6TP1ABYYL475Dbu1HAE+FtKCcUb/BuNo
	Jcc0CODiIM9E34dQhGieBaief993L4FwX+sBYKg=
X-Google-Smtp-Source: 
 ABdhPJxvrtznAmT/4PgCSUdbROF+GcutF7ynLugLH7DKOPetCT98U1oa0igQ1OchuiWVWA9lttnqWjYebO//2jhMJA4=
X-Received: by 2002:a17:906:584d:: with SMTP id
 h13mr5037417ejs.141.1641935365969;
 Tue, 11 Jan 2022 13:09:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641923693.git.bruce.ashfield@gmail.com>
 <CAAnfSTu7b_zxHe4wfbrvxMguM_nqm7MdEZLgjfDDRp6RX=dmAw@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTu7b_zxHe4wfbrvxMguM_nqm7MdEZLgjfDDRp6RX=dmAw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 11 Jan 2022 16:09:14 -0500
Message-ID: 
 <CADkTA4MnAe+=ZSsOzD7=-wH-3knS1FVifNQ6Bj87XJNWrn6DYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/10] kernel: consolidated pull request
To: Ross Burton <ross@burtonini.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 21:09:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160465

On Tue, Jan 11, 2022 at 3:47 PM Ross Burton <ross@burtonini.com> wrote:
>
> Does this include the defconfig patches I sent earlier today, or will
> those need to wait for the next update?

Next update, but I'm doing the -stable updates from this past weekend
now, so they'll be following along very shortly.

Bruce

>
> Ross
>
> On Tue, 11 Jan 2022 at 18:00, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > Here's my next consolidated pull request. The -stable updates are
> > routine, but I've included the default version bumps and dropping
> > of 5.14 in this series.
> >
> > My AB run showed some ping/ssh failures on sato, but I haven't
> > reproduced them locally. So I wanted to send the series to see if
> > the issue is real or not.
> >
> > There are updates to 5.14 for configuration in here, followed by
> > removal, but I wanted to make sure the SRCREVs for that version
> > are fully up to date before the drop, so we can use it as a reference
> > for older releases and any remaining users.
> >
> > We've already sorted out 5.16 in master, so I'll be moving -dev
> > to 5.17 in the next couple of weeks, and we'll be ready for whichever
> > kernel version fits the release timeframe.
> >
> > I'll send updates to poky/yocto-bsps separately.
> >
> > Cheers,
> >
> > Bruce
> >
> >
> > The following changes since commit bd28d659b2ef6e887e4d9ff44fa7377fa802f28d:
> >
> >   systemd-boot: restore reproducibility (2022-01-11 10:53:44 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.yoctoproject.org/poky-contrib zedd/kernel
> >   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> >
> > Bruce Ashfield (10):
> >   linux-yocto/5.10: update to v5.10.89
> >   linux-yocto/5.15: update to v5.15.12
> >   linux-yocto/5.14: fix arm 32bit -rt warnings
> >   linux-yocto/5.15: fix arm 32bit -rt warnings
> >   linux-yocto/5.10/cfg: add kcov feature fragment
> >   linux-yocto/5.15/cfg: add kcov feature fragment
> >   linux-yocto/5.15: update to v5.15.13
> >   linux-yocto/5.10: update to v5.10.90
> >   linux-yocto: drop 5.14 recipes
> >   conf/machine: bump qemu preferred versions to 5.15
> >
> >  meta/conf/machine/include/x86/x86-base.inc    |  2 +-
> >  meta/conf/machine/qemuarmv5.conf              |  2 +-
> >  .../linux/linux-yocto-rt_5.10.bb              |  6 +-
> >  .../linux/linux-yocto-rt_5.14.bb              | 45 ------------
> >  .../linux/linux-yocto-rt_5.15.bb              |  6 +-
> >  .../linux/linux-yocto-tiny_5.10.bb            |  8 +--
> >  .../linux/linux-yocto-tiny_5.14.bb            | 32 ---------
> >  .../linux/linux-yocto-tiny_5.15.bb            |  8 +--
> >  meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++----
> >  meta/recipes-kernel/linux/linux-yocto_5.14.bb | 68 -------------------
> >  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++----
> >  11 files changed, 41 insertions(+), 186 deletions(-)
> >  delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
> >  delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
> >  delete mode 100644 meta/recipes-kernel/linux/linux-yocto_5.14.bb
> >
> > --
> > 2.19.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#160424): https://lists.openembedded.org/g/openembedded-core/message/160424
> > Mute This Topic: https://lists.openembedded.org/mt/88354888/1676615
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

