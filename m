Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7E4C001DF
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 12:49:40 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.60648.1691498977902026052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 05:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iphOvqUP;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3490cce329bso13478835ab.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691498977; x=1692103777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGWpdWLyXbTrIAnm2LbVjCgnQF9UaAo+k9MV8nRfkhY=;
        b=iphOvqUPp+AbFTboua1OvoMeBiRIdEJJTCHg0GHQbppyBMQljkJeXrZkEkVo0ivYKj
         5saemdXjRX/01kTTmV9YdT/Nm2rwbb/1uqeBOhPSL++wDPovz4XgNDkmLIUlRM0jU+rL
         IVzOEOGe+Yyj+0oiS0AOP5CtnH7nssC3ZeX1NEQGtm+zAwILI0rAySKhBBVdY3Tiev7q
         o18dPqzqfwDL4dfza+M4Rc1EanLKaMFPv0QTDS+yL8y/78XXS+l9EanXZT54H341wgG+
         aC9RcQQ785+h+XFgwBFON4738wAWPESfV9F/tqltQEbfVhtxf2zISQFv/4zTIbZsDGXJ
         cedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691498977; x=1692103777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGWpdWLyXbTrIAnm2LbVjCgnQF9UaAo+k9MV8nRfkhY=;
        b=WkRsT9FP+9/NHI7trOFCbe+YYPh6DKVnsluLhtXmJl5KAgCAJuW/ei0a6VJ+r1ypcD
         /1guvKzHDjDXmmwOKBDHG7sr1oBiIpiBGzpL19q34oUiwNwZZvFUyWaMKwQCBwOHO6r9
         cUAc7kMtEZD72HZ8VvTGJPhiWFEIiEqwmaBULVLYsE9a1HPCOgNR2Nyy00GQelnQXK3h
         N4idUH4nnaa+NDSXwH/S/TGTHof9Ef4FICjp1zDEcbX3wtQDwoXy+9dkWMivBxu25phM
         KpyboIoNLVsYi4kTBEOowgr9yyvk3IFvsTfYIS55O0UChhmOeUdtGcEzHdnxb12Kzgxx
         +6qg==
X-Gm-Message-State: AOJu0YzC7mO60WY6CUocljGh1YD9up9mAiM2gvrCDXOMoGrh+QXd9OnQ
	XoKbITLSCRtlKJj7WzHEs1h95q8t89bO1vyCjCc=
X-Google-Smtp-Source: AGHT+IGMISffPB2awiR4kc7ApyDCLyRELrlIEIP+/Tu2iWp4Qy8IVI9qYTYm6lE0jwYMLkz65jUPb8LZcnglcYk6SdQ=
X-Received: by 2002:a05:6e02:214b:b0:349:178b:2818 with SMTP id
 d11-20020a056e02214b00b00349178b2818mr11384129ilv.13.1691498976969; Tue, 08
 Aug 2023 05:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691465503.git.bruce.ashfield@gmail.com> <2023080810431190bf01b5@mail.local>
In-Reply-To: <2023080810431190bf01b5@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 8 Aug 2023 08:49:25 -0400
Message-ID: <CADkTA4MwoZJqy5EUB7ZatFf-7kvXRjXf=5rFRHSwu2tPBmEq5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] linux-yocto: consolidated kernel pull request
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 12:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185661

On Tue, Aug 8, 2023 at 6:43=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Bruce,
>
> While I didn't test this series yet, as discussed, I've tried to switch
> to 6.4 by default. I got this warning:

-tiny was clean here, but let me re-test and see if I've missed
sending something in my 6.4 SRCREV bumps.

Bruce

>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/7876/st=
eps/13/logs/stdio
>
> WARNING: linux-yocto-tiny-6.4.3+gitAUTOINC+dab56f52aa_dee78ad196-r0 do_ke=
rnel_configcheck: [kernel config]: specified values did not make it into th=
e kernel's final configuration:
>     [NOTE]: 'CONFIG_USB_HID' last val (y) and .config val (n) do not matc=
h
>     [INFO]: CONFIG_USB_HID : n
>     [INFO]: raw config text:
>         config USB_HID
>                 tristate "USB HID transport layer"
>                 default y
>                 select HID
>                 depends on USB && INPUT && USB && HID_SUPPORT
>                 help
>                   Say Y here if you want to connect USB keyboards,
>                   mice, joysticks, graphic tablets, or any other HID base=
d devices
>                   to your computer via USB, as well as Uninterruptible Po=
wer Supply
>                   (UPS) and monitor control devices.
>
>                   You can't use this driver and the HIDBP (Boot Protocol)=
 keyboard
>                   and mouse drivers at the same time. More information is=
 available:
>                   <file:Documentation/input/input.rst>.
>
>                   If unsure, say Y.
>
>                   To compile this driver as a module, choose M here: the
>                   module will be called usbhid.
>         Config 'USB_HID' has the following Direct dependencies (USB_HID=
=3Dn):
>                 USB(=3Dy) && INPUT(=3Dy) && HID_SUPPORT(=3Dn)
>         Parent dependencies are:
>              INPUT [y] USB [y] HID_SUPPORT [n]
>     [INFO]: config 'CONFIG_USB_HID' was set, but it wasn't assignable, ch=
eck (parent) dependencies
>
>
> master has 86adbe4db668 ("linux-yocto-tiny/6.4: fix configuration
> warnings (HID)") so I guess there is something missing.
>
>
> On 07/08/2023 23:35:46-0400, Bruce Ashfield wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > Here's my queued set of -stable updates (as well as a -dev kernel bump)=
.
> >
> > I've got another round of updates under test, and will send them when
> > ready.
> >
> > 6.4 marches along, it'll be up to date when those last issues keeping
> > it from being the default are resolved.
> >
> > Bruce
> >
> > The following changes since commit 058a44165ce375f405063e73a9fcd1b2757e=
f8da:
> >
> >   bitbake: fetch2: Check if path is 'None' before calculating checksums=
 (2023-08-04 11:48:26 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://git.yoctoproject.org/poky-contrib zedd/kernel
> >   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kerne=
l
> >
> > Bruce Ashfield (7):
> >   linux-yocto/6.4: fix CONFIG_LEDS_TRIGGER_GPIO kernel audit warning
> >   linux-yocto/6.4: update to v6.4.6
> >   linux-yocto/6.1: update to v6.1.41
> >   linux-yocto/6.4: update to v6.4.7
> >   linux-yocto-dev: bump to v6.5+
> >   linux-yocto/6.4: update to v6.4.8
> >   linux-yocto/6.1: update to v6.1.43
> >
> >  meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 +--
> >  .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
> >  .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
> >  .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
> >  .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
> >  meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
> >  meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
> >  7 files changed, 42 insertions(+), 42 deletions(-)
> >
> > --
> > 2.34.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#185630): https://lists.openembedded.org/g/openembed=
ded-core/message/185630
> > Mute This Topic: https://lists.openembedded.org/mt/100615695/3617179
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

