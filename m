Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EBAC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 18:16:31 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.998.1701800181867495617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 10:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CNuCHnpn;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7b3854d7270so233764339f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 10:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701800181; x=1702404981; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaG0Qk8iEJLNx00CDIcofIeVi2hPaFaD9019Q/118t8=;
        b=CNuCHnpnxhv7+2dliL2UDIP0m35vhNIZcniJU5WoImHnhzVa5D9ld/RTNFNg9VqLhN
         USBKXtuL4d+eGixxq2UDYWvQPZ6v4XHAQ/HqKtiAPwmSb7Gw/I/8t2Fk8/LfD5j38v+Z
         Hj4Mi/ghU3+crZRDwvRKrLX0BZ827xMzhzeVki3hi2B0dx9zBycvopFsaBNFZzph1fOx
         nkmSBTXdqnx9Un8X3O4hlvjkAM3kDxUJJOYTA5UpNKKFpLfCnjC2RzDj0kmgNOCqMqti
         sXVAEtiVfxmCSIFi+qQD7gK+BOw6aceNnXJgXXvsa5epmc6+GQCIdsX7CsKcup2n7ti1
         fQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701800181; x=1702404981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CaG0Qk8iEJLNx00CDIcofIeVi2hPaFaD9019Q/118t8=;
        b=Ryu60d5roT183lHBdVAkzfR3LXz21blJcXR6DtzgNpJi68G+EQxmohZvMKvpBVk+lq
         aiuqLE2UTXMepjoydkd58p3lE0Wkqo1X4Ho5f8LA8AH1VLaaYEdealplaKbwaJbjNFBx
         VMwfpb12T2w3ZTAqRIL1bdTRhuKvtTM2aeLJzM40xZ7vViRdCc4H0zaDKpQJI8Ggsffl
         jba0ttCm4/xS9MSwpAHf1t4hkBiP6gwec2YiTKmR4di48+T+9/PU2UtX8FlHrhEAf3LC
         BRmXx+JDWk1bQALSr79mfvqwhA07IMTdPIOyAzdb5j66EyjvtB7/zIY7Eh3kNh2UIsZ9
         91pQ==
X-Gm-Message-State: AOJu0YyrpvwXUDfdTIXzIIvguOpJDD0SpU86rTa2Vo47yvQQ7Bkck8MA
	y8mUSBbZpgANGGPyXN3103wjMW/IyD1JZ3DFyAM=
X-Google-Smtp-Source: AGHT+IHTJmPrRbO9iLhYc2lTzBGld3efhX2eaPdjXiDikPbHQSlz4P3gASJqMhJbZ0fGu03rKmFg+3Qg11zRLm/K7NI=
X-Received: by 2002:a6b:913:0:b0:7b4:28f8:d8 with SMTP id t19-20020a6b0913000000b007b428f800d8mr8236855ioi.33.1701800181039;
 Tue, 05 Dec 2023 10:16:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701750230.git.bruce.ashfield@gmail.com> <20231205175523baa0bc72@mail.local>
In-Reply-To: <20231205175523baa0bc72@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 5 Dec 2023 13:16:09 -0500
Message-ID: <CADkTA4MRfq0W4iT400FQfczhYnem=Y+W6chL717BzezrBSiKAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] linux-yocto: consolidated pull request
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 18:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191855

On Tue, Dec 5, 2023 at 12:55=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Bruce,
>
> I got this: Unable to find revision 867a6bdef9701f378f5a9ce66a713daa22598=
649 in branch yocto-6.5
> This seems correct, did you forget to push anything?

I just replied to Steve.

It's my new machine having different defaults, so not all branches pushed
when I ran my scripts.

It should be in place now.

Bruce

>
> On 04/12/2023 23:26:55-0500, Bruce Ashfield wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > Here's my latest -stable updates for 6.1 and 6.5 as well as the bump
> > of the dev kernel to v6.7
> >
> > I have more pending changes: the 6.6 reference kernel and associated
> > libc-headers updates, as well as the eventual drop of 6.1 from the
> > tree.
> >
> > But this is my first full cycle on my new configured and cobbled
> > together builder after my disk failure. So to keep things simple,
> > I've limited this first pull request to try and see if anything
> > has been missed in my setup.
> >
> > Bruce
> >
> > The following changes since commit f89d9240b1208e9df28afed840376ca91842=
e5dd:
> >
> >   vte: Separate out gtk4 pieces of vte into individual packages (2023-1=
2-04 12:45:27 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.yoctoproject.org/poky-contrib zedd/kernel
> >   https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel
> >
> > Bruce Ashfield (7):
> >   linux-yocto/6.5: cfg: split runtime and symbol debug
> >   linux-yocto/6.5: update to v6.5.11
> >   linux-yocto/6.1: update to v6.1.62
> >   linux-yocto-dev: bump to v6.7
> >   linux-yocto/6.5: update to v6.5.12
> >   linux-yocto/6.5: update to v6.5.13
> >   linux-yocto/6.1: update to v6.1.65
> >
> >  meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 +--
> >  .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
> >  .../linux/linux-yocto-rt_6.5.bb               |  6 ++--
> >  .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
> >  .../linux/linux-yocto-tiny_6.5.bb             |  6 ++--
> >  meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
> >  meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 28 +++++++++----------
> >  7 files changed, 42 insertions(+), 42 deletions(-)
> >
> > --
> > 2.39.2
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#191777): https://lists.openembedded.org/g/openembed=
ded-core/message/191777
> > Mute This Topic: https://lists.openembedded.org/mt/102986376/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

