Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.30870.1589752332026978736
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 May 2020 14:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=FQh1ywTC;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.65, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f65.google.com with SMTP id l3so3829641qvo.7
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 14:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=ILu2lFVzGFMrNt6otCjOm8hYyk+4HVfcfkv5M+k5aRY=;
        b=FQh1ywTCJkxjaQTx633eYkx8KK5hddcHXt+Hy5IG/98c1179vDmyzM2Ow8ivXx+o66
         ogkOXxHZTyMJ2usy4BLag8VHTeAJKI13v6LBgtEiOXgG+7nf8EnFAOn644Z22wawrXM0
         6+nru1AWBHzdhbcFUelge1h27ympIBZXl3kbwr1EeI9URHlFNuy8iFKhFngnTWsLDSml
         iVgUL3KzpAhdSyQJmoebdxZuDErf4X9Jfa9KHxCAZUcgkJxAV9RIcyw9W8HPdIGbz2gl
         WS/Ft4qX7xqNPi2xP1DxN8jexewCyy9TdWQmMPZ0WIl1ftn6fiFhJNQgjbBLqRBK5cGq
         kZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=ILu2lFVzGFMrNt6otCjOm8hYyk+4HVfcfkv5M+k5aRY=;
        b=U+mv0YY3GsY47bR57G33u2pSrpKaJcL8mcimsZXtMaMQQ9I7D/AH9mQStUUoJwFy6k
         BF3Xiua8TZi8uRfXLMEitBeBGrOXZ8aXVx+udIwP6og1itatn2MQse3EK3is0kjI+Opm
         S0DWKQmobq5nYIiWA/4wh8iSn/D95oWjjIvPXVdGlL7gdC08+BhYwpFKvUfgQjpqMAyg
         tOmucu/jCrUYM0gJhBP+VrO8wec5VvywB7FjsrENfhbOJQoe/8+OxKmA22arWPTlG3ap
         SiSeE23+0Hd8/ZKb71stexFM57KalKehn5wVDyNEbrGTKohYtn8wfOuuz/n2vGE0l6Lt
         R6Xg==
X-Gm-Message-State: AOAM530UEK+g9l88MZ398ec+1EwWN7FfO3BUXTHQviW4QHU95y5+lpcX
	KhhYNX/FdGPeHV4t247+H6CQaf6c/LRoxQ==
X-Google-Smtp-Source: ABdhPJx0hYGJACanOVTiqpjoCvgg/7G/neZ7w1i4OTFlMRgYtXr6lpBMcPmn4/aKLjWmdxmO76BSow==
X-Received: by 2002:a0c:8045:: with SMTP id 63mr13401960qva.68.1589752330759;
        Sun, 17 May 2020 14:52:10 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id 88sm7866468qth.9.2020.05.17.14.52.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 May 2020 14:52:10 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f170.google.com with SMTP id s1so8303663qkf.9
        for <openembedded-core@lists.openembedded.org>; Sun, 17 May 2020 14:52:09 -0700 (PDT)
X-Received: by 2002:a37:b1c6:: with SMTP id a189mr13044008qkf.26.1589752329484;
 Sun, 17 May 2020 14:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <VE1PR04MB6621CBC0F321F39DAFEBE548E2A40@VE1PR04MB6621.eurprd04.prod.outlook.com>
 <CAHtQpK43_Ytsw6JnOoPx6xTd9zhQZY6A1OzDhNFXFW57Ttmohg@mail.gmail.com>
 <CAP9ODKpsh=K=-LzUS9O2zsDH3MQt=z6RWjGCJyEZC-AZ8ZNe7g@mail.gmail.com> <CAMKF1src7dw_OOKM2SkV4+-XqO9aqQ-wzxvtQm2ec-Vaav-GKA@mail.gmail.com>
In-Reply-To: <CAMKF1src7dw_OOKM2SkV4+-XqO9aqQ-wzxvtQm2ec-Vaav-GKA@mail.gmail.com>
Date: Sun, 17 May 2020 18:51:58 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqOJ5f2VsWwu6ZoH4Ry2+g-dv3q0DcwcYX1qRo0GQNmdA@mail.gmail.com>
Message-ID: <CAP9ODKqOJ5f2VsWwu6ZoH4Ry2+g-dv3q0DcwcYX1qRo0GQNmdA@mail.gmail.com>
Subject: Re: [OE-core] Cannot disable weston
To: Khem Raj <raj.khem@gmail.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, Tom Hochstein <tom.hochstein@nxp.com>, 
	"Patches and discussions about the oe-core layer (openembedded-core@lists.openembedded.org)" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello Khem,

On Sat, May 16, 2020 at 12:00 PM Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, May 6, 2020 at 1:58 PM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> >
> > Hello all,
> >
> > Adding Khem on Cc.
> >
> > On Wed, May 6, 2020 at 5:42 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > > On Wed, May 6, 2020 at 10:29 PM Tom Hochstein <tom.hochstein@nxp.com> wrote:
> > > >
> > > > We are no longer able to disable weston service with standard `systemctl disable weston@root.service`.
> > >
> > > I've faced similar issues a while back, and also found out that weston
> > > has been actually started twice: once from udev, and once from
> > > systemd. At that time, I removed the udev locally on the EVK and
> > > didn't look further into it.
> > >
> > > > On boot the service is started again. It seems likely this started with the introduction of a starting udev rule:
> > > >
> > > > https://github.com/openembedded/openembedded-core/commit/aa3bced2e1de2f4ba507aa014835b06edccc138a#diff-d92aa97566c1bd0dd1eb817bb4511cda
> > > >
> > > > Is this behaving correctly? Can the rule be made to honor the service disablement?
> > >
> > > Or the other way around: can the systemd service be disabled? Or in
> > > general: is it possible to leave only one of those mechanisms, and
> > > which one is the correct one?
> >
> > Why the udev support was added and why this cannot be done in the service?
> >
>
> udev service integrates well when you have weston but for some reason
> no drm on machine so it only launches
> when system detects graphics/drm
>
> if you need to manually control it then disable the udev rule and it
> will show up disabled always and then can be managed
> manually.

I understand the use case you are intending to cover however:

- we now have two overlapping mechanisms to start the weston service
- we have more than a way to control the weston service

it is confusing and I don't foresee a easy way to disable the udev
service. How do you think it should be done?



--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
